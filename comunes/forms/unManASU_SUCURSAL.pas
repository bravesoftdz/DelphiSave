unit unManASU_SUCURSAL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unFraCodigoDescripcion,
  unFraEntidades, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unfraSucursal, unFraCanal, unFraCentroRegional;

type
  TfrmManASU_SUCURSAL = class(TfrmCustomGridABM)
    edCodigo: TEdit;
    Label1: TLabel;
    fraEntidad: TfraEntidades;
    edDescripcion: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fraEN_ID: TfraEntidades;
    fraEN_IDCANAL: TfraCanal;
    fraSU_ID: TfraSucursal;
    Label7: TLabel;
    fraIDCENTROREG: TfraCentroRegional;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar : Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  end;

var
  frmManASU_SUCURSAL: TfrmManASU_SUCURSAL;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, AnsiSql, unSesion;

{$R *.DFM}

{ TfrmManASU_SUCURSAL }

procedure TfrmManASU_SUCURSAL.ClearControls;
begin
  edCodigo.Clear;
  edDescripcion.Clear;
  fraEntidad.Clear;
  fraIDCENTROREG.Clear;
end;

function TfrmManASU_SUCURSAL.DoABM: Boolean;
var
  IDSucursal: integer;
begin
  Sql.Clear;
  Sql.TableName := 'ASU_SUCURSAL';

  if ModoABM = maBaja then
  begin
    IDSucursal := sdqConsulta.FieldByName('SU_ID').AsInteger;
    Sql.Fields.Add('SU_USUBAJA', Sesion.UserID);
    Sql.Fields.Add('SU_FECHABAJA', 'ACTUALDATE', False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      IDSucursal := ValorSql('SELECT SEQ_ASU_ID.NEXTVAL FROM DUAL');
      Sql.Fields.Add('SU_USUALTA', Sesion.UserID);
      Sql.Fields.Add('SU_FECHAALTA', 'ACTUALDATE', False);
    end
    else
    begin  //modificacion
      IDSucursal := sdqConsulta.FieldByName('SU_ID').AsInteger;
      Sql.Fields.Add('SU_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('SU_FECHAMODIF', 'ACTUALDATE', False);
      Sql.Fields.Add('SU_USUBAJA', 'NULL', False);
      Sql.Fields.Add('SU_FECHABAJA', 'NULL', False);
    end;
    Sql.Fields.Add('SU_CODSUCURSAL', edCodigo.Text);
    Sql.Fields.Add('SU_DESCRIPCION', edDescripcion.Text);
    Sql.Fields.Add('SU_IDENTIDAD',   fraEntidad.Value, False);
    Sql.Fields.Add('SU_IDCENTROREG', fraIDCENTROREG.Value, False);

  end;
  Sql.PrimaryKey.Add('SU_ID', IDSucursal, False);

  BeginTrans;
  try
    EjecutarSqlSt(Sql.Sql);
    result := True;
    CommitTrans;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  except
    on E:Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmManASU_SUCURSAL.LoadControls;
begin
  edCodigo.Text        := sdqConsulta.FieldByName('SU_CODSUCURSAL').AsString;
  edDescripcion.Text   := sdqConsulta.FieldByName('SU_DESCRIPCION').AsString;
  fraEntidad.Value     := sdqConsulta.FieldByName('SU_IDENTIDAD').AsInteger;
  fraIDCENTROREG.Value := sdqConsulta.FieldByName('SU_IDCENTROREG').AsInteger;
end;

function TfrmManASU_SUCURSAL.Validar: Boolean;
begin
  Verificar(edCodigo.Text = '', edCodigo, 'El código de la sucursal es obligatorio.');
  Verificar(edDescripcion.Text = '', edDescripcion, 'El nombre de la sucursal es obligatorio.');
  Verificar(fraEntidad.IsEmpty, fraEntidad.edCodigo, 'Debe indicar la entidad a la que pertenece la sucursal.');
  Verificar(fraIDCENTROREG.IsEmpty, fraIDCENTROREG.edCodigo, 'Debe indicar el centro regional al que pertenece la sucursal.');
  Result := True;
end;

procedure TfrmManASU_SUCURSAL.FormCreate(Sender: TObject);
begin
  inherited;
  
  ShowActived := False;
  fraEN_IDCANAL.FiltraUsuario := False;
end;

procedure TfrmManASU_SUCURSAL.tbLimpiarClick(Sender: TObject);
begin
  fraEN_IDCANAL.Clear;
  fraEN_ID.Clear;
  fraSU_ID.Clear;
end;

procedure TfrmManASU_SUCURSAL.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sSql :=
    'SELECT SU_ID, SU_CODSUCURSAL, SU_DESCRIPCION, SU_IDENTIDAD, SU_IDCENTROREG, EN_CODBANCO, EN_NOMBRE NOMBREENTIDAD,' +
          ' CR_DESCRIPCION CENTROREGIONAL, CA_CODIGO, CA_DESCRIPCION' +
     ' FROM ASU_SUCURSAL, XEN_ENTIDAD, ACA_CANAL, ACR_CENTROREGIONAL' +
    ' WHERE SU_IDENTIDAD = EN_ID(+)' +
      ' AND SU_IDCENTROREG = CR_ID(+)' +
      ' AND EN_IDCANAL = CA_ID(+)';
      
  if fraEN_ID.IsSelected then
    sWhere := ' AND EN_ID = ' + SqlValue(fraEN_ID.Value);
  if fraEN_IDCANAL.IsSelected then
    sWhere := sWhere + ' AND CA_ID = ' + SqlValue(fraEN_IDCANAL.Value);
  if fraSU_ID.IsSelected then
    sWhere := sWhere + ' AND SU_ID = ' + SqlValue(fraSU_ID.Value);

    sdqConsulta.Sql.Text := sSql + sWhere;
  inherited;
end;

end.
