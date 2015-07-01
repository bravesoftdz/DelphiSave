unit unLiqAMPAprob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, unfraVolante, StdCtrls, Grids, DBGrids, RXDBCtrl, Placemnt, Db,
  SDEngine, Buttons, General, Registros, artSeguridad, CustomDlgs, AnsiSql,
  ShortCutControl, SortDlg, Mask, ToolEdit, CurrEdit, IntEdit, FormPanel,
  PatternEdit {$IFNDEF VER130}, Variants{$ENDIF};

type
  TfrmLiqAMPAprob = class(TForm)
    grpVolante: TGroupBox;
    dbgDatos: TRxDBGrid;
    pnlBotones: TPanel;
    FormPlacement: TFormPlacement;
    pnlColores: TPanel;
    pnlColor4: TPanel;
    pnlColor3: TPanel;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    btnAprVolante: TSpeedButton;
    btnSalir: TSpeedButton;
    ColorDialog: TColorDialog;
    Seguridad: TSeguridad;
    btnColores: TSpeedButton;
    sdqTmp: TSDQuery;
    pnlColor6: TPanel;
    pnlDestino: TPanel;
    Label8: TLabel;
    edDestino: TEdit;
    ShortCutControl: TShortCutControl;
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
    btnEditarLiq: TSpeedButton;
    fraVolantesLiq: TfraVolantes;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pnlColorClick(Sender: TObject);
    procedure dbgDatosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnSalirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAprVolanteClick(Sender: TObject);
    procedure btnColoresClick(Sender: TObject);
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormDockDrop(Sender: TObject; Source: TDragDockObject; X, Y: Integer);
    procedure FormGetSiteInfo(Sender: TObject; DockClient: TControl; var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
    procedure btnOrdenClick(Sender: TObject);
    procedure btnEditarLiqClick(Sender: TObject);
  private
    bAprobar : Boolean;
    procedure VolanteChange(Sender: TObject);
    procedure MostrarNotaDeDebito;
    procedure AprobarResto;
    procedure AprobarRestoSVG;
    procedure ImprimirNotaDebito;
    procedure RefreshData;
    procedure BonificarFactura;
  public
  end;

var
  frmLiqAMPAprob: TfrmLiqAMPAprob;

implementation

uses
  unPrincipal, unPedidoInfo, unLiqCarga, unDmPrincipal, unLiqAMPNotaDebito,
  unSesion, unRptNDAMP, StrFuncs, Numeros, unArt{$IFDEF VER140}, Variants{$ENDIF},
  unLiqAMPCarga;

{$R *.DFM}
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuLiqAMPAprob.Enabled := True;
  // Guarda los Colores Seleccionados
  SetRegFromValue(Self, pnlColor3.Hint, IntToStr(pnlColor3.Color));
  SetRegFromValue(Self, pnlColor4.Hint, IntToStr(pnlColor4.Color));
  SetRegFromValue(Self, pnlColor6.Hint, IntToStr(pnlColor6.Color));
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.VolanteChange(Sender: TObject);
var
  sMsg, sEstado :String;
begin
  sEstado := fraVolantesLiq.Estado;

  if fraVolantesLiq.sdqBusqueda.IsEmpty then
     sMsg := 'No se ha encontrado el volante.'
  else if (sEstado = 'C') then
     sMsg := 'La factura ha sido anulada.'
  else if AreIn(sEstado, ['AAM', 'AAG']) then
     sMsg := 'La factura ha sido aprobada por ' + fraVolantesLiq.sdqBusquedaVO_USUAPRO.AsString +
            ' el día ' + fraVolantesLiq.sdqBusquedaVO_FECHAPRO.AsString + '.'
  else if AreIn(sEstado, ['EAM', 'EAG']) then
     sMsg := 'La liquidación de la factura ha sido abonada.'
  else if not(AreIn(sEstado, ['LAM', 'LAG'])) then
     sMsg := 'La factura seleccionada no fue liquidada en su totalidad.';
  if sMsg <> '' then
  begin
    InvalidMsg(fraVolantesLiq.edNumero, sMsg, 'Error al buscar la factura...');
    sdqDatos.Close;
    fraVolantesLiq.Limpiar;
    btnAprVolante.Enabled   := False;
  end
  else begin
    // Verifica si el usuario está habilitado para Aprobar y/o Modificar el Vol. Segun el Monto
    bAprobar := IsInRange('P', fraVolantesLiq.sdqBusquedaVO_MONTO.AsCurrency);
    // Activa y/o desactiva los botones
    btnAprVolante.Enabled := bAprobar and Seguridad.Activar(btnAprVolante);
    RefreshData;
    if fraVolantesLiq.edNumero.Value > 0 then
       fraVolantesLiq.edEstado.Text := fraVolantesLiq.edEstado.Text + ' (Monto Pagado: ' +
                                     ValorSql('SELECT FMTNUMBER(amebpba.get_montopagado(' + fraVolantesLiq.edNumero.TextSql + ')) FROM DUAL ') + ')';
  end;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.FormCreate(Sender: TObject);
begin
  fraVolantesLiq.OnChange := VolanteChange;

  pnlColor3.Color := StrToInt(GetRegFromValue(Self, pnlColor3.Hint, IntToStr(pnlColor3.Color)));
  pnlColor4.Color := StrToInt(GetRegFromValue(Self, pnlColor4.Hint, IntToStr(pnlColor4.Color)));
  pnlColor6.Color := StrToInt(GetRegFromValue(Self, pnlColor6.Hint, IntToStr(pnlColor6.Color)));
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.pnlColorClick(Sender: TObject);
begin
   ColorDialog.Color := TPanel(Sender).Color;
   if ColorDialog.Execute then
      TPanel(Sender).Color := ColorDialog.Color;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.dbgDatosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (Not Highlight) and
     (not (StrLeft(sdqDatos.FieldByName('if_estado').AsString, 1) = 'A')) then
   case sdqDatos.FieldByName('ESTADO').AsInteger of
     3: Background := pnlColor3.Color;
     4: Background := pnlColor4.Color;
     6: Background := pnlColor6.Color;
   else Background := clWindow;
  end;

  end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.btnSalirClick(Sender: TObject);
begin
  Close;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 116) and (Shift = []) and sdqDatos.Active then
    RefreshData;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.btnAprVolanteClick(Sender: TObject);
var
  Sql, sEstado: String;
  bBonif : Boolean;
begin
  if fraVolantesLiq.edNumero.Value = 0 then
    Exit;

  Verificar(((not(fraVolantesLiq.CheckInput)) or
              (not(sdqDatos.Active) or sdqDatos.IsEmpty)) and
             (fraVolantesLiq.edTotFact.Value <> fraVolantesLiq.edVO_MONTODEBITO.Value),
            fraVolantesLiq.edNumero, 'Debe seleccionar un volante.');

  Sql := 'SELECT ca_fecharevision ' +
          ' FROM cpr_prestador, svo_volantes ' +
         ' WHERE ca_identificador = vo_prestador ' +
           ' AND ca_identificador = :IdPrest ' +
           ' AND vo_volante = :iVolante ';
  Verificar((ValorSqlDateTimeEx(Sql, [fraVolantesLiq.edPrestIdentif.TextSql, fraVolantesLiq.edNumero.Value], -1) = 0),
             fraVolantesLiq.edPrestRSocial, 'El prestador no posee fecha de revisión');

  Sql := 'SELECT 1 ' +
         '  FROM svo_volantes ' +
         ' WHERE ABS(art.amebpba.imp_negativo_amp(vo_volante)) + vo_montodebito <> vo_monto ' +
         '   AND vo_volante = ' + SqlInt(fraVolantesLiq.edNumero.Value);
  bBonif := ExisteSql(Sql);

  if bBonif then
    edBonifPrestador.Text := ValorSql('SELECT ca_bonificacion FROM cpr_prestador WHERE ca_identificador = ' +
                             fraVolantesLiq.edPrestIdentif.TextSql)
  else
    edBonifPrestador.Value := 0;

  edBonifFactura.Value  := 0;

  if (not bBonif) or (fpBonificacion.ShowModal = mrOk) then
    try
      BeginTrans;

      // Muestra la Ventana con la Nota de Debito
      MostrarNotaDeDebito;

      // Aprueba el resto que no aparece en la lista de la Nota de Debito
      AprobarResto;
      AprobarRestoSVG;

      BonificarFactura;

      sEstado := IIF(fraVolantesLiq.Estado = 'LAM', 'AAM', 'AAG');
      // Aprueba Volante
      Sql := 'UPDATE SVO_VOLANTES ' +
             '   SET VO_PORBONI = ' + SqlValue(edBonifPrestador.Value) + ', ' +
             '       VO_MONTOBONI = (((VO_MONTO + ART.AMEBPBA.IMP_NEGATIVO_AMP(VO_VOLANTE))* '+ SqlValue(edBonifPrestador.Value) + ') / 100) * (-1), ' +
             '       VO_USUMODIF = ' + SqlValue(Sesion.UserID) + ', ' +
             '       VO_FECHAMODIF = ACTUALDATE, ' +
             '       VO_ESTADO = ' + SqlValue(sEstado) + ',' +
             '       VO_BONIFICACION = ' +  SqlNumber(edBonifFactura.Value) + ', ' +
             '       VO_FECHAPRO = ACTUALDATE, ' +
             '       VO_USUAPRO = ' + SqlValue(Sesion.UserID) +
             ' WHERE VO_VOLANTE = ' + fraVolantesLiq.edNumero.TextSql;
      EjecutarSqlST(Sql);

      // Genera Nota de Debito
      if not CheckView('MND_NOTADEBITOAMP') then
        MessageDlg('No se podrá imprimir la nota de débito porque la ' + #13 +
                   'vista que la genera se encuentra inválida.' + #13 +
                   'Vista: ART.MND_NOTADEBITOAMP', mtError, [], 0)
      else begin
        Sql := 'SELECT 1 FROM art.mnd_notadebitoamp WHERE nd_idvolante = ' + fraVolantesLiq.edNumero.Text;
        if (ValorSQL(SQL) = '1') then begin
          Sql := 'UPDATE svo_volantes ' +
                 '   SET vo_notadebito = ART.SEQ_SND_NOTADEBITO_ART.NEXTVAL ' +
                 ' WHERE vo_volante = ' + fraVolantesLiq.edNumero.Text;
          EjecutarSQLST(SQL);
        end;

        // Imprime la Nota de Débito
        ImprimirNotaDebito;
      end;

      CommitTrans;
    except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg(E);
      end;
    end;

  fraVolantesLiq.Limpiar;
  fraVolantesLiq.edNumero.SetFocus;

  sdqDatos.Close;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.MostrarNotaDeDebito;
var
  frmLiqNotaDebito: TfrmLiqAMPNotaDebito;
begin
  frmLiqNotaDebito := TfrmLiqAMPNotaDebito.Create(Self);
  try
     frmLiqNotaDebito.Mostrar(StrToInt('0' + fraVolantesLiq.edNumero.Text));
  finally
     frmLiqNotaDebito.Free;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.btnColoresClick(Sender: TObject);
begin
  pnlColores.Visible := btnColores.Down;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.FormDockOver(Sender: TObject;  Source: TDragDockObject; X, Y: Integer; State: TDragState;  var Accept: Boolean);
begin
  Accept := (Source.Control = pnlColores) and (Y > grpVolante.Height) and (Y < pnlBotones.Top);
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.FormDockDrop(Sender: TObject;  Source: TDragDockObject; X, Y: Integer);
begin
  Source.Control.Align := alRight;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.AprobarResto;
Var
  Sql : String;
begin
  sdqTmp.Close;
  sdqTmp.ParamByName('pVolante').AsInteger := StrToInt('0' + fraVolantesLiq.edNumero.Text);
  sdqTmp.Open;

  if not sdqTmp.Eof then
    repeat
      Sql := 'UPDATE sif_itemfacturaamp ' +
             '   SET if_estado = ''AAM'', ' +
             '       if_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
             '       if_fechamodif = ACTUALDATE ' +
             ' WHERE if_id = ' + SqlValue(sdqTmp.FieldByName('if_id').AsInteger) +
             '   AND if_estado = ''P'' ';
      EjecutarSqlST(Sql);

      sdqTmp.Next;
    until sdqTmp.Eof;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.AprobarRestoSVG;
var
  sSql :String;
  iVol: Integer;
begin
  iVol := fraVolantesLiq.edNumero.Value;
  sSql := 'SELECT vg_impconvenido, vg_imppagconret, vg_volante, vg_numpago, ' +
                ' vg_conpago, vg_prestadesde, vg_prestahasta, vg_pres_nomenclador, ' +
                ' vg_pres_capitulo, vg_pres_codigo, vg_presdet, vg_cantidad, ' +
                ' vg_cantapro ' +
           ' FROM svg_vol_generico ' +
          ' WHERE vg_volante = :pvolante ' +
            ' AND vg_estado = ''PM'' ';
  with GetQueryEx(sSql, [iVol]) do
  try
    if not Eof then
    begin
      repeat
       if (FieldByName('vg_impconvenido').AsFloat > 0) and
          (FieldByName('vg_impconvenido').AsFloat < FieldByName('vg_imppagconret').AsFloat) then
       begin
         sSql := 'UPDATE svg_vol_generico ' +
                   ' SET vg_estado = ''AP1'', ' +
                       ' vg_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                       ' vg_fecmodif = actualdate ' +
                 ' WHERE vg_volante = ' +  SqlInt(iVol) +
                   ' AND vg_numpago = ' + SqlInt(FieldByName('vg_numpago').AsInteger) +
                   ' AND vg_estado = ''PM''';
          EjecutarSqlST(sSql);
          //---------------------------------------------------------------------------------------------------------//
          sSql := 'INSERT INTO svg_vol_generico ' +
                  '(vg_volante, vg_numpago, vg_conpago, vg_prestadesde, vg_prestahasta, ' +
                  ' vg_pres_nomenclador, vg_pres_capitulo, vg_pres_codigo, vg_presdet, ' +
                  ' vg_cantidad, vg_impfacturado, vg_estado, vg_usualta, vg_fecalta) VALUES (' +
                  SqlInt(iVol) + ', art.amebpba.get_svg_maxnumpago(' + SqlInt(iVol) + ') +1, ' +
                  SqlInt(FieldByName('vg_conpago').AsInteger) + ',' +
                  SqlDate(FieldByName('vg_prestadesde').AsDateTime) + ', ' +
                  SqlDate(FieldByName('vg_prestahasta').AsDateTime) + ', ' +
                  SqlValue(FieldByName('vg_pres_nomenclador').AsString) + ',' +
                  SqlValue(FieldByName('vg_pres_capitulo').AsString) + ',' +
                  SqlValue(FieldByName('vg_pres_codigo').AsString) + ',' +
                  SqlValue(FieldByName('vg_presdet').AsString) + ',' +
                  SqlNumber(FieldByName('vg_cantidad').AsFloat -
                            FieldByName('vg_cantapro').AsFloat) + ', ' +
                  SqlNumber(Abs(FieldByName('vg_imppagconret').AsFloat -
                                FieldByName('vg_impconvenido').AsFloat) * (-1)) + ', ' +
                  '''C4'', ' + SqlValue(Sesion.UserID) + ', ActualDate)' ;
          EjecutarSqlST(sSql);
       end
       else begin
          sSql := 'UPDATE svg_vol_generico ' +
                   ' SET vg_estado = ''AAG'', ' +
                       ' vg_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                       ' vg_fecmodif = ActualDate ' +
                 ' WHERE vg_volante = ' + SqlInt(iVol) +
                   ' AND vg_numpago = ' + SqlInt(FieldByName('vg_numpago').AsInteger) +
                   ' AND vg_estado  = ''PM''';
          EjecutarSQLST(ssql);
       end;
       //-----------------------------------------------------------------//
       Next;
     until Eof;
   end;
  finally
    Free;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.ImprimirNotaDebito;
begin
  with TrptNDAMP.Create(Self) do
  try
    try
      ImprimirNDAMP(StrToInt('0' + fraVolantesLiq.edNumero.Text));
    except
      {Si captura el error para que se guarden los cambios pero no se imprima la nota de debito}
    end;
  finally
    Free;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.FormGetSiteInfo(Sender: TObject;  DockClient: TControl; var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
begin
  InfluenceRect := Rect(Width - pnlColores.Width,
                        grpVolante.Height,
                        Width - 2,
                        pnlBotones.Top) ;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.RefreshData;
begin
  // Carga la Grilla con los datos de los Items del Volante
  sdqDatos.Close;
  sdqDatos.ParamByName('pVolante').AsString :=  fraVolantesLiq.edNumero.TextSql;
  sdqDatos.Open;

  // Si es una devolucion de Ajuste, no deja generar notas de débito
  if btnAprVolante.Enabled and (fraVolantesLiq.Ajuste > 0) then begin
    sdqDatos.DisableControls;
    sdqDatos.First;

    repeat
      if (sdqDatos.FieldByName('ESTADO').AsInteger > 0) and
         (not(StrLeft(sdqDatos.FieldByName('if_estado').AsString, 1) = 'A')) then
      begin
        btnAprVolante.Enabled := False;
        Break;
      end;
      sdqDatos.Next;
    until sdqDatos.EoF;

    sdqDatos.First;
    sdqDatos.EnableControls;
  end;

  edDestino.Text := TXT_EMP_RSOCIAL;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.btnOrdenClick(Sender: TObject);
begin
  SortDialog.Execute;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.BonificarFactura;
var
  sdqConsulta : TSDQuery;
  Sql         : String;
  rImpDebito  : Currency;
  seqVolante,
  seqPago    : Integer;
begin
  if edBonifFactura.Value > 0 then
  begin
    Sql := 'SELECT if_id, if_idvolante, if_idlote, if_idempresa, if_idestableci, ' +
           '       if_cantfacturada, if_valorfacturado, if_seqvolante, if_seqdebito ' +
           '  FROM sif_itemfacturaamp ' +
           ' WHERE if_idvolante = ' + fraVolantesLiq.edNumero.TextSql +
           '   AND if_estado <> ''X''';

    sdqConsulta := GetQuery(Sql);
    try
      while not sdqConsulta.Eof do
      begin
        Sql := 'SELECT SUM(if_cantfacturada * if_valorfacturado) ' +
              '  FROM sif_itemfacturaamp ' +
              ' WHERE if_idvolante =  ' + fraVolantesLiq.edNumero.TextSql +
              '   AND if_seqdebito = ' + sdqConsulta.FieldByName('if_seqvolante').AsString +
              '   AND if_estado <> ''X''';
        rImpDebito := StrToCurrX(ValorSql(Sql));

        if Numeros.CompareFloat(sdqConsulta.FieldByName('if_cantfacturada').AsCurrency *
                                sdqConsulta.FieldByName('if_valorfacturado').AsCurrency + rImpDebito, 0) = 1 then begin
          Sql := ' SELECT MAX(if_seqvolante) ' +
                 '   FROM sif_itemfacturaamp ' +
                 '  WHERE if_idvolante = ' + SqlInteger(sdqConsulta.FieldByName('if_idvolante').AsInteger);
          seqVolante := StrToInt('0' + ValorSql(Sql) + 1);

          seqPago := ValorSqlInteger('SELECT NVL(MAX(if_seqpago) + 1, 1) ' +
                                     '  FROM sif_itemfacturaamp ' +
                                     ' WHERE if_idvolante = ' + SqlInteger(sdqConsulta.FieldByName('if_idvolante').AsInteger) +
                                     '   AND if_idlote = ' + SqlInteger(sdqConsulta.FieldByName('if_idlote').AsInteger) +
                                     '   AND if_idempresa = ' + SqlInteger(sdqConsulta.FieldByName('if_idempresa').AsInteger) +
                                     '   AND if_idestableci = ' + SqlInteger(sdqConsulta.FieldByName('if_idestableci').AsInteger));

          Sql := 'INSERT INTO sif_itemfacturaamp ( ' +
                 ' if_id, ' +
                 ' if_idvolante, if_idlote, if_idempresa, if_idestableci, if_fecha, ' +
                 ' if_concepto, if_idestudio, ' +
                 ' if_cantaprobados, if_valoraprobados, if_cantfacturada, if_valorfacturado, ' +
                 ' if_valorconvenido, if_estado, if_motivo, if_motivodebito, ' +
                 ' if_observaciones, ' +
                 ' if_seqvolante, if_seqpago, if_seqdebito, if_refitem, ' +
                 ' if_fechaalta, if_usualta) ' +
                 'SELECT art.seq_sif_id.NEXTVAL, ' +
                 '       if_idvolante, if_idlote, if_idempresa, if_idestableci, if_fecha, ' +
                 '       if_concepto, if_idestudio, ' +
                 '       NULL, NULL, if_cantaprobados, ' +
                 '       -ROUND((' + SqlNumber(rImpDebito) + ' + (if_cantfacturada * if_valorfacturado)) * ' + SqlNumber(edBonifFactura.Value) + ' / 100 / if_cantaprobados, 2), ' +
                 '       NULL, ''C8'', if_motivo, if_motivodebito, ' +
                 '       if_observaciones, ' +
                         SqlInt(seqVolante) + ', ' + SqlInt(seqPago) + ', if_seqvolante, if_id, ' +
                 '       if_fechaalta, if_usualta ' +
                 '  FROM sif_itemfacturaamp ' +
                 ' WHERE if_id = ' + SqlInteger(sdqConsulta.FieldByName('if_id').AsInteger);
          EjecutarSqlST(Sql);
        end;

        sdqConsulta.Next;
      end;
    finally
      sdqConsulta.Free;
    end;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TfrmLiqAMPAprob.btnEditarLiqClick(Sender: TObject);
begin
  if fraVolantesLiq.edNumero.Value > 0 then
  begin
    frmLiqAMPCarga := TfrmLiqAMPCarga.Create(Self);
    try
      frmLiqAMPCarga.fraVolantes.Cargar(fraVolantesLiq.edNumero.Value);
      frmLiqAMPCarga.tbRefrescarClick(Sender);

      frmLiqAMPCarga.ShowModal;
    finally
      frmLiqAMPCarga.Free;
    end;

    RefreshData
  end;
end;

end.


