unit unFraTipoGestion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, DB, SDEngine, unDmPrincipal, AnsiSql, unClassGestion,
  CustomDlgs, SqlFuncs, DBSql, unSesion, unConstEmision, General;

type

  TfraTipoGestion = class(TFrame)
    gbAccionesDisponibles: TGroupBox;
    lstAccionesDisponibles: TListView;
    btnIncluirAccion: TButton;
    btnIncluirTodasAcciones: TButton;
    btnExcluirAccion: TButton;
    btnExcluirTodasAcciones: TButton;
    gbAccionesATomar: TGroupBox;
    lstAccionesATomar: TListView;
    gbTiposContacto: TGroupBox;
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
    sdqAcciones: TSDQuery;
    dsConsulta: TDataSource;
    procedure btnIncluirTextoTelefonicoClick(Sender: TObject);
    procedure btnIncluirAccionClick(Sender: TObject);
    procedure btnExcluirAccionClick(Sender: TObject);
    procedure btnExcluirTodasAccionesClick(Sender: TObject);
    procedure btnIncluirTodasAccionesClick(Sender: TObject);
    procedure lstAccionesATomarSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure chkContactoTelefonicoClick(Sender: TObject);
    procedure chkContactoViaFaxClick(Sender: TObject);
    procedure chkContactoMailClick(Sender: TObject);
    procedure chkContactoCorreoClick(Sender: TObject);
    procedure chkContactoPersonalClick(Sender: TObject);
  private
    FAutoTransaction: boolean;
    FidGestion: integer;
    procedure GuardarSubacciones(idGestionAccion: integer; aAccion: TGestionAccion);
    procedure SeleccionarCheckBoxs(Item: TListItem);
  public
    destructor Destroy; override;
    procedure Limpiar;
    procedure Init;
    procedure Cargar(AidGestion: integer);
    procedure Guardar(AidGestion: integer);
    function Validar: boolean;
    property AutoTransaction: boolean read FAutoTransaction write FAutoTransaction; //default true
  end;

implementation

uses unFrmTextosPredeterminados;

{$R *.dfm}

procedure TfraTipoGestion.btnIncluirTextoTelefonicoClick(Sender: TObject);
var
  ContactoSeleccionado: string;
begin
  if (lstAccionesATomar.SelCount > 0) then
  begin
    with TfrmTextosPredeterminados.Create(Self) do
    try
        ContactoSeleccionado := Switch(TBitBtn(Sender).Tag, [TIPO_CONTACTO_TELEFONICO, TIPO_CONTACTO_FAX, TIPO_CONTACTO_MAIL, TIPO_CONTACTO_CORREO, TIPO_CONTACTO_PERSONAL]);
        with TGestionAccion(lstAccionesATomar.Selected.Data) do
        begin
          if ExisteContacto(ContactoSeleccionado) then
            CargarTextoTipoGestion(Contacto[ContactoSeleccionado].TipoContacto, Contacto[ContactoSeleccionado].IdTextoReferencia)
          else
            CargarTextoTipoGestion(ContactoSeleccionado);
        end;
        FormStyle := fsNormal;
        ShowModal;
        if (IdTextoReferenciaSeleccionado <> -1) then
        begin
          if not TGestionAccion(lstAccionesATomar.Selected.Data).ExisteContacto(ContactoSeleccionado) then
            TGestionAccion(lstAccionesATomar.Selected.Data).Contactos.Add(TContacto.Create(ContactoSeleccionado, IdTextoReferenciaSeleccionado))
          else
            TGestionAccion(lstAccionesATomar.Selected.Data).Contacto[ContactoSeleccionado].IdTextoReferencia := IdTextoReferenciaSeleccionado;
        end
        else begin
          if TGestionAccion(lstAccionesATomar.Selected.Data).ExisteContacto(ContactoSeleccionado) then
            TGestionAccion(lstAccionesATomar.Selected.Data).EliminarContacto(ContactoSeleccionado);
        end;
        SeleccionarCheckBoxs(lstAccionesATomar.Selected);
    finally
      free;
    end;
  end;
end;

procedure TfraTipoGestion.Cargar(AidGestion: integer);
var
 Query : TSDQuery;
 i: integer;
begin
 FidGestion := AidGestion;
 Query := GetQuery('select GA_IDACCION, GA_ID ' +
                    'from emi.iga_gestionaccion ' +
                    'where ga_idtipogestion = ' + SqlValue(AidGestion));
  try
    if Query.RecordCount > 0 then
    begin
      while not Query.Eof do
      begin
        i:=0;
        while (i<= lstAccionesDisponibles.Items.Count-1) and
              (TGestionAccion(lstAccionesDisponibles.Items[i].Data).IdAccion <> Query.FieldByName('GA_IDACCION').AsInteger) do
          i:= i + 1;
        if (i<= lstAccionesDisponibles.Items.Count-1) then
        begin
          lstAccionesDisponibles.Items[i].Selected := true;
          TGestionAccion(lstAccionesDisponibles.Items[i].Data).IdGestionAccion := Query.FieldByName('GA_ID').AsInteger;
          TGestionAccion(lstAccionesDisponibles.Items[i].Data).CargarContactos;
          lstAccionesDisponibles.MoveSelection(lstAccionesATomar);
        end;
        Query.Next;
      end;
      Query.Close;
    end;
  finally
      Query.Free;
  end;
end;

procedure TfraTipoGestion.Init;
var
  ListItemAccion: TListItem;
begin
  try
    AutoTransaction := True;
    Limpiar;
    lstAccionesDisponibles.SortType := stData;
    lstAccionesATomar.SortType := stData;
    sdqAcciones.Open;
    if sdqAcciones.RecordCount > 0 then
    begin
      while not sdqAcciones.Eof do
      begin
        with lstAccionesDisponibles do
        begin
          ListItemAccion := Items.Add;
          ListItemAccion.Caption := sdqAcciones.fieldbyname('AC_DESCRIPCION').AsString;
          ListItemAccion.Data := TGestionAccion.Create(sdqAcciones.fieldbyname('AC_ID').AsInteger);
        end;
        sdqAcciones.Next;
      end;
    end else raise Exception.Create('No se encontraron Tareas en el Maestro.');
  finally
    sdqAcciones.Close;
  end;
end;

procedure TfraTipoGestion.Limpiar;
begin
  lstAccionesDisponibles.Clear;
  lstAccionesATomar.Clear;
  lstAccionesDisponibles.SortType := stNone;
  lstAccionesATomar.SortType := stNone;
  chkContactoTelefonico.Checked := false;
  chkContactoViaFax.Checked := false;
  chkContactoMail.Checked := false;
  chkContactoCorreo.Checked := false;
  chkContactoPersonal.Checked := false;
end;

procedure TfraTipoGestion.btnIncluirAccionClick(Sender: TObject);
begin
  if lstAccionesDisponibles.SelCount > 0 then
  begin
    lstAccionesATomar.IconOptions.WrapText := false;
    lstAccionesDisponibles.MoveSelection(lstAccionesATomar);
    lstAccionesATomar.IconOptions.WrapText := true;
  end;
end;

procedure TfraTipoGestion.btnExcluirAccionClick(Sender: TObject);
begin
  if lstAccionesATomar.SelCount > 0 then
  begin
    lstAccionesDisponibles.IconOptions.WrapText := false;
    lstAccionesATomar.MoveSelection(lstAccionesDisponibles);
    lstAccionesDisponibles.IconOptions.WrapText := true;
  end;
end;


procedure TfraTipoGestion.btnExcluirTodasAccionesClick(Sender: TObject);
begin
  lstAccionesATomar.SelectAll;
  lstAccionesDisponibles.IconOptions.WrapText := false;
  lstAccionesATomar.MoveSelection(lstAccionesDisponibles);
  lstAccionesDisponibles.IconOptions.WrapText := true;
end;

procedure TfraTipoGestion.btnIncluirTodasAccionesClick(Sender: TObject);
begin
  lstAccionesDisponibles.SelectAll;
  lstAccionesATomar.IconOptions.WrapText := false;
  lstAccionesDisponibles.MoveSelection(lstAccionesATomar);
  lstAccionesATomar.IconOptions.WrapText := true;
end;

procedure TfraTipoGestion.Guardar(AidGestion: integer);
var
  i: integer;
  Sql: TCustomSql;
begin
  Sql := TDBSql.Create;
  try
    try
      if FAutoTransaction then BeginTrans(true);

      EjecutarSqlST('DELETE FROM EMI.IGS_GESTIONSUBACCION WHERE EXISTS ( ' +
                    'SELECT 1 FROM EMI.IGA_GESTIONACCION WHERE GS_IDGESTIONACCION = GA_ID ' +
                    'AND GA_IDTIPOGESTION = ' + SqlValue(AidGestion) + ' )');

      EjecutarSqlST('DELETE FROM EMI.IGA_GESTIONACCION WHERE GA_IDTIPOGESTION = ' + SqlValue(AidGestion));

      Sql.TableName := 'EMI.IGA_GESTIONACCION';
      for i:=0 to lstAccionesATomar.Items.Count - 1 do
      begin
        Sql.Clear;
        Sql.PrimaryKey.Add('GA_ID', GetSecNextVal('emi.seq_iga_id'));
        Sql.Fields.Add('GA_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('GA_FECHAALTA', exDateTime );
        Sql.Fields.Add('GA_IDTIPOGESTION', AidGestion);
        Sql.Fields.Add('GA_IDACCION', TGestionAccion(lstAccionesATomar.Items[i].Data).IdAccion);
        EjecutarSqlST(Sql.InsertSql);
        GuardarSubacciones(Sql.PrimaryKey[0].Value, TGestionAccion(lstAccionesATomar.Items[i].Data));
        if FAutoTransaction then CommitTrans(true);
      end;
    except
      on E: Exception do begin
         if FAutoTransaction then Rollback(true)
         else raise Exception.Create('Error al guardar las acciones.' + #13#10 + E.Message);
         ErrorMsg(E, 'Error al guardar las acciones.');
      end;
    end;
  finally
    Sql.Free;
  end;
end;

procedure TfraTipoGestion.GuardarSubacciones(idGestionAccion: integer; aAccion: TGestionAccion);
var
  Sql: TCustomSql;
begin
  Sql := TDBSql.Create;
  try
    try
      Sql.TableName := 'EMI.IGS_GESTIONSUBACCION';
      if (aAccion.ExisteContacto(TIPO_CONTACTO_TELEFONICO)) then
      begin
        Sql.Clear;
        Sql.PrimaryKey.Add('GS_ID', GetSecNextVal('emi.seq_igs_id'));
        Sql.Fields.Add('GS_IDGESTIONACCION', idGestionAccion);
        Sql.Fields.Add('GS_SUBACCION', TIPO_CONTACTO_TELEFONICO);
        Sql.Fields.Add('GS_IDTEXTOREFERENCIA', aAccion.Contacto[TIPO_CONTACTO_TELEFONICO].IdTextoReferencia);
        EjecutarSqlST(Sql.InsertSql);
      end;

      if (aAccion.ExisteContacto(TIPO_CONTACTO_FAX)) then
      begin
        Sql.Clear;
        Sql.PrimaryKey.Add('GS_ID', GetSecNextVal('emi.seq_igs_id'));
        Sql.Fields.Add('GS_IDGESTIONACCION', idGestionAccion);
        Sql.Fields.Add('GS_SUBACCION', TIPO_CONTACTO_FAX);
        Sql.Fields.Add('GS_IDTEXTOREFERENCIA', aAccion.Contacto[TIPO_CONTACTO_FAX].IdTextoReferencia);
        EjecutarSqlST(Sql.InsertSql);
      end;

      if (aAccion.ExisteContacto(TIPO_CONTACTO_MAIL)) then
      begin
        Sql.Clear;
        Sql.PrimaryKey.Add('GS_ID', GetSecNextVal('emi.seq_igs_id'));
        Sql.Fields.Add('GS_IDGESTIONACCION', idGestionAccion);
        Sql.Fields.Add('GS_SUBACCION', TIPO_CONTACTO_MAIL);
        Sql.Fields.Add('GS_IDTEXTOREFERENCIA', aAccion.Contacto[TIPO_CONTACTO_MAIL].IdTextoReferencia);
        EjecutarSqlST(Sql.InsertSql);
      end;

      if (aAccion.ExisteContacto(TIPO_CONTACTO_CORREO)) then
      begin
        Sql.Clear;
        Sql.PrimaryKey.Add('GS_ID', GetSecNextVal('emi.seq_igs_id'));
        Sql.Fields.Add('GS_IDGESTIONACCION', idGestionAccion);
        Sql.Fields.Add('GS_SUBACCION', TIPO_CONTACTO_CORREO);
        Sql.Fields.Add('GS_IDTEXTOREFERENCIA', aAccion.Contacto[TIPO_CONTACTO_CORREO].IdTextoReferencia);
        EjecutarSqlST(Sql.InsertSql);
      end;

      if (aAccion.ExisteContacto(TIPO_CONTACTO_PERSONAL)) then
      begin
        Sql.Clear;
        Sql.PrimaryKey.Add('GS_ID', GetSecNextVal('emi.seq_igs_id'));
        Sql.Fields.Add('GS_IDGESTIONACCION', idGestionAccion);
        Sql.Fields.Add('GS_SUBACCION', TIPO_CONTACTO_PERSONAL);
        Sql.Fields.Add('GS_IDTEXTOREFERENCIA', aAccion.Contacto[TIPO_CONTACTO_PERSONAL].IdTextoReferencia);
        EjecutarSqlST(Sql.InsertSql);
      end;
    except
      on E: Exception do begin
         raise E.Create('Error al guardar las las subacciones.' + #13#10 + E.Message);
      end;
    end;
  finally
    Sql.Free;
  end;
end;

function TfraTipoGestion.Validar: boolean;
var
  i: integer;
begin
  i:= 0;
  while (i<= lstAccionesATomar.Items.Count-1)
        and (TGestionAccion(lstAccionesATomar.Items[i].Data).Contactos.Count > 0) do
    i:= i + 1;
  if (i<= lstAccionesATomar.Items.Count-1) then
  begin
    InvalidMsg(lstAccionesATomar, 'No deben existir tareas sin textos asociados', 'Error al guardar acciones' ,MB_ICONERROR);
    result := false;
  end
  else result := true;
end;

destructor TfraTipoGestion.Destroy;
var
  i: integer;
begin
  for i:=0 to lstAccionesDisponibles.Items.Count -1 do
    TGestionAccion(lstAccionesDisponibles.Items[i].Data).Free;
  lstAccionesDisponibles.Clear;

  for i:=0 to lstAccionesATomar.Items.Count -1 do
    TGestionAccion(lstAccionesATomar.Items[i].Data).Free;
  lstAccionesATomar.Clear;

  inherited;
end;

procedure TfraTipoGestion.lstAccionesATomarSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  SeleccionarCheckBoxs(Item);
end;

procedure TfraTipoGestion.SeleccionarCheckBoxs(Item: TListItem);
begin
  chkContactoTelefonico.Checked := TGestionAccion(Item.Data).ExisteContacto(TIPO_CONTACTO_TELEFONICO);
  btnIncluirTextoTelefonico.Enabled := chkContactoTelefonico.Checked;

  chkContactoViaFax.Checked := TGestionAccion(Item.Data).ExisteContacto(TIPO_CONTACTO_FAX);
  btnIncluirTextoFax.Enabled := chkContactoViaFax.Checked;

  chkContactoMail.Checked := TGestionAccion(Item.Data).ExisteContacto(TIPO_CONTACTO_MAIL);
  btnIncluirTextoMail.Enabled := chkContactoMail.Checked;

  chkContactoCorreo.Checked := TGestionAccion(Item.Data).ExisteContacto(TIPO_CONTACTO_CORREO);
  btnIncluirTextoCorreo.Enabled := chkContactoCorreo.Checked;

  chkContactoPersonal.Checked := TGestionAccion(Item.Data).ExisteContacto(TIPO_CONTACTO_PERSONAL);
  btnIncluirGestion.Enabled := chkContactoPersonal.Checked;

end;

procedure TfraTipoGestion.chkContactoTelefonicoClick(Sender: TObject);
begin
  btnIncluirTextoTelefonico.Enabled := TCheckBox(Sender).Checked;
  if not btnIncluirTextoTelefonico.Enabled and (lstAccionesATomar.SelCount > 0) then
    TGestionAccion(lstAccionesATomar.Selected.Data).EliminarContacto(TIPO_CONTACTO_TELEFONICO);
end;

procedure TfraTipoGestion.chkContactoViaFaxClick(Sender: TObject);
begin
  btnIncluirTextoFax.Enabled := TCheckBox(Sender).Checked;
  if not btnIncluirTextoFax.Enabled and (lstAccionesATomar.SelCount > 0) then
    TGestionAccion(lstAccionesATomar.Selected.Data).EliminarContacto(TIPO_CONTACTO_FAX);
end;

procedure TfraTipoGestion.chkContactoMailClick(Sender: TObject);
begin
  btnIncluirTextoMail.Enabled := TCheckBox(Sender).Checked;
  if not btnIncluirTextoMail.Enabled and (lstAccionesATomar.SelCount > 0) then
    TGestionAccion(lstAccionesATomar.Selected.Data).EliminarContacto(TIPO_CONTACTO_FAX);
end;

procedure TfraTipoGestion.chkContactoCorreoClick(Sender: TObject);
begin
  btnIncluirTextoCorreo.Enabled := TCheckBox(Sender).Checked;
  if not btnIncluirTextoCorreo.Enabled and (lstAccionesATomar.SelCount > 0) then
    TGestionAccion(lstAccionesATomar.Selected.Data).EliminarContacto(TIPO_CONTACTO_CORREO);
end;

procedure TfraTipoGestion.chkContactoPersonalClick(Sender: TObject);
begin
  btnIncluirGestion.Enabled := TCheckBox(Sender).Checked;
  if not btnIncluirGestion.Enabled and (lstAccionesATomar.SelCount > 0) then
    TGestionAccion(lstAccionesATomar.Selected.Data).EliminarContacto(TIPO_CONTACTO_PERSONAL);
end;

end.
