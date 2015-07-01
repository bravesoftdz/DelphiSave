unit unSinGranInvalidez;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit,
  SinEdit;

type
  TfrmSinGranInvalidez = class(TfrmCustomGridABM)
    lblIDEXP: TLabel;
    sdqConsultaGI_ID: TFloatField;
    sdqConsultaGI_IDEXPEDIENTE: TFloatField;
    sdqConsultaEX_SINIESTRO: TFloatField;
    sdqConsultaEX_ORDEN: TFloatField;
    sdqConsultaEX_RECAIDA: TFloatField;
    sdqConsultaTJ_CUIL: TStringField;
    sdqConsultaTJ_NOMBRE: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaGI_FECHABAJA: TDateTimeField;
    edSiniestro: TSinEdit;
    procedure FormCreate(Sender: TObject);
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: boolean; override;
    function Validar: boolean; override;
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSinGranInvalidez: TfrmSinGranInvalidez;

implementation

uses unPrincipal, undmprincipal, sqlfuncs, customdlgs, unCustomConsulta;

{$R *.dfm}


procedure TfrmSinGranInvalidez.FormCreate(Sender: TObject);
begin
  inherited;
  sql.TableName := 'SIN.SGI_SINIESTROSCONGRANINVALIDEZ';
  ShowActived := false;
  FieldBaja := 'GI_FECHABAJA';
  bAllowModify := false;
end;


procedure TfrmSinGranInvalidez.ClearControls;
begin
  inherited;
  edSiniestro.Clear;
end;

procedure TfrmSinGranInvalidez.LoadControls;
begin
  inherited;
  edSiniestro.Siniestro := sdqConsulta.FieldValues['EX_SINIESTRO'];
  edSiniestro.orden := sdqConsulta.FieldValues['EX_ORDEN'];
  edSiniestro.recaida := sdqConsulta.FieldValues['EX_RECAIDA'];
end;

function TfrmSinGranInvalidez.DoABM: boolean;
var proxID, IDExp: integer;
begin
  sql.Clear;
  if ModoABM = maAlta Then
  begin
    IDExp := ValorSqlEx('select ex_id from art.sex_expedientes where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec',
                        [edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida]);
    proxID := GetSecNextVal('SIN.SEQ_SGI_PK');
    Sql.PrimaryKey.Add('GI_ID', proxID);
    Sql.Fields.Add('GI_IDEXPEDIENTE', IDExp);
    Sql.Fields.Add('GI_USUALTA', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('GI_FECHAALTA', exDateTime);
  end
  else
  begin
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('GI_ID', sdqConsulta.FieldByName('GI_ID').AsString);
      Sql.Fields.Add('GI_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('GI_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end
    else
    begin
      IDExp := ValorSqlEx('select ex_id from art.sex_expedientes where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec',
                          [edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida]);
      Sql.PrimaryKey.Add('GI_ID', sdqConsulta.FieldByName('GI_ID').AsString);
      Sql.Fields.Add('GI_IDEXPEDIENTE', IDExp);
      Sql.Fields.Add('GI_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('GI_FECHAMODIF', exDateTime);
    end;
  end;
  result := inherited DoABM;
end;

function TfrmSinGranInvalidez.Validar: boolean;
var ssql: string;
begin
  verificar(edSiniestro.IsEmpty, edSiniestro, 'El campo es obligatorio');
  ssql := ' select ex_id from art.sex_expedientes where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec';
  verificar (not ExisteSqlEx(ssql, [edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida]), edSiniestro, 'Siniestro inexistente');

  ssql := ' select gi_idexpediente from SIN.SGI_SINIESTROSCONGRANINVALIDEZ, art.sex_expedientes ' +
          ' where gi_idexpediente = ex_id ' +
          '   and gi_fechabaja is null ' +
          '   and ex_siniestro = :sin ' +
          '   and ex_orden = :ord ' +
          '   and ex_recaida = :rec ';

  verificar(ExisteSqlEx(ssql, [edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida]), edSiniestro, 'Siniestro ya cargado');
  result := true;
end;

procedure TfrmSinGranInvalidez.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin
  ssql := ' SELECT GI_ID, GI_IDEXPEDIENTE, EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, TJ_CUIL, TJ_NOMBRE, EM_NOMBRE, EM_CUIT, ' +
                 ' GI_FECHABAJA ' +
            ' FROM SIN.SGI_SINIESTROSCONGRANINVALIDEZ, ART.SEX_EXPEDIENTES, COMUNES.CTJ_TRABAJADOR, AFI.ACO_CONTRATO, AFI.AEM_EMPRESA ' +
           ' WHERE GI_IDEXPEDIENTE = EX_ID ' +
             ' AND EX_IDTRABAJADOR = TJ_ID ' +
             ' AND EX_CONTRATO = CO_CONTRATO ' +
             ' AND CO_IDEMPRESA = EM_ID ' +
             ' AND GI_FECHABAJA IS NULL ';


  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;

end;


procedure TfrmSinGranInvalidez.fpAbmShow(Sender: TObject);
begin
  edSiniestro.SetFocus;
end;

end.
