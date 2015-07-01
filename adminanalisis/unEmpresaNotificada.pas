unit unEmpresaNotificada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExComboBox, unFraEmpresa,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame;

type
  TfrmEmpresaNotificada = class(TfrmCustomGridABM)
    fraEmpresa: TfraEmpresa;
    lblCUIT: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
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
  frmEmpresaNotificada: TfrmEmpresaNotificada;

implementation

uses
  unDmPrincipal, SqlFuncs, ansiSql, VclExtra, CustomDlgs, unSesion, General;

{$R *.dfm}

procedure TfrmEmpresaNotificada.ClearControls;
begin
  inherited;
  fraEmpresa.Clear;
end;

function TfrmEmpresaNotificada.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('en_id').AsInteger;
      Sql.Fields.Add('en_usubaja', Sesion.UserID );
      Sql.Fields.Add('en_fechabaja', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('en_idempresa',fraEmpresa.value);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HEN_ID');
        Sql.Fields.Add('en_usualta', Sesion.UserID );
        Sql.Fields.Add('en_fechaalta', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('en_id').AsInteger;
        Sql.Fields.Add('en_usumodif', Sesion.UserID);
        Sql.Fields.Add('en_fechamodif', exDateTime );
        Sql.Fields.Add('en_usubaja', exNull );
        Sql.Fields.Add('en_fechabaja', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('en_id', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmEmpresaNotificada.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'en_fechabaja';
  Sql.TableName := 'hys.hen_empresanotificacion';
end;

procedure TfrmEmpresaNotificada.LoadControls;
begin
  inherited;
  ClearControls;
  fraEmpresa.Value := sdqConsulta.FieldByName('en_idempresa').AsInteger;
end;

procedure TfrmEmpresaNotificada.tbRefrescarClick(Sender: TObject);
begin
  inherited;
  //
end;

function TfrmEmpresaNotificada.Validar: Boolean;
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'Debe ingresar la Empresa que se notificara.');
  result := true;
end;

end.
