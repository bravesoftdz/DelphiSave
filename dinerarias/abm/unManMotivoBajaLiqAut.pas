unit unManMotivoBajaLiqAut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unDmPrincipal;

type
  TfrmManMotivoBajaLiqAut = class(TfrmCustomGridABM)
    edCodigo: TEdit;
    edDescripcion: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function ValidarBaja(iIdMotivo:integer): Boolean;
  private

  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManMotivoBajaLiqAut: TfrmManMotivoBajaLiqAut;

implementation

uses
  CustomDlgs,StrFuncs, unSesion, SqlFuncs, AnsiSql;

{$R *.dfm}

procedure TfrmManMotivoBajaLiqAut.tbRefrescarClick(Sender: TObject);
var sSql:String;
begin
  sSql := 'SELECT ML_CODIGO, ML_DESCRIPCION, ML_FECHABAJA, ML_ID ' +
           ' FROM SIN.sml_motivobajaliqaut ';
  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManMotivoBajaLiqAut.ClearControls;
begin
  edCodigo.Clear;
  edDescripcion.Clear;
end;

procedure TfrmManMotivoBajaLiqAut.LoadControls;
begin
  edCodigo.Text      := sdqConsulta.FieldByName('ML_CODIGO').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('ML_DESCRIPCION').AsString;
end;

function TfrmManMotivoBajaLiqAut.Validar: Boolean;
begin
  Verificar(trim(edCodigo.text) = '', edCodigo, 'Debe ingresar el Código');
  Verificar(trim(edDescripcion.text) = '', edDescripcion, 'Debe ingresar la Descripción');

  Result := True;
end;

procedure TfrmManMotivoBajaLiqAut.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ML_FECHABAJA';
end;

function TfrmManMotivoBajaLiqAut.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    TableName := 'SIN.SML_MOTIVOBAJALIQAUT';

    case ModoABM of
      maAlta, maModificacion:
      begin
        if ModoABM = maAlta then
        begin
          SqlType := stInsert;
         // PrimaryKey.Add('ML_ID', 'SEQ_ML_ID.NEXTVAL', False);
          Fields.Add('ML_USUALTA', Sesion.UserID);
          Fields.Add('ML_FECHAALTA', exDateTime);
        end
        else
        begin
          SqlType := stUpdate;
          PrimaryKey.Add('ML_ID', sdqConsulta.FieldByName('ML_ID').AsInteger, False);
          Fields.Add('ML_USUMODIF', Sesion.UserID);
          Fields.Add('ML_FECHAMODIF', exDateTime);
        end;

        Fields.Add('ML_CODIGO', Trim(edCodigo.Text));
        Fields.Add('ML_DESCRIPCION', Trim(edDescripcion.Text));
      end;

      maBaja:
      begin
        if ValidarBaja(sdqConsulta.FieldbyName('ML_ID').AsInteger) then
        begin
          SqlType := stUpdate;
          PrimaryKey.Add('ML_ID', sdqConsulta.FieldByName('ML_ID').AsInteger, False);
          Fields.Add('ML_USUBAJA', Sesion.UserID);
          Fields.Add('ML_FECHABAJA', exDateTime);
        end;
      end;
    end;

    Result := inherited DoABM;
  end;
end;

function TfrmManMotivoBajaLiqAut.ValidarBaja(iIdMotivo:integer): Boolean;
var sSql:string;
begin
  sSql := 'SELECT 1 FROM SIN.SCL_CASOSLIQAUTOMATICAS ' +
          ' WHERE CL_IDMOTIVOBAJA = ' + sqlInt(iIdMotivo);

  Verificar(ExisteSql(sSql), nil, 'No se puede eliminar este Motivo debido a que ya existe en los casos de Liquidaciones Automáticas.');
  Result := True;
end;

end.
