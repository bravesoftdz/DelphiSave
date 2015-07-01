unit unFraFormSitFacturacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ToolEdit, DateComboBox, StdCtrls, Mask, PatternEdit, IntEdit,
  ComCtrls, ToolWin, VCLExtra, CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql,
  unSesion, Periodos, AnsiSql, SDEngine, unConstEmision, Buttons, unFuncionesEmision,
  StrFuncs, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraCodigoDescripcionExt, General;

type
  TFraFormSitFacturacion = class(TFrame)
    lblFechaPresentacion: TLabel;
    edtFechaPresentacion: TDateComboBox;
  private
    function GetFechaPresentacion: TDate;
    { Private declarations }
  public
    property FechaPresentacion: TDate read GetFechaPresentacion;
    procedure ActivarControles(aActive: boolean);
    procedure LimpiarControles;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
  end;

implementation

uses
  unfrmFormularioEmi, unFrmConsultaNotas;

{$R *.dfm}

{ TFraFormTicketPresentacion }

procedure TFraFormSitFacturacion.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
end;

procedure TFraFormSitFacturacion.CargarFormulario(
  aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_FECHAPRESENTACION' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    if not Q.FieldbyName('NP_FECHAPRESENTACION').IsNull then
      edtFechaPresentacion.Date := Q.FieldbyName('NP_FECHAPRESENTACION').AsDateTime;
  finally
    Q.free;
  end;
end;

function TFraFormSitFacturacion.GetFechaPresentacion: TDate;
begin
  result := edtFechaPresentacion.Date; 
end;

procedure TFraFormSitFacturacion.GuardarBorrador(aIdFormulario,
  aIdNota: integer; var aIdNotaPeriodo: integer);
begin

  aIdNotaPeriodo := ValorSqlInteger(' SELECT NP_ID ' +
                                    ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                                    ' WHERE NP_IDNOTA = ' + SqlValue(aIdNota) +
                                    ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(aIdFormulario), -1);//aIdNotaPeriodo);

  with TSql.Create do
  try
    TableName := 'EMI.INP_NOTACONTRATOPERIODO';
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
      Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion)
    else
      Fields.Add('NP_FECHAPRESENTACION', exNull);

    EjecutarSqlST(Sql);
  finally
    free;
  end;

end;

procedure TFraFormSitFacturacion.LimpiarControles;
begin
  edtFechaPresentacion.Clear;
end;

function TFraFormSitFacturacion.Validar(aIdFormulario: integer): boolean;
begin
  Verificar(edtFechaPresentacion.IsEmpty, edtFechaPresentacion, 'Debe ingresar la Fecha de presentación.');
  Verificar((not edtFechaPresentacion.IsEmpty) and (edtFechaPresentacion.Date > DBDate), edtFechaPresentacion, 'La Fecha de presentación no puede ser futura.');
  result := true;
end;

end.
