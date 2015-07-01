unit unEventosABM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, ToolWin, mwCustomEdit,
  ExtCtrls, ImageComboBox, Menus, SDEngine, Db, unManArchivosExp;

type
  TfrmEventosABM = class(TForm)
    Bevel4: TBevel;
    Label21: TLabel;
    Label3: TLabel;
    Label16: TLabel;
    Bevel5: TBevel;
    Label19: TLabel;
    btnEvAceptar: TButton;
    btnEvCancelar: TButton;
    cmbEvMomento: TImageComboBox;
    cmbEvErrores: TImageComboBox;
    pnlEventSql: TPanel;
    mwEvSql: TmwCustomEdit;
    chkEvCheckParams: TCheckBox;
    cmbEvTipoAccion: TImageComboBox;
    tbEvToolBar: TToolBar;
    tbEvAbmLimpiar: TToolButton;
    ToolButton5: TToolButton;
    tbEvAbmSintaxis: TToolButton;
    tbEvAbmSintaxisEx: TToolButton;
    ToolButton10: TToolButton;
    tbEvAgrCampo: TToolButton;
    tbEvAbmImprimir: TToolButton;
    btnEvAplicar: TButton;
    stCurPos: TStaticText;
    procedure cmbEvTipoAccionChange(Sender: TObject);
    procedure mwEvSqlKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mwEvSqlKeyPress(Sender: TObject; var Key: Char);
    procedure mwEvSqlKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnEvAplicarClick(Sender: TObject);
    procedure btnEvAceptarClick(Sender: TObject);
    procedure tbEvAbmLimpiarClick(Sender: TObject);
    procedure tbEvAbmSintaxisClick(Sender: TObject);
    procedure tbEvAbmSintaxisExClick(Sender: TObject);
    procedure tbEvAgrCampoClick(Sender: TObject);
    procedure pmnuCamposClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure mwEvSqlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mwEvSqlMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    FOwnerForm: TfrmManArchivosExp;

    procedure CheckSintaxis(AQuery: TSDQuery; ArchivoSql: Boolean);
    procedure ShowCursorPos;
  public
  end;

var
  frmEventosABM: TfrmEventosABM;

implementation

uses
  unPrincipal, General, unImpoExpo, DbFuncs, AnsiSql, EditDialog, unDmPrincipal, SqlFuncs, CustomDlgs, Strfuncs;

{$R *.DFM}

procedure TfrmEventosABM.CheckSintaxis(AQuery: TSDQuery; ArchivoSql: Boolean);
var
  sSql: String;
begin
  if ArchivoSql then
    sSql := FOwnerForm.mwSql.Lines.Text
  else
    sSql := mwEvSql.Lines.Text;

  CheckAndOpenQuery(AQuery, sSql, ArchivoSql);
end;

procedure TfrmEventosABM.ShowCursorPos;
begin
  stCurPos.Caption := Format('%d:%d', [mwEvSql.CaretY, mwEvSql.CaretX]);
end;


procedure TfrmEventosABM.cmbEvTipoAccionChange(Sender: TObject);
var
  i: Integer;
  MenuItem: TMenuItem;
begin
  FOwnerForm.pmnuCampos.Items.Clear;

  if AreIn(ATA_TIPOACCION[cmbEvTipoAccion.ItemIndex], [ATA_WRITE, ATA_ALL]) and (FOwnerForm.edCampNombre.Items.Count <> 0) then
    for i := 0 to FOwnerForm.edCampNombre.Items.Count - 1 do
    begin
      MenuItem := TMenuItem.Create(FOwnerForm.pmnuCampos);
      MenuItem.Caption := FOwnerForm.edCampNombre.Items[i];
      MenuItem.OnClick := pmnuCamposClick;
      FOwnerForm.pmnuCampos.Items.Add(MenuItem);
    end;

  if AreIn(ATA_TIPOACCION[cmbEvTipoAccion.ItemIndex], [ATA_READ, ATA_ALL]) then
    with TDataCycler.Create(FOwnerForm.sdqCampos) do
    try
      repeat
        if FOwnerForm.pmnuCampos.FindComponent(FOwnerForm.sdqCampos.FieldByName('AC_NOMBRE').AsString) = nil then
        begin
          MenuItem := TMenuItem.Create(FOwnerForm.pmnuCampos);
          MenuItem.Caption := FOwnerForm.sdqCampos.FieldByName('AC_NOMBRE').AsString;
          MenuItem.OnClick := pmnuCamposClick;
          FOwnerForm.pmnuCampos.Items.Add(MenuItem);
        end;
      until not Cycle;
    finally
      Free;
    end;

  tbEvAgrCampo.Enabled := FOwnerForm.pmnuCampos.Items.Count > 0;
end;

procedure TfrmEventosABM.mwEvSqlKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ShowCursorPos;
end;

procedure TfrmEventosABM.mwEvSqlKeyPress(Sender: TObject; var Key: Char);
begin
  ShowCursorPos;
end;

procedure TfrmEventosABM.mwEvSqlKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ShowCursorPos;
end;

procedure TfrmEventosABM.btnEvAplicarClick(Sender: TObject);
var
  Sql: TSql;
  AeOrden: Integer;
begin
  Sql := TSql.Create('IAE_ARCHIVOEVENTO');
  try
    Sql.PrimaryKey.Add('AE_IDARCHIVO',  FOwnerForm.fraPrimaryKey.Value);

  //        Sql.Fields.Add( 'AE_SQL',            TrimRight(mwEvSql.Text) );
    Sql.Fields.Add('AE_FECHABAJA',      SQL_NULL, False);
    Sql.Fields.Add('AE_USUBAJA',        SQL_NULL, False);
    if Caption = FORM_CAP_INSERT then
    begin
      AeOrden := IncSql('SELECT MAX(AE_ORDEN) FROM IAE_ARCHIVOEVENTO WHERE AE_IDARCHIVO = ' + SqlInt(FOwnerForm.fraPrimaryKey.Value));
      Sql.Fields.Add('AE_FECHAALTA',  SQL_ACTUALDATE, False);
      Sql.Fields.Add('AE_USUALTA',    frmPrincipal.DBLogin.LoginName);
      Sql.SqlType := stInsert;
    end
    else
    begin
      AeOrden := FOwnerForm.sdqEventos.FieldByName('AE_ORDEN').AsInteger;
      Sql.Fields.Add('AE_FECHAMODIF', SQL_ACTUALDATE, False);
      Sql.Fields.Add('AE_USUMODIF',   frmPrincipal.DBLogin.LoginName);
      Sql.SqlType := stUpdate;
    end;
    Sql.PrimaryKey.Add('AE_ORDEN',      AeOrden);
    Sql.Fields.Add('AE_MOMENTO',        TE_MOMENTOS[cmbEvMomento.ItemIndex]);
    Sql.Fields.Add('AE_ACCIONERROR',    Copy('CSIM', cmbEvErrores.ItemIndex + 1, 1));
    Sql.Fields.Add('AE_TIPOACCION',     ATA_TIPOACCION[cmbEvTipoAccion.ItemIndex]);
    Sql.Fields.Add('AE_USARPARAMETROS', chkEvCheckParams.Checked);

    EjecutarSql(Sql.Sql);

    SaveBlob('SELECT AE_SQL ' +
               'FROM IAE_ARCHIVOEVENTO ' +
              'WHERE AE_IDARCHIVO = ' + SqlValue(FOwnerForm.fraPrimaryKey.Value) + ' ' +
                'AND AE_ORDEN = ' + SqlValue(AeOrden),

             'UPDATE IAE_ARCHIVOEVENTO ' +
                'SET AE_SQL = :AE_SQL ' +
              'WHERE AE_IDARCHIVO = ' + SqlValue(FOwnerForm.fraPrimaryKey.Value) + ' ' +
                'AND AE_ORDEN = ' + SqlValue(AeOrden),

             'AE_SQL', mwEvSql.Lines);

    FOwnerForm.sdqEventos.Refresh;

    if Sender = btnEvAceptar then
      ModalResult := mrOk;
  finally
    Sql.Free;
  end;
end;

procedure TfrmEventosABM.btnEvAceptarClick(Sender: TObject);
var
  Sql: TSql;
  AeOrden: Integer;
begin
  Sql := TSql.Create('IAE_ARCHIVOEVENTO');
  try
    Sql.PrimaryKey.Add('AE_IDARCHIVO',  FOwnerForm.fraPrimaryKey.Value);

  //        Sql.Fields.Add( 'AE_SQL',            TrimRight(mwEvSql.Text) );
    Sql.Fields.Add('AE_FECHABAJA',      SQL_NULL, False);
    Sql.Fields.Add('AE_USUBAJA',        SQL_NULL, False);
    if Caption = FORM_CAP_INSERT then
    begin
      AeOrden := IncSql('SELECT MAX(AE_ORDEN) FROM IAE_ARCHIVOEVENTO WHERE AE_IDARCHIVO = ' + SqlInt(FOwnerForm.fraPrimaryKey.Value));
      Sql.Fields.Add('AE_FECHAALTA',  SQL_ACTUALDATE, False);
      Sql.Fields.Add('AE_USUALTA',    frmPrincipal.DBLogin.LoginName);
      Sql.SqlType := stInsert;
    end
    else
    begin
      AeOrden := FOwnerForm.sdqEventos.FieldByName('AE_ORDEN').AsInteger;
      Sql.Fields.Add('AE_FECHAMODIF', SQL_ACTUALDATE, False);
      Sql.Fields.Add('AE_USUMODIF',   frmPrincipal.DBLogin.LoginName);
      Sql.SqlType := stUpdate;
    end;
    Sql.PrimaryKey.Add('AE_ORDEN',      AeOrden);
    Sql.Fields.Add('AE_MOMENTO',        TE_MOMENTOS[cmbEvMomento.ItemIndex]);
    Sql.Fields.Add('AE_ACCIONERROR',    Copy('CSIM', cmbEvErrores.ItemIndex + 1, 1));
    Sql.Fields.Add('AE_TIPOACCION',     ATA_TIPOACCION[cmbEvTipoAccion.ItemIndex]);
    Sql.Fields.Add('AE_USARPARAMETROS', chkEvCheckParams.Checked);

    EjecutarSql(Sql.Sql);

    SaveBlob('SELECT AE_SQL ' +
               'FROM IAE_ARCHIVOEVENTO ' +
              'WHERE AE_IDARCHIVO = ' + SqlValue(FOwnerForm.fraPrimaryKey.Value) + ' ' +
                'AND AE_ORDEN = ' + SqlValue(AeOrden),

             'UPDATE IAE_ARCHIVOEVENTO ' +
                'SET AE_SQL = :AE_SQL ' +
              'WHERE AE_IDARCHIVO = ' + SqlValue(FOwnerForm.fraPrimaryKey.Value) + ' ' +
                'AND AE_ORDEN = ' + SqlValue(AeOrden),

             'AE_SQL', mwEvSql.Lines);

    FOwnerForm.sdqEventos.Refresh;

    if Sender = btnEvAceptar then
      ModalResult := mrOk;
  finally
    Sql.Free;
  end;
end;

procedure TfrmEventosABM.tbEvAbmLimpiarClick(Sender: TObject);
begin
  mwEvSql.Lines.Text := ' ';
end;

procedure TfrmEventosABM.tbEvAbmSintaxisClick(Sender: TObject);
var
  sdqSintaxis: TSDQuery;
begin
  try
    sdqSintaxis := TSDQuery.Create(Self);
    try
      SetDatabaseToQuery(sdqSintaxis);
      CheckSintaxis(sdqSintaxis, (Sender = FOwnerForm.tbSqlSintaxis) or (Sender = FOwnerForm.tbCampComprobar));

      //if Sender = tbCampComprobar Then
      //begin
      sdqSintaxis.Fields.GetFieldNames(FOwnerForm.edCampNombre.Items);
      TStringList(FOwnerForm.edCampNombre.Items).Sort;
      //end;
    finally
      sdqSintaxis.Free;
    end;

    MsgBox('La comprobación de sintaxis fue satisfactoria.', MB_ICONINFORMATION);
  except
    on E: Exception do
      ErrorMsg(E, 'Error de Sintaxis');
  end;
end;

procedure TfrmEventosABM.tbEvAbmSintaxisExClick(Sender: TObject);
var
  sdqSql,
  sdqEvento: TSDQuery;
  AParams: TParams;
  AParam: TParam;
  i: Integer;
begin
  try
    sdqSql := TSDQuery.Create(Self);
    try
      if not IsEmptyString(FOwnerForm.mwSql.Lines.Text) then
      begin
        SetDatabaseToQuery(sdqSql);
        CheckSintaxis(sdqSql, True);
      end;

      AParams := TParams.Create(Self);
      try
        { Agrega los Parámetros del Sistema }
        for i := Low(PARAMETROS_ALL) to High(PARAMETROS_ALL) do
        begin
          AParam := TParam.Create(AParams);
          AParam.Name := PARAMETROS_ALL[i];
          AParam.DataType := PARAMETROS_ALL_TIPO[i];
        end;

        if AreIn(ATA_TIPOACCION[cmbEvTipoAccion.ItemIndex], [ATA_WRITE, ATA_ALL]) then
          for i := 0 to sdqSql.Fields.Count - 1 do
          begin
            AParam := TParam.Create(AParams);
            AParam.Name := FIELD_PARAM + sdqSql.Fields[i].FieldName;
            AParam.DataType := sdqSql.Fields[i].DataType;
          end;

        if AreIn(ATA_TIPOACCION[cmbEvTipoAccion.ItemIndex], [ATA_READ, ATA_ALL]) then
          with TDataCycler.Create(FOwnerForm.sdqCampos) do
          try
            repeat
              AParam := TParam.Create(AParams);
              AParam.Name := FIELD_PARAM + FOwnerForm.sdqCampos.FieldByName('AC_NOMBRE').AsString;
              AParam.DataType := ftString;
            until not Cycle;
          finally
            Free;
          end;

        { Agrega los Parámetros de los procesos }
        with GetQueryEx('SELECT DISTINCT PP_CODIGO, PP_TIPO ' +
                          'FROM IPA_PROCESOACCION, IPP_PROCESOPARAMETRO ' +
                         'WHERE PA_TIPOACCION = ''' + TA_FILE + ''' ' +
                           'AND PA_IDPROCESO = PP_IDPROCESO ' +
                           'AND (PA_TIPOARCHIVO = :TipoArchivo OR :TipoArchivo = ''' + ATA_ALL + ''') ' +
                           'AND PA_RELACION = :Relacion ',
                        [ATA_TIPOACCION[cmbEvTipoAccion.ItemIndex],
                         ATA_TIPOACCION[cmbEvTipoAccion.ItemIndex],
                         FOwnerForm.fraPrimaryKey.Value]) do
        try
          First;
          while not EOF do
          begin
            AParam := TParam.Create(AParams);
            AParam.Name := FieldByName('PP_CODIGO').AsString;
            AParam.DataType := TipoDatoToFieldType(FieldByName('PP_TIPO').AsString);

            Next;
          end;
        finally
          Free;
        end;

        sdqEvento := TSDQuery.Create(Self);
        try
          SetDatabaseToQuery(sdqEvento);
          CheckAndOpenQuery(sdqEvento, mwEvSql.Lines.Text, False, AParams);
        finally
          AParams.Free;
        end;
      finally
        sdqEvento.Free;
      end;
    finally
      sdqSql.Free;
    end;

    MsgBox('La comprobación de sintaxis fue satisfactoria.', MB_ICONINFORMATION);

    FormShow(nil);
  except
    on E: Exception do
      ErrorMsg(E, 'Error de Sintaxis');
  end;
end;

procedure TfrmEventosABM.tbEvAgrCampoClick(Sender: TObject);
begin
  tbEvAgrCampo.CheckMenuDropdown;
end;

procedure TfrmEventosABM.pmnuCamposClick(Sender: TObject);
begin
  mwEvSql.SelText := ':' + FIELD_PARAM + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]);
end;

procedure TfrmEventosABM.FormShow(Sender: TObject);
begin
  cmbEvTipoAccionChange(nil);
end;

procedure TfrmEventosABM.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
                                        var Handled: Boolean);
var
  msg: Cardinal;
  code: Cardinal;
  i, n: Integer;
begin
  if WindowFromPoint(mouse.Cursorpos) = mwEvSql.Handle then
  begin
    Handled := True;
    if ssShift in Shift then
      msg := WM_HSCROLL
    else
      msg := WM_VSCROLL;

    if WheelDelta < 0 then
      code := SB_LINEDOWN
    else
      code := SB_LINEUP;

    n:= Mouse.WheelScrollLines;
    for i:= 1 to n do
      mwEvSql.Perform(msg, code, 0);
    mwEvSql.Perform(msg, SB_ENDSCROLL, 0);
  end;
end;

procedure TfrmEventosABM.FormCreate(Sender: TObject);
begin
  FOwnerForm := TfrmManArchivosExp(Self.Owner);

  Height := Trunc(Screen.Height * 0.9);
  Width  := Trunc(Screen.Width  * 0.9);
end;

procedure TfrmEventosABM.mwEvSqlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ShowCursorPos;
end;

procedure TfrmEventosABM.mwEvSqlMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ShowCursorPos;
end;

end.

