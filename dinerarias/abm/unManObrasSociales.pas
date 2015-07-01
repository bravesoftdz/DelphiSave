unit unManObrasSociales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, unArtFrame, unFraDomicilio, Mask, PatternEdit,
  StdCtrls, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, ExtCtrls,
  FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin;

type
  TfrmManObrasSociales = class(TfrmCustomGridABM)
    Label1: TLabel;
    lbRSocial: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    edRSocial: TEdit;
    edTelefono: TEdit;
    edFAX: TEdit;
    edDirElectronica: TEdit;
    edCodigo: TPatternEdit;
    edContactos: TEdit;
    fraDireccion: TfraDomicilio;
    gbEstado: TGroupBox;
    rbActivas: TRadioButton;
    rbTodas: TRadioButton;
    gbTipo: TGroupBox;
    rbSuss: TRadioButton;
    rbTipoTodas: TRadioButton;
    rbNoSuss: TRadioButton;
    pnlTipo: TPanel;
    rbSussABM: TRadioButton;
    rbNoSussABM: TRadioButton;
    Label6: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;

  public
    { Public declarations }
  end;

var
  frmManObrasSociales: TfrmManObrasSociales;

implementation

uses CustomDlgs, unSesion, unDmPrincipal, AnsiSql, Internet, SqlFuncs,
  General;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmManObrasSociales.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT os_codigo, os_descripcion, os_calle, os_numero, os_piso, os_departamento, ' +
                ' os_localidad, os_cpostal, os_cpostala, os_provincia, pv_descripcion, os_telefonos, ' +
                ' os_fax, os_direlectronica, os_fechaalta, os_usualta, os_fechamodif, ' +
                ' os_usumodif, os_fecbaja, os_usubaja, os_contactos, os_tipo, ' +
                ' DECODE(os_tipo, ''S'', ''SUSS'', ''N'', ''No SUSS'', Null) tipo ' +
           ' FROM cos_osocial, cpv_provincias ' +
          ' WHERE pv_codigo(+) = os_provincia';

  if rbActivas.Checked then
    sSql := sSql + ' AND os_fecbaja IS NULL ';

  if rbSuss.Checked then
    sSql := sSql + ' AND os_tipo = ''S'' '
  else if rbNoSuss.Checked then
    sSql := sSql + ' AND os_tipo = ''N'' ';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManObrasSociales.ClearControls;
begin
  edCodigo.Clear;
  edRSocial.Clear;
  fraDireccion.Clear;
  edTelefono.Clear;
  edFAX.Clear;
  edDirElectronica.Clear;
  edContactos.Clear;
  rbSussABM.Checked   := False;
  rbNoSussABM.Checked := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManObrasSociales.LoadControls;
begin
  edCodigo.Text         := sdqConsulta.FieldByName('os_codigo').AsString;
  edRSocial.Text        := sdqConsulta.FieldByName('os_descripcion').AsString;
  edTelefono.Text       := sdqConsulta.FieldByName('os_telefonos').AsString;
  edFAX.Text            := sdqConsulta.FieldByName('os_fax').AsString;
  edDirElectronica.Text := sdqConsulta.FieldByName('os_direlectronica').AsString;
  edContactos.Text      := sdqConsulta.FieldByName('os_contactos').AsString;
  rbSussABM.Checked     := (sdqConsulta.FieldByName('os_tipo').AsString = 'S');
  rbNoSussABM.Checked   := (sdqConsulta.FieldByName('os_tipo').AsString = 'N');
  fraDireccion.Cargar(sdqConsulta.FieldByName('os_calle').AsString,
                      sdqConsulta.FieldByName('os_cpostal').AsString,
                      sdqConsulta.FieldByName('os_localidad').AsString,
                      sdqConsulta.FieldByName('os_numero').AsString,
                      sdqConsulta.FieldByName('os_piso').AsString,
                      sdqConsulta.FieldByName('os_departamento').AsString,
                      sdqConsulta.FieldByName('os_provincia').AsString,
                      sdqConsulta.FieldByName('os_cpostala').AsString);
end;
{-------------------------------------------------------------------------------}
function TfrmManObrasSociales.Validar: Boolean;
begin
  Verificar(Trim(edCodigo.Text) = '', edCodigo, 'Debe completar el código.');
  Verificar((ModoABM = maAlta) and
             ExisteSqlEx('SELECT 1 FROM cos_osocial ' +
                         ' WHERE os_codigo = :Cod', [edCodigo.Text]), edCodigo,
            'Ya existe una obra social con el código seleccionado.');
  Verificar(Trim(edRSocial.Text) = '', edCodigo, 'Debe completar la razón social.');
  Verificar((edDirElectronica.Text <> '') and (not IsEMails(edDirElectronica.Text)),
            edDirElectronica, 'El E-Mail no es válido.');
  Verificar(not(rbSussABM.Checked) and not(rbNoSussABM.Checked), pnlTipo,
            'Debe seleccionar el tipo de obra social.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmManObrasSociales.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    TableName := 'cos_osocial';

    case ModoABM of
      maAlta, maModificacion:
      begin
        if ModoABM = maAlta then
        begin
          SqlType := stInsert;
          Fields.Add('os_usualta',    Sesion.UserID);
          Fields.Add('os_fechaalta',  exDateTime);
        end
        else begin
          SqlType := stUpdate;
          PrimaryKey.Add('os_codigo',   sdqConsulta.FieldByName('os_codigo').AsString);
          Fields.Add('os_usumodif',     Sesion.UserID);
          Fields.Add('os_fechamodif',   exDateTime);
          Fields.Add('os_usubaja',      '');
          Fields.Add('os_fecbaja',      '');
        end;

        Fields.Add('os_codigo',         Trim(edCodigo.Text));
        Fields.Add('os_descripcion',    Trim(edRSocial.Text));
        Fields.Add('os_calle',          fraDireccion.Calle);
        Fields.Add('os_numero',         fraDireccion.Numero);
        Fields.Add('os_piso',           fraDireccion.Piso);
        Fields.Add('os_departamento',   fraDireccion.Departamento);
        Fields.Add('os_localidad',      fraDireccion.Localidad);
        Fields.Add('os_cpostal',        fraDireccion.CodigoPostal);
        Fields.Add('os_cpostala',       fraDireccion.CPA);
        Fields.Add('os_provincia',      fraDireccion.Prov);
        Fields.Add('os_telefonos',      Trim(edTelefono.Text));
        Fields.Add('os_fax',            Trim(edFAX.Text));
        Fields.Add('os_direlectronica', Trim(edDirElectronica.Text));
        Fields.Add('os_contactos',      Trim(edContactos.Text));
        Fields.Add('os_tipo',           String(IIF(rbSussABM.Checked, 'S', IIF(rbNoSussABM.Checked, 'N', ''))));
      end;

      maBaja:
      begin
          SqlType := stUpdate;
          PrimaryKey.Add('os_codigo',   sdqConsulta.FieldByName('os_codigo').AsString);
          Fields.Add('os_usubaja',      Sesion.UserID);
          Fields.Add('os_fecbaja',      exDateTime);
      end;
    end;

    Result := inherited DoABM;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManObrasSociales.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;
  FieldBaja   := 'os_fecbaja';
end;
{-------------------------------------------------------------------------------}
end.
