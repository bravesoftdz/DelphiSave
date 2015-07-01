unit unCargaNominaDskSolicitud;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArtFrame, unArtDbFrame, unFraEmpresa,
  StdCtrls, unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox, ComCtrls, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, PatternEdit, IntEdit, PeriodoPicker, ExtCtrls, StaticGrid, Db, SDEngine, unFraEstablecimiento, QueryPrint,
  DBFileReader, FileReader, unFraEmpresaSolicitud, unFraEmpresaAfi, CardinalEdit, unArt, unArtDBAwareFrame, JvExControls,
  JvComponent, JvSpecialProgress, Buttons, Menus;

type
  TfrmCargaNominaDskSolicitud = class(TForm)
    GroupBox5: TGroupBox;
    GroupBox1: TGroupBox;
    lbEstablecimento: TLabel;
    edFilename: TFilenameEdit;
    Label1: TLabel;
    Label2: TLabel;
    chkBajas: TCheckBox;
    btnProcesar: TButton;
    btnImprimir: TButton;
    btnGrabar: TButton;
    btnSalir: TButton;
    edPeriodo: TPeriodoPicker;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    edTotal: TIntEdit;
    Label5: TLabel;
    edError: TIntEdit;
    Label6: TLabel;
    edCorrectos: TIntEdit;
    Bevel1: TBevel;
    Grid: TArtDBGrid;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    fraEmpresa: TfraEmpresaSolicitud;
    lbCUIT: TLabel;
    edSA_NROINTERNO: TCardinalEdit;
    Label7: TLabel;
    fraEstablecimiento: TfraCodigoDescripcion;
    pnComputerUser: TPanel;
    BarProgreso: TJvSpecialProgress;
    btnVerFormato: TBitBtn;
    mnuGrid: TPopupMenu;
    mnuIgnorar: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure edSA_NROINTERNOKeyPress(Sender: TObject; var Key: Char);
    procedure edSA_NROINTERNOExit(Sender: TObject);
    procedure btnVerFormatoClick(Sender: TObject);
    procedure mnuIgnorarClick(Sender: TObject);
  private
    FIdFormulario: TTableId;
    FNroInterno: TTableId;

    procedure SetIdFormulario(const Value: TTableId);
    procedure SetNroInterno(const Value: TTableId);
  private
    FCantLineas: Integer;
    FEstadosCiviles: String;
    function EsNombreInvalido(aCadena: String): Boolean;
    function Get_CUILTrabajador(aNroDocumento, aSexo: String; aNacimiento: TDateTime): String;
    function GetComputerAndUserName: String;
    function QuitarCaracteresInvalidos(const aCadena: String): String;
    function ValidarFormatoFecha(aFormato: String): Boolean;
    function ValidarFormatoSexo(aFormato: String): Boolean;

    procedure CambiaEmpresa(Sender: TObject);
    procedure CargarQuery;
    procedure ClearControls;
    procedure ProcesarArchivo(NombreArchivo: String);

    {
    function GetSeparador(Formato: string): Char;
    function ToDate(sFecha, sFormato: string): TDateTime;
}

    property IdFormulario: TTableId read FIdFormulario write SetIdFormulario;
    property NroInterno: TTableId   read FNroInterno   write SetNroInterno;
  public
  end;

const
  MAX_BLANCOS = 10;
  VECTOR_FORMATOS_FECHA: Array [0..15] of String = ('DD/MM/AAAA','DMMAA','DDMMAAA','DDMMAAAA', 'AAAAMMDD', 'D/MM/AA',
                                                    'D-MM-AA', 'DD/MM/AA', 'DD-MM-AA', 'DD-MM-AAAA', 'AA/MM/D',
                                                    'AA/MM/DD', 'AAAA/MM/DD', 'MM/D/AA', 'MM/DD/AA', 'MM/DD/AAAA');
  VECTOR_FORMATOS_SEXO: Array [0..3] of String = ('M/F','F/M','V/M','M/V');

var
  frmCargaNominaDskSolicitud: TfrmCargaNominaDskSolicitud;

implementation

uses
  VCLExtra, unPrincipal, CUIT, unDmPrincipal, StrFuncs, AnsiSql, SqlFuncs, CustomDlgs, unAfiliaciones, DateTimeFuncs,
  unHojaCalculo, unSesion;

{$R *.DFM}

procedure TfrmCargaNominaDskSolicitud.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  frmPrincipal.mnuCargaMasivaDisketteSol.Enabled := False;
  fraEmpresa.OnChange := CambiaEmpresa;
  ClearControls;
  fraEmpresa.ShowBajas := True;

  fraEstablecimiento.TableName   := 'ase_solicitudestablecimiento';
  fraEstablecimiento.FieldCodigo := 'se_nroestableci';
  fraEstablecimiento.FieldDesc   := 'se_nombre';
  fraEstablecimiento.ExtraFields := ', art.utiles.armar_domicilio(se_calle, se_numero, se_piso, se_departamento, NULL) ' +
                                    ' || art.utiles.armar_localidad(se_cpostal, NULL, se_localidad, se_provincia) domicilio ';
  fraEstablecimiento.FieldID     := 'se_id';
  fraEstablecimiento.ShowBajas   := False;

  pnComputerUser.Caption := GetComputerAndUserName;

  sSql :=
    'SELECT   tb_codigo, tb_descripcion' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''ESTAD''' +
        ' AND tb_codigo <> ''0''' +
   ' ORDER BY tb_codigo';
  with GetQuery(sSql) do
  try
    FEstadosCiviles := '';
    while not Eof do
    begin
      FEstadosCiviles := FEstadosCiviles + Format('%s=%s/', [FieldByName('tb_codigo').AsString,
                                                             FieldByName('tb_descripcion').AsString]);
      Next;
    end;
    System.Delete(FEstadosCiviles, Length(FEstadosCiviles), 2);
  finally
    Free;
  end;
end;

procedure TfrmCargaNominaDskSolicitud.btnProcesarClick(Sender: TObject);
begin
  edFilename.Text := Trim(StrReplace(edFilename.Text, '"', ''));

  if fraEmpresa.IsEmpty then
    raise Exception.Create('Debe indicar la empresa a la que pertenecen los empleados.');

  if edPeriodo.Periodo.IsNull then
    raise Exception.Create('Debe indicar el período al que pertenece la nómina.');

  if fraEstablecimiento.IsEmpty then
    raise Exception.Create('Debe indicar el establecimiento al que pertenecen los empleados.');

  if edFilename.Text = '' then
    raise Exception.Create('Debe elegir un archivo para procesar.');

  ProcesarArchivo(edFilename.Text);
end;

procedure TfrmCargaNominaDskSolicitud.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCargaNominaDskSolicitud.ClearControls;
begin
  VCLExtra.LockControls([edTotal, edError, edCorrectos], True);
  VCLExtra.LockControls([btnImprimir, btnGrabar], True);
  fraEmpresa.Clear;
  edPeriodo.Clear;
  fraEstablecimiento.Clear;
  edFilename.Clear;
  chkBajas.Checked := False;
//  cmbFechaBaja.Clear;
  BarProgreso.Position := 0;
  edTotal.Clear;
  edError.Clear;
  edCorrectos.Clear;
  sdqConsulta.Close;
end;

procedure TfrmCargaNominaDskSolicitud.ProcesarArchivo(NombreArchivo: String);
var
  aSql: TSql;
  aUbic: Array [0..25] of Integer;
  bExiste: Boolean;
  dFechaMovimiento: TDateTime;
  dFechaNacimiento: TDateTime;
  dFechaBaja: TDateTime;
  iBlancos: Integer;
  iBlancosIntermedios: Integer;
  iCeldaXInicial: Integer;
  iCeldaYInicial: Integer;
  iEdad: Integer;
  iLoop: Integer;
  iLoop2: Integer;
  iNroCampo: Integer;
  iPosicion: Integer;
  iTotalCampos: Integer;
  iTotalErrores: Integer;
  iTotalLineas: Integer;
  iIdOrigen: Integer;
  sCampo: String;
  sFormatoMovimiento: String;
  sFormatoNacimiento: String;
  sFormatoBaja: String;
  sFormatoSexo: String;
  sLinea: String;
  sRenglon: String;
  sSql: String;
  bOrigenInicial: Boolean;

  function ProcesarLinea(aCantLineas: Integer; aLinea: String): Boolean;
  var
    eSueldo: Extended;
    sCuil: String;
    sMensaje: String;
    sSexo: String;
  begin
    aSql.Clear;
    aSql.SqlType := stInsert;
    dFechaNacimiento := 0;
    iNroCampo := 0;
    sCuil := '';
    sMensaje := '';
    sSexo := '';

    bOrigenInicial := (Pos('INICIAL', aLinea) > 0) or (Pos('inicial', aLinea) > 0);

    while (aLinea <> '') do
    begin
      iPosicion := Pos(',', aLinea);
      if iPosicion = 0 then
      begin
        iPosicion := Length(aLinea);
        sCampo := Copy(aLinea, 1, iPosicion);
      end
      else
        sCampo := Copy(aLinea, 1, iPosicion - 1);
      aLinea := Copy(aLinea, iPosicion + 1, Length(aLinea));
      if iNroCampo > High(aUbic) then Break;
      case aUbic[iNroCampo] of
        0://'CUIL'
          sCuil := sCampo;
        1://'APELLIDO'
        begin
          sCampo := QuitarCaracteresInvalidos(sCampo);
          if EsNombreInvalido(sCampo) then
            sMensaje := sMensaje + 'El apellido contiene caracteres inválidos.'
          else if Length(sCampo) > 60 then
            sMensaje := sMensaje + 'El apellido excedió el límite de 60 caracteres';
          aSql.Fields.Add('mp_apellido', UCase(sCampo));
        end;
        2://'SEXO'
        begin
          if (sCampo <> '') and (InStr(sFormatoSexo, sCampo) = 0) then
            sMensaje := sMensaje + 'El sexo no es correcto.'
          else
          begin
            sSexo := sCampo;
            aSql.Fields.Add('mp_sexo', sCampo);
          end;
        end;
        3://'NACIONALIDAD'
        begin
          if (Trim(sCampo) <> '') then
            aSql.Fields.Add('mp_nacionalidad', sCampo);
        end;
        4://'NACIMIENTO'
        begin
          if sCampo <> '' then
          begin
            try
              if not (Pos('/',sCampo) > 1) then
                sCampo := FormatDateTime('DD/MM/YYYY', StrToFloat(sCampo));

              dFechaNacimiento := ToDate(sCampo, sFormatoNacimiento);
              iEdad            := Round((DBDate - dFechaNacimiento) / 365);
              if (iEdad < 13) then
                sMensaje := sMensaje + 'Fecha de nacimiento errónea, el trabajador tiene menos de 13 años.'
              else if (iEdad > 90) then
                sMensaje := sMensaje + 'Fecha de nacimiento errónea, el trabajador tiene más de 90 años.'
              else if (iEdad >= 80) then //tk 54072 siempre que la edad se encuentre entre 80 y 90 años consulte si es correcto
                //if MsgBox('La edad del cuil ' + sCuil + ' es de ' + IntToStr(iEdad) +'.' + #13#10 +
                            //'¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
                sMensaje := sMensaje + 'La Edad es mayor a 80 años. ';
              aSql.Fields.Add('mp_nacimiento', dFechaNacimiento);
            except
              dFechaNacimiento := 0;
              sMensaje := sMensaje + 'La fecha de nacimiento no es correcta.';
            end;
          end;
        end;
        5://ESTADO CIVIL
        begin
          if sCampo <> '' then
          begin
          if Length(sCampo) > 1 then
            sCampo := UCase(sCampo[1]);
            sSql :=
                'SELECT 1' +
                ' FROM ctb_tablas' +
                ' WHERE tb_clave = ''ESTAD''' +
                 ' AND tb_codigo = :codigo';
            if not ExisteSqlEx(sSql, [sCampo]) then
              sMensaje := sMensaje + 'El estado civil es inválido. '
            else
              aSql.Fields.Add('mp_estadocivil', sCampo)
          end;
        end;
        6://'MOVIMIENTO'          //Existen ciertas dudas con esto, segun GGrossi en Solicitud se guarda en mp_movimiento
        begin                     //y en Contrato en mp_fechaingreso. Dice que consulto a vila por esto y tambien estaba en la misma.
          try
            if sCampo <> '' then
            begin
              dFechaMovimiento := ToDate(sCampo, sFormatoMovimiento);
              if (Round((DBDate - dFechaMovimiento) / 365) > 50)  then
                sMensaje := sMensaje + 'Fecha de ingreso errónea, es superior a la fecha de recepción o mayor a 50 años. ';
              aSql.Fields.Add('mp_movimiento', dFechaMovimiento);
              // Siempre que un Usuario de Afiliaciones (AFI, AFINOM y ATCLI) ingrese de manera manual o
              // masiva fechas de ingreso superiores o inferiores a 2 meses contados a partir de la fecha de alta del registro
              // 54072
              if ((Sesion.Sector = 'AFI') or (Sesion.Sector = 'ATCLI') or (Sesion.Sector = 'AFINOM')) and (not bOrigenInicial) then
                if (AddMonths(DBDate,2) < dFechaMovimiento) or (AddMonths(DBDate, -2) > dFechaMovimiento) then
                  //if MsgBox('La fecha de ingreso difiere en 2 meses a la actual en el Cuil ' + sCuil +'.' + #13#10 +
                           // '¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
                  sMensaje := sMensaje + 'Fecha de ingreso difiere en 2 meses a la actual. ';
                
            end;
          except
            sMensaje := sMensaje + 'La fecha de ingreso no es correcta. ';
          end;
        end;
        7:	// ESTABLECIMIENTO..
        begin
					if sCampo <> '0' then
          begin
            sSql :=
            	'SELECT se_id' +
               ' FROM ase_solicitudestablecimiento' +
               ' JOIN asa_solicitudafiliacion ON (se_idsolicitud = sa_id)' +
              ' WHERE se_nroestableci = :nroestableci' +
              	' AND sa_idformulario = :idformulario';
            aSql.Fields.Add('mp_establecimiento', ValorSqlIntegerEx(sSql, [StrToInt(sCampo), fraEmpresa.Value], fraEstablecimiento.Value));
          end
          else
          	aSql.Fields.Add('mp_establecimiento', fraEstablecimiento.Value);
        end;
        8: //CATEGORIA
        begin
          aSql.Fields.Add('mp_categoria', sCampo);
        end;
        9://'TAREA'
        begin
          if sCampo <> '' then
            aSql.Fields.Add('mp_puesto', sCampo);
        end;
        10: //Sector
        begin
          if sCampo <> '' then
            aSql.Fields.Add('mp_sector', sCampo);
        end;
        11:
        begin
          if sCampo <> '' then
            aSql.Fields.Add('mp_ciuo', Copy(UCase(sCampo), 1, 4));
        end;
        12://'SUELDO'
        begin
          if sCampo <> '' then
          try
            eSueldo := StrToFloat(StrReplace(sCampo, '.', ','));
            if (eSueldo > 20000) or (eSueldo < 0) then
              sMensaje := sMensaje + 'El sueldo debe encontrarse entre 0 y 20000.';
            aSql.Fields.Add('mp_sueldo', sCampo);
          except
            sMensaje := sMensaje + 'El sueldo no es numérico.';
          end;
        end;
        13: //Calle
        begin
          if sCampo <> '' then
            aSql.Fields.Add('mp_calle', Copy(UCase(sCampo), 1, 60));
        end;
        14: //Numero
        begin
          if sCampo <> '' then
            aSql.Fields.Add('mp_numero', Copy(UCase(sCampo), 1, 6));
        end;
        15: // Piso..
        begin
          if sCampo <> '' then
            aSql.Fields.Add('mp_piso', Copy(UCase(sCampo), 1, 6));
        end;
        16: // Departamento..
        begin
          if sCampo <> '' then
            aSql.Fields.Add('mp_departamento', Copy(UCase(sCampo), 1, 6));
        end;
        17: // Codigo Postal..
        begin
          if sCampo <> '' then
            aSql.Fields.Add('mp_codigopostal', Copy(UCase(sCampo), 1, 8));
        end;
        18:  // Localidad..
        begin
         if sCampo <> '' then
           aSql.Fields.Add('mp_localidad', Copy(UCase(sCampo), 1, 85));
        end;
        19: //Provincia
        begin
          if sCampo <> '' then
          begin
            sSql :=
                    'SELECT 1' +
                    ' FROM cpv_provincias' +
                    ' WHERE UPPER(pv_descripcion) = UPPER(:provincia)';
            if not ExisteSqlEx(sSql, [sCampo]) then
              sMensaje := sMensaje + 'La provincia es inválida. '
            else
              aSql.Fields.Add('mp_provincia', Copy(sCampo, 1, 50));
          end;
        end;
        20:
        begin
          if sCampo <> '' then
            aSql.Fields.Add('mp_domiciliocompleto', Copy(UCase(sCampo), 1, 255));
        end;
        21://FECHA DE BAJA
        begin
          try
            if sCampo <> '' then
            begin
              dFechaBaja := ToDate(sCampo, sFormatoBaja);
              aSql.Fields.Add('mp_fechabaja', ToDate(sCampo, 'dd/mm/yyyy'));
            end;
          except
            sMensaje := sMensaje + 'La fecha de baja no es correcta. ';
          end;
        end;
        22://Motivo de baja
        begin
          if sCampo <> '' then
            //aSql.Fields.Add('mp_domiciliocompleto', Copy(UCase(sCampo), 1, 255));
        end;
        23://ORIGEN DATO
        begin
          if (Length(sCampo) >= 2) and (sCampo <> '') then
          begin
            sSql :=
              'SELECT 1' +
              ' FROM afi.aod_origendato' +
              ' WHERE od_codigo = UPPER(:codigo)';
            if ExisteSqlEx(sSql, [sCampo]) then //veo que exista lo que escribieron
            begin
              sSql :=
                'SELECT od_id' +
                ' FROM afi.aod_origendato' +
                ' WHERE od_codigo = UPPER(:codigo)';
              iIdOrigen := ValorSQLEx(sSql, [sCampo]);
              aSql.Fields.Add('mp_idorigendato', iIdOrigen);
            end
            else
              sMensaje := sMensaje + 'Origen de datos incorrecto: ' + sCampo
          end;
        end;
        24: //Confirma puesto
        begin
          if (UCase(sCampo) = 'S') or (UCase(sCampo) = 'N') then
            aSql.Fields.Add('mp_confirmapuesto', UCase(sCampo));
          if (UCase(sCampo) = 'SI') then     //Esto es porque ponen cualquier cosa.
            aSql.Fields.Add('mp_confirmapuesto', 'S');
          if (UCase(sCampo) = 'NO') then
            aSql.Fields.Add('mp_confirmapuesto', 'N');
        end;
        25://'TIPO'  //es el ABM
        begin
          if sCampo = '' then
            sCampo := 'A';
          if (sCampo <> 'A') and (sCampo <> 'B') and (sCampo <> 'M') then
            sMensaje := sMensaje + 'El tipo de acción no es válida.';
          aSql.Fields.Add('mp_tipo', sCampo);
        end;
      end;
      //Chequea que no se haya depasado la cantidad de campos
      Inc(iNroCampo);
    end;

    if iTotalCampos <> iNroCampo then
    begin
      //Solo permite que el el ultimo campo sea nulo si es Fecha Movimiento
      if (aUbic[iTotalCampos - 1] = 0) or (aUbic[iTotalCampos - 1] = 1) then
        sMensaje := sMensaje + 'Faltan campos en el registro.';
    end;

    if (Length(sCuil) <= 8) and (sCuil <> '') and (sCuil <> '0') then
      sCuil := Get_CUILTrabajador(sCuil, sSexo, dFechaNacimiento);

    if not IsCuil(sCuil) then
      sMensaje := sMensaje + 'El cuil no es válido.'
    else if (ValorSqlEx('SELECT art.SIN.check_trabajadormuerto(:cuil) FROM DUAL', [sCuil]) <> '0') then
      sMensaje := sMensaje + 'El trabajador está muerto.';
    aSql.Fields.Add('mp_cuil', sCuil);

    if sMensaje = '' then
    begin
      Result := True;
      aSql.Fields.Add('mp_valido', 'S');
    end
    else //Muestra el error
    begin
      Result := False;
      aSql.Fields.Add('mp_error', sMensaje);
      aSql.Fields.Add('mp_valido', 'N');
    end;
    
    aSql.Fields.Add('mp_usuario', GetComputerAndUserName);
    aSql.Fields.Add('mp_nrolinea', aCantLineas);
    try
      EjecutarSql(aSql.Sql);
    except
      //Indica que se produjo un error inesperado al grabar los datos
      //y permite continuar con el proceso
      on E:Exception do
      begin
        Result := False;

        sSql :=
          'INSERT INTO tmp_afinomi' +
                     ' (mp_usuario, mp_nrolinea, mp_error, mp_valido)' +
              ' VALUES (:usuario, :nrolinea, :error, ''N'')';
        EjecutarSqlEx(sSql, [GetComputerAndUserName, aCantLineas, Copy(sMensaje + '-Error Inesperado: ' + E.Message, 1, 200)]);
      end;
    end;
  end;

begin
  iTotalErrores := 0;
  iTotalLineas := 0;

  aSql := TSql.Create('tmp_afinomi');

  //Reinicio la tabla
  EjecutarSqlEx('DELETE FROM tmp_afinomi WHERE mp_usuario = :usuario', [GetComputerAndUserName]);
  try
    with THojaCalc.Create(NombreArchivo, False) do
    try
      iCeldaXInicial := 1;
      iCeldaYInicial := 1;
      iBlancos := 0;
      iBlancosIntermedios := 0;

      for iLoop := 1 to 12 do
        for iLoop2 := 1 to 12 do
          if (UCase(CellText[iLoop, iLoop2]) = 'CUIL') or (UCase(CellText[iLoop, iLoop2]) = 'C.U.I.L.') then
          begin
            iCeldaXInicial := iLoop;
            iCeldaYInicial := iLoop2;
            Break;
          end;

      for iLoop := iCeldaXInicial + 1 to MAXINT do
      begin
        if Trim(CellText[iLoop, iCeldaYInicial + 1 {Apellido y Nombre}]) = '' then
        begin
          Inc(iBlancos);
          Inc(iBlancosIntermedios);
        end
        else
          iBlancos := 0;

        if iBlancos = MAX_BLANCOS then
        begin
          iTotalLineas := iLoop - iCeldaXInicial - (MAX_BLANCOS * 2) + iBlancosIntermedios;
          Break;
        end;
      end;

      // Primero me fijo cuantos registros son..
      if (iTotalLineas < 1) then
        raise Exception.Create('El archivo no posee registros.');


      /////////////////////////////////////////
      //  Comienza a procesar el encabezado  //
      /////////////////////////////////////////

      // Obtiene la posicion de los campos de la primer linea
      sLinea := 'CUIL,APELLIDO,SEXO M/F,NACIONALIDAD,FECHA NACIMIENTO DD/MM/AAAA,ESTADO CIVIL,FECHA INGRESO DD/MM/AAAA,ESTABLECIMIENTO,'+
                'CATEGORIA,TAREA,SECTOR,CODIGO CIUO,SUELDO,CALLE,NUMERO,PISO,DEPARTAMENTO,CODIGO POSTAL,LOCALIDAD,PROVINCIA,DOMICILIO COMPLETO,'+
                'FECHA BAJA,MOTIVO BAJA,ORIGEN DATO,CONFIRMA PUESTO,TIPO';//,TIPO,CATEGORIA,PUESTO,NOMBRE,CONFIRMA PUESTO';

      // Resetea el array de posiciones
      for iLoop := 0 to High(aUbic) do
        aUbic[iLoop] := -1;

      //Inicia el llenado del array de posiciones
      iNroCampo := 0;
      while (sLinea <> '') do
      begin
        iPosicion := Pos(',', sLinea);
        if iPosicion = 0 then
        begin
          iPosicion := Length(sLinea);
          sCampo := Copy(sLinea, 1, iPosicion);
        end
        else
          sCampo := UCase(Copy(sLinea, 1, iPosicion - 1));
        sLinea := Copy(sLinea, iPosicion + 1, Length(sLinea) - 1);

        if InStr(sCampo, 'CUIL') > 0 then
          aUbic[iNroCampo] := 0
        else if InStr(sCampo, 'APELLIDO') > 0 then
          aUbic[iNroCampo] := 1
        else if InStr(sCampo, 'SEXO') > 0 then
        begin
          aUbic[iNroCampo] := 2;
          sFormatoSexo := Copy(sCampo, 5, Length(sCampo));
          if not ValidarFormatoSexo(sFormatoSexo) then
            raise Exception.Create('El formato de sexo no es válido.');
        end
        else if InStr(sCampo, 'NACIONALIDAD') > 0 then
          aUbic[iNroCampo] := 3
        else if InStr(sCampo, 'FECHA NACIMIENTO') > 0 then
        begin
          aUbic[iNroCampo] := 4;
          sFormatoNacimiento := Copy(sCampo, 17, Length(sCampo));
          if not ValidarFormatoFecha(sFormatoNacimiento) then
            raise Exception.Create('El formato de la fecha de nacimiento no es válido.');
        end
        else if (InStr(sCampo, 'CIVIL') > 0) or (InStr(sCampo, 'ESTADO') > 0) then
          aUbic[iNroCampo] := 5
        else if InStr(sCampo, 'FECHA INGRESO') > 0 then
        begin
          aUbic[iNroCampo] := 6;
          sFormatoMovimiento := Copy(sCampo, 15, Length(sCampo));
          if not ValidarFormatoFecha(sFormatoMovimiento) then
            raise Exception.Create('El formato de la fecha de ingreso no es válido.');
        end
        else if InStr(sCampo, 'ESTABLECIMIENTO') > 0 then
          aUbic[iNroCampo] := 7
        else if InStr(sCampo, 'CATEGORIA') > 0 then
          aUbic[iNroCampo] := 8
        else if InStr(sCampo, 'TAREA') > 0 then
          aUbic[iNroCampo] := 9
        else if InStr(sCampo, 'SECTOR') > 0 then
          aUbic[iNroCampo] := 10
        else if InStr(sCampo, 'CIUO') > 0 then
          aUbic[iNroCampo] := 11
        else if InStr(sCampo, 'SUELDO') > 0 then
          aUbic[iNroCampo] := 12
        else if InStr(sCampo, 'CALLE') > 0 then
          aUbic[iNroCampo] := 13
        else if InStr(sCampo, 'NUMERO') > 0 then
          aUbic[iNroCampo] := 14
        else if InStr(sCampo, 'PISO') > 0 then
          aUbic[iNroCampo] := 15
        else if InStr(sCampo, 'DEPARTAMENTO') > 0 then
          aUbic[iNroCampo] := 16
        else if InStr(sCampo, 'POSTAL') > 0 then
          aUbic[iNroCampo] := 17
        else if InStr(sCampo, 'LOCALIDAD') > 0 then
          aUbic[iNroCampo] := 18
        else if InStr(sCampo, 'PROVINCIA') > 0 then
          aUbic[iNroCampo] := 19
        else if InStr(sCampo, 'COMPLETO') > 0 then
          aUbic[iNroCampo] := 20
        else if (InStr(sCampo, 'FECHA') > 0) and (InStr(sCampo, 'BAJA') > 0) then
          aUbic[iNroCampo] := 21
        else if (InStr(sCampo, 'MOTIVO') > 0) and (InStr(sCampo, 'BAJA') > 0) then
          aUbic[iNroCampo] := 22
        else if (InStr(sCampo, 'ORIGEN') > 0) then
          aUbic[iNroCampo] := 23
        else if InStr(sCampo, 'CONFIRMA PUESTO') > 0 then
          aUbic[iNroCampo] := 24
        else if InStr(sCampo, 'TIPO') > 0 then
          aUbic[iNroCampo] := 25;


        {else if InStr(sCampo, 'CATEGORIA') > 0 then
          aUbic[iNroCampo] := 5
        else if (InStr(sCampo, 'PUESTO') > 0) and (InStr(sCampo, 'CONFIRMA') = 0) then
          aUbic[iNroCampo] := 6
        else if InStr(sCampo, 'TAREA') > 0 then
          aUbic[iNroCampo] := 7
        else if InStr(sCampo, 'MOVIMIENTO') > 0 then
        begin
          aUbic[iNroCampo] := 11;
          sFormatoMovimiento := Copy(sCampo, 11, Length(sCampo));
          if not ValidarFormatoFecha(sFormatoMovimiento) then
            raise Exception.Create('El formato de la fecha de movimiento no es válido.');
        end
        else if InStr(sCampo, 'NOMBRE') > 0 then
          aUbic[iNroCampo] := 13
        else if InStr(sCampo, 'CONFIRMA PUESTO') > 0 then
          aUbic[iNroCampo] := 15
        else
          raise Exception.Create('No se reconoció el campo del encabezado: ' + sCampo);
        }
        // Chequea que no se haya depasado la cantidad de campos
        Inc(iNroCampo);
      end;
      iTotalCampos := iNroCampo;
      if (iTotalCampos > (High(aUbic) + 1)) then
        raise Exception.Create('Se han encontrado demasiados campos.');

      // Me fijo que este el campo CUIL
      bExiste := False;
      for iLoop := 0 to High(aUbic) do
        if (aUbic[iLoop] = 0) then
          bExiste := True;

      if not bExiste then
        raise Exception.Create('No se encontró el campo CUIL.');

      // Me fijo que este el campo APELLIDO
      bExiste := False;
      for iLoop := 0 to High(aUbic) do
        if (aUbic[iLoop] = 1) then
          bExiste := True;

      if not bExiste then
        raise Exception.Create('No se encontró el campo APELLIDO.');


      /////////////////////////////////////////////
      //  Comienza el procesamiento del archivo  //
      /////////////////////////////////////////////

      FCantLineas   := 0;
      iNroCampo     := 0;
      iTotalErrores := 0;

      BarProgreso.Position := 0;
      BarProgreso.Minimum := iCeldaXInicial + 1;
      BarProgreso.Maximum := iTotalLineas + iCeldaXInicial;

      // Ingreso los registros correctos
      for iLoop := iCeldaXInicial + 1 to iTotalLineas + iCeldaXInicial do
      begin
        Inc(FCantLineas);

        // CUIL..
        sRenglon := SacarGuiones(CellText[iLoop, iCeldaYInicial]);
        if sRenglon = '' then
          sRenglon := Get_CUILTrabajador(CellText[iLoop, iCeldaYInicial], '', 0);

        // Apellido..
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 1]);

        // Sexo..
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 2]);

        // Nacionalidad..
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 3]);

        // Fecha Nacimiento..
        if (Trim(CellText[iLoop, iCeldaYInicial + 4]) > '') and
           (CellText[iLoop, iCeldaYInicial + 4] <> '00/00/0000') and
           (CellText[iLoop, iCeldaYInicial + 4] <> '  /  /    ') then
        try
          if Pos('/', Trim(CellText[iLoop, iCeldaYInicial + 4])) = 3 then
            sRenglon := sRenglon + '#@#' + FormatDateTime('DD/MM/YYYY', StrToDate(StringReplace(CellText[iLoop,
                                                        iCeldaYInicial + 4], '''', '', [rfReplaceAll])))
          else
            sRenglon := sRenglon + '#@#' + FormatDateTime('DD/MM/YYYY', StrToFloat(StringReplace(CellText[iLoop,
                                                        iCeldaYInicial + 4], '''', '', [rfReplaceAll])))
        except
          sRenglon := sRenglon + '#@#';
        end
        else
          sRenglon := sRenglon + '#@#';

        // Estado Civil
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 5]);

        // Fecha Movimiento..
        if (Trim(CellText[iLoop, iCeldaYInicial + 6]) > '') and
           (CellText[iLoop, iCeldaYInicial + 6] <> '00/00/0000') and
           (CellText[iLoop, iCeldaYInicial + 6] <> '  /  /    ') then
        try
        if Pos('/', Trim(CellText[iLoop, iCeldaYInicial + 6])) = 3 then
          sRenglon := sRenglon + '#@#' + FormatDateTime('DD/MM/YYYY', StrToDate(StringReplace(CellText[iLoop,
                                                        iCeldaYInicial + 6], '''', '', [rfReplaceAll])))
        else
          sRenglon := sRenglon + '#@#' + FormatDateTime('DD/MM/YYYY', StrToFloat(StringReplace(CellText[iLoop,
                                                        iCeldaYInicial + 6], '''', '', [rfReplaceAll])))
        except
          sRenglon := sRenglon + '#@#';
        end
        else
          sRenglon := sRenglon + '#@#';

        // Establecimiento..
        try
        	sRenglon := sRenglon + '#@#' + IntToStr(StrToInt(CellText[iLoop, iCeldaYInicial + 7]));
        except
        	sRenglon := sRenglon + '#@#' + '0';
        end;

        // Categoria..
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 8]);

        // Tarea..
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 9]);

        //Sector..
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 10]);

        //CIUO..
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 11]);

        // Sueldo..
        if Trim(CellText[iLoop, iCeldaYInicial + 9]) <> '' then
          sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 12])
        else
          sRenglon := sRenglon + '#@#' + '0';

        //Calle..
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 13]);

        //Numero..
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 14]);

        //Piso..
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 15]);

        //Departamento
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 16]);

        //Codigo Postal
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 17]);

        //Localidad
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 18]);

        //Provincia
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 19]);

        //Domicilio
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 20]);


        // Fecha Baja..
        if (Trim(CellText[iLoop, iCeldaYInicial + 21]) > '') and
           (CellText[iLoop, iCeldaYInicial + 21] <> '00/00/0000') and
           (CellText[iLoop, iCeldaYInicial + 21] <> '  /  /    ') then
        try
        if Pos('/', Trim(CellText[iLoop, iCeldaYInicial + 21])) = 3 then
          sRenglon := sRenglon + '#@#' + FormatDateTime('DD/MM/YYYY', StrToDate(StringReplace(CellText[iLoop,
                                                        iCeldaYInicial + 21], '''', '', [rfReplaceAll])))
        else
          sRenglon := sRenglon + '#@#' + FormatDateTime('DD/MM/YYYY', StrToFloat(StringReplace(CellText[iLoop,
                                                        iCeldaYInicial + 21], '''', '', [rfReplaceAll])))
        except
          sRenglon := sRenglon + '#@#';
        end
        else
          sRenglon := sRenglon + '#@#';

        //Motivo Baja
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 22]);

        // Nombre..
        //sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 10]);

        // OrigenDato.
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 23]);

        // Confirma Puesto..
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 24]);

        // Tipo.. (A B M)
        sRenglon := sRenglon + '#@#' + Trim(CellText[iLoop, iCeldaYInicial + 25]);

        sRenglon := StringReplace(sRenglon, ',', ' ', [rfReplaceAll]);
        sRenglon := StringReplace(sRenglon, '#@#', ',', [rfReplaceAll]);

        // Procesa el registro..
        if not ProcesarLinea(FCantLineas, sRenglon) then
          Inc(iTotalErrores);

        BarProgreso.StepIt;
        if BarProgreso.Position mod 10 = 0 then
          Application.ProcessMessages;
      end;
    finally
      Free;
    end;

    edTotal.Value := iTotalLineas;
    edError.Value := iTotalErrores;
    edCorrectos.Value := iTotalLineas - iTotalErrores;
    CargarQuery;
    btnGrabar.Enabled := True;
    btnImprimir.Enabled := True;
    MessageDlg('El proceso ha terminado.', mtInformation, [mbOK], 0);
  finally
    aSql.Free;
  end;
end;

procedure TfrmCargaNominaDskSolicitud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuCargaMasivaDisketteSol.Enabled := True;
  frmCargaNominaDskSolicitud := nil;

  inherited;
end;

procedure TfrmCargaNominaDskSolicitud.CargarQuery;
var
  sSql: String;
begin
  sSql :=
    'SELECT   *' +
       ' FROM tmp_afinomi' +
      ' WHERE mp_usuario = :usuario' +
        ' AND mp_valido = ''N''' +
   ' ORDER BY mp_nrolinea';
  OpenQueryEx(sdqConsulta, [GetComputerAndUserName], sSql, True);
end;

function TfrmCargaNominaDskSolicitud.ValidarFormatoFecha(aFormato: String): Boolean;
var
  iLoop: Integer;
begin
  Result := False;
  for iLoop := 0 to High(VECTOR_FORMATOS_FECHA) do
    if Trim(aFormato) = VECTOR_FORMATOS_FECHA[iLoop] then
      Result := True;
end;

function TfrmCargaNominaDskSolicitud.ValidarFormatoSexo(aFormato: String): Boolean;
var
  iLoop: Integer;
begin
  Result := False;
  for iLoop := 0 to High(VECTOR_FORMATOS_SEXO) do
    if Trim(aFormato) = VECTOR_FORMATOS_SEXO[iLoop] then
      Result := True;
end;

procedure TfrmCargaNominaDskSolicitud.btnImprimirClick(Sender: TObject);
begin
  try
    if not sdqConsulta.IsEmpty and PrintDialog.Execute then
    begin
      QueryPrint.DataSource := dsConsulta;
      QueryPrint.SubTitle.Lines.Text := 'Errores en la carga masiva ' + #13#10;
      QueryPrint.Print;
    end;
  finally
    QueryPrint.SubTitle.Lines.Clear;
  end;
end;

procedure TfrmCargaNominaDskSolicitud.btnGrabarClick(Sender: TObject);
var
  aQuery: TSDQuery;
  aSqlEstableci: TSql;
  aSqlTrabajador: TSql;
  cSueldo: Currency;
  dFechaMovimiento: TDateTime;
  IdTrabajador: TTableId;
  IdSolicitud: TTableId;
  sProvinciaId: String;
  sNombreFinal: String;
  sSql: String;
begin
  if MsgBox('Esta acción guardará los registros en la base de datos.' + #13#10 +
            '¿ Realmente desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) = ID_YES then
  begin
    sSql :=
      'SELECT *' +
       ' FROM tmp_afinomi' +
      ' WHERE mp_usuario = :usuario' +
        ' AND mp_valido = ''S''';
    aQuery := GetQueryEx(sSql, [GetComputerAndUserName]);

    aSqlTrabajador := TSql.Create('ast_solicitudtrabajador');
    aSqlEstableci := TSql.Create('ase_solicitudestablecimiento');

    sSql :=
      'SELECT sa_id' +
       ' FROM asa_solicitudafiliacion' +
      ' WHERE sa_idformulario = :idformulario';
    IdSolicitud := ValorSqlIntegerEx(sSql, [fraEmpresa.Value]);
    try
      BarProgreso.Position := 0;
      BarProgreso.Minimum := 0;
      BarProgreso.Maximum := aQuery.RecordCount;

      BeginTrans;
      try
        while not aQuery.Eof do
        begin
          //Inicia la grabacion de los registros
          aSqlTrabajador.Clear;
          aSqlEstableci.Clear;

          //Doy de alta los registros correspondientes
          if (aQuery.FieldByName('mp_tipo').AsString <> 'B') and (aQuery.FieldByName('mp_fechabaja').IsNull) then
          begin
            //////////////////
            //  TRABAJADOR  //
            //////////////////
            //Junto al nombre con el apellido
            sNombreFinal := Trim(aQuery.FieldByName('mp_apellido').AsString);
            if Trim(aQuery.FieldByName('mp_nombre').AsString) <> '' then
              sNombreFinal := Trim(aQuery.FieldByName('mp_nombre').AsString) + ' ' + sNombreFinal;

            //Ingresa la fecha de recepcion como fecha de movimiento, si esta es NULL
            if aQuery.FieldByName('mp_movimiento').IsNull then
              dFechaMovimiento := DBDate
            else
              dFechaMovimiento := aQuery.FieldByName('mp_movimiento').AsDateTime;

            //Ingresa el sueldo
            if aQuery.FieldByName('mp_sueldo').AsString <> '' then
              cSueldo := StrToFloat(StrReplace(aQuery.FieldByName('mp_sueldo').AsString, '.', ','))
            else
              cSueldo := 0;

            sSql :=
              'SELECT st_id' +
               ' FROM ast_solicitudtrabajador' +
              ' WHERE st_cuil = :cuil' +
                ' AND st_idsolicitud = :idsolicitud';
            IdTrabajador := ValorSqlIntegerEx(sSql, [aQuery.FieldByName('mp_cuil').AsString, IdSolicitud]);

            if (IdTrabajador = ART_EMPTY_ID) then
            begin
              aSqlTrabajador.SqlType := stInsert;
              IdTrabajador := ValorSql('SELECT seq_ast_id.NEXTVAL FROM DUAL');
              aSqlTrabajador.Fields.Add('st_usualta',   frmPrincipal.DBLogin.UserID);
              aSqlTrabajador.Fields.Add('st_fechaalta', 'ACTUALDATE', False);
            end
            else
            begin
              aSqlTrabajador.SqlType := stUpdate;
              aSqlTrabajador.Fields.Add('st_usumodif',   frmPrincipal.DBLogin.UserID);
              aSqlTrabajador.Fields.Add('st_fechamodif', 'ACTUALDATE', False);
            end;

            //Campos
            aSqlTrabajador.Fields.Add('st_idsolicitud',    IdSolicitud, False);
            aSqlTrabajador.Fields.Add('st_idsolicitudest', aQuery.FieldByName('mp_establecimiento').AsInteger);
            aSqlTrabajador.PrimaryKey.Add('st_id',         IdTrabajador, False);
            aSqlTrabajador.Fields.Add('st_cuil',           aQuery.FieldByName('mp_cuil').AsString);
            aSqlTrabajador.Fields.Add('st_documento',      Copy(aQuery.FieldByName('mp_cuil').AsString, 3, 8));
            aSqlTrabajador.Fields.Add('st_nombre',         sNombreFinal);

            if aQuery.FieldByName('mp_nacionalidad').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_idnacionalidad', ValorSqlIntegerEx('SELECT na_id FROM cna_nacionalidad WHERE na_descripcion = :nacionalidad', [aQuery.FieldByName('mp_nacionalidad').AsString], 7));

            if aQuery.FieldByName('mp_estadocivil').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_estadocivil',  aQuery.FieldByName('mp_estadocivil').AsString);

            if aQuery.FieldByName('mp_sector').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_sector',       aQuery.FieldByName('mp_sector').AsString);

            if aQuery.FieldByName('mp_sexo').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_sexo',         aQuery.FieldByName('mp_sexo').AsString);

            if aQuery.FieldByName('mp_ciuo').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_cuio',         aQuery.FieldByName('mp_ciuo').AsInteger);

            if aQuery.FieldByName('mp_calle').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_calle',        aQuery.FieldByName('mp_calle').AsString);

            if aQuery.FieldByName('mp_numero').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_numero',       aQuery.FieldByName('mp_numero').AsString);

            if aQuery.FieldByName('mp_piso').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_piso',         aQuery.FieldByName('mp_piso').AsString);

            if aQuery.FieldByName('mp_departamento').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_departamento', aQuery.FieldByName('mp_departamento').AsString);

            if aQuery.FieldByName('mp_localidad').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_localidad',    aQuery.FieldByName('mp_localidad').AsString);


            sSql :=
                    'SELECT pv_codigo' +
                    ' FROM cpv_provincias' +
                    ' WHERE UPPER(pv_descripcion) = UPPER(:descripcion)';
            sProvinciaId := ValorSqlEx(sSql, [aQuery.FieldByName('mp_provincia').AsString]);
            if sProvinciaId <> '' then
            aSqlTrabajador.Fields.Add('st_provincia',           sProvinciaId);

            if aQuery.FieldByName('mp_domiciliocompleto').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_domiciliocompleto',         aQuery.FieldByName('mp_domiciliocompleto').AsString);

            if aQuery.FieldByName('mp_codigopostal').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_cpostal',         aQuery.FieldByName('mp_codigopostal').AsString);


            if aQuery.FieldByName('mp_idorigendato').IsNull then
              aSqlTrabajador.Fields.Add('st_idorigendato', 2)
            else
              aSqlTrabajador.Fields.Add('st_idorigendato', aQuery.FieldByName('mp_idorigendato').AsInteger);

            if aQuery.FieldByName('mp_nacimiento').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_fnacimiento',  aQuery.FieldByName('mp_nacimiento').AsDateTime);

            if aQuery.FieldByName('mp_puesto').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_tarea',        aQuery.FieldByName('mp_puesto').AsString);

            if aQuery.FieldByName('mp_sueldo').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_sueldo',       cSueldo, dtNumber);

            if aQuery.FieldByName('mp_categoria').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_categoria',    aQuery.FieldByName('mp_categoria').AsString);

            if aQuery.FieldByName('mp_confirmapuesto').AsString <> '' then
              aSqlTrabajador.Fields.Add('st_confirmapuesto', aQuery.FieldByName('mp_confirmapuesto').AsString);

            aSqlTrabajador.Fields.Add('st_fechaingreso',   dFechaMovimiento);



            EjecutarSqlST(aSqlTrabajador.Sql);
          end
          else
          begin
            //elimina el trabajador
            sSql :=
              'DELETE FROM ast_solicitudtrabajador' +
                   ' WHERE st_idsolicitud = :id' +
                     ' AND st_cuil = :cuil';
            EjecutarSqlSTEx(sSql, [IdSolicitud, aQuery.FieldByName('mp_cuil').AsString]);
          end;

          // Toma el registro siguiente
          aQuery.Next;
          BarProgreso.StepIt;
          Application.ProcessMessages;
        end;

        if chkBajas.Checked then
        begin
          // Da de baja los trabajadores que pertenecen a la empresa que no estan en la nomina recien ingresada
          sSql :=
            'DELETE FROM ast_solicitudtrabajador' +
                 ' WHERE st_idsolicitud = :id' +
                   ' AND st_id NOT IN(SELECT st_id' +
                                      ' FROM ast_solicitudtrabajador, tmp_afinomi' +
                                     ' WHERE st_cuil = mp_cuil' +
                                       ' AND mp_usuario = :usuario' +
                                       ' AND mp_valido = ''S'')';
          EjecutarSqlSTEx(sSql, [IdSolicitud, GetComputerAndUserName]);
        end;
        CommitTrans;
        MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
        btnGrabar.Enabled := False;
      except
        on E:Exception do
        begin
          RollBack;
          MessageDlg(E.Message, mtError, [mbOK], 0);
        end;
      end;
    finally
      aQuery.Free;
      aSqlTrabajador.Free;
      aSqlEstableci.Free;
    end;
  end;
end;

function TfrmCargaNominaDskSolicitud.EsNombreInvalido(aCadena: String): Boolean;
var
  iLoop: Integer;
begin
  Result := False;

  for iLoop := 1 to Length(aCadena) do
    if not(aCadena[iLoop] in ['A'..'Z', 'a'..'z', 'ñ', 'Ñ', ' ', '''', '.']) then
    begin
      Result := True;
      Break;
    end;
end;

function TfrmCargaNominaDskSolicitud.Get_CUILTrabajador(aNroDocumento, aSexo: String; aNacimiento: TDateTime): String;
var
  sNroDocumentoConCeros: String;
  sSql: String;
begin
  Result := '';
  
  sNroDocumentoConCeros := LPad(aNroDocumento, '0', 8);

  sSql :=
    'SELECT tj_cuil, tj_sexo, tj_fnacimiento' +
     ' FROM ctj_trabajador' +
    ' WHERE tj_documento = :documento' +
 ' ORDER BY tj_cuil';

  with GetQueryEx(sSql, [sNroDocumentoConCeros]) do
  try
    aSexo := Trim(UpperCase(aSexo));     // si no informa sexo o (el sexo informado coincide con el de la tabla y (la fecha de nacimiento no está informada o coincide con la de la tabla))

    while not Eof do
    begin
      if (aSexo = '') or ((FieldByName('tj_sexo').AsString = aSexo) and
        ((aNacimiento = 0) or (FieldByName('tj_fnacimiento').AsDateTime = aNacimiento))) then
      begin
        Result := FieldByName('tj_cuil').AsString;
        Break;
      end;

      Next;
    end;
  finally
    Free;
  end;

  if Result = '' then
    Result := '96' + sNroDocumentoConCeros + '*';
end;

procedure TfrmCargaNominaDskSolicitud.SetNroInterno(const Value: TTableId);
var
  sSql: String;
begin
  if FNroInterno <> Value then
  begin
    FNroInterno  := Value;
    edSA_NROINTERNO.Value := NroInterno;

    sSql :=
      'SELECT sa_idformulario' +
       ' FROM asa_solicitudafiliacion' +
      ' WHERE sa_nrointerno = :nrointerno';
    IdFormulario := ValorSqlIntegerEx(sSql, [FNroInterno]);
    
    if IdFormulario = ART_EMPTY_ID then
    begin
      FNroInterno           := ART_EMPTY_ID;
      edSA_NROINTERNO.Value := ART_EMPTY_ID;
    end;

    fraEmpresa.Value := IdFormulario;
    CambiaEmpresa(nil);
  end;
end;

procedure TfrmCargaNominaDskSolicitud.edSA_NROINTERNOKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    NroInterno := edSA_NROINTERNO.Value;
end;

procedure TfrmCargaNominaDskSolicitud.edSA_NROINTERNOExit(Sender: TObject);
begin
  NroInterno := edSA_NROINTERNO.Value;
end;

procedure TfrmCargaNominaDskSolicitud.SetIdFormulario(const Value: TTableId);
begin
  FIdFormulario := Value;
end;

procedure TfrmCargaNominaDskSolicitud.CambiaEmpresa(Sender: TObject);
var
  aSqlResults: TStringList;
  sSql: String;
begin
  IdFormulario := fraEmpresa.Value;

  sSql :=
    'SELECT sa_nrointerno, sa_id' +
     ' FROM asa_solicitudafiliacion' +
    ' WHERE sa_idformulario = ' + SqlValue(fraEmpresa.Value);
  aSqlResults := ValoresColSQL(sSql);
  try
    if aSqlResults[0] = '' then
      aSqlResults[0] := '0';
    if aSqlResults[1] = '' then
      aSqlResults[1] := '0';
    NroInterno := StrToInt(aSqlResults[0]);
    fraEstablecimiento.Clear;
    fraEstablecimiento.ExtraCondition := ' AND se_fechabaja IS NULL AND se_idsolicitud = ' + aSqlResults[1];
  finally
    aSqlResults.Free;
  end;
end;

function TfrmCargaNominaDskSolicitud.GetComputerAndUserName: String;
begin
  Result := Format('%s/%s', [frmPrincipal.DBLogin.WindowsComputerName, frmPrincipal.DBLogin.UserID]);
end;

function TfrmCargaNominaDskSolicitud.QuitarCaracteresInvalidos(const aCadena: String): String;
var
  iLoop: Integer;
begin
  Result := '';

  for iLoop := 1 to Length(aCadena) do
    if aCadena[iLoop] in ['A'..'Z', 'a'..'z', 'ñ', 'Ñ', '.', ' ', ''''] then
      Result := Result + aCadena[iLoop]
    else
    begin
      if (aCadena[iLoop] = 'á') or (aCadena[iLoop] = 'à') then
        Result := Result + 'a';
      if (aCadena[iLoop] = 'é') or (aCadena[iLoop] = 'è') then
        Result := Result + 'e';
      if (aCadena[iLoop] = 'í') or (aCadena[iLoop] = 'ì') then
        Result := Result + 'i';
      if (aCadena[iLoop] = 'ó') or (aCadena[iLoop] = 'ò') then
        Result := Result + 'o';
      if (aCadena[iLoop] = 'ú') or (aCadena[iLoop] = 'ù') then
        Result := Result + 'u';

      if (aCadena[iLoop] = 'Á') or (aCadena[iLoop] = 'À') then
        Result := Result + 'A';
      if (aCadena[iLoop] = 'É') or (aCadena[iLoop] = 'È') then
        Result := Result + 'E';
      if (aCadena[iLoop] = 'Í') or (aCadena[iLoop] = 'Ì') then
        Result := Result + 'I';
      if (aCadena[iLoop] = 'Ó') or (aCadena[iLoop] = 'Ò') then
        Result := Result + 'O';
      if (aCadena[iLoop] = 'Ú') or (aCadena[iLoop] = 'Ù') then
        Result := Result + 'U';
    end;
end;

procedure TfrmCargaNominaDskSolicitud.btnVerFormatoClick(Sender: TObject);
begin
  MessageDlg(Format(
    'El Formato del archivo es:' + #13#10 +
    '* Extensión: .XLS' + #13#10 +
    '* Encabezado: Debe ingresarse encabezado' + #13#10 +
    '* Columnas:' + #13 + #10 +
    '           A) CUIL' + #13#10 +
    '           B) Apellido y Nombre' + #13#10 +
    '           C) Sexo (F/M)' + #13#10 +
    '           D) Nacionalidad' + #13#10 +
    '           E) Fecha Nacimiento (DD/MM/AAAA)' + #13#10 +
    '           F) Estado Civil (%s)' + #13#10 +
    '           G) Fecha Ingreso (DD/MM/AAAA)' + #13#10 +
    '           H) Nº Establecimiento' + #13#10 +
    '           I) Categoría' + #13#10 +
    '           J) Tarea' + #13#10 +
    '           K) Sector' + #13#10 +
    '           L) Código CIUO' + #13#10 +
    '           M) Sueldo' + #13#10 +
    '           N) Calle' + #13#10 +
    '           O) Número' + #13#10 +
    '           P) Piso' + #13#10 +
    '           Q) Departamento' + #13#10 +
    '           R) Código Postal' + #13#10 +
    '           S) Localidad' + #13#10 +
    '           T) Provincia' + #13#10 +
    '           U) Domicilio Completo' + #13#10 +
    '           V) Fecha Baja (DD/MM/AAAA)' + #13#10 +
    '           W) Motivo Baja' + #13#10 +
    '           X) Origen de Dato (MS=Mi Simplifiación/ ANX=Anexo/ DJMAN=DDJJ Manual/ INICIAL)' + #13#10 +
    '           Y) Confirmado en el Puesto (S/N)'+ #13#10 +
    '           Z) Tipo (ABM)',
    [FEstadosCiviles]), mtInformation, [mbOK], 0);
end;

procedure TfrmCargaNominaDskSolicitud.mnuIgnorarClick(Sender: TObject);
var
  sSql : String;
  iLoop : IntegeR;
begin
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'No hay ningún registro seleccionado.');
  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
    sSql := ' UPDATE tmp_afinomi SET mp_error = NULL, mp_valido = ''S'', mp_grave = ''N'' WHERE mp_cuil = :cuil AND mp_usuario = :usuario';
    EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('mp_cuil').AsString, GetComputerAndUserName]);
  end;
  sdqConsulta.Refresh;
end;

end.
