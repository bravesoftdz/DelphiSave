unit unObsReconfirmacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, DBTables, Mask, PatternEdit, DBIncrementalSearch,
  ToolEdit, DateComboBox;

type
  TfrmObsReconf = class(TfrmCustomGridABM)
    Label2: TLabel;
    edFecha: TDateComboBox;
    edObservacion: TRichEdit;
    Panel1: TPanel;
    redObservaciones: TRichEdit;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure btnAceptarClick(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    FIDReconf: Integer;
  end;

var
  frmObsReconf: TfrmObsReconf;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsReconf.ClearControls;
begin
  edFecha.Clear;
  edObservacion.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObsReconf.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('or_id', sdqConsulta.FieldByName('or_id').AsString);
    Sql.Fields.Add('or_usubaja', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('or_fechabaja', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('or_id', GetSecNextVal('hys.seq_hor_id'));
      Sql.Fields.Add('or_usualta', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('or_fechaalta', exDateTime);
      Sql.Fields.Add('or_idreconf', FIDReconf);
    end
    else
    begin
      Sql.PrimaryKey.Add('or_id', Trim(sdqConsulta.FieldByName('or_id').AsString));
      Sql.Fields.Add('or_usumodif', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('or_fechamodif', exDateTime);
      Sql.Fields.Add('or_usubaja', exNull);
      Sql.Fields.Add('or_fechabaja', exNull);
    end;

    Sql.Fields.Add('or_fecha', edFecha.Date);
    Sql.Fields.Add('or_observacion', edObservacion.Text);
  end;
  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsReconf.LoadControls;
begin
  edFecha.Date := sdqConsulta.FieldByName('or_fecha').AsDateTime;
  edObservacion.Lines.Clear;
  edObservacion.Lines.Text := AdjustLineBreaks (sdqConsulta.FieldByName('or_observacion').AsString);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObsReconf.Validar: Boolean;
begin
  Result := VerificarMultiple (['Grabar datos',
                                edFecha,
                                not edFecha.IsEmpty,
                                'Debe indicar la fecha de la observación',

                                edObservacion,
                                not IsEmptyString (Trim(edObservacion.Lines.Text)),
                                'Debe ingresar texto de la observación']);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsReconf.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hor_obsreconfirmacion';
  FieldBaja := 'or_fechabaja';
  CheckPK := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsReconf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Inherited
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsReconf.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.Close;
  sdqConsulta.ParamByname('pidreconf').Value := FIDReconf;
  sdqConsulta.Open;

  inherited
end;

procedure TfrmObsReconf.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  redObservaciones.Lines.Clear;
  redObservaciones.Lines.Text := AdjustLineBreaks (sdqConsulta.FieldByName('or_observacion').AsString)
end;

procedure TfrmObsReconf.btnAceptarClick(Sender: TObject);
begin
  inherited;
  sdqConsultaAfterScroll(sdqConsulta);
end;

end.
