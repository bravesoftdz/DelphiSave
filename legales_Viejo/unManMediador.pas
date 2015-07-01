unit unManMediador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, unArtFrame,
  unFraDomicilio, PatternEdit, ExComboBox;

type
  TfrmManMediador = class(TfrmCustomGridABM)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    pnlBottom: TPanel;
    edNombre: TEdit;
    lblDescripcion: TLabel;
    lblDireccion: TLabel;
    edDireccion: TEdit;
    lblEmail: TLabel;
    lblParte: TLabel;
    edTelefono: TEdit;
    edEmail: TEdit;
    edCodArea: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lbFAX: TLabel;
    edFax: TPatternEdit;
    lblCuil: TLabel;
    edCuilCuit: TMaskEdit;
    fraDomicilio: TfraDomicilio;
    cmbTipo: TExComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FCodigo : String;
    { Private declarations }
  public
    { Public declarations }
    function ObtenerMediador: String;
    procedure VerSeleccion;
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmManMediador: TfrmManMediador;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs, General;


procedure TfrmManMediador.ClearControls;
begin
  inherited;
  edNombre.Clear;
  edDireccion.Clear;
  edCodArea.Clear;
  edTelefono.Clear;
  edFax.Clear;
  edCuilCuit.Clear;
  cmbTipo.ItemIndex := -1;
  fraDomicilio.Clear;
end;

function TfrmManMediador.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('MD_ID').AsInteger;
      Sql.Fields.Add('MD_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('MD_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('md_nombre', edNombre.Text);
      Sql.Fields.Add('md_codareatelefono', edCodArea.Text);
      Sql.Fields.Add('md_telefono', edTelefono.Text);
      Sql.Fields.Add('md_fax', edFax.Text);
      Sql.Fields.Add('md_direlectronica', edEmail.Text);
      Sql.Fields.Add('md_cuitcuil', edCuilCuit.Text);
      Sql.Fields.Add('md_tipo', cmbTipo.Value);
      Sql.Fields.Add('md_calle', fraDomicilio.Calle);
      Sql.Fields.Add('md_numero', fraDomicilio.Numero);
      Sql.Fields.Add('md_piso', fraDomicilio.Piso);
      Sql.Fields.Add('md_departamento', fraDomicilio.Departamento);
      Sql.Fields.Add('md_cpostal', fraDomicilio.CodigoPostal);
      Sql.Fields.Add('md_cpostala', fraDomicilio.CPA);
      Sql.Fields.Add('md_localidad', fraDomicilio.Localidad);
      Sql.Fields.Add('md_provincia', fraDomicilio.Prov);

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('LEGALES.SEQ_LMD_ID');
        Sql.Fields.Add('MD_USUALTA', Sesion.UserID );
        Sql.Fields.Add('MD_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('MD_ID').AsInteger;
        Sql.Fields.Add('MD_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('MD_FECHAMODIF', exDateTime );
        Sql.Fields.Add('MD_USUBAJA', exNull );
        Sql.Fields.Add('MD_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('MD_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManMediador.LoadControls;
begin
  inherited;
  ClearControls;
  edNombre.Text := sdqConsulta.FieldByName('md_nombre').AsString;
  edDireccion.Text:= sdqConsulta.FieldByName('md_direccion').AsString;
  edCodArea.Text:= sdqConsulta.FieldByName('md_codareatelefono').AsString;
  edTelefono.Text:= sdqConsulta.FieldByName('md_telefono').AsString;
  edFax.Text:= sdqConsulta.FieldByName('md_fax').AsString;
  edCuilCuit.Text:= sdqConsulta.FieldByName('md_cuitcuil').AsString;
  fraDomicilio.Cargar(sdqConsulta.FieldByName('md_calle').AsString,sdqConsulta.FieldByName('md_cpostal').AsString,
                      sdqConsulta.FieldByName('md_localidad').AsString, sdqConsulta.FieldByName('md_numero').AsString,
                      sdqConsulta.FieldByName('md_piso').AsString,sdqConsulta.FieldByName('md_departamento').AsString,
                      sdqConsulta.FieldByName('MD_PROVINCIA').AsString, sdqConsulta.FieldByName('md_cpostal').AsString);
  cmbTipo.Value    := sdqConsulta.FieldByName('md_tipo').AsString;
end;

function TfrmManMediador.Validar: Boolean;
begin
  Result := True;
  Verificar(edNombre.Text = '',edNombre, 'Debe especificar el Nombre.');
//  Verificar(edEmail.Text = '',edEmail, 'Debe especificar un Texto de Mail.');
  Verificar(cmbTipo.ItemIndex = -1, cmbTipo, 'Debe especificar el tipo de Mediador.')

end;

procedure TfrmManMediador.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'md_fechabaja';
  Sql.TableName := 'legales.lmd_mediador';
  vclExtra.LockControl(eddireccion);
end;

procedure TfrmManMediador.VerSeleccion;
begin
  Panel1.Visible := True;
end;

function TfrmManMediador.ObtenerMediador : String;
begin
  Result := Fcodigo;
end;

procedure TfrmManMediador.Button1Click(Sender: TObject);
begin
  inherited;
  Verificar(sdqConsulta.IsEmpty, btnAceptar, 'Debe seleccionar un Mediador.');
  FCodigo := sdqConsulta.FieldByName('md_id').AsString;
  ModalResult := mrOK;
end;

end.
