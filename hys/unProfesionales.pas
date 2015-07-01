unit unProfesionales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, IntEdit, Mask, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, PatternEdit, StdCtrls, ExComboBox, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmProfesionales = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblNombre: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edNombre: TEdit;
    cbTipoMatricula: TExComboBox;
    edNroMatricula: TPatternEdit;
    edTitulo: TEdit;
    edInstOtorgante: TEdit;
    fraTipoServicio: TfraCodigoDescripcion;
    fraTipoDoc: TfraStaticCTB_TABLAS;
    edDocumento: TMaskEdit;
    edCantHoras: TIntEdit;
    tbInformarFaltanteProfesional: TToolButton;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbInformarFaltanteProfesionalClick(Sender: TObject);
  private
    FIDInforme :Integer;
    { Private declarations }
    procedure setIDInforme(Value : Integer);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
    property IDInforme : Integer read FIDInforme write setIDInforme;
  end;

var
  frmProfesionales: TfrmProfesionales;

implementation

uses unSesion, sqlFuncs, unDmPrincipal, CustomDlgs, Strfuncs,
  unCustomConsulta, Cuit, AnsiSql, unComunesFet;

{$R *.dfm}

procedure TfrmProfesionales.ClearControls;
begin
  fraTipoDoc.Clear;
  edDocumento.Clear;
  edNombre.Clear;
  cbTipoMatricula.ItemIndex := -1;
  edNroMatricula.Clear;
  edInstOtorgante.Clear;
  edTitulo.Clear;
  fraTipoServicio.Clear;
  edCantHoras.Clear;
end;

function TfrmProfesionales.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('PR_ID').AsInteger;
      Sql.Fields.Add('PR_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('PR_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('PR_TIPODOCUMENTO', fraTipoDoc.Codigo);
      Sql.Fields.Add('PR_DOCUMENTO', edDocumento.Text);
      Sql.Fields.Add('PR_NOMBRE', edNombre.Text);
      Sql.Fields.Add('PR_TIPOMATRICULA', cbTipoMatricula.Value);
      Sql.Fields.Add('PR_NROMATRICULA', edNroMatricula.Text);
      Sql.Fields.Add('PR_INSTOTORGANTE', edInstOtorgante.Text);
      Sql.Fields.Add('PR_TITULO', edTitulo.Text);
      Sql.Fields.Add('PR_TIPOSERVICIO', fraTipoServicio.Codigo);
      Sql.Fields.Add('PR_CANTHORAS', edCantHoras.Text);
      Sql.Fields.Add('PR_IDINFORME', IDInforme);

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HPR_PROF_ID');
        Sql.Fields.Add('PR_USUALTA', Sesion.UserID );
        Sql.Fields.Add('PR_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('PR_ID').AsInteger;
        Sql.Fields.Add('PR_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('PR_FECHAMODIF', exDateTime );
        Sql.Fields.Add('PR_USUBAJA', exNull );
        Sql.Fields.Add('PR_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('PR_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       ErrorMsg(E, 'Error al guardar profesionales.');
    end;
  end;
end;

procedure TfrmProfesionales.FormCreate;
begin
  inherited;
  FieldBaja := 'PR_FECHABAJA';
  Sql.TableName := 'HYS.HPR_PROFESIONALES';
  sdqConsulta.ParamByName('IDInforme').AsInteger := 0;
  with fraTipoServicio do
  begin
    TableName := 'HYS.HTS_TIPOSERVICIO';
    FieldID     := 'ts_id';
    FieldCodigo := 'ts_id';
    FieldDesc   := 'ts_descripcion';
    FieldBaja   := 'ts_fechabaja';
    Showbajas   := false;
  end;
  fraTipoDoc.Clave := 'TDOCN';
end;

procedure TfrmProfesionales.LoadControls;
begin
  inherited;
  ClearControls;
  fraTipoDoc.Codigo := sdqConsulta.FieldByName('PR_TIPODOCUMENTO').AsString;
  edDocumento.Text := sdqConsulta.FieldByName('PR_DOCUMENTO').AsString;
  edNombre.Text := sdqConsulta.FieldByName('PR_NOMBRE').AsString;
  cbTipoMatricula.Value := sdqConsulta.FieldByName('PR_TIPOMATRICULA').AsString;
  edNroMatricula.Text := sdqConsulta.FieldByName('PR_NROMATRICULA').AsString;
  edInstOtorgante.Text := sdqConsulta.FieldByName('PR_INSTOTORGANTE').AsString;
  edTitulo.Text := sdqConsulta.FieldByName('PR_TITULO').AsString;
  fraTipoServicio.Codigo := sdqConsulta.FieldByName('PR_TIPOSERVICIO').AsString;
  edCantHoras.Text := sdqConsulta.FieldByName('PR_CANTHORAS').AsString;
end;

procedure TfrmProfesionales.setIDInforme(Value: Integer);
begin
  FIDInforme := Value;
  sdqConsulta.close;
  sdqConsulta.ParamByName('IDINFORME').AsInteger := Value;
  sdqConsulta.Open;
end;

function TfrmProfesionales.Validar : Boolean;
begin
  Verificar(not fraTipoDoc.IsSelected,fraTipoDoc, 'Debe especificar un Tipo de Documento.');
  Verificar( IsEmptyString(edDocumento.Text),edDocumento, 'Debe completar el CUIL.');
  Verificar(not IsCuil(edDocumento.Text), edDocumento,'Debe completar con un Cuil válido.');
  Verificar( IsEmptyString(edNombre.Text),edNombre, 'Debe completar el nombre.');
  Verificar( cbTipoMatricula.ItemIndex = -1,cbTipoMatricula, 'Debe especificar un Tipo de Matricula.');
  Verificar( IsEmptyString(edNroMatricula.Text),edNroMatricula, 'Debe completar Nro. Matricula.');
  Verificar( IsEmptyString(edInstOtorgante.Text),edInstOtorgante, 'Debe completar Instituto Otorgante.');
  Verificar( IsEmptyString(edTitulo.Text),edTitulo, 'Debe completar el título.');
  Verificar( IsEmptyString(edCantHoras.Text),edCantHoras, 'Debe la cantidad de horas.');
  Result := True;
end;


procedure TfrmProfesionales.tbInformarFaltanteProfesionalClick(
  Sender: TObject);
var
  Cuit : String;
  IdEstableci : Integer;
  NroInforme : Integer;
  tipoInforme : String;
begin
  with GetQuery(
    ' SELECT in_nroinforme, in_cuit, in_idestableci,in_tipoinforme '+
    '   FROM hys.hin_informe '+
    '  WHERE in_id = '+SqlValue(IDInforme)) do
  try
    Cuit := FieldByName('in_cuit').AsString;
    IdEstableci := FieldByName('in_idestableci').AsInteger;
    NroInforme := FieldByName('in_nroinforme').AsInteger;
    if FieldByName('in_tipoinforme').AsString = 'A' then
      tipoInforme := 'Accidentes Mayores'
    else
      tipoInforme := 'Difenilos';
  finally
    Free;
  end;

  DenunciaDatosIncompletos(Cuit,IdEstableci,NroInforme,'Profesionales',tipoInforme);
end;

end.
