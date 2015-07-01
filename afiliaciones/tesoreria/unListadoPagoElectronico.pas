unit unListadoPagoElectronico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, Mask,
  ToolEdit, DateComboBox, PatternEdit, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion;

type
  TfrmListadoPagoElectronico = class(TfrmCustomForm)
    gbFecha: TGroupBox;
    edFecha: TDateComboBox;
    grpNumCheque: TGroupBox;
    Label1: TLabel;
    edChequeDesde: TPatternEdit;
    edChequeHasta: TPatternEdit;
    gbOrigen: TGroupBox;
    fraBanco: TfraStaticCodigoDescripcion;
    btnAceptar: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
  public
  end;

var
  frmListadoPagoElectronico: TfrmListadoPagoElectronico;

implementation

{$R *.dfm}

uses
  CustomDlgs, StrFuncs, unRptBancosPagoElectronico;

procedure TfrmListadoPagoElectronico.FormCreate(Sender: TObject);
begin
  inherited;

  with fraBanco do
    begin
      ShowBajas   := True;
      TableName   := 'ZBA_BANCO';
      FieldID     := 'BA_ID';
      FieldCodigo := 'BA_CODIGO';
      FieldDesc   := 'BA_NOMBRE';
      FieldBaja   := 'BA_FECHABAJA';
    end;
end;

procedure TfrmListadoPagoElectronico.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraBanco.IsEmpty, fraBanco, 'Debe indicar el banco.');
  Verificar(IsEmptyString(edChequeDesde.Text), edChequeDesde, 'Debe indicar el nro. de cheque desde.');
  Verificar(IsEmptyString(edChequeHasta.Text), edChequeHasta, 'Debe indicar el nro. de cheque hasta.');
  Verificar(edFecha.IsEmpty, edFecha, 'Debe indicar la fecha.');

  TfrmRptBancosPagoElectronico.DoImprimirBancosPagoElectronico(edFecha.Date, fraBanco.Value, StrToInt(edChequeDesde.Text), StrToInt(edChequeHasta.Text));
end;

end.
