
{********************************************************}
{                                                        }
{    Contaduría, Mantenimiento de Tipos de Valores       }
{                                                        }
{    Autor: Federico Firenze                             }
{    Análisis: Sebastián Gabrielli                       }
{    Fecha: 11/2003                                      }
{    Proyectos: Afiliaciones(Tesorería)                  }
{                                                        }
{********************************************************}

unit unManOTV_TIPOVALOR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, Mask, PatternEdit;

type
  TfrmManOTV_TIPOVALOR = class(TfrmCustomGridABM)
    Label3: TLabel;
    edTV_DESCRIPCION: TEdit;
    Label4: TLabel;
    edTV_CUENTACONTABLE: TPatternEdit;
    chkTV_MODIFICABLE: TCheckBox;
    chkTV_BOLETADEPOSITO: TCheckBox;
    Label1: TLabel;
    edTV_CODIGO: TEdit;
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmManOTV_TIPOVALOR: TfrmManOTV_TIPOVALOR;  

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, StrFuncs, Printers,
  unSesion;

{$R *.DFM}


{ TfrmManOTV_TIPOVALOR }

procedure TfrmManOTV_TIPOVALOR.ClearControls;
begin
  edTV_DESCRIPCION.Clear;
  edTV_CUENTACONTABLE.Clear;
  chkTV_MODIFICABLE.Checked := False;
  chkTV_BOLETADEPOSITO.Checked := False;
end;

function TfrmManOTV_TIPOVALOR.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maAlta Then
  begin
    Sql.PrimaryKey.Add('TV_ID', 'SEQ_OTV_ID.NEXTVAL', False);
    Sql.Fields.Add('TV_CODIGO', edTV_CODIGO.Text);
    Sql.Fields.Add('TV_DESCRIPCION', edTV_DESCRIPCION.Text);
    Sql.Fields.Add('TV_CUENTACONTABLE', edTV_CUENTACONTABLE.Text);
    Sql.Fields.Add('TV_MODIFICABLE', chkTV_MODIFICABLE.Checked);
    Sql.Fields.Add('TV_BOLETADEPOSITO', chkTV_BOLETADEPOSITO.Checked);
    Sql.Fields.Add('TV_USUALTA', Sesion.UserId);
    Sql.Fields.Add('TV_FECHAALTA', exDateTime);
  end
  else
  if ModoABM = maBaja Then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('TV_ID', sdqConsulta.FieldByName('TV_ID').AsInteger);
    Sql.Fields.Add('TV_USUBAJA', Sesion.UserId);
    Sql.Fields.Add('TV_FECHABAJA', exDateTime);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManOTV_TIPOVALOR.LoadControls;
begin
  { No esta permitido modificar registros en este ABM, este método está definido para que no produzca un Hint }
end;

function TfrmManOTV_TIPOVALOR.Validar: Boolean;
begin
  Result := False;

  if IsEmptyString(edTV_CODIGO.Text) Then
    InvalidMsg(edTV_CODIGO, 'El código es obligatorio.')

  else if IsEmptyString(edTV_DESCRIPCION.Text) Then
    InvalidMsg(edTV_DESCRIPCION, 'La descripción es obligatoria.')

  else
    Result := True;
end;

procedure TfrmManOTV_TIPOVALOR.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'OTV_TIPOVALOR';
  FieldBaja := 'TV_FECHABAJA';
end;

end.
