unit unCtasBancEmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, StdCtrls;

type
  TfrmCtasBancEmp = class(TfrmCustomConsulta)
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    rgCuenta: TRadioGroup;
    ShortCutControl1: TShortCutControl;
    rgBajas: TRadioGroup;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCtasBancEmp: TfrmCtasBancEmp;

implementation

uses unComunes, unManCCP_CUENTAPAGO, ansisql;

{$R *.dfm}


procedure TfrmCtasBancEmp.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin
  inherited;
  
  ssql := ' SELECT co_contrato, em_cuit, em_nombre, cp_fechabaja, cp_fechaaltamcarga, em_id, ' +
                 ' art.varios.get_DatosCta (cp_id) cuenta, cp_id ' +
            ' FROM afi.aem_empresa, ccp_cuentapago, afi.aco_contrato ' +
           ' WHERE cp_idacreedor(+) = em_id ' +
             {' AND cp_fechabaja(+) IS NULL ' + }
             ' AND cp_tipoacreedor(+) = ''EM'' ' +
             ' AND co_idempresa = em_id ' +
             ' AND co_fechabaja IS NULL ';

  if not fraEmpresa.IsEmpty then
    ssql := ssql + ' AND em_id = ' + sqlint(fraEmpresa.ID);

  case rgBajas.ItemIndex of
    0: ssql := ssql + ' AND cp_fechabaja IS NOT NULL ';
    1: ssql := ssql + ' AND cp_fechabaja IS NULL ';
  end;

  case rgCuenta.ItemIndex of
    0: ssql := ssql + ' AND art.varios.get_DatosCta (cp_id) IS NOT NULL ';
    1: ssql := ssql + ' AND art.varios.get_DatosCta (cp_id) IS NULL ';
  end;

  sdqConsulta.SQL.Text := ssql;
  sdqConsulta.Open;

end;

procedure TfrmCtasBancEmp.tbModificarClick(Sender: TObject);
var idemp: integer;
begin

  idemp := sdqConsulta.fieldbyname('em_id').AsInteger;
  with TfrmManCCP_CUENTAPAGO.Create(Self) do
    try
      Execute('EM', idemp, '');
    finally
      Free;
    end;
  tbRefrescarClick(nil);

end;

procedure TfrmCtasBancEmp.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresa.Clear;
  rgCuenta.ItemIndex := 2;
  rgBajas.ItemIndex := 2;
end;

procedure TfrmCtasBancEmp.GridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if sdqConsulta.FieldByName('cp_fechabaja').AsString <> '' then
    AFont.Color := clRed;
end;

end.
