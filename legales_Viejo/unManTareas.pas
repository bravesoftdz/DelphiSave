unit unManTareas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManTareas = class(TfrmCustomGridABM)
    edDescripcion: TEdit;
    lblDescripcion: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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


implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;
{$R *.dfm}

{ TfrmManTareas }

procedure TfrmManTareas.ClearControls;
begin
  inherited;
  edDescripcion.Text := '';
end;

function TfrmManTareas.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('TT_ID', sdqConsulta.FieldByName('TT_ID').AsInteger);
    Sql.Fields.Add('TT_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('TT_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('TT_DESCRIPCION', edDescripcion.Text);
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('TT_ID', GetSecNextVal('LEGALES.SEQ_LRC_ID'));
      Sql.Fields.Add('TT_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('TT_FECHAALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('TT_ID', sdqConsulta.FieldByName('TT_ID').AsInteger);
      Sql.Fields.Add('TT_USUMODIF', Sesion.LoginName );
      Sql.Fields.Add('TT_FECHAMODIF', exDateTime );
      Sql.Fields.Add('TT_USUBAJA', exNull );
      Sql.Fields.Add('TT_FECHABAJA', exNull );
    end;
  end;
  Result := inherited DoABM;
end;

procedure TfrmManTareas.LoadControls;
begin
  inherited;
  with sdqConsulta do
  begin
    edDescripcion.Text          := FieldByName('TT_DESCRIPCION').AsString;
  end;
end;

function TfrmManTareas.Validar: Boolean;
begin
  Result := True;
  VerificarMultiple(['Guardando Reclamo',
                      edDescripcion, not IsEmptyString(edDescripcion.text), 'Debe Seleccionar una Descripción para el Reclamo.']);
end;

procedure TfrmManTareas.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'TT_FECHABAJA';
  Sql.TableName := 'LEGALES.LTT_TIPOTAREA';
  CheckPK := True;
end;

procedure TfrmManTareas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
