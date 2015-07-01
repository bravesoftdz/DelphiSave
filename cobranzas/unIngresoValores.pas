
{********************************************************}
{                                                        }
{    Cobranzas, Ingreso de Valores                       }
{                                                        }
{    Autor: Federico Firenze                             }
{    Análisis: Sebastián Gabrielli                       }
{    Fecha: 11/2003                                      }
{    Proyectos: Cobranzas                                }
{                                                        }
{********************************************************}

unit unIngresoValores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FSForm, ShortCutControl, ComCtrls, ToolWin,
  StdCtrls, CurrEdit, ToolEdit, DateComboBox, Mask, PatternEdit, unArtFrame, unFraStaticCodigoDescripcion,
  unfraAGC_GESTORCUENTA, unArtDBAwareFrame, ExtCtrls, unArt;

type
  TfrmIngresoValores = class(TFSForm)
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    ToolButton3: TToolButton;
    tbLimpiar: TToolButton;
    tbGuardar: TToolButton;
    tbSalir: TToolButton;
    tbSeparador: TToolButton;
    ShortCutControl: TShortCutControl;
    fraVA_IDGESTORCUENTA: TfraAGC_GESTORCUENTA;
    Label1: TLabel;
    fraVA_IDBANCO: TfraStaticCodigoDescripcion;
    Label2: TLabel;
    edVA_NROCHEQUE: TPatternEdit;
    Label3: TLabel;
    edVA_VENCIMIENTO: TDateComboBox;
    edVA_IMPORTE: TCurrencyEdit;
    Label4: TLabel;
    Label5: TLabel;
    chkVA_NEGOCIABLE: TCheckBox;
    rgTipoValor: TRadioGroup;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormCreate(Sender: TObject);
    procedure rgTipoValorClick(Sender: TObject);
  end;


implementation

uses
  AnsiSql, SqlFuncs, CustomDlgs, unPrincipal, unDmPrincipal, VclExtra, unCobranzas;

{$R *.DFM}

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
{ TfrmIngresoValores }
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
procedure TfrmIngresoValores.tbLimpiarClick(Sender: TObject);
begin
  fraVA_IDGESTORCUENTA.Clear;
  fraVA_IDBANCO.Clear;
  edVA_NROCHEQUE.Clear;
  edVA_VENCIMIENTO.Clear;
  edVA_IMPORTE.Clear;
  chkVA_NEGOCIABLE.Checked := False;
  rgTipoValor.ItemIndex := 0;   // Cheque
end;

procedure TfrmIngresoValores.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmIngresoValores.tbGuardarClick(Sender: TObject);
var
  bEsCheque: Boolean;
  IdTipoValor: TTableId;
  Sql: TSql;
begin
  Verificar(not Is_AperturaCajaIngrTesoreria(), nil, 'La fecha de la caja de tesorería es anterior a la actual.');

  Verificar(fraVA_IDGESTORCUENTA.IsEmpty, fraVA_IDGESTORCUENTA.edCodigo, 'El estudio es obligatorio.');

  bEsCheque := (rgTipoValor.ItemIndex = 0);  // Cheque

  if bEsCheque then
  begin
    Verificar(fraVA_IDBANCO.IsEmpty, fraVA_IDBANCO.edCodigo, 'El banco es obligatorio.');
    Verificar(edVA_NROCHEQUE.Text = '', edVA_NROCHEQUE, 'El número de cheque es obligatorio.');
    Verificar(edVA_VENCIMIENTO.Date = 0, edVA_VENCIMIENTO, 'La fecha del cheque es obligatoria.');
    Verificar(ExisteSQLEx('SELECT 1' +
                           ' FROM ZVA_VALOR' +
                          ' WHERE VA_NROCHEQUE = :p1' +
                            ' AND VA_IDBANCO = :p2', [edVA_NROCHEQUE.Text, fraVA_IDBANCO.Value]), edVA_NROCHEQUE, 'El cheque ya ha sido asignado.');
  end;

  Verificar(edVA_IMPORTE.Value = 0, edVA_IMPORTE, 'El importe es obligatorio.');

  Sql := TSql.Create('ZVA_VALOR');
  try
    Sql.PrimaryKey.Add('VA_ID',         'SEQ_ZVA_ID.NEXTVAL', False);
    Sql.Fields.Add('VA_IDGESTORCUENTA', fraVA_IDGESTORCUENTA.Value);

    if bEsCheque then
    begin
      Sql.Fields.Add('VA_IDBANCO',     fraVA_IDBANCO.Value);
      Sql.Fields.Add('VA_NROCHEQUE',   edVA_NROCHEQUE.Text);
      Sql.Fields.Add('VA_VENCIMIENTO', edVA_VENCIMIENTO.Date);
      Sql.Fields.Add('VA_NEGOCIABLE',  chkVA_NEGOCIABLE.Checked);
      IdTipoValor := 3;   // Cheque
    end
    else
      IdTipoValor := 1;     // Efectivo

    Sql.Fields.AddExtended('VA_IMPORTE',        edVA_IMPORTE.Value, ALL_DECIMALS, False);
    Sql.Fields.AddExtended('VA_IMPOSINIMPUTAR', edVA_IMPORTE.Value, ALL_DECIMALS, False);
    Sql.Fields.Add('VA_IDTIPOVALOR',            IdTipoValor);
    Sql.Fields.Add('VA_IDCONCEPTOVALOR',        1);
    Sql.Fields.Add('VA_ESTADO',                 '01');
    Sql.Fields.Add('VA_USUALTA',                frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('VA_FECHAALTA',              'ACTUALDATE', False);

    EjecutarSql(Sql.InsertSql);

    MsgBox('Los datos se guardaron correctamente.', MB_ICONINFORMATION);
    tbLimpiarClick(nil);
    fraVA_IDGESTORCUENTA.edCodigo.SetFocus;
  finally
    Sql.Free;
  end;
end;

procedure TfrmIngresoValores.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuIngresosdeValores.Enabled := True;
end;

procedure TfrmIngresoValores.FSFormCreate(Sender: TObject);
begin
  with fraVA_IDBANCO do
  begin
    TableName   := 'ZBA_BANCO';
    FieldId     := 'BA_ID';
    FieldCodigo := 'BA_CODIGO';
    FieldDesc   := 'BA_NOMBRE';
    FieldBaja   := 'BA_FECHABAJA';
  end;

  rgTipoValorClick(nil);
end;

procedure TfrmIngresoValores.rgTipoValorClick(Sender: TObject);
var
  bDeshabilitarCheque: Boolean;
begin
  bDeshabilitarCheque := (rgTipoValor.ItemIndex = 1);  // Efectivo

  VclExtra.LockControls([fraVA_IDBANCO, edVA_NROCHEQUE, edVA_VENCIMIENTO, chkVA_NEGOCIABLE], bDeshabilitarCheque);

  if bDeshabilitarCheque then
  begin
    fraVA_IDBANCO.Clear;
    edVA_NROCHEQUE.Clear;
    edVA_VENCIMIENTO.Clear;
    chkVA_NEGOCIABLE.Checked := False;
  end;
end;

end.
