unit unAnexoRes365;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, Buttons, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, DB, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, JvgGroupBox, ExtCtrls;

type
  TfrmAnexoRes365 = class(TfrmCustomForm)
    gbDatosCliente: TJvgGroupBox;
    grid: TArtDBGrid;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    pnlTop: TPanel;
    lbMensaje: TLabel;
    fraEmpresa: TfraEmpresa;
    btnImprimir: TBitBtn;
    btnImpresionMasiva: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CambiaEmpresa(Sender: TObject);
    procedure gridMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnImpresionMasivaClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  public
  end;

var
  frmAnexoRes365: TfrmAnexoRes365;

implementation

uses
  CustomDlgs, unDmPrincipal, unSesion, AnsiSql, unRptAnexoRes365, unComunes, unArt, VCLExtra, unGrids, Math;

{$R *.dfm}

procedure TfrmAnexoRes365.CambiaEmpresa(Sender: TObject);
var
  sSql: string;
begin
  sSql :=
    'SELECT   an_email, an_fechaimpresion, an_id, DECODE(en_endoso, NULL, NULL, TO_CHAR(en_endoso) || ''/'' || TO_CHAR(en_movimiento)) endoso, oa_detalle origen, se_nombre' +
       ' FROM afi.aan_anexo365, use_usuarios, aen_endoso, afi.aoa_origenanexo365' +
      ' WHERE an_usuimpresion = se_usuario' +
        ' AND an_idendosomovimiento = en_id(+)' +
        ' AND an_idorigenanexo365 = oa_id' +
        ' AND an_contrato = :contrato' +
   ' ORDER BY an_fechaimpresion DESC';
  OpenQueryEx(sdqConsulta, [fraEmpresa.Contrato], sSql);
end;


procedure TfrmAnexoRes365.btnImprimirClick(Sender: TObject);
const
  CONTRATO_LIMITE = 124384;
var
  sSql: String;
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa.mskCUIT, 'Debe seleccionar una empresa.');
  Verificar(fraEmpresa.IsBaja, fraEmpresa.edContrato, 'Contrato no activo.');

  sSql :=
    'SELECT 1' +
     ' FROM cca_carta, aen_endoso' +
    ' WHERE ca_idendoso = en_id' +
      ' AND ca_fechabaja IS NULL' +
      ' AND en_contrato = ' + SqlValue(fraEmpresa.Contrato) +
      ' AND ca_idtextocarta = ' + SqlValue(GetIdTextoAnexoRes365) +
      ' AND ca_recepcionok = ''S''';
  Verificar((fraEmpresa.Contrato > CONTRATO_LIMITE) and (ExisteSql(sSql)), fraEmpresa.edContrato, 'El anexo fue enviado con el contrato y se encuentra firmado.');

  sSql :=
    'SELECT 1' +
     ' FROM cca_carta, aen_endoso' +
    ' WHERE ca_idendoso = en_id' +
      ' AND ca_fechabaja IS NULL' +
      ' AND en_contrato = ' + SqlValue(fraEmpresa.Contrato) +
      ' AND ca_idtextocarta = ' + SqlValue(GetIdTextoAnexoRes365) +
      ' AND ca_recepcionok = NULL';
  Verificar((fraEmpresa.Contrato > CONTRATO_LIMITE) and (ExisteSql(sSql)), fraEmpresa.edContrato, 'El anexo fue enviado con el contrato y estamos a la espera del mismo.');

  Application.CreateForm(TqrAnexoRes365, qrAnexoRes365);
  try
    qrAnexoRes365.Preparar(fraEmpresa.Contrato);
  finally
    FreeAndNil(qrAnexoRes365);
  end;
end;

procedure TfrmAnexoRes365.FormCreate(Sender: TObject);
begin
  inherited;
  btnImpresionMasiva.Visible := (Sesion.Sector = 'COMPUTOS');

  fraEmpresa.ShowBajas := True;
  fraEmpresa.OnChange := CambiaEmpresa;

  if Sesion.UserID = 'EVILA' then
    grid.Hint := 'La tabla se llama edu.contrato_rd.';
end;

procedure TfrmAnexoRes365.gridMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  CambiaEmpresa(nil);
end;

procedure TfrmAnexoRes365.btnImpresionMasivaClick(Sender: TObject);
begin
  with GetQuery('SELECT contrato FROM edu.contrato_rd') do
  try
    while not Eof do
    begin
      Application.CreateForm(TqrAnexoRes365, qrAnexoRes365);
      try
        qrAnexoRes365.Preparar(FieldByName('Contrato').AsInteger, True);
      finally
        FreeAndNil(qrAnexoRes365);
      end;
      Next;
    end;

    MsgBox('La impresión finalizó exitosamente.');
  finally
    Free;
  end;
end;

procedure TfrmAnexoRes365.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(grid);
  pnlTop.Width := Min(Max(GetColumnWidths(grid, True), 600), Screen.Width);
end;

end.
