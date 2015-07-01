unit unABMAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unFraCodigoDescripcion, PatternEdit, DateTimeEditors, Mask, ToolEdit, DateComboBox;

type
  TfrmABMAgenda = class(TfrmCustomGridABM)
    lbFD: TLabel;
    dcFecha: TDateComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edMotivo: TPatternEdit;
    Label14: TLabel;
    Label18: TLabel;
    fraResponsable: TfraCodigoDescripcion;
    fraSector: TfraCodigoDescripcion;
    Label3: TLabel;
    edEmail: TEdit;
    fraLicitacion: TfraCodigoDescripcion;
    Label4: TLabel;
    dtHora: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fraSectoredCodigoExit(Sender: TObject);
    procedure fraResponsableedCodigoExit(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbEliminarClick(Sender: TObject);
  private
  protected
  	function DoABM: Boolean; override;
    function Validar: Boolean; override;

  	procedure ClearControls; override;
    procedure LoadControls; override;
  	procedure RefreshData; override;
  public
  end;

var
  frmABMAgenda: TfrmABMAgenda;

implementation

uses
	AnsiSql, CustomDlgs, Math, Numeros, SqlFuncs, unDmPrincipal, unPrincipal, unSesion;

{$R *.dfm}

function TfrmABMAgenda.DoABM: Boolean;
var
  fID: Integer;
begin
  fID := 1;
  Sql.Clear;
  Sql.TableName := 'ALA_LICITACIONCONAGENDA';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    fID := sdqConsulta.FieldByName('LA_ID').AsInteger;
    Sql.Fields.Add ('LA_USUBAJA', Sesion.UserID);
    Sql.Fields.Add ('LA_FECHABAJA', SQL_ACTUALDATE, False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      fID  := GetSecNextVal('SEQ_ALA_ID');
      Sql.Fields.Add ('LA_USUALTA', Sesion.UserID);
      Sql.Fields.Add ('LA_FECHAALTA', SQL_ACTUALDATE, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      fID  := sdqConsulta.FieldByName('LA_ID').AsInteger;
      Sql.Fields.Add ('LA_USUBAJA', SQL_NULL, False);
      Sql.Fields.Add ('LA_FECHABAJA', SQL_NULL, False);
      Sql.Fields.Add ('LA_USUMODIF', Sesion.UserID);
      Sql.Fields.Add ('LA_FECHAMODIF', SQL_ACTUALDATE, False);
    end;

    Sql.Fields.Add('LA_IDLICITACION', fraLicitacion.Value, dtNumber);
    Sql.Fields.Add('LA_FECHAHORA', Trunc(dcFecha.Date) + GetDecimales(dtHora.Time), dmDateTime);
		Sql.Fields.Add('LA_IDSECTOR', fraSector.Value, False);
    Sql.Fields.Add('LA_MAIL', edEmail.Text);
    Sql.Fields.Add('LA_MOTIVO', edMotivo.Text);
    Sql.Fields.Add('LA_RESPONSABLE', fraResponsable.Value, False);
  end;

  Sql.PrimaryKey.Add('LA_ID', fID, False);
  Result := inherited DoABM;
end;

function TfrmABMAgenda.Validar: Boolean;
begin
  Verificar(dcFecha.IsEmpty, dcFecha, 'Debe seleccionar una fecha.');
  Verificar(dtHora.Time = Trunc(dtHora.Time), dtHora, 'Debe indicar la hora de envío.');
  Verificar(edMotivo.Text = '', edMotivo, 'Debe indicar un motivo.');
  Verificar(fraSector.Value = 0, fraSector, 'Debe seleccionar un sector.');
  Verificar(fraResponsable.Value = 0, fraResponsable, 'Debe seleccionar un responsable.');
  Verificar(Trim(edEmail.Text) = '', edEmail, 'Debe ingresar una dirección de e-mail.');

  Result := True;
end;


procedure TfrmABMAgenda.ClearControls;
begin
  dcFecha.Clear;
  dtHora.Time := 0;
  edMotivo.Clear;
  fraSector.Clear;
  fraResponsable.Clear;
  edEmail.Clear;
end;

procedure TfrmABMAgenda.LoadControls;
begin
	with sdqConsulta do
  begin
    dcFecha.Date := FieldByName('LA_FECHAHORA').AsDateTime;
    dtHora.Time := FieldByName('LA_FECHAHORA').AsDateTime;
    edMotivo.Text := FieldByName('LA_MOTIVO').AsString;
    fraSector.Value := FieldByName('LA_IDSECTOR').AsInteger;
    fraResponsable.Value := FieldByName('LA_RESPONSABLE').AsInteger;
    edEmail.Text := FieldByName('LA_MAIL').AsString;
	end;
end;

procedure TfrmABMAgenda.RefreshData;
var
  sSql: string;
begin
	Verificar((fraLicitacion.Value = 0), nil, 'Debe seleccionar una licitación.');

  sSql :=
    'SELECT LA_ENVIADO, LA_FECHABAJA, LA_FECHAHORA, LA_ID, LA_IDSECTOR, LA_MAIL, LA_MOTIVO, LA_RESPONSABLE,' +
    '       SC_DESCRIPCION, SE_NOMBRE' +
    '  FROM ALA_LICITACIONCONAGENDA, USE_USUARIOS, USC_SECTORES' +
    ' WHERE LA_IDSECTOR = SC_ID (+)' +
    '   AND LA_RESPONSABLE = SE_ID (+)' +
    '   AND LA_IDLICITACION = ' + IntToStr(fraLicitacion.Value) +
    ' ORDER BY LA_FECHAHORA DESC';

  sdqConsulta.Sql.Text := sSql;
  inherited;
end;

procedure TfrmABMAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  frmPrincipal.mnuAgenda.Enabled := True;
  Action := caFree;
  frmABMAgenda := nil;
end;

procedure TfrmABMAgenda.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;

  frmPrincipal.mnuAgenda.Enabled := False;

  // Frame Licitación..
	fraLicitacion.TableName      := 'ALI_LICITACION';
  fraLicitacion.FieldCodigo    := 'LI_NROLICITACION';
  fraLicitacion.FieldDesc      := 'LI_RAZONSOCIAL';
  fraLicitacion.FieldID        := 'LI_ID';
  fraLicitacion.ShowBajas      := False;

  // Frame Sector..
  fraSector.TableName      := 'USC_SECTORES';
  fraSector.FieldCodigo    := 'SC_CODIGO';
  fraSector.FieldDesc      := 'SC_DESCRIPCION';
  fraSector.FieldID        := 'SC_ID';
  fraSector.ShowBajas      := False;

  // Frame Responsable..
  fraResponsable.TableName      := 'USE_USUARIOS';
  fraResponsable.FieldCodigo    := 'SE_USUARIO';
  fraResponsable.FieldDesc      := 'SE_NOMBRE';
  fraResponsable.FieldID        := 'SE_ID';
  fraResponsable.ShowBajas      := False;
end;

procedure TfrmABMAgenda.fraSectoredCodigoExit(Sender: TObject);
begin
  inherited;
	if fraSector.Value = 0 then
  	fraResponsable.ExtraCondition := ''
  else
		fraResponsable.ExtraCondition := ' AND SE_IDSECTOR = ' + IntToStr(fraSector.Value);
end;

procedure TfrmABMAgenda.fraResponsableedCodigoExit(Sender: TObject);
var
	sEmail: String;
	sSql: String;
begin
	if edEmail.Text = '' then
  begin
    sSql := 'SELECT SE_MAIL FROM USE_USUARIOS WHERE SE_ID = ' + SqlValue(fraResponsable.Value);
    sEmail := ValorSql(sSql);
    if sEmail <> '' then
      edEmail.Text := sEmail + '@provart.com.ar';
  end;
end;

procedure TfrmABMAgenda.tbModificarClick(Sender: TObject);
begin
  Verificar(not(sdqConsulta.Active and not sdqConsulta.IsEmpty), nil, 'Debe seleccionar un registro para poder modificarlo.');
  Verificar(not(sdqConsulta.FieldByName('LA_FECHABAJA').IsNull), nil, 'El registro ha sido dado de baja.');
  Verificar((sdqConsulta.FieldByName('LA_ENVIADO').AsString = 'S'), nil, 'El E-mail ya ha sido enviado.');

  inherited;
end;

procedure TfrmABMAgenda.tbNuevoClick(Sender: TObject);
begin
	Verificar((fraLicitacion.Value = 0), nil, 'Debe seleccionar una licitación.');

  inherited;
end;

procedure TfrmABMAgenda.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
	Highlight: Boolean);
begin
  inherited;

  if not sdqConsulta.FieldByName('LA_FECHABAJA').IsNull then
		AFont.Color := Math.IfThen(Highlight, clBtnFace, clRed);
end;

procedure TfrmABMAgenda.tbEliminarClick(Sender: TObject);
begin
	Verificar((sdqConsulta.FieldByName('LA_ENVIADO').AsString = 'S'), nil, 'El E-mail ya ha sido enviado.');

  inherited;
end;

end.
