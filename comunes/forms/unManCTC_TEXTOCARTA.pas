unit unManCTC_TEXTOCARTA;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   01-06-03
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unFraCodigoDescripcion,
  unfraCtbTablas, unFraToolbarRTF, RxRichEd, RxMemDS, Menus, unComunes, unFraStaticCodigoDescripcion, unArtDBAwareFrame,
  RXSpin, RxCombos, Mask, ToolEdit, Buttons, DateComboBox, RxToolEdit,
  RxPlacemnt;

type
  TfrmManCTC_TEXTOCARTA = class(TfrmCustomGridABM)
    lbTitulo: TLabel;
    edTC_NOMBRE: TEdit;
    Bevel1: TBevel;
    fraTC_DESTINATARIO: TfraCtbTablas;
    lbDestinatario: TLabel;
    sduHistorico: TSDUpdateSQL;
    PageControl: TPageControl;
    tsTexto: TTabSheet;
    tsAreas: TTabSheet;
    fraToolbarRTF: TfraToolbarRTF;
    edTC_TEXTO: TRxRichEdit;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    tbAreasAgregar: TToolButton;
    tbAreasQuitar: TToolButton;
    dbgAreas: TRxDBGrid;
    fpAbmAreas: TFormPanel;
    Bevel2: TBevel;
    Modulo: TLabel;
    btnAreasAceptar: TButton;
    btnAreasCancelar: TButton;
    sdqAreas: TSDQuery;
    dsAreas: TDataSource;
    ToolButton1: TToolButton;
    pmnuVariables: TPopupMenu;
    sduAreas: TSDUpdateSQL;
    GroupBox1: TGroupBox;
    rbManual: TRadioButton;
    rbAutomatico: TRadioButton;
    Reporte: TTabSheet;
    lsReportes: TListBox;
    lbCodigo: TLabel;
    edTC_CODIGO: TEdit;
    fraArea: TfraStaticCodigoDescripcion;
    sduTexto: TSDUpdateSQL;
    sdqTexto: TSDQuery;
    fraTC_MOTIVOCIERRE: TfraCtbTablas;
    Label1: TLabel;
    Label2: TLabel;
    fraTC_FORMATOASOC: TfraCodigoDescripcion;
    chkExigeRechazo: TCheckBox;
    edTC_TEXTODESTINAT: TEdit;
    Label3: TLabel;
    fraTC_TIPOSALIDA: TfraCtbTablas;
    Label4: TLabel;
    chkDatosCitacion: TCheckBox;
    edTC_LEYENDAACUSE: TMemo;
    Label5: TLabel;
    chkGobernacion: TCheckBox;
    chkTextoModificable: TCheckBox;
    chkTextoAltaManual: TCheckBox;
    pnFechaVigencia: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    edFechaVigenciaDesde: TDateEdit;
    edFechaVigenciaHasta: TDateEdit;
    pnBotoneraTrabajador: TPanel;
    btnPrimero: TBitBtn;
    btnAnterior: TBitBtn;
    btnSiguiente: TBitBtn;
    btnUltimo: TBitBtn;
    sduHistoricoTexto: TSDUpdateSQL;
    sdqHistoricoTexto: TSDQuery;
    fpNuevaVigencia: TFormPanel;
    rgNuevaFecha: TRadioGroup;
    btnAceptar2: TBitBtn;
    lbNuevaFechaVigenciaDesde: TLabel;
    Bevel3: TBevel;
    edNuevaFechaVigenciaDesde: TDateComboBox;
    sdqHistorico: TSDQuery;
    Label8: TLabel;
    lbNumeroMov: TLabel;
    Label9: TLabel;
    pnSqlAvisoRecibido: TPanel;
    memoSqlAvisoRecibo: TMemo;
    btnAgrandar: TBitBtn;
    btnAchicar: TBitBtn;
    chkValidarVencimiento: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnAreasAceptarClick(Sender: TObject);
    procedure dbgAreasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbAreasAgregarClick(Sender: TObject);
    procedure tbAreasQuitarClick(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure tbVariablesClick(Sender: TObject);
    procedure mnuVariableClick(Sender: TObject);
    procedure fraToolbarRTFtbGuardarClick(Sender: TObject);
    procedure rbManualClick(Sender: TObject);
    procedure rbAutomaticoClick(Sender: TObject);
    procedure fraTC_DESTINATARIOedCodigoChange(Sender: TObject);
    procedure fpNuevaVigenciaBeforeShow(Sender: TObject);
    procedure rgNuevaFechaClick(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnPrimeroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnSiguienteClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure sdqHistoricoAfterScroll(DataSet: TDataSet);
    procedure tbModificarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAgrandarClick(Sender: TObject);
    procedure btnAchicarClick(Sender: TObject);
  private
    FArea: TAreas;

    procedure AbrirHistorico(const aIdTextoCarta: Integer);
    procedure ActualizarEstado;
    procedure ActualizarVigenciaAnterior(const aActualizarVigenciaAnterior: Boolean; const aVigenciaHasta: TDateTime;
                                         const aIdTextoCarta, aIdHistoricoTextoCarta: Integer);
    procedure CargarNombreReportes;
    procedure DoActualizarTexto(aIdTexto: Integer);
    procedure DoActualizarTextoHistorico(const aIdTextoHistorico: Integer);
    procedure DoCargarTextoHistorico(aIdHistoricoTexto: Integer);
    procedure ExportarTextosCarta;
    procedure SetArea(const Value: TAreas);
  protected
    FFiltroAreas: String;

    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ActualizarTextoCarta(const aQuery: TSDQuery); virtual;
    procedure CargarVariables(LimpiarAnteriores: Boolean = True); virtual;
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    property Area: TAreas read FArea write SetArea;
  end;

var
  frmManCTC_TEXTOCARTA: TfrmManCTC_TEXTOCARTA;

implementation

uses
  unDmPrincipal, DBFuncs, CustomDlgs, General, unArt, SqlFuncs, AnsiSql, unRTTI, VCLExtra, unSesion
  {$IFNDEF VER130}, Variants{$ENDIF}, unEspera, DateTimeFuncs;

const
  PAGE_DATOSGENERALES = 0;
  PAGE_AREAS          = 1;
  SQLFORMATOASOC =
    'SELECT DISTINCT tc_id ID, tc_codigo codigo, tc_nombre descripcion, tc_fechabaja baja, tc_usualta,' +
                   ' TRUNC(tc_fechaalta) tc_fechaalta' +
              ' FROM ctc_textocarta, cta_textoarea, cat_areatexto' +
             ' WHERE tc_id = ta_idtextocarta' +
               ' AND ta_idareatexto = at_id' +
               ' AND ta_fechabaja IS NULL';

{$R *.DFM}

function TfrmManCTC_TEXTOCARTA.DoABM: Boolean;
var
  iIdTextoCarta: Integer;
  sSql: String;
begin
  try
    BeginTrans;

    if (ModoABM = maAlta) or (rgNuevaFecha.ItemIndex = 0) then
    begin
      iIdTextoCarta := sdqHistorico.FieldByName('ht_idtextocarta').AsInteger;

      sdqHistorico.Insert;
      sdqHistorico.FieldByName('ht_id').AsInteger         := GetSecNextVal('comunes.seq_cht2_id');
      sdqHistorico.FieldByName('ht_usualta').AsString     := Sesion.UserID;
      sdqHistorico.FieldByName('ht_fechaalta').AsDateTime := DBDateTime;

      if ModoABM = maAlta then
        sdqHistorico.FieldByName('ht_idtextocarta').AsInteger := GetSecNextVal('comunes.SEQ_CTC_ID')
      else
        sdqHistorico.FieldByName('ht_idtextocarta').AsInteger := iIdTextoCarta;

      sSql :=
        'SELECT NVL(MAX(ht_numeromov) + 1, 1)' +
         ' FROM comunes.cht_historicotextocarta' +
        ' WHERE ht_idtextocarta = ' + SqlValue(sdqHistorico.FieldByName('ht_idtextocarta').AsInteger);
      sdqHistorico.FieldByName('ht_numeromov').AsInteger := ValorSqlInteger(sSql);
    end
    else
    begin
      sdqHistorico.Edit;
      sdqHistorico.FieldByName('ht_usumodif').AsString     := Sesion.UserID;
      sdqHistorico.FieldByName('ht_fechamodif').AsDateTime := DBDateTime;
    end;

    if ModoABM = maBaja then
    begin
      sdqAreas.Close;
      sdqAreas.ParamByName('pidtextocarta').AsInteger := sdqHistorico.FieldByName('ht_idtextocarta').AsInteger;
      sdqAreas.Open;

      sdqHistorico.FieldByName('ht_usubaja').AsString     := Sesion.UserID;
      sdqHistorico.FieldByName('ht_fechabaja').AsDateTime := DBDate;
    end
    else
    begin
      sdqHistorico.FieldByName('ht_canthojas').AsInteger        := 1;
      sdqHistorico.FieldByName('ht_codigo').AsString            := edTC_CODIGO.Text;
      sdqHistorico.FieldByName('ht_nombre').AsString            := edTC_NOMBRE.Text;
      sdqHistorico.FieldByName('ht_textodestinatario').AsString := edTC_TEXTODESTINAT.Text;
      sdqHistorico.FieldByName('ht_destinatario').AsString      := fraTC_DESTINATARIO.Value;
      sdqHistorico.FieldByName('ht_motivocierre').AsString      := fraTC_MOTIVOCIERRE.Value;
      sdqHistorico.FieldByName('ht_formatorel').AsString        := fraTC_FORMATOASOC.ID;
      sdqHistorico.FieldByName('ht_tiposalida').AsString        := fraTC_TIPOSALIDA.Value;
      sdqHistorico.FieldByName('ht_exigerechazo').AsString      := IIF(chkExigeRechazo.Checked, 'S', 'N');
      sdqHistorico.FieldByName('ht_datoscitacion').AsString     := IIF(chkDatosCitacion.Checked, 'S', 'N');
      sdqHistorico.FieldByName('ht_gobernacion').AsString       := IIF(chkGobernacion.Checked, 'S', 'N');
      sdqHistorico.FieldByName('ht_textomodificable').AsString  := IIF(chkTextoModificable.Checked, 'S', 'N');  // Lu TK 790
      sdqHistorico.FieldByName('ht_textoaltamanual').AsString   := IIF(chkTextoAltaManual.Checked, 'S', 'N');  // Lu 11/12/08
      sdqHistorico.FieldByName('ht_validavencimiento').AsString := IIF(chkValidarVencimiento.Checked, 'S', 'N'); // TK 54662
      sdqHistorico.FieldByName('ht_leyendaacuse').AsString      := edTC_LEYENDAACUSE.Lines.Text;
      sdqHistorico.FieldByName('ht_sqlavisorecibo').AsString    := memoSqlAvisoRecibo.Lines.Text;

      if edNuevaFechaVigenciaDesde.Date > 0 then
        sdqHistorico.FieldByName('ht_vigenciadesde').AsDateTime := edNuevaFechaVigenciaDesde.Date;

      if rbManual.Checked then
      begin
        if edTC_TEXTO.Modified then
          sdqHistorico.FieldByName('ht_rpt').AsString := '';
      end
      else
        sdqHistorico.FieldByName('ht_rpt').AsString := lsReportes.Items.Strings[lsReportes.itemIndex];
    end;
    sdqHistorico.Post;

    sdqAreas.First;
    repeat
      sdqAreas.Edit;
      try
        if sdqAreas.FieldByName('ta_id').AsInteger = ART_EMPTY_ID then
          sdqAreas.FieldByName('ta_id').AsInteger := GetSecNextVal('SEQ_CTA_ID');

        sdqAreas.FieldByName('ta_idtextocarta').AsInteger := sdqHistorico.FieldByName('ht_idtextocarta').AsInteger;
        sdqAreas.Post;
      except
        sdqAreas.Cancel;
        raise;
      end;
      sdqAreas.Next;
    until sdqAreas.Eof;

    ActualizarTextoCarta(sdqHistorico);
    sdqHistorico.ApplyUpdates;
    sdqAreas.ApplyUpdates;
    DoActualizarTextoHistorico(sdqHistorico.FieldByName('ht_id').AsInteger);
    ActualizarVigenciaAnterior((ModoABM = maModificacion) and (rgNuevaFecha.ItemIndex = 0),
                                edNuevaFechaVigenciaDesde.Date - 1,
                                sdqHistorico.FieldByName('ht_idtextocarta').AsInteger,
                                sdqHistorico.FieldByName('ht_id').AsInteger);

    CommitTrans;

    Result := True;
  except
    on E: Exception do
    begin
      if sdqHistorico.State in [dsEdit, dsInsert] then
        sdqHistorico.Cancel;
      sdqAreas.CancelUpdates;
      sdqHistorico.CancelUpdates;
      RollBack;

      ErrorMsg(E, 'Error al guardar los datos.');
      Result := False;
    end;
  end;
end;

function TfrmManCTC_TEXTOCARTA.Validar: Boolean;
var
  sSql: String;

  procedure Verificar(Condicion: Boolean; AControl: TWinControl; TabIndex: Integer; AText: String);
  begin
    if Condicion then
    begin
      PageControl.ActivePageIndex := TabIndex;
      if AText <> '' then
        InvalidMsg(AControl, AText);
      Result := False;
      Abort;
    end;
  end;

  begin
  if ModoABM = maAlta then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM ctc_textocarta' +
      ' WHERE tc_codigo = :codigo';
    Verificar(ExisteSqlEx(sSql, [edTC_CODIGO.Text]), edTC_CODIGO, 0, 'El código ya existe.');
  end;

  Verificar(edTC_CODIGO.Text = '', edTC_CODIGO, 0, 'El Código es obligatorio.');
  Verificar(edTC_NOMBRE.Text = '', edTC_NOMBRE, 0, 'El Título es obligatorio.');
  Verificar(fraTC_DESTINATARIO.IsEmpty, fraTC_DESTINATARIO, 0, 'El Destinatario es obligatorio.');
  Verificar((Length(memoSqlAvisoRecibo.Lines.Text) > 0) and (Copy(memoSqlAvisoRecibo.Lines.Text, 0, 6) <> 'SELECT'), memoSqlAvisoRecibo, 0, 'El SQL debe empezar con la sentencia SELECT.');
  Verificar(rbManual.Checked and (Trim(edTC_TEXTO.Text) = ''), edTC_TEXTO, 0, 'El Texto es obligatorio si elige el contenido manual.');
  Verificar(rbAutomatico.Checked and (lsReportes.ItemIndex = -1), lsReportes, 1, 'El Reporte es obligatorio si elige el contenido manual.');
  Verificar(sdqAreas.RecordCount < 1, dbgAreas, 2, 'Debe seleccionar al menos un área.');

  Result := True;
end;


procedure TfrmManCTC_TEXTOCARTA.AbrirHistorico(const aIdTextoCarta: Integer);
begin
  with sdqHistorico do
  begin
    Close;
    ParamByName('ht_idtextocarta').AsInteger := aIdTextoCarta;
    Open;
    Last;
  end;
end;

procedure TfrmManCTC_TEXTOCARTA.ActualizarEstado;
begin
  if rbManual.Checked then
  begin
    LockControl(PageControl.Pages[0], False);
    LockControl(PageControl.Pages[1], True)
  end
  else
  begin
    LockControl(PageControl.Pages[0], True);
    LockControl(PageControl.Pages[1], False)
  end
end;

procedure TfrmManCTC_TEXTOCARTA.ActualizarTextoCarta(const aQuery: TSDQuery);
var
  aSql: TSql;
begin
  aSql := TSql.Create('ctc_textocarta');

  with aQuery do
  try
    // Si el día de hoy no está entre las fechas de vigencia, no actualizo la ctc asi en esta tabla se conservan solo
    //  los datos de la vigencia correspondiente al día de hoy..
    // Por eso tambien hay un alerta que copia los datos del histórico a la ctc, para mantener esta tabla siempre actualizada..
    if not ((DBDate >= Trunc(FieldByName('ht_vigenciadesde').AsDateTime)) and (DBDate <= Trunc(IIF((FieldByName('ht_vigenciahasta').AsDateTime = 0), DBDate, FieldByName('ht_vigenciahasta').AsDateTime)))) then
      Exit;

    if ModoABM = maAlta then
    begin
      aSql.SqlType := stInsert;
      aSql.Fields.Add('tc_fechaalta', FieldByName('ht_fechaalta').AsDateTime);
      aSql.Fields.Add('tc_usualta',   FieldByName('ht_usualta').AsString);
    end
    else
    begin
      aSql.SqlType := stUpdate;
      aSql.Fields.Add('tc_fechabaja', FieldByName('ht_fechabaja').AsDateTime);
      aSql.Fields.Add('tc_usubaja',   FieldByName('ht_usubaja').AsString);
    end;

    aSql.PrimaryKey.Add('tc_id',            FieldByName('ht_idtextocarta').AsInteger);
    aSql.Fields.Add('tc_nombre',            FieldByName('ht_nombre').AsString);
    aSql.Fields.Add('tc_destinatario',      FieldByName('ht_destinatario').AsString);
    aSql.Fields.Add('tc_texto',             '.');
    aSql.Fields.Add('tc_rpt',               FieldByName('ht_rpt').AsString);
    aSql.Fields.Add('tc_codigo',            FieldByName('ht_codigo').AsString);
    aSql.Fields.Add('tc_motivocierre',      FieldByName('ht_motivocierre').AsString);
    aSql.Fields.Add('tc_formatorel',        FieldByName('ht_formatorel').AsInteger, True);
    aSql.Fields.Add('tc_exigerechazo',      FieldByName('ht_exigerechazo').AsString);
    aSql.Fields.Add('tc_formatoadjunto',    FieldByName('ht_formatoadjunto').AsInteger);
    aSql.Fields.Add('tc_textodestinatario', FieldByName('ht_textodestinatario').AsString);
    aSql.Fields.Add('tc_tiposalida',        FieldByName('ht_tiposalida').AsString);
    aSql.Fields.Add('tc_datoscitacion',     FieldByName('ht_datoscitacion').AsString);
    aSql.Fields.Add('tc_leyendaacuse',      FieldByName('ht_leyendaacuse').AsString);
    aSql.Fields.Add('tc_canthojas',         FieldByName('ht_canthojas').AsInteger);
    aSql.Fields.Add('tc_gobernacion',       FieldByName('ht_gobernacion').AsString);
    aSql.Fields.Add('tc_textomodificable',  FieldByName('ht_textomodificable').AsString);
    aSql.Fields.Add('tc_textoaltamanual',   FieldByName('ht_textoaltamanual').AsString);
    aSql.Fields.Add('tc_validavencimiento', FieldByName('ht_validavencimiento').AsString);  // TK 54662
    aSql.Fields.Add('tc_imprusuario',       FieldByName('ht_imprusuario').AsString);
    aSql.Fields.Add('tc_exigedest',         FieldByName('ht_exigedest').AsString);
    aSql.Fields.Add('tc_sqlavisorecibo',    FieldByName('ht_sqlavisorecibo').AsString);

    EjecutarSqlST(aSql.Sql);

    DoActualizarTexto(FieldByName('ht_idtextocarta').AsInteger);
  finally
    aSql.Free;
  end;
end;

procedure TfrmManCTC_TEXTOCARTA.ActualizarVigenciaAnterior(const aActualizarVigenciaAnterior: Boolean;
                                                           const aVigenciaHasta: TDateTime; const aIdTextoCarta,
                                                           aIdHistoricoTextoCarta: Integer);
var
  sSql: String;
begin
  if aActualizarVigenciaAnterior then
  begin
    sSql :=
      'UPDATE comunes.cht_historicotextocarta' +
        ' SET ht_vigenciahasta = :vigenciahasta' +
      ' WHERE ht_id = (SELECT MAX(ht_id)' +
                       ' FROM comunes.cht_historicotextocarta' +
                      ' WHERE ht_idtextocarta = :idtextocarta' +
                        ' AND ht_id <> :id)';
    EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(aVigenciaHasta), aIdTextoCarta, aIdHistoricoTextoCarta]);
  end;
end;

procedure TfrmManCTC_TEXTOCARTA.CargarNombreReportes;
var
  sSql: String;
begin
  lsReportes.Items.Clear;
  sSql :=
    'SELECT DISTINCT tc_rpt rpt' +
              ' FROM ctc_textocarta' +
             ' WHERE tc_rpt IS NOT NULL' +
          ' ORDER BY upper(tc_rpt)';
  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      lsReportes.Items.Add(FieldByName('rpt').AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmManCTC_TEXTOCARTA.CargarVariables(LimpiarAnteriores: Boolean = True);
var
  iLoop: Integer;
  MenuItem: TMenuItem;
  sdqSqlArea: TSDQuery;
begin
  sdqSqlArea := TSDQuery.Create(Self);
  try
    SetDatabaseToQuery(sdqSqlArea);
    if LimpiarAnteriores then
    begin
      pmnuVariables.Items.Clear;
      sdqAreas.First;
    end;

    while not sdqAreas.Eof do
    begin
      if sdqAreas.FieldByName('ta_fechabaja').IsNull and (Trim(sdqAreas.FieldByName('sql').AsString) <> '')then
      begin
        try
          CheckAndOpenQuery(sdqSqlArea, sdqAreas.FieldByName('sql').AsString);
        except
          on E: Exception do
            ErrorMsg(E, 'Error al recuperar las variables del módulo "' + sdqAreas.FieldByName('area').AsString + '".');
        end;
        if sdqSqlArea.Active then
          for iLoop := 0 to sdqSqlArea.Fields.Count - 1 do
            if pmnuVariables.Items.Find(sdqSqlArea.Fields[iLoop].FieldName) = nil then
            begin
              MenuItem := TMenuItem.Create(pmnuVariables);
              MenuItem.Caption := sdqSqlArea.Fields[iLoop].FieldName;
              MenuItem.OnClick := mnuVariableClick;
              pmnuVariables.Items.Add(MenuItem);
            end;
      end;
      if LimpiarAnteriores then
        sdqAreas.Next
      else
        Break;
    end;
  finally
    sdqSqlArea.Free;
  end;
end;

procedure TfrmManCTC_TEXTOCARTA.ClearControls;
begin
  edTC_CODIGO.Clear;
  edTC_NOMBRE.Clear;
  edTC_TEXTODESTINAT.Clear;
  fraTC_DESTINATARIO.Clear;
  fraTC_MOTIVOCIERRE.Clear;
  fraTC_FORMATOASOC.Clear;
  fraTC_TIPOSALIDA.Clear;
  edTC_TEXTO.Clear;
  edTC_LEYENDAACUSE.Clear;
  memoSqlAvisoRecibo.Clear;

  edTC_TEXTO.Modified         := False;
  chkExigeRechazo.Checked     := False;
  chkDatosCitacion.Checked    := False;
  chkGobernacion.Checked      := False;
  chkTextoModificable.Checked := False;
  chkValidarVencimiento.Checked := False; // TK 54662
  chkTextoAltaManual.Checked  := False;

  edFechaVigenciaDesde.Clear;
  edFechaVigenciaHasta.Clear;
  lbNumeroMov.Caption := ' ';

  VCLExtra.LockControl(edTC_CODIGO, False);

  sdqAreas.Close; {POR LAS DUDAS}
  sdqAreas.ParamByName('pidtextocarta').AsInteger := ART_EMPTY_ID;
  OpenQuery(sdqAreas);
end;

procedure TfrmManCTC_TEXTOCARTA.DoActualizarTexto(aIdTexto: Integer);
begin
  with sdqTexto do
  begin
    Close;
    ParamByName('pcodigo').AsInteger := aIdTexto;
    Open;
    Edit;
    if rbManual.Checked then
      TStringToField(edTC_TEXTO.Lines, FieldByName('tc_texto'))
    else
      FieldByName('tc_texto').AsString := 'Texto generado automáticamente';

    // Lo hago con esto porque el campo long da error de la otra forma
    Post;
    ApplyUpdates;
  end;
end;

procedure TfrmManCTC_TEXTOCARTA.DoActualizarTextoHistorico(const aIdTextoHistorico: Integer);
begin
  if edTC_TEXTO.Modified then
    with sdqHistoricoTexto do
    begin
      Close;
      ParamByName('pcodigo').AsInteger := aIdTextoHistorico;
      Open;
      Edit;
      if rbManual.Checked then
        TStringToField(edTC_TEXTO.Lines, FieldByName('ht_texto'))
      else
        FieldByName('ht_texto').AsString := 'Texto generado automáticamente';

      // Lo hago con esto porque el campo long da error de la otra forma
      Post;
      ApplyUpdates;
    end;
end;

procedure TfrmManCTC_TEXTOCARTA.DoCargarTextoHistorico(aIdHistoricoTexto: Integer);
begin
  edTC_TEXTO.Lines.Clear;

  with sdqHistoricoTexto do
  begin
    Close;
    ParamByName('pcodigo').AsInteger := aIdHistoricoTexto;
    Open;
    FieldToTString(FieldByName('ht_texto'), edTC_TEXTO.Lines);
  end;

  edTC_TEXTO.Modified := False;
end;

procedure TfrmManCTC_TEXTOCARTA.ExportarTextosCarta;
var
  sSql: String;
begin
  // Procedimiento hecho para migrar los textos de las cartas hacia la nueva tabla de históricos..


  sSql := 'SELECT 1 FROM comunes.cht_historicotextocarta';
  if ExisteSql(sSql) then
    Exit;

  IniciarEspera('Exportando los textos de las cartas, aguarde un instante por favor...');
  BeginTrans;

  sSql :=
    'INSERT INTO comunes.cht_historicotextocarta' +
               ' (ht_id, ht_idtextocarta, ht_nombre, ht_destinatario, ht_texto, ht_rpt, ht_codigo, ht_motivocierre,' +
               ' ht_formatorel, ht_exigerechazo, ht_formatoadjunto, ht_textodestinatario, ht_tiposalida,' +
               ' ht_datoscitacion, ht_leyendaacuse, ht_canthojas, ht_gobernacion, ht_textomodificable,' +
               ' ht_textoaltamanual, ht_imprusuario, ht_exigedest, ht_vigenciadesde, ht_fechaalta, ht_usualta,' +
               ' ht_numeromov, ht_sqlavisorecibo, ht_validavencimiento) ' +
        ' SELECT comunes.seq_cht2_id.NEXTVAL, tc_id, tc_nombre, tc_destinatario, ''.'', tc_rpt, tc_codigo,' +
               ' tc_motivocierre, tc_formatorel, tc_exigerechazo, tc_formatoadjunto, tc_textodestinatario,' +
               ' tc_tiposalida, tc_datoscitacion, tc_leyendaacuse, tc_canthojas, tc_gobernacion, tc_textomodificable,' +
               ' tc_textoaltamanual, tc_imprusuario, tc_exigedest, TO_DATE(''01/07/1996'', ''dd/mm/yyyy''), SYSDATE,' +
               ' ''ALAPACO'', 1, tc_sqlavisorecibo, tc_validavencimiento ' +   // TK 54662
          ' FROM ctc_textocarta';
  EjecutarSqlST(sSql);

  sSql :=
    'SELECT ht_id, tc_id, tc_texto' +
     ' FROM comunes.ctc_textocarta, comunes.cht_historicotextocarta' +
    ' WHERE tc_id = ht_idtextocarta';
  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      sdqTexto.Close;
      sdqTexto.ParamByName('pcodigo').AsInteger := FieldByName('tc_id').AsInteger;
      sdqTexto.Open;
      FieldToTString(sdqTexto.FieldByName('tc_texto'), edTC_TEXTO.Lines);

      DoActualizarTextoHistorico(FieldByName('ht_id').AsInteger);

      Next;
    end;
  finally
    Free;
    CommitTrans;
    DetenerEspera;
  end;
end;

procedure TfrmManCTC_TEXTOCARTA.LoadControls;
var
  bEncontro: Boolean;
  iLoop: Integer;
  sValorCampo: String;
begin
  with sdqHistorico do
  begin
    edTC_CODIGO.Text              := FieldByName('ht_codigo').AsString;
    edTC_NOMBRE.Text              := FieldByName('ht_nombre').AsString;
    edTC_TEXTODESTINAT.Text       := FieldByName('ht_textodestinatario').AsString;
    fraTC_DESTINATARIO.Value      := FieldByName('ht_destinatario').AsString;
    fraTC_MOTIVOCIERRE.Value      := FieldByName('ht_motivocierre').AsString;
    {$IFDEF ART2}
    fraTC_FORMATOASOC.Value       := FieldByName('ht_formatorel').AsInteger;
    {$ELSE}
    fraTC_FORMATOASOC.Value       := FieldByName('ht_formatorel').AsString;
    {$ENDIF}
    fraTC_FORMATOASOC.Enabled     := (fraTC_DESTINATARIO.Codigo = DESTI_EMPRESA);
    fraTC_TIPOSALIDA.Value        := FieldByName('ht_tiposalida').AsString;
    edTC_TEXTODESTINAT.Enabled    := (fraTC_DESTINATARIO.Codigo = DESTI_TRABAJADOR) or (fraTC_DESTINATARIO.Codigo = DESTI_AMBOS);
    edTC_LEYENDAACUSE.Lines.Text  := FieldByName('ht_leyendaacuse').AsString;
    memoSqlAvisoRecibo.Lines.Text := FieldByName('ht_sqlavisorecibo').AsString;
    chkExigeRechazo.Checked       := (FieldByName('ht_exigerechazo').AsString = 'S');
    chkDatosCitacion.Checked      := (FieldByName('ht_datoscitacion').AsString = 'S');
    chkGobernacion.Checked        := (FieldByName('ht_gobernacion').AsString = 'S');
    chkTextoModificable.Checked   := (FieldByName('ht_textomodificable').AsString = 'S');
    chkValidarVencimiento.Checked := (FieldByName('ht_validavencimiento').AsString = 'S');  // TK 54662
    chkTextoAltaManual.Checked    := (FieldByName('ht_textoaltamanual').AsString = 'S');  // Lu 11/12/08
    edFechaVigenciaDesde.Date     := FieldByName('ht_vigenciadesde').AsDateTime;
    edFechaVigenciaHasta.Date     := FieldByName('ht_vigenciahasta').AsDateTime;
    lbNumeroMov.Caption           := FieldByName('ht_numeromov').AsString;

    VCLExtra.LockControl(edTC_CODIGO);
    DoCargarTextoHistorico(FieldByName('ht_id').AsInteger);
    sValorCampo := FieldByName('ht_rpt').AsString;
    lsReportes.ItemIndex := -1;

    if sValorCampo = '' then
      rbManual.Checked := True
    else
    begin
      rbAutomatico.Checked := True;
      bEncontro := False;
      for iLoop := 0 to lsReportes.Items.Count - 1 do
        if sValorCampo = lsReportes.Items.Strings[iLoop] then
        begin
          lsReportes.ItemIndex := iLoop;
          bEncontro := True;
        end;

      if not bEncontro then
        MessageDlg('El reporte ' + sValorCampo + ' no existe', mtError, [mbOK], 0);
    end;

    sdqAreas.Close; {POR LAS DUDAS}
    sdqAreas.ParamByName('pidtextocarta').AsInteger := FieldByName('ht_idtextocarta').AsInteger;
    OpenQuery(sdqAreas);
    CargarVariables;

    VCLExtra.LockControl(btnAceptar, (ModoABM = maModificacion) and
                                     ((not sdqConsulta.FieldByName('tc_fechabaja').IsNull) or
                                     (not ((DBDate >= Trunc(FieldByName('ht_vigenciadesde').AsDateTime)) and (DBDate <= Trunc(IIF((FieldByName('ht_vigenciahasta').AsDateTime = 0), DBDate, FieldByName('ht_vigenciahasta').AsDateTime)))))));
  end;
end;

procedure TfrmManCTC_TEXTOCARTA.SetArea(const Value: TAreas);
var
  sSql: String;
begin
  if FArea <> Value then
  begin
    FArea := Value;

    case FArea of
      aCobranzas:
        FFiltroAreas := ' AND at_area = ' + SqlValue(AREA_COB);

      aAfiliaciones:
        // desde afiliaciones, también se incluye al area técnica
        FFiltroAreas := ' AND at_area IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';

      aSiniestros:
        FFiltroAreas := ' AND at_area = ' + SqlValue(AREA_SIN) + ')';

      aEmision:
        FFiltroAreas := ' AND at_area = ' + SqlValue(AREA_EMI);

      aMedSiniIncReca:
        // camarillo, para el llamado desde RedPres
        FFiltroAreas := ' AND at_area IN (' + SqlValue(AREA_MED) + ',' +
                                              SqlValue(AREA_SIN) + ',' +
                                              SqlValue(AREA_INC) + ',' +
                                              SqlValue(AREA_RECA) +
                                              IIF(Sesion.Sector = 'COMPUTOS', ',' + SqlValue(AREA_DIN), '')  + ')';

      aDinerarias:
        FFiltroAreas := ' AND at_area = ' + SqlValue(AREA_DIN);

      aLegales:
        FFiltroAreas := ' AND at_area = ' + SqlValue(AREA_LEG);
    end;

    fraArea.ExtraCondition := FFiltroAreas;

    sSql :=
      'SELECT ta_id, ta_idtextocarta, ta_idareatexto, at_descripcion area, at_sql sql, ta_usualta, ta_fechabaja,' +
            ' ta_usubaja, at_modulo' +
       ' FROM cta_textoarea, cat_areatexto' +
      ' WHERE at_id = ta_idareatexto' +
        ' AND ta_idtextocarta = :pIdTextoCarta' +
              fraArea.ExtraCondition +
   ' ORDER BY area';
    sdqAreas.SQL.Text := sSql;
    OpenQuery(sdqAreas);
  end;
  fraTC_FORMATOASOC.Sql := SQLFORMATOASOC + FFiltroAreas + ' AND tc_destinatario = ' + SqlValue(DESTI_TRABAJADOR);
  sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + FFiltroAreas + SortDialog.OrderBy;
  tbRefrescarClick(nil);
end;


procedure TfrmManCTC_TEXTOCARTA.FormCreate(Sender: TObject);
begin
  ShowActived := False;
  FieldBaja   := 'tc_fechabaja'; //el campo de baja de la grilla

  inherited;

  fraToolbarRTF.Edit       := edTC_TEXTO;
  fraTC_DESTINATARIO.Clave := 'DESTI';
  fraTC_MOTIVOCIERRE.Clave := 'CATER';
  fraTC_MOTIVOCIERRE.ExtraCondition := ' AND tb_especial1 = ''S'' ';

  with fraArea do
  begin
    TableName   := 'cat_areatexto';
    FieldID     := 'at_id';
    FieldCodigo := 'at_modulo';
    FieldDesc   := 'at_descripcion';
    FieldBaja   := 'at_fechabaja';
    ExtraFields := ', at_sql ';
  end;

  with fraTC_FORMATOASOC do
  begin
    TableName   := 'ctc_textocarta';
    FieldID     := 'tc_id';
    FieldCodigo := 'tc_codigo';
    FieldDesc   := 'tc_nombre';
    FieldBaja   := 'tc_fechabaja';
    ShowBajas   := True;
  end;

  fraTC_TIPOSALIDA.Clave     := 'TSCDO';
  fraTC_TIPOSALIDA.ShowBajas := True;

  if Self.ClassName = 'TfrmManCTC_TEXTOCARTA' then
  begin
    fpAbm.Height := Trunc(Screen.Height * 0.8);
    fpAbm.Width  := Trunc(Screen.Width  * 0.9);
  end;

  CargarNombreReportes;
  ActualizarEstado;
  VCLExtra.LockControls([edFechaVigenciaDesde, edFechaVigenciaHasta], True);
  VCLExtra.LockControls([memoSqlAvisoRecibo], Sesion.Sector <> 'COMPUTOS');

  with TToolButton.Create(self) do
  begin
    Name := 'tbVariables';
    Parent := fraToolbarRTF.tBarRTF;
    Left := 652;
    Top := 0;
    Hint := 'Variables';
    DropdownMenu := pmnuVariables;
    ImageIndex := 17;
    Style := tbsDropDown;
    OnClick := tbVariablesClick;
  end;

  ExportarTextosCarta;
end;

procedure TfrmManCTC_TEXTOCARTA.btnAreasAceptarClick(Sender: TObject);
begin
  if fraArea.IsEmpty then
    InvalidMsg(fraArea.edCodigo, 'Debe seleccionar el área a agregar.')

  else if CountRecords(sdqAreas, ['TA_IDAREATEXTO', 'TA_FECHABAJA'], [fraArea.Codigo, ''], 1) > 0 then
    InvalidMsg(fraArea.edCodigo, 'El área seleccionada ya ha sido cargada para el firmate.')

  else
  try
    if sdqAreas.Locate('ta_idareatexto', fraArea.Value, []) then
    begin
      sdqAreas.Edit;
      sdqAreas.FieldByName('ta_fechabaja').Value := Null;
    end
    else
    begin
      sdqAreas.Insert;
      sdqAreas.FieldByName('ta_id').AsInteger           := ART_EMPTY_ID;
      sdqAreas.FieldByName('ta_idtextocarta').AsInteger := ART_EMPTY_ID;
      sdqAreas.FieldByName('ta_idareatexto').AsInteger  := StrToInt(fraArea.ColValue(2));
      sdqAreas.FieldByName('at_modulo').AsString        := fraArea.ColValue(0);
      sdqAreas.FieldByName('sql').Value                 := fraArea.cmbDescripcion.Cells[5, fraArea.cmbDescripcion.Row];
      sdqAreas.FieldByName('area').AsString             := fraArea.cmbDescripcion.Text;
      sdqAreas.FieldByName('ta_usualta').AsString       := Sesion.UserID;
    end;

    sdqAreas.Post;
    sdqAreas.Locate('ta_idareatexto', fraArea.Value, []);
    try
      CargarVariables(False);
    except
      on E: Exception do
        MsgBox(E.Message, MB_ICONEXCLAMATION, 'ATENCIÓN');
    end;

    fpAbmAreas.ModalResult := mrOk;
  except
    on E: Exception do
      ErrorMsg(E, 'Error al guardar los datos del Área.');
  end;
end;

procedure TfrmManCTC_TEXTOCARTA.dbgAreasGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                      var Background: TColor; Highlight: Boolean);
begin
  if not sdqAreas.FieldByName('ta_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManCTC_TEXTOCARTA.tbAreasAgregarClick(Sender: TObject);
begin
  fraArea.Clear;
  fpAbmAreas.ShowModal;
end;

procedure TfrmManCTC_TEXTOCARTA.tbAreasQuitarClick(Sender: TObject);
begin
  if (not sdqAreas.IsEmpty) and sdqAreas.FieldByName('ta_fechabaja').IsNull and
     (MsgBox('¿ Realmente desea quitar el área seleccionada ?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    sdqAreas.Edit;
    sdqAreas.FieldByName('ta_fechabaja').AsDateTime := DBDateTime;
    sdqAreas.FieldByName('ta_usubaja').AsString    := Sesion.UserID;
    sdqAreas.Post;
    CargarVariables;
  end;
end;

procedure TfrmManCTC_TEXTOCARTA.fpAbmBeforeShow(Sender: TObject);
begin
  inherited;
  PageControl.ActivePageIndex := PAGE_DATOSGENERALES;

//  VCLExtra.LockControl(btnAceptar, (ModoABM = maModificacion) and (not sdqConsulta.FieldByName('TC_FECHABAJA').IsNull));

  VCLExtra.LockControl(btnAceptar, (ModoABM = maModificacion) and
                                  ((not sdqConsulta.FieldByName('tc_fechabaja').IsNull) or
                                   (not ((DBDate >= Trunc(sdqHistorico.FieldByName('ht_vigenciadesde').AsDateTime)) and (DBDate <= Trunc(IIF((sdqHistorico.FieldByName('ht_vigenciahasta').AsDateTime = 0), DBDate, sdqHistorico.FieldByName('ht_vigenciahasta').AsDateTime)))))));

end;

procedure TfrmManCTC_TEXTOCARTA.tbVariablesClick(Sender: TObject);
begin
  (Sender as TToolButton).CheckMenuDropdown;
end;

procedure TfrmManCTC_TEXTOCARTA.mnuVariableClick(Sender: TObject);
begin
  edTC_TEXTO.SelText := PChar('<<' + TMenuItem(Sender).Caption  + '>>');
end;

procedure TfrmManCTC_TEXTOCARTA.fraToolbarRTFtbGuardarClick(Sender: TObject);
begin
  inherited;
  fraToolbarRTF.tbGuardarClick(Sender);
end;

procedure TfrmManCTC_TEXTOCARTA.rbManualClick(Sender: TObject);
begin
  ActualizarEstado;
end;

procedure TfrmManCTC_TEXTOCARTA.rbAutomaticoClick(Sender: TObject);
begin
  ActualizarEstado;
end;

procedure TfrmManCTC_TEXTOCARTA.fraTC_DESTINATARIOedCodigoChange(Sender: TObject);
begin
  fraTC_FORMATOASOC.Enabled   := (fraTC_DESTINATARIO.Codigo = DESTI_EMPRESA);
  edTC_TEXTODESTINAT.Enabled  := (fraTC_DESTINATARIO.Codigo = DESTI_TRABAJADOR) or
                                 (fraTC_DESTINATARIO.Codigo = DESTI_AMBOS);
end;

procedure TfrmManCTC_TEXTOCARTA.fpNuevaVigenciaBeforeShow(Sender: TObject);
begin
  rgNuevaFecha.ItemIndex := -1;
  edNuevaFechaVigenciaDesde.Clear;

  VCLExtra.LockControls([edNuevaFechaVigenciaDesde], True);
end;

procedure TfrmManCTC_TEXTOCARTA.rgNuevaFechaClick(Sender: TObject);
begin
  VCLExtra.LockControls([edNuevaFechaVigenciaDesde], (rgNuevaFecha.ItemIndex = 1));

  if rgNuevaFecha.ItemIndex = 0 then
    edNuevaFechaVigenciaDesde.Date := DBDate;
end;

procedure TfrmManCTC_TEXTOCARTA.btnAceptar2Click(Sender: TObject);
var
  sSql: String;
begin
  Verificar((rgNuevaFecha.ItemIndex = 0) and (edNuevaFechaVigenciaDesde.IsEmpty), edNuevaFechaVigenciaDesde, 'Debe indicar la Fecha de Vigencia Desde.');
  Verificar((rgNuevaFecha.ItemIndex = 0) and (edNuevaFechaVigenciaDesde.Date < DBDate), edNuevaFechaVigenciaDesde, 'La Fecha de Vigencia Desde no puede ser menor al día de hoy.');;

  sSql :=
    'SELECT 1' +
     ' FROM comunes.cht_historicotextocarta' +
    ' WHERE ht_idtextocarta = ' + SqlValue(sdqHistorico.FieldByName('ht_idtextocarta').AsInteger) +
      ' AND ht_fechabaja IS NULL' +
      ' AND (   ' + SqlValue(edNuevaFechaVigenciaDesde.Date) + ' BETWEEN ht_vigenciadesde AND ht_vigenciahasta' +
           ' OR ' + SqlValue(edNuevaFechaVigenciaDesde.Date) + ' = ht_vigenciadesde)';
  Verificar(ExisteSql(sSql), edNuevaFechaVigenciaDesde, 'Ya existe un texto para esta Fecha de Vigencia.');

  fpNuevaVigencia.ModalResult := mrOk;
end;

procedure TfrmManCTC_TEXTOCARTA.btnAceptarClick(Sender: TObject);
begin
  if ModoABM = maAlta then
    edNuevaFechaVigenciaDesde.Date := DBDate
  else
    if fpNuevaVigencia.ShowModal = mrOk then
    begin
      if rgNuevaFecha.ItemIndex = 1 then    // Si solo quiere modificar los datos sin generar una nueva fecha de vigencia..
        edNuevaFechaVigenciaDesde.Clear;
    end
    else
      rgNuevaFecha.ItemIndex := 1;

  inherited;
end;

procedure TfrmManCTC_TEXTOCARTA.btnPrimeroClick(Sender: TObject);
begin
  sdqHistorico.First;
end;

procedure TfrmManCTC_TEXTOCARTA.btnAnteriorClick(Sender: TObject);
begin
  sdqHistorico.Prior;
end;

procedure TfrmManCTC_TEXTOCARTA.btnSiguienteClick(Sender: TObject);
begin
  sdqHistorico.Next;
end;

procedure TfrmManCTC_TEXTOCARTA.btnUltimoClick(Sender: TObject);
begin
  sdqHistorico.Last;
end;

procedure TfrmManCTC_TEXTOCARTA.sdqHistoricoAfterScroll(DataSet: TDataSet);
begin
  with sdqHistorico do
  begin
    btnPrimero.Enabled   := (RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF});
    btnAnterior.Enabled  := (RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF});
    btnSiguiente.Enabled := (RecNo < (RecordCount {$IFDEF VER150}- 1{$ENDIF}));
    btnUltimo.Enabled    := (RecNo < (RecordCount {$IFDEF VER150}- 1{$ENDIF}));

    if State = dsBrowse then
      LoadControls;
  end;
end;

procedure TfrmManCTC_TEXTOCARTA.tbModificarClick(Sender: TObject);
begin
  AbrirHistorico(sdqConsulta.FieldByName('tc_id').AsInteger);
    
  inherited;
end;

procedure TfrmManCTC_TEXTOCARTA.tbNuevoClick(Sender: TObject);
begin
  btnPrimero.Enabled   := False;
  btnAnterior.Enabled  := False;
  btnSiguiente.Enabled := False;
  btnUltimo.Enabled    := False;

  AbrirHistorico(-1);

  inherited;
end;

procedure TfrmManCTC_TEXTOCARTA.btnAgrandarClick(Sender: TObject);
begin
  btnAchicar.Show;
  btnAgrandar.Hide;
  pnSqlAvisoRecibido.Height := 84;
end;

procedure TfrmManCTC_TEXTOCARTA.btnAchicarClick(Sender: TObject);
begin
  btnAchicar.Hide;
  btnAgrandar.Show;
  pnSqlAvisoRecibido.Height := 21;
end;

end.
