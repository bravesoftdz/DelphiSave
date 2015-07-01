unit unDatosSiniestro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, ExtCtrls, StdCtrls, RxGrdCpt, Db,
  SDEngine;

type
  TfrmDatosSiniestro = class(TForm)
    pnlFondo: TPanel;
    btnSalir: TSpeedButton;
    pnlEmpresa: TPanel;
    lbEmpresa: TLabel;
    pnlCUIT: TPanel;
    pnlContrato: TPanel;
    pnlRSocial: TPanel;
    pnlTrabajador: TPanel;
    lbSinTrabajador: TLabel;
    pnlCUIL: TPanel;
    pnlNombre: TPanel;
    pnlDatosSini: TPanel;
    Siniestro: TLabel;
    pnlSiniestro: TPanel;
    pnlOrden: TPanel;
    pnlRecaida: TPanel;
    lbSinDiagnostico: TLabel;
    pnlDiagnostico: TPanel;
    lbSinTipo: TLabel;
    pnlTipo: TPanel;
    lbSinEstado: TLabel;
    pnlEstado: TPanel;
    lbSinPrestador: TLabel;
    pnlNombrePrestador: TPanel;
    pnlCUITPrestador: TPanel;
    sdqDatos: TSDQuery;
    lbSinFechAcci: TLabel;
    pnlFAccidente: TPanel;
    lbSinRecaida: TLabel;
    pnlFRecaida: TPanel;
    sdqDatosEX_SINIESTRO: TFloatField;
    sdqDatosEX_ORDEN: TFloatField;
    sdqDatosEX_RECAIDA: TFloatField;
    sdqDatosMP_NOMBRE: TStringField;
    sdqDatosEX_CUIT: TStringField;
    sdqDatosTJ_NOMBRE: TStringField;
    sdqDatosEX_CUIL: TStringField;
    sdqDatosEX_FECHAACCIDENTE: TDateTimeField;
    sdqDatosEX_FECHARECAIDA: TDateTimeField;
    sdqDatosEX_ALTAMEDICA: TDateTimeField;
    sdqDatosCA_CLAVE: TStringField;
    sdqDatosCA_DESCRIPCION: TStringField;
    sdqDatosEX_DIAGNOSTICO: TStringField;
    sdqDatosMP_CONTRATO: TFloatField;
    sdqDatosTIPO: TStringField;
    sdqDatosESTADO: TStringField;
    Label1: TLabel;
    sdqDatosEX_BREVEDESCRIPCION: TStringField;
    Panel1: TPanel;
    edDescripcion: TMemo;
    pnlMecanismoAccid: TPanel;
    Label2: TLabel;
    memoMecanismoAccid: TMemo;
    sdqDatosEX_MECANISMOACCID: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalirClick(Sender: TObject);
  public
    procedure ShowDialog(Siniestro, Orden, Recaida: Integer);
  end;

var
  frmDatosSiniestro: TfrmDatosSiniestro;

implementation

uses
  unDmPrincipal, General, unSesion;

{$R *.DFM}

procedure TfrmDatosSiniestro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TfrmDatosSiniestro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDatosSiniestro.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDatosSiniestro.ShowDialog(Siniestro, Orden, Recaida: Integer);
begin
  if CheckStoreProc('SIN') then
  begin
    sdqDatos.ParamByName('pSiniestro').AsInteger := Siniestro;
    sdqDatos.ParamByName('pOrden').AsInteger     := Orden;
    sdqDatos.ParamByName('pRecaida').AsInteger   := Recaida;
    sdqDatos.Open;

    if not sdqDatos.Eof then
    begin
      //---[ Empresa ]----------------------------------------------------------------------------------------------//
      pnlCUIT.Caption     := sdqDatosEX_CUIT.Text;
      pnlContrato.Caption := sdqDatosMP_CONTRATO.Text;
      pnlRSocial.Caption  := ' ' + sdqDatosMP_NOMBRE.Text;

      //---[ Trabajador ]-------------------------------------------------------------------------------------------//
      pnlCUIL.Caption   := sdqDatosEX_CUIL.Text;
      pnlNombre.Caption := ' ' + sdqDatosTJ_NOMBRE.Text;
      
      //---[ Siniestro ]--------------------------------------------------------------------------------------------//
      pnlSiniestro.Caption     := IntToStr(Siniestro);
      pnlOrden.Caption         := IntToStr(Orden);
      pnlRecaida.Caption       := IntToStr(Recaida);
      pnlTipo.Caption          := ' ' + sdqDatosTIPO.Text;
      pnlEstado.Caption        := ' ' + sdqDatosESTADO.Text;
      edDescripcion.Lines.Text := ' ' + sdqDatosEX_BREVEDESCRIPCION.Text;
      memoMecanismoAccid.Text  := ' ' + sdqDatosEX_MECANISMOACCID.Text;           // TK 11018
      pnlFAccidente.Caption    := sdqDatosEX_FECHAACCIDENTE.Text;
      pnlFRecaida.Caption      := sdqDatosEX_FECHARECAIDA.Text;

      //---[ Prestador ]--------------------------------------------------------------------------------------------//
      pnlCUITPrestador.Caption   := sdqDatosCA_CLAVE.Text;
      pnlNombrePrestador.Caption := ' ' + sdqDatosCA_DESCRIPCION.Text;

      if Sesion.Sector = 'CALLCENT' then
        pnlDiagnostico.Caption := ' Información sensible - NO POSEE PERMISO PARA VER ESTE DATO'
      else
        pnlDiagnostico.Caption := ' ' + sdqDatosEX_DIAGNOSTICO.Text;

      //---[ Muestra el Formulario ]--------------------------------------------------------------------------------//
      ShowModal;
    end;
  end
  else
    MsgBox('El paquete "SIN" se encuentra inválido.' + #13 + 'Informe a Sistemas de este Error', MB_ICONERROR);
end;

end.
