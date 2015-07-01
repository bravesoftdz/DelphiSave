unit unConceptosGBPBA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmConceptosGBPBA = class(TfrmCustomGridABM)
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    edConceptoCarga: TEdit;
    rgSignoCarga: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  public
  protected
    procedure ClearControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmConceptosGBPBA: TfrmConceptosGBPBA;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, SqlFuncs, unSesion, StrFuncs, General;

  {$R *.dfm}

procedure TfrmConceptosGBPBA.ClearControls;
begin
  edConceptoCarga.Clear;
  rgSignoCarga.ItemIndex := -1;
end;

function TfrmConceptosGBPBA.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
    begin
       Sql.PrimaryKey.Add('GC_ID',               sdqConsulta.FieldByName('ID').AsInteger);
       Sql.Fields.Add('GC_FECHABAJA',            exDateTime);
       Sql.Fields.Add('GC_USUBAJA',              Sesion.UserID);

       Sql.SqlType := stUpdate;
    end
  else
    begin
       if ModoABM = maAlta then
         begin
           Sql.PrimaryKey.Add('GC_ID',           GetSecNextVal('SEQ_OGC_ID'));
           Sql.Fields.Add('GC_FECHAALTA',        exDateTime);
           Sql.Fields.Add('GC_USUALTA',          Sesion.UserID);

           Sql.SqlType := stInsert;
         end;

       Sql.Fields.Add('GC_DESCRIPCION',          Trim(edConceptoCarga.Text));
       Sql.Fields.Add('GC_SIGNO',                Integer(Iif(rgSignoCarga.ItemIndex = 0, -1, 1)));
    end;

  Result := inherited DoABM;
end;

function TfrmConceptosGBPBA.Validar: Boolean;
begin
  Verificar(IsEmptyString(edConceptoCarga.Text), edConceptoCarga, 'El concepto es obligatorio.');
  Verificar(rgSignoCarga.ItemIndex = -1, nil, 'El campo signo es obligatorio.');

  Result := True;
end;

procedure TfrmConceptosGBPBA.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'OGC_GPBACONCEPTO';
  FieldBaja     := 'FECHA_BAJA';

  ShowActived := False;
end;

procedure TfrmConceptosGBPBA.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT GC_DESCRIPCION CONCEPTO, DECODE(GC_SIGNO, -1, ''(-)'', ''(+)'') SIGNO, ' +
                 'TRUNC(GC_FECHABAJA) FECHA_BAJA, GC_ID ID ' +
            'FROM OGC_GPBACONCEPTO ' +
           'WHERE 1 = 1';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND GC_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmConceptosGBPBA.tbLimpiarClick(Sender: TObject);
begin
  chkNoMostrarBajas.Checked := True;

  inherited;
end;

end.
 