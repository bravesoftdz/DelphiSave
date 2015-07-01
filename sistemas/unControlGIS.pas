unit unControlGIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, AdvMemo, DBAdvMemo, Advmxml,
  JvExControls, JvComponent, JvAnimatedImage, JvGIFCtrl, CheckLst,
  ARTCheckListBox, DBCtrls, ImagingComponents, JvExExtCtrls, JvImage, Mask,
  ToolEdit, DateComboBox, ActnList, Menus, unfraUsuarios, RxToolEdit, RxPlacemnt,
  PatternEdit, IntEdit;

type
  TfrmControlGIS = class(TfrmCustomConsulta)
    tbVerificarProvincias: TToolButton;
    ShortCutControlHijo: TShortCutControl;
    Panel1: TPanel;
    Label2: TLabel;
    lbCantidadTotal: TLabel;
    AdvXMLMemoStyler: TAdvXMLMemoStyler;
    DBAdvMemoResultado: TDBAdvMemo;
    SplitterBottom: TSplitter;
    tbVerificarLocalidades: TToolButton;
    pnlProgreso: TPanel;
    Label3: TLabel;
    lbProgreso: TLabel;
    ImagenGIF: TJvGIFAnimator;
    tbValidarDato: TToolButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    cblADMIN_LEVEL_ONE: TARTCheckListBox;
    cblGM_LOCALITY: TARTCheckListBox;
    cblGM_TYPE: TARTCheckListBox;
    cblGM_STATUS: TARTCheckListBox;
    tbReprocesar: TToolButton;
    Panel10: TPanel;
    btnCancelar: TButton;
    lbURL: TDBText;
    SplitterXML: TSplitter;
    btnGoogleMaps: TJvImage;
    pnlFiltrosLeft: TPanel;
    lbTipo: TLabel;
    lbLocalidad: TLabel;
    lbProvincia: TLabel;
    lbFechaValidacion: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edGM_FECHAALTADesde: TDateComboBox;
    edGM_FECHAVALIDACIONDesde: TDateComboBox;
    edGM_FECHAVALIDACIONHasta: TDateComboBox;
    edGM_FECHAALTAHasta: TDateComboBox;
    fraGM_LOCALIDAD: TfraCodDesc;
    fraGM_PROVINCIA: TfraCodDesc;
    fraGM_TIPO: TfraCodDesc;
    PopupMenu: TPopupMenu;
    ActionList: TActionList;
    acValidar: TAction;
    acValidar1: TMenuItem;
    acReprocesar: TAction;
    Reprocesarregistro1: TMenuItem;
    rgValidacion: TRadioGroup;
    fraGM_USUALTA: TfraUsuario;
    Label1: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    cblID_ESTADO: TARTCheckListBox;
    Label4: TLabel;
    edGM_ID: TIntEdit;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbVerificarProvinciasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
    procedure tbVerificarLocalidadesClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure lbURLClick(Sender: TObject);
    procedure btnGoogleMapsClick(Sender: TObject);
    procedure acValidarExecute(Sender: TObject);
    procedure acReprocesarExecute(Sender: TObject);
  private
    FSQL: String;
    FCancelar: Boolean;
    procedure MostrarProgeso(ARegistro, ATotal: Integer);
  public
    procedure ClearData; override;
    procedure RefreshData; override;    
  end;

var
  frmControlGIS: TfrmControlGIS;

implementation

uses
  unFiltros, VCLExtra, unDmPrincipal, unFraGIS_APIv3, CustomDlgs, unArt, unEspera, ShellAPI,
  General, unGIS, StrFuncs, AnsiSql;

{$R *.dfm}

procedure TfrmControlGIS.ClearData;
begin
  ClearComponentData(pnlFiltros);
  sdqConsulta.Close;
end;

procedure TfrmControlGIS.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if Assigned(DataSet) then
    DynColWidthsByData(Grid);
     
  lbCantidadTotal.Caption := IntToStr(sdqConsulta.RecordCount);
end;

procedure TfrmControlGIS.MostrarProgeso(ARegistro, ATotal: Integer);
begin
  if not FCancelar then
  begin
    pnlProgreso.Show;
    ImagenGIF.Animate := True;
    lbProgreso.Caption := IntToStr(ARegistro + 1) + ' de ' + IntToStr(ATotal);
    pnlProgreso.Invalidate;
    lbProgreso.Invalidate;
    Application.ProcessMessages;
  end;

  if ((ARegistro + 1) = ATotal) or FCancelar then
  begin
    ImagenGIF.Animate := False;
    pnlProgreso.Hide;
  end;
end;

procedure TfrmControlGIS.tbVerificarProvinciasClick(Sender: TObject);
var
  objDireccion: TAddress;
begin
  FCancelar := False;
  with GetQuery('SELECT * FROM cpv_provincias WHERE pv_codigo < 30') do
  try
    BeginTrans(True);
    try
      while not Eof do
      begin
        MostrarProgeso(RecNo, RecordCount);
        objDireccion := GetAddress('', 0, 0, '', FieldByName('pv_descripcion').AsString, FieldByName('pv_codigo').AsString);
        //IniciarEspera('Buscando en Google Maps...' + CRLF + objDireccion.DireccionCompleta);
        try
          try
            GeoCodeAddress(objDireccion, 'PV');
          except
            on E: Exception do
              ShowMessage('Error al geocodificar: ' + E.Message);
          end;
        finally
          objDireccion.Free;
          //DetenerEspera;
        end;
        Next;
      end;
      CommitTrans(True);
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
        RollBack(True);
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmControlGIS.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL := sdqConsulta.SQL.Text;
  FCancelar := False;
  tbReprocesar.Left := tbNuevo.Left;
  tbValidarDato.Left := tbNuevo.Left;
  tbVerificarLocalidades.Left := tbNuevo.Left;
  tbVerificarProvincias.Left := tbNuevo.Left;
  VCLExtra.LockControls([DBAdvMemoResultado], True);
  ToolBar.Images    := dmPrincipal.ilByN;
  ToolBar.HotImages := dmPrincipal.ilColor;
end;

procedure TfrmControlGIS.RefreshData;
var
  sSQL, sWhere: String;
begin
  if edGM_ID.IsEmpty then
  begin
    case rgValidacion.ItemIndex of
      1: sWhere := ' AND GM_FECHAVALIDACION IS NOT NULL ';
      2: sWhere := ' AND GM_FECHAVALIDACION IS NULL ';
    end;
    sSQL := FSQL + DoFiltro(pnlFiltrosLeft) + DoFiltro(pnlFiltros);
  end else
    sSQL := FSQL + DoFiltroComponente(edGM_ID, 'GM_ID');

  sdqConsulta.SQL.Text := sSQL + sWhere + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmControlGIS.tbEliminarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  if MsgAsk('¿Esta seguro que desea dar de baja el registro?') then
  begin
    EjecutarSQLEx('DELETE FROM comunes.cgm_googlemaps WHERE gm_id = :id', [sdqConsulta.FieldByName('gm_id').AsInteger]);
    RefreshData;
  end;
end;

procedure TfrmControlGIS.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  lbCantidadTotal.Caption := '-';
end;

procedure TfrmControlGIS.tbVerificarLocalidadesClick(Sender: TObject);
var
  objDireccion: TAddress;
begin
  inherited;
  FCancelar := False;
  with GetQuery('SELECT distinct ub_cpostal, ub_localidad, pv_descripcion, pv_codigo FROM ( ' +
                'SELECT DISTINCT ub_cpostal, ub_localidad, pv_descripcion, pv_codigo ' +
                  'FROM cub_ubicacion, art.cpv_provincias ' +
                 'WHERE ub_provincia = pv_codigo ' +
                   'AND NOT EXISTS(SELECT 1 ' +
                                    'FROM comunes.cgm_googlemaps ' +
                                   'WHERE gm_calle IS NULL ' +
                                     'AND gm_cpostal = ub_cpostal ' +
                                     'AND gm_localidad = ub_localidad ' +
                                     'AND gm_provincia = ub_provincia ' +
                                     'AND gm_status = ''OK'') ' +
                   'AND EXISTS (SELECT 1 ' +
                                ' FROM art.sau_autorizaciones ' +
                                'WHERE ub_cpostal = au_hcpostal ' +
                                  'AND ub_localidad = au_hlocalidad ' +
                                  'AND ub_provincia = au_hprovincia ' +
                                  'AND au_fechaalta > SYSDATE - 365) ' +
                 'UNION ' +
                'SELECT DISTINCT ub_cpostal, ub_localidad, pv_descripcion, pv_codigo ' +
                  'FROM cub_ubicacion, art.cpv_provincias ' +
                 'WHERE ub_provincia = pv_codigo ' +
                   'AND NOT EXISTS(SELECT 1 ' +
                                    'FROM comunes.cgm_googlemaps ' +
                                   'WHERE gm_calle IS NULL ' +
                                     'AND gm_cpostal = ub_cpostal ' +
                                     'AND gm_localidad = ub_localidad ' +
                                     'AND gm_provincia = ub_provincia ' +
                                     'AND gm_status = ''OK'') ' +
                   '  AND EXISTS (SELECT 1 ' +
                                  ' FROM art.sau_autorizaciones ' +
                                  'WHERE ub_cpostal = au_dcpostal ' +
                                    'AND ub_localidad = au_dlocalidad ' +
                                    'AND ub_provincia = au_dprovincia ' +
                                    'AND au_fechaalta > SYSDATE - 365) ) ' +
                'ORDER BY TO_NUMBER(pv_codigo) DESC') do
  try
    BeginTrans(True);
    try
      while (not FCancelar) and (not Eof) do                         
      begin
        MostrarProgeso(RecNo, RecordCount);
        objDireccion := GetAddress('', 0, FieldByName('ub_cpostal').AsInteger, FieldByName('ub_localidad').AsString, FieldByName('pv_descripcion').AsString, FieldByName('pv_codigo').AsString);
        //IniciarEspera('Buscando en Google Maps...' + CRLF + objDireccion.DireccionCompleta);
        try
          try
            GeoCodeAddress(objDireccion, 'L');
            Sleep(500);
            if RecNo mod 10 = 0 then
            begin
              CommitTrans(True);
              BeginTrans(True);
            end;
          except
            on E: Exception do
              ShowMessage('Error al geocodificar: ' + E.Message);
          end;
        finally
          objDireccion.Free;
          //DetenerEspera;
        end;
        Next;
      end;
      CommitTrans(True);
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
        RollBack(True);
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmControlGIS.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(Field.FullName, ['GM_ID', 'TG_DESCRIPCION', 'GM_CALLE', 'GM_NUMERO', 'GM_CPOSTAL', 'GM_LOCALIDAD', 'GM_PROVINCIA', 'PV_DESCRIPCION', 'GM_LAT', 'GM_LNG']) then
  begin
    if Field.DataSet.FieldByName('gm_fechavalidacion').IsNull then
      if Field.DataSet.FieldByName('gm_status').AsString = STATUS_OK then
        AFont.Color := clNavy
      else
        AFont.Color := clRed
    else
      if Field.DataSet.FieldByName('gm_status').AsString = STATUS_OK then
        AFont.Color := clTeal
      else
        AFont.Color := clMaroon;
  end;

  {if Highlight then
  begin
    AFont.Name := 'Courier new';
    AFont.Style := AFont.Style + [fsBold]; 
  end;}
end;

procedure TfrmControlGIS.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FCancelar := True;
end;

procedure TfrmControlGIS.lbURLClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar((Sender as TDBText).Caption), '', '', SW_SHOWNORMAL);
end;

procedure TfrmControlGIS.btnGoogleMapsClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  ShellExecute(Application.Handle, nil, PChar('http://maps.google.com.ar/maps?q=' +
                                              StringReplace(FloatToStr(sdqConsulta.FieldByName('gm_lat').AsFloat), ',', '.', []) + ',' +
                                              StringReplace(FloatToStr(sdqConsulta.FieldByName('gm_lng').AsFloat), ',', '.', [])), '', '', SW_SHOWNORMAL);
end;

procedure TfrmControlGIS.acValidarExecute(Sender: TObject);
var
  sLocality: String;
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  if MsgAsk('¿Esta seguro que desea validar el registro?') then
  begin
    if sdqConsulta.FieldByName('gm_locality').IsNull then
      sLocality := InputBox('Opción de Reemplazo', 'Localidad', '')
    else
      sLocality := '';

    EjecutarSQLEx('UPDATE comunes.cgm_googlemaps SET gm_usuvalidacion = ART.GETOSUSER, gm_fechavalidacion = SYSDATE, gm_status = :status ' + iif(IsEmptyString(sLocality), '', ', gm_locality = ' + SQLValue(sLocality)) + ' WHERE gm_id = :id', [STATUS_OK, sdqConsulta.FieldByName('gm_id').AsInteger]);
    sdqConsulta.Refresh;
    sdqConsultaAfterOpen(nil);
  end;
end;

procedure TfrmControlGIS.acReprocesarExecute(Sender: TObject);
var
  objDireccion: TAddress;
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  if MsgAsk('¿Esta seguro que desea reprocesar el registro?') then
  with sdqConsulta do
  begin
    BeginTrans(True);
    try
      EjecutarSQLSTEx('UPDATE comunes.cgm_googlemaps SET gm_usuvalidacion = NULL, gm_fechavalidacion = NULL, gm_status = :status WHERE gm_id = :id', ['REPROCESADO', sdqConsulta.FieldByName('gm_id').AsInteger]);    
      objDireccion := GetAddress(FieldByName('gm_calle').AsString, FieldByName('gm_numero').AsInteger, FieldByName('gm_cpostal').AsInteger, FieldByName('gm_localidad').AsString, FieldByName('pv_descripcion').AsString, FieldByName('gm_provincia').AsString);
      try
        try
          GeoCodeAddress(objDireccion, FieldByName('gm_tipo').AsString, True);
        except
          on E: Exception do
            ShowMessage('Error al geocodificar: ' + E.Message);
        end;
      finally
        objDireccion.Free;
      end;
      CommitTrans(True);
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
        RollBack(True);
      end;
    end;
  end;
end;

end.
