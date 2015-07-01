unit unManCTS_TEXTOSMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, JvExStdCtrls, JvCombobox, DBCtrls;

type
  TfrmManCTS_TEXTOSMS = class(TfrmCustomGridABM)
    fraFormatoTelegrama: TfraCodDesc;
    Label1: TLabel;
    fraTS_IDFORMATOTELEGRAMA: TfraCodDesc;
    Label2: TLabel;
    Label3: TLabel;
    edDescripcion: TEdit;
    Label4: TLabel;
    edTexto: TMemo;
    sdqConsultaTS_ID: TFloatField;
    sdqConsultaTS_DESCRIPCION: TStringField;
    sdqConsultaTS_TEXTO: TStringField;
    sdqConsultaTS_MODULO: TStringField;
    sdqConsultaTS_USUALTA: TStringField;
    sdqConsultaTS_FECHAALTA: TDateTimeField;
    sdqConsultaTS_USUMODIF: TStringField;
    sdqConsultaTS_FECHAMODIF: TDateTimeField;
    sdqConsultaTS_USUBAJA: TStringField;
    sdqConsultaTS_FECHABAJA: TDateTimeField;
    sdqConsultaTS_IDFORMATOTELEGRAMA: TFloatField;
    Label5: TLabel;
    fraModulo: TfraCodDesc;
    sdqConsultaMODULO: TStringField;
    Label6: TLabel;
    fraTS_MODULO: TfraCodDesc;
    edTextoConsulta: TDBMemo;
    lbCaracteres: TLabel;
    sdqConsultaLARGO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure fraFormatoTelegramaPropiedadesChange(Sender: TObject);
    procedure edTextoChange(Sender: TObject);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure ClearData; override;    
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManCTS_TEXTOSMS: TfrmManCTS_TEXTOSMS;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs, unDmPrincipal,
  Strfuncs;

{$R *.dfm}

procedure TfrmManCTS_TEXTOSMS.ClearControls;
begin
  inherited;
  ClearComponentData(fpAbm);
  edTextoChange(nil);
  VCLExtra.LockControls([fraModulo, fraFormatoTelegrama], False);
  {$IFDEF RED_PRES}
  fraModulo.Code := 'TE';
  VCLExtra.LockControls([fraModulo], True);
  {$ENDIF}
end;

procedure TfrmManCTS_TEXTOSMS.ClearData;
begin
  inherited;
  ClearComponentData(pnlFiltros);
end;

function TfrmManCTS_TEXTOSMS.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('TS_ID', sdqConsulta.FieldByName('TS_ID').AsInteger);
    Sql.Fields.Add('TS_FECHABAJA', exDate);
    Sql.Fields.Add('TS_USUBAJA', Sesion.UserID);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddInteger('TS_ID', ValorSQLInteger('SELECT NVL(MAX(TS_ID), 0) FROM COMUNES.CTS_TEXTOSMS') + 1);
      Sql.Fields.Add('TS_FECHAALTA', exDate);
      Sql.Fields.Add('TS_USUALTA', Sesion.UserID);
      Sql.SqlType := stInsert;
    end else
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('TS_ID', sdqConsulta.FieldByName('TS_ID').AsInteger);
      Sql.Fields.Add('TS_FECHAMODIF', exDate);
      Sql.Fields.Add('TS_USUMODIF', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('TS_MODULO', fraModulo.Codigo);    
    Sql.Fields.Add('TS_TEXTO', edTexto.Text);
    Sql.Fields.Add('TS_DESCRIPCION', edDescripcion.Text);
    Sql.Fields.Add('TS_IDFORMATOTELEGRAMA', fraFormatoTelegrama.Id);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCTS_TEXTOSMS.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMUNES.CTS_TEXTOSMS';
  FieldBaja := 'TS_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;

  {$IFDEF RED_PRES}
  fraTS_MODULO.Code := 'TE';
  VCLExtra.LockControls([fraTS_MODULO], True);
  {$ENDIF}
  VCLExtra.LockControls([edTextoConsulta], True);
end;

procedure TfrmManCTS_TEXTOSMS.LoadControls;
begin
  edDescripcion.Text := sdqConsulta.FieldByName('TS_DESCRIPCION').AsString;
  edTexto.Text := sdqConsulta.FieldByName('TS_TEXTO').AsString;
  fraFormatoTelegrama.Value := sdqConsulta.FieldByName('TS_IDFORMATOTELEGRAMA').AsString;
  fraModulo.Codigo := sdqConsulta.FieldByName('TS_MODULO').AsString;  
  VCLExtra.LockControls([fraModulo, fraFormatoTelegrama], True);
end;

procedure TfrmManCTS_TEXTOSMS.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManCTS_TEXTOSMS.Validar: Boolean;
begin
  Verificar(Trim(edDescripcion.Text) = '', edDescripcion, 'Debe completar la descripción.');
  Result := True;
end;

procedure TfrmManCTS_TEXTOSMS.fraFormatoTelegramaPropiedadesChange(Sender: TObject);
begin
  if IsEmptyString(edDescripcion.Text) then
    edDescripcion.Text := fraFormatoTelegrama.Descripcion;
end;

procedure TfrmManCTS_TEXTOSMS.edTextoChange(Sender: TObject);
begin
  inherited;
  lbCaracteres.Caption := IntToStr(Length(edTexto.Lines.Text)) + ' caracteres'; 
end;

end.
