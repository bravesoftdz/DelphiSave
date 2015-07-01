unit unExcluirCancerigenos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unfraEstablecimientoDomic,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa;

type
  TfrmExcluirCancerigenos = class(TfrmCustomGridABM)
    fraEmpresa: TfraEmpresa;
    fraEstableci: TfraEstablecimientoDomic;
    lblCUIT: TLabel;
    edObservacion: TRichEdit;
    lbObservaciones: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure fraEmpresaOnchange(Sender: TObject);
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
  frmExcluirCancerigenos: TfrmExcluirCancerigenos;

implementation
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs;

{$R *.dfm}


procedure TfrmExcluirCancerigenos.ClearControls;
begin
  inherited;
  fraEmpresa.Clear;
  fraEstableci.Clear;
  edObservacion.Clear;
end;

function TfrmExcluirCancerigenos.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('EC_ID').AsInteger;
      Sql.Fields.Add('EC_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('EC_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('EC_CUIT', fraEmpresa.CUIT);
      Sql.Fields.Add('EC_ESTABLECI', fraEstableci.edCodigo.Text);
      Sql.Fields.Add('EC_OBSERVACIONES', edObservacion.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HEC_ID');
        Sql.Fields.Add('EC_USUALTA', Sesion.UserID );
        Sql.Fields.Add('EC_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('EC_ID').AsInteger;
        Sql.Fields.Add('EC_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('EC_FECHAMODIF', exDateTime );
        Sql.Fields.Add('EC_USUBAJA', exNull );
        Sql.Fields.Add('EC_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('EC_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;

end;

procedure TfrmExcluirCancerigenos.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'EC_FECHABAJA';
  Sql.TableName := 'HYS.HEC_EXCLUIRCANCERIGENOS';
  fraEmpresa.OnChange := fraEmpresaOnchange;
end;

procedure TfrmExcluirCancerigenos.LoadControls;
begin
  inherited;
  ClearControls;
  fraEmpresa.CUIT := sdqConsulta.FieldByName('EC_CUIT').AsString;
  fraEmpresaOnchange(nil);
  fraEstableci.edCodigo.Text := sdqConsulta.FieldByName('EC_ESTABLECI').AsString;
  edObservacion.Text := sdqConsulta.FieldByName('EC_OBSERVACIONES').AsString;
end;

procedure TfrmExcluirCancerigenos.fraEmpresaOnchange(Sender : TObject);
begin
  fraEstableci.CUIT := fraEmpresa.CUIT;
end;

function TfrmExcluirCancerigenos.Validar: Boolean;
begin
  Result := True;
  Verificar(not fraEmpresa.IsSelected, fraEmpresa, 'Debe especificar una Empresa.');
  Verificar(not fraEstableci.IsSelected, fraEstableci, 'Debe especificar un Establecimiento.');
end;

end.
