unit unManPeritos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, unfraCtbTablas,
  unArtFrame, unFraCodigoDescripcion, unArtDBAwareFrame, PatternEdit;

type
  TFrmManPeritos = class(TfrmCustomGridABM)
    lblDescripcion: TLabel;
    edNombrePerito: TEdit;
    fraTipoPerito: TfraCodigoDescripcion;
    lblTipoPerito: TLabel;
    lblDesignacion: TLabel;
    edCuitCuil: TMaskEdit;
    lblCuitCuil: TLabel;
    cboDesignacion: TComboBox;
    edDireccion: TEdit;
    Label1: TLabel;
    lbNombre: TLabel;
    edApellido: TEdit;
    edNombre: TEdit;
    lbApellido: TLabel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    pnlBottom: TPanel;
    edMail: TPatternEdit;
    edTelefono: TEdit;
    lblMail: TLabel;
    lblTelefono: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edCuitCuilExit(Sender: TObject);
  private
    FCodigo : String;

    { Private declarations }
  public
    { Public declarations }
    procedure VerSeleccion;
    function ObtenerPerito: String;
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;


implementation

uses unDmPrincipal, unSesion, SqlFuncs, General, CustomDlgs, StrFuncs,
  unCustomConsulta, vclExtra, AnsiSql;

{$R *.dfm}

{ TFrmManPeritos }

procedure TFrmManPeritos.ClearControls;
begin
  inherited;
  fraTipoPerito.Codigo := '';
  cboDesignacion.ItemIndex := 0;
  edNombrePerito.Text := '';
  edDireccion.Clear;
  edCuitCuil.Text := '';
  edNombre.Clear;
  edApellido.Clear;
  edMail.Clear;
  edTelefono.Clear;
end;

function TFrmManPeritos.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('PE_ID', sdqConsulta.FieldByName('PE_ID').AsInteger );
    Sql.Fields.Add('PE_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('PE_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('PE_NOMBRE', edApellido.Text + ' '+edNombre.Text);
    Sql.Fields.Add('PE_APELLIDO', edApellido.Text);
    Sql.Fields.Add('PE_NOMBREINDIVIDUAL', edNombre.Text);
    Sql.Fields.Add('PE_CUITCUIL', edCuitCuil.Text);
    Sql.Fields.Add('PE_IDTIPOPERITO', fraTipoPerito.Codigo);
    Sql.Fields.Add('PE_DIRECCION', edDireccion.Text);
    Sql.Fields.Add('PE_DIRECCIONELECTRONICA', edMail.Text);
    Sql.Fields.Add('PE_TELEFONO', edTelefono.Text);


    case cboDesignacion.ItemIndex of
      0 : Sql.Fields.Add('PE_PARTEOFICIO', 'P');
      1 : Sql.Fields.Add('PE_PARTEOFICIO', 'O');
      2 : Sql.Fields.Add('PE_PARTEOFICIO', 'C');
    end;

    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('PE_ID', GetSecNextVal('LEGALES.SEQ_LPE_ID'));
      Sql.Fields.Add('PE_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('PE_FECHAALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('PE_ID', sdqConsulta.FieldByName('PE_ID').AsInteger);
      Sql.Fields.Add('PE_USUMODIF', Sesion.LoginName);
      Sql.Fields.Add('PE_FECHAMODIF', exDateTime );
      Sql.Fields.Add('PE_USUBAJA', exNull );
      Sql.Fields.Add('PE_FECHABAJA', exNull );
    end;
  end;
  Result := inherited DoABM;
end;

procedure TFrmManPeritos.FormCreate(Sender: TObject);
begin
  inherited;
  with fraTipoPerito do
  begin
    TableName   := 'legales.LTP_TIPOPERICIA';
    FieldID     := 'tp_id';
    FieldCodigo := 'tp_id';
    FieldDesc   := 'tp_descripcion';
  end;

  FieldBaja := 'pe_fechabaja';
  Sql.TableName := 'LEGALES.LPE_PERITO';
  VclExtra.LockControls(edNombrePerito,True);
end;

procedure TFrmManPeritos.LoadControls;
begin
  inherited;
  fraTipoPerito.Codigo     := sdqConsulta.fieldbyname('PE_IDTIPOPERITO').AsString;
  cboDesignacion.ItemIndex := ArrayPos(sdqConsulta.fieldbyname('PE_PARTEOFICIO').AsString, ['P', 'O', 'C']);
  edNombrePerito.Text      := sdqConsulta.fieldbyname('PE_NOMBRE').AsString;
  edApellido.Text          := sdqConsulta.fieldbyname('PE_APELLIDO').AsString;
  edNombre.Text            := sdqConsulta.fieldbyname('PE_NOMBREINDIVIDUAL').AsString;
  edDireccion.Text         := sdqConsulta.fieldbyname('PE_DIRECCION').AsString;
  edCuitCuil.Text          := sdqConsulta.fieldbyname('PE_CUITCUIL').AsString;
  edTelefono.Text          := sdqConsulta.fieldbyname('PE_TELEFONO').AsString;
  edMail.Text              := sdqConsulta.fieldbyname('PE_DIRECCIONELECTRONICA').AsString;
end;

function TFrmManPeritos.Validar: Boolean;
begin
  result := true;
  VerificarMultiple(['Mantenimiento de Peritos',
     fraTipoPerito, fraTipoPerito.Codigo, 'Debe seleccionar un tipo de perito']);
  Verificar(edApellido.Text = '', edApellido, 'Debe Especificar un Apellido para el Perito.');
  Verificar(edNombre.Text = '', edNombre, 'Debe Especificar un Nombre para el Perito.');
  Verificar(edDireccion.Text = '', edDireccion, 'Debe Especificar una dirección para el Perito.');
  if edCuitCuil.Text <> '' then
    Verificar(ExisteSql('SELECT 1 FROM LEGALES.LPE_PERITO WHERE PE_CUITCUIL = '+SqlValue(edCuitCuil.Text)+
                        '   AND pe_id <> '+SqlValue(sdqConsulta.FieldByName('PE_ID').AsInteger)+
                        '   AND pe_fechabaja IS NULL '),edCuitCuil,'Ya existe el cuil/Cuit.');
end;

procedure TFrmManPeritos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFrmManPeritos.VerSeleccion;
begin
  Panel1.Visible := True;
end;

function TFrmManPeritos.ObtenerPerito : String;
begin
  Result := Fcodigo;
end;

procedure TFrmManPeritos.Button1Click(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, btnAceptar, 'Debe seleccionar un Perito.');
  FCodigo := sdqConsulta.FieldByName('PE_ID').AsString;
  ModalResult := mrOK;
end;

procedure TFrmManPeritos.edCuitCuilExit(Sender: TObject);
var
  codigoperito : integer;
begin
  inherited;
  if edCuitCuil.Text <> '' then
  begin
    if ModoABM = maAlta Then
      codigoperito := ValorSqlInteger('SELECT pe_id FROM legales.LPE_PERITO WHERE PE_CUITCUIL = '+SqlValue(edCuitCuil.Text)+
                               '   AND pe_fechabaja IS NULL ')
    else
      codigoperito := ValorSqlInteger('SELECT pe_id FROM legales.LPE_PERITO WHERE PE_CUITCUIL = '+SqlValue(edCuitCuil.Text)+
                               '   AND pe_id <> '+SqlValue(sdqConsulta.FieldByName('pe_id').AsInteger)+
                               '   AND pe_fechabaja IS NULL ');

    Verificar(codigoperito > 0,edCuitCuil,'Ya existe el cuil/Cuit.En el codigo '+IntToStr(codigoperito));
  end
  else
    MsgBox('El CUIT es información relevante a ser informada a los organismos de control, se aconseja su carga, sino posee el dato prosiga con la carga.');       
end;


end.
