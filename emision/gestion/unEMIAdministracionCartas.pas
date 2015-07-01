unit unEMIAdministracionCartas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unBaseAdministracionCartas, SDEngine, Menus, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, DB, unFraDomicilioTrab, ComCtrls, StdCtrls,
  unFraCodigoDescripcion, unfraCtbTablas, ExtCtrls, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, CardinalEdit, ToolWin,
  ToolEdit, DateComboBox, DBCheckCombo, ComboEditor, CheckCombo,
  unFraStaticCTB_TABLAS, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, Mask, PatternEdit, IntEdit,
  unCustomDataModule, FolderDialog, undmPrincipal, unArtDbFrame,
  unFraEmpresa, unFraSDA_DETALLEARCHIVO, unfraFirmante;

type
  TfrmEMIAdministracionCartas = class(TfrmBaseAdministracionCartas)
    fpSeleccionarCarpeta: TFormPanel;
    Label18: TLabel;
    Bevel6: TBevel;
    edCarpetaDestino: TEdit;
    btnSeleccionarCarpeta: TButton;
    btnAceptar3: TButton;
    folderDialog: TFolderDialog;
    btnCancelarCarpeta: TButton;
    fraEmpresa: TfraEmpresa;
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnSeleccionarCarpetaClick(Sender: TObject);
    procedure btnAceptar3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fpOpcionesImpresionShow(Sender: TObject);
  protected
    function GetSql: String; override;
    procedure NuevaCarta(Sender: TObject); override;
    function IsRegistroModificacionValido: Boolean; override;
    procedure ValidacionesAdicRegistrosImpresionCartaDoc; override;
    procedure ValidacionesAdicRegistrosEnvioVentElectronica; override;
  public
  end;

var
  frmEMIAdministracionCartas: TfrmEMIAdministracionCartas;

implementation

uses
  unEMIGeneracionCartas, unArt, CustomDlgs, Printers, unRptCartaDocHeader,
  unComunes, unRptCartaDocumento, unRptSituacionFacturacion, AnsiSql;

{$R *.dfm}


function TfrmEMIAdministracionCartas.GetSql: String;
var
  sSql, sCAT, sOuterCRC: String;
  bPorTrackTrace: Boolean;
begin
  bPorTrackTrace     := (Trim(edTrackTrace.Text)<>'');

  if bPorTrackTrace then
    sOuterCRC := ''
  else
    sOuterCRC := '(+)';

  sSql := 'SELECT UTILES.ARMAR_NROCARTADOCUMENTO(CA_NROCARTADOC) NROCARTADOC, UTILES.ARMAR_CUIT(HM_CUIT) CUIT, ' +
                 'HM_NOMBRE EMPRESA, HC_CONTRATO CONTRATO, FO_FORMULARIO FORMULARIO, TC_NOMBRE TIPOCARTA, ' +
                 'CORREO.TB_DESCRIPCION ULTCORREO, CA_USUIMPRESION, TRUNC(CA_FECHAIMPRESION) FECHAIMPRESION, ' +
                 'DECODE(CA_RECEPCIONOK, ''S'', ''Si'', ''No'') RECEPCIONOK, CA_FECHARECEPCION, ' +
                 'CODRE.TB_DESCRIPCION DESC_RECEPCION, TO_CHAR(FI_ID) CODIGOFIRMA, FI_FIRMANTE, ' +
                 'TRUNC(CA_FECHAREIMPRESION) FECHAREIMPRESION, CA_OBSERVACIONES, CA_USUREIMPRESION, CA_ID, CA_MANUAL, ' +
                 'CA_FECHABAJA, NVL(CA_CORREOREIMPRESION, CA_CORREO) CORREO, CA_IDRECEPCIONCARTADOC, ' +
                 'CA_IDCARTAAREEMPLAZAR, CA_RECEPCIONOK, CA_CODRECEPCION, CA_IDFORMULARIO, CA_IDENDOSO, CA_USUALTA, ' +
                 'TRUNC(CA_FECHAALTA) FECHAALTA, EL_NOMBRE, AFILIACION.GET_PORCVARIABLECARTA(CA_ID) PORCVARIABLE, ' +
                 'AFILIACION.GET_SUMAFIJACARTA(CA_ID) SUMAFIJA, CA_IDAREATEXTO, RC_CODIGOBARRAS_CD TRACKYTRACE, TC_TEXTOMODIFICABLE, AT_AREA, AT_MODULO, CA_TIPOSALIDA, CCA.* ' +
            'FROM CRC_RECEPCIONCARTADOC, AEN_ENDOSO, AHC_HISTORICOCONTRATO, AHM_HISTORICOEMPRESA,  AFO_FORMULARIO, CTC_TEXTOCARTA, CFI_FIRMA, CTB_TABLAS SALIDA, ' +
                 'CTB_TABLAS CORREO, CTB_TABLAS CODRE, CAT_AREATEXTO, CTA_TEXTOAREA, DEL_DELEGACION, CCA_CARTA CCA ' +
           'WHERE CA_IDTEXTOCARTA=TC_ID ' +
             'AND TA_IDTEXTOCARTA=TC_ID ' +
             'AND TA_IDAREATEXTO=AT_ID ' +
             'AND CA_IDAREATEXTO=AT_ID ' +   // por ahora va esta condición, la agregué porque cuando buscaba una carta de compensación, me la triplicaba en la grilla
             'AND ' + sCAT + 'AT_AREA IN ('+ Area + ') ' +
             'AND CORREO.TB_CODIGO(+) = NVL(CA_CORREOREIMPRESION, CA_CORREO) ' +
             'AND CORREO.TB_CLAVE(+) = ''CORRE'' ' +
             'AND CODRE.TB_CODIGO(+)=CA_CODRECEPCION ' +
             'AND CODRE.TB_CLAVE(+)=''CODRE'' ' +
             'AND SALIDA.TB_CLAVE=''TSCDO'' ' +
             'AND SALIDA.TB_CODIGO=CA_TIPOSALIDA ' +
             'AND HC_IDFORMULARIO=FO_ID ' +
             'AND EN_IDHISTORICOCONTRATO=HC_ID ' +
             'AND EN_IDHISTORICOEMPRESA=HM_ID ' +
             'AND NVL(CA_IDFIRMAREIMPRESION, CA_IDFIRMA)=FI_ID ' +
             'AND CA_IDENDOSO=EN_ID ' +
             'AND CA_IDDELEGACION=EL_ID ' +
             'AND CA_IDENDOSO IS NOT NULL ' +
             'AND CA_IDRECEPCIONCARTADOC=RC_ID ' + sOuterCRC + ' ' + 
            GetWhere;

  if fraEmpresa.IsSelected then
    sSql := sSql + ' AND HC_CONTRATO = ' + SqlValue(fraEmpresa.Contrato);

  Result := sSql;
end;

function TfrmEMIAdministracionCartas.IsRegistroModificacionValido: Boolean;
begin
  Result := False;

  // la carta no debe estar dada de baja
  if not sdqConsulta.FieldByName( 'CA_FECHABAJA' ).IsNull then
    InvalidMsg ( Grid, 'La carta documento se encuentra dada de baja' )

(*
  // la carta no debe estar recepcionada
  else if not sdqConsulta.FieldByName( 'CA_FECHARECEPCION' ).IsNull then
    InvalidMsg ( Grid, 'La carta documento ya ha sido recepcionada' )
*)
  else
    Result := True;
end;

procedure TfrmEMIAdministracionCartas.NuevaCarta(Sender: TObject);
begin
  with TfrmEMIGeneracionCartas.Create(Self) do
  try
    if Sender = tbNuevo Then
      IdCarta := ART_EMPTY_ID
    else
      IdCarta := sdqConsulta.FieldByName('CA_ID').AsInteger;

    CodArea := Self.Area;
    Preparar(IdCarta);

    if Mostrar and sdqConsulta.Active then
      sdqConsulta.Refresh;
  finally
    free;
  end;
end;

procedure TfrmEMIAdministracionCartas.tbNuevoClick(Sender: TObject);
begin
  NuevaCarta(Sender);
end;

procedure TfrmEMIAdministracionCartas.btnAceptarImpresionClick(Sender: TObject);
var
  OldImpresora: Integer;
  i: integer;
  tModulo: TTipoModulo;
  sModulo, sArea: String;
  IdCarta: Integer;
  sSalida: TSalidaReport;
  sPrimerFormatoSalida: String;
  sCarpetaDestino: String;
begin
  inherited;

  if ContinuarImpresion() then
  begin
    OldImpresora         := Printer.PrinterIndex;
    Printer.PrinterIndex := cmbImpresoras.ItemIndex;
    try
      PararImpresion := False;
      btnParar.Enabled := True;

      for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

        if i = 0 then
          sPrimerFormatoSalida := sdqConsulta.FieldByName('CA_TIPOSALIDA').AsString;

        Verificar((sPrimerFormatoSalida <> sdqConsulta.FieldByName('CA_TIPOSALIDA').AsString), Grid, 'Si decide imprimir varias cartas al mismo tiempo, estas tienen que tener el mismo formato de salida.');
      end;

      if sPrimerFormatoSalida = 'VE' then   // Si el formato de salida es Ventanilla Electrónica..
        if fpSeleccionarCarpeta.ShowModal = mrOk then
          sCarpetaDestino := edCarpetaDestino.Text
        else
          Exit;

      for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        Verificar(PararImpresion, btnAceptarImpresion, 'Ha decidido cancelar la impresión.');

        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        sArea   := sdqConsulta.FieldByName('AT_AREA').AsString;
        sModulo := sdqConsulta.FieldByName('AT_MODULO').AsString;
        IdCarta := sdqConsulta.FieldByName('CA_ID').AsInteger;

        tModulo := taEmision;

        if rbPreview.Checked then
          sSalida := srPreview
        else
          sSalida := srPrint;

        if ExisteSqlEx('SELECT 1 ' +
                       'FROM emi.igs_gestionablesalida, ctc_textocarta, cca_carta ' +
                       'WHERE ca_idtextocarta = tc_id ' +
                       ' AND gs_idcartatexto = tc_id ' +
                       ' AND gs_idgestionable in (19, 20) ' +
                       ' AND ca_id = :idcarta ', [IdCarta]) then
          DoImprimirCartaSitFacturacion(idCarta, nil, '', taEmision, sSalida, tmBeginEnd, edCantCopias.Value,
                                        false, false, false, true, false, true)
        else
          DoImprimirCarta(IdCarta, tModulo, sSalida, tmBeginEnd, edCantCopias.Value, False, True,
                          False, False, false, True, False, False, False, False, False,
                          False, False, '', False,
                          sdqConsulta.FieldByName('NROCARTADOC').IsNull);

        BarProgreso.Position := Round((i + 1) / Grid.SelectedRows.Count * 100);
        Application.ProcessMessages;
      end;

      fpOpcionesImpresion.ModalResult := mrOk;
      Grid.UnSelectAll;
      sdqConsulta.Refresh;
    finally
      Printer.PrinterIndex := OldImpresora;
      btnParar.Enabled := False;
    end;
  end;
end;

procedure TfrmEMIAdministracionCartas.Button1Click(Sender: TObject);
begin
  fpOpcionesImpresion.ModalResult := mrCancel;
end;

procedure TfrmEMIAdministracionCartas.btnSeleccionarCarpetaClick(
  Sender: TObject);
begin
  if folderDialog.Execute then
    edCarpetaDestino.Text := folderDialog.Directory;
end;

procedure TfrmEMIAdministracionCartas.btnAceptar3Click(Sender: TObject);
begin
  fpSeleccionarCarpeta.ModalResult := mrOk;
end;

procedure TfrmEMIAdministracionCartas.FormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresa.ShowBajas := true;
end;

procedure TfrmEMIAdministracionCartas.fpOpcionesImpresionShow(
  Sender: TObject);
begin
  inherited;
  if not rbImprimir.Enabled and rbPreview.Enabled then
    rbPreview.Checked := true;

  if rbImprimir.Enabled then
    rbImprimir.Checked := true;
end;

procedure TfrmEMIAdministracionCartas.ValidacionesAdicRegistrosImpresionCartaDoc;
begin
  inherited;
end;

procedure TfrmEMIAdministracionCartas.ValidacionesAdicRegistrosEnvioVentElectronica;
begin
  inherited;
end;

end.
