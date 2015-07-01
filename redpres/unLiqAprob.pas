unit unLiqAprob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, unfraVolante, StdCtrls, Grids, DBGrids, RXDBCtrl, Placemnt, Db,
  SDEngine, Buttons, General, Registros, artSeguridad, CustomDlgs, AnsiSql,
  ShortCutControl, SortDlg, Mask, ToolEdit, CurrEdit, IntEdit, FormPanel,
  PatternEdit {$IFNDEF VER130}, Variants{$ENDIF};

type
  TfrmLiquiAprob = class(TForm)
    grpVolante: TGroupBox;
    dbgDatos: TRxDBGrid;
    pnlBotones: TPanel;
    FormPlacement: TFormPlacement;
    pnlColores: TPanel;
    pnlColor5: TPanel;
    pnlColor4: TPanel;
    pnlColor3: TPanel;
    pnlColor2: TPanel;
    pnlColor1: TPanel;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    btnPedInfo: TSpeedButton;
    btnAprVolante: TSpeedButton;
    btnModificar: TSpeedButton;
    btnSalir: TSpeedButton;
    btnAprSiniestro: TSpeedButton;
    ColorDialog: TColorDialog;
    Seguridad: TSeguridad;
    btnColores: TSpeedButton;
    sdqTmpSIV: TSDQuery;
    fraVolantes: TfraVolantes;
    pnlColor6: TPanel;
    pnlDestino: TPanel;
    Label8: TLabel;
    edDestino: TEdit;
    btnCambDestino: TSpeedButton;
    ShortCutControl: TShortCutControl;
    pnlColor7: TPanel;
    btnOrden: TSpeedButton;
    SortDialog: TSortDialog;
    fpBonificacion: TFormPanel;
    lbProc: TLabel;
    Label1: TLabel;
    edBonifPrestador: TIntEdit;
    edBonifFactura: TCurrencyEdit;
    Bevel1: TBevel;
    btnBonifAceptar: TButton;
    btnBonifCancelar: TButton;
    Label2: TLabel;
    Label3: TLabel;
    sdqTmpSVG: TSDQuery;
    sdqTmpSVGVG_VOLANTE: TFloatField;
    sdqTmpSVGVG_NUMPAGO: TFloatField;
    sdqTmpSVGVG_CONPAGO: TFloatField;
    sdqTmpSVGVG_PRESTADESDE: TDateTimeField;
    sdqTmpSVGVG_PRESTAHASTA: TDateTimeField;
    sdqTmpSVGVG_PRES_NOMENCLADOR: TStringField;
    sdqTmpSVGVG_PRES_CAPITULO: TStringField;
    sdqTmpSVGVG_PRES_CODIGO: TStringField;
    sdqTmpSVGVG_PRESDET: TStringField;
    sdqTmpSVGVG_CANTIDAD: TFloatField;
    sdqTmpSVGVG_IMPFACTURADO: TFloatField;
    sdqTmpSVGVG_IMPCONVENIDO: TFloatField;
    sdqTmpSVGVG_IMPPAGCONRET: TFloatField;
    sdqTmpSVGVG_OBSERVACIONES: TStringField;
    sdqTmpSVGVG_ESTADO: TStringField;
    sdqTmpSVGVG_USUALTA: TStringField;
    sdqTmpSVGVG_FECALTA: TDateTimeField;
    sdqTmpSVGVG_USUMODIF: TStringField;
    sdqTmpSVGVG_FECMODIF: TDateTimeField;
    sdqTmpSVGVG_CANTAPRO: TFloatField;
    sdqTmpSVGVG_MOTIVO: TStringField;
    btnAprConcepto: TSpeedButton;
    pnlColor8: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pnlColorClick(Sender: TObject);
    procedure dbgDatosGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                    var Background: TColor; Highlight: Boolean);
    procedure btnSalirClick(Sender: TObject);
    procedure btnPedInfoClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnModificarClick(Sender: TObject);
    procedure btnAprSiniestroClick(Sender: TObject);
    procedure btnAprVolanteClick(Sender: TObject);
    procedure btnColoresClick(Sender: TObject);
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X, Y: Integer;
                           State: TDragState; var Accept: Boolean);
    procedure FormDockDrop(Sender: TObject; Source: TDragDockObject; X, Y: Integer);
    procedure dbgDatosDblClick(Sender: TObject);
    procedure FormGetSiteInfo(Sender: TObject; DockClient: TControl; var InfluenceRect: TRect;
                              MousePos: TPoint; var CanDock: Boolean);
    procedure btnCambDestinoClick(Sender: TObject);
    procedure SeguridadAfterExecute(Sender: TObject);
    procedure btnOrdenClick(Sender: TObject);
    procedure btnAprConceptoClick(Sender: TObject);
  private
    bAprobar : Boolean;
    sEstadoVol :String;
    procedure VolanteChange(Sender: TObject);
    function GetEstado : Integer;
    procedure MostrarNotaDeDebito;
    procedure AprobarRestoSIV;
    procedure AprobarRestoSVG;
    procedure ImprimirNotaDebito;
    procedure RefreshData;
    procedure BonificarFactura;
    procedure DoGenerarNotaDebito;
    procedure DoModificarSIV;
    procedure DoModificarGEN;
  public
  end;

var
  frmLiquiAprob: TfrmLiquiAprob;

implementation

uses unPrincipal, unPedidoInfo, unLiqCarga, unDmPrincipal, unLiqNotaDebito, unSesion,
     unRptNotaDebito, StrFuncs, Numeros, unArt{$IFDEF VER140}, Variants{$ENDIF},
     unLiqCargaGen, unComunes;

{$R *.DFM}
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuLiquiAprobacion.Enabled := True;
  //-------[ Guarda los Colores Seleccionados ]---------------------------------//
  SetRegFromValue(Self, pnlColor1.Hint, IntToStr(pnlColor1.Color));
  SetRegFromValue(Self, pnlColor2.Hint, IntToStr(pnlColor2.Color));
  SetRegFromValue(Self, pnlColor3.Hint, IntToStr(pnlColor3.Color));
  SetRegFromValue(Self, pnlColor4.Hint, IntToStr(pnlColor4.Color));
  SetRegFromValue(Self, pnlColor5.Hint, IntToStr(pnlColor5.Color));
  SetRegFromValue(Self, pnlColor6.Hint, IntToStr(pnlColor6.Color));
  SetRegFromValue(Self, pnlColor7.Hint, IntToStr(pnlColor7.Color));
  SetRegFromValue(Self, pnlColor8.Hint, IntToStr(pnlColor8.Color));  
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.VolanteChange(Sender: TObject);
var
  sMsg :String;
  bModificar :Boolean;
begin
  sEstadoVol := IIF(fraVolantes.sdqBusqueda.IsEmpty, '',fraVolantes.sdqBusquedaVO_ESTADO.AsString);

  if fraVolantes.sdqBusqueda.IsEmpty then
     sMsg := 'No se ha encontrado el volante.'

  else if AreIn(sEstadoVol, ['C', 'X']) then
     sMsg := 'El volante ha sido anulado.'

  else if AreIn(sEstadoVol, ['A', 'AP', 'AM']) then
     sMsg := 'La liquidación del volante ha sido aprobada por ' + fraVolantes.sdqBusquedaVO_USUAPRO.AsString +
            ' el día ' + fraVolantes.sdqBusquedaVO_FECHAPRO.AsString + '.'

  else if AreIn(sEstadoVol, ['E', 'EM', 'EG']) then
     sMsg := 'La liquidación del volante ha sido abonada.'

  else if not(AreIn(sEstadoVol, ['L', 'LM', 'LG'])) then
     sMsg := 'El volante seleccionado no fue liquidado en su totalidad.';

  //----------------------------------------------------------------------------
  if sMsg <> '' then
  begin
     InvalidMsg(fraVolantes.edNumero, sMsg, 'Error al buscar el volante...');
     sdqDatos.Close;
     fraVolantes.Limpiar;
     btnPedInfo.Enabled      := False;
     btnModificar.Enabled    := False;
     btnAprVolante.Enabled   := False;
  end
  else begin
     // Verifica si el usuario está habilitado para Aprobar y/o Modificar el Vol. Segun el Monto
     bAprobar   :=  IsInRange('P', fraVolantes.sdqBusquedaVO_MONTO.AsCurrency);
     bModificar :=  bAprobar or IsInRange('M', fraVolantes.sdqBusquedaVO_MONTO.AsCurrency);

     // Activa y/o desactiva los botones
     btnPedInfo.Enabled      := Seguridad.Activar(btnPedInfo);
     btnModificar.Enabled    := bModificar and Seguridad.Activar(btnModificar);
//     btnAprSiniestro.Enabled := bAprobar   and Seguridad.Activar(btnAprSiniestro);
     btnAprVolante.Enabled   := bAprobar   and Seguridad.Activar(btnAprVolante);

     RefreshData;

     if fraVolantes.edNumero.Value > 0 then
        fraVolantes.edEstado.Text := fraVolantes.edEstado.Text + ' (Monto Pagado: ' +
                                     ValorSql('SELECT FMTNUMBER(amebpba.get_montopagado(' + fraVolantes.edNumero.TextSql + ')) FROM DUAL ') + ')';
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.FormCreate(Sender: TObject);
begin
  fraVolantes.OnChange := VolanteChange;
  //-------[ Carga los Colores ]----------------------------------------------------------------//
  pnlColor1.Color := StrToInt(GetRegFromValue(Self, pnlColor1.Hint, IntToStr(pnlColor1.Color)));
  pnlColor2.Color := StrToInt(GetRegFromValue(Self, pnlColor2.Hint, IntToStr(pnlColor2.Color)));
  pnlColor3.Color := StrToInt(GetRegFromValue(Self, pnlColor3.Hint, IntToStr(pnlColor3.Color)));
  pnlColor4.Color := StrToInt(GetRegFromValue(Self, pnlColor4.Hint, IntToStr(pnlColor4.Color)));
  pnlColor5.Color := StrToInt(GetRegFromValue(Self, pnlColor5.Hint, IntToStr(pnlColor5.Color)));
  pnlColor6.Color := StrToInt(GetRegFromValue(Self, pnlColor6.Hint, IntToStr(pnlColor6.Color)));
  pnlColor7.Color := StrToInt(GetRegFromValue(Self, pnlColor7.Hint, IntToStr(pnlColor7.Color)));
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.pnlColorClick(Sender: TObject);
begin
   ColorDialog.Color := TPanel(Sender).Color;
   if ColorDialog.Execute then
      TPanel(Sender).Color := ColorDialog.Color;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.dbgDatosGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                               var Background: TColor; Highlight: Boolean);
begin
  if (sdqDatos.FieldByName('dv_tipo').AsString = 'SIN') and
     (Field.Index = 5) and (Not Highlight) and
     (not(StrLeft(sdqDatos.FieldByName('dv_estado').AsString, 1) = 'A')) then
  begin
     case sdqDatos.FieldByName('dv_ivestado').AsInteger of
       1: Background := pnlColor1.Color;
       2: Background := pnlColor2.Color;
       3: Background := pnlColor3.Color;
       4: Background := pnlColor4.Color;
       5: Background := pnlColor5.Color;
       6: Background := pnlColor6.Color;
       7: Background := pnlColor7.Color;
       8: Background := pnlColor8.Color;       
     else
       Background := clWindow;
     end;
  end;

  if (sdqDatos.FieldByName('dv_tipo').AsString = 'GEN') and not(Highlight) then
    if (sdqDatos.FieldByName('dv_impconvenido').AsFloat > 0) and
       (sdqDatos.FieldByName('dv_impconvenido').AsFloat < sdqDatos.FieldByName('dv_pagoconret').AsFloat) then
      Background := pnlColor4.Color //el monto convenido supera el acordado
    else if (sdqDatos.FieldByName('dv_impfacturado').AsFloat > sdqDatos.FieldByName('dv_pagoconret').AsFloat) then
      Background := pnlColor6.Color; //el monto facturado supera el acordado
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.btnSalirClick(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.btnPedInfoClick(Sender: TObject);
var
  frmPedidoInfo: TfrmPedidoInfo;
begin
  if not sdqDatos.Eof then
  begin
    frmPedidoInfo := TfrmPedidoInfo.Create(Self);
    try
      frmPedidoInfo.ShowForm(sdqDatos.FieldByName('dv_siniestro').AsInteger,
                              sdqDatos.FieldByName('dv_orden').AsInteger,
                              sdqDatos.FieldByName('dv_recaida').AsInteger,
                              sdqDatos.FieldByName('dv_numpago').AsInteger ,'L', #0,
                              fraVolantes.edNumero.Value, 0); // el 0 corresponde a NroParte para P.Evolutivo, aca no se usa.
      RefreshData;
    finally
      frmPedidoInfo.Free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  btnAprSiniestro.Enabled := (sdqDatos.FieldByName('dv_tipo').AsString = 'SIN') and
                              Seguridad.Activar(btnAprSiniestro) and
                             (GetEstado <> 0) and (btnAprSiniestro.Tag = 0);
  btnAprConcepto.Enabled  := (sdqDatos.FieldByName('dv_tipo').AsString = 'GEN') and
                              Seguridad.Activar(btnAprConcepto) and
                             (sdqDatos.FieldByName('dv_impconvenido').AsFloat <
                              sdqDatos.FieldByName('dv_pagoconret').AsFloat);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 116) and (Shift = []) and sdqDatos.Active then
    RefreshData;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.btnModificarClick(Sender: TObject);
begin
  Verificar(not fraVolantes.CheckInput, fraVolantes.edNumero, 'Debe seleccionar un volante.');

  if AreIn(sEstadoVol, ['A','AP','AM','E','EG','EM']) then
  begin
     MessageDlg('No se puede modificar datos al estar el Volante aprobado o autorizado', mtError, [], 0);
     exit;
  end;

  if fraVolantes.edNumero.Value = 0 then exit;

  if (sEstadoVol = 'L') or
     ((sEstadoVol = 'LM') and (sdqDatos.FieldByName('dv_tipo').AsString = 'SIN')) then
     DoModificarSIV
  else
     DoModificarGEN
end;
{-------------------------------------------------------------------------------}
function TfrmLiquiAprob.GetEstado: Integer;
begin
  Result := sdqDatos.FieldByName('dv_ivestado').AsInteger;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.btnAprSiniestroClick(Sender: TObject);
var
  SSql, sEstado :String;
  A :Variant;
begin
  Verificar(not sdqDatos.Active or sdqDatos.IsEmpty, fraVolantes.edNumero, 'Debe seleccionar un volante.');

  if not fraVolantes.CheckInput then exit;

  sEstado := IntToStr(GetEstado);
  if sEstado <> '6' then
  begin
    if sEstado = '0' then sEstado := '';
    SSql := 'UPDATE siv_itemvolante ' +
              ' SET iv_estado = ''A' + sEstado + ''', ' +
                  ' iv_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' iv_fecmodif = ActualDate ' +
            ' WHERE iv_siniestro = ' + SqlInt(sdqDatos.FieldByName('dv_siniestro').AsInteger) +
              ' AND iv_orden = ' + SqlInt(sdqDatos.FieldByName('dv_orden').AsInteger) +
              ' AND iv_recaida = ' + SqlInt(sdqDatos.FieldByName('dv_recaida').AsInteger) +
              ' AND iv_numpago = ' + SqlInt(sdqDatos.FieldByName('dv_numpago').AsInteger);
    EjecutarSql(sSql);

    { -- Refresca los Datos -- }
    A := VarArrayCreate([0, 5], varVariant);
    A[0] := sdqDatos.FieldByName('dv_siniestro').AsString;    // Siniestro
    A[1] := sdqDatos.FieldByName('dv_orden').AsString;        // Orden
    A[2] := sdqDatos.FieldByName('dv_recaida').AsString;      // Recaida
    A[3] := sdqDatos.FieldByName('dv_numpago').AsString;      // NumPago
    A[4] := sdqDatos.FieldByName('dv_tipo').AsString;         // tipo

    btnAprVolante.Enabled := bAprobar and Seguridad.Activar(btnAprVolante);
    RefreshData;
    sdqDatos.Locate('dv_siniestro;dv_orden;dv_recaida;dv_numpago;dv_tipo', A,[]);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.btnAprVolanteClick(Sender: TObject);
var
  Sql, sNuevoEst, sUsu :String;
  bBonif :Boolean;
begin
  Verificar(((not(fraVolantes.CheckInput)) or
              (not(sdqDatos.Active) or sdqDatos.IsEmpty)) and
             (fraVolantes.edTotFact.Value <> fraVolantes.edVO_MONTODEBITO.Value),
            fraVolantes.edNumero, 'Debe seleccionar un volante.');

  sUsu := ValorSqlEx('SELECT art.liq.get_usuariocambioestadovol(:vol, :estado, ''N'') ' +
                      ' FROM dual', [fraVolantes.edNumero.Value, sEstadoVol]);

  Verificar(sUsu = Sesion.UserID, fraVolantes.edNumero, 'El volante no puede ser aprobado por ' + #13 +
                                                         'la misma persona que lo liquidó.');

  Sql := 'SELECT ca_fecharevision ' +
          ' FROM cpr_prestador, svo_volantes ' +
         ' WHERE ca_identificador = vo_prestador ' +
           ' AND ca_identificador = :IdPrest ' +
           ' AND vo_volante = :iVolante ' +
           ' AND vo_fechalta > to_date(''01/12/2007'',''dd/mm/yyyy'') ';
  Verificar((ValorSqlDateTimeEx(Sql, [fraVolantes.edPrestIdentif.Value, fraVolantes.edNumero.Value], -1) = 0),
             fraVolantes.edPrestRSocial, 'El prestador no posee fecha de revisión');

  // By FFirenze, pedido por JBalestrini el 24/03/2003
  Sql := 'SELECT 1 ' +
          ' FROM svo_volantes ' +
         ' WHERE abs(art.amebpba.imp_negativo(vo_volante))+vo_montodebito <> vo_monto ' +
           ' AND vo_volante = :Volante ';
  bBonif := ExisteSqlEx(Sql, [fraVolantes.edNumero.Value]);

  if bBonif then
    edBonifPrestador.Text := ValorSqlEx('SELECT ca_bonificacion ' +
                                         ' FROM cpr_prestador ' +
                                        ' WHERE ca_identificador = :IdPres', [fraVolantes.edPrestIdentif.Value])
  else
    edBonifPrestador.Value := 0;

  edBonifFactura.Value  := 0;
  //----------------------------------------------------------------------------------------------------------------//
  if (not bBonif) or (fpBonificacion.ShowModal = mrOk) then
   try
     BeginTrans;
     // --[ Muestra la Ventana con la Nota de Debito ]----------------------------------
     MostrarNotaDeDebito;
     // --[ Aprueba el resto que no aparece en la lista de la Nota de Debito ]----------
     AprobarRestoSIV;
     AprobarRestoSVG;
     // --------------------------------------------------------------------------------
     BonificarFactura;
     // --------------------------------------------------------------------------------
     if sEstadoVol = 'L' then
       sNuevoEst := 'A'
     else if sEstadoVol = 'LG' then
       sNuevoEst := 'AP'
     else
       sNuevoEst := 'AM';
     // --[ Aprueba Volante ]-----------------------------------------------------------
     Sql := 'UPDATE svo_volantes ' +
              ' SET vo_porboni = ' + SqlValue(edBonifPrestador.Value) + ', ' +
                  ' vo_montoboni = (((VO_MONTO + ART.AMEBPBA.IMP_NEGATIVO(VO_VOLANTE))* '+ SqlValue(edBonifPrestador.Value) + ') / 100) * (-1), ' +
                  ' vo_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                  ' vo_fechamodif = ActualDate, ' +
                  ' vo_estado = ' + SqlValue(sNuevoEst) + ',' + 
                  ' vo_bonificacion = ' +  SqlNumber(edBonifFactura.Value) + ', ' +
                  ' vo_fechapro = ActualDate, ' +
                  ' vo_usuapro = ' + SqlValue(Sesion.UserID) +
            ' WHERE vo_volante = ' + SqlInt(fraVolantes.edNumero.Value);
     EjecutarSqlST(Sql);
     DoGenerarNotaDebito;
     CommitTrans;
  except
    on E: Exception do
    begin
       Rollback;
       ErrorMsg(E);
    end;
  end;
  fraVolantes.Limpiar;
  fraVolantes.edNumero.SetFocus;
  sdqDatos.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.MostrarNotaDeDebito;
var
  frmLiqNotaDebito: TfrmLiqNotaDebito;
begin
  frmLiqNotaDebito := TfrmLiqNotaDebito.Create(Self);
  try
     frmLiqNotaDebito.Mostrar(StrToInt('0' + fraVolantes.edNumero.Text));
  finally
     frmLiqNotaDebito.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.btnColoresClick(Sender: TObject);
begin
  pnlColores.Visible := btnColores.Down;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.FormDockOver(Sender: TObject;  Source: TDragDockObject; X, Y: Integer;
                                      State: TDragState;  var Accept: Boolean);
begin
  Accept := (Source.Control = pnlColores) and (Y > grpVolante.Height) and (Y < pnlBotones.Top);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.FormDockDrop(Sender: TObject;  Source: TDragDockObject; X, Y: Integer);
begin
  Source.Control.Align := alRight;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.AprobarRestoSIV;
var Sql, sValor : String;
    function GetNroVolante : String;
    begin
         Result := SqlInt(IncSql('SELECT MAX(iv_numvolante) ' +
                                  ' FROM siv_itemvolante ' +
                                  'WHERE iv_volante = ' + fraVolantes.edNumero.TextSql));
    end;
begin
  sdqTmpSIV.Close;
  sdqTmpSIV.ParamByName('pVolante').AsInteger := StrToInt('0' + fraVolantes.edNumero.Text);
  sdqTmpSIV.Open;
  //--------------------------------------------------------------------------------------------------------------//
  if not sdqTmpSIV.Eof then
  repeat
     if (sdqTmpSIV.FieldByName('estado').AsInteger = 0) then
       sValor := 'A'
     else
       sValor := Copy('CCAAC C', sdqTmpSIV.FieldByName('estado').AsInteger, 1);

     Sql := ' UPDATE siv_itemvolante ' +
               ' SET iv_estado = ' + SqlValue(sValor) + ', ' +
                   ' iv_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                   ' iv_fecmodif = actualdate ' +
             ' WHERE iv_siniestro = ' + SqlInt(sdqTmpSIV.FieldByName('iv_siniestro').AsInteger) +
               ' AND iv_orden = ' + SqlInt(sdqTmpSIV.FieldByName('iv_orden').AsInteger) +
               ' AND iv_recaida = ' + SqlInt(sdqTmpSIV.FieldByName('iv_recaida').AsInteger) +
               ' AND iv_numpago = ' + SqlInt(sdqTmpSIV.FieldByName('iv_numpago').AsInteger) +
               ' AND iv_estado = ''P'' ';
     EjecutarSqlST(Sql);
     //---------------------------------------------------------------------------------------------------------//
     case sdqTmpSIV.FieldByName('estado').AsInteger of
       1, 2, 5, 7, 8: begin
          //--------------------------------------------------------------------------------------------------//
          Sql := ' INSERT INTO SIV_ITEMVOLANTE ' +
                 '(IV_VOLANTE, IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, IV_NUMPAGO, IV_NUMVOLANTE, IV_FECPRESTA, ' +
                  'IV_PRES_CODIGO, IV_PRESDET, IV_CANTIDAD, IV_IMPFACTURADO, IV_ESTADO, IV_USUALTA, IV_FECALTA, ' +
                  'IV_CONPAGO, IV_PRES_NOMENCLADOR, IV_PRES_CAPITULO, IV_NUMDEBITO, IV_MOTIVODEBITO) VALUES (' +
                 sdqTmpSIV.FieldByName('IV_VOLANTE').AsString + ', ' +
                 sdqTmpSIV.FieldByName('IV_SINIESTRO').AsString + ', ' +
                 sdqTmpSIV.FieldByName('IV_ORDEN').AsString + ', ' +
                 sdqTmpSIV.FieldByName('IV_RECAIDA').AsString + ', ' +
                 'ART.AMEBPBA.GET_SIV_MAXNUMPAGO(' + sdqTmpSIV.FieldByName('IV_SINIESTRO').AsString + ', ' +
                                                     sdqTmpSIV.FieldByName('IV_ORDEN').AsString + ', ' +
                                                     sdqTmpSIV.FieldByName('IV_RECAIDA').AsString + ') + 1, ' +
                 GetNroVolante + ', ' +
                 SqlDate(sdqTmpSIV.FieldByName('IV_FECPRESTA').AsDateTime) + ', ''' +
                 sdqTmpSIV.FieldByName('IV_PRES_CODIGO').AsString + ''', ''' +
                 sdqTmpSIV.FieldByName('IV_PRESDET').AsString + ''', ' +
                 IntToStr(sdqTmpSIV.FieldByName('IV_CANTIDAD').AsInteger - sdqTmpSIV.FieldByName('IV_CANTAPRO').AsInteger) + ', ' +
                 SqlNumber(Abs(sdqTmpSIV.FieldByName('IV_IMPFACTURADO').AsFloat) * (-1)) +
                 ', ''C' + sdqTmpSIV.FieldByName('ESTADO').AsString + ''', ' +
                 SqlValue(Sesion.UserID) + ', ActualDate, ' +
                 sdqTmpSIV.FieldByName('IV_CONPAGO').AsString + ', ''' +
                 sdqTmpSIV.FieldByName('IV_PRES_NOMENCLADOR').AsString + ''', ''' +
                 sdqTmpSIV.FieldByName('IV_PRES_CAPITULO').AsString + ''', ' +
                 SqlInt(sdqTmpSIV.FieldByName('IV_NUMVOLANTE').AsInteger, False) + ', ''' +
                 sdqTmpSIV.FieldByName('IV_MOTIVODEBITO').AsString + ''') ';

          EjecutarSqlST(Sql);
          //--------------------------------------------------------------------------------------------------//
          if (not self.sdqTmpSIV.FieldByName('IV_NUMAUTO').IsNull) and (Not sdqTmpSIV.FieldByName('ESTADO').AsInteger = 2) then
          begin
             Sql := 'UPDATE SAU_AUTORIZACIONES ' +
                      ' SET AU_CANTCONSU = AU_CANTCONSU - ' + sdqTmpSIV.FieldByName('IV_CANTAPRO').AsString +
                    ' WHERE AU_NUMAUTO = ' + sdqTmpSIV.FieldByName('IV_NUMAUTO').AsString +
                      ' AND AU_SINIESTRO = ' + sdqTmpSIV.FieldByName('IV_SINIESTRO').AsString +
                      ' AND AU_ORDEN = ' + sdqTmpSIV.FieldByName('IV_ORDEN').AsString +
                      ' AND AU_RECAIDA = ' + sdqTmpSIV.FieldByName('IV_RECAIDA').AsString +
                      ' AND AU_CANTCONSU > 0 ' +
                      ' AND (AU_ESTADO = ''C'' OR AU_ESTADO = ''A'')';
             EjecutarSqlST(Sql);
          end;
          //--------------------------------------------------------------------------------------------------//
       end;
       3: begin
          //--------------------------------------------------------------------------------------------------//
          Sql := ' INSERT INTO SIV_ITEMVOLANTE ' +
                 '(IV_VOLANTE, IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, IV_NUMPAGO, IV_NUMVOLANTE, IV_FECPRESTA, ' +
                 ' IV_PRES_CODIGO, IV_PRESDET, IV_CANTIDAD, IV_IMPFACTURADO, IV_ESTADO, IV_USUALTA, IV_FECALTA, ' +
                 ' IV_CONPAGO, IV_PRES_NOMENCLADOR, IV_PRES_CAPITULO, IV_NUMDEBITO, IV_MOTIVODEBITO) ' +
                 ' SELECT ' + sdqTmpSIV.FieldByName('IV_VOLANTE').AsString +
                            ', AU_SINIESTRO, AU_ORDEN, AU_RECAIDA, ' +
                            ' ART.AMEBPBA.GET_SIV_MAXNUMPAGO(AU_SINIESTRO, AU_ORDEN, AU_RECAIDA) + 1, ' +
                            GetNroVolante + ', ' +
                            SqlDate(sdqTmpSIV.FieldByName('IV_FECPRESTA').AsDateTime) + ', ''' +
                            sdqTmpSIV.FieldByName('IV_PRES_CODIGO').AsString + ''', ''' +
                            SqlString(sdqTmpSIV.FieldByName('IV_PRESDET').AsString) + ''', ' +
                            IntToStr(sdqTmpSIV.FieldByName('IV_CANTIDAD').AsInteger - sdqTmpSIV.FieldByName('IV_CANTAPRO').AsInteger) + ', ' +
                            'ABS(' + SqlNumber(sdqTmpSIV.FieldByName('IV_IMPFACTURADO').AsFloat) + ' - (' + SqlNumber(sdqTmpSIV.FieldByName('IV_IMPFACTURADO').AsFloat / sdqTmpSIV.FieldByName('IV_CANTIDAD').AsFloat) + ' * (AU_CANTCONSU - AU_CANTAPRO))) * (-1), ' +
                            '''C' + sdqTmpSIV.FieldByName('ESTADO').AsString + ''', ''' +
                            SqlValue(Sesion.UserID) + ', ActualDate, ' +
                            sdqTmpSIV.FieldByName('IV_CONPAGO').AsString + ''', ''' +
                            sdqTmpSIV.FieldByName('IV_PRES_NOMENCLADOR').AsString + ''', ''' +
                            sdqTmpSIV.FieldByName('IV_PRES_CAPITULO').AsString + ''', ' +
                            'IV_NUMVOLANTE ' + ', ''' +
                            sdqTmpSIV.FieldByName('IV_MOTIVODEBITO').AsString + ''' ' +
                 'FROM SAU_AUTORIZACIONES ' +
                 ' WHERE AU_SINIESTRO = ' + sdqTmpSIV.FieldByName('IV_SINIESTRO').AsString +
                 ' AND AU_ORDEN = ' + sdqTmpSIV.FieldByName('IV_ORDEN').AsString +
                 ' AND AU_RECAIDA = ' + sdqTmpSIV.FieldByName('IV_RECAIDA').AsString +
                 ' AND AU_NUMAUTO = ' + sdqTmpSIV.FieldByName('IV_NUMAUTO').AsString;

          EjecutarSqlST(Sql);
          //--------------------------------------------------------------------------------------------------//
       end;
       4: begin
          //--------------------------------------------------------------------------------------------------//
          Sql := ' INSERT INTO SIV_ITEMVOLANTE ' +
                 '(IV_VOLANTE, IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, IV_NUMPAGO, IV_NUMVOLANTE, IV_FECPRESTA, ' +
                  'IV_PRES_CODIGO, IV_PRESDET, IV_CANTIDAD, IV_IMPFACTURADO, IV_ESTADO, IV_USUALTA, IV_FECALTA, ' +
                  'IV_CONPAGO, IV_PRES_NOMENCLADOR, IV_PRES_CAPITULO, IV_NUMDEBITO, IV_MOTIVODEBITO) VALUES (' +
                 sdqTmpSIV.FieldByName('IV_VOLANTE').AsString + ', ' +
                 sdqTmpSIV.FieldByName('IV_SINIESTRO').AsString + ', ' +
                 sdqTmpSIV.FieldByName('IV_ORDEN').AsString + ', ' +
                 sdqTmpSIV.FieldByName('IV_RECAIDA').AsString + ', ' +
                 'ART.AMEBPBA.GET_SIV_MAXNUMPAGO(' + sdqTmpSIV.FieldByName('IV_SINIESTRO').AsString + ', ' +
                                                     sdqTmpSIV.FieldByName('IV_ORDEN').AsString + ', ' +
                                                     sdqTmpSIV.FieldByName('IV_RECAIDA').AsString + ') + 1, ' +
                 GetNroVolante + ', ' +
                 SqlDate(sdqTmpSIV.FieldByName('IV_FECPRESTA').AsDateTime) +
                 ', ''' + sdqTmpSIV.FieldByName('IV_PRES_CODIGO').AsString + ''', ''' +
                 sdqTmpSIV.FieldByName('IV_PRESDET').AsString + ''', ' +
                 IntToStr(sdqTmpSIV.FieldByName('IV_CANTIDAD').AsInteger - sdqTmpSIV.FieldByName('IV_CANTAPRO').AsInteger) + ', ' +
                 SqlNumber(Abs(sdqTmpSIV.FieldByName('IV_IMPPAGCONRET').AsFloat - sdqTmpSIV.FieldByName('IV_IMPCONVENIDO').AsFloat) * (-1)) + ', ''C4'', ' +
                 SqlValue(Sesion.UserID) + ', ActualDate, ' +
                 sdqTmpSIV.FieldByName('IV_CONPAGO').AsString + ', ''' +
                 sdqTmpSIV.FieldByName('IV_PRES_NOMENCLADOR').AsString + ''', ''' +
                 sdqTmpSIV.FieldByName('IV_PRES_CAPITULO').AsString + ''', ' +
                 SqlInt(sdqTmpSIV.FieldByName('IV_NUMVOLANTE').AsInteger, False) + ', ''' +
                 sdqTmpSIV.FieldByName('IV_MOTIVODEBITO').AsString + ''')';

          EjecutarSqlST(Sql);
            //--------------------------------------------------------------------------------------------------//
       end;
     end;
     //-------------------------------------------------------------------------------------------------------//
     sdqTmpSIV.Next;
  until sdqTmpSIV.Eof;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.dbgDatosDblClick(Sender: TObject);
begin
  if btnPedInfo.Enabled then btnPedInfoClick(Nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.ImprimirNotaDebito;
var
  TipoNota :TTipoNota;
begin
  TipoNota := IIF(sEstadoVol = 'L', tnNormal, IIF(sEstadoVol = 'LG', tnGenerica, tnMixta));
  with TrptNotaDebito.Create(Self) do
  try
    try
      Imprimir(StrToInt('0' + fraVolantes.edNumero.Text), TipoNota);
    except
      {Si captura el error para que se guareden los cambios pero no se imprima la nota de debito}
    end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.FormGetSiteInfo(Sender: TObject;  DockClient: TControl; var InfluenceRect: TRect;
                                         MousePos: TPoint; var CanDock: Boolean);
begin
  InfluenceRect := Rect(Width - pnlColores.Width,  grpVolante.Height,
                        Width - 2, pnlBotones.Top);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.btnCambDestinoClick(Sender: TObject);
Var
   Sql      : String;
   sNewDest : String;
begin
   if fraVolantes.CheckInput and (edDestino.Text <> '') then
   begin
      sNewDest := IIF(edDestino.Text[1] = 'M', 'P', 'M');

      Sql := 'SELECT 1 ' +
              ' FROM svo_volantes ' +
             ' WHERE vo_volante = ' + SqlInt(fraVolantes.edNumero.Value) +
               ' AND NOT EXISTS (SELECT 1 FROM cpr_prestador ' +
                                ' WHERE ca_asistencial > 0 ' +
                                   'AND ca_identificador = vo_prestador) ';


      if (sNewDest = 'M') and ExisteSql(Sql) then
         MsgBox('No se ha podido cambiar el destino porque el prestador del volante no tiene código de Asistencial', MB_ICONWARNING)
      else begin
         Sql := 'UPDATE svo_volantes ' +
                  ' SET vo_destinatario = ''' + sNewDest + '''' +
                ' WHERE vo_volante = ' + fraVolantes.edNumero.TextSql;
         try
            EjecutarSql(Sql);

            if (sNewDest = 'M') then
               edDestino.Text := 'Mutual'
            else
               edDestino.Text := TXT_EMP_RSOCIAL;
         except
           on E: Exception do
              ErrorMsg(E, 'Error inesperado al cambiar el destinatario');
         end;
      end;
   end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.RefreshData;
begin
   // Carga la Grilla con los datos de los Items del Volante
   sdqDatos.Close;
   sdqDatos.ParamByName('pVolante').AsString :=  fraVolantes.edNumero.TextSql;
   sdqDatos.Open;

   // Si es una devolucion de Ajuste, no deja generar notas de débito
   if btnAprVolante.Enabled and (fraVolantes.Ajuste > 0) then
   begin
      sdqDatos.DisableControls;
      sdqDatos.First;
      repeat
          if (sdqDatos.FieldByName('dv_ivestado').AsInteger > 0) and
             (not(StrLeft(sdqDatos.FieldByName('dv_estado').AsString, 1) = 'A')) then
          begin
             btnAprVolante.Enabled := False;
             Break;
          end;
          sdqDatos.Next;
      until sdqDatos.EOF;
      sdqDatos.First;
      sdqDatos.EnableControls;
   end;
   edDestino.Text := TXT_EMP_RSOCIAL;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.SeguridadAfterExecute(Sender: TObject);
begin
  if not btnAprSiniestro.Enabled then
    btnAprSiniestro.Tag := 1;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.btnOrdenClick(Sender: TObject);
begin
  SortDialog.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.BonificarFactura;
var
   sdqConsulta : TSDQuery;
   Sql         : String;
   rImpDebito  : Currency;
   iNumVolante,
   iNumPago    : Integer;
begin
  if edBonifFactura.Value > 0 then
  begin
    Sql := 'SELECT iv_siniestro, iv_orden, iv_recaida, iv_impfacturado, iv_numvolante, iv_numdebito ' +
            ' FROM siv_itemvolante ' +
           ' WHERE iv_volante = ' + SqlInt(fraVolantes.edNumero.Value) +
             ' AND iv_estado <> ''X''';
    sdqConsulta := GetQuery(Sql);
    try
      while not sdqConsulta.Eof do
      begin
         Sql := 'SELECT SUM(iv_impfacturado) ' +
                  'FROM siv_itemvolante ' +
                 'WHERE iv_volante = ' + SqlInt(fraVolantes.edNumero.Value) +
                  ' AND iv_numdebito = ' + SqlInt(sdqConsulta.FieldByName('IV_NUMVOLANTE').AsInteger) +
                  ' AND iv_estado <> ''X''';
         rImpDebito := StrToCurrX(ValorSql(Sql));

         if Numeros.CompareFloat(sdqConsulta.FieldByName('iv_impfacturado').AsCurrency + rImpDebito, 0) = 1 then
         begin
           Sql := 'SELECT MAX(iv_numvolante) ' +
                   ' FROM siv_itemvolante ' +
                  ' WHERE iv_volante = ' +  SqlInt(fraVolantes.edNumero.Value);
           iNumVolante := IncSql(Sql);

           Sql := 'SELECT MAX(iv_numpago) ' +
                    'FROM siv_itemvolante ' +
                   'WHERE iv_siniestro = ' +  SqlInt(sdqConsulta.FieldByName('iv_siniestro').AsInteger) +
                    ' AND iv_orden = ' +  SqlInt(sdqConsulta.FieldByName('iv_orden').AsInteger)  +
                    ' AND iv_recaida = ' +  SqlInt(sdqConsulta.FieldByName('iv_recaida').AsInteger);
           iNumPago := IncSql(Sql);

           Sql := 'INSERT INTO SIV_ITEMVOLANTE ' +
                       '(IV_VOLANTE, IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, IV_NUMPAGO, IV_CONPAGO, IV_FECPRESTA, ' +
                        'IV_PRES_NOMENCLADOR, IV_PRES_CAPITULO, IV_PRES_CODIGO, IV_PRESDET, IV_CANTIDAD, IV_NUMAUTO, ' +
                        'IV_IMPFACTURADO, IV_IMPCONVENIDO, IV_IMPPAGSINRET, IV_IMPPAGCONRET, IV_OBSERVACIONES, IV_ESTADO, ' +
                        'IV_USUALTA, IV_FECALTA, IV_AUTORIZACION, IV_CANTAPRO, IV_MOTIVO, IV_NUMVOLANTE, IV_NUMDEBITO, IV_MOTIVODEBITO) ' +
                  'SELECT IV_VOLANTE, IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' +
                         SqlInt(iNumPago) + ', IV_CONPAGO, IV_FECPRESTA, IV_PRES_NOMENCLADOR, IV_PRES_CAPITULO, ' +
                         'IV_PRES_CODIGO, IV_PRESDET, IV_CANTIDAD, IV_NUMAUTO, ' +
                         ' -(((' + SqlNumber(rImpDebito) + ' + IV_IMPFACTURADO) * ' + SqlNumber(edBonifFactura.Value) + ') / 100), ' +
                         'NULL, NULL, NULL, IV_OBSERVACIONES, ''C8'', ' +
                         'IV_USUALTA, IV_FECALTA, IV_AUTORIZACION, IV_CANTAPRO, IV_MOTIVO, ' +
                         SqlInt(iNumVolante) + ', IV_NUMVOLANTE, IV_MOTIVODEBITO ' +
                    'FROM SIV_ITEMVOLANTE ' +
                   'WHERE IV_VOLANTE = ' + SqlInt(fraVolantes.edNumero.Value) +
                    ' AND IV_NUMVOLANTE = ' + SqlInt(sdqConsulta.FieldByName('iv_numvolante').AsInteger)  +
                    ' AND IV_SINIESTRO = ' + SqlInt(sdqConsulta.FieldByName('iv_siniestro').AsInteger)  +
                    ' AND IV_ORDEN = ' + SqlInt(sdqConsulta.FieldByName('iv_orden').AsInteger)  +
                    ' AND IV_RECAIDA = ' + SqlInt(sdqConsulta.FieldByName('iv_recaida').AsInteger);
           EjecutarSqlST(Sql);
         end;
         sdqConsulta.Next;
      end;
    finally
      sdqConsulta.Free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.AprobarRestoSVG;
var
  Sql :String;
begin
  sdqTmpSVG.Close;
  sdqTmpSVG.ParamByName('pVolante').AsInteger := StrToInt('0' + fraVolantes.edNumero.Text );
  sdqTmpSVG.Open;
  //--------------------------------------------------------------------------------------------------------------//
  if not sdqTmpSVG.Eof then
  begin
     repeat
       if (sdqTmpSVGVG_IMPCONVENIDO.AsFloat > 0) and
          (sdqTmpSVGVG_IMPCONVENIDO.AsFloat < sdqTmpSVGVG_IMPPAGCONRET.AsFloat) then
       begin
          Sql := 'UPDATE svg_vol_generico ' +
                   ' SET vg_estado = ''AP1'', ' +
                       ' vg_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                       ' vg_fecmodif = actualdate ' +
                 ' WHERE vg_volante = ' + sdqTmpSVGVG_VOLANTE.AsString +
                   ' AND vg_numpago = ' + sdqTmpSVGVG_NUMPAGO.AsString +
                   ' AND vg_estado = ''P''';
          EjecutarSqlST(Sql);
          //---------------------------------------------------------------------------------------------------------//
          Sql := 'INSERT INTO svg_vol_generico ' +
                 '(vg_volante, vg_numpago, vg_conpago, vg_prestadesde, vg_prestahasta, ' +
                 ' vg_pres_nomenclador, vg_pres_capitulo, vg_pres_codigo, vg_presdet, ' +
                 ' vg_cantidad, vg_impfacturado, vg_estado, vg_usualta, vg_fecalta) VALUES (' +
                 sdqTmpSVGVG_VOLANTE.AsString + ', ' +
                 'ART.AMEBPBA.GET_SVG_MAXNUMPAGO(' + sdqTmpSVGVG_VOLANTE.AsString + ') +1, ' +
                 sdqTmpSVGVG_CONPAGO.AsString + ', ' +
                 SqlDate(sdqTmpSVGVG_PRESTADESDE.AsDateTime) + ', ' +
                 SqlDate(sdqTmpSVGVG_PRESTAHASTA.AsDateTime) + ', ' +
                 SqlValue(sdqTmpSVGVG_PRES_NOMENCLADOR.AsString) + ',' +
                 SqlValue(sdqTmpSVGVG_PRES_CAPITULO.AsString) + ',' +
                 SqlValue(sdqTmpSVGVG_PRES_CODIGO.AsString) + ',' +
                 SqlValue(sdqTmpSVGVG_PRESDET.AsString) + ',' +
                 SqlNumber(sdqTmpSVGVG_CANTIDAD.AsFloat - sdqTmpSVGVG_CANTAPRO.AsFloat) + ', ' +
                 SqlNumber(Abs(sdqTmpSVGVG_IMPPAGCONRET.AsFloat - sdqTmpSVGVG_IMPCONVENIDO.AsFloat) * (-1)) + ', ' +
                 '''C4'', ' + SqlValue(Sesion.UserID) + ', ActualDate)' ;
          EjecutarSqlST(Sql);
       end
       else begin
          Sql := 'UPDATE svg_vol_generico ' +
                   ' SET vg_estado = ''AP'', ' +
                       ' vg_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                       ' vg_fecmodif = ActualDate ' +
                 ' WHERE vg_volante = ' + sdqTmpSVGVG_VOLANTE.AsString +
                   ' AND vg_numpago = ' + sdqTmpSVGVG_NUMPAGO.AsString +
                   ' AND vg_impfacturado = vg_imppagconret ' +
                   ' AND vg_estado  = ''P''';
          EjecutarSQLST(sql);
       end;
       //-----------------------------------------------------------------//
       sdqTmpSVG.Next;
     until sdqTmpSVG.Eof;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.DoGenerarNotaDebito;
var
  sSql :String;
  bImprimir :Boolean;
begin
  bImprimir := False;
  if AreIn(sEstadoVol, ['L', 'LM']) then
  begin
    if not CheckView('MND_NOTADEBITO') then
      MessageDlg('No se podrá imprimir la nota de débito porque la ' +#13+#10+
                 'vista que la genera se encuentra inválida.'+#13+#10+'Vista: MND_NOTADEBITO', mtError, [], 0)
    else begin
      bImprimir := True;
      sSql      := 'SELECT 1 FROM mnd_notadebito WHERE nd_volante = :Vol';
      if (ValorSqlEx(sSql, [fraVolantes.edNumero.Value]) = '1') then
      begin
        sSql := 'UPDATE svo_volantes ' +
                  ' SET vo_notadebito = art.seq_snd_notadebito_art.nextval ' +
                ' WHERE vo_volante = ' + SqlInt(fraVolantes.edNumero.Value);
        EjecutarSQLST(sSql);
      end;
      sSql := 'SELECT 1 FROM mni_notadebitointerno WHERE nd_volante = :Vol';
      if (ValorSqlEx(sSql, [fraVolantes.edNumero.Value]) = '1') then
      begin
        sSql := 'UPDATE svo_volantes ' +
                  ' SET vo_notadebitoint = art.seq_snd_notadebitointerna.nextval ' +
                ' WHERE vo_volante = ' + SqlInt(fraVolantes.edNumero.Value);
        EjecutarSQLST(sSql);
      end;
    end;
  end;
  // --------------------------------------------------------------------------------
  if (sEstadoVol = 'LG') then
  begin
    if not CheckView('MNG_NOTADEBITOGEN') then
      MessageDlg('No se podrá imprimir la nota de débito porque la '+#13+#10+
                 'vista que la genera se encuentra inválida.'+#13+#10+'Vista: MNG_NOTADEBITOGEN', mtError, [], 0)
    else begin
      bImprimir := True;
      sSql := ' SELECT 1 FROM mng_notadebitogen WHERE ng_volante = :Vol';
      if (ValorSqlEx(sSql, [fraVolantes.edNumero.Value]) = '1' ) then
      begin
        sSql := 'UPDATE svo_volantes ' +
                  ' SET vo_notadebito = art.seq_snd_notadebito_art.nextval ' +
                ' WHERE vo_volante = ' + SqlInt(fraVolantes.edNumero.Value);
        EjecutarSqlST(sSql);
      end;
    end;
  end;
  // --[ Imprime la Nota de Débito ]----------------------------------------------
  if bImprimir then ImprimirNotaDebito;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.btnAprConceptoClick(Sender: TObject);
var
  sSql :String;
  A :Variant;
begin
  sSql := 'UPDATE svg_vol_generico ' +
            ' SET vg_estado = ''AP1'', ' +
                ' vg_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                ' vg_fecmodif = actualdate ' +
          ' WHERE vg_volante = ' + SqlInt(sdqDatos.FieldByName('dv_volante').AsInteger) +
          '   AND vg_numpago = ' + SqlInt(sdqDatos.FieldByName('dv_numpago').AsInteger);
  try
    EjecutarSql(sSql);
    { -- Refresca los Datos -- }
    A := VarArrayCreate([0, 3], varVariant);
    A[0] := sdqDatos.FieldByName('dv_volante').AsString;  // volante
    A[1] := sdqDatos.FieldByName('dv_numpago').AsString;  // numpago
    A[2] := sdqDatos.FieldByName('dv_tipo').AsString;     // tipo

    btnAprVolante.Enabled := bAprobar and Seguridad.Activar(btnAprVolante);
    RefreshData;
    sdqDatos.Locate('dv_volante;dv_numpago;dv_tipo', A,[]);
  except
    on E: Exception do
      ErrorMsg(E, 'No se ha podido aprobar el registro');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.DoModificarSIV;
var
  frmLiquiCarga : TfrmLiquiCarga;
  sEstado       : String;
  iNumPago      : Integer;
begin
  iNumPago      := sdqDatos.FieldByName('dv_numpago').AsInteger;
  frmLiquiCarga := TfrmLiquiCarga.Create(Self);
  try
    frmLiquiCarga.fraVolantes.OnChange := nil;
    frmLiquiCarga.Modificar(fraVolantes.edNumero.Value,
                            sdqDatos.FieldByName('dv_siniestro').AsInteger,
                            sdqDatos.FieldByName('dv_orden').AsInteger,
                            sdqDatos.FieldByName('dv_recaida').AsInteger,
                            sdqDatos.FieldByName('dv_numpago').AsInteger);
    sEstado := frmLiquiCarga.fraVolantes.Estado;
  finally
    frmLiquiCarga.Free;
  end;
  //----------------------------------------------------------------------------------------
  if not AreIn(sEstado, ['L','LM']) then
  begin
     MsgBox('El estado del volante ha cambiado.' , MB_ICONINFORMATION);
     fraVolantes.Limpiar;
     fraVolantes.edNumero.SetFocus;
     sdqDatos.Close;
  end else begin
     RefreshData;
     sdqDatos.Locate('dv_numpago', iNumPago, [])
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquiAprob.DoModificarGEN;
var
  frmLiquiCargaGen :TfrmLiquiCargaGen;
  sEstado :String;
  iNumPago :Integer;
begin
  iNumPago          := sdqDatos.FieldByName('dv_numpago').AsInteger;
  frmLiquiCargaGen  := TfrmLiquiCargaGen.Create(Self);
  try
    frmLiquiCargaGen.Modificar(fraVolantes.edNumero.Value, sdqDatos.FieldByName('dv_numpago').AsInteger);
    sEstado := frmLiquiCargaGen.fraVolantes.Estado;
  finally
    frmLiquiCargaGen.Free;
  end;
  //----------------------------------------------------------------------------------------
  if not AreIn(sEstado, ['LG','LM']) then
  begin
    MsgBox('El estado del volante ha cambiado.' , MB_ICONINFORMATION);
    fraVolantes.Limpiar;
    fraVolantes.edNumero.SetFocus;
    sdqDatos.Close;
  end
  else begin
    RefreshData;
    sdqDatos.Locate('dv_numpago', iNumPago, [])
  end;
end;
{-------------------------------------------------------------------------------}
end.
