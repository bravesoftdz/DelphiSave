{----------------------------------------------------------------------------------------------------------------------
   Modulo de ABL de Eventos de Concursos y Quiebras.
   Autor: EVila.
   Date: 25/04/2002
}
unit unABMEventosCyQ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unFraCtbTablas, unFraEmpresa, unArtFrame, unFraCodigoDescripcion,
  unfraAbogadosLegales, StdCtrls, IntEdit, RxLookup, CurrEdit, Mask, ToolEdit,
  DateComboBox, FormPanel, unArtDbFrame, PatternEdit, unArtDBAwareFrame,
  DBClient;

type
  TfrmABMEventosCyQ = class(TfrmCustomConsulta)
    lbNroJuicio: TLabel;
    edCQ_NROORDEN: TIntEdit;
    lbAbogado: TLabel;
    fraAbogados: TfraAbogadosLegales;
    fraEmpresa: TfraEmpresa;
    lbFuero: TLabel;
    fraFuero: TfraCtbTablas;
    lbJuzgado: TLabel;
    edCQ_JUZGADO: TIntEdit;
    lbSecretaria: TLabel;
    edCQ_SECRETARIA: TIntEdit;
    lbJurisdiccion: TLabel;
    sdqCargaDatos: TSDQuery;
    frmPanelABMEventos: TFormPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    lbConcepto: TLabel;
    lbFecha: TLabel;
    lbObservaciones: TLabel;
    edCE_NROEVENTO: TIntEdit;
    edCE_FECHA: TDateComboBox;
    edCE_OBSERVACIONES: TMemo;
    fraEvento: TfraCtbTablas;
    lbParteDemandada: TLabel;
    edCQ_SINDICO: TEdit;
    lbDireccionSindico: TLabel;
    edCQ_DIRECCIONSIND: TEdit;
    lbLocalidad: TLabel;
    edCQ_LOCALIDADSIND: TEdit;
    lbTelefonos: TLabel;
    edCQ_TELEFONOSIND: TEdit;
    Label1: TLabel;
    fraJurisdiccion: TfraCodigoDescripcion;
    lblArchivosAsociados: TLabel;
    edtArchivosAsociados: TEdit;
    tbrVerArchivosAsociados: TToolBar;
    tbSeleccionArchivosAsociar: TToolButton;
    cdsArchivosAsociados: TClientDataSet;
    sdqArchivosAsociados: TSDQuery;
    ShortCutControl1: TShortCutControl;
    tbAsociarDoc: TToolButton;
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
    FORDEN, FIDEventoCYQ : Integer;
    procedure CargarArchivos;
    procedure RecargarArchivosAsociados(cdsArchivosAsociados: TClientDataSet);
  protected
    procedure RefreshData; override;
  public
    function GetExecute( iEVENTOParam: Integer ) : boolean;
  end;

var
  frmABMEventosCyQ: TfrmABMEventosCyQ;

Const
     TitEVENTOS_Alta           = 'Alta de Eventos';
     TitEVENTOS_Bajas          = 'Baja de Eventos' ;
     TitEVENTOS_Modificacion   = 'Modificacion de Eventos';

implementation

uses
  unPrincipal, CustomDlgs, General, AnsiSql, SqlFuncs, unDmPrincipal,
  unArchivosAsociados, unSesion, unRptEventosCyQ;

{$R *.DFM}

{ TfrmABMEventos }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosCyQ.FormCreate(Sender: TObject);
begin
  inherited;
  fraEvento.Clave   := 'EVCYQ';
  fraFuero.Clave    := 'FUERO';
  with fraJurisdiccion do
  begin
    TableName   := 'legales.lju_jurisdiccion';
    FieldID     := 'ju_id';
    FieldCodigo := 'ju_id';
    FieldDesc   := 'ju_descripcion';
    FieldBaja   := 'ju_fechabaja';
    ShowBajas := false;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Function que se usa para cargar los datos del EVENTO cuando es llamado desde otro form.
function TfrmABMEventosCyQ.GetExecute( iEVENTOParam: Integer): boolean;
Var sSql : String;
begin
  fraEmpresa.ShowBajas := true;
  fraEmpresa.UltContrato := true;

  sdqCargaDatos.Close;
  sSql := 'SELECT LCQ.CQ_NROORDEN, LCQ.CQ_CUIT, ' +
                 'LCQ.CQ_SINDICO, LCQ.CQ_DIRECCIONSIND, LCQ.CQ_LOCALIDADSIND, ' +
                 'LCQ.CQ_TELEFONOSIND, LCQ.CQ_JUZGADO, LCQ.CQ_SECRETARIA, LCQ.CQ_FUERO, LCQ.CQ_JURISDICCION, ' +
                 'LCQ.CQ_ABOGADO ' +
            'FROM LCE_EVENTOCYQ LCE, LCQ_CONCYQUIEBRA LCQ ' +
          'WHERE LCQ.CQ_NROORDEN = LCE.CE_NROEVENTO (+) ' +
            'AND LCQ.CQ_NROORDEN = :ID ';

  OpenQueryEx(sdqCargaDatos, [iEVENTOParam], sSql);
  fraAbogados.Codigo         := sdqCargaDatos.FieldByName( 'CQ_ABOGADO' ).asString;
  fraEmpresa.CUIT            := sdqCargaDatos.FieldByName('CQ_CUIT').asString;
  edCQ_DIRECCIONSIND.Text    := sdqCargaDatos.FieldByName( 'CQ_DIRECCIONSIND' ).asString;
  fraFuero.Codigo            := sdqCargaDatos.FieldByName('CQ_FUERO').asString;
  fraJurisdiccion.Codigo     := sdqCargaDatos.FieldByName('CQ_JURISDICCION').asString;
  edCQ_JUZGADO.Text          := sdqCargaDatos.FieldByName( 'CQ_JUZGADO').asString;
  edCQ_LOCALIDADSIND.Text    := sdqCargaDatos.FieldByName( 'CQ_LOCALIDADSIND' ).asString;
  edCQ_NROORDEN.Text         := sdqCargaDatos.FieldByName( 'CQ_NROORDEN' ).asString;
  edCQ_SECRETARIA.Text       := sdqCargaDatos.FieldByName( 'CQ_SECRETARIA' ).asString;
  edCQ_SINDICO.Text          := sdqCargaDatos.FieldByName( 'CQ_SINDICO' ).asString;
  edCQ_TELEFONOSIND.Text     := sdqCargaDatos.FieldByName( 'CQ_TELEFONOSIND' ).asString;

  sdqCargaDatos.Close;

  FORDEN := iEVENTOParam;

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Alta de un nuevo EVENTO.
procedure TfrmABMEventosCyQ.tbNuevoClick(Sender: TObject);
begin
    Try
       FIDEventoCYQ := -1;
       edCE_NROEVENTO.Value := -1;
       cdsArchivosAsociados.EmptyDataSet;

       edCE_FECHA.Clear;
       edCE_OBSERVACIONES.Clear;
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
end;
{----------------------------------------------------------------------------------------------------------------------}
// Modificacion de un EVENTO Existente.
procedure TfrmABMEventosCyQ.tbModificarClick(Sender: TObject);
begin
    if NOT sdqConsulta.IsEmpty then begin
        Try
           edCE_NROEVENTO.Text     := sdqConsulta.FieldByName( 'CE_NROEVENTO' ).asString;
           fraEvento.Codigo        := sdqConsulta.FieldByName( 'CE_CODEVENTO' ).asString;
           edCE_FECHA.Date         := sdqConsulta.FieldByName( 'CE_FECHA' ).asDateTime;
           edCE_OBSERVACIONES.Text := sdqConsulta.FieldByName( 'CE_OBSERVACIONES' ).asString;
           FIDEventoCYQ            := sdqConsulta.FieldByName( 'CE_ID' ).AsInteger;
           //
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
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Baja de un EVENTO Existente.
procedure TfrmABMEventosCyQ.tbEliminarClick(Sender: TObject);
begin
    if NOT sdqConsulta.IsEmpty then begin
        Try
           edCE_NROEVENTO.Text        := sdqConsulta.FieldByName( 'CE_NROEVENTO' ).asString;
           fraEvento.Codigo           := sdqConsulta.FieldByName( 'CE_CODEVENTO' ).asString;
           edCE_FECHA.Date            := sdqConsulta.FieldByName( 'CE_FECHA' ).asDateTime;
           edCE_OBSERVACIONES.Text    := sdqConsulta.FieldByName( 'CE_OBSERVACIONES' ).asString;
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
end;
{----------------------------------------------------------------------------------------------------------------------}
// Boton de Aceptar del FromPanel de Alta, Modificacion o Baja.
procedure TfrmABMEventosCyQ.btnAceptarClick(Sender: TObject);
Var SqlTrans : TSql;
    iNroEvento : Integer;
begin
    if ( frmPanelABMEventos.Caption = TitEVENTOS_Alta ) or ( frmPanelABMEventos.Caption = TitEVENTOS_Modificacion )then begin
       // control.
       if fraEvento.Value = '' then begin
          invalidMsg( fraEvento, 'El evento no puede quedar en blanco' );
          Abort;
       end;
       if edCE_FECHA.IsEmpty then begin
          InvalidMsg( edCE_FECHA, 'La fecha no puede quedar en blanco' );
          Abort;
       end;
       // Fin Control...
       SqlTrans := TSql.Create('LCE_EVENTOCYQ');
       try
         if frmPanelABMEventos.Caption = TitEVENTOS_Alta then begin
            FIDEventoCYQ := GetSecNextVal('ART.SEQ_LCE_ID');

            SqlTrans.PrimaryKey.Add('CE_ID', FIDEventoCYQ, False);
            iNroEvento := ValorSql('SELECT IIF_Compara( ''<='', NVL(Max( CE_NROEVENTO ), 0), 0, 1, NVL(Max( CE_NROEVENTO ), 0)+1 ) FROM LCE_EVENTOCYQ WHERE CE_NROORDEN = ' + edCQ_NROORDEN.Text );
            edCE_NROEVENTO.Value := iNroEvento;

            SqlTrans.Fields.Add( 'CE_NROORDEN', edCQ_NROORDEN.Text, False );
            SqlTrans.Fields.Add( 'CE_NROEVENTO', IntToStr(iNroEvento), False );
            SqlTrans.Fields.Add( 'CE_USUALTA', frmPrincipal.DBLogin.UserId );
            SqlTrans.Fields.Add( 'CE_FECHAALTA', 'Actualdate', False);
            SqlTrans.SqlType := stInsert;
         end else if frmPanelABMEventos.Caption = TitEVENTOS_Modificacion then begin
             SqlTrans.PrimaryKey.Add( 'CE_NROORDEN', edCQ_NROORDEN.Text, False );
             SqlTrans.PrimaryKey.Add( 'CE_NROEVENTO', sdqConsulta.FieldbyName( 'CE_NROEVENTO').asInteger );
             SqlTrans.Fields.Add( 'CE_USUMODIF', frmPrincipal.DBLogin.UserId );
             SqlTrans.Fields.Add( 'CE_FECHAMODIF', 'Actualdate', False);
             SqlTrans.SqlType := stUpdate;
         end;
         SqlTrans.Fields.Add( 'CE_CODEVENTO', fraEvento.Value );
         SqlTrans.Fields.Add( 'CE_FECHA', edCE_FECHA.Date );
         SqlTrans.Fields.Add( 'CE_OBSERVACIONES', edCE_OBSERVACIONES.Text );
         
         BeginTrans;
         Try
           EjecutarSQLST( SqlTrans.Sql );

           cdsArchivosAsociados.First;
           while not cdsArchivosAsociados.Eof do
           begin
             if cdsArchivosAsociados.FieldByName('STATE').AsString = 'I' then
             begin
               EjecutarSqlST('INSERT INTO art.lec_eventoarchivocyq  ' +
                             ' (ec_id, ec_descripcion, ec_patharchivo, ' +
                             '  ec_ideventocyq, ec_usualta, ec_fechaalta) ' +
                             'VALUES (' + SqlValue(cdsArchivosAsociados.FieldByName('ID').AsInteger) + ',  ' +
                                          SqlValue(cdsArchivosAsociados.FieldByName('DESCRIPCION').AsString) + ', ' +
                                          SqlValue(cdsArchivosAsociados.FieldByName('PATHARCHIVO').AsString) + ', ' +
                                          SqlValue(FIDEventoCYQ) + ',' +
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
        if msgBox( '¿Esta Ud. seguro que desea dar de baja este Evento?', MB_ICONINFORMATION + MB_YESNO, 'Atención' ) = ID_YES then begin
           SqlTrans := TSql.Create('LCE_EVENTOCYQ');
           iNroEvento := ValorSql('SELECT IIF_Compara( ''>'', NVL(Min( CE_NROEVENTO ), 0), 0, -1, NVL(Min( CE_NROEVENTO ), 0)-1 ) FROM LCE_EVENTOCYQ WHERE CE_NROORDEN = ' + edCQ_NROORDEN.Text );
           SqlTrans.PrimaryKey.Add( 'CE_NROORDEN', edCQ_NROORDEN.Text, False );
           SqlTrans.PrimaryKey.Add( 'CE_NROEVENTO', edCE_NROEVENTO.Text, False );
           SqlTrans.Fields.Add( 'CE_NROEVENTO', IntToStr(iNroEvento), False );
           SqlTrans.Fields.Add( 'CE_USUMODIF', frmPrincipal.DBLogin.UserId );
           SqlTrans.Fields.Add( 'CE_FECHAMODIF', 'Actualdate', False);
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
procedure TfrmABMEventosCyQ.tbImprimirClick(Sender: TObject);
var
  rptLstEventos: TfrmRptEventosCyQ;
  sqlAnt: String;
begin
  rptLstEventos := TfrmRptEventosCyQ.Create(Self);
  with rptLstEventos do
    try
      sqlAnt := sdqReporteDET.SQL.Text;
      sdqReporteCAB.ParamByName('nNroOrden').asInteger := edCQ_NROORDEN.Value;
      sdqReporteCAB.Open;
      sdqReporteDET.ParamByName('nNroOrden').asInteger := edCQ_NROORDEN.Value;
      sdqReporteDET.SQL.Text := sqlAnt + SortDialog.OrderBy;
      sdqReporteDET.Open;
      if sdqReporteDET.IsEmpty then
        MsgBox('No se encontraron datos para la selección actual')
      else
        rptEventosCyQ.PreviewModal;
    finally
      sdqReporteDET.SQL.Text := sqlAnt;
      Free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosCyQ.tbSeleccionArchivosAsociarClick(Sender: TObject);
begin
  with TfrmArchivosAsociados.Create(self) do
  try
    CargarArchivosAsociadosCYQ(StrToInt(edCQ_NROORDEN.Text), StrToInt(edCE_NROEVENTO.Text), cdsArchivosAsociados);
    RecargarArchivosAsociados(cdsArchivosAsociados);
    edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) +
                                 ' Archivos Asociados.';
  finally
    Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosCyQ.RecargarArchivosAsociados(cdsArchivosAsociados: TClientDataSet);
begin
  cdsArchivosAsociados.First;
  while not cdsArchivosAsociados.Eof do
  begin
    if cdsArchivosAsociados.FieldByName('STATE').AsString = 'D' then
    begin
      EjecutarSqlST('UPDATE art.lec_eventoarchivocyq ' +
                    '   SET ec_usubaja = ' + SqlValue(Sesion.LoginName) + ', ' +
                    '       ec_fechabaja = SYSDATE' +
                    ' WHERE ec_id = ' + SqlValue(cdsArchivosAsociados.FieldByName('ID').AsInteger));

      cdsArchivosAsociados.Delete;
    end
    else cdsArchivosAsociados.Next;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosCyQ.CargarArchivos;
var
 i : integer;
begin
  try
    sdqArchivosAsociados.ParamByName('IdEventoCYQ').AsInteger := FIDEventoCYQ;
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
procedure TfrmABMEventosCyQ.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT CE_NROEVENTO, TB_DESCRIPCION, CE_FECHA, ' +
                 'CE_OBSERVACIONES, CE_CODEVENTO, CE_ID, ' +
                 'NVL((SELECT DISTINCT ''S'' FROM lec_eventoarchivocyq '+
                 'WHERE ec_ideventocyq = ce_id AND ec_fechabaja IS NULL), ''N'') tieneadjunto '+
            'FROM CTB_TABLAS, LCE_EVENTOCYQ ' +
           'WHERE TB_CODIGO = CE_CODEVENTO ' +
             'AND TB_CLAVE = ''EVCYQ'' ' +
             'AND CE_NROORDEN = :CQ_NROORDENPARAM ' +
             'AND CE_NROEVENTO > 0 ';
  sdqConsulta.ParamByName('CQ_NROORDENPARAM').asInteger := FORDEN;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosCyQ.FSFormActivate(Sender: TObject);
begin
  RefreshData;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMEventosCyQ.tbAsociarDocClick(Sender: TObject);
begin
  with TfrmArchivosAsociados.Create(self) do
  try
    CargarDirectoArchivosAsociadosCYQ(StrToInt(edCQ_NROORDEN.Text), StrToInt(edCE_NROEVENTO.Text), cdsArchivosAsociados);
    RecargarArchivosAsociados(cdsArchivosAsociados);
    edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) +
                                 ' Archivos Asociados.';
  finally
    Free;
  end;
end;

end.



