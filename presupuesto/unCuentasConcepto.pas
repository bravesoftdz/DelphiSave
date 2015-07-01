unit unCuentasConcepto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArt, Mask, PatternEdit;

type
  TfrmCuentasConcepto = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edCiaDesde: TPatternEdit;
    edCiaHasta: TPatternEdit;
    edCtaDesde: TPatternEdit;
    edCtaHasta: TPatternEdit;
    edCCDesde: TPatternEdit;
    edCCHasta: TPatternEdit;
    edPciaDesde: TPatternEdit;
    edSubPrestDesde: TPatternEdit;
    edPciaHasta: TPatternEdit;
    edSubPrestHasta: TPatternEdit;
    edPrestDesde: TPatternEdit;
    edPrestHasta: TPatternEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIdConcepto: TTableId;
    procedure SetIdConcepto(const Value: TTableId);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    property IdConcepto: TTableId     read FIdConcepto     write SetIdConcepto;
  end;

var
  frmCuentasConcepto: TfrmCuentasConcepto;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, 
  VCLExtra, CustomDlgs;

procedure TfrmCuentasConcepto.ClearControls;
begin
  edCiaDesde.Clear;
  edCiaHasta.Clear;
  edCtaDesde.Clear;
  edCtaHasta.Clear;
  edCCDesde.Clear;
  edCCHasta.Clear;
  edPciaDesde.Clear;
  edPciaHasta.Clear;
  edPrestDesde.Clear;
  edPrestHasta.Clear;
  edSubPrestDesde.Clear;
  edSubPrestHasta.Clear;
end;

function TfrmCuentasConcepto.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maAlta then
        begin
          PrimaryKey.Add('PE_ID',         GetSecNextVal('SEQ_OPE_ID'));
          Fields.Add('PE_IDCONCEPTO',     FIdConcepto);
          Fields.Add('PE_FECHAALTA',      exDateTime);
          Fields.Add('PE_USUALTA',        Sesion.UserID );

          Fields.Add('PE_CIADESDE',       LPad(edCiaDesde.Text, '0', 2));
          Fields.Add('PE_CIAHASTA',       LPad(edCiaHasta.Text, '0', 2));

          Fields.Add('PE_CTADESDE',       LPad(edCtaDesde.Text, '0', 6));
          Fields.Add('PE_CTAHASTA',       LPad(edCtaHasta.Text, '0', 6));

          Fields.Add('PE_CCDESDE',        LPad(edCCDesde.Text, '0', 3));
          Fields.Add('PE_CCHASTA',        LPad(edCCHasta.Text, '0', 3));

          Fields.Add('PE_PCIADESDE',      LPad(edPciaDesde.Text, '0', 2));
          Fields.Add('PE_PCIAHASTA',      LPad(edPciaHasta.Text, '0', 2));

          Fields.Add('PE_PRESTDESDE',     LPad(edPrestDesde.Text, '0', 4));
          Fields.Add('PE_PRESTHASTA',     LPad(edPrestHasta.Text, '0', 4));

          Fields.Add('PE_SUBPRESTDESDE',  LPad(edSubPrestDesde.Text, '0', 4));
          Fields.Add('PE_SUBPRESTHASTA',  LPad(edSubPrestHasta.Text, '0', 4));

          SqlType := stInsert;
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('PE_ID',         sdqConsulta.FieldByName('PE_ID').AsInteger);
          Fields.Add('PE_FECHABAJA',      exDateTime);
          Fields.Add('PE_USUBAJA',        Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmCuentasConcepto.Validar: Boolean;
begin
  Verificar(IsEmptyString(edCiaDesde.Text), edCiaDesde, 'La compañía desde es obligatoria.');
  Verificar(IsEmptyString(edCiaHasta.Text), edCiaHasta, 'La compañía hasta es obligatoria.');

  Verificar(IsEmptyString(edCtaDesde.Text), edCtaDesde, 'La cuenta desde es obligatoria.');
  Verificar(IsEmptyString(edCtaHasta.Text), edCtaHasta, 'La cuenta hasta es obligatoria.');

  Verificar(IsEmptyString(edCCDesde.Text), edCCDesde, 'El centro de costo desde es obligatorio.');
  Verificar(IsEmptyString(edCCHasta.Text), edCCHasta, 'El centro de costo hasta es obligatorio.');

  Verificar(IsEmptyString(edPciaDesde.Text), edPciaDesde, 'La provincia desde es obligatoria.');
  Verificar(IsEmptyString(edPciaHasta.Text), edPciaHasta, 'La provincia hasta es obligatoria.');

  Verificar(IsEmptyString(edPrestDesde.Text), edPrestDesde, 'La prestación desde es obligatoria.');
  Verificar(IsEmptyString(edPrestHasta.Text), edPrestHasta, 'La prestación hasta es obligatoria.');

  Verificar(IsEmptyString(edSubPrestDesde.Text), edSubPrestDesde, 'La subprestación desde es obligatoria.');
  Verificar(IsEmptyString(edSubPrestHasta.Text), edSubPrestHasta, 'La subprestación hasta es obligatoria.');

  Result := True;
end;

procedure TfrmCuentasConcepto.SetIdConcepto(const Value: TTableId);
var
  sSql: String;
begin
  if FIdConcepto <> Value then
    begin
      FIdConcepto := Value;

      sSql := 'SELECT PC_DESCRIPCION ' +
                'FROM OPC_PRESUPUESTOCONCEPTO ' +
               'WHERE PC_ID = :IdConcepto';
      Caption := 'Administración de Cuentas por Concepto - ' + ValorSqlEx(sSql, [FIdConcepto]);

      tbRefrescarClick(nil);
    end;
end;

procedure TfrmCuentasConcepto.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT PE_ID, PE_CIADESDE, PE_CTADESDE, PE_CCDESDE, PE_PCIADESDE, PE_PRESTDESDE, ' +
                 'PE_SUBPRESTDESDE, PE_CIAHASTA, PE_CTAHASTA, PE_CCHASTA, PE_PCIAHASTA, ' +
                 'PE_PRESTHASTA, PE_SUBPRESTHASTA, TRUNC(PE_FECHABAJA) FECHABAJA ' +
            'FROM CONT.OPE_PRESUPUESTOCONCCUENTA ' +
           'WHERE PE_IDCONCEPTO = :IdConcepto ';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  sdqConsulta.ParamByName('IdConcepto').AsInteger := FIdConcepto;

  inherited;
end;

procedure TfrmCuentasConcepto.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHABAJA';
  Sql.TableName := 'CONT.OPE_PRESUPUESTOCONCCUENTA';
end;

procedure TfrmCuentasConcepto.LoadControls;
begin
  // Compatibilidad con Delphi XE2
end;

end.
