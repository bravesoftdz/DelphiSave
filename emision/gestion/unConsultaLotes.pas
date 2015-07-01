unit unConsultaLotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, PatternEdit, ComboEditor, CheckCombo,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, ToolEdit,
  DateComboBox, JvgGroupBox, unFraCodigoDescripcion,
  unfraCodigoDescripcionExt, IntEdit;

type
  TfrmConsultaLotes = class(TfrmCustomConsulta)
    lblEstado: TLabel;
    cmbEstado: TCheckCombo;
    fraEmpresa: TfraEmpresa;
    lblCuit: TLabel;
    gbFiltro: TJvgGroupBox;
    lblFechaDesdeFiltro: TLabel;
    edFechaDesde: TDateComboBox;
    lblFechaHastaFIltro: TLabel;
    edFechaHasta: TDateComboBox;
    fraResponsable: TfraCodigoDescripcionExt;
    lblResponsable: TLabel;
    edNroLoteDesde: TIntEdit;
    lblNroLote: TLabel;
    Label1: TLabel;
    edNroLoteHasta: TIntEdit;
    ShortCutControlSinHerenciaDelOrto: TShortCutControl;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    procedure ArmarConsulta;
  public
    { Public declarations }
  end;

var
  frmConsultaLotes: TfrmConsultaLotes;

implementation

{$R *.dfm}

uses unDmPrincipal, unGeneracionLote, AnsiSql, General, unComunesGestion, CustomDlgs;

procedure TfrmConsultaLotes.ArmarConsulta;
var
  sSql: String;
  sInEstado: String;
  i: integer;
begin
  sSql := ' SELECT lo_id, lo_numerolote, lo_fechaalta, lo_usualta, lo_fechamodif, ' +
          '        lo_usumodif, lo_fechabaja, lo_usubaja, lo_fechainicio, ' +
          '        lo_fechavencimiento, lo_fechaagendada, lo_observacion, ' +
          '        lo_idestado, lo_responsable, lo_descripcion, lo_tipoasignacion, el_descripcion, se_usuario ' +
          ' FROM art.use_usuarios, emi.iel_estadolote, emi.ilo_lote ' +
          ' WHERE el_id = lo_idestado ' +
          ' AND se_id = lo_responsable ';

  if fraEmpresa.IsSelected then
    sSql := sSql + ' AND EXISTS (SELECT 1 ' +
                   '             FROM emi.isl_subaccionlote, emi.ids_detallesublote ' +
                   '             WHERE sl_idlote = lo_id ' +
                   '             AND sl_id = ds_idsublote ' +
                   '             AND ds_contrato = ' + SqlValue(fraEmpresa.Contrato) +
                   '             )';

  if not edNroLoteDesde.IsEmpty then
  begin
     if not edNroLoteHasta.IsEmpty then
     begin
       sSql := sSql + ' and LO_NUMEROLOTE between '
               + SqlValue(edNroLoteDesde.Value) + 'and '
               + SqlValue(edNroLoteHasta.Value);
     end else
     begin
       sSql := sSql + ' and LO_NUMEROLOTE >= ' + SqlValue(edNroLoteDesde.Value);
     end;
  end
  else begin
    if not edNroLoteHasta.IsEmpty then
      sSql := sSql + ' and LO_NUMEROLOTE <= ' + SqlValue(edNroLoteHasta.Value);
  end;

  if edFechaDesde.Date > 0  then
  begin
     if edFechaHasta.Date > 0  then
     begin
       sSql := sSql + ' and trunc(LO_FECHAALTA) between '
               + SqlDate(edFechaDesde.Date) + 'and '
               + SqlDate(edFechaHasta.Date);
     end else
     begin
       sSql := sSql + ' and trunc(LO_FECHAALTA) >= ' + SqlDate(edFechaDesde.Date);
     end;
  end
  else begin
    if edFechaHasta.Date > 0  then
      sSql := sSql + ' and trunc(LO_FECHAALTA) <= ' + SqlDate(edFechaHasta.Date);
  end;

  sInEstado := '';
  if (cmbEstado.CheckedCount > 0) then
  begin
    for i:=0 to cmbEstado.Items.Count-1 do
    begin
        if cmbEstado.Checked[i] then
        begin
          if (sInEstado <> '') then
            sInEstado := sInEstado + ', ';
          sInEstado := sInEstado + inttostr(integer(cmbEstado.Items.Objects[i]));
        end;
    end;
    if (sInEstado <> '') then
      sSql := sSql + ' AND lo_idestado IN (' + sInEstado + ') ';
  end;

  if fraResponsable.IsSelected then
    sSql := sSql + ' and LO_RESPONSABLE = ' + SqlValue(fraResponsable.Value);

  if trim (SortDialog.OrderBy) <> '' then
    sSql := sSql + ' ' + SortDialog.OrderBy
  else
    sSql := sSql + ' order by lo_id ';

  sdqConsulta.SQL.Text := sSql;


end;

procedure TfrmConsultaLotes.tbRefrescarClick(Sender: TObject);
begin
  ArmarConsulta;
  inherited;
end;

procedure TfrmConsultaLotes.FormCreate(Sender: TObject);
begin
  inherited;
  with fraResponsable do
  begin
    TableName   := 'ART.USE_USUARIOS';
    FieldID     := 'SE_ID';
    FieldCodigo := 'SE_USUARIO';
    FieldDesc   := 'SE_NOMBRE';
    FieldBaja   := 'SE_FECHABAJA';
    ExtraCondition := ' AND SE_USUARIOGENERICO = ''N''';
    ShowBajas   := false;
  end;

  cmbEstado.Clear;
  with GetQuery('SELECT EL_ID, EL_DESCRIPCION FROM EMI.IEL_ESTADOLOTE') do
  try
   while not Eof do
   begin
    cmbEstado.Items.AddObject(FieldbyName('EL_DESCRIPCION').AsString, TObject(FieldbyName('EL_ID').AsInteger));
    Next;
   end;
  finally
    Free;
  end;

  fraEmpresa.ShowBajas := true;
end;

procedure TfrmConsultaLotes.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  edNroLoteDesde.Clear;
  edNroLoteHasta.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  cmbEstado.Clear;
  fraResponsable.Clear;
  sdqConsulta.Close;
  inherited;
end;

procedure TfrmConsultaLotes.tbNuevoClick(Sender: TObject);
begin
  inherited;
  with TfrmGeneracionLote.Create(self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmConsultaLotes.tbModificarClick(Sender: TObject);
begin
  inherited;
  with TfrmGeneracionLote.Create(self) do
  try
    CargarLote(self.sdqConsulta.fieldbyname('lo_id').AsInteger);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmConsultaLotes.tbEliminarClick(Sender: TObject);
//var
//  bExiste: boolean;
begin
  if not sdqConsulta.fieldbyname('lo_fechabaja').IsNull then Exit;

  if ExisteSqlEx (' SELECT 1 ' +
                  ' FROM emi.ieg_estadogestion, emi.idg_detallesubloteengestion, emi.ids_detallesublote, emi.isl_sublote, ' +
                  '      emi.ilo_lote ' +
                  ' WHERE sl_idlote = lo_id ' +
                  '   AND eg_id = dg_idestadogestion ' +
                  '   AND ds_idsublote = sl_id ' +
                  '   AND dg_iddetallesublote = ds_id ' +
                  '   AND sl_fechabaja IS NULL ' +
                  '   AND ds_fechabaja IS NULL ' +
                  '   AND dg_fechabaja IS NULL ' +
                  '   AND eg_tipo = ''F''' +
                  '   AND lo_id = :idlote ', [sdqConsulta.fieldbyname('lo_id').AsInteger]) then
    MsgBox('El lote Nro: ' + sdqConsulta.fieldbyname('lo_numerolote').AsString + ' no se puede eliminar porque tiene gestiones finalizadas.', MB_ICONERROR)
  else begin
    if not sdqConsulta.IsEmpty then
    begin
      try
      (*
        bExiste := ExisteSqlEx (' SELECT 1 ' +
                                ' FROM emi.ige_gestionable, emi.idg_detallesubloteengestion, emi.ids_detallesublote, art.use_usuarios, emi.isl_sublote, ' +
                                '      emi.ilo_lote ' +
                                ' WHERE sl_idlote = lo_id ' +
                                '   AND se_id = sl_idusuariogestion ' +
                                '   AND ds_idsublote = sl_id ' +
                                '   AND dg_iddetallesublote = ds_id ' +
                                '   AND ge_id = dg_idgestionable ' +
                                '   AND sl_fechabaja IS NULL ' +
                                '   AND ds_fechabaja IS NULL ' +
                                '   AND dg_fechabaja IS NULL ' +
                                '   AND dg_salidagestion NOT IN (3,4,6) ' +   //No sea mail ni correo ni ventanilla
                                '   AND lo_id = :idlote ', [sdqConsulta.fieldbyname('lo_id').AsInteger]);
      *)
        do_eliminarlote(sdqConsulta.fieldbyname('lo_id').AsInteger);
        sdqConsulta.Refresh;
        MsgBox('El lote Nro: ' + sdqConsulta.fieldbyname('lo_numerolote').AsString + ' ha sido eliminado con éxito.'
//              + iif(bExiste, #13#10 + 'Recuerde de eliminar las tareas del SIC generadas por el lote. ', '')
                , MB_ICONINFORMATION);

      except
        on E: Exception do
          ErrorMsg(E, 'Error al eliminar el lote.');
      end;
    end;
  end;
end;

procedure TfrmConsultaLotes.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.FieldByName('lo_fechabaja').IsNull then
    AFont.Color := clRed;
end;

end.
