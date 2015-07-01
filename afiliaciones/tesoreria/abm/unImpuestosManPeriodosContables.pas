unit unImpuestosManPeriodosContables;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unArtFrame, unFraCodigoDescripcion, unFraCodDesc,
  Mask, ToolEdit, PeriodoPicker, unArtDBAwareFrame;

type
  TfrmImpuestosManPeriodosContables = class(TfrmCustomGridABM)
    edIP_PERIODO: TPeriodoPicker;
    Label1: TLabel;
    Label2: TLabel;
    cmbIP_ESTADO: TComboBox;
    tbReapertura: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbReaperturaClick(Sender: TObject);
  protected
    function Validar: boolean; override;
    function DoABM: boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  end;

var
  frmImpuestosManPeriodosContables: TfrmImpuestosManPeriodosContables;

implementation

{$R *.DFM}

uses
  SqlFuncs, AnsiSql, unDmPrincipal, unSesion, CustomDlgs, Periodo, VCLExtra,
  unART, General, StrFuncs;

procedure TfrmImpuestosManPeriodosContables.ClearControls;
begin
  cmbIP_ESTADO.ItemIndex     := 0;
  edIP_PERIODO.Periodo.Valor := '';

  VCLExtra.LockControls([edIP_PERIODO], False);
end;

function TfrmImpuestosManPeriodosContables.DoABM: boolean;
begin
  with Sql do
    begin
      Clear;
      TableName := 'CONT.OIP_IMPPERIODO';

      if ModoABM = maBaja then
        begin
          SqlType := stUpdate;

          PrimaryKey.Add('IP_ID',            sdqConsulta.FieldByName('IP_ID').AsInteger);
          Fields.Add('IP_FECHABAJA',         exDateTime);
          Fields.Add('IP_USUBAJA',           Sesion.UserID);
        end
      else
        begin
          if cmbIP_ESTADO.ItemIndex = 0 then
            begin
              SqlType := stInsert;

              PrimaryKey.Add('IP_ID',        GetSecNextVal('CONT.SEQ_OIP_ID'));
              Fields.Add('IP_PERIODO',       edIP_PERIODO.Periodo.Valor);
              Fields.Add('IP_ESTADO',        'A');
              Fields.Add('IP_FECHAALTA',     exDateTime);
              Fields.Add('IP_USUALTA',       Sesion.UserID);
            end
          else
            begin
              SqlType := stUpdate;

              PrimaryKey.Add('IP_ID',        sdqConsulta.FieldByName('IP_ID').AsInteger);
              Fields.Add('IP_ESTADO',        'C');
              Fields.Add('IP_FECHAMODIF',    exDateTime);
              Fields.Add('IP_USUMODIF',      Sesion.UserID);
            end;
        end;

      Result := inherited DoABM;
    end;
end;

procedure TfrmImpuestosManPeriodosContables.LoadControls;
begin
  cmbIP_ESTADO.ItemIndex     := 1;
  edIP_PERIODO.Periodo.Valor := sdqConsulta.FieldByName('IP_PERIODO').AsString;
  
  VCLExtra.LockControls([edIP_PERIODO], True);
end;

function TfrmImpuestosManPeriodosContables.Validar: boolean;
var
  bExiste: boolean;
begin
  Verificar(IsEmptyString(edIP_PERIODO.Periodo.Valor), edIP_PERIODO, 'Debe elegir un periodo válido.');

  if ModoABM = maAlta then
    begin
      bExiste := ExisteSQLEx('SELECT 1 ' +
                               'FROM CONT.OIP_IMPPERIODO ' +
                              'WHERE IP_PERIODO = :Periodo', [edIP_PERIODO.Periodo.Valor]);
      Verificar(bExiste, edIP_PERIODO, 'No puede dar de alta un periodo que ya existe.');
    end;

  Result := True;
end;

procedure TfrmImpuestosManPeriodosContables.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja         := 'IP_FECHABAJA';
  tbReapertura.Left := 77;
end;

procedure TfrmImpuestosManPeriodosContables.tbModificarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.FieldByName('IP_ESTADO').AsString = 'C', nil, 'El periodo ya se encuentra cerrado.');

  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      ModoABM := maModificacion;
      ModoABMToSqlType;
      LoadControls;
      if MsgAsk('Ud. está a punto de cerrar el periodo contable ' +
                sdqConsulta.FieldByName('IP_PERIODO').AsString + '.' + CRLF +
                '¿Está seguro de continuar?') then
        DoABM;
    end;
  RefreshData;
end;

procedure TfrmImpuestosManPeriodosContables.tbReaperturaClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay ningún registro seleccionado.');
  Verificar(sdqConsulta.FieldByName('IP_ESTADO').AsString <> 'C', Nil, 'El periodo no se encuentra cerrado.');

  if MsgBox('¿Confirma la reapertura del periodo?', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      try
        with Sql do
          begin
            Clear;
            TableName := 'CONT.OIP_IMPPERIODO';

            SqlType := stUpdate;

            PrimaryKey.Add('IP_ID',      sdqConsulta.FieldByName('IP_ID').AsInteger);
            Fields.Add('IP_ESTADO',      'A');
            Fields.Add('IP_FECHAMODIF',  exDateTime);
            Fields.Add('IP_USUMODIF',    Sesion.UserID);
            EjecutarSql(Sql);

            tbRefrescarClick(nil);
          end;
        except
         on E: Exception do
           ErrorMsg(E);
        end;
    end;
end;

end.

