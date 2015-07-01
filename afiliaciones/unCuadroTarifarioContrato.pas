unit unCuadroTarifarioContrato;

{
  INFORMACION DE LA UNIDAD
  AUTOR:               MARTIN LEFEBVRE
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, IntEdit, ExtCtrls, Mask, ToolEdit, DateComboBox, unArtFrame,
  unFraCodigoDescripcion, unfraCtbTablas, unFraActividad, CurrEdit, Db, SDEngine, unFraStaticCodigoDescripcion, unfraStaticActividad, unFraStaticCTB_TABLAS,
  unFraUsuario, ComCtrls, PatternEdit, unAfiliaciones, ToolWin, ShortCutControl, unArt, unArtDBAwareFrame, artSeguridad, unFraCodDesc, DateUtils,
  RxToolEdit, RxCurrEdit;

type
  TfrmContratoTarifa = class(TForm)
    sdqDatos: TSDQuery;
    ShortCutControl: TShortCutControl;
    Seguridad: TSeguridad;
    pnlPCP: TPanel;
    Label40: TLabel;
    GroupBox1: TGroupBox;
    Bevel3: TBevel;
    Label33: TLabel;
    Label34: TLabel;
    Label14: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    edCantTrabMenosDe12: TIntEdit;
    edCantTrabDe12a16: TIntEdit;
    edCantTrabMasDe16: TIntEdit;
    edAlicuotaMenosDe12: TCurrencyEdit;
    edAlicuotaDe12a16: TCurrencyEdit;
    edAlicuotaMasDe16: TCurrencyEdit;
    edAlicuota: TCurrencyEdit;
    edValorMenosDe12: TCurrencyEdit;
    edValorDesde12a16: TCurrencyEdit;
    edValorMasDe16: TCurrencyEdit;
    pnlCuadroTarifario: TPanel;
    Panel1: TPanel;
    IntEdit49: TIntEdit;
    IntEdit48: TIntEdit;
    edCalculo8: TCurrencyEdit;
    edCalculo7: TCurrencyEdit;
    IntEdit2: TIntEdit;
    IntEdit1: TIntEdit;
    ed12: TIntEdit;
    IntEdit19: TIntEdit;
    IntEdit18: TIntEdit;
    ed9: TIntEdit;
    IntEdit4: TIntEdit;
    IntEdit23: TIntEdit;
    IntEdit21: TIntEdit;
    IntEdit39: TIntEdit;
    IntEdit3: TIntEdit;
    IntEdit53: TIntEdit;
    IntEdit51: TIntEdit;
    IntEdit46: TIntEdit;
    IntEdit45: TIntEdit;
    IntEdit33: TIntEdit;
    IntEdit31: TIntEdit;
    IntEdit28: TIntEdit;
    IntEdit25: TIntEdit;
    IntEdit11: TIntEdit;
    IntEdit10: TIntEdit;
    edALICUOTAPORC: TCurrencyEdit;
    edCalculo12: TCurrencyEdit;
    edCalculo10: TCurrencyEdit;
    edCalculo5bis: TCurrencyEdit;
    edCalculo5: TCurrencyEdit;
    edCalculo3bis: TCurrencyEdit;
    edCalculo3: TCurrencyEdit;
    edSUBT1: TCurrencyEdit;
    edCalculo2: TCurrencyEdit;
    edCalculo1: TCurrencyEdit;
    edTC_PORCMASATARIFA: TCurrencyEdit;
    edALICUOTAPESOS: TCurrencyEdit;
    ed060: TCurrencyEdit;
    edCalculo11: TCurrencyEdit;
    edCalculo9: TCurrencyEdit;
    edCalculo6bis: TCurrencyEdit;
    edCalculo6: TCurrencyEdit;
    edRBSMF: TCurrencyEdit;
    edCalculo4bis: TCurrencyEdit;
    edRCSMF: TCurrencyEdit;
    edCalculo4: TCurrencyEdit;
    edSUBT1_SUMAFIJA: TCurrencyEdit;
    edTC_SUMAFIJATARIFA: TCurrencyEdit;
    edAporteSSN: TCurrencyEdit;
    edTC_REBAJAESP_SOBREFIJO: TCurrencyEdit;
    edTC_REBAJAESP: TCurrencyEdit;
    edTC_RECARGOESP_SOBREFIJO: TCurrencyEdit;
    edTC_RECARGOESP: TCurrencyEdit;
    edTC_REBAJASIN_MONTOFIJO: TCurrencyEdit;
    edSAN_RECARGOSIN: TCurrencyEdit;
    edTC_RECARGOSIN_SOBREFIJO: TCurrencyEdit;
    edTC_RECARGOSIN: TCurrencyEdit;
    edTC_PORCDESCNIVEL: TCurrencyEdit;
    edTC_PORCDESCVOLUMEN: TCurrencyEdit;
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
    Panel25: TPanel;
    Panel26: TPanel;
    IntEdit22: TIntEdit;
    Panel27: TPanel;
    IntEdit5: TIntEdit;
    edResolucion529Fijo: TCurrencyEdit;
    edResolucion529Variable: TCurrencyEdit;
    Panel21: TPanel;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label13: TLabel;
    edNIVEL: TPatternEdit;
    fraEN_MOTIVO: TfraStaticCTB_TABLAS;
    fraTC_ACTIVIDAD: TfraStaticActividad;
    fraTC_ACTIVIDAD2: TfraStaticActividad;
    fraTC_ACTIVIDAD3: TfraStaticActividad;
    cmbTC_VIGENCIATARIFA: TDateComboBox;
    edTC_FECHAAUTORIZA: TDateComboBox;
    cbEN_ENVIOCARTA: TCheckBox;
    cbEN_ENVIOSRT: TCheckBox;
    cbEN_ENDOSOAUTOMATICO: TCheckBox;
    edTC_FECHAALTA: TDateComboBox;
    fraTC_USUALTA: TfraUsuarios;
    tbHerramientas: TToolBar;
    tbPrimero: TToolButton;
    tbAnterior: TToolButton;
    tbSiguiente: TToolButton;
    tbUltimo: TToolButton;
    ToolBu5: TToolButton;
    Label35: TLabel;
    edtbEndoso: TEdit;
    ToolButton2: TToolButton;
    tbNuevo: TToolButton;
    tbGuardar: TToolButton;
    tbCartaDoc: TToolButton;
    tbSalir: TToolButton;
    gbAdvertencia: TGroupBox;
    lbTarifaPendiente: TLabel;
    fraTC_USUARIOAUTORIZA: TfraCodDesc;
    fraTC_USUARIOAUTORIZA_ALTA: TfraCodDesc;
    edVigenciaDesde: TDateComboBox;
    edVigenciaHasta: TDateComboBox;
    edEndosoTarifario: TIntEdit;
    procedure FormCreate(Sender: TObject);
    procedure DoCambio(Sender: TObject);
    procedure DoGuardar;
    procedure edTC_SUMAFIJATARIFAExit(Sender: TObject);
    procedure edTC_PORCMASATARIFAExit(Sender: TObject);
    procedure edTC_PORCDESCVOLUMENExit(Sender: TObject);
    procedure edTC_PORCDESCNIVELExit(Sender: TObject);
    procedure edTC_RECARGOSINExit(Sender: TObject);
    procedure edTC_RECARGOSIN_SOBREFIJOExit(Sender: TObject);
    procedure edRCSMFExit(Sender: TObject);
    procedure edSAN_RECARGOSINExit(Sender: TObject);
    procedure edTC_REBAJASIN_MONTOFIJOExit(Sender: TObject);
    procedure edRBSMFExit(Sender: TObject);
    procedure edTC_RECARGOESPExit(Sender: TObject);
    procedure edTC_RECARGOESP_SOBREFIJOExit(Sender: TObject);
    procedure edTC_REBAJAESPExit(Sender: TObject);
    procedure edTC_REBAJAESP_SOBREFIJOExit(Sender: TObject);
    procedure DoCambioInv(Sender: TObject);
    procedure tbPrimeroClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbSiguienteClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure ActualizarVigenciaTarifa(Sender: TObject);
    procedure tbCartaDocClick(Sender: TObject);
    procedure lbTarifaPendienteClick(Sender: TObject);
    procedure edResolucion529VariableExit(Sender: TObject);
    procedure edCantTrabMenosDe12Exit(Sender: TObject);
    procedure edCantTrabDe12a16Exit(Sender: TObject);
    procedure edCantTrabMasDe16Exit(Sender: TObject);
  private
    FActualizarControles: Boolean;
    FContrato: TTableId;
    FEsEndosoTemporal: Boolean;
    FIdEndoso: TTableId;
    FRecalcular: Boolean;
    FEsPCP : Boolean;
    FIdFormulario : TTableId;
    FIdEndosoTarifario : TTableId;

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
    function GetIdRenglonPCP(const aRenglon: Integer): Integer;
    function isValidar: Boolean;

    procedure ActualizaControles(Tarifa: recTarifa);
    procedure CalcularValores;
    procedure CargarControles(sSql: String; const Tmp, aActualizarVigencia: Boolean);
    procedure CargarDatosHistoricos(aIdContrato, aIdEndoso: TTableId);
    procedure CargarListaEndosos(aIdContrato, aIdEndoso: TTableId);
    procedure ClearControles;
    procedure DisableEditControls;
    procedure fraEN_MOTIVOChange(Sender: TObject);
    procedure LockearControles(Valor: Boolean);
    procedure CargarDatosPCP(const aContrato: Integer);
    procedure CalcularCostosPCP;
    procedure CargaValoresDeHoraPCP;
    procedure GuardarCostosPCP;
    procedure CargarDatosEndosoTarifario(const aIdEndosoTarifario: TTableId);
  public
    procedure DoCargarDatos(const aContrato: TTableId; const aIdEndosoTemp: TTableId = ART_EMPTY_ID);
    procedure DoConfirmarEndosoTarifario(const aContrato, aIdEndosoTarifario, aIdEndosoTemp: TTableId);
  end;

var
  frmContratoTarifa: TfrmContratoTarifa;

implementation

uses
  unPrincipal, unDmPrincipal, Numeros, AnsiSQL, SqlFuncs, General, CustomDlgs, VCLExtra,
  {$IFNDEF SUSCRIPCIONES}unAfiGeneracionCartas, unConfirmaTarifa, {$ENDIF}Periodo, unComunes, Math, DateTimeFuncs, unSesion;

var
  ListaEndosos: TStringlist;

{$R *.DFM}

function TfrmContratoTarifa.GetCalculo1: Currency;
begin
  Result := RoundNumber((edTC_PORCMASATARIFA.Value * (edTC_PORCDESCVOLUMEN.Value * -1) / 100), 4);
end;

function TfrmContratoTarifa.GetCalculo2: Currency;
begin
  Result := RoundNumber((edTC_PORCMASATARIFA.Value * (edTC_PORCDESCNIVEL.Value * -1) / 100), 4);
end;

function TfrmContratoTarifa.GetCalculo3: Currency;
begin
  Result := RoundNumber(edSUBT1.Value * edTC_RECARGOSIN.Value / 100, 4);
end;

function TfrmContratoTarifa.GetCalculo3bis: Currency;
begin
  Result := RoundNumber(edSUBT1.Value * edSAN_RECARGOSIN.Value * -1 / 100, 4);
end;

function TfrmContratoTarifa.GetCalculo4: Currency;
begin
  Result := RoundNumber(edTC_SUMAFIJATARIFA.Value * edTC_RECARGOSIN_SOBREFIJO.Value / 100, 2);
end;

function TfrmContratoTarifa.GetCalculo4bis: Currency;
begin
  Result := RoundNumber(edTC_SUMAFIJATARIFA.Value * edTC_REBAJASIN_MONTOFIJO.Value * -1 / 100, 2);
end;

function TfrmContratoTarifa.GetCalculo5: Currency;
begin
  Result := RoundNumber(edSUBT1.Value * edTC_RECARGOESP.Value / 100, 4);
end;

function TfrmContratoTarifa.GetCalculo5bis: Currency;
begin
  Result := RoundNumber(edSUBT1.Value * edTC_REBAJAESP.Value * -1 / 100, 4);
end;

function TfrmContratoTarifa.GetCalculo6: Currency;
begin
  Result := RoundNumber(edTC_SUMAFIJATARIFA.Value * edTC_RECARGOESP_SOBREFIJO.Value / 100, 2);
end;

function TfrmContratoTarifa.GetCalculo6bis: Currency;
begin
  Result := RoundNumber(edTC_SUMAFIJATARIFA.Value * edTC_REBAJAESP_SOBREFIJO.Value * -1 / 100, 2);
end;

function TfrmContratoTarifa.GetCalculo7: Currency;
begin
  if edRCSMF.Value = 0 then
    Result := RoundNumber((edTC_SUMAFIJATARIFA.Value + GetCalculo4 + GetCalculo4bis + (edRBSMF.Value * -1) +
              GetCalculo6 + GetCalculo6bis), 2)
  else
    Result := RoundNumber((edTC_SUMAFIJATARIFA.Value + GetCalculo4 + GetCalculo4bis + edRCSMF.Value + GetCalculo6 +
              GetCalculo6bis), 2);
end;

function TfrmContratoTarifa.GetCalculo8: Currency;
begin
  Result := RoundNumber(edSUBT1.Value + GetCalculo3 + GetCalculo3bis + GetCalculo5 + GetCalculo5bis, 4);
end;

function TfrmContratoTarifa.GetCalculo9: Currency;
begin
  Result := RoundNumber(GetCalculo7 * edAporteSSN.Value / 100, 2);
end;

function TfrmContratoTarifa.GetIdRenglonPCP(const aRenglon: Integer): Integer;
var
  sSql : String;
begin
  sSql := 'SELECT pp_id ' +
          '  FROM afi.app_parametro_pcp ' +
          ' WHERE pp_renglon = :renglon ';

  Result := ValorSqlIntegerEx(sSql, [aRenglon], -1);
end;

procedure TfrmContratoTarifa.GuardarCostosPCP;
var
  aSql: TSQL;
  sSql : String;
  idAlicuota, I : Integer;

begin
  sSql :=
      'SELECT ap_id' +
      '  FROM afi.aap_alicuotas_pcp' +
      ' WHERE ap_contrato = :id' +
      '  AND  ap_idparametro_pcp =(SELECT pp_id ' +
                                    '  FROM afi.app_parametro_pcp ' +
                                    ' WHERE pp_renglon = :param)';
  BeginTrans;
  aSql := TSQL.Create('afi.aap_alicuotas_pcp');
  try
    try
      for I := 1 to 3 do
      begin
        idAlicuota := ValorSqlIntegerEx(sSql, [FContrato, I], -1);

        aSql.Clear;
        if idAlicuota = -1 then
        begin
          aSql.SqlType := stInsert;
          aSql.Fields.Add('ap_usualta',   Sesion.UserID);
          aSql.Fields.Add('ap_fechaalta', SQL_DATETIME, False);
        end
        else
        begin
          aSql.SqlType := stUpdate;
          aSql.PrimaryKey.Add('ap_id',         idAlicuota);
          aSql.Fields.Add('ap_fechamodif', SQL_DATETIME, False);
          aSql.Fields.Add('ap_usumodif',   Sesion.UserID);
        end;
        aSql.Fields.Add('ap_idformulario',   FIdFormulario);
        aSql.Fields.Add('ap_idparametro_pcp',    GetIdRenglonPCP(I));
        aSql.Fields.Add('ap_contrato',    FContrato);
        case I of
          1:
          begin
            aSql.Fields.Add('ap_alicuota',    edAlicuotaMenosDe12.Value);
            aSql.Fields.Add('ap_canttrabajador',    edCantTrabMenosDe12.Value);
          end;
          2:
          begin
            aSql.Fields.Add('ap_alicuota',    edAlicuotaDe12a16.Value);
            aSql.Fields.Add('ap_canttrabajador',    edCantTrabDe12a16.Value);
          end;
          3:
          begin
            aSql.Fields.Add('ap_alicuota',    edAlicuotaMasDe16.Value);
            aSql.Fields.Add('ap_canttrabajador',    edCantTrabMasDe16.Value);
          end;
        end;
        EjecutarSqlST(aSql.Sql);
      end;
      CommitTrans;
    except
      Rollback;
    end;
  finally
    aSql.Free;
  end;
end;

function TfrmContratoTarifa.GetCalculo10: Currency;
begin
  Result := RoundNumber(GetCalculo8 * edAporteSSN.Value / 100, 4);
end;

function TfrmContratoTarifa.GetCalculo11: Currency;
begin
  Result := RoundNumber(GetCalculo9 + GetCalculo7, 2);
end;

function TfrmContratoTarifa.GetCalculo12: Currency;
begin
  Result := RoundNumber(GetCalculo10 + GetCalculo8, 3);
end;

function TfrmContratoTarifa.GetCalculo13: Currency;
begin
  Result := GetCalculo11 + edResolucion529Fijo.Value + ed060.Value;
end;

function TfrmContratoTarifa.GetCalculo14: Currency;
begin
  Result := GetCalculo12 + edResolucion529Variable.Value;
end;


procedure TfrmContratoTarifa.ActualizaControles(Tarifa: recTarifa);
var
  cPorcVarSSN: Currency;
  cSumaFijaSSN: Currency;
  sSql: String;
begin
  if edNivel.Text = '0' then
  begin
    raise Exception.Create('El nivel debe ser diferente de 0 para cargar la tarifa');
    FRecalcular :=  True;
    Exit;
  end;
  FRecalcular := False;
  try
    sSql :=
      'SELECT   ' + SqlString('ts_tarifa' + edNIVEL.Text) + ' sumafija, ' + SqlString('ts_porce' + edNIVEL.Text) + ' porcvar' +
         ' FROM ats_tarifassn, cac_actividad' +
        ' WHERE ts_idactividad = ac_id' +
          ' AND ac_codigo = ' + SqlValue(fraTC_ACTIVIDAD.Codigo) +
          ' AND ACTUALDATE BETWEEN ts_fechadesde AND nvl(ts_fechahasta, to_date(''01/01/2099'', ''dd/mm/yyyy''))' +
          ' AND ts_fechabaja IS NULL' +
     ' ORDER BY ts_fechadesde';
    with GetQuery(sSql) do
    try
      cPorcVarSSN  := FieldByName('porcvar').AsCurrency;
      cSumaFijaSSN := FieldByName('sumafija').AsCurrency;
    finally
      Free;
    end;


    //Pesos
    edTC_SUMAFIJATARIFA.Value := Tarifa.SumaFijaTarifa;
    edSUBT1_SUMAFIJA.Value    := Tarifa.SubTotalPesos;
    edCalculo4.Value          := Tarifa.RecargoSinSFijoPesos;
    edRCSMF.Value             := Tarifa.RCSMF;
    edCalculo4bis.Value       := Tarifa.RebajaSinSFijoPesos;
    edRBSMF.Value             := Tarifa.RBSMF;
    edCalculo6bis.Value       := Tarifa.RebajaEspSFijoPesos;
    edCalculo6.Value          := Tarifa.RecargoEspSFijoPesos;
    edCalculo7.Value          := Tarifa.SubTotal2Pesos;
    edCalculo9.Value          := Tarifa.AporteSRTPesos;
//    edCalculo11.Value         := Tarifa.SubTotal3Pesos;

    //Porcentajes
    edSUBT1.Value                 := Tarifa.SubTotalPorc;
    edCalculo3.Value              := Tarifa.RecargoSinVarPorc;
    edCalculo3bis.Value           := Tarifa.RebajaSinVarPorc;
    edTC_PORCMASATARIFA.Value     := Tarifa.PorcMasaTarifa;
    edCalculo1.Value              := Tarifa.RebajaVolumenPorc;
    edCalculo2.Value              := Tarifa.RebajaHSPorc;
//    edCalculo12.Value             := Tarifa.SubTotal3Porc;
    edCalculo10.Value             := Tarifa.AporteSRTPorc;
    edCalculo8.Value              := Tarifa.SubTotal2Porc;
    edCalculo5bis.Value           := Tarifa.RebajaEspPorc;
    edCalculo5.Value              := Tarifa.RecargoEspPorc;


    if (fraEN_MOTIVO.Value = '03.01') or (fraEN_MOTIVO.Value = '03.02') then
    begin
      if (edCalculo11.Value * 1.5) > (cSumaFijaSSN * 1.15) then
      begin
        edALICUOTAPESOS.Value := edCalculo11.Value;
        edResolucion529Fijo.Value := (cSumaFijaSSN * 1.15) - edCalculo11.Value;
      end
      else
      begin
        edALICUOTAPESOS.Value := edCalculo11.Value;
        edResolucion529Fijo.Value := edCalculo11.Value * 0.5;
      end;

      if (edCalculo12.Value * 1.5) > (cPorcVarSSN * 1.15) then
      begin
        edALICUOTAPORC.Value := edCalculo12.Value;
        edResolucion529Variable.Value := (cPorcVarSSN * 1.15) - edCalculo12.Value;
      end
      else
      begin
        edALICUOTAPORC.Value := edCalculo12.Value;
        edResolucion529Variable.Value := edCalculo12.Value * 0.5;
      end;
    end;

    if edResolucion529Fijo.Value < 0 then
      edResolucion529Fijo.Value := 0;
    if edResolucion529Variable.Value < 0 then
      edResolucion529Variable.Value := 0;

    edALICUOTAPESOS.Value := edCalculo11.Value + edResolucion529Fijo.Value + ed060.Value;
    edALICUOTAPORC.Value  := edCalculo12.Value + edResolucion529Variable.Value;
  finally
    FRecalcular := True;
  end;
end;

procedure TfrmContratoTarifa.ActualizarVigenciaTarifa(Sender: TObject);
var
  dFecha: TDateTime;
begin
  if cmbTC_VIGENCIATARIFA.IsValid then
  begin
    dFecha := Nvl(cmbTC_VIGENCIATARIFA.Date, DBDate);

    ed060.Value       := Get_Trf_Hipoacusia(dFecha);
    edAporteSSN.Value := Get_Trf_PorcAporteSSN(dFecha);

    CalcularValores;
  end;
end;

procedure TfrmContratoTarifa.CalcularCostosPCP;
begin
  edAlicuotaMenosDe12.Value := edValorMenosDe12.Value * edCantTrabMenosDe12.Value;
  edAlicuotaDe12a16.Value   := edValorDesde12a16.Value * edCantTrabDe12a16.Value;
  edAlicuotaMasDe16.Value   := edValorMasDe16.Value * edCantTrabMasDe16.Value;

  edAlicuota.Value := edAlicuotaMenosDe12.Value + edAlicuotaDe12a16.Value + edAlicuotaMasDe16.Value;
end;

procedure TfrmContratoTarifa.CalcularValores;
begin
  edCalculo1.Value       := GetCalculo1;
  edCalculo2.Value       := GetCalculo2;
  edSUBT1.Value          := edTC_PORCMASATARIFA.Value + GetCalculo1 + GetCalculo2;

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
//  edCalculo11.Value      := GetCalculo11;
//  edCalculo12.Value      := GetCalculo12;
  edALICUOTAPESOS.Value  := GetCalculo13;
  edALICUOTAPORC.Value   := GetCalculo14;
  edSUBT1_SUMAFIJA.Value := edTC_SUMAFIJATARIFA.Value;
end;

procedure TfrmContratoTarifa.CargarDatosEndosoTarifario(
  const aIdEndosoTarifario: TTableId);
var
  sSql : String;
  aQuery : TSDQuery;
  SubTotal, SubTotalPorc :  Currency;
begin
  sSql :=
        ' SELECT et_id, et_nrorevprecios, et_fecharevprecios, et_contrato, et_sector, et_comunica, ' +
        '   et_vigenciatarifa, et_endosoautom, et_firmado, et_entregamano, et_usupedido, et_fechapedido, ' +
        '   et_usuconfeccion, et_usuautoriza, et_usuafiliacion, et_fechaafiliacion, ' +
        '   et_confirmaendoso, et_observaciones, et_idrevisionprecios, et_motivoendoso, ' +
        '   em_nombre, fo_formulario, sect.tb_descripcion sector, et_estado ||'' - ''|| est.tb_descripcion estado,' +
        '   et_motivoendoso ||'' - ''|| mot.tb_descripcion motivo, et_estado, sr_idactividad1, sr_idactividad2, ' +
        '   sr_idactividad3, sr_porcentajevariablecotizado, sr_costofijocotizado, ' +
        '   sr_puestoautorizacion' +
        '  FROM afi.aet_endosotarifario ' +
        '   LEFT JOIN aco_contrato on et_contrato = co_contrato ' +
        '   LEFT JOIN asr_solicitudreafiliacion on et_idrevisionprecios = sr_id ' +
        '   LEFT JOIN aem_empresa on co_idempresa = em_id ' +
        '   LEFT JOIN afo_formulario on co_idformulario = fo_id ' +
        '   LEFT JOIN ctb_tablas sect on et_sector = sect.tb_codigo AND sect.tb_clave = ''SECT''' +
        '   LEFT JOIN ctb_tablas est on et_estado = est.tb_codigo AND est.tb_clave = ''PEEND''' +
        '   LEFT JOIN ctb_tablas mot on et_motivoendoso = mot.tb_codigo AND mot.tb_clave = ''MOTEN''' +
        ' WHERE et_id = :endoso ';

  aQuery := TSDQuery.Create(Self);
  aQuery.DataBaseName := 'dbPrincipal';
  OpenQueryEx(aQuery,[aIdEndosoTarifario], sSql, True);
  try
    edEndosoTarifario.Value := aQuery.FieldByName('et_nrorevprecios').AsInteger;
    fraEN_MOTIVO.Value    := aQuery.FieldByName('et_motivoendoso').AsString;
    fraTC_ACTIVIDAD.Value := aQuery.FieldByName('sr_idactividad1').AsInteger;
    fraTC_ACTIVIDAD2.Value := aQuery.FieldByName('sr_idactividad2').AsInteger;
    fraTC_ACTIVIDAD3.Value := aQuery.FieldByName('sr_idactividad3').AsInteger;

    if not aQuery.FieldByName('et_vigenciatarifa').IsNull then
      cmbTC_VIGENCIATARIFA.Date := aQuery.FieldByName('et_vigenciatarifa').AsDateTime;

    if not aQuery.FieldByName('sr_puestoautorizacion').IsNull then
      fraTC_USUARIOAUTORIZA_ALTA.Value := aQuery.FieldByName('sr_puestoautorizacion').AsInteger
    else
      fraTC_USUARIOAUTORIZA_ALTA.Clear;

    cbEN_ENVIOCARTA.Checked := False;
    cbEN_ENDOSOAUTOMATICO.Checked := aQuery.FieldByName('et_endosoautom').AsString = 'SI';

    {edALICUOTAPESOS.Value := edCalculo11.Value + edResolucion529Fijo.Value + ed060.Value;
    edALICUOTAPORC.Value  := edCalculo12.Value + edResolucion529Variable.Value;}

    if aQuery.FieldByName('sr_costofijocotizado').AsCurrency > 0.6 then
      SubTotal :=     aQuery.FieldByName('sr_costofijocotizado').AsCurrency - edResolucion529Fijo.Value - ed060.Value
    else
      SubTotal := 0;
       // fraEN_MOTIVO.Value = '03.01') or (fraEN_MOTIVO.Value = '03.02')   //edALICUOTAPORC / 1.5
    SubTotalPorc := aQuery.FieldByName('sr_porcentajevariablecotizado').AsCurrency - edResolucion529Variable.Value;

    edCalculo11.Value := SubTotal;
    edCalculo12.Value := SubTotalPorc;
    { Para los Motivos de endoso 01.12, 02.1, 2.5, 02, 02.2, 02.3 tiene que estar tildado el envío a la
  SRT por default.
      Para el 01.11 no debe estar tildado el envío a la SRT.
    }
    cbEN_ENVIOCARTA.Checked := False;
    if (aQuery.FieldByName('et_motivoendoso').AsString = '01.12') or
       (aQuery.FieldByName('et_motivoendoso').AsString = '02.1') or
       (aQuery.FieldByName('et_motivoendoso').AsString = '2.5') or
       (aQuery.FieldByName('et_motivoendoso').AsString = '02') or
       (aQuery.FieldByName('et_motivoendoso').AsString = '02.2') or
       (aQuery.FieldByName('et_motivoendoso').AsString = '02.3')
    then
    begin
      cbEN_ENVIOCARTA.Checked := True;
    end else
    if aQuery.FieldByName('et_motivoendoso').AsString = '01.11' then
    begin
      cbEN_ENVIOCARTA.Checked := False;
    end;
  //  tbGuardarClick(nil);
  finally
    aQuery.Free;
  end;
end;

procedure TfrmContratoTarifa.CargarDatosHistoricos(aIdContrato, aIdEndoso: TTableId);
var
  sSql: String;
begin
  FIdEndoso := aIdEndoso;

  sSql :=
    'SELECT en_endoso, en_motivo, en_enviosrt, en_enviocarta, en_endosoautomatico, ht_sumafijatarifa, ht_sumafija,' +
          ' ht_recargoesp_sobrefijo, ht_recargosin_sobrefijo, ht_recargosin_montofijo, ht_porcmasatarifa,' +
          ' ht_porcdescvolumen, ht_porcdescnivel, ht_recargoesp, ht_recargosin, ht_porcmasa, ht_tipodetarifa,' +
          ' ht_usuarioautoriza, ht_fechaautoriza, ht_usumodif, ht_fechamodif, ht_usualta, ht_fechaalta,' +
          ' ht_vigenciatarifa, co_idactividad, co_idactividad2, co_idactividad3, co_nivel, co_vigenciadesde,' +
          ' co_vigenciahasta, co_fechaafiliacion, ht_incumplido_desde incumplido_desde,' +
          ' ht_incumplido_hasta incumplido_hasta, ht_incumplido_sumafija incumplido_sumafija,' +
          ' ht_incumplido_porcmasa incumplido_porcmasa, ht_alicuotapesos' +
     ' FROM aht_historicotarifario, aco_contrato, aen_endoso' +
    ' WHERE ht_contrato = co_contrato' +
      ' AND en_idhistoricotarifa = ht_id' +
      ' AND en_id = ' + SqlValue(FIdEndoso);
  CargarControles(sSql, False, False);
  CargarListaEndosos(aIdContrato, aIdEndoso);
//  CalcularValores;
end;

procedure TfrmContratoTarifa.CargarDatosPCP(const aContrato: Integer);
var
  aQuery: TSDQuery;
  sSql: String;
  iTipo : Integer;
begin
  CargaValoresDeHoraPCP;
  iTipo := 1;
  sSql := 'SELECT co_idtiporegimen, co_idformulario ' +
          '  FROM aco_contrato ' +
          ' WHERE co_contrato = :contrato';

  aQuery := GetQueryEx(sSql, [aContrato]);
  try
    if not aQuery.Eof then
    begin
      iTipo :=  aQuery.FieldByName('co_idtiporegimen').AsInteger;
      FIdFormulario := aQuery.FieldByName('co_idformulario').AsInteger;
    end;
  finally
    aQuery.Free;
  end;

  if (iTipo = 2) or (iTipo = 3) then
  begin
    sSql :=
         'SELECT pp_renglon, ap_canttrabajador, ap_alicuota ' +
         '  FROM afi.aap_alicuotas_pcp ' +
         '       LEFT JOIN afi.app_parametro_pcp ON ap_idparametro_pcp = pp_id AND NVL(ap_fechaalta, SYSDATE) BETWEEN pp_fechadesde AND pp_fechahasta ' +
         ' WHERE ap_contrato = :id ' ;

    aQuery := GetQueryEx(sSql, [aContrato]);
    try
      while not aQuery.Eof do
      begin
        case aQuery.FieldByName('pp_renglon').AsInteger of
        1:
          begin
            edCantTrabMenosDe12.Value :=  aQuery.FieldByName('ap_canttrabajador').AsInteger;
            edAlicuotaMenosDe12.Value :=  aQuery.FieldByName('ap_alicuota').AsInteger;
          end;
          2:
          begin
            edCantTrabDe12a16.Value :=  aQuery.FieldByName('ap_canttrabajador').AsInteger;
            edAlicuotaDe12a16.Value :=  aQuery.FieldByName('ap_alicuota').AsInteger;
          end;
          3:
          begin
            edCantTrabMasDe16.Value :=  aQuery.FieldByName('ap_canttrabajador').AsInteger;
            edAlicuotaMasDe16.Value :=  aQuery.FieldByName('ap_alicuota').AsInteger;
          end;
        end;
        aQuery.Next;
      end;
      CalcularCostosPCP;
      FEsPCP := True;
    finally
      aQuery.Free;
    end;
  end
  else
  begin
    FEsPCP := False;
  end;
end;

procedure TfrmContratoTarifa.CargarListaEndosos(aIdContrato, aIdEndoso: TTableId);
var
  iLoop: Integer;
  sSql: String;
begin
  // Filtra para mostrar los endosos correspondientes a modificaciones de tarifa
  sSql :=
    'SELECT   en_id, en_endoso' +
       ' FROM aen_endoso, ctb_tablas' +
      ' WHERE en_contrato = :idcontrato' +
        ' AND en_motivo = tb_codigo' +
        ' AND tb_clave = ''MOTEN''' +
        ' AND (   (    en_endoso = 0' +
                 ' AND en_movimiento = 0)' +
             ' OR (tb_especial1 = ''1''))' +
   ' ORDER BY en_contrato, en_endoso, en_movimiento';
  with GetQueryEx(sSql, [aIdContrato]) do
  try
    try
      ListaEndosos.Clear;
      iLoop := 0;
      while not Eof do
      begin
        ListaEndosos.Add(FieldByName('en_id').AsString);

        //Actualizo el estado de los botones de la barra de navegacion
        if FieldByName('en_id').AsInteger = aIdEndoso then
        begin
          tbSiguiente.Enabled := (iLoop < RecordCount - 1);
          tbUltimo.Enabled    := (iLoop < RecordCount - 1);
          tbAnterior.Enabled  := (iLoop > 0);
          tbPrimero.Enabled   := (iLoop > 0);

          //Indico la informacion correcta en el campo NroEndoso
          edtbEndoso.Text := FieldByName('en_endoso').AsString;

          //Habilita los controles para modificaciones si esta en el ultimo endoso
          LockearControles(True);
        end;
        Inc(iLoop);
        Next;
      end;
    except
      ListaEndosos.Clear;
    end;
  finally
    Free;
  end;
end;

procedure TfrmContratoTarifa.CargaValoresDeHoraPCP;
var
  aQuery: TSDQuery;
  sSql : String;
begin
  sSql :=
        'SELECT pp_renglon, pp_valor ' +
        '   FROM afi.app_parametro_pcp ' +
        '  WHERE pp_fechabaja IS NULL ';
  aQuery := GetQueryEx(sSql, []);
  try
    while not aQuery.Eof do
    begin
      if aQuery.FieldByName('pp_renglon').AsInteger = 1 then
        edValorMenosDe12.Value := aQuery.FieldByName('pp_valor').AsCurrency;
      if aQuery.FieldByName('pp_renglon').AsInteger = 2 then
        edValorDesde12a16.Value := aQuery.FieldByName('pp_valor').AsCurrency;
      if aQuery.FieldByName('pp_renglon').AsInteger = 3 then
        edValorMasDe16.Value := aQuery.FieldByName('pp_valor').AsCurrency;
      aQuery.Next;
    end;
  finally
    aQuery.Free;
  end;
end;

procedure TfrmContratoTarifa.ClearControles;
begin
  if (not edVigenciaDesde.IsEmpty) and (not edVigenciaHasta.IsEmpty) then
  begin
    edResolucion529Fijo.Clear;
    edResolucion529Variable.Clear;
    edVigenciaDesde.Clear;
    edVigenciaHasta.Clear;
  end;

  fraEN_MOTIVO.Clear;
  edTC_FECHAAUTORIZA.Clear;
  fraTC_USUARIOAUTORIZA_ALTA.Clear;
  fraTC_USUARIOAUTORIZA.Clear;
  cmbTC_VIGENCIATARIFA.Clear;
  edTC_FECHAALTA.Date := Date;
  fraTC_USUALTA.Value := frmPrincipal.DBLogin.UserID;
  fraEN_MOTIVOChange(nil);
end;

procedure TfrmContratoTarifa.DisableEditControls;
begin
  //edTC_SUMAFIJATARIFA.Clear;
  //edTC_PORCMASATARIFA.Clear;
  edTC_PORCDESCVOLUMEN.Clear;
  edTC_PORCDESCNIVEL.Clear;
  edTC_RECARGOSIN.Clear;
  edTC_RECARGOSIN_SOBREFIJO.Clear;
  edRCSMF.Clear;
  edSAN_RECARGOSIN.Clear;
  edTC_REBAJASIN_MONTOFIJO.Clear;
  edRBSMF.Clear;
  edTC_RECARGOESP.Clear;
  edTC_RECARGOESP_SOBREFIJO.Clear;
  edTC_REBAJAESP.Clear;
  edTC_REBAJAESP_SOBREFIJO.Clear;

  VCLExtra.LockControls([edTC_SUMAFIJATARIFA, edTC_PORCMASATARIFA, edTC_PORCDESCVOLUMEN, edTC_PORCDESCNIVEL,
                         edTC_RECARGOSIN, edTC_RECARGOSIN_SOBREFIJO, edRCSMF, edSAN_RECARGOSIN, edTC_REBAJASIN_MONTOFIJO,
                         edRBSMF, edTC_RECARGOESP, edTC_RECARGOESP_SOBREFIJO, edTC_REBAJAESP, edTC_REBAJAESP_SOBREFIJO],
                         True);
end;

procedure TfrmContratoTarifa.DoCambio(Sender: TObject);
begin
  if (FRecalcular) and (Assigned(ActiveControl)) and (ActiveControl.Name <> 'edCalculo11') and (ActiveControl.Name <> 'edCalculo12') then
    CalcularValores;
end;

procedure TfrmContratoTarifa.DoCambioInv(Sender: TObject);
var
  Tarifa: recTarifa;
begin
  if not FRecalcular then
    Exit;

  Tarifa.FinalPesos         := edALICUOTAPESOS.Value;
  Tarifa.FinalPorc          := edALICUOTAPORC.Value;
  Tarifa.SubTotal3Pesos     := edCalculo11.Value;
  Tarifa.SubTotal3Porc      := edCalculo12.Value;
  Tarifa.RebajaVolumenVal   := edTC_PORCDESCVOLUMEN.Value;
  Tarifa.RebajaHSVal        := edTC_PORCDESCNIVEL.Value;
  Tarifa.RebajaEspSFijoVal  := edTC_REBAJAESP_SOBREFIJO.Value;
  Tarifa.RecargoEspSFijoVal := edTC_RECARGOESP_SOBREFIJO.Value;
  Tarifa.RebajaSinSFijoVal  := edTC_REBAJASIN_MONTOFIJO.Value;
  Tarifa.RecargoSinSFijoVal := edTC_RECARGOSIN_SOBREFIJO.Value;
  Tarifa.RCSMF              := edRCSMF.Value;
  Tarifa.RBSMF              := edRBSMF.Value;
  Tarifa.RebajaSinVarVal    := edSAN_RECARGOSIN.Value;
  Tarifa.RecargoSinVarVal   := edTC_RECARGOSIN.Value;
  Tarifa.RebajaEspVal       := edTC_REBAJAESP.Value;
  Tarifa.RecargoEspVal      := edTC_RECARGOESP.Value;

  if SetTarifaInv(Tarifa, ed060.Value, edAporteSSN.Value) then
  begin
    // Muestra los resultados en la planilla
    ActualizaControles(Tarifa);
  end
  else
    MessageDlg('Los datos ingresados son incompatibles.', mtError, [mbOK], 0);
end;

procedure TfrmContratoTarifa.CargarControles(sSql: String; const Tmp, aActualizarVigencia: Boolean);
  function Campo(Nombre: String): TField;
  begin
    Result := sdqDatos.FieldByName(IIF(Tmp, 'et_', 'ht_') + Nombre);
  end;

  procedure Cargar(Nombre: String; Edit1, Edit2: TCurrencyEdit);
  begin
    with Campo(Nombre) do
      if AsCurrency > 0 then
      begin
        Edit1.Value := AsCurrency;
        Edit2.Value := 0;
      end
      else
      begin
        Edit1.Value := 0;
        Edit2.Value := -AsCurrency;
      end;
  end;

begin
  OpenQuery(sdqDatos, sSql, True);

  edTC_SUMAFIJATARIFA.Value    := Campo('sumafijatarifa').AsCurrency;
  edTC_PORCMASATARIFA.Value    := Campo('porcmasatarifa').AsCurrency;
  edTC_PORCDESCVOLUMEN.Value   := Campo('porcdescvolumen').AsCurrency;
  edTC_PORCDESCNIVEL.Value     := Campo('porcdescnivel').AsCurrency;
  //fraTC_TIPOTARIFA.Value       := Campo('tipodetarifa').AsString;
  fraTC_ACTIVIDAD.Value        := sdqDatos.FieldByName('co_idactividad').AsInteger;
  fraTC_ACTIVIDAD2.Value       := sdqDatos.FieldByName('co_idactividad2').AsInteger;
  fraTC_ACTIVIDAD3.Value       := sdqDatos.FieldByName('co_idactividad3').AsInteger;
  fraEN_MOTIVO.Value           := sdqDatos.FieldByName('en_motivo').AsString;
  edNivel.Text                 := sdqDatos.FieldByName('co_nivel').AsString;
  cmbTC_VIGENCIATARIFA.Date    := Campo('vigenciatarifa').AsDateTime;
  edTC_FECHAAUTORIZA.Text      := Campo('fechaautoriza').AsString;
  fraTC_USUARIOAUTORIZA.Codigo := Campo('usuarioautoriza').AsString;
  edTC_FECHAALTA.Date          := Campo('fechaalta').AsDateTime;
  fraTC_USUALTA.Value          := Campo('usualta').AsString;

  //CheckBoxes
  cbEN_ENVIOSRT.Checked         := (sdqDatos.FieldByName('en_enviosrt').AsString = 'S');
  cbEN_ENVIOCARTA.Checked       := (sdqDatos.FieldByName('en_enviocarta').AsString = 'S');
  cbEN_ENDOSOAUTOMATICO.Checked := (sdqDatos.FieldByName('en_endosoautomatico').AsString = 'S');

  //Tarifa
  Cargar('recargosin', edTC_RECARGOSIN, edSAN_RECARGOSIN);
  Cargar('recargosin_sobrefijo', edTC_RECARGOSIN_SOBREFIJO, edTC_REBAJASIN_MONTOFIJO);
  Cargar('recargosin_montofijo', edRCSMF, edRBSMF);
  Cargar('recargoesp', edTC_RECARGOESP, edTC_REBAJAESP);
  Cargar('recargoesp_sobrefijo', edTC_RECARGOESP_SOBREFIJO, edTC_REBAJAESP_SOBREFIJO);

  edResolucion529Fijo.Value     := sdqDatos.FieldByName('incumplido_sumafija').AsCurrency;
  edResolucion529Variable.Value := sdqDatos.FieldByName('incumplido_porcmasa').AsCurrency;
  edCalculo11.Value             := Campo('sumafija').AsCurrency;
  edCalculo12.Value             := Campo('porcmasa').AsCurrency;
  edVigenciaDesde.Date          := sdqDatos.FieldByName('incumplido_desde').AsDateTime;
  edVigenciaHasta.Date          := sdqDatos.FieldByName('incumplido_hasta').AsDateTime;
  edALICUOTAPESOS.Value         := Campo('alicuotapesos').AsCurrency;
  edALICUOTAPORC.Value          := Campo('porcmasa').AsCurrency + sdqDatos.FieldByName('incumplido_porcmasa').AsCurrency;

// Comentado el 24.8.9 para que no recalcule al momento de obtener datos desde la base de datos..
//  DoCambioInv(nil);

  // Cargo los valores correspondientes a los impuestos..
  if aActualizarVigencia then
    ActualizarVigenciaTarifa(nil);
end;

procedure TfrmContratoTarifa.DoCargarDatos(const aContrato: TTableId; const aIdEndosoTemp: TTableId = ART_EMPTY_ID);
var
  sSql: String;
begin
  FContrato := aContrato;

  sSql :=
    'SELECT 1' +
     ' FROM tet_endosotarifa' +
    ' WHERE et_fechabaja IS NULL' +
      ' AND et_contrato = :contrato';
  gbAdvertencia.Visible := ExisteSqlEx(sSql, [FContrato]);
  FEsEndosoTemporal := (aIdEndosoTemp <> ART_EMPTY_ID);

  if FEsEndosoTemporal then
  begin
    EnableControls ([tbNuevo, tbCartaDoc], False);
    LockearControles(True);

    sSql :=
      'SELECT et_motivo en_motivo, et_enviosrt en_enviosrt, ''S'' en_enviocarta, ''N'' en_endosoautomatico,' +
            ' et_sumafijatarifa, et_sumafija, et_recargoesp_sobrefijo, et_recargosin_sobrefijo,' +
            ' et_recargosin_montofijo, et_porcmasatarifa, et_porcdescvolumen, et_porcdescnivel, et_recargoesp,' +
            ' et_recargosin, et_porcmasa, et_tipodetarifa, et_usuarioautoriza, et_fechaautoriza, et_usumodif,' +
            ' et_fechamodif, et_usualta, et_fechaalta, et_vigenciatarifa, co_idactividad, co_idactividad2,' +
            ' co_idactividad3, co_nivel, co_vigenciadesde, co_vigenciahasta, co_fechaafiliacion,' +
            ' et_incumplido_desde incumplido_desde, et_incumplido_hasta incumplido_hasta,' +
            ' et_incumplido_sumafija incumplido_sumafija, et_incumplido_porcmasa incumplido_porcmasa, et_alicuotapesos' +
       ' FROM tmp.tet_endosotarifa, aco_contrato' +
      ' WHERE et_contrato = co_contrato' +
        ' AND et_id = ' + SqlValue(aIdEndosoTemp);
    CargarControles(sSql, True, True);
    CalcularValores;
  end
  else
  begin
    sSql :=
      'SELECT MAX(en_id)' +
       ' FROM aen_endoso, ctb_tablas' +
      ' WHERE tb_codigo = en_motivo' +
        ' AND tb_clave = ''MOTEN''' +
        ' AND (   (    en_endoso = 0' +
                 ' AND en_movimiento = 0)' +
             ' OR (tb_especial1 = ''1''))' +
        ' AND en_contrato = :contrato';
    FIdEndoso := ValorSqlEx(sSql, [aContrato]);
    CargarDatosHistoricos(aContrato, FIdEndoso);
  end;

  CargarDatosPCP(FContrato);
end;

procedure TfrmContratoTarifa.DoConfirmarEndosoTarifario(const aContrato, aIdEndosoTarifario, aIdEndosoTemp: TTableId);
var
  sSql: String;
begin
  FContrato := aContrato;

  sSql :=
    'SELECT 1' +
     ' FROM tet_endosotarifa' +
    ' WHERE et_fechabaja IS NULL' +
      ' AND et_contrato = :contrato';
  gbAdvertencia.Visible := ExisteSqlEx(sSql, [FContrato]);

  FEsEndosoTemporal := (aIdEndosoTemp <> ART_EMPTY_ID);

  sSql :=
    'SELECT MAX(en_id)' +
    '  FROM aen_endoso, ctb_tablas' +
    ' WHERE tb_codigo = en_motivo' +
    ' AND tb_clave = ''MOTEN''' +
    ' AND (   (    en_endoso = 0' +
                 ' AND en_movimiento = 0)' +
             ' OR (tb_especial1 = ''1''))' +
        ' AND en_contrato = :contrato';
  FIdEndoso := ValorSqlEx(sSql, [aContrato]);
  CargarDatosHistoricos(aContrato, FIdEndoso);
  CargarDatosPCP(FContrato);

  if FEsEndosoTemporal then
  begin
    EnableControls ([tbNuevo, tbCartaDoc], False);
    LockearControles(True);
  end
  else
  begin
    sSql :=
      'SELECT et_estado' +
      '  FROM afi.aet_endosotarifario' +
      ' WHERE et_id = :id';
    if (ValorSqlEx(sSql, [aIdEndosoTarifario], '5.0') <> '3.0') then
    begin
      EnableControls ([tbNuevo, tbCartaDoc], False);
      LockearControles(True);
    end
    else
    begin
      tbNuevoClick(nil);
      //aca se carga el endosotarifario y se aprueba
      CargarDatosEndosoTarifario(aIdEndosoTarifario);
    end;
  end;

  FIdEndosoTarifario := aIdEndosoTarifario;

  ShowModal;
end;

procedure TfrmContratoTarifa.DoGuardar;
var
  {$IFNDEF ESSISTEMANUEVOEMI}
  bDesconciliarPer: Boolean;
  bPuedeDesconciliar: Boolean;
  {$ENDIF}
  {$IFNDEF SUSCRIPCIONES}
  IdEndoso: TTableId;
  IdFormulario: TTableId;
  {$ENDIF}
  bCancelarCarta: Boolean;
  IdActividad: TTableId;
  IdActividad2: TTableId;
  IdActividad3: TTableId;
  IdEndosoTemp: TTableId;
  sNivel: String;
  sSql: String;
  aSqlTrans: TSql;

  function Elegir(aValor1, aValor2: Extended): Extended;
  begin
    if Abs(aValor1) > 0 then
      Result := aValor1
    else if Abs(aValor2) > 0 then
      Result := - aValor2
    else
      Result := 0;
  end;

begin
  bCancelarCarta := False;

  sSql :=
    'SELECT co_idactividad, co_idactividad2, co_idactividad3, co_idformulario, co_nivel' +
     ' FROM aco_contrato' +
    ' WHERE co_contrato = :contrato';
  with GetQueryEx(sSql, [FContrato]) do
  try
    {$IFNDEF SUSCRIPCIONES}
    IdFormulario := FieldByName('co_idformulario').AsInteger;
    {$ENDIF}
    IdActividad  := FieldByName('co_idactividad').AsInteger;
    IdActividad2 := FieldByName('co_idactividad2').AsInteger;
    IdActividad3 := FieldByName('co_idactividad3').AsInteger;
    sNivel       := FieldByName('co_nivel').AsString;
  finally
    Free;
  end;

  if cbEN_ENDOSOAUTOMATICO.Checked then // Guardar datos en la tabla ATC_TARIFARIOCONTRATO y AEN_ENDOSO
  begin
    aSqlTrans := TSQL.Create('atc_tarifariocontrato');
    try
      // ACTUALIZAR ID_ACTIVIDAD DE ACO_CONTRATO SI SE CAMBIÓ LA ACTIVIDAD
      if IdActividad <> fraTC_ACTIVIDAD.Value then
      begin
        sSql :=
          'UPDATE aco_contrato' +
            ' SET co_idactividad = :idactividad' +
          ' WHERE co_contrato = :contrato';
        EjecutarSqlEx(sSql, [fraTC_ACTIVIDAD.Value, FContrato]);
      end;

      if IdActividad2 <> fraTC_ACTIVIDAD2.Value then
      begin
        sSql :=
          'UPDATE aco_contrato' +
            ' SET co_idactividad2 = :idactividad2' +
          ' WHERE co_contrato = :contrato';
        EjecutarSqlEx(sSql, [fraTC_ACTIVIDAD2.Value, FContrato]);
      end;

      if IdActividad3 <> fraTC_ACTIVIDAD3.Value then
      begin
        sSql :=
          'UPDATE aco_contrato' +
            ' SET co_idactividad3 = :idactividad3' +
          ' WHERE co_contrato = :contrato';
        EjecutarSqlEx(sSql, [fraTC_ACTIVIDAD3.Value, FContrato]);
      end;

      if sNivel <> edNivel.Text then
      begin
        sSql :=
          'UPDATE aco_contrato' +
            ' SET co_nivel = :nivel' +
          ' WHERE co_contrato = :contrato';
        EjecutarSqlEx(sSql, [edNivel.Text, FContrato]);
      end;

      // GUARDAR TARIFARIO CONTRATO
      with aSqlTrans do
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('tc_contrato',                 FContrato, False);
        Fields.AddExtended('tc_sumafija',             edCalculo11.Value, ALL_DECIMALS, False);
        Fields.AddExtended('tc_incumplido_sumafija',  edResolucion529Fijo.Value, ALL_DECIMALS, False);
        Fields.AddExtended('tc_incumplido_porcmasa',  edResolucion529Variable.Value, ALL_DECIMALS, False);
        Fields.AddDate('tc_incumplido_desde',         edVigenciaDesde.Date, True);
        Fields.AddDate('tc_incumplido_hasta',         edVigenciaHasta.Date, True);
        Fields.AddExtended('tc_alicuotapesos',        edALICUOTAPESOS.Value, ALL_DECIMALS, False);
        Fields.AddExtended('tc_sumafijatarifa',       edTC_SUMAFIJATARIFA.Value, ALL_DECIMALS, False);
        Fields.AddExtended('tc_porcmasatarifa',       edTC_PORCMASATARIFA.Value, ALL_DECIMALS, False);
        Fields.AddExtended('tc_porcmasa',             edCalculo12.Value, ALL_DECIMALS, False);
        Fields.AddExtended('tc_porcdescvolumen',      edTC_PORCDESCVOLUMEN.Value, ALL_DECIMALS, False);
        Fields.AddExtended('tc_porcdescnivel',        edTC_PORCDESCNIVEL.Value, ALL_DECIMALS, False);
        Fields.AddExtended('tc_recargosin',           Elegir(edTC_RECARGOSIN.Value, edSAN_RECARGOSIN.Value), ALL_DECIMALS, False);
        Fields.AddExtended('tc_recargosin_sobrefijo', Elegir(edTC_RECARGOSIN_SOBREFIJO.Value, edTC_REBAJASIN_MONTOFIJO.Value), ALL_DECIMALS, False);
        Fields.AddExtended('tc_recargosin_montofijo', Elegir(edRCSMF.Value, edRBSMF.Value), ALL_DECIMALS, False);
        Fields.AddExtended('tc_recargoesp',           Elegir(edTC_RECARGOESP.Value, edTC_REBAJAESP.Value), ALL_DECIMALS, False);
        Fields.AddExtended('tc_recargoesp_sobrefijo', Elegir(edTC_RECARGOESP_SOBREFIJO.Value, edTC_REBAJAESP_SOBREFIJO.Value), ALL_DECIMALS, False);
        Fields.Add('tc_vigenciatarifa',               cmbTC_VIGENCIATARIFA.Date);
        //Fields.Add('tc_tipodetarifa',                 fraTC_TIPOTARIFA.Value);
        Fields.Add('tc_fechaautoriza',                edTC_FECHAAUTORIZA.Date);
        Fields.Add('tc_usuarioautoriza',              fraTC_USUARIOAUTORIZA_ALTA.Codigo);
        Fields.Add('tc_fechaalta',                   'Actualdate', False);
        Fields.Add('tc_usualta',                      frmPrincipal.DBLogin.UserId);
      end;

      try
        BeginTrans;

        EjecutarSQLST(aSqlTrans.Sql);

        {$IFNDEF SUSCRIPCIONES}
        IdEndoso := DoEndosoGrabar(FContrato, cmbTC_VIGENCIATARIFA.Date, fraEN_MOTIVO.Value,
                                   IIF(cbEN_ENVIOSRT.Checked, 'S', 'N'), IIF(cbEN_ENVIOCARTA.Checked, 'S', 'N'),
                                   'S', frmPrincipal.DBLogin.UserId, False);
        {$ENDIF}

        {$IFDEF ESSISTEMANUEVOEMI}
        EjecutarStoreSTEx('emi.utiles.do_marcarperiodostarifa(:contrato, :vigenciatarifa);', [FContrato, TDateTimeEx.Create(cmbTC_VIGENCIATARIFA.Date)]);

        {$ELSE}
        sSql :=
          'SELECT cobranza.puededesconciliarempresa(:contrato)' +
           ' FROM DUAL';
        bPuedeDesconciliar := (ValorSqlEx(sSql, [FContrato]) = 'S');

        if bPuedeDesconciliar then
          bDesconciliarPer := (MsgBox('¿ En caso de ser necesario, desea desconciliar los períodos a devengar ?', MB_ICONQUESTION + MB_YESNO) = IDYES)
        else
          bDesconciliarPer := False;

        DoDevengado_Actualizar(frmPrincipal.DBLogin.UserId, FContrato, cmbTC_VIGENCIATARIFA.Date, bDesconciliarPer);
        {$ENDIF}

        {$IFNDEF SUSCRIPCIONES}
        if cbEN_ENVIOCARTA.Checked then
          // LLAMAR AL TfrmAfiGeneracionCartas
          with TfrmAfiGeneracionCartas.Create(Self) do
          try
            if not Execute(IdFormulario, IdEndoso, FContrato, True, False, FIdEndosoTarifario) then
            begin
              bCancelarCarta := True;
              Abort;
            end;
          finally
            Free;
          end;
        {$ENDIF}

        //Si es un endosotarifario con endosoautomatico se aprueba directamente y se da por terminado el circuito con estado 5.0
        //FidEndosoTarifario se carga solo cuando se accede a la pantalla desde DoConfirmarEndosoTarifario
        if (FIdEndosoTarifario <> ART_EMPTY_ID) and (cbEN_ENDOSOAUTOMATICO.Checked) then
        begin
          sSql :=
            'UPDATE afi.aet_endosotarifario' +
              ' SET et_estado = ''5''' +
            ' WHERE et_id = :id';
          EjecutarSqlSTEx(sSql, [FIdEndosoTarifario]);
        end;

        CommitTrans;
      except
        on E: Exception do
        begin
          Rollback;
          if not bCancelarCarta then
            ErrorMsg(E, 'Error al guardar los datos.')
          else
            MessageDlg('Ha decidido cancelar el endoso.', mtInformation, [mbOK], 0);
        end;
      end;
    finally
      aSqlTrans.Free;
    end;
  end
  else // Guardar datos en TMP.TET_ENDOSOTARIFA
  begin
    aSqlTrans := TSQL.Create('tmp.tet_endosotarifa');
    try
      with aSqlTrans do
      begin
        SqlType := stInsert;
        IdEndosoTemp := ValorSqlInteger('SELECT seq_tet_id.NEXTVAL FROM DUAL');

        PrimaryKey.Add('et_id',                       IdEndosoTemp, False);
        Fields.Add('et_contrato',                     FContrato, False);
        //Fields.Add('et_tipodetarifa',                 fraTC_TIPOTARIFA.Value);
        Fields.AddExtended('et_porcmasatarifa',       edTC_PORCMASATARIFA.Value, ALL_DECIMALS, False);
        Fields.AddExtended('et_porcdescvolumen',      edTC_PORCDESCVOLUMEN.Value, ALL_DECIMALS, False);
        Fields.AddExtended('et_porcdescnivel',        edTC_PORCDESCNIVEL.Value, ALL_DECIMALS, False);
        Fields.AddExtended('et_porcmasa',             edCalculo12.Value, ALL_DECIMALS, False);
        Fields.AddExtended('et_sumafija',             edCalculo11.Value, ALL_DECIMALS, False);
        Fields.AddExtended('et_sumafijatarifa',       edTC_SUMAFIJATARIFA.Value, ALL_DECIMALS, False);
        Fields.AddExtended('et_incumplido_sumafija',  edResolucion529Fijo.Value, ALL_DECIMALS, False);
        Fields.AddExtended('et_incumplido_porcmasa',  edResolucion529Variable.Value, ALL_DECIMALS, False);
        Fields.AddDate('et_incumplido_desde',         edVigenciaDesde.Date, True);
        Fields.AddDate('et_incumplido_hasta',         edVigenciaHasta.Date, True);
        Fields.AddExtended('et_alicuotapesos',        edALICUOTAPESOS.Value, ALL_DECIMALS, False);
        Fields.AddExtended('et_recargosin',           Elegir(edTC_RECARGOSIN.Value, edSAN_RECARGOSIN.Value), ALL_DECIMALS, False);
        Fields.AddExtended('et_recargosin_sobrefijo', Elegir(edTC_RECARGOSIN_SOBREFIJO.Value, edTC_REBAJASIN_MONTOFIJO.Value), ALL_DECIMALS, False);
        Fields.AddExtended('et_recargosin_montofijo', Elegir(edRCSMF.Value, edRBSMF.Value), ALL_DECIMALS, False);
        Fields.AddExtended('et_recargoesp',           Elegir(edTC_RECARGOESP.Value, edTC_REBAJAESP.Value), ALL_DECIMALS, False);
        Fields.AddExtended('et_recargoesp_sobrefijo', Elegir(edTC_RECARGOESP_SOBREFIJO.Value, edTC_REBAJAESP_SOBREFIJO.Value), ALL_DECIMALS, False);
        Fields.Add('et_vigenciaendoso',               cmbTC_VIGENCIATARIFA.Date);
        Fields.Add('et_motivo',                       fraEN_MOTIVO.Value);
        Fields.Add('et_enviosrt',                     IIF(cbEN_ENVIOSRT.Checked, 'S', 'N'), dtChar);
        Fields.Add('et_vigenciatarifa',               cmbTC_VIGENCIATARIFA.Date);
        Fields.Add('et_idactividad',                  fraTC_ACTIVIDAD.Value);
        Fields.Add('et_idactividad2',                 fraTC_ACTIVIDAD2.Value);
        Fields.Add('et_idactividad3',                 fraTC_ACTIVIDAD3.Value);
        Fields.Add('et_nivel',                        edNivel.Text);
        Fields.Add('et_usuarioautoriza',              fraTC_USUARIOAUTORIZA_ALTA.Codigo);
        Fields.Add('et_fechaautoriza',                edTC_FECHAAUTORIZA.Date);
        Fields.Add('et_usualta',                      frmPrincipal.DBLogin.UserId);
        Fields.Add('et_fechaalta',                    SQL_ACTUALDATE, False);
      end;

      BeginTrans;
      try
        EjecutarSQLST(aSqlTrans.Sql);

        {$IFNDEF SUSCRIPCIONES}
        if cbEN_ENVIOCARTA.Checked then
          // LLAMAR AL TfrmAfiGeneracionCartas
          with TfrmAfiGeneracionCartas.Create(Self) do
          try
            if not Execute(IdFormulario, IdEndosoTemp, FContrato, True, True, FIdEndosoTarifario) then
            begin
              bCancelarCarta := True;
              Abort;
            end;
          finally
            Free;
          end;
        {$ENDIF}
        CommitTrans;
      except
        on E: Exception do
        begin
          Rollback;
          if not bCancelarCarta then
            ErrorMsg(E, 'Error al guardar los datos.')
          else
            MessageDlg('Ha decidido cancelar el endoso.', mtInformation, [mbOK], 0);
        end;
      end;
    finally
      aSqlTrans.Free;
    end;
  end;
  if FEsPCP then
    GuardarCostosPCP;
end;

function TfrmContratoTarifa.IsValidar : Boolean;
var
  iIdActividad: Integer;
  cPorcSSN: Currency;
  cTarSSN: Currency;
  dVigenciaTarifaMinima: TDateTime;
  sFecha: String;
  sNivel: String;
  sSql: String;
  wDay: Word;
  wMonth: Word;
  wYear: Word;
begin
  sSql :=
    'SELECT afiliacion.check_cobertura(:contrato)' +
     ' FROM DUAL';
  if (ValorSqlIntegerEx(sSql, [FContrato]) <> 1) and (MsgBox('El contrato no está activo. ¿ Desea continuar ?', MB_YESNO + MB_ICONINFORMATION, 'Atención') <> MRYES) then
    Abort;

  Verificar(edTC_SUMAFIJATARIFA.Value < 0, edTC_SUMAFIJATARIFA, 'El importe de la suma fija debe ser mayor o igual que 0 (cero).');
  Verificar((edTC_PORCMASATARIFA.Value < 0) or (edTC_PORCMASATARIFA.Value > 100), edTC_PORCMASATARIFA, 'La Tarifa debe estar entre 0 y 100.');
  Verificar((edTC_SUMAFIJATARIFA.Value = 0) and (edTC_PORCMASATARIFA.Value = 0), edTC_SUMAFIJATARIFA, 'La Tarifa no es correcta.');
  Verificar((edTC_PORCDESCVOLUMEN.Value < 0) or (edTC_PORCDESCVOLUMEN.Value > 100), edTC_PORCDESCVOLUMEN, 'El descuento de masa salarial debe estar entre 0 y 100.');
  Verificar((edTC_PORCDESCNIVEL.Value < 0) or (edTC_PORCDESCNIVEL.Value > 100), edTC_PORCDESCNIVEL, 'El descuento de normas H.S. debe estar entre 0 y 100.');
  Verificar((edTC_RECARGOSIN.Value < 0) or (edTC_RECARGOSIN.Value > 100), edTC_RECARGOSIN, 'El recargo por siniestralidad sobre variable debe estar entre 0 y 100.');
  Verificar(edTC_SUMAFIJATARIFA.Value < 0, edTC_SUMAFIJATARIFA, 'El improte de la suma fija debe ser mayor o igual que 0 (cero).');
  Verificar(edRCSMF.Value < 0, edRCSMF, 'El recarto por siniestrlidad monto fijo debe ser mayo o igual que 0(cero).');
  Verificar((edSAN_RECARGOSIN.Value < 0) or (edSAN_RECARGOSIN.Value > 100), edSAN_RECARGOSIN, 'La rebaja por siniestralidad sobre variable debe estar entre 0 y 100.');
  Verificar((edTC_RECARGOSIN_SOBREFIJO.Value < 0) or (edTC_RECARGOSIN_SOBREFIJO.Value > 100), edTC_RECARGOSIN_SOBREFIJO, 'La rebaja por siniestralidad sobre fijo debe estar entre 0 y 100.');
  Verificar((edRBSMF.Value < 0) or (edRBSMF.Value > 100), edRBSMF, 'La rebaja por siniestralidad monto fijo debe estar entre 0 y 100.');
  Verificar((edTC_RECARGOESP.Value < 0) or (edTC_RECARGOESP.Value > 100), edTC_RECARGOESP, 'El recargo especial sobre variable debe estar entre 0 y 100.');
  Verificar((edTC_RECARGOESP_SOBREFIJO.Value < 0) or (edTC_RECARGOESP_SOBREFIJO.Value > 100), edTC_RECARGOESP_SOBREFIJO, 'El recargo especial sobre fijo debe estar entre 0 y 100.');
  Verificar((edTC_REBAJAESP.Value < 0) or (edTC_REBAJAESP.Value > 100), edTC_REBAJAESP, 'La rebaja especial sobre variable debe estar entre 0 y 100.');
  Verificar((edTC_REBAJAESP_SOBREFIJO.Value < 0) or (edTC_REBAJAESP_SOBREFIJO.Value > 100), edTC_REBAJAESP_SOBREFIJO, 'La rebaja especial sobre fijo debe estar entre 0 y 100.');
  Verificar((Abs(edTC_RECARGOSIN.Value) > 0) and (Abs(edSAN_RECARGOSIN.Value) > 0), edTC_RECARGOSIN, 'No puede existir recargo y rebaja por siniestralidad sobre variable.');
  Verificar((Abs(edTC_RECARGOSIN_SOBREFIJO.Value) > 0) and (Abs(edTC_REBAJASIN_MONTOFIJO.Value) > 0), edTC_RECARGOSIN_SOBREFIJO, 'No puede existir recargo y rebaja por siniestralidad sobre Fijo.');
  Verificar((Abs(edTC_RECARGOESP.Value) > 0) and (Abs(edTC_REBAJAESP.Value) > 0), edTC_RECARGOESP, 'No puede existir recargo y rebaja especial sobre variable.');
  Verificar((Abs(edTC_RECARGOESP_SOBREFIJO.Value) > 0) and (Abs(edTC_REBAJAESP_SOBREFIJO.Value) > 0), edTC_RECARGOESP_SOBREFIJO, 'No puede existir recargo y rebaja especial sobre fijo.');
  Verificar((Abs(edRBSMF.Value) > 0) and (Abs(edRCSMF.Value) > 0), edRCSMF, 'No puede existir recargo y rebaja por siniestralidad sobre Monto fijo.');

  if (fraEN_MOTIVO.Value = '03.01') or (fraEN_MOTIVO.Value = '03.02') then
    Verificar(edVigenciaDesde.IsEmpty, edVigenciaDesde, 'Debe cargar la Vigencia Desde de la Resolución Nº 529.');

  sSql :=
    'SELECT 1' +
     ' FROM aht_historicotarifario, aco_contrato, aen_endoso' +
    ' WHERE ht_contrato = co_contrato' +
      ' AND en_idhistoricotarifa = ht_id' +
      ' AND ht_incumplido_porcmasa IS NOT NULL' +
      ' AND ht_incumplido_sumafija IS NOT NULL' +
      ' AND ht_incumplido_hasta IS NULL' +
      ' AND en_id = :idendoso';
  if (fraEN_MOTIVO.Value = '03.03') and (ExisteSqlEx(sSql, [StrToIntDef(ListaEndosos.Strings[ListaEndosos.Count - 1], ART_EMPTY_ID)])) then
  begin
    Verificar(edVigenciaDesde.IsEmpty, edVigenciaDesde, 'Debe cargar la Vigencia Desde de la Resolución Nº 529.');
    Verificar(edVigenciaHasta.IsEmpty, edVigenciaHasta, 'Debe cargar la Vigencia Hasta de la Resolución Nº 529.');
  end;

  Verificar(fraTC_ACTIVIDAD.IsEmpty, fraTC_ACTIVIDAD, 'La actividad no puede quedar en blanco.');

  DecodeDate(cmbTC_VIGENCIATARIFA.Date, wYear, wMonth, wDay);

  Verificar((wDay <> 1) and (cmbTC_VIGENCIATARIFA.Date <> sdqDatos.FieldByName('co_vigenciadesde').AsDateTime), cmbTC_VIGENCIATARIFA, 'La fecha de vigencia de la tarifa debe empezar el primer día de cada mes o ser igual a la fecha de inicio del contrato.');

  //tk 44437 pidio Callo, vino para a explicarnos oralmente como debia ser, se lo probo con ella aca y quedo conforme.
  Verificar((cmbTC_VIGENCIATARIFA.Date < sdqDatos.FieldByName('co_vigenciadesde').AsDateTime) or
              (cmbTC_VIGENCIATARIFA.Date > IncYear(sdqDatos.FieldByName('co_vigenciahasta').AsDateTime, 1)),
               cmbTC_VIGENCIATARIFA, 'La fecha de vigencia de la tarifa no deberá superar los 12 meses de la vigencia hasta del contrato.');


  Verificar(fraEN_MOTIVO.IsEmpty, fraEN_MOTIVO, 'El motivo es obligatorio.');
  Verificar(fraTC_USUARIOAUTORIZA_ALTA.IsEmpty, fraTC_USUARIOAUTORIZA_ALTA, 'El Usuario que autoriza es obligatorio.');
  Verificar(fraTC_USUARIOAUTORIZA_ALTA.isBaja, fraTC_USUARIOAUTORIZA_ALTA, 'El Usuario que autoriza debe estar activo.');
  Verificar((edNivel.Text = ''), edNivel, 'El Nivel es obligatorio.');

  iIdActividad := sdqDatos.FieldByName('co_idactividad').AsInteger;
  sFecha       := cmbTC_VIGENCIATARIFA.Text;
  sNivel       := edNivel.Text;

  TarifaSSN(sNivel, iIdActividad, sFecha, cTarSSN, cPorcSSN);
  cTarSSN := cTarSSN * 1.15 + ed060.Value;

  if (edALICUOTAPESOS.Value > cTarSSN) or (edALICUOTAPORC.Value > cPorcSSN) then
    if not MsgAsk('La tarifa se encuentra por encima del valor dado por la SSN. ¿ Desea continuar ?', 'Atención') then
      Abort;

  dVigenciaTarifaMinima := Get_VigenciaTarifaMinima(FContrato);
  if (cmbTC_VIGENCIATARIFA.Date < dVigenciaTarifaMinima) and (MsgBox('La vigencia de la tarifa ingresada es menor al inicio del contrato o ya fue modificada la tarifa antes del año. ¿ Desea continuar ?', MB_YESNO + MB_ICONINFORMATION, 'Atención') <> MRYES) then
    Abort;

  if cbEN_ENDOSOAUTOMATICO.Checked then
    if MsgBox('El sistema recalculará los devengados posteriores a ' + GetPeriodo(IncMonth(cmbTC_VIGENCIATARIFA.Date, -1)) + '.' + CRLF + '¿ Está usted de acuerdo ?', MB_ICONQUESTION + MB_OKCANCEL) = IDCANCEL then
      Abort;
  Result := True;
end;

procedure TfrmContratoTarifa.LockearControles(valor: Boolean);
begin
  //Estos estan siempre Deshabilitados
  LockControls([edTC_FECHAALTA, fraTC_USUALTA], True);

  //Info del endoso
  LockControls([{fraTC_TIPOTARIFA}edEndosoTarifario, edNivel, fraTC_ACTIVIDAD, fraTC_ACTIVIDAD2, fraTC_ACTIVIDAD3, fraEN_MOTIVO,
                cmbTC_VIGENCIATARIFA, cbEN_ENVIOSRT, cbEN_ENVIOCARTA, cbEN_ENDOSOAUTOMATICO, edTC_FECHAAUTORIZA,
                fraTC_USUARIOAUTORIZA], valor);
  //Cuadro con valores
  LockControls([edTC_SUMAFIJATARIFA, edTC_PORCMASATARIFA, edTC_PORCDESCVOLUMEN, edTC_PORCDESCNIVEL, edTC_RECARGOSIN,
                edTC_RECARGOSIN_SOBREFIJO, edRCSMF, edSAN_RECARGOSIN, edTC_REBAJASIN_MONTOFIJO, edRBSMF, edTC_RECARGOESP,
                edTC_RECARGOESP_SOBREFIJO, edTC_REBAJAESP, edTC_REBAJAESP_SOBREFIJO, edCalculo11, edCalculo12,
                edVigenciaDesde, edVigenciaHasta], valor);
  //Cuadro PCP
  LockControls([edCantTrabMenosDe12, edCantTrabDe12a16, edCantTrabMasDe16
            //   edValorMenosDe12, edValorDesde12a16,   edValorMasDe16,
             //  edAlicuotaMenosDe12, edAlicuotaDe12a16, edAlicuotaMasDe16,
               ], valor);
  edEndosoTarifario.ReadOnly := True;
  //edEndosoTarifario.Text := '';
end;


procedure TfrmContratoTarifa.FormCreate(Sender: TObject);
begin
  inherited;

  FActualizarControles := True;
  FRecalcular := True;
  FIdEndosoTarifario := ART_EMPTY_ID;

 // fraTC_TIPOTARIFA.Clave          := 'TARIF';
  fraEN_MOTIVO.Clave              := 'MOTEN';
  fraEN_MOTIVO.Especial1          := '1';
  fraEN_MOTIVO.OnChange           := fraEN_MOTIVOChange;
  ListaEndosos                    := TStringList.Create;
  fraTC_USUALTA.ShowBajas         := True;

  with fraTC_USUARIOAUTORIZA do
  begin
    Propiedades.Sql :=
      'SELECT *' +
       ' FROM (' +
            'SELECT se_usuario id, se_usuario codigo, se_nombre descripcion, se_fechabaja baja' +
             ' FROM use_usuarios' +
        ' UNION ALL' +
           ' SELECT ''COMITE'' id, ''COMITE'' codigo, ''Comité de Negocios'' descripcion, NULL BAJA' +
             ' FROM dual) usuarios' +
      ' WHERE 1 = 1 ';
  end;
  //** Cambio pedido por GROSSI segun email del 22/12/2014 titulado RV: Consulta Usuario Autorización diferentes - Tk54596
 { with fraTC_USUARIOAUTORIZA_ALTA do
  begin
    Propiedades.Sql :=
      'SELECT *' +
       ' FROM (' +
            'SELECT se_usuario id, se_usuario codigo, se_nombre descripcion, se_fechabaja baja' +
             ' FROM use_usuarios' +
            ' WHERE se_usuario IN (''CFLORIO'', ''FMFIRENZE'', ''MFERNANDEZ'', ''MIPARRAGUIRRE'', ''MMAGALLANES'')' +
        ' UNION ALL' +
           ' SELECT ''COMITE'' id, ''COMITE'' codigo, ''Comité de Negocios'' descripcion, NULL baja' +
             ' FROM dual) usuarios' +
      ' WHERE 1 = 1 ';
  end;      }

   with fraTC_USUARIOAUTORIZA_ALTA do
  begin
    Propiedades.Sql :=
     'SELECT ID, codigo, descripcion, baja' +
     ' FROM (SELECT tb_codigo as ' + CD_ALIAS_ID + ', ac_usuario as ' + CD_ALIAS_CODIGO + ', tb_descripcion as ' + CD_ALIAS_DESC + ', ac_fechabaja as ' + CD_ALIAS_BAJA +
             ' FROM art.aac_autorizacotiza aac, ctb_tablas' +
            ' WHERE tb_clave = ''REUSA''' +
              ' AND ac_puesto = tb_codigo) tabla' +
    ' WHERE 1 = 1';
  end;

  cmbTC_VIGENCIATARIFA.OnChange := ActualizarVigenciaTarifa;

  {$IFNDEF SUSCRIPCIONES}
  if Seguridad.ControlHabilitado(frmPrincipal, frmPrincipal.mnuConfirmacionEndosos) then
    lbTarifaPendiente.Cursor := crHandPoint
  else
    lbTarifaPendiente.Cursor := crDefault;
  {$ELSE}
  lbTarifaPendiente.Cursor := crDefault;
  tbCartaDoc.Enabled := False;
  {$ENDIF}
end;

procedure TfrmContratoTarifa.edTC_SUMAFIJATARIFAExit(Sender: TObject);
begin
  Verificar(edTC_SUMAFIJATARIFA.Value < 0, edTC_SUMAFIJATARIFA, 'El importe de la suma fija debe ser mayor o igual que 0 (cero).');
  Verificar(edTC_SUMAFIJATARIFA.Value > 999999.99, edTC_SUMAFIJATARIFA, 'El importe no puede ser mayor a 999999.99');
end;

procedure TfrmContratoTarifa.edTC_PORCMASATARIFAExit(Sender: TObject);
begin
  Verificar((edTC_PORCMASATARIFA.Value < 0) or (edTC_PORCMASATARIFA.Value > 100), edTC_PORCMASATARIFA, 'La Tarifa debe estar entre 0 y 100.');
end;

procedure TfrmContratoTarifa.edTC_PORCDESCVOLUMENExit(Sender: TObject);
begin
  Verificar((edTC_PORCDESCVOLUMEN.Value < 0) or (edTC_PORCDESCVOLUMEN.Value > 100), edTC_PORCDESCVOLUMEN, 'El descuento de masa salarial debe estar entre 0 y 100.');
  DoCambio(nil);
end;

procedure TfrmContratoTarifa.edTC_PORCDESCNIVELExit(Sender: TObject);
begin
  Verificar((edTC_PORCDESCNIVEL.Value < 0) or (edTC_PORCDESCNIVEL.Value > 100), edTC_PORCDESCNIVEL, 'El descuento de normas H.S. debe estar entre 0 y 100.');
  DoCambio(nil);
end;

procedure TfrmContratoTarifa.edTC_RECARGOSINExit(Sender: TObject);
begin
  Verificar((edTC_RECARGOSIN.Value < 0) or (edTC_RECARGOSIN.Value > 100), edTC_RECARGOSIN, 'El recargo por siniestralidad sobre variable debe estar entre 0 y 100.');
  DoCambio(nil);
end;

procedure TfrmContratoTarifa.edTC_RECARGOSIN_SOBREFIJOExit(Sender: TObject);
begin
  Verificar((edTC_RECARGOSIN_SOBREFIJO.Value < 0) or (edTC_RECARGOSIN_SOBREFIJO.Value > 100),
             edTC_RECARGOSIN_SOBREFIJO, 'El recargo por siniestralidad sobre fijo debe estar entre 0 y 100.');
  DoCambio(nil);
end;

procedure TfrmContratoTarifa.edRCSMFExit(Sender: TObject);
begin
  Verificar(edRCSMF.Value < 0, edRCSMF, 'El recargo por siniestralidad monto fijo debe ser mayor o igual que 0(cero).');
  Verificar(edRCSMF.Value > 999999.99, edRCSMF, 'El importe no puede ser mayor a 999999.99');
end;

procedure TfrmContratoTarifa.edSAN_RECARGOSINExit(Sender: TObject);
begin
  Verificar((edSAN_RECARGOSIN.Value < 0) or (edSAN_RECARGOSIN.Value > 100),
             edSAN_RECARGOSIN, 'La rebaja por siniestralidad sobre variable debe estar entre 0 y 100.');
  DoCambio(nil);
end;

procedure TfrmContratoTarifa.edTC_REBAJASIN_MONTOFIJOExit(Sender: TObject);
begin
  Verificar((edTC_REBAJASIN_MONTOFIJO.Value < 0) or (edTC_REBAJASIN_MONTOFIJO.Value > 100),
            edTC_REBAJASIN_MONTOFIJO, 'La rebaja por siniestralidad sobre fijo debe estar entre 0 y -100.');
  DoCambio(nil);
end;

procedure TfrmContratoTarifa.edCantTrabDe12a16Exit(Sender: TObject);
begin
  CalcularCostosPCP;
end;

procedure TfrmContratoTarifa.edCantTrabMasDe16Exit(Sender: TObject);
begin
  CalcularCostosPCP;
end;

procedure TfrmContratoTarifa.edCantTrabMenosDe12Exit(Sender: TObject);
begin
  CalcularCostosPCP;
end;

procedure TfrmContratoTarifa.edRBSMFExit(Sender: TObject);
begin
  Verificar((edRBSMF.Value < 0) or (edRBSMF.Value > 100),
             edRBSMF, 'La rebaja por siniestralidad monto fijo debe estar entre 0 y -100.');
  Verificar(edRBSMF.Value > 999999.99, edRBSMF, 'El improte no puede ser mayor a 999999.99');
end;

procedure TfrmContratoTarifa.edTC_RECARGOESPExit(Sender: TObject);
begin
  Verificar((edTC_RECARGOESP.Value < 0) or (edTC_RECARGOESP.Value > 100),
            edTC_RECARGOESP, 'El recargo especial sobre variable debe estar entre 0 y 100');
  DoCambio(nil);
end;

procedure TfrmContratoTarifa.edTC_RECARGOESP_SOBREFIJOExit(Sender: TObject);
begin
  Verificar((edTC_RECARGOESP_SOBREFIJO.Value < 0) or (edTC_RECARGOESP_SOBREFIJO.Value > 100),
             edTC_RECARGOESP_SOBREFIJO, 'El recargo especial sobre fijo debe estar entre 0 y 100.');
  DoCambio(nil);
end;

procedure TfrmContratoTarifa.edTC_REBAJAESPExit(Sender: TObject);
begin
  Verificar((edTC_REBAJAESP.Value < 0) or (edTC_REBAJAESP.Value > 100),
             edTC_REBAJAESP, 'La rebaja especial sobre variable debe estar entre 0 y 100.');
  DoCambio(nil);
end;

procedure TfrmContratoTarifa.edTC_REBAJAESP_SOBREFIJOExit(Sender: TObject);
begin
  Verificar((edTC_REBAJAESP_SOBREFIJO.Value < 0) or (edTC_REBAJAESP_SOBREFIJO.Value > 100),
             edTC_REBAJAESP_SOBREFIJO, 'La rebaja especial sobre fijo debe estar entre 0 y 100.');
  DoCambio(nil);
end;

procedure TfrmContratoTarifa.tbPrimeroClick(Sender: TObject);
begin
  CargarDatosHistoricos(FContrato, StrToIntDef(ListaEndosos.Strings[0], ART_EMPTY_ID));
end;

procedure TfrmContratoTarifa.tbAnteriorClick(Sender: TObject);
var
  iLoop: Integer;
begin
  for iLoop := 0 to ListaEndosos.Count - 1 do
    if StrToIntDef(ListaEndosos.Strings[iLoop], ART_EMPTY_ID) = FIdEndoso then
    begin
      CargarDatosHistoricos(FContrato, StrToIntDef(ListaEndosos.Strings[iLoop - 1], ART_EMPTY_ID));
      Break;
    end;
end;

procedure TfrmContratoTarifa.tbSiguienteClick(Sender: TObject);
var
  iLoop: Integer;
begin
  for iLoop := 0 to ListaEndosos.Count - 1 do
    if StrToIntDef(ListaEndosos.Strings[iLoop], ART_EMPTY_ID) = FIdEndoso then
    begin
      CargarDatosHistoricos(FContrato, StrToIntDef(ListaEndosos.Strings[iLoop + 1], ART_EMPTY_ID));
      Break;
    end;
end;

procedure TfrmContratoTarifa.tbUltimoClick(Sender: TObject);
begin
  CargarDatosHistoricos(FContrato, StrToIntDef(ListaEndosos.Strings[ListaEndosos.Count - 1], ART_EMPTY_ID));
end;

procedure TfrmContratoTarifa.tbNuevoClick(Sender: TObject);
begin
  if tbNuevo.ImageIndex = 6 then //Nuevo
  begin
    tbNuevo.Hint := 'Cancelar';
    tbNuevo.ImageIndex := 8;
    CargarDatosHistoricos(FContrato, StrToIntDef(ListaEndosos.Strings[ListaEndosos.Count - 1], ART_EMPTY_ID));
    tbGuardar.Enabled   := True;
    tbCartaDoc.Enabled  := False;
    tbPrimero.Enabled   := False;
    tbAnterior.Enabled  := False;
    tbSiguiente.Enabled := False;
    tbUltimo.Enabled    := False;
    edtbEndoso.Text     := '';
    ClearControles;
    fraTC_USUARIOAUTORIZA_ALTA.Visible := True;
    LockearControles(False);
    DisableEditControls;
  end
  else
  begin
    tbNuevo.Hint := 'Nuevo (Ctrl+N)';
    tbNuevo.ImageIndex := 6;
    tbGuardar.Enabled  := False;
    tbCartaDoc.Enabled := True;
    LockearControles(True);

    //Vuelvo al ultimo registro
    CargarDatosHistoricos(FContrato, StrToIntDef(ListaEndosos.Strings[ListaEndosos.Count - 1], ART_EMPTY_ID));
    fraTC_USUARIOAUTORIZA_ALTA.Visible := False;
  end;
end;

procedure TfrmContratoTarifa.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContratoTarifa.tbGuardarClick(Sender: TObject);
begin
  edVigenciaDesde.SetFocus;
  isValidar;
  DoGuardar;
  ModalResult := mrOK;
end;

procedure TfrmContratoTarifa.fraEN_MOTIVOChange(Sender: TObject);
var
  bTemp: Boolean;
  sCond: String;
  sSql: String;
begin
  sSql :=
    'SELECT tb_especial2' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''MOTEN''' +
      ' AND tb_codigo = :codigo';
  sCond := ValorSqlEx(sSql, [fraEN_MOTIVO.Value]);

  cbEN_ENVIOSRT.Checked         := (Copy(sCond, 1, 1) = 'S');
  cbEN_ENVIOCARTA.Checked       := (Copy(sCond, 3, 1) = 'S');
  cbEN_ENDOSOAUTOMATICO.Checked := (Copy(sCond, 4, 1) = 'S');

  if (fraEN_MOTIVO.Value = '03.02') or (fraEN_MOTIVO.Value = '03.03') then
  begin
    sSql :=
      'SELECT   ht_vigenciatarifa' +
         ' FROM aht_historicotarifario' +
        ' WHERE ht_contrato = :contrato' +
     ' ORDER BY ht_id DESC';
    cmbTC_VIGENCIATARIFA.Date := ValorSqlDateTimeEx(sSql, [FContrato]);
  end;

  bTemp := FRecalcular;
  FRecalcular := False;
  try
    DoCambioInv(nil);
  finally
    FRecalcular := bTemp;
  end;
end;

procedure TfrmContratoTarifa.tbCartaDocClick(Sender: TObject);
var
  bPoseeCartas: Boolean;
  iIdEndoso: Integer;
  {$IFNDEF SUSCRIPCIONES}
  iIdFormulario: Integer;
  {$ENDIF}  
  sSql: String;
begin
  //Chequea que no tenga otras cartas asociadas
  {$IFNDEF SUSCRIPCIONES}
  sSql :=
    'SELECT co_idformulario' +
     ' FROM aco_contrato' +
    ' WHERE co_contrato = :contrato';
  iIdFormulario := ValorSqlIntegerEx(sSql, [FContrato]);
  {$ENDIF}

  bPoseeCartas := False;
  if FEsEndosoTemporal then
  begin
    Exception.Create('No se pueden generar cartas para endosos temporales.');

    sSql :=
      'SELECT et_id' +
       ' FROM tet_endosotarifa' +
      ' WHERE et_fechabaja IS NULL' +
        ' AND et_contrato = :contrato';
    iIdEndoso := ValorSqlIntegerEx(sSql, [FContrato]);

    sSql :=
      'SELECT 1' +
       ' FROM cca_carta' +
      ' WHERE ca_idendosotemp = :endoso';
    if ExisteSqlEx(sSql, [iIdEndoso]) then
     bPoseeCartas := True;
  end
  else
  begin
    iIdEndoso := FIdEndoso;

    sSql :=
      'SELECT 1' +
       ' FROM cca_carta' +
      ' WHERE ca_idendoso = :endoso';
    if ExisteSqlEx(sSql, [iIdEndoso]) then
     bPoseeCartas := True;
  end;

  if (not bPoseeCartas) or MsgAsk('Ya se ha generado una carta asociada a este endoso.' + #13#10 + '¿ Desea continuar ?') then
  begin
    {$IFNDEF SUSCRIPCIONES}
    BeginTrans;
    try
      with TfrmAfiGeneracionCartas.Create(Self) do
      try
        Execute(iIdFormulario, iIdEndoso, FContrato, True, FEsEndosoTemporal);
      finally
        Free;
      end;
      CommitTrans;
    except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Error al generar la carta')
      end;
    end;
    {$ENDIF}
  end;
end;

procedure TfrmContratoTarifa.lbTarifaPendienteClick(Sender: TObject);
begin
  {$IFNDEF SUSCRIPCIONES}
  if not Seguridad.ControlHabilitado(frmPrincipal, frmPrincipal.mnuConfirmacionEndosos) then
    Exit;

  Application.CreateForm(TfrmConfirmaTarifa, frmConfirmaTarifa);
  try
    frmConfirmaTarifa.chkContratosActivos.Checked := False;
    frmConfirmaTarifa.fraEmpresa.Contrato := FContrato;
    frmConfirmaTarifa.FormStyle := fsNormal;
    frmConfirmaTarifa.Visible := False;

    LockControl(frmConfirmaTarifa.fraEmpresa);
    frmConfirmaTarifa.tbRefrescarClick(nil);
    frmConfirmaTarifa.ShowModal;
  finally
    FreeAndNil(frmConfirmaTarifa);
  end;
  {$ELSE}
  Exit;
  {$ENDIF}
end;

procedure TfrmContratoTarifa.edResolucion529VariableExit(Sender: TObject);
begin
  Verificar((edResolucion529Variable.Value < 0) or (edResolucion529Variable.Value > 100), edResolucion529Variable, 'La Resolución Nº 529 debe estar entre 0 y 100.');
end;

end.
