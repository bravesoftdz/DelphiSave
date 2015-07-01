unit unFrmMotivosRechazoSim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, General, AnsiSql, JvgGroupBox, ExComboBox,
  unfraCodigoDescripcionExt, unFrmAdministracionObservaciones;

type
  TfrmMotivosRechazoSim = class(TfrmCustomGridABM)
    edDescripcion: TEdit;
    lblDesc: TLabel;
    edIdMotivo: TEdit;
    lblNumber: TLabel;
    fraObservacion: TfraCodigoDescripcionExt;
    Label2: TLabel;
    tbComandosDetalle: TToolBar;
    tbAddObservacion: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbAddObservacionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
  end;

var
  frmMotivosRechazoSim: TfrmMotivosRechazoSim;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta;

{$R *.dfm}

{ TfrmContratosAOmitir }

procedure TfrmMotivosRechazoSim.ClearControls;
begin
  edIdMotivo.Clear;
  edDescripcion.Clear;
  fraObservacion.Clear;
end;

function TfrmMotivosRechazoSim.DoABM: Boolean;
begin
 try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('MS_ID', sdqConsulta.FieldByName('MS_ID').AsInteger );
      Sql.Fields.Add('MS_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('MS_FECHABAJA', exDateTime );
      if fraObservacion.IsSelected then
        Sql.Fields.Add('MS_IDOBSERVACION', fraObservacion.Codigo)
      else
        Sql.Fields.Add('MS_IDOBSERVACION', exNull);

      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('MS_DESCRIPCION', edDescripcion.Text);
      if fraObservacion.IsSelected then
        Sql.Fields.Add('MS_IDOBSERVACION', fraObservacion.Codigo)
      else
        Sql.Fields.Add('MS_IDOBSERVACION', exNull);

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('MS_ID', GetSecNextVal('EMI.SEQ_IMS_ID'));
        Sql.Fields.Add('MS_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('MS_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('MS_ID', sdqConsulta.FieldByName('MS_ID').AsInteger);
        Sql.Fields.Add('MS_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('MS_FECHAMODIF', exDateTime );
        Sql.Fields.Add('MS_USUBAJA', exNull);
        Sql.Fields.Add('MS_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el motivo.');
    end;
  end;
end;

procedure TfrmMotivosRechazoSim.LoadControls;
begin
  edIdMotivo.Text := sdqConsulta.FieldByName('MS_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('MS_DESCRIPCION').AsString;
  fraObservacion.Codigo := sdqConsulta.FieldByName('MS_IDOBSERVACION').AsString;
end;

function TfrmMotivosRechazoSim.Validar: Boolean;
begin
  Result := VerificarMultiple(['Administración de Motivos de Rechazo de Simulación',
                                edDescripcion, trim(edDescripcion.Text)<>'', 'Debe especificar una descripción'
                                ]);
end;

procedure TfrmMotivosRechazoSim.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'MS_FECHABAJA';
  Sql.TableName := 'emi.ims_motivosimulacion';

  with fraObservacion do
  begin
    TableName := 'EMI.IOB_OBSERVACION';
    FieldID := 'OB_ID';
    FieldCodigo := 'OB_ID';
    FieldDesc := 'OB_DESCRIPCION';
(*
    ExtraFields := ', DECODE (OB_RECHAZO, ' +
                              '''S'', ''Rechazar y Gestionar'',' +
                              '''N'', ''Aceptar'',' +
                              '''G'', ''Aceptar y Gestionar'', ' +
                              '''I'', ''Aceptar e Informar'',' +
                              '''X'', ''Rechazar'',' +
                                 ''''') AS RECHAZO ';
*)                                 
    FieldBaja := 'OB_FECHABAJA';
    ExtraJoinCondition := ' OB_MANUAL = ''S''';
    ShowBajas := true;
  end;
end;

procedure TfrmMotivosRechazoSim.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmMotivosRechazoSim.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT  ms_id, ms_descripcion, ms_fechaalta, ms_usualta, ms_fechamodif, ' +
                      ' ms_usumodif, ms_fechabaja, ms_usubaja, ms_idobservacion ' +
                      ' FROM emi.ims_motivosimulacion ');
  inherited;
end;

procedure TfrmMotivosRechazoSim.tbAddObservacionClick(Sender: TObject);
begin
  with TfrmAdministracionObservaciones.create(self) do
  try
    FormStyle := fsNormal;
    Visible := false;
    FiltroManual := true;
    Filtrar;
    ShowModal;
    fraObservacion.Reload;
  finally
    free;
  end;
end;

end.


