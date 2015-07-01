unit unCargaDeViaticos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraCodigoDescripcion,
  unFraEstablecimiento, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, Mask, ToolEdit, DateComboBox, Provider, DBClient,
  AdvGlowButton, unFraDomicilio, unFraDomicilioGIS, unDmPrincipal;

type
  TfrmCargaDeViaticos = class(TfrmCustomGridABM)
    Panel1: TPanel;
    edNumerodeViatico: TEdit;
    lbNroViatico: TLabel;
    lbFechaViatico: TLabel;
    lbHasta: TLabel;
    edFechaViaticoDesde: TDateComboBox;
    edFechaViaticoHasta: TDateComboBox;
    Panel2: TPanel;
    fraEmpresaAfiliada: TfraEmpresa;
    fraEstablecimientoAfiliada: TfraEstablecimiento;
    rgLugarDestino: TRadioGroup;
    lbCUITAfiliada: TLabel;
    lbEstablecimiento: TLabel;
    lbCUITNoAfiliada: TLabel;
    edCUITNoAfiliada: TMaskEdit;
    fraDomicilioGISVisita: TfraDomicilioGIS;
    btnAgregar: TAdvGlowButton;
    Panel3: TPanel;
    ArtDBGrid1: TArtDBGrid;
    cdVisitas: TClientDataSet;
    dspVisitas: TDataSetProvider;
    sdqVisitas: TSDQuery;
    dsVisitas: TDataSource;
    sduVisita: TSDUpdateSQL;
    sdqVisitasVV_ID: TFloatField;
    sdqVisitasVV_IDCABECERAVIATICO: TFloatField;
    sdqVisitasVV_CUIT: TStringField;
    sdqVisitasVV_ESTABLECI: TFloatField;
    sdqVisitasVV_LOCALIDAD: TStringField;
    sdqVisitasVV_CALLE: TStringField;
    sdqVisitasVV_NUMERO: TStringField;
    sdqVisitasVV_PISO: TStringField;
    sdqVisitasVV_DEPARTAMENTO: TStringField;
    sdqVisitasVV_CPOSTAL: TStringField;
    sdqVisitasVV_CPOSTALA: TStringField;
    sdqVisitasVV_PROVINCIA: TStringField;
    sdqVisitasVV_EMPRESAAFILIADA: TStringField;
    sdqVisitasVV_ORDEN: TFloatField;
    sdqVisitasVV_SINVIATICO: TStringField;
    sdqVisitasVV_FECHA: TDateTimeField;
    sdqVisitasVV_USUALTA: TStringField;
    sdqVisitasVV_FECHAALTA: TDateTimeField;
    sdqVisitasVV_USUMODIF: TStringField;
    sdqVisitasVV_FECHAMODIF: TDateTimeField;
    sdqVisitasVV_USUBAJA: TStringField;
    sdqVisitasVV_FECHABAJA: TDateTimeField;
    cdVisitasVV_ID: TFloatField;
    cdVisitasVV_IDCABECERAVIATICO: TFloatField;
    cdVisitasVV_CUIT: TStringField;
    cdVisitasVV_ESTABLECI: TFloatField;
    cdVisitasVV_LOCALIDAD: TStringField;
    cdVisitasVV_CALLE: TStringField;
    cdVisitasVV_NUMERO: TStringField;
    cdVisitasVV_PISO: TStringField;
    cdVisitasVV_DEPARTAMENTO: TStringField;
    cdVisitasVV_CPOSTAL: TStringField;
    cdVisitasVV_CPOSTALA: TStringField;
    cdVisitasVV_PROVINCIA: TStringField;
    cdVisitasVV_EMPRESAAFILIADA: TStringField;
    cdVisitasVV_ORDEN: TFloatField;
    cdVisitasVV_SINVIATICO: TStringField;
    cdVisitasVV_FECHA: TDateTimeField;
    cdVisitasVV_USUALTA: TStringField;
    cdVisitasVV_FECHAALTA: TDateTimeField;
    cdVisitasVV_USUMODIF: TStringField;
    cdVisitasVV_FECHAMODIF: TDateTimeField;
    cdVisitasVV_USUBAJA: TStringField;
    cdVisitasVV_FECHABAJA: TDateTimeField;
    edFechaSeleccionada: TDateComboBox;
    lbFechaSeleccionada: TLabel;
    cbSinViatico: TCheckBox;
    procedure btnAgregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edFechaViaticoDesdeChange(Sender: TObject);
    procedure rgLugarDestinoClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure edFechaSeleccionadaChange(Sender: TObject);
  private
    FIDCabeceraViatico : Integer;
    procedure CargarDomicilioPreventor;
    procedure ValidarVisita;
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
		function DoABM: Boolean; override;
  end;

var
  frmCargaDeViaticos: TfrmCargaDeViaticos;

const
  EMPRESAAFILIADA     = 0;
  EMPRESANOAFILIADA   = 1;
  DOMICILIOPARTICULAR = 2;
  HOTEL               = 3;

implementation

{$R *.dfm}

uses
  DBSql,CustomDlgs, unSesion, vclExtra, Math, General,unABMAgendaBaseTarea,
  unABMAgendaBaseEvento,unABMAgendaBase, DateUtils, DateTimeFuncs, AnsiSql,
  unFiltros,SQLFuncs;

procedure TfrmCargaDeViaticos.btnAgregarClick(Sender: TObject);
begin
  ValidarVisita;
  with cdVisitas do
  begin
    Insert;
    FieldByName('vv_id').AsInteger := GetSecNextVal('HYS.SEQ_HVV_ID');
    FieldByName('vv_idcabeceraviatico').AsInteger := FIDCabeceraViatico;

    FieldByName('vv_orden').AsInteger := cdVisitas.RecordCount;
    FieldByName('vv_localidad').AsString    := fraDomicilioGISVisita.Localidad;
    FieldByName('vv_calle').AsString        := fraDomicilioGISVisita.Calle;
    FieldByName('vv_numero').AsString       := fraDomicilioGISVisita.Numero;
    FieldByName('vv_piso').AsString         := fraDomicilioGISVisita.Piso;
    FieldByName('vv_departamento').AsString := fraDomicilioGISVisita.Departamento;
    FieldByName('vv_cpostal').AsString      := fraDomicilioGISVisita.CodigoPostal;
    FieldByName('vv_cpostala').AsString     := fraDomicilioGISVisita.CPA;
    FieldByName('vv_provincia').AsInteger   := fraDomicilioGISVisita.Prov;
    if cbSinViatico.Checked then
      FieldByName('vv_sinviatico').AsString := 'S'
    else
      FieldByName('vv_sinviatico').AsString := 'N';
    FieldByName('vv_fecha').AsDateTime      := edFechaSeleccionada.Date;
    FieldByName('vv_usualta').AsString      := Sesion.UserID;
    FieldByName('vv_fechaalta').AsDateTime  := ValorSqlDateTime(' select sysdate from dual') ;
    FieldByName('vv_usumodif').AsString     := 'NULL';
    FieldByName('vv_fechamodif').AsString   := 'NULL';
    FieldByName('vv_usubaja').AsString      := 'NULL';
    FieldByName('vv_fechabaja').AsString    := 'NULL';

    if rgLugarDestino.ItemIndex = EMPRESAAFILIADA then
    begin
      FieldByName('vv_cuit').AsString             := fraEmpresaAfiliada.CUIT;
      FieldByName('vv_estableci').AsInteger       := fraEstablecimientoAfiliada.NroEstablecimiento;
      FieldByName('vv_empresaafiliada').AsString  := 'S';
    end
    else if rgLugarDestino.ItemIndex = EMPRESANOAFILIADA then
    begin
      FieldByName('vv_cuit').AsString             := edCUITNoAfiliada.Text;
      FieldByName('vv_estableci').AsString        := 'NULL';
      FieldByName('vv_empresaafiliada').AsString  := 'N';
    end
    else if rgLugarDestino.ItemIndex = DOMICILIOPARTICULAR then
    begin
      FieldByName('vv_cuit').AsString             := 'NULL';
      FieldByName('vv_estableci').AsString        := 'NULL';
      FieldByName('vv_empresaafiliada').AsString  := 'NULL';
    end
    else if rgLugarDestino.ItemIndex = HOTEL then
    begin
      FieldByName('vv_cuit').AsString             := 'NULL';
      FieldByName('vv_estableci').AsString        := 'NULL';
      FieldByName('vv_empresaafiliada').AsString  := 'NULL';
    end;

    Post;
  end;
//  cdVisitas.ApplyUpdates();
end;

procedure TfrmCargaDeViaticos.ClearControls;
begin
  inherited;
  edNumerodeViatico.Clear;
  edFechaViaticoDesde.Clear;
  edFechaViaticoHasta.Clear;
  fraEmpresaAfiliada.Clear;
  fraEstablecimientoAfiliada.Clear;
  edCUITNoAfiliada.Clear;
  fraDomicilioGISVisita.Clear;
  rgLugarDestino.ItemIndex := -1;
end;

function TfrmCargaDeViaticos.DoABM: Boolean;
//var
//  iIdCodigo : Integer;
begin
  Result := True;
//  cdVisitas.ApplyUpdates();

{  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('OR_CODIGO').AsInteger;
      Sql.Fields.Add('OR_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('OR_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('OR_DESCRIPCION', edDescripcion.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HOR_CODIGO');
        Sql.Fields.Add('OR_USUALTA', Sesion.UserID );
        Sql.Fields.Add('OR_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('OR_CODIGO').AsInteger;
        Sql.Fields.Add('OR_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('OR_FECHAMODIF',  );
        Sql.Fields.Add('OR_USUBAJA', exNull );
        Sql.Fields.Add('OR_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('OR_CODIGO', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
   }
end;

procedure TfrmCargaDeViaticos.LoadControls;
begin
  {inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('OR_CODIGO').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('OR_DESCRIPCION').AsString;}
end;

function TfrmCargaDeViaticos.Validar: Boolean;
begin
  Result := True;

  {Result := True;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
  }
end;


procedure TfrmCargaDeViaticos.FormCreate(Sender: TObject);
var
  idpreventor : String;
begin
  idpreventor := ValorSql(
    ' SELECT it_id FROM art.pit_firmantes, art.use_usuarios '+
    '  WHERE (it_nombre = se_nombre OR it_usuario LIKE ''%'' || se_usuario) '+
    '    AND SE_ID = '+SqlValue(Sesion.ID));

  sdqConsulta.ParamByName('preventor').AsString := idpreventor;
  vclExtra.LockControls([edNumerodeViatico,edFechaViaticoHasta,fraEmpresaAfiliada,
                         fraEstablecimientoAfiliada, edCUITNoAfiliada, fraDomicilioGISVisita],
                         True);

  inherited;
end;

procedure TfrmCargaDeViaticos.edFechaViaticoDesdeChange(Sender: TObject);
var
  fechaNueva : TDateTime;
begin
  if edFechaViaticoDesde.Date <> 0 then
  begin
    fechaNueva := ValorSqlDateTime(
      ' SELECT ('+SqlDate(edFechaViaticoDesde.Date )+
      ' - (TO_CHAR('+SqlDate(edFechaViaticoDesde.Date ) +' ,''D'')-1))+1 '+
      '   FROM DUAL ');
    if edFechaViaticoDesde.Date <> fechaNueva then
      edFechaViaticoDesde.Date := fechaNueva;
    edFechaViaticoHasta.Date := fechaNueva+4;
  end
  else
    edFechaViaticoHasta.Date := 0;
  edFechaSeleccionada.Date := 0;
end;

procedure TfrmCargaDeViaticos.rgLugarDestinoClick(Sender: TObject);
begin
  if rgLugarDestino.ItemIndex = EMPRESAAFILIADA then
  begin
    vclExtra.LockControls(fraEmpresaAfiliada,False);
    vclExtra.LockControls([edCUITNoAfiliada,fraEstablecimientoAfiliada,
                           fraDomicilioGISVisita],True);
  end
  else if rgLugarDestino.ItemIndex = EMPRESANOAFILIADA then
  begin
    vclExtra.LockControls([edCUITNoAfiliada,fraDomicilioGISVisita],False);
    vclExtra.LockControls([fraEmpresaAfiliada,fraEstablecimientoAfiliada],True);
  end
  else if rgLugarDestino.ItemIndex = DOMICILIOPARTICULAR then
  begin
    vclExtra.LockControls([edCUITNoAfiliada,fraEmpresaAfiliada,
                           fraEstablecimientoAfiliada,fraDomicilioGISVisita],True);
    CargarDomicilioPreventor;
  end
  else if rgLugarDestino.ItemIndex = HOTEL then
  begin
    vclExtra.LockControls([edCUITNoAfiliada,fraEmpresaAfiliada,
                           fraEstablecimientoAfiliada],True);
    vclExtra.LockControls(fraDomicilioGISVisita,False);
  end;
end;

procedure TfrmCargaDeViaticos.CargarDomicilioPreventor;
begin
  with GetQuery(
    ' SELECT it_calle, it_numero, it_piso, it_departamento, it_cpostal, it_cpostala, '+
    '        it_localidad, it_provincia '+
    '   FROM pit_firmantes '+
    '  WHERE it_id = '+SqlValue(sdqConsulta.ParamByName('preventor').AsString)) do
  begin
    fraDomicilioGISVisita.Cargar(FieldByName('it_calle').AsString,
                                 FieldByName('it_cpostal').AsString,
                                 FieldByName('it_localidad').AsString,
                                 FieldByName('it_numero').AsString,
                                 FieldByName('it_piso').AsString,
                                 FieldByName('it_departamento').AsString,
                                 FieldByName('it_provincia').AsString,
                                 FieldByName('it_cpostala').AsString
                                );
  end;
end;

procedure TfrmCargaDeViaticos.ValidarVisita;
begin
  Verificar(edFechaViaticoDesde.Date = 0, edFechaViaticoDesde, 'Debe Seleccionar una fecha de comienzo del viático.');
  Verificar(edFechaSeleccionada.Date = 0, edFechaSeleccionada, 'Debe Seleccionar la fecha en la cual se cargara el registro de visita.');
  Verificar(rgLugarDestino.ItemIndex = -1, rgLugarDestino, 'Debe Seleccionar Lugar de Destino');
  Verificar(fraDomicilioGISVisita.IsEmpty, fraDomicilioGISVisita, 'Debe tener un Domicilio Seleccionado.');
  if rgLugarDestino.ItemIndex = EMPRESAAFILIADA then
  begin
    Verificar(fraEmpresaAfiliada.IsEmpty, fraEmpresaAfiliada, 'Debe seleccionar una empresa.');
    // Ver esta validación que puede ser que no valla
    Verificar(fraEstablecimientoAfiliada.IsEmpty, fraEstablecimientoAfiliada, 'Debe Seleccionar un Establecimiento.');
  end
  else if rgLugarDestino.ItemIndex = EMPRESANOAFILIADA then
  begin
    Verificar(edCUITNoAfiliada.Text = '', edCUITNoAfiliada, 'Debe Indicar la empresa Visitada.')
  end;
end;

procedure TfrmCargaDeViaticos.tbNuevoClick(Sender: TObject);
begin
  FIDCabeceraViatico := GetSecNextVal('HYS.SEQ_HCV_ID');
  cdVisitas.Open;
  inherited;
end;

procedure TfrmCargaDeViaticos.edFechaSeleccionadaChange(Sender: TObject);
begin
  if ((edFechaViaticoDesde.Date > edFechaSeleccionada.Date) or
     (edFechaViaticoHasta.Date < edFechaSeleccionada.Date)) and
     (edFechaSeleccionada.Date <> 0) then
  begin
    edFechaSeleccionada.Date := 0;
    InvalidMsg(edFechaSeleccionada, 'La fecha seleccionada debe estar entre la fecha desde y hasta.')
  end;
end;

end.
