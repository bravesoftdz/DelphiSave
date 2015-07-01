unit unManZonasAFIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion;

type
  TfrmManZonasAFIP = class(TfrmCustomGridABM)
    fraProvinciaAM: TfraStaticCodigoDescripcion;
    Label1: TLabel;
    edLocalidadAM: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edZonaAM: TEdit;
    GroupBox1: TGroupBox;
    fraProvincia: TfraStaticCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmManZonasAFIP: TfrmManZonasAFIP;

implementation

uses
  CustomDlgs, StrFuncs, unSesion, SqlFuncs, AnsiSql;

{$R *.dfm}

procedure TfrmManZonasAFIP.ClearControls;
begin
  fraProvinciaAM.Clear;
  edLocalidadAM.Clear;
  edZonaAM.Clear;
end;

function TfrmManZonasAFIP.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      TableName := 'SZA_ZONAAFIP';

      case ModoABM of
        maAlta, maModificacion:
          begin
            if ModoABM = maAlta then
              begin
                SqlType := stInsert;

                PrimaryKey.Add ('ZA_ID',            'SEQ_SZA_ID.NEXTVAL', False);
                Fields.Add('ZA_USUALTA',            Sesion.UserID);
                Fields.Add('ZA_FECHAALTA',          exDateTime);
              end
            else
              begin
                SqlType := stUpdate;

                PrimaryKey.Add('ZA_ID',             sdqConsulta.FieldByName('ZA_ID').AsInteger, False);
                Fields.Add('ZA_USUMODIF',           Sesion.UserID);
                Fields.Add('ZA_FECHAMODIF',         exDateTime);
              end;

            Fields.Add('ZA_PROVINCIA',              fraProvinciaAM.Codigo);
            Fields.Add('ZA_LOCALIDAD',              Trim(edLocalidadAM.Text));
            Fields.Add('ZA_ZONA',                   Trim(edZonaAM.Text));
          end;

        maBaja:
          begin
            SqlType := stUpdate;

            PrimaryKey.Add('ZA_ID',               sdqConsulta.FieldByName('ZA_ID').AsInteger, False);
            Fields.Add('ZA_USUBAJA',              Sesion.UserID);
            Fields.Add('ZA_FECHABAJA',            exDateTime);
          end;
      end;

      Result := inherited DoABM;
    end;
end;

procedure TfrmManZonasAFIP.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'ZA_FECHABAJA';

  with fraProvinciaAM do
  begin
    TableName   := 'CPV_PROVINCIAS';
    FieldID     := 'PV_CODIGO';
    FieldCodigo := 'PV_CODIGO';
    FieldDesc   := 'PV_DESCRIPCION';
  end;

  with fraProvincia do
  begin
    TableName   := 'CPV_PROVINCIAS';
    FieldID     := 'PV_CODIGO';
    FieldCodigo := 'PV_CODIGO';
    FieldDesc   := 'PV_DESCRIPCION';
  end;
end;

procedure TfrmManZonasAFIP.LoadControls;
begin
  fraProvinciaAM.Codigo := sdqConsulta.FieldByName('PV_CODIGO').AsString;
  edLocalidadAM.Text    := sdqConsulta.FieldByName('ZA_LOCALIDAD').AsString;
  edZonaAM.Text         := sdqConsulta.FieldByName('ZA_ZONA').AsString;
end;

function TfrmManZonasAFIP.Validar: Boolean;
begin
  Verificar(fraProvinciaAM.IsEmpty, fraProvinciaAM, 'Debe ingresar la provincia.');
  Verificar(Trim(edLocalidadAM.Text) = '', edLocalidadAM, 'Debe ingresar la localidad.');
  Verificar(Trim(edZonaAM.Text) = '', edZonaAM, 'Debe ingresar la zona.');

  Result := True;
end;

procedure TfrmManZonasAFIP.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraProvincia.Clear;
end;

procedure TfrmManZonasAFIP.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT PV_CODIGO, PV_DESCRIPCION, ZA_LOCALIDAD, ZA_ZONA, ZA_FECHABAJA, ZA_ID ' +
            'FROM CPV_PROVINCIAS, SZA_ZONAAFIP ' +
           'WHERE ZA_PROVINCIA = PV_CODIGO ';

  if fraProvincia.IsSelected then
    sWhere := ' AND ZA_PROVINCIA = ' + SqlValue(fraProvincia.Codigo);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

end.
