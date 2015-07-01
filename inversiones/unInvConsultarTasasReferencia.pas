unit unInvConsultarTasasReferencia;

interface

uses
  {$IFDEF VER150} Placemnt, {$ELSE} rxPlacemnt, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmInvConsultarTasasReferencia = class(TfrmCustomGridABM)
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    edNombre: TEdit;
    chkCalculoAutInt: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
  public
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmInvConsultarTasasReferencia: TfrmInvConsultarTasasReferencia;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, DbFuncs, General, CustomDlgs, SqlFuncs, StrFuncs,
  VCLExtra;

procedure TfrmInvConsultarTasasReferencia.ClearControls;
begin
  edNombre.Clear;
  chkCalculoAutInt.Checked := False;
end;

function TfrmInvConsultarTasasReferencia.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maAlta then
        begin
          PrimaryKey.Add('TR_ID',            GetSecNextVal('INV.SEQ_NTR_ID'));
          Fields.Add('TR_FECHAALTA',         exDateTime);
          Fields.Add('TR_USUALTA',           Sesion.UserID);
          Fields.Add('TR_NOMBRE',            Trim(edNombre.Text));
          Fields.Add('TR_CALCULAINTERES',    String(Iif(chkCalculoAutInt.Checked, 'S', 'N')));

          SqlType := stInsert;
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('TR_ID',            sdqConsulta.FieldByName('CODIGO').AsInteger);
          Fields.Add('TR_FECHABAJA',         exDateTime);
          Fields.Add('TR_USUBAJA',           Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

procedure TfrmInvConsultarTasasReferencia.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT TR_ID CODIGO, TR_NOMBRE NOMBRE, TR_CALCULAINTERES CALCULA_INTERES, ' +
                 'TR_FECHABAJA FECHA_BAJA ' +
            'FROM NTR_TASAREFERENCIA ' +
           'WHERE 1 = 1';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND TR_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;
  inherited;
end;

function TfrmInvConsultarTasasReferencia.Validar: Boolean;
begin
  Verificar(IsEmptyString(edNombre.Text), edNombre, 'Debe indicar el nombre de la tasa de referencia.');

  Result := True;
end;

procedure TfrmInvConsultarTasasReferencia.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NTR_TASAREFERENCIA';
end;

end.
