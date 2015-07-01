unit unFraForm900_926;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, ComCtrls, ToolWin, CurrEdit,
  StdCtrls, ToolEdit, DateComboBox, Mask, PatternEdit, IntEdit, VCLExtra, CustomDlgs, Cuit,
  unDmPrincipal, SqlFuncs, DBSql, unSesion, Periodos, AnsiSql, SDEngine, unConstEmision,
  unFuncionesEmision, Strfuncs, General;

type
  TfraForm900_926 = class(TFrame)
    lblTotalHojas: TLabel;
    edTotalHojas: TIntEdit;
    lblCodigoRectificativa: TLabel;
    edCodigoRectificativa: TPatternEdit;
    chkConTicket: TCheckBox;
    lblFechaPresentacion: TLabel;
    edFechaPresentacion: TDateComboBox;
    gbDetalle: TGroupBox;
    lblTotalEmpxHoja: TLabel;
    lblTotalMasaSalxHoja: TLabel;
    lblSumEmpleHojas: TLabel;
    lblSumMasaSalHojas: TLabel;
    lblSumCantHojas: TLabel;
    edTotalEmpleadosxHoja: TIntEdit;
    edTotalMasaSalarialxHoja: TCurrencyEdit;
    tbComandosDetalle900_926: TToolBar;
    tbAddHoja: TToolButton;
    tbDeleteHoja: TToolButton;
    tbLimpiarHoja: TToolButton;
    dbgDetalleHoja: TDBGrid;
    edSumMasaSalHojas: TCurrencyEdit;
    edSumCantHojas: TCurrencyEdit;
    cdsDetalleHoja: TClientDataSet;
    dsDetalleHoja: TDataSource;
    edSumEmpleHojas: TIntEdit;
    procedure tbAddHojaClick(Sender: TObject);
    procedure tbDeleteHojaClick(Sender: TObject);
    procedure tbLimpiarHojaClick(Sender: TObject);
    procedure chkConTicketClick(Sender: TObject);
  private
    FContrato: integer;
    FConservarFechaPres: boolean;
    function GetTotalHojas: integer;
    function GetRectificativa: string;
    function GetConTicket: boolean;
    function GetFechaPresentacion: TDate;
    function GetDetalleHojas: TClientDataSet;
    function GetTotalEmpleados: integer;
    function GetTotalMasaSalarial: Extended;
    procedure GuardarDetalleBorrador(aIdNotaPeriodo: integer);
    procedure CargarDetalleBorrador(aIdNotaPeriodo: integer);
  public
    property TotalHojas: integer read GetTotalHojas;
    property Rectificativa: string read GetRectificativa;
    property ConTicket: boolean read GetConTicket;
    property FechaPresentacion: TDate read GetFechaPresentacion;
    property DetalleHojas: TClientDataSet read GetDetalleHojas;
    property TotalEmpleados: integer read GetTotalEmpleados;
    property TotalMasaSalarial: Extended read GetTotalMasaSalarial;
    property Contrato: integer read FContrato write FContrato;
    property ConservarFechaPres: boolean read FConservarFechaPres write FConservarFechaPres;
    procedure ActivarControles(aActive: boolean);
    procedure ActivarTicket(aActive: boolean);
    procedure LimpiarControles;
    procedure Init;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario, aIdNota: integer;
      var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer);
  end;

implementation

{$R *.dfm}

procedure TfraForm900_926.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
  ActivarTicket(aActive);
  edSumEmpleHojas.Enabled := False;
  edSumMasaSalHojas.Enabled := False;
  edSumCantHojas.Enabled := False;
  edSumEmpleHojas.Readonly := True;
  edSumMasaSalHojas.Readonly := True;
  edSumCantHojas.Readonly := True;
  edSumEmpleHojas.Color := $00F4ECEC;
  edSumMasaSalHojas.Color := $00F4ECEC;
  edSumCantHojas.Color := $00F4ECEC;
end;

function TfraForm900_926.GetConTicket: boolean;
begin
  result := chkConTicket.Checked;
end;

function TfraForm900_926.GetDetalleHojas: TClientDataSet;
begin
  result := cdsDetalleHoja;
end;

function TfraForm900_926.GetFechaPresentacion: TDate;
begin
  result := edFechaPresentacion.Date;
end;

function TfraForm900_926.GetRectificativa: string;
begin
  result := lpad(edCodigoRectificativa.text, '0', 2);
end;

function TfraForm900_926.GetTotalHojas: integer;
begin
  result := edTotalHojas.Value;
end;

procedure TfraForm900_926.Init;
begin
  cdsDetalleHoja.CreateDataSet;
  cdsDetalleHoja.EmptyDataSet;
end;

procedure TfraForm900_926.LimpiarControles;
begin
  edTotalHojas.Clear;
  edCodigoRectificativa.Clear;
  chkConTicket.Checked := false;
  if not FConservarFechaPres then
    edFechaPresentacion.Clear;
  edTotalEmpleadosxHoja.Clear;
  edTotalMasaSalarialxHoja.Clear;
  edSumEmpleHojas.Value := 0;
  edSumMasaSalHojas.Clear;
  edSumCantHojas.Clear;
end;

procedure TfraForm900_926.tbAddHojaClick(Sender: TObject);
begin
//    Verificar(edTotalEmpleadosxHoja.Value = 0, edTotalEmpleadosxHoja, 'Debe ingresar la cantidad de Empleados.');
//    Verificar(edTotalMasaSalarialxHoja.Value = 0, edTotalMasaSalarialxHoja, 'Debe ingresar la Masa Salarial.');

    with cdsDetalleHoja do
    begin
      Append;
      FieldByName('Empleados').AsInteger := edTotalEmpleadosxHoja.Value;
      FieldByName('MasaSalarial').AsFloat := edTotalMasaSalarialxHoja.Value;
      Post;
    end;

    edSumEmpleHojas.Value := edSumEmpleHojas.Value + edTotalEmpleadosxHoja.Value;
    edSumMasaSalHojas.Value := edSumMasaSalHojas.Value + edTotalMasaSalarialxHoja.Value;
    edSumCantHojas.Value := cdsDetalleHoja.RecordCount;

    edTotalEmpleadosxHoja.Clear;
    edTotalMasaSalarialxHoja.Clear;
    edTotalEmpleadosxHoja.SetFocus;
end;

procedure TfraForm900_926.tbDeleteHojaClick(Sender: TObject);
begin
  if not cdsDetalleHoja.IsEmpty and (dbgDetalleHoja.SelectedIndex > -1) then
  begin
    edSumEmpleHojas.Value := edSumEmpleHojas.Value - cdsDetalleHoja.fieldbyname('Empleados').AsInteger;
    edSumMasaSalHojas.Value := edSumMasaSalHojas.Value - cdsDetalleHoja.fieldbyname('MasaSalarial').AsFloat;
    cdsDetalleHoja.Delete;
  end;
end;

procedure TfraForm900_926.tbLimpiarHojaClick(Sender: TObject);
begin
  edTotalEmpleadosxHoja.Clear;
  edTotalMasaSalarialxHoja.Clear;
end;

function TfraForm900_926.Validar(aIdFormulario: integer): boolean;
begin
  Verificar(edTotalHojas.IsEmpty, edTotalHojas, 'Debe ingresar el total de hojas.');
//  Verificar(edCodigoRectificativa.IsEmpty, edCodigoRectificativa, 'Debe ingresar el Código de Rectificativa.');
  Verificar(chkConTicket.Checked and edFechaPresentacion.IsEmpty, edFechaPresentacion, 'Debe ingresar la fecha de presentación.');
  Verificar(chkConTicket.Checked and (edFechaPresentacion.Date > DBDate), edFechaPresentacion, 'La Fecha de presentación no puede ser futura.');
  Verificar(edTotalHojas.IsEmpty and cdsDetalleHoja.IsEmpty, edTotalHojas, 'Debe ingresar el total de hojas o el detalle.');
  if (cdsDetalleHoja.RecordCount <> edTotalHojas.Value) and
     (MsgBox('La cantidad de hojas no coincide con la cantidad de detalles cargados.' + #13#10 + '¿Desea procesar la nota de todas formas?', MB_ICONQUESTION + MB_YESNO ) <> IDYES) then
    Abort;
  result := true;
end;

procedure TfraForm900_926.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
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

    Fields.Add('NP_TOTALHOJAS', TotalHojas);
    Fields.Add('NP_CODIGORECTIFICATIVA', Rectificativa);
    Fields.Add('NP_CONTICKET', ConTicket);
    Fields.Add('NP_ILEGIBLE', aIlegible);

    if FechaPresentacion > 0 then
      Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion)
    else
      Fields.Add('NP_FECHAPRESENTACION', exNull);
    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_TOTALEMPLEADOS', TotalEmpleados);
    Fields.AddExtended('NP_TOTALMASASALARIAL', TotalMasaSalarial);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);

    EjecutarSqlST(Sql);
    GuardarDetalleBorrador(aIdNotaPeriodo);
  finally
    free;
  end;

end;

function TfraForm900_926.GetTotalEmpleados: integer;
begin
  result := edSumEmpleHojas.Value;
end;

function TfraForm900_926.GetTotalMasaSalarial: Extended;
begin
  result := edSumMasaSalHojas.Value;
end;

procedure TfraForm900_926.CargarFormulario(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_TOTALHOJAS, NP_CODIGORECTIFICATIVA, ' +
                ' NP_CONTICKET, NP_FECHAPRESENTACION' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    edTotalHojas.Value := Q.FieldbyName('NP_TOTALHOJAS').AsInteger;
    edCodigoRectificativa.Text := Q.FieldbyName('NP_CODIGORECTIFICATIVA').AsString;
    chkConTicket.Checked := Q.FieldbyName('NP_CONTICKET').AsString = 'S';
    edFechaPresentacion.Date := Q.FieldbyName('NP_FECHAPRESENTACION').AsDateTime;
    CargarDetalleBorrador(aIdNotaPeriodo);
  finally
    Q.free;
  end;
end;

procedure TfraForm900_926.CargarDetalleBorrador(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT * ' +
                ' FROM EMI.INH_NOTAHOJASPERIODO ' +
                ' WHERE NH_IDNOTACONTRATOPERIODO = ' + SqlValue(aIdNotaPeriodo));
  try
    while not Q.Eof do
    begin
      cdsDetalleHoja.Append;
      cdsDetalleHoja.FieldByName('Empleados').AsInteger := Q.FieldbyName('NH_EMPLEADOS').AsInteger;
      cdsDetalleHoja.FieldByName('MasaSalarial').AsFloat := Q.FieldbyName('NH_MASASALARIAL').AsFloat;
      cdsDetalleHoja.Post;
      edSumEmpleHojas.Value := edSumEmpleHojas.Value + Q.FieldbyName('NH_EMPLEADOS').AsInteger;
      edSumMasaSalHojas.Value := edSumMasaSalHojas.Value + Q.FieldbyName('NH_MASASALARIAL').AsFloat;
      edSumCantHojas.Value := edSumCantHojas.Value + 1;
      Q.Next;
    end;
  finally
    Q.free;
  end;
end;

procedure TfraForm900_926.GuardarDetalleBorrador(aIdNotaPeriodo: integer);
begin
  EjecutarSqlST(' DELETE FROM EMI.INH_NOTAHOJASPERIODO ' +
                ' WHERE NH_IDNOTACONTRATOPERIODO = ' + SqlValue(aIdNotaPeriodo));
  cdsDetalleHoja.First;
  while not cdsDetalleHoja.Eof do
  begin
    EjecutarSqlST(' INSERT INTO EMI.INH_NOTAHOJASPERIODO ' +
                  ' VALUES (EMI.SEQ_INH_ID.NEXTVAL, ' + SqlValue(aIdNotaPeriodo) + ', ' +
                    SqlValue(cdsDetalleHoja.FieldByName('Empleados').AsInteger) + ', ' +
                    SqlNumber(cdsDetalleHoja.FieldByName('MasaSalarial').AsFloat) + ')' );
    cdsDetalleHoja.Next;
  end;
end;

procedure TfraForm900_926.chkConTicketClick(Sender: TObject);
begin
  ActivarTicket(chkConTicket.Enabled);
end;

procedure TfraForm900_926.ActivarTicket(aActive: boolean);
begin
  if aActive and not chkConTicket.Checked then
    edFechaPresentacion.Clear;
  LockControls(edFechaPresentacion, not aActive or not chkConTicket.Checked);
end;

procedure TfraForm900_926.SimularEstado(aContrato,
  aIdNotaPeriodo: integer);
begin
  try
    do_aplicarcaso3(aContrato, aIdNotaPeriodo, true);
  except
    on E: Exception do
    begin
       ErrorMsg(E, 'Error al previsualizar el estado.');
    end;
  end;
end;

end.
