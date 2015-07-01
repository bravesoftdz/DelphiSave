unit unTableroControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, StdCtrls, Mask, ToolEdit, DateComboBox,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, customdlgs,
  unListLiqDocUsuario, RxToolEdit, RxPlacemnt;

type
  TfrmTableroControl = class(TfrmCustomConsulta)
    gbUsuario: TGroupBox;
    fraUsuarios: TfraUsuarios;
    gbFechaAprobado: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edFechaLiqDesde: TDateComboBox;
    edFechaLiqHasta: TDateComboBox;
    sdqConsultaUSUALTA: TStringField;
    sdqConsultaFALTA: TDateTimeField;
    sdqConsultaTOTALLIQUIDACIONES: TFloatField;
    sdqConsultaTOTALLIQANULADAS: TFloatField;
    sdqConsultaTOTALPEDIDOSINFO: TFloatField;
    sdqConsultaTOTALDOCDIGITALIZAR: TFloatField;
    sdqConsultaTOTALCARTASDOC: TFloatField;
    sdqConsultaTOTALACCSEGCASOS: TFloatField;
    sdqConsultaTOTALCASOSCODACC02: TFloatField;
    sdqConsultaTOTALDOCRECPORUSU: TFloatField;
    sdqConsultaTOTALLIQAREVISION: TFloatField;
    sdqConsultaTOTALSINLIQPORUSU: TFloatField;
    ShortCutControl1: TShortCutControl;
    sdqConsultaTOTALDIGCDDIN: TFloatField;
    procedure tbRefrescarClick(Sender: TObject);
    function Validar: boolean;
    procedure tbImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTableroControl: TfrmTableroControl;

implementation

{$R *.dfm}

procedure TfrmTableroControl.tbRefrescarClick(Sender: TObject);
begin
  if Validar then
  begin
    if (not fraUsuarios.IsEmpty) then
    begin
      sdqConsulta.sql.Text := StringReplace(sdqConsulta.sql.Text, '1 = 1', 'USUALTA = :USU', []);
      sdqConsulta.ParamByName('USU').AsString := fraUsuarios.Value;
    end
    else
      sdqConsulta.sql.Text := StringReplace(sdqConsulta.sql.Text, 'USUALTA = :USU', '1 = 1', []);

    sdqConsulta.ParamByName('FDESDE').AsDate := edFechaLiqDesde.Date;
    sdqConsulta.ParamByName('FHASTA').AsDate := edFechaLiqHasta.Date;
    inherited;
  end;

end;


function TfrmTableroControl.Validar: boolean;
begin
  Verificar(edFechaLiqDesde.IsEmpty or edFechaLiqHasta.IsEmpty, gbFechaAprobado, 'Debe seleccionar un rango de fechas');
  Validar := True;
end;

procedure TfrmTableroControl.tbImprimirClick(Sender: TObject);
begin
  with TfrmListLiqDocUsuario.Create(nil) do
  begin
    sdqLiqDoc.SQL.Text := sdqConsulta.SQL.Text;
    Informe_LiqDocUsuario(edFechaLiqDesde.Date, edFechaLiqHasta.Date, fraUsuarios.Value);
  end;

end;

procedure TfrmTableroControl.FormCreate(Sender: TObject);
begin
  inherited;
  fraUsuarios.Sector := 'PRESDIN';

end;

procedure TfrmTableroControl.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraUsuarios.Clear;
  edFechaLiqDesde.Clear;
  edFechaLiqHasta.Clear;
end;

procedure TfrmTableroControl.tbExportarClick(Sender: TObject);
begin
  inherited;
  //
end;

end.
