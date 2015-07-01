unit unInvEmisores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmInvEmisores = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    edEmisorAltaModif: TEdit;
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
  frmInvEmisores: TfrmInvEmisores;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs,
  CustomDlgs;

procedure TfrmInvEmisores.ClearControls;
begin
  edEmisorAltaModif.Clear;
end;

function TfrmInvEmisores.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if (ModoABM = maAlta) or (ModoABM = maModificacion) then
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.Add('EM_ID',          GetSecNextVal('INV.SEQ_NEM_ID'));
              Fields.Add('EM_FECHAALTA',       exDateTime);
              Fields.Add('EM_USUALTA',         Sesion.UserID);

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('EM_ID',          sdqConsulta.FieldByName('ID').AsInteger);
              Fields.Add('EM_FECHAMODIF',      exDateTime);
              Fields.Add('EM_USUMODIF',        Sesion.UserID);

              SqlType := stUpdate;
            end;

          Fields.Add('EM_NOMBRE',              Trim(edEmisorAltaModif.Text));
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('EM_ID',              sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('EM_FECHABAJA',           exDateTime);
          Fields.Add('EM_USUBAJA',             Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmInvEmisores.Validar: Boolean;
begin
  Verificar(IsEmptyString(edEmisorAltaModif.Text), edEmisorAltaModif, 'Debe indicar el emisor.');

  Result := True;
end;

procedure TfrmInvEmisores.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NEM_EMISOR';
end;

procedure TfrmInvEmisores.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmInvEmisores.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El emisor ya ha sido dada de baja.');

  inherited;
end;

procedure TfrmInvEmisores.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT EM_NOMBRE NOMBRE, TRUNC(EM_FECHABAJA) FECHA_BAJA, EM_ID ID ' +
            'FROM NEM_EMISOR ' +
           'WHERE 1 = 1';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND EM_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;

  inherited;
end;

procedure TfrmInvEmisores.LoadControls;
begin
  inherited;

end;

end.
