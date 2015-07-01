unit UnRptFormulioRPT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, SDEngine;

type
  TrptFormularioSRT = class(TForm)
    QuickRep1: TQuickRep;
    QuickRep2: TQuickRep;
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel8: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel14: TQRLabel;
    qriLogo2: TQRImage;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape15: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape16: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape19: TQRShape;
    QRLabel24: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel28: TQRLabel;
    QRShape20: TQRShape;
    QRLabel29: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape21: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape22: TQRShape;
    QRLabel33: TQRLabel;
    QRShape23: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape24: TQRShape;
    QRLabel36: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel37: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape27: TQRShape;
    QRLabel45: TQRLabel;
    QRShape28: TQRShape;
    QRLabel46: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText18: TQRDBText;
    QRShape31: TQRShape;
    QRLabel50: TQRLabel;
    QRDBText19: TQRDBText;
    QRShape32: TQRShape;
    QRLabel51: TQRLabel;
    QRDBText20: TQRDBText;
    QRShape33: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText21: TQRDBText;
    QRShape34: TQRShape;
    QRLabel53: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel55: TQRLabel;
    QRBand2: TQRBand;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel58: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel59: TQRLabel;
    QRShape35: TQRShape;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel62: TQRLabel;
    QRShape38: TQRShape;
    QRLabel63: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel64: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText28: TQRDBText;
    QRShape39: TQRShape;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRDBText29: TQRDBText;
    QRShape40: TQRShape;
    QRLabel69: TQRLabel;
    QRShape41: TQRShape;
    QRLabel70: TQRLabel;
    QRDBText31: TQRDBText;
    QRShape42: TQRShape;
    QRLabel71: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel72: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel73: TQRLabel;
    QRDBText33: TQRDBText;
    QRShape43: TQRShape;
    QRLabel74: TQRLabel;
    QRDBText34: TQRDBText;
    QRShape44: TQRShape;
    QRLabel75: TQRLabel;
    QRDBText35: TQRDBText;
    QRShape45: TQRShape;
    QRLabel76: TQRLabel;
    QRShape46: TQRShape;
    QRLabel77: TQRLabel;
    QRShape47: TQRShape;
    QRLabel78: TQRLabel;
    QRShape48: TQRShape;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRShape49: TQRShape;
    QRLabel81: TQRLabel;
    QRShape50: TQRShape;
    QRLabel82: TQRLabel;
    QRDBText38: TQRDBText;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRDBText41: TQRDBText;
    qrdbCP: TQRDBText;
    qrdbLocalidad: TQRDBText;
    QRShape53: TQRShape;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    sdqFormSRT: TSDQuery;
    dsFormSRT: TDataSource;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRDBText42: TQRDBText;
    qrlAccidTrab: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText36: TQRDBText;
    qrlLugarAccid: TQRLabel;
    qrlEnfermProf: TQRLabel;
    qrlInItinere: TQRLabel;
    qrlDenunciaSI: TQRLabel;
    qrlDenunciaNO: TQRLabel;
    procedure QRLabel18Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowPreview(Siniestro,Orden,Recaida:TFloatField; vCuit, vCuil :String);
  end;

var
  rptFormularioSRT: TrptFormularioSRT;

implementation

uses AnsiSql, unPrincipal, CUIT, unDmPrincipal, unArt, unComunes;

{$R *.DFM}

{ TrptFormularioSRT }


{ TrptFormularioSRT }

procedure TrptFormularioSRT.ShowPreview(Siniestro, Orden, Recaida: TFloatField; vCuit, vCuil: String);
var Sql,Tipo : String;
    iIdExpediente: integer;
begin

   sql := 'Select dl_cuit, dl_cuil From Cdl_datoslaborales Where dl_cuit = ''' + CUIT.SacarGuiones(vCuit) + '''' +
                                                          ' and  dl_cuil = ''' + CUIT.SacarGuiones(vCuil) + '''' ;
   if existeSQL(sql) Then

        Sql := ' SELECT ex_Cuit, ex_Cuil, ex_Tipo, ex_Diagnostico, ex_DiagnosticoOMS, ' +
                      ' CUIT_PONERGUIONES(ex_cuil) CUIL, ' +
                      ' ART.UTILES.Armar_Siniestro(ex_Siniestro, ex_Orden, ex_Recaida) Siniestro, ' +
                      ' ex_FechaAccidente, ex_HoraAccidente, de_Descripcion, de_HorJornada1Desde, ' +
                      ' ai_DenunciaPolicial, ai_NroDenuncia, ai_Comisaria,tj_Nombre, ' +
                      ' UTILES.Armar_Domicilio(tj_Calle, tj_Numero, tj_Piso, tj_Departamento) Dom_Trabajador, ' +
                      ' tj_Localidad, tj_CPostal, tj_Documento, ' +
                      ' art.trabajador.get_telefono(tj_id, 4) Telefono, ' +   // TK 35353
                      ' tj_Sexo, ' +
                      ' tj_FNacimiento, a.pv_Descripcion Pcia_Trabajador, dl_Tarea TAREA,  ' +
                      ' dl_FecIngreso FECALTA,mp_Nombre, mp_Telefonos, ' +
                      ' UTILES.Armar_Domicilio(mp_Calle, mp_Numero, mp_Piso, mp_Departamento) Dom_Empresa,  ' +
                      ' mp_Localidad, mp_CPostal, b.pv_descripcion Pcia_Empresa,  mp_Actividad, ' +
                      ' CUIT_PONERGUIONES(mp_cuit) CUIT, ' +
                      ' av_Descripcion,  ca_descripcion, ca_codarea || '' '' || ca_telefono ca_telefono, ca_domicilio,ca_localidad, ' +
                      ' ca_codpostal,c.pv_descripcion Pcia_Prestador ' +
               ' FROM   Sex_expedientes, Sde_denuncias, Sai_AccidenteItinere,Ctj_Trabajador, Cpv_Provincias b, ' +
                      ' Cdl_DatosLaborales, Cmp_Empresas, Cav_Actividad,Cpr_prestador, Cpv_provincias a, cpv_provincias c ' +
               ' WHERE  ex_Siniestro = de_Siniestro (+) ' +
                      ' and ex_Orden = de_Orden (+)     ' +
                      ' and ex_Recaida = de_Recaida(+)  ' +
                      ' and ex_Siniestro = ai_Siniestro (+) ' +
                      ' and ex_Orden = ai_Orden (+)     ' +
                      ' and ex_Recaida = ai_Recaida(+)  ' +
                      ' and tj_Provincia = a.pv_Codigo (+)  ' +
                      ' and ex_idtrabajador = tj_id ' +
                      ' and ex_cuit = dl_cuit ' +
                      ' and ex_cuil = dl_cuil ' +
                      ' and ex_cuit = mp_Cuit ' +
                      ' and mp_Provincia = b.pv_Codigo ' +
                      ' and mp_Actividad = av_Codigo   ' +
                      ' and ex_prestador = ca_identificador ' +
                      ' and ca_provincia = c.pv_codigo(+)   ' +
                      ' and ex_siniestro = ' + SqlNumber(Siniestro.Value) +
                      ' and ex_orden = ' + FloatToStr(Orden.Value) +
                      ' and ex_recaida = ' + FloatToStr(Recaida.Value)
    Else

         Sql := ' SELECT ex_Cuit, ex_Cuil, ex_Tipo, ex_Diagnostico, ex_DiagnosticoOMS, ' +
                      ' CUIT_PONERGUIONES(ex_cuil) CUIL, ' +
                      ' ART.UTILES.Armar_Siniestro(ex_Siniestro, ex_Orden, ex_Recaida) Siniestro, ' +
                      ' ex_FechaAccidente, ex_HoraAccidente, de_Descripcion, de_HorJornada1Desde, ' +
                      ' ai_DenunciaPolicial, ai_NroDenuncia, ai_Comisaria,tj_Nombre, ' +
                      ' UTILES.Armar_Domicilio(tj_Calle, tj_Numero, tj_Piso, tj_Departamento) Dom_Trabajador, ' +
                      ' tj_Localidad, tj_CPostal, tj_Documento, ' +
                      ' art.trabajador.get_telefono(tj_id, 4) Telefono, ' +   // TK 35353
                      ' tj_Sexo, ' +
                      ' tj_FNacimiento, a.pv_Descripcion Pcia_Trabajador, Hl_Tarea TAREA,  ' +
                      ' hl_FechaAlta FECALTA,mp_Nombre, mp_Telefonos, ' +
                      ' UTILES.Armar_Domicilio(mp_Calle, mp_Numero, mp_Piso, mp_Departamento) Dom_Empresa,  ' +
                      ' mp_Localidad, mp_CPostal, b.pv_descripcion Pcia_Empresa,  mp_Actividad, ' +
                      ' CUIT_PONERGUIONES(mp_cuit) CUIT, ' +
                      ' av_Descripcion,  ca_descripcion,ca_codarea || '' '' || ca_telefono ca_telefono, ca_domicilio,ca_localidad, ' +
                      ' ca_codpostal,c.pv_descripcion Pcia_Prestador ' +
               ' FROM   Sex_expedientes, Sde_denuncias, Sai_AccidenteItinere,Ctj_Trabajador, Cpv_Provincias b, ' +
                      ' Chl_HistoLaboral CHL1 , Cmp_Empresas, Cav_Actividad,Cpr_prestador, Cpv_provincias a, cpv_provincias c ' +
               ' WHERE  ex_Siniestro = de_Siniestro (+) ' +
                      ' and ex_Orden = de_Orden (+)     ' +
                      ' and ex_Recaida = de_Recaida(+)  ' +
                      ' and ex_Siniestro = ai_Siniestro (+) ' +
                      ' and ex_Orden = ai_Orden (+)     ' +
                      ' and ex_Recaida = ai_Recaida(+)  ' +
                      ' and tj_Provincia = a.pv_Codigo (+)  ' +
                      ' and ex_idtrabajador = tj_id ' +
                      ' and ex_cuit = CHL1.hl_cuit ' +
                      ' and ex_cuil = CHL1.hl_cuil ' +
                      ' and ex_cuit = mp_Cuit ' +
                      ' and mp_Provincia = b.pv_Codigo ' +
                      ' and mp_Actividad = av_Codigo   ' +
                      ' and ex_prestador = ca_identificador ' +
                      ' and ca_provincia = c.pv_codigo(+)   ' +
                      ' and ex_siniestro = ' + SqlNumber(Siniestro.Value) +
                      ' and ex_orden = ' + FloatToStr(Orden.Value) +
                      ' and ex_recaida = ' + FloatToStr(Recaida.Value) +
                      ' and CHL1.hl_fecha = ( Select MAX( CHL2.hl_fecha ) ' +
                                            ' From   Chl_histolaboral CHL2 ' +
                                            ' Where  CHL1.hl_cuit = CHL2.hl_cuit ' +
                                               ' and CHL1.hl_cuil = CHL2.hl_cuil )' ;
                                                

    sdqFormSRT.Close;
    sdqFormSRT.SQL.Text := Sql;
    sdqFormSRT.Open;

  //  qriLogo.Picture.Assign( frmPrincipal.imgLogo.Picture );
  //  qriLogo2.Picture.Assign( frmPrincipal.imgLogo.Picture );

    iIdExpediente := Get_IdExpediente(Siniestro.AsInteger, Orden.AsInteger, Recaida.AsInteger);

    if Is_SiniestroDeGobernacion(iIdExpediente) then        // cambio de la funcion 14/04/2014
    begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
      qriLogo2.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
    end
    else begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
      qriLogo2.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
    end;

    Tipo := sdqFormSRT.FieldByName('EX_TIPO').AsString;

    If ( Tipo = '1' ) Then begin
       qrlAccidTrab.Caption  := 'X';
       qrlLugarAccid.Caption := 'En su lugar de trabajo';
    end
    else if ( Tipo = '2' ) Then begin
       qrlLugarAccid.Caption := 'In Itínere';
       qrlInItinere.Caption  := 'X';
    end
    else if ( Tipo = '3' ) Then
       qrlEnfermProf.Caption := 'X';

    If sdqFormSRT.FieldByName('AI_DENUNCIAPOLICIAL').AsString = 'S' Then
       qrlDenunciaSI.Caption := 'X'
    else qrlDenunciaNO.Caption := 'X';

    QuickRep1.Print;
    QuickRep1.Print;
    QuickRep2.print;
    QuickRep2.print;

end;

procedure TrptFormularioSRT.QRLabel18Print(sender: TObject; var Value: String);
begin
  Value := TXT_EMP_DOMICILIO;
end;

end.
