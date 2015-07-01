unit unIndicadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArt, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unfraCtbTablas;

type
  TfrmIndicadores = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    edPN_DESCRIPCION: TEdit;
    Label2: TLabel;
    fraPN_SECTOR: TfraCodigoDescripcion;
    fraPN_MODULO: TfraCtbTablas;
    Label3: TLabel;
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    FIdConcepto: TTableId;
    procedure SetIdConcepto(const Value: TTableId);
  public
    property IdConcepto: TTableId     read FIdConcepto     write SetIdConcepto;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmIndicadores: TfrmIndicadores;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, 
  VCLExtra, CustomDlgs;

procedure TfrmIndicadores.ClearControls;
begin
  edPN_DESCRIPCION.Clear;
  fraPN_SECTOR.Clear;
  fraPN_MODULO.Clear;
end;

procedure TfrmIndicadores.LoadControls;
begin
  edPN_DESCRIPCION.Text := sdqConsulta.FieldByName('INDICADOR').AsString;
  fraPN_SECTOR.Codigo   := sdqConsulta.FieldByName('CODSECTOR').AsString;
  fraPN_MODULO.Codigo   := sdqConsulta.FieldByName('CODMODULO').AsString;
end;

function TfrmIndicadores.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if (ModoABM = maAlta) or (ModoABM = maModificacion) then
        begin
          if ModoABM = maAlta then
            begin
              SqlType := stInsert;

              PrimaryKey.Add('PN_ID',     GetSecNextVal('SEQ_OPN_ID'));
              Fields.Add('PN_FECHAALTA',  exDateTime);
              Fields.Add('PN_USUALTA',    Sesion.UserID);
            end
          else
            begin
              SqlType := stUpdate;

              PrimaryKey.Add('PN_ID',     sdqConsulta.FieldByName('ID').AsInteger);
              Fields.Add('PN_FECHAMODIF', exDateTime);
              Fields.Add('PN_USUMODIF',   Sesion.UserID);
            end;

          Fields.Add('PN_IDCONCEPTO',     FIdConcepto);
          Fields.Add('PN_DESCRIPCION',    edPN_DESCRIPCION.Text);
          Fields.Add('PN_SECTOR',         fraPN_SECTOR.Codigo);
          Fields.Add('PN_MODULO',         fraPN_MODULO.Codigo);
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('PN_ID',         sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('PN_FECHABAJA',      exDateTime);
          Fields.Add('PN_USUBAJA',        Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmIndicadores.Validar: Boolean;
begin
  Verificar(IsEmptyString(edPN_DESCRIPCION.Text), edPN_DESCRIPCION, 'El indicador es obligatorio.');
  Verificar(fraPN_SECTOR.IsEmpty, fraPN_SECTOR, 'El sector es obligatorio.');
  Verificar(fraPN_MODULO.IsEmpty, fraPN_MODULO, 'El módulo es obligatorio.');

  Result := True;
end;

procedure TfrmIndicadores.tbRefrescarClick(Sender: TObject);
var
  sWhere, sSql: String;
begin
  sWhere := '';

  sSql := 'SELECT PN_DESCRIPCION INDICADOR, SC_DESCRIPCION SECTOR, TRUNC(PN_FECHABAJA) FECHA_BAJA, ' +
                 'SC_ID, PN_ID ID, TB_DESCRIPCION MODULO, PN_SECTOR CODSECTOR, PN_MODULO CODMODULO ' +
            'FROM CTB_TABLAS, USC_SECTORES, OPN_PRESUPUESTOCONCINDICADOR ' +
           'WHERE SC_CODIGO(+) = PN_SECTOR ' +
             'AND TB_CODIGO = PN_MODULO ' +
             'AND TB_CLAVE = ''MCIPR'' ' +
             'AND PN_IDCONCEPTO = :IdConcepto';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND PN_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  sdqConsulta.ParamByName('IdConcepto').AsInteger := FIdConcepto;

  inherited;
end;

procedure TfrmIndicadores.SetIdConcepto(const Value: TTableId);
var
  sSql: String;
begin
  if FIdConcepto <> Value then
    begin
      FIdConcepto := Value;

      sSql := 'SELECT PC_DESCRIPCION ' +
                'FROM OPC_PRESUPUESTOCONCEPTO ' +
               'WHERE PC_ID = :IdConcepto';
      Caption := 'Administración de Indicadores por Concepto - ' + ValorSqlEx(sSql, [FIdConcepto]);

      tbRefrescarClick(nil);
    end;
end;

procedure TfrmIndicadores.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'CONT.OPN_PRESUPUESTOCONCINDICADOR';

  with fraPN_SECTOR do
    begin
      TableName   := 'USC_SECTORES';
      FieldID     := 'SC_ID';
      FieldCodigo := 'SC_CODIGO';
      FieldDesc   := 'SC_DESCRIPCION';
      FieldBaja   := 'SC_FECHABAJA';
      ShowBajas   := False;
    end;
                   
  with fraPN_MODULO do
    begin
      Clave     := 'MCIPR';
      ShowBajas := False;
    end;
end;

procedure TfrmIndicadores.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmIndicadores.tbModificarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El indicador ha sido dado de baja.');

  inherited;
end;

procedure TfrmIndicadores.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El indicador ya ha sido dado de baja.');

  inherited;
end;

end.


