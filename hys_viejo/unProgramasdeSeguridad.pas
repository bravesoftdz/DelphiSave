unit unProgramasdeSeguridad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, ToolEdit, DateComboBox, Mask, PatternEdit,unPreventorAprobo,
  IntEdit, DBClient, unDmPrincipal;

type
  TfrmProgramasDeSeguridad = class(TfrmCustomGridABM)
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label26: TLabel;
    Label4: TLabel;
    edCantidadTrabajadores: TIntEdit;
    edPeriodicidad: TIntEdit;
    edObservaciones: TMemo;
    edFechaRetiro: TDateComboBox;
    edFechaRecepcion: TDateComboBox;
    edFechaAprobado: TDateComboBox;
    edCantidadVisitas: TIntEdit;
    fraResolucion: TfraCodigoDescripcion;
    DBGrid: TArtDBGrid;
    ToolBar3: TToolBar;
    tbLimpiarProg: TToolButton;
    ToolBar4: TToolBar;
    tbGenerar: TToolButton;
    ToolButton2: TToolButton;
    tbLimpiarVisita: TToolButton;
    ToolButton7: TToolButton;
    tbMaxVisitas: TToolButton;
    ToolButton9: TToolButton;
    tbEliminarFechas: TToolButton;
    ToolBar6: TToolBar;
    btnCantPreventor: TToolButton;
    rgAplicaProg: TRadioGroup;
    edFechaExtension: TDateComboBox;
    edRetiro: TEdit;
    edFechaInicio: TDateComboBox;
    fraAprobo: TfraCodigoDescripcion;
    Label7: TLabel;
    cdsRegistros: TClientDataSet;
    cdsRegistrosFecha: TStringField;
    cdsRegistrosIdVisita: TIntegerField;
    dsConsultaFecha: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarProgClick(Sender: TObject);
    procedure btnCantPreventorClick(Sender: TObject);
    procedure tbGenerarClick(Sender: TObject);
    procedure tbLimpiarVisitaClick(Sender: TObject);
    procedure tbMaxVisitasClick(Sender: TObject);
    procedure tbEliminarFechasClick(Sender: TObject);
  private
    FID : String;
    FEstableci : Integer;
    FCuit : String;
    FTipo : String;
    procedure OnResolucionChange(Sender: TObject);
    { Private declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;

  public
    { Public declarations }
    procedure Load (Cuit : String;Establecimiento : Integer; Tipo : String);
  end;

var
  frmProgramasDeSeguridad: TfrmProgramasDeSeguridad;

implementation

uses unPrincipal, AnsiSql, CustomDlgs, VclExtra, unCustomConsulta, SqlFuncs, DateUtils,
     StrFuncs;

{$R *.dfm}

{ TfrmProgramasDeSeguridad }

procedure TfrmProgramasDeSeguridad.ClearControls;
begin
   edFechaAprobado.Date := 0;
   edCantidadVisitas.Clear;
   fraResolucion.Clear;
   edCantidadTrabajadores.Clear;
   edFechaExtension.Clear;
   edFechaInicio.Clear;
   edFechaRecepcion.Clear;
   edFechaRetiro.Date := 0;
   fraAprobo.Clear;
   edRetiro.Clear;
   edObservaciones.Clear;
   rgAplicaProg.ItemIndex := -1;
end;

function TfrmProgramasDeSeguridad.DoABM: Boolean;

begin
  Result := True;
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
     Sql.Fields.Add( 'PS_FECHABAJA', exDateTime );
     Sql.Fields.Add( 'PS_USUBAJA', frmPrincipal.dbLogin.UserId );
  end else if ModoABM = maModificacion Then
  begin
      Sql.Fields.Add( 'PS_RESOLUCION', fraResolucion.Codigo );
      Sql.Fields.Add( 'PS_FECHAAPROBADO', edFechaAprobado.Date );
      Sql.Fields.Add( 'PS_FECHARETIRO', edFechaRetiro.Date );
      Sql.Fields.Add( 'PS_FECHAINICIO', edFechaInicio.Date );
      Sql.Fields.Add( 'PS_APROBO', fraAprobo.Value );
      Sql.Fields.Add( 'PS_RETIRO', edRetiro.Text );
      Sql.Fields.Add( 'PS_OBSERVACIONES', edObservaciones.Text );
      Sql.Fields.Add( 'PS_CANTVISITAS', edCantidadVisitas.Text );
      Sql.Fields.Add( 'PS_CANTTRABAJADORES', edCantidadTrabajadores.Text );
      Sql.Fields.Add( 'PS_FECHARECEPCION', edFechaRecepcion.Date );
      Sql.Fields.Add( 'PS_FECHAEXTENSION', edFechaExtension.Date );
      Sql.Fields.Add( 'PS_FECHAMODIF', exDateTime );
      Sql.Fields.Add( 'PS_USUMODIF', frmPrincipal.dbLogin.UserId );
      Sql.Fields.Add( 'PS_FECHABAJA', exNull );
      Sql.Fields.Add( 'PS_USUBAJA', exNull );
  end;

  Sql.PrimaryKey.Add('ps_id', FID);
  Sql.SqlType := stUpdate;
  EjecutarSQLST(Sql.Sql);
(*
  try
  if not fraResolucion.IsEmpty and (edFechaRecepcion.Date <> 0) then
  begin
    Try
      EjecutarSqlST(
        ' DELETE hys.hfv_fechasvisitas '+
        '  WHERE fv_idprogramaseguridad = '+Sqlvalue( FID)+
        '    AND fv_estableci = '+Sqlvalue(FEstableci));
          cdsRegistros.First;
          while not cdsRegistros.Eof do
          begin
            EjecutarSqlST(
              ' INSERT INTO hys.hfv_fechasvisitas '+
              '             (fv_id, fv_fecha, fv_idprogramaseguridad, fv_usualta, fv_fechaalta, fv_estableci '+
              '             ) '+
              '      VALUES (hys.seq_hfv_id.NEXTVAL, '+SqlValue(cdsRegistros.Fields[0].AsString)+
              ', '+ SqlValue( FID)+', '+SqlValue(frmPrincipal.dbLogin.UserId)+', SYSDATE ,'+SqlValue(FEstableci)+
              '             )' );
            cdsRegistros.Next;
          end
    Except
    On E: Exception do
      Raise Exception.Create( 'Error al guardar los Programas de Seguridad' + #13 + E.Message );
    end;
  end;
  finally
    cdsRegistros.EnableControls;
  end;
*)  
end;

procedure TfrmProgramasDeSeguridad.FormCreate(Sender: TObject);
begin
  inherited;
  sdqConsulta.ParamByName('cuit').AsString := FCUIT;
  sdqConsulta.ParamByName('estableci').AsInteger := FEstableci;
  FieldBaja := 'PS_FECHABAJA';
  cdsRegistros.Close;
  cdsRegistros.CreateDataSet;
  cdsRegistros.EmptyDataSet;
  with fraAprobo do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  with fraResolucion do
  begin
    TableName   := 'hys.hor_obrasresolucion';
    FieldID     := 'or_id';
    FieldCodigo := 'or_id';
    FieldDesc   := 'or_descripcion';
    Showbajas   := true;
    FieldBaja   := 'or_fechabaja';
    OnChange    := OnResolucionChange;
  end;
  Sql.TableName := 'HYS.HPS_PROGRAMASEGURIDAD';
end;

procedure TfrmProgramasDeSeguridad.LoadControls;
//Var
//  sdqFechaVisita : TSDQuery;
begin
  FID                              := sdqConsulta.FieldByName( 'PS_ID' ).AsString;
  fraResolucion.Codigo             := sdqConsulta.FieldByName( 'PS_RESOLUCION' ).AsString;
  edFechaAprobado.Date             := sdqConsulta.FieldByName( 'PS_FECHAAPROBADO' ).AsDateTime;
  edFechaRetiro.Date               := sdqConsulta.FieldByName( 'PS_FECHARETIRO' ).AsDateTime;
  fraAprobo.Value                  := sdqConsulta.FieldByName( 'PS_APROBO' ).AsInteger;
  edRetiro.Text                    := sdqConsulta.FieldByName( 'PS_RETIRO' ).AsString;
  edObservaciones.Text             := sdqConsulta.FieldByName( 'PS_OBSERVACIONES' ).AsString;
  //edCantidadVisitas.Text         := sdqConsulta.FieldByName( 'PS_CANTVISITAS' ).AsString;
  edCantidadTrabajadores.Text      := sdqConsulta.FieldByName( 'PS_CANTTRABAJADORES' ).AsString;
  edFechaRecepcion.Date            := sdqConsulta.FieldByName( 'PS_FECHARECEPCION' ).AsDateTime;
  edFechaExtension.Date            := sdqConsulta.FieldByName( 'PS_FECHAEXTENSION' ).AsDateTime;
  edFechaInicio.Date               := sdqConsulta.FieldByName( 'PS_FECHAINICIO' ).AsDateTime;

  rgAplicaProg.ItemIndex  := 1;
(*
  sdqFechaVisita := GetQuery(
    ' SELECT fv_fecha, fv_idvisita '+
    '   FROM hys.hfv_fechasvisitas '+
    '  WHERE fv_idprogramaseguridad ='+ SqlValue(FID)+
    '    AND fv_estableci = '+SqlValue(FEstableci) );
  if Assigned(sdqFechaVisita) and sdqFechaVisita.Active and (not sdqFechaVisita.IsEmpty) Then
  begin
    cdsRegistros.EmptyDataSet;
    while not sdqFechaVisita.Eof do
    begin
      cdsRegistros.Append;
      cdsRegistros.FieldByName('Fecha').AsString := sdqFechaVisita.FieldByName('fv_fecha').AsString;
      cdsRegistros.FieldByName('Idvisita').AsInteger := sdqFechaVisita.FieldByName('fv_idvisita').AsInteger;
      cdsRegistros.Post;
      sdqFechaVisita.Next;
    end;
  end;
*)
  OnResolucionChange(nil);
end;

function TfrmProgramasDeSeguridad.Validar: Boolean;
begin
  result := ((edFechaRetiro.IsEmpty and (edRetiro.Text = '')) or
            (not edFechaRetiro.IsEmpty and not (edRetiro.Text = '')))and
            not ((edFechaAprobado.Date <> 0) and fraResolucion.IsEmpty) and
            not (not (edRetiro.Text = '') and fraResolucion.IsEmpty) and
            not ((edObservaciones.Text<>'') and fraResolucion.IsEmpty) and
            not ((edCantidadVisitas.Text<>'') and fraResolucion.IsEmpty)and
            not((edFechaInicio.date= 0)and not edFechaInicio.ReadOnly) and
            (edFechaRecepcion.Date <> 0) and not fraResolucion.IsEmpty;

  if (edFechaExtension.Date <> 0) and (edFechaRecepcion.Date > edFechaExtension.Date) then
  begin
    result := false;
    InvalidMsg(edFechaExtension, 'La fecha de extensión debe ser mayor que la fecha de recepción.');
  end;

  if (edFechaInicio.date = 0) and not (edFechaInicio.ReadOnly) then
    InvalidMsg(edFechaInicio, 'Se debe completar la fecha de inicio del Programa de seguridad.');
    //  if not ((edFechaAprobado.IsEmpty and fraAprobo.IsEmpty) or
    //          (not edFechaAprobado.IsEmpty and not fraAprobo.IsEmpty))then
    //  InvalidMsg(edFechaAprobado, 'Se debe completar la fecha y el usuario que aprobo o dejar ambos vacios.');

    if not ((edFechaRetiro.IsEmpty and (edRetiro.Text = '')) or
              (not edFechaRetiro.IsEmpty and not (edRetiro.Text = '')))then
      InvalidMsg(edFechaRetiro, 'Se debe completar la fecha y el usuario que retiro o dejar ambos vacios.');

    if((edFechaAprobado.Date <> 0) and fraResolucion.IsEmpty)then
      InvalidMsg(fraResolucion, 'No puede ingresar la fecha de aprobado sin estar la Resolución.');

    if(not (edRetiro.Text = '') and fraResolucion.IsEmpty)then
      InvalidMsg(fraResolucion, 'No puede ingresar el retiró sin estar la Resolución.');

    if((edObservaciones.Text<>'') and fraResolucion.IsEmpty)then
      InvalidMsg(fraResolucion, 'No puede ingresar la observación sin estar la Resolución.');

    if((edCantidadVisitas.Text<>'') and fraResolucion.IsEmpty)then
      InvalidMsg(fraResolucion, 'No puede ingresar la cantidad de visitas sin estar la Resolución.');

    if(edFechaRecepcion.Date = 0)then
      InvalidMsg(edFechaRecepcion, 'Debe Ingresar la fecha de Recepción.');
end;


procedure TfrmProgramasDeSeguridad.OnResolucionChange(Sender: TObject);
begin
  if ValorSql(
    ' SELECT or_aplicaestab '+
    '   FROM hys.hor_obrasresolucion '+
    '  WHERE or_id = '+ SqlValue(fraResolucion.Codigo)) = 'S' then
  begin
    rgAplicaProg.Enabled := False;
    vclextra.LockControl(edFechaExtension,true);
    vclextra.LockControl(edFechaInicio,true);
    edFechaExtension.Date := 0;
    edFechaInicio.Date := 0;
    rgAplicaProg.ItemIndex := 1;
  end
  else
  begin
    vclextra.LockControl(edFechaExtension,false);
    vclextra.LockControl(edFechaInicio,false);
    rgAplicaProg.Enabled := True;
    rgAplicaProg.ItemIndex := 0;
  end;
end;


procedure TfrmProgramasDeSeguridad.Load(Cuit: String;
  Establecimiento: Integer; Tipo : String);
begin
  sdqConsulta.ParamByName('cuit').AsString := Cuit;
  sdqConsulta.ParamByName('estableci').AsInteger := Establecimiento;
  FCuit := Cuit;
  FEstableci := Establecimiento;
  FTipo := Tipo;
  tbRefrescarClick(nil);
end;



procedure TfrmProgramasDeSeguridad.tbLimpiarProgClick(Sender: TObject);
begin
  ClearControls;
end;

procedure TfrmProgramasDeSeguridad.btnCantPreventorClick(Sender: TObject);
begin
  with TfrmPreventorAprobo.Create(Self) do
  try
    Visible := false;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmProgramasDeSeguridad.tbGenerarClick(Sender: TObject);
var
  edObraFechaDeclaracion, edObraFechaFin : TDate;
  cantVisitasPosibles, cantVisitas, periodoVisita,
  i, mes, anio : Integer; // Periodo de visitas en meses
  diaaux,mesaux, anioaux : Word;
  fechaPeriodo : TDateTime;
begin
  edObraFechaDeclaracion := ValorSqlDateTime(
      ' SELECT ao_fechainicio '+
      '   FROM art.pao_avisoobra '+
      '  WHERE ao_cuit = '+SqlValue(FCuit)+
      '    AND ao_estableci = '+SqlValue(FEstableci)+
      '    AND ao_tipo = '+SqlValue(FTipo));
  edObraFechaFin := ValorSqlDateTime(
      ' SELECT ao_fechafindeobra '+
      '   FROM art.pao_avisoobra '+
      '  WHERE ao_cuit = '+SqlValue(FCuit)+
      '    AND ao_estableci = '+SqlValue(FEstableci)+
      '    AND ao_tipo = '+SqlValue(FTipo));

  cdsRegistros.EmptyDataSet;

  Verificar(edCantidadVisitas.IsEmpty, edCantidadVisitas,'La cantidad de visitas no puede estar vacia.');
  Verificar(edPeriodicidad.IsEmpty, edPeriodicidad,'La Periodicidad no puede estar vacia.');
  Verificar(StrToInt(edPeriodicidad.Text) = 0,edPeriodicidad,'No puede ser 0 la Perioricidad.');
  Verificar(edObraFechaDeclaracion = 0, edCantidadVisitas,'La Fecha Declarada no puede estar vacia.');
  Verificar(StrToInt(edCantidadVisitas.Text) = 0,edCantidadVisitas,'No puede ser 0 la cantidad de Visitas.');
  mes := MonthOf(edObraFechaDeclaracion);
  anio := YearOf(edObraFechaDeclaracion);
  if (edObraFechaFin = 0) then
  begin
    cantVisitas := StrToInt(edCantidadVisitas.Text);
    periodoVisita := StrToInt(edPeriodicidad.Text);
  end
  else
  begin
    if ((trunc(DaysBetween(edObraFechaDeclaracion,edObraFechaFin)/30)-1) < 0) then
      cantVisitasPosibles := 0
    else
      cantVisitasPosibles := trunc(DaysBetween(edObraFechaDeclaracion,edObraFechaFin)/30)-1;
    if dayof(edObraFechaDeclaracion)< 15 then
      cantVisitasPosibles := cantVisitasPosibles +1;
    if dayof(edObraFechaFin)> 15 then
      cantVisitasPosibles := cantVisitasPosibles +1;
    if cantVisitasPosibles < 1 then
      cantVisitasPosibles := 1;
    Verificar(cantVisitasPosibles < StrToInt(edCantidadVisitas.Text),edCantidadVisitas,'Supera el máximo de visitas posibles.');
    cantVisitas := StrToInt(edCantidadVisitas.Text);
    periodoVisita := StrToInt(edPeriodicidad.Text);

    DecodeDate(edobrafechadeclaracion,anioaux,mesaux,diaaux);
    IncAMonth(anioaux,mesaux,diaaux,(periodoVisita*(cantVisitas-1)));
    fechaPeriodo :=EncodeDate(anioaux,mesaux,diaaux);
    Verificar(fechaperiodo > edObraFechaFin,edPeriodicidad,'Con el periodo y la cantidad seleccionada supera la fecha de fin alguna visita.');
  end;

  if DayOf(edObraFechaDeclaracion)>= 15 then
    mes:= mes + 1;
  for i := 1 to cantVisitas do
  begin
    if i <> 1 then
      mes :=mes + periodoVisita;
    If (mes< 13) then
    begin
      cdsRegistros.Append;
      cdsRegistros.FieldByName('Fecha').AsString := LPad(IntToStr(mes),'0',2)+'/'+IntToStr(anio);
      cdsRegistros.Post;
    end
    else
    begin
      mes := mes -12;
      anio := anio+1;
      cdsRegistros.Append;
      cdsRegistros.FieldByName('Fecha').AsString := IntToStr(mes)+'/'+IntToStr(anio);
      cdsRegistros.Post;
    end;
  end;
end;

procedure TfrmProgramasDeSeguridad.tbLimpiarVisitaClick(Sender: TObject);
begin
  if not cdsRegistros.IsEmpty then
    cdsRegistros.EmptyDataSet;
end;

procedure TfrmProgramasDeSeguridad.tbMaxVisitasClick(Sender: TObject);
var
  edObraFechaDeclaracion, edObraFechaFin : TDate;
  cantVisitasPosibles : Integer;
begin
  edObraFechaDeclaracion := ValorSqlDateTime(
      ' SELECT ao_fechainicio '+
      '   FROM art.pao_avisoobra '+
      '  WHERE ao_cuit = '+SqlValue(FCuit)+
      '    AND ao_estableci = '+SqlValue(FEstableci)+
      '    AND ao_tipo = '+SqlValue(FTipo));
  edObraFechaFin := ValorSqlDateTime(
      ' SELECT ao_fechafindeobra '+
      '   FROM art.pao_avisoobra '+
      '  WHERE ao_cuit = '+SqlValue(FCuit)+
      '    AND ao_estableci = '+SqlValue(FEstableci)+
      '    AND ao_tipo = '+SqlValue(FTipo));

  Verificar(edPeriodicidad.IsEmpty, edPeriodicidad,'La Periodicidad no puede estar vacia.');
  Verificar(StrToInt(edPeriodicidad.Text) = 0,edPeriodicidad,'No puede ser 0 la Perioricidad.');
  if (edObraFechaFin <> 0) then
  begin
    if (MonthsBetween(edObraFechaDeclaracion,edObraFechaFin) < 0) then
      cantVisitasPosibles := 0
    else
      cantVisitasPosibles := trunc(MonthsBetween(edObraFechaDeclaracion,edObraFechaFin)/StrToInt(edPeriodicidad.Text));
    if dayof(edObraFechaDeclaracion)< 15 then
      cantVisitasPosibles := cantVisitasPosibles +1;
    if cantVisitasPosibles < 1 then
      cantVisitasPosibles := 1;
    edCantidadVisitas.Text := IntToStr(cantVisitasPosibles);
    tbLimpiarClick(nil);
  end;
end;

procedure TfrmProgramasDeSeguridad.tbEliminarFechasClick(Sender: TObject);
begin
  cdsRegistros.Delete;
end;

end.
