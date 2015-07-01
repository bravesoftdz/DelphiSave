unit unManCausa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmManCausa = class(TfrmCustomGridABM)
    lbCodigo: TLabel;
    lbDescripcion: TLabel;
    edCodigo: TEdit;
    edDescripcion: TEdit;
    fraEstadoPresentacion: TfraCodigoDescripcion;
    Label1: TLabel;
    cbNotifPreventor: TCheckBox;
    cbNotifEmpresa: TCheckBox;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManCausa: TfrmManCausa;

implementation

uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs,
  unCustomConsulta;
{$R *.dfm}

procedure TfrmManCausa.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  fraEstadoPresentacion.Clear;
  cbNotifPreventor.Checked := False;
  cbNotifEmpresa.Checked := False;
  VCLExtra.LockControls([edCodigo], true);
end;

function TfrmManCausa.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('CA_ID').AsInteger;
      Sql.Fields.Add('CA_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('CA_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('CA_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('CA_IDESTADO', fraEstadoPresentacion.Codigo);
      if cbNotifPreventor.Checked then
        Sql.Fields.Add('CA_NOTIFPREV', 'S')
      else
        Sql.Fields.Add('CA_NOTIFPREV', 'N');
      if cbNotifEmpresa.Checked then
        Sql.Fields.Add('CA_NOTIFEMPRESA', 'S')
      else
        Sql.Fields.Add('CA_NOTIFEMPRESA', 'N');
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HCA_ID');
        Sql.Fields.Add('CA_USUALTA', Sesion.UserID );
        Sql.Fields.Add('CA_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('CA_ID').AsInteger;
        Sql.Fields.Add('CA_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('CA_FECHAMODIF', exDateTime );
        Sql.Fields.Add('CA_USUBAJA', exNull );
        Sql.Fields.Add('CA_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('CA_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar la causa.');
    end;
  end;

end;

procedure TfrmManCausa.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'CA_FECHABAJA';
  Sql.TableName := 'HYS.HCA_CAUSA';
  with fraEstadoPresentacion do
  begin
    TableName   := 'HYS.HEP_ESTADOPRESENTACION';
    FieldID     := 'EP_ID';
    FieldCodigo := 'EP_ID';
    FieldDesc   := 'EP_DESCRIPCION';
    Showbajas   := true;
    IdType      := ctString;
    CodigoType  := ctString;
    FieldBaja   := 'EP_FECHABAJA';
  end;
end;

procedure TfrmManCausa.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('CA_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('CA_DESCRIPCION').AsString;
  fraEstadoPresentacion.Codigo := sdqConsulta.FieldByName('CA_IDESTADO').AsString;
  cbNotifPreventor.Checked := sdqConsulta.FieldByName('CA_NOTIFPREV').AsString = 'S';
  cbNotifEmpresa.Checked := sdqConsulta.FieldByName('CA_NOTIFEMPRESA').AsString = 'S';
end;

function TfrmManCausa.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
  Verificar(not fraEstadoPresentacion.IsSelected, fraEstadoPresentacion,'Debe esepecificar un Estado de presentación');
end;


end.
