unit unSeguimientoErroresUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraUsuario, Mask, PatternEdit, ComboEditor,
  CheckCombo, DBCheckCombo, ToolEdit, DateComboBox,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Menus, CardinalEdit,
  IntEdit, unArt, unFraCodDesc, RxToolEdit, RxPlacemnt;

type
  TfrmSeguimientoErroresUsuarios = class(TfrmCustomGridABM)
    gbUsuario: TGroupBox;
    fraUsuarioBusq: TfraUsuarios;
    gbError: TGroupBox;
    cmbErroresBusq: TDBCheckCombo;
    sdqErrores: TSDQuery;
    dsErrores: TDataSource;
    gbFechaAltaBusq: TGroupBox;
    Label1: TLabel;
    edFAltaDesdeBusq: TDateComboBox;
    edFAltaHastaBusq: TDateComboBox;
    ShortCutControl1: TShortCutControl;
    Label2: TLabel;
    fraUsuariosCarga: TfraUsuarios;
    Label3: TLabel;
    fraErrorCarga: TfraStaticCTB_TABLAS;
    Label4: TLabel;
    edObservacionesCarga: TMemo;
    pnlBajas: TPanel;
    chkNoBajas: TCheckBox;
    pmnuImprimir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirResumenGcia: TMenuItem;
    pnlSeleccionados: TPanel;
    edTotalRegistros: TCardinalEdit;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    lblNroLote: TLabel;
    edLoteCarga: TIntEdit;
    gbLote: TGroupBox;
    edLoteBusq: TIntEdit;
    ImprimirResumenUsuario: TMenuItem;
    Label5: TLabel;
    edCantErroresCarga: TIntEdit;
    edNroMedio: TIntEdit;
    tbEnviarMailErrores: TToolButton;
    ToolButton7: TToolButton;
    tbBuscarRepositorio: TToolButton;
    ToolButton9: TToolButton;
    ToolButton1: TToolButton;
    tbMarcarAjustado: TToolButton;
    rgAjustes: TRadioGroup;
    Label6: TLabel;
    edTotalAjFinalizados: TCardinalEdit;
    Label7: TLabel;
    edTotalAjPendientes: TCardinalEdit;
    GroupBox1: TGroupBox;
    fraGerenciasBusq: TfraCodDesc;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    fraJefaturasBusq: TfraCodDesc;
    fraSectoresBusq: TfraCodDesc;
    gbArchivo: TGroupBox;
    fraTipoArchivoBusq: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResumenGciaClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure QueryPrintReportBegin(Sender: TObject);
    procedure ImprimirResumenUsuarioClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
    procedure tbEnviarMailErroresClick(Sender: TObject);
    procedure tbBuscarRepositorioClick(Sender: TObject);
    procedure tbMarcarAjustadoClick(Sender: TObject);
    procedure ControlFiltros(Sender: TObject);
  private
    pbAltaImportImg: Boolean;
    function DoArmarWhere(var DescrFiltros: String): String;
    procedure CalcTotales;
    procedure DoSetearPermisosABM;
    function ValidarAjustes: Boolean;
    procedure DoAjustar;
  public
    class procedure DoAltaSeguimientoErroresUsuarios(ListaCodErrores, Usuario, Observaciones: String; Lote: TTableId; NroMedio: Integer);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure RefreshData; override;
    procedure EnableButtons(AEnabled : Boolean = True); override;
  end;

const
  FSqlBase = 'FROM COMPUTOS.CSE_SECTOR GERENCIA, COMPUTOS.CSE_SECTOR JEFATURA, COMPUTOS.CSE_SECTOR SECTOR, ' +
                  'CTB_TABLAS, ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RLO_LOTE, ARCHIVO.REU_ERRORUSUARIO, USE_USUARIOS USU ' +
            'WHERE EU_USUARIO = USU.SE_USUARIO ' +
              'AND TB_CLAVE = ''EUAGA'' ' +
              'AND TB_CODIGO = EU_CODERROR ' +
              'AND GERENCIA.SE_ID = ART.VARIOS.GET_IDGERENCIAUSUARIO(USU.SE_USUARIO) ' +
              'AND JEFATURA.SE_ID = ART.VARIOS.GET_IDJEFATURAUSUARIO(USU.SE_USUARIO) ' +
              'AND SECTOR.SE_ID = ART.VARIOS.GET_IDSECTORUSUARIO(USU.SE_USUARIO) ' +
              'AND EU_LOTE = LO_ID(+) ' +
              'AND LO_TIPO = TA_ID(+) ';

var
  frmSeguimientoErroresUsuarios: TfrmSeguimientoErroresUsuarios;

implementation

uses
  AnsiSql, unDmPrincipal, CustomDlgs, unSesion, SqlFuncs, unQrResumenErrores,
  unQrResumenErroresUsuario, unUtilsArchivo, StrFuncs, unEspera, unConstantArchivo,
  unComunesMail, unConsultarRepositorio, DBFuncs, General, unComunes;

{$R *.dfm}

procedure TfrmSeguimientoErroresUsuarios.ClearControls;
begin
  fraUsuariosCarga.Clear;
  fraErrorCarga.Clear;
  edLoteCarga.Clear;
  edObservacionesCarga.Clear;
  edNroMedio.Clear;
  edCantErroresCarga.Value := 1;
end;

function TfrmSeguimientoErroresUsuarios.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      if ModoABM = maBaja then
      begin
         PrimaryKey.Add('EU_ID',             sdqConsulta.FieldByName('ID').AsInteger);
         Fields.Add('EU_FECHABAJA',          exDateTime);
         Fields.Add('EU_USUBAJA',            Sesion.UserID);

         SqlType := stUpdate;
      end else
      begin
         if ModoABM = maAlta then
         begin
           PrimaryKey.AddExpression('EU_ID',  'SEQ_REU_ID.NEXTVAL');
           Fields.Add('EU_FECHAALTA',         exDateTime);
           Fields.Add('EU_USUALTA',           Sesion.UserID);

           if edNroMedio.Value > 0 then
             Fields.Add('EU_NROMEDIO',        edNroMedio.Value);

           SqlType := stInsert;
         end else
         if ModoABM = maModificacion then
         begin
           PrimaryKey.Add('EU_ID',            sdqConsulta.FieldByName('ID').AsInteger);
           Fields.Add('EU_FECHAMODIF',        exDateTime);
           Fields.Add('EU_USUMODIF',          Sesion.UserID);

           SqlType := stUpdate;
         end;

         Fields.Add('EU_USUARIO',             fraUsuariosCarga.Codigo);
         Fields.Add('EU_CODERROR',            fraErrorCarga.Codigo);
         Fields.Add('EU_LOTE',                edLoteCarga.Value, True);
         Fields.Add('EU_CANTERRORES',         edCantErroresCarga.Value);
         Fields.Add('EU_OBSERVACIONES',       edObservacionesCarga.Lines.Text);
      end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmSeguimientoErroresUsuarios.LoadControls;
begin                            
  with sdqConsulta do
    begin
      fraUsuariosCarga.Codigo         := FieldByName('CODUSUARIO').AsString;
      fraErrorCarga.Codigo            := FieldByName('CODERROR').AsString;

      if not FieldByName('LOTE').IsNull then
        edLoteCarga.Value             := FieldByName('LOTE').AsInteger
      else
        edLoteCarga.Clear;

      edCantErroresCarga.Value        := FieldByName('CANTERRORES').AsInteger;
      edObservacionesCarga.Lines.Text := FieldByName('OBSERVACIONES').AsString;;
    end;
end;
          
procedure TfrmSeguimientoErroresUsuarios.RefreshData;
var
  sDescrFiltros, sSql: String;
begin
  sSql := 'SELECT USU.SE_NOMBRE USUARIO, EU_CODERROR CODERROR, TB_DESCRIPCION DESCRERROR, TB_ESPECIAL1 MODORESOLERROR, ' +
                 'EU_OBSERVACIONES OBSERVACIONES, TRUNC(EU_FECHAALTA) FECHAALTA, EU_ID ID, ' +
                 'GERENCIA.SE_DESCRIPCION USUGERENCIA, EU_USUARIO CODUSUARIO, TRUNC(EU_FECHABAJA) FECHABAJA, ' +
                 'EU_LOTE LOTE, EU_CANTERRORES CANTERRORES, EU_USUALTA USUALTA, EU_NROMEDIO NROMEDIO, ' +
                 'EU_AJUSTADO AJUSTADO, JEFATURA.SE_DESCRIPCION USUJEFATURA, SECTOR.SE_DESCRIPCION USUSECTOR, ' +
                 'TA_DESCRIPCION TIPOARCHIVOLOTE, EU_SEQ_LOTE SEQ_LOTE ';
                 // ART.ARCHIVO.GET_PORCERRUSUARIOLOTE(EU_USUARIO, EU_LOTE) PORCLOTE*/';
                 // no uso GET_PORCERRUSUARIOLOTE porque está en función solo del usuario y del lote,
                 // y en la grilla pueden estar filtrando por otras cosas...
                 
  sdqConsulta.SQL.Text := sSql + FSqlBase + DoArmarWhere(sDescrFiltros) + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

function TfrmSeguimientoErroresUsuarios.Validar: Boolean;
begin
  Verificar(fraUsuariosCarga.IsEmpty, fraUsuariosCarga, 'Debe indicar el usuario.');
  Verificar(fraErrorCarga.IsEmpty, fraErrorCarga, 'Debe indicar el error.');
  Verificar((fraErrorCarga.Codigo = CODERROR_SEGUSU_DOCLOTEINEXISTENTE) and edLoteCarga.IsEmpty, edLoteCarga, 'Debe indicar el lote.');
  Verificar(not edLoteCarga.IsEmpty and not Is_ExisteLote(edLoteCarga.Value), edLoteCarga, 'El lote no existe.');
  Verificar(edCantErroresCarga.IsEmpty, edCantErroresCarga, 'Debe indicar la cantidad de errores.');

  Result := True;
end;

procedure TfrmSeguimientoErroresUsuarios.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived     := False;
  pbAltaImportImg := False;
  Sql.TableName   := 'REU_ERRORUSUARIO';
  FieldBaja       := 'FECHABAJA';

  with fraErrorCarga do
    begin
      Clave     := 'EUAGA';
      ShowBajas := False;
    end;

  with fraTipoArchivoBusq do
    begin
      TableName   := 'RTA_TIPOARCHIVO';
      FieldID     := 'TA_ID';
      FieldCodigo := 'TA_CODIGO';
      FieldDesc   := 'TA_DESCRIPCION';
      ShowBajas   := True;
    end;

  OpenQuery(sdqErrores);
  DoSetearPermisosABM();
end;

procedure TfrmSeguimientoErroresUsuarios.tbLimpiarClick(Sender: TObject);
begin
  fraUsuarioBusq.Clear;
  fraGerenciasBusq.Clear;
  fraJefaturasBusq.Clear;
  fraSectoresBusq.Clear;
  fraTipoArchivoBusq.Clear;
  cmbErroresBusq.Clear;
  edFAltaDesdeBusq.Clear;
  edFAltaHastaBusq.Clear;
  edLoteBusq.Clear;
  rgAjustes.ItemIndex    := 2;   // Todos
  chkNoBajas.Checked     := True;

  edTotalRegistros.Value     := 0;
  edTotalAjFinalizados.Value := 0;
  edTotalAjPendientes.Value  := 0;

  ControlFiltros(nil);
  
  inherited;
end;

procedure TfrmSeguimientoErroresUsuarios.mnuImprimirResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

procedure TfrmSeguimientoErroresUsuarios.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmSeguimientoErroresUsuarios.mnuImprimirResumenGciaClick(Sender: TObject);
var
  sDescrFiltros, sSql: String;
begin
  sSql := FSqlBase + DoArmarWhere(sDescrFiltros); // sacar order by
  DoImprimirResumenErroresGcia(sSql, sDescrFiltros);
end;

function TfrmSeguimientoErroresUsuarios.DoArmarWhere(var DescrFiltros: String): String;
var
  sWhere: string;
begin
  DescrFiltros := '';
  sWhere       := SqlBetweenDateTime(' AND EU_FECHAALTA ', edFAltaDesdeBusq.Date, edFAltaHastaBusq.Date);

  if not edFAltaDesdeBusq.IsEmpty then
    DescrFiltros := DescrFiltros + 'F. Alta Desde: ' + DateToStr(edFAltaDesdeBusq.Date) + ' - ';

  if not edFAltaHastaBusq.IsEmpty then
    DescrFiltros := DescrFiltros + 'F. Alta Hasta: ' + DateToStr(edFAltaHastaBusq.Date) + ' - ';

  if fraUsuarioBusq.IsSelected then
    sWhere := sWhere + ' AND EU_USUARIO = ' + SqlValue(fraUsuarioBusq.Codigo);

  if fraGerenciasBusq.IsSelected then
    sWhere := sWhere + ' AND GERENCIA.SE_ID = ' + SqlValue(fraGerenciasBusq.Value);

  if fraJefaturasBusq.IsSelected then
    sWhere := sWhere + ' AND JEFATURA.SE_ID = ' + SqlValue(fraJefaturasBusq.Value);

  if fraSectoresBusq.IsSelected then
    sWhere := sWhere + ' AND SECTOR.SE_ID = ' + SqlValue(fraSectoresBusq.Value);

  if fraTipoArchivoBusq.IsSelected then
    sWhere := sWhere + ' AND TA_ID = ' + SqlValue(fraTipoArchivoBusq.Value);

  if cmbErroresBusq.Text <> '' then
    sWhere := sWhere + ' AND EU_CODERROR ' + cmbErroresBusq.InSql;

  if not edLoteBusq.IsEmpty then
    sWhere := sWhere + ' AND EU_LOTE = ' + SqlValue(edLoteBusq.Value);

  if chkNoBajas.Checked then
    sWhere := sWhere + ' AND EU_FECHABAJA IS NULL';

  case rgAjustes.ItemIndex of
    0: sWhere := sWhere + ' AND EU_AJUSTADO = ''S''';
    1: sWhere := sWhere + ' AND EU_AJUSTADO = ''N''';
  end;

  DescrFiltros := CutRight(DescrFiltros, 3);
  Result       :=  sWhere;
end;

procedure TfrmSeguimientoErroresUsuarios.CalcTotales;
begin
  if tbSumatoria.Down and sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
    begin
      edTotalRegistros.Value     := sdqConsulta.RecordCount;
      edTotalAjFinalizados.Value := CountRecords(sdqConsulta, ['AJUSTADO'], ['S']);
      edTotalAjPendientes.Value  := edTotalRegistros.Value - edTotalAjFinalizados.Value;
    end
  else
    begin
      edTotalRegistros.Value     := 0;
      edTotalAjFinalizados.Value := 0;
      edTotalAjPendientes.Value  := 0;
    end;
end;

procedure TfrmSeguimientoErroresUsuarios.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmSeguimientoErroresUsuarios.QueryPrintReportBegin(Sender: TObject);
var
  AField: TPrintField;
begin
  AField := QueryPrint.FieldByName['CODERROR'];

  if Assigned(AField) then
    AField.TotalType := ttCount;

  inherited;
end;

procedure TfrmSeguimientoErroresUsuarios.ImprimirResumenUsuarioClick(Sender: TObject);
var
  sDescrFiltros, sSql: String;
begin
  sSql := FSqlBase + DoArmarWhere(sDescrFiltros); // sacar order by
  DoImprimirResumenErroresUsuario(sSql, sDescrFiltros);
end;

class procedure TfrmSeguimientoErroresUsuarios.DoAltaSeguimientoErroresUsuarios(ListaCodErrores, Usuario, Observaciones: String; Lote: TTableId; NroMedio: Integer);
begin
  with TfrmSeguimientoErroresUsuarios.Create(nil) do
    try
      Show;

      pbAltaImportImg := True;

      ModoABM := maAlta;
      ModoABMToSqlType;
      ClearControls;

      fpABM.Caption := CAPTION_ALTA;

      fraErrorCarga.ExtraCondition := ' AND TB_CODIGO IN (' + ListaCodErrores + ')';

      fraUsuariosCarga.Codigo         := Usuario;
      edLoteCarga.Value               := Lote;
      edNroMedio.Value                := NroMedio;
      edObservacionesCarga.Lines.Text := Observaciones;

      fpABM.ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmSeguimientoErroresUsuarios.btnAceptarClick(Sender: TObject);
begin
	if Validar and DoABM then
    begin
      if pbAltaImportImg then
        begin
          MsgBox('Registro dado de alta correctamente.', MB_ICONINFORMATION);
          
          with fraErrorCarga do
            begin
              Clear;
              edCodigo.SetFocus;
            end;
        end
      else
        begin
          if sdqConsulta.Active then
            begin
              sdqConsulta.Refresh;
              CheckButtons;
            end
          else
            tbRefrescarClick(nil);

          fpABM.ModalResult := mrOk;
        end;
    end;
end;

procedure TfrmSeguimientoErroresUsuarios.fpAbmEnter(Sender: TObject);
begin
  if pbAltaImportImg then
    fraErrorCarga.edCodigo.SetFocus;
end;

procedure TfrmSeguimientoErroresUsuarios.DoSetearPermisosABM;
var
  pbPerfilAdministrador: Boolean;
begin
  pbPerfilAdministrador := GetPerfilAdministrador();

  tbNuevo.Enabled     := (Seguridad.Activar(tbNuevo) and pbPerfilAdministrador);
  tbModificar.Enabled := (Seguridad.Activar(tbModificar) and pbPerfilAdministrador);
  tbEliminar.Enabled  := (Seguridad.Activar(tbEliminar) and pbPerfilAdministrador);
end;

procedure TfrmSeguimientoErroresUsuarios.EnableButtons(AEnabled: Boolean);
begin
  inherited;
  DoSetearPermisosABM;
end;

procedure TfrmSeguimientoErroresUsuarios.tbEnviarMailErroresClick(Sender: TObject);
var
  sCuerpoOrig, sUsuario, sFecha, sCuerpo, sAsuntoGD, sAsuntoJefe, sSectTxt, sSql: String;
  sTextoFinalUsu, sTextoFinalJefe, sAsuntoUsu, sTipoArchLote, sSectTxt2, sMail: String;
  sTextoFinal, sDescrError: String;
  qry2, qry: TSDQuery;
begin
  if MsgBox('¿Confirma el envío de mails pendientes a los jefes de los usuarios y a los usuarios, por los errores cometidos?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
    begin
      IniciarEspera('Enviando correo...');
      try
        sSql := 'SELECT DISTINCT USUJEFE.SE_USUARIO USUJEFE, USUJEFE.SE_NOMBRE, USUJEFE.SE_MAIL MAIL, SC_DESCRIPCION DESCRSECTOR, ' +
                       'TA_DESCRIPCION TIPOARCHIVOLOTE, TA_ID IDTIPOARCHIVOLOTE ' +
                  'FROM USC_SECTORES, USE_USUARIOS USUJEFE, USE_USUARIOS USUERR, ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RLO_LOTE, ARCHIVO.REU_ERRORUSUARIO ' +
                 'WHERE USUERR.SE_RESPONDEA = USUJEFE.SE_USUARIO '+
                   'AND USUJEFE.SE_FECHABAJA IS NULL ' +
                   'AND USUJEFE.SE_MAIL IS NOT NULL ' +
                   'AND USUJEFE.SE_SECTOR = SC_CODIGO ' +
                   'AND SC_FECHABAJA IS NULL ' +
                   'AND EU_USUARIO = USUERR.SE_USUARIO ' +
                   'AND EU_MAILENVIADO = ''N'' ' +
                   'AND EU_LOTE = LO_ID(+) ' +
                   'AND LO_TIPO = TA_ID(+) ' +
                   'AND TRUNC(EU_FECHAALTA) <= ACTUALDATE-1 ' +
              'ORDER BY USUJEFE.SE_NOMBRE';

        with GetQuery(sSql) do
          try
            if Eof then
              MsgBox('No se han encontrado errores pendientes de envío de mails.', MB_ICONINFORMATION)
            else
              begin
                BeginTrans;
                try
                  VALOR_PARAMETRO_CORREO_DOCUMENTACION         := get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);
                  VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION := get_ParametrobyId(PARAMETRO_CORREO_GUARDAYDIGITALIZACION);


(* *** Envío de mails por errores detectados en la CajaExpo *** *)
                  sSectTxt        := 'Errores de usuarios al preparar lotes';
                  sSectTxt2       := 'Errores del usuario al preparar lotes';
                  sCuerpoOrig     := 'Se informa que se han detectado errores suyos en las siguientes fechas:' + CRLF;
                  sTextoFinalJefe := 'Ustedes podrán hacer las consultas por medio del AGA, botón de Seguimiento de Errores de Usuarios, ' +
                                     'filtrando por la fecha indicada en que se detectó la inconsistencia y por dichos usuarios.'  + CRLF +
                                     'También podrán utilizar el botón ''Búsqueda aprox. en Repositorio de Error CD'' y a su vez ver las imágenes.';
                  sTextoFinalUsu  := 'Usted podrá hacer las consultas por medio del AGA, botón de Seguimiento de Errores de Usuarios, ' +
                                     'filtrando por la fecha indicada en que se detectó la inconsistencia y por su nombre de usuario.'  + CRLF +
                                     'También podrá utilizar el botón ''Búsqueda aprox. en Repositorio de Error CD'' y a su vez ver las imágenes.';

                  while not EOF do
                    begin
                      sFecha  := '';
                      sCuerpo := 'Se informa que se han detectado errores por parte de sus colaboradores:' + CRLF;

                      sAsuntoGD := sSectTxt + ' (Sector: ' + FieldByName('DESCRSECTOR').AsString +
                                              ' / Jefe: ' + FieldByName('SE_NOMBRE').AsString +
                                              ' / Tipo Arch. Lote: ' + FieldByName('TIPOARCHIVOLOTE').AsString + ')';

                      sTipoArchLote := Iif(FieldByName('TIPOARCHIVOLOTE').IsNull, '', ' (Tipo Arch. Lote: ' + FieldByName('TIPOARCHIVOLOTE').AsString + ')');
                      sAsuntoJefe   := sSectTxt + sTipoArchLote;
                      sAsuntoUsu    := sSectTxt2 + sTipoArchLote;

                      // envío de mails a los jefes (1 mail para cada jefe, con cada fecha con errores, y con todos los usuarios que cometieron errores en esa fecha)
                      sSql := 'SELECT DISTINCT TRUNC(EU_FECHAALTA) FECHAALTA, USUERR.SE_NOMBRE USUARIOERR ' +
                                'FROM ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RLO_LOTE, USE_USUARIOS USUERR, ARCHIVO.REU_ERRORUSUARIO ' +
                               'WHERE USUERR.SE_RESPONDEA = :UsuJefe ' +
                                 'AND EU_USUARIO = USUERR.SE_USUARIO ' +
                                 'AND EU_MAILENVIADO = ''N'' ' +
                                 'AND EU_LOTE = LO_ID(+) ' +
                                 'AND LO_TIPO = TA_ID(+) ' +
                                 'AND TRUNC(EU_FECHAALTA) <= ACTUALDATE-1 ' +
                                 'AND EU_CODERROR NOT IN (' + SqlValue(CODERROR_SEGUSU_DOCLOTEINEXISTENTE) + ') ' +    // este código de error se envía con un formato de mail distinto
                                 Iif(FieldByName('IDTIPOARCHIVOLOTE').IsNull, 'AND TA_ID IS NULL', 'AND TA_ID = ' + SqlValue(FieldByName('IDTIPOARCHIVOLOTE').AsInteger)) + ' ' +
                            'ORDER BY FECHAALTA, USUARIOERR';
                      qry := GetQueryEx(sSql, [FieldByName('USUJEFE').AsString]);
                      try
                        while not qry.EOF do
                          begin
                            if sFecha <> qry.FieldByName('FECHAALTA').AsString then
                              begin
                                sFecha  := qry.FieldByName('FECHAALTA').AsString;
                                sCuerpo := sCuerpo + CRLF + '- ' + sFecha + ':' + CRLF;
                              end;

                            sCuerpo := sCuerpo + '     ' + qry.FieldByName('USUARIOERR').AsString + CRLF;

                            qry.Next;
                          end;
                      finally
                        qry.Free;
                      end;

                      if not IsEmptyString(sFecha) then
                        begin
                          sCuerpo := sCuerpo + CRLF + sTextoFinalJefe;

                          SendByMailServer(FieldByName('MAIL').AsString,
                             Sesion.UserId, sAsuntoJefe, '',
                             sCuerpo, False, False, False, Sesion.UserId, False);

                          SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,
                             Sesion.UserId, sAsuntoGD, '',
                             sCuerpo, False, False, False, Sesion.UserId, False);
                        end;

                      // envío de mails a los usuarios (1 mail por cada usuario para todas las fechas con errores)
                      sUsuario := '';
                      sMail    := '';

                      sSql := 'SELECT DISTINCT TRUNC(EU_FECHAALTA) FECHAALTA, USUERR.SE_NOMBRE USUARIOERR, USUERR.SE_MAIL MAIL ' +
                                'FROM ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RLO_LOTE, USE_USUARIOS USUERR, ARCHIVO.REU_ERRORUSUARIO ' +
                               'WHERE USUERR.SE_RESPONDEA = :UsuJefe ' +
                                 'AND EU_USUARIO = USUERR.SE_USUARIO ' +
                                 'AND EU_MAILENVIADO = ''N'' ' +
                                 'AND EU_LOTE = LO_ID(+) ' +
                                 'AND LO_TIPO = TA_ID(+) ' +
                                 'AND TRUNC(EU_FECHAALTA) <= ACTUALDATE-1 ' +
                                 'AND EU_CODERROR NOT IN (' + SqlValue(CODERROR_SEGUSU_DOCLOTEINEXISTENTE) + ') ' +    // este código de error se envía con un formato de mail distinto
                                 Iif(FieldByName('IDTIPOARCHIVOLOTE').IsNull, 'AND TA_ID IS NULL', 'AND TA_ID = ' + SqlValue(FieldByName('IDTIPOARCHIVOLOTE').AsInteger)) + ' ' +
                            'ORDER BY USUARIOERR, FECHAALTA';
                      qry2 := GetQueryEx(sSql, [FieldByName('USUJEFE').AsString]);
                      try
                        while not qry2.EOF do
                          begin
                            if sUsuario <> qry2.FieldByName('USUARIOERR').AsString then
                              begin
                                if not IsEmptyString(sUsuario) then
                                  begin
                                     sCuerpo := sCuerpo + CRLF + sTextoFinalUsu;

                                     SendByMailServer(sMail,
                                        Sesion.UserId, sAsuntoUsu, '',
                                        sCuerpo, False, False, False, Sesion.UserId, False);
                                  end;

                                sUsuario := qry2.FieldByName('USUARIOERR').AsString;
                                sMail    := qry2.FieldByName('MAIL').AsString;
                                sCuerpo  := sCuerpoOrig;
                              end;

                            sCuerpo := sCuerpo + '     ' + qry2.FieldByName('FECHAALTA').AsString + CRLF;

                            qry2.Next;
                          end;
                      finally
                        qry2.Free;
                      end;

                      if not IsEmptyString(sUsuario) then    // para mandar el ultimo mail luego de que sale del loop anterior
                        begin
                          sCuerpo := sCuerpo + CRLF + sTextoFinalUsu;

                          SendByMailServer(sMail,
                             Sesion.UserId, sAsuntoUsu, '',
                             sCuerpo, False, False, False, Sesion.UserId, False);
                        end;

                      Next;
                    end;


(* *** Envío de mails por documentos del lote que no existen en la CajaExpo *** *)
                  sDescrError     := Get_DescripcionCTBTablas('EUAGA', CODERROR_SEGUSU_DOCLOTEINEXISTENTE);
                  sSectTxt        := 'Errores de usuarios en documentos de lotes';
                  sSectTxt2       := 'Errores del usuario en documentos de lotes';
                  sCuerpoOrig     := 'Se informa que se ha detectado posible documentación faltante, o error de indexado por parte de la ' +
                                     'Administradora correspondiente a los siguientes lotes:' + CRLF;
                  sTextoFinalJefe := 'Ustedes podrán hacer las consultas por medio del AGA, botón de Seguimiento de Errores de Usuarios, ' +
                                     'filtrando por el lote indicado en que se detectó la inconsistencia, por dichos usuarios y error: ' +
                                     sDescrError + ' (' + CODERROR_SEGUSU_DOCLOTEINEXISTENTE + ').';
                  sTextoFinalUsu  := 'Usted podrá hacer las consultas por medio del AGA, botón de Seguimiento de Errores de Usuarios, ' +
                                     'filtrando por el lote indicado en que se detectó la inconsistencia, por su nombre de usuario y error: ' +
                                     sDescrError + ' (' + CODERROR_SEGUSU_DOCLOTEINEXISTENTE + ').';
                  sTextoFinal     := ' Los usuarios de Provincia ART como de la Administradora, una vez hecha la revisión deberán informar al ' +
                                     'Buzón de Digitalización y Guarda.';

                  First;
                  while not EOF do
                    begin
                      sUsuario := '';
                      sCuerpo  := 'Se informa que se ha detectado documentación faltante por parte de sus colaboradores, en los siguientes lotes:' + CRLF;

                      sAsuntoGD := sSectTxt + ' (Sector: ' + FieldByName('DESCRSECTOR').AsString +
                                              ' / Jefe: ' + FieldByName('SE_NOMBRE').AsString +
                                              ' / Tipo Arch. Lote: ' + FieldByName('TIPOARCHIVOLOTE').AsString + ')';

                      sTipoArchLote := Iif(FieldByName('TIPOARCHIVOLOTE').IsNull, '', ' (Tipo Arch. Lote: ' + FieldByName('TIPOARCHIVOLOTE').AsString + ')');
                      sAsuntoJefe   := sSectTxt + sTipoArchLote;
                      sAsuntoUsu    := sSectTxt2 + sTipoArchLote;

                      // envío de mails a los jefes (1 mail para cada jefe, con cada usuario que cometió errores, y con todos los lote de dicho usuario)
                      sSql := 'SELECT DISTINCT USUERR.SE_NOMBRE USUARIOERR, EU_LOTE LOTEERROR ' +
                                'FROM ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RLO_LOTE, USE_USUARIOS USUERR, ARCHIVO.REU_ERRORUSUARIO ' +
                               'WHERE USUERR.SE_RESPONDEA = :UsuJefe ' +
                                 'AND EU_USUARIO = USUERR.SE_USUARIO ' +
                                 'AND EU_MAILENVIADO = ''N'' ' +
                                 'AND EU_LOTE = LO_ID(+) ' +
                                 'AND LO_TIPO = TA_ID(+) ' +
                                 'AND TRUNC(EU_FECHAALTA) <= ACTUALDATE-1 ' +
                                 'AND EU_CODERROR IN (' + SqlValue(CODERROR_SEGUSU_DOCLOTEINEXISTENTE) + ') ' +    // este código de error se envía con un formato de mail distinto
                                 Iif(FieldByName('IDTIPOARCHIVOLOTE').IsNull, 'AND TA_ID IS NULL', 'AND TA_ID = ' + SqlValue(FieldByName('IDTIPOARCHIVOLOTE').AsInteger)) + ' ' +
                            'ORDER BY USUARIOERR, LOTEERROR';
                      qry := GetQueryEx(sSql, [FieldByName('USUJEFE').AsString]);
                      try
                        while not qry.EOF do
                          begin
                            if sUsuario <> qry.FieldByName('USUARIOERR').AsString then
                              begin
                                sUsuario  := qry.FieldByName('USUARIOERR').AsString;
                                sCuerpo := sCuerpo + CRLF + '- ' + sUsuario + ':' + CRLF;
                              end;

                            sCuerpo := sCuerpo + '     Lote: ' + qry.FieldByName('LOTEERROR').AsString + CRLF;

                            qry.Next;
                          end;
                      finally
                        qry.Free;
                      end;

                      if not IsEmptyString(sUsuario) then
                        begin
                          sCuerpo := sCuerpo + CRLF + sTextoFinalJefe + sTextoFinal;

                          // SendByMailServer(FieldByName('MAIL').AsString,
                          //   Sesion.UserId, sAsuntoJefe, '',
                          //   sCuerpo, False, False, False, Sesion.UserId, False);

                          SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,
                             Sesion.UserId, sAsuntoGD, '',
                             sCuerpo, False, False, False, Sesion.UserId, False);

                          SendByMailServer(VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION,
                             Sesion.UserId, sAsuntoGD, '',
                             sCuerpo, False, False, False, Sesion.UserId, False);
                        end;

                      // envío de mails a los usuarios (1 mail por cada usuario para todas los lotes con errores)
                      (*sUsuario := '';
                      sMail    := '';

                      sSql := 'SELECT DISTINCT EU_LOTE LOTEERROR, USUERR.SE_NOMBRE USUARIOERR, USUERR.SE_MAIL MAIL ' +
                                'FROM ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RLO_LOTE, USE_USUARIOS USUERR, ARCHIVO.REU_ERRORUSUARIO ' +
                               'WHERE USUERR.SE_RESPONDEA = :UsuJefe ' +
                                 'AND EU_USUARIO = USUERR.SE_USUARIO ' +
                                 'AND EU_MAILENVIADO = ''N'' ' +
                                 'AND EU_LOTE = LO_ID(+) ' +
                                 'AND LO_TIPO = TA_ID(+) ' +
                                 'AND TRUNC(EU_FECHAALTA) <= ACTUALDATE-1 ' +
                                 'AND EU_CODERROR IN (' + SqlValue(CODERROR_SEGUSU_DOCLOTEINEXISTENTE) + ') ' +    // este código de error se envía con un formato de mail distinto
                                 Iif(FieldByName('IDTIPOARCHIVOLOTE').IsNull, 'AND TA_ID IS NULL', 'AND TA_ID = ' + SqlValue(FieldByName('IDTIPOARCHIVOLOTE').AsInteger)) + ' ' +
                            'ORDER BY USUARIOERR, LOTEERROR';
                      qry2 := GetQueryEx(sSql, [FieldByName('USUJEFE').AsString]);
                      try
                        while not qry2.EOF do
                          begin
                            if sUsuario <> qry2.FieldByName('USUARIOERR').AsString then
                              begin
                                if not IsEmptyString(sUsuario) then
                                  begin
                                     sCuerpo := sCuerpo + CRLF + sTextoFinalUsu + sTextoFinal;

                                     SendByMailServer(sMail,
                                        Sesion.UserId, sAsuntoUsu, '',
                                        sCuerpo, False, False, False, Sesion.UserId, False);
                                  end;

                                sUsuario := qry2.FieldByName('USUARIOERR').AsString;
                                sMail    := qry2.FieldByName('MAIL').AsString;
                                sCuerpo  := sCuerpoOrig;
                              end;

                            sCuerpo := sCuerpo + '     Lote: ' + qry2.FieldByName('LOTEERROR').AsString + CRLF;

                            qry2.Next;
                          end;
                      finally
                        qry2.Free;
                      end;

                      if not IsEmptyString(sUsuario) then    // para mandar el ultimo mail luego de que sale del loop anterior
                        begin
                          sCuerpo := sCuerpo + CRLF + sTextoFinalUsu + sTextoFinal;

                          SendByMailServer(sMail,
                             Sesion.UserId, sAsuntoUsu, '',
                             sCuerpo, False, False, False, Sesion.UserId, False);
                        end;*)

                      Next;
                    end;


                  sSql := 'UPDATE ARCHIVO.REU_ERRORUSUARIO ' +
                             'SET EU_MAILENVIADO = ''S'' ' +
                           'WHERE EU_MAILENVIADO = ''N'' ' +
                             'AND TRUNC(EU_FECHAALTA) <= ACTUALDATE-1';
                  EjecutarSqlST(sSql);
                  CommitTrans;

                  MsgBox('Mails enviados correctamente.', MB_ICONINFORMATION);
                except
                  on E: Exception do
                    begin
                      Rollback;
                      Raise Exception.Create(E.Message + CRLF + 'Error al enviar los mails a los jefes.');
                    end;
                end;
              end;
          finally
            Free;
          end;
      finally
        DetenerEspera;
      end;
    end;
end;

procedure TfrmSeguimientoErroresUsuarios.tbBuscarRepositorioClick(Sender: TObject);
var
  sObserv, sClave, sCodDocumento: String;
  Cadenas, Clave, CodDocumento: TDynStringArray;
  iPos1, iPos2: Integer;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar un registro.');
  Verificar(Grid.SelectedRows.Count > 1 , Grid, 'Debe seleccionar solo un registro.');
  Verificar(sdqConsulta.FieldByName('NROMEDIO').IsNull, nil, 'Solo puede buscar errores provenientes de la Importación de Imágenes al Repositorio.');

  sObserv := sdqConsulta.FieldByName('OBSERVACIONES').AsString;
  iPos1   := InStr(sObserv, '(');
  iPos2   := InStr(sObserv, ')');

  if (iPos1 > 0) and (iPos2 > 0) then
    begin
      SetLength(Cadenas, 10);
      SetLength(Clave, 2);
      SetLength(CodDocumento, 2);

      sObserv := StrMid(sObserv, iPos1+1, iPos2-iPos1-1);
      Cadenas := ParseText(sObserv, '-');

      Clave         := ParseText(Cadenas[0], ':');
      sClave        := Trim(Clave[1]);

      CodDocumento  := ParseText(Cadenas[1], ':');
      sCodDocumento := Trim(CodDocumento[1]);
    end
  else
    begin
      sClave        := '';
      sCodDocumento := '';
    end;

  TfrmConsultarRepositorio.DoMostrarSegErroresUsuarios(sdqConsulta.FieldByName('NROMEDIO').AsInteger, sdqConsulta.FieldByName('LOTE').AsInteger, sClave, sCodDocumento);
end;

function TfrmSeguimientoErroresUsuarios.ValidarAjustes: Boolean;
var
  i: Integer;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar un registro.');

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'Alguno de los registros seleccionados se encuentra dado de baja.');
      Verificar(sdqConsulta.FieldByName('AJUSTADO').AsString = 'S', nil, 'Alguno de los registros seleccionados ya ha sido ajustado.');
    end;

  Result := True;
end;

procedure TfrmSeguimientoErroresUsuarios.DoAjustar;
var
  i: Integer;
  sSql: String;
begin
  BeginTrans;
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        sSql := 'UPDATE ARCHIVO.REU_ERRORUSUARIO ' +
                   'SET EU_AJUSTADO = ''S'', ' +
                       'EU_USUAJUSTADO = :UserId, ' +
                       'EU_FECHAAJUSTADO = SYSDATE ' +
                 'WHERE EU_ID = :Id';
        EjecutarSqlSTEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('ID').AsInteger]);
      end;
    CommitTrans;

    MsgBox('Registros marcados como ajustados correctamente.', MB_ICONINFORMATION);
    RefreshData;
  except
    on E:Exception do
      begin
        Rollback;
        Raise Exception.Create(E.Message + CRLF + 'Error al marcar el registro.');
      end;
  end;
end;

procedure TfrmSeguimientoErroresUsuarios.tbMarcarAjustadoClick(Sender: TObject);
begin
  if ValidarAjustes then
    DoAjustar;
end;

procedure TfrmSeguimientoErroresUsuarios.ControlFiltros(Sender: TObject);
begin
  with fraJefaturasBusq, fraJefaturasBusq.Propiedades do
    begin
      ExtraCondition := ' AND SE_NIVEL = 3 ';

      if fraGerenciasBusq.IsSelected then
        ExtraCondition := ExtraCondition + ' AND SE_IDSECTORPADRE = ' + SqlValue(fraGerenciasBusq.Codigo)
    end;

  with fraSectoresBusq, fraSectoresBusq.Propiedades do
    begin
      ExtraCondition := ' AND SE_NIVEL = 4 ';

      if fraJefaturasBusq.IsSelected then
        ExtraCondition := ExtraCondition + ' AND SE_IDSECTORPADRE = ' + SqlValue(fraJefaturasBusq.Codigo)
      else if fraGerenciasBusq.IsSelected then
        ExtraCondition := ExtraCondition + ' AND SE_IDSECTORPADRE IN (SELECT JEF.SE_ID ' +
                                                                       'FROM COMPUTOS.CSE_SECTOR JEF ' +
                                                                      'WHERE JEF.SE_IDSECTORPADRE = ' + SqlValue(fraGerenciasBusq.Codigo) + ') '
      else
        ExtraCondition := ExtraCondition + ' AND SE_ID IN (SELECT DISTINCT USUARIOS.SE_IDSECTOR ' +
                                                            'FROM ART.USE_USUARIOS USUARIOS) ';
    end;

  if Assigned(Sender) and (TControl(Sender).Parent is TFraCodDesc) then
    TFraCodDesc(TControl(Sender).Parent).cmbDescripcionDropDown(Sender);
end;

end.

