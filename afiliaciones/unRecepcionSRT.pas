unit unRecepcionSRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, Db, SDEngine, Placemnt,
  artSeguridad, ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids, unArtFrame,
  unFraStaticCodigoDescripcion, Mask, PatternEdit, ComboEditor, ComboGrid, ToolEdit, ArtComboBox, DateTimeFuncs;

type
  TfrmRecepcionSRT = class(TfrmCustomPanelABM)
    sdqRespuestas: TSDQuery;
    dsRespuestas: TDataSource;
    sdqErrores: TSDQuery;
    dsErrores: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CmbProceso: TComboBox;
    pcSRT: TPageControl;
    tbEnvios: TTabSheet;
    GridEnvios: TDBGrid;
    tbRespuestas: TTabSheet;
    GridRespuestas: TDBGrid;
    tbErrores: TTabSheet;
    GridErrores: TDBGrid;
    tbRecepcion: TToolButton;
    procedure FSFormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRecepcionClick(Sender: TObject);
    procedure sdqRespuestasAfterScroll(DataSet: TDataSet);
    procedure CargarGrillas(Sender: TObject);
    procedure CmbProcesoChange(Sender: TObject);
  private
    fNuevaRespuesta: Boolean;

    function GetCodigoProceso: String;
  public
  end;

var
  frmRecepcionSRT: TfrmRecepcionSRT;

implementation

{$R *.DFM}

uses
  unDmPrincipal, unPrincipal, AnsiSql, unImpoExpoWizard;

{ TfrmRecepcionSRT }

procedure TfrmRecepcionSRT.CargarGrillas(Sender: TOBject);
var
  sCodigo: String;
  sSql: String;
  sSqlAux: String;
begin
  sCodigo := GetCodigoProceso;
  if (sCodigo = '') then
  begin
    sdqConsulta.Close;
    sdqRespuestas.Close;
    sdqErrores.Close;
  end
  else
  begin
    case pcSRT.ActivePageIndex of
      0:
      begin
        sSql :=
          'SELECT   *' +
             ' FROM cce_controlenvios' +
            ' WHERE ce_idproceso = :idproceso' +
         ' ORDER BY ce_feproceso DESC, ce_archivo';
        OpenQueryEx(sdqConsulta, [sCodigo], sSql, True);
      end;
      1:
      begin
        if fNuevaRespuesta then
        begin
          sSql :=
            'SELECT   *' +
               ' FROM cre_respenvios' +
              ' WHERE re_idproceso = :idproceso' +
           ' ORDER BY re_feproceso DESC, re_archivo';
          OpenQueryEx(sdqRespuestas, [sCodigo], sSql, True);
          fNuevaRespuesta := False;
        end;
      end;
      2:
      begin
        if sdqRespuestas.Eof or not sdqRespuestas.Active then
          sdqErrores.Close
        else
        begin
          sSqlAux := ', SUBSTR(er_clave, 1, 2) || ''-'' || SUBSTR(er_clave, 3, 8) || ''-'' || SUBSTR(er_clave, 11, 1) ';
          if (sCodigo = 'CO') or (sCodigo = 'SC') then
            sSqlAux := sSqlAux + 'identificacion '
          else if (sCodigo = 'DE') then
            sSqlAux := sSqlAux + '||''  ''|| SUBSTR(er_clave, 12, 2) Identificacion'
          else if (sCodigo = 'TR') then
            sSqlAux := sSqlAux + '||''  ''|| SUBSTR(er_clave, 12, 4) Identificacion'
          else if (sCodigo = 'FG') then
            sSqlAux := sSqlAux + '||''  ''|| SUBSTR(er_clave, 12, 4) || SUBSTR(er_clave, 16, 15) identificacion ';

          sSql :=
            'SELECT   er_fpresentacion, er_tipo || er_codigo codigo,' +
                    ' afiliacion.get_descrespuestasrt(er_codigo, er_tipo) descripcion' +
                      sSqlAux +
               ' FROM crer_resperrores' +
              ' WHERE er_archivo = :archivo' +
                ' AND er_fpresentacion = :fpresentacion' +
           ' ORDER BY er_tipo, er_codigo, identificacion';
          OpenQueryEx(sdqErrores, [sdqRespuestas.FieldByName('re_Archivo').AsString, TDateTimeEx.Create(sdqRespuestas.FieldByName('re_feproceso').AsDateTime)], sSql, True);
        end;
      end;
    end;
  end;
end;

function TfrmRecepcionSRT.GetCodigoProceso: String;
begin
{
CO - Endosos
DE - Determinativas
TR - Transferencias
FG - Fondo de Garantía
SC - Identificación de Siniestros - SRT
SI - Siniestros - SSN
RT - Emisiones para SSN
BR - Movimientos
}
  if cmbProceso.ItemIndex = -1 then
    Result := ''
  else
    Result := Copy(cmbProceso.Text, 0, 2);
end;

procedure TfrmRecepcionSRT.FSFormCreate(Sender: TObject);
begin
  inherited;
  
  frmPrincipal.mnuRecepcionSRT.Enabled := False;
  tbRecepcion.Left := 0;
  fNuevaRespuesta := True;
end;

procedure TfrmRecepcionSRT.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  
  cmbProceso.ItemIndex := -1;
  sdqConsulta.Close;
  sdqRespuestas.Close;
  sdqErrores.Close; 
end;

procedure TfrmRecepcionSRT.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuRecepcionSRT.Enabled := True;
  frmRecepcionSRT := nil;

  inherited;
end;

procedure TfrmRecepcionSRT.tbRecepcionClick(Sender: TObject);
begin
  ImpoExpoWizard('RESRT');
  CargarGrillas(nil);
end;

procedure TfrmRecepcionSRT.sdqRespuestasAfterScroll(DataSet: TDataSet);
begin
  fNuevaRespuesta := True;
end;

procedure TfrmRecepcionSRT.CmbProcesoChange(Sender: TObject);
begin
  fNuevaRespuesta := True;
  CargarGrillas(nil);
end;

end.
