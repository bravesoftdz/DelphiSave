unit unManBapro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unfraVendedores, unfraVendedoresCUIT, unArtFrame,
  unFraCodigoDescripcion, unfraEntidadCUIT, Mask, PatternEdit,
  unArtDBAwareFrame;

type
  TfrmManBapro = class(TfrmCustomGridABM)
    GBEntidad: TGroupBox;
    fraEN_ID: TfraEntidadCUIT;
    GBVendedor: TGroupBox;
    fraVE_ID: TfraVendedoresCUIT;
    GroupBox1: TGroupBox;
    fraEntidadAlta: TfraEntidadCUIT;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edNombreVendAlta: TEdit;
    edCodigoVendAlta: TPatternEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
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
  frmManBapro: TfrmManBapro;

implementation

uses
  unSesion, unArt, unDmPrincipal, SqlFuncs, CustomDlgs, unComisiones, VCLExtra;

{$R *.DFM}

{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManBapro.FormCreate(Sender: TObject);
begin
  inherited;

  with fraEN_ID do
    begin
      ShowBajas      := True;
      ExtraCondition := ' AND EN_IDCANAL IN (SELECT CA_ID FROM ACA_CANAL WHERE CA_TIPO = ''B'' AND CA_FECHABAJA IS NULL)';
    end;

  with fraVE_ID do
    begin
      ShowBajas      := True;
      ExtraCondition := ' AND EXISTS (SELECT 1 FROM ACA_CANAL, XEV_ENTIDADVENDEDOR A, XEN_ENTIDAD B WHERE B.EN_ID = A.EV_IDENTIDAD AND VE_ID = A.EV_IDVENDEDOR AND B.EN_IDCANAL = CA_ID AND CA_TIPO = ''B'' AND CA_FECHABAJA IS NULL)';
    end;

  with fraEntidadAlta do
    begin
      ShowBajas      := False;
      ExtraCondition := ' AND EN_IDCANAL IN (SELECT CA_ID FROM ACA_CANAL WHERE CA_TIPO = ''B'' AND CA_FECHABAJA IS NULL)';
    end;

  FieldBaja := 'EV_FECHABAJA';
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManBapro.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEN_ID.Clear;
  fraVE_ID.Clear;

  fraEN_ID.mskCuit.SetFocus;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
function TfrmManBapro.DoABM: Boolean;
var
  EVID, VEID: TTableId;
begin
  BeginTrans;
  try
    Sql.Clear;

    if (ModoABM = maAlta) then
      begin
        EVID := GetSecNextVal('SEQ_XEV_ID');
        VEID := GetSecNextVal('SEQ_XVE_ID');
      end
    else
      begin
        EVID := sdqConsulta.FieldByName('EV_ID').AsInteger;
        VEID := sdqConsulta.FieldByName('VE_ID').AsInteger;
      end;

    if (ModoABM = maAlta) or (ModoABM = maModificacion) then
      begin
        Sql.TableName := 'XVE_VENDEDOR';
        if ModoABM = maAlta then
          Sql.SqlType   := stInsert
        else
          Sql.SqlType   := stUpdate;

        Sql.PrimaryKey.Add( 'VE_ID',      VEID );
        Sql.Fields.Add('VE_VENDEDOR',     Trim(edCodigoVendAlta.Text));
        Sql.Fields.Add('VE_NOMBRE',       Trim(edNombreVendAlta.Text));

        if ModoABM = maAlta then
          begin
            Sql.Fields.Add('VE_TIPOVEND',     'I');     // Institorio
            Sql.Fields.Add('VE_GANANCIAS',    '99');
            Sql.Fields.Add('VE_OBRASOCIAL',   '99');
            Sql.Fields.Add('VE_MONOTRIBUTO',  'N');
            Sql.Fields.Add('VE_IDCANAL',      17, True);
            Sql.Fields.Add('VE_FECHAALTA',    exDateTime);
            Sql.Fields.Add('VE_USUALTA',      Sesion.UserID);
          end
        else
          begin
            Sql.Fields.Add('VE_FECHAMODIF',   exDateTime);
            Sql.Fields.Add('VE_USUMODIF',     Sesion.UserID);
          end;

        EjecutarSqlST(Sql.Sql);

        if ModoABM = maAlta then
          begin
            Sql.Clear;
            Sql.TableName := 'XEV_ENTIDADVENDEDOR';
            Sql.SqlType   := stInsert;

            Sql.PrimaryKey.Add('EV_ID',                  EVID);
            Sql.Fields.Add('EV_IDENTIDAD',               fraEntidadAlta.ID, True);
            Sql.Fields.Add('EV_IDVENDEDOR',              VEID, True);
            Sql.Fields.Add('EV_FECHAALTA',               exDateTime);
            Sql.Fields.Add('EV_USUALTA',                 Sesion.UserID);

            EjecutarSqlST(Sql.Sql);

            Sql.Clear;
            Sql.TableName := 'XVC_ENTVENDCONCEPTO';
            Sql.SqlType   := stInsert;

            Sql.PrimaryKey.Add( 'VC_ID',                 GetSecNextVal('SEQ_XVC_ID'));
            Sql.Fields.Add('VC_IDENTIDADVEND',           EVID, True);
            Sql.Fields.Add('VC_IDCONCEPTO',              1);
            Sql.Fields.AddExtended('VC_PORCPRIVADO',     Get_PorcComisionVendedor(fraEntidadAlta.Value));
            Sql.Fields.AddExtended('VC_PORCPUBLICO',     Get_PorcComisionVendedorPub(fraEntidadAlta.Value));
            Sql.Fields.Add('VC_FECHAALTA',               exDateTime);
            Sql.Fields.Add('VC_USUALTA',                 Sesion.UserID);
            Sql.Fields.Add('VC_FECHAAPROBADO',           exDateTime);
            Sql.Fields.Add('VC_USUAPROBADO',             Sesion.UserID);

            EjecutarSqlST(Sql.Sql);
          end;
      end
    else
      begin   // es baja
        Sql.TableName := 'XEV_ENTIDADVENDEDOR';
        Sql.SqlType   := stUpdate;

        Sql.PrimaryKey.Add('EV_ID',       EVID);
        Sql.Fields.Add('EV_FECHABAJA',    exDateTime);
        Sql.Fields.Add('EV_USUBAJA',      Sesion.UserID);

        EjecutarSqlST(Sql.Sql);
      end;

    CommitTrans;
    Result := True;
  except
    on E: Exception do
    begin
      RollBack;
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Result := False;
    end;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManBapro.ClearControls;
begin
  VCLExtra.LockControl(fraEntidadAlta, False);
  fraEntidadAlta.Clear;
  edCodigoVendAlta.Clear;
  edNombreVendAlta.Clear;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
function TfrmManBapro.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraEntidadAlta.IsEmpty, fraEntidadAlta.mskCuit, 'La entidad es obligatoria.');
  Verificar(Trim(edCodigoVendAlta.Text) = '', edCodigoVendAlta, 'El código de vendedor es obligatorio.');
  Verificar(Trim(edNombreVendAlta.Text) = '', edNombreVendAlta, 'El nombre del vendedor es obligatorio.');

  if (ModoABM = maAlta) or ((ModoABM = maModificacion) and (Trim(edCodigoVendAlta.Text) <> sdqConsulta.FieldByName('VE_VENDEDOR').AsString)) then
    begin
      sSql := 'SELECT 1 ' +
                'FROM ACA_CANAL, XEV_ENTIDADVENDEDOR, XEN_ENTIDAD, XVE_VENDEDOR ' +
               'WHERE EN_ID = EV_IDENTIDAD ' +
                 'AND VE_ID = EV_IDVENDEDOR ' +
                 'AND EN_IDCANAL = CA_ID ' +
                 'AND CA_TIPO = ''B'' ' +
                 'AND CA_FECHABAJA IS NULL ' +
                 'AND VE_FECHABAJA IS NULL ' +
                 'AND EN_FECHABAJA IS NULL ' +
                 'AND EV_FECHABAJA IS NULL ' +
                 'AND VE_VENDEDOR = :CodVendedor ' +
                 'AND EN_ID = :IdEntidad';
      Verificar(ExisteSqlEx(sSql, [Trim(edCodigoVendAlta.Text), fraEntidadAlta.Value]), edCodigoVendAlta, 'El vendedor ya existe para esta entidad.');
    end;

  Result := True;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManBapro.FSFormShow(Sender: TObject);
begin
  ShowActived := False;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManBapro.RefreshData;
var
  sWhere, sSql: String;
begin
  sWhere := '';

  sSql := 'SELECT EN_CODBANCO, EN_NOMBRE, VE_VENDEDOR, VE_NOMBRE, EV_USUBAJA, EV_FECHABAJA, ' +
                 'EV_ID, EN_ID, VE_ID ' +
            'FROM ACA_CANAL, XEV_ENTIDADVENDEDOR, XEN_ENTIDAD, XVE_VENDEDOR ' +
           'WHERE EN_ID = EV_IDENTIDAD ' +
             'AND VE_ID = EV_IDVENDEDOR ' +
             'AND EN_IDCANAL = CA_ID ' +
             'AND CA_TIPO = ''B'' ' +
             'AND CA_FECHABAJA IS NULL ' +
             'AND VE_FECHABAJA IS NULL ' +
             'AND EN_FECHABAJA IS NULL ' +
             'AND EV_FECHABAJA IS NULL ';

  if fraEN_ID.IsSelected  then
    sWhere := sWhere + ' AND EN_ID = ' + fraEN_ID.ID;

  if fraVE_ID.IsSelected  then
    sWhere := sWhere + ' AND VE_ID = ' + fraVE_ID.ID;

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManBapro.LoadControls;
begin
  VCLExtra.LockControl(fraEntidadAlta);
  fraEntidadAlta.Value  := sdqConsulta.FieldByName('EN_ID').AsInteger;
  edCodigoVendAlta.Text := sdqConsulta.FieldByName('VE_VENDEDOR').AsString;
  edNombreVendAlta.Text := sdqConsulta.FieldByName('VE_NOMBRE').AsString;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
end.

