unit unGrabarDocumentoCarpeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, unArtFrame,
  unFraSDA_DETALLEARCHIVO, StdCtrls, unConstantArchivo;

type
  TfrmGrabarDocumentoCarpeta = class(TfrmCustomForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraDetalleArchivo: TfraSDA_DETALLEARCHIVO;
    lblAclaracion: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    FCantHojas: Integer;
    FDestino: String;
    FLockDestino: Boolean;
    FAclaracion: String;
    procedure SetDestino(const Value: String);
    procedure SetLockDestino(const Value: Boolean);
    procedure SetAclaracion(const Value: String);
  public
    property CantHojas: Integer    read FCantHojas     write FCantHojas;
    property Destino: String       read FDestino       write SetDestino;
    property Aclaracion: String    read FAclaracion    write SetAclaracion;   
    property LockDestino: Boolean  read FLockDestino   write SetLockDestino   default False;
  end;

implementation

uses
  VCLExtra;
  
{$R *.dfm}

procedure TfrmGrabarDocumentoCarpeta.FormCreate(Sender: TObject);
begin
  inherited;

  fraDetalleArchivo.Clear;

  Destino     := OPCION_DESTINO_DIGITALIZACION;
  LockDestino := False;
end;

procedure TfrmGrabarDocumentoCarpeta.btnAceptarClick(Sender: TObject);
begin
  if fraDetalleArchivo.Validate then
    begin
      CantHojas   := fraDetalleArchivo.Hojas;
      Destino     := fraDetalleArchivo.Opcion;

      ModalResult := mrOk;
    end;
end;

procedure TfrmGrabarDocumentoCarpeta.SetDestino(const Value: String);
begin
  if FDestino <> Value then
    begin
      FDestino                 := Value;
      fraDetalleArchivo.Opcion := Value;
    end;
end;

procedure TfrmGrabarDocumentoCarpeta.SetLockDestino(const Value: Boolean);
begin
  if FLockDestino <> Value then
    begin
      FLockDestino := Value;
      VCLExtra.LockControl(fraDetalleArchivo.cmbDA_OPCION, Value);
    end;
end;

procedure TfrmGrabarDocumentoCarpeta.SetAclaracion(const Value: String);
begin
  if FAclaracion <> Value then
    begin
      FAclaracion           := Value;
      lblAclaracion.Caption := Value;
    end;
end;

end.
