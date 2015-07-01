unit unManOCO_CODIGOCONCILIACION;

{********************************************************}
{                                                        }
{    Contaduría,                                         }
{    Mantenimiento de Códigos de Conciliación Bancaria   }
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
  unFraStaticCTB_TABLAS, Mask, PatternEdit, unArtDBAwareFrame;

type
  TfrmManOCO_CODIGOCONCILIACION = class(TfrmCustomGridABM)
    fraCO_GRUPO: TfraStaticCTB_TABLAS;
    Label1: TLabel;
    Label2: TLabel;
    edCO_CODIGO: TPatternEdit;
    edCO_DESCRIPCION: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edCO_CUENTACONTABLE: TPatternEdit;
    Label5: TLabel;
    fraCO_TIPOCONC: TfraStaticCTB_TABLAS;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmManOCO_CODIGOCONCILIACION: TfrmManOCO_CODIGOCONCILIACION;  

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, StrFuncs,
  unSesion;

{$R *.DFM}

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
{ TfrmManOCO_CODIGOCONCILIACION }
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
procedure TfrmManOCO_CODIGOCONCILIACION.ClearControls;
begin
  fraCO_GRUPO.Clear;
  edCO_CODIGO.Clear;
  edCO_DESCRIPCION.Clear;
  edCO_CUENTACONTABLE.Clear;
  fraCO_TIPOCONC.Clear;
end;

function TfrmManOCO_CODIGOCONCILIACION.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maAlta then
  begin
    Sql.PrimaryKey.Add('CO_ID', 'SEQ_OCO_ID.NEXTVAL', False);
    Sql.Fields.Add('CO_GRUPO', fraCO_GRUPO.Value);
    Sql.Fields.Add('CO_CODIGO', edCO_CODIGO.Text);
    Sql.Fields.Add('CO_DESCRIPCION', edCO_DESCRIPCION.Text);
    Sql.Fields.Add('CO_CUENTACONTABLE', edCO_CUENTACONTABLE.Text);
    Sql.Fields.Add('CO_TIPOCONC', fraCO_TIPOCONC.Value);
    Sql.Fields.Add('CO_USUALTA', Sesion.UserId);
    Sql.Fields.Add('CO_FECHAALTA', exDateTime);
  end
  else if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('CO_ID', sdqConsulta.FieldByName('CO_ID').AsInteger);
    Sql.Fields.Add('CO_USUBAJA', Sesion.UserId);
    Sql.Fields.Add('CO_FECHABAJA', exDateTime);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManOCO_CODIGOCONCILIACION.LoadControls;
begin
  { No esta permitido modificar registros en este ABM, este método está definido para que no produzca un Hint }

  {
  fraCO_GRUPO.Value        := sdqConsulta.FieldByName('CO_GRUPO').AsString;
  edCO_CODIGO.Text         := sdqConsulta.FieldByName('CO_CODIGO').AsString;
  edCO_DESCRIPCION.Text    := sdqConsulta.FieldByName('CO_DESCRIPCION').AsString;
  edCO_CUENTACONTABLE.Text := sdqConsulta.FieldByName('CO_CUENTACONTABLE').AsString;
  fraCO_TIPOCONC.Value     := sdqConsulta.FieldByName('CO_TIPOCONC').AsString;
  }
end;

function TfrmManOCO_CODIGOCONCILIACION.Validar: Boolean;
begin
  Verificar(fraCO_GRUPO.IsEmpty, fraCO_GRUPO.edCodigo, 'El grupo es obligatorio.');
  Verificar(edCO_CODIGO.Text = '', edCO_CODIGO, 'El código es obligatorio.');
  Verificar(ExisteSql('SELECT 1 FROM OCO_CODIGOCONCILIACION ' +
                       'WHERE CO_CODIGO = ' + SqlValue(edCO_CODIGO.Text)),
            edCO_CODIGO, 'Existe un registro con el mismo código.');
  Verificar(IsEmptyString(edCO_DESCRIPCION.Text), edCO_DESCRIPCION, 'La descripción es obligatoria.');
  Verificar(fraCO_TIPOCONC.IsEmpty, fraCO_TIPOCONC.edCodigo, 'El tipo es obligatorio.');

  Result := True;
end;

procedure TfrmManOCO_CODIGOCONCILIACION.FormCreate(Sender: TObject);
begin
  inherited;
  
  Sql.TableName := 'OCO_CODIGOCONCILIACION';
  FieldBaja := 'CO_FECHABAJA';

  fraCO_GRUPO.Clave := 'CEBCO';
  fraCO_TIPOCONC.Clave := 'TCBAN';
end;

end.
