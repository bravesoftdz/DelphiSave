unit unManFrecuenciaVisita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, Mask, PatternEdit, IntEdit;

type
  TfrmManFrecuenciaVisita = class(TfrmCustomGridABM)
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    edNroEstab: TIntEdit;
    Label2: TLabel;
    edCantVisitas: TIntEdit;
    Label3: TLabel;
    cbTodosLosEstablecimientos: TCheckBox;
    ShortCutControl1: TShortCutControl;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbTodosLosEstablecimientosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmManFrecuenciaVisita: TfrmManFrecuenciaVisita;

implementation

{$R *.dfm}

{ TfrmManFrecuenciaVisita }

uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs, Math, AnsiSql,
  unCustomConsulta;

procedure TfrmManFrecuenciaVisita.ClearControls;
begin
  inherited;
  fraEmpresa.Clear;
  edNroEstab.Clear;
  edCantVisitas.Clear;
  cbTodosLosEstablecimientos.Checked := False;
end;

function TfrmManFrecuenciaVisita.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('FV_ID').AsInteger;
      Sql.Fields.Add('FV_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('FV_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('FV_IDEMPRESA', fraEmpresa.ID);
      Sql.Fields.Add('FV_ESTABLECI', edNroEstab.Text);
      Sql.Fields.Add('FV_CANTVISITAS', edCantVisitas.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('hys.SEQ_HFV_FRECUENCIAVISITA_ID');
        Sql.Fields.Add('FV_USUALTA', Sesion.UserID );
        Sql.Fields.Add('FV_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('FV_ID').AsInteger;
        Sql.Fields.Add('FV_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('FV_FECHAMODIF', exDateTime );
        Sql.Fields.Add('FV_USUBAJA', exNull );
        Sql.Fields.Add('FV_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('FV_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar.');
    end;
  end;
end;

procedure TfrmManFrecuenciaVisita.LoadControls;
begin
  inherited;
  ClearControls;
  fraEmpresa.ID := sdqConsulta.FieldByName('FV_IDEMPRESA').AsInteger;
  edNroEstab.Text := sdqConsulta.FieldByName('FV_ESTABLECI').AsString;
  edCantVisitas.Text := sdqConsulta.FieldByName('FV_CANTVISITAS').AsString;
  cbTodosLosEstablecimientos.Checked := sdqConsulta.FieldByName('FV_ESTABLECI').IsNull;
  cbTodosLosEstablecimientosClick(nil);
end;

function TfrmManFrecuenciaVisita.Validar: Boolean;
var
  sWhere : String;
begin
  Verificar(not fraEmpresa.IsSelected, fraEmpresa,'Debe seleccionar una empresa.');
  Verificar(edCantVisitas.Text = '', edCantVisitas, 'Debe indicar la cantidad de visitas.');
  If ModoABM = maModificacion then
    sWhere := ' AND FV_ID <> '+SqlValue(sdqConsulta.FieldByName('FV_ID').AsInteger)
  else
    sWhere := '';
  if edNroEstab.Text = '' then
  begin
    Verificar(ExisteSql('SELECT 1 FROM hys.hfv_frecuenciavisita '+
                        ' WHERE fv_idempresa = '+SqlValue(fraEmpresa.ID)+
                        '   AND fv_fechabaja IS NULL '+sWhere),fraEmpresa,'Ya existe una frecuencia para esta empresa.');
  end
  else
  begin
    Verificar(ExisteSql('SELECT 1 FROM hys.hfv_frecuenciavisita '+
                        ' WHERE fv_idempresa = '+SqlValue(fraEmpresa.ID)+
                        '   AND FV_ESTABLECI IS NULL '+
                        '   AND fv_fechabaja IS NULL '+sWhere),fraEmpresa,'Ya existe una frecuencia para esta empresa.');
    Verificar(ExisteSql('SELECT 1 FROM hys.hfv_frecuenciavisita '+
                        ' WHERE fv_idempresa = '+SqlValue(fraEmpresa.ID)+
                        '   AND FV_ESTABLECI = '+SqlValue(edNroEstab.Text)+
                        '   AND fv_fechabaja IS NULL '+sWhere),fraEmpresa,'Ya existe una frecuencia para esta empresa, estab.');

  end;
  Verificar((not cbTodosLosEstablecimientos.Checked) and (edNroEstab.Text = ''),edNroEstab,'Debe ingresar el número del establecimiento.');
  Result := True;
end;

procedure TfrmManFrecuenciaVisita.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'FV_FECHABAJA';
  Sql.TableName := 'HYS.hfv_frecuenciavisita';
  fraEmpresa.ExtraCondition := '     AND co_contrato = '+
                               ' (SELECT MAX (b.co_contrato) '+
                               '    FROM aco_contrato b '+
                               '   WHERE b.co_idempresa = em_id '+
                               '     AND NOT EXISTS (SELECT 1 '+
                               '    FROM art.abc_bajadecontrato '+
                               '   WHERE b.co_contrato = bc_contrato)) ';
end;

procedure TfrmManFrecuenciaVisita.cbTodosLosEstablecimientosClick(
  Sender: TObject);
begin
  vclExtra.LockControls([edNroEstab],cbTodosLosEstablecimientos.Checked);
  if cbTodosLosEstablecimientos.Checked then
    edNroEstab.Clear;
end;

end.
