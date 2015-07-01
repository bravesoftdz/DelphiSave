unit unManParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unFraCodigoDescripcion, unfraCtbTablas, Mask, PatternEdit,
  unArtDBAwareFrame;

type
  TFrmManParametros = class(TfrmCustomGridABM)
    lblCodigo: TLabel;
    edParaCodigo: TPatternEdit;
    lblDescripcion: TLabel;
    edParaDescripcion: TEdit;
    fraParaTipoDato: TfraCtbTablas;
    lblTipoDato: TLabel;
    lblValorActual: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    DefParamEditor: TWinControl;
    procedure OnFraTipoDatoParametroChange(Sender: TObject);

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
  FrmManParametros: TFrmManParametros;

implementation

uses unCustomConsulta, unDmPrincipal, unPrincipal,
     unSesion, CustomDlgs, SqlFuncs, General, StrFuncs, unParams;

{$R *.dfm}

{ TFrmManParametros }

procedure TFrmManParametros.ClearControls;
begin
  inherited;
  edParaCodigo.Text := '';
  edParaDescripcion.Text := '';
  fraParaTipoDato.Codigo := '';

end;

function TFrmManParametros.DoABM: Boolean;
begin
    Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('PA_ID', sdqConsulta.FieldByName('PA_ID').AsInteger);
    Sql.Fields.Add('PA_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('PA_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('PA_DESCRIPCION', edParaDescripcion.Text);
    Sql.Fields.Add('PA_TIPOPARAMETRO', fraParaTipoDato.Value);
    Sql.Fields.Add('PA_VALOR',GetParamEditorValue(DefParamEditor));

    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('PA_ID', GetSecNextVal('LEGALES.SEQ_LPA_ID'));
      Sql.Fields.Add('PA_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('PA_FECHAALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('PA_ID', sdqConsulta.FieldByName('PA_ID').AsInteger);
      Sql.Fields.Add('PA_USUMODIF', Sesion.LoginName);
      Sql.Fields.Add('PA_FECHAMODIF', exDateTime );
      Sql.Fields.Add('PA_USUBAJA', exNull );
      Sql.Fields.Add('PA_FECHABAJA', exNull );
    end;
  end;
  Result := inherited DoABM;
end;

procedure TFrmManParametros.LoadControls;
begin
  inherited;
  edParaCodigo.Text        := sdqConsulta.FieldByName('PA_CLAVE').AsString;
  edParaDescripcion.Text   := sdqConsulta.FieldByName('PA_DESCRIPCION').AsString;
  fraParaTipoDato.Value    := sdqConsulta.FieldByName('PA_TIPOPARAMETRO').AsString;
  OnFraTipoDatoParametroChange(Nil);
  SetParamEditorValue(DefParamEditor, sdqConsulta.FieldByName('PA_VALOR').AsString);
end;

function TFrmManParametros.Validar: Boolean;
begin
  Result := true;
  VerificarMultiple(['Mantenimiento de Parámetros',
                    edParaCodigo, not IsEmptyString(edParaCodigo.Text), 'Debe ingresar el Código del Parámetro',
                    fraParaTipoDato, fraParaTipoDato.IsSelected, 'Debe seleccionar el Tipo de Dato']);
end;

procedure TFrmManParametros.FormCreate(Sender: TObject);
begin
  inherited;
  fraParaTipoDato.Clave := 'TDAT';
  fraParaTipoDato.OnChange := OnFraTipoDatoParametroChange;
  FieldBaja := 'PA_FECHABAJA';
  Sql.TableName := 'LEGALES.LPA_PARAMETRO';
end;

procedure TFrmManParametros.OnFraTipoDatoParametroChange(Sender: TObject);
var
  AClass: TWinControlClass;
begin
  if fraParaTipoDato.IsSelected Then
  begin
    AClass := GetParamEditorClass(fraParaTipoDato.Value);
    if (DefParamEditor = nil) or (DefParamEditor.ClassType <> AClass) then
    begin
      DefParamEditor.Free;
      DefParamEditor := AClass.Create(Self);
      with DefParamEditor do
      begin
        Left := 104;
        Top := 94;
        Parent := fpAbm;
        TabOrder := fraParaTipoDato.TabOrder + 1;
      end;
      ParamInitializeEditor(DefParamEditor, '', edParaDescripcion.Width);
    end;
  end;
end;



procedure TFrmManParametros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
