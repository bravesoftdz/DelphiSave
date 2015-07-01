unit unEstExamPeriodORL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, unFormEstudios, AnsiSql, DB, SDEngine, Mask,
  PatternEdit, IntEdit;

type
  TfrmEstExamenORL = class(TFormEstudios)
    pnlBotones: TPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label35: TLabel;
    Panel16: TPanel;
    rbtEO_DATANTIGTIPO_Titu: TRadioButton;
    rbtEO_DATANTIGTIPO_Prov: TRadioButton;
    rbtEO_DATANTIGTIPO_Sup: TRadioButton;
    Panel19: TPanel;
    rbtEO_DATNIVEDUCFIN_PPRI: TRadioButton;
    rbtEO_DATNIVEDUCFIN_PRI: TRadioButton;
    rbtEO_DATNIVEDUCFIN_SEC: TRadioButton;
    rbtEO_DATNIVEDUCFIN_TER: TRadioButton;
    rbtEO_DATNIVEDUCFIN_UNI: TRadioButton;
    Label7: TLabel;
    Panel2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Panel8: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Panel9: TPanel;
    rbtEO_HABALCOHOL_N: TRadioButton;
    Panel3: TPanel;
    rbtEO_HABFUMA_S: TRadioButton;
    rbtEO_HABFUMA_N: TRadioButton;
    Panel4: TPanel;
    rbtEO_HABMEDIC_S: TRadioButton;
    rbtEO_HABMEDIC_N: TRadioButton;
    Panel5: TPanel;
    rbtEO_ACTVOZ_S: TRadioButton;
    rbtEO_ACTVOZ_N: TRadioButton;
    edEO_ACTVOZDESC: TEdit;
    edEO_HABMEDICDESC: TEdit;
    Label20: TLabel;
    Panel15: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;     
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    edEO_ANTRESP: TMemo;
    edEO_ANTALER: TMemo;
    edEO_ANTQUIRUR: TMemo;
    edEO_ANTTIROID: TMemo;
    Panel7: TPanel;
    rbtEO_ANTHERNIA_S: TRadioButton;
    rbtEO_ANTHERNIA_N: TRadioButton;
    Panel10: TPanel;
    rbtEO_ANTGASTRO_S: TRadioButton;
    rbtEO_ANTGASTRO_N: TRadioButton;
    edEO_ANTDIGEST: TMemo;
    Panel11: TPanel;
    rbtEO_ANTLARING_S: TRadioButton;
    rbtEO_ANTLARING_N: TRadioButton;
    Panel12: TPanel;
    rbtEO_ANTDISTONIA_S: TRadioButton;
    rbtEO_ANTDISTONIA_N: TRadioButton;
    edEO_ANTDISTODESDE: TMemo;
    edEO_ANTOTRAS: TMemo;
    edEO_ANTNODULOS: TMemo;
    edEO_ANTPOLIPOS: TMemo;
    edEO_ANTLARINGDESDE: TMemo;
    edEO_ANTCARACSUBVOZ: TMemo;
    Label30: TLabel;
    Panel6: TPanel;
    Label38: TLabel;
    Label39: TLabel;
    edEO_EXAASPECTOLARINGE: TMemo;
    edEO_SERVTELEDESC: TMemo;
    edEO_HABFUMACANT: TIntEdit;
    sdqDatos: TSDQuery;
    edEO_EXAOBSERV: TMemo;
    rbtEO_HABALCOHOL_S: TRadioButton;
    edEO_DATANTIG: TIntEdit;
    edEO_DATCARGADIARIA: TIntEdit;
    edEO_DATCARGASEMAN: TIntEdit;
    edEO_DATNIVEDUC: TIntEdit;
    edEO_DATCARGAHORA: TIntEdit;
    Label33: TLabel;
    edEO_DIAGSUG: TMemo;
    edEO_ANTOTROS: TEdit;
    edEO_DATANTIGOTROS: TIntEdit;
    Panel13: TPanel;
    rbtEO_NORMAL_S: TRadioButton;
    rbtEO_NORMAL_A: TRadioButton;
    Normal: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta:
        Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure rbtEO_NORMAL_SClick(Sender: TObject);
    procedure edEO_HABMEDICDESCExit(Sender: TObject);
  private
    FModoABM: TModoABM;
    FEO_AETID: Integer;
    procedure SetModoABM(const Value: TModoABM);
    function GetModoABM: TModoABM;
    function GetAETID: integer;
    procedure SetAETID(const Value: integer);
  public
    procedure CargarDatos;
    function VerificarDatos: Boolean;
    property AETID: integer read GetAETID write SetAETID;
    property Modo: TModoABM read GetModoABM write SetModoABM;
  end;


var
  frmEstExamenORL: TfrmEstExamenORL;

implementation

uses
  undmPrincipal, SqlFuncs, unSesion, unComunes, CustomDlgs;


{$R *.dfm}

procedure TfrmEstExamenORL.btnAceptarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if VerificarDatos then
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

      Sql := TSql.Create('ART.AEO_ESTORL');
      if Self.Modo = maAdd then
      begin
        Sql.SqlType := stInsert;
        Sql.PrimaryKey.AddInteger('EO_AETID', CurrAETID);
        Sql.Fields.AddString('EO_USUALTA', Sesion.UserID);
        Sql.Fields.Add('EO_FECHAALTA', exDate);
      end else
      begin
        Sql.PrimaryKey.AddInteger('EO_AETID', FEO_AETID);
        Sql.Fields.AddString('EO_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('EO_FECHAMODIF', exDate);
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
end;

procedure TfrmEstExamenORL.CargarDatos;
begin
  sdqDatos.ParamByName('AETID').AsInteger := FEO_AETID;
  sdqDatos.Open;
  DatosFormularioClear(Self);
  DatosFormularioLeer(Self, sdqDatos);
end;

procedure TfrmEstExamenORL.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then btnCancelar.Click;
end;

procedure TfrmEstExamenORL.FormShow(Sender: TObject);
begin
  edEO_DATANTIG.SetFocus;
  if Self.Modo = maUpdate then
  begin
    CargarDatos;
  end;
end;

function TfrmEstExamenORL.GetModoABM: TModoABM;
begin
  Result := FModoABM;
end;

function TfrmEstExamenORL.GetAETID: integer;
begin
  Result := FEO_AETID;
end;

procedure TfrmEstExamenORL.SetAETID(const Value: integer);
begin
  FEO_AETID := Value;
end;

procedure TfrmEstExamenORL.SetModoABM(const Value: TModoABM);
begin
  FModoABM := Value;
end;

procedure TfrmEstExamenORL.FormMouseWheel(Sender: TObject; Shift:
    TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  code: Cardinal;
begin
 if WheelDelta > 0 then
    code := SB_LINEUP
  else
    code := SB_LINEDOWN;

  ScrollBox.Perform(WM_VSCROLL, CODE, 0);
  ScrollBox.Perform(WM_VSCROLL, CODE, 0)
end;

function TfrmEstExamenORL.VerificarDatos: Boolean;
begin
  Verificar(not rbtEO_NORMAL_S.Checked and not rbtEO_NORMAL_A.Checked,rbtEO_NORMAL_S,'Debe seleccionar si es normal o no.');
  if rbtEO_NORMAL_A.Checked then
    Verificar(edEO_EXAASPECTOLARINGE.Text = '',edEO_EXAASPECTOLARINGE,'Debe completar el Aspecto anatómico de la laringe.');
  Result := True;
{  Result := VerificarMultiple(
      ['Error de validación de datos.',
//      edEO_ANTRESP,
//      edEO_ANTRESP.Text <> EmptyStr,
//      'Dato Antecedentes Respiratorios debe ser completado.',

//      edEO_ANTALER,
//      edEO_ANTALER.Text <> EmptyStr,
//      'Dato Antecedentes Alérgicos debe ser completado.',

//      edEO_ANTQUIRUR,
//      edEO_ANTQUIRUR.Text <> EmptyStr,
//      'Dato Antecedentes Quirúrgicos debe ser completado.',

//      edEO_ANTDIGEST,
//      edEO_ANTDIGEST.Text <> EmptyStr,
//      'Dato Antecedentes Digestivos debe ser completado.',

//      rbtEO_ANTHERNIA_N,
//      ((rbtEO_ANTHERNIA_S.Checked) and (not rbtEO_ANTHERNIA_N.Checked) or
//      ( not rbtEO_ANTHERNIA_S.Checked) and (rbtEO_ANTHERNIA_N.Checked)),
//      'Dato Antecedentes Hernia hiatal debe ser completado.',

//      rbtEO_ANTGASTRO_N,
//      ((rbtEO_ANTGASTRO_S.Checked) and (not rbtEO_ANTGASTRO_N.Checked) or
//       (not rbtEO_ANTGASTRO_S.Checked) and (rbtEO_ANTGASTRO_N.Checked)),
//      'Dato Antecedentes Reflujo gastroesofágico debe ser completado.',

//      edEO_ANTTIROID,
//      edEO_ANTTIROID.Text <> EmptyStr,
//      'Dato Antecedentes Tiróideos debe ser completado.',

//      rbtEO_ANTDISTONIA_N,
//      ((rbtEO_ANTDISTONIA_S.Checked) and (not rbtEO_ANTDISTONIA_N.Checked) or
//       (not rbtEO_ANTDISTONIA_S.Checked) and (rbtEO_ANTDISTONIA_N.Checked)),
//      'Dato Distonía funcional debe ser completado.',

//      edEO_ANTDISTODESDE,
//      not ((rbtEO_ANTDISTONIA_S.Checked) and (edEO_ANTDISTODESDE.Text = EmptyStr)),
//      'Dato Antecedentes Distonía funcional "Desde" debe ser completado.',

//      rbtEO_ANTLARING_N,
//      ((rbtEO_ANTLARING_S.Checked) and (not rbtEO_ANTLARING_N.Checked) or
//       (not rbtEO_ANTLARING_S.Checked) and (rbtEO_ANTLARING_N.Checked)),
//      'Dato Antecedentes Laringitis crónica debe ser completado.',

//      edEO_ANTLARINGDESDE,
//      not ((rbtEO_ANTLARING_S.Checked) and (edEO_ANTLARINGDESDE.Text = EmptyStr)),
//      'Dato Antecedentes Laringitis crónica "Desde" debe ser completado.',

//      edEO_ANTPOLIPOS,
//      edEO_ANTPOLIPOS.Text <> EmptyStr,
//      'Dato Antecedentes Pólipos debe ser completado.',

//      edEO_ANTPOLIPOS,
//      edEO_ANTPOLIPOS.Text <> EmptyStr,
//      'Dato Antecedentes Pólipos debe ser completado.',

//      edEO_ANTNODULOS,
//      edEO_ANTNODULOS.Text <> EmptyStr,
//      'Dato Antecedentes Nódulos debe ser completado.',

//      edEO_ANTCARACSUBVOZ,
//      edEO_ANTCARACSUBVOZ.Text <> EmptyStr,
//      'Dato Antecedentes Características subjetivas de la voz debe ser completado.',

//      edEO_EXAASPECTOLARINGE,
//      edEO_EXAASPECTOLARINGE.Text <> EmptyStr,
//      'Dato Examen ORL Aspecto anatómico de la laringe debe ser completado.',

//      edEO_EXAOBSERV,
//      edEO_EXAOBSERV.Text <> EmptyStr,
//      'Dato Examen ORL Ovservaciones debe ser completado.'
      ]
  );
  //Habitos
  Verificar(not(rbtEO_HABALCOHOL_S.Checked or rbtEO_HABALCOHOL_N.Checked),rbtEO_HABALCOHOL_S,'Debe indicar si toma Alcohol.');
  Verificar(not(rbtEO_HABFUMA_S.Checked or rbtEO_HABFUMA_N.Checked),rbtEO_HABFUMA_S,'Debe indicar si Fuma.');
  Verificar(rbtEO_HABFUMA_S.Checked and (edEO_HABFUMACANT.Text = ''),edEO_HABFUMACANT,'Debe indicar la cantidad que fuma.');
  Verificar(not(rbtEO_HABMEDIC_S.Checked or rbtEO_HABMEDIC_N.Checked),rbtEO_HABMEDIC_S,'Debe indicar si Toma Medicación.');
  Verificar(rbtEO_HABMEDIC_S.Checked and (edEO_HABMEDICDESC.Text = ''),edEO_HABMEDICDESC,'Debe indicar que medicación toma.');
  Verificar(not(rbtEO_ACTVOZ_S.Checked or rbtEO_ACTVOZ_N.Checked),rbtEO_ACTVOZ_S,'Debe indicar si hay otras actividades con esfuerzo de voz.');
  Verificar(rbtEO_ACTVOZ_S.Checked and (edEO_ACTVOZDESC.Text = ''),edEO_ACTVOZDESC,'Debe completar la descripción de la actividad.');

  //ANTECEDENTES
  Verificar(edEO_ANTOTRAS.Text = '', edEO_ANTOTRAS, 'Debe completar antecedentes otras.');

  //EXAMEN ORL
  Verificar(edEO_DIAGSUG.Text = '',edEO_DIAGSUG, 'Debe completar el diagnostico y sugerencias.');
}

end;

procedure TfrmEstExamenORL.rbtEO_NORMAL_SClick(Sender: TObject);
begin
  if rbtEO_NORMAL_S.Checked then
    btnAceptar.SetFocus;

end;

procedure TfrmEstExamenORL.edEO_HABMEDICDESCExit(Sender: TObject);
begin
  //
  edEO_ANTCARACSUBVOZ.SetFocus;
end;

end.
