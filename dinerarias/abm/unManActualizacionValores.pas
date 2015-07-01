unit unManActualizacionValores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  AnsiSql, CurrEdit, PatternEdit, IntEdit, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmManActualizacionValores = class(TfrmCustomGridABM)
    gbVigencia: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edVigDesde: TDateComboBox;
    edVigHasta: TDateComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edPagoUnico: TCurrencyEdit;
    Label5: TLabel;
    edVigDesde_abm: TDateComboBox;
    Label6: TLabel;
    edMinimoComp: TCurrencyEdit;
    Label7: TLabel;
    edPiso: TIntEdit;
    fraTipo: TfraCodigoDescripcion;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure fraTipoExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Do_habilitarMinimoCompensacion;
    function ValidarAutorizarValor: boolean;
    procedure Do_HabilitacionBotones;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: Boolean; override;
    function Validar : Boolean; override;

  public
    { Public declarations }
  end;

var
  frmManActualizacionValores: TfrmManActualizacionValores;

implementation

uses unComunes, unDmPrincipal, CustomDlgs, VCLExtra, SqlFuncs, unSesion, General;

{$R *.dfm}

procedure TfrmManActualizacionValores.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  inherited;
  sSql := 'SELECT di_id, di_tipo tipo, ti_descripcion descripcion, di_vigenciadesde vigdesde, di_vigenciahasta vighasta, di_tope piso, di_pagounico pagounico, ' +
                ' di_minimocompensacion minimocompensacion, di_autorizado autorizado, di_fechaautorizado fautorizado, di_usuautorizado usuautorizado, ti_compensacion ' +
           ' FROM art.sdi_datoindemnizacion, SIN.sti_tipoincapacidad ' +
          ' WHERE di_tipo = ti_codigo ' +
            ' AND ti_mantenimiento = ''S'' ' +
            ' AND di_vigenciadesde >= ' + SqlDate(strtodate(FECHA_DECRETO_1694_09));

  if not edVigDesde.IsEmpty then
    sSql := sSql + ' AND di_vigenciadesde >= ' + SqlDate(edVigDesde.Date);    // >
  if not edVigHasta.IsEmpty then
    sSql := sSql + ' AND di_vigenciadesde <= ' + SqlDate(edVigHasta.Date);    // <

  sSql := sSql + ' ORDER BY di_tipo, di_vigenciadesde ';

  sdqConsulta.SQL.Text := ssql;
  sdqConsulta.Open;

  Do_HabilitacionBotones;
end;

procedure TfrmManActualizacionValores.FormCreate(Sender: TObject);
begin
  inherited;

  with fraTipo do
  begin
    TableName      := 'SIN.sti_tipoincapacidad';
    FieldId        := 'TI_ID';
    FieldCodigo    := 'TI_CODIGO';
    FieldDesc      := 'TI_DESCRIPCION';
    FieldBaja      := 'TI_FECHABAJA';
    ExtraCondition := 'AND ti_mantenimiento = ''S'' ';
    ShowBajas      := False;
  end;

  ShowActived := False;
  Sql.TableName := 'art.sdi_datoindemnizacion';
  tbRefrescarClick(nil);
end;

procedure TfrmManActualizacionValores.ClearControls;
begin
  fraTipo.Clear;
  edPiso.Clear;
  edPagoUnico.Clear;
  edVigDesde_abm.Clear;
  edMinimoComp.Clear;
end;

function TfrmManActualizacionValores.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    case ModoABM of
      maAlta:
      begin
     //   SqlType := stUpdate;
     //   PrimaryKey.Add('di_id', sdqConsulta.FieldByName('di_id').AsInteger, False);
     //   Fields.Add('di_fecaccidente', edVigDesde_abm.Date);
     //   sSql := ' UPDATE art.sdi_datoindemnizacion ' +
     //              ' SET di_fecaccidente = ' + SqlDate(edVigDesde_abm.Date) +
     //            ' WHERE di_tipo = ' + SqlValue(fraTipo.Codigo) +
     //              ' AND di_fecaccidente = to_date(''01/01/2100'',''dd/mm/yyyy'') ';
     //   EjecutarSqlST(sSql);

        SqlType := stInsert;
        Fields.Add('di_tipo', fraTipo.Codigo);
        Fields.Add('di_fecaccidente', 'to_date(''01/01/2100'',''dd/mm/yyyy'')', False);
        Fields.Add('di_coeficiente', 53);
        Fields.Add('di_tope', edPiso.Value);
        Fields.Add('di_pagounico', edPagoUnico.Value);
        Fields.Add('di_vigenciadesde', edVigDesde_abm.SqlText, False);
        Fields.Add('di_minimocompensacion', edMinimoComp.Value , 2, True);
      end;

      maModificacion:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('di_id', sdqConsulta.FieldByName('di_id').AsInteger, False);
        Fields.Add('di_tope', edPiso.Value);
        Fields.Add('di_pagounico', edPagoUnico.Value);
        Fields.Add('di_minimocompensacion', edMinimoComp.Value , 2, True);
      end;
    end;
    Result := inherited DoABM;
  end;

end;

procedure TfrmManActualizacionValores.LoadControls;
begin
  fraTipo.Codigo      := sdqConsulta.FieldByName('tipo').AsString;
  edPiso.Value        := sdqConsulta.FieldByName('piso').AsInteger;
  edPagoUnico.Value   := sdqConsulta.FieldByName('pagounico').AsCurrency;
  edVigDesde_abm.Date := sdqConsulta.FieldByName('vigdesde').AsDateTime;
  edMinimoComp.Value  := sdqConsulta.FieldByName('minimocompensacion').AsCurrency;
end;

function TfrmManActualizacionValores.Validar: Boolean;
var sSql : string;
    dUltVigDesde: TDateTime;
begin
//  sTipo := sdqConsulta.FieldByName('tipo').AsString;
  Verificar((ModoABM = maAlta) and (fraTipo.Codigo = ''), fraTipo, 'Debe completar el Tipo');
  Verificar((edPiso.Text = ''), edPiso, 'Debe completar el Piso');
  Verificar((edPagoUnico.Text = ''), edPagoUnico, 'Debe completar el Pago único');
  Verificar(edVigDesde_abm.IsEmpty, edVigDesde_abm, 'Debe completar la Vigencia Desde');

  // Valido que los importes Piso, Pago Unico y Minimo Compensacion, no sean menores al ultimo autorizado para ese tipo de incap.
  sSql := 'SELECT di_tope Piso, di_pagounico pagounico, di_minimocompensacion MinimoComp  ' +
           ' FROM art.sdi_datoindemnizacion  ' +
           ' WHERE di_tipo = ' + SqlValue(fraTipo.Codigo) +
             ' AND di_autorizado = ''S'' ' +
             ' AND di_id = (SELECT MAX(di_id) FROM art.sdi_datoindemnizacion ' +
                             ' WHERE di_tipo = ' + SqlValue(fraTipo.Codigo) +
                               ' AND di_autorizado = ''S'' )' ;
  with GetQuery(sSql) do
  try
    if not Eof then
    begin
      Verificar((not edPiso.IsEmpty) and (edPiso.Value < FieldByName('piso').Value), edPiso,
                'El importe Piso de este concepto, debe ser mayor al último autorizado (' + FieldByName('piso').AsString +')');
      Verificar(( edPagoUnico.Value > 0) and (edPagoUnico.Value < FieldByName('pagounico').Value), edPagoUnico,
                'El importe Pago único de este concepto, debe ser mayor al último autorizado (' + FieldByName('pagounico').AsString +')');
      Verificar((edMinimoComp.Value > 0) and (edMinimoComp.Value < FieldByName('MinimoComp').Value), edMinimoComp,
                'El importe Mínimo Compensación de este concepto, debe ser mayor al último autorizado (' + FieldByName('MinimoComp').AsString +')');
    end;
  finally
    Free;
  end;


  if (ModoABM = maAlta) then
  begin
    // Valido que no exixta un valor del mismo tipo, sin autorizar, en cuyo caso no se podra insertar.
    sSql  := 'SELECT 1 FROM art.sdi_datoindemnizacion ' +
             ' WHERE di_tipo = ' + SqlValue(fraTipo.Codigo) +
               ' AND di_autorizado = ''N'' ';
    Verificar(ExisteSql(sSql), fraTipo, 'No se puede insertar un valor con el tipo ' + fraTipo.Codigo + ' debido a que ya existe un valor sin autorizar del mismo.');

    // Valido que la vigencia Desde no sea menor a la anterior (ultima autorizada)
    sSql := ' SELECT di_vigenciadesde vigDesde ' +
              ' FROM art.sdi_datoindemnizacion ' +
             ' WHERE di_tipo = ' + SqlValue(fraTipo.Codigo) +
               ' AND di_autorizado = ''S'' ' +
               ' AND di_id = (select max(di_id) from art.sdi_datoindemnizacion ' +
                             ' where di_tipo = ' + SqlValue(fraTipo.Codigo) +
                               ' and di_autorizado = ''S'') ';
    dUltVigDesde := ValorSqlDateTime(sSql);
    Verificar((edVigDesde_abm.Date < dUltVigDesde), edVigDesde_abm, 'La Vigencia Desde del concepto ' + fraTipo.Codigo +
                                                                   ' debe ser mayor a la última ingresada (' + DateToStr(dUltVigDesde) + ').' );
  end;

  Result := True;
end;

procedure TfrmManActualizacionValores.fpAbmBeforeShow(Sender: TObject);
begin
  VCLExtra.LockControls([fraTipo, edVigDesde_abm], (ModoABM = maModificacion));
//  VCLExtra.LockControls([btnAceptar], (sdqConsulta.FieldByName('AUTORIZADO').AsString = 'S') or (modoABM = maModificacion));  // Esto lo hago porque suele pasar luego de refrescar que queda el boton de Modificar habilitado cuando no corresponde...
//  VCLExtra.LockControls([edMinimoComp], ((sdqConsulta.FieldByName('tipo').AsString <> 'TD') and (sdqConsulta.FieldByName('tipo').AsString <> 'M')) or (ModoABM = maAlta) );
  Do_habilitarMinimoCompensacion;
end;


procedure TfrmManActualizacionValores.Do_habilitarMinimoCompensacion;
var sSql, sCompensacion: string;
begin
  sSql := 'SELECT ti_compensacion ' +
           ' FROM SIN.sti_tipoincapacidad ' +
          ' WHERE ti_codigo = ' + SqlValue(fraTipo.Codigo);

  sCompensacion := ValorSql(sSql);

  if (sCompensacion = 'N') then
    edMinimoComp.Clear;

  VCLExtra.LockControls([edMinimoComp], (sCompensacion = 'N'));

end;

procedure TfrmManActualizacionValores.tbPropiedadesClick(Sender: TObject);    // Autorizar Valor
var sSql: string;
begin
  if ValidarAutorizarValor and MsgAsk('¿Esta seguro que desea Autorizar el valor de Tipo ' + sdqConsulta.FieldByName('tipo').AsString + ' ?') then
  begin
    BeginTrans;
    Try
      sSql := ' UPDATE art.sdi_datoindemnizacion ' +         // Modifica la fecha de accidente del anterior inmediato
                 ' SET di_fecaccidente = (SELECT di_vigenciadesde ' +
                                          ' FROM art.sdi_datoindemnizacion ' +
                                         ' WHERE di_tipo = ' + SqlValue(sdqConsulta.FieldByName('tipo').AsString) +
                                           ' and di_fecaccidente = to_date(''01/01/2100'',''dd/mm/yyyy'') ' +
                                           ' and di_autorizado = ''N'') ' +
               ' WHERE di_tipo = ' + SqlValue(sdqConsulta.FieldByName('tipo').AsString) +
                 ' AND di_fecaccidente = to_date(''01/01/2100'',''dd/mm/yyyy'') ' +
                 ' AND di_autorizado = ''S'' ';
      EjecutarSqlST(sSql);

      sSql := 'UPDATE art.sdi_datoindemnizacion ' +
                ' SET di_autorizado = ''S'', ' +
                    ' di_fechaautorizado = art.actualdate, ' +
                    ' di_usuautorizado = ' + SqlValue(Sesion.UserID) +
              ' WHERE di_id = ' + SqlInt(sdqConsulta.FieldByName('di_id').AsInteger);
      EjecutarSqlST(sSql);
      CommitTrans;
      tbRefrescarClick(nil);
    Except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar guardar los datos.');
        Rollback;
      end;
    end;
  end;
end;

function TfrmManActualizacionValores.ValidarAutorizarValor: boolean;
begin
  Verificar((sdqConsulta.FieldByName('autorizado').AsString = 'S'), tbPropiedades, 'No se puede autorizar este registro, debido a que ya se encuentra autorizado.');
  Result := true;    
end;

procedure TfrmManActualizacionValores.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  Do_HabilitacionBotones;
end;

procedure TfrmManActualizacionValores.fraTipoExit(Sender: TObject);
begin
  inherited;
  fraTipo.FrameExit(Sender);
  Do_habilitarMinimoCompensacion;
end;

procedure TfrmManActualizacionValores.Do_HabilitacionBotones;
var bNoAutorizado: boolean;
begin
  bNoAutorizado := (sdqConsulta.FieldByName('autorizado').AsString = 'N');
  tbPropiedades.Enabled := bNoAutorizado and Seguridad.Activar(tbPropiedades);
  tbModificar.Enabled   := bNoAutorizado and Seguridad.Activar(tbModificar);
end;


procedure TfrmManActualizacionValores.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edVigDesde.Clear;
  edVigHasta.Clear;
end;

end.
