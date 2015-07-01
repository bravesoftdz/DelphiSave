unit unFraFormNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, VCLExtra, CustomDlgs, Cuit, Grids, DBGrids, ComCtrls,
  ToolWin, ToolEdit, CurrEdit, Mask, PatternEdit, IntEdit, DateComboBox,
  unDmPrincipal, SqlFuncs, DBSql, unSesion, Periodos, AnsiSql, SDEngine,
  unConstEmision, DB, JvgGroupBox, ExtCtrls, FormPanel, DBClient, RXDBCtrl,
  ArtComboBox, ArtDBGrid, DBCtrls, unFuncionesEmision, General, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unfraCodigoDescripcionExt,
  JvExComCtrls, JvComCtrls;

type
  TfraFormNota = class(TFrame)
    Nota: TLabel;
    edNota: TMemo;
    tbComandosNota: TToolBar;
    btnEliminarRta: TToolButton;
    dbgDetalleRespuesta: TRxDBGrid;
    tbNuevaRta: TToolButton;
    Label1: TLabel;
    fpAltaRespuesta: TFormPanel;
    Bevel5: TBevel;
    btnCancelar: TButton;
    gbRespuesta: TJvgGroupBox;
    edRespuestaAlta: TMemo;
    dsRespuestas: TDataSource;
    cdsRespuestas: TClientDataSet;
    btnAceptar: TButton;
    edRespuesta: TDBMemo;
    pcNota: TJvPageControl;
    tbNotaActual: TTabSheet;
    lblEmpleados: TLabel;
    lblMasaSalarial: TLabel;
    lblFechaPresentacion: TLabel;
    edEmpleados: TIntEdit;
    edMasaSalarial: TCurrencyEdit;
    edFechaPresentacion: TDateComboBox;
    tbNotaHistorica: TTabSheet;
    lblTipoFormularioMultiperiodo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fraTipoFormulario: TfraCodigoDescripcionExt;
    edEstadoHist: TEdit;
    edDerivado: TEdit;
    Label4: TLabel;
    fraTipoNomina: TfraCodigoDescripcionExt;
    procedure tbNuevaRtaClick(Sender: TObject);
    procedure btnEliminarRtaClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    FContrato: integer;
    FConservarFechaPres: boolean;
    function GetEmpleados: integer;
    function GetMasaSalarial: Currency;
    function GetTexto: String;
    function GetFechaPresentacion: TDate;
    procedure CargarDetalleBorrador(aIdNotaPeriodo: integer);
    procedure GuardarDetalleBorrador(aIdNotaPeriodo: integer);
    function GetTipoNomina: integer;
  public
    property Empleados: integer read GetEmpleados;
    property MasaSalarial: Currency	read GetMasaSalarial;
    property Texto: String read GetTexto;
    property FechaPresentacion: TDate read GetFechaPresentacion;
    property Contrato: integer read FContrato write FContrato;
    property ConservarFechaPres: boolean read FConservarFechaPres write FConservarFechaPres;
    property TipoNomina: integer read GetTipoNomina;

    procedure ActivarControles(aActive: boolean);
    procedure LimpiarControles;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario, aIdNota: integer; var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure Init;
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer);
  end;

implementation

{$R *.dfm}

procedure TfraFormNota.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
  edRespuesta.Color := $00F4ECEC;
  dbgDetalleRespuesta.Enabled := true;
  tbComandosNota.Enabled := aActive;
end;

function TfraFormNota.GetEmpleados: integer;
begin
  result := edEmpleados.Value;
end;

function TfraFormNota.GetFechaPresentacion: TDate;
begin
  result := edFechaPresentacion.Date;
end;

function TfraFormNota.GetMasaSalarial: Currency;
begin
  result := edMasaSalarial.Value;
end;

function TfraFormNota.GetTexto: String;
begin
  result := edNota.Text;
end;

procedure TfraFormNota.LimpiarControles;
begin
  edEmpleados.Clear;
  edMasaSalarial.Clear;
  fraTipoNomina.Value := 4;
  if not FConservarFechaPres then
    edFechaPresentacion.Clear;
  edNota.Clear;
end;

procedure TfraFormNota.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer; aPeriodo: string; aIlegible: boolean; aMixto: String);
begin

  aIdNotaPeriodo := ValorSqlInteger(' SELECT NP_ID ' +
                                    ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                                    ' WHERE NP_IDNOTA = ' + SqlValue(aIdNota) +
                                      iif(aPeriodo = '', ' AND NP_PERIODO IS NULL ', ' AND NP_PERIODO = ' + SqlValue(aPeriodo)) +
                                    ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(aIdFormulario) +
                                    ' AND NP_FORMULARIOMIXTO = ' + SqlValue(aMixto), -1);//aIdNotaPeriodo);

  with TSql.Create do
  try
    TableName := 'EMI.INP_NOTACONTRATOPERIODO';
    Fields.Add('NP_PERIODO', aPeriodo);
    Fields.Add('NP_IDNOTA', aIdNota);
    Fields.Add('NP_IDTIPOFORMULARIO', aIdFormulario);

    if (aIdNotaPeriodo = -1) then
    begin
      SqlType := stInsert;
      aIdNotaPeriodo := GetSecNextVal('emi.seq_inp_id');
      PrimaryKey.Add('NP_ID', aIdNotaPeriodo);
      Fields.Add('NP_FECHAALTA', exDateTime);
      Fields.Add('NP_USUALTA', Sesion.LoginName);
    end
    else begin
      SqlType := stUpdate;
      PrimaryKey.Add('NP_ID', aIdNotaPeriodo);
      Fields.Add('NP_FECHAMODIF', exDateTime);
      Fields.Add('NP_USUMODIF', Sesion.LoginName);
      Fields.Add('NP_FECHABAJA', exNull);
      Fields.Add('NP_USUBAJA', exNull);
    end;

    if FechaPresentacion > 0 then
    begin
      Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion);
      Fields.Add('NP_TOTALEMPLEADOS', Empleados);
      Fields.AddExtended('NP_TOTALMASASALARIAL', MasaSalarial);
    end
    else begin
      Fields.Add('NP_FECHAPRESENTACION', exNull);
      Fields.Add('NP_TOTALEMPLEADOS', exNull);
      Fields.AddExtended('NP_TOTALMASASALARIAL', exNull);
    end;

    Fields.Add('NP_TEXTONOTA', Texto);
    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);
    Fields.Add('NP_ILEGIBLE', aIlegible);
    Fields.Add('NP_IDTIPONOMINA', fraTipoNomina.Value);

    EjecutarSqlST(Sql);
    GuardarDetalleBorrador(aIdNotaPeriodo);
  finally
    free;
  end;

end;

function TfraFormNota.Validar(aIdFormulario: integer): boolean;
begin
(*
  Verificar(edEmpleados.IsEmpty
            and (edMasaSalarial.Value = 0)
            and edFechaPresentacion.IsEmpty
            and (trim(edNota.Text) = ''), edNota, 'Debe ingresar algún dato de la nota.');
*)
  Verificar(edFechaPresentacion.IsEmpty, edFechaPresentacion, 'Debe ingresar la Fecha de presentación.');
  Verificar((not edFechaPresentacion.IsEmpty) and (edFechaPresentacion.Date > DBDate), edFechaPresentacion, 'La Fecha de presentación no puede ser futura.');
  Verificar(not fraTipoNomina.IsSelected, fraTipoNomina.cmbDescripcion, 'Debe ingresar el Tipo de Nómina.');
  result := true;
end;

procedure TfraFormNota.CargarFormulario(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_TOTALEMPLEADOS, NP_TOTALMASASALARIAL, ' +
                ' NP_FECHAPRESENTACION, NP_TEXTONOTA, NP_IDTIPONOMINA, ' +
                ' NP_ESTADOHISTORICO, NP_DERIVADOHISTORICO, NP_IDTIPOFORMULARIOHIST ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    if Q.FieldByName('NP_IDTIPOFORMULARIOHIST').IsNull then
    begin
      pcNota.ActivePageIndex := 0;
      edEmpleados.Value := Q.FieldbyName('NP_TOTALEMPLEADOS').AsInteger;
      edMasaSalarial.Value := Q.FieldbyName('NP_TOTALMASASALARIAL').AsFloat;
      edFechaPresentacion.Date := Q.FieldbyName('NP_FECHAPRESENTACION').AsDateTime;
      fraTipoNomina.Value := Q.FieldbyName('NP_IDTIPONOMINA').AsInteger;
    end
    else begin
      pcNota.ActivePageIndex := 1;
      fraTipoFormulario.Value := Q.FieldByName('NP_IDTIPOFORMULARIOHIST').AsInteger;
      edEstadoHist.Text := Q.FieldbyName('NP_ESTADOHISTORICO').AsString;
      edDerivado.Text := Q.FieldbyName('NP_DERIVADOHISTORICO').AsString;
    end;
    edNota.Text := Q.FieldbyName('NP_TEXTONOTA').AsString;
    CargarDetalleBorrador(aIdNotaPeriodo);
  finally
    Q.free;
  end;
end;

procedure TfraFormNota.CargarDetalleBorrador(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT * ' +
                ' FROM EMI.IRN_RESPUESTANOTA ' +
                ' WHERE RN_IDNOTACONTRATOPERIODO = ' + SqlValue(aIdNotaPeriodo));
  try
    while not Q.Eof do
    begin
      cdsRespuestas.Append;
      cdsRespuestas.FieldByName('Fecha').AsDateTime := Q.FieldbyName('RN_FECHAALTA').AsDateTime;
      cdsRespuestas.FieldByName('Usuario').AsString := Q.FieldbyName('RN_USUARIOALTA').AsString;
      cdsRespuestas.FieldByName('Respuesta').AsString := Q.FieldbyName('RN_TEXTORESPUESTA').AsString;
      cdsRespuestas.FieldByName('Id').AsInteger := Q.FieldbyName('RN_ID').AsInteger;
      cdsRespuestas.Post;
      Q.Next;
    end;
  finally
    Q.free;
  end;
end;

procedure TfraFormNota.tbNuevaRtaClick(Sender: TObject);
begin
  edRespuestaAlta.Clear;
  if (fpAltaRespuesta.ShowModal = mrOk) then
  begin
    with cdsRespuestas do
    begin
      Append;
      FieldByName('Respuesta').AsString := edRespuestaAlta.Text;
      FieldByName('Usuario').AsString := Sesion.LoginName;
      FieldByName('Fecha').AsDateTime := DBDateTime;
      FieldByName('Id').Value := Null;
      Post;
    end;
  end;
end;

procedure TfraFormNota.Init;
begin
  with fraTipoFormulario do
  begin
    TableName   := 'EMI.ITF_TIPOFORMULARIO';
    FieldID     := 'TF_ID';
    FieldCodigo := 'TF_ID';
    FieldDesc   := 'TF_DESCRIPCION';
    FieldBaja   := 'TF_FECHABAJA';
    ShowBajas   := true;
    AutoExit    := False;
  end;

  with fraTipoNomina  do
  begin
    TableName   := 'EMI.ITN_TIPONOMINA';
    FieldID     := 'TN_ID';
    FieldCodigo := 'TN_ID';
    FieldDesc   := 'TN_DESCRIPCION';
    FieldBaja   := 'TN_FECHABAJA';
    ShowBajas   := False;
  end;

  pcNota.HideAllTabs := true;

  cdsRespuestas.CreateDataSet;
  cdsRespuestas.EmptyDataSet;
end;

procedure TfraFormNota.GuardarDetalleBorrador(aIdNotaPeriodo: integer);
begin
  cdsRespuestas.First;
  while not cdsRespuestas.Eof do
  begin
    if cdsRespuestas.fieldbyname('Id').IsNull then
      EjecutarSqlST(' INSERT INTO EMI.IRN_RESPUESTANOTA ' +
                    ' VALUES (EMI.SEQ_IRO_ID.NEXTVAL, ' +
                      SqlValue(cdsRespuestas.FieldByName('Respuesta').AsString) + ', ' +
                      SqlValue(aIdNotaPeriodo) + ', ' +
                      SqlValue(cdsRespuestas.FieldByName('Usuario').AsString) + ', ' +
                      SqlDateTime(cdsRespuestas.FieldByName('Fecha').AsDateTime) + ')' );
    cdsRespuestas.Next;
  end;
end;

procedure TfraFormNota.btnEliminarRtaClick(Sender: TObject);
begin
  if cdsRespuestas.Active and not cdsRespuestas.IsEmpty then
  begin
    if not cdsRespuestas.fieldbyname('Id').IsNull then
      EjecutarSqlST(' DELETE EMI.IRN_RESPUESTANOTA ' +
                    ' WHERE RN_ID = ' + SqlValue(cdsRespuestas.FieldbyName('Id').AsInteger));
    cdsRespuestas.Delete;
  end;
end;

procedure TfraFormNota.btnAceptarClick(Sender: TObject);
begin
  Verificar(trim(edRespuestaAlta.text) = '', edRespuestaAlta, 'Debe ingresar una respuesta.');
  fpAltaRespuesta.ModalResult := mrOk;
end;

procedure TfraFormNota.SimularEstado(aContrato, aIdNotaPeriodo: integer);
begin
  try
    do_aplicarcaso6(aContrato, aIdNotaPeriodo, true);
  except
    on E: Exception do
    begin
       ErrorMsg(E, 'Error al previsualizar el estado.');
    end;
  end;
end;

function TfraFormNota.GetTipoNomina: integer;
begin
  Result := fraTipoNomina.Value;
end;

end.
