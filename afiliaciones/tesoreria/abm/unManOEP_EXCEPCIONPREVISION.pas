unit unManOEP_EXCEPCIONPREVISION;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, Mask, ToolEdit, CurrEdit, DateComboBox;
                      
type
  TfrmManOEP_EXCEPCIONPREVISION = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    fraEmpresaExc: TfraEmpresa;
    chkSoloActivasExc: TCheckBox;
    ShortCutControl1: TShortCutControl;
    fraEP_IDEMPRESA: TfraEmpresa;
    lbRSocial: TLabel;
    edEP_PORCSUJPREV: TCurrencyEdit;
    edEP_MONTORESERVA: TCurrencyEdit;
    Label3: TLabel;
    edEP_FECHADESDE: TDateComboBox;
    Label2: TLabel;
    edEP_FECHAHASTA: TDateComboBox;
    chkEP_MONTORESERVA: TCheckBox;
    chkEP_PORCSUJPREV: TCheckBox;
    Label1: TLabel;
    Label4: TLabel;
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure chkEP_MONTORESERVAClick(Sender: TObject);
    procedure chkEP_PORCSUJPREVClick(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
		function DoABM: Boolean; override;
		procedure RefreshData; override;
  public
  end;

var
  frmManOEP_EXCEPCIONPREVISION: TfrmManOEP_EXCEPCIONPREVISION;

implementation

uses
  AnsiSql, unDmPrincipal, unSesion, SqlFuncs, VCLExtra, CustomDlgs, General, DateTimeFuncs;

{$R *.dfm}

function TfrmManOEP_EXCEPCIONPREVISION.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maBaja then
        begin
          SqlType := stUpdate;
          PrimaryKey.Add('EP_ID',              sdqConsulta.FieldByName('EP_ID').AsInteger);

          Fields.Add('EP_USUBAJA',             Sesion.UserId);
          Fields.Add('EP_FECHABAJA',           exDateTime);
        end
      else
      begin
        // al modificar, solo se permite cambiar la fecha hasta
        if edEP_FECHAHASTA.IsEmpty then
          Fields.Add('EP_FECHAHASTA',          exNull)
        else
          Fields.Add('EP_FECHAHASTA',          edEP_FECHAHASTA.Date);

        if ModoABM = maAlta then
          begin
            PrimaryKey.Add('EP_ID',            'SEQ_OEP_ID.NEXTVAL', False);

            Fields.Add('EP_IDEMPRESA',         fraEP_IDEMPRESA.ID);

            if chkEP_MONTORESERVA.Checked then
              Fields.Add('EP_MONTORESERVA',    edEP_MONTORESERVA.Value)
            else
              Fields.Add('EP_MONTORESERVA',    exNull);

            if chkEP_PORCSUJPREV.Checked then
              Fields.Add('EP_PORCSUJPREV',     edEP_PORCSUJPREV.Value)
            else
              Fields.Add('EP_PORCSUJPREV',     exNull);

            Fields.Add('EP_FECHADESDE',        edEP_FECHADESDE.Date);
            Fields.Add('EP_USUALTA',           Sesion.UserId);
            Fields.Add('EP_FECHAALTA',         exDateTime);
          end
        else
          PrimaryKey.Add('EP_ID',              sdqConsulta.FieldByName('EP_ID').AsInteger);
      end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmManOEP_EXCEPCIONPREVISION.ClearControls;
begin
  fraEP_IDEMPRESA.Clear;
  edEP_MONTORESERVA.Clear;
  edEP_PORCSUJPREV.Clear;
  edEP_FECHADESDE.Clear;
  edEP_FECHAHASTA.Clear;
  chkEP_MONTORESERVA.Checked := False;
  chkEP_MONTORESERVAClick(nil);
  chkEP_PORCSUJPREV.Checked  := False;
  chkEP_PORCSUJPREVClick(nil);
end;

procedure TfrmManOEP_EXCEPCIONPREVISION.LoadControls;
begin
  fraEP_IDEMPRESA.ID := sdqConsulta.FieldByName('EP_IDEMPRESA').AsInteger;

  chkEP_MONTORESERVA.Checked := (not sdqConsulta.FieldByName('EP_MONTORESERVA').IsNull);
  chkEP_MONTORESERVAClick(nil);
  edEP_MONTORESERVA.Value    := sdqConsulta.FieldByName('EP_MONTORESERVA').AsFloat;

  chkEP_PORCSUJPREV.Checked := (not sdqConsulta.FieldByName('EP_PORCSUJPREV').IsNull);
  chkEP_PORCSUJPREVClick(nil);
  edEP_PORCSUJPREV.Value    :=  sdqConsulta.FieldByName('EP_PORCSUJPREV').AsFloat;

  edEP_FECHADESDE.Date := sdqConsulta.FieldByName('EP_FECHADESDE').AsDateTime;
  edEP_FECHAHASTA.Date := sdqConsulta.FieldByName('EP_FECHAHASTA').AsDateTime;
end;

function TfrmManOEP_EXCEPCIONPREVISION.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraEP_IDEMPRESA.IsEmpty, fraEP_IDEMPRESA, 'La empresa es obligatoria.');
  Verificar(edEP_FECHADESDE.IsEmpty, edEP_FECHADESDE, 'La fecha desde es obligatoria.');

  sSql := 'SELECT 1 ' +
            'FROM OEP_EXCEPCIONPREVISION ' +
           'WHERE EP_IDEMPRESA = :Id ' +
             'AND EP_FECHABAJA IS NULL ' +
             'AND ((:FDesde BETWEEN EP_FECHADESDE AND NVL(EP_FECHAHASTA, TO_DATE(''13/12/9999'', ''DD/MM/YYYY''))) ' +
               'OR (NVL(:FHasta, TO_DATE(''13/12/9999'', ''DD/MM/YYYY'')) BETWEEN EP_FECHADESDE AND NVL(EP_FECHAHASTA, TO_DATE(''13/12/9999'', ''DD/MM/YYYY''))) ' +
               'OR (:FDesde < EP_FECHADESDE AND NVL(:FHasta, TO_DATE(''13/12/9999'', ''DD/MM/YYYY'')) > NVL(EP_FECHAHASTA, TO_DATE(''13/12/9999'', ''DD/MM/YYYY''))) ' +
                 ') ';
  if ModoABM = maModificacion then
    sSql := sSql + 'AND EP_ID <> ' + SqlValue(sdqConsulta.FieldByName('EP_ID').AsInteger);

  Verificar(ExisteSqlEx(sSql, [fraEP_IDEMPRESA.ID, TDateTimeEx.Create(edEP_FECHADESDE.Date), TDateTimeEx.Create(edEP_FECHAHASTA.Date), TDateTimeEx.Create(edEP_FECHADESDE.Date), TDateTimeEx.Create(edEP_FECHAHASTA.Date)]), edEP_FECHADESDE, 'La empresa ya tiene asignado un rango que involucra a uno o más de los periodos ingresados.');
  
  Result := True;
end;

procedure TfrmManOEP_EXCEPCIONPREVISION.RefreshData;
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT EP_ID, EP_MONTORESERVA, EP_PORCSUJPREV, EP_FECHADESDE, EP_FECHAHASTA, ' +
                 'EP_FECHABAJA, EM_CUIT, EM_NOMBRE, EP_IDEMPRESA ' +
            'FROM AEM_EMPRESA, CONT.OEP_EXCEPCIONPREVISION ' +
           'WHERE EP_IDEMPRESA = EM_ID ';

  sWhere := '';

  if fraEmpresaExc.IsSelected then
    sWhere := sWhere + ' AND EP_IDEMPRESA = ' + SqlValue(fraEmpresaExc.ID);

  if chkSoloActivasExc.Checked then
    sWhere := sWhere + ' AND EP_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManOEP_EXCEPCIONPREVISION.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresaExc.Clear;
  chkSoloActivasExc.Checked := True;

  inherited;
end;

procedure TfrmManOEP_EXCEPCIONPREVISION.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'CONT.OEP_EXCEPCIONPREVISION';
  FieldBaja     := 'EP_FECHABAJA';
  ShowActived   := False;

  fraEmpresaExc.ShowBajas   := True;
  fraEP_IDEMPRESA.ShowBajas := True;
end;

procedure TfrmManOEP_EXCEPCIONPREVISION.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('EP_MONTORESERVA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('EP_MONTORESERVA')).Currency := True;

  if sdqConsulta.FieldByName('EP_PORCSUJPREV') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('EP_PORCSUJPREV')).DisplayFormat := '% 0.00';
end;

procedure TfrmManOEP_EXCEPCIONPREVISION.chkEP_MONTORESERVAClick(Sender: TObject);
begin
  VCLExtra.LockControl(edEP_MONTORESERVA, not chkEP_MONTORESERVA.Checked);
  edEP_MONTORESERVA.Clear;
end;

procedure TfrmManOEP_EXCEPCIONPREVISION.chkEP_PORCSUJPREVClick(Sender: TObject);
begin
  VCLExtra.LockControl(edEP_PORCSUJPREV, not chkEP_PORCSUJPREV.Checked);
  edEP_PORCSUJPREV.Clear;
end;

procedure TfrmManOEP_EXCEPCIONPREVISION.fpAbmEnter(Sender: TObject);
var
  bDeshabilitar: Boolean;
begin
  bDeshabilitar := (ModoABM = maModificacion);

  VCLExtra.LockControl(edEP_MONTORESERVA, not chkEP_MONTORESERVA.Checked or bDeshabilitar);
  VCLExtra.LockControl(edEP_PORCSUJPREV, not chkEP_PORCSUJPREV.Checked or bDeshabilitar);
  VCLExtra.LockControls([fraEP_IDEMPRESA, edEP_FECHADESDE, chkEP_MONTORESERVA, chkEP_PORCSUJPREV], bDeshabilitar);

  if bDeshabilitar then
    edEP_FECHAHASTA.SetFocus
  else
    fraEP_IDEMPRESA.mskCUIT.SetFocus;
end;

procedure TfrmManOEP_EXCEPCIONPREVISION.tbModificarClick(Sender: TObject);
begin
  if not IsBaja() then
    inherited;
end;

end.

