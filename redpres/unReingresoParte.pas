unit unReingresoParte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, SinEdit, unfraPrestador, Mask, PatternEdit,
  DateTimeEditors, unFraTrabajador, StdCtrls, unArtFrame, unArtDBAwareFrame, Numeros, CustomDlgs,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, ExtCtrls, FormPanel, db, Buttons, SDEngine, unArtDbFrame;

type
  TfrmReingresoParte = class(TForm)
    BevelAbm: TBevel;
    bSeparador1: TBevel;
    bSeparador2: TBevel;
    lFechaEvento: TLabel;
    bSeparador3: TBevel;
    lSiniestro: TLabel;
    lDiagnostico: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraCUIL: TfraTrabajador;
    edFEC_SINI: TDateEditor;
    fraPRESTADOR: TfraPrestador;
    edDIAGNOSTICO: TEdit;
    edSINIESTRO: TSinEdit;
    lObservaciones: TLabel;
    edtRegistroOriginal: TEdit;
    lRegistroOriginal: TLabel;
    edtObservaciones: TEdit;
    sbtnBuscar: TSpeedButton;
    sdqDatos: TSDQuery;
    Label1: TLabel;
    procedure sbtnBuscarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    FCampos: TFields;
  public
    procedure CargaParteErroneo(Campos: TFields);
  end;

implementation

uses
  unBusqSini, unFraTrabajadorSIN, unDmPrincipal, unPrincipal, Cuit,
  SqlFuncs, AnsiSql;

{$R *.DFM}

procedure TfrmReingresoParte.CargaParteErroneo(Campos: TFields);
var
  sOBSERVACIONESEVOL: String;
begin
  FCampos := Campos;

  edtRegistroOriginal.Text := Campos.FieldByName('is_registrooriginal').AsString;

  if not Campos.FieldByName('tj_cuil').IsNull then
    fraCUIL.CUIL := Campos.FieldByName('tj_cuil').AsString;

  if not Campos.FieldByName('is_idprestador').IsNull then
    fraPRESTADOR.Cargar(Campos.FieldByName('is_idprestador').AsInteger);

  if not Campos.FieldByName('is_nrosiniestro').IsNull then
    edSINIESTRO.Siniestro := Campos.FieldByName('is_nrosiniestro').AsInteger;

  if not Campos.FieldByName('is_ordensiniestro').IsNull then
    edSINIESTRO.orden := Campos.FieldByName('is_ordensiniestro').AsInteger;

  if not Campos.FieldByName('is_ordensiniestro').IsNull then
    edFEC_SINI.Date := Campos.FieldByName('is_ordensiniestro').AsInteger;

  edtObservaciones.Text := Campos.FieldByName('is_observaciones').AsString;

  edFEC_SINI.Date := Campos.FieldByName('is_fechaalta').AsDateTime;

  sOBSERVACIONESEVOL := Campos.FieldByName('is_controles').AsString;

  if Campos.FieldByName('is_hivelisa').AsString <> '' then
    sOBSERVACIONESEVOL := sOBSERVACIONESEVOL + ' - HIV ELISA: ' + Campos.FieldByName('is_hivelisa').AsString;

  if Campos.FieldByName('is_hep_c').AsString <> '' then
    sOBSERVACIONESEVOL := sOBSERVACIONESEVOL + ' - HEP C: '  + Campos.FieldByName('is_hep_c').AsString;

  if Campos.FieldByName('is_hbs_ag').AsString  <> '' then
    sOBSERVACIONESEVOL := sOBSERVACIONESEVOL + ' - HBS AG: ' + Campos.FieldByName('is_hbs_ag').AsString;

  if Campos.FieldByName('is_anticore').AsString  <> '' then
    sOBSERVACIONESEVOL := sOBSERVACIONESEVOL + ' - ANTI CORE: ' + Campos.FieldByName('is_anticore').AsString;

  if Campos.FieldByName('is_hep_b_act').AsString  <> '' then
    sOBSERVACIONESEVOL := sOBSERVACIONESEVOL + ' - HEP B ACT: ' + Campos.FieldByName('is_hep_b_act').AsString;

  if Campos.FieldByName('is_citome_igg').AsString  <> '' then
    sOBSERVACIONESEVOL := sOBSERVACIONESEVOL + ' - CITOME IGG: ' + Campos.FieldByName('is_citome_igg').AsString;

  edDIAGNOSTICO.Text := sOBSERVACIONESEVOL;

  Self.ShowModal;
end;

procedure TfrmReingresoParte.sbtnBuscarClick(Sender: TObject);
var
  dlgBusqSini: TdlgBusqSini;
begin
  dlgBusqSini := TdlgBusqSini.Create(Self);
  try
    dlgBusqSini.fraTrabajadorSIN.mskTrabCUIL.Text   := fraCUIL.CUIL;
    dlgBusqSini.fraTrabajadorSIN.dbcTrabNombre.Text := fraCUIL.cmbNombre.Text;
    if (fraCUIL.CUIL <> '') then
      dlgBusqSini.tbBuscarClick(nil);

    if dlgBusqSini.ShowModal = mrOk then
      edSINIESTRO.SetValues(dlgBusqSini.Siniestro, dlgBusqSini.Orden, dlgBusqSini.Recaida);
  finally
    dlgBusqSini.Free;
  end;
end;

procedure TfrmReingresoParte.btnAceptarClick(Sender: TObject);
var
  sDocumento: String;
  sFechaSiniestro: String;
  sSql: String;  
begin
  Verificar(not iscuil(fraCUIL.CUIL), fraCUIL.mskCUIL, 'Debe asignar un trabajador.');
  Verificar(not iscuit(fraPRESTADOR.Cuit), fraPRESTADOR, 'Debe asignar un prestador.');
  Verificar(edSINIESTRO.SiniestroS = '', edSINIESTRO, 'Debe asignar un siniestro.');
  
{        sSql := ' SELECT to_char(max(pv_fechaalta), ''dd/mm/yyyy'') FROM art.SPV_PARTEEVOLUTIVO ' +
                                   '  WHERE PV_SINIESTRO = ' + edSINIESTRO.SiniestroS + ' AND ' +
                                   '  PV_ORDEN = ' + edSINIESTRO.OrdenS + ' AND ' +
                                   '  PV_RECAIDA = 0 AND ' +
                                   '  PV_IDENTIFPRESTADOR = ' + fraPRESTADOR.sdqPrestadorCA_IDENTIFICADOR.AsString + ' AND ' +
        		           '  PV_TIPOPARTE = ''E'' AND ' +
                                   '  PV_OBSERVACIONES LIKE ''' + FCampos.FieldByName('is_controles').asstring + ''' || ''%'' ';
}

  sSql :=
    'SELECT MAX(B.EX_FECHAACCIDENTE)' +
     ' FROM art.sex_expedientes b' +
    ' WHERE b.ex_cuil = ' +  SQLValue(fraCUIL.CUIL) + ' ' +
      ' and nvl(b.ex_causafin, '' '') not in (''99'',''95'')' +
      ' and b.ex_recaida = 0' +
      ' and b.ex_diagnosticooms = ''Z20.9''';
  sFechaSiniestro := ValorSql(sSql, '');

  Verificar(sFechaSiniestro = '', edSINIESTRO, 'Debe asignar un siniestro válido.');
  Verificar((edFec_sini.Date < StrToDate(sFechaSiniestro)) or (edFec_sini.Date > date), edFec_sini, 'Debe asignar una fecha dentro del intervalo: ' + sFechaSiniestro + ' - ' + DateToStr(edFec_sini.Date));

  if MessageBox(0, 'El parte se reprocesará para intentar corregirlo. ¿ Desea Continuar ?', 'Recepción de Partes', MB_ICONQUESTION or MB_YESNO) = idYES then
  begin
    sDocumento := ValorSql('select tj_documento' +
                            ' from CTJ_TRABAJADORES' +
                           ' where tj_cuil = ' + SQLValue(fraCUIL.CUIL), '');

    sSql :=
      'update tmp.tis_informeserologia' +
        ' set is_nrodocumento = ' + sDocumento + ',' +
            ' is_idprestador = ' + IntToStr(fraPRESTADOR.IDPrestador) + ',' +
            ' is_nrosiniestro = ' + edSINIESTRO.SiniestroS + ',' +
            ' is_ordensiniestro = ' + edSINIESTRO.OrdenS + ',' +
            ' is_fechaalta = to_date(''' + DateToStr(edFEC_SINI.Date) + ''', ''DD/MM/YYYY''),' +
            ' is_observaciones = ''' + edDIAGNOSTICO.text + '''' +
      ' where is_idarchivo = :is_idarchivo' +
        ' and is_idmail = :is_idmail' +
        ' and is_orden = :is_orden';
    EjecutarSqlEx(sSql, [FCampos.FieldByName('is_idarchivo').AsInteger, FCampos.FieldByName('is_idmail').AsInteger, FCampos.FieldByName('is_orden').AsInteger]);
  end;

  Close;
end;

end.
