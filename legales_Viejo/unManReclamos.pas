unit unManReclamos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, AnsiSql, General;

type
  TfrmManReclamos = class(TfrmCustomGridABM)
    edDescripcion: TEdit;
    lblDescripcion: TLabel;
    chkReclamaIncapacidad: TCheckBox;
    gbPerfil: TGroupBox;
    chkDemandada: TCheckBox;
    chkActora: TCheckBox;
    chkMediacion: TCheckBox;
    procedure FormCreate(Sender: TObject);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

{$R *.dfm}

{----------------------------------------------------------------------------------------------------------------------}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManReclamos.ClearControls;
begin
  inherited;
  edDescripcion.Text := '';
  chkReclamaIncapacidad.Checked := false;
  chkDemandada.Checked := false;
  chkActora.Checked := false;
  chkMediacion.Checked := false;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManReclamos.DoABM: Boolean;
var
  sPerfil: String;
begin
  Sql.Clear;

  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('RC_ID', sdqConsulta.FieldByName('RC_ID').AsInteger);
    Sql.Fields.Add('RC_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('RC_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('RC_DESCRIPCION', edDescripcion.Text);
    Sql.Fields.Add ('RC_RECLAMAINCAPACIDAD', String(iif(chkReclamaIncapacidad.Checked, 'S', 'N')));
    sPerfil := '';
    if chkDemandada.Checked then
      sPerfil := 'J';
    if chkActora.Checked then
      sPerfil := sPerfil + 'A';
    if chkMediacion.Checked then
      sPerfil := sPerfil + 'M';
    Sql.Fields.Add('RC_ETAPA', sPerfil);

    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('RC_ID', GetSecNextVal('LEGALES.SEQ_LRC_ID') );
      Sql.Fields.Add('RC_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('RC_FECHAALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('RC_ID', sdqConsulta.FieldByName('RC_ID').AsInteger );
      Sql.Fields.Add('RC_USUMODIF', Sesion.LoginName );
      Sql.Fields.Add('RC_FECHAMODIF', exDateTime );
      Sql.Fields.Add('RC_USUBAJA', exNull );
      Sql.Fields.Add('RC_FECHABAJA', exNull );
    end;
  end;
  Result := inherited DoABM;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManReclamos.LoadControls;
begin
  inherited;
  with sdqConsulta do
  begin
    edDescripcion.Text            :=  FieldByName('RC_DESCRIPCION').AsString;
    chkReclamaIncapacidad.Checked := (FieldByName('RC_RECLAMAINCAPACIDAD').AsString='S');
    chkDemandada.Checked := Pos('J', FieldByName('rc_etapa').AsString) > 0;
    chkActora.Checked := Pos('A', FieldByName('rc_etapa').AsString) > 0;
    chkMediacion.Checked := Pos('M', FieldByName('rc_etapa').AsString) > 0;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManReclamos.Validar: Boolean;
begin
  Result := True;
  VerificarMultiple(['Guardando Reclamo',
                      edDescripcion, not IsEmptyString(edDescripcion.text), 'Debe Seleccionar una Descripción para el Reclamo.']);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManReclamos.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'RC_FECHABAJA';
  Sql.TableName := 'LEGALES.LRC_RECLAMO';
  CheckPK := True;
end;
{----------------------------------------------------------------------------------------------------------------------}

end.

