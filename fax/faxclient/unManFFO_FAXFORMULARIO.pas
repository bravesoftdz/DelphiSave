
{********************************************************}
{                                                        }
{    Mantenimiento de Formularios de Fax                 }
{    Este mantenimiento asocia un código o númeor de     }
{    formulario con la descripción del mismo.            }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha:  10/2003                                     }
{                                                        }
{********************************************************}

unit unManFFO_FAXFORMULARIO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, Mask, PatternEdit, IntEdit;

type
  TfrmManFFO_FAXFORMULARIO = class(TfrmCustomGridABM)
    edFO_ID: TIntEdit;
    Label1: TLabel;
    Label2: TLabel;
    edFO_DESCRIPCION: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbPropiedadesClick(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs, VCLExtra,
  unConsulta;

{$R *.DFM}

{ TfrmManFFO_FAXFORMULARIO }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFO_FAXFORMULARIO.ClearControls;
begin
  VclExtra.LockControl(edFO_ID, False);
  edFO_ID.Clear;
  edFO_DESCRIPCION.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManFFO_FAXFORMULARIO.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.PrimaryKey.Add('FO_ID', edFO_ID.Value);
  Sql.Fields.Add('FO_DESCRIPCION', edFO_DESCRIPCION.Text);
  case ModoABM of
    maAlta:
    begin
      Sql.Fields.Add('FO_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('FO_FECHAALTA', exDateTime);
    end;
    maBaja:
    begin
      Sql.Fields.Add('FO_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('FO_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end;
    maModificacion:
    begin
      Sql.Fields.Add('FO_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('FO_FECHAMODIF', exDateTime);
      Sql.Fields.Add('FO_USUBAJA', exNull);
      Sql.Fields.Add('FO_FECHABAJA', exNull);
    end;
  end;

  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFO_FAXFORMULARIO.LoadControls;
begin
  VclExtra.LockControl(edFO_ID, True);
  edFO_ID.Value         := sdqConsulta.FieldByName('FO_ID').AsInteger;
  edFO_DESCRIPCION.Text := sdqConsulta.FieldByName('FO_DESCRIPCION').AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManFFO_FAXFORMULARIO.Validar: Boolean;
begin
  Result := False;
  if edFO_ID.Value = 0 Then
    InvalidMsg(edFO_ID, 'Debe ingresar el Código de Formulario')
  else if IsEmptyString(edFO_DESCRIPCION.Text) Then
    InvalidMsg(edFO_DESCRIPCION, 'Debe ingresar la Descripción del Formulario')
  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFO_FAXFORMULARIO.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'FO_FECHABAJA';
  Sql.TableName := 'FFO_FAXFORMULARIO';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFO_FAXFORMULARIO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.ActManFormulario.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFO_FAXFORMULARIO.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  with TfrmConsulta.Create(Self) do
    try
      sdqConsulta.Sql.Text := 'SELECT SE_USUARIO "Código", SE_NOMBRE "Apellido y Nombre" ' +
                                'FROM FFU_FORMULARIOUSUARIO, USE_USUARIOS ' +
                               'WHERE FU_USUARIO = SE_USUARIO ' +
                                 'AND FU_FECHABAJA IS NULL ' +
                                 'AND SE_FECHABAJA IS NULL ' +
                                 'AND FU_IDFORMULARIO = ' + Self.sdqConsulta.FieldByName('FO_ID').AsString; { No quitar el Self }
      RefreshData;
      ShowModal;
    finally
      Free;
    end;
end;

end.
