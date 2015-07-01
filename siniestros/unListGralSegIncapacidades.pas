unit unListGralSegIncapacidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, ImgList, XPMenu, Placemnt, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, StdCtrls, Mask, ToolEdit, DateComboBox,
  unFraTrabajador, ExtCtrls, SinEdit, unFraCodigoDescripcion,
  unfraCtbTablas, QueryToFile, ExportDialog, Db, SDEngine, 
  unCustomForm, FieldHider, ShortCutControl, artSeguridad,
  QueryPrint, SortDlg, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, QRCtrls, QuickRpt, Menus, Buttons, FormPanel;

type
  TfrmListGralSegIncapacidades = class(TfrmCustomConsulta)
    rgOrden: TRadioGroup;
    gbSoloUltEstado: TGroupBox;
    chkSoloUltEstado: TCheckBox;
    rgTratamiento: TRadioGroup;
    rgCaracterIncapac: TRadioGroup;
    gbCodigoEvento: TGroupBox;
    lbTrabCUIL: TLabel;
    Label4: TLabel;
    gbComMedica: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    gbUbicIncapac: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    gbMedico: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    fraCodDescMedicoDesde: TfraCodigoDescripcion;
    fraCodDescMedicoHasta: TfraCodigoDescripcion;
    gbTipoAccidente: TGroupBox;
    fraCtbTipoAccidente: TfraCtbTablas;
    gbSiniestro: TGroupBox;
    Label2: TLabel;
    edSiniestroDesde: TSinEdit;
    edSiniestroHasta: TSinEdit;
    gbFechaEvento: TGroupBox;
    Label5: TLabel;
    edFechaEventoDesde: TDateComboBox;
    edFechaEventoHasta: TDateComboBox;
    gbFechaSiniestro: TGroupBox;
    Label1: TLabel;
    edFechaSinDesde: TDateComboBox;
    edFechaSinHasta: TDateComboBox;
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    fraTrabajador: TfraTrabajador;
    ScrollBox1: TScrollBox;
    qrListGralInca: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlSeleccion: TQRLabel;
    qrlOrden: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel9: TQRLabel;
    dsReporte: TDataSource;
    sdqReporte: TSDQuery;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel32: TQRLabel;
    Label3: TLabel;
    Label12: TLabel;
    fraCodEventoDesde: TfraCodigoDescripcion;
    fraCodEventoHasta: TfraCodigoDescripcion;
    fraComisionDesde: TfraCodigoDescripcion;
    fraComisionHasta: TfraCodigoDescripcion;
    fraUbicacionDesde: TfraCodigoDescripcion;
    fraUbicacionHasta: TfraCodigoDescripcion;
    qrDetalleConsultorio: TQuickRep;
    QRBand1: TQRBand;
    qrlFecha: TQRLabel;
    qrlMedico: TQRLabel;
    qrltitulolist: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    qriLogo: TQRImage;
    QRBand2: TQRBand;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    tbSalir2: TToolButton;
    tbListadoConsultorio: TToolButton;
    ToolButton1: TToolButton;
    fpListadoConsultorio: TFormPanel;
    Bevel9: TBevel;
    btnConsCancelar: TBitBtn;
    edConsFechaEvento: TDateComboBox;
    Label13: TLabel;
    fraConsMedico: TfraCodigoDescripcion;
    Label14: TLabel;
    Label15: TLabel;
    sdqReporteListadosConsult: TSDQuery;
    ExportDialog_ListConsult: TExportDialog;
    btnConsImprimir: TSpeedButton;
    btnConsExportar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbListadoConsultorioClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure ExportDialog_ListConsultBeforeExport(Sender: TObject);
    procedure btnConsImprimirClick(Sender: TObject);
    procedure btnConsExportarClick(Sender: TObject);
  private
    procedure Do_Borrar_GralIncapacidades;
    function Get_DescripDesdeHasta(Titulo: String; Desde, Hasta: TDateTime): String; overload;
    function Get_DescripDesdeHasta(Titulo, Desde, Hasta: String): String; overload;
    procedure Do_ArmarSeleccion(var Seleccion, SqlWhere: String);
    procedure Do_ArmarOrdenamiento(var Ordenamiento, SqlOrderBy: String);
    procedure Do_Limpiar;
    function Get_EventosCitacionRevMed: string;
    function Validar_ListadoConsultorio: boolean;
    procedure Do_ImprimirExportar_Cons(sBoton: string); // TK 18935
  public
    procedure OnfraEmpresaChange(Sender: TObject);
    procedure OnfraTrabajadorChange(Sender: TObject);
  end;

const
  cIMPRIMIR = 'Imprimir';
  cEXPORTAR = 'Exportar';

var
  frmListGralSegIncapacidades: TfrmListGralSegIncapacidades;

implementation

uses
  AnsiSql, Cuit, StrFuncs, unComunes, unSesion, CustomDlgs, unDmPrincipal, unArt,
  ARTDataBase, unPrincipal, unVisualizador, VCLExtra, unTercerizadoras;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.FormCreate(Sender: TObject);
begin
  inherited;

  IMG_FILTROS_SHOW := 17;
  IMG_FILTROS_HIDE := 18;

  with fraComisionDesde do
  begin
    TableName   := 'SIN.SCM_COMISIONMEDICA';
    FieldID     := 'CM_ID';
    FieldCodigo := 'CM_CODIGO';
    FieldDesc   := 'CM_DESCRIPCION';
    FieldBaja   := 'CM_FECHABAJA';
    ShowBajas   := True;
    OrderBy     := CD_ALIAS_CODIGO;
  end;

  with fraComisionHasta do
  begin
    TableName   := 'SIN.SCM_COMISIONMEDICA';
    FieldID     := 'CM_ID';
    FieldCodigo := 'CM_CODIGO';
    FieldDesc   := 'CM_DESCRIPCION';
    FieldBaja   := 'CM_FECHABAJA';
    ShowBajas   := True;
    OrderBy     := CD_ALIAS_CODIGO;
  end;

  with fraCodEventoDesde do
  begin
    TableName   := 'SIN.SEI_EVENTOINCAPACIDAD';
    FieldID     := 'EI_ID';
    FieldCodigo := 'EI_CODIGO';
    FieldDesc   := 'EI_DESCRIPCION';
    FieldBaja   := 'EI_FECHABAJA';
    ShowBajas   := True;
    OrderBy     := CD_ALIAS_CODIGO;
  end;

  with fraCodEventoHasta do
  begin
    TableName   := 'SIN.SEI_EVENTOINCAPACIDAD';
    FieldID     := 'EI_ID';
    FieldCodigo := 'EI_CODIGO';
    FieldDesc   := 'EI_DESCRIPCION';
    FieldBaja   := 'EI_FECHABAJA';
    ShowBajas   := True;
    OrderBy     := CD_ALIAS_CODIGO;
  end;

  with fraUbicacionDesde do
  begin
    TableName   := 'SIN.SUI_UBICACIONINCAPACIDAD';
    FieldID     := 'UI_ID';
    FieldCodigo := 'UI_CODIGO';
    FieldDesc   := 'UI_DESCRIPCION';
    FieldBaja   := 'UI_FECHABAJA';
    ShowBajas   := True;
    OrderBy     := CD_ALIAS_CODIGO;
  end;

  with fraUbicacionHasta do
  begin
    TableName   := 'SIN.SUI_UBICACIONINCAPACIDAD';
    FieldID     := 'UI_ID';
    FieldCodigo := 'UI_CODIGO';
    FieldDesc   := 'UI_DESCRIPCION';
    FieldBaja   := 'UI_FECHABAJA';
    ShowBajas   := True;
    OrderBy     := CD_ALIAS_CODIGO;
  end;

  with fraCodDescMedicoDesde do
  begin
    TableName   := 'MAU_AUDITORES';
    FieldID     := 'AU_AUDITOR';
    FieldCodigo := 'AU_AUDITOR';
    FieldDesc   := 'AU_NOMBRE';
    FieldBaja   := 'AU_FBAJA';
    ShowBajas   := True;
    OrderBy     := CD_ALIAS_CODIGO;
  end;

  with fraConsMedico do         // TK 18935
  begin
    TableName   := 'MAU_AUDITORES';
    FieldID     := 'AU_AUDITOR';
    FieldCodigo := 'AU_AUDITOR';
    FieldDesc   := 'AU_NOMBRE';
    FieldBaja   := 'AU_FBAJA';
    ShowBajas   := True;
    OrderBy     := CD_ALIAS_CODIGO;
  end;

  with fraCodDescMedicoHasta do
  begin
    TableName   := 'MAU_AUDITORES';
    FieldID     := 'AU_AUDITOR';
    FieldCodigo := 'AU_AUDITOR';
    FieldDesc   := 'AU_NOMBRE';
    FieldBaja   := 'AU_FBAJA';
    ShowBajas   := True;
    OrderBy     := CD_ALIAS_CODIGO;
  end;

  with fraCtbTipoAccidente do
  begin
    Clave     := 'STIPO';
    ShowBajas := True;
    OrderBy   := CD_ALIAS_CODIGO;
  end;

  with fraEmpresa do
  begin
    OnChange  := OnfraEmpresaChange;
    ShowBajas := True;
  end;

  with fraTrabajador do
  begin
    OnChange  := OnfraTrabajadorChange;
    ShowBajas := True;
  end;

  Do_Limpiar;
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.Do_Limpiar;
begin
  fraEmpresa.Clear;
  fraTrabajador.Clear;
  edFechaEventoDesde.Clear;
  edFechaEventoHasta.Clear;
  edFechaSinDesde.Clear;
  edFechaSinHasta.Clear;
  edSiniestroDesde.Clear;
  edSiniestroHasta.Clear;
  fraCodEventoDesde.Clear;
  fraCodEventoHasta.Clear;
  fraComisionDesde.Clear;
  fraComisionHasta.Clear;
  fraUbicacionDesde.Clear;
  fraUbicacionHasta.Clear;
  fraCodDescMedicoDesde.Clear;
  fraCodDescMedicoHasta.Clear;
  fraCtbTipoAccidente.Value   := '1';  // LUGAR DE TRABAJO
  rgCaracterIncapac.ItemIndex := 2;    // Todos
  rgTratamiento.ItemIndex     := 2;    // Todos
  chkSoloUltEstado.Checked    := False;
  tbListadoConsultorio.Enabled := False;  // TK 18935
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.OnfraEmpresaChange(Sender: TObject);
begin
//  fraTrabajador.CUIL := fraEmpresa.Value;
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.OnfraTrabajadorChange(Sender: TObject);
begin
//  fraEmpresa.Value := fraTrabajador.Cuit;
end;
{------------------------------------------------------------------------------}
function TfrmListGralSegIncapacidades.Get_DescripDesdeHasta(Titulo: String; Desde, Hasta: TDateTime): String;
var
  sDescripcion: String;
begin
  if (Desde > 0) and (Hasta > 0) then
    sDescripcion :=  Titulo + DateToStr(Desde) + ' al ' + DateToStr(Hasta)
  else if Desde > 0 then
    sDescripcion :=  Titulo + 'desde ' + DateToStr(Desde)
  else if Hasta > 0 then
    sDescripcion :=  Titulo + 'hasta ' + DateToStr(Hasta);

  Result := sDescripcion + ' / ';
end;
{------------------------------------------------------------------------------}
function TfrmListGralSegIncapacidades.Get_DescripDesdeHasta(Titulo, Desde, Hasta: String): String;
var
  sDescripcion: String;
begin
  if (Desde <> '') and (Hasta <> '') then
    sDescripcion :=  Titulo + Desde + ' al ' + Hasta
  else if Desde <> '' then
    sDescripcion :=  Titulo + 'desde ' + Desde
  else if Hasta <> '' then
    sDescripcion :=  Titulo + 'hasta ' + Hasta;

  Result := sDescripcion + ' / ';
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.Do_ArmarSeleccion(var Seleccion, SqlWhere: String);
var
  sAccidente, sSeleccion, sSqlWhere: String;
begin
  sSeleccion := '';
  sSqlWhere  := '';

  if fraEmpresa.IsSelected then          // por CUIT
  begin
    sSeleccion := sSeleccion + 'Cuit: ' + PonerGuiones( fraEmpresa.CUIT ) + ' / ';
    sSqlWhere  := sSqlWhere + 'EX_CUIT=' + SqlValue( fraEmpresa.CUIT ) + ' AND ';
  end;

  if fraTrabajador.IsSelected then       // por CUIL
  begin
    sSeleccion := sSeleccion + 'Cuil: ' + PonerGuiones( fraTrabajador.CUIL  ) + ' / ';
    sSqlWhere  := sSqlWhere + 'EX_CUIL=' + SqlValue( fraTrabajador.CUIL ) + ' AND ';
  end;

  if chkSoloUltEstado.Checked then       // sólo mostrar el último estado
  begin
    sSeleccion := sSeleccion + 'Sólo Ult. Estado' + ' / ';
    sSqlWhere  := sSqlWhere + ' TO_CHAR(a.ev_fecha, ''YYYYMMDD'') || TO_CHAR(a.ev_evento, ''000'')=' +
                                ' (SELECT MAX(TO_CHAR(b.ev_fecha, ''YYYYMMDD'') || TO_CHAR(b.ev_evento, ''000''))' +
                                   ' FROM sev_eventosdetramite b' +
                                  ' WHERE b.ev_siniestro=a.ev_siniestro' +
                                    ' AND b.ev_orden=a.ev_orden' +
                                    ' AND b.ev_recaida=a.ev_recaida' +
                                    ' AND b.ev_evento>0' +
                                    ' AND b.ev_codigo=' +
                                    ' (SELECT c.ev_codigo' +
                                       ' FROM sev_eventosdetramite c' +
                                      ' WHERE c.ev_siniestro=a.ev_siniestro' +
                                        ' AND c.ev_orden=a.ev_orden' +
                                        ' AND c.ev_recaida=a.ev_recaida' +
                                        ' AND c.ev_evento=0)) and ';
  end;

  if not (edFechaEventoDesde.IsEmpty and edFechaEventoHasta.IsEmpty) then     // por rango de F. de evento
  begin
    sSeleccion := sSeleccion + Get_DescripDesdeHasta( 'F. de Evento: ', edFechaEventoDesde.Date, edFechaEventoHasta.Date );
    if (edFechaEventoDesde.Date = edFechaEventoHasta.Date) then
      sSqlWhere := sSqlWhere + ' A.EV_FECHA = ' + SqlDate(edFechaEventoDesde.Date) + ' AND '
    else
      sSqlWhere := sSqlWhere + SqlBetweenDateTime( 'A.EV_FECHA', edFechaEventoDesde.Date, edFechaEventoHasta.Date ) + ' AND ';

  end;

  if fraCodEventoDesde.IsSelected or fraCodEventoHasta.IsSelected then  // por rango de cód. de evento
  begin
    sSeleccion := sSeleccion + Get_DescripDesdeHasta( 'Cód. de Evento: ', fraCodEventoDesde.Codigo, fraCodEventoHasta.Codigo );
    sSqlWhere  := sSqlWhere + SqlBetween( 'A.EV_CODIGO', fraCodEventoDesde.Codigo, fraCodEventoHasta.Codigo ) + ' AND ';
  end;

  if rgCaracterIncapac.ItemIndex = 0 then                // por caracter provisorio
  begin
    sSeleccion := sSeleccion + 'Sólo Caracter Provis.' + ' / ';
    sSqlWhere  := sSqlWhere + 'A.EV_CARACTER=''P'' AND ';
  end
  else if rgCaracterIncapac.ItemIndex = 1 then           //             definitivo
  begin
    sSeleccion := sSeleccion + 'Sólo Caracter Defin.' + ' / ';
    sSqlWhere  := sSqlWhere + 'A.EV_CARACTER=''D'' AND ';
  end;

  if not (edSiniestroDesde.IsEmpty and edSiniestroHasta.IsEmpty) then         // por rango de siniestro
  begin
    sSeleccion := sSeleccion + Get_DescripDesdeHasta( 'Siniestro: ', edSiniestroDesde.SiniestroS, edSiniestroHasta.SiniestroS );
    sSqlWhere  := sSqlWhere + SqlBetween( 'EX_SINIESTRO', edSiniestroDesde.Siniestro, edSiniestroHasta.Siniestro ) + ' AND ';
  end;

  if not (edFechaSinDesde.IsEmpty and edFechaSinHasta.IsEmpty) then           // por rango de F. de accidente
  begin
    sSeleccion := sSeleccion + Get_DescripDesdeHasta( 'F. de Siniestro: ', edFechaSinDesde.Date, edFechaSinHasta.Date );
    sSqlWhere  := sSqlWhere + SqlBetweenDateTime( 'EX_FECHAACCIDENTE', edFechaSinDesde.Date, edFechaSinHasta.Date ) + ' AND ';
  end;

  if rgTratamiento.ItemIndex = 0 then             // con tratamiento
  begin
    sSeleccion := sSeleccion + 'Sólo con Tratamiento' + ' / ';
    sSqlWhere  := sSqlWhere + 'A.EV_TRATAMIENTO=''S'' AND ';
  end
  else if rgTratamiento.ItemIndex = 1 then        // sin tratamiento
  begin
    sSeleccion := sSeleccion + 'Sólo sin Tratamiento' + ' / ';
    sSqlWhere  := sSqlWhere + 'NVL(A.EV_TRATAMIENTO, ''N'')=''N'' AND ';
  end;

  if fraComisionDesde.IsSelected or fraComisionHasta.IsSelected then      // por rango de cód. de comisión médica
  begin
    sSeleccion := sSeleccion + Get_DescripDesdeHasta( 'Cód. de Comis. Médica: ', fraComisionDesde.Codigo, fraComisionHasta.Codigo );
    sSqlWhere  := sSqlWhere + SqlBetween( 'A.EV_COMISION', fraComisionDesde.Codigo, fraComisionHasta.Codigo ) + ' AND ';
  end;

  if fraCodDescMedicoDesde.IsSelected or fraCodDescMedicoHasta.IsSelected then    // por rango de cód. de auditor
  begin
    sSeleccion := sSeleccion + Get_DescripDesdeHasta( 'Cód. de Médico: ', fraCodDescMedicoDesde.Value, fraCodDescMedicoHasta.Value );
    sSqlWhere  := sSqlWhere + SqlBetween( 'A.EV_MEDICO', fraCodDescMedicoDesde.Value, fraCodDescMedicoHasta.Value ) + ' AND ';
  end;

  if fraUbicacionDesde.IsSelected or fraUbicacionHasta.IsSelected then  // por rango de cód. de ubicación de la incapacidad
  begin
    sSeleccion := sSeleccion + Get_DescripDesdeHasta( 'Cód. de Ubic. Incapac.: ', fraUbicacionDesde.Codigo, fraUbicacionHasta.Codigo );
    sSqlWhere  := sSqlWhere + SqlBetween( 'A.EV_CODUBIC', fraUbicacionDesde.Codigo, fraUbicacionHasta.Codigo ) + ' AND ';
  end;

  sAccidente := '';
  if fraCtbTipoAccidente.Value = '1' then         // lugar de trabajo
  begin
    sAccidente := '''1'','' ''';
    sSeleccion := sSeleccion + 'T. Accid.: Lug. Trab. / ';
  end
  else if fraCtbTipoAccidente.Value = '2' then    // in itinere
  begin
    sAccidente := '''2''';
    sSeleccion := sSeleccion + 'T. Accid.: In Itin. / ';
  end
  else if fraCtbTipoAccidente.Value = '3' then    // enf. profesional
  begin
    sAccidente := '''3''';
    sSeleccion := sSeleccion + 'T. Accid.: Enf. Prof. / ';
  end;
  if sAccidente <> '' then
    sSqlWhere := sSqlWhere + 'EX_TIPO IN (' + sAccidente + ') AND ';

  (*if not (edFechaCitacionDesde.IsEmpty and edFechaCitacionHasta.IsEmpty) then     // por rango de F. de citación
    begin
      sSeleccion := sSeleccion + Get_DescripDesdeHasta( 'F. de Citación: ', edFechaCitacionDesde.Date, edFechaCitacionHasta.Date );
      sSqlWhere  := sSqlWhere + SqlBetweenDateTime( 'A.EV_FECHACITACION', edFechaCitacionDesde.Date, edFechaCitacionHasta.Date ) + ' AND ';
    end;*)

  sSeleccion := StrLeft(sSeleccion, (Length(sSeleccion) - 3));
  Seleccion  := sSeleccion;
  SqlWhere   := sSqlWhere;
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.Do_ArmarOrdenamiento(var Ordenamiento, SqlOrderBy: String);
var
  sOrderBy, sOrdernamiento: String;
begin
  case rgOrden.ItemIndex of
    0: begin    // CUIT-CUIL-Nº siniestro-orden (-evento-f. evento-nro.evento)
        sOrderBy       := 'MP_CUIT, MP_CUIL, MP_SINIESTRO, MP_ORDEN, MP_CODEVENTO, MP_FECHA, MP_EVENTO';
        sOrdernamiento := 'CUIT-CUIL-Nro. Siniestro-Orden';
      end;
    1: begin    // Nº siniestro-orden (-evento-f. evento-nro.evento)
        sOrderBy       := 'MP_SINIESTRO, MP_ORDEN, MP_CODEVENTO, MP_FECHA, MP_EVENTO';
        sOrdernamiento := 'Nro. Siniestro-Orden';
      end;
    2: begin    // F. evento-Nº siniestro-orden
        sOrderBy       := 'MP_FECHA, MP_SINIESTRO, MP_ORDEN';
        sOrdernamiento := 'F. Evento-Nro. Siniestro-Orden';
      end;
    3: begin    // F. siniestro-Nº siniestro-orden (-evento-f. evento-nro.evento)
        sOrderBy       := 'MP_FECHAACCIDENTE, MP_SINIESTRO, MP_ORDEN, MP_CODEVENTO, MP_FECHA, MP_EVENTO';
        sOrdernamiento := 'F. Siniestro-Nro. Siniestro-Orden';
      end;
    4: begin    // Cód. evento-Nº siniestro-orden
        sOrderBy       := 'MP_CODEVENTO, MP_SINIESTRO, MP_ORDEN';
        sOrdernamiento := 'Cód. Evento-Nro. Siniestro-Orden';
      end;
  end;
  Ordenamiento := sOrdernamiento;
  SqlOrderBy   := sOrderBy;
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.Do_Borrar_GralIncapacidades;
begin
  Do_LimpiarTablaTemporal('TMP_GRALINCAPACIDADES', 'MP_USUARIO', Sesion.UserId);
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  Do_Limpiar;
  fraEmpresa.edContrato.SetFocus;
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.tbExportarClick(Sender: TObject);
begin
  ExportDialog.Execute;
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.tbRefrescarClick(Sender: TObject);
var
  sSql, sSqlWhere, sSeleccion: String;
begin
  Do_ArmarSeleccion( sSeleccion, sSqlWhere );

  if sSeleccion = '' then
    InfoHint(nil, 'Debe indicar algún criterio de selección')
  else
    begin
      Do_Borrar_GralIncapacidades;

      sSql := 'INSERT INTO tmp_gralincapacidades(' +
                     ' mp_siniestro, mp_orden, mp_cuit,' +
                     ' mp_nombreempr, mp_cuil, mp_nombretrab, mp_codevento,' +
                     ' mp_descrevento, mp_fecha, mp_hora, mp_porcincapacidad,' +
                     ' mp_grado, mp_caracter, mp_graninc, mp_retroactivo,' +
                     ' mp_fechaaccidente, mp_motivodescr, mp_comisiondescr,' +
                     ' mp_nombreaudit, mp_fechavencimiento, mp_tratamiento,' +
                     ' mp_ubicincapdescr, mp_observaciones, mp_evento,' +
                     ' mp_expedincapacidad, mp_altamedicarec, mp_usuario,' +
                     ' mp_diagnostico, mp_descreventoult, mp_descrtipoacc,' +
                     ' mp_fechacitacion, mp_maxeventoporfecha, mp_codauditor, mp_fechaaltaev)' +    // TK 18935
              ' SELECT ex_siniestro, ex_orden, cuit_ponerguiones(ex_cuit), em_nombre,' +
                     ' cuit_ponerguiones(ex_cuil), tj_nombre, a.ev_codigo, evento.ei_descripcion,' +
                     ' a.ev_fecha, decode(a.ev_hora, ''__:__'', null, a.ev_hora), a.ev_porcincapacidad,' +
                     ' a.ev_grado, a.ev_caracter, a.ev_graninc, a.ev_retroactivo, ex_fechaaccidente,' +
                     ' mi_descripcion, cm_descripcion,' +
                     ' au_nombre, a.ev_fechavencimiento, a.ev_tratamiento,' +
                     ' ui_descripcion, a.ev_observaciones, a.ev_evento, ' +
                     ' art.sin.get_expedincapacidadseginc(a.ev_siniestro, a.ev_orden, a.ev_recaida),' +
                     ' art.sin.getaltamedultrecpegreso (ex_siniestro, ex_orden),' +
                       SqlValue(Sesion.UserId) + ', ex_diagnostico,' +
                     ' eventoult.ei_descripcion, ctbtipoacc.tb_descripcion, ' +
                     ' a.ev_fechacitacion, ulteventofecha.ei_descripcion, au_auditor, a.ev_fechaalta ' +   // TK 18935
                ' FROM sev_eventosdetramite a, sex_expedientes,' +
                     ' aem_empresa, ctj_trabajador, mau_auditores,' +
                     ' sin.smi_motivoincapacidad, sin.scm_comisionmedica,' +
                     ' sin.sui_ubicacionincapacidad, sin.sei_eventoincapacidad evento,' +
                     ' sin.sei_eventoincapacidad eventoult, sev_eventosdetramite d,' +
                     ' ctb_tablas ctbtipoacc, sin.sei_eventoincapacidad ulteventofecha' +
               ' WHERE ' + sSqlWhere +
                     ' ex_siniestro=a.ev_siniestro ' +
                 ' AND ex_orden=a.ev_orden ' +
                 ' AND ex_recaida=0 ' +
                 ' AND ex_cuit=em_cuit ' +
                 ' AND ex_cuil=tj_cuil ' +
                 ' AND a.ev_medico=au_auditor(+) ' +
                 ' AND mi_codigo(+)=a.ev_motivo ' +
                 ' AND cm_codigo(+) = a.ev_comision ' +
                 ' AND ui_codigo(+)=a.ev_codubic ' +
                 ' AND evento.ei_codigo(+)=a.ev_codigo ' +
                 ' AND NVL(ex_causafin, ''0'')<>''99'' ' +
                 ' AND a.ev_evento>0 ' +
                 ' AND d.ev_siniestro(+)=a.ev_siniestro ' +
                 ' AND d.ev_orden(+)=a.ev_orden ' +
                 ' AND d.ev_recaida(+)=a.ev_recaida ' +
                 ' AND d.ev_evento(+)=0 ' +
                 ' AND eventoult.ei_codigo(+)=d.ev_codigo ' +
                 ' AND ctbtipoacc.tb_codigo(+)=ex_tipo ' +
                 ' AND ctbtipoacc.tb_clave(+)=''STIPO'' ' +
                 ' AND ulteventofecha.ei_codigo(+)=art.utiles.get_maxeventoporfecha(a.ev_siniestro, a.ev_orden, a.ev_recaida)';

      if EsUsuarioDeTercerizadora then
        sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SQLValue(Sesion.UserID) + ') = ''S'' ';

      EjecutarSql(sSql);

      sSql := 'SELECT *' +
               ' FROM tmp_gralincapacidades' +
              ' WHERE mp_usuario = ' + SqlValue(Sesion.UserId);
      sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
      tbListadoConsultorio.Enabled := True;  // TK 18935
      inherited;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('MP_PORCINCAPACIDAD') is TFloatField then
     TFloatField(sdqConsulta.FieldByName('MP_PORCINCAPACIDAD')).DisplayFormat := '% 0.000;-% 0.000';
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.tbImprimirClick(Sender: TObject);
var
  sSeleccion, sSqlWhere, sOrdenamiento, sSqlOrderBy, sSql: String;
begin
  Do_ArmarSeleccion(sSeleccion, sSqlWhere);
  Do_ArmarOrdenamiento(sOrdenamiento, sSqlOrderBy);
  sSql := 'SELECT * ' +
           ' FROM tmp_gralincapacidades ' +
          ' WHERE mp_usuario = ' + SqlValue(Sesion.UserId) +
          ' ORDER BY ' + sSqlOrderBy;
  qrlSeleccion.Caption  := sSeleccion;
  qrlOrden.Caption      := sOrdenamiento;
  sdqReporte.Close;
  sdqReporte.SQL.Text   := sSql;
  sdqReporte.Open;
  Visualizar(qrListGralInca, GetValores('Listado General de Incapacidades'),
             [oForceDB, oForceShowModal, oAlwaysShowDialog]);
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.tbSalir2Click(Sender: TObject);
begin
  close;
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.tbListadoConsultorioClick(Sender: TObject);  // TK 18935
begin
  with fpListadoConsultorio do
  begin
    edConsFechaEvento.Clear;
    fraConsMedico.Clear;
    ShowModal;
  end;
end;
{------------------------------------------------------------------------------}
function TfrmListGralSegIncapacidades.Get_EventosCitacionRevMed: string;
var sSql, sEventos: string;
begin
  sSql := 'SELECT ei_codigo ' +
           ' FROM sin.sei_eventoincapacidad ' +
          ' WHERE ei_citarevmed = ''S'' ';
  with GetQuery(sSql) do
  try
    sEventos := '(';
    prior;
    while not Eof do
    begin
      sEventos := sEventos + '''' + FieldByName('EI_CODIGO').AsString + ''', ';
      next;
    end;
    sEventos := StrLeft(sEventos, Length(sEventos) - 2) + ') ';
  finally
    free;
  end;
  Result := sEventos;
end;

{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.btnConsImprimirClick(Sender: TObject);  // TK 18935
begin
  Do_ImprimirExportar_Cons(cIMPRIMIR);
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.btnConsExportarClick(Sender: TObject);  // TK 18935
begin
  Do_ImprimirExportar_Cons(cEXPORTAR);
end;

{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.Do_ImprimirExportar_Cons(sBoton: string);   // TK 18935
var
  sSeleccion, sSqlWhere, sOrdenamiento, sSqlOrderBy: String;
begin
  if Validar_ListadoConsultorio then
  begin
    Do_ArmarSeleccion(sSeleccion, sSqlWhere);
    Do_ArmarOrdenamiento(sOrdenamiento, sSqlOrderBy);


    qrlFecha.Caption  := FormatDateTime('dddd d ''de'' MMMM ''de'' yyyy', edConsFechaEvento.Date);
    qrlMedico.Caption := fraConsMedico.Descripcion;
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

    sdqReporteListadosConsult.SQL.Text := 'SELECT * ' +
                                           ' FROM art.tmp_gralincapacidades ' +
                                          ' WHERE mp_usuario = ' + SqlValue(Sesion.UserId) +
                                            ' AND mp_fecha =  ' + SqlDate(edConsFechaEvento.Date) +
                                            ' AND mp_codevento IN ' + Get_EventosCitacionRevMed +
                                            ' AND mp_codauditor = ' + SqlInt(fraConsMedico.edCodigo.Text) +
                                       ' ORDER BY ' + sSqlOrderBy;
    OpenQuery(sdqReporteListadosConsult);

    if sBoton = cIMPRIMIR then
      qrDetalleConsultorio.Preview
    else
      ExportDialog_ListConsult.Execute;

    fpListadoConsultorio.ModalResult := mrOk;
  end;
end;
{------------------------------------------------------------------------------}
function TfrmListGralSegIncapacidades.Validar_ListadoConsultorio: boolean;    // TK 18935
begin
  Verificar(edConsFechaEvento.IsEmpty, edConsFechaEvento, 'Debe completar la Fecha de Evento');
  Verificar(fraConsMedico.IsEmpty, fraConsMedico, 'Debe completar el Médico');
  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmListGralSegIncapacidades.ExportDialog_ListConsultBeforeExport(Sender: TObject); // TK 18935
begin
//  ExportDialog_ListConsult.AddEolSeparator := true;
  ExportDialog_ListConsult.Title := 'Listado de Consultorio por Médico' + ' - ' +
                                   // ExportDialog_ListConsult.EolChar +
                                    'Fecha Evento: ' + FormatDateTime('dddd d ''de'' MMMM ''de'' yyyy', edConsFechaEvento.Date) + ' - ' +
                                  //  ExportDialog_ListConsult.EolChar +
                                    'Médico: ' + fraConsMedico.Descripcion;

end;


end.

