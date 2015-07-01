unit unQRAnalisis;

interface

uses
  {$IFDEF VER140}Variants, {$ENDIF} {$IFDEF VER150}Variants, {$ENDIF} Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms,
  Quickrpt, QRCtrls, unAdminCotizacion, unQRLabelEx, QRTansparentImage, Db, SDEngine;

type
  TQRAnalisis = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    qrSini1: TQRLabelEx;
    qrSini2: TQRLabelEx;
    qrSini3: TQRLabelEx;
    qrSini4: TQRLabelEx;
    qrSini6: TQRLabelEx;
    qrSini7: TQRLabelEx;
    qrSini8: TQRLabelEx;
    qrSini9: TQRLabelEx;
    qrSini10: TQRLabelEx;
    DetailBand1: TQRBand;
    QRLabel36: TQRLabelEx;
    QRLabel37: TQRLabelEx;
    QRLabel38: TQRLabelEx;
    QRLabel39: TQRLabelEx;
    QRLabel43: TQRLabelEx;
    QRLabel441: TQRLabelEx;
    qrDatos4: TQRLabelEx;
    qrDatos5: TQRLabelEx;
    qrSini11: TQRLabelEx;
    qrSini12: TQRLabelEx;
    qrSini13: TQRLabelEx;
    QRLabel1: TQRLabelEx;
    qrDatos1: TQRLabelEx;
    qrDatos2: TQRLabelEx;
    qrDatos3: TQRLabelEx;
    QRLabel40: TQRLabelEx;
    QRLabel41: TQRLabelEx;
    QRLabel42: TQRLabelEx;
    qrTari1: TQRLabelEx;
    qrTari3: TQRLabelEx;
    qrTari5: TQRLabelEx;
    qrTari2: TQRLabelEx;
    qrTari4: TQRLabelEx;
    qrTari6: TQRLabelEx;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabelEx5: TQRLabelEx;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    qrDetalle9: TQRLabel;
    qrDetalle1: TQRLabel;
    qrDetalle10: TQRLabel;
    qrDetalle2: TQRLabel;
    qrDetalle11: TQRLabel;
    qrDetalle3: TQRLabel;
    qrDetalle12: TQRLabel;
    qrDetalle4: TQRLabel;
    qrDetalle13: TQRLabel;
    qrDetalle5: TQRLabel;
    qrDetalle14: TQRLabel;
    qrDetalle6: TQRLabel;
    qrDetalle15: TQRLabel;
    qrDetalle7: TQRLabel;
    qrDetalle16: TQRLabel;
    qrDetalle8: TQRLabel;
    qrDetalle17: TQRLabelEx;
    qrDetalle18: TQRLabelEx;
    QRLabel86: TQRLabel;
    qrDetalle19: TQRLabelEx;
    QRLabelEx12: TQRLabelEx;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    lbEstadoFidelitas: TQRLabel;
    lbStatusBCRA: TQRLabel;
    QRLabel44: TQRLabelEx;
    QRLabelEx16: TQRLabelEx;
    QRLabelEx17: TQRLabelEx;
    QRLabelEx18: TQRLabelEx;
    QRLabelEx19: TQRLabelEx;
    QRLabelEx20: TQRLabelEx;
    QRLabelEx21: TQRLabelEx;
    QRLabelEx22: TQRLabelEx;
    qrCart1: TQRLabelEx;
    qrCart2: TQRLabelEx;
    qrCart3: TQRLabelEx;
    qrCart4: TQRLabelEx;
    qrCart5: TQRLabelEx;
    qrCart6: TQRLabelEx;
    QRLabelEx29: TQRLabelEx;
    qrCart25: TQRLabelEx;
    QRLabelEx31: TQRLabelEx;
    qrComp5: TQRLabelEx;
    qrComp6: TQRLabelEx;
    qrComp7: TQRLabelEx;
    qrComp8: TQRLabelEx;
    qrComp1: TQRLabelEx;
    qrComp2: TQRLabelEx;
    qrComp3: TQRLabelEx;
    qrComp4: TQRLabelEx;
    QRLabelEx33: TQRLabelEx;
    qrCobrar1: TQRLabelEx;
    qrCobrar2: TQRLabelEx;
    QRLabelEx45: TQRLabelEx;
    QRLabelEx46: TQRLabelEx;
    QRLabelEx57: TQRLabelEx;
    qrCobrar3: TQRLabelEx;
    QRLabelEx59: TQRLabelEx;
    QRLabelEx60: TQRLabelEx;
    QRLabelEx61: TQRLabelEx;
    QRLabelEx62: TQRLabelEx;
    qrFecha1: TQRLabelEx;
    QRLabelEx64: TQRLabelEx;
    lbAutorizoArea: TQRLabelEx;
    QRLabelEx66: TQRLabelEx;
    qrFirma1: TQRTansparentImage;
    qrFirma2: TQRTansparentImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrEnc1: TQRLabel;
    qrEnc2: TQRLabel;
    qrEnc3: TQRLabel;
    QRLabel101: TQRLabel;
    qrObs1: TQRMemo;
    qrCart7: TQRLabelEx;
    qrCart8: TQRLabelEx;
    qrCart9: TQRLabelEx;
    qrCart10: TQRLabelEx;
    qrCart11: TQRLabelEx;
    qrCart12: TQRLabelEx;
    qrCart13: TQRLabelEx;
    qrCart14: TQRLabelEx;
    qrCart15: TQRLabelEx;
    qrCart16: TQRLabelEx;
    qrCart17: TQRLabelEx;
    qrCart18: TQRLabelEx;
    qrCart19: TQRLabelEx;
    qrCart20: TQRLabelEx;
    qrCart21: TQRLabelEx;
    qrCart22: TQRLabelEx;
    qrCart23: TQRLabelEx;
    qrCart24: TQRLabelEx;
    qrUsu1: TQRLabelEx;
    qrUsu2: TQRLabelEx;
    QRLabelEx2: TQRLabelEx;
    QRLabelEx3: TQRLabelEx;
    QRLabelEx4: TQRLabelEx;
    QRLabelEx6: TQRLabelEx;
    QRLabelEx7: TQRLabelEx;
    qrActual1: TQRLabelEx;
    qrActual2: TQRLabelEx;
    qrActual3: TQRLabelEx;
    qrActual4: TQRLabelEx;
    qrActual5: TQRLabelEx;
    QRLabelEx1: TQRLabelEx;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabelEx8: TQRLabelEx;
    qrNroCotizacion: TQRLabelEx;
    QRLabelEx9: TQRLabelEx;
    qrCart26: TQRLabelEx;
    QRLabelEx10: TQRLabelEx;
    qrComi1: TQRLabelEx;
    qrResc1: TQRLabelEx;
    qrResc2: TQRLabelEx;
    qrResc3: TQRLabelEx;
    QRLabel49: TQRLabel;
    qrEnc5: TQRLabel;
    QRLabel50: TQRLabel;
    qrResc4: TQRLabelEx;
    QRLabel52: TQRLabel;
    qrEnc4: TQRLabel;
    QRLabelEx11: TQRLabelEx;
    QRLabelEx14: TQRLabelEx;
    QRLabelEx15: TQRLabelEx;
    QRLabelEx23: TQRLabelEx;
    QRLabelEx24: TQRLabelEx;
    QRLabelEx25: TQRLabelEx;
    qrEvol1: TQRLabelEx;
    qrEvol2: TQRLabelEx;
    qrEvol3: TQRLabelEx;
    qrEvol4: TQRLabelEx;
    qrEvol5: TQRLabelEx;
    qrEvol6: TQRLabelEx;
    qrEvol9: TQRLabelEx;
    qrEvol10: TQRLabelEx;
    qrEvol11: TQRLabelEx;
    qrEvol12: TQRLabelEx;
    qrEvol13: TQRLabelEx;
    qrEvol14: TQRLabelEx;
    QRLabel48: TQRLabel;
    qrDetalle20: TQRLabelEx;
    QRLabel20: TQRLabel;
    QRLabelEx26: TQRLabelEx;
    qrEvol7: TQRLabelEx;
    qrEvol15: TQRLabelEx;
    QRLabelEx51: TQRLabelEx;
    qrEvol8: TQRLabelEx;
    qrEvol16: TQRLabelEx;
    QRLabelEx55: TQRLabelEx;
    qrEvol17: TQRLabelEx;
    qrEvol18: TQRLabelEx;
    QRLabel21: TQRLabel;
    qrResc5: TQRLabelEx;
    QRLabelEx27: TQRLabelEx;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    qrEnc6: TQRLabel;
    QRLabelEx28: TQRLabelEx;
    QRLabelEx30: TQRLabelEx;
    qrNombreART: TQRLabel;
    sdqCS: TSDQuery;
    sdqConsultaHistorico: TSDQuery;
    sdqDetalles: TSDQuery;
    QRLabelEx32: TQRLabelEx;
    qrEvol19: TQRLabelEx;
    qrEvol20: TQRLabelEx;
    lbCiiuExcluido: TQRLabel;
    QRLabelEx34: TQRLabelEx;
    lbPrimaXCapita: TQRLabelEx;
    lbPrimaSalario: TQRLabelEx;
    lbSalarioPromedio: TQRLabelEx;
    QRLabel25: TQRLabel;
    qrObsComercial: TQRMemo;
    QRLabel26: TQRLabel;
    qrSini14: TQRLabelEx;
    QRLabel27: TQRLabel;
    qrSini15: TQRLabelEx;
    QRLabel28: TQRLabel;
    qrSini16: TQRLabelEx;
    QRLabel29: TQRLabel;
    qrSini17: TQRLabelEx;
    QRLabel30: TQRLabel;
    qrSini18: TQRLabelEx;
    QRLabel51: TQRLabel;
    qrSini19: TQRLabelEx;
  public
    function Preparar(aIdCotizacion: Integer): Boolean; overload;
    function Preparar(Form: TFrmAdminCotizacion): Boolean; overload;
  end;
var
  qrAnalisis: TqrAnalisis;
  qrAnalisisHistorico: TqrAnalisis;

implementation

uses
  unDmPrincipal, unCustomDataModule, unPrincipal, Dialogs, StrFuncs, unCargaSRTCoti, unART, unCotizacion, General, AnsiSql;

{$R *.DFM}

function TQRAnalisis.Preparar(aIdCotizacion: Integer): Boolean;
  function ObtenerSumatoriaDeMinimos(DataSet: TDataSet): String;
  var
    Resultado: Extended;
  begin
    Resultado := 0;

    with DataSet do
    begin
      First;
      while not Eof do
      begin
        if Fields[0].AsFloat > Fields[1].AsFloat then
          Resultado := Resultado + Fields[1].AsFloat
        else
          Resultado := Resultado + Fields[0].AsFloat;

        Next;
      end;
      Result := ToStr(Resultado);
    end;
  end;

var
  CantidadTrabajadores: Integer;
  Consulta: TSDQuery;
  Divisor: Extended;
  Gastos: Extended;
  i: Integer;
  MasaSalarial: Currency;
  nCantidadILP5066: Integer;
  nCantidadILPMas66: Integer;
  Nivel: String;
  Operacion: String;
  PorcComercial: Extended;
  PorcSSN: Currency;
  Rescision: String;
  sSql: String;
  TarComercial: Currency;
  TarSSN: Currency;
begin
  Result := True;
  CantidadTrabajadores := MAXINT;
//  MasaSalarial := MAXINT;

  with sdqCS do
  begin
    Close;
    ParamByName('id').AsInteger := aIdCotizacion;
    Open;
  end;

  with sdqConsultaHistorico do
  begin
    Close;
    ParamByName('id').AsInteger := aIdCotizacion;
    Open;

    with sdqDetalles do
    begin
      Close;
      ParamByName('id').AsInteger := aIdCotizacion;
      Open;
    end;

    //Formateo de campos
    FieldByName('co_cuit').EditMask := EMSK_CUIT;
    TFloatField(FieldByName('co_masasalarial')).Currency := True;
    FieldByName('co_masasalarial').EditMask := '$ #.###,##';

    //Completo el encabezado
    qrEnc1.Caption := FieldByName('co_razonsocial').AsString;
    qrEnc2.Caption := FieldByName('co_cuit').DisplayText;
    qrEnc3.Caption := FieldByName('ac_relacion').AsString + '  ' + FieldByName('ac_descripcion').AsString;
    lbCiiuExcluido.Enabled := (ValorSqlEx('SELECT ac_excluido' +
                                           ' FROM cac_actividad' +
                                          ' WHERE ac_codigo = :codigo', [FieldByName('AC_CODIGO').AsInteger]) = 'S');
    qrEnc4.Caption := FieldByName('sc_actividadreal').AsString;
    qrEnc5.Caption := FieldByName('ca_descripcion').AsString;
    qrEnc6.Caption := FieldByName('en_nombre').AsString;

    // Operacion correspondiente a la ART Actual
    sSql :=
      'SELECT tb_descripcion' +
       ' FROM tss_solicitudsrt a1, ctb_tablas' +
      ' WHERE tb_codigo = a1.ss_operacion' +
        ' AND tb_clave = :clave' +
        ' AND a1.ss_id = (SELECT NVL(MAX(a2.ss_id), ''0'')' +
                          ' FROM tss_solicitudsrt a2' +
                         ' WHERE a2.ss_idcotizacion = :idcotizacion)';
    Operacion := ValorSqlEx(sSql, ['COPER', aIdCotizacion], '-');

    // Nombre correspondiente a la última ART
    sSql :=
      'SELECT ar_nombre' +
       ' FROM tss_solicitudsrt a1, aar_art' +
      ' WHERE a1.ss_idart = ar_id' +
        ' AND a1.ss_id = (SELECT NVL(MAX(a2.ss_id), ''0'')' +
                          ' FROM tss_solicitudsrt a2' +
                         ' WHERE a2.ss_idcotizacion = :idcotizacion)';
    qrNombreART.Caption := ValorSqlEx(sSql, [aIdCotizacion], '-');

    //NroCotizacion
    if FieldByName('co_empresanueva').AsString = 'S' then
    begin
      qrDatos1.Caption := FieldByName('co_canttrabajador').AsString;
      qrDatos5.Caption := FieldByName('co_masasalarial').DisplayText;
    end
    else
    begin
      qrDatos1.Caption := sdqCS.FieldByName('cs_promediotrabajadores').AsString;
      qrDatos5.Caption := '$ ' + ToStr(ToFloat(sdqCS.FieldByName('cs_promediotrabajadores').AsString) *
                                 FieldByName('co_masasalarial').AsFloat / FieldByName('co_canttrabajador').AsFloat);
    end;

    qrNroCotizacion.Caption := Format('%d/%d', [FieldByName('co_nrocotizacion').AsInteger, FieldByName('co_orden').AsInteger]);

    qrDatos2.Caption := ToStr(FieldByName('co_masasalarial').AsFloat / FieldByName('co_canttrabajador').AsFloat);
    qrDatos3.Caption := sdqCS.FieldByName('cs_periodocubierto').AsString;
    qrDatos4.Caption := FieldByName('co_nivel').AsString;

    qrSini1.Caption  := sdqCS.FieldByName('cs_cantsiniestro').AsString;
    qrSini14.Caption := sdqCS.FieldByName('cs_cantsiniestrosinbaja').AsString;
    qrSini2.Caption  := sdqCS.FieldByName('cs_cantsiniestroconbaja').AsString;
    qrSini3.Caption  := sdqCS.FieldByName('cs_cantmuerte').AsString;
    qrSini4.Caption  := sdqCS.FieldByName('cs_cantsiniestroinitinere').AsString;
    qrSini16.Caption := sdqCS.FieldByName('cs_cantsiniestrosintipo').AsString;
    qrSini17.Caption := sdqCS.FieldByName('cs_cantsiniestroconincapacidad').AsString;
    qrSini6.Caption  := sdqCS.FieldByName('cs_cantipp50').AsString;
    qrSini7.Caption  := sdqCS.FieldByName('cs_cantipp5066').AsString;
    qrSini8.Caption  := sdqCS.FieldByName('cs_cantincapacidadtotal').AsString;
    qrSini18.Caption := sdqCS.FieldByName('cs_cantsiniestrosinporcentaje').AsString;
    qrSini9.Caption  := sdqCS.FieldByName('cs_cantdiasbajaart').AsString;
    qrSini10.Caption := sdqCS.FieldByName('cs_cantdiasilt').AsString;
    qrSini19.Caption := sdqCS.FieldByName('cs_diasiltempleador').AsString;
    try
      if ToFloat(qrDatos3.Caption) <> 0 then
        qrSini11.Caption := '% ' + ToStr(ToFloat(qrSini1.Caption) / ToFloat(qrDatos1.Caption) / ToFloat(qrDatos3.Caption) * 12 * 100)
      else
        qrSini11.Caption := '-';
    except
      qrSini11.Caption := '-';
    end;
    qrSini12.Caption := sdqCS.FieldByName('cs_cantmuerteinitinere').AsString;
    qrSini15.Caption := sdqCS.FieldByName('cs_cantaccidentetrabajo').AsString;

    if FieldByName('co_costomedico').AsInteger = 0 then
      qrSini13.Caption := '$ 0,00'
    else
      qrSini13.Caption := FieldByName('co_costomedico').AsString;

    qrEvol1.Caption  := '% ' + ToStr(Get_EvolucionAnual(aIdCotizacion, 1996));
    qrEvol2.Caption  := '% ' + ToStr(Get_EvolucionAnual(aIdCotizacion, 1997));
    qrEvol3.Caption  := '% ' + ToStr(Get_EvolucionAnual(aIdCotizacion, 1998));
    qrEvol4.Caption  := '% ' + ToStr(Get_EvolucionAnual(aIdCotizacion, 1999));
    qrEvol5.Caption  := '% ' + ToStr(Get_EvolucionAnual(aIdCotizacion, 2000));
    qrEvol6.Caption  := '% ' + ToStr(Get_EvolucionAnual(aIdCotizacion, 2001));
    qrEvol7.Caption  := '% ' + ToStr(Get_EvolucionAnual(aIdCotizacion, 2002));
    qrEvol8.Caption  := '% ' + ToStr(Get_EvolucionAnual(aIdCotizacion, 2003));
    qrEvol17.Caption := '% ' + ToStr(Get_EvolucionAnual(aIdCotizacion, 2004));
    qrEvol19.Caption := '% ' + ToStr(Get_EvolucionAnual(aIdCotizacion, 2005));

    qrEvol9.Caption  := '';//'$ ' + GridEvolucionAnual.Cells[1,1];
    qrEvol10.Caption := '';//'$ ' + GridEvolucionAnual.Cells[2,1];
    qrEvol11.Caption := '';//'$ ' + GridEvolucionAnual.Cells[3,1];
    qrEvol12.Caption := '';//'$ ' + GridEvolucionAnual.Cells[4,1];
    qrEvol13.Caption := '';//'$ ' + GridEvolucionAnual.Cells[5,1];
    qrEvol14.Caption := '';//'$ ' + GridEvolucionAnual.Cells[6,1];
    qrEvol15.Caption := '';//'$ ' + GridEvolucionAnual.Cells[7,1];
    qrEvol16.Caption := '';//'$ ' + GridEvolucionAnual.Cells[8,1];
    qrEvol18.Caption := '';//'$ ' + GridEvolucionAnual.Cells[9,1];
    qrEvol20.Caption := '';
    {Detalles !!!}

    qrDetalle1.Caption := '$ ' + ToStr(FieldByName('co_costomedico').AsFloat * sdqCS.FieldByName('cs_cantsiniestro').AsFloat);
    qrDetalle2.Caption := '$ ' + ToStr(sdqCS.FieldByName('cs_cantdiasbajaart').AsFloat * FieldByName('co_masasalarial').AsFloat / FieldByName('co_canttrabajador').AsFloat / 30.4 * 1.33);

    {ILP < 50%}
    sSql :=
      'SELECT 180000 *(di_porcentaje / 100), ROUND(53 * 65 / NVL(di_edad, 1) * :salariopromedio *(di_porcentaje / 100), 2) AS ilp50' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :co_id' +
        ' AND di_porcentaje < :porcentaje' +
        ' AND di_muerte = :muerte';
    Consulta := GetQueryEx(sSql, [sdqDetalles.FieldByName('SalarioPromedio').AsFloat, aIdCotizacion, 50, 'N']);
    qrDetalle3.Caption := '$ ' + ObtenerSumatoriaDeMinimos(Consulta);

    {ILP entre 50% y 66%}
    sSql :=
      'SELECT COUNT(*)' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_porcentaje > :porcentajeminimo' +
        ' AND di_porcentaje < :porcentajemaximo' +
        ' AND di_muerte = :muerte';
    nCantidadILP5066 := ValorSqlIntegerEx(sSql, [aIdCotizacion, 50, 66, 'N']);

    if (nCantidadILP5066 > 0) then
    begin
      sSql :=
        'SELECT ROUND(art.afiliacion.get_valoractuarial(di_sexo, di_edad) * :salariopromedio *(di_porcentaje / 100), 2),' +
              ' 180000 /*Indemnizacion_Tope*/ +(:incap5066adicvalorcartera /*Indemnizacion_Inca5066*/ * :ncantidadilp5066) AS ilp5066' +
         ' FROM adi_detalleilp' +
        ' WHERE di_idcotizacion = :idcotizacion' +
          ' AND di_porcentaje > :porcentajeminimo' +
          ' AND di_porcentaje < :porcentajemaximo' +
          ' AND di_muerte = :muerte';
      Consulta := GetQueryEx(sSql, [sdqDetalles.FieldByName('SalarioPromedio').AsFloat, INCAP5066ADICVALORCARTERA, nCantidadILP5066, aIdCotizacion, 50, 66, 'N']);

      qrDetalle4.Caption := '$ ' + ObtenerSumatoriaDeMinimos(Consulta);
    end
    else
      qrDetalle4.Caption := '$ 0,00';

    {ILP > 66%}
    sSql :=
      'SELECT COUNT(*)' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_porcentaje > :porcentaje' +
        ' AND di_muerte = :muerte';
    nCantidadILPMas66 := ValorSqlIntegerEx(sSql, [aIdCotizacion, 66, 'N']);
    
    if (nCantidadILPMas66 > 0) then
    begin
      sSql :=
        'SELECT 180000 /*Indemnizacion_Tope*/ +(:incap66100adicvalorcartera /*Indemnizacion_IncaMas66*/ * :ncantidadilpmas66) AS tope,' +
              ' ROUND(53 *(65 / NVL(di_edad, 1) * :salariopromedio), 2) AS ilpmas66' +
         ' FROM adi_detalleilp' +
        ' WHERE di_idcotizacion = :idcotizacion' +
          ' AND di_porcentaje > :porcentaje' +
          ' AND di_muerte = :muerte';
      Consulta := GetQueryEx(sSql, [INCAP66100ADICVALORCARTERA, nCantidadILPMas66, sdqDetalles.FieldByName('SalarioPromedio').AsFloat{SalarioPromedio}, aIdCotizacion, 66, 'N']);

      qrDetalle5.Caption := '$ ' + ObtenerSumatoriaDeMinimos(Consulta);
    end
    else
      qrDetalle5.Caption := '$ 0,00';

    {Mortales}
    sSql :=
      'SELECT :muerteadicvalorcartera /*Indemnizacion_Muerte*/ AS topemuerte,' +
            ' ROUND(53 *(65 / NVL(di_edad, 1) * :salariopromedio), 2) AS ilpmas66' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_muerte = :muerte';
    Consulta := GetQueryEx(sSql, [MUERTEADICVALORCARTERA, sdqDetalles.FieldByName('SalarioPromedio').AsFloat{SalarioPromedio}, aIdCotizacion, 'S']);
    qrDetalle6.Caption := '$ ' + ObtenerSumatoriaDeMinimos(Consulta);

    {Reserva}
    qrDetalle7.Caption := '$ ' + ToStr(0);
    {Gastos Administrativos}
    Gastos := 0;
    for i := 2 to 7 do
      Gastos := Gastos + ToFloat(TQRLabel(Self.FindComponent('qrDetalle' + IntToStr(i))).Caption);

    qrDetalle8.Caption := '$ ' + ToStr(0.4*Gastos);

    Divisor := sdqDetalles.FieldByName('factor').AsFloat{Factor};

    if Divisor <> 0 then
    begin
      qrDetalle9.Caption  := '$ ' + ToStr(ToFloat(qrDetalle1.Caption)/Divisor);
      qrDetalle10.Caption := '$ ' + ToStr(ToFloat(qrDetalle2.Caption)/Divisor);
      qrDetalle11.Caption := '$ ' + ToStr(ToFloat(qrDetalle3.Caption)/Divisor);
      qrDetalle12.Caption := '$ ' + ToStr(ToFloat(qrDetalle4.Caption)/Divisor);
      qrDetalle13.Caption := '$ ' + ToStr(ToFloat(qrDetalle5.Caption)/Divisor);
      qrDetalle14.Caption := '$ ' + ToStr(ToFloat(qrDetalle6.Caption)/Divisor);
      qrDetalle15.Caption := '$ ' + ToStr(ToFloat(qrDetalle7.Caption)/Divisor);
      qrDetalle16.Caption := '$ ' + ToStr(ToFloat(qrDetalle8.Caption)/Divisor);
      qrDetalle17.Caption := '$ ' + ToStr(Gastos);
      qrDetalle18.Caption := '$ ' + ToStr(ToFloat(qrDetalle17.Caption)/Divisor);
      qrDetalle19.Caption := qrDetalle18.Caption;
      qrDetalle20.Caption := '$ ' + ToStr(ToFloat(qrDetalle18.Caption)/1.4 + 2.80, 2);
    end
    else
    begin
      qrDetalle9.Caption  := '$ -';
      qrDetalle10.Caption := '$ -';
      qrDetalle11.Caption := '$ -';
      qrDetalle12.Caption := '$ -';
      qrDetalle13.Caption := '$ -';
      qrDetalle14.Caption := '$ -';
      qrDetalle15.Caption := '$ -';
      qrDetalle16.Caption := '$ -';
      qrDetalle17.Caption := '$ -';
      qrDetalle18.Caption := '$ -';
      qrDetalle19.Caption := '$ -';
      qrDetalle20.Caption := '$ -';
    end;

    //Carga el tarifario de la ssn
    try
      Nivel       := qrDatos4.Caption;
      TarifaSSN(Nivel, FieldByName('co_idactividad').AsInteger, FieldByName('co_fechaconfecciono').AsDateTime, TarSSN, PorcSSN);
      TarSSN := TarSSN + 0.6; //Ajusta la suma fija derivada a la SSN
      qrTari1.Caption := '$ ' + ToStr(TarSSN, 2);
      qrTari3.Caption := '% ' + ToStr(PorcSSN, 3);
      qrTari5.Caption := '$ ' + ToStr(TarSSN + PorcSSN * ToFloat(qrDatos2.Caption) / 100, 2);
    except
      qrTari1.Caption := '$ -';
      qrTari3.Caption := '% -';
      qrTari5.Caption := '$ -';
    end;

    //Carga el tarifario comercial
    try
      if sdqCS.FieldByName('cs_promediotrabajadores').AsString = '0' then
      begin
        CantidadTrabajadores := FieldByName('co_canttrabajador').AsInteger;
        MasaSalarial         := FieldByName('co_masasalarial').AsFloat;
      end
      else
      begin
        CantidadTrabajadores := sdqCS.FieldByName('cs_promediotrabajadores').AsInteger;
        MasaSalarial         := sdqCS.FieldByName('cs_salariocubierto').AsFloat;
      end;

      if (CantidadTrabajadores = 0) then
      begin
        MessageDlg('No se pudo calcular el tarifario comercial: La cantidad de trabajadores ingresada es cero.', mtWarning, [mbOK], 0);
        raise Exception.Create(''); //con esto traslado la ejecucion a la parte de 'EXCEPT'
      end;

      TarifaComercial(FieldByName('co_idactividad').AsInteger, StrToInt(qrDatos1.Caption),
                      FieldByName('co_fechaconfecciono').AsDateTime, TarComercial, PorcComercial);
      qrTari2.Caption := '$ ' + ToStr(TarComercial, 2);
      qrTari4.Caption := '% ' + ToStr(PorcComercial, 3);
      qrTari6.Caption := '$ ' + ToStr(TarComercial+PorcComercial* MasaSalarial /CantidadTrabajadores, 2);
//      qrTari6.Caption := '$ ' + ToStr(TarComercial+PorcComercial*ToFloat(qrDatos2.Caption)/CantidadTrabajadores,2);
    except
      qrTari2.Caption := '$ -';
      qrTari4.Caption := '% -';
      qrTari6.Caption := '$ -';
    end;

    // Costo Siniestral y Fidelitas..
    sSql :=
      'SELECT NVL(co_concie10, 0) concie, NVL(co_sincie10, 0) sincie, NVL(co_frecuencia, 0) frecuencia,' +
            ' NVL(co_cantempresa, 0) cantempresa, NVL(co_cantempresastro, 0) cantempresacon, NVL(co_primaprommercado, 0) primaprom,' +
            ' NVL(co_primaporcsalario, 0) primaporcsalario, NVL(co_salariopromedio, 0) salariopromedio, fidel.tb_descripcion fidel,' +
            ' stbcr.tb_descripcion stbcr' +
       ' FROM aco_cotizacion, ctb_tablas fidel, ctb_tablas stbcr' +
      ' WHERE co_id = :id' +
        ' AND fidel.tb_codigo = co_idfidelitas' +
        ' AND fidel.tb_clave = ''FIDEL''' +
        ' AND stbcr.tb_codigo(+) = co_statusbcra' +
        ' AND stbcr.tb_clave(+) = ''STBCR''';
    with GetQueryEx(sSql, [aIdCotizacion]) do
    try
      lbEstadoFidelitas.Caption := FieldByName('fidel').AsString;
      lbStatusBCRA.Caption := FieldByName('stbcr').AsString;

      //Carga el promedio del mercado
      lbPrimaXCapita.Caption    := '$ ' + FieldByName('primaprom').AsString;
      lbPrimaSalario.Caption    := FieldByName('primaporcsalario').AsString + ' %';
      lbSalarioPromedio.Caption := '$ ' + FieldByName('salariopromedio').AsString;
    finally
      Free;
    end;

    //Cargo la comisión del vendedor
    qrComi1.Caption := '% ' + ToStr(FieldByName('co_comision').AsFloat, 3);

    //Busco la rescision de la ultima srt cargada
    sSql :=
      'SELECT a1.ss_rescision' +
       ' FROM ass_solicitudsrt a1' +
      ' WHERE a1.ss_operacion = ''2''' +
        ' AND a1.ss_id = (SELECT NVL(MAX(a2.ss_id), ''0'')' +
                          ' FROM ass_solicitudsrt a2' +
                         ' WHERE a2.ss_idcotizacion = :idcotizacion)';
    Rescision := ValorSqlEx(sSql, [aIdCotizacion]);
    
    qrResc1.Caption := '';
    qrResc2.Caption := '';
    qrResc3.Caption := '';
    qrResc4.Caption := '';
    qrResc5.Caption := '';
    if Rescision = '01' then
      qrResc1.Caption := 'X'
    else if Rescision = '02' then
      qrResc2.Caption := 'X'
    else if Rescision = '03' then
      qrResc3.Caption := 'X'
    else if (LCase(Operacion) = 'afi.vigente') then
      qrResc4.Caption := 'X'
    else if (FieldByName('co_empresanueva').AsString = 'S') then
      qrResc5.Caption := 'X';

    //Costo Cartera
    sSql :=
      'SELECT   em_cuit, em_nombre, cc_suma, cc_porcentaje, cc_salario, cc_trabajador, cc_costo' +
         ' FROM afi.acc_cotizacioncostocartera, afi.aem_empresa' +
        ' WHERE cc_cuit = em_cuit' +
          ' AND cc_idcotizacion = :id' +
     ' ORDER BY cc_costo';
    with GetQueryEx(sSql, [aIdCotizacion]) do
    try
      for i := 1 to 4 do
      begin
        TQRLabelEx(Self.FindComponent('qrCart' + IntToStr(1 + 6 * (i - 1)))).Caption := IIF(Eof, '-', FieldByName('em_nombre').AsString);
        TQRLabelEx(Self.FindComponent('qrCart' + IntToStr(2 + 6 * (i - 1)))).Caption := IIF(Eof, '-', '$ ' + ToStr(FieldByName('cc_suma').AsFloat));
        TQRLabelEx(Self.FindComponent('qrCart' + IntToStr(3 + 6 * (i - 1)))).Caption := IIF(Eof, '-', '% ' + ToStr(FieldByName('cc_porcentaje').AsFloat, 3));
        TQRLabelEx(Self.FindComponent('qrCart' + IntToStr(4 + 6 * (i - 1)))).Caption := IIF(Eof, '-', '$ ' + ToStr(FieldByName('cc_salario').AsFloat));
        TQRLabelEx(Self.FindComponent('qrCart' + IntToStr(5 + 6 * (i - 1)))).Caption := IIF(Eof, '-', FieldByName('cc_trabajador').AsString);
        TQRLabelEx(Self.FindComponent('qrCart' + IntToStr(6 + 6 * (i - 1)))).Caption := IIF(Eof, '-', '$ ' + ToStr(FieldByName('cc_costo').AsFloat));

        if not Eof then
          Next;
      end;
    finally
      Free;
    end;
    qrCart25.Caption := '$ ' + FieldByName('co_carterapromedio').AsString;
    qrCart26.Caption := '$ ' + FieldByName('co_carterapromediopond').AsString;

    //Art Actual
    if FieldByName('co_empresanueva').AsString = 'S' then
    begin
      qrActual1.Caption := 'Empresa nueva al régimen';
      qrActual2.Caption := '-';
      qrActual3.Caption := '-';
      qrActual4.Caption := '-';
      qrActual5.Caption := '-';
    end
    else
    begin
      sSql :=
        'SELECT ar_id, ar_nombre, co_idartanterior, co_sumafijaanterior, co_porcvariableanterior, co_masasalarial, co_canttrabajador,' +
              ' co_costofinalanterior, co_form931' +
         ' FROM aco_cotizacion, aar_art' +
        ' WHERE co_idartanterior = ar_id(+)' +
          ' AND co_id = :id';
      with GetQueryEx(sSql, [aIdCotizacion]) do
      try
        qrActual1.Caption := FieldByName('ar_nombre').AsString;
        qrActual2.Caption := '$ ' + ToStr(FieldByName('co_sumafijaanterior').AsFloat);
        qrActual3.Caption := '% ' + ToStr(FieldByName('co_porcvariableanterior').AsFloat, 3);
        qrActual4.Caption := '$ ' + ToStr(FieldByName('co_masasalarial').AsFloat / CantidadTrabajadores);
        qrActual5.Caption := '$ ' + ToStr(FieldByName('co_costofinalanterior').AsFloat);
      finally
        Free;
      end
    end;

    {Desde acá...}
    sSql :=
      'SELECT ar_id, ar_nombre, co_suma suma, co_porcentaje porcentaje' +
       ' FROM aco_costootros, aar_art' +
      ' WHERE co_idart = ar_id' +
        ' AND co_idcotizacion = :idcotizacion';
    with GetQueryEx(sSql, [aIdCotizacion]) do
    try
      qrComp1.Caption := '$ ' + ToStr(FieldByName('suma').AsFloat);
      qrComp2.Caption := '% ' + ToStr(FieldByName('porcentaje').AsFloat, 3);
      qrComp3.Caption := '$ ' + ToStr(sdqConsultaHistorico.FieldByName('co_masasalarial').AsFloat / sdqConsultaHistorico.FieldByName('co_canttrabajador').AsFloat);
      qrComp4.Caption := '$ ' + sdqCS.FieldByName('cs_promediotrabajadores').AsString;
    finally
      Free;
    end;

    qrComp5.Caption := '-';
    qrComp6.Caption := '-';
    qrComp7.Caption := '-';
    qrComp8.Caption := '-';
    {Hasta acá...Parece que no se usa...}

    qrCobrar1.Caption := '$ ' + ToStr(FieldByName('tc_sumafija').AsFloat);
    qrCobrar2.Caption := '% ' + ToStr(FieldByName('tc_porcvariable').AsFloat, 3);
    qrCobrar3.Caption := '$ ' + ToStr(FieldByName('tc_costofinal').AsFloat);

    qrFecha1.Caption := FormatDateTime('dd/mm/yyyy', FieldByName('co_fechaconfecciono').AsDateTime);

    //Usuarios
    qrUsu1.Caption := FieldByName('co_usuarioconfecciono').AsString;

    if FieldByName('tc_usutecnica').AsString <> '' then
      qrUsu2.Caption := FieldByName('tc_usutecnica').AsString
    else if FieldByName('tc_usucomite').AsString <> '' then
      qrUsu2.Caption := FieldByName('tc_usucomite').AsString
    else if FieldByName('tc_usucomercial').AsString <> '' then
      qrUsu2.Caption := FieldByName('tc_usucomercial').AsString
    else if FieldByName('tc_usuoperaciones').AsString <> '' then
      qrUsu2.Caption := FieldByName('tc_usuoperaciones').AsString
    else
    	qrUsu2.Caption := ' ';

    sSql :=
      'SELECT sc_descripcion' +
       ' FROM usc_sectores, use_usuarios' +
      ' WHERE sc_codigo = se_sector' +
        ' AND se_usuario = :usuario';
    lbAutorizoArea.Caption := ValorSqlEx(sSql, [UpperCase(qrUsu2.Caption)]);

    //Pongo las observaciones
    qrObs1.Lines.Text := FieldByName('co_observaciones').AsString;

    sSql :=
      'SELECT   tc_observaciones' +
         ' FROM atc_tarifacobrar' +
        ' WHERE tc_idcotizacion = :idcotizacion' +
     ' ORDER BY tc_id DESC';
    qrObsComercial.Lines.Text := ValorSqlEx(sSql, [FieldByName('co_id').AsInteger]);

    // Seteo para que se muestren como quiero

    qrDatos2.Caption := '$ ' + qrDatos2.Caption;

    //Muestro el report
    if Assigned(OnPreview) then
      PreviewModeless
    else
      PreviewModal;
  end;

end;

function TQRAnalisis.Preparar(Form: TFrmAdminCotizacion): boolean;
var
  CantidadTrabajadores: Integer;
  Divisor: Extended;
  Nivel: String;
  NombreART: String;
  Operacion: String;
  PorcComercial: Extended;
  PorcSSN: Currency;
  Rescision: String;
  SalarioPromedio: Currency;
  sSql: String;
  TarComercial: Currency;
  TarSSN: Currency;
begin
  Result := True;

  SalarioPromedio := 0;
  
  with Form do
  begin
    // cargo los labels del encabezado
    qrEnc1.Caption := edCO_RAZONSOCIAL.Text;
    qrEnc2.Caption := edCO_CUIT.EditText;

    sSql :=
      'SELECT ac_excluido, ac_relacion' +
       ' FROM cac_actividad' +
      ' WHERE ac_id = :id';
    with GetQueryEx(sSql, [fraCO_IDACTIVIDAD.Value]) do
    try
      qrEnc3.Caption := FieldByName('ac_relacion').AsString + '  ' + fraCO_IDACTIVIDAD.cmbDescripcion.Text;
      lbCiiuExcluido.Enabled := (FieldByName('ac_excluido').AsString = 'S');
    finally
      Free;
    end;

    qrEnc4.Caption := edfpSC_ACTIVIDADREAL.Text;
    qrEnc5.Caption := frafpSC_CANAL.cmbDescripcion.Text;
    qrEnc6.Caption := frafpSC_ENTIDAD.cmbDescripcion.Text;

    //Operacion correspondiente a la ART Actual
    sSql :=
      'SELECT tb_descripcion' +
       ' FROM tss_solicitudsrt a1, ctb_tablas' +
      ' WHERE tb_codigo = a1.ss_operacion' +
        ' AND tb_clave = ''COPER''' +
        ' AND a1.ss_id = (SELECT NVL(MAX(a2.ss_id), ''0'')' +
                          ' FROM tss_solicitudsrt a2' +
                         ' WHERE a2.ss_idcotizacion = :idcotizacion)';
    Operacion := ValorSqlEx(sSql, [IdCotizacion], '-');

    //Nombre correspondiente a la última ART
    if frmCargaSRTCoti.EmpresaNueva then
      NombreART := 'Nueva al régimen'
    else
    begin
      sSql :=
        'SELECT ar_nombre' +
         ' FROM tss_solicitudsrt a1, aar_art' +
        ' WHERE a1.ss_idart = ar_id' +
          ' AND a1.ss_id = (SELECT NVL(MAX(a2.ss_id), ''0'')' +
                            ' FROM tss_solicitudsrt a2' +
                           ' WHERE a2.ss_idcotizacion = :idcotizacion)';
      NombreART := ValorSqlEx(sSql, [IdCotizacion], '-');
    end;
    qrNombreART.Caption := NombreART;

    // NroCotizacion;
    if frmCargaSRTCoti.EmpresaNueva then
    begin
      qrDatos1.Caption := IntToStr(edCO_CANTTRABAJADOR.Value);
      qrDatos5.Caption := ToStr(edCO_MASASALARIAL.Value);
    end
    else
    begin
      // Toma los datos de la grilla
      qrDatos1.Caption := GridDatos.Cells[GridDatos.ColCount - 1, 2];
      qrDatos5.Caption := ToStr(ToFloat(form.GridDatos.Cells[form.GridDatos.ColCount - 1, 2]) * ToFloat(form.GridDatos.Cells[form.GridDatos.ColCount - 1, 3]));

      if ToFloat(form.GridDatos.Cells[form.GridDatos.ColCount - 1, 2]) > 0 then
        qrDatos5.Caption := ToStr(edCO_CANTTRABAJADOR.Value * edCO_MASASALARIAL.Value /
                            ToFloat(form.GridDatos.Cells[form.GridDatos.ColCount - 1, 2]));
    end;

    qrNroCotizacion.Caption := IntToStr(edCO_NROCOTIZACION.Value);

//    SalarioPromedio  := ToFloat(GridDatos.Cells[GridDatos.ColCount - 1, 3]);
//    qrDatos2.Caption := SalarioPromedio;
    qrDatos2.Caption := ToStr(edCO_MASASALARIAL.Value / edCO_CANTTRABAJADOR.Value);

    qrDatos3.Caption := GridDatos.Cells[GridDatos.ColCount - 1, 1];
    qrDatos4.Caption := edCO_NIVEL.Text;

    qrSini1.Caption  := GridDatos.Cells[GridDatos.ColCount - 1, 3];
    qrSini14.Caption := GridDatos.Cells[GridDatos.ColCount - 1, 4];
    qrSini2.Caption  := GridDatos.Cells[GridDatos.ColCount - 1, 5];
    qrSini3.Caption  := GridDatos.Cells[GridDatos.ColCount - 1, 6];
    qrSini4.Caption  := GridDatos.Cells[GridDatos.ColCount - 1, 9];
    qrSini16.Caption := GridDatos.Cells[GridDatos.ColCount - 1, 10];
    qrSini17.Caption := GridDatos.Cells[GridDatos.ColCount - 1, 11];
    qrSini6.Caption  := GridDatos.Cells[GridDatos.ColCount - 1, 12];
    qrSini7.Caption  := GridDatos.Cells[GridDatos.ColCount - 1, 13];
    qrSini8.Caption  := GridDatos.Cells[GridDatos.ColCount - 1, 14];
    qrSini18.Caption := GridDatos.Cells[GridDatos.ColCount - 1, 15];
    qrSini10.Caption := GridDatos.Cells[GridDatos.ColCount - 1, 16];
    qrSini19.Caption := GridDatos.Cells[GridDatos.ColCount - 1, 17];
    qrSini9.Caption  := GridDatos.Cells[GridDatos.ColCount - 1, 18];
    try
      if ToFloat(qrDatos3.Caption) <> 0 then
        qrSini11.Caption := '% ' + ToStr(ToFloat(qrSini1.Caption) / ToFloat(qrDatos1.Caption) / ToFloat(qrDatos3.Caption) * 12 * 100)
      else
        qrSini11.Caption := '-';
    except
      qrSini11.Caption := '-';
    end;
    qrSini12.Caption := GridDatos.Cells[GridDatos.ColCount - 1, 7];
    qrSini15.Caption := GridDatos.Cells[GridDatos.ColCount - 1, 8];
    if edCO_COSTOMEDICO.Value = 0 then
      qrSini13.Caption := '$ 0,00'
    else
      qrSini13.Caption := edCO_COSTOMEDICO.EditText;

    qrEvol1.Caption  := '% ' + GridEvolucionAnual.Cells[1, 0];
    qrEvol2.Caption  := '% ' + GridEvolucionAnual.Cells[2, 0];
    qrEvol3.Caption  := '% ' + GridEvolucionAnual.Cells[3, 0];
    qrEvol4.Caption  := '% ' + GridEvolucionAnual.Cells[4, 0];
    qrEvol5.Caption  := '% ' + GridEvolucionAnual.Cells[5, 0];
    qrEvol6.Caption  := '% ' + GridEvolucionAnual.Cells[6, 0];
    qrEvol7.Caption  := '% ' + GridEvolucionAnual.Cells[7, 0];
    qrEvol8.Caption  := '% ' + GridEvolucionAnual.Cells[8, 0];
    qrEvol17.Caption := '% ' + GridEvolucionAnual.Cells[9, 0];
    qrEvol19.Caption := '% ' + GridEvolucionAnual.Cells[10, 0];

    qrEvol9.Caption  := '$ ' + GridEvolucionAnual.Cells[1, 1];
    qrEvol10.Caption := '$ ' + GridEvolucionAnual.Cells[2, 1];
    qrEvol11.Caption := '$ ' + GridEvolucionAnual.Cells[3, 1];
    qrEvol12.Caption := '$ ' + GridEvolucionAnual.Cells[4, 1];
    qrEvol13.Caption := '$ ' + GridEvolucionAnual.Cells[5, 1];
    qrEvol14.Caption := '$ ' + GridEvolucionAnual.Cells[6, 1];
    qrEvol15.Caption := '$ ' + GridEvolucionAnual.Cells[7, 1];
    qrEvol16.Caption := '$ ' + GridEvolucionAnual.Cells[8, 1];
    qrEvol18.Caption := '$ ' + GridEvolucionAnual.Cells[9, 1];
    qrEvol20.Caption := '$ ' + GridEvolucionAnual.Cells[10, 1];

    qrDetalle1.Caption := '$ ' + GridCosto.Cells[GridCosto.ColCount - 1, 3];
    qrDetalle2.Caption := '$ ' + GridCosto.Cells[GridCosto.ColCount - 1, 5];
    qrDetalle3.Caption := '$ ' + GridCosto.Cells[GridCosto.ColCount - 1, 7];
    qrDetalle4.Caption := '$ ' + GridCosto.Cells[GridCosto.ColCount - 1, 9];
    qrDetalle5.Caption := '$ ' + GridCosto.Cells[GridCosto.ColCount - 1, 11];
    qrDetalle6.Caption := '$ ' + GridCosto.Cells[GridCosto.ColCount - 1, 13];
    qrDetalle7.Caption := '$ ' + GridCosto.Cells[GridCosto.ColCount - 1, 15];
    qrDetalle8.Caption := '$ ' + GridCosto.Cells[GridCosto.ColCount - 1, 17];

    Divisor := ToFloat(qrDatos1.Caption) * ToFloat(qrDatos3.Caption);

    if Divisor <> 0 then
    begin
      qrDetalle9.Caption  := '$ ' + ToStr(ToFloat(qrDetalle1.Caption ) / Divisor);
      qrDetalle10.Caption := '$ ' + ToStr(ToFloat(qrDetalle2.Caption) / Divisor);
      qrDetalle11.Caption := '$ ' + ToStr(ToFloat(qrDetalle3.Caption) / Divisor);
      qrDetalle12.Caption := '$ ' + ToStr(ToFloat(qrDetalle4.Caption) / Divisor);
      qrDetalle13.Caption := '$ ' + ToStr(ToFloat(qrDetalle5.Caption) / Divisor);
      qrDetalle14.Caption := '$ ' + ToStr(ToFloat(qrDetalle6.Caption) / Divisor);
      qrDetalle15.Caption := '$ ' + ToStr(ToFloat(qrDetalle7.Caption) / Divisor);
      qrDetalle16.Caption := '$ ' + ToStr(ToFloat(qrDetalle8.Caption) / Divisor);
      qrDetalle17.Caption := '$ ' + GridCosto.Cells[GridCosto.ColCount - 1, 19];
      qrDetalle18.Caption := '$ ' + ToStr(ToFloat(qrDetalle17.Caption) / Divisor);
      qrDetalle19.Caption := qrDetalle18.Caption;
      qrDetalle20.Caption := '$ ' + ToStr(ToFloat(qrDetalle18.Caption) / 1.4 + 2.80, 2);
    end
    else
    begin
      qrDetalle9.Caption  := '$ -';
      qrDetalle10.Caption := '$ -';
      qrDetalle11.Caption := '$ -';
      qrDetalle12.Caption := '$ -';
      qrDetalle13.Caption := '$ -';
      qrDetalle14.Caption := '$ -';
      qrDetalle15.Caption := '$ -';
      qrDetalle16.Caption := '$ -';
      qrDetalle17.Caption := '$ -';
      qrDetalle18.Caption := '$ -';
      qrDetalle19.Caption := '$ -';
      qrDetalle20.Caption := '$ -';
    end;

    //Carga el tarifario de la ssn
    try
      Nivel := qrDatos4.Caption;
      TarifaSSN(Nivel, fraCO_IDACTIVIDAD.Value, cmbCO_FECHACONFECCIONO.Date, TarSSN, PorcSSN);
      TarSSN := TarSSN + 0.6; //Ajusta la suma fija derivada a la SSN
      qrTari1.Caption := '$ ' + ToStr(TarSSN, 2);
      qrTari3.Caption := '% ' + ToStr(PorcSSN, 3);
      qrTari5.Caption := '$ ' + ToStr(TarSSN + PorcSSN * ToFloat(qrDatos2.Caption) / 100, 2);
    except
      qrTari1.Caption := '$ -';
      qrTari3.Caption := '% -';
      qrTari5.Caption := '$ -';
    end;

    //Carga el tarifario comercial
    try
      if GridDatos.Cells[GridDatos.ColCount - 1, 2] = '0' then
        CantidadTrabajadores := edCO_CANTTRABAJADOR.Value
      else
        CantidadTrabajadores := StrToInt(GridDatos.Cells[GridDatos.ColCount - 1, 2]);

      if (CantidadTrabajadores = 0) then
      begin
        MessageDlg('No se pudo calcular el tarifario comercial: La cantidad de trabajadores ingresada es cero.', mtWarning, [mbOK], 0);
        raise Exception.Create(''); //con esto traslado la ejecucion a la parte de 'EXCEPT'
      end;
      TarifaComercial(fraCO_IDACTIVIDAD.Value, StrToInt(qrDatos1.Caption), cmbCO_FECHACONFECCIONO.Date, TarComercial,
                      PorcComercial);
      qrTari2.Caption := '$ ' + ToStr(TarComercial, 2);
      qrTari4.Caption := '% ' + ToStr(PorcComercial, 3);
      qrTari6.Caption := '$ ' + ToStr((SalarioPromedio * PorcComercial / 100) + TarComercial , 2);
//      qrTari6.Caption := '$ ' + ToStr(TarComercial + PorcComercial * edCO_MASASALARIAL.Value / CantidadTrabajadores, 2);
//      qrTari6.Caption := '$ ' + ToStr(TarComercial+PorcComercial*ToFloat(qrDatos2.Caption)/CantidadTrabajadores,2);
    except
      qrTari2.Caption := '$ -';
      qrTari4.Caption := '% -';
      qrTari6.Caption := '$ -';
    end;

    // Costo Siniestral y Fidelitas..
    sSql :=
      'SELECT NVL(co_concie10, 0) concie, NVL(co_sincie10, 0) sincie, NVL(co_frecuencia, 0) frecuencia,' +
            ' NVL(co_cantempresa, 0) cantempresa, NVL(co_cantempresastro, 0) cantempresacon, NVL(co_primaprommercado, 0) primaprom,' +
            ' NVL(co_primaporcsalario, 0) primaporcsalario, NVL(co_salariopromedio, 0) salariopromedio, fidel.tb_descripcion fidel,' +
            ' stbcr.tb_descripcion stbcr' +
       ' FROM aco_cotizacion, ctb_tablas fidel, ctb_tablas stbcr' +
      ' WHERE co_id = :id' +
        ' AND fidel.tb_codigo = co_idfidelitas' +
        ' AND fidel.tb_clave = ''FIDEL''' +
        ' AND stbcr.tb_codigo(+) = co_statusbcra' +
        ' AND stbcr.tb_clave(+) = ''STBCR''';
    OpenQueryEx(sdqConsulta, [IdCotizacion], sSql, True);

    lbEstadoFidelitas.Caption := sdqConsulta.FieldByName('fidel').AsString;
    lbStatusBCRA.Caption := sdqConsulta.FieldByName('stbcr').AsString;

    //Carga el promedio del mercado
    lbPrimaXCapita.Caption := '$ ' + sdqConsulta.FieldByName('primaprom').AsString;
    lbPrimaSalario.Caption := sdqConsulta.FieldByName('primaporcsalario').AsString + ' %';
    lbSalarioPromedio.Caption := '$ ' + sdqConsulta.FieldByName('salariopromedio').AsString;

    //Cierro el query
    sdqConsulta.Close;

    //Cargo la comisión del vendedor
    qrComi1.Caption := '% ' + ToStr(edCO_COMISION.Value);

    //Busco la rescision de la ultima srt cargada
    sSql :=
      'SELECT a1.ss_rescision' +
       ' FROM ass_solicitudsrt a1' +
      ' WHERE a1.ss_operacion = ''2''' +
        ' AND a1.ss_id = (SELECT NVL(MAX(a2.ss_id), ''0'')' +
                          ' FROM ass_solicitudsrt a2' +
                         ' WHERE a2.ss_idcotizacion = :idcotizacion)';
    Rescision := ValorSqlEx(sSql, [IdCotizacion]);

    qrResc1.Caption := '';
    qrResc2.Caption := '';
    qrResc3.Caption := '';
    qrResc4.Caption := '';
    qrResc5.Caption := '';
    if Rescision = '01' then
      qrResc1.Caption := 'X'
    else if Rescision = '02' then
      qrResc2.Caption := 'X'
    else if Rescision = '03' then
      qrResc3.Caption := 'X'
    else if (LCase(Operacion) = 'afi.vigente') then
      qrResc4.Caption := 'X'
    else if (frmCargaSRTCoti.EmpresaNueva) then
      qrResc5.Caption := 'X';

    //Costo en cartera
    qrCart1.Caption := GridCostoCartera1.Cells[0,1];
    qrCart2.Caption := '$ ' + GridCostoCartera1.Cells[1,1];
    qrCart3.Caption := '% ' + GridCostoCartera1.Cells[2,1];
    qrCart4.Caption := '$ ' + GridCostoCartera1.Cells[3,1];
    qrCart5.Caption := GridCostoCartera1.Cells[4,1];
    qrCart6.Caption := '$ ' + GridCostoCartera1.Cells[5,1];

    qrCart7.Caption  := GridCostoCartera1.Cells[0,2];
    qrCart8.Caption  := '$ ' + GridCostoCartera1.Cells[1,2];
    qrCart9.Caption  := '% ' + GridCostoCartera1.Cells[2,2];
    qrCart10.Caption := '$ ' + GridCostoCartera1.Cells[3,2];
    qrCart11.Caption := GridCostoCartera1.Cells[4,2];
    qrCart12.Caption := '$ ' + GridCostoCartera1.Cells[5,2];

    qrCart13.Caption := GridCostoCartera1.Cells[0,3];
    qrCart14.Caption := '$ ' + GridCostoCartera1.Cells[1,3];
    qrCart15.Caption := '% ' + GridCostoCartera1.Cells[2,3];
    qrCart16.Caption := '$ ' + GridCostoCartera1.Cells[3,3];
    qrCart17.Caption := GridCostoCartera1.Cells[4,3];
    qrCart18.Caption := '$ ' + GridCostoCartera1.Cells[5,3];

    qrCart19.Caption := GridCostoCartera1.Cells[0,4];
    qrCart20.Caption := '$ ' + GridCostoCartera1.Cells[1,4];
    qrCart21.Caption := '% ' + GridCostoCartera1.Cells[2,4];
    qrCart22.Caption := '$ ' + GridCostoCartera1.Cells[3,4];
    qrCart23.Caption := GridCostoCartera1.Cells[4,4];
    qrCart24.Caption := '$ ' + GridCostoCartera1.Cells[5,4];
    qrCart25.Caption := '$ ' + ToStr(edCO_CARTERAPROMEDIO.Value);
    qrCart26.Caption := '$ ' + ToStr(edCO_CARTERAPROMEDIOPOND.Value);

    //Art Actual
    if frmCargaSRTCoti.EmpresaNueva then
    begin
      qrActual1.Caption := 'Empresa nueva al régimen';
      qrActual2.Caption := '-';
      qrActual3.Caption := '-';
      qrActual4.Caption := '-';
      qrActual5.Caption := '-';
    end
    else
    begin
      qrActual1.Caption := GridCostoCartera3.Cells[0,1];
      qrActual2.Caption := '$ ' + GridCostoCartera3.Cells[1,1];
      qrActual3.Caption := '% ' + GridCostoCartera3.Cells[2,1];
      qrActual4.Caption := '$ ' + GridCostoCartera3.Cells[3,1];
      qrActual5.Caption := '$ ' + GridCostoCartera3.Cells[5,1];
    end;

    {Desde acá...}
      qrComp1.Caption := '$ ' + GridCostoCartera2.Cells[1,1];
      qrComp2.Caption := '% ' + GridCostoCartera2.Cells[2,1];
      qrComp3.Caption := '$ ' + GridCostoCartera2.Cells[3,1];
      qrComp4.Caption := '$ ' + GridCostoCartera2.Cells[5,1];
      qrComp5.Caption := '-';
      qrComp6.Caption := '-';
      qrComp7.Caption := '-';
      qrComp8.Caption := '-';
    {Hasta acá...Parece que no se usa...}

    qrCobrar1.Caption := edTC_SUMAFIJA.DisplayText;
    qrCobrar2.Caption := edTC_PORCVARIABLE.DisplayText;
    qrCobrar3.Caption := edTC_COSTOFINAL.DisplayText;

    qrFecha1.Caption := cmbCO_FECHACONFECCIONO.Text;

    //Usuarios
    qrUsu1.Caption := fraCO_USUARIOCONFECCIONO.edCodigo.Text;
    qrUsu2.Caption := edTC_USUTECNICA.Text;

    sSql :=
      'SELECT sc_descripcion' +
       ' FROM usc_sectores, use_usuarios' +
      ' WHERE sc_codigo = se_sector' +
        ' AND se_usuario = :usuario';
    lbAutorizoArea.Caption := ValorSqlEx(sSql, [UpperCase(edTC_USUTECNICA.Text)]);

    //Pongo las observaciones
    qrObs1.Lines.Text := edCO_OBSERVACIONES.Lines.Text;
    qrObsComercial.Lines.Text := edTC_OBSERVACIONESAlta.Lines.Text;


    //Seteo para que se muestren como quiero
    qrDatos2.Caption := '$ ' + qrDatos2.Caption;
    qrDatos5.Caption := '$ ' + qrDatos5.Caption;

    //Muestro el report
    if Assigned(OnPreview) then
      PreviewModeless
    else
      PreviewModal;
  end;
end;

end.
