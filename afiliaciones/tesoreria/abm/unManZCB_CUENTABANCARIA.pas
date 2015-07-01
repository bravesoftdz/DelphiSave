
{********************************************************}
{                                                        }
{    Contaduría, Mantenimiento de Cuentas Bancarias      }
{                                                        }
{    Autor: Federico Firenze                             }
{    Análisis: Sebastián Gabrielli                       }
{    Fecha: 11/2003                                      }
{    Proyectos: Afiliaciones(Tesorería)                  }
{                                                        }
{********************************************************}

unit unManZCB_CUENTABANCARIA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unArtFrame, unFraStaticCodigoDescripcion, Mask,
  PatternEdit, unArtDBAwareFrame, RxPlacemnt;

type
  TfrmManZCB_CUENTABANCARIA = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraCB_IDBANCO: TfraStaticCodigoDescripcion;
    edCB_NUMERO: TPatternEdit;
    Label2: TLabel;
    edCB_SUCURSAL: TEdit;
    Label3: TLabel;
    chkCB_RECAUDADORAAFIP: TCheckBox;
    Label4: TLabel;
    edCB_CUENTACONTABLE: TPatternEdit;
    chkSLAP: TCheckBox;
    chkAcreedoresExigibles: TCheckBox;
    chkConciliacion: TCheckBox;
    lblCBU: TLabel;
    edCB_CBU1: TPatternEdit;
    lblSeparador: TLabel;
    edCB_CBU2: TPatternEdit;
    chkCB_INVERSIONES: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure edCB_CBU1Change(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmManZCB_CUENTABANCARIA: TfrmManZCB_CUENTABANCARIA;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, StrFuncs, VclExtra,
  unSesion, General;

{$R *.DFM}

procedure TfrmManZCB_CUENTABANCARIA.ClearControls;
begin
  fraCB_IDBANCO.Clear;
  edCB_NUMERO.Clear;
  edCB_CBU1.Clear;
  edCB_CBU2.Clear;
  edCB_SUCURSAL.Clear;
  chkCB_RECAUDADORAAFIP.Checked  := False;
  chkSLAP.Checked                := False;
  chkAcreedoresExigibles.Checked := False;
  chkConciliacion.Checked        := False;
  chkCB_INVERSIONES.Checked      := False;
  edCB_CUENTACONTABLE.Clear;

  VclExtra.LockControls([fraCB_IDBANCO, edCB_NUMERO], False);
end;

function TfrmManZCB_CUENTABANCARIA.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja Then
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('CB_ID',            sdqConsulta.FieldByName('CB_ID').AsInteger);
      Sql.Fields.Add('CB_USUBAJA',           Sesion.UserId);
      Sql.Fields.Add('CB_FECHABAJA',         exDateTime);
    end
  else
    begin
      if ModoABM = maAlta Then
        begin
          Sql.PrimaryKey.Add('CB_ID',        'SEQ_ZCB_ID.NEXTVAL', False);
          Sql.Fields.Add('CB_IDBANCO',       fraCB_IDBANCO.Value);
          Sql.Fields.Add('CB_NUMERO',        edCB_NUMERO.Text);
          Sql.Fields.Add('CB_USUALTA',       Sesion.UserId);
          Sql.Fields.Add('CB_FECHAALTA',     exDateTime);
        end
      else
        begin
          Sql.PrimaryKey.Add('CB_ID',        sdqConsulta.FieldByName('CB_ID').AsInteger);
          Sql.Fields.Add('CB_USUMODIF',      Sesion.UserId);
          Sql.Fields.Add('CB_FECHAMODIF',    exDateTime);
          Sql.Fields.Add('CB_USUBAJA',       exNull);
          Sql.Fields.Add('CB_FECHABAJA',     exNull);
        end;

      Sql.Fields.Add('CB_CBU1',              edCB_CBU1.Text);
      Sql.Fields.Add('CB_CBU2',              edCB_CBU2.Text);
      Sql.Fields.Add('CB_SUCURSAL',          edCB_SUCURSAL.Text);
      Sql.Fields.Add('CB_RECAUDADORAAFIP',   String(Iif(chkCB_RECAUDADORAAFIP.Checked, 'S', 'N')));
      Sql.Fields.Add('CB_SLAP',              String(Iif(chkSLAP.Checked, 'S', 'N')));
      Sql.Fields.Add('CB_ACREEDORES',        String(Iif(chkAcreedoresExigibles.Checked, 'S', 'N')));
      Sql.Fields.Add('CB_CUENTACONTABLE',    edCB_CUENTACONTABLE.Text);
      Sql.Fields.Add('CB_CONCILIACION',      String(Iif(chkConciliacion.Checked, 'S', 'N')));
      Sql.Fields.Add('CB_INVERSIONES',       String(Iif(chkCB_INVERSIONES.Checked, 'S', 'N')));
    end;

  Result := inherited DoABM;
end;

procedure TfrmManZCB_CUENTABANCARIA.LoadControls;
begin
  fraCB_IDBANCO.Value            := sdqConsulta.FieldByName('CB_IDBANCO').AsInteger;
  edCB_NUMERO.Text               := sdqConsulta.FieldByName('CB_NUMERO').AsString;
  edCB_CBU1.Text                 := sdqConsulta.FieldByName('CB_CBU1').AsString;
  edCB_CBU2.Text                 := sdqConsulta.FieldByName('CB_CBU2').AsString;
  edCB_SUCURSAL.Text             := sdqConsulta.FieldByName('CB_SUCURSAL').AsString;
  chkCB_RECAUDADORAAFIP.Checked  := (sdqConsulta.FieldByName('CB_RECAUDADORAAFIP').AsString = SQL_TRUE);
  chkSLAP.Checked                := (sdqConsulta.FieldByName('CB_SLAP').AsString = SQL_TRUE);
  chkAcreedoresExigibles.Checked := (sdqConsulta.FieldByName('CB_ACREEDORES').AsString = SQL_TRUE);
  edCB_CUENTACONTABLE.Text       := sdqConsulta.FieldByName('CB_CUENTACONTABLE').AsString;
  chkConciliacion.Checked        := (sdqConsulta.FieldByName('CB_CONCILIACION').AsString = SQL_TRUE);
  chkCB_INVERSIONES.Checked      := (sdqConsulta.FieldByName('CB_INVERSIONES').AsString = SQL_TRUE);

  VclExtra.LockControls([fraCB_IDBANCO, edCB_NUMERO], True);
end;

function TfrmManZCB_CUENTABANCARIA.Validar: Boolean;
begin
  Verificar(fraCB_IDBANCO.IsEmpty, fraCB_IDBANCO.edCodigo, 'El banco es obligatorio.');
  Verificar(edCB_NUMERO.Text = '', edCB_NUMERO, 'El número de cuenta es obligatorio.');

  if not IsEmptyString(edCB_CBU1.Text) or not IsEmptyString(edCB_CBU2.Text)then
    begin
      sSql := 'SELECT UTILES.ISCBUVALIDO(:bl1, :bl2) FROM DUAL';
      Verificar(ValorSqlEx(sSql, [edCB_CBU1.Text, edCB_CBU2.Text]) <> 'S', edCB_CBU1, 'El CBU es inválido.');
    end;

  Verificar((ModoABM = maAlta) and ExisteSQLEx('SELECT 1 FROM ZCB_CUENTABANCARIA WHERE CB_NUMERO = :NRO', [edCB_NUMERO.Text]), edCB_NUMERO, 'El número de cuenta bancaria no puede repetirse.');
  Verificar(edCB_SUCURSAL.Text = '', edCB_SUCURSAL, 'La sucursal es obligatoria.');

  Result := True;
end;

procedure TfrmManZCB_CUENTABANCARIA.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'ZCB_CUENTABANCARIA';
  FieldBaja     := 'CB_FECHABAJA';

  with fraCB_IDBANCO do
    begin
      TableName   := 'ZBA_BANCO';
      FieldID     := 'BA_ID';
      FieldCodigo := 'BA_CODIGO';
      FieldDesc   := 'BA_NOMBRE';
      FieldBaja   := 'BA_FECHABAJA';
    end;
end;

procedure TfrmManZCB_CUENTABANCARIA.edCB_CBU1Change(Sender: TObject);
begin
  if Length(edCB_CBU1.Text) = 8 then
    if edCB_CBU2.CanFocus then
      edCB_CBU2.SetFocus;
end;

end.

