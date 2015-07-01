unit unManPreventorConsultora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, AdvGlowButton, IntEdit,
  RxToolEdit, ArtComboBox, Vcl.StdCtrls, ExComboBox, Vcl.Mask, PatternEdit,
  FieldHider, ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtDBGrid, Vcl.ComCtrls,
  Vcl.ToolWin, unArtFrame, unFraDomicilio, unFraDomicilioGIS;

type
  TfrmManPreventorConsultoras = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    lblNombre: TLabel;
    lblCodigo: TLabel;
    edCodigoPreventor: TPatternEdit;
    edNombre: TEdit;
    cbTipoMatricula: TExComboBox;
    edNroMatricula: TPatternEdit;
    edTitulo: TEdit;
    edInstOtorgante: TEdit;
    Label15: TLabel;
    edEmail: TEdit;
    fraDomicilioGISPreventor: TfraDomicilioGIS;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    FIdPreventor : Integer;
    { Private declarations }
  public
    procedure Load(idPreventor: Integer);
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmManPreventorConsultoras: TfrmManPreventorConsultoras;

implementation

{$R *.dfm}

uses
  AnsiSql, Strfuncs, CustomDlgs, Internet, unDmPrincipal, unSesion, SqlFuncs;

procedure TfrmManPreventorConsultoras.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hpc_preventorconsultora';
  FieldBaja := 'PC_FECHABAJA';
end;

procedure TfrmManPreventorConsultoras.Load(idPreventor : Integer);
begin
  FIdPreventor := idPreventor;
  Caption := Caption+'('+ValorSql(' SELECT it_nombre FROM art.pit_firmantes WHERE it_id = '+SqlValue(FIdPreventor))+')';
end;

procedure TfrmManPreventorConsultoras.LoadControls;
begin
  edCodigoPreventor.Text := sdqConsulta.FieldByName('pc_id').AsString;
  edNombre.Text := sdqConsulta.FieldByName('pc_nombre').AsString;
  cbTipoMatricula.Value := sdqConsulta.fieldbyname('pc_tipomatricula').AsString;
  edNroMatricula.Text := sdqConsulta.FieldByName('pc_matricula').AsString;
  edTitulo.Text := sdqConsulta.FieldByName('pc_titulo').AsString;
  edInstOtorgante.Text := sdqConsulta.FieldByName('pc_institucionotorgante').AsString;
  edEmail.Text := sdqConsulta.FieldByName('pc_email').AsString;
  fraDomicilioGISPreventor.Cargar(sdqConsulta.fieldbyname('pc_calle').AsString,
                                  sdqConsulta.fieldbyname('pc_cpostal').AsString,
                                  sdqConsulta.fieldbyname('pc_localidad').AsString,
                                  sdqConsulta.fieldbyname('pc_numero').AsString,
                                  sdqConsulta.fieldbyname('pc_piso').AsString,
                                  sdqConsulta.fieldbyname('pc_departamento').AsString,
                                  sdqConsulta.fieldbyname('pc_provincia').AsString,
                                  sdqConsulta.fieldbyname('pc_cpostala').AsString);

end;

procedure TfrmManPreventorConsultoras.tbRefrescarClick(Sender: TObject);
var
  sSQL :String;
begin
  sSQL := 'SELECT pc_id, pc_idpreventor, pc_nombre, pc_tipomatricula, ' +
          '       DECODE (pc_tipomatricula, ' +
          '               ''1'', ''RUGU'', ' +
          '               2, ''RUTH'', ' +
          '               3, ''Matrícula Profesional'' ' +
          '              ) tipomatricula, ' +
          '       pc_matricula, pc_institucionotorgante, pc_titulo, pc_email, pc_calle, ' +
          '       pc_numero, pc_piso, pc_departamento, pc_cpostal, pc_cpostala, ' +
          '       pc_localidad, pc_provincia, (SELECT pv_descripcion ' +
          '                                      FROM art.cpv_provincias ' +
          '                                     WHERE pv_codigo = pc_provincia) ' +
          '                                                                    provincia, ' +
          '       pc_fechabaja '+
          '  FROM hys.hpc_preventorconsultora '+
          ' WHERE pc_idpreventor = '+SqlValue(FIdPreventor);
  sdqConsulta.SQL.Text := sSQL;
  inherited;
end;

function TfrmManPreventorConsultoras.Validar: Boolean;
begin
  Verificar(edNombre.Text = '', edNombre, 'Debe especificar el nombre del preventor.');
  Verificar(not IsEmptyString(edEmail.text) and not IsEMails(edEmail.text), edEmail, 'Mail inválido');
  Result := True;
end;

function TfrmManPreventorConsultoras.DoABM: Boolean;
var
  idtabla : Integer;
begin
  try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('pc_id', sdqConsulta.FieldByName('pc_id').AsInteger );
      Sql.Fields.Add('pc_usubaja', Sesion.LoginName );
      Sql.Fields.Add('pc_fechabaja', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('pc_nombre', edNombre.Text);
      Sql.Fields.Add('pc_tipomatricula', cbTipoMatricula.Value );
      Sql.Fields.Add('pc_idpreventor', FIdPreventor );
      Sql.Fields.Add('pc_matricula', edNroMatricula.Text);
      Sql.Fields.Add('pc_titulo', edTitulo.Text);
      Sql.Fields.Add('pc_institucionotorgante', edInstOtorgante.Text);
      Sql.Fields.Add('pc_email', edEmail.Text);
      Sql.Fields.Add('pc_calle', fraDomicilioGISPreventor.Calle);
      Sql.Fields.Add('pc_numero', fraDomicilioGISPreventor.Numero);
      Sql.Fields.Add('pc_piso', fraDomicilioGISPreventor.Piso);
      Sql.Fields.Add('pc_departamento', fraDomicilioGISPreventor.Departamento);
      Sql.Fields.Add('pc_cpostal', fraDomicilioGISPreventor.CodigoPostal);
      Sql.Fields.Add('pc_cpostala', fraDomicilioGISPreventor.CPA);
      Sql.Fields.Add('pc_localidad', fraDomicilioGISPreventor.Localidad);
      Sql.Fields.Add('pc_provincia', fraDomicilioGISPreventor.Prov);

      if ModoABM = maAlta Then
      begin
        Idtabla := GetSecNextVal('HYS.SEQ_HPC_PREVENTORCONSULTORA_ID');
        Sql.SqlType := stInsert;
        Sql.PrimaryKey.Add('pc_id', Idtabla);
        edCodigoPreventor.Text := IntToStr(Idtabla);
        Sql.Fields.Add('pc_usualta', Sesion.LoginName );
        Sql.Fields.Add('pc_fechaalta', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        Sql.PrimaryKey.Add('pc_id', sdqConsulta.FieldByName('pc_id').AsInteger);
        Sql.Fields.Add('pc_usumodif', Sesion.LoginName);
        Sql.Fields.Add('pc_fechamodif', exDateTime );
        Sql.Fields.Add('pc_usubaja', exNull );
        Sql.Fields.Add('pc_fechabaja', exNull );
      end;
    end;
    EjecutarSQLST(Sql.Sql);

    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el preventor.');
    end;
  end;
end;

procedure TfrmManPreventorConsultoras.ClearControls;
begin
  edCodigoPreventor.Clear;
  edNombre.Clear;
  cbTipoMatricula.ItemIndex := -1;
  edNroMatricula.Clear;
  edTitulo.Clear;
  edInstOtorgante.Clear;
  edEmail.Clear;
  fraDomicilioGISPreventor.Clear;
end;

end.
