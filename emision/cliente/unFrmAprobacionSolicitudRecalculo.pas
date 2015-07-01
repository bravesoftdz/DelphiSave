unit unFrmAprobacionSolicitudRecalculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, DateComboBox, ExtCtrls;

type
  TFrmAprobacionSolicitudRecalculo = class(TForm)
    Bevel1: TBevel;
    btnNoAutorizar: TButton;
    btnCancelar: TButton;
    btnAutorizar: TButton;
    gbDatosSolicitudAutorizacion: TGroupBox;
    Label5: TLabel;
    lblMotivo: TLabel;
    Label8: TLabel;
    lblPeriodos: TLabel;
    edtMotivo: TEdit;
    edtContrato: TEdit;
    edtRazonSocial: TEdit;
    edtPeriodoDesde: TEdit;
    edtPeriodoHasta: TEdit;
    gbObservacionesAutorizacion: TGroupBox;
    Label7: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    edtFechaAutorizacion: TDateComboBox;
    mObservacionAutorizacion: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAprobacionSolicitudRecalculo: TFrmAprobacionSolicitudRecalculo;

implementation

{$R *.dfm}

end.
