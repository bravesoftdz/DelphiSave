unit unFrmDetalleComunicacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ToolWin, ExtCtrls, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, Mask, ToolEdit, DateComboBox, dbcgrids,
  DBCtrls, DB, SDEngine;

type
  TFrmDetalleComunicacion = class(TForm)
    gbDatosGeneralesContrato: TGroupBox;
    pcDetalleDelContrato: TPageControl;
    tsDatosAfiliacion: TTabSheet;
    DatosCobranza: TTabSheet;
    tsDatosEmision: TTabSheet;
    TabSheet1: TTabSheet;
    tsDetalleComunicacion: TTabSheet;
    pgComunicacion: TPageControl;
    TabSheet2: TTabSheet;
    tsComunicacion: TTabSheet;
    mDetalleComunicacion: TMemo;
    dbgObservaciones: TArtDBGrid;
    pnBotones: TPanel;
    btnGestionConcluida: TButton;
    btnPostergarGestion: TButton;
    btnCancelarGestion: TButton;
    dbcgRequirido: TDBCtrlGrid;
    fpDetalleFallida: TFormPanel;
    btnAceptarContactoFallido: TButton;
    btnCancelarContactoFallido: TButton;
    gbDetalleContactoFallido: TGroupBox;
    lblMotivoDetalleContactoFallido: TLabel;
    cmbMotivo: TComboBox;
    mObservacionesFallida: TMemo;
    Solicitar: TLabel;
    dbeSolicitud: TDBEdit;
    dbchkRealizado: TDBCheckBox;
    fpPostergacion: TFormPanel;
    btnAceptarPostergacion: TButton;
    btnCancelarPostergacion: TButton;
    gbDetallePostergacion: TGroupBox;
    lblMotivoDetallePostergacion: TLabel;
    cmbMotivoDetallePostergacion: TComboBox;
    mObservacionesDetallePostergacion: TMemo;
    mcReprogramado: TMonthCalendar;
    lblPeriodoDesde: TLabel;
    dbePeriodoDesde: TDBEdit;
    dbePeriodoHasta: TDBEdit;
    lblPeriodoHasta: TLabel;
    lblObservacionesDetallePostergacion: TLabel;
    lblMotivoBaja: TLabel;
    lblCUIT: TLabel;
    lblDomicilio: TLabel;
    lblEstado: TLabel;
    lblFechaBaja: TLabel;
    edtMotivoBaja: TEdit;
    edtDomicilio: TEdit;
    cmbFechaBaja: TDateComboBox;
    fraContrato: TfraEmpresa;
    edtEstado: TEdit;
    sdqAcciones: TSDQuery;
    lblVigenciaDesde: TLabel;
    cmbFechaVigenciaDesde: TDateComboBox;
    lblVigenciaHasta: TLabel;
    cmbFechaVigenciaHasta: TDateComboBox;
    procedure btnAceptarContactoFallidoClick(Sender: TObject);
    procedure btnCancelarContactoFallidoClick(Sender: TObject);
    procedure btnGestionConcluidaClick(Sender: TObject);
    procedure btnPostergarGestionClick(Sender: TObject);
    procedure btnCancelarGestionClick(Sender: TObject);
  private
    procedure CargarCabecera(AContrato: Integer);
    { Private declarations }
  public
    { Public declarations }
    procedure Cargar(AIdDDJJAccion : Integer);
  end;

var
  FrmDetalleComunicacion: TFrmDetalleComunicacion;

implementation

uses AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, General, StrFuncs, unDmPrincipal;

{$R *.dfm}
{--------------------------------------------------------------------------------}
procedure TFrmDetalleComunicacion.btnAceptarContactoFallidoClick(Sender: TObject);
begin
  close;
end;
{--------------------------------------------------------------------------------}
procedure TFrmDetalleComunicacion.btnCancelarContactoFallidoClick(Sender: TObject);
begin
  fpDetalleFallida.close;
end;
{--------------------------------------------------------------------------------}
procedure TFrmDetalleComunicacion.btnGestionConcluidaClick(Sender: TObject);
begin
  if (MessageDlg('¿Es una Gestión Exitosa?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
  begin
    fpDetalleFallida.ShowModal;
  end
  else close;
end;
{--------------------------------------------------------------------------------}
procedure TFrmDetalleComunicacion.btnPostergarGestionClick(Sender: TObject);
begin
  fpPostergacion.ShowModal;
end;
{--------------------------------------------------------------------------------}
procedure TFrmDetalleComunicacion.btnCancelarGestionClick(Sender: TObject);
begin
  close;
end;
{--------------------------------------------------------------------------------}
procedure TFrmDetalleComunicacion.Cargar(AIdDDJJAccion: Integer);
begin
  sdqAcciones.ParamByName('Id').AsInteger := AIdDDJJAccion;
  sdqAcciones.Open;

  if sdqAcciones.RecordCount > 0 then
    CargarCabecera(sdqAcciones.FieldByName('dj_contrato').AsInteger);

end;
{--------------------------------------------------------------------------------}
procedure TFrmDetalleComunicacion.CargarCabecera( AContrato: Integer );
var
  sSql: string;
  Query: TSDquery;
begin
  sSql := 'SELECT CO_CONTRATO, DC_TELEFONOS || DC_FAX DC_TELEFONOS, AC_CODIGO, ' +
          '       AFEST.TB_DESCRIPCION AS ESTADO, CO_IDACTIVIDAD, CO_VIGENCIADESDE, CO_VIGENCIAHASTA, ' +
          '       CO_FECHABAJA, '' ('' || BAJ.TB_CODIGO || '')  '' || BAJ.TB_DESCRIPCION AS MOTIVO_BAJA, ' +
          '       NVL(DC_DOMICILIO, ART.UTILES.ARMAR_DOMICILIO(DC_CALLE,DC_NUMERO,DC_PISO,DC_DEPARTAMENTO,NULL) ' +
          '       ||ART.UTILES.ARMAR_LOCALIDAD (DC_CPOSTAL, NULL, DC_LOCALIDAD, DC_PROVINCIA)) AS DOM_POSTAL' +
          '  FROM ACO_CONTRATO, ADC_DOMICILIOCONTRATO, CAC_ACTIVIDAD, CTB_TABLAS BAJ, CTB_TABLAS AFEST ' +
          ' WHERE CO_CONTRATO     = DC_CONTRATO' +
          '   AND CO_IDACTIVIDAD  = AC_ID' +
          '   AND BAJ.TB_CLAVE(+) = ''MOTIB''' +
          '   AND CO_MOTIVOBAJA   = BAJ.TB_CODIGO(+)' +
          '   AND AFEST.TB_CLAVE  = ''AFEST''' +
          '   AND AFEST.TB_CODIGO = CO_ESTADO' +
          '   AND CO_CONTRATO     = ' + SqlValue(AContrato);
          
  Query := GetQuery( sSql );
  try
    if not Query.Eof then
    begin
      With Query do
      begin
        if fraContrato.Contrato <> FieldByName('CO_CONTRATO').AsInteger then
          fraContrato.Contrato := FieldByName('CO_CONTRATO').AsInteger;

        edtDomicilio.Text          := FieldByName('DOM_POSTAL').AsString;
        cmbFechaVigenciaDesde.Date := FieldByName('CO_VIGENCIADESDE').AsDateTime;
        cmbFechaVigenciaHasta.Date := FieldByName('CO_VIGENCIAHASTA').AsDateTime;
        cmbFechaBaja.Date          := FieldByName('CO_FECHABAJA').AsDateTime;
        edtMotivoBaja.Text         := FieldByName('MOTIVO_BAJA').AsString;
//        fraActividad.Value         := FieldByName('CO_IDACTIVIDAD').AsInteger;
        edtESTADO.Text             := FieldByName('ESTADO').AsString;
      end;
    end
    else
    MessageDlg('Los datos son incorrectos', mtWarning, [mbOK], 0);
  finally
    Query.Free;
  end;
end;
{--------------------------------------------------------------------------------}

end.
