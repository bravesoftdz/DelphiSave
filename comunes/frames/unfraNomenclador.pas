{SON_NOMENCLADOR}
unit unfraNomenclador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, ArtComboBox, StdCtrls, PatternEdit, Db, SDEngine, Menus,
  ImgList, FormPanel, LookupDialog, SinEdit, ExtCtrls, unARTFrame, RxToolEdit;

type
  TfraNomenclador = class(TArtFrame)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    PopupMenu: TPopupMenu;
    mnuLimpiar: TMenuItem;
    N1: TMenuItem;
    mnuPropiedades: TMenuItem;
    ImageList: TImageList;
    fpPropiedades: TFormPanel;
    sdqDatosON_NOMENCLADOR: TStringField;
    sdqDatosON_CAPITULO: TStringField;
    sdqDatosON_CODIGO: TStringField;
    sdqDatosON_DESCRIPCION: TStringField;
    sdqDatosON_INCLUYE: TStringField;
    sdqDatosON_EXCLUYE: TStringField;
    sdqDatosVAL_PRESTACION: TFloatField;
    sdqDatosON_FECHABAJA: TDateTimeField;
    pnlIncluyeExcluye: TPanel;
    grpExcluye: TGroupBox;
    edExcluye: TMemo;
    grpIncluye: TGroupBox;
    edIncluye: TMemo;
    sdqDatosON_ANESTESIA: TStringField;
    sdqDatosON_HIV: TStringField;
    sdqDatosON_ANTITETANICA: TStringField;
    sdqDatosON_SESIONES: TFloatField;
    sdqDatosON_ID: TFloatField;
    sdqDatosTB_ESPECIAL2: TStringField;
    sdqDatosIDPRESUP: TFloatField;
    sdqDatosVAL_HONORARIOS: TFloatField;
    sdqDatosVAL_GASTOS: TFloatField;
    sdqDatosVIGENCIADESDE: TDateTimeField;
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                          var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edNomencladorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodigoExit(Sender: TObject);
    procedure mnuLimpiarClick(Sender: TObject);
    procedure mnuPropiedadesClick(Sender: TObject);
    procedure fpPropiedadesResize(Sender: TObject);
    procedure fpPropiedadesKeyPress(Sender: TObject; var Key: Char);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
  private
    edNomenclador: TPatternEdit;
    edCapitulo: TPatternEdit;
    edCodigo: TPatternEdit;
    cmbDescripcion: TLookupComboDlg;
    
    FShowBajas, FShowPresup, FSoloPresup, FShowConsumidos, FShowVigencias,  FShowCabecera,
    FSoloEspecial1, FPresupSinPrestador, FShowOtrosVal, FExigePrestacion, FShowAbonos,
    FOcultarValorNulo, FEsDeAMP, FMostrarUtilizado : Boolean;
    FSql: String;
    FPrestador, FPrestadorPres, FIdNomenclador, FPresupuesto: Integer;
    FSiniestro: TSiniestro;
    FFechaSolicitud, FVigencia, FVigenciaDesde: TDateTime;
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    function GetSql: String;
    function SqlWhere : String;
    function GetReadOnly: Boolean;
    procedure SetReadOnly(const Value: Boolean);
    procedure SetPrestador(const Value: Integer);
    function IncluyeNomenclador (vIdPrestador: Integer):Boolean;
    procedure DoHabilitarNomenclador;
    function GetCapitulo: String;
    function GetCodigo: String;
    function GetNomenclador: String;
    function GetDescripcion: String;
    procedure SetFechaSolicitud(const Value: TDateTime);
    function GetSqlPresup(bSoloExiste: Boolean): String;
    function GetSqlEspecial1: String;
    function GetSqlAMP: String;
    function GetSqlCabecera: String;    
  protected
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Limpiar;
    procedure Clear; override;
    procedure DoLostFocus;
    procedure Cargar(ANomenclador, ACapitulo, ACodigo : String; OnlyValids : Boolean = False); overload;
    procedure Cargar(AIdNomenclador: Integer; OnlyValids : Boolean = False); overload;
    procedure SetColors(AColor : TColor);
    procedure AfterConstruction; override;
    function  IsSelected :Boolean;
    function  IsPresup :Boolean;
    function  CompareValues(ANomenclador, ACapitulo, ACodigo : String) :Boolean;
    procedure SetFocus; override;
  published
    property ShowBajas          : Boolean      read FShowBajas          write FShowBajas          default False;
    property Modified           : Boolean      read GetModified         write SetModified;
    property ReadOnly           : Boolean      read GetReadOnly         write SetReadOnly;
    property Sql                : String       read GetSql              write FSql;
    property Prestador          : Integer      read FPrestador          write SetPrestador        default -1;
    property Siniestro          : TSiniestro   read FSiniestro          write FSiniestro;
    property FechaSolicitud     : TDateTime    read FFechaSolicitud     write SetFechaSolicitud;
    property Vigencia           : TDateTime    read FVigencia           write FVigencia;
    property VigenciaDesde      : TDateTime    read FVigenciaDesde      write FVigenciaDesde;
    property IdNomenclador      : Integer      read FIdNomenclador      write FIdNomenclador      default -1;
    property ShowPresup         : Boolean      read FShowPresup         write FShowPresup         default False;
    property SoloPresup         : Boolean      read FSoloPresup         write FSoloPresup         default False;
    property ShowConsumidos     : Boolean      read FShowConsumidos     write FShowConsumidos     default False;
    property ShowVigencias      : Boolean      read FShowVigencias      write FShowVigencias      default False;
    property SoloEspecial1      : Boolean      read FSoloEspecial1      write FSoloEspecial1      default False;
    property PrestadorPres      : Integer      read FPrestadorPres      write FPrestadorPres      default 0;
    property Presupuesto        : Integer      read FPresupuesto        write FPresupuesto        default 0;
    property PresupSinPrestador : Boolean      read FPresupSinPrestador write FPresupSinPrestador default False;
    property ExigePrestacion    : Boolean      read FExigePrestacion    write FExigePrestacion    default False;    // Lu por WF 8140 y arreglos grales.
    property OcultarValorNulo   : Boolean      read FOcultarValorNulo   write FOcultarValorNulo;      // TK 21117 property para ver si se quiere mostrar los valores "0.01" // Ahora se modifica por no mostrar los valores "0" 08/09/2011
    property ShowAbonos         : Boolean      read FShowAbonos         write FShowAbonos;
    property EsDeAMP            : Boolean      read FEsDeAMP            write FEsDeAMP            default False;
    property ShowCabecera       : Boolean      read FShowCabecera       write FShowCabecera       default False;  // Por el cambio de Cabecera
    property MostrarUtilizado   : Boolean      read FMostrarUtilizado   write FMostrarUtilizado   default False;  // TK 32945

    property Nomenclador        : String       read GetNomenclador;
    property Capitulo           : String       read GetCapitulo;
    property Codigo             : String       read GetCodigo;
    property Descripcion        : String       read GetDescripcion;    
  end;

implementation

uses
  General, unDmPrincipal, StrFuncs, SqlOracle, ValFuncs, VCLExtra;

Const
    OrderBy = ' ORDER BY ON_CAPITULO, ON_DESCRIPCION';

{$R *.DFM}

{ TfraNomenclador }

procedure TfraNomenclador.Cargar(ANomenclador, ACapitulo, ACodigo: String; OnlyValids: Boolean);
var
  Sql : String;
begin
  cmbDescripcion.DataSource := dsDatos;
  Sql := GetSql + ' AND on_nomenclador = ' + SqlValue(ANomenclador) +
                  ' AND on_capitulo =  ' + SqlValue(ACapitulo) +
                  ' AND on_codigo = ' + SqlValue(ACodigo) +
                   IIF(OnlyValids, 'AND on_fechabaja IS NULL', '');
  if OpenQuery(sdqDatos, Sql, True) then
    cmbDescripcionCloseUp(Nil);
end;

procedure TfraNomenclador.Cargar(AIdNomenclador: Integer; OnlyValids: Boolean);
var
  Sql :String;
begin
  cmbDescripcion.DataSource := dsDatos;
  IdNomenclador := AIdNomenclador;
  Sql := GetSql + ' AND on_id = ' + SqlInt(IdNomenclador) +
                   IIF(OnlyValids, ' AND on_fechabaja IS NULL', '');

  if OpenQuery(sdqDatos, Sql, True) then
    cmbDescripcionCloseUp(Nil);
end;

constructor TfraNomenclador.Create(AOwner: TComponent);
begin
  inherited;
  edNomenclador  := TPatternEdit(Self.FindComponent('edNomenclador'));
  edCapitulo     := TPatternEdit(Self.FindComponent('edCapitulo'));
  edCodigo       := TPatternEdit(Self.FindComponent('edCodigo'));
  cmbDescripcion := TLookupComboDlg(Self.FindComponent('cmbDescripcion'));
  FShowBajas     := False;
  FShowOtrosVal  := True;
  FShowAbonos    := True;
  FPrestador     := -1;
  FIdNomenclador := -1;
  FSql           := '';
  FPrestadorPres := 0;
  cmbDescripcion.DataSource := dsDatos;
end;

procedure TfraNomenclador.DoLostFocus;
begin
  if cmbDescripcion.CanFocus then
  begin
     cmbDescripcion.SetFocus;
     SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

function TfraNomenclador.GetModified: Boolean;
begin
  Result := edNomenclador.Modified  or
            edCapitulo.Modified     or
            edCodigo.Modified       or
            cmbDescripcion.Modified;
end;

function TfraNomenclador.GetSql: String;
var
  sqlUnion, sqlPresup, sqlPresupAux, sqlEspecial1, sqlUnion2, a, sqlAbonos,
  sqlValorNulo, sqlValorNulo1, sqlValAMP, sqlAMP, sqlVigHasta, sqlSolicitud,
  sqlCabecera, sqlMostrarUtilizado: String;
begin
{esto es un pequeño despelote, pero un despelote ordenado ehhhh!!}
   if FSql = '' then
   begin
      sqlValAMP     := ' AND NVL(vp_valordeamp, ''N'') = ' + SqlBoolean(EsDeAMP);
      sqlAMP        := GetSqlAMP;
      sqlVigHasta   := IIF(FShowVigencias, '', IIF(Vigencia > 0, ' AND ' + SqlDate(Vigencia) +
                                                                 ' BETWEEN vp_vigenciadesde AND NVL(vp_vigenciahasta, ' + SqlDate(Vigencia) + ') ',
                                                                 ' AND vp_vigenciahasta IS NULL '));

      sqlSolicitud  := ' AND NVL(' + SqlDate(FechaSolicitud) + ', art.actualdate) >= vp_vigenciadesde ';
      sqlValorNulo  := IIF(OcultarValorNulo, ' AND ((NVL (vp_suma_fija, NVL(art.amebpba.get_val_prestacion(vp_prestador, on_nomenclador, on_capitulo, on_codigo, ' +
                                               SqlInt(FSiniestro.Siniestro) + ', ' + SqlInt(FSiniestro.Orden) + ', ' + SqlInt(FSiniestro.Recaida) + ', ' +
                                               SqlDate(FFechaSolicitud) + '), 0)) <> 0) or ( (nvl(vp_valorhonorarios, 0) + nvl(vp_valorgastos, 0) ) > 0) ) ', '');   // TK 21117  // TK por el error de valor <> 0

      sqlValorNulo1 := IIF(OcultarValorNulo, ' AND NVL(art.amebpba.get_val_prestacion (a.up_prestador, on_nomenclador, on_capitulo, on_codigo, ' +
                                               SqlInt(FSiniestro.Siniestro) + ', ' + SqlInt(FSiniestro.Orden) + ', ' + SqlInt(FSiniestro.Recaida) + ', ' +
                                               SqlDate(FFechaSolicitud) + '), 0) <> 0 ', '');  // TK 21117


      sqlAbonos     := IIF(ShowAbonos, '', ' AND on_capitulo <> ''AB'' ');
      sqlMostrarUtilizado := IIF(MostrarUtilizado, '', ' AND NVL(vp_utilizado_ul, ''N'') <> ''S'' ');  // TK 32945
      sqlCabecera   := GetSqlCabecera;
      sqlEspecial1  := GetSqlEspecial1;
      sqlPresupAux  := 'SELECT on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion, on_honorarios, ' +
                             ' on_gastos, on_incluye, on_excluye, on_fechabaja, on_anestesia, on_hiv, on_antitetanica, ' +
                             ' on_sesiones, art.amebpba.get_val_prestacion(NVL(' + SqlInt(FPrestador) + ',0), ' +
                             ' on_nomenclador, on_capitulo, on_codigo, ' + SqlInt(FSiniestro.Siniestro) + ', ' +
                               SqlInt(FSiniestro.Orden) + ', ' + SqlInt(FSiniestro.Recaida) + ', ' +
                               SqlDate(FFechaSolicitud) + ') val_prestacion, tb_especial2, 0 idpresup, ' +
                             ' on_honorarios val_honorarios, on_gastos val_gastos, to_date(null) vigenciadesde ' +
                        ' FROM art.son_nomenclador, art.ctb_tablas' +
                       ' WHERE on_capitulo = tb_codigo ' +
                         ' AND tb_clave = ''TNOME'' ' +
                         ' AND tb_especial2 = ''S'' ' +  //los presupuestos
                           sqlEspecial1 + sqlAMP + sqlCabecera;
      if PresupSinPrestador then //si son los presupuestos sin cruzar con los prestadores (spp_prestador_presupuesto)
        sqlPresup := ' UNION ' + sqlPresupAux
      else //los presupuestos cruzando con la spp_prestador_presupuesto
        sqlPresup := ' UNION ' + GetSqlPresup(False);

      if SoloPresup then //si son sólo los presupuestos sin nada mas
        Result := sqlPresupAux
      else if (FPrestador > -1) then
      begin
        if not(ShowPresup) then sqlPresup := '';

        //------------------------------------------------
        if IncluyeNomenclador(FPrestador) then
          sqlUnion :=  ' UNION ' +
                       ' SELECT on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion, on_honorarios, ' +
                              ' on_gastos, on_incluye, on_excluye, on_fechabaja, on_anestesia, on_hiv, on_antitetanica, ' +
                              ' on_sesiones, art.amebpba.get_val_prestacion(NVL(' + SqlInt(FPrestador) + ',0), ' +
                              ' on_nomenclador, on_capitulo, on_codigo, ' + SqlInt(FSiniestro.Siniestro) + ', ' +
                              SqlInt(FSiniestro.Orden) + ', ' + SqlInt(FSiniestro.Recaida) + ', ' +
                              SqlDate(FFechaSolicitud) + ') val_prestacion, tb_especial2, 0 idpresup, ' +
                              ' on_honorarios val_honorarios, on_gastos val_gastos, to_date(null) vigenciadesde ' +
                         ' FROM art.ctb_tablas, art.son_nomenclador ' +
                        ' WHERE on_capitulo = tb_codigo ' +
                          ' AND tb_clave = ''TNOME'' ' +
                          ' AND substr(tb_especial1, 1, 1) = ''S'' AND tb_especial2 = ''N'' ' +
                          ' AND ( nvl(on_honorarios, 0) + nvl(on_gastos, 0) > 0 ) ' +
                          sqlAbonos + sqlAMP + sqlCabecera
        else
          sqlUnion :=  ' UNION ' +
                       ' SELECT on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion, on_honorarios, ' +
                              ' on_gastos, on_incluye, on_excluye, on_fechabaja, on_anestesia, on_hiv, on_antitetanica, ' +
                              ' on_sesiones, art.amebpba.get_val_prestacion (a.up_prestador, on_nomenclador, on_capitulo, ' +
                              ' on_codigo, NULL, NULL, NULL, ' + SqlDate(FechaSolicitud) + ') val_prestacion, ' +
                              ' tb_especial2, 0 idpresup, on_honorarios val_honorarios, on_gastos val_gastos, ' +
                              ' a.up_vigenciadesde vigenciadesde ' +
                         ' FROM art.ctb_tablas, art.son_nomenclador, art.sup_unidadprestador a, art.sup_unidadprestador b ' +
                        ' WHERE on_tipohonorario = a.up_unidad ' +
                          ' AND on_tipogasto = b.up_unidad ' +
                          ' AND tb_clave = ''TNOME'' ' +
                          ' AND on_capitulo = tb_codigo ' +
		                      ' AND substr(tb_especial1, 1, 1) = ''S'' ' +
                          ' AND ( nvl(on_honorarios, 0) + nvl(on_gastos, 0) > 0) ' +
                          ' AND a.up_prestador = ' + SqlInt(FPrestador) +
                          ' AND a.up_prestador = b.up_prestador ' +
                          ' AND on_fechabaja IS NULL ' +
                          ' AND a.up_fechabaja IS NULL ' +
                          ' AND b.up_fechabaja IS NULL ' +
                          IIF(FShowVigencias, '',
                                              ' AND (NVL(' + SqlDate(FechaSolicitud) + ', art.actualdate) >= a.up_vigenciadesde ' +
                                              ' AND (a.up_vigenciahasta IS NULL ' +
                                              ' OR NVL(' + SqlDate(Vigencia) + ', art.actualdate) <= a.up_vigenciahasta)) ' +
                                              ' AND (NVL(' + SqlDate(FechaSolicitud) + ', art.actualdate) >= b.up_vigenciadesde ' +
                                              ' AND (b.up_vigenciahasta IS NULL ' +
                                              ' OR NVL(' + SqlDate(Vigencia) + ', art.actualdate) <= b.up_vigenciahasta)) '
                              ) +
                          sqlValorNulo1 +    // TK 21117
                          sqlAbonos + sqlAMP + sqlCabecera +

                          ' AND on_id NOT IN ( SELECT on_id FROM art.svp_valorprestador ' +       // TK 44293 Agrego que estos valores de la sup_ no existan ya en la svp, porque estas tienen prioridad,  para que no se repitan en la visualizacion de los valores, es decir, si el valor esta en valores modulados, y tambien en unidades medicas, solo debe traer el de valores modulados.
                                              ' WHERE vp_nomenclador = on_nomenclador ' +
                                                ' AND vp_capitulo = on_capitulo ' +
                                                ' AND vp_codigo = on_codigo ' +
                                                ' AND vp_prestador = ' + SqlInt(FPrestador) + '  ' +
                                                ' AND vp_fechabaja IS NULL ' +
                                                sqlValAMP + sqlVigHasta + sqlSolicitud + sqlCabecera + ' ) ';


        //------------------------------------------------
        Result := 'SELECT * FROM (' +
                   ' SELECT on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion, on_honorarios, ' +
                          ' on_gastos, on_incluye, on_excluye, on_fechabaja,vp_anestesia on_anestesia,' +
                          ' vp_hiv on_hiv, vp_antitetanica on_antitetanica,vp_sesiones on_sesiones, ' +
                          ' art.amebpba.get_val_prestacion(vp_prestador, on_nomenclador, on_capitulo, ' +
                          ' on_codigo, ' + SqlInt(FSiniestro.Siniestro) + ', ' + SqlInt(FSiniestro.Orden) + ', ' +
                            SqlInt(FSiniestro.Recaida) + ', ' + SqlDate(FFechaSolicitud) + ') val_prestacion, ' +
                          ' tb_especial2, 0 idpresup, vp_valorhonorarios val_honorarios, ' +
                          ' vp_valorgastos val_gastos, vp_vigenciadesde vigenciadesde ' +
                     ' FROM art.ctb_tablas, art.son_nomenclador, art.svp_valorprestador ' +
                    ' WHERE on_nomenclador = vp_nomenclador ' +
                      ' AND on_capitulo = vp_capitulo ' +
                      ' AND vp_capitulo = tb_codigo ' +
                      ' AND tb_clave = ''TNOME'' ' +
                      ' AND substr(tb_especial1, 1, 1) = ''N'' ' +
                      ' AND vp_fechabaja IS NULL ' +
                      ' AND on_codigo = vp_codigo ' +
                      sqlMostrarUtilizado +   // TK 32945
                      ' AND vp_prestador = ' + SqlInt(FPrestador) + '  ' +
                        sqlValorNulo +      // TK 21117
                        sqlVigHasta + sqlAbonos + sqlValAMP + sqlSolicitud + sqlCabecera +
                   //------------------------------------------------
                   ' UNION ' +  // TK 33995 - Unidades Bioquimicas (Unidades Médicas)
                   ' select on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion, on_honorarios, ' +
                          ' on_gastos, on_incluye, on_excluye, on_fechabaja, on_anestesia, on_hiv, on_antitetanica, ' +
                          ' on_sesiones, art.amebpba.get_val_prestacion (a.up_prestador, on_nomenclador, on_capitulo, ' +
                          ' on_codigo, NULL, NULL, NULL, ' + SqlDate(FechaSolicitud) + ') val_prestacion, ' +
                          ' tb_especial2, 0 idpresup, null val_honorarios, null val_gastos, up_vigenciadesde vigenciadesde' +
                     ' FROM art.ctb_tablas, art.son_nomenclador, art.sup_unidadprestador a ' +  // el alias "a" hay que dejarselo porque hay varios sql que tienen ese a
                    ' WHERE on_tipounidadbioquimica = a.up_unidad ' +
                      ' AND tb_clave = ''TNOME'' ' +
                      ' AND on_capitulo = tb_codigo ' +
                      ' AND NVL(on_unidadbioquimica, 0) > 0 ' +
                      ' AND a.up_prestador = ' + SqlInt(FPrestador) +
                      ' AND on_fechabaja IS NULL ' +
                      ' AND a.up_fechabaja IS NULL ' +
                      sqlCabecera + sqlValorNulo1 + sqlAMP +
                      IIF(FShowVigencias, '', ' AND (NVL(' + SqlDate(FechaSolicitud) + ', art.actualdate) >= a.up_vigenciadesde ' +
                                              ' AND (a.up_vigenciahasta IS NULL ' +
                                              ' OR NVL(' + SqlDate(Vigencia) + ', art.actualdate) <= a.up_vigenciahasta)) ') +

                   //------------------------------------------------
                   ' UNION ' +
                   ' SELECT on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion, on_honorarios, ' +
                          ' on_gastos, on_incluye, on_excluye, on_fechabaja,vp_anestesia on_anestesia,' +
                          ' vp_hiv on_hiv, vp_antitetanica on_antitetanica,vp_sesiones on_sesiones, ' +
                          ' art.amebpba.get_val_prestacion(vp_prestador, on_nomenclador, on_capitulo, ' +
                          ' on_codigo, ' + SqlInt(FSiniestro.Siniestro) + ', ' + SqlInt(FSiniestro.Orden) + ', ' +
                            SqlInt(FSiniestro.Recaida) + ', ' + SqlDate(FFechaSolicitud) + ') val_prestacion, ' +
                          ' tb_especial2, 0 idpresup, vp_valorhonorarios val_honorarios, ' +
                          ' vp_valorgastos val_gastos, vp_vigenciadesde vigenciadesde ' +
                     ' FROM art.ctb_tablas, art.son_nomenclador, art.svp_valorprestador ' +
                    ' WHERE on_nomenclador = vp_nomenclador ' +
                      ' AND on_capitulo = vp_capitulo ' +
                      ' AND vp_capitulo = tb_codigo ' +
                      ' AND tb_clave = ''TNOME'' ' +
                      sqlMostrarUtilizado +   // TK 32945
                      ' AND substr(tb_especial1, 1, 1) = ''S'' ' +
                      ' AND vp_fechabaja IS NULL ' +
                      ' AND on_codigo like vp_codigo || ''%'' ' +
                      ' AND vp_prestador = ' + SqlInt(FPrestador) + '  ' +
                        sqlValorNulo +      // TK 21117
                        sqlValAMP + sqlVigHasta + sqlSolicitud + sqlCabecera +
                        sqlPresup + sqlUnion + ' ) WHERE 1=1 ';
    end
    else if (Fprestador = -1) then // si no tiene valor el fprestador
      Result := 'SELECT * FROM (' +
                  'SELECT on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion, on_honorarios, on_gastos, ' +
                        ' on_incluye, on_excluye, on_fechabaja, on_anestesia, on_hiv, on_antitetanica, on_sesiones,  ' +
                        ' art.amebpba.get_val_prestacion(NVL(' + SqlInt(FPrestador) + ',0), ' +
                        ' on_nomenclador, on_capitulo, on_codigo, ' + SqlInt(FSiniestro.Siniestro) + ', ' +
                          SqlInt(FSiniestro.Orden) + ', ' + SqlInt(FSiniestro.Recaida) + ', ' +
                          SqlDate(FFechaSolicitud) + ') val_prestacion, ' +
                        ' tb_especial2, 0 idpresup, on_honorarios val_honorarios, on_gastos val_gastos, ' +
                        ' to_date(null) vigenciadesde ' +
                   ' FROM art.ctb_tablas, art.son_nomenclador ' +
                  ' WHERE on_capitulo = tb_codigo ' +
                    ' AND tb_clave=''TNOME'' ' +
                    ' AND tb_especial2 = ''N'' ' +
                      sqlEspecial1 + sqlAbonos + sqlCabecera +
                      sqlAMP + sqlPresup + ' ) WHERE 1=1 '

    else if (Fprestador = -2) then //cuando no tiene valores modulados ni unidades medicas ó tiene pero con vigencia actual
         begin
           sqlUnion2 := '';
           if IncluyeNomenclador(FPrestadorPres) then
             sqlUnion2 :=  ' UNION ' +
                          ' SELECT on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion, on_honorarios, ' +
                                 ' on_gastos, on_incluye, on_excluye, on_fechabaja, on_anestesia, on_hiv, on_antitetanica, ' +
                                 ' on_sesiones, art.amebpba.get_val_prestacion(NVL(' + SqlInt(FPrestadorPres) + ',0), ' +
                                 ' on_nomenclador, on_capitulo, on_codigo, ' + SqlInt(FSiniestro.Siniestro) + ', ' +
                                   SqlInt(FSiniestro.Orden) + ', ' + SqlInt(FSiniestro.Recaida) + ', ' +
                                   SqlDate(FFechaSolicitud) + ') val_prestacion, tb_especial2, 0 idpresup, ' +
                                 ' on_honorarios val_honorarios, on_gastos val_gastos, to_date(null) vigenciadesde ' +
                            ' FROM art.ctb_tablas, art.son_nomenclador ' +
                           ' WHERE on_capitulo = tb_codigo ' +
                             ' AND tb_clave = ''TNOME'' ' +
                             ' AND substr(tb_especial1, 1, 1)=''S'' AND tb_especial2 = ''N'' ' +
                             ' AND ( nvl(on_honorarios, 0) + nvl(on_gastos, 0) > 0) ' + sqlAMP + sqlCabecera;

           Result := 'SELECT * FROM (' +
                    'SELECT on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion, on_honorarios, on_gastos, ' +
                          ' on_incluye, on_excluye, on_fechabaja, on_anestesia, on_hiv, on_antitetanica, on_sesiones,  ' +
                          ' art.amebpba.get_val_prestacion(NVL(' + SqlInt(FPrestador) + ',0), ' +
                          ' on_nomenclador, on_capitulo, on_codigo, ' + SqlInt(FSiniestro.Siniestro) + ', ' +
                            SqlInt(FSiniestro.Orden) + ', ' + SqlInt(FSiniestro.Recaida) + ', ' +
                            SqlDate(FFechaSolicitud) + ') val_prestacion,  ' +
                          ' tb_especial2, 0 idpresup, vp_valorhonorarios val_honorarios, ' +
                          ' vp_valorgastos val_gastos, vp_vigenciadesde vigenciadesde ' +
                     ' FROM art.ctb_tablas, art.son_nomenclador, art.svp_valorprestador ' +  // TK 8423 puse el svp_valorprestador
                    ' WHERE on_capitulo = tb_codigo ' +
                      ' AND tb_clave=''TNOME'' ' +
                      ' AND tb_especial2 = ''N'' ' + sqlEspecial1 +
                      ' AND substr(tb_especial1, 1, 1)=''S'' ' +
                      ' AND ( nvl(on_honorarios, 0) + nvl(on_gastos, 0) > 0)' +
                      ' AND vp_prestador = ' + SqlInt(FPrestador) +  // TK 8423  empieza
                      sqlMostrarUtilizado +   // TK 32945
                      ' AND vp_nomenclador = on_nomenclador ' +
                      ' AND vp_capitulo = on_capitulo  ' +
                      ' AND vp_codigo = on_codigo ' +
                      ' AND vp_fechabaja IS NULL ' +
                      sqlValAMP + sqlCabecera + sqlValorNulo +      // TK 21117    // TK 8423  termina
                      sqlAbonos + sqlPresup + sqlUnion2 + ' ) WHERE 1=1 ';
             a := Result;
         end;
  end else
    Result := FSql;
end;

procedure TfraNomenclador.Limpiar;
begin
  edNomenclador.Text  := '';
  edCapitulo.Text     := '';
  edCodigo.Text       := '';
  cmbDescripcion.Text := '';
  IdNomenclador       := 0;
 // Prestador           := 0;    // Lu 8423
 // PrestadorPres       := 0;    // Lu 8423
  Change;
end;

procedure TfraNomenclador.SetColors(AColor: TColor);
begin
  edNomenclador.Font.Color  := AColor;
  edCapitulo.Font.Color     := AColor;
  edCodigo.Font.Color       := AColor;
  cmbDescripcion.Font.Color := AColor;
end;

procedure TfraNomenclador.SetModified(const Value: Boolean);
begin
  edNomenclador.Modified  := Value;
  edCapitulo.Modified     := Value;
  edCodigo.Modified       := Value;
  cmbDescripcion.Modified := Value;
end;

procedure TfraNomenclador.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  Sql :String;
begin
  cmbDescripcion.DataSource := dsDatos;
  if Key = #13 then
  begin
    Sql := GetSql +
           ' AND on_nomenclador = ' + SqlValue(edNomenclador.Text) +
           ' AND on_capitulo =  ' + SqlValue(edCapitulo.Text) +
           ' AND on_codigo = ' + SqlValue(edCodigo.Text) +
           SqlWhere;
    if OpenQuery(sdqDatos, Sql, True) then
      cmbDescripcionCloseUp(edCodigo);
  end;
end;

procedure TfraNomenclador.cmbDescripcionCloseUp(Sender: TObject);
var
  bModified : Boolean;
begin
  if (Sender = cmbDescripcion) and (cmbDescripcion.Text = '') then
     Limpiar
  else begin
    bModified := GetModified;
    edNomenclador.Text  := sdqDatosON_NOMENCLADOR.AsString;
    edCapitulo.Text     := sdqDatosON_CAPITULO.AsString;
    edCodigo.Text       := sdqDatosON_CODIGO.AsString;
    cmbDescripcion.Text := sdqDatosON_DESCRIPCION.AsString;
    IdNomenclador       := sdqDatosON_ID.AsInteger;
    SetModified(bModified);
  end;

  if sdqDatosON_FECHABAJA.IsNull then
     SetColors(clWindowText)
  else
     SetColors(clRed);

  FVigenciaDesde := sdqDatos.FieldByName('vigenciadesde').AsDateTime;

  if Assigned(Sender) then
  begin
     Change;
     if (edCodigo.Text <> '') then
       DoLostFocus;
  end;
end;

procedure TfraNomenclador.cmbDescripcionDropDown(Sender: TObject);
var
  Sql :String;
begin
  cmbDescripcion.DataSource := dsDatos;
  if IsSelected then
      Sql := GetSql + SqlWhere + OrderBy
  else begin
    Sql := GetSql +
           ' AND UPPER(ON_DESCRIPCION) LIKE ''' + cmbDescripcion.Text + '%'' ' ;

    if (edNomenclador.Text = '') or (edCapitulo.Text = '') or (edCodigo.Text = '') then
    begin
       if (edNomenclador.Text <> '') then
         Sql := Sql + ' AND on_nomenclador  = ''' + edNomenclador.Text + ''' ';

       if (edCapitulo.Text <> '') then
         Sql := Sql + ' AND on_capitulo =  ''' + edCapitulo.Text + ''' ' ;

       if (edCodigo.Text <> '') then begin
         if AreIn(edCapitulo.Text, ['', 'NP', 'NB', 'NQ', 'NO']) then
           Sql := Sql + ' AND on_codigo LIKE ''' + edCodigo.Text + '%'' '
         else
           Sql := Sql + ' AND on_codigo = ''' + edCodigo.Text + ''' '
       end;
    end;
    Sql := Sql + SqlWhere + OrderBy;
  end;
  OpenQuery(sdqDatos, Sql, True);
end;

procedure TfraNomenclador.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
   if not sdqDatosON_FECHABAJA.IsNull then
      AFont.Color := clRed;
end;

procedure TfraNomenclador.FrameExit(Sender: TObject);
begin
   if (edNomenclador.Text <> '') or (edCapitulo.Text <> '') or (edCodigo.Text <> '') then
   begin
     if (edNomenclador.Text <> sdqDatosON_NOMENCLADOR.AsString) or
        (edCapitulo.Text    <> sdqDatosON_CAPITULO.AsString) or
        (edCodigo.Text      <> sdqDatosON_CODIGO.AsString) then
        Cargar(edNomenclador.Text, edCapitulo.Text, edCodigo.Text, True)
     else
       cmbDescripcion.Text := sdqDatosON_DESCRIPCION.AsString;
   end else
     Limpiar;
end;

function TfraNomenclador.SqlWhere: String;
begin
  Result := IIF(FShowBajas, '', ' AND ON_FECHABAJA IS NULL'); // Para poder agregar limpiamete mas condiciones Dinámicas
end;

procedure TfraNomenclador.edNomencladorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_DOWN) and (ssAlt in Shift) then
      cmbDescripcion.DoClick;
end;

procedure TfraNomenclador.edCodigoExit(Sender: TObject);
begin
// 14/12/2004, eliminado por pedido de PAtlante
{  if (Length(edCodigo.Text) = 7) and (strCount(edCodigo.Text, '.') = 2) and IsNumber(strMid(edCodigo.Text, 7)) then
  begin
    edCodigo.Text     := strLeft(edCodigo.Text, 6) +  '0' + strMid(edCodigo.Text, 7);
    edCodigo.SelStart := 8;
  end; }
end;

function TfraNomenclador.GetReadOnly: Boolean;
begin
  Result := edNomenclador.ReadOnly  and
            edCapitulo.ReadOnly     and
            edCodigo.ReadOnly       and
            cmbDescripcion.ReadOnly;
end;

procedure TfraNomenclador.SetReadOnly(const Value: Boolean);
begin
  edNomenclador.ReadOnly  := Value;
  edCapitulo.ReadOnly     := Value;
  edCodigo.ReadOnly       := Value;
  cmbDescripcion.ReadOnly := Value;
end;

function TfraNomenclador.IsSelected: Boolean;
begin
   Result := sdqDatos.Active and (not sdqDatos.IsEmpty) and 
            (edNomenclador.Text  = sdqDatosON_NOMENCLADOR.AsString) and
            (edCapitulo.Text     = sdqDatosON_CAPITULO.AsString) and
            (edCodigo.Text       = sdqDatosON_CODIGO.AsString) and
            (cmbDescripcion.Text = UCase(sdqDatosON_DESCRIPCION.AsString));
end;

procedure TfraNomenclador.mnuLimpiarClick(Sender: TObject);
begin
  Limpiar;
end;

procedure TfraNomenclador.mnuPropiedadesClick(Sender: TObject);
Var sSql    : String;
    sdqProp : TSDQuery;
begin
  if IsSelected then
  begin
     sSql := 'SELECT on_incluye, on_excluye ' +
              ' FROM son_nomenclador ' +
             ' WHERE on_nomenclador = ' + SqlValue(sdqDatosON_NOMENCLADOR.AsString) +
               ' AND on_capitulo = ' + SqlValue(sdqDatosON_CAPITULO.AsString) +
               ' AND on_codigo = ' + SqlValue(sdqDatosON_CODIGO.AsString);
     sdqProp := GetQuery(sSql);
     try
       if sdqProp.Active and (not sdqProp.IsEmpty) then
       begin
          edIncluye.Text := AdjustLineBreaks(sdqProp.Fields[0].AsString);
          edExcluye.Text := AdjustLineBreaks(sdqProp.Fields[1].AsString);
          fpPropiedades.ShowModal;
       end;
     finally
       sdqProp.Free;
     end;
  end;
end;

procedure TfraNomenclador.fpPropiedadesResize(Sender: TObject);
begin
   grpIncluye.Height := (fpPropiedades.Height) div 2 - 2;
   grpExcluye.Top    := grpIncluye.Height + 4;
   grpExcluye.Height := grpIncluye.Height;
end;

procedure TfraNomenclador.fpPropiedadesKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
      fpPropiedades.ModalResult := mrCancel;
end;

procedure TfraNomenclador.SetPrestador(const Value: Integer);
var
  sSql :String;
begin
  sSql := ' SELECT 1 ' +
            ' FROM svp_valorprestador ' +
           ' WHERE vp_prestador = :IdPrest ' +
             ' AND vp_fechabaja IS NULL ' +
             ' AND (    NVL(' + SqlDate(FechaSolicitud) + ', art.actualdate) >= vp_vigenciadesde ' +       // TK 15402
             ' AND (   vp_vigenciahasta IS NULL ' +
                   ' OR NVL(' + SqlDate(Vigencia) + ', art.actualdate) <= vp_vigenciahasta)) ' +
             ' AND NVL(vp_valordeamp, ''N'') = ' + SqlBoolean(EsDeAMP) +
          ' UNION ' +
          ' SELECT 1 ' +
            ' FROM sup_unidadprestador ' +
           ' WHERE up_prestador = :IdPrest ' +
           '   AND up_fechabaja IS NULL ' +
             ' AND (    NVL(' + SqlDate(FechaSolicitud) + ', art.actualdate) >= up_vigenciadesde ' +      // TK 15402
             ' AND (   up_vigenciahasta IS NULL ' +
                   ' OR NVL(' + SqlDate(Vigencia) + ', art.actualdate) <= up_vigenciahasta)) ' +
             IIF(EsDeAMP, ' AND 1 = 2 ', '') +
          ' UNION ' + GetSqlPresup(True);

  if (Value <> FPrestador) then
  begin
     if ExisteSqlEx(sSql, [Value]) then
     begin
       FPrestador     := Value;
       FPrestadorPres := 0;
     end
     else begin
       FPrestador      := -2;
       FPrestadorPres  := Value;
     end;
  end;

  if not SoloPresup then
    DoHabilitarNomenclador;  // Lu WF 8140
end;

function TfraNomenclador.CompareValues(ANomenclador, ACapitulo, ACodigo : String) : Boolean;
begin
   Result := (ANomenclador = edNomenclador.Text) and
             (ACapitulo    = edCapitulo.Text) and
             (ACodigo      = edCodigo.Text);
end;

procedure TfraNomenclador.sdqDatosAfterScroll(DataSet: TDataSet);
var
  sSql: string;
begin
 //  edIncluye.Text := sdqDatos.FieldByName('ON_INCLUYE').AsString;

   sSql := 'SELECT ART.SINIESTRO.GET_NOMENCLADOR_INCLUYE(' +             //  por TK 21048
            SqlValue(sdqDatos.FieldByName('ON_INCLUYE').AsString) + ', ' +
            SqlInt(FPrestador) + ', ' +
            SqlInt(sdqDatosON_ID.AsInteger) + ') practica ' +
            ' FROM DUAL ';
   edIncluye.Text := ValorSql(sSql);

   edExcluye.Text := sdqDatos.FieldByName('ON_EXCLUYE').AsString;
end;

function TfraNomenclador.IncluyeNomenclador(vIdPrestador: Integer) :Boolean;   // Lu TK 8423 - agregue el parámetro para poder pasarle otro en otro momento.
var
  sSql :String;
begin
  sSql := 'SELECT ca_incluyenomenclador ' +
           ' FROM cpr_prestador ' +
          ' WHERE ca_identificador = ' + SqlInt(vIdPrestador);
  Result := (ValorSql(sSql) = 'S');
end;

function TFraNomenclador.IsPresup :Boolean;
begin
  Result := sdqDatos.Active and (sdqDatos.FieldByName('TB_ESPECIAL2').AsString = 'S');
end;

procedure TfraNomenclador.DoHabilitarNomenclador;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
           ' FROM art.svp_valorprestador ' +
          ' WHERE vp_prestador = :IdPrest ' +
            ' AND vp_fechabaja IS NULL ' +
            ' AND (    NVL(' + SqlDate(FechaSolicitud) + ', art.actualdate) >= vp_vigenciadesde ' +
                 ' AND (   vp_vigenciahasta IS NULL ' +
                      ' OR NVL(' + SqlDate(Vigencia) + ', art.actualdate) <= vp_vigenciahasta)) ' +
            ' AND vp_capitulo <> ''PP'' ' +
               IIF(ShowAbonos, '', ' AND vp_capitulo <> ''AB'' ') +
            ' AND NVL(vp_valordeamp, ''N'') = ' + SqlBoolean(EsDeAMP) +

          ' UNION ALL ' +

         ' SELECT 1 ' +
           ' FROM art.ctb_tablas, art.son_nomenclador, art.sup_unidadprestador a, art.sup_unidadprestador b  ' +
          ' WHERE on_tipohonorario = a.up_unidad ' +
            ' AND on_tipogasto = b.up_unidad ' +
            ' AND tb_clave = ''TNOME'' ' +
            ' AND on_capitulo = tb_codigo ' +
            ' AND substr(tb_especial1, 1, 1) = ''S'' ' +
            ' AND ( nvl(on_honorarios, 0) + nvl(on_gastos, 0) > 0) ' +
            ' AND a.up_prestador = :IdPrest ' +
            ' AND a.up_prestador = b.up_prestador ' +
            ' AND a.up_fechabaja IS NULL ' +
            ' AND b.up_fechabaja IS NULL ' +
            ' AND (NVL(' + SqlDate(FechaSolicitud) + ', art.actualdate) >= a.up_vigenciadesde ' +
                 ' AND (a.up_vigenciahasta IS NULL ' +
                 ' OR NVL(' + SqlDate(Vigencia) + ', art.actualdate) <= a.up_vigenciahasta)) ' +
            ' AND (NVL(' + SqlDate(FechaSolicitud) + ', art.actualdate) >= b.up_vigenciadesde ' +
                 ' AND (b.up_vigenciahasta IS NULL ' +
                 ' OR NVL(' + SqlDate(Vigencia) + ', art.actualdate) <= b.up_vigenciahasta)) ' +
              IIF(EsDeAMP, ' AND 1 = 2 ', '') +

            ' UNION ALL ' +
            
            ' SELECT 1 ' +             // TK 33995
              ' FROM art.ctb_tablas, art.son_nomenclador, art.sup_unidadprestador a ' +
             ' WHERE on_tipounidadbioquimica = a.up_unidad ' +
            ' AND tb_clave = ''TNOME'' ' +
            ' AND on_capitulo = tb_codigo ' +
            ' AND NVL(on_unidadbioquimica, 0) > 0 ' +
            ' AND a.up_prestador = :IdPrest ' +
            ' AND a.up_fechabaja IS NULL ' +
            ' AND (NVL(' + SqlDate(FechaSolicitud) + ', art.actualdate) >= a.up_vigenciadesde ' +
                 ' AND (a.up_vigenciahasta IS NULL ' +
                 ' OR NVL(' + SqlDate(Vigencia) + ', art.actualdate) <= a.up_vigenciahasta)) ' +

            ' UNION ALL ' + GetSqlPresup(True);

  if ExisteSqlEx(sSql, [FPrestador]) then
    FExigePrestacion := True
  else
    FExigePrestacion := False;

  SetLocked(not ExigePrestacion);
end;

procedure TfraNomenclador.AfterConstruction;
begin
  inherited;
  cmbDescripcion.DataSource := dsDatos;
end;

function TfraNomenclador.GetCapitulo: String;
begin
  Result := edCapitulo.Text;
end;

function TfraNomenclador.GetCodigo: String;
begin
  Result := edCodigo.Text;
end;

function TfraNomenclador.GetNomenclador: String;
begin
  Result := edNomenclador.Text;
end;

procedure TfraNomenclador.SetLocked(const Value: Boolean);
begin
  inherited;
  VCLExtra.LockControls([edNomenclador, edCapitulo, edCodigo, cmbDescripcion], Value);
end;

function TfraNomenclador.GetDescripcion: String;
begin
  Result := cmbDescripcion.Text; 
end;

procedure TfraNomenclador.SetFocus;
begin
  inherited;
  edNomenclador.SetFocus;
end;

procedure TfraNomenclador.Clear;
begin
  Limpiar;
end;

procedure TfraNomenclador.SetFechaSolicitud(const Value: TDateTime);
begin
  FFechaSolicitud := Value;
  DoHabilitarNomenclador;
end;

function TfraNomenclador.GetSqlPresup(bSoloExiste: Boolean): String;
var
  sSql: String;
begin
  if bSoloExiste then
    sSql := 'SELECT 1 '
  else
    sSql := 'SELECT on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion, ' +
                  ' on_honorarios, on_gastos, on_incluye, on_excluye, on_fechabaja, ' +
                  ' on_anestesia, on_hiv, on_antitetanica, on_sesiones, ' +
                  ' pp_valor val_prestacion, tb_especial2, pp_id idpresup, ' +
                  ' on_honorarios val_honorarios, on_gastos val_gastos, pp_vigenciadesde vigenciadesde ';

  sSql := sSql + ' FROM art.son_nomenclador, art.spp_prestador_presupuesto, art.ctb_tablas ' +
                ' WHERE on_capitulo = tb_codigo ' +
                  ' AND tb_clave = ''TNOME'' ' +
                  ' AND tb_especial2 = ''S'' ' +  //los presupuestos
                  ' AND on_id = pp_idnomenclador ' + GetSqlEspecial1 + GetSqlAMP + GetSqlCabecera;

  if (FPresupuesto > 0) then
    sSql := sSql  + ' AND pp_id = ' + SqlInt(FPresupuesto);
  if (FPrestador > 0) or (FPrestadorPres > 0) then
    sSql := sSql  + ' AND pp_prestador = ' + SqlInt(Integer(IIF(FPrestador > 0, FPrestador, FPrestadorPres)));
  if (FSiniestro.Siniestro > 0) then
    sSql := sSql  + ' AND pp_idexpediente = siniestro.get_idexpediente(' +
                                            SqlInt(FSiniestro.Siniestro) + ', ' +
                                            SqlInt(FSiniestro.Orden) + ', ' +
                                            SqlInt(FSiniestro.Recaida) + ')';

  sSql := sSql + IIF(FShowVigencias, '',
                 IIF((Vigencia > 0), ' AND ' + SqlDate(Vigencia) +
                                ' BETWEEN pp_vigenciadesde AND NVL(pp_vigenciahasta, ' + SqlDate(Vigencia) + ')',
                                ' AND pp_vigenciahasta IS NULL ')) +
                 ' AND pp_fechabaja IS NULL ' +
                 IIF(FShowConsumidos, '', ' AND pp_cantidad > pp_consumido ');

  Result := sSql;
end;

function TfraNomenclador.GetSqlEspecial1: String;
begin
  Result := IIF(SoloEspecial1, ' AND substr(tb_especial1, 1, 1) = ''S'' ', '');
end;

function TfraNomenclador.GetSqlAMP: String;
begin
  Result := IIF(EsDeAMP, ' AND 1 = 2 ', '');
end;

function TfraNomenclador.GetSqlCabecera: String;
begin
  Result := IIF(ShowCabecera, '', ' AND on_cabecera = ''N'' ');  // por cambio de Cabeceras
end;

initialization
  RegisterClasses([TPatternEdit, TLookupComboDlg]);

end.
