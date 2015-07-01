unit unManLno_Norma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraNormaLegal, Mask,
  ToolEdit, DateComboBox, unArtFrame, unFraCodigoDescripcion,
  unfraCodigoDescripcionExt, PatternEdit, IntEdit, AnsiSql;

type
  TfrmManLnoNorma = class(TfrmCustomGridABM)
    lblNumero: TLabel;
    lblTipoNorma: TLabel;
    lblDescripcion: TLabel;
    fraNorma: TfraCodigoDescripcionExt;
    lblFechaNorma: TLabel;
    edFechaNorma: TDateComboBox;
    lblFechaPublicacion: TLabel;
    edFechaPublicacion: TDateComboBox;
    lblFechaDerogacion: TLabel;
    edFechaDerogacion: TDateComboBox;
    fraDependencia: TfraCodigoDescripcionExt;
    lblDependencia: TLabel;
    edDescripcionNorma: TEdit;
    edNroNorma: TEdit;
    fraNombreNormaDependiente: TfraCodigoDescripcionExt;
    Label1: TLabel;
    Label2: TLabel;
    edNO_ID: TIntEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadControls; override;
    procedure ClearControls; override;
    function Validar : Boolean; override;
  private
    function VerificarExistenciaNorma: boolean;
  protected
    function DoABM: Boolean; override;
  end;

var
  frmManLnoNorma: TfrmManLnoNorma;

implementation

uses unPrincipal, SqlFuncs, unDmPrincipal, CustomDlgs;

{$R *.dfm}

procedure TfrmManLnoNorma.FormCreate(Sender: TObject);
begin
  inherited;

  with fraNorma do
  begin
    TableName   := 'legales.ltn_tiponorma';
    FieldID     := 'tn_id';
    FieldCodigo := 'tn_id';
    FieldDesc   := 'tn_descripcion';
  end;

  with fraDependencia do
  begin
    TableName   := 'legales.lde_dependencia';
    FieldID     := 'de_id';
    FieldCodigo := 'de_id';
    FieldDesc   := 'de_descripcion';
  end;

  with fraNombreNormaDependiente do
  begin
    TableName   := 'legales.lno_norma';
    FieldID     := 'no_id';
    FieldCodigo := 'no_id';
    FieldDesc   := 'no_nro';
    FieldBaja   := 'no_fechabaja';
//    ExtraCondition := ' and 1 = 2 ';
    ExtraFields := ' ,no_descripcion, NO_FECHANORMA, NO_FECHAPUBLICACION, NO_FECHADEROGACION, NO_TEXTONORMA, NO_CANTIDADARTICULOS ';
    ShowBajas := false;
  end;

  FieldBaja := 'NO_FECHABAJA';
  Sql.TableName := 'LEGALES.LNO_NORMA';
end;

procedure TfrmManLnoNorma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;


procedure TfrmManLnoNorma.LoadControls;
begin
  with sdqConsulta do
  begin
    fraNorma.Codigo           := FieldByName('NO_IDTIPONORMA').AsString;
    fraDependencia.Codigo     := FieldByName('no_iddependencia').AsString;
    edDescripcionNorma.Text   := FieldByName('NO_DESCRIPCION').AsString;
    edNroNorma.Text           := FieldByName('NO_NRO').AsString;
    edFechaNorma.Date         := FieldByName('NO_FECHANORMA').AsDateTime;
    edFechaPublicacion.Date   := FieldByName('NO_FECHAPUBLICACION').AsDateTime;
    edFechaDerogacion.Date    := FieldByName('NO_FECHADEROGACION').AsDateTime;
    fraNombreNormaDependiente.Codigo := FieldByName('NO_IDNORMADEPENDIENTE').AsString;
  end;
  inherited;
end;

function TfrmManLnoNorma.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('NO_ID', sdqConsulta.FieldByName('NO_ID').AsInteger);
    Sql.Fields.Add('NO_USUBAJA', frmPrincipal.dbLogin.UserId );
    Sql.Fields.Add('NO_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.PrimaryKey.Add('NO_ID', edNO_ID.Value);
    Sql.Fields.Add('NO_IDTIPONORMA', fraNorma.Codigo);
    Sql.Fields.Add('NO_DESCRIPCION', edDescripcionNorma.Text);
    Sql.Fields.Add('NO_FECHANORMA', edFechaNorma.Date);
    Sql.Fields.Add('NO_FECHAPUBLICACION', edFechaPublicacion.Date);
    Sql.Fields.Add('NO_FECHADEROGACION', edFechaDerogacion.Date);
    Sql.Fields.Add('NO_NRO', edNroNorma.Text);
    Sql.Fields.Add('NO_IDDEPENDENCIA', fraDependencia.Codigo);
    Sql.Fields.Add('NO_IDNORMADEPENDIENTE', fraNombreNormaDependiente.Codigo);

    if ModoABM = maAlta Then
    begin
      Sql.Fields.Add('NO_USUALTA', frmPrincipal.dbLogin.UserId );
      Sql.Fields.Add('NO_FECHAALTA', exDateTime );
    end else begin
      Sql.Fields.Add('NO_USUMODIF', frmPrincipal.dbLogin.UserId );
      Sql.Fields.Add('NO_FECHAMODIF', exDateTime );
      Sql.Fields.Add('NO_USUBAJA', exNull );
      Sql.Fields.Add('NO_FECHABAJA', exNull );
    end;
  end;

  Result := inherited DoABM;
end;

procedure TfrmManLnoNorma.ClearControls;
begin
  edNO_ID.Value := GetSecNextVal('legales.seq_lno_id');
  fraNorma.Limpiar;
  fraDependencia.Limpiar;
  edNroNorma.Clear;
  edDescripcionNorma.Clear;
  edFechaNorma.ClearDate;
  edFechaPublicacion.ClearDate;
  edFechaDerogacion.ClearDate;
  fraNombreNormaDependiente.Limpiar;
end;

function TfrmManLnoNorma.Validar: Boolean;
begin
  Result := False;
  if not fraNorma.IsSelected Then
    InvalidMsg(fraNorma.cmbDescripcion, 'Debe ingresar el tipo de Norma' )

  else if  not fraDependencia.IsSelected  Then
    InvalidMsg(fraDependencia.cmbDescripcion, 'Debe la dependencia de la norma' )

  else if (trim(edNroNorma.Text) = '') then
    InvalidMsg(edNroNorma, 'Debe ingresar el número de la norma' )

  else if (trim(edDescripcionNorma.Text) = '') then
    InvalidMsg(edDescripcionNorma, 'Debe ingresar la descripción de la norma' )

  else if (edFechaNorma.IsEmpty) then
    InvalidMsg(edFechaNorma, 'Debe ingresar la fecha de la norma' )

  else if (edFechaPublicacion.IsEmpty) then
    InvalidMsg(edFechaPublicacion, 'Debe ingresar la fecha de publicación de la norma' )

  else if (edFechaPublicacion.date < edFechaNorma.date) then
    InvalidMsg(edFechaPublicacion, 'La fecha de publicación debe ser mayor a la fecha de la norma' )

  else if (not edFechaDerogacion.IsEmpty) and (edFechaDerogacion.date < edFechaNorma.date) and (edFechaDerogacion.date < edFechaNorma.date) then
    InvalidMsg(edFechaDerogacion, 'La fecha de derogación debe ser mayor a la fecha de la norma y a la de publicación' )

  else if VerificarExistenciaNorma then
    InvalidMsg(edNroNorma, 'La norma ya existe' )
  else
    Result := True;
end;

function TfrmManLnoNorma.VerificarExistenciaNorma: boolean;
begin
  result := (ModoABM = maAlta) and (ValorSql('SELECT COUNT(*) FROM LEGALES.LNO_NORMA WHERE NO_NRO = ' + SqlValue(edNroNorma.Text)
            + ' and NO_IDDEPENDENCIA = ' +  SqlInt(fraDependencia.Codigo)) = 1);
end;


end.
