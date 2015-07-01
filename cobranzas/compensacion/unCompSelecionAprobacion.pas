unit unCompSelecionAprobacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  PeriodoPicker, StdCtrls, unArtFrame, unArtDbFrame, unFraEmpresa,
  ToolEdit, CurrEdit, Mask, PatternEdit, IntEdit, FormPanel, Menus, Buttons,
  unArtDBAwareFrame, RxToolEdit, RxCurrEdit, RxPlacemnt;

type
  TfrmCompSelecionAprobacion = class(TfrmCustomConsulta)
    fraEmpresa: TfraEmpresa;
    Bevel1: TBevel;
    lblPerDesde: TLabel;
    edPeriodoDesde: TPeriodoPicker;
    lblPerHasta: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    chkEmpresasActivas: TCheckBox;
    Bevel2: TBevel;
    Label1: TLabel;
    fpTotales: TFormPanel;
    Label2: TLabel;
    edCantEmpresas: TIntEdit;
    Label3: TLabel;
    edTotSiniestros: TCurrencyEdit;
    Label4: TLabel;
    edTotDeuda: TCurrencyEdit;
    Bevel3: TBevel;
    btnAceptar: TButton;
    pmnuGrilla: TPopupMenu;
    mnuSelectAll: TMenuItem;
    mnuSelectClear: TMenuItem;
    mnuSelectInvert: TMenuItem;
    fpCompensar: TFormPanel;
    btnCompensar: TButton;
    btnCancelar: TButton;
    Bevel4: TBevel;
    rbCartaDocumento: TRadioButton;
    rbCartaComercial: TRadioButton;
    rbCartaDocumentoSinIntimacion: TRadioButton;
    fpProcesando: TFormPanel;
    Shape1: TShape;
    aniReloj: TAnimate;
    lbTitulo: TLabel;
    lbAccion: TLabel;
    SpeedButton1: TSpeedButton;
    imgCompensar: TImage;
    tbTotales: TToolButton;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    chkImprimir: TCheckBox;
    chkImprimirFirma: TCheckBox;
    Bevel5: TBevel;
    pmnuLiberar: TPopupMenu;
    ImprimirListado: TMenuItem;
    N2: TMenuItem;
    LiberarSiniestros: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure mnuSelectAllClick(Sender: TObject);
    procedure mnuSelectClearClick(Sender: TObject);
    procedure mnuSelectInvertClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbTotalesClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbLimpiarClick(Sender: TObject);
    procedure chkImprimirClick(Sender: TObject);
    procedure rbCartaDocumentoClick(Sender: TObject);
    procedure fpCompensarEnter(Sender: TObject);
    procedure ImprimirListadoClick(Sender: TObject);
    procedure LiberarSiniestrosClick(Sender: TObject);
  private
    rTotales: array[0..1] of Extended;
    procedure DoHabilitarPeriodos(bHabilitar: Boolean);
    function ValidarRegSeleccionados: Boolean;
    procedure ShowStatus(AText: string);
  protected
    procedure ClearData; override;
    procedure RefreshData; override;
  public
  end;

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSql, SqlFuncs, CustomDlgs, unArt, DBFuncs, General,
  unComunes, unCompReimpresionCartas, unRptCartaDocCompensacion, VCLExtra,
  unGrids, unCustomDataModule, unCompLstSiniestrosLiberar, unVisualizador,
  unFirmantes;

{$R *.DFM}

const
  COL_TOTALES: array[0..1] of string = ('DEUDA', 'IMPORPERI');

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmSelecionAprobacion }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.ClearData;
begin
  fraEmpresa.Clear;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
  chkEmpresasActivas.Checked := False;
  DoHabilitarPeriodos( True );

  rTotales[0] := 0;
  rTotales[1] := 0;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.RefreshData;
var
  sSql: string;
begin
  Verificar((edPeriodoDesde.Text <> '') and (edPeriodoHasta.Text <> '') and (edPeriodoDesde.Text > edPeriodoHasta.Text), edPeriodoHasta, 'El Periodo Hasta no puede ser menor al Periodo Desde');

  DoHabilitarPeriodos( False );

  sSql := 'SELECT EM_CUIT, EM_NOMBRE, CO_CONTRATOPRINCIPAL CONTRATOPRINC, CO_ESTADO, ' +
                 'CO_FECHABAJA, CO_MOTIVOBAJA, EM_FECHACONCURSO,  ' +
                 'EM_ULTIMOMESCONCURSO, EM_FECHAQUIEBRA, EM_ULTIMOMESQUIEBRA, ' +
                 'COMPDEUDA.GET_DEUDACONTRATO(CO_CONTRATO, ' + SqlString(edPeriodoDesde.Text, True, True) + ', ' + SqlString(edPeriodoHasta.Text, True, True) + ') DEUDA, ' +
                 'CD.CA_NROCARTADOC CD_NROCARTADOC, CD.CA_FECHAIMPRESION CD_FECHAIMPRESION, ' +
                 'CC.CA_NROCARTADOC CC_NROCARTADOC, CC.CA_FECHAIMPRESION CC_FECHAIMPRESION, ' +
                 'IMPORPERI, AGCESTUDIO.GC_NOMBRE NOMBREESTJURIDICO, AFILIACION.IS_EMPRESAVIP(CO_CONTRATOPRINCIPAL) ESVIP, ' +
                 'TR_CODIGO CODREG, CO_CONTRATO CONTRATOEXT, EM_CUIT || TR_CODIGO CUITREG, ' +
                 'AGCGESTOR.GC_NOMBRE NOMBREGESTOR ' +
            'FROM ATR_TIPOREGIMEN, AGC_GESTORCUENTA AGCESTUDIO, AGC_GESTORCUENTA AGCGESTOR, ACO_CONTRATO_EXT, ' +
                 'AEM_EMPRESA, CCA_CARTA CD, CCA_CARTA CC, ' +
                 '(SELECT EX_CUIT, SUM(LE_IMPORPERI) IMPORPERI ' +
                    'FROM SLE_LIQUIEMPSIN, SEX_EXPEDIENTES ' +
                   'WHERE EX_SINIESTRO = LE_SINIESTRO ' +
                     'AND EX_ORDEN = LE_ORDEN ' +
                     'AND EX_RECAIDA = LE_RECAIDA ' +
                     'AND LE_ESTADO = ''V'' ' +
                   'GROUP BY EX_CUIT ' +
                  'HAVING SUM(LE_IMPORPERI) > 0) ' +
           'WHERE CO_IDEMPRESA = EM_ID ' +
             'AND CD.CA_ID(+) = COMPDEUDA.GET_CARTAID(CO_CONTRATO, 1) ' +
             'AND CC.CA_ID(+) = COMPDEUDA.GET_CARTAID(CO_CONTRATO, 2) ' +
             'AND COMPDEUDA.IS_CONTRATOCONDEUDA(CO_CONTRATO, ' + SqlString(edPeriodoDesde.Text, True, True) + ', ' + SqlString(edPeriodoHasta.Text, True, True) + ') = ''S'' ' +
             'AND CO_IDESTUDIO = AGCESTUDIO.GC_ID(+) ' +
             'AND CO_IDGESTOR = AGCGESTOR.GC_ID(+) ' +
             'AND EX_CUIT = EM_CUIT ' +
             'AND CO_IDTIPOREGIMEN_ORIG = TR_ID';

  if fraEmpresa.IsSelected Then
    sSql := sSql + ' AND EM_CUIT = ' + SqlValue(fraEmpresa.mskCUIT.Text);

  if chkEmpresasActivas.Checked Then
    sSql := sSql + ' AND CO_ESTADO = ''1'' ';

  sdqConsulta.SQL.Text := sSql;
  inherited;

  tbTotalesClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.FormCreate(Sender: TObject);
begin
  inherited;

  fraEmpresa.ShowBajas := True;
  aniReloj.ResName := 'RELOJ';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if Highlight then
  begin
    BackGround  := clTeal;
    AFont.Color := clWhite;
  end else
  begin
    BackGround  := clInfoBk;
    AFont.Color := clBlack;
  end;

  if not sdqConsulta.FieldByName('CO_FECHABAJA').IsNull Then
  begin
    if AreIn(Field.FieldName, ['EM_CUIT', 'EM_NOMBRE', 'CONTRATOPRINC', 'CO_ESTADO', 'CO_FECHABAJA', 'CO_MOTIVOBAJA']) Then
      AFont.Color := clRed;
  end
  else if sdqConsulta.FieldByName('ESVIP').AsString = 'S' then
    AFont.Color := clPurple;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.tbPropiedadesClick(Sender: TObject);
var
  i: Integer;
  cTotSiniestros,
  cTotDeuda: Currency;
  {$IFDEF VER150}
  FBookmark: TBookmarkStr;
  {$ELSE}
  FBookmark: TBookmark;
  {$ENDIF}
begin
  cTotSiniestros := 0;
  cTotDeuda      := 0;
  FBookmark      := sdqConsulta.Bookmark;

  sdqConsulta.DisableControls;
  try
    for i := 0 to Grid.SelectedRows.Count-1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
      cTotSiniestros := cTotSiniestros + sdqConsulta.FieldByName('IMPORPERI').AsCurrency;
      cTotDeuda      := cTotDeuda + sdqConsulta.FieldByName('DEUDA').AsCurrency;
    end;
  finally
    sdqConsulta.EnableControls;
    sdqConsulta.Bookmark := FBookmark;
  end;

  edCantEmpresas.Value  := Grid.SelectedRows.Count;
  edTotSiniestros.Value := cTotSiniestros;
  edTotDeuda.Value      := cTotDeuda;

  fpTotales.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.mnuSelectAllClick(Sender: TObject);
begin
  Grid.SelectAll;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.mnuSelectClearClick(Sender: TObject);
begin
  Grid.UnselectAll;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.mnuSelectInvertClick(Sender: TObject);
begin
  Grid.InvertSelection;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.ShowStatus(AText: string);
begin
  lbAccion.Caption := AText + '...';
  Application.ProcessMessages;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.tbNuevoClick(Sender: TObject);
var
  i: Integer;
  IdFirma, IdCompensacion: TTableId;
  sPrefijo,
  sSql, sModulo: string;
  frmFirmantes: TfrmFirmantes;
begin
  sSql := 'SELECT 1 ' +
            'FROM CTC_TABLACONTROL ' +
           'WHERE TC_PROCESO LIKE ''DKTDGI%'' ' +
             'AND TC_FECHAFIN IS NULL';
  Verificar(ExisteSql(sSql), nil, 'No es posible compensar mientras se carga la recaudación de AFIP');

  if ValidarRegSeleccionados then
  begin
    if fpCompensar.ShowModal = mrOk Then
    begin
      frmFirmantes := TfrmFirmantes.Create(Self);
      try
        frmFirmantes.Area := AREA_COB;
        if frmFirmantes.ShowModal = mrOk then
          IdFirma := frmFirmantes.sdqFirmasCODFIRMA.AsInteger
        else
          begin
            MsgBox('Debe seleccionar un firmante.', MB_ICONEXCLAMATION);
            Exit;
          end;
      finally
        frmFirmantes.Free;
      end;

      fpProcesando.ShowOnTop;
      aniReloj.Active := True;
      Application.ProcessMessages;
      try
        BeginTrans;
        try
          if rbCartaComercial.Checked Then
          begin
            sPrefijo := 'CC';
            sModulo  := MODULO_COMPENSACIONDEUDACARTAC;
          end else
          begin
            sPrefijo := 'CD';
            if rbCartaDocumento.Checked Then
              sModulo  := MODULO_COMPENSACIONDEUDA
            else
              sModulo  := MODULO_COMPENSACIONDEUDASININTIMAC; { Sin Intimación }
          end;

          {IdCompensacion := GetSecNextVal('SEQ_ZCO_ID');}
          IdCompensacion := IncSql('SELECT MAX(CO_ID) FROM ZCO_COMPENSACION');

          lbTitulo.Caption := 'Proceso de Compensación Nº ' + IntToStr(IdCompensacion);
          ShowStatus('Registrando el proceso de compensación');
          EjecutarSqlSTEx('INSERT INTO ZCO_COMPENSACION ' +
                          '(CO_ID, CO_USUPROCESO, CO_FECHAPROCESO, CO_FECHAAPROBACION) VALUES ' +
                          '(:CO_ID, :CO_USUPROCESO, SYSDATE, SYSDATE)',
                          [IdCompensacion, frmPrincipal.dbLogin.UserId]);

          for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
            sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

            sSql := 'SELECT COMPDEUDA.IS_CONTRATOCONDEUDA(' + SqlValue(sdqConsulta.FieldByName('CONTRATOPRINC').AsInteger) + ', ' + SqlString(edPeriodoDesde.Text, True, True) + ', ' + SqlString(edPeriodoHasta.Text, True, True) + ') ' +
                      'FROM DUAL';
            if ValorSql(sSql) = 'S' then
              begin
                ShowStatus(Format('Registrando Contratos %d/%d', [i+1, Grid.SelectedRows.Count]));

                EjecutarStoreSTEx('COMPDEUDA.DoCompensarContrato(:IdCompensacion, :IdContrato, :IdCarta, :ModuloCarta, :Usuario, :IdFirma);',
                                  [IdCompensacion,
                                   sdqConsulta.FieldByName('CONTRATOEXT').AsInteger,
                                   '',
                                   sModulo,
                                   frmPrincipal.dbLogin.UserId,
                                   IdFirma]);

                ShowStatus(Format('Aprobando Siniestro %d/%d', [i+1, Grid.SelectedRows.Count]));
                EjecutarStoreSTEx('COMPDEUDA.DoAprobarSiniestro(:IdContrato, :Usuario);',
                                  [sdqConsulta.FieldByName('CONTRATOEXT').AsInteger,
                                   frmPrincipal.dbLogin.UserID]);
              end;
          end;

          ShowStatus('Grabando Deuda');
          EjecutarStoreSTEx('COMPDEUDA.DoArmarDeuda(:IdCompensacion, :PeriodoDesde, :PeriodoHasta, :Usuario);',
                            [IdCompensacion,
                             edPeriodoDesde.Text,
                             edPeriodoHasta.Text,
                             frmPrincipal.dbLogin.UserID]);

          ShowStatus('Generando Cuotas');
          EjecutarStoreSTEx('COMPDEUDA.DoInsertarCuota(:IdCompensacion, :Usuario);',
                            [IdCompensacion, frmPrincipal.dbLogin.UserId]);

          ShowStatus('Generando Movimientos del Fondo');
          EjecutarStoreSTEx('COMPDEUDA.DoInsertarMovFondo(:IdCompensacion, :Usuario);',
                            [IdCompensacion, frmPrincipal.dbLogin.UserId]);

          ShowStatus('Redevengando Periodos');
          EjecutarStoreSTEx('COMPDEUDA.Do_RedevengarPeriodos(:IdCompensacion);',
                            [IdCompensacion]);

          if chkImprimir.Checked Then
            try
              ShowStatus('Imprimiendo Cartas...');
              ImprimirProcesoCompensacion(IdCompensacion, chkImprimirFirma.Checked, tmNone);
            except
              On E: Exception do ErrorMsg(E, 'Error al Imprimir la Carta.' + CRLF + 'La carta no se imprimirá automáticamente pero la compensación será guardada' );
            end;

          ShowMessage('Proceso Terminado');
          CommitTrans;
        except
          on E: Exception do
          begin
            RollBack;
            ErrorMsg(E, lbAccion.Caption);
          end;
        end;
        ShowStatus('Recargando el Listado...');
        sdqConsulta.Refresh;
      finally
        fpProcesando.Close;
        aniReloj.Active := False;
      end;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.tbTotalesClick(Sender: TObject);
begin
  inherited;

  Grid.FooterBand := tbTotales.Down;

  if tbTotales.Down and sdqConsulta.Active then
    SumFields(sdqConsulta, COL_TOTALES, rTotales);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iCol: integer;
begin
  iCol := ArrayPos(Column, COL_TOTALES);

  if iCol > -1 then
    begin
      Value := FormatFloat('0.00', rTotales[iCol]);
      AlignFooter := afRight;
    end
  else if Column='CONTRATOPRINC' then
    Value := IntToStr(sdqConsulta.RecordCount);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmCompSelecionAprobacion.ValidarRegSeleccionados: Boolean;
var
  Fila: TBookmark;
begin
  Result := False;

  if Grid.SelectedRows.Count = 0 then
    begin
      InvalidHint( Grid, 'Debe seleccionar al menos un registro en la grilla' );
      exit;
    end;

  Fila := Is_CampoConRepetidos(Grid, 'CUITREG', 21, True);
  if Assigned( Fila ) then
    begin
      sdqConsulta.GotoBookmark( Fila );

      InvalidHint( Grid, 'Ya ha elegido previamente el mismo régimen del CUIT ' + sdqConsulta.FieldByName( 'EM_CUIT' ).AsString );
      exit;
    end;

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.DoHabilitarPeriodos(bHabilitar: Boolean);
var
  bDesHabilitar: Boolean;
begin
  bDesHabilitar := not bHabilitar;

  VCLExtra.LockControls( edPeriodoDesde, bDesHabilitar );
  VCLExtra.LockControls( edPeriodoHasta, bDesHabilitar );

  if bHabilitar then
    begin
      with edPeriodoDesde do
        begin
          Color       := clWindow;
          Periodo.Valor := '';
        end;

      with edPeriodoHasta do
        begin
          Color       := clWindow;
          Periodo.Valor := '';
        end;
    end
  else
    begin
      edPeriodoDesde.Color := clBtnFace;
      edPeriodoDesde.Color := clBtnFace;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresa.mskCUIT.SetFocus;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.chkImprimirClick(Sender: TObject);
begin
  chkImprimirFirma.Enabled := chkImprimir.Checked and (rbCartaDocumento.Checked or rbCartaDocumentoSinIntimacion.Checked);

  if not (chkImprimir.Checked and chkImprimirFirma.Enabled) then
    chkImprimirFirma.Checked := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.rbCartaDocumentoClick(Sender: TObject);
begin
  chkImprimirClick( nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.fpCompensarEnter(Sender: TObject);
begin
  chkImprimirClick( nil )
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.ImprimirListadoClick(Sender: TObject);
var
  i: Integer;
begin
  if Grid.SelectedRows.Count > 0 then
    begin
      QRlibera := TQRlibera.Create( Self );
      try
        with QRlibera do
          begin
            sdqConsulta.DisableControls;
            mdLiberar.Open;

            for i := 0 to Grid.SelectedRows.Count-1 do
              begin
                sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

                qryCompensa.Close;
                qryCompensa.ParamByName( 'xCuit' ).AsString := sdqConsulta.FieldByName('EM_CUIT').AsString;
                qryCompensa.Open;

                while not qryCompensa.Eof do
                  begin
                    mdLiberar.Append;

                    mdLiberarCUIT.AsString        := qryCompensa.FieldByName('EX_CUIT').AsString;
                    mdLiberarNOMBRE.AsString      := qryCompensa.FieldByName('EM_NOMBRE').AsString;
                    mdLiberarSINIESTRO.AsString   := qryCompensa.FieldByName('SINIESTRO').AsString;
                    mdLiberarLIQUIDACION.AsString := qryCompensa.FieldByName('LE_NUMLIQUI').AsString;
                    mdLiberarFECHADES.AsString    := qryCompensa.FieldByName('LE_FECHADES').AsString;
                    mdLiberarFECHAHAS.AsString    := qryCompensa.FieldByName('LE_FECHAHAS').AsString;
                    mdLiberarIMPORTE.AsString     := qryCompensa.FieldByName('LE_IMPORPERI').AsString;
                    mdLiberarCUIL.AsString        := qryCompensa.FieldByName('TJ_CUIL').AsString;
                    mdLIberarTRABAJA.AsString     := qryCompensa.FieldByName('TJ_NOMBRE').AsString;
                    mdLIberar.Post;

                    qryCompensa.Next;
                  end;
              end;

            mdLiberar.First;
            //QuickRep1.Preview;
            Visualizar(QuickRep1, GetValores(), [oForceShowModal]);
          end;
      finally
        QRlibera.mdLiberar.Close;
        QRlibera.Free;
        sdqConsulta.EnableControls;
      end;
    end
  else
    InvalidHint( Grid, 'Debe seleccionar registros en la grilla' );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompSelecionAprobacion.LiberarSiniestrosClick(Sender: TObject);
var
  sMensaje, sSql: String;
  i: Integer;
begin
  if Grid.SelectedRows.Count > 0 then
    begin
      sMensaje := '¿Confirma la Liberación de Siniestros?' + CRLF +
                  'ADVERTENCIA: Si no sacó el listado de siniestros a liberar ' +
                  'antes de liberarlos, luego no podrá imprimirlo.';

      if (MsgBox(sMensaje, MB_YESNO, 'Liberación de Siniestros') = mrYes) then
        begin
          fpProcesando.ShowOnTop;
          aniReloj.Active := True;
          Application.ProcessMessages;
          sdqConsulta.DisableControls;

          try
            lbTitulo.Caption := 'Liberando Siniestros';

            BeginTrans;
            try
              for i := 0 to Grid.SelectedRows.Count-1 do
                begin
                  sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

                  ShowStatus(Format('Liberando Siniestros de Contratos %d/%d', [i+1, Grid.SelectedRows.Count]));

                  ssql := 'COMPDEUDA.DOLIBERARSINIESTROS(:Contrato, :Usuario);';
                  EjecutarStoreSTEx( sSql, [sdqConsulta.FieldByName( 'CONTRATOEXT' ).AsInteger, frmPrincipal.DBLogin.LoginName] );
                end;

              ShowMessage('Proceso Terminado');
              CommitTrans;
            except
              on E: Exception do
                begin
                  RollBack;

                  Raise Exception.Create( E.Message + CRLF + 'Error al liberar los siniestros' );
                end;
            end;
          finally
            sdqConsulta.EnableControls;
            fpProcesando.Close;
            aniReloj.Active := False;
          end;

          tbRefrescarClick( nil );
          mnuSelectClearClick( nil );
        end;
    end
  else
    InvalidHint( Grid, 'Debe seleccionar registros en la grilla' );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.


