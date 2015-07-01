unit unGeneracionOPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraCodDesc, StdCtrls, Mask, Buttons, PatternEdit, IntEdit, ToolEdit,
  DateComboBox, ExtCtrls, Placemnt;

type
  TfrmGeneracionOPagos = class(TForm)
    Label72: TLabel;
    Label73: TLabel;
    Bevel9: TBevel;
    Label76: TLabel;
    Bevel1: TBevel;
    Label77: TLabel;
    dcFEmisionOP: TDateComboBox;
    dcFVenciOP: TDateComboBox;
    gbCantCopiasOP: TGroupBox;
    Label74: TLabel;
    Label75: TLabel;
    edCantRecOP: TIntEdit;
    edCantLiqOP: TIntEdit;
    btnCerrarOP: TBitBtn;
    btnAceptarOP: TBitBtn;
    edCuitPagueseOP: TMaskEdit;
    edEmpresaPagueseOP: TEdit;
    edChequeOP: TEdit;
    GroupBox6: TGroupBox;
    rbVPreviaOP: TRadioButton;
    rbImpresionOP: TRadioButton;
    rbChequeOP1: TRadioButton;
    rbChequeOP2: TRadioButton;
    fraChequeOP: TfraCodDesc;
    FormStorage: TFormStorage;
    procedure btnAceptarOPClick(Sender: TObject);
    procedure rbChequeOP1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSiniestro, FOrden, FRecaida, FNumLiq :Integer;
    FEstado, FCuit, FEmpresa: String;
    procedure Do_GetIdBancoYMetodoPago(var sIdBanco: string; var sMetodoPago: string);   // TK 49105
  public
    procedure DoCargarDatos;

    property Siniestro: Integer     Read FSiniestro       Write FSiniestro;
    property Orden: Integer         Read FOrden           Write FOrden;
    property Recaida: Integer       Read FRecaida         Write FRecaida;
    property NumLiq: Integer        Read FNumLiq          Write FNumLiq;
    property Estado: String         Read FEstado          Write FEstado;
    property Cuit: String           Read FCuit            Write FCuit;
    property Empresa: String        Read FEmpresa         Write FEmpresa;

  end;

var
  frmGeneracionOPagos: TfrmGeneracionOPagos;

implementation

uses VCLExtra, unRptLiqOtrosConceptos, General, unDmPrincipal, CustomDlgs,
  unSesion, SqlFuncs, AnsiSql, unRptReciboOtrosConceptos, unClassLiquidacion,
  unSiniestros, unComunes, unTesoreria;

const cSECTOR_LIQUIDACIONES = 'LIQUI';
      cSECTOR_REINTPRESTMED = 'REINTPM';

{$R *.dfm}
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionOPagos.DoCargarDatos;
var sIdBanco, sMetodoPago: string;
begin
  LockControls([rbChequeOP1, rbChequeOP2, edChequeOP, fraChequeOP],
               Not(AreIn(Estado, ['C', 'M']))); //se bloquea si la liquidacion no está pendiente

  edCuitPagueseOP.Text    := Cuit;
  edEmpresaPagueseOP.Text := Empresa;

  fraChequeOP.Clear;
  edChequeOP.Clear;
  fraChequeOP.Codigo      := ValorSqlEx('SELECT pr_idchequenombre ' +
                                         ' FROM spr_pagoexpesin ' +
                                        ' WHERE pr_siniestro = :Siniestro ' +
                                          ' AND pr_orden = :Orden ' +
                                          ' AND pr_recaida = :Recaida ' +
                                          ' AND pr_numpago = :NroLiquidacion ',
                                        [Siniestro, Orden, Recaida, NumLiq]);
  if fraChequeOP.IsSelected then
    rbChequeOP2.Checked := True
  else begin
    rbChequeOP1.Checked := True;
    edChequeOP.Text     := ValorSqlEx('SELECT pr_chequenombre ' +
                                       ' FROM spr_pagoexpesin ' +
                                      ' WHERE pr_siniestro = :Siniestro ' +
                                        ' AND pr_orden = :Orden ' +
                                        ' AND pr_recaida = :Recaida ' +
                                        ' AND pr_numpago = :NroLiquidacion ',
                                       [Siniestro, Orden, Recaida, NumLiq]);

    if (edChequeOP.Text = '') then
    begin
      Do_GetIdBancoYMetodoPago(sIdBanco, sMetodoPago);
      if (sMetodoPago = 'TR') and (sIdBanco = '6') then     // TK 49105
        edChequeOP.Text := 'BANCO DE LA NACION ARGENTINA'
      else
        edChequeOP.Text := Empresa;
    end;

  //  if edChequeOP.Text = '' then edChequeOP.Text := Empresa;    // esto es lo que hacía antes del TK 49105

  end;
  dcFEmisionOP.Date := DBDate;
  dcFVenciOP.Date   := DBDate + 32;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionOPagos.btnAceptarOPClick(Sender: TObject);
var
  sSql, sIdBanco, sMetodoPago :String;
  sCheque: String;
begin
  Verificar((edCantRecOP.Value = 0) and (edCantLiqOP.Value = 0), gbCantCopiasOP,
            'Ambas cantidades no pueden ser 0.');
  Verificar(rbChequeOP2.Checked and fraChequeOP.IsEmpty, fraChequeOP, 'Debe seleccionar un beneficiario.');

  Do_GetIdBancoYMetodoPago(sIdBanco, sMetodoPago);    // TK 49105

  if (sMetodoPago = 'TR') and (sIdBanco = '6') then   // TK 49105
    sCheque := 'BANCO DE LA NACION ARGENTINA'
  else
    sCheque := IIF(rbChequeOP1.Checked, edChequeOP.Text, fraChequeOP.Descripcion);


 // sCheque := IIF(rbChequeOP1.Checked, edChequeOP.Text, fraChequeOP.Descripcion);


  if (edCantLiqOP.Value > 0) then
    with TqrLiqOtrosConceptos.Create(Self) do
      Preparar(Siniestro, Orden, Recaida, NumLiq, edCantLiqOP.Value, sCheque,
               IIF(rbVPreviaOP.Checked, srPreview, srPrint));

  if (edCantRecOP.Value > 0) then
    with TqrReciboOtrosConceptos.Create(Self) do
      Preparar(Siniestro, Orden, Recaida, NumLiq, edCantRecOP.Value,
               IIF(rbVPreviaOP.Checked, srPreview, srPrint));

  sSql := 'UPDATE spr_pagoexpesin ' +
             'SET pr_femision = Actualdate, ' +
                ' pr_fvencimi = ' + SqlDate(dcFVenciOP.Date) + ',' +
                ' pr_chequenombre = ' + SqlValue(sCheque) + ',' +
                ' pr_idchequenombre = ' + SqlInt(fraChequeOP.ID, True) + ',' +
                ' pr_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                ' pr_fmodif = Actualdate ' +
          ' WHERE pr_siniestro = ' + SqlInt(Siniestro) +
            ' AND pr_orden = ' + SqlInt(Orden) +
            ' AND pr_recaida = ' + SqlInt(Recaida) +
            ' AND pr_numpago = ' + SqlInt(NumLiq);

  if InTransaction then
    EjecutarSqlST(sSql)
  else
    EjecutarSql(sSql);

  ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionOPagos.rbChequeOP1Click(Sender: TObject);
begin
  fraChequeOP.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionOPagos.FormCreate(Sender: TObject);
var sSectorUsu, sSql: string;
begin
  sSectorUsu := ValorSqlEx('SELECT se_sector FROM art.use_usuarios ' +
                           ' WHERE se_usuario = :usu ', [Sesion.UserID]);
  if (sSectorUsu = cSECTOR_LIQUIDACIONES) or (sSectorUsu = cSECTOR_REINTPRESTMED) then      // TK 42504 y 43369
    sSql := ' AND an_areaperteneciente = ''L'' '
  else
    sSql := ' AND an_areaperteneciente = ''D'' ';

  fraChequeOP.Propiedades.ExtraCondition := sSql;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionOPagos.Do_GetIdBancoYMetodoPago(var sIdBanco, sMetodoPago: string);    // TK 49105
var sSqlAux: string;
begin
  sSqlAux := 'SELECT PR_IDBANCO, pr_metodopago FROM spr_pagoexpesin ' +
             ' WHERE pr_siniestro = :sini ' +
               ' AND pr_orden = :orden ' +
               ' AND pr_recaida = :reca ' +
               ' AND pr_numpago = :num ';

  with GetQueryEx(sSqlAux, [Siniestro, Orden, Recaida, NumLiq]) do
  try
    sIdBanco    := FieldByName('PR_IDBANCO').AsString;
    sMetodoPago := FieldByName('pr_metodopago').AsString;
  finally
    Free;
  end;
end;

end.

