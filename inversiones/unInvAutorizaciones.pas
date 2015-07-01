unit unInvAutorizaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Mask, ToolEdit, CurrEdit;

type
  TfrmInvAutorizaciones = class(TfrmCustomGridABM)
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    fraNivelAutorizAltaModif: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    edMontoDesdeAltaModif: TCurrencyEdit;
    Label3: TLabel;
    edMontoHastaAltaModif: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  protected
    procedure ClearControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmInvAutorizaciones: TfrmInvAutorizaciones;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, unArt,
  VCLExtra, CustomDlgs;

procedure TfrmInvAutorizaciones.ClearControls;
begin
  fraNivelAutorizAltaModif.Clear;
  edMontoDesdeAltaModif.Clear;
  edMontoHastaAltaModif.Clear;
end;

function TfrmInvAutorizaciones.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maAlta then
        begin
          PrimaryKey.Add('CI_ID',          GetSecNextVal('INV.SEQ_NCI_ID'));
          Fields.Add('CI_FECHAALTA',       exDateTime);
          Fields.Add('CI_USUALTA',         Sesion.UserID);
          Fields.Add('CI_IDNIVELAUTORIZA', fraNivelAutorizAltaModif.Value);
          Fields.Add('CI_MONTODESDE',      edMontoDesdeAltaModif.Value);
          Fields.Add('CI_MONTOHASTA',      edMontoHastaAltaModif.Value);

          SqlType := stInsert;
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('CI_ID',          sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('CI_FECHABAJA',       exDateTime);
          Fields.Add('CI_USUBAJA',         Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmInvAutorizaciones.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraNivelAutorizAltaModif.IsEmpty, fraNivelAutorizAltaModif, 'Debe indicar el nivel de autorización.');
  Verificar(edMontoDesdeAltaModif.Value <= 0, edMontoDesdeAltaModif, 'Debe indicar el monto desde.');
  Verificar(edMontoHastaAltaModif.Value <= 0, edMontoHastaAltaModif, 'Debe indicar el monto hasta.');
  Verificar(edMontoDesdeAltaModif.Value > edMontoHastaAltaModif.Value, edMontoDesdeAltaModif, 'El monto desde no puede ser mayor que el monto hasta.');

  sSql := 'SELECT 1 ' +
            'FROM NCI_CONTROLINVERSION ' +
           'WHERE CI_FECHABAJA IS NULL ' +
             'AND CI_IDNIVELAUTORIZA = :Nivel ' +
             'AND CI_MONTODESDE = :MontoDesde ' +
             'AND CI_MONTOHASTA = :Montohasta';
  Verificar(ExisteSqlEx(sSql, [fraNivelAutorizAltaModif.Value, edMontoDesdeAltaModif.Value, edMontoHastaAltaModif.Value]), fraNivelAutorizAltaModif, 'El nivel de autorización ya existe en el rango de montos indicados.');

  sSql := 'SELECT 1 ' +
            'FROM NCI_CONTROLINVERSION ' +
           'WHERE CI_FECHABAJA IS NULL ' +
             'AND CI_IDNIVELAUTORIZA = :Nivel ' +
             'AND (:MontoDesde BETWEEN CI_MONTODESDE AND CI_MONTOHASTA ' +
              'OR :MontoHasta BETWEEN CI_MONTODESDE AND CI_MONTOHASTA ' +
              'OR (:MontoDesde < CI_MONTODESDE AND :MontoHasta > CI_MONTOHASTA))';
  Verificar(ExisteSqlEx(sSql, [fraNivelAutorizAltaModif.Value, edMontoDesdeAltaModif.Value, edMontoHastaAltaModif.Value, edMontoDesdeAltaModif.Value, edMontoHastaAltaModif.Value]), fraNivelAutorizAltaModif, 'Los rangos de montos no pueden superponerse para un nivel de autorización dado.');

  Result := True;
end;

procedure TfrmInvAutorizaciones.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NCI_CONTROLINVERSION';

  with fraNivelAutorizAltaModif do
    begin
      TableName   := 'NNA_NIVELAUTORIZACION ';
      FieldID     := 'NA_ID';
      FieldCodigo := 'NA_ID';
      FieldDesc   := 'NA_DESCRIPCION';
      FieldBaja   := 'NA_FECHABAJA';
      ShowBajas   := False;
    end;
end;

procedure TfrmInvAutorizaciones.tbLimpiarClick(Sender: TObject);
begin            
  inherited;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmInvAutorizaciones.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'La autorización ya ha sido dado de baja.');

  inherited;
end;

procedure TfrmInvAutorizaciones.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT NA_DESCRIPCION NIVEL_AUTORIZACION, CI_MONTODESDE MONTO_DESDE, ' +
                 'CI_MONTOHASTA MONTO_HASTA, CI_FECHABAJA FECHA_BAJA, ' +
                 'CI_ID ID ' +
            'FROM NNA_NIVELAUTORIZACION, NCI_CONTROLINVERSION ' +
           'WHERE NA_ID = CI_IDNIVELAUTORIZA';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND CI_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmInvAutorizaciones.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('MONTO_DESDE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTO_DESDE')).Currency := True;

  if sdqConsulta.FieldByName('MONTO_HASTA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTO_HASTA')).Currency := True;
end;

end.
 