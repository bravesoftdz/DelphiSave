{----------------------------------------------------------------------------------------------------------------------
   Modulo de ABL de Eventos.
   Autor: EVila.
}
unit unABMEventos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unFraCtbTablas, unArtFrame, unFraCodigoDescripcion,
  StdCtrls, IntEdit, RxLookup, CurrEdit, Mask, ToolEdit,
  DateComboBox, FormPanel, unFraEmpresa, PatternEdit, unArtDBAwareFrame,
  DBClient, RxToolEdit, RxPlacemnt;

type
  TfrmABMEventos = class(TfrmCustomConsulta)
    lbNroOrden: TLabel;
    edGD_NROORDEN: TIntEdit;
    lbCaratula: TLabel;
    edGD_CARATULA: TEdit;
    lbAbogado: TLabel;
    lbFuero: TLabel;
    lbJuzgado: TLabel;
    edGD_JUZGADO: TIntEdit;
    lbSecretaria: TLabel;
    edGD_SECRETARIA: TIntEdit;
    lbJurisdiccion: TLabel;
    frmPanelABMEventos: TFormPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    lbNroGasto: TLabel;
    lbConcepto: TLabel;
    lbFecha: TLabel;
    lbObservaciones: TLabel;
    edGE_NROEVENTO: TIntEdit;
    edGE_FECHA: TDateComboBox;
    eGE_OBSERVACIONES: TMemo;
    fraEvento: TfraCtbTablas;
    Label1: TLabel;
    edGD_GESTOR: TEdit;
    edGE_NOMBRE: TEdit;
    edGD_ABOGADO: TEdit;
    edBO_NOMBRE: TEdit;
    edGD_FUERO: TEdit;
    edFUERO: TEdit;
    edGD_JURISDICCION: TEdit;
    edJURISDICCION: TEdit;
    Label2: TLabel;
    edMP_CONTRATO: TEdit;
    edMP_NOMBRE: TEdit;
    edGD_CUIT: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edGD_FECHAASIGN: TEdit;
    edGD_CARTERA: TEdit;
    ShortCutControl1: TShortCutControl;
    tbrVerArchivosAsociados: TToolBar;
    tbSeleccionArchivosAsociar: TToolButton;
    edtArchivosAsociados: TEdit;
    lblArchivosAsociados: TLabel;
    sdqArchivosAsociados: TSDQuery;
    cdsArchivosAsociados: TClientDataSet;
    tbAsociarDoc: TToolButton;
    lblEventoRE: TLabel;
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbSeleccionArchivosAsociarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FSFormActivate(Sender: TObject);
    procedure tbAsociarDocClick(Sender: TObject);
  private
    FOrden, FIDEventoGD: Integer;
    procedure CargarArchivos;
    procedure RecargarArchivosAsociados(cdsArchivosAsociados: TClientDataSet);
  protected
    procedure RefreshData; override;
  public
    function GetExecute( AOrden: Integer ) : boolean;
  end;

var
  frmABMEventos: TfrmABMEventos;

Const
     TitEVENTOS_Alta           = 'Alta de Eventos';
     TitEVENTOS_Bajas          = 'Baja de Eventos' ;
     TitEVENTOS_Modificacion   = 'Modificacion de Eventos';

implementation

uses
  unPrincipal, CustomDlgs, General, AnsiSql, SqlFuncs, unDmPrincipal, unfraAbogadosLegales,
  unRptEventos, unSesion, unArchivosAsociados;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmABMEventos }
{----------------------------------------------------------------------------------------------------------------------}
// Function que se usa para cargar los datos del EVENTO cuando es llamado desde otro form.
function TfrmABMEventos.GetExecute(AOrden: Integer): boolean;
var
  sSql : string;
  sdqCarga : TSDQuery;
begin
  sSql := 'SELECT GD_NROORDEN, GD_CARATULA, GD_FECHAASIGN, GD_CARTERA, ' +
                 'GD_GESTOR, GE_NOMBRE, ' +
                 'GD_ABOGADO, BO_NOMBRE, ' +
                 'EM_CUIT, EM_NOMBRE, CO_CONTRATO, ' +
                 'GD_FUERO, FUERO.TB_DESCRIPCION FUERO, ' +
                 'GD_JUZGADO, GD_SECRETARIA, ' +
                 'GD_JURISDICCION, JURIS.JU_DESCRIPCION JURISDICCION ' +
            'FROM AFI.AEM_EMPRESA, ACO_CONTRATO, LGD_GESTIONDEUDA, AGE_GESTORCUENTA, LEGALES.LBO_ABOGADO, ' +
                 'CTB_TABLAS FUERO, LEGALES.LJU_JURISDICCION JURIS ' +
           'WHERE GD_CONTRATO = CO_CONTRATO ' +
             'AND GE_CODGESTOR(+) = GD_GESTOR ' +
             'AND BO_ID(+) = GD_ABOGADO ' +
             'AND FUERO.TB_CLAVE(+) = ''FUERO'' ' +
             'AND FUERO.TB_CODIGO(+) = GD_FUERO ' +
             'AND JURIS.JU_ID(+) = TO_NUMBER(GD_JURISDICCION) ' +
             'AND EM_ID = CO_IDEMPRESA ' +
             'AND GD_NROORDEN = ' + SqlValue( AOrden );

  sdqCarga := GetQuery(sSql);
  try
    edGD_NROORDEN.Value    := AOrden;
    edGD_CARATULA.Text     := sdqCarga.FieldByName('GD_CARATULA').asString;
    edGD_GESTOR.Text       := sdqCarga.FieldByName('GD_GESTOR').asString;
    edGE_NOMBRE.Text       := sdqCarga.FieldByName('GE_NOMBRE').asString;
    edGD_ABOGADO.Text      := sdqCarga.FieldByName('GD_ABOGADO').asString;
    edBO_NOMBRE.Text       := sdqCarga.FieldByName('BO_NOMBRE').asString;
    edGD_CUIT.Text         := sdqCarga.FieldByName('EM_CUIT').asString;
    edMP_NOMBRE.Text       := sdqCarga.FieldByName('EM_NOMBRE').asString;
    edMP_CONTRATO.Text     := sdqCarga.FieldByName('CO_CONTRATO').asString;
    edGD_FUERO.Text        := sdqCarga.FieldByName('GD_FUERO').asString;
    edFUERO.Text           := sdqCarga.FieldByName('FUERO').asString;
    edGD_JUZGADO.Text      := sdqCarga.FieldByName('GD_JUZGADO').asString;
    edGD_SECRETARIA.Text   := sdqCarga.FieldByName('GD_SECRETARIA').asString;
    edGD_JURISDICCION.Text := sdqCarga.FieldByName('GD_JURISDICCION').asString;
    edJURISDICCION.Text    := sdqCarga.FieldByName('JURISDICCION').asString;
    edGD_FECHAASIGN.Text   := sdqCarga.FieldByName('GD_FECHAASIGN').asString;
    edGD_CARTERA.Text      := sdqCarga.FieldByName('GD_CARTERA').asString;
  finally
    sdqCarga.Free;
  end;

  FOrden := AOrden;

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Alta de un nuevo EVENTO.
procedure TfrmABMEventos.tbNuevoClick(Sender: TObject);
begin
if self.tag=0 then begin
    Try
       FIDEventoGD := -1;
       edGE_NROEVENTO.Value := -1;
       cdsArchivosAsociados.EmptyDataSet;

       edGE_NROEVENTO.Visible :=False;
       lbNroGasto.visible     :=False;
       edGE_FECHA.Clear;
       eGE_OBSERVACIONES.Clear;
       fraEvento.Limpiar;
       edtArchivosAsociados.Clear;
       //
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
procedure TfrmABMEventos.tbModificarClick(Sender: TObject);
begin
  if self.tag=0 then begin
    if NOT sdqConsulta.IsEmpty then begin
        Try
           if sdqConsulta.FieldByName('procedencia').AsString = 'J' then
           begin
             lblEventoRE.Visible := true;
             lblEventoRE.Caption := sdqConsulta.fieldbyname('tb_descripcion').AsString;
             fraEvento.Visible := false;
             btnAceptar.Enabled := false;
             tbAsociarDoc.Enabled := false;
             MsgBox('Este evento fue cargado desde juicios parte actora y no puede ser modificado en este módulo.', MB_ICONWARNING);
           end;
           edGE_NROEVENTO.Visible :=True;
           lbNroGasto.Visible     := True;

           edGE_NROEVENTO.Text    := sdqConsulta.FieldByName( 'ge_nroevento' ).asString;
           fraEvento.Codigo       := sdqConsulta.FieldByName( 'ge_codigo' ).asString;
           edGE_FECHA.Date        := sdqConsulta.FieldByName( 'ge_fecha' ).asDateTime;
           eGE_OBSERVACIONES.Text := sdqConsulta.FieldByName( 'ge_observaciones' ).asString;
           FIDEventoGD            := sdqConsulta.FieldByName( 'ge_id' ).AsInteger;

           CargarArchivos;
           edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) +
                               ' Archivos Asociados.';

           frmPanelABMEventos.Caption := TitEVENTOS_Modificacion;
           if frmPanelABMEventos.ShowModal = mrOk Then
              RefreshData;
        Except                                                // Si existe algun erro en el proceso lo captura para su tratamiento.
          on E: Exception do begin
             ErrorMsg( E );                                  // Muestra el mensaje de error.
          end;
        end;
        btnAceptar.Enabled := true;
        tbAsociarDoc.Enabled := true;
        lblEventoRE.Visible := false;
        fraEvento.Visible := true;
    end;
      end else begin
      msgbox('No puede modificar un evento ya que el juicio esta cerrado.',0,'Error de Eventos')
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Baja de un EVENTO Existente.
procedure TfrmABMEventos.tbEliminarClick(Sender: TObject);
begin
  if self.tag=0 then begin
    if NOT sdqConsulta.IsEmpty then begin
        Try
           edGE_NROEVENTO.Visible :=True;
           lbNroGasto.Visible     :=True;

           edGE_NROEVENTO.Text      := sdqConsulta.FieldByName( 'ge_nroevento' ).asString;
           fraEvento.Codigo         := sdqConsulta.FieldByName( 'ge_codigo' ).asString;
           edGE_FECHA.Date          := sdqConsulta.FieldByName( 'ge_fecha' ).asDateTime;
           eGE_OBSERVACIONES.Text   := sdqConsulta.FieldByName( 'ge_observaciones' ).asString;
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
procedure TfrmABMEventos.btnAceptarClick(Sender: TObject);
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
       if edGE_FECHA.IsEmpty then begin
          InvalidMsg( edGE_FECHA, 'La fecha no puede quedar en blanco' );
          bTodoOK := False;
       end;
       // Fin Control...
       if bTodoOK then begin
         SqlTrans := TSql.Create('LGE_EVENTOSGDEUDA');
         try
           if frmPanelABMEventos.Caption = TitEVENTOS_Alta then begin
              FIDEventoGD := GetSecNextVal('ART.SEQ_LGE_ID');

              SqlTrans.PrimaryKey.Add('GE_ID', FIDEventoGD, False);
              iNroEvento := ValorSql('SELECT IIF_Compara( ''<='', NVL(Max( GE_NROEVENTO ), 0), 0, 1, NVL(Max( GE_NROEVENTO ), 0)+1 ) FROM LGE_EVENTOSGDEUDA WHERE GE_NROORDEN = ' + IntToStr( edGD_NROORDEN.Value ) );
              edGE_NROEVENTO.Value := iNroEvento;

              SqlTrans.Fields.Add( 'GE_NROORDEN', edGD_NROORDEN.Text );
              SqlTrans.Fields.Add( 'GE_NROEVENTO', IntToStr(iNroEvento), False );
              SqlTrans.Fields.Add( 'GE_USUALTA', frmPrincipal.DBLogin.UserId );
              SqlTrans.Fields.Add( 'GE_FECHAALTA', 'Actualdate', False);
              SqlTrans.SqlType := stInsert;
           end else if frmPanelABMEventos.Caption = TitEVENTOS_Modificacion then begin
              SqlTrans.PrimaryKey.Add( 'GE_NROORDEN', edGD_NROORDEN.Text );
              SqlTrans.PrimaryKey.Add( 'GE_NROEVENTO', edGE_NROEVENTO.Text );
              SqlTrans.Fields.Add( 'GE_USUMODIF', frmPrincipal.DBLogin.UserId );
              SqlTrans.Fields.Add( 'GE_FECHAMODIF', 'Actualdate', False);
              SqlTrans.SqlType := stUpdate;
           end;
           SqlTrans.Fields.Add( 'GE_CODIGO', fraEvento.Value );
           SqlTrans.Fields.Add( 'GE_FECHA', edGE_FECHA.Date );
           SqlTrans.Fields.Add( 'GE_OBSERVACIONES', eGE_OBSERVACIONES.Text );

           BeginTrans;
           Try
             EjecutarSQLST( SqlTrans.Sql );

             cdsArchivosAsociados.First;
             while not cdsArchivosAsociados.Eof do
             begin
               if cdsArchivosAsociados.FieldByName('STATE').AsString = 'I' then
               begin
                 EjecutarSqlST('INSERT INTO legales.leg_eventoarchivogd ' +
                               ' (eg_id, eg_descripcion, eg_patharchivo, ' +
                               '  eg_ideventogd, eg_usualta, eg_fechaalta) ' +
                               'VALUES (' + SqlValue(cdsArchivosAsociados.FieldByName('ID').AsInteger) + ',  ' +
                                            SqlValue(cdsArchivosAsociados.FieldByName('DESCRIPCION').AsString) + ', ' +
                                            SqlValue(cdsArchivosAsociados.FieldByName('PATHARCHIVO').AsString) + ', ' +
                                            SqlValue(FIDEventoGD) + ',' +
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
         Finally
           SqlTrans.Free;
         end;
    end else if frmPanelABMEventos.Caption = TitEVENTOS_Bajas then begin
        if MsgBox( '¿Esta Ud. seguro que desea dar de baja este Evento?', MB_ICONINFORMATION + MB_YESNO, 'Atención' ) = ID_YES then begin
           SqlTrans := TSql.Create('LGE_EVENTOSGDEUDA');
           iNroEvento := ValorSql('SELECT IIF_Compara( ''>'', NVL(Min( GE_NROEVENTO ), 0), 0, -1, NVL(Min( GE_NROEVENTO ), 0)-1 ) FROM LGE_EVENTOSGDEUDA WHERE GE_NROORDEN = ' + IntToStr( edGD_NROORDEN.Value ) );
           SqlTrans.Fields.Add( 'GE_NROEVENTO', IntToStr(iNroEvento), False );
           SqlTrans.PrimaryKey.Add( 'GE_NROORDEN', edGD_NROORDEN.Text );
           SqlTrans.PrimaryKey.Add( 'GE_NROEVENTO', edGE_NROEVENTO.Text );
           SqlTrans.Fields.Add( 'GE_USUMODIF', frmPrincipal.DBLogin.UserId );
           SqlTrans.Fields.Add( 'GE_FECHAMODIF', 'Actualdate', False);
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
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventos.tbImprimirClick(Sender: TObject);
var
  rptLstEventos: TfrmRptEventos;
  sqlAnt: String;
begin
  rptLstEventos := TfrmRptEventos.Create(Self);
  with rptLstEventos do
    try
      sqlAnt := sdqReporteDET.SQL.Text;
      sdqReporteCAB.ParamByName('nNroOrden').asInteger := edGD_NROORDEN.Value;
      sdqReporteCAB.Open;
      sdqReporteDET.ParamByName('nNroOrden').asInteger := edGD_NROORDEN.Value;
      sdqReporteDET.SQL.Text := sqlAnt + SortDialog.OrderBy;
      sdqReporteDET.Open;
      if sdqReporteDET.IsEmpty then
        MsgBox('No se encontraron datos para la selección actual')
      else
        rptEventos.PreviewModal
    finally
      sdqReporteDET.SQL.Text := sqlAnt;
      Free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventos.FormCreate(Sender: TObject);
begin
  inherited;
  fraEvento.Clave := 'EVEGD';
  SortDialog.SortFields.Clear;
  LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventos.CargarArchivos;
var
 i : integer;
begin
  try
    sdqArchivosAsociados.ParamByName('IdEventoGD').AsInteger := FIDEventoGD;
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
procedure TfrmABMEventos.RecargarArchivosAsociados(cdsArchivosAsociados: TClientDataSet);
begin
  cdsArchivosAsociados.First;
  while not cdsArchivosAsociados.Eof do
  begin
    if cdsArchivosAsociados.FieldByName('STATE').AsString = 'D' then
    begin
      EjecutarSqlST('UPDATE legales.leg_eventoarchivogd ' +
                    '   SET eg_usubaja = ' + SqlValue(Sesion.LoginName) + ', ' +
                    '       eg_fechabaja = SYSDATE' +
                    ' WHERE eg_id = ' + SqlValue(cdsArchivosAsociados.FieldByName('ID').AsInteger));

      cdsArchivosAsociados.Delete;
    end
    else cdsArchivosAsociados.Next;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventos.tbSeleccionArchivosAsociarClick(Sender: TObject);
begin
  with TfrmArchivosAsociados.Create(self) do
  try
    CargarArchivosAsociadosGD(StrToInt(edGD_NROORDEN.Text), StrToInt(edGE_NROEVENTO.Text), cdsArchivosAsociados);
    RecargarArchivosAsociados(cdsArchivosAsociados);
    edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) +
                                 ' Archivos Asociados.';
  finally
    Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventos.tbRefrescarClick(Sender: TObject);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventos.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT GE_NROEVENTO, TB_DESCRIPCION, GE_FECHA, GE_OBSERVACIONES, GE_CODIGO, GE_ID, ' +
                ' NVL((SELECT DISTINCT ''S'' FROM legales.leg_eventoarchivogd '+
                ' WHERE eg_ideventogd = ge_id AND eg_fechabaja IS NULL), ''N'') tieneadjunto, ''GD'' procedencia '+
            'FROM CTB_TABLAS, LGE_EVENTOSGDEUDA ' +
           'WHERE TB_CODIGO = GE_CODIGO ' +
             'AND TB_CLAVE = ''EVEGD'' ' +
             'AND GE_NROORDEN = :NROORDEN ' +
             'AND GE_NROEVENTO > 0 '+
          'UNION ALL '+
          'SELECT et_idtipoevento, lte_tipoevento.te_descripcion TB_DESCRIPCION,et_fechaevento GE_FECHA, to_char(substr(et_observaciones,0,4000)) GE_OBSERVACIONES,null , et_id, '+
                ' NVL ((SELECT DISTINCT ''S'' '+
                '                  FROM legales.lea_eventoarchivoasociado '+
                '                 WHERE ea_ideventojuicioentramite = et_id '+
                '                   AND ea_fechabaja IS NULL), '+
                '      ''N'' '+
                '     ) tieneadjunto, '+
                ' ''J'' procedencia '+
           ' FROM legales.let_eventojuicioentramite, legales.lte_tipoevento '+
          ' WHERE (et_idtipoevento = lte_tipoevento.te_id) '+
            ' AND et_idjuicioentramite IN (SELECT jt_id  '+
                                  ' FROM art.lgd_gestiondeuda, legales.lod_origendemanda, legales.ljt_juicioentramite '+
                                 ' WHERE gd_nroorden = :nroorden' +
                                   ' AND jt_id = od_idjuicioentramite '+
                                   ' AND jt_estadomediacion = ''A'' '+
                                   ' AND gd_contrato = od_contrato ) ';
  sdqConsulta.ParamByName('NROORDEN').asInteger := FOrden;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventos.FSFormActivate(Sender: TObject);
begin
  RefreshData;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventos.tbAsociarDocClick(Sender: TObject);
begin
  with TfrmArchivosAsociados.Create(self) do
  try
    CargarDirectoArchivosAsociadosGD(StrToInt(edGD_NROORDEN.Text), StrToInt(edGE_NROEVENTO.Text), cdsArchivosAsociados);
    RecargarArchivosAsociados(cdsArchivosAsociados);
    edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) +
                                 ' Archivos Asociados.';
  finally
    Free;
  end;
end;

end.

