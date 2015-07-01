unit unImportesRegulados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, PatternEdit, CurrEdit, ToolEdit, DateComboBox,
  unArtFrame, unFraCodigoDescripcionExt, ExtCtrls, DB, SDEngine,
  unFraCodigoDescripcion, unDmLegales, ExComboBox, Math,
  unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, StrFuncs,
  unPrincipal, DateUtils, unSesion, MaskUtils, UnRptLiquidacion, Placemnt,
  Buttons;

type
  TfrmImportesRegulados = class(TForm)
    btnAceptarPago: TButton;
    btnCancelarPago: TButton;
    lblDetalle: TLabel;
    edObservaciones: TEdit;
    cbAplicacion: TComboBox;
    lblAplicacion: TLabel;
    FormStorage1: TFormStorage;
    Label1: TLabel;
    edImporteSentencia: TCurrencyEdit;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    lblImporteSRet: TLabel;
    lblImporteSinRet: TLabel;
    edImporteSinRet: TCurrencyEdit;
    edImporteConRet: TCurrencyEdit;
    procedure btnAceptarPagoClick(Sender: TObject);
    procedure btnCancelarPagoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIdImporteRegulado : integer;
    FIdJuicioEnTramite : integer;
    FIdInstancia : integer;
    FModoImporteRegulado : TModoEjecucion;
    procedure CargarImporteRegulado(Campos: TFields);
    procedure GuardarImporteRegulado;
    procedure Init;
    { Private declarations }
  public
    { Public declarations }
    procedure AltaImporteRegulado(AIdJuicioEnTramite, AIdInstancia : Integer);
    procedure ModificacionImporteRegulado(ASdqImportesRegulados: TSDQuery);
  end;

var
  frmImportesRegulados: TfrmImportesRegulados;

implementation

{$R *.dfm}

procedure TfrmImportesRegulados.AltaImporteRegulado(AIdJuicioEnTramite, AIdInstancia : Integer);
begin
  FIdJuicioEnTramite := AIdJuicioEnTramite;
  FIdInstancia := AIdInstancia;
  FModoImporteRegulado := meAlta;

  self.ShowModal;
end;

procedure TfrmImportesRegulados.ModificacionImporteRegulado(ASdqImportesRegulados : TSDQuery);
begin
  if ASdqImportesRegulados.RecordCount > 0 then
  begin
    FModoImporteRegulado := meModificacion;
    FIdImporteRegulado := ASdqImportesRegulados.FieldByName('ir_id').AsInteger;
    FIdJuicioEnTramite := ASdqImportesRegulados.FieldByName('ir_idjuicioentramite').AsInteger;
    FIdInstancia       := ASdqImportesRegulados.FieldByName('ir_idinstancia').AsInteger;
    CargarImporteRegulado(ASdqImportesRegulados.Fields);

    self.ShowModal;
    ASdqImportesRegulados.Refresh;
  end;
end;

procedure TfrmImportesRegulados.Init;
begin
end;

procedure TfrmImportesRegulados.CargarImporteRegulado(Campos: TFields);
begin
  edImporteSentencia.Value:= Campos.FieldByName('ir_importesentencia').AsFloat;
  edImporteSinRet.Value   := Campos.FieldByName('ir_importesinret').AsFloat;
  edImporteConRet.Value   := Campos.FieldByName('ir_importe').AsFloat;
  cbAplicacion.ItemIndex  := cbAplicacion.Items.IndexOf(Campos.FieldByName('ir_aplicacion').AsString);
  edObservaciones.Text    := Campos.FieldByName('ir_detalle').AsString;
end;

procedure TfrmImportesRegulados.GuardarImporteRegulado;
var
  sSqlTrans : TSql;
  //SumaImportes: Double;
begin
  //SumaImportes := RoundTo (edImporteSentencia.Value - (edImporteConRet.Value + edImporteSinRet.Value), -2);
  VerificarMultiple(['Guardando Importe Regulado en Sentencia',
                     edImporteSentencia,
                     edImporteSentencia.Value > 0,
                     'Debe especificar un monto válido.',
                     cbAplicacion,
                     cbAplicacion.ItemIndex >= 0,
                     'Debe especificar concepto de aplicación.',
                     edImporteSinRet,
                     edImporteSinRet.Value >= 0,
                     'Debe especificar un monto no negativo.',
                     edImporteConRet,
                     edImporteConRet.Value >= 0,
                     'Debe especificar un monto no negativo.'//,
                     //edImporteConRet,
                     //SumaImportes >= 0,
                     //'Los montos a pagar no pueden superar el monto de la sentencia.'
                     ]);

  sSqlTrans := TSql.Create('legales.lir_importesreguladosjuicio');
  sSqlTrans.Fields.AddInteger ('ir_idjuicioentramite',FIdJuicioEnTramite);
  sSqlTrans.Fields.AddInteger ('ir_idinstancia',      FIdInstancia);
  sSqlTrans.Fields.Add        ('ir_importesinret',    edImporteSinRet.Value);
  sSqlTrans.Fields.Add        ('ir_importe',          edImporteConRet.Value);
  sSqlTrans.Fields.Add        ('ir_importesentencia', edImporteSentencia.Value);
  sSqlTrans.Fields.AddString  ('ir_detalle',          edObservaciones.Text, true);
  sSqlTrans.Fields.AddString  ('ir_aplicacion',       cbAplicacion.Items[cbAplicacion.ItemIndex][1], true);

  if FModoImporteRegulado = meAlta then
  begin
    sSqlTrans.SqlType := stInsert;
    FIdImporteRegulado := GetSecNextVal('LEGALES.seq_lir_id');

    sSqlTrans.Fields.AddInteger('ir_id', FIdImporteRegulado);
    sSqlTrans.Fields.AddString('ir_usualta', Sesion.LoginName);
    sSqlTrans.Fields.AddDateTime('ir_fechaalta', DBDateTime);
  end else
  begin
    sSqlTrans.SqlType := stUpdate;

    sSqlTrans.PrimaryKey.Add('ir_id', FIdImporteRegulado);
    sSqlTrans.Fields.AddString('ir_usumodif', Sesion.LoginName);
    sSqlTrans.Fields.AddDateTime('ir_fechamodif', DBDateTime);
  end;

  EjecutarSQLST(sSqlTrans.Sql, tmNone);

  close;
end;

procedure TfrmImportesRegulados.btnAceptarPagoClick(Sender: TObject);
begin
  GuardarImporteRegulado;
end;

procedure TfrmImportesRegulados.btnCancelarPagoClick(Sender: TObject);
begin
  close;
end;

procedure TfrmImportesRegulados.FormCreate(Sender: TObject);
begin
  Init;
end;

end.
