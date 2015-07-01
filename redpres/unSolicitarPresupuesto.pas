unit unSolicitarPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, unfraEstablecimiento, StdCtrls, unfraUsuarios, Mask,
  ToolEdit, DateComboBox, unfraPrestador, unFraCodigoDescripcion,
  unFraUsuario, JvExExtCtrls, JvNetscapeSplitter, Menus, FormPanel, ImgList,
  XPMenu, ActnList, JvgGroupBox, CheckLst, ARTCheckListBox, unFraCodDesc,
  PatternEdit, IntEdit, CurrEdit, AdvCardList, DBAdvCardList, AdvGroupBox,
  AdvOfficeButtons, RxRichEd;

type
  TfrmSolicitarPresupuesto = class(TfrmCustomConsulta)
    sdqConsultaSP_ID: TFloatField;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaES_NOMBRE: TStringField;
    sdqConsultaES_CPOSTAL: TStringField;
    sdqConsultaSP_FECHASOLICITUD: TDateTimeField;
    sdqConsultaSE_NOMBRE: TStringField;
    sdqConsultaSE_MAIL: TStringField;
    ShortCutControlHijo: TShortCutControl;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    sdqEstudios: TSDQuery;
    dsEstudios: TDataSource;
    sdqConsultaES_ID: TFloatField;
    sdqEstudiosESTUDIO: TStringField;
    sdqEstudiosCANTIDAD: TFloatField;
    sdqConsultaCHECKBOX: TFloatField;
    pmuGrilla: TPopupMenu;
    mnuSeleccionarTodos: TMenuItem;
    mnuNoSeleccionarNinguno: TMenuItem;
    fpPrestador: TFormPanel;
    fraPrestadorSolicitud: TfraPrestador;
    btnCancelar: TButton;
    btnSolicitar: TButton;
    Bevel1: TBevel;
    pnlRight: TPanel;
    GridPrestadores: TArtDBGrid;
    sdqPrestadores: TSDQuery;
    dsPrestadores: TDataSource;
    sdqPrestadoresCA_DESCRIPCION: TStringField;
    sdqPrestadoresSD_FECHA_CORREO: TDateTimeField;
    sdqPrestadoresSD_FECHA_IMPRESION: TDateTimeField;
    sdqPrestadoresSD_FECHA_FAX: TDateTimeField;
    SeparadorVertical: TJvNetscapeSplitter;
    sdqConsultaES_NROESTABLECI: TFloatField;
    sdqConsultaCO_CONTRATO: TFloatField;
    sdqConsultaES_LOCALIDAD: TStringField;
    sdqPrestadoresSD_NROSOLICITUD: TFloatField;
    pmuReimpresionPresupuesto: TPopupMenu;
    mnuReimprimirPresupuesto: TMenuItem;
    sdqPrestadoresSD_IDPRESTADOR: TFloatField;
    mnuMarcarComoRecibido: TMenuItem;
    imgPopUp: TImageList;
    XPMenu: TXPMenu;
    tbPrestadores: TToolBar;
    tbMarcarComoRecibido: TToolButton;
    tbReimprimirPresupuesto: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    alPrestadores: TActionList;
    acMarcarComoRecibido: TAction;
    acReimprimirPresupuesto: TAction;
    gbFiltroEstudios: TJvgGroupBox;
    GridEstudios: TArtDBGrid;
    pnlEstudios: TPanel;
    gbFiltros: TJvgGroupBox;
    sdqPrestadoresSD_FECHA_RECEPCION: TDateTimeField;
    sdqPrestadoresSD_USURECEPCION: TStringField;
    sdqPrestadoresRECIBIDO: TStringField;
    sdqConsultaPV_DESCRIPCION: TStringField;
    sbInfo: TStatusBar;
    gbPrestador: TJvgGroupBox;
    Panel2: TPanel;
    fraCA_IDENTIFICADOR: TfraPrestador;
    chkPendientes: TCheckBox;
    chkAntiguos: TCheckBox;
    chkSinEnviar: TCheckBox;
    gbEmpresa: TJvgGroupBox;
    pnlSubFiltros: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fraSP_CONTRATO: TfraEmpresa;
    fraES_NROESTABLECI: TfraEstablecimiento;
    edSP_FECHASOLICITUDDesde: TDateComboBox;
    edSP_FECHASOLICITUDHasta: TDateComboBox;
    fraSP_USUARIO: TfraUsuarios;
    gbLocalidades: TJvgGroupBox;
    fraES_PROVINCIA: TfraCodDesc;
    cblLocalidades: TARTCheckListBox;
    pnlSoloGBA: TPanel;
    chkSoloGBA: TCheckBox;
    pmuLocalidades: TPopupMenu;
    mnuSeleccionarTodas: TMenuItem;
    mnuNoSeleccionarNinguna: TMenuItem;
    sdqEstudiosTIPO: TStringField;
    Label4: TLabel;
    chkSinPresupuesto: TCheckBox;
    fpMotivoBaja: TFormPanel;
    edMotivoBaja: TMemo;
    Bevel7: TBevel;
    btnAceptarBaja: TButton;
    btnCancelarBaja: TButton;
    sdqConsultasp_fechabaja: TDateTimeField;
    sdqConsultasp_motivobaja: TStringField;
    Label5: TLabel;
    edSP_ID: TIntEdit;
    sdqConsultaES_FECHABAJA: TDateTimeField;
    sdqConsultaMOTIVO_BAJA: TStringField;
    sdqConsultaESTADO: TStringField;
    sdqConsultaCO_ESTADO: TStringField;
    sdqConsultaCO_FECHABAJA: TDateTimeField;
    sdqPrestadoresCA_IDENTIFICADOR: TFloatField;
    sdqConsultaSIN_ESTUDIO: TFloatField;
    sdqConsultaEMPRESA_VIP: TStringField;
    fpRecepcionPresupuesto: TFormPanel;
    bvl1: TBevel;
    lblMonto: TLabel;
    lblPrestador: TLabel;
    btnAceptarRecepcionPresupuesto: TButton;
    btnCancelarRecepcionPresupuesto: TButton;
    edMontoRecepcionPresupuesto: TCurrencyEdit;
    fraPrestadorRecepcionPresupuesto: TfraPrestador;
    sdqPrestadoresSD_MONTOPRESUPUESTADO: TFloatField;
    DBAdvCardListPrestadores: TDBAdvCardList;
    pnlTotalPresupuestados: TPanel;
    edPresupuestados: TEdit;
    rgTipo: TAdvOfficeRadioGroup;
    tbNotificarAMP: TToolButton;
    tbSeparador2: TToolButton;
    rgAceptaPresupuestar: TRadioGroup;
    sdqConsultaSP_OBSERVACION: TStringField;
    chkMenosDe3Presupuestos: TCheckBox;
    RichEditAux: TRxRichEdit;
    rgBajas: TRadioGroup;
    chkSolicSinPresPost: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure fraSP_IDESTABLECIMIENTOcmbDescripcionDropDown(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure sdqEstudiosAfterOpen(DataSet: TDataSet);
    procedure tbEnviarMailClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridCellClick(Column: TColumn);
    procedure mnuSeleccionarTodosClick(Sender: TObject);
    procedure mnuNoSeleccionarNingunoClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSolicitarClick(Sender: TObject);
    procedure fpPrestadorBeforeShow(Sender: TObject);
    procedure sdqPrestadoresAfterOpen(DataSet: TDataSet);
    procedure acMarcarComoRecibidoExecute(Sender: TObject);
    procedure acReimprimirPresupuestoExecute(Sender: TObject);
    procedure gbFiltroEstudiosExpanded(Sender: TObject);
    procedure gbFiltroEstudiosCollapsed(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
    procedure chkPendientesClick(Sender: TObject);
    procedure fraES_PROVINCIAChange(Sender: TObject);
    procedure chkSoloGBAClick(Sender: TObject);
    procedure sdqConsultaBeforeOpen(DataSet: TDataSet);
    procedure mnuSeleccionarTodasClick(Sender: TObject);
    procedure mnuNoSeleccionarNingunaClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnAceptarBajaClick(Sender: TObject);
    procedure btnAceptarRecepcionPresupuestoClick(Sender: TObject);
    procedure edPresupuestadosChange(Sender: TObject);
    procedure fpRecepcionPresupuestoShow(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure rgTipoClick(Sender: TObject);
    procedure sdqPrestadoresAfterClose(DataSet: TDataSet);
    procedure tbNotificarAMPClick(Sender: TObject);
  private
    FSQL, FSQL_Localidades: String;
    tslCheckeados: TStringList;
    procedure OnEmpresaChange(Sender: TObject);
    procedure ContarSeleccionadas;
    procedure VisualizarPresupuesto(IDPrestador: Integer);
  public
    procedure RefreshData; override;
    procedure ClearData; override;
  end;

var
  frmSolicitarPresupuesto: TfrmSolicitarPresupuesto;

implementation

uses
  unFiltros, CustomDlgs, unDmPrincipal, unGrids, VCLExtra, General, Math,
  unVisualizador, unRptSolicitudPresupuestoAMP, ArchFuncs, AnsiSql, unART,
  SqlFuncs, unSesion, unEnvioMail, Strfuncs, unMoldeEnvioMail;

{$R *.dfm}

procedure TfrmSolicitarPresupuesto.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL := sdqConsulta.SQL.Text;
  FSQL_Localidades := cblLocalidades.SQL;
  fraSP_CONTRATO.OnChange := OnEmpresaChange;
  tslCheckeados := TStringList.Create;
  edSP_FECHASOLICITUDDesde.Date := DBDate - 30;
  pnlEstudios.Caption := '';
  chkPendientesClick(nil);
  rgTipoClick(nil);
  VCLExtra.LockControls([fraPrestadorRecepcionPresupuesto], True);
end;

procedure TfrmSolicitarPresupuesto.RefreshData;
var
  sWhere: String;
begin
  if fraCA_IDENTIFICADOR.IsSelected then
    sWhere := ' AND EXISTS (SELECT 1 ' +
                             'FROM COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
                            'WHERE SD_IDSOLICITUDPRESUPUESTO = SP_ID ' +
                              'AND SD_IDPRESTADOR = ' + SQLInteger(fraCA_IDENTIFICADOR.IdPrestador) + ') ';

  if chkPendientes.Checked then
  begin
    sWhere := sWhere + ' AND EXISTS (SELECT 1 ' +
                                      'FROM COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
                                     'WHERE SD_IDSOLICITUDPRESUPUESTO = SP_ID ' +
                                       'AND SD_FECHA_RECEPCION IS NULL) ' +
                       ' AND NOT EXISTS (SELECT 1 ' +
                                          'FROM COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO, COMUNES.CPP_PRESUPUESTOPRESTADOR ' +
                                         'WHERE PP_FECHAALTA > SP_FECHASOLICITUD ' +
                                           'AND SD_IDSOLICITUDPRESUPUESTO = SP_ID ' +
                                           'AND PP_IDESTABLECIMIENTO = SP_IDESTABLECIMIENTO ' +
                                           'AND PP_IDPRESTADOR = SD_IDPRESTADOR)';

    if chkAntiguos.Checked then
      sWhere := sWhere + ' AND NOT EXISTS (SELECT 1 ' +
                                            'FROM COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
                                           'WHERE SP_FECHASOLICITUD < ART.ACTUALDATE - 14 ' +
                                             'AND SD_IDSOLICITUDPRESUPUESTO = SP_ID ' +
                                             'AND SD_FECHA_RECEPCION IS NULL)';
  end;

  if chkSinEnviar.Checked then
    sWhere := sWhere + ' AND NOT EXISTS (SELECT 1 ' +
                                          'FROM COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
                                         'WHERE SD_IDSOLICITUDPRESUPUESTO = SP_ID)';

  if chkSinPresupuesto.Checked then
    sWhere := sWhere + ' AND NOT EXISTS (SELECT 1 ' +
                                          'FROM COMUNES.CPP_PRESUPUESTOPRESTADOR ' +
                                         'WHERE PP_IDESTABLECIMIENTO = SP_IDESTABLECIMIENTO ' +
                                           'AND PP_IDSOLICITUD = SP_ID)';

  if chkSolicSinPresPost.Checked then
    sWhere := sWhere + ' AND NOT EXISTS (SELECT 1 ' +
                                          'FROM COMUNES.CPP_PRESUPUESTOPRESTADOR ' +
                                         'WHERE PP_IDESTABLECIMIENTO = SP_IDESTABLECIMIENTO ' +
                                          ' AND SP_FECHASOLICITUD <= PP_FECHAALTA)';

  if chkMenosDe3Presupuestos.Checked then
    sWhere := sWhere + ' AND 3 > (SELECT COUNT(*) ' +
                                   'FROM COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
                                  'WHERE SD_IDSOLICITUDPRESUPUESTO = SP_ID)';

  {if chkVerBajas.Checked then
    sWhere := sWhere + ' AND SP_FECHABAJA IS NOT NULL '
  else
    sWhere := sWhere + ' AND SP_FECHABAJA IS NULL '; }

  case rgBajas.ItemIndex of
    0: sWhere := sWhere + ' AND SP_FECHABAJA IS NOT NULL ';
    1: sWhere := sWhere + ' AND SP_FECHABAJA IS NULL ';
  end;

  if cblLocalidades.CheckCount > 0 then
    sWhere := sWhere + cblLocalidades.InSQL_StringValues('ES_LOCALIDAD');

  tslCheckeados.Clear;
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlSubFiltros) + DoFiltroComponente(fraES_PROVINCIA, 'ES_PROVINCIA', '=') +
                          sWhere + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmSolicitarPresupuesto.OnEmpresaChange(Sender: TObject);
begin
  fraES_NROESTABLECI.Contrato := fraSP_CONTRATO.Contrato;
end;

procedure TfrmSolicitarPresupuesto.ClearData;
begin
  inherited;
  edSP_ID.Clear;
  tslCheckeados.Clear;
  fraSP_CONTRATO.Clear;
  fraES_NROESTABLECI.Clear;
  fraSP_USUARIO.Clear;
  edSP_FECHASOLICITUDDesde.Date := DBDate - 30;
  edSP_FECHASOLICITUDHasta.Clear;
  fraCA_IDENTIFICADOR.Clear;
  chkPendientes.Checked := False;
  chkSinEnviar.Checked := False;
  sdqEstudios.Close;
  sdqPrestadores.Close;
  fraES_PROVINCIA.Clear;
  cblLocalidades.ClearChecks;
  rgBajas.ItemIndex := 2;
  chkMenosDe3Presupuestos.Checked := False;
end;

procedure TfrmSolicitarPresupuesto.fraSP_IDESTABLECIMIENTOcmbDescripcionDropDown(Sender: TObject);
begin
  Verificar(fraES_NROESTABLECI.Contrato = 0, fraSP_CONTRATO.edContrato, 'Debe seleccionar una empresa para ver los establecimientos.');
  fraES_NROESTABLECI.cmbDescripcionDropDown(Sender);
end;

procedure TfrmSolicitarPresupuesto.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not gbFiltroEstudios.Collapsed then
    OpenQueryEx(sdqEstudios, [sdqConsulta.FieldByName('ES_ID').AsInteger,
                              sdqConsulta.FieldByName('SP_ID').AsInteger,
                              sdqConsulta.FieldByName('SP_ID').AsInteger,
                              sdqConsulta.FieldByName('ES_ID').AsInteger])
  else
    sdqEstudios.Close;

  OpenQueryEx(sdqPrestadores, [sdqConsulta.FieldByName('SP_ID').AsInteger]);
end;

procedure TfrmSolicitarPresupuesto.sdqEstudiosAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(GridEstudios);
//  pnlRight.Width := GetColumnWidths(GridEstudios, True) + 4;
  pnlEstudios.Caption := 'Estudios: ' + FloatToStr(ObtenerSuma(GridEstudios, 'CANTIDAD'));
end;

procedure TfrmSolicitarPresupuesto.tbEnviarMailClick(Sender: TObject);
begin
  Verificar(rgBajas.ItemIndex = 0, tbEnviarMail, 'Esta opción no está disponible con la visualización de bajas.');
  Verificar(tslCheckeados.Count = 0, tbEnviarMail, 'No indicó ningún presupuesto para solicitar, utilice la tilde de cada renglón de la grilla.');

  if fpPrestador.ShowModal = mrOk then
    VisualizarPresupuesto(fraPrestadorSolicitud.IDPrestador)
  else
    InfoHint(Grid, 'No se realizó la solicitud.');
end;

procedure TfrmSolicitarPresupuesto.VisualizarPresupuesto(IDPrestador: Integer);
var
  AMetodo: TDataSetNotifyEvent;
  APointer: TBookMark;
  Resultado: TResultados;
  sSQL, sFirmaUsuario{, sUsuarioActivo}: String;
  bExiste: Boolean;
  iNroSolicitud: Integer;
begin
  fraPrestadorSolicitud.Cargar(IDPrestador);

  if (IDPrestador > 0) or (fpPrestador.ShowModal = mrOk) then
  begin
    AMetodo := sdqConsulta.AfterScroll;
    sdqConsulta.AfterScroll := nil;
    APointer := sdqConsulta.GetBookmark;

    iNroSolicitud := ValorSQLInteger('SELECT MAX(SD_NROSOLICITUD) FROM COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ') + 1;

    with sdqConsulta do
    try
      DisableControls;
      First;
      while not Eof do
      begin
        if tslCheckeados.IndexOf(sdqConsulta.FieldByName('SP_ID').AsString) > -1 then
        begin
          AMetodo(sdqConsulta);

          bExiste := ExisteSQLEx('SELECT 1 ' +
                                  ' FROM COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
                                 ' WHERE SD_IDSOLICITUDPRESUPUESTO = :ID ' +
                                   ' AND SD_IDPRESTADOR = :PRESTADOR', [sdqConsulta.FieldByName('SP_ID').AsInteger,
                                                                        fraPrestadorSolicitud.IDPrestador]);

          if (not bExiste) then
          begin
            sSql := 'INSERT INTO COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
                    '(SD_IDSOLICITUDPRESUPUESTO, SD_IDPRESTADOR, SD_FECHAALTA, SD_NROSOLICITUD) ' +
                    'VALUES ' +
                    '(:IDSOLICITUDPRESUPUESTO, :IDPRESTADOR, SYSDATE, :NROSOLICITUD) ';
            EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('SP_ID').AsInteger,
                                 fraPrestadorSolicitud.IDPrestador,
                                 iNroSolicitud]);
          end else
            iNroSolicitud := ValorSQLIntegerEx('SELECT DISTINCT SD_NROSOLICITUD ' +
                                                 'FROM COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
                                                'WHERE SD_IDPRESTADOR = :IDPRESTADOR ' +
                                                  'AND SD_IDSOLICITUDPRESUPUESTO = :ID',
                                               [fraPrestadorSolicitud.IDPrestador,
                                                sdqConsulta.FieldByName('SP_ID').AsInteger]);
        end;

        Next;
      end;
    finally
      sdqConsulta.AfterScroll := AMetodo;
      GotoBookmark(APointer);
      sdqPrestadores.Locate('SD_IDPRESTADOR', IDPrestador, []);
      EnableControls;
    end;
    qrSolicitudPresupuestoAMP := TqrSolicitudPresupuestoAMP.Create(Application.MainForm);
    try
      if qrSolicitudPresupuestoAMP.Preparar(fraPrestadorSolicitud.IDPrestador, iNroSolicitud) then
      begin
        //sUsuarioActivo := Sesion.UserID;
        //Sesion.CambiarUsuario('ADMCONTR');
        sSQL := 'SELECT usuario.*, DECODE(EL_CODAREATELEFONOS, NULL, '''', ''('' || EL_CODAREATELEFONOS || '') '') || EL_TELEFONOS AS telefono, ' +
                       'DECODE(EL_CODAREAFAX, NULL, DECODE(EL_FAX, NULL, '''', EL_FAX) , ''('' || EL_CODAREAFAX || '') '' || EL_FAX) AS fax, ' +
                       'se_descripcion AS sector ' +
                  'FROM art.use_usuarios usuario, art.del_delegacion, computos.cse_sector cse ' +
                 'WHERE se_usuario = :usuario ' +
                   'AND se_delegacion = el_id ' +
                   'AND usuario.se_idsector = cse.se_id';
        with GetQueryEx(sSQL, ['ADMCONTR']) do
        try
          RichEditAux.Lines.Clear;
          RichEditAux.Lines.Add('Se solicita la confección del presupuesto adjunto, indicando de ser posible la fecha probable de realización.');
          RichEditAux.Lines.Add('Se agradecerá que responda a la dirección de correo que figura en la firma.' + CRLF + CRLF + 'Pedido/s: ' + tslCheckeados.CommaText);
          RichEditAux.Lines.Add('');
          RichEditAux.Lines.Add('');
          sFirmaUsuario := FIRMA_USUARIO;
          sFirmaUsuario := StringReplace(StringReplace(sFirmaUsuario, '*', 'Correo electrónico:', [rfReplaceAll]), '(', 'Teléfono:', [rfReplaceAll]);
          {sFirmaUsuario := Format(sFirmaUsuario, [UpperCase(fieldbyname('se_nombre').AsString), fieldbyname('sector').AsString, FieldByName('telefono').AsString,
                                  IIF(Trim(fieldbyname('se_interno').AsString) <> '', '(ext.' + fieldbyname('se_interno').AsString + ')', ''),
                                  IIF(Trim(FieldByName('fax').AsString) > '', ' - Fax ' + FieldByName('fax').AsString, ''),
                                  LowerCase(IIF(Pos('@', fieldbyname('se_mail').AsString) > 0, fieldbyname('se_mail').AsString, fieldbyname('se_usuario').AsString + '@provart.com.ar'))]);}

          sFirmaUsuario := StringReplace(sFirmaUsuario, '<NOMBRE>', UpperCase(fieldbyname('se_nombre').AsString), [rfReplaceAll]);
          sFirmaUsuario := StringReplace(sFirmaUsuario, '<SECTOR>', fieldbyname('sector').AsString, [rfReplaceAll]);
          //sFirmaUsuario := StringReplace(sFirmaUsuario, '<TELEFONO>', fieldbyname('telefono').AsString + IIF(Trim(FieldByName('fax').AsString) > '', ' - Fax ' + FieldByName('fax').AsString, ''), [rfReplaceAll]);
          sFirmaUsuario := StringReplace(sFirmaUsuario, '<TELEFONO>', fieldbyname('telefono').AsString, [rfReplaceAll]);
          sFirmaUsuario := StringReplace(sFirmaUsuario, '<MAIL>', fieldbyname('se_mail').AsString, [rfReplaceAll]);
          sFirmaUsuario := StringReplace(sFirmaUsuario, 'Interno <INTERNO>', IIF(Trim(fieldbyname('se_interno').AsString) <> '', '(int.' + fieldbyname('se_interno').AsString + ')', ''), [rfReplaceAll]);
          sFirmaUsuario := StringReplace(sFirmaUsuario, '<DIRECCION> | <CP> | <LOCALIDAD>\par', '', []);
          RichEditAux.Lines.Insert(RichEditAux.Lines.Count - 1, sFirmaUsuario);
        finally
          Free;
        end;        

        Resultado := Visualizar(qrSolicitudPresupuestoAMP, GetValores(' para ' + fraPrestadorSolicitud.RazonSocial,
                                                                      fraPrestadorSolicitud.CorreoElectronico,
                                                                      0, 0, RichEditAux.Lines.Text),
                                [TOpcionVisualizador(oForceShowModal), TOpcionVisualizador(oForceDB),
                                 TOpcionVisualizador(oAlwaysShowDialog), TOpcionVisualizador(oSinNotaAlPie)]);
        //Sesion.CambiarUsuario(sUsuarioActivo);

        if rImpresora in Resultado then
        begin
          sSql := 'UPDATE COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
                    ' SET SD_FECHA_IMPRESION = SYSDATE ' +
                  ' WHERE SD_NROSOLICITUD = :NROSOLICITUD';
          EjecutarSqlEx(sSql, [iNroSolicitud]);
        end;

        if rMail in Resultado then
        begin
          sSql := 'UPDATE COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
                    ' SET SD_FECHA_CORREO = SYSDATE ' +
                  ' WHERE SD_NROSOLICITUD = :NROSOLICITUD';
          EjecutarSqlEx(sSql, [iNroSolicitud]);
        end;

        if rFax in Resultado then
        begin
          sSql := 'UPDATE COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
                    ' SET SD_FECHA_FAX = SYSDATE ' +
                  ' WHERE SD_NROSOLICITUD = :NROSOLICITUD';
          EjecutarSqlEx(sSql, [iNroSolicitud]);
        end;

        if (Resultado <> []) then
          OpenQueryEx(sdqPrestadores, [sdqConsulta.FieldByName('SP_ID').AsInteger]);
      end;
    finally
      qrSolicitudPresupuestoAMP.Free;
    end;
  end;
end;

procedure TfrmSolicitarPresupuesto.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
//  DynColWidthsByData(Grid);
  Grid.ColumnByField['CHECKBOX'].Width := 24;

//  Grid.ColumnByField['CO_CONTRATO'].Visible     := fraSP_CONTRATO.IsEmpty;
  Grid.ColumnByField['EM_NOMBRE'].Visible       := fraSP_CONTRATO.IsEmpty;
  Grid.ColumnByField['EM_CUIT'].Visible         := fraSP_CONTRATO.IsEmpty;

//  Grid.ColumnByField['ES_NROESTABLECI'].Visible := fraSP_IDESTABLECIMIENTO.IsEmpty;
  Grid.ColumnByField['ES_NOMBRE'].Visible       := fraES_NROESTABLECI.IsEmpty;
  Grid.ColumnByField['ES_CPOSTAL'].Visible      := fraES_NROESTABLECI.IsEmpty;
  Grid.ColumnByField['ES_LOCALIDAD'].Visible    := fraES_NROESTABLECI.IsEmpty;

  Grid.ColumnByField['SE_NOMBRE'].Visible       := fraSP_USUARIO.IsEmpty;
  sbInfo.Panels[0].Text := Format('Se encontraron %d coincidencias', [sdqConsulta.RecordCount]);
  sbInfo.Panels[1].Text := '';
end;

procedure TfrmSolicitarPresupuesto.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'CHECKBOX' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if tslCheckeados.IndexOf(sdqConsulta.FieldByName('SP_ID').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmSolicitarPresupuesto.GridCellClick(Column: TColumn);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = 'CHECKBOX') then
  begin
    if tslCheckeados.IndexOf(sdqConsulta.FieldByName('SP_ID').AsString) > -1 then
      tslCheckeados.Delete(tslCheckeados.IndexOf(sdqConsulta.FieldByName('SP_ID').AsString))
    else
      tslCheckeados.Add(sdqConsulta.FieldByName('SP_ID').AsString);

    ContarSeleccionadas;
  end;
end;

procedure TfrmSolicitarPresupuesto.ContarSeleccionadas;
begin
  sbInfo.Panels[1].Text := IntToStr(tslCheckeados.Count) + iif(tslCheckeados.Count = 1 , ' presupuesto seleccionado', ' presupuestos seleccionados');
  Grid.Repaint;
end;

procedure TfrmSolicitarPresupuesto.mnuSeleccionarTodosClick(Sender: TObject);
var
  AMetodo: TDataSetNotifyEvent;
  APointer: TBookMark;
begin
  AMetodo := sdqConsulta.AfterScroll;
  sdqConsulta.AfterScroll := nil;
  APointer := sdqConsulta.GetBookmark;
  tslCheckeados.Clear;

  with sdqConsulta do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      tslCheckeados.Add(sdqConsulta.FieldByName('SP_ID').AsString);
      Next;
    end;
  finally
    sdqConsulta.AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
    ContarSeleccionadas;
  end;
end;

procedure TfrmSolicitarPresupuesto.mnuNoSeleccionarNingunoClick(Sender: TObject);
begin
  tslCheckeados.Clear;
  ContarSeleccionadas;
end;

procedure TfrmSolicitarPresupuesto.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['CHECKBOX']);
end;

procedure TfrmSolicitarPresupuesto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  tslCheckeados.Free;
end;

procedure TfrmSolicitarPresupuesto.btnSolicitarClick(Sender: TObject);
begin
  Verificar(fraPrestadorSolicitud.IsEmpty, fraPrestadorSolicitud, 'Debe seleccionar un prestador.');
  fpPrestador.ModalResult := mrOk;
end;

procedure TfrmSolicitarPresupuesto.fpPrestadorBeforeShow(Sender: TObject);
begin
  fraPrestadorSolicitud.Clear;
end;

procedure TfrmSolicitarPresupuesto.sdqPrestadoresAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(GridPrestadores);
  GridPrestadores.ColumnByField['RECIBIDO'].Width := 16;
//  pnlRight.Width := Max(GridEstudios.Width, GetColumnWidths(GridPrestadores, True) - 6);

  if sdqPrestadores.IsEmpty then
    edPresupuestados.Text := ''
  else
    edPresupuestados.Text := IntToStr(sdqPrestadores.RecordCount) + ' presupuestos';
end;

procedure TfrmSolicitarPresupuesto.acMarcarComoRecibidoExecute(Sender: TObject);
var
  sSQL: String;
begin
  Verificar(rgBajas.ItemIndex = 0, tbMarcarComoRecibido, 'Esta opción no está disponible con la visualización de bajas.');
  Verificar(not sdqPrestadores.Active or sdqPrestadores.IsEmpty, tbPrestadores, 'No se ha seleccionado ningún presupuesto.');

  if fpRecepcionPresupuesto.ShowModal = mrOk then
  begin
    sSql := 'UPDATE COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
              ' SET SD_FECHA_RECEPCION = SYSDATE, ' +
                  ' SD_USURECEPCION = :USUARIO, ' +
                  ' SD_MONTOPRESUPUESTADO = :MONTO ' +
            ' WHERE SD_NROSOLICITUD = :NROSOLICITUD';
    EjecutarSqlEx(sSql, [Sesion.UserID, edMontoRecepcionPresupuesto.Value, sdqPrestadores.FieldByName('SD_NROSOLICITUD').AsInteger]);
    OpenQueryEx(sdqPrestadores, [sdqConsulta.FieldByName('SP_ID').AsInteger]);
  end;
end;

procedure TfrmSolicitarPresupuesto.acReimprimirPresupuestoExecute(Sender: TObject);
begin
  Verificar(not sdqPrestadores.Active or sdqPrestadores.IsEmpty, tbPrestadores, 'No se ha seleccionado ningún presupuesto.');
  tslCheckeados.Clear;
  tslCheckeados := ValoresSqlEx('SELECT SP_ID ' +
                                  'FROM COMUNES.CSP_SOLICITUDPRESUPUESTO ' +
                                 'WHERE EXISTS (SELECT 1 ' +
                                                 'FROM COMUNES.CSD_SOLICITUD_DET_PRESUPUESTO ' +
                                                'WHERE SP_ID = SD_IDSOLICITUDPRESUPUESTO ' +
                                                  'AND SD_NROSOLICITUD = :NROSOLICITUD) ', [sdqPrestadores.FieldByName('SD_NROSOLICITUD').AsInteger]);

  ContarSeleccionadas;
  VisualizarPresupuesto(sdqPrestadores.FieldByName('SD_IDPRESTADOR').AsInteger);
end;

procedure TfrmSolicitarPresupuesto.gbFiltroEstudiosExpanded(Sender: TObject);
begin
  sdqConsultaAfterScroll(nil);
  SeparadorVertical.Visible := True;
  RichEditAux.Visible := False;
end;

procedure TfrmSolicitarPresupuesto.gbFiltroEstudiosCollapsed(Sender: TObject);
begin
  inherited;
  SeparadorVertical.Visible := False;
  RichEditAux.Visible := False;
end;

procedure TfrmSolicitarPresupuesto.GridDblClick(Sender: TObject);
begin
  inherited;
  GridCellClick(Grid.ColumnByField['CHECKBOX']);
end;

procedure TfrmSolicitarPresupuesto.tbPropiedadesClick(Sender: TObject);
begin
  if sdqEstudios.Active and sdqPrestadores.Active and sdqConsulta.Active then
  begin
    DynColWidthsByData(GridEstudios);
    pnlRight.Width := GetColumnWidths(GridEstudios, True) + 4;
    pnlEstudios.Caption := 'Estudios: ' + FloatToStr(ObtenerSuma(GridEstudios, 'CANTIDAD'));

    DynColWidthsByData(GridPrestadores);
    GridPrestadores.ColumnByField['RECIBIDO'].Width := 16;
    pnlRight.Width := Max(GridEstudios.Width, GetColumnWidths(GridPrestadores, True) - 6);
  end
end;

procedure TfrmSolicitarPresupuesto.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  sbInfo.Panels[0].Text := '';
end;

procedure TfrmSolicitarPresupuesto.chkPendientesClick(Sender: TObject);
begin
  chkAntiguos.Enabled := chkPendientes.Checked;
  if not chkPendientes.Checked then
    chkAntiguos.Checked := False;
end;

procedure TfrmSolicitarPresupuesto.fraES_PROVINCIAChange(Sender: TObject);
var
  sSQL: String;
begin
  pnlSoloGBA.Visible := fraES_PROVINCIA.IsSelected and (fraES_PROVINCIA.Codigo = IntToStr(PV_BUENOS_AIRES));

  sSQL := FSQL_Localidades;

  if fraES_PROVINCIA.IsSelected then
    AddCondition(sSQL, ' cp_provincia = ' + SqlValue (fraES_PROVINCIA.Codigo));

  if pnlSoloGBA.Visible and chkSoloGBA.Checked then
    AddCondition(sSQL,  ' cp_gba = ' + SqlValue('S'));

  cblLocalidades.SQL := sSQL;
end;

procedure TfrmSolicitarPresupuesto.chkSoloGBAClick(Sender: TObject);
begin
  fraES_PROVINCIAChange(nil);
end;

procedure TfrmSolicitarPresupuesto.sdqConsultaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  sdqEstudios.Close;
  sdqPrestadores.Close;
end;

procedure TfrmSolicitarPresupuesto.mnuSeleccionarTodasClick(Sender: TObject);
begin
  inherited;
  cblLocalidades.CheckAll;
end;

procedure TfrmSolicitarPresupuesto.mnuNoSeleccionarNingunaClick(Sender: TObject);
begin
  inherited;
  cblLocalidades.UncheckAll;
end;

procedure TfrmSolicitarPresupuesto.tbEliminarClick(Sender: TObject);
var
  sSQL: String;
begin
  Verificar(not sdqConsulta.FieldByName('SP_FECHABAJA').IsNull, tbEliminar, 'La solicitud ya está dada de baja.');

  if sdqConsulta.FieldByName('CO_ESTADO').AsString = '6' then
  begin
    edMotivoBaja.Text := Format('Empresa dada de baja al día %s.', [FormatDateTime('dd/mm/yyyy', DBDate)]);
    edMotivoBaja.Text := edMotivoBaja.Text + CRLF + 'Motivo: ' + sdqConsulta.FieldByName('MOTIVO_BAJA').AsString;
    edMotivoBaja.Text := edMotivoBaja.Text + CRLF + 'Fecha de baja: ' + sdqConsulta.FieldByName('CO_FECHABAJA').AsString;    
  end else
  if not AreIn(sdqConsulta.FieldByName('CO_ESTADO').AsString, ['1', '6']) then
  begin
    edMotivoBaja.Text := Format('El estado de la empresa %s al día %s es %s.', [sdqConsulta.FieldByName('EM_NOMBRE').AsString, FormatDateTime('dd/mm/yyyy', DBDate), sdqConsulta.FieldByName('ESTADO').AsString]);
  end else
  begin
    sSQL := 'SELECT 1 ' +
              'FROM crl_relacionlaboral ' +
             'WHERE rl_contrato = :contrato';
    if not ExisteSQLEx(sSQL, [sdqConsulta.FieldByName('CO_CONTRATO').AsInteger]) then
      edMotivoBaja.Text := Format('Empresa sin trabajadores activos al día %s.', [FormatDateTime('dd/mm/yyyy', DBDate)])
    else begin
      sSQL := 'select 1 ' +
                'from hys.hur_ultimorelevamiento, hys.v_trabajadores_con_riesgo ' +
               'where rs_cuit = ur_cuit ' +
                 'and rs_estableci = ur_estableci ' +
                 'and rs_fecha = ur_fecharelev ' +
                 'and rs_cuit = :cuit ' +
                 'and rs_estableci = :estableci';
      if not ExisteSQLEx(sSQL, [sdqConsulta.FieldByName('EM_CUIT').AsString, sdqConsulta.FieldByName('ES_NROESTABLECI').AsString]) then
        edMotivoBaja.Text := Format('Empresa sin trabajadores expuestos al día %s.', [FormatDateTime('dd/mm/yyyy', DBDate)])
      else
        edMotivoBaja.Clear;
    end;
  end;

  if fpMotivoBaja.ShowModal = mrOk then
    EjecutarSqlEx('UPDATE comunes.csp_solicitudpresupuesto ' +
                  '   SET sp_usubaja = :usuario, ' +
                  '       sp_fechabaja = SYSDATE, ' +
                  '       sp_motivobaja = :motivo' +
                  ' WHERE sp_fechabaja IS NULL ' +
                  '   AND sp_id = :id ',
                  [Sesion.UserID,
                   edMotivoBaja.Text,
                   sdqConsulta.FieldByName('SP_ID').AsInteger])
end;

procedure TfrmSolicitarPresupuesto.btnAceptarBajaClick(Sender: TObject);
begin
  Verificar(Trim(edMotivoBaja.Text) = '', edMotivoBaja, 'Debe indicar el motivo de la baja de la solicitud.');
  fpMotivoBaja.ModalResult := mrOk;
end;

procedure TfrmSolicitarPresupuesto.btnAceptarRecepcionPresupuestoClick(Sender: TObject);
begin
  Verificar((rgAceptaPresupuestar.ItemIndex = 0) and (edMontoRecepcionPresupuesto.Text = ''),
            edMontoRecepcionPresupuesto, 'Si ' + fraPrestadorRecepcionPresupuesto.RazonSocial +
            ' aceptó presupuestar debe indicar el monto presupuestado.');
  fpRecepcionPresupuesto.ModalResult := mrOk; 
  inherited;
end;

procedure TfrmSolicitarPresupuesto.edPresupuestadosChange(Sender: TObject);
begin
  inherited;
  pnlTotalPresupuestados.Visible := edPresupuestados.Text > '';
end;

procedure TfrmSolicitarPresupuesto.fpRecepcionPresupuestoShow(Sender: TObject);
begin
  fraPrestadorRecepcionPresupuesto.Cargar(sdqPrestadoresCA_IDENTIFICADOR.AsInteger);

  if sdqPrestadoresSD_MONTOPRESUPUESTADO.AsFloat > 0 then
    rgAceptaPresupuestar.ItemIndex := 0
  else
    rgAceptaPresupuestar.ItemIndex := 1;
    
  if sdqPrestadoresCA_IDENTIFICADOR.IsNull then
    edMontoRecepcionPresupuesto.Text := ''
  else
    edMontoRecepcionPresupuesto.Value := sdqPrestadoresSD_MONTOPRESUPUESTADO.AsFloat;
end;

procedure TfrmSolicitarPresupuesto.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(Field.FullName, ['SP_ID']) then
    if not sdqConsulta.FieldByName('SP_FECHABAJA').IsNull then
      AFont.Color := clRed;

  if AreIn(Field.FullName, ['CO_CONTRATO', 'EM_CUIT', 'EM_NOMBRE']) then
  begin
    if sdqConsulta.FieldByName('CO_ESTADO').AsString = '6' then
      AFont.Color := clRed
    else if not AreIn(sdqConsulta.FieldByName('CO_ESTADO').AsString, ['1', '6']) then
      AFont.Color := clMaroon
    else if sdqConsulta.FieldByName('EMPRESA_VIP').AsString = 'S' then
      AFont.Color := clPurple;    
  end;

  if AreIn(Field.FullName, ['ES_NROESTABLECI', 'ES_NOMBRE', 'ES_CPOSTAL', 'ES_LOCALIDAD']) then
  begin
    if not sdqConsulta.FieldByName('ES_FECHABAJA').IsNull then
      AFont.Color := clRed;
  end;

  if tslCheckeados.IndexOf(sdqConsulta.FieldByName('SP_ID').AsString) > -1 then
    BackGround := TColor($C0DCC0)//clMoneyGreen
  else
    BackGround := clWhite;

  if Highlight then
  begin
    AFont.Style := AFont.Style + [fsBold];
    Background := clGray;
  end else
    AFont.Style := AFont.Style - [fsBold];

  if (sdqConsulta.FieldByName('SIN_ESTUDIO').IsNull)  then  // TK 25420, el registro cambia de color cuando no tiene Estudios (se agrego el campo nuevo "SIN_ESTUDIO" en la consulta sdqConsulta, un tanto largo pero bueno...)
    BackGround := TColor(clSkyBlue);
end;

procedure TfrmSolicitarPresupuesto.rgTipoClick(Sender: TObject);
begin
  inherited;
  DBAdvCardListPrestadores.Visible := rgTipo.ItemIndex = 0;
  GridPrestadores.Visible := rgTipo.ItemIndex = 1;
end;

procedure TfrmSolicitarPresupuesto.sdqPrestadoresAfterClose(DataSet: TDataSet);
begin
  edPresupuestados.Text := '';
end;

procedure TfrmSolicitarPresupuesto.tbNotificarAMPClick(Sender: TObject);
var
  sDetalle, sMonto: String;
  i: Integer;
begin
  inherited;
  if MsgAsk('¿Está seguro que desea enviar una notificación al usuario que generó la solicitud de presupuesto?') then
  begin
    sdqPrestadores.DisableControls;
    try
      OpenQuery(sdqPrestadores);
      sdqPrestadores.First;
      for i := 0 to sdqPrestadores.RecordCount - 1 do
      begin
        if NVL(sdqPrestadoresSD_MONTOPRESUPUESTADO.AsString, '0') = '0' then
          sMonto := '-'
        else
          sMonto := sdqPrestadoresSD_MONTOPRESUPUESTADO.AsString;

        sDetalle := sDetalle + LPad('$ ' + sMonto, ' ', 12) + '  ' + sdqPrestadoresCA_DESCRIPCION.AsString + CRLF;
        sdqPrestadores.Next;
      end;
    finally
      sdqPrestadores.EnableControls; 
    end;

    EnviarMailBD(sdqConsultaSE_MAIL.AsString,
                 'Notificación: Presupuesto ' + sdqConsultaSP_ID.AsString + ' realizado',
                 [TOpcionEnvioMail(oAutoFirma)],
                 'La gestión del presupuesto ' + sdqConsultaSP_ID.AsString + ' ha concluido.' + CRLF + CRLF + sDetalle);
  end;
end;

end.
