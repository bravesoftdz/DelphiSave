unit unObsSubLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, DBTables, Mask, PatternEdit, DBIncrementalSearch,
  ToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmObsSubLote = class(TfrmCustomGridABM)
    Label2: TLabel;
    edFecha: TDateComboBox;
    edObservacion: TRichEdit;
    Panel1: TPanel;
    redObservaciones: TRichEdit;
    Panel2: TPanel;
    Label1: TLabel;
    fraObservacion: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure btnAceptarClick(Sender: TObject);
  private
    FCargoObs: boolean;
    FCabecera: String;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    FIDLote: Integer;
    FIDEstableci: Integer;
    property CargoObs: boolean read FCargoObs;
    property Cabecera: String read FCabecera write FCabecera;
  end;

var
  frmObsSubLote: TfrmObsSubLote;

implementation

uses
  VCLExtra, unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsSubLote.ClearControls;
begin
  edFecha.Clear;
  fraObservacion.Clear;
  edObservacion.Clear;
  FCargoObs := false;
  fraObservacion.ExtraCondition := ' AND to_tipo = ''M'' ';
  VCLExtra.LockControls([edFecha,edObservacion,fraObservacion],false);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObsSubLote.DoABM: Boolean;
var
  idCodigo : Integer;
  observacionAux : TStrings;
begin
  observacionAux := TStringList.Create;
  observacionAux.Text := '';
  try
    BeginTrans(True);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      idCodigo := sdqConsulta.FieldByName('os_id').AsInteger;
      Sql.PrimaryKey.Add('os_id', idCodigo );
      Sql.Fields.Add('os_usubaja', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('os_fechabaja', exDateTime);
      Sql.SqlType := stUpdate;
    end else
    begin
      if ModoABM = maAlta Then
      begin
        idCodigo := GetSecNextVal('hys.seq_hos_id');
        Sql.PrimaryKey.Add('os_id', idCodigo);
        Sql.Fields.Add('os_usualta', frmPrincipal.DBLogin.UserID);
        Sql.Fields.Add('os_fechaalta', exDateTime);
        Sql.Fields.Add('os_idlote', FIDLote);
        Sql.Fields.Add('os_idestableci', FIDEstableci);
      end
      else
      begin
        idCodigo := sdqConsulta.FieldByName('os_id').AsInteger;
        Sql.PrimaryKey.Add('os_id', idCodigo);
        Sql.Fields.Add('os_usumodif', frmPrincipal.DBLogin.UserID);
        Sql.Fields.Add('os_fechamodif', exDateTime);
        Sql.Fields.Add('os_usubaja', exNull);
        Sql.Fields.Add('os_fechabaja', exNull);
      end;
      Sql.Fields.Add('os_idtipoobservacion', fraObservacion.Codigo);
      Sql.Fields.Add('os_fecha', edFecha.Date);
      //Sql.Fields.Add('os_observacion', Cabecera + edObservacion.Text);
    end;

    EjecutarSQLST(Sql.Sql);
    observacionAux.Add(Cabecera + edObservacion.Text);
    SaveBlob('SELECT os_observacion ' +
             '  FROM hys.hos_observacionessublote ' +
               ' WHERE os_id = ' + SqlValue(idCodigo),
               'UPDATE hys.hos_observacionessublote' +
               '   SET os_observacion = :os_observacion ' +
               ' WHERE os_id = ' + SqlValue(idCodigo),
               'os_observacion', observacionAux);

    CommitTrans(True);
    Result := true;
    observacionAux.Free;
  except
    on E: Exception do begin
      ErrorMsg( E );                                  // Muestra el mensaje de error.
      Rollback(True);
      Result := False;
      observacionAux.Free;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsSubLote.LoadControls;
begin
  if sdqConsulta.FieldByName('to_tipo').AsString = 'A' then
  begin
    VCLExtra.LockControls([edFecha,edObservacion,fraObservacion],true);
    fraObservacion.ExtraCondition := '';
  end
  else
  begin
    VCLExtra.LockControls([edFecha,edObservacion,fraObservacion],false);
    fraObservacion.ExtraCondition := ' AND to_tipo = ''M'' ';
  end;
  edFecha.Date := sdqConsulta.FieldByName('os_fecha').AsDateTime;
  fraObservacion.Codigo := sdqConsulta.FieldByName('os_idtipoobservacion').AsString;
  edObservacion.Lines.Clear;
  edObservacion.Lines.Text := AdjustLineBreaks (sdqConsulta.FieldByName('os_observacion').AsString);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObsSubLote.Validar: Boolean;
begin
  Result := VerificarMultiple (['Grabar datos',
                                edFecha,
                                not edFecha.IsEmpty,
                                'Debe indicar la fecha de la observación',

                                edObservacion,
                                not IsEmptyString (Trim(edObservacion.Lines.Text)),
                                'Debe ingresar texto de la observación']);
  Verificar(fraObservacion.IsEmpty, fraObservacion, 'Debe seleccionar una Observación.');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsSubLote.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hos_observacionessublote';
  FieldBaja := 'os_fechabaja';
  with fraObservacion do
  begin
    TableName := 'hys.hto_tipoobservacionsublote';
    FieldId := 'to_id';
    FieldCodigo := 'to_id';
    FieldDesc := 'to_descripcion';
    FieldBaja := 'to_fechabaja';
    ShowBajas := true;
  end;
  CheckPK := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsSubLote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Inherited
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsSubLote.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.Close;
  sdqConsulta.ParamByname('pidlote').Value := FIDLote;
  sdqConsulta.ParamByname('pidestableci').Value := FIDEstableci;
  sdqConsulta.Open;

  inherited
end;

procedure TfrmObsSubLote.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  redObservaciones.Lines.Clear;
  redObservaciones.Lines.Text := AdjustLineBreaks (sdqConsulta.FieldByName('os_observacion').AsString)
end;

procedure TfrmObsSubLote.btnAceptarClick(Sender: TObject);
begin
  inherited;
  FCargoObs := true;
  sdqConsultaAfterScroll(sdqConsulta);
end;

end.
