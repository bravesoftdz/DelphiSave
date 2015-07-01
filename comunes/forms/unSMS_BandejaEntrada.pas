unit unSMS_BandejaEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, Data.DB, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, PatternEdit, IntEdit, RxToolEdit, DateComboBox, Vcl.DBCtrls;

type
  TfrmSMS_BandejaEntrada = class(TfrmCustomConsulta)
    sdqConsultaFECHA_RECEPCION: TStringField;
    sdqConsultaREMITENTE: TStringField;
    sdqConsultaMENSAJE: TStringField;
    sdqConsultaPOSIBLE_SMS_ENVIADO: TStringField;
    sdqConsultaEMISOR: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edFECHAHasta: TDateComboBox;
    edFECHADesde: TDateComboBox;
    sdqConsultaFECHA: TDateTimeField;
    Panel1: TPanel;
    edMensaje: TDBMemo;
    Label4: TLabel;
    edPosibleEnviado: TDBMemo;
    Label5: TLabel;
    ShortCutControlHijo: TShortCutControl;
    edREMITENTE_FULL_LIKE: TPatternEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    FSQL: String;
  public
    procedure RefreshData; override;
  end;

var
  frmSMS_BandejaEntrada: TfrmSMS_BandejaEntrada;

implementation

{$R *.dfm}

uses unFiltros, unDmPrincipal, VCLExtra;

procedure TfrmSMS_BandejaEntrada.FormCreate(Sender: TObject);
begin
  FSQL := sdqConsulta.SQL.Text;
  inherited;
  AutoColWidths := True;
  edFECHADesde.Date := DBDate;
  VCLExtra.LockControls([edMensaje, edPosibleEnviado], True);
end;

procedure TfrmSMS_BandejaEntrada.RefreshData;
begin
  sdqConsulta.SQL.Text := FSql + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmSMS_BandejaEntrada.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  ClearComponentData(pnlFiltros);
end;

end.
