{-----------------------------------------------------------------------------
 Unidad:    unfrmConsultasEmision
 Autor:     CChiappero
 Fecha:     01-Nov-2005
 Prósito:   Visor Genérico que permite publicar información generada a través de solicitudes.
 Historia:  0.1 - Inicial.
-----------------------------------------------------------------------------}
unit unfrmConsultasEmision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, StdCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unFraCodigoDescripcion, Buttons, FormPanel,
  JvgGroupBox, unFraValorParametro, unArtDBAwareFrame;

type
  TfrmConsultas = class(TfrmCustomConsulta)
    fpObservaciones: TFormPanel;
    mObservaciones: TMemo;
    fpProceso: TFormPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Bevel1: TBevel;
    sb: TStatusBar;
    mObservacionEjecucion: TMemo;
    lblConsulta: TLabel;
    lblEjecucion: TLabel;
    fraConsulta: TfraCodigoDescripcion;
    cboEjecuciones: TComboBox;
    btnObservaciones: TSpeedButton;
    lblObservaciones: TLabel;
    bvObservacion1: TBevel;
    tbSumatoria: TToolButton;
    sdqConsultaExportacion: TSDQuery;
    procedure FormCreate(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure btnObservacionesClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure cboEjecucionesChange(Sender: TObject);
    procedure fpProcesoClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure fraConsultaedCodigoExit(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure cboEjecucionesClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
  private
    { Private declarations }
    FParametros : array of TfraValorParametro;
    procedure CargarCombos;
    procedure MostrarConsulta;
    procedure OnchangeConsultas(Sender: Tobject);
    procedure Correr;
    procedure MostrarSumas;
    procedure EjecutarProceso;
  public
    { Public declarations }
  end;

var
  frmConsultas: TfrmConsultas;

implementation

uses unDmEmision, unDmPrincipal, SqlFuncs, AnsiSql, DbFuncs, strfuncs,
     General, CustomDlgs, unEspera, unUtils;

{$R *.dfm}
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.FormCreate(Sender: TObject);
begin

  with fraConsulta do
  begin
    TableName := 'EMI.ICO_CONSULTA';
    FieldID := 'CO_ID';
    FieldCodigo := 'CO_ID';
    FieldDesc := 'CO_DESCRIPCION';
    ExtraFields := ', CO_MANUAL MANUAL, CO_SUMATORIAS SUMATORIAS, CO_PARAMETROS PARAMETROS ';
    ShowBajas := false;
    OnChange  := OnchangeConsultas;
  end;

  sb.visible := false;
  tbSumatoria.down := false;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.OnchangeConsultas (Sender : Tobject);
begin
  CargarCombos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.CargarCombos;
begin
  sdqConsulta.close;
  if fraConsulta.IsSelected then
  begin
    tbNuevo.Enabled := fraConsulta.sdqDatos.FieldByName('manual').AsString = 'S';
    CargarCombo( cboEjecuciones ,'select cc_id id, to_char(cc_fecha,''DD/MM/YYYY HH24:MI:SS'') ' +
                    '|| '' - '' || cc_observacion || '' - '' || CC_PARAMETROSEJECUTADOS  descripcion ' +
                    ' from emi.icc_corridaconsulta where cc_idconsulta = ' +
                    SqlValue(fraConsulta.Codigo)+' ORDER BY cc_fecha desc ');

    if cboEjecuciones.Items.Count > 0 then cboEjecuciones.itemindex := 0; 

  end else cboEjecuciones.Clear;


  tbEliminar.Enabled := cboEjecuciones.ItemIndex > -1;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.MostrarConsulta;
var
 sSql : string;
 i : integer;
 sf : TSortField;
begin
  if cboEjecuciones.ItemIndex > -1 then
  begin
   sSql := ValorSql('select co_consultavisualizacion from emi.ico_consulta where co_id = '
              + fraConsulta.Codigo);
   if not IsEmptyString(sSql) then
   begin
      sdqConsulta.Close;
      Grid.Columns.Clear;
      sdqConsulta.FieldDefs.Clear;
      sdqConsulta.Fields.Clear;

      SortDialog.SortFields.Clear;
      sdqConsulta.SQL.Text := sSql;
      sdqConsulta.ParamByName('corrida').AsInteger := GetIdComboByIndex(cboEjecuciones);

      for i := 0 to sdqConsulta.FieldCount - 1 do
      begin
        sf := TSortField.Create(SortDialog.SortFields);
        sf.DataField := '"' + sdqConsulta.Fields[i].FieldName + '"';
        sf.FieldIndex := i;
        sf.Title := sdqConsulta.Fields[i].DisplayName;
        sf.Order := otNone;
      end;

      QueryPrint.SetGridColumns(DBGrid);
   end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.tbPropiedadesClick(Sender: TObject);
begin
//  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.btnObservacionesClick(Sender: TObject);
begin
//inherited;
  mObservaciones.Text := ValorSql('select co_observaciones from emi.ico_consulta where co_id = ' + fraConsulta.Codigo, '');
  fpObservaciones.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.tbNuevoClick(Sender: TObject);
begin
  mObservaciones.clear;
  if fraConsulta.IsSelected then
       EjecutarProceso
  else MessageDlg('Debe seleccionar una consulta previamente.', mtConfirmation, [mbOK], 0);

  CargarCombos;

  cboEjecuciones.ItemIndex := cboEjecuciones.Items.Count - 1;
  tbRefrescarClick(self);
end;
{-------------------------------------------------------------------------------}
procedure TFrmConsultas.EjecutarProceso;
var
  sl : TStringList;
  i : integer;
  parametros : TStringList;
begin
  try
    sl := TStringList.Create;
    parametros := TStringList.Create;
    try
      split(fraConsulta.sdqDatos.FieldByName('PARAMETROS').AsString, ',', sl);

      fpProceso.Height := 140 + (28 * sl.Count);
      SetLength(FParametros, sl.Count);
      for i := 0 to sl.Count - 1  do
      begin
        parametros.clear;
        Split(sl.Strings[i], '|', parametros);

        FParametros[i] := TFraValorParametro.Create(self);
        with FParametros[i] do
        begin
          parent := fpProceso;
          top  := 105 + 25 * i;
          left := 10;
          Name := parametros.Strings[1] + inttostr(i);
          TituloParametro := parametros.Strings[0];
          NombreParametro := parametros.Strings[1];
          TipoParametro   := parametros.Strings[2];
        end;
      end;
    finally
      sl.free;
      parametros.free;
    end;

    if fpProceso.ShowModal = mrOk then Correr;
  finally
    for i := Low(FParametros) to High(FParametros) do  FParametros[i].Free;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmConsultas.Correr;
var
  Consulta : string;
  Q : TSDQuery;
  i : integer;
begin
  IniciarEspera;
  try

    Q := TSDQuery.Create(self);
    SetDatabaseToQuery(Q);

    Consulta := UpperCase(ValorSql('select CO_PROCEDIMIENTOCALCULO from emi.ico_consulta where co_id = '
            + fraConsulta.Codigo, ''));
    If (Consulta <> '') then
    begin
      Q.SQL.Text := Consulta;
      Q.Params[0].Value := mObservacionEjecucion.Text;
      for i := 1 to Q.ParamCount - 1 do
      begin
        Q.Params[i].ParamType := ptInput;
        if FParametros[i - 1].TipoParametro = 'D' then
        begin
          Q.Params[i].DataType := ftString;
          Q.Params[i].Value    := FParametros[i - 1].Valor;
        end
        else if FParametros[i - 1].TipoParametro = 'L' then
        begin
          Q.Params[i].DataType := ftFloat;
          Q.Params[i].Value    := FParametros[i - 1].Valor;
        end
        else if FParametros[i - 1].TipoParametro = 'S' then
        begin
          Q.Params[i].DataType := ftString;
          Q.Params[i].Value    := FParametros[i - 1].Valor;
        end
        else if FParametros[i - 1].TipoParametro = 'N' then
        begin
          Q.Params[i].DataType := ftInteger;
          Q.Params[i].Value    := FParametros[i - 1].Valor;
        end
        else Q.Params[i].DataType := ftString;
      end;
      Q.ExecSQL;
    end;
  finally
    CargarCombos;
    DetenerEspera;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.btnAceptarClick(Sender: TObject);
begin

end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.btnCancelarClick(Sender: TObject);
begin
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.close;
  MostrarConsulta;
  inherited;
  MostrarSumas;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.MostrarSumas;
var
 i : integer;
 campos : TStringList;
 sp : TStatusPanel;
 b : TBookMark;
 a : array of real;
 ancho : integer;
begin
  if not sb.visible then exit;

  IniciarEspera;

  sdqConsulta.DisableControls;
  b := sdqConsulta.GetBookmark;
  campos := TStringList.Create;
  sb.Panels.Clear;
  try
    campos.CommaText := fraConsulta.sdqDatos.FieldByName('SUMATORIAS').AsString;

    SetLength(a, Grid.FieldCount);

    sdqConsulta.First;
    while not sdqConsulta.eof do
    begin
      for i := 0 to sdqConsulta.FieldCount - 1 do
      begin
        if campos.IndexOf(sdqConsulta.Fields[i].FieldName) >= 0 then
         a[i] := a[i] + sdqConsulta.Fields[i].AsFloat
        else a[i] := 0;
      end;
      sdqConsulta.next;
    end;

    for i := 0 to sdqConsulta.FieldCount - 1 do
    begin
      sp := sb.Panels.Add;
      sp.Alignment := taRightJustify;
      if campos.IndexOf(sdqConsulta.Fields[i].FieldName) >= 0 then
      begin

        if sb.Canvas.TextWidth(CurrToStr(a[i])) >
           sb.Canvas.TextWidth(sdqConsulta.Fields[i].AsString) then
          ancho := sb.Canvas.TextWidth(CurrToStr(a[i])) + 20
        else
          ancho := sb.Canvas.TextWidth(sdqConsulta.Fields[i].AsString) + 20;

        Grid.Columns.Items[i].Width := ancho;
        sp.Width := ancho + 5;
        sp.Text :=  CurrToStr(a[i]);
      end;
    end;

    sp := sb.Panels.Add;
    sp.Alignment := taRightJustify;

  finally
    campos.free;
    sdqConsulta.GotoBookmark(b);
    sdqConsulta.FreeBookmark(b);
    sdqConsulta.EnableControls;
    DetenerEspera;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.cboEjecucionesChange(Sender: TObject);
begin
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsultas.fpProcesoClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  fpProceso.Height := 140;
end;

procedure TfrmConsultas.tbSumatoriaClick(Sender: TObject);
begin
  inherited;

  sb.visible := tbSumatoria.Down;
  
  if tbSumatoria.Down then
  begin
    MessageDlg('La activación de la sumatoria hara mas lenta '+#13+#10+
               'la visualización de las consultas.', mtInformation, [mbOK], 0);
    tbRefrescar.Click;
  end;

end;

procedure TfrmConsultas.fraConsultaedCodigoExit(Sender: TObject);
begin
  inherited;
  CargarCombos;
end;

procedure TfrmConsultas.tbExportarClick(Sender: TObject);
Var
  AutoCols : Boolean;
  path, name, ext : string;
  i, j : integer;
  sSql : string;
  Part : integer;
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then begin
     sSql := copy(sdqConsulta.Sql.Text, 0, pos('FROM', sdqConsulta.Sql.Text) - 2) + ', ROWNUM nro ' +
             copy(sdqConsulta.Sql.Text, pos('FROM', sdqConsulta.Sql.Text), Length(sdqConsulta.Sql.Text));

     tbExportar.Enabled := False;
     Try
       AutoCols := ExportDialog.Fields.Count = 0;
       try
         if AutoCols Then
           ExportDialog.Fields.Assign( Grid.Columns );

         path := ExtractFilePath( ExportDialog.OutputFile );
         name := ExtractFileName( ExportDialog.OutputFile );
         ext := ExtractFileExt( ExportDialog.OutputFile );

         if not ExportDialog.ShowOptions then exit;
         
         if ExportDialog.Rows > 0 then
         begin
           Part := sdqConsulta.RecordCount div ExportDialog.Rows;
           for i := 0 to (Part + 1) do
           begin
             ExportDialog.OutputFile := path + copy(name, 1, pos(ext,name)) + inttostr(i) + ext;
             sdqConsultaExportacion.Close;
             ExportDialog.DataSet := sdqConsultaExportacion;
             try
                 sdqConsultaExportacion.SQL.Text :=
                    'select * from (' + sSql +
                    ') WHERE (nro >= ' + Inttostr(ExportDialog.Rows * i) +
                    ') and (nro < ' + Inttostr(ExportDialog.Rows * (i + 1)) +  ')'
             finally
                for j := 0 to sdqConsulta.ParamCount - 1 do
                  sdqConsultaExportacion.Params[j].Value := sdqConsulta.Params[j].Value;
                sdqConsultaExportacion.Open;
             end;
             ExportDialog.SaveToFile;
           end;
         end else
         begin
            ExportDialog.DataSet := sdqConsulta;
            ExportDialog.SaveToFile;
         end;
       finally
         if AutoCols Then
            ExportDialog.Fields.Clear ;
       end;
     Finally
       tbExportar.Enabled := True;
     End;
  end;
end;

procedure TfrmConsultas.tbEliminarClick(Sender: TObject);
var
 Id : Integer;
 sSql : String;
begin
//  inherited;
  if cboEjecuciones.ItemIndex > -1 then
  begin
    Id := GetIdComboByIndex(cboEjecuciones);
    if (Id > -1) and (MessageBox(0, '¿Confirma la eliminación de la consulta seleccionada?',
        'Eliminación de la consulta', MB_ICONQUESTION or MB_YESNO) = idYes) then
    begin
       sSql := ValorSql('select co_procedimientoeliminacion from emi.ico_consulta where co_id = '   + fraConsulta.Codigo);
       if not IsEmptyString(sSql) then
       begin
         EjecutarSqlEx(sSql, [Id, Id]);
         CargarCombos;
       end;
    end;
  end;
end;

procedure TfrmConsultas.cboEjecucionesClick(Sender: TObject);
begin
  inherited;
  tbEliminar.Enabled := cboEjecuciones.ItemIndex > -1; 
end;

procedure TfrmConsultas.tbSalirClick(Sender: TObject);
begin
  Close;
end;

end.
