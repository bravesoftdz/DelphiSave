unit unManGestionables;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit,
  ExComboBox;

type
  TfrmManGestionables = class(TfrmCustomGridABM)
    Label1: TLabel;
    edNroGestion: TIntEdit;
    edDescripcion: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edTipoDetalle: TEdit;
    chkObligatorio: TCheckBox;
    chkManual: TCheckBox;
    Label4: TLabel;
    edReferencia: TEdit;
    Label5: TLabel;
    edTextoSGC: TEdit;
    Label6: TLabel;
    cmbTipo: TExComboBox;
    procedure FormCreate(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
		function DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManGestionables: TfrmManGestionables;

implementation

uses unCustomConsulta, SqlFuncs, unSesion, VclExtra, CustomDlgs;

{$R *.dfm}

{ TfrmManGestionables }

procedure TfrmManGestionables.ClearControls;
begin
  inherited;
  edNroGestion.Clear;
  edDescripcion.Clear;
  edTipoDetalle.Clear;
  chkObligatorio.Checked := false;
  chkManual.Checked := false;
  edReferencia.Clear;
  edTextoSGC.Clear;
  cmbTipo.ItemIndex := -1;
end;

function TfrmManGestionables.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('GE_ID', sdqConsulta.FieldByName('GE_ID').AsInteger);
     Sql.Fields.Add('GE_FECHABAJA', exDate );
     Sql.Fields.Add('GE_USUBAJA', Sesion.UserID );
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
//       Sql.PrimaryKey.AddExpression('GE_ID', 'SEQ_CRR_ID.NEXTVAL');
       Sql.Fields.Add('GE_FECHAALTA', exDate);
       Sql.Fields.Add('GE_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('GE_ID', sdqConsulta.FieldByName('GE_ID').AsInteger);
       Sql.Fields.Add('GE_FECHAMODIF', exDate);
       Sql.Fields.Add('GE_USUMODIF', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;

     if chkObligatorio.Checked then
      Sql.Fields.Add('GE_OBLIGATORIO', 'S')
     else
      Sql.Fields.Add('GE_OBLIGATORIO', 'N');

     if chkManual.Checked then
       Sql.Fields.Add('GE_MANUAL', 'S')
     else
       Sql.Fields.Add('GE_MANUAL', 'N');

     Sql.Fields.Add('GE_REFERENCIA', edReferencia.Text);
     Sql.Fields.Add('GE_TEXTO', edTextoSGC.Text);
     Sql.Fields.Add('GE_TIPO', cmbTipo.Value);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManGestionables.LoadControls;
begin
  inherited;
  edNroGestion.Value := sdqConsulta.fieldbyname('ge_id').AsInteger;
  edDescripcion.Text := sdqConsulta.fieldbyname('ge_descripcion').AsString;
  edTipoDetalle.Text := sdqConsulta.fieldbyname('descTipo').AsString;
  chkObligatorio.Checked := (sdqConsulta.fieldbyname('ge_obligatorio').AsString = 'S');
  chkManual.Checked := (sdqConsulta.fieldbyname('ge_manual').AsString = 'S');
  edReferencia.Text := sdqConsulta.fieldbyname('ge_referencia').AsString;
  edTextoSGC.Text := sdqConsulta.fieldbyname('ge_texto').AsString;
  cmbTipo.Value := sdqConsulta.fieldbyname('ge_tipo').AsString;
end;

procedure TfrmManGestionables.RefreshData;
begin
  inherited;

end;

function TfrmManGestionables.Validar: Boolean;
begin
  Verificar(trim(edReferencia.Text)='', edReferencia, 'Debe indicar la referencia.');
  Verificar(trim(edTextoSGC.Text)='', edTextoSGC, 'El texto del SGC es obligatorio.');
  Verificar(cmbTipo.ItemIndex < 0, cmbTipo, 'Debe indicar un tipo.');
  Result := true;
end;

procedure TfrmManGestionables.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'EMI.IGE_GESTIONABLE';
  FieldBaja     := 'GE_FECHABAJA';
end;

procedure TfrmManGestionables.fpAbmShow(Sender: TObject);
begin
  inherited;
  VclExtra.LockControl(edNroGestion, true);
  VclExtra.LockControl(edDescripcion, true);
  VclExtra.LockControl(edTipoDetalle, true);
end;

end.
