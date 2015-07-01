unit unFraNominas;

interface
              
uses     
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, ComCtrls, JvExComCtrls, JvComCtrls, Mask,
  PatternEdit, IntEdit, PeriodoPicker, ToolEdit, CurrEdit, DateTimeEditors,
  Grids, DBGrids, ToolWin, ExtCtrls, VCLExtra, DB, DBClient,
  DateComboBox, unFuncionesEmision, unConstEmision, unFraForm921,
  unFraFormNoSuss_NoSussCopia, unFraForm924_902, unFraFormNota,
  unFraForm929_569_593, unFraForm905, unFraForm900_926, unFraForm931,
  unFraForm165_170, unFraFormMixta931_170, unFraFormTicketPresentacion,
  unFraFormRCompl924_902, unDmPrincipal, SqlFuncs, DBSql, unSesion, Periodos,
  SDEngine, unfrmObservacionNota, AnsiSql, CustomDlgs, unFraFormMonoSol,
  unFraFormConstMono, unFraFormPagos, unFraCodigoDescripcion,
  unfraCodigoDescripcionExt, unFraFormConstInscrEmpl, unFraFormEscuelas,
  unfraFormAdicionarResumen, unFraFormAdicionarDetalle,
  unFraFormWebDetalleRNS, unFraFormSitFacturacion;

type
  TfraNominas = class(TFrame)
    lblTipoFormularioMultiperiodo: TLabel;
    pcDatosCargar: TJvPageControl;
    tb931: TTabSheet;
    tb165_170: TTabSheet;
    tb900_926: TTabSheet;
    tb905: TTabSheet;
    tb929_569_593: TTabSheet;
    tbNota: TTabSheet;
    tb924_902: TTabSheet;
    tbResMonoTribSol: TTabSheet;
    tbNada: TTabSheet;
    tb921: TTabSheet;
    lblPeriodosSolicitud: TLabel;
    ppPeriodoDesde: TPeriodoPicker;
    lblHastaPeriodos: TLabel;
    ppPeriodoHasta: TPeriodoPicker;
    tbPagos: TTabSheet;
    tbInfMixta931_170: TTabSheet;
    fraForm905: TfraForm905;
    fraForm929_569_593: TfraForm929_569_593;
    fraForm931: TfraForm931;
    fraForm900_926: TfraForm900_926;
    fraForm924_902: TfraForm924_902;
    tbTicketPresentacion: TTabSheet;
    tbRCompl924_902: TTabSheet;
    fraFormRCompl924_902: TfraFormRCompl924_902;
    fraFormTicketPresentacion: TFraFormTicketPresentacion;
    tbComandosObservacion: TToolBar;
    tbAddVerificacion: TToolButton;
    lblVerificacion: TLabel;
    fraFormNota: TfraFormNota;
    pnlColorEstado: TPanel;
    lblEstado: TLabel;
    fraFormMonoSol: TfraFormMonoSol;
    tbNoSuss_NoSussCopia: TTabSheet;
    fraForm921: TfraForm921;
    tbConstMonoTrib: TTabSheet;
    fraFormConstMono: TfraFormConstMono;
    fraFormMixta931_170: TfraFormMixta931_170;
    fraForm165_170: TfraForm165_170;
    fraFormPagos: TfraFormPagos;
    fraTipoFormulario: TfraCodigoDescripcionExt;
    cbIlegible: TCheckBox;
    tbConstInscrEmpl: TTabSheet;
    fraFormConstInscrEmpl: TfraFormConstInscrEmpl;
    tbFormEscuelas: TTabSheet;
    fraFormEscuelas: TfraFormEscuelas;
    edClase: TEdit;
    lblClase: TLabel;
    tbAdicionarResumen: TTabSheet;
    fraFormAdicionarResumen: TfraFormAdicionarResumen;
    tbAdicionarDetalle: TTabSheet;
    fraFormAdicionarDetalle: TfraFormAdicionarDetalle;
    fraFormNoSuss_NoSussCopia: TfraFormNoSuss_NoSussCopia;
    tbFormWeb: TTabSheet;
    fraFormWebDetalleRNS: TfraFormWebDetalleRNS;
    tbFormSituacionFacturacion: TTabSheet;
    FraFormSitFacturacion: TFraFormSitFacturacion;
    procedure ppPeriodosChange(Sender: TObject);
    procedure fraTipoFormularioedCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    FIdFormulario: integer;
    FForm: TForm;
    FFormObs: TfrmObservacionNota;
    FModoVer: boolean;
    FContrato: integer;
    FEstado: integer;
    FPeriodo: string;
    FConservarFechaPres: boolean;
    procedure SetEstado(const Value: integer);
    procedure GuardarBorradorAnexoIIExcepciones(aIdFormulario,
      aIdNota: integer; var aIdNotaPeriodo: integer; aPeriodo: String;
      aIlegible: boolean; aMixto: String);
    procedure SetPeriodo(const Value: string);
    procedure SetConservarFechaPres(const Value: boolean);
    procedure SetIdFormulario(const Value: integer);
    function PermiteModoRecepcion: boolean;
  public
    property ParentForm: TForm read FForm write FForm;
    property IdFormulario: integer read FIdFormulario write SetIdFormulario;
    property Contrato: integer read FContrato write FContrato;
    property Estado: integer read FEstado write SetEstado;
    property Periodo: string read FPeriodo write SetPeriodo;
    property ConservarFechaPres: boolean read FConservarFechaPres write SetConservarFechaPres;
    procedure Init;
    procedure OnChangeTipoFormulario(Sender: TObject);
    function ValidarCabecera: boolean;
    function ValidarFormulario: boolean;
    procedure GuardarFormularioBorrador(aIdNota : integer; var aIdNotaPeriodo: integer);
    procedure CargarFormulario(aIdFormulario, aIdNotaPeriodo: integer; aPeriodo: string; aModoVer: boolean; aIlegible: boolean);
    procedure CargarVerificaciones(aIdNotaPeriodo: integer);
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer);
    procedure ActivarControles(aActive: boolean);
    procedure MostrarBotones;
    procedure MostrarClaseDevengado;
    procedure InformarPeriodoAutorizacion;
  end;

implementation

uses objPeriodo,  unfrmABMNotas;

{$R *.dfm}

{ TfraNominas }

procedure TfraNominas.CargarFormulario(aIdFormulario, aIdNotaPeriodo: integer; aPeriodo: string; aModoVer: boolean; aIlegible: boolean);
begin
  FIdFormulario := aIdFormulario;
  FModoVer := aModoVer;
  ActivarControles(not aModoVer);
  fraTipoFormulario.Value := FIdFormulario;
  OnChangeTipoFormulario(self);
  fraTipoFormulario.Locked := true;
  ppPeriodoDesde.Periodo.Valor := aPeriodo;
  ppPeriodoHasta.Periodo.Valor := aPeriodo;

  cbIlegible.Checked := aIlegible;

  if (aIdNotaPeriodo <> -1) then
  begin
    ppPeriodoDesde.ReadOnly := true;
    ppPeriodoHasta.ReadOnly := true;
    ppPeriodoDesde.Color := clInactiveBorder;
    ppPeriodoHasta.Color := clInactiveBorder;
//    ppPeriodoDesde.Enabled := false;
//    ppPeriodoHasta.Enabled := false;
  end
  else begin
    ppPeriodoDesde.ReadOnly := false;
    ppPeriodoHasta.ReadOnly := false;
    ppPeriodoDesde.Color := clWindow;
    ppPeriodoHasta.Color := clWindow;
  end;

  case fraTipoFormulario.Value of
    //931
    TF_931:
      fraForm931.CargarFormulario(aIdNotaPeriodo);
    //165 - 170
    TF_165, TF_170:
      fraForm165_170.CargarFormulario(aIdNotaPeriodo);
    //900 - 926
    TF_900, TF_926:
      fraForm900_926.CargarFormulario(aIdNotaPeriodo);
    //905
    TF_905:
      fraForm905.CargarFormulario(aIdNotaPeriodo);
    //929 - 569 - 593
    TF_929,TF_569,TF_593:
      fraForm929_569_593.CargarFormulario(aIdNotaPeriodo);
    //Nota
    TF_Nota:
      fraFormNota.CargarFormulario(aIdNotaPeriodo);
    //924 - 902
    TF_924, TF_902:
      fraForm924_902.CargarFormulario(aIdNotaPeriodo);
    //Resumen Personal Prov ART Monotributistas Solamente - No Suss Original - No Suss Copia
    TF_RPMonotributistasSolamente:
      fraFormMonoSol.CargarFormulario(aIdNotaPeriodo);
    TF_RPNoSussOriginal,
    TF_RPNoSussOriginalCopia:
      fraFormNoSuss_NoSussCopia.CargarFormulario(aIdNotaPeriodo);
    //Anexo II (Excepciones)
    TF_AnexoIIExcepciones:
    begin
    end;
    //921
    TF_921:
      fraForm921.CargarFormulario(aIdNotaPeriodo);
    TF_Pagos:
      fraFormPagos.CargarFormulario(aIdNotaPeriodo);
    TF_InfMixta931_170:
      fraFormMixta931_170.CargarFormulario(aIdNotaPeriodo);
    TF_TicketPresentacion:
      fraFormTicketPresentacion.CargarFormulario(aIdNotaPeriodo);
    TF_ResumComplement924_902:
      fraFormRCompl924_902.CargarFormulario(aIdNotaPeriodo);
    TF_ConstanciaMonotributista:
      fraFormConstMono.CargarFormulario(aIdNotaPeriodo);
    TF_ConstInscripEmpleador:
      fraFormConstInscrEmpl.CargarFormulario(aIdNotaPeriodo);
    TF_DocumentacionEscuelas:
      fraFormEscuelas.CargarFormulario(aIdNotaPeriodo);
    TF_AdicionarResumen:
      fraFormAdicionarResumen.CargarFormulario(aIdNotaPeriodo);
    TF_AdicionarDetalle:
      fraFormAdicionarDetalle.CargarFormulario(aIdNotaPeriodo);
    TF_FormWebDetalleRNS:
      fraFormWebDetalleRNS.CargarFormulario(aIdNotaPeriodo);
    TF_FormSitFacturacion:
      FraFormSitFacturacion.CargarFormulario(aIdNotaPeriodo);
  end;
end;

procedure TfraNominas.GuardarFormularioBorrador(aIdNota : integer; var aIdNotaPeriodo: integer);
var
  aPeriodo: String;
begin

  if (aIdNota <= 0) then raise Exception.Create('Error. El id de la nota no fue generada.');

  if not Verificar(ExisteFormulario(aIdNota, aIdNotaPeriodo, fraTipoFormulario.Value,
                                ppPeriodoDesde.Periodo.Valor, ppPeriodoHasta.Periodo.Valor),
                                fraTipoFormulario.edCodigo, 'Existen períodos ya asociados a otros formularios en esta nota.') then
    Abort;

  if ExistePeriodo(aIdNota, aIdNotaPeriodo, fraTipoFormulario.Value,
                   ppPeriodoDesde.Periodo.Valor, ppPeriodoHasta.Periodo.Valor)
     and (MsgBox('Ya existen períodos asociados a este formulario en la nota.' + #13#10 +
                'Si continúa estos se actualizarán. ¿Desea continuar?', MB_ICONQUESTION + MB_YESNO) <> IDYES) then
    Abort;

  aPeriodo := ppPeriodoDesde.Periodo.Valor;

  while (aPeriodo <= ppPeriodoHasta.Periodo.Valor) or (aPeriodo = '') do
  begin
      case fraTipoFormulario.Value of
        //931
        TF_931:
          fraForm931.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        //165 - 170
        TF_165, TF_170:
          fraForm165_170.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        //900 - 926
        TF_900, TF_926:
          fraForm900_926.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        //905
        TF_905:
          fraForm905.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        //929 - 569 - 593
        TF_929,TF_569,TF_593:
          fraForm929_569_593.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        //Nota
        TF_Nota:
          fraFormNota.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        //924 - 902
        TF_924, TF_902:
          fraForm924_902.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        //Resumen Personal Prov ART Monotributistas Solamente - No Suss Original - No Suss Copia
        TF_RPMonotributistasSolamente:
          fraFormMonoSol.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        TF_RPNoSussOriginal,
        TF_RPNoSussOriginalCopia:
          fraFormNoSuss_NoSussCopia.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        //Anexo II (Excepciones)
        TF_AnexoIIExcepciones:
          GuardarBorradorAnexoIIExcepciones(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        //921
        TF_921:
          fraForm921.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        TF_Pagos:
          fraFormPagos.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        TF_InfMixta931_170:
          fraFormMixta931_170.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        TF_TicketPresentacion:
          fraFormTicketPresentacion.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        TF_ResumComplement924_902:
          fraFormRCompl924_902.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        TF_ConstanciaMonotributista:
          fraFormConstMono.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        TF_ConstInscripEmpleador:
          fraFormConstInscrEmpl.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        TF_DocumentacionEscuelas:
          fraFormEscuelas.GuardarBorrador(fraTipoFormulario.Value, aIdNota);
        TF_AdicionarResumen:
          fraFormAdicionarResumen.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo, aPeriodo, cbIlegible.Checked, 'N');
        TF_AdicionarDetalle:
          fraFormAdicionarDetalle.GuardarBorrador(fraTipoFormulario.Value, aIdNota);
        TF_FormSitFacturacion:
          FraFormSitFacturacion.GuardarBorrador(fraTipoFormulario.Value, aIdNota, aIdNotaPeriodo);
      end;

      if Assigned(FFormObs) then
        FFormObs.GuardarObservacion(aIdNotaPeriodo);

    aPeriodo := NextPeriodo(aPeriodo);
    if (aPeriodo = '') then break;
  end;

end;

procedure TfraNominas.Init;
begin
  with fraTipoFormulario do
  begin
    TableName   := 'EMI.ITF_TIPOFORMULARIO';
    FieldID     := 'TF_ID';
    FieldCodigo := 'TF_ID';
    FieldDesc   := 'TF_DESCRIPCION';
    FieldBaja   := 'TF_FECHABAJA';
//    DynamicCols := true;
    ShowBajas   := False;
    AutoExit    := False;
    ExtraFields :=  ', TF_IDMODOPRESENTACION ';
    OnChange := OnChangeTipoFormulario;
  end;

  pcDatosCargar.ActivePage := tb931;
  fraForm931.ActivarControles(false);
  if Assigned(FForm) then
  begin
    Self.Height := fraForm931.Height + 100;
    FForm.Height := Self.Height + 60;
  end;

//  ppPeriodoDesde.Periodo.SetPeriodoActual;
//  ppPeriodoDesde.Periodo.Previous;
//  ppPeriodoHasta.Periodo.SetPeriodoActual;
//  ppPeriodoHasta.Periodo.Previous;

  ppPeriodoDesde.Periodo.MaxPeriodo := '220001';
  ppPeriodoHasta.Periodo.MaxPeriodo := '220001';

  fraForm931.Init;
  fraForm900_926.Init;
  fraForm165_170.Init;
  fraFormMixta931_170.Init;
  fraFormTicketPresentacion.Init;
  fraFormNota.Init;
  fraFormPagos.Init;
  fraFormEscuelas.Init;
  fraFormAdicionarDetalle.Init;
end;

procedure TfraNominas.OnChangeTipoFormulario(Sender: TObject);
begin
  ppPeriodoHasta.Visible := true;
  lblHastaPeriodos.Visible := true;

  lblPeriodosSolicitud.Caption := 'Períodos:';
  LockControl(ppPeriodoHasta, false);
  LockControl(ppPeriodoDesde, false);
  LockControl(cbIlegible, false);

  FIdFormulario := fraTipoFormulario.Value;
  case fraTipoFormulario.Value of
    //931
    TF_931:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraForm931.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tb931;
      fraForm931.LimpiarControles;
      fraForm931.ActivarControles(not FModoVer);
      fraForm931.Contrato := FContrato;
    end;
    //165 - 170
    TF_165, TF_170:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraForm165_170.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tb165_170;
      fraForm165_170.LimpiarControles;
      fraForm165_170.ActivarControles(not FModoVer);
      fraForm165_170.Contrato := FContrato;
    end;
    //900 - 926
    TF_900, TF_926:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraForm900_926.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tb900_926;
      fraForm900_926.LimpiarControles;
      fraForm900_926.ActivarControles(not FModoVer);
      fraForm900_926.Contrato := FContrato;
    end;
    //905
    TF_905:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraForm905.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tb905;
      fraForm905.LimpiarControles;
      fraForm905.ActivarControles(not FModoVer);
      fraForm905.Contrato := FContrato;
    end;
    //929 - 569 - 593
    TF_929, TF_569, TF_593:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraForm929_569_593.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tb929_569_593;
      fraForm929_569_593.LimpiarControles;
      ppPeriodoDesde.Periodo.AllowNull := true;
      fraForm929_569_593.edPeriodoBaja := ppPeriodoDesde;
      fraForm929_569_593.ActivarControles(not FModoVer);
      fraForm929_569_593.Contrato := FContrato;
      ppPeriodoHasta.Visible := false;
      lblHastaPeriodos.Visible := false;
      lblPeriodosSolicitud.Caption := 'P.Sin Personal:';
    end;
    //Nota
    TF_NOTA:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormNota.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbNota;
      fraFormNota.LimpiarControles;
      fraFormNota.ActivarControles(not FModoVer);
      fraFormNota.Contrato := FContrato;
    end;
    //924 - 902
    TF_924, TF_902:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraForm924_902.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tb924_902;
      fraForm924_902.LimpiarControles;
      fraForm924_902.ActivarControles(not FModoVer);
      fraForm924_902.Contrato := FContrato;
    end;
    //Resumen Personal Prov ART Monotributistas Solamente - No Suss Original - No Suss Copia
    TF_RPMonotributistasSolamente:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormMonoSol.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbResMonoTribSol;
      fraFormMonoSol.LimpiarControles;
      fraFormMonoSol.ActivarControles(not FModoVer);
      fraFormMonoSol.Contrato := FContrato;
    end;
    TF_RPNoSussOriginal,
    TF_RPNoSussOriginalCopia:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormNoSuss_NoSussCopia.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbNoSuss_NoSussCopia;
      fraFormNoSuss_NoSussCopia.LimpiarControles;
      fraFormNoSuss_NoSussCopia.ActivarControles(not FModoVer);
      fraFormNoSuss_NoSussCopia.Contrato := FContrato;
    end;
    //Anexo II (Excepciones)
    TF_AnexoIIExcepciones:
    begin
    if Assigned(FForm) then
      begin
        Self.Height := 100;
        FForm.Height := Self.Height + 70;
      end;
      pcDatosCargar.ActivePage :=  tbNada;
    end;
    //921
    TF_921:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraForm921.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tb921;
      fraForm921.LimpiarControles;
      fraForm921.ActivarControles(not FModoVer);
      fraForm921.Contrato := FContrato;
    end;
    TF_Pagos:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormPagos.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbPagos;
      fraFormPagos.LimpiarControles;
      fraFormPagos.ActivarControles(not FModoVer);
      fraFormPagos.Contrato := FContrato;
    end;
    TF_InfMixta931_170:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormMixta931_170.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbInfMixta931_170;
      fraFormMixta931_170.LimpiarControles;
      fraFormMixta931_170.ActivarControles(not FModoVer);
      fraFormMixta931_170.Contrato := FContrato;
    end;
    TF_TicketPresentacion:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormTicketPresentacion.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbTicketPresentacion;
      fraFormTicketPresentacion.LimpiarControles;
      fraFormTicketPresentacion.ActivarControles(not FModoVer);
      fraFormTicketPresentacion.Contrato := FContrato;
    end;
    TF_ResumComplement924_902:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormRCompl924_902.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbRCompl924_902;
      fraFormRCompl924_902.LimpiarControles;
      fraFormRCompl924_902.ActivarControles(not FModoVer);
      fraFormRCompl924_902.Contrato := FContrato;
    end;

    TF_ConstanciaMonotributista:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormConstMono.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbConstMonoTrib;
      fraFormConstMono.LimpiarControles;
      fraFormConstMono.ActivarControles(not FModoVer);
      fraFormConstMono.Contrato := FContrato;
    end;

    TF_ConstInscripEmpleador:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormConstInscrEmpl.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      LockControl(ppPeriodoHasta, true);
      LockControl(ppPeriodoDesde, true);
      pcDatosCargar.ActivePage := tbConstInscrEmpl;
      fraFormConstInscrEmpl.LimpiarControles;
      fraFormConstInscrEmpl.ActivarControles(not FModoVer);
      fraFormConstInscrEmpl.Contrato := FContrato;
    end;
    TF_DocumentacionEscuelas:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormEscuelas.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbFormEscuelas;
      fraFormEscuelas.LimpiarControles;
      fraFormEscuelas.ActivarControles(not FModoVer);
      fraFormEscuelas.Contrato := FContrato;
      LockControl(ppPeriodoHasta, true);
      LockControl(ppPeriodoDesde, true);
      LockControl(cbIlegible, true);
    end;
    TF_AdicionarResumen:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormAdicionarResumen.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbAdicionarResumen;
      fraFormAdicionarResumen.LimpiarControles;
      fraFormAdicionarResumen.ActivarControles(not FModoVer);
      fraFormAdicionarResumen.Contrato := FContrato;
    end;
    TF_AdicionarDetalle:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormAdicionarDetalle.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbAdicionarDetalle;
      fraFormAdicionarDetalle.LimpiarControles;
      fraFormAdicionarDetalle.ActivarControles(not FModoVer);
      fraFormAdicionarDetalle.Contrato := FContrato;
      LockControl(ppPeriodoHasta, true);
      LockControl(ppPeriodoDesde, true);
      LockControl(cbIlegible, true);
      if Assigned(Owner.Owner) and (Owner.Owner is TfrmABMNotas) then
      begin
        TfrmABMNotas(Owner.Owner).IdleTimer.Enabled := false;
        TfrmABMNotas(Owner.Owner).IdleTimer.Tag := 1;
      end;
    end;
    TF_FormWebDetalleRNS:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := fraFormWebDetalleRNS.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbFormWeb;
      fraFormWebDetalleRNS.ActivarControles(not FModoVer);
      LockControl(ppPeriodoHasta, true);
      LockControl(ppPeriodoDesde, true);
      LockControl(cbIlegible, true);
    end;
    TF_FormSitFacturacion:
    begin
      if Assigned(FForm) then
      begin
        Self.Height := FraFormSitFacturacion.Height + 100;
        FForm.Height := Self.Height + 60;
      end;
      pcDatosCargar.ActivePage := tbFormSituacionFacturacion;
      FraFormSitFacturacion.LimpiarControles;
      FraFormSitFacturacion.ActivarControles(not FModoVer);
    end;
    else
    begin
      if Assigned(FForm) then
      begin
        Self.Height := 100;
        FForm.Height := Self.Height + 70;
      end;
      pcDatosCargar.ActivePage := tbNada;
    end;
  end;
  if Assigned(FForm) then
    FForm.Top := Round((Screen.Height - FForm.Height) / 2);

  MostrarBotones;
//  if not ppPeriodoDesde.Enabled then
//    PostMessage(ppPeriodoDesde.Handle, WM_SETFOCUS, 0, 0);
end;

function TfraNominas.ValidarFormulario: boolean;
begin
  case fraTipoFormulario.Value of
    //931
    TF_931:
    begin
      Result := cbIlegible.Checked or fraForm931.Validar(fraTipoFormulario.Value);
    end;
    //165 - 170
    TF_165, TF_170:
    begin
      Result := cbIlegible.Checked or fraForm165_170.Validar(fraTipoFormulario.Value);
    end;
    //900 - 926
    TF_900, TF_926:
    begin
      Result := cbIlegible.Checked or fraForm900_926.Validar(fraTipoFormulario.Value);
    end;
    //905
    TF_905:
    begin
      result := cbIlegible.Checked or fraForm905.Validar(fraTipoFormulario.Value);
    end;
    //929 - 569 - 593
    TF_929,TF_569,TF_593:
    begin
      result := cbIlegible.Checked or fraForm929_569_593.Validar(fraTipoFormulario.Value);
    end;
    //Nota
    TF_Nota:
    begin
      result := cbIlegible.Checked or fraFormNota.Validar(fraTipoFormulario.Value);
    end;
    //924 - 902
    TF_924,TF_902:
    begin
      result := cbIlegible.Checked or fraForm924_902.Validar(fraTipoFormulario.Value);
    end;
    //Resumen Personal Prov ART Monotributistas Solamente - No Suss Original - No Suss Copia
    TF_RPMonotributistasSolamente:
    begin
      result := cbIlegible.Checked or fraFormMonoSol.Validar(fraTipoFormulario.Value);
    end;
    TF_RPNoSussOriginal,
    TF_RPNoSussOriginalCopia:
    begin
      result := cbIlegible.Checked or fraFormNoSuss_NoSussCopia.Validar(fraTipoFormulario.Value);
    end;
    //Anexo II (Excepciones)
    TF_AnexoIIExcepciones:
    begin
      result := true;
    end;
    //921
    TF_921:
    begin
      result := cbIlegible.Checked or fraForm921.Validar(fraTipoFormulario.Value);
    end;
    TF_Pagos:
    begin
      result := cbIlegible.Checked or fraFormPagos.Validar(fraTipoFormulario.Value);
    end;
    TF_InfMixta931_170:
    begin
      result := cbIlegible.Checked or fraFormMixta931_170.Validar(fraTipoFormulario.Value);
    end;
    TF_TicketPresentacion:
    begin
      result := cbIlegible.Checked or fraFormTicketPresentacion.Validar(fraTipoFormulario.Value);
    end;
    TF_ResumComplement924_902:
    begin
      result := cbIlegible.Checked or fraFormRCompl924_902.Validar(fraTipoFormulario.Value);
    end;
    TF_ConstanciaMonotributista:
    begin
      result := cbIlegible.Checked or fraFormConstMono.Validar(fraTipoFormulario.Value);
    end;
    TF_ConstInscripEmpleador:
    begin
      result := cbIlegible.Checked or fraFormConstInscrEmpl.Validar(fraTipoFormulario.Value);
    end;
    TF_DocumentacionEscuelas:
      result := fraFormEscuelas.Validar(fraTipoFormulario.Value);
    TF_AdicionarResumen:
      result := fraFormAdicionarResumen.Validar(fraTipoFormulario.Value);
    TF_AdicionarDetalle:
      result := fraFormAdicionarDetalle.Validar(fraTipoFormulario.Value);
    TF_FormSitFacturacion:
      result := fraFormSitFacturacion.Validar(fraTipoFormulario.Value);
    else result := false;
  end;

  result := result and ValidarCabecera;
end;

procedure TfraNominas.CargarVerificaciones(aIdNotaPeriodo: integer);
begin
  if not Assigned(FFormObs) then
  begin
    FFormObs := TfrmObservacionNota.Create(Self);
    with FFormObs do
    begin
      CargarObservacion(aIdNotaPeriodo);

(*
      if (Observacion <> '') then
      begin
        lblObservaciones.Font.Style := [fsBold];
        lblObservaciones.Caption := 'Observaciones...';
      end;
*)
      if Assigned(FForm) then
      begin
        FFormObs.Left := FForm.Left + FForm.Width;
        FFormObs.Width := Screen.Width - FForm.Left - FForm.Width;
        FFormObs.Top := FForm.Top;
      end;
    end;
  end;
  FFormObs.Show;
end;

function TfraNominas.ValidarCabecera: boolean;
begin
  Verificar((not cbIlegible.Checked) and (not ppPeriodoDesde.ReadOnly) and (ppPeriodoDesde.Periodo.Valor = ''), ppPeriodoDesde, 'Debe ingresar el período inicial.');
  Verificar((ppPeriodoDesde.Periodo.Valor > ppPeriodoHasta.Periodo.Valor), ppPeriodoDesde, 'El período inicial debe ser menor final.');
//  Verificar((ppPeriodoHasta.Periodo.Valor >= ppPeriodoHasta.Periodo.GetPeriodoFromDate(DBDateTime)), ppPeriodoHasta, 'El período final debe ser menor al actual.');
  Verificar((ppPeriodoDesde.Periodo.Valor >= ppPeriodoDesde.Periodo.GetPeriodoFromDate(DBDateTime)), ppPeriodoDesde, 'El período inicial debe ser menor al actual.');
  Verificar((ppPeriodoHasta.Periodo.Valor >= ppPeriodoHasta.Periodo.GetPeriodoFromDate(DBDateTime)), ppPeriodoHasta, 'El período final debe ser menor al actual.');
  //tkt2610
  Verificar(not PermiteModoRecepcion, fraTipoFormulario, 'La empresa no admite la carga de este formulario por esta vía.');
  result := true;
end;

procedure TfraNominas.SimularEstado(aContrato, aIdNotaPeriodo: integer);
begin
  case fraTipoFormulario.Value of
    //931
    TF_931:
    begin
      fraForm931.SimularEstado(aContrato, aIdNotaPeriodo);
    end;
    //165 - 170
    TF_165, TF_170:
    begin
      fraForm165_170.SimularEstado(aContrato, aIdNotaPeriodo);
    end;
    //900 - 926
    TF_900, TF_926:
    begin
      fraForm900_926.SimularEstado(aContrato, aIdNotaPeriodo);
    end;
    //905
    TF_905:
    begin
      fraForm905.SimularEstado(aContrato, aIdNotaPeriodo);
    end;
    //929 - 569 - 593
    TF_929,TF_569,TF_593:
    begin
      fraForm929_569_593.SimularEstado(aContrato, aIdNotaPeriodo);
    end;
    //Nota
    TF_Nota:
    begin
      fraFormNota.SimularEstado(aContrato, aIdNotaPeriodo);
    end;
    //924 - 902
    TF_924,TF_902:
    begin
      fraForm924_902.SimularEstado(aContrato, aIdNotaPeriodo);
    end;
    //Resumen Personal Prov ART Monotributistas Solamente - No Suss Original - No Suss Copia
    TF_RPMonotributistasSolamente,
    TF_RPNoSussOriginal:
    begin
      fraFormNoSuss_NoSussCopia.SimularEstado(aContrato, aIdNotaPeriodo, fraTipoFormulario.Value);
    end;
    TF_RPNoSussOriginalCopia:
    begin
      fraFormMonoSol.SimularEstado(aContrato, aIdNotaPeriodo, fraTipoFormulario.Value);
    end;
    //Anexo II (Excepciones)
    TF_AnexoIIExcepciones:
    begin
    end;
    //921
    TF_921:
    begin
      fraForm921.SimularEstado(aContrato, aIdNotaPeriodo, fraTipoFormulario.Value);
    end;
    TF_Pagos:
    begin
    end;
    TF_InfMixta931_170:
    begin
    end;
    TF_TicketPresentacion:
    begin
    end;
    TF_ResumComplement924_902:
    begin
      fraFormRCompl924_902.SimularEstado(aContrato, aIdNotaPeriodo);
    end;
    TF_ConstanciaMonotributista:
    begin
      fraFormConstMono.SimularEstado(aContrato, aIdNotaPeriodo);
    end;
  end;
end;

procedure TfraNominas.ActivarControles(aActive: boolean);
begin
//  ppPeriodoDesde.Enabled := aActive;
//  ppPeriodoHasta.Enabled := aActive;
  ppPeriodoDesde.ReadOnly := not aActive;
  ppPeriodoHasta.ReadOnly := not aActive;
  tbAddVerificacion.Enabled := aActive;
  cbIlegible.Enabled := aActive;
end;

procedure TfraNominas.MostrarBotones;
begin

  case fraTipoFormulario.Value of
    //931
    TF_931:
    begin
      if (ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor) then
        fraForm931.Periodo := ppPeriodoDesde.Periodo.Valor;
    end;
    //165 - 170
    TF_165, TF_170:
    begin
    end;
    //900 - 926
    TF_900, TF_926:
    begin
    end;
    //905
    TF_905:
    begin
    end;
    //929 - 569 - 593
    TF_929,TF_569,TF_593:
    begin
    end;
    //Nota
    TF_Nota:
    begin
    end;
    //924 - 902
    TF_924, TF_902:
    begin
    end;
    //Resumen Personal Prov ART Monotributistas Solamente - No Suss Original - No Suss Copia
    TF_RPMonotributistasSolamente:
    begin
      fraFormMonoSol.MostrarBotones(ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor);
      if (ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor) then
        fraFormMonoSol.Periodo := ppPeriodoDesde.Periodo.Valor;
    end;
    TF_RPNoSussOriginal,
    TF_RPNoSussOriginalCopia:
    begin
(*
      fraFormNoSuss_NoSussCopia.MostrarBotones(ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor);
      if (ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor) then
        fraFormNoSuss_NoSussCopia.Periodo := ppPeriodoDesde.Periodo.Valor;
*)        
    end;
    //Anexo II (Excepciones)
    TF_AnexoIIExcepciones:
    begin
    end;
    //921
    TF_921:
    begin
    end;
    TF_Pagos:
    begin
      fraFormPagos.MostrarBotones(ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor);
      if (ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor) then
        fraFormPagos.Periodo := ppPeriodoDesde.Periodo.Valor;
    end;
    TF_InfMixta931_170:
    begin
      fraFormMixta931_170.MostrarBotones(ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor);
      if (ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor) then
        fraFormMixta931_170.Periodo := ppPeriodoDesde.Periodo.Valor;
    end;
    TF_TicketPresentacion:
    begin
      FraFormTicketPresentacion.MostrarBotones(ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor);
      if (ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor) then
        FraFormTicketPresentacion.Periodo := ppPeriodoDesde.Periodo.Valor;
    end;
    TF_ResumComplement924_902:
    begin
      fraFormRCompl924_902.MostrarBotones(ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor);
      if (ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor) then
        fraFormRCompl924_902.Periodo := ppPeriodoDesde.Periodo.Valor;
    end;
    TF_ConstanciaMonotributista:
    begin
      fraFormConstMono.MostrarBotones(ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor);
      if (ppPeriodoDesde.Periodo.Valor = ppPeriodoHasta.Periodo.Valor) then
        fraFormConstMono.Periodo := ppPeriodoDesde.Periodo.Valor;
    end;
    TF_AdicionarResumen:
    begin
    end;
  end;
end;

procedure TfraNominas.ppPeriodosChange(Sender: TObject);
begin
  MostrarBotones;
  if not ppPeriodoHasta.Visible then
    ppPeriodoHasta.Periodo.Valor := ppPeriodoDesde.Periodo.Valor;
  MostrarClaseDevengado;
  InformarPeriodoAutorizacion;
end;

procedure TfraNominas.SetEstado(const Value: integer);
begin
  FEstado := Value;
  if FModoVer then
  begin
    pnlColorEstado.Visible := true;
    lblEstado.Visible := true;
    if (FEstado = ESTADO_FORMULARIO_REPETIDO) then
    begin
      pnlColorEstado.Color  := $00C6FFC6;
      lblEstado.Caption := 'Repetido';
    end;

    if (FEstado = ESTADO_FORMULARIO_NO_PROCESADO) then
    begin
      pnlColorEstado.Color := $00C4C4FF;
      lblEstado.Caption := 'No Procesado';
    end;

    if (FEstado = ESTADO_FORMULARIO_PROCESADO) then
    begin
      pnlColorEstado.Color := $00E1FFFF;
      lblEstado.Caption := 'Procesado';
    end;

    if (FEstado = ESTADO_FORMULARIO_AUTORIZACION) then
    begin
      pnlColorEstado.Color := clSkyBlue;
      lblEstado.Caption := 'Pend.Aprob.';
    end;

    pnlColorEstado.Refresh;
    lblEstado.Refresh;
  end;

end;

procedure TfraNominas.GuardarBorradorAnexoIIExcepciones(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
  aPeriodo: string; aIlegible: boolean; aMixto: String);
begin

  aIdNotaPeriodo := ValorSqlInteger(' SELECT NP_ID ' +
                                    ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                                    ' WHERE NP_IDNOTA = ' + SqlValue(aIdNota) +
                                    ' AND NP_PERIODO = ' + SqlValue(aPeriodo) +
                                    ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(aIdFormulario) +
                                    ' AND NP_FORMULARIOMIXTO = ' + SqlValue(aMixto), -1);//aIdNotaPeriodo);

  with TSql.Create do
  try
    TableName := 'EMI.INP_NOTACONTRATOPERIODO';
    Fields.Add('NP_PERIODO', aPeriodo);
    Fields.Add('NP_IDNOTA', aIdNota);
    Fields.Add('NP_IDTIPOFORMULARIO', aIdFormulario);

    if (aIdNotaPeriodo = -1) then
    begin
      SqlType := stInsert;
      aIdNotaPeriodo := GetSecNextVal('emi.seq_inp_id');
      PrimaryKey.Add('NP_ID', aIdNotaPeriodo);
      Fields.Add('NP_FECHAALTA', exDateTime);
      Fields.Add('NP_USUALTA', Sesion.LoginName);
    end
    else begin
      SqlType := stUpdate;
      PrimaryKey.Add('NP_ID', aIdNotaPeriodo);
      Fields.Add('NP_FECHAMODIF', exDateTime);
      Fields.Add('NP_USUMODIF', Sesion.LoginName);
    end;

    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);
    Fields.Add('NP_ILEGIBLE', aIlegible);

    EjecutarSqlST(Sql);
  finally
    free;
  end;
end;

procedure TfraNominas.fraTipoFormularioedCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) then
  begin
    fraTipoFormulario.AutoExit := true;
    fraTipoFormulario.edCodigoKeyDown(Sender, Key, Shift);
    if ppPeriodoDesde.Enabled then
      PostMessage(ppPeriodoDesde.Handle, WM_SETFOCUS, 0, 0);
  end;
end;

procedure TfraNominas.SetPeriodo(const Value: string);
begin
  FPeriodo := Value;
  ppPeriodoDesde.Periodo.Valor := FPeriodo;
  ppPeriodoHasta.Periodo.Valor := FPeriodo;
end;

procedure TfraNominas.SetConservarFechaPres(const Value: boolean);
begin
  FConservarFechaPres := Value;
  case fraTipoFormulario.Value of
    //931
    TF_931:
      fraForm931.ConservarFechaPres := FConservarFechaPres;
    //165 - 170
    TF_165, TF_170:
      fraForm165_170.ConservarFechaPres := FConservarFechaPres;
    //900 - 926
    TF_900, TF_926:
      fraForm900_926.ConservarFechaPres := FConservarFechaPres;
    //905
    TF_905:
      fraForm905.ConservarFechaPres := FConservarFechaPres;
    //929 - 569 - 593
    TF_929,TF_569,TF_593:
    begin
    end;
    //Nota
    TF_Nota:
      fraFormNota.ConservarFechaPres := FConservarFechaPres;
    //924 - 902
    TF_924, TF_902:
      fraForm924_902.ConservarFechaPres := FConservarFechaPres;
    //Resumen Personal Prov ART Monotributistas Solamente - No Suss Original - No Suss Copia
    TF_RPMonotributistasSolamente:
      fraFormMonoSol.ConservarFechaPres := FConservarFechaPres;
    TF_RPNoSussOriginal,
    TF_RPNoSussOriginalCopia:
      fraFormNoSuss_NoSussCopia.ConservarFechaPres := FConservarFechaPres;
    //Anexo II (Excepciones)
    TF_AnexoIIExcepciones:
    begin
    end;
    //921
    TF_921:
      fraForm921.ConservarFechaPres := FConservarFechaPres;
    TF_Pagos:
    begin
    end;
    TF_InfMixta931_170:
      fraFormMixta931_170.ConservarFechaPres := FConservarFechaPres;
    TF_TicketPresentacion:
      fraFormTicketPresentacion.ConservarFechaPres := FConservarFechaPres;
    TF_ResumComplement924_902:
    begin
    end;
    TF_ConstanciaMonotributista:
    begin
    end;
    TF_ConstInscripEmpleador:
    begin
    end;
    TF_DocumentacionEscuelas:
    begin
    end;
    TF_AdicionarResumen:
      fraFormAdicionarResumen.ConservarFechaPres := FConservarFechaPres;
  end;

end;

procedure TfraNominas.SetIdFormulario(const Value: integer);
begin
  FIdFormulario := Value;
  fraTipoFormulario.Value := Value;
end;

procedure TfraNominas.InformarPeriodoAutorizacion;
begin
  if Assigned(FForm) and not FModoVer then
  begin
    if (ppPeriodoDesde.Periodo.Valor <> '') and ExisteSqlEx(' SELECT 1 FROM ' +
                                                            ' EMI.IRP_RESUMENPERIODO ' +
                                                            ' WHERE RP_CONTRATO = :Contrato AND ' +
                                                            ' RP_PERIODO = :Periodo AND ' +
                                                            ' RP_ESTADO = :Estado ', [FContrato, ppPeriodoDesde.Periodo.Valor, 'P']) then
    begin
      if FForm.Visible then
        InvalidHint(ppPeriodoDesde, 'El período ' + ppPeriodoDesde.Periodo.Valor + ' está pendiente de autorización.', 'Carga de Notas', blnInfo, 3, false)
      else
        InvalidHint(FForm, 'El período ' + ppPeriodoDesde.Periodo.Valor + ' está pendiente de autorización.', 'Carga de Notas', blnInfo, 3, false);
    end;

    if (ppPeriodoHasta.Periodo.Valor <> '')
        and (ppPeriodoDesde.Periodo.Valor <> ppPeriodoHasta.Periodo.Valor)
        and ExisteSqlEx(' SELECT 1 FROM ' +
                        ' EMI.IRP_RESUMENPERIODO ' +
                        ' WHERE RP_CONTRATO = :Contrato AND ' +
                        ' RP_PERIODO = :Periodo AND ' +
                        ' RP_ESTADO = :Estado ', [FContrato, ppPeriodoHasta.Periodo.Valor, 'P']) then
    begin
      if FForm.Visible then
        InvalidHint(ppPeriodoHasta, 'El período ' + ppPeriodoHasta.Periodo.Valor + ' está pendiente de autorización.', 'Carga de Notas', blnInfo, 3, false)
      else
        InvalidHint(FForm, 'El período ' + ppPeriodoHasta.Periodo.Valor + ' está pendiente de autorización.', 'Carga de Notas', blnInfo, 3, false);
    end;
  end;
end;

procedure TfraNominas.MostrarClaseDevengado;
begin
  if not (get_coberturaCobranza(FContrato, ppPeriodoDesde.Periodo.Valor)) then
      edClase.Text := 'Período sin cobertura, no corresponde devengar.'
  else begin
    edClase.Text := ValorSqlEx(' SELECT rc_clase || '' - '' || tb_descripcion ' +
                               ' FROM cob.zrc_resumencobranza, ctb_tablas ' +
                               ' WHERE tb_clave = ''CODEV'' ' +
                               ' AND rc_clase = tb_codigo ' +
                               ' AND rc_contrato = :contrato ' +
                               ' AND rc_periodo = :periodo ', [FContrato, ppPeriodoDesde.Periodo.Valor], '');
    if (edClase.Text = '') then
      edClase.Text := 'Período con cobertura sin devengado efectuado.'
  end;
end;

function TfraNominas.PermiteModoRecepcion: boolean;
var
  idEmpresa: integer;
  aPeriodo: String;
  idModPres: integer;
begin
  result := true;
  idEmpresa := ValorSqlIntegerEx('SELECT CO_IDEMPRESA FROM AFI.ACO_CONTRATO WHERE CO_CONTRATO = :CONTRATO', [FContrato]);
  aPeriodo := ppPeriodoDesde.Periodo.Valor;
  while (aPeriodo <> '') and (aPeriodo <= ppPeriodoHasta.Periodo.Valor) do
  begin
    idModPres := get_modopresentacion(idEmpresa, aPeriodo);

    if (not fraTipoFormulario.sdqDatos.FieldByName('TF_IDMODOPRESENTACION').IsNull) and
       (idModPres <> MODO_PRESENTACION_MIXTO) and
       (fraTipoFormulario.sdqDatos.FieldByName('TF_IDMODOPRESENTACION').AsInteger <> idModPres) then
    begin
      result := false;
      break;
    end;
    aPeriodo := NextPeriodo(aPeriodo);
    if (aPeriodo = '') then break;
  end;
end;

end.

