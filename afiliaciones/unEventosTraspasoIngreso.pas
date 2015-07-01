unit unEventosTraspasoIngreso;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   01-06-03
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ToolEdit, ArtComboBox, StdCtrls, CurrEdit,
  DateComboBox, unArtFrame, Mask, ComCtrls, ToolWin, unART, Db, SDEngine, ShortCutControl, PeriodoPicker,
  unFraStaticCTB_TABLAS, unFraStaticCodigoDescripcion, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unFraEmpresaAfi,
  unFraEmpresaSolicitud;

type
  TfrmEventosTraspasoIngreso = class(TForm)
    Label10: TLabel;
    Label1: TLabel;
    cmbFecha: TDateComboBox;
    Label2: TLabel;
    edDeuda: TCurrencyEdit;
    Label3: TLabel;
    edObservaciones: TMemo;
    ToolBar1: TToolBar;
    tbGrabar: TToolButton;
    ToolButton3: TToolButton;
    tbSalir: TToolButton;
    ShortCutControl1: TShortCutControl;
    Label12: TLabel;
    edTI_PERIODO: TPeriodoPicker;
    fraEventos: TfraStaticCTB_TABLAS;
    Label4: TLabel;
    fraEmpresa: TfraEmpresaSolicitud;
    fraArtAnterior: TfraStaticCodigoDescripcion;
    Label5: TLabel;
    procedure tbGrabarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CambiaEmpresa(Sender: TObject);
  private
    FCargaMasiva: Boolean;
    FFuncion: TFuncionShowForm;
    FTI_ID: Integer; //TI_ID para modificar

    function IsValidar: Boolean;

    procedure ClearControls;
    procedure DoModificarDatos;
  public
    function DoCargarDatos(aId: TTableID; aFuncion: TFuncionShowForm): Boolean;

    procedure DoAgregarDatos(const aIdFormulario: Integer; const aDeuda: Extended; aCodigo, aObservaciones,
                             aPeriodo: String; const aFecha: TDateTime; const aTransaction: Boolean = True;
                             const aShowMessages: Boolean = True);

    property CargaMasiva: Boolean read FCargaMasiva write FCargaMasiva default False;
  end;

var
  frmEventosTraspasoIngreso: TfrmEventosTraspasoIngreso;

implementation

{$R *.DFM}

uses
  CustomDlgs, unPrincipal, AnsiSQL, General, unDmPrincipal, SqlFuncs, VclExtra, Variants, Periodo, unQRF817, unComunes,
  ArchFuncs, unEnvioMail, unMoldeEnvioMail;

function TfrmEventosTraspasoIngreso.DoCargarDatos(aId: TTableID; aFuncion: TFuncionShowForm): Boolean;
var
  sSql: String;
begin
  Result := True;

  // En el caso de AGREGAR en iId viene TI_IDFORMULARIO se guarda en el fraEmpresa.ID
  // En el caso de MODIFICAR en iId viene TI_ID, se guarda en FTI_ID (global scope)
  FFuncion := aFuncion;

  try
    if FFuncion = fsAgregar then
    begin
      Caption := 'Administración de Evento de Traspaso Ingreso (Agregar)';
      LockControls([fraEventos, cmbFecha, edDeuda, edTI_PERIODO], False);

      fraEmpresa.ID := aId;
      fraEventos.Clave := 'EVTIN';
    end
    else // FFuncion = fsModificar
    begin
      Caption := 'Administración de Evento de Traspaso Ingreso (Modificar)';
      LockControls([fraEventos, cmbFecha, edDeuda, edTI_PERIODO], True);

      sSql :=
        'SELECT fo_formulario, sa_cuit, sa_idartanterior, ti_codigo, ti_deuda, ti_fecha, ti_observaciones, ti_periodo' +
         ' FROM ati_traspasoingreso, asa_solicitudafiliacion, afo_formulario' +
        ' WHERE ti_idformulario = sa_idformulario' +
          ' AND ti_idformulario = fo_id' +
          ' AND ti_id = :id';
      with GetQueryEx(sSql, [aId]) do
      try
//        fraEmpresa.CUIT            := FieldByName('sa_cuit').AsString;
        fraEmpresa.Formulario      := FieldByName('fo_formulario').AsString;
        fraArtAnterior.Value       := FieldByName('sa_idartanterior').AsInteger;
        fraEventos.Value           := FieldByName('ti_codigo').AsString;
        cmbFecha.Text              := FieldByName('ti_Fecha').AsString;
        edDeuda.Value              := FieldByName('ti_deuda').AsFloat;
        edTI_PERIODO.Periodo.Valor := FieldByName('ti_periodo').AsString;
        edObservaciones.Lines.Text := FieldByName('ti_observaciones').AsString;
        FTI_ID                     := aId;
      finally
        Free;
      end;
    end;
  except
    on E: Exception do
    begin
      ErrorMsg(E, 'Ha ocurrido un error en la recuperación de datos');
      Result := false;
    end;
  end;
end;

function TfrmEventosTraspasoIngreso.IsValidar: Boolean;
  procedure Verificar(Condicion: Boolean; AControl: TWinControl; AText: String);
  begin
    if Condicion then
    begin
      InvalidMsg(AControl, AText);
      Abort;
    end;
  end;
var
  wDia: word;
  wMes: word;
  wAno: word;
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'La empresa es obligatoria.');
  Verificar(fraEventos.IsEmpty, fraEventos.edCodigo, 'El evento no puede quedar en blanco.');
  Verificar(cmbFecha.IsEmpty, cmbFecha, 'La fecha es obligatoria.');

  DecodeDate(cmbFecha.Date, wAno, wMes, wDia);
  Verificar((fraEventos.Value = '099') and (wDia <> 1), cmbFecha, 'Si el evento es ''099'', entonces el día debe ser el primero del mes.');

  Verificar((edTI_PERIODO.Periodo.Valor <> '') and (edDeuda.Value <= 0), edDeuda, 'Si el período no es nulo, debe ingresar el monto de la deuda.');
  Verificar((edDeuda.Value > 0) and (edTI_PERIODO.Periodo.Valor = ''), edTI_PERIODO, 'El período de deuda es obligatorio si posee deuda.');

  Result := true;
end;


procedure TfrmEventosTraspasoIngreso.CambiaEmpresa(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT sa_idartanterior' +
     ' FROM asa_solicitudafiliacion' +
    ' WHERE sa_idformulario = :idformulario';
  fraArtAnterior.Value := ValorSqlIntegerEx(sSql, [fraEmpresa.ID]);
end;

procedure TfrmEventosTraspasoIngreso.ClearControls;
begin
  fraEmpresa.Clear;
  fraArtAnterior.Clear;
  fraEventos.Clear;
  cmbFecha.Clear;
  edTI_PERIODO.Clear;
  edDeuda.Clear;
  edObservaciones.Clear;

  fraEmpresa.mskCUIT.SetFocus;
end;

procedure TfrmEventosTraspasoIngreso.DoAgregarDatos(const aIdFormulario: Integer; const aDeuda: Extended; aCodigo,
                                                    aObservaciones, aPeriodo: String; const aFecha: TDateTime;
                                                    const aTransaction: Boolean = True;
                                                    const aShowMessages: Boolean = True);
var
  aSqlATI: TSql;
  iIdTraspasoIngreso: Integer;
  sBody: String;
  sEmailDestino: String;
  sNombreArchivo817: String;
  sRazonSocial: String;
  sSql: String;
  sTipoAsociado: String;
begin
  // Los inserts a la tabla ATI_TRASPASOINGRESO dentro de Afiliaciones se hacen todo en este procedimiento..

  if Pos('/', aPeriodo) > 0 then
    aPeriodo := PeriodoSacarBarra(aPeriodo);

  aSqlATI := TSql.Create('ati_traspasoingreso');
  try
    aSqlATI.SqlType := stInsert;
    aSqlATI.PrimaryKey.Add('ti_id',       'SEQ_ATI_ID.NEXTVAL', False);
    aSqlATI.Fields.Add('ti_idformulario',  aIdFormulario);
    aSqlATI.Fields.Add('ti_codigo',        aCodigo);
    aSqlATI.Fields.Add('ti_fecha',         aFecha);
    aSqlATI.Fields.Add('ti_observaciones', aObservaciones);
    aSqlATI.Fields.Add('ti_deuda',         aDeuda);
    aSqlATI.Fields.Add('ti_periodo',       aPeriodo);
    aSqlATI.Fields.Add('ti_usualta',       frmPrincipal.DBLogin.UserId);
    aSqlATI.Fields.Add('ti_fechaalta',     SQL_ACTUALDATE, False);

    // Cuando se ingresa un evento donde el tipo asociado (tb_especial2) es 02
    // el estado de la solicitud debe pasar a 7.1, en el caso de que sea 3 o 4
    // el estado debe pasar a 7.2
    sSql :=
      'SELECT tb_especial2' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''EVTIN''' +
        ' AND tb_codigo = :codigo';
    sTipoAsociado := ValorSqlEx(sSql, [aCodigo]);
    if aTransaction then
      BeginTrans;

    try
      if aCodigo = '002' then
      begin
        sSql :=
          'UPDATE asa_solicitudafiliacion' +
            ' SET sa_estado = ''7.0''' +
          ' WHERE sa_idformulario = :idformulario';
        EjecutarSqlSTEx(sSql, [aIdFormulario]);
      end
      else if aCodigo = '030' then
      begin
        sSql :=
          'UPDATE asa_solicitudafiliacion' +
            ' SET sa_estado = ''30''' +
          ' WHERE sa_idformulario = :idformulario';
        EjecutarSqlSTEx(sSql, [aIdFormulario]);
      end
      else if sTipoAsociado = '2' then
      begin
        sSql :=
          'UPDATE asa_solicitudafiliacion' +
            ' SET sa_estado = ''7.1''' +
          ' WHERE sa_idformulario = :idformulario';
        EjecutarSqlSTEx(sSql, [aIdFormulario]);
      end
      else if ((sTipoAsociado = '3') or (sTipoAsociado = '4')) then
      begin
        sSql :=
          'UPDATE asa_solicitudafiliacion' +
            ' SET sa_estado = ''7.2''' +
          ' WHERE sa_idformulario = :id';
        EjecutarSqlSTEx(sSql, [aIdFormulario]);
      end;
      EjecutarSQLST(aSqlATI.Sql);

      if aCodigo = '20' then
      begin
        sSql :=
          'SELECT NVL(uw_mail, ''bna@provart.com.ar'')' +
           ' FROM asa_solicitudafiliacion JOIN xev_entidadvendedor ON ev_idvendedor = sa_idvendedor' +
                ' LEFT JOIN art.auw_usuarioweb ON uw_idvendedor = sa_idvendedor' +
          ' WHERE ev_identidad IN(400, 314, 9022)' +
            ' AND sa_idformulario = :idformulario';
        sEmailDestino := ValorSqlEx(sSql, [aIdFormulario]);

        if sEmailDestino <> '' then
        begin
          sSql :=
            'SELECT sa_nombre' +
             ' FROM asa_solicitudafiliacion' +
            ' WHERE sa_idformulario = :idformulario';
          sRazonSocial := ValorSqlEx(sSql, [aIdFormulario]);

          sSql := 'SELECT MAX(ti_id) FROM ati_traspasoingreso WHERE ti_idformulario = :idformulario';
          iIdTraspasoIngreso := ValorSqlIntegerEx(sSql, [aIdFormulario]);

          sNombreArchivo817 := Format(TempPath + 'F817_%d.pdf', [aIdFormulario]);
          Do_ImprimirF817(ART_EMPTY_ID, 0, srPreview, 1, sNombreArchivo817, iIdTraspasoIngreso);

          sBody := Format(
            'Cumplimos en informarle que la solicitud de afiliación de la empresa %s, ha sido rechazada por deuda con' +
            ' su actual ART.' + #13#10 +
            'Con el fin de no perder el esfuerzo realizado hasta el momento, le sugerimos activar la regularización' +
            ' de la misma.  Para ello, ajuntamos el formulario F.817 AFIP utilizado para pagar el importe' +
            ' informado' + #13#10#13#10 +
            'Tenga en cuenta que la imputación del pago sea con no menos de dos meses de atraso respecto al mes en' +
            ' curso.' + #13#10#13#10 +
            'Al regularizar el cliente la situación, Ud. deberá enviar el comprobante de pago (ticket) escaneado a' +
            ' nuestra casilla bna@provart.com.ar a la brevedad para que, de ese modo, solicitemos la aprobación del' +
            ' traspaso a la actual ART.' + #13#10#13#10 +
            'El plazo máximo de recepción de los tickets de pago es hasta el día 5 del próximo mes o día hábil' +
            ' anterior, solicitando amablemente que tramiten dicha regularización en forma urgente para su aprobación' +
            ' por la SRT y, culminar así exitosamente toda la gestión comercial realizada por Ud.' + #13#10#13#10 +
            'Atte.' + #13#10#13#10 +
            'Canal Bancos' + #13#10 +
            'Gerencia Comercial' + #13#10#13#10 +
            'Provincia ART S.A.' + #13#10 +
            'Carlos Pellegrini 91, piso 5' + #13#10 +
            'C1009ABA C.A.B.A.' + #13#10 +
            'Tel (011) 4338-4773' + #13#10 +
            'Cel (011) 15 3762-8532' + #13#10 +
            'www.provinciart.com.ar',
            [sRazonSocial]);

          unEnvioMail.EnviarMailBD(sEmailDestino,
                                   'Traspaso ingreso rechazado.',
                                   [oSinNotaAlPie, oDeleteAttach, oDisableBody, oDisableAdjuntos, oDisableAsunto],
                                   [sNombreArchivo817],
                                   sBody,
                                   0,
                                   tcDefault,
                                   not aTransaction,
                                   False,
                                   2500,
                                   -1,
                                   [],
                                   '',
                                   False,
                                   '',
                                   'ATI',
                                   iIdTraspasoIngreso);
        end;
      end;

      if aTransaction then
        CommitTrans;

      if aShowMessages then
      begin
        if FCargaMasiva then
        begin
          InfoHint(tbGrabar, 'La operación se realizó con éxito.', False, 'Información', blnInfo, 1, False);
          ClearControls;
        end
        else
        begin
          MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
          Close;
        end;
      end;
    except
      on E: Exception do
      begin
        if aTransaction then
          RollBack;

        if aShowMessages then
          ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  finally
    aSqlATI.Free;
  end;
end;

procedure TfrmEventosTraspasoIngreso.DoModificarDatos;
var
  sSql: String;
begin
  try
    sSql :=
      'UPDATE ati_traspasoingreso' +
        ' SET ti_observaciones = :observaciones,' +
            ' ti_usumodif = :usumodif,' +
            ' ti_fechamodif = actualdate' +
      ' WHERE ti_id = :id';
    EjecutarSqlEx(sSql, [edObservaciones.Lines.Text, frmPrincipal.DBLogin.UserId, FTI_ID]);
    
    MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
    Close;
  except
    on E: Exception do
      ErrorMsg(E, 'Se produjo un error en la actualización.');
  end;
end;

procedure TfrmEventosTraspasoIngreso.tbGrabarClick(Sender: TObject);
begin
  case FFuncion of
    fsAgregar:
      if isValidar then
        DoAgregarDatos(fraEmpresa.ID, edDeuda.Value, fraEventos.edCodigo.Text, edObservaciones.Lines.Text,
                       edTI_PERIODO.Periodo.Valor, cmbFecha.Date);
    fsModificar:
      DoModificarDatos;
  end;
end;

procedure TfrmEventosTraspasoIngreso.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEventosTraspasoIngreso.FormCreate(Sender: TObject);
begin
  inherited;

  fraArtAnterior.TableName   := 'aar_art';
  fraArtAnterior.FieldID     := 'ar_id';
  fraArtAnterior.FieldCodigo := 'ar_id';
  fraArtAnterior.FieldDesc   := 'ar_nombre';
  fraArtAnterior.FieldBaja   := 'ar_fechabaja';

  fraEmpresa.IncluirContratos := False;
  fraEmpresa.OnChange := CambiaEmpresa;

  fraEventos.Clave := 'EVTIN';

  LockControls(fraArtAnterior, True);
end;

end.
