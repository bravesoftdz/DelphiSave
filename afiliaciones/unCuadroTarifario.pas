unit unCuadroTarifario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, IntEdit, ExtCtrls, Mask, ToolEdit,
  DateComboBox, unArtFrame, unFraCodigoDescripcion, unfraCtbTablas, unFraActividad, CurrEdit, Db, SDEngine,
  unfraStaticActividad, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unAfiliaciones, PatternEdit, Grids,
  StaticGrid, unArtDbFrame, unFraEmpresa, unFraEmpresaAfi, unFraEmpresaSolicitud, unArtDBAwareFrame, artSeguridad,
  FormPanel;

type
  TfrmCuadroTarifario = class(TForm)
    Panel21: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edSA_FECHAAUTORIZA: TDateComboBox;
    Label3: TLabel;
    edSA_USUARIOAUTORIZA: TEdit;
    Label4: TLabel;
    btGuardar: TButton;
    btSalir: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    lbEstado: TLabel;
    edSA_PORCDESCVOLUMEN: TCurrencyEdit;
    edSA_PORCDESCNIVEL: TCurrencyEdit;
    edSA_RECARGOSIN: TCurrencyEdit;
    edSA_RECARGOSIN_SOBREFIJO: TCurrencyEdit;
    edSAN_RECARGOSIN: TCurrencyEdit;
    edSA_REBAJASIN_MONTOFIJO: TCurrencyEdit;
    edSA_RECARGOESP: TCurrencyEdit;
    edSA_RECARGOESP_SOBREFIJO: TCurrencyEdit;
    edSA_REBAJAESP: TCurrencyEdit;
    edSA_REBAJAESP_SOBREFIJO: TCurrencyEdit;
    edAporteSSN: TCurrencyEdit;
    edSA_SUMAFIJATARIFA: TCurrencyEdit;
    edSUBT1_SUMAFIJA: TCurrencyEdit;
    edCalculo4: TCurrencyEdit;
    edRCSMF: TCurrencyEdit;
    edCalculo4bis: TCurrencyEdit;
    edRBSMF: TCurrencyEdit;
    edCalculo6: TCurrencyEdit;
    edCalculo6bis: TCurrencyEdit;
    edCalculo9: TCurrencyEdit;
    edCalculo11: TCurrencyEdit;
    ed060: TCurrencyEdit;
    edALICUOTAPESOS: TCurrencyEdit;
    edSA_PORCMASATARIFA: TCurrencyEdit;
    edCalculo1: TCurrencyEdit;
    edCalculo2: TCurrencyEdit;
    edSUBT1: TCurrencyEdit;
    edCalculo3: TCurrencyEdit;
    edCalculo3bis: TCurrencyEdit;
    edCalculo5: TCurrencyEdit;
    edCalculo5bis: TCurrencyEdit;
    edCalculo10: TCurrencyEdit;
    edCalculo12: TCurrencyEdit;
    edALICUOTAPORC: TCurrencyEdit;
    Panel25: TPanel;
    IntEdit10: TIntEdit;
    IntEdit11: TIntEdit;
    IntEdit25: TIntEdit;
    IntEdit28: TIntEdit;
    IntEdit31: TIntEdit;
    IntEdit33: TIntEdit;
    IntEdit45: TIntEdit;
    IntEdit46: TIntEdit;
    IntEdit51: TIntEdit;
    IntEdit53: TIntEdit;
    IntEdit3: TIntEdit;
    IntEdit39: TIntEdit;
    IntEdit21: TIntEdit;
    IntEdit22: TIntEdit;
    IntEdit23: TIntEdit;
    IntEdit4: TIntEdit;
    ed9: TIntEdit;
    IntEdit18: TIntEdit;
    IntEdit19: TIntEdit;
    ed12: TIntEdit;
    IntEdit1: TIntEdit;
    Panel26: TPanel;
    IntEdit2: TIntEdit;
    edCalculo7: TCurrencyEdit;
    edCalculo8: TCurrencyEdit;
    IntEdit48: TIntEdit;
    IntEdit49: TIntEdit;
    sdqDatos: TSDQuery;
    fraSA_TIPOTARIFA: TfraStaticCTB_TABLAS;
    fraSA_ESTADO: TfraStaticCTB_TABLAS;
    fraSA_ACTIVIDAD: TfraStaticActividad;
    fraSA_ACTIVIDAD2: TfraStaticActividad;
    Label5: TLabel;
    fraSA_ACTIVIDAD3: TfraStaticActividad;
    Label6: TLabel;
    Bevel1: TBevel;
    gbTarifario: TGroupBox;
    GridTarifario: TStaticGrid;
    btnActualizar: TButton;
    lbNivel: TLabel;
    lbCantEmpleados: TLabel;
    edTOTEMPLEADOS: TIntEdit;
    lbMasaSalarial: TLabel;
    edMASATOTAL: TCurrencyEdit;
    edNIVEL: TIntEdit;
    Panel27: TPanel;
    fraEmpresa: TfraEmpresaSolicitud;
    lbCUIT: TLabel;
    Seguridad: TSeguridad;
    Panel28: TPanel;
    lbObservaciones: TLabel;
    sdspGerValorOnLine: TSDStoredProc;
    lbMotivosNoAprobacion: TLabel;
    fpMotivosNoAprobacion: TFormPanel;
    memoMotivosNoAprobacion: TMemo;
    btnCerrar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btSalirClick(Sender: TObject);
    procedure DoCambio(Sender: TObject);
    procedure DoGuardar();
    procedure DoCambioEstado;
    procedure edSA_SUMAFIJATARIFAExit(Sender: TObject);
    procedure edSA_PORCMASATARIFAExit(Sender: TObject);
    procedure edSA_PORCDESCVOLUMENExit(Sender: TObject);
    procedure edSA_PORCDESCNIVELExit(Sender: TObject);
    procedure edSA_RECARGOSINExit(Sender: TObject);
    procedure edSA_RECARGOSIN_SOBREFIJOExit(Sender: TObject);
    procedure edRCSMFExit(Sender: TObject);
    procedure edSAN_RECARGOSINExit(Sender: TObject);
    procedure edSA_REBAJASIN_MONTOFIJOExit(Sender: TObject);
    procedure edRBSMFExit(Sender: TObject);
    procedure edSA_RECARGOESPExit(Sender: TObject);
    procedure edSA_RECARGOESP_SOBREFIJOExit(Sender: TObject);
    procedure edSA_REBAJAESPExit(Sender: TObject);
    procedure edSA_REBAJAESP_SOBREFIJOExit(Sender: TObject);
    procedure isValidar;
    procedure btGuardarClick(Sender: TObject);
    procedure DoCambioInv (Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure lbMotivosNoAprobacionMouseEnter(Sender: TObject);
    procedure lbMotivosNoAprobacionMouseLeave(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure fpMotivosNoAprobacionKeyPress(Sender: TObject; var Key: Char);
    procedure lbMotivosNoAprobacionClick(Sender: TObject);
  private
    FCambioDeEstado: Boolean;
    FIdSolicitud: Integer;

    function GetCalculo1: Currency;
    function GetCalculo2: Currency;
    function GetCalculo3: Currency;
    function GetCalculo3bis: Currency;
    function GetCalculo4: Currency;
    function GetCalculo4bis: Currency;
    function GetCalculo5: Currency;
    function GetCalculo5bis: Currency;
    function GetCalculo6: Currency;
    function GetCalculo6bis: Currency;
    function GetCalculo7: Currency;
    function GetCalculo8: Currency;
    function GetCalculo9: Currency;
    function GetCalculo10: Currency;
    function GetCalculo11: Currency;
    function GetCalculo12: Currency;
    function GetCalculo13: Currency;
    function GetCalculo14: Currency;

    procedure ActualizaControles(Tarifa: recTarifa);
    procedure CalcularValores;
  public
    procedure DoCargaIDSolicitud(aId: Integer; aHabilitaGuardar: Boolean = True);
  end;


var
  frmCuadroTarifario: TfrmCuadroTarifario;

implementation

uses
  unPrincipal, unDmPrincipal, Numeros, AnsiSQL, SqlFuncs, General, CustomDlgs, unConsultaSolicitud, VCLExtra, unComunes,
  StrFuncs, unArt;

{$R *.DFM}

function TfrmCuadroTarifario.GetCalculo1: Currency;
begin
  Result := RoundNumber((edSA_PORCMASATARIFA.Value * (edSA_PORCDESCVOLUMEN.Value * -1) / 100), 4);
end;

function TfrmCuadroTarifario.GetCalculo2: Currency;
begin
  Result := RoundNumber((edSA_PORCMASATARIFA.Value * (edSA_PORCDESCNIVEL.Value * -1) / 100), 4);
end;

function TfrmCuadroTarifario.GetCalculo3: Currency;
begin
  Result := RoundNumber(edSUBT1.Value * edSA_RECARGOSIN.Value / 100, 4);
end;

function TfrmCuadroTarifario.GetCalculo3bis: Currency;
begin
  Result := RoundNumber(edSUBT1.Value * edSAN_RECARGOSIN.Value * -1 / 100, 4);
end;

function TfrmCuadroTarifario.GetCalculo4: Currency;
begin
  Result := RoundNumber(edSA_SUMAFIJATARIFA.Value * edSA_RECARGOSIN_SOBREFIJO.Value / 100, 2);
end;

function TfrmCuadroTarifario.GetCalculo4bis: Currency;
begin
  Result := RoundNumber(edSA_SUMAFIJATARIFA.Value * edSA_REBAJASIN_MONTOFIJO.Value * -1 / 100, 2);
end;

function TfrmCuadroTarifario.GetCalculo5: Currency;
begin
  Result := RoundNumber(edSUBT1.Value * edSA_RECARGOESP.Value / 100, 4);
end;

function TfrmCuadroTarifario.GetCalculo5bis: Currency;
begin
  Result := RoundNumber(edSUBT1.Value * edSA_REBAJAESP.Value * -1 / 100, 4);
end;

function TfrmCuadroTarifario.GetCalculo6: Currency;
begin
  Result := RoundNumber(edSA_SUMAFIJATARIFA.Value * edSA_RECARGOESP_SOBREFIJO.Value / 100, 2);
end;

function TfrmCuadroTarifario.GetCalculo6bis: Currency;
begin
  Result := RoundNumber(edSA_SUMAFIJATARIFA.Value * edSA_REBAJAESP_SOBREFIJO.Value * -1 / 100, 2);
end;

function TfrmCuadroTarifario.GetCalculo7: Currency;
begin
  if edRCSMF.Value = 0 then
    Result := RoundNumber((edSA_SUMAFIJATARIFA.Value + GetCalculo4 + GetCalculo4bis + (edRBSMF.Value * -1) + GetCalculo6 + GetCalculo6bis), 2)
  else
    Result := RoundNumber((edSA_SUMAFIJATARIFA.Value + GetCalculo4 + GetCalculo4bis + edRCSMF.Value + GetCalculo6 + GetCalculo6bis), 2);
end;

function TfrmCuadroTarifario.GetCalculo8: Currency;
begin
  Result := RoundNumber(edSUBT1.Value + GetCalculo3 + GetCalculo3bis + GetCalculo5 + GetCalculo5bis, 4);
end;

function TfrmCuadroTarifario.GetCalculo9: Currency;
begin
  Result := RoundNumber(GetCalculo7 * edAporteSSN.Value / 100, 2);
end;

function TfrmCuadroTarifario.GetCalculo10: Currency;
begin
  Result := RoundNumber(GetCalculo8 * edAporteSSN.Value / 100, 4);
end;

function TfrmCuadroTarifario.GetCalculo11: Currency;
begin
  Result := RoundNumber(GetCalculo9 + GetCalculo7, 2);
end;

function TfrmCuadroTarifario.GetCalculo12: Currency;
begin
  Result := RoundNumber(GetCalculo10 + GetCalculo8, 3);
end;

function TfrmCuadroTarifario.GetCalculo13: Currency;
begin
  Result := GetCalculo11 + ed060.Value;
end;

function TfrmCuadroTarifario.GetCalculo14: Currency;
begin
  Result := GetCalculo12;
end;

procedure TfrmCuadroTarifario.btSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCuadroTarifario.FormCreate(Sender: TObject);
begin
  inherited;

  fraSA_TIPOTARIFA.Clave := 'TARIF';
  fraSA_ESTADO.Clave := 'ESSOL';
  fraSA_ESTADO.ExtraCondition := ' AND SUBSTR(tb_especial1, 2, 1) = ''S'' ';

  GridTarifario.ColWidths[0] := 168;
  GridTarifario.ColWidths[1] := 54;
  GridTarifario.ColWidths[2] := 54;
  GridTarifario.ColWidths[3] := 84;
end;

procedure TfrmCuadroTarifario.DoCambio(Sender: TObject);
begin
  if (Assigned(ActiveControl) and (ActiveControl.Name <> 'edALICUOTAPESOS') and (ActiveControl.Name <> 'edALICUOTAPORC')) then
    CalcularValores;
end;

procedure TfrmCuadroTarifario.DoCargaIDSolicitud(aId: Integer; aHabilitaGuardar: Boolean = True);
begin
  FIdSolicitud := aId;

  with sdqDatos do
  begin
    ParamByName('iidparam').AsInteger := FIdSolicitud;
    Open;

    if (FieldByName('sa_fechaafiliacion').AsDateTime <= EncodeDate(1998, 7, 1)) then
      edAporteSSN.Value := 0;

    ed060.Value := Get_Trf_Hipoacusia(FieldByName('sa_fechaafiliacion').AsDateTime);

    fraEmpresa.Value := FieldByName('sa_idformulario').AsInteger;
    VCLExtra.LockControls(fraEmpresa, True);

    ///////////////////
    //INDICA QUE SE PUEDE VER Y QUE NO
    ///////////////////
    Panel1.Visible := Seguridad.Claves.IsActive('PermisoVisualizar') or
                      ((FieldByName('sa_estado').AsString <> '1.1') and (FieldByName('sa_estado').AsString <> '2.1'));

    btnActualizar.Enabled := Seguridad.Claves.IsActive('PermisoVisualizar') and
                             Seguridad.Claves.IsActive('PermisoModificar');
    if not aHabilitaGuardar then
    begin
      MsgBox('El estado de la solicitud no permite modificar estos datos.');
      btGuardar.Enabled := False;
    end
    else
      btGuardar.Enabled := Seguridad.Claves.IsActive('PermisoModificar');

    ////////////////////////////////////////////
    //  FIN INDICA QUE SE PUEDE VER Y QUE NO  //
    ////////////////////////////////////////////
    edSA_SUMAFIJATARIFA.Value  := FieldByName('sa_sumafijatarifa').AsCurrency;
    edSA_PORCMASATARIFA.Value  := FieldByName('sa_porcmasatarifa').AsCurrency;
    edSA_PORCDESCVOLUMEN.Value := FieldByName('sa_porcdescvolumen').AsCurrency;
    edSA_PORCDESCNIVEL.Value   := FieldByName('sa_porcdescnivel').AsCurrency;

    if FieldByName('sa_recargosin').AsCurrency > 0 then
      edSA_RECARGOSIN.Value := FieldByName('sa_recargosin').AsCurrency
    else
      edSAN_RECARGOSIN.Value := FieldByName('sa_recargosin').AsCurrency * -1;

    if FieldByName('sa_recargosin_sobrefijo').AsCurrency > 0 then
      edSA_RECARGOSIN_SOBREFIJO.Value := FieldByName('sa_recargosin_sobrefijo').AsCurrency
    else
      edSA_REBAJASIN_MONTOFIJO.Value := FieldByName('sa_recargosin_sobrefijo').AsCurrency * -1;

    if FieldByName('sa_recargosin_montofijo').AsCurrency > 0 then
      edRCSMF.Value := FieldByName('sa_recargosin_montofijo').AsCurrency
    else
      edRBSMF.Value := FieldByName('sa_recargosin_montofijo').AsCurrency * -1;

    if FieldByName('sa_recargoesp').AsCurrency > 0 then
      edSA_RECARGOESP.Value := FieldByName('sa_recargoesp').AsCurrency
    else
      edSA_REBAJAESP.Value := FieldByName('sa_recargoesp').AsCurrency * -1;

    if FieldByName('sa_recargoesp_sobrefijo').AsCurrency > 0 then
      edSA_RECARGOESP_SOBREFIJO.Value := FieldByName('sa_recargoesp_sobrefijo').AsCurrency
    else
      edSA_REBAJAESP_SOBREFIJO.Value := FieldByName('sa_recargoesp_sobrefijo').AsCurrency * -1;

    fraSA_TIPOTARIFA.Value    := FieldByName('sa_tipodetarifa').AsString;
    fraSA_ACTIVIDAD.Value     := FieldByName('sa_idactividad').AsInteger;
    fraSA_ACTIVIDAD2.Value    := FieldByName('sa_idactividad2').AsInteger;
    fraSA_ACTIVIDAD3.Value    := FieldByName('sa_idactividad3').AsInteger;
    fraSA_ESTADO.Value        := FieldByName('sa_estado').AsString;
    edSA_FECHAAUTORIZA.Text   := FieldByName('sa_fechaautoriza').AsString;
    edSA_USUARIOAUTORIZA.Text := FieldByName('sa_usuarioautoriza').AsString;
    edALICUOTAPESOS.Text      := FieldByName('sa_alicuotapesos').AsString;
    edALICUOTAPORC.Text       := FieldByName('sa_alicuotaporc').AsString;
    edTOTEMPLEADOS.Text       := FieldByName('sa_totempleados').AsString;
    edNIVEL.Text              := FieldByName('sa_nivel').AsString;
    edMASATOTAL.Text          := FieldByName('sa_masatotal').AsString;

    DoCambioInv(nil);

    lbMotivosNoAprobacion.Visible := (FieldByName('sa_motivosnoaprobaciontarifa').AsString <> '');
    memoMotivosNoAprobacion.Lines.Text := FieldByName('sa_motivosnoaprobaciontarifa').AsString;
  end;
end;

procedure TfrmCuadroTarifario.DoGuardar;
var
  sSqlTrans: TSql;
  nSA_RECARGOSIN: Currency;
  nSA_RECARGOSIN_SOBREFIJO: Currency;
  nSA_RECARGOESP: Currency;
  nSA_RECARGOESP_SOBREFIJO: Currency;
  nSA_RECARGOSIN_MONTOFIJO: Currency;
begin
  sSqlTrans := TSQL.Create('asa_solicitudafiliacion');

  sSqlTrans.Fields.AddExtended('sa_sumafija',        edCalculo11.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_sumafijatarifa',  edSA_SUMAFIJATARIFA.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_porcmasa',        edCalculo12.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_porcmasatarifa',  edSA_PORCMASATARIFA.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_porcdescvolumen', edSA_PORCDESCVOLUMEN.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_porcdescnivel',   edSA_PORCDESCNIVEL.Value, ALL_DECIMALS, False);

{     if abs( edSA_PORCDESCVOLUMEN.Value ) > 0 then begin
        sSqlTrans.Fields.AddExtended( 'sa_porcdescvolumen', edSA_PORCDESCVOLUMEN.Value*-1 );
     end else begin
        sSqlTrans.Fields.AddExtended( 'sa_porcdescvolumen', edSA_PORCDESCVOLUMEN.Value );
     end;
     if abs( edSA_PORCDESCNIVEL.Value ) > 0 then begin
        sSqlTrans.Fields.AddExtended( 'sa_porcdescnivel', edSA_PORCDESCNIVEL.Value*-1 );
     end else begin
        sSqlTrans.Fields.AddExtended( 'sa_porcdescnivel', edSA_PORCDESCNIVEL.Value );
     end;
}

  if Abs(edSA_RECARGOSIN.Value) > 0 then
    nSA_RECARGOSIN := edSA_RECARGOSIN.Value
  else if Abs(edSAN_RECARGOSIN.Value) > 0 then
    nSA_RECARGOSIN := edSAN_RECARGOSIN.Value * -1
  else
    nSA_RECARGOSIN := 0;
  sSqlTrans.Fields.AddExtended('sa_recargosin', nSA_RECARGOSIN, ALL_DECIMALS, False);

  if Abs(edSA_RECARGOSIN_SOBREFIJO.Value) > 0 then
    nSA_RECARGOSIN_SOBREFIJO := edSA_RECARGOSIN_SOBREFIJO.Value
  else if Abs(edSA_REBAJASIN_MONTOFIJO.Value) > 0 then
    nSA_RECARGOSIN_SOBREFIJO := edSA_REBAJASIN_MONTOFIJO.Value * -1
  else
    nSA_RECARGOSIN_SOBREFIJO := 0;
  sSqlTrans.Fields.AddExtended('sa_recargosin_sobrefijo', nSA_RECARGOSIN_SOBREFIJO, ALL_DECIMALS, False);

  if Abs(edRCSMF.Value) > 0 then
    nSA_RECARGOSIN_MONTOFIJO := edRCSMF.Value
  else if Abs(edRBSMF.Value) > 0 then
    nSA_RECARGOSIN_MONTOFIJO := edRBSMF.Value * -1
  else
    nSA_RECARGOSIN_MONTOFIJO := 0;
  sSqlTrans.Fields.AddExtended('sa_recargosin_montofijo', nSA_RECARGOSIN_MONTOFIJO, ALL_DECIMALS, False);

  if Abs(edSA_RECARGOESP.Value) > 0 then
    nSA_RECARGOESP := edSA_RECARGOESP.Value
  else if Abs(edSA_REBAJAESP.Value) > 0 then
    nSA_RECARGOESP := edSA_REBAJAESP.Value * -1
  else
    nSA_RECARGOESP := 0;
  sSqlTrans.Fields.AddExtended('sa_recargoesp', nSA_RECARGOESP, ALL_DECIMALS, False);

  if Abs(edSA_RECARGOESP_SOBREFIJO.Value) > 0 then
    nSA_RECARGOESP_SOBREFIJO := edSA_RECARGOESP_SOBREFIJO.Value
  else if abs(edSA_REBAJAESP_SOBREFIJO.Value) > 0 then
    nSA_RECARGOESP_SOBREFIJO := edSA_REBAJAESP_SOBREFIJO.Value * -1
  else
    nSA_RECARGOESP_SOBREFIJO := 0;
  sSqlTrans.Fields.AddExtended('sa_recargoesp_sobrefijo', nSA_RECARGOESP_SOBREFIJO, ALL_DECIMALS, False);

  sSqlTrans.Fields.Add('sa_tipodetarifa',          fraSA_TIPOTARIFA.Value);
  sSqlTrans.Fields.Add('sa_idactividad',           fraSA_ACTIVIDAD.Value);
  sSqlTrans.Fields.Add('sa_idactividad2',          fraSA_ACTIVIDAD2.Value);
  sSqlTrans.Fields.Add('sa_idactividad3',          fraSA_ACTIVIDAD3.Value);
  sSqlTrans.Fields.Add('sa_nivel',                 edNIVEL.Value);
  sSqlTrans.Fields.Add('sa_totempleados',          edTOTEMPLEADOS.Value);
  sSqlTrans.Fields.Add('sa_masatotal',             edMASATOTAL.Value);
  sSqlTrans.Fields.AddExtended('sa_alicuotapesos', edALICUOTAPESOS.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_alicuotaporc',  edALICUOTAPORC.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.Add('sa_estado',                fraSA_ESTADO.Value);
  sSqlTrans.Fields.Add('sa_fechaautoriza',        'Actualdate', False);
  sSqlTrans.Fields.Add('sa_usuarioautoriza',       frmPrincipal.DBLogin.UserId);
  sSqlTrans.Fields.Add('sa_fechamodif',           'Actualdate', False);
  sSqlTrans.Fields.Add('sa_usumodif',              frmPrincipal.DBLogin.UserId);

  sSqlTrans.PrimaryKey.Add('sa_id', FIdSolicitud, False);
  sSqlTrans.SqlType := stUpdate;
  try
    EjecutarSQL(sSqlTrans.Sql);
    MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
    if Assigned(frmConsultaSolicitud) then
      frmConsultaSolicitud.tbRefrescar.OnClick(nil);
  finally
    sSqlTrans.Free;
  end;
end;

procedure TfrmCuadroTarifario.DoCambioEstado;
begin
//  if CompareFloat( edSA_SUMAFIJATARIFA.Value, sdqDatos.FieldByName( 'sa_sumafijatarifa' ).asCurrency) <> 0 then begin
//     FCambioDeEstado := True;
//  end;
//
//  if CompareFloat( edSA_PORCMASATARIFA.Value, sdqDatos.FieldByName( 'sa_porcmasatarifa' ).asCurrency ) <> 0 then begin
//     FCambioDeEstado := True;
//  end;

  if CompareFloat(edALICUOTAPESOS.Value, sdqDatos.FieldByName('sa_alicuotapesos').AsCurrency) <> 0 then
    FCambioDeEstado := True;

  if CompareFloat(edALICUOTAPORC.Value, sdqDatos.FieldByName('sa_alicuotaporc').AsCurrency) <> 0 then
    FCambioDeEstado := True;

  if CompareFloat(edSA_PORCDESCVOLUMEN.Value, sdqDatos.FieldByName('sa_porcdescvolumen').AsCurrency) <> 0 then
    FCambioDeEstado := True;

  if CompareFloat(edSA_PORCDESCNIVEL.Value, sdqDatos.FieldByName('sa_porcdescnivel').AsCurrency) <> 0 then
    FCambioDeEstado := True;

  if sdqDatos.FieldByName('sa_recargosin').AsCurrency > 0 then
  begin
    if CompareFloat(edSA_RECARGOSIN.Value, sdqDatos.FieldByName('sa_recargosin').AsCurrency) <> 0 then
      FCambioDeEstado := True;
  end
  else
    if CompareFloat((edSAN_RECARGOSIN.Value * -1), sdqDatos.FieldByName('sa_recargosin').AsCurrency) <> 0 then
      FCambioDeEstado := True;

  if sdqDatos.FieldByName('sa_recargosin_sobrefijo').AsCurrency > 0 then
  begin
    if CompareFloat(edSA_RECARGOSIN_SOBREFIJO.Value, sdqDatos.FieldByName('sa_recargosin_sobrefijo').AsCurrency) <> 0 then
      FCambioDeEstado := True;
  end
  else
    if CompareFloat((edSA_REBAJASIN_MONTOFIJO.Value * -1), sdqDatos.FieldByName('sa_recargosin_sobrefijo').AsCurrency) <> 0 then
      FCambioDeEstado := True;

  if sdqDatos.FieldByName('sa_recargosin_montofijo').AsCurrency > 0 then
  begin
    if CompareFloat(edRCSMF.Value, sdqDatos.FieldByName('sa_recargosin_montofijo').AsCurrency) <> 0 then
      FCambioDeEstado := True;
  end
  else
    if CompareFloat((edRBSMF.Value * -1), sdqDatos.FieldByName('sa_recargosin_montofijo').AsCurrency) <> 0 then
      FCambioDeEstado := True;

  if sdqDatos.FieldByName('sa_recargoesp').AsCurrency > 0 then
  begin
    if CompareFloat(edSA_RECARGOESP.Value, sdqDatos.FieldByName('sa_recargoesp').AsCurrency) <> 0 then
      FCambioDeEstado := True;
  end
  else
    if CompareFloat((edSA_REBAJAESP.Value * -1), sdqDatos.FieldByName('sa_recargoesp').AsCurrency) <> 0 then
      FCambioDeEstado := True;

  if sdqDatos.FieldByName('sa_recargoesp_sobrefijo').AsCurrency > 0 then
  begin
    if CompareFloat(edSA_RECARGOESP_SOBREFIJO.Value, sdqDatos.FieldByName('sa_recargoesp_sobrefijo').AsCurrency) <> 0 then
      FCambioDeEstado := True;
  end
  else
    if CompareFloat((edSA_REBAJAESP_SOBREFIJO.Value * -1), sdqDatos.FieldByName('sa_recargoesp_sobrefijo').AsCurrency) <> 0 then
      FCambioDeEstado := True;
end;

procedure TfrmCuadroTarifario.edSA_SUMAFIJATARIFAExit(Sender: TObject);
begin
  Verificar((edSA_SUMAFIJATARIFA.Value < 0), edSA_SUMAFIJATARIFA, 'El importe de la suma fija debe ser mayor o igual que 0 (cero).');
  Verificar((edSA_SUMAFIJATARIFA.Value > 999999.99), edSA_SUMAFIJATARIFA, 'El importe no puede ser mayor a 999999.99');
end;

procedure TfrmCuadroTarifario.edSA_PORCMASATARIFAExit(Sender: TObject);
begin
  Verificar(((edSA_PORCMASATARIFA.Value < 0) or (edSA_PORCMASATARIFA.Value > 100)), edSA_PORCMASATARIFA, 'La Tarifa debe estar entre 0 y 100.');
end;

procedure TfrmCuadroTarifario.edSA_PORCDESCVOLUMENExit(Sender: TObject);
begin
  Verificar(((edSA_PORCDESCVOLUMEN.Value < 0) or (edSA_PORCDESCVOLUMEN.Value > 100)), edSA_PORCDESCVOLUMEN, 'El descuento de masa salarial debe estar entre 0 y 100.');
end;

procedure TfrmCuadroTarifario.edSA_PORCDESCNIVELExit(Sender: TObject);
begin
  Verificar(((edSA_PORCDESCNIVEL.Value < 0) or (edSA_PORCDESCNIVEL.Value > 100)), edSA_PORCDESCNIVEL, 'El descuento de normas H.S. debe estar entre 0 y 100.');
end;

procedure TfrmCuadroTarifario.edSA_RECARGOSINExit(Sender: TObject);
begin
  Verificar(((edSA_RECARGOSIN.Value < 0) or (edSA_RECARGOSIN.Value > 100)), edSA_RECARGOSIN, 'El recargo por siniestralidad sobre variable debe estar entre 0 y 100.');

  DoCambio(nil);
end;

procedure TfrmCuadroTarifario.edSA_RECARGOSIN_SOBREFIJOExit(Sender: TObject);
begin
  Verificar(((edSA_RECARGOSIN_SOBREFIJO.Value < 0) or (edSA_RECARGOSIN_SOBREFIJO.Value > 100)), edSA_RECARGOSIN_SOBREFIJO, 'El recargo por siniestralidad sobre fijo debe estar entre 0 y 100.');

  DoCambio(nil);
end;

procedure TfrmCuadroTarifario.edRCSMFExit(Sender: TObject);
begin
  Verificar((edRCSMF.Value < 0), edRCSMF, 'El recargo por siniestralidad monto fijo debe ser mayo o igual que 0(cero).');
  Verificar((edRCSMF.Value > 999999.99), edRCSMF, 'El importe no puede ser mayor a 999999.99');

//  DoCambioEstado;
end;

procedure TfrmCuadroTarifario.edSAN_RECARGOSINExit(Sender: TObject);
begin
  Verificar(((edSAN_RECARGOSIN.Value < 0) or (edSAN_RECARGOSIN.Value > 100)), edSAN_RECARGOSIN, 'La rebaja por siniestralidad sobre variable debe estar entre 0 y 100.');

  DoCambio(nil);
end;

procedure TfrmCuadroTarifario.edSA_REBAJASIN_MONTOFIJOExit(Sender: TObject);
begin
  Verificar(((edSA_REBAJASIN_MONTOFIJO.Value < 0) or (edSA_REBAJASIN_MONTOFIJO.Value > 100)), edSA_REBAJASIN_MONTOFIJO, 'La rebaja por siniestralidad sobre fijo debe estar entre 0 y -100.');

  DoCambio(nil);
end;

procedure TfrmCuadroTarifario.edRBSMFExit(Sender: TObject);
begin
  Verificar(((edRBSMF.Value < 0) or (edRBSMF.Value > 100)), edRBSMF, 'La rebaja por siniestralidad monto fijo debe estar entre 0 y -100.');
  Verificar((edRBSMF.Value > 999999.99), edRBSMF, 'El importe no puede ser mayor a 999999.99');
end;

procedure TfrmCuadroTarifario.edSA_RECARGOESPExit(Sender: TObject);
begin
  Verificar(((edSA_RECARGOESP.Value < 0) or (edSA_RECARGOESP.Value > 100)), edSA_RECARGOESP, 'El recargo especial sobre variable debe estar entre 0 y 100.');

  DoCambio(nil);
end;

procedure TfrmCuadroTarifario.edSA_RECARGOESP_SOBREFIJOExit(Sender: TObject);
begin
  Verificar(((edSA_RECARGOESP_SOBREFIJO.Value < 0) or (edSA_RECARGOESP_SOBREFIJO.Value > 100)), edSA_RECARGOESP_SOBREFIJO, 'El recargo especial sobre fijo debe estar entre 0 y 100.');

  DoCambio(nil);
end;

procedure TfrmCuadroTarifario.edSA_REBAJAESPExit(Sender: TObject);
begin
  Verificar(((edSA_REBAJAESP.Value < 0) or (edSA_REBAJAESP.Value > 100)), edSA_REBAJAESP, 'La rebaja especial sobre variable debe estar entre 0 y 100.');

  DoCambio(nil);
end;

procedure TfrmCuadroTarifario.edSA_REBAJAESP_SOBREFIJOExit(Sender: TObject);
begin
  Verificar(((edSA_REBAJAESP_SOBREFIJO.Value < 0) or (edSA_REBAJAESP_SOBREFIJO.Value > 100)), edSA_REBAJAESP_SOBREFIJO, 'La rebaja especial sobre fijo debe estar entre 0 y 100.');

  DoCambio(nil);
end;

procedure TfrmCuadroTarifario.isValidar;
var
  cPorcSSN: Currency;
  cTarSSN: Currency;
  iIdActividad: Integer;
  sFecha: String;
  sNivel: String;
begin
  Verificar((FCambioDeEstado and (fraSA_ESTADO.Value = '2.1')), edTOTEMPLEADOS, 'El estado ''Tarifa Revisada'' no puede seleccionarse si la tarifa ha sido modificada.');
  Verificar((edSA_SUMAFIJATARIFA.Value < 0), edSA_SUMAFIJATARIFA, 'El importe de la suma fija debe ser mayor o igual que 0 (cero).');
  Verificar(((edSA_PORCMASATARIFA.Value < 0) or (edSA_PORCMASATARIFA.Value > 100)), edSA_PORCMASATARIFA, 'La Tarifa debe estar entre 0 y 100.');
  Verificar(((edSA_PORCDESCVOLUMEN.Value < 0) or (edSA_PORCDESCVOLUMEN.Value > 100)), edSA_PORCDESCVOLUMEN, 'El descuento de masa salarial debe estar entre 0 y 100.');
  Verificar(((edSA_PORCDESCNIVEL.Value < 0) or (edSA_PORCDESCNIVEL.Value > 100)), edSA_PORCDESCNIVEL, 'El descuento de normas H.S. debe estar entre 0 y 100.');
  Verificar(((edSA_RECARGOSIN.Value < 0) or (edSA_RECARGOSIN.Value > 100)), edSA_RECARGOSIN, 'El recargo por siniestralidad sobre variable debe estar entre 0 y 100.');
  Verificar((edSA_SUMAFIJATARIFA.Value < 0), edSA_SUMAFIJATARIFA, 'El improte de la suma fija debe ser mayor o igual que 0 (cero).');
  Verificar((edRCSMF.Value < 0), edRCSMF, 'El recarto por siniestrlidad monto fijo debe ser mayo o igual que 0(cero).');
  Verificar(((edSAN_RECARGOSIN.Value < 0) or (edSAN_RECARGOSIN.Value > 100)), edSAN_RECARGOSIN, 'La rebaja por siniestralidad sobre variable debe estar entre 0 y 100.');
  Verificar(((edSA_RECARGOSIN_SOBREFIJO.Value < 0) or (edSA_RECARGOSIN_SOBREFIJO.Value > 100)), edSA_RECARGOSIN_SOBREFIJO, 'La rebaja por siniestralidad sobre fijo debe estar entre 0 y 100.');
  Verificar(((edRBSMF.Value < 0) or (edRBSMF.Value > 100)), edRBSMF, 'La rebaja por siniestralidad monto fijo debe estar entre 0 y 100.');
  Verificar(((edSA_RECARGOESP.Value < 0) or (edSA_RECARGOESP.Value > 100)), edSA_RECARGOESP, 'El recargo especial sobre variable debe estar entre 0 y 100.');
  Verificar(((edSA_RECARGOESP_SOBREFIJO.Value < 0) or (edSA_RECARGOESP_SOBREFIJO.Value > 100)), edSA_RECARGOESP_SOBREFIJO, 'El recargo especial sobre fijo debe estar entre 0 y 100.');
  Verificar(((edSA_REBAJAESP.Value < 0) or (edSA_REBAJAESP.Value > 100)), edSA_REBAJAESP, 'La rebaja especial sobre variable debe estar entre 0 y 100.');
  Verificar(((edSA_REBAJAESP_SOBREFIJO.Value < 0) or (edSA_REBAJAESP_SOBREFIJO.Value > 100)), edSA_REBAJAESP_SOBREFIJO, 'La rebaja especial sobre fijo debe estar entre 0 y 100.');
  Verificar(((Abs(edSA_RECARGOSIN.Value) > 0) and (Abs(edSAN_RECARGOSIN.Value) > 0)), edSA_RECARGOSIN, 'No puede existir recargo y rebaja por siniestralidad sobre variable.');
  Verificar(((Abs(edSA_RECARGOSIN_SOBREFIJO.Value) > 0) and (Abs(edSA_REBAJASIN_MONTOFIJO.Value) > 0)), edSA_RECARGOSIN_SOBREFIJO, 'No puede existir recargo y rebaja por siniestralidad sobre Fijo.');
  Verificar(((Abs(edSA_RECARGOESP.Value) > 0) and (Abs(edSA_REBAJAESP.Value) > 0)), edSA_RECARGOESP, 'No puede existir recargo y rebaja especial sobre variable.');
  Verificar(((Abs(edSA_RECARGOESP_SOBREFIJO.Value) > 0) and (Abs(edSA_REBAJAESP_SOBREFIJO.Value) > 0)), edSA_RECARGOESP_SOBREFIJO, 'No puede existir recargo y rebaja especial sobre fijo.');
  Verificar(((Abs(edRBSMF.Value) > 0) and (Abs(edRCSMF.Value) > 0)), edRCSMF, 'No puede existir recargo y rebaja por siniestralidad sobre Monto fijo.');
  Verificar((fraSA_TIPOTARIFA.IsEmpty), fraSA_TIPOTARIFA, 'El tipo de tarifa no puede quedar en blanco.');
  Verificar(fraSA_ACTIVIDAD.IsEmpty, fraSA_ACTIVIDAD, 'La actividad no puede quedar en blanco.');
  Verificar(fraSA_ESTADO.IsEmpty, fraSA_ESTADO, 'El estado no puede quedar en blanco.');
  Verificar(edNIVEL.IsEmpty, edNIVEL, 'El nivel no puede quedar en blanco.');
  Verificar(((edNIVEL.Value < 1) or (edNIVEL.Value > 4)), edNIVEL, 'El nivel debe encontrarse entre 1 y 4.');
  Verificar(edTOTEMPLEADOS.IsEmpty, edTOTEMPLEADOS, 'La cantidad de empleados no puede quedar en blanco.');
  Verificar((edTOTEMPLEADOS.Value < 0), edTOTEMPLEADOS, 'La cantidad de empleados no puede ser menor que cero.');

  iIdActividad := fraSA_ACTIVIDAD.Value;
  sFecha       := FormatDateTime('dd/mm/yyyy', sdqDatos.FieldByName('sa_fechaafiliacion').AsDateTime);
  sNivel       := sdqDatos.FieldByName('sa_nivel').AsString;
  TarifaSSN(sNivel, iIdActividad, sFecha, cTarSSN, cPorcSSN);
  cTarSSN := cTarSSN * 1.15 + ed060.Value;

  if edALICUOTAPESOS.Value > cTarSSN then
    if not MsgAsk('La tarifa se encuentra por encima del valor dado por la SSN.' + CRLF + '¿ Desea continuar ?') then
      Abort;

  cPorcSSN := cPorcSSN * 1.15;

  if edALICUOTAPORC.Value > cPorcSSN then
    if not MsgAsk('El porcentaje se encuentra por encima del valor dado por la SSN.' + CRLF + '¿ Desea continuar ?') then
      Abort;
end;

procedure TfrmCuadroTarifario.btGuardarClick(Sender: TObject);
begin
  DoCambioEstado;
  isValidar;
  DoGuardar;

  ModalResult := mrOK;
end;

procedure TfrmCuadroTarifario.DoCambioInv(Sender: TObject);
var
  Tarifa: recTarifa;
begin
  Tarifa.FinalPesos         := edALICUOTAPESOS.Value;
  Tarifa.FinalPorc          := edALICUOTAPORC.Value;
  Tarifa.RebajaVolumenVal   := edSA_PORCDESCVOLUMEN.Value;
  Tarifa.RebajaHSVal        := edSA_PORCDESCNIVEL.Value;
  Tarifa.RebajaEspSFijoVal  := edSA_REBAJAESP_SOBREFIJO.Value;
  Tarifa.RecargoEspSFijoVal := edSA_RECARGOESP_SOBREFIJO.Value;
  Tarifa.RebajaSinSFijoVal  := edSA_REBAJASIN_MONTOFIJO.Value;
  Tarifa.RecargoSinSFijoVal := edSA_RECARGOSIN_SOBREFIJO.Value;
  Tarifa.RCSMF              := edRCSMF.Value;
  Tarifa.RBSMF              := edRBSMF.Value;
  Tarifa.RebajaSinVarVal    := edSAN_RECARGOSIN.Value;
  Tarifa.RecargoSinVarVal   := edSA_RECARGOSIN.Value;
  Tarifa.RebajaEspVal       := edSA_REBAJAESP.Value;
  Tarifa.RecargoEspVal      := edSA_RECARGOESP.Value;

  Tarifa.SubTotal3Pesos := Tarifa.FinalPesos - ed060.Value;
  Tarifa.SubTotal3Porc := Tarifa.FinalPorc;

  if SetTarifaInv(Tarifa, ed060.Value, edAporteSSN.Value) then
    //Muestra los resultados en la planilla
    ActualizaControles(Tarifa)
  else
    MessageDlg('Los datos ingresados son incompatibles.', mtError, [mbOK], 0);
end;

procedure TfrmCuadroTarifario.CalcularValores;
begin
  edCalculo1.Value       := GetCalculo1;
  edCalculo2.Value       := GetCalculo2;
  edSUBT1.Value          := edSA_PORCMASATARIFA.Value + GetCalculo1 + GetCalculo2;

  edCalculo3bis.Value    := GetCalculo3bis;
  edCalculo3.Value       := GetCalculo3;
  edCalculo4.Value       := GetCalculo4;
  edCalculo4bis.Value    := GetCalculo4bis;
  edCalculo5.Value       := GetCalculo5;
  edCalculo5bis.Value    := GetCalculo5bis;
  edCalculo6.Value       := GetCalculo6;
  edCalculo6bis.Value    := GetCalculo6bis;

  edCalculo7.Value       := GetCalculo7;
  edCalculo8.Value       := GetCalculo8;
  edCalculo9.Value       := GetCalculo9;
  edCalculo10.Value      := GetCalculo10;
  edCalculo11.Value      := GetCalculo11;
  edCalculo12.Value      := GetCalculo12;
  edALICUOTAPESOS.Value  := GetCalculo13;
  edALICUOTAPORC.Value   := GetCalculo14;
  edSUBT1_SUMAFIJA.Value := edSA_SUMAFIJATARIFA.Value;
end;

procedure TfrmCuadroTarifario.ActualizaControles(Tarifa: recTarifa);
begin
  //Pesos
  edSA_SUMAFIJATARIFA.Value := Tarifa.SumaFijaTarifa;
  edSUBT1_SUMAFIJA.Value    := Tarifa.SubTotalPesos;
  edCalculo4.Value          := Tarifa.RecargoSinSFijoPesos;
  edRCSMF.Value             := Tarifa.RCSMF;
  edCalculo4bis.Value       := Tarifa.RebajaSinSFijoPesos;
  edRBSMF.Value             := Tarifa.RBSMF;
  edCalculo6bis.Value       := Tarifa.RebajaEspSFijoPesos;
  edCalculo6.Value          := Tarifa.RecargoEspSFijoPesos;
  edCalculo7.Value          := Tarifa.SubTotal2Pesos;
  edCalculo9.Value          := Tarifa.AporteSRTPesos;
  edCalculo11.Value         := Tarifa.SubTotal3Pesos;
  edALICUOTAPESOS.Value     := Tarifa.FinalPesos;

  //Porcentajes
  edSUBT1.Value             := Tarifa.SubTotalPorc;
  edCalculo3.Value          := Tarifa.RecargoSinVarPorc;
  edCalculo3bis.Value       := Tarifa.RebajaSinVarPorc;
  edALICUOTAPORC.Value      := Tarifa.FinalPorc;
  edSA_PORCMASATARIFA.Value := Tarifa.PorcMasaTarifa;
  edCalculo1.Value          := Tarifa.RebajaVolumenPorc;
  edCalculo2.Value          := Tarifa.RebajaHSPorc;
  edCalculo12.Value         := Tarifa.SubTotal3Porc;
  edCalculo10.Value         := Tarifa.AporteSRTPorc;
  edCalculo8.Value          := Tarifa.SubTotal2Porc;
  edCalculo5bis.Value       := Tarifa.RebajaEspPorc;
  edCalculo5.Value          := Tarifa.RecargoEspPorc;
end;

procedure TfrmCuadroTarifario.btnActualizarClick(Sender: TObject);
var
  cPorcSSN: Currency;
  cSalarioPromedio: Currency;
  cTarSSN: Currency;
  iCantEmpleados: Integer;
  iIdActividad: Integer;
  sFecha: String;
  sHint: String;
  sNivel: String;
  sUltimaCotizacion: String;
begin
  if fraSA_ACTIVIDAD.IsEmpty then
    raise Exception.Create('Debe ingresar la actividad.');

  iCantEmpleados := edTOTEMPLEADOS.Value;
  iIdActividad   := fraSA_ACTIVIDAD.Value;
  sFecha         := sdqDatos.FieldByName('sa_fechaafiliacion').AsString;
  sNivel         := edNIVEL.Text;
  TarifaSSN(sNivel, iIdActividad, sFecha, cTarSSN, cPorcSSN);
  cTarSSN := cTarSSN + ed060.Value; //Ajusta la suma fija derivada a la SSN
  if iCantEmpleados <> 0  then
    cSalarioPromedio := edMASATOTAL.Value / iCantEmpleados
  else
    cSalarioPromedio := 0;

  sUltimaCotizacion :=
    'SELECT 1, ''Cotización Nº '' || TO_CHAR (co_nrocotizacion) || ''/'' || TO_CHAR (co_orden) || '' ('' || TO_CHAR (tc_fechaalta, ''dd/mm/yyyy'') || '')'' AS co_nrocotizacion,' +
          ' tc_fechaalta, tc_sumafija, tc_porcvariable, tc_costofinal, tc_usualta, co_idactividad, co_nivel' +
     ' FROM atc_tarifacobrar, aco_cotizacion' +
    ' WHERE tc_idcotizacion = co_id' +
      ' AND co_cuit = :cuit' +
      ' AND tc_id = (SELECT MAX (atc.tc_id)' +
                     ' FROM atc_tarifacobrar atc' +
                    ' WHERE atc.tc_idcotizacion = co_id)' +
    ' UNION' +
   ' SELECT 1, ''Autocotización ('' || TO_CHAR (sc_fechaalta, ''dd/mm/yyyy'') || '')'', sc_fechaalta, sc_finalsumafija,' +
          ' sc_finalporcmasa, sc_finalportrabajador, sc_usualta, sc_idactividad, TO_NUMBER (-1)' +
     ' FROM asc_solicitudcotizacion' +
    ' WHERE sc_cuit = :cuit' +
      ' AND sc_idcotizacion IS NULL' +
      ' AND ((sc_finalsumafija IS NOT NULL) AND (sc_finalsumafija > 0))' +
    ' UNION' +
   ' SELECT 2, ''Reafiliación Nº '' || TO_CHAR (sr_nrosolicitud) || '' ('' || TO_CHAR (sr_fechamodif, ''dd/mm/yyyy'') || '')'',' +
          ' sr_fechamodif, sr_costofijocotizado, sr_porcentajevariablecotizado, sr_costofinalcotizado, sr_usumodif,' +
          ' sr_idactividad1, TO_NUMBER (-1)' +
     ' FROM asr_solicitudreafiliacion' +
    ' WHERE sr_cuit = :cuit' +
      ' AND sr_idmotivosolicitud = 9' +
      ' AND sr_idmotivocotizacion = 61' +
 ' ORDER BY 3 DESC, 1';
  with GetQueryEx(sUltimaCotizacion, [fraEmpresa.mskCUIT.Text, fraEmpresa.mskCUIT.Text]) do
  try
    if not IsEmpty then
    begin
      First;
      GridTarifario.RowCount := 3 + RecordCount;

      while not Eof do
      begin
        GridTarifario.Cells[0,3 + RecNo] := FieldByName('co_nrocotizacion').AsString;
        GridTarifario.Cells[1,3 + RecNo] := '$ ' + ToStr(FieldByName('tc_sumafija').AsFloat, 2);
        GridTarifario.Cells[2,3 + RecNo] := '% ' + ToStr(FieldByName('tc_porcvariable').AsFloat, 3);
        GridTarifario.Cells[3,3 + RecNo] := '$ ' + ToStr(FieldByName('tc_costofinal').AsFloat, 2);

        lbObservaciones.Hint := '';
        sHint                := '';

        if fraSA_ACTIVIDAD.Value <> FieldByName('co_idactividad').AsInteger then
          sHint := '- La actividad de la cotización difiere de la solicitud.';

        if edNIVEL.Value <> FieldByName('co_nivel').AsInteger then
          sHint := sHint + IIF(sHint > '', #10+#13, '') + '- El nivel de la cotización difiere de la solicitud.';

        if sHint > '' then
        begin
          lbObservaciones.Show;
          lbObservaciones.Hint := sHint;
        end
        else
        begin
          lbObservaciones.Hide;
          lbObservaciones.Hint := '';
        end;

        Next;
      end;
    end
    else
    begin
      GridTarifario.RowCount := 4;
      GridTarifario.Cells[0,3] := 'Sin cotizaciones';
      GridTarifario.Cells[1,3] := '-';
      GridTarifario.Cells[2,3] := '-';
      GridTarifario.Cells[3,3] := '-';
    end;
  finally
    Free;
  end;

  // Carga el tarifario de la ssn
  GridTarifario.Cells[1, 1] := '$ ' + ToStr(cTarSSN, 2);
  GridTarifario.Cells[2, 1] := '% ' + ToStr(cPorcSSN, 3);

  if cSalarioPromedio <> 0 then
    GridTarifario.Cells[3, 1] := '$ ' + ToStr(cTarSSN + cPorcSSN * cSalarioPromedio / 100, 2)
  else
    GridTarifario.Cells[3, 1] := '-';

  // Carga el tarifario comercial
  with sdspGerValorOnLine do
  begin
    ParamByName('nid_ciiu').Value             := iIdActividad;
    ParamByName('nmasa_salarial').AsFloat     := edMASATOTAL.Value;
    ParamByName('ncant_trabajador').AsInteger := iCantEmpleados;

    ExecProc;

    GridTarifario.Cells[1, 2] := '$ ' + ToStr(ParamByName('nsuma_fija').AsFloat, 2);
    GridTarifario.Cells[2, 2] := '% ' + ToStr(ParamByName('nvariable').AsFloat, 3);
    GridTarifario.Cells[3, 2] := '$ ' + ToStr(ParamByName('ncosto_capitas').AsFloat, 2)
  end;
end;

procedure TfrmCuadroTarifario.lbMotivosNoAprobacionMouseEnter(Sender: TObject);
begin
  lbMotivosNoAprobacion.Font.Color := clBlue;
end;

procedure TfrmCuadroTarifario.lbMotivosNoAprobacionMouseLeave(Sender: TObject);
begin
  lbMotivosNoAprobacion.Font.Color := clWindowText;
end;

procedure TfrmCuadroTarifario.btnCerrarClick(Sender: TObject);
begin
  fpMotivosNoAprobacion.Close;
end;

procedure TfrmCuadroTarifario.fpMotivosNoAprobacionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    btnCerrarClick(nil);
end;

procedure TfrmCuadroTarifario.lbMotivosNoAprobacionClick(Sender: TObject);
begin
  fpMotivosNoAprobacion.ShowModal;
end;

end.
