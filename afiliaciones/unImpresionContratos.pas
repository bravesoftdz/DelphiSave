unit unImpresionContratos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, PatternEdit, IntEdit,
  ExtCtrls, unArtFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, ComCtrls, ToolWin, ShortCutControl,
  Placemnt, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, RxPlacemnt;

type
  TfrmImpresionContratos = class(TForm)
    gbRangoContratos: TGroupBox;
    Label1: TLabel;
    edContratoDesde: TIntEdit;
    Label2: TLabel;
    edContratoHasta: TIntEdit;
    rgTipoImpresion: TRadioGroup;
    gbRangoEmpleados: TGroupBox;
    fraStaticCTBRangoEmpleados: TfraStaticCTB_TABLAS;
    gbTipoContrato: TGroupBox;
    chkTipoContratoCliente: TCheckBox;
    chkTipoContratoAseguradora: TCheckBox;
    chkTipoContratoAseguradoraArchivo: TCheckBox;
    btnSoloActivas: TButton;
    btnSoloDeBaja: TButton;
    ToolBar: TToolBar;
    tbLimpiar: TToolButton;
    ToolButton6: TToolButton;
    tbSalir: TToolButton;
    ToolButton1: TToolButton;
    FormStorage1: TFormStorage;
    ShortCutControl: TShortCutControl;
    gbImpresora: TGroupBox;
    cmbImpresoras: TComboBox;
    btnParar: TButton;
    BarProgreso: TProgressBar;
    chkImprimirMembrete: TCheckBox;
    gbCartaBienvenida: TGroupBox;
    lbTexto: TLabel;
    fraTexto: TfraStaticCodigoDescripcion;
    chkImpCartaBienvenida: TCheckBox;
    fraFirmante: TfraStaticCodigoDescripcion;
    fraCorreo: TfraStaticCTB_TABLAS;
    lbFirmante: TLabel;
    lbCorreo: TLabel;
    gbAnexo: TGroupBox;
    lbTexto2: TLabel;
    lbFirmante2: TLabel;
    lbCorreo2: TLabel;
    fraTexto2: TfraStaticCodigoDescripcion;
    fraFirmante2: TfraStaticCodigoDescripcion;
    fraCorreo2: TfraStaticCTB_TABLAS;
    chkImprimirAnexo: TCheckBox;
    gbRegimen: TGroupBox;
    fraRegimen: TfraCodDesc;
    procedure FormCreate(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSoloActivasClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure chkImpCartaBienvenidaClick(Sender: TObject);
    procedure chkImprimirAnexoClick(Sender: TObject);
  private
    FPararImpresion: Boolean;

    function Validar: Boolean;

    procedure CargarImpresoras;
    procedure Do_Contrato_ImpresionMasiva(aContratoInicial, aContratoFinal: Integer; aRangoEmpleados: String;
                                          aTipoImpresion: Integer; aTipoEmpresa: String; aTipoContratoCliente,
                                          aTipoContratoAseguradora, aTipoContratoAseguradoraArchivo: Boolean);
  public
  end;

var
  frmImpresionContratos: TfrmImpresionContratos;

implementation

uses
  unPrincipal, CustomDlgs, unDmPrincipal, AnsiSql, unImprimeContrato, unArt, SDEngine, Printers, unComunes, General,
  unAfiliaciones;

{$R *.DFM}

procedure TfrmImpresionContratos.FormCreate(Sender: TObject);
begin
  frmPrincipal.mnuImpresionContratos.Enabled := False;

  with fraStaticCTBRangoEmpleados do
  begin
    Clave     := 'RANGO';
    OrdenType := otCodigo;
  end;
  CargarImpresoras;
  btnParar.Enabled := False;
  BarProgreso.Position := 0;

  with fraTexto do
  begin
    TableName   := 'ctc_textocarta';
    ShowBajas   := False;
    Sql         :=
      'SELECT DISTINCT tc_id id, tc_codigo codigo, tc_nombre descripcion, tc_fechabaja baja' +
                ' FROM ctc_textocarta, cta_textoarea' +
               ' WHERE tc_id = ta_idtextocarta' +
                 ' AND ta_fechabaja IS NULL' +
                 ' AND ta_idareatexto = ' + SqlValue(TEXTO_BIENVENIDA);
  end;

  with fraFirmante do
  begin
    TableName   := 'cfi_firma';
    FieldID     := 'fi_id';
    FieldCodigo := 'fi_id';
    FieldDesc   := 'fi_firmante';
    FieldBaja   := 'fi_fechabaja';
    ShowBajas   := False;

    Sql :=
      'SELECT DISTINCT fi_id ' + CD_ALIAS_ID + ',' +
                     ' fi_id ' + CD_ALIAS_CODIGO + ',' +
                     ' fi_firmante ' + CD_ALIAS_DESC + ',' +
                     ' fi_fechabaja ' + CD_ALIAS_BAJA +
                ' FROM cfi_firma, cfa_firmantearea, cat_areatexto' +
               ' WHERE fi_id = fa_idfirmante' +
                 ' AND at_id = fa_idareatexto' +
                 ' AND at_area IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
  end;

  with fraCorreo do
  begin
    Clave     := 'CORRE';
    ShowBajas := False;
  end;

  with fraTexto2 do
  begin
    TableName := 'ctc_textocarta';
    ShowBajas := False;
    Sql       :=
      'SELECT DISTINCT tc_id id, tc_codigo codigo, tc_nombre descripcion, tc_fechabaja baja' +
                ' FROM ctc_textocarta, cta_textoarea' +
               ' WHERE tc_id = ta_idtextocarta' +
                 ' AND ta_fechabaja IS NULL' +
                 ' AND ta_idtextocarta = ' + SqlValue(GetIdTextoAnexoRes365);
  end;

  with fraFirmante2 do
  begin
    TableName   := 'cfi_firma';
    FieldID     := 'fi_id';
    FieldCodigo := 'fi_id';
    FieldDesc   := 'fi_firmante';
    FieldBaja   := 'fi_fechabaja';
    ShowBajas   := False;

    Sql :=
      'SELECT DISTINCT fi_id ' + CD_ALIAS_ID + ',' +
                     ' fi_id ' + CD_ALIAS_CODIGO + ',' +
                     ' fi_firmante ' + CD_ALIAS_DESC + ',' +
                     ' fi_fechabaja ' + CD_ALIAS_BAJA +
                ' FROM cfi_firma, cfa_firmantearea, cat_areatexto' +
               ' WHERE fi_id = fa_idfirmante' +
                 ' AND at_id = fa_idareatexto' +
                 ' AND at_area IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
  end;

  with fraCorreo2 do
  begin
    Clave     := 'CORRE';
    ShowBajas := False;
  end;
end;

procedure TfrmImpresionContratos.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImpresionContratos.tbLimpiarClick(Sender: TObject);
begin
  edContratoDesde.Clear;
  edContratoHasta.Clear;

  fraStaticCTBRangoEmpleados.Clear;

  edContratoDesde.SetFocus;
end;

procedure TfrmImpresionContratos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuImpresionContratos.Enabled := True;

  Action := caFree;
end;

procedure TfrmImpresionContratos.btnSoloActivasClick(Sender: TObject);
var
  sTipoEmpresas: String;
begin
  if Validar then
    if MsgBox('Coloque los Contratos pre-impresos de Afiliación (Carta) en la bandeja superior de la impresora y los Anexos (Carta) en la bandeja inferior ¿Desea continuar?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      if Sender = btnSoloActivas then
        sTipoEmpresas := 'ACT'
      else if Sender = btnSoloDeBaja then
        sTipoEmpresas := 'BAJ';

      Do_Contrato_ImpresionMasiva(edContratoDesde.Value, edContratoHasta.Value, fraStaticCTBRangoEmpleados.edCodigo.Text,
        rgTipoImpresion.ItemIndex, sTipoEmpresas, chkTipoContratoCliente.Checked, chkTipoContratoAseguradora.Checked,
        chkTipoContratoAseguradoraArchivo.Checked);

      edContratoDesde.Value := edContratoHasta.Value + 1;
      edContratoHasta.Value := edContratoDesde.Value;
    end;
end;

function TfrmImpresionContratos.Validar: Boolean;
begin
  Verificar(edContratoDesde.IsEmpty, edContratoDesde, 'Debe ingresar el nro. de contrato inicial.');
  Verificar(edContratoHasta.IsEmpty, edContratoHasta, 'Debe ingresar el nro. de contrato final.');
  Verificar(edContratoHasta.Value < edContratoDesde.Value, edContratoDesde, 'El nro. de contrato final debe ser mayor o igual que el contrato inicial.');
  Verificar((not chkTipoContratoCliente.Checked) and (not chkTipoContratoAseguradora.Checked) and (not chkTipoContratoAseguradoraArchivo.Checked), chkTipoContratoCliente, 'Debe seleccionar el tipo de contrato.');

  Verificar(fraRegimen.IsEmpty, fraRegimen, 'Debe seleccionar el tipo de régimen de los contratos a imprimir');

  Verificar(chkImpCartaBienvenida.Checked and fraTexto.IsEmpty, fraTexto, 'Por favor, escoja el texto de la carta de bienvenida.');
  Verificar(chkImpCartaBienvenida.Checked and fraFirmante.IsEmpty, fraFirmante, 'Por favor, escoja el firmante de la carta de bienvenida.');
  Verificar(chkImpCartaBienvenida.Checked and fraCorreo.IsEmpty, fraCorreo, 'Por favor, escoja el correo de la carta de bienvenida.');

  Verificar(chkImprimirAnexo.Checked and fraTexto2.IsEmpty, fraTexto2, 'Por favor, escoja el texto del Anexo.');
  Verificar(chkImprimirAnexo.Checked and fraFirmante2.IsEmpty, fraFirmante2, 'Por favor, escoja el firmante del Anexo.');
  Verificar(chkImprimirAnexo.Checked and fraCorreo2.IsEmpty, fraCorreo2, 'Por favor, escoja el correo del Anexo.');

  Result := True;
end;

procedure TfrmImpresionContratos.Do_Contrato_ImpresionMasiva(aContratoInicial, aContratoFinal: Integer;
                                                             aRangoEmpleados: String; aTipoImpresion: Integer;
                                                             aTipoEmpresa: String; aTipoContratoCliente,
                                                             aTipoContratoAseguradora,
                                                             aTipoContratoAseguradoraArchivo: Boolean);
var
  bImprimir: Boolean;
  bTieneEstablecimientos: Boolean;
  iCantRegistros: Integer;
  iContrato: Integer;
  iFirmante: Integer;
  iFirmante2: Integer;
  iImprimio: Integer;
  iOldImpresora: Integer;
  qry: TSDQuery;
  sCorreo: String;
  sCorreo2: String;
  sMensEstado: String;
  sSql: String;
  sSqlContratos: String;
begin
  iImprimio := 0;

  aRangoEmpleados := Trim(aRangoEmpleados);
  if aRangoEmpleados = '' then
    aRangoEmpleados := '-1';   // todos los contratos, sin filtro por cant. de empleados

  sSqlContratos := 'afiliacion.get_contratos(:contratoinicial, :contratofinal, :rangoempleados, :usuario, :regimen);';
  EjecutarStoreEx(sSqlContratos, [aContratoInicial, aContratoFinal, aRangoEmpleados, frmPrincipal.DBLogin.UserId, IIF(fraRegimen.Value = 3, 1, fraRegimen.Value)]);

  sSql :=
    'SELECT aco.co_contrato, aco.co_fechaimpresion, aem.em_nombre' +
     ' FROM aco_contrato aco, aem_empresa aem, tmp_contratos tmp' +
    ' WHERE tmp.mp_usuario = :usuario' +
      ' AND tmp.mp_contrato = aco.co_contrato' +
      ' AND aco.co_idempresa = aem.em_id';

  if aTipoEmpresa = 'ACT' then        // sólo contratos con estados que permiten su impresión y no dados de baja
  begin
    sSql := sSql +
      ' AND afiliacion.get_impresion(aco.co_contrato) IS NOT NULL' +
      ' AND aco.co_estado = 1';
//                   'AND afiliacion.check_cobertura(aco.co_contrato) = 1';
    sMensEstado := 'en Estado Activo';
  end
  else if aTipoEmpresa = 'BAJ' then   // sólo contratos dados de baja
  begin
    sSql := sSql + ' AND afiliacion.check_cobertura(aco.co_contrato) <> 1';
    sMensEstado := 'Dados de Baja';
  end;

  sSql := sSql + ' ORDER BY aco.co_contrato';

  FPararImpresion := False;
  btnParar.Enabled := True;
  qry := GetQueryEx(sSql, [frmPrincipal.DBLogin.UserId]);
  iCantRegistros := qry.RecordCount;

  with qry do
  begin
    iOldImpresora := Printer.PrinterIndex;
    Printer.PrinterIndex := cmbImpresoras.ItemIndex;
    try
      if not Eof then
      begin
        iFirmante  := fraFirmante.Value;
        iFirmante2 := fraFirmante2.Value;
        sCorreo    := fraCorreo.Value;
        sCorreo2   := fraCorreo2.Value;

        with TfrmImprimeContrato.Create(nil) do
        try
          while not Eof do
          begin
            Verificar(FPararImpresion, btnParar, 'Ha decidido cancelar la impresión.');

            sSql :=
              'SELECT 1' +
               ' FROM aco_contrato' +
              ' WHERE co_contrato = :contrato' +
                ' AND co_fechaimpresion IS NULL';
            if (ExisteSqlEx(sSql, [FieldByName('co_contrato').AsInteger])) and (not Seguridad.Claves.IsActive('ImprimirContrato')) then
            begin
              qry.Next;
              Continue;
            end;

            ImprimeMembrete := Self.chkImprimirMembrete.Checked;

            iContrato := FieldByName('co_contrato').AsInteger;

            if FieldByName('co_fechaimpresion').IsNull then
              bImprimir := True
            else
            begin
              case aTipoImpresion of
                0: bImprimir := True;      // reimprimir siempre
                1: bImprimir := False;     // no reimprimir nunca
                2: bImprimir := (MsgBox(Format('¿ Desea reimprimir el contrato Nº %d, de la empresa %s ?', [iContrato, Trim(FieldByName('em_nombre').AsString)]), MB_ICONQUESTION + MB_YESNO) = IDYES)  // preguntar
              else
                bImprimir := False;
              end;
            end;

            if bImprimir then
            begin
              if chkImpCartaBienvenida.Checked then
                Do_ImprimirCartaBienvenida(iContrato, GetIdTextoCartaBienvenida, iFirmante, 1, sCorreo);

              Do_ImprimirContrato(iContrato, 1, chkTipoContratoCliente.Checked, chkTipoContratoAseguradora.Checked,
                                  chkTipoContratoAseguradoraArchivo.Checked);
              Do_ImprimirAnexoA(iContrato, 1, bTieneEstablecimientos);

              if chkImprimirAnexo.Checked then
              begin
                sSql :=
                  'SELECT MIN(tc_id)' +
                   ' FROM ctc_textocarta, cta_textoarea' +
                  ' WHERE tc_id = ta_idtextocarta' +
                    ' AND ta_fechabaja IS NULL' +
                    ' AND ta_idtextocarta = :idtextocarta';
                Do_ImprimirCartaAnexo(iContrato, ValorSqlIntegerEx(sSql, [GetIdTextoAnexoRes365]), iFirmante2, sCorreo2);
              end;

              iImprimio := iImprimio + 1;
              BarProgreso.Position := Round(iImprimio / iCantRegistros * 100);
            end;
            Application.ProcessMessages;
            qry.Next;
          end;
        finally
          Free;
        end;
      end;
    finally
      qry.free;
      Printer.PrinterIndex := iOldImpresora;
      btnParar.Enabled := False;
    end;
  end;

  MsgBox(Format('La cantidad de contratos solicitados para impresión es de: %d' + CRLF + 'El número de contratos %s es de: %d' + CRLF + 'Se han impreso %d contrato/s', [(aContratoFinal - aContratoInicial + 1), sMensEstado, iCantRegistros, iImprimio]), MB_ICONEXCLAMATION + MB_OK);
end;

procedure TfrmImpresionContratos.CargarImpresoras;
begin
  cmbImpresoras.Clear;
  cmbImpresoras.Items.Assign (Printer.Printers);
  cmbImpresoras.ItemIndex := Printer.PrinterIndex;
end;

procedure TfrmImpresionContratos.btnPararClick(Sender: TObject);
begin
  FPararImpresion  := True;
  btnParar.Enabled := False;
end;

procedure TfrmImpresionContratos.chkImpCartaBienvenidaClick(Sender: TObject);
var
  sSql: String;
begin
//  lbTexto.Enabled := chkImpCartaBienvenida.Checked;
//  fraTexto.Enabled := chkImpCartaBienvenida.Checked;

  lbFirmante.Enabled := chkImpCartaBienvenida.Checked;
  fraFirmante.Enabled := chkImpCartaBienvenida.Checked;

  lbCorreo.Enabled := chkImpCartaBienvenida.Checked;
  fraCorreo.Enabled := chkImpCartaBienvenida.Checked;

  sSql :=
    'SELECT tb_codigo' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''CBIEN''' +
      ' AND tb_codigo <> 0';
  fraTexto.Codigo := ValorSql(sSql);
end;

procedure TfrmImpresionContratos.chkImprimirAnexoClick(Sender: TObject);
var
  sSql: String;
begin
//  lbTexto2.Enabled := chkImprimirAnexo.Checked;
//  fraTexto2.Enabled := chkImprimirAnexo.Checked;

  lbFirmante2.Enabled := chkImprimirAnexo.Checked;
  fraFirmante2.Enabled := chkImprimirAnexo.Checked;

  lbCorreo2.Enabled := chkImprimirAnexo.Checked;
  fraCorreo2.Enabled := chkImprimirAnexo.Checked;

  sSql :=
    'SELECT tb_codigo' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''CANEX''' +
      ' AND tb_codigo <> 0';
  fraTexto2.Codigo := ValorSql(sSql);
end;

end.
