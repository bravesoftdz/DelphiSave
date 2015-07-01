unit unManPuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmManPuesto = class(TfrmCustomGridABM)
    lbCodigo: TLabel;
    edCodigo: TEdit;
    lbDescripcion: TLabel;
    edDescripcion: TEdit;
    lbActividad: TLabel;
    fraCiuo: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    pnAceptarPuesto: TPanel;
    btnAceptarPuesto: TButton;
    btCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btnAceptarPuestoClick(Sender: TObject);
  private
    { Private declarations }
  public
    FIDPuesto : Integer;
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmManPuesto: TfrmManPuesto;

implementation

{$R *.dfm}

uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs,
  unCustomConsulta;

procedure TfrmManPuesto.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  fraCiuo.Clear;
  VCLExtra.LockControls([edCodigo], true);
end;

function TfrmManPuesto.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('PU_ID').AsInteger;
      Sql.Fields.Add('PU_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('PU_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('PU_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('PU_IDCIUO', fraCiuo.Value);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HPU_PUESTO_ID');
        Sql.Fields.Add('PU_USUALTA', Sesion.UserID );
        Sql.Fields.Add('PU_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('PU_ID').AsInteger;
        Sql.Fields.Add('PU_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('PU_FECHAMODIF', exDateTime );
        Sql.Fields.Add('PU_USUBAJA', exNull );
        Sql.Fields.Add('PU_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('PU_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el puesto.');
    end;
  end;

end;

procedure TfrmManPuesto.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'PU_FECHABAJA';
  Sql.TableName := 'HYS.HPU_PUESTO';

  with fraCiuo do
  begin
    TableName := 'COMUNES.CCI_CIUO';
    FieldDesc := 'CI_DESCRIPCION';
    FieldID := 'CI_ID';
    FieldCodigo := 'CI_CODIGO';
    CaseSensitive := false;
    ShowBajas := true;
  end;                     
end;

procedure TfrmManPuesto.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('PU_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('PU_DESCRIPCION').AsString;
  fraCiuo.Value := sdqConsulta.FieldByName('PU_IDCIUO').AsInteger;
end;

function TfrmManPuesto.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
  Verificar(not fraCiuo.IsSelected,fraCiuo, 'Debe especificar un CIUO.');
end;


procedure TfrmManPuesto.btCancelarClick(Sender: TObject);
begin
  Close
end;

procedure TfrmManPuesto.btnAceptarPuestoClick(Sender: TObject);
begin
  ModalResult := mrOk;
  FIDPuesto := sdqConsulta.FieldByName('PU_ID').AsInteger;

end;

end.
