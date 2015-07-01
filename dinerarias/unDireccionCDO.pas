unit unDireccionCDO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, unArtFrame, unFraDomicilio, ExtCtrls,
  FormPanel, undmprincipal, unSesion, customdlgs, ArtComboBox, SinEdit, DB,
  SDEngine;

type
  TOperacionDir = (oAlta, oModif, oOtros);
  TfrmDireccionCDO = class(TForm)
    fpCartaDocumento: TFormPanel;
    BevelAbm: TBevel;
    Label1: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    gbDirDestinatario: TGroupBox;
    fraDirCDO: TfraDomicilio;
    deFechaVenc: TDateEdit;
    edSiniestro: TSinEdit;
    Label2: TLabel;
    Label4: TLabel;
    lblTrabajador: TLabel;
    dsLiq: TDataSource;
    sdqLiq: TSDQuery;
    cbLiq: TArtComboBox;
    function Mostrar(iIDexp, iNumLiq: integer; sTipoLiquidacion: String;
                     TipoOperac: TOperacionDir = oOtros; iIdEvDictamen: integer = 0; iCodBenefic: integer = 0): boolean;
    procedure fpCartaDocumentoShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    function ValidarDirCDO: boolean;
    procedure btnCancelarClick(Sender: TObject);
    procedure edSiniestroExit(Sender: TObject);
    procedure cbLiqChange(Sender: TObject);
    //function showmodal(param: boolean): TModalResult;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDireccionCDO: TfrmDireccionCDO; IDExpediente, NumLiquid, IdDict: integer; TablaOrigen, sTipoLiq: String; TipoOP: TOperacionDir;
  CodBene: integer; bTieneDir: boolean;

const sSqlBenefMortal = 'SELECT eb_calle, eb_numero, eb_localidad, eb_cpostal, eb_provincia, eb_piso, eb_departamento' +
                        '  FROM art.seb_beneficiarios a, art.sbl_beneficiarioliquidacion, art.sle_liquiempsin' +
                        ' WHERE eb_siniestro = bl_siniestro' +
                        '   AND eb_orden = bl_orden' +
                        '   AND eb_recaida = bl_recaida' +
                        '   AND eb_codigo = bl_beneficiario' +
                        '   AND le_siniestro = bl_siniestro' +
                        '   AND le_orden = bl_orden' +
                        '   AND le_recaida = bl_recaida' +
                        '   AND le_numliqui = bl_numliq' +
                        '   AND le_siniestro = :sin' +
                        '   AND le_orden = :ord' +
                        '   AND le_recaida = :rec' +
                        '   AND le_numliqui = :nliq' +
                        '   AND eb_codigo = (SELECT b.eb_codigo' +
                        '                      FROM art.seb_beneficiarios b, art.sbl_beneficiarioliquidacion d' +
                        '                     WHERE b.eb_siniestro = d.bl_siniestro' +
                        '                       AND b.eb_orden = d.bl_orden' +
                        '                       AND b.eb_recaida = d.bl_recaida' +
                        '                       AND b.eb_codigo = d.bl_beneficiario' +
                        '                       AND d.bl_siniestro = le_siniestro' +
                        '                       AND d.bl_orden = le_orden' +
                        '                       AND d.bl_recaida = le_recaida' +
                        '                       AND d.bl_numliq = le_numliqui' +
                        '                       AND ( (NVL(b.eb_benefprincipal, NVL(b.eb_replegal, ''N'')) = ''S'')' +
                        '                                   OR (b.eb_fechanacimiento = (SELECT MIN(c.eb_fechanacimiento)' +
                        '                                                                 FROM art.seb_beneficiarios c, art.sbl_beneficiarioliquidacion e' +
                        '                                                                WHERE c.eb_siniestro = e.bl_siniestro' +
                        '                                                                  AND c.eb_orden = e.bl_orden' +
                        '                                                                  AND c.eb_recaida = e.bl_recaida' +
                        '                                                                  AND c.eb_codigo = e.bl_beneficiario' +
                        '                                                                  AND e.bl_siniestro = le_siniestro' +
                        '                                                                  AND e.bl_orden = le_orden' +
                        '                                                                  AND e.bl_recaida = le_recaida' +
                        '                                                                  AND e.bl_numliq = le_numliqui))) ' +
                        '                       AND ROWNUM = 1)';

implementation

uses VCLExtra;

{$R *.dfm}

{function TfrmDireccionCDO.showmodal(param: boolean): TModalResult;
begin
  inherited;
  bnuevo := param;
end;  }

function TfrmDireccionCDO.Mostrar(iIDexp, iNumLiq: integer; sTipoLiquidacion: String; TipoOperac: TOperacionDir = oOtros;
                                  iIdEvDictamen: integer = 0; iCodBenefic: integer = 0): boolean;
begin
  IDExpediente := iIDexp;
  NumLiquid := iNumLiq;
  sTipoLiq := sTipoLiquidacion;
  TipoOP := TipoOperac;
  IdDict := iIdEvDictamen;
  CodBene := iCodBenefic;
  fpCartaDocumento.Caption := fpCartaDocumento.Caption + ' - ' + sTipoLiquidacion;
  if sTipoLiquidacion = 'OP' then
    TablaOrigen := 'SPR'
  else
    TablaOrigen := 'SLE';

  Mostrar := fpCartaDocumento.ShowModal = mrOK;
end;

procedure TfrmDireccionCDO.fpCartaDocumentoShow(Sender: TObject);
var ssql, sCond: string;
begin
  bTieneDir := true;
  ssql := ' select pd_numero, pd_piso, pd_departamento, pd_calle, pd_cpostal, pd_cpostal, pd_provincia, ' +
          '        pd_fvencimiento, pd_codpostala, pd_localidad ' +
          '   from sin.spd_puestadisposicion ' +
          '  where pd_idexpediente = :idex ';

  with GetQueryEx(ssql, [IDExpediente]) do
  begin
    fraDirCDO.Cargar(fieldbyname('pd_calle').AsString, fieldbyname('pd_cpostal').AsString, fieldbyname('pd_localidad').AsString,
                     fieldbyname('pd_numero').AsString, fieldbyname('pd_piso').AsString, fieldbyname('pd_departamento').AsString,
                     fieldbyname('pd_provincia').AsString, fieldbyname('pd_codpostala').AsString);

    deFechaVenc.Date := fieldbyname('pd_fvencimiento').AsDateTime;
  end;

  if fraDirCDO.IsEmpty then
  begin
    bTieneDir := false;
    if (sTipoLiq = 'M') and (CodBene <> 0) then    //Mortales
    begin
      ssql := ' select eb_calle, eb_numero, eb_localidad, eb_cpostal, eb_provincia, eb_piso, eb_departamento ' +
              '   from seb_beneficiarios, sex_expedientes ' +
              '  where eb_siniestro = ex_siniestro and eb_orden = ex_orden and eb_recaida = ex_recaida and eb_codigo = :cod ' +
              '    and ex_id = :idex ';

      with GetQueryEx(ssql, [CodBene, IDExpediente]) do
      begin
        fraDirCDO.Cargar(fieldbyname('eb_calle').AsString, fieldbyname('eb_cpostal').AsString, fieldbyname('eb_localidad').AsString,
                         fieldbyname('eb_numero').AsString, fieldbyname('eb_piso').AsString, fieldbyname('eb_departamento').AsString,
                         fieldbyname('eb_provincia').AsString, '');
      end;

    end
    else
      if sTipoLiq <> 'M' then     //ILP, ILT, OP
      begin
        ssql := ' select tj_calle, tj_numero, tj_localidad, tj_cpostal, tj_provincia, tj_piso, tj_departamento, tj_cpostala ' +
                '   from ctj_trabajador, sex_expedientes ' +
                '  where tj_id = ex_idtrabajador and ex_id = :idex ';

        with GetQueryEx(ssql, [IDExpediente]) do
        begin
          fraDirCDO.Cargar(fieldbyname('tj_calle').AsString, fieldbyname('tj_cpostal').AsString, fieldbyname('tj_localidad').AsString,
                           fieldbyname('tj_numero').AsString, fieldbyname('tj_piso').AsString, fieldbyname('tj_departamento').AsString,
                           fieldbyname('tj_provincia').AsString, fieldbyname('tj_cpostala').AsString);
        end;
      end;
  end;

  if (deFechaVenc.Date = 0) and (sTipoLiq = 'ILP') and (IdDict <> 0) then
  begin
    ssql := ' select art.amebpba.calcdiashabiles(ev_fecha, 14) from sev_eventosdetramite ' +
             ' where ev_idevento = :idev ';

    deFechaVenc.Date := ValorSqlDateTimeEx(ssql, [IdDict]);
  end;

  if TipoOP <> oAlta then
  begin
    vclextra.LockControls([edSiniestro, cbLiq]);
    with GetQueryEx('select ex_siniestro, ex_orden, ex_recaida from art.sex_expedientes ' +
                    ' where ex_id = :idex ', [IDExpediente]) do
    begin
      edSiniestro.SetValues(fieldbyname('ex_siniestro').AsInteger, fieldbyname('ex_orden').AsInteger,
                            fieldbyname('ex_recaida').AsInteger);
    end;
    cbLiq.Text := IntToStr(NumLiquid);
    edSiniestroExit(nil);
  end
  else
  begin

    if sTipoLiq = 'OP' then
    begin
      sdqLiq.SQL.Text := ' SELECT pr_numpago nliq, cp_denpago ' +
                          '  FROM art.spr_pagoexpesin, art.scp_conpago' +
                          ' WHERE pr_conpago = cp_conpago' +
                          '   AND pr_idexpediente = :idex' +
                          //'   AND NVL(pr_estado, '' '') NOT IN(''Z'', ''X'', ''A'')' +
                          '   AND NVL(pr_estado, '' '') IN (''E'', ''P'') ' +
                          '   AND cp_tipo = ''O''' +
                          '   AND NOT EXISTS(SELECT 1' +
                          '                    FROM SIN.scp_casospuestadisp' +
                          '                   WHERE cp_idexpediente = pr_idexpediente' +
                          '                     AND cp_numliqui = pr_numpago' +
                          '                     AND cp_fechabaja IS NULL' +
                          '                     AND cp_tablaliqui = ''SPR'')' ;

    end
    else
    begin

      if sTipoLiq = 'ILP' then
        sCond := ' AND ((le_tipoliqui = ''I'') AND (cp_tipo = ''P'')) '
      else
        if sTipoLiq = 'ILT' then
          sCond := ' AND le_tipoliqui IN(''L'', ''D'') '
        else   //mortales
          sCond := ' AND ((le_tipoliqui = ''I'') AND (cp_tipo = ''M'')) ';

      sdqLiq.SQL.Text := ' SELECT le_numliqui nliq, cp_denpago ' +
                          '  FROM art.sle_liquiempsin, art.scp_conpago' +
                          ' WHERE le_conpago = cp_conpago' +
                          '   AND le_idexpediente = :idex' +
                          //'   AND NVL(le_estado, '' '') NOT IN(''Z'', ''X'', ''A'')' + sCond +
                          '   AND NVL(le_estado, '' '') IN (''E'', ''P'') ' + sCond +
                          '   AND NOT EXISTS(SELECT 1' +
                          '                    FROM SIN.scp_casospuestadisp' +
                          '                   WHERE cp_idexpediente = le_idexpediente' +
                          '                     AND cp_numliqui = le_numliqui' +
                          '                     AND cp_fechabaja IS NULL' +
                          '                     AND cp_tablaliqui = ''SLE'')';

    end;
  end;

end;

procedure TfrmDireccionCDO.btnAceptarClick(Sender: TObject);
var ssql: string;
begin
  if ValidarDirCDO then
  begin
    if TipoOP = oAlta then
      NumLiquid := StrToInt(cbLiq.FieldValue);

    if TipoOP <> oModif then
    begin
      ssql := ' INSERT INTO SIN.scp_casospuestadisp(cp_idexpediente, cp_numliqui, cp_usualta, cp_fechaalta, cp_tablaliqui) ' +
                   ' VALUES (:idexp, :numliq, :usu, TRUNC(SYSDATE), :taborig) ';

      EjecutarSqlSTEx(ssql, [IDExpediente, NumLiquid, Sesion.UserID, TablaOrigen]);
    end;

    ssql := ' SELECT 1 FROM sin.spd_puestadisposicion ' +
             ' WHERE pd_idexpediente = :idex AND pd_fechabaja IS NULL ';

    if ExisteSqlEx(ssql, [IDExpediente]) then
    begin
      ssql := 'UPDATE sin.spd_puestadisposicion ' +
               '  SET pd_fvencimiento = :fven, pd_calle = :calle, pd_numero = :num, pd_piso = :piso, ' +
               '      pd_departamento = :dep, pd_cpostal = :cp, pd_localidad = :loc, pd_provincia = :pro, ' +
               '      pd_codpostala = :cpa, pd_fechamodif = TRUNC (SYSDATE), pd_usumodif = :usu' +
              ' WHERE pd_idexpediente = :idex and pd_fechabaja IS NULL';
      EjecutarSqlSTEx(ssql, [DateToStr(deFechaVenc.Date), fraDirCDO.Calle, fraDirCDO.Numero, fraDirCDO.Piso, fraDirCDO.Departamento,
                             fraDirCDO.CodigoPostal, fraDirCDO.Localidad, fraDirCDO.Prov, fraDirCDO.CPA, Sesion.UserID, IDExpediente]);
    end
    else
    begin
      ssql := ' INSERT INTO sin.spd_puestadisposicion(pd_idexpediente, pd_fvencimiento, pd_numero, pd_piso, pd_departamento, ' +
              '                                       pd_calle, pd_cpostal, pd_localidad, pd_provincia, pd_codpostala, ' +
              '                                       pd_usualta, pd_fechaalta) ' +
                   ' VALUES (:idex, :fven, :num, :piso, :dep, :calle, :cp, :loc, :pro, ' +
                          ' :cpa, :usu, TRUNC (SYSDATE)) ';
      EjecutarSqlSTEx(ssql, [IDExpediente, DateToStr(deFechaVenc.Date), fraDirCDO.Numero, fraDirCDO.Piso, fraDirCDO.Departamento,
                             fraDirCDO.Calle, fraDirCDO.CodigoPostal, fraDirCDO.Localidad, fraDirCDO.Prov, fraDirCDO.CPA,
                             Sesion.UserID]);
    end;
    fpCartaDocumento.ModalResult := mrOK;
  end;

end;

function TfrmDireccionCDO.ValidarDirCDO: boolean;
begin
  if TipoOP = oAlta then
  begin
    Verificar(edSiniestro.IsEmpty, edSiniestro, 'Debe completar el siniestro');
    Verificar(cbLiq.Text = '', cbLiq, 'Debe especificar la liquidación');
  end;
  Verificar((fraDirCDO.IsEmpty) or (not fraDirCDO.IsValid), fraDirCDO, 'Debe completar la dirección');
  Verificar(deFechaVenc.Date = 0, deFechaVenc, 'Debe completar la fecha de vencimiento');
  ValidarDirCDO := true;
end;

procedure TfrmDireccionCDO.btnCancelarClick(Sender: TObject);
begin
  if msgbox('Desea descartar los cambios?', MB_YESNO + MB_ICONQUESTION) = id_yes then
    fpCartaDocumento.ModalResult := mrCancel;

end;

procedure TfrmDireccionCDO.edSiniestroExit(Sender: TObject);
begin
  if not edSiniestro.IsEmpty then
  begin
    with GetQueryEx('select ex_id, tj_nombre from art.sex_expedientes, comunes.ctj_trabajador ' +
                    'where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec and ex_idtrabajador = tj_id',
                    [edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida]) do
    begin
      IDExpediente := fieldbyname('ex_id').AsInteger;
      lblTrabajador.Caption := fieldbyname('tj_nombre').AsString;
    end;

    if TipoOP = oAlta then
    begin
      sdqLiq.Close;
      sdqLiq.ParamByName('idex').AsInteger := IDExpediente;
      sdqLiq.Open;
    end;
  end;

end;


procedure TfrmDireccionCDO.cbLiqChange(Sender: TObject);
begin
  if (sTipoLiq = 'M') and (CodBene = 0) and (cbLiq.Text <> '') and not bTieneDir then
  begin
    with GetQueryEx(sSqlBenefMortal, [edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida, cbLiq.Text]) do
    begin
      fraDirCDO.Cargar(fieldbyname('eb_calle').AsString, fieldbyname('eb_cpostal').AsString, fieldbyname('eb_localidad').AsString,
                       fieldbyname('eb_numero').AsString, fieldbyname('eb_piso').AsString, fieldbyname('eb_departamento').AsString,
                       fieldbyname('eb_provincia').AsString, '');
    end;

  end;
end;


end.
