unit unLiqCargaGen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unfraVolante, StdCtrls, Buttons, Mask, ToolEdit, DateComboBox,
  unfraConPago, CurrEdit, unfraNomenclador, Db, SDEngine,
  artSeguridad, AnsiSql, General, StrFuncs, Placemnt, CustomDlgs,
  IntEdit, unDetFact, PatternEdit, unArtFrame, unFraCodigoDescripcion,
  unArtDBAwareFrame, RxPlacemnt, RxCurrEdit, RxToolEdit, unArtDbFrame,
  unFraEmpresa;

type
  TfrmLiquiCargaGen = class(TForm)
    grpFacturas: TGroupBox;
    grpImpGen: TGroupBox;
    fraConPago: TfraConPago;
    Label1: TLabel;
    Label2: TLabel;
    dcDesde: TDateComboBox;
    dcHasta: TDateComboBox;
    Label3: TLabel;
    fraNomenclador: TfraNomenclador;
    Label6: TLabel;
    Label9: TLabel;
    edImpFact: TCurrencyEdit;
    Label10: TLabel;
    edImpConv: TCurrencyEdit;
    Label11: TLabel;
    edImpAPagar: TCurrencyEdit;
    Label7: TLabel;
    edObservaciones: TMemo;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    btnModificarVolante: TBitBtn;
    btnPrestacion: TBitBtn;
    btnLimpiar: TBitBtn;
    btnGuardar: TBitBtn;
    btnSalir: TBitBtn;
    btnImprimir: TBitBtn;
    btnNavPrimero: TSpeedButton;
    btnNavAnterior: TSpeedButton;
    btnNavSiguiente: TSpeedButton;
    btnNavUltimo: TSpeedButton;
    btnNavNuevo: TSpeedButton;
    btnRefrescar: TSpeedButton;
    edCantidad: TIntEdit;
    sdqNavigator: TSDQuery;
    edNroLiqui: TIntEdit;
    btnAnular: TSpeedButton;
    lbPrestacion: TLabel;
    sdqNavigatorVG_NUMPAGO: TFloatField;
    sdqNavigatorVG_CONPAGO: TFloatField;
    sdqNavigatorVG_PRESTADESDE: TDateTimeField;
    sdqNavigatorVG_PRESTAHASTA: TDateTimeField;
    sdqNavigatorVG_PRES_NOMENCLADOR: TStringField;
    sdqNavigatorVG_PRES_CAPITULO: TStringField;
    sdqNavigatorVG_PRES_CODIGO: TStringField;
    sdqNavigatorVG_PRESDET: TStringField;
    sdqNavigatorVG_CANTIDAD: TFloatField;
    sdqNavigatorVG_IMPFACTURADO: TFloatField;
    sdqNavigatorVG_IMPCONVENIDO: TFloatField;
    sdqNavigatorVG_IMPPAGCONRET: TFloatField;
    sdqNavigatorVG_OBSERVACIONES: TStringField;
    sdqNavigatorVG_ESTADO: TStringField;
    sdqNavigatorVG_CANTAPRO: TFloatField;
    sdqNavigatorVG_MOTIVO: TStringField;
    lbConPago: TLabel;
    fraVolantes: TfraVolantes;
    fraEmpresa: TfraEmpresa;
    Label4: TLabel;
    sdqNavigatorVG_CONTRATO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnPrestacionClick(Sender: TObject);
    procedure btnModificarVolanteClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edImpFactExit(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure NavigatorClick(Sender: TObject);
    procedure btnNavNuevoClick(Sender: TObject);
    procedure btnAnularClick(Sender: TObject);
    procedure edCantidadExit(Sender: TObject);
    procedure dcDesdeExit(Sender: TObject);
    procedure dcDesdeEnter(Sender: TObject);
    procedure edCantidadEnter(Sender: TObject);
    procedure dcHastaEnter(Sender: TObject);
    procedure dcHastaExit(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    bImprimirDetalle : Boolean;
    frmDetFact       : TfrmDetFact; // Tiene el Formulario cargado en memoria para que sea mas rápida Impresion del det de fac,.
    dDesde, dHasta: TDate;
    iCant: Integer;
    procedure CalcNroLiqui(Sender: TObject);
    procedure OnVolanteChange(Sender: TObject);
    procedure OnConPagoChange(Sender: TObject);
    procedure OnNomencladorChange(Sender: TObject);

    Function Validar(ACalcMonto : Boolean = False) : Boolean;
    Function GuardarNuevo   : Boolean;
    Function GuardarCambios : Boolean;
    Function CalcularMonto  : Boolean;
    procedure EnableNavigator(IsNew : Boolean);
    procedure ImprimirDetalle( AForzar : Boolean = False);
    procedure CalcularImpConv; // Calcula el Importe Convenido
    procedure SetPrestadorNomen(bLimpiar, bFechas, bShowVigencias: Boolean);
  public
    function Modificar(AVolante, ANumLiqui : Integer) : Boolean;
  end;

var
  frmLiquiCargaGen: TfrmLiquiCargaGen;

implementation

uses unDmPrincipal, unPrincipal, unRptVolante, Numeros, unRecepcion, unRptNotaDebito,
     unSesion, DateTimeFuncs;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.FormCreate(Sender: TObject);
begin
  fraVolantes.OnChange      := OnVolanteChange;
  fraVolantes.CalcAPagar    := cnGenerico;
  fraConPago.OnChange       := OnConPagoChange;
  fraNomenclador.OnChange   := OnNomencladorChange;
  fraNomenclador.ShowAbonos := True;
  frmDetFact                := TfrmDetFact.Create(Self);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  frmDetFact.Free;
  Action := caFree;
  frmPrincipal.mnuLiquiCarGen.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.OnVolanteChange(Sender: TObject);
var
  sSql, MsgError :String;
begin
   MsgError := '';
   sSql := 'SELECT 1 ' +
            ' FROM siv_itemvolante, svo_volantes ' +
           ' WHERE iv_volante = vo_volante ' +
             ' AND vo_volante = :Volante ' +
             ' AND iv_estado <> ''X'' ' +
             ' AND vo_mixto = ''N'' ';
   //------------------------------------------------------------------------
   if fraVolantes.edNumero.Text = '' then
      MsgError := 'no existe el volante seleccionado'
   else if ExisteSqlEx(sSql, [fraVolantes.edNumero.Value]) then
      MsgError := 'tiene asignado un Siniestro'
   else if Copy(fraVolantes.Estado, 1, 1) = 'A' then
      MsgError := 'ya ha sido Aprobado'
   else if not AreIn(fraVolantes.Estado, ['P', 'PM']) then
      MsgError := 'ha sido liquidado en su totalidad, o está pendiente de auditar o cancelado'
   else if ((fraVolantes.Estado = 'P')  and not Seguridad.Claves.IsActive('LIQUIVOLANTESSIN')) or
           ((fraVolantes.Estado = 'PM') and not Seguridad.Claves.IsActive('LIQUIVOLANTESAMP')) then
      MsgError := 'usted no posee perfil para hacerlo';
   //------------------------------------------------------------------------
   if MsgError <> '' then
   begin
      MsgBox('No se puede cargar una liquidacion Genérica para este volante porque ' + MsgError,
              MB_ICONEXCLAMATION, 'Error al cargar el Volante');
      btnLimpiarClick(Self);
   end else
      btnNavNuevoClick(Nil);

   //---------------------------------------------------------------------------
   SetPrestadorNomen(True, False, False);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.btnLimpiarClick(Sender: TObject);
begin
  if Assigned(Sender) then
  begin
    fraVolantes.Limpiar;
    if fraVolantes.edNumero.CanFocus then
      fraVolantes.edNumero.SetFocus;
  end;
  //--------------------------------------
  fraConPago.Clear;
  fraNomenclador.Limpiar;
  dcDesde.Clear;
  dcHasta.Clear;
  edNroLiqui.Text      := '';
  edCantidad.Text      := '1';
  edImpFact.Value      := 0;
  edImpConv.Value      := 0;
  edImpAPagar.Value    := 0;
  edObservaciones.Text := '';
  fraEmpresa.Clear;
  //--------------------------------------
  EnableNavigator(True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.btnGuardarClick(Sender: TObject);
begin
   if btnRefrescar.Enabled then
     GuardarCambios
   else
     if GuardarNuevo and fraVolantes.Enabled then
     begin
        btnLimpiarClick(Sender);
        fraVolantes.edNumero.SetFocus;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmLiquiCargaGen.GuardarNuevo: Boolean;
var
  Sql : String;
begin
   bImprimirDetalle := False;
   Result           := False;
   if Validar(True) then
   begin
     Sql := ' INSERT INTO svg_vol_generico ' +
            '(vg_volante, vg_numpago, vg_conpago, vg_prestadesde, vg_prestahasta, vg_pres_nomenclador, ' +
            ' vg_pres_capitulo, vg_pres_codigo, vg_presdet, vg_cantidad, vg_impfacturado, vg_impconvenido, ' +
            ' vg_imppagconret, vg_observaciones, vg_estado, vg_usualta, vg_fecalta, vg_contrato) VALUES (' +          // tk 62615 el vg_contrato
            SqlInt(fraVolantes.edNumero.Value) + ', art.amebpba.get_svg_maxnumpago(' +
            SqlInt(fraVolantes.edNumero.Value) + ')+1, ' + SqlInt(fraConPago.Value) + ',' +
            SqlDate(dcDesde.Date) + ',' + SqlDate(dcHasta.Date) + ',' +
            SqlValue(fraNomenclador.Nomenclador) + ',' + SqlValue(fraNomenclador.Capitulo) + ',' +
            SqlValue(fraNomenclador.Codigo) + ',' +
            '''' + IIF(fraNomenclador.Codigo = '0', fraNomenclador.Descripcion, '') + ''', ' +
            SqlInt(edCantidad.Text) + ', ' + SqlNumber(edImpFact.Value) + ', ' + SqlNumber(edImpConv.Value) + ', ' +
            SqlNumber(edImpAPagar.Value) + ', ' + SqlString(edObservaciones.Text, True) + ',' +
            SqlValue(fraVolantes.Estado) + ',' + SqlValue(Sesion.UserID) + ', actualdate, ' + IIF(fraEmpresa.Contrato = 0, ' null', SqlInt(fraEmpresa.Contrato)) + ')';         // tk 62615 el vg_contrato
     try
       EjecutarSql(Sql);
       fraVolantes.Refrescar;
       Result := True;
       ImprimirDetalle;
     except
       on E: Exception do
         ErrorMsg( E, 'Error al cargar la Liquidación Genérica' );
     end;
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmLiquiCargaGen.GuardarCambios: Boolean;
var
  Sql, sEstado, sUsuLiq :String;
begin
  Result := False;
  if Validar(False) then
  begin
    case CompareFloat((fraVolantes.FacPen + edImpFact.Value - sdqNavigatorVG_IMPFACTURADO.AsCurrency),
                      fraVolantes.edTotFact.Value) of
      1: begin
           Result := False;
           MsgBox('El monto facturado supera el monto del volante', MB_ICONEXCLAMATION);
           Exit;
         end;
      0: begin
            if AreIn(fraVolantes.Estado, ['P', 'PM']) then
            begin
              MsgBox('El volante se ha liquidado en su totalidad', MB_ICONINFORMATION);
              ImprimirDetalle(True);
            end;
            sEstado := IIF(fraVolantes.Estado = 'PM', 'LAG', IIF(fraVolantes.chMixto.Checked, 'LM', 'LG'));
            sUsuLiq := ', vo_usuliqui = ' + SqlValue(Sesion.UserID) +
                       ', vo_fechaliqui = ActualDate';

            btnNavNuevo.Visible := False;
         end;
     -1: begin
           sEstado := fraVolantes.Estado;
           btnNavNuevo.Visible := True;
         end;
    end;
    //------------------------------------------------------------------------------------------------------------
    try
      BeginTrans;

      Sql := 'UPDATE svo_volantes ' +
               ' SET vo_facpen = vo_facpen - ' +  SqlNumber(sdqNavigatorVG_IMPFACTURADO.AsCurrency) + ' + ' +
                                                  SqlNumber(edImpFact.Value) + ', ' +
                   ' vo_estado = ' + SqlValue(sEstado) + sUsuLiq + ',' + 
                   ' vo_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                   ' vo_fechamodif = Actualdate ' +
             ' WHERE vo_volante = ' +  SqlInt(fraVolantes.edNumero.Value);
      EjecutarSqlST(Sql);

      Sql := ' UPDATE svg_vol_generico ' +
                ' SET vg_conpago = ' + SqlInt(fraConPago.Value) + ', ' +
                    ' vg_prestadesde = ' + SqlDate(dcDesde.Date) + ', ' +
                    ' vg_prestahasta = ' + SqlDate(dcHasta.Date) + ', ' +
                    ' vg_pres_nomenclador = ' + SqlValue(fraNomenclador.Nomenclador) + ',' +
                    ' vg_pres_capitulo = ' + SqlValue(fraNomenclador.Capitulo) + ',' +
                    ' vg_pres_codigo = ' + SqlValue(fraNomenclador.Codigo) + ',' +
                    ' vg_presdet = ''' + IIF(fraNomenclador.Codigo = '0', fraNomenclador.Descripcion, '') + ''', ' +
                    ' vg_cantidad = ' + edCantidad.TextSql + ', ' +
                    ' vg_impfacturado = ' + SqlNumber(edImpFact.Value) + ', ' +
                    ' vg_impconvenido = ' + SqlNumber(edImpConv.Value) + ', ' +
                    ' vg_imppagconret = ' + SqlNumber(edImpAPagar.Value) + ', ' +
                    ' vg_observaciones = ' + SqlString(edObservaciones.Text, True) + ', ' +
                    ' vg_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' vg_fecmodif = sysdate, ' +
                    ' vg_contrato = ' + IIF(fraEmpresa.Contrato = 0, ' null ', SqlInt(fraEmpresa.Contrato)) +      // TK 62615
              ' WHERE vg_volante = ' + SqlInt(fraVolantes.edNumero.Value) +
                ' AND vg_numpago = ' + SqlInt(edNroLiqui.Value);
      EjecutarSqlST(Sql);
      CommitTrans;
      Result := True;
    except
      on E: EDatabaseError do
      begin
        MsgBox('Error al cargar la Liquidación Genérica' + #13 + E.Message, MB_ICONERROR);
        Rollback;
      end else begin
        MsgBox('Error al cargar la Liquidación Genérica', MB_ICONERROR);
        Rollback;
      end;
    end;
    fraVolantes.Refrescar;
    sdqNavigator.Close;
    sdqNavigator.Open;
    sdqNavigator.Locate('VG_NUMPAGO', edNroLiqui.Value, []);

    // Si está deshabilitado LIMPIAR es porque se ejecutó por MODIFICAR
    if AreIn(fraVolantes.Estado, ['LG', 'LM', 'LAG'])  and (btnLimpiar.Enabled) then
       btnLimpiarClick(Self);
 end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmLiquiCargaGen.Validar(ACalcMonto : Boolean = False) : Boolean;
const
  sMbTitulo = 'Error al validar los datos del Formulario';
begin
  Result := False;
  if fraConPago.IsEmpty then
     InvalidMsg(fraConPago.edCodigo, 'Debe cargar un concepto de pago', sMbTitulo)
  else if not(fraNomenclador.IsSelected) and fraNomenclador.ExigePrestacion then
  begin
    MsgBox('Debe cargar la prestación para el volante seleccionado.', MB_ICONEXCLAMATION, sMbTitulo);
    fraNomenclador.SetFocus;
  end
  else if edImpFact.Value = 0 then
  begin
    MsgBox('Debe ingresar el Importe Facturado', MB_ICONEXCLAMATION, sMbTitulo);
    edImpFact.SetFocus;
  end
  else if edImpFact.Value < edImpAPagar.Value then
  begin
    MsgBox('El importe a pagar no puede ser mayor al Facturado', MB_ICONEXCLAMATION, sMbTitulo);
    edImpFact.SetFocus;
  end
  else if (edImpConv.Value > 0) and (edImpAPagar.Value > edImpConv.Value) then
  begin
    MsgBox('El monto a pagar supera al convenido', MB_ICONEXCLAMATION, sMbTitulo);
    edImpAPagar.SetFocus;
  end
  else if (fraVolantes.Ajuste > 0) and (edImpAPagar.Value <> edImpFact.Value) then
  begin
    MsgBox('En las devoluciones de ajuste, el importe a pagar debe ser igual al facturado.',  MB_ICONEXCLAMATION);
    edImpAPagar.SetFocus;
  end
  else if (CompareFloat(fraVolantes.FacPen + edImpFact.Value - sdqNavigatorVG_IMPFACTURADO.AsCurrency,
                        fraVolantes.edTotFact.Value) = 0) and
          ExisteSqlEx('SELECT 1 ' +
                       ' FROM sin.sdv_debitosvolantes ' +
                      ' WHERE dv_volante = :volante ' +
                        ' AND dv_fechabaja IS NULL ' +
                        ' AND dv_aplicado = ''N'' ' +
                        ' AND dv_observacioninterna = ''N'' ', [fraVolantes.edNumero.Value]) then
    MsgBox('El volante no puede quedar liquidado ya que posee débitos ' + #13 +
           'de auditoría médica que aun no han sido aplicados.', MB_ICONEXCLAMATION)
  else
    Result := (Not ACalcMonto) or CalcularMonto;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.btnSalirClick(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.OnConPagoChange(Sender: TObject);
begin
  if fraConPago.IsEmpty and Visible then
    fraConPago.edCodigo.SetFocus;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.OnNomencladorChange(Sender: TObject);
begin
  CalcularImpConv;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.btnPrestacionClick(Sender: TObject);
var
  TotFact :Currency;
begin
  TotFact := fraVolantes.edTotFact.Value;
  // Guarda los Cambios y no Limpia el Volante
  if GuardarNuevo then
  begin
    if (fraVolantes.FacPen = TotFact) then
    begin
       btnLimpiarClick(Self);
       fraVolantes.edNumero.SetFocus;
    end else begin
       btnLimpiarClick(nil);
       fraConPago.edCodigo.SetFocus;
       EnableNavigator(False); // Fede 01/06/2000
    end;
    CalcNroLiqui(Nil);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.btnModificarVolanteClick(Sender: TObject);
begin
  if (fraVolantes.edNumero.Text = '') then
    MsgBox('Debe seleccionar algún volante para poder modificarlo', MB_ICONEXCLAMATION)
  else if AreIn(fraVolantes.Estado, ['L', 'LG', 'LM', 'LAG']) then
    MsgBox('No se puede modificar el volante porque ya ha sido liquidado', MB_ICONEXCLAMATION)
  else
    with TfrmRecepcion.Create(Self) do
      if Modificar(StrToInt(fraVolantes.edNumero.Text)) then
        fraVolantes.Refrescar;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmLiquiCargaGen.CalcularMonto: Boolean;
var
  Sql, sEstado :String;
  TotFact :Currency;
begin
// PTD. 16/05/2002 se restan monto Percepcion y monto Debito (símil EJV)
  TotFact := (fraVolantes.edTotFact.Value - fraVolantes.edVO_MONTOPERCEPCION.Value - fraVolantes.edVO_MONTODEBITO.Value );
  case CompareFloat( ( fraVolantes.FacPen + edImpFact.Value), TotFact) of
     1 : ChkDialog('LiquiGenMayor', 'El monto supera al monto liquidado');
     0 : begin
           sEstado := IIF(fraVolantes.Estado = 'PM', 'LAG', IIF(fraVolantes.chMixto.Checked, 'LM', 'LG'));
           Sql     := ' UPDATE svo_volantes ' +
                         ' SET vo_facpen = vo_facpen + ' + SqlNumber(edImpFact.Value) + ', ' +
                             ' vo_estado = ' + SqlValue(sEstado) + ',' +
                             ' vo_usuliqui = ' + SqlValue(Sesion.UserID) + ',' +
                             ' vo_fechaliqui = ActualDate ' +
                       ' WHERE vo_volante = ' + SqlInt(fraVolantes.edNumero.Value);
           MsgBox('El volante ha sido liquidado en su totalidad.', MB_ICONINFORMATION);
           bImprimirDetalle := True;
           // Desactiva el botón "Nuevo" cuando se entra por Modificar
           btnNavNuevo.Visible := fraVolantes.Enabled;
         end
         else begin
           Sql := ' UPDATE svo_volantes ' +
                     ' SET vo_facpen = vo_facpen + ' + SqlNumber(edImpFact.Value) +
                   ' WHERE vo_volante = ' + SqlInt(fraVolantes.edNumero.Value);
           MsgBox('Quedan $' + CurrToStr(TotFact - ( fraVolantes.FacPen + edImpFact.Value)) + ' por Liquidar.', MB_ICONINFORMATION);
         end;
  end; // Case
  try
    if Sql <> '' then
    begin
      EjecutarSql(Sql);
      Result := True;
    end else
      Result := False;
  except
    Result := False;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.btnImprimirClick(Sender: TObject);
begin
  if (fraVolantes.edNumero.Text = '') then
    MsgBox('Debe seleccionar algún volante para poder imprimirlo', MB_ICONEXCLAMATION)
  else
    with TrptVolante.Create(Self) do
    begin
      sdqConsulta.Close;
      sdqConsulta.ParamByName('pVolante').AsInteger := StrToInt(fraVolantes.edNumero.Text);
      sdqConsulta.Open;
      PreviewModal;
      Free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.edImpFactExit(Sender: TObject);
begin
  if edImpFact.Value = 0 then
  begin
    if ChkDialog('ImpFactCeroGen', 'El importe facturado no puede ser cero', 'Error de Validación') < 1 then
      edImpFact.SetFocus;
  end else
  begin
    if edImpConv.Value > 0 then
      edImpAPagar.Value := MinFloat(edImpConv.Value, edImpFact.Value)
    else
      edImpAPagar.Value := edImpFact.Value;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.btnRefrescarClick(Sender: TObject);
begin
   SetPrestadorNomen(True, False, True);
   fraNomenclador.MostrarUtilizado := True;   // TK 32945
   fraConPago.Value     := sdqNavigatorVG_CONPAGO.AsString;
   edNroLiqui.Text      := sdqNavigatorVG_NUMPAGO.AsString;
   dcDesde.Date         := sdqNavigatorVG_PRESTADESDE.AsDateTime;
   dcHasta.Date         := sdqNavigatorVG_PRESTAHASTA.AsDateTime;
   fraNomenclador.Cargar(sdqNavigatorVG_PRES_NOMENCLADOR.AsString,
                         sdqNavigatorVG_PRES_CAPITULO.AsString,
                         sdqNavigatorVG_PRES_CODIGO.AsString);
   edCantidad.Text      := sdqNavigatorVG_CANTIDAD.AsString;
   edImpFact.Value      := sdqNavigatorVG_IMPFACTURADO.AsCurrency;
   edImpConv.Value      := sdqNavigatorVG_IMPCONVENIDO.AsCurrency;
   edImpAPagar.Value    := sdqNavigatorVG_IMPPAGCONRET.AsCurrency;
   edObservaciones.Text := sdqNavigatorVG_OBSERVACIONES.AsString;
   fraEmpresa.Contrato  := sdqNavigatorVG_CONTRATO.AsInteger;    // TK 62615
   fraNomenclador.MostrarUtilizado := False;  // TK 32945
   SetPrestadorNomen(False, True, False);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.NavigatorClick(Sender: TObject);
var
  Activo :Boolean;
begin
  Activo := sdqNavigator.Active;
  if Not Activo then
  begin
    sdqNavigator.ParamByName('pVolante').AsString := fraVolantes.edNumero.Text;
    sdqNavigator.Open;
    if sdqNavigator.IsEmpty then
    begin
      EnableNavigator(True);
      sdqNavigator.Close;
      exit;
    end;
    sdqNavigator.Last;
  end;
  if Sender is TSpeedButton then
    case TSpeedButton(Sender).Tag of
      0: sdqNavigator.First;
      1: if Activo then sdqNavigator.Prior;
      2: sdqNavigator.Next;
      3: sdqNavigator.Last;
    end;
   //--------------------------------------------------------
   EnableNavigator(False);
   btnRefrescar.Enabled := True;
   btnRefrescarClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.EnableNavigator(IsNew : Boolean);
begin
   if IsNew then
      btnAnular.Enabled := False
   else
      btnAnular.Enabled := Seguridad.Activar(btnAnular);
   //-----------------------------------------------------------------------------
   if Seguridad.Claves.IsActive('NAVEGADOR') then
     if IsNew then
     begin
        btnNavAnterior.Enabled  := (edNroLiqui.Value > 1);
        btnNavPrimero.Enabled   := (edNroLiqui.Value > 1);
        btnNavSiguiente.Enabled := False;
        btnNavUltimo.Enabled    := False;
        btnNavNuevo.Enabled     := False;
        btnPrestacion.Enabled   := Seguridad.Activar(btnPrestacion);
     end else if sdqNavigator.Active then
     begin
        btnNavAnterior.Enabled  := not (sdqNavigator.RecNo = {$IFDEF VER150}0{$ELSE}1{$ENDIF});
        btnNavPrimero.Enabled   := not (sdqNavigator.RecNo = {$IFDEF VER150}0{$ELSE}1{$ENDIF});
        btnNavSiguiente.Enabled := not (sdqNavigator.RecNo = sdqNavigator.RecordCount {$IFDEF VER150}- 1{$ENDIF});
        btnNavUltimo.Enabled    := not (sdqNavigator.RecNo = sdqNavigator.RecordCount {$IFDEF VER150}- 1{$ENDIF});
        btnNavNuevo.Enabled     := True;
        btnPrestacion.Enabled   := False;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.btnNavNuevoClick(Sender: TObject);
begin
   btnRefrescar.Enabled := False;
   btnLimpiarClick(Nil);
   CalcNroLiqui(Nil);
   EnableNavigator(True);
   sdqNavigator.Close;
   fraConPago.edCodigo.SetFocus;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.CalcNroLiqui(Sender: TObject);
begin
  if fraVolantes.edNumero.Text = '' then
    edNroLiqui.Text := ''
  else
    edNroLiqui.Text := ValorSqlEx('SELECT art.amebpba.get_svg_maxnumpago(:vol) + 1 ' +
                                   ' FROM dual', [fraVolantes.edNumero.Value]);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.btnAnularClick(Sender: TObject);
var
  sSql, sEstado : String;
begin
  if MsgBox('¿Desea anular el consumo para el siniestro seleccionado?', MB_ICONQUESTION + MB_YESNO ) = IDYES then
  try
    BeginTrans;
    sSql := ' UPDATE svg_vol_generico  ' +
               ' SET vg_estado = ''X'', ' +
                   ' vg_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                   ' vg_fecmodif = sysdate ' +
             ' WHERE vg_volante = 0' + fraVolantes.edNumero.Text +
               ' AND vg_numpago = ' + edNroLiqui.TextSql;
    EjecutarSqlST(sSql);

    sEstado := IIF(fraVolantes.Estado = 'LAG', 'PM', 'P');

    sSql := ' UPDATE svo_volantes ' +
               ' SET vo_facpen = vo_facpen - ' + SqlNumber(sdqNavigatorVG_IMPFACTURADO.AsCurrency) + ',' +
                   ' vo_estado = ' + SqlValue(sEstado) + ',' +
                   ' vo_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                   ' vo_fechamodif = Actualdate ' +
             ' WHERE vo_volante = 0' + fraVolantes.edNumero.Text;
    EjecutarSqlST(sSql);

    CommitTrans;
    btnLimpiarClick(Nil);
    fraVolantes.Refrescar;
    EnableNavigator(False);
    btnNavNuevo.Visible := True;
    except
      on E: EDatabaseError do
      begin
        MsgBox('Error al Anular la Liquidación: ' +  E.Message,  MB_ICONERROR);
        Rollback;
      end
      else begin
        MsgBox('Error Inesperado al Anular la Liquidación',  MB_ICONERROR);
        Rollback;
      end;
    end;
    sdqNavigator.Close;
    NavigatorClick( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmLiquiCargaGen.Modificar(AVolante, ANumLiqui: Integer): Boolean;
begin
   fraVolantes.OnChange := nil;
   fraVolantes.Cargar(AVolante);
   fraVolantes.Enabled  := False;

   sdqNavigator.Close;
   sdqNavigator.ParamByName('pVolante').AsInteger := AVolante;
   sdqNavigator.Open;
   sdqNavigator.Locate('VG_NUMPAGO', ANumLiqui, []);

   btnLimpiar.Enabled   := False;
   btnNavNuevo.Visible  := False;
   btnRefrescar.Enabled := True;
   btnRefrescarClick(Nil);
   EnableNavigator(False);

   Result := (ShowModal = mrOk);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.ImprimirDetalle(AForzar : Boolean = False);
begin
{
  if bImprimirDetalle or AForzar then
  begin
    if (fraVolantes.Ajuste = 0) then
      frmDetFact.Imprimir(fraVolantes.edNumero.Value, IIF(fraVolantes.chMixto.Checked, tfMixta, tfGenerica))
    else with TrptNotaDebito.Create(Self) do
    try
      ImprimirDevAjuste(fraVolantes.edNumero.Value, IIF(fraVolantes.chMixto.Checked, tnMixta, tnGenerica), trPrint);
    finally
      Free;
    end;
  end;
}
end;
procedure TfrmLiquiCargaGen.Label4Click(Sender: TObject);
begin

end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.CalcularImpConv;
var
  sSql :String;
begin
  if (Not fraNomenclador.IsSelected) then
    edImpConv.Text := ''
  else
  try
    sSql := 'SELECT amebpba.get_val_prestacion(:prestador, :nomenclador, :capitulo, :codigo, ' +
                                              ' Null, Null, Null, :fsolicitud) ' +
             ' FROM dual ';

    if (edImpAPagar.Value = edImpConv.Value) or (edImpAPagar.Value = edImpFact.Value) then
      edImpAPagar.Value := 0;

    edImpConv.Text  := ValorSqlEx(sSql, [fraVolantes.edPrestIdentif.Value, fraNomenclador.Nomenclador,
                                         fraNomenclador.Capitulo, fraNomenclador.Codigo,
                                         TDateTimeEx.Create(dcDesde.Date)]);
    edImpConv.Value := edImpConv.Value * edCantidad.Value;

    if edImpAPagar.Value = 0 then
    begin
      if edImpConv.Value > 0 then
        edImpAPagar.Value := MinFloat(edImpConv.Value, edImpFact.Value)
      else
        edImpAPagar.Value := edImpFact.Value;
    end;

   except
      on E: Exception do ErrorMsg(E, 'Error al Calcular en Monto Convenido.');
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.edCantidadExit(Sender: TObject);
begin
  if (iCant <> edCantidad.Value) then
    CalcularImpConv;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.dcDesdeExit(Sender: TObject);
begin
  if (dDesde <> dcDesde.Date) then
    SetPrestadorNomen(True, True, False);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.dcDesdeEnter(Sender: TObject);
begin
  dDesde := dcDesde.Date;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.edCantidadEnter(Sender: TObject);
begin
  iCant := edCantidad.Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.dcHastaEnter(Sender: TObject);
begin
  dHasta := dcHasta.Date;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.dcHastaExit(Sender: TObject);
begin
  if (dHasta <> dcHasta.Date) then
  begin
    SetPrestadorNomen(True, True, False);
    if fraNomenclador.CanFocus then
      fraNomenclador.SetFocus;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCargaGen.SetPrestadorNomen(bLimpiar, bFechas, bShowVigencias: Boolean);
begin
   with fraNomenclador do
   begin
     if bLimpiar then Limpiar;
     ShowVigencias           := bShowVigencias;
     Vigencia                := IIF(bFechas, dcHasta.Date, 0);
     FechaSolicitud          := IIF(bFechas, dcDesde.Date, 0);
     EsDeAMP                 := (fraVolantes.Estado = 'PM');
     Prestador               := fraVolantes.edPrestIdentif.Value;
     lbPrestacion.Font.Color := IIF(ExigePrestacion, clRed, clBlack);
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
