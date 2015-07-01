unit unInvConsultarCupones;

interface

uses
  {$IFDEF VER150} Placemnt, ToolEdit, CurrEdit, {$ELSE} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, 
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unArt, DateComboBox, Mask, Menus;

type
  TfrmInvConsultarCupones = class(TfrmCustomGridABM)
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    gbTipoInstrumento: TGroupBox;
    fraTipoInstrumento: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    edNumeroAltaModif: TCurrencyEdit;
    Label2: TLabel;
    edVencimientoAltaModif: TDateComboBox;
    Label3: TLabel;
    edAmortizacionAltaModif: TCurrencyEdit;
    gbDescripcion: TGroupBox;
    edDescripcion: TEdit;
    fpAbmAux: TFormPanel;
    Bevel1: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    btnAceptarAux: TButton;
    btnCancelarAux: TButton;
    edFCobradoAltaModif: TDateComboBox;
    edImporteCobrAltaModif: TCurrencyEdit;
    tbSalir2: TToolButton;
    tbCobro: TToolButton;
    ToolButton2: TToolButton;
    Label4: TLabel;
    edArancelAltaModif: TCurrencyEdit;
    Label5: TLabel;
    edImpNetoAltaModif: TCurrencyEdit;
    Label6: TLabel;
    edComisionAltaModif: TCurrencyEdit;
    pmnuAlta: TPopupMenu;
    pmnuAltaManual: TMenuItem;
    pmnuAltaAutom: TMenuItem;
    fpAbmCAut: TFormPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    btnAceptarCAut: TButton;
    btnCancelarCAut: TButton;
    edFInicioCAut: TDateComboBox;
    Label8: TLabel;
    edCantidadCAut: TCurrencyEdit;
    Label11: TLabel;
    edMesesCAut: TCurrencyEdit;
    Label12: TLabel;
    edInteresAltaModif: TCurrencyEdit;
    Label14: TLabel;
    edAmortCobradaAltaModif: TCurrencyEdit;
    Label13: TLabel;
    edInteresActAltaModif: TCurrencyEdit;
    Label15: TLabel;
    edResidualAltaModif: TCurrencyEdit;
    Label16: TLabel;
    fraCuentaAltaModif: TfraCodigoDescripcion;
    tbSumatoria: TToolButton;
    ToolButton7: TToolButton;
    Label17: TLabel;
    edImpGanaciasAltaModif: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbCobroClick(Sender: TObject);
    procedure btnAceptarAuxClick(Sender: TObject);
    procedure edImporteCobrAltaModifChange(Sender: TObject);
    procedure edArancelAltaModifChange(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure pmnuAltaManualClick(Sender: TObject);
    procedure pmnuAltaAutomClick(Sender: TObject);
    procedure btnAceptarCAutClick(Sender: TObject);
    procedure fpAbmCAutEnter(Sender: TObject);
    procedure DoCalcularImpCobrado(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure edImpGanaciasAltaModifChange(Sender: TObject);
  private
    FIdInstrumento: TTableId;
    FCobro: Boolean;
    procedure SetIdInstrumento(const Value: TTableId);
    procedure DoActualizarComision;
    procedure CalcTotales;
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
  frmInvConsultarCupones: TfrmInvConsultarCupones;
  TotalConsulta: Array of Extended;

const
  MAXCOLS = 8;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('ARANCEL', 'COBRADO_NETO', 'AMORTIZACION', 'INTERES', 'INTERES_COBRADO', 'RESIDUAL', 'AMORTIZACIONCOBRADA', 'IMPORTE_COBRADO', 'RETGANANCIAS');

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, DbFuncs, General, CustomDlgs, SqlFuncs, StrFuncs,
  VCLExtra, Numeros, DateTimeFuncs, unInversiones;

procedure TfrmInvConsultarCupones.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS + 1);

  with fraTipoInstrumento do
    begin
      TableName   := 'NTI_TIPOINSTRUMENTO';
      FieldID     := 'TI_ID';
      FieldCodigo := 'TI_ID';
      FieldDesc   := 'TI_DESCRIPCION';
      FieldBaja   := 'TI_FECHABAJA';
      ShowBajas   := True;
    end;

  with fraCuentaAltaModif do
    begin
      TableName      := 'ZCB_CUENTABANCARIA';
      FieldID        := 'CB_ID';
      FieldCodigo    := 'CB_ID';
      FieldDesc      := 'CB_NUMERO || '' - '' || BA_NOMBRE';
      FieldBaja      := 'CB_FECHABAJA';
      ExtraTables    := ', ZBA_BANCO';
      ExtraCondition := 'AND BA_ID = CB_IDBANCO AND CB_INVERSIONES <> ''N'' AND BA_FECHABAJA IS NULL';
      ShowBajas      := False;
    end;

  VCLExtra.LockControls([fraTipoInstrumento, edDescripcion, edImporteCobrAltaModif, edImpNetoAltaModif]);

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NCU_CUPON';
end;

procedure TfrmInvConsultarCupones.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT CU_NUMERO, CU_AMORTIZACION AMORTIZACION, CU_INTERES INTERES, ' +
               	 'CU_INTERESCOBRADO INTERES_COBRADO, CU_VENCIMIENTO, CU_FECHABAJA FECHA_BAJA, ' +
                 'CU_FECHACOBRADO FECHA_COBRADO, CU_AMORTIZACIONCOBRADA+CU_INTERESCOBRADO IMPORTE_COBRADO, ' +
                 'CU_ID ID, CU_ARANCEL ARANCEL, CU_RETGANANCIAS RETGANANCIAS, ' +
                 'DECODE(CU_AMORTIZACIONCOBRADA+CU_INTERESCOBRADO, 0, 0, ROUND(CU_ARANCEL/(CU_AMORTIZACIONCOBRADA+CU_INTERESCOBRADO)*100, 2)) COMISION, ' +
                 'CU_AMORTIZACIONCOBRADA+CU_INTERESCOBRADO-CU_ARANCEL-CU_RETGANANCIAS COBRADO_NETO, CU_RESIDUAL RESIDUAL, ' +
                 'NVL(IN_VALORRESIDUAL, 0) VALORRESIDUAL, IN_CONSTITUCION CONSTITUCION, ' +
                 'IN_VENCIMIENTO VENCIMIENTO, CU_AMORTIZACIONCOBRADA AMORTIZACIONCOBRADA, ' +
                 'BA_NOMBRE BANCO, CB_NUMERO CUENTA, CU_IDCUENTABANCARIA IDCUENTABANCARIA ' +
            'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, NIN_INSTRUMENTO, NCU_CUPON ' +
           'WHERE CU_IDINSTRUMENTO = :Instrumento ' +
             'AND CU_IDINSTRUMENTO = IN_ID ' +
             'AND BA_ID(+) = CB_IDBANCO ' +
             'AND CB_ID(+) = CU_IDCUENTABANCARIA';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND CU_FECHABAJA IS NULL';

  sdqConsulta.ParamByName('Instrumento').AsInteger := IdInstrumento;
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;

  inherited;
  CalcTotales;
end;

procedure TfrmInvConsultarCupones.SetIdInstrumento(const Value: TTableId);
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

procedure TfrmInvConsultarCupones.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('ARANCEL') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('ARANCEL')).Currency := True;

  if sdqConsulta.FieldByName('COBRADO_NETO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('COBRADO_NETO')).DisplayFormat := ' #,##0.00;- #,##0.00';

  if sdqConsulta.FieldByName('COMISION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('COMISION')).DisplayFormat := '% #,##0.00;-% #,##0.00';

  if sdqConsulta.FieldByName('AMORTIZACION') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('AMORTIZACION')).Currency := True;

  if sdqConsulta.FieldByName('INTERES') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('INTERES')).Currency := True;

  if sdqConsulta.FieldByName('INTERES_COBRADO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('INTERES_COBRADO')).Currency := True;

  if sdqConsulta.FieldByName('RESIDUAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RESIDUAL')).DisplayFormat := ' #,##0.00;- #,##0.00';

  if sdqConsulta.FieldByName('AMORTIZACIONCOBRADA') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('AMORTIZACIONCOBRADA')).Currency := True;

  if sdqConsulta.FieldByName('IMPORTE_COBRADO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('IMPORTE_COBRADO')).Currency := True;

  if sdqConsulta.FieldByName('RETGANANCIAS') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('RETGANANCIAS')).Currency := True;
end;

procedure TfrmInvConsultarCupones.ClearControls;
begin
  edNumeroAltaModif.Clear;
  edVencimientoAltaModif.Clear;
  edAmortizacionAltaModif.Clear;
  edInteresAltaModif.Clear;
end;

function TfrmInvConsultarCupones.DoABM: Boolean;
begin
  BeginTrans;
  try
    with Sql do
      begin
        Clear;

        if (ModoABM = maAlta) or ((ModoABM = maModificacion) and not FCobro) then
          begin
            if ModoABM = maAlta then
              begin
                PrimaryKey.Add('CU_ID',          GetSecNextVal('INV.SEQ_NCU_ID'));
                Fields.Add('CU_FECHAALTA',       exDateTime);
                Fields.Add('CU_USUALTA',         Sesion.UserID);

                SqlType := stInsert;
              end
            else
              begin
                PrimaryKey.Add('CU_ID',          sdqConsulta.FieldByName('ID').AsInteger);
                Fields.Add('CU_FECHAMODIF',      exDateTime);
                Fields.Add('CU_USUMODIF',        Sesion.UserID);

                SqlType := stUpdate;
              end;

            Fields.Add('CU_IDINSTRUMENTO',       IdInstrumento);
            Fields.Add('CU_NUMERO',              edNumeroAltaModif.Value, 2, True);
            Fields.Add('CU_VENCIMIENTO',         edVencimientoAltaModif.Date);
            Fields.Add('CU_AMORTIZACION',        edAmortizacionAltaModif.Value);
            Fields.Add('CU_INTERES',             edInteresAltaModif.Value);
          end
        else if ModoABM = maModificacion then
          begin
            PrimaryKey.Add('CU_ID',              sdqConsulta.FieldByName('ID').AsInteger);
            Fields.Add('CU_FECHAMODIF',          exDateTime);
            Fields.Add('CU_USUMODIF',            Sesion.UserID);
            Fields.Add('CU_FECHACOBRADO',        edFCobradoAltaModif.Date);
            Fields.Add('CU_ARANCEL',             edArancelAltaModif.Value);
            Fields.Add('CU_AMORTIZACIONCOBRADA', edAmortCobradaAltaModif.Value);
            Fields.Add('CU_INTERESCOBRADO',      edInteresActAltaModif.Value);
            Fields.Add('CU_RESIDUAL',            edResidualAltaModif.Value);
            Fields.Add('CU_IDCUENTABANCARIA',    fraCuentaAltaModif.Value, True);
            Fields.Add('CU_RETGANANCIAS',        edImpGanaciasAltaModif.Value);

            SqlType := stUpdate;
          end
        else if ModoABM = maBaja then
          begin
            PrimaryKey.Add('CU_ID',              sdqConsulta.FieldByName('ID').AsInteger);
            Fields.Add('CU_FECHABAJA',           exDateTime);
            Fields.Add('CU_USUBAJA',             Sesion.UserID);

            SqlType := stUpdate;
          end
      end;

    Result := inherited DoABM;

    CommitTrans;
  except
    on E: Exception do
      begin
        RollBack;
        Raise Exception.Create(E.Message + CRLF + 'Error al grabar.');
      end;
  end;
end;

function TfrmInvConsultarCupones.Validar: Boolean;
var
  sSql: String;
  FVencim: TDateTime;
begin
  if (ModoABM = maAlta) or not FCobro then
    begin
      Verificar(edNumeroAltaModif.Value <= 0, edNumeroAltaModif, 'El número es obligatorio.');
      Verificar(edVencimientoAltaModif.IsEmpty, edVencimientoAltaModif, 'El vencimiento es obligatorio.');
//*** REACTIVAR ***      Verificar(edVencimientoAltaModif.Date < DBDate(), edVencimientoAltaModif, 'El vencimiento no puede ser menor a la fecha actual.');

      Verificar((edAmortizacionAltaModif.Value <= 0) and (edInteresAltaModif.Value <= 0) and (MsgBox('¿Confirma la carga de un cupón en 0?', MB_ICONQUESTION+MB_YESNO) = ID_NO), edAmortizacionAltaModif, 'Debe ingresar el importe de amortización o de interés.');

      sSql := 'SELECT NVL(IN_VENCIMIENTO, :Default)' +
                'FROM NIN_INSTRUMENTO ' +
               'WHERE IN_FECHABAJA IS NULL ' +
                 'AND IN_ID = :IdInstrumento';
      FVencim := NvlDT(sdqConsulta.FieldByName('VENCIMIENTO').AsDateTime, edVencimientoAltaModif.Date);

      Verificar((edVencimientoAltaModif.Date > FVencim) and (MsgBox('La fecha de vencimiento del cupón no puede ser posterior a la fecha de vencimiento del instrumento. ¿Confirma la carga?', MB_ICONQUESTION+MB_YESNO) = ID_NO), edVencimientoAltaModif, 'Reingrese la fecha de vencimiento.');
    end
  else
    begin
      if FCobro then
        begin
          Verificar(edFCobradoAltaModif.IsEmpty, edFCobradoAltaModif, 'La fecha de cobro es obligatoria.');
          Verificar(edArancelAltaModif.Value > edImporteCobrAltaModif.Value, edArancelAltaModif, 'El arancel no puede ser mayor al importe cobrado.');
          Verificar((edAmortCobradaAltaModif.Value <> 0)and (edResidualAltaModif.Value = 0),edResidualAltaModif,'Residual no puede quedar en 0.');
          Verificar((edAmortCobradaAltaModif.Value = 0)and (edResidualAltaModif.Value <> 0),edResidualAltaModif,'El residual debe ser 0.');
        end;
    end;

  Result := True;
end;

procedure TfrmInvConsultarCupones.tbEliminarClick(Sender: TObject);
begin
  FCobro := False;
  Verificar(sdqConsulta.FieldByName('IMPORTE_COBRADO').AsCurrency > 0, nil, 'No es posible dar de baja un cupón que tiene cobros.');

  inherited;
end;

procedure TfrmInvConsultarCupones.tbCobroClick(Sender: TObject);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      FCobro := True;

      ModoABM := maModificacion;
      ModoABMToSqlType;
      LoadControls;
      fpABMAux.Caption := 'Cobro de Cupones';
      fpABMAux.ShowModal;
    end;
end;

procedure TfrmInvConsultarCupones.LoadControls;
begin
  if FCobro then
    begin
      VCLExtra.LockControls([edComisionAltaModif, edImpNetoAltaModif], True);

      with sdqConsulta do
        begin
          edFCobradoAltaModif.Date      := FieldByName('FECHA_COBRADO').AsDateTime;
          edImporteCobrAltaModif.Value  := FieldByName('IMPORTE_COBRADO').AsFloat;
          edArancelAltaModif.Value      := FieldByName('ARANCEL').AsFloat;
          edAmortCobradaAltaModif.Value := FieldByName('AMORTIZACIONCOBRADA').AsFloat;
          edInteresActAltaModif.Value   := FieldByName('INTERES_COBRADO').AsFloat;
          edResidualAltaModif.Value     := FieldByName('RESIDUAL').AsFloat;
          fraCuentaAltaModif.Value      := FieldByName('IDCUENTABANCARIA').AsInteger;
          edImpGanaciasAltaModif.Value  := FieldByName('RETGANANCIAS').AsFloat;
        end;
    end
  else
    begin
      with sdqConsulta do
        begin
          edNumeroAltaModif.Value       := FieldByName('CU_NUMERO').AsInteger;
          edVencimientoAltaModif.Date   := FieldByName('CU_VENCIMIENTO').AsDateTime;
          edAmortizacionAltaModif.Value := FieldByName('AMORTIZACION').AsFloat;
          edInteresAltaModif.Value      := FieldByName('INTERES').AsFloat;
        end;
    end;
end;

procedure TfrmInvConsultarCupones.btnAceptarAuxClick(Sender: TObject);
begin
	if Validar and DoABM then
  begin
  	if sdqConsulta.Active then
      begin
        sdqConsulta.Refresh;
        CheckButtons;
      end
    else
    	tbRefrescarClick(nil);

		fpABMAux.ModalResult := mrOk;
	end;
end;

procedure TfrmInvConsultarCupones.edImporteCobrAltaModifChange(Sender: TObject);
begin
  DoActualizarComision;
end;

procedure TfrmInvConsultarCupones.edArancelAltaModifChange(Sender: TObject);
begin
  DoActualizarComision;
end;

procedure TfrmInvConsultarCupones.DoActualizarComision;
begin
  if edImporteCobrAltaModif.Value = 0 then
    edComisionAltaModif.Value := 0
  else
    edComisionAltaModif.Value := edArancelAltaModif.Value / edImporteCobrAltaModif.Value * 100;

  edImpNetoAltaModif.Value := edImporteCobrAltaModif.Value - edArancelAltaModif.Value - edImpGanaciasAltaModif.Value;
end;

procedure TfrmInvConsultarCupones.tbModificarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El cupón ya ha sido dado de baja.');
  Verificar(sdqConsulta.FieldByName('IMPORTE_COBRADO').AsCurrency > 0, nil, 'El cupón ya tiene cobros.');

  FCobro := False;
  inherited;
end;

procedure TfrmInvConsultarCupones.tbNuevoClick(Sender: TObject);
begin
  tbNuevo.CheckMenuDropdown;
end;

procedure TfrmInvConsultarCupones.pmnuAltaManualClick(Sender: TObject);
begin
  FCobro := False;

  inherited tbNuevoClick(nil);
end;

procedure TfrmInvConsultarCupones.pmnuAltaAutomClick(Sender: TObject);
begin
  fpAbmCAut.ShowModal;
end;

procedure TfrmInvConsultarCupones.btnAceptarCAutClick(Sender: TObject);
var
  sSql: String;
  FConst: TDateTime;
begin
  Verificar(edCantidadCAut.Value <= 0, edCantidadCAut, 'La cantidad debe ser mayor o igual a 1.');
  Verificar(edMesesCAut.Value <= 0, edMesesCAut, 'Los meses son obligatorios.');
  Verificar(edFInicioCAut.IsEmpty, edFInicioCAut, 'La fecha de inicio es obligatoria.');

  FConst := NvlDT(sdqConsulta.FieldByName('CONSTITUCION').AsDateTime, edFInicioCAut.Date);
  Verificar(edFInicioCAut.Date < FConst, edVencimientoAltaModif, 'La fecha de inicio no puede ser anterior a la fecha de constitución del instrumento.');

  sSql := 'INVERSION.DO_CARGACUPON(:IdInstrumento, :Cantidad, :Meses, :FInicio, :Usuario);';
  EjecutarStoreEx(sSql, [IdInstrumento, edCantidadCAut.Value, edMesesCAut.Value, TDateTimeEx.Create(edFInicioCAut.Date), Sesion.UserID]);

  fpAbmCAut.Close;
  RefreshData;
end;

procedure TfrmInvConsultarCupones.fpAbmCAutEnter(Sender: TObject);
begin
  edCantidadCAut.Clear;
  edMesesCAut.Clear;
  edFInicioCAut.Clear;
end;

procedure TfrmInvConsultarCupones.DoCalcularImpCobrado(Sender: TObject);
begin
  edImporteCobrAltaModif.Value := edAmortCobradaAltaModif.Value + edInteresActAltaModif.Value;
end;

procedure TfrmInvConsultarCupones.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
  sSimbolo: String;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    begin
      if CAMPOS_SUMA[iPos] = 'RESIDUAL' then
        sSimbolo := ''
      else
        sSimbolo := '$';

      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), sSimbolo);
    end;  
end;

procedure TfrmInvConsultarCupones.CalcTotales;
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
      	ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmInvConsultarCupones.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmInvConsultarCupones.edImpGanaciasAltaModifChange(Sender: TObject);
begin
  DoActualizarComision;
end;

end.

