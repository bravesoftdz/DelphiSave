unit unManRelevamientosPactados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa;

type
  TfrmManRelevamientosPactados = class(TfrmCustomGridABM)
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    edFechaPactada: TDateEdit;
    Label2: TLabel;
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
  frmManRelevamientosPactados: TfrmManRelevamientosPactados;

implementation

{$R *.dfm}

uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs;

{ TfrmManRelevamientosPactados }

procedure TfrmManRelevamientosPactados.ClearControls;
begin
  inherited;
  fraEmpresa.Clear;
  edFechaPactada.Clear;
end;

function TfrmManRelevamientosPactados.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('FP_ID').AsInteger;
      Sql.Fields.Add('FP_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('FP_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('FP_CONTRATO', fraEmpresa.Contrato);
      Sql.Fields.Add('FP_FECHAPACTADA', edFechaPactada.Date);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HFP_ID');
        Sql.Fields.Add('FP_USUALTA', Sesion.UserID );
        Sql.Fields.Add('FP_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('FP_ID').AsInteger;
        Sql.Fields.Add('FP_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('FP_FECHAMODIF', exDateTime );
        Sql.Fields.Add('FP_USUBAJA', exNull );
        Sql.Fields.Add('FP_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('FP_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar la Fecha Pactada.');
    end;
  end;

end;

procedure TfrmManRelevamientosPactados.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'FP_FECHABAJA';
  Sql.TableName := 'HYS.HFP_FECHAPACTADARELEV';
end;

procedure TfrmManRelevamientosPactados.LoadControls;
begin
  inherited;
  ClearControls;
  fraEmpresa.Contrato := sdqConsulta.FieldByName('FP_CONTRATO').AsInteger;
  edFechaPactada.Date := sdqConsulta.FieldByName('FP_FECHAPACTADA').AsDateTime;
end;

function TfrmManRelevamientosPactados.Validar: Boolean;
begin
  Result := True;
  Verificar(edFechaPactada.Date = 0,edFechaPactada, 'Debe especificar una Fecha.');
  Verificar(not fraEmpresa.IsSelected,fraEmpresa, 'Debe especificar un Contrato.');
end;

end.
