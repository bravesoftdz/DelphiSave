unit unFraForm165_170;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, ComCtrls, ToolWin, Mask, StdCtrls,
  ToolEdit, DateComboBox, CurrEdit, PatternEdit, IntEdit, VCLExtra, CustomDlgs,
  Cuit, unDmPrincipal, SqlFuncs, DBSql, unSesion, Periodos, AnsiSql, SDEngine,
  unConstEmision, unFuncionesEmision, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ExtCtrls, General, ActnList;

type
  TfraForm165_170 = class(TFrame)
    lblTotalEmpleados: TLabel;
    edTotalEmpleados: TIntEdit;
    lblTotalMasaSalarial: TLabel;
    edTotalMasaSalarial: TCurrencyEdit;
    lblInscripcion: TLabel;
    cbInscripcion: TComboBox;
    gbDetalle: TGroupBox;
    lbCUIL: TLabel;
    lblMasaSalarial: TLabel;
    lblCondicion: TLabel;
    lblSumTotalEmpleados: TLabel;
    edSumlMasaSalarial: TLabel;
    edCUIL: TMaskEdit;
    edMasaSalarialCuil: TCurrencyEdit;
    tbComandosDetalle: TToolBar;
    tbAddCuil: TToolButton;
    tbDeleteCuil: TToolButton;
    tbLimpiarCuil: TToolButton;
    fraCondicion: TfraStaticCodigoDescripcion;
    dbgDetalleCUIL: TRxDBGrid;
    edSumMasaSalarial: TCurrencyEdit;
    cdsTrab: TClientDataSet;
    dsTrab: TDataSource;
    edSumTotalEmpleados: TIntEdit;
    lblFechaPresentacion: TLabel;
    edFechaPresentacion: TDateComboBox;
    chkConResumen: TCheckBox;
    chkConTicket: TCheckBox;
    Panel3: TPanel;
    Label6: TLabel;
    ActionList: TActionList;
    acNew: TAction;
    acDelete: TAction;
    acClear: TAction;
    procedure cbInscripcionChange(Sender: TObject);
    procedure tbAddCuilClick(Sender: TObject);
    procedure tbDeleteCuilClick(Sender: TObject);
    procedure tbLimpiarCuilClick(Sender: TObject);
    procedure chkConResumenClick(Sender: TObject);
    procedure dbgDetalleCUILGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure chkConTicketClick(Sender: TObject);
  private
    FContrato: integer;
    FConservarFechaPres: boolean;
    function GetFechaPresentacion: TDate;
    function GetTotalEmpleados: integer;
    function GetTotalMasaSalarial: Extended;
    function GetDetalleTrabajadores: TClientDataSet;
    function GetInscripcion: integer;
    procedure GuardarDetalleBorrador(aIdNotaPeriodo: integer);
    procedure CargarDetalleBorrador(aIdNotaPeriodo: integer);
    function GetConResumen: boolean;
    procedure ActivarTicket(aActive: boolean);
  public
    property TotalEmpleados: integer read GetTotalEmpleados;
    property TotalMasaSalarial: Extended read GetTotalMasaSalarial;
    property FechaPresentacion: TDate read GetFechaPresentacion;
    property Inscripcion: integer read GetInscripcion;
    property DetalleTrabajadores: TClientDataSet read GetDetalleTrabajadores;
    property ConResumen: boolean read GetConResumen;
    property Contrato: integer read FContrato write FContrato;
    property ConservarFechaPres: boolean read FConservarFechaPres write FConservarFechaPres;
    procedure ActivarDetalle(aActive: boolean);
    procedure ActivarControles(aActive: boolean);
    procedure LimpiarControles;
    procedure Init;
    procedure ActivarResumen(aActive: boolean);
    function Validar(aIdFormulario: integer): boolean;
    function IsEmpty: boolean;
    function GetFechaPresDetalle: TDate;
    procedure GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
      aPeriodo: string; aIlegible: boolean; aMixto: String = 'N'; aIdNotaPeriodoRelacion: integer = -1; aTipoRelacion: string = '');
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer);
  end;

implementation

{$R *.dfm}

procedure TfraForm165_170.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
  ActivarDetalle(aActive);
  ActivarResumen(aActive);
  ActivarTicket(aActive);
//  ActivarDetalle(aActive and (cbInscripcion.ItemIndex = 0) or (cbInscripcion.ItemIndex = 1));
end;

procedure TfraForm165_170.LimpiarControles;
begin
  edTotalEmpleados.Clear;
  edTotalMasaSalarial.Clear;
  if not FConservarFechaPres then
    edFechaPresentacion.Clear;
  cbInscripcion.itemindex := -1;
  edCUIL.Clear;
  edMasaSalarialCuil.Clear;
  fraCondicion.Clear;
  edSumTotalEmpleados.Value := 0;
  edSumMasaSalarial.Clear;
  cdsTrab.EmptyDataSet;
end;

procedure TfraForm165_170.tbAddCuilClick(Sender: TObject);
var
  FechaIngresada: TDate;
begin
    Verificar(trim(edCUIL.Text) = '', edCUIL, 'Debe ingresar un Cuil.');
    Verificar(not IsCuil(edCUIL.Text), edCUIL, 'Debe ingresar un Cuil válido.');
    Verificar(edMasaSalarialCuil.Value = 0, edMasaSalarialCuil, 'Debe ingresar la Masa Salarial.');
    Verificar(not fraCondicion.IsSelected, fraCondicion, 'Debe ingresar una condición.');
    Verificar(chkConTicket.Checked and edFechaPresentacion.IsEmpty, edFechaPresentacion, 'Debe ingresar la fecha de presentación.');
    FechaIngresada := GetFechaPresDetalle;
    Verificar((edFechaPresentacion.Date <> 0)
                and (FechaIngresada <> 0)
                and (FechaIngresada <> edFechaPresentacion.Date),
                edFechaPresentacion, 'No se puede ingresar una fecha distinta a las ya ingresadas.');

    try
      with cdsTrab do
      begin
        Append;
        FieldByName('Cuil').AsString := edCUIL.Text;
        FieldByName('MasaSalarial').AsFloat := edMasaSalarialCuil.Value;
        FieldByName('Condicion').AsString := fraCondicion.cmbDescripcion.Text;
        FieldByName('IdCondicion').AsInteger := fraCondicion.Value;
        if chkConTicket.Checked then
        begin
          FieldByName('ConTicket').AsString := 'S';
          FieldByName('FechaPresentacion').AsDateTime := edFechaPresentacion.Date;
        end
        else begin
          FieldByName('ConTicket').AsString := 'N';
          FieldByName('FechaPresentacion').Value := null;
        end;
        Post;
      end;
    except
      on e: Exception do
      begin
        cdsTrab.Cancel;
        if (e is EDBClient) and (EDBClient(e).ErrorCode = 9729) then
          InfoHint(edCUIL, 'El Cuil ya está cargado.', true)
        else
          Exit;
      end;
    end;

    edSumTotalEmpleados.Value := edSumTotalEmpleados.Value + 1;
    edSumMasaSalarial.Value := edSumMasaSalarial.Value + edMasaSalarialCuil.Value;

    edCUIL.Clear;
    edMasaSalarialCuil.Clear;
    edCUIL.SetFocus;
end;

procedure TfraForm165_170.tbLimpiarCuilClick(Sender: TObject);
begin
  edCUIL.Clear;
  edMasaSalarialCuil.Clear;
  fraCondicion.Clear;
end;

procedure TfraForm165_170.tbDeleteCuilClick(Sender: TObject);
begin
  if not cdsTrab.IsEmpty and (dbgDetalleCUIL.SelectedIndex > -1) then
  begin
    edSumTotalEmpleados.Value := edSumTotalEmpleados.Value - 1;
    edSumMasaSalarial.Value := edSumMasaSalarial.Value - cdsTrab.fieldbyname('MasaSalarial').AsFloat;
    cdsTrab.Delete;
  end;
end;

procedure TfraForm165_170.ActivarDetalle(aActive: boolean);
begin
  LockControls(gbDetalle, not aActive);
  tbComandosDetalle.Enabled := aActive;
  edSumTotalEmpleados.Enabled := False;
  edSumMasaSalarial.Enabled := False;
  edSumTotalEmpleados.Readonly := True;
  edSumMasaSalarial.Readonly := True;
  edSumTotalEmpleados.Color := $00F4ECEC;
  edSumMasaSalarial.Color := $00F4ECEC;

(*
  if not aActive then
  begin
    edCUIL.Clear;
    edMasaSalarialCuil.Clear;
    fraCondicion.Clear;
    edSumTotalEmpleados.Value := 0;
    edSumMasaSalarial.Clear;
    cdsTrab.EmptyDataSet;
  end;
*)
end;

procedure TfraForm165_170.cbInscripcionChange(Sender: TObject);
begin
//  ActivarDetalle(cbInscripcion.Enabled and (cbInscripcion.ItemIndex = 0) or (cbInscripcion.ItemIndex = 1));
end;

procedure TfraForm165_170.Init;
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

  cbInscripcion.Clear;
  cbInscripcion.AddItem('Monotributista', TObject(INSCRIPCION_MONOTRIBUTISTA));
  cbInscripcion.AddItem('Indeterminado', TObject(INSCRIPCION_INDETERMINADO));
  cbInscripcion.AddItem('Suss', TObject(INSCRIPCION_SUSS));


  cdsTrab.CreateDataSet;
  cdsTrab.EmptyDataSet;
end;

function TfraForm165_170.Validar(aIdFormulario: integer): boolean;
begin
//  Verificar((edTotalEmpleados.Value = 0), edTotalEmpleados, 'Debe ingresar el total de empleados.');
//  Verificar((edTotalMasaSalarial.Value = 0), edTotalMasaSalarial, 'Debe ingresar el total de masa salarial.');
//  Verificar((not edFechaPresentacion.IsEmpty) and (edFechaPresentacion.Date > DBDate), edFechaPresentacion, 'La Fecha de presentación no puede ser futura.');
//  Verificar((not edFechaPresentacion.IsEmpty) and (edTotalEmpleados.IsEmpty), edTotalEmpleados, 'Debe ingresar el total de empleados.');
//  Verificar((not edFechaPresentacion.IsEmpty) and (edTotalMasaSalarial.Value = 0), edTotalMasaSalarial, 'Debe ingresar el total de masa salarial.');
//  Verificar((not (edTotalEmpleados.IsEmpty) or (edTotalMasaSalarial.Value <> 0)) and (edFechaPresentacion.IsEmpty), edFechaPresentacion, 'Ingresó la fecha de presentación y falta la masa o los empleados.');
//  Verificar(((cbInscripcion.ItemIndex = 0) or (cbInscripcion.ItemIndex = 1)) and (edTotalEmpleados.Value <> edSumTotalEmpleados.Value), edSumTotalEmpleados, 'No coincide el total de empleados con el detalle.');
//  Verificar(((cbInscripcion.ItemIndex = 0) or (cbInscripcion.ItemIndex = 1)) and (edTotalMasaSalarial.Value <> edSumMasaSalarial.Value), edSumMasaSalarial, 'No coincide el total de masa salarial con el detalle.');
  Verificar((cbInscripcion.ItemIndex = -1), cbInscripcion, 'Debe ingresar la inscripcion.');
  Verificar(cdsTrab.IsEmpty, gbDetalle, 'Debe ingresar el detalle.');
//  Verificar((edFechaPresentacion.IsEmpty), edFechaPresentacion, 'Debe ingresar la fecha de presentación.');
  if ((edTotalEmpleados.Value <> edSumTotalEmpleados.Value) or (edTotalMasaSalarial.Value <> edSumMasaSalarial.Value)) and
     (MsgBox('No coinciden los datos del Resumen con los del Formulario 165/170' + #13#10 + '¿Desea continuar la nota de todas formas?', MB_ICONQUESTION + MB_YESNO ) <> IDYES) then
    Abort;

  result := true;
end;

function TfraForm165_170.GetFechaPresentacion: TDate;
begin
  result := GetFechaPresDetalle;
end;

function TfraForm165_170.GetTotalEmpleados: integer;
begin
  result := edTotalEmpleados.Value;
end;

function TfraForm165_170.GetTotalMasaSalarial: Extended;
begin
  result := edTotalMasaSalarial.Value;
end;

function TfraForm165_170.GetDetalleTrabajadores: TClientDataSet;
begin
  result := cdsTrab;
end;

function TfraForm165_170.GetInscripcion: integer;
begin

  if (cbInscripcion.ItemIndex <> -1) then
    result := integer(cbInscripcion.Items.Objects[cbInscripcion.ItemIndex])
  else
    result := -1;
end;


procedure TfraForm165_170.GuardarBorrador(aIdFormulario, aIdNota: integer;
  var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String; aIdNotaPeriodoRelacion: integer; aTipoRelacion: string);
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

    if chkConResumen.Checked then
    begin
      Fields.Add('NP_TOTALEMPLEADOS', TotalEmpleados);
      Fields.AddExtended('NP_TOTALMASASALARIAL', TotalMasaSalarial);
    end
    else begin
      Fields.Add('NP_TOTALEMPLEADOS', exNull);
      Fields.Add('NP_TOTALMASASALARIAL', exNull);
    end;

    Fields.Add('NP_CONRESUMEN', ConResumen);

    if (FechaPresentacion > 0) then
      Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion)
    else
      Fields.Add('NP_FECHAPRESENTACION', exNull);

    Fields.Add('NP_IDINSCRIPCION', Inscripcion);
    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);
    Fields.Add('NP_ILEGIBLE', aIlegible);

    if (aIdNotaPeriodoRelacion > 0) then
    begin
      Fields.Add('NP_TIPORELACION', aTipoRelacion);
      Fields.Add('NP_IDNOTAPERIODORELACIONADA', aIdNotaPeriodoRelacion);
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

function TfraForm165_170.IsEmpty: boolean;
begin
  result := (edTotalEmpleados.Value = 0)
            and (edTotalMasaSalarial.Value = 0)
//            and (edFechaPresentacion.Date = 0)
            and (cbInscripcion.ItemIndex = -1)
            and (cdsTrab.IsEmpty);
end;

procedure TfraForm165_170.CargarFormulario(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_IDINSCRIPCION, NP_TOTALEMPLEADOS, NP_TOTALMASASALARIAL, ' +
                ' NP_FECHAPRESENTACION, NP_CONRESUMEN ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    chkConResumen.Checked := Q.FieldbyName('NP_CONRESUMEN').AsString = 'S';
    if (chkConResumen.Checked) then
    begin
      edTotalEmpleados.Value := Q.FieldbyName('NP_TOTALEMPLEADOS').AsInteger;
      edTotalMasaSalarial.Value := Q.FieldbyName('NP_TOTALMASASALARIAL').AsFloat;
    end;
//    edFechaPresentacion.Date := Q.FieldbyName('NP_FECHAPRESENTACION').AsDateTime;
    cbInscripcion.ItemIndex := cbInscripcion.Items.IndexOfObject(TObject(Q.FieldbyName('NP_IDINSCRIPCION').AsInteger));
    cbInscripcionChange(nil);
    CargarDetalleBorrador(aIdNotaPeriodo);
  finally
    Q.free;
  end;
end;

procedure TfraForm165_170.GuardarDetalleBorrador(aIdNotaPeriodo: integer);
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

procedure TfraForm165_170.CargarDetalleBorrador(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT * ' +
                ' FROM EMI.INT_NOTATRABAJADORPERIODO, EMI.ICO_CONDICION ' +
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

procedure TfraForm165_170.SimularEstado(aContrato, aIdNotaPeriodo: integer);
begin
  try
    do_aplicarcaso2(aContrato, aIdNotaPeriodo, true);
  except
    on E: Exception do
    begin
       ErrorMsg(E, 'Error al previsualizar el estado.');
    end;
  end;
end;


procedure TfraForm165_170.ActivarResumen(aActive: boolean);
begin
  if aActive and not chkConResumen.Checked then edTotalMasaSalarial.Clear;
  if aActive and not chkConResumen.Checked then edTotalEmpleados.Clear;
  LockControl(edTotalMasaSalarial, not aActive or not chkConResumen.Checked);
  LockControl(edTotalEmpleados, not aActive or not chkConResumen.Checked);
end;

procedure TfraForm165_170.chkConResumenClick(Sender: TObject);
begin
  ActivarResumen(chkConResumen.Enabled);
end;

function TfraForm165_170.GetConResumen: boolean;
begin
  result := chkConResumen.Checked;
end;

procedure TfraForm165_170.dbgDetalleCUILGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if cdsTrab.FieldByName('ConTicket').AsString = 'N' then
  begin
    Background := $00C6FFC6;
    if Highlight then AFont.Color := clBlack;
  end;
end;

procedure TfraForm165_170.chkConTicketClick(Sender: TObject);
begin
  ActivarTicket(chkConTicket.Enabled);
end;

procedure TfraForm165_170.ActivarTicket(aActive: boolean);
begin
  if aActive and not chkConTicket.Checked then
  begin
    edFechaPresentacion.Clear;
  end;
  LockControls(edFechaPresentacion, not aActive or not chkConTicket.Checked);
end;

function TfraForm165_170.GetFechaPresDetalle: TDate;
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

end.
