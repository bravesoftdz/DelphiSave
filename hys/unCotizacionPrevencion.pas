unit unCotizacionPrevencion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, unfraCtbTablas,
  unFraCodigoDescripcion, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, Mask, StdCtrls, PatternEdit, IntEdit, DB,
  SDEngine, ExtCtrls, ToolEdit, CurrEdit;

type
  TfrmCotizacionPrevencion = class(TfrmCustomForm)
    SDcotizacionPrevencion: TSDStoredProc;
    Bevel1: TBevel;
    btnAceptarCotIzacion: TButton;
    btnCancelCotizacion: TButton;
    lbCUIT: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lbCIUU: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edCantEmpleados: TIntEdit;
    edCantEstab: TIntEdit;
    mskCUIT: TMaskEdit;
    fraActividad: TfraStaticCodigoDescripcion;
    fraProvincia: TfraCodigoDescripcion;
    fraTipoFet: TfraCtbTablas;
    cbLicitacion: TCheckBox;
    fraSectores: TfraCtbTablas;
    lbCosto: TLabel;
    edCosto: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarCotIzacionClick(Sender: TObject);
    procedure btnCancelCotizacionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCotizacionPrevencion: TfrmCotizacionPrevencion;

implementation

uses VCLExtra, CustomDlgs;

{$R *.dfm}

procedure TfrmCotizacionPrevencion.FormCreate(Sender: TObject);
begin
  inherited;
  with fraACTIVIDAD do
  begin
    TableName   := 'CAC_ACTIVIDAD';
    FieldID     := 'AC_ID';
    FieldCodigo := 'AC_CODIGO';
    FieldDesc   := 'AC_DESCRIPCION';
  end;

  with fraProvincia do
  begin
    TableName   := 'art.cpv_provincias';
    FieldID     := 'PV_CODIGO';
    FieldCodigo := 'PV_CODIGO';
    FieldDesc   := 'PV_DESCRIPCION';
    FieldBaja   := 'PV_FECHABAJA';
    Showbajas   := True;
  end;

  fraTipoFet.Clave       := 'TFET';
  fraTipoFet.ExtraCondition := ' AND TB_CODIGO IN (''ET'', ''EP'', ''GB'')';
    
  fraSectores.Clave       := 'SECT';

  vclExtra.LockControls([edCosto],True);
end;

procedure TfrmCotizacionPrevencion.btnAceptarCotIzacionClick(
  Sender: TObject);
begin
  inherited;
  Verificar(mskCUIT.Text = '',mskCUIT,'Debe completar el campo CUIT.');
  Verificar(edCantEmpleados.Text = '',edCantEmpleados,'Debe completar la cantidad de Empleados.');
  Verificar(edCantEstab.Text = '', edCantEstab,'Debe completar la cantidad de establecimientos.');
  Verificar(not fraActividad.IsSelected, fraActividad,'Debe completar el CIUU.');
  Verificar(not fraProvincia.IsSelected, fraProvincia,'Debe completar la Provincia.');
  Verificar(not fraTipoFet.IsSelected, fraTipoFet,'Debe completar el tipo.');
  Verificar(not fraSectores.IsSelected, fraSectores,'Debe completar el Sector.');
  SDcotizacionPrevencion.ParamByName('CUIT').AsString := mskCUIT.Text;
  SDcotizacionPrevencion.ParamByName('idactividad').AsInteger := fraActividad.Value;
  SDcotizacionPrevencion.ParamByName('cantempleados').AsInteger := edCantEmpleados.Value;
  SDcotizacionPrevencion.ParamByName('cantestab').AsInteger := edCantEstab.Value;
  SDcotizacionPrevencion.ParamByName('codprovincia').AsString := fraProvincia.Codigo;
  SDcotizacionPrevencion.ParamByName('tipoempresa').AsString := fraTipoFet.Codigo;
  SDcotizacionPrevencion.ParamByName('sectorempresa').AsString := fraSectores.Codigo;
  if cbLicitacion.Checked then
    SDcotizacionPrevencion.ParamByName('licitacion').AsString := 'S'
  else
    SDcotizacionPrevencion.ParamByName('licitacion').AsString := 'N';
  SDcotizacionPrevencion.ExecProc;
  if SDcotizacionPrevencion.ParamByName('costo').AsInteger >= 0 then
    edCosto.Text := SDcotizacionPrevencion.ParamByName('costo').AsString
  else
    MsgBox(SDcotizacionPrevencion.ParamByName('msgresultado').AsString);
end;

procedure TfrmCotizacionPrevencion.btnCancelCotizacionClick(
  Sender: TObject);
begin
  inherited;
  Close;
end;

end.
