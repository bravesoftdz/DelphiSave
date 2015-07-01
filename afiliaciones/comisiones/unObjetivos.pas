unit unObjetivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin,
  unArtFrame, unFraCodigoDescripcion, unFraCodDesc, unArtDBAwareFrame;

type
  TfrmObjetivos = class(TfrmCustomGridABM)
    fraObjetivo: TfraCodDesc;
    Label1: TLabel;
    tbAprobar: TToolButton;
    ToolButton1: TToolButton;
    tbSalir2: TToolButton;
    procedure tbRefrescarClick(Sender: TObject); 
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure FSFormActivate(Sender: TObject);
  private
    FIdVendedor: Integer;
    procedure SetIdVendedor(const Value: Integer);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function ValidarAprobar: Boolean;
  public
    property IdVendedor: Integer read FIdVendedor write SetIdVendedor;
  end;

var
  frmObjetivos: TfrmObjetivos;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, unSesion;

{$R *.DFM}

{ TfrmObjetivos }

function TfrmObjetivos.DoABM: Boolean;
var
  fId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'XOV_OBJETIVOVENDEDOR';
  if ModoABM = maAlta then
    fId := ValorSql('SELECT SEQ_XOV_ID.NEXTVAL FROM DUAL', '0')
  else
    fId := sdqConsulta.FieldByName('OV_ID').AsInteger;

  Sql.PrimaryKey.Add('OV_ID', fId, False);

  if ModoABM = maBaja then
  begin
    Sql.Fields.Add('OV_USUBAJA', Sesion.UserID);
    Sql.Fields.Add('OV_FECHABAJA', SQL_ACTUALDATE, False);
  end
  else
  begin
    Sql.Fields.Add('OV_IDOBJETIVO', fraObjetivo.Value, 0, True);
    Sql.Fields.Add('OV_IDVENDEDOR', FIdVendedor, 0, True);
    Sql.Fields.Add('OV_USUALTA', Sesion.UserID);
    Sql.Fields.Add('OV_FECHAALTA', SQL_ACTUALDATE, False);
  end;

  if ModoABM = maAlta then
    EjecutarSql(Sql.InsertSql)
  else
    EjecutarSql(Sql.UpdateSql);

  tbRefrescarClick(nil);
  Result := True;  
end;

function TfrmObjetivos.Validar: Boolean;
begin
  Verificar(fraObjetivo.IsEmpty, fraObjetivo, 'El Objetivo es Obligatorio.');

  Result := True;
end;


procedure TfrmObjetivos.ClearControls;
begin
  fraObjetivo.Clear;
end;

procedure TfrmObjetivos.SetIdVendedor(const Value: Integer);
begin
  FIdVendedor := Value;
end;


procedure TfrmObjetivos.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text :=
    'SELECT OV_ID, OB_DESCRIPCION OBJETIVO, OB_CAPITASDESDE CAPITASDESDE, OB_CAPITASHASTA CAPITASHASTA, ' +
    '       OB_PORCCOMISIONPRIVADO PORCCOMISIONPRIVADO, OB_PORCCOMISIONPUBLICO PORCCOMISIONPUBLICO, ' +
    '       OB_FECHABAJA FECHABAJAOBJ, TRUNC(OV_FECHAAPROBADO) FECHAAPROBADO, ' +
    '       OV_FECHAALCANCE FECHAALCANCE, OV_FECHABAJA FECHABAJA ' +
    '  FROM XOB_OBJETIVO, XOV_OBJETIVOVENDEDOR ' +
    ' WHERE OB_ID = OV_IDOBJETIVO ' +
    '   AND OV_IDVENDEDOR = ' + SqlValue(FIdVendedor);

  inherited;
end;

procedure TfrmObjetivos.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;
  FieldBaja := 'FECHABAJA';
end;

procedure TfrmObjetivos.btnAceptarClick(Sender: TObject);
begin
  inherited;

  fpAbm.Close;
end;

procedure TfrmObjetivos.tbNuevoClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT 1 ' +
    '  FROM XOV_OBJETIVOVENDEDOR ' +
    ' WHERE OV_IDVENDEDOR = ' + SqlValue(FIdVendedor) +
    '   AND OV_FECHABAJA IS NULL';

  Verificar(ExisteSql(sSql), nil, 'Este vendedor ya tiene un objetivo vigente.');

  inherited;
end;

procedure TfrmObjetivos.tbAprobarClick(Sender: TObject);
var
  sSql: String;
begin
  if ValidarAprobar then
    if MsgBox('¿Está seguro que desea aprobar?',MB_YESNO + MB_ICONQUESTION ) = mrYes then
      begin
        sSql := 'UPDATE XOV_OBJETIVOVENDEDOR ' +
                   'SET OV_FECHAAPROBADO=SYSDATE, ' +
                       'OV_USUAPROBADO=:Usuario ' +
                 'WHERE OV_ID=:Id';
        EjecutarSqlEx(sSql, [Sesion.UserID, sdqConsulta.FieldByName('OV_ID').AsInteger]);

        tbRefrescarClick(nil);
      end;
end;

function TfrmObjetivos.ValidarAprobar: Boolean;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay ningún registro en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHABAJAOBJ').IsNull, Grid, 'El objetivo se encuentra dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, Grid, 'El objetivo del vendedor se encuentra dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, Grid, 'El objetivo ya se encuentra aprobado.');

  Result := True;
end;

procedure TfrmObjetivos.LoadControls;
begin
  inherited;
end;

procedure TfrmObjetivos.FSFormActivate(Sender: TObject);
begin
  inherited;

  tbRefrescarClick(nil);  
end;

end.

