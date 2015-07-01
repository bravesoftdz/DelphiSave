unit unRecVolantes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, unfraVolante, Mask, ToolEdit, DateComboBox, ExtCtrls, Buttons,
  artSeguridad, IntEdit, PatternEdit, RxToolEdit;

type
  TSectorOrigen = (soInterior, soAuditoria, soOrtopedia, soLiquidaciones);

  TfrmRecVolantes = class(TForm)
    Panel1: TPanel;
    lblFRec: TLabel;
    edRecepcion: TDateComboBox;
    edFechaText: TEdit;
    btnSalir: TButton;
    chkSvoTemp: TCheckBox;
    Seguridad: TSeguridad;
    Label2: TLabel;
    edCount: TIntEdit;
    fraVolantes: TfraVolantes;
    procedure edRecepcionExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkSvoTempClick(Sender: TObject);
    procedure SeguridadAfterExecute(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    FSectorOrigen :TSectorOrigen;
    sTabHead, sCampo, sAux : String;
    procedure OnFraVolanteChange(Sender: TObject);
    procedure SetSectorOrigen(const Value :TSectorOrigen);
    function CompareDate : Boolean;
  public
    property SectorOrigen :TSectorOrigen    read FSectorOrigen    write SetSectorOrigen;
  end;

var
  frmRecVolantes: TfrmRecVolantes;

implementation

uses
  AnsiSql, unDmPrincipal, CustomDlgs, SDEngine, unSesion, unPrincipal;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecVolantes.edRecepcionExit(Sender: TObject);
begin
  edFechaText.Text := edRecepcion.LongDate;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecVolantes.FormCreate(Sender: TObject);
begin
  edRecepcion.MaxDate  := DBDateTime;
  fraVolantes.OnChange := OnFraVolanteChange;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecVolantes.OnFraVolanteChange(Sender: TObject);
var
  Sql, sEstado, sEstadoPend : string;
begin
  sEstado := fraVolantes.Estado;
  sEstadoPend := fraVolantes.EstadoPend;  // TK 21282

  if fraVolantes.edNumero.Value = 0 then
    InvalidMsg(fraVolantes.edNumero, 'No se ha encontrado el volante.')

  else if ((FSectorOrigen = soInterior) and (sEstado <> 'P') and (sEstado <> 'PA') and (sEstado <> 'PO')) or
          ((FSectorOrigen = soAuditoria) and (sEstado <> 'PA')) or
          ((FSectorOrigen = soOrtopedia) and (sEstado <> 'P')) or
          ((FSectorOrigen = soLiquidaciones) and (sEstado <> 'P') and (sEstado <> 'L'))
  then
    InvalidMsg(fraVolantes.edNumero, 'No está permitido recepcionar volantes con estado "' + fraVolantes.edEstado.Text + '"')

  else if CompareDate then
    InvalidMsg(fraVolantes.edNumero, 'La fecha de recepción del volante, es mayor a la fecha de recepción en ' + sAux + '.')

  else
    try
      Sql := 'UPDATE ' + sTabHead + 'svo_volantes ' +
               ' SET ' + sCampo + ' = ' + edRecepcion.SqlText;
      if (FSectorOrigen = soInterior) then
        Sql := Sql + ', vo_carga_central = actualdate '
      else if (FSectorOrigen = soOrtopedia) then
        Sql := Sql + ', vo_usureceportopedia = ' + SqlValue(Sesion.UserID)
      else if (FSectorOrigen = soLiquidaciones) then
        Sql := Sql + ', vo_usurecepliquid = ' + SqlValue(Sesion.UserID);

      Sql := Sql + ' WHERE vo_volante = ' + fraVolantes.edNumero.TextSql;
      EjecutarSql(Sql);
      edCount.Value := edCount.Value + 1;
    except
      On E: Exception do ErrorMsg(E, 'Error al recepcionar el volante.');
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecVolantes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  case SectorOrigen of
    soInterior:      frmprincipal.mrnLiqRecepVolantes.Enabled      := true;
    soAuditoria:     frmprincipal.mnuLiqRecepcionAuditoria.Enabled := true;
    soOrtopedia:     frmprincipal.mnuLiqRecepOrtopedia.Enabled     := true;
    soLiquidaciones: frmprincipal.mnuLiqRecepLiquidaciones.Enabled := true;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmRecVolantes.CompareDate: Boolean;
var
  sdqConsulta: TSDQuery;
begin
  sdqConsulta := GetQuery('SELECT vo_fecharecepcion  ' +
                           ' FROM ' + sTabHead + 'svo_volantes ' +
                          ' WHERE vo_volante = ' + fraVolantes.edNumero.TextSql);
  try
    Result := not (sdqConsulta.IsEmpty or sdqConsulta.Fields[0].IsNull or
                  (edRecepcion.Date >= sdqConsulta.Fields[0].AsDateTime));
  finally
    sdqConsulta.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecVolantes.chkSvoTempClick(Sender: TObject);
begin
  if chkSvoTemp.Checked then
    sTabHead := 'TMP_'
  else
    sTabHead := '';
  fraVolantes.Temporal := chkSvoTemp.Checked;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecVolantes.SeguridadAfterExecute(Sender: TObject);
begin
  chkSvoTempClick(nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecVolantes.btnSalirClick(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecVolantes.SetSectorOrigen(const Value :TSectorOrigen);
begin
  if FSectorOrigen <> Value then
    FSectorOrigen := Value;

  if (FSectorOrigen = soInterior) then
  begin
    lblFRec.Caption := 'Fecha de Recepción';
    sAux            := 'central';
    sCampo          := 'vo_fecharecepcion_central';
  end
  else if (FSectorOrigen = soAuditoria) then
  begin
    lblFRec.Caption := 'Fecha Recep. Audit.';
    sAux            := 'auditoría';
    sCampo          := 'vo_fecharecepaudit';
  end
  else if (FSectorOrigen = soOrtopedia) then
  begin
    lblFRec.Caption := 'Fecha Revisión CP';
    sAux            := 'revisión CP';
    sCampo          := 'vo_fecharevisioncp';
  end
  else if (FSectorOrigen = soLiquidaciones) then
  begin
    lblFRec.Caption := 'Fecha Recep. Liquid.';
    sAux            := 'liquidaciones';
    sCampo          := 'vo_fecharecepliquid';
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
