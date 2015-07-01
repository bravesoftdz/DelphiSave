
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
  ComCtrls, ToolWin, Mask, PatternEdit, IntEdit, ImgList;

type
  TfrmManFFO_FAXFORMULARIO = class(TfrmCustomGridABM)
    edFO_ID: TIntEdit;
    Label1: TLabel;
    Label2: TLabel;
    edFO_DESCRIPCION: TEdit;
    ilByN: TImageList;
    ilColor: TImageList;
    chkBajas: TCheckBox;
    pnlTotal: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure chkBajasClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FSQL: String;
  protected
    procedure RefreshData; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmManFFO_FAXFORMULARIO: TfrmManFFO_FAXFORMULARIO;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs, VCLExtra,
  unConsulta, unSesion, General, unCustomConsulta;

{$R *.DFM}

{ TfrmManFFO_FAXFORMULARIO }

procedure TfrmManFFO_FAXFORMULARIO.ClearControls;
begin
  VclExtra.LockControl(edFO_ID, False);
  edFO_ID.Clear;
  edFO_DESCRIPCION.Clear;
end;

function TfrmManFFO_FAXFORMULARIO.DoABM: Boolean;
begin
  Sql.Clear;
  case ModoABM of
    maAlta:
    begin
      Sql.PrimaryKey.Add('FO_ID', edFO_ID.Value);
      Sql.Fields.Add('FO_DESCRIPCION', edFO_DESCRIPCION.Text);
      Sql.Fields.Add('FO_USUALTA', Sesion.UserID);
      Sql.Fields.Add('FO_FECHAALTA', exDateTime);
    end;
    maBaja:
    begin
      Sql.PrimaryKey.Add('FO_ID', sdqConsulta.FieldByName('FO_ID').AsInteger);
      Sql.Fields.Add('FO_USUBAJA', Sesion.UserID);
      Sql.Fields.Add('FO_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end;
    maModificacion:
    begin
      Sql.PrimaryKey.Add('FO_ID', edFO_ID.Value);
      Sql.Fields.Add('FO_DESCRIPCION', edFO_DESCRIPCION.Text);
      Sql.Fields.Add('FO_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('FO_FECHAMODIF', exDateTime);
      Sql.Fields.Add('FO_USUBAJA', exNull);
      Sql.Fields.Add('FO_FECHABAJA', exNull);
    end;
  end;

  Result := inherited DoABM;
end;

procedure TfrmManFFO_FAXFORMULARIO.LoadControls;
begin
  VclExtra.LockControl(edFO_ID, True);
  edFO_ID.Value         := sdqConsulta.FieldByName('FO_ID').AsInteger;
  edFO_DESCRIPCION.Text := sdqConsulta.FieldByName('FO_DESCRIPCION').AsString;
end;

function TfrmManFFO_FAXFORMULARIO.Validar: Boolean;
begin
  Verificar(edFO_ID.Value = 0, edFO_ID, 'Debe completar el código de formulario.');
  Verificar(IsEmptyString(edFO_DESCRIPCION.Text), edFO_DESCRIPCION, 'Debe completar la descripción del formulario.');
  Result := True;
end;

procedure TfrmManFFO_FAXFORMULARIO.FormCreate(Sender: TObject);
begin
  FSQL := sdqConsulta.SQL.Text;
  inherited;
  FieldBaja := 'FO_FECHABAJA';
  Sql.TableName := 'FFO_FAXFORMULARIO';
end;

procedure TfrmManFFO_FAXFORMULARIO.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  with TfrmConsulta.Create(Self) do
    try
      sdqConsulta.Sql.Text := 'SELECT SE_USUARIO "Código", SE_NOMBRE "Apellido y Nombre", FU_SOLOLECTURA "Sólo lectura" ' +
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

procedure TfrmManFFO_FAXFORMULARIO.RefreshData;
var
  sSQL: String;
begin
  sSQL := FSQL;
  if chkBajas.Checked then
    AddCondition(sSQL, ' FO_FECHABAJA IS NULL ');
  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited RefreshData; 
end;

procedure TfrmManFFO_FAXFORMULARIO.chkBajasClick(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmManFFO_FAXFORMULARIO.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pnlTotal.Caption := 'Total: ' + IntToStr(sdqConsulta.RecordCount);
end;

end.
