unit unInvInstituciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, Mask, PatternEdit;

type
  TfrmInvInstituciones = class(TfrmCustomGridABM)
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    lbBanco: TLabel;
    fraBancoAltaModif: TfraStaticCodigoDescripcion;
    Label1: TLabel;
    edNombreAltaModif: TEdit;
    chkColocadorAltaModif: TCheckBox;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbCuentas: TToolButton;
    Label2: TLabel;
    edSWIFTAltaModif: TPatternEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fraBancoAltaModifChange(Sender: TObject);
    procedure tbCuentasClick(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmInvInstituciones: TfrmInvInstituciones;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, unArt,
  VCLExtra, CustomDlgs, unInvCuentas;

procedure TfrmInvInstituciones.ClearControls;
begin
  fraBancoAltaModif.Clear;
  edNombreAltaModif.Clear;
  edSWIFTAltaModif.Clear;
  chkColocadorAltaModif.Checked := False;
end;

function TfrmInvInstituciones.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maAlta then
        begin
          PrimaryKey.Add('NS_ID',          GetSecNextVal('INV.SEQ_NNS_ID'));
          Fields.Add('NS_FECHAALTA',       exDateTime);
          Fields.Add('NS_USUALTA',         Sesion.UserID);

          Fields.Add('NS_NOMBRE',          Trim(edNombreAltaModif.Text));
          Fields.Add('NS_COLOCADOR',       String(Iif(chkColocadorAltaModif.Checked, 'S', 'N')));
          Fields.Add('NS_IDBANCO',         fraBancoAltaModif.Value, True);
          Fields.Add('NS_CODIGOSWIFT',     Trim(edSWIFTAltaModif.Text));

          SqlType := stInsert;
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('NS_ID',          sdqConsulta.FieldByName('CODIGO').AsInteger);
          Fields.Add('NS_FECHABAJA',       exDateTime);
          Fields.Add('NS_USUBAJA',         Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmInvInstituciones.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(IsEmptyString(edNombreAltaModif.Text), edNombreAltaModif, 'Debe indicar el nombre.');
  Verificar(not IsEmptyString(edSWIFTAltaModif.Text) and (Length(edSWIFTAltaModif.Text) < 8), edSWIFTAltaModif, 'El código SWIFT debe tener al menos 8 caracteres.');

  if fraBancoAltaModif.IsSelected then
    begin
      sSql := 'SELECT 1 ' +
                'FROM NNS_INSTITUCION ' +
               'WHERE NS_FECHABAJA IS NULL ' +
                 'AND NS_IDBANCO = :IdBanco';

      Verificar(ExisteSqlEx(sSql, [fraBancoAltaModif.Value]), fraBancoAltaModif, 'El banco seleccionado ya existe como institución.');
    end;

  Result := True;
end;

procedure TfrmInvInstituciones.FormCreate(Sender: TObject);
begin
  inherited;

  with fraBancoAltaModif do
    begin
      ShowBajas   := False;
      TableName   := 'ZBA_BANCO';
      FieldID     := 'BA_ID';
      FieldCodigo := 'BA_CODIGO';
      FieldDesc   := 'BA_NOMBRE';
      FieldBaja   := 'BA_FECHABAJA';
      OnChange    := fraBancoAltaModifChange;
    end;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NNS_INSTITUCION';
end;

procedure TfrmInvInstituciones.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmInvInstituciones.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'La institución ya ha sido dada de baja.');

  inherited;
end;

procedure TfrmInvInstituciones.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT NS_ID CODIGO, NS_NOMBRE NOMBRE, ' +
                 'DECODE(NS_IDBANCO, NULL, ''N'', ''S'') ES_BANCO, NS_FECHABAJA FECHA_BAJA, ' +
                 'NS_COLOCADOR ES_COLOCADOR, NS_CODIGOSWIFT CODIGOSWIFT ' +
            'FROM NNS_INSTITUCION ' +
           'WHERE 1 = 1';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND NS_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmInvInstituciones.fraBancoAltaModifChange(Sender: TObject);
begin
  if fraBancoAltaModif.IsSelected then
    edNombreAltaModif.Text := fraBancoAltaModif.Descripcion;
end;

procedure TfrmInvInstituciones.tbCuentasClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'La grilla está vacía.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'La institución se encuentra dada de baja.');

  with TfrmInvCuentas.Create(nil) do
    try
      IdInstitucion := Self.sdqConsulta.FieldByName('CODIGO').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

end.

