unit unAsignaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, cxClasses, cxGraphics, cxCustomData, cxStyles,
  cxEdit, DB, SDEngine, dxmdaset, cxPivotGridCustomDataSet, AnsiSql,
  cxPivotGridDrillDownDataSet, cxCustomPivotGrid, cxDBPivotGrid,
  cxControls, ImgList, XPMenu, Placemnt, unDmPrincipal, Menus,
  cxLookAndFeels, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, ExtCtrls, General, FormPanel, DateTimeFuncs,
  unfraVendedorAGENDA, Mask, PatternEdit, ComboEditor, CheckCombo,
  ComCtrls, ToolWin, cxFilterControl, cxDBFilterControl, cxPivotGrid,
  cxContainer, cxListBox, cxLookAndFeelPainters, cxGroupBox, cxRadioGroup,
  CheckLst;

type
  TPropsData = array of string;
  TfrmAsignaciones = class(TfrmCustomForm)
    pgdDetalle: TcxPivotGridDrillDownDataSet;
    dsDatos: TDataSource;
    sdqConsulta: TSDQuery;
    pvgDatos: TcxDBPivotGrid;
    FIRMANTE_ID: TcxDBPivotGridField;
    FRIMANTE: TcxDBPivotGridField;
    RANGO_CAPITA: TcxDBPivotGridField;
    TIPO_PREVENCION: TcxDBPivotGridField;
    CATRIESGO: TcxDBPivotGridField;
    SECTOR: TcxDBPivotGridField;
    TIPO_ASIGNACION: TcxDBPivotGridField;
    mnuAsignaciones: TPopupMenu;
    mnuDesAsignar: TMenuItem;
    mnuDetalle: TMenuItem;
    ITCODIGO: TcxDBPivotGridField;
    CARGA_MAXACT: TcxDBPivotGridField;
    HEP_ID: TcxDBPivotGridField;
    PD_ID: TcxDBPivotGridField;
    mnuAsignarA: TMenuItem;
    frmPanelPreventor: TFormPanel;
    frmPanelCoord: TFormPanel;
    mnuSelecCoord: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    mnuExpExcel: TMenuItem;
    dlgSavaFile: TSaveDialog;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    ToolButton8: TToolButton;
    tbSalir: TToolButton;
    tbAsignara: TToolButton;
    tbDesAsignar: TToolButton;
    ToolButton2: TToolButton;
    tbRecupDatos: TToolButton;
    tbSelecCoord: TToolButton;
    tbDetalle: TToolButton;
    tbAplicar: TToolButton;
    frmPanelSelecPrevent: TFormPanel;
    sdqSelectPrevent: TSDQuery;
    btnAceptaLstPrev: TButton;
    btnCancelaLstPrev: TButton;
    fraPreventor: TfraCodigoDescripcion;
    Label1: TLabel;
    btnAceptarPreven: TButton;
    btnCancelarPreven: TButton;
    Label2: TLabel;
    cmbCoordinadores: TCheckCombo;
    btnAcptarCoord: TButton;
    btnCancelarCoord: TButton;
    lstPreventores: TCheckListBox;
    mnuSeleccionarPreventores: TMenuItem;
    mnuPreventList: TPopupMenu;
    mnuTodos: TMenuItem;
    mnuNinguno: TMenuItem;
    mnuInvert: TMenuItem;
    tbFiltroPrevent: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    PD_IDPREVSUGERIDO: TcxDBPivotGridField;
    chkVerBajas: TCheckBox;
    procedure btnAceptaLstPrevClick(Sender: TObject);
    procedure btnAceptarPrevenClick(Sender: TObject);
    procedure btnAcptarCoordClick(Sender: TObject);
    procedure btnCancelaLstPrevClick(Sender: TObject);
    procedure btnCancelarCoordClick(Sender: TObject);
    procedure btnCancelarPrevenClick(Sender: TObject);
    procedure chkVerBajasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraPreventorcmbDescripcionDropDown(Sender: TObject);
    procedure frmPanelCoordBeforeShow(Sender: TObject);
    procedure frmPanelCoordKeyPress(Sender: TObject; var Key: Char);
    procedure frmPanelPreventorClose(Sender: TObject; var Action: TCloseAction);
    procedure frmPanelPreventorEnter(Sender: TObject);
    procedure frmPanelPreventorKeyPress(Sender: TObject; var Key: Char);
    procedure frmPanelSelecPreventClose(Sender: TObject; var Action: TCloseAction);
    procedure frmPanelSelecPreventKeyPress(Sender: TObject; var Key: Char);
    procedure lstPreventoresDrawItem(Control: TWinControl; Index: Integer; Rect:
        TRect; State: TOwnerDrawState);
    procedure mnuAsignacionesPopup(Sender: TObject);
    procedure mnuAsignarAClick(Sender: TObject);
    procedure mnuDesAsignarClick(Sender: TObject);
    procedure mnuDetalleClick(Sender: TObject);
    procedure mnuExpExcelClick(Sender: TObject);
    procedure mnuInvertClick(Sender: TObject);
    procedure mnuNingunoClick(Sender: TObject);
    procedure pgdDetalleCreateField(Sender: TcxPivotGridCustomDataSet;
        APivotGridField: TcxPivotGridField; ADataSetField: TField);
    procedure mnuSelecCoordClick(Sender: TObject);
    procedure pvgDatosContextPopup(Sender: TObject; MousePos: TPoint; var Handled:
        Boolean);
    procedure mnuSeleccionarPreventoresClick(Sender: TObject);
    procedure mnuTodosClick(Sender: TObject);
    procedure tbAsignaraClick(Sender: TObject);
    procedure tbDesAsignarClick(Sender: TObject);
    procedure tbDetalleClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbFiltroPreventClick(Sender: TObject);
    procedure tbAplicarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRecupDatosClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbSelecCoordClick(Sender: TObject);
  private
    FArrPrevBajaIdx, FArrSelecPrevia: array of integer;
    FDatos: array of string;
    FRgoMinDef, FRgoMaxDef: integer;
    FAsig, FPosibleAsig, FModificado: Boolean;
    FSQL, FSQLSelPrev: string;
    FStrINCoord: string;
    procedure SeleccionPreventores(mnuItemIdx: byte);
    procedure UpdatePreventor(const IdFirmante, CodigoFirmante, NombreFirmante,
        IDCoordinador, TipoAsig: string);
  public
    procedure CargaFiltroPreventores;
    procedure GetRangos(const NombreCampo: string; const IsRgoCapita: Boolean = False);
  end;

const
  {cuidado al cambiar estas constantes}
  {representa el cód de los sin preventor, ver sp que ejecuta el cursor}
  SIN_PREVENTOR = 'S/ PREVENTOR';
  {tiene que ver con el llenado de la tabla hpd_preventores_data que realiza el cursor,
  por el tema de ordenar la pos las columnas}
  ESPACIO_CUT   = 5;

  WHERE_11 =' WHERE 1=1 ';

var
  frmAsignaciones: TfrmAsignaciones;

implementation

uses StrUtils, unGestionEmpresasPreventorAsignaciones, unFiltros, cxExportPivotGridLink, unSesion,
  CustomDlgs, unGestionEmpresasPreventor;

{$R *.dfm}

procedure TfrmAsignaciones.btnAceptaLstPrevClick(Sender: TObject);
begin
  frmPanelSelecPrevent.ModalResult := mrOK;
end;

procedure TfrmAsignaciones.btnAceptarPrevenClick(Sender: TObject);
var
  IDCoordinador: string;
begin
  try
    Screen.Cursor := crHourGlass;
    IDCoordinador :=
        ValorSqlEx(
            'SELECT it_idsupervisor FROM pit_firmantes WHERE it_id = :id_preventor',
            [fraPreventor.ID]);

    if fraPreventor.ID = '' then
      Raise Exception.Create('DEBUG. Error de datos fraPreventor.ID está vacío');

    UpdatePreventor(
        QuotedStr(fraPreventor.ID),
        QuotedStr(fraPreventor.Codigo),
        QuotedStr(fraPreventor.Descripcion),
        IIF(IDCoordinador = '', 'NULL', IDCoordinador),
        'A'
    );

    if fraPreventor.IsBaja then
      lstPreventores.AddItem(
          fraPreventor.Descripcion,
          TObject(StrToInt(fraPreventor.ID))
      );

  finally
    Screen.Cursor := crDefault;
    fraPreventor.Clear;
    frmPanelPreventor.Close;
  end;
end;

procedure TfrmAsignaciones.btnAcptarCoordClick(Sender: TObject);
var
  i: integer;
  strNexo, sWhere: string;
begin
  FStrINCoord := '';
  if cmbCoordinadores.CheckedCount > 0 then
  begin
    sdqConsulta.Close;
    sWhere := WHERE_11;
    strNexo := ' AND ';
    {levanta coord selccionados}
    for i := 0 to cmbCoordinadores.Items.Count - 1 do begin
        {ignorar último item, reservado s/prev}
        {S/ COORDINADOR" se carga siempre al final. Ver frmPanelCoordBeforeShow}
        if cmbCoordinadores.Checked[i] and (i < cmbCoordinadores.Items.Count - 1) then
          FStrINCoord := FStrINCoord + SqlValue(Integer(cmbCoordinadores.Items.Objects[i])) + ',';

    end;

    {agrega coordinadores selccionados al qry}
    if Trim(FStrINCoord) > '' then
    begin
      FStrINCoord := copy(FStrINCoord, 1, length(FStrINCoord) -1);
      sWhere := sWhere + strNexo + ' hpd.pd_idcoordinador in (' + FStrINCoord + ') ';
      strNexo := ' OR '
    end else
      strNexo := ' AND ';

    {verifica sin preventores}
    if cmbCoordinadores.Checked[cmbCoordinadores.Items.Count -1] then
    begin
      sWhere := sWhere + strNexo + ' hpd.PD_IDCOORDINADOR is NULL '
    end;

    sdqConsulta.SQL.Text := FSQL + sWhere;
    tbRefrescarClick(Sender);
    frmPanelCoord.Close;
  end;
end;

procedure TfrmAsignaciones.btnCancelaLstPrevClick(Sender: TObject);
begin
  frmPanelSelecPrevent.ModalResult := mrCancel;
end;

procedure TfrmAsignaciones.btnCancelarCoordClick(Sender: TObject);
begin
  frmPanelCoord.Close;
end;

procedure TfrmAsignaciones.btnCancelarPrevenClick(Sender: TObject);
begin
  fraPreventor.Clear;
  frmPanelPreventor.Close;
end;

procedure TfrmAsignaciones.CargaFiltroPreventores;
var
  sWhereBajas: string;
  i: Word;
begin
  lstPreventores.Clear;
  FArrPrevBajaIdx := nil;

  if chkVerBajas.Checked then
    sWhereBajas := ' '
  else                              
    sWhereBajas := ' AND pit.it_fechabaja IS NULL ';

    FSQLSelPrev :=
                '  SELECT  pit.it_id, '
              + '          pit.it_codigo, '
              + '          pit.it_nombre, '
              + '          pit.it_fechabaja '
              + '    FROM  pit_firmantes pit '
              + '   WHERE '
              + '      NOT( UPPER(it_nombre) LIKE ''ALTA%'' '
              + '           OR UPPER(it_nombre) LIKE ''-ALTA%'' '
              + '           OR UPPER(it_nombre) LIKE ''*ALTA%'' '
              + '           OR it_nombre LIKE ''-----%'') '              
              + sWhereBajas
              + 'ORDER BY  pit.it_nombre '
              ;

  {carga preventores seleccionados correspondientes al coordinador}
  sdqSelectPrevent.SQL.Text := FSQLSelPrev;
  sdqSelectPrevent.Close;
  sdqSelectPrevent.Open;
  while not sdqSelectPrevent.Eof do begin
    lstPreventores.AddItem(
        sdqSelectPrevent.FieldByName('it_nombre').AsString,
        TObject(sdqSelectPrevent.FieldByName('it_id').AsInteger)
    );

    SetLength(FArrPrevBajaIdx, Length(FArrPrevBajaIdx) +1);
    if not sdqSelectPrevent.FieldByName('it_fechabaja').IsNull then
      FArrPrevBajaIdx[High(FArrPrevBajaIdx)] := lstPreventores.Count -1
    else
      FArrPrevBajaIdx[High(FArrPrevBajaIdx)] := 0;

    sdqSelectPrevent.Next;
  end;
  sdqSelectPrevent.Close;

  if Assigned(FArrSelecPrevia) then
    for i := 0 to High(FArrSelecPrevia) do
      if FArrSelecPrevia[i] > 0 then
        lstPreventores.Checked[i] := True;

end;

procedure TfrmAsignaciones.chkVerBajasClick(Sender: TObject);
begin
  FArrSelecPrevia := Nil;
  CargaFiltroPreventores;
end;

procedure TfrmAsignaciones.FormCreate(Sender: TObject);
begin
  sdqConsulta.SQL.Text :=
        '  SELECT  hpd.pd_id, '
      + '        hpd.pd_estableci, '
      + '        case pd_tipo_asignacion '
      + '          when ''A'' then hpd.pd_idfirmante '
      + '          when ''P'' then hpd.pd_idprevsugerido '
      + '        end as pd_idfirmante , '
      + '        hpd.pd_idhep, '
      + '        hpd.pd_itcodigo, '
      + '        case pd_tipo_asignacion '
      + '          when ''A'' then hpd.pd_nombrefirmante '
      + '          when ''P'' then hpd.pd_nombreprevsugerido '
      + '        end as pd_nombreprev , '
      + '        hpd.pd_rango_capita, '
      + '        hpd.pd_cargamax || '' / '' || (SELECT  SUM (pd_cargaactual) '
      + '                                         FROM  hys.hpd_preventores_data hpd2 '
      + '                                        WHERE  hpd2.pd_itcodigo = hpd.pd_itcodigo '
      + '                                           AND hpd2.pd_tipo_asignacion = ''A'' ) '
      + '           AS "Carga Máxima/Actual", '
      + '        upper(hpd.pd_tipoprevencion) AS pd_tipoprevencion, '
      + '        upper(hpd.pd_descripcion_cat_riesgo) AS pd_catriesgo, '
      + '        hpd.pd_sector, '
      + '        hpd.pd_tipo_asignacion, '
      + '        hpd.pd_cuit, '
      + '        hpd.pd_modificado, '
      + '        hpd.pd_motivoasignacion, '
      + '        hpd.pd_vigencia_asig, '
      + '        hpd.pd_observacion, '
      + '        hpd.pd_idreferente, '
      + '        hpd.pd_idexclusivo, '
      + '        hpd.pd_idempresa '
      + '  FROM  hys.hpd_preventores_data hpd '
      ;

  CargaFiltroPreventores;

  Self.Caption := 'Módulo Asignaciones';
  FSQL := sdqConsulta.SQL.Text;
  TIPO_ASIGNACION.Filter.Values.Add('A');
  TIPO_ASIGNACION.Filter.FilterType := ftIncluded;
  FIRMANTE_ID.Filter.Clear;
  fraPreventor.CaseSensitive := False;
end;

procedure TfrmAsignaciones.fraPreventorcmbDescripcionDropDown(Sender: TObject);
begin
  if (trim(fraPreventor.cmbDescripcion.Text) <> '')
      and (trim(fraPreventor.cmbDescripcion.Text)[1] <> '%') then
    fraPreventor.cmbDescripcion.Text := '%' + fraPreventor.cmbDescripcion.Text;

  fraPreventor.cmbDescripcionDropDown(Sender);

  if (trim(fraPreventor.cmbDescripcion.Text) <> '')
      and (trim(fraPreventor.cmbDescripcion.Text)[1] = '%') then
      fraPreventor.cmbDescripcion.Text :=
          copy(fraPreventor.cmbDescripcion.Text, 2, length(fraPreventor.cmbDescripcion.Text));
end;

procedure TfrmAsignaciones.frmPanelCoordBeforeShow(Sender: TObject);
begin
  if cmbCoordinadores.Items.Count = 0 then
  begin
    with GetQuery(' SELECT it_id, it_nombre ' +
                  '   FROM art.pit_firmantes cor ' +
                  '  WHERE cor.it_idrolpreventor = 5 ' +
                  '    AND cor.it_fechabaja IS NULL')
    do begin
      while not Eof do
      begin
        cmbCoordinadores.Items.AddObject(
            FieldByName('IT_NOMBRE').AsString,
            TObject(fieldbyname('IT_ID').AsInteger));
        Next;
      end;
      cmbCoordinadores.Items.AddObject(
          'S/ COORDINADOR',
          TObject(integer(cmbCoordinadores.Items.Count))
      );
    end;
  end;

end;

procedure TfrmAsignaciones.frmPanelCoordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    btnCancelarCoord.Click;
end;

procedure TfrmAsignaciones.frmPanelPreventorClose(Sender: TObject; var Action:
    TCloseAction);
begin
  fraPreventor.Clear;
end;

procedure TfrmAsignaciones.frmPanelPreventorEnter(Sender: TObject);
begin
  fraPreventor.Locked := False;
  pgdDetalle.First;
  while not pgdDetalle.EOF do
  begin
    if pgdDetalle.FieldByName('Tipo Asignación').AsString = 'P' then
    begin
      fraPreventor.Codigo := pgdDetalle.FieldByName('Código Preventor').AsString;
      fraPreventor.Locked := True;
      Break;
    end;
    pgdDetalle.Next;
  end;
end;

procedure TfrmAsignaciones.frmPanelPreventorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then frmPanelPreventor.Close;
end;

procedure TfrmAsignaciones.frmPanelSelecPreventClose(Sender: TObject; var Action: TCloseAction);
var
  i: Word;
begin
  for i := 0 to lstPreventores.Items.Count -1 do
  begin
    SetLength(FArrSelecPrevia, Length(FArrSelecPrevia) +1);
    if lstPreventores.Checked[i] then
    begin
      FArrSelecPrevia[i] := i;
    end else
      FArrSelecPrevia[i] := 0;
  end;
end;

procedure TfrmAsignaciones.frmPanelSelecPreventKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then frmPanelSelecPrevent.Close;
end;

procedure TfrmAsignaciones.mnuAsignarAClick(Sender: TObject);
begin
  if sdqConsulta.Active then
  begin
    with fraPreventor do
    begin
      TableName  := 'PIT_FIRMANTES';
      FieldDesc  := 'IT_NOMBRE';
      FieldID    := 'IT_ID';
      FieldCodigo:= 'IT_CODIGO';
      FieldBaja  := 'IT_FECHABAJA';
      Visible    := True;
      ShowBajas  := True;
    end;
    frmPanelPreventor.ShowModal;
  end;
end;

procedure TfrmAsignaciones.mnuDesAsignarClick(Sender: TObject);
var
  bPermiteUpdate: Boolean;
begin
  bPermiteUpdate := True;
  pgdDetalle.First;
  while not pgdDetalle.Eof do
  begin
    if pgdDetalle.FieldByName('Tipo Asignación').AsString = 'P' then
      bPermiteUpdate := False;

    pgdDetalle.Next;
  end;

  if not bPermiteUpdate then
    MessageDlg('Existen registros de tipo Posible Asignación en el detalle (Tipo P). Sólo se permite desasignar registros asignados (Tipo A).', mtError, [mbOK], 0)
  else
    if MsgAsk('¿Está seguro de desasignar estos establecimientos?')  then
      UpdatePreventor('NULL', SqlValue(SIN_PREVENTOR), SqlValue(SIN_PREVENTOR), 'NULL', 'A');

end;

procedure TfrmAsignaciones.mnuDetalleClick(Sender: TObject);
var
  frmGestionEmpPrevAsig: TfrmGestionEmpPrevAsig;
  i: Word;
begin
  if not pgdDetalle.IsEmpty then begin
    {la celda no está vacía}
    pgdDetalle.SynchronizeData := True;
    frmGestionEmpPrevAsig := TfrmGestionEmpPrevAsig.Create(nil);
    try
      with frmGestionEmpPrevAsig do begin
        Titulo := StringReplace(mnuDetalle.Caption, '&', '', [rfReplaceAll]);
        CodigoSinPreventor := SIN_PREVENTOR;
        EspacioCut := ESPACIO_CUT;
        {determina si se trata de un preventor o de los que no tienen preventor}
        if (pgdDetalle.FieldByName('Código Preventor').IsNull) or
            (pgdDetalle.FieldByName('Código Preventor').AsString = SIN_PREVENTOR) then
        begin
          SinPreventor := True;
        end else
        begin
          CodPreventor := pgdDetalle.FieldByName('Código Preventor').AsString;
          SinPreventor := False;
        end;

        GetRangos('Rango Capita', True);
        RangoCapitaMin:= FRgoMinDef;
        RangoCapitaMax:= FRgoMaxDef;

        GetRangos('Sector');
        for i := 0 to High(FDatos) do
          Sector[i] := FDatos[i];

        GetRangos('Tipo Prevención');
        for i := 0 to High(FDatos) do
          TipoPreven[i] := FDatos[i];

        GetRangos('Categoría Riesgo');
        for i := 0 to High(FDatos) do
          CatRiesgo[i] := FDatos[i];

        GetRangos('Tipo Asignación');
        Asignados         := FAsig;
        PosiblesAsignados := FPosibleAsig;

        ShowModal;

        if frmGestionEmpPrevAsig.Modificado then
        begin
          if MessageBox(0,
              'Se realizaron modificaciones. ¿Desea actualizar los datos de la grilla?', 'Atención',
              MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = IDYES then
            Self.tbRefrescarClick(Sender);
        end;

      end;
    finally
        FreeAndNil(frmGestionEmpPrevAsig);
    end;
  end;
end;

procedure TfrmAsignaciones.pgdDetalleCreateField(Sender:
    TcxPivotGridCustomDataSet; APivotGridField: TcxPivotGridField;
    ADataSetField: TField);
begin

  if ADataSetField.FieldName = 'Sector' then
    ADataSetField.Size := 50;

end;

procedure TfrmAsignaciones.GetRangos(const NombreCampo: string; const IsRgoCapita: Boolean = False);
var
  CantChars, i, y: Word;
  RgoMin, RgoMax: integer;
begin
  SetLength(FDatos, 0);
  i := 0;
  FRgoMinDef := 0;
  FRgoMaxDef := 0;
  RgoMin := 0;
  RgoMax := 0;
  pgdDetalle.SortedField := NombreCampo;
  FAsig := False;
  FPosibleAsig := False;

  if IsRgoCapita then
    CantChars := 1
  else
    CantChars :=  128;

  SetLength(FDatos, Length(FDatos) +1);
  FDatos[i] := Trim(LowerCase(LeftStr(pgdDetalle.FieldByName(NombreCampo).AsString, CantChars)));

  while not pgdDetalle.Eof do begin
    if UpperCase(pgdDetalle.FieldByName('Tipo Asignación').AsString) = 'A' then
        FAsig := True;

    if UpperCase(pgdDetalle.FieldByName('Tipo Asignación').AsString) = 'P' then
        FPosibleAsig := True;

    if FDatos[i] <> LowerCase(LeftStr(pgdDetalle.FieldByName(NombreCampo).AsString, CantChars)) then
    begin
      SetLength(FDatos, Length(FDatos) +1);
      FDatos[i + 1] := LowerCase(LeftStr(pgdDetalle.FieldByName(NombreCampo).AsString, CantChars));
      i := i + 1;
    end;
    pgdDetalle.Next;
  end;

  if IsRgoCapita then
    for y := Low(FDatos) to High(FDatos) do
    begin
      if FDatos[y] = 'a' then begin
        RgoMin := 1;
        RgoMax := 5;
      end
      else if FDatos[y] = 'b' then begin
        RgoMin := 6;
        RgoMax := 50;
      end
      else if FDatos[y] = 'c' then begin
        RgoMin := 51;
        RgoMax := 100;
      end
      else if FDatos[y] = 'd' then begin
        RgoMin := 101;
        RgoMax := 200;
      end
      else if FDatos[y] = 'e' then begin
        RgoMin := 201;
        RgoMax := 300;
      end
      else if FDatos[y] = 'f' then begin
        RgoMin := 301;
        RgoMax := 0;
      end;

      if (RgoMin < FRgoMinDef) or (FRgoMinDef = 0) then
        FRgoMinDef := RgoMin;

      if (RgoMax > FRgoMaxDef) or (RgoMax = 0) then
        FRgoMaxDef := RgoMax;

    end;

end;

procedure TfrmAsignaciones.lstPreventoresDrawItem(Control: TWinControl; Index:
    Integer; Rect: TRect; State: TOwnerDrawState);
begin
  TListBox(Control).Canvas.FillRect(Rect);

  if FArrPrevBajaIdx[Index] > 0 then
    TListBox(Control).Canvas.Font.Color := clRed;

  TListBox(Control).Canvas.TextOut(Rect.Left, Rect.Top, TListBox(Control).Items[Index] );
end;

procedure TfrmAsignaciones.mnuAsignacionesPopup(Sender: TObject);
var
  hab: Boolean;
begin
  if (sdqConsulta.IsEmpty) OR (pvgDatos.ViewData.Selection.Count = 0) then
    hab := False
  else
    hab := True;

  mnuDetalle.Enabled    := hab;
  mnuAsignarA.Enabled   := hab;
  mnuDesAsignar.Enabled := hab;
  mnuExpExcel.Enabled   := hab;
   
end;

procedure TfrmAsignaciones.mnuExpExcelClick(Sender: TObject);
begin
  dlgSavaFile.Filter := '*.xls';
  dlgSavaFile.Title := 'Guardar grilla como...';
  if dlgSavaFile.Execute then
    cxExportPivotGridToExcel(dlgSavaFile.FileName, pvgDatos, False, True);
end;

procedure TfrmAsignaciones.mnuSelecCoordClick(Sender: TObject);
begin
  frmPanelCoord.ShowModal;
end;

procedure TfrmAsignaciones.pvgDatosContextPopup(Sender: TObject; MousePos:
    TPoint; var Handled: Boolean);
begin

  {para evitar menú popup cdo se se está posicionado en los renglones de totales}
  if (  (pvgDatos.ViewData.RowCount    = pvgDatos.ViewData.FocusedCell.y +1)
     OR (pvgDatos.ViewData.ColumnCount = pvgDatos.ViewData.FocusedCell.x +1)
     )
     AND (not pvgDatos.DataSource.DataSet.IsEmpty)
  then
    Handled := True     {no muestra menú}
  else
    Handled := False;   {muestra menú}

end;

procedure TfrmAsignaciones.mnuSeleccionarPreventoresClick(Sender: TObject);
begin
  tbFiltroPrevent.Click;
end;

procedure TfrmAsignaciones.mnuInvertClick(Sender: TObject);
begin
  SeleccionPreventores(TMenuItem(Sender).MenuIndex);
end;

procedure TfrmAsignaciones.mnuNingunoClick(Sender: TObject);
begin
  SeleccionPreventores(TMenuItem(Sender).MenuIndex);
end;

procedure TfrmAsignaciones.mnuTodosClick(Sender: TObject);
begin
  SeleccionPreventores(TMenuItem(Sender).MenuIndex);
end;

procedure TfrmAsignaciones.SeleccionPreventores(mnuItemIdx: byte);
var
  i: Word;
begin
  case mnuItemIdx of
    0:  begin
          for i := 0 to lstPreventores.Items.Count -1 do
              lstPreventores.Checked[i] := True;
        end;
    1:  begin
          for i := 0 to lstPreventores.Items.Count -1 do
              lstPreventores.Checked[i] := False;
        end;
    2:  begin
          for i := 0 to lstPreventores.Items.Count -1 do
            if lstPreventores.Checked[i] then
              lstPreventores.Checked[i] := False
            else
              lstPreventores.Checked[i] := True;
        end;
  end;
end;

procedure TfrmAsignaciones.tbAsignaraClick(Sender: TObject);
begin
  mnuAsignarA.Click;
end;

procedure TfrmAsignaciones.tbDesAsignarClick(Sender: TObject);
begin
  mnuDesAsignar.Click;
end;

procedure TfrmAsignaciones.tbDetalleClick(Sender: TObject);
begin
  mnuDetalle.Click;
end;

procedure TfrmAsignaciones.tbExportarClick(Sender: TObject);
begin
  mnuExpExcel.Click;
end;

procedure TfrmAsignaciones.tbFiltroPreventClick(Sender: TObject);
var
  sWhere, strINPrev, strSinPrev, sNexo: string;
  i: Word;
begin
  sWhere := WHERE_11;
  sNexo := ' AND ';
  CargaFiltroPreventores;

  {muestra form para seleccionar preventores}
  if frmPanelSelecPrevent.ShowModal = mrOK then begin
    {levanta prevent selccionados}
    for i := 0 to lstPreventores.Count -1 do begin
      if lstPreventores.Checked[i] then
      begin
        if integer(lstPreventores.Items.Objects[i]) = 0 then
          strSinPrev :=
              '(hpd.pd_idfirmante IS NULL    ' +
              ' AND hpd.pd_itcodigo =  ' + QuotedStr(SIN_PREVENTOR) + ')'
        else
          strINPrev := strINPrev + SqlValue(integer(lstPreventores.Items.Objects[i])) + ',';
      end;
    end;

    {agrega preventores seleccionados al qry}
    if Trim(strINPrev) > '' then
    begin
      strINPrev := copy(strINPrev, 1, length(strINPrev) -1);
      sWhere :=
          sWhere
          + ' AND hpd.pd_idfirmante in (' + strINPrev + ') '
          + ' OR (pd_idprevsugerido in (' + strINPrev + ') AND (pd_tipo_asignacion = ''P''))';
      {cambia en nexo a OR por si hay 's/ preventores'}
      sNexo := ' OR '
    end;

    if strSinPrev > '' then
      sWhere := sWhere + sNexo + strSinPrev;

    if (strINPrev > '') or (strSinPrev > '') then
    begin
      sdqConsulta.SQL.Text := FSQL + sWhere;
      tbRefrescarClick(Sender);
    end;

  end;
end;

procedure TfrmAsignaciones.tbAplicarClick(Sender: TObject);
var
  frmGestionEmpPrevAsig: TfrmGestionEmpPrevAsig;
  rstFirmantes: TSDQuery;
  sITCodigo, sIDFirmante: string;
begin
  Screen.Cursor := crHourGlass;
  sdqConsulta.DisableControls;
  frmGestionEmpPrevAsig := TfrmGestionEmpPrevAsig.Create(Self);

  try
    rstFirmantes :=
        GetQuery(
              'SELECT  pd_idfirmante, '
            + '        pd_itcodigo, '
            + '        pd_motivoasignacion, '
            + '        pd_vigencia_asig, '
            + '        pd_observacion, '
            +          SqlValue(Sesion.LoginName) + ', '
            + '        pd_idhep, '
            + '        pd_idreferente, '
            + '        pd_itreferente, '
            + '        pd_idexclusivo, '
            + '        pd_cuit, '
            + '        pd_idempresa '
            + '  FROM  hys.hpd_preventores_data hpd '
            + ' WHERE  pd_modificado = ''S'' '
        );

    rstFirmantes.Open;
    while not rstFirmantes.Eof do
    begin
      sITCodigo :=
          iif(rstFirmantes.FieldByName('PD_ITCODIGO').AsString = SIN_PREVENTOR,
              'NULL',
              SqlValue(rstFirmantes.FieldByName('PD_ITCODIGO').AsString));

      sIDFirmante :=
          iif(rstFirmantes.FieldByName('PD_IDFIRMANTE').IsNull,
              'NULL',
              SqlValue(rstFirmantes.FieldByName('PD_IDFIRMANTE').AsString));

      EjecutarSqlEx(
                'UPDATE  hys.hep_estabporpreventor '
              + '   SET  ep_idfirmante            = ' + sIDFirmante + ' , '
              + '        ep_itcodigo              = ' + sITCodigo   + ' , '
              + '        ep_motivoasignacion      = :motivoasig         , '
              + '        ep_fechavencimientoasig  = :fechavig           , '
              + '        ep_observacion           = :obs                , '
              + '        ep_fechamodif            = SYSDATE             , '
              + '        ep_usumodif              = :usuariomod           '
              + ' WHERE  ep_id = :id'
              ,
              [
                rstFirmantes.FieldByName('PD_MOTIVOASIGNACION').AsString,
                rstFirmantes.FieldByName('PD_VIGENCIA_ASIG').AsString,
                rstFirmantes.FieldByName('PD_OBSERVACION').AsString,
                Sesion.LoginName,
                rstFirmantes.FieldByName('pd_idhep').AsString
              ]
      );

      if not rstFirmantes.FieldByName('PD_IDREFERENTE').IsNull then
        frmGestionEmpPrevAsig.ActualizarPreventorReferente(
            rstFirmantes.FieldByName('PD_CUIT').AsString,
            rstFirmantes.FieldByName('PD_ITREFERENTE').AsString
        );

      if not rstFirmantes.FieldByName('PD_IDEXCLUSIVO').IsNull then
        frmGestionEmpPrevAsig.ActualizarPreventorExclusivo(
            rstFirmantes.FieldByName('PD_IDEMPRESA').AsInteger,
            rstFirmantes.FieldByName('PD_IDEXCLUSIVO').AsInteger
        );

      rstFirmantes.Next;
    end;
    EjecutarSql(
        'UPDATE hys.hpd_preventores_data SET pd_modificado = NULL WHERE pd_modificado = ''S'' ');
  finally
    rstFirmantes.Close;
    sdqConsulta.Filter := '';
    sdqConsulta.Filtered := False;
    sdqConsulta.EnableControls;
    Screen.Cursor := crDefault;
    FreeAndNil(rstFirmantes);
    FreeAndNil(frmGestionEmpPrevAsig);
  end;
end;

procedure TfrmAsignaciones.tbLimpiarClick(Sender: TObject);
begin
  lstPreventores.Clear;
  cmbCoordinadores.Clear;
  sdqConsulta.Close;
end;

procedure TfrmAsignaciones.tbRecupDatosClick(Sender: TObject);
begin
  if MessageBox(0,
      'Se va a recuperar de la base de datos la totalidad de los datos y se sobreescribirán los actuales del módulo, '
     +'esta operación puede tardar varios minutos. ¿Desea continuar?', 'Atención',
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = IDYES then
  begin
    EjecutarStore('art.hys.genera_preventoresdata;');
    tbLimpiar.Click;
  end;
end;

procedure TfrmAsignaciones.tbRefrescarClick(Sender: TObject);
begin
  if pos(WHERE_11, sdqConsulta.SQL.Text) = 0 then
    if MessageBox(0,
        'Se va a refrescar la totalidad de los datos, '
       +'esta operatoria puede tardar varios minutos. ¿Desea continuar?', 'Atención',
        MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = IDNO then
      Exit;

  Screen.Cursor := crHourGlass;
  try
    sdqConsulta.Close;
    sdqConsulta.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAsignaciones.tbSalirClick(Sender: TObject);
begin
  sdqConsulta.Close;
  Self.Close;
end;

procedure TfrmAsignaciones.tbSelecCoordClick(Sender: TObject);
begin
  mnuSelecCoord.Click;
end;

procedure TfrmAsignaciones.UpdatePreventor(const IdFirmante, CodigoFirmante,
    NombreFirmante, IDCoordinador, TipoAsig: string);
var
  strIN: string;
  cont, CargaMax, i: Word;
  aStrIN: array of string;
  frmGestionEmpPrevAsig: TfrmGestionEmpPrevAsig;
  IDCarMax: integer;
begin
  frmGestionEmpPrevAsig := TfrmGestionEmpPrevAsig.Create(Self);
  try
    Screen.Cursor := crHourGlass;
    cont := 1;
    pgdDetalle.SynchronizeData := True;
    pgdDetalle.First;

    if not pgdDetalle.fieldbyname('ID Firmante').IsNull then
      IDCarMax :=  pgdDetalle.FieldByName('ID Firmante').AsInteger
    else
      IDCarMax := StrToInt(fraPreventor.ID);

    CargaMax :=
          ValorSqlEx('select nvl(IT_CARGAMAX, 0) from art.pit_firmantes where it_id = :itid',
              [IDCarMax]
          );

    while not pgdDetalle.Eof do
    begin
      cont := cont +1;
      strIN := strIN + QuotedStr(pgdDetalle.FieldByName('pd_id').AsString) + ',';

      {la expresión en el "IN" en plsql no puede superar 1000}
      if cont = 1000 then begin
        SetLength(aStrIN, Length(aStrIN) +1);
        aStrIN[High(aStrIN)] := strIN;
        strIN := '';
        cont := 0;
      end;
      pgdDetalle.Next;
    end;

    if Trim(strIN) <> '' then begin
      SetLength(aStrIN, Length(aStrIN) +1);
      aStrIN[High(aStrIN)] := strIN;
    end;

    for i := 0 to High(aStrIN) do begin
      aStrIN[i] := LeftStr(aStrIN[i], Length(aStrIN[i]) -1);

      frmGestionEmpPrevAsig.VerificarPosiblesAlActual(
          aStrIN[i],
          pgdDetalle.FieldByName('ID Firmante').AsString,
          SqlValue(pgdDetalle.FieldByName('Preventor').AsString));

      EjecutarSql(
          ' UPDATE  hys.hpd_preventores_data '
          +'   SET  pd_idfirmante         = ' + IdFirmante      + ', '
          +'        pd_itcodigo           = ' + CodigoFirmante  + ', '
          +'        pd_nombrefirmante     = ' + NombreFirmante  + ', '
          +'        pd_idcoordinador      = ' + IDCoordinador   + ', '
          +'        pd_tipo_asignacion    = ' + SqlValue(TipoAsig) + ', '
          +'        pd_cargamax           = ' + iif(CargaMax > 0, SqlValue(CargaMax), 'NULL') + ', '
          +'        pd_modificado       = ''S'' '
          +' WHERE  pd_id IN (' + aStrIN[i] + ')'
      );
      FModificado := True;
    end;

    pvgDatos.DataSource.DataSet.Close;
    pvgDatos.DataSource.DataSet.Open;
  finally
    FreeAndNil(frmGestionEmpPrevAsig);
    Screen.Cursor := crDefault;
  end;

end;


end.

