{--------------------------------------------------------------
   Modulo de ABML de Concursos y Quiebras.
   Desde este modulo se administra: Eventos y Gastos
   Autor: EVila.
   Date: 24/04/2002

   Modificado:
   FFirenze 29/05/2003
--------------------------------------------------------------}
unit unABMConcursosQuiebras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Placemnt, artSeguridad, ComCtrls, ToolWin, Db, SDEngine, unFraCtbTablas,
  StdCtrls, IntEdit, CurrEdit, Mask, ToolEdit, DateComboBox, unFraEmpresa,
  unArtFrame, unFraCodigoDescripcion, unfraAbogadosLegales, ShortCutControl,
  unfraUsuarios, PeriodoPicker, unArtDbFrame, PatternEdit,
  unArtDBAwareFrame, unMoldeEnvioMail, unComunes, QueryToFile,
  ExportDialog, QueryPrint, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, RxPlacemnt, RxCurrEdit, RxToolEdit;

type
  TfrmABMConcursosQuiebras = class(TForm)
    Seguridad: TSeguridad;
    FormStorage1: TFormStorage;
    tbGestionDeuda: TToolBar;
    tbGuardar: TToolButton;
    rbNuevo: TToolButton;
    ToolButton1: TToolButton;
    tbLimpiar: TToolButton;
    tbBuscar: TToolButton;
    ToolButton2: TToolButton;
    tbEmpresa: TToolButton;
    tbEventos: TToolButton;
    tbAcuerdo: TToolButton;
    ToolButton3: TToolButton;
    tbImprimir: TToolButton;
    tbSalir: TToolButton;
    lbNroJuicio: TLabel;
    fraAbogados: TfraAbogadosLegales;
    lbAbogado: TLabel;
    fraEmpresa: TfraEmpresa;
    lbFuero: TLabel;
    fraFuero: TfraCtbTablas;
    lbJurisdiccion: TLabel;
    lbJuzgado: TLabel;
    edCQ_JUZGADO: TIntEdit;
    lbSecretaria: TLabel;
    edCQ_SECRETARIA: TIntEdit;
    gbFechas: TGroupBox;
    lbConcurso: TLabel;
    lbQuiebra: TLabel;
    edCQ_FECHACONCURSO: TDateComboBox;
    edCQ_FECHAQUIEBRA: TDateComboBox;
    gbImportes: TGroupBox;
    lbDemandado: TLabel;
    lbsentencia: TLabel;
    edCQ_DEUDANOMINAL: TCurrencyEdit;
    edCQ_DEUDATOTAL: TCurrencyEdit;
    lbParteDemandada: TLabel;
    edCQ_SINDICO: TEdit;
    ShortCutControl: TShortCutControl;
    lbDireccionSindico: TLabel;
    edCQ_DIRECCIONSIND: TEdit;
    edCQ_LOCALIDADSIND: TEdit;
    lbLocalidad: TLabel;
    lbTelefonos: TLabel;
    edCQ_TELEFONOSIND: TEdit;
    edCQ_MONTOPRIVILEGIO: TCurrencyEdit;
    edCQ_MONTOQUIROG: TCurrencyEdit;
    lbMontoprivilegio: TLabel;
    Label2: TLabel;
    edCQ_NROORDEN: TIntEdit;
    Label4: TLabel;
    fraEstado: TfraCtbTablas;
    Label5: TLabel;
    fraUsuario: TfraUsuario;
    OpenDialog1: TOpenDialog;
    Label6: TLabel;
    edCQ_FECHAASIGN: TDateComboBox;
    Label7: TLabel;
    Label8: TLabel;
    edCQ_FECHAVTOART32: TDateComboBox;
    edCQ_FECHAVTOART200: TDateComboBox;
    gbPeriodos: TGroupBox;
    lbUltPeriodoConcurso: TLabel;
    edCQ_ULTPERCONCURSO: TPeriodoPicker;
    lbUltPeriodoQuiebra: TLabel;
    edCQ_ULTPERQUIEBRA: TPeriodoPicker;
    lbLegajo: TLabel;
    edCQ_LEGAJO: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edFechaPresArt32: TDateComboBox;
    Label11: TLabel;
    edFechaPresArt200: TDateComboBox;
    Label1: TLabel;
    edCQ_FECHAVERIFICACION: TDateComboBox;
    DBGrid: TArtDBGrid;
    ToolBar: TToolBar;
    tbImprimirAcuerdos: TToolButton;
    tbExportarAcuerdos: TToolButton;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    QueryPrint: TQueryPrint;
    ExportDialog: TExportDialog;
    PrintDialog: TPrintDialog;
    tbGastosYHonorarios: TToolButton;
    fraJurisdiccion: TfraCodigoDescripcion;
    Label3: TLabel;
    edCQ_FECHAFINGESTION: TDateComboBox;
    tbVerImagenes: TToolButton;
    lblExpediente: TLabel;
    edCQ_NROEXPEDIENTE: TPatternEdit;
    Label12: TLabel;
    edCQ_ANIOEXPEDIENTE: TPatternEdit;
    procedure tbSalirClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEmpresaClick(Sender: TObject);
    procedure tbAcuerdoClick(Sender: TObject);
    procedure tbEventosClick(Sender: TObject);
    procedure OnEstadoChange(Sender: TObject);
    procedure OnEmpresaChange(Sender: TObject);
    procedure edCQ_FECHACONCURSOChange(Sender: TObject);
    procedure edCQ_FECHAQUIEBRAChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbExportarAcuerdosClick(Sender: TObject);
    procedure tbImprimirAcuerdosClick(Sender: TObject);
    procedure tbGastosYHonorariosClick(Sender: TObject);
    procedure tbVerImagenesClick(Sender: TObject);
  private
    FOldEstado : String;
    dCQ_FECHACONCURSO,
    dCQ_FECHAQUIEBRA: TDateTime;

    procedure EnviarMailAviso;
  public
    Function GetRecuperaDatos( iCQ_NROORDENParam : Integer ) :Boolean;
  end;

const
  LGQ_NAME = ' (Concursos y Quiebras)';

  LGQ_CONQUIE_ALTA  = 'Alta...'         + LGQ_NAME;
  LGQ_CONQUIE_MODIF = 'Modificación...' + LGQ_NAME;
  LGQ_CONQUIE_CONS  = 'Consulta...'     + LGQ_NAME;

implementation

uses unPrincipal, AnsiSql, unConsultaAdminstracionJuicio, General, unDmPrincipal,
     CustomDlgs, SqlFuncs, UnConsultaEmpresa, unABMEventosCyQ, unABMAcuerdo,
     StrFuncs, unArt, DBSql, unGastosYHonorarios, unFrmDetalleArchivo, unComunesArchivo,
     unConstantArchivo, unArchivo;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.FormCreate(Sender: TObject);
begin
  fraFuero.Clave          := 'FUERO';
  fraFuero.ExtraCondition := ' AND TB_ESPECIAL1 IS NOT NULL ';

  with fraJurisdiccion do
  begin
    TableName   := 'legales.lju_jurisdiccion';
    FieldID     := 'ju_id';
    FieldCodigo := 'ju_id';
    FieldDesc   := 'ju_descripcion';
    FieldBaja   := 'ju_fechabaja';
    Showbajas   := True;
  end;

  fraEstado.Clave         := 'ESTCQ';
  fraEstado.OnChange      := OnEstadoChange;
  fraEmpresa.OnChange     := OnEmpresaChange;
  fraEmpresa.ShowBajas    := true;
  fraEmpresa.UltContrato  := true;
  fraEmpresa.ExtraFields := ', EM_FECHACONCURSO, EM_FECHAQUIEBRA ';
  fraAbogados.Parte       := paPropia;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.tbGuardarClick(Sender: TObject);
var
  Sql   : TDBSql;
  bTodoOK     : Boolean;
  iNroOrden   : integer;
  sSql        : String;
  sAddresses  : String;
  sDireccionMail : String;
  sNumerosDeCarpeta : String;
begin
//Controles...
       if fraJurisdiccion.IsSelected then
         Verificar(fraJurisdiccion.IsBaja, fraJurisdiccion,'No puede ser una jurisdicción dada de baja.');

       bTodoOK := True;

       if Caption = LGQ_CONQUIE_MODIF then begin
         if edCQ_NROORDEN.Text = '' then begin
           InvalidMsg( edCQ_NROORDEN, 'El Número de orden no puede quedar en blanco' );
           Abort;
         end;
       end;

        // CUIT.
       if fraEmpresa.CUIT = '' then begin
         InvalidMsg( fraEmpresa, 'El CUIT no puede estar en blanco.');
         Abort;
       end;

       // Fecha de Consurso.
       if edCQ_FECHACONCURSO.IsEmpty and edCQ_FECHAQUIEBRA.IsEmpty then begin
         InvalidMsg( edCQ_FECHACONCURSO, 'Alguna de las 2 fechas (Concurso/Quiebra) deben tener un valor' );
         Abort;
       end;

       if (edCQ_FECHAVTOART32.Date <> 0) and (edCQ_FECHAVTOART32.Date < edCQ_FECHACONCURSO.Date) then begin
         InvalidMsg( edCQ_FECHAVTOART32, 'La fecha de Vencimiento del Art.32 no puede ser menor que la fecha de Concurso' );
         Abort;
       end;

       if (edCQ_FECHAVTOART200.Date <> 0) and (edCQ_FECHAVTOART200.Date < edCQ_FECHAQUIEBRA.Date) then begin
         InvalidMsg( edCQ_FECHAVTOART200, 'La fecha de Vencimiento del Art.200 no puede ser menor que la fecha de Quiebra' );
         Abort;
       end;

       if (edCQ_FECHAFINGESTION.Date <> 0) and (edCQ_FECHAFINGESTION.Date > DBDate()) then begin
         InvalidMsg( edCQ_FECHAFINGESTION, 'La fecha de Fin de Gestión no puede ser mayor que la fecha actual' );
         Abort;
       end;

       // Monto Homologado <= Deuda Verificada.
//WF:117
{       if (edCQ_MONTOHOMOLOG.Value > edCQ_DEUDAVERIFICADA.Value) then begin
          InvalidMsg(edCQ_MONTOHOMOLOG, 'El monto Homologado debe ser menor igual a la Deuda Verificada.' );
          Abort;
       end;
}
       // Estado.
       if fraEstado.edCodigo.Text = '' then begin
          InvalidMsg(fraEstado.edCodigo, 'El estado no puede quedar en blanco.' );
          Abort;
       end;
       // Autorizacion solo si el estado es 05.
       if (not fraUsuario.ReadOnly) and fraUsuario.IsEmpty then begin
         InvalidMsg(fraUsuario.edCodigo, 'El que autorizó el estado ''''Pasado a Pérdida'''' no puede quedar en blanco.' );
         Abort;
       end;

       // Repeticiones de empresa y fecha de concurso
       if fraEstado.Value <> '06' then
         begin
           sSql := 'SELECT 1 ' +
                     'FROM LCQ_CONCYQUIEBRA ' +
                    'WHERE CQ_ESTADO<>''06'' ' +    // 06: BAJA
                      'AND CQ_CUIT=' + SqlValue( fraEmpresa.CUIT ) + ' ' +
                      'AND CQ_FECHACONCURSO=' + SqlValue( edCQ_FECHACONCURSO.Date ) + ' ';
           if Caption = LGQ_CONQUIE_MODIF then
             sSql := sSql + 'AND CQ_NROORDEN<>' + SqlValue( edCQ_NROORDEN.Text );

           if ExisteSql( sSql ) then
             begin
               InvalidMsg( fraEmpresa.mskCUIT, 'Ya existe un registro para el CUIT y la Fecha de Concurso' );
               Abort;
             end;
         end;

       // Repeticiones de empresa y fecha de quiebra
       if fraEstado.Value <> '06' then
         begin
           sSql := 'SELECT 1 ' +
                     'FROM LCQ_CONCYQUIEBRA ' +
                    'WHERE CQ_ESTADO<>''06'' ' +    // 06: BAJA
                      'AND CQ_CUIT=' + SqlValue( fraEmpresa.CUIT ) + ' ' +
                      'AND CQ_FECHAQUIEBRA=' + SqlValue( edCQ_FECHAQUIEBRA.Date ) + ' ';
           if Caption = LGQ_CONQUIE_MODIF then
             sSql := sSql + 'AND CQ_NROORDEN<>' + SqlValue( edCQ_NROORDEN.Text );

           if ExisteSql( sSql ) then
             begin
               InvalidMsg( fraEmpresa.mskCUIT, 'Ya existe un registro para el CUIT y la Fecha de Quiebra' );
               Abort;
             end;
         end;
//Fin...

       if bTodoOK then begin
         Screen.Cursor := crHourGlass;
         Sql := TDBSql.Create('LCQ_CONCYQUIEBRA' );
         Try
           Sql.Fields.Add( 'CQ_ABOGADO',                 fraAbogados.Codigo );
           Sql.Fields.Add( 'CQ_CUIT',                    fraEmpresa.CUIT );

           Sql.Fields.Add( 'CQ_LEGAJO',                  edCQ_LEGAJO.Text );
           Sql.Fields.AddExtended( 'CQ_DEUDANOMINAL',    edCQ_DEUDANOMINAL.Value, ALL_DECIMALS, False );
           Sql.Fields.AddExtended( 'CQ_DEUDATOTAL',      edCQ_DEUDATOTAL.Value, ALL_DECIMALS, False );
           Sql.Fields.Add( 'CQ_DIRECCIONSIND',           edCQ_DIRECCIONSIND.Text );
           Sql.Fields.Add( 'CQ_FECHACONCURSO',           SqlDate( edCQ_FECHACONCURSO.Date ), False);
           Sql.Fields.Add( 'CQ_FECHAVERIFICACIONCREDITO',SqlDate( edCQ_FECHAVERIFICACION.Date), False);
           Sql.Fields.Add( 'CQ_FECHAQUIEBRA',            SqlDate( edCQ_FECHAQUIEBRA.Date ), False);
           Sql.Fields.Add( 'CQ_FECHAASIGN',              SqlDate( edCQ_FECHAASIGN.Date ), False);
           Sql.Fields.Add( 'CQ_FECHAVTOART32',           SqlDate( edCQ_FECHAVTOART32.Date ), False);
           Sql.Fields.Add( 'CQ_FECHAVTOART200',          SqlDate( edCQ_FECHAVTOART200.Date ), False);
           Sql.Fields.Add( 'CQ_FECHATOMACONCONCURSO',    SqlDate( edFechaPresArt32.Date ), False);
           Sql.Fields.Add( 'CQ_FECHATOMACONQUIEBRA',     SqlDate( edFechaPresArt200.Date ), False);
           Sql.Fields.Add( 'CQ_FECHAFINGESTION',         SqlDate( edCQ_FECHAFINGESTION.Date ), False);

           Sql.Fields.Add( 'CQ_ULTPERCONCURSO',          edCQ_ULTPERCONCURSO.Periodo.Valor );
           Sql.Fields.Add( 'CQ_ULTPERQUIEBRA',           edCQ_ULTPERQUIEBRA.Periodo.Valor );

           Sql.Fields.Add( 'CQ_FUERO',                   fraFuero.Value );
           Sql.Fields.Add( 'CQ_JURISDICCION',            fraJurisdiccion.Codigo );
           Sql.Fields.Add( 'CQ_JUZGADO',                 edCQ_JUZGADO.Text );
           Sql.Fields.Add( 'CQ_LOCALIDADSIND',           edCQ_LOCALIDADSIND.Text );

           Sql.Fields.AddExtended( 'CQ_MONTOPRIVILEGIO', edCQ_MONTOPRIVILEGIO.Value, ALL_DECIMALS, False );
           Sql.Fields.AddExtended( 'CQ_MONTOQUIROG',     edCQ_MONTOQUIROG.Value, ALL_DECIMALS, False );
           Sql.Fields.Add( 'CQ_SECRETARIA',              edCQ_SECRETARIA.Text );
           Sql.Fields.Add( 'CQ_SINDICO',                 edCQ_SINDICO.Text );
           Sql.Fields.Add( 'CQ_TELEFONOSIND',            edCQ_TELEFONOSIND.Text );
           Sql.Fields.Add( 'CQ_ESTADO',                  fraEstado.Value );
           Sql.Fields.Add( 'CQ_AUTORIZACION',            fraUsuario.edCodigo.Text );
           Sql.Fields.Add( 'CQ_NROEXPEDIENTE',           edCQ_NROEXPEDIENTE.Text );
           Sql.Fields.Add( 'CQ_ANIOEXPEDIENTE',          edCQ_ANIOEXPEDIENTE.Text );

           Try
             if Caption = LGQ_CONQUIE_ALTA then begin
                Sql.SqlType := stInsert;
                iNroOrden := ValorSql('SELECT SEQ_LCQ_NROORDEN.nextval FROM DUAL');
                Sql.Fields.Add( 'CQ_NROORDEN', IntToStr(iNroOrden), False );
                Sql.Fields.Add( 'CQ_USUALTA', frmPrincipal.DBLogin.UserId );
                Sql.Fields.Add( 'CQ_FECHAALTA', 'Actualdate', False);

                edCQ_NROORDEN.Value := iNroOrden;
             end else if Caption = LGQ_CONQUIE_MODIF then begin
                Sql.SqlType := stUpdate;
                Sql.PrimaryKey.Add( 'CQ_NROORDEN', edCQ_NROORDEN.Text );
                Sql.Fields.Add( 'CQ_USUMODIF', frmPrincipal.DBLogin.UserId );
                Sql.Fields.Add( 'CQ_FECHAMODIF', 'Actualdate', False );
             end;

             if (Caption = LGQ_CONQUIE_ALTA) or
                ((FOldEstado <> '01') and (fraEstado.Value = '01')) or
                ((FOldEstado <> '02') and (fraEstado.Value = '02')) or
//Pablo                ((FOldEstado = '01') and (fraEstado.Value = '02')) or
                (edCQ_FECHACONCURSO.Date <> dCQ_FECHACONCURSO) or
                (edCQ_FECHAQUIEBRA.Date <> dCQ_FECHAQUIEBRA) Then { By Fede }
               EnviarMailAviso;

             {---------------------------------------------------------------------------------------------------------}
             BeginTrans;
             Try

                //WF 4909
                if (Caption = LGQ_CONQUIE_ALTA) or
                   (edCQ_FECHACONCURSO.Date <> dCQ_FECHACONCURSO) or
                   (edCQ_FECHAQUIEBRA.Date <> dCQ_FECHAQUIEBRA) then
                begin
                  (* no se debe hacer esto, por wf 6508
                  if (edCQ_FECHACONCURSO.Date > edCQ_FECHAQUIEBRA.Date) then
                    EjecutarSqlST(' UPDATE LGD_GESTIONDEUDA SET GD_ESTADO = ''04''' +
                                  ' WHERE GD_CUIT = ' + SqlValue(fraEmpresa.CUIT) +
                                  '  AND GD_ESTADO NOT IN (' +  SqlValue('03') + SqlValue('02') + ',' + SqlValue('04') + ',' + SqlValue('05') + ')')
                  else
                    EjecutarSqlST(' UPDATE LGD_GESTIONDEUDA SET GD_ESTADO = ''05''' +
                                  ' WHERE GD_CUIT = ' + SqlValue(fraEmpresa.CUIT) +
                                  '  AND GD_ESTADO NOT IN (' +  SqlValue('03') + SqlValue('02') + ',' + SqlValue('04') + ',' + SqlValue('05') + ')');
                  *)

                  sAddresses := Get_DireccionesEnvioMail('AV_EMCON');
                  if sAddresses > '' then
                    begin
                      sSql := 'deuda.get_deudatotalconsolidada(' + SqlValue(fraEmpresa.Contrato) + ', null, null, ''S'')';

                      EnviarMailBD(sAddresses, 'Notificación de Concurso y Quiebra',[],
                      'La empresa CUIT: ' + fraEmpresa.mskCUIT.EditText + ' Razón Social: ' + fraEmpresa.cmbRSocial.Text +
                      ' Contrato: ' + fraEmpresa.edContrato.Text +
                      ' se encuentra en Concurso y Quiebra. La deuda total es de ' + Get_AjusteDecimales(ObtenerValor(sSql), '$') + '.' + CRLF +
                      'Debe notificar al estudio que debe cesar en la gestión de esa cuenta y remitir antecedentes a la empresa para su insinuación.',
                      nil, 0, tcDefault, false, false, 0);
                    end;
                end;

               Sql.ExecuteST;
               // Actualiza Empresa.

               Sql.Clear;
               Sql.TableName := 'AEM_EMPRESA';
               Sql.SqlType := stUpdate;
               Sql.PrimaryKey.Add('EM_CUIT', fraEmpresa.CUIT);

               if ((fraEmpresa.sdqDatos.FieldByName('EM_FECHACONCURSO').AsDateTime = 0) and
                    (edCQ_FECHACONCURSO.Date <> 0)) or
                  ((fraEmpresa.sdqDatos.FieldByName('EM_FECHAQUIEBRA').AsDateTime = 0) and
                    (edCQ_FECHAQUIEBRA.Date <> 0)) then
               begin
                 with GetQuery(
                   ' SELECT DISTINCT jt_numerocarpeta '+
                   '   FROM legales.ljt_juicioentramite, legales.lod_origendemanda, '+
                   '        legales.lsj_siniestrosjuicioentramite, '+
                   '        art.sex_expedientes '+
                   '  WHERE od_idjuicioentramite = jt_id '+
                   '    AND od_id = sj_idorigendemanda '+
                   '    AND sj_idsiniestro = ex_id '+
                   '    AND ex_cuit = '+ SqlValue(fraEmpresa.CUIT)+
                   '    AND jt_arecuperar = ''S'' ') do
                 try
                   sNumerosDeCarpeta := '';
                   while not Eof do
                   begin
                     if sNumerosDeCarpeta = '' then
                       sNumerosDeCarpeta := FieldByName('jt_numerocarpeta').AsString
                     else
                       sNumerosDeCarpeta := sNumerosDeCarpeta +', '+FieldByName('jt_numerocarpeta').AsString;
                     Next;
                   end;
                 finally
                  free
                 end;

                 if sNumerosDeCarpeta <> '' THEN
                 BEGIN
                   sDireccionMail := Get_DireccionesEnvioMail('LEGFCYQR');
                   if sDireccionMail <> '' then
                     EnviarMailBD(sDireccionMail, 'Notificación Juicio a recuperar  ',[],
                     'La empresa CUIT: ' + fraEmpresa.mskCUIT.EditText + ' Razón Social: ' + fraEmpresa.cmbRSocial.Text +
                     ' se encuentra en Concurso y Quiebra. Se encuentra en los Juicios Nro de Carpeta: ' + sNumerosDeCarpeta +'.' + CRLF,
                     nil, 0, tcDefault, false, false, 0);
                 end;
               end;
               Sql.Fields.Add('EM_FECHACONCURSO', SqlDate( edCQ_FECHACONCURSO.Date ), False);
               Sql.Fields.Add('EM_FECHAQUIEBRA', SqlDate( edCQ_FECHAQUIEBRA.Date ), False);
               Sql.Fields.Add('EM_ULTIMOMESCONCURSO', edCQ_ULTPERCONCURSO.Text);
               Sql.Fields.Add('EM_ULTIMOMESQUIEBRA', edCQ_ULTPERQUIEBRA.Text);
               Sql.ExecuteST;

               CommitTrans;
             except
               RollBack;
               raise;
             end;
             {---------------------------------------------------------------------------------------------------------}

             //.Si es un alta cambia a modificación.
             if Caption = LGQ_CONQUIE_ALTA then begin
                msgBox('El alta se realizó con exito', MB_ICONEXCLAMATION, 'Atención');
                tbSalirClick( self );
             end else
                 msgBox('La modificación se realizó con exito', MB_ICONEXCLAMATION, 'Atención');
                 tbSalirClick( self );
           Except
              on Error: Exception do ErrorMsg(Error);
           End;
         Finally
           Screen.Cursor := crDefault;
           Sql.Free;
         end;
       end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.tbLimpiarClick(Sender: TObject);
begin
  Caption := LGQ_CONQUIE_ALTA;
  edCQ_NROORDEN.Clear;
  fraEmpresa.CUIT := '';
  edCQ_LEGAJO.Clear;
  fraAbogados.Clear;
  edCQ_SINDICO.Clear;
  edCQ_DIRECCIONSIND.Clear;
  edCQ_LOCALIDADSIND.Clear;
  edCQ_TELEFONOSIND.Clear;
  fraFuero.Limpiar;
  edCQ_JUZGADO.Clear;
  edCQ_SECRETARIA.Clear;
  fraJurisdiccion.Clear;
  edCQ_FECHACONCURSO.Clear;
  edCQ_FECHAQUIEBRA.Clear;
  edCQ_FECHAASIGN.Clear;
  edCQ_FECHAVTOART32.Clear;
  edCQ_FECHAVTOART200.Clear;
  edCQ_FECHAVERIFICACION.Clear;
  edCQ_FECHAFINGESTION.Clear;
  edFechaPresArt32.Clear;
  edFechaPresArt200.Clear;
  edCQ_ULTPERCONCURSO.Clear;
  edCQ_ULTPERQUIEBRA.Clear;
  edCQ_DEUDANOMINAL.Clear;
  edCQ_DEUDATOTAL.Clear;
  edCQ_MONTOPRIVILEGIO.Clear;
  edCQ_MONTOQUIROG.Clear;
  edCQ_NROEXPEDIENTE.Clear;
  edCQ_ANIOEXPEDIENTE.Clear;
  fraEstado.Limpiar;
  fraUsuario.Limpiar;

  dCQ_FECHACONCURSO := 0;
  dCQ_FECHAQUIEBRA  := 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.tbEmpresaClick(Sender: TObject);
var
  frmConsultaEmpresa: TfrmConsultaEmpresa;
begin
  if fraEmpresa.CUIT <> '' then
  begin
    frmConsultaEmpresa  := TfrmConsultaEmpresa.Create( Self );
    Try
      frmConsultaEmpresa.GetExecute( fraEmpresa.CUIT );
    finally
      frmConsultaEmpresa.Free;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Administracion de Acuerdos.
procedure TfrmABMConcursosQuiebras.tbAcuerdoClick(Sender: TObject);
begin
  if not edCQ_NROORDEN.IsEmpty then
  begin
    frmABMAcuerdo := TfrmABMAcuerdo.Create( Self );
    try
      if(edCQ_FECHACONCURSO.Date > edCQ_FECHAQUIEBRA.Date) then
        frmABMAcuerdo.Concurso:= True
      else
        frmABMAcuerdo.Concurso:= False;
      frmABMAcuerdo.GetExecute( edCQ_NROORDEN.Value );
      OpenQuery(sdqConsulta);
    finally
      frmABMAcuerdo.Free;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Administracion de Eventos
procedure TfrmABMConcursosQuiebras.tbEventosClick(Sender: TObject);
begin
  if not edCQ_NROORDEN.IsEmpty then begin
    frmABMEventosCyQ := TfrmABMEventosCyQ.Create( Self );
    try
      frmABMEventosCyQ.GetExecute( edCQ_NROORDEN.Value );
      frmABMEventosCyQ.ShowModal;
    finally
      frmABMEventosCyQ.Free;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmABMConcursosQuiebras.GetRecuperaDatos( iCQ_NROORDENParam: Integer): Boolean;
var
  sSql : String;
  sdqCargaDatos : TSDQuery;
begin
  sSql := 'SELECT LCQ.CQ_NROORDEN, LCQ.CQ_CUIT, CMP.MP_NOMBRE, CMP.MP_NOMBRE, LCQ.CQ_DEUDANOMINAL, '+
                 'LCQ.CQ_DEUDATOTAL, ' +
                 'NVL(LCQ.CQ_FECHACONCURSO, MP_FECHACONCURSO) FECHACONCURSO, '+
                 'NVL(LCQ.CQ_FECHAQUIEBRA, MP_FECHAQUIEBRA) FECHAQUIEBRA, CQ_FECHAFINGESTION FECHAFINGESTION, ' +
                 'CQ_FECHAASIGN, CQ_FECHAVTOART32, CQ_FECHAVTOART200, CQ_FECHAVERIFICACIONCREDITO, ' +
                 'CQ_FECHATOMACONCONCURSO, CQ_FECHATOMACONQUIEBRA, ' +
                 'LCQ.CQ_MONTOPRIVILEGIO, LCQ.CQ_MONTOQUIROG, '+
                 'LCQ.CQ_SINDICO, LCQ.CQ_DIRECCIONSIND, LCQ.CQ_LOCALIDADSIND, '+
                 'LCQ.CQ_TELEFONOSIND, LCQ.CQ_JUZGADO, LCQ.CQ_SECRETARIA, LCQ.CQ_FUERO, '+
                 'FUE.TB_DESCRIPCION FUE_DESCRIPCION, LCQ.CQ_JURISDICCION, JUR.JU_DESCRIPCION JUR_DESCRIPCION, '+
                 'LCQ.CQ_ABOGADO, LBO.BO_NOMBRE, LCQ.CQ_MONTOHOMOLOG, '+
                 'LCQ.CQ_ESTADO, LCQ.CQ_AUTORIZACION, LCQ.CQ_ULTPERCONCURSO, LCQ.CQ_ULTPERQUIEBRA, ' +
                 'LCQ.CQ_LEGAJO, LCQ.CQ_NROEXPEDIENTE, LCQ.CQ_ANIOEXPEDIENTE ' +
            'FROM CTB_TABLAS FUE, LEGALES.LJU_JURISDICCION JUR, CMP_EMPRESAS CMP, ' +
                 'LEGALES.LBO_ABOGADO LBO, LCQ_CONCYQUIEBRA LCQ '+
         ' WHERE LCQ.CQ_FUERO = FUE.TB_CODIGO (+) '+
         '   AND TO_NUMBER(LCQ.CQ_JURISDICCION) = JUR.JU_ID (+) '+
         '   AND LCQ.CQ_CUIT = CMP.MP_CUIT '+
         '   AND LCQ.CQ_ABOGADO = LBO.BO_ID (+) '+
         '   AND FUE.TB_CLAVE (+) = ''FUERO'' '+
         '   AND LCQ.CQ_NROORDEN = :CQ_NROORDEN';

  sdqConsulta.ParamByName('ID').AsInteger := iCQ_NROORDENParam;
  OpenQuery(sdqConsulta);

  sdqCargaDatos := GetQueryEx(sSql, [iCQ_NROORDENParam]);
  Try
     fraAbogados.Codigo         := sdqCargaDatos.FieldByName( 'CQ_ABOGADO' ).asString;
     fraEmpresa.CUIT            := sdqCargaDatos.FieldByName( 'CQ_CUIT' ).asString;
     edCQ_LEGAJO.Text           := sdqCargaDatos.FieldByName( 'CQ_LEGAJO' ).asString;
     edCQ_DEUDANOMINAL.Value    := sdqCargaDatos.FieldByName( 'CQ_DEUDANOMINAL' ).asCurrency;
     edCQ_DEUDATOTAL.Value      := sdqCargaDatos.FieldByName( 'CQ_DEUDATOTAL' ).asCurrency;
     edCQ_DIRECCIONSIND.Text    := sdqCargaDatos.FieldByName( 'CQ_DIRECCIONSIND' ).asString;

     edCQ_FECHACONCURSO.Date    := sdqCargaDatos.FieldByName( 'FECHACONCURSO' ).asDateTime;
     dCQ_FECHACONCURSO          := sdqCargaDatos.FieldByName( 'FECHACONCURSO' ).asDateTime;

     edCQ_FECHAQUIEBRA.Date     := sdqCargaDatos.FieldByName( 'FECHAQUIEBRA' ).asDateTime;
     dCQ_FECHAQUIEBRA           := sdqCargaDatos.FieldByName( 'FECHAQUIEBRA' ).asDateTime;

     edCQ_FECHAFINGESTION.Date  := sdqCargaDatos.FieldByName( 'FECHAFINGESTION' ).asDateTime;
     edCQ_FECHAASIGN.Date       := sdqCargaDatos.FieldByName( 'CQ_FECHAASIGN' ).asDateTime;
     edCQ_FECHAVTOART32.Date    := sdqCargaDatos.FieldByName( 'CQ_FECHAVTOART32' ).asDateTime;
     edCQ_FECHAVTOART200.Date   := sdqCargaDatos.FieldByName( 'CQ_FECHAVTOART200' ).asDateTime;
     edCQ_FECHAVERIFICACION.Date:= sdqCargaDatos.FieldByName( 'CQ_FECHAVERIFICACIONCREDITO' ).asDateTime;
     edFechaPresArt32.Date      := sdqCargaDatos.FieldByName( 'CQ_FECHATOMACONCONCURSO' ).asDateTime;
     edFechaPresArt200.Date     := sdqCargaDatos.FieldByName( 'CQ_FECHATOMACONQUIEBRA' ).asDateTime;
     edCQ_ULTPERCONCURSO.Periodo.Valor := sdqCargaDatos.FieldByName( 'CQ_ULTPERCONCURSO' ).asString;
     edCQ_ULTPERQUIEBRA.Periodo.Valor  := sdqCargaDatos.FieldByName( 'CQ_ULTPERQUIEBRA' ).asString;

     fraFuero.Codigo            := sdqCargaDatos.FieldByName( 'CQ_FUERO' ).asString;
     fraJurisdiccion.Codigo     := sdqCargaDatos.FieldByName( 'CQ_JURISDICCION' ).asString;
     edCQ_JUZGADO.Text          := sdqCargaDatos.FieldByName( 'CQ_JUZGADO' ).asString;
     edCQ_LOCALIDADSIND.Text    := sdqCargaDatos.FieldByName( 'CQ_LOCALIDADSIND' ).asString;
     edCQ_MONTOPRIVILEGIO.Value := sdqCargaDatos.FieldByName( 'CQ_MONTOPRIVILEGIO' ).asCurrency;
     edCQ_MONTOQUIROG.Value     := sdqCargaDatos.FieldByName( 'CQ_MONTOQUIROG' ).asCurrency;
     edCQ_NROORDEN.Text         := sdqCargaDatos.FieldByName( 'CQ_NROORDEN' ).asString;
     edCQ_SECRETARIA.Text       := sdqCargaDatos.FieldByName( 'CQ_SECRETARIA' ).asString;
     edCQ_SINDICO.Text          := sdqCargaDatos.FieldByName( 'CQ_SINDICO' ).asString;
     edCQ_TELEFONOSIND.Text     := sdqCargaDatos.FieldByName( 'CQ_TELEFONOSIND' ).asString;
     edCQ_NROEXPEDIENTE.Text    := sdqCargaDatos.FieldByName( 'CQ_NROEXPEDIENTE' ).asString;
     edCQ_ANIOEXPEDIENTE.Text   := sdqCargaDatos.FieldByName( 'CQ_ANIOEXPEDIENTE' ).asString;

     fraUsuario.Cargar(         sdqCargaDatos.FieldByName( 'CQ_AUTORIZACION' ).asString );
     OnEstadoChange(nil);

     FOldEstado                 := sdqCargaDatos.FieldByName( 'CQ_ESTADO' ).asString;
     fraEstado.Codigo := FOldEstado;

     Result := True;
  finally
    sdqCargaDatos.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.EnviarMailAviso;
var
  sCodAddress, sToAddress, sBody: String;
begin
  if fraEstado.Value = '01' Then
    begin
      sCodAddress := 'DECYQ_COB';
      sBody       := 'Se ha cargado un Concurso y/o Quiebra';
    end
  else
    begin
      sCodAddress := 'DECYQ_LEG';
      sBody       := 'Se ha actualizado la Deuda';
    end;

  sToAddress := Get_DireccionesEnvioMail(sCodAddress);

  if sToAddress = '' Then
    raise Exception.Create( 'No se encontraron destinatarios para enviar el E-Mail' );

  sBody := sBody + CRLF + CRLF +
          'Número de Orden: ' + edCQ_NROORDEN.Text + CRLF +
          'CUIT: ' + fraEmpresa.CUIT + CRLF +
          'Razón Social: ' + fraEmpresa.RazonSocial + CRLF +
          'Contrato: ' + fraEmpresa.edContrato.Text + CRLF +
          'Deuda Total: ' + Get_AjusteDecimales(edCQ_DEUDATOTAL.Text, '$') + CRLF;

  EnviarMailBD(sToAddress, Caption, [], sBody, nil, 0, tcDefault, false, false, 0);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.OnEstadoChange(Sender: TObject);
Var iCantImpagas : Integer;
begin
  // Control de Pasado a Perdida...
  if fraEstado.edCodigo.Text = '05' then begin
     fraUsuario.ReadOnly             := False;
     fraUsuario.edCodigo.Color       := clWindow;
     fraUsuario.cmbDescripcion.Color := clWindow;
  end else begin
     fraUsuario.Limpiar;
     fraUsuario.ReadOnly             := True;
     fraUsuario.edCodigo.Color       := clInactiveCaption;
     fraUsuario.cmbDescripcion.Color := clInactiveCaption;
  end;
  // Control Si el Estado es Terminado toda las cuotas tienen que estar pagas.
  if fraEstado.edCodigo.Text = '05' then begin
     iCantImpagas := ValorSqlEx('SELECT NVL(COUNT(*), 0) FROM LCA_ACUERDOCYQ '+
                                 'WHERE CA_NROORDEN = :CA_NROORDEN ' +
                                   'AND CA_NROPAGO > 0 '+
                                   'AND CA_FECHAPAGO IS NULL ', [edCQ_NROORDEN.Value]);
     if iCantImpagas > 0 then begin
        fraEstado.Limpiar;
        InvalidMsg( fraEstado.edCodigo, 'No se puede asignar el estado terminado siendo que tienen cuotas impagas.' );
     end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.OnEmpresaChange(Sender: TObject);
begin
  if Caption = LGQ_CONQUIE_ALTA then
  begin
    if edCQ_FECHACONCURSO.Date = dCQ_FECHACONCURSO Then
    begin
      if fraEmpresa.IsEmpty Then
        edCQ_FECHACONCURSO.Clear
      else
        edCQ_FECHACONCURSO.Date := fraEmpresa.sdqDatos.FieldByName('EM_FECHACONCURSO').AsDateTime;

      dCQ_FECHACONCURSO := edCQ_FECHACONCURSO.Date;
    end;

    if edCQ_FECHAQUIEBRA.Date = dCQ_FECHAQUIEBRA Then
    begin
      if fraEmpresa.IsEmpty Then
        edCQ_FECHAQUIEBRA.Clear
      else
        edCQ_FECHAQUIEBRA.Date := fraEmpresa.sdqDatos.FieldByName('EM_FECHAQUIEBRA').AsDateTime;

      dCQ_FECHAQUIEBRA := edCQ_FECHAQUIEBRA.Date;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.edCQ_FECHACONCURSOChange(Sender: TObject);
begin
  if (trim(edCQ_FECHACONCURSO.Text) <> '') and (edCQ_FECHACONCURSO.IsValid) and (edCQ_FECHACONCURSO.Date >=  EncodeDate(1980, 1, 1)) then
  begin
    edCQ_ULTPERCONCURSO.Periodo.SetPeriodoFromDate(edCQ_FECHACONCURSO.Date);
    edCQ_ULTPERCONCURSO.Periodo.Previous;
  end
  else edCQ_ULTPERCONCURSO.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.edCQ_FECHAQUIEBRAChange(
  Sender: TObject);
begin
  if (trim(edCQ_FECHAQUIEBRA.Text) <> '') and (edCQ_FECHAQUIEBRA.IsValid) and (edCQ_FECHAQUIEBRA.Date >=  EncodeDate(1980, 1, 1)) then
  begin
    edCQ_ULTPERQUIEBRA.Periodo.SetPeriodoFromDate(edCQ_FECHAQUIEBRA.Date);
    edCQ_ULTPERQUIEBRA.Periodo.Previous;
  end
  else edCQ_ULTPERQUIEBRA.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.FormShow(Sender: TObject);
begin
    if (edCQ_ULTPERCONCURSO.Periodo.Valor <> iif(edCQ_FECHACONCURSO.Date <> 0, FormatDateTime('yyyymm', IncMonth(edCQ_FECHACONCURSO.Date, -1)), '')) then
        InvalidMsg(edCQ_FECHACONCURSO, 'La Fecha de concurso discrepa con respecto al período de concurso.' );

    if (edCQ_ULTPERQUIEBRA.Periodo.Valor <> iif(edCQ_FECHAQUIEBRA.Date <> 0, FormatDateTime('yyyymm', IncMonth(edCQ_FECHAQUIEBRA.Date, -1)), '')) then
        InvalidMsg(edCQ_FECHAQUIEBRA, 'La Fecha de quiebra discrepa con respecto al período de quiebra.' );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.tbExportarAcuerdosClick(Sender: TObject);
begin
  tbExportarAcuerdos.Enabled := False;
  try
    ExportDialog.Fields.Assign(DBGrid.Columns);
    ExportDialog.Execute;
  finally
    tbExportarAcuerdos.Enabled := True;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.tbImprimirAcuerdosClick(Sender: TObject);
begin
  tbImprimirAcuerdos.Enabled := False;
  try
     if PrintDialog.Execute then
     try
       QueryPrint.SetGridColumns(DBGrid, True, [baDetail, baHeader, baTotal, baSubTotal]);
       QueryPrint.Print;
     finally
       QueryPrint.Fields.Clear;
     end;
  finally
    tbImprimirAcuerdos.Enabled := True;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.tbGastosYHonorariosClick(Sender: TObject);
begin
  Verificar(edCQ_NROORDEN.IsEmpty, edCQ_NROORDEN, 'No hay ningún nro. de orden cargado');

  with TfrmGastosYHonorarios.Create(nil) do
    try
      IdConcQuiebra := edCQ_NROORDEN.Value;
      ShowModal;
    finally
      Free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMConcursosQuiebras.tbVerImagenesClick(Sender: TObject);
var
  RARId: TTableId;
  sClave: String;
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'Debe haber un contrato seleccionado.');

  sClave := GetClaveArmada(1, IntToStr(fraEmpresa.Contrato), '', '', '');
  Verificar(not VerificarClaveExiste(ID_CARPETA_AFILIAC, sClave, RARId), fraEmpresa, 'La carpeta no existe.');

  TFrmDetalleArchivo.MostrarDetalleArchivo(Self, RARId, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
end.


