unit unImportacionNominas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, Mask, General,
  unFrmMuestraError, ToolEdit, ComCtrls, DB, DBClient, unComunes,
  unRptNuevosTrabNominaActiva, unExportPDF, OleServer, Excel2000, RxToolEdit,
  RxPlacemnt;

type
  TfrmImportacionNominas = class(TfrmCustomForm)
    lbArchivoOrigen: TLabel;
    lbLogErrores: TLabel;
    cbTitulosErrores: TCheckBox;
    btnImportar: TButton;
    edOrigen: TFilenameEdit;
    edErrores: TFilenameEdit;
    btnCancelar: TButton;
    ProgressBar: TProgressBar;
    cdsRegistros: TClientDataSet;
    StatusBar: TStatusBar;
    cbRelevComplementario: TCheckBox;
    procedure btnImportarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edOrigenChange(Sender: TObject);
  private
    FCUIT : String;
    FIDEmpresa: Integer;
    FIDEstableci: Integer;
    FEstableci : Integer;
    FFechaRelev : TDate;
    LCID_1: LCID;
    FFechaRecepPrev : TDate;
    FFechaRecepCor  : TDate;
    FFechaImportacion : TDate;

    IdCabeceraNomina : Integer;
    procedure SubString(const S: String; Separator: Char; Sl: TStringList);
    function obtenerString(const S: String; Separator: Char; var StartPos, Anterior: Integer): String;
(*
    procedure ActualizarUltRelevamiento (cuit: String;
                                         nroestableci: integer;
                                         fecharelev: TDateTime;
                                         tiporelev: String);
*)                                         
  protected
//    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean);override;
  public
    { Public declarations }
  end;

var
  frmImportacionNominas: TfrmImportacionNominas;

implementation

uses
  unCustomConsulta, CustomDlgs, unDmPrincipal, StrFuncs, VCLExtra, SqlOracle,
  unSesion, SQLFuncs, unConsVisitasRealizadas, Cuit, ShellAPI,artFuncs,
  ArchFuncs, unMoldeEnvioMail, unRptTrabajadoresEnOtroEstab, DateTimeFuncs,
  unComunesFet, ComObj;

{$R *.dfm}

procedure TfrmImportacionNominas.btnImportarClick(Sender: TObject);
const
  enActivo = 1;
  enErroneo = 2;
  enComplementario = 3;
  enInactivo = 5;
var
  rptNuevosTrabNominaActiva : TrptNuevosTrabNominaActiva;
  rptTrabajadoresEnOtroEstab: TrptTrabajadoresEnOtroEstab;
  fechanacimiento : TDate;
  listReporteError, listString, listError, listErrorcheck, campos, cabecera : TStringList;
  variable, sSQL, riesgo, riesgoID, nombretrabajador, ultimoperiodo, sArchivoLOG, FechaCabeceraActiva: string;
  IDCabeceraActiva, EstadoNomina, i, j, guardados, erroneos: integer;
  error, error_esop, ExisteActivo,
  HayRepetidos,
  NuevosTrabajadores,
  ExisteActivoPrevio: boolean;
  format : TFormatSettings;
//  WorkBk : _WorkBook;
  F: file of Ansichar;
  Buf: array[1..100] of AnsiChar;
  NumRead: Integer;
  S: String;
  FRepetido,
  FArchivo,
  FAsunto,
  FBody,
  FListaMail: String;
  conSemestral : Boolean;
  bAgregaCabecera: Boolean;
  ExcelApplication: Variant;

  procedure HayError(ErrDescripcion: String);
  begin
    error := true;
    MsgBox(ErrDescripcion);
  end;

begin
  inherited;
  Verificar(not FileExists(edOrigen.FileName), edOrigen, 'El archivo de origen debe existir.');
  Verificar(IsEmptyString(edErrores.FileName), edErrores, 'Debe indicar un nombre para el archivo de errores.');
  Verificar(not DirectoryExists(ExtractFileDir(edErrores.FileName)), edErrores, 'El directorio de los errores debe ser válido.');

  EstadoNomina := 0;
  IDCabeceraActiva := 0;
  NuevosTrabajadores := false;
  HayRepetidos := false;

  try
    BeginTrans(True);
    cdsRegistros.Close;
    cdsRegistros.CreateDataSet;
    cdsRegistros.EmptyDataSet;
    format.DateSeparator := '/';
    format.ShortDateFormat := 'dd/mm/yyyy';
    guardados := 0;
    error := false;
    erroneos := 0;
    listReporteError := TStringList.Create;
    listString := TStringList.Create;
    cabecera := TStringList.Create;
    campos := TStringList.Create;
    listError := TStringList.Create;
    listErrorcheck := TStringList.Create;

    StatusBar.SimpleText := 'Abriendo Excel.';
    try
     // Open the Excel File
      ExcelApplication := CreateOleObject('Excel.Application');
      ExcelApplication.Visible := False;
      ExcelApplication.WorkBooks.Open(edOrigen.FileName);
      DeleteFile(TempPath+'Origen.csv');
      ExcelApplication.WorkBooks[1].SaveAs(TempPath + 'Origen.csv', 6);
      ExcelApplication.WorkBooks[1].Close(false);
    finally
      ExcelApplication.WorkBooks.Close;
      ExcelApplication.Quit;
      ExcelApplication := unAssigned;
    end;

(*
        WorkBk := ExcelApplication.Workbooks.Open(edOrigen.FileName, Null, Null,
                                                  Null, Null, Null,
                                                  Null, Null, Null,
                                                  Null, Null, Null, Null, LCID_1);
        DeleteFile(TempPath+'Origen.csv');
        WorkBk.SaveAs(TempPath+'Origen.csv',XlFileFormat(xlCSV),Null, Null, Null, Null,
                      xlNochange,Null, Null, Null, Null, LCID_1);
        //WorkBk.SaveAs('C:\Temp\Origen.csv',xlCSV,Null, Null, Null, Null,
        //                          xlNochange,Null, Null, Null, Null, LCID_1);
      except
        WorkBk.Close(True, edOrigen.FileName, EmptyParam, LCID_1);
        ExcelApplication.Quit;
        ExcelApplication.Disconnect;
      end;
    finally
      WorkBk.Close(false, edOrigen.FileName, EmptyParam, LCID_1);
      ExcelApplication.Quit;
      ExcelApplication.Disconnect;
    end;
*)
    S := '';
    AssignFile(F, TempPath+'Origen.csv');
    Reset(F);
    repeat
      BlockRead(F, Buf, SizeOf(Buf), NumRead);
      S := S  + copy(Buf, 1, NumRead);
    until (NumRead = 0);
    CloseFile(F);

    S := StringReplace(S, #$D#$A, #$1#$1, [rfReplaceAll]);
    S := StringReplace(S, #$A, ' ', [rfReplaceAll]);
    S := StringReplace(S, #$D, ' ', [rfReplaceAll]);
    S := StringReplace(S, #$1#$1, #13#10, [rfReplaceAll]);

    listString.Text := S;


    {with GetQuery('SELECT COBRANZA.Get_UltPeriodoDevengado(''D'') FROM DUAL') do
      try
        ultimoperiodo := Fields[0].AsString;
      finally
        Free;
      end;}

    ProgressBar.Max := listString.Count-3;
    ProgressBar.Position := 0;
    ProgressBar.Visible := True;
    StatusBar.SimpleText := 'Cargando Cabecera.';
    for i := 0 to 2 do
    begin
      cabecera.Clear;
      variable := StringReplace(listString.Strings[i],'"','',[rfReplaceAll]);
      SubString(variable,';',cabecera);

      if i = 0 then
      begin
        FCUIT := Cabecera.Strings[0];
        FFechaRecepPrev := StrToDateDef(Cabecera.Strings[1],0,format);
        if not (FFechaRecepPrev = 0) then
        begin
          if FFechaRecepPrev > DBDate then
            HayError('La fecha de recepción Preventor debe ser menor que hoy.')
        end
        else
          HayError('Fecha recepción Preventor errónea.')
      end
      else
        if i = 1 then
        begin
          FEstableci := StrToInt(Cabecera.Strings[0]);
          sSQL := (
                  ' SELECT 1, em_id, es_id '+
                  '   FROM afi.aco_contrato, afi.aem_empresa, afi.aes_establecimiento '+
                  '  WHERE co_contrato = es_contrato '+
                  '    AND em_id = co_idempresa '+
                  '    AND co_contrato = art.get_vultcontrato(em_cuit) '+
                  '    AND em_cuit = '+SqlValue(FCUIT) +
                  '    AND es_nroestableci = '+SqlValue(FEstableci));

          with GetQuery(sSQL) do
          try
            if not (Fields[0].AsString = '1') then
              HayError('El Cuit o el Establecimiento no Existe')
            else begin
              FIDEmpresa  := Fields[1].AsInteger;
              FIDEstableci:= Fields[2].AsInteger;
            end
          finally
            Free;
          end;

          FFechaRecepCor := StrToDateDef(Cabecera.Strings[1],0,format);
          if not (FFechaRecepCor = 0) then
          begin
            if FFechaRecepCor > DBDate then
              HayError('La fecha de recepción Coordinador debe ser menor que hoy.')
          end
          else
            HayError('Fecha recepción Coordinador errónea.')
        end
        else
          if i = 2 then
          begin
            FFechaRelev := StrToDateDef(Cabecera.Strings[0],0,format);
            if not (FFechaRelev = 0) then
            begin
              if FFechaRelev > DBDate then
                HayError('La fecha de relevamiento debe ser menor que hoy.');

              if not ExisteSql(
                ' SELECT 1 '+
                '   FROM afi.aco_contrato '+
                '  WHERE co_contrato = art.get_vultcontrato('+SqlValue(FCUIT)+')'+
                '    AND '+SqlValue(FFechaRelev)+' BETWEEN co_vigenciadesde AND co_vigenciahasta') then

                HayError('La fecha del relevamiento debe estar dentro de las vigencias del contrato.');

              sSQL := (
                      ' SELECT DISTINCT 1 '+
                      '   FROM art.PSR_SINRIESGO '+
                      '  WHERE sr_cuit = '+ SqlValue(FCUIT)+
                      '    AND sr_estableci = '+SqlValue(FEstableci) +
                      '    AND sr_fecha = '+ SqlDate(FFechaRelev));

              with GetQuery(sSQL) do
              try
                if (Fields[0].AsString = '1') then
                  HayError('Ya existe el reporte de sin expuestos para esa fecha.');
              finally
                Free;
              end;
            end
            else
              HayError('Fecha Relevamiento errónea.');

            FFechaImportacion := StrToDateDef(Cabecera.Strings[1],0,format);
            if not (FFechaImportacion = 0) then
            begin
              if FFechaImportacion > DBDate then
                HayError('La fecha de importación debe ser menor que hoy.');
            end
            else
              HayError('Fecha Importacion errónea.');
          end;
    end;

    if not error then
    begin
      if (FFechaRelev > FFechaRecepPrev) and not (FFechaRecepPrev = 0) then
      begin
          HayError('La Fecha de Relevamiento debe ser menor que la de Recepción Preventor.');
      end
      else if (FFechaRecepPrev > FFechaRecepCor) and not (FFechaRecepCor = 0) then
      begin
          HayError('La Fecha de Recepción Preventor debe ser menor que la de Recepción Coordinador.');
      end
      else if (FFechaRecepCor  > FFechaImportacion) and not (FFechaImportacion = 0) then
      begin
          HayError('La Fecha de Recepción Coordinador debe ser menor que la de Importación.');
      end
      else begin
        // Analizo si hay una nomina activa
        ExisteActivo := ExisteSqlEx('SELECT 1 ' +
                                    '  FROM hys.hcn_cabeceranomina ' +
                                    ' WHERE cn_idestado = 1 ' +
                                    '   AND cn_cuit = :pcuit ' +
                                    '   AND cn_estableci = :pestableci ',
                                    [FCUIT, FEstableci]);

        if cbRelevComplementario.Checked and (not ExisteActivo) then
          HayError('No existe una nómina Activa para que la presente sea definida como Complementaria.')
        else begin
          // Analizo si la nomina activa es anterior a la importada
          ExisteActivoPrevio := ExisteSqlEx('SELECT 1 ' +
                                            '  FROM hys.hcn_cabeceranomina ' +
                                            ' WHERE cn_idestado = 1 ' +
                                            '   AND cn_cuit = :pcuit ' +
                                            '   AND cn_estableci = :pestableci ' +
                                            '   AND cn_fecharelevamiento <= ' + SqlValue(FFechaRelev),
                                            [FCUIT, FEstableci]);

          if cbRelevComplementario.Checked and (not ExisteActivoPrevio) then
            HayError('La nómina Activa tiene fecha posterior a la presente.')
          else
            if ExisteSqlEx('SELECT 1 ' +
                           '  FROM afi.aem_empresa, hys.hal_asignacionlote ' +
                           ' WHERE em_cuit = :pcuit ' +
                           '   AND al_idcabrelevamientoactivo IS NULL ' +
                           '   AND al_idempresa = em_id ' +
                           '   AND al_nroestableci = :pestableci ' +
                           '   AND EXISTS ( ' +
                           '          SELECT 1 ' +
                           '            FROM psr_sinriesgo ' +
                           '           WHERE sr_cuit = em_cuit ' +
                           '             AND sr_estableci = al_nroestableci ' +
                           '             AND art.actualdate <= ADD_MONTHS (sr_fecha, 10)) ',
                           [FCUIT, FEstableci]) and
               (MsgBox('Existe un relevamiento "Sin Expuestos" activo. Desea procesar la nómina de todas formas?', MB_ICONQUESTION + MB_YESNO) <> mrYes) then
              HayError('Existe un relevamiento "Sin Expuestos" activo. Se ha solicitado que la nómina no sea procesada.')
        end
      end
    end;

    if not error then
    begin
      IdCabeceraNomina := ValorSqlInteger(
        ' SELECT cn_id ' +
        '   FROM hys.hcn_cabeceranomina ' +
        '  WHERE cn_cuit = ' + SqlValue(FCUIT) +
        '    AND cn_estableci = ' + SqlValue(FEstableci) +
        '    AND cn_fecharelevamiento = ' + SqlValue(FFechaRelev));
      if IdCabeceraNomina = 0 then
      begin
        IdCabeceraNomina := GetSecNextVal('HYS.SEQ_HCN_ID');
        bAgregaCabecera := true;
      end
      else
        bAgregaCabecera := false;
      ActualizarAsignacionLote(IdCabeceraNomina, FFechaRelev, FCUIT, FEstableci, bAgregaCabecera, FFechaRecepPrev, FFechaRecepCor, FFechaImportacion);

{
    if not error then
    begin
      IdCabeceraNomina := ValorSqlInteger(
        ' SELECT cn_id '+
        '   FROM hys.hcn_cabeceranomina '+
        '  WHERE cn_cuit = '+SqlValue(FCUIT)+
        '    AND cn_estableci = '+ SqlValue(FEstableci)+
        '    AND cn_fecharelevamiento = '+SqlValue(FFechaRelev));
        //'    AND CN_FECHARECEPCIONPREV = '+SqlValue(FFechaRecepPrev)+
        //'    AND CN_FECHARECEPCIONCOR = '+SqlValue(FFechaRecepCor)+
        //'    AND CN_FECHAIMPORTACION = '+SqlValue(FFechaImportacion));

      if IdCabeceraNomina = 0 then
      begin
        IdCabeceraNomina := GetSecNextVal('HYS.SEQ_HCN_ID');
        EstadoNomina := 0;

        // Defino el estado de la nómina
        if cbRelevComplementario.Checked then
        begin
          if ExisteActivoPrevio then
          begin
            EstadoNomina := enComplementario;

            // Como es complementaria deberé agregar los trabajadores faltantes
            // en la nómina activa
            IDCabeceraActiva := ValorSqlIntegerEx('SELECT cn_id ' +
                                                  '  FROM hys.hcn_cabeceranomina ' +
                                                  ' WHERE cn_idestado = 1 ' +
                                                  '   AND cn_cuit = :pcuit ' +
                                                  '   AND cn_estableci = :pestableci ',
                                                  [FCUIT, FEstableci]);
            FechaCabeceraActiva:= ValorSqlEx('SELECT cn_fecharelevamiento ' +
                                             '  FROM hys.hcn_cabeceranomina ' +
                                             ' WHERE cn_id = :pidcabecera',
                                             [IDCabeceraActiva]);
          end
        end
        else begin
          IDCabeceraActiva := IdCabeceraNomina;
          //Si existe una nomina en el mismo año queda como erroneo
          //salvo que esos relevamientos no se hayan utilizado en ningun lote
          //y no haya finalizado el ciclo de anual-semestral
          if (ExisteSqlEx('SELECT 1 ' +
                         '  FROM hys.hro_relevoperativo, hys.hcn_cabeceranomina ' +
                         ' WHERE cn_cuit = :pcuit ' +
                         '   AND cn_estableci = :pestableci ' +
                         '   AND ro_idcabeceranomina = cn_id ' +
                         '   AND to_char(cn_fecharelevamiento, ''YYYY'') = to_char(' + SqlValue(FFechaRelev) + ', ''YYYY'')',
                         [FCUIT, FEstableci]) or
             ExisteSqlEx('SELECT  1 ' +
                         '   FROM art.psr_sinriesgo ' +
                         '  WHERE sr_cuit = :cuit ' +
                         '    AND sr_estableci = :estableci ' +
                         '   AND to_char(sr_fecha, ''YYYY'') = to_char(' + SqlValue(FFechaRelev) + ', ''YYYY'')',
                         [FCUIT, FEstableci])

             ) and not ExisteSqlEx ('SELECT 1 ' +
                                    '  FROM hys.hal_asignacionlote ' +
                                    ' WHERE al_idempresa = :pidempresa ' +
                                    '  AND al_nroestableci = :pnroestableci ' +
                                    '  AND al_idultsubloteasignado IS NULL ' +
                                    '  AND al_tipoproxoperacion <> ''R'' ' +
                                    '  AND al_secuencia = 0', [FIDEmpresa, FEstableci]) then
             EstadoNomina := enErroneo
          else begin
            if not ExisteActivo then
            begin
(*
              //Si el relev llega 6 meses antes de lo previsto o en otro año calendario
              //se deja en estado inactivo
              if ExisteSqlEx ('SELECT 1 ' +
                              '  FROM hys.hal_asignacionlote ' +
                              ' WHERE al_idempresa = :pidempresa ' +
                              '   AND al_nroestableci = :pnroestableci ' +
                              '   AND  (al_fechaproxoperacion > add_months(' + SqlDate(FFechaRelev) + ', 6) ' +
                              '   OR to_char(al_fechaproxoperacion, ''YYYY'') <> to_char(' + SqlDate(FFechaRelev) + ', ''YYYY'') ) ' +
                              '   AND al_tipoproxoperacion = ''R''', [FIDEmpresa, FEstableci]) then
                EstadoNomina := enInactivo
              else
*)              
                EstadoNomina := enActivo;
            end
            else begin
              if ExisteActivoPrevio then
              begin
                IDCabeceraActiva := ValorSqlIntegerEx('SELECT cn_id ' +
                                                      '  FROM hys.hcn_cabeceranomina ' +
                                                      ' WHERE cn_idestado = 1 ' +
                                                      '   AND cn_cuit = :pcuit ' +
                                                      '   AND cn_estableci = :pestableci ',
                                                      [FCUIT, FEstableci]);
                // Verifico si la nómina activa tiene lote.
                // Si lo tiene, la nueva tendrá estado "Inactiva".
                // Si no, la activa pasará a "Terminada" y la nueva a "Activa"
                if ExisteSqlEx ('SELECT 1 ' +
                                '  FROM hys.hro_relevoperativo ' +
                                ' WHERE ro_idcabeceranomina = :pidcabeceraactiva',
                                [IDCabeceraActiva]) then
                  EstadoNomina := enInactivo
                else begin
(*

                  //Si el relev llega 6 meses antes de lo previsto o en otro año calendario
                  //se deja en estado inactivo
                  if ExisteSqlEx ('SELECT 1 ' +
                                  '  FROM hys.hal_asignacionlote ' +
                                  ' WHERE al_idempresa = :pidempresa ' +
                                  '   AND al_nroestableci = :pnroestableci ' +
                                  '   AND  (al_fechaproxoperacion > add_months(' + SqlDate(FFechaRelev) + ', 6) ' +
                                  '   OR to_char(al_fechaproxoperacion, ''YYYY'') <> to_char(' + SqlDate(FFechaRelev) + ', ''YYYY'') ) ' +
                                  '   AND al_tipoproxoperacion = ''R''', [FIDEmpresa, FEstableci]) then
                    EstadoNomina := enInactivo
                  else begin
*)                  
                    EstadoNomina := enActivo;

                    EjecutarSqlSTEx('UPDATE hys.hcn_cabeceranomina ' +
                                    '   SET cn_idestado = 4 ' +
                                    ' WHERE cn_id = :pidcabeceraactiva',
                                    [IDCabeceraActiva]);
                    IDCabeceraActiva := IdCabeceraNomina;
//                  end;
                end
              end
              else
                EstadoNomina := enErroneo;
            end;
          end;
        end;
        EjecutarSqlST(
          ' INSERT INTO hys.hcn_cabeceranomina '+
          '             (cn_id, cn_cuit, cn_estableci, cn_usualta, cn_fechaalta, '+
          '              cn_fecharelevamiento, cn_fecharecepcionprev, '+
          '              cn_fecharecepcioncor, cn_fechaimportacion, cn_idestado ' +
          '             ) '+
          '   VALUES (' + SqlValue(IdCabeceraNomina) + ', ' + SqlValue(FCUIT) + ', ' +
          SqlValue(FEstableci) + ', ' + SqlValue(Sesion.UserID) + ', SYSDATE, ' +
          SqlValue(FFechaRelev) + ', ' + SqlValue(FFechaRecepPrev) + ', ' + SqlValue(FFechaRecepCor) + ', ' +
          SqlValue(FFechaImportacion) + ', ' + SqlValue(EstadoNomina) + ')');

        case EstadoNomina of
          enErroneo: MsgBox('La nómina ingresada no se utilizará para los estudios por estar fuera de término.');
          enActivo : begin
            if ExisteSqlEx ('SELECT 1 ' +
                            '  FROM hys.hal_asignacionlote ' +
                            ' WHERE al_idempresa = :pidempresa ' +
                            '   AND al_nroestableci = :pnroestableci ',
                            [FIDEmpresa, FEstableci]) then
              EjecutarSqlSTEx('UPDATE hys.hal_asignacionlote ' +
                              '   SET al_idcabrelevamientoactivo = :idcabrelevamientoactivo, ' +
//                              '       al_idultsubloteasignado = NULL, ' +
//                              '       al_idultsubloteauditado = NULL, ' +
                                      //el decode se hace por si el relev cae antes de lo solicitado
//                              '       al_fechaproxoperacion = decode(al_tipoproxoperacion, ''R'', al_fechaproxoperacion, art.actualdate), ' +
//                              '       al_tipoproxoperacion = ''A'',' +
(*
                              '       al_tipoproxoperacion = ' +
                              '            DECODE(art.amp.get_operativoultlote(:pidestableci), ' +
                              '                   ''A'', ''S'', ' +
                              '                   ''A''), ' +
*)

(* Para PM no tiene que hacer nada se actualiza en la alerta
                              iif(not ExisteActivoPrevio,
                              '       al_tipoproxoperacion = decode(al_tipoproxoperacion, ''R'',''A'',' +
                              '                                     DECODE(art.amp.get_operativoultlote(' + SqlValue(FIDEstableci) + '), ' +
                              '                                            ''A'', ''S'', ' +
                              '                                            ''A'')), ', '') +


                              '       al_secuencia = decode(al_tipoproxoperacion, ''R'', 0, al_secuencia), ' +
*)                              
                              '       al_usumodif = :pusuario, ' +
                              '       al_fechamodif = SYSDATE ' +
                              ' WHERE al_idempresa = :pidempresa ' +
                              '   AND al_nroestableci = :pnroestableci ',
                              [IDCabeceraActiva, Sesion.UserID, FIDEmpresa, FEstableci])
//                              [IDCabeceraActiva, FIDEstableci, Sesion.UserID, FIDEmpresa, FEstableci])
            else
              EjecutarSqlSTEx('INSERT INTO hys.hal_asignacionlote ' +
                              '            (al_idempresa, al_nroestableci, al_idcabrelevamientoactivo, ' +
                              '             al_idultsubloteasignado, al_idultsubloteauditado, ' +
                              '             al_fechaproxoperacion, al_tipoproxoperacion, al_secuencia, ' +
                              '             al_usualta, al_fechaalta) ' +
                              '     VALUES (:pidempresa, :pnroestableci, :idcabrelevamientoactivo, ' +
                              '             NULL, NULL, art.actualdate, ''A'', 0, ' +
                              '             :pusuario, SYSDATE) ',
                              [FIDEmpresa, FEstableci, IDCabeceraActiva, Sesion.UserID]);

            ActualizarUltRelevamiento(FCUIT, FEstableci, FFechaRelev, 'E')
          end;
        end
      end;
}
      StatusBar.SimpleText := 'Importando Riesgos.';

      listReporteError.Add(FCUIT+';'+DateToStr(FFechaRecepPrev,format)+';');
      listReporteError.Add(IntToStr(FEstableci)+';'+DateToStr(FFechaRecepCor,format)+';');
      listReporteError.Add(DateToStr(FFechaRelev,format)+';'+DateToStr(FFechaImportacion,format)+';');
      listReporteError.Add('');
      for i := 4 to listString.Count-1 do
      begin
        campos.Clear;
        ProgressBar.StepIt;
        ProgressBar.Invalidate;
        listError.Clear;
        error := false;
        variable := StringReplace(listString.Strings[i],'"','',[rfReplaceAll]);
        if not (variable='') and not (variable[1] = '#') then
        begin
          SubString(variable,';',campos);
          if campos.Count > 6 then
          begin
            if not IsCuil(campos.Strings[0]) then
            begin
              error := true;
              listError.Add('#El Cuil no es correcto.');
            end
            else
            begin
//            1
              if not(campos.Strings[2] = '') then
              begin
                fechanacimiento := ValorSqlDateTime(
                  ' SELECT tj_fnacimiento '+
                  '   FROM comunes.ctj_trabajador '+
                  '  WHERE tj_cuil = '+ SqlValue(campos.Strings[0]));
                if (fechanacimiento <> 0) and
                   (fechanacimiento >= strtodatedef(campos.Strings[2],0,format)) then
                begin
                  error := true;
                  listError.Add('#La Fecha de Nacimiento no puede ser mayor o igual a la fecha de Ingreso.');
                end;
              end;
              if not(campos.Strings[3] = '') then
              begin
                if (strtodatedef(campos.Strings[3],0,format) = 0) then
                begin
                  error := true;
                  listError.Add('#Fecha  de Inicio Exposición errónea.');
                end;
              end;
              if not(campos.Strings[2] = '') then
              begin
                if not(campos.Strings[3] = '') then
                begin
                  if(strtodatedef(campos.Strings[2],0,format)> strtodatedef(campos.Strings[3],0,format)) then
                  begin
                    error := true;
                    listError.Add('#La Fecha de Inicio Exposición no puede ser menor que la fecha de Ingreso.');
                  end;
                end;
                if not(FFechaRelev = 0) then
                begin
                  if(strtodatedef(campos.Strings[2],0,format)> FFechaRelev) then
                  begin
                    error := true;
                    listError.Add('#La Fecha del riesgo no puede ser menor que la fecha de Ingreso.');
                  end;
                end;
                if (strtodatedef(campos.Strings[2],0,format) = 0) then
                begin
                  error := true;
                  listError.Add('#Fecha de Ingreso errónea.');
                end;
              end;
//            2


              if not error then
                EjecutarStoreSTEx('hys.do_actualizarrelaclabexpuestos(:cuit, :cuil, :nombretrab, :frelevamiento, :fechaingreso, ' +
                                '                                   :nroestab, :sector, :tarea, :usuario);',
                                                                     [FCUIT, campos.Strings[0], campos.Strings[1], TDateTimeEx.Create(FFechaRelev), TDateTimeEx.Create(strtodate(campos.Strings[2], format)),
                                                                      FEstableci, campos.Strings[4], campos.Strings[5], Sesion.LoginName]);


              if not (FFechaRelev = 0) then
              begin
                sSQL := (
                        ' SELECT 1 '+
                        '   FROM DUAL '+
                        '  WHERE afiliacion.check_cobertura ('+SqlValue(FCUIT)+', '+
                                              SqlValue(campos.Strings[0])+', '+
                        SqlValue(FFechaRelev)+
                        '        ,1           ) NOT IN (21,22, 23, 35) ');

                with GetQuery(sSQL) do
                try
                  if not (Fields[0].AsString = '1') then
                  begin
                    if not error then
                      if not ExisteSql(' SELECT 1 ' +
                                       ' FROM HYS.HIR_IMPORTACIONRECHAZADA ' +
                                       ' WHERE IR_CUIT = ' + SqlValue(FCUIT) +
                                       ' AND IR_ESTABLECI = ' + SqlValue(FEstableci) +
                                       ' AND IR_CUIL = ' + SqlValue(campos.Strings[0]) +
                                       ' AND IR_FECHARELEV = ' + SqlValue(FFechaRelev)) then
                          EjecutarSqlST(
                          ' INSERT INTO HYS.HIR_IMPORTACIONRECHAZADA '+
                          '             (IR_ID, IR_CUIT, IR_ESTABLECI, IR_CUIL, IR_NOMBRE, IR_FECHAINICIO, '+
                          '              IR_FECHAINGRESO, IR_TAREA, IR_SECTOR, IR_USUALTA, IR_FECHAALTA, IR_FECHARELEV '+
                          '             ) '+
                          '      VALUES (HYS.SEQ_HIR_ID.NEXTVAL, '+ SqlValue(FCUIT)+', '+SqlValue(FEstableci)+', '+
                          SqlValue(campos.Strings[0])+', '+SqlValue(campos.Strings[1])+', '+SqlDate(strtodatedef(campos.Strings[3],0,format))+', '+ SqlDate(strtodatedef(campos.Strings[2],0,format))+', '+
                          SqlValue(campos.Strings[5])+','+ SqlValue(campos.Strings[4]) +','+SqlValue(Sesion.UserID)+', SYSDATE, ' +  SqlValue(FFechaRelev) + ')');
                    error := true;
                    listError.Add('#El CUIL no esta asociado a la Empresa.');
                  end;
                finally
                  Free;
                end;
              end;
            end;
            if campos.Strings[1] = '' then
            begin
              sSQL := (
                      ' SELECT TJ_NOMBRE '+
                      '   FROM comunes.ctj_trabajador '+
                      '  WHERE tj_cuil = '+ SqlValue(campos.Strings[0]));
              with GetQuery(sSQL) do
              try
                nombretrabajador := Fields[0].AsString;
              finally
                Free;
              end;
            end
            else
            begin
              nombretrabajador := campos.Strings[1];
            end;

            for j := 6 to campos.count-1 do
            begin
              error_esop := false;
              if trim(campos.Strings[j]) <> '' then
              begin
                try
                  cdsRegistros.Append;
                  cdsRegistros.FieldByName('Cuit').AsString := FCUIT;
                  cdsRegistros.FieldByName('Estableci').AsInteger := FEstableci;
                  cdsRegistros.FieldByName('Fecha').AsDateTime := FFechaRelev;
                  cdsRegistros.FieldByName('Riesgo').AsString := campos.Strings[j];
                  cdsRegistros.FieldByName('Cuil').AsString := campos.Strings[0];
                  cdsRegistros.Post;
                except
                  on E: EDBClient do begin
                    if (e.ErrorCode = 9729) then
                      listError.Add('#Registro Duplicado' )
                    else
                      listError.Add('#Error: ' + E.Message);
                    error_esop := true;
                    cdsRegistros.Cancel;
                  end;
                end;
                with GetQuery(
                      ' SELECT rg_codigo,rg_id,rg_esop,rg_sufijoesop '+
                      '   FROM prg_riesgos '+
                      '  WHERE TRIM ((NVL (rg_esop, '''') || '' '' || NVL (rg_sufijoesop, ''''))) =' + SqlValue(campos.Strings[j]) +
                      '    AND rg_fechabaja IS NULL ') do
                try
                  if not IsEmpty then
                  begin
                    riesgo := Fields[0].AsString;
                    riesgoID := Fields[1].AsString;
                  end else
                    if RecordCount > 1 then
                    begin
                      error_esop := true;
                      listError.Add('#Riesgo con esop duplicado.'+Fields[2].AsString+Fields[3].AsString);
                    end else
                    begin
                      error_esop := true;
                      listError.Add('#Riesgo Erróneo o dado de baja.'+campos.Strings[j]);
                    end;
                finally
                  Free;
                end;

                if error or error_esop then
                begin
                  if error_esop or ( error and (j = 6) )then
                    erroneos := erroneos + 1;
                  //listError.Add('#Linea '+ IntToStr(i+1)+' Erronea');
                  //listError.Add(variable);
                  //listErrorcheck.Add('#Linea '+ IntToStr(i+1)+' Erronea');
                  //erroneos := erroneos + 1 ;
                end
                else
                begin
                  if  campos.Count >6 then
                  begin
                    guardados := guardados + 1;
                    sSQL := (
                            ' SELECT 1 '+
                            '   FROM art.prt_riestrab '+
                            '  WHERE rt_cuit = '+ SqlValue(FCUIT)+
                            '    AND rt_estableci = '+ SqlValue(FEstableci)+
                            '    AND rt_fecha = '+ SqlDate(FFechaRelev)+
                            '    AND rt_cuil = '+ SqlValue(campos.Strings[0])+
                            '    AND rt_riesgo = '+SqlValue(riesgo) );
                    with GetQuery(sSQL) do
                    try
                      if not(Fields[0].AsString = '1') then
                      begin
                        FRepetido := 'N';
                        if ExisteSql (' SELECT distinct 1 '+
                                      '  FROM prt_riestrab '+
                                      ' WHERE rt_cuit = ' + SqlValue(FCUIT)+
                                      '   AND rt_estableci <> ' + SqlValue(FEstableci)+
                                      '   AND rt_cuil = ' + SqlValue(campos.Strings[0])+
                                      '   AND to_char(rt_fecha,''YYYY'') = to_char(art.actualdate,''YYYY'')') then
                        begin
                          FRepetido   := 'S';
                          HayRepetidos:= true
                        end;

                        EjecutarSqlST(
                          ' INSERT INTO art.prt_riestrab '+
                          '             (rt_cuit, rt_estableci, rt_fecha, rt_riesgo, rt_cuil, rt_nombre, '+
                          '             rt_fechainiexpo, rt_usualta, rt_fechaalta, rt_idrg, rt_idcabeceranomina, rt_repetido '+
                          '             ) '+
                          '      VALUES ('+SqlValue(FCUIT) + ', ' + SqlValue(FEstableci) + ', ' + SqlDate(FFechaRelev) + ', ' +
                                        SqlValue(riesgo) + ', ' + SqlValue(campos.Strings[0]) + ', ' + SqlValue(nombretrabajador) + ', ' +
                                        SqlDate(strtodatedef(campos.Strings[3],0,format)) + ', ' +
                                        SqlValue(Sesion.UserID) + ', SYSDATE, ' + SqlValue(riesgoID) + ', ' +
                                        SqlValue(IdCabeceraNomina) + ', ' + SqlValue(FRepetido )+ ')');

                        // Si estoy cargando una complementaria, determino si voy a incorporar
                        // trabajadores de la nueva nómina en la nómina activa (con una vez basta)
                        if cbRelevComplementario.Checked and
                           (EstadoNomina = enComplementario) and
                           (not NuevosTrabajadores) then
                          NuevosTrabajadores := not ExisteSql('SELECT 1 '+
                                                              '  FROM art.prt_riestrab prt2 ' +
                                                              ' WHERE prt2.rt_cuit = ' + SqlValue(FCUIT) +
                                                              '   AND prt2.rt_estableci = ' + SqlValue(FEstableci) +
                                                              '   AND prt2.rt_riesgo = ' + SqlValue(riesgo) +
                                                              '   AND prt2.rt_cuil = ' + SqlValue(campos.Strings[0]) +
                                                              '   AND prt2.rt_idcabeceranomina = ' + SqlValue(IDCabeceraActiva))
                      end
                      else begin
                        EjecutarSqlST(
                        ' UPDATE art.prt_riestrab '+
                        '    SET rt_nombre = NVL('+SqlValue(campos.Strings[1])+' , rt_nombre),'+
                        '        RT_IDCABECERANOMINA = '+SqlValue(IdCabeceraNomina)+
                        '  WHERE rt_cuit = '+ SqlValue(FCUIT)+
                        '    AND rt_estableci = '+ SqlValue(FEstableci)+
                        '    AND rt_fecha = '+ SqlDate(FFechaRelev)+
                        '    AND rt_cuil = '+ SqlValue(campos.Strings[0])+
                        '    AND rt_riesgo = '+SqlValue(riesgo) );
                      end;

(*
                      if campos.Count > 6 then
                      EjecutarSqlST(
                        ' UPDATE CRL_RELACIONLABORAL '+
                        '    SET RL_SECTOR = NVL('+SqlValue(campos.Strings[4])+' , RL_SECTOR),'+
                        '        RL_TAREA =  NVL('+SqlValue(campos.Strings[5])+' , RL_TAREA),'+
                        '        RL_FECHAINGRESO = NVL('+SqlDate(strtodatedef(campos.Strings[2],0,format))+ ', RL_FECHAINGRESO),'+
                        '        RL_USUMODIF = '+SqlValue(Sesion.UserID)+', '+
                        '        RL_FECHAMODIF = SYSDATE '+
                        '  WHERE RL_CONTRATO = AFILIACION.Get_UltContrato('+SqlValue(FCUIT)+') '+
                        '    AND RL_IDTRABAJADOR = (SELECT TJ_ID FROM CTJ_TRABAJADOR WHERE TJ_CUIL = '+SqlValue(campos.Strings[0])+') ');
*)

          (*
            Sacado a pedido de GDRAGANI

                      EjecutarSqlST(
                        ' UPDATE comunes.ctj_trabajador '+
                        '    SET tj_nombre = NVL('+SqlValue(campos.Strings[5])+' , tj_nombre),'+
                        '        TJ_USUMODIF = '+SqlValue(Sesion.UserID)+', '+
                        '        TJ_FECHAMODIF = sysdate '+
                        '  WHERE TJ_cuil = '+SqlValue(campos.Strings[5]));
          *)
(*
                      EjecutarSqlST(
                        'Begin art.afiliacion.act_endosotrabajador('+SqlValue(campos.Strings[0])+', '+SqlValue(Sesion.UserID)+');END;');
*)                        
                    finally
                      Free;
                    end;
                  end;
                end;
              end;
            end;
            if listError.Text <> '' then
            begin
              listReporteError.Add(variable);
              listReporteError.AddStrings(listError);
            end;
            error := false;
          end
          else
          begin
            error := true;
            listError.Add('#No se encuentran todos los campos.');
          end;
        end;
      end;

      if error then
      begin
        listReporteError.Add(variable);
        listReporteError.AddStrings(listError);
      end;
    end;
    StatusBar.SimpleText := 'Cerrando archivos.';
    if (edErrores.FileName > '') then
    begin
      sArchivoLOG := edErrores.FileName;
      if not DirectoryExists(ExtractFileDir(sArchivoLOG)) then
        sArchivoLOG := IncludeTrailingPathDelimiter(TempPath) + sArchivoLOG;

      if cbTitulosErrores.Checked then
        listReporteError.SaveToFile(sArchivoLOG)
      else
        listErrorcheck.SaveToFile(sArchivoLOG);
    end;
    ProgressBar.Visible := False;

    if (guardados > 0 ) then
    begin
      conSemestral := ValorSql(
        ' SELECT DISTINCT ''S'' '+
        '   FROM art.aer_estriesg, art.prt_riestrab, hys.hcn_cabeceranomina '+
        '  WHERE rt_riesgo = er_riesgo '+
        '    AND er_fechabaja IS NULL '+
        '    AND cn_cuit = '+SqlValue(FCUIT)+
        '    AND cn_estableci = '+SqlValue(FEstableci)+
        '    AND cn_fecharelevamiento = '+SqlValue(FFechaRelev)+
        '    AND cn_id = rt_idcabeceranomina '+
        '   AND er_periodicidad = 6 ') = 'S';

      EjecutarSqlST(
        ' UPDATE hys.hcn_cabeceranomina '+
        '    SET cn_cantidad = '+SqlValue(guardados)+', '+
        '        cn_consemestral = '+SqlBoolean(conSemestral)+
        '  WHERE cn_id = '+SqlValue(IdCabeceraNomina));

      MsgBox('Se guardaron '+IntToStr(guardados)+' registros.',MB_ICONINFORMATION);
    end;

    // Si corresponde, agregar empleados en la nómina activa y envíar notificación
    if NuevosTrabajadores then
    begin
      EjecutarSqlST('INSERT INTO art.prt_riestrab ' +
                    '            (rt_cuit, rt_estableci, rt_fecha, rt_riesgo, rt_cuil, rt_nombre, ' +
                    '             rt_usualta, rt_fechaalta, rt_idrg, rt_idcabeceranomina, ' +
                    '             rt_idcabnomorigen, rt_repetido) ' +
                    '  SELECT rt_cuit, rt_estableci, TO_DATE(' + SqlValue(FechaCabeceraActiva) + ', ''DD/MM/YYYY''), ' +
                    '         rt_riesgo, rt_cuil, rt_nombre, ' +
                    '         rt_usualta, art.actualdate, rt_idrg, ' + SqlValue(IDCabeceraActiva) + ', ' +
                              SqlValue(IdCabeceraNomina) + ', rt_repetido ' +
                    '    FROM art.prt_riestrab prt1 ' +
                    '   WHERE prt1.rt_idcabeceranomina = ' + SqlValue(IdCabeceraNomina) +
                    '     AND NOT EXISTS(SELECT 1 ' +
                    '                      FROM art.prt_riestrab prt2 ' +
                    '                     WHERE prt2.rt_cuit = prt1.rt_cuit ' +
                    '                       AND prt2.rt_estableci = prt1.rt_estableci ' +
                    '                       AND prt2.rt_riesgo = prt1.rt_riesgo ' +
                    '                       AND prt2.rt_cuil = prt1.rt_cuil ' +
                    '                       AND prt2.rt_idcabeceranomina =  ' + SqlValue(IDCabeceraActiva) + ')');

      FListaMail := Trim(Get_DireccionesEnvioMail('HYS_TNC'));
      if FListaMail <> '' then
      begin
        rptNuevosTrabNominaActiva := TrptNuevosTrabNominaActiva.Create( Self );
        try
          rptNuevosTrabNominaActiva.FIDCabecera := IdCabeceraNomina;

          FBody := 'Se han incoporado trabajadores por nómina complementaria con fecha de relevamiento ' + DateToStr(FFechaRelev) +
                   ' en la nómina activa con fecha de relevamiento ' + FechaCabeceraActiva;

          FAsunto := 'Nuevos trabajadores en nómina activa del CUIT ' + FCUIT +
                     '- Estab.' + IntToStr(FEstableci);

          FArchivo := TempPath + FAsunto + '.pdf';
          ExportarPDF(rptNuevosTrabNominaActiva.qrListaTrabajadores, FArchivo);

          EnviarMailBD(FListaMail, FAsunto, [oAutoFirma, oDeleteAttach], FBody, GetAttachments(FArchivo, 0));
        finally
          rptNuevosTrabNominaActiva.Free;
        end
      end
    end;

    // Si se ha cargado algún trabajador que está en otro establecimiento, lo notifica
    if HayRepetidos then
    begin
      FListaMail := Trim(Get_DireccionesEnvioMail('HYS_TDE'));
      if FListaMail <> '' then
      begin
        rptTrabajadoresEnOtroEstab := TrptTrabajadoresEnOtroEstab.Create( Self );
        try
          rptTrabajadoresEnOtroEstab.FIDCabecera := IdCabeceraNomina;

          FBody := 'Se han incoporado trabajadores que se encuentran en otro(s) establecimiento(s).';

          FAsunto := 'Trabajadores del CUIT ' + FCUIT + '- Estab.' + IntToStr(FEstableci) +
                     ' que se encuentran en otro(s) establecimiento(s)';

          FArchivo := TempPath + FAsunto + '.pdf';
          ExportarPDF(rptTrabajadoresEnOtroEstab.qrListaTrabajadores, FArchivo);

          EnviarMailBD(FListaMail, FAsunto, [oAutoFirma, oDeleteAttach], FBody, GetAttachments(FArchivo, 0));
        finally
          rptTrabajadoresEnOtroEstab.Free;
        end
      end
    end;

    ActualizarRelevamientos(FCUIT, FEstableci);

    CommitTrans(True);

    if (erroneos > 0 )or error then
    begin
      MsgBox('No se pudieron guardar ' + IntToStr(erroneos) + ' registros.', MB_ICONERROR);
      if FileExists(sArchivoLOG) and (MsgBox('¿Desea ver el log de errores?', MB_ICONQUESTION + MB_YESNO, 'Guardar Datos') = IDYES) then
      begin
        ShellExecute(frmImportacionNominas.Handle, nil, PChar('notepad'), PChar(sArchivoLOG), nil, SW_SHOWNORMAL);

  //      Abrir(TfrmMuestraError, frmMuestraError, tmvNormal, nil);
  //      ShellExecute(Form1.Handle, nil, 'c:\windows\notepad.exe',
    //      edErrores.FileName, nil, SW_SHOWMAXIMIZE);
  //      with TfrmMuestraError.Create(Self) do
  //      try
  //        Load(edErrores.FileName);
  //        Hide;
  //        ShowModal;
  //      finally
  //        Free;
  //      end;
      end
    end;

    DeleteFile('C:\Temp\Origen.csv');
    listString.Free;
    listError.Free;
    listErrorcheck.Free;
//    TempStream.Free;
    campos.Free;

  except
  on E: Exception do
    begin
      RollBack(true);
      ErrorMsg(E, 'Error al guardar los datos.');
    end;
  end;
end;


procedure TfrmImportacionNominas.SubString(const S: String; Separator: Char; Sl: TStringList);
var
  Start, Anterior : Integer;
begin
  Start := 1;
  Anterior := 1;
  while (Start <= Length(S)) and (Start <> (Anterior+1) ) do
    Sl.Add(obtenerString(S, Separator, Start, Anterior));
end;

function TfrmImportacionNominas.obtenerString(const S: String; Separator: Char; var StartPos, Anterior: Integer): String;
var
  Index: Integer;
begin
  Result := '';

  //while (S[StartPos] = Separator) and (StartPos <= Length(S)) do
  //  StartPos := StartPos + 1;
  Anterior := StartPos;
  if StartPos > length(S) then
    Exit;

   Index := StartPos;

   while (S[Index] <> Separator) and (Index <= length(S)) do
    Index := Index + 1;
   if(Index <> StartPos) then
   Result := Copy(S, StartPos, Index - StartPos)
   else
   Result := '';
   StartPos := Index + 1;
end;

procedure TfrmImportacionNominas.btnCancelarClick(Sender: TObject);
begin
  cdsRegistros.Close;
  Close;
end;

procedure TfrmImportacionNominas.FormCreate(Sender: TObject);
begin
  inherited;
  LCID_1 := LOCALE_USER_DEFAULT;
  cbRelevComplementario.Checked := false;
end;

procedure TfrmImportacionNominas.edOrigenChange(Sender: TObject);
begin
  inherited;
  if FileExists(edOrigen.FileName) then
    edErrores.Text := '"' + IncludeTrailingPathDelimiter(ExtractFileDir(edOrigen.FileName)) +
                      ChangeFileExt(ExtractFileName(edOrigen.FileName), '') + '_LOG.txt"';
end;

(*
procedure TfrmImportacionNominas.ActualizarUltRelevamiento(cuit: String;
                                                           nroestableci: integer;
                                                           fecharelev: TDateTime;
                                                           tiporelev: String);
begin
  if ExisteSqlEx ('SELECT 1 ' +
                  '  FROM hys.hur_ultimorelevamiento ' +
                  ' WHERE ur_cuit = :cuit ' +
                  '   AND ur_estableci = :nroestableci ',
                  [cuit, nroestableci]) then
    EjecutarSqlSTEx('UPDATE hys.hur_ultimorelevamiento ' +
                    '  SET ur_fecharelev = ' + SqlDate(fecharelev) + ', ' +
                    '      ur_fechaaltarelev = SYSDATE, ' +
                    '      ur_tiporelevamiento = :tiporelev ' +
                    'WHERE ur_cuit = :cuit ' +
                    '  AND ur_estableci = :nroestableci ' +
                    '  AND ur_fecharelev < ' + SqlDate(fecharelev),
                    [tiporelev, cuit, nroestableci])
  else
    EjecutarSqlSTEx('INSERT INTO hys.hur_ultimorelevamiento ' +
                    '            (ur_cuit, ur_estableci, ur_fecharelev, ' +
                    '             ur_fechaaltarelev, ur_tiporelevamiento) ' +
                    '     VALUES (:cuit, :nroestableci, ' + SqlDate(fecharelev) + ', ' +
                    '             SYSDATE, :tiporelev)',
                    [cuit, nroestableci, tiporelev]);

end;
*)

end.


