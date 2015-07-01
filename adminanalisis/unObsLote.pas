unit unObsLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, DBTables, Mask, PatternEdit, DBIncrementalSearch,
  ToolEdit, DateComboBox;

type
  TfrmObsLote = class(TfrmCustomGridABM)
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
    FIDLote: Integer;
  end;

var
  frmObsLote: TfrmObsLote;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsLote.ClearControls;
begin
  edFecha.Clear;
  edObservacion.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObsLote.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('ol_id', sdqConsulta.FieldByName('ol_id').AsString);
    Sql.Fields.Add('ol_usubaja', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('ol_fechabaja', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('ol_id', GetSecNextVal('hys.seq_hol_id'));
      Sql.Fields.Add('ol_usualta', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('ol_fechaalta', exDateTime);
      Sql.Fields.Add('ol_idlote', FIDLote);
    end
    else
    begin
      Sql.PrimaryKey.Add('ol_id', Trim(sdqConsulta.FieldByName('ol_id').AsString));
      Sql.Fields.Add('ol_usumodif', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('ol_fechamodif', exDateTime);
      Sql.Fields.Add('ol_usubaja', exNull);
      Sql.Fields.Add('ol_fechabaja', exNull);
    end;

    Sql.Fields.Add('ol_fecha', edFecha.Date);
    Sql.Fields.Add('ol_observacion', edObservacion.Text);
  end;
  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsLote.LoadControls;
begin
  edFecha.Date := sdqConsulta.FieldByName('ol_fecha').AsDateTime;
  edObservacion.Lines.Clear;
  edObservacion.Lines.Text := AdjustLineBreaks (sdqConsulta.FieldByName('ol_observacion').AsString);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObsLote.Validar: Boolean;
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
procedure TfrmObsLote.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hol_observacioneslote';
  FieldBaja := 'ol_fechabaja';
  CheckPK := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsLote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Inherited
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsLote.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.Close;
  sdqConsulta.ParamByname('pidlote').Value := FIDLote;
  sdqConsulta.Open;

  inherited
end;

procedure TfrmObsLote.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  redObservaciones.Lines.Clear;
  redObservaciones.Lines.Text := AdjustLineBreaks (sdqConsulta.FieldByName('ol_observacion').AsString)
end;

procedure TfrmObsLote.btnAceptarClick(Sender: TObject);
begin
  inherited;
  sdqConsultaAfterScroll(sdqConsulta);
end;

end.
