unit unPlanMejoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  StdCtrls, ExtCtrls, IntEdit, PatternEdit, FormPanel, Db, SDEngine,
  ImgList, Placemnt, QueryToFile, ExportDialog, QueryPrint, SortDlg,
  ShortCutControl, DBCGrids, Mask, ToolEdit, DateComboBox, unfraEstablecimiento,
  Menus, ImageComboBox, unArtFrame, unConstFet, unFraCodigoDescripcion, unArt,
  unfraCtbTablas, unArtDbFrame, unArtDBAwareFrame, VCLExtra, ExComboBox,
  unDmPrincipal, CustomDlgs, AnsiSql, General, StrFuncs, Numeros, SqlFuncs,
  unCustomDataModule, Buttons, DBCtrls, RxRichEd, PeriodoPicker,
  DateUtils, unComunesFet;

type
  TfrmPlanMejoras = class(TForm)
    QueryPrint: TQueryPrint;
    FormPlacement: TFormPlacement;
    sdqDenuncias: TSDQuery;
    dsDenuncias: TDataSource;
    sdPlanMejora: TSortDialog;
    edPlanMejora: TExportDialog;
    sdqVisitas: TSDQuery;
    dsVisitas: TDataSource;
    sdVisitas: TSortDialog;
    pnlVisitas: TPanel;
    CoolBar3: TCoolBar;
    ToolBar1: TToolBar;
    tbVisAgregar: TToolButton;
    tbVisQuitar: TToolButton;
    ToolButton5: TToolButton;
    tbVisOrdenar: TToolButton;
    dbgVisitas: TArtDBGrid;
    pnlRecomendaciones: TPanel;
    CoolBar1: TCoolBar;
    tBarPlanMejoras: TToolBar;
    tbPMRefrescar: TToolButton;
    ToolButton3: TToolButton;
    tbPMNuevo: TToolButton;
    tbPMModificar: TToolButton;
    tbPMEliminar: TToolButton;
    ToolButton9: TToolButton;
    tbPMOrdenar: TToolButton;
    ToolButton11: TToolButton;
    tbPMExportar: TToolButton;
    dbgDenuncias: TArtDBGrid;
    fpVisita: TFormPanel;
    Label5: TLabel;
    Bevel7: TBevel;
    Label3: TLabel;
    btnVisAceptar: TButton;
    btnVisCancelar: TButton;
    edVisFecha: TDateComboBox;
    cmbVisTipo: TExComboBox;
    fpDenuncias: TFormPanel;
    lbItem: TLabel;
    Bevel2: TBevel;
    Label1: TLabel;
    btnPMAceptar: TButton;
    btnPMCancelar: TButton;
    edObservacion: TMemo;
    Label2: TLabel;
    qpPlanMejora: TQueryPrint;
    lblVisita: TLabel;
    edVisita: TEdit;
    btnBuscarVisitas: TSpeedButton;
    DBMemo1: TDBMemo;
    sdqListaObservaciones: TSDQuery;
    pnlHeaderVisitas: TPanel;
    chkSoloIncumplidos: TCheckBox;
    sccPlanMejoras: TShortCutControl;
    sdqListaObservacionesVisitas: TSDQuery;
    chkTodosOps: TCheckBox;
    qryDenuncias: TSDQuery;
    qryObsDenuncias: TSDQuery;
    edNroRecomendacion: TEdit;
    lbCodigo: TLabel;
    fraGrupoDenuncia: TfraCodigoDescripcion;
    fraRubroDenuncia: TfraCodigoDescripcion;
    Label9: TLabel;
    pnlColor4: TPanel;
    Label10: TLabel;
    pnlColor5: TPanel;
    Label7: TLabel;
    chkAnt463: TCheckBox;
    edMesSeguimiento: TPeriodoPicker;
    lblSeguimiento: TLabel;
    procedure tbPMRefrescarClick(Sender: TObject);
    procedure tbPMNuevoClick(Sender: TObject);
    procedure tbPMModificarClick(Sender: TObject);
    procedure tbPMEliminarClick(Sender: TObject);
    procedure tbPMOrdenarClick(Sender: TObject);
    procedure tbPMExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPMAceptarClick(Sender: TObject);
    procedure tbVisAgregarClick(Sender: TObject);
    procedure tbVisQuitarClick(Sender: TObject);
    procedure tbVisOrdenarClick(Sender: TObject);
    procedure btnVisAceptarClick(Sender: TObject);
    procedure btnBuscarVisitasClick(Sender: TObject);
    procedure dbgDenunciasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgVisitasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqDenunciasAfterScroll(DataSet: TDataSet);
  private
    FFechaDenuncia: TDateTime;
    FIdVisita,
    FIdUltimaVisita,
    FEstableci: Integer;

    FCUIT: String;
    FContrato: Integer;
    FRazonSocial: String;
    FTipo: String;
    FGrupo: TCtbClave;
    FTipoEstabPrev: integer;

    FOperativo : String;
    FOperativoDenuncia : String;
    FTipoDescripcion: String;

    procedure SetTipoEstabPrev(const Value: integer);
    procedure SetCuit(const Value: String);
    procedure SetEstableci(const Value: Integer);
    procedure SetGrupo(const Value: TCtbClave);
    procedure OnfraGrupoChange( Sender : TObject );
    procedure OnfraDenDetChange(Sender : TObject);
    function ListaObservaciones (IDObraDenuncia: Integer): String; overload;
    function ListaObservaciones (IDObraDenuncia: Integer; aFecha: TDate): String; overload;
    property TipoEstabPrev: integer read FTipoEstabPrev write SetTipoEstabPrev;
  public
    procedure Clear;
    procedure Load;
    procedure Save;
  published
    property Grupo            : TCtbClave read FGrupo           write SetGrupo;
    property CUIT             : String   read FCUIT             write SetCuit;
    property Estableci        : Integer  read FEstableci        write SetEstableci;
    property RazonSocial      : String   read FRazonSocial      write FRazonSocial;
    property Tipo             : String   read FTipo             write FTipo;
    property Operativo        : String   read FOperativo        write FOperativo;
    property TipoDescripcion  : String   read FTipoDescripcion  write FTipoDescripcion;
    property Contrato         : Integer   read FContrato         write FContrato;
  end;

Const
  TXT_AGREGAR   = '&Agregar';
  TXT_MODIFICAR = 'Modific&ar';
  MAX_RELATIONS = 10;

implementation

uses
  unPrincipal, unConsVisitasRealizadas;

{$R *.DFM}

procedure TfrmPlanMejoras.FormCreate(Sender: TObject);
begin
  FIdUltimaVisita := 0;
  FIdVisita := 0;
  edVisFecha.MaxDate := DBDateTime;

  vclextra.LockControl(edNroRecomendacion,true);

  with fraGrupoDenuncia do
  begin
    TableName := 'HYS.HGD_GRUPODENUNCIA';
    FieldDesc := 'GD_DESCRIPCION';
    FieldID := 'GD_ID';
    FieldCodigo := 'GD_CODIGO';
    FieldBaja := 'GD_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := false;
    OnChange := OnfraGrupoChange;
  end;

  with fraRubroDenuncia do
  begin
    TableName := 'HYS.HRD_RUBRODENUNCIA';
    FieldDesc := 'RD_DESCRIPCIONRUBRO';
    FieldID := 'RD_ID';
    FieldCodigo := 'RD_CODIGORUBRO';
    FieldBaja := 'RD_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    ShowHint := true;
    ExtraCondition := ' AND 1=2';
    OnChange := OnfraDenDetChange;
  end;

{  fraGrupo.OnChange     := OnfraGrupoChange;
  fraGrupo.Clave        := 'DENGR';
  fraGrupo.ShowBajas    := false;

  fraItemRubro.OnChange     := OnfraDenDetChange;
  fraItemRubro.ExtraCondition := ' AND 1=2';
//  fraItemRubro.ExtraFields := ' ,tb_especial2 ';
  fraItemRubro.ShowHint := true;}
end;

{------------------------------------------------------------------------------}

procedure TfrmPlanMejoras.Clear;
begin
   sdqDenuncias.Close;
   sdqVisitas.Close;
end;

{------------------------------------------------------------------------------}

procedure TfrmPlanMejoras.Load;
begin
  TipoEstabPrev := ValorSqlInteger(' SELECT art.hys.get_tipo_estab_prevencion( '+
                                      SqlValue(FCUIT) + ',' + SqlValue(FEstableci) + ') FROM dual ');
  tbPMRefrescarClick(nil);
end;

{------------------------------------------------------------------------------}

procedure TfrmPlanMejoras.Save;
begin
end;

{------------------------------------------------------------------------------}

procedure TfrmPlanMejoras.SetCuit(const Value: String);
begin
  if (FCUIT <> Value) then
    FCUIT := Value;
end;

procedure TfrmPlanMejoras.SetEstableci(const Value: Integer);
begin
  if (FEstableci <> Value) then
    FEstableci := Value;
end;

procedure TfrmPlanMejoras.SetGrupo(const Value: TCtbClave);
begin
  if FGrupo <> Value Then begin
    FGrupo := Value;

    fraGrupoDenuncia.Clear;
    fraGrupoDenuncia.SelectFirst;
  end
end;

procedure TfrmPlanMejoras.OnfraGrupoChange(Sender: TObject);
begin
  fraRubroDenuncia.ExtraCondition := '';
  fraRubroDenuncia.ExtraCondition := ' and RD_IDGRUPO = ' + fraGrupoDenuncia.ID +
            ' AND (rd_vigenciadesde <= '+SqlValue(FOperativoDenuncia)+' OR rd_vigenciadesde IS NULL) '+
            ' AND (rd_vigenciahasta > '+SqlValue(FOperativoDenuncia)+' OR rd_vigenciahasta IS NULL)';
end;

procedure TfrmPlanMejoras.OnfraDenDetChange(Sender: TObject);
begin
  fraRubroDenuncia.Hint := fraRubroDenuncia.Descripcion;
end;

{------------------------------------------------------------------------------}
{ Toolbar                                                                      }
{------------------------------------------------------------------------------}

procedure TfrmPlanMejoras.tbPMRefrescarClick(Sender: TObject);
var
  sSQL: string;
begin
  with sdqDenuncias do
  begin
    Close;

    SQL.Clear;
    sSQL := 'SELECT  d.*, '
                + '        G.gd_descripcion grupo, '
                + '        r.rd_descripcionrubro rubro, '
                + '        r.rd_codigorubro, '
                + '        od_fecha, '
                + '        rv_fecha, '
                + '        rv_descripcion, '
                + '        dd_observaciones, '
                + '        dd_operativo, '
                + '        dd_tipodenuncia, '
                + '        gd_usumodif, '
                + '        dd_seguimiento, '
                + '        to_char(dd_seguimiento, ''YYYYMM'') segperiodo '
                + '  FROM  art.pdd_detalledenuncia d, '
                + '        hys.hgd_grupodenuncia G, '
                + '        hys.hrd_rubrodenuncia r, '
                + '        pod_obradenuncia, '
                + '        art.prv_resvisitas '
                + ' WHERE  od_id = dd_idpodobradenuncia '
                + '    AND od_cuit = ' + SqlValue(FCUIT)
                + '    AND od_estableci = ' + SqlValue(FEstableci)
                + '    AND dd_tipo = ' + SqlValue(FTipo)
                + '    AND dd_operativo >= r.rd_vigenciadesde '
                + '    AND dd_operativo < NVL (r.rd_vigenciahasta, ''210001'') '
                + iif(chkTodosOps.Checked, '', ' AND (dd_operativo = '+ SqlValue(FOperativo)
                + ' OR (dd_operativo = art.utiles.periodo_anterior('+ SqlValue(FOperativo)+', 12) '
                + ' AND dd_seguimiento IS NOT NULL))')
                + '    AND dd_grupo NOT IN (''TE'',''PE'', ''CG'', ''BG'', ''PG'') '
                + '    AND r.rd_idgrupo = G.gd_id '
                + '    AND G.gd_codigo = dd_grupo '
                + '    AND r.rd_codigorubro = dd_rubro '
                + '    AND rv_id(+) = dd_idvisita '
                + '    AND dd_observaciones IS NOT NULL '
                + iif(chkAnt463.Checked, '', ' AND dd_fechaalta > TO_DATE(''20/07/2010'', ''DD/MM/YYYY'') ')
                ;
    SQL.Add(sSQL);

    if chkSoloIncumplidos.Checked then
    begin
      SQL.Add(' AND NOT EXISTS (SELECT 1 FROM ART.ppv_planmvisitas ppv ' +
              ' WHERE pv_iddenuncia = dd_id AND pv_tipovisita = ''C''' +
              '   AND pv_fechabaja IS NULL '+
              ' AND pv_fecha = (SELECT max(pv_fecha) FROM ART.ppv_planmvisitas ppv2 ' +
                                 'WHERE ppv2.pv_fechabaja is null ' +
                                 'AND ppv2.pv_iddenuncia = dd_id  ))');
    end;
    SQL.Add('ORDER BY dd_nrorecomendacion');
    Open
  end;
  sdqVisitas.ParamByName('dd_id').AsInteger := sdqDenuncias.FieldByName('dd_id').AsInteger;
  sdqVisitas.Open;

  fraGrupoDenuncia.ExtraCondition := ' AND (gd_tipo = ' + SqlValue(FTipo) + ') ' +
                                     ' AND (gd_codigo NOT IN (''TE'',''PE'', ''CG'', ''BG'', ''PG''))';
end;

procedure TfrmPlanMejoras.tbPMNuevoClick(Sender: TObject);
var
  FGrupo : String;
begin
  repeat
    //Ultima visita cargada
    FIdUltimaVisita := ValorSqlInteger ('SELECT MAX (rv.rv_id) rv_id ' +
                                        '  FROM art.prv_resvisitas rv ' +
                                        ' WHERE rv.rv_cuit = ' + SqlValue (FCUIT) +
                                        '   AND rv.rv_estableci = ' + SqlValue (FEstableci) +
                                        '   AND rv.rv_operativo = ' + SqlValue (FOperativo) +
                                        '   AND rv.rv_fechabaja IS NULL ' );
(*
                                        '   AND rv.rv_fecha = ' +
                                        '          (SELECT MAX (rv_fecha) ' +
                                        '             FROM art.prv_resvisitas ' +
                                        '            WHERE rv_cuit = rv.rv_cuit ' +
                                        '              AND rv_estableci = rv.rv_estableci ' +
                                        '              AND rv_operativo = rv.rv_operativo ' +
                                        '              AND rv_fechabaja IS NULL) '
                                       );
*)

    FIdVisita := FIdUltimaVisita;
    FFechaDenuncia := ValorSqlDateTime ('SELECT rv_fecha ' +
                                        '  FROM art.prv_resvisitas' +
                                        ' WHERE rv_id = ' + SqlValue (FIdUltimaVisita)
                                       );
    FOperativoDenuncia := FOperativo;
    OnfraGrupoChange(NIL);
(*
    if FTipo = 'CO' then FGrupo := 'CO';

    if FGrupo = '' then
      FGrupo := ValorSql ('SELECT DECODE (' + SqlValue(FTipo) + ', ' +
                          '               ''ET'', ''TC'', ' +
                          '               ''GB'', ''BC'', ' +
                          '               ''CO'', ''CO'', ' +
                          '               ''EP'', ''PI'', ' +
                          '               NULL ' +
                          '              ) ' +
                          '  FROM afi.aes_establecimiento ' +
                          ' WHERE es_nroestableci = ' + SqlValue(FEstableci) +
                          '   AND es_contrato = ' + SqlValue(FContrato) +
                          '   AND es_eventual = ''S'''
                         );

    if FGrupo = '' then
      FGrupo := ValorSql ('SELECT DISTINCT dp_grupo ' +
                          '           FROM hys.hga_grupoporactividad, hys.atc_actividadciiu ' +
                          '          WHERE dp_tipo = ' + SqlValue(FTipo) +
                          '            AND dp_actividad = tc_actividad ' +
                          '            AND dp_fechabaja IS NULL ' +
                          '            AND ROWNUM = 1 ' +
                          '            AND tc_primerdigitociiu = ' +
                          '                   (SELECT SUBSTR ' +
                          '                              (NVL ((SELECT ac_relacion ' +
                          '                                      FROM afi.aes_establecimiento, ' +
                          '                                           comunes.cac_actividad ' +
                          '                                      WHERE es_nroestableci = ' + SqlValue(FEstableci) +
                          '                                        AND es_contrato = ' + SqlValue(FContrato) +
                          '                                        AND ac_id = es_idactividad), ' +
                          '                                    (SELECT ac_relacion ' +
                          '                                       FROM afi.aco_contrato, ' +
                          '                                            afi.aem_empresa, ' +
                          '                                            comunes.cac_actividad ' +
                          '                                      WHERE co_contrato = ' + SqlValue(FContrato) +
                          '                                        AND em_id = co_idempresa ' +
                          '                                        AND em_cuit = ' + SqlValue(FCUIT) +
                          '                                        AND ac_id = co_idactividad) ' +
                          '                                   ), ' +
                          '                               1, ' +
                          '                               1 ' +
                          '                              ) actividad ' +
                          '                      FROM DUAL)'
                         );

*)
    FGrupo := GetGrupoDenuncia(FCUIT, FContrato, FEstableci, FTipo);
    fraGrupoDenuncia.Codigo := FGrupo;
    OnfraGrupoChange(Sender);
    fraRubroDenuncia.Clear;
    edObservacion.Lines.Clear;
    edMesSeguimiento.Clear;

    edVisita.Text:= ValorSql (
                      'SELECT TO_CHAR (rv_fecha, ''DD/MM/YYYY'') || '' '' || rv_descripcion ' +
                      '  FROM art.prv_resvisitas ' +
                      ' WHERE rv_id = ' + SqlValue (FIdUltimaVisita)
                    );

    btnPMAceptar.Caption := TXT_AGREGAR;
    fraGrupoDenuncia.Enabled := True;
    fraRubroDenuncia.Enabled := True;
    fpDenuncias.Caption := 'Agregar Denuncia';
  until fpDenuncias.ShowModal <> mrOk;
end;

procedure TfrmPlanMejoras.tbPMModificarClick(Sender: TObject);
begin
//  if sdqDenuncias.IsEmpty or (not sdqDenuncias.FieldByName('dd_fechabaja').IsNull) then
  if sdqDenuncias.IsEmpty then
    Exit;

  if tBarPlanMejoras.Enabled and (not sdqDenuncias.IsEmpty) then begin
    FIdUltimaVisita := ValorSqlInteger ('SELECT MAX (rv.rv_id) rv_id ' +
                                        '  FROM art.prv_resvisitas rv ' +
                                        ' WHERE rv.rv_cuit = ' + SqlValue (FCUIT) +
                                        '   AND rv.rv_estableci = ' + SqlValue (FEstableci) +
                                        '   AND rv.rv_operativo = ' + SqlValue (FOperativo) +
                                        '   AND rv.rv_fechabaja IS NULL ' );
(*
                                        '   AND rv.rv_fecha = ' +
                                        '          (SELECT MAX (rv_fecha) ' +
                                        '             FROM art.prv_resvisitas ' +
                                        '            WHERE rv_cuit = rv.rv_cuit ' +
                                        '              AND rv_estableci = rv.rv_estableci ' +
                                        '              AND rv_operativo = rv.rv_operativo ' +
                                        '              AND rv_fechabaja IS NULL) '
                                       );
*)
    FOperativoDenuncia := sdqDenuncias.FieldByName('dd_operativo').AsString;
    OnfraGrupoChange(NIL);

    FIdVisita := sdqDenuncias.FieldByName('dd_idvisita').AsInteger;
    FFechaDenuncia := sdqDenuncias.FieldByName('od_fecha').AsDateTime;

    edNroRecomendacion.Text := sdqDenuncias.FieldByName('dd_nrorecomendacion').AsString;
    fraGrupoDenuncia.Codigo := sdqDenuncias.FieldByName('dd_grupo').AsString;
    OnfraGrupoChange(Sender);
    fraRubroDenuncia.Codigo := sdqDenuncias.FieldByName('dd_rubro').AsString;
    edObservacion.Lines.Text := sdqDenuncias.FieldByName('dd_observaciones').AsString;
    edMesSeguimiento.Periodo.Valor := sdqDenuncias.FieldByName('segperiodo').AsString;
    edVisita.Text:= ValorSql (
                      'SELECT TO_CHAR (rv_fecha, ''DD/MM/YYYY'') || '' '' || rv_descripcion ' +
                      '  FROM art.prv_resvisitas ' +
                      ' WHERE rv_id = ' + SqlValue (FIdVisita)
                    );

    btnPMAceptar.Caption := TXT_MODIFICAR;
    fraGrupoDenuncia.Enabled := False;
    fraRubroDenuncia.Enabled := False;
    fpDenuncias.Caption := 'Editar Denuncia';

    fpDenuncias.ShowModal;
  end;
end;

procedure TfrmPlanMejoras.tbPMEliminarClick(Sender: TObject);
var
  Sql_PDD,
  Sql_PPV,
  Sql_POE: String;
  ValorRubro : String;
begin
  if sdqDenuncias.IsEmpty or (not sdqDenuncias.FieldByName('dd_fechabaja').IsNull) then
    Exit;

  if MsgBox('¿Desea eliminar el registro seleccionado?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES Then
  begin
    Sql_PDD:= 'UPDATE art.pdd_detalledenuncia ' +
              '   SET dd_usubaja = ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
              '       dd_fechabaja = SYSDATE ' +
              ' WHERE dd_id = ' + SqlValue(sdqDenuncias.FieldByName('dd_id').AsInteger);

    Sql_PPV:= 'UPDATE art.ppv_planmvisitas ' +
              '   SET pv_usubaja = ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
              '       pv_fechabaja = SYSDATE ' +
              ' WHERE pv_iddenuncia = ' + SqlValue(sdqDenuncias.FieldByName('dd_id').AsInteger);

    ValorRubro := ValorSql(
      ' SELECT ed_codigodenuncia '+
      '   FROM art.ped_excepcionrubrodenuncia '+
      ' WHERE ed_clave = ''ID_'' || '+SqlValue(sdqDenuncias.fieldbyname('dd_grupo').AsString)+
      '   AND ed_codigo = '+SqlValue(sdqDenuncias.fieldbyname('dd_rubro').AsString)+
      '   AND ed_tipo = '+SqlValue(FTipo));
    if ValorRubro = '' then
      ValorRubro := sdqDenuncias.fieldbyname('dd_rubro').AsString;

    Sql_POE := ' UPDATE art.poe_obradendetalle ' +
               ' SET oe_fechabaja = SYSDATE, ' +
               '     oe_usubaja = ' + SqlValue(frmPrincipal.DBLogin.LoginName)  +
               ' WHERE oe_cuit = ' + SqlValue(FCuit) +
               ' AND oe_estableci = ' + SqlValue(FEstableci) +
               ' AND oe_fecha = ' + SqlValue(sdqDenuncias.fieldbyname('rv_fecha').AsDateTime) +
               ' AND oe_grupo = ' + SqlValue(sdqDenuncias.fieldbyname('dd_grupo').AsString) +
               ' AND oe_rubro = ' + SqlValue(ValorRubro) +
               ' AND NOT EXISTS(SELECT 1 ' +
               '                  FROM art.pdd_detalledenuncia pdd, art.pod_obradenuncia pod ' +
               '                 WHERE od_cuit = oe_cuit ' +
               '                   AND od_estableci = oe_estableci ' +
               '                   AND od_fecha = oe_fecha ' +
               '                   AND dd_grupo = oe_grupo ' +
               '                   AND dd_rubro = ' +SqlValue(sdqDenuncias.fieldbyname('dd_rubro').AsString)+
               '                   AND dd_idpodobradenuncia = od_id ' +
               '                   AND dd_fechabaja IS NULL) ' +
               ' AND NOT EXISTS(SELECT 1 ' +
               '                  FROM art.pdd_detalledenuncia pdd, art.pod_obradenuncia pod, art.ppv_planmvisitas ' +
               '                 WHERE od_cuit = oe_cuit ' +
               '                   AND od_estableci = oe_estableci ' +
               '                   AND pv_fecha = oe_fecha ' +
               '                   AND dd_grupo = oe_grupo ' +
               '                   AND dd_rubro = ' +SqlValue(sdqDenuncias.fieldbyname('dd_rubro').AsString)+
               '                   AND dd_idpodobradenuncia = od_id ' +
               '                   AND pv_tipovisita = ''I'' '+
               '                   AND pdd.dd_id = pv_iddenuncia ' +
               '                   AND pv_fechabaja IS NULL) ';

    Try
      EjecutarSqlST(Sql_PDD);
      EjecutarSqlST(Sql_PPV);
      EjecutarSqlST(Sql_POE);

      sdqDenuncias.Refresh;
      if sdqVisitas.Active then
        sdqVisitas.Refresh
      else
        sdqVisitas.Open;
    except
      on E: Exception do ErrorMsg( E );
    end;
  end;
end;

procedure TfrmPlanMejoras.tbPMOrdenarClick(Sender: TObject);
begin
  sdPlanMejora.Execute
end;

procedure TfrmPlanMejoras.tbPMExportarClick(Sender: TObject);
begin
  edPlanMejora.Execute
end;

{------------------------------------------------------------------------------}
{ fpDenuncias                                                                 }
{------------------------------------------------------------------------------}

procedure TfrmPlanMejoras.btnBuscarVisitasClick(Sender: TObject);
var
  format :TFormatSettings;
begin
  format.DateSeparator := '/';
  format.ShortDateFormat := 'dd/mm/yyyy';
  with TfrmConsVisitasRealizadas.Create(self) do
  try
    Init (FCUIT, FEstableci, '', FTipo, True);
//    Init (FCUIT, FEstableci, FOperativo, FTipo, True);

    if ShowModal = mrOk then
    begin
      FIdVisita := FIdVisitaSeleccionada;
      FFechaDenuncia := FFechaVisitaSeleccionada;
      edVisita.Text := DateToStr(FFechaVisitaSeleccionada,format) + ' ' + FDescripcionVisitaSeleccionada;
    end
  finally
    Free
  end;
end;

function TfrmPlanMejoras.ListaObservaciones (IDObraDenuncia: Integer): String;
var
  SRegistro: TStrings;
begin
  SRegistro:= TStringList.Create;

  try
    with sdqListaObservaciones do
    begin
      Close;
      ParamByName('pidobradenuncia').AsInteger := IDObraDenuncia;
      Open;

      while not EoF do
      begin
        if Trim (FieldByName('obs').AsString) <> '' then
          SRegistro.Append (Trim(FieldByName('obs').AsString)+' ');
        Next;
      end;

      Close;
    end;

    Result := Trim(SRegistro.Text)
  finally
    SRegistro.Free
  end
end;

procedure TfrmPlanMejoras.btnPMAceptarClick(Sender: TObject);
Var
  Sql_POE,
  Sql_POD : String;
  FID_ObraDenunciaAnt,
  NroRecomendacion,FID_ObraDenuncia : Integer;
  ValorRubro : String;
  FechaSeguimiento: TDate;
begin
  Sql_POD := '';

  VerificarMultiple (['Registro de Denuncia de Mejoras',
                      fraGrupoDenuncia,
                      fraGrupoDenuncia.IsSelected,
                      'Debe indicar el grupo',
                      fraRubroDenuncia,
                      fraRubroDenuncia.IsSelected,
                      'Debe indicar el rubro',
                      edObservacion,
                      Trim(edObservacion.Lines.Text) <> '',
                      'Debe ingresar recomendación',
                      edVisita,
                      Trim(edVisita.Text) <> '',
                      'Debe indicar la visita asociada'
                     ]);
  Verificar(edMesSeguimiento.Enabled and (edMesSeguimiento.Periodo.Valor = ''), edMesSeguimiento, 'Debe indicar la fecha de seguimiento.');
  Verificar(edMesSeguimiento.Enabled and (edMesSeguimiento.Periodo.Valor < FormatDateTime('yyyymm', DBDate)), edMesSeguimiento, 'La fecha de seguimiento no puede ser menor al mes en curso.');

  FID_ObraDenunciaAnt := 0;
  
  // Si no existe en pod_obradenuncia, por compatibilidad, lo agrego
  if ExisteSQL ('SELECT 1 FROM art.pod_obradenuncia ' +
                    ' WHERE od_cuit = ' + SqlValue(FCUIT) +
                    '   AND od_estableci = ' + SqlValue(FEstableci) +
                    '   AND od_fecha = ' + SqlDate (FFechaDenuncia) +
                    '   AND od_operativo= ' + SqlValue (FOperativoDenuncia)) then
    FID_ObraDenuncia := ValorSql ('SELECT od_id FROM art.pod_obradenuncia ' +
                              ' WHERE od_cuit = ' + SqlValue(FCUIT) +
                              '   AND od_estableci = ' + SqlValue(FEstableci) +
                              '   AND od_fecha = ' + SqlDate (FFechaDenuncia) +
                              '   AND od_operativo= ' + SqlValue (FOperativoDenuncia))
  else begin
    FID_ObraDenuncia := GetSecNextVal('ART.SEQ_POD_ID');
    Sql_POD:= 'INSERT INTO art.pod_obradenuncia ' +
              '            (od_cuit, od_estableci, od_fecha, od_tipo, ' +
              '             od_usualta, od_fechaalta, ' +
              '             od_operativo, od_idvisita, od_tipo_visita, od_id' +
              '            ) ' +
              '    VALUES (' +
                           SqlValue(FCUIT) + ', ' +
                           SqlValue(FEstableci) + ', ' +
                           SqlDate(FFechaDenuncia) + ', ' +
                           SqlValue(FTipo) + ', ' +
                           SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
              '            SYSDATE, ' +
                           SqlValue(FOperativoDenuncia) + ', ' +
                           iif(FIdVisita = 0, 'NULL', SqlValue(FIdVisita)) + ', ''U'', ' +
                           SqlValue(FID_ObraDenuncia) +
              '           )';
  end;

  if edMesSeguimiento.Enabled then
    FechaSeguimiento :=  EncodeDate(edMesSeguimiento.Periodo.Ano, edMesSeguimiento.Periodo.Mes, DayOf(EndOfAMonth(edMesSeguimiento.Periodo.Ano, edMesSeguimiento.Periodo.Mes))) 
  else
    FechaSeguimiento := 0;

  if btnPMAceptar.Caption = TXT_AGREGAR then
  begin
    NroRecomendacion := IncSql(
        ' SELECT NVL (MAX (dd_nrorecomendacion), 0) '+
        '   FROM art.pdd_detalledenuncia, pod_obradenuncia '+
        '  WHERE od_cuit = '+SqlValue(FCUIT)+
        '    AND od_estableci = '+SqlValue(FEstableci)+
        '    AND od_id = dd_idpodobradenuncia');
    Sql_POE:= 'INSERT INTO art.pdd_detalledenuncia ' +
              '            (dd_id, dd_grupo, dd_rubro, dd_usualta, dd_fechaalta, ' +
              '             dd_tipo, dd_operativo, dd_idvisita, dd_observaciones, ' +
              '             dd_idpodobradenuncia, dd_nrorecomendacion, dd_tipodenuncia, dd_seguimiento ' +
              '            ) ' +
              '    VALUES (art.SEQ_PDD_ID.NEXTVAL, ' +
                           SqlValue(fraGrupoDenuncia.Codigo) + ', ' +
                           SqlValue(fraRubroDenuncia.Codigo) + ', ' +
                           SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
              '            SYSDATE, ' +
                           SqlValue(FTipo) + ', ' +
                           SqlValue(FOperativo) + ', ' +
                           iif(FIdVisita = 0, 'NULL', SqlValue(FIdVisita)) + ', ' +
                           SqlValue(trim(edObservacion.Lines.Text)) + ', ' +
                           SqlValue(FID_ObraDenuncia) +', '+ SqlValue(NroRecomendacion)+
                           ',''M'', '+
                           SqlDate(FechaSeguimiento) + 
              '           )';
  end
  else begin
    FID_ObraDenunciaAnt := sdqDenuncias.FieldByName('dd_idpodobradenuncia').AsInteger;
(*
    FID_ObraDenuncia := ValorSqlInteger ('SELECT od_id FROM art.pod_obradenuncia ' +
                                         ' WHERE od_cuit = ' + SqlValue(FCUIT) +
                                         '   AND od_estableci = ' + SqlValue(FEstableci) +
                                         '   AND od_fecha = ' + SqlValue (FFechaDenuncia)// +
                                      //   '   AND od_operativo= ' + SqlValue (FOperativo));
*)
    Sql_POE:= 'UPDATE art.pdd_detalledenuncia ' +
              '   SET dd_usumodif = ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
              '       dd_fechamodif = SYSDATE, ' +
              '       dd_fechabaja = null, ' +
              '       dd_usubaja = null, ' +
              '       dd_idvisita = ' + iif(FIdVisita = 0, 'NULL', SqlValue(FIdVisita)) + ', ' +
              '       dd_observaciones = ' + SqlValue (trim(edObservacion.Lines.Text)) + ', ' +
              '       dd_idpodobradenuncia = ' + SqlValue (FID_ObraDenuncia)  + ', ' +
              '       dd_seguimiento = ' + SqlDate(FechaSeguimiento) + 
              ' WHERE dd_id = ' + SqlValue(sdqDenuncias.FieldByName('dd_id').AsInteger);
  end;


  Try
    if Sql_POD <> '' then
      EjecutarSqlST(Sql_POD);

    EjecutarSqlST(Sql_POE);

    EjecutarSqlST('UPDATE art.pod_obradenuncia ' +
                  '   SET od_usumodif = ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
                  '       od_fechamodif = SYSDATE, ' +
                  '       od_observaciones1 = ' + SqlValue(Copy(ListaObservaciones(FID_ObraDenunciaAnt), 1, 4000)) + ', ' +
                  '       od_observaciones2 = ' + SqlValue(Copy(ListaObservaciones(FID_ObraDenunciaAnt), 4001, 3900)) +
                  ' WHERE od_id = ' + SqlValue(FID_ObraDenunciaAnt));

    EjecutarSqlST('UPDATE art.pod_obradenuncia ' +
                  '   SET od_observaciones1 = (SELECT rv_descripcion ' +
                  '                              FROM art.prv_resvisitas ' +
                  '                             WHERE rv_id = od_idvisita) ' +
                  ' WHERE od_observaciones1 IS NULL ' +
                  '   AND od_idvisita IS NOT NULL ' +
                  '   AND od_id = ' + SqlValue(FID_ObraDenunciaAnt));

    EjecutarSqlST('UPDATE art.pod_obradenuncia ' +
                  '   SET od_usumodif = ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
                  '       od_fechamodif = SYSDATE, ' +
                  '       od_observaciones1 = ' + SqlValue(Copy(ListaObservaciones(FID_ObraDenuncia), 1, 4000)) + ', ' +
                  '       od_observaciones2 = ' + SqlValue(Copy(ListaObservaciones(FID_ObraDenuncia), 4001, 3900)) +
                  ' WHERE od_id = ' + SqlValue(FID_ObraDenuncia));

    EjecutarSqlST('UPDATE art.pod_obradenuncia ' +
                  '   SET od_observaciones1 = (SELECT rv_descripcion ' +
                  '                              FROM art.prv_resvisitas ' +
                  '                             WHERE rv_id = od_idvisita) ' +
                  ' WHERE od_observaciones1 IS NULL ' +
                  '   AND od_idvisita IS NOT NULL ' +
                  '   AND od_id = ' + SqlValue(FID_ObraDenuncia));

    ValorRubro := ValorSql(
      ' SELECT ed_codigodenuncia '+
      '   FROM art.ped_excepcionrubrodenuncia '+
      ' WHERE ed_clave = ''ID_'' || '+SqlValue(sdqDenuncias.fieldbyname('dd_grupo').AsString)+
      '   AND ed_codigo = '+SqlValue(sdqDenuncias.fieldbyname('dd_rubro').AsString)+
      '   AND ed_tipo = '+SqlValue(FTipo));
    if ValorRubro = '' then
      ValorRubro := sdqDenuncias.fieldbyname('dd_rubro').AsString;


    EjecutarSqlST(' UPDATE art.poe_obradendetalle ' +
               ' SET oe_fechabaja = SYSDATE, ' +
               '     oe_usubaja = ' + SqlValue(frmPrincipal.DBLogin.LoginName)  +
               ' WHERE oe_cuit = ' + SqlValue(FCuit) +
               ' AND oe_estableci = ' + SqlValue(FEstableci) +
               ' AND oe_fecha = ' + SqlValue(sdqDenuncias.fieldbyname('rv_fecha').AsDateTime) +
               ' AND oe_grupo = ' + SqlValue(sdqDenuncias.fieldbyname('dd_grupo').AsString) +
               ' AND oe_rubro = ' + SqlValue(ValorRubro) +
               ' AND NOT EXISTS(SELECT 1 ' +
               '                  FROM art.pdd_detalledenuncia pdd, art.pod_obradenuncia pod ' +
               '                 WHERE od_cuit = oe_cuit ' +
               '                   AND od_estableci = oe_estableci ' +
               '                   AND od_fecha = oe_fecha ' +
               '                   AND dd_grupo = oe_grupo ' +
               '                   AND dd_rubro = ' + SqlValue(sdqDenuncias.fieldbyname('dd_rubro').AsString)+
               '                   AND dd_idpodobradenuncia = od_id ' +
               '                   AND dd_fechabaja IS NULL) ' +
               ' AND NOT EXISTS(SELECT 1 ' +
               '                  FROM art.pdd_detalledenuncia pdd, art.pod_obradenuncia pod, art.ppv_planmvisitas ' +
               '                 WHERE od_cuit = oe_cuit ' +
               '                   AND od_estableci = oe_estableci ' +
               '                   AND pv_fecha = oe_fecha ' +
               '                   AND dd_grupo = oe_grupo ' +
               '                   AND dd_rubro = ' +SqlValue(sdqDenuncias.fieldbyname('dd_rubro').AsString)+
               '                   AND dd_idpodobradenuncia = od_id ' +
               '                   AND pv_tipovisita = ''I'' '+
               '                   AND pdd.dd_id = pv_iddenuncia ' +
               '                   AND pv_fechabaja IS NULL) ');

    sdqDenuncias.Refresh;

    if sdqVisitas.Active then
      sdqVisitas.Refresh
    else
      sdqVisitas.Open;

    fpDenuncias.ModalResult := mrOk;
  except
    on E: Exception do ErrorMsg( E );
  end;
end;

{------------------------------------------------------------------------------}
{ Toolbar Visitas                                                              }
{------------------------------------------------------------------------------}

procedure TfrmPlanMejoras.tbVisAgregarClick(Sender: TObject);
begin
//  if FIdUltimaVisita = 0 then
    if dbgDenuncias.SelectedRows.Count > 0 then
    begin

      FIdUltimaVisita := ValorSqlInteger ('SELECT MAX (rv.rv_id) rv_id ' +
                                          '  FROM art.prv_resvisitas rv ' +
                                          ' WHERE rv.rv_cuit = ' + SqlValue (FCUIT) +
                                          '   AND rv.rv_estableci = ' + SqlValue (FEstableci) +
                                          '   AND rv.rv_operativo = ' + SqlValue (FOperativo) +
                                          '   AND rv.rv_fechabaja IS NULL ') ;
  (*
                                          '   AND rv.rv_fecha = ' +
                                          '          (SELECT MAX (rv_fecha) ' +
                                          '             FROM art.prv_resvisitas ' +
                                          '            WHERE rv_cuit = rv.rv_cuit ' +
                                          '              AND rv_estableci = rv.rv_estableci ' +
                                          '              AND rv_operativo = rv.rv_operativo ' +
                                          '              AND rv_fechabaja IS NULL) '
                                         );
  *)

    cmbVisTipo.ItemIndex := 0;
    edVisFecha.Date      := ValorSqlDateTime (
                              'SELECT rv_fecha ' +
                              '  FROM art.prv_resvisitas ' +
                              ' WHERE rv_id = ' + SqlValue (FIdUltimaVisita)
                            );

    if fpVisita.ShowModal = mrOk Then
      sdqVisitas.Refresh ;
  end;
end;

procedure TfrmPlanMejoras.tbVisQuitarClick(Sender: TObject);
var
  Sql: String;
  Sql_POE: String;
  ValorRubro : String;
begin
  Try
    Sql := 'UPDATE ppv_planmvisitas ' +
           '   SET pv_usubaja = ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
           '       pv_fechabaja = SYSDATE ' +
           ' WHERE pv_id = ' + SqlValue(sdqVisitas.FieldByName('pv_id').AsInteger);

    EjecutarSqlST(Sql);

    ValorRubro := ValorSql(
      ' SELECT ed_codigodenuncia '+
      '   FROM art.ped_excepcionrubrodenuncia '+
      ' WHERE ed_clave = ''ID_'' || '+SqlValue(sdqDenuncias.fieldbyname('dd_grupo').AsString)+
      '   AND ed_codigo = '+SqlValue(sdqDenuncias.fieldbyname('dd_rubro').AsString)+
      '   AND ed_tipo = '+SqlValue(FTipo));
    if ValorRubro = '' then
      ValorRubro := sdqDenuncias.fieldbyname('dd_rubro').AsString;

    Sql_POE := ' UPDATE art.poe_obradendetalle ' +
               ' SET oe_fechabaja = SYSDATE, ' +
               '     oe_usubaja = ' + SqlValue(frmPrincipal.DBLogin.LoginName)  +
               ' WHERE oe_cuit = ' + SqlValue(FCuit) +
               ' AND oe_estableci = ' + SqlValue(FEstableci) +
               ' AND oe_fecha = ' + SqlValue(sdqVisitas.fieldbyname('pv_fecha').AsDateTime) +
               ' AND oe_grupo = ' + SqlValue(sdqDenuncias.fieldbyname('dd_grupo').AsString) +
               ' AND oe_rubro = ' + SqlValue(ValorRubro) +
               ' AND NOT EXISTS(SELECT 1 ' +
               '                  FROM art.pdd_detalledenuncia pdd, art.pod_obradenuncia pod ' +
               '                 WHERE od_cuit = oe_cuit ' +
               '                   AND od_estableci = oe_estableci ' +
               '                   AND od_fecha = oe_fecha ' +
               '                   AND dd_grupo = oe_grupo ' +
               '                   AND dd_rubro = ' +SqlValue(sdqDenuncias.fieldbyname('dd_rubro').AsString)+
               '                   AND dd_idpodobradenuncia = od_id ' +
               '                   AND dd_fechabaja IS NULL) ' +
               ' AND NOT EXISTS(SELECT 1 ' +
               '                  FROM art.pdd_detalledenuncia pdd, art.pod_obradenuncia pod, art.ppv_planmvisitas ' +
               '                 WHERE od_cuit = oe_cuit ' +
               '                   AND od_estableci = oe_estableci ' +
               '                   AND pv_fecha = oe_fecha ' +
               '                   AND dd_grupo = oe_grupo ' +
               '                   AND dd_rubro = ' +SqlValue(sdqDenuncias.fieldbyname('dd_rubro').AsString)+
               '                   AND dd_idpodobradenuncia = od_id ' +
               '                   AND pv_tipovisita = ''I'' '+
               '                   AND pdd.dd_id = pv_iddenuncia ' +
               '                   AND pv_fechabaja IS NULL) ';


    EjecutarSqlST(Sql_POE);

    sdqVisitas.Refresh ;
  Except
    on E: Exception do ErrorMsg(E);
  end;
end;

procedure TfrmPlanMejoras.tbVisOrdenarClick(Sender: TObject);
begin
  sdVisitas.Execute ;
end;

{------------------------------------------------------------------------------}
{ fpVisita                                                                     }
{------------------------------------------------------------------------------}

procedure TfrmPlanMejoras.btnVisAceptarClick(Sender: TObject);
var
  Sql: String;
  VisTipo : Char;
  i, aIDObraDenuncia: Integer;

  procedure ActualizarObsDenuncias;
  var
    FTexto : TStrings;
    actSql : TSql;
  begin
    FTexto := TStringList.Create;

    try
      with qryDenuncias do
      begin
        ParamByName('pcuit').Value      := FCUIT;
//       AND od_operativo = :poperativo
//    ParamByName('poperativo').Value := FOperativo;
        ParamByName('pestableci').Value := FEstableci;
        Open;

        while not EoF do
        begin
          FTexto.Clear;

          qryObsDenuncias.ParamByName('od_id').Value := FieldByName('od_id').AsInteger;
          qryObsDenuncias.Open;
          while not qryObsDenuncias.EoF do
          begin
            if Trim (qryObsDenuncias.FieldByName('obs').AsString) <> '' then
              FTexto.Append(Trim(qryObsDenuncias.FieldByName('obs').AsString));

            qryObsDenuncias.Next
          end;
          qryObsDenuncias.Close;

          actSql := TSql.Create('pod_obradenuncia');
          try
            actSql.PrimaryKey.Add('od_id', FieldByName('od_id').AsInteger);
            actSql.Fields.Add('od_observaciones1', TrimLeft (Copy(Trim(FTexto.Text), 0, 4000)));
            actSql.Fields.Add('od_observaciones2', Copy (Trim (FTexto.Text), 4001, 3900));
            actSql.SqlType := stUpdate;
            EjecutarSqlST(actSql.Sql);
          finally
            actSql.Free;
          end;

          Next
        end;

        Close
      end;
    finally
      FTexto.Free
    end
  end;

begin
  VisTipo := cmbVisTipo.Value[1];
  aIDObraDenuncia := 0;

  VerificarMultiple (['Registro de Visita para Plan de Mejoras',
                      cmbVisTipo,
                      cmbVisTipo.ItemIndex >= 0,
                      'Debe seleccionar el Tipo de Seguimiento',
                      edVisFecha,
                      edVisFecha.IsValid,
                      'Debe ingresar una fecha válida',
                      edVisFecha,
                      not edVisFecha.IsEmpty,
                      'Debe seleccionar la Fecha de Visita',
                      edVisFecha,
                      edVisFecha.Date <= DBDate,
                      'La Fecha de Visita debe ser menor o igual a hoy',
                      edVisFecha,
                      edVisFecha.Date <> sdqDenuncias.FieldByName('rv_fecha').AsDateTime,
                      'La fecha de la visita no puede ser igual a la de la denuncia'
                     ]);

  FIdVisita := ValorSqlInteger('SELECT rv_id FROM art.prv_resvisitas ' +
                               ' WHERE rv_cuit = ' + SqlValue(FCUIT) +
                               '   AND rv_estableci = ' + SqlValue(FEstableci) +
                               '   AND rv_fecha = ' + SqlDate (edVisFecha.Date) +
                               //'   AND rv_tipo = ' + SqlValue(FTipo) +
                               '   AND rv_operativo= ' + SqlValue (FOperativo));

  if FIdVisita = 0 then
  begin
    InvalidMsg(edVisFecha, 'No existe una visita para la fecha indicada.');
    abort;
  end;

  // Si no existe en pod_obradenuncia, por compatibilidad, lo agrego
  if (VisTipo = 'I') and not ExisteSQL ('SELECT 1 FROM art.pod_obradenuncia ' +
                                        ' WHERE od_cuit = ' + SqlValue(FCUIT) +
                                        '   AND od_estableci = ' + SqlValue(FEstableci) +
                                        '   AND od_tipo = ' + SqlValue(FTipo) +
                                        '   AND od_fecha = ' + SqlDate (edVisFecha.Date) +
                                        '   AND od_operativo= ' + SqlValue (FOperativo)) then
  begin
    aIDObraDenuncia := GetSecNextVal('ART.SEQ_POD_ID');

    EjecutarSqlST( 'INSERT INTO art.pod_obradenuncia ' +
                  '            (od_cuit, od_estableci, od_fecha, od_tipo, ' +
                  '             od_usualta, od_fechaalta, ' +
                  '             od_operativo, od_idvisita, od_tipo_visita, od_id ' +
                  '            ) ' +
                  '    VALUES (' +
                               SqlValue(FCUIT) + ', ' +
                               SqlValue(FEstableci) + ', ' +
                               SqlDate(edVisFecha.Date) + ', ' +
                               SqlValue(FTipo) + ', ' +
                               SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
                  '            SYSDATE, ' +
                               SqlValue(FOperativo) + ', ' +
                               iif(FIdVisita = 0, 'NULL', SqlValue(FIdVisita)) + ', ''U'', ' +
                               SqlValue(aIDObraDenuncia) +  '           )' );
  end
  else begin
    if (VisTipo = 'I') then
      aIDObraDenuncia := ValorSql ('SELECT od_id FROM art.pod_obradenuncia ' +
                                            ' WHERE od_cuit = ' + SqlValue(FCUIT) +
                                            '   AND od_estableci = ' + SqlValue(FEstableci) +
                                            '   AND od_tipo = ' + SqlValue(FTipo) +
                                            '   AND od_fecha = ' + SqlDate (edVisFecha.Date) +
                                            '   AND od_operativo= ' + SqlValue (FOperativo));
  end;

  try
    for i := 0 to dbgDenuncias.SelectedRows.Count-1 do
    begin
      dbgDenuncias.GotoSelection(i);

      if not ExisteSql('SELECT 1 ' +
                       '  FROM ppv_planmvisitas ' +
                       ' WHERE pv_fechabaja IS NULL ' +
                       '   AND pv_iddenuncia = ' + SqlValue(sdqDenuncias.FieldByName('dd_id').AsInteger) +
                       '   AND pv_fecha = ' + edVisFecha.SqlText) then
      begin
        Sql := 'INSERT INTO ppv_planmvisitas ' +
               '            (pv_id, pv_iddenuncia, pv_fecha, ' +
               '             pv_tipovisita, pv_fechaalta, ' +
               '             pv_usualta) ' +
               '     VALUES (art.seq_ppv_id.NEXTVAL, ' +
                             SqlValue(sdqDenuncias.FieldByName('dd_id').AsInteger) +  ', ' +
                             edVisFecha.SqlText + ', ' +
                             SqlValue(VisTipo) + ', SYSDATE, ' +
                             SqlValue(frmPrincipal.DBLogin.LoginName) + ')';

        EjecutarSqlST(Sql);
      end
    end;

    dbgDenuncias.UnselectAll;

    EjecutarSqlST('UPDATE art.pod_obradenuncia ' +
                  '   SET od_observaciones1 = ' + SqlValue(Copy(ListaObservaciones(aIDObraDenuncia, edVisFecha.Date), 1, 4000)) + ', ' +
                  '       od_observaciones2 = ' + SqlValue(Copy(ListaObservaciones(aIDObraDenuncia, edVisFecha.Date), 4001, 3900)) +', ' +
                  '       od_fechamodif = sysdate,'+
                  '       od_usumodif = '+ SqlValue(frmPrincipal.DBLogin.LoginName)+
                  ' WHERE od_id = ' + SqlValue(aIDObraDenuncia));

    EjecutarSqlST('UPDATE art.pod_obradenuncia ' +
                  '   SET od_observaciones1 = (SELECT rv_descripcion ' +
                  '                              FROM art.prv_resvisitas ' +
                  '                             WHERE rv_id = od_idvisita) ' +
                  ' WHERE od_observaciones1 IS NULL ' +
                  '   AND od_idvisita IS NOT NULL ' +
                  '   AND od_id = ' + SqlValue(aIDObraDenuncia));
(*
    Sql := 'INSERT INTO ppv_planmvisitas ' +
           '            (pv_id, pv_iddenuncia, pv_fecha, ' +
           '             pv_tipovisita, pv_fechaalta, ' +
           '             pv_usualta) ' +
           '     VALUES (art.seq_ppv_id.NEXTVAL, ' +
                         SqlValue(sdqDenuncias.FieldByName('dd_id').AsInteger) +  ', ' +
                         edVisFecha.SqlText + ', ' +
                         SqlValue(VisTipo) + ', SYSDATE, ' +
                         SqlValue(frmPrincipal.DBLogin.LoginName) + ')';

    EjecutarSqlST(Sql);
*)
    if sdqVisitas.Active then
      sdqVisitas.Refresh
    else
      sdqVisitas.Open;
//    ActualizarObsDenuncias;

    fpVisita.ModalResult := mrOk ;
  except
    on E: Exception do begin
       ErrorMsg(E, 'Error al guardar los datos');
    end;
  end;
end;

procedure TfrmPlanMejoras.dbgDenunciasGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqDenuncias.FieldByName('dd_fechabaja').IsNull then
    AFont.Color := clRed;
  if (sdqDenuncias.FieldByName('dd_tipodenuncia').AsString = 'A') then
    Background := clSkyBlue
end;

procedure TfrmPlanMejoras.dbgVisitasGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqVisitas.FieldByName('pv_fechabaja').IsNull then
    AFont.Color := clRed
end;

function TfrmPlanMejoras.ListaObservaciones(IDObraDenuncia: Integer;
  aFecha: TDate): String;
var
  SRegistro: TStrings;
begin
  SRegistro:= TStringList.Create;

  try
    sdqListaObservacionesVisitas.ParamByName('fecha').AsDateTime := aFecha;
    sdqListaObservacionesVisitas.ParamByName('cuit').Value := FCUIT;
    sdqListaObservacionesVisitas.ParamByName('estableci').Value := FEstableci;
    sdqListaObservacionesVisitas.ParamByName('tipo').Value := FTipo;
    sdqListaObservacionesVisitas.ParamByName('operativo').Value := FOperativo;
    sdqListaObservacionesVisitas.Open;

    while not sdqListaObservacionesVisitas.EoF do
    begin
      if Trim (sdqListaObservacionesVisitas.FieldByName('obs').AsString) <> '' then
        SRegistro.Append (Trim(sdqListaObservacionesVisitas.FieldByName('obs').AsString));
      sdqListaObservacionesVisitas.Next;
    end;

    sdqListaObservacionesVisitas.Close;
    Result := SRegistro.Text
  finally
    SRegistro.Free
  end;
end;


procedure TfrmPlanMejoras.sdqDenunciasAfterScroll(DataSet: TDataSet);
begin
  sdqVisitas.Close;
  sdqVisitas.ParamByName('dd_id').AsInteger := sdqDenuncias.FieldByName('dd_id').AsInteger;
  sdqVisitas.Open;
end;

procedure TfrmPlanMejoras.SetTipoEstabPrev(const Value: integer);
begin
  FTipoEstabPrev := Value;
  if (FTipoEstabPrev = TIPO_EMPRESA_PREV_EADS) then
  begin
    LockControl(edMesSeguimiento, false);
    edMesSeguimiento.Enabled := true;
  end
  else begin
    LockControl(edMesSeguimiento, true);
    edMesSeguimiento.Enabled := false;
  end;
end;

end.



