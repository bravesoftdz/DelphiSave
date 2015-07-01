unit unTraslados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtDbFrame,
  unfraEstablecimientoDomic, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Buttons, Mask, ToolEdit, DateComboBox, CurrEdit;

type
  TfrmTraslados = class(TfrmCustomGridABM)
    Label1: TLabel;
    edFechaTraslado: TDateComboBox;
    rgTipoMovimiento: TRadioGroup;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    fraSectorOrigen: TfraCodigoDescripcion;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    fraEstablecimientoDestino: TfraEstablecimientoDomic;
    Edit1: TEdit;
    Edit2: TEdit;
    fraSectorDestino: TfraCodigoDescripcion;
    q: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton3: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    edFechaAutorizacion: TDateComboBox;
    fraOrganismo: TfraCodigoDescripcion;
    edNumeroExpediente: TEdit;
    edResolucion: TEdit;
    lbCantTrasladada: TLabel;
    edCantidadTrasladada: TRxCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    FIDInforme :Integer;
    FCUIT : STRING;
    procedure setIDInforme(Value : Integer);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
    property IDInforme : Integer read FIDInforme write setIDInforme;
    property CUIT : String read FCUIT write FCUIT;
  end;

var
  frmTraslados: TfrmTraslados;

implementation

uses unSesion, sqlFuncs, unDmPrincipal, CustomDlgs, Strfuncs,
  unCustomConsulta, unManSectores, unManOrganismo, General, ansiSql;

{$R *.dfm}

procedure TfrmTraslados.ClearControls;
begin
  edFechaTraslado.Clear;
  edCantidadTrasladada.Clear;
  rgTipoMovimiento.ItemIndex := -1;
  fraSectorOrigen.Clear;
  fraEstablecimientoDestino.Clear;
  fraSectorDestino.Clear;
  edFechaAutorizacion.Clear;
  fraOrganismo.Clear;
  edNumeroExpediente.Clear;
  edResolucion.Clear;
  fraEstablecimientoDestino.CUIT := CUIT;
end;

function TfrmTraslados.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('TR_ID').AsInteger;
      Sql.Fields.Add('TR_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('TR_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      if rgTipoMovimiento.ItemIndex = 0 then
        Sql.Fields.Add('TR_TIPOMOVIMIENTO', 'T')
      else if rgTipoMovimiento.ItemIndex = 1 then
        Sql.Fields.Add('TR_TIPOMOVIMIENTO', 'D');
      Sql.Fields.Add('TR_SECTOR', fraSectorOrigen.Codigo);
      Sql.Fields.Add('TR_IDESTABLECI', fraEstablecimientoDestino.IdEstablecimiento);
      Sql.Fields.Add('TR_SECTORDESTINO', fraSectorDestino.Codigo);
      Sql.Fields.Add('TR_FECHAAUTORIZA', edFechaAutorizacion.Text);
      Sql.Fields.Add('TR_ORGANISMO', fraOrganismo.Codigo);
      Sql.Fields.Add('TR_RESOLUCION', edResolucion.Text);
      Sql.Fields.Add('TR_NROEXP', edNumeroExpediente.Text);
      Sql.Fields.Add('TR_FECHATRASLADO', edFechaTraslado.Date);
      Sql.Fields.Add('TR_CANTTRASLADADA', edCantidadTrasladada.Text);
      Sql.Fields.Add('TR_IDINFORME', IDInforme);

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HTR_TRASLADO_ID');
        Sql.Fields.Add('TR_USUALTA', Sesion.UserID );
        Sql.Fields.Add('TR_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('TR_ID').AsInteger;
        Sql.Fields.Add('TR_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('TR_FECHAMODIF', exDateTime );
        Sql.Fields.Add('TR_USUBAJA', exNull );
        Sql.Fields.Add('TR_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('TR_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       ErrorMsg(E, 'Error al guardar Traslados.');
    end;
  end;
end;

procedure TfrmTraslados.FormCreate;
begin
  inherited;
  FieldBaja := 'TR_FECHABAJA';
  Sql.TableName := ' HYS.HTR_TRASLADOS';
  sdqConsulta.ParamByName('IDInforme').AsInteger := 0;
  fraEstablecimientoDestino.ShowBajas := True;
  with fraSectorOrigen do
  begin
    TableName      := 'hys.pce_cansector';
    FieldID        := 'ce_id';
    FieldCodigo    := 'ce_id';
    FieldDesc      := 'ce_descripcion';
    FieldBaja      := 'ce_fechabaja';
    ExtraCondition := ' AND EXISTS (select 1 from HYS.HSS_SUSTANCIASECTOR '+
                      ' where SS_IDINFORME = '+sqlvalue(IDInforme)+
                      '  and SS_SECTOR = ce_id)';
    IDType         := ctInteger;
  end;
    with fraOrganismo do
  begin
    TableName      := 'hys.hmo_manorganismo';
    FieldID        := 'MO_ID';
    FieldCodigo    := 'MO_ID';
    FieldDesc      := 'MO_DESCRIPCION';
    FieldBaja      := 'MO_FECHABAJA';
    IDType         := ctInteger;
  end;
  with fraSectorDestino do
  begin
    TableName      := 'hys.pce_cansector';
    FieldID        := 'ce_id';
    FieldCodigo    := 'ce_id';
    FieldDesc      := 'ce_descripcion';
    FieldBaja      := 'ce_fechabaja';
    ExtraCondition := ' AND EXISTS (select 1 from HYS.HSS_SUSTANCIASECTOR '+
                      ' where SS_IDINFORME = '+sqlvalue(IDInforme)+
                      '  and SS_SECTOR = ce_id)';
    IDType         := ctInteger;
  end;
end;

procedure TfrmTraslados.LoadControls;
begin
  inherited;
  ClearControls;
  edFechaTraslado.Date := sdqConsulta.FieldByName('TR_FECHATRASLADO').AsDateTime;
  edCantidadTrasladada.Text := sdqConsulta.FieldByName('TR_CANTTRASLADADA').AsString;
  if sdqConsulta.FieldByName('TR_TIPOMOVIMIENTO').AsString = 'T' then
    rgTipoMovimiento.ItemIndex := 0
  else if sdqConsulta.FieldByName('TR_TIPOMOVIMIENTO').AsString = 'D' then
    rgTipoMovimiento.ItemIndex := 1;
  fraSectorOrigen.Codigo := sdqConsulta.FieldByName('TR_SECTOR').AsString;
  fraEstablecimientoDestino.Cargar(CUIT,
              ValorSqlInteger('SELECT es_nroestableci '+
                              '  FROM afi.aes_establecimiento '+
                              ' WHERE es_id = '+SqlValue(sdqConsulta.FieldByName('TR_IDESTABLECI').AsInteger)));
  fraSectorDestino.Codigo := sdqConsulta.FieldByName('TR_SECTORDESTINO').AsString;
  edFechaAutorizacion.Text := sdqConsulta.FieldByName('TR_FECHAAUTORIZA').AsString;
  fraOrganismo.Codigo := sdqConsulta.FieldByName('TR_ORGANISMO').AsString;
  edNumeroExpediente.Text := sdqConsulta.FieldByName('TR_NROEXP').AsString;
  edResolucion.Text := sdqConsulta.FieldByName('TR_RESOLUCION').AsString;
end;

procedure TfrmTraslados.setIDInforme(Value: Integer);
begin
  FIDInforme := Value;
  sdqConsulta.close;
  sdqConsulta.ParamByName('IDINFORME').AsInteger := Value;
  sdqConsulta.Open;
  fraSectorOrigen.ExtraCondition := ' AND EXISTS (select 1 from HYS.HSS_SUSTANCIASECTOR '+
                    ' where SS_IDINFORME = '+sqlvalue(IDInforme)+
                    '  and SS_SECTOR = ce_id)';
  fraSectorDestino.ExtraCondition := ' AND EXISTS (select 1 from HYS.HSS_SUSTANCIASECTOR '+
                    ' where SS_IDINFORME = '+sqlvalue(IDInforme)+
                    '  and SS_SECTOR = ce_id)';
end;

function TfrmTraslados.Validar : Boolean;
begin
  Result := True;
  Verificar(edFechaTraslado.Date = 0 ,edFechaTraslado, 'Debe ingresar fecha de traslado.');
  Verificar(IsEmptyString(edCantidadTrasladada.Text),edCantidadTrasladada, 'Debe ingresar la cantidad.');
  Verificar(rgTipoMovimiento.ItemIndex = -1 ,rgTipoMovimiento, 'Debe seleccionar tipo de movimiento.');
  Verificar(not fraSectorOrigen.IsSelected, fraSectorOrigen,'Debe seleccionar Sector Origen.');
  if rgTipoMovimiento.ItemIndex = 1 then
  begin
    Verificar(not fraEstablecimientoDestino.IsSelected, fraEstablecimientoDestino,'Debe seleccionar Establecimiento.');
    Verificar(not fraSectorDestino.IsSelected,fraSectorDestino, 'Debe seleccionar el sector destino.');
    Verificar(edFechaAutorizacion.Date = 0, edFechaAutorizacion, 'Debe completar la fecha de autorización.');
    Verificar(not fraOrganismo.IsSelected,fraOrganismo, 'Debe Ingresar el organismo.');
    Verificar( IsEmptyString(edNumeroExpediente.Text),edNumeroExpediente, 'Debe completar Nro. de Expediente.');
    Verificar( IsEmptyString(edResolucion.Text),edResolucion, 'Debe completar la resolución.');
  end;
end;

procedure TfrmTraslados.SpeedButton1Click(Sender: TObject);
begin
  Abrir(TfrmManSectores, frmManSectores, tmvModal, nil);
end;

procedure TfrmTraslados.SpeedButton2Click(Sender: TObject);
begin
  Abrir(TfrmManSectores, frmManSectores, tmvModal, nil);
end;

procedure TfrmTraslados.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  abrir(TfrmManOrganismo, frmManOrganismo, tmvModal, nil);
end;

end.
