unit unManVigenciaOperativo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  PatternEdit, ComboEditor, ExComboBox, IntEdit;

type
  TfrmManVigenciaOperativo = class(TfrmCustomGridABM)
    lbOperativo: TLabel;
    Vigencia: TGroupBox;
    Label1: TLabel;
    edVigenciaDesde: TDateComboBox;
    Label2: TLabel;
    edVigenciaHasta: TDateComboBox;
    lbTipo: TLabel;
    cbTipo: TExComboBox;
    edOperativo: TIntEdit;
    edMuestra: TIntEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmManVigenciaOperativo: TfrmManVigenciaOperativo;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, AnsiSQL,CustomDlgs, StrFuncs;

{ TfrmManEventosAccidente }

procedure TfrmManVigenciaOperativo.ClearControls;
begin
  inherited;
  edOperativo.Clear;
  cbTipo.ItemIndex := -1;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
  edMuestra.Clear;
  VCLExtra.LockControls([edOperativo,cbTipo,edVigenciaDesde], false);
end;

function TfrmManVigenciaOperativo.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    Sql.Fields.Add('VO_OPERATIVO', edOperativo.Text);
    Sql.Fields.Add('VO_TIPO', cbTipo.Value);
    Sql.Fields.Add('VO_VIGENCIADESDE', edVigenciaDesde.Date);
    Sql.Fields.Add('VO_VIGENCIAHASTA', edVigenciaHasta.Date);
    Sql.Fields.Add('VO_MUESTRA', edMuestra.Text);

    if ModoABM = maAlta Then
    begin
      Sql.SqlType := stInsert;
      iIdCodigo := ValorSqlInteger(
        ' SELECT MAX(vo_id) + 1 '+
        '   FROM hys.hvo_vigenciaoperativo ');
    end else begin
      Sql.SqlType := stUpdate;
      iIdCodigo := sdqConsulta.FieldByName('vo_id').AsInteger;
    end;

    Sql.PrimaryKey.Add('vo_id', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManVigenciaOperativo.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'HYS.hvo_vigenciaoperativo';
end;

procedure TfrmManVigenciaOperativo.LoadControls;
begin
  inherited;
  ClearControls;
  VCLExtra.LockControls([edOperativo,cbTipo,edVigenciaDesde], true);
  edOperativo.Text := sdqConsulta.FieldByName('VO_OPERATIVO').AsString;
  cbTipo.Value := sdqConsulta.FieldByName('VO_TIPO').AsString;
  edVigenciaDesde.Date := sdqConsulta.FieldByName('VO_VIGENCIADESDE').AsDateTime;
  edVigenciaHasta.Date := sdqConsulta.FieldByName('VO_VIGENCIAHASTA').AsDateTime;
  edMuestra.Text := sdqConsulta.FieldByName('VO_MUESTRA').AsString;
end;

function TfrmManVigenciaOperativo.Validar: Boolean;
begin
  Result := True;
  Verificar(edOperativo.Text = '', edOperativo, 'No puede estar vacio el campo operativo');

  if ModoABM = maAlta Then
  begin
    Verificar((cbTipo.Value = 'CO') or (cbTipo.Value = 'GB'), cbTipo, 'Solo se puede dar de alta EP, ET o EAS.');
    Verificar(edVigenciaDesde.Date = 0, edVigenciaDesde,'No puede estar vacía la fecha de vigencia.');
    Verificar(ExisteSql(
              ' SELECT 1 '+
              '   FROM hys.hvo_vigenciaoperativo '+
              '  WHERE VO_OPERATIVO ='+ SqlValue(edOperativo.Text)+
              '    AND VO_TIPO = '+ SqlValue(cbTipo.Value)),edOperativo,'Ya existe el operativo y tipo cargados.');
  end;
  if edVigenciaHasta.Date <> 0 then
    Verificar(edVigenciaDesde.Date > edVigenciaHasta.Date, edVigenciaHasta, 'La vigencia hasta debe ser mayor a la vigencia desde.');

  Verificar(((cbTipo.Value = 'EP') or (cbTipo.Value = 'ET'))and edMuestra.IsEmpty,edMuestra,'Se debe indicar una muestra.');


end;



end.
