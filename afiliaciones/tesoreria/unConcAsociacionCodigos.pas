unit unConcAsociacionCodigos;

{********************************************************}
{                                                        }
{    Asociación de Códigos                               }
{    Utilizado desde la unit unConciliacionBancaria      }
{                                                        }
{    Autor: Federico Firenze                             }
{    Análisis: Sebastián Gabrielli                       }
{    Fecha: 11/2003                                      }
{    Proyectos: Afiliaciones(Tesorería)                  }
{                                                        }
{********************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, unFraCodigoDescripcion, unArtDBAwareFrame;

type
  TfrmConcAsociacionCodigos = class(TfrmCustomGridABM)
    Label1: TLabel;
    edEB_CODOPERACION: TEdit;
    Label2: TLabel;
    edEB_DESCRIPCION: TEdit;
    Label3: TLabel;
    fraCE_TIPO: TfraStaticCTB_TABLAS;
    Label4: TLabel;
    fraCE_IDCODIGOCONC: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
  private
    procedure OnfraCE_TIPOChange(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    procedure RefreshData; override;
  end;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmConcAsociacionCodigos }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConcAsociacionCodigos.ClearControls;
begin
  { Para que no de un Hint por no implementar el métod abstracto }
end;

function TfrmConcAsociacionCodigos.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'OCE_CODIGOEXTRACTO';
  Sql.PrimaryKey.Add('CE_ID', 'SEQ_OCE_ID.NEXTVAL', False);
  Sql.Fields.Add('CE_CODIGO', sdqConsulta.FieldByName('EB_CODOPERACION').AsString);
  Sql.Fields.Add('CE_DESCRIPCION', sdqConsulta.FieldByName('EB_DESCRIPCION').AsString);
  Sql.Fields.Add('CE_IDCODIGOCONC', fraCE_IDCODIGOCONC.Value);
  Sql.SqlType := stInsert;

  Result := inherited DoABM;

  if sdqConsulta.IsEmpty Then
    ModalResult := mrOk;
end;

procedure TfrmConcAsociacionCodigos.LoadControls;
begin
  edEB_CODOPERACION.Text := sdqConsulta.FieldByName('EB_CODOPERACION').AsString;
  edEB_DESCRIPCION.Text  := sdqConsulta.FieldByName('EB_DESCRIPCION').AsString;
  fraCE_TIPO.Clear;
  fraCE_IDCODIGOCONC.Clear;
end;

procedure TfrmConcAsociacionCodigos.RefreshData;
begin
  inherited; {Para que el método sea visible}

  if sdqConsulta.IsEmpty then
    ModalResult := mrOk;
end;

function TfrmConcAsociacionCodigos.Validar: Boolean;
begin
  Result := False;
  if fraCE_TIPO.IsEmpty Then
    InvalidMsg(fraCE_TIPO.edCodigo, 'El Grupo es Obligatorio.')

  else if fraCE_IDCODIGOCONC.IsEmpty then
    InvalidMsg(fraCE_IDCODIGOCONC.edCodigo, 'El Subgrupo es Obligatorio.')

  else
    Result := True;
end;

procedure TfrmConcAsociacionCodigos.FormCreate(Sender: TObject);
begin
  inherited;

  with fraCE_TIPO do
  begin
    Clave := 'CEBCO';
    OnChange := OnfraCE_TIPOChange;
  end;

  with fraCE_IDCODIGOCONC do
  begin
    TableName   := 'OCO_CODIGOCONCILIACION';
    FieldID     := 'CO_ID';
    FieldCodigo := 'CO_CODIGO';
    FieldDesc   := 'CO_DESCRIPCION';
    FieldBaja   := 'CO_FECHABAJA';
  end;
end;

procedure TfrmConcAsociacionCodigos.OnfraCE_TIPOChange(Sender: TObject);
var
  sExtraCondition: String;
begin
  if fraCE_TIPO.IsEmpty then
    sExtraCondition := ' AND 1=2 '
  else
    sExtraCondition := ' AND CO_GRUPO = ' + SqlValue(fraCE_TIPO.Value) + ' ';

  if fraCE_IDCODIGOCONC.ExtraCondition <> sExtraCondition then
  begin
    fraCE_IDCODIGOCONC.ExtraCondition := sExtraCondition;
    fraCE_IDCODIGOCONC.Clear;
  end;
end;

end.
