unit unAnalisisCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, PeriodoPicker, Excel2000,
  OleServer, unCustomConsulta, FieldHider, ShortCutControl, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unCustomGridABM, FormPanel, Menus, unComunes;

type               
  TfrmAnalisisCliente = class(TfrmCustomGridABM)
    ExcelApplication: TExcelApplication;
    gbContrato: TGroupBox;
    lblCUIT: TLabel;
    fraEmpresaAC: TfraEmpresa;
    chkGenerarTodosContratos: TCheckBox;
    gbPeriodos: TGroupBox;
    lblPeriodoHasta: TLabel;
    lblPeriodoDesde: TLabel;
    ppDesde: TPeriodoPicker;
    ppHasta: TPeriodoPicker;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    fraEmpresaBusqueda: TfraEmpresa;
    ShortCutControl1: TShortCutControl;
    mnuImprimir: TPopupMenu;
    mnuReporteAC: TMenuItem;
    mnuImprimirResultados: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure mnuReporteACClick(Sender: TObject);
  private
    LCID_1: LCID;
    function Generar_Reporte(var NomArchivoDest: String): Boolean;
    function DoInsertarRegTablaListados(PathArchivoCompletoPDF: String): Boolean;
  public
  protected
    procedure ClearControls; override;
    function Validar: Boolean; override;
		function DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmAnalisisCliente: TfrmAnalisisCliente;

implementation

uses
  CustomDlgs, Periodo, unDmPrincipal, AnsiSql, unDigitalizacion, ArchFuncs,
  unSesion, StrFuncs, General, unExcel, unEspera, SqlFuncs, unInfSiniestralidad,
  unConstantArchivo, unUtilsArchivo, unArchivo;

{$R *.dfm}

procedure TfrmAnalisisCliente.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived  := False;
  CAPTION_ALTA := 'Generar Nuevo Reporte';

  with fraEmpresaAC do
    ShowBajas   := False;

  fraEmpresaBusqueda.ShowBajas := True;

  ppDesde.Periodo.MinPeriodo := '199601';
  ppHasta.Periodo.MinPeriodo := ppDesde.Periodo.MinPeriodo;

  LCID_1 := LOCALE_USER_DEFAULT;

  Sql.TableName := 'CRP_REPORTEPDF';
end;

function TfrmAnalisisCliente.Validar: Boolean;
var
  sMaxPeriodo: String;
begin
  Verificar(fraEmpresaAC.IsEmpty, fraEmpresaAC, 'Debe seleccionar una empresa.');
  Verificar(((ppDesde.Periodo.Valor <> '') and (ppHasta.Periodo.Valor = '')) or ((ppDesde.Periodo.Valor = '') and (ppHasta.Periodo.Valor <> '')), ppDesde, 'Si ingresa uno de los periodos, no puede dejar el otro en blanco.');
  Verificar(ppDesde.Periodo.Valor > ppHasta.Periodo.Valor, ppDesde, 'El periodo desde no puede ser mayor que el hasta.');

  sMaxPeriodo := GetPeriodo(DBDate, fpAnioMes);
  Verificar(ppDesde.Periodo.Valor > sMaxPeriodo, ppDesde, 'El periodo desde no puede ser mayor que el periodo de la fecha actual.');
  Verificar(ppHasta.Periodo.Valor > sMaxPeriodo, ppHasta, 'El periodo hasta no puede ser mayor que el periodo de la fecha actual.');

  Verificar(not PuedeGenerarInformeSiniestral(), nil, 'No puede generar en este momento este informe pues se están actualizando alguno de sus datos.');

  Result := True;
end;

function TfrmAnalisisCliente.DoABM: Boolean;
var
  sArchivoPDF, sNombreArchivo, sArchivoCompleto, sPathCompleto: String;
  bCopiarOK: Boolean;
  sClave: String;
begin
  Result := False;
  ABORT;   // FALTA: habria que convertir el excel generado en singlepage tiff's e insertar cada imagen en el repositorio...

  IniciarEspera('Generando reportes...');
  try
    if Generar_Reporte(sNombreArchivo) then
      begin
        bCopiarOK := DoCopiarArchivoDigitalizacion(ID_CARPETA_AFILIAC, dcAnalisisCliente, sNombreArchivo, sArchivoCompleto, sPathCompleto, True);
        if bCopiarOK then
          begin
            sClave := GetClaveArmada(1, IntToStr(fraEmpresaAC.Contrato), '', '', '');
            DoInsertRepositorioArchivo(dcAnalisisCliente, ID_CARPETA_AFILIAC, sClave, 999999, sPathCompleto, sArchivoCompleto, False); // FALTA: definir el IdTipoDocumento
            
            sArchivoPDF := ChangeFileExt(sPathCompleto + sArchivoCompleto, '.PDF');
            if FileExists(sArchivoPDF) then
              begin
                if DoInsertarRegTablaListados(sArchivoPDF) then
                  begin
                    LogAuditoria('LAC', fraEmpresaAC.CUIT);
                    Result := DoMostrarArchivo(tiAnalisisCliente, sArchivoPDF, fraEmpresaAC.Contrato, '', '');
                  end;
              end
            else
              InfoHint(btnAceptar, 'No se encuentra el reporte en formato PDF.', False, 'Información', blnError, 10);
          end
        else
          InfoHint(btnAceptar, 'No se ha podido copiar el reporte a digitalización.', False, 'Información', blnError, 10);
      end
    else
      InfoHint(btnAceptar, 'Uno de los reportes no se ha podido generar.', False, 'Información', blnError, 10);
  finally
    DetenerEspera;
  end;
end;

function TfrmAnalisisCliente.Generar_Reporte(var NomArchivoDest: String): Boolean;
var
  sPerDesde, sPerHasta: String;
  sFechaActualizacion, sSql, sSelPerDesde, sSelPerHasta: String;
  iContrato: Integer;
  bSelRangoPeriodos: Boolean;
  SqlResults: TStringList;
  WorkBk: _WorkBook;
begin
  iContrato := fraEmpresaAC.Contrato;

  sSelPerDesde := ppDesde.Periodo.Valor;
  sSelPerHasta := ppHasta.Periodo.Valor;

  bSelRangoPeriodos := (sSelPerDesde <> '');

  if chkGenerarTodosContratos.Checked then
    begin
      sPerDesde := sSelPerDesde;
      sPerHasta := sSelPerHasta;
    end
  else
    begin
      sSql := 'SELECT GREATEST(TO_CHAR(CO_VIGENCIADESDE, ''YYYYMM''), ' +
                              'NVL(' + SqlValue(sSelPerDesde) + ', TO_CHAR(CO_VIGENCIADESDE, ''YYYYMM''))), ' +
                     'LEAST(TO_CHAR(NVL(CO_FECHABAJA, CO_VIGENCIAHASTA), ''YYYYMM''), ' +
                           'NVL(' + SqlValue(sSelPerHasta) + ', TO_CHAR(NVL(CO_FECHABAJA, CO_VIGENCIAHASTA), ''YYYYMM''))) ' +
                'FROM ACO_CONTRATO ' +
               'WHERE CO_CONTRATO = ' + SqlValue(iContrato);

      SqlResults := ValoresColSql(sSql);
      try
        sPerDesde := SqlResults[0];
        sPerHasta := SqlResults[1];

        Verificar(sPerDesde > sPerHasta, btnAceptar, 'No se han encontrado periodos vigentes.');
      finally
        SqlResults.Free;
      end;
    end;

  sFechaActualizacion := Get_FechaActualizacion(taMensual);

  NomArchivoDest := DoCopiarArchivo(tiAnalisisCliente);

  WorkBk := ExclOpen(ExcelApplication, NomArchivoDest, LCID_1);
  try
    Result := Generar_CuadroEvolTrabajSiniestros(tiAnalisisCliente, tsEmpresa, chkGenerarTodosContratos.Checked, iContrato, '', '', bSelRangoPeriodos, sFechaActualizacion, sSelPerDesde, sSelPerHasta, sPerDesde, sPerHasta, WorkBk) and // primero llamo a esto porque necesito llenar datos en tmp_cuadroevoltrabajsin para usar luego en Generar_CuadroInformacionCuentaYSiniestral
              Generar_CuadroInformacionCuentaYSiniestral(tiAnalisisCliente, chkGenerarTodosContratos.Checked, iContrato, bSelRangoPeriodos, sSelPerDesde, sSelPerHasta, sPerDesde, sPerHasta, WorkBk) and
              Generar_CuadroInformeSiniestralidad(tiAnalisisCliente, tsEmpresa, chkGenerarTodosContratos.Checked, iContrato, '', '', bSelRangoPeriodos, taMensual, sFechaActualizacion, sSelPerDesde, sSelPerHasta, sPerDesde, sPerHasta, WorkBk, LCID_1) and
              Generar_CuadroIndicesVarios(tiAnalisisCliente, tsEmpresa, chkGenerarTodosContratos.Checked, iContrato, '', '', bSelRangoPeriodos, sFechaActualizacion, sSelPerDesde, sSelPerHasta, sPerDesde, sPerHasta, WorkBk);
  finally
    ExclClose(ExcelApplication, WorkBk, NomArchivoDest, LCID_1);
  end;
end;

procedure TfrmAnalisisCliente.ClearControls;
begin
  if fraEmpresaBusqueda.IsSelected then
    fraEmpresaAC.Contrato := fraEmpresaBusqueda.Contrato
  else
    fraEmpresaAC.Clear;

  chkGenerarTodosContratos.Checked := False;
  ppDesde.Clear;
  ppHasta.Clear;
end;

procedure TfrmAnalisisCliente.RefreshData;
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT RP_CONTRATO CONTRATO, RP_PERIODODESDE PERIODODESDE, RP_PERIODOHASTA PERIODOHASTA, ' +
                 'RP_TODOSCONTRATOS TODOSCONTRATOS, RP_UBICACIONPDF UBICACIONPDF, ' +
                 'TRUNC(RP_FECHAALTA) FECHAALTA, UTILES.ARMAR_CUIT(EM_CUIT) CUIT, EM_NOMBRE RSOCIAL ' +
            'FROM AEM_EMPRESA, ACO_CONTRATO, CRP_REPORTEPDF ' +
           'WHERE CO_CONTRATO =  RP_CONTRATO ' +
             'AND CO_IDEMPRESA = EM_ID';

  sWhere := '';

  if fraEmpresaBusqueda.IsSelected then
    sWhere := sWhere + ' AND RP_CONTRATO = ' + SqlValue(fraEmpresaBusqueda.Contrato);

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmAnalisisCliente.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresaBusqueda.Clear;
end;

function TfrmAnalisisCliente.DoInsertarRegTablaListados(PathArchivoCompletoPDF: String): Boolean;
begin
  Result := False;

  if ModoABM = maAlta then
    begin
      with Sql do
        begin
          Clear;

          PrimaryKey.AddExpression('RP_ID', 'SEQ_CRP_ID.NEXTVAL');

          Fields.Add('RP_TIPO',           'AC');
          Fields.Add('RP_CONTRATO',       fraEmpresaAC.Contrato, dtNumber);
          Fields.Add('RP_PERIODODESDE',   ppDesde.Periodo.Valor);
          Fields.Add('RP_PERIODOHASTA',   ppHasta.Periodo.Valor);
          Fields.Add('RP_TODOSCONTRATOS', String(Iif(chkGenerarTodosContratos.Checked, 'S', 'N')));
          Fields.Add('RP_UBICACIONPDF',   PathArchivoCompletoPDF);
          Fields.Add('RP_USUALTA',        Sesion.UserID);
          Fields.Add('RP_FECHAALTA',      exDateTime);

          SqlType := stInsert;

          Result := inherited DoABM
        end;
    end;
end;

procedure TfrmAnalisisCliente.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmAnalisisCliente.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults; 
end;

procedure TfrmAnalisisCliente.mnuReporteACClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No ha seleccionado ningún registro en la grilla.');
  DoMostrarArchivo(tiAnalisisCliente, sdqConsulta.FieldByName('UBICACIONPDF').AsString, sdqConsulta.FieldByName('CONTRATO').AsInteger, '', '');
end;

end.


