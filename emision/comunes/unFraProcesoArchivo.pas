unit unFraProcesoArchivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, JvExControls, JvComponent, JvgProgress, ExtCtrls, DB,
  SDEngine, Grids, DBGrids, ComCtrls, ToolWin;

type
  TfraProcesoArchivo = class(TFrame)
    pbProgreso: TJvgProgress;
    lblId: TLabel;
    lblNombreArchivo: TLabel;
    lblValorID: TLabel;
    lblValorNombreArchivo: TLabel;
    lblCodigoArchivo: TLabel;
    lblValorCodigoArchivo: TLabel;
    lblSubCodigoArchivo: TLabel;
    lblValorSubCodigo: TLabel;
    lblRegistrosProcesados: TLabel;
    lblValorCantidadProcesados: TLabel;
    lblRegistrosErrores: TLabel;
    lblCantidadErrores: TLabel;
    lblRegistrosTotales: TLabel;
    lblValorCantidadRegistros: TLabel;
    lFechaArchivo: TLabel;
    lblFechaProgProceso: TLabel;
    lblHoraProceso: TLabel;
    lblValorHoraProceso: TLabel;
    TimerRefresh: TTimer;
    chkTerminado: TCheckBox;
    lblObservacion: TLabel;
    Label1: TLabel;
    lblValorCantidadCalculados: TLabel;
    tbProcesosEmision: TToolBar;
    tbEliminarProceso: TToolButton;
    tbMostrarErrores: TToolButton;
    Label2: TLabel;
    lblFechaProceso: TLabel;
    lblEstado: TLabel;
    procedure TimerRefreshTimer(Sender: TObject);
    procedure tbEliminarProcesoClick(Sender: TObject);
    procedure tbMostrarErroresClick(Sender: TObject);
  private
    FID: Integer;
    FIdCabecera : Integer;
    Fprogress: Integer;
    FEstado: String;
    procedure SetID(const Value: Integer);
    procedure GetProcessInfo;
    procedure Setprogress(const Value: Integer);
    function Getprogress : Integer;
    { Private declarations }
  public
    { Public declarations }
    property ID : Integer read FID write SetID;
    property progress : Integer read GetProgress write Setprogress;
    property Estado: String read FEstado;
  end;

implementation

uses unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, General, unRTTI,
     StrFuncs, //unFrmConsultaLogs,
     unfrmErroresImportacion, unFuncionesEmision, JvScrollMax;

{$R *.dfm}
{------------------------------------------------------------------------------}
procedure TfraProcesoArchivo.SetID(const Value: Integer);
begin
  FID := Value;
  GetProcessInfo;
//  TimerRefresh.Enabled := true;
end;
{------------------------------------------------------------------------------}
procedure TfraProcesoArchivo.TimerRefreshTimer(Sender: TObject);
begin
   TimerRefresh.Enabled := false;
   try
     GetProcessInfo;
     Application.ProcessMessages;
   finally
     TimerRefresh.Enabled := true;
   end;
end;
{------------------------------------------------------------------------------}
procedure TfraProcesoArchivo.GetProcessInfo;
var
  Q : TSDQuery;
  sid: integer;
const
  PROPERTY_CAPTION = 'caption';
begin
  Q := GetQuery('SELECT ' +
                ' ipr.pr_id, ipr.pr_fechainicio, ipr.pr_fechafin, ipr.pr_visible, ' +
                ' tci.ci_codigoregistro, tci.ci_codigoarchivo, tci.ci_subcodigoarchivo, ' +
                ' tci.ci_fechaproceso, tci.ci_horaproceso, tci.ci_cantidadregistros, ' +
                ' tci.ci_cantidaderrores, tci.ci_cantidadprocesados, tci.ci_nombrearchivo, ' +
                ' tci.ci_fechaactualizacion, tci.ci_terminado, tci.ci_observacion, itf.tf_descripcion, itf.tf_id, ' +
                ' ipr.pr_observaciones, itp.tp_descripcion, tci.ci_cantidadcalculados, ci_id, ci_estadoimportacion ' +
                ' FROM emi.ipr_procesos ipr, emi.tci_ddjjcabeceraimportacion tci, emi.itf_tipoformulario itf, emi.itp_tipoproceso itp ' +
                ' WHERE ipr.pr_visible     = ''S''              ' +
                '   and ipr.pr_id          = tci.ci_idproceso(+)' +
                '   and tci.ci_idtipoformulario = itf.tf_id(+)  ' +
                '   and ipr.pr_idtiproceso = itp.tp_id          ' +
                '   and ipr.pr_id = ' + SqlValue(FId));

  try
    Q.Open;
    if Q.RecordCount > 0 then
    begin
      FIdCabecera := Q.FieldByName('ci_id').asInteger;

      {$IFDEF VER150}
      if ExistsProperty(parent, PROPERTY_CAPTION) then
      begin
        SetPropByName(parent, PROPERTY_CAPTION, 'Proceso Nro. ' + Q.FieldByName('pr_id').AsString  + ' - ' + Q.FieldByName('tp_descripcion').AsString );
      end;
      {$ELSE}
      TJvScrollMaxBand(Parent).Caption := 'Proceso Nro. ' + Q.FieldByName('pr_id').AsString  + ' - ' + Q.FieldByName('tp_descripcion').AsString;
      {$ENDIF}
      lblValorID.Caption := Q.FieldByName('pr_id').AsString;
      lblValorCodigoArchivo.Caption := Q.FieldByName('tf_descripcion').AsString;
      lblValorSubCodigo.Caption := Q.FieldByName('ci_subcodigoarchivo').AsString;
      lblValorNombreArchivo.Caption := Q.FieldByName('ci_nombrearchivo').AsString;
      lblValorCantidadRegistros.Caption := Q.FieldByName('ci_cantidadregistros').AsString;
      lblValorCantidadProcesados.Caption := Q.FieldByName('ci_cantidadprocesados').AsString;
      lblValorCantidadCalculados.Caption := Q.FieldByName('ci_cantidadcalculados').AsString;
      lblCantidadErrores.Caption := Q.FieldByName('ci_cantidaderrores').AsString;
      lblFechaProgProceso.Caption := Q.FieldByName('ci_fechaproceso').AsString;
      lblValorHoraProceso.Caption := Q.FieldByName('ci_horaproceso').AsString;
      lblFechaProceso.Caption := Q.FieldByName('pr_fechainicio').AsString;
      FEstado := Q.FieldByName('ci_estadoimportacion').AsString;
      if FEstado = 'A' then
      begin
        lblEstado.Caption :=  'Estado: Agendado';
        tbEliminarProceso.Enabled := true;
      end
      else begin
        tbEliminarProceso.Enabled := false;
        if ((FEstado = 'P') or (FEstado = '')) and (Q.FieldByName('ci_terminado').AsString <> 'S') then
        begin
          sid := ValorSqlInteger(' SELECT sid ' +
                                 '  FROM v$session, v$process ' +
                                 ' WHERE paddr = addr ' +
                                  '   AND audsid = USERENV(''SESSIONID'') ');
          if ExisteSql(' SELECT 1 ' +
                       '   FROM v$session s ' +
                       '  WHERE UPPER(s.program) LIKE ''' + iif((Q.FieldByName('tf_id').AsInteger = 80) or (Q.FieldByName('tf_id').AsInteger = 81), 'SRVEMISION.EXE', 'EMISION%.EXE') + '''' +
                       '   AND s.status = ''ACTIVE''' +
                       '   AND sid <> ' + SqlValue(sid)) then
            lblEstado.Caption :=  'Estado: Procesando'
          else
            lblEstado.Caption :=  'Estado: Detenido';
        end
        else
          lblEstado.Caption := 'Estado: Finalizado';
      end;

      if not IsEmptyString(Q.FieldByName('ci_observacion').AsString) then
       lblObservacion.Caption := Q.FieldByName('ci_observacion').AsString
      else
       lblObservacion.Caption := Q.FieldByName('pr_observaciones').AsString;

      if Q.FieldByName('ci_terminado').AsString = 'S' then
      begin
       TimerRefresh.Enabled := false;
       chkTerminado.Checked := true;
       pbProgreso.Percent := 100;
      end
      else
       if (Q.FieldByName('ci_cantidadregistros').AsInteger > 0) then
         pbProgreso.Percent := Abs(round(Q.FieldByName('ci_cantidadprocesados').AsInteger / round((Q.FieldByName('ci_cantidadregistros').AsInteger * 1.1)) * 100) - 1)
       else pbProgreso.Percent := 0;

//       if TfrmErroresImportacion.CheckErrores(FIdCabecera) then
//       begin
//         if Assigned(parent) then
//         begin
//          tbMostrarErrores.Visible := true;
////           TForm(parent).Font.Color := clRed;
//
//         end;
//       end
//       else begin
//         if Assigned(parent) then
//         begin
//          tbMostrarErrores.Visible := false;
////           TForm(parent).Font.Color := clWindowText;
//
//         end;
//       end;
    end;
  finally
    Q.Close;
    Q.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfraProcesoArchivo.Setprogress(const Value: Integer);
begin
  Fprogress := Value;
end;
{------------------------------------------------------------------------------}
function TfraProcesoArchivo.Getprogress: Integer;
begin
  result := pbProgreso.Percent;
end;
{------------------------------------------------------------------------------}
procedure TfraProcesoArchivo.tbEliminarProcesoClick(Sender: TObject);
var
  ServiceDir, OutputFile: String;
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  BeginTrans;
  Screen.Cursor := crHourGlass;
  try
  EjecutarSqlSTEx(' DELETE FROM emi.ipr_procesos ' +
                    '  WHERE pr_id = (SELECT ci_idproceso ' +
                    '                  FROM emi.tci_ddjjcabeceraimportacion ' +
                    '                WHERE ci_id = :id)',  [FIdCabecera]);

    EjecutarSqlSTEx('DELETE FROM emi.tci_ddjjcabeceraimportacion ' +
                    ' WHERE ci_id = :id', [FIdCabecera]);

    ServiceDir := get_parametrobyclave('SERVICEDIR');
    if not DirectoryExists(ServiceDir) then
      raise Exception.Create('El directorio no existe o no tiene permisos.'
                                  + #13+#10 + ServiceDir);

    OutputFile := ServiceDir + '\' +  lblValorNombreArchivo.Caption;

    if not deletefile(PChar(OutputFile)) then
       raise Exception.Create('El archivo no pudo eliminarse. Verifique los permisos'
                              +#13+#10+
                              'del usuario sobre el directorio destino. ');

    CommitTrans;
    tbEliminarProceso.Enabled := false;
    lblEstado.Caption := 'Eliminado';
    TJvScrollMaxBand(Parent).Color := clRed;
  except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Error al desagendar proceso.');
      end;
  end;
  Screen.Cursor := PrevCursor;
end;


procedure TfraProcesoArchivo.tbMostrarErroresClick(Sender: TObject);
begin

  if TfrmErroresImportacion.CheckErrores(FIdCabecera) then
  with TfrmErroresImportacion.create(self) do
  try
    MostrarErroresProceso(FIdCabecera);
  finally
    Free;
  end;
end;

end.



