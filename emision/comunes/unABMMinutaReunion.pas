unit unABMMinutaReunion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, unArtFrame,
  unfraUsuarios, Buttons, PatternEdit, DateTimeEditors, Mask, ToolEdit,
  DateComboBox, CheckLst, ARTCheckListBox, CustomDlgs, DBSql, unDmPrincipal,
  SqlFuncs, unSesion, unRptMinutaReunion;

type
  TModoABM = (maNone, maAlta, maModificacion, maBaja); 

  TfrmMinutaReunion = class(TfrmCustomForm)
    edContactos: TMemo;
    Label1: TLabel;
    fraUsuario: TfraUsuario;
    lstUsuarios: TListBox;
    Label2: TLabel;
    btnEliminar: TSpeedButton;
    btnAgregar: TSpeedButton;
    edLugar: TEdit;
    Label3: TLabel;
    edFechaReunion: TDateComboBox;
    lblFecha: TLabel;
    edHora: TTimeEditor;
    chkTemasTratados: TARTCheckListBox;
    Label4: TLabel;
    Label5: TLabel;
    chkDocumentacionEntregada: TARTCheckListBox;
    btnAceptar: TButton;
    btnCancelar: TButton;
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    FModoABM: TModoABM;
    FIdMinutaReunion: integer;
    FContrato: integer;
    procedure ImprimirMinuta;
    procedure GuardarUsuarios(aIdMinuta: integer);
    procedure GuardarTemasTratados(aIdMinuta: integer);
    procedure GuardarDocEntregada(aIdMinuta: integer);
    function GuardarMinuta(aIdMinuta: integer = 0): boolean;
    function Validar: boolean;
  public
    procedure ClearControls;

    property Contrato: integer read FContrato write FContrato;
    property IdMinutaReunion: integer read FIdMinutaReunion write FIdMinutaReunion;
  end;

var
  frmMinutaReunion: TfrmMinutaReunion;

implementation

{$R *.dfm}

procedure TfrmMinutaReunion.btnAgregarClick(Sender: TObject);
var
  i: integer;
  bExiste: boolean;
begin
  bExiste := false;
  if fraUsuario.IsSelected then
  begin
    for i:=0 to lstUsuarios.Count-1 do
      if Integer(lstUsuarios.Items.Objects[i]) = fraUsuario.ID then
        bExiste := true;
    if not bExiste then
      lstUsuarios.AddItem(fraUsuario.Nombre, TObject(fraUsuario.ID));
  end;
  fraUsuario.Clear;
end;

procedure TfrmMinutaReunion.btnEliminarClick(Sender: TObject);
begin
  Verificar(lstUsuarios.ItemIndex < 0, lstUsuarios, 'Debe seleccionar un registro');
  lstUsuarios.DeleteSelected;
end;

function TfrmMinutaReunion.GuardarMinuta(aIdMinuta: integer): boolean;
var
  Sql: TDBSql;
  FechaHora: TDateTime;
begin
  result := false;
  if Validar then
  begin
    try
      Sql := TDBSql.Create;
      try
        Sql.TableName := 'EMI.IMR_MINUTAREUNION';
        BeginTrans;
        if FModoABM = maBaja then
        begin
           Sql.PrimaryKey.Add('MR_ID', aIdMinuta);
           Sql.Fields.Add('MR_FECHABAJA', exDateTime);
           Sql.Fields.Add('MR_USUBAJA', Sesion.UserID);
           Sql.SqlType := stUpdate;
        end else
        begin
           if FModoABM = maAlta then
           begin
             aIdMinuta := GetSecNextVal('EMI.SEQ_IMR_MINUTAREUNION');
             Sql.PrimaryKey.Add('MR_ID', aIdMinuta);
             Sql.Fields.Add('MR_FECHAALTA', exDateTime);
             Sql.Fields.Add('MR_USUALTA', Sesion.UserID);
             Sql.SqlType := stInsert;
           end else
           if FModoABM = maModificacion then
           begin
             Sql.PrimaryKey.Add('MR_ID', aIdMinuta);
             Sql.Fields.Add('MR_FECHAMODIF', exDateTime);
             Sql.Fields.Add('MR_USUMODIF', Sesion.UserID);
             Sql.SqlType := stUpdate;
           end;
           Sql.Fields.Add('MR_LUGAR', edLugar.Text);
           Sql.Fields.Add('MR_CONTACTOS', edContactos.Text);
           FechaHora := edFechaReunion.Date + edHora.Time;
           Sql.Fields.Add('MR_FECHAREUNION', FechaHora);
           Sql.Fields.Add('MR_CONTRATO', FContrato);
        end;
        TDBSql(Sql).ExecuteST;
        if FModoABM <> maBaja then
        begin
          GuardarUsuarios(aIdMinuta);
          GuardarTemasTratados(aIdMinuta);
          GuardarDocEntregada(aIdMinuta);
        end;
        FIdMinutaReunion := aIdMinuta;
        CommitTrans;
      finally
        Sql.Free;
      end;
      result := true;
    except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Error guardar la minuta.');
      end;
    end;
  end;
end;

procedure TfrmMinutaReunion.FormCreate(Sender: TObject);
begin
  inherited;
  chkTemasTratados.SQL := 'SELECT tt_descripcion, tt_id FROM emi.itt_temastratados WHERE tt_fechabaja IS NULL';
  chkDocumentacionEntregada.SQL := 'SELECT de_descripcion, de_id FROM emi.ide_documentacionentregada WHERE de_fechabaja IS NULL';
  fraUsuario.UsuariosGenericos := false;
  fraUsuario.ShowBajas := false;
  FModoABM := maAlta;
end;

procedure TfrmMinutaReunion.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if GuardarMinuta then
  begin
    ImprimirMinuta;
    ModalResult := mrOk;
  end;
end;

function TfrmMinutaReunion.Validar: boolean;
begin
  Verificar(trim(edContactos.Text) = '', edContactos, 'Debe especificar al menos un contacto.');
  Verificar(lstUsuarios.Count = 0, lstUsuarios, 'Debe especificar al menos un empleado de la ART.');
  Verificar(trim(edLugar.Text) = '', edLugar, 'Debe especificar el lugar de la reunión.');
  Verificar(edFechaReunion.Date = 0, edFechaReunion, 'Debe especificar la fecha de la reunión.');
  Verificar(edFechaReunion.Date < DBDate, edFechaReunion, 'La fecha no puede ser anterior a hoy.');
  Verificar(edHora.Time = 0, edHora, 'Debe especificar la hora de la reunión.');
  Verificar(chkTemasTratados.CheckCount = 0, chkTemasTratados, 'Debe especificar al menos un tema.');
  result := true;
end;

procedure TfrmMinutaReunion.GuardarUsuarios(aIdMinuta: integer);
var
  i: integer;
begin
  EjecutarSqlSTEx('DELETE FROM EMI.IMU_MINUTAUSUARIO WHERE MU_IDMINUTAREUNION = :id', [aIdMinuta]);
  for i:=0 to lstUsuarios.Count-1 do
    EjecutarSqlSTEx('INSERT INTO EMI.IMU_MINUTAUSUARIO(MU_IDMINUTAREUNION, MU_IDUSUARIO)' +
                    ' VALUES(:idminuta, :idusuario) ', [aIdMinuta, integer(lstUsuarios.Items.Objects[i])]);
end;

procedure TfrmMinutaReunion.GuardarTemasTratados(aIdMinuta: integer);
var
  i: integer;
begin
  EjecutarSqlSTEx('DELETE FROM EMI.IMT_MINUTATEMASTRATADOS WHERE MT_IDMINUTAREUNION = :id', [aIdMinuta]);
  for i:=0 to chkTemasTratados.Count-1 do
    if chkTemasTratados.Checked[i] then
      EjecutarSqlSTEx('INSERT INTO EMI.IMT_MINUTATEMASTRATADOS(MT_IDMINUTAREUNION, MT_IDTEMATRATADO)' +
                      ' VALUES(:idminuta, :idtema) ', [aIdMinuta, chkTemasTratados.Values[i]]);
end;

procedure TfrmMinutaReunion.GuardarDocEntregada(aIdMinuta: integer);
var
  i: integer;
begin
  EjecutarSqlSTEx('DELETE FROM EMI.IMD_MINUTADOCUMENTACIONENT WHERE MD_IDMINUTAREUNION = :id', [aIdMinuta]);
  for i:=0 to chkDocumentacionEntregada.Count-1 do
    if chkDocumentacionEntregada.Checked[i] then
      EjecutarSqlSTEx('INSERT INTO EMI.IMD_MINUTADOCUMENTACIONENT(MD_IDMINUTAREUNION, MD_IDDOCUMENTACIONENT)' +
                      ' VALUES(:idminuta, :iddoc) ', [aIdMinuta, chkDocumentacionEntregada.Values[i]]);
end;

procedure TfrmMinutaReunion.ClearControls;
begin
  edContactos.Clear;
  fraUsuario.Clear;
  lstUsuarios.Clear;
  edLugar.Clear;
  edFechaReunion.Clear;
  edHora.Clear;
  chkTemasTratados.UncheckAll;
  chkDocumentacionEntregada.UncheckAll;
end;

procedure TfrmMinutaReunion.ImprimirMinuta;
begin
  with TfrmRptMinutaReunion.Create(self) do
  try
    Imprimir(FIdMinutaReunion);
  finally
    free;
  end;
end;

end.
