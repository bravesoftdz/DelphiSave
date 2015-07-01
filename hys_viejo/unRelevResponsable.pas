unit unRelevResponsable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExComboBox, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, Mask, unComunesFet;

type
  TfrmRelevResponsable = class(TfrmCustomGridABM)
    fraRepresentacion: TfraCodigoDescripcion;
    mskCUIT: TMaskEdit;
    edNombre: TEdit;
    edTitulo: TEdit;
    edMatricula: TEdit;
    edEntidad: TEdit;
    cbResponsableFormulario: TCheckBox;
    lbCargo: TLabel;
    lbRepresentacion: TLabel;
    lbRelacion: TLabel;
    lbCuitCuil: TLabel;
    lbNombre: TLabel;
    lbTitulo: TLabel;
    lbMatricula: TLabel;
    lbEntidad: TLabel;
    ShortCutControl1: TShortCutControl;
    fraCargo: TfraCodigoDescripcion;
    fraRelacion: TfraCodigoDescripcion;
    procedure OnCargoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    FIDCabecera : Integer;
    FContrato: integer;
    FVigencia: String;
    FIdResolucion: Integer;
    FOrigenFormulario: String;
  public
    FModoEmpleador : Boolean;
    procedure Cargar(iIDCabecera, idResolucion : Integer);
    property IDCabecera : Integer read FIDCabecera write FIDCabecera;
    property OrigenFormulario: String read FOrigenFormulario write FOrigenFormulario;
    property Contrato: integer read FContrato write FContrato;
    property Vigencia: String read FVigencia write FVigencia;
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmRelevResponsable: TfrmRelevResponsable;

implementation

uses
  unDmPrincipal, SqlFuncs, ansiSql, VclExtra, CustomDlgs, unSesion, General,
  CUIT;

{$R *.dfm}

{ TfrmRelevResponsable }

procedure TfrmRelevResponsable.Cargar(iIDCabecera, IdResolucion: Integer);
begin
  IDCabecera := iIDCabecera;
  FIdResolucion := idResolucion;
  sdqConsulta.ParamByName('idrelev').AsInteger := IDCabecera;
end;

procedure TfrmRelevResponsable.ClearControls;
begin
  inherited;
  fraCargo.Clear;
  fraRepresentacion.Clear;
  fraRelacion.Clear;
  mskCUIT.Clear;
  edNombre.Clear;
  edTitulo.Clear;
  edMatricula.Clear;
  edEntidad.Clear;
  cbResponsableFormulario.Checked := False;
  OnCargoChange(nil);
end;

function TfrmRelevResponsable.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('rr_id').AsInteger;
      Sql.Fields.Add('rr_usubaja', Sesion.UserID );
      Sql.Fields.Add('rr_fechabaja', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('rr_idrelevriesgolaboral',IDCabecera);
      Sql.Fields.Add('rr_cargo',fraCargo.Codigo);
      Sql.Fields.Add('rr_idrepresentacion',fraRepresentacion.ID);
      Sql.Fields.Add('RR_RELACION',fraRelacion.Codigo);
      Sql.Fields.Add('RR_CUITCUIL',mskCUIT.Text);
      Sql.Fields.Add('RR_NOMBRE',edNombre.Text);
      Sql.Fields.Add('RR_TITULO',edTitulo.Text);
      Sql.Fields.Add('RR_MATRICULA',edMatricula.Text);
      Sql.Fields.Add('RR_ENTIDAD',edEntidad.Text);
      if cbResponsableFormulario.Checked then
        Sql.Fields.Add('RR_RESPONSABLEFORM','S')
      else
        Sql.Fields.Add('RR_RESPONSABLEFORM','N');
      if IsCuit(mskCUIT.Text) or IsCuil(mskCUIT.Text) then
        Sql.Fields.Add('rr_valido','S')
      else
        Sql.Fields.Add('rr_valido','N');

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HRR_RESPID');
        Sql.Fields.Add('rr_usualta', Sesion.UserID );
        Sql.Fields.Add('rr_fechaalta', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('rr_id').AsInteger;
        Sql.Fields.Add('rr_usumodif', Sesion.UserID);
        Sql.Fields.Add('rr_fechamodif', exDateTime );
        Sql.Fields.Add('rr_usubaja', exNull );
        Sql.Fields.Add('rr_fechabaja', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('rr_id', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    if FModoEmpleador then
    begin
      ProcesarObservacionResponsable(IDCabecera, FIdResolucion, FOrigenFormulario);
      ProcesarValidezRelev(IDCabecera, false);
      EjecutarStoreSTEx('hys.do_procesarcumplimiento(:contrato, :vigencia, :tipocarga);', [FContrato, FVigencia, 'R']);
    end;
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
      Rollback(true);
      Result := False;
      ErrorMsg(E, 'Error al guardar los datos.');
    end;
  end;
end;

procedure TfrmRelevResponsable.FormCreate(Sender: TObject);
begin
  sdqConsulta.ParamByName('idrelev').AsInteger := IDCabecera;
  inherited;
  FieldBaja := 'rr_fechabaja';
  Sql.TableName := 'hys.hrr_responsablerelev';
  with fraRepresentacion do
  begin
    TableName   := 'hys.hrs_relevrepresentacion';
    FieldID     := 'rs_id';
    FieldCodigo := 'rs_codigo';
    FieldDesc   := 'rs_descripcion';
    Showbajas   := false;
    FieldBaja   := 'rs_fechabaja';
  end;

  with fraCargo do
  begin
    TableName   := 'hys.hrc_relevcargo';
    FieldID     := 'rc_id';
    FieldCodigo := 'rc_codigo';
    FieldDesc   := 'rc_descripcion';
    Showbajas   := false;
    FieldBaja   := 'rc_fechabaja';
    CaseSensitive := False;
    OnChange    := OnCargoChange;
  end;

  with fraRelacion do
  begin
    TableName   := 'hys.hrr_relevrelacion';
    FieldID     := 'rr_id';
    FieldCodigo := 'rr_codigo';
    FieldDesc   := 'rr_descripcion';
    Showbajas   := false;
    FieldBaja   := 'rr_fechabaja';
    CaseSensitive := False;
  end;
end;

procedure TfrmRelevResponsable.LoadControls;
begin
  inherited;
  ClearControls;
  fraCargo.Codigo := sdqConsulta.FieldByName('rr_cargo').AsString;
  fraRepresentacion.Value := sdqConsulta.FieldByName('rr_idrepresentacion').AsInteger;
  fraRelacion.Codigo := sdqConsulta.FieldByName('RR_RELACION').AsString;
  mskCUIT.Text := sdqConsulta.FieldByName('RR_CUITCUIL').AsString;
  edNombre.Text := sdqConsulta.FieldByName('RR_NOMBRE').AsString;
  edTitulo.Text := sdqConsulta.FieldByName('RR_TITULO').AsString;
  edMatricula.Text := sdqConsulta.FieldByName('RR_MATRICULA').AsString;
  edEntidad.Text := sdqConsulta.FieldByName('RR_ENTIDAD').AsString;
  cbResponsableFormulario.Checked := sdqConsulta.FieldByName('RR_RESPONSABLEFORM').AsString = 'S';
  OnCargoChange(nil);
end;

procedure TfrmRelevResponsable.OnCargoChange(Sender: TObject);
begin
  if fraCargo.Codigo = 'R' then
    vclExtra.LockControls([fraRelacion,edTitulo, edMatricula, edEntidad], True)
  else
    vclExtra.LockControls([fraRelacion,edTitulo, edMatricula, edEntidad], False);
end;

procedure TfrmRelevResponsable.tbRefrescarClick(Sender: TObject);
begin
  //null
end;

function TfrmRelevResponsable.Validar: Boolean;
begin
  Verificar(edNombre.Text = '', edNombre, 'Debe Ingresar el nombre.');
  result := true;
end;

end.
