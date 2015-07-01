unit unImpuestosManConceptos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Mask, PatternEdit;

type
  TfrmImpuestosManConceptos = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    chkNoMostrarBajas: TCheckBox;
    fraIC_IDTIPO: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    fraIC_IDIMPUESTO: TfraCodigoDescripcion;
    edIC_CONCEPTO: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edIC_CTACONTABLE: TPatternEdit;
    Label5: TLabel;
    fraIC_PROVINCIA: TfraCodigoDescripcion;
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
  frmImpuestosManConceptos: TfrmImpuestosManConceptos;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, SqlFuncs, unSesion, StrFuncs, General;

{$R *.dfm}

procedure TfrmImpuestosManConceptos.ClearControls;
begin
  edIC_CONCEPTO.Clear;
  fraIC_IDIMPUESTO.Clear;
  fraIC_IDTIPO.Clear;
  fraIC_PROVINCIA.Clear;
  edIC_CTACONTABLE.Clear;
end;

procedure TfrmImpuestosManConceptos.LoadControls;
begin
  with sdqConsulta do
    begin
      edIC_CONCEPTO.Text     := FieldByName('IC_CONCEPTO').AsString;
      fraIC_IDIMPUESTO.Value := FieldByName('IC_IDIMPUESTO').AsInteger;
      fraIC_IDTIPO.Value     := FieldByName('IC_IDTIPO').AsInteger;
      edIC_CTACONTABLE.Text  := FieldByName('IC_CTACONTABLE').AsString;
      fraIC_PROVINCIA.Codigo := FieldByName('IC_PROVINCIA').AsString;
    end;
end;

function TfrmImpuestosManConceptos.Validar: Boolean;
begin
  Verificar(IsEmptyString(edIC_CONCEPTO.Text), edIC_CONCEPTO, 'El concepto es obligatorio.');
  Verificar(fraIC_IDIMPUESTO.IsEmpty, fraIC_IDIMPUESTO, 'El impuesto es obligatorio.');
  Verificar(fraIC_IDTIPO.IsEmpty, fraIC_IDTIPO, 'El tipo es obligatorio.');
  Verificar(IsEmptyString(edIC_CTACONTABLE.Text), edIC_CTACONTABLE, 'La cuenta contable es obligatoria.');

  Result := True;
end;

function TfrmImpuestosManConceptos.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      if ModoABM = maBaja then
        begin
           PrimaryKey.Add('IC_ID',               sdqConsulta.FieldByName('ID').AsInteger);
           Fields.Add('IC_FECHABAJA',            exDateTime);
           Fields.Add('IC_USUBAJA',              Sesion.UserID);

           SqlType := stUpdate;
        end
      else
        begin
           if ModoABM = maAlta then
             begin
               PrimaryKey.Add('IC_ID',           GetSecNextVal('CONT.SEQ_OIC_ID'));
               Fields.Add('IC_FECHAALTA',        exDateTime);
               Fields.Add('IC_USUALTA',          Sesion.UserID);

               SqlType := stInsert;
             end;

           Fields.Add('IC_CONCEPTO',             Trim(edIC_CONCEPTO.Text));
           Fields.Add('IC_IDIMPUESTO',           fraIC_IDIMPUESTO.Value);
           Fields.Add('IC_IDTIPO',               fraIC_IDTIPO.Value);
           Fields.Add('IC_PROVINCIA',            fraIC_PROVINCIA.Codigo);
           Fields.Add('IC_CTACONTABLE',          Trim(edIC_CTACONTABLE.Text));
        end;

      Result := inherited DoABM;
    end
end;           

procedure TfrmImpuestosManConceptos.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT IC_CONCEPTO, IM_DESCRIPCION, IT_DESCRIPCION, ' +
                 'TRUNC(IC_FECHABAJA) FECHABAJA, IC_ID ID, IC_CTACONTABLE, ' +
                 'IC_PROVINCIA, PV_DESCRIPCION ' +
            'FROM ART.CPV_PROVINCIAS, CONT.OIT_IMPTIPO, CONT.OIM_IMPUESTO, CONT.OIC_IMPCONCEPTO ' +
           'WHERE IC_IDIMPUESTO = IM_ID ' +
             'AND IC_IDTIPO = IT_ID ' +
             'AND IC_PROVINCIA = PV_CODIGO(+)';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND IC_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmImpuestosManConceptos.FormCreate(Sender: TObject);
begin
  inherited;

  with fraIC_IDIMPUESTO do
    begin
      ShowBajas   := False;
      TableName   := 'CONT.OIM_IMPUESTO';
      FieldID     := 'IM_ID';
      FieldCodigo := 'IM_ID';
      FieldDesc   := 'IM_DESCRIPCION';
      FieldBaja   := 'IM_FECHABAJA';
    end;

  with fraIC_IDTIPO do
    begin
      ShowBajas   := False;
      TableName   := 'CONT.OIT_IMPTIPO';
      FieldID     := 'IT_ID';
      FieldCodigo := 'IT_ID';
      FieldDesc   := 'IT_DESCRIPCION';
      FieldBaja   := 'IT_FECHABAJA';
    end;

  with fraIC_PROVINCIA do
    begin
      ShowBajas   := False;
      TableName   := 'CPV_PROVINCIAS';
      FieldID     := 'PV_CODIGO';
      FieldCodigo := 'PV_CODIGO';
      FieldDesc   := 'PV_DESCRIPCION';
      FieldBaja   := 'PV_FECHABAJA';
    end;

  SQL.TableName := 'CONT.OIC_IMPCONCEPTO';
  FieldBaja     := 'FECHABAJA';
end;

procedure TfrmImpuestosManConceptos.tbLimpiarClick(Sender: TObject);
begin
  chkNoMostrarBajas.Checked := True;

  inherited;
end;

end.
