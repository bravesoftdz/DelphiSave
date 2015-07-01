unit unDestinatarioTickets;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, unArtDbFrame,
  unFraUsuarioConSectorIntranet;

type
  TfrmDestinatarioTickets = class(TfrmCustomGridABM)
    sdqConsultaSU_ID: TFloatField;
    sdqConsultaSU_IDSECTOR: TFloatField;
    sdqConsultaSU_IDUSUARIO: TFloatField;
    sdqConsultaSU_FECHADESDE: TDateTimeField;
    sdqConsultaSU_FECHAHASTA: TDateTimeField;
    sdqConsultaSE_DESCRIPCION: TStringField;
    sdqConsultaUSUARIO: TStringField;
    fraUsuarioConSectorIntranet: TfraUsuarioConSectorIntranet;
    sdqConsultaSE_USUARIO: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    FSQL: String;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmDestinatarioTickets: TfrmDestinatarioTickets;

implementation

uses unFiltros, CustomDlgs, AnsiSql, SqlFuncs, unDmPrincipal, VCLExtra;

{$R *.dfm}

procedure TfrmDestinatarioTickets.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmDestinatarioTickets.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMPUTOS.CSU_SECTORUSUARIO';
  FieldBaja := 'SU_FECHAHASTA';
  FSQL := sdqConsulta.SQL.Text;
end;

function TfrmDestinatarioTickets.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('SU_ID', sdqConsulta.FieldByName('SU_ID').AsInteger);
    Sql.Fields.Add('SU_FECHAHASTA', exDate);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddInteger('SU_ID', ValorSQLInteger('SELECT NVL(MAX(SU_ID), 0) FROM COMPUTOS.CSU_SECTORUSUARIO') + 1);
      Sql.Fields.Add('SU_FECHADESDE', exDate);
      Sql.SqlType := stInsert;
    end else
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('SU_ID', sdqConsulta.FieldByName('SU_ID').AsInteger);
      Sql.Fields.Add('SU_FECHADESDE', exDate);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('SU_IDUSUARIO', fraUsuarioConSectorIntranet.fraUsuarioSeleccionado.ID);
    Sql.Fields.Add('SU_IDSECTOR', fraUsuarioConSectorIntranet.fraSector.ID);
  end;

  Result := inherited DoABM;
end;

procedure TfrmDestinatarioTickets.LoadControls;
begin
  fraUsuarioConSectorIntranet.fraSector.Codigo := sdqConsulta.FieldByName('SU_IDSECTOR').AsString;
  fraUsuarioConSectorIntranet.fraUsuarioSeleccionado.Codigo := sdqConsulta.FieldByName('SE_USUARIO').AsString;
  VCLExtra.LockControls(fraUsuarioConSectorIntranet.fraSector, True);
end;

function TfrmDestinatarioTickets.Validar: Boolean;
begin
  Verificar(not fraUsuarioConSectorIntranet.IsSelected, fraUsuarioConSectorIntranet, 'Debe completar el sector y el usuario.');
  Result := True;
end;

procedure TfrmDestinatarioTickets.ClearControls;
begin
  inherited;
  fraUsuarioConSectorIntranet.Clear;
  VCLExtra.LockControls(fraUsuarioConSectorIntranet.fraSector, False);
end;

end.
