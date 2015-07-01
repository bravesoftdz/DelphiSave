unit unABMTelefonos;

{
 INFORMACIÓN DE LA UNIDAD
 AUTOR:               ÁLVARO LAPACÓ
 FECHA DE CREACIÓN:   07-11-05
 DETALLE: Formulario utilizado por unFraTelefono.pas para hacer el ABM de teléfonos.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArt, artSeguridad, QueryPrint, ShortCutControl, Db, SDEngine, unArtFrame, StdCtrls,
  ComCtrls, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ToolWin, Mask, PatternEdit, ComboEditor, ComboGrid, unFraCodigoDescripcion, unFraCodDesc,
  unArtDBAwareFrame;

const
  CAPTION_BASE = 'Teléfonos';

type
  TfrmTelefonos = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tlbGuardar: TToolButton;
    tlbBaja: TToolButton;
    tlbSalir: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    ArtDBGrid: TArtDBGrid;
    sdqDatos: TSDQuery;
    sdDatos: TDataSource;
    ShortCutControl: TShortCutControl;
    StatusBar: TStatusBar;
    grbContacto: TGroupBox;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    Seguridad: TSeguridad;
    lbTipoTelefono: TLabel;
    lbObservacion: TLabel;
    edObservacion: TEdit;
    lbArea: TLabel;
    lbInterno: TLabel;
    lbNumero: TLabel;
    lbPrincipal: TLabel;
    checkPrincipal: TCheckBox;
    fraTipoTelefono: TfraCodDesc;
    edArea: TPatternEdit;
    edNumero: TPatternEdit;
    edInterno: TPatternEdit;
    chkConfirmado: TCheckBox;
    Label1: TLabel;
    procedure ArtDBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ArtDBGridCellClick(Column: TColumn);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
    procedure fraTipoTelefonoExit(Sender: TObject);
    procedure edAreaExit(Sender: TObject);
  private
    FAllowBaja: Boolean;
    FFuncion: TFuncionShowForm;
    FIdTablaPrincipal: Integer;
    FCodigoDeAreaObligatorio : Boolean;
    FMascaraCelular : Boolean;
    FNumeroLongitudMaxima : Boolean;
    FNumeroEvitarComienzaCero : Boolean;
    FCodigoLongitudesMaximas : Boolean;
    FCodigoComienzaConCero : Boolean;
    FCodigoEvitarDobleCero : Boolean;

    function IsValidar: Boolean;

    procedure Clear;
    procedure DoGuardarTelefono;
    procedure SeleccionarTelefono;
    procedure SetFuncion(F: TFuncionShowForm);

    property Funcion: TFuncionShowForm read FFuncion write SetFuncion;
  public
    procedure DoCargarDatos(const aCampoClave: String; const aId: Integer; const aTabla, aTipo: String);

    property CodigoDeAreaObligatorio: boolean read FCodigoDeAreaObligatorio write FCodigoDeAreaObligatorio;
    property MascaraCelular: boolean read FMascaraCelular write FMascaraCelular;
    property NumeroLongitudMaxima: boolean read FNumeroLongitudMaxima write FNumeroLongitudMaxima;
    property NumeroEvitarComienzaCero: boolean read FNumeroEvitarComienzaCero write FNumeroEvitarComienzaCero;
    property CodigoLongitudesMaximas: boolean read FCodigoLongitudesMaximas write FCodigoLongitudesMaximas;
    property CodigoComienzaConCero: boolean read FCodigoComienzaConCero write FCodigoComienzaConCero;
    property CodigoEvitarDobleCero: boolean read FCodigoEvitarDobleCero write FCodigoEvitarDobleCero;
  end;

var
  frmTelefonos: TfrmTelefonos;

implementation

uses
  {$IFDEF CUSTOM_PRINCIPAL}unCustomPrincipal,{$ENDIF} AnsiSQL, CustomDlgs, General, SqlFuncs, unDmPrincipal,
  unFraTelefono, {$IFDEF CAS}unMenu,{$ENDIF} unPrincipal, unSesion, StrFuncs;

{$R *.DFM}

procedure TfrmTelefonos.SetFuncion(F: TFuncionShowForm);
begin
// Condifura el formulario de acuerdo a la acción a llevar a cabo..

  FFuncion := F;
  case F of
    fsNone:
    begin
      Caption := CAPTION_BASE;
      tlbBaja.Enabled := False;
    end;
    fsAgregar:
    begin
      Caption := CAPTION_BASE + ' [ALTA]';
      tlbBaja.Enabled := False;
    end;
    fsModificar:
    begin
      Caption := CAPTION_BASE + ' [MODIFICACION]';
      tlbBaja.Enabled := FAllowBaja;
    end;
  end;
end;


function TfrmTelefonos.IsValidar: Boolean;
var
  iLongitud : Integer;
begin
// Valida el formulario..

  Verificar(fraTipoTelefono.IsEmpty, fraTipoTelefono.cmbDescripcion, 'El campo Tipo de Teléfono es obligatorio.');
  Verificar(edNumero.Text = '', edNumero, 'El campo Número de Teléfono es obligatorio.');

  //Validaciones Opcionales Segun mail de Paula del jueves 30/01/2014 11:58 a.m reenviado por EVila

  if FCodigoDeAreaObligatorio then
    Verificar(edArea.Text = '', edArea, 'El Código de Área es obligatorio.');

  if FCodigoLongitudesMaximas then
  begin
    Verificar(Length(edArea.Text)< 3, edArea, 'La longitud mínima del código de área es de 3 dígitos');
    Verificar(Length(edArea.Text)> 5, edArea, 'La longitud máxima del código de área es de 5 dígitos'); //por las dudas que algun dia
  end;                                                                                                  //saquen la prop maxlength

  if FCodigoComienzaConCero then
    Verificar(edArea.Text[1] <> '0', edArea, 'El código de área debe comenzar con 0.');

  if FCodigoEvitarDobleCero then
    Verificar((edArea.Text[1] = '0') and (edArea.Text[2] = '0'), edArea, 'El código de área no puede comenzar con 00');
  //
  if FNumeroEvitarComienzaCero then
    Verificar(edNumero.Text[1] = '0', edNumero, 'El número no puede comenzar con 0.');

  if (FMascaraCelular) and (fraTipoTelefono.edCodigo.Text = '3') then
    Verificar((edNumero.Text[1] <> '1') and (edNumero.Text[2] <> '5'), edNumero, 'El número es un celular y debe comenzar con 15');

  if (FNumeroLongitudMaxima) and not (fraTipoTelefono.IsEmpty) then
  begin
    iLongitud := 8;
    if fraTipoTelefono.edCodigo.Text = '3' then
      iLongitud := iLongitud + 2;

    Verificar(Length(edNumero.Text) > iLongitud, edNumero, 'La longitud máxima del teléfono es de ' + IntToStr(iLongitud));
  end;
  //**

  Result := True;
end;


procedure TfrmTelefonos.Clear;
begin
// Limpia los campos del formulario..

  fraTipoTelefono.Clear;
  edArea.Clear;
  edNumero.Clear;
  edInterno.Clear;
  checkPrincipal.Checked := False;
  chkConfirmado.Checked  := False;
  edObservacion.Clear;

  fraTipoTelefono.edCodigo.SetFocus;
end;

procedure TfrmTelefonos.DoCargarDatos(const aCampoClave: String; const aId: Integer; const aTabla, aTipo: String);
begin
// Muestra los datos en la grilla..

  Funcion := fsAgregar;
  FIdTablaPrincipal := aId;

  // Le pongo el nombre a los Fields de la Grilla..
  ArtDBGrid.Columns[0].FieldName := 'tt_descripcion';
  ArtDBGrid.Columns[1].FieldName := 'mp_area';
  ArtDBGrid.Columns[2].FieldName := 'mp_numero';
  ArtDBGrid.Columns[3].FieldName := 'mp_interno';
  ArtDBGrid.Columns[4].FieldName := 'mp_observacion';
  ArtDBGrid.Columns[5].FieldName := 'confirma';

  // Armo y ejecuto el query que llena la grilla..
  sdqDatos.SQL.Text :=
    'SELECT att.* ,tel.*, DECODE(mp_confirmado, ''S'', ''Sí'', ''No'') confirma' +
     ' FROM tmp.tmp_telefonos tel, att_tipotelefono att' +
    ' WHERE mp_idtipotelefono = tt_id' +
      ' AND mp_usuarioid = :usuarioid' +
      ' AND mp_tablatel = :tablatel' +
      ' AND mp_tablapadreid = :tablapadreid' +
      ' AND mp_tipo = :tipo' +
      ' AND mp_estado <> ''B''';

  OpenQueryEx(sdqDatos, [Sesion.ID, aTabla, aId, aTipo]);
end;

procedure TfrmTelefonos.DoGuardarTelefono;
var
  iTelefonoId: Integer;
  sEstado: String;
  sSqlTrans: TSql;
begin
// Guarda los datos en la tabla temporal de teléfonos..

  iTelefonoId := 0;

  sSqlTrans := TSql.Create('tmp.tmp_telefonos');
  try
    case Funcion of
      fsAgregar:
      begin
        sEstado := 'A';
        sSqlTrans.PrimaryKey.Add('mp_id', 1, False);
        sSqlTrans.SqlType := stInsert;
      end;
      fsModificar:
      begin
        iTelefonoId := sdqDatos.FieldByName('mp_registrotelid').AsInteger;
        sEstado := 'M';
        sSqlTrans.PrimaryKey.Add('mp_id', sdqDatos.FieldByName('mp_id').AsString, False);
        sSqlTrans.SqlType := stUpdate;
      end;
    end;

    sSqlTrans.Fields.Add('mp_usuarioid', 			Sesion.ID);
    sSqlTrans.Fields.Add('mp_tablatel', 			TfraTelefono(Self.Owner).Tabla);
    sSqlTrans.Fields.Add('mp_registrotelid', 	iTelefonoId);
    sSqlTrans.Fields.Add('mp_tablapadreid', 	TfraTelefono(Self.Owner).Id);
    sSqlTrans.Fields.Add('mp_tipo', 					TfraTelefono(Self.Owner).Tipo);
    sSqlTrans.Fields.Add('mp_idtipotelefono', fraTipoTelefono.Value);
    sSqlTrans.Fields.Add('mp_area', 					edArea.Text);
    sSqlTrans.Fields.Add('mp_numero', 				StringReplace(edNumero.Text, '-', '', [rfReplaceAll]));
    sSqlTrans.Fields.Add('mp_interno', 				edInterno.Text);
    sSqlTrans.Fields.Add('mp_principal', 			String(IIF(checkPrincipal.Checked, 'S', 'N')));

    sSqlTrans.Fields.Add('mp_confirmado', 		String(IIF(chkConfirmado.Checked, 'S', 'N')));

    sSqlTrans.Fields.Add('mp_observacion', 		edObservacion.Text);
    sSqlTrans.Fields.Add('mp_estado', 				sEstado);

    try
      if TfraTelefono(Self.Owner).AutoCommit then
        EjecutarSql(sSqlTrans.Sql)
      else
        EjecutarSqlST(sSqlTrans.Sql);

      if checkPrincipal.Checked  then
      begin
        if TfraTelefono(Self.Owner).AutoCommit then
          EjecutarSqlEx(
            'UPDATE tmp.tmp_telefonos' +
              ' SET mp_principal = ''N''' +
            ' WHERE mp_usuarioid = :usuarioid' +
              ' AND mp_tablatel = :tablatel' +
              ' AND mp_tablapadreid = :tablapadre' +
              ' AND mp_tipo = :tipo' +
              ' AND mp_id <> :id',
            [Sesion.ID, TfraTelefono(Self.Owner).Tabla, TfraTelefono(Self.Owner).Id, TfraTelefono(Self.Owner).Tipo,
             sdqDatos.FieldByName('mp_id').AsInteger])
        else
          EjecutarSqlSTEx(
            'UPDATE tmp.tmp_telefonos' +
              ' SET mp_principal = ''N''' +
            ' WHERE mp_usuarioid = :usuarioid' +
              ' AND mp_tablatel = :tablatel' +
              ' AND mp_tablapadreid = :tablapadre' +
              ' AND mp_tipo = :tipo' +
              ' AND mp_id <> :id',
            [Sesion.ID, TfraTelefono(Self.Owner).Tabla, TfraTelefono(Self.Owner).Id, TfraTelefono(Self.Owner).Tipo,
             sdqDatos.FieldByName('mp_id').AsInteger])
      end;

      if (TfraTelefono(Self.Owner).Id > 0) and (TfraTelefono(Self.Owner).AutoCommit) then
        TfraTelefono(Self.Owner).CopiarTempATelefonos(TfraTelefono(Self.Owner).Id);

      sdqDatos.Close;
      OpenQuery(sdqDatos);

      TfraTelefono(Self.Owner).HasChanges := True;
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
  finally
    sSqlTrans.Free;
  end;
end;

procedure TfrmTelefonos.SeleccionarTelefono;
begin
// Muestra los datos de un teléfono en el panel de abajo..

  Funcion := fsModificar;

  fraTipoTelefono.Value := sdqDatos.FieldByName('tt_id').AsVariant;
  edArea.Text           := sdqDatos.FieldByName('mp_area').AsString;
  edNumero.Text         := TfraTelefono(Self.Owner).FormatearNumero(sdqDatos.FieldByName('mp_numero').AsString);

  if sdqDatos.FieldByName('mp_interno').AsString = '0' then
    edInterno.Clear
  else
    edInterno.Text := sdqDatos.FieldByName('mp_interno').AsString;

  checkPrincipal.Checked := (sdqDatos.FieldByName('mp_principal').AsString = 'S');
  chkConfirmado.Checked  := (sdqDatos.FieldByName('mp_confirmado').AsString = 'S');
  edObservacion.Text     := sdqDatos.FieldByName('mp_observacion').AsString;
end;

procedure TfrmTelefonos.ArtDBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  aNumero: String;
begin
  if DataCol = 2 then   // Si es la columna número del teléfono..
  begin
    aNumero := TfraTelefono(Self.Owner).FormatearNumero(Column.Field.DisplayText);
    TArtDBGrid(Sender).Canvas.TextRect(Rect, Rect.Right - Canvas.TextWidth(aNumero) - 2, Rect.Top + 2, aNumero);
  end;

  if DataCol = 3 then   // Si es la columna del interno..
  begin
    if Column.Field.DisplayText = '0' then
      TArtDBGrid(Sender).Canvas.TextRect(Rect, Rect.Left, Rect.Top + 2, '');
  end;
end;

procedure TfrmTelefonos.ArtDBGridCellClick(Column: TColumn);
begin
  SeleccionarTelefono;
end;

procedure TfrmTelefonos.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  SeleccionarTelefono;
end;

procedure TfrmTelefonos.tlbNuevoClick(Sender: TObject);
begin
  Funcion := fsAgregar;

  Clear;
end;

procedure TfrmTelefonos.tlbGuardarClick(Sender: TObject);
begin
  if IsValidar then
    DoGuardarTelefono;
end;

procedure TfrmTelefonos.FormCreate(Sender: TObject);
begin
  {$IFDEF CAS}
  frmPrincipal := frmMenu;

  tlbNuevo.Enabled   := frmPrincipal.Seguridad.Claves.IsActive('Afi_Telefonos_Alta');
  tlbGuardar.Enabled := frmPrincipal.Seguridad.Claves.IsActive('Afi_Telefonos_Modificar');
  FAllowBaja         := frmPrincipal.Seguridad.Claves.IsActive('Afi_Telefonos_Eliminar');
  {$ELSE}
  FAllowBaja := True; { Mantengo la variable, porque habría que ponerle algún control al de afi }
  {$ENDIF}
  tlbControl.HotImages := frmPrincipal.ilColor;
  tlbControl.Images    := frmPrincipal.ilByN;

  Seguridad.DBLogin    := frmPrincipal.DBLogin;
  Seguridad.Ejecutar;
end;

procedure TfrmTelefonos.FormDestroy(Sender: TObject);
begin
  sdqDatos.Close;
end;

procedure TfrmTelefonos.tlbBajaClick(Sender: TObject);
var
  sSqlTrans: TSql;
begin
  if Funcion = fsModificar then   // Este es el único caso en el que hay contacto seleccionado..
    if not sdqDatos.IsEmpty then
      if MsgBox('¿ Realmente desea borrar este registro ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
      begin
        sSqlTrans := TSql.Create('tmp.tmp_telefonos');
        try
          sSqlTrans.PrimaryKey.Add('mp_id', sdqDatos.FieldByName('mp_id').AsInteger, False);
          sSqlTrans.SqlType := stUpdate;
          sSqlTrans.Fields.Add('mp_estado', 'B');

          try
            if TfraTelefono(Self.Owner).AutoCommit then
              EjecutarSql(sSqlTrans.Sql)
            else
              EjecutarSqlST(sSqlTrans.Sql);

            if (TfraTelefono(Self.Owner).Id > 0) and (TfraTelefono(Self.Owner).AutoCommit) then
              TfraTelefono(Self.Owner).CopiarTempATelefonos(TfraTelefono(Self.Owner).Id);

            MsgBox('La operación se realizó de manera exitosa.', MB_ICONEXCLAMATION, 'Atención');
            sdqDatos.Close;
            OpenQuery(sdqDatos);
            TfraTelefono(Self.Owner).HasChanges := True;

            if sdqDatos.RecordCount = 0 then
            begin
              Funcion := fsAgregar;
              Clear;
            end;
          except
            on E: Exception do
              ErrorMsg(E, 'Error al guardar los datos.');
          end;
        finally
          sSqlTrans.Free;
        end;
      end;
end;

procedure TfrmTelefonos.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelefonos.fraTipoTelefonoExit(Sender: TObject);
begin
  fraTipoTelefono.FrameExit(Sender);
  if FMascaraCelular then
  begin
    if fraTipoTelefono.Codigo = '3' then
    begin
      if edNumero.Text = '' then
        edNumero.Text := '15'
    end
    else
      if edNumero.Text = '15' then
        edNumero.Text := '';
  end;
end;

procedure TfrmTelefonos.edAreaExit(Sender: TObject);
begin
  if edArea.Enabled and (not edArea.ReadOnly) and (Length(edArea.Text) in [1..3]) then
    edArea.Text := LPad(edArea.Text, '0', 3);  
end;

end.
