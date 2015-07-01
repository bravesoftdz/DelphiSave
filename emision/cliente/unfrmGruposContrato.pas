{-----------------------------------------------------------------------------
 Nombre Unidad: unfrmGruposContrato
 Autor:         cchiappero
 Fecha:         19-Ago-2005
 Proposito:     Administrar los contratos que pertenecen a un grupo, para poder
                diferenciar luego cual será el mecanismo para el cálculo de la
                emisión que se usará.
 Versiones:
-----------------------------------------------------------------------------}
unit unfrmGruposContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unFraCodigoDescripcion, unfraCodigoDescripcionExt, PeriodoPicker,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, DBCtrls;

type
  TFrmGruposContrato = class(TfrmCustomGridABM)
    gbFiltros: TGroupBox;
    lblFiltroGrupo: TLabel;
    fraGrupo: TfraCodigoDescripcionExt;
    ppPeriodoVigenciaDesde: TPeriodoPicker;
    ppPeriodoVigenciaHasta: TPeriodoPicker;
    lblFiltroPeriodo: TLabel;
    lblPeriodoHasta: TLabel;
    fraContrato: TfraEmpresa;
    lblFiltroCuit: TStaticText;
    fraContratoAsignar: TfraEmpresa;
    lblCUIT: TStaticText;
    lblContrato: TStaticText;
    lblVigencia: TLabel;
    ppVigenciaPertenciaDesde: TPeriodoPicker;
    lblVigenciaHasta: TLabel;
    ppVigenciaPertenciaHasta: TPeriodoPicker;
    fraGrupoAsignar: TfraCodigoDescripcionExt;
    StaticText1: TStaticText;
    tbDevengado: TToolButton;
    fpDevengadoMensual: TFormPanel;
    lblPeriodo: TLabel;
    lblObservacionesDevengado: TLabel;
    lblNota: TLabel;
    Bevel1: TBevel;
    btnAceptarDevengadoMensual: TButton;
    btnCancelarDevengadoMensual: TButton;
    ppPeriodoDevengadoMensual: TPeriodoPicker;
    mObservacionesProcesoDevengado: TMemo;
    sbDevengadoMensual: TStatusBar;
    Label1: TLabel;
    edtGrupo: TEdit;
    fpGrupo: TFormPanel;
    Bevel2: TBevel;
    btnAceptarGrupo: TButton;
    btnCancelarGrupo: TButton;
    GroupBox1: TGroupBox;
    lvGrupos: TListView;
    chkEmisionInmediata: TCheckBox;
    chkGeneraFondo: TCheckBox;
    chkPermiteDevengarIndividual: TCheckBox;
    procedure tbModificarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbDevengadoClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure btnCancelarGrupoClick(Sender: TObject);
    procedure lvGruposClick(Sender: TObject);
    procedure chkEmisionInmediataClick(Sender: TObject);
    procedure chkGeneraFondoClick(Sender: TObject);
    procedure chkPermiteDevengarIndividualClick(Sender: TObject);
    procedure lvGruposChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    FIdGrupo : Integer;
    FModificado : boolean;
    procedure AdministrarGrupos;
    procedure CargarGargarGrupos;
    procedure CargarOpciones;
    procedure GrabarCambio;
    { Private declarations }
//    FId : integer;
  protected
    procedure PrintResults; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    { Public declarations }
  end;

var
  FrmGruposContrato: TFrmGruposContrato;

implementation

uses unDmEmision, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unSesion, General, StrFuncs, VCLExtra,
     unPrincipal, unFuncionesEmision, unCustomConsulta;

{$R *.dfm}

{ TFrmGruposContrato }

procedure TFrmGruposContrato.ClearControls;
begin
  fraGrupo.Clear;
  fraContratoAsignar.Clear;
  ppVigenciaPertenciaDesde.Clear;
  ppVigenciaPertenciaHasta.Clear;

  inherited;
end;

function TFrmGruposContrato.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja Then begin
    Sql.PrimaryKey.Add( 'GC_ID', sdqConsulta.FieldByName('GC_ID').AsInteger );
    Sql.Fields.Add('GC_FECHABAJA', exDate );
    Sql.Fields.Add('GC_USUBAJA', Sesion.LoginName );
    Sql.SqlType := stUpdate;
  end else begin
    if ModoABM = maAlta Then begin
      Sql.PrimaryKey.AddExpression( 'GC_ID', 'SEQ_IGC_ID.NEXTVAL' );
      Sql.Fields.Add( 'GC_CONTRATO', fraContratoAsignar.Contrato);
      Sql.Fields.Add( 'GC_PERIODOVIGENCIADESDE', ppVigenciaPertenciaDesde.Periodo.Valor);
      Sql.Fields.Add( 'GC_PERIODOVIGENCIAHASTA', ppVigenciaPertenciaHasta.Periodo.Valor);

      Sql.Fields.Add( 'GC_IDGRUPOEMISION', fraGrupoAsignar.Codigo);
      Sql.Fields.Add( 'GC_FECHAALTA', exDate );
      Sql.Fields.Add( 'GC_USUALTA', Sesion.LoginName);
      Sql.SqlType := stInsert;
    end else
    begin
      Sql.PrimaryKey.Add( 'GC_ID', sdqConsulta.FieldByName('GC_ID').AsInteger);
      Sql.Fields.Add( 'GC_PERIODOVIGENCIAHASTA', ppVigenciaPertenciaHasta.Periodo.Valor);
      Sql.SqlType := stUpdate;
    end;

  end;
  Result := inherited DoABM;
end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.LoadControls;
begin
  fraGrupoAsignar.Codigo      := sdqConsulta.FieldByName('GC_IDGRUPOEMISION').AsString;
  fraContratoAsignar.Contrato := sdqConsulta.FieldByName('GC_CONTRATO').AsInteger;
  ppVigenciaPertenciaDesde.Periodo.Valor  := sdqConsulta.FieldByName('GC_PERIODOVIGENCIADESDE').AsString;
  ppVigenciaPertenciaHasta.Periodo.Valor  := sdqConsulta.FieldByName('GC_PERIODOVIGENCIAHASTA').AsString;

  inherited;
end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.PrintResults;
begin
  inherited;
end;
{--------------------------------------------------------------------------------}
function TFrmGruposContrato.Validar: Boolean;
var
 periodo : string;
begin
  Result := True;
  periodo := ValorSQL('select to_char(sysdate, ''YYYYMM'') from dual', '199601');

  VerificarMultiple(['Guardando Grupos de Contrato Emisión',
                      fraGrupoAsignar.edCodigo, fraGrupoAsignar.IsSelected, 'Debe seleccionar un grupo',
                      fraContratoAsignar.edContrato, fraContratoAsignar.IsSelected, 'Debe seleccionar un contrato',
                      ppVigenciaPertenciaDesde,
                     (ppVigenciaPertenciaHasta.Periodo.IsNull) or
                    ((not ppVigenciaPertenciaHasta.Periodo.IsNull) and
                     (ppVigenciaPertenciaHasta.Periodo.Valor >= ppVigenciaPertenciaDesde.Periodo.Valor)),
                      'El periodo de Fin Vigencia no puede ser anterior al de Inicio de Vigencia']);

end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.tbModificarClick(Sender: TObject);
begin
  VCLExtra.LockControls([fraGrupoAsignar, fraContratoAsignar, ppVigenciaPertenciaDesde], true);
  inherited;
end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.tbNuevoClick(Sender: TObject);
begin
  VCLExtra.LockControls([fraGrupoAsignar, fraContratoAsignar,
                         ppVigenciaPertenciaDesde,
                         ppVigenciaPertenciaHasta], false);
  inherited;
end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.FormCreate(Sender: TObject);
begin
  inherited;

  with fraGrupo do
  begin
    TableName := 'emi.ige_grupoemision';
    FieldID     := 'ge_id';
    FieldCodigo := 'ge_id';
    FieldDesc   := 'ge_descripcion';
    FieldBaja   := 'ge_fechabaja';
    Showbajas   := true;
  end;

  with fraGrupoAsignar do
  begin
    TableName := 'emi.ige_grupoemision';
    FieldID     := 'ge_id';
    FieldCodigo := 'ge_id';
    FieldDesc   := 'ge_descripcion';
    FieldBaja   := 'ge_fechabaja';
    Showbajas   := true;
  end;


  fraContratoAsignar.ShowBajas := true;
  fraContrato.ShowBajas := true;

  Sql.TableName := 'emi.igc_grupoemisioncontrato';
  FieldBaja := 'gc_fechabaja';
end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.tbRefrescarClick(Sender: TObject);
var
 sSql : string;
begin
  sSql := 'SELECT                                   ' +
          '     ige_grupoemision.ge_descripcion,    ' +
          '     igc.gc_contrato,                    ' +
          '     igc.gc_periodovigenciadesde,        ' +
          '     igc.gc_periodovigenciahasta,        ' +
          '     aem_empresa.em_cuit,                ' +
          '     aem_empresa.em_nombre,              ' +
          '     igc.gc_id,                          ' +
          '     igc.gc_usubaja, igc.gc_fechabaja,   ' +
          '     igc.gc_fechaalta, igc.gc_usualta,   ' +
          '     igc.gc_idgrupoemision               ' +
          ' FROM emi.igc_grupoemisioncontrato igc,  ' +
          '     afi.aco_contrato,                   ' +
          '     emi.ige_grupoemision,               ' +
          '     aem_empresa                         ' +
          ' WHERE (    (aco_contrato.co_contrato = igc.gc_contrato)    ' +
          '      AND (ige_grupoemision.ge_id = igc.gc_idgrupoemision)  ' +
          '      AND (aem_empresa.em_id = aco_contrato.co_idempresa))  ';

  if fraGrupo.IsSelected then
    sSql := sSql + ' and (igc.gc_idgrupoemision = ' + SqlInteger(fraGrupo.Codigo, false) + ')';

  if fraContrato.IsSelected then
   sSql := sSql + ' and (igc.gc_contrato = ' + SqlInteger(fraContrato.Contrato, False)  + ')';

  if (ppPeriodoVigenciaDesde.Periodo.Valor <> '') then
  begin
    if (ppPeriodoVigenciaHasta.Periodo.Valor <> '') then
     sSql := sSql + ' and (igc.gc_periodovigenciadesde <= ' + SqlValue(ppPeriodoVigenciaDesde.Periodo.Valor) + ' and igc.gc_periodovigenciahasta is null ) '
    else
     sSql := sSql + ' and (igc.gc_periodovigenciadesde <= ' +
                    SqlValue(ppPeriodoVigenciaDesde.Periodo.Valor)  +
                    ' and ((igc.gc_periodovigenciahasta >= ' +
                    SqlValue(ppPeriodoVigenciaHasta.Periodo.Valor)  +
                    ') or (igc.gc_periodovigenciahasta is null) ) ';
   end;
   sdqConsulta.SQL.Text := sSql;

  inherited;
end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.tbDevengadoClick(Sender: TObject);
begin
//  inherited;

end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.tbPropiedadesClick(Sender: TObject);
begin
//  inherited;
  AdministrarGrupos;
end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.AdministrarGrupos;
begin
  CommitTrans(true);
  CargarGargarGrupos;
  BeginTrans(true);
  fpGrupo.Showmodal;
end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.CargarGargarGrupos;
var
 Q : TSDQuery;
begin
  Q := GetQuery('select * from emi.ige_grupoemision');

  try
    lvGrupos.Clear;

    while not Q.Eof do
    begin
        lvGrupos.AddItem(Q.FieldByName('ge_descripcion').AsString,
                         TObject(Q.FieldByName('ge_id').asinteger));
        Q.Next;
    end;
    Q.Close;

    if lvGrupos.Items.Count > 0 then
      lvGrupos.Items.Item[0].Selected := true;


  finally
    Q.Free;
  end;
end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.btnCancelarGrupoClick(Sender: TObject);
begin
  Rollback(true);
  fpGrupo.Close;
end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.lvGruposClick(Sender: TObject);
begin
  CargarOpciones;
end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.GrabarCambio;
begin
  if chkEmisionInmediata.Enabled and
     chkGeneraFondo.Enabled and
     chkPermiteDevengarIndividual.Enabled then
  begin
    EjecutarSqlST('update emi.ige_grupoemision  ' +
                '   set ge_emisioninmediato = ' + SqlValue(chkEmisionInmediata.Checked) + ', ' +
                '       ge_generafondo = ' + SqlValue(chkGeneraFondo.Checked) + ', ' +
                '       ge_devengaindividual = ' + SqlValue(chkPermiteDevengarIndividual.Checked) +
                ' where ge_id = ' + SqlValue(FIdGrupo));
  end;
end;
{--------------------------------------------------------------------------------}
procedure TFrmGruposContrato.CargarOpciones;
var
 Q : TSDQuery;
begin
  if FModificado then GrabarCambio;
  if Assigned(lvGrupos.Selected) then
  begin
    FIdGrupo := Integer(lvGrupos.Selected.data);
    FModificado := False;
    Q := GetQuery('select * from emi.ige_grupoemision where ge_id = ' + SqlValue(FIdGrupo));
    if Q.RecordCount > 0 then
    begin
      chkEmisionInmediata.Enabled := true;
      chkGeneraFondo.Enabled := true;
      chkPermiteDevengarIndividual.Enabled := true;

      chkEmisionInmediata.Checked := Q.FieldByName('GE_EMISIONINMEDIATO').AsString = 'S';
      chkGeneraFondo.Checked := Q.FieldByName('GE_GENERAFONDO').AsString = 'S';
      chkPermiteDevengarIndividual.Checked := Q.FieldByName('GE_DEVENGAINDIVIDUAL').AsString = 'S';
    end
    else
    begin
      chkEmisionInmediata.Enabled := false;
      chkGeneraFondo.Enabled := false;
      chkPermiteDevengarIndividual.Enabled := false;
    end;
  end;
end;

procedure TFrmGruposContrato.chkEmisionInmediataClick(Sender: TObject);
begin
  FModificado := True;
end;

procedure TFrmGruposContrato.chkGeneraFondoClick(Sender: TObject);
begin
  FModificado := True;
end;

procedure TFrmGruposContrato.chkPermiteDevengarIndividualClick(
  Sender: TObject);
begin
  FModificado := True;
end;

procedure TFrmGruposContrato.lvGruposChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  CargarOpciones;
end;

end.
