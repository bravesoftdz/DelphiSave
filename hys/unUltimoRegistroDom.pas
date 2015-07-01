unit unUltimoRegistroDom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, unArt;

type
  TfrmUltimoRegistroDom = class(TfrmCustomConsulta)
    Panel1: TPanel;
    btnCancelar: TButton;
    btnAceptar: TButton;
    btnNoExiste: TButton;
    lbEmpresa: TLabel;
    lbcalle: TLabel;
    edUR_CALLE: TEdit;
    pnlFiltroEmpresaCP: TPanel;
    fraCO_CONTRATO: TfraEmpresa;
    edUR_CODIGOPOSTAL: TEdit;
    lbCP: TLabel;
    ToolButton1: TToolButton;
    pnlLeyenda: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    chkNoVinc: TCheckBox;
    Label3: TLabel;
    Shape3: TShape;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNoExisteClick(Sender: TObject);
    procedure FSFormKeyPress(Sender: TObject; var Key: Char);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:
        Integer; Column: TColumn; State: TGridDrawState);
    procedure tbLimpiarClick(Sender: TObject);
  private
    FSQL: string;
    procedure SetTitulo(const Value: string);
    function GetIDUltimoDom: Integer;
    function GetSucursal: Integer;
    function GetExistenRegistros: Boolean;
  public
    property Titulo: string write SetTitulo;
    property IdUltimoDom: Integer read GetIDUltimoDom;
    procedure RefreshData; override;
    property Sucursal: Integer read GetSucursal;
    property ExistenRegistros: Boolean read GetExistenRegistros;
  end;

var
  frmUltimoRegistroDom: TfrmUltimoRegistroDom;

implementation

uses
  unFiltros, General, AnsiSql, undmPrincipal;

{$R *.dfm}


procedure TfrmUltimoRegistroDom.FormCreate(Sender: TObject);
begin
  fraCO_CONTRATO.ShowBajas := True;
  FSQL := 'SELECT  iur.*, em_nombre,'
        + '        aes.es_iur_id, '
        + '        (SELECT  cpv.pv_descripcion '
        + '           FROM  cpv_provincias cpv '
        + '          WHERE  cpv.pv_codigodgi = iur.ur_provincia '
        + '             AND ROWNUM = 1) '
        + '           AS pv_correo '          //  sub select cod prov 01 (bsas/gran bsas vs bsas)
        + '  FROM  emi.iur_ultimoregistrodom iur, '
        + '        afi.aem_empresa aem, '
        + '        aes_establecimiento aes, '
        + '        afi.aco_contrato aco '
        + ' WHERE  iur.ur_cuit = aem.em_cuit '
        + '    AND aco.co_idempresa = aem.em_id '
        + '    AND aco.co_contrato = art.get_vultcontrato (em_cuit) '
        + '    AND ur_id = es_iur_id(+) '
        ;

  inherited;
end;

procedure TfrmUltimoRegistroDom.btnAceptarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('es_iur_id').IsNull then
    ModalResult := mrOk
  else
    ShowMessage('El establecimineto ya ha sido asignado.');
end;

procedure TfrmUltimoRegistroDom.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmUltimoRegistroDom.btnNoExisteClick(Sender: TObject);
begin
  ModalResult := mrNo;
end;

procedure TfrmUltimoRegistroDom.FSFormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Self.ModalResult := mrCancel;
end;

function TfrmUltimoRegistroDom.GetIDUltimoDom: Integer;
begin
  Result := sdqConsulta.FieldByName('ur_id').AsInteger;
end;

procedure TfrmUltimoRegistroDom.GridDrawColumnCell(Sender: TObject; const Rect:
    TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if Column.Grid.DataSource.DataSet.FieldByName('ur_codigopostal').AsVariant = edUR_CODIGOPOSTAL.Text then
    Grid.Canvas.Brush.Color := clSkyBlue;

  if Column.Grid.DataSource.DataSet.FieldByName('es_iur_id').IsNull then
    Grid.Canvas.Font.Color := clPurple;

  Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmUltimoRegistroDom.SetTitulo(const Value: string);
begin
  Self.Caption := Value;
end;

procedure TfrmUltimoRegistroDom.RefreshData;
begin
  sdqConsulta.SQL.Text :=
      FSQL
      + DoFiltro(pnlFiltroEmpresaCP)
      + IIF(Length(Trim(edUR_CALLE.Text)) > 0,
          ' AND UPPER(iur.ur_calle) LIKE ' + SQLValue('%' + UpperCase(edUR_CALLE.Text) + '%')
          , '')
      + iif(chkNoVinc.Checked, ' AND ES_IUR_ID IS NULL', ' AND ES_IUR_ID IS NOT NULL')
      + SortDialog.OrderBy;

  inherited;
end;

function TfrmUltimoRegistroDom.GetSucursal: Integer;
begin
  Result := sdqConsulta.FieldByName('ur_sucursal').AsInteger;
end;

procedure TfrmUltimoRegistroDom.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraCO_CONTRATO.Clear;
  edUR_CALLE.Clear;
  edUR_CODIGOPOSTAL.Clear;
  chkNoVinc.Checked := True;
end;


function TfrmUltimoRegistroDom.GetExistenRegistros: Boolean;
begin
  RefreshData;
  Result := not sdqConsulta.IsEmpty;
end;

end.
