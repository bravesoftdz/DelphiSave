unit unRelevContratistas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask;

type
  TfrmRelevContratista = class(TfrmCustomGridABM)
    mskCUITContratista: TMaskEdit;
    lbCuit: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
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
  frmRelevContratista: TfrmRelevContratista;

implementation

{$R *.dfm}

uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs,
  unCustomConsulta, CUIT;

procedure TfrmRelevContratista.ClearControls;
begin
  inherited;
  mskCUITContratista.Clear;
end;

procedure TfrmRelevContratista.Cargar(iIDCabecera : Integer);
begin
  IDCabecera := iIDCabecera;
  sdqConsulta.ParamByName('idrelev').AsInteger := IDCabecera;
end;

function TfrmRelevContratista.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('rc_id').AsInteger;
      Sql.Fields.Add('rc_usubaja', Sesion.UserID );
      Sql.Fields.Add('rc_fechabaja', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('rc_idrelevriesgolaboral',IDCabecera);
      Sql.Fields.Add('rc_cuit',mskCUITContratista.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HRC_ID');
        Sql.Fields.Add('rc_usualta', Sesion.UserID );
        Sql.Fields.Add('rc_fechaalta', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('rc_id').AsInteger;
        Sql.Fields.Add('rc_usumodif', Sesion.UserID);
        Sql.Fields.Add('rc_fechamodif', exDateTime );
        Sql.Fields.Add('rc_usubaja', exNull );
        Sql.Fields.Add('rc_fechabaja', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('rc_id', iIdCodigo);

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

procedure TfrmRelevContratista.FormCreate(Sender: TObject);
begin
  sdqConsulta.ParamByName('idrelev').AsInteger := IDCabecera;
  inherited;
  FieldBaja := 'rc_fechabaja';
  Sql.TableName := 'HYS.hrc_relevcontratista';
end;

procedure TfrmRelevContratista.LoadControls;
begin
  inherited;
  ClearControls;
  mskCUITContratista.Text := sdqConsulta.FieldByName('rc_cuit').AsString;
end;

function TfrmRelevContratista.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(mskCUITContratista.Text),mskCUITContratista, 'Debe ingresar el CUIT.');
  Verificar(not IsCuit(mskCUITContratista.Text) ,mskCUITContratista, 'Debe ser un Cuit Valido.');
end;

end.
