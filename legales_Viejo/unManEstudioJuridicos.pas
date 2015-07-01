unit unManEstudioJuridicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManEstudioJuridico = class(TfrmCustomGridABM)
    edNombreEstudio: TEdit;
    lbNombreEstudio: TLabel;
    edDomicilio: TEdit;
    lbDomicilio: TLabel;
    edEmail: TEdit;
    lbEmail: TLabel;
    lbTelefono: TLabel;
    edTelefono: TEdit;
    lbFax: TLabel;
    edFax: TEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    pnlBottom: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    Fcodigo : String;

    { Private declarations }
  public
    { Public declarations }
    procedure VerSeleccion;
    function ObtenerEstudio: String;
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmManEstudioJuridico: TfrmManEstudioJuridico;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs;


{ TfrmManEstudioJuridico }

procedure TfrmManEstudioJuridico.FormCreate(Sender: TObject);
begin
  inherited;
  Top := Round(Screen.Height/2 - Height/2);
  Left := Round(Screen.Width/2 - Width/2);
  FieldBaja := 'EJ_FECHABAJA';
  Sql.TableName := 'LEGALES.LEJ_ESTUDIOJURIDICO';
end;

procedure TfrmManEstudioJuridico.ClearControls;
begin
  inherited;
  edNombreEstudio.Clear;
  edDomicilio.Clear;
  edEmail.Clear;
  edTelefono.Clear;
  edFax.Clear;
end;

function TfrmManEstudioJuridico.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('EJ_ID').AsInteger;
      Sql.Fields.Add('EJ_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('EJ_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('EJ_NOMBREESTUDIO', edNombreEstudio.Text);
      Sql.Fields.Add('EJ_DOMICILIO', edDomicilio.Text);
      Sql.Fields.Add('EJ_EMAIL', edEmail.Text);
      Sql.Fields.Add('EJ_TELEFONO', edTelefono.Text);
      Sql.Fields.Add('EJ_FAX', edFax.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('LEGALES.SEQ_LEJ_ESTUDIOJURIDICO_ID');
        Sql.Fields.Add('EJ_USUALTA', Sesion.UserID );
        Sql.Fields.Add('EJ_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('EJ_ID').AsInteger;
        Sql.Fields.Add('EJ_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('EJ_FECHAMODIF', exDateTime );
        Sql.Fields.Add('EJ_USUBAJA', exNull );
        Sql.Fields.Add('EJ_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('EJ_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManEstudioJuridico.LoadControls;
begin
  inherited;
  ClearControls;
  edNombreEstudio.Text := sdqConsulta.FieldByName('EJ_NOMBREESTUDIO').AsString;
  edDomicilio.Text     := sdqConsulta.FieldByName('EJ_DOMICILIO').AsString;
  edEmail.Text         := sdqConsulta.FieldByName('EJ_EMAIL').AsString;
  edTelefono.Text      := sdqConsulta.FieldByName('EJ_TELEFONO').AsString;
  edFax.Text           := sdqConsulta.FieldByName('EJ_FAX').AsString;
end;

function TfrmManEstudioJuridico.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(edNombreEstudio.Text),edNombreEstudio, 'Debe especificar el Nombre del Estudio.');
end;

procedure TfrmManEstudioJuridico.Button1Click(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, btnAceptar, 'Debe seleccionar un Estudio Jurídico.');
  FCodigo := sdqConsulta.FieldByName('ej_id').AsString;
  ModalResult := mrOK;
end;

function TfrmManEstudioJuridico.ObtenerEstudio : String;
begin
  Result := Fcodigo;
end;

procedure TfrmManEstudioJuridico.VerSeleccion;
begin
  Panel1.Visible := True;
end;

end.
