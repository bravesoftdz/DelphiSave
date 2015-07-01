unit unManAEP_EJECUTIVOCPOSTAL;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               CRISTIAN VON WERNICHH
 FECHA DE CREACION:   07-11-2014
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PatternEdit, IntEdit, unArtFrame, unFraDomicilio,
  Mask, unFraDomicilioTrab, unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario,
  RxPlacemnt, unFraCodDesc;

type
  TfrmManAEP_EJECUTIVOCPOSTAL = class(TfrmCustomGridABM)
    fraEjecutivo: TfraCodDesc;
    edCPostal: TIntEdit;
    lbEjecutivo: TLabel;
    Label1: TLabel;
    fraEjecutivoFiltro: TfraCodDesc;
    edCPostalFiltro: TIntEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    function RegistrosEliminarValidos : Boolean;
  protected
    function DoABM: Boolean; override;
    function Validar : Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure PrintResults; override;
  public
  end;

var
  frmManAEP_EJECUTIVOCPOSTAL: TfrmManAEP_EJECUTIVOCPOSTAL;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, Strfuncs;

{$R *.DFM}

procedure TfrmManAEP_EJECUTIVOCPOSTAL.ClearControls;
begin

end;

function TfrmManAEP_EJECUTIVOCPOSTAL.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('ep_id',    sdqConsulta.FieldByName('ep_id').AsInteger);
    Sql.Fields.Add('ep_fechabaja', exDateTime);
    Sql.Fields.Add('ep_usubaja',   frmPrincipal.DBLogin.UserID);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
    //  Sql.PrimaryKey.AddExpression('ec_id', 'AFI.SEQ_AEC_ID.NEXTVAL');
      Sql.Fields.Add('ep_fechaalta',        exDateTime);
      Sql.Fields.Add('ep_usualta',          frmPrincipal.DBLogin.UserID);
    end
    else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('ep_id',     sdqConsulta.FieldByName('ep_id').AsInteger);
      Sql.Fields.Add('ep_fechamodif', exDateTime);
      Sql.Fields.Add('ep_usumodif',   frmPrincipal.DBLogin.UserID);
    end;

    Sql.Fields.Add('ep_idejecutivo', fraEjecutivo.Value);
    Sql.Fields.Add('ep_cpostal', edCPostal.Value);
  end;

   Result := inherited DoABM;
end;

procedure TfrmManAEP_EJECUTIVOCPOSTAL.LoadControls;
begin
  with sdqConsulta do
  begin
    fraEjecutivo.Value := FieldByName('ep_idejecutivo').AsInteger;
    edCPostal.Value := FieldByName('ep_cpostal').AsInteger;
  end;
end;

function TfrmManAEP_EJECUTIVOCPOSTAL.Validar: Boolean;
begin
  Verificar(fraEjecutivo.IsEmpty, fraEjecutivo, 'El ejecutivo no puede quedar vacío');
  Verificar(edCPostal.IsEmpty, edCPostal, 'El código postal no puede quedar vacío');

  Result := True;
end;

procedure TfrmManAEP_EJECUTIVOCPOSTAL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.mnuManEjecutivoDeCuenta.Enabled := True;
end;

procedure TfrmManAEP_EJECUTIVOCPOSTAL.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
  inherited;
end;

function TfrmManAEP_EJECUTIVOCPOSTAL.RegistrosEliminarValidos: Boolean;
var
  iLoop : Integer;
  bSalir : Boolean;
  sMensaje : String;
begin
  bSalir := False;
  sMensaje := '';
  if Grid.SelectedRows.Count > 1 then
  begin
    for iLoop := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
      // no debe estar dada de baja
      if not sdqConsulta.FieldByName('ep_fechabaja').IsNull then
      begin
        sMensaje := 'Alguno de los registros ya se encuentra dado de baja.';
        bSalir := True;
      end;
      if bSalir then
      begin
        InvalidMsg (Grid, sMensaje);
        Result := False;
        Exit;
      end; //Fin loop
    end;
  end;
  Result := True;
end;

procedure TfrmManAEP_EJECUTIVOCPOSTAL.tbEliminarClick(Sender: TObject);
var
  iLoop : Integer;
  sMensaje : String;
begin
  sMensaje := '';
  if Grid.SelectedRows.Count > 1 then
  begin
    if RegistrosEliminarValidos then
    begin
      if MsgBox('¿ Realmente desea dar de baja los registros seleccionados ?', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        for iLoop := 0 to Grid.SelectedRows.Count - 1 do
        begin
          sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
          ModoABM := maBaja;
          DoAbm;
        end;
        tbRefrescarClick(nil);
      end;
    end;
  end
  else
  inherited;
end;

procedure TfrmManAEP_EJECUTIVOCPOSTAL.tbLimpiarClick(Sender: TObject);
begin
  fraEjecutivoFiltro.Clear;
  edCPostalFiltro.Clear;
end;

procedure TfrmManAEP_EJECUTIVOCPOSTAL.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text :=
       'SELECT EP_ID, ' +
       '       EP_IDEJECUTIVO, ' +
       '       EP_CPOSTAL, ' +
       '       EP_USUALTA, ' +
       '       EP_FECHAALTA, ' +
       '       EP_USUBAJA, ' +
       '       EP_FECHABAJA, ' +
       '       EC_NOMBRE, ' +
       '       CP_LOCALIDAD, ' +
       '       PV_DESCRIPCION ' +
       '  FROM AFI.AEP_EJECUTIVOCPOSTAL ' +
       '       LEFT JOIN AEC_EJECUTIVOCUENTA ON EP_IDEJECUTIVO = EC_ID ' +
       '       LEFT JOIN ART.CCP_CODIGOPOSTAL ON EP_CPOSTAL = CP_CODIGO ' +
       '       LEFT JOIN ART.CPV_PROVINCIAS ON CP_PROVINCIA = PV_CODIGO '+
       '  WHERE 1 = 1 ';

  if not fraEjecutivoFiltro.IsEmpty then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + 'AND EP_IDEJECUTIVO = ' + SQLValue(fraEjecutivoFiltro.Value);
  if not edCPostalFiltro.IsEmpty then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + 'AND EP_CPOSTAL = ' + SQLValue(edCPostalFiltro.Value);
  inherited;
end;

procedure TfrmManAEP_EJECUTIVOCPOSTAL.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'AEP_EJECUTIVOCPOSTAL';
  FieldBaja     := 'ep_fechabaja';
end;

end.
