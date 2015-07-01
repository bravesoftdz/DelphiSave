unit unAgendaTelefonica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls;

type
  TfrmAgendaTelefonica = class(TfrmCustomConsulta)
    GroupBox1: TGroupBox;
    edNombre: TEdit;
    GroupBox2: TGroupBox;
    edSector: TEdit;
    procedure ActualizoPorEnter(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FSFormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  protected
    procedure ClearData; override;
    procedure RefreshData; override;
  end;

var
  frmAgendaTelefonica: TfrmAgendaTelefonica;

implementation

uses
  Math, General, CustomDlgs, unSesion, unDmPrincipal, AnsiSql, VCLExtra, unGrids;

{$R *.dfm}

procedure TfrmAgendaTelefonica.ClearData;
begin
  edNombre.Clear;
  edSector.Clear;

  inherited;
end;

procedure TfrmAgendaTelefonica.ActualizoPorEnter(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    RefreshData;
end;

procedure TfrmAgendaTelefonica.RefreshData;
var
  sSql: String;
  sWhere: String;
begin
  sWhere := '';
  sSql :=
    'SELECT /*+ index(art.use_usuarios ndx_use_parabusqueda)*/' +
          ' useu.se_id se_id, useu.se_nombre se_nombre, cse.se_descripcion sector, cse3.se_descripcion gerencia,' +
          ' useu.se_interno se_interno, useu.se_piso se_piso, useu.se_mail se_mail' +
  	 ' FROM use_usuarios useu, computos.cse_sector cse, computos.cse_sector cse2, computos.cse_sector cse3' +
	  ' WHERE useu.se_idsector = cse.se_id' +
  	  ' AND useu.se_fechabaja IS NULL' +
 		  ' AND useu.se_sector NOT IN (''CALLCENT'', ''BPAGOS'', ''BAPRO'', ''BANK'', ''AUDGRUP'', ''XUNILSA'', ''GBPS'', ''ESTJUD'', ''DIMO'', ''SML'') ' +      
  	  ' AND cse.se_idsectorpadre = cse2.se_id' +
      '	AND cse2.se_idsectorpadre = cse3.se_id';

  if edNombre.Text <> '' then
    sWhere := sWhere + ' AND useu.se_buscanombre LIKE ''%' + ParseNombre(StringReplace(edNombre.Text, '''', '''''',
                       [rfReplaceAll])) + '%''';

  if edSector.Text <> '' then
    sWhere := sWhere + ' AND (UPPER(ART.UTILES.reemplazar_acentos(cse3.se_descripcion)) LIKE ''%' +
                       ParseNombre(StringReplace(edSector.Text, '''', '''''', [rfReplaceAll])) +
                       '%'' OR UPPER(ART.UTILES.reemplazar_acentos(cse.se_descripcion)) LIKE ''%' +
                       ParseNombre(StringReplace(edSector.Text, '''', '''''', [rfReplaceAll])) + '%'')';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;

  if sdqConsulta.IsEmpty then
    InfoHint(nil, 'No existen datos para esta selección.');
end;

procedure TfrmAgendaTelefonica.FSFormShow(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  sSql :=
    'SELECT cse.se_descripcion' +
  	 ' FROM use_usuarios use, computos.cse_sector cse' +
	  ' WHERE use.se_idsector = cse.se_id' +
  	  ' AND use.se_usuario = ' + SqlValue(Sesion.UserID);
  edSector.Text := ValorSql(sSql);
  RefreshData;
  edSector.Text := '';
  edNombre.SetFocus;
end;

procedure TfrmAgendaTelefonica.FormCreate(Sender: TObject);
begin
  inherited;

  ClearData;
end;

procedure TfrmAgendaTelefonica.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(Grid);
  Width := Min(GetColumnWidths(Grid, True), Screen.Width);
end;

end.
