{----------------------------------------------------------------------------------------------------------------------
   Modulo de ABL de Eventos.
   Autor: EVila.
}
unit unABMEventosRecupero;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unFraCtbTablas, unFraEmpresa, unArtFrame, unFraCodigoDescripcion,
  unfraAbogadosLegales, StdCtrls, IntEdit, RxLookup, CurrEdit, Mask, ToolEdit,
  DateComboBox, FormPanel, unFraTrabajador, SinEdit, PatternEdit,
  unArtDBAwareFrame, unArtDbFrame, DBClient, vclextra;

type
  TfrmABMEventosRecupero = class(TfrmCustomConsulta)
    lbAbogado: TLabel;
    fraAbogados: TfraAbogadosLegales;
    fraEmpresa: TfraEmpresa;
    sdqCarga: TSDQuery;
    frmPanelABMEventos: TFormPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    lbNroGasto: TLabel;
    lbConcepto: TLabel;
    lbFecha: TLabel;
    lbObservaciones: TLabel;
    edRE_NROEVENTO: TIntEdit;
    edRE_FECHA: TDateComboBox;
    eRE_OBSERVACIONES: TMemo;
    fraEvento: TfraCtbTablas;
    edRS_SINIESTRO: TSinEdit;
    lbRS_SINIESTRO: TLabel;
    fraTrabajador: TfraTrabajador;
    Label1: TLabel;
    Label2: TLabel;
    ShortCutControl1: TShortCutControl;
    lblArchivosAsociados: TLabel;
    edtArchivosAsociados: TEdit;
    tbrVerArchivosAsociados: TToolBar;
    tbSeleccionArchivosAsociar: TToolButton;
    cdsArchivosAsociados: TClientDataSet;
    sdqArchivosAsociados: TSDQuery;
    tbAsociarDoc: TToolButton;
    lblEventoJA: TLabel;
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbSeleccionArchivosAsociarClick(Sender: TObject);
    procedure FSFormActivate(Sender: TObject);
    procedure tbAsociarDocClick(Sender: TObject);
  private
    FSINIESTRO, FORDEN, FIdRecupero, FIdEventoRecupero: Integer;
    procedure MostrarArchivosAsociados;
    procedure RecargarArchivosAsociados(cdsArchivosAsociados: TClientDataSet);
    procedure CargarArchivos;
  protected
    procedure RefreshData; override;
  public
    function GetExecuteRecupero( EXSiniestro, EXOrden: Integer ) : boolean;
  end;

var
  frmABMEventosRecupero: TfrmABMEventosRecupero;

Const
  TitEVENTOS_Alta           = 'Alta de Eventos';
  TitEVENTOS_Bajas          = 'Baja de Eventos' ;
  TitEVENTOS_Modificacion   = 'Modificacion de Eventos';

implementation

uses
  unPrincipal, CustomDlgs, General, AnsiSql, SqlFuncs, unDmPrincipal, unLstPosibleRecupero,
  UnRptEventosRecupero, unArchivosAsociados, unSesion;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosRecupero.FormCreate(Sender: TObject);
begin
  inherited;
  fraEvento.Clave   := 'EVRES';
  fraEmpresa.ShowBajas := true;
  fraEmpresa.UltContrato := true;
end;                              
{----------------------------------------------------------------------------------------------------------------------}
// Function que se usa para cargar los datos del EVENTO cuando es llamado desde otro form.
function TfrmABMEventosRecupero.GetExecuteRecupero(EXSiniestro, EXOrden: Integer): boolean;
var
  sSql: String;
begin
   sSql := 'SELECT RS_ID ' +
             'FROM LRS_RECUPEROSINIESTROS ' +
            'WHERE RS_SINIESTRO = :Siniestro ' +
              'AND RS_ORDEN = :Orden';
   FIdRecupero := ValorSqlIntegerEx(sSql, [EXSiniestro, EXOrden]);

   sdqCarga.ParamByName('nEx_Siniestro').asInteger := EXSiniestro;
   sdqCarga.ParamByName('nEx_Orden').asInteger := EXOrden;
   sdqCarga.Open;
   edRS_SINIESTRO.Siniestro := EXSiniestro;
   edRS_SINIESTRO.Orden     := EXOrden;
   fraAbogados.Codigo        := sdqCarga.FieldByName( 'Rs_Abogado' ).asString;
   fraEmpresa.CUIT := sdqCarga.FieldByName( 'Ex_Cuit' ).AsString;
   fraTrabajador.CUIL := sdqCarga.FieldByName( 'Ex_Cuil' ).AsString;
   sdqCarga.Close;
   // Carga la grilla.
   sdqConsulta.Close;
   sdqConsulta.ParamByName('nEx_Siniestro').asInteger := EXSiniestro;
   sdqConsulta.ParamByName('nEx_Orden').asInteger := EXOrden;
   sdqConsulta.Open;
   // Muestra la ventana y devuelve Ok si todo esta bien.

   FSiniestro := EXSiniestro;
   FOrden     := EXOrden;

   Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Alta de un nuevo EVENTO.
procedure TfrmABMEventosRecupero.tbNuevoClick(Sender: TObject);
begin
  if self.tag=0 then begin
      Try
         FIdEventoRecupero := -1;
         cdsArchivosAsociados.EmptyDataSet;

         edRE_NROEVENTO.Clear;
         edRE_NROEVENTO.Visible:=False;
         lbNroGasto.visible:=False;
         edRE_FECHA.Clear;
         eRE_OBSERVACIONES.Clear;
         fraEvento.Limpiar;
         edtArchivosAsociados.Clear;

         frmPanelABMEventos.Caption := TitEVENTOS_Alta;
         if frmPanelABMEventos.ShowModal = mrOk Then
            RefreshData;
      Except                                                // Si existe algun erro en el proceso lo captura para su tratamiento.
        on E: Exception do begin
           ErrorMsg( E );                                  // Muestra el mensaje de error.
        end;
      end;
  end else begin
      msgbox('No puede agregar un evento ya que el juicio esta cerrado.',0,'Error de Eventos')
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Modificacion de un EVENTO Existente.
procedure TfrmABMEventosRecupero.tbModificarClick(Sender: TObject);
begin
  if self.tag=0 then begin
    if NOT sdqConsulta.IsEmpty then begin
        Try

           if sdqConsulta.FieldByName('procedencia').AsString = 'J' then
           begin
             btnAceptar.Enabled := false;
             tbAsociarDoc.Enabled := false;
             lblEventoJA.Visible := true;
             fraEvento.Visible := false;
             lblEventoJA.Caption := sdqConsulta.FieldByName('tb_descripcion').AsString;
             eRE_OBSERVACIONES.Text := sdqConsulta.FieldByName('obsJA').AsString;

             MsgBox('Este evento fue cargado desde J.Parte Actora y no puede ser modificado en este módulo.', MB_ICONWARNING)
           end
           else
             eRE_OBSERVACIONES.Text := sdqConsulta.FieldByName( 'Re_observaciones' ).AsString;

           edRE_NROEVENTO.Visible:=True;
           vclextra.LockControl(edRE_NROEVENTO, true);
           lbNroGasto.Visible:=True;

           edRE_NROEVENTO.Text      := sdqConsulta.FieldByName( 'Re_nroevento' ).asString;
           fraEvento.Codigo := sdqConsulta.FieldByName( 'Re_codigo' ).asString;
           edRE_FECHA.Date          := sdqConsulta.FieldByName( 'Re_fecha' ).asDateTime;
           FIdEventoRecupero        := sdqConsulta.FieldByName('Re_id').AsInteger;
           //
           CargarArchivos;
           edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) +
                                        ' Archivos Asociados.';

           frmPanelABMEventos.Caption := TitEVENTOS_Modificacion;
           if frmPanelABMEventos.ShowModal = mrOk Then
              RefreshData;
           btnAceptar.Enabled := true;
           tbAsociarDoc.Enabled := true;
           lblEventoJA.Visible := false;
           fraEvento.Visible := true;
        Except                                                // Si existe algun erro en el proceso lo captura para su tratamiento.
          on E: Exception do begin
             ErrorMsg( E );                                  // Muestra el mensaje de error.
          end;
        end;
    end;
      end else begin
      msgbox('No puede modificar un evento ya que el juicio esta cerrado.',0,'Error de Eventos')
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Baja de un EVENTO Existente.
procedure TfrmABMEventosRecupero.tbEliminarClick(Sender: TObject);
begin
  if self.tag=0 then begin
    if NOT sdqConsulta.IsEmpty then begin
        Try
           if sdqConsulta.FieldByName('procedencia').AsString = 'J' then
           begin
             MsgBox('Este evento fue cargado desde J.Parte Actora y no puede ser modificado en este módulo.', MB_ICONWARNING);
             Abort;
           end;

           edRE_NROEVENTO.Visible:=True;
           lbNroGasto.visible:=True;
           edtArchivosAsociados.Clear;

           edRE_NROEVENTO.Text    := sdqConsulta.FieldByName( 'Re_nroevento' ).asString;
           fraEvento.Codigo       := sdqConsulta.FieldByName( 'Re_codigo' ).asString;
           edRE_FECHA.Date        := sdqConsulta.FieldByName( 'Re_fecha' ).asDateTime;
           eRE_OBSERVACIONES.Text := sdqConsulta.FieldByName( 'Re_observaciones' ).asString;
           //
           frmPanelABMEventos.Caption := TitEVENTOS_Bajas;
           if frmPanelABMEventos.ShowModal = mrOk Then
              RefreshData;
        Except                                                // Si existe algun erro en el proceso lo captura para su tratamiento.
          on E: Exception do begin
             ErrorMsg( E );                                  // Muestra el mensaje de error.
          end;
        end;
    end;
        end else begin
      msgbox('No puede Borrar un evento ya que el juicio esta cerrado.',0,'Error de Eventos')
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Boton de Aceptar del FromPanel de Alta, Modificacion o Baja.
procedure TfrmABMEventosRecupero.btnAceptarClick(Sender: TObject);
Var SqlTrans : TSql;
    bTodoOK   : Boolean;
    iNroEvento : Integer;
begin
    if ( frmPanelABMEventos.Caption = TitEVENTOS_Alta ) or ( frmPanelABMEventos.Caption = TitEVENTOS_Modificacion )then begin
       // control
       bTodoOK := True;
       if fraEvento.Value = '' then begin
          invalidMsg( fraEvento, 'El evento no puede quedar en blanco' );
          bTodoOK := False;
       end;
       if edRE_FECHA.IsEmpty then begin
          InvalidMsg( edRE_FECHA, 'La fecha no puede quedar en blanco' );
          bTodoOK := False;
       end;
       // Fin Control...

       if bTodoOK then begin
         SqlTrans := TSql.Create('LRE_RECUPEROEVENTOS');
         try
           if frmPanelABMEventos.Caption = TitEVENTOS_Alta then begin
              FIdEventoRecupero := GetSecNextVal('ART.SEQ_LRE_ID');

              SqlTrans.PrimaryKey.Add('RE_ID', FIdEventoRecupero, False);
              iNroEvento := ValorSql('SELECT IIF_Compara( ''<='', NVL(Max( RE_NROEVENTO ), 0), 0, 1, NVL(Max( RE_NROEVENTO ), 0)+1 ) FROM LRE_RECUPEROEVENTOS WHERE RE_SINIESTRO = ' + edRS_SINIESTRO.SiniestroS +  ' AND RE_ORDEN = ' + edRS_SINIESTRO.OrdenS );
              SqlTrans.Fields.Add( 'RE_SINIESTRO', edRS_SINIESTRO.SiniestroS );
              SqlTrans.Fields.Add( 'RE_ORDEN', edRS_SINIESTRO.OrdenS );
              SqlTrans.Fields.Add( 'RE_NROEVENTO', IntToStr(iNroEvento), False );
              SqlTrans.Fields.Add( 'RE_USUALTA', frmPrincipal.DBLogin.UserId );
              SqlTrans.Fields.Add( 'RE_FECHAALTA', 'Actualdate', False);
              SqlTrans.SqlType := stInsert;
           end else if frmPanelABMEventos.Caption = TitEVENTOS_Modificacion then begin
               SqlTrans.PrimaryKey.Add( 'RE_SINIESTRO', edRS_SINIESTRO.SiniestroS );
               SqlTrans.PrimaryKey.Add( 'RE_ORDEN', edRS_SINIESTRO.OrdenS );
               SqlTrans.PrimaryKey.Add( 'RE_NROEVENTO', edRE_NROEVENTO.Text );
               SqlTrans.Fields.Add( 'RE_USUMODIF', frmPrincipal.DBLogin.UserId );
               SqlTrans.Fields.Add( 'RE_FECHAMODIF', 'Actualdate', False);
               SqlTrans.SqlType := stUpdate;
           end;
           SqlTrans.Fields.Add( 'RE_CODIGO', fraEvento.Value );
           SqlTrans.Fields.Add( 'RE_FECHA', edRE_FECHA.Date );
           SqlTrans.Fields.Add( 'RE_OBSERVACIONES', eRE_OBSERVACIONES.Text );

           BeginTrans;
           Try
              EjecutarSQLST( SqlTrans.Sql );

              cdsArchivosAsociados.First;
              while not cdsArchivosAsociados.Eof do
              begin
                if cdsArchivosAsociados.FieldByName('STATE').AsString = 'I' then
                begin
                  EjecutarSqlST('INSERT INTO legales.ler_eventoarchivorecupero ' +
                                ' (er_id, er_descripcion, er_patharchivo, ' +
                                '  er_ideventorecupero, er_usualta, er_fechaalta) ' +
                                'VALUES (' + SqlValue(cdsArchivosAsociados.FieldByName('ID').AsInteger) + ',  ' +
                                             SqlValue(cdsArchivosAsociados.FieldByName('DESCRIPCION').AsString) + ', ' +
                                             SqlValue(cdsArchivosAsociados.FieldByName('PATHARCHIVO').AsString) + ', ' +
                                             SqlValue(FIdEventoRecupero) + ',' +
                                             SqlValue(Sesion.LoginName) + ', SYSDATE)');
                end;
                cdsArchivosAsociados.Next;
              end;

              CommitTrans;
              MsgBox('La operación se realizó con exito', MB_ICONEXCLAMATION, 'Atención');
              frmPanelABMEventos.ModalResult := mrOk;
           except
             on E: Exception do
             begin
               Rollback;
               ErrorMsg(E, 'Error al guardar el evento.');
             end;
           end;
         finally
           SqlTrans.Free;
         end;
       end;
    end else if frmPanelABMEventos.Caption = TitEVENTOS_Bajas then begin
        if msgBox( '¿Esta Ud. seguro que desea dar de baja este Evento?', MB_ICONINFORMATION + MB_YESNO, 'Atención' ) = ID_YES then begin
           SqlTrans := TSql.Create('LRE_RECUPEROEVENTOS');
           iNroEvento := ValorSql('SELECT IIF_Compara( ''>'', NVL(Min( RE_NROEVENTO ), 0), 0, -1, NVL(Min( RE_NROEVENTO ), 0)-1 ) FROM LRE_RECUPEROEVENTOS WHERE RE_SINIESTRO = ' + edRS_SINIESTRO.SiniestroS +  ' AND RE_ORDEN = ' + edRS_SINIESTRO.OrdenS );
           SqlTrans.Fields.Add( 'RE_NROEVENTO', IntToStr(iNroEvento), False );
           SqlTrans.PrimaryKey.Add( 'RE_SINIESTRO', edRS_SINIESTRO.SiniestroS );
           SqlTrans.PrimaryKey.Add( 'RE_ORDEN', edRS_SINIESTRO.OrdenS );
           SqlTrans.PrimaryKey.Add( 'RE_NROEVENTO', edRE_NROEVENTO.Text );
           SqlTrans.Fields.Add( 'RE_USUMODIF', frmPrincipal.DBLogin.UserId );
           SqlTrans.Fields.Add( 'RE_FECHAMODIF', 'Actualdate', False);
           Try
              EjecutarSQL( SqlTrans.UpdateSql );
              msgBox('La baja se realizó con exito', MB_ICONEXCLAMATION, 'Atención');
              frmPanelABMEventos.ModalResult := mrOk;
           Finally
              SqlTrans.Free;
           end;
        end;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosRecupero.tbImprimirClick(Sender: TObject);
var
  rptLstEventos: TfrmRptEventosRecupero;
  sqlAnt: String;
begin
  rptLstEventos := TfrmRptEventosRecupero.Create(Self);
  with rptLstEventos do
  Try
    sqlAnt := sdqReporteDET.SQL.Text;
    sdqReporteCAB.ParamByName('nNroSiniestro').asInteger := edRS_SINIESTRO.Siniestro;
    sdqReporteCAB.ParamByName('nNroOrden').asInteger := edRS_SINIESTRO.Orden;
    sdqReporteCAB.Open;
    sdqReporteDET.ParamByName('nNroSiniestro').asInteger := edRS_SINIESTRO.Siniestro;
    sdqReporteDET.ParamByName('nNroOrden').asInteger := edRS_SINIESTRO.Orden;
    sdqReporteDET.SQL.Text := sqlAnt + SortDialog.OrderBy;
    sdqReporteDET.Open;
    if (sdqReporteDET.IsEmpty) and (sdqReporteDET.IsEmpty) then
      MsgBox('No se encontraron datos para la selección actual')
    else begin
      rptEventosRecupero.PreviewModal;
    end;
  Finally
    sdqReporteDET.SQL.Text := sqlAnt;
    Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosRecupero.tbSeleccionArchivosAsociarClick(Sender: TObject);
begin
  MostrarArchivosAsociados;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosRecupero.MostrarArchivosAsociados;
begin
  with TfrmArchivosAsociados.Create(self) do
  try
    if (frmPanelABMEventos.Caption = TitEVENTOS_Modificacion) and (self.sdqConsulta.FieldByName('procedencia').AsString = 'J') then
    begin
      tbNuevo.Enabled := false;
      tbEliminar.Enabled := false;
    end;
    CargarArchivosAsociadosRecuperos(FIdRecupero, FIdEventoRecupero, cdsArchivosAsociados);
    RecargarArchivosAsociados(cdsArchivosAsociados);
    edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) +
                                 ' Archivos Asociados.';
  finally
    Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosRecupero.RecargarArchivosAsociados(cdsArchivosAsociados: TClientDataSet);
begin
  cdsArchivosAsociados.First;
  while not cdsArchivosAsociados.Eof do
  begin
    if cdsArchivosAsociados.FieldByName('STATE').AsString = 'D' then
    begin
      EjecutarSqlST('UPDATE legales.ler_eventoarchivorecupero ' +
                    '   SET er_usubaja = ' + SqlValue(Sesion.LoginName) + ', ' +
                    '       er_fechabaja = SYSDATE' +
                    ' WHERE er_id = ' + SqlValue(cdsArchivosAsociados.FieldByName('ID').AsInteger));

      cdsArchivosAsociados.Delete;
    end
    else cdsArchivosAsociados.Next;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosRecupero.CargarArchivos;
var
 i : integer;
begin
  try
    sdqArchivosAsociados.ParamByName('IdEventoRecupero').AsInteger := FIdEventoRecupero;
    sdqArchivosAsociados.Open;
    cdsArchivosAsociados.EmptyDataSet;
    while not sdqArchivosAsociados.Eof do
    begin
      cdsArchivosAsociados.Append;

      for i := 0 to sdqArchivosAsociados.Fields.count - 1 do
        cdsArchivosAsociados.fields[i].Value := sdqArchivosAsociados.Fields[i].Value;

      cdsArchivosAsociados.FieldByName('STATE').AsString := 'V';
      cdsArchivosAsociados.Post;
      sdqArchivosAsociados.Next;
    end;
  finally
    sdqArchivosAsociados.Close;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosRecupero.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT RE_NROEVENTO, RE_CODIGO, TB_DESCRIPCION, RE_FECHA, RE_OBSERVACIONES RE_OBSERVACIONES, null obsJA,  RE_ID, ' +
                ' NVL((SELECT DISTINCT ''S'' FROM legales.ler_eventoarchivorecupero '+
                ' WHERE er_ideventorecupero = re_id AND er_fechabaja IS NULL), ''N'') tieneadjunto, ''R'' procedencia  '+
            'FROM CTB_TABLAS, LRE_RECUPEROEVENTOS ' +
           'WHERE TB_CODIGO = RE_CODIGO ' +
             'AND TB_CLAVE = ''EVRES'' ' +
             'AND RE_SINIESTRO = :NEX_SINIESTRO ' +
             'AND RE_ORDEN = :NEX_ORDEN ' +
             'AND RE_NROEVENTO > 0 ' +
             'UNION ALL ' +
           'SELECT NULL, TO_CHAR(et_idtipoevento), te_descripcion, et_fechaevento, dbms_lob.substr(et_observaciones, 4000, 1), et_observaciones, et_id, ' +
           '       NVL((SELECT DISTINCT ''S''  ' +
           '                       FROM legales.lea_eventoarchivoasociado  ' +
           '                      WHERE ea_ideventojuicioentramite = et_id ' +
           '                        AND ea_fechabaja IS NULL), ''N'') tieneadjunto, ''J'' procedencia ' +
           '  FROM legales.ljt_juicioentramite, legales.lod_origendemanda, legales.lsj_siniestrosjuicioentramite, ' +
           '       legales.let_eventojuicioentramite, legales.lte_tipoevento ' +
           ' WHERE jt_id = od_idjuicioentramite ' +
           '   AND et_idtipoevento = te_id ' +
           '   AND sj_idorigendemanda = od_id ' +
           '   AND et_idjuicioentramite = jt_id ' +
           '   AND sj_fechabaja IS NULL ' +
           '   AND od_fechabaja IS NULL ' +
           '   AND et_fechabaja IS NULL ' +
           '   AND jt_estadomediacion = ''A'' ' + 
           '   AND sj_siniestro = :NEX_SINIESTRO ' +
           '   AND sj_orden = :NEX_ORDEN ';
  sdqConsulta.ParamByName('NEX_SINIESTRO').asInteger := FSINIESTRO;
  sdqConsulta.ParamByName('NEX_ORDEN').asInteger     := FORDEN;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosRecupero.FSFormActivate(Sender: TObject);
begin
  RefreshData;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosRecupero.tbAsociarDocClick(Sender: TObject);
begin
  with TfrmArchivosAsociados.Create(self) do
  try
    CargarDirectoArchivosAsociadosRecuperos(FIdRecupero, FIdEventoRecupero, cdsArchivosAsociados);
    RecargarArchivosAsociados(cdsArchivosAsociados);
    edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) + ' Archivos Asociados.';
  finally
    Free;
  end;
end;

end.

