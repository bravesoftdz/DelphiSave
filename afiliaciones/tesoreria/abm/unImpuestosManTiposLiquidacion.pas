unit unImpuestosManTiposLiquidacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmImpuestosManTiposLiquidacion = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    chkNoMostrarBajas: TCheckBox;
    edIT_DESCRIPCION: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  public
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmImpuestosManTiposLiquidacion: TfrmImpuestosManTiposLiquidacion;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, SqlFuncs, unSesion, StrFuncs, General;

{$R *.dfm}

procedure TfrmImpuestosManTiposLiquidacion.ClearControls;
begin
  edIT_DESCRIPCION.Clear;
end;

procedure TfrmImpuestosManTiposLiquidacion.LoadControls;
begin
  with sdqConsulta do
    edIT_DESCRIPCION.Text := FieldByName('IT_DESCRIPCION').AsString;
end;

function TfrmImpuestosManTiposLiquidacion.Validar: Boolean;
begin
  Verificar(IsEmptyString(edIT_DESCRIPCION.Text), edIT_DESCRIPCION, 'El tipo de liquidación es obligatorio.');

  Result := True;
end;

function TfrmImpuestosManTiposLiquidacion.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      if ModoABM = maBaja then
        begin
           PrimaryKey.Add('IT_ID',               sdqConsulta.FieldByName('ID').AsInteger);
           Fields.Add('IT_FECHABAJA',            exDateTime);
           Fields.Add('IT_USUBAJA',              Sesion.UserID);

           SqlType := stUpdate;
        end
      else
        begin
           if ModoABM = maAlta then
             begin
               PrimaryKey.Add('IT_ID',           GetSecNextVal('CONT.SEQ_OIT_ID'));
               Fields.Add('IT_FECHAALTA',        exDateTime);
               Fields.Add('IT_USUALTA',          Sesion.UserID);

               SqlType := stInsert;
             end
           else
             begin
               PrimaryKey.Add('IT_ID',           sdqConsulta.FieldByName('ID').AsInteger);
               Fields.Add('IT_FECHAMODIF',       exDateTime);
               Fields.Add('IT_USUMODIF',         Sesion.UserID);

               SqlType := stUpdate;
             end;
                    
           Fields.Add('IT_DESCRIPCION',          Trim(edIT_DESCRIPCION.Text));
        end;

      Result := inherited DoABM;
    end
end;

procedure TfrmImpuestosManTiposLiquidacion.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT IT_DESCRIPCION, TRUNC(IT_FECHABAJA) FECHABAJA, IT_ID ID ' +
            'FROM CONT.OIT_IMPTIPO ' +
           'WHERE 1 = 1';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND IT_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmImpuestosManTiposLiquidacion.FormCreate(Sender: TObject);
begin
  inherited;

  SQL.TableName := 'CONT.OIT_IMPTIPO';
  FieldBaja     := 'FECHABAJA';
end;

procedure TfrmImpuestosManTiposLiquidacion.tbLimpiarClick(Sender: TObject);
begin
  chkNoMostrarBajas.Checked := True;

  inherited;
end;

end.

