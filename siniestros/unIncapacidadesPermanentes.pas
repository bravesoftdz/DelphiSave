unit unIncapacidadesPermanentes;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm,
  ImgList, XPMenu, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Mask, DateComboBox, DB,
  SDEngine, JvExControls, JvComponent, JvXPCore, JvXPButtons, JvXPCheckCtrls, JvXPContainer;

type
  TfrmIncapacidadesPermanentes = class(TfrmCustomForm)
    StaticText1: TStaticText;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    rgGrado: TRadioGroup;
    rgCaracter: TRadioGroup;
    dcbFallecimiento: TDateComboBox;
    Label1: TLabel;
    dbgrid: TDBGrid;
    Panel1: TPanel;
    cePresunto: TCurrencyEdit;
    ceEstimado: TCurrencyEdit;
    ceDeterminado: TCurrencyEdit;
    ceProvisorio: TCurrencyEdit;
    ceDefinitivo: TCurrencyEdit;
    ceSaldo: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dcbPresunto: TDateComboBox;
    Label8: TLabel;
    dcbEstimado: TDateComboBox;
    Label9: TLabel;
    dcbDeterminado: TDateComboBox;
    Label10: TLabel;
    dcbProvisorio: TDateComboBox;
    Label11: TLabel;
    dcbDefinitivo: TDateComboBox;
    Label12: TLabel;
    ceReserva: TCurrencyEdit;
    ceMonto: TCurrencyEdit;
    Label13: TLabel;
    Label14: TLabel;
    dcbReserva: TDateComboBox;
    Label15: TLabel;
    dsDatos: TDataSource;
    sdqDatos: TSDQuery;
    btnCerrar: TJvXPButton;
    checkIncapacidadPermanente: TJvXPCheckbox;
    checkFallecimiento: TJvXPCheckbox;
    checkGranInvalidez: TJvXPCheckbox;
    checkAutorizado: TJvXPCheckbox;
    procedure btnCerrarClick(Sender: TObject);
  private
    procedure CargarIncapacidades(const aExId: Integer);
  public
  	procedure Mostrar(const aIDExpediente: Integer);
  end;

var
  frmIncapacidadesPermanentes: TfrmIncapacidadesPermanentes;

implementation

uses
	AnsiSql, unDmPrincipal, CustomDlgs;

{$R *.dfm}

procedure TfrmIncapacidadesPermanentes.CargarIncapacidades(const aExId: Integer);
var
	sSql: String;
begin
	sSql := 'SELECT * ' +
          '  FROM SEX_EXPEDIENTES, SIN_INCAPACIDSIN ' +
          ' WHERE EX_SINIESTRO = SI_SINIESTRO ' +
          '   AND EX_ORDEN = SI_ORDEN ' +
          '   AND EX_RECAIDA = SI_RECAIDA ' +
          '   AND EX_ID = ' + SqlValue(aExId);

  with GetQuery(sSql) do
  try
  	if IsEmpty then
    	MsgBox('No existe registro de incapacidades para el siniestro actual.', MB_ICONEXCLAMATION)
    else
    begin
    	checkAutorizado.Checked := (FieldByName('si_Autorizado').AsString = 'S');
    	dcbFallecimiento.Date := FieldByName('si_FecAutori').AsDateTime;
      cePresunto.Value := FieldByName('si_PorcPres').AsFloat;
      ceEstimado.Value := FieldByName('SI_PORCEST').AsFloat;
      ceDeterminado.Value := FieldByName('si_PorcDeterm').AsFloat;
      ceProvisorio.Value := FieldByName('si_PorcProvi').AsFloat;
      ceDefinitivo.Value := FieldByName('SI_PORCDEF').AsFloat;
      ceReserva.Value := FieldByName('si_PorcRes').AsFloat;
      ceMonto.Value := FieldByName('si_MontRes').AsFloat;
      dcbPresunto.Date := FieldByName('si_FechPres').AsDateTime;
      dcbEstimado.Date := FieldByName('si_FechEst').AsDateTime;
      dcbDeterminado.Date := FieldByName('si_FechDeterm').AsDateTime;
      dcbProvisorio.Date := FieldByName('si_FechProvi').AsDateTime;
      dcbDefinitivo.Date := FieldByName('si_FechDefi').AsDateTime;
      dcbReserva.Date := FieldByName('si_FechRes').AsDateTime;
      if FieldByName('si_Grado').AsString = 'P' then
      	rgGrado.ItemIndex := 0;
      if FieldByName('si_Grado').AsString = 'T' then
      	rgGrado.ItemIndex := 1;
      if FieldByName('si_Caracter').AsString = 'P' then
      	rgCaracter.ItemIndex := 0;
      if FieldByName('si_Caracter').AsString = 'D' then
      	rgCaracter.ItemIndex := 1;
      checkGranInvalidez.Checked := (FieldByName('si_GranInc').AsString = 'S');
    	checkFallecimiento.Checked := (FieldByName('ex_Gravedad').AsString = '5');
      checkIncapacidadPermanente.Checked := (rgGrado.ItemIndex > -1) or (rgCaracter.ItemIndex > -1);
  	end;
	finally
  	Free;
  end;
end;

procedure TfrmIncapacidadesPermanentes.Mostrar(const aIDExpediente: Integer);
begin
	CargarIncapacidades(aIDExpediente);
  OpenQueryEx(sdqDatos, [aIDExpediente]);
 	ShowModal;
end;

procedure TfrmIncapacidadesPermanentes.btnCerrarClick(Sender: TObject);
begin
	Close;
end;

end.
