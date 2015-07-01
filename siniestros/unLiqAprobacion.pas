unit unLiqAprobacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, StdCtrls, Mask, PatternEdit, IntEdit, ComCtrls,
  ToolWin, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ExtCtrls,
  ImgList, XPMenu, Placemnt, artSeguridad, SortDlg, DB, SDEngine,
  ShortCutControl, ToolEdit, DateComboBox, unFraCodigoDescripcion,
  unFraCodDesc, unFraTrabajador, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, ComboEditor, CheckCombo, DBCheckCombo, Menus,
  QueryToFile, ExportDialog, QueryPrint, RxToolEdit, RxPlacemnt;

type
  TfrmLiqAprobacion = class(TfrmCustomForm)
    pnlTop: TPanel;
    PageControl: TPageControl;
    tsILT: TTabSheet;
    tsOtrosPagos: TTabSheet;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbSeparador3: TToolButton;
    tbAutorizar: TToolButton;
    tbNoAutorizar: TToolButton;
    ToolButton5: TToolButton;
    tbLimpiar: TToolButton;
    tbOrdenar: TToolButton;
    tbSeparador4: TToolButton;
    tbSalir: TToolButton;
    dgILT: TArtDBGrid;
    dgOPagos: TArtDBGrid;
    Seguridad: TSeguridad;
    sdqOPagos: TSDQuery;
    dsOPagos: TDataSource;
    sdOPagos: TSortDialog;
    sdILT: TSortDialog;
    dsILT: TDataSource;
    sdqILT: TSDQuery;
    ShortCutControl: TShortCutControl;
    gbCodLiq: TGroupBox;
    edCodLiq: TEdit;
    Panel1: TPanel;
    gbVerOP: TGroupBox;
    rbVerTodos: TRadioButton;
    rbVerOP: TRadioButton;
    rbVerReintegros: TRadioButton;
    Panel2: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label2: TLabel;
    Label3: TLabel;
    chkUltAnio: TCheckBox;
    gbFechaAprobacion: TGroupBox;
    Label4: TLabel;
    edFechaLiqDesde: TDateComboBox;
    edFechaLiqHasta: TDateComboBox;
    GroupBox1: TGroupBox;
    fraEmpresa: TfraEmpresa;
    GroupBox2: TGroupBox;
    fraTrabajador: TfraTrabajador;
    GroupBox3: TGroupBox;
    tsILP: TTabSheet;
    Panel3: TPanel;
    Shape5: TShape;
    Label5: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Label6: TLabel;
    Label7: TLabel;
    dgILP: TArtDBGrid;
    sdILP: TSortDialog;
    dsILP: TDataSource;
    sdqILP: TSDQuery;
    GroupBox4: TGroupBox;
    cmbConcepto: TDBCheckCombo;
    sdqConcepto: TSDQuery;
    dsConcepto: TDataSource;
    chkRevision: TCheckBox;
    tbRevisar: TToolButton;
    pmnuSeleccionar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    ToolButton1: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    ExportDialog: TExportDialog;
    chkDerivadas: TCheckBox;
    GroupBox5: TGroupBox;
    chkAutomaticas: TCheckBox;
    tbDerivar: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Shape9: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Shape10: TShape;
    tbAdeudaDDJJ: TToolButton;
    chkAdeudaDDJJ: TCheckBox;
    Label10: TLabel;
    chkSiniestrosRech: TCheckBox;
    Bevel1: TBevel;
    tbPendiente: TToolButton;
    tbGerencia: TToolButton;
    chkGerencia: TCheckBox;
    procedure edCodLiqKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqOPagosAfterOpen(DataSet: TDataSet);
    procedure tbAutorizarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbNoAutorizarClick(Sender: TObject);
    procedure sdqILTAfterOpen(DataSet: TDataSet);
    procedure dgILTGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure tbRevisarClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbDerivarClick(Sender: TObject);
    procedure chkRevisionClick(Sender: TObject);
    procedure chkDerivadasClick(Sender: TObject);
    procedure tbAdeudaDDJJClick(Sender: TObject);
    procedure chkAdeudaDDJJClick(Sender: TObject);
    procedure chkSiniestrosRechClick(Sender: TObject);
    procedure tbPendienteClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure dgILPCellClick(Column: TColumn);
    procedure dgILTCellClick(Column: TColumn);
    procedure dgOPagosCellClick(Column: TColumn);
    procedure dgILTKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgILPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgOPagosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgILPDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgILTDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgOPagosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbGerenciaClick(Sender: TObject);
    procedure chkGerenciaClick(Sender: TObject);

  private
    //FRegistrosSeleccionadosILP: TStringList;
    //FRegistrosSeleccionadosILT: TStringList;
    //FRegistrosSeleccionadosOP: TStringList;

    Individual, AprobarOP, AprobarILT, AprobarILP, bRevision, bDerivar, bAdeudaDDJJ, bGerencia :Boolean;
    Siniestro, Orden, Recaida, Liquid :Integer;

    function DoSetearVariables :Boolean;
    function GetImporteTotal :String;

    function ValidarILT(TipoLiq :String; FechaHas :TDateTime; ConPago, sSiniestro, sCausaFin :String;
                        Siniestro, Orden, Recaida, Contrato:Integer; sEstado: string; var bCortar: Boolean) :Boolean;
    function ValidarILP(sEstado:string): Boolean;
    function ValidarAporyContr(bAutoriza: Boolean; ConPago :Integer) :Boolean;
    function ValidarFechaLiqHasta(TipoLiq :String; Fecha :TDate) :Boolean;
    function ValidarDeudaDDJJ(ConPago :String; Siniestro, Orden, Recaida, Contrato:Integer;
                              var bCortar: Boolean) :Boolean;
    function ValidarLiqBloqueada(ConPago :String; Siniestro, Orden, Recaida, Contrato :Integer) :Boolean;
    function ValidarSiniestroCerrado(sConPago, sSiniestro, sCausafin :String) :Boolean;
    function Is_SiniestroNoCerrar(IdExped :Integer) :Boolean;
    function ValidarAutRevDer(bAutoriza: Boolean): Boolean;
    function Validar_PasarAPendiente: Boolean;  // TK 38875
    function Validar_LiqMayorAImporteMaximo(sEstado:string): Boolean; // TK 43455

    function HayRegistroActivo :Boolean;
    procedure DoCargarLiq;
    procedure DoAutorizarOPagos(sEstado: String);
    procedure DoAutorizarILT(sEstado: String);
    procedure DoAutorizarILP(sEstado: String);
    procedure DoGenerarEvMortales(ConPago, IdExped :Integer);
    procedure DoSeleccionarLiq;
    procedure DoCargarOPagos;
    procedure DoCargarILTILP(bEsILT :Boolean);
    procedure DoGrabarAutorizacionILTILP(Autorizable:Boolean; Estado, ConPago, SinComp :String;
                                         Siniestro, Orden, Recaida, NumLiq, IdExped :Integer);
    procedure DoCerrarExpediente(IdExped :Integer; SinComp, ConPago :String);
    procedure DoLimpiarTmp;
    procedure DoImprimirGrilla(dsActual :TDataSource; dgActual :TArtDBGrid;
                               sCaption :String; Orientacion :TPageOrientation = pxLandscape);
    function AprobarSiniRechazado(iILTILP:integer): boolean;  // TK 38027
    function Get_MontoMaxAprobPorUsuario(sUsuario:string; sTipoLiq: string): Currency;
    // function GetImporteTotal_Currency: Currency;  // TK 43455
    function GetImporteLiq: Currency;   // TK 43455 y su arreglo TK 45247
    function HayRegistroActivoILP :Boolean;
    function HayRegistroActivoILT :Boolean;
    function HayRegistroActivoOP :Boolean;
  public

  end;

const
  cIMPORTE_MAX_APROB = 10000;  // TK 43455
{$IFDEF DINERARIAS}
  ctsILP    = 0;
  ctsILT    = 1;
  ctsOPagos = 2;
{$ELSE}
  ctsILP    = 2;
  ctsILT    = 1;
  ctsOPagos = 0;
{$ENDIF}
var
  frmLiqAprobacion: TfrmLiqAprobacion;

implementation

uses unPrincipal, Strfuncs, CustomDlgs, AnsiSql, unSesion, unComunes,
  General, unDmPrincipal, unSiniestros, DateTimeFuncs, DbFuncs, VCLExtra, strutils, unTercerizadoras;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.edCodLiqKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if Individual then
      DoCargarLiq
    else
      DoSeleccionarLiq;
  end
  else if not(Key in [#8, #9, '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
    Key := #0;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.DoCargarLiq;
begin
  if DoSetearVariables then
  begin
    case PageControl.TabIndex of
      ctsILP:     DoCargarILTILP(False);
      ctsILT:     DoCargarILTILP(True);
      ctsOPagos:  DoCargarOPagos;
    end;

    if ((PageControl.TabIndex = ctsOPagos) and sdqOPagos.IsEmpty) or
       ((PageControl.TabIndex = ctsILT) and sdqILT.IsEmpty) or
       ((PageControl.TabIndex = ctsILP) and sdqILP.IsEmpty) then
      InfoHint(PageControl, 'No existen liquidaciones pendientes de autorizar.');

    if Individual then
      case PageControl.TabIndex of
        ctsILP    :dgILP.SelectedRows.CurrentRowSelected     := True;
        ctsILT    :dgILT.SelectedRows.CurrentRowSelected     := True;
        ctsOPagos :dgOPagos.SelectedRows.CurrentRowSelected  := True;
      end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.FormActivate(Sender: TObject);
begin
  inherited;
  Individual        := (MenuItem = frmPrincipal.MnuLiqAprobIndiv);
  Caption           := 'Aprobación de liquidaciones' + IIF(Individual, ' - Individual', ' - Forma masiva');
  AprobarOP         := Seguridad.Claves.IsActive('AprobarOP');
  AprobarILT        := (Get_MontoMaxAprobPorUsuario(Sesion.UserID, 'L') >= 0); // Seguridad.Claves.IsActive('AprobarILT');
  AprobarILP        := (Get_MontoMaxAprobPorUsuario(Sesion.UserID, 'I') >= 0); // Seguridad.Claves.IsActive('AprobarILP');
  tbPendiente.Enabled := Seguridad.Activar(tbPendiente) and ((PageControl.TabIndex = ctsILT) or (PageControl.TabIndex = ctsILP));     // TK 38875    // y por ticket 49998
  chkSiniestrosRech.Enabled := Seguridad.Claves.IsActive('VerYAprobLiq_SiniRechazado');   // por ticket 38027
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAprobacion.DoSetearVariables;
begin
  Siniestro := 0;

  Verificar(((PageControl.TabIndex = ctsOPagos) and not AprobarOP) or
            ((PageControl.TabIndex = ctsILT) and not AprobarILT) or
            ((PageControl.TabIndex = ctsILP) and not AprobarILP), PageControl,
            'Usted no posee permiso para aprobar este tipo de liquidación.');
  Verificar(Individual and (Trim(edCodLiq.Text) = ''), edCodLiq, 'Debe cargar el código de liquidación.');

  edCodLiq.Text := LPad(edCodLiq.Text, '0', 15);
  Siniestro     := StrToInt(Copy(edCodLiq.Text, 0, 8));
  Orden         := StrToInt(Copy(edCodLiq.Text, 9, 2));
  Recaida       := StrToInt(Copy(edCodLiq.Text, 11, 2));
  Liquid        := StrToInt(Copy(edCodLiq.Text, 13, 3));
  edCodLiq.Clear;
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.tbRefrescarClick(Sender: TObject);
begin
  DoCargarLiq;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.tbLimpiarClick(Sender: TObject);
begin
  sdqOPagos.Close;
  sdqILT.Close;
  sdqILP.Close;
  edCodLiq.Clear;
  rbVerOP.Checked         := True;
  chkUltAnio.Checked      := True;
  chkAutomaticas.Checked  := False;
  chkRevision.Checked     := False;
  chkDerivadas.Checked    := False;
  chkAdeudaDDJJ.Checked   := False;   // TK 35997
  chkGerencia.Checked     := False;
  edFechaLiqDesde.Clear;
  edFechaLiqHasta.Clear;
  cmbConcepto.Clear;
  fraEmpresa.Clear;
  fraTrabajador.Clear;
  if chkSiniestrosRech.Enabled then
    chkSiniestrosRech.checked := False;
  edFechaLiqDesde.Date := StrToDate('01' + MidStr(DateToStr(AddMonths(DBDate, -1)), 3, 10));
  edFechaLiqHasta.Date := DBDate;

end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.sdqOPagosAfterOpen(DataSet: TDataSet);
begin
  if sdqOPagos.FieldByName('pr_imporpago') is TFloatField then
    TFloatField(sdqOPagos.FieldByName('pr_imporpago')).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.tbAutorizarClick(Sender: TObject);
begin
  case PageControl.TabIndex of
    ctsOPagos  : DoAutorizarOPagos('E');
    ctsILT     : DoAutorizarILT('E');
    ctsILP     : DoAutorizarILP('E');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.DoAutorizarOPagos(sEstado: String);
var
  i, iCant :Integer;
  sAcreed, sSql, ssql2, sSinLiq, sWhere :String;
  bookm: TBookmark;
  sAccion1, sAccion2, sSqlAp: String;
begin
  sAccion1 := Decode(sEstado, ['E', 'G', 'S', 'R'], ['aprobar ', 'derivar a GPBA ', 'pasar a estado Gerencia ', 'revisar ']);
  sAccion2 := Decode(sEstado, ['E', 'G', 'S', 'R'], ['aprobado ', 'derivado a GPBA ', 'pasado a estado Gerencia ', 'revisado ']);

  if AprobarOP and sdqOPagos.Active and not(sdqOPagos.IsEmpty) and (dgOPagos.SelectedRows.Count > 0) and 
     MsgAsk('Se han seleccionado ' + IntToStr(dgOPagos.SelectedRows.Count) + ' liquidaciones para ' + sAccion1 + ', ' + #13 +
            'cuyo importe total es de $' + GetImporteTotal + ' ¿Desea continuar?') then
  begin
    iCant := 0;
    with dgOPagos.DataSource.DataSet do
    begin
      bookm := GetBookmark;
      DisableControls;
      try
        for i:= 0 to dgOPagos.SelectedRows.Count - 1 do
        begin
          GotoBookmark(Pointer(dgOPagos.SelectedRows.Items[i]));

          if (sEstado = 'G') and {(FieldByName('em_holding').AsString <> 'GBA')} (FieldByName('em_idgrupoeconomico').AsInteger <> 87) then     // cambio condicion de em_holding por em_idgrupoeconomico por mensaje de Cristian 28/10/2014 (tk 64326)
            MsgBox('Siniestro: ' + FieldByName('siniestro').AsString + ' - La empresa no pertenece a Holding GBA.')
          else begin
            sAcreed := FieldByName('pr_acreedor').AsString;
            if (AreIn(sAcreed, ['EM', 'CA', 'OA', 'PA'])) then
              EsLavadoEmpresa(FieldByName('pr_cuitcuil').AsString, FieldByName('siniestro').AsString,
                              FieldByName('pr_numpago').AsString, FieldByName('pr_imporpago').AsFloat,
                              IIF(sAcreed = 'EM', True, False));
            try
              BeginTrans;
              sSqlAp  := IIF(sEstado = 'E', ' pr_aprobado = ' + SqlValue(Sesion.UserID) + ',' +
                                            ' pr_faprobado = ActualDate, ', '');

              sWhere :=  ' WHERE pr_siniestro = ' + SqlInt(FieldByName('pr_siniestro').AsInteger) +
                           ' AND pr_orden = ' + SqlInt(FieldByName('pr_orden').AsInteger) +
                           ' AND pr_recaida = ' + SqlInt(FieldByName('pr_recaida').AsInteger) +
                           ' AND pr_numpago = ' + SqlInt(FieldByName('pr_numpago').AsInteger);

              sSql    := 'UPDATE spr_pagoexpesin ' +
                           ' SET pr_estado = ' + SqlValue(sEstado) + ',' + sSqlAp +
                               ' pr_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                               ' pr_fmodif = ActualDate ';

              ssql2 := ' select pr_fechagerencia, pr_fecharevision, pr_fechaderivado ' +
                       ' from spr_pagoexpesin ' + sWhere;

              with GetQuery(ssql2) do
              begin
                if (sEstado = 'S') and ((FieldByName('pr_fechagerencia').AsString) = '') then
                begin
                  sSql := sSql + ', pr_fechagerencia = trunc(sysdate) ' +
                                 ', pr_usugerencia = ' + SqlValue(Sesion.UserID);
                end;

                if (sEstado = 'R') and ((FieldByName('pr_fecharevision').AsString) = '') then
                begin
                  sSql := sSql + ', pr_fecharevision = trunc(sysdate) ' +
                                 ', pr_usurevision = ' + SqlValue(Sesion.UserID);
                end;

                if (sEstado = 'G') and ((FieldByName('pr_fechaderivado').AsString) = '') then
                begin
                  sSql := sSql + ', pr_fechaderivado = trunc(sysdate) ' +
                                 ', pr_usuderivado = ' + SqlValue(Sesion.UserID);
                end;
              end;

              sSql := sSql + sWhere;

              EjecutarSqlST(sSql);
              if (sEstado = 'E') then //solamente aprobacion
              begin
                DoGenerarEvMortales(FieldByName('pr_conpago').AsInteger, FieldByName('ex_id').AsInteger);
                sSinLiq := FieldByName('siniestro').AsString + ' liq. ' + FieldByName('pr_numpago').AsString;
                Grabar_RegAuditLog('LIQ. CONC. PAGO', 'APROBACION MULTIPLE', sSinLiq, False);
              end;
              CommitTrans;
              Inc(iCant);
            except
              on E:Exception do
              begin
                ErrorMsg(E, 'Error al intentar ' + sAccion1 + ' siniestro: ' + sSinLiq);
                Rollback;
                Break;
              end;
            end;
          end;
        end;
      finally
        GotoBookmark(bookm);
        FreeBookmark(bookm);
        EnableControls;
      end;
      dgOPagos.UnselectAll;
      MsgBox('Se ha/n ' + sAccion2 + IntToStr(iCant) + ' liquidacion/es.');
      Refresh;
      tbRefrescarClick(nil);
      edCodLiq.Clear;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.DoGenerarEvMortales(ConPago, IdExped :Integer);
var
  sSql, CodEv :String;
begin
  case ConPago of
    5: CodEv := EVMOR_LIQSEPELIO;     //PREST.SERV.DE SEPELIO
    7: CodEv := EVMOR_LIQTRASLADO;    //PRESTAC. MEDICAS (VIATICOS Y HOSPED.)
    8: CodEv := EVMOR_LIQDEFINITIVA;  //IND.POR FALLECIMIENTO-PAGO DEF.
   53: CodEv := EVMOR_LIQANTICIPO;    //IND.POR FALLECIMIENTO-ANTICIPO
  else CodEv := '';
  end;

  if (CodEv <> '') then
  begin
    sSql := 'siniestro.do_generareventomortales(False, ' + SqlValue(CodEv) + ',' +
                                                SqlInt(IdExped) + ',' +
                                                SqlValue(Sesion.UserID) + ');';
    EjecutarStoreST(sSql);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.tbOrdenarClick(Sender: TObject);
begin
  case PageControl.TabIndex of
    ctsILP     : sdILP.Execute;
    ctsILT     : sdILT.Execute;
    ctsOPagos  : sdOPagos.Execute;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.tbNoAutorizarClick(Sender: TObject);
begin
  case PageControl.TabIndex of
    ctsILP     : dgILP.SelectedRows.Clear;
    ctsILT     : dgILT.SelectedRows.Clear;
    ctsOPagos  : dgOPagos.SelectedRows.Clear;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.DoSeleccionarLiq;
begin
  if DoSetearVariables and (Siniestro > 0) then
  begin
    if (PageControl.TabIndex = ctsOPagos) and sdqOPagos.Active and AprobarOP then
    begin
      sdqOPagos.DisableControls;
      sdqOPagos.First;
      if sdqOPagos.Locate('pr_siniestro;pr_orden; pr_recaida; pr_numpago',
                           VarArrayOf([Siniestro, Orden, Recaida, Liquid]), []) then
        dgOPagos.SelectedRows.CurrentRowSelected := True
      else
        InfoHint(PageControl, 'No se ha encontrado la liquidación ingresada.');
      sdqOPagos.EnableControls;
      edCodLiq.Clear;
    end
    else if (PageControl.TabIndex = ctsILT) and sdqILT.Active and AprobarILT then
    begin
      sdqILT.DisableControls;
      sdqILT.First;
      if sdqILT.Locate('le_siniestro;le_orden; le_recaida; le_numliqui',
                       VarArrayOf([Siniestro, Orden, Recaida, Liquid]), []) then
        dgILT.SelectedRows.CurrentRowSelected := True
      else
        InfoHint(PageControl, 'No se ha encontrado la liquidación ingresada.');
      sdqILT.EnableControls;
    end
    else if (PageControl.TabIndex = ctsILP) and sdqILP.Active and AprobarILP then
    begin
      sdqILP.DisableControls;
      sdqILP.First;
      if sdqILP.Locate('le_siniestro;le_orden; le_recaida; le_numliqui',
                       VarArrayOf([Siniestro, Orden, Recaida, Liquid]), []) then
        dgILP.SelectedRows.CurrentRowSelected := True
      else
        InfoHint(edCodLiq, 'No se ha encontrado la liquidación ingresada.');
      sdqILP.EnableControls;
    end;
    edCodLiq.Clear;
    edCodLiq.SetFocus;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAprobacion.GetImporteTotal :String;
var
  dImporte :Double;
  APointer: TBookMark;
begin
  dImporte := 0;
  case PageControl.TabIndex of
    ctsOPagos:
      with sdqOPagos do
      begin
        APointer := GetBookmark;
        DisableControls;
        First;
        while not Eof do
        begin
          if dgOPagos.SelectedRows.CurrentRowSelected then
            dImporte := dImporte + FieldByName('pr_imporpago').AsCurrency;
          Next;
        end;
        EnableControls;
        GotoBookmark(APointer);
      end;
    ctsILT:
      with sdqILT do
      begin
        APointer := GetBookmark;
        DisableControls;
        First;
        while not Eof do
        begin
          if dgILT.SelectedRows.CurrentRowSelected then
            dImporte := dImporte + FieldByName('le_imporperi').AsCurrency;
          Next;
        end;
        EnableControls;
        GotoBookmark(APointer);
      end;
    ctsILP:
      with sdqILP do
      begin
        APointer := GetBookmark;
        DisableControls;
        First;
        while not Eof do
        begin
          if dgILP.SelectedRows.CurrentRowSelected then
            dImporte := dImporte + FieldByName('le_imporperi').AsCurrency;
          Next;
        end;
        EnableControls;
        GotoBookmark(APointer);
      end;
  end;
  Result := ToStr(dImporte);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.DoCargarILTILP(bEsILT :Boolean);
var
  sSql, sAnd :String;
begin
  try
    BeginTrans;
    sSql := 'DELETE FROM tmp_aprobaciones ' +
                 ' WHERE tmp_usuario = :User ';
    EjecutarSqlSTEx(sSql, [Sesion.UserID]);

    sSql := 'INSERT INTO tmp_aprobaciones ' +
            '(tmp_usuario, tmp_cuit, tmp_deudaactual, tmp_cuotapromedio, tmp_cobertura) ' +
            'SELECT ' + SqlValue(Sesion.UserID) + ', ex_cuit, ';
    if bEsILT then
      sSql := sSql + ' art.compdeuda.get_deuda(afiliacion.get_ultcontrato(ex_cuit), ''D'', ''S'', ''N''), ' +
                     ' art.compdeuda.get_cuotapromedio(afiliacion.get_ultcontrato(ex_cuit), ''E'', ' +
                     ' periodo_anterior(cobranza.get_ultperiododevengado(''E''), 12), cobranza.get_ultperiododevengado(''E''), ''S''), ' +
                     ' art.afiliacion.check_cobertura(ex_cuit) '
    else
      sSql := sSql + ' null, null, null ';

    sSql := sSql + ' FROM sex_expedientes, sle_liquiempsin ' +
                  ' WHERE le_siniestro = ex_siniestro ' +
                    ' AND le_orden = ex_orden ' +
                    ' AND le_recaida = ex_recaida ';

    sAnd := ' AND le_femision IS NOT NULL ' +
            ' AND le_aprobado IS NULL ';

    if bEsILT then
    begin
      if chkSiniestrosRech.Checked then               // ve SOLO siniestros Rechazados TK 38027
        sAnd := sAnd + ' AND NVL(ex_causafin, ''0'') IN (''02'') '
      else
        sAnd := sAnd + ' AND NVL(ex_causafin, ''0'') NOT IN (''02'', ''95'', ''99'') ';  // sino como estaba antes..
      sAnd := sAnd + ' AND le_tipoliqui IN(''L'', ''D'', ''J'', ''R'', ''X'', ''Y'', ''Z'') ';
    end
    else           //para las ILP, no se permite aprobar tampoco los cerrados con 22, 24, 27 (ticket 19513)
    begin
      if chkSiniestrosRech.Checked then
        sAnd := sAnd + ' AND NVL(ex_causafin, ''0'') IN (''02'') '   // ve SOLO siniestros Rechazados TK 38027
      else
        sAnd := sAnd + ' AND NVL(ex_causafin, ''0'') NOT IN (''02'', ''95'', ''99'', ''22'', ''24'', ''27'') ';
      sAnd := sAnd + ' AND le_tipoliqui IN(''I'', ''W'') ';
    end;

    if Individual then
    begin
      if chkRevision.Checked then
        sAnd := sAnd + ' AND NVL(le_estado, '''') = ''R'' '
      else if chkDerivadas.Checked then
        sAnd := sAnd + ' AND NVL(le_estado, '''') = ''G'' '
      else if chkAdeudaDDJJ.Checked then
        sAnd := sAnd + ' AND NVL(le_estado, '''') = ''D'' '       // TK 35997
      else if chkGerencia.Checked then
        sAnd := sAnd + ' AND NVL(le_estado, '''') = ''S'' '
      else
        sAnd := sAnd + ' AND NVL(le_estado, '''') IN(''C'', ''M'', ''V'') '; //para que no tome el indice por estado

      sAnd := sAnd + ' AND le_siniestro = ' + SqlInt(Siniestro) +
                     ' AND le_orden = ' + SqlInt(Orden) +
                     ' AND le_recaida = ' + SqlInt(Recaida) +
                     ' AND le_numliqui = ' + SqlInt(Liquid)
    end
    else begin
      if chkRevision.Checked then
        sAnd := sAnd + ' AND le_estado = ''R'' '
      else if chkDerivadas.Checked then
        sAnd := sAnd + ' AND NVL(le_estado, '''') = ''G'' '
      else if chkAdeudaDDJJ.Checked then                        // TK 35997
        sAnd := sAnd + ' AND NVL(le_estado, '''') = ''D'' '
      else if chkGerencia.Checked then
        sAnd := sAnd + ' AND NVL(le_estado, '''') = ''S'' '
      else
        sAnd := sAnd + ' AND le_estado IN(''C'', ''M'', ''V'') ';  //para que tome el indice por estado
    end;

    bRevision   := chkRevision.Checked;
    bDerivar    := chkDerivadas.Checked;
    bAdeudaDDJJ := chkAdeudaDDJJ.Checked;   // TK 35997
    bGerencia   := chkGerencia.Checked;


    if not edFechaLiqDesde.IsEmpty then
      sAnd := sAnd + ' AND le_fproceso >= ' + SqlDate(edFechaLiqDesde.Date);

    if not edFechaLiqHasta.IsEmpty then
      sAnd := sAnd + ' AND le_fproceso <= ' + SqlDate(edFechaLiqHasta.Date);

    if (cmbConcepto.Text <> '') then
      sAnd := sAnd + ' AND le_conpago  ' + cmbConcepto.InSql;

    if not fraEmpresa.IsEmpty then
      sAnd := sAnd + ' AND ex_contrato = ' + SqlInt(fraEmpresa.Contrato);

    if not fraTrabajador.IsEmpty then
      sAnd := sAnd + ' AND ex_cuil = ' + SqlValue(fraTrabajador.CUIL);

    if chkAutomaticas.Checked then
      sAnd := sAnd + ' AND le_usualta = ''AUTOMATICO'' ';

    if EsUsuarioDeTercerizadora then                                                    // por plan Ioma (Tercerizadoras)
      sAnd := sAnd + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SQLValue(Sesion.UserID) + ') = ''S'' ';


    sSql := sSql + sAnd + ' GROUP BY ex_cuit ';
    EjecutarSqlST(sSql);

    sSql := 'UPDATE tmp_aprobaciones ' +
              ' SET tmp_condeuda = ' + IIF(bEsILT, '''S''', '''N''') +
            ' WHERE tmp_usuario = ' + SqlValue(Sesion.UserID);
    if bEsILT then
      sSql := sSql + ' AND compdeuda.is_contratocondeuda(afiliacion.get_ultcontrato(tmp_cuit), ' +
                                                       ' Null, Null, tmp_cuotapromedio) = ''S'' ';

    EjecutarSqlST(sSql);

    CommitTrans;
  except
    On E:Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al intentar generar la consulta.');
    end;
  end;

  sSql :=  'SELECT /*+ rule */ art.utiles.armar_siniestro(le_siniestro, le_orden, le_recaida) siniestro, ' +
                 ' le_siniestro, le_orden, le_recaida, le_numliqui, le_tipoliqui, le_estado, ' +
                 ' ex_id, le_fproceso, le_fechades, le_fechahas, le_imporperi, tmp_condeuda condeuda, ' +
                 ' tmp_deudaactual deudaactual, tmp_cuotapromedio cuotapromedio, a.cp_titpago descripcion, ' +
                 ' le_conpago, em_fechaconcurso mp_fechaconcurso, em_fechaquiebra mp_fechaquiebra, ' +
                 ' co_motivobaja mp_motivobaja, co_fechabaja mp_fbaja, ex_cuit, co_contrato, ' +
                 ' art.liq.get_estadoliquidacionilt(le_tipoliqui, le_estado) estado, ' +
                 ' art.utiles.armar_cuit(em_cuit) cuit, em_nombre empresa, ' +
                 ' art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre trabajador, ' +

            //     IIF(bEsILT, ' art.deuda.ilt_autorizable(le_conpago, em_fechaconcurso, em_fechaquiebra, co_motivobaja, ' +
            //                                           ' co_fechabaja, tmp_condeuda, tmp_cobertura) ', '''S''') + ' ilt_autorizable, ' +

                 IIF(bEsILT, 'iif_char(dinerarias.is_liquidacioniltcompensable(le_siniestro, le_orden, le_recaida, le_numliqui, co_contrato), ''S'', ''N'', ' +       // TK 47483 - Si es ILT, si la liquidacion es Compensable, entonces el campo  "ilt_autorizable" queda en "N" (asi entra al update de Compensable en DoGrabarAutorizacionILTILP), sino hace la función art.deuda.ilt_autorizable (como estaba antes).
                                     ' art.deuda.ilt_autorizable(le_conpago, em_fechaconcurso, em_fechaquiebra, co_motivobaja, co_fechabaja, tmp_condeuda, tmp_cobertura)) ', ' ''S'' ') + ' ilt_autorizable, ' +

                 ' em_holding, ex_causafin, em_idgrupoeconomico, ' +
                 ' emi.utiles.is_contratoddjj_adeudadas(ex_contrato, TO_CHAR(ADD_MONTHS(art.actualdate, -24), ''YYYYMM''), ' +
                                                      ' TO_CHAR(art.actualdate, ''YYYYMM'')) adeudaddjj, ex_id, ' +
                 ' le_fecharevisado, le_fechaadeudaddjj, le_fechagerencia, le_id, null checkbox, afiliacion.get_ultcontrato(em_cuit) contrato, le_fechaderivado, le_usualta, ' +
                 ' le_montopagoadic, le_montocompdanios, le_montootrospagos, b.cp_denpago conceptoop ' +
            ' FROM tmp_aprobaciones, scp_conpago a, sex_expedientes, aem_empresa, ' +
                 ' aco_contrato, sle_liquiempsin, ctj_trabajador, scp_conpago b ' +
           ' WHERE ex_siniestro = le_siniestro ' +
             ' AND ex_orden = le_orden ' +
             ' AND ex_recaida = le_recaida ' +
             ' AND em_cuit = tmp_cuit ' +
             ' AND ex_cuit = em_cuit ' +
             ' AND ex_cuil = tj_cuil ' +
             ' AND a.cp_conpago = le_conpago ' +
             ' AND b.cp_conpago(+) = le_conceptootrospagos ' +
             ' AND tmp_usuario = ' + SqlValue(Sesion.UserID)  +
             ' AND co_contrato = afiliacion.get_ultcontrato(em_cuit) ' + sAnd;

  if bEsILT then
  begin
    sSql := sSql + sdILT.OrderBy;
    sdqILT.Close;
    sdqILT.SQL.Text := sSql;
    sdqILT.Open;
  end
  else begin
    sSql := sSql + sdILP.OrderBy;
    sdqILP.Close;
    sdqILP.SQL.Text := sSql;
    sdqILP.Open;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.DoCargarOPagos;
var
  sSql :String;
begin

  sSql := 'SELECT utiles.armar_siniestro(pr_siniestro, pr_orden, pr_recaida) siniestro, ' +
                ' pr_siniestro, pr_orden, pr_recaida, pr_conpago, ' +
                ' pr_numpago, pr_estado, pr_acreedor, ex_id, ' +
                ' pr_letrafac || ''-'' || pr_situfac || ''-'' || pr_numfac factura, cp_titpago, ' +
                ' pr_femision, pr_fechapago, pr_imporpago, pr_cuitcuil, ' +
                {' liq.get_estadoliquidacionopagos(pr_estado) estado, ' +  }
                ' li_descripcion estado, ' +
                ' DECODE(art.discoverer.get_sectorotrosconc(pr_conpago), ' +
                       ' ''MEDICAS'', ''Reintegros médicos'', ''Otros pagos'') tipo, ' +
                ' em_holding, em_idgrupoeconomico, null checkbox, pr_fechagerencia, pr_fecharevision, pr_fechaderivado, pr_usualta ' +
           ' FROM sex_expedientes, spr_pagoexpesin, scp_conpago, aem_empresa, sli_estadosliquidacion ' +
          ' WHERE pr_siniestro = ex_siniestro ' +
            ' AND pr_orden = ex_orden ' +
            ' AND pr_recaida = ex_recaida ' +
            ' AND pr_conpago = cp_conpago ' +
            ' AND ex_cuit = em_cuit ' +
            ' AND pr_aprobado IS NULL ' +
            ' AND NVL(ex_causafin, '' '') NOT IN(''95'', ''99'') ' +
            ' AND pr_estado = li_codigo ' +
            ' AND li_fechabaja IS NULL ';

  if rbVerOP.Checked then
    sSql := sSql + ' AND art.discoverer.get_sectorotrosconc(pr_conpago) <> ''MEDICAS'' '
  else if rbVerReintegros.Checked then
    sSql := sSql + ' AND art.discoverer.get_sectorotrosconc(pr_conpago) = ''MEDICAS'' ';

  if chkUltAnio.Checked then
    sSql := sSql + ' AND pr_femision > actualdate - 365 ';

  if Individual then
  begin
    sSql := sSql + ' AND pr_siniestro = ' + SqlInt(Siniestro) +
                   ' AND pr_orden = ' + SqlInt(Orden) +
                   ' AND pr_recaida = ' + SqlInt(Recaida) +
                   ' AND pr_numpago = ' + SqlInt(Liquid);
  end;

  if not edFechaLiqDesde.IsEmpty then
    sSql := sSql + ' AND pr_femision >= ' + SqlDate(edFechaLiqDesde.Date);

  if not edFechaLiqHasta.IsEmpty then
    sSql := sSql + ' AND pr_femision <= ' + SqlDate(edFechaLiqHasta.Date);

  if (cmbConcepto.Text <> '') then
    sSql := sSql + ' AND pr_conpago  ' + cmbConcepto.InSql;

  if not fraEmpresa.IsEmpty then
    sSql := sSql + ' AND ex_contrato = ' + SqlInt(fraEmpresa.Contrato);

  if not fraTrabajador.IsEmpty then
    sSql := sSql + ' AND ex_cuil = ' + SqlValue(fraTrabajador.CUIL);

  if chkDerivadas.Checked then
    sSql := sSql + ' AND NVL(pr_estado, '''') = ''G'' '
  else if chkGerencia.Checked then
    sSql := sSql + ' AND NVL(pr_estado, '''') = ''S'' '
  else if chkRevision.Checked then
    sSql := sSql + ' AND NVL(pr_estado, '''') = ''R'' '
  else
    sSql := sSql + ' AND pr_estado IN (''C'', ''M'') ';

  if EsUsuarioDeTercerizadora then                                                    // por plan Ioma (Tercerizadoras)
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SQLValue(Sesion.UserID) + ') = ''S'' ';

  sSql := sSql + ' AND art.amebpba.is_valid_range(' + SqlValue(Sesion.UserID) + ', ''O'', pr_imporpago) IS NOT NULL ' +
          sdOPagos.OrderBy;

  sdqOPagos.Close;
  sdqOPagos.SQL.Text := sSql;
  sdqOPagos.Open;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.DoAutorizarILT(sEstado: String);
var
  i, iCant :Integer;
  bookm: TBookmark;
  bValidaILT, bCortar, bVolver: Boolean;
  sAccion1, sAccion2: String;
begin
  sAccion1 := Decode(sEstado, ['E', 'R', 'G', 'D', 'C', 'S'], ['aprobar ', 'revisar ', 'derivar a GPBA ', 'adeudar DDJJ ', 'pasar a estado Pendiente ', 'pasar a estado Gerencia ']);   // TK 35997 agregue el 'D'
  sAccion2 := Decode(sEstado, ['E', 'R', 'G', 'D', 'C', 'S'], ['aprobado ', 'revisado ', 'derivado a GPBA ', 'pasado al estado Adeuda DDJJ ', 'pasado a estado Pendiente ', 'pasado a estado Gerencia ']);
  if AprobarILT and AprobarSiniRechazado(PageControl.TabIndex) and sdqILT.Active and not(sdqILT.IsEmpty) and
     (dgILT.SelectedRows.Count > 0) and
     MsgAsk('Se han seleccionado ' + IntToStr(dgILT.SelectedRows.Count) + ' liquidaciones para ' + sAccion1 + #13 +
            'cuyo importe total es de $' + GetImporteTotal + ' ¿Desea continuar?') then
  begin
    iCant := 0;
    with dgILT.DataSource.DataSet do
    begin
      bookm := GetBookmark;
      DisableControls;
      try
        for i:= 0 to dgILT.SelectedRows.Count - 1 do
        begin
          GotoBookmark(Pointer(dgILT.SelectedRows.Items[i]));

          if (sEstado = 'E') and (Is_SiniestroDeGobernacion(FieldByname('ex_id').AsInteger) and Seguridad.Claves.IsActive('Aprobar_pagoGPBA')                          // TK 64117
             and (MsgBox('¿Está seguro que desea autorizar este pago de GPBA?' + #13#10 + 'Siniestro: ' + FieldByname('siniestro').AsString + ' - Nro Liq.: ' +
                    IntToStr(FieldByname('le_numliqui').AsInteger), MB_OK + MB_ICONINFORMATION + MB_YESNO ) = IDYES))
             or  (not Is_SiniestroDeGobernacion(FieldByname('ex_id').AsInteger) or (sEstado <> 'E')) then

          begin

            bVolver := False;

            if (sEstado = 'E') then
            begin
              bValidaILT := ValidarILT(FieldByName('le_tipoliqui').AsString, FieldByName('le_fechahas').AsDateTime,
                                       FieldByName('le_conpago').AsString, FieldByname('siniestro').AsString,
                                       FieldByName('ex_causafin').AsString, FieldByname('le_siniestro').AsInteger,
                                       FieldByname('le_orden').AsInteger, FieldByname('le_recaida').AsInteger,
                                       FieldByname('co_contrato').AsInteger, sEstado, bCortar);
              if not(bValidaILT) and bCortar then
                Break
              else if not(bValidaILT) and not(bCortar) then
              begin
                sEstado := 'D';    // por ticket 37046. Antes era: sEstado := 'R';   se cambio Revisado por Adeuda DDJJ: es cuando va al cartel
                bVolver := True;
              end;
            end;

            if (sEstado = 'E') and (FieldByName('ilt_autorizable').AsString = 'S') and
               (FieldByName('le_conpago').AsString = CONCEPTO_ILT_REINTEGRO) then
                EsLavadoEmpresa(FieldByName('ex_cuit').AsString, FieldByName('siniestro').AsString,
                                FieldByName('le_numliqui').AsString, FieldByName('le_imporperi').AsCurrency, True);

            if (sEstado = 'G') and {(FieldByName('em_holding').AsString <> 'GBA')} (FieldByName('em_idgrupoeconomico').AsInteger <> 87)  then  // cambio condición de em_holding por em_idgrupoeconomico por mensaje de Cristian 28/10/2014 (tk 64326)
              MsgBox('Siniestro: ' + FieldByName('siniestro').AsString + ' - La empresa no pertenece a Holding GBA.')
            else if not ValidarAporyContr((sEstado = 'E'), FieldByName('le_conpago').AsInteger) then
              MsgBox('Siniestro: ' + FieldByname('siniestro').AsString + ' - Ya se realizó el cierre de aportes y contribuciones ' + #13 +
                     'del mes y deberá esperarse para la aprobación al mes siguiente.')
            else if ValidarSiniestroCerrado(FieldByName('le_conpago').AsString,
                                            FieldByname('siniestro').AsString,
                                            FieldByName('ex_causafin').AsString) and Validar_LiqMayorAImporteMaximo(sEstado) then   // TK 43455
            begin
              DoGrabarAutorizacionILTILP((FieldByName('ilt_autorizable').AsString = 'S'), sEstado,
                                          FieldByName('le_conpago').AsString, FieldByname('siniestro').AsString,
                                          FieldByname('le_siniestro').AsInteger, FieldByname('le_orden').AsInteger,
                                          FieldByname('le_recaida').AsInteger, FieldByname('le_numliqui').AsInteger,
                                          FieldByname('ex_id').AsInteger);

              if bVolver then sEstado := 'E';
              Inc(iCant);
            end;


          end
          else if (sEstado = 'E') and Is_SiniestroDeGobernacion(FieldByname('ex_id').AsInteger) then         // TK 64117
            MsgBox('No se autorizó la liquidación con Siniestro: ' + FieldByname('siniestro').AsString + ' - Nro Liq.: ' +
                    IntToStr(FieldByname('le_numliqui').AsInteger) + ' debido a que pertenece a GPBA.');

        end;




      finally
        GotoBookmark(bookm);
        FreeBookmark(bookm);
        EnableControls;
      end;
      dgILT.UnselectAll;
      dgILT.Repaint;
      MsgBox('Se ha/n ' + sAccion2 + IntToStr(iCant) + ' liquidacion/es.');
      Refresh;
      tbRefrescarClick(nil);
      edCodLiq.Clear;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAprobacion.ValidarAporyContr(bAutoriza: Boolean; ConPago :Integer) :Boolean;
var
  sSql, sMax :String;
begin
  sSql := ' SELECT 1 ' +
            ' FROM scp_conpago ' +
           ' WHERE cp_fbaja IS NULL ' +
             ' AND cp_espagomensual = ''S'' ' +
             ' AND cp_conpago = :ConceptoPago ';

  sMax := ' SELECT 1 ' +
            ' FROM dual ' +
           ' WHERE actualdate > liq.get_maxfechagenaporycont ';

  Result := not(bAutoriza) or not(ExisteSqlEx(sSql, [ConPago])) or ExisteSql(sMax);
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAprobacion.ValidarFechaLiqHasta(TipoLiq :String; Fecha :TDate) :Boolean;
begin
  if (TipoLiq = 'L') and (Fecha > 0) then //solo para reintegros
  begin
    Verificar((Fecha < (AddYears(DBDate, -4))) and not(Seguridad.Claves.IsActive('LiquidarPrescriptasILT')),
              PageControl, 'Los periodos a liquidar se encuentran prescriptos. Consulte con su referente.');

    Verificar((Fecha < (AddYears(DBDate, -2))) and (Fecha >= (AddYears(DBDate, -4))) and
              not(Seguridad.Claves.IsActive('LiquidarObservadasILT')),
              PageControl, 'Los periodos a liquidar se encuentran observados. Consulte con su referente.');
  end;
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAprobacion.ValidarDeudaDDJJ(ConPago :String; Siniestro, Orden, Recaida, Contrato :Integer;
                                            var bCortar: Boolean) :Boolean;
var
  sErr :String;
begin
  if (ConPago = CONCEPTO_ILT_REINTEGRO) and (Get_TipoSuss(Siniestro, Orden, Recaida) = '2') and
     (ValorSqlEx('SELECT emi.utiles.is_contratoddjj_adeudadas(:cont, ' +
                                                            ' TO_CHAR(ADD_MONTHS(art.actualdate, -24), ''YYYYMM''), ' +
                                                            ' TO_CHAR(art.actualdate, ''YYYYMM'')) adeudaddjj ' +
                  ' FROM dual', [Contrato]) = 'S') then
  begin
    sErr := 'Siniestro: ' + IntToStr(Siniestro) + ' - La empresa adeuda DDJJs';
    if Seguridad.Claves.IsActive('LiquidarDDJJAdeudadasILT') then
    begin
      bCortar := True;
      Result  := MsgAsk(sErr + ' ¿Continua de todos modos?');
    end
    else begin
      bCortar := not(MsgAsk(sErr + ' ¿Desea marcar la liquidación al estado "adeuda DDJJ"?'));
//      MsgBox(sErr, MB_ICONEXCLAMATION);
      Result := False;
    end;
  end
  else
    Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAprobacion.ValidarLiqBloqueada(ConPago :String; Siniestro, Orden, Recaida, Contrato :Integer) :Boolean;
var
  sErr :String;
begin
  if ((ConPago = CONCEPTO_ILT_REINTEGRO) or (ConPago = CONCEPTO_ILT_PAGODIRECTO)) and
      Get_IsBloqueo_ILTEmpresa(Siniestro, Orden, Recaida) then
  begin
    sErr := 'Siniestro: ' + IntToStr(Siniestro) + ' - Para la fecha de accidente del siniestro, la empresa tiene bloqueada la liquidación';

    if Seguridad.Claves.IsActive('AprobarILTEmpresaBloqueada') then
      Result := MsgAsk(sErr + ' ¿Continua de todos modos?')
    else begin
      MsgBox(sErr, MB_ICONEXCLAMATION);
      Result := False;
    end;
  end
  else
    Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAprobacion.ValidarSiniestroCerrado(sConPago, sSiniestro, sCausafin :String) :Boolean;
begin
  if AreIn(sCausafin, ['22', '24', '27']) then
    Result := (sConPago = CONCEPTO_ILT_REINTEGRO) and
               MsgAsk('Siniestro: ' + sSiniestro + ' cerrado con motivo ' + sCausafin + ' ¿Continua de todos modos?')
  else
    Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAprobacion.ValidarILT(TipoLiq :String; FechaHas :TDateTime; ConPago, sSiniestro, sCausaFin :String;
                                      Siniestro, Orden, Recaida, Contrato :Integer; sEstado: string; var bCortar: Boolean) :Boolean;
begin
  Result := ValidarFechaLiqHasta(TipoLiq, FechaHas) and
            ValidarDeudaDDJJ(ConPago, Siniestro, Orden, Recaida, Contrato, bCortar) and
            ValidarLiqBloqueada(ConPago, Siniestro, Orden, Recaida, Contrato);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.DoGrabarAutorizacionILTILP(Autorizable :Boolean; Estado, ConPago, SinComp :String;
                                                       Siniestro, Orden, Recaida, NumLiq, IdExped :Integer );
var
  sSql, ssql2, sSinLiq, sWhere :String;
begin
  try
    BeginTrans;
    sWhere := ' WHERE le_siniestro = ' + SqlInt(Siniestro) +
                ' AND le_orden = ' + SqlInt(Orden) +
                ' AND le_recaida = ' + SqlInt(Recaida) +
                ' AND le_numliqui = ' + SqlInt(NumLiq);

    if (Estado <> 'E') then //en revision o derivado a GPBA
    begin
      sSql := 'UPDATE sle_liquiempsin ' +
                ' SET le_estado = ' + SqlValue(Estado) + ',' +
                    ' le_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' le_fmodif = ActualDate ';

      ssql2 := ' select le_fecharevisado, le_fechaadeudaddjj, le_fechagerencia, le_fechaderivado ' +
                '  from sle_liquiempsin ' + sWhere;

      with GetQuery(ssql2) do
      begin
        if (Estado = 'R') and (FieldByName('le_fecharevisado').IsNull) then
        begin
          ssql := ssql + ', le_fecharevisado = trunc(sysdate) ' +
                         ', le_usurevisado = ' + SqlValue(Sesion.UserID);
        end
        else
          if (Estado = 'D') and (FieldByName('le_fechaadeudaddjj').IsNull) then
          begin
            ssql := ssql + ', le_fechaadeudaddjj = trunc(sysdate) ' +
                           ', le_usuadeudaddjj = ' + SqlValue(Sesion.UserID);
          end
          else
            if (Estado = 'S') and (FieldByName('le_fechagerencia').IsNull) then
            begin
              ssql := ssql + ', le_fechagerencia = trunc(sysdate) ' +
                             ', le_usugerencia = ' + SqlValue(Sesion.UserID);
            end
            else
              if (Estado = 'G') and (FieldByName('le_fechaderivado').IsNull) then
              begin
                ssql := ssql + ', le_fechaderivado = trunc(sysdate) ' +
                               ', le_usuderivado = ' + SqlValue(Sesion.UserID);
              end;
      end;

      sSql := sSql + sWhere;
      EjecutarSqlST(sSql);
    end
    else begin
      if Autorizable then
      begin
        sSql := 'UPDATE sle_liquiempsin ' +
                  ' SET le_estado = ' + SqlValue(Estado) + ',' +
                      ' le_aprobado = ' + SqlValue(Sesion.UserID) + ',' +
                      ' le_faprobado = ActualDate ';
        if (ConPago = CONCEPTO_ILT_PAGODIRECTO) then
          sSql := sSql + ', le_fvencimi = ActualDate + 1 ';

        sSql := sSql + sWhere;
        EjecutarSqlST(sSql);

        DoGenerarEvMortales(StrToInt(ConPago), Get_IdExpediente(Siniestro, Orden, Recaida));
      end
      else begin
        sSql := 'UPDATE sle_liquiempsin ' +
                  ' SET le_estado = ''V'', ' +
                      ' le_aprobcobranzas = ' + SqlValue(Sesion.UserID) + ',' +
                      ' le_faprobcobranzas = ActualDate ' + sWhere;
        EjecutarSqlST(sSql);
      end;
      DoCerrarExpediente(IdExped, SinComp, ConPago);
      sSinLiq := SinComp + ' liq. ' + IntToStr(NumLiq);
      Grabar_RegAuditLog('LIQ. ILT/ILP', IIF(Autorizable, 'APROBACION MULTIPLE', 'APROBACION MULTIPLE-COMPENSAC.'), sSinLiq, False);
    end;

    if Estado = 'E' then
      Estado := 'A'
    else
      Estado := 'G';
    EjecutarStoreSTEx('art.dinerarias.do_analizarestadomortal(:idexp, :estado, :usu, art.dinerarias.get_porcentajeliqmortal(:idexp));',
                     [IdExped, Estado, Sesion.UserID, IdExped]);
    CommitTrans;
  except
    on E:Exception do
    begin
      ErrorMsg(E, 'Error al intentar autorizar siniestro: ' + IntToStr(Siniestro));
      Rollback;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.sdqILTAfterOpen(DataSet: TDataSet);
begin
  if DataSet.FieldByName('le_imporperi') is TFloatField then
    TFloatField(DataSet.FieldByName('le_imporperi')).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.dgILTGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  bDeuda, bAutoriz, bDeudaDJ :Boolean;
begin
  bDeudaDJ  := (Field.DataSet.FieldByName('adeudaddjj').AsString = 'S');

  if AreIn(Field.DataSet.FieldByName('le_tipoliqui').AsString, ['X', 'Y', 'Z', 'W']) then
    Background := clRed
  else if ((PageControl.TabIndex = ctsILT) and dgILT.SelectedRows.CurrentRowSelected) or
          ((PageControl.TabIndex = ctsILP) and dgILP.SelectedRows.CurrentRowSelected) then
    Background := clLtGray
  else if ((PageControl.TabIndex = ctsILT) and not(dgILT.SelectedRows.CurrentRowSelected)) or
          ((PageControl.TabIndex = ctsILP) and not(dgILP.SelectedRows.CurrentRowSelected)) then
    Background := IIF(bDeudaDJ, $00A0FAFC, clWhite);

  bDeuda    := (Field.DataSet.FieldByName('condeuda').AsString = 'S');
  bAutoriz  := (Field.DataSet.FieldByName('ilt_autorizable').AsString = 'S');

  if AreIn(Field.FullName, ['SINIESTRO', 'LE_NUMLIQUI', 'DESCRIPCION', 'ESTADO', 'LE_FPROCESO']) then
   AFont.Color := IIF(bDeuda, clBlue, IIF(AreIn(Field.FullName, ['SINIESTRO', 'LE_NUMLIQUI']), clMaroon, clBlack))
  else
   AFont.Color := IIF(bDeuda, IIF(bAutoriz, clGreen, clRed), clBlack);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.FormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresa.ShowBajas    := True;
  fraTrabajador.ShowBajas := True;
  {$IFDEF DINERARIAS}
  PageControl.ActivePage  := tsILP;
  {$ELSE}
  tsILT.TabVisible        := False;
  tsILP.TabVisible        := False;
  PageControl.ActivePage  := tsOtrosPagos;
  {$ENDIF}
  {FRegistrosSeleccionadosILT := TStringList.Create;
  FRegistrosSeleccionadosILP := TStringList.Create;
  FRegistrosSeleccionadosOP  := TStringList.Create;}
  edFechaLiqDesde.Date := StrToDate('01' + midstr (DateToStr(AddMonths(DBDate, -1)), 3, 10));
  edFechaLiqHasta.Date := DBDate;

end;                                     
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.DoAutorizarILP(sEstado: String);
var
  i, iCant :Integer;
  bookm: TBookmark;
  sAccion1, sAccion2: String;
begin
  sAccion1 := Decode(sEstado, ['E', 'R', 'G', 'D', 'C', 'S'], ['aprobar ', 'revisar ', 'derivar a GPBA ', 'adeudar DDJJ ',  'pasar a estado Pendiente ', 'pasar a estado Gerencia ']);    // TK 35997 agregue el 'D'
  sAccion2 := Decode(sEstado, ['E', 'R', 'G', 'D', 'C', 'S'], ['aprobado ', 'revisado ', 'derivado a GPBA ', 'pasado al estado Adeuda DDJJ ', 'pasado a estado Pendiente ', 'pasado a estado Gerencia ']);

  if ValidarILP(sEstado) and AprobarILP and AprobarSiniRechazado(PageControl.TabIndex) and sdqILP.Active and not(sdqILP.IsEmpty) and
     (dgILP.SelectedRows.Count > 0) and ValidarAutRevDer(sEstado = 'E') and
     MsgAsk('Se han seleccionado ' + IntToStr(dgILP.SelectedRows.Count) + ' liquidaciones para ' + sAccion1 + #13 +
            'cuyo importe total es de $' + GetImporteTotal + ' ¿Desea continuar?') then
  begin
    iCant := 0;
    DoLimpiarTmp;
    with dgILP.DataSource.DataSet do
    begin
      bookm := GetBookmark;
      DisableControls;
      try
        for i:= 0 to dgILP.SelectedRows.Count - 1 do
        begin

          if (sEstado = 'E') and (Is_SiniestroDeGobernacion(FieldByname('ex_id').AsInteger) and Seguridad.Claves.IsActive('Aprobar_pagoGPBA')                          // TK 64117
             and (MsgBox('¿Está seguro que desea autorizar este pago de GPBA?' + #13#10 + 'Siniestro: ' + FieldByname('siniestro').AsString + ' - Nro Liq.: ' +
                    IntToStr(FieldByname('le_numliqui').AsInteger), MB_OK + MB_ICONINFORMATION + MB_YESNO ) = IDYES))
             or  (not Is_SiniestroDeGobernacion(FieldByname('ex_id').AsInteger) or (sEstado <> 'E')) then
          begin

            GotoBookmark(Pointer(dgILP.SelectedRows.Items[i]));

            if ValidarILP(sEstado) then
            begin
              if (sEstado = 'G') and {(FieldByName('em_holding').AsString <> 'GBA')} (FieldByName('em_idgrupoeconomico').AsInteger <> 87) then  // cambio condicion de em_holding por em_idgrupoeconomico por mensaje de Cristian 28/10/2014  (tk 64326)
                MsgBox('Siniestro: ' + FieldByName('siniestro').AsString + ' - La empresa no pertenece a Holding GBA.')
              else if not ValidarAporyContr((sEstado = 'E'), FieldByName('le_conpago').AsInteger) then
                MsgBox('Siniestro: ' + FieldByname('siniestro').AsString + ' - Ya se realizó el cierre de aportes y contribuciones ' + #13 +
                       'del mes y deberá esperarse para la aprobación al mes siguiente.')
              else begin
                DoGrabarAutorizacionILTILP((FieldByName('ilt_autorizable').AsString = 'S'), sEstado,
                                            FieldByName('le_conpago').AsString, FieldByname('siniestro').AsString,
                                            FieldByname('le_siniestro').AsInteger, FieldByname('le_orden').AsInteger,
                                            FieldByname('le_recaida').AsInteger, FieldByname('le_numliqui').AsInteger,
                                            FieldByname('ex_id').AsInteger);
                Inc(iCant);
              end;
            end;

          end
          else if (sEstado = 'E') and Is_SiniestroDeGobernacion(FieldByname('ex_id').AsInteger) then         // TK 64117
               MsgBox('No se autorizó la liquidación con Siniestro: ' + FieldByname('siniestro').AsString + ' - Nro Liq.: ' +
                    IntToStr(FieldByname('le_numliqui').AsInteger) + ' debido a que pertenece a GPBA.');



        end;
      finally
        GotoBookmark(bookm);
        FreeBookmark(bookm);
        EnableControls;
      end;
      dgILP.UnselectAll;
      MsgBox('Se ha/n ' + sAccion2 + IntToStr(iCant) + ' liquidacion/es.');
      Refresh;
      tbRefrescarClick(nil);
      edCodLiq.Clear;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.DoCerrarExpediente(IdExped :Integer; SinComp, ConPago :String);
var
  sSql :String;
begin
  if Is_ConceptoCerrarSiniestro(ConPago) and
     not(Is_SiniestroCerrado(IdExped, MOTIVOCIERRE_PORINCAPACIDAD)) and
     not(Is_SiniestroNoCerrar(IdExped)) then
  begin
    if MsgAsk('¿Desea cerrar el siniestro ' + SinComp + '?') then
      sSql := 'INSERT INTO scs_cierresiniestro ' +
              '(cs_idexpediente, cs_fechacierre, cs_motivocierre, cs_procesocierre, ' +
              ' cs_fechaalta, cs_usualta) VALUES (' +
              SqlInt(IdExped) + ', ActualDate, ' + SqlValue(MOTIVOCIERRE_PORINCAPACIDAD) + ',' +
              SqlValue(PROCESOCIERRE_APROBACIONPAGO) + ', SysDate, ' + SqlValue(Sesion.UserID) + ')'
    else
      sSql := 'INSERT INTO tmp_siniestronocerrado ' +
              '(mp_usuario, mp_idexpediente) VALUES (' +
              SqlValue(Sesion.UserID) + ',' + SqlInt(IdExped) + ')';

    EjecutarSqlST(sSql);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAprobacion.Is_SiniestroNoCerrar(IdExped :Integer) :Boolean;
var
  sSql :String;
begin
  sSql   := 'SELECT 1 ' +
             ' FROM tmp_siniestronocerrado ' +
            ' WHERE mp_usuario = :Usuario ' +
              ' AND mp_idexpediente = :IdExp ';
  Result := ExisteSqlEx(sSql, [Sesion.UserID, IdExped]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.DoLimpiarTmp;
var
  sSql :String;
begin
  sSql := 'DELETE FROM tmp_siniestronocerrado ' +
          ' WHERE mp_usuario = :Usuario ';
  EjecutarSqlEx(sSql, [Sesion.UserID]);
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAprobacion.ValidarAutRevDer(bAutoriza: Boolean): Boolean;
begin
 // Verificar(bRevision   and not(bAutoriza), tbRevisar,    'Las liquidaciones seleccionadas se encuentran en estado de Revisión.');  // Lo comento por ticket 49998, ahora se puede poner en estado "Pendiente" las que estaban en Revision en ILP.
  Verificar(bDerivar    and not(bAutoriza), tbDerivar,    'Las liquidaciones seleccionadas se encuentran Derivadas.');
  Verificar(bAdeudaDDJJ and not(bAutoriza), tbAdeudaDDJJ, 'Las liquidaciones seleccionadas se encuentran en estado de Adeuda DDJJ.');   // TK 35997
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.tbRevisarClick(Sender: TObject);
begin
  case PageControl.TabIndex of
    ctsILT     : DoAutorizarILT('R');
    ctsILP     : DoAutorizarILP('R');
    ctsOPagos  : DoAutorizarOPagos('R');
  end;
end;
{-------------------------------------------------------------------------------}  // TK 38875
procedure TfrmLiqAprobacion.tbPendienteClick(Sender: TObject);
begin
  if  Validar_PasarAPendiente then
    case PageControl.TabIndex of
      ctsILT     : DoAutorizarILT('C');    // Solo si es ILT lo hace por ahora (pedido en ese ticket)
      ctsILP     : DoAutorizarILP('C');    // TK 49998
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.mnuMarcarTodosClick(Sender: TObject);
begin
  case PageControl.TabIndex of
    ctsOPagos  : dgOPagos.SelectAll;
    ctsILT     : dgILT.SelectAll;
    ctsILP     : dgILP.SelectAll;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.mnuDesmarcarTodosClick(Sender: TObject);
begin
  case PageControl.TabIndex of
    ctsOPagos  : dgOPagos.UnselectAll;
    ctsILT     : dgILT.UnselectAll;
    ctsILP     : dgILP.UnselectAll;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.tbExportarClick(Sender: TObject);
begin
  if HayRegistroActivo then
  begin
    case PageControl.TabIndex of
      ctsILP        : ExportDialog.DataSet := sdqILP;
      ctsILT        : ExportDialog.DataSet := sdqILT;
      ctsOPagos     : ExportDialog.DataSet := sdqOPagos;
    end;
    ExportDialog.Execute;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAprobacion.HayRegistroActivo :Boolean;
begin
  case PageControl.TabIndex of
    ctsILP        : Result := sdqILP.Active and not(sdqILP.IsEmpty);
    ctsILT        : Result := sdqILT.Active and not(sdqILT.IsEmpty);
    ctsOPagos     : Result := sdqOPagos.Active and not(sdqOPagos.IsEmpty);
  else
    Result := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.tbImprimirClick(Sender: TObject);
begin
  if HayRegistroActivo and PrintDialog.Execute then
  case PageControl.TabIndex of
    ctsILP        : DoImprimirGrilla(dsILP, dgILP, 'ILP');
    ctsILT        : DoImprimirGrilla(dsILT, dgILT, 'ILT');
    ctsOPagos     : DoImprimirGrilla(dsOPagos, dgOPagos, 'Otros Pagos', pxPortrait);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.DoImprimirGrilla(dsActual :TDataSource; dgActual :TArtDBGrid;
                                             sCaption :String; Orientacion :TPageOrientation = pxLandscape);
var
  sCampo: String;
  TotalImporte: Array of Extended;
begin
  with QueryPrint do
  begin
    Fields.Clear;
    PageOrientation := Orientacion;
    DataSource      := dsActual;
    SetGridColumns(dgActual, True, [baDetail, baHeader, baTotal, baSubTotal]);
    if (dgActual.Name = 'dgILT') then
    begin
      Fields[11].Width := 1800;
      Fields.Delete(8); //borro las columnas que no interesan...
      Fields.Delete(8);
      Fields.Delete(8);
      Fields.Delete(9);
    end
    else if (dgActual.Name = 'dgILP') then
    begin
      Fields[9].Width := 1800;
      Fields.Delete(8);
      Fields.Delete(9);
    end;
    sCampo := IIF((dgActual.Name = 'dgOPagos'), 'PR_IMPORPAGO', 'LE_IMPORPERI');
    SetLength(TotalImporte, 1);
    SumFields(dgActual.DataSource.DataSet, [sCampo], TotalImporte);
    Title.Text      := 'Aprobación de liquidaciones de ' + sCaption;
    SubTitle.Text   := 'Cantidad de liquidaciones: ' + IntToStr(dsActual.DataSet.RecordCount) +
                       ' - Importe total: ' + FloatToStr(TotalImporte[0]);
    Print;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.tbDerivarClick(Sender: TObject);
begin
  case PageControl.TabIndex of
    ctsOPagos  : DoAutorizarOPagos('G');
    ctsILT     : DoAutorizarILT('G');
    ctsILP     : DoAutorizarILP('G');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.chkRevisionClick(Sender: TObject);
begin
  if chkRevision.Checked then
  begin
    chkDerivadas.Checked  := False;
    chkAdeudaDDJJ.Checked := False;
    chkGerencia.Checked   := False; 
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.chkDerivadasClick(Sender: TObject);
begin
  if chkDerivadas.Checked then
  begin
    chkRevision.Checked   := False;
    chkAdeudaDDJJ.Checked := False;
    chkGerencia.Checked   := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAprobacion.chkAdeudaDDJJClick(Sender: TObject);          // TK 35997
begin
  if chkAdeudaDDJJ.Checked then
  begin
    chkRevision.Checked   := False;
    chkDerivadas.Checked  := False;
    chkGerencia.Checked   := False;
  end;
end;
{-------------------------------------------------------------------------------} // TK 35997
procedure TfrmLiqAprobacion.tbAdeudaDDJJClick(Sender: TObject);
begin
  case PageControl.TabIndex of
    ctsILT : DoAutorizarILT('D');
    ctsILP : DoAutorizarILP('D');
  end;
end;

// TK 38027: en el caso que fuera un siniestro rechazado (con lo cual tendria que tener la clave habilitada para verlo), se pregunta si desea aprobarlo de todos modos
function TfrmLiqAprobacion.AprobarSiniRechazado(iILTILP:integer): boolean;
var idExp:integer;
begin
  Result := True;
  idExp  := 0;
  case iILTILP of
    ctsILT : idExp := sdqILT.FieldByName('EX_ID').AsInteger;
    ctsILP : idExp := sdqILP.FieldByName('EX_ID').AsInteger;
  end;
  if (ValorSqlEx('Select ex_causafin from art.sex_expedientes ' +
                 ' where ex_id = :idexp ', [idExp]) = '02') then
  begin
    if not MsgAsk('El/Los Siniestros seleccionados se encuentran Rechazados. ¿Desea continuar de todos modos?') then   // si dice que no, no se aprueba. Pregunto por todos porque cuando se ponga el filtro de Sini REch, son todos Rechazados.
     Result := False;
  end;
end;

procedure TfrmLiqAprobacion.chkSiniestrosRechClick(Sender: TObject);
begin
  if chkSiniestrosRech.Checked then
    chkSiniestrosRech.Font.Color := clRed
  else
    chkSiniestrosRech.Font.Color := clBlack;
end;

procedure TfrmLiqAprobacion.PageControlChange(Sender: TObject);
begin
  tbPendiente.Enabled := Seguridad.Activar(tbPendiente) and ((PageControl.TabIndex = ctsILT) or (PageControl.TabIndex = ctsILP));     // TK 38875  // TK 49998
end;

function TfrmLiqAprobacion.Validar_PasarAPendiente: Boolean;  // TK 38875
var i:integer;
begin
  Result := True;
  with dgILT.DataSource.DataSet do
    for i:= 0 to dgILT.SelectedRows.Count - 1 do
      if (FieldByName('LE_ESTADO').AsString <> 'R') then
      begin
        Result := False;
        MsgBox('Para pasar a estado Pendiente las liquidaciones deben estar en estado En revisión');
        Abort;
      end;
end;

function TfrmLiqAprobacion.Validar_LiqMayorAImporteMaximo(sEstado:string): Boolean;   // TK 43455
var cMontoMaximo: Currency; sTipoLiq: string;
begin
  Result := False;
  case PageControl.TabIndex of
    ctsILP : sTipoLiq := 'I';
    ctsILT : sTipoLiq := 'L';
  end;
  cMontoMaximo := Get_MontoMaxAprobPorUsuario(Sesion.UserID, sTipoLiq);

  if (sEstado = 'E') and  (cMontoMaximo = -1) then
    MsgBox('Usted no posee permisos para aprobar esta Liquidación')
  else if (sEstado = 'E') and  (cMontoMaximo > 0)  and (GetImporteLiq >= cMontoMaximo) then
    MsgBox('Usted no posee permisos para aprobar la liquidación mayor o igual al siguiente Importe a Pagar: ' + ToStr(GetImporteLiq))
  else
    Result := True;
end;

function TfrmLiqAprobacion.GetImporteLiq: Currency;
begin
  case PageControl.TabIndex of
    ctsOPagos: Result := sdqOPagos.FieldByName('pr_imporpago').AsCurrency;
    ctsILT   : Result := sdqILT.FieldByName('le_imporperi').AsCurrency;
    ctsILP   : Result := sdqILP.FieldByName('le_imporperi').AsCurrency;
    else       Result := 0;
  end;
end;


function TfrmLiqAprobacion.ValidarILP(sEstado:string): Boolean;
begin
  Result := Validar_LiqMayorAImporteMaximo(sEstado);    // TK 43455
end;

function TfrmLiqAprobacion.Get_MontoMaxAprobPorUsuario(sUsuario: string; sTipoLiq: string): Currency;   // TK 43455    // esta funcion es solo para ILT e ILP
var sSql: string;
begin
  {case PageControl.TabIndex of
    ctsILP : sTipoLiq := 'I';
    ctsILT : sTipoLiq := 'L';
  end;}
  sSql := 'SELECT mu_montomax FROM sin.smu_montomaxaprobporusuario ' +
          ' WHERE mu_usuario = :usu ' +
            ' AND mu_fechabaja IS NULL ' +
            ' AND mu_tipoliq = :tipoliq ';

  with GetQueryEx(sSql, [sUsuario, sTipoLiq]) do
  try
    if not Eof then // si existe en la tabla (puede ser 0 que es Sin Limite, o el valor con limite), entonces tiene permisos para aprobar
      Result := FieldByName('mu_montomax').AsCurrency
    else
      Result := -1;   // no existe en la tabla, entonces No tiene permisos para Aprobar ILP/ILT (segun el caso)
  finally
    Free;
  end;
end;


function TfrmLiqAprobacion.HayRegistroActivoILP :Boolean;
begin
  Result := sdqILP.Active and not sdqILP.IsEmpty;
end;

function TfrmLiqAprobacion.HayRegistroActivoILT :Boolean;
begin
  Result := sdqILT.Active and not sdqILT.IsEmpty;
end;

function TfrmLiqAprobacion.HayRegistroActivoOP :Boolean;
begin
  Result := sdqOPagos.Active and not sdqOPagos.IsEmpty;
end;

procedure TfrmLiqAprobacion.dgILPCellClick(Column: TColumn);
begin
  if HayRegistroActivoILP and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    //if (FRegistrosSeleccionadosILP.IndexOf(sdqILP.FieldByName('le_id').AsString) > -1) then
    if dgILP.SelectedRows.CurrentRowSelected = true then
    begin
      dgILP.SelectedRows.CurrentRowSelected := false;
      //FRegistrosSeleccionadosILP.Delete(FRegistrosSeleccionadosILP.IndexOf(sdqILP.FieldByName('le_id').AsString))
    end
    else
    begin
      dgILP.SelectedRows.CurrentRowSelected := true;
      //FRegistrosSeleccionadosILP.Add(sdqILP.FieldByName('le_id').AsString);
    end;
    dgILP.Repaint;
  end;

end;

procedure TfrmLiqAprobacion.dgILTCellClick(Column: TColumn);
begin
  if HayRegistroActivoILT and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if dgILT.SelectedRows.CurrentRowSelected = true then
      dgILT.SelectedRows.CurrentRowSelected := false
    else
      dgILT.SelectedRows.CurrentRowSelected := true;

    dgILT.Repaint;
  end;

end;

procedure TfrmLiqAprobacion.dgOPagosCellClick(Column: TColumn);
begin
  if HayRegistroActivoOP and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if dgOPagos.SelectedRows.CurrentRowSelected = true then
      dgOPagos.SelectedRows.CurrentRowSelected := false
    else
      dgOPagos.SelectedRows.CurrentRowSelected := true;

    dgOPagos.Repaint;
  end;

end;

procedure TfrmLiqAprobacion.dgILTKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    dgILTCellClick(dgILT.ColumnByField['CHECKBOX']);

end;

procedure TfrmLiqAprobacion.dgILPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    dgILPCellClick(dgILP.ColumnByField['CHECKBOX']);

end;

procedure TfrmLiqAprobacion.dgOPagosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    dgOPagosCellClick(dgOPagos.ColumnByField['CHECKBOX']);

end;

procedure TfrmLiqAprobacion.dgILPDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    dgILP.Canvas.FillRect(Rect);
    Check := 0;

    //if FRegistrosSeleccionadosILP.IndexOf(sdqILP.FieldByName('le_id').AsString) > -1 then
    if dgILP.SelectedRows.CurrentRowSelected = true then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(dgILP.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;


procedure TfrmLiqAprobacion.dgILTDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    dgILT.Canvas.FillRect(Rect);
    Check := 0;

    if dgILT.SelectedRows.CurrentRowSelected = true then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(dgILT.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmLiqAprobacion.dgOPagosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    dgOPagos.Canvas.FillRect(Rect);
    Check := 0;

    if dgOPagos.SelectedRows.CurrentRowSelected = true then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(dgOPagos.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;



procedure TfrmLiqAprobacion.tbGerenciaClick(Sender: TObject);
begin
  case PageControl.TabIndex of
    ctsOPagos  : DoAutorizarOPagos('S');
    ctsILT : DoAutorizarILT('S');
    ctsILP : DoAutorizarILP('S');
  end;

end;

procedure TfrmLiqAprobacion.chkGerenciaClick(Sender: TObject);
begin
  if chkGerencia.Checked then
  begin
    chkDerivadas.Checked  := False;
    chkAdeudaDDJJ.Checked := False;
    chkRevision.Checked   := False;
  end;

end;

end.
