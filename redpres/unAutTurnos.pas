unit unAutTurnos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, DateComboBox, Buttons,
  unfraPrestaciones, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  ExtCtrls, FormPanel, ShortCutControl;

type
  TTipoCarga = (tcAlta, tcConsulta, tcAprobacion);
  TfrmAutTurnos = class(TForm)
    GroupBox2: TGroupBox;
    Label11: TLabel;
    btnAgregarTurno: TSpeedButton;
    btnEliminarTurno: TSpeedButton;
    cmbTurnoFecha: TDateComboBox;
    mskTurnoHora: TMaskEdit;
    btnAceptarTurno: TButton;
    btnCancelarTurno: TButton;
    Label1: TLabel;
    edPrestador: TEdit;
    fraPrestacion: TfraPrestacion;
    Label2: TLabel;
    btnAnularTurno: TSpeedButton;
    fpAnular: TFormPanel;
    Bevel5: TBevel;
    Label18: TLabel;
    btnAnuAceptar: TButton;
    btnAnuCancelar: TButton;
    fraMotivoAnulacion: TfraCodigoDescripcion;
    ShortCutControl: TShortCutControl;
    btnAprobarCT: TButton;
    btnAprobarST: TButton;
    ScrollBox1: TScrollBox;
    lstTurnos: TListBox;
    procedure btnAceptarTurnoClick(Sender: TObject);
    procedure btnAgregarTurnoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEliminarTurnoClick(Sender: TObject);
    procedure btnAnularTurnoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAnuAceptarClick(Sender: TObject);
    procedure lstTurnosDrawItem(Control: TWinControl; Index: Integer;
                                Rect: TRect; State: TOwnerDrawState);
    procedure btnAprobarCTClick(Sender: TObject);
    procedure btnAprobarSTClick(Sender: TObject);
  private
    FTipoCarga :TTipoCarga;
    FIdExpediente, FIdAutorizacion, FCantSesiones :Integer;
    procedure DoInsertarTurnos;
    procedure SetTipoCarga(const Value: TTipoCarga);
    function ValidarTurnosRepetidos: Boolean;
    function ValidarFechayHora: Boolean;
    function CantTurnosBaja :Integer;
    function GetCantTurnos :Integer;
  public
    sEstado :String;
    property TipoCarga :TTipoCarga read FTipoCarga write SetTipoCarga;
    property IdExpediente :Integer read FIdExpediente write FIdExpediente;
    property IdAutorizacion :Integer read FIdAutorizacion write FIdAutorizacion;
    property ICantSesiones :Integer read FCantSesiones write FCantSesiones;
    procedure DoCargarTurnos;
  end;

var
  frmAutTurnos: TfrmAutTurnos;

implementation

uses CustomDlgs, General, unSesion, AnsiSql, unDmPrincipal, Strfuncs, DB,
     unAutAprob;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.btnAceptarTurnoClick(Sender: TObject);
begin
  if btnAgregarTurno.Enabled then DoInsertarTurnos;
  ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.DoInsertarTurnos;
var
  sSql, sTurnoFecha, sTurnoHora :String;
  i :Integer;
begin
  if (FTipoCarga <> tcAlta) then
  begin
    //aca borro solo porque son turnos que no estan aprobados todavia, limpio el listbox
    //para poder insertar y que tome bien los cambios que se pueden haber hecho
    sSql := 'DELETE FROM sin.stp_turnosprestaciones ' +
            ' WHERE tp_idautorizacion = ' + SqlInt(IdAutorizacion) +
              ' AND tp_fechabaja IS NULL ';
    if InTransaction then
      EjecutarSqlST(sSql)
    else
      EjecutarSql(sSql);
  end;

  i := 0;
  while (i <= lstTurnos.Items.Count - 1) do
  begin
    if length(lstTurnos.Items[i]) <= 23 then
    begin
      sTurnoFecha := StrLeft(lstTurnos.Items[i], 10);
      sTurnoHora  := StrLeft(StrRight(lstTurnos.Items[i], 9), 5);
      sSql        := ' INSERT INTO sin.stp_turnosprestaciones ' +
                    ' (tp_idautorizacion, tp_fechaturno, tp_horaturno, tp_fechaalta, ' +
                    ' tp_usualta) VALUES ( ' +
                    SqlInt(FIdAutorizacion) + ', TO_DATE(''' + sTurnoFecha + ''', ''DD/MM/YYYY''), ' +
                    SqlString(sTurnoHora, True) + ', Actualdate, ' +
                    SqlValue(Sesion.UserID) + ')';

      if InTransaction then
        EjecutarSqlST(sSql)
      else
        EjecutarSql(sSql);
    end;
    Inc(i);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.btnAgregarTurnoClick(Sender: TObject);
begin
  if ValidarTurnosRepetidos and ValidarFechayHora then
    lstTurnos.Items.Add(DateToStr(cmbTurnoFecha.Date) + ' - ' + mskTurnoHora.Text + ' hs.');
end;
{-------------------------------------------------------------------------------}
function TfrmAutTurnos.ValidarTurnosRepetidos: Boolean;
var
  sSql: String;
begin
  sSql   := 'SELECT 1 ' +
             ' FROM sin.stp_turnosprestaciones, sau_autorizaciones ' +
            ' WHERE tp_idautorizacion = au_id ' +
              ' AND au_idexpediente = ' + SqlInt(FIdExpediente) +
              ' AND tp_fechaturno = ' + SqlDate(cmbTurnoFecha.Date) +
              ' AND tp_horaturno = ' + SqlString(mskTurnoHora.Text,True) +
              ' AND tp_fechabaja IS NULL ';
  if ExisteSql(sSql) then
  begin
    MsgBox('Ya existe un Turno-Hora igual para el siniestro seleccionado.', MB_ICONEXCLAMATION);
    Result := False;
  end
  else
    Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmAutTurnos.ValidarFechayHora: Boolean;
var
  Mensaje, CadenaHora: String;
  i, j: Integer;
begin
  Mensaje     :='';
  CadenaHora  := mskTurnoHora.Text;
  i           := 0;
  Result      := True;
  for j := 1 to 5 do
    if (CadenaHora[j] = ' ') then
      CadenaHora[j] := '0';

  mskTurnoHora.Text := CadenaHora;

  if (cmbTurnoFecha.Date = 0) then
    Mensaje := 'Falta completar la Fecha'
  else if (StrLeft(mskTurnoHora.Text, 2) > '23') then
    Mensaje := 'Hora inválida'
  else if (StrRight(mskTurnoHora.Text, 2) > '59') then
    Mensaje := 'Hora inválida'
  else    {este va al final}
  begin
    if lstTurnos.Items.Count > 0 then
      while (i <= (lstTurnos.Items.Count - 1)) and (Mensaje = '') do
      begin
        if (StrLeft(lstTurnos.Items[i], 10) = cmbTurnoFecha.Text) and
           (StrRight(lstTurnos.Items[i], 9) = (mskTurnoHora.Text + ' hs.')) then
          Mensaje := 'No se pueden repetir los turnos';
        Inc(i);
      end;
  end;

  if Mensaje <> '' then
  begin
    Result := False;
    MsgBox('No se puede insertar debido al siguiente error:' + #13 + Mensaje, MB_ICONEXCLAMATION);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.FormShow(Sender: TObject);
begin
  cmbTurnoFecha.Clear;
  mskTurnoHora.Clear;
  lstTurnos.Clear;
  cmbTurnoFecha.MinDate     := DBDate;
  btnAgregarTurno.Enabled   := (sEstado = 'P');
  btnEliminarTurno.Enabled  := (sEstado = 'P');
  btnAnularTurno.Enabled    := ((FTipoCarga = tcConsulta) or (FTipoCarga = tcAprobacion)) and
                                not(AreIn(sEstado, ['P', 'L']));
  if (FTipoCarga = tcConsulta) or (FTipoCarga = tcAprobacion) then DoCargarTurnos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.btnEliminarTurnoClick(Sender: TObject);
var
  i: Integer;
begin
  i := 0;
  while i <= (lstTurnos.Items.Count - 1) do
  begin
    if lstTurnos.Selected[i] then
      lstTurnos.Items.Delete(i);
    Inc(i);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.DoCargarTurnos;
var
  sSql :String;
begin
  lstTurnos.Items.Clear;
  sSql := ' SELECT tp_fechaturno, tp_horaturno, tp_fechabaja, mt_descripcion ' +
            ' FROM sin.stp_turnosprestaciones, smt_motanultraslados ' +
           ' WHERE tp_idmotivobaja = mt_id(+) ' +
             ' AND tp_idautorizacion = :IdAuto ' +
        ' ORDER BY tp_fechaturno ';
  with GetQueryEx(sSql, [FIdAutorizacion]) do
  try
    while not Eof do
    begin
      lstTurnos.Items.Add(FieldByName('tp_fechaturno').Text + ' - ' +
                          FieldByName('tp_horaturno').Text + ' hs.' +
                          IIF(FieldByName('tp_fechabaja').IsNull, '', ' - ') +
                          FieldByName('mt_descripcion').Text);
      Next;
    end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.btnAnularTurnoClick(Sender: TObject);
var
  i, iCant, iAnulados :Integer;
  sSql, sFecha, sHora, sWhere :String;
begin
  Verificar(lstTurnos.SelCount < 1, lstTurnos, 'Debe seleccionar al menos un turno.');
  iAnulados := CantTurnosBaja;
  Verificar((iAnulados = 1), lstTurnos, 'No se pueden anular todos los turnos de una autorización.');
  Verificar((iAnulados = 2) or (iAnulados = 3), lstTurnos,
            'No se pueden anular más turnos que los consumidos parcialmente.');
  if MsgBox('¿Confirma la anulación del/los turno/s?',MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    iCant   := 0;
    i       := 0;
    sFecha  := '';
    sHora   := '';
    while i <= (lstTurnos.Items.Count - 1) do
    begin
      if lstTurnos.Selected[i] then
      begin
        sFecha := StrLeft(lstTurnos.Items[i], 10);
        sHora  := Copy(lstTurnos.Items[i], 14, 5);
        sWhere := ' WHERE tp_idautorizacion = ' + SqlInt(FIdAutorizacion) +
                    ' AND tp_fechaturno = to_date(''' + sFecha + ''', ''dd/mm/yyyy'') ' +
                    ' AND tp_horaturno = ''' + sHora + '''';
        sSql := 'SELECT 1 FROM sin.stp_turnosprestaciones ' + sWhere + ' AND tp_fechabaja IS NOT NULL ';
        if not ExisteSql(sSql) and (fpAnular.ShowModal = mrOk)  then  //si no está ya dado de baja
        try
          BeginTrans;
          sSql    := ' UPDATE sin.stp_turnosprestaciones ' +
                        ' SET tp_fechabaja = actualdate, ' +
                            ' tp_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                            ' tp_idmotivobaja = ' + SqlInt(fraMotivoAnulacion.ID) + sWhere;
          EjecutarSqlST(sSql);
          if (fraMotivoAnulacion.sdqDatos.FieldByName('mt_permiteliquidar').AsString = 'N') then
          begin
            sSql    := ' UPDATE sau_autorizaciones ' +
                          ' SET au_cantapro = au_cantapro - 1, ' +
                              ' au_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                              ' au_fechamodif = actualdate ' +
                        ' WHERE au_id = ' + SqlInt(FIdAutorizacion);
            EjecutarSqlST(sSql);
          end;
          CommitTrans;
          Inc(iCant);
        except
          on E:Exception do
          begin
            MsgBox('No se pudo anular el último turno debido al siguiente error:' + #13 + #13 + E.Message, MB_ICONEXCLAMATION);
            Rollback(True);
          end;
        end;
      end;
      Inc(i);
    end;
    if (iCant > 0) then DoCargarTurnos;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmAutTurnos.CantTurnosBaja :Integer;
var
  sSql :String;
  iTur, iConsu, iRes, iSel, iDif :Integer;
begin
  iTur  := GetCantTurnos;
  iSel  := lstTurnos.SelCount; //los seleccionados para borrar

  if (sEstado = 'A') then //si esta aprobada solo cuento los traslados que van quedando..
    iRes := IIF((iTur <= iSel), 1, 0)
  else begin //si esta consumida parcialmente tengo que ver la cantidad consumida..
    sSql   := 'SELECT au_cantconsu ' +
               ' FROM sau_autorizaciones ' +
              ' WHERE au_id = :IdAuto ';
    iConsu := ValorSqlIntegerEx(sSql, [FIdAutorizacion]);
    iDif   := iTur - iConsu; //la diferencia entre los traslados que hay y los consumidos
    iRes   := IIF((iDif = 0), 3, IIF((iDif < iSel), 2, 0));
  end;
  Result := iRes;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.FormCreate(Sender: TObject);
begin
   with fraMotivoAnulacion do
   begin
     ShowBajas   := False;
     TableName   := 'SMT_MOTANULTRASLADOS';
     FieldID     := 'MT_ID';
     FieldCodigo := 'MT_CODIGO';
     FieldDesc   := 'MT_DESCRIPCION';
     FieldBaja   := 'MT_FECHABAJA';
     ExtraFields := ', MT_PERMITELIQUIDAR ';
   end
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.btnAnuAceptarClick(Sender: TObject);
begin
  Verificar(fraMotivoAnulacion.IsEmpty, fraMotivoAnulacion, 'Debe seleccionar un motivo.');
  fpAnular.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.lstTurnosDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  sTexto :String;
  iLong  :Integer;
begin
  sTexto := lstTurnos.Items[Index];
  iLong  := length(sTexto);

  if (iLong > 23) then //si es una baja
   lstTurnos.Canvas.Font.Color := clRed
  else
    lstTurnos.Canvas.Font.Color := clDkGray;

  lstTurnos.Canvas.TextRect(Rect, Rect.Left, Rect.Top, sTexto);
end;
{-------------------------------------------------------------------------------}
function TfrmAutTurnos.GetCantTurnos :Integer;
var
  sSql :String;
begin
  sSql := 'SELECT count(*) ' +
           ' FROM sin.stp_turnosprestaciones ' +
          ' WHERE tp_idautorizacion = :idauto ' +
            ' AND tp_fechabaja IS NULL ';
  Result  := ValorSqlIntegerEx(sSql, [FIdAutorizacion]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.SetTipoCarga(const Value: TTipoCarga);
begin
  if FTipoCarga <> Value then
    FTipoCarga := Value;

  btnAprobarCT.Visible    := (FTipoCarga = tcAprobacion);
  btnAprobarST.Visible    := (FTipoCarga = tcAprobacion);
  btnAceptarTurno.Visible := (FTipoCarga <> tcAprobacion);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.btnAprobarCTClick(Sender: TObject);
begin
  Verificar(lstTurnos.Items.Count = 0, lstTurnos, 'Debe ingresar al menos un turno.');
  DoInsertarTurnos;
  Verificar((sEstado = 'P') and (FCantSesiones <> GetCantTurnos), lstTurnos,
            'La cantidad de turnos para la autorización debe ser de ' + IntToStr(FCantSesiones) + '.');
  ModalResult := mrYes;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutTurnos.btnAprobarSTClick(Sender: TObject);
begin
  DoInsertarTurnos;
  ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
end.
