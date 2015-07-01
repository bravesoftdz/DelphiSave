unit unSobres;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, Menus, Mask, ToolEdit, DateComboBox, StdCtrls,
  PatternEdit, IntEdit, QuickRpt, QRCtrls, Provider, DBClient, FormPanel,
  ComboEditor, CheckCombo, DBCheckCombo, CardinalEdit, unArtFrame,
  unfraUsuarios, ArtQReports, RxToolEdit, RxPlacemnt, unArt;

type
  TfrmSobres = class(TfrmCustomConsulta)
    mnuImprimir: TPopupMenu;
    mnuImprimirSobres: TMenuItem;
    mnuImprimirResultados: TMenuItem;
    gbBeneficiario: TGroupBox;
    edBeneficiario: TEdit;
    gbFechaCheque: TGroupBox;
    Label3: TLabel;
    edFechaChequeDesde: TDateComboBox;
    edFechaChequeHasta: TDateComboBox;
    rgImpresos: TRadioGroup;
    gbNumCheque: TGroupBox;
    Label1: TLabel;
    gbNroOP: TGroupBox;
    Label2: TLabel;
    edOrdPagoDesde: TIntEdit;
    edOrdPagoHasta: TIntEdit;
    mnuSeleccion: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    rptSobres: TQuickRep;
    TitleBand1: TQRBand;
    mnuImprimirAcuses: TMenuItem;
    qrlDestinatario: TQRDBText;
    qrlDomicilio: TQRDBText;
    qrlCPLocalidad: TQRDBText;
    qrlProvincia: TQRDBText;
    rptAcuses: TQuickRep;
    cdsAcuses: TClientDataSet;
    dspAcuses: TDataSetProvider;
    sdqAcuses: TSDQuery;
    sdqAcusesCE_BENEFICIARIO: TStringField;
    sdqAcusesDOMICILIO: TStringField;
    sdqAcusesSO_CPOSTAL: TStringField;
    sdqAcusesSO_LOCALIDAD: TStringField;
    sdqAcusesPV_DESCRIPCION: TStringField;
    cdsAcusesCE_BENEFICIARIO: TStringField;
    cdsAcusesDOMICILIO: TStringField;
    cdsAcusesSO_CPOSTAL: TStringField;
    cdsAcusesSO_LOCALIDAD: TStringField;
    cdsAcusesPV_DESCRIPCION: TStringField;
    qrbDetalleAcuses: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbAcuse: TToolButton;
    gbNroAcuse: TGroupBox;
    edNroAcuse: TEdit;
    gbFechaAlta: TGroupBox;
    Label4: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    gbFechaImpresion: TGroupBox;
    Label5: TLabel;
    edFechaImprDesde: TDateComboBox;
    edFechaImprHasta: TDateComboBox;
    tbNroAcuse: TToolButton;
    fpNroAcuse: TFormPanel;
    Bevel2: TBevel;
    lbNroAcuse: TLabel;
    btnNroAcuseAceptar: TButton;
    btnNroAcuseCancelar: TButton;
    edAltaNroAcuse: TEdit;
    QRDBText6: TQRDBText;
    QRLabel5: TQRLabel;
    sdqAcusesCE_ORDENPAGO: TFloatField;
    cdsAcusesCE_ORDENPAGO: TFloatField;
    grpMetodoPago: TGroupBox;
    cmbMetodoPago: TDBCheckCombo;
    grpSituacion: TGroupBox;
    cmbSituaciones: TDBCheckCombo;
    sdqSituaciones: TSDQuery;
    dsSituaciones: TDataSource;
    sdqMetodoPagoFiltro: TSDQuery;
    dsMetodoPagoFiltro: TDataSource;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    pnlTotalRegistros: TPanel;
    edTotalRegistros: TCardinalEdit;
    grpUsuAlta: TGroupBox;
    fraUsuAlta: TfraUsuario;
    edChequeDesde: TPatternEdit;
    edChequeHasta: TPatternEdit;
    tbFechaEntrega: TToolButton;
    mnuImprimirListCorreo: TMenuItem;
    sdqAcusesCE_METODOPAGO: TStringField;
    cdsAcusesCE_METODOPAGO: TStringField;
    QRDBText7: TQRDBText;
    qrlUsuario: TQRLabel;
    sdqAcusesSO_FECHAALTA: TDateTimeField;
    cdsAcusesSO_FECHAALTA: TDateTimeField;
    QRDBText8: TQRDBText;
    qrlBarras: TArtQRLabel;
    qrlNumero: TQRLabel;
    tbBuscarCodigoBarras: TToolButton;
    pnlBusqueda: TPanel;
    chkSoloActivos: TCheckBox;
    fpListCorreo: TFormPanel;
    Bevel1: TBevel;
    Label6: TLabel;
    btnAceptarListCorreo: TButton;
    btnCancelarListCorreo: TButton;
    edFSobreDesde: TDateComboBox;
    Label7: TLabel;
    edFSobreHasta: TDateComboBox;
    mnuCargaAcuses: TPopupMenu;
    mnuAcusesCargaIndividual: TMenuItem;
    mnuAcusesCargaMasiva: TMenuItem;
    GroupBox4: TGroupBox;
    edArchivoBAPRO: TIntEdit;
    GroupBox6: TGroupBox;
    Label26: TLabel;
    chkTransferencias: TCheckBox;
    edTransferencia: TIntEdit;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbRefrescarClick(Sender: TObject); {$IFDEF REFRESH} override; {$ENDIF}
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure edChequeHastaEnter(Sender: TObject);
    procedure edOrdPagoHastaEnter(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure mnuImprimirSobresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuImprimirAcusesClick(Sender: TObject);
    procedure tbAcuseClick(Sender: TObject);
    procedure tbNroAcuseClick(Sender: TObject);
    procedure btnNroAcuseAceptarClick(Sender: TObject);
    procedure fpNroAcuseEnter(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbFechaEntregaClick(Sender: TObject);
    procedure mnuImprimirListCorreoClick(Sender: TObject);
    procedure qrbDetalleAcusesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure tbBuscarCodigoBarrasClick(Sender: TObject);
    procedure fpListCorreoEnter(Sender: TObject);
    procedure btnAceptarListCorreoClick(Sender: TObject);
    procedure DoCargaAcuses(Sender: TObject);
  private
    pbRefrescarSobres, pbCargaIndividual: Boolean;
    pIdSobre: TTableId;
  	function IsBaja: Boolean;
    procedure CalcTotales;
    procedure DoCargarAcuse(CargaIndividual: Boolean);
    procedure DoGuardarAcuse(IdSobre: TTableId; NroAcuse: String);
    function ValidarAcuse(CargaIndividual: Boolean): Boolean;
  public
  end;

var
  frmSobres: TfrmSobres;

implementation

uses
  AnsiSql, unSesion, CustomDlgs, unDmPrincipal, DateTimeFuncs, unDmFinancials,
  General, unqrListadoCorreo, unArchivo, unConstantArchivo, unUtilsArchivo, StrFuncs,
  Numeros, unCapturarCodigoBarras, unTesoreria;

{$R *.DFM}

procedure TfrmSobres.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('CE_MONTO') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('CE_MONTO')).Currency := True;
end;

procedure TfrmSobres.tbRefrescarClick(Sender: TObject);
var
  sSql, sSqlWhere: String;
begin
  sSql := 'SELECT CE_NUMERO, CE_BENEFICIARIO, CE_ORDENPAGO, CE_FECHACHEQUE, CE_MONTO, SO_CALLE, SO_NUMERO, SO_PISO, ' +
                 'SO_DEPARTAMENTO, SO_LOCALIDAD, SO_CPOSTAL, PV_DESCRIPCION, SO_FECHAIMPRESION, SO_FECHAACUSE, SO_ID, ' +
                 'SO_NROACUSE, TRUNC(SO_FECHAALTA) FALTA, CTBSIT.TB_DESCRIPCION SITUAC_DESCRIPCION, CE_METODOPAGO DESCRIPTION, ' +
                 'UTILES.ARMAR_DOMICILIO(SO_CALLE, SO_NUMERO, SO_PISO, SO_DEPARTAMENTO, NULL) DOMICILIO, ' +
                 'UTILES.ARMAR_POSTAL_LOCALIDAD(SO_CPOSTAL, NULL, SO_LOCALIDAD) CPLOCALIDAD, SO_FECHABAJA, SO_USUBAJA, ' +
                 'TJ_NOMBRE, NVL(TJ_NOMBRE, CE_BENEFICIARIO) BENEFICIARIO, SO_USUALTA, SO_IDDELEGACION, ' +
                 'SO_FECHAENTREGA, EL_NOMBRE, CTBMENVIO.TB_DESCRIPCION MODOENVIO_DESCRIPCION, ' +
                 'UPPER(SUBSTR(CE_METODOPAGO, 1, 2)) METODOPAGO, CE_IDARCHIVOBAPRO IDARCHIVOBAPRO, CE_IDTRANSFERENCIA IDTRANSFERENCIA ' +
            'FROM DEL_DELEGACION, CTB_TABLAS CTBMENVIO, CTB_TABLAS CTBSIT, CTJ_TRABAJADOR, CPV_PROVINCIAS, RCE_CHEQUEEMITIDO, RSO_SOBRE ' +
           'WHERE CE_ID = SO_IDCHEQUEEMITIDO ' +
             'AND SO_PROVINCIA = PV_CODIGO ' +
             'AND SO_IDTRABAJADOR = TJ_ID(+) ' +
             'AND SO_IDDELEGACION = EL_ID(+) ' +
             'AND CE_SITUACION = CTBSIT.TB_CODIGO(+) ' +
             'AND CTBSIT.TB_CLAVE(+) = ''SITCH'' ' +
             'AND SO_MODOENVIO = CTBMENVIO.TB_CODIGO(+) ' +
             'AND CTBMENVIO.TB_CLAVE(+) = ''MOENS''';

  sSqlWhere := SqlBetween(' AND CE_NUMERO', edChequeDesde.Text, edChequeHasta.Text) +
               SqlBetween(' AND CE_ORDENPAGO', edOrdPagoDesde.Value, edOrdPagoHasta.Value) +
               SqlBetween(' AND CE_FECHACHEQUE', edFechaChequeDesde.Date, edFechaChequeHasta.Date) +
               SqlBetween(' AND SO_FECHAIMPRESION', edFechaImprDesde.Date, edFechaImprHasta.Date) +
               SqlBetweenDateTime(' AND SO_FECHAALTA', edFechaAltaDesde.Date, edFechaAltaHasta.Date);

  if Trim(edBeneficiario.Text) <> '' then
    sSqlWhere := sSqlWhere + ' AND CE_BENEFICIARIO LIKE ' + SQL_QUOTE + SqlString(Trim(edBeneficiario.Text)) + SQL_WILLCARD + SQL_QUOTE;

  if Trim(edNroAcuse.Text) <> '' then
    sSqlWhere := sSqlWhere + ' AND SO_NROACUSE=' + SqlValue(Trim(edNroAcuse.Text));

  case rgImpresos.ItemIndex of
    0: sSqlWhere := sSqlWhere + ' AND SO_FECHAIMPRESION IS NOT NULL'; // impresos
    1: sSqlWhere := sSqlWhere + ' AND SO_FECHAIMPRESION IS NULL';     // no impresos
  end;

  if cmbMetodoPago.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND CE_METODOPAGO ' +  cmbMetodoPago.InSql;

  if cmbSituaciones.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND CE_SITUACION ' +  cmbSituaciones.InSql;

  if fraUsuAlta.IsSelected then
    sSqlWhere := sSqlWhere + ' AND SO_USUALTA = ' + SqlValue(fraUsuAlta.UserID);

  if chkSoloActivos.Checked then
    sSqlWhere := sSqlWhere + ' AND SO_FECHABAJA IS NULL';

  if chkTransferencias.Checked then
    sSql := sSql + ' AND TESORERIA.IS_CHEQUETRANSFERENCIA(CE_ID) = ''S''';

  if edArchivoBAPRO.IsFilled then
    sSql := sSql + ' AND CE_IDARCHIVOBAPRO = ' + SqlValue(edArchivoBAPRO.Value);

  if not edTransferencia.IsEmpty then
    sSql := sSql + ' AND CE_IDTRANSFERENCIA = ' + SqlValue(edTransferencia.Value);

  sdqConsulta.Sql.Text := sSql + sSqlWhere + NVL(SortDialog.OrderBy, ' ORDER BY SO_ID');
  inherited;

  if tbSumatoria.Down then
    CalcTotales;
end;

procedure TfrmSobres.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmSobres.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmSobres.edChequeHastaEnter(Sender: TObject);
begin
  if (edChequeHasta.Text = '') and (edChequeDesde.Text <> '') then
    edChequeHasta.Text := edChequeDesde.Text;
end;

procedure TfrmSobres.edOrdPagoHastaEnter(Sender: TObject);
begin
  if edOrdPagoHasta.IsEmpty and not edOrdPagoDesde.IsEmpty then
    edOrdPagoHasta.Text := edOrdPagoDesde.Text;
end;

procedure TfrmSobres.tbLimpiarClick(Sender: TObject);
begin
  edChequeDesde.Clear;
  edChequeHasta.Clear;
  edFechaChequeDesde.Clear;
  edFechaChequeHasta.Clear;
  edOrdPagoDesde.Clear;
  edOrdPagoHasta.Clear;
  edBeneficiario.Clear;
  edNroAcuse.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  edFechaImprDesde.Clear;
  edFechaImprHasta.Clear;
  edArchivoBAPRO.Clear;
  edTransferencia.Clear;
  rgImpresos.ItemIndex := 2; // todos
  cmbMetodoPago.ClearChecks;
  cmbSituaciones.ClearChecks;
  edTotalRegistros.Value := 0;
  fraUsuAlta.Limpiar;
  chkSoloActivos.Checked    := True;
  chkTransferencias.Checked := False;

  inherited;
end;

procedure TfrmSobres.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmSobres.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnSelectAll;
end;
           
procedure TfrmSobres.mnuImprimirSobresClick(Sender: TObject);
var
  i: Integer;
  sSql: String;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');

  if MsgBox('Coloque en la impresora los sobres a imprimir.' + CRLF + '¿ Desea comenzar la impresión ?', MB_YESNO + MB_ICONQUESTION ) = IDYES then
  begin
  	for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
    	sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      rptSobres.Print;

      sSql :=
      	'UPDATE RSO_SOBRE' +
        	' SET SO_FECHAIMPRESION = ACTUALDATE,' +
          		' SO_USUIMPRESION = :Usuario' +
        ' WHERE SO_ID = :Id' +
        	' AND SO_FECHAIMPRESION IS NULL';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('SO_ID').AsInteger]);
    end;

    if MsgBox('¿ Desea imprimir los acuses correspondientes ?', MB_YESNO + MB_ICONQUESTION ) = IDYES then
    	mnuImprimirAcusesClick(nil);

    tbRefrescarClick(nil);
	end;
end;

procedure TfrmSobres.FormCreate(Sender: TObject);
begin
  inherited;
  dmFinancials.Conectar;

  rptSobres.Visible := False;
  rptAcuses.Visible := False;

  OpenQuery(sdqMetodoPagoFiltro);
end;

procedure TfrmSobres.mnuImprimirAcusesClick(Sender: TObject);
var
  i: Integer;
  IdDocAcuseCorreo: TTableId;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');

  if MsgBox('Coloque en la impresora los acuses a imprimir.' + CRLF + '¿ Desea comenzar la impresión ?', MB_YESNO + MB_ICONQUESTION ) = IDYES then
  begin
    IdDocAcuseCorreo   := Get_IdTipoDocumentoAcuseCorreoTesoreria();
    qrlUsuario.Caption := Sesion.UserID;

  	cdsAcuses.Open;
    sdqAcuses.Close;

    try
      BeginTrans;
      try
        for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
            sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

            DoAltaDocumentoCarpeta(ID_CARPETA_TESORERIA, IdDocAcuseCorreo, sdqConsulta.FieldByName('CE_ORDENPAGO').AsString, True, False);

            with cdsAcuses do
              begin
                Insert;

                FieldByName('CE_BENEFICIARIO').Value := sdqConsulta.FieldByName('BENEFICIARIO').Value;
                FieldByName('DOMICILIO').Value       := sdqConsulta.FieldByName('DOMICILIO').Value;
                FieldByName('SO_CPOSTAL').Value      := sdqConsulta.FieldByName('SO_CPOSTAL').Value;
                FieldByName('SO_LOCALIDAD').Value    := sdqConsulta.FieldByName('SO_LOCALIDAD').Value;
                FieldByName('PV_DESCRIPCION').Value  := sdqConsulta.FieldByName('PV_DESCRIPCION').Value;
                FieldByName('CE_ORDENPAGO').Value    := sdqConsulta.FieldByName('CE_ORDENPAGO').Value;
                FieldByName('CE_METODOPAGO').Value   := sdqConsulta.FieldByName('METODOPAGO').Value;
                FieldByName('SO_FECHAALTA').Value    := sdqConsulta.FieldByName('FALTA').Value;

                Post;
              end;
          end;

        CommitTrans;
        rptAcuses.Print;
      except
        on E: Exception do
          begin
            RollBack(True);

            raise Exception.Create(E.Message + CRLF + 'Error al imprimir los acuses.');
          end;
      end;
    finally
    	cdsAcuses.Close;
    end;
  end;
end;

procedure TfrmSobres.tbAcuseClick(Sender: TObject);
var
  i: Integer;
  FAcuse: TDateTime;
  sSql: String;  
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');

  FAcuse := InputBoxDate('Sobres', 'F. de Acuse', DBDate, 0, DBDate);

  if (FAcuse <> 0) and (FAcuse <> -1) then
  begin
  	for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
    	sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      sSql :=
      	'UPDATE RSO_SOBRE' +
        	' SET SO_FECHAACUSE = :FechaAcuse,' +
          		' SO_USUACUSE = :Usuario' +
        ' WHERE SO_ID = :Id' +
        	' AND SO_FECHAACUSE IS NULL';
      EjecutarSqlEx(sSql, [TDateTimeEx.Create(FAcuse), Sesion.UserId, sdqConsulta.FieldByName('SO_ID').AsInteger]);
    end;

    tbRefrescarClick(nil);
  end;
end;

procedure TfrmSobres.tbNroAcuseClick(Sender: TObject);
begin
  tbNroAcuse.CheckMenuDropdown;
end;

procedure TfrmSobres.tbEliminarClick(Sender: TObject);
var
  sSql: String;
  i: Integer;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');

  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

    Verificar(IsBaja, Grid, 'Uno de los registros seleccionados ya se encuentra dado de baja.');
  end;

  if (MsgBox('¿ Desea dar de baja los registros seleccionados ?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    BeginTrans;
    try
      for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

        sSql :=
          'UPDATE RSO_SOBRE' +
            ' SET SO_FECHABAJA = ACTUALDATE,' +
                ' SO_USUBAJA = :Usuario' +
          ' WHERE SO_ID = :Id';
        EjecutarSqlSTEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('SO_ID').AsInteger]);
      end;

      CommitTrans;

      if sdqConsulta.Active then
      begin
        sdqConsulta.Refresh;
        CheckButtons;
      end
      else
        tbRefrescarClick(nil);
    except
      on E: Exception do
      begin
        RollBack;

        raise Exception.Create(E.Message + CRLF + 'Error al borrar los sobres.');
      end;
    end;
  end;
end;

function TfrmSobres.IsBaja: Boolean;
begin
  Result := sdqConsulta.Active and (not sdqConsulta.FieldByName('SO_FECHABAJA').IsNull);
end;

procedure TfrmSobres.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if IsBaja then
    AFont.Color := clRed;
end;

procedure TfrmSobres.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmFinancials.Desconectar;
end;

procedure TfrmSobres.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
  pnlTotalRegistros.Visible := tbSumatoria.Down;
end;

procedure TfrmSobres.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      if tbSumatoria.Down and sdqConsulta.Active then
        edTotalRegistros.Value := sdqConsulta.RecordCount;
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales de registros.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmSobres.tbFechaEntregaClick(Sender: TObject);
var
  i: Integer;
  FEntrega: TDateTime;
  sSql: String;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');
  Verificar(not sdqConsulta.FieldByName('SO_IDDELEGACION').IsNull and (Sesion.Delegacion <> sdqConsulta.FieldByName('SO_IDDELEGACION').AsInteger), Grid, 'La delegación del usuario logueado debe ser la misma que la del sobre.');

  FEntrega := InputBoxDate('Sobres', 'F. de Entrega', DBDate, 0, DBDate);

  if (FEntrega <> 0) and (FEntrega <> -1) then
  begin
  	for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
    	sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      sSql :=
      	'UPDATE RSO_SOBRE' +
        	' SET SO_FECHAENTREGA = :FechaEntrega' +
        ' WHERE SO_ID = :Id' +
        	' AND SO_FECHAENTREGA IS NULL';
      EjecutarSqlEx(sSql, [TDateTimeEx.Create(FEntrega), sdqConsulta.FieldByName('SO_ID').AsInteger]);
    end;

    tbRefrescarClick(nil);
  end;
end;

procedure TfrmSobres.mnuImprimirListCorreoClick(Sender: TObject);
begin
  if fpListCorreo.ShowModal = mrOk then
    with TqrListadoCorreo.Create(Self) do
      Imprimir(edFSobreDesde.Date, edFSobreHasta.Date, fraUsuAlta.UserId, cmbMetodoPago.InSql);
end;

procedure TfrmSobres.fpListCorreoEnter(Sender: TObject);
begin
  edFSobreDesde.Date := DBDateTime();
  edFSobreHasta.Date := edFSobreDesde.Date;
end;

procedure TfrmSobres.btnAceptarListCorreoClick(Sender: TObject);
begin
  Verificar(edFSobreDesde.IsEmpty, edFSobreDesde, 'Debe indicar la fecha del sobre desde.');
  Verificar(edFSobreHasta.IsEmpty, edFSobreHasta, 'Debe indicar la fecha del sobre hasta.');

  fpListCorreo.ModalResult := mrOk
end;

procedure TfrmSobres.qrbDetalleAcusesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  sCodBarras: String;
begin
  sCodBarras := GetCodBarrasClave('', cdsAcuses.FieldByName('CE_ORDENPAGO').AsString);

  qrlNumero.Caption := sCodBarras;
  qrlBarras.Caption := '*' + qrlNumero.Caption + '*';
end;

procedure TfrmSobres.tbBuscarCodigoBarrasClick(Sender: TObject);
begin
  DoBuscarCampoCodigoBarrasArchivo(Self, ID_CARPETA_TESORERIA, 'CE_ORDENPAGO', '');
end;

procedure TfrmSobres.DoCargarAcuse(CargaIndividual: Boolean);
var
  iOrdenPago: Integer;
  bOk: Boolean;
  sSql, sOrdenPago: String;
begin
  if CargaIndividual then
    begin
      Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar una fila de la grilla.');
      Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo una fila de la grilla.');

      fpNroAcuse.Caption := 'Carga del Nro. de Acuse - OP: ' + sdqConsulta.FieldByName('CE_ORDENPAGO').AsString;

      if fpNroAcuse.ShowModal = mrOk then
        tbRefrescarClick(nil);
    end
  else
    begin
      while True do
        begin
          sOrdenPago := Trim(Get_CodigoBarras());

          if IsEmptyString(sOrdenPago) then
            Break;

          bOk := False;
          try
            iOrdenPago := StrToInt(sOrdenPago);

            if not Is_ExisteOrdenPago(iOrdenPago) then
              InfoHint(nil, 'La orden de pago no existe.')
            else
              begin
                sSql := 'SELECT RSO1.SO_ID ' +
                          'FROM RCE_CHEQUEEMITIDO, RSO_SOBRE RSO1 ' +
                         'WHERE RSO1.SO_IDCHEQUEEMITIDO = CE_ID ' +
                           'AND RSO1.SO_FECHABAJA IS NULL ' +
                           'AND RSO1.SO_MODOENVIO IS NOT NULL ' +
                           'AND CE_ORDENPAGO = :OrdenPago ' +
                           'AND RSO1.SO_FECHAIMPRESION = (SELECT MAX(RSO2.SO_FECHAIMPRESION) ' +
                                                           'FROM RSO_SOBRE RSO2 ' +
                                                          'WHERE RSO2.SO_FECHABAJA IS NULL ' +
                                                            'AND RSO2.SO_MODOENVIO IS NOT NULL ' +
                                                            'AND RSO2.SO_FECHAIMPRESION IS NOT NULL ' +
                                                            'AND RSO2.SO_IDCHEQUEEMITIDO = CE_ID)';
                pIdSobre := ValorSqlIntegerEx(sSql, [iOrdenPago], ART_EMPTY_ID);

                if pIdSobre = ART_EMPTY_ID then
                  InfoHint(nil, 'No se ha encontrado el sobre de la orden de pago.')
                else
                  bOk := True;
              end;
          except
            on E: Exception do
              ErrorMsg(E, 'Error al intentar leer el código de barras - Posiblemente el formato de la Orden de Pago no sea el que corresponda.');
          end;

          if bOk then
            begin
              fpNroAcuse.Caption := 'Carga del Nro. de Acuse - OP: ' + sOrdenPago;

              if fpNroAcuse.ShowModal <> mrOk then
                Break;
            end;
        end;

      if pbRefrescarSobres and (MsgBox('¿ Desea refrescar la grilla ?', MB_YESNO + MB_ICONQUESTION) = IDYES) then
        tbRefrescarClick(nil);
    end;
end;

procedure TfrmSobres.DoGuardarAcuse(IdSobre: TTableId; NroAcuse: String);
var
  sSql: String;
begin
  sSql :=  'UPDATE RSO_SOBRE ' +
            	'SET SO_NROACUSE = :NroAcuse ' +
            'WHERE SO_ID = :Id';
  EjecutarSqlEx(sSql, [NroAcuse, IdSobre]);
end;

function TfrmSobres.ValidarAcuse(CargaIndividual: Boolean): Boolean;
var
  sCad, sCodAcuse: String;
begin
  sCodAcuse := Trim(edAltaNroAcuse.Text);

  Verificar(sCodAcuse = '', edAltaNroAcuse, 'Debe ingresar el nro. de acuse.');
  Verificar(Length(sCodAcuse)<= 2, edAltaNroAcuse, 'El nro. de acuse debe tener al menos 2 caracteres.');

  sCad := StrLeft(sCodAcuse, 2);
  Verificar(not ((sCad >= 'AA') and (sCad <= 'ZZ')), edAltaNroAcuse, 'Los dos primeros caracteres del nro. de acuse deben ser letras.');

  sCad := StrMid(sCodAcuse, 3);
  Verificar(not IsNumber(sCad), edAltaNroAcuse, 'A partir del tercer caracter del nro. de acuse los caracteres deben ser numéricos.');

  if CargaIndividual then
    Verificar(sdqConsulta.FieldByName('SO_FECHAIMPRESION').IsNull, edAltaNroAcuse, 'El sobre debe estar impreso.');

  Result := True;
end;

procedure TfrmSobres.btnNroAcuseAceptarClick(Sender: TObject);
var
  sCodAcuse: String;
  IdSobre: TTableId;
begin
  if ValidarAcuse(pbCargaIndividual) then
    begin
      sCodAcuse := Trim(edAltaNroAcuse.Text);

      if pbCargaIndividual then
        IdSobre := sdqConsulta.FieldByName('SO_ID').AsInteger
      else
        IdSobre := pIdSobre;

      if IdSobre = ART_EMPTY_ID then
        InfoHint(nil, 'No se ha encontrado el sobre de la orden de pago.')
      else
        begin
          DoGuardarAcuse(IdSobre, sCodAcuse);

          pbRefrescarSobres      := True;
          fpNroAcuse.ModalResult := mrOk;
        end;
    end;
end;

procedure TfrmSobres.fpNroAcuseEnter(Sender: TObject);
begin
	edAltaNroAcuse.Text := '';
end;

procedure TfrmSobres.DoCargaAcuses(Sender: TObject);
begin
  pbRefrescarSobres := False;
  pbCargaIndividual := (Sender = mnuAcusesCargaIndividual);

  DoCargarAcuse(pbCargaIndividual)
end;

end.

