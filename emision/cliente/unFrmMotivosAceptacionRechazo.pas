unit unFrmMotivosAceptacionRechazo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, General, AnsiSql, JvgGroupBox, ExComboBox;

type
  TfrmMotivosAceptacionRechazo = class(TfrmCustomGridABM)
    edDescripcion: TEdit;
    lblDesc: TLabel;
    edIdMotivo: TEdit;
    lblNumber: TLabel;
    Label1: TLabel;
    cbTipo: TExComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
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
  frmMotivosAceptacionRechazo: TfrmMotivosAceptacionRechazo;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta;

{$R *.dfm}

{ TfrmContratosAOmitir }

procedure TfrmMotivosAceptacionRechazo.ClearControls;
begin
  edIdMotivo.Clear;
  edDescripcion.Clear;
  cbTipo.ItemIndex := -1;
end;

function TfrmMotivosAceptacionRechazo.DoABM: Boolean;
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
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('MA_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('MA_TIPO', cbTipo.Value);

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('MA_ID', GetSecNextVal('EMI.SEQ_IDI_ID'));
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

procedure TfrmMotivosAceptacionRechazo.LoadControls;
begin
  edIdMotivo.Text := sdqConsulta.FieldByName('MA_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('MA_DESCRIPCION').AsString;
  cbTipo.Value := sdqConsulta.FieldByName('MA_TIPO').AsString;
end;

function TfrmMotivosAceptacionRechazo.Validar: Boolean;
begin
  Result := VerificarMultiple(['Motivos de Aceptación de DDJJ',
                                edDescripcion, trim(edDescripcion.Text)<>'', 'Debe especificar una descripción',
                                cbTipo, (cbTipo.ItemIndex <> -1), 'Debe especificar el tipo'
                                ]);
end;

procedure TfrmMotivosAceptacionRechazo.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'MA_FECHABAJA';
  Sql.TableName := 'emi.ima_motivoaceprech';
end;

procedure TfrmMotivosAceptacionRechazo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmMotivosAceptacionRechazo.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT  ma_id, ma_descripcion, ma_fechaalta, ma_usualta, ma_fechamodif, ' +
                      ' ma_usumodif, ma_fechabaja, ma_usubaja, ma_tipo, decode(ma_tipo, ''A'', ''Aceptación'', ''R'', ''Rechazo'') tipodesc ' +
                      ' FROM emi.ima_motivoaceprech ');
  inherited;
end;

end.


