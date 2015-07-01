unit unFFDetalleRendicion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, unArt, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, SinEdit, RxCurrEdit, Vcl.Mask, RxToolEdit,
  DateComboBox;

type
  TfrmFFDetalleRendicion = class(TfrmCustomGridABM)
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    rgAprobadoBusq: TRadioGroup;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    edSiniestroAltaModif: TSinEdit;
    Label1: TLabel;
    Label2: TLabel;
    fraConceptoAltaModif: TfraCodigoDescripcion;
    Label3: TLabel;
    edFechaAltaModif: TDateComboBox;
    Label19: TLabel;
    edImporteAltaModif: TCurrencyEdit;
    edLetraFacAltaModif: TEdit;
    edSituFacAltaModif: TEdit;
    edNumFacAltaModif: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edDetalleAltaModif: TMemo;
    rgAprobarAltaModif: TRadioGroup;
    Label6: TLabel;
    edMotivoAltaModif: TMemo;
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure edSituFacAltaModifExit(Sender: TObject);
    procedure edNumFacAltaModifExit(Sender: TObject);
    procedure edLetraFacAltaModifKeyPress(Sender: TObject; var Key: Char);
    procedure edSituFacAltaModifKeyPress(Sender: TObject; var Key: Char);
    procedure sdqConsultaAPROBADOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure tbImprimirClick(Sender: TObject);
  private
    FIdRendicion: TTableId;
    pbEsAprobar: Boolean;
    procedure SetIdIdRendicion(const Value: TTableId);
    procedure CalcTotales;
    procedure DoActivarAprobar(Activar: Boolean);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  public
    property IdRendicion: TTableId     read FIdRendicion     write SetIdIdRendicion;
  end;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('IMPORTE');

var
  frmFFDetalleRendicion: TfrmFFDetalleRendicion;
  TotalConsulta: Array of Extended;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, CustomDlgs, unDmPrincipal, StrFuncs,
  DateTimeFuncs, DbFuncs, unSiniestros, unGrids;

const
  FONTNAMETILDE: String  = 'Wingdings';
  FONTSIZETILDE: Integer = 12;
  sCampoCheck  : String = 'APROBADO';

{$R *.dfm}

procedure TfrmFFDetalleRendicion.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al calcular los totales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmFFDetalleRendicion.ClearControls;
begin
  edSiniestroAltaModif.Clear;
  fraConceptoAltaModif.Clear;
  edLetraFacAltaModif.Clear;
  edSituFacAltaModif.Clear;
  edNumFacAltaModif.Clear;
  edFechaAltaModif.Clear;
  edImporteAltaModif.Clear;
  edDetalleAltaModif.Clear;
end;

function TfrmFFDetalleRendicion.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maBaja then
        begin
           PrimaryKey.Add('FD_ID',                sdqConsulta.FieldByName('ID').AsInteger);
           Fields.Add('FD_FECHABAJA',             exDateTime);
           Fields.Add('FD_USUBAJA',               Sesion.UserID);

           SqlType := stUpdate;
        end
      else
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.AddInteger('FD_ID',      GetSecNextVal('CONT.SEQ_OFD_ID'));
              Fields.Add('FD_IDRENDICION',        IdRendicion);
              Fields.Add('FD_FECHAALTA',          exDateTime);
              Fields.Add('FD_USUALTA',            Sesion.UserID);

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('FD_ID',             sdqConsulta.FieldByName('ID').AsInteger);

              if pbEsAprobar then
                begin
                  Fields.Add('FD_FECHAAPROBADO',  exDateTime);
                  Fields.Add('FD_USUAPROBADO',    Sesion.UserID);
                  Fields.Add('FD_APROBADO',       String(Iif(rgAprobarAltaModif.ItemIndex = 0, 'S', 'N')));
                  Fields.Add('FD_ANALISIS',       edMotivoAltaModif.Lines.Text);
                end
              else
                begin
                  Fields.Add('FD_FECHAMODIF',     exDateTime);
                  Fields.Add('FD_USUMODIF',       Sesion.UserID);
                end;

              SqlType := stUpdate;
            end;

          if not pbEsAprobar then
            begin
              Fields.Add('FD_IDEXPEDIENTE',           Get_IdExpediente(edSiniestroAltaModif.Siniestro, edSiniestroAltaModif.Orden, edSiniestroAltaModif.Recaida));
              Fields.Add('FD_CONPAGO',                fraConceptoAltaModif.Value);
              Fields.Add('FD_COMPROBANTE',            edLetraFacAltaModif.Text + '-' + edSituFacAltaModif.Text + '-' + edNumFacAltaModif.Text);
              Fields.Add('FD_FECHACOMPROBANTE',       edFechaAltaModif.Date);
              Fields.Add('FD_IMPORTE',                edImporteAltaModif.Value);
              Fields.Add('FD_DETALLE',                Trim(edDetalleAltaModif.Lines.Text));
            end;
        end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmFFDetalleRendicion.edLetraFacAltaModifKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, #9, 'a', 'A', 'b', 'B', 'c', 'C', 'm', 'M']) then
    Key := #0;
end;

procedure TfrmFFDetalleRendicion.edNumFacAltaModifExit(Sender: TObject);
begin
  if not IsEmptyString(edNumFacAltaModif.Text) then
    edNumFacAltaModif.Text := Lpad(edNumFacAltaModif.Text, '0', 8);
end;

procedure TfrmFFDetalleRendicion.edSituFacAltaModifExit(Sender: TObject);
begin
  if not IsEmptyString(edSituFacAltaModif.Text) then
    edSituFacAltaModif.Text := Lpad(edSituFacAltaModif.Text, '0', 4);
end;

procedure TfrmFFDetalleRendicion.edSituFacAltaModifKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, #9, '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
    Key := #0;
end;

procedure TfrmFFDetalleRendicion.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived   := True;
  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'OFD_RENDICIONDETALLE';
  IdRendicion   := ART_EMPTY_ID;

  with Grid.ColumnByField[sCampoCheck].Font do
    begin
      Charset := SYMBOL_CHARSET;
      Name    := FONTNAMETILDE;
      Size    := FONTSIZETILDE;
    end;

  SetLength(TotalConsulta, MAXCOLS + 1);

  with fraConceptoAltaModif do
    begin
      TableName      := 'SCP_CONPAGO';
      FieldID        := 'CP_CONPAGO';
      FieldCodigo    := 'CP_CONPAGO';
      FieldDesc      := 'CP_DENPAGO';
      FieldBaja      := 'CP_FBAJA';
      ShowBajas      := False;
    end;
end;

procedure TfrmFFDetalleRendicion.GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$')
end;

procedure TfrmFFDetalleRendicion.LoadControls;
var
  Comprobante: TStringList;
begin
  with sdqConsulta do
    begin
      edSiniestroAltaModif.Siniestro  := FieldByName('SINIESTRO').AsInteger;
      edSiniestroAltaModif.Orden      := FieldByName('ORDEN').AsInteger;
      edSiniestroAltaModif.Recaida    := FieldByName('RECAIDA').AsInteger;
      fraConceptoAltaModif.Value      := FieldByName('CONPAGO').AsInteger;

      Comprobante := TStringList.Create;
      with Comprobante do
        try
          Split(FieldByName('COMPROBANTE').AsString, '-', Comprobante);
          edLetraFacAltaModif.Text    := Comprobante[0];
          edSituFacAltaModif.Text     := Comprobante[1];
          edNumFacAltaModif.Text      := Comprobante[2];
        finally
          Free;
        end;

      edFechaAltaModif.Date           := FieldByName('FECHA_COMPROBANTE').AsDateTime;
      edImporteAltaModif.Value        := FieldByName('IMPORTE').AsFloat;
      edDetalleAltaModif.Lines.Text   := FieldByName('DETALLE').AsString;
    end;

  edMotivoAltaModif.Clear;
end;

procedure TfrmFFDetalleRendicion.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT EX_SINIESTRO SINIESTRO, EX_ORDEN ORDEN, EX_RECAIDA RECAIDA, ' +
                 'FD_CONPAGO CONPAGO, CP_DENPAGO DESC_CONPAGO, FD_IMPORTE IMPORTE, ' +
                 'FD_COMPROBANTE COMPROBANTE, FD_FECHACOMPROBANTE FECHA_COMPROBANTE, ' +
                 'FD_APROBADO ' + sCampoCheck + ', TRUNC(FD_FECHAAPROBADO) FECHA_APROBADO, ' +
                 'FD_ANALISIS ANALISIS, TRUNC(FD_FECHABAJA) FECHA_BAJA, FD_ID ID, ' +
                 'TRUNC(FR_FECHACIERRE) FECHA_CIERRE, FD_DETALLE DETALLE ' +
            'FROM OFR_RENDICION, OFD_RENDICIONDETALLE, SEX_EXPEDIENTES, SCP_CONPAGO ' +
           'WHERE FD_IDEXPEDIENTE = EX_ID(+) ' +
             'AND FD_CONPAGO = CP_CONPAGO ' +
             'AND FD_IDRENDICION = FR_ID ' +
             'AND FD_IDRENDICION = :IdRendicion';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND FD_FECHABAJA IS NULL';

  case rgAprobadoBusq.ItemIndex of
    1: sWhere := sWhere + ' AND FD_APROBADO IS NULL';
    2: sWhere := sWhere + ' AND FD_APROBADO = ''S''';
    3: sWhere := sWhere + ' AND FD_APROBADO = ''N''';
  end;

  sdqConsulta.ParamByName('IdRendicion').AsInteger := IdRendicion;
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;

  CalcTotales;
end;

procedure TfrmFFDetalleRendicion.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  sdqConsulta.FieldByName(sCampoCheck).OnGetText := sdqConsultaAPROBADOGetText;

  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmFFDetalleRendicion.sdqConsultaAPROBADOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString = 'S' then
    Text := vSi
  else if Sender.AsString = 'N' then
    Text := vNo
  else
    Text := '';
end;

procedure TfrmFFDetalleRendicion.SetIdIdRendicion(const Value: TTableId);
begin
  if FIdRendicion <> Value then
    begin
      FIdRendicion := Value;
      RefreshData;
    end;
end;

procedure TfrmFFDetalleRendicion.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro ya se encuentra dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_CIERRE').IsNull, nil, 'La rendición se encuentra cerrada.');
  Verificar(not sdqConsulta.FieldByName('FECHA_APROBADO').IsNull, nil, 'El registro se encuentra aprobado.');

  inherited;
end;

procedure TfrmFFDetalleRendicion.tbImprimirClick(Sender: TObject);
begin
  SetSMColumnaCheckVisible(Grid, sCampoCheck, False);
  try
    inherited;
  finally
    SetSMColumnaCheckVisible(Grid, sCampoCheck);
  end;
end;

procedure TfrmFFDetalleRendicion.tbLimpiarClick(Sender: TObject);
begin
  rgAprobadoBusq.ItemIndex  := 0;   // Todos
  chkNoMostrarBajas.Checked := True;

  inherited;
end;

procedure TfrmFFDetalleRendicion.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro se encuentra dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_CIERRE').IsNull, nil, 'La rendición se encuentra cerrada.');

  DoActivarAprobar(False);
  inherited;
end;

procedure TfrmFFDetalleRendicion.DoActivarAprobar(Activar: Boolean);
begin
  pbEsAprobar := Activar;

  VCLExtra.LockControls([rgAprobarAltaModif, edMotivoAltaModif], not Activar);
  VCLExtra.LockControls([edSiniestroAltaModif, fraConceptoAltaModif, edLetraFacAltaModif,
                         edSituFacAltaModif, edNumFacAltaModif, edFechaAltaModif,
                         edImporteAltaModif, edDetalleAltaModif], Activar);
  edSiniestroAltaModif.TabStop := not Activar;

  if Activar then
    begin
      rgAprobarAltaModif.ItemIndex := 0;   // Si
      fpAbm.ActiveControl          := edMotivoAltaModif;
    end
  else
    begin
      rgAprobarAltaModif.ItemIndex := -1;
      fpAbm.ActiveControl          := edSiniestroAltaModif
    end;
end;

procedure TfrmFFDetalleRendicion.tbNuevoClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM OFR_RENDICION ' +
           'WHERE FR_ID = :IdRendicion ' +
             'AND FR_FECHACIERRE IS NOT NULL';
  Verificar(ExisteSqlEx(sSql, [IdRendicion]), nil, 'La rendición se encuentra cerrada.');

  DoActivarAprobar(False);
  inherited;
end;

procedure TfrmFFDetalleRendicion.tbPropiedadesClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('FECHA_CIERRE').IsNull, nil, 'La rendición no se encuentra cerrada.');
  Verificar(not sdqConsulta.FieldByName('FECHA_APROBADO').IsNull, nil, 'El registro ya se encuentra aprobado.');

  DoActivarAprobar(True);

  ModoABM := maModificacion;
  ModoABMToSqlType;
  LoadControls;
  fpABM.Caption := 'Aprobar';
  OkABM := (fpABM.ShowModal = mrOk);
end;

procedure TfrmFFDetalleRendicion.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

function TfrmFFDetalleRendicion.Validar: Boolean;
begin
  if pbEsAprobar then
    Verificar(rgAprobarAltaModif.ItemIndex = -1, rgAprobarAltaModif, 'Debe indicar si aprueba o no.')
  else
    begin
      Verificar(edSiniestroAltaModif.IsEmpty, edSiniestroAltaModif, 'Debe ingresar el siniestro');
      Verificar(Get_IdExpediente(edSiniestroAltaModif.Siniestro, edSiniestroAltaModif.Orden, edSiniestroAltaModif.Recaida) = 0, edSiniestroAltaModif, 'El siniestro no existe.');
      Verificar(fraConceptoAltaModif.IsEmpty, fraConceptoAltaModif, 'Debe ingresar el concepto.');
      Verificar(IsEmptyString(edLetraFacAltaModif.Text), edLetraFacAltaModif, 'Debe ingresar el tipo de factura.');
      Verificar(IsEmptyString(edSituFacAltaModif.Text), edSituFacAltaModif, 'Debe ingresar el código de factura.');
      Verificar(IsEmptyString(edNumFacAltaModif.Text), edNumFacAltaModif, 'Debe ingresar el número de factura.');
      Verificar(edFechaAltaModif.IsEmpty, edFechaAltaModif, 'Debe ingresar la fecha.');
      Verificar(edFechaAltaModif.Date > DBDate(), edFechaAltaModif, 'La fecha no puede ser mayor a la fecha actual.');
      Verificar(edImporteAltaModif.Value <= 0, edImporteAltaModif, 'El importe debe ser mayor a 0.');
    end;

  Result := True;
end;

end.

