unit unGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, Mask, ToolEdit, CurrEdit, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, DateComboBox;

type
  TfrmGastos = class(TfrmCustomGridABM)
    lblGasto: TLabel;
    Label10: TLabel;
    edImporte: TCurrencyEdit;
    Label2: TLabel;
    fraGasto: TfraCodigoDescripcion;
    Label1: TLabel;
    edFechaRequerida: TDateComboBox;
    edObservaciones: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
  private
    { Private declarations }
    IDInstancia : Integer;
    IDJuicio : Integer;
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
    procedure Load(juicio : Integer);
  end;

var
  frmGastos: TfrmGastos;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs, AnsiSql;

procedure TfrmGastos.ClearControls;
begin
  inherited;
  fraGasto.Clear;
  edImporte.Clear;
  edObservaciones.Clear;
  edFechaRequerida.Clear;
end;

function TfrmGastos.DoABM: Boolean;
var
  iIdCodigo, iIdImporteJuicio: Integer;
begin
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('GJ_ID').AsInteger;
      Sql.Fields.Add('GJ_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('GJ_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('GJ_IDTIPOGASTO', fraGasto.Codigo);
      Sql.Fields.Add('GJ_IMPORTE', edImporte.Text);
      Sql.Fields.Add('GJ_DETALLE', edObservaciones.Text);
      Sql.Fields.Add('GJ_FECHAREQUERIDA', edFechaRequerida.date);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('LEGALES.SEQ_LGJ_ID');
        Sql.Fields.Add('GJ_USUALTA', Sesion.UserID );
        Sql.Fields.Add('GJ_FECHAALTA', exDateTime );
        iIdImporteJuicio := GetSecNextVal('LEGALES.SEQ_LIR_ID');
        EjecutarSqlST(
          ' INSERT INTO legales.lir_importesreguladosjuicio '+
          '   (ir_id, ir_idjuicioentramite, ir_importe, '+
          '    ir_detalle, ir_aplicacion, ir_usualta, ir_fechaalta, '+
          '    ir_idinstancia '+
          '  ) '+
          ' VALUES ('+SqlValue(iIdImporteJuicio)+' , '+SqlValue(IDJuicio)+', '+SqlValue(edImporte.Text)+', '+
             SqlValue(fraGasto.Descripcion)+', ''G'' ,'+SqlValue(Sesion.UserID)+', SYSDATE, '+
             SqlValue(IDInstancia)+')');
        Sql.Fields.Add('GJ_IDIMPORTESJUICIO', iIdImporteJuicio );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('GJ_ID').AsInteger;
        Sql.Fields.Add('GJ_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('GJ_FECHAMODIF', exDateTime );
        Sql.Fields.Add('GJ_USUBAJA', exNull );
        Sql.Fields.Add('GJ_FECHABAJA', exNull );
        EjecutarSql(
          'UPDATE legales.lir_importesreguladosjuicio '+
          '   SET ir_importe    = '+SqlValue(edImporte.Text)+', '+
          '       ir_usumodif   = '+SqlValue(Sesion.UserID)+', '+
          '       ir_fechamodif = SYSDATE, '+
          '       ir_usubaja    = NULL, '+
          '       ir_fechabaja  = NULL '+
          ' WHERE ir_id = '+SqlValue(sdqConsulta.FieldByName('GJ_IDIMPORTESJUICIO').AsInteger));
      end;
    end;

    Sql.PrimaryKey.Add('GJ_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TfrmGastos.FormCreate(Sender: TObject);
begin
  inherited;
  with fraGasto do
  begin
    TableName   := 'legales.ltg_tipogasto';
    FieldID     := 'tg_id';
    FieldCodigo := 'tg_id';
    FieldDesc   := 'tg_descripcion';
    FieldBaja   := 'tg_fechabaja';
    Showbajas   := True;
  end;
  sdqConsulta.ParamByName('idjuicio').AsInteger := IDJuicio;
  FieldBaja := 'GJ_FECHABAJA';
  Sql.TableName := 'LEGALES.LGJ_GASTOSJUICIO';
end;

procedure TfrmGastos.LoadControls;
begin
  inherited;
  ClearControls;
  fraGasto.Codigo       := sdqConsulta.FieldByName('GJ_IDTIPOGASTO').AsString;
  edImporte.Text        := sdqConsulta.FieldByName('GJ_IMPORTE').AsString;
  edObservaciones.Text  := sdqConsulta.FieldByName('GJ_DETALLE').AsString;
  edFechaRequerida.Date := sdqConsulta.FieldByName('GJ_FECHAREQUERIDA').AsDateTime;
end;

function TfrmGastos.Validar: Boolean;
begin
  Result := True;
  Verificar(fraGasto.IsEmpty ,fraGasto, 'Debe especificar un tipo de gasto.');
  Verificar(edImporte.Text= '',edImporte, 'El importe debe ser mayor a 0.');
  if edFechaRequerida.Date <> 0 then
    Verificar(edFechaRequerida.Date < DBDate ,edFechaRequerida, 'La Fecha Requerida debe ser mayor o igual a hoy.');
end;

procedure TfrmGastos.Load(juicio : Integer);
begin
  IDJuicio    := juicio;
  IDInstancia := ValorSqlInteger(
    ' SELECT lij.ij_id, lmc.mc_relacionnuevojuzgado, lij.ij_idinstancia, '+
    '        lij.ij_idmotivocambiojuzgado '+
    '   FROM legales.lij_instanciajuicioentramite lij, '+
    '        legales.lmc_motivocambiojuzgado lmc '+
    '  WHERE ((lmc.mc_id = lij.ij_idmotivocambiojuzgado)) '+
    '    AND ij_id = (SELECT MAX (ij_id) '+
    '                  FROM legales.lij_instanciajuicioentramite '+
    '                 WHERE ij_idjuicioentramite = '+SqlValue(IDJuicio)+')');

  sdqConsulta.ParamByName('idjuicio').AsInteger := IDJuicio;
  tbRefrescarClick(nil);
end;

procedure TfrmGastos.tbNuevoClick(Sender: TObject);
begin
  Verificar(IDJuicio = 0, tbNuevo,'Debe Tener Grabada la instancia.');
  inherited;
end;

end.
