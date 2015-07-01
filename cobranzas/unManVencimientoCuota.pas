unit unManVencimientoCuota;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   09-09-2003
 ULTIMA MODIFICACION: 09-09-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, PatternEdit, PeriodoPicker, Mask, ToolEdit,
  DateComboBox, RxToolEdit, RxPlacemnt, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraTipoRegimen;

type
  TfrmManVencimientoCuota = class(TfrmCustomGridABM)
    cmbVC_VENCIMIENTO: TDateComboBox;
    edVC_DIGITO: TPatternEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    gbPeriodo: TGroupBox;
    edVC_PERIODODesde: TPeriodoPicker;
    Label4: TLabel;
    edVC_PERIODOHasta: TPeriodoPicker;
    Label5: TLabel;
    gbDigito: TGroupBox;
    edDigito: TPatternEdit;
    Label6: TLabel;
    edVC_PERIODO: TPeriodoPicker;
    fraVC_IDTIPOREGIMEN: TfraTipoRegimen;
    Label7: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmManVencimientoCuota: TfrmManVencimientoCuota;

implementation
{$R *.DFM}

uses
  unPrincipal, unDmPrincipal, StrFuncs, CustomDlgs, SqlFuncs, AnsiSql, General;

procedure TfrmManVencimientoCuota.tbRefrescarClick(Sender: TObject);
var
  sSql: string;
  sWhere: string;
begin
  sSql := 'SELECT VC_ID, VC_PERIODO, VC_DIGITO, VC_VENCIMIENTO, VC_USUALTA, TRUNC(VC_FECHAALTA) VC_FECHAALTA, ' +
          '       VC_FECHAMODIF, VC_USUMODIF, VC_IDTIPOREGIMEN, TR_DESCRIPCION REGIMEN ' +
          '  FROM ZVC_VENCIMIENTOCUOTA, ATR_TIPOREGIMEN ' +
          ' WHERE VC_FECHABAJA IS NULL ' +
          '   AND VC_IDTIPOREGIMEN = TR_ID ';
  sdqConsulta.SQL.Clear;

  sWhere := '';
  if not edVC_PERIODODesde.Periodo.IsNull then
    sWhere := sWhere + ' AND VC_PERIODO >= ' + SqlValue(edVC_PERIODODesde.Periodo.Valor);
  if not edVC_PERIODOHasta.Periodo.IsNull then
    sWhere := sWhere + ' AND VC_PERIODO <= ' + SqlValue(edVC_PERIODOHasta.Periodo.Valor);

  edDigito.Text := Trim(edDigito.Text);
  if (edDigito.Text <> '') then
    sWhere := sWhere + ' AND VC_DIGITO = ' + SqlValue(edDigito.Text);

  sdqConsulta.Sql.Add(sSql + sWhere + SortDialog.OrderBy);
  inherited;
end;

procedure TfrmManVencimientoCuota.ClearControls;
begin
  cmbVC_VENCIMIENTO.Clear;
  edVC_PERIODO.Clear;
  edVC_DIGITO.Clear;
  fraVC_IDTIPOREGIMEN.Clear;
end;

procedure TfrmManVencimientoCuota.LoadControls;
begin
  cmbVC_VENCIMIENTO.Date     := sdqConsulta.FieldByName('VC_VENCIMIENTO').AsDateTime;
  edVC_PERIODO.Periodo.Valor := sdqConsulta.FieldByName('VC_PERIODO').AsString;
  edVC_DIGITO.Text           := sdqConsulta.FieldByName('VC_DIGITO').AsString;
  fraVC_IDTIPOREGIMEN.Value  := sdqConsulta.FieldByName('VC_IDTIPOREGIMEN').AsInteger;
end;

function TfrmManVencimientoCuota.Validar : Boolean;
var
  sSql, Vencimiento: string;
  bVerificarPer: Boolean;
begin
  Verificar(edVC_PERIODO.Periodo.IsNull, edVC_PERIODO, 'El período es obligatorio.');
  Verificar(edVC_DIGITO.Text = '', edVC_DIGITO, 'El dígito es obligatorio.');
  Verificar(cmbVC_VENCIMIENTO.IsEmpty, cmbVC_VENCIMIENTO, 'El vencimiento es obligatorio.');

  Vencimiento := FormatDateTime('yyyymm', IncMonth(cmbVC_VENCIMIENTO.Date, -1));
  Verificar(Vencimiento <> edVC_PERIODO.Periodo.Valor, cmbVC_VENCIMIENTO, 'El vencimiento debe corresponder al mes siguiente del período.');

  Verificar(fraVC_IDTIPOREGIMEN.IsEmpty, fraVC_IDTIPOREGIMEN, 'El régimen es obligatorio.');

  bVerificarPer := ((ModoABM = maAlta) or ((ModoABM = maModificacion) and ((sdqConsulta.FieldByName('VC_DIGITO').AsString <> edVC_DIGITO.Text) or (sdqConsulta.FieldByName('VC_PERIODO').AsString <> edVC_PERIODO.Periodo.Valor) or (sdqConsulta.FieldByName('VC_IDTIPOREGIMEN').AsInteger <> fraVC_IDTIPOREGIMEN.Value))));
  if bVerificarPer then
    begin
      sSql := 'SELECT 1 ' +
              '  FROM ZVC_VENCIMIENTOCUOTA ' +
              ' WHERE VC_DIGITO = ' + SqlValue(edVC_DIGITO.Text) +
              '   AND VC_PERIODO = ' + SqlValue(edVC_PERIODO.Periodo.Valor) +
              '   AND VC_IDTIPOREGIMEN = ' + SqlValue(fraVC_IDTIPOREGIMEN.Value) +
              '   AND VC_FECHABAJA IS NULL ' +
              Iif(ModoABM = maModificacion, 'AND VC_ID <> ' + SqlValue(sdqConsulta.FieldByName('VC_ID').AsInteger), '');
      Verificar(ExisteSql(sSql), edVC_PERIODO, 'El período, dígito verificador y régimen ingresados ya existen.');
    end;

  Result := True;
end;

function TfrmManVencimientoCuota.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      TableName := 'ZVC_VENCIMIENTOCUOTA';

      if ModoABM = maBaja then
        begin
          PrimaryKey.Add('VC_ID',           sdqConsulta.FieldByName('VC_ID').AsInteger);
          Fields.Add('VC_FECHABAJA',        exDate);
          Fields.Add('VC_USUBAJA',          frmPrincipal.DBLogin.UserID);

          SqlType := stUpdate;
        end
      else
        begin
          if ModoABM = maAlta then
            begin
               PrimaryKey.Add('VC_ID',      'SEQ_ZVC_ID.NEXTVAL', False);
               Fields.Add('VC_FECHAALTA',   exDate);
               Fields.Add('VC_USUALTA',     frmPrincipal.DBLogin.UserID);

               SqlType := stInsert;
             end
          else
            begin
               PrimaryKey.Add( 'VC_ID',     sdqConsulta.FieldByName('VC_ID').AsInteger);
               Fields.Add('VC_FECHAMODIF',  exDate);
               Fields.Add('VC_USUMODIF',    frmPrincipal.DBLogin.UserID);

               SqlType := stUpdate;
             end;

          Fields.Add('VC_VENCIMIENTO',      cmbVC_VENCIMIENTO.Date);
          Fields.Add('VC_PERIODO',          edVC_PERIODO.Periodo.Valor);
          Fields.Add('VC_DIGITO',           edVC_DIGITO.Text);
          Fields.Add('VC_IDTIPOREGIMEN',    fraVC_IDTIPOREGIMEN.Value);
        end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmManVencimientoCuota.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edVC_PERIODODesde.Clear;
  edVC_PERIODOHasta.Clear;
  edDigito.Clear;
end;

procedure TfrmManVencimientoCuota.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;
end;

end.

