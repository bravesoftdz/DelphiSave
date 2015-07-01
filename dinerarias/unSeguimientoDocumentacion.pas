unit unSeguimientoDocumentacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  SinEdit, unArtFrame, unfraUsuarios, GroupCheckBox, Buttons, PatternEdit,
  ComboEditor, CheckCombo, DBCheckCombo, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, RxToolEdit, RxPlacemnt, vclextra;

type
  TDocumentos = record
    IdDocu    :integer;
  end;

  TfrmSeguimientoDocumentacion = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edSinFiltro: TSinEdit;
    GroupBox3: TGroupBox;
    dcDesdeFiltro: TDateComboBox;
    dcHastaFiltro: TDateComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dcFechaABM: TDateComboBox;
    edSinABM: TSinEdit;
    fraUsuarioABM: TfraUsuario;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edTrabajadorABM: TEdit;
    edEmpresaABM: TEdit;
    GroupBox5: TGroupBox;
    chkExcluirBajas: TCheckBox;
    btnBuscarSin: TSpeedButton;
    btnLimpiarSin: TSpeedButton;
    pnlTotal: TPanel;
    tbSepTotal: TToolButton;
    sdqUsuarios: TSDQuery;
    dsUsuarios: TDataSource;
    dcUsuarioFiltro: TDBCheckCombo;
    ShortCutControl1: TShortCutControl;
    GroupBox6: TGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    Label7: TLabel;
    pcDocumentacion: TPageControl;
    tsR: TTabSheet;
    cgR: TCheckGroup;
    tsP: TTabSheet;
    cgP: TCheckGroup;
    tsI: TTabSheet;
    cgI: TCheckGroup;
    tsM: TTabSheet;
    cgM: TCheckGroup;
    tsO: TTabSheet;
    cgO: TCheckGroup;
    procedure FormCreate(Sender: TObject);
    procedure edSinABMSelect(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnBuscarSinClick(Sender: TObject);
    procedure btnLimpiarSinClick(Sender: TObject);
    procedure tbMostrarOcultarColumnasClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure pcDocumentacionChange(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure pcDocumentacionChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure fraUsuarioABMExit(Sender: TObject);
  private
    //Documentos: Array of TDocumentos;
    DocumentosR: Array of integer;
    DocumentosP: Array of integer;
    DocumentosI: Array of integer;
    DocumentosM: Array of integer;
    DocumentosO: Array of integer;
    bRefrescar: Boolean;
    procedure SetLiquidadorSugerido(sCuit: String);
    procedure SetTotal;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
		function DoABM: Boolean; override;
		procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmSeguimientoDocumentacion: TfrmSeguimientoDocumentacion; sLiquidador: String;

implementation

uses unSesion, CustomDlgs, SqlFuncs, unDmPrincipal, AnsiSql, unComunes,
  unCustomConsulta, DateTimeFuncs, unDlgBusSiniestro, General;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.FormCreate(Sender: TObject);
var
  sSql :String;
  i, cantR, cantP, cantI, cantM, cantO :Integer;
begin
  inherited;
  sdqUsuarios.Open;
  fraUsuarioABM.Sector                := 'PRESDIN';
  fraUsuarioABM.UsuariosGenericos     := False;
  dcFechaABM.MaxDate                  := DBDate;
  fraEmpresaFiltro.ShowBajas          := True;
  Sql.TableName                       := 'sin.ssd_seguimientodocumentacion';
  FieldBaja                           := 'sd_fechabaja';
  ShowActived                         := False;

  sSql := 'SELECT td_codigo || '' - '' || td_descripcion docu, td_id, td_clase ' +
           ' FROM sin.std_tipodocumento ' +
          ' WHERE td_fechabaja IS NULL ' +
            ' AND td_idorigen = 5 ' +
       ' ORDER BY td_codigo ';
  //cgDocumentacion.Items.Clear;
  cantR := 0;
  cantP := 0;
  cantI := 0;
  cantM := 0;
  cantO := 0;
  cgR.Items.Clear;
  cgP.Items.Clear;
  cgI.Items.Clear;
  cgM.Items.Clear;
  cgO.Items.Clear;
  with GetQuery(sSql) do
  try
    //SetLength(Documentos, RecordCount);
    SetLength(DocumentosR, RecordCount);
    SetLength(DocumentosP, RecordCount);
    SetLength(DocumentosI, RecordCount);
    SetLength(DocumentosM, RecordCount);
    SetLength(DocumentosO, RecordCount);
    for i := 0 to RecordCount - 1 do
    begin
      //Documentos[i].IdDocu := FieldByName('td_id').AsInteger;
      if FieldByName('td_clase').AsString = 'R' then
      begin
        cgR.Items.Add(FieldByName('docu').AsString);
        DocumentosR[cantR] := FieldByName('td_id').AsInteger;
        cantR := cantR + 1;
      end
      else
        if FieldByName('td_clase').AsString = 'P' then
        begin
          cgP.Items.Add(FieldByName('docu').AsString);
          DocumentosP[cantP] := FieldByName('td_id').AsInteger;
          cantP := cantP + 1;
        end
        else
          if FieldByName('td_clase').AsString = 'I' then
          begin
            cgI.Items.Add(FieldByName('docu').AsString);
            DocumentosI[cantI] := FieldByName('td_id').AsInteger;
            cantI := cantI + 1;
          end
          else
            if FieldByName('td_clase').AsString = 'M' then
            begin
              cgM.Items.Add(FieldByName('docu').AsString);
              DocumentosM[cantM]:= FieldByName('td_id').AsInteger;
              cantM := cantM + 1;
            end
            else
              if FieldByName('td_clase').AsString = 'O' then
              begin
                cgO.Items.Add(FieldByName('docu').AsString);
                DocumentosO[cantO] := FieldByName('td_id').AsInteger;
                cantO := cantO + 1;
              end;

      //cgDocumentacion.Items.Add(FieldByName('docu').AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.ClearControls;
begin
  dcFechaABM.Date := DBDate;
  edSinABM.Clear;
  edTrabajadorABM.Clear;
  edEmpresaABM.Clear;
  fraUsuarioABM.Limpiar;
  cgR.Clear;
  cgP.Clear;
  cgI.Clear;
  cgM.Clear;
  cgO.Clear;
end;
{-------------------------------------------------------------------------------}
function TfrmSeguimientoDocumentacion.DoABM: Boolean;
var
  sSql: String;
  i, iIdExp, iIdSegui: Integer;
begin
  BeginTrans;
  try
    iIdExp := Get_IdExpediente(edSinABM.Siniestro, edSinABM.Orden, edSinABM.Recaida);

    if (ModoABM = maModificacion) then
    begin
      sSql := 'DELETE FROM sin.ssd_seguimientodocumentacion ' +
              ' WHERE sd_idexpediente = :IdExped ' +
                ' AND sd_fechaingreso = :Fecha ' +
                ' AND ((sd_liquidador = :Liquidador) OR (sd_liquidador IS NULL))' +
                ' AND sd_fechabaja IS NULL ';


      EjecutarSqlSTEx(sSql, [iIdExp, TDateTimeEx.Create(dcFechaABM.Date),
                             sdqConsulta.FieldByName('sd_liquidador').AsString]);    
    end;

    for i := 0 to cgR.Items.Count - 1 do
    begin
      Sql.Clear;
      if cgR.Checked[i] then
      begin
        iIdSegui := GetSecNextVal('SIN.seq_ssd_id');
        Sql.PrimaryKey.Add('sd_id', iIdSegui);
        Sql.Fields.Add('sd_idexpediente', iIdExp);
        Sql.Fields.Add('sd_fechaingreso', dcFechaABM.Date);
        Sql.Fields.Add('sd_idtipodocumento', DocumentosR[i]);
        Sql.Fields.Add('sd_liquidador', sLiquidador);
        Sql.Fields.Add('sd_fechaalta', exDate);
        Sql.Fields.Add('sd_usualta', Sesion.UserID);
        Sql.SqlType := stInsert;
        EjecutarSqlST(Sql.Sql);
      end
    end;

    for i := 0 to cgP.Items.Count - 1 do
    begin
      Sql.Clear;
      if cgP.Checked[i] then
      begin
        iIdSegui := GetSecNextVal('SIN.seq_ssd_id');
        Sql.PrimaryKey.Add('sd_id', iIdSegui);
        Sql.Fields.Add('sd_idexpediente', iIdExp);
        Sql.Fields.Add('sd_fechaingreso', dcFechaABM.Date);
        Sql.Fields.Add('sd_idtipodocumento', DocumentosP[i]);
        //Sql.Fields.Add('sd_liquidador', fraUsuarioABM.UserID);
        Sql.Fields.Add('sd_fechaalta', exDate);
        Sql.Fields.Add('sd_usualta', Sesion.UserID);
        Sql.SqlType := stInsert;
        EjecutarSqlST(Sql.Sql);
      end
    end;

    for i := 0 to cgI.Items.Count - 1 do
    begin
      Sql.Clear;
      if cgI.Checked[i] then
      begin
        iIdSegui := GetSecNextVal('SIN.seq_ssd_id');
        Sql.PrimaryKey.Add('sd_id', iIdSegui);
        Sql.Fields.Add('sd_idexpediente', iIdExp);
        Sql.Fields.Add('sd_fechaingreso', dcFechaABM.Date);
        Sql.Fields.Add('sd_idtipodocumento', DocumentosI[i]);
        Sql.Fields.Add('sd_liquidador', sLiquidador);
        Sql.Fields.Add('sd_fechaalta', exDate);
        Sql.Fields.Add('sd_usualta', Sesion.UserID);
        Sql.SqlType := stInsert;
        EjecutarSqlST(Sql.Sql);
      end
    end;

    for i := 0 to cgM.Items.Count - 1 do
    begin
      Sql.Clear;
      if cgM.Checked[i] then
      begin
        iIdSegui := GetSecNextVal('SIN.seq_ssd_id');
        Sql.PrimaryKey.Add('sd_id', iIdSegui);
        Sql.Fields.Add('sd_idexpediente', iIdExp);
        Sql.Fields.Add('sd_fechaingreso', dcFechaABM.Date);
        Sql.Fields.Add('sd_idtipodocumento', DocumentosM[i]);
        Sql.Fields.Add('sd_liquidador', sLiquidador);
        Sql.Fields.Add('sd_fechaalta', exDate);
        Sql.Fields.Add('sd_usualta', Sesion.UserID);
        Sql.SqlType := stInsert;
        EjecutarSqlST(Sql.Sql);
      end
    end;

    for i := 0 to cgO.Items.Count - 1 do
    begin
      Sql.Clear;
      if cgO.Checked[i] then
      begin
        iIdSegui := GetSecNextVal('SIN.seq_ssd_id');
        Sql.PrimaryKey.Add('sd_id', iIdSegui);
        Sql.Fields.Add('sd_idexpediente', iIdExp);
        Sql.Fields.Add('sd_fechaingreso', dcFechaABM.Date);
        Sql.Fields.Add('sd_idtipodocumento', DocumentosO[i]);
        Sql.Fields.Add('sd_liquidador', sLiquidador);
        Sql.Fields.Add('sd_fechaalta', exDate);
        Sql.Fields.Add('sd_usualta', Sesion.UserID);
        Sql.SqlType := stInsert;
        EjecutarSqlST(Sql.Sql);
      end
    end;

    CommitTrans;

  except
    on E:Exception do
    begin
      ErrorMsg(E, 'Error al intentar guardar los datos.');
      Rollback;
    end;
  end;
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.LoadControls;
begin
  fraUsuarioABM.Cargar(sdqConsulta.FieldByName('sd_liquidador').AsString);
  edSinABM.SetValues(sdqConsulta.FieldByName('ex_siniestro').AsInteger,
                     sdqConsulta.FieldByName('ex_orden').AsInteger,
                     sdqConsulta.FieldByName('ex_recaida').AsInteger);
  edSinABMSelect(Nil);
  fraUsuarioABMExit(nil);
  dcFechaABM.Date := sdqConsulta.FieldByName('sd_fechaingreso').AsDateTime;
end;


procedure TfrmSeguimientoDocumentacion.pcDocumentacionChange(Sender: TObject);
begin
  if (pcDocumentacion.ActivePage = tsP) or (pcDocumentacion.ActivePage = tsI) then     //P.Directo o ILP
  begin
    fraUsuarioABM.Clear;
    vclextra.LockControl(fraUsuarioABM);
  end
  else
  begin
    vclextra.LockControl(fraUsuarioABM, false);
    if sLiquidador <> '' then
      fraUsuarioABM.Cargar(sLiquidador);

  end;

end;

procedure TfrmSeguimientoDocumentacion.pcDocumentacionChanging(Sender: TObject;
  var AllowChange: Boolean);
begin



end;

{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT DISTINCT sd_idexpediente, sd_fechaingreso, sd_liquidador, ' +
                ' em_nombre, se_nombre, sd_fechabaja, ' +
                ' art.utiles.armar_cuit(em_cuit) cuit, ' +
                ' art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                ' dinerarias.get_documentosdinerarias(sd_fechaingreso, sd_idexpediente, sd_liquidador) docum, ' +
                ' ex_siniestro, ex_orden, ex_recaida ' +
           ' FROM sin.ssd_seguimientodocumentacion, use_usuarios, ' +
                ' sex_expedientes, aem_empresa ' +
          ' WHERE sd_liquidador = se_usuario(+) ' +
            ' AND sd_idexpediente = ex_id ' +
            ' AND ex_cuit = em_cuit ';

  if not edSinFiltro.IsEmpty then
    sSql := sSql + ' AND ex_siniestro = ' + SqlInt(edSinFiltro.Siniestro) +
                   ' AND ex_orden = ' + SqlInt(edSinFiltro.Orden) +
                   ' AND ex_recaida = ' + SqlInt(edSinFiltro.Recaida);

  if not dcDesdeFiltro.IsEmpty then
    sSql := sSql + ' AND sd_fechaingreso >= ' + SqlDate(dcDesdeFiltro.Date);

  if not dcHastaFiltro.IsEmpty then
    sSql := sSql + ' AND sd_fechaingreso <= ' + SqlDate(dcHastaFiltro.Date);

  if (dcUsuarioFiltro.Text <> '') then
    sSql := sSql + ' AND sd_liquidador ' + dcUsuarioFiltro.InSql;

  if chkExcluirBajas.Checked then
    sSql := sSql + ' AND sd_fechabaja IS NULL ';

  if not fraEmpresaFiltro.IsEmpty then
    sSql := sSql + ' AND ex_contrato = ' + SqlInt(fraEmpresaFiltro.Contrato);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited RefreshData;
  SetTotal;
end;
{-------------------------------------------------------------------------------}
function TfrmSeguimientoDocumentacion.Validar: Boolean;
var
  sSql: String;
  iIdExp: Integer;
begin
  Verificar(dcFechaABM.IsEmpty, dcFechaABM, 'Debe ingresar la fecha.');
  Verificar(not(Seguridad.Claves.IsActive('ModificarTodaFecha')) and
            (dcFechaABM.Date < CalcDiasHabiles(DBDate, - 7)), dcFechaABM,
            'La fecha no puede ser anterior a 7 días hábiles.');
  Verificar(edSinABM.IsEmpty, edSinABM, 'Debe ingresar el siniestro.');
  Verificar((fraUsuarioABM.IsEmpty) and (pcDocumentacion.ActivePage <> tsP) and (pcDocumentacion.ActivePage <> tsI),
             fraUsuarioABM, 'Debe seleccionar el usuario liquidador.');
  Verificar((cgR.SelCount = 0) and (cgP.SelCount = 0) and (cgI.SelCount = 0) and
            (cgM.SelCount = 0) and (cgO.SelCount = 0), pcDocumentacion, 'Debe seleccionar al menos un documento.');

  iIdExp := Get_IdExpediente(edSinABM.Siniestro, edSinABM.Orden, edSinABM.Recaida);

  if (pcDocumentacion.ActivePage = tsP) or (pcDocumentacion.ActivePage <> tsI) then
  begin
    ssql := 'SELECT 1 ' +
             ' FROM sin.ssd_seguimientodocumentacion ' +
            ' WHERE sd_idexpediente = :IdExp ' +
              ' AND sd_fechaingreso = :Fecha ' +
              ' AND sd_fechabaja IS NULL';
    Verificar((ModoABM = maAlta) and ExisteSqlEx(sSql, [iIdExp, TDateTimeEx.Create(dcFechaABM.Date)]),
            dcFechaABM, 'Ya existe documentación ingresada para la misma fecha y siniestro.');
  end
  else
  begin
    sSql   := 'SELECT 1 ' +
               ' FROM sin.ssd_seguimientodocumentacion ' +
              ' WHERE sd_idexpediente = :IdExp ' +
                ' AND sd_fechaingreso = :Fecha ' +
                ' AND sd_liquidador = :Liq ' +
                ' AND sd_fechabaja IS NULL';
    Verificar((ModoABM = maAlta) and ExisteSqlEx(sSql, [iIdExp, TDateTimeEx.Create(dcFechaABM.Date), fraUsuarioABM.UserID]),
              dcFechaABM, 'Ya existe documentación ingresada para la misma fecha, siniestro y liquidador.');
  end;

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.edSinABMSelect(Sender: TObject);
var
  sSql: String;
begin
  if edSinABM.IsEmpty then
  begin
    edTrabajadorABM.Clear;
    edEmpresaABM.Clear;
    fraUsuarioABM.Limpiar;
  end
  else begin
    sSql := 'SELECT ''CUIL: '' || art.utiles.armar_cuit(tj_cuil) || '' - '' || tj_nombre trabajador, ' +
                  ' ''CUIT: '' || art.utiles.armar_cuit(em_cuit) || '' - '' || em_nombre empresa, ' +
                  ' em_cuit ' +
            ' FROM sex_expedientes, ctj_trabajador, aem_empresa ' +
           ' WHERE ex_cuil = tj_cuil ' +
             ' AND ex_cuit = em_cuit ' +
             ' AND NVL(ex_causafin, '' '') NOT IN (''99'', ''95'') ' +             
             ' AND ex_siniestro = :Sin ' +
             ' AND ex_orden = :Ord ' +
             ' AND ex_recaida = :Reca';
    with GetQueryEx(sSql, [edSinABM.Siniestro, edSinABM.Orden, edSinABM.Recaida]) do
    try
      if Eof then
      begin
        edSinABM.Clear;
        Verificar(True, edSinABM, 'No existe el siniestro buscado. Verifique los datos ingresados.');
      end
      else begin
        edTrabajadorABM.Text  := FieldByName('trabajador').AsString;
        edEmpresaABM.Text     := FieldByName('empresa').AsString;
        if (ModoABM = maAlta) and (pcDocumentacion.ActivePage <> tsP) and (pcDocumentacion.ActivePage <> tsI) then        //En P. Directo no se guarda liquidador y en ILP
          SetLiquidadorSugerido(FieldByName('em_cuit').AsString);
      end;
    finally
      Free;
    end;
  end;

  if (pcDocumentacion.ActivePage <> tsP) and (pcDocumentacion.ActivePage <> tsI)then
    sLiquidador := fraUsuarioABM.edCodigo.Text;

end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.SetLiquidadorSugerido(sCuit: String);
var
  sLiq: String;
  iTerm: Integer;
begin
  iTerm := StrToInt(Copy(sCuit, 11, 1));
  sLiq  := ValorSqlEx('SELECT le_liquidador ' +
                       ' FROM sin.sle_liquidadoresxempresa ' +
                      ' WHERE le_fechabaja IS NULL ' +
                        ' AND (((le_tipo = ''C'') AND (le_cuit = :cuit)) ' +
                         ' OR ((le_tipo = ''T'') AND (le_terminacion = :term)))' +
                      ' ORDER BY le_tipo ', [sCuit, iTerm]);
  if (sLiq <> '') then
  begin
    fraUsuarioABM.Cargar(sLiq);
    InfoHint(fraUsuarioABM, 'Liquidador sugerido.');
  end
  else
    fraUsuarioABM.Limpiar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.fpAbmBeforeShow(Sender: TObject);
var
  i, iIdSegui: Integer;
  sSql: String;
begin
  LockControl(edSinABM, (ModoABM = maModificacion));
  LockControl(fraUsuarioABM, (ModoABM = maModificacion) and (not(Seguridad.Claves.IsActive('CambiarLiquidador')) or 
              (sdqConsulta.FieldByName('sd_liquidador').AsString = '')));
  dcFechaABM.Enabled    := (ModoABM = maAlta);
  btnBuscarSin.Enabled  := (ModoABM = maAlta);
  btnLimpiarSin.Enabled := (ModoABM = maAlta);

  sSql := 'SELECT sd_id ' +
           ' FROM sin.ssd_seguimientodocumentacion ' +
          ' WHERE sd_idexpediente = :IdExp ' +
            ' AND sd_idtipodocumento = :IdDoc ' +
            ' AND sd_fechaingreso = :Fecha ';
            //' AND nvl(sd_liquidador, '''') = :Liq ';

  cgR.Clear;
  cgP.Clear;
  cgI.Clear;
  cgM.Clear;
  cgO.Clear;

  tsP.TabVisible := True;
  tsR.TabVisible := True;
  tsI.TabVisible := True;
  tsM.TabVisible := True;
  tsO.TabVisible := True;

  if (ModoABM = maModificacion) then
  begin

    for i := 0 to cgP.Items.Count - 1 do
    begin
      iIdSegui := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('sd_idexpediente').AsInteger,
                                         DocumentosP[i],
                                         TDateTimeEx.Create(sdqConsulta.FieldByName('sd_fechaingreso').AsDateTime)]);
      cgP.Checked[i] := (iIdSegui > 0);
    end;

    for i := 0 to cgI.Items.Count - 1 do
    begin
      iIdSegui := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('sd_idexpediente').AsInteger,
                                         DocumentosI[i],
                                         TDateTimeEx.Create(sdqConsulta.FieldByName('sd_fechaingreso').AsDateTime)]);
      cgI.Checked[i] := (iIdSegui > 0);
    end;

    sSql := sSql +  ' AND sd_liquidador = :Liq ';

    for i := 0 to cgR.Items.Count - 1 do
    begin
      iIdSegui := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('sd_idexpediente').AsInteger,
                                         DocumentosR[i],
                                         TDateTimeEx.Create(sdqConsulta.FieldByName('sd_fechaingreso').AsDateTime),
                                         sdqConsulta.FieldByName('sd_liquidador').AsString]);
      cgR.Checked[i] := (iIdSegui > 0);
    end;

    for i := 0 to cgM.Items.Count - 1 do
    begin
      iIdSegui := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('sd_idexpediente').AsInteger,
                                         DocumentosM[i],
                                         TDateTimeEx.Create(sdqConsulta.FieldByName('sd_fechaingreso').AsDateTime),
                                         sdqConsulta.FieldByName('sd_liquidador').AsString]);
      cgM.Checked[i] := (iIdSegui > 0);
    end;

    for i := 0 to cgO.Items.Count - 1 do
    begin
      iIdSegui := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('sd_idexpediente').AsInteger,
                                         DocumentosO[i],
                                         TDateTimeEx.Create(sdqConsulta.FieldByName('sd_fechaingreso').AsDateTime),
                                         sdqConsulta.FieldByName('sd_liquidador').AsString]);
      cgO.Checked[i] := (iIdSegui > 0);
    end;

    if sdqConsulta.FieldByName('sd_liquidador').AsString <> '' then
    begin
      pcDocumentacion.ActivePage := tsR;
      tsP.TabVisible := false;
      tsR.TabVisible := True;
      tsI.TabVisible := False;
      tsM.TabVisible := True;
      tsO.TabVisible := True; 
    end
    else
    begin
      tsP.TabVisible := True;
      tsR.TabVisible := False;
      tsI.TabVisible := True;
      tsM.TabVisible := False;
      tsO.TabVisible := False;
      pcDocumentacion.ActivePage := tsP;
    end;

  end;

end;
procedure TfrmSeguimientoDocumentacion.fpAbmShow(Sender: TObject);
begin
  pcDocumentacion.TabIndex := 0;
  vclextra.LockControl(fraUsuarioABM, false);
  if ModoABM = maAlta then
    sLiquidador := '';
    
end;

procedure TfrmSeguimientoDocumentacion.fraUsuarioABMExit(Sender: TObject);
begin
  sLiquidador := fraUsuarioABM.edCodigo.Text;
  

end;

{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edSinFiltro.Clear;
  dcDesdeFiltro.Clear;
  dcHastaFiltro.Clear;
  dcUsuarioFiltro.Clear;
  fraEmpresaFiltro.Clear;
  chkExcluirBajas.Checked := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.tbEliminarClick(Sender: TObject);
var
  sSql, sLiquidador: String;
begin
  if MsgAsk('¿Desea eliminar el registro seleccionado?') then
  begin
    sLiquidador := sdqConsulta.FieldByName('sd_liquidador').AsString;

    sSql := 'UPDATE sin.ssd_seguimientodocumentacion ' +
              ' SET sd_fechabaja = ActualDate, ' +
                  ' sd_usubaja = :Usuario ' +
            ' WHERE sd_idexpediente = :IdExp ' +
              ' AND sd_fechaingreso = :Fecha ';

    if sLiquidador = '' then
      sSql := sSql + ' AND sd_liquidador is null '
    else
      sSql := sSql + ' AND sd_liquidador = ' + SqlValue(sLiquidador);      // TK 63817

    EjecutarSqlEx(sSql, [Sesion.UserID, sdqConsulta.FieldByName('sd_idexpediente').AsInteger,
                         TDateTimeEx.Create(sdqConsulta.FieldByName('sd_fechaingreso').AsDateTime)]);
    RefreshData;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.tbModificarClick(Sender: TObject);
begin
  Verificar(not(sdqConsulta.FieldByName('sd_fechabaja').IsNull), Nil,
            'El registro se encuentra dado de baja.');
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.btnBuscarSinClick(Sender: TObject);
var
  iOldIdSiniestro, iNewIdSiniestro: integer;
  sSql: String;
begin
  ShortCutControl1.Enabled := False;
  try
    iOldIdSiniestro := Get_IdExpediente(edSinABM.Siniestro, edSinABM.Orden, edSinABM.Recaida);
    iNewIdSiniestro := GetIdSiniestro(0, 0, iOldIdSiniestro, 0, True);
    if (iOldIdSiniestro <> iNewIdSiniestro) then
    begin
      sSql := 'SELECT ex_siniestro, ex_orden, ex_recaida ' +
               ' FROM sex_expedientes ' +
              ' WHERE ex_id = :Id';
      with GetQueryEx(sSql, [iNewIdSiniestro]) do
      try
        edSinABM.SetValues(FieldByName('ex_siniestro').AsInteger,
                           FieldByName('ex_orden').AsInteger,
                           FieldByName('ex_recaida').AsInteger);
        edSinABMSelect(Nil);
      finally
        Free;
      end;
    end;
  finally
    ShortCutControl1.Enabled := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.btnLimpiarSinClick(Sender: TObject);
begin
  edSinABM.Clear;
  edSinABMSelect(Nil);
  edSinABM.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.tbMostrarOcultarColumnasClick(Sender: TObject);
begin
  SetTotal;
end;
procedure TfrmSeguimientoDocumentacion.tbRefrescarClick(Sender: TObject);
begin
  inherited;

end;

{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.SetTotal;
begin
  if sdqConsulta.Active and tbMostrarOcultarColumnas.Down then
  begin
    pnlTotal.Caption    := ' Cantidad de casos: ' + IntToStr(sdqConsulta.RecordCount);
    tbSepTotal.Visible  := True;
  end
  else begin
    pnlTotal.Caption    := '';
    tbSepTotal.Visible  := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.SubTitle.Lines.Add('Cantidad de casos: ' + IntToStr(sdqConsulta.RecordCount));
  QueryPrint.SubTitle.Lines.Add('');
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.btnAceptarClick(Sender: TObject);
begin
  if (ModoABM = maModificacion) then
    inherited
  else if Validar and DoABM then
  begin
    bRefrescar := True;
    cgR.Clear;
    cgP.Clear;
    cgI.Clear;
    cgM.Clear;
    cgO.Clear;
    btnLimpiarSinClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoDocumentacion.btnCancelarClick(Sender: TObject);
begin
  if (ModoABM = maModificacion) then
    inherited
  else if bRefrescar then
  begin
    bRefrescar := False;
  	if sdqConsulta.Active then
    begin
    	sdqConsulta.Refresh;
      CheckButtons;
    end
    else
    	tbRefrescarClick(nil);
  end;
end;
{-------------------------------------------------------------------------------}
end.
