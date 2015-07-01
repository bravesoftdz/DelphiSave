unit unMotivoCancelacionLiq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  StdCtrls, ExtCtrls, unFraStaticCTB_TABLAS, unFraCodigoDescripcion, SDEngine,
  DB, Mask, ToolEdit, ArtComboBox, Buttons, FormPanel;

type
  TfrmMotivoCancelacionLiq = class(TfrmCustomForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    rbDevolucionFondos: TRadioButton;
    rbCompensaPagosFut: TRadioButton;
    Bevel1: TBevel;
    labelParaFoco: TLabel;
    fraMotivoCancelacion: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    procedure Do_HabilitarRadioButtons(sCodEst:string);
    function Validar: boolean;

  public
  end;

  function Get_MotivoCancelacionLiq(var MotivoCanc: String; var bDevolFondos, bCompensaPag: boolean; sCodEstado: string; iSiniestro, iOrden, iRecaida, iNroLiq: integer): Boolean;

var vCodEstado: string;  // Codigo del Estado de la liquidacion
    vSiniestro, vOrden, vRecaida, vNroLiq : integer;

implementation

{$R *.dfm}

uses
  CustomDlgs, unDmPrincipal, AnsiSql, unLiqIncapacidades;

procedure TfrmMotivoCancelacionLiq.FormCreate(Sender: TObject);
begin
  inherited;

  with fraMotivoCancelacion do
  begin
    TableName      := 'SIN.SML_MOTIVOCANCLIQUIDACIONES';
    FieldID        := 'ML_ID';
    FieldDesc      := 'ML_DESCRIPCION';
    FieldCodigo    := 'ML_CODIGO';
    FieldBaja      := 'ML_FECHABAJA';   
    ShowBajas      := False;
  end;

end;

function TfrmMotivoCancelacionLiq.Validar: boolean;
var
  sSql :String;
begin
  Verificar(fraMotivoCancelacion.IsEmpty, fraMotivoCancelacion, 'Debe ingresar el motivo de cancelación.');
  Verificar((rbDevolucionFondos.Enabled) and (rbCompensaPagosFut.Enabled) and (not rbDevolucionFondos.Checked) and (not rbCompensaPagosFut.Checked), labelParaFoco,
             'Debe seleccionar alguna de estas dos opciones');


  sSql := 'SELECT ml_puedecompensar, ml_puededevfondos, ml_anulacion, ml_cancelacion FROM sin.sml_motivocancliquidaciones ' +
          ' WHERE ml_codigo = :cod ';

  with GetQueryEx(sSql, [fraMotivoCancelacion.Codigo]) do
  try
    if not Eof then
    begin
      Verificar(rbCompensaPagosFut.Checked and (FieldByName('ML_PUEDECOMPENSAR').AsString = 'N'), rbCompensaPagosFut,
        'No puede seleccionar esta opción debido a que el Motivo seleccionado no permite compensar con pagos futuros.' );
      Verificar(rbDevolucionFondos.Checked and (FieldByName('ML_PUEDEDEVFONDOS').AsString = 'N'), rbDevolucionFondos,
        'No puede seleccionar esta opción debido a que el Motivo seleccionado no permite devolver fondos.' );
        
    end;
  finally
    Free;
  end;
  Result := True;
end;



function Get_MotivoCancelacionLiq(var MotivoCanc: String; var bDevolFondos, bCompensaPag: boolean; sCodEstado: string; iSiniestro, iOrden, iRecaida, iNroLiq: integer): Boolean;
begin
  Result     := False;
//  vCodEstado := sEstado;
  with TfrmMotivoCancelacionLiq.Create(nil) do
    try
      Do_HabilitarRadioButtons(sCodEstado);
      vSiniestro := iSiniestro;
      vOrden     := iOrden;
      vRecaida   := iRecaida;
      vNroLiq    := iNroLiq;

      // Filtrado
      if ((sCodEstado = 'E') or (sCodEstado = 'P')) then // Cancelacion
        fraMotivoCancelacion.ExtraCondition := ' and ml_cancelacion = ''S'' '
      else                                               // Anulacion
         fraMotivoCancelacion.ExtraCondition := ' and ml_anulacion = ''S'' ';

      if ShowModal = mrOk then
        begin
          MotivoCanc   := fraMotivoCancelacion.Codigo;
          bDevolFondos := rbDevolucionFondos.Checked;     // por Plan Registro de pagos cancelados
          bCompensaPag := rbCompensaPagosFut.Checked;     // por Plan Registro de pagos cancelados
          Result       := True;
        end;
    finally
      free;
    end;
end;

procedure TfrmMotivoCancelacionLiq.Do_HabilitarRadioButtons(sCodEst: string);
var bHabilita: boolean;
begin
  bHabilita := ((sCodEst = 'E') or (sCodEst ='P'));
  rbDevolucionFondos.Enabled := bHabilita;
  rbCompensaPagosFut.Enabled := bHabilita;
end;


procedure TfrmMotivoCancelacionLiq.btnAceptarClick(Sender: TObject);
begin
  if Validar then
    ModalResult := mrOk;
end;

end.

