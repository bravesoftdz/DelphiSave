unit unServiciosAEmpresas;     // TK 45064

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, AnsiSql, FormPanel, PeriodoPicker, Periodo, General;

type
  TfrmServiciosAEmpresas = class(TfrmCustomConsulta)
    Label1: TLabel;
    fraES_IDPRESTADORA: TfraCodigoDescripcion;
    ShortCutControlHijo: TShortCutControl;
    fpSeleccionarPeriodo: TFormPanel;
    BevelAbm: TBevel;
    Label2: TLabel;
    btnAceptarPeriodo: TButton;
    btnCancelarPeriodo: TButton;
    ppPeriodo: TPeriodoPicker;
    sdqConsultaES_ID: TFloatField;
    sdqConsultaES_IDEMPRESA: TFloatField;
    sdqConsultaES_IDPRESTADORA: TFloatField;
    sdqConsultaEP_DESCRIPCION: TStringField;
    sdqConsultaES_FECHABAJA: TDateTimeField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaEM_CUIT: TStringField;
    pnlEspere: TPanel;
    ProgressBar: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure btnAceptarPeriodoClick(Sender: TObject);
    procedure fpSeleccionarPeriodoBeforeShow(Sender: TObject);
  private
    FSQL: String;
    //function Validar: boolean;
  public
    procedure RefreshData; override;
  end;


var
  frmServiciosAEmpresas: TfrmServiciosAEmpresas;

implementation

uses
  CustomDlgs, VCLExtra, unDmPrincipal, unFiltros, unredpres;

{$R *.dfm}

procedure TfrmServiciosAEmpresas.FormCreate(Sender: TObject);
begin
  inherited;
  ProgressBar.Position := 0;
  pnlEspere.visible    := false;

  FSQL := sdqConsulta.SQL.Text;
  with fraES_IDPRESTADORA do
  begin
    ShowBajas   := False;
    TableName   := 'ART.AEP_EMPRESAPRESTADORA';
    FieldID     := 'EP_ID';
    FieldCodigo := 'EP_ID';
    FieldDesc   := 'EP_DESCRIPCION';
    Sql         := 'SELECT EP_ID as id, EP_CODIGO as codigo, EP_DESCRIPCION as descripcion ' +
                    ' FROM art.aep_empresaprestadora WHERE 1 = 1 ';
  end;
end;
{
function TfrmServiciosAEmpresas.Validar: boolean;
begin
  Result := True;
end;
}
procedure TfrmServiciosAEmpresas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  ClearComponentData(pnlFiltros);
end;

procedure TfrmServiciosAEmpresas.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros);
  inherited;
end;

procedure TfrmServiciosAEmpresas.tbPropiedadesClick(Sender: TObject);  // Generar Reporte
var i, iAnio, iMes, iCantReg: integer;
    sNombrePeriodo, sCuit, sEmpresa, sPrestadora, sPeriodo, sMes, sIniPeriodo, sFinPeriodo, sSql, sMensaje: string;
begin
  if not (sdqConsulta.Eof) and (fpSeleccionarPeriodo.ShowModal = mrOk) then
  begin
    sNombrePeriodo := ppPeriodo.Periodo.GetPeriodoName;
    if (MsgBox ('Se va a generar el período ' + sNombrePeriodo + #13#10 +
                 'Desea continuar?', MB_ICONEXCLAMATION + MB_YESNO) = mrYes) then
    begin
      iAnio          := ppPeriodo.Periodo.Ano;
      iMes           := ppPeriodo.Periodo.Mes;

      if length(IntToStr(iMes)) = 1 then
        sMes := '0' + IntToStr(iMes)
      else
        sMes := IntToStr(iMes);
      sPeriodo := IntToStr(iAnio) + sMes;

      sIniPeriodo := DateToStr(FirstDayOfPeriodo(sPeriodo));
      sFinPeriodo := DateToStr(LastDayOfPeriodo(sPeriodo));

      iCantReg := sdqConsulta.RecordCount;

      ProgressBar.Position := 0;
      ProgressBar.Max      := iCantReg;

      sdqConsulta.First;
      i := 0;

      while not sdqConsulta.Eof do
      begin
        sCuit       := sdqConsultaEM_CUIT.AsString;
        sEmpresa    := sdqConsultaEM_NOMBRE.AsString;
        sPrestadora := sdqConsultaEP_DESCRIPCION.AsString;

        pnlEspere.Caption := ' Procesando ' + intToStr(i) + ' de ' + intToStr(iCantReg) + ' empresas. Espere por favor...';

        //if ValorSqlEx('SELECT ART.AFILIACION.CHECK_COBERTURA(:cuit, last_day(:fecha)) FROM DUAL', [sCuit, '01/' + sMes + '/' + IntToStr(iAnio)]) = 1 then  //empresa activa a fin del mes que se está generando
        //begin
        sSql := ' insert into COMUNES.CSE_SERVICIOEMPRESA ' +
                ' values (:id, :idemp, :idprest, :per, :est, trunc(sysdate), null) ';
        EjecutarSqlEx(sSql, [GetSecNextVal('comunes.SEQ_CSE_PK'), sdqConsultaES_IDEMPRESA.AsInteger, sdqConsultaES_IDPRESTADORA.AsInteger, sPeriodo, 'P']);
        inc(i);
        //end;

        sdqConsulta.Next;
        ProgressBar.Position := i;
      end;

      ProgressBar.Position := 0;
      sMensaje := 'Se han solicitado los reportes de ' + intToStr(i) +
                  ' empresas, correspondientes al periodo ' + IntToStr(iAnio) + '/' + sMes;

      if iCantReg > i then
        sMensaje := sMensaje + #13 + IntToStr(iCantReg - i) + ' empresas no se han solicitado por no estar activas en dicho período';

      MsgBox(sMensaje);
      
    end;
  end;

end;

procedure TfrmServiciosAEmpresas.btnAceptarPeriodoClick(Sender: TObject);
begin
  Verificar(ppPeriodo.Periodo.IsNull, ppPeriodo, 'Debe ingresar un período');
  fpSeleccionarPeriodo.ModalResult := mrOk;
end;


procedure TfrmServiciosAEmpresas.fpSeleccionarPeriodoBeforeShow(Sender: TObject);
begin
  ppPeriodo.Periodo.SetPeriodoActual;  // por default el actual
end;

end.
