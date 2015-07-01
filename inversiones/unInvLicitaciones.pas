unit unInvLicitaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unArt, CurrEdit, Mask, ToolEdit, DateComboBox,
  RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TfrmInvLicitaciones = class(TfrmCustomGridABM)
    gbTipoInstrumento: TGroupBox;
    fraTipoInstrumento: TfraCodigoDescripcion;
    gbDescripcion: TGroupBox;
    edDescripcion: TEdit;
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    Label1: TLabel;
    edFechaAltaModif: TDateComboBox;
    Label2: TLabel;
    edCantidadAltaModif: TCurrencyEdit;
    Label3: TLabel;
    edTasaAltaModif: TCurrencyEdit;
    Label4: TLabel;
    edFPagoAltaModif: TDateComboBox;
    Label5: TLabel;
    edObservacioensAltaModif: TMemo;
    Label6: TLabel;
    fraTasaRefAltaModif: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    tbResultado: TToolButton;
    ToolButton2: TToolButton;
    fpResultado: TFormPanel;
    Bevel1: TBevel;
    btnAceptarRes: TButton;
    btnCancelarRes: TButton;
    rgResultadoAltaModif: TRadioGroup;
    Label7: TLabel;
    fraPlazoLiqAltaModif: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbResultadoClick(Sender: TObject);
    procedure btnAceptarResClick(Sender: TObject);
    procedure fpResultadoEnter(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    FIdInstrumento: TTableId;
    procedure SetIdInstrumento(const Value: TTableId);
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
    property IdInstrumento: TTableId   read FIdInstrumento  write SetIdInstrumento;
  end;

var
  frmInvLicitaciones: TfrmInvLicitaciones;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, DbFuncs, General, CustomDlgs, SqlFuncs, StrFuncs,
  VCLExtra, Numeros, DateTimeFuncs, unInversiones;

procedure TfrmInvLicitaciones.SetIdInstrumento(const Value: TTableId);
var
  sSql: String;
  SqlResults: TStringList;
begin
  if FIdInstrumento <> Value then
    begin
      FIdInstrumento := Value;

      sSql := 'SELECT IN_IDTIPOINSTRUMENTO, IN_DESCRIPCION ' +
                'FROM NIN_INSTRUMENTO ' +
               'WHERE IN_ID = ' + SqlValue(FIdInstrumento);

      SqlResults := ValoresColSql(sSql);
      try
        fraTipoInstrumento.Value := StrToInt(SqlResults[0]);
        edDescripcion.Text       := SqlResults[1];
      finally
        SqlResults.Free;
      end;

      RefreshData;
    end;
end;

procedure TfrmInvLicitaciones.FormCreate(Sender: TObject);
begin
  inherited;

  with fraTipoInstrumento do
    begin
      TableName   := 'NTI_TIPOINSTRUMENTO';
      FieldID     := 'TI_ID';
      FieldCodigo := 'TI_ID';
      FieldDesc   := 'TI_DESCRIPCION';
      FieldBaja   := 'TI_FECHABAJA';
      ShowBajas   := True;
    end;

  with fraTasaRefAltaModif do
    begin
      TableName   := 'NTR_TASAREFERENCIA';
      FieldID     := 'TR_ID';
      FieldCodigo := 'TR_ID';
      FieldDesc   := 'TR_NOMBRE';
      FieldBaja   := 'TR_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraPlazoLiqAltaModif do
    begin
      TableName   := 'RCB_CLEARINGBANCARIO';
      FieldID     := 'CB_ID';
      FieldCodigo := 'CB_ID';
      FieldDesc   := 'CB_DESCRIPCION';
      FieldBaja   := 'CB_FECHABAJA';
      ShowBajas   := False;
    end;

  VCLExtra.LockControls([fraTipoInstrumento, edDescripcion]);

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NLI_LICITACION';
end;

procedure TfrmInvLicitaciones.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT LI_FECHA FECHA, LI_CANTIDAD CANTIDAD, LI_TASA TASA, ' +
                 'TR_NOMBRE TASA_REFERENCIA, LI_FECHAPAGO FECHA_PAGO, ' +
                 'LI_OBSERVACIONES OBSERVACIONES, ' +
                 'DECODE(LI_ESTADO, ''A'', ''Aceptada'', ''N'', ''No Aceptada'', ''Pendiente'') ESTADO, ' +
                 'LI_FECHABAJA FECHA_BAJA, LI_ID CODIGO, TR_ID IDTASAREFERENCIA, ' +
                 'LI_ESTADO CODESTADO, LI_PLAZOLIQUIDACION IDPLAZOLIQ,CB_DESCRIPCION PLAZO_LIQUIDACION ' +
            'FROM RCB_CLEARINGBANCARIO, NTR_TASAREFERENCIA, NLI_LICITACION ' +
           'WHERE LI_IDTASAREFERENCIA = TR_ID(+) ' +
             'AND LI_PLAZOLIQUIDACION = CB_ID(+) ' +
             'AND LI_IDINSTRUMENTO = :Instrumento';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND LI_FECHABAJA IS NULL';

  sdqConsulta.ParamByName('Instrumento').AsInteger := IdInstrumento;
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;

  inherited;
end;

procedure TfrmInvLicitaciones.ClearControls;
begin
  edFechaAltaModif.Clear;
  edCantidadAltaModif.Clear;
  edTasaAltaModif.Clear;
  fraTasaRefAltaModif.Clear;
  edFPagoAltaModif.Clear;
  fraPlazoLiqAltaModif.Value := Get_IdDefaultPlazoLiquidacion(IdInstrumento);
  edObservacioensAltaModif.Clear;
end;

procedure TfrmInvLicitaciones.LoadControls;
begin
  with sdqConsulta do
    begin
      edFechaAltaModif.Date               := FieldByName('FECHA').AsDateTime;
      edCantidadAltaModif.Value           := FieldByName('CANTIDAD').AsInteger;
      edTasaAltaModif.Value               := FieldByName('TASA').AsFloat;
      fraTasaRefAltaModif.Value           := FieldByName('IDTASAREFERENCIA').AsInteger;
      edFPagoAltaModif.Date               := FieldByName('FECHA_PAGO').AsDateTime;
      fraPlazoLiqAltaModif.Value          := FieldByName('IDPLAZOLIQ').AsInteger;
      edObservacioensAltaModif.Lines.Text := FieldByName('OBSERVACIONES').AsString;
    end;
end;

function TfrmInvLicitaciones.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if (ModoABM = maAlta) or (ModoABM = maModificacion) then
        begin
          if (ModoABM = maAlta) then
            begin
              PrimaryKey.Add('LI_ID',         GetSecNextVal('INV.SEQ_NLI_ID'));
              Fields.Add('LI_FECHAALTA',      exDateTime);
              Fields.Add('LI_USUALTA',        Sesion.UserID);

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('LI_ID',         sdqConsulta.FieldByName('CODIGO').AsInteger);
              Fields.Add('LI_FECHAMODIF',     exDateTime);
              Fields.Add('LI_USUMODIF',       Sesion.UserID);

              SqlType := stUpdate;
            end;

          Fields.Add('LI_IDINSTRUMENTO',      IdInstrumento);
          Fields.Add('LI_FECHA',              edFechaAltaModif.Date);
          Fields.Add('LI_CANTIDAD',           edCantidadAltaModif.Value);
          Fields.Add('LI_TASA',               edTasaAltaModif.Value);
          Fields.Add('LI_IDTASAREFERENCIA',   fraTasaRefAltaModif.Value, True);

          if edFPagoAltaModif.IsEmpty then
            Fields.Add('LI_FECHAPAGO',        exNull)
          else
            Fields.Add('LI_FECHAPAGO',        edFPagoAltaModif.Date);

          Fields.Add('LI_PLAZOLIQUIDACION',   fraPlazoLiqAltaModif.Value, 0, True);
          Fields.Add('LI_OBSERVACIONES',      edObservacioensAltaModif.Lines.Text);
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('LI_ID',             sdqConsulta.FieldByName('CODIGO').AsInteger);
          Fields.Add('LI_FECHABAJA',          exDateTime);
          Fields.Add('LI_USUBAJA',            Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmInvLicitaciones.Validar: Boolean;
begin
  Verificar(edFechaAltaModif.IsEmpty, edFechaAltaModif, 'La fecha es obligatoria.');
  Verificar(edCantidadAltaModif.Value = 0, edCantidadAltaModif, 'La cantidad es obligatoria.');
  Verificar(not edFPagoAltaModif.IsEmpty and (edFPagoAltaModif.Date <= edFechaAltaModif.Date), edFPagoAltaModif, 'La fecha de pago debe ser posterior a la fecha de la licitación.');

  Result := True;
end;

procedure TfrmInvLicitaciones.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('TASA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TASA')).DisplayFormat := '% #,##0.000;-% #,##0.000';
end;

procedure TfrmInvLicitaciones.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'La licitación ya ha sido dada de baja.');
  Verificar(sdqConsulta.FieldByName('CODESTADO').AsString <> 'P', nil, 'La licitación no se encuentra Pendiente.');

  inherited;
end;

procedure TfrmInvLicitaciones.tbModificarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'La licitación ha sido dada de baja.');
  Verificar(sdqConsulta.FieldByName('CODESTADO').AsString <> 'P', nil, 'La licitación no se encuentra Pendiente.');

  inherited;
end;

procedure TfrmInvLicitaciones.tbResultadoClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'La grilla está vacía.');
  Verificar(IsBaja(), nil, 'La licitación ha sido dada de baja.');
  Verificar(sdqConsulta.FieldByName('CODESTADO').AsString <> 'P', nil, 'La licitación no se encuentra Pendiente.');

  fpResultado.ShowModal;
end;

procedure TfrmInvLicitaciones.btnAceptarResClick(Sender: TObject);
begin
  Verificar(rgResultadoAltaModif.ItemIndex = -1, rgResultadoAltaModif, 'Debe indicar el resultado.');

  with TSQL.Create('NLI_LICITACION') do
    try
      PrimaryKey.Add('LI_ID',         sdqConsulta.FieldByName('CODIGO').AsInteger);
      Fields.Add('LI_ESTADO',         String(Iif(rgResultadoAltaModif.ItemIndex = 0, 'A', 'N')));
      Fields.Add('LI_FECHAMODIF',     exDateTime);
      Fields.Add('LI_USUMODIF',       Sesion.UserID);

      try
       SqlType := stUpdate;
       EjecutarSql(Sql);
       MsgBox('Resultado guardado correctamente.');

       RefreshData;
      except
        on E: Exception do
          ErrorMsg(E, 'Error al guardar el resultado.');
      end;
    finally
      Free;
    end;
end;

procedure TfrmInvLicitaciones.fpResultadoEnter(Sender: TObject);
begin
  rgResultadoAltaModif.ItemIndex := -1;
end;

procedure TfrmInvLicitaciones.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkNoMostrarBajas.Checked := True;
end;

end.
