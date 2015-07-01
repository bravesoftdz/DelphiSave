unit unPedidoInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ImgList, Grids, DBGrids, RXDBCtrl, Db, SDEngine,
  StdCtrls, Mask, ToolEdit, ArtComboBox, ExtCtrls, LookupDialog, Placemnt, CustomDlgs,
  General, RxRichEd, unAutAprob, cuit, strFuncs, ShortCutControl, Menus,
  FormPanel, DBCtrls, ArtDBGrid, unfraPrestador, unFraEmpresa, Buttons, SortDlg,
  ClipBrd, RxPlacemnt;

type
  TfrmPedidoInfo = class(TForm)
    dbgDocumentos: TARTDBGrid;
    CoolBar1: TCoolBar;
    ToolBar: TToolBar;
    tbNuevo: TToolButton;
    tbModificar: TToolButton;
    tbBorrar: TToolButton;
    ToolButton4: TToolButton;
    tbSalir: TToolButton;
    ToolButton3: TToolButton;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    tbRefrescar: TToolButton;
    FormPlacement: TFormPlacement;
    sdqConsultaDOCUMENTO: TStringField;
    sdqConsultaDO_FECHAALTA: TDateTimeField;
    sdqConsultaDO_FECHAIMPRESION: TDateTimeField;
    sdqConsultaDO_FECHARECEPCION: TDateTimeField;
    sdqConsultaDO_OBSERVACIONES: TStringField;
    sdqConsultaDO_FIRMA: TStringField;
    sdqConsultaDO_DOCUMENTO: TStringField;
    sdqDatos: TSDQuery;
    sdqDatosEX_SINIESTRO: TFloatField;
    sdqDatosNOMBRE: TStringField;
    sdqDatosEX_CUIL: TStringField;
    sdqDatosEX_FECHAACCIDENTE: TDateTimeField;
    sdqDatosCA_DESCRIPCION: TStringField;
    sdqDatosCA_DOMICILIO: TStringField;
    sdqDatosCA_LOCALIDAD: TStringField;
    sdqDatosCA_CODPOSTAL: TStringField;
    ShortCutControl: TShortCutControl;
    sdqDatosCA_TELEFONO: TStringField;
    ppmImprimir: TPopupMenu;
    mnuImpPendientes: TMenuItem;
    mnuImpTodos: TMenuItem;
    sdqDatosCA_FAX: TStringField;
    sdqDatosPR_DESCRIPCION: TStringField;
    sdqDatosAU_FECHASOLI: TDateTimeField;
    sdqDatosDO_OBSERVACIONES: TStringField;
    sdqConsultaDESTINATARIO: TStringField;
    sdqDatosPROVPREST: TStringField;
    sdqDatosMP_CALLE: TStringField;
    sdqDatosMP_NUMERO: TStringField;
    sdqDatosMP_PISO: TStringField;
    sdqDatosMP_DEPARTAMENTO: TStringField;
    sdqDatosMP_CPOSTAL: TStringField;
    sdqDatosMP_LOCALIDAD: TStringField;
    sdqDatosPROVEMP: TStringField;
    sdqDatosMP_TELEFONOS: TStringField;
    sdqDatosMP_FAX: TStringField;
    sdqDatosMP_NOMBRE: TStringField;
    sdqConsultaDO_NUMERO: TFloatField;
    sdqConsultaSINIESTRO: TStringField;
    sdqConsultaDO_DESTINATARIO: TStringField;
    sdqDatosDO_DESTINATARIO: TStringField;
    sdqDatosDO_FECHAIMPRESION: TDateTimeField;
    sdqDatosDO_FECHARECEPCION: TDateTimeField;
    sdqConsultaDO_MODULO: TStringField;
    sdqDatosNUMERO: TFloatField;
    sdqConsultaDO_PRESTADOR: TFloatField;
    sdqEncabezados: TSDQuery;
    tbOrdenar: TToolButton;
    ToolButton2: TToolButton;
    SortDialog: TSortDialog;
    sdqConsultaMODULO: TStringField;
    sdqConsultaCA_DESCRIPCION: TStringField;
    sdqConsultaSE_NOMBRE: TStringField;
    sdqConsultaDO_FECHADESDE: TDateTimeField;
    sdqConsultaDO_FECHAHASTA: TDateTimeField;
    sdqConsultaCA_DIRELECTRONICA: TStringField;
    sdqConsultaDO_FECHA_ENVMAIL: TDateTimeField;
    procedure tbSalirClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbBorrarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mnuImpPendientesClick(Sender: TObject);
    procedure mnuImpTodosClick(Sender: TObject);
    procedure dbgDocumentosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbOrdenarClick(Sender: TObject);
  private
    Siniestro, Orden, Recaida, Numero, Volante, NroParte, idPrestador :  Integer;
    Modulo, Estado :Char;
    procedure SetEstado(sEstado : Char);
    procedure Imprimir(Tipo:String;Codigo:String);
    procedure EjecutarConsultaSdqDatos(Numero:Integer);
    procedure MakeHeader(RxRichEdit: TRxRichEdit; Codigo: String);
    function  ValidarImpresion(Destinatario,Tipo,Prestador:String):boolean;
    function  ValidarDocumento(Sini,Ord,Rec:Integer;CodDocumento:String):boolean;
    procedure Do_generarNuevoParteAdmin(sDescDocumento:string; iPrest: integer);  // TK 19791
  public
    function  ShowForm(pSiniestro, pOrden, pRecaida, pNumero : Integer; pModulo, pEstado : Char; pVolante,pNroParte: integer; iIdPrestador:integer = 0) : Char;
    procedure VerificarEstado;
    procedure ArmarConsulta;
  end;

var
  frmPedidoInfo: TfrmPedidoInfo;

implementation

uses
  unRTF, unDmPrincipal, UnDocumentos, UnFirmantes, unSesion, AnsiSql,
  unComunes, unRedPres;

{$R *.DFM}

procedure TfrmPedidoInfo.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidoInfo.tbNuevoClick(Sender: TObject);
var
  frmDocumentos: TfrmDocumentos;
  Sql: String;
  bOpcionPrestador: boolean;
  identPrestador: integer;
begin
  frmDocumentos := TfrmDocumentos.Create(Self);

  with frmDocumentos do
  begin
    Sql :=
      'SELECT TD_CODIGO, TD_DESCRIPCION, TD_TIENEFECHAS' +
       ' FROM ARCHIVO.RTD_TIPODOCUMENTO' +
      ' WHERE TD_SECTOR IN (''ARCHSIN'', ''MUTUAL'')' +
        ' AND NOT EXISTS (SELECT 1' +
                          ' FROM SDO_DOCUMUTUAL' +
                         ' WHERE DO_SINIESTRO = ' + SqlInt(Siniestro) +
                           ' AND DO_ORDEN =  ' + SqlInt(Orden) +
                           ' AND DO_RECAIDA = ' + SqlInt(Recaida) +
                           ' AND DO_NUMERO = ' + SqlInt(Numero) +
                           ' AND DO_MODULO = ''' + Modulo + '''' +
                           ' AND DO_DOCUMENTO = TD_CODIGO' +
                           ' AND NVL(TD_TIENEFECHAS, ''N'') <> ''S'')' +
        ' AND TD_FECHABAJA IS NULL ' +
   ' ORDER BY TD_CODIGO ';       // TK 23175
    OpenQuery(sdqDocumentos, Sql);

    if sdqDocumentos.FieldByName('TD_TIENEFECHAS').AsString = 'S' then
    begin
      Fecdde.Enabled := True;
      Fechta.Enabled := True;
    end
    else
    begin
      Fecdde.Enabled := False;
      Fechta.Enabled := False;
    end;

    memoObservaciones.Text := '';
    edSiniestro.Text       := IntToStr(Siniestro);
    edOrden.Text           := IntToStr(Orden);
    edRecaida.Text         := IntToStr(Recaida);
    edNroAuto.Text         := IntToStr(Numero);
    lblModulo.Caption      := Modulo;

    if Modulo = 'L' then
    begin
      lblVolante.Caption := IntToStr(Volante);
      cmbDestinatario.Items.Clear;
      cmbDestinatario.Items.Text := 'Prestador';
      cmbDestinatario.Text := 'Prestador';
    end;

    cmbDestinatario.Text := 'Prestador';
    cmbDestinatarioChange(nil);

    if Modulo <> 'E' then
      SoloLecturaPrestador
  end;

  try
    if frmDocumentos.ShowModal = mrOk then
    begin
      try
        BeginTrans(True);
        if (Modulo = 'E') and (frmDocumentos.fraPrestador.IDPrestador = 0) and
           (frmDocumentos.cmbDestinatario.Text = 'Prestador') then
          MsgBox('No se pudieron guardar los cambios a causa del siguiente error:' + #13 + 'El prestador no puede ser nulo.', MB_ICONEXCLAMATION)
        else
        begin
          if ValidarDocumento(Siniestro, Orden, Recaida, frmDocumentos.sdqDocumentosTD_CODIGO.AsString) then
          begin
            if (Modulo = 'E') and (frmDocumentos.sdqDocumentos.FieldByName('TD_TIENEFECHAS').AsString = 'S') then
            begin
              Numero := incsql('select max(do_numero)' +
                                ' from SDO_DOCUMUTUAL' +
                               ' WHERE DO_SINIESTRO = ' + SqlInt(Siniestro) +
                                 ' AND DO_ORDEN =  ' + SqlInt(Orden)    +
                                 ' AND DO_RECAIDA = ' + SqlInt(Recaida) +
                                 ' AND DO_MODULO = ''E''');
            end;

            bOpcionPrestador := (frmDocumentos.cmbDestinatario.Text = 'Prestador');
            if bOpcionPrestador then
              identPrestador := frmDocumentos.fraPrestador.IDPrestador
            else
              identPrestador := idPrestador;

            Sql :=
              'INSERT INTO SDO_DOCUMUTUAL (DO_SINIESTRO, DO_ORDEN, DO_RECAIDA, DO_NUMERO, DO_MODULO, DO_DOCUMENTO,' +
                                         ' DO_FECHAALTA, DO_USUALTA, DO_OBSERVACIONES, DO_DESTINATARIO ' +
                     IIF(frmDocumentos.cmbDestinatario.Text = 'Prestador', ' , DO_PRESTADOR ', ', DO_CONTRATO' ) +
                     IIF((frmDocumentos.sdqDocumentos.FieldByName('TD_TIENEFECHAS').AsString = 'S'),' , DO_fechadesde, do_fechahasta) ',')' ) +
                   ' VALUES (' + SqlInt(Siniestro) + ', ' + SqlInt(Orden)   + ', ' +
                   SqlInt(Recaida) + ', ' + SqlInt(Numero)  + ', ' +
                   '''' + Modulo + ''', ''' +
                   frmDocumentos.sdqDocumentosTD_CODIGO.AsString +
                   ''', ActualDate, ''' + Sesion.LoginName + ''', ''' + frmDocumentos.MemoObservaciones.Text + ''', ' + 'IIF_CHAR('''+ frmDocumentos.cmbDestinatario.Text + ''', ''Prestador'', ''P'',''E'') ' +
                   IIF(bOpcionPrestador, ', ' + SqlInt(frmDocumentos.fraPrestador.IDPrestador), ', ''' + SqlInt(frmDocumentos.fraEmpresa.edContrato.Value) + '''') +
                   IIF((frmDocumentos.sdqDocumentos.FieldByName('TD_TIENEFECHAS').AsString = 'S'), (',' + frmDocumentos.fecdde.sqltext + ',' + frmDocumentos.fechta.sqltext) ,('')) +
                   ')';
            EjecutarSqlST(Sql);

            Do_generarNuevoParteAdmin(frmDocumentos.sdqDocumentosTD_DESCRIPCION.AsString, identPrestador); // TK 19791

            tbRefrescarClick(nil);
            if (Modulo = 'A') then
              SetEstado('T');
          end;
        end;
        CommitTrans(true);
      except
        on e:exception do
        begin
          Rollback(true);
          ErrorMsg(E, 'Error al intentar guardar (' + e.Message + ')');
        end;
      end;
    end;
  finally
    frmDocumentos.Free;
  end;
end;

{----[Valida que no se puedan cargar documentos repetidos (solo algunos) para el mismo S/O/R]------------------------------------}
function TfrmPedidoInfo.ValidarDocumento(Sini,Ord,Rec:Integer;CodDocumento:String): boolean;
begin
  Result := True;
  if AreIn(CodDocumento, ['001', 'DEN']) and ExisteSql('SELECT 1 FROM SDE_DENUNCIAS ' +
                                                      ' WHERE DE_SINIESTRO = ' + SqlInt(Sini) +
                                                        ' AND DE_ORDEN = ' + SqlInt(Ord) +
                                                        ' AND DE_RECAIDA = ' + SqlInt(Rec) ) then
  begin
    MsgBox('No se puede insertar una "Denuncia de Accidente(Empresa)", debido a que ya existe para este siniestro', MB_ICONEXCLAMATION);
    Result := False;
  end else if AreIn(CodDocumento, ['004', 'PMI']) and ExisteSql('SELECT 1 FROM SPI_PARTEINGRESO ' +
                                                                ' WHERE PI_SINIESTRO = ' + SqlInt(Sini) +
                                                                  ' AND PI_ORDEN = ' + SqlInt(Ord) +
                                                                  ' AND PI_RECAIDA = ' + SqlInt(Rec) ) then
  begin
       MsgBox('No se puede insertar un "Parte Médico de Ingreso", debido a que ya existe para este siniestro', MB_ICONEXCLAMATION);
       Result := False;
  end else if AreIn(CodDocumento, ['010', 'DEG']) and ExisteSql('SELECT 1 FROM SDG_DENUNCIASGRAVES ' +
                                                                ' WHERE DG_SINIESTRO = ' + SqlInt(Sini) +
                                                                  ' AND DG_ORDEN = ' + SqlInt(ORD) +
                                                                  ' AND DG_RECAIDA = ' + SqlInt(Rec) ) then
  begin
       MsgBox('No se puede insertar una "Denuncia SRT por Siniestro Grave", debido a que ya existe para este siniestro', MB_ICONEXCLAMATION);
       Result := False;
  end else if AreIn(CodDocumento, ['019', 'PME']) and ExisteSql('SELECT 1 FROM SPE_PARTEEGRESO ' +
                                                                ' WHERE PE_SINIESTRO = ' + SqlInt(Sini) +
                                                                  ' AND PE_ORDEN = ' + SqlInt(Ord) +
                                                                  ' AND PE_RECAIDA = ' + SqlInt(Rec) ) then
  begin
       MsgBox('No se puede insertar un "Parte Médico de Egreso - Alta Médica", debido a que ya existe para este siniestro', MB_ICONEXCLAMATION);
       Result := False;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.Close;
  sdqConsulta.Open;
  tbModificar.Enabled := (Not sdqConsulta.Eof);
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.tbModificarClick(Sender: TObject);
var tmpFecha    : TDate;
    tmpMinFecha : TDate;
    Sql         : String;
begin
  if TDate(sdqConsultaDO_FECHAIMPRESION.AsDateTime) = 0 then
  begin
     MessageDlg('No se puede recepcionar un documento no solicitado', mtWarning, [mbOK], 0);
     exit;
  end
  else if (sdqConsultaDO_NUMERO.AsInteger <> Numero) then
  begin
     MessageDlg('No se puede recepcionar un documento no correspondiente al Nro.de Autorización que se está tramitando', mtWarning, [mbOK], 0);
     exit;
  end
  else if AreIn(sdqConsultaDO_DOCUMENTO.AsString, ['001', '004', '010', '019', 'DEN', 'DEG', 'PME', 'PMI']) then
  begin
    MessageDlg('No se puede recepcionar documentos de:' + #13 + #13 +
               'Denuncia de Accidente (Empresa),' + #13 +
               'Parte Médico de Ingreso,' + #13 +
               'Denuncia S.R.T. por Siniestro Grave y' + #13 +
               'Parte Médico de Egreso - Alta Médica', mtWarning, [mbOK], 0);
    Exit;
  end else
    tmpMinFecha := sdqConsultaDO_FECHAIMPRESION.AsDateTime;

  tmpFecha := InputBoxDate('Ingrese la Fecha de Recepción', 'Fecha de Recepción del documento Seleccionado', sdqConsultaDO_FECHARECEPCION.AsDateTime, tmpMinFecha, Date );

  if tmpFecha <> 0 then
  begin
    Sql := 'UPDATE SDO_DOCUMUTUAL ' +
             ' SET DO_FECHARECEPCION = TO_DATE(''' + DateToStr(tmpFecha) + ''', ''DD/MM/YYYY'')' +
           ' WHERE DO_SINIESTRO = ' + SqlInt(Siniestro) +
             ' AND DO_ORDEN =  ' + SqlInt(Orden) +
             ' AND DO_RECAIDA = ' + SqlInt(Recaida) +
             ' AND DO_NUMERO = ' + sdqConsultaDO_NUMERO.Text +
             ' AND DO_DOCUMENTO = ''' + sdqConsultaDO_DOCUMENTO.AsString + '''';
    EjecutarSql(Sql);
    tbRefrescarClick(Nil);
    VerificarEstado;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmPedidoInfo.ShowForm(pSiniestro, pOrden, pRecaida, pNumero : Integer; pModulo, pEstado : Char; pVolante,pNroParte: integer; iIdPrestador:integer = 0) : Char;
begin
   Siniestro  := pSiniestro;
   Orden      := pOrden;
   Recaida    := pRecaida;
   Numero     := pNumero;   // del Modulo "A": es NumAuto; en "E" es siempre 0.
   Modulo     := pModulo;    // ahora se puede ver de TODOS los modulos. by Lu 2/08/01
   Estado     := pEstado;
   Volante    := pVolante;   // se usa solo para el módulo "L" : NroVolante.
   NroParte   := pNroParte;  // se usa solo para el modulo "E" : NroParte.
   idPrestador := iIdPrestador;
   //-----------------------------------------------------------------//
   with sdqConsulta do
   begin
     Close;
     Sql.Text := ' SELECT DO_MODULO,INITCAP(TD_DESCRIPCION) DOCUMENTO, DO_FECHAALTA, DO_FECHAIMPRESION, ' +
                        ' IIF_CHAR(DO_MODULO,''E'', ''Evolutivo'', IIF_CHAR(DO_MODULO,''L'',''Liquidaciones'', ' +
                        ' IIF_CHAR(DO_MODULO,''A'',''Autorizaciones'', ''Siniestros'') ) ) Modulo, ' +
                        ' DO_FECHARECEPCION, DO_OBSERVACIONES, DO_FIRMA, DO_DESTINATARIO,DO_PRESTADOR, ' +
                        ' DO_DOCUMENTO, IIF_CHAR(DO_DESTINATARIO,''P'',''Prestador'',''Empresa'') DESTINATARIO, ' +
                        ' DO_SINIESTRO||'' - ''||DO_ORDEN||'' - ''||DO_RECAIDA SINIESTRO, DO_NUMERO, ' +
                        ' CA_DESCRIPCION, DO_USUALTA, SE_NOMBRE, DO_FECHADESDE, DO_FECHAHASTA, CA_DIRELECTRONICA, ' +
                        ' DO_FECHA_ENVMAIL ' +                        // TK 9927
                 ' FROM SDO_DOCUMUTUAL, ARCHIVO.RTD_TIPODOCUMENTO, CPR_PRESTADOR, USE_USUARIOS ' +
                 ' WHERE TD_SECTOR IN (''ARCHSIN'', ''MUTUAL'') ' +
                   ' AND DO_DOCUMENTO = TD_CODIGO ' +
                   ' AND DO_PRESTADOR = CA_IDENTIFICADOR(+) ' +
                   ' AND SE_USUARIO(+) = DO_USUALTA ' +
                   ' AND TD_FECHABAJA IS NULL ' +  // TK 23175
                   ' AND DO_SINIESTRO = ' + SqlInt(Siniestro) +
                   ' AND DO_ORDEN = ' + SqlInt(Orden) +
                   ' AND DO_RECAIDA = ' + SqlInt(Recaida);
     Open;
   end;
   ShowModal;
   sdqConsulta.Close;
   Result := Estado;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  tbModificar.Enabled := (sdqConsultaDO_FECHARECEPCION.AsDateTime = 0);
  tbBorrar.Enabled    := (sdqConsultaDO_FECHAIMPRESION.AsDateTime = 0);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.tbBorrarClick(Sender: TObject);
var
  Sql : String;
begin
   if sdqConsultaDO_FECHAIMPRESION.AsDateTime <> 0 then
      ShowMessage('Para poder eliminar un registro, este no debe tener fecha de impresión')
   else if MsgBox('¿Desea eliminar el Registro Seleccionado?',MB_ICONQUESTION + MB_YESNO) = IDYES then
   begin
      Sql := 'DELETE FROM sdo_documutual ' +
             ' WHERE do_siniestro = ' + SqlInt(Siniestro) +
               ' AND do_orden =  ' + SqlInt(Orden) +
               ' AND do_recaida = ' + SqlInt(Recaida) +
               ' AND do_numero = ' + sdqConsultaDO_NUMERO.Text +
               ' AND do_documento = ''' + sdqConsultaDO_DOCUMENTO.AsString + '''';
      EjecutarSql(Sql);
      tbRefrescarClick(Nil);
   end;
   VerificarEstado;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.Imprimir(Tipo: String; Codigo:String);
var
  frmRTF    : TfrmRTF; SqlResults:TStringList; frmFirmantes:TfrmFirmantes;
  Sql,Lugar,Destinatario,SqlWhere,SqlFrom,Prestador,SqlUp,FechaActual, SqlSet:String;
begin
   SqlWhere   := '';
   SqlFrom    := '';
   Prestador  := '';
   SqlUp      := '';
   SqlSet     := '';   // TK 9927
   SqlResults := nil;

   if ValidarImpresion(sdqConsultaDESTINATARIO.Text,Tipo,sdqConsultaDO_PRESTADOR.Text) then
   begin
     Lugar := ValorSql('Select IIF_CHAR(lg_localidad, ''CAPITAL FEDERAL'', ''Buenos Aires'', InitCap(lg_localidad)) ' +
                       ' FROM DLG_DELEGACIONES, USC_SECTORES ' +
                       ' WHERE SC_DELEGACION = LG_CODIGO ' +
                         ' AND SC_CODIGO = ''' + Sesion.Sector + ''' ');
     FechaActual := ValorSql('Select Actualdate from dual');
     FechaActual := DateFormat(StrToDate(FechaActual), 'd ''de'' MMMM ''de'' yyyy');
     frmRTF := TfrmRTF.Create ( Self );
     frmFirmantes       := TfrmFirmantes.Create(Self);
     frmFirmantes.Area  := AREA_APAU;
     try
       if frmFirmantes.ShowModal = mrOk then
       begin
         frmRTF.Caption := Caption;
         frmRTF.Correo := sdqConsultaCA_DIRELECTRONICA.Text;
         SqlResults := ValoresColSql('Select ex_cuil, NVL(ex_fecharecaida,ex_fechaaccidente) ex_fechaaccidente, tj_nombre From Sex_expedientes,ctj_trabajadores ' +
                                     'Where  ex_siniestro = ' +  SqlInt(Siniestro) +
                                       ' and ex_orden = ' + SqlInt(Orden)  +
                                       ' and ex_recaida = ' + SqlInt(Recaida) +
                                       ' and ex_cuil = tj_cuil ');
         with frmRTF.redTexto do
         begin
           MakeHeader( frmRTF.redTexto , Codigo);
           Paragraph.FirstIndent  := 300;
           Lines.Add ( Lugar + ', ' + FechaActual);
           Paragraph.FirstIndent := 1;
           Lines.Add ( #9 + 'Señores ');
           SelAttributes.Style := SelAttributes.Style + [fsBold];
           {---Dirección-------------------------------------------------------------------}
           with sdqEncabezados do
           begin
             Close;
             if (Modulo = 'A') then
             begin
                SqlFrom  := ' ,sau_autorizaciones ';
                SqlWhere := ' and ex_siniestro = au_siniestro ' +
                            ' and ex_recaida = au_recaida ' +
                            ' and ex_orden = au_orden ' +
                            ' and au_numauto = ' + SqlInt(Numero);
             end
             else if (Modulo = 'E') then
             begin
                SqlFrom  := ' ,spv_parteevolutivo A';                 // TK 11709 coloqué los alias porque con el pv_fechabaja se confunde con el de cpv_provincias
                SqlWhere := ' and ex_siniestro = A.pv_siniestro(+)' +
                            ' and ex_recaida = A.pv_recaida(+)' +
                            ' and ex_orden = A.pv_orden(+)' +
                            ' and A.pv_fechabaja(+) is null';
                if NroParte <> 0 then
                   SqlWhere := SqlWhere + ' and pv_nroparte = ' + SqlInt(NroParte);
             end
             else if (Modulo = 'L') then
             begin
                SqlFrom  := ' ,svo_volantes,siv_itemvolante ';
                SqlWhere := ' and vo_volante = iv_volante ' +
                            ' and ex_siniestro = iv_siniestro ' +
                            ' and ex_recaida = iv_recaida ' +
                            ' and ex_orden = iv_orden ' +
                            ' and vo_volante = ' + SqlInt(Volante);
             end;
             if (sdqConsultaDESTINATARIO.Text = 'Empresa') then
             begin

              { esto tiene que ir aca.....  }
               sql.text := 'SELECT em_nombre, dc_calle, dc_numero, dc_piso, dc_departamento, dc_cpostal, dc_localidad, ' +                // TK 15633
                                 ' pv_descripcion provemp, dc_telefonos, dc_fax, co_contrato, co_direlectronica, ex_tipo, ex_delegacion ' +    // cambio de dc_mail por co_direlectronica Eduardo Vila 25/03/2010
                            ' FROM art.sex_expedientes, aem_empresa, aco_contrato, adc_domiciliocontrato, art.cpv_provincias ' +
                             IIF(sdqConsultaDO_NUMERO.Text <> '0',SqlFrom, ' ') +
                           ' WHERE ex_contrato = co_contrato ' +
                             ' AND dc_contrato = co_contrato ' +
                             ' AND em_id = co_idempresa ' +
                             ' AND dc_tipo = ''L'' ' +
                             ' AND pv_codigo = dc_provincia ' +
                             ' AND ex_siniestro = ' +  SqlInt(Siniestro) +
                             ' AND ex_orden = ' + SqlInt(Orden) +
                             ' AND ex_recaida = ' + SqlInt(Recaida) + IIF(sdqConsultaDO_NUMERO.Text <> '0',SqlWhere, ' ');

             end else
                 {sql.text := 'Select ca_descripcion,ca_domicilio,ca_codpostal,ca_localidad,pv_descripcion PROVPREST, ca_codarea || '' '' || ca_telefono ca_telefono, ca_fax, ca_identificador '+
                             'From cpr_prestador,cpv_provincias ' +
                             'Where pv_codigo(+) = ca_provincia ' +
                              ' and ca_identificador = ' + sdqConsultaDO_PRESTADOR.Text;}
                 sql.text := 'Select ca_descripcion,ca_domicilio,ca_codpostal,ca_localidad,pv_descripcion PROVPREST, ca_codarea || '' '' || ca_telefono ca_telefono, ca_fax, ca_identificador, ex_tipo, ex_delegacion '+
                             'From cpr_prestador, cpv_provincias, sex_expedientes ' +
                             'Where pv_codigo(+) = ca_provincia ' +
                              ' and ca_identificador = ex_prestador ' +
                              ' AND ex_siniestro = ' +  SqlInt(Siniestro) +
                              ' AND ex_orden = ' + SqlInt(Orden) +
                              ' AND ex_recaida = ' + SqlInt(Recaida);

             Open;
           end;
           if (sdqConsultaDESTINATARIO.AsString = 'Prestador') then
           begin
             Destinatario := 'P';
             Prestador    := sdqConsultaDO_PRESTADOR.AsString;
             Lines.Add ( #9 + InitCap( sdqEncabezados.FieldByName('CA_DESCRIPCION').AsString ) + '  (' + sdqEncabezados.FieldByName('CA_IDENTIFICADOR').AsString + ')' );
             Lines.Add ( #9 + InitCap( sdqEncabezados.FieldByName('CA_DOMICILIO').AsString ));
             if sdqEncabezados.FieldByName('CA_CODPOSTAL').AsString <> '' then
                Lines.Add ( #9 + '(' + sdqEncabezados.FieldByName('CA_CODPOSTAL').AsString + ') ' + InitCap( sdqEncabezados.FieldByName('CA_LOCALIDAD').AsString ))
             else
                Lines.Add ( #9 + InitCap( sdqEncabezados.FieldByName('CA_LOCALIDAD').AsString ));
             Lines.Add ( #9 + InitCap( sdqEncabezados.FieldByName('PROVPREST').AsString ));
             Lines.Add ( #9 + 'Tel.: ' + sdqEncabezados.FieldByName('CA_TELEFONO').AsString );
             Lines.Add ( #9 + 'Fax Nº: ' + sdqEncabezados.FieldByName('CA_FAX').AsString );
           end
           else begin
             Destinatario := 'E';
             Lines.Add ( #9 + InitCap( sdqEncabezados.FieldByName('EM_NOMBRE').AsString) + '  (Contrato Nº: ' + sdqEncabezados.FieldByName('CO_CONTRATO').AsString + ')' );
             Lines.Add ( #9 + InitCap( sdqEncabezados.FieldByName('DC_CALLE').AsString) + ' ' + sdqEncabezados.FieldByName('DC_NUMERO').AsString + ' ' + sdqEncabezados.FieldByName('DC_PISO').AsString + ' ' +
                         sdqEncabezados.FieldByName('DC_DEPARTAMENTO').AsString );
             if sdqEncabezados.FieldByName('DC_CPOSTAL').AsString <> '' then
                Lines.Add ( #9 + '(' + sdqEncabezados.FieldByName('DC_CPOSTAL').AsString + ') ' + InitCap( sdqEncabezados.FieldByName('DC_LOCALIDAD').AsString ))
             else
                Lines.Add ( #9 + InitCap( sdqEncabezados.FieldByName('DC_LOCALIDAD').AsString ));
             Lines.Add ( #9 + InitCap( sdqEncabezados.FieldByName('PROVEMP').AsString ));
             Lines.Add ( #9 + 'Tel.: ' + sdqEncabezados.FieldByName('DC_TELEFONOS').AsString);
             Lines.Add ( #9 + 'Fax Nº: ' + sdqEncabezados.FieldByName('DC_FAX').AsString);
             frmRTF.Correo := sdqEncabezados.FieldByName('CO_DIRELECTRONICA').AsString;       // TK 7117   // se cambio dc_mail por co_direlectronica
           end;

           SelAttributes.Style := SelAttributes.Style - [fsBold];

           Lines.Add ( '');
        //DESDE ACA CAMBIA LA COSA.
        if (Destinatario='E') and (Sesion.Sector='PRESDIN') then
        begin
           Paragraph.FirstIndent  := 350;
           Lines.Add ( 'Ref.Damnificado: Documentación a remitir necesaria para liquidar la Incapacidad Laboral Temporaria');
           Lines.Add ( 'Siniestro Nº:' + IntToStr(Siniestro) );
           Lines.Add ( 'Accidentado: ' +  SqlResults[2]);
           Lines.Add ( 'Fecha del Accidente: ' + SqlResults[1] );

           Paragraph.FirstIndent  := 0;
           //-------------------------------------------------------------------
           Lines.Add ( '');
            Paragraph.LineSpacingRule := TLineSpacingRule(lsDouble);

           Lines.Add ( 'De nuestra mayor consideración:');
           Lines.Add ( #9 + 'Nos dirigimos a Uds. con el fin de informarles que con referencia a la documentación ' +
                       'presentada para liquidar la Prestación Dineraria, solicitamos nos remitan la siguiente documentación ' +
                       'complementaria.:');
           Paragraph.Numbering := nsBullet;
           sdqConsulta.First;
        end
        else begin
           Paragraph.FirstIndent  := 350;
           Lines.Add ( 'Ref.Damnificado: ' + SqlResults[2]);
           Lines.Add ( 'D.N.I.: ' + GetDNI( SqlResults[0] ));
           Lines.Add ( 'Fecha de Ocurrencia: ' + SqlResults[1] );
           Lines.Add ( 'Denuncia Nº:' + IntToStr(Siniestro) );
           Paragraph.FirstIndent  := 0;
           //-------------------------------------------------------------------
           Lines.Add ( '');
            Paragraph.LineSpacingRule := TLineSpacingRule(lsDouble);

           Lines.Add ( 'De nuestra consideración:');
           Lines.Add ( #9 + 'Cumplimos en dirigirnos a Uds. con relación al damnificado de la referencia, ' +
                       'para solicitar remitan la documentación que se indica a continuación, ' +
                       'a efectos de poder analizar este caso y expedirnos con relación al mismo.');

           Lines.Add ( 'Documentación Solicitada: ' );
           Paragraph.Numbering := nsBullet;
           sdqConsulta.First;
        end;

         if Tipo = 'PENDIENTES' then
         begin     { Imprimir Pendientes (osea solo los de Fecha Impresion Nula; Opcion Vieja.) by Lu. 27/03/2001  }
             Paragraph.Numbering := nsNone;
             repeat
                  if ((Destinatario = 'P') and (sdqConsultaDESTINATARIO.Text = 'Prestador') and (Prestador = sdqConsultaDO_PRESTADOR.Text)) or
                     ((Destinatario = 'E') and (sdqConsultaDESTINATARIO.Text = 'Empresa'))
                     and ( TDate(sdqConsultaDO_FECHAIMPRESION.AsDateTime) = 0 ) then begin
                             Paragraph.Numbering := nsBullet;

                             Lines.Add (#9 + sdqConsultaDOCUMENTO.AsString  + ' ' + iif(sdqConsulta.FieldByName('DO_FECHADESDE').IsNull,'',FormatDateTime('mmmm " de " yyyy',sdqConsulta.FieldByName ('DO_FECHADESDE').AsDateTime)   + ' a ' + FormatDateTime('mmmm " de " yyyy',sdqConsulta.FieldByName ('DO_FECHAHASTA').AsDateTime) )    );
                             if (sdqConsultaDO_MODULO.Text <> 'A') then begin         // para Parte Evol. y Liquidaciones
                                 Paragraph.Numbering   := nsNone;
                                 if (sdqConsultaDO_OBSERVACIONES.Text <> '') then
                                    Lines.Add (#9 + 'Observaciones: ' + sdqConsultaDO_OBSERVACIONES.Text);
                             end else begin                                           // para Autorizaciones
                                 EjecutarConsultaSdqDatos(sdqConsultaDO_NUMERO.AsInteger);
                                 Paragraph.Numbering := nsNone;
                                 if (sdqDatosPR_DESCRIPCION.Text <> '') then
                                    Lines.Add (#9 + 'En referencia a su pedido de ' + sdqDatosPR_DESCRIPCION.Text + ' solicitado el ' + sdqDatosAU_FECHASOLI.Text );
                             end;
                  end;
                  sdqConsulta.Next;
             until sdqConsulta.Eof;

         end else if Tipo = 'TODOS' then
         begin{ Imprimir Todos (todos: los de Fecha Impresion Nula y no Nula, pero los de Fecha de recepcion Nula si o si; Nueva opcion.) by Lu. 27/03/2001 }

             Paragraph.Numbering := nsNone;
             repeat
                  if ( ((Destinatario = 'P') and (sdqConsultaDESTINATARIO.Text = 'Prestador') and (Prestador = sdqConsultaDO_PRESTADOR.Text)) or
                     ((Destinatario = 'E') and (sdqConsultaDESTINATARIO.Text = 'Empresa')) )
                     and ( TDate(sdqConsultaDO_FECHARECEPCION.AsDateTime) = 0 ) then begin

                          Paragraph.Numbering   := nsBullet;
                          Lines.Add (#9 + sdqConsultaDOCUMENTO.AsString  + ' ' + iif(sdqConsulta.FieldByName('DO_FECHADESDE').IsNull,'',FormatDateTime('mmmm " de " yyyy',sdqConsulta.FieldByName ('DO_FECHADESDE').AsDateTime)   + ' a ' + FormatDateTime('mmmm " de " yyyy',sdqConsulta.FieldByName ('DO_FECHAHASTA').AsDateTime) )    );
                          if (sdqConsultaDO_MODULO.Text <> 'A') then begin           // para Parte Evol. y Liquidaciones
                              Paragraph.Numbering := nsNone;
                              if (sdqConsultaDO_OBSERVACIONES.Text <> '') then
                                  Lines.Add (#9 +'Observaciones: ' + sdqConsultaDO_OBSERVACIONES.Text);
                              Paragraph.Numbering := nsBullet;
                          end else begin                                              // para Autorizaciones
                              EjecutarConsultaSdqDatos(sdqConsultaDO_NUMERO.AsInteger);
                              Paragraph.Numbering   := nsNone;
                              if (sdqDatosPR_DESCRIPCION.Text <> '') then
                                  Lines.Add (#9 +'En referencia a su pedido de ' + sdqDatosPR_DESCRIPCION.Text + ' solicitado el ' + sdqDatosAU_FECHASOLI.Text );
                          end;
                  end;
                  sdqConsulta.Next;
             until sdqConsulta.Eof;
         end;

         Paragraph.FirstIndent := 0;
         Paragraph.Numbering   := nsNone;

         //Lines.Add ( '');
         Paragraph.LineSpacingRule := TLineSpacingRule(lsSingle);
         Lines.Add ( #9 + 'Quedamos a la espera de lo solicitado, saludandolos a Uds. Atentamente.');
         Lines.Add ( '');

         Lines.Add ( 'Adjuntar la presente nota encabezando el envio de la documentacion solicitada, ' +
                     'a fin de poder definir su pedido.- ');

         if (sdqEncabezados.FieldByName('ex_delegacion').AsString = '840') and (sdqEncabezados.FieldByName('ex_tipo').AsInteger = 3) then
         begin
           Lines.Add ( 'La información puede ser remitida por fax al sector Enfermedades Profesionales al Nro. 4338-4701 código 447 ' +
                       'o bien respondiendo dicho pedido al gestor que lo envió. ');
           Lines.Add ( 'Si esta información ya fue adelantada, reenviar esta nota al número indicado ' +
                       'colocando día, hora y nº de fax o casilla de correo. ');
           Lines.Add('');
         end;


         if (Destinatario = 'E') and (Sesion.Sector <> 'PRESDIN') then
         begin
           Lines.Add ('La información puede ser remitida por fax al sector Investigaciones al Nro. 4338-4701 código 456. ' +
                      'O bien, respondiendo dicho pedido al administrativo que lo envió.');       // TK 7117
           Lines.Add ('Si esta información ya fue adelantada, reenviar esta nota al número indicado, colocando día, hora y nº de fax o casilla de correo. Gracias.- ');
         end
         else if (Destinatario <> 'P') then
           Lines.Add ( 'La documentacion solicitada debera contener la leyenda "ES COPIA FIEL DEL ORIGINAL" y debera estar firmada por un responsable de la empresa.');
        //HASTA ACA CAMBIA LA COSA

         Paragraph.FirstIndent := 180;
         Paragraph.Alignment   := TParaAlignment(taCenter);
         Lines.Add ( '');
         Lines.Add ( '');
         Lines.Add ( '');
         Lines.Add ( '');
         Lines.Add ( '');
         Paragraph.LineSpacingRule := TLineSpacingRule(lsSingle);
         Lines.Add ( InitCap( frmFirmantes.sdqFirmasUSUARIO.AsString ) );
         Lines.Add ( ValorSqlEx('select se_mail from use_usuarios where se_usuario = :usu', [frmFirmantes.sdqFirmasfi_codusuario.AsString]) );
         Lines.Add ( InitCap( frmFirmantes.sdqFirmasCARACTER.AsString ) );
         Paragraph.FirstIndent  := 0;

       end;
       frmRTF.CloseOnPrint := True;
       if frmRTF.ShowModal = mrOk then
         Try
            if (Destinatario = 'P' ) then
               SqlUp := ' AND do_prestador = ' + Prestador
            else
               SqlUp := ' AND do_contrato = ' + sdqEncabezados.FieldByName('CO_CONTRATO').Text;

            if frmRTF.bEnvioMail then                       // TK 9927
            begin
              SqlSet   := ' do_fecha_envmail = ActualDate, ';
              SqlWhere := ' AND do_fecha_envmail IS NULL ';
            end
            else begin
              SqlSet   := ' do_fechaimpresion = ActualDate, ';
              SqlWhere := ' AND do_fechaimpresion IS NULL ';
            end;

            Sql := 'UPDATE sdo_documutual ' +
                     ' SET ' + SqlSet +
                         ' do_firma = ' + SqlValue(frmFirmantes.sdqFirmasCODFIRMA.AsString) +
                   ' WHERE do_siniestro = ' + SqlInt(Siniestro) +
                     ' AND do_orden =  ' + SqlInt(Orden) +
                     ' AND do_recaida = ' + SqlInt(Recaida) +
                      SqlWhere +
                     ' AND do_destinatario = ''' + Destinatario + ''' ' +  SqlUp;
            EjecutarSql(Sql);
            tbRefrescarClick(Nil);
         except
            on E: Exception do
               ErrorMsg( E, 'Error al Guardar los Cambios');
         end;

       end else begin  // del frmFirmantes.ShowModal = mrOk
             MsgBox('No se podrá imprimir la carta si no selecciona un firmante.');
       end;
     finally
       frmRTF.Free;
       SqlResults.Free;
     end;
   end; {del ValidarImpresion}
end;
{--------------------------------------------------------------------------------------------------------------------------------}
function TfrmPedidoInfo.ValidarImpresion(Destinatario,Tipo,Prestador: String): boolean;
var
  Sql, LeyendaPrestador: string;
begin
  LeyendaPrestador := '';
  Sql := 'SELECT  IIF_CHAR(DO_MODULO,''A'',''Autorización'', ''Liquidación'') MODULO, ' +
                         ' INITCAP(TD_DESCRIPCION) DOCUMENTO,DO_FECHAALTA,DO_FECHAIMPRESION, ' +
                         ' DO_FECHARECEPCION,DO_OBSERVACIONES,DO_FIRMA, DO_DESTINATARIO, ' +
                         ' DO_DOCUMENTO, IIF_CHAR(DO_DESTINATARIO,''P'',''Prestador'',''Empresa'') DESTINATARIO, ' +
                         ' DO_SINIESTRO||'' - ''||DO_ORDEN||'' - ''||DO_RECAIDA SINIESTRO, DO_NUMERO ' +
                  'FROM SDO_DOCUMUTUAL, ARCHIVO.RTD_TIPODOCUMENTO ' +
                  'WHERE TD_SECTOR IN (''ARCHSIN'', ''MUTUAL'') ' +
                   ' AND DO_DOCUMENTO = TD_CODIGO ' +
                   ' AND TD_FECHABAJA IS NULL ' +   // TK 23175
                   ' AND DO_SINIESTRO = ' + SqlInt(Siniestro) +
                   ' AND DO_ORDEN = ' + SqlInt(Orden) +
                   ' AND DO_RECAIDA = ' + SqlInt(Recaida) +
                   ' and Do_Destinatario = ''' + IIF(Destinatario='Prestador','P','E') + '''' +
                   IIF(Destinatario = 'Prestador', ' and DO_PRESTADOR = ' + Prestador, ' ') +
                   IIF(Tipo = 'TODOS', ' and Do_FechaRecepcion is Null ',' and Do_FechaImpresion is Null ');

  if (Destinatario = 'Prestador') then
      LeyendaPrestador := ValorSql('Select ca_identificador||'' - ''||ca_descripcion From cpr_prestador Where ca_identificador = ' + Prestador);

  if Not ExisteSql(sql) then
  begin
    Result := False;
    MsgBox ('No existen documentos (' + InitCap(Tipo) + ') con Destinatario ' + IIF(Destinatario='Prestador','Prestador (' + InitCap(LeyendaPrestador) + ')','Empresa') + ' a Imprimir', MB_ICONEXCLAMATION);
  end else  Result := True;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.mnuImpPendientesClick(Sender: TObject);
begin
  Imprimir('PENDIENTES','PDS');
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.mnuImpTodosClick(Sender: TObject);
begin
  Imprimir('TODOS','PDS');
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TFrmPedidoInfo.SetEstado(sEstado : Char);
begin
  EjecutarSql( ' UPDATE sau_autorizaciones ' +
                  ' SET au_estado = ''' + sEstado + ''' ' +
                ' WHERE au_siniestro = ' + SqlInt(Siniestro) +
                  ' AND au_orden = ' + SqlInt(Orden) +
                  ' AND au_recaida = ' + SqlInt(Recaida) +
                  ' AND au_numauto = ' + SqlInt(Numero) );
  Estado := sEstado;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.VerificarEstado;
Var Sql : String;
begin
  if (Modulo = 'A') then
     if (Estado = 'P') then
        SetEstado('T')
     else if (Estado = 'T') then
        if (SdqConsulta.RecordCount = 0) then
            SetEstado('P')
        else begin
           Sql := ' SELECT 1 FROM sdo_documutual ' +
                  ' WHERE do_siniestro = ' + SqlInt(Siniestro) +
                    ' AND do_orden =  ' + SqlInt(Orden) +
                    ' AND do_recaida = ' + SqlInt(Recaida) +
                    ' AND do_numero = ' + SqlInt(Numero) +
                    ' AND do_fecharecepcion IS NULL ';
            if not ExisteSql(Sql) then SetEstado('P');
        end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.ArmarConsulta;
var
  Sql : String;
begin
   if Modulo = 'A' then begin
     EjecutarConsultaSdqDatos(Numero);
   end else begin
      Sql := 'Select ex_siniestro, 0 numero, to_date(null) au_fechasoli, initcap(tj_nombre) nombre, ex_cuil, ' +
                   ' ex_fechaaccidente, ca_descripcion, do_destinatario, do_fechaimpresion, do_fecharecepcion,' +
                   ' ca_domicilio, ca_localidad, ca_codpostal, PREST.PV_DESCRIPCION PROVPREST, ca_codarea || '' '' || ca_telefono ca_telefono, ca_fax,do_observaciones, ' +
                   ' mp_calle, mp_numero, mp_piso, mp_departamento, mp_cpostal, mp_localidad, EMP.PV_DESCRIPCION PROVEMP, ' +
                   ' mp_telefonos, mp_fax, mp_nombre, '' '' pr_descripcion, mp_direlectronica, do_fecha_envmail ' +    // TK 9927
              ' from sex_expedientes, ctj_trabajadores,sdo_documutual,cmp_empresas,cpr_prestador, siv_itemvolante, svo_volantes, ' +
                   ' CPV_PROVINCIAS PREST, CPV_PROVINCIAS EMP ' +
              ' where ex_cuil = tj_cuil(+) ' +
               ' and iv_volante = vo_volante ' +
               ' and vo_prestador = ca_identificador (+) ' +
               ' and IV_SINIESTRO = ex_siniestro ' +
               ' and IV_ORDEN = ex_orden ' +
               ' and IV_RECAIDA = ex_recaida ' +
               ' and PREST.PV_CODIGO (+) = CA_PROVINCIA ' +
               ' and ex_SINIESTRO = do_siniestro ' +
               ' and ex_ORDEN = do_orden ' +
               ' and ex_RECAIDA = do_recaida ' +
               ' and ex_cuit = mp_cuit ' +
               ' and EMP.PV_CODIGO = MP_PROVINCIA ' +
               ' and IV_siniestro = ' + SqlInt(Siniestro) +
               ' and IV_orden = ' + SqlInt(Orden) +
               ' and IV_recaida = ' + SqlInt(Recaida);
               if Modulo = 'L' then
                Sql := Sql + ' and vo_volante = ' + SqlInt(Volante);

      if sdqDatos.SQL.Text <> Sql then
      begin
         sdqDatos.Close;
         sdqDatos.SQL.Text := Sql;
         sdqDatos.Open;
      end;
   end
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key = 27 then
    Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.dbgDocumentosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (sdqConsulta.FieldByName('DO_NUMERO').AsInteger <> Numero) then
     AFont.Color := clRed;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.EjecutarConsultaSdqDatos(Numero:Integer);
var SqlSelect, SqlFrom, SqlWhere, SqlWhere2:string;
begin
  SqlSelect := ' ';
  SqlFrom   := ' ';
  SqlWhere  := ' ';
  SqlWhere2 := ' ';

  if sdqConsultaDO_MODULO.Text = 'L' then
  begin
    SqlSelect := ' iv_numpago ';
    SqlFrom   := ',siv_itemvolante ';
    SqlWhere  := ' and au_siniestro = iv_siniestro ' +
                 ' and au_orden = iv_orden ' +
                 ' and au_recaida = iv_recaida ';
    SqlWhere2 := ' and iv_numpago = ' + SqlInt(Numero) + ' and ca_identificador = ' + sdqConsultaDO_PRESTADOR.text;
  end
  else begin
    SqlSelect := ' au_numauto ';
    SqlWhere2 := ' and au_numauto = ' + SqlInt(Numero);
  end;
  sdqDatos.Close;
  sdqDatos.Sql.Text := ' Select ex_siniestro, ' + SqlSelect + ' numero, initcap(tj_nombre) nombre, ex_cuil, ' +
                              ' ex_fechaaccidente, ca_descripcion, do_fechaimpresion, do_fecharecepcion, ' +
                              ' ca_domicilio, ca_localidad, ca_codpostal, PREST.PV_DESCRIPCION PROVPREST, ca_codarea || '' '' || ca_telefono ca_telefono, CA_FAX, ' +
                              ' pr_descripcion, au_fechasoli, do_observaciones, do_destinatario,  ' +
                              ' mp_nombre,mp_calle, mp_numero, mp_piso, mp_departamento, mp_cpostal, mp_localidad, EMP.PV_DESCRIPCION PROVEMP, ' +
                              ' mp_telefonos, mp_fax, se_nombre, do_fecha_envmail ' +        // TK 9927
                        ' From sex_expedientes, ctj_trabajadores, cpr_prestador, cmp_empresas,SAU_AUTORIZACIONES, CPV_PROVINCIAS PREST, ' +
                             ' CPV_PROVINCIAS EMP,  sdo_documutual, mpr_prestaciones, use_usuarios ' + SqlFrom +
                        ' Where ex_cuil=tj_cuil(+) ' +
                          ' and au_identifprestador = ca_identificador (+) ' +
                          ' and au_siniestro = ex_siniestro ' +
                          ' and au_orden = ex_orden ' +
                          ' and au_recaida = ex_recaida ' + SqlWhere +
                          ' and prest.pv_codigo(+) = ca_provincia ' +
                          ' and au_siniestro = do_siniestro ' +
                          ' and au_orden = do_orden ' +
                          ' and au_recaida = do_recaida ' +
                          ' and au_numauto = do_numero ' +
                          ' and pr_codigo = au_pressol ' +
                          ' and se_usuario = do_usualta ' +
                          ' and ex_cuit = mp_cuit ' +
                          ' and emp.pv_codigo = mp_provincia ' +
                          ' and au_siniestro = ' + SqlInt(Siniestro) +
                          ' and au_orden = ' + SqlInt(Orden) +
                          ' and au_recaida = ' + SqlInt(Recaida) + SqlWhere2;
  sdqDatos.Open;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.MakeHeader(RxRichEdit: TRxRichEdit; Codigo: String);
var
  SqlResults: TStringList;
  sSql: String;
  Bmp: TBitmap;
begin
  with RxRichEdit do
  begin
    Lines.Clear;
    Paragraph.Alignment := TParaAlignment(paLeftJustify);

    sSql :=
      'SELECT lg_logo,' +
            ' INITCAP(utiles.armar_domicilio(lg_calle, lg_numero, lg_piso, lg_departamento) || '' '' ||' +
            ' utiles.armar_localidad(lg_cpostal, '''', lg_localidad, lg_provincia)) DIRECCION,' +
            ' utiles.armar_telefono(lg_codareatelefono, null, lg_telefono) TELEFONO' +
       ' FROM dlg_delegaciones, usc_sectores' +
      ' WHERE sc_delegacion = lg_codigo' +
        ' AND sc_codigo = ''' + Sesion.Sector + '''';

    SqlResults := ValoresColSql(sSql);
    Bmp := TBitmap.Create;
    try
      Bmp.LoadFromResourceName(HInstance, IIF((SqlResults[0] = 'M'), 'LOGO_MUTUAL', 'LOGO_2009_BYN_CHICO'));
      Clipboard.Assign(Bmp);
    finally
      Bmp.Free;
    end;

    Paragraph.Alignment := TParaAlignment(paRightJustify);
    SelAttributes.Size  := 16;
    Lines.Add(Codigo);

    Paragraph.Alignment := TParaAlignment(paLeftJustify);
    PasteFromClipboard;

    SelAttributes.Style := SelAttributes.Style + [fsItalic];
    SelAttributes.Size  := 9;

    Lines.Add(SqlResults[1]);
    Lines.Add(SqlResults[2]);

    SelAttributes.Size := 10;
    SelAttributes.Style := SelAttributes.Style - [fsItalic];
    Lines.Add('');
    Lines.Add('');
    Paragraph.Alignment := TParaAlignment(paRightJustify);
    Paragraph.Alignment := TParaAlignment(paLeftJustify);
    SqlResults.Free;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidoInfo.Do_generarNuevoParteAdmin(sDescDocumento:string; iPrest:integer);       // TK 19791
var iNuevoParte: Integer;
begin
  iNuevoParte := ValorSqlEx('SELECT MAX(pv_nroparte)+1 ' +
                               ' FROM art.spv_parteevolutivo ' +
                              ' WHERE pv_siniestro = :Sin ' +
                                ' AND pv_orden = :Orden ' +
                                ' AND pv_recaida = :Reca', [Siniestro, Orden, Recaida]);

  InsertarParteEvolutivo(false, Siniestro, Orden, Recaida, iPrest,
                         iNuevoParte, 'A', DBDate, 0, 0, 0, '', 0, DBDate,
                         'Pedido de Información: Se solicita ' + sDescDocumento,
                         false, '', '', '', '', '', '', 1, '', '', 0, 0, 0, 0, '', '', 0,
                         '', '','','','','','', 0, 0, 0, 'S'); // OJO: esa última "S" es de pv_pedidoInfo = S
end;

end.
