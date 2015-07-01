unit unfrmObservacionesNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, StdCtrls, DB,
  SDEngine, RxRichEd, unDmPrincipal, AnsiSql, unConstEmision, unFuncionesEmision;

type
  TfrmObservacionesNota = class(TForm)
    dbgObservaciones: TRxDBGrid;
    btnCerrar: TButton;
    dbgAcciones: TRxDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    dsAcciones: TDataSource;
    sdqAcciones: TSDQuery;
    dsObservaciones: TDataSource;
    sdqObservaciones: TSDQuery;
    edObservacion: TRxRichEdit;
    procedure sdqObservacionesAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqAccionesAfterScroll(DataSet: TDataSet);
  private
    FIdNotaContratoPeriodo: integer;
    FNotaAplicada: boolean;
    procedure SetIdNotaContratoPeriodo(const Value: integer);
  public
    property IdNotaContratoPeriodo: integer read FIdNotaContratoPeriodo write SetIdNotaContratoPeriodo;
    property NotaAplicada: boolean read FNotaAplicada write FNotaAplicada;
  end;

var
  frmObservacionesNota: TfrmObservacionesNota;

implementation

{$R *.dfm}

{ TfrmObservacionesNota }

procedure TfrmObservacionesNota.SetIdNotaContratoPeriodo(
  const Value: integer);
begin
  FIdNotaContratoPeriodo := Value;
  sdqObservaciones.ParamByName('aidnotaperiodo1').Value := Value;
  sdqObservaciones.ParamByName('aidnotaperiodo2').Value := Value;
  sdqObservaciones.Open;
  if sdqObservaciones.IsEmpty then
  begin
    edObservacion.Lines.Clear;
    edObservacion.Lines.Add(GetObservacionGenerica(FIdNotaContratoPeriodo));
//    edObservacion.Lines.Add('La Declaración Jurada presentada con los siguientes datos: Cantidad de Empleados:XX, Masa Salarial: XX, de manera Original/Rectificativa, para el periodo XX, es anterior a la Declaración Jurada que tenemos.');
  end;
end;

procedure TfrmObservacionesNota.sdqObservacionesAfterScroll(
  DataSet: TDataSet);
begin
  sdqAcciones.Close;
  sdqAcciones.ParamByName('idobservacion').Value := Dataset.fieldbyname('ob_id').AsInteger;
  sdqAcciones.Open;
  if sdqAcciones.isEmpty then
  begin
    edObservacion.Lines.Clear;
    if Dataset.fieldbyname('ob_id').AsInteger = obs_form_texto_libre then
      BlobSql('SELECT np_textoobsnota ' +
              'FROM emi.inp_notacontratoperiodo ' +
               'WHERE np_id = ' + SqlValue(FIdNotaContratoPeriodo), edObservacion.Lines)
    else begin
      if (sdqObservaciones.fieldbyname('ob_rechazo').AsString = 'I') and
         (sdqObservaciones.fieldbyname('estado').AsInteger <> ESTADO_FORMULARIO_REPETIDO)  then
        edObservacion.Lines.Add(GetObservacionGenerica(FIdNotaContratoPeriodo));
    end;
  end;
end;

procedure TfrmObservacionesNota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sdqAcciones.Close;
  sdqObservaciones.Close;
end;

procedure TfrmObservacionesNota.sdqAccionesAfterScroll(DataSet: TDataSet);
begin
  if not FNotaAplicada then
    edObservacion.Text := get_procesarobservacionnota(FIdNotaContratoPeriodo, sdqAcciones.FieldByName('OA_IDOBSERVACION').AsInteger)
  else
    BlobSql(' SELECT NG_TEXTOOBSERVACION ' +
            ' FROM EMI.ING_NOTAGESTION ' +
            ' WHERE NG_IDNOTAPERIODOOBS = ' + SqlValue(sdqObservaciones.FieldByName('idobservacionota').AsInteger) +
            ' AND NG_IDACCION = ' + SqlValue(DataSet.FieldByName('ac_id').AsInteger) +
            ' AND NG_SUBACCION = ' + SqlValue(DataSet.FieldByName('OS_SUBACCION').AsString) , edObservacion.Lines);

(*
    BlobSql('SELECT PO_TEXTOOBSERVACION ' +
            'FROM EMI.IPO_NOTAPERIODOOBSERVACION ' +
            'WHERE PO_ID = ' + SqlValue(sdqObservaciones.FieldByName('idobservacionota').AsInteger), edObservacion.Lines);
*)            

(*
  BlobSql('SELECT TS_TEXTO ' +
          'FROM EMI.ITS_TEXTOREFERENCIA ' +
          'WHERE TS_ID = ' + SqlValue(sdqAcciones.FieldByName('TS_ID').AsInteger), edObservacion.Lines);
*)
end;

end.
