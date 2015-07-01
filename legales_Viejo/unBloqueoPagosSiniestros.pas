unit unBloqueoPagosSiniestros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, ANSISql,
  unFraCodigoDescripcion, unArtDBAwareFrame, unPrincipal, unDmPrincipal,
  unSesion, CustomDlgs, SqlFuncs, Strfuncs, unDmLegales, Mask, PatternEdit,
  ComboEditor, CheckCombo;

type
  TfrmBloqueoPagosSiniestros = class(TfrmCustomGridABM)
    fraConPagos: TfraCodigoDescripcion;
    Label1: TLabel;
    fraSiniestrosJuicio: TfraCodigoDescripcion;
    Label2: TLabel;
    chbEstado: TCheckBox;
    edDescripcion: TLabeledEdit;
    tbCargaMultiple: TToolButton;
    fpCargaMultiple: TFormPanel;
    Bevel1: TBevel;
    lbConceptodePago: TLabel;
    lbSiniestro: TLabel;
    btnAceptarMasivo: TButton;
    btnCancelMasivo: TButton;
    fraSiniestroMultiple: TfraCodigoDescripcion;
    cmbConceptoPagoMultiple: TCheckCombo;
    edDescripcionCausaMultiple: TLabeledEdit;
    cbBloqueoActivoMultiple: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbModificarClick(Sender: TObject);
    procedure tbCargaMultipleClick(Sender: TObject);
    procedure btnAceptarMasivoClick(Sender: TObject);
    procedure btnCancelMasivoClick(Sender: TObject);
  private
    procedure ValidarMasiva;
  protected
    FIdJuicio: Integer;
    FModo: TModoEjecucion;
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    { Private declarations }
  public
    { Public declarations }
    class procedure MostrarAbm (AIdJuicioEnTramite: Integer; AModo: TModoEjecucion);
  end;

implementation

uses
  uncomunes, unCustomConsulta;

{$R *.dfm}

class procedure TfrmBloqueoPagosSiniestros.MostrarAbm(AIdJuicioEnTramite: Integer; AModo: TModoEjecucion);
begin
  with TfrmBloqueoPagosSiniestros.Create(nil) do
  try
    FormStyle := fsNormal;
    Visible := false;

    FIdJuicio := AIdJuicioEnTramite;
    FModo := AModo;

    with sdqConsulta do
    begin
      Close;
      ParamByName('idjuicio').Value := FIdJuicio;
      Open
    end;

    with fraConPagos do
    begin
      TableName := 'art.scp_conpago';
      FieldID     := 'cp_conpago';
      FieldCodigo := 'cp_conpago';
      FieldDesc   := 'cp_denpago';
      FieldBaja   := 'cp_fbaja';
      ExtraCondition := ' AND cp_tipo IN (''I'', ''P'', ''M'')';

      Showbajas   := False;
    end;

    with fraSiniestrosJuicio do
    begin
      TableName := 'legales.lsj_siniestrosjuicioentramite';
      ExtraTables := ', legales.lod_origendemanda, art.sex_expedientes ';
      FieldID     := 'sj_idsiniestro';
      FieldCodigo := 'ex_siniestro';
      FieldDesc   := 'TRIM(od_nombre) || NVL2(ex_diagnostico,('' - '' || ex_diagnostico), '''')';
      FieldBaja   := 'sj_fechabaja';
      ExtraCondition := ' AND ex_id = sj_idsiniestro ' +
                        ' AND sj_fechabaja IS NULL ' +
                        ' AND sj_idorigendemanda = od_id ' +
                        ' AND od_fechabaja IS NULL ' +
                        ' AND od_idjuicioentramite = ' + SqlValue (FIdJuicio);

      Showbajas   := true;
    end;

    with fraSiniestroMultiple do
    begin
      TableName := 'legales.lsj_siniestrosjuicioentramite';
      ExtraTables := ', legales.lod_origendemanda, art.sex_expedientes ';
      FieldID     := 'sj_idsiniestro';
      FieldCodigo := 'ex_siniestro';
      FieldDesc   := 'TRIM(od_nombre) || NVL2(ex_diagnostico,('' - '' || ex_diagnostico), '''')';
      FieldBaja   := 'sj_fechabaja';
      ExtraCondition := ' AND ex_id = sj_idsiniestro ' +
                        ' AND sj_fechabaja IS NULL ' +
                        ' AND sj_idorigendemanda = od_id ' +
                        ' AND od_fechabaja IS NULL ' +
                        ' AND od_idjuicioentramite = ' + SqlValue (FIdJuicio);

      Showbajas   := true;
    end;

    with GetQuery(
    ' SELECT   cp_conpago, cp_denpago '+
    '     FROM art.scp_conpago '+
    '    WHERE cp_fbaja IS NULL '+
    '      AND cp_tipo IN(''I'', ''P'', ''M'') '+
    ' ORDER BY 2 ') do
    try
      while not Eof do
      begin
        cmbConceptoPagoMultiple.Items.AddObject(fieldbyname('cp_denpago').AsString, TObject(fieldbyname('cp_conpago').AsInteger));
        Next;
      end

    finally
      Free;
    end;


    ShowModal;
  finally
    free;
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBloqueoPagosSiniestros.ClearControls;
begin
  inherited;
  fraSiniestroMultiple.Clear;
  edDescripcionCausaMultiple.Clear;
  cmbConceptoPagoMultiple.Clear;
  cbBloqueoActivoMultiple.Checked := True;
  fraSiniestrosJuicio.Clear;
  fraConPagos.Clear;
  chbEstado.Checked := true;
  edDescripcion.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmBloqueoPagosSiniestros.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('BP_ID', sdqConsulta.FieldByName('BP_ID').AsInteger);
    Sql.Fields.Add('BP_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('BP_FECHABAJA', exDateTime );
    Sql.Fields.Add('BP_ESTADOBLOQUEO', 0);
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('BP_IDJUICIOENTRAMITE', FIdJuicio);
    Sql.Fields.Add('BP_IDEXPEDIENTE', fraSiniestrosJuicio.Value);
    Sql.Fields.Add('BP_IDCONPAGO', fraConPagos.Value);
    Sql.Fields.Add('BP_ESTADOBLOQUEO', Ord(chbEstado.Checked));
    Sql.Fields.Add('BP_DESCRIPCIONCAUSA', edDescripcion.Text);

    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('BP_ID', GetSecNextVal('legales.seq_lbs_id') );
      Sql.Fields.Add('BP_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('BP_FECHAALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('BP_ID', sdqConsulta.FieldByName('BP_ID').AsInteger );
      Sql.Fields.Add('BP_USUMODIF', Sesion.LoginName );
      Sql.Fields.Add('BP_FECHAMODIF', exDateTime );
      Sql.Fields.Add('BP_USUBAJA', exNull );
      Sql.Fields.Add('BP_FECHABAJA', exNull );
    end;
  end;

  try
    EjecutarSqlST(sql.Sql);
    Result := True;
  except
    on e: Exception do
      Raise Exception.Create(e.Message);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBloqueoPagosSiniestros.LoadControls;
begin
  inherited;

  fraSiniestrosJuicio.Value := sdqConsulta.FieldByName('bp_idexpediente').AsInteger;
  fraConPagos.Value := sdqConsulta.FieldByName('bp_idconpago').AsInteger;
  chbEstado.Checked := sdqConsulta.FieldByName('bp_estadobloqueo').AsInteger = 1;
  edDescripcion.Text := sdqConsulta.FieldByName('bp_descripcioncausa').AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmBloqueoPagosSiniestros.Validar: Boolean;
begin
  Result := True;
  VerificarMultiple(['Guardando Bloqueo de Pagos',
                      fraSiniestrosJuicio,
                      fraSiniestrosJuicio.IsSelected,
                      'Debe Seleccionar un Siniestro',

                      fraConPagos,
                      fraConPagos.IsSelected,
                      'Debe Seleccionar un Concepto',

                      fraConPagos,
                      not ((ModoABM = maAlta) and
                           ExisteSql ('SELECT 1 ' +
                                      '  FROM legales.lbp_bloqueopagosiniestro ' +
                                      ' WHERE bp_idexpediente = ' + SqlInteger (fraSiniestrosJuicio.ID) +
                                      '   AND bp_idjuicioentramite = ' + SqlInteger (FIdJuicio) +
                                      '   AND bp_idconpago = ' + SqlInteger (fraConPagos.ID))),
                      'El bloqueo ya está ingresado',

                      fraConPagos,
                      not ((ModoABM = maModificacion) and
                           ExisteSql ('SELECT 1 ' +
                                      '  FROM legales.lbp_bloqueopagosiniestro ' +
                                      ' WHERE bp_idexpediente = ' + SqlInteger (fraSiniestrosJuicio.ID) +
                                      '   AND bp_idjuicioentramite = ' + SqlInteger (FIdJuicio) +
                                      '   AND bp_idconpago = ' + SqlInteger (fraConPagos.ID) +
                                      '   AND bp_id <> ' + SqlInteger (sdqConsulta.FieldByName('bp_id').AsInteger))),
                      'El bloqueo ya está ingresado'
                    ]);
end;

procedure TfrmBloqueoPagosSiniestros.ValidarMasiva;
begin
  Verificar(not fraSiniestroMultiple.IsSelected, fraSiniestroMultiple, 'Debe Seleccionar un Siniestro');
  Verificar(cmbConceptoPagoMultiple.CheckedCount = 0, cmbConceptoPagoMultiple, 'Debe Seleccionar un Concepto');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBloqueoPagosSiniestros.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'bp_fechabaja';
  Sql.TableName := 'legales.lbp_bloqueopagosiniestro';
  CheckPK := True;
end;
{----------------------------------------------------------------------------------------------------------------------}

procedure TfrmBloqueoPagosSiniestros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmBloqueoPagosSiniestros.tbModificarClick(Sender: TObject);
begin
  CheckPK := True;
  inherited;

end;

procedure TfrmBloqueoPagosSiniestros.tbCargaMultipleClick(Sender: TObject);
begin
  ClearControls;
  fpCargaMultiple.ShowModal;
end;

procedure TfrmBloqueoPagosSiniestros.btnAceptarMasivoClick(
  Sender: TObject);
var
 i : Integer;
begin
  ValidarMasiva;

  for i:=0 to cmbConceptoPagoMultiple.Items.Count-1 do
  begin
    if cmbConceptoPagoMultiple.Checked[i] then
    begin
(*
      Verificar(ExisteSql (
        'SELECT 1 ' +
        '  FROM legales.lbp_bloqueopagosiniestro ' +
        ' WHERE bp_idexpediente = ' + SqlInteger (fraSiniestroMultiple.ID) +
        '   AND bp_idjuicioentramite = ' + SqlInteger (FIdJuicio) +
        '   AND bp_idconpago = ' + SqlValue (Integer(cmbConceptoPagoMultiple.Items.Objects[i]))),
        cmbConceptoPagoMultiple,'Ya existe el Concepto:'+cmbConceptoPagoMultiple.Items.Strings[i]+'. Los anteriores se guardaron Correctamente.');
*)

      if not ExisteSql (
              'SELECT 1 ' +
              '  FROM legales.lbp_bloqueopagosiniestro ' +
              ' WHERE bp_idexpediente = ' + SqlInteger (fraSiniestroMultiple.ID) +
              '   AND bp_idjuicioentramite = ' + SqlInteger (FIdJuicio) +
              '   AND bp_idconpago = ' + SqlValue (Integer(cmbConceptoPagoMultiple.Items.Objects[i]))) then
        EjecutarSqlST(
            ' INSERT INTO legales.lbp_bloqueopagosiniestro '+
            '             (bp_id, bp_idjuicioentramite, bp_idexpediente, bp_idconpago, '+
            '              bp_estadobloqueo, bp_descripcioncausa, bp_fechaalta, bp_usualta) '+
            '      VALUES (legales.seq_lbs_id.NEXTVAL, '+SqlValue(FIdJuicio)+', '+
            SqlValue(fraSiniestroMultiple.ID)+', '+ SqlValue (Integer(cmbConceptoPagoMultiple.Items.Objects[i]))+','+
            SqlValue(Ord(chbEstado.Checked))+','+SqlValue(edDescripcionCausaMultiple.Text)+', SYSDATE, '+
            SqlValue(Sesion.LoginName)+')')
        else
          EjecutarSqlST(
              ' UPDATE legales.lbp_bloqueopagosiniestro ' +
              ' SET bp_estadobloqueo = ' + SqlValue(Ord(chbEstado.Checked)) + ', ' +
              '     bp_descripcioncausa = ' + SqlValue(edDescripcionCausaMultiple.Text)+ ', ' +
              '     bp_fechamodif = SYSDATE, ' +
              '     bp_usumodif = ' + SqlValue(Sesion.LoginName) + ', ' + 
              '     bp_fechabaja = null, ' +
              '     bp_usubaja = null ' +
              ' WHERE bp_idexpediente = ' + SqlInteger (fraSiniestroMultiple.ID) +
              '   AND bp_idjuicioentramite = ' + SqlInteger (FIdJuicio) +
              '   AND bp_idconpago = ' + SqlValue (Integer(cmbConceptoPagoMultiple.Items.Objects[i])));

      cmbConceptoPagoMultiple.Checked[i] := False;
    end;
  end;
  sdqConsulta.Refresh;
  fpCargaMultiple.ModalResult := mrOk;
end;

procedure TfrmBloqueoPagosSiniestros.btnCancelMasivoClick(Sender: TObject);
begin
  inherited;
  sdqConsulta.Refresh;
end;

end.



