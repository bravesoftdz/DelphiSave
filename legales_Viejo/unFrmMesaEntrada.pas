unit unFrmMesaEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unfraUsuarios, unArtFrame,
  unFraCodigoDescripcion, PatternEdit, Mask, ToolEdit, DateComboBox, unSesion, SqlFuncs, unDmPrincipal,
  unArtDBAwareFrame;

type
  TFrmMesaEntrada = class(TfrmCustomGridABM)
    lblEnRelacionA: TLabel;
    lblUsuarioRecepcion: TLabel;
    fraUsuarioRecepcion: TfraUsuario;
    fraUsuarioDestinatario: TfraUsuario;
    lblUsuarioDestinatario: TLabel;
    mDescripcion: TMemo;
    lblDescripcion: TLabel;
    lblObservaciones: TLabel;
    mObservaciones: TMemo;
    lblMaterial: TLabel;
    fraMaterial: TfraCodigoDescripcion;
    cmbEnRelacionA: TComboBox;
    pnRelacion: TPanel;
    lblRelacion: TLabel;
    fraRelacion: TfraCodigoDescripcion;
    gbFiltros: TGroupBox;
    Label5: TLabel;
    FraMaterialFiltro: TfraCodigoDescripcion;
    edFechaRecepcionMGES: TDateComboBox;
    lblFechaMGES: TLabel;
    lblFechaPublicacion: TLabel;
    edNroMGES: TPatternEdit;
    lblNroMGES: TLabel;
    lblDescripcionMaterial: TLabel;
    mDescripcionFiltro: TMemo;
    lblFechaRecepcionMGES: TLabel;
    edFechaMGESFiltro: TDateComboBox;
    lblNroRecepcionMGES: TLabel;
    edNroMGESFiltro: TPatternEdit;
    lblFechaRecepcion: TLabel;
    edFechaRecepcionFiltro: TDateComboBox;
    lblUsuarioRecepcionInicial: TLabel;
    fraUsuarioRecepcionFiltro: TfraUsuario;
    Label6: TLabel;
    fraUsuarioDestinatarioFiltro: TfraUsuario;
    Label7: TLabel;
    cmbEnRelacionAFiltro: TComboBox;
    lblElementoRelacionado: TLabel;
    fraRelecionadoFiltro: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    procedure ClearControls; override;
  public
  end;

var
  FrmMesaEntrada: TFrmMesaEntrada;

implementation

uses
	unPrincipal;

{$R *.dfm}

procedure TFrmMesaEntrada.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ME_FECHABAJA';
  Sql.TableName := 'LEGALES.LME_MESAENTRADA';
  CheckPK := True;
end;

procedure TFrmMesaEntrada.ClearControls;
begin
  fraMaterial.Codigo := '';
  mDescripcion.Text := '';
  edFechaRecepcionMGES.Date := 0;
  edNroMGES.Text := '';
  fraUsuarioRecepcion.Limpiar;
  fraUsuarioDestinatario.Limpiar;
  mObservaciones.Text := '';
  cmbEnRelacionA.ItemIndex := -1;
  pnRelacion.Visible := false;
  fraRelacion.Codigo := '';
end;

function TFrmMesaEntrada.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('me_id', 	 sdqConsulta.FieldByName('me_id').AsInteger);
    Sql.Fields.Add('ME_USUBAJA', 	 Sesion.LoginName);
    Sql.Fields.Add('ME_FECHABAJA', exDateTime);
    Sql.SqlType := stUpdate;
  end
  else
  begin
(*
    Sql.Fields.Add('BO_NOMBRE', edBO_NOMBRE.Text);
    Sql.Fields.Add('BO_DIRECCION', edBO_DIRECCION.Text);
    Sql.Fields.Add('BO_TELEFONO', edBO_TELEFONO.Text);
    Sql.Fields.Add('BO_PROVINCIART', chkBO_PROVINCIART.Checked);
    Sql.Fields.Add('BO_DIRELECTRONICA', edBO_DIRELECTRONICA.Text);
*)
		if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('ME_ID', 	 GetSecNextVal('LEGALES.SEQ_LME_ID'));
      Sql.Fields.Add('BO_USUALTA', 	 frmPrincipal.dbLogin.UserId);
      Sql.Fields.Add('BO_FECHAALTA', exDateTime);
    end
    else
    begin
      Sql.Fields.Add('BO_USUMODIF', 	frmPrincipal.dbLogin.UserId);
      Sql.Fields.Add('BO_FECHAMODIF', exDateTime);
      Sql.Fields.Add('BO_USUBAJA', 		exNull);
      Sql.Fields.Add('BO_FECHABAJA', 	exNull);
    end;
  end;

  Result := inherited DoABM;
end;

end.
