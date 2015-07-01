unit unManZBA_BANCO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PatternEdit, Mask,
  RxPlacemnt;

type
  TfrmManZBA_BANCO = class(TfrmCustomGridABM)
    Label1: TLabel;
    edBA_NOMBRE: TEdit;
    chkBA_DATANET: TCheckBox;
    Label2: TLabel;
    edBA_ID: TPatternEdit;
    edBA_CUIT: TMaskEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edBA_IDExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmManZBA_BANCO: TfrmManZBA_BANCO;
  
implementation

uses
	unDmPrincipal, unPrincipal, AnsiSql, SqlFuncs, CustomDlgs, StrFuncs, VclExtra,
  unSesion, Cuit;

{$R *.DFM}

procedure TfrmManZBA_BANCO.ClearControls;
begin
  VclExtra.LockControl(edBA_ID, False);
  VclExtra.LockControl(edBA_NOMBRE, False);

  fpAbm.ActiveControl := edBA_ID;  // setea el foco

  edBA_ID.Clear;
  edBA_CUIT.Clear;
  edBA_NOMBRE.Clear;
  chkBA_DATANET.Checked := False;
end;

procedure TfrmManZBA_BANCO.LoadControls;
begin
  VclExtra.LockControl(edBA_ID, True);
  VclExtra.LockControl(edBA_NOMBRE, True);

  fpAbm.ActiveControl := edBA_CUIT;

  edBA_ID.Text          := sdqConsulta.FieldByName('BA_CODIGO').AsString;
  edBA_CUIT.Text        := sdqConsulta.FieldByName('BA_CUIT').AsString;
  edBA_NOMBRE.Text      := sdqConsulta.FieldByName('BA_NOMBRE').AsString;
  chkBA_DATANET.Checked := (sdqConsulta.FieldByName('BA_DATANET').AsString = SQL_TRUE);
end;

function TfrmManZBA_BANCO.Validar: Boolean;
var
  sSql: String;
begin
  Result := False;

  // código de banco
  if StrToIntDef(edBA_ID.Text, 0) = 0 then
    InvalidMsg(edBA_ID, 'Debe ingresar un código de banco válido.')

  // CUIT
  else if (edBA_CUIT.Text > '') and not IsCuit(edBA_CUIT.Text) then
    InvalidMsg(edBA_CUIT, 'La CUIT es inválida.')

  // nombre del banco
  else if edBA_NOMBRE.Text = '' then
    InvalidMsg(edBA_NOMBRE, 'Debe ingresar el nombre del banco.')

  else
  begin
  	// Unique key - código del banco
    sSql :=
    	'SELECT 1' +
       ' FROM ZBA_BANCO' +
      ' WHERE BA_CODIGO = :Cod';

    if ModoABM = maModificacion then
    	sSql := sSql + ' AND BA_ID <> ' + SqlValue(sdqConsulta.FieldByName('BA_ID').AsInteger);

    if ExisteSqlEx(sSql, [edBA_ID.Text]) then
    	InvalidMsg(edBA_ID, 'El código de banco ya existe.')
    else
      begin
        sSql :=
          'SELECT 1' +
           ' FROM ZBA_BANCO' +
          ' WHERE BA_CUIT = :Cuit' +
            ' AND BA_FECHABAJA IS NULL';

        if ModoABM = maModificacion then
          sSql := sSql + ' AND BA_ID <> ' + SqlValue(sdqConsulta.FieldByName('BA_ID').AsInteger);

        if  (edBA_CUIT.Text > '') and ExisteSqlEx(sSql, [edBA_CUIT.Text]) then
          InvalidMsg(edBA_CUIT, 'La CUIT ya existe.')
        else
        	Result := True;
      end;
  end;
end;

procedure TfrmManZBA_BANCO.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'BA_FECHABAJA';

  CheckPK   := True;

  CAPTION_ALTA    := 'Agregar Banco';
  CAPTION_MODIFIC := 'Modificar Banco';
  MSG_BAJA        := '¿ Desea eliminar el Banco seleccionado ?';
  MSG_PK_VIOLATED := 'No se pudo ingresar el registro porque ya existe un banco con la misma clave';

  if frmPrincipal <> nil then
  	if frmPrincipal.mnuTesoMantBancos <> nil then
  		frmPrincipal.mnuTesoMantBancos.Enabled := False;
end;

function TfrmManZBA_BANCO.DoABM: Boolean;
begin
  with Sql do
  begin
  	Clear;

    TableName := 'ZBA_BANCO';

    if ModoABM = maBaja then
    begin
    	PrimaryKey.Add('BA_ID',    sdqConsulta.FieldByName('BA_ID').AsInteger);
      Fields.Add('BA_FECHABAJA', exDateTime);
      Fields.Add('BA_USUBAJA',   Sesion.UserID);

      SqlType := stUpdate;
    end
    else
    begin
    	if ModoABM = maAlta then
      begin
      	PrimaryKey.Add('BA_ID',    GetSecNextVal('SEQ_ZBA_ID'));
        Fields.Add('BA_FECHAALTA', exDateTime);
        Fields.Add('BA_USUALTA',   Sesion.UserID);

        SqlType := stInsert;
      end
      else
      begin
      	PrimaryKey.Add('BA_ID',     sdqConsulta.FieldByName('BA_ID').AsInteger);
        Fields.Add('BA_FECHAMODIF', exDateTime);
        Fields.Add('BA_USUMODIF',   Sesion.UserID);

        SqlType := stUpdate;
      end;

      Fields.Add('BA_CODIGO',    edBA_ID.Text);
      Fields.Add('BA_CUIT',      edBA_CUIT.Text);
      Fields.Add('BA_NOMBRE',    edBA_NOMBRE.Text);
      Fields.Add('BA_DATANET',   chkBA_DATANET.Checked);
      Fields.Add('BA_FECHABAJA', exNull);
      Fields.Add('BA_USUBAJA',   exNull);
    end;
  end;

  Result := inherited DoABM;
end;

procedure TfrmManZBA_BANCO.edBA_IDExit(Sender: TObject);
begin
  edBA_ID.Text := LPad(edBA_ID.Text, '0', 3);
end;

procedure TfrmManZBA_BANCO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if frmPrincipal <> nil then
  	if frmPrincipal.mnuTesoMantBancos <> nil then
  		frmPrincipal.mnuTesoMantBancos.Enabled := True;
      
  Action := caFree;
  frmManZBA_BANCO := nil;
end;

end.
