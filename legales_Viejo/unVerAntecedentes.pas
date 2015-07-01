unit unVerAntecedentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  ToolWin, DB, ShellApi, CustomDlgs;

type
  TfrmVerAntecedente = class(TForm)
    bvSeparadorBotones: TBevel;
    btnCerrarAntecedente: TButton;
    pgPrincipal: TPageControl;
    tsPrincipal: TTabSheet;
    tsMasDatos: TTabSheet;
    edNroRequerimiento: TEdit;
    Label1: TLabel;
    edEstado: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edAreaSrt: TEdit;
    Label4: TLabel;
    edCantidadHojas: TEdit;
    lblDelegacion: TLabel;
    edDelegacion: TEdit;
    edRechazo: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edRevision: TEdit;
    Label8: TLabel;
    edFechaAceptado: TEdit;
    Label9: TLabel;
    edFechaDescargo: TEdit;
    Label10: TLabel;
    edFechaGenerado: TEdit;
    Label11: TLabel;
    edFechaProrroga: TEdit;
    Label12: TLabel;
    edFechaRecepcion: TEdit;
    Label13: TLabel;
    edFechaRespuesta: TEdit;
    Label14: TLabel;
    edVencimiento: TEdit;
    Label15: TLabel;
    edFirmante: TEdit;
    Label16: TLabel;
    edFirmaSRT: TEdit;
    Label17: TLabel;
    edEstado2: TEdit;
    Label18: TLabel;
    edEstadoDescargo: TEdit;
    Label20: TLabel;
    edSectorResponsable: TEdit;
    Label19: TLabel;
    edImagenRecepcion: TEdit;
    Label21: TLabel;
    edImgForm: TEdit;
    Label22: TLabel;
    edMotivoRechazo: TEdit;
    Label23: TLabel;
    edMotivoRespuestaParcial: TEdit;
    Label24: TLabel;
    edMotivoSolicitud: TEdit;
    tbrVerImgRecep: TToolBar;
    tbSeleccionImgRecep: TToolButton;
    ToolBar1: TToolBar;
    tbImgForm: TToolButton;
    Label26: TLabel;
    edNroNota: TEdit;
    Label27: TLabel;
    edNroSrt: TEdit;
    Label28: TLabel;
    edObservacion: TMemo;
    Label29: TLabel;
    edObservacionSector: TMemo;
    edPedidoProrroga: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    edPlazoEntrega: TEdit;
    Label32: TLabel;
    edReciboSRT: TEdit;
    Label33: TLabel;
    edReferencia: TEdit;
    Label34: TLabel;
    edReferente: TEdit;
    ToolBar2: TToolBar;
    tbRespDescargo: TToolButton;
    edRespDescargo: TEdit;
    Label36: TLabel;
    Label37: TLabel;
    edRespParcial: TMemo;
    ToolBar3: TToolBar;
    tbRespWord: TToolButton;
    edRespWord: TEdit;
    Label38: TLabel;
    Label39: TLabel;
    edFechaSRT: TEdit;
    procedure tbImgFormClick(Sender: TObject);
    procedure tbSeleccionImgRecepClick(Sender: TObject);
    procedure tbRespDescargoClick(Sender: TObject);
    procedure tbRespWordClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure AbrirArchivo(PathArchivo: String);
  public
    procedure CargarAntecedente(aFields: TFields);
  end;

var
  frmVerAntecedente: TfrmVerAntecedente;

implementation

{$R *.dfm}

{ TfrmVerAntecedente }

procedure TfrmVerAntecedente.AbrirArchivo(PathArchivo: String);
begin
	try
  	ShellExecute(Handle, 'open', PChar(PathArchivo) ,nil, nil, SW_SHOWNORMAL);
  except
  	on E: Exception do
    	MsgBox('No se pudo abrir el Archivo.' + ' #13#10' + E.Message, MB_ICONERROR, '');
	end;
end;

procedure TfrmVerAntecedente.CargarAntecedente(aFields: TFields);
begin
  edNroRequerimiento.Text 			:= aFields.FieldByName('nroreq').AsString;
  edEstado.Text 								:= aFields.FieldByName('aceptado').AsString;
  edAreaSrt.Text 								:= aFields.FieldByName('areasrt').AsString;
  edCantidadHojas.Text 					:= aFields.FieldByName('cantidadhojas').AsString;
  edDelegacion.Text 						:= aFields.FieldByName('delegacion').AsString;
  edRechazo.Text 								:= aFields.FieldByName('descripcionrechazo').AsString;
  edRevision.Text 							:= aFields.FieldByName('estadorevision').AsString;
  edFechaAceptado.Text 					:= aFields.FieldByName('FechaAceptado').AsString;
  edFechaDescargo.Text 					:= aFields.FieldByName('FechaDescargo').AsString;
  edFechaGenerado.Text 					:= aFields.FieldByName('FechaGenerado').AsString;
  edFechaProrroga.Text 					:= aFields.FieldByName('fechaprorroga').AsString;
  edFechaRecepcion.Text 				:= aFields.FieldByName('fecharecep').AsString;
  edFechaRespuesta.Text 				:= aFields.FieldByName('fecharespuestatotal').AsString;
  edFechaSRT.Text 							:= aFields.FieldByName('fechasrt').AsString;
  edVencimiento.Text 						:= aFields.FieldByName('FechaVto').AsString;
  edFirmante.Text 							:= aFields.FieldByName('firmantedescargo').AsString;
  edFirmaSRT.Text 							:= aFields.FieldByName('firmasrt').AsString;
  edEstado2.Text 								:= aFields.FieldByName('idestado').AsString;
  edEstadoDescargo.Text 				:= aFields.FieldByName('idestadodescargo').AsString;
  edSectorResponsable.Text 			:= aFields.FieldByName('idsectorresponsable').AsString;
  edImagenRecepcion.Text 				:= aFields.FieldByName('imagenrecepcion').AsString;
  edImgForm.Text 								:= aFields.FieldByName('imgform').AsString;
  edMotivoRechazo.Text 					:= aFields.FieldByName('motivorechazo').AsString;
  edMotivoRespuestaParcial.Text := aFields.FieldByName('motivorespuestaparci').AsString;
  edMotivoSolicitud.Text 	 			:= aFields.FieldByName('motivosolicitudprorr').AsString;
  edNroNota.Text 					 			:= aFields.FieldByName('nronota').AsString;
  edNroSrt.Text 					 			:= aFields.FieldByName('nrosrt').AsString;
  edObservacion.Text 			 			:= aFields.FieldByName('observa').AsString;
  edObservacionSector.Text 			:= aFields.FieldByName('observacionsector').AsString;
  edPedidoProrroga.Text 	 			:= aFields.FieldByName('pedidoformalprorroga').AsString;
  edPlazoEntrega.Text 	 	 			:= aFields.FieldByName('plazodeentrega').AsString;
  edReciboSRT.Text 				 			:= aFields.FieldByName('recibosrt').AsString;
  edReferencia.Text 			 			:= aFields.FieldByName('referencia').AsString;
  edReferente.Text 				 			:= aFields.FieldByName('referente').AsString;
  edRespDescargo.Text 		 			:= aFields.FieldByName('respuestadescargo').AsString;
  edRespParcial.Text 			 			:= aFields.FieldByName('respuestaparcial').AsString;
  edRespWord.Text 				 			:= aFields.FieldByName('restpuestaword').AsString;

  Self.ShowModal;
end;

procedure TfrmVerAntecedente.tbImgFormClick(Sender: TObject);
begin
	if Trim(edImagenRecepcion.Text) <> '' then
  	AbrirArchivo(Trim(edImagenRecepcion.Text));
end;

procedure TfrmVerAntecedente.tbSeleccionImgRecepClick(Sender: TObject);
begin
	if Trim(edImgForm.Text) <> '' then
  	AbrirArchivo(Trim(edImgForm.Text));
end;

procedure TfrmVerAntecedente.tbRespDescargoClick(Sender: TObject);
begin
  if Trim(edRespDescargo.Text) <> '' then
  	AbrirArchivo(Trim(edRespDescargo.Text));
end;

procedure TfrmVerAntecedente.tbRespWordClick(Sender: TObject);
begin
  if Trim(edRespWord.Text) <> '' then
  	AbrirArchivo(Trim(edRespWord.Text));
end;

procedure TfrmVerAntecedente.FormCreate(Sender: TObject);
begin
	pgPrincipal.ActivePageIndex := 0;
end;

end.
