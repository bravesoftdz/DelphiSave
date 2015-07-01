unit unfraPagoConceptosLegales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, CurrEdit, PatternEdit, Mask, ToolEdit,
  DateComboBox, unArtFrame, unFraCodigoDescripcion;

type
  TfraPagoConceptosLegales = class(TFrame)
    lblConceptoPago: TLabel;
    lblFechaFacturaPago: TLabel;
    lblNroFactura: TLabel;
    lblDetalleFacturaPago: TLabel;
    lblImporteSinRetGanaciasPago: TLabel;
    lblImpSujetoaRetGanaciasPago: TLabel;
    lblNroCuenta: TLabel;
    fraConceptoPago: TfraCodigoDescripcion;
    edFechaFacturaPago: TDateComboBox;
    peNroFactura: TPatternEdit;
    edtObservaciones: TEdit;
    edImpSinRetencionesGanPagos: TCurrencyEdit;
    edImpSujetoaRetGanaciasPago: TCurrencyEdit;
    edNroCuentaImputacionPago: TPatternEdit;
    fraCodigoDescripcion1: TfraCodigoDescripcion;
    lblBeneficiario: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
