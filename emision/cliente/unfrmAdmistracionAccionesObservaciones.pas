unit unfrmAdmistracionAccionesObservaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, DB, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, SDEngine,
  StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, Buttons, unArtFrame, unFrmTextosPredeterminados, 
  unFraCodigoDescripcion, unfraCodigoDescripcionExt, unConstEmision,
  General, unDmPrincipal, AnsiSql, CustomDlgs, unSesion, SqlFuncs,
  unArtDBAwareFrame, (*unClassGestion,*) unObjEmision;

type

  TfrmAdministracionAccionesObservaciones = class(TfrmCustomGridABM)
    gbSubAcciones: TGroupBox;
    chkContactoTelefonico: TCheckBox;
    chkContactoViaFax: TCheckBox;
    chkContactoMail: TCheckBox;
    chkContactoCorreo: TCheckBox;
    chkContactoPersonal: TCheckBox;
    btnIncluirTextoTelefonico: TBitBtn;
    btnIncluirTextoFax: TBitBtn;
    btnIncluirTextoMail: TBitBtn;
    btnIncluirTextoCorreo: TBitBtn;
    btnIncluirGestion: TBitBtn;
    FraObservaciones: TfraCodigoDescripcionExt;
    lblObservarComoVariables: TLabel;
    Label1: TLabel;
    fraAccion: TfraCodigoDescripcionExt;
    procedure FormCreate(Sender: TObject);
    procedure chkContactoTelefonicoClick(Sender: TObject);
    procedure chkContactoViaFaxClick(Sender: TObject);
    procedure chkContactoMailClick(Sender: TObject);
    procedure chkContactoCorreoClick(Sender: TObject);
    procedure chkContactoPersonalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirTextoTelefonicoClick(Sender: TObject);
  private
    lstSubaccion: TList;
    procedure SeleccionarCheckBoxs;
    procedure CargarSubacciones;
    procedure LimpiarLista;
    function ValidarSubacciones: boolean;
    procedure GuardarSubacciones(AIdObservacionAccion: integer);
  public
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

implementation

uses unDmEmision, unCustomConsulta;

{$R *.dfm}

procedure TfrmAdministracionAccionesObservaciones.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'OA_FECHABAJA';
  Sql.TableName := 'EMI.IOA_OBSERVACIONACCION';
  CheckPK := True;

  with FraObservaciones do
  begin
    TableName := 'EMI.IOB_OBSERVACION';
    FieldID   := 'OB_ID';
    FieldCodigo := 'OB_ID';
    FieldDesc := 'OB_DESCRIPCION';
    FieldBaja := 'OB_FECHABAJA';
  end;

  with fraAccion do
  begin
    TableName := 'EMI.IAC_ACCION';
    FieldID   := 'AC_ID';
    FieldCodigo := 'AC_ID';
    FieldDesc := 'AC_DESCRIPCION';
  end;

  lstSubaccion:= TList.Create;
  lstSubaccion.Add(TContacto.Create(TIPO_CONTACTO_TELEFONICO, -1));
  lstSubaccion.Add(TContacto.Create(TIPO_CONTACTO_FAX, -1));
  lstSubaccion.Add(TContacto.Create(TIPO_CONTACTO_MAIL, -1));
  lstSubaccion.Add(TContacto.Create(TIPO_CONTACTO_CORREO, -1));
  lstSubaccion.Add(TContacto.Create(TIPO_CONTACTO_PERSONAL, -1));

end;

procedure TfrmAdministracionAccionesObservaciones.chkContactoTelefonicoClick(
  Sender: TObject);
begin
  btnIncluirTextoTelefonico.Enabled := TCheckBox(Sender).Checked;
  if not btnIncluirTextoTelefonico.Enabled then
    TContacto(lstSubaccion.Items[btnIncluirTextoTelefonico.Tag]).IdTextoReferencia := -1;
end;

procedure TfrmAdministracionAccionesObservaciones.chkContactoViaFaxClick(
  Sender: TObject);
begin
  btnIncluirTextoFax.Enabled := TCheckBox(Sender).Checked;
  if not btnIncluirTextoFax.Enabled then
    TContacto(lstSubaccion.Items[btnIncluirTextoFax.Tag]).IdTextoReferencia := -1;
end;

procedure TfrmAdministracionAccionesObservaciones.chkContactoMailClick(
  Sender: TObject);
begin
  btnIncluirTextoMail.Enabled := TCheckBox(Sender).Checked;
  if not btnIncluirTextoMail.Enabled then
    TContacto(lstSubaccion.Items[btnIncluirTextoMail.Tag]).IdTextoReferencia := -1;
end;

procedure TfrmAdministracionAccionesObservaciones.chkContactoCorreoClick(
  Sender: TObject);
begin
  btnIncluirTextoCorreo.Enabled := TCheckBox(Sender).Checked;
  if not btnIncluirTextoCorreo.Enabled then
    TContacto(lstSubaccion.Items[btnIncluirTextoCorreo.Tag]).IdTextoReferencia := -1;
end;

procedure TfrmAdministracionAccionesObservaciones.chkContactoPersonalClick(
  Sender: TObject);
begin
  btnIncluirGestion.Enabled := TCheckBox(Sender).Checked;
  if not btnIncluirGestion.Enabled then
    TContacto(lstSubaccion.Items[btnIncluirGestion.Tag]).IdTextoReferencia := -1;
end;

procedure TfrmAdministracionAccionesObservaciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i: integer;
begin
  for i:= 0 to lstSubaccion.Count - 1 do
    TContacto(lstSubaccion.Items[i]).Free;

  lstSubaccion.Clear;
  inherited;
end;

procedure TfrmAdministracionAccionesObservaciones.btnIncluirTextoTelefonicoClick(
  Sender: TObject);
var
  ContactoSeleccionado: string;
begin
  with TfrmTextosPredeterminados.Create(Self) do
  begin
    try
      ContactoSeleccionado := Switch(TBitBtn(Sender).Tag, [TIPO_CONTACTO_TELEFONICO, TIPO_CONTACTO_FAX, TIPO_CONTACTO_MAIL, TIPO_CONTACTO_CORREO, TIPO_CONTACTO_PERSONAL]);
      CargarTextoTipoGestion(ContactoSeleccionado, TContacto(lstSubaccion.Items[TBitBtn(Sender).Tag]).IdTextoReferencia);

      FormStyle := fsNormal;
      ShowModal;

      TContacto(lstSubaccion.Items[TBitBtn(Sender).Tag]).IdTextoReferencia := IdTextoReferenciaSeleccionado;
      SeleccionarCheckBoxs;
    finally
      free;
    end;
  end;
end;

procedure TfrmAdministracionAccionesObservaciones.SeleccionarCheckBoxs;
begin
  chkContactoTelefonico.Checked := TContacto(lstSubaccion.Items[0]).IdTextoReferencia <> -1;
  btnIncluirTextoTelefonico.Enabled := chkContactoTelefonico.Checked;

  chkContactoViaFax.Checked := TContacto(lstSubaccion.Items[1]).IdTextoReferencia <> -1;
  btnIncluirTextoFax.Enabled := chkContactoViaFax.Checked;

  chkContactoMail.Checked := TContacto(lstSubaccion.Items[2]).IdTextoReferencia <> -1;
  btnIncluirTextoMail.Enabled := chkContactoMail.Checked;

  chkContactoCorreo.Checked := TContacto(lstSubaccion.Items[3]).IdTextoReferencia <> -1;
  btnIncluirTextoCorreo.Enabled := chkContactoCorreo.Checked;

  chkContactoPersonal.Checked := TContacto(lstSubaccion.Items[4]).IdTextoReferencia <> -1;
  btnIncluirGestion.Enabled := chkContactoPersonal.Checked;

end;


procedure TfrmAdministracionAccionesObservaciones.ClearControls;
begin
  LimpiarLista;
  SeleccionarCheckBoxs;
end;

function TfrmAdministracionAccionesObservaciones.DoABM: Boolean;
begin
  try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('OA_ID', sdqConsulta.FieldByName('OA_ID').AsInteger );
      Sql.Fields.Add('OA_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('OA_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('OA_IDOBSERVACION', FraObservaciones.Codigo);
      Sql.Fields.Add('OA_IDACCION', fraAccion.Codigo);
      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('OA_ID', GetSecNextVal('emi.seq_ioa_id'));
        Sql.Fields.Add('OA_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('OA_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('OA_ID', sdqConsulta.FieldByName('OA_ID').AsInteger);
        Sql.Fields.Add('OA_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('OA_FECHAMODIF', exDateTime );
        Sql.Fields.Add('OA_USUBAJA', exNull );
        Sql.Fields.Add('OA_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    GuardarSubacciones(Sql.PrimaryKey[0].Value);
    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar la observación.');
    end;
  end;
end;

procedure TfrmAdministracionAccionesObservaciones.LoadControls;
begin
  inherited;
  FraObservaciones.Codigo := sdqConsulta.fieldbyname('OA_IDOBSERVACION').AsString;
  fraAccion.Codigo := sdqConsulta.fieldbyname('OA_IDACCION').AsString;
  LimpiarLista;
  CargarSubacciones;
  SeleccionarCheckBoxs;
end;

function TfrmAdministracionAccionesObservaciones.Validar: Boolean;
begin
    Result := VerificarMultiple(['Administración de Observaciones',
                                  FraObservaciones, FraObservaciones.IsSelected , 'Debe especificar la observación.',
                                  fraAccion, fraAccion.IsSelected , 'Debe especificar la acción.',
                                  gbSubAcciones, ValidarSubacciones , 'Debe especificar alguna subacción.'
                                ]);

end;

procedure TfrmAdministracionAccionesObservaciones.CargarSubacciones;
var
 Query : TSDQuery;
begin
  Query := GetQuery('select OS_IDTEXTOREFERENCIA, OS_SUBACCION ' +
                    'from emi.ios_observacionsubaccion ' +
                    'where os_idobservacionaccion = ' + SqlValue(sdqConsulta.fieldbyname('oa_id').AsInteger));
  try
    if Query.RecordCount > 0 then
    begin
      while not Query.Eof do
      begin
        if Query.FieldByName('OS_SUBACCION').AsString = TIPO_CONTACTO_TELEFONICO then
          TContacto(lstSubaccion.Items[0]).IdTextoReferencia :=  Query.FieldByName('OS_IDTEXTOREFERENCIA').AsInteger;

        if Query.FieldByName('OS_SUBACCION').AsString = TIPO_CONTACTO_FAX then
          TContacto(lstSubaccion.Items[1]).IdTextoReferencia :=  Query.FieldByName('OS_IDTEXTOREFERENCIA').AsInteger;

        if Query.FieldByName('OS_SUBACCION').AsString = TIPO_CONTACTO_MAIL then
          TContacto(lstSubaccion.Items[2]).IdTextoReferencia :=  Query.FieldByName('OS_IDTEXTOREFERENCIA').AsInteger;

        if Query.FieldByName('OS_SUBACCION').AsString = TIPO_CONTACTO_CORREO then
          TContacto(lstSubaccion.Items[3]).IdTextoReferencia :=  Query.FieldByName('OS_IDTEXTOREFERENCIA').AsInteger;

        if Query.FieldByName('OS_SUBACCION').AsString = TIPO_CONTACTO_PERSONAL then
          TContacto(lstSubaccion.Items[4]).IdTextoReferencia :=  Query.FieldByName('OS_IDTEXTOREFERENCIA').AsInteger;

        Query.Next;
      end;
      Query.Close;
    end;
  finally
      Query.Free;
  end;
end;

procedure TfrmAdministracionAccionesObservaciones.LimpiarLista;
var
  i: integer;
begin
  for i:= 0 to lstSubaccion.Count-1 do
    TContacto(lstSubaccion.Items[i]).IdTextoReferencia := -1;
end;

function TfrmAdministracionAccionesObservaciones.ValidarSubacciones: boolean;
var
  i: integer;
begin
  i:= 0;
  while (i <= lstSubaccion.Count - 1) and (TContacto(lstSubaccion.Items[i]).IdTextoReferencia = -1) do
    i:= i + 1;
  result := i <= lstSubaccion.Count - 1;
end;

procedure TfrmAdministracionAccionesObservaciones.GuardarSubacciones(
  AIdObservacionAccion: integer);
var
  i: integer;
begin
  EjecutarSqlST('DELETE FROM EMI.IOS_OBSERVACIONSUBACCION WHERE OS_IDOBSERVACIONACCION =' + SqlValue(AIdObservacionAccion));
  for i:= 0 to lstSubaccion.Count-1 do
    if TContacto(lstSubaccion.Items[i]).IdTextoReferencia <> -1 then
      EjecutarSqlST('INSERT INTO EMI.IOS_OBSERVACIONSUBACCION(OS_ID, OS_IDOBSERVACIONACCION, OS_IDTEXTOREFERENCIA, OS_SUBACCION) ' +
                    'VALUES (emi.seq_ios_id.nextval, ' + SqlValue(AIdObservacionAccion) + ',' +
                    SqlValue(TContacto(lstSubaccion.Items[i]).IdTextoReferencia) + ',' +
                    SqlValue(TContacto(lstSubaccion.Items[i]).TipoContacto) + ')');
end;

end.
