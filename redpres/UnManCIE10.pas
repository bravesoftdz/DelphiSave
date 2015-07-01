unit UnManCIE10;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, Mask, ToolEdit, StdCtrls, FormPanel, ExtCtrls, Buttons, IntEdit,
  unFraCtbTablas, QueryPrint, QueryToFile, ExportDialog, SortDlg, CustomDlgs,
  ShortCutControl, Placemnt, CurrEdit, unArtFrame, unFraCodigoDescripcion,
  artSeguridad, PatternEdit, unArtDBAwareFrame;

type
  TfrmManCIE10 = class(TForm)
    ToolBar1: TToolBar;
    tbNuevo: TToolButton;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    ToolButton11: TToolButton;
    tbRefrescar: TToolButton;
    ToolButton12: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton10: TToolButton;
    tbExportar: TToolButton;
    tbImprimir: TToolButton;
    ToolButton9: TToolButton;
    tbSalir: TToolButton;
    dbgDatos: TArtDBGrid;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    fpABM: TFormPanel;
    edCodigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edGTrabajo: TEdit;
    cmbGTrabajo: TArtComboBox;
    edDiagnostico: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    rgTipoDiagnostico: TRadioGroup;
    Label10: TLabel;
    Label11: TLabel;
    chkListCIE10: TCheckBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Bevel1: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    btnLimpiar: TSpeedButton;
    sdqGTrabajo: TSDQuery;
    dsGTrabajo: TDataSource;
    chkIncapSegura: TCheckBox;
    edDiasEvo: TIntEdit;
    Label15: TLabel;
    fraNaturalezaFila: TfraCtbTablas;
    fraZonaColumna: TfraCtbTablas;
    fraNaturalezaSRT: TfraCtbTablas;
    fraZonaSRT: TfraCtbTablas;
    fraFormaSRT: TfraCtbTablas;
    sdqDatosDG_CODIGO: TStringField;
    sdqDatosDG_FILA: TFloatField;
    sdqDatosDG_COLUMNA: TFloatField;
    sdqDatosDG_LISTADOCIE10: TStringField;
    sdqDatosDG_TIPO: TStringField;
    sdqDatosDG_DESCRIPCION: TStringField;
    sdqDatosDG_DIASLEVE: TFloatField;
    sdqDatosDG_DIASMODERADO: TFloatField;
    sdqDatosDG_DIASGRAVE: TFloatField;
    sdqDatosDG_COSTOLEVE: TFloatField;
    sdqDatosDG_COSTOMODERADO: TFloatField;
    sdqDatosDG_COSTOGRAVE: TFloatField;
    sdqDatosDG_INCAPACIDADLEVE: TFloatField;
    sdqDatosDG_INCAPACIDADMODERADO: TFloatField;
    sdqDatosDG_INCAPACIDADGRAVE: TFloatField;
    sdqDatosDG_NATUSRT: TStringField;
    sdqDatosDG_ZONASRT: TStringField;
    sdqDatosDG_FORMASRT: TStringField;
    sdqDatosDG_INCAPSEGURA: TStringField;
    sdqDatosGP_NOMBRE: TStringField;
    sdqDatosGP_CODIGO: TStringField;
    edDiasLeve: TIntEdit;
    edDiasModerado: TIntEdit;
    edDiasGrave: TIntEdit;
    sdqDatosDG_DIAS_EVOL: TFloatField;
    SortDialog: TSortDialog;
    ExportDialog: TExportDialog;
    QueryPrint: TQueryPrint;
    sdqDatosTIPO: TStringField;
    ShortCutControl: TShortCutControl;
    FormPlacement: TFormPlacement;
    edCostoLeve: TCurrencyEdit;
    edCostoModerado: TCurrencyEdit;
    edCostoGrave: TCurrencyEdit;
    edIncapacLeve: TCurrencyEdit;
    edIncapacModerado: TCurrencyEdit;
    edIncapacGrave: TCurrencyEdit;
    sdqDatosDG_FECHABAJA: TDateTimeField;
    Seguridad: TSeguridad;
    PrintDialog: TPrintDialog;
    chkTraslado: TCheckBox;
    sdqDatosDG_AMERITATRASLADO: TStringField;
    Label16: TLabel;
    fraCatCIE10: TfraCodigoDescripcion;
    sdqDatosDG_IDCATEGORIA: TFloatField;
    sdqDatoscc_descripcion: TStringField;
    sdqDatosdg_fechaalta: TDateTimeField;
    sdqDatosDG_CANTMAXIMATRASLADOS: TFloatField;
    Label17: TLabel;
    edCantMaxTraslados: TIntEdit;
    edCantMaxFKT: TIntEdit;
    Label18: TLabel;
    sdqDatosDG_CANTMAXIMAFKT: TFloatField;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edGTrabajoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbGTrabajoChange(Sender: TObject);
    procedure cmbGTrabajoCloseUp(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSalirClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure dbgDatosDblClick(Sender: TObject);
    procedure dbgDatosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    Function Validar:boolean;
    Procedure Refrescar;
  public
  end;

Const
  ABM_MODIFICACION = 'Modificación';
  ABM_ALTA         = 'Alta';

implementation

uses undmPrincipal, General, unPrincipal, AnsiSql, StrFuncs, unSesion;

{$R *.DFM}
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.tbRefrescarClick(Sender: TObject);
begin
  Refrescar;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.Refrescar;
begin
  RefreshAndLocate( sdqDatos, ['DG_CODIGO'], [sdqDatosDG_CODIGO.AsString]);
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.FormCreate(Sender: TObject);
begin
   fraNaturalezaFila.Clave := 'NACIE';
   fraZonaColumna.Clave    := 'ZOCIE';
   fraNaturalezaSRT.Clave  := 'NATUR';
   fraZonaSRT.Clave        := 'ZONA';
   fraFormaSRT.Clave       := 'FORMA';
   with fraCatCIE10 do
   begin
     TableName   := 'SIN.scc_categoriacie10';
     FieldID         := 'CC_ID';
     FieldCodigo     := 'CC_CODIGO';
     FieldDesc       := 'CC_DESCRIPCION';
   end;
   sdqGTrabajo.Open;
   sdqDatos.Open;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.tbNuevoClick(Sender: TObject);
begin
   fpABM.Caption    := ABM_ALTA;
   edCodigo.Enabled := True;
   edCodigo.Color   := clWindow;
   btnLimpiarClick(Nil);
   fpABM.ActiveControl := edCodigo;
   fpABM.ShowModal ;
   RefreshAndReLocate(sdqDatos,['DG_CODIGO']);
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.tbModificarClick(Sender: TObject);
begin
   if sdqDatosDG_FECHABAJA.IsNull or
     MsgAsk('Se dispone a modificar un registro dado de baja, al modificarlo se reactivara.' + #13 +
            '¿Desea reactivar el registro?') then
   begin
      fpABM.Caption    := ABM_MODIFICACION;
      edCodigo.Enabled := False;
      edCodigo.Color   := clMenu;
      edCodigo.Text    := sdqDatosDG_CODIGO.Text;
      fraCatCIE10.Codigo := sdqDatosDG_IDCATEGORIA.AsString;
      cmbGTrabajo.FieldValue := sdqDatosGP_CODIGO.Text;
      edGTrabajo.Text        := sdqDatosGP_CODIGO.Text;
      edDiagnostico.Text     := sdqDatosDG_DESCRIPCION.Text;

      edDiasLeve.Text        := sdqDatosDG_DIASLEVE.Text;
      edDiasModerado.Text    := sdqDatosDG_DIASMODERADO.Text;
      edDiasGrave.Text       := sdqDatosDG_DIASGRAVE.Text;
      edCostoLeve.Text       := sdqDatosDG_COSTOLEVE.Text;
      edCostoModerado.Text   := sdqDatosDG_COSTOMODERADO.Text;
      edCostoGrave.Text      := sdqDatosDG_COSTOGRAVE.Text;
      edIncapacLeve.Text     := sdqDatosDG_INCAPACIDADLEVE.Text;
      edIncapacModerado.Text := sdqDatosDG_INCAPACIDADMODERADO.Text;
      edIncapacGrave.Text    := sdqDatosDG_INCAPACIDADGRAVE.Text;

      rgTipoDiagnostico.ItemIndex := IIF(sdqDatosDG_TIPO.Text = 'C', 0, 1);

      fraNaturalezaFila.Cargar( IIF( (length(sdqDatosDG_FILA.AsString)=1), '0' + sdqDatosDG_FILA.AsString, sdqDatosDG_FILA.AsString ));
      fraZonaColumna.Cargar   ( IIF( (length(sdqDatosDG_COLUMNA.AsString)=1), '0' + sdqDatosDG_COLUMNA.AsString, sdqDatosDG_COLUMNA.AsString ));
      // puse un iif con length porque estos dos campos son integer, y si se graba '07', cuando lo carga, carga: '7', sin el cero, y por consiguiente no me trae nada en el combo. by Lu.
      fraNaturalezaSRT.Cargar ( sdqDatosDG_NATUSRT.AsString  );
      fraZonaSRT.Cargar       ( sdqDatosDG_ZONASRT.AsString  );
      fraFormaSRT.Cargar      ( sdqDatosDG_FORMASRT.AsString );

      chkListCIE10.Checked    := (sdqDatosDG_LISTADOCIE10.Text = 'S');
      chkIncapSegura.Checked  := (sdqDatosDG_INCAPSEGURA.Text = 'S');
      chkTraslado.Checked     := (sdqDatosDG_AMERITATRASLADO.Text = 'S');
      edDiasEvo.Text          := sdqDatosDG_DIAS_EVOL.Text;
      edCantMaxTraslados.Text := sdqDatosDG_CANTMAXIMATRASLADOS.Text;  // por Plan Topeos de siniestros por traslados
      edCantMaxFKT.Text       := sdqDatosDG_CANTMAXIMAFKT.Text;        // por Plan Topeos de siniestros por FKT

      fpABM.ActiveControl := edGTrabajo;
      fpABM.ShowModal ;
      RefreshAndReLocate(sdqDatos,['DG_CODIGO']);
   end;
end;
{-----[Grupo de Trabajo]---------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.edGTrabajoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then cmbGTrabajo.FieldValue := edGTrabajo.Text
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.cmbGTrabajoChange(Sender: TObject);
begin
  if Trim(cmbGTrabajo.Text) = '' then edGTrabajo.Text := '';
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.cmbGTrabajoCloseUp(Sender: TObject);
begin
  if (Trim(cmbGTrabajo.Text) <> '') then edGTrabajo.Text := cmbGTrabajo.FieldValue;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuMantCie10.Enabled := True;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.btnLimpiarClick(Sender: TObject);
begin
  if fpABM.Caption = ABM_ALTA then edCodigo.Text := '';
  edGTrabajo.Text        := '';
  cmbGTrabajo.FieldValue := '';
  edDiagnostico.Text     := '';
  fraCatCIE10.Clear;
  edDiasLeve.Text        := '0';
  edDiasModerado.Text    := '0';
  edDiasGrave.Text       := '0';
  edCostoLeve.Text       := '0';
  edCostoModerado.Text   := '0';
  edCostoGrave.Text      := '0';
  edIncapacLeve.Text     := '0';
  edIncapacModerado.Text := '0';
  edIncapacGrave.Text    := '0';
  rgTipoDiagnostico.ItemIndex := 0;
  fraNaturalezaFila.Limpiar;
  fraZonaColumna.Limpiar;
  fraNaturalezaSRT.Limpiar;
  fraZonaSRT.Limpiar;
  fraFormaSRT.Limpiar;
  chkListCIE10.Checked   := False;
  chkIncapSegura.Checked := False;
  chkTraslado.Checked    := False;
  edDiasEvo.Text          := '5';
  edCantMaxTraslados.Text := '0';    // por Plan de Siniestros topeados por traslados
  edCantMaxFKT.Text       := '0';    // por Plan de Siniestros topeados por FKT
end;
{-------[INSERT y UPDATE de la Cdg_diagnostico]----------------------------------------------------------------------------------}
procedure TfrmManCIE10.btnAceptarClick(Sender: TObject);
var
  Sql : TSql;
begin
  Sql := TSql.Create;
  if Validar then
  try
     Sql.TableName := 'CDG_DIAGNOSTICO';

     Sql.Fields.Add('DG_CODIGO', edCodigo.Text );
     Sql.Fields.Add('DG_GTRABAJO', edGTrabajo.Text );
     Sql.Fields.Add('DG_DESCRIPCION', edDiagnostico.Text );
     Sql.Fields.Add('DG_TIPO', SqlSwitch( rgTipoDiagnostico.ItemIndex, ['C', 'L'], True), False );
     Sql.Fields.Add('DG_IDCATEGORIA', fraCatCIE10.Codigo);

     Sql.Fields.Add('DG_DIASLEVE', edDiasLeve.Value );
     Sql.Fields.Add('DG_DIASMODERADO', edDiasModerado.Value );
     Sql.Fields.Add('DG_DIASGRAVE', edDiasGrave.Value );
     Sql.Fields.Add('DG_COSTOLEVE', edCostoLeve.Value );
     Sql.Fields.Add('DG_COSTOMODERADO', edCostoModerado.Value );
     Sql.Fields.Add('DG_COSTOGRAVE', edCostoGrave.Value );
     Sql.Fields.Add('DG_INCAPACIDADLEVE', edIncapacLeve.Value );
     Sql.Fields.Add('DG_INCAPACIDADMODERADO', edIncapacModerado.Value );
     Sql.Fields.Add('DG_INCAPACIDADGRAVE', edIncapacGrave.Value );

     if ( fraNaturalezaFila.edCodigo.Text <> '' ) then
       Sql.Fields.Add('DG_FILA', StrToInt(fraNaturalezaFila.edCodigo.Text) );
     if ( fraZonaColumna.edCodigo.Text <> '' ) then
       Sql.Fields.Add('DG_COLUMNA', StrToInt(fraZonaColumna.edCodigo.Text) );

     Sql.Fields.Add('DG_NATUSRT', fraNaturalezaSRT.edCodigo.Text );
     Sql.Fields.Add('DG_ZONASRT', fraZonaSRT.edCodigo.Text );
     Sql.Fields.Add('DG_FORMASRT', fraFormaSRT.edCodigo.Text );

     Sql.Fields.Add('DG_LISTADOCIE10', chkListCIE10.Checked );
     Sql.Fields.Add('DG_INCAPSEGURA', chkIncapSegura.Checked );
     Sql.Fields.Add('DG_AMERITATRASLADO', chkTraslado.Checked );     
     Sql.Fields.Add('DG_DIAS_EVOL', edDiasEvo.Text );
     Sql.Fields.Add('DG_CANTMAXIMATRASLADOS', edCantMaxTraslados.Text);   // por plan de topeos de siniestros por traslados
     Sql.Fields.Add('DG_CANTMAXIMAFKT', edCantMaxFKT.Text);               // por plan de topeos de siniestros por FKT

     Sql.Fields.Add('DG_FECHABAJA', 'NULL', False );
     Sql.Fields.Add('DG_USUBAJA', 'NULL', False );

     if fpABM.Caption = ABM_MODIFICACION then
     begin
        Sql.Fields.Add('DG_USUMODIF', Sesion.UserId );
        Sql.Fields.Add('DG_FECHAMODIF', 'SYSDATE', False );
        EjecutarSql( Sql.UpdateSql + ' Where dg_codigo = ''' + edCodigo.Text + '''' );
     end else
     begin
        Sql.Fields.Add('DG_USUALTA', Sesion.UserId );
        Sql.Fields.Add('DG_FECHAALTA', 'SYSDATE', False );
        EjecutarSql( Sql.InsertSql )  ;
     end;
  finally
    fpABM.ModalResult := mrOk;
  end;
  Sql.Free;
end;
{-------[DELETE de la Cdg_diagnostico]-------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.tbEliminarClick(Sender: TObject);
var
  sSql :String;
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) and sdqDatosDG_FECHABAJA.IsNull and
     (MsgBox('Confirma la Baja del Diagnóstico: ' + #13 +
              sdqDatosDG_CODIGO.AsString + ' - ' +
              sdqDatosDG_DESCRIPCION.AsString, MB_YESNO + MB_ICONQUESTION ) = IDYES) then
  begin
    sSql := 'UPDATE cdg_diagnostico ' +
              ' SET dg_fechabaja = actualdate, ' +
                  ' dg_usubaja = ' + SqlValue(Sesion.UserId) +
            ' WHERE dg_codigo = ' + SqlValue(sdqDatosDG_CODIGO.AsString);
    try
      EjecutarSql(sSql);
    except
      On E: Exception do ErrorMsg(E, 'Error al dar de baja el diagnóstico');
    end;
    Refrescar;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
function TfrmManCIE10.Validar:boolean;
begin
  Result := False;

  if ( Trim(edCodigo.Text) = '' ) Then
     InvalidMsg(edCodigo,'El Código no puede ser nulo')

  else if ( Trim(edGTrabajo.Text) = '' ) Then
     InvalidMsg(edGTrabajo, 'El Grupo de Trabajo no puede ser nulo')

  else if ( Trim(edDiagnostico.Text) = '' ) Then
     InvalidMsg(edDiagnostico, 'El Diagnóstico no puede ser nulo')

  else if ( fraCatCIE10.IsEmpty ) Then
     InvalidMsg(fraCatCIE10, 'La categoría según CIE10 no puede ser nula')

  else if ( fraNaturalezaFila.edCodigo.Text = '' ) Then
     InvalidMsg(fraNaturalezaFila.edCodigo, 'El campo Naturaleza (fila) no puede ser nulo' )

  else if ( fraZonaColumna.edCodigo.Text = '' ) Then
     InvalidMsg(fraZonaColumna.edCodigo, 'El campo Zona (columna) no puede ser nulo' )

  else if ( fraNaturalezaSRT.edCodigo.Text = '' ) Then
     InvalidMsg(fraNaturalezaSRT.edCodigo, 'El campo Naturaleza SRT no puede ser nulo' )

  else if ( fraZonaSRT.edCodigo.Text = '' ) Then
     InvalidMsg(fraZonaSRT.edCodigo, 'El campo Zona SRT no puede ser nulo' )

  else if ( fraFormaSRT.edCodigo.Text = '' ) Then
     InvalidMsg(fraFormaSRT.edCodigo, 'El campo Forma SRT no puede ser nulo' )

  else if ( Trim(edDiasEvo.Text) = '' ) Then
     InvalidMsg(edDiasEvo, 'El campo Periodicidad Evolutivos no puede ser nulo' )

  else if ( Trim(edCantMaxTraslados.Text) = '' ) Then
     InvalidMsg(edCantMaxTraslados, 'El campo Cantidad máxima de traslados no puede ser nulo' )

  else if ( Trim(edCantMaxFKT.Text) = '' ) Then
     InvalidMsg(edCantMaxFKT, 'El campo Cantidad máxima de FKT no puede ser nulo')


  else if chkIncapSegura.Checked and (( edIncapacLeve.Value = 0 )     or ( edIncapacLeve.Value = 0 )
                                 and ( edIncapacModerado.Value = 0 ) or ( edIncapacModerado.Value = 0 )
                                 and ( edIncapacGrave.Value = 0 )    or ( edIncapacGrave.Value = 0 )) Then
     InvalidMsg(edIncapacLeve, 'Si tiene Incapacidad, al menos una incapacidad no debe ser nula' )

  else if (fpABM.Caption = ABM_ALTA) and ExisteSql('Select 1 From Cdg_diagnostico Where dg_codigo = ' + SqlString(edCodigo.Text,True) ) Then
     InvalidMsg(edCodigo, 'El código que ingresó ya existe en la tabla')

  else
     Result := True;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.tbExportarClick(Sender: TObject);
begin
  ExportDialog.Execute;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.Footer.Text := Sesion.Usuario;
  if PrintDialog.Execute then QueryPrint.Print;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.dbgDatosDblClick(Sender: TObject);
begin
 if tbModificar.Enabled then tbModificarClick(Nil);
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCIE10.dbgDatosGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                             var Background: TColor; Highlight: Boolean);
begin
 if not sdqDatosDG_FECHABAJA.IsNull then AFont.Color := clRed;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
end.
