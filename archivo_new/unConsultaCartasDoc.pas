unit unConsultaCartasDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, PatternEdit, StdCtrls, Mask, ToolEdit, DateComboBox;

type
  TfrmConsultaCartasDoc = class(TfrmCustomConsulta)
    gbFImpresion: TGroupBox;
    Label1: TLabel;
    edFImpresionDesde: TDateComboBox;
    edFImpresionHasta: TDateComboBox;
    gbCartaDoc: TGroupBox;
    edCartaDoc: TPatternEdit;
    ShortCutControl1: TShortCutControl;
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
  public
    class procedure DoMostrarCartaDocumento(NroCartaDoc: String);
  protected
    procedure RefreshData; override;
  end;

var
  frmConsultaCartasDoc: TfrmConsultaCartasDoc;

implementation

{$R *.dfm}

uses
  AnsiSql, StrFuncs, General, unArt;

procedure TfrmConsultaCartasDoc.RefreshData;
var
  sSqlWhere, sSql: String;
begin
  sSql := 'SELECT CA_NROCARTADOC NROCARTADOC, CA_AREA AREA, CA_CUIT CUIT, CA_RAZON_SOCIAL RSOCIAL, ' +
                 'CA_CONTRATO CONTRATO, CA_CUIL CUIL, CA_NOMBRE_TRABAJADOR TRABAJADOR,  ' +
                 'CA_SINIESTRO SINIESTRO, TRUNC(CA_FECHAEMISION) FECHAIMPRESION, ' +
                 'CA_FECHABAJA FECHABAJA ' +
            'FROM ARCHIVO.VCA_CARTA_ALL' + GetDBLink() + ' ' +
           'WHERE 1 = 1 ';

  sSqlWhere := SqlBetweenDateTime(' AND CA_FECHAEMISION ', edFImpresionDesde.Date, edFImpresionHasta.Date);

  if not IsEmptyString(edCartaDoc.Text) then
    sSqlWhere := sSqlWhere + ' AND CA_NROCARTADOC = ' + SqlValue(edCartaDoc.Text);

  sdqConsulta.Sql.Text := sSql + sSqlWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmConsultaCartasDoc.tbLimpiarClick(Sender: TObject);
begin
  edCartaDoc.Clear;
  edFImpresionDesde.Clear;
  edFImpresionHasta.Clear;

  inherited;
end;

procedure TfrmConsultaCartasDoc.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqConsulta.FieldByName('FECHABAJA').IsNull then
    AFont.Color := clRed
end;                                         

class procedure TfrmConsultaCartasDoc.DoMostrarCartaDocumento(NroCartaDoc: String);
begin
  Abrir(TfrmConsultaCartasDoc, frmConsultaCartasDoc, tmvMDIChild, nil);

  with frmConsultaCartasDoc do
    begin
      edCartaDoc.Text := NroCartaDoc;

      RefreshData;
    end;
end;

end.
