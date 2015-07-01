unit unLiqAMPCarga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unfraVolante, StdCtrls, Buttons, Mask, ToolEdit, DateComboBox, Db,
  ArtComboBox, SDEngine, unfraPrestaciones, CurrEdit, ExtCtrls, Placemnt,
  LookupDialog, strFuncs, DBGrids, DBCtrls, Registros, artSeguridad, Grids,
  IntEdit, Menus, PatternEdit, unArtFrame, unFraCodigoDescripcion,
  unfraCtbTablas, {$IFNDEF VER130}Variants, {$ENDIF} unArtDBAwareFrame, RXDBCtrl,
  ComCtrls, ToolWin, unfraEstablecimiento, unArtDbFrame, unFraEmpresa,
  ShortCutControl, FormPanel, unFraEstudio, unFraCodDesc, ExComboBox,
  FSPageControl, JvExComCtrls, JvComCtrls, RXCtrls, unFraEstablecimientoContrato,
  RxPlacemnt, RxCurrEdit, RxToolEdit;

type
  TAccion = (moNone, moAlta, moBaja, moEdicion);
  TQueLimpiar = set of (qlFactura, qlBusq, qlImpSin);
  TfrmLiqAMPCarga = class(TForm)
    AprobNinguno: TSpeedButton;
    AprobTodos: TSpeedButton;
    btnEditar: TBitBtn;
    btnGuardarDatos: TBitBtn;
    btnImprimir: TBitBtn;
    btnLimpiar: TBitBtn;
    btnLimpiarDatos: TBitBtn;
    btnSalir: TBitBtn;
    btnSalirDatos: TBitBtn;
    btnVerEstudios: TBitBtn;
    cbConcepto: TExComboBox;
    chbAprobados: TRxCheckListBox;
    chbDebitados: TRxCheckListBox;
    dbgEstudios: TRxDBGrid;
    dbgEstudiosEnLiq: TDBGrid;
    DebNinguno: TSpeedButton;
    DebTodos: TSpeedButton;
    dsEstudios: TDataSource;
    dsEstudiosEnLiq: TDataSource;
    edCantDiasAprob: TIntEdit;
    edCantEstAprob: TIntEdit;
    edCantEstDeb: TIntEdit;
    edCantKMAprob: TIntEdit;
    edDiasFact: TIntEdit;
    edEstFact: TIntEdit;
    edFecha: TDateComboBox;
    edKMFact: TIntEdit;
    edObservaciones: TMemo;
    edTotalAprob: TCurrencyEdit;
    edTotalDeb: TCurrencyEdit;
    edValorAprobDias: TCurrencyEdit;
    edValorAprobEst: TCurrencyEdit;
    edValorAprobGE: TCurrencyEdit;
    edValorAprobKM: TCurrencyEdit;
    edValorConvDia: TCurrencyEdit;
    edValorConvEst: TCurrencyEdit;
    edValorConvGE: TCurrencyEdit;
    edValorConvKM: TCurrencyEdit;
    edValorFactDias: TCurrencyEdit;
    edValorFactEst: TCurrencyEdit;
    edValorFactGE: TCurrencyEdit;
    edValorFactKM: TCurrencyEdit;
    edValorFactOtros: TCurrencyEdit;
    FormPlacement: TFormPlacement;
    fpDatosLiquidacion: TFormPanel;
    fpEstudiosEnLiq: TFormPanel;
    fraEmpresaEstabLote: TfraCodDesc;
    fraEmpresaFiltro: TfraEmpresa;
    fraEstablecimientoFiltro: TfraEstablecimientoContrato;
    fraEstudio: TfraEstudio;
    fraVolantes: TfraVolantes;
    grbEstudios: TGroupBox;
    grbViaticos: TGroupBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    grpDatosLisq: TGroupBox;
    grpEmpresaEstab: TGroupBox;
    grpVolantes: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblInfoEstudio: TLabel;
    lbPrestacion: TLabel;
    mnuHistoDetalle: TMenuItem;
    Panel1: TPanel;
    pcValores: TJvPageControl;
    pmnuHistoria: TPopupMenu;
    rgPagarDebitar: TRadioGroup;
    sdqEstudios: TSDQuery;
    sdqEstudiosAAsociar: TSDQuery;
    sdqEstudiosEnLiq: TSDQuery;
    Seguridad: TSeguridad;
    ShortCutControl1: TShortCutControl;
    tbBaja: TToolButton;
    tbEditar: TToolButton;
    tbLimpiar: TToolButton;
    tbNuevo: TToolButton;
    tbRefrescar: TToolButton;
    ToolBar1: TToolBar;
    tsEstudios: TTabSheet;
    tsOtros: TTabSheet;
    tsViatDias: TTabSheet;
    tsViatGE: TTabSheet;
    tsViatKM: TTabSheet;
    edGEFact: TIntEdit;
    edGEAprob: TIntEdit;
    procedure ActualizarEstadoVolante (IDVolante: Integer);
    procedure AprobNingunoClick(Sender: TObject);
    procedure AprobTodosClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGuardarDatosClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnLimpiarDatosClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnVerEstudiosClick(Sender: TObject);
    procedure cbConceptoChange(Sender: TObject);
    procedure chbAprobadosClickCheck(Sender: TObject);
    procedure chbDebitadosClickCheck(Sender: TObject);
    procedure CurrencyEditKeyPress(Sender: TObject; var Key: Char);
    procedure dbgEstudiosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure DebNingunoClick(Sender: TObject);
    procedure DebTodosClick(Sender: TObject);
    procedure edCantEstAprobChange(Sender: TObject);
    procedure edDiasFactChange(Sender: TObject);
    procedure edEstFactChange(Sender: TObject);
    procedure edGEFactChange(Sender: TObject);
    procedure edKMFactChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fpDatosLiquidacionShow(Sender: TObject);
    procedure fpEstudiosEnLiqClose(Sender: TObject; var Action: TCloseAction);
    procedure fraEmpresaEstabLotecmbDescripcionDropDown(Sender: TObject);
    procedure fraEstudiocmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fraEstudioOnChange(Sender: TObject);
    procedure LeerDatosLiq(Sender: TObject);
    procedure LimpiarDatosLiq(Sender: TObject);
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnEmpresaEstabLoteChange(Sender: TObject);
    procedure sdqEstudiosAfterScroll(DataSet: TDataSet);
    procedure tbBajaClick(Sender: TObject);
    procedure tbEditarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure edValorFactEstExit(Sender: TObject);
 private
    Accion: TAccion;
    FLiquidado: boolean;
    function CheckCount (Lista: TRxCheckListBox): integer;
    procedure OnVolanteChange(Sender: TObject);
  end;

var
  frmLiqAMPCarga: TfrmLiqAMPCarga;

implementation

uses
  unDmPrincipal, unBusqSini, unPrincipal, unPedidoInfo, SDOra, unRptVolante,
  Numeros, unRecepcion, unRptNotaDebito, AnsiSql, General, ValFuncs, unAutAprob,
  CustomDlgs, Math, UnDestPapl, unSesion, unComunes {$IFDEF VER140}, Variants {$ENDIF},
  unLiqAMPAprob;

{$R *.DFM}
                  
procedure TfrmLiqAMPCarga.ActualizarEstadoVolante (IDVolante: Integer);
var
  sSql,
  sEstado : String;
  MontoVolante,
  TotalFacturado: Double;
begin
  // Determino el estado del volante
  TotalFacturado := ValorSqlExtendedEx ('SELECT NVL (SUM (if_cantfacturada * if_valorfacturado), 0) ' +
                                        '  FROM art.sif_itemfacturaamp ' +
                                        ' WHERE if_idvolante = :idvolante ' +
                                        '   AND if_estado <> ''X'' ' +                                        
                                        '   AND if_fechabaja IS NULL ',
                                        [fraVolantes.edNumero.Value]);

  MontoVolante := SimpleRoundTo(fraVolantes.edTotFact.Value, -2);

  {case CompareFloat(MontoVolante, TotalFacturado) of
    0: begin // Liquidado
      if (fraVolantes.Estado = 'PM') then
        MsgBox('El volante ha sido liquidado en su totalidad.', MB_ICONINFORMATION);
      sEstado := 'LAM';
    end;
    1: begin // Pendiente
      sEstado := 'PM';
    end
  end;}

  if SameFloat(MontoVolante, TotalFacturado) then    // Liquidado
  begin
    if (fraVolantes.Estado = 'PM') then
      MsgBox('El volante ha sido liquidado en su totalidad.', MB_ICONINFORMATION);
    sEstado := 'LAM';
  end
  else                                               // Pendiente
    sEstado := 'PM';

  sSql := ' UPDATE SVO_VOLANTES ' +
          '    SET VO_FACPEN = ' + SqlNumber(TotalFacturado) + ', ' +
          '        VO_ESTADO = ' + SqlValue(sEstado) +
          '  WHERE VO_VOLANTE = ' + SqlValue(IDVolante);
  EjecutarSqlST(sSql);

  FLiquidado := sEstado = 'LAM';
end;

procedure TfrmLiqAMPCarga.AprobNingunoClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to chbAprobados.Items.Count-1 do
    chbAprobados.Checked[i] := false;

  edCantEstAprob.Value := CheckCount(chbAprobados);
end;

procedure TfrmLiqAMPCarga.AprobTodosClick(Sender: TObject);
var
  i: integer;
begin
  if chbAprobados.Items.Count + CheckCount(chbDebitados) > edEstFact.Value then
  begin
    MsgBox('La suma de estudios aprobados + debitados no puede ser superior a la cantidad facturada', MB_ICONEXCLAMATION);
    Exit
  end;

  for i := 0 to chbAprobados.Items.Count-1 do
    chbAprobados.Checked[i] := true;

  edCantEstAprob.Value := CheckCount(chbAprobados);
end;

procedure TfrmLiqAMPCarga.btnEditarClick(Sender: TObject);
begin
  if fraVolantes.edNumero.Text = '' then
  begin
    MsgBox('Debe seleccionar el volante a modificar.', MB_ICONEXCLAMATION);
    Exit
  end;

  with TfrmRecepcion.Create (Self) do
    if Modificar (StrToInt(fraVolantes.edNumero.Text)) then
      // Vuelvo a indicar que es de tipo AMP, ya que la modif. desde otros forms
      // deshabilita Carga de Volantes de PM
      EjecutarSql('UPDATE SVO_VOLANTES' +
                  '   SET VO_ESTADO = ''PM'' ' +
                  ' WHERE VO_VOLANTE = ' + SqlValue(fraVolantes.edNumero.Text));

  fraVolantes.Refrescar;
end;

procedure TfrmLiqAMPCarga.btnGuardarDatosClick(Sender: TObject);
var
  FIDItemFactura: integer;
  sSql: String;
  SumaTotales,
  ImportePend : Extended;   // TK 57467   vuelto a Extended y casteo las multiplicaciones a Extended ya que en el CompareFloat son de ese tipo los datos
  seqVolante,
  seqPago: integer;

  procedure AsignarEstudios;
  var
    i : integer;
  begin
    // Aprobados
    if chbAprobados.Enabled then
    begin
      for i := 0 to chbAprobados.Items.Count-1 do
        if chbAprobados.Checked[i] then
          EjecutarSqlST('UPDATE hys.hdl_detallelote ' +
                        '   SET dl_iddetvolante = ' + SqlInteger(FIDItemFactura) +
                        ' WHERE dl_id = ' + SqlInteger(Integer(chbAprobados.Items.Objects[i])))
        else
          EjecutarSqlST('UPDATE hys.hdl_detallelote ' +
                        '   SET dl_iddetvolante = NULL ' +
                        ' WHERE dl_id = ' + SqlInteger(Integer(chbAprobados.Items.Objects[i])))
    end;

    // Debitados
    if chbDebitados.Enabled then
    begin
      for i := 0 to chbDebitados.Items.Count-1 do
        if chbDebitados.Checked[i] then
          EjecutarSqlST('UPDATE hys.hdl_detallelote ' +
                        '   SET dl_iddetvolante = ' + SqlInteger(FIDItemFactura) +
                        ' WHERE dl_id = ' + SqlInteger(Integer(chbDebitados.Items.Objects[i])))
        else
          EjecutarSqlST('UPDATE hys.hdl_detallelote ' +
                        '   SET dl_iddetvolante = NULL ' +
                        ' WHERE dl_id = ' + SqlInteger(Integer(chbDebitados.Items.Objects[i])))
    end
  end;
begin
  ImportePend := SimpleRoundTo(fraVolantes.edTotFact.Value -
                               ValorSqlExtendedEx ('SELECT   SUM(if_valorfacturado * if_cantfacturada) ' +
                                                 '    FROM art.sif_itemfacturaamp ' +
                                                 '   WHERE if_idvolante = :idvolante ' +
                                                 '     AND if_estado <> ''X'' ' +
                                                 '     AND if_fechabaja IS NULL ' +
                                                  iif(Accion = moAlta, '', '   AND if_id <> ' + SqlValue(sdqEstudios.FieldByName('if_id').AsInteger)),
                                                  [fraVolantes.edNumero.Value]), -2);

  SumaTotales := SimpleRoundTo(edTotalAprob.Value + edTotalDeb.Value, -2);

  VerificarMultiple(['Carga de Liquidación',
                     edFecha,
                     not edFecha.IsEmpty,
                     'Debe indicarse la fecha del estudio',

                     cbConcepto,
                     cbConcepto.ItemIndex <> -1,
                     'Debe indicarse el concepto a facturado',

                     edCantEstAprob,
                     CompareFloat (SumaTotales, ImportePend) < 1,
                     'El monto por los ítems ingresados difiere del pendiente de la factura']);

  // Validaciones según tipo de concepto a facturar
  case cbConcepto.ItemIndex of
    0: VerificarMultiple(['Carga de Liquidación',
                          fraEstudio,
                          fraEstudio.IsSelected,
                          'Debe indicarse el tipo de estudio',

                          edEstFact,
                          edEstFact.Value > 0,
                          'Debe indicarse cantidad de estudios facturados',

                          edCantEstAprob,
                          edCantEstAprob.Value <= edEstFact.Value,
                          'La cantidad de estudios a aprobar no puede ser superior a la facturada ',

                          edValorFactEst,
                          edValorFactEst.Value > 0,
                          'Debe ingresarse el valor facturado',

                          edValorFactEst,
                          CompareFloat(SimpleRoundTo(edValorFactEst.Value * edEstFact.Value), ImportePend) < 1,
                          'El monto por los ítems ingresados difiere del pendiente de la factura',

                          edValorAprobEst,
                          edValorAprobEst.Value <= edValorFactEst.Value,
                          'El importe a pagar no puede ser mayor que el facturado',

                          edEstFact,
                          CheckCount(chbAprobados) + CheckCount(chbDebitados) <= edEstFact.Value,
                          'La cantidad de estudios aprobados + debitados no puede ser superior a la cantidad facturada']);

    1: VerificarMultiple(['Carga de Liquidación',
                          edDiasFact,
                          edDiasFact.Value > 0,
                          'Debe indicarse cantidad de días facturados',

                          edCantDiasAprob,
                          edCantDiasAprob.Value <= edDiasFact.Value,
                          'La cantidad de días a aprobar no puede ser superior a la facturada ',

                          edValorFactDias,
                          edValorFactDias.Value > 0,
                          'Debe ingresarse el valor facturado',

                          edValorFactDias,
                          CompareFloat(SimpleRoundTo(edValorFactDias.Value * edDiasFact.Value), ImportePend) < 1,
                          'El monto por los ítems ingresados difiere del pendiente de la factura',

                          edValorAprobDias,
                          edValorAprobDias.Value > 0,
                          'Debe ingresarse el valor a pagar',

                          edValorAprobDias,
                          CompareFloat(SimpleRoundTo(edValorAprobDias.Value * edDiasFact.Value), ImportePend) < 1,
                          'El monto por los ítems ingresados difiere del pendiente de la factura',

                          edValorAprobDias,
                          edValorAprobDias.Value <= edValorFactDias.Value,
                          'El importe a pagar no puede ser mayor que el facturado']);

    2: VerificarMultiple(['Carga de Liquidación',
                          edKmFact,
                          edKMFact.Value > 0,
                          'Debe indicarse cantidad de KM facturados',

                          edCantKMAprob,
                          edCantKMAprob.Value <= edKMFact.Value,
                          'La cantidad de KM a aprobar no puede ser superior a la facturada ',

                          edValorFactKM,
                          edValorFactKM.Value > 0,
                          'Debe ingresarse el valor facturado',

                          edValorFactKM,
                          CompareFloat(SimpleRoundTo(edValorFactKM.Value * edDiasFact.Value), ImportePend) < 1,
                          'El monto por los ítems ingresados difiere del pendiente de la factura',

                          edValorAprobKM,
                          edValorAprobKM.Value > 0,
                          'Debe ingresarse el valor a pagar',

                          edValorAprobKM,
                          CompareFloat(SimpleRoundTo(edValorAprobKM.Value * edDiasFact.Value), ImportePend) < 1,
                          'El monto por los ítems ingresados difiere del pendiente de la factura',

                          edValorAprobKM,
                          edValorAprobKM.Value <= edValorFactKm.Value,
                          'El importe a pagar no puede ser mayor que el facturado']);

    3: VerificarMultiple(['Carga de Liquidación',
                          edValorFactOtros,
                          edValorFactOtros.Value > 0,
                          'Debe ingresarse el valor facturado',

                          rgPagarDebitar,
                          rgPagarDebitar.ItemIndex <> -1,
                          'Debe indicarse si se Debita o Paga el importe',

                          edValorFactOtros,
                          CompareFloat(SimpleRoundTo(edValorFactOtros.Value), ImportePend) < 1,
                          'El monto ingresados difiere del pendiente de la factura']);

    4: VerificarMultiple(['Carga de Liquidación',
                          edGEFact,
                          edGEFact.Value > 0,
                          'Debe indicarse el monto en concepto de Gastos de Envío que fue facturado.',

                          edGEAprob,
                          edGEAprob.Value <= edGEFact.Value,
                          'El monto en concepto de Gastos de Envío a aprobar no puede ser superior al facturado.',

                          edValorFactGE,
                          edValorFactGE.Value > 0,
                          'Debe ingresarse el valor facturado.',

                          edValorFactGE,
                          CompareFloat(SimpleRoundTo(edValorFactGE.Value * edGEFact.Value), ImportePend) < 1,
                          'El monto por los ítems ingresados difiere del pendiente de la factura.',

                          edValorAprobGE,
                          edValorAprobGE.Value > 0,
                          'Debe ingresarse el valor a pagar.',

                          edValorAprobGE,
                          CompareFloat(SimpleRoundTo(edValorAprobGE.Value * edGEFact.Value), ImportePend) < 1,
                          'El monto por los ítems ingresados difiere del pendiente de la factura.',

                          edValorAprobGE,
                          edValorAprobGE.Value <= edValorFactGE.Value,
                          'El importe a pagar no puede ser mayor que el facturado.']);
  end;

  try
    BeginTrans;

    if Accion = moAlta then
    begin
      FIDItemFactura := GetSecNextVal('art.seq_sif_id');

      sSql := ' SELECT MAX(if_seqvolante) ' +
              '   FROM sif_itemfacturaamp ' +
              ' WHERE if_idvolante = 0' + fraVolantes.edNumero.Text;
      seqVolante := StrToInt('0' + ValorSql(sSql) + 1);

      seqPago := ValorSqlInteger('SELECT NVL(MAX(if_seqpago)+1, 1) ' +
                                 '  FROM sif_itemfacturaamp ' +
                                 ' WHERE if_idvolante = ' + SqlValue(fraVolantes.edNumero.Value) +
                                 '   AND if_idlote = ' + SqlValue(fraEmpresaEstabLote.Value) +
                                 '   AND if_idempresa = ' + SqlValue(fraEmpresaFiltro.Value) +
                                 '   AND if_idestableci = ' + SqlValue(fraEstablecimientoFiltro.ID));

      sSql := 'INSERT INTO art.sif_itemfacturaamp ' +
              '            (if_id, if_idvolante, if_fecha, if_fechaalta, ' +
              '             if_usualta, if_idlote, if_idempresa, if_idestableci, ' +
              '             if_observaciones, if_estado, if_concepto, if_seqvolante, ' +
              '             if_seqpago, ' +
              '             if_idestudio, if_cantaprobados, if_valoraprobados, ' +
              '             if_valorconvenido, if_cantfacturada, if_valorfacturado ' +
              '            ) ' +
              '     VALUES (' +
                            SqlInteger(FIDItemFactura) + ',' +
                            SqlValue(fraVolantes.edNumero.Value) + ',' +
                            SqlDate(edFecha.Date) + ',' +
                            'SYSDATE,' +
                            SqlValue(Sesion.LoginName) + ',' +
                            SqlValue(fraEmpresaEstabLote.Value) + ',' +
                            SqlValue(fraEmpresaFiltro.Value) + ',' +
                            SqlValue(fraEstablecimientoFiltro.ID) + ',' +
                            SqlString(edObservaciones.Lines.Text, true) + ',' +
                            SqlValue('P') + ',' +
                            SqlInteger(cbConcepto.ItemIndex) + ',' +
                            SqlInteger(seqVolante) + ',' +
                            SqlInteger(seqPago) + ',';

      case cbConcepto.ItemIndex of
        0: sSql := sSql + SqlValue(fraEstudio.Value)      + ',' +
                          SqlValue(edCantEstAprob.Value)  + ',' +
                          SqlValue(edValorAprobEst.Value) + ',' +
                          SqlValue(edValorConvEst.Value)  + ',' +
                          SqlValue(edEstFact.Value)       + ',' +
                          SqlValue(edValorFactEst.Value)  + ')';

        1: sSql := sSql + 'NULL,' +
                          SqlValue(edCantDiasAprob.Value)  + ',' +
                          SqlValue(edValorAprobDias.Value) + ',' +
                          SqlValue(edValorConvDia.Value)   + ',' +
                          SqlValue(edDiasFact.Value)       + ',' +
                          SqlValue(edValorFactDias.Value)  + ')';

        2: sSql := sSql + 'NULL,' +
                          SqlValue(edCantKmAprob.Value)    + ',' +
                          SqlValue(edValorAprobKM.Value)   + ',' +
                          SqlValue(edValorConvKm.Value)    + ',' +
                          SqlValue(edKmFact.Value)         + ',' +
                          SqlValue(edValorFactKM.Value)    + ')';

        3: sSql := sSql + 'NULL,' +
                          SqlValue(rgPagarDebitar.ItemIndex) + ',' +
                          SqlValue(edValorFactOtros.Value)   + ',' +
                          SqlValue(edValorFactOtros.Value)   + ',' +
                          SqlValue(1)                        + ',' +
                          SqlValue(edValorFactOtros.Value)   + ')';

        4: sSql := sSql + 'NULL,' +
                          SqlValue(edGEAprob.Value)        + ',' +
                          SqlValue(edValorAprobGE.Value)   + ',' +
                          SqlValue(edValorConvGE.Value)    + ',' +
                          SqlValue(edGEFact.Value)         + ',' +
                          SqlValue(edValorFactGE.Value)    + ')';
      end
    end
    else begin
      FIDItemFactura := sdqEstudios.FieldByName('if_id').AsInteger;

      sSql := 'UPDATE art.sif_itemfacturaamp ' +
              '   SET if_fecha = ' + SqlDate(edFecha.Date) + ',' +
              '       if_observaciones = ' + SqlString(edObservaciones.Lines.Text, true) + ',' +
              '       if_estado = ''P'', ' +
              '       if_fechamodif = SYSDATE, ' +
              '       if_usumodif = ' + SqlValue(Sesion.LoginName) + ',' +
              '       if_fechabaja = null, ' +
              '       if_usubaja = null, ' +
              '       if_concepto = ' + SqlInteger(cbConcepto.ItemIndex) + ',';

      case cbConcepto.ItemIndex of
        0: sSql := sSql + '       if_idestudio = ' + SqlValue(fraEstudio.Value) + ',' +
                          '       if_cantfacturada = '  + SqlValue(edEstFact.Value) + ',' +
                          '       if_cantaprobados = '  + SqlValue(edCantEstAprob.Value) + ',' +
                          '       if_valorconvenido = ' + SqlValue(edValorConvEst.Value) + ',' +
                          '       if_valorfacturado = ' + SqlValue(edValorFactEst.Value) + ',' +
                          '       if_valoraprobados = ' + SqlValue(edValorAprobEst.Value);

        1: sSql := sSql + '       if_idestudio = NULL,' +
                          '       if_cantfacturada = '  + SqlValue(edDiasFact.Value) + ',' +
                          '       if_cantaprobados = '  + SqlValue(edCantDiasAprob.Value) + ',' +
                          '       if_valorconvenido = ' + SqlValue(edValorConvDia.Value) + ',' +
                          '       if_valorfacturado = ' + SqlValue(edValorFactDias.Value) + ',' +
                          '       if_valoraprobados = ' + SqlValue(edValorAprobDias.Value);

        2: sSql := sSql + '       if_idestudio = NULL,' +
                          '       if_cantfacturada = '  + SqlValue(edKmFact.Value) + ',' +
                          '       if_cantaprobados = '  + SqlValue(edCantKmAprob.Value) + ',' +
                          '       if_valorconvenido = ' + SqlValue(edValorConvKm.Value) + ',' +
                          '       if_valorfacturado = ' + SqlValue(edValorFactKm.Value) + ',' +
                          '       if_valoraprobados = ' + SqlValue(edValorAprobKM.Value);

        3: sSql := sSql + '       if_idestudio = NULL,' +
                          '       if_cantfacturada = 1,'+
                          '       if_cantaprobados = '  + SqlValue(rgPagarDebitar.ItemIndex) + ',' +
                          '       if_valorconvenido = ' + SqlValue(edValorFactOtros.Value) + ',' +
                          '       if_valorfacturado = ' + SqlValue(edValorFactOtros.Value) + ',' +
                          '       if_valoraprobados = ' + SqlValue(edValorFactOtros.Value);

        4: sSql := sSql + '       if_idestudio = NULL,' +
                          '       if_cantfacturada = '  + SqlValue(edGEFact.Value) + ',' +
                          '       if_cantaprobados = '  + SqlValue(edGEAprob.Value) + ',' +
                          '       if_valorconvenido = ' + SqlValue(edValorConvGE.Value) + ',' +
                          '       if_valorfacturado = ' + SqlValue(edValorFactGE.Value) + ',' +
                          '       if_valoraprobados = ' + SqlValue(edValorAprobGE.Value);
      end;

      sSql := sSql + ' WHERE if_id = ' + SqlInteger(FIDItemFactura);
    end;

    EjecutarSqlST(sSql);

    AsignarEstudios;
    ActualizarEstadoVolante (fraVolantes.edNumero.Value);

    CommitTrans;

    if (Accion = moEdicion) or FLiquidado then
    begin
      if FLiquidado then
      begin
        fraVolantes.Limpiar
      end;

      fpDatosLiquidacion.ModalResult := mrOk;
    end
    else
      fpDatosLiquidacion.ModalResult := mrNone;
    LimpiarDatosLiq(Sender);

    sdqEstudios.Refresh;
    fraVolantes.Refrescar;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error en el alta de la liquidación');
    end;
  end;
end;

procedure TfrmLiqAMPCarga.btnImprimirClick(Sender: TObject);
begin
 if (fraVolantes.edNumero.Text = '') then
    MsgBox('Debe seleccionar algún volante para poder imprimirlo', MB_ICONEXCLAMATION)
 else
   with TrptVolante.Create(Self) do
   begin
     sdqConsulta.Close;
     sdqConsulta.ParamByName('pVolante').AsInteger := StrToInt(fraVolantes.edNumero.Text);
     sdqConsulta.Open;
     PreviewModal;
     Free;
   end;
end;

procedure TfrmLiqAMPCarga.btnLimpiarClick(Sender: TObject);
begin
  fraVolantes.Limpiar;
  fraEmpresaEstabLote.Clear;
  fraEmpresaFiltro.Clear;
  fraEstablecimientoFiltro.Clear;
  sdqEstudios.Close;
end;

procedure TfrmLiqAMPCarga.btnLimpiarDatosClick(Sender: TObject);
begin
  LimpiarDatosLiq(Sender)
end;

procedure TfrmLiqAMPCarga.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLiqAMPCarga.btnVerEstudiosClick(Sender: TObject);
begin
  if (Accion = moAlta) or (cbConcepto.ItemIndex > 0) then
    Exit;

  fpEstudiosEnLiq.Caption := 'Lista de Estudios ' + fraEstudio.Descripcion + ' en la liquidación';
  with sdqEstudiosEnLiq do
  begin
    ParamByName('pidlote').Value     := fraEmpresaEstabLote.Value;
    ParamByName('pestudio').Value    := fraEstudio.Value;
    ParamByName('pidestableci').Value:= fraEstablecimientoFiltro.ID;
    ParamByName('pidempresa').Value  := fraEmpresaFiltro.Value;
    ParamByName('pidvolante').Value  := sdqEstudios.FieldByName('if_id').AsInteger;

    Open
  end;

  fpEstudiosEnLiq.ShowModal
end;

procedure TfrmLiqAMPCarga.cbConceptoChange(Sender: TObject);
begin
  tsEstudios.TabVisible := cbConcepto.Value = '0';
  tsViatDias.TabVisible := cbConcepto.Value = '1';
  tsViatKM.TabVisible   := cbConcepto.Value = '2';
  tsViatGE.TabVisible   := cbConcepto.Value = '4';
  tsOtros.TabVisible    := cbConcepto.Value = '3';

  if tsEstudios.TabVisible then
  begin
    chbAprobados.Items.Clear;
    chbDebitados.Items.Clear;
  end;
end;

procedure TfrmLiqAMPCarga.chbAprobadosClickCheck(Sender: TObject);
begin
  if CheckCount(chbAprobados) + CheckCount(chbDebitados) > edEstFact.Value then
  begin
    MsgBox('La suma de estudios aprobados + debitados no puede ser superior a la cantidad facturada', MB_ICONEXCLAMATION);
    chbAprobados.Checked[chbAprobados.ItemIndex] := false
  end;

  edCantEstAprob.Value := CheckCount(chbAprobados);
end;

procedure TfrmLiqAMPCarga.chbDebitadosClickCheck(Sender: TObject);
begin
  if CheckCount(chbAprobados) + CheckCount(chbDebitados) > edEstFact.Value then
  begin
    MsgBox('La suma de estudios aprobados + debitados no puede ser superior a la cantidad facturada', MB_ICONEXCLAMATION);
    chbDebitados.Checked[chbDebitados.ItemIndex] := false
  end;
end;

procedure TfrmLiqAMPCarga.CurrencyEditKeyPress(Sender: TObject;  var Key: Char);
begin
   if Key = ThousandSeparator then  Key := DecimalSeparator;
end;

procedure TfrmLiqAMPCarga.dbgEstudiosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqEstudios.FieldByName('if_fechabaja').IsNull then
    AFont.Color := clRed
end;

procedure TfrmLiqAMPCarga.DebNingunoClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to chbDebitados.Items.Count-1 do
    chbDebitados.Checked[i] := false;

//  edCantEstAprobChange(Sender)
end;

procedure TfrmLiqAMPCarga.DebTodosClick(Sender: TObject);
var
  i: integer;
begin
  if chbDebitados.Items.Count + CheckCount(chbAprobados) > edEstFact.Value then
  begin
    MsgBox('La suma de estudios aprobados + debitados no puede ser superior a la cantidad facturada', MB_ICONEXCLAMATION);
    Exit
  end;

  for i := 0 to chbDebitados.Items.Count-1 do
    chbDebitados.Checked[i] := true;

//  edCantEstAprobChange(Sender)
end;

procedure TfrmLiqAMPCarga.edCantEstAprobChange(Sender: TObject);
var
  fAuxValor: Extended;
begin
  edCantEstDeb.Value := edEstFact.Value - CheckCount(chbAprobados);

  fAuxValor := edCantEstAprob.Value * edValorAprobEst.Value;
  edTotalAprob.Value := Trunc ((fAuxValor +
                                edCantDiasAprob.Value * edValorAprobDias.Value +
                                edCantKMAprob.Value * edValorAprobKm.Value +
                                edGEAprob.Value * edValorAprobGE.Value)*100)/100;
  edTotalDeb.Value := Trunc((edCantEstDeb.Value * edValorAprobEst.Value +
                             (edDiasFact.Value - edCantDiasAprob.Value) * edValorAprobDias.Value +
                             (edKmFact.Value - edCantKMAprob.Value) * edValorAprobKm.Value +
                             (edGEFact.Value - edGEAprob.Value) * edValorAprobGE.Value)*100)/100;
end;

procedure TfrmLiqAMPCarga.edDiasFactChange(Sender: TObject);
begin
  if edDiasFact.Value = 0 then
    edCantDiasAprob.Value := 0;
end;

procedure TfrmLiqAMPCarga.edEstFactChange(Sender: TObject);
begin
  edCantEstAprob.Value := CheckCount(chbAprobados);
  edCantEstAprobChange(Sender)
end;

procedure TfrmLiqAMPCarga.edGEFactChange(Sender: TObject);
begin
  if edGEFact.Value = 0 then
    edGEAprob.Value := 0;
end;

procedure TfrmLiqAMPCarga.edKMFactChange(Sender: TObject);
begin
  if edKMFact.Value = 0 then
    edCantKMAprob.Value := 0;
end;

procedure TfrmLiqAMPCarga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuLiqAMPCarga.Enabled := True;
end;

procedure TfrmLiqAMPCarga.FormCreate(Sender: TObject);
begin
  fraVolantes.OnChange   := OnVolanteChange;
  fraVolantes.CalcAPagar := cnAMP;

  fraEmpresaFiltro.ShowBajas := True;
  fraEmpresaFiltro.OnChange  := OnEmpresaChange;

  fraEstablecimientoFiltro.ShowBajas := true;

  fraEmpresaEstabLote.Enabled := false;
end;

procedure TfrmLiqAMPCarga.FormShow(Sender: TObject);
begin
  try
    CheckStoreProc('AMEBPBA');
  except
    on E: Exception do begin
      ErrorMsg(E, 'Informe a sistemas de este error.');
      Close;
    end;
  end;
end;

procedure TfrmLiqAMPCarga.fpDatosLiquidacionShow(Sender: TObject);
begin
  with fraEstudio do
  begin
(*
    ExtraCondition := ' AND es_codigo IN(SELECT DISTINCT dl_idestudio ' +
                      '                             FROM hys.hdl_detallelote ' +
                      '                            WHERE (   dl_iddetvolante IS NULL ' +
                                                             iif(Accion = moAlta,
                                                                 '',
                                                                 'OR dl_iddetvolante = ' + SqlValue(sdqEstudios.FieldByName('if_id').AsInteger)) +
                      '                                  ) ' +
                      '                              AND dl_fecharealizacion IS NOT NULL ' +
                      '                              AND dl_idestableci = ' + SqlValue(fraEstablecimientoFiltro.ID) +
                      '                              AND dl_idempresa = ' + SqlValue(fraEmpresaFiltro.Value) +
                      '                              AND dl_idlote = ' + SqlValue(fraEmpresaEstabLote.Value) + ')';
*)
    ExtraFields:= ', (SELECT DISTINCT 1 ' +
                  '              FROM hys.hdl_detallelote ' +
                  '             WHERE (   dl_iddetvolante IS NULL ' +
                                          iif(Accion = moAlta,
                                              '',
                                              'OR dl_iddetvolante = ' + SqlValue(sdqEstudios.FieldByName('if_id').AsInteger)) +
                  '                   ) ' +
                  '               AND dl_fecharealizacion IS NOT NULL ' +
                  '               AND dl_idestudio = es_codigo ' +
                  '               AND dl_idestableci =  ' + SqlValue(fraEstablecimientoFiltro.ID) +
                  '               AND dl_idempresa =  ' + SqlValue(fraEmpresaFiltro.Value) +
                  '               AND dl_idlote =  ' + SqlValue(fraEmpresaEstabLote.Value) + ') en_lote ';

    OnChange := fraEstudioOnChange;
  end;
                                                       
  FLiquidado:= false;
  cbConcepto.Enabled := Accion = moAlta;
  fraEstudio.Enabled := Accion = moAlta;
  btnLimpiarDatos.Enabled := Accion = moAlta;

  if Accion = moAlta then
    LimpiarDatosLiq(Sender)
  else
    LeerDatosLiq(Sender);

  edValorConvDia.Value:= ValorSQL ('SELECT art.amp.get_valor_viatico(' +
                                        SqlInteger(fraVolantes.edPrestIdentif.Value) + ', 2, ' +
                                        SqlValue(fraEstablecimientoFiltro.ID) + ', ' +
                                        SqlDate(edFecha.Date) + ') FROM DUAL');
  edValorConvKM.Value := ValorSQL ('SELECT art.amp.get_valor_viatico(' +
                                        SqlInteger(fraVolantes.edPrestIdentif.Value) + ', 3, ' +
                                        SqlValue(fraEstablecimientoFiltro.ID) + ', ' +
                                        SqlDate(edFecha.Date) + ') FROM DUAL');
end;

procedure TfrmLiqAMPCarga.fpEstudiosEnLiqClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sdqEstudiosEnLiq.Close
end;

procedure TfrmLiqAMPCarga.fraEmpresaEstabLotecmbDescripcionDropDown(
  Sender: TObject);
begin
  fraEmpresaEstabLote.Propiedades.SQL:= 'SELECT DISTINCT le_id AS ID, le_id AS codigo, ' +
                                        '                em_nombre || '' - Est. '' || es_nroestableci ' +
                                        '                || '' '' || es_nombre AS descripcion, ' +
                                        '                NULL AS baja, es_nroestableci, es_contrato, dl_idempresa, ' +
                                        '                dl_idestableci, em_nombre, le_reconfirmacion ' +
                                        '           FROM hys.hdl_detallelote, aem_empresa, aes_establecimiento, ' +
                                        '                hys.hle_loteestudio ' +
                                        '          WHERE em_id = dl_idempresa ' +
                                        '            AND es_id = dl_idestableci ' +
                                        '            AND dl_idlote = le_id ' +
                                        iif (fraEmpresaEstabLote.Value <> '', ' AND dl_idlote = ' + SqlValue(fraEmpresaEstabLote.Value), '') +
                                        '            AND le_idprestador = ' + SqlInteger(fraVolantes.edPrestIdentif.Value);

  fraEmpresaEstabLote.cmbDescripcionDropDown(Sender);
end;

procedure TfrmLiqAMPCarga.fraEstudiocmbDescripcionGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  case fraEstudio.sdqDatos.FieldByName('en_lote').AsInteger of
    0: begin
      AFont.Color := clBlue;
      if Highlight then
        Background := clMoneyGreen
    end;
    1: begin
      AFont.Color := clBlack;
      if Highlight then
        Background := clMoneyGreen
    end;
    else inherited;
  end;
end;

procedure TfrmLiqAMPCarga.fraEstudioOnChange(Sender: TObject);
var
  FRealizacion : String;
begin
  FRealizacion := '';
  if fraEstudio.sdqDatos.FieldByName('en_lote').AsInteger = 1 then
  begin
    FRealizacion := String(ValorSqlEx('SELECT MIN (TRUNC (LE_FECHAALTA))' +
                                      '  FROM COMUNES.CPD_PRESTADORESTUDIO, COMUNES.CPP_PRESUPUESTOPRESTADOR, HYS.HLE_LOTEESTUDIO,' +
                                      '       HYS.HRL_RELEVAMIENTOLOTE, HYS.HEL_ESTADOLOTE' +
                                      ' WHERE PD_IDTIPOVALOR = 1' +
                                      '   AND PD_IDPRESUPUESTO = PP_ID' +
                                      '   AND pd_fechabaja IS NULL ' +
                                      '   AND PP_FECHABAJA IS NULL' +
                                      '   AND PP_VIGENCIADESDE <= LE_FECHAALTA' +
                                      '   AND ((LE_FECHAALTA <= PP_VIGENCIAHASTA)' +
                                      '       OR (PP_VIGENCIAHASTA IS NULL))' +
                                      '   AND PD_VIGENCIADESDE <= LE_FECHAALTA' +
                                      '   AND ((LE_FECHAALTA <= PD_VIGENCIAHASTA)' +
                                      '       OR (PD_VIGENCIAHASTA IS NULL))' +
                                      '   AND PP_IDESTABLECIMIENTO = RL_IDESTABLECI' +
                                      '   AND PP_IDPRESTADOR = LE_IDPRESTADOR' +
                                      '   AND EL_RLID = RL_ID' +
                                      '   AND LE_ID = EL_IDLOTE' +
                                      '   AND EL_IDLOTE = :LOTE', [fraEmpresaEstabLote.Value]));

    if FRealizacion = '' then
      FRealizacion := String(ValorSql('SELECT dl_fecharealizacion ' +
                                      '  FROM hys.hdl_detallelote ' +
                                      ' WHERE (   dl_iddetvolante IS NULL ' +
                                               iif(Accion = moAlta,
                                               '',
                                               'OR dl_iddetvolante = ' + SqlValue(sdqEstudios.FieldByName('if_id').AsInteger)) +
                                      '       ) ' +
                                      '   AND dl_fecharealizacion IS NOT NULL ' +
                                      '   AND dl_idestudio = ' + SqlValue(fraEstudio.edCodigo.Text) +
                                      '   AND dl_idestableci = ' + SqlValue(fraEstablecimientoFiltro.ID) +
                                      '   AND dl_idempresa = ' + SqlValue (fraEmpresaFiltro.Value) +
                                      '   AND dl_idlote = ' + SqlValue (fraEmpresaEstabLote.Value) +
                                      '   AND ROWNUM = 1 '));

    lblInfoEstudio.Caption := 'Realizado (s/Audit.AMP) el ' + FRealizacion;
    lblInfoEstudio.Font.Color := clBlack;
  end
  else begin
    FRealizacion := DateToStr(DBDate);
    lblInfoEstudio.Caption := 'Fuera del lote';
    lblInfoEstudio.Font.Color := clBlue;
  end;

  if edFecha.IsEmpty
    then edFecha.Date := StrToDate(FRealizacion);

  edValorConvEst.Value := ValorSQLExtended ('SELECT art.amp.get_valor_estudio(' +
                                            SqlInteger(fraVolantes.edPrestIdentif.Value) + ', ' +
                                            SqlValue(fraEstudio.edCodigo.Text) + ', ' +
                                            SqlValue(fraEstablecimientoFiltro.ID) + ', ' +
                                            SqlDate(edFecha.Date) + ', ' + sqlvalue(fraEmpresaEstabLote.sdqDatos.fieldbyname('le_reconfirmacion').AsString) + ') FROM DUAL');

  {if Accion = moAlta then
    edValorAprobEst.Value := edValorConvEst.Value
  else begin
    if edValorAprobEst.Value = 0 then
      edValorAprobEst.Value := edValorConvEst.Value
  end;}

  chbAprobados.Items.Clear;
  chbDebitados.Items.Clear;

  with sdqEstudiosAAsociar do
  begin
    ParamByName('pidlote').Value      := fraEmpresaEstabLote.Value;
    ParamByName('pidestudio').Value   := fraEstudio.Value;
    ParamByName('pidestableci').Value := fraEstablecimientoFiltro.ID;
    ParamByName('piempresa').Value    := fraEmpresaFiltro.Value;
    ParamByName('piddetvolante').Value:= iif(Accion = moAlta, 0, sdqEstudios.FieldByName('if_id').AsInteger);

    Open;
    while not EoF do
    begin
      if FieldByName('dl_debito').AsString = 'N' then
      begin
        if chbAprobados.Enabled then
        begin
          chbAprobados.Items.AddObject(FieldByName('trabajador').AsString,
                                       TObject(FieldByName('dl_id').AsInteger));
          chbAprobados.Checked[chbAprobados.Items.Count-1] := not FieldByName('dl_iddetvolante').IsNull
        end
      end
      else begin
        if chbDebitados.Enabled then
        begin
          chbDebitados.Items.AddObject(FieldByName('trabajador').AsString,
                                       TObject(FieldByName('dl_id').AsInteger));
          chbDebitados.Checked[chbDebitados.Items.Count-1] := not FieldByName('dl_iddetvolante').IsNull
        end
      end;

      Next
    end;
    Close
  end;
end;

procedure TfrmLiqAMPCarga.LeerDatosLiq(Sender: TObject);
begin
  LimpiarDatosLiq(Sender);

  edFecha.Date         := sdqEstudios.FieldByName('if_fecha').AsDateTime;
  edObservaciones.Text := AdjustLineBreaks(sdqEstudios.FieldByName('if_observaciones').AsString);
  cbConcepto.ItemIndex := sdqEstudios.FieldByName('if_concepto').AsInteger;
  cbConceptoChange(Sender);

  case cbConcepto.ItemIndex of
    0: begin
      fraEstudio.Value      := sdqEstudios.FieldByName('if_idestudio').AsString;
      edEstFact.Value       := sdqEstudios.FieldByName('if_cantfacturada').AsInteger;
      edCantEstAprob.Value  := sdqEstudios.FieldByName('if_cantaprobados').AsInteger;
      edValorConvEst.Value  := sdqEstudios.FieldByName('if_valorconvenido').AsFloat;
      edValorFactEst.Value  := sdqEstudios.FieldByName('if_valorfacturado').AsFloat;
      edValorAprobEst.Value := sdqEstudios.FieldByName('if_valoraprobados').AsFloat;

      fraEstudioOnChange(Sender);
      edCantEstAprob.Value := CheckCount(chbAprobados);
      edCantEstAprobChange(Sender)
    end;

    1: begin
      edDiasFact.Value      := sdqEstudios.FieldByName('if_cantfacturada').AsInteger;
      edCantDiasAprob.Value := sdqEstudios.FieldByName('if_cantaprobados').AsInteger;
      edValorConvDia.Value  := sdqEstudios.FieldByName('if_valorconvenido').AsFloat;
      edValorFactDias.Value := sdqEstudios.FieldByName('if_valorfacturado').AsFloat;
      edValorAprobDias.Value:= sdqEstudios.FieldByName('if_valoraprobados').AsFloat;
    end;

    2: begin
      edKmFact.Value        := sdqEstudios.FieldByName('if_cantfacturada').AsInteger;
      edCantKmAprob.Value   := sdqEstudios.FieldByName('if_cantaprobados').AsInteger;
      edValorConvKm.Value   := sdqEstudios.FieldByName('if_valorconvenido').AsFloat;
      edValorFactKM.Value   := sdqEstudios.FieldByName('if_valorfacturado').AsFloat;
      edValorAprobKM.Value  := sdqEstudios.FieldByName('if_valoraprobados').AsFloat;
    end;

    3: begin
      edValorFactKM.Value      := sdqEstudios.FieldByName('if_valorfacturado').AsFloat;
      rgPagarDebitar.ItemIndex := sdqEstudios.FieldByName('if_cantaprobados').AsInteger;
    end;

    4: begin
      edGEFact.Value       := sdqEstudios.FieldByName('if_cantfacturada').AsInteger;
      edGEAprob.Value      := sdqEstudios.FieldByName('if_cantaprobados').AsInteger;
      edValorConvGE.Value  := sdqEstudios.FieldByName('if_valorconvenido').AsFloat;
      edValorFactGE.Value  := sdqEstudios.FieldByName('if_valorfacturado').AsFloat;
      edValorAprobGE.Value := sdqEstudios.FieldByName('if_valoraprobados').AsFloat;
    end;
  end;
end;

procedure TfrmLiqAMPCarga.LimpiarDatosLiq(Sender: TObject);
begin
  cbConcepto.ItemIndex := 0;
  cbConceptoChange(Sender);

  edFecha.Clear;
  fraEstudio.Clear;

  edEstFact.Clear;
  edCantEstAprob.Clear;
  edValorConvEst.Clear;
  edValorFactEst.Clear;
  edValorAprobEst.Clear;

  edDiasFact.Clear;
  edCantDiasAprob.Clear;
  edValorConvDia.Clear;
  edValorFactDias.Clear;
  edValorAprobDias.Clear;

  edKMFact.Clear;
  edCantKMAprob.Clear;
  edValorConvKM.Clear;
  edValorFactKM.Clear;
  edValorAprobKM.Clear;

  edCantEstDeb.Clear;
  edTotalDeb.Clear;
  edTotalAprob.Clear;

  edGEFact.Clear;
  edGEAprob.Clear;
  edValorConvGE.Clear;
  edValorFactGE.Clear;
  edValorAprobGE.Clear;

  edValorFactOtros.Clear;
  rgPagarDebitar.ItemIndex := -1;

  edObservaciones.Lines.Clear;
  lblInfoEstudio.Caption := '';
end;

procedure TfrmLiqAMPCarga.OnEmpresaChange(Sender: TObject);
begin
  fraEstablecimientoFiltro.Contrato := fraEmpresaFiltro.Contrato;
end;

procedure TfrmLiqAMPCarga.OnEmpresaEstabLoteChange(Sender: TObject);
begin
  fraEmpresaFiltro.Clear;
  fraEstablecimientoFiltro.Clear;
  try
    if fraEmpresaEstabLote.sdqDatos.IsEmpty then
      Exit;

    fraEmpresaFiltro.ExtraCondition := ' AND em_id IN (SELECT DISTINCT dl_idempresa ' +
                                       '                          FROM hys.hdl_detallelote ' +
                                       '                          WHERE dl_idlote = ' + SqlInteger (fraEmpresaEstabLote.Value) +
                                       '               )';

    fraEmpresaFiltro.Contrato := fraEmpresaEstabLote.sdqDatos.FieldByName('es_contrato').AsInteger;
    fraEmpresaFiltro.Reload;

    fraEstablecimientoFiltro.Cargar(fraEmpresaFiltro.Contrato, fraEmpresaEstabLote.sdqDatos.FieldByName('es_nroestableci').AsInteger);
  finally
    tbRefrescarClick(Sender)
  end
end;

procedure TfrmLiqAMPCarga.sdqEstudiosAfterScroll(DataSet: TDataSet);
begin
  fraEmpresaEstabLote.Propiedades.SQL:= 'SELECT DISTINCT le_id AS ID, le_id AS codigo, ' +
                                        '                em_nombre || '' - Est. '' || es_nroestableci ' +
                                        '                || '' '' || es_nombre AS descripcion, ' +
                                        '                NULL AS baja, es_nroestableci, es_contrato, dl_idempresa, ' +
                                        '                dl_idestableci, em_nombre, le_reconfirmacion ' +
                                        '           FROM hys.hdl_detallelote, aem_empresa, aes_establecimiento, ' +
                                        '                hys.hle_loteestudio ' +
                                        '          WHERE em_id = dl_idempresa ' +
                                        '            AND es_id = dl_idestableci ' +
                                        '            AND dl_idlote = le_id ' +
                                        '            AND dl_idempresa = ' + SqlValue(sdqEstudios.FieldByName('if_idempresa').AsString) +
                                        '            AND dl_idestableci = ' + SqlValue(sdqEstudios.FieldByName('if_idestableci').AsString) +
                                        '            AND le_idprestador = ' + SqlInteger(fraVolantes.edPrestIdentif.Value);


  fraEmpresaEstabLote.Codigo := sdqEstudios.FieldByName('if_idlote').AsString;
  fraEmpresaEstabLote.Reload;

  fraEmpresaFiltro.ExtraCondition := ' AND em_id = ' + SqlValue(sdqEstudios.FieldByName('if_idempresa').AsString);
  fraEmpresaFiltro.Contrato := fraEmpresaEstabLote.sdqDatos.FieldByName('es_contrato').AsInteger;
  fraEmpresaFiltro.Reload;

  fraEstablecimientoFiltro.Cargar(fraEmpresaFiltro.Contrato, fraEmpresaEstabLote.sdqDatos.FieldByName('es_nroestableci').AsInteger);
end;

procedure TfrmLiqAMPCarga.tbBajaClick(Sender: TObject);
var
  sSql: String;
begin
  if (not sdqEstudios.Active) or sdqEstudios.IsEmpty or
     not sdqEstudios.FieldByName('if_fechabaja').IsNull then
    Exit;

  if MsgBox('Desea anular la liquidación?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  Accion := moBaja;
  FLiquidado:= false;

  try
    BeginTrans;

    sSql := 'UPDATE hys.hdl_detallelote ' +
            '   SET dl_iddetvolante = NULL ' +
            ' WHERE dl_iddetvolante = ' + SqlValue(sdqEstudios.FieldByName('if_id').AsInteger);

    EjecutarSqlST(sSql);

    sSql := 'UPDATE art.sif_itemfacturaamp ' +
            '   SET if_estado = ''X'', ' +
            '       if_cantaprobados = NULL, ' +
            '       if_valoraprobados = NULL, ' +
            '       if_fechabaja = SYSDATE, ' +
            '       if_usubaja = ' + SqlValue(Sesion.LoginName) +
            ' WHERE if_id = ' + SqlValue(sdqEstudios.FieldByName('if_id').AsInteger);

    EjecutarSqlST(sSql);

    ActualizarEstadoVolante (fraVolantes.edNumero.Value);

    CommitTrans;
    sdqEstudios.Refresh;

    fraVolantes.Refrescar;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error en la baja de la liquidación');
    end;
  end;
end;

procedure TfrmLiqAMPCarga.tbEditarClick(Sender: TObject);
begin
  if (not sdqEstudios.Active) or sdqEstudios.IsEmpty then
    Exit;

  Accion := moEdicion;
  fpDatosLiquidacion.ShowModal;
end;

procedure TfrmLiqAMPCarga.tbLimpiarClick(Sender: TObject);
begin
  fraVolantes.Limpiar;
  fraEmpresaEstabLote.Clear;
  fraEmpresaFiltro.Clear;
  fraEstablecimientoFiltro.Clear;
  sdqEstudios.Close;
end;

procedure TfrmLiqAMPCarga.tbNuevoClick(Sender: TObject);
begin
  VerificarMultiple(['Carga de Liquidación de estudios',
                     fraEmpresaEstabLote,
                     not fraEmpresaEstabLote.IsEmpty,
                     'Debe indicarse el Nro. de Lote de Estudios AMP']);

  if not sdqEstudios.Active then
    tbRefrescarClick(Sender);;

  Accion := moAlta;
  fpDatosLiquidacion.ShowModal;
end;

procedure TfrmLiqAMPCarga.tbRefrescarClick(Sender: TObject);
begin
  VerificarMultiple(['Carga de Liquidación de estudios',
                     fraVolantes.edNumero,
                     fraVolantes.edNumero.Value > 0,
                     'Debe indicarse el Nro. de Fact. Interna']);

  with sdqEstudios do
  begin
    Close;

    SQL.Clear;
    SQL.Text := 'SELECT if_id, if_fecha, if_idestudio, if_idlote, ' +
                '       DECODE(if_concepto, ' +
                '              0, es_descripcion, ' +
                '              1, ''Viáticos Días'', ' +
                '              1, ''Viáticos KM'', ' +
                '              3, NVL2 (if_observaciones, if_observaciones, ''Otros conceptos'')) descripcion,  if_observaciones, ' +
                '       if_estado, if_fechabaja, if_cantfacturada, if_cantaprobados, ' +
                '       if_cantfacturada - if_cantaprobados debitados, ' +
                '       if_valorconvenido, if_valoraprobados, if_valorfacturado, ' +
                '       if_concepto, if_idestableci, if_idempresa ' +
                '  FROM art.sif_itemfacturaamp, art.aes_estudios ' +
                ' WHERE es_codigo(+) = if_idestudio ' +
                '   AND if_estado <> ''X'' ' +
                '   AND if_fechabaja IS NULL ' +
                '   AND if_idvolante =  ' + SqlValue (fraVolantes.edNumero.Value);

    if not fraEmpresaEstabLote.IsEmpty then
      SQL.Text := SQL.Text +
                  '   AND if_idlote =  ' + SqlValue (fraEmpresaEstabLote.Value) +
                  '   AND if_idestableci =  ' + SqlValue (fraEstablecimientoFiltro.ID) +
                  '   AND if_idempresa =  ' + SqlValue (fraEmpresaFiltro.Value);
    Open
  end
end;

function TfrmLiqAMPCarga.CheckCount (Lista: TRxCheckListBox): integer;
var
  i,
  cant : integer;
begin
  cant := 0;

  for i := 0 to Lista.Items.Count-1 do
    if Lista.Checked[i] then
      inc(cant);

  Result := cant
end;

procedure TfrmLiqAMPCarga.OnVolanteChange(Sender: TObject);
var
  Sql,
  sEstado : String;
begin
  if fraVolantes.edNumero.Value = 0 then
    Exit;

  sql := 'SELECT 1 ' +
         '  FROM SVO_VOLANTES ' +
         ' WHERE VO_VOLANTE = ' + SqlInt(fraVolantes.edNumero.Text);
  if not ExisteSQL(sql) then begin
    InvalidMsg(fraVolantes.edNumero, 'No se encontró el volante ingresado.');
    fraVolantes.Limpiar;
    Exit;
 end;

  Sql := 'SELECT 1 FROM SVG_VOL_GENERICO ' +
         ' WHERE VG_VOLANTE = ' + SqlInt(fraVolantes.edNumero.Text) +
         '   AND VG_ESTADO <> ''X''';
  if ExisteSql(Sql) then begin
    InvalidMsg(fraVolantes.edNumero, 'El volante seleccionado pertenece a una "Carga Genérica".');
    fraVolantes.Limpiar;

    Exit;
  end;

  sql := 'SELECT VO_ESTADO ' +
         '  FROM SVO_VOLANTES ' +
         ' WHERE VO_ESTADO IN (:V1, :V2) ' +
         '   AND VO_VOLANTE = :Volante';
  sEstado := ValorSqlEx(sql, ['PM', 'LAM', SqlInt(fraVolantes.edNumero.Text)]);

  if not AreIn (sEstado, ['PM', 'LAM']) then
  begin
    fraVolantes.Limpiar;

    Verificar(True, fraVolantes.edNumero, 'El volante ha sido aprobado para su pago, ' + #13 +
                                          'no corresponde a AMP, ha sido cancelado ó se encuentra derivado.');
  end;

  with fraEmpresaEstabLote do
  begin
    Enabled := fraVolantes.edPrestIdentif.Value > 0;
    ShowBajas := true;
    Clear;

    Propiedades.SQL:= 'SELECT DISTINCT le_id AS ID, le_id AS codigo, ' +
                      '                em_nombre || '' - Est. '' || es_nroestableci ' +
                      '                || '' '' || es_nombre AS descripcion, ' +
                      '                NULL AS baja, es_nroestableci, es_contrato, dl_idempresa, ' +
                      '                dl_idestableci, em_nombre, le_reconfirmacion ' +
                      '           FROM hys.hdl_detallelote, aem_empresa, aes_establecimiento, ' +
                      '                hys.hle_loteestudio ' +
                      '          WHERE em_id = dl_idempresa ' +
                      '            AND es_id = dl_idestableci ' +
                      '            AND dl_idlote = le_id ' +
                      '            AND le_idprestador = ' + SqlInteger(fraVolantes.edPrestIdentif.Value);

    OnChange       := OnEmpresaEstabLoteChange;
  end;

  sdqEstudios.Close
end;




































procedure TfrmLiqAMPCarga.edValorFactEstExit(Sender: TObject);
begin
  if edValorConvEst.Value >= 0 then
    edValorAprobEst.Value := MinFloat(edValorConvEst.Value, edValorFactEst.Value)
  else
    edValorAprobEst.Value := edValorFactEst.Value;
end;

end.




