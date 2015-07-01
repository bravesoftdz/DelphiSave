unit unJustificacionILT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, Mask,
  ToolEdit, DB, SDEngine, ExtCtrls, AnsiSql, DateComboBox, unSiniestros,
  RxToolEdit, RxPlacemnt, Vcl.Buttons, artSeguridad, unClassLiquidacion, General;

type
  TfrmJustificacionILT = class(TfrmCustomForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edJustif1: TEdit;
    btnCancelar: TButton;
    dsDatos: TDataSource;
    sdqDatos: TSDQuery;
    Bevel18: TBevel;
    edDesde1: TDateComboBox;
    edHasta1: TDateComboBox;
    Seguridad: TSeguridad;
    chkJustificacionILT: TCheckBox;
    btnAceptar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure chkJustificacionILTClick(Sender: TObject);
  private
    { Private declarations }
    FModoModificacion: boolean;
    FIDExpediente: integer;
    procedure SetIDExpediente(const Value: integer);
 //   procedure Do_DeshabilitarEdits;
    function EsAlta: boolean;
   // function ValidarFechas(dFecDesde, dFecHasta: TDateTime; sNroRango: string): boolean;
    procedure DoGuardar(dFecDesde, dFecHasta: TDateTime; sJustif: string);
 //   function EsModificacionDeRango(var dDesdeGuard, dHastaGuard, dFechaGuard: TDateTime; sNroRango:string):boolean;
    procedure DoGuardarJustificacionILT;
    function ValidarLiquidaciones: boolean;
    function Validar_JustifILT:boolean;
  public
    { Public declarations }
    property IDExpediente: integer read FIDExpediente write SetIDExpediente;
    property ModoModificacion: Boolean  Read FModoModificacion  Write FModoModificacion;

  end;

var
  frmJustificacionILT: TfrmJustificacionILT;


implementation

uses
  VCLExtra, unDmPrincipal, unSesion, CustomDlgs, unArt, DateTimeFuncs;

{$R *.dfm}

{ TfrmJustificacionILT }

procedure TfrmJustificacionILT.SetIDExpediente(const Value: integer);
begin
  FIDExpediente := Value;
end;

procedure TfrmJustificacionILT.btnAceptarClick(Sender: TObject);
begin
  if Validar_JustifILT then
  begin
    DoGuardarJustificacionILT;
    ModalResult := mrOk;
  end
  else
    InfoHint(btnAceptar, 'No es posible Justificar ILT.');
end;

function TfrmJustificacionILT.Validar_JustifILT: boolean;
var sSql:string;
begin
  Result := True;
  if (chkJustificacionILT.Checked) then      // Solo valido en caso que sea para "tildar". para destildar, sale con true directamente
  begin
    sSql := 'SELECT 1 ' +
             ' FROM art.sev_eventosdetramite a, SIN.sei_eventoincapacidad b, art.sex_expedientes c ' +
            ' WHERE a.ev_siniestro = c.ex_siniestro ' +
              ' AND a.ev_orden = c.ex_orden ' +
              ' AND a.ev_codigo = b.ei_codigo ' +
              ' AND (   (b.ei_tipoevento = 6) ' +
                   ' OR (a.ev_tratamiento = ''S'')) ' +

              ' AND c.ex_id = :idexped ' +

              ' AND c.ex_altamedica IS NOT NULL ' +
              ' AND a.ev_fecha >= c.ex_altamedica ' +
              ' AND EXISTS(SELECT 1 ' +
                           ' FROM art.sex_expedientes d ' +
                          ' WHERE d.ex_siniestro = c.ex_siniestro ' +
                            ' AND d.ex_orden = c.ex_orden ' +
                            ' AND d.ex_recaida > c.ex_recaida ' +
                            ' AND NVL(ex_causafin,''0'') NOT IN (''95'', ''99'')) ' ;  // vuelve por ticket 67430

    Result := ExisteSqlEx(sSql, [Fidexpediente]);
  end;
end;

procedure TfrmJustificacionILT.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmJustificacionILT.chkJustificacionILTClick(Sender: TObject);
var sSql: string;
    iSiniestro, iOrden, iRecaida: Integer;
begin
  if chkJustificacionILT.Checked then     // Chequea
  begin
    // Calcula y asigna fechas Desde y Hasta
    sSql := 'SELECT ex_altamedica Desde, ex_siniestro, ex_orden, ex_recaida' +
             ' FROM art.sex_expedientes ' +
            ' WHERE ex_id = :idexped ';

    with GetQueryEx(sSql, [FIDExpediente]) do
    try
      edDesde1.Date := FieldByName('DESDE').AsDateTime;
      iSiniestro    := FieldByName('EX_SINIESTRO').AsInteger;
      iOrden        := FieldByName('EX_ORDEN').AsInteger;
      iRecaida      := FieldByName('EX_RECAIDA').AsInteger;
    finally
      Free;
    end;

    // por ticket de Jessica miño: 67430
    sSql := 'SELECT (A.ex_fecharecaida-1) Hasta ' +
             ' FROM art.sex_expedientes A ' +
            ' WHERE A.ex_siniestro = ' + SqlInt(iSiniestro) +
              ' AND A.ex_orden = ' + SqlInt(iOrden) +
              ' AND A.ex_recaida = (SELECT min(B.ex_recaida) ' +           // Trae la recaida minima que sea mayor a la actual y que no tenga error de carga.
                                    ' FROM art.sex_expedientes B ' +
                                   ' WHERE B.ex_siniestro = A.ex_siniestro ' +
                                     ' AND B.ex_orden = A.ex_orden ' +
                                     ' AND B.ex_recaida > ' + SqlInt(iRecaida) +
                                     ' AND NVL(B.ex_causafin,''0'') NOT IN (''95'', ''99'')) ';

    edHasta1.Date := ValorSqlDateTime(sSql);

    // habilitar texto de justificación
    edJustif1.Clear;
    LockControls([edJustif1], false);
  end
  else if not chkJustificacionILT.Checked then    // Deschequea
  begin
    edDesde1.Clear;
    edHasta1.Clear;
    edJustif1.Clear;
    LockControls([edJustif1], True);
  end;
end;

function TfrmJustificacionILT.ValidarLiquidaciones: boolean;
var sSql: string;
begin
  Result := False;
  sSql := ' SELECT 1 ' +
            ' FROM art.sle_liquiempsin, SIN.SJI_JUSTIFICACIONILT ' +
           ' WHERE le_tipoliqui IN(''D'', ''L'') ' +
             ' AND le_estado NOT IN(''Z'', ''X'', ''A'') ' +
             ' AND le_idexpediente = ji_idexpediente ' +
             ' AND le_idexpediente = ' + SqlInt(FIdExpediente) +
             ' AND le_fechades >= ji_fdesde1 ' +
             ' AND le_fechahas <= ji_fhasta1 ' +
             ' AND le_fproceso >= ji_fecha1 ';
  if ExisteSql(sSql) then                         // saque el Verificar por el Except que esta en el procedimiento que lo llama
    MsgBox('No se puede modificar con este rango de fechas, debido a que dentro del mismo existen liquidaciones de ILT')
  else
    Result := true;
end;

procedure TfrmJustificacionILT.FormActivate(Sender: TObject);
begin
  LockControls([edDesde1, edHasta1], true);

  with sdqDatos do
  begin
    Close;
    SQL.Text := ' SELECT ji_chkJustificacionILT, ji_fdesde1, ji_fhasta1, ji_justificacion1 ' +
                  ' FROM SIN.SJI_JUSTIFICACIONILT ' +
                 ' WHERE ji_idexpediente = ' + SqlInt(FIDExpediente) +
                   ' AND ji_fechabaja is null ';
    Open;

    chkJustificacionILT.Checked := (FieldByName('JI_CHKJUSTIFICACIONILT').AsString = 'S');

    if chkJustificacionILT.Checked then
    begin
      edDesde1.Date  := FieldByName('JI_FDESDE1').AsDateTime;
      edHasta1.Date  := FieldByName('JI_FHASTA1').AsDateTime;
      edJustif1.Text := FieldByName('JI_JUSTIFICACION1').AsString;
    end
    else
    begin
      edDesde1.Clear;
      edHasta1.Clear;
      edJustif1.Clear;
    end;

    if ModoModificacion then
    begin
      chkJustificacionILT.Enabled := True;
      btnAceptar.Visible          := True;
      btnCancelar.Caption         := 'Cancelar';
      LockControls([edJustif1], not (FieldByName('JI_CHKJUSTIFICACIONILT').AsString = 'S'));
    end
    else begin
      chkJustificacionILT.Enabled := False;
      btnAceptar.Visible          := False;
      btnCancelar.Caption         := 'Cerrar';
      LockControls([edJustif1], True);
    end;

  end;
end;



procedure TfrmJustificacionILT.FormCreate(Sender: TObject);
begin
 {$IFDEF SINIESTROS}
   ModoModificacion := Seguridad.Claves.IsActive('ModoModificacion_JustifILT');
 {$ENDIF}
 {$IFDEF DINERARIAS}
   ModoModificacion := False;
 {$ENDIF}
end;


function TfrmJustificacionILT.EsAlta: boolean;
begin
  Result :=  not ExisteSqlEx('SELECT 1 ' +
                              ' FROM SIN.SJI_JUSTIFICACIONILT ' +
                             ' WHERE JI_IDEXPEDIENTE = :idexped', [FIDExpediente]);
end;

{function TfrmJustificacionILT.EsModificacionDeRango(var dDesdeGuard, dHastaGuard, dFechaGuard: TDateTime; sNroRango:string): boolean;
var sSql: string;
begin
  sSql := 'SELECT ji_fdesde' + sNroRango + ' FDESDE, ji_fhasta' + sNroRango + ' FHASTA, ji_fecha' + sNroRango + ' FECHA ' +
           ' FROM sin.sji_justificacionilt ' +
          ' WHERE ji_idexpediente = ' + SqlInt(FIdExpediente);


  with GetQuery(sSql) do
  begin
    Result := (not fieldbyname('FDESDE').isNull);
    if Result then
    begin
      dDesdeGuard := fieldbyname('FDESDE').AsDateTime;
      dHastaGuard := fieldbyname('FHASTA').AsDateTime;
      dFechaGuard := fieldbyname('FECHA').AsDateTime;
    end
    else
    begin
      dDesdeGuard := 0;
      dHastaGuard := 0;
      dFechaGuard := 0;
    end;
  end;
end;   }

{
function TfrmJustificacionILT.ValidarFechas(dFecDesde, dFecHasta: TDateTime; sNroRango: string): boolean;
var FechaAux, ComienzoVig, dDesdeGuardada, dHastaGuardada, dFechaGuardada, UltimaFechaHasta: TDateTime;
    sCantAnioILT, sSql: String;
    iSiniestro, iOrden, iRecaida, iIdExped: integer;
begin

  // Validacion del alta medica (algo que no estaba en las liq de ILT) y luego: Validacion de Fecha Desde no puede ser anterior al comienzo de la vigencia de ILT
  sSql := 'SELECT ex_siniestro, ex_orden, ex_recaida, ex_altamedica, ex_id ' +
           ' FROM art.sex_expedientes ' +
          ' WHERE ex_id = :idexped ';
  with GetQueryEx(sSql, [FIdExpediente]) do
  begin
    iSiniestro := FieldByName('ex_siniestro').AsInteger;
    iOrden     := FieldByName('ex_orden').AsInteger;
    iRecaida   := FieldByName('ex_recaida').AsInteger;
    iIdExped   := FieldByName('ex_id').AsInteger;

   { if (not FieldByName('EX_ALTAMEDICA').IsNull)  then
    begin
      dAltaMedica := FieldByName('EX_ALTAMEDICA').AsDateTime;
      Verificar((dFecDesde > dAltaMedica ) or (dFecHasta > dAltaMedica), nil,
                 'Ninguna de las fechas del rango deben ser posterior a la Fecha de Alta médica del Siniestro. Ultima fecha posible: ' + DateToStr(dAltaMedica));
    end;       }

{    ComienzoVig := GetFechaInicioILT(iSiniestro, iOrden, iRecaida);
    Verificar(dFecDesde < ComienzoVig, nil, 'La fecha Desde no puede ser anterior al comienzo de la Vigencia de ILT.');
  end;

  // Validacion Fecha Hasta, no puede ser superior a la ultima fecha posible de liquidacion (o al fin de la vigencia de ILT)
  if (ValorSqlEx('SELECT inca.is_extensionilt(:pIdExped) FROM dual', [FIdExpediente]) = 'S') then   // Si es Plan Extensión de ILT
  begin
    FechaAux     := AddYears(ComienzoVig, 2) - 1;
    sCantAnioILT := '2';
  end
  else begin
    FechaAux     := AddYears(ComienzoVig, 1) - 1;
    sCantAnioILT := '1';
  end;
  Verificar ( ((dFecHasta <> 0) and (dFecHasta > FechaAux)), nil,
               'La Fecha Hasta no puede ser posterior al fin de la vigencia de ILT. La última fecha posible es ' + DateToStr(FechaAux));

  // Validación del pto. 6 del mail de JBruno: Si hay ILT liquidada en ese período, el campo Desde – Hasta  no podría ser modificado. Sólo se valida si es modificacion de las fechas.
  if EsModificacionDeRango(dDesdeGuardada, dHastaGuardada, dFechaGuardada, sNroRango) then
  begin
    sSql := ' SELECT 1 ' +
              ' FROM art.sle_liquiempsin ' +
             ' WHERE le_tipoliqui IN(''D'', ''L'') ' +
               ' AND le_estado NOT IN(''Z'', ''X'', ''A'') ' +
               ' AND le_idexpediente = ' + SqlInt(FIdExpediente) +
               ' AND le_fechades >= ' + SqlDate(dDesdeGuardada) +
	             ' AND le_fechahas <= ' + SqlDate(dHastaGuardada) +
               ' AND le_fproceso >= ' + SqlDate(dFechaGuardada);
    Verificar(ExisteSql(sSql), nil, 'No se puede modificar con este rango de fechas, debido a que dentro del mismo existen liquidaciones de ILT');
  end;

  if GetIsExtensionILT(iIdExped) then   // Plan Extensión de ILT
    UltimaFechaHasta := AddYears(ComienzoVig, 2) - 1
  else
    UltimaFechaHasta := AddYears(ComienzoVig, 1) - 1;
  Verificar((dFecHasta > UltimaFechaHasta), nil, 'La última fecha posible para liquidaciones es ' + DateToStr(UltimaFechaHasta));


  Result := True;
end;
}


procedure TfrmJustificacionILT.DoGuardarJustificacionILT;
begin
//  if ValidarFechas(edDesde1.Date, edHasta1.Date, '1') then
    DoGuardar(edDesde1.Date, edHasta1.Date, edJustif1.Text);
end;


procedure TfrmJustificacionILT.DoGuardar(dFecDesde, dFecHasta: TDateTime; sJustif: string);
var sSql: string;
    bGuardo:boolean;
begin
  bGuardo := false;
  Try
    BeginTrans;

    // Chequea
    if (chkJustificacionILT.Checked) and (MsgBox('¿ Seguro que desea guardar la Justificación de ILT ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK) then
    Begin
      if EsAlta then  // Alta
        sSql := 'INSERT INTO SIN.SJI_JUSTIFICACIONILT ' +
                   '( ji_chkjustificacionILT, ji_idexpediente, ji_fdesde1, ji_fhasta1, ji_justificacion1, ' +
                    ' ji_usu1, ji_fecha1 )' +
                 ' VALUES (' +
                   IIF(chkJustificacionILT.Checked, '''S''', '''N''') + ', ' + SqlInt(FIDExpediente) + ', ' + SqlDate(dFecDesde) + ', ' + SqlDate(dFecHasta) + ', ' + SqlValue(sJustif) + ', ' +
                   SqlValue(Sesion.UserID) + ', art.actualdate )'

      else            // Modif
        sSql := 'UPDATE SIN.SJI_JUSTIFICACIONILT ' +

                  ' SET ji_justificacion1 = ' + SqlValue(sJustif)  + ', ' +
                      ' ji_fecha1 = art.actualdate, ' +
                      ' ji_usu1 = ' + SqlValue(Sesion.UserID) +  ', ' +
                      ' ji_fdesde1 = ' + SqlDate(dFecDesde) + ', ' +
                      ' ji_fhasta1 = ' + SqlDate(dFecHasta) + ', ' +
                      ' ji_chkjustificacionILT = ' + IIF(chkJustificacionILT.Checked, '''S''', '''N''') + ', ' +
                      ' ji_usubaja = null, ' +
                      ' ji_fechabaja = null ' +
          ' WHERE ji_idexpediente = ' + SqlInt(FIDExpediente);

      bGuardo := True;
    End
    // Deschequea
    else if not chkJustificacionILT.Checked and ValidarLiquidaciones and (MsgBox('¿ Seguro que desea dar de baja la Justificación de ILT ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK) then
    begin
      sSql := 'UPDATE SIN.SJI_JUSTIFICACIONILT ' +
                ' SET ji_fechabaja = art.actualdate, ' +
                    ' ji_usubaja = ' + SqlValue(Sesion.UserID) + ', ' +
                    ' ji_chkJustificacionILT = ''N'' ' +
              ' WHERE ji_idexpediente = ' + SqlInt(FIDExpediente);
      bGuardo := True;
    end;

    if bGuardo then
    begin
      EjecutarSqlST(sSql);
      CommitTrans;
      MsgBox('Se han guardado correctamente los cambios.');
    end;

  Except
    on E:Exception do
    begin
      ErrorMsg(E, 'Ha surgido un error al intentar guardar la Justificación de ILT.');
      Rollback;
    end;
  end;

end;

end.
