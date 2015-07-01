unit unConsVisitasRealizadas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, AnsiSql,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, General, CustomDlgs;

type
  TfrmConsVisitasRealizadas = class(TfrmCustomConsulta)
    pnlBottom: TPanel;
    btnSeleccionar: TButton;
    btnCancelar: TButton;
    procedure GridDblClick(Sender: TObject);
    procedure btnSeleccionarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure SeleccionarVisita;
  public
    { Public declarations }
    FIdVisitaSeleccionada: Integer;
    FHoraDesdeVisitaSeleccionada,
    FHoraHastaVisitaSeleccionada,
    FFechaViaticos,
    FFechaVisitaSeleccionada : TDateTime;
    FFirmanteVisitaSeleccionada,
    FDescripcionVisitaSeleccionada : String;
    procedure Init (ACUIT: String;
                    AEstablecimiento: Integer;
                    AOperativo,
                    ATipoFet: String;
                    AIgualEstab: Boolean);
  end;

var
  frmConsVisitasRealizadas: TfrmConsVisitasRealizadas;

implementation

{$R *.DFM}

procedure TfrmConsVisitasRealizadas.Init (ACUIT: String;
                                          AEstablecimiento: Integer;
                                          AOperativo,
                                          ATipoFet: String;
                                          AIgualEstab: Boolean);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add('SELECT   rv_id, rv_fecha, rv_firmante, it_nombre, rv_fechabaja, rv_estableci, ' +
                      '         rv_prestador, ej_descripcion, rv_descripcion, rv_horariodesde, ' +
                      '         rv_horariohasta, rv_duracionpermanencia, rv_operativo, rv_tipo, rv_fechanotificacion, rv_fechaviaticos ' +
                      '    FROM mej_empprest, ' +
                      '         pit_firmantes, ' +
                      '         art.prv_resvisitas ' +
//                      '         hys.hep_estabporpreventor ' +
                      '   WHERE it_codigo(+) = rv_firmante ' +
                      '     AND ej_codigo(+) = rv_prestador ' +
//                      '     AND ep_cuit = rv_cuit ' +
//                      '     AND ep_estableci = rv_estableci ' +
//                      '     AND rv_tipo = ' + SqlValue(ATipoFet) +
                      '     AND rv_cuit =  ' + SqlValue (ACUIT) +
                      '     AND rv_estableci ' + iif (AIgualEstab, '= ', '<> ') + SqlValue (AEstablecimiento) +
                      '     AND rv_fechabaja IS NULL ');
  //if AOperativo <> '' then
    //sdqConsulta.SQL.Add('     AND (rv_operativo = ' + SqlValue(AOperativo) + ' or ' + SqlValue(ATipoFet) + ' IN (' + SqlValue('GB') + ',' + SqlValue('CO') + '))');

  sdqConsulta.SQL.Add(' ORDER BY rv_fecha ');

  sdqConsulta.Open;
end;

procedure TfrmConsVisitasRealizadas.SeleccionarVisita;
begin
  Verificar(sdqConsulta.IsEmpty, Grid, 'Debe seleccionar una visita.');

  FIdVisitaSeleccionada         := sdqConsulta.FieldByName ('rv_id').AsInteger;
  FDescripcionVisitaSeleccionada:= sdqConsulta.FieldByName ('rv_descripcion').AsString;
  FFirmanteVisitaSeleccionada   := sdqConsulta.FieldByName ('rv_firmante').AsString;
  if sdqConsulta.FieldByName ('rv_fecha').IsNull then
    FFechaVisitaSeleccionada      := 0
  else
    FFechaVisitaSeleccionada      := sdqConsulta.FieldByName ('rv_fecha').AsDateTime;
  if sdqConsulta.FieldByName ('rv_horariodesde').IsNull then
    FHoraDesdeVisitaSeleccionada  := 0
  else
    FHoraDesdeVisitaSeleccionada  := sdqConsulta.FieldByName ('rv_horariodesde').AsDateTime;
  if sdqConsulta.FieldByName ('rv_horariohasta').IsNull then
    FHoraHastaVisitaSeleccionada  := 0
  else
    FHoraHastaVisitaSeleccionada  := sdqConsulta.FieldByName ('rv_horariohasta').AsDateTime;
  if sdqConsulta.FieldByName ('rv_fechaviaticos').IsNull then
    FFechaViaticos  := 0
  else
    FFechaViaticos                := sdqConsulta.FieldByName ('rv_fechaviaticos').AsDateTime;

  ModalResult := mrOk;
end;

procedure TfrmConsVisitasRealizadas.GridDblClick(Sender: TObject);
begin
  inherited;
  SeleccionarVisita;
end;

procedure TfrmConsVisitasRealizadas.btnSeleccionarClick(Sender: TObject);
begin
  inherited;
  SeleccionarVisita;
end;

procedure TfrmConsVisitasRealizadas.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

end.


