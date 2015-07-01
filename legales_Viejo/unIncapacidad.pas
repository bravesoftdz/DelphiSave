unit unIncapacidad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ToolEdit, DateComboBox, Mask,
  CurrEdit, PatternEdit, IntEdit;

type
  TfrmIncapacidad = class(TfrmCustomGridABM)
    edPorcentajeIncapacidadDefinitiva: TCurrencyEdit;
    lnlPorcentajeIncapacidad: TLabel;
    lblPorcentajeDefinitiva: TLabel;
    edFecha: TDateComboBox;
    lblFechaEvento: TLabel;
    edIngresoBrutoMensual: TCurrencyEdit;
    lbIngresoBrutoMensual: TLabel;
    edFechaNacimiento: TDateComboBox;
    lbFechaNacimiento: TLabel;
    lbEdad: TLabel;
    edEdad: TIntEdit;
    lbNroExpediente: TLabel;
    edNroExpediente: TIntEdit;
    edPorcentajeProvComMed: TCurrencyEdit;
    Label1: TLabel;
    lbPorProvComMed: TLabel;
    lbMontoAdeudado3anios: TLabel;
    edMontoAdeudadoProv3anios: TCurrencyEdit;
    lbFechaVencimiento3anios: TLabel;
    edFechaVenc3anios: TDateComboBox;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    lbMontoAdeudado5anios: TLabel;
    edMontoAdeudadoProv5anios: TCurrencyEdit;
    lbFechaVencimiento5anios: TLabel;
    DateComboBox2: TDateComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncapacidad: TfrmIncapacidad;

implementation

{$R *.dfm}

end.
