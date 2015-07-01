unit unInformesSiniestralidad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, ExtCtrls,
  PeriodoPicker, AdvPanel, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, unFraCodigoDescripcion, unFraActividad,
  unFraStaticCodigoDescripcion, unInfSiniestralidad, Excel2000, OleServer,
  Menus, ShortCutControl, ComCtrls, ToolWin;

type
  TfrmInformesSiniestralidad = class(TfrmCustomForm)
    Panel1: TPanel;
    grpTipoActu: TGroupBox;
    grpTipoInforme: TGroupBox;
    Panel2: TPanel;
    grpTipoAccidente: TGroupBox;
    grpAlta: TGroupBox;
    Panel3: TPanel;
    grpSeleccion: TGroupBox;
    ggrpEmpresa: TGroupBox;
    grpTipoCuadro: TGroupBox;
    Panel4: TPanel;
    grpTipoSeleccion: TGroupBox;
    grpTipoIndice: TGroupBox;
    grpRangoPeriodos: TGroupBox;
    Panel5: TPanel;
    rbtCuadroOMS: TRadioButton;
    rbtEvolMensual: TRadioButton;
    rbtInfGralSiniestos: TRadioButton;
    rbtIndicesVarios: TRadioButton;
    rbtMensual: TRadioButton;
    rbtEnLinea: TRadioButton;
    rbtPorEmpresa: TRadioButton;
    rbtPorCIIU: TRadioButton;
    rbtPorHolding: TRadioButton;
    rbtPorTodos: TRadioButton;
    rbtLugarTrabajo: TRadioButton;
    rbtItinere: TRadioButton;
    rbtEnfProfes: TRadioButton;
    rbtTipoAccTodos: TRadioButton;
    chkAltaLaboral: TCheckBox;
    rbtValAbso: TRadioButton;
    rbtImpoRelat: TRadioButton;
    rbtAmbos: TRadioButton;
    rbtCantSiniestros: TRadioButton;
    rbtCantDiasCaidos: TRadioButton;
    rbtGravesMortales: TRadioButton;
    rbtIncapacidades: TRadioButton;
    dtHasta: TPeriodoPicker;
    dtDesde: TPeriodoPicker;
    lblDesde: TLabel;
    lblHasta: TLabel;
    fraEmpresa: TfraEmpresa;
    fraActividad: TfraActividad;
    fraHolding: TfraStaticCodigoDescripcion;
    ExcelApplication: TExcelApplication;
    pmnuImprimir: TPopupMenu;
    mnuImprimirPDF: TMenuItem;
    mnuImprimirExcel: TMenuItem;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbImprimir: TToolButton;
    ToolButton11: TToolButton;
    tbSalir: TToolButton;
    ShortCutControl: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure rbtCuadroOMSClick(Sender: TObject);
    procedure rbtEvolMensualClick(Sender: TObject);
    procedure rbtPorHoldingClick(Sender: TObject);
    procedure rbtIndicesVariosClick(Sender: TObject);
    procedure rbtInfGralSiniestosClick(Sender: TObject);
    procedure rbtPorCIIUClick(Sender: TObject);
    procedure rbtPorEmpresaClick(Sender: TObject);
    procedure rbtPorTodosClick(Sender: TObject);
    procedure rbtEnLineaClick(Sender: TObject);
    procedure rbtMensualClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirExcelClick(Sender: TObject);
  private
    LCID_1: LCID;
    FPathDestino : String;
    FVerValidaciones: boolean;
    procedure HabilitarControlesTodos;
    function Validar: Boolean;
    function Mostrar_Reporte(TipoInforme: TTipoInforme; Contrato: Integer; Actividad, Holding, NombreArchivo: String; EsPDF: Boolean): Boolean;
    function Mostrar_PDF(TipoInforme: TTipoInforme; Contrato: Integer; Actividad, Holding, NombreArchivo: String): Boolean;
    function Mostrar_Excel(TipoInforme: TTipoInforme; Contrato: Integer; Actividad, Holding, NombreArchivo: String): Boolean;
    function Generar_Reporte(TipoInforme: TTipoInforme; TipoSeleccion: TTipoSeleccion; TipoAccidente: TTipoAccidente; TipoCuadro: TTipoCuadro; TipoSeleccionCant: TTipoSeleccionCant; Contrato: Integer; Cuit, Actividad, Holding: String; SoloAltaLaboral: Boolean; TipoActualizacion: TTipoActualizacion; FechaActualizacion, PerDesde, PerHasta: String; var NomArchivoDest: String): Boolean;
  public
    property VerValidaciones: boolean read FVerValidaciones write FVerValidaciones;
  published
    property PathDestino  : String   read FPathDestino  write FPathDestino;// Va el path que se va a guardar el archivo(incluyendo \) y no se muestra
  end;

var
  frmInformesSiniestralidad: TfrmInformesSiniestralidad;

implementation

uses
  VCLExtra, CustomDlgs, unSesion, AnsiSql, Periodo, unDmPrincipal, unExportPDF,
  unEspera, unExcel, General;

{$R *.dfm}

procedure TfrmInformesSiniestralidad.FormCreate(Sender: TObject);
begin
  inherited;

  PathDestino := '';
  fraActividad.ExtraCondition := '';
  HabilitarControlesTodos;
  rbtCuadroOMSClick(Sender);
  FVerValidaciones := true;

  fraHolding.ShowBajas := True;

  with fraEmpresa do
  begin
    ShowBajas := True;
    ExtraCondition := 'AND ART.SIN.INCLUIREMPRESA_INFSINIESTRAL(EM_CUIT, ' + SqlValue(Sesion.UserId) + ') = ''S'' ';
  end;

  with fraHolding do
  begin
    TableName       := 'GE_ID';
    FieldCodigo     := 'GE_CODIGO';
    FieldDesc       := 'GE_DESCRIPCION';
    FieldBaja       := 'GE_FECHABAJA';
    ExtraCondition  := ' AND ge_temporal IS NULL ';
  end;

  LockControls([fraActividad, fraHolding]);

  LCID_1 := LOCALE_USER_DEFAULT;
end;

procedure TfrmInformesSiniestralidad.HabilitarControlesTodos;
var
  i: integer;
begin
  for i := 0 to frmInformesSiniestralidad.ComponentCount-1 do
  begin
    if frmInformesSiniestralidad.Components[i] is TCheckBox
        or (frmInformesSiniestralidad.Components[i] is TRadioButton)
        or (frmInformesSiniestralidad.Components[i] is TPeriodoPicker) then
      LockControl(TWinControl(frmInformesSiniestralidad.Components[i]), False);
  end;

  lblDesde.Enabled := True;
  lblHasta.Enabled := True;
end;

procedure TfrmInformesSiniestralidad.rbtCuadroOMSClick(Sender: TObject);
begin
  HabilitarControlesTodos;
  LockControls([rbtGravesMortales, rbtIncapacidades, dtHasta, dtDesde]);
  rbtMensual.Checked := True;
  dtDesde.Clear;
  dtHasta.Clear;
  lblDesde.Enabled := False;
  lblHasta.Enabled := False;
end;

procedure TfrmInformesSiniestralidad.rbtEvolMensualClick(Sender: TObject);
begin
  HabilitarControlesTodos;
  LockControls(
      [rbtMensual, rbtEnLinea,
       rbtLugarTrabajo, rbtEnfProfes, rbtItinere, rbtTipoAccTodos,
       chkAltaLaboral,
       rbtValAbso, rbtAmbos, rbtImpoRelat,
       rbtCantSiniestros, rbtCantDiasCaidos,
       rbtGravesMortales, rbtIncapacidades,
       rbtPorHolding, fraHolding]);

  rbtPorEmpresa.Checked := True;
  rbtMensual.Checked := True;
end;

procedure TfrmInformesSiniestralidad.rbtIndicesVariosClick(Sender: TObject);
begin
  HabilitarControlesTodos;
  LockControls(
      [rbtMensual, rbtEnLinea,
       rbtLugarTrabajo, rbtEnfProfes, rbtItinere, rbtTipoAccTodos,
       chkAltaLaboral,
       rbtValAbso, rbtAmbos, rbtImpoRelat,
       rbtCantSiniestros, rbtCantDiasCaidos,
       rbtPorHolding, fraHolding]);

  rbtPorEmpresa.Checked := True;
  rbtMensual.Checked := True;
end;

procedure TfrmInformesSiniestralidad.rbtInfGralSiniestosClick(Sender: TObject);
begin
  HabilitarControlesTodos;
  LockControls(
      [rbtLugarTrabajo, rbtEnfProfes, rbtItinere, rbtTipoAccTodos,
       chkAltaLaboral,
       rbtValAbso, rbtAmbos, rbtImpoRelat,
       rbtCantSiniestros, rbtCantDiasCaidos,
       rbtGravesMortales, rbtIncapacidades,
       rbtPorTodos]);

  rbtPorTodos.Checked := False;
end;

procedure TfrmInformesSiniestralidad.rbtPorCIIUClick(Sender: TObject);
begin
  LockControls([fraEmpresa, fraHolding]);
  LockControl(fraActividad, False);

  fraEmpresa.Clear;
  fraHolding.Clear;
end;

procedure TfrmInformesSiniestralidad.rbtPorEmpresaClick(Sender: TObject);
begin
  LockControl(fraEmpresa, False);
  LockControls([fraActividad, fraHolding]);

  fraActividad.Clear;
  fraHolding.Clear;
end;

procedure TfrmInformesSiniestralidad.rbtPorTodosClick(Sender: TObject);
begin
  LockControls([fraEmpresa, fraActividad, fraHolding]);

  fraEmpresa.Clear;
  fraActividad.Clear;
  fraHolding.Clear;
end;

procedure TfrmInformesSiniestralidad.rbtPorHoldingClick(Sender: TObject);
begin
  LockControls([fraEmpresa, fraActividad]);
  LockControl(fraHolding, False);

  fraEmpresa.Clear;
  fraActividad.Clear;
end;

function TfrmInformesSiniestralidad.Validar: Boolean;
var
  sMaxPeriodo: String;
begin
  Verificar(    (not rbtPorEmpresa.Checked)
            and (not rbtPorCIIU.Checked)
            and (not rbtPorHolding.Checked)
            and (not rbtPorTodos.Checked), rbtPorEmpresa,
            'Seleccionar al menos una opción del panel Selección.');

  Verificar(
      rbtPorEmpresa.Checked and fraEmpresa.IsEmpty, fraEmpresa,
      'Dato Empresa requerido para la selección actual.');

  Verificar(
      rbtPorCIIU.Checked and fraActividad.IsEmpty, fraActividad,
      'Dato Actividad requerido para la selección actual.');

  Verificar(
      rbtPorHolding.Checked and fraHolding.IsEmpty, fraHolding,
      'Dato Holding requerido para la selección actual.');

  Verificar(
      (
           ((not dtDesde.Periodo.IsNull) and (dtHasta.Periodo.IsNull))
        or ((dtDesde.Periodo.IsNull) and (not dtHasta.Periodo.IsNull))
        or (dtDesde.Periodo.Valor > dtHasta.Periodo.Valor)
      ), dtDesde,
      'Error en rango de Períodos.' + chr(13) +
      'Verifique que ambos períodos estén ingresados y ' +
      'que el Período Hasta no sea menor al Período Desde.');

  sMaxPeriodo := GetPeriodo(DBDate, fpAnioMes);
  Verificar(dtDesde.Periodo.Valor > sMaxPeriodo, dtDesde, 'El Período Desde no puede ser mayor que el período de la fecha actual.');
  Verificar(dtHasta.Periodo.Valor > sMaxPeriodo, dtHasta, 'El Período Hasta no puede ser mayor que el período de la fecha actual.');

  Verificar((rbtEvolMensual.Checked or rbtIndicesVarios.Checked) and not PuedeGenerarInformeSiniestral(), nil, 'No puede generar en este momento este informe pues se están actualizando alguno de sus datos.');

  Result := True;
end;

procedure TfrmInformesSiniestralidad.rbtEnLineaClick(Sender: TObject);
begin
  if rbtCuadroOMS.Checked then
  begin
    LockControls([dtHasta, dtDesde], False);
    lblDesde.Enabled := True;
    lblHasta.Enabled := True;
  end;
end;

procedure TfrmInformesSiniestralidad.rbtMensualClick(Sender: TObject);
begin
  if rbtCuadroOMS.Checked then
  begin
    dtDesde.Clear;
    dtHasta.Clear;
    lblDesde.Enabled := False;
    lblHasta.Enabled := False;
    LockControls([dtHasta, dtDesde]);
  end;
end;

function TfrmInformesSiniestralidad.Mostrar_Reporte(TipoInforme: TTipoInforme; Contrato: Integer; Actividad, Holding, NombreArchivo: String; EsPDF: Boolean): Boolean;
begin
  if EsPDF then
    Result := Mostrar_PDF(TipoInforme, Contrato, Actividad, Holding, NombreArchivo)
  else
    Result := Mostrar_Excel(TipoInforme, Contrato, Actividad, Holding, NombreArchivo);
end;

function TfrmInformesSiniestralidad.Mostrar_PDF(TipoInforme: TTipoInforme; Contrato: Integer; Actividad, Holding, NombreArchivo: String): Boolean;
var
  sArchivoPDF: String;
begin
  Result := False;

  if FileToPDFSvr(NombreArchivo) then
    begin
      sArchivoPDF := ChangeFileExt(NombreArchivo, '.PDF');
      if FileExists(sArchivoPDF) then
        Result := DoMostrarArchivo(TipoInforme, sArchivoPDF, Contrato, Actividad, Holding)
      else
        InfoHint(tbImprimir, 'No se encuentra el reporte en formato PDF.', False, 'Información', blnError, 10);
    end
  else
    InfoHint(tbImprimir, 'No se ha podido generar el reporte.', False, 'Información', blnError, 10);
end;

function TfrmInformesSiniestralidad.Mostrar_Excel(TipoInforme: TTipoInforme; Contrato: Integer; Actividad, Holding, NombreArchivo: String): Boolean;
begin
  Result := DoMostrarArchivo(TipoInforme, NombreArchivo, Contrato, Actividad, Holding)
end;

function TfrmInformesSiniestralidad.Generar_Reporte(TipoInforme: TTipoInforme; TipoSeleccion: TTipoSeleccion; TipoAccidente: TTipoAccidente; TipoCuadro: TTipoCuadro; TipoSeleccionCant: TTipoSeleccionCant; Contrato: Integer; Cuit, Actividad, Holding: String; SoloAltaLaboral: Boolean; TipoActualizacion: TTipoActualizacion; FechaActualizacion, PerDesde, PerHasta: String; var NomArchivoDest: String): Boolean;
var
  WorkBk: _WorkBook;
begin
  Result := False;

  NomArchivoDest := DoCopiarArchivo(TipoInforme);

  WorkBk := ExclOpen(ExcelApplication, NomArchivoDest, LCID_1);
  try
    case TipoInforme of
      tiCuadroOMSCIE10:
        Result := Generar_CuadroCie10(Cuit, Actividad, Holding, SoloAltaLaboral, TipoSeleccion, TipoAccidente, TipoCuadro, TipoSeleccionCant, TipoActualizacion, FechaActualizacion, PerDesde, PerHasta, WorkBk, FVerValidaciones);
      tiEvolMensTrabCubiertosSini:
        Result := Generar_CuadroEvolTrabajSiniestros(Contrato, Actividad, Holding, TipoSeleccion, FechaActualizacion, PerDesde, PerHasta, WorkBk);
      tiInformeGralSini:
        Result := Generar_CuadroInformeSiniestralidad(Contrato, Actividad, Holding, TipoSeleccion, TipoActualizacion, FechaActualizacion, PerDesde, PerHasta, WorkBk, LCID_1, FVerValidaciones);
      tiIndVariosGravesMortales, tiIndVariosIncapacidades:
        Result := Generar_CuadroIndicesVarios(TipoInforme, Contrato, Actividad, Holding, TipoSeleccion, FechaActualizacion, PerDesde, PerHasta, WorkBk);
    end;
  finally
    ExclClose(ExcelApplication, WorkBk, NomArchivoDest, LCID_1);
  end;
end;

procedure TfrmInformesSiniestralidad.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInformesSiniestralidad.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmInformesSiniestralidad.mnuImprimirExcelClick(Sender: TObject);
var
  TipoActualizacion: TTipoActualizacion;
  TipoSeleccion: TTipoSeleccion;
  TipoInforme: TTipoInforme;
  TipoAccidente: TTipoAccidente;
  TipoCuadro: TTipoCuadro;
  TipoSeleccionCant: TTipoSeleccionCant;
  sCuit, sActividad, sHolding, sFechaActualizacion, sPerDesde, sPerHasta: String;
  sNombreArchivo: String;
  iContrato: Integer;
  bPDF, bOK, bDobleReporte, bSoloAltaLaboral: Boolean;
begin
  if Validar() then
    begin
      bOk  := False;
      bPDF := (Sender = mnuImprimirPDF);

      TipoInforme := tiNinguno;
      if rbtCuadroOMS.Checked then                   // Cuadro de OMS-CIE10
        TipoInforme := tiCuadroOMSCIE10
      else if rbtEvolMensual.Checked then            // Evoluc. mens. de trabajad. cubiertos y siniestros
        TipoInforme := tiEvolMensTrabCubiertosSini
      else if rbtInfGralSiniestos.Checked then       // Informe general de siniestros
        TipoInforme := tiInformeGralSini
      else if rbtIndicesVarios.Checked then          // Indices varios
        begin
          if rbtGravesMortales.Checked then          // Graves y mortales
            TipoInforme := tiIndVariosGravesMortales
          else                                       // Incapacidades
            TipoInforme := tiIndVariosIncapacidades;
        end;

      if rbtMensual.Checked then
        TipoActualizacion := taMensual        // Mensual
      else
        TipoActualizacion := taEnLinea;       // En linea

      if rbtPorEmpresa.Checked then           // por empresa
        TipoSeleccion := tsEmpresa
      else if rbtPorCIIU.Checked then         // por CIIU
        TipoSeleccion := tsCIIU
      else if rbtPorHolding.Checked then      // por Holding
        TipoSeleccion := tsHolding
      else                                    // todos
        TipoSeleccion := tsTodos;

      if rbtLugarTrabajo.Checked then         // Lugar de trabajo
        TipoAccidente := taLugarTrab
      else if rbtEnfProfes.Checked then       // Enfermedad profesional
        TipoAccidente := taEnfProfesional
      else if rbtItinere.Checked then         // In itinere
        TipoAccidente := taInItinere
      else                                    // Todos
        TipoAccidente := taTodos;

      if rbtValAbso.Checked then              // Valores absolutos
        TipoCuadro := tcValoresAbs
      else if rbtImpoRelat.Checked then       // Importancia relativa
        TipoCuadro := tcImportanciaRelat
      else                                    // Ambos
        TipoCuadro := tcAmbos;

      if rbtCantSiniestros.Checked then       // Cantidad de siniestros
        TipoSeleccionCant := tcCantSiniestros
      else                                    // Cantidad de días caídos
        TipoSeleccionCant := tcCantDiasCaidos;

      sFechaActualizacion := Get_FechaActualizacion(TipoActualizacion);

      sPerDesde  := dtDesde.Periodo.Valor;
      sPerHasta  := dtHasta.Periodo.Valor;

      sCuit      := fraEmpresa.CUIT;
      iContrato  := fraEmpresa.Contrato;
      sActividad := fraActividad.Codigo;
      sHolding   := fraHolding.Codigo;

      bSoloAltaLaboral := chkAltaLaboral.Checked;

      //IniciarEspera('Generando reporte...');
      try
        bDobleReporte := (TipoInforme = tiCuadroOMSCIE10) and (TipoCuadro = tcAmbos);  // Cuadro de OMS-CIE10 - Tipo de Cuadro: Ambos

        if Generar_Reporte(TipoInforme, TipoSeleccion, TipoAccidente, Iif(bDobleReporte, tcValoresAbs, TipoCuadro), TipoSeleccionCant, iContrato, sCuit, sActividad, sHolding, bSoloAltaLaboral, TipoActualizacion, sFechaActualizacion, sPerDesde, sPerHasta, sNombreArchivo) then
          if PathDestino <> '' then
          begin
            ForceDirectories(PathDestino);
            CopyFile(PChar(sNombreArchivo), PChar(PathDestino+ExtractFileName(sNombreArchivo)), True );
          end
          else
            bOK := Mostrar_Reporte(TipoInforme, iContrato, sActividad, sHolding, sNombreArchivo, bPDF);

        if bOK and bDobleReporte then
          begin
            if Generar_Reporte(TipoInforme, TipoSeleccion, TipoAccidente, tcImportanciaRelat, TipoSeleccionCant, iContrato, sCuit, sActividad, sHolding, bSoloAltaLaboral, TipoActualizacion, sFechaActualizacion, sPerDesde, sPerHasta, sNombreArchivo) then
              if PathDestino <> '' then
              begin
                ForceDirectories(PathDestino);
                CopyFile(PChar(sNombreArchivo), PChar(PathDestino+ExtractFileName(sNombreArchivo)), True );
              end
              else
                Mostrar_Reporte(TipoInforme, iContrato, sActividad, sHolding, sNombreArchivo, bPDF);
          end;
      finally
        //DetenerEspera;
      end;
    end;
end;

end.

