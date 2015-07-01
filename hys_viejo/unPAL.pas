unit unPal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  StdCtrls, ExtCtrls, IntEdit, PatternEdit, FormPanel, Db, SDEngine,
  ImgList, Placemnt, QueryToFile, ExportDialog, QueryPrint, SortDlg,
  ShortCutControl, DBCGrids, Mask, ToolEdit, DateComboBox, unfraEstablecimiento,
  Menus, ImageComboBox, unArtFrame, unConstFet, unFraCodigoDescripcion, unArt,
  unfraCtbTablas, unArtDbFrame, unArtDBAwareFrame, VCLExtra, ExComboBox,
  unDmPrincipal, CustomDlgs, AnsiSql, General, StrFuncs, Numeros, SqlFuncs,
  unCustomDataModule, Buttons, DBCtrls, RxRichEd, Vcl.CheckLst, RxPlacemnt,
  RxToolEdit;

type
  TModoABM = (mfAlta, mfModif);


  TfrmPAL = class(TForm)
    QueryPrint: TQueryPrint;
    FormPlacement: TFormPlacement;
    sdqPAL: TSDQuery;
    dsPAL: TDataSource;
    sdPAL: TSortDialog;
    Export: TExportDialog;
    sdqVisitas: TSDQuery;
    dsVisitas: TDataSource;
    sdVisitas: TSortDialog;
    pnlVisitas: TPanel;
    CoolBar3: TCoolBar;
    ToolBar1: TToolBar;
    tbVisAgregar: TToolButton;
    tbVisQuitar: TToolButton;
    ToolButton5: TToolButton;
    tbVisOrdenar: TToolButton;
    dbgVisitas: TArtDBGrid;
    pnlRecomendaciones: TPanel;
    CoolBar1: TCoolBar;
    tBarPlanMejoras: TToolBar;
    tbPMRefrescar: TToolButton;
    ToolButton3: TToolButton;
    tbPMNuevo: TToolButton;
    tbPMModificar: TToolButton;
    tbPMEliminar: TToolButton;
    ToolButton9: TToolButton;
    tbPMOrdenar: TToolButton;
    ToolButton11: TToolButton;
    tbPMExportar: TToolButton;
    dbgPAL: TArtDBGrid;
    fpVisita: TFormPanel;
    Label5: TLabel;
    Bevel7: TBevel;
    Label3: TLabel;
    btnVisAceptar: TButton;
    btnVisCancelar: TButton;
    edVisFecha: TDateComboBox;
    cmbVisTipo: TExComboBox;
    fpPAL: TFormPanel;
    Bevel2: TBevel;
    lblItem: TLabel;
    btnPMAceptar: TButton;
    btnPMCancelar: TButton;
    qpPAL: TQueryPrint;
    lblVisita: TLabel;
    edVisita: TEdit;
    btnBuscarVisitas: TSpeedButton;
    fraItem: TfraCodigoDescripcion;
    DBMemo1: TDBMemo;
    pnlHeaderVisitas: TPanel;
    sccShortCut: TShortCutControl;
    chkTodosOps: TCheckBox;
    lbFCumplimiento: TLabel;
    lblFechaSeguimiento: TLabel;
    tbHistorico: TToolButton;
    ToolButton2: TToolButton;
    fpHistorico: TFormPanel;
    dbgHistorico: TArtDBGrid;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    DBMemo2: TDBMemo;
    tbSalir: TToolButton;
    sdqHistorico: TSDQuery;
    dsHistorico: TDataSource;
    ToolButton1: TToolButton;
    tbNoAmerita: TToolButton;
    tbSeleccionarTodo: TToolButton;
    edFechaCumplimiento: TDateComboBox;
    edFechaSeguimiento: TDateComboBox;
    lbFechaComprometida: TLabel;
    edFechaComprometida: TDateComboBox;
    pnlColor7: TPanel;
    Label7: TLabel;
    Panel2: TPanel;
    chkNivelFirmas: TCheckListBox;
    Label1: TLabel;
    cbSinFirmas: TCheckBox;
    procedure tbPMRefrescarClick(Sender: TObject);
    procedure tbPMNuevoClick(Sender: TObject);
    procedure tbPMModificarClick(Sender: TObject);
    procedure tbPMEliminarClick(Sender: TObject);
    procedure tbPMOrdenarClick(Sender: TObject);
    procedure tbPMExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPMAceptarClick(Sender: TObject);
    procedure tbVisAgregarClick(Sender: TObject);
    procedure tbVisOrdenarClick(Sender: TObject);
    procedure btnVisAceptarClick(Sender: TObject);
    procedure btnBuscarVisitasClick(Sender: TObject);
    procedure dbgPALGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgVisitasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbVisQuitarClick(Sender: TObject);
    procedure tbHistoricoClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbNoAmeritaClick(Sender: TObject);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure cmbVisTipoChange(Sender: TObject);
    procedure sdqPALAfterScroll(DataSet: TDataSet);
    procedure cbSinFirmasClick(Sender: TObject);
    procedure chkNivelFirmasClickCheck(Sender: TObject);
  private
    FModoForm : TModoABM;
    FIdVisita,
    FEstableci: Integer;
    FCUIT: String;
    FTipo: String;
    FOperativo : String;
    FAnexo : String;
    procedure Validar;
    procedure LimpiarCampos;
  public
    procedure ValidarPal;
    procedure Clear;
    procedure Load;
    procedure GuardarNivelFirma;
    function VerificarFechasCumSeg: Boolean;
    property CUIT             : String   read FCUIT             write FCUIT;
    property Estableci        : Integer  read FEstableci        write FEstableci;
    property Tipo             : String   read FTipo             write FTipo;
    property Operativo        : String   read FOperativo        write FOperativo;
  end;

Const
  TXT_AGREGAR   = '&Agregar';
  TXT_MODIFICAR = 'Modific&ar';
  MAX_RELATIONS = 10;

implementation

uses
  unPrincipal, unConsVisitasRealizadas, unSesion;

{$R *.DFM}

procedure TfrmPAL.FormCreate(Sender: TObject);
begin
  FIdVisita := 0;
  edVisFecha.MaxDate := DBDateTime;
  edVisFecha.MaxDateCombo := nil;
  with fraItem do
  begin
    TableName := 'ART.PAI_ANEXO2ITEMS';
    FieldID     := 'AI_CODIGO';
    FieldCodigo := 'AI_CODIGO';
    FieldDesc   := 'AI_DESCRIPCION';
  end;
  with GetQuery(' SELECT * ' +
                  ' FROM HYS.HFF_TIPOFIRMA ' +
                  ' WHERE FF_FECHABAJA IS NULL AND FF_TIPO LIKE ''%PAL%'' ') do
  try
    while not Eof do
    begin
      chkNivelFirmas.AddItem(FieldByName('FF_DESCRIPCION').AsString, TObject(FieldByName('FF_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;
end;

{------------------------------------------------------------------------------}

procedure TfrmPAL.Clear;
var
  i : Integer;
begin
  chkTodosOps.Checked := false;
  sdqPAL.Close;
  sdqVisitas.Close;
  for i := 0 to chkNivelFirmas.Items.Count - 1 do
    chkNivelFirmas.Checked[i] := False;
  cbSinFirmas.Checked := False;
end;

procedure TfrmPAL.Load;
var
  i : integer;
begin
  for i := 0 to chkNivelFirmas.Items.Count - 1 do
    chkNivelFirmas.Checked[i] := False;
  tbPMRefrescarClick(nil);
  with GetQueryEx('SELECT * ' +
                    '  FROM HYS.HNF_NIVELFIRMA' +
                    ' WHERE NF_USUBAJA IS NULL ' +
                    '   AND NF_CUIT = :cuit ' +
                    '   AND NF_ESTABLECI = :estableci ' +
                    '   AND NF_TIPO = :tipo '+
                    '   AND NF_OPERATIVO = :operativo '+
                    '   AND NF_TIPOFORMULARIO = ''PAL'' '+
                    ' ORDER BY 1 DESC ',
                      [FCUIT,
                       FEstableci,
                       FTipo,FOperativo]) do
  try
    while not Eof do
    begin
    for i:=0 to chkNivelFirmas.Count-1 do
      if (integer(chkNivelFirmas.Items.Objects[i]) = FieldByName('NF_IDTIPOFIRMA').AsInteger) then
      begin
        chkNivelFirmas.Checked[i] := true;
        break;
        end;
      Next;
    end;
  finally
    free;
  end;
  cbSinFirmas.Checked := ExisteSqlEx('SELECT 1 ' +
                                     '  FROM HYS.HNF_NIVELFIRMA' +
                                     ' WHERE NF_USUBAJA IS NULL ' +
                                     '   AND NF_CUIT = :cuit ' +
                                     '   AND NF_ESTABLECI = :estableci ' +
                                     '   AND NF_TIPO = :tipo '+
                                     '   AND NF_OPERATIVO = :operativo '+
                                     '   AND NF_IDTIPOFIRMA = 5 '+
                                     '   AND NF_TIPOFORMULARIO = ''PAL'' '+
                                     ' ORDER BY 1 DESC ',
                                       [FCUIT,
                                        FEstableci,
                                        FTipo,FOperativo]);
end;

procedure TfrmPAL.tbPMRefrescarClick(Sender: TObject);
begin
  with sdqPAL do
  begin
    Close;

    SQL.Clear;
    SQL.Add(' SELECT pa_id, pa_cuit, pa_estableci, pa_tipo, pa_operativo, pa_anexo, pa_itemanexo, pa_cumplimiento, pa_seguimiento, ' +
            '        pa_fechaalta, pa_usualta, pa_fechamodif, pa_usumodif, pa_fechabaja, pa_usubaja, '+
            '        DECODE (pa_noamerita, ''S'', ''No Amerita'', ai_descripcion) descitem, pa_noamerita, '+
            '        ai_anexosrt tipoanexo, pa_idvisita, pa_cargamanual,pa_fechacumplimientopost ' +
            ' FROM hys.hpa_pal, art.pai_anexo2items ' +
            ' WHERE pa_anexo = ai_anexo(+) ' +
            '   AND ai_codigo(+) = pa_itemanexo ' +
            '   AND pa_cuit = :cuit ' +
            '   AND pa_estableci = :estableci ' +
            '   AND pa_tipo = :tipo '
            );

    if not chkTodosOps.Checked then
      SQL.Add(' AND pa_operativo = ' + SqlValue(FOperativo));

    ParamByName('cuit').AsString := FCUIT;
    ParamByName('estableci').AsInteger := FEstableci;
    ParamByName('tipo').AsString := FTipo;
    Open;
  end;
  sdqPALAfterScroll(nil);
  sdqVisitas.Open;
end;

procedure TfrmPAL.tbPMNuevoClick(Sender: TObject);
var
  bexisteNFirmaPRS : Boolean;
  i : Integer;
begin
  vclExtra.LockControls([fraItem],False);
  bExisteNFirmaPRS := False;
  for i:=0 to chkNivelFirmas.Count-1 do
  begin
    if chkNivelFirmas.Checked[i] then
    begin
      bExisteNFirmaPRS := True;
      break;
    end;
  end;
  Verificar((not bexisteNFirmaPRS) and not cbSinFirmas.Checked, chkNivelFirmas, 'Debe especificar el nivel de firmas.');
  Verificar(bexisteNFirmaPRS and cbSinFirmas.Checked, cbSinFirmas, 'No puede estar marcado sin firma y firma a la vez');
  LimpiarCampos;
  FAnexo := ValorSql(
    ' SELECT DISTINCT an_anexo '+
    '   FROM pan_anexo2 '+
    '  WHERE an_cuit = '+SqlValue(FCUIT)+
    '    AND an_estableci = '+SqlValue(FEstableci)+
    '    AND an_tipo = '+SqlValue(FTipo)+
    '    AND an_operativo = '+SqlValue(FOperativo));
  Verificar(FAnexo = '', tbPMNuevo,'Debe existir anexo 2');
  fraItem.ExtraCondition := ' AND NVL(AI_SOLOLECTURA, ''N'') <> ''S'' ' +
                            ' AND AI_ANEXO = ' + SqlValue(FAnexo) +
                            ' AND AI_VIGENCIADESDE <= ' + SqlValue(FOperativo) +
                            ' AND (AI_VIGENCIAHASTA > ' + SqlValue(FOperativo) +
                            '      OR AI_VIGENCIAHASTA IS NULL) ';
  FModoForm := mfAlta;
  btnPMAceptar.Caption := TXT_AGREGAR;
  fpPAL.Caption := 'Agregar Item';
  fpPAL.ShowModal;
end;

procedure TfrmPAL.tbPMModificarClick(Sender: TObject);
begin
  if sdqPAL.IsEmpty then Exit;
  vclExtra.LockControls([fraItem],True);
  FModoForm := mfModif;
  btnPMAceptar.Caption := TXT_MODIFICAR;
  fpPAL.Caption := 'Editar Item';
  fraItem.ExtraCondition := ' AND NVL(AI_SOLOLECTURA, ''N'') <> ''S'' ' +
                            ' AND AI_ANEXO = ' + SqlValue(sdqPAL.FieldByName('pa_anexo').AsString) +
                            ' AND AI_VIGENCIADESDE <= ' + SqlValue(FOperativo) +
                            ' AND (AI_VIGENCIAHASTA > ' + SqlValue(FOperativo) +
                            '      OR AI_VIGENCIAHASTA IS NULL) ';
  fraItem.Codigo := sdqPAL.FieldByName('pa_itemanexo').AsString;
  edFechaCumplimiento.Date := sdqPAL.FieldByName('pa_cumplimiento').AsDateTime;
  edFechaSeguimiento.Date := sdqPAL.FieldByName('pa_seguimiento').AsDateTime;
  FIdVisita := sdqPAL.FieldByName('pa_idvisita').AsInteger;
  edVisita.Text:= ValorSql (
                  'SELECT TO_CHAR (rv_fecha, ''DD/MM/YYYY'') || '' '' || rv_descripcion ' +
                  '  FROM art.prv_resvisitas ' +
                  ' WHERE rv_id = ' + SqlValue (sdqPAL.FieldByName('pa_idvisita').AsInteger)
                );
  fpPAL.ShowModal;
end;

procedure TfrmPAL.tbPMEliminarClick(Sender: TObject);
begin
  if sdqPAL.Active and (not sdqPAL.IsEmpty) and (sdqPAL.FieldByName('pa_fechabaja').IsNull) then


  begin
    Verificar((sdqPAL.FieldByName('pa_cargamanual').AsString = 'N') and (sdqPAL.FieldByName('pa_noamerita').AsString = 'N'),tbPMEliminar,'Debe ser carga  manual para poder dar de baja.');
    if (MsgBox('¿ Desea dar de baja el registro seleccionado ?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
      EjecutarSqlST(
        ' UPDATE hys.hpa_pal '+
        '    SET pa_fechabaja = SYSDATE, '+
        '        pa_usubaja = '+SqlValue(Sesion.UserID)+
        '  WHERE pa_id = '+SqlValue(sdqPAL.FieldByName('pa_id').AsString));
  end;
end;

procedure TfrmPAL.tbPMOrdenarClick(Sender: TObject);
begin
  sdPAL.Execute
end;

procedure TfrmPAL.tbPMExportarClick(Sender: TObject);
begin
  Export.Execute
end;

{------------------------------------------------------------------------------}
{ fpPAL                                                                 }
{------------------------------------------------------------------------------}
                
procedure TfrmPAL.btnBuscarVisitasClick(Sender: TObject);
var
  format :TFormatSettings;
begin
  format.DateSeparator := '/';
  format.ShortDateFormat := 'dd/mm/yyyy';
  with TfrmConsVisitasRealizadas.Create(self) do
  try
    Init (FCUIT, FEstableci, '', FTipo, True);
    if ShowModal = mrOk then
    begin
      FIdVisita := FIdVisitaSeleccionada;
      edVisita.Text := DateToStr(FFechaVisitaSeleccionada,format) + ' ' + FDescripcionVisitaSeleccionada;
    end
  finally
    Free;
  end;
end;

procedure TfrmPAL.btnPMAceptarClick(Sender: TObject);
var
  i : integer;
begin
  Validar;
  if FModoForm = mfModif then
  begin
    for i := 0 to dbgPAL.SelectedRows.Count-1 do
    begin
      dbgPAL.GotoSelection(i);
      EjecutarSqlSTEx(' UPDATE HYS.HPA_PAL ' +
                      ' SET PA_CUMPLIMIENTO = ' + SqlDate(edFechaCumplimiento.Date) + ', ' +
                      '     PA_SEGUIMIENTO = ' + SqlDate(edFechaSeguimiento.Date) + ', ' +
                      '     PA_IDVISITA = ' + SqlValue(FIdVisita) + ', ' +
                      '     PA_FECHAMODIF = SYSDATE, ' +
                      '     PA_USUMODIF = :usumodif, ' +
                      '     PA_FECHABAJA = NULL, ' +
                      '     PA_USUBAJA = NULL ' +
                      ' WHERE PA_ID = :id ', [Sesion.LoginName, sdqPAL.FieldByName('pa_id').AsInteger]);
    end;
  end
  else
  if FModoForm = mfAlta then
  begin
    EjecutarSqlST(
      ' INSERT INTO hys.hpa_pal '+
      '             (pa_id, pa_cuit, pa_estableci, pa_tipo, pa_operativo, pa_anexo, pa_itemanexo, '+
      '              pa_cumplimiento, pa_seguimiento, pa_fechaalta, pa_usualta, pa_idvisita,pa_fechamodif,pa_usumodif,'+
      '              pa_cargamanual) '+
      '      VALUES (hys.seq_hpa_pal_id.NEXTVAL, '+SqlValue(CUIT)+','+SqlValue(Estableci)+','+
      SqlValue(Tipo)+','+SqlValue(Operativo)+','+SqlValue(FAnexo)+','+ SqlValue(fraItem.Codigo)+','+
      SqlValue(edFechaCumplimiento.Date)+','+ SqlValue(edFechaSeguimiento.Date)+', SYSDATE,'+
      SqlValue(Sesion.UserID)+','+SqlValue(FIdVisita)+',sysdate,'+SqlValue(Sesion.UserID)+',''S'')');
  end;
  sdqPAL.Refresh;
  if FModoForm = mfModif then
    fpPAL.ModalResult := mrOk;
end;

{------------------------------------------------------------------------------}
{ Toolbar Visitas                                                              }
{------------------------------------------------------------------------------}

procedure TfrmPAL.tbVisAgregarClick(Sender: TObject);
var
  IdUltimaVisita: integer;
begin
    if dbgPAL.SelectedRows.Count > 0 then
    begin
      if VerificarFechasCumSeg then
      begin
        IdUltimaVisita := ValorSqlInteger ('SELECT MAX (rv.rv_id) rv_id ' +
                                           '  FROM art.prv_resvisitas rv ' +
                                           ' WHERE rv.rv_cuit = ' + SqlValue (FCUIT) +
                                           '   AND rv.rv_estableci = ' + SqlValue (FEstableci) +
                                           '   AND rv.rv_operativo = ' + SqlValue (FOperativo) +
                                           '   AND rv.rv_fechabaja IS NULL ') ;

        cmbVisTipo.ItemIndex := 0;
        cmbVisTipoChange(nil);
        edVisFecha.Date      := ValorSqlDateTime (
                                  'SELECT rv_fecha ' +
                                  '  FROM art.prv_resvisitas ' +
                                  ' WHERE rv_id = ' + SqlValue (IdUltimaVisita)
                                );

        if fpVisita.ShowModal = mrOk Then
        begin
          sdqVisitas.Refresh;
          sdqPAL.Refresh;
        end;

      end else
        MessageBox(0,
            'No es posible proceder. Existe al menos un registro sin fecha de cumplimiento/seguimiento.',
            'Atención.', MB_ICONEXCLAMATION or MB_OK);

  end;
end;

procedure TfrmPAL.tbVisOrdenarClick(Sender: TObject);
begin
  sdVisitas.Execute ;
end;

{------------------------------------------------------------------------------}
{ fpVisita                                                                     }
{------------------------------------------------------------------------------}

procedure TfrmPAL.btnVisAceptarClick(Sender: TObject);
var
  Sql: String;
  i: integer;
begin
  VerificarMultiple (['Registro de Visita para el PAL',
                      cmbVisTipo,
                      cmbVisTipo.ItemIndex >= 0,
                      'Debe seleccionar el Tipo de Seguimiento',
                      edVisFecha,
                      edVisFecha.IsValid,
                      'Debe ingresar una fecha válida',
                      edVisFecha,
                      not edVisFecha.IsEmpty,
                      'Debe seleccionar la Fecha de Visita',
                      edVisFecha,
                      edVisFecha.Date <= DBDate,
                      'La Fecha de Visita debe ser menor o igual a hoy'
                     ]);

  Verificar(edFechaComprometida.Visible and (edFechaComprometida.Date = 0), edFechaComprometida, 'Debe ingresar una fecha');
  Verificar(edFechaComprometida.Visible and (edFechaComprometida.Date < edVisFecha.Date), edFechaComprometida, 'Le fecha debe ser mayor');

  FIdVisita := ValorSqlInteger('SELECT rv_id FROM art.prv_resvisitas ' +
                               ' WHERE rv_cuit = ' + SqlValue(FCUIT) +
                               '   AND rv_estableci = ' + SqlValue(FEstableci) +
                               '   AND rv_fecha = ' + SqlDate (edVisFecha.Date) +
                               '   AND rv_tipo = ' + SqlValue(FTipo) +
                               '   AND rv_operativo= ' + SqlValue (FOperativo));
 {
  if FIdVisita = 0 then
  begin
    InvalidMsg(edVisFecha, 'No existe una visita para la fecha indicada.');
    abort;
  end;
}
  try
    for i := 0 to dbgPAL.SelectedRows.Count-1 do
    begin
      dbgPAL.GotoSelection(i);

      if not ExisteSql('SELECT 1 ' +
                       '  FROM hys.hps_palseguimiento ' +
                       ' WHERE ps_fechabaja IS NULL ' +
                       '   AND ps_idpal = ' + SqlValue(sdqPAL.FieldByName('pa_id').AsInteger) +
                       '   AND ps_fechavisita = ' + edVisFecha.SqlText) then
      begin

        Sql := 'INSERT INTO hys.hps_palseguimiento ' +
               '            (ps_id, ps_idpal, ps_fechavisita, ' +
               '             ps_tiposeguimiento, ps_idvisita, ps_fechaalta, ' +
               '             ps_usualta,ps_fechacomprometida) ' +
               '     VALUES (hys.seq_hps_palseguimiento.NEXTVAL, ' +
                             SqlValue(sdqPAL.FieldByName('pa_id').AsInteger) +  ', ' +
                             edVisFecha.SqlText + ', ' +
                             SqlValue(cmbVisTipo.Value) + ', ' +
                             SqlInt(FIdVisita, True) +
                             ', SYSDATE, ' +
                             SqlValue(Sesion.LoginName) + ','+SqlValue(edFechaComprometida.Date)+')';

        EjecutarSqlST(Sql);
      end
      else begin
        Verificar(true, edFechaCumplimiento, 'Ya existe una visita con esta fecha cargada.')
      end;
    end;

    dbgPAL.UnselectAll;

    if sdqVisitas.Active then
      sdqVisitas.Refresh
    else
      sdqVisitas.Open;

    fpVisita.ModalResult := mrOk ;
  except
    on E: Exception do begin
       ErrorMsg(E, 'Error al guardar los datos');
    end;
  end;
end;

procedure TfrmPAL.cbSinFirmasClick(Sender: TObject);
var
  i : Integer;
begin
  if cbSinFirmas.Checked then
    for i := 0 to chkNivelFirmas.Items.Count - 1 do
      chkNivelFirmas.Checked[i] := False;
end;


procedure TfrmPAL.chkNivelFirmasClickCheck(Sender: TObject);
begin
  cbSinFirmas.Checked := False;
end;

procedure TfrmPAL.dbgPALGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPAL.FieldByName('pa_fechabaja').IsNull then
    AFont.Color := clRed;
  if sdqPAL.FieldByName('pa_cargamanual').AsString = 'S' then
    Background := $00C7A26E;
end;

procedure TfrmPAL.dbgVisitasGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqVisitas.FieldByName('ps_fechabaja').IsNull then
    AFont.Color := clRed
end;

procedure TfrmPAL.tbVisQuitarClick(Sender: TObject);
var
  Sql: String;
begin
  Try
    Sql := 'UPDATE hys.hps_palseguimiento ' +
           '   SET ps_usubaja = ' + SqlValue(Sesion.LoginName) + ', ' +
           '       ps_fechabaja = SYSDATE ' +
           ' WHERE ps_id = ' + SqlValue(sdqVisitas.FieldByName('ps_id').AsInteger) + 
           ' AND ps_fechabaja IS NULL ';

    EjecutarSqlST(Sql);
    sdqVisitas.Refresh ;
  Except
    on E: Exception do ErrorMsg(E);
  end;
end;

procedure TfrmPAL.Validar;
var
  fechaVisita : TDate;
begin
  if (FModoForm = mfAlta) or ((FModoForm = mfModif) and (sdqPAL.FieldByName('pa_noamerita').AsString = 'N')) then
    Verificar(fraItem.IsEmpty, fraItem, 'Debe especificar un item.');

  Verificar(edFechaCumplimiento.Date = 0, edFechaCumplimiento, 'Debe especificar una fecha de cumplimiento.');
  Verificar(edFechaSeguimiento.Date = 0, edFechaSeguimiento, 'Debe especificar una fecha de seguimiento.');
  Verificar(trim(edVisita.Text) = '', edVisita, 'Debe especificar una visita.');
  if FModoForm = mfAlta then
    Verificar(ExisteSql(
      ' SELECT 1 '+
      '   FROM hys.hpa_pal '+
      '  WHERE pa_cuit = '+SqlValue(CUIT)+
      '    AND pa_estableci = '+SqlValue(Estableci)+
      '    AND pa_tipo = '+SqlValue(Tipo)+
      '    AND pa_operativo = '+SqlValue(Operativo)+
      '    AND pa_itemanexo = '+SqlValue(fraItem.Codigo)),fraItem, 'El Item ya fue dado de alta.');
  fechaVisita := ValorSqlDateTime('SELECT RV_FECHA FROM art.prv_resvisitas WHERE rv_id = '+SqlValue(FIdVisita));
  Verificar(fechaVisita > edFechaCumplimiento.Date, edVisita, 'La fecha de visita no debe ser mayor a la fecha de cumplimiento.');
  Verificar(fechaVisita > edFechaSeguimiento.Date, edVisita, 'La fecha de visita no debe ser mayor a la fecha de Seguimiento.');
end;

procedure TfrmPAL.ValidarPal;
begin
  if ExisteSql(
    ' SELECT DISTINCT 1 '+
    '   FROM hys.hpa_pal '+
    '  WHERE pa_cuit = '+SqlValue(FCUIT)+
    '    AND pa_estableci = '+SqlValue(FEstableci)+
    '    AND pa_tipo = '+SqlValue(FTipo)+
    '    AND pa_operativo = '+SqlValue(FOperativo)+
    '    AND pa_fechabaja IS NULL '+
    '    AND (   pa_cumplimiento IS NOT NULL '+
    '         OR pa_seguimiento IS NOT NULL) ') then
    Verificar( ExisteSql(
      ' SELECT distinct 1 FROM hys.hpa_pal WHERE pa_cuit = '+SqlValue(FCUIT)+
      ' AND pa_estableci = '+SqlValue(FEstableci)+' AND pa_tipo = '+SqlValue(FTipo)+
      ' AND pa_operativo = '+SqlValue(FOperativo)+' AND pa_fechabaja IS NULL '+
      ' AND ( pa_cumplimiento IS NULL OR pa_seguimiento IS NULL)'),Self,'Debe estar completo el PAL.');

end;

procedure TfrmPAL.tbHistoricoClick(Sender: TObject);
begin
  if sdqPAL.IsEmpty then Exit;
  sdqHistorico.Close;
  sdqHistorico.ParamByName('pa_id').AsInteger := sdqPAL.FieldByName('pa_id').AsInteger;
  sdqHistorico.Open;
  fpHistorico.ShowModal;
end;

procedure TfrmPAL.tbSalirClick(Sender: TObject);
begin
  fpHistorico.ModalResult := mrOk;
end;

procedure TfrmPAL.tbNoAmeritaClick(Sender: TObject);
var
  idVisita, idPal : Integer;
  fechaVisita : TDate;
begin
  Verificar(not ExisteSql(
      ' SELECT 1 '+
      '   FROM art.prv_resvisitas, hys.hvm_visitamotivo '+
      '  WHERE rv_tipo = '+SqlValue(FTipo)+
      '    AND rv_cuit = '+ sqlvalue(FCUIT)+
      '    AND rv_estableci = '+SqlValue(FEstableci)+
      '    AND rv_operativo = '+SqlValue(FOperativo)+
      '    AND vm_idvisita = rv_id '+
      '    AND rv_fechabaja IS NULL '+
      '    AND vm_idmotivo = 88 '),tbNoAmerita,'No Existe Visita con Motivo Pal.');
  Verificar(not ExisteSql(
      ' SELECT DISTINCT 1 '+
      '   FROM pan_anexo2 '+
      '  WHERE an_cuit = '+SqlValue(FCUIT)+
      '    AND an_estableci = '+SqlValue(FEstableci)+
      '    AND an_tipo = '+SqlValue(FTipo)+
      '    AND an_operativo = '+SqlValue(FOperativo)),
      tbNoAmerita,'No existe Anexo 2 cargado');
  Verificar(ExisteSql(
      ' SELECT DISTINCT 1 '+
      '   FROM hys.hpa_pal '+
      '  WHERE pa_operativo = '+SqlValue(FOperativo)+
      '    AND pa_cuit = '+SqlValue(FCUIT)+
      '    AND pa_estableci = '+SqlValue(FEstableci)+
      '    AND pa_tipo = '+SqlValue(FTipo)+
      '    AND pa_fechabaja IS NULL '),tbNoAmerita,'Existe Pal cargado.');
  with GetQuery(
      ' SELECT prv1.rv_id, prv1.rv_fecha '+
      '   FROM art.prv_resvisitas prv1, hys.hvm_visitamotivo hvm1'+
      '  WHERE prv1.rv_tipo = '+SqlValue(FTipo)+
      '    AND prv1.rv_cuit = '+SqlValue(FCUIT)+
      '    AND prv1.rv_estableci = '+SqlValue(FEstableci)+
      '    AND prv1.rv_operativo = '+SqlValue(FOperativo)+
      '    AND hvm1.vm_idvisita = prv1.rv_id '+
      '    AND prv1.rv_fechabaja IS NULL '+
      '    AND hvm1.vm_idmotivo = 88 '+
      '    AND prv1.rv_fecha = '+
      '          (SELECT MAX (prv2.rv_fecha) '+
      '             FROM art.prv_resvisitas prv2, hys.hvm_visitamotivo hvm2 '+
      '            WHERE prv2.rv_tipo = prv1.rv_tipo '+
      '              AND prv2.rv_cuit = prv1.rv_cuit '+
      '              AND prv2.rv_estableci = prv1.rv_estableci '+
      '              AND prv2.rv_operativo = prv1.rv_operativo '+
      '              AND hvm2.vm_idvisita = prv2.rv_id '+
      '              AND prv2.rv_fechabaja IS NULL '+
      '              AND hvm2.vm_idmotivo = 88)') do
  try
    idVisita := FieldByName('rv_id').AsInteger;
    fechaVisita := FieldByName('rv_fecha').AsDateTime;
  finally
    Free;
  end;
  FAnexo := ValorSql(
    ' SELECT DISTINCT an_anexo '+
    '   FROM pan_anexo2 '+
    '  WHERE an_cuit = '+SqlValue(FCUIT)+
    '    AND an_estableci = '+SqlValue(FEstableci)+
    '    AND an_tipo = '+SqlValue(FTipo)+
    '    AND an_operativo = '+SqlValue(FOperativo));
  idPal :=  GetSecNextVal('HYS.SEQ_HPA_PAL_ID');
  EjecutarSqlSTEx(' INSERT INTO HYS.HPA_PAL(PA_ID, PA_CUIT, PA_ESTABLECI, PA_TIPO, PA_OPERATIVO, ' +
                  '                         PA_ANEXO, PA_ITEMANEXO, PA_CUMPLIMIENTO, PA_SEGUIMIENTO, ' +
                  '                         PA_FECHAALTA, PA_USUALTA, pa_noamerita,PA_IDVISITA, '+
                  '                         pa_fechamodif, pa_usumodif) ' +
                  ' VALUES ('+SqlValue(idPal)+', :cuit, :estab, :tipo, :operativo, ' +
                  '         :anexo, NULL, '+SqlDate(fechaVisita)+', '+SqlDate(fechaVisita)+' , ' +
                  '         sysdate, :usualta, ''S'', :idvisita,sysdate, :usumodif) ',
                  [FCUIT, FEstableci, FTipo, FOperativo, FAnexo, Sesion.LoginName, idVisita, Sesion.LoginName]);
  sdqPAL.Refresh;
  EjecutarSqlST('INSERT INTO hys.hps_palseguimiento ' +
                  '            (ps_id, ps_idpal, ps_fechavisita, ' +
                  '             ps_tiposeguimiento, ps_idvisita, ps_fechaalta, ' +
                  '             ps_usualta) ' +
                  '     VALUES (hys.seq_hps_palseguimiento.NEXTVAL, ' +
                               SqlValue(idPal) +', '+
                               SqlDate(fechaVisita) + ', ''C'', ' +
                               SqlValue(idVisita) +
                               ', SYSDATE, ' +
                               SqlValue(Sesion.LoginName) + ')');
  sdqVisitas.Refresh;


end;

procedure TfrmPAL.tbSeleccionarTodoClick(Sender: TObject);
begin
  dbgPAL.SelectAll;
end;

procedure TfrmPAL.cmbVisTipoChange(Sender: TObject);
begin
  if cmbVisTipo.Value = 'I' then
  begin
    lbFechaComprometida.Visible := True;
    edFechaComprometida.Visible := True;
  end
  else
  begin
    lbFechaComprometida.Visible := false;
    edFechaComprometida.Visible := false;
    edFechaComprometida.Clear;
  end;
end;

procedure TfrmPAL.LimpiarCampos;
begin
  fraItem.Clear;
  edFechaCumplimiento.Clear;
  edFechaSeguimiento.Clear;
  edVisita.Clear;
  FIdVisita := 0;
end;

function TfrmPAL.VerificarFechasCumSeg: Boolean;
var
  i: integer;
  bmk: TBookmark;
begin
  Result := True;
  sdqPAL.DisableControls;
  bmk := sdqPAL.GetBookmark;

  try
    for i := 0 to dbgPAL.SelectedRows.Count -1 do
    begin
      sdqPAL.GotoBookmark(pointer(dbgPAL.SelectedRows.Items[i]));
      if (sdqPAL.FieldByName('pa_cumplimiento').IsNull) or
         (sdqPAL.FieldByName('pa_seguimiento').IsNull) then
      begin
        Result := False;
        Break;
      end;
    end;
  finally
    sdqPAL.GotoBookmark(bmk);
    sdqPAL.EnableControls;
  end;
end;

procedure TfrmPAL.sdqPALAfterScroll(DataSet: TDataSet);
begin
  sdqVisitas.Close;
  sdqVisitas.ParamByName('pa_id').AsInteger := sdqPAL.FieldByName('pa_id').AsInteger;
  sdqVisitas.Open;
end;

procedure TfrmPAL.GuardarNivelFirma;
var
  i : Integer;
begin
  for i:=0 to chkNivelFirmas.Count-1 do
  begin
    if chkNivelFirmas.Checked[i] then
    begin
      if ExisteSql('SELECT 1 FROM HYS.HNF_NIVELFIRMA '+
                   ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                    '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                    '  AND NF_TIPO = '+SqlValue(FTipo)+
                    '  AND NF_IDTIPOFIRMA = '+ SqlValue(Integer(chkNivelFirmas.Items.Objects[i]))+
                    '  AND NF_TIPOFORMULARIO = ''PAL'' '+
                    '  AND NF_OPERATIVO = '+SqlValue(FOperativo)) then
      begin
        if ExisteSql('SELECT 1 FROM HYS.HNF_NIVELFIRMA '+
                   ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                    '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                    '  AND NF_TIPO = '+SqlValue(FTipo)+
                    '  AND NF_OPERATIVO = '+SqlValue(FOperativo)+
                    '  AND NF_IDTIPOFIRMA = '+ SqlValue(Integer(chkNivelFirmas.Items.Objects[i]))+
                    '  AND NF_TIPOFORMULARIO = ''PAL'' '+
                    '  AND NF_FECHABAJA IS NOT NULL ') then
        begin
          EjecutarSqlST('UPDATE HYS.HNF_NIVELFIRMA '+
                        '   SET NF_FECHABAJA = NULL, NF_USUBAJA = NULL, '+
                        '       NF_FECHAMODIF = SYSDATE, NF_USUMODIF = '+SqlValue(Sesion.LoginName)+
                        ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                        '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                        '  AND NF_TIPO = '+SqlValue(FTipo)+
                        '  AND NF_IDTIPOFIRMA = '+ SqlValue(Integer(chkNivelFirmas.Items.Objects[i]))+
                        '  AND NF_TIPOFORMULARIO = ''PAL'' '+
                        '  AND NF_OPERATIVO = '+SqlValue(FOperativo));
        end;
      end
      else
      begin
        EjecutarSqlST(
                    ' INSERT INTO hys.HNF_NIVELFIRMA '+
                    '             (NF_ID, NF_CUIT, NF_ESTABLECI, NF_TIPO, NF_OPERATIVO,'+
                    '              NF_TIPOFORMULARIO, NF_IDTIPOFIRMA, '+
                    '              NF_FECHAALTA, NF_USUALTA '+
                    '             )'+
                    '      VALUES (hys.SEQ_HNF_ID.NEXTVAL,'+SqlValue(FCUIT)+', '+
                                   SqlValue(FEstableci)+', '+SqlValue(FTipo)+', '+
                                   SqlValue(FOperativo)+',''PAL'' ,'+
                                   SqlValue(Integer(chkNivelFirmas.Items.Objects[i]))+
                                   ',sysdate,'+SqlValue(Sesion.UserID)+')');
      end;
    end
    else
    begin
      if ExisteSql('SELECT 1 FROM HYS.HNF_NIVELFIRMA '+
                   ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                    '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                    '  AND NF_TIPO = '+SqlValue(FTipo)+
                    '  AND NF_OPERATIVO = '+SqlValue(FOperativo)+
                    '  AND NF_IDTIPOFIRMA = '+ SqlValue(Integer(chkNivelFirmas.Items.Objects[i]))+
                    '  AND NF_TIPOFORMULARIO = ''PAL'' '+
                    '  AND NF_FECHABAJA IS NULL ') then
        begin
          EjecutarSqlST('UPDATE HYS.HNF_NIVELFIRMA '+
                        '   SET NF_FECHABAJA = SYSDATE, NF_USUBAJA = '+SqlValue(Sesion.LoginName)+
                        ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                        '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                        '  AND NF_TIPO = '+SqlValue(FTipo)+
                        '  AND NF_IDTIPOFIRMA = '+ SqlValue(Integer(chkNivelFirmas .Items.Objects[i]))+
                        '  AND NF_TIPOFORMULARIO = ''PAL'' '+
                        '  AND NF_OPERATIVO = '+SqlValue(FOperativo));
        end;
    end;
  end;
  //Sin Firma
  if cbSinFirmas.Checked then
  begin
    if ExisteSql('SELECT 1 FROM HYS.HNF_NIVELFIRMA '+
                 ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                 '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                 '  AND NF_TIPO = '+SqlValue(FTipo)+
                 '  AND NF_IDTIPOFIRMA = 5'+
                 '  AND NF_TIPOFORMULARIO = ''PAL'' '+
                 '  AND NF_OPERATIVO = '+SqlValue(FOperativo)) then
    begin
      if ExisteSql('SELECT 1 FROM HYS.HNF_NIVELFIRMA '+
                 ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                  '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                  '  AND NF_TIPO = '+SqlValue(FTipo)+
                  '  AND NF_OPERATIVO = '+SqlValue(FOperativo)+
                  '  AND NF_IDTIPOFIRMA = 5'+
                  '  AND NF_TIPOFORMULARIO = ''PAL'' '+
                  '  AND NF_FECHABAJA IS NOT NULL ') then
      begin
        EjecutarSqlST('UPDATE HYS.HNF_NIVELFIRMA '+
                      '   SET NF_FECHABAJA = NULL, NF_USUBAJA = NULL, '+
                      '       NF_FECHAMODIF = SYSDATE, NF_USUMODIF = '+SqlValue(Sesion.LoginName)+
                      ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                      '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                      '  AND NF_TIPO = '+SqlValue(FTipo)+
                      '  AND NF_IDTIPOFIRMA = 5'+
                      '  AND NF_TIPOFORMULARIO = ''PAL'' '+
                      '  AND NF_OPERATIVO = '+SqlValue(FOperativo));
      end;
    end
    else
    begin
      EjecutarSqlST(
                  ' INSERT INTO hys.HNF_NIVELFIRMA '+
                  '             (NF_ID, NF_CUIT, NF_ESTABLECI, NF_TIPO, NF_OPERATIVO,'+
                  '              NF_TIPOFORMULARIO, NF_IDTIPOFIRMA, '+
                  '              NF_FECHAALTA, NF_USUALTA '+
                  '             )'+
                  '      VALUES (hys.SEQ_HNF_ID.NEXTVAL,'+SqlValue(FCUIT)+', '+
                                 SqlValue(FEstableci)+', '+SqlValue(FTipo)+', '+
                                 SqlValue(FOperativo)+',''PAL'' ,5 ,sysdate,'+
                                 SqlValue(Sesion.UserID)+')');
    end;
  end
  else
  begin
    if ExisteSql('SELECT 1 FROM HYS.HNF_NIVELFIRMA '+
                 ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                  '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                  '  AND NF_TIPO = '+SqlValue(FTipo)+
                  '  AND NF_OPERATIVO = '+SqlValue(FOperativo)+
                  '  AND NF_IDTIPOFIRMA = 5'+
                  '  AND NF_TIPOFORMULARIO = ''PAL'' '+
                  '  AND NF_FECHABAJA IS NULL ') then
      begin
        EjecutarSqlST('UPDATE HYS.HNF_NIVELFIRMA '+
                      '   SET NF_FECHABAJA = SYSDATE, NF_USUBAJA = '+SqlValue(Sesion.LoginName)+
                      ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                      '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                      '  AND NF_TIPO = '+SqlValue(FTipo)+
                      '  AND NF_IDTIPOFIRMA = 5'+
                      '  AND NF_TIPOFORMULARIO = ''PAL'' '+
                      '  AND NF_OPERATIVO = '+SqlValue(FOperativo));
      end;
  end;
end;

end.



