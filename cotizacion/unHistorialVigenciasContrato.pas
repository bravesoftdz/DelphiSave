unit unHistorialVigenciasContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls;

type
  TfrmHistorialVigenciasContrato = class(TfrmCustomConsulta)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbCuit: TLabel;
    lbRazonSocial: TLabel;
    lbDomicilio: TLabel;
    lbProvincia: TLabel;
    lbCodigoPostal: TLabel;
    lbCiiu1: TLabel;
    lbCiiu2: TLabel;
    lbCiiu3: TLabel;
    procedure FSFormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FIdEmpresa: Integer;
  protected
    procedure RefreshData; override;
  public
    procedure Mostrar(const aCuit: String);
  end;

var
  frmHistorialVigenciasContrato: TfrmHistorialVigenciasContrato;

implementation

uses
  unDmPrincipal, AnsiSql;

{$R *.dfm}

procedure TfrmHistorialVigenciasContrato.Mostrar(const aCuit: String);
var
  sSql: String;
begin
  sSql :=
    'SELECT em_ciiu1 || '' - '' || cac1.ac_descripcion ciiu1, em_ciiu2 || '' - '' || cac2.ac_descripcion ciiu2,' +
          ' em_ciiu3 || '' - '' || cac3.ac_descripcion ciiu3, em_codigopostal, em_domicilio, em_id, em_nombre,' +
          ' pv_descripcion' +
     ' FROM srt.sem_empresas, cpv_provincias, cac_actividad cac1, cac_actividad cac2, cac_actividad cac3' +
    ' WHERE em_provincia = pv_codigo(+)' +
      ' AND em_ciiu1 = cac1.ac_codigo(+)' +
      ' AND em_ciiu2 = cac2.ac_codigo(+)' +
      ' AND em_ciiu3 = cac3.ac_codigo(+)' +
      ' AND em_cuit = :cuit';
  with GetQueryEx(sSql, [aCuit]) do
  try
    FIdEmpresa             := FieldByName('em_id').AsInteger;
    lbCuit.Caption         := aCuit;
    lbRazonSocial.Caption  := FieldByName('em_nombre').AsString;
    lbDomicilio.Caption    := FieldByName('em_domicilio').AsString;
    lbProvincia.Caption    := FieldByName('pv_descripcion').AsString;
    lbCodigoPostal.Caption := FieldByName('em_codigopostal').AsString;
    lbCiiu1.Caption        := FieldByName('ciiu1').AsString;
    lbCiiu2.Caption        := FieldByName('ciiu2').AsString;
    lbCiiu3.Caption        := FieldByName('ciiu3').AsString;
  finally
    Free;
  end;

  RefreshData;
  ShowModal;
end;

procedure TfrmHistorialVigenciasContrato.RefreshData;
begin
  sdqConsulta.Sql.Text :=
    'SELECT ac_codigo || '' - '' || ac_descripcion ciiu, hv_art, hv_contrato, hv_ffe, hv_nivel, hv_porcentajevariable,' +
          ' hv_sumafija, hv_vigenciadesde, hv_vigenciahasta, ctb1.tb_descripcion operaciondesde,' +
          ' ctb2.tb_descripcion operacionhasta' +
     ' FROM srt.shv_historialvigencias, ctb_tablas ctb1, ctb_tablas ctb2, cac_actividad' +
    ' WHERE hv_idoperaciondesde = ctb1.tb_id(+)' +
      ' AND hv_idoperacionhasta = ctb2.tb_id(+)' +
      ' AND hv_ciiu = ac_codigo' +
      ' AND hv_idempresa = ' + SqlValue(FIdEmpresa) +
 ' ORDER BY hv_vigenciadesde';

  inherited;
end;

procedure TfrmHistorialVigenciasContrato.FSFormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_ESCAPE then
    Close;
end;

end.
