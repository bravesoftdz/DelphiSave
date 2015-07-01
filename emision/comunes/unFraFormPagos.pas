unit unFraFormPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, DateComboBox, StdCtrls, CurrEdit, Mask, PatternEdit,
  IntEdit, VCLExtra, CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql, unSesion,
  Periodos, AnsiSql, SDEngine, unConstEmision, unFuncionesEmision,
  JvExControls, JvComponent, JvLinkLabel, ToolWin, ComCtrls, JvBitmapButton,
  Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion, DB, DBClient,
  General;

type
  TfraFormPagos = class(TFrame)
    lblNotaRelac: TLabel;
    btnBuscarNotaRelac: TSpeedButton;
    btnBuscarManualNotaRelac: TSpeedButton;
    gbDetalle: TGroupBox;
    lbCUIL: TLabel;
    lblMasaSalarial: TLabel;
    lblCondicion: TLabel;
    lblSumTotalEmpleados: TLabel;
    edSumlMasaSalarial: TLabel;
    lblFechaPresentacion: TLabel;
    Label6: TLabel;
    edCUIL: TMaskEdit;
    edMasaSalarialCuil: TCurrencyEdit;
    tbComandosDetalle: TToolBar;
    tbModificar: TToolButton;
    fraCondicion: TfraStaticCodigoDescripcion;
    dbgDetalleCUIL: TRxDBGrid;
    edSumMasaSalarial: TCurrencyEdit;
    edSumTotalEmpleados: TIntEdit;
    edFechaPresentacion: TDateComboBox;
    chkConTicket: TCheckBox;
    Panel3: TPanel;
    cdsTrab: TClientDataSet;
    dsTrab: TDataSource;
    procedure lblNotaRelacClick(Sender: TObject);
    procedure btnBuscarNotaRelacClick(Sender: TObject);
    procedure btnBuscarManualNotaRelacClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure cdsTrabAfterScroll(DataSet: TDataSet);
    procedure chkConTicketClick(Sender: TObject);
    procedure dbgDetalleCUILGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    FIdNotaPeriodoRelacion : integer;
    FTipoRelacion: string; //'A' Automatica 'M' Manual
    FPeriodo: String;
    FContrato: integer;
    procedure GuardarDetalleBorrador(aIdNotaPeriodo: integer);
    procedure ActivarTicket(aActive: boolean);
    procedure CargarDetalle165_170(aIdNotaPeriodo: integer);
    function GetFechaPresDetalle: TDate;
    procedure CargarDetalleBorrador(aIdNotaPeriodo: integer);
  public
    property Periodo: String  read FPeriodo write FPeriodo;
    property Contrato: integer read FContrato write FContrato;
    procedure ActivarControles(aActive: boolean);
    procedure MostrarBotones(aVer: boolean);
    procedure LimpiarControles;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario, aIdNota: integer;
      var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer);
    procedure Init;
  end;


implementation

uses
  unfrmFormularioEmi, unFrmConsultaNotas;

{$R *.dfm}

procedure TfraFormPagos.ActivarControles(
  aActive: boolean);
begin
  LockControls(self, not aActive);
  lblNotaRelac.Enabled := true;
  btnBuscarNotaRelac.Enabled := aActive;
  btnBuscarManualNotaRelac.Enabled := aActive;
  edCUIL.Color := $00F4ECEC;
  edMasaSalarialCuil.Color := $00F4ECEC;
  edSumTotalEmpleados.Color := $00F4ECEC;
  edSumMasaSalarial.Color := $00F4ECEC;
//  gbDetalle.Enabled := aActive;
  if not aActive then cdsTrab.AfterScroll := nil;
  tbComandosDetalle.Enabled := aActive;
  dbgDetalleCUIL.Enabled := true;
end;

procedure TfraFormPagos.LimpiarControles;
begin
  lblNotaRelac.Visible := false;
end;

procedure TfraFormPagos.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
  aPeriodo: string; aIlegible: boolean; aMixto: String);
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

    if (GetFechaPresDetalle > 0) then
      Fields.Add('NP_FECHAPRESENTACION', GetFechaPresDetalle)
    else
      Fields.Add('NP_FECHAPRESENTACION', exNull);

    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);
    Fields.Add('NP_ILEGIBLE', aIlegible);

    //Si no tiene una nota relacionada intento asociarle una
    if not (FIdNotaPeriodoRelacion > 0) then
      btnBuscarNotaRelacClick(nil);

    if (FIdNotaPeriodoRelacion > 0) then
    begin
      Fields.Add('NP_TIPORELACION', FTipoRelacion);
      Fields.Add('NP_IDNOTAPERIODORELACIONADA', FIdNotaPeriodoRelacion);
    end
    else begin
      Fields.Add('NP_TIPORELACION', exNull);
      Fields.Add('NP_IDNOTAPERIODORELACIONADA', exNull);
    end;

    EjecutarSqlST(Sql);

    GuardarDetalleBorrador(aIdNotaPeriodo);

  finally
    free;
  end;

end;

function TfraFormPagos.Validar(aIdFormulario: integer): boolean;
begin
  if not (FIdNotaPeriodoRelacion > 0) then btnBuscarNotaRelacClick(nil);
  Verificar(not (FIdNotaPeriodoRelacion > 0), self, 'No existen formularios anteriores a los que se les haya solicitado el ticket.');
  result := true;
end;

procedure TfraFormPagos.CargarFormulario(
  aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NVL(NP_IDNOTAPERIODORELACIONADA, -1) NOTAPERIODORELACIONADA, NP_TIPORELACION, ' +
                ' EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    FIdNotaPeriodoRelacion := Q.FieldbyName('NOTAPERIODORELACIONADA').AsInteger;
    FTipoRelacion := Q.FieldbyName('NP_TIPORELACION').AsString;
    lblNotaRelac.Visible := (FIdNotaPeriodoRelacion > 0);
    if lblNotaRelac.Visible then
    begin
      MostrarBotones(true);
      lblNotaRelac.Caption := Q.FieldbyName('NOTA').AsString;
    end;

    CargarDetalleBorrador(aIdNotaPeriodo);
  finally
    Q.free;
  end;
end;

procedure TfraFormPagos.SimularEstado(aContrato, aIdNotaPeriodo: integer);
begin
  try
    do_aplicarcaso8(aContrato, aIdNotaPeriodo, true);
  except
    on E: Exception do
    begin
       ErrorMsg(E, 'Error al previsualizar el estado.');
    end;
  end;
end;

procedure TfraFormPagos.lblNotaRelacClick(Sender: TObject);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_ID, NP_IDTIPOFORMULARIO, NP_PERIODO, NP_IDESTADOFORMULARIO, NP_ILEGIBLE ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(FIdNotaPeriodoRelacion));

  with TfrmFormularioEmi.Create(self) do
  try
    CargarFormulario(Q.FieldByName('NP_IDTIPOFORMULARIO').AsInteger,
                     Q.FieldByName('NP_ID').AsInteger,
                     Q.FieldByName('NP_PERIODO').AsString, true,
                     Q.FieldByName('NP_IDESTADOFORMULARIO').AsInteger,
                     (Q.FieldByName('NP_ILEGIBLE').AsString = 'S'));
    ShowModal;
  finally
    Q.Free;
    Free;
  end;
end;

procedure TfraFormPagos.MostrarBotones(aVer: boolean);
begin
  btnBuscarNotaRelac.Visible := aVer;
  btnBuscarManualNotaRelac.Visible := aVer;
  if not aVer then
  begin
    lblNotaRelac.Visible := false;
    FIdNotaPeriodoRelacion := -1;
    FTipoRelacion := '';
  end;
end;

procedure TfraFormPagos.btnBuscarNotaRelacClick(
  Sender: TObject);
var
  IdNotaPeriodoRelacion: integer;
begin
  IdNotaPeriodoRelacion :=  get_idnotaperiodosinticket(FContrato, FPeriodo);
  if (IdNotaPeriodoRelacion > 0) then
  begin
    lblNotaRelac.Visible := true;
    if lblNotaRelac.Visible then
    begin
      cdsTrab.EmptyDataSet;
      lblNotaRelac.Caption := ValorSql('SELECT EMI.NOTAS.GET_NOTARELACIONADA( ' + SqlValue(IdNotaPeriodoRelacion)
                                                                                + ' ) FROM DUAL ');

//      if ((get_tipoformulario(IdNotaPeriodoRelacion) = TF_165) or (get_tipoformulario(IdNotaPeriodoRelacion) = TF_170)) then
      if (get_tipoformulario(IdNotaPeriodoRelacion) in [TF_165, TF_170, TF_RPMonotributistasSolamente, TF_ConstanciaMonotributista]) then
      begin
        gbDetalle.Enabled := true;
        chkConTicket.Enabled := true;
        edFechaPresentacion.Enabled := true;
        CargarDetalle165_170(IdNotaPeriodoRelacion);
        cdsTrabAfterScroll(nil)
      end
      else begin
        gbDetalle.Enabled := false;
        chkConTicket.Enabled := false;
        edFechaPresentacion.Enabled := false;
      end;

      FIdNotaPeriodoRelacion := IdNotaPeriodoRelacion;
      FTipoRelacion := 'A';
    end;
  end
  else begin
    LockControls(gbDetalle, true);
    lblNotaRelac.Visible := false;
    FIdNotaPeriodoRelacion := -1;
    FTipoRelacion := '';
  end;
end;

procedure TfraFormPagos.btnBuscarManualNotaRelacClick(
  Sender: TObject);
begin
  with TfrmConsultaNotas.create(self) do
  try
    FormStyle := fsNormal;
    WindowState := wsNormal;
    Hide;
    FiltrarNotas(FContrato, [TF_931, TF_900,
                             TF_905, TF_926,
                             TF_924, TF_902,
                             TF_ResumComplement924_902,
                             TF_921, TF_170, TF_165], FPeriodo, ESTADO_NOTA_APLICADA,
                             [sin_ticket_ni_ddjj_poster, sin_ticket_existe_ddjj_poster,
                             trab_sin_ticket_ni_ddjj_poster, trab_sin_ticket_exist_ddjj_pos]);
    if (ShowModal = mrOk) and (IdNota > 0) then
    begin
      cdsTrab.EmptyDataSet;
      FIdNotaPeriodoRelacion := get_idnotaperiodo(IdNota, FPeriodo);
      lblNotaRelac.Visible := true;
      lblNotaRelac.Caption := ValorSql('SELECT EMI.NOTAS.GET_NOTARELACIONADA( ' + SqlValue(FIdNotaPeriodoRelacion)
                                                                                + ' ) FROM DUAL ');

//      if ((get_tipoformulario(FIdNotaPeriodoRelacion) = TF_165) or (get_tipoformulario(FIdNotaPeriodoRelacion) = TF_170)) then
      if (get_tipoformulario(FIdNotaPeriodoRelacion) in [TF_165, TF_170, TF_RPMonotributistasSolamente, TF_ConstanciaMonotributista]) then
      begin
        gbDetalle.Enabled := true;
        chkConTicket.Enabled := true;
        edFechaPresentacion.Enabled := true;
        CargarDetalle165_170(FIdNotaPeriodoRelacion);
        cdsTrabAfterScroll(nil)
      end
      else begin
        gbDetalle.Enabled := false;
        chkConTicket.Enabled := false;
        edFechaPresentacion.Enabled := false;
      end;

      FTipoRelacion := 'M';
    end;
  finally
    free;
  end;
end;

procedure TfraFormPagos.GuardarDetalleBorrador(aIdNotaPeriodo: integer);
begin
  EjecutarSqlST(' DELETE FROM EMI.INT_NOTATRABAJADORPERIODO ' +
                ' WHERE NT_IDNOTACONTRATOPERIODO = ' + SqlValue(aIdNotaPeriodo));
  cdsTrab.First;
  while not cdsTrab.Eof do
  begin
    EjecutarSqlST(' INSERT INTO EMI.INT_NOTATRABAJADORPERIODO ' +
                  ' VALUES (EMI.SEQ_INT_ID.NEXTVAL, ' + SqlValue(aIdNotaPeriodo) + ', ' +
                    SqlValue(cdsTrab.FieldByName('CUIL').AsString) + ', ' +
                    SqlNumber(cdsTrab.FieldByName('MasaSalarial').AsFloat) + ', ' +
                    SqlValue(cdsTrab.FieldByName('idCondicion').AsInteger) + ', ' +
                    SqlValue(cdsTrab.FieldByName('ConTicket').AsString) + ', ' +
                    iif(cdsTrab.FieldByName('FechaPresentacion').IsNull, 'NULL',
                    SqlDate(cdsTrab.FieldByName('FechaPresentacion').AsDateTime)) + ')' );
    cdsTrab.Next;
  end;
end;

procedure TfraFormPagos.tbModificarClick(Sender: TObject);
var
  FechaIngresada: TDate;
  bc : Tbookmark;
begin
  cdsTrab.AfterScroll := nil;
  bc := dbgDetalleCUIL.DataSource.DataSet.GetBookmark;
  FechaIngresada := GetFechaPresDetalle;
  try
    dbgDetalleCUIL.DataSource.DataSet.GotoBookmark(bc);
    dbgDetalleCUIL.DataSource.DataSet.FreeBookmark(bc);
  except
  end;

  cdsTrab.AfterScroll := cdsTrabAfterScroll;

  Verificar((edFechaPresentacion.Date <> 0)
              and (FechaIngresada <> 0)
              and (FechaIngresada <> edFechaPresentacion.Date),
              edFechaPresentacion, 'No se puede ingresar una fecha distinta a las ya ingresadas.');

  with cdsTrab do
  begin
    Edit;
    if chkConTicket.Checked then
    begin
      FieldByName('ConTicket').AsString := 'S';
      FieldByName('FechaPresentacion').AsDateTime := edFechaPresentacion.Date;
    end
    else begin
      FieldByName('ConTicket').AsString := 'N';
      FieldByName('FechaPresentacion').Value := null;
    end;
    UpdateRecord;
  end;
end;

procedure TfraFormPagos.cdsTrabAfterScroll(DataSet: TDataSet);
begin
  with cdsTrab do
  begin
    edCUIL.Text := FieldByName('Cuil').AsString;
    edMasaSalarialCuil.Value := FieldByName('MasaSalarial').AsFloat;
    fraCondicion.cmbDescripcion.Text := FieldByName('Condicion').AsString;
    fraCondicion.Value := FieldByName('IdCondicion').AsInteger;
    chkConTicket.Checked := (FieldByName('ConTicket').AsString = 'S');
    edFechaPresentacion.Date := FieldByName('FechaPresentacion').AsDateTime;
    if FieldByName('SoloLectura').AsBoolean then
    begin
      chkConTicket.Enabled := false;
      edFechaPresentacion.Enabled := false;
      tbComandosDetalle.Enabled := false;
    end
    else begin
      chkConTicket.Enabled := true;
      edFechaPresentacion.Enabled := true;
      tbComandosDetalle.Enabled := true;
      ActivarTicket(chkConTicket.Enabled);
    end;
  end;
end;

procedure TfraFormPagos.Init;
begin
  with fraCondicion do
  begin
    TableName   := 'EMI.ICO_CONDICION';
    FieldID     := 'CO_ID';
    FieldCodigo := 'CO_CODIGO';
    FieldDesc   := 'CO_DESCRIPCION';
    FieldBaja   := 'CO_FECHABAJA';
    ShowBajas   := False;
  end;

  cdsTrab.CreateDataSet;
  cdsTrab.EmptyDataSet;
end;

procedure TfraFormPagos.ActivarTicket(aActive: boolean);
begin
  if aActive and not chkConTicket.Checked then
  begin
    edFechaPresentacion.Clear;
  end;
  LockControls(edFechaPresentacion, not aActive or not chkConTicket.Checked);
end;

procedure TfraFormPagos.chkConTicketClick(Sender: TObject);
begin
  ActivarTicket(chkConTicket.Enabled);
end;

procedure TfraFormPagos.CargarDetalle165_170(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT * ' +
                ' FROM EMI.INT_NOTATRABAJADORPERIODO, EMI.ICO_CONDICION ' +
                ' WHERE NT_IDCONDICION = CO_ID AND NT_IDNOTACONTRATOPERIODO = ' +
                ' emi.notas.get_detalle_165_170(' + SqlValue(aIdNotaPeriodo) + ')');
  try
    while not Q.Eof do
    begin
      cdsTrab.Append;
      cdsTrab.FieldByName('Cuil').AsString := Q.FieldbyName('NT_CUIL').AsString;
      cdsTrab.FieldByName('MasaSalarial').AsFloat := Q.FieldbyName('NT_MASASALARIAL').AsFloat;
      cdsTrab.FieldByName('Condicion').AsString := Q.FieldbyName('CO_DESCRIPCION').AsString;
      cdsTrab.FieldByName('IdCondicion').AsInteger := Q.FieldbyName('NT_IDCONDICION').AsInteger;
      cdsTrab.FieldByName('ConTicket').AsString := Q.FieldbyName('NT_CONTICKET').AsString;
//      if not Q.FieldbyName('NT_CONTICKET').IsNull then
      cdsTrab.FieldByName('FechaPresentacion').Value := Q.FieldbyName('NT_FECHAPRESENTACION').Value;
      cdsTrab.FieldByName('SoloLectura').AsBoolean := (cdsTrab.FieldByName('ConTicket').AsString = 'S');
      cdsTrab.Post;
      edSumTotalEmpleados.Value := edSumTotalEmpleados.Value + 1;
      edSumMasaSalarial.Value := edSumMasaSalarial.Value + Q.FieldbyName('NT_MASASALARIAL').AsFloat;
      Q.Next;
    end;
  finally
    Q.free;
    cdsTrab.First
  end;
end;

function TfraFormPagos.GetFechaPresDetalle: TDate;
begin
  cdsTrab.DisableControls;
  try
    cdsTrab.First;
    while not cdsTrab.Eof do
    begin
      if not cdsTrab.FieldByName('FechaPresentacion').IsNull then
        break;
      cdsTrab.Next;
    end;

    if not cdsTrab.Eof then
      result := cdsTrab.FieldByName('FechaPresentacion').AsDateTime
    else
      result := 0;
  finally
    cdsTrab.EnableControls;
  end;
end;

procedure TfraFormPagos.CargarDetalleBorrador(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NT_CUIL, NT_MASASALARIAL, CO_DESCRIPCION, NT_IDCONDICION, NT_CONTICKET, NT_FECHAPRESENTACION, ' +
                ' NVL((SELECT ''S'' ' +
                '      FROM EMI.INT_NOTATRABAJADORPERIODO INT2 ' +
                '      WHERE INT2.NT_IDNOTACONTRATOPERIODO = ' +  SqlValue(FIdNotaPeriodoRelacion)  +
                '      AND INT2.NT_CONTICKET = ''S'' ' +
                '      AND INT2.NT_CUIL = INT1.NT_CUIL), ''N'') SoloLectura ' +
                ' FROM EMI.INT_NOTATRABAJADORPERIODO INT1, EMI.ICO_CONDICION ' +
                ' WHERE NT_IDCONDICION = CO_ID AND NT_IDNOTACONTRATOPERIODO = ' + SqlValue(aIdNotaPeriodo));

  try
    while not Q.Eof do
    begin
      cdsTrab.Append;
      cdsTrab.FieldByName('Cuil').AsString := Q.FieldbyName('NT_CUIL').AsString;
      cdsTrab.FieldByName('MasaSalarial').AsFloat := Q.FieldbyName('NT_MASASALARIAL').AsFloat;
      cdsTrab.FieldByName('Condicion').AsString := Q.FieldbyName('CO_DESCRIPCION').AsString;
      cdsTrab.FieldByName('IdCondicion').AsInteger := Q.FieldbyName('NT_IDCONDICION').AsInteger;
      cdsTrab.FieldByName('ConTicket').AsString := Q.FieldbyName('NT_CONTICKET').AsString;
//      if not Q.FieldbyName('NT_CONTICKET').IsNull then
      cdsTrab.FieldByName('FechaPresentacion').Value := Q.FieldbyName('NT_FECHAPRESENTACION').Value;

      cdsTrab.FieldByName('SoloLectura').AsBoolean := (Q.FieldbyName('SoloLectura').AsString = 'S');

      cdsTrab.Post;
      edSumTotalEmpleados.Value := edSumTotalEmpleados.Value + 1;
      edSumMasaSalarial.Value := edSumMasaSalarial.Value + Q.FieldbyName('NT_MASASALARIAL').AsFloat;
      Q.Next;
    end;
  finally
    Q.free;
    cdsTrab.First;
  end;
end;

procedure TfraFormPagos.dbgDetalleCUILGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if cdsTrab.FieldByName('ConTicket').AsString = 'N' then
  begin
    Background := $00C6FFC6;
    if Highlight then AFont.Color := clBlack;
  end;
end;

end.
