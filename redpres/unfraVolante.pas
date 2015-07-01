{-----------------------------------------------------------------------------
  Procedure: edNumeroKeyPress
  Author:    ...
  Date:
  Arguments: Sender: TObject; var Key: Char
  Result:    None
  Modif.     15/05/2002
             Ejv. Se agregan tres columnas VO_MONTOPERCEPCION, VO_MONTODEBITO, VO_OBSERVACIONDEBITO
-----------------------------------------------------------------------------}
{ SVO_VOLANTES }
unit unfraVolante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Db, SDEngine, AnsiSql, ToolEdit, CurrEdit,
  IntEdit, PatternEdit;

type
  TCalcAPagar = (caNone, cnSiniestro, cnGenerico, cnAMP, cnMixto);
  TfraVolantes = class(TFrame)
    Label1: TLabel;
    Label4: TLabel;
    lbPrestIdentif: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    mskPrestCUIT: TMaskEdit;
    edPrestRSocial: TEdit;
    Label2: TLabel;
    edFacTipo: TEdit;
    edFacEstab: TEdit;
    edFacNro: TEdit;
    Label3: TLabel;
    edFecha: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edEstado: TEdit;
    Label9: TLabel;
    edObservaciones: TMemo;
    sdqBusqueda: TSDQuery;
    edPrestSecuencia: TEdit;
    sdqBusquedaVO_VOLANTE: TFloatField;
    sdqBusquedaCA_CLAVE: TStringField;
    sdqBusquedaCA_DESCRIPCION: TStringField;
    sdqBusquedaCA_SECUENCIA: TFloatField;
    sdqBusquedaCA_IDENTIFICADOR: TFloatField;
    sdqBusquedaVO_FACTURATIPO: TStringField;
    sdqBusquedaVO_FACTURAESTABLE: TStringField;
    sdqBusquedaVO_FACTURANRO: TStringField;
    sdqBusquedaVO_FECHAFACTURA: TDateTimeField;
    sdqBusquedaVO_MONTO: TFloatField;
    sdqBusquedaVO_VENCIMIENTO: TDateTimeField;
    sdqBusquedaVO_OBSERVACIONES: TStringField;
    sdqBusquedaVO_ESTADO: TStringField;
    sdqBusquedaESTADO: TStringField;
    sdqBusquedaVO_FACPEN: TFloatField;
    sdqBusquedaDIFERENCIA: TFloatField;
    sdqBusquedaVO_USUAPRO: TStringField;
    sdqBusquedaVO_FECHAPRO: TDateTimeField;
    edTotFact: TCurrencyEdit;
    edNumero: TIntEdit;
    sdqBusquedaVO_AJUSTE: TFloatField;
    edPrestIdentif: TIntEdit;
    Label10: TLabel;
    edVO_MONTOPERCEPCION: TCurrencyEdit;
    edVO_MONTODEBITO: TCurrencyEdit;
    Label11: TLabel;
    Label12: TLabel;
    edVO_OBSERVACIONDEBITO: TMemo;
    sdqBusquedaVO_MONTOPERCEPCION: TFloatField;
    sdqBusquedaVO_MONTODEBITO: TFloatField;
    chContratoART: TCheckBox;
    chContratoMutual: TCheckBox;
    sdqBusquedaCA_CONTRATO: TStringField;
    sdqBusquedaCA_CONTRATOMUTUAL: TStringField;
    Label13: TLabel;
    Label14: TLabel;
    sdqBusquedaVO_OBSERVACIONDEBITO: TStringField;
    sdqBusquedaVO_NOREQUIEREAUDI: TStringField;
    sdqBusquedaVO_AUDITADO: TStringField;
    chMixto: TCheckBox;
    Label15: TLabel;
    sdqBusquedaVO_MIXTO: TStringField;
    sdqBusquedaVO_ESTADOPEND: TStringField;
    procedure edNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure edNumeroExit(Sender: TObject);
  private
    FLastVolante : Integer;
    FOnChange    : TNotifyEvent;
    FEstado      : String;
    FEstadoPend  : String;   // 21282
    FAutoFoco    : Boolean;
    FCalcAPagar  : TCalcAPagar;
    FTemporal: Boolean;
  public
    FacPen  : Currency; // Extended
    Ajuste  : Integer;
    procedure Limpiar;
    procedure Cargar(iVolante : Integer);
    constructor Create(AOwner: TComponent); override;
    Property OnChange   : TNotifyEvent read FOnChange   write FOnChange;
    Property Estado     : String       read FEstado;
    Property EstadoPend : String       read FEstadoPend; 
    Property AutoFoco   : Boolean      read FAutoFoco   write FAutoFoco;
    property CalcAPagar : TCalcAPagar  read FCalcAPagar write FCalcAPagar default caNone;
    property Temporal   : Boolean      read FTemporal   write FTemporal;
    Procedure Refrescar;
    function CheckInput : Boolean;
  end;

implementation

uses unDmPrincipal, General;


{$R *.DFM}

{ TfraVolantes }
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraVolantes.Create(AOwner: TComponent);
begin
  inherited;
  FTemporal := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraVolantes.Cargar(iVolante: Integer);
var
  Sql, sqlSin, sqlGen, sqlAMP, sDebitar :String;
begin
  if iVolante > 0 then
     Sql := 'SELECT vo_volante, ca_clave, ca_descripcion, ca_secuencia, ca_identificador, ' +
                  ' ca_contrato, ca_contratomutual, vo_facturatipo, vo_facturaestable, ' +
                  ' vo_facturanro, vo_fechafactura,  vo_monto, vo_vencimiento, vo_observaciones, ' +
                  ' vo_estado, tb_descripcion estado, vo_facpen, vo_usuapro, vo_fechapro, vo_ajuste, ' +
                  '((vo_monto - vo_montopercepcion - vo_montodebito ) - vo_facpen) diferencia, ' +
                  ' vo_montopercepcion, vo_montodebito, vo_observaciondebito, vo_norequiereaudi, ' +
                  ' vo_auditado, vo_mixto, vo_estadopend ' +     // TK 21282
            ' FROM cpr_prestador, ctb_tablas, ' + IIF(FTemporal, 'TMP_', '') + 'svo_volantes ' +
           ' WHERE vo_prestador = ca_identificador(+) ' +
             ' AND tb_clave(+) = ''MUVOL'' ' +
             ' AND tb_codigo(+) = vo_estado ' +
             ' AND vo_volante = ' + SqlInt(iVolante);

   OpenQuery(sdqBusqueda, Sql, True);
   if sdqBusqueda.IsEmpty then
   begin
     Limpiar;
   end
   else begin
     FLastVolante          := sdqBusquedaVO_VOLANTE.AsInteger;
     edNumero.Text         := sdqBusquedaVO_VOLANTE.AsString;
     // -- Carga el Prestador --------------------------------------
     mskPrestCUIT.Text        := sdqBusquedaCA_CLAVE.AsString;
     edPrestIdentif.Text      := sdqBusquedaCA_IDENTIFICADOR.AsString;
     edPrestSecuencia.Text    := sdqBusquedaCA_SECUENCIA.AsString;
     edPrestRSocial.Text      := sdqBusquedaCA_DESCRIPCION.AsString;
     chContratoART.Checked    := IIF(sdqBusquedaCA_CONTRATO.AsString='S', True, False);
     chContratoMutual.Checked := IIF(sdqBusquedaCA_CONTRATOMUTUAL.AsString='S', True, False);
     chMixto.Checked          := IIF(sdqBusquedaVO_MIXTO.AsString='S', True, False);
     // -- Carga la Factura ----------------------------------------
     edFacTipo.Text        := sdqBusquedaVO_FACTURATIPO.AsString;
     edFacEstab.Text       := sdqBusquedaVO_FACTURAESTABLE.AsString;
     edFacNro.Text         := sdqBusquedaVO_FACTURANRO.AsString;
     edFecha.Text          := sdqBusquedaVO_FECHAFACTURA.AsString;
     edTotFact.Value       := sdqBusquedaVO_MONTO.AsCurrency;
     edEstado.Text         := sdqBusquedaESTADO.AsString;
     edObservaciones.Text  := sdqBusquedaVO_OBSERVACIONES.AsString;

     FacPen                := sdqBusquedaVO_FACPEN.AsCurrency; //Value;
     FEstado               := sdqBusquedaVO_ESTADO.AsString;
     FEstadoPend           := sdqBusquedaVO_ESTADOPEND.AsString;   // TK 21282
// Ejv 15/05/2002
     edVO_MONTOPERCEPCION.Value := sdqBusquedaVO_MONTOPERCEPCION.AsCurrency;
     edVO_MONTODEBITO.Value     := sdqBusquedaVO_MONTODEBITO.AsCurrency;
     edVO_OBSERVACIONDEBITO.Text:= sdqBusquedaVO_OBSERVACIONDEBITO.AsString;
// Fin.
     // ------------------------------------------------------------
     if chMixto.Checked then FCalcAPagar := cnMixto;
     Ajuste := sdqBusquedaVO_AJUSTE.AsInteger;
     if sdqBusquedaVO_AJUSTE.IsNull then
     begin
        edFacTipo.Font.Color  := clWindowText;
        edFacEstab.Font.Color := clWindowText;
        edFacNro.Font.Color   := clWindowText;
     end
     else begin
        edFacTipo.Font.Color  := clRed;
        edFacEstab.Font.Color := clRed;
        edFacNro.Font.Color   := clRed;
     end;
     // ------------------------------------------------------------
     sqlGen := 'SELECT sum(vg_imppagconret) ' +
                ' FROM svg_vol_generico ' +
               ' WHERE vg_estado <> ''X'' ' +
                 ' AND vg_volante = :vol ';
     sqlSin := 'SELECT sum(iv_imppagconret) ' +
                ' FROM siv_itemvolante ' +
               ' WHERE iv_estado NOT IN (''X'',''Z'')' +
                 ' AND iv_volante = :vol ';
     sqlAMP := 'SELECT NVL(SUM(if_cantaprobados * if_valoraprobados), 0) ' +
                ' FROM sif_itemfacturaamp ' +
               ' WHERE if_fechabaja IS NULL ' +
                 ' AND if_cantaprobados IS NOT NULL ' +
                 ' AND if_estado NOT IN(''X'', ''Z'') ' +
                 ' AND if_idvolante = :idvolante';
     // ------------------------------------------------------------
     if (FEstado = 'P') then
     begin
       edEstado.Text := edEstado.Text + ' ($ ' + FloatToStr( sdqBusquedaDIFERENCIA.AsCurrency ) + ')';
       if FCalcAPagar = cnMixto then
         edEstado.Text := edEstado.Text + ' [A Pagar: $' + FloatToStr(ValorSqlExtendedEx(sqlSin, [edNumero.Value]) +
                                                                      ValorSqlExtendedEx(sqlGen, [edNumero.Value])) + ']'
       else if FCalcAPagar = cnSiniestro then
         edEstado.Text := edEstado.Text + ' [A Pagar: $' + FloatToStr(ValorSqlExtendedEx(sqlSin, [edNumero.Value])) + ']'
       else if FCalcAPagar = cnGenerico then
         edEstado.Text := edEstado.Text + ' [A Pagar: $' + FloatToStr(ValorSqlExtendedEx(sqlGen, [edNumero.Value])) + ']';
     end
     else if (FEstado = 'PM') then
     begin
      edEstado.Text := edEstado.Text + ' ($ ' + FloatToStr(sdqBusquedaDIFERENCIA.AsCurrency ) + ')';
      if FCalcAPagar = cnGenerico then
        edEstado.Text := edEstado.Text + ' [A Pagar: $' + FloatToStr(ValorSqlExtendedEx(sqlGen, [edNumero.Value])) + ']'
      else if FCalcAPagar = cnAMP then
        edEstado.Text := edEstado.Text + ' [A Pagar: $' + FloatToStr(ValorSqlExtendedEx(sqlAMP, [edNumero.Value])) + ']';

      sDebitar := FloatToStr(ValorSqlExtendedEx('SELECT amebpba.imp_negativo_amp(:volante) FROM DUAL', [edNumero.Value]) +
                             ValorSqlExtendedEx('SELECT amebpba.imp_negativo_gen(:volante) FROM DUAL', [edNumero.Value]));
     edEstado.Text := edEstado.Text + ' [A Debitar: $ ' + sDebitar + ']';
     end
   end;
   // ---- [ Si esta refrescando no llama al OnChange ]-------------------
   if (iVolante > 0) then
      if Assigned(FOnChange) then
         OnChange(Self);
   //---------------------------------------------------------------------
   sdqBusqueda.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraVolantes.Limpiar;
begin
   FLastVolante                := -1;
   edNumero.Text               := '';
   mskPrestCUIT.Text           := '';
   edPrestIdentif.Text         := '';
   edPrestSecuencia.Text       := '';
   edPrestRSocial.Text         := '';
   edFacTipo.Text              := '';
   edFacEstab.Text             := '';
   edFacNro.Text               := '';
   edFecha.Text                := '__/__/____';
   edTotFact.Value             := 0;
   edEstado.Text               := '';
   edObservaciones.Text        := '';
   FacPen                      := 0;
   Ajuste                      := 0;
   chContratoART.Checked       := False;
   chContratoMutual.Checked    := False;
   chMixto.Checked             := False;
   edVO_OBSERVACIONDEBITO.Text := '';
   edVO_MONTOPERCEPCION.Clear;
   edVO_MONTODEBITO.Clear;
   sdqBusqueda.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraVolantes.edNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if edNumero.Value = 0 then
      Limpiar
    else begin
      Cargar(edNumero.Value);
      edNumero.SelectAll;
      //----------------------------------------------------------------------
      if (edNumero.Text <> '') and FAutoFoco then // Pasa el Foco
        SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraVolantes.Refrescar;
begin
  Cargar( -1 );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraVolantes.edNumeroExit(Sender: TObject);
begin
  if edNumero.Value = 0 then
    Limpiar
  else if FLastVolante <> edNumero.Value then
    Cargar(edNumero.Value);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraVolantes.CheckInput : Boolean;
begin
   if (FLastVolante > 0) and (FLastVolante <> edNumero.Value) then
   begin
     Cargar(edNumero.Value);
     Result := False;
   end else
     Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
