unit unInvMonedas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmInvMonedas = class(TfrmCustomGridABM)
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    edNombreAltaModif: TEdit;
    rgTipoAltaModif: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmInvMonedas: TfrmInvMonedas;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, unArt,
  VCLExtra, CustomDlgs;

procedure TfrmInvMonedas.ClearControls;
begin
  edNombreAltaModif.Clear;
  rgTipoAltaModif.ItemIndex := -1;
end;

function TfrmInvMonedas.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maAlta then
        begin
          PrimaryKey.Add('MO_ID',          GetSecNextVal('INV.SEQ_NMO_ID'));
          Fields.Add('MO_FECHAALTA',       exDateTime);
          Fields.Add('MO_USUALTA',         Sesion.UserID);

          Fields.Add('MO_NOMBRE',          Trim(edNombreAltaModif.Text));
          Fields.Add('MO_TIPO',            String(Iif(rgTipoAltaModif.ItemIndex = 0, 'L', 'E')));

          SqlType := stInsert;
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('MO_ID',          sdqConsulta.FieldByName('CODIGO').AsInteger);
          Fields.Add('MO_FECHABAJA',       exDateTime);
          Fields.Add('MO_USUBAJA',         Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmInvMonedas.Validar: Boolean;
begin
  Verificar(IsEmptyString(edNombreAltaModif.Text), edNombreAltaModif, 'Debe indicar el nombre.');
  Verificar(rgTipoAltaModif.ItemIndex = -1, rgTipoAltaModif, 'Debe indicar el tipo.');

  Result := True;
end;

procedure TfrmInvMonedas.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NMO_MONEDA';
end;

procedure TfrmInvMonedas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmInvMonedas.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'La moneda ya ha sido dada de baja.');

  inherited;
end;

procedure TfrmInvMonedas.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT MO_ID CODIGO, MO_NOMBRE MONEDA, ' +
                 'DECODE(MO_TIPO, ''L'', ''Local'', ''Extranjera'') TIPO, MO_FECHABAJA FECHA_BAJA ' +
            'FROM NMO_MONEDA ' +
           'WHERE 1 = 1';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND MO_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

end.
 