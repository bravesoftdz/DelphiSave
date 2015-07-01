unit unComisionesALiquidar;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   24-01-2003
 ULTIMA MODIFICACION: 09-10-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unPrincipal, unfraVendedores, unfraVendedoresCUIT, StdCtrls, unArtFrame,
  unFraCodigoDescripcion, unfraEntidadCUIT, CurrEdit, Mask, ToolEdit,
  DateComboBox, unART, unRPTLiquidacionComisiones, {$IFDEF VER150}QRExport, {$ENDIF}
  FormPanel, unArtDBAwareFrame;

type
  TfrmComisionesALiquidar = class(TfrmCustomConsulta)
    pgCtrlComisiones: TPageControl;
    tbEntidad: TTabSheet;
    GroupBox5: TGroupBox;
    fraEntidadDesde: TfraEntidadCUIT;
    GroupBox1: TGroupBox;
    fraVendedorDesde: TfraVendedoresCUIT;
    tbVendedor: TTabSheet;
    tbEmpresa: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    cmbLiqDesde: TDateComboBox;
    Label3: TLabel;
    cmbLiqHasta: TDateComboBox;
    Label4: TLabel;
    edLiqDesde: TCurrencyEdit;
    Label5: TLabel;
    edLiqHasta: TCurrencyEdit;
    GridVendedor: TArtDBGrid;
    GridEmpresa: TArtDBGrid;
    dsVendedor: TDataSource;
    sdqVendedor: TSDQuery;
    dsEmpresa: TDataSource;
    sdqEmpresa: TSDQuery;
    tbLiquidar: TToolButton;
    ToolButton2: TToolButton;
    chkEmpresas: TCheckBox;
    tbSumatoria: TToolButton;
    tbSalir2: TToolButton;
    fraEntidadHasta: TfraEntidadCUIT;
    Label1: TLabel;
    Label6: TLabel;
    fraVendedorHasta: TfraVendedoresCUIT;
    Label7: TLabel;
    Label8: TLabel;
    ToolButton1: TToolButton;
    SortDialogVendedor: TSortDialog;
    SortDialogEmpresa: TSortDialog;
    chkPendienteLiquidar: TCheckBox;
    fpProcesando: TFormPanel;
    Panel1: TPanel;
    Animate: TAnimate;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject); 
    procedure pgCtrlComisionesChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pgCtrlComisionesChange(Sender: TObject);
    procedure tbLiquidarClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridVendedorPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure CambiaRegistro (DataSet: TDataSet);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure GridVendedorContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure tbLimpiarClick(Sender: TObject);
    procedure CambiaConsulta(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure fraVendedorHastaEnter(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqVendedorAfterOpen(DataSet: TDataSet);
  private
    FPaginaAnterior       : integer;
    FEntidadSeleccionada  : TTableID;
    FVendedorSeleccionado : TTableID;
    procedure CalcTotales;
    {$IFDEF VER150}
    procedure EnviarMail(Destinatario, Archivo : string);
    function GenerarNombreHTML(IDLiq : string) : string;
    {$ENDIF}
    procedure Liquidar( ID, TipoLiq, ModoLiq : string; ImprimeDetalle, ImprimeFormulario, EnviaPorMail: boolean );
    procedure btnMarcarTodosEntidad     ( Sender : TObject );
    procedure btnDesmarcarTodosEntidad ( Sender : TObject );
    procedure btnMarcarTodosVendedor     ( Sender : TObject );
    procedure btnDesmarcarTodosVendedor ( Sender : TObject );
    procedure LoadDynamicSortFields (Sort:TSortDialog;Grilla: TArtDBGrid);
  protected
    procedure CheckButtons; override;
  public
  end;

var
  bCambiaConsulta : boolean;
  frmComisionesALiquidar: TfrmComisionesALiquidar;

implementation
{$R *.DFM}

uses
  unDmPrincipal, SqlFuncs, CustomDlgs, General, DBFuncs, QuickRpt, Menus, AnsiSql,
  strFuncs, unSesion, unMoldeEnvioMail, unComisiones;

Const

  CONSULTA_ENTIDAD  : string ='SELECT EN_ID, EN_CODBANCO, EN_NOMBRE, EN_DIRELECTRONICA, '+
                              'COMISION.GET_ULTIMALIQUIDACION (EN_ID, ''E'') ULIQUIDACION, EN_MODOLIQ, ' +
                              'COMISION.GET_MONTOALIQUIDAR (EN_ID, ''E'') MONTOLIQUIDAR, ' +
                              'COMISION.GET_MONTOULTIMALIQ (EN_ID, ''E'') MONTOULIQUIDACION ' +
                              ' FROM XEN_ENTIDAD ' +
                              '  WHERE EN_MODOLIQ <> ''03''';

  CONSULTA_VENDEDOR : string = 'SELECT EN_ID, EN_CODBANCO, EN_NOMBRE, VE_ID, VE_VENDEDOR, VE_NOMBRE, VE_DIRELECTRONICA, EV_ID, EN_MODOLIQ, '+
                               'COMISION.GET_ULTIMALIQUIDACION (EV_ID, ''V'') ULIQUIDACION, ' +
                               'COMISION.GET_MONTOALIQUIDAR (EV_ID, ''V'') MONTOLIQUIDAR, ' +
                               'COMISION.GET_MONTOULTIMALIQ (EV_ID, ''V'') MONTOULIQUIDACION ' +
                               ' FROM XEV_ENTIDADVENDEDOR, XVE_VENDEDOR, XEN_ENTIDAD ' +
                               ' WHERE EV_IDENTIDAD = EN_ID ' +
                               ' AND EV_IDVENDEDOR = VE_ID ';

  CONSULTA_EMPRESA_1 : string = 'SELECT EN_ID, EN_CODBANCO "Código Entidad", EN_NOMBRE "Nombre Entidad", ' +
                                       'VE_VENDEDOR "Código Vendedor", VE_NOMBRE "Nombre Vendedor", EM_CUIT "CUIT", ' +
                                       'CO_CONTRATO "Contrato", EM_NOMBRE "Razón Social", MO_PERIODO "Período", ' +
                                       'CM_CODIGO "Código Cobranza", CM_DESCRIPCION "Descripción", ' +
                                       'SUM(MO_IMPORTE) "Cobrado", VC_PORCCOMISION "Porc. Comisión", ' +
                                       'ROUND(SUM(MO_IMPORTE)*(1-ART.COMISION.GET_IMPUESTOS/100),2) "Cobrado Neto", ' +
                                       'ROUND(SUM(MO_IMPORTE)*(1-ART.COMISION.GET_IMPUESTOS/100)*(VC_PORCCOMISION/100),2) "Comisión Estimada" ' +
                                  'FROM ZCM_CODIGOMOVIMIENTO, AEM_EMPRESA, ACO_CONTRATO, XEN_ENTIDAD, XVE_VENDEDOR, ' +
                                       'AVC_VENDEDORCONTRATO, XEV_ENTIDADVENDEDOR, ZMO_MOVIMIENTO ' +
                                 'WHERE VC_CONTRATO = CO_CONTRATO ' +
                                   'AND CO_IDEMPRESA = EM_ID ' +
                                   'AND MO_CONTRATO = CO_CONTRATO ' +
                                   'AND EV_ID = VC_IDENTIDADVEND ' +
                                   'AND EN_ID = EV_IDENTIDAD ' +
                                   'AND VE_ID = EV_IDVENDEDOR ' +
                                   'AND MO_IDCIERREPAGO = COMISION.GET_ULTIDCIERRE ' +
                                   'AND VC_FECHABAJA IS NULL ' +
                                   'AND MO_IDCODIGOMOVIMIENTO = CM_ID ' +
                                   'AND VC_VIGENCIADESDE <= MO_PERIODO ' +
                                   'AND (   VC_VIGENCIAHASTA IS NULL ' +
                                        'OR VC_VIGENCIAHASTA >= MO_PERIODO) ';

  GROUPBY_EMPRESA_1 : string = ' GROUP BY EN_ID, EN_CODBANCO, EN_NOMBRE, VE_VENDEDOR, VE_NOMBRE, EM_CUIT, CO_CONTRATO, EM_NOMBRE, MO_PERIODO, CM_CODIGO, CM_DESCRIPCION, VC_PORCCOMISION ';

  CONSULTA_EMPRESA_OPTIONAL : string = ' AND NOT EXISTS ( SELECT 1 ' +
                                       ' FROM AVC_VENDEDORCONTRATO AVC2 ' +
                                       ' WHERE AVC_VENDEDORCONTRATO.VC_CONTRATO = AVC2.VC_CONTRATO ' +
                                       ' AND AVC2.VC_VIGENCIAHASTA IS NOT NULL ) ';

  PAGINA_ENTIDAD  = 0;
  PAGINA_VENDEDOR = 1;
  PAGINA_EMPRESA  = 2;

  CAMPOS_SUMA : array [0..1] of string = ('MONTOLIQUIDAR','MONTOULIQUIDACION');
  MAXCOLS_ENTIDAD = 1;
  MAXCOLS_VENDEDOR = 1;

var
  TotalEntidad, TotalVendedor : array of extended;

procedure TfrmComisionesALiquidar.FormCreate(Sender: TObject);
begin
  inherited;
  // Como la herencia visual no permite eliminar la grilla, reasignamos el
  // parent de la grilla heredada para que sea contenida por la primer pagina del
  // pageControl
  grid.Parent := tbEntidad;

  // Seteo los vectores
  SetLength( TotalEntidad,  MAXCOLS_ENTIDAD  + 1);
  SetLength( TotalVendedor, MAXCOLS_VENDEDOR + 1);

  // Seteo la pagina inicial del PageControl
  pgCtrlComisiones.ActivePageIndex := PAGINA_ENTIDAD;

  //Opciones para la impresora
  QueryPrint.PageOrientation := pxLandscape;

  CheckButtons;

  bCambiaConsulta := True;
  LoadDynamicSortFields(SortDialog,Grid);
  LoadDynamicSortFields(SortDialogVendedor,GridVendedor);
  LoadDynamicSortFields(SortDialogEmpresa,GridEmpresa);

  Animate.ResName   := 'RELOJ';
end;

procedure TfrmComisionesALiquidar.tbRefrescarClick(Sender: TObject);
Var
  sSql,sWhere : String;
  PrevCursor : TCursor;
begin
  PrevCursor    := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      case pgCtrlComisiones.ActivePageIndex of
      PAGINA_ENTIDAD:
      begin
        sSql := CONSULTA_ENTIDAD;

        //Filtros frame Entidad
        if fraEntidadDesde.IsSelected and (fraEntidadDesde.Value = fraEntidadHasta.Value) then
          sWhere := sWhere + ' AND EN_ID = ' + fraEntidadDesde.ID
        else if fraEntidadDesde.IsSelected and (fraEntidadDesde.CUIT = fraEntidadHasta.CUIT) and (fraEntidadDesde.CUIT > '') then
          sWhere := sWhere + ' AND EN_CUIT = ' + SQLValue(fraEntidadDesde.CUIT)
        else begin
          if Trim( fraEntidadDesde.edCodigo.Text ) > '' then
            sWhere := sWhere + ' AND TO_NUMBER(EN_CODBANCO) >= ' + SqlInteger(fraEntidadDesde.CodBanco);
          if Trim( fraEntidadHasta.edCodigo.Text ) > '' then
            sWhere := sWhere + ' AND TO_NUMBER(EN_CODBANCO) <= ' + SqlInteger(fraEntidadHasta.CodBanco);
        end;

        if not( cmbLiqDesde.IsEmpty ) then
          sWhere := sWhere + ' AND COMISION.GET_ULTIMALIQUIDACION (EN_ID, ''E'') >= ' + ToDate(DateToStr(cmbLiqDesde.Date)) ;
        if not ( cmbLiqHasta.IsEmpty ) then
          sWhere := sWhere + ' AND COMISION.GET_ULTIMALIQUIDACION (EN_ID, ''E'') <= ' + ToDate(DateToStr(cmbLiqHasta.Date)) ;

        if trim( edLiqDesde.Text ) <> '' then
          sWhere := sWhere + ' AND COMISION.GET_MONTOALIQUIDAR (EN_ID, ''E'') >= ' + StrReplace(edLiqDesde.Text,',','.');
        if trim( edLiqHasta.Text ) <> '' then
          sWhere := sWhere + ' AND COMISION.GET_MONTOALIQUIDAR (EN_ID, ''E'') <= ' + StrReplace(edLiqHasta.Text,',','.');

        if chkPendienteLiquidar.Checked then
          sWhere := sWhere + ' AND NVL(ART.COMISION.GET_ULTIMALIQUIDACION (EN_ID, ''E''), TO_DATE(''01/01/1996'', ''DD/MM/YYYY'')) < ART.COMISION.GET_ULTFECHACIERRE';

        //Realiza la consulta
        sdqConsulta.SQL.Text := sSql + sWhere + SortNumerico(SortDialog);
        OpenQuery( sdqConsulta );
        sdqConsultaAfterOpen(sdqConsulta);
      end;
      PAGINA_VENDEDOR:
      begin
        sSql := CONSULTA_VENDEDOR;

        //Filtros frame Entidad
        if fraEntidadDesde.IsSelected and (fraEntidadDesde.Value = fraEntidadHasta.Value) then
          sWhere := sWhere + ' AND EN_ID = ' + fraEntidadDesde.ID
        else if fraEntidadDesde.IsSelected and (fraEntidadDesde.CUIT = fraEntidadHasta.CUIT) and (fraEntidadDesde.CUIT > '') then
          sWhere := sWhere + ' AND EN_CUIT = ' + SQLValue(fraEntidadDesde.CUIT)
        else begin
          if Trim( fraEntidadDesde.edCodigo.Text ) > '' then
            sWhere := sWhere + ' AND TO_NUMBER(EN_CODBANCO) >= ' + SqlInteger(fraEntidadDesde.CodBanco);
          if Trim( fraEntidadHasta.edCodigo.Text ) > '' then
            sWhere := sWhere + ' AND TO_NUMBER(EN_CODBANCO) <= ' + SqlInteger(fraEntidadHasta.CodBanco);
        end;

        //Filtros frame Vendedor
        if fraVendedorDesde.IsSelected and (fraVendedorDesde.Value = fraVendedorHasta.Value) then
          sWhere := sWhere + ' AND VE_ID = ' + fraVendedorDesde.ID
        else if fraVendedorDesde.IsSelected and (fraVendedorDesde.CUIT = fraVendedorHasta.CUIT) then
          sWhere := sWhere + ' AND VE_CUIT = ' + SQLValue(fraVendedorDesde.CUIT)
        else begin
          if Trim( fraVendedorDesde.edCodigo.Text ) > '' then
            sWhere := sWhere + ' AND VE_VENDEDOR >= ' + SqlValue(fraVendedorDesde.edCodigo.Text);
          if Trim( fraVendedorHasta.edCodigo.Text ) > '' then
            sWhere := sWhere + ' AND VE_VENDEDOR <= ' + SqlValue(fraVendedorHasta.edCodigo.Text);
        end;

        if not( cmbLiqDesde.IsEmpty ) then
          sWhere := sWhere + ' AND COMISION.GET_ULTIMALIQUIDACION (EV_ID, ''V'') >= ' + ToDate(DateToStr( cmbLiqDesde.Date ));
        if not ( cmbLiqHasta.IsEmpty ) then
          sWhere := sWhere + ' AND COMISION.GET_ULTIMALIQUIDACION (EV_ID, ''V'') <= ' + ToDate(DateToStr( cmbLiqHasta.Date ));

        if trim( edLiqDesde.Text ) <> '' then
          sWhere := sWhere + ' AND COMISION.GET_MONTOALIQUIDAR (EV_ID, ''V'') >= ' + StrReplace(edLiqDesde.Text,',','.');
        if trim( edLiqHasta.Text ) <> '' then
          sWhere := sWhere + ' AND COMISION.GET_MONTOALIQUIDAR (EV_ID, ''V'') <= ' + StrReplace(edLiqHasta.Text,',','.');

        if chkPendienteLiquidar.Checked then
          sWhere := sWhere + ' AND NVL(ART.COMISION.GET_ULTIMALIQUIDACION (EV_ID, ''V''), TO_DATE(''01/01/1996'', ''DD/MM/YYYY'')) < ART.COMISION.GET_ULTFECHACIERRE';

        //Realiza la consulta
        sdqVendedor.SQL.Text := sSql + sWhere + SortNumerico(SortDialogVendedor);
        OpenQuery( sdqVendedor );
        sdqVendedorAfterOpen(sdqVendedor);
      end;
{
      PAGINA_EMPRESA:
      begin

        //Filtros frame Entidad
        if fraEntidadDesde.IsSelected and (fraEntidadDesde.Value = fraEntidadHasta.Value) then
          sWhere := sWhere + ' AND EN_ID = ' + fraEntidadDesde.ID
        else if fraEntidadDesde.IsSelected and (fraEntidadDesde.CUIT = fraEntidadHasta.CUIT) and (fraEntidadDesde.CUIT > '') then
          sWhere := sWhere + ' AND EN_CUIT = ' + SQLValue(fraEntidadDesde.CUIT)
        else begin
          if Trim( fraEntidadDesde.edCodigo.Text ) > '' then
            sWhere := sWhere + ' AND TO_NUMBER(EN_CODBANCO) >= ' + SqlInteger(fraEntidadDesde.CodBanco);
          if Trim( fraEntidadHasta.edCodigo.Text ) > '' then
            sWhere := sWhere + ' AND TO_NUMBER(EN_CODBANCO) <= ' + SqlInteger(fraEntidadHasta.CodBanco);
        end;

        //Filtros frame Vendedor
        if fraVendedorDesde.IsSelected and (fraVendedorDesde.Value = fraVendedorHasta.Value) then
          sWhere := sWhere + ' AND VE_ID = ' + fraVendedorDesde.ID
        else if fraVendedorDesde.IsSelected and (fraVendedorDesde.CUIT = fraVendedorHasta.CUIT) then
          sWhere := sWhere + ' AND VE_CUIT = ' + SQLValue(fraVendedorDesde.CUIT)
        else begin
          if Trim( fraVendedorDesde.edCodigo.Text ) > '' then
            sWhere := sWhere + ' AND VE_VENDEDOR >= ' + SqlValue(fraVendedorDesde.edCodigo.Text);
          if Trim( fraVendedorHasta.edCodigo.Text ) > '' then
            sWhere := sWhere + ' AND VE_VENDEDOR <= ' + SqlValue(fraVendedorHasta.edCodigo.Text);
        end;

        if not( cmbLiqDesde.IsEmpty ) then
          sWhere := sWhere + ' AND COMISION.GET_ULTIMALIQUIDACION (VC_ID, ''M'') >= ' + ToDate(DateToStr( cmbLiqDesde.Date ));
        if not ( cmbLiqHasta.IsEmpty ) then
          sWhere := sWhere + ' AND COMISION.GET_ULTIMALIQUIDACION (VC_ID, ''M'') <= ' + ToDate(DateToStr( cmbLiqHasta.Date ));

        if trim( edLiqDesde.Text ) <> '' then
          sWhere := sWhere + ' AND COMISION.GET_MONTOALIQUIDAR (VC_ID, ''M'') >= ' + edLiqDesde.Text;
        if trim( edLiqHasta.Text ) <> '' then
          sWhere := sWhere + ' AND COMISION.GET_MONTOALIQUIDAR (VC_ID, ''M'') <= ' + edLiqHasta.Text;

        if chkEmpresas.Checked then
          sWhere := sWhere + CONSULTA_EMPRESA_OPTIONAL;


      end;
}
      end; //Del case
      CalcTotales;
    except
      On E: Exception do ErrorMsg( E, 'Error al ejecutar la consulta de selección' );
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
  CheckButtons;
end;

procedure TfrmComisionesALiquidar.pgCtrlComisionesChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  FPaginaAnterior := pgCtrlComisiones.ActivePageIndex;
  case pgCtrlComisiones.ActivePageIndex of
    PAGINA_ENTIDAD:
    begin
      if sdqConsulta.active then
        FEntidadSeleccionada  := sdqConsulta.FieldByName('EN_ID').AsInteger
      else
        FEntidadSeleccionada  := ART_EMPTY_ID;
      FVendedorSeleccionado := ART_EMPTY_ID;

    end;
    PAGINA_VENDEDOR:
    begin
      FEntidadSeleccionada  := ART_EMPTY_ID;
      if sdqVendedor.active then
        FVendedorSeleccionado := sdqVendedor.FieldByName('EV_ID').AsInteger
      else
        FVendedorSeleccionado := ART_EMPTY_ID;

    end;
  end;
end;

procedure TfrmComisionesALiquidar.pgCtrlComisionesChange(Sender: TObject);
var
  sSql, sWhere : string;
begin
  //De acuerdo a la pagina de donde viene tiene que ser la consulta que se ejecute
  case pgCtrlComisiones.ActivePageIndex of
    PAGINA_ENTIDAD:
    begin
      DBGrid     := Grid;
      DataSource := dsConsulta;
      Caption    := 'Comisiones a Liquidar - Entidad';
    end;

    PAGINA_VENDEDOR:
    begin
      DBGrid  := GridVendedor;
      DataSource := dsVendedor;
      Caption := 'Comisiones a Liquidar - Vendedor';

      if ((FPaginaAnterior = PAGINA_ENTIDAD) AND (sdqConsulta.Active = True) AND bCambiaConsulta) then
      begin
        sSql := CONSULTA_VENDEDOR +
                ' AND EN_ID=' + IntToStr( FEntidadSeleccionada );
        OpenQuery ( sdqVendedor, sSql, True );
        sdqVendedorAfterOpen(sdqVendedor);
      end;
    end;

    PAGINA_EMPRESA:
    begin
      DBGrid     := GridEmpresa;
      DataSource := dsEmpresa;
      Caption    := 'Comisiones a Liquidar - Empresa';
      if ((FPaginaAnterior = PAGINA_ENTIDAD) AND (sdqConsulta.Active = True) AND bCambiaConsulta) then
      begin
        sWhere := ' AND EN_ID=' + IntToStr( FEntidadSeleccionada );
        if chkEmpresas.Checked then
          sWhere := sWhere + CONSULTA_EMPRESA_OPTIONAL;

        sSql := CONSULTA_EMPRESA_1 + sWhere + GROUPBY_EMPRESA_1;
        OpenQuery ( sdqEmpresa, sSql, True );
      end;

      if ((FPaginaAnterior = PAGINA_VENDEDOR) AND (sdqVendedor.Active = True) AND bCambiaConsulta) then
      begin
        sWhere := ' AND EV_ID=' + IntToStr( FVendedorSeleccionado );
        if chkEmpresas.Checked then
          sWhere := sWhere + CONSULTA_EMPRESA_OPTIONAL;

        sSql := CONSULTA_EMPRESA_1 + sWhere + GROUPBY_EMPRESA_1;
        OpenQuery ( sdqEmpresa, sSql, True );
      end;
    end;
  end;

  if bCambiaConsulta then
    begin
      CalcTotales;

      bCambiaConsulta := False;
    end;

  CheckButtons; //Esto lo pongo afuera para que tome en cuenta el boton refrescar
end;

procedure TfrmComisionesALiquidar.tbLiquidarClick(Sender: TObject);
var
  iloop            : integer;
  Id,ModoLiq       : string;
  bPermiteLiquidar : boolean;
  {ImprimeDetalle, }ImprimeFormulario, EnviaPorMail: boolean;
begin
  sdqConsulta.DisableControls;
  sdqVendedor.DisableControls;
//  FWindowList := DisableTaskWindows(Handle);

  try
    if MsgBox ('¿Está seguro que desea liquidar?',MB_YESNO + MB_ICONQUESTION ) = mrYes then
    begin
      bPermiteLiquidar := True;

      case pgCtrlComisiones.ActivePageIndex of
        PAGINA_ENTIDAD:
        begin

          for iloop := 0 to grid.SelectedRows.Count -1 do
          begin
            sdqConsulta.GotoBookmark( pointer( Grid.SelectedRows.Items[iloop]));
            ModoLiq := sdqConsulta.FieldByName ('EN_MODOLIQ').AsString;
            if ( ModoLiq = '03' ) then
            begin
              MessageDlg('Ha seleccionado un registro que no se puede liquidar.', mtError, [mbOK], 0);
              bPermiteLiquidar := False;
              break;
            end;
            {if (sdqConsulta.FieldByName ('MONTOLIQUIDAR').AsFloat = 0) then
            begin
              MessageDlg('El monto a liquidar debe ser diferente a 0', mtError, [mbOK], 0);
              bPermiteLiquidar := False;
              break;
            end;}
          end;

          if bPermiteLiquidar then
          begin
            //ImprimeDetalle    := MsgAsk ('¿Desea Imprimir el detalle de las liquidaciones generadas?');
            ImprimeFormulario := MsgAsk ('¿Desea Imprimir el formulario de la liquidación?');
            EnviaPorMail      := MsgAsk ('¿Desea enviar por Mail las liquidaciones generadas?');

            Animate.Active := True;
            fpProcesando.ShowOnTop;
            Application.ProcessMessages;

            for iloop := 0 to grid.SelectedRows.Count -1 do
            begin
              sdqConsulta.GotoBookmark( pointer( Grid.SelectedRows.Items[iloop]));
              ID := sdqConsulta.FieldByName ('EN_ID').AsString;
              Liquidar( ID, 'E', sdqConsulta.FieldByName ('EN_MODOLIQ').AsString, {ImprimeDetalle}False, ImprimeFormulario, EnviaPorMail );
            end;

            Animate.Active := False;

            MessageDlg('La operación se completó con éxito.', mtInformation, [mbOK], 0);
          end;
        end;

        PAGINA_VENDEDOR:
        begin

          for iloop := 0 to gridVendedor.SelectedRows.Count -1 do
          begin
            sdqVendedor.GotoBookmark( pointer( gridVendedor.SelectedRows.Items[iloop]));
            ModoLiq := sdqVendedor.FieldByName ('EN_MODOLIQ').AsString;
            if ( ModoLiq <> '02' ) then
            begin
              MessageDlg('Ha seleccionado un registro que no se puede liquidar.', mtError, [mbOK], 0);
              bPermiteLiquidar := False;
              break;
            end;
            {if (sdqVendedor.FieldByName ('MONTOLIQUIDAR').AsFloat = 0) then
            begin
              MessageDlg('El monto a liquidar debe ser diferente a 0', mtError, [mbOK], 0);
              bPermiteLiquidar := False;
              break;
            end;}
          end;

          if bPermiteLiquidar then
          begin
            //ImprimeDetalle    := MsgAsk ('¿Desea Imprimir el detalle de las liquidaciones generadas?');
            ImprimeFormulario := {$IFDEF VER150}MsgAsk ('¿Desea Imprimir el formulario de la liquidación?'){$ELSE}False{$ENDIF};
            EnviaPorMail      := {$IFDEF VER150}MsgAsk ('¿Desea enviar por Mail las liquidaciones generadas?'){$ELSE}False{$ENDIF};

            Animate.Active := True;
            fpProcesando.ShowOnTop;
            Application.ProcessMessages;

            for iloop := 0 to gridVendedor.SelectedRows.Count -1 do
            begin
              sdqVendedor.GotoBookmark( pointer( gridVendedor.SelectedRows.Items[iloop]));
              ID := sdqVendedor.FieldByName ('EV_ID').AsString;
              Liquidar( ID, 'V', sdqVendedor.FieldByName ('EN_MODOLIQ').AsString, {ImprimeDetalle}False, ImprimeFormulario, EnviaPorMail )
            end;

            Animate.Active := False;

            MessageDlg('La operación se completó con éxito.', mtInformation, [mbOK], 0);
          end;
        end;
      end;
    end;
  finally
    sdqConsulta.EnableControls;
    sdqVendedor.EnableControls;
    fpProcesando.Close;
    tbRefrescarClick (nil);
  end;
end;

procedure TfrmComisionesALiquidar.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;

end;

procedure TfrmComisionesALiquidar.CalcTotales;
Var PrevCursor : TCursor;
begin
  PrevCursor    := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    Try
      case pgCtrlComisiones.ActivePageIndex of
        PAGINA_ENTIDAD:
        begin
          Grid.FooterBand := tbSumatoria.Down ;
          if tbSumatoria.Down and sdqConsulta.Active Then
          begin
            SumFields( sdqConsulta, CAMPOS_SUMA, TotalEntidad );
          end;
        end;
        PAGINA_VENDEDOR:
        begin
          GridVendedor.FooterBand := tbSumatoria.Down ;
          if tbSumatoria.Down and sdqVendedor.Active Then
          begin
            SumFields( sdqVendedor, CAMPOS_SUMA, TotalVendedor );
          end;
        end;
      end;
    Except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmComisionesALiquidar.GridVendedorPaintFooter(Sender: TObject;
  Column: String; var Value: String; var CellColor, FontColor: TColor;
  var AlignFooter: TAlingFooter);
var iPos : integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS_VENDEDOR) Then
    Value := FormatFloat('$ #,##0.00', TotalVendedor[iPos]);
end;

procedure TfrmComisionesALiquidar.GridPaintFooter(Sender: TObject;
  Column: String; var Value: String; var CellColor, FontColor: TColor;
  var AlignFooter: TAlingFooter);
var iPos : integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS_ENTIDAD) Then
    Value := FormatFloat('$ #,##0.00', TotalEntidad[iPos]);
end;

procedure TfrmComisionesALiquidar.CambiaRegistro(DataSet: TDataSet);
begin
  CheckButtons;
  CambiaConsulta (nil);
end;

procedure TfrmComisionesALiquidar.CheckButtons;
begin
  inherited;
  case pgCtrlComisiones.ActivePageIndex of
    PAGINA_ENTIDAD:
    begin
      tbRefrescar.Enabled := True;
      Grid.FooterBand := tbSumatoria.Down ;
      if sdqConsulta.Active Then
      begin
        //tbLiquidar.Enabled := (sdqConsulta.FieldByName ('MONTOLIQUIDAR').AsInteger <> 0) And (sdqConsulta.FieldByName ('EN_MODOLIQ').AsString <> '03');
        tbSumatoria.Enabled := True;
      end
      else
      begin
        //tbLiquidar.Enabled := False;
        tbSumatoria.Enabled := False;
        tbSumatoria.Down    := False;
      end;
    end;
    PAGINA_VENDEDOR:
    begin
      tbRefrescar.Enabled := True;
      GridVendedor.FooterBand := tbSumatoria.Down ;
      if sdqVendedor.Active Then
      begin
        //tbLiquidar.Enabled := (sdqVendedor.FieldByName ('MONTOLIQUIDAR').AsInteger <> 0) And (sdqVendedor.FieldByName ('EN_MODOLIQ').AsString <> '03');
        tbSumatoria.Enabled := True;
      end
      else
      begin
        //tbLiquidar.Enabled := False;
        tbSumatoria.Enabled := False;
        tbSumatoria.Down    := False;
      end;
    end;
    Else
    begin
      //tbLiquidar.Enabled  := False;
      tbRefrescar.Enabled := False;
      tbSumatoria.Enabled := False;
      tbSumatoria.Down    := False;
    end;
  end;
end;

{$IFDEF VER150}
procedure TfrmComisionesALiquidar.EnviarMail(Destinatario, Archivo : string);
begin
  if Trim(Destinatario) = '' then
  begin
    MessageDlg('No se tiene la dirección de mail', mtError, [mbOK], 0);
    Abort;
  end;

  EnviarMailBD(Destinatario, 'Liquidación de Comisión - Provincia ART', [oShowDialogIfEmpty, oAutoFirma, oBodyIsRTF],
               'Adjuntado se encuentra el HTML correspondiente a la liquidación.', GetAttachments(Archivo, 0));
end;
function TfrmComisionesALiquidar.GenerarNombreHTML(IDLiq: string): string;
begin
  result := 'Liq' + IdLiq + '_' + FloatToStr(now) + '.html';
end;
{$ENDIF}

procedure TfrmComisionesALiquidar.Liquidar( ID, TipoLiq, ModoLiq : string; ImprimeDetalle, ImprimeFormulario, EnviaPorMail: boolean );
var
  MaxLC : String;
  {$IFDEF VER150}
  Destinatario, Archivo: String;
  DocHTML : TQRHTMLDocumentFilter;
  {$ENDIF}
begin
  if DoLiquidar(StrToInt(ID), TipoLiq, True) then
    with TfrmRPTLiquidacionComision.Create ( self ) do
      begin
        try
          MaxLC := ValorSQL ('SELECT MAX( LC_ID ) FROM XLC_LIQCOMISION' );
          if MaxLC = '' then MaxLC := '0';

          MaxLiq := MaxLC;
          if ImprimeDetalle or ImprimeFormulario or EnviaPorMail then
            begin
              if not Prepare('ComisionGeneral') then
                MessageDlg('No se generó la liquidación!', mtWarning, [mbOK], 0)
              else
              begin
                if ImprimeDetalle then
                  RPTLiquidacionComisionGeneral.PreviewModal;

                if ImprimeFormulario then
                begin
                  if ((TipoLiq = 'V') or (ModoLiq = '02')) then
                  begin
                    Prepare('ComisionParticularVendedor');
                    RPTLiquidacionComisionParticularVendedor.PreviewModal;
                  end
                  else if TipoLiq = 'E' then
                  begin
                    Prepare('ComisionParticularEntidad');
                    RPTLiquidacionComisionParticularEntidad.PreviewModal;
                  end
                end;

                if EnviaPorMail then
                begin
                  {$IFDEF VER150}
                  if TipoLiq = 'E' then
                    Destinatario := sdqConsulta.FieldByName('EN_DIRELECTRONICA').AsString
                  else if TipoLiq = 'V' then
                    Destinatario := sdqVendedor.FieldByName('VE_DIRELECTRONICA').AsString;
                  //Genera el archivo
                  Archivo := GenerarNombreHTML(Id);
                  DocHTML := TQRHTMLDocumentFilter.Create (Archivo);
                  try
                    RPTLiquidacionComisionGeneral.ExportToFilter (DocHTML);
                  finally
                    DocHTML.Free;
                  end;
                  //Lo envia
                  EnviarMail(Destinatario, Archivo);
                  //Lo borra
                  DeleteFile (Archivo);
                  {$ENDIF}
                end;
              end;
            end;
        finally
          Free;
        end;
      end;
end;

procedure TfrmComisionesALiquidar.GridContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
   Menu : TPopUpMenu;
   Item : TMenuItem;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  Menu := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    Item.Caption := 'Marcar Todos';
    Item.OnClick := btnMarcarTodosEntidad;
    Menu.Items.Add( Item );
    Item := TMenuItem.Create(Self);
    Item.Caption := 'Desmarcar Todos';
    Item.OnClick := btnDesMarcarTodosEntidad;
    Menu.Items.Add( Item );
    Menu.PopUp ( Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y );
  except
    Menu.Free;
    Item.Free;
  end;
end;

procedure TfrmComisionesALiquidar.GridVendedorContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
   Menu : TPopUpMenu;
   Item : TMenuItem;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  Menu := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    Item.Caption := 'Marcar Todos';
    Item.OnClick := btnMarcarTodosVendedor;
    Menu.Items.Add( Item );
    Item := TMenuItem.Create(Self);
    Item.Caption := 'Desmarcar Todos';
    Item.OnClick := btnDesMarcarTodosVendedor;
    Menu.Items.Add( Item );
    Menu.PopUp ( GridVendedor.ClientToScreen(MousePos).X , GridVendedor.ClientToScreen(MousePos).Y );
  except
    Menu.Free;
    Item.Free;
  end;
end;

procedure TfrmComisionesALiquidar.btnDesmarcarTodosEntidad(Sender: TObject);
begin
  Grid.UnselectAll;
end;

procedure TfrmComisionesALiquidar.btnDesmarcarTodosVendedor(Sender: TObject);
begin
  GridVendedor.UnselectAll;
end;

procedure TfrmComisionesALiquidar.btnMarcarTodosEntidad(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmComisionesALiquidar.btnMarcarTodosVendedor(Sender: TObject);
begin
  GridVendedor.SelectAll;
end;

procedure TfrmComisionesALiquidar.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  DataSource.DataSet.Close;
  fraEntidadDesde.Clear;
  fraEntidadHasta.Clear;
  fraVendedorDesde.Clear;
  fraVendedorHasta.Clear;
  cmbLiqDesde.Clear;
  cmbLiqHasta.Clear;
  edLiqDesde.Clear;
  edLiqHasta.Clear;
  ChkEmpresas.Checked := False;
  chkPendienteLiquidar.Checked := True;
end;

procedure TfrmComisionesALiquidar.CambiaConsulta(Sender: TObject);
begin
  bCambiaConsulta := True;
end;

procedure TfrmComisionesALiquidar.tbOrdenarClick(Sender: TObject);
begin
  case pgCtrlComisiones.ActivePageIndex of
    PAGINA_ENTIDAD:
    begin
      LoadDynamicSortFields(SortDialog,Grid);
      SortDialog.Execute ;
    end;
    PAGINA_VENDEDOR:
    begin
      LoadDynamicSortFields(SortDialogVendedor,GridVendedor);
      SortDialogVendedor.Execute ;
    end;
    PAGINA_EMPRESA:
    begin
      LoadDynamicSortFields(SortDialogEmpresa,GridEmpresa);
      SortDialogEmpresa.Execute ;
    end;
  end;
end;

procedure TfrmComisionesALiquidar.LoadDynamicSortFields(Sort:TSortDialog;Grilla: TArtDBGrid);
Var i : Integer;
begin
  if Sort.SortFields.Count = 0 Then
     for i := 0 to Grilla.Columns.Count -1 do
         With Sort.SortFields.Add do begin
              Title     := Grilla.Columns[i].Title.Caption ;
              DataField := Grilla.Columns[i].FieldName ;
         end;

end;

procedure TfrmComisionesALiquidar.fraVendedorHastaEnter(Sender: TObject);
begin
  inherited;

  if fraEntidadDesde.Value = fraEntidadHasta.Value then
  begin
    fraVendedorDesde.Entidad := fraEntidadDesde.Value;
    fraVendedorHasta.Entidad := fraEntidadDesde.Value;
  end
  else
  begin
    fraVendedorDesde.Entidad := 0;
    fraVendedorHasta.Entidad := 0;
  end;
end;

procedure TfrmComisionesALiquidar.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CambiaRegistro ( nil );
  with DataSet do
  begin
    FieldByName('MONTOLIQUIDAR').EditMask     := '$ #,##0.00';
    FieldByName('MONTOULIQUIDACION').EditMask := '$ #,##0.00';
    TFloatField(FieldByName('MONTOLIQUIDAR')).Currency     := True;
    TFloatField(FieldByName('MONTOULIQUIDACION')).Currency := True;
  end;
end;

procedure TfrmComisionesALiquidar.sdqVendedorAfterOpen(DataSet: TDataSet);
begin
  CambiaRegistro ( nil );
  with DataSet do
  begin
    FieldByName('MONTOLIQUIDAR').EditMask     := '$ #,##0.00';
    FieldByName('MONTOULIQUIDACION').EditMask := '$ #,##0.00';
    TFloatField(FieldByName('MONTOLIQUIDAR')).Currency     := True;
    TFloatField(FieldByName('MONTOULIQUIDACION')).Currency := True;
  end;
end;

end.

