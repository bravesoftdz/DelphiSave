unit unCotizacionHYS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Mask, PatternEdit, IntEdit, ToolEdit, CurrEdit, vclExtra;

type
  TfrmCotizacionHYS = class(TfrmCustomGridABM)
    fraActividad: TfraCodigoDescripcion;
    lblActividad: TLabel;
    fraEstudio: TfraCodigoDescripcion;
    lblEstudio: TLabel;
    lblPorcTrabajadores: TLabel;
    lblCosto: TLabel;
    iePorcentaje: TIntEdit;
    ceCosto: TCurrencyEdit;
    fraActividadFiltro: TfraCodigoDescripcion;
    fraEstudioFiltro: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    fpCotizacion: TFormPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnCotizar: TButton;
    btnSalir: TButton;
    fraActividadCotizacion: TfraCodigoDescripcion;
    ieCant: TIntEdit;
    ceCostoCotizacion: TCurrencyEdit;
    ToolButton1: TToolButton;
    tbCotizar: TToolButton;
    tbSalir2: TToolButton;
    ToolButton9: TToolButton;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbCotizarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fpCotizacionShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    procedure RefreshData; override;
  end;

var
  frmCotizacionHYS: TfrmCotizacionHYS;

implementation

uses
  CustomDlgs, unCustomConsulta, unDmPrincipal, unPrincipal, SqlFuncs, AnsiSQL;

{$R *.dfm}

{ TfrmCustomGridABM1 }

procedure TfrmCotizacionHYS.ClearControls;
begin
  inherited;
  fraActividad.Clear;
  fraActividad.Locked:=false;
  fraEstudio.Locked:=false;
  fraEstudio.Clear;
  iePorcentaje.clear;
  ceCosto.clear;
  fraActividadFiltro.Clear;
  fraEstudioFiltro.Clear;
  
end;

function TfrmCotizacionHYS.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('CH_ID', sdqConsulta.FieldByName('CH_ID').AsString);
    Sql.Fields.Add('CH_USUBAJA', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('CH_FECHABAJA', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('CH_ID', ValorSqlInteger ('SELECT HYS.SEQ_HCH_ID.nextval FROM dual'));
      Sql.Fields.Add('CH_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('CH_FECHAALTA', exDateTime);
      Sql.Fields.Add('CH_PORCENTAJE', iePorcentaje.value);
      Sql.Fields.Add('CH_COSTO', ceCosto.value);
      Sql.Fields.Add('CH_IDACTIVIDAD', fraActividad.value);
      Sql.Fields.Add('CH_IDESTUDIO', fraEstudio.value);
    end
    else        //maModificacion
    begin
      fraActividad.Locked:=true;
      fraEstudio.Locked:=true;
      Sql.PrimaryKey.Add('CH_ID', sdqConsulta.FieldByName('CH_ID').AsString);
      Sql.Fields.Add('CH_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('CH_FECHAMODIF', exDateTime);
      Sql.Fields.Add('CH_USUBAJA', exNull);
      Sql.Fields.Add('CH_FECHABAJA', exNull);
      Sql.Fields.Add('CH_PORCENTAJE', iePorcentaje.value);
      Sql.Fields.Add('CH_COSTO', ceCosto.value);
    end;


  end;
  Result := inherited DoABM;
end;

procedure TfrmCotizacionHYS.LoadControls;
begin
  inherited;
  fraActividad.Locked:=true;
  fraEstudio.Locked:=true;
  fraActividad.value:=sdqConsulta.FieldByName('ch_idactividad').AsInteger;
  fraEstudio.value := sdqConsulta.FieldByName('ch_idestudio').AsInteger  ;
  iePorcentaje.Value:=sdqConsulta.FieldByName('ch_porcentaje').AsInteger ;
  ceCosto.Value:=sdqConsulta.FieldByName('ch_costo').AsCurrency ;
end;

function TfrmCotizacionHYS.Validar: Boolean;
begin
  verificar(not fraActividad.IsSelected, fraActividad, 'Debe seleccionar una actividad' );
  verificar(not fraEstudio.IsSelected, fraEstudio, 'Debe seleccionar un estudio' );
  if ModoABM = maAlta Then
  begin
    verificar(ExisteSqlEx('select * from HYS.HCH_COTIZACIONHYS where ch_idactividad = :act and ch_idestudio = :est and ch_fechabaja is null', [ fraActividad.value, fraEstudio.value]), fpAbm, 'La relación ya existe');
  end;
  result:=true;
end;

procedure TfrmCotizacionHYS.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName :=  'hys.hch_cotizacionhys';
  FieldBaja := 'ch_fechabaja';

  with fraActividad do
  begin
    TableName     := 'comunes.cac_actividad';
    FieldID       := 'ac_id';
    FieldCodigo   := 'ac_codigo';
    FieldDesc     := 'ac_descripcion';
    FieldBaja     := 'ac_fechabaja';
    ShowBajas     := true;
  end;

  with fraEstudio do
  begin
    TableName     := 'ART.AES_ESTUDIOS';
    FieldID       := 'es_id';
    FieldCodigo   := 'es_codigo';
    FieldDesc     := 'es_descripcion';
    FieldBaja     := 'es_fechabaja';
    ShowBajas     := true;
  end;

  with fraActividadFiltro do
  begin
    TableName     := 'comunes.cac_actividad';
    FieldID       := 'ac_id';
    FieldCodigo   := 'ac_codigo';
    FieldDesc     := 'ac_descripcion';
    FieldBaja     := 'ac_fechabaja';
    ShowBajas     := true;
  end;

  with fraEstudioFiltro do
  begin
    TableName     := 'ART.AES_ESTUDIOS';
    FieldID       := 'es_id';
    FieldCodigo   := 'es_codigo';
    FieldDesc     := 'es_descripcion';
    FieldBaja     := 'es_fechabaja';
    ShowBajas     := true;
  end;
  tbSalir2.ImageIndex := 10;
  tbCotizar.ImageIndex:= 40;

end;

procedure TfrmCotizacionHYS.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT CH_IDACTIVIDAD, CH_IDESTUDIO, AC_DESCRIPCION, ES_DESCRIPCION, CH_PORCENTAJE, CH_COSTO, CH_USUALTA, CH_FECHAALTA, CH_USUMODIF, CH_FECHAMODIF, CH_USUBAJA, CH_FECHABAJA, CH_ID ' +
          ' FROM hys.hch_cotizacionhys, comunes.cac_actividad, ART.AES_ESTUDIOS where CH_IDACTIVIDAD = AC_ID and CH_IDESTUDIO = ES_ID';


  if (fraEstudioFiltro.IsSelected) or (fraEstudioFiltro.Codigo <> '') then
    Addcondition(sSql, ' CH_IDESTUDIO = ' + SQLValue(fraEstudioFiltro.Value));
  if fraActividadFiltro.IsSelected then
    Addcondition(sSql, ' CH_IDACTIVIDAD = ' + SQLValue(fraActividadFiltro.Value));

  sdqConsulta.SQL.Text := sSql;
  inherited;
end;

procedure TfrmCotizacionHYS.tbSalir2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCotizacionHYS.tbCotizarClick(Sender: TObject);
begin
  with fraActividadCotizacion do
  begin
    tablename:= 'comunes.cac_actividad';
    FieldID       := 'ac_id';
    FieldCodigo   := 'ac_codigo';
    FieldDesc     := 'ac_descripcion';
    FieldBaja     := 'ac_fechabaja';
    Value:= sdqConsulta.FieldByName('ch_idactividad').AsInteger;
  end;
  VclExtra.LockControls([ceCostoCotizacion],True);
  ieCant.Clear;
  ceCostoCotizacion.Clear;
  fpCotizacion.ShowModal;
end;

procedure TfrmCotizacionHYS.btnAceptarClick(Sender: TObject);
begin
  verificar(ieCant.Value =0, ieCant, 'La cantidad de trabajadores debe ser mayor a cero');
  ceCostoCotizacion.Value:=  ValorSqlExtended('select amp.get_cotizacionamp(' + SQLValue(fraActividadCotizacion.value) + ', ' + SQLValue(ieCant.text) + ') as costo from dual');
end;

procedure TfrmCotizacionHYS.fpCotizacionShow(Sender: TObject);
begin
  ieCant.SetFocus;
end;

end.
