unit unRelevGremialista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmRelevGremialista = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    edNroLegajo: TEdit;
    edNombreGremio: TEdit;
    lbLegajo: TLabel;
    lbNombreGremio: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    FIDCabecera : Integer;
    { Private declarations }
  public
    { Public declarations }
    procedure Cargar(iIDCabecera : Integer);
    property IDCabecera : Integer read FIDCabecera write FIDCabecera;
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmRelevGremialista: TfrmRelevGremialista;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs,
  unCustomConsulta;

procedure TfrmRelevGremialista.ClearControls;
begin
  inherited;
  edNroLegajo.Clear;
  edNombreGremio.Clear;
end;

procedure TfrmRelevGremialista.Cargar(iIDCabecera : Integer);
begin
  IDCabecera := iIDCabecera;
  sdqConsulta.ParamByName('idrelev').AsInteger := IDCabecera;
end;

function TfrmRelevGremialista.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('rg_id').AsInteger;
      Sql.Fields.Add('rg_usubaja', Sesion.UserID );
      Sql.Fields.Add('rg_fechabaja', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('rg_idrelevriesgolaboral',IDCabecera);
      Sql.Fields.Add('rg_nrolegajo',edNroLegajo.Text);
      Sql.Fields.Add('rg_nombregremio',edNombreGremio.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HRG_ID');
        Sql.Fields.Add('rg_usualta', Sesion.UserID );
        Sql.Fields.Add('rg_fechaalta', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('rg_id').AsInteger;
        Sql.Fields.Add('rg_usumodif', Sesion.UserID);
        Sql.Fields.Add('rg_fechamodif', exDateTime );
        Sql.Fields.Add('rg_usubaja', exNull );
        Sql.Fields.Add('rg_fechabaja', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('rg_id', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
      Rollback(true);
      Result := False;
      ErrorMsg(E, 'Error al guardar los datos.');
    end;
  end;

end;

procedure TfrmRelevGremialista.FormCreate(Sender: TObject);
begin
  sdqConsulta.ParamByName('idrelev').AsInteger := IDCabecera;
  inherited;
  FieldBaja := 'rg_fechabaja';
  Sql.TableName := 'HYS.hrg_relevgremialista';
end;

procedure TfrmRelevGremialista.LoadControls;
begin
  inherited;
  ClearControls;
  edNroLegajo.Text := sdqConsulta.FieldByName('rg_nrolegajo').AsString;
  edNombreGremio.Text := sdqConsulta.FieldByName('rg_nombregremio').AsString;
end;

function TfrmRelevGremialista.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(edNroLegajo.Text),edNroLegajo, 'Debe especificar el Legajo.');
  Verificar(IsEmptyString(edNombreGremio.Text),edNombreGremio, 'Debe especificar el Nombre.');
end;




procedure TfrmRelevGremialista.tbRefrescarClick(Sender: TObject);
begin
 { sdqConsulta.SQL.Text :=
    ' SELECT rg_id, rg_idrelevriesgolaboral, rg_nrolegajo, rg_nombregremio,
    '        rg_usualta, rg_fechaalta, rg_usumodif, rg_fechamodif, rg_usubaja,
    '        rg_fechabaja
    '   FROM hys.hrg_relevgremialista
    '  WHERE rg_idrelevriesgolaboral = :idrelev
  }
  inherited;

end;

end.
