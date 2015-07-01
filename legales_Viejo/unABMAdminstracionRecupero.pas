{----------------------------------------------------------------------------------------------------------------------
   Modulo de ABML de Recuperos.
   Desde este modulo se administra: Eventos y Gastos
   Autor: EVila.
}
unit unABMAdminstracionRecupero;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Placemnt, artSeguridad, ComCtrls, ToolWin, Db, SDEngine, unFraCtbTablas,
  StdCtrls, IntEdit, CurrEdit, Mask, ToolEdit, DateComboBox, unFraEmpresa,
  unArtFrame, unFraCodigoDescripcion, unfraAbogadosLegales, ShortCutControl,
  SinEdit, unFraTrabajador, unArtDbFrame, unArtDBAwareFrame, vclextra,
  RxPlacemnt, RxCurrEdit, RxToolEdit;

type
  TfrmABMAdminstracionRecupero = class(TForm)
    FormStorage1: TFormStorage;
    tbGestionDeuda: TToolBar;
    tbGuardar: TToolButton;
    rbNuevo: TToolButton;
    ToolButton1: TToolButton;
    tbLimpiar: TToolButton;
    tbBuscar: TToolButton;
    ToolButton2: TToolButton;
    tbEventos: TToolButton;
    tbSiniestros: TToolButton;
    ToolButton3: TToolButton;
    tbImprimir: TToolButton;
    tbSalir: TToolButton;
    sdqAuxiliar: TSDQuery;
    fraAbogados: TfraAbogadosLegales;
    lbAbogado: TLabel;
    fraMotivo: TfraCtbTablas;
    lbMotivo: TLabel;
    fraEstado: TfraCtbTablas;
    lbEstado: TLabel;
    ShortCutControl: TShortCutControl;
    edRS_SINIESTRO: TSinEdit;
    lbRS_SINIESTRO: TLabel;
    edRS_FECHA: TDateComboBox;
    lbMontoaRecuperar: TLabel;
    edRS_MONTOARECUPERAR: TCurrencyEdit;
    lbMontoRecuperado: TLabel;
    edRS_MONTORECUPERADO: TCurrencyEdit;
    edRS_FTERMINADO: TDateComboBox;
    lbDestinatario: TLabel;
    lbFecha: TLabel;
    lbFechaTerminado: TLabel;
    fraTipoDestinatario: TfraCtbTablas;
    lbTipoDestinatario: TLabel;
    edRS_DESTINATARIO: TEdit;
    fraEmpresa: TfraEmpresa;
    fraTrabajador: TfraTrabajador;
    Label1: TLabel;
    tbCobros: TToolButton;
    lbObservaciones: TLabel;
    edRS_OBSERVACIONES: TEdit;
    Label2: TLabel;
    fraDestinatario: TfraCodigoDescripcion;
    edMEDIACIONES: TEdit;
    Label3: TLabel;
    edJUICIO: TEdit;
    Label4: TLabel;
    chkARecuperar: TCheckBox;
    tbVerImagenes: TToolButton;
    procedure tbSalirClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSiniestrosClick(Sender: TObject);
    procedure tbEventosClick(Sender: TObject);
    procedure fraEstadoChange(Sender: TObject);
    procedure edRS_SINIESTROExit(Sender: TObject);
    procedure tbCobrosClick(Sender: TObject);
    procedure fraDestinatarioExit(Sender: TObject);
    procedure fraTipoDestinatarioOnChange(Sender: TObject);
    procedure tbVerImagenesClick(Sender: TObject);
  private
  public
  end;

var
  frmABMAdminstracionRecupero: TfrmABMAdminstracionRecupero;

Const LGD_GESTION_ALTA  = 'Alta... (Administración de Recuperos)';
      LGD_GESTION_MODIF = 'Modificación... (Administración de Recuperos)';

implementation

uses unPrincipal, AnsiSql, General, unDmPrincipal,
     CustomDlgs, SqlFuncs, UnConsultaEmpresa, unABMGastos, unABMEventos,
     unRPTJudicial, ArtFuncs, UnConsultaSiniestro, unABMEventosRecupero,
     unABMAdministracionCobro, unFrmDetalleArchivo, unArt, unComunesArchivo,
     unConstantArchivo, unArchivo;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMAdminstracionRecupero.FormCreate(Sender: TObject);
begin
  fraEstado.OnChange := FraEstadoChange;
  fraMotivo.Clave    := 'MORES';
  fraEstado.Clave    := 'ESRES';

  with fraTipoDestinatario do
    begin
      Clave    := 'TDEST';
      OnChange := fraTipoDestinatarioOnChange;
    end;

  fraDestinatario.Visible := False;
  fraEmpresa.ShowBajas    := True;
  fraEmpresa.UltContrato  := True;
  fraAbogados.Parte       := paPropia;
  vclextra.LockControls([fraEmpresa, fraTrabajador, edRS_MONTORECUPERADO], true);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMAdminstracionRecupero.tbLimpiarClick(Sender: TObject);
begin
  Caption                 := LGD_GESTION_ALTA;
  edRS_SINIESTRO.Enabled  := True;
  //edRS_SINIESTRO.Color    := clWindow;
  edRS_SINIESTRO.Clear;
  edRS_FECHA.Clear;
  edRS_FTERMINADO.Clear;
  fraEmpresa.CUIT := '';
  fraTrabajador.Clear;
  fraAbogados.Clear;
  fraEstado.Limpiar;
  fraMotivo.Limpiar;
  edRS_MONTOARECUPERAR.Clear;
  edRS_MONTORECUPERADO.Clear;
  fraTipoDestinatario.Limpiar;
  fraTipoDestinatarioOnChange(nil);
  edRS_DESTINATARIO.Clear;
  edRS_OBSERVACIONES.Clear;
  fraDestinatario.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMAdminstracionRecupero.tbSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMAdminstracionRecupero.tbGuardarClick(Sender: TObject);
Var
  sSqlTrans : TSql;
  IDRef: Integer;
begin
//Controles...
  if Caption = LGD_GESTION_MODIF then begin
  end;
  // FECHA
  IF edRS_FECHA.IsEmpty then begin
    InvalidMsg( edRS_FECHA, 'La fecha no puede quedar en blanco' );
    Abort;
  end;
  // Siniestro.
  if edRS_SINIESTRO.Siniestro = 0 then begin
    InvalidMsg( edRS_SINIESTRO, 'El siniestro no puede quedar en blanco' );
    Abort;
  end;
  // Orden Siniestro.
  if edRS_SINIESTRO.Orden = 0 then begin
    InvalidMsg( edRS_SINIESTRO, 'El orden del siniestro no puede quedar en blanco' );
    Abort;
  end;
  if NOT IsDbSiniestro( edRS_SINIESTRO.Siniestro, edRS_SINIESTRO.Orden, 0 ) then
  begin
    InvalidMsg( edRS_SINIESTRO, 'El siniestro no existe en nuestros archivos' );
    Abort;
  end;
  // Estado.
  if fraEstado.Value = '' then
  begin
    InvalidMsg( fraEstado.edCodigo, 'El estado no puede quedar en blanco' );
    Abort;
  end;
  // Motivo.
  if fraMotivo.Value = '' then
  begin
    InvalidMsg( fraMotivo.edCodigo, 'El Motivo no puede quedar en blanco' );
    Abort;
  end;

  if AreIn(fraEstado.Value, ['02', '03', '07']) and edRS_FTERMINADO.IsEmpty then
  begin
    InvalidMsg( edRS_FTERMINADO, 'Si el estado es Terminado, Terminado s/ recuperar o No Recuperar, la fecha de terminación es obligatoria' );

    Abort;
  end;

  if not AreIn(fraEstado.Value,  ['02', '03', '07']) and not edRS_FTERMINADO.IsEmpty then
  begin
    InvalidMsg( edRS_FTERMINADO, 'Si el estado no es Terminado, Terminado s/ recuperar o No Recuperar, entonces no puede ingresar la fecha de terminación' );
    Abort;
  end;

  if AreIn(fraEstado.Value, ['01', '04']) and not edRS_FTERMINADO.IsEmpty then
  begin
    InvalidMsg( edRS_FTERMINADO, 'Si ingresó la fecha de terminación, el estado no puede ser A Recuperar ni En Trámite Judicial' );
    Abort;
  end;

  if fraTipoDestinatario.IsSelected and (Trim(edRS_DESTINATARIO.Text) = '') then
  begin
    InvalidMsg( edRS_DESTINATARIO, 'Debe indicarse el destinatario' );
    Abort;
  end;
//Fin...

  sSqlTrans := TSql.Create('LRS_RECUPEROSINIESTROS' );
  sSqlTrans.PrimaryKey.Add( 'RS_SINIESTRO', edRS_SINIESTRO.Siniestro );
  sSqlTrans.PrimaryKey.Add( 'RS_ORDEN', edRS_SINIESTRO.Orden );
  sSqlTrans.Fields.Add( 'RS_ESTADO', fraEstado.edCodigo.Text );
  sSqlTrans.Fields.Add( 'RS_MOTIVO', fraMotivo.edCodigo.Text );
  sSqlTrans.Fields.Add( 'RS_FECHA', edRS_FECHA.Date );
  sSqlTrans.Fields.Add( 'RS_ABOGADO', fraAbogados.edCodigo.Text);
  sSqlTrans.Fields.AddExtended( 'RS_MONTOARECUPERAR', edRS_MONTOARECUPERAR.Value, ALL_DECIMALS, False );
//  sSqlTrans.Fields.AddExtended( 'RS_MONTORECUPERADO', edRS_MONTORECUPERADO.Value, ALL_DECIMALS, False );
  sSqlTrans.Fields.Add( 'RS_FTERMINADO', edRS_FTERMINADO.Date );
  sSqlTrans.Fields.Add( 'RS_TDESTINATARIO', fraTipoDestinatario.edCodigo.Text );
  sSqlTrans.Fields.Add( 'RS_DESTINATARIO', edRS_DESTINATARIO.Text );
  sSqlTrans.Fields.Add( 'RS_OBSERVACIONES', edRS_OBSERVACIONES.Text );
  IDRef := iif (fraTipoDestinatario.edCodigo.Text = 'E',
                fraEmpresa.Value,
                iif (fraTipoDestinatario.edCodigo.Text = 'T',
                     fraTrabajador.Value,
                     iif(fraDestinatario.IsSelected,
                         fraDestinatario.Value,
                         exNull)));
  sSqlTrans.Fields.Add( 'RS_IDREFTIPO', IDRef);

  Try
    Try
      if Caption = LGD_GESTION_ALTA then begin
         sSqlTrans.SqlType := stInsert;
         sSqlTrans.Fields.Add( 'RS_USUALTA', frmPrincipal.DBLogin.UserId );
         sSqlTrans.Fields.Add( 'RS_FECHAALTA', 'Actualdate', False);
      end else if Caption = LGD_GESTION_MODIF then begin
         sSqlTrans.SqlType := stUpdate;
         sSqlTrans.Fields.Add( 'RS_USUMODIF', frmPrincipal.DBLogin.UserId );
         sSqlTrans.Fields.Add( 'RS_FECHAMODID', 'Actualdate', False );
      end;

      EjecutarSQL(sSqlTrans.Sql);

      ModalResult := mrOk;

      //.Si es un alta cambia a modificación.
      if Caption = LGD_GESTION_ALTA then begin
         msgBox('El alta se realizó con éxito', MB_ICONEXCLAMATION, 'Atención');
      end else
         msgBox('La modificación se realizó con éxito', MB_ICONEXCLAMATION, 'Atención');
    Except
       on Error:exception do ErrorMsg(Error);
    End;
  Finally
    sSqlTrans.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Administracion de Gastos
procedure TfrmABMAdminstracionRecupero.tbSiniestrosClick(Sender: TObject);
begin
  if edRS_SINIESTRO.SiniestroS <> '' then begin
     frmConsultaSiniestro  := TfrmConsultaSiniestro.Create( Self );
     vclextra.LockControl(frmConsultaSiniestro.edTOTAL, true);
     Try
        frmConsultaSiniestro.GetExecute( edRS_SINIESTRO.SiniestroS, edRS_SINIESTRO.OrdenS );
     Finally
        frmConsultaSiniestro.Free;
     end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Administracion de Eventos
procedure TfrmABMAdminstracionRecupero.tbEventosClick(Sender: TObject);
begin
  if Caption = LGD_GESTION_MODIF Then begin
    frmABMEventosRecupero  := TfrmABMEventosRecupero.Create( Self );
    with frmABMEventosRecupero do
      vclextra.LockControls([edRS_SINIESTRO, fraAbogados, fraEmpresa, fraTrabajador], true);

    Try
      frmABMEventosRecupero.GetExecuteRecupero( edRS_SINIESTRO.Siniestro, edRS_SINIESTRO.Orden );
      frmABMEventosRecupero.ShowModal;
    Finally
      frmABMEventosRecupero.Free;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMAdminstracionRecupero.fraEstadoChange(Sender: TObject);
begin
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMAdminstracionRecupero.edRS_SINIESTROExit(Sender: TObject);
begin
  if (edRS_SINIESTRO.SiniestroS <> '') and (self.caption = LGD_GESTION_ALTA) then begin
     if ExisteSql( 'Select 1 '+
                  '  From LRS_RECUPEROSINIESTROS '+
                  ' Where RS_Siniestro = ' + edRS_SINIESTRO.SiniestroS +
                  '   and RS_Orden = ' + edRS_SINIESTRO.OrdenS ) then
     begin
        InvalidMsg( lbRS_SINIESTRO, 'El siniestro ya existe en nuestros archivos de recupero' );
        tbGuardar.Enabled:=false;
     end
     else
        tbGuardar.enabled:=true;
     sdqAuxiliar.ParamByName('NroSiniestro').asInteger := edRS_SINIESTRO.Siniestro;
     sdqAuxiliar.ParamByName('NroOrden').asInteger := edRS_SINIESTRO.Orden;
     sdqAuxiliar.Open;
     fraEmpresa.CUIT := sdqAuxiliar.FieldByName( 'EX_CUIT' ).AsString;
     fraTrabajador.CUIL := sdqAuxiliar.FieldByName( 'EX_CUIL' ).AsString;
     sdqAuxiliar.Close;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMAdminstracionRecupero.tbCobrosClick(Sender: TObject);
begin
  if edRS_SINIESTRO.SiniestroS <> '' Then begin
    frmABMAdministracionCobro := TfrmABMAdministracionCobro.Create( Self );
    Try
       frmABMAdministracionCobro.GetCargaDatos( edRS_SINIESTRO.Siniestro, edRS_SINIESTRO.Orden );
    Finally
       frmABMAdministracionCobro.Free;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMAdminstracionRecupero.fraDestinatarioExit(Sender: TObject);
begin
  if fraDestinatario.IsSelected and
     (edRS_DESTINATARIO.Text <> fraDestinatario.Descripcion) then
    edRS_DESTINATARIO.Text := fraDestinatario.Descripcion;

  edRS_DESTINATARIO.ReadOnly := fraDestinatario.IsSelected;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMAdminstracionRecupero.fraTipoDestinatarioOnChange(Sender: TObject);
begin
  fraDestinatario.Clear;

  if fraTipoDestinatario.edCodigo.Text = 'E' then
    edRS_DESTINATARIO.Text := fraEmpresa.cmbRSocial.Text
  else if fraTipoDestinatario.edCodigo.Text = 'T' then
    edRS_DESTINATARIO.Text := fraTrabajador.cmbNombre.Text
  else if fraTipoDestinatario.edCodigo.Text = 'S' then
    begin
      with fraDestinatario do
      begin
        TableName      := 'legales.lcs_ciaseguro';
        FieldID        := 'cs_id';
        FieldCodigo    := 'cs_id';
        FieldDesc      := 'cs_descripcion';
        ShowBajas      := True;
        ExtraCondition := ' AND cs_tipo LIKE ' + SqlValue ('%' + fraTipoDestinatario.edCodigo.Text + '%');
      end;
    end
  else if fraTipoDestinatario.edCodigo.Text = 'O' then
    begin
      with fraDestinatario do
      begin
        TableName      := 'cos_osocial';
        FieldID        := 'os_codigo';
        FieldCodigo    := 'os_codigo';
        FieldDesc      := 'os_descripcion';
        ShowBajas      := True;
        ExtraCondition := '';
      end;
    end
  else if fraTipoDestinatario.edCodigo.Text = 'A' then
    begin
      with fraDestinatario do
      begin
        TableName      := 'aar_art';
        FieldID        := 'ar_id';
        FieldCodigo    := 'ar_id';
        FieldDesc      := 'ar_nombre';
        ShowBajas      := True;
        ExtraCondition := '';
      end;
    end;

  fraDestinatario.Visible    := AreIn(fraTipoDestinatario.edCodigo.Text, ['S', 'O', 'A']);
  edRS_DESTINATARIO.ReadOnly := AreIn(fraTipoDestinatario.edCodigo.Text, ['E', 'T']) or fraDestinatario.IsSelected;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMAdminstracionRecupero.tbVerImagenesClick(Sender: TObject);
var
  RARId: TTableId;
  sClave: String;
begin
  Verificar(edrs_siniestro.IsEmpty, edrs_siniestro, 'Debe haber un siniestro seleccionado.');

  sClave := GetClaveArmada(2, edrs_siniestro.SiniestroS, edrs_siniestro.OrdenS, '', '');
  Verificar(not VerificarClaveExiste(ID_CARPETA_SINIESTRO, sClave, RARId), edrs_siniestro, 'La carpeta no existe.');

  TFrmDetalleArchivo.MostrarDetalleArchivo(Self, RARId, True);
end;
{----------------------------------------------------------------------------------------------------------------------}

end.

