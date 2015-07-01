unit unManUsuarioWebEmision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, Mask, PatternEdit, PeriodoPicker;

type
  TfrmManUsuarioWebEmision = class(TfrmCustomGridABM)
    edUsuario: TPatternEdit;
    edClaveWeb: TPatternEdit;
    lblClaveWeb: TLabel;
    lblUsuario: TLabel;
    cbForzarclave: TCheckBox;
    fraEmpresa: TfraEmpresa;
    lblCUIT: TLabel;
    edNombre: TEdit;
    lblDescripcion: TLabel;
    lblTelefono: TLabel;
    edTelefono: TEdit;
    lblEmail: TLabel;
    edEmail: TEdit;
    gbPeriodo: TGroupBox;
    edPeriodo: TPeriodoPicker;
    Label1: TLabel;
    Label2: TLabel;
    edUsuarioFiltro: TPatternEdit;
    fraEmpresaFiltro: TfraEmpresa;
    Label3: TLabel;
    edNombreFiltro: TEdit;
    Label4: TLabel;
    edTelefonoFiltro: TEdit;
    Label5: TLabel;
    edEmailFiltro: TEdit;
    cbNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure OnEmpresaChange(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManUsuarioWebEmision: TfrmManUsuarioWebEmision;

implementation

uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs, AnsiSql, Internet,
  unCustomConsulta;
{$R *.dfm}

{ Tfrm }

procedure TfrmManUsuarioWebEmision.ClearControls;
begin
  inherited;
  fraEmpresa.Clear;
  edUsuario.Clear;
  edClaveWeb.Clear;
  edNombre.Clear;
  edTelefono.Clear;
  edEmail.Clear;
  cbForzarclave.Checked := False;
end;

function TfrmManUsuarioWebEmision.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.Fields.Add('we_usubaja', Sesion.UserID );
      Sql.Fields.Add('we_fechabaja', exDateTime );
      iIdCodigo := sdqConsulta.FieldByName('we_id').AsInteger;
      Sql.PrimaryKey.Add('we_id', iIdCodigo);
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('we_contrato', fraEmpresa.Contrato);
      Sql.Fields.Add('we_usuario', edUsuario.Text);
      Sql.Fields.Add('we_clave', edClaveWeb.Text);
      Sql.Fields.Add('we_nombre', edNombre.Text);
      Sql.Fields.Add('we_mail', edEmail.Text);
      Sql.Fields.Add('we_telefono', edTelefono.Text);
      if cbForzarclave.Checked then
        Sql.Fields.Add('we_forzarclave', 'S')
      else
        Sql.Fields.Add('we_forzarclave', 'N');

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        Sql.Fields.Add('we_usualta', Sesion.UserID );
        Sql.Fields.Add('we_fechaalta', exDateTime );
        if not edPeriodo.ReadOnly then
        begin
          EjecutarSqlST(
            'INSERT INTO emi.icr_conceptoremunerativo '+
            '            (cr_contrato, cr_periodo) '+
            '     VALUES ('+SqlValue(fraEmpresa.Contrato)+','+SqlValue(edPeriodo.Periodo.Valor)+')');
        end;

      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('we_id').AsInteger;
        Sql.PrimaryKey.Add('we_id', iIdCodigo);
        Sql.Fields.Add('we_usumodif', Sesion.UserID);
        Sql.Fields.Add('we_fechamodif', exDateTime );
        Sql.Fields.Add('we_usubaja', exNull );
        Sql.Fields.Add('we_fechabaja', exNull );
      end;
    end;
    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el usuario Web.');
    end;
  end;


end;

procedure TfrmManUsuarioWebEmision.LoadControls;
begin
  inherited;
  ClearControls;
  fraEmpresa.Contrato := sdqConsulta.FieldByName('we_contrato').AsInteger;
  edUsuario.Text := sdqConsulta.FieldByName('we_usuario').AsString;
  edClaveWeb.Text := sdqConsulta.FieldByName('we_clave').AsString;
  edNombre.Text := sdqConsulta.FieldByName('we_nombre').AsString;
  edTelefono.Text := sdqConsulta.FieldByName('we_telefono').AsString;
  edEmail.Text := sdqConsulta.FieldByName('we_mail').AsString;
  cbForzarclave.Checked := sdqConsulta.FieldByName('we_forzarclave').AsString = 'S';
  OnEmpresaChange(nil);
end;

function TfrmManUsuarioWebEmision.Validar: Boolean;
begin
  Verificar(not fraEmpresa.IsSelected, fraEmpresa, 'Debe seleccionar la Empresa.');
  Verificar(edUsuario.Text = '', edUsuario, 'Debe completar el Usuario.');
  Verificar(edClaveWeb.Text = '', edClaveWeb, 'Debe completar la Clave.');
  Verificar(edNombre.Text = '', edNombre, 'Debe completar el Nombre.');
  Verificar(edEmail.Text = '', edEmail, 'Debe completar el Email.');
  Verificar(edPeriodo.Periodo.Valor = '', edPeriodo,'Debe Completar el periodo.');
  Verificar(not IsEMail(edEmail.Text),edEmail,'Debe ser un mail valido.');
  if ModoABM = maAlta then
    Verificar(ExisteSql(' SELECT 1 FROM emi.iwe_usuariowebemision WHERE we_usuario = '+SqlValue(edUsuario.Text)),
            edUsuario,'Ya existe el usuario.');
  Result := True;
end;

procedure TfrmManUsuarioWebEmision.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'we_fechabaja';
  Sql.TableName := 'emi.iwe_usuariowebemision';
  fraEmpresa.OnChange := OnEmpresaChange;
end;

procedure TfrmManUsuarioWebEmision.OnEmpresaChange(Sender: TObject);
var
  periodo : String;
begin
  periodo := ValorSql('SELECT MIN(cr_periodo) '+
           '  FROM emi.icr_conceptoremunerativo '+
           ' WHERE cr_contrato = '+SqlValue(fraEmpresa.Contrato));
  if periodo <> '' then
    vclExtra.LockControls([edPeriodo], True)
  else
    vclExtra.LockControls([edPeriodo], False);

  edPeriodo.Periodo.Valor := periodo;

end;

procedure TfrmManUsuarioWebEmision.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere : String;
begin
  sWhere := '';
  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere + ' AND we_contrato = '+SqlValue(fraEmpresaFiltro.Contrato);
  if edUsuarioFiltro.Text <> '' then
    sWhere := sWhere + ' AND we_usuario = '+SqlValue(edUsuarioFiltro.Text);
  if edNombreFiltro.Text <> '' then
    sWhere := sWhere + ' AND we_nombre = '+SqlValue(edNombreFiltro.Text);
  if edEmailFiltro.Text <> '' then
    sWhere := sWhere + ' AND we_mail = '+SqlValue(edEmailFiltro.Text);
  if edTelefonoFiltro.Text <> '' then
    sWhere := sWhere + ' AND we_telefono = '+SqlValue(edTelefonoFiltro.Text);
  if cbNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND we_fechabaja IS NULL ';

  sSql := ' SELECT we_id, we_contrato, we_usuario, we_clave, we_nombre, '+
          '        we_mail, we_telefono, we_usualta, we_fechaalta, '+
          '        we_usumodif, we_fechamodif, we_usubaja, we_fechabaja, '+
          '        we_ultimologin, we_forzarclave '+
          '   FROM emi.iwe_usuariowebemision '+
          '  WHERE 1 = 1 '+sWhere;
  sdqConsulta.SQL.Text := sSql;
  inherited;
end;

end.
