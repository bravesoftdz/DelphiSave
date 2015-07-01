unit unManWSEstablecimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, RxPlacemnt, Vcl.Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, unFraCodDesc, RxToolEdit, DateComboBox;

type
  TfrmManWSEstablecimientos = class(TfrmCustomGridABM)
    Label1: TLabel;
    mskCUIT: TMaskEdit;
    mskCuitFiltro: TMaskEdit;
    Label2: TLabel;
    Button1: TButton;
    fpBaja: TFormPanel;
    btnAceptarBaja: TButton;
    btnCancelarBaja: TButton;
    Bevel1: TBevel;
    fraMotivoBaja: TfraCodDesc;
    Label3: TLabel;
    fpRectificacion: TFormPanel;
    btnCancelarRectificacion: TButton;
    btnAceptarRectificacion: TButton;
    Bevel2: TBevel;
    GroupBox1: TGroupBox;
    edCodigoEstablecimiento: TEdit;
    Label4: TLabel;
    fraTipoEstablecimiento: TfraCodDesc;
    edNombre: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edCalle: TEdit;
    edInterseccion: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edAltura: TEdit;
    edPiso: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    edDepto: TEdit;
    fraProvincias: TfraCodDesc;
    Label18: TLabel;
    Label16: TLabel;
    fraLocalidad: TfraCodDesc;
    edLocalidad: TEdit;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edCPA: TEdit;
    edCP: TEdit;
    chkPrincipal: TCheckBox;
    chkTemporal: TCheckBox;
    Label21: TLabel;
    edLongitud: TEdit;
    Label22: TLabel;
    edLatitud: TEdit;
    Label11: TLabel;
    fraOrganismoEstablecimiento: TfraCodDesc;
    fraTipoOrganismoEstablecimiento: TfraCodDesc;
    Label23: TLabel;
    Label24: TLabel;
    GroupBox2: TGroupBox;
    edCIIU: TEdit;
    Label8: TLabel;
    edCodigoEstabEmpre: TEdit;
    Label9: TLabel;
    Label5: TLabel;
    edCuit: TEdit;
    chkPropio: TCheckBox;
    edFinActividad: TDateComboBox;
    lbFinActividad: TLabel;
    Label10: TLabel;
    edInicioActividad: TDateComboBox;
    fraTipoOrganismoEmpresa: TfraCodDesc;
    Label25: TLabel;
    fraOrganismoEmpresa: TfraCodDesc;
    Label26: TLabel;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure btnAceptarBajaClick(Sender: TObject);
    procedure btnCancelarBajaClick(Sender: TObject);
    procedure fpBajaShow(Sender: TObject);
    procedure btnAceptarRectificacionClick(Sender: TObject);
    procedure btnCancelarRectificacionClick(Sender: TObject);
    procedure edAlturaKeyPress(Sender: TObject; var Key: Char);
    procedure fraProvinciasExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function DoABM: Boolean; override;
    function Validar : Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure LoadSQL;
  end;

var
  frmManWSEstablecimientos: TfrmManWSEstablecimientos;

implementation

uses unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, Strfuncs, unWSEstablecimientos, unImportCryptoSrt;

{$R *.dfm}

{ TfrmManContratosTrabNoConfirmados }

procedure TfrmManWSEstablecimientos.btnAceptarBajaClick(Sender: TObject);
begin
  Verificar(fraMotivoBaja.IsEmpty, fraMotivoBaja, 'El motivo de baja es obligatorio');
  fpBaja.ModalResult := MrOk;
end;

procedure TfrmManWSEstablecimientos.btnAceptarClick(Sender: TObject);
begin
  inherited;
  tbRefrescarClick(nil);
end;

procedure TfrmManWSEstablecimientos.btnAceptarRectificacionClick(
  Sender: TObject);
begin
  Verificar(fraTipoEstablecimiento.IsEmpty, fraTipoEstablecimiento, 'El Tipo de establecimiento no puede quedar vacío');
  fpRectificacion.ModalResult := MrOk;
end;

procedure TfrmManWSEstablecimientos.btnCancelarBajaClick(Sender: TObject);
begin
  fpBaja.ModalResult := MrCancel;
end;

procedure TfrmManWSEstablecimientos.btnCancelarRectificacionClick(
  Sender: TObject);
begin
  fpRectificacion.ModalResult := MrCancel;
end;

procedure TfrmManWSEstablecimientos.Button1Click(Sender: TObject);
//var
 // aQuery: TSDQuery;
 // sSql: String;
//GetTablasReferencia;
 // Lista : TStringList;
 // i : Integer;
 { SincronizarTablasEServicios;
  SincronizarTiposEstablecimientos;
  SincronizarLocalidades;
  SincronizarARTsSRT;
  SincronizarTiposOrganismo;
  SincronizarMotivosBaja; }
  //SincronizarProvinciasSRT;
begin
  {GetTablasReferencia;
  SincronizarTablasEServicios;
  SincronizarTiposEstablecimientos;
  SincronizarARTsSRT;
  SincronizarTiposOrganismo;
  SincronizarMotivosBaja;
  SincronizarProvinciasSRT;
  SincronizarLocalidades; }
  {sSql :=
    'SELECT AE_CUIT FROM CVONWERNICH.CAE_ACTUALIZAESTAB WHERE ae_fechaproceso IS NULL ORDER BY 1';
  aQuery := GetQueryEx(sSql, []);
  with aQuery do
  begin
    while not EOF do
    begin
      GetEstablecimientosPorCuit(FieldByName('ae_cuit').AsString);
      EjecutarSQLEx('UPDATE CVONWERNICH.CAE_ACTUALIZAESTAB SET ae_fechaproceso = SYSDATE WHERE ae_cuit =:cuit ', [FieldByName('ae_cuit').AsString]);
      Next;
    end;
    Free;           texto 472  alta ayer, pendiente de impresion 8897     ,  24

  end;  }

{Lista := TStringList.Create;
Lista.Add('30712192425');
Lista.Add('30711574650');
Lista.Add('30711707405');
Lista.Add('33712486819');
Lista.Add('27260894795');
Lista.Add('30710727542');
Lista.Add('30710703120');
Lista.Add('30711242038');
Lista.Add('30711124507');
Lista.Add('30711169705');
Lista.Add('30701299538');
Lista.Add('33501035829');
Lista.Add('30708277068');
Lista.Add('33600848009');
Lista.Add('33614072429');
Lista.Add('33686271809');
Lista.Add('30709033537');
Lista.Add('30708789751');
Lista.Add('30708771402');
Lista.Add('30710036027');
Lista.Add('30710012462');
Lista.Add('30709810770');
Lista.Add('30709693081');
Lista.Add('30709621684');
Lista.Add('30709359815');
Lista.Add('30709352942');
Lista.Add('30709068772');
Lista.Add('30709576212');
Lista.Add('30709215295');
Lista.Add('30707393366');
Lista.Add('27230895185');
Lista.Add('27143181273');
Lista.Add('27122103019');
Lista.Add('23139653629');
Lista.Add('20928684866');
Lista.Add('20243320063');
Lista.Add('20221790422');
Lista.Add('20219561319');
Lista.Add('20135403009');
Lista.Add('20169745588');
Lista.Add('20131387521');
Lista.Add('20117588301');
Lista.Add('30681016666');
Lista.Add('20114727580');
Lista.Add('30678661313');
Lista.Add('30652258510');
Lista.Add('20112235923');
Lista.Add('20085377729');
Lista.Add('20084475573');
Lista.Add('30698866299');
Lista.Add('30534924948');
Lista.Add('30708832320');
Lista.Add('30708656212');
Lista.Add('30708459255');
Lista.Add('30707842845');
Lista.Add('30707173870');
Lista.Add('30707167870');
Lista.Add('30696700776');
Lista.Add('30696256574');
Lista.Add('30688428846');
Lista.Add('30688425324');
Lista.Add('30685777823');
Lista.Add('30679674761');
Lista.Add('30663197041');
Lista.Add('30646115678');
Lista.Add('30620589132');
Lista.Add('30610975719');
Lista.Add('30604207947');
Lista.Add('30587834304');
Lista.Add('30559759062');
Lista.Add('30552444759');
Lista.Add('30551414244');
Lista.Add('30543843098');
Lista.Add('30540240503');
Lista.Add('30537800921');
Lista.Add('30536355525');
Lista.Add('30503381407');
Lista.Add('30501974532');
Lista.Add('30709720682');
Lista.Add('30709211656');
Lista.Add('30709147354');
Lista.Add('30708664800');
Lista.Add('30707634193');
Lista.Add('30707065741');
Lista.Add('30707009892');
Lista.Add('30697616019');
Lista.Add('30694379334');
Lista.Add('30688180321');
Lista.Add('30684151963');
Lista.Add('30679634360');
Lista.Add('30679107220');
Lista.Add('30676947767');
Lista.Add('30661656359');
Lista.Add('30644102498');
Lista.Add('30637389641');
Lista.Add('30630962249');
Lista.Add('30623466341');
Lista.Add('30613091110');
Lista.Add('30589123286');
Lista.Add('30568731936');
Lista.Add('30548917715');
Lista.Add('30546224380');
Lista.Add('30540487711');
Lista.Add('30516984674');
Lista.Add('30506242548');
Lista.Add('30709220124');
Lista.Add('30703443059');

for i := 0 to Lista.Count -1 do
  ConsultarVigencia(Lista[i]);
 }
   //E:\Servicios\Produccion\TEMP  C:\SrvWorldsys\TEMP
 //EjecutarSqlEx('UPDATE cca_carta set ca_idhistoricotextocarta = 1027 WHERE ca_id = 3983455' , []);

  //EjecutarSqlEx('UPDATE pep.PPA_PARAMFTP set pa_dirtemp = ''E:\Servicios\Produccion\TEMP'' where pa_id = 1' , []);
 //GetXMLReferencia('OPERACIONES_CONTRATOS');
end;

procedure TfrmManWSEstablecimientos.Button2Click(Sender: TObject);
begin
   {EjecutarSqlEx('DELETE FROM SRT.SCA_CODIGOSART', []);
   EjecutarSQLEx('DELETE FROM SRT.SES_ESTABLECIMIENTO', []);
  EjecutarSqlEx('DELETE FROM SRT.SEE_ESTABLECIMIENTOEMPRESA', []);  }
end;

procedure TfrmManWSEstablecimientos.ClearControls;
begin
  mskCuit.Clear;
end;

function TfrmManWSEstablecimientos.DoABM: Boolean;
begin
  GetEstablecimientosPorCuit(mskCuit.Text);
  Result := True;
end;

procedure TfrmManWSEstablecimientos.edAlturaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9', ',']) then
    Key := #0;
end;

procedure TfrmManWSEstablecimientos.LoadControls;
begin
  mskCuit.Text := sdqConsulta.FieldByName('ee_cuit').AsString;
end;

function TfrmManWSEstablecimientos.Validar: Boolean;
begin
  Verificar(mskCuit.Text = '', mskCuit, 'El contrato no puede quedar vacío');
  Result := True;
end;

procedure TfrmManWSEstablecimientos.FormCreate(Sender: TObject);
begin
  LoadSQL;
  inherited;
  Sql.TableName := 'SRT.SEE_ESTABLECIMIENTOEMPRESA';
end;

procedure TfrmManWSEstablecimientos.fpBajaShow(Sender: TObject);
begin
  fraMotivoBaja.Clear;
end;

procedure TfrmManWSEstablecimientos.fraProvinciasExit(Sender: TObject);
begin
  inherited;
  fraProvincias.FrameExit(Sender);
  if not fraProvincias.IsEmpty then
  begin
    fraLocalidad.Propiedades.ExtraCondition :=  ' AND ls_idprovinciasrt = ' + SQLValue(fraProvincias.Value);
    fraLocalidad.Clear;
  end
  else
    fraLocalidad.Propiedades.ExtraCondition := '';
end;

procedure TfrmManWSEstablecimientos.LoadSQL;
begin
  sdqConsulta.SQL.Text :=
    'SELECT ee_id, ee_ciiu, ee_codigo, ee_cuit, ee_fechaaltasrt, ee_finactividad, ' +
    '       ee_inicioactividad, ee_motivobaja, ee_organismo, ee_propio, ee_tipoorganismo, ' +
    '       es_id, es_codigo, es_calle, es_altura, es_cp, es_cpa, es_cuit, es_descripcion, ' +
    '       es_dpto, es_interseccion, es_latitud, es_longitud, es_localidad, es_idlocalidad, '+
    '       es_motivobaja, mb_nombre, es_numeroestablecimiento, es_organismo, es_piso, es_idprovincia, ' +
    '       es_temporal, es_tipoestablecimiento, es_tipoorganismo, es_fechaalta, es_usualta, ' +
    '       es_fechamodif, es_usumodif, es_fechabaja, es_usubaja , es_idestablecimientoempresa ' +
    '       ca_codigoart ' +
    ' FROM srt.see_establecimientoempresa ' +
    ' LEFT JOIN srt.ses_establecimiento ON es_idestablecimientoempresa = ee_id ' +
    ' LEFT JOIN srt.sca_codigosart ON es_id = ca_idestablecimiento ' +
    ' LEFT JOIN srt.smb_motivobaja ON es_motivobaja = mb_id ' +
    ' WHERE 1 = 1 ';

   if mskCuitFiltro.Text <> '' then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text  + ' AND ee_cuit = ' + SQLValue(mskCuitFiltro.Text);
 {  if not edEECodigo.IsEmpty then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text  + ' AND ee_codigo = ' + SQLValue(edEECodigo.Value);
   if not edESCodigo.IsEmpty then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text  + ' AND es_codigo = ' + SQLValue(edESCodigo.Value);  }

end;

procedure TfrmManWSEstablecimientos.tbEliminarClick(Sender: TObject);
var
  EstabEmpre : TEstablecimientoEmpresa;
  Resultado : Boolean;
begin
   EstabEmpre := GetEstablecimientoEmpresaFromDB(sdqConsulta.FieldByName('ee_id').AsInteger);
   if fpBaja.ShowModal = MrOk then
   begin
    EstabEmpre.MotivoBaja :=  fraMotivoBaja.Value;
    EstabEmpre.Establecimiento.MotivoBaja := fraMotivoBaja.Value;
    Resultado := EliminarEstablecimiento(EstabEmpre);
    EliminarEstablecimientoEmpresa(EstabEmpre);
    if Resultado then
      ShowMessage('Eliminacion Ok')
    else
      ShowMessage('Error');
   end;
end;

procedure TfrmManWSEstablecimientos.tbModificarClick(Sender: TObject);
var
  EstabEmpre : TEstablecimientoEmpresa;
  Resultado : Boolean;
begin
   EstabEmpre := GetEstablecimientoEmpresaFromDB(sdqConsulta.FieldByName('ee_id').AsInteger);
   edCodigoEstablecimiento.Text := IntToStr(EstabEmpre.Establecimiento.Codigo);
   edCodigoEstabEmpre.Text := IntToStr(EstabEmpre.Codigo);

   edCuit.Text := EstabEmpre.Cuit;
   edCiiu.Text := IntToStr(EstabEmpre.Ciiu);
   chkPropio.Checked := EstabEmpre.Propio;
   edFinActividad.Clear;
   edFinActividad.Date := EstabEmpre.FinActividad;
   edInicioActividad.Date := EstabEmpre.InicioActividad;
   fraOrganismoEmpresa.Value := EstabEmpre.Organismo;
   fraTipoOrganismoEmpresa.Value := EstabEmpre.TipoOrganismo;

   fraTipoEstablecimiento.Value := EstabEmpre.Establecimiento.TipoEstablecimiento;
   edNombre.Text := EstabEmpre.Establecimiento.Descripcion;
   edCalle.Text := EstabEmpre.Establecimiento.Calle;
   edInterseccion.Text := EstabEmpre.Establecimiento.Interseccion;
   edAltura.Text := FloatToStr(EstabEmpre.Establecimiento.Altura);
   edPiso.Text   := EstabEmpre.Establecimiento.Piso;
   edDepto.Text  := EstabEmpre.Establecimiento.Dpto;
   fraProvincias.Value := EstabEmpre.Establecimiento.ProvinciaId;
   fraLocalidad.Value := EstabEmpre.Establecimiento.LocalidadId;
   edLocalidad.Text := EstabEmpre.Establecimiento.Localidad;
   edCPA.Text       := EstabEmpre.Establecimiento.CPA;
   edCP.Text        := EstabEmpre.Establecimiento.CP;
   chkPrincipal.Checked := EstabEmpre.Establecimiento.Principal;
   chkTemporal.Checked := EstabEmpre.Establecimiento.Principal;
   edLongitud.Text := FloatToStr(EstabEmpre.Establecimiento.Longitud);
   edLatitud.Text  := FloatToStr(EstabEmpre.Establecimiento.Latitud);
   fraOrganismoEstablecimiento.Value := EstabEmpre.Establecimiento.Organismo;
   fraTipoOrganismoEstablecimiento.Value := EstabEmpre.Establecimiento.TipoOrganismo;

   if fpRectificacion.ShowModal = MrOk then
   begin
     EstabEmpre.Codigo := StrToInt(edCodigoEstabEmpre.Text);
     EstabEmpre.Establecimiento.Codigo := StrToInt(edCodigoEstablecimiento.Text);
     EstabEmpre.Cuit := edCuit.Text;
     EstabEmpre.Ciiu := StrToInt(edCiiu.Text);
     EstabEmpre.Propio := chkPropio.Checked;
     EstabEmpre.FinActividad := edFinActividad.Date;
     EstabEmpre.InicioActividad := edInicioActividad.Date;
     EstabEmpre.TipoOrganismo := fraTipoOrganismoEmpresa.Value;
     EstabEmpre.Organismo := fraOrganismoEmpresa.Value;


     EstabEmpre.Establecimiento.TipoEstablecimiento := fraTipoEstablecimiento.Value;
     EstabEmpre.Establecimiento.Descripcion := edNombre.Text;
     EstabEmpre.Establecimiento.Calle := edCalle.Text;
     EstabEmpre.Establecimiento.Interseccion := edInterseccion.Text;
     EstabEmpre.Establecimiento.Altura := StrToFloat(edAltura.Text);
     EstabEmpre.Establecimiento.Piso := edPiso.Text;
     EstabEmpre.Establecimiento.Dpto := edDepto.Text;
     EstabEmpre.Establecimiento.ProvinciaId := fraProvincias.Value;
     EstabEmpre.Establecimiento.LocalidadId := fraLocalidad.Value;
     EstabEmpre.Establecimiento.Localidad := edLocalidad.Text;
     EstabEmpre.Establecimiento.CPA       := edCPA.Text;
     EstabEmpre.Establecimiento.CP        := edCP.Text;
     EstabEmpre.Establecimiento.Principal := chkPrincipal.Checked;
     EstabEmpre.Establecimiento.Temporal  := chkTemporal.Checked;
     EstabEmpre.Establecimiento.Longitud  := StrToFloat(edLongitud.Text);
     EstabEmpre.Establecimiento.Latitud   := StrToFloat(edLatitud.Text);
     EstabEmpre.Establecimiento.TipoOrganismo := fraTipoOrganismoEstablecimiento.Value;
     EstabEmpre.Establecimiento.Organismo := fraOrganismoEstablecimiento.Value;



     Resultado := RectificarEstablecimientoEmpresa(EstabEmpre);
     if Resultado then
       RectificarEstablecimiento(EstabEmpre);
     if Resultado then
       ShowMessage('Rectificacíon OK')
     else
      ShowMessage('Error');
   end;
end;

procedure TfrmManWSEstablecimientos.tbNuevoClick(Sender: TObject);
begin
  EnviarNuevoEstablecimientoEmpresa(GetEstablecimientoEmpresaFromDB(sdqConsulta.FieldByName('ee_id').AsInteger));
end;

procedure TfrmManWSEstablecimientos.tbPropiedadesClick(Sender: TObject);
begin
  ModoABM := maAlta;
  ModoABMToSqlType;
  ClearControls;
  LockControls(False);
  fpABM.Caption := CAPTION_ALTA;
  fpABM.ShowModal;
end;

procedure TfrmManWSEstablecimientos.tbRefrescarClick(Sender: TObject);
begin
  LoadSQL;
  inherited;
end;

end.
