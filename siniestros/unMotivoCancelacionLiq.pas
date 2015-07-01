unit unMotivoCancelacionLiq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  StdCtrls;

type
  TfrmMotivoCancelacionLiq = class(TfrmCustomForm)
    fraMotivoCancelacion: TfraStaticCTB_TABLAS;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  public
  end;

  function Get_MotivoCancelacionLiq(var MotivoCanc: String; var bDevolFondos, bCompensaPag: boolean; sCodEstado: string; iSiniestro, iOrden, iRecaida, iNroLiq: integer): Boolean;

implementation

{$R *.dfm}

uses
  CustomDlgs;

procedure TfrmMotivoCancelacionLiq.FormCreate(Sender: TObject);
begin
  inherited;

  with fraMotivoCancelacion do
    begin
      Clave     := 'MCANC';
      ShowBajas := False;
    end;
end;

procedure TfrmMotivoCancelacionLiq.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraMotivoCancelacion.IsEmpty, fraMotivoCancelacion, 'Debe ingresar el motivo de cancelación.');

  ModalResult := mrOk;
end;

function Get_MotivoCancelacionLiq(var MotivoCanc: String; var bDevolFondos, bCompensaPag: boolean; sCodEstado: string; iSiniestro, iOrden, iRecaida, iNroLiq: integer): Boolean;
begin
  Result := False;

  with TfrmMotivoCancelacionLiq.Create(nil) do
    try
      if ShowModal = mrOk then
        begin
          MotivoCanc   := fraMotivoCancelacion.Codigo;
          bDevolFondos := False;   // se usa solo en Dinerarias
          bCompensaPag := False;
          Result       := True;
        end;
    finally
      free;
    end;
end;

end.

