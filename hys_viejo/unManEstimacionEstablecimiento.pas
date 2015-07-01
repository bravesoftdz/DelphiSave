unit unManEstimacionEstablecimiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, Mask, PatternEdit, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, ExComboBox, unArtDbFrame, unFraEmpresa,
  IntEdit, unFraStaticCodigoDescripcion, unfraCtbTablas, ToolEdit, CurrEdit;

type
  TfrmManEstimacionEstablecimiento = class(TfrmCustomGridABM)
    lbCIIU: TLabel;
    lbCapitas: TLabel;
    lbCapitasDesde: TLabel;
    lbCapitasHasta: TLabel;
    edCapitasDesde: TPatternEdit;
    edCapitasHasta: TPatternEdit;
    lbCantidadEstab: TLabel;
    edCantidadEstab: TPatternEdit;
    ShortCutControl1: TShortCutControl;
    fpCotizacionVisitas: TFormPanel;
    Bevel1: TBevel;
    btnAceptarCotIzacion: TButton;
    btnCancelCotizacion: TButton;
    lbCUIT: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edCantEmpleados: TIntEdit;
    edCantEstab: TIntEdit;
    mskCUIT: TMaskEdit;
    fraActividad: TfraStaticCodigoDescripcion;
    lbCIUU: TLabel;
    fraProvincia: TfraCodigoDescripcion;
    fraTipoFet: TfraCtbTablas;
    Label3: TLabel;
    Label4: TLabel;
    SDcotizacionprevencion: TSDStoredProc;
    cbLicitacion: TCheckBox;
    fraSectores: TfraCtbTablas;
    Label5: TLabel;
    tbCotizacionVisitas: TToolButton;
    lbCosto: TLabel;
    edCosto: TCurrencyEdit;
    edCIIU: TPatternEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbCotizacionVisitasClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
    FIDEstimacionEstab : Integer;
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmManEstimacionEstablecimiento: TfrmManEstimacionEstablecimiento;

implementation

uses
  unDmPrincipal, unSesion, SqlFuncs, CustomDlgs, StrFuncs,AnsiSql,
  unCustomConsulta, vclExtra;

{$R *.dfm}

{ TfrmManEstimacionEstablecimiento }

procedure TfrmManEstimacionEstablecimiento.ClearControls;
begin
  inherited;
  edCIIU.Text := '';
  edCapitasDesde.Clear;
  edCapitasHasta.Clear;
  edCantidadEstab.Clear;
end;

function TfrmManEstimacionEstablecimiento.DoABM: Boolean;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      FIDEstimacionEstab := sdqConsulta.FieldByName('EE_ID').AsInteger;
      Sql.Fields.Add('EE_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('EE_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('EE_CIIU', edCIIU.Text);
      Sql.Fields.Add('EE_CAPITASDESDE', edCapitasDesde.Text);
      Sql.Fields.Add('EE_CAPITASHASTA', edCapitasHasta.Text);
      Sql.Fields.Add('EE_CANTESTAB', edCantidadEstab.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        FIDEstimacionEstab := GetSecNextVal('HYS.SEQ_HEE_ESTIMACION_ID');
        Sql.Fields.Add('EE_USUALTA', Sesion.UserID );
        Sql.Fields.Add('EE_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        Sql.Fields.Add('EE_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('EE_FECHAMODIF', exDateTime );
        Sql.Fields.Add('EE_USUBAJA', exNull );
        Sql.Fields.Add('EE_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('EE_ID', FIDEstimacionEstab);
    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManEstimacionEstablecimiento.FormCreate(Sender: TObject);
begin
  inherited;
  with fraACTIVIDAD do
  begin
    TableName   := 'CAC_ACTIVIDAD';
    FieldID     := 'AC_ID';
    FieldCodigo := 'AC_CODIGO';
    FieldDesc   := 'AC_DESCRIPCION';
  end;

  with fraProvincia do
  begin
    TableName   := 'art.cpv_provincias';
    FieldID     := 'PV_CODIGO';
    FieldCodigo := 'PV_CODIGO';
    FieldDesc   := 'PV_DESCRIPCION';
    FieldBaja   := 'PV_FECHABAJA';
    Showbajas   := True;
  end;

  fraTipoFet.Clave       := 'TFET';
  fraTipoFet.ExtraCondition := ' AND TB_CODIGO IN (''ET'', ''EP'', ''GB'')';
  fraSectores.Clave       := 'SECT';

  FieldBaja := 'ee_fechabaja';
  Sql.TableName := 'hys.hee_estimacionestab';
  tbCotizacionVisitas.Left := tbSalir.Left -5;
  vclExtra.LockControls([edCosto],True);
end;

procedure TfrmManEstimacionEstablecimiento.LoadControls;
begin
  inherited;
  ClearControls;
  edCIIU.Text := sdqConsulta.FieldByName('EE_CIIU').AsString;
  edCapitasDesde.Text := sdqConsulta.FieldByName('EE_CAPITASDESDE').AsString;
  edCapitasHasta.Text := sdqConsulta.FieldByName('EE_CAPITASHASTA').AsString;
  edCantidadEstab.Text := sdqConsulta.FieldByName('EE_CANTESTAB').AsString;
  FIDEstimacionEstab := sdqConsulta.FieldByName('EE_ID').AsInteger;
end;

function TfrmManEstimacionEstablecimiento.Validar: Boolean;
begin
  Verificar(IsEmptyString(edCIIU.Text),edCIIU,'Debe Seleccionar un CIIU.');
  Verificar(StrToInt(edCapitasDesde.Text)<= 0,edCapitasDesde,'El valor debe ser mayor a 0.');
  Verificar(StrToInt(edCapitasHasta.Text)<= 0,edCapitasHasta,'El valor debe ser mayor a 0.');
  Verificar(StrToInt(edCantidadEstab.Text)<= 0,edCantidadEstab,'El valor debe ser mayor a 0.');
  Verificar(ExisteSql(
    ' SELECT 1 '+
    '   FROM hys.hee_estimacionestab '+
    '  WHERE ee_ciiu = '+SqlValue(edCIIU.Text)+
    '    AND ( '+SqlValue(edCapitasDesde.Text)+' BETWEEN ee_capitasdesde AND ee_capitashasta '+
    '         OR '+SqlValue(edCapitasHasta.Text)+' BETWEEN ee_capitasdesde AND ee_capitashasta) '+
    '    AND ee_id <> '+SqlValue(FIDEstimacionEstab)+
    '    AND ee_fechabaja IS NULL'),edCIIU,'Ya Existe Cargado el CIIU con la cantidad de capitas.');
  Result := True;
end;

procedure TfrmManEstimacionEstablecimiento.tbCotizacionVisitasClick(
  Sender: TObject);
begin
  inherited;
  mskCUIT.Clear;
  edCantEmpleados.Clear;
  edCantEstab.Clear;
  fraActividad.Clear;
  fraProvincia.Clear;
  fraSectores.Clear;
  edCosto.Clear;
  fraTipoFet.Clear;
  cbLicitacion.Checked := False;
  fpCotizacionVisitas.ShowModal;
end;

procedure TfrmManEstimacionEstablecimiento.btnCalcularClick(
  Sender: TObject);
begin
  Verificar(mskCUIT.Text = '',mskCUIT,'Debe completar el campo CUIT.');
  Verificar(edCantEmpleados.Text = '',edCantEmpleados,'Debe completar la cantidad de Empleados.');
  Verificar(edCantEstab.Text = '', edCantEstab,'Debe completar la cantidad de establecimientos.');
  Verificar(not fraActividad.IsSelected, fraActividad,'Debe completar el CIUU.');
  Verificar(not fraProvincia.IsSelected, fraProvincia,'Debe completar la Provincia.');
  Verificar(not fraTipoFet.IsSelected, fraTipoFet,'Debe completar el tipo.');
  Verificar(not fraSectores.IsSelected, fraSectores,'Debe completar el Sector.');
  SDcotizacionprevencion.ParamByName('CUIT').AsString := mskCUIT.Text;
  SDcotizacionprevencion.ParamByName('idactividad').AsInteger := fraActividad.Value;
  SDcotizacionprevencion.ParamByName('cantempleados').AsInteger := edCantEmpleados.Value;
  SDcotizacionprevencion.ParamByName('cantestab').AsInteger := edCantEstab.Value;
  SDcotizacionprevencion.ParamByName('codprovincia').AsString := fraProvincia.Codigo;
  SDcotizacionprevencion.ParamByName('tipoempresa').AsString := fraTipoFet.Codigo;
  SDcotizacionprevencion.ParamByName('sectorempresa').AsString := fraSectores.Codigo;
  if cbLicitacion.Checked then
    SDcotizacionprevencion.ParamByName('licitacion').AsString := 'S'
  else
    SDcotizacionprevencion.ParamByName('licitacion').AsString := 'N';
  SDcotizacionprevencion.ExecProc;
  if SDcotizacionprevencion.ParamByName('costo').AsInteger >= 0 then
    edCosto.Text := SDcotizacionprevencion.ParamByName('costo').AsString
  else
    MsgBox(SDcotizacionprevencion.ParamByName('msgresultado').AsString);
end;

end.
