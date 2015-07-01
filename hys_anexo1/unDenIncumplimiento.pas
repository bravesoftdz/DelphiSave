unit unDenIncumplimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ImageComboBox, Mask, ToolEdit, DateComboBox,
  unArtFrame, unFraCodigoDescripcion, unfraCtbTablas, FormPanel, Grids,
  DBGrids, RXDBCtrl, ComCtrls, ToolWin, ImgList, QueryPrint, unArt,
  ShortCutControl, QueryToFile, ExportDialog, SortDlg, Db, SDEngine,
  Buttons, unCustomGridABM, unArtDBAwareFrame, CheckLst, ARTCheckListBox,
  RxToolEdit;

type
  TfrmDenIncumplimiento = class(TForm)
    sdqDenuncias: TSDQuery;
    dsDenuncias: TDataSource;
    sdDenuncias: TSortDialog;
    edDenuncias: TExportDialog;
    sccDenuncias: TShortCutControl;
    sdqDetDenuncias: TSDQuery;
    dsDetDenuncias: TDataSource;
    sdqDenReporte: TSDQuery;
    dsDenReporte: TDataSource;
    qpDenReporte: TQueryPrint;
    ilObras: TImageList;
    pnlDenuncias: TPanel;
    cBarDiagEstableci: TCoolBar;
    tBarDiagEstableci: TToolBar;
    tbDiagRefrescar: TToolButton;
    tbSep1: TToolButton;
    tbDenAgregar: TToolButton;
    tbDenModificar: TToolButton;
    tbDenQuitar: TToolButton;
    tbSep2: TToolButton;
    tbDiagOrdenar: TToolButton;
    tbSep3: TToolButton;
    tbDiagExportar: TToolButton;
    tbDiagImprimir: TToolButton;
    dbgDenuncias: TRxDBGrid;
    pnlDenDetalle: TPanel;
    CoolBar1: TCoolBar;
    tbarDenDetalle: TToolBar;
    tbDetQuitar: TToolButton;
    dbgDetDenuncias: TRxDBGrid;
    fpDenuncia: TFormPanel;
    Label1: TLabel;
    Label2: TLabel;
    lbDenObservaciones: TLabel;
    Bevel1: TBevel;
    edDenFecha: TDateComboBox;
    cmbDenTipo: TImageComboBox;
    btnDenAceptar: TButton;
    btnDenCancelar: TButton;
    Panel1: TPanel;
    lblVisita: TLabel;
    edVisita: TEdit;
    btnBuscarVisitas: TSpeedButton;
    btnLimpiarVisita: TSpeedButton;
    edDenObservaciones: TRichEdit;
    dbgDetDenAsoc: TRxDBGrid;
    panGrupoRubro: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    sdqDetDenunciasAsociadas: TSDQuery;
    dsDetDenunciasAsociadas: TDataSource;
    btnAgregar: TButton;
    panObservaciones: TPanel;
    Label3: TLabel;
    redObservaciones: TRichEdit;
    sdqDetDenunciasObs: TSDQuery;
    dsDetDenunciasObs: TDataSource;
    pnlHeaderVisitas: TPanel;
    chkTodosOps: TCheckBox;
    btnReplicar: TButton;
    fpReplicarDenuncia: TFormPanel;
    Bevel2: TBevel;
    btnAceptarCambioPreventor: TButton;
    btnCancelarCambioPreventor: TButton;
    clbestablecimientos: TARTCheckListBox;
    lblestablecimientos: TLabel;
    fraGrupoDenuncia: TfraCodigoDescripcion;
    fraRubroDenuncia: TfraCodigoDescripcion;
    edFechaNotificacion: TDateComboBox;
    lbFechaNotificacion: TLabel;
    Label9: TLabel;
    pnlColor4: TPanel;
    Label10: TLabel;
    pnlColor5: TPanel;
    Label7: TLabel;
    ToolButton1: TToolButton;
    procedure qpDenReporteGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure sdqDenReporteAfterScroll(DataSet: TDataSet);
    procedure sdqDenunciasAfterScroll(DataSet: TDataSet);
    procedure btnDenAceptarClick(Sender: TObject);
    procedure dbgDenunciasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbDetQuitarClick(Sender: TObject);
    procedure tbDenAgregarClick(Sender: TObject);
    procedure tbDiagExportarClick(Sender: TObject);
    procedure tbDiagImprimirClick(Sender: TObject);
    procedure tbDenModificarClick(Sender: TObject);
    procedure tbDiagOrdenarClick(Sender: TObject);
    procedure tbDenQuitarClick(Sender: TObject);
    procedure tbDiagRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqDenReporteOBSERVACIONESGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure sdqDenReporteAfterOpen(DataSet: TDataSet);
    procedure btnLimpiarVisitaClick(Sender: TObject);
    procedure btnBuscarVisitasClick(Sender: TObject);
    procedure dbgDetDenunciasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgDetDenunciasCellClick(Column: TColumn);
    procedure ActualizarObservaciones(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure dbgDetDenAsocGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fpDenunciaClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReplicarClick(Sender: TObject);
    procedure btnAceptarCambioPreventorClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    FIdObraDenuncia: Integer;
    FIdVisita     : Integer;
    FCuit         : String;
    FEstableci    : Integer;
    FTipo         : String;
    FOperativo    : String;
    FOperativoDenuncia : String;
    iRepRecNro    : Integer;
    dRepLastFecha : TDateTime;
    FGrupo: TCtbClave;
    FTipoDescripcion: String;
    procedure SetGrupo(const Value: TCtbClave);
    procedure OnfraDenDetGrupoChange( Sender : TObject );
    procedure OnfraDenDetChange(Sender : TObject);
  public
    procedure Load(ACuit : String; AEstableci : Integer; ATipo, AOperativo : String; AGrupo : String);
    procedure Clear;
    procedure Save;
  published
    property Grupo            : TCtbClave read FGrupo            write SetGrupo;
    property TipoDescripcion  : String    read FTipoDescripcion  write FTipoDescripcion;
  end;

var
  frmDenIncumplimiento: TfrmDenIncumplimiento;

implementation

uses unPrincipal, General, Numeros, AnsiSql, CustomDlgs, StrFuncs, SqlFuncs,
  unDmPrincipal, unFet, unSesion, unConsVisitasRealizadas;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.qpDenReporteGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
     if dRepLastFecha = sdqDenReporte.FieldByName('OD_FECHA').AsDateTime Then begin
        if AreIn(Field.Field.FieldName, ['OD_FECHA', 'TIPO', 'OBSERVACIONES', 'OD_TIPO', 'OD_OPERATIVO']) Then begin
           AText       := '';
           //ABackground := clWhite;
        end;
     end else begin
        if Field.DataField = 'OBSERVACIONES' Then
           dRepLastFecha := sdqDenReporte.FieldByName('OD_FECHA').AsDateTime;
     end;

     if IsPair( iRepRecNro ) Then
        ABackground := $00E0E0E0
     else
        ABackground := $00EFEFEF; //$00F2F2F2;

//     if not sdqDenReporte.FieldByName('OD_FECHABAJA').IsNull Then
//        AFont.Style := [fsStrikeOut];
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.sdqDenReporteAfterScroll(DataSet: TDataSet);
begin
  if dRepLastFecha <> sdqDenReporte.FieldByName('OD_FECHA').AsDateTime Then
  begin
    qpDenReporte.Detail.MaxLines := 0;
    Inc(iRepRecNro);
  end
  else
    qpDenReporte.Detail.MaxLines := 1;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.sdqDenunciasAfterScroll(DataSet: TDataSet);
var
  TextoVisita,
  TextoObserv: String;
begin
  sdqDetDenuncias.Close;
  sdqDetDenuncias.ParamByName('cuit').Value := FCuit;
  sdqDetDenuncias.ParamByName('estableci').Value := FEstableci;
  sdqDetDenuncias.ParamByName('fecha').Value := sdqDenuncias.FieldByName('od_fecha').AsDateTime;

  if not chkTodosOps.Checked then
  begin
    sdqDetDenuncias.ParamByName('operativo').Value := FOperativo;
    sdqDetDenuncias.ParamByName('tipo').Value := FTipo;
  end else
  begin
    sdqDetDenuncias.ParamByName('operativo').Value := '';
    sdqDetDenuncias.ParamByName('tipo').Value := '';
  end;

//  sdqDetDenuncias.ParamByName('pidpodobradenuncia').Value := sdqDenuncias.FieldByName('od_id').AsInteger;
  sdqDetDenuncias.Open;

  tbarDenDetalle.Enabled := sdqDenuncias.FieldByName('od_fechabaja').IsNull;
  redObservaciones.Lines.Clear;

  TextoVisita:= ValorSql ('SELECT rv_descripcion ' +
                          '  FROM art.prv_resvisitas ' +
                          ' WHERE rv_idvisitaasociada is null and rv_id = ' + SqlValue (sdqDenuncias.FieldByName('od_idvisita').AsInteger));
  TextoObserv:= DataSet.FieldByName('OD_OBSERVACIONES1').AsString +
                DataSet.FieldByName('OD_OBSERVACIONES2').AsString;

  redObservaciones.Lines.Add(AdjustLineBreaks (Trim(TextoObserv +
                                                    iif (Pos (TextoVisita, TextoObserv) = 0, TextoVisita, ''))));
  redObservaciones.Lines.Text := Trim(redObservaciones.Lines.Text);

  panObservaciones.Visible := Trim(redObservaciones.Lines.Text) <> '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.btnDenAceptarClick(Sender: TObject);
Var
  Sql : TSql;
begin
  VerificarMultiple (['Registro de Denuncia',
                      edDenFecha,
                      not edDenFecha.IsEmpty,
                      'Debe seleccionar la Fecha de la Denuncia.',
                      edDenFecha,
                      edDenFecha.Date <= DBDate,
                      'La fecha debe ser menor o igual a hoy.',
                      edDenObservaciones,
                      Trim(edDenObservaciones.Text) <> '',
                      'Debe ingresar las observaciones de la Denuncia.',
                      dbgDetDenAsoc,
                      not sdqDetDenunciasAsociadas.IsEmpty,
                      'Debe ingresar detalle de la denuncia.'
                     ]);
 
  EjecutarSqlST('UPDATE art.pdd_detalledenuncia ' +
                '   SET dd_usualta = SUBSTR (dd_usualta, 3, 20) ' +
                ' WHERE dd_idpodobradenuncia = ' + SqlValue(FIdObraDenuncia) +
                '   AND SUBSTR (dd_usualta, 1, 2) = ''//'''
               );

  EjecutarSqlST('UPDATE art.pod_obradenuncia ' +
                '   SET od_usualta = SUBSTR (od_usualta, 3, 20) ' +
                ' WHERE od_id = ' + SqlValue(FIdObraDenuncia) +
                '   AND SUBSTR (od_usualta, 1, 2) = ''//'''
               );

  EjecutarSqlST('UPDATE art.poe_obradendetalle ' +
                '   SET oe_usualta = SUBSTR (oe_usualta, 3, 20) ' +
                ' WHERE oe_cuit = ' + SqlValue(FCuit) +
                '   AND oe_estableci = ' + SqlValue(FEstableci) +
                '   AND oe_fecha = ' + SqlValue(edDenFecha.Date) +
                '   AND SUBSTR (oe_usualta, 1, 2) = ''//'''
               );

  if (FIdObraDenuncia = 0) then
    FIdObraDenuncia := ValorSqlInteger ('SELECT od_id FROM art.pod_obradenuncia ' +
                                        ' WHERE od_cuit = ' + SqlValue(FCUIT) +
                                        '   AND od_estableci = ' + SqlValue(FEstableci) +
                                        '   AND od_fecha = ' + SqlDate (edDenFecha.Date) +
                                        '   AND od_operativo= ' + SqlValue (FOperativo), 0);

  Sql := TSql.Create('POD_OBRADENUNCIA');
  try
    edDenObservaciones.WordWrap := false;

    Sql.PrimaryKey.Add('OD_ID', FIdObraDenuncia);
    if FIdVisita > 0 then
      Sql.Fields.Add('OD_IDVISITA', FIdVisita);
    Sql.Fields.Add('OD_OBSERVACIONES1', TrimLeft (Copy(trim(edDenObservaciones.Text), 0, 4000)));
    Sql.Fields.Add('OD_OBSERVACIONES2', Copy(trim(edDenObservaciones.Text), 4001, 3900));
    Sql.SqlType := stUpdate;
    EjecutarSqlST(Sql.Sql);

    if FIdVisita > 0 then
      EjecutarSqlST('UPDATE art.pod_obradenuncia ' +
                    '   SET od_observaciones1 = (SELECT rv_descripcion ' +
                    '                              FROM art.prv_resvisitas ' +
                    '                             WHERE rv_id = od_idvisita ' +
                    '                              and rv_idvisitaasociada is null), ' +
                    '       od_fechamodif = sysdate,'+
                    '       od_usumodif = '+ SqlValue(frmPrincipal.DBLogin.LoginName)+
                    ' WHERE od_observaciones1 IS NULL ' +
                    '   AND od_idvisita IS NOT NULL ' +
                    '   AND od_id = ' + SqlValue(FIdObraDenuncia));
  finally
    edDenObservaciones.WordWrap := true;
    Sql.Free;
  end;

  ActualizarObservaciones(Sender);

  sdqDenuncias.Refresh ;
  sdqDenunciasAfterScroll(sdqDenuncias);

  fpDenuncia.ModalResult := mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.dbgDenunciasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqDenuncias.FieldByName('OD_FECHABAJA').IsNull Then
     AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.tbDetQuitarClick(Sender: TObject);
Var Sql : TSql;
begin
  if sdqDetDenuncias.IsEmpty or
     (not sdqDenuncias.FieldByName('od_fechabaja').IsNull) then
    Exit;

  if (sdqDetDenuncias.FieldByName('oe_grupo').AsString <> 'TE') and
     (sdqDetDenuncias.FieldByName('oe_grupo').AsString <> 'PE') then
  begin
    MsgBox('El detalle de denuncia no puede eliminarse pués corresponde a una medida correctiva', MB_ICONWARNING + MB_OK);

    Exit;
  end;

  if MsgBox('¿Desea eliminar el registro seleccionado?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  Sql := TSql.Create('art.poe_obradendetalle');
  try
    Sql.PrimaryKey.Add('oe_id', sdqDetDenuncias.FieldByName('OE_ID').AsInteger);
    Sql.Fields.Add('oe_fechabaja', SQL_ACTUALDATE, False);
    Sql.Fields.Add('oe_usubaja', frmPrincipal.DBLogin.LoginName );

    EjecutarSqlST( Sql.UpdateSql );
    sdqDetDenuncias.Refresh ;
  finally
    Sql.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.tbDenAgregarClick(Sender: TObject);
begin
//  FIdObraDenuncia := GetSecNextVal('ART.SEQ_POD_ID');
  FIdObraDenuncia := 0;
  FIdVisita := 0;
  edVisita.Clear;
  edDenFecha.Enabled := True;
  edDenFecha.Clear;

  cmbDenTipo.ItemIndex := 0;
  edDenObservaciones.Lines.Clear;
  edDenObservaciones.ReadOnly := false;
  edFechaNotificacion.Clear;

  if (FOperativo >= '200901') and (FTipo = 'ET') then
  begin
    edFechaNotificacion.Visible := True;
    lbFechaNotificacion.Visible := True;
  end
  else
  begin
    edFechaNotificacion.Visible := False;
    lbFechaNotificacion.Visible := False;
  end;

  edFechaNotificacion.Enabled      := True;
  FOperativoDenuncia := FOperativo;
  OnfraDenDetGrupoChange(NIL);

  edDenFecha.ReadOnly := False;
  edDenFecha.Color := clWindow;
  edDenFecha.TabStop := True;

  fpDenuncia.Caption := 'Agregar denuncia';
  fpDenuncia.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.tbDiagExportarClick(Sender: TObject);
begin
  edDenuncias.Execute;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.tbDiagImprimirClick(Sender: TObject);
var
  ImprimirBajas : boolean;
begin
  ImprimirBajas := MsgBox('¿Desea imprimir también las bajas?', MB_ICONQUESTION + MB_YESNO) = IDYES;

  if frmFet.PrintDialog.Execute Then begin
     dRepLastFecha := 0;

     with sdqDenReporte do begin
       Close;
       Params.Clear;

       SQL.Clear;
       SQL.Add ('  SELECT OD_FECHA, DECODE(OD_TIPO_VISITA, ''N'', ''Normal'', ''U'', ''Urgente'') TIPO, ' +
                '         OD_OBSERVACIONES1, OD_OBSERVACIONES2, NULL OBSERVACIONES, OD_FECHABAJA, ' +
                '         OE_GRUPO, OE_RUBRO, RD_DESCRIPCIONRUBRO, OD_TIPO, OD_OPERATIVO, ' +
                '         DECODE (OE_FECHABAJA, NULL, ''NO'', ''SÍ'') BAJA ' +
                '    FROM HYS.HGD_GRUPODENUNCIA, HYS.HRD_RUBRODENUNCIA, POE_OBRADENDETALLE, POD_OBRADENUNCIA ' +
                '   WHERE OD_CUIT = OE_CUIT ' +
                '     AND OD_ESTABLECI = OE_ESTABLECI ' +
                '     AND OD_TIPO = OE_TIPO ' +
                '     AND OD_OPERATIVO = OE_OPERATIVO ' +
                '     AND OD_FECHA = OE_FECHA ' +
                '     AND GD_CODIGO = OE_GRUPO ' +
                '     AND RD_CODIGORUBRO = OE_RUBRO ' +
                '     AND GD_ID = RD_IDGRUPO ' +
                      iif (ImprimirBajas, '', '     AND OE_FECHABAJA IS NULL') +
                '     AND OE_CUIT = ' + SqlValue (FCuit) +
                iif (chkTodosOps.Checked, '', '     AND OD_TIPO = ' + SqlValue (FTipo)) +
                iif (chkTodosOps.Checked, '', '     AND OD_OPERATIVO = ' + SqlValue (FOperativo)) +
                '     AND OE_ESTABLECI = ' + SqlValue (FEstableci) +
                ' ORDER BY OD_FECHA, OE_GRUPO, OE_RUBRO ');
     end;

     sdqDenReporte.Open;
     if sdqDenReporte.IsEmpty Then
        MsgBox('No se encontraron datos para generar el reporte.', MB_ICONINFORMATION)
     else begin
//        qpDenReporte.SubTitle.Lines.Clear;
//        qpDenReporte.SubTitle.Lines.Assign( FCopete );
//        qpDenReporte.SubTitle.Lines.Add( FTipoDescripcion );
//        qpDenReporte.SubTitle.Lines.Add( 'Operativo :' + FOperativo );
        qpDenReporte.Footer.Text   := frmPrincipal.DBLogin.Usuario ;
//        qpDenReporte.Title.Logo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO' );
        qpDenReporte.Print ;

     end;
     sdqDenReporte.Close;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.tbDenModificarClick(Sender: TObject);
var
  TipoDenuncia : String;
begin
  if sdqDenuncias.IsEmpty or
     (not sdqDenuncias.FieldByName('OD_FECHABAJA').IsNull) then
    Exit;

  FOperativoDenuncia := sdqDenuncias.FieldByName('od_operativo').AsString;
  TipoDenuncia := sdqDenuncias.FieldByName('od_tipo').AsString;
  OnfraDenDetGrupoChange(NIL);

  if (FOperativoDenuncia >= '200901') and (TipoDenuncia = 'ET') then
  begin
    edFechaNotificacion.Visible := True;
    lbFechaNotificacion.Visible := True;
  end
  else
  begin
    edFechaNotificacion.Visible := False;
    lbFechaNotificacion.Visible := False;
  end;

  edFechaNotificacion.date := sdqDetDenuncias.FieldByName('oe_fechanotificacion').AsDateTime;


  if (sdqDetDenuncias.FieldByName('oe_grupo').AsString <> 'TE') and
     (sdqDetDenuncias.FieldByName('oe_grupo').AsString <> 'PE') then
  begin
    MsgBox('La denuncia no puede editarse pués corresponde a una medida correctiva', MB_ICONWARNING + MB_OK);

    Exit;
  end;

  FIdObraDenuncia := sdqDenuncias.FieldByName('od_id').AsInteger;
  FIdVisita := sdqDenuncias.FieldByName('od_idvisita').AsInteger;
  edDenFecha.Enabled      := FIdVisita = 0;
  edFechaNotificacion.Enabled      := False;

  edDenFecha.Date         := sdqDenuncias.FieldByName('OD_FECHA').AsDateTime;
  cmbDenTipo.ItemIndex    := Pos(sdqDenuncias.FieldByName('OD_TIPO_VISITA').AsString, 'NU')-1;
  edDenObservaciones.Clear;
  edDenObservaciones.Text := sdqDenuncias.FieldByName('OD_OBSERVACIONES1').AsString;
  edVisita.Text:= ValorSql ('SELECT TO_CHAR (rv_fecha, ''DD/MM/YYYY'') || '' '' || rv_descripcion ' +
                            '  FROM art.prv_resvisitas ' +
                            ' WHERE rv_id = ' + SqlValue (FIdVisita)
                           );
  edDenFecha.ReadOnly     := True;
  edDenFecha.Color        := clBtnFace;
  edDenFecha.TabStop      := False;

  sdqDetDenunciasAsociadas.Close;
  sdqDetDenunciasAsociadas.ParamByName('pidpodobradenuncia').Value := FIdObraDenuncia;
  sdqDetDenunciasAsociadas.Open;

  ActualizarObservaciones(Sender);

  fpDenuncia.Caption := 'Editar denuncia';
  fpDenuncia.ShowModal ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.tbDiagOrdenarClick(Sender: TObject);
begin
  sdDenuncias.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.tbDenQuitarClick(Sender: TObject);
Var
  Sql : TSql;
begin
  if sdqDenuncias.IsEmpty or
     (not sdqDenuncias.FieldByName('OD_FECHABAJA').IsNull) then
    Exit;

  if (sdqDetDenuncias.FieldByName('oe_grupo').AsString <> 'TE') and
     (sdqDetDenuncias.FieldByName('oe_grupo').AsString <> 'PE') then
  begin
    MsgBox('La denuncia no puede eliminarse pués corresponde a una medida correctiva', MB_ICONWARNING + MB_OK);

    Exit;
  end;

  if MsgBox('¿Desea eliminar el registro seleccionado?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  Sql := TSql.Create('POD_OBRADENUNCIA');
  try
    Sql.PrimaryKey.Add('OD_ID', sdqDenuncias.FieldByName('od_id').AsInteger);
    Sql.Fields.Add('OD_FECHABAJA', SQL_ACTUALDATE, False);
    Sql.Fields.Add('OD_USUBAJA', frmPrincipal.DBLogin.LoginName );

    EjecutarSqlST(Sql.UpdateSql);

    EjecutarSqlST('UPDATE art.poe_obradendetalle ' +
                  '   SET oe_usubaja = ' + SqlValue (frmPrincipal.DBLogin.LoginName) + ', ' +
                  '       oe_fechabaja = SYSDATE ' +
                  ' WHERE oe_cuit = ' + SqlValue(FCuit) +
                  '   AND oe_estableci = ' + SqlValue(FEstableci) +
                  '   AND oe_fecha = ' + SqlValue(sdqDenuncias.FieldByName('od_fecha').AsDateTime)
                  );
    sdqDenuncias.Refresh;
    sdqDenunciasAfterScroll(sdqDenuncias);
  finally
    Sql.Free;
  end;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.tbDiagRefrescarClick(Sender: TObject);
begin
   sdqDenuncias.Close;
   sdqDenuncias.ParamByName('pCuit').AsString       := FCuit;
   sdqDenuncias.ParamByName('pEstableci').AsInteger := FEstableci;
   if not chkTodosOps.Checked then
   begin
     sdqDenuncias.ParamByName('pTipo').AsString       := FTipo;
     sdqDenuncias.ParamByName('pOperativo').AsString  := FOperativo
   end else
   begin
      sdqDenuncias.ParamByName('pTipo').AsString      := '';
      sdqDenuncias.ParamByName('pOperativo').AsString  := '';
   end;
   sdqDenuncias.Open;

   if sdqDenuncias.IsEmpty Then
      sdqDenunciasAfterScroll( sdqDenuncias );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.Clear;
begin
   sdqDenuncias.Close;
   sdqDetDenuncias.Close;
   redObservaciones.Lines.Clear
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.Load(ACuit: String; AEstableci: Integer; ATipo, AOperativo : String; AGrupo: String);
begin
   FCuit      := ACuit;
   FEstableci := AEstableci;
   FTipo      := ATipo;
   FOperativo := AOperativo;
   tbDiagRefrescarClick( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.FormCreate(Sender: TObject);
begin
  with fraGrupoDenuncia do
  begin
    TableName := 'HYS.HGD_GRUPODENUNCIA';
    FieldDesc := 'GD_DESCRIPCION';
    FieldID := 'GD_ID';
    FieldCodigo := 'GD_CODIGO';
    FieldBaja := 'GD_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    OnChange := OnfraDenDetGrupoChange;
  end;

  with fraRubroDenuncia do
  begin
    TableName := 'HYS.HRD_RUBRODENUNCIA';
    FieldDesc := 'RD_DESCRIPCIONRUBRO';
    FieldID := 'RD_ID';
    FieldCodigo := 'RD_CODIGORUBRO';
    FieldBaja := 'RD_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    ShowHint := true;
    ExtraCondition := ' AND 1=2';
    OnChange := OnfraDenDetChange;
  end;
{   fraDenDetGrupo.OnChange     := OnfraDenDetGrupoChange;
   fraDenDetGrupo.Clave        := 'DENGR';
   fraDenDetGrupo.ShowBajas    := false;

     fraDenDetRubro.OnChange     := OnfraDenDetChange;
   fraDenDetRubro.ExtraCondition := ' AND 1=2';}
//   fraDenDetGrupo.ExtraCondition := ' AND TB_FECHABAJA IS NULL';
//   fraDenDetRubro.Clave        := 'DOA1';
   cmbDenTipo.ItemImage[1]     := 0;
//   fraDenDetRubro.ShowHint := true;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.Save;
begin
  EjecutarSqlST(' UPDATE ART.POD_OBRADENUNCIA SET OD_FECHABAJA = SYSDATE, OD_USUBAJA = ' +
                  SqlValue(frmPrincipal.DBLogin.LoginName) +
                ' WHERE od_cuit = ' + SqlValue(FCUIT) +
                '   AND od_estableci = ' + SqlValue(FEstableci) +
                '   AND od_operativo = ' + SqlValue (FOperativo)  +
                '   AND od_fechabaja is null ' +
                ' AND NOT EXISTS (SELECT 1 FROM art.poe_obradendetalle ' +
                '                 WHERE oe_cuit = od_cuit AND oe_estableci = od_estableci ' +
                '                  AND oe_operativo = od_operativo ' +
                '                  AND oe_fecha = od_fecha ' +
                '                  AND OE_FECHABAJA IS NULL) ');

  EjecutarSqlST(' UPDATE ART.POD_OBRADENUNCIA SET OD_FECHABAJA = null, OD_USUBAJA = null, ' +
                ' od_fechamodif = sysdate, od_usumodif = ' + SqlValue(frmPrincipal.DBLogin.LoginName) +
                ' WHERE od_cuit = ' + SqlValue(FCUIT) +
                '   AND od_estableci = ' + SqlValue(FEstableci) +
               // '   AND od_operativo = ' + SqlValue (FOperativo)  +
                '   AND od_fechabaja is not null ' +
                ' AND EXISTS (SELECT 1 FROM art.poe_obradendetalle ' +
                '                 WHERE oe_cuit = od_cuit AND oe_estableci = od_estableci ' +
                '                  AND oe_operativo = od_operativo ' +
                '                  AND oe_fecha = od_fecha ' +
                '                  AND OE_FECHABAJA IS NULL) ');

   sdqDenuncias.Refresh ;
   sdqDenunciasAfterScroll(sdqDenuncias);
(*
   EjecutarSqlST(' UPDATE ART.POD_OBRADENUNCIA SET OD_FECHABAJA = SYSDATE, OD_USUBAJA = ' +
                   SqlValue(frmPrincipal.DBLogin.LoginName) +
                 ' WHERE od_cuit = ' + SqlValue(FCUIT) +
                 '   AND od_estableci = ' + SqlValue(FEstableci) +
                 '   AND od_operativo = ' + SqlValue (FOperativo)  +
                 '   AND od_fechabaja is null ' +
                 ' AND NOT EXISTS (SELECT 1 FROM ART.PDD_DETALLEDENUNCIA ' +
                 '             WHERE DD_IDPODOBRADENUNCIA = OD_ID AND DD_FECHABAJA is null) ');

   EjecutarSqlST(' UPDATE ART.POD_OBRADENUNCIA SET OD_FECHABAJA = null, OD_USUBAJA = null, ' +
                 ' od_fechamodif = sysdate, od_usumodif = ' + SqlValue(frmPrincipal.DBLogin.LoginName) +
                 ' WHERE od_cuit = ' + SqlValue(FCUIT) +
                 '   AND od_estableci = ' + SqlValue(FEstableci) +
                 '   AND od_operativo = ' + SqlValue (FOperativo)  +
                 '   AND od_fechabaja is not null ' +
                 ' AND EXISTS (SELECT 1 FROM ART.PDD_DETALLEDENUNCIA ' +
                 '             WHERE DD_IDPODOBRADENUNCIA = OD_ID AND DD_FECHABAJA is null) ');
*)
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.SetGrupo(const Value: TCtbClave);
begin
  if FGrupo <> Value Then begin
    FGrupo := Value;

    fraGrupoDenuncia.ExtraCondition := ' AND (gd_tipo = ' + SqlValue(FGrupo) + ') ' +
                                       ' AND (gd_codigo IN (''TE'',''PE'', ''BG'', ''CG'', ''PG''))';
    fraGrupoDenuncia.Clear;
    fraGrupoDenuncia.SelectFirst;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.OnfraDenDetGrupoChange(Sender: TObject);
begin
  fraRubroDenuncia.ExtraCondition := '';
  fraRubroDenuncia.ExtraCondition :=
            ' and RD_IDGRUPO = ' + fraGrupoDenuncia.ID +
            ' AND (rd_vigenciadesde <= '+SqlValue(FOperativoDenuncia)+' OR rd_vigenciadesde IS NULL) '+
            ' AND (rd_vigenciahasta > '+SqlValue(FOperativoDenuncia)+' OR rd_vigenciahasta IS NULL)';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDenIncumplimiento.sdqDenReporteOBSERVACIONESGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.FieldName = 'OBSERVACIONES' then
    Text := Sender.DataSet.FieldByName('OD_OBSERVACIONES1').AsString + ' ' +
            Sender.DataSet.FieldByName('OD_OBSERVACIONES2').AsString;
end;

procedure TfrmDenIncumplimiento.sdqDenReporteAfterOpen(DataSet: TDataSet);
begin
  sdqDenReporte.FieldByName('OBSERVACIONES').OnGetText := sdqDenReporteOBSERVACIONESGetText;
end;

procedure TfrmDenIncumplimiento.OnfraDenDetChange(Sender: TObject);
begin
  fraRubroDenuncia.Hint := fraRubroDenuncia.Descripcion;
  if edFechaNotificacion.ReadOnly = False then
    if fraGrupoDenuncia.Codigo = 'TE' then
      if fraRubroDenuncia.Codigo = '1' then
      begin
        edFechaNotificacion.Date := ValorSqlDateTime(
          ' SELECT MAX(rv_fecha) '+
          '   FROM art.prv_resvisitas, hys.hvm_visitamotivo, art.pmo_motivos '+
          '  WHERE vm_idvisita = rv_id '+
          '    AND vm_idmotivo = mo_id '+
          '    AND vm_idmotivo = 56 '+
          '    AND rv_cuit = '+SqlValue(FCuit)+
          '    AND rv_estableci = '+SqlValue(FEstableci)+
          '    AND rv_operativo = '+SqlValue(FOperativo)+
          '    AND rv_tipo = '+SqlValue(FTipo)+
          '    AND rv_fechabaja IS NULL');
        if edFechaNotificacion.Date = 0 then
          edFechaNotificacion.Date := ValorSqlDateTime(
          ' SELECT MAX(rv_fecha) '+
          '   FROM art.prv_resvisitas, hys.hvm_visitamotivo, art.pmo_motivos '+
          '  WHERE vm_idvisita = rv_id '+
          '    AND vm_idmotivo = mo_id '+
          '    AND vm_idmotivo = 56 '+
          '    AND rv_cuit = '+SqlValue(FCuit)+
          '    AND rv_operativo = '+SqlValue(FOperativo)+
          '    AND rv_tipo = '+SqlValue(FTipo)+
          '    AND rv_fechabaja IS NULL');
      end
      else
      begin
        edFechaNotificacion.Date := edDenFecha.Date;
      end;
end;

procedure TfrmDenIncumplimiento.btnLimpiarVisitaClick(Sender: TObject);
begin
  FIdVisita := 0;
  edDenFecha.Enabled := True;
  edVisita.Clear;
  ActualizarObservaciones(Sender);
end;

procedure TfrmDenIncumplimiento.btnBuscarVisitasClick(Sender: TObject);
var
  format :TFormatSettings;
begin
  format.DateSeparator := '/';
  format.ShortDateFormat := 'dd/mm/yyyy';
  with TfrmConsVisitasRealizadas.Create(self) do
  try
//    Init (FCUIT, FEstableci, FOperativo, FTipo, True);
    Init (FCUIT, FEstableci, '', FTipo, True);

    if ShowModal = mrOk then
    begin
      FIdVisita := FIdVisitaSeleccionada;

      edDenFecha.Date := FFechaVisitaSeleccionada;
      edDenFecha.Enabled := False;
      edVisita.Text := DateToStr(FFechaVisitaSeleccionada,format) + ' ' + FDescripcionVisitaSeleccionada;

      ActualizarObservaciones(Sender);
    end
  finally
    Free
  end;
end;

procedure TfrmDenIncumplimiento.dbgDetDenunciasGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not sdqDetDenuncias.FieldByName('OE_FECHABAJA').IsNull Then
     AFont.Color := clRed;
  if (sdqDetDenuncias.FieldByName('OE_TIPODENUNCIA').AsString = 'A') Then
    Background := clSkyBlue
end;

procedure TfrmDenIncumplimiento.dbgDetDenunciasCellClick(Column: TColumn);
begin
  dbgDetDenuncias.Hint := sdqDetDenuncias.FieldByName('rd_descripcionrubro').AsString;
  //btnReplicar.Enabled := (sdqDetDenuncias.FieldByName('OE_RUBRO').AsInteger = 2); //or (sdqDetDenuncias.FieldByName('OE_RUBRO').AsInteger = 1);
end;

procedure TfrmDenIncumplimiento.ActualizarObservaciones(Sender: TObject);
var
  FTextoAnterior : TStrings;
  TxtObs,
  TxtVisita: String;
  FRegsActivos: Boolean;
begin
  edDenObservaciones.WordWrap := false;

  FTextoAnterior := TStringList.Create;

  try
    edDenObservaciones.Text := trim(edDenObservaciones.Text);
    FTextoAnterior.AddStrings(edDenObservaciones.Lines);
    edDenObservaciones.Lines.Clear;
    FRegsActivos := false;

    with sdqDetDenunciasObs do
    begin
      ParamByName('pidpodobradenuncia').Value := FIdObraDenuncia;
      Open;
      while not EoF do
      begin
        if (Trim (FieldByName('obs').AsString) <> '') and
           FieldByName('fechabaja').IsNull then
        begin
          edDenObservaciones.Lines.Append(FieldByName('obs').AsString + ' ');

          FRegsActivos := true;
        end;
        Next
      end;
      Close;
    end;

    edDenObservaciones.ReadOnly := FRegsActivos;

    if not FRegsActivos then
      edDenObservaciones.Lines.AddStrings (FTextoAnterior);

    TxtObs := StrReplace (StrReplace (StrReplace (edDenObservaciones.Text, ' ', ''), #13, ''), #10, '');
    TxtVisita := StrReplace (StrReplace (StrReplace (Copy (edVisita.Text, 12, 2000), ' ', ''), #13, ''), #10, '');

    if Pos (TxtVisita, TxtObs) = 0 then
      edDenObservaciones.Lines.Append(Copy (edVisita.Text, 12, 2000));
  finally
    FTextoAnterior.Free
  end;

  edDenObservaciones.WordWrap := true
end;

procedure TfrmDenIncumplimiento.btnAgregarClick(Sender: TObject);
Var
  Sql : TSql;
begin
  Verificar((edDenFecha.Date = 0), edDenFecha, 'Debe ingresar la fecha o la visita');
  if edFechaNotificacion.Visible then
  begin
    Verificar(edFechaNotificacion.Date = 0, edFechaNotificacion, 'Debe ingresar la fecha de Notificación');
    Verificar(edFechaNotificacion.Date > edDenFecha.Date, edFechaNotificacion, 'La fecha de Notificación debe ser menor a la fecha de visita.');
  end;
  VerificarMultiple (['Registro de Detalle de Denuncia',
                      fraGrupoDenuncia,
                      fraGrupoDenuncia.IsSelected,
                      'Debe indicar el grupo',
                      fraRubroDenuncia,
                      fraRubroDenuncia.IsSelected,
                      'Debe indicar el rubro',
                      dbgDetDenAsoc,
                      not ExisteSQL('SELECT 1 ' +
                                    '  FROM art.pdd_detalledenuncia ' +
                                    ' WHERE dd_idpodobradenuncia = ' + SqlValue(FIdObraDenuncia) +
                                    '   AND dd_grupo = ' + SqlValue(fraGrupoDenuncia.Codigo) +
                                    '   AND dd_rubro = ' + SqlValue(fraRubroDenuncia.Codigo) +
                                    '   AND dd_fechabaja IS NULL '
                                   ) and
                      not ExisteSQL('SELECT 1 ' +
                                    '  FROM art.pod_obradenuncia, art.pdd_detalledenuncia ' +
                                    ' WHERE od_cuit = ' + SqlValue (FCUIT) +
                                    '   AND od_estableci = ' + SqlValue (FEstableci) +
                                    '   AND od_tipo = ' + SqlValue (FTipo) +
                                    '   AND od_operativo = ' + SqlValue (FOperativo) +
                                    '   AND od_id = dd_idpodobradenuncia ' +
                                    '   AND od_fecha = ' + SqlDate (edDenFecha.Date) +
                                    '   AND dd_grupo = ' + SqlValue(fraGrupoDenuncia.Codigo) +
                                    '   AND dd_rubro = ' + SqlValue(fraRubroDenuncia.Codigo) +
                                    '   AND dd_fechabaja IS NULL '
                                   ),
                      'Ya existe una denuncia idéntica a la ingresada para esta fecha.'
                     ]);


  if (FIdObraDenuncia = 0) then
    FIdObraDenuncia := ValorSqlInteger ('SELECT od_id FROM art.pod_obradenuncia ' +
                                        ' WHERE od_cuit = ' + SqlValue(FCUIT) +
                                        '   AND od_estableci = ' + SqlValue(FEstableci) +
                                        '   AND od_fecha = ' + SqlDate (edDenFecha.Date) +
                                        '   AND od_operativo= ' + SqlValue (FOperativo), 0);

  if (FIdObraDenuncia = 0) then
    FIdObraDenuncia := GetSecNextVal('ART.SEQ_POD_ID');

  Sql := TSql.Create('POD_OBRADENUNCIA');
  try
    Sql.PrimaryKey.Add('OD_ID', FIdObraDenuncia);
    Sql.Fields.Add('OD_CUIT', FCUIT);
    Sql.Fields.Add('OD_ESTABLECI', FEstableci);
    Sql.Fields.Add('OD_TIPO', FTipo);
    if FIdVisita = 0 then
      Sql.Fields.Add('OD_IDVISITA', exNull)
    else
      Sql.Fields.Add('OD_IDVISITA', FIdVisita);
    Sql.Fields.Add('OD_OPERATIVO', FOperativo);
    Sql.Fields.Add('OD_FECHA', edDenFecha.Date);
    Sql.Fields.Add('OD_TIPO_VISITA', GetChar('NU', cmbDenTipo.ItemIndex + 1) );
    if not ExisteSql('SELECT 1 FROM ART.POD_OBRADENUNCIA WHERE OD_ID = ' + SqlValue(FIdObraDenuncia)) then
    begin
      Sql.Fields.Add( 'OD_FECHAALTA', SQL_ACTUALDATE, False);
      Sql.Fields.Add( 'OD_USUALTA', '//' + frmPrincipal.DBLogin.LoginName );
      Sql.SqlType := stInsert;
    end else begin
      Sql.Fields.Add( 'OD_FECHAMODIF', SQL_ACTUALDATE, False);
      Sql.Fields.Add( 'OD_USUMODIF', frmPrincipal.DBLogin.LoginName );
      Sql.SqlType := stUpdate;
    end;

    EjecutarSqlST(Sql.Sql);
  finally
   Sql.Free;
  end;

  Sql := TSql.Create('art.pdd_detalledenuncia');
  try
    Sql.PrimaryKey.Add('dd_id', GetSecNextVal('ART.SEQ_PDD_ID'));
    Sql.Fields.Add('dd_grupo', fraGrupoDenuncia.Codigo);
    Sql.Fields.Add('dd_rubro', fraRubroDenuncia.Codigo);
    Sql.Fields.Add('dd_fechaalta', SQL_ACTUALDATE, False);
    Sql.Fields.Add('dd_usualta', '//' + frmPrincipal.DBLogin.LoginName );
    Sql.Fields.Add('dd_fechanotificacion', edFechaNotificacion.Date);
    Sql.Fields.Add('dd_tipo', FTipo);
    Sql.Fields.Add('dd_operativo', FOperativo);
    if FIdVisita > 0 then
      Sql.Fields.Add('dd_idvisita', FIdVisita);
    Sql.Fields.Add('dd_observaciones', String(ValorSql ('SELECT ed_texto ' +
                                                        '  FROM art.ped_excepcionrubrodenuncia ' +
                                                        ' WHERE ed_clave = ' + SqlValue('ID_' + fraGrupoDenuncia.Codigo) +
                                                        '   AND ed_codigo = ' + SqlValue(fraRubroDenuncia.Codigo)
                                                       )));
    Sql.Fields.Add('dd_idpodobradenuncia', FIdObraDenuncia);
    Sql.Fields.Add('DD_TIPODENUNCIA', 'M');

    Sql.SqlType := stInsert;

    EjecutarSqlST(Sql.Sql);

    sdqDetDenunciasAsociadas.Close;
    sdqDetDenunciasAsociadas.ParamByName('pidpodobradenuncia').Value := FIdObraDenuncia;
    sdqDetDenunciasAsociadas.Open;

    fraRubroDenuncia.Clear
  finally
    Sql.Free;
  end;

  ActualizarObservaciones(Sender);
end;

procedure TfrmDenIncumplimiento.dbgDetDenAsocGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqDetDenunciasAsociadas.FieldByName('dd_fechabaja').IsNull Then
     AFont.Color := clRed;
end;

procedure TfrmDenIncumplimiento.fpDenunciaClose(Sender: TObject;
  var Action: TCloseAction);
begin
  EjecutarSqlST('DELETE ' +
                '  FROM art.pdd_detalledenuncia ' +
                ' WHERE dd_idpodobradenuncia = ' + SqlValue(FIdObraDenuncia) +
                '   AND SUBSTR (dd_usualta, 1, 2) = ''//'''
               );

  EjecutarSqlST('DELETE FROM art.poe_obradendetalle ' +
                ' WHERE oe_cuit = ' + SqlValue(FCuit) +
                '   AND oe_estableci = ' + SqlValue(FEstableci) +
                '   AND oe_fecha = ' + SqlValue(edDenFecha.Date) +
                '   AND SUBSTR (oe_usualta, 1, 2) = ''//'''
               );

  EjecutarSqlST('DELETE FROM art.pod_obradenuncia ' +
                ' WHERE od_id = ' + SqlValue(FIdObraDenuncia) +
                '   AND SUBSTR (od_usualta, 1, 2) = ''//'''
               );

  sdqDetDenunciasAsociadas.Close;
end;


procedure TfrmDenIncumplimiento.btnReplicarClick(Sender: TObject);
var
  sSQL, sSQLItem : String;
begin
      Verificar((sdqDetDenuncias.FieldByName('oe_grupo').AsString <> 'TE') and
     (sdqDetDenuncias.FieldByName('oe_grupo').AsString <> 'PE'),btnReplicar,'Solo se pueden Replicar denuncias del grupo General');

    clbestablecimientos.Clear;
    sSQLItem := '';

    if ((sdqDetDenuncias.FieldByName('OE_RUBRO').AsInteger = 2) and (FTipo = 'EP')) or
       ((sdqDetDenuncias.FieldByName('OE_RUBRO').AsInteger = 3) and (FTipo = 'ET')) then
       sSQLItem :=
        '      AND NOT EXISTS ( '+
        '             SELECT 1 '+
        '               FROM pre_recomendaciones '+
        '              WHERE re_cuit = em_cuit '+
        '                AND re_estableci = es_nroestableci '+
        '                AND re_operativo = '+SqlValue(FOperativo)+
        '                AND re_tipo = '+SqlValue(FTipo)+
        '                AND re_fechabaja IS NULL) '
    else begin
      if((sdqDetDenuncias.FieldByName('OE_RUBRO').AsInteger = 2) and (FTipo = 'ET')) then

       sSQLItem :=
        '      AND NOT EXISTS ( '+
        '             SELECT 1 '+
        '               FROM hys.hpa_pal '+
        '              WHERE pa_cuit = em_cuit '+
        '                AND pa_estableci = es_nroestableci '+
        '                AND pa_operativo = '+SqlValue(FOperativo)+
        '                AND pa_tipo = '+SqlValue(FTipo)+
        '                AND pa_fechabaja IS NULL '+
        '                AND pa_cumplimiento IS NOT NULL '+
        '                AND pa_seguimiento IS NOT NULL) '
    end;



    sSQL :=
        '   SELECT   es_nroestableci, es_nombre '+
        '     FROM afi.aem_empresa, afi.aco_contrato, afi.aes_establecimiento, art.pet_empresastestigo '+
        '    WHERE em_id = co_idempresa '+
        '      AND es_contrato = co_contrato '+
        '      AND co_contrato = art.get_vultcontrato (em_cuit) ' +
        '      AND et_cuit = em_cuit ' +
        '      AND es_nroestableci = et_estableci ' +
        '      AND et_operativo = '+SqlValue(FOperativo)+
        '      AND et_tipo = '+SqlValue(FTipo)+
        '      AND et_fechabaja is null ' +
        '      AND not ((NVL(et_item5, -1) = 9999 ' +
        '             OR NVL(et_item6, -1)  = 9999)) ' +
        '      AND em_cuit = '+ SqlValue(FCuit)+
        '      AND es_nroestableci <> '+SqlInt(FEstableci)+
        '      AND es_fechabaja IS NULL '+
        sSQLItem +
        '      AND NOT EXISTS ( '+
        '             SELECT 1 '+
        '               FROM art.poe_obradendetalle '+
        '              WHERE oe_cuit = em_cuit '+
        '                AND oe_estableci = es_nroestableci '+
        '                AND oe_operativo = '+SqlValue(FOperativo)+
        '                AND oe_tipo = '+SqlValue(FTipo)+
        '                AND oe_fecha = '+SqlDate(sdqDenuncias.FieldByName('od_fecha').AsDateTime)+
        '                AND oe_grupo = '+ SqlValue(sdqDetDenuncias.FieldByName('OE_GRUPO').AsString)+
        '                AND oe_rubro = '+ SqlInt(sdqDetDenuncias.FieldByName('OE_RUBRO').AsInteger)+' )'+
        ' ORDER BY es_nroestableci';
  (*
    else if(sdqDetDenuncias.FieldByName('OE_RUBRO').AsInteger = 1)then
    begin
      sSQL :=
        ' SELECT es_nroestableci, es_nombre '+
        '   FROM afi.aem_empresa, afi.aco_contrato, afi.aes_establecimiento '+
        '  WHERE em_id = co_idempresa '+
        '    AND es_contrato = co_contrato '+
        '    AND co_contrato = art.get_vultcontrato(em_cuit) '+
        '    AND em_cuit = '+SqlValue(FCuit)+
        '    AND es_nroestableci <> '+SqlInt(FEstableci)+
        '    AND NOT EXISTS(SELECT 1 '+
        '                     FROM pet_empresastestigo '+
        '                    WHERE et_cuit = em_cuit '+
        '                      AND et_estableci = es_nroestableci '+
        '                      AND et_operativo = '+SqlValue(FOperativo)+
        '                      AND et_tipo = '+SqlValue(FTipo)+
        '                      AND et_fechabaja IS NULL) '+
        '    AND NOT EXISTS(SELECT 1 '+
        '                     FROM art.poe_obradendetalle '+
        '                    WHERE OE_cuit = em_cuit '+
        '                      AND OE_estableci = es_nroestableci '+
        '                      AND OE_operativo = '+SqlValue(FOperativo)+
        '                      AND OE_tipo = '+SqlValue(FTipo)+
        '                      AND OE_FECHA = '+SqlDate(sdqDenuncias.FieldByName('od_fecha').AsDateTime)+
        '                      AND OE_GRUPO = '+ SqlValue(sdqDetDenuncias.FieldByName('OE_GRUPO').AsString)+
        '                      AND OE_RUBRO = '+ SqlInt(sdqDetDenuncias.FieldByName('OE_RUBRO').AsInteger)+' )'+
        ' ORDER BY es_nroestableci ';
    end;
*)
    with GetQuery(sSQL)  do
    try
      while not Eof do
      begin
        clbestablecimientos.Add(Fields[0].AsString+' '+Fields[1].AsString,Fields[0].AsString);
        Next;
      end;
    finally
      Free;
    end;
    clbestablecimientos.CheckAll;
    fpReplicarDenuncia.ShowModal;
end;

procedure TfrmDenIncumplimiento.btnAceptarCambioPreventorClick(
  Sender: TObject);
var
//  IdObraDenuncia
  i :Integer;
  Sql : TSql;
  strObsAnt: String;
begin
  for i := 0 to clbestablecimientos.ItemsChecked.Count - 1 do
  begin

    FIdObraDenuncia := ValorSqlInteger ('SELECT od_id FROM art.pod_obradenuncia ' +
                                        ' WHERE od_cuit = ' + SqlValue(FCUIT) +
                                        '   AND od_estableci = ' + SqlValue(clbestablecimientos.ValuesChecked[i]) +
                                        '   AND od_fecha = ' + SqlDate(sdqDenuncias.FieldByName('od_fecha').AsDateTime) +
                                        '   AND od_operativo= ' + SqlValue (sdqDenuncias.FieldByName('OD_OPERATIVO').AsString));

    if (FIdObraDenuncia = 0) then
      FIdObraDenuncia := GetSecNextVal('ART.SEQ_POD_ID');

    Sql := TSql.Create('POD_OBRADENUNCIA');
    try
      Sql.PrimaryKey.Add('OD_ID', FIdObraDenuncia);
      Sql.Fields.Add('OD_CUIT', FCUIT);
      Sql.Fields.Add('OD_ESTABLECI', clbestablecimientos.ValuesChecked[i]);
      Sql.Fields.Add('OD_TIPO', sdqDenuncias.FieldByName('OD_TIPO').AsString);
      Sql.Fields.Add('OD_IDVISITA', sdqDenuncias.FieldByName('OD_IDVISITA').AsString);
      Sql.Fields.Add('OD_OPERATIVO', sdqDenuncias.FieldByName('OD_OPERATIVO').AsString);
      Sql.Fields.Add('OD_FECHA', sdqDenuncias.FieldByName('od_fecha').AsDateTime);
      Sql.Fields.Add('OD_TIPO_VISITA', sdqDenuncias.FieldByName('OD_TIPO_VISITA').AsString);
      if not ExisteSql('SELECT 1 FROM ART.POD_OBRADENUNCIA WHERE OD_ID = ' + SqlValue(FIdObraDenuncia)) then
      begin
        Sql.Fields.Add( 'OD_FECHAALTA', exDateTime);
        Sql.Fields.Add( 'OD_USUALTA', Sesion.UserID );
        Sql.Fields.Add('OD_OBSERVACIONES1', TrimLeft (Copy(trim(redObservaciones.Text), 0, 4000)));
        Sql.Fields.Add('OD_OBSERVACIONES2', Copy(trim(redObservaciones.Text), 4001, 3900));
        Sql.SqlType := stInsert;
      end else begin
        Sql.Fields.Add( 'OD_FECHAMODIF', exDateTime);
        Sql.Fields.Add( 'OD_USUMODIF', Sesion.UserID);
        strObsAnt := ValorSql('SELECT OD_OBSERVACIONES1 FROM ART.POD_OBRADENUNCIA WHERE OD_ID = ' + SqlValue(FIdObraDenuncia));
        strObsAnt := strObsAnt + ValorSql('SELECT OD_OBSERVACIONES2 FROM ART.POD_OBRADENUNCIA WHERE OD_ID = ' + SqlValue(FIdObraDenuncia));
        Sql.Fields.Add('OD_OBSERVACIONES1', TrimLeft(Copy(trim(redObservaciones.Text) + #13#10 + strObsAnt, 0, 4000)));
        Sql.Fields.Add('OD_OBSERVACIONES2', Copy(trim(redObservaciones.Text) + #13#10 + strObsAnt, 4001, 3900));
        Sql.SqlType := stUpdate;
      end;

      EjecutarSqlST(Sql.Sql);
    finally
     Sql.Free;
    end;

    Sql := TSql.Create('art.pdd_detalledenuncia');
    try
      Sql.PrimaryKey.Add('dd_id', GetSecNextVal('ART.SEQ_PDD_ID'));
      Sql.Fields.Add('dd_grupo', sdqDetDenuncias.FieldByName('oe_grupo').AsString);
      Sql.Fields.Add('dd_rubro', sdqDetDenuncias.FieldByName('oe_rubro').AsString);
      Sql.Fields.Add('dd_fechaalta', exDateTime);
      Sql.Fields.Add('dd_usualta', Sesion.UserID );
      Sql.Fields.Add('dd_establecireplica',FEstableci);
      Sql.Fields.Add('dd_fechanotificacion', sdqDetDenuncias.FieldByName('oe_fechanotificacion').AsString);
      Sql.Fields.Add('dd_tipo', sdqDenuncias.FieldByName('OD_TIPO').AsString);
      Sql.Fields.Add('dd_operativo', sdqDenuncias.FieldByName('OD_OPERATIVO').AsString);
      Sql.Fields.Add('dd_idvisita',  sdqDenuncias.FieldByName('OD_IDVISITA').AsString);
      Sql.Fields.Add('dd_observaciones', String(ValorSql ('SELECT ed_texto ' +
                                                          '  FROM art.ped_excepcionrubrodenuncia ' +
                                                          ' WHERE ed_clave = ' + SqlValue('ID_' + fraGrupoDenuncia.Codigo) +
                                                          '   AND ed_codigo = ' + SqlValue(fraRubroDenuncia.Codigo)
                                                         )));
      Sql.Fields.Add('dd_idpodobradenuncia', FIdObraDenuncia);

      Sql.SqlType := stInsert;

      EjecutarSqlST(Sql.Sql);

//      sdqDetDenunciasAsociadas.Close;
//      sdqDetDenunciasAsociadas.ParamByName('pidpodobradenuncia').Value := FIdObraDenuncia;
//      sdqDetDenunciasAsociadas.Open;
    finally
      Sql.Free;
    end;
  end;
  fpReplicarDenuncia.ModalResult := mrOk;
end;

procedure TfrmDenIncumplimiento.ToolButton1Click(Sender: TObject);
begin
  if sdqDenuncias.IsEmpty or
     (not sdqDenuncias.FieldByName('OD_FECHABAJA').IsNull) then
    MsgBox('No hay denuncia para cambiar o esta dada de baja.')
  else
  begin
    if (MsgBox('¿Desea cambiar la denuncia seleccionada al tipo : '+FTipo +
        ' y operativo :'+FOperativo +'?',  MB_ICONQUESTION + MB_YESNO,
        'Cambiar Denuncia') = IDYES) then
    begin
      EjecutarSqlST(
        ' UPDATE art.poe_obradendetalle '+
        '    SET oe_tipo = '+SqlValue(FTipo)+', '+
        '        oe_operativo = '+SqlValue(FOperativo)+', '+
        '        oe_fechaexport = NULL, '+
        '        oe_usuexport = NULL, '+
        '        oe_fechaexport2 = NULL, '+
        '        oe_usuexport2 = NULL '+
        '  WHERE oe_cuit = '+SqlValue(FCuit)+
        '    AND oe_estableci = '+SqlValue(FEstableci)+
        '    AND oe_fecha = '+SqlDate(sdqDenuncias.FieldByName('od_fecha').AsDateTime));

      EjecutarSqlST(
        ' UPDATE art.pod_obradenuncia '+
        '    SET od_tipo = '+SqlValue(FTipo)+', '+
        '        od_operativo = '+SqlValue(FOperativo)+', '+
        '        od_fechaexport = NULL, '+
        '        od_usuexport = NULL '+
        '  WHERE od_id = '+SqlValue(sdqDenuncias.FieldByName('od_id').AsInteger));

      tbDiagRefrescarClick(nil);
    end;
  end;
end;

end.




