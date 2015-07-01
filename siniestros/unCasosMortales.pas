unit unCasosMortales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask, RxToolEdit, DateComboBox,
  unFraCodigoDescripcion, unFraTrabajador, unFraTrabajadorSiniestro, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, SinEdit, Vcl.Menus, Vcl.Buttons;

const

  PATH_PDFS = '\\ntintraweb\Storage_Data\Seguimiento_Mortales\ArchivosAsociados\';

type
  TfrmCasosMortales = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dcDesdeCaso: TDateComboBox;
    dcHastaCaso: TDateComboBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    dcDesdeAccidente: TDateComboBox;
    dcHastaAccidente: TDateComboBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    GroupBox4: TGroupBox;
    fraTrabajadorSiniestro: TfraTrabajadorSiniestro;
    GroupBox5: TGroupBox;
    fraSector: TfraCodigoDescripcion;
    rgActivos: TRadioGroup;
    SinEditABM: TSinEdit;
    Label4: TLabel;
    Label5: TLabel;
    edTrabajadorABM: TEdit;
    sdqConsultaIDCASO: TFloatField;
    sdqConsultaSINIESTRO: TStringField;
    sdqConsultaCUIL: TStringField;
    sdqConsultaTRABAJADOR: TStringField;
    sdqConsultaDOMTRAB: TStringField;
    sdqConsultaCUIT: TStringField;
    sdqConsultaEMPRESA: TStringField;
    sdqConsultaSECTORACTUAL: TStringField;
    sdqConsultaTIPODECASO: TStringField;
    sdqConsultaTIPOALTA: TStringField;
    sdqConsultaFRECSINIESTRO: TDateTimeField;
    sdqConsultaTELPARTICULAR: TStringField;
    sdqConsultaCELULAR: TStringField;
    sdqConsultaACCIONINVEST: TStringField;
    sdqConsultaOBSERVINVEST: TStringField;
    sdqConsultaACCIONLEGALES: TStringField;
    sdqConsultaOBSERVLEGALES: TStringField;
    sdqConsultaACCIONMEDICA: TStringField;
    sdqConsultaOBSERVMEDICA: TStringField;
    sdqConsultaACCIONGERENCIA: TStringField;
    sdqConsultaOBSERVGERENCIA: TStringField;
    sdqConsultaFSUSPENSION: TStringField;
    sdqConsultaFACUSE: TStringField;
    sdqConsultaFINFORME: TStringField;
    sdqConsultaFSOCIOAMBIENTAL: TStringField;
    sdqConsultaFSOLICITUDDOCUM: TStringField;
    sdqConsultaCM_FECHABAJA: TDateTimeField;
    fpRealizarAccion: TFormPanel;
    Bevel1: TBevel;
    Label7: TLabel;
    btnAceptarAccion: TButton;
    btnCancelarAccion: TButton;
    fraAcciones: TfraCodigoDescripcion;
    tbRealizarAccion: TToolButton;
    fpInvestigacion: TFormPanel;
    Bevel2: TBevel;
    btnAceptarInvest: TButton;
    Button2: TButton;
    mResena: TMemo;
    Label6: TLabel;
    Label8: TLabel;
    mConclusion: TMemo;
    Label9: TLabel;
    mSugerencia: TMemo;
    fpObservaciones: TFormPanel;
    Bevel3: TBevel;
    Label10: TLabel;
    btnAceptarObs: TButton;
    Button4: TButton;
    mObservaciones: TMemo;
    sdqConsultaSM_CODIGO: TStringField;
    sdqConsultaCM_IDSECTOR: TFloatField;
    ShortCutControl1: TShortCutControl;
    sdqConsultaINVESTIGADOR: TStringField;
    rgTipoCaso: TRadioGroup;
    sdqConsultaFSOLICINVESTIG: TStringField;
    mnuImprimir: TPopupMenu;
    mnuImprimirGrilla: TMenuItem;
    mnuImprimirPlanilla: TMenuItem;
    fpHistoricoAcciones: TFormPanel;
    Bevel4: TBevel;
    Button1: TButton;
    GridHistoricoAcciones: TArtDBGrid;
    sdqCasosRelacionados: TSDQuery;
    dsCasosRelacionados: TDataSource;
    sdqCasosRelacionadosFECHA: TDateTimeField;
    sdqCasosRelacionadosUSUARIO: TStringField;
    sdqCasosRelacionadosSECTOR: TStringField;
    sdqCasosRelacionadosACCION: TStringField;
    sdqCasosRelacionadosOBSERVACION: TStringField;
    tbHistoricoAcciones: TToolButton;
    tbVerDigitalizaciones: TToolButton;
    sdqConsultaEX_SINIESTRO: TFloatField;
    sdqConsultaEX_ORDEN: TFloatField;
    tbPDF: TToolButton;
    pmPDF: TPopupMenu;
    mnuCargar: TMenuItem;
    mnuVer: TMenuItem;
    fpAsociarArchivo: TFormPanel;
    Bevel5: TBevel;
    Label12: TLabel;
    tbSeleccionArchivoAsociar: TSpeedButton;
    btnAbrirArchivo: TSpeedButton;
    btnAceptar_AsocArchivo: TBitBtn;
    btnCerrar_AsocArchivo: TBitBtn;
    edArchivoAsociado: TEdit;
    OpenDialog_AsocArch: TOpenDialog;
    sdqConsultaCM_RUTAARCHIVOASOCIADO: TStringField;
    mnuCargarInvestigacion: TMenuItem;
    mnuCargarSocioambiental: TMenuItem;
    VerInvestigacion: TMenuItem;
    VerSocioambiental: TMenuItem;
    sdqConsultaCM_RUTAARCHIVOSOCIOAMB: TStringField;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SinEditABMExit(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
      var Background: TColor; Highlight: Boolean);
    procedure tbRealizarAccionClick(Sender: TObject);
    procedure btnAceptarAccionClick(Sender: TObject);
    procedure btnAceptarObsClick(Sender: TObject);
    procedure btnAceptarInvestClick(Sender: TObject);
    procedure fpRealizarAccionShow(Sender: TObject);
    procedure mnuImprimirPlanillaClick(Sender: TObject);
    procedure mnuImprimirGrillaClick(Sender: TObject);
    procedure tbHistoricoAccionesClick(Sender: TObject);
    procedure tbVerDigitalizacionesClick(Sender: TObject);
    procedure tbSeleccionArchivoAsociarClick(Sender: TObject);
    procedure btnAbrirArchivoClick(Sender: TObject);
    procedure btnAceptar_AsocArchivoClick(Sender: TObject);
    procedure fpAsociarArchivoShow(Sender: TObject);
    procedure mnuCargarInvestigacionClick(Sender: TObject);
    procedure VerInvestigacionClick(Sender: TObject);
    procedure mnuCargarSocioambientalClick(Sender: TObject);
    procedure VerSocioambientalClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function Validar : Boolean; override;
    procedure ClearControls; override;
    procedure LimpiarTextos;
  public
    { Public declarations }
  end;

var
  frmCasosMortales: TfrmCasosMortales; sTipoArchivo: string;

implementation

{$R *.dfm}

uses unDmPrincipal, CustomDlgs, unSesion, unRptPlanillaMortales,
  unRptPlanillaMortalesPostFAcc, VCLExtra, unArchivo,
  unConstantArchivo, unConsultaTIFF, strfuncs, ShellAPI;

procedure TfrmCasosMortales.btnAbrirArchivoClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(edArchivoAsociado.Text), '', '', SW_SHOWNORMAL);

end;

procedure TfrmCasosMortales.btnAceptarAccionClick(Sender: TObject);
var res: boolean;
begin
  Verificar(fraAcciones.IsEmpty, fraAcciones, 'Debe seleccionar una acción');
  if (fraAcciones.Codigo = 'RE') and (sdqConsulta.FieldByName('sm_codigo').AsString = 'INV') then
  begin
    vclextra.LockControl(mSugerencia, false);
    res := fpInvestigacion.ShowModal = mrOk;
  end
  else
    if (fraAcciones.Codigo = 'AC') and (sdqConsulta.FieldByName('sm_codigo').AsString = 'MED') and (sdqConsulta.FieldByName('accioninvest').AsString = '') then
    begin
      vclextra.LockControl(mSugerencia);
      res := (fpInvestigacion.ShowModal = mrOk) and (fpObservaciones.ShowModal = mrOk);
    end
    else
      res := fpObservaciones.ShowModal = mrOk;

  if res = true then
  begin
    EjecutarStoreEx(' art.dinerarias.do_realizaraccionmortal(:idcaso, :idaccion, :usuario, :obs, :resena, :conclu, :suge); ',
                   [sdqConsulta.FieldByName('idcaso').AsInteger, fraAcciones.ID, Sesion.UserID, mObservaciones.Text, mResena.Text, mConclusion.Text, mSugerencia.Text]);
    fpRealizarAccion.ModalResult := mrOK;
  end;
  tbRefrescarClick(nil);
  LimpiarTextos;
end;

procedure TfrmCasosMortales.btnAceptarClick(Sender: TObject);
var ssql: string;
begin
  if Validar then
  begin
    ssql := ' INSERT INTO din.dcm_casosmortales (cm_idexpediente, cm_idsector, cm_tipocaso, cm_tipoalta, cm_fechaalta, cm_usualta) ' +
                '  VALUES (art.siniestro.get_idexpediente(:sin, :ord, :rec), decode(:tipocaso, 0, 1, 3), decode(:tipocaso, 0, ''I'', ''P''), ''M'', trunc(sysdate), :usualta) ';
    EjecutarSqlEx(ssql, [SinEditABM.Siniestro, SinEditABM.Orden, SinEditABM.Recaida, rgTipoCaso.ItemIndex, rgTipoCaso.ItemIndex, Sesion.UserID]);
    fpAbm.ModalResult := mrOK;
    tbRefrescarClick(nil);
  end;

end;

procedure TfrmCasosMortales.btnAceptarInvestClick(Sender: TObject);
begin
  Verificar((Trim(mResena.Text) = '') or (Trim(mConclusion.Text) = '') or ((not mSugerencia.ReadOnly) and (Trim(mSugerencia.Text) = '')), fpInvestigacion, 'Debe completar los campos');
  fpInvestigacion.ModalResult := mrOK;

end;

procedure TfrmCasosMortales.btnAceptarObsClick(Sender: TObject);
begin
  Verificar(Length(Trim(mObservaciones.Lines.Text)) < 5, mObservaciones, 'Debe completar al menos 5 caracteres');
  fpObservaciones.ModalResult := mrOK;

end;

procedure TfrmCasosMortales.btnAceptar_AsocArchivoClick(Sender: TObject);
var sArchivoDestino, ssql, sCampoArchivo: string;
begin
  Verificar((edArchivoAsociado.Text = ''), edArchivoAsociado, 'Debe especificar un Archivo para Asociar');

  if sTipoArchivo = 'I' then
    sCampoArchivo := 'cm_rutaarchivoasociado'
  else
    sCampoArchivo := 'cm_rutaarchivosocioamb';

  sArchivoDestino := PATH_PDFS + ExtractFileName(edArchivoAsociado.Text);

  if Not FileExists(sArchivoDestino) then
  begin
    if not CopyFile(PChar(edArchivoAsociado.Text), PChar(sArchivoDestino), true) then
       raise Exception.Create('El archivo ' + edArchivoAsociado.Text +  'no pudo copiarse a la carpeta ' + PATH_PDFS)
    else
    begin
      ssql := ' update din.dcm_casosmortales ' +
              '    set ' + sCampoArchivo + ' = :ruta, ' +
              '        cm_usumodif = :usu, cm_fechamodif = trunc(sysdate) ' +
              '  where cm_id = :id ';
      EjecutarSqlEx(ssql, [sArchivoDestino, Sesion.UserID, sdqConsultaIDCASO.AsInteger]);
    end;
  end
  else
    raise Exception.Create('Un archivo con el mismo nombre ya existe en la carpeta destino. Cambie el nombre al archivo y vuelva a intentarlo');

  tbRefrescarClick(nil);
  fpAsociarArchivo.ModalResult := mrOk;
end;

procedure TfrmCasosMortales.FormCreate(Sender: TObject);
begin
  inherited;
  with fraSector do
  begin
    TableName := 'din.dsm_sectoresmortales';
    FieldID := 'sm_id';
    FieldCodigo := 'sm_codigo';
    FieldDesc := 'sm_descripcion';

    {if not Seguridad.Claves.IsActive('SuperUserSectores') then
      Sql := ' SELECT sm_id AS id, sm_codigo AS codigo, sm_descripcion AS descripcion ' +
               ' FROM din.dsm_sectoresmortales, din.dum_usuariosmortales ' +
              ' WHERE sm_id = um_idsector AND sm_fechabaja IS NULL AND um_fechabaja IS NULL ' +
               '  AND um_usuario = ' + QuotedStr(Sesion.UserID);

    SelectFirst;          }
    Codigo := ValorSqlEx(' SELECT sm_codigo ' +
                           ' FROM din.dsm_sectoresmortales, din.dum_usuariosmortales ' +
                          ' WHERE sm_id = um_idsector AND sm_fechabaja IS NULL AND um_fechabaja IS NULL ' +
                           '  AND um_usuario = :usu AND ROWNUM = 1', [Sesion.UserID]);
  end;

  with fraAcciones do
  begin
    TableName := 'din.dam_accionesmortales';
    FieldID := 'am_id';
    FieldCodigo := 'am_codigo';
    FieldDesc := 'am_descripcion';
    ShowBajas := False;
  end;

  ShowActived := false;

  tbRealizarAccion.Left := 210;
  tbHistoricoAcciones.Left := 215;
  tbVerDigitalizaciones.Left := 220;
  tbPDF.Left := 225;

end;

procedure TfrmCasosMortales.fpAsociarArchivoShow(Sender: TObject);
begin
  edArchivoAsociado.Clear;

end;

procedure TfrmCasosMortales.fpRealizarAccionShow(Sender: TObject);
begin
  fraAcciones.Clear;

end;

procedure TfrmCasosMortales.GridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (not sdqConsulta.FieldByName('cm_fechabaja').IsNull) then
    AFont.Color := clRed;
end;

procedure TfrmCasosMortales.SinEditABMExit(Sender: TObject);
var ssql: string;
begin
  ssql := 'SELECT tj_nombre' +
          '  FROM comunes.ctj_trabajador, art.sex_expedientes ' +
          ' WHERE ex_idtrabajador = tj_id' +
          '   AND ex_siniestro = :sin' +
          '   AND ex_orden = :ord' +
          '   AND ex_recaida = :rec ';

   edTrabajadorABM.Text := ValorSqlEx(ssql, [SinEditABM.Siniestro, SinEditABM.Orden, SinEditABM.Recaida]);

end;

procedure TfrmCasosMortales.tbEliminarClick(Sender: TObject);
var ssql: string;
begin
  if MsgBox('Desea dar de baja este registro?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    ssql := ' UPDATE din.dcm_casosmortales ' +
            '    SET cm_fechabaja = TRUNC(SYSDATE), ' +
            '        cm_usubaja = :usubaja ' +
            '  WHERE cm_id = :idcaso ';

    EjecutarSqlEx(ssql, [Sesion.UserID, sdqConsulta.FieldByName('idcaso').AsInteger]);
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmCasosMortales.tbHistoricoAccionesClick(Sender: TObject);
begin
  sdqCasosRelacionados.Close;
  sdqCasosRelacionados.ParamByName('idcaso').AsInteger := sdqConsulta.FieldByName('idcaso').AsInteger;
  sdqCasosRelacionados.Open;
  fpHistoricoAcciones.ShowModal;
end;

procedure TfrmCasosMortales.tbRealizarAccionClick(Sender: TObject);
var ssql: string;
begin
  ssql := ' SELECT 1 ' +
            ' FROM din.dsm_sectoresmortales, din.dum_usuariosmortales ' +
           ' WHERE sm_id = um_idsector AND sm_fechabaja IS NULL AND um_fechabaja IS NULL ' +
            '  AND um_usuario = :usuario AND sm_codigo = :sector ';

  Verificar(not ExisteSqlEx(ssql, [Sesion.userid, sdqConsulta.FieldByName('sm_codigo').AsString]) and
           (not Seguridad.Claves.IsActive('SuperUserSectores')), toolbar, 'No posee permiso para realizar esta acción');
  fraAcciones.Sql := ' SELECT am_id as id, am_codigo as codigo, am_descripcion as descripcion ' +
                     '   FROM din.dam_accionesmortales, din.das_accionessectores ' +
                     '  WHERE as_idaccion = am_id ' +
                     '    AND as_idsector = ' + sdqConsulta.FieldByName('cm_idsector').AsString;
  fpRealizarAccion.ShowModal;

end;

procedure TfrmCasosMortales.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin
  //Verificar((fraSector.isempty) and (not Seguridad.Claves.IsActive('SuperUserSectores')), frasector, 'Debe seleccionar un sector');
  ssql := 'SELECT cm_id idcaso, art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro,' +
          '       art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre trabajador, art.utiles.armar_domicilio(tj_calle, tj_numero,' +
          '       tj_piso, tj_departamento, tj_localidad, tj_edificio) domtrab, art.utiles.armar_cuit(em_cuit) cuit, em_nombre' +
          '       empresa, sm_descripcion sectoractual, DECODE(cm_tipocaso, ''I'', ''Inmediato'', ''P'', ''Posterior'') tipodecaso,' +
          '       DECODE(cm_tipoalta, ''A'', ''Automática'', ''M'', ''Manual'') tipoalta, ex_fecharecepcion frecsiniestro,' +
          '       art.trabajador.get_telefono(tj_id, 2) telparticular, art.trabajador.get_telefono(tj_id, 3) celular,' +
          '       art.dinerarias.get_accionrealizada(cm_id, 1) accioninvest, art.dinerarias.get_accionrealizada(cm_id, 1, ''S'')' +
          '       observinvest, art.dinerarias.get_accionrealizada(cm_id, 2) accionlegales,' +
          '       art.dinerarias.get_accionrealizada(cm_id, 2, ''S'') observlegales, art.dinerarias.get_accionrealizada(cm_id, 3)' +
          '       accionmedica, art.dinerarias.get_accionrealizada(cm_id, 3, ''S'') observmedica,' +
          '       art.dinerarias.get_accionrealizada(cm_id, 4) acciongerencia, art.dinerarias.get_accionrealizada(cm_id, 4,' +
          '       ''S'') observgerencia, art.siniestro.get_datoscarta(ex_id, DECODE(art.siniestro.is_siniestrogobernacion(ex_id,' +
          '       ''S''), ''S'', ''SP01G'', ''SP01''), ''I'') fsuspension, art.siniestro.get_datoscarta(ex_id,' +
          '       DECODE(art.siniestro.is_siniestrogobernacion(ex_id, ''S''), ''S'', ''SP01G'', ''SP01''), ''R'') facuse,' +
          '       art.siniestro.get_datosparteevolutivo(ex_id, ''I'', ''A'') finforme, art.siniestro.get_datosparteevolutivo(ex_id,' +
          '       ''S'', ''A'') fsocioambiental, art.siniestro.get_datoscarta(ex_id, ''GM01'', ''I'') fsolicituddocum, ' +
          '       art.siniestro.get_datosinvestigacion(ex_id, ''F'') fsolicinvestig, ' +
          '       art.siniestro.get_datosinvestigacion(ex_id, ''I'') investigador, ' +
          '       cm_fechabaja, sm_codigo, cm_idsector, ex_siniestro, ex_orden, cm_rutaarchivoasociado, cm_rutaarchivosocioamb ' +
          '  FROM din.dcm_casosmortales, din.dsm_sectoresmortales, art.sex_expedientes, ctj_trabajador, aem_empresa' +
          ' WHERE cm_idexpediente = ex_id' +
          '   AND ex_idtrabajador = tj_id' +
          '   AND ex_cuit = em_cuit' +
          '   AND cm_idsector = sm_id';

  if not dcDesdeCaso.IsEmpty then
    ssql := ssql + ' AND TRUNC(CM_FECHAALTA) >= ' + dcDesdeCaso.SqlText;

  if not dcHastaCaso.IsEmpty then
    ssql := ssql + ' AND TRUNC(CM_FECHAALTA) <= ' + dcHastaCaso.SqlText;

  if not dcDesdeAccidente.IsEmpty then
    ssql := ssql + ' AND TRUNC(EX_FECHAACCIDENTE) >= ' + dcDesdeAccidente.SqlText;

  if not dcHastaAccidente.IsEmpty then
    ssql := ssql + ' AND TRUNC(EX_FECHAACCIDENTE) <= ' + dcHastaAccidente.SqlText;

  if not fraTrabajadorSiniestro.IsEmpty then
    ssql := ssql + ' AND TJ_ID = ' + IntToStr(fraTrabajadorSiniestro.IdTrabajador);

  if not fraEmpresaFiltro.IsEmpty then
    ssql := ssql + ' AND EM_ID = ' + IntToStr(fraEmpresaFiltro.ID);

  case rgActivos.ItemIndex of
    0: ssql := ssql + ' AND CM_FECHABAJA IS NULL ';
    1: ssql := ssql + ' AND CM_FECHABAJA IS NOT NULL ';
  end;

  if not fraSector.IsEmpty then
    ssql := ssql  + ' AND cm_idsector = ' + fraSector.ID;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;

end;

procedure TfrmCasosMortales.tbSeleccionArchivoAsociarClick(Sender: TObject);
begin
  if OpenDialog_AsocArch.Execute then
    edArchivoAsociado.Text := OpenDialog_AsocArch.FileName;

end;

procedure TfrmCasosMortales.tbVerDigitalizacionesClick(Sender: TObject);
var sClaveArmada, sIdArchivos: string;
begin
  sClaveArmada := GetClaveArmada(2, sdqConsulta.FieldByName('ex_siniestro').AsString, sdqConsulta.FieldByName('ex_orden').AsString, '', '');
  DoArmarIdArchivos(ID_CARPETA_SINIESTRO, sClaveArmada, sIdArchivos);
  sIdArchivos := CutRight(sIdArchivos, 2);

  if sdqConsulta.FieldByName('ex_siniestro').AsString <> '' then
  begin
    with TfrmConsultaTIFF.Create(nil) do
    begin
      Consulta := 'SELECT DISTINCT ra_patharchivo || ''\'' || ra_archivo detalle, td_descripcion codigo, td_codigo' +
                          '       codigotipodocumento' +
                          '  FROM rar_archivo, rta_tipoarchivo, rda_detallearchivo, rtd_tipodocumento,' +
                          '       archivo.rra_repositorioarchivo' +
                          ' WHERE td_id = da_idtipodocumento' +
                          '   AND da_idarchivo = ar_id' +
                          '   AND ar_tipo = ta_id' +
                          '   AND ra_fechabaja IS NULL' +
                          '   AND ra_idarchivo = ar_id' +
                          '   AND td_codigo = ''CDP''' +
                          '   AND archivo.is_permisovertipoarchivo(ta_id, ''' + Sesion.UserID +  ''') = ''S''' +
                          '   AND (ar_tipo, ar_clave) IN (SELECT rar3.ar_tipo, rar3.ar_clave' +
                          '                                 FROM rda_detallearchivo rda2, rar_archivo rar2, rar_archivo rar3' +
                          '                                WHERE rda2.da_idarchivo = rar2.ar_id' +
                          '                                  AND rar2.ar_clave = rar3.ar_clave' +
                          '                                  AND archivo.is_tipoarchivorelacionado(rar2.ar_tipo, rar3.ar_tipo) = ''S''' +
                          '                                  AND rda2.da_idarchivo IN (SELECT DISTINCT ar_id' +
                          '                                                              FROM archivo.rar_archivo' +
                          '                                                             WHERE ar_id IN (' + sIdArchivos + ')))';

      CampoImagen := 'detalle';
      ShowModal;
      Free;
    end;
  end;

end;

function TfrmCasosMortales.Validar;
begin
  Verificar(SinEditABM.IsEmpty, SinEditABM, 'Debe ingresar un siniestro');
  Verificar(ExisteSqlEx('select 1 from art.sex_expedientes where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec ' +
                        ' and ((ex_causafin in (''02'', ''99'', ''95'')) or (nvl(ex_gravedad, 0) <> 5)) ',
                        [SinEditABM.Siniestro, SinEditABM.Orden, SinEditABM.Recaida]), SinEditABM, 'El siniestro no es mortal o está cerrado por error de carga');
  Validar := True;
end;


procedure TfrmCasosMortales.VerInvestigacionClick(Sender: TObject);
begin
  if sdqconsulta.FieldByName('cm_rutaarchivoasociado').AsString <> '' then
    ShellExecute(Application.Handle, nil, PChar(sdqconsulta.FieldByName('cm_rutaarchivoasociado').AsString), '', '', SW_SHOWNORMAL);

end;

procedure TfrmCasosMortales.VerSocioambientalClick(Sender: TObject);
begin
  if sdqconsulta.FieldByName('cm_rutaarchivosocioamb').AsString <> '' then
    ShellExecute(Application.Handle, nil, PChar(sdqconsulta.FieldByName('cm_rutaarchivosocioamb').AsString), '', '', SW_SHOWNORMAL);

end;

procedure TfrmCasosMortales.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  dcDesdeCaso.Clear;
  dcHastaCaso.Clear;
  dcDesdeAccidente.Clear;
  dcHastaAccidente.Clear;
  fraEmpresaFiltro.Clear;
  fraTrabajadorSiniestro.Clear;
  fraSector.Clear;
  rgActivos.ItemIndex := 0;

end;

procedure TfrmCasosMortales.ClearControls;
begin
  SinEditABM.Clear;
  edTrabajadorABM.Clear;
  rgTipoCaso.ItemIndex := 0;
end;

procedure TfrmCasosMortales.LimpiarTextos;
begin
  mObservaciones.Clear;
  mResena.Clear;
  mConclusion.Clear;
  mSugerencia.Clear;
end;

procedure TfrmCasosMortales.mnuCargarInvestigacionClick(Sender: TObject);
begin
  sTipoArchivo := 'I';   //Investigación
  fpAsociarArchivo.ShowModal;
end;

procedure TfrmCasosMortales.mnuCargarSocioambientalClick(Sender: TObject);
begin
  sTipoArchivo := 'S';   //Socioambiental
  fpAsociarArchivo.ShowModal;
end;

procedure TfrmCasosMortales.mnuImprimirGrillaClick(Sender: TObject);
begin
  tbImprimirClick(nil);

end;

procedure TfrmCasosMortales.mnuImprimirPlanillaClick(Sender: TObject);
var rptPlanillaMortales: TrptPlanillaMortales; rptPlanillaMortalesPostFAcc: TrptPlanillaMortalesPostFAcc;
begin
  if sdqConsulta.FieldbyName('tipodecaso').AsString = 'Inmediato' then
  begin
    rptPlanillaMortales := TrptPlanillaMortales.Create(nil);
    try
      rptPlanillaMortales.Imprimir(sdqConsulta.FieldByName('idcaso').AsInteger);
    finally
      rptPlanillaMortales.Free;
    end;
  end
  else
  begin                                  //tipodecaso 'Posterior'
    rptPlanillaMortalesPostFAcc := TrptPlanillaMortalesPostFAcc.Create(nil);
    try
      rptPlanillaMortalesPostFAcc.Imprimir(sdqConsulta.FieldByName('idcaso').AsInteger);
    finally
      rptPlanillaMortalesPostFAcc.Free;
    end
  end;

end;

end.
