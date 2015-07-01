unit unConsultaSiniestrosHYS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, Mask, ToolEdit, DateComboBox;

type
  TfrmConsultaSiniestros = class(TfrmCustomConsulta)
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    Label3: TLabel;
    edFechaAccDesde: TDateComboBox;
    Label4: TLabel;
    edFechaAccHasta: TDateComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ExportDialogBeforeExport(Sender: TObject);
    procedure PrintDialogShow(Sender: TObject);
    procedure QueryPrintReportEnd(Sender: TObject);
  private
    FSQLBase: String;
    FFijarFechaOperativo: boolean;
    function GetCuit: String;
    procedure SetCuit(const Value: String);
    procedure SetFijarFechaOperativo(const Value: boolean);
    procedure FraEmpresaChange(Sender: TObject);
  protected
    procedure RefreshData; override;
  public
    property Cuit: String read GetCuit write SetCuit;
    property FijarFechaOperativo: boolean read FFijarFechaOperativo write SetFijarFechaOperativo;
  end;

var
  frmConsultaSiniestros: TfrmConsultaSiniestros;

implementation

uses
  unDmPrincipal, CustomDlgs, AnsiSQL, VclExtra;

{$R *.dfm}

{ TfrmConsultaSiniestros }

procedure TfrmConsultaSiniestros.RefreshData;
begin
  Verificar(not fraEmpresa.IsSelected, fraEmpresa, 'Debe seleccionar una empresa.');
  FSQLBase := FSQLBase + ' and ex_cuit = ' + SqlValue(fraEmpresa.CUIT);
  if (edFechaAccDesde.Date > 0) then
    FSQLBase := FSQLBase + ' and ex_fechaaccidente >= ' + SqlValue(edFechaAccDesde.Date);
  if (edFechaAccHasta.Date > 0) then
    FSQLBase := FSQLBase + ' and ex_fechaaccidente <= ' + SqlValue(edFechaAccHasta.Date);
  sdqConsulta.SQL.Text := FSQLBase;
  inherited;
end;

procedure TfrmConsultaSiniestros.FormCreate(Sender: TObject);
begin
  inherited;
  FSQLBase := sdqConsulta.SQL.Text;
  fraEmpresa.ShowBajas := True;
  fraEmpresa.UltContrato := true;
  fraEmpresa.OnChange := fraEmpresaChange;
end;

function TfrmConsultaSiniestros.GetCuit: String;
begin
  result := fraEmpresa.CUIT;
end;

procedure TfrmConsultaSiniestros.SetCuit(const Value: String);
begin
  fraEmpresa.CUIT := Value;
end;

procedure TfrmConsultaSiniestros.SetFijarFechaOperativo(
  const Value: boolean);

begin
  FFijarFechaOperativo := Value;
  FraEmpresaChange(self);
end;

procedure TfrmConsultaSiniestros.FraEmpresaChange(Sender: TObject);
var
  Operativo, TipoEmpresa: String;
begin
  if fraEmpresa.IsSelected then
  begin
    TipoEmpresa := ValorSql(' SELECT art.hys.get_tipo_empresa( '+ SqlValue(fraEmpresa.CUIT)+',0,sysdate) FROM dual ');
    if (TipoEmpresa = 'ET') and FFijarFechaOperativo then
    begin
      LockControls([edFechaAccDesde, edFechaAccHasta], true);
      Operativo := ValorSql('select hys.get_operativovigente_empresa(' + SqlValue(fraEmpresa.CUIT) + ') from dual');
      if Operativo <> '' then
      begin
        edFechaAccDesde.Date := EncodeDate(StrToInt(copy(Operativo, 1, 4)), 1, 1);
        edFechaAccHasta.Date := EncodeDate(StrToInt(copy(Operativo, 1, 4)), 12, 31);
      end;
    end
    else
      LockControls([edFechaAccDesde, edFechaAccHasta], false);
  end
  else
     LockControls([edFechaAccDesde, edFechaAccHasta], false);
end;

procedure TfrmConsultaSiniestros.ExportDialogBeforeExport(Sender: TObject);
begin
  ExportDialog.FieldbyName['NroEstableci'].Save := true;
  inherited;
end;

procedure TfrmConsultaSiniestros.PrintDialogShow(Sender: TObject);
begin
  Grid.ColumnByField['NroEstableci'].Visible := true;
  inherited;
end;

procedure TfrmConsultaSiniestros.QueryPrintReportEnd(Sender: TObject);
begin
  inherited;
  Grid.ColumnByField['NroEstableci'].Visible := false;
end;

end.
