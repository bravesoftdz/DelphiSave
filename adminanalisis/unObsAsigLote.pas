unit unObsAsigLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, DBTables, Mask, PatternEdit, DBIncrementalSearch,
  ToolEdit, DateComboBox;

type
  TfrmObsAsigLote = class(TfrmCustomGridABM)
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
    FCUIT: String;
    FEstableci: Integer;
    FTipoObs: String;
  end;

var
  frmObsAsigLote: TfrmObsAsigLote;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsAsigLote.ClearControls;
begin
  edFecha.Clear;
  edObservacion.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObsAsigLote.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('og_id', sdqConsulta.FieldByName('og_id').AsString);
    Sql.Fields.Add('og_usubaja', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('og_fechabaja', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('og_id', GetSecNextVal('hys.seq_hog_id'));
      Sql.Fields.Add('og_usualta', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('og_fechaalta', exDateTime);
      Sql.Fields.Add('og_cuit', FCUIT);
      Sql.Fields.Add('og_estableci', FEstableci);
    end
    else
    begin
      Sql.PrimaryKey.Add('og_id', Trim(sdqConsulta.FieldByName('og_id').AsString));
      Sql.Fields.Add('og_usumodif', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('og_fechamodif', exDateTime);
      Sql.Fields.Add('og_usubaja', exNull);
      Sql.Fields.Add('og_fechabaja', exNull);
    end;

    Sql.Fields.Add('og_fecha', edFecha.Date);
    Sql.Fields.Add('og_observacion', Trim(edObservacion.Lines.Text));
    Sql.Fields.Add('og_tipoobs', Trim(FTipoObs));
  end;
  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsAsigLote.LoadControls;
begin
  edFecha.Date := sdqConsulta.FieldByName('og_fecha').AsDateTime;
  edObservacion.Lines.Clear;
  edObservacion.Lines.Text := AdjustLineBreaks (sdqConsulta.FieldByName('og_observacion').AsString);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObsAsigLote.Validar: Boolean;
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
procedure TfrmObsAsigLote.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hog_observacionesasiglote';
  FieldBaja := 'og_fechabaja';
  CheckPK := True;
  FTipoObs:= 'A'
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsAsigLote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Inherited
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObsAsigLote.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.Close;
  sdqConsulta.ParamByname('pcuit').Value := FCUIT;
  sdqConsulta.ParamByname('pestableci').Value := FEstableci;
  sdqConsulta.ParamByname('ptipoobs').Value := FTipoObs;
  sdqConsulta.Open;

  inherited
end;

procedure TfrmObsAsigLote.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  redObservaciones.Lines.Clear;
  redObservaciones.Lines.Text := AdjustLineBreaks (sdqConsulta.FieldByName('og_observacion').AsString)
end;

procedure TfrmObsAsigLote.btnAceptarClick(Sender: TObject);
begin
  inherited;
  sdqConsultaAfterScroll(sdqConsulta);
end;

end.
