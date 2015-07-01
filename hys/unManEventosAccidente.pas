unit unManEventosAccidente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManEventosAccidente = class(TfrmCustomGridABM)
    cbEnviaMail: TCheckBox;
    Label1: TLabel;
    edTextoMail: TMemo;
    edCodigo: TEdit;
    lbCodigo: TLabel;
    lbDescripcion: TLabel;
    edDescripcion: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;  
  end;

var
  frmManEventosAccidente: TfrmManEventosAccidente;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs;

{ TfrmManEventosAccidente }

procedure TfrmManEventosAccidente.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  cbEnviaMail.Checked := False;
  edTextoMail.Clear;
  VCLExtra.LockControls([edCodigo], true);
end;

function TfrmManEventosAccidente.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('TA_ID').AsInteger;
      Sql.Fields.Add('TA_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('TA_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('TA_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('TA_TEXTOMAIL', edTextoMail.Text);
      if cbEnviaMail.Checked then
        Sql.Fields.Add('TA_ENVIOMAIL', 'S')
      else
        Sql.Fields.Add('TA_ENVIOMAIL', 'N');
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HTA_ID');
        Sql.Fields.Add('TA_USUALTA', Sesion.UserID );
        Sql.Fields.Add('TA_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('TA_ID').AsInteger;
        Sql.Fields.Add('TA_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('TA_FECHAMODIF', exDateTime );
        Sql.Fields.Add('TA_USUBAJA', exNull );
        Sql.Fields.Add('TA_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('TA_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManEventosAccidente.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'TA_FECHABAJA';
  Sql.TableName := 'HYS.HTA_TIPOEVENTOACCIDENTE';
end;

procedure TfrmManEventosAccidente.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('TA_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('TA_DESCRIPCION').AsString;
  edTextoMail.Text := sdqConsulta.FieldByName('TA_TEXTOMAIL').AsString;
  cbEnviaMail.Checked := sdqConsulta.FieldByName('TA_ENVIOMAIL').AsString = 'S';
end;

function TfrmManEventosAccidente.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
  Verificar(IsEmptyString(edTextoMail.Text),edTextoMail, 'Debe especificar un Texto de Mail.');
end;

end.
