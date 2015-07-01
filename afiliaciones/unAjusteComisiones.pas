unit unAjusteComisiones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, unArtFrame, unArtDbFrame,
  unFraEmpresa, PeriodoPicker, Mask, ToolEdit, CurrEdit, unfraVendedores, unFraCodigoDescripcion, unFraEntidades,
  DateComboBox, Buttons, Placemnt, unArt, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  RxPlacemnt, RxToolEdit, RxCurrEdit;

type
  TfrmAjusteComisiones = class(TForm)
    gpEmpresa: TGroupBox;
    fraEmpresaAjuste: TfraEmpresa;
    gpPeriodos: TGroupBox;
    edPeriodoDesde: TPeriodoPicker;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    gbImporte: TGroupBox;
    edImporte: TCurrencyEdit;
    gbEntVendDebitar: TGroupBox;
    Label4: TLabel;
    fraEntidadDebitar: TfraEntidades;
    Label5: TLabel;
    fraVendedorDebitar: TfraVendedores;
    gbEntVendAcreditar: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    fraEntidadAcreditar: TfraEntidades;
    fraVendedorAcreditar: TfraVendedores;
    btnRecalcular: TBitBtn;
    FormStorage1: TFormStorage;
    gbConcepto: TGroupBox;
    fraConceptoAjuste: TfraStaticCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure btnRecalcularClick(Sender: TObject);
  private
    pIdVC: TTableId;

    function Validar: Boolean;

    procedure GenerarAjusteComision;
  public
    procedure DoCargarDatosAjusteComisiones(Contrato: Integer; VigenciaDesde, VigenciaHasta: String; Entidad, Vendedor,
                                            IdVC: TTableId; HabilitarADebitar: Boolean; IdConcepto: TTableId);
  end;

implementation

uses
  VCLExtra, unDmPrincipal, Math, AnsiSql, CustomDlgs, unPrincipal, General;

{$R *.DFM}

procedure TfrmAjusteComisiones.FormCreate(Sender: TObject);
begin
  fraEmpresaAjuste.ShowBajas := True;

  fraEntidadDebitar.ShowBajas    := True;
  fraVendedorDebitar.ShowBajas   := True;
  fraEntidadAcreditar.ShowBajas  := True;
  fraVendedorAcreditar.ShowBajas := True;

  with fraConceptoAjuste do
  begin
    TableName      := 'xco_concepto';
    FieldID        := 'co_id';
    FieldCodigo    := 'co_id';
    FieldDesc      := 'co_descripcion';
    FieldBaja      := 'co_fechabaja';
    ExtraCondition := 'AND co_asignablevendedor = ''S'' AND co_asignablecontrato = ''S''';
    ShowBajas      := True;
  end;

  VCLExtra.LockControls([fraEmpresaAjuste, edPeriodoDesde, edPeriodoHasta, edImporte, fraEntidadAcreditar,
                         fraVendedorAcreditar, fraConceptoAjuste], True);
end;

procedure TfrmAjusteComisiones.DoCargarDatosAjusteComisiones(Contrato: Integer; VigenciaDesde, VigenciaHasta: String;
                                                             Entidad, Vendedor, IdVC: TTableId; HabilitarADebitar: Boolean;
                                                             IdConcepto: TTableId);
var
  sSql: String;
  sUltPerCierre: String;
  sVigHasta: String;
begin
  fraEmpresaAjuste.Contrato    := Contrato;
  edPeriodoDesde.Periodo.Valor := VigenciaDesde;

  sSql :=
    'SELECT TO_CHAR(comision.get_ultfechacierre, ''YYYYMM'')' +
     ' FROM DUAL';
  sUltPerCierre := ValorSql(sSql);

  if VigenciaHasta = '' then
    sVigHasta := sUltPerCierre
  else
    sVigHasta := IntToStr(Min(StrToInt(VigenciaHasta), StrToInt(sUltPerCierre)));

  edPeriodoHasta.Periodo.Valor := sVigHasta;

  fraConceptoAjuste.Value := IdConcepto;

  sSql :=
    'SELECT SUM(mo_importe)' +
     ' FROM zmo_movimiento' +
    ' WHERE mo_contratoprincipal = :contrato' +
      ' AND mo_periodo >= :periodo1' +
      ' AND mo_periodo <= :periodo2' +
      ' AND mo_idcierrepago IS NOT NULL';
  edImporte.Value := ValorSqlExtendedEx(sSql, [Contrato, edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor]);

  if HabilitarADebitar then
  begin
    fraEntidadDebitar.Value  := Entidad;
    fraVendedorDebitar.Value := Vendedor;
  end
  else
  begin
    fraEntidadAcreditar.Value  := Entidad;
    fraVendedorAcreditar.Value := Vendedor;
  end;

  VclExtra.LockControls([fraEntidadDebitar, fraVendedorDebitar, fraEntidadAcreditar, fraVendedorAcreditar, fraConceptoAjuste], True);

  pIdVC := IdVC;

  ShowModal;
end;

function TfrmAjusteComisiones.Validar: Boolean;
var
  sSql: String;
begin
  Result := False;

  sSql :=
    'SELECT 1' +
     ' FROM xev_entidadvendedor, avc_vendedorcontrato, xpc_pagocomision' +
    ' WHERE pc_idvendcontrato = vc_id' +
      ' AND ev_id = vc_identidadvend' +
      ' AND vc_contrato = :contrato' +
      ' AND pc_idconcepto = :idconcepto' +
      ' AND ev_identidad = :identidad' +
      ' AND ev_idvendedor = :idvendedor' +
      ' AND pc_periodo >= :periodo1' +
      ' AND pc_periodo <= :periodo2';

  if (not fraEntidadDebitar.IsEmpty) and (not fraVendedorDebitar.IsEmpty) and
     (not ExisteSqlEx(sSql, [fraEmpresaAjuste.edContrato.Value, fraConceptoAjuste.Value, fraEntidadDebitar.Value,
                             fraVendedorDebitar.Value, edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor])) then
    InvalidMsg(fraEntidadDebitar.edCodigo, 'No existen liquidaciones a debitar del vendedor seleccionado.')
  else
    Result := True;
end;

procedure TfrmAjusteComisiones.btnRecalcularClick(Sender: TObject);
begin
  if Validar then
    GenerarAjusteComision
  else
    Close;
end;

procedure TfrmAjusteComisiones.GenerarAjusteComision;
var
  sSql: String;
begin
  sSql := 'comision.do_ajustecomisiones(:idavc, :concepto, :vigdesde, :vighasta, :debitocredito, :usuario);';

  EjecutarStoreSTEx(sSql, [pIdVC, fraConceptoAjuste.Value, edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,
                           IIF(fraEntidadDebitar.IsSelected, 'D', 'C'), frmPrincipal.DBLogin.UserId]);

  MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
  Close;
end;

end.
