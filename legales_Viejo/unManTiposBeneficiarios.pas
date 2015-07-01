unit unManTiposBeneficiarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManTiposBeneficiarios = class(TfrmCustomGridABM)
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

procedure TfrmManTiposBeneficiarios.ClearControls;
begin
  inherited;
  edDescripcion.Text := '';
end;

function TfrmManTiposBeneficiarios.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('BP_ID', sdqConsulta.FieldByName('BP_ID').AsInteger);
    Sql.Fields.Add('BP_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('BP_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('BP_DESCRIPCION', edDescripcion.Text);
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('BP_ID', GetSecNextVal('LEGALES.SEQ_LBP_ID'));
      Sql.Fields.Add('BP_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('BP_FECHAALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('BP_ID', sdqConsulta.FieldByName('BP_ID').AsInteger);
      Sql.Fields.Add('BP_USUMODIF', Sesion.LoginName );
      Sql.Fields.Add('BP_FECHAMODIF', exDateTime );
      Sql.Fields.Add('BP_USUBAJA', exNull );
      Sql.Fields.Add('BP_FECHABAJA', exNull );
    end;
  end;
  Result := inherited DoABM;
end;

procedure TfrmManTiposBeneficiarios.LoadControls;
begin
  inherited;
  with sdqConsulta do
  begin
    edDescripcion.Text := FieldByName('BP_DESCRIPCION').AsString;
  end;
end;

function TfrmManTiposBeneficiarios.Validar: Boolean;
begin
  Result := True;
  VerificarMultiple(['Guardando Tipo de Beneficiario',
                      edDescripcion, not IsEmptyString(edDescripcion.text), 'Debe Seleccionar una Descripción para el Tipo de Beneficiario.']);
end;

procedure TfrmManTiposBeneficiarios.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'BP_FECHABAJA';
  Sql.TableName := 'legales.lbp_beneficiariopago';
  CheckPK := True;
  tbNuevo.Visible := false;
end;

procedure TfrmManTiposBeneficiarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
