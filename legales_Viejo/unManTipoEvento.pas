unit unManTipoEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, ExComboBox, General, Mask, PatternEdit,
  ComboEditor, CheckCombo;

type
  TFrmManTipoEvento = class(TfrmCustomGridABM)
    edDescripcion: TEdit;
    lblDescripcion: TLabel;
    chkGeneraAlerta: TCheckBox;
    Label1: TLabel;
    cmbEtapa: TCheckCombo;
    cbVisibleWeb: TCheckBox;
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
  FrmManTipoEvento: TFrmManTipoEvento;

implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

{$R *.dfm}

{ TfrmCustomGridABM1 }

procedure TFrmManTipoEvento.ClearControls;
begin
  inherited;
  edDescripcion.Text := '';
  chkGeneraAlerta.Checked := false;
  cmbEtapa.ClearChecks;
  cbVisibleWeb.Checked := False;
end;

function TFrmManTipoEvento.DoABM: Boolean;
var
  i : Integer;
  etapa : String;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('TE_ID', sdqConsulta.FieldByName('TE_ID').AsInteger);
    Sql.Fields.Add('TE_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('TE_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('TE_DESCRIPCION', edDescripcion.Text);
//    Sql.Fields.Add('TE_GENERAALARMA', chkGeneraAlerta.Checked);
    etapa := '';
    if cbVisibleWeb.Checked then
      Sql.Fields.Add('TE_VISIBLEWEB', 'S')
    else
      Sql.Fields.Add('TE_VISIBLEWEB', 'N');

    for i := 0 to cmbEtapa.Items.Count-1 do
    begin
      if cmbEtapa.Checked[i] then
        etapa := etapa + String(cmbEtapa.Items[i][1]);
    end;
    Sql.Fields.AddString('TE_ETAPA', etapa);
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('TE_ID', GetSecNextVal('LEGALES.SEQ_LTE_ID') );
      Sql.Fields.Add('TE_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('TE_FECHAALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('TE_ID', sdqConsulta.FieldByName('TE_ID').AsInteger);
      Sql.Fields.Add('TE_USUMODIF', Sesion.LoginName );
      Sql.Fields.Add('TE_FECHAMODIF', exDateTime );
      Sql.Fields.Add('TE_USUBAJA', exNull );
      Sql.Fields.Add('TE_FECHABAJA', exNull );
    end;
  end;
  Result := inherited DoABM;
end;


procedure TFrmManTipoEvento.LoadControls;
var
  i : Integer;
begin
  inherited;
  with sdqConsulta do
  begin
    edDescripcion.Text          := FieldByName('TE_DESCRIPCION').AsString;
    chkGeneraAlerta.Checked := (FieldByName('TE_GENERAALARMA').AsString='S');
    cbVisibleWeb.Checked := (FieldByName('TE_VISIBLEWEB').AsString='S');
    for i := 0 to cmbEtapa.Items.Count-1 do
    begin
      cmbEtapa.Checked[i] := InStr(FieldByName('TE_ETAPA').AsString,cmbEtapa.Items[i][1]) >0;
    end;
  end;
end;

function TFrmManTipoEvento.Validar: Boolean;
begin
  Result := true;
  VerificarMultiple(['Guardando Tipo Evento',
                      edDescripcion, not IsEmptyString(edDescripcion.text), 'Debe seleccionar una descripción para el Tipo Evento.',
                      cmbEtapa, cmbEtapa.CheckedCount <> 0, 'Debe seleccionar una etapa para el Tipo Evento.']);
end;



procedure TFrmManTipoEvento.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'TE_FECHABAJA';
  Sql.TableName := 'LEGALES.LTE_TIPOEVENTO';
  cmbEtapa.Items.AddObject('Juicio Demandada',nil );
  cmbEtapa.Items.AddObject('Actora',nil );
  cmbEtapa.Items.AddObject('Sumario',nil);
  cmbEtapa.Items.AddObject('Mediación',nil);
end;

end.
