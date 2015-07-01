unit unRecepPartes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryToFile, ExportDialog, ShortCutControl, SortDlg, QueryPrint,
  artSeguridad, Placemnt, Db, SDEngine, QRCtrls, QuickRpt, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ToolEdit, StdCtrls, Mask, DateComboBox,
  ComCtrls, ToolWin, ExtCtrls, RXSplit, FieldHider, unReingresoParte, Menus,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS;

type
  TfrmPartesReceptadas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    tbHerramientas: TToolBar;
    tbRefrescar: TToolButton;
    ToolButton3: TToolButton;
    tbOrden: TToolButton;
    ToolButton2: TToolButton;
    tbImprimir: TToolButton;
    tbVistaPrevia: TToolButton;
    ToolButton6: TToolButton;
    tbSalir: TToolButton;
    edFechaDesde: TDateComboBox;
    cmbEstados: TComboBox;
    dbgListado: TArtDBGrid;
    ScrollBox: TScrollBox;
    qrpReporte: TQuickRep;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlTitulo: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    qrbPgFooter: TQRBand;
    QRLabel18: TQRLabel;
    QRShape13: TQRShape;
    qrlUsuario: TQRLabel;
    QRSysData2: TQRSysData;
    sdqDatos: TSDQuery;
    dsConsulta: TDataSource;
    FormPlacement: TFormPlacement;
    Seguridad: TSeguridad;
    QueryPrint: TQueryPrint;
    SortDialog: TSortDialog;
    ShortCutControl: TShortCutControl;
    ExportDialog: TExportDialog;
    edFechaHasta: TDateComboBox;
    Label4: TLabel;
    DbgDetalle: TArtDBGrid;
    ToolButton1: TToolButton;
    sdqDetalles: TSDQuery;
    splitter: TRxSplitter;
    dsDetalle: TDataSource;
    sdqPrestadores: TSDQuery;
    cmbPrestadores: TComboBox;
    QRDBText5: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel6: TQRLabel;
    qrlDesde: TQRLabel;
    qrlHasta: TQRLabel;
    qrlPrestador: TQRLabel;
    qrlEstado: TQRLabel;
    tbCorregidoManualmente: TToolButton;
    FieldHiderDatos: TFieldHider;
    ToolBar1: TToolBar;
    PrintDialog: TPrintDialog;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSalirClick(Sender: TObject);
    procedure tbOrdenClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbVistaPreviaClick(Sender: TObject);
    procedure tbCorregidoManualmenteClick(Sender: TObject);
    procedure DbgDetalleDblClick(Sender: TObject);
    procedure DbgDetalleGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPartesReceptadas: TfrmPartesReceptadas;

implementation

uses unDmPrincipal, unPrincipal;

{$R *.DFM}

procedure TfrmPartesReceptadas.FormCreate(Sender: TObject);
var
   sqlQuery : TSDQuery;
   sql : string;
begin

        sql := 'SELECT CA_IDENTIFICADOR, CA_DESCRIPCION FROM ART.CPR_PRESTADOR ' +
               ' WHERE CA_FECHABAJA IS NULL AND ' +
               '       CA_ESPECIALIDAD = ''054'' ORDER BY CA_DESCRIPCION';
        sqlQuery := GetQuery( sql );
        try
           cmbPrestadores.Items.AddObject('Todos',TObject(0));

           while not sqlQuery.eof do begin
               cmbPrestadores.Items.AddObject(sqlQuery.FieldByName('CA_DESCRIPCION').asstring,
                                              TObject(sqlQuery.FieldByName('CA_IDENTIFICADOR').AsInteger));
               sqlQuery.Next;
           end;
        finally
          sqlQuery.free;
        end;

end;

procedure TfrmPartesReceptadas.tbRefrescarClick(Sender: TObject);
var
 sql : string;
begin

   sdqDatos.DisableControls;
   sdqDetalles.DisableControls;
   try
      try
        sdqDatos.close;
        sdqDetalles.Close;

        sql := 'SELECT iar_archivo.ar_descripcion, cpr_prestador.ca_descripcion, ' +
               ' decode(ccm_contenidomensajerecibido.cm_estado,''C'', ''Corregido'', ''E'', ''Error'' ' +
               '                                              , ''O'', ''Sin Error'', ''N/A'') as cm_estado, '        +
               ' ccm_contenidomensajerecibido.cm_nombrearchivofinal, ccm_contenidomensajerecibido.cm_observaciones,' +
               ' ccm_contenidomensajerecibido.cm_registroprocesados, ccm_contenidomensajerecibido.cm_registroscorrecto,' +
               ' cmr_mensajerecibido.mr_fecharecepcion, cmr_mensajerecibido.mr_emailemisor,' +
               ' cmr_mensajerecibido.mr_observaciones, cmr_mensajerecibido.mr_motivomensaje,'  +
               ' cm_id, cm_idmensajerecibido FROM comunes.ccm_contenidomensajerecibido, comunes.cam_tipoarchivomensaje,' +
               ' comunes.cmr_mensajerecibido, impoexpo.iar_archivo, cpr_prestador' +
               ' WHERE (' +
               ' (ccm_contenidomensajerecibido.cm_idmensajerecibido = cmr_mensajerecibido.mr_id)' +
               ' AND (ccm_contenidomensajerecibido.cm_idarchivo = cam_tipoarchivomensaje.am_id )' +
               ' AND (cam_tipoarchivomensaje.am_idarchivo = iar_archivo.ar_id) AND' +
               ' (cmr_mensajerecibido.mr_idprestador = cpr_prestador.ca_identificador(+))) ' +
               ' and am_idtipoarchivo is null ';


        if  (edFechaDesde.EditText <> '  /  /    ') and (edFechaHasta.EditText <> '  /  /    ') then begin
              sql := sql + 'AND (cmr_mensajerecibido.mr_fecharecepcion BETWEEN ' +
                     'TO_DATE(''' + edFechaDesde.EditText + ''',''DD/MM/YYYY'') AND ' +
                     'TO_DATE (''' + edFechaHasta.EditText + ''', ''DD/MM/YYYY'')   )';
        end;

        case cmbEstados.ItemIndex of
            0 : sql := sql + ' AND (ccm_contenidomensajerecibido.cm_estado = ''O'' ' +
                             ' AND ccm_contenidomensajerecibido.cm_registroprocesados = ccm_contenidomensajerecibido.cm_registroscorrecto' +
                             ' AND cmr_mensajerecibido.mr_estado = ''O'') ';
            1 : sql := sql + ' AND (ccm_contenidomensajerecibido.cm_estado = ''E'' ' +
                             ' OR ccm_contenidomensajerecibido.cm_registroprocesados <> ccm_contenidomensajerecibido.cm_registroscorrecto' +
                             ' OR cmr_mensajerecibido.mr_estado = ''E'') ' +
                             ' AND ccm_contenidomensajerecibido.cm_estado <> ''C''';
            2 : sql := sql + ' AND ccm_contenidomensajerecibido.cm_estado = ''C'' ';
        end;

        if cmbPrestadores.ItemIndex > -1 then begin
            if Integer(cmbPrestadores.Items.Objects[cmbPrestadores.ItemIndex]) > 0 then begin
                  sql := sql + ' AND cmr_mensajerecibido.mr_idprestador = ' +
                               inttostr(Integer(cmbPrestadores.Items.Objects[cmbPrestadores.ItemIndex]));
            end;
        end;

        sdqDatos.SQL.text := sql;
        sdqDatos.Open;

        sdqDetalles.Open;
      except

      end;
   finally
        sdqDatos.EnableControls;
        sdqDetalles.EnableControls;
   end;
end;

procedure TfrmPartesReceptadas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree ;
   frmPrincipal.mnuLstWebRecepcionParte.Enabled := True ;
end;

procedure TfrmPartesReceptadas.tbSalirClick(Sender: TObject);
begin
   close;
end;

procedure TfrmPartesReceptadas.tbOrdenClick(Sender: TObject);
begin
   SortDialog.Execute ;
end;

procedure TfrmPartesReceptadas.tbImprimirClick(Sender: TObject);
begin
     if MessageDlg('¿Desea imprimir un listado con los resultados de la consulta?', mtConfirmation, [mbYes, mbNo], 0)  = IDYES Then begin
        qrlUsuario.Caption := frmPrincipal.DBLogin.Usuario ;
        qrlTitulo.Caption  := 'Detalle de Recepción de Partes ';
        if PrintDialog.Execute then qrpReporte.Print;
     end;

end;

procedure TfrmPartesReceptadas.tbVistaPreviaClick(Sender: TObject);
begin
     if MessageDlg('¿Desea imprimir un listado con los resultados de la consulta?', mtConfirmation, [mbYes, mbNo], 0)  = IDYES Then begin
        qrlUsuario.Caption := frmPrincipal.DBLogin.Usuario ;
        qrlTitulo.Caption  := 'Detalle de Recepción de Partes ';

        if edFechaDesde.IsValid then qrlDesde.Caption := 'Fecha Desde: ' + edFechaDesde.Text
        else qrlDesde.Caption := 'Fecha Desde: - ';
        if edFechaHasta.IsValid then qrlHasta.Caption := 'Fecha Hasta: ' + edFechaHasta.Text
        else qrlHasta.Caption := 'Fecha Hasta: - ';

        if trim(cmbPrestadores.Text) <> '' then  qrlPrestador.Caption := 'Prestador: ' + cmbPrestadores.Text
        else qrlPrestador.Caption := 'Prestador: - ';
        if trim(cmbEstados.Text) <> '' then qrlEstado.Caption    := 'Estado: ' + cmbEstados.Text
        else qrlEstado.Caption    := 'Estado: - ';

        qrpReporte.Preview;
     end;

end;

procedure TfrmPartesReceptadas.tbCorregidoManualmenteClick(
  Sender: TObject);
begin
     if sdqDatos.RecordCount > 0 then
       if  MessageBox(0, '¿Desea marcar el envio como corregido?', 'Recepción de Partes', MB_ICONQUESTION or MB_YESNO) = idYES then begin
        EjecutarSqlEx(' update comunes.ccm_contenidomensajerecibido ' +
                      ' set   cm_estado = ''C''                     ' +
                      ' where cm_id = :cm_id and                    ' +
                      '       cm_idmensajerecibido = :cm_idmensajerecibido',
                      [sdqDatos.FieldByName('cm_id').AsInteger,
                       sdqDatos.FieldByName('cm_idmensajerecibido').AsInteger]);

        tbRefrescar.Click;
      end;
end;
{$WARNINGS OFF}
procedure TfrmPartesReceptadas.DbgDetalleDblClick(Sender: TObject);
var
 b : TBookmark;
begin
      if sdqDetalles.RecordCount > 0 then
        with TfrmReingresoParte.create(self) do
        try
            if sdqDetalles.FieldByName('is_estado').asstring = 'Error' then
              CargaParteErroneo(sdqDetalles.Fields);
        finally
            try
                sdqDetalles.DisableControls;
                b := sdqDetalles.GetBookmark;
                sdqDetalles.Refresh;
            finally
                sdqDetalles.GotoBookmark(b);
                sdqDetalles.EnableControls;
                sdqDetalles.FreeBookMark(b);
            end;

            free;
        end;
end;
{$WARNINGS ON}
procedure TfrmPartesReceptadas.DbgDetalleGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin

     if (sdqDetalles.FieldByName('IS_ESTADO').AsString =  'Error') then
//      if (Field.DisplayLabel = 'IS_ESTADO') and  (Field.AsString =  'Error') then
        DbgDetalle.Canvas.Font.Color := clRed
      else
        DbgDetalle.Canvas.Font.Color := clBlack;

     if Highlight then begin
        AFont.Color := clHighlightText;
        Background := clHighlight;
     end;

end;

end.
