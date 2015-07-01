unit unABMUsuariosPorSector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unfraSectores, ImgList, XPMenu,
  unArtFrame, unfraUsuarios;

type
  TfrmABMUsuariosPorSector = class(TfrmCustomGridABM)
    chkBajas: TCheckBox;
    fraES_SECTOR: TfraSectores;
    lbSector: TLabel;
    fraSector: TfraSectores;
    fraUsuario: TfraUsuario;
    Label1: TLabel;
    Label2: TLabel;
    chkResponsable: TCheckBox;
    ShortCutControlHijo: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmABMUsuariosPorSector: TfrmABMUsuariosPorSector;

implementation

uses unFiltros, CustomDlgs, unSesion, DateTimeFuncs, SqlFuncs,
  unDmPrincipal, General, unPrincipal, VCLExtra, AnsiSql, unArt;

{$R *.dfm}

procedure TfrmABMUsuariosPorSector.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMUNES.CES_EMAILSECTOR';
  FieldBaja := 'ES_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmABMUsuariosPorSector.ClearControls;
begin
  inherited;
  chkResponsable.AllowGrayed := True;
  fraSector.Clear;
  fraUsuario.Clear;
  chkResponsable.State := cbGrayed;
end;

function TfrmABMUsuariosPorSector.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('ES_ID', sdqConsulta.FieldByName('ES_ID').AsInteger);
     Sql.Fields.Add('ES_FECHABAJA', exDate);
     Sql.Fields.Add('ES_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('ES_ID', ValorSQLInteger('SELECT NVL(MAX(ES_ID), 0) FROM COMUNES.CES_EMAILSECTOR') + 1);
       Sql.Fields.Add('ES_FECHAALTA', exDate);
       Sql.Fields.Add('ES_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('ES_ID', sdqConsulta.FieldByName('ES_ID').AsInteger);
       Sql.Fields.Add('ES_FECHAMODIF', exDate);
       Sql.Fields.Add('ES_USUMODIF', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('es_direlectronica', fraUsuario.UserID);
     Sql.Fields.Add('es_sector', fraSector.Codigo);
     Sql.Fields.Add('es_tipo', 'U');
     Sql.Fields.Add('es_persona', fraUsuario.Nombre);
     Sql.Fields.Add('es_responsable', String(iif(chkResponsable.Checked, 'S', 'N')));
  end;

  Result := inherited DoABM;
end;

procedure TfrmABMUsuariosPorSector.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (Field.FieldName = 'SE_NOMBRE') and (not Field.DataSet.FieldByName('SE_FECHABAJA').IsNull) then
    AFont.Color := clRed;

  if AreIn(Field.FieldName, ['RESPONSABLE']) then
  begin
    if (sdqConsulta.FieldByName('RESPONSABLE').AsString = vSI) then
      AFont.Color := clTeal
    else
      AFont.Color := clMaroon;
  end;
end;

procedure TfrmABMUsuariosPorSector.LoadControls;
begin
  fraUsuario.Cargar(sdqConsulta.FieldByName('se_usuario').AsString);
  fraSector.Cargar(sdqConsulta.FieldByName('es_sector').AsString);
  chkResponsable.Checked := sdqConsulta.FieldByName('es_responsable').AsString = 'S';
  chkResponsable.AllowGrayed := False;
end;

procedure TfrmABMUsuariosPorSector.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + iif(chkBajas.Checked, ' AND es_fechabaja IS NULL ', '') + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmABMUsuariosPorSector.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(Grid, 25, True, True);
end;

function TfrmABMUsuariosPorSector.Validar: Boolean;
begin
  Verificar(fraSector.IsEmpty, fraSector.edCodigo, 'Debe completar el sector.');
  Verificar(fraUsuario.IsEmpty, fraUsuario.edCodigo, 'Debe completar el usuario.');
  Verificar(chkResponsable.State = cbGrayed, chkResponsable, 'Debe indicar si el usuario será considerado responsable o no para el sector ' + fraSector.Descripcion + '.');
  Verificar(ExisteSQLEx('SELECT 1 ' +
                          'FROM comunes.ces_emailsector ' +
                         'WHERE es_direlectronica = :usuario ' +
                           'AND es_sector = :sector ' +
                           'AND es_responsable = :responsable ' +
                           'AND es_fechabaja IS NULL', [fraUsuario.UserID, fraSector.Codigo, SqlBoolean(chkResponsable.Checked, False)]),
             btnAceptar,
             'El usuario ' + fraUsuario.Nombre + ' ya figura como ' + IIF(chkResponsable.Checked, '', ' no') + ' responsable en el sector ' + fraSector.Descripcion);
  Result := True;
end;

procedure TfrmABMUsuariosPorSector.ClearData;
begin
  inherited;
  fraES_SECTOR.Clear;
  chkBajas.Checked := True;
end;

end.
