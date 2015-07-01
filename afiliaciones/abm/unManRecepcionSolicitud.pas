unit unManRecepcionSolicitud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario, Mask, ToolEdit, DateComboBox;

type
  TfrmManRecepcionSolicitud = class(TfrmCustomGridABM)
    Label2: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    Label1: TLabel;
    fraUsuarioAsignado: TfraUsuarios;
    Label3: TLabel;
    chkPrioridad: TCheckBox;
    chkAltaLicencia: TCheckBox;
    chkAlinear: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure edMailKeyPress(Sender: TObject; var Key: Char);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure LoadSQLString;
  private
    function GetCantidadMasBaja(const aUser: String): Integer;
  public
  end;

var
  frmManRecepcionSolicitud: TfrmManRecepcionSolicitud;

implementation

uses
  unPrincipal, sqlFuncs, General, CustomDlgs, unDmPrincipal;

{$R *.dfm}

{ TfrmManRecepcionSolicitud }

procedure TfrmManRecepcionSolicitud.ClearControls;
begin
  inherited;

  fraUsuarioAsignado.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  chkAlinear.Checked := False;
  chkPrioridad.Checked := False;
end;

function TfrmManRecepcionSolicitud.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('sr_id', sdqConsulta.FieldByName('sr_id').AsInteger);
   // Sql.Fields.Add('sr_fechabaja', exDateTime);
   // Sql.Fields.Add('cf_usubaja',   frmPrincipal.DBLogin.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    Validar;
    if ModoABM = maAlta then
    begin
     // Sql.PrimaryKey.AddExpression('cf_id', 'ART.SEQ_ADF_DOCUMENTACIONFALTA.NEXTVAL');
      Sql.Fields.Add('sr_fechaalta', exDateTime);
      Sql.Fields.Add('sr_usualta',   frmPrincipal.DBLogin.UserID);
      if not chkAlinear.Checked then
        Sql.Fields.Add('sr_cantidad', 0);
      Sql.SqlType := stInsert;
    end
    else
    begin { maModificacion }
      Sql.PrimaryKey.Add('sr_id',     sdqConsulta.FieldByName('sr_id').AsInteger);
      Sql.Fields.Add('sr_fechamodif', exDateTime);
      Sql.Fields.Add('sr_usumodif',   frmPrincipal.DBLogin.UserID);
      Sql.SqlType := stUpdate;
    end;

    if chkAlinear.Checked then
      Sql.Fields.Add('sr_cantidad', GetCantidadMasBaja(fraUsuarioAsignado.Value));   //establecer cantidad

    Sql.Fields.Add('sr_usuario', fraUsuarioAsignado.Value);
    if chkAltaLicencia.Checked then
      Sql.Fields.Add('sr_prioridad', 2) //Se habilita cuando se quiere dar de alta una licencia.
    else
      if chkPrioridad.Checked then
        Sql.Fields.Add('sr_prioridad', 1) //Se habilita cuando el operador, desde la pantalla mantenimiento, indica la prioridad.
      else
        Sql.Fields.Add('sr_prioridad', 0); //Se habilita para que el resultado del usuario asignado, salga del query SELECT MIN

    if not edFechaDesde.IsEmpty then
      Sql.Fields.Add('sr_periodoalta', edFechaHasta.Date)
    else
      Sql.Fields.Add('sr_periodoalta', exNull);

    if not edFechaHasta.IsEmpty then
      Sql.Fields.Add('sr_periodobaja', edFechaDesde.Date)
    else
      Sql.Fields.Add('sr_periodobaja', exNull);

  end;

  Result := inherited DoABM;
end;

procedure TfrmManRecepcionSolicitud.LoadControls;
begin
  inherited;

  with sdqConsulta do
  begin
    fraUsuarioAsignado.Value := FieldByName('sr_usuario').AsString;
    edFechaHasta.Date        := FieldByName('sr_periodoalta').AsDateTime;
    edFechaDesde.Date        := FieldByName('sr_periodobaja').AsDateTime;
    chkPrioridad.Checked     := FieldByName('sr_prioridad').AsInteger = 1;
    chkAlinear.Checked       := False;
  end;
end;

procedure TfrmManRecepcionSolicitud.LoadSQLString;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT sr_id, sr_usuario, sr_periodoalta, sr_periodobaja, sr_cantidad, sr_usualta, sr_fechaalta, sr_usumodif, sr_fechamodif, sr_prioridad,' +
          ' DECODE(sr_prioridad, 1, ''Si'', Null) tipo_prioridad, DECODE(sr_prioridad, 2, ''Si'', Null) alta_licencia' +
     ' FROM afi.usr_usurecepcion';
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
end;

function TfrmManRecepcionSolicitud.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraUsuarioAsignado.IsEmpty, fraUsuarioAsignado, 'El usuario asignado no puede quedar vacío.');
  //Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'La fecha período desde, no puede quedar vacía');
  //Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'La fecha período hasta, no puede quedar vacía');

  if (not edFechaDesde.IsEmpty) then
    Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'Si selecciona una fecha de inicio de licencia, debe seleccionar tambien su finalización.');

  if (not edFechaHasta.IsEmpty) then
    Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Si selecciona una fecha de finalización de licencia, debe seleccionar tambien su fecha de inicio.');


  if (not edFechaDesde.IsEmpty) and (not edFechaHasta.IsEmpty) then
    Verificar(edFechaDesde.Date > edFechaHasta.Date, edFechaHasta, 'La fecha de inicio de licencia no pueder ser posterior a la de finalización.');

  Verificar(chkPrioridad.Checked and chkAltaLicencia.Checked, chkPrioridad, 'No se puede dar la opción de Alta y Prioridad al mismo tiempo.');

  if ModoABM = maAlta then
  begin
    sSql := 'SELECT 1 FROM afi.usr_usurecepcion WHERE sr_usuario =:usuario';
    Verificar(ValorSqlEx(sSql, [fraUsuarioAsignado.Value]) = '1', fraUsuarioAsignado, 'El usuario ya se encuentra en la lista.');
  end;
  
  Result := True;
end;

procedure TfrmManRecepcionSolicitud.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'afi.usr_usurecepcion';
//  FieldBaja     := 'null';
  LoadSQLString;
  fraUsuarioAsignado.ExtraCondition := 'AND se_sector IN (''AFINOM'', ''AFI'', ''ATCLI'')';
end;

procedure TfrmManRecepcionSolicitud.tbRefrescarClick(Sender: TObject);
begin
  LoadSQLString;
  inherited;
end;

procedure TfrmManRecepcionSolicitud.tbEliminarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'DELETE FROM afi.usr_usurecepcion WHERE sr_id =:id';
  try
    BeginTrans;
    EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('sr_id').AsInteger]);
    CommitTrans;
    MsgBox('Se ha borrado el registro.');
  except
    Rollback;
    MsgBox('Ha ocurrido un error.');
  end;
  sdqConsulta.Refresh;
end;

procedure TfrmManRecepcionSolicitud.edMailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnAceptarClick(nil);
end;

function TfrmManRecepcionSolicitud.GetCantidadMasBaja(const aUser: String): Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT MIN(sr_cantidad)' +
     ' FROM afi.usr_usurecepcion' +
    ' WHERE ((    sr_periodobaja IS NULL' +
            ' AND sr_periodoalta IS NULL)' +
                                       ' /*OR NOT(SYSDATE BETWEEN sr_periodobaja AND sr_periodoalta)*/' +
          ' )' +
      ' AND sr_usuario <> :usuario';
  Result := ValorSqlIntegerEx(sSql, [aUser], 0);
end;

end.
