unit unfrmObservacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AnsiSql, SqlFuncs, unDmPrincipal, ComCtrls, ToolWin, CustomDlgs,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion, ExtCtrls;

type
  TfrmObservacion = class(TForm)
    edObservacion: TMemo;
    tbComandosDetalle: TToolBar;
    btnAceptar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton2: TToolButton;
    tbLimpiar: TToolButton;
    pnlTop: TPanel;
    fraObservacion: TfraStaticCodigoDescripcion;
    lblObs: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FValidar: boolean;
    FTablaObservacion: string;
    FShowBajas: boolean;
    FFieldFechaBaja: string;
    FFieldCodigo: string;
    FFieldId: string;
    FFieldDescripcion: string;
    FExtraCondition: string;
    function GetObservacion: string;
    procedure SetObservacion(const Value: string);
    procedure SetTablaObservacion(const Value: string);
    procedure SetShowBajas(const Value: boolean);
    procedure SetFieldFechaBaja(const Value: string);
    procedure SetFieldCodigo(const Value: string);
    procedure SetFieldDescripcion(const Value: string);
    procedure SetFieldId(const Value: string);
    function GetIdObservacion: integer;
    function GetDescObservacion: string;
    procedure SetIdObservacion(const Value: integer);
    procedure SetExtraCondition(const Value: string);
    function GetObsTString: TStrings;
  public
    property Observacion: string read GetObservacion write SetObservacion;
    property ObsTString: TStrings read GetObsTString;
    property Validar: boolean read FValidar write FValidar;
    property ShowBajas: boolean read FShowBajas write SetShowBajas;
    property FieldFechaBaja: string read FFieldFechaBaja write SetFieldFechaBaja;
    property FieldCodigo: string read FFieldCodigo write SetFieldCodigo;
    property FieldDescripcion: string read FFieldDescripcion write SetFieldDescripcion;
    property FieldId: string read FFieldId write SetFieldId;
    property ExtraCondition: string read FExtraCondition write SetExtraCondition;
    property TablaObservacion: string read FTablaObservacion write SetTablaObservacion;
    property IdObservacion: integer read GetIdObservacion write SetIdObservacion;
    property DescObservacion: string read GetDescObservacion;
  end;

var
  frmObservacion: TfrmObservacion;

implementation

{$R *.dfm}

procedure TfrmObservacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
end;

function TfrmObservacion.GetObservacion: string;
begin
  result := edObservacion.Lines.Text;
end;


procedure TfrmObservacion.SetObservacion(const Value: string);
begin
  edObservacion.Lines.Text := Value;
end;

procedure TfrmObservacion.btnAceptarClick(Sender: TObject);
begin
  Verificar(Validar and pnlTop.Visible and not fraObservacion.IsSelected, fraObservacion, 'Debe ingresar una observación');
  Verificar(Validar and not pnlTop.Visible and (trim(edObservacion.Lines.Text) = ''), edObservacion, 'Debe ingresar una observación');
  ModalResult := mrOk;
end;

procedure TfrmObservacion.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmObservacion.tbLimpiarClick(Sender: TObject);
begin
  fraObservacion.Clear;
  edObservacion.Lines.Clear;
end;

procedure TfrmObservacion.FormCreate(Sender: TObject);
begin
  FValidar := true;
  pnlTop.Visible := false;
end;


procedure TfrmObservacion.SetTablaObservacion(const Value: string);
begin
  FTablaObservacion := Value;
  if (FTablaObservacion <> '') then
  begin
    pnlTop.Visible := true;
    fraObservacion.TableName := FTablaObservacion;
    fraObservacion.ShowBajas := false;
  end
  else
    pnlTop.Visible := false;
end;

procedure TfrmObservacion.SetShowBajas(const Value: boolean);
begin
  FShowBajas := Value;
  fraObservacion.ShowBajas := FShowBajas;
end;

procedure TfrmObservacion.SetFieldFechaBaja(const Value: string);
begin
  FFieldFechaBaja := Value;
  fraObservacion.FieldBaja := FFieldFechaBaja;
end;

procedure TfrmObservacion.SetFieldCodigo(const Value: string);
begin
  FFieldCodigo := Value;
  fraObservacion.FieldCodigo := FFieldCodigo;
end;

procedure TfrmObservacion.SetFieldDescripcion(const Value: string);
begin
  FFieldDescripcion := Value;
  fraObservacion.FieldDesc := FFieldDescripcion;
end;

procedure TfrmObservacion.SetFieldId(const Value: string);
begin
  FFieldId := Value;
  fraObservacion.FieldID := FFieldId;
end;

function TfrmObservacion.GetIdObservacion: integer;
begin
  if pnlTop.Visible then
    result := fraObservacion.Value
  else
    result := 0;
end;


function TfrmObservacion.GetDescObservacion: string;
begin
  if pnlTop.Visible then
    result := fraObservacion.cmbDescripcion.Text
  else
    result := '';
end;

procedure TfrmObservacion.SetIdObservacion(const Value: integer);
begin
  fraObservacion.Value := Value;
end;

procedure TfrmObservacion.SetExtraCondition(const Value: string);
begin
  FExtraCondition := Value;
  fraObservacion.ExtraCondition := FExtraCondition;
end;

function TfrmObservacion.GetObsTString: TStrings;
begin
  result := edObservacion.Lines;
end;

end.
