{-----------------------------------------------------------------------------
 Unidad:    unFrmAdministracionTipoGestion
 Autor:     CChiappero
 Fecha:     23-Ago-2005
 Prósito:   Administrar tipos de gestión utilizados para definir la forma en
            que un lote se lleve adelante.
 Historia:
-----------------------------------------------------------------------------}

unit unFrmAdministracionTipoGestion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraTipoGestion, CustomDlgs,
  Strfuncs, unSesion, SqlFuncs, unDmPrincipal;

type
  TfrmAdministracionTiposGestion = class(TfrmCustomGridABM)
    fraTipoGestion: TfraTipoGestion;
    pnlHeader: TPanel;
    gbTipoGestion: TGroupBox;
    lblDescripcion: TLabel;
    edNombreTipoGestion: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure fraTipoGestionbtnIncluirTextoTelefonicoClick(
      Sender: TObject);
    procedure fraTipoGestionbtnIncluirTextoFaxClick(Sender: TObject);
  private
  public
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmAdministracionTiposGestion: TfrmAdministracionTiposGestion;

implementation

uses unDmEmision, unFrmTextosPredeterminados;

{$R *.dfm}

procedure TfrmAdministracionTiposGestion.ClearControls;
begin
  fraTipoGestion.Init;
  edNombreTipoGestion.Clear;
end;

function TfrmAdministracionTiposGestion.DoABM: Boolean;
begin
  try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('TG_ID', sdqConsulta.FieldByName('TG_ID').AsInteger );
      Sql.Fields.Add('TG_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('TG_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('TG_DESCRIPCION', edNombreTipoGestion.Text);
      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('TG_ID', GetSecNextVal('emi.seq_itg_id'));
        Sql.Fields.Add('TG_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('TG_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('TG_ID', sdqConsulta.FieldByName('TG_ID').AsInteger);
//        Sql.Fields.Add('TG_USUMODIF', Sesion.LoginName);
//        Sql.Fields.Add('TG_FECHAMODIF', exDateTime );
        Sql.Fields.Add('TG_USUBAJA', exNull );
        Sql.Fields.Add('TG_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    fraTipoGestion.AutoTransaction := false;
    if ModoABM <> maBaja then fraTipoGestion.Guardar(Sql.PrimaryKey[0].Value);
    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar las acciones.');
    end;
  end;
end;

procedure TfrmAdministracionTiposGestion.LoadControls;
begin
  fraTipoGestion.Init;
  with sdqConsulta do
  begin
    edNombreTipoGestion.Text := FieldByName('TG_DESCRIPCION').AsString;
    fraTipoGestion.Cargar(FieldByName('TG_ID').AsInteger);
  end;
end;


function TfrmAdministracionTiposGestion.Validar: Boolean;
begin
  Result := VerificarMultiple(['Administración de Tipos de Gestión',
                                edNombreTipoGestion, not IsEmptyString(edNombreTipoGestion.text), 'Debe especificar un nombre para la gestión.'
                              ]) and fraTipoGestion.Validar;

end;

procedure TfrmAdministracionTiposGestion.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'TG_FECHABAJA';
  Sql.TableName := 'EMI.ITG_TIPOGESTION';
  CheckPK := True;
end;

procedure TfrmAdministracionTiposGestion.fraTipoGestionbtnIncluirTextoTelefonicoClick(
  Sender: TObject);
begin
  inherited;
  fraTipoGestion.btnIncluirTextoTelefonicoClick(Sender);

end;

procedure TfrmAdministracionTiposGestion.fraTipoGestionbtnIncluirTextoFaxClick(
  Sender: TObject);
begin
  inherited;
  fraTipoGestion.btnIncluirTextoTelefonicoClick(Sender);

end;

end.
