unit unCapacitacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, General,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ToolEdit, DateComboBox, Mask,
  PatternEdit, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  IntEdit, Buttons, ComboEditor, CheckCombo, RXCtrls;

type
  TfrmCapacitacion = class(TfrmCustomGridABM)
    lblModalidad: TLabel;
    lblTemasDesarrolados: TLabel;
    lblPreventor: TLabel;
    Label5: TLabel;
    lblMaterialEntregado: TLabel;
    lblActividad: TLabel;
    fraModalidad: TfraCodigoDescripcion;
    fraPreventor: TfraCodigoDescripcion;
    edMaterialEntregado: TEdit;
    edTemasDesarrollados: TMemo;
    edParticipantesEmpresa: TIntEdit;
    lblVisita: TLabel;
    edVisita: TEdit;
    btnBuscarVisitas: TSpeedButton;
    edFecha: TDateComboBox;
    Label1: TLabel;
    sdqActCapacit: TSDQuery;
    clbActividades: TRxCheckListBox;
    ArtDBGrid1: TArtDBGrid;
    sdqActividad: TSDQuery;
    dsActividad: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarVisitasClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure ArtDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
    FEstableci: Integer;
    FCUIT: String;
    FTipo         : String;
    FOperativo    : String; 
    FIdVisita     : Integer;

    procedure SetCuit(const Value: String);
    procedure SetEstableci(const Value: Integer);
    procedure SetTipo(const Value: String);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    procedure ActualizarCapacitaciones;
  public
    { Public declarations }
    procedure Load;
  published
    property CUIT             : String   read FCUIT             write SetCuit;
    property TIPO             : String   read FTIPO             write SetTipo;
    property Operativo        : String   read FOperativo        write FOperativo;
    property Estableci        : Integer  read FEstableci        write SetEstableci;
  end;

var
  frmCapacitacion: TfrmCapacitacion;

implementation

uses unCustomConsulta, CustomDlgs, unDmPrincipal, StrFuncs, VCLExtra, SqlOracle,
     unSesion, SQLFuncs, unConsVisitasRealizadas;

{$R *.dfm}

procedure TfrmCapacitacion.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'CM_FECHABAJA';
  sdqConsulta.ParamByName('cuit').AsString := FCUIT;
  sdqConsulta.ParamByName('establecimiento').AsInteger := FEstableci;
  VCLExtra.LockControls([fraPreventor,edFecha], true);

  with fraModalidad do
  begin
    TableName   := 'CTB_TABLAS';
    FieldID     := 'TB_CODIGO';
    FieldCodigo := 'TB_CODIGO';
    FieldDesc   := 'TB_DESCRIPCION';
    FieldBaja := 'TB_FECHABAJA';
    ExtraCondition := ' and TB_CLAVE = ''MODAC'' AND TB_MODULO = ''PLANMEJ''';
    Showbajas   := true;
  end;

  with fraPreventor do
  begin
    TableName   := 'PIT_FIRMANTES';
    FieldID     := 'IT_CODIGO';
    FieldCodigo := 'IT_CODIGO';
    FieldDesc   := 'IT_NOMBRE';
    FieldBaja := 'IT_FECHABAJA';
    Showbajas   := true;
  end;

  Sql.TableName := 'ART.PCM_CAPACITEMP';
end;

procedure TfrmCapacitacion.Load;
begin
  sdqConsulta.ParamByName('cuit').AsString := FCUIT;
  sdqConsulta.ParamByName('establecimiento').AsInteger := FEstableci;
  tbRefrescarClick(nil);
end;

procedure TfrmCapacitacion.ClearControls;
var
  sSQL: String;
begin
  fraModalidad.Codigo := '3';
  edTemasDesarrollados.Clear;
  fraPreventor.Clear;
  edMaterialEntregado.Clear;
  edParticipantesEmpresa.Clear;
  edVisita.Clear;

  FIdVisita := ValorSqlInteger ('SELECT MAX (rv.rv_id) rv_id ' +
                                    '  FROM art.prv_resvisitas rv ' +
                                    ' WHERE rv.rv_cuit = ' + SqlValue (FCUIT) +
                                    '   AND rv.rv_estableci = ' + SqlValue (FEstableci) +
                                    '   AND rv.rv_operativo = ' + SqlValue (FOperativo) +
                                    '   AND rv.rv_fechabaja IS NULL ' );

  sSQL := ' SELECT rv_firmante, rv_fecha, rv_descripcion '+
          '   FROM art.prv_resvisitas '+
          ' WHERE rv_id = :visita ';

  with GetQueryEx(sSQL, [FIdVisita]) do
  try
    fraPreventor.Codigo := Fields[0].AsString;
    edFecha.Date := Fields[1].AsDateTime;
    edVisita.Text := FormatDateTime('dd/mm/yyyy' , Fields[1].AsDateTime) + ' ' + Fields[2].AsString;
  finally
    Free;
  end;

  VCLExtra.LockControls([fraModalidad], false);
end;

function TfrmCapacitacion.DoABM: Boolean;
var
  ID,
  i,
  Actividad : integer;
  Existe : boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    ID := sdqConsulta.fieldbyname('CM_ID').AsInteger;

    Sql.Fields.Add('CM_USUBAJA', Sesion.UserID );
    Sql.Fields.Add('CM_FECHABAJA', exDateTime );
    Sql.PrimaryKey.Add('CM_ID', ID);

    Sql.SqlType := stUpdate;
  end else
  begin
    Sql.Fields.Add('CM_TEMAS',edTemasDesarrollados.Text);
    Sql.Fields.Add('CM_PREVENTOR',fraPreventor.Codigo);
    Sql.Fields.Add('CM_MATERIAL',edMaterialEntregado.Text);
    Sql.Fields.Add('CM_PARTICIPANTES',edParticipantesEmpresa.Text);
    Sql.Fields.Add('CM_VISITA',FIdVisita);
    Sql.Fields.Add('CM_CUIT', FCUIT);
    Sql.Fields.Add('CM_FECHA', edFecha.Date);
    Sql.Fields.Add('CM_ESTABLECI', FEstableci);
    Sql.Fields.Add('CM_MODALIDAD', fraModalidad.Codigo);

    if ModoABM = maAlta Then
    begin
      ID := GetSecNextVal('ART.SEQ_PCM_ID');

      Sql.PrimaryKey.Add('CM_ID', ID);
      Sql.Fields.Add('CM_USUALTA', Sesion.UserID );
      Sql.Fields.Add('CM_FECHAALTA', exDateTime );

      Sql.SqlType := stInsert;
    end else
    begin
      ID := sdqConsulta.fieldbyname('CM_ID').AsInteger;

      Sql.PrimaryKey.Add('CM_ID', ID);
      Sql.Fields.Add('CM_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('CM_FECHAMODIF', exDateTime );
      Sql.Fields.Add('CM_USUBAJA', exNull );
      Sql.Fields.Add('CM_FECHABAJA', exNull );

      Sql.SqlType := stUpdate;
    end;
  end;

  EjecutarSQLST(Sql.Sql);

  for i := 0 to clbActividades.Items.Count -1 do
  begin
    Actividad := integer(clbActividades.Items.Objects[i]);
    Existe := ExisteSQLEx('SELECT 1 ' +
                          '  FROM art.pdc_detallecapacitemp ' +
                          ' WHERE dc_idcapacit = :pidcapacit ' +
                          '   AND dc_codigoact = :pcodigoact ',
                          [ID, Actividad]);

    case clbActividades.Checked[i] of
      true: if not Existe then
              EjecutarSQLSTEx('INSERT INTO art.pdc_detallecapacitemp ' +
                              '            (dc_id, dc_idcapacit, dc_codigoact, dc_fechaalta, dc_usualta) ' +
                              '     VALUES (:pid, :pidcapacit, :pcodigoact, SYSDATE, :pusualta) ',
                              [GetSecNextVal('ART.SEQ_PDC_ID'), ID, Actividad, Sesion.UserID])
            else
              EjecutarSQLSTEx('UPDATE art.pdc_detallecapacitemp ' +
                              '   SET dc_fechamodif = SYSDATE, ' +
                              '       dc_usumodif = :pusumodif, ' +
                              '       dc_fechabaja = NULL, ' +
                              '       dc_usubaja = NULL ' +
                              ' WHERE dc_idcapacit = :pidcapacit ' +
                              '   AND dc_codigoact = :pcodigoact ' +
                              '   AND dc_fechabaja IS NOT NULL ',
                              [Sesion.UserID, ID, Actividad]);
      else  if Existe then
              EjecutarSQLSTEx('UPDATE art.pdc_detallecapacitemp ' +
                              '   SET dc_fechabaja = SYSDATE, ' +
                              '       dc_usubaja = :pusubaja ' +
                              ' WHERE dc_idcapacit = :pidcapacit ' +
                              '   AND dc_codigoact = :pcodigoact ',
                              [Sesion.UserID, ID, Actividad]);
    end
  end;

  ActualizarCapacitaciones;
  sdqActividad.Refresh;

  result:= true;
end;

procedure TfrmCapacitacion.btnBuscarVisitasClick(Sender: TObject);
var
 sSQL : String;
 format :TFormatSettings;
begin
  format.DateSeparator := '/';
  format.ShortDateFormat := 'dd/mm/yyyy';
  with TfrmConsVisitasRealizadas.Create(self) do
  try
//    Init (FCUIT, FEstableci, FOperativo, FTipo, True);
    Init (FCUIT, FEstableci, '', FTipo, True);

    if ShowModal = mrOk then
    begin
      FIdVisita := FIdVisitaSeleccionada;

      edVisita.Text := DateToStr(FFechaVisitaSeleccionada,format)+ ' ' + FDescripcionVisitaSeleccionada;
      edFecha.Date :=  FFechaVisitaSeleccionada;
      sSQL := ' SELECT rv_firmante '+
              '   FROM art.prv_resvisitas '+
              ' WHERE rv_id = :visita ';

      with GetQueryEx(sSQL, [FIdVisita]) do
      try
        fraPreventor.Codigo := Fields[0].AsString;
      finally
        Free;
      end;
    end
  finally
    Free
  end;
end;

procedure TfrmCapacitacion.LoadControls;
var
  sSQL : string;
begin
  ClearControls;
  VCLExtra.LockControls([fraModalidad], True);
  fraModalidad.Codigo := sdqConsulta.fieldbyname('CM_MODALIDAD').AsString;
  edTemasDesarrollados.Text := sdqConsulta.fieldbyname('CM_TEMAS').AsString;
  fraPreventor.Codigo := sdqConsulta.fieldbyname('CM_PREVENTOR').AsString;
  edMaterialEntregado.Text := sdqConsulta.fieldbyname('CM_MATERIAL').AsString;
  edParticipantesEmpresa.Text := sdqConsulta.fieldbyname('CM_PARTICIPANTES').AsString;
  edFecha.Date := sdqConsulta.fieldbyName('CM_FECHA').AsDateTime;
  sSQL := ' SELECT to_char(rv_fecha, ''DD/MM/YYYY'') || '' '' || rv_descripcion '+
           '   FROM art.prv_resvisitas '+
           '  WHERE rv_id = :visita';
  FIdVisita := sdqConsulta.FieldByName('CM_VISITA').AsInteger;
  with GetQueryEx(sSQL, [sdqConsulta.FieldByName('CM_VISITA').AsInteger]) do
  try
    edVisita.Text := Fields[0].AsString;
  finally
    Free;
  end;
end;

function TfrmCapacitacion.Validar: Boolean;
var
 qry: TSDQuery;

  function HayActividadesSeleccionadas: boolean;
  var
    i : integer;
    haycheck : boolean;
  begin
    i:= 0;
    haycheck := false;
    while (i <= clbActividades.Items.Count-1) and (not haycheck) do
    begin
      haycheck := clbActividades.Checked[i];

      inc(i)
    end;

    result := haycheck
  end;
begin
  result := true;

  Verificar(not HayActividadesSeleccionadas, clbActividades, 'Debe seleccionar al menos una Actividad.');

  if ModoABM = maAlta Then
  begin
    Verificar(fraModalidad.IsEmpty, fraModalidad.edCodigo, 'Debe seleccionar una Modalidad.');

    qry := GetQuery( ' SELECT 1 FROM PCM_CAPACITEMP '+
                       '  WHERE CM_CUIT = '+ SqlValue(FCUIT) +
                       '    AND CM_ESTABLECI = '+ SqlValue(FEstableci) +
                       '    AND CM_FECHA = '+ SqlDate(edFecha.Date));
//                       '    AND CM_MODALIDAD = '+SqlValue(fraModalidad.Codigo));

    Verificar( qry.Fields[0].AsString = '1', edFecha, 'Ya existen datos para la fecha indicada.');
//    Verificar( qry.Fields[0].AsString = '1', fraModalidad.edCodigo, 'No se puede agregar la actividad porque se duplicarían datos.');
    qry.Free;
  end;
  Verificar(IsEmptyString(edVisita.Text), edVisita, 'Debe Seleccionar una Visita.');
//  Verificar(fraModalidad.IsBaja, fraModalidad, 'Debe seleccionar una Modalidad que no este dada de Baja.');
//  if not fraPreventor.IsEmpty then
//    Verificar(fraPreventor.IsBaja, fraPreventor, 'Debe seleccionar un Preventor que no este dado de Baja.');
end;

procedure TfrmCapacitacion.SetCuit(const Value: String);
begin
  if (FCUIT <> Value) then
    FCUIT := Value;
end;

procedure TfrmCapacitacion.SetEstableci(const Value: Integer);
begin
  if (FEstableci <> Value) then
    FEstableci := Value;
end;

procedure TfrmCapacitacion.SetTipo(const Value: String);
begin
  if (FTipo <> Value) then
    FTipo := Value;
end;


procedure TfrmCapacitacion.ActualizarCapacitaciones;
begin
  EjecutarSqlST(' UPDATE hys.hep_estabporpreventor ' +
                ' SET ep_fechaultcap = (SELECT MAX(CM_FECHA) ' +
                '                       FROM ART.PCM_CAPACITEMP ' +
                '                       WHERE CM_CUIT = ' + SqlValue(FCUIT) +
                '                       AND CM_ESTABLECI = ' + SqlValue(FEstableci) +
                '                       AND CM_FECHABAJA IS NULL) ' +
                ' WHERE EP_CUIT = ' + SqlValue(FCUIT) +
                ' AND EP_ESTABLECI = ' + SqlValue(FEstableci));

  EjecutarSqlST(' UPDATE hys.hep_estabporpreventor ' +
                ' SET ep_cantcapacit = (SELECT COUNT(*) ' +
                '                       FROM art.pcm_capacitemp, hys.hco_cuitoperativo, hys.hvo_vigenciaoperativo ' +
                '                       WHERE cm_cuit = co_cuit ' +
                '                       AND cm_fechabaja IS NULL ' +
                '                       AND cm_cuit = ' + SqlValue(FCUIT) +
                '                       AND cm_estableci = ' + SqlValue(FEstableci) +
                '                       AND cm_fecha >= vo_vigenciadesde ' +
                '                       AND cm_fecha <= NVL(vo_vigenciahasta, cm_fecha) ' +
                '                       AND co_id = ep_idcooperativo ' +
                '                       AND vo_operativo = co_operativo ' +
                '                       AND vo_tipo = co_tipo) ' +
                ' WHERE EP_CUIT = ' + SqlValue(FCUIT) +
                ' AND EP_ESTABLECI = ' + SqlValue(FEstableci));
end;

procedure TfrmCapacitacion.fpAbmShow(Sender: TObject);
begin
  with sdqActCapacit do
  begin
    ParamByName('pidcapacit').AsInteger := iif (ModoABM = maAlta, 0, sdqConsulta.fieldbyname('CM_ID').AsInteger);
    Open;
    clbActividades.Clear;

    while not EoF do
    begin
      clbActividades.Items.AddObject(FieldByName('ac_descripcion').AsString,
                                     TObject(FieldByName('ac_codigo').AsInteger));
      clbActividades.Checked[clbActividades.Items.Count-1] := not FieldByName('dc_codigoact').IsNull;
      Next
    end;

    Close;
  end;

  inherited;
end;

procedure TfrmCapacitacion.tbRefrescarClick(Sender: TObject);
begin
  inherited;
  sdqConsultaAfterScroll(nil);
end;

procedure TfrmCapacitacion.ArtDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqActividad.FieldByName('dc_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmCapacitacion.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  sdqActividad.Close;
  sdqActividad.ParamByName('cm_id').AsInteger := sdqConsulta.FieldByName('cm_id').AsInteger;
  sdqActividad.Open;
end;

end.
