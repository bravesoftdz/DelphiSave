unit unImpuestosManEntidadRecaudadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Mask;

type
  TfrmImpuestosManEntidadRecaudadora = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    chkNoMostrarBajas: TCheckBox;
    edIE_NOMBRE: TEdit;
    Label3: TLabel;
    Label1: TLabel;
    edIE_CUIT: TMaskEdit;
    tbSalir2: TToolButton;
    tbCuentasBancarias: TToolButton;
    ToolButton2: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbCuentasBancariasClick(Sender: TObject);
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
  frmImpuestosManEntidadRecaudadora: TfrmImpuestosManEntidadRecaudadora;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, SqlFuncs, unSesion, StrFuncs, General, Cuit,
  unManCCP_CUENTAPAGO;

{$R *.dfm}

procedure TfrmImpuestosManEntidadRecaudadora.ClearControls;
begin
  edIE_NOMBRE.Clear;
  edIE_CUIT.Clear;
end;

procedure TfrmImpuestosManEntidadRecaudadora.LoadControls;
begin
  with sdqConsulta do
    begin
      edIE_NOMBRE.Text       := FieldByName('IE_NOMBRE').AsString;
      edIE_CUIT.Text         := FieldByName('IE_CUIT').AsString;
    end;
end;

function TfrmImpuestosManEntidadRecaudadora.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(IsEmptyString(edIE_NOMBRE.Text), edIE_NOMBRE, 'El nombre es obligatorio.');
  Verificar(IsEmptyString(edIE_CUIT.Text), edIE_CUIT, 'El nro. de CUIT es obligatorio.');
  Verificar(not IsCuit(Trim(edIE_CUIT.Text)), edIE_CUIT, 'El nro de CUIT no es válido.' );

  sSql := 'SELECT 1 ' +
            'FROM CONT.OIE_IMPENTIDAD ' +
           'WHERE IE_FECHABAJA IS NULL ' +
             'AND IE_CUIT = :Cuit ' +
           String(Iif(ModoABM = maModificacion, 'AND IE_ID <> ' + SqlValue(sdqConsulta.FieldByName('ID').AsInteger), ''));
  Verificar(ExisteSqlEx(sSql, [Trim(edIE_CUIT.Text)]), edIE_CUIT, 'El nro de CUIT ya existe.' );

  Result := True;
end;

function TfrmImpuestosManEntidadRecaudadora.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      if ModoABM = maBaja then
        begin
           PrimaryKey.Add('IE_ID',               sdqConsulta.FieldByName('ID').AsInteger);
           Fields.Add('IE_FECHABAJA',            exDateTime);
           Fields.Add('IE_USUBAJA',              Sesion.UserID);

           SqlType := stUpdate;
        end
      else
        begin
           if ModoABM = maAlta then
             begin
               PrimaryKey.Add('IE_ID',           GetSecNextVal('CONT.SEQ_OIE_ID'));
               Fields.Add('IE_FECHAALTA',        exDateTime);
               Fields.Add('IE_USUALTA',          Sesion.UserID);

               SqlType := stInsert;
             end
           else
             begin
               PrimaryKey.Add('IE_ID',           sdqConsulta.FieldByName('ID').AsInteger);
               Fields.Add('IE_FECHAMODIF',       exDateTime);
               Fields.Add('IE_USUMODIF',         Sesion.UserID);

               SqlType := stUpdate;
             end;

           Fields.Add('IE_NOMBRE',               Trim(edIE_NOMBRE.Text));
           Fields.Add('IE_CUIT',                 Trim(edIE_CUIT.Text));
        end;

      Result := inherited DoABM;
    end
end;

procedure TfrmImpuestosManEntidadRecaudadora.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT IE_NOMBRE, IE_CUIT, TRUNC(IE_FECHABAJA) FECHABAJA, IE_ID ID ' +
            'FROM CONT.OIE_IMPENTIDAD ' +
           'WHERE 1 = 1'; 

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND IE_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmImpuestosManEntidadRecaudadora.FormCreate(Sender: TObject);
begin
  inherited;

  SQL.TableName := 'CONT.OIE_IMPENTIDAD';
  FieldBaja     := 'FECHABAJA';
end;

procedure TfrmImpuestosManEntidadRecaudadora.tbLimpiarClick(Sender: TObject);
begin
  chkNoMostrarBajas.Checked := True;

  inherited;
end;
 
procedure TfrmImpuestosManEntidadRecaudadora.tbCuentasBancariasClick( Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');

  with TfrmManCCP_CUENTAPAGO.Create(Self) do
    try
      Execute('IM', Self.sdqConsulta.FieldByName('ID').AsInteger, '', True)
    finally
      Free;
    end
end;

end.

