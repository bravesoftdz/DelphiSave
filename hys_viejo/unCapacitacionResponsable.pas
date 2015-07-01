unit unCapacitacionResponsable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, JvgAskListBox, ComCtrls, PatternEdit,
  IntEdit, Mask, ToolEdit, DateComboBox, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ToolWin, unDmPrincipal;

type
  TInfoItem = class
  private
    IdItem: Integer;
    IdItemEvaluado: Integer;
    Respuesta: String[1];
    constructor Create(aIdItem: integer; aIdItemEvaluado: integer; aRespuesta: String); overload;
  end;


  TfrmCapacitacionResponsable = class(TfrmCustomGridABM)
    Label34: TLabel;
    Label14: TLabel;
    edFechaCapacitacion: TDateComboBox;
    Label32: TLabel;
    edInstitucion: TEdit;
    Label13: TLabel;
    edProfesionalCap: TEdit;
    Label25: TLabel;
    edHorasCatedra: TIntEdit;
    Panel1: TPanel;
    HeaderControl2: THeaderControl;
    lstItemsCapacitacion: TJvgAskListBox;
    tbInformarFaltanteTraslado: TToolButton;
    sdqCapacitacionItems: TSDQuery;
    procedure FormCreate(Sender: TObject);
    procedure lstItemsCapacitacionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstItemsCapacitacionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbInformarFaltanteTrasladoClick(Sender: TObject);
  private
    FIDInforme :Integer;
    arrObjects: array of TInfoItem;
    procedure setIDInforme(Value : Integer);
    procedure LiberarArray;
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    procedure ValidarItems;
    procedure CargarItems(iIdCodigo: integer);
    procedure GuardarItems(iIdCodigo: integer);
  public
    property IDInforme : Integer read FIDInforme write setIDInforme;
  end;

var
  frmCapacitacionResponsable: TfrmCapacitacionResponsable;

implementation

uses
  CustomDlgs, Strfuncs, unSesion, SqlFuncs, AnsiSql, unComunesFet;

{$R *.dfm}

{ TfrmCustomGridABM1 }

procedure TfrmCapacitacionResponsable.ClearControls;
begin
  inherited;
  edFechaCapacitacion.Clear;
  edInstitucion.Clear;
  edProfesionalCap.Clear;
  edHorasCatedra.Clear;
  CargarItems(-1);
end;

function TfrmCapacitacionResponsable.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('CR_ID').AsInteger;
      Sql.Fields.Add('CR_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('CR_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.AddDate('CR_FECHA', edFechaCapacitacion.Date);
      Sql.Fields.Add('CR_INSTITUCION', edInstitucion.Text);
      Sql.Fields.Add('CR_PROFESIONAL', edProfesionalCap.Text);
      Sql.Fields.Add('CR_HORASCATEDRA', edHorasCatedra.Value);
      Sql.Fields.Add('CR_IDINFORME', IDInforme);

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HCR_CAPACITACIONRESP');
        Sql.Fields.Add('CR_USUALTA', Sesion.UserID );
        Sql.Fields.Add('CR_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('CR_ID').AsInteger;
        Sql.Fields.Add('CR_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('CR_FECHAMODIF', exDateTime );
        Sql.Fields.Add('CR_USUBAJA', exNull );
        Sql.Fields.Add('CR_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('CR_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    GuardarItems(iIdCodigo);
    Result := True;
  except
    on E: Exception do begin
      Result := false;
      ErrorMsg(E, 'Error al guardar Capacitacion Responsable.');
    end;
  end;
end;

procedure TfrmCapacitacionResponsable.LoadControls;
begin
  edFechaCapacitacion.Date := sdqConsulta.FieldByName('CR_FECHA').AsDateTime;
  edInstitucion.Text := sdqConsulta.FieldByName('CR_INSTITUCION').AsString;
  edProfesionalCap.Text := sdqConsulta.FieldByName('CR_PROFESIONAL').AsString;
  edHorasCatedra.Value := sdqConsulta.FieldByName('CR_HORASCATEDRA').AsInteger;
  CargarItems(sdqConsulta.FieldByName('CR_ID').AsInteger);
end;

procedure TfrmCapacitacionResponsable.setIDInforme(Value: Integer);
begin
  FIDInforme := Value;
  sdqConsulta.close;
  sdqConsulta.ParamByName('idinforme').AsInteger := Value;
  sdqConsulta.Open;
end;

function TfrmCapacitacionResponsable.Validar: Boolean;
begin
  Verificar(edFechaCapacitacion.Date=0, edFechaCapacitacion, 'Debe completar la fecha.');
  Verificar(IsEmptyString(edInstitucion.Text), edInstitucion, 'Debe completar la institución de capacitación.');
  Verificar(IsEmptyString(edProfesionalCap.Text), edProfesionalCap, 'Debe completar el profesional de la capacitación.');
  Verificar(edHorasCatedra.Value=0, edHorasCatedra, 'Debe completar la cantidad de horas cátedra.');
  ValidarItems;
  Result := true;
end;

procedure TfrmCapacitacionResponsable.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;
  FieldBaja := 'cr_fechabaja';
  Sql.TableName := 'hys.hcr_capacitacionresp';
  sdqConsulta.ParamByName('idinforme').AsInteger := 0;
  //Otro Bug del componente
  for i:=0 to 100 do
    lstItemsCapacitacion.AddItem(' ', nil);
end;

procedure TfrmCapacitacionResponsable.CargarItems(iIdCodigo: integer);
var
  stritem: String;
begin
  lstItemsCapacitacion.Items.Clear;
  LiberarArray;
  lstItemsCapacitacion.Invalidate;

  sdqCapacitacionItems.Close;
  sdqCapacitacionItems.ParamByName('idcapacitacion').AsInteger := iIdCodigo;
  sdqCapacitacionItems.Open;
  while not sdqCapacitacionItems.Eof do
  begin
    stritem := RPad(sdqCapacitacionItems.fieldbyname('ic_id').AsString, ' ', 20) +
                    sdqCapacitacionItems.fieldbyname('ic_descripcion').AsString;
    lstItemsCapacitacion.AddItem(stritem, nil);
    if sdqCapacitacionItems.fieldbyname('ip_respuesta').AsString = 'S' then
      lstItemsCapacitacion.SetPushedButtonInLine(lstItemsCapacitacion.Count-1, 2)
    else begin
      if sdqCapacitacionItems.fieldbyname('ip_respuesta').AsString = 'N' then
        lstItemsCapacitacion.SetPushedButtonInLine(lstItemsCapacitacion.Count-1, 1);
    end;
    SetLength(arrObjects, length(arrObjects)+1);
    arrObjects[length(arrObjects)-1] := TInfoItem.Create(sdqCapacitacionItems.fieldbyname('ic_id').AsInteger,
                                                         sdqCapacitacionItems.fieldbyname('ip_id').AsInteger,
                                                         sdqCapacitacionItems.fieldbyname('ip_respuesta').AsString);
    sdqCapacitacionItems.Next;
  end;
  lstItemsCapacitacion.Invalidate;
end;

procedure TfrmCapacitacionResponsable.LiberarArray;
var
  i: integer;
begin
  for i:=0 to length(arrObjects)-1 do
    if Assigned(arrObjects[i]) then
      arrObjects[i].Free;
  SetLength(arrObjects, 0);
end;

{ TInfoItem }

constructor TInfoItem.Create(aIdItem, aIdItemEvaluado: integer;
  aRespuesta: String);
begin
  inherited Create;
  IdItem := aIdItem;
  Respuesta := aRespuesta;
  IdItemEvaluado := aIdItemEvaluado;
end;

procedure TfrmCapacitacionResponsable.GuardarItems(iIdCodigo: integer);
var
  i: integer;
  sResultadoSelect: String;
begin
  with TSql.Create do
  try
    if arrObjects[0].IdItemEvaluado = 0 then
      SqlType := stInsert
    else
      SqlType := stUpdate;

    TableName := 'hys.hip_itemcapacitado';

    for i:=0 to length(arrObjects)-1 do
    begin
      if lstItemsCapacitacion.GetPushedButtonInLine(i) = 1 then
        sResultadoSelect := 'N'
      else begin
        if lstItemsCapacitacion.GetPushedButtonInLine(i) = 2 then
          sResultadoSelect := 'S';
      end;

      Fields.Add('ip_idcapacitacion', iIdCodigo);
      Fields.Add('ip_iditemcapacitado', arrObjects[i].IdItem);
      if (SqlType = stInsert) then
      begin
        PrimaryKey.Add('ip_id', GetSecNextVal('hys.seq_hip_itemcapacitado'));
        Fields.Add('ip_respuesta', sResultadoSelect);
        Fields.Add('ip_fechaalta', exDateTime);
        Fields.Add('ip_usualta', Sesion.LoginName);
        EjecutarSqlST(Sql);
      end
      else begin
        if (arrObjects[i].Respuesta <> sResultadoSelect) and (SqlType = stUpdate) then
        begin
          Fields.Add('ip_respuesta', sResultadoSelect);
          PrimaryKey.Add('ip_id', arrObjects[i].IdItemEvaluado);
          Fields.Add('ip_fechamodif', exDateTime);
          Fields.Add('ip_usumodif', Sesion.LoginName);
          EjecutarSqlST(Sql);
        end;
      end;
      Clear;
    end;
  finally
    free;
  end;
end;

procedure TfrmCapacitacionResponsable.ValidarItems;
begin
  Verificar(((lstItemsCapacitacion.CountPushedButtonsInColon(1) + lstItemsCapacitacion.CountPushedButtonsInColon(2))<> lstItemsCapacitacion.Items.Count), lstItemsCapacitacion, 'Existen items sin contestar.');
end;



procedure TfrmCapacitacionResponsable.lstItemsCapacitacionKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  aValue: integer;
begin
  if (Key = 32) then
  begin
    if lstItemsCapacitacion.GetPushedButtonInLine(lstItemsCapacitacion.SelectedItem) =
        lstItemsCapacitacion.Buttons.Count then
      aValue := 0
    else
      aValue := lstItemsCapacitacion.GetPushedButtonInLine(lstItemsCapacitacion.SelectedItem) + 1;

    lstItemsCapacitacion.SetPushedButtonInLine(lstItemsCapacitacion.SelectedItem, aValue);
  end
  else begin
    if (Key in [83, 115]) then
      lstItemsCapacitacion.SetPushedButtonInLine(lstItemsCapacitacion.SelectedItem, 2)
    else begin
      if (Key in [78, 110]) then
        lstItemsCapacitacion.SetPushedButtonInLine(lstItemsCapacitacion.SelectedItem, 1);
    end;
  end;
end;

procedure TfrmCapacitacionResponsable.lstItemsCapacitacionKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 9) then
    lstItemsCapacitacion.SelectedItem := lstItemsCapacitacion.SelectedItem + 1;
end;

procedure TfrmCapacitacionResponsable.tbInformarFaltanteTrasladoClick(
  Sender: TObject);
var
  Cuit : String;
  IdEstableci : Integer;
  NroInforme : Integer;
  tipoInforme : String;
begin
  with GetQuery(
    ' SELECT in_nroinforme, in_cuit, in_idestableci,in_tipoinforme '+
    '   FROM hys.hin_informe '+
    '  WHERE in_id = '+SqlValue(IDInforme)) do
  try
    Cuit := FieldByName('in_cuit').AsString;
    IdEstableci := FieldByName('in_idestableci').AsInteger;
    NroInforme := FieldByName('in_nroinforme').AsInteger;
    if FieldByName('in_tipoinforme').AsString = 'A' then
      tipoInforme := 'Accidentes Mayores'
    else
      tipoInforme := 'Difenilos';
  finally
    Free;
  end;

  DenunciaDatosIncompletos(Cuit,IdEstableci,NroInforme,'Capacitacion Responsable',tipoInforme);
end;

end.

