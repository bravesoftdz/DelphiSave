unit unManRDO_DOCUMENTO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, DBIncrementalSearch,
  unArtFrame, unFraCodigoDescripcion, unArtDBAwareFrame;

type
  TfrmManRDO_DOCUMENTO = class(TfrmCustomGridABM)
    dbisBusqueda: TDBIncrementalSearch;
    Label1: TLabel;
    edDO_DESCRIPCION: TEdit;
    Label2: TLabel;
    fraDO_SECTOR: TfraCodigoDescripcion;
    edDO_CODIGO: TPatternEdit;
    Label3: TLabel;
    chkIncapacidad: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

var
  frmManRDO_DOCUMENTO: TfrmManRDO_DOCUMENTO;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unSesion, StrFuncs,
  unConstantArchivo, VCLExtra, General;

{$R *.DFM}

procedure TfrmManRDO_DOCUMENTO.ClearControls;
begin
  VCLExtra.LockControl(edDO_CODIGO, False);

  edDO_CODIGO.Clear;
  edDO_DESCRIPCION.Clear;
  fraDO_SECTOR.Clear;
  chkIncapacidad.Checked := False;
end;

function TfrmManRDO_DOCUMENTO.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('TD_ID', 	    sdqConsulta.FieldByName('TD_ID').AsInteger);
    Sql.Fields.Add('TD_USUBAJA', 	    Sesion.UserID);
    Sql.Fields.Add('TD_FECHABAJA',    exDateTime);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('TD_ID', 	  GetSecNextVal('seq_rtd_id'));
      Sql.Fields.Add('TD_USUALTA', 	  Sesion.UserID);
      Sql.Fields.Add('TD_FECHAALTA',  exDateTime);
    end
    else
    begin
      Sql.PrimaryKey.Add('TD_ID', 		sdqConsulta.FieldByName('TD_ID').AsInteger);
      Sql.Fields.Add('TD_USUMODIF', 	Sesion.UserID);
      Sql.Fields.Add('TD_FECHAMODIF', exDateTime);
      Sql.Fields.Add('TD_USUBAJA', 		exNull);
      Sql.Fields.Add('TD_FECHABAJA', 	exNull);
    end;
    Sql.Fields.Add('TD_CODIGO', 		  Trim(edDO_CODIGO.Text));
    Sql.Fields.Add('TD_DESCRIPCION',  Trim(edDO_DESCRIPCION.Text));
    Sql.Fields.Add('TD_SECTOR',       fraDO_SECTOR.Codigo);
    Sql.Fields.Add('TD_INCAPACIDAD', 	String(Iif(chkIncapacidad.Checked, 'S', 'N')));
  end;

  Result := inherited DoABM;
end;

procedure TfrmManRDO_DOCUMENTO.LoadControls;
begin
  VCLExtra.LockControl(edDO_CODIGO);

  edDO_CODIGO.Text       := sdqConsulta.FieldByName('TD_CODIGO').AsString;
  edDO_DESCRIPCION.Text  := sdqConsulta.FieldByName('TD_DESCRIPCION').AsString;
  fraDO_SECTOR.Codigo    := sdqConsulta.FieldByName('TD_SECTOR').AsString;
  chkIncapacidad.Checked := (sdqConsulta.FieldByName('TD_INCAPACIDAD').AsString = 'S');
end;

function TfrmManRDO_DOCUMENTO.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(IsEmptyString(edDO_CODIGO.Text), edDO_CODIGO, 'Debe ingresar el código del documento.');
  Verificar(Trim(edDO_CODIGO.Text) = CODDOC_LOTE, edDO_CODIGO, 'Este código de documento se encuentra reservado.');
  Verificar(IsEmptyString(edDO_DESCRIPCION.Text), edDO_DESCRIPCION, 'Debe ingresar la descripción del documento.');

  if ModoAbm = maAlta then
    begin
      sSql := 'SELECT 1 ' +
                'FROM RTD_TIPODOCUMENTO ' +
               'WHERE TD_CODIGO = :Codigo';
      Verificar(ExisteSqlEx(sSql, [Trim(edDO_CODIGO.Text)]), edDO_CODIGO, 'El código que desea dar de alta ya existe.');
    end;

  Result := True;
end;

procedure TfrmManRDO_DOCUMENTO.FormCreate(Sender: TObject);
begin
  Self.Width := Self.Width + 1;   // sinó, hay un problema con los botones de la toolbar, que cambian su funcionalidad al no estar maximizada la pantalla...

  inherited;

  Sql.TableName := 'RTD_TIPODOCUMENTO';
  FieldBaja     := 'FECHABAJA';

  with fraDO_SECTOR do
  begin
    TableName   := 'USC_SECTORES';
    FieldId     := 'SC_CODIGO';
    FieldCodigo := 'SC_CODIGO';
    FieldDesc   := 'SC_DESCRIPCION';
    FieldBaja   := 'SC_FECHABAJA';
  end;
end;

procedure TfrmManRDO_DOCUMENTO.RefreshData;
begin
  inherited;
end;

end.
