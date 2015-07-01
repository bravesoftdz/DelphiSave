unit unInvPeriodosContables;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PeriodoPicker, RxPlacemnt,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion;

type
  TfrmInvPeriodosContables = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    edPeriodoAltaModif: TPeriodoPicker;
    gbTipoInstrumento: TGroupBox;
    fraTipoInstrumento: TfraCodigoDescripcion;
    GroupBox1: TGroupBox;
    edPeriodo: TPeriodoPicker;
    procedure tbEliminarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  protected
    procedure RefreshData; override;  
    procedure ClearControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmInvPeriodosContables: TfrmInvPeriodosContables;

implementation

uses
  unDmPrincipal, AnsiSql, unSesion, DbFuncs, General, CustomDlgs, SqlFuncs, StrFuncs,
  unArt, unTesoreria, unInvRptAsientosContabilizar;

{$R *.dfm}

procedure TfrmInvPeriodosContables.ClearControls;
begin
  edPeriodoAltaModif.Clear;
end;

function TfrmInvPeriodosContables.DoABM: Boolean;
var
  sSql: String;
  Fecha: TDateTime;
  IdTipoInstr: TTableId;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maAlta then
        begin
          PrimaryKey.Add('PC_ID',            GetSecNextVal('INV.SEQ_NPC_ID'));
          Fields.Add('PC_FECHAALTA',         exDateTime);
          Fields.Add('PC_USUALTA',           Sesion.UserID);
          Fields.Add('PC_PERIODO',           edPeriodoAltaModif.Periodo.Valor);

          SqlType := stInsert;
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('PC_ID',            sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('PC_FECHAMODIF',        exDateTime);
          Fields.Add('PC_USUMODIF',          Sesion.UserID);
          Fields.Add('PC_ESTADO',            'C');

          SqlType := stUpdate;
        end
    end;

  BeginTrans;
  try
    Result := inherited DoABM;

    if ModoABM = maAlta then
      begin
        sSql := 'ART.INVERSION.DO_ALTAPERIODOCONTABLE(:Periodo, :Usuario);';
        EjecutarStoreSTEx(sSql, [edPeriodoAltaModif.Periodo.Valor, Sesion.UserID]);
      end
    else if ModoABM = maBaja then
      begin
        IdTipoInstr := sdqConsulta.FieldByName('IDTIPO_INSTRUMENTO').AsInteger;
        Fecha       := sdqConsulta.FieldByName('ULFECHAPER').AsDateTime;

        DoImprimirAsientoAContabilizar('C', '', Fecha, IdTipoInstr);
        DoEjecutarInterfaceAsientos('IM', Fecha, IdTipoInstr, True);
      end;

    CommitTrans;
  except
    on E: Exception do
      begin
        RollBack;
        Raise Exception.Create(E.Message + CRLF + 'Error al guardar periodos contables.');
      end;
  end;
end;

procedure TfrmInvPeriodosContables.RefreshData;
var
  sWhere, sSql: String;
begin
  sWhere := '';

  sSql := 'SELECT PC_ID ID, PC_PERIODO PERIODO, ' +
                 'DECODE(PC_ESTADO, ''A'', ''Abierto'', ''C'', ''Cerrado'', ''Erróneo'') ESTADO, ' +
                 'TRUNC(PC_FECHAALTA) FECHA_ALTA, PC_USUALTA USU_ALTA, ' +
                 'TRUNC(PC_FECHAMODIF) FECHA_MODIF, PC_USUMODIF USU_MODIF, ' +
                 'PC_ESTADO CODESTADO, TI_DESCRIPCION TIPO_INSTRUMENTO, ' +
                 'TI_ID IDTIPO_INSTRUMENTO, ART.UTILES.PERIODO_ULTIMODIA(PC_PERIODO) ULFECHAPER ' +
            'FROM NPC_PERIODOCONTABLE, NTI_TIPOINSTRUMENTO ' +
           'WHERE TI_ID = PC_IDTIPOINSTRUMENTO';

  if fraTipoInstrumento.IsSelected then
    sWhere := sWhere + ' AND TI_ID = ' + SqlValue(fraTipoInstrumento.Value);

  if not IsEmptyString(edPeriodo.Periodo.Valor) then
    sWhere := sWhere + ' AND PC_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;

  inherited;
end;

function TfrmInvPeriodosContables.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(IsEmptyString(edPeriodoAltaModif.Periodo.Valor), edPeriodoAltaModif, 'Debe indicar el período.');

  sSql := 'SELECT 1 ' +
            'FROM NPC_PERIODOCONTABLE ' +
           'WHERE PC_PERIODO = :Periodo';
  Verificar(ExisteSqlEx(sSql, [edPeriodoAltaModif.Periodo.Valor]), edPeriodoAltaModif, 'El período seleccionado ya existe.');

  Result := True;
end;

procedure TfrmInvPeriodosContables.tbEliminarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.FieldByName('CODESTADO').AsString = 'C', edPeriodoAltaModif, 'El período seleccionado no debe estar cerrado.');

  inherited;
end;

procedure TfrmInvPeriodosContables.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraTipoInstrumento.Clear;
  edPeriodo.Clear;
end;

procedure TfrmInvPeriodosContables.FormCreate(Sender: TObject);
begin
  inherited;

  with fraTipoInstrumento do
    begin
      TableName   := 'NTI_TIPOINSTRUMENTO';
      FieldID     := 'TI_ID';
      FieldCodigo := 'TI_ID';
      FieldDesc   := 'TI_DESCRIPCION';
      FieldBaja   := 'TI_FECHABAJA';
      ShowBajas   := True;
    end;

  MSG_BAJA      := '¿ Desea cerrar el período seleccionado ?';
  ShowActived   := False;
  Sql.TableName := 'NPC_PERIODOCONTABLE';
end;

end.
