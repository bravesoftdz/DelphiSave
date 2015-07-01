unit unInvFiduciarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmInvFiduciarios = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    edFiduciarioAltaModif: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmInvFiduciarios: TfrmInvFiduciarios;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs,
  CustomDlgs;

procedure TfrmInvFiduciarios.ClearControls;
begin
  edFiduciarioAltaModif.Clear;
end;

function TfrmInvFiduciarios.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if (ModoABM = maAlta) or (ModoABM = maModificacion) then
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.Add('FI_ID',          GetSecNextVal('INV.SEQ_NFI_ID'));
              Fields.Add('FI_FECHAALTA',       exDateTime);
              Fields.Add('FI_USUALTA',         Sesion.UserID);

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('FI_ID',          sdqConsulta.FieldByName('ID').AsInteger);
              Fields.Add('FI_FECHAMODIF',      exDateTime);
              Fields.Add('FI_USUMODIF',        Sesion.UserID);

              SqlType := stUpdate;
            end;

          Fields.Add('FI_NOMBRE',              Trim(edFiduciarioAltaModif.Text));
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('FI_ID',              sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('FI_FECHABAJA',           exDateTime);
          Fields.Add('FI_USUBAJA',             Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmInvFiduciarios.Validar: Boolean;
begin
  Verificar(IsEmptyString(edFiduciarioAltaModif.Text), edFiduciarioAltaModif, 'Debe indicar el fiduciario.');

  Result := True;
end;

procedure TfrmInvFiduciarios.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NFI_FIDUCIARIO';
end;

procedure TfrmInvFiduciarios.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmInvFiduciarios.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El fiduciario ya ha sido dada de baja.');

  inherited;
end;

procedure TfrmInvFiduciarios.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT FI_NOMBRE NOMBRE, TRUNC(FI_FECHABAJA) FECHA_BAJA, FI_ID ID ' +
            'FROM NFI_FIDUCIARIO ' +
           'WHERE 1 = 1';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND FI_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;

  inherited;
end;

procedure TfrmInvFiduciarios.LoadControls;
begin
  inherited;

end;

end.

