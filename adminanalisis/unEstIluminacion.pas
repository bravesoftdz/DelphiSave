unit unEstIluminacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, unFormEstudios, AnsiSql, DB, SDEngine;

type
  TfrmEstIluminacion = class(TFormEstudios)
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edEI_ANTEENFERMEDAD: TMemo;
    edEI_ANTETRASTCONEGNITO: TMemo;
    edEI_ANTEENFPROFACCI: TMemo;
    edEI_ANTEOBS: TMemo;
    Label9: TLabel;
    Panel3: TPanel;
    rbtEI_CLICEFALEAS_S: TRadioButton;
    rbtEI_CLICEFALEAS_N: TRadioButton;
    Panel4: TPanel;
    rbtEI_CLIVISIONDBL_S: TRadioButton;
    rbtEI_CLIVISIONDBL_N: TRadioButton;
    Panel5: TPanel;
    rbtEI_CLIVERTIGO_S: TRadioButton;
    rbtEI_CLIVERTIGO_N: TRadioButton;
    Panel6: TPanel;
    rbtEI_CLICONJUNTIV_S: TRadioButton;
    rbtEI_CLICONJUNTIV_N: TRadioButton;
    Panel7: TPanel;
    rbtEI_CLIVISIONBORRO_S: TRadioButton;
    EI_CLIVISIONBORRO_N: TRadioButton;
    edEI_CLIDESCCEFALEAS: TEdit;
    edEI_CLIDESCVISIONDBL: TEdit;
    edEI_CLIDESCVERETIGO: TEdit;
    edEI_CLIDESCCONJUNTIV: TEdit;
    edEI_CLIDESCVISIONBORRO: TEdit;
    Panel8: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Panel9: TPanel;
    rbtEI_OCUOJOCENTRADO_S: TRadioButton;
    rbtEI_OCUOJOCENTRADO_N: TRadioButton;
    Panel10: TPanel;
    rbtEI_OCUCONJUNTIVAS_N: TRadioButton;
    rbtEI_OCUCONJUNTIVAS_A: TRadioButton;
    Panel11: TPanel;
    rbtEI_OCUMOTILIDAD_N: TRadioButton;
    rbtEI_OCUMOTILIDAD_A: TRadioButton;
    Panel12: TPanel;
    rbtEI_OCUPUPILAS_N: TRadioButton;
    rbtEI_OCUPUPILAS_A: TRadioButton;
    Panel13: TPanel;
    rbtEI_OCUCORNEAS_N: TRadioButton;
    rbtEI_OCUCORNEAS_A: TRadioButton;
    Panel14: TPanel;
    rbtEI_OCUNISTAGMUS_P: TRadioButton;
    rbtEI_OCUNISTAGMUS_A: TRadioButton;
    Label20: TLabel;
    Panel15: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Panel16: TPanel;
    rbtEI_ANTETRABANTDEFILU_S: TRadioButton;
    rbtEI_ANTETRABANTDEFILU_N: TRadioButton;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edEI_AGUOJODSINCORR: TEdit;
    EI_AGUOJOISINCORR: TEdit;
    EI_AGUOJODCONCORR: TEdit;
    EI_AGUOJOICONCORR: TEdit;
    Label27: TLabel;
    Panel17: TPanel;
    rbtEI_PROTPERSONAL_OB: TRadioButton;
    rbtEI_PROTPERSONAL_OP: TRadioButton;
    rbtEI_PROTPERSONAL_NP: TRadioButton;
    Label28: TLabel;
    edEI_PROTTIPO: TEdit;
    Label29: TLabel;
    Panel18: TPanel;
    rbtEI_PROTIMPOSIBILITA_S: TRadioButton;
    rbtEI_PROTIMPOSIBILITA_N: TRadioButton;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    pnlBotones: TPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    sdqDatos: TSDQuery;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    FEI_AETID: integer;
    FModoABM: TModoABM;
    function GetModoABM: TModoABM;
    function GetAETID: integer;
    procedure SetAETID(const Value: integer);
    procedure SetModoABM(const Value: TModoABM);
  public
    procedure CargarDatos;
    property AETID: integer read GetAETID write SetAETID; 
    property Modo: TModoABM read GetModoABM write SetModoABM;
  end;


var
  frmEstIluminacion: TfrmEstIluminacion;

implementation

uses
  undmPrincipal, SqlFuncs, unSesion, unComunes, CustomDlgs;


{$R *.dfm}

procedure TfrmEstIluminacion.btnAceptarClick(Sender: TObject);
var
  Sql: TSql;
begin
  try
    BeginTrans;
    SaveResult(0,
        trNone,
        DatosEstudio.Prestador,
        DatosEstudio.Periodo,
        DatosEstudio.PerAnterior,
        DatosEstudio.Reconfirmacion.Carpeta,
        DatosEstudio.IDDetalleArchivo,
        DatosEstudio.CarpetaPendiente,
        DatosEstudio.Tipo,
        DatosEstudio.Reconfirmacion,
        DatosEstudio.FechaRecPrest,
        DatosEstudio.FechaRecML,
        DatosEstudio.Observaciones,
        DatosEstudio.AdicEst
    );

    Sql := TSql.Create('ART.AEI_ESTILUMINACION');
    if Self.Modo = maAdd then
    begin
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.AddInteger('EI_AETID', CurrAETID);
      Sql.Fields.AddString('EI_USUALTA', Sesion.UserID);
      Sql.Fields.Add('EI_FECHAALTA', exDate);
    end else
    begin
      Sql.PrimaryKey.AddInteger('EI_AETID', FEI_AETID);
      Sql.Fields.AddString('EI_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('EI_FECHAMODIF', exDate);
    end;

    DatosFormularioGuardar(
        Self,
        Sql,
        GetQuery('SELECT * FROM ' + SQL.TableName + ' WHERE ROWNUM = 0').FieldList
    );

    EjecutarSqlST(Sql.Sql);
    CommitTrans;
    DatosFormularioClear(Self);
    ModalResult := mrOK;
  except
    on E: Exception do begin
      Rollback;
      ErrorMsg(E);
    end;
  end;
end;

procedure TfrmEstIluminacion.CargarDatos;
begin
  sdqDatos.ParamByName('AETID').AsInteger := FEI_AETID;
  sdqDatos.Open;
  DatosFormularioClear(Self);
  DatosFormularioLeer(Self, sdqDatos);
end;

procedure TfrmEstIluminacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then btnCancelar.Click;
end;

procedure TfrmEstIluminacion.FormShow(Sender: TObject);
begin
  edEI_ANTEENFERMEDAD.SetFocus;
  if Self.Modo = maUpdate then
  begin
    CargarDatos;
  end;
end;

function TfrmEstIluminacion.GetModoABM: TModoABM;
begin
  Result := FModoABM;
end;

function TfrmEstIluminacion.GetAETID: integer;
begin
  Result := FEI_AETID;
end;

procedure TfrmEstIluminacion.SetAETID(const Value: integer);
begin
  FEI_AETID := Value;
end;

procedure TfrmEstIluminacion.SetModoABM(const Value: TModoABM);
begin
  FModoABM := Value;
end;

end.
