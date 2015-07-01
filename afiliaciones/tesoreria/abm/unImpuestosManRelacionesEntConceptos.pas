unit unImpuestosManRelacionesEntConceptos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraStaticCodigoDescripcion, Mask, PatternEdit,
  ComboEditor, ComboGrid, unfraCtbTablas, IntEdit;

type
  TfrmImpuestosManRelacionesEntConceptos = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    chkNoMostrarBajas: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    fraIX_IDENTIDAD: TfraCodigoDescripcion;
    GroupBox1: TGroupBox;
    fraEntidadBusq: TfraCodigoDescripcion;
    GroupBox2: TGroupBox;
    fraConceptoBusq: TfraCodigoDescripcion;
    fraIX_IDCONCEPTO: TfraCodigoDescripcion;
    fraIX_METODOPAGO: TfraCtbTablas;
    Label3: TLabel;
    Label4: TLabel;
    edIX_BENEFICIARIO: TEdit;
    Label5: TLabel;
    edIX_ENDOSO: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  public
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmImpuestosManRelacionesEntConceptos: TfrmImpuestosManRelacionesEntConceptos;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, SqlFuncs, unSesion, StrFuncs, General;

{$R *.dfm}

procedure TfrmImpuestosManRelacionesEntConceptos.ClearControls;
begin
  fraIX_IDENTIDAD.Clear;
  fraIX_IDCONCEPTO.Clear;
  edIX_BENEFICIARIO.Clear;
  fraIX_METODOPAGO.Clear;
  edIX_ENDOSO.Clear;
end;

procedure TfrmImpuestosManRelacionesEntConceptos.LoadControls;
begin
  with sdqConsulta do
    begin
      fraIX_IDENTIDAD.Value   := FieldByName('IX_IDENTIDAD').AsInteger;
      fraIX_IDCONCEPTO.Value  := FieldByName('IX_IDCONCEPTO').AsInteger;
      edIX_BENEFICIARIO.Text  := FieldByName('IX_BENEFICIARIO').AsString;
      fraIX_METODOPAGO.Value  := FieldByName('IX_METODOPAGO').AsString;
      edIX_ENDOSO.Text        := FieldByName('IX_ENDOSO').AsString;
    end;
end;

function TfrmImpuestosManRelacionesEntConceptos.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraIX_IDENTIDAD.IsEmpty, fraIX_IDENTIDAD, 'La entidad es obligatoria.');
  Verificar(fraIX_IDCONCEPTO.IsEmpty, fraIX_IDCONCEPTO, 'El concepto es obligatorio.');
  Verificar(fraIX_METODOPAGO.IsEmpty, fraIX_METODOPAGO, 'El método de pago es obligatorio.');

  sSql := 'SELECT 1 ' +
            'FROM CONT.OIX_IMPENTIDADCONCEPTO ' +
           'WHERE IX_FECHABAJA IS NULL ' +
             'AND IX_IDENTIDAD = :IdEntidad ' +
             'AND IX_IDCONCEPTO = :IdConcepto ' +
           String(Iif(ModoABM = maModificacion, 'AND IX_ID <> ' + SqlValue(sdqConsulta.FieldByName('ID').AsInteger), ''));
  Verificar(ExisteSqlEx(sSql, [fraIX_IDENTIDAD.Value, fraIX_IDCONCEPTO.Value]), fraIX_IDENTIDAD, 'La relación entidad-concepto ya existe.' );

  Result := True;
end;

function TfrmImpuestosManRelacionesEntConceptos.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      if ModoABM = maBaja then
        begin
           PrimaryKey.Add('IX_ID',               sdqConsulta.FieldByName('ID').AsInteger);
           Fields.Add('IX_FECHABAJA',            exDateTime);
           Fields.Add('IX_USUBAJA',              Sesion.UserID);

           SqlType := stUpdate;
        end
      else
        begin
           if ModoABM = maAlta then
             begin
               PrimaryKey.Add('IX_ID',           GetSecNextVal('CONT.SEQ_OIX_ID'));
               Fields.Add('IX_FECHAALTA',        exDateTime);
               Fields.Add('IX_USUALTA',          Sesion.UserID);

               SqlType := stInsert;
             end;

           Fields.Add('IX_IDENTIDAD',            fraIX_IDENTIDAD.Value);
           Fields.Add('IX_IDCONCEPTO',           fraIX_IDCONCEPTO.Value);
           Fields.Add('IX_BENEFICIARIO',         Trim(edIX_BENEFICIARIO.Text));
           Fields.Add('IX_METODOPAGO',           fraIX_METODOPAGO.Value);
           Fields.Add('IX_ENDOSO',               Trim(edIX_ENDOSO.Text));
        end;

      Result := inherited DoABM;
    end
end;           

procedure TfrmImpuestosManRelacionesEntConceptos.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT IC_CONCEPTO, IE_NOMBRE, IE_CUIT, IM_DESCRIPCION, IT_DESCRIPCION, ' +
                 'TRUNC(IX_FECHABAJA) FECHABAJA, IX_ID ID, PV_DESCRIPCION, IX_METODOPAGO, ' +
                 'IX_BENEFICIARIO, IX_ENDOSO, METPAGO.TB_DESCRIPCION DESCRMETPAGO ' +
            'FROM ART.CTB_TABLAS METPAGO, ART.CPV_PROVINCIAS, CONT.OIT_IMPTIPO, CONT.OIM_IMPUESTO, CONT.OIE_IMPENTIDAD, ' +
                 'CONT.OIC_IMPCONCEPTO, CONT.OIX_IMPENTIDADCONCEPTO ' +
           'WHERE IX_IDENTIDAD = IE_ID ' +
             'AND IX_IDCONCEPTO = IC_ID ' +
             'AND IC_IDIMPUESTO = IM_ID ' +
             'AND IC_IDTIPO = IT_ID ' +
             'AND IC_PROVINCIA = PV_CODIGO(+) ' +
             'AND METPAGO.TB_CLAVE = ''COBRO'' ' +
             'AND METPAGO.TB_CODIGO = IX_METODOPAGO';

  if fraEntidadBusq.IsSelected then
    sWhere := sWhere + ' AND IE_ID = ' + SqlValue(fraEntidadBusq.Value);

  if fraConceptoBusq.IsSelected then
    sWhere := sWhere + ' AND IC_ID = ' + SqlValue(fraConceptoBusq.Value);

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND IX_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmImpuestosManRelacionesEntConceptos.FormCreate(Sender: TObject);
begin
  inherited;

  with fraIX_IDENTIDAD do
    begin
      ShowBajas   := False;
      TableName   := 'CONT.OIE_IMPENTIDAD';
      FieldID     := 'IE_ID';
      FieldCodigo := 'IE_ID';
      FieldDesc   := 'IE_NOMBRE';
      FieldBaja   := 'IE_FECHABAJA';
    end;

  with fraIX_IDCONCEPTO do
    begin
      ShowBajas             := False;
      TableName             := 'CONT.OIC_IMPCONCEPTO';
      FieldID               := 'IC_ID';
      FieldCodigo           := 'IC_ID';
      FieldDesc             := 'IC_CONCEPTO';
      FieldBaja             := 'IC_FECHABAJA';
      ExtraFields           := ', IM_DESCRIPCION, IT_DESCRIPCION, PV_DESCRIPCION ';
      ExtraTables           := ', ART.CPV_PROVINCIAS, CONT.OIT_IMPTIPO, CONT.OIM_IMPUESTO';
      ExtraCondition        := ' AND IC_IDIMPUESTO = IM_ID AND IC_IDTIPO = IT_ID AND IC_PROVINCIA = PV_CODIGO(+) AND IT_FECHABAJA IS NULL AND IM_FECHABAJA IS NULL';
    end;

  with fraIX_METODOPAGO do
    begin
      Clave     := 'COBRO';
      ShowBajas := False;
    end;

  with fraEntidadBusq do
    begin
      ShowBajas   := True;
      TableName   := 'CONT.OIE_IMPENTIDAD';
      FieldID     := 'IE_ID';
      FieldCodigo := 'IE_ID';
      FieldDesc   := 'IE_NOMBRE';
      FieldBaja   := 'IE_FECHABAJA';
    end;

  with fraConceptoBusq do
    begin
      ShowBajas             := True;
      TableName             := 'CONT.OIC_IMPCONCEPTO';
      FieldID               := 'IC_ID';
      FieldCodigo           := 'IC_ID';
      FieldDesc             := 'IC_CONCEPTO';
      FieldBaja             := 'IC_FECHABAJA';
      ExtraFields           := ', IM_DESCRIPCION, IT_DESCRIPCION, PV_DESCRIPCION ';
      ExtraTables           := ', ART.CPV_PROVINCIAS, CONT.OIT_IMPTIPO, CONT.OIM_IMPUESTO';
      ExtraCondition        := ' AND IC_IDIMPUESTO = IM_ID AND IC_IDTIPO = IT_ID AND IC_PROVINCIA = PV_CODIGO(+) AND IT_FECHABAJA IS NULL AND IM_FECHABAJA IS NULL';
    end;

  SQL.TableName := 'CONT.OIX_IMPENTIDADCONCEPTO';
  FieldBaja     := 'FECHABAJA';
end;

procedure TfrmImpuestosManRelacionesEntConceptos.tbLimpiarClick(Sender: TObject);
begin
  fraEntidadBusq.Clear;
  fraConceptoBusq.Clear;
  chkNoMostrarBajas.Checked := True;

  inherited;
end;

end.

