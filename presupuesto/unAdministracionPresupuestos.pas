unit unAdministracionPresupuestos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit;

type
  TfrmAdministracionPresupuestos = class(TfrmCustomGridABM)
    edAnio: TIntEdit;
    chkNoMostrarBajas: TCheckBox;
    Label1: TLabel;
    ShortCutControl1: TShortCutControl;
    Label2: TLabel;
    edAnioAlta: TIntEdit;
    Label3: TLabel;
    edVersionAlta: TIntEdit;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbCongelar: TToolButton;
    tbMarcarActual: TToolButton;
    Label4: TLabel;
    edUltMesAltaModif: TIntEdit;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edAnioAltaExit(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbCongelarClick(Sender: TObject);
    procedure tbMarcarActualClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
  public
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmAdministracionPresupuestos: TfrmAdministracionPresupuestos;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, unArt,
  VCLExtra, CustomDlgs;

procedure TfrmAdministracionPresupuestos.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edAnio.Clear;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmAdministracionPresupuestos.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT PR_AÑO AÑO, PR_VERSION VERSION, TRUNC(PR_FECHACONGELADO) FECHA_CONGELADO, ' +
                 'PR_ACTUAL ACTUAL, TRUNC(PR_FECHABAJA) FECHA_BAJA, PR_ID ID, ' +
                 'DECODE(PR_ACTUAL, ''S'', ' + SqlValue(vSI) + ', ' + SqlValue(vNO) + ') ACTUAL_GRILLA, ' +
                 'PR_ULTIMOMES ULTMES ' +
            'FROM OPR_PRESUPUESTO ' +
           'WHERE 1 = 1';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND PR_FECHABAJA IS NULL';

  if not edAnio.IsEmpty then
    sWhere := sWhere + ' AND PR_AÑO = ' + SqlValue(edAnio.Value);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmAdministracionPresupuestos.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'OPR_PRESUPUESTO';
end;

procedure TfrmAdministracionPresupuestos.ClearControls;
begin
  VCLExtra.LockControl(edVersionAlta);
  VCLExtra.LockControls([edAnioAlta], False);

  edAnioAlta.Clear;
  edVersionAlta.Clear;
  edUltMesAltaModif.Clear;
end;


procedure TfrmAdministracionPresupuestos.LoadControls;
begin
  VCLExtra.LockControls([edAnioAlta, edVersionAlta]);

  edAnioAlta.Value        := sdqConsulta.FieldByName('AÑO').AsInteger;
  edVersionAlta.Value     := sdqConsulta.FieldByName('VERSION').AsInteger;
  edUltMesAltaModif.Value := sdqConsulta.FieldByName('ULTMES').AsInteger;
end;

function TfrmAdministracionPresupuestos.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maAlta then
        begin
          PrimaryKey.Add('PR_ID',    GetSecNextVal('SEQ_OPR_ID'));
          Fields.Add('PR_AÑO',       edAnioAlta.Value);
          Fields.Add('PR_VERSION',   edVersionAlta.Value);
          if not edUltMesAltaModif.IsEmpty then
            Fields.Add('PR_ULTIMOMES', edUltMesAltaModif.Value);
          Fields.Add('PR_FECHAALTA', exDateTime);
          Fields.Add('PR_USUALTA',   Sesion.UserID );

          SqlType := stInsert;
        end
      else if ModoABM = maModificacion then
        begin
          PrimaryKey.Add('PR_ID',    sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('PR_ULTIMOMES', edUltMesAltaModif.Value);
          Fields.Add('PR_FECHAMODIF',exDateTime);
          Fields.Add('PR_USUMODIF',  Sesion.UserID );

          SqlType := stUpdate;
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('PR_ID',    sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('PR_FECHABAJA', exDateTime);
          Fields.Add('PR_USUBAJA',   Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmAdministracionPresupuestos.Validar: Boolean;
begin
  Verificar(edAnioAlta.IsEmpty, edAnioAlta, 'El año es obligatorio.');
  Verificar(edAnioAlta.Value <= 1996, edAnioAlta, 'El año no puede ser menor a 1996.');
  Verificar(edVersionAlta.IsEmpty, edVersionAlta, 'La versión no puede ser nula.');
  Verificar((ModoABM = maModificacion) and edUltMesAltaModif.IsEmpty, edUltMesAltaModif, 'Debe indicar el último mes.');
  Verificar(not edUltMesAltaModif.IsEmpty and ((edUltMesAltaModif.Value < 1) or (edUltMesAltaModif.Value > 12)), edUltMesAltaModif, 'El último mes debe estar entre 1 y 12.');

  Result := True;
end;

procedure TfrmAdministracionPresupuestos.edAnioAltaExit(Sender: TObject);
var
  sSql: String;
begin
  if ModoABM = maAlta then
    begin
      sSql := 'SELECT NVL(MAX(PR_VERSION), 0)+1 ' +
                'FROM OPR_PRESUPUESTO ' +
               'WHERE PR_AÑO = :Anio';
      edVersionAlta.Value := ValorSqlIntegerEx(sSql, [edAnioAlta.Value]);
    end;
end;

procedure TfrmAdministracionPresupuestos.btnAceptarClick(Sender: TObject);
begin
  edAnioAltaExit(nil);

  inherited;
end;

procedure TfrmAdministracionPresupuestos.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El presupuesto ya ha sido dado de baja.');
  Verificar(sdqConsulta.FieldByName('ACTUAL').AsString <> 'N', nil, 'El presupuesto no debe ser el actual.');

  inherited;                                                 
end;

procedure TfrmAdministracionPresupuestos.tbCongelarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No ha seleccionado ningún presupuesto en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El presupuesto ha sido dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_CONGELADO').IsNull, nil, 'El presupuesto ya ha sido congelado.');

  if MsgBox('¿Está seguro de querer congelar el presupuesto? Esto hará que no pueda ser modificado.', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      sSql := 'UPDATE OPR_PRESUPUESTO ' +
                 'SET PR_FECHACONGELADO = SYSDATE, ' +
                     'PR_USUCONGELADO = :UserId ' +
               'WHERE PR_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('ID').AsInteger]);

      RefreshData;
    end;
end;

procedure TfrmAdministracionPresupuestos.tbMarcarActualClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No ha seleccionado ningún presupuesto en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El presupuesto ha sido dado de baja.');
  Verificar(sdqConsulta.FieldByName('ACTUAL').AsString <> 'N', nil, 'El presupuesto no debe ser el actual.');

  if MsgBox('¿Está seguro de querer marcar el presupuesto como el actual?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      BeginTrans;
      try
        sSql := 'UPDATE OPR_PRESUPUESTO ' +
                   'SET PR_ACTUAL = ''N'' ' +
                 'WHERE PR_ACTUAL = ''S''';
        EjecutarSqlST(sSql);

        sSql := 'UPDATE OPR_PRESUPUESTO ' +
                   'SET PR_ACTUAL = ''S'', ' +
                       'PR_FECHAMODIF = SYSDATE, ' +
                       'PR_USUMODIF = :UserId ' +
                 'WHERE PR_ID = :Id';
        EjecutarSqlSTEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('ID').AsInteger]);

        RefreshData;
        CommitTrans;
      except
        RollBack;
        raise;
      end;
    end;
end;

procedure TfrmAdministracionPresupuestos.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if AreIn(Field.FullName, ['ACTUAL_GRILLA']) then
    begin
      AFont.Style := AFont.Style + [fsBold];
      if (Field.Value = vSI) then
        AFont.Color := clTeal
      else
        AFont.Color := clMaroon;
    end;
end;

end.

