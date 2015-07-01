unit unManPrestadorContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraCodigoDescripcion,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa;

type
  TfrmManPrestadorContrato = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraEmpresaAsignar: TfraEmpresa;
    Label2: TLabel;
    fraPrestadorAsignar: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
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
  frmManPrestadorContrato: TfrmManPrestadorContrato;

implementation

uses
  General,CustomDlgs,StrFuncs, unCustomConsulta, unDmPrincipal, SqlOracle,
  unSesion, AnsiSQL, SQLFuncs, VCLExtra, DBSql;

{$R *.dfm}

procedure TfrmManPrestadorContrato.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'PC_FECHABAJA';
  Sql.TableName := 'HYS.HPC_PRESTADORCONTRATO';

  with fraPrestadorAsignar do
  begin
    TableName := 'ART.CPR_PRESTADOR';
    FieldDesc := 'CA_DESCRIPCION';
    FieldID := 'CA_IDENTIFICADOR';
    FieldCodigo := 'CA_CLAVE';
    FieldBaja := 'CA_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := False;
(*
    ExtraCondition :=
      ' AND EXISTS(SELECT 1 '+
      '              FROM art.svp_valorprestador '+
      '             WHERE vp_prestador = ca_identificador '+
      '               AND vp_valordeamp = ''S'' '+
      '               AND ADD_MONTHS(art.actualdate, -1) BETWEEN vp_vigenciadesde '+
      '               AND NVL(vp_vigenciahasta, SYSDATE))';
*)
  end;
end;

procedure TfrmManPrestadorContrato.ClearControls;
begin
  inherited;
  fraEmpresaAsignar.Clear;
  fraPrestadorAsignar.Clear;
end;

function TfrmManPrestadorContrato.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('PC_ID').AsInteger;
      Sql.Fields.Add('PC_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('PC_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('PC_IDPRESTADOR', fraPrestadorAsignar.Value);
      Sql.Fields.Add('PC_CONTRATO', fraEmpresaAsignar.Contrato);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HPC_PRESCON_ID');
        Sql.Fields.Add('PC_USUALTA', Sesion.UserID );
        Sql.Fields.Add('PC_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('PC_ID').AsInteger;
        Sql.Fields.Add('PC_USUBAJA', exNull );
        Sql.Fields.Add('PC_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('PC_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManPrestadorContrato.LoadControls;
begin
  inherited;
  ClearControls;
  fraEmpresaAsignar.Contrato := sdqConsulta.FieldByName('PC_CONTRATO').AsInteger;
  fraPrestadorAsignar.Value := sdqConsulta.FieldByName('PC_IDPRESTADOR').AsInteger;
end;

function TfrmManPrestadorContrato.Validar: Boolean;
begin
  result := true;
  Verificar(not fraEmpresaAsignar.IsSelected, fraEmpresaAsignar, 'Debe especificar un Contrato.');
  Verificar(not fraPrestadorAsignar.IsSelected, fraPrestadorAsignar, 'Debe especificar un Prestador.');
end;

procedure TfrmManPrestadorContrato.tbNuevoClick(Sender: TObject);
begin
  vclExtra.LockControls([fraEmpresaAsignar, fraPrestadorAsignar],False);
  inherited;
end;

procedure TfrmManPrestadorContrato.tbModificarClick(Sender: TObject);
begin
  inherited;
  vclExtra.LockControls([fraEmpresaAsignar, fraPrestadorAsignar],True);
end;

end.
 