unit unManZSB_SUCURSALBANCO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, RxPlacemnt, unFraCodigoDescripcion;

type
  TfrmManZSB_SUCURSALBANCO = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    gbBanco: TGroupBox;
    fraBanco: TfraStaticCodigoDescripcion;
    chkNoMostrarBajas: TCheckBox;
    Label1: TLabel;
    edCodigoAltaModif: TEdit;
    Label2: TLabel;
    edNombreAltaModif: TEdit;
    fraBancoAltaModif: TfraStaticCodigoDescripcion;
    Label3: TLabel;
    Label4: TLabel;
    edDomicilioAltaModif: TEdit;
    fraProvAltaModif: TfraCodigoDescripcion;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  public
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManZSB_SUCURSALBANCO: TfrmManZSB_SUCURSALBANCO;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, CustomDlgs, unDmPrincipal, StrFuncs;

{$R *.dfm}

procedure TfrmManZSB_SUCURSALBANCO.ClearControls;
begin
  fraBancoAltaModif.Clear;
  edCodigoAltaModif.Clear;
  edNombreAltaModif.Clear;
  edDomicilioAltaModif.Clear;
  fraProvAltaModif.Clear;

  VCLExtra.LockControls([fraBancoAltaModif, edCodigoAltaModif, edNombreAltaModif], False);
end;

function TfrmManZSB_SUCURSALBANCO.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maBaja then
        begin
           PrimaryKey.Add('SB_ID',            sdqConsulta.FieldByName('ID').AsInteger);
           Fields.Add('SB_FECHABAJA',         exDateTime);
           Fields.Add('SB_USUBAJA',           Sesion.UserID);

           SqlType := stUpdate;
        end
      else
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.AddInteger('SB_ID',  GetSecNextVal('COB.SEQ_ZSB_ID'));
              Fields.Add('SB_FECHAALTA',      exDateTime);
              Fields.Add('SB_USUALTA',        Sesion.UserID);
              Fields.Add('SB_IDBANCO',        fraBancoAltaModif.Value);
              Fields.Add('SB_CODIGO',         Trim(edCodigoAltaModif.Text));
              Fields.Add('SB_NOMBRE',         Trim(edNombreAltaModif.Text));

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('SB_ID',         sdqConsulta.FieldByName('ID').AsInteger);
              Fields.Add('SB_FECHAMODIF',     exDateTime);
              Fields.Add('SB_USUMODIF',       Sesion.UserID);

              SqlType := stUpdate;
            end;

          Fields.Add('SB_DOMICILIO',          Trim(edDomicilioAltaModif.Text));
          Fields.Add('SB_PROVINCIA',          fraProvAltaModif.Value);
        end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmManZSB_SUCURSALBANCO.RefreshData;
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT BA_NOMBRE BANCO, SB_ID ID, SB_CODIGO CODIGO, SB_NOMBRE NOMBRE, TRUNC(SB_FECHABAJA) FECHABAJA, ' +
                 'SB_DOMICILIO DOMICILIO, SB_PROVINCIA CODPROV, PV_DESCRIPCION DESCRPROV, BA_ID IDBANCO ' +
            'FROM ZSB_SUCURSALBANCO, ZBA_BANCO, CPV_PROVINCIAS ' +
           'WHERE BA_ID = SB_IDBANCO ' +
             'AND SB_PROVINCIA = PV_CODIGO(+)';

  if fraBanco.IsSelected Then
    sSql := sSql + ' AND BA_ID = ' + SqlValue(fraBanco.Value);

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND SB_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

function TfrmManZSB_SUCURSALBANCO.Validar: Boolean;
begin
  if ModoABM = maAlta  then
    begin
      Verificar(fraBancoAltaModif.IsEmpty, fraBancoAltaModif, 'Debe indicar el banco.');
      Verificar(IsEmptyString(edCodigoAltaModif.Text), edCodigoAltaModif, 'Debe indicar el código de la sucursal.');
      Verificar(IsEmptyString(edNombreAltaModif.Text), edNombreAltaModif, 'Debe indicar el nombre de la sucursal.');
    end;

  Result := True;
end;

procedure TfrmManZSB_SUCURSALBANCO.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived   := True;
  FieldBaja     := 'FECHABAJA';
  Sql.TableName := 'ZSB_SUCURSALBANCO';

  with fraBanco do
    begin
      TableName      := 'ZBA_BANCO';
      FieldID        := 'BA_ID';
      FieldCodigo    := 'BA_CODIGO';
      FieldDesc      := 'BA_NOMBRE';
      FieldBaja      := 'BA_FECHABAJA';
      ShowBajas      := True;
      ExtraCondition := ' AND BA_TIENESUCURSALES = ''S''';
    end;

  with fraBancoAltaModif do
    begin
      TableName      := 'ZBA_BANCO';
      FieldID        := 'BA_ID';
      FieldCodigo    := 'BA_CODIGO';
      FieldDesc      := 'BA_NOMBRE';
      FieldBaja      := 'BA_FECHABAJA';
      ShowBajas      := False;
      ExtraCondition := ' AND BA_TIENESUCURSALES = ''S''';
    end;

  with fraProvAltaModif do
    begin
      TableName   := 'CPV_PROVINCIAS';
      FieldID     := 'PV_CODIGO';
      FieldCodigo := 'PV_CODIGO';
      FieldDesc   := 'PV_DESCRIPCION';
      FieldBaja   := 'PV_FECHABAJA';
      ShowBajas   := False;
    end;
end;

procedure TfrmManZSB_SUCURSALBANCO.LoadControls;
begin
  with sdqConsulta do
    begin
      fraBancoAltaModif.Value   := FieldByName('IDBANCO').AsInteger;
      edCodigoAltaModif.Text    := FieldByName('CODIGO').AsString;
      edNombreAltaModif.Text    := FieldByName('NOMBRE').AsString;
      edDomicilioAltaModif.Text := FieldByName('DOMICILIO').AsString;
      fraProvAltaModif.Codigo   := FieldByName('CODPROV').AsString;
    end;

  VCLExtra.LockControls([fraBancoAltaModif, edCodigoAltaModif, edNombreAltaModif], True);
end;

procedure TfrmManZSB_SUCURSALBANCO.tbLimpiarClick(Sender: TObject);
begin
  fraBanco.Clear;
  chkNoMostrarBajas.Checked := True;

  inherited;
end;

end.

