unit unFacturasHonorarios;
  
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, Mask, ToolEdit, DateComboBox, PatternEdit,
  CurrEdit;

type
  TfrmFacturasHonorarios = class(TfrmCustomGridABM)
    gbEstudio: TGroupBox;
    fraEstudio: TfraStaticCodigoDescripcion;
    gbFechaFact: TGroupBox;
    Label7: TLabel;
    Label5: TLabel;
    edFH_FECHADesde: TDateComboBox;
    edFH_FECHAHasta: TDateComboBox;
    gbFechaRecepc: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edFH_FECHARECEPCIONDesde: TDateComboBox;
    edFH_FECHARECEPCIONHasta: TDateComboBox;
    gbFactura: TGroupBox;
    Label4: TLabel;
    chkSinAplicar: TCheckBox;
    edFH_NUMERO: TMaskEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edfpFH_FECHA: TDateComboBox;
    edfpFH_FECHARECEPCION: TDateComboBox;
    edfpFH_NUMERO: TMaskEdit;
    edfpFH_IMPORTE: TCurrencyEdit;
    edfpFH_TIPO: TPatternEdit;
    gbEstudioAM: TGroupBox;
    frafpEstudio: TfraStaticCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbAprobar: TToolButton;
    rgAprobado: TRadioGroup;
    Label11: TLabel;
    edfpFH_IVA: TCurrencyEdit;
    rgTipoComprobante: TRadioGroup;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure CompletarFactura(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure fpAbmEnter(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
  private
    function GetIDFactura: integer;
    function GetIDGestor: integer;
  public
    property IDFactura: integer read GetIDFactura;
    property IDGestor: integer read GetIDGestor;
  protected
    procedure LoadControls; override;
    procedure ClearControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmFacturasHonorarios: TfrmFacturasHonorarios;

implementation

uses
  unDmPrincipal, AnsiSql, General, CustomDlgs, Strfuncs, DbFuncs, unFraCodigoDescripcion,
  unArt, unPrincipal, unSesion, SqlFuncs, Numeros, unLiquidacionesAplicadas;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmFacturasHonorarios.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  if ActiveControl = edFH_NUMERO then
    CompletarFactura(edFH_NUMERO);

  sSql := 'SELECT GC_ID IDGESTOR, GC_NOMBRE NOMGESTOR, FH_TIPO TIPO, FH_ID, ' +
                 'FH_NUMERO NUMERO, FH_FECHA FECHA, FH_FECHARECEPCION FECHA_RECEPCION, FH_IMPORTE+FH_IVA IMPORTE, ' +
                 'LEGALES.GET_MONTOSINAPLICARFACTURA(FH_ID) SIN_APLICAR, FH_FECHAAPROBADO FECHAAPROBADO, ' +
                 'FH_IMPORTE IMPORTESINIVA, FH_IVA IVA, FH_TIPOCOMPROBANTE TIPOCOMPROBANTE ' +
            'FROM AGC_GESTORCUENTA, LFH_FACTURAHONORARIO ' +
           'WHERE GC_ID = FH_IDGESTOR ' +
             'AND FH_FECHABAJA IS NULL ';

  sWhere := SqlBetweenDateTime(' AND FH_FECHA', edFH_FECHADesde.Date, edFH_FECHAHasta.Date) +
            SqlBetweenDateTime(' AND FH_FECHARECEPCION', edFH_FECHARECEPCIONDesde.Date, edFH_FECHARECEPCIONHasta.Date);

  if fraEstudio.IsSelected then
    sWhere := sWhere + ' AND GC_ID = ' + SqlValue(fraEstudio.Value);

  if edFH_NUMERO.Text <> '    -        ' then
    sWhere := sWhere + ' AND FH_NUMERO = ' + SqlValue(edFH_NUMERO.EditText);

  if chkSinAplicar.Checked then
    sWhere := sWhere + ' AND ART.LEGALES.GET_MONTOSINAPLICARFACTURA(FH_ID) > 0';

  case rgAprobado.ItemIndex of
    1: sWhere := sWhere + ' AND FH_FECHAAPROBADO IS NOT NULL';
    2: sWhere := sWhere + ' AND FH_FECHAAPROBADO IS NULL';
  end;
  
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;

  sdqConsultaAfterScroll(sdqConsulta);
end;
{-------------------------------------------------------------------------------}
procedure TfrmFacturasHonorarios.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;
  ShowActived  := False;

  sSql :=
    'SELECT GC_ID ' + CD_ALIAS_ID + ',' +
          ' GC_ID ' + CD_ALIAS_CODIGO + ',' +
          ' GC_NOMBRE ' + CD_ALIAS_DESC + ',' +
          ' GC_FECHABAJA ' + CD_ALIAS_BAJA +
     ' FROM AGC_GESTORCUENTA' +
    ' WHERE GC_USUARIO IS NULL' +
      ' AND GC_ESTUDIO = ''S''';

  with fraEstudio do
    begin
      Sql := sSql;
      ShowBajas := True;
    end;

  with frafpEstudio do
    begin
      Sql := sSql;
      ShowBajas := False;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmFacturasHonorarios.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEstudio.Clear;
  edFH_FECHADesde.Clear;
  edFH_FECHAHasta.Clear;
  edFH_FECHARECEPCIONDesde.Clear;
  edFH_FECHARECEPCIONHasta.Clear;
  edFH_NUMERO.Clear;
  chkSinAplicar.Checked := False;
  rgAprobado.ItemIndex  := 0;
end;
{-------------------------------------------------------------------------------}
procedure TfrmFacturasHonorarios.CompletarFactura(Sender: TObject);
begin
  TMaskEdit(Sender).Text := LPad(Trim(Copy(TMaskEdit(Sender).Text, 1, 4)), '0', 4) + '-' +
                            LPad(Trim(Copy(TMaskEdit(Sender).Text, 6, MAXINT)), '0', 8);

  TMaskEdit(Sender).Text := StringReplace(TMaskEdit(Sender).Text, ' ', '0', [rfReplaceAll]);

  if TMaskEdit(Sender).Text = '0000-00000000' then
    TMaskEdit(Sender).Text := '    -        ';
end;
{-------------------------------------------------------------------------------}
procedure TfrmFacturasHonorarios.ClearControls;
begin
  frafpEstudio.Clear;
  edfpFH_TIPO.Clear;
  edfpFH_NUMERO.Clear;
  edfpFH_FECHA.Clear;
  edfpFH_FECHARECEPCION.Clear;
  edfpFH_IMPORTE.Clear;
  edfpFH_IVA.Clear;
  rgTipoComprobante.ItemIndex := -1;
end;
{-------------------------------------------------------------------------------}
function TfrmFacturasHonorarios.DoABM: Boolean;
var
  sSql, sMensaje: string;
  Control: TWinControl;
begin
  with Sql do
    begin
      Clear;
      TableName := 'LFH_FACTURAHONORARIO';

      if (ModoABM = maBaja) or (ModoABM = maModificacion) then
      begin
        sSql := 'SELECT 1 ' +
                  'FROM LLF_LIQUIDACIONFACTURA ' +
                 'WHERE LF_IDFACTURA = :Id ' +
                   'AND LF_FECHABAJA IS NULL';

        if ModoABM = maBaja then
          begin
            sMensaje := 'No es posible dar de baja una factura con liquidaciones asociadas.';
            Control  := Grid;
          end
        else
          begin
            sMensaje := 'No es posible actualizar una factura con liquidaciones asociadas.';
            Control  := btnAceptar;
          end;

        Verificar(ExisteSQLEx(sSql, [sdqConsulta.FieldByName('FH_ID').AsInteger]), Control, sMensaje);
      end;

      if ModoABM = maBaja then
        begin
          PrimaryKey.Add('FH_ID',          sdqConsulta.FieldByName('FH_ID').AsInteger);
          Fields.Add('FH_FECHABAJA',       exDateTime);
          Fields.Add('FH_USUBAJA',         Sesion.UserId);

          SqlType := stUpdate;
        end
      else
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.AddExpression('FH_ID', 'SEQ_LFH_ID.NEXTVAL');
              Fields.Add('FH_FECHAALTA',   exDateTime);
              Fields.Add('FH_USUALTA',     Sesion.UserId);

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('FH_ID',      sdqConsulta.FieldByName('FH_ID').AsInteger);
              Fields.Add('FH_FECHAMODIF',  exDateTime);
              Fields.Add('FH_USUMODIF',    Sesion.UserId);

              SqlType := stUpdate;
            end;

          Fields.Add('FH_IDGESTOR',        frafpEstudio.Value);
          Fields.Add('FH_TIPO',            edfpFH_TIPO.Text);
          Fields.Add('FH_NUMERO',          edfpFH_NUMERO.EditText);
          Fields.Add('FH_FECHA',           edfpFH_FECHA.Date);
          Fields.Add('FH_FECHARECEPCION',  edfpFH_FECHARECEPCION.Date);
          Fields.Add('FH_IMPORTE',         edfpFH_IMPORTE.Value, dtNumber);
          Fields.Add('FH_IVA',             edfpFH_IVA.Value, dtNumber);
          Fields.Add('FH_TIPOCOMPROBANTE', Decode(IntToStr(rgTipoComprobante.ItemIndex), ['0', '1', '2'], ['FC', 'NC', 'ND']));
        end;
    end;

  Result := inherited DoABM;
end;
{-------------------------------------------------------------------------------}
procedure TfrmFacturasHonorarios.LoadControls;
begin
  frafpEstudio.Value          := sdqConsulta.FieldByName('IDGESTOR').AsInteger;
  edfpFH_TIPO.Text            := sdqConsulta.FieldByName('TIPO').AsString;
  edfpFH_NUMERO.Text          := sdqConsulta.FieldByName('NUMERO').AsString;
  edfpFH_FECHA.Date           := sdqConsulta.FieldByName('FECHA').AsDateTime;
  edfpFH_FECHARECEPCION.Date  := sdqConsulta.FieldByName('FECHA_RECEPCION').AsDateTime;
  edfpFH_IMPORTE.Value        := sdqConsulta.FieldByName('IMPORTESINIVA').AsCurrency;
  edfpFH_IVA.Value            := sdqConsulta.FieldByName('IVA').AsCurrency;
  rgTipoComprobante.ItemIndex := StrToInt(Decode(sdqConsulta.FieldByName('TIPOCOMPROBANTE').AsString, ['FC', 'NC', 'ND', ''], ['0', '1', '2', '0']));
end;
{-------------------------------------------------------------------------------}
function TfrmFacturasHonorarios.Validar: Boolean;
begin
  if ActiveControl = edfpFH_NUMERO then
    CompletarFactura(edfpFH_NUMERO);

  Verificar(frafpEstudio.IsEmpty, frafpEstudio.edCodigo, 'El estudio es obligatorio.');
  Verificar(edfpFH_TIPO.Text = '', edfpFH_TIPO, 'El tipo de factura es obligatorio.');
  Verificar(edfpFH_NUMERO.Text = '    -        ', edfpFH_NUMERO, 'El número de la factura es obligatorio.');
  Verificar(not IsNumber(Copy(edfpFH_NUMERO.Text, 1, 4) + Copy(edfpFH_NUMERO.Text, 6, MAXINT)), edfpFH_NUMERO, 'El número de la factura tiene un formato erróneo.');
  Verificar(edfpFH_FECHA.IsEmpty, edfpFH_FECHA, 'La fecha de la factura es obligatoria.');
  Verificar(edfpFH_FECHARECEPCION.IsEmpty, edfpFH_FECHARECEPCION, 'La fecha de recepción de la factura es obligatoria.');
  Verificar(edfpFH_FECHA.Date > edfpFH_FECHARECEPCION.Date, edfpFH_FECHARECEPCION, 'La fecha de la factura no puede ser posterior a la fecha de recepción de la misma.');
  Verificar(edfpFH_FECHARECEPCION.Date > DBDate, edfpFH_FECHARECEPCION, 'La fecha de recepción de la factura no puede ser posterior a hoy.');
  Verificar(edfpFH_IMPORTE.Value = 0, edfpFH_IMPORTE, 'El importe de la factura es obligatorio.');
  Verificar(rgTipoComprobante.ItemIndex = -1, rgTipoComprobante, 'Debe indicar el tipo de comprobante.');
  Verificar((rgTipoComprobante.ItemIndex = 1) and (edfpFH_IMPORTE.Value > 0), edfpFH_IMPORTE, 'El importe de la factura debe ser negativo para una nota de crédito.');
  Verificar(ExisteSQLEx('SELECT 1 FROM LFH_FACTURAHONORARIO WHERE FH_FECHABAJA IS NULL AND FH_NUMERO = :Nro AND FH_TIPOCOMPROBANTE = :TipoCompr AND FH_ID <> :Id AND FH_IDGESTOR = :IdGestor', [edfpFH_NUMERO.EditText, Decode(IntToStr(rgTipoComprobante.ItemIndex), ['0', '1', '2'], ['FC', 'NC', 'ND']), IDFactura, IDGestor]), edfpFH_NUMERO, 'El número de la factura no puede repetirse.');

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmFacturasHonorarios.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;

  if sdqConsulta.FieldByName('SIN_APLICAR') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('SIN_APLICAR')).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmFacturasHonorarios.fpAbmEnter(Sender: TObject);
begin
  frafpEstudio.edCodigo.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TfrmFacturasHonorarios.tbPropiedadesClick(Sender: TObject);
var
  bHabilitar: Boolean;
begin
  Verificar(sdqConsulta.IsEmpty, Grid, 'Debe seleccionar una factura.');

  bHabilitar := sdqConsulta.FieldByName('FECHAAPROBADO').IsNull;

  with TfrmLiquidacionesAplicadas.Create(Self) do
    begin
      IDFactura  := Self.sdqConsulta.FieldByName('FH_ID').AsInteger;
      IDGestor   := Self.sdqConsulta.FieldByName('IDGESTOR').AsInteger;
      MontoFact  := Self.sdqConsulta.FieldByName('SIN_APLICAR').AsCurrency;
      NroFactura := Self.sdqConsulta.FieldByName('NUMERO').AsString;

      PermitirAltaBaja := bHabilitar;

      ShowModal;
    end;

  tbRefrescarClick(nil);
end;
{-------------------------------------------------------------------------------}
function TfrmFacturasHonorarios.GetIDFactura: integer;
begin
  case ModoABM of
    maModificacion, maBaja:
      Result := sdqConsulta.FieldByName('FH_ID').AsInteger;
    else
      Result := ART_EMPTY_ID;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmFacturasHonorarios.GetIDGestor: integer;
begin
 Result := frafpEstudio.Value;
end;
{-------------------------------------------------------------------------------}
procedure TfrmFacturasHonorarios.tbAprobarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(sdqConsulta.IsEmpty, Grid, 'Debe seleccionar una factura.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, Grid, 'La factura ya se encuentra aprobada.');

  if MsgBox('¿Confirma la aprobación de la factura?', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      sSql := 'UPDATE LFH_FACTURAHONORARIO ' +
                 'SET FH_USUAPROBADO = :User, ' +
                     'FH_FECHAAPROBADO = Actualdate ' +
               'WHERE FH_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserID,  sdqConsulta.FieldByName('FH_ID').AsInteger]);

      MsgBox('Factura aprobada correctamente.', MB_ICONINFORMATION);
      tbRefrescarClick(nil);
    end;
end;

procedure TfrmFacturasHonorarios.sdqConsultaAfterScroll(DataSet: TDataSet);
var
  bHabilitar: Boolean;
begin
  bHabilitar := sdqConsulta.FieldByName('FECHAAPROBADO').IsNull;

  tbModificar.Enabled := bHabilitar;
  tbEliminar.Enabled  := bHabilitar;
end;

end.

