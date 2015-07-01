unit unManCRR_RESPUESTA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, StdCtrls, unArtFrame,
  unFraCodigoDescripcion, unFraCodDesc, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Db, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, unArtDBAwareFrame;

type
  TfrmManCRR_RESPUESTA = class(TfrmCustomGridABM)
    fraRR_SECTOR: TfraCodDesc;
    Label1: TLabel;
    fraSectorRespuesta: TfraCodDesc;
    Label2: TLabel;
    edRR_DESCRIPCION: TEdit;
    Label3: TLabel;
    chkBajas: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    FSql: String;
  protected
		function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
		procedure RefreshData; override;
  end;

var
  frmManCRR_RESPUESTA: TfrmManCRR_RESPUESTA;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, AnsiSql, SqlFuncs, VCLExtra, unCustomConsulta, unFiltros, General;

{$R *.DFM}

procedure TfrmManCRR_RESPUESTA.ClearControls;
begin
  edRR_DESCRIPCION.Clear;
  fraSectorRespuesta.Codigo := Sesion.Sector;
  VCLExtra.LockControls(fraSectorRespuesta, Sesion.Sector <> 'COMPUTOS');
end;

function TfrmManCRR_RESPUESTA.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
     Sql.SqlType := stUpdate;
     Sql.PrimaryKey.Add('rr_id',    sdqConsulta.FieldByName('rr_id').AsInteger);
     Sql.Fields.Add('rr_fechabaja', exDate);
     Sql.Fields.Add('rr_usubaja',   Sesion.UserID);
  end
  else
  begin
     if ModoABM = maAlta then
     begin
       Sql.SqlType := stInsert;
       Sql.PrimaryKey.AddExpression('rr_id', 'SEQ_CRR_ID.NEXTVAL');
       Sql.Fields.Add('rr_fechaalta',        exDate);
       Sql.Fields.Add('rr_usualta',          Sesion.UserID);
     end
     else if ModoABM = maModificacion then
     begin
       Sql.SqlType := stUpdate;
       Sql.PrimaryKey.Add('rr_id',     sdqConsulta.FieldByName('rr_id').AsInteger);
       Sql.Fields.Add('rr_fechamodif', exDate);
       Sql.Fields.Add('rr_usumodif',   Sesion.UserID);
     end;

     Sql.Fields.Add('rr_descripcion', edRR_DESCRIPCION.Text);
     Sql.Fields.Add('rr_sector',      fraSectorRespuesta.Codigo);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCRR_RESPUESTA.LoadControls;
begin
  edRR_DESCRIPCION.Text     := sdqConsulta.FieldByName('rr_descripcion').AsString;
  fraSectorRespuesta.Codigo := sdqConsulta.FieldByName('rr_sector').AsString;

  VCLExtra.LockControls(fraSectorRespuesta, Sesion.Sector <> 'COMPUTOS');
end;

procedure TfrmManCRR_RESPUESTA.RefreshData;
begin
  sdqConsulta.SQL.Text := FSql + DoFiltro(pnlFiltros) + IIF(chkBajas.Checked, ' AND rr_fechabaja IS NULL ' , '') + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManCRR_RESPUESTA.Validar: Boolean;
begin
  Verificar(Trim(edRR_DESCRIPCION.Text) = '', edRR_DESCRIPCION, 'Debe completar la descripción.');
  Result := True;
end;

procedure TfrmManCRR_RESPUESTA.FormCreate(Sender: TObject);
begin
  inherited;

  FSql := sdqConsulta.SQL.Text;
  Sql.TableName := 'crr_respuesta';
  FieldBaja     := 'rr_fechabaja';
  fraRR_SECTOR.Codigo := Sesion.Sector;
  VCLExtra.LockControls(fraRR_SECTOR, Sesion.Sector <> 'COMPUTOS');
end;

procedure TfrmManCRR_RESPUESTA.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraRR_SECTOR.Codigo := Sesion.Sector;
  chkBajas.Checked := True;
end;

end.
