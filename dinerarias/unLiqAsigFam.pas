unit unLiqAsigFam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CurrEdit, Mask, ToolEdit, ArtComboBox, Db, SDEngine,
  ExtCtrls, artSeguridad, Placemnt, FormPanel;

type
  TfrmLiqAsigFam = class(TForm)
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    btnLiquidar: TBitBtn;
    gbUbicDenuncia: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edCodPostal: TEdit;
    edCPA: TEdit;
    edProv: TEdit;
    edDescProv: TEdit;
    edLocalidad: TEdit;
    Bevel3: TBevel;
    Bevel1: TBevel;
    dsLocalidad: TDataSource;
    sdqLocalidad: TSDQuery;
    cmbLocalidad: TArtComboBox;
    Label5: TLabel;
    dsPartidos: TDataSource;
    sdqPartidos: TSDQuery;
    Label6: TLabel;
    gbCalculoAsigFam: TGroupBox;
    Label7: TLabel;
    edAsigHijo: TCurrencyEdit;
    edAsigHijoDisc: TCurrencyEdit;
    edAsigAyuda: TCurrencyEdit;
    edAsigPrenatal: TCurrencyEdit;
    edAsigMatern: TCurrencyEdit;
    edAsigTotal: TCurrencyEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    btnLocPartido: TBitBtn;
    btnHijos: TBitBtn;
    btnEspeciales: TBitBtn;
    cmbPartidos: TArtComboBox;
    Seguridad: TSeguridad;
    FormStorage: TFormStorage;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbPartidosDropDown(Sender: TObject);
    procedure cmbLocalidadDropDown(Sender: TObject);
    procedure cmbLocalidadCloseUp(Sender: TObject);
    procedure btnLocPartidoClick(Sender: TObject);
    procedure btnLiquidarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnHijosClick(Sender: TObject);
    procedure btnEspecialesClick(Sender: TObject);
  private
    FSiniestro, FOrden, FRecaida, SecPartidoLoc, FIdTrabajador :Integer;
    FHabilitarAlta :Boolean;
    FCuit, FTipoIncap :String;
    FDesde, FHasta :TDateTime;
    SueldoPromedio, FAsigHijo, FAsigHijoDiscap, FAsigPrenatal, FAsigMatern,
    FAsigEscolar, FImpLiquidado, AsigTotal :Double;
    procedure HabilitarControles(bHabilitarAlta, bHabilitarBoton :Boolean);
    procedure DoLiquidarAsigFam(bPedirLocPartido :Boolean);
    procedure HabilitarDatosUbicDen(bHabilita :Boolean);
    procedure HabilitarPartidosUbicDen(bHabilita :Boolean);
    procedure HabilitarLocUbicDen(bHabilita :Boolean);
    procedure DoCalcularAsigFam(ProvinciaUbic, PartidoUbic, LocalidadUbic :String);
    procedure CargarUbicDen;
    procedure DoGuardarLocPartidoUbicDen;
    procedure DoActivarDatos;
    procedure DoRefrescarAsignaciones;
    function ExistenDatosLiqAsigFam :Boolean;
    function ExistenDatosAsigFam :Boolean;
    function DatosCompletosAsigFam(CPostal, Provincia, Localidad, Secuencia :String; Sueldo :Double;
                                   var LocalidadBusqueda, PartidoBusqueda, SecuenciaBusqueda :String;
                                   var bHabLocPartido, bHabLocalidad, bHabPartido :Boolean) :Boolean;
    function GetCantPeriodosAPagar :Integer;
    function GetCodMontoAsigFam(Provincia, Partido, Localidad :String) :Integer;
    function DoCalcularAsigFamHijo(MontoHijo :Double; MesesAntiguedadTrab, CantPeriodosAPagar :Integer) :Double;
    function DoCalcularAsigFamHijoDiscap(MontoHijoDiscap :Double; MesesAntiguedadTrab, CantPeriodosAPagar :Integer) :Double;
    function DoCalcularAsigFamEscolar(MontoAyudaEsc :Double; MesesAntiguedadTrab :Integer) :Double;
    function DoCalcularAsigFamPrenatal(MontoPrenatal :Double; MesesAntiguedadTrab :Integer) :Double;
    function DoCalcularAsigFamMatern(MontoMaternidad :Double; MesesAntiguedadTrab :Integer) :Double;
    function CalcularSueldoPromedio(sTipoIncapacidad :String) :Double;
    function GetDatosDenuncia(var CPostalUbic, CPostalAUbic, LocalidadUbic, ProvinciaUbic, ProvinciaDescrUbic,
                              ccoLocalidad, ccoPartido, ccoSecuencia_PartidoLoc :String) :Boolean;
    function ValidarUbicDen :Boolean;
  public
    property Siniestro: Integer       read FSiniestro       write FSiniestro;
    property Orden: Integer           read FOrden           write FOrden;
    property Recaida: Integer         read FRecaida         write FRecaida;
    property HabilitarAlta: Boolean   read FHabilitarAlta   write FHabilitarAlta;
    property IdTrabajador: Integer    read FIdTrabajador    write FIdTrabajador;
    property Cuit: String             read FCuit            write FCuit;
    property Desde: TDateTime         read FDesde           write FDesde;
    property Hasta: TDateTime         read FHasta           write FHasta;
    property TipoIncap: String        read FTipoIncap       write FTipoIncap;
    property ImpLiquidado :Double     read FImpLiquidado    write FImpLiquidado;
    property AsigHijo :Double         read FAsigHijo        write FAsigHijo;
    property AsigHijoDiscap :Double   read FAsigHijoDiscap  write FAsigHijoDiscap;
    property AsigPrenatal :Double     read FAsigPrenatal    write FAsigPrenatal;
    property AsigMatern :Double       read FAsigMatern      write FAsigMatern;
    property AsigEscolar :Double      read FAsigEscolar     write FAsigEscolar;
  end;

var
  frmLiqAsigFam: TfrmLiqAsigFam;

implementation

uses
  unArt, AnsiSql, unSesion, unDmPrincipal, CustomDlgs, uncomunes, General,
  DateTimeFuncs, unManAsigHijos, unManAsigEspeciales;

{$R *.DFM}

{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.ExistenDatosLiqAsigFam :Boolean;
//determina si existen datos cargados en las tablas de hijos o de
//asignaciones especiales para realizar el cálculo de las asignaciones familiares
var
  HayAsignHijos, HayAsignEspeciales :Boolean;
  sSql :String;
begin
  sSql := 'SELECT COUNT(*) ' +
           ' FROM sah_asign_hijos ' +
          ' WHERE ah_idtrabajador = ' + SqlInt(IdTrabajador) +
            ' AND (ah_fbaja IS NULL OR ah_fbaja >= ' + SqlDate(Desde) + ')';
  HayAsignHijos := (ValorSqlInteger(sSql) > 0);

  sSql := 'SELECT COUNT(*) ' +
           ' FROM sas_asign_especiales ' +
          ' WHERE as_idtrabajador = ' + SqlValue(IdTrabajador);
  HayAsignEspeciales := (ValorSqlInteger(sSql) > 0);

  if not(HayAsignHijos or HayAsignEspeciales) then
  begin
    MsgBox('Debe ingresar datos de asignaciones de los hijos o de asignaciones especiales');
    Result := False;
  end
  else Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.ExistenDatosAsigFam :Boolean;
//determina si existen los datos mínimos para realizar el cálculo
//de las asignaciones familiares
var
  sSql :String;
  FecIngresoTrab, FAccid :TDateTime;
  CPostalUbic, Dummy, LocalidadUbic, ProvinciaUbic :String;
begin
   Result := False;
  //valido los datos económicos - sueldo promedio
  if (CalcularSueldoPromedio(TipoIncap) = 0) then
  begin
    MsgBox('No se han encontrado liquidaciones para calcular el sueldo promedio');
    Exit;
  end;
  FAccid := ValorSqlDateTimeEx('SELECT ex_fechaaccidente ' +
                                ' FROM sex_expedientes ' +
                               ' WHERE ex_siniestro = :Sin ' +
                                 ' AND ex_orden = :Ord ' +
                                 ' AND ex_recaida = :Reca', [Siniestro, Orden, Recaida]);

  //valido fecha de ingreso del trabajador
  sSql := 'SELECT MAX(rl_fechaingreso) ' +
           ' FROM ctj_trabajador, crl_relacionlaboral ' +
          ' WHERE rl_contrato = NVL(art.afiliacion.get_contratovigente(' + SqlValue(Cuit) + ',' +
                                                                           SqlDate(FAccid) + '), ' +
                                  ' art.afiliacion.get_ultcontrato(' + SqlValue(Cuit) + ')) ' +
            ' AND tj_id = ' + SqlInt(IdTrabajador) +
            ' AND rl_idtrabajador = tj_id ' +
            ' AND TRUNC(rl_fechaingreso) <= ' + SqlDate(FAccid);
  FecIngresoTrab := ValorSqlDateTime(sSql);

  if (FecIngresoTrab = 0) then
  begin
    //la ultima fecha de ingreso posterior a la fecha de accidente
    sSql := 'SELECT MAX(hl_fechaingreso) ' +
             ' FROM ctj_trabajador, chl_historicolaboral a ' +
            ' WHERE hl_contrato = NVL(art.afiliacion.get_contratovigente(' + SqlValue(Cuit) + ',' +
                                                                             SqlDate(FAccid) + '), ' +
                                    ' art.afiliacion.get_ultcontrato(' + SqlValue(Cuit) + ')) ' +
              ' AND tj_id = ' + SqlInt(IdTrabajador) +
              ' AND hl_idtrabajador = tj_id ' +
              ' AND TRUNC(hl_fechaingreso) <= ' + SqlDate(FAccid) +
              ' AND hl_fechaalta = (SELECT MAX(b.hl_fechaalta) ' +
                                    ' FROM chl_historicolaboral b ' +
                                   ' WHERE b.hl_contrato = a.hl_contrato ' +
                                     ' AND b.hl_idtrabajador = a.hl_idtrabajador ' +
                                     ' AND b.hl_fechaingreso IS NOT NULL) ';

    FecIngresoTrab := ValorSqlDateTime(sSql);

    if (FecIngresoTrab = 0) then
    begin
      MsgBox('Falta la fecha de ingreso del trabajador a la empresa');
      Exit;
    end
    else if (FecIngresoTrab > Desde) then
    begin
      MsgBox('La fecha de ingreso del trabajador a la empresa es mayor que el período desde de la liquidación');
      Exit;
    end;
  end;

  //valida datos de la ubicación de la denuncia
  if not GetDatosDenuncia(CPostalUbic, Dummy, LocalidadUbic,
                          ProvinciaUbic, Dummy, Dummy, Dummy, Dummy) then
  begin
    MsgBox('Faltan los datos de la ubicación de la denuncia');
    Exit;
  end
  else begin
    if (CPostalUbic = '') then
    begin
      MsgBox('Faltan los datos del código postal de la ubicación de la denuncia');
      Exit;
    end
    else if (ProvinciaUbic = '') then
    begin
      MsgBox('Faltan los datos de la provincia de la ubicación de la denuncia');
      Exit;
    end
    else if (LocalidadUbic = '') then
    begin
      MsgBox('Faltan los datos de la localidad de la ubicación de la denuncia');
      Exit;
    end
    else begin
      sSql := 'SELECT 1 FROM Dual ' +
              ' WHERE EXISTS (SELECT 1 ' +
                              ' FROM cco_partidos_codigospostales ' +
                             ' WHERE co_codigopostal = ' + SqlValue(CPostalUbic) +
                               ' AND co_provincia = ' + SqlValue(ProvinciaUbic) + ')';
      if ValorSql(sSql) <> '1' then
      begin
        MsgBox('El código postal y la provincia de la ubicación de la denuncia no permiten determinar el partido');
        Exit;
      end;
    end;
  end;
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.HabilitarControles(bHabilitarAlta, bHabilitarBoton :Boolean);
begin
//si no se está dando de alta una nueva liquidación (ILT/ILP), se van a deshabilitar estos dos botones
  btnAceptar.Enabled  := bHabilitarAlta and bHabilitarBoton;
  btnLiquidar.Enabled := bHabilitarAlta and bHabilitarBoton;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.btnCancelarClick(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.DoLiquidarAsigFam(bPedirLocPartido :Boolean);
var
  ProvinciaUbic, LocalidadUbic, CPostalUbic, LocalidadBusqueda,
  PartidoBusqueda, SecBusqueda, SecUbic, sSql, Dummy2 :String;
  bHabLocPartido, bHabLoc, bHabPartido, bDatosCompletos :Boolean;
begin

  PartidoBusqueda     := cmbPartidos.Text;
  LocalidadBusqueda   := cmbLocalidad.Text;

  GetDatosDenuncia(CPostalUbic, Dummy2, LocalidadUbic, ProvinciaUbic, Dummy2, Dummy2, Dummy2, SecUbic);
  SueldoPromedio := CalcularSueldoPromedio(TipoIncap);

  bDatosCompletos := DatosCompletosAsigFam(CPostalUbic, ProvinciaUbic, LocalidadUbic, SecUbic,
                                           SueldoPromedio, LocalidadBusqueda, PartidoBusqueda, SecBusqueda,
                                           bHabLocPartido, bHabLoc, bHabPartido);

  HabilitarDatosUbicDen(bHabLocPartido);
  HabilitarLocUbicDen(bHabLoc);
  HabilitarPartidosUbicDen(bHabPartido);

  if bDatosCompletos then
  begin
    cmbPartidos.Text  := PartidoBusqueda;
    cmbLocalidad.Text := LocalidadBusqueda;
    SecPartidoLoc     := Iif(SecBusqueda <> '', StrToInt(SecBusqueda), 0);
    DoCalcularAsigFam(ProvinciaUbic, PartidoBusqueda, LocalidadBusqueda);
  end
  else if bHabPartido then
  begin
    sSql := 'SELECT distinct co_partido partido ' +
             ' FROM cco_partidos_codigospostales ' +
            ' WHERE co_codigopostal = ' + SqlValue(CPostalUbic) +
              ' AND co_provincia = ' + SqlValue(ProvinciaUbic) +
            ' ORDER BY 1';
    if (sSql <> sdqPartidos.SQL.Text) then
    begin
      sdqPartidos.Close;
      sdqPartidos.SQL.Text := sSql;
      sdqPartidos.Open;
    end;

    if bPedirLocPartido then
    begin
      MsgBox('Debe seleccionar el partido de la ubicación de la denuncia');
      cmbPartidos.SetFocus;
      Exit;
    end;

  end
  else if bHabLoc then
  begin
    sSql := 'SELECT distinct co_localidad localidades, co_secuencia secuencia ' +
             ' FROM cco_partidos_codigospostales ' +
            ' WHERE co_codigopostal = ' + SqlValue(CPostalUbic) +
              ' AND co_provincia = ' + SqlValue(ProvinciaUbic) +
              ' AND co_partido = ' + SqlValue(PartidoBusqueda) +
            ' ORDER BY 1';
    if (sSql <> sdqLocalidad.SQL.Text) then
    begin
      sdqLocalidad.Close;
      sdqLocalidad.SQL.Text := sSql;
      sdqLocalidad.Open;
    end;

    if bPedirLocPartido then
    begin
      MsgBox('Debe seleccionar la localidad de la ubicación de la denuncia, ya que ' +  LocalidadUbic + ' no existe en la nueva tabla de Códigos Postales Argentinos');
      cmbLocalidad.SetFocus;
      Exit;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.DatosCompletosAsigFam(CPostal, Provincia, Localidad, Secuencia :String; Sueldo :Double;
                                              var LocalidadBusqueda, PartidoBusqueda, SecuenciaBusqueda :String;
                                              var bHabLocPartido, bHabLocalidad, bHabPartido :Boolean) :Boolean;
//devuelve verdadero si no se deben ingresar datos adicionales de la ubicación
//de la denuncia (partido, localidad) para poder determinar los montos de las
//asignaciones familiares a considerar, que son tomados de la tabla smf_MontosAsigFamiliares
var
  sSql :String;
  CodMonto, Rows :Integer;
begin

  sSql := 'SELECT mf_codmonto ' +   //determino si hay un reg. con la prov. dada y con partido no nulo
           ' FROM smf_montosasigfamiliares ' +
          ' WHERE mf_provincia = ' + SqlValue(Provincia) +
            ' AND mf_partido IS NOT NULL ' +
            ' AND (mf_fechabaja IS NULL OR mf_fechabaja > ' + SqlDate(Hasta) + ')' +
            ' AND NVL(mf_tope, 9999999)= (SELECT MIN(NVL(mf_tope, 9999999)) ' +
                                          ' FROM smf_montosasigfamiliares ' +
                                         ' WHERE mf_provincia = ' + SqlValue(Provincia) +
                                           ' AND mf_partido IS NOT NULL ' +
                                           ' AND (mf_fechabaja IS NULL ' +
                                            ' OR mf_fechabaja > ' + SqlDate(Hasta) + ')' +
                                            ' AND NVL(mf_tope, 9999999) >= ' + SqlNumber(Sueldo) + ')';
  CodMonto := ValorSqlInteger(sSql);

  if (CodMonto = 0) then
  begin
    SecuenciaBusqueda := Secuencia;
    bHabLocPartido := False;
    Result := True;
  end
  else begin  //busco los partidos, para el cód. postal+provincia,
    if (PartidoBusqueda = '') then  //si aún no seleccionó ningún partido
    begin
      sSql := 'SELECT COUNT(DISTINCT co_partido) ' +
               ' FROM cco_partidos_codigospostales ' +
              ' WHERE co_codigopostal = ' + SqlValue(CPostal) +
                ' AND co_provincia = ' + SqlValue(Provincia);
      Rows := ValorSqlInteger(sSql);
      if (Rows = 1) then  //si hay un sólo partido (para el cód. postal+provincia), tomo ese partido
      begin
        sSql := 'SELECT DISTINCT co_partido partido ' +
                 ' FROM cco_partidos_codigospostales ' +
                ' WHERE co_codigopostal = ' + SqlValue(CPostal) +
                  ' AND co_provincia = ' + SqlValue(Provincia);
        PartidoBusqueda := ValorSql(sSql);
        bHabPartido     := False;
      end
      else begin  //sinó, el usuario debe seleccionar uno de los partidos
        bHabPartido := True;
        Result      := False;
        Exit;
      end;
    end
    else bHabPartido := False;

    if (LocalidadBusqueda = '') then  //si aún no seleccionó ninguna localidad,
    begin
      sSql := 'SELECT mf_codmonto ' +     //determino si hay un reg. con la prov. dada, el partido seleccionado y con la localidad exceptuada no nula
               ' FROM smf_montosasigfamiliares, sea_excepcionesmontosasig ' +
              ' WHERE mf_codmonto = ea_codmonto(+) ' +
                ' AND mf_provincia = ' + SqlValue(Provincia) +
                ' AND mf_partido = ' + SqlValue(PartidoBusqueda) +
                ' AND ea_localidadexceptuada IS NOT NULL ' +
                ' AND (mf_fechabaja IS NULL OR mf_fechabaja > ' + SqlDate(Hasta) + ')' +
                ' AND NVL(mf_tope, 9999999)= (SELECT MIN(NVL(mf_Tope, 9999999)) ' +
                                              ' FROM smf_montosasigfamiliares, sea_excepcionesmontosasig ' +
                                             ' WHERE mf_codmonto = ea_codmonto(+) ' +
                                               ' AND mf_provincia = ' + SqlValue(Provincia) +
                                               ' AND mf_partido = ' + SqlValue(PartidoBusqueda) +
                                               ' AND ea_localidadexceptuada IS NOT NULL ' +
                                               ' AND (mf_fechabaja IS NULL ' +
                                                ' OR mf_fechabaja > ' + SqlDate(Hasta) + ')' +
                                               ' AND NVL(mf_tope, 9999999) >= ' + SqlNumber(Sueldo) + ')';
      CodMonto := ValorSqlInteger(sSql);

      if (CodMonto = 0) then
      begin
        LocalidadBusqueda := Localidad;
        bHabLocalidad     := False;
        Result := True;
        Exit;
      end
      else begin
        sSql := 'SELECT 1 FROM dual' +          //determino si para el cód. postal, prov. y partido, la localidad existe en la tabla de códigos postales
                ' WHERE EXISTS (SELECT 1 ' +
                                ' FROM cco_partidos_codigospostales ' +
                               ' WHERE co_codigopostal = ' + SqlValue(CPostal) +
                                 ' AND co_provincia = ' + SqlValue(Provincia) +
                                 ' AND co_partido = ' + SqlValue(PartidoBusqueda) +
                                 ' AND co_localidad = ' + SqlValue(Localidad) + ')';

        if (ValorSql(sSql) = '1') then
        begin
          LocalidadBusqueda   := Localidad;
          bHabLocalidad       := False;
          Result := True;
          Exit;
        end
        else begin  //busco las localidades, para el cód. postal+provincia+partido
          sSql := 'SELECT COUNT(DISTINCT co_localidad) ' +
                   ' FROM cco_partidos_codigospostales ' +
                  ' WHERE co_codigopostal = ' + SqlValue(CPostal) +
                    ' AND co_provincia = ' + SqlValue(Provincia) +
                    ' AND co_partido = ' + SqlValue(PartidoBusqueda);
          Rows := ValorSqlInteger(sSql);

          if (Rows = 1) then  //si hay una sola localidad (para el cód. postal+provincia+partido), tomo esa localidad
          begin
            sSql := 'SELECT DISTINCT co_localidad localidad, co_secuencia secuencia ' +
                     ' FROM cco_partidos_codigospostales ' +
                    ' WHERE co_codigopostal = ' + SqlValue(CPostal) +
                      ' AND co_provincia = ' + SqlValue(Provincia) +
                      ' AND co_partido = ' + SqlValue(PartidoBusqueda);
            with GetQuery(sSql) do
            try
              LocalidadBusqueda := FieldByName('localidad').AsString;
              Secuencia         := FieldByName('secuencia').AsString;
            finally
              Free;
            end;
            bHabLocalidad     := False;
            Result            := True;
            Exit;
          end
          else begin //sinó, el usuario debe seleccionar uno de las localidades
            bHabLocalidad := True;
            Result := False;
            Exit;
          end;
        end;
      end;
    end;
  Result := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.HabilitarDatosUbicDen(bHabilita :Boolean);
//habilita/deshabilita los controles para cargar el partido
//y la localidad de la ubicación de la denuncia
begin
  HabilitarPartidosUbicDen(bHabilita);
  HabilitarLocUbicDen(bHabilita);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.HabilitarPartidosUbicDen(bHabilita :Boolean);
//habilita/deshabilita el control para cargar el partido de la ubicación de la denuncia
var
  sSql :String;
begin
  if not(cmbPartidos.ReadOnly) <> bHabilita then
  begin
    if bHabilita then
    begin
      cmbPartidos.Color     := clWhite;
      cmbPartidos.ReadOnly  := False;
    end
    else begin
      cmbPartidos.Color     := clBtnFace;
      cmbPartidos.ReadOnly  := True;

      sSql := 'SELECT co_partido partido ' +
               ' FROM cco_partidos_codigospostales ' +
              ' WHERE co_secuencia=-1';
      sdqPartidos.Close;
      sdqPartidos.SQL.Text := sSql;
      sdqPartidos.Open;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.HabilitarLocUbicDen(bHabilita :Boolean);
//habilita/deshabilita el control para cargar la localidad de la ubicación de la denuncia
var
  sSql :String;
begin
  if not(cmbLocalidad.ReadOnly) <> bHabilita then
  begin
    if bHabilita then
    begin
      cmbLocalidad.Color    := clWhite;
      cmbLocalidad.ReadOnly := False;
      btnLocPartido.Enabled := Seguridad.Claves.IsActive('GrabarLocalidadPartido');
    end
    else begin
      cmbLocalidad.Color    := clBtnFace;
      cmbLocalidad.ReadOnly := True;
      sSql := 'SELECT co_localidad localidades, co_secuencia secuencia ' +
               ' FROM cco_partidos_codigospostales ' +
              ' WHERE co_secuencia=-1';
      sdqLocalidad.Close;
      sdqLocalidad.SQL.Text := sSql;
      sdqLocalidad.Open;
      btnLocPartido.Enabled := False;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.DoCalcularAsigFam(ProvinciaUbic, PartidoUbic, LocalidadUbic :String);
//calcula los distintos conceptos de las asignaciones familiares y el total de los mismos
var
  MontoHijo, MontoAyudaEscolar, MontoHijoDiscap, MontoPrenatal, MontoMaternidad :Double;
  CodMontoAsign, MesesAntiguedadTrab, CantPeriodosAPagar :Integer;
  FecIngresoTrab :TDateTime;
  sSql :String;
begin

  //cantidad de períodos a abonar por cada tipo de asignación (hijos e hijos discapacitados)
  CantPeriodosAPagar := GetCantPeriodosAPagar;
  //montos de las asignaciones familiares, según provincia y salario
  CodMontoAsign := GetCodMontoAsigFam(ProvinciaUbic, PartidoUbic, LocalidadUbic);

  sSql := 'SELECT NVL(mf_hijo, 0) hijo, NVL(mf_hijodiscapacitado, 0) disca, ' +
                ' NVL(mf_ayudaescolar, 0) esco ' +
           ' FROM smf_montosasigfamiliares ' +
          ' WHERE mf_codmonto = :monto ';
  with GetQueryEx(sSql, [CodMontoAsign]) do
  try
    MontoHijo         := FieldByName('hijo').AsFloat;
    MontoHijoDiscap   := FieldByName('disca').AsFloat;
    MontoAyudaEscolar := FieldByName('esco').AsFloat;
    MontoPrenatal     := MontoHijo;
  finally
    Free;
  end;

  MontoMaternidad := ImpLiquidado; //porque el sueldo completo se toma como la asignacion por maternidad

  //antiguedad del trabajador, en meses
  sSql := 'SELECT dl_fecingreso FROM cdl_datoslaborales ' +
          ' WHERE dl_cuit = ' + SqlValue(Cuit)  +
            ' AND dl_idtrabajador = ' + SqlInt(IdTrabajador);
  FecIngresoTrab := ValorSqlDateTime(sSql);

  if (FecIngresoTrab = 0) then
  begin
    sSql := 'SELECT chl.hl_fechaingreso ' +
             ' FROM chl_historicolaboral chl, aco_contrato aco, aem_empresa aem, ctj_trabajador ' +
            ' WHERE chl.hl_contrato = aco.co_contrato ' +
              ' AND aco.co_idempresa = aem.em_id ' +
              ' AND chl.hl_idtrabajador =  tj_id ' +
              ' AND em_cuit = ' +  SqlValue(Cuit) +
              ' AND tj_id = ' + SqlInt(IdTrabajador);
    FecIngresoTrab := ValorSqlDateTime(sSql);
  end;

  MesesAntiguedadTrab := MonthsBetween(FecIngresoTrab, Desde);

  AsigHijo        := DoCalcularAsigFamHijo(MontoHijo, MesesAntiguedadTrab, CantPeriodosAPagar);
  AsigHijoDiscap  := DoCalcularAsigFamHijoDiscap(MontoHijoDiscap, MesesAntiguedadTrab, CantPeriodosAPagar);
  AsigEscolar     := DoCalcularAsigFamEscolar(MontoAyudaEscolar, MesesAntiguedadTrab);
  AsigPrenatal    := DoCalcularAsigFamPrenatal(MontoPrenatal, MesesAntiguedadTrab);
  AsigMatern      := DoCalcularAsigFamMatern(MontoMaternidad, MesesAntiguedadTrab);
  DoRefrescarAsignaciones;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.GetCantPeriodosAPagar :Integer;
//devuelve la cantidad de períodos que deben abonarse por cada tipo de asignación familiar
var
  sSql :String;
begin
  sSql := 'SELECT art.liq.get_cantperiodosapagar (' + SqlValue(TipoIncap) + ',' +
           SqlDate(Desde) + ',' + SqlDate(Hasta) + ',' + SqlInt(Siniestro) + ',' +
           SqlInt(Orden) + ',' + SqlInt(Recaida) + ') FROM dual';
  Result := ValorSqlInteger(sSql);
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.GetCodMontoAsigFam(Provincia, Partido, Localidad :String) :Integer;
//dados el código de provincia, el partido, la localidad y el sueldo, devuelve el código de
//monto asociado, que identifica un reg. de la tabla de montos de asignaciones familiares
var
  sSql :String;
begin
  sSql := 'SELECT art.liq.get_codmontoasigfamiliares (' + SqlValue(Provincia) + ',' +
           SqlValue(Partido) + ',' + SqlValue(Localidad) + ',' + SqlNumber(SueldoPromedio) + ',' +
           SqlDate(Hasta) + ') FROM dual';
  Result := ValorSqlInteger(sSql);
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.DoCalcularAsigFamHijo(MontoHijo :Double; MesesAntiguedadTrab, CantPeriodosAPagar :Integer) :Double;
//calcula las asignaciones familiares por hijo
var
  sSql :String;
begin
  sSql := 'SELECT art.liq.get_asigfamiliareshijo (' + SqlInt(IdTrabajador) + ',' +
          SqlNumber(MontoHijo) + ',' + SqlDate(Desde) + ',' + SqlDate(Hasta) + ',' +
          SqlInt(MesesAntiguedadTrab) + ',' + SqlInt(CantPeriodosAPagar) + ') FROM dual';
  Result := ValorSqlExtended(sSql);
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.DoCalcularAsigFamHijoDiscap(MontoHijoDiscap :Double; MesesAntiguedadTrab, CantPeriodosAPagar :Integer) :Double;
//calcula las asignaciones familiares por hijo discapacitado
var
  sSql :String;
begin
  sSql := 'SELECT art.liq.get_asigfamiliareshijodisc (' + SqlInt(IdTrabajador) + ',' +
          SqlNumber(MontoHijoDiscap) + ',' + SqlDate(Desde) + ',' + SqlDate(Hasta) + ',' +
          SqlInt(MesesAntiguedadTrab) + ',' + SqlInt(CantPeriodosAPagar) + ') FROM dual';
  Result := ValorSqlExtended(sSql);
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.DoCalcularAsigFamEscolar(MontoAyudaEsc :Double; MesesAntiguedadTrab :Integer) :Double;
// calcula las asignaciones familiares por ayuda escolar
var
  sSql :String;
begin
  sSql := 'SELECT art.liq.get_asigfamiliaresayudaescolar (' + SqlInt(IdTrabajador) + ',' +
          SqlNumber(MontoAyudaEsc) + ',' + SqlDate(Desde) + ',' + SqlDate(Hasta) + ',' +
          SqlInt(MesesAntiguedadTrab) + ') FROM dual';
  Result := ValorSqlExtended(sSql);
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.DoCalcularAsigFamPrenatal(MontoPrenatal :Double; MesesAntiguedadTrab :Integer) :Double;
//calcula las asignaciones familiares por prenatal
var
  sSql :String;
begin
  sSql := 'SELECT art.liq.get_asigfamiliaresprenatal (' + SqlValue(TipoIncap) + ',' +
           SqlInt(Siniestro) + ',' + SqlInt(Orden) + ',' + SqlInt(Recaida) + ',' +
           SqlInt(IdTrabajador) + ',' + SqlNumber(MontoPrenatal) + ',' +
           SqlDate(Desde) + ',' + SqlDate(Hasta) + ',' + SqlInt(MesesAntiguedadTrab) + ') FROM dual';
  Result := ValorSqlExtended(sSql);
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.DoCalcularAsigFamMatern(MontoMaternidad :Double; MesesAntiguedadTrab :Integer) :Double;
//calcula las asignaciones familiares por maternidad
var
  sSql :String;
begin
  sSql := 'SELECT art.liq.get_asigfamiliaresmaternidad (' + SqlInt(IdTrabajador) + ',' +
            SqlNumber(MontoMaternidad) + ',' + SqlDate(Desde) + ',' +
            SqlDate(Hasta) + ',' + SqlInt(MesesAntiguedadTrab) + ') FROM dual';
  Result := ValorSqlExtended(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.CargarUbicDen;
//carga los datos de la ubicación de la denuncia
var
  CPostalUbic, CPostalAUbic, LocalidadUbic, ProvinciaUbic,
  ProvinciaDescrUbic, ccoLocalidad, ccoPartido, ccoSecPartidoLoc :String;
begin

  if GetDatosDenuncia(CPostalUbic, CPostalAUbic, LocalidadUbic, ProvinciaUbic,
                      ProvinciaDescrUbic, ccoLocalidad, ccoPartido, ccoSecPartidoLoc) then
  begin
    edCodPostal.Text    := CPostalUbic;
    edCPA.Text          := CPostalAUbic;
    edLocalidad.Text    := LocalidadUbic;
    edProv.Text         := ProvinciaUbic;
    edDescProv.Text     := ProvinciaDescrUbic;
    cmbLocalidad.Text   := ccoLocalidad;
    cmbPartidos.Text    := ccoPartido;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.FormShow(Sender: TObject);
begin
  DoActivarDatos;
  CargarUbicDen;
  //HabilitarDatosUbicDen(True);
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.CalcularSueldoPromedio(sTipoIncapacidad :String) :Double;
//calcula el sueldo promedio de los últimos 6 meses
var
  sSql :String;
begin
  sSql := 'SELECT art.liq.get_sueldopromedio (' + SqlValue(sTipoIncapacidad) + ',' +
            SqlDate(FDesde) + ',' + SqlInt(Siniestro) + ',' +
            SqlInt(Orden) + ',' + SqlInt(Recaida) + ') FROM dual';
  Result := ValorSqlExtended(sSql);
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.GetDatosDenuncia(var CPostalUbic, CPostalAUbic, LocalidadUbic, ProvinciaUbic,
                                         ProvinciaDescrUbic, ccoLocalidad, ccoPartido, ccoSecuencia_PartidoLoc :String) :Boolean;
//dados los datos del siniestro, devuelve el cód. postal, localidad y provincia de la ubicación de la denuncia
var
  sSql :String;
begin
  sSql := 'SELECT ub_cpostal, ub_cpostala, ub_localidad, ub_provincia, ' +
                ' pv_descripcion, co_localidad, co_partido, ' +
                ' ub_secuencia_partidoloc, ub_siniestro ' +
           ' FROM cco_partidos_codigospostales, sub_ubicaciones, cpv_provincias ' +
          ' WHERE ub_siniestro = :Sin ' +
            ' AND ub_orden = :Ord ' +
            ' AND ub_recaida = :Reca ' +
            ' AND ub_provincia = pv_codigo(+) ' +
            ' AND ub_secuencia_partidoloc = co_secuencia(+) ';
  with GetQueryEx(sSql, [Siniestro, Orden, Recaida]) do
  try
    CPostalUbic               := FieldByName('ub_cpostal').AsString;
    CPostalAUbic              := FieldByName('ub_cpostala').AsString;
    LocalidadUbic             := FieldByName('ub_localidad').AsString;
    ProvinciaUbic             := FieldByName('ub_provincia').AsString;
    ProvinciaDescrUbic        := FieldByName('pv_descripcion').AsString;
    ccoLocalidad              := FieldByName('co_localidad').AsString;
    ccoPartido                := FieldByName('co_partido').AsString;
    ccoSecuencia_PartidoLoc   := FieldByName('ub_secuencia_partidoloc').AsString;
    Result := (FieldByName('ub_siniestro').AsInteger <> 0);
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.cmbPartidosDropDown(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT distinct co_partido partido ' +
           ' FROM cco_partidos_codigospostales ' +
          ' WHERE co_codigopostal = ' + SqlValue(edCodPostal.Text);
  if (sSql <> sdqPartidos.SQL.Text) then
  begin
    sdqPartidos.Close;
    sdqPartidos.SQL.Text := sSql;
    sdqPartidos.Open;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.cmbLocalidadDropDown(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT co_localidad localidades, co_secuencia secuencia ' +
           ' FROM cco_partidos_codigospostales ' +
          ' WHERE co_codigopostal = ' + SqlValue(edCodPostal.Text);
  if (sSql <> sdqLocalidad.SQL.Text) then
  begin
    sdqLocalidad.Close;
    sdqLocalidad.SQL.Text := sSql;
    sdqLocalidad.Open;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.cmbLocalidadCloseUp(Sender: TObject);
begin
  if sdqLocalidad.Eof then
    SecPartidoLoc := 0
  else begin
    if (cmbLocalidad.Text = sdqLocalidad.FieldByName('LOCALIDADES').AsString) then
      SecPartidoLoc := Nvl(sdqLocalidad.FieldByName('SECUENCIA').AsInteger, 0);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.btnLocPartidoClick(Sender: TObject);
begin
  if ValidarUbicDen then
  begin
    DoGuardarLocPartidoUbicDen;
    MessageBox(0, 'Los datos se grabaron correctamente.', '', MB_ICONINFORMATION or MB_OK);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAsigFam.ValidarUbicDen :Boolean;
begin
  Verificar(Trim(edCodPostal.Text) = '', edCodPostal, 'Solo puede grabar datos de la loc./partido si se ha cargado el código postal de la misma');
  Verificar(SecPartidoLoc = 0, cmbPartidos, 'Debe ingresar la localidad/partido de la ubicación de la denuncia');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.DoGuardarLocPartidoUbicDen;
//graba la localidad/partido de la ubicación de la denuncia
var
  sSql :String;
begin
  try
    sSql := 'art.siniestro.do_actualizarlocalidadpartido(' + SqlInt(Siniestro) + ',' +
             SqlInt(Orden) + ',' + SqlInt(Recaida) + ',' + SqlInt(SecPartidoLoc) + ',' +
             SqlValue(Sesion.UserID) + ', ''REDPRES'');';
    EjecutarStore(sSql);
  except
    on E: Exception do ErrorMsg(E, 'No se han podido guardar los cambios.');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.btnLiquidarClick(Sender: TObject);
begin
  DoLiquidarAsigFam(True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.btnAceptarClick(Sender: TObject);
begin
  if ValidarUbicDen then
  begin
    DoGuardarLocPartidoUbicDen;
    ModalResult := mrOk;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.btnHijosClick(Sender: TObject);
begin
  with TfrmManAsigHijos.Create(Self) do
  try
    IdTrabajador := Self.IdTrabajador;
    Execute;
  finally
    Free;
  end;
  DoActivarDatos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.DoActivarDatos;
begin
  if HabilitarAlta then
  begin
    if ExistenDatosLiqAsigFam then
    begin
      if ExistenDatosAsigFam then
      begin
        HabilitarControles(HabilitarAlta, True);
        DoLiquidarAsigFam(False);
      end
      else HabilitarControles(HabilitarAlta, False);
    end
    else HabilitarControles(HabilitarAlta, False);
  end
  else begin
    DoRefrescarAsignaciones;
    HabilitarControles(HabilitarAlta, False);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.DoRefrescarAsignaciones;
begin
  AsigTotal             := AsigHijo + AsigHijoDiscap + AsigEscolar + AsigPrenatal + AsigMatern;
  edAsigHijo.Value      := AsigHijo;
  edAsigHijoDisc.Value  := AsigHijoDiscap;
  edAsigAyuda.Value     := AsigEscolar;
  edAsigPrenatal.Value  := AsigPrenatal;
  edAsigMatern.Value    := AsigMatern;
  edAsigTotal.Value     := AsigTotal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAsigFam.btnEspecialesClick(Sender: TObject);
begin
  with TfrmManAsigEspeciales.Create(Self) do
  try
    IdTrabajador := Self.IdTrabajador;
    Execute;
  finally
    Free;
  end;
  DoActivarDatos;
end;
{-------------------------------------------------------------------------------}
end.
