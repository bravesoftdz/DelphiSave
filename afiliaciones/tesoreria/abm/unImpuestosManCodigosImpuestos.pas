unit unImpuestosManCodigosImpuestos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmImpuestosManCodigosImpuestos = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    chkNoMostrarBajas: TCheckBox;
    edIM_DESCRIPCION: TEdit;
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
  frmImpuestosManCodigosImpuestos: TfrmImpuestosManCodigosImpuestos;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, SqlFuncs, unSesion, StrFuncs, General;

{$R *.dfm}

procedure TfrmImpuestosManCodigosImpuestos.ClearControls;
begin
  edIM_DESCRIPCION.Clear;
end;

procedure TfrmImpuestosManCodigosImpuestos.LoadControls;
begin
  with sdqConsulta do
    edIM_DESCRIPCION.Text := FieldByName('IM_DESCRIPCION').AsString;
end;

function TfrmImpuestosManCodigosImpuestos.Validar: Boolean;
begin
  Verificar(IsEmptyString(edIM_DESCRIPCION.Text), edIM_DESCRIPCION, 'El código de impuesto es obligatorio.');

  Result := True;
end;

function TfrmImpuestosManCodigosImpuestos.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      if ModoABM = maBaja then
        begin
           PrimaryKey.Add('IM_ID',               sdqConsulta.FieldByName('ID').AsInteger);
           Fields.Add('IM_FECHABAJA',            exDateTime);
           Fields.Add('IM_USUBAJA',              Sesion.UserID);

           SqlType := stUpdate;
        end
      else
        begin
           if ModoABM = maAlta then
             begin
               PrimaryKey.Add('IM_ID',           GetSecNextVal('CONT.SEQ_OIM_ID'));
               Fields.Add('IM_FECHAALTA',        exDateTime);
               Fields.Add('IM_USUALTA',          Sesion.UserID);

               SqlType := stInsert;
             end
           else
             begin
               PrimaryKey.Add('IM_ID',           sdqConsulta.FieldByName('ID').AsInteger);
               Fields.Add('IM_FECHAMODIF',       exDateTime);
               Fields.Add('IM_USUMODIF',         Sesion.UserID);

               SqlType := stUpdate;
             end;

           Fields.Add('IM_DESCRIPCION',          Trim(edIM_DESCRIPCION.Text));
        end;

      Result := inherited DoABM;
    end
end;

procedure TfrmImpuestosManCodigosImpuestos.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT IM_DESCRIPCION, TRUNC(IM_FECHABAJA) FECHABAJA, IM_ID ID ' +
            'FROM CONT.OIM_IMPUESTO ' +
           'WHERE 1 = 1';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND IM_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmImpuestosManCodigosImpuestos.FormCreate(Sender: TObject);
begin
  inherited;

  SQL.TableName := 'CONT.OIM_IMPUESTO';
  FieldBaja     := 'FECHABAJA';
end;

procedure TfrmImpuestosManCodigosImpuestos.tbLimpiarClick(Sender: TObject);
begin
  chkNoMostrarBajas.Checked := True;

  inherited;
end;

end.

