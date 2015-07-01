unit unManOCR_CALCULORESERVA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, PeriodoPicker, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Mask, PatternEdit,
  IntEdit, ToolEdit, CurrEdit;

type
  TfrmManOCR_CALCULORESERVA = class(TfrmCustomGridABM)
    fraReserva: TfraStaticCTB_TABLAS;
    ppVigenciaDesde: TPeriodoPicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edPeriodos: TIntEdit;
    Label4: TLabel;
    Label5: TLabel;
    edDivisor: TIntEdit;
    edAlicuota: TCurrencyEdit;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbCerrarVigencia: TToolButton;
    fpCerrarVigencia: TFormPanel;
    Label6: TLabel;
    btnAceptarVig: TButton;
    btnCancelarVig: TButton;
    ppVigenciaHasta: TPeriodoPicker;
    procedure FormCreate(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure btnCancelarVigClick(Sender: TObject);
    procedure tbCerrarVigenciaClick(Sender: TObject);
    procedure btnAceptarVigClick(Sender: TObject);
    procedure fpCerrarVigenciaEnter(Sender: TObject);
  private
    function ValidarCerrarVigencia: Boolean;
  public
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
    procedure RefreshData; override;
  end;

var
  frmManOCR_CALCULORESERVA: TfrmManOCR_CALCULORESERVA;

implementation

uses
  CustomDlgs, AnsiSql, General, DbFuncs, unDmPrincipal, unSesion, SqlFuncs;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TfrmManOCR_CALCULORESERVA.ClearControls;
begin
  fraReserva.Clear;
  edPeriodos.Clear;
  edAlicuota.Clear;
  edDivisor.Clear;
  ppVigenciaDesde.Clear;
end;
{------------------------------------------------------------------------------}
function TfrmManOCR_CALCULORESERVA.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add( 'CR_ID',        'SEQ_OCR_ID.NEXTVAL', False );
      Sql.Fields.Add( 'CR_RESERVA',       fraReserva.Value );
      Sql.Fields.Add( 'CR_PERIODOS',      edPeriodos.Value );
      Sql.Fields.Add( 'CR_ALICUOTA',      edAlicuota.Value );
      Sql.Fields.Add( 'CR_DIVISOR',       edDivisor.Value );
      Sql.Fields.Add( 'CR_VIGENCIADESDE', ppVigenciaDesde.Periodo.Valor );

      Sql.Fields.Add( 'CR_USUALTA',       Sesion.UserId );
      Sql.Fields.Add( 'CR_FECHAALTA',     exDateTime );
    end
  else if ModoABM = maBaja Then
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add( 'CR_ID',        sdqConsulta.FieldByName('ID').AsInteger );
      Sql.Fields.Add( 'CR_USUBAJA',       Sesion.UserId );
      Sql.Fields.Add( 'CR_FECHABAJA',     exDateTime );
    end;

  Result := inherited DoABM;
end;
{------------------------------------------------------------------------------}
procedure TfrmManOCR_CALCULORESERVA.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'OCR_CALCULORESERVA';

  fraReserva.Clave := 'CORES';
end;
{------------------------------------------------------------------------------}
procedure TfrmManOCR_CALCULORESERVA.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.FieldByName( 'FECHA_CIERRE' ).IsNull then
    AFont.Color := clNavy;

  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmManOCR_CALCULORESERVA.LoadControls;
begin
  { No esta permitido modificar registros en este ABM, este método está definido para que no produzca un Hint }
end;
{------------------------------------------------------------------------------}
function TfrmManOCR_CALCULORESERVA.Validar: Boolean;
var
  sSql: String;
begin
  Verificar( fraReserva.IsEmpty, fraReserva.edCodigo, 'La reserva es obligatoria' );
  Verificar( edPeriodos.Value <= 0, edPeriodos, 'La cantidad de periodos es obligatoria' );
  Verificar( edAlicuota.Value <= 0, edAlicuota, 'La alícuota es obligatoria' );
  Verificar( edDivisor.Value <= 0, edDivisor, 'El divisor es obligatorio' );
  Verificar( ppVigenciaDesde.Periodo.IsNull, ppVigenciaDesde, 'La vigencia desde es obligatoria' );

  sSql := 'SELECT 1 ' +
            'FROM OCR_CALCULORESERVA ' +
           'WHERE CR_FECHABAJA IS NULL ' +
             'AND CR_RESERVA = :Reserva ' +
             'AND :VigenciaDesde BETWEEN CR_VIGENCIADESDE AND NVL(CR_VIGENCIAHASTA, ''999999'')';
  Verificar( ExisteSqlEx( sSql, [fraReserva.Value, ppVigenciaDesde.Periodo.Valor] ), ppVigenciaDesde, 'Ya existe una reserva activa con periodos incluidos en la vigencia desde ingresada' );

  sSql := 'SELECT 1 ' +
            'FROM OCR_CALCULORESERVA ' +
           'WHERE CR_FECHABAJA IS NULL ' +
             'AND CR_RESERVA = :Reserva ' +
             'AND CR_VIGENCIADESDE BETWEEN :VigenciaDesde AND ''999999''';
  Verificar( ExisteSqlEx( sSql, [fraReserva.Value, ppVigenciaDesde.Periodo.Valor] ), ppVigenciaDesde, 'Ya existe una reserva activa posterior a la vigencia desde ingresada' );

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmManOCR_CALCULORESERVA.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName( 'ALICUOTA' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'ALICUOTA' ) ).DisplayFormat := '% 0.000;-% 0.000';
end;
{------------------------------------------------------------------------------}
procedure TfrmManOCR_CALCULORESERVA.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT CR_RESERVA RESERVA, TB_DESCRIPCION NOMBRE, CR_PERIODOS PERIODOS, CR_ALICUOTA ALICUOTA, ' +
                 'CR_DIVISOR DIVISOR, CR_VIGENCIADESDE VIGENCIA_DESDE, CR_VIGENCIAHASTA VIGENCIA_HASTA, ' +
                 'TRUNC(CR_FECHACIERRE) FECHA_CIERRE, TRUNC(CR_FECHABAJA) FECHA_BAJA, CR_ID ID ' +
            'FROM CTB_TABLAS, OCR_CALCULORESERVA ' +
           'WHERE TB_CODIGO = CR_RESERVA ' +
             'AND TB_CLAVE = ''CORES'' ';

  sdqConsulta.Sql.Text := sSql + ' ' + SortDialog.OrderBy;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmManOCR_CALCULORESERVA.btnCancelarVigClick(Sender: TObject);
begin
  fpCerrarVigencia.ModalResult := mrCancel;
end;
{------------------------------------------------------------------------------}
procedure TfrmManOCR_CALCULORESERVA.tbCerrarVigenciaClick(Sender: TObject);
begin
  if ValidarCerrarVigencia then
    if fpCerrarVigencia.ShowModal = mrOk then
      if not ppVigenciaHasta.Periodo.IsNull then
        RefreshData;
end;
{------------------------------------------------------------------------------}
function TfrmManOCR_CALCULORESERVA.ValidarCerrarVigencia: Boolean;
begin
  Verificar( not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay registros en la grilla' );
  Verificar( not sdqConsulta.FieldByName('VIGENCIA_HASTA').IsNull, Grid, 'La vigencia ya se encuentra cerrada' );
  Verificar( not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, Grid, 'El registro se encuentra dado de baja' );

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmManOCR_CALCULORESERVA.btnAceptarVigClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar( ppVigenciaHasta.Periodo.IsNull, ppVigenciaHasta, 'Debe ingresar la vigencia hasta' );
  Verificar( ppVigenciaHasta.Periodo.Valor < sdqConsulta.FieldByName('VIGENCIA_DESDE').AsString, ppVigenciaHasta, 'La vigencia hasta debe ser mayor o igual a la vigencia desde' );

  sSql := 'UPDATE OCR_CALCULORESERVA ' +
             'SET CR_VIGENCIAHASTA = :VigenciaHasta, ' +
                 'CR_FECHACIERRE = SYSDATE, ' +
                 'CR_USUCIERRE = :Usuario ' +
           'WHERE CR_ID = :Id';
  EjecutarSqlEx( sSql, [ppVigenciaHasta.Periodo.Valor, Sesion.UserId, sdqConsulta.FieldByName('ID').AsInteger] );

  fpCerrarVigencia.ModalResult := mrOk;
end;
{------------------------------------------------------------------------------}
procedure TfrmManOCR_CALCULORESERVA.fpCerrarVigenciaEnter(Sender: TObject);
begin
  ppVigenciaHasta.Clear;
end;
{------------------------------------------------------------------------------}
end.

