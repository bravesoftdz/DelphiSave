unit unManRedondeosEmision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, FormPanel, unCustomGridABM, Provider,
  DBClient, Mask, ToolEdit, CurrEdit, DateComboBox;

type
  TfrmManRedondeosEmision = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    GridRecepCarpeta: TDBGrid;
    dsRedondeos: TDataSource;
    cdsRedondeos: TClientDataSet;
    dspRedondeos: TDataSetProvider;
    sdqRedondeos: TSDQuery;
    sdqRedondeosRO_DESDE: TFloatField;
    sdqRedondeosRO_HASTA: TFloatField;
    sdqRedondeosRO_REDONDEO: TFloatField;
    cdsRedondeosRO_DESDE: TFloatField;
    cdsRedondeosRO_HASTA: TFloatField;
    cdsRedondeosRO_REDONDEO: TFloatField;
    gbRedondeos: TGroupBox;
    edImporteHasta: TCurrencyEdit;
    Label1: TLabel;
    chkRangoInicial: TCheckBox;
    Label2: TLabel;
    edImporteRedondeo: TCurrencyEdit;
    chkRangoFinal: TCheckBox;
    btnInsertar: TButton;
    edVigenciaDesde: TDateComboBox;
    Label3: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInsertarClick(Sender: TObject);
    procedure cdsRedondeosAfterOpen(DataSet: TDataSet);
    procedure chkRangoFinalClick(Sender: TObject);
  private
    pUltImporteHasta: Currency;
    procedure DoInsertarRegRedondeo(Desde, Hasta, Redondeo: Currency);
    function ValidarInsertarReg: Boolean;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmManRedondeosEmision: TfrmManRedondeosEmision;

Const
  CodigoRedondeo: String = '599';

implementation

{$R *.dfm}

uses
  CustomDlgs, VCLExtra, unDmPrincipal, unSesion, SqlFuncs, AnsiSql, unArt;

procedure TfrmManRedondeosEmision.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT RO_DESDE, RO_HASTA, RO_REDONDEO, RO_VIGENCIADESDE ' +
            'FROM ZRO_REDONDEOEMISION ' +
           'ORDER BY RO_VIGENCIADESDE DESC, RO_DESDE';

  sdqConsulta.SQL.Text := sSql;

  inherited;
end;

procedure TfrmManRedondeosEmision.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('RO_DESDE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('RO_DESDE')).Currency := True;

  if sdqConsulta.FieldByName('RO_HASTA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RO_HASTA')).Currency := True;

  if sdqConsulta.FieldByName('RO_REDONDEO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RO_REDONDEO')).Currency := True;
end;

procedure TfrmManRedondeosEmision.FormCreate(Sender: TObject);
begin
  inherited;

  tbRefrescarClick(Nil);
end;

procedure TfrmManRedondeosEmision.ClearControls;
begin
  cdsRedondeos.Close;
  cdsRedondeos.Open;
  sdqRedondeos.Close;

  pUltImporteHasta := 0;

  edImporteHasta.Clear;
  edImporteRedondeo.Clear;
  edVigenciaDesde.Clear;

  chkRangoInicial.Enabled := False;
  chkRangoInicial.Checked := True;

  chkRangoFinal.Enabled := False;
  chkRangoFinal.Checked := False;

  VCLExtra.LockControl(btnInsertar, False);
  chkRangoFinalClick(Nil);
end;

function TfrmManRedondeosEmision.DoABM: Boolean;
var
  sSql: String;
  IdCodRedondeo: TTableId;
begin
  BeginTrans;
  try
    sSql := 'SELECT COBRANZA.GETIDCODIGOMOVIMIENTO(:CodigoRedondeo) FROM DUAL';
    IdCodRedondeo := ValorSqlIntegerEx(sSql, [CodigoRedondeo]);

    with cdsRedondeos do
      begin
        First;

        while not Eof do
          begin
            Sql.Clear;
            Sql.TableName := 'ZRO_REDONDEOEMISION';

            Sql.Fields.Add('RO_DESDE',               FieldByName('RO_DESDE').AsCurrency, dtNumber);
            Sql.Fields.Add('RO_HASTA',               FieldByName('RO_HASTA').AsCurrency, 2, True);
            Sql.Fields.Add('RO_REDONDEO',            FieldByName('RO_REDONDEO').AsCurrency, dtNumber);
            Sql.Fields.Add('RO_VIGENCIADESDE',       edVigenciaDesde.Date);
            Sql.Fields.Add('RO_CODIGOREDONDEO',      CodigoRedondeo);
            Sql.Fields.Add('RO_IDCODIGOMOVIMIENTO',  IdCodRedondeo, dtNumber);
            Sql.Fields.Add('RO_USUALTA',             Sesion.UserID);
            Sql.Fields.Add('RO_FECHAALTA',           SQL_ACTUALDATE, False);

            Sql.SqlType := stInsert;
            EjecutarSqlST(Sql.Sql);

            Next;
          end;
      end;

    CommitTrans;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);

    Result := True;
  except
    on E:Exception do
    begin
      Rollback;
      Raise Exception.Create( E.Message );
    end;
  end;
end;

procedure TfrmManRedondeosEmision.LoadControls;
begin
  inherited;
end;

function TfrmManRedondeosEmision.Validar: Boolean;
var
  bUltimo: Boolean;
begin
  bUltimo := False;
  cdsRedondeos.First;

  Verificar(cdsRedondeos.Eof, nil, 'No ha cargado ningún redondeo.');

  while not cdsRedondeos.Eof do
    begin
      bUltimo := cdsRedondeos.FieldByName('RO_HASTA').IsNull;

      cdsRedondeos.Next;
    end;

  Verificar(not bUltimo, nil, 'Falta el redondeo final.');

  Result := True;
end;

procedure TfrmManRedondeosEmision.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  cdsRedondeos.Close;
end;

procedure TfrmManRedondeosEmision.DoInsertarRegRedondeo(Desde, Hasta, Redondeo: Currency);
begin
  with cdsRedondeos do
    begin
      Append;

      FieldByName('RO_DESDE').AsCurrency    := Desde;
      if Hasta <> 0 then
        FieldByName('RO_HASTA').AsCurrency  := Hasta;
      FieldByName('RO_REDONDEO').AsCurrency := Redondeo;

      Post;
    end;
end;

procedure TfrmManRedondeosEmision.btnInsertarClick(Sender: TObject);
var
  RedondeoFinal, Desde, Hasta: Currency;
begin
  if ValidarInsertarReg then
    begin
      if not chkRangoInicial.Checked and not chkRangoFinal.Checked then
         begin
           Desde := pUltImporteHasta + 0.01;
           Hasta := edImporteHasta.Value;
           DoInsertarRegRedondeo(Desde, Hasta, edImporteRedondeo.Value);
         end
       else if chkRangoInicial.Checked and not chkRangoFinal.Checked then
         begin
           Desde := 0.01;
           Hasta := edImporteHasta.Value;
           DoInsertarRegRedondeo(Desde, Hasta, edImporteRedondeo.Value);

           chkRangoInicial.Checked := False;
           chkRangoFinal.Enabled   := True;
         end
       else if not chkRangoInicial.Checked and chkRangoFinal.Checked then
         begin
           RedondeoFinal := InputBoxCurrency('Alta de Redondeos de Emisión', 'Ingrese el importe de redondeo del rango final', 0);
           if RedondeoFinal >= 0 then
             begin
               Desde := pUltImporteHasta + 0.01;
               Hasta := edImporteHasta.Value;
               DoInsertarRegRedondeo(Desde, Hasta, edImporteRedondeo.Value);

               Desde := edImporteHasta.Value + 0.01;
               Hasta := 0;
               DoInsertarRegRedondeo(Desde, Hasta, RedondeoFinal);

               VCLExtra.LockControl(btnInsertar);
             end
           else
             Exit;
         end
       else
         begin
           Desde := 0.01;
           Hasta := 0;
           DoInsertarRegRedondeo(Desde, Hasta, edImporteRedondeo.Value);
         end;

      pUltImporteHasta := edImporteHasta.Value;
    end;
end;

function TfrmManRedondeosEmision.ValidarInsertarReg: Boolean;
begin
  Verificar(((not chkRangoInicial.Checked and not chkRangoFinal.Checked) or (chkRangoInicial.Checked and not chkRangoFinal.Checked) or (not chkRangoInicial.Checked and chkRangoFinal.Checked)) and (edImporteHasta.Value = 0), edImporteHasta, 'Debe indicar el importe hasta.');
  Verificar((edImporteHasta.Value <> 0) and (pUltImporteHasta >= edImporteHasta.Value), edImporteHasta, 'El importe hasta debe ser mayor al importe hasta anterior.');
  Verificar(chkRangoFinal.Checked and edVigenciaDesde.IsEmpty, edVigenciaDesde, 'Debe indicar la vigencia desde.');
  Verificar(chkRangoFinal.Checked and (edVigenciaDesde.Date < DBDate()), edVigenciaDesde, 'La vigencia desde no puede ser menor a la fecha actual.');

  Result := True;
end;

procedure TfrmManRedondeosEmision.cdsRedondeosAfterOpen(DataSet: TDataSet);
begin
  if cdsRedondeos.FieldByName('RO_DESDE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(cdsRedondeos.FieldByName('RO_DESDE')).Currency := True;

  if cdsRedondeos.FieldByName('RO_HASTA') is TFloatField then
    TFloatField(cdsRedondeos.FieldByName('RO_HASTA')).Currency := True;

  if cdsRedondeos.FieldByName('RO_REDONDEO') is TFloatField then
    TFloatField(cdsRedondeos.FieldByName('RO_REDONDEO')).Currency := True;
end;

procedure TfrmManRedondeosEmision.chkRangoFinalClick(Sender: TObject);
begin
  VCLExtra.LockControl(edVigenciaDesde, not chkRangoFinal.Checked);

  edVigenciaDesde.Clear;
end;

end.

