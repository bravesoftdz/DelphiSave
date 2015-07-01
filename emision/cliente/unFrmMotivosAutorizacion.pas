unit unFrmMotivosAutorizacion;

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
  TfrmMotivosAutorizacion = class(TfrmCustomGridABM)
    edDescripcion: TEdit;
    lblDesc: TLabel;
    edIdMotivo: TEdit;
    lblNumber: TLabel;
    Label1: TLabel;
    cbTipo: TExComboBox;
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
  frmMotivosAutorizacion: TfrmMotivosAutorizacion;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta;

{$R *.dfm}

{ TfrmContratosAOmitir }

procedure TfrmMotivosAutorizacion.ClearControls;
begin
  edIdMotivo.Clear;
  edDescripcion.Clear;
  cbTipo.ItemIndex := -1;
  fraObservacion.Clear;
end;

function TfrmMotivosAutorizacion.DoABM: Boolean;
begin
 try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('MA_ID', sdqConsulta.FieldByName('MA_ID').AsInteger );
      Sql.Fields.Add('MA_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('MA_FECHABAJA', exDateTime );
      if fraObservacion.IsSelected then
        Sql.Fields.Add('MA_IDOBSERVACION', fraObservacion.Codigo)
      else
        Sql.Fields.Add('MA_IDOBSERVACION', exNull);

      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('MA_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('MA_TIPO', cbTipo.Value);
      if fraObservacion.IsSelected then
        Sql.Fields.Add('MA_IDOBSERVACION', fraObservacion.Codigo)
      else
        Sql.Fields.Add('MA_IDOBSERVACION', exNull);

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('MA_ID', GetSecNextVal('EMI.SEQ_IMA_ID'));
        Sql.Fields.Add('MA_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('MA_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('MA_ID', sdqConsulta.FieldByName('MA_ID').AsInteger);
        Sql.Fields.Add('MA_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('MA_FECHAMODIF', exDateTime );
        Sql.Fields.Add('MA_USUBAJA', exNull);
        Sql.Fields.Add('MA_FECHABAJA', exNull );
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

procedure TfrmMotivosAutorizacion.LoadControls;
begin
  edIdMotivo.Text := sdqConsulta.FieldByName('MA_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('MA_DESCRIPCION').AsString;
  cbTipo.Value := sdqConsulta.FieldByName('MA_TIPO').AsString;
  fraObservacion.Codigo := sdqConsulta.FieldByName('MA_IDOBSERVACION').AsString;
end;

function TfrmMotivosAutorizacion.Validar: Boolean;
begin
  Result := VerificarMultiple(['Administración de Motivos de Autorización',
                                edDescripcion, trim(edDescripcion.Text)<>'', 'Debe especificar una descripción',
                                cbTipo, (cbTipo.ItemIndex <> -1), 'Debe especificar el tipo'
                                ]);
end;

procedure TfrmMotivosAutorizacion.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'MA_FECHABAJA';
  Sql.TableName := 'emi.ima_motivoautorizacion';

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

procedure TfrmMotivosAutorizacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmMotivosAutorizacion.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT  ma_id, ma_descripcion, ma_fechaalta, ma_usualta, ma_fechamodif, ' +
                      ' ma_usumodif, ma_fechabaja, ma_usubaja, ma_tipo, decode(ma_tipo, ''A'', ''Autoriza/Procesa'', ''N'', ''No Autoriza/Rechaza'') tipodesc, ma_idobservacion' +
                      ' FROM emi.ima_motivoautorizacion ');
  inherited;
end;

procedure TfrmMotivosAutorizacion.tbAddObservacionClick(Sender: TObject);
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


