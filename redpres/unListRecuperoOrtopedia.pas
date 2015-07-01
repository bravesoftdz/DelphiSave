unit unListRecuperoOrtopedia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, unfraPrestador, PatternEdit, ComboEditor, CheckCombo,
  DBCheckCombo, SinEdit, Mask, ToolEdit, DateComboBox, FormPanel,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame;

type
  TfrmListRecuperoOrtopedia = class(TfrmCustomConsulta)
    GroupBox3: TGroupBox;
    Label4: TLabel;
    dcHastaInicio: TDateComboBox;
    dcDesdeInicio: TDateComboBox;
    GroupBox4: TGroupBox;
    edSiniestro: TSinEdit;
    gbDelegacion: TGroupBox;
    cmbDelegacion: TDBCheckCombo;
    grpPrestador: TGroupBox;
    fraPrestador: TfraPrestador;
    gbEstado: TGroupBox;
    cmbEstado: TComboBox;
    dsDelegacion: TDataSource;
    sdqDelegacion: TSDQuery;
    fpAlta: TFormPanel;
    tbPosponer: TToolButton;
    tbTerminar: TToolButton;
    ToolButton7: TToolButton;
    tbSalir2: TToolButton;
    Label1: TLabel;
    edSiniestroAlta: TSinEdit;
    cmbNroAutAlta: TArtComboBox;
    Label2: TLabel;
    dcGestionAlta: TDateComboBox;
    Label3: TLabel;
    Bevel6: TBevel;
    btnCancelarAlta: TButton;
    btnAceptarAlta: TButton;
    dsAut: TDataSource;
    sdqAut: TSDQuery;
    fpPosponer: TFormPanel;
    dcProxReclamo: TDateComboBox;
    Label5: TLabel;
    edObsPos: TMemo;
    Label6: TLabel;
    btnCancelarPos: TButton;
    btnAceptarPos: TButton;
    Bevel1: TBevel;
    fpTerminar: TFormPanel;
    Label8: TLabel;
    Bevel2: TBevel;
    edObsTer: TMemo;
    btnCancelarTer: TButton;
    btnAceptarTer: TButton;
    chkRecuperoTer: TCheckBox;
    gbGestor: TGroupBox;
    cmbGestor: TArtComboBox;
    gbGrupoTrabajo: TGroupBox;
    cmbGtrabajo: TDBCheckCombo;
    sdqGtrabajo: TSDQuery;
    dsGtrabajo: TDataSource;
    sdqGestor: TSDQuery;
    dsGestor: TDataSource;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure edSiniestroAltaSelect(Sender: TObject);
    procedure btnAceptarAltaClick(Sender: TObject);
    procedure tbPosponerClick(Sender: TObject);
    procedure btnAceptarPosClick(Sender: TObject);
    procedure fpAltaBeforeShow(Sender: TObject);
    procedure tbTerminarClick(Sender: TObject);
    procedure btnAceptarTerClick(Sender: TObject);
    procedure cmbGtrabajoCloseUp(Sender: TObject; var Cancel: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function HayRegistroActivo :Boolean;
  public

  end;

var
  frmListRecuperoOrtopedia: TfrmListRecuperoOrtopedia;

implementation

uses AnsiSql, unSesion, CustomDlgs, unDmPrincipal, General;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT * FROM (' +

          'SELECT au_siniestro, au_orden, au_recaida, or_id, or_observaciones, or_estado, ' +
                ' utiles.armar_siniestro(au_siniestro, au_orden, au_recaida) siniestro, ' +
                ' or_fechainigestion, ca_nombrefanta prestador, ca_codarea || '' '' || ca_telefono telprestador, ' +
                ' utiles.armar_domicilio(ca_calle, ca_numero, ca_piso, ca_departamento, ca_localidad) domprestador, ' +
                ' tj_nombre trabajador, art.trabajador.get_telefono(tj_id, 4) teltrabajador, pa_materialcoti matcotizado,' +
                ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento, tj_localidad) domtrabajador, ' +
                ' nvl(sp_autoapro, sp_autooriginal) autorizacion, sp_valor_adju valadjudicado, ' +
                ' lg_nombre delegacion, gp_nombre gtrabajo, or_recuperado, or_proximoreclamo, ' +
                ' decode(or_estado, ''I'', ''Inicial'', ''E'', ''En trámite'', ''T'', ''Terminado'') estado, ' +
                ' pa_prestador, ex_delegacion, ex_gtrabajo, siniestro.get_usuariogestor(ex_id) USUGESTOR ' +
           ' FROM amed.mor_ortopedia_recupero, cpr_prestador, ctj_trabajador, ' +
                ' sex_expedientes, msp_siniestropresup, mpa_presupuestoautorizacion, ' +
                ' dlg_delegaciones, mgp_gtrabajo, sau_autorizaciones ' +
          ' WHERE or_fechabaja IS NULL ' +
            ' AND pa_prestador = ca_identificador ' +
            ' AND siniestro.get_idexpediente(sp_siniestro, sp_orden, sp_recaida) = ex_id ' +
            ' AND or_idautorizacion = au_id ' +
            ' AND tj_cuil = ex_cuil ' +
            ' AND or_idpresupuesto = sp_nropedido ' +
            ' AND pa_id = sp_presupuesto ' +
            ' AND ex_delegacion = lg_codigo ' +
            ' AND ex_gtrabajo = gp_codigo ' ;


    if (cmbGestor.Text <> '') then
       sSQL := sSQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(cmbGestor.Text);

    sSQL := sSQL + ' UNION ALL ' +

         ' SELECT au_siniestro, au_orden, au_recaida, or_id, or_observaciones, or_estado, ' +
                ' utiles.armar_siniestro(au_siniestro, au_orden, au_recaida) siniestro, ' +
                ' or_fechainigestion, ca_nombrefanta prestador, ca_codarea || '' '' || ca_telefono telprestador, ' +
                ' utiles.armar_domicilio(ca_calle, ca_numero, ca_piso, ca_departamento, ca_localidad) domprestador, ' +
                ' tj_nombre trabajador, art.trabajador.get_telefono(tj_id, 4) teltrabajador, stock.so_descripcion, ' +
                ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento, tj_localidad) domtrabajador, ' +
                ' au_numauto autorizacion, null valadjudicado, ' +
                ' lg_nombre delegacion, gp_nombre gtrabajo, or_recuperado, or_proximoreclamo, ' +
                ' decode(or_estado, ''I'', ''Inicial'', ''E'', ''En trámite'', ''T'', ''Terminado'') estado, ' +
                ' pa_prestador, ex_delegacion, ex_gtrabajo, siniestro.get_usuariogestor(ex_id) USUGESTOR ' +
           ' FROM amed.mor_ortopedia_recupero, amed.mso_stock_ortopedia stock, ' +
                ' sex_expedientes, sau_autorizaciones, mpa_presupuestoautorizacion, ' +
                ' cpr_prestador, ctj_trabajador, dlg_delegaciones, mgp_gtrabajo ' +
          ' WHERE or_fechabaja IS NULL ' +
            ' AND or_idstock = stock.so_id ' +
            ' AND stock.so_fechabaja IS NULL ' +
            ' AND or_idautorizacion = au_id ' +
            ' AND ex_id = siniestro.get_idexpediente(au_siniestro, au_orden, au_recaida) ' +
            ' AND pa_prestador = ca_identificador(+) ' +
            ' AND or_idpresupuesto = pa_id(+) ' +
            ' AND tj_cuil = ex_cuil ' +
            ' AND ex_delegacion = lg_codigo ' +
            ' AND ex_gtrabajo = gp_codigo ' ;

  if (cmbGestor.Text <> '') then
       sSQL := sSQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(cmbGestor.Text);

  sSQL := sSQL + ' ) WHERE 1=1 ';

  if not(dcDesdeInicio.IsEmpty) then
    sSql := sSql + ' AND nvl(or_proximoreclamo, or_fechainigestion) >= ' + dcDesdeInicio.SqlText;

  if not(dcHastaInicio.IsEmpty) then
    sSql := sSql + ' AND nvl(or_proximoreclamo, or_fechainigestion) <= ' + dcHastaInicio.SqlText;

  if not(edSiniestro.IsEmpty) then
    sSql := sSql + ' AND au_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                   ' AND au_orden = ' + SqlInt(edSiniestro.Orden) +
                   ' AND au_recaida = ' + SqlInt(edSiniestro.Recaida);

  if (cmbDelegacion.Text <> '') then
    sSql := sSql + ' AND ex_delegacion ' + cmbDelegacion.InSql;

  if (cmbGTrabajo.Text <> '') then
    sSql := sSql + ' AND ex_gtrabajo ' + cmbGTrabajo.InSql;

  if not(fraPrestador.IsEmpty) then
    sSql := sSql + ' AND pa_prestador = ' + SqlInt(fraPrestador.IDPrestador);

  case cmbEstado.ItemIndex of
    1: sSql := sSql + ' AND or_estado = ''I'' ';
    2: sSql := sSql + ' AND or_estado = ''E'' ';
    3: sSql := sSql + ' AND or_estado = ''T'' ';
  end;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
  tbPosponer.Enabled := HayRegistroActivo;
  tbTerminar.Enabled := HayRegistroActivo;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.FormCreate(Sender: TObject);
begin
  inherited;
  sdqDelegacion.Open;
  sdqGTrabajo.Open;
  cmbEstado.ItemIndex := 0;

  // Lu: por si se borran los DataSources
  cmbGtrabajo.DataSource := dsGtrabajo;
  cmbGestor.DataSource   := dsGestor;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.tbLimpiarClick(Sender: TObject);
begin
  cmbEstado.ItemIndex := 0;
  tbPosponer.Enabled  := False;
  tbTerminar.Enabled  := False;
  dcDesdeInicio.Clear;
  dcHastaInicio.Clear;
  edSiniestro.Clear;
  cmbGtrabajo.Clear;
  cmbGestor.Clear;
  cmbDelegacion.Clear;
  fraPrestador.Clear;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.tbEliminarClick(Sender: TObject);
var
  sSql :String;
begin
  if HayRegistroActivo and
     (MsgBox('Se dispone a dar de baja el registro.' + #13 + '¿Esta usted seguro?',
              MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    sSql := 'UPDATE amed.mor_ortopedia_recupero ' +
              ' SET or_fechabaja = actualdate, ' +
                  ' or_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE or_id = ' + SqlInt(sdqConsulta.FieldByName('OR_ID').AsInteger);
    EjecutarSql(sSql);
    tbRefrescarClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmListRecuperoOrtopedia.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.tbNuevoClick(Sender: TObject);
begin
  fpAlta.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.edSiniestroAltaSelect(Sender: TObject);
begin
  cmbNroAutAlta.Clear;
  if edSiniestroAlta.IsEmpty then Exit;
  with sdqAut do
  begin
    Close;
    ParamByName('pSiniestro').AsInteger := edSiniestroAlta.Siniestro;
    ParamByName('pOrden').AsInteger     := edSiniestroAlta.Orden;
    ParamByName('pRecaida').AsInteger   := edSiniestroAlta.Recaida;
    Open;
    if Eof then
    begin
      InvalidMsg(edSiniestroAlta, 'No existe ninguna autorización de Ortopedia '+#13+#10+
                                  'con presupuesto adjudicado para este siniestro');
      Close;
      cmbNroAutAlta.Enabled := False;
    end
    else
      cmbNroAutAlta.Enabled := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.btnAceptarAltaClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(edSiniestroAlta.IsEmpty, edSiniestroAlta, 'Debe seleccionar siniestro.');
  Verificar(cmbNroAutAlta.Text = '', cmbNroAutAlta, 'Debe seleccionar autorización.');
  Verificar(dcGestionAlta.IsEmpty, dcGestionAlta, 'Debe ingresar la fecha de gestión.');
  sSql := 'INSERT INTO amed.mor_ortopedia_recupero (' +
          ' or_idautorizacion, or_idpresupuesto, or_fechainigestion, ' +
          ' or_estado, or_fechaalta, or_usualta) VALUES (' +
          SqlInt(sdqAut.FieldByName('AU_ID').AsInteger) + ',' +
          SqlInt(sdqAut.FieldByName('SP_NROPEDIDO').AsInteger) + ',' +
          SqlDate(dcGestionAlta.Date) + ', ''I'', ActualDate, ' +
          SqlValue(Sesion.UserID) + ')';
  EjecutarSql(sSql);
  fpAlta.ModalResult := mrOk;
  tbRefrescarClick(Nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.tbPosponerClick(Sender: TObject);
begin
  if HayRegistroActivo and
     ((sdqConsulta.FieldByName('OR_ESTADO').AsString = 'I') or //estado inicial
      (sdqConsulta.FieldByName('OR_ESTADO').AsString = 'E'))   //ó en tramite
  then begin
    dcProxReclamo.MINDate := IIF(sdqConsulta.FieldByName('OR_PROXIMORECLAMO').IsNull,
                                 IIF(sdqConsulta.FieldByName('OR_FECHAINIGESTION').AsDateTime > DBDate,
                                     sdqConsulta.FieldByName('OR_FECHAINIGESTION').AsDateTime, DBDate),
                                 sdqConsulta.FieldByName('OR_PROXIMORECLAMO').AsDateTime);
    dcProxReclamo.Date  := sdqConsulta.FieldByName('OR_PROXIMORECLAMO').AsDateTime;
    edObsPos.Lines.Text := sdqConsulta.FieldByName('OR_OBSERVACIONES').AsString;
    fpPosponer.ShowModal;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.btnAceptarPosClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(dcProxReclamo.IsEmpty, dcProxReclamo, 'Debe ingresar la fecha de próximo reclamo.');
  sSql := 'UPDATE amed.mor_ortopedia_recupero ' +
            ' SET or_proximoreclamo = ' + SqlDate(dcProxReclamo.Date) + ',' +
                ' or_observaciones = ' + SqlValue(Trim(edObsPos.Lines.Text)) + ',' +
                ' or_estado = ''E'', ' +
                ' or_fechamodif = ActualDate, ' +
                ' or_usumodif = ' + SqlValue(Sesion.UserID) +
          ' WHERE or_id = ' + SqlInt(sdqConsulta.FieldByName('OR_ID').AsInteger);
  EjecutarSql(sSql);
  fpPosponer.ModalResult := mrOk;
  tbRefrescarClick(Nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.fpAltaBeforeShow(Sender: TObject);
begin
  edSiniestroAlta.Clear;
  cmbNroAutAlta.Clear;
  dcGestionAlta.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.tbTerminarClick(Sender: TObject);
begin
  if HayRegistroActivo and
     (sdqConsulta.FieldByName('OR_ESTADO').AsString <> 'T') then //que no esté terminado
  begin
    chkRecuperoTer.Checked := False;
    edObsTer.Lines.Text := sdqConsulta.FieldByName('OR_OBSERVACIONES').AsString;
    fpTerminar.ShowModal;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.btnAceptarTerClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'UPDATE amed.mor_ortopedia_recupero ' +
            ' SET or_observaciones = ' + SqlValue(Trim(edObsTer.Lines.Text)) + ',' +
                ' or_estado = ''T'', ' +
                ' or_recuperado = ' + SqlBoolean(chkRecuperoTer.Checked) + ',' +
                ' or_fechamodif = ActualDate, ' +
                ' or_usumodif = ' + SqlValue(Sesion.UserID) +
          ' WHERE or_id = ' + SqlInt(sdqConsulta.FieldByName('OR_ID').AsInteger);
  EjecutarSql(sSql);
  fpTerminar.ModalResult := mrOk;
  tbRefrescarClick(Nil);
end;

{-------------------------------------------------------------------------------}
procedure TfrmListRecuperoOrtopedia.cmbGtrabajoCloseUp(Sender: TObject; var Cancel: Boolean);
var
  sSql :String;
begin
  if Trim(cmbGTrabajo.Text) <> '' then  // Lu 04/04/2008 pongo este if para que ejecute lo siguiente solo si se ingreso algo en el combo.
  begin
      cmbGestor.Clear;
      sSql := 'SELECT ug_id, ug_usuario ' +
               ' FROM mgp_gtrabajo, mug_usuariogrupotrabajo, ctb_tablas ' +
              ' WHERE ug_fechabaja IS NULL ' +
                ' AND ug_tipousuario = tb_codigo ' +
                ' AND tb_clave = ''TUSU'' ' +
                ' AND tb_especial1 = ''S'' ' +
                ' AND gp_codigo = ug_grupo ' +
                ' AND gp_gestionado = ''S'' ' +
                ' AND gp_codigo ' + cmbGtrabajo.InSql;
      sdqGestor.Close;
      sdqGestor.SQL.Text := sSql;
      sdqGestor.Open;
  end;
end;

procedure TfrmListRecuperoOrtopedia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
