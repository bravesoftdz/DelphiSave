unit unAltaNotaSRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Mask, ToolEdit, DateComboBox, IntEdit,
  StdCtrls, unArtDbFrame, unFraEmpresa, unArtFrame, unFraCodigoDescripcion, unfraCtbTablas, ExtCtrls, ComCtrls, ToolWin,
  PatternEdit, unArtDBAwareFrame, unArt;

type
  Funciones = (fNuevo, fModificarNota, fModificarRespuesta, fConsulta);

  TfrmAltaNotaSRT = class(TForm)
    ToolBar1: TToolBar;
    tbfpLimpiar: TToolButton;
    tbfpGrabar: TToolButton;
    tbfpSalir: TToolButton;
    Panel1: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lbContrato: TLabel;
    fraTipoNota: TfraCtbTablas;
    fraEmpresa: TfraEmpresa;
    edNota: TMemo;
    edNroReferencia: TIntEdit;
    Panel2: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    edRespuestaSRT: TMemo;
    cmbFechaRespuesta: TDateComboBox;
    Label1: TLabel;
    cmbFechaRecepcion: TDateComboBox;
    edNroEntradaSRT: TIntEdit;
    Label2: TLabel;
    procedure tbfpLimpiarClick(Sender: TObject);
    procedure tbfpGrabarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbfpSalirClick(Sender: TObject);
  private
    FFuncion: Funciones;
    FIdNota: TTableId;

    procedure ActualizarNota;
    procedure ActualizarRespuesta;
    procedure InsertarNota;
    procedure SetFuncion(const Value: Funciones);
    procedure Validar(Nota, Respuesta: Boolean);
  public
    procedure CargarDatos(aIdNota: TTableId);

    property Funcion: Funciones read FFuncion write SetFuncion;
  end;

var
  frmAltaNotaSRT: TfrmAltaNotaSRT;

implementation

uses
  unPrincipal, CustomDlgs, unDmPrincipal, AnsiSQL, SQLFuncs, VCLExtra, SDEngine;

{$R *.DFM}

procedure Verificar(aCondicion: Boolean; aControl: TWinControl; aText: String);
begin
  if aCondicion then
  begin
    InvalidMsg(aControl, aText);
    Abort;
  end;
end;

procedure TfrmAltaNotaSRT.tbfpLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  fraTipoNota.Clear;
  edNroReferencia.Clear;
  edNota.Clear;
  cmbFechaRespuesta.Clear;
  edRespuestaSRT.Clear;
end;

procedure TfrmAltaNotaSRT.tbfpGrabarClick(Sender: TObject);
begin
  case Funcion of
    fNuevo:
    begin
      Validar(True, False);
      InsertarNota;
    end;
    fModificarNota:
    begin
      Validar(True, False);
      ActualizarNota;
    end;
    fModificarRespuesta:
    begin
      Validar(False, True);
      ActualizarRespuesta;
    end;
  end;
  tbfpSalirClick(Sender);
end;

procedure TfrmAltaNotaSRT.CargarDatos(aIdNota: TTableId);
var
  sSql: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM ans_notasrt' +
    ' WHERE ns_id = :id';

  with GetQueryEx(sSql, [aIdNota]) do
  try
    FIdNota                := FieldByName('ns_id').AsInteger;
    fraEmpresa.Contrato    := FieldByName('ns_contrato').AsInteger;
    fraTipoNota.Value      := FieldByName('ns_tiponota').AsString;
    edNroReferencia.Value  := FieldByName('ns_nroreferencia').AsInteger;
    edNota.Text            := FieldByName('ns_nota').AsString;
    cmbFechaRespuesta.Date := FieldByName('ns_fecharespuesta').AsDateTime;
    edRespuestaSRT.Text    := FieldByName('ns_descripcionrespuesta').AsString;
    
    if FieldByName('ns_fecharecepcionsrt').AsString <> '' then
      cmbFechaRecepcion.Date := FieldByName('ns_fecharecepcionsrt').AsDateTime;

    if FieldByName('ns_nroentradasrt').AsString <> '' then
      edNroEntradaSRT.Value := FieldByName('ns_nroentradasrt').AsInteger;
  finally
    Free;
  end;
end;

procedure TfrmAltaNotaSRT.Validar(Nota, Respuesta: Boolean);
begin
  if Nota then
  begin
    Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'Los datos de la empresa son obligatorios.');
    Verificar(fraTipoNota.IsEmpty, fraTipoNota, 'El tipo de nota es obligatorio.');
    Verificar((edNota.Text = ''), edNota, 'El texto de la nota es obligatorio.');
  end;

  if Respuesta then
  begin
    Verificar(cmbFechaRespuesta.IsEmpty, cmbFechaRespuesta, 'La fecha de respuesta es obligatoria.');
    Verificar(cmbFechaRecepcion.IsEmpty, cmbFechaRecepcion, 'La fecha de recepción es obligatoria.');
    Verificar(edNroEntradaSRT.IsEmpty, edNroEntradaSRT,     'El número de entrada de la SRT es obligatoria.');
    Verificar((edRespuestaSRT.Text = ''), edRespuestaSRT,     'El texto de la respuesta es obligatorio.');
  end;
end;

procedure TfrmAltaNotaSRT.InsertarNota;
var
  iNroRef: Integer;
begin
  with TSql.Create('ans_notasrt') do
  try
    iNroRef := ValorSqlInteger('SELECT MAX(ns_nroreferencia) + 1 FROM ans_notasrt', 1);

    SqlType := stInsert;
    PrimaryKey.Add('ns_id',        'SEQ_ANS_ID.NEXTVAL', False);
    Fields.Add('ns_tiponota',      fraTipoNota.Value);
    Fields.Add('ns_contrato',      fraEmpresa.edContrato.Value);
    Fields.Add('ns_nota',          edNota.Text);
    Fields.Add('ns_nroreferencia', iNroRef, False);
    Fields.Add('ns_usualta',       frmPrincipal.DBLogin.UserId);
    Fields.Add('ns_fechaalta',     SQL_ACTUALDATE, False);
    try
      EjecutarSql(Sql);
      edNroReferencia.Value := iNroRef;
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
  finally
    Free;
  end;
end;

procedure TfrmAltaNotaSRT.ActualizarNota;
begin
  with TSql.Create('ans_notasrt') do
  try
    SqlType := stUpdate;

    PrimaryKey.Add('ns_id',        FIdNota, False);
    Fields.Add('ns_tiponota',      fraTipoNota.Value);
    Fields.Add('ns_contrato',      fraEmpresa.edContrato.Value);
    Fields.Add('ns_nota',          edNota.Text);
    Fields.Add('ns_nroreferencia', edNroReferencia.Value);
    Fields.Add('ns_usumodif',      frmPrincipal.DBLogin.UserId);
    Fields.Add('ns_fechamodif',    SQL_ACTUALDATE, False);
    try
      EjecutarSql(Sql);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
  finally
    Free;
  end;
end;

procedure TfrmAltaNotaSRT.FormCreate(Sender: TObject);
begin
  inherited;

  fraTipoNota.Clave := 'NOSRT';
  FIdNota := ART_EMPTY_ID;
  FFuncion := fNuevo;
  VCLExtra.LockControls([edNroReferencia], True);
  VCLExtra.LockControls([cmbFechaRecepcion, edNroEntradaSRT], True);
  fraEmpresa.ShowBajas := True;
end;

procedure TfrmAltaNotaSRT.SetFuncion(const Value: Funciones);
begin
  FFuncion := Value;

  if Value = fNuevo then
  begin
    Caption := 'Nueva Nota a la SRT';
    VCLExtra.LockControls(Panel1, False);
    VCLExtra.LockControls(Panel2, True);
    Height := Panel1.Top + Panel1.Height;
  end
  else if Value = fModificarRespuesta then
  begin
    Caption := 'Modificación de Respuesta de la SRT';
    VCLExtra.LockControls(Panel1, True);
    VCLExtra.LockControls(Panel2, False);
    Height := Panel2.Top + Panel2.Height;
  end
  else if Value = fModificarNota then
  begin
    Caption := 'Modificación de Nota a la SRT';
    VCLExtra.LockControls(Panel1, True);
    VCLExtra.LockControls(Panel2, False);
    Height := Panel1.Top + Panel1.Height;
  end
  else if Value = fConsulta then
  begin
    Caption := 'Consulta de Nota a la SRT';
    VCLExtra.LockControls(Panel1, True);
    VCLExtra.LockControls(Panel2, True);
    tbfpGrabar.Enabled := False;
    tbfpLimpiar.Enabled := False;
    Height := Panel1.Top + Panel1.Height;
  end;
end;

procedure TfrmAltaNotaSRT.tbfpSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAltaNotaSRT.ActualizarRespuesta;
begin
  with TSql.Create('ans_notasrt') do
  try
    SqlType := stUpdate;
    PrimaryKey.Add('ns_id', FIdNota, False);

    Fields.Add('ns_nroentradasrt',        edNroEntradaSRT.Value);
    Fields.Add('ns_fecharecepcionsrt',    cmbFechaRecepcion.Date);
    Fields.Add('ns_fecharespuesta',       cmbFechaRespuesta.Date);
    Fields.Add('ns_descripcionrespuesta', edRespuestaSRT.Text);
    try
      EjecutarSql(Sql);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
  finally
    Free;
  end;
end;

end.
