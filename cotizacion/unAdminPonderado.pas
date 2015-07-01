unit unAdminPonderado;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   04-08-03
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, ToolEdit, DateComboBox, StdCtrls,
  Mask, PatternEdit, CardinalEdit, CurrEdit;

type
  TfrmAdminPonderado = class(TfrmCustomConsulta)
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edPO_NROPONDERADO: TCardinalEdit;
    gbFecha: TGroupBox;
    cmbPO_FECHAVIGENCIA: TDateComboBox;
    Label2: TLabel;
    Label3: TLabel;
    GridSeleccionadas: TArtDBGrid;
    sdqSeleccionadas: TSDQuery;
    dsSeleccionadas: TDataSource;
    gbTarifa: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Bevel3: TBevel;
    edPO_SUMAFIJAFINAL: TCurrencyEdit;
    edPO_PORCVARIABLEFINAL: TCurrencyEdit;
    edPO_COSTOFINAL: TCurrencyEdit;
    tbGuardar: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridSeleccionadasDblClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure edPO_NROPONDERADOKeyPress(Sender: TObject; var Key: Char);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
    FCerrado: Boolean;
    FEstado: String;
    FIdPonderado: Integer;
    FNroPonderado: Integer;

    function CargarPonderado(const aId: Integer): Boolean;

    procedure ActualizarSeleccionadas;
    procedure AgregaCotizacion;
    procedure ClearControls;
    procedure ClearCotizacion;

    procedure EliminaCotizacion;
  protected
    function DoABM: Boolean;
    function Validar: Boolean;
    
    procedure LockControls(ALocked: Boolean = True);
  public
    procedure DoCargar(aIdPonderado: Integer; Estado: String);
  end;

var
  frmAdminPonderado: TfrmAdminPonderado;

implementation

uses
  unPrincipal, VCLExtra, unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, unSesion;

{$R *.DFM}

procedure TfrmAdminPonderado.ActualizarSeleccionadas;
var
  sSql: String;
begin
  sSql :=
    'SELECT   tcp_cotizacionponderado.*, ac_codigo, ac_descripcion' +
       ' FROM tcp_cotizacionponderado, cac_actividad' +
      ' WHERE ac_id = cp_idactividad' +
        ' AND cp_usuario = :usuario' +
   ' ORDER BY 1';

  if sdqSeleccionadas.Active then
    sdqSeleccionadas.Refresh
  else
    OpenQueryEx(sdqSeleccionadas, [Sesion.UserId], sSql);
end;

procedure TfrmAdminPonderado.ClearControls;
begin
  cmbPO_FECHAVIGENCIA.Clear;
  edPO_SUMAFIJAFINAL.Clear;
  edPO_PORCVARIABLEFINAL.Clear;
  edPO_COSTOFINAL.Clear;
end;

procedure TfrmAdminPonderado.EliminaCotizacion;
var
  sSql: String;
begin
  sSql :=
    'DELETE FROM tcp_cotizacionponderado' +
         ' WHERE cp_usuario = :usuario' +
           ' AND cp_idcotizacion = :idcotizacion';
  EjecutarSqlEx(sSql, [Sesion.UserId, sdqSeleccionadas.FieldByName('cp_idcotizacion').AsString]);

  ActualizarSeleccionadas;
end;

procedure TfrmAdminPonderado.AgregaCotizacion;
var
  aSqlPonderado: TSql;
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM tcp_cotizacionponderado' +
    ' WHERE cp_usuario = :usuario' +
      ' AND cp_idcotizacion = :idcotizacion';
  Verificar(ExisteSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('co_id').AsString]), nil, 'La cotización ya está incluida.');

  aSqlPonderado := TSql.Create('tcp_cotizacionponderado');
  BeginTrans;
  try
    try
      //Agrega la cotizacion a partir de la info que tiene el sdqconsulta
      aSqlPonderado.SqlType := stInsert;
      aSqlPonderado.Fields.Add('cp_idcotizacion',    sdqConsulta.FieldByName('co_id').AsString, False);
      aSqlPonderado.Fields.Add('cp_nrocotizacion',   sdqConsulta.FieldByName('co_nrocotizacion').AsString, False);
      aSqlPonderado.Fields.Add('cp_cuit',            sdqConsulta.FieldByName('co_cuit').AsString);
      aSqlPonderado.Fields.Add('cp_razonsocial',     sdqConsulta.FieldByName('co_razonsocial').AsString);
      aSqlPonderado.Fields.Add('cp_sumafija',        sdqConsulta.FieldByName('tc_sumafija').AsString, dtNumber);
      aSqlPonderado.Fields.Add('cp_porcvariable',    sdqConsulta.FieldByName('tc_porcvariable').AsString, dtNumber);
      aSqlPonderado.Fields.Add('cp_costofinal',      sdqConsulta.FieldByName('tc_costofinal').AsString, dtNumber);

      aSqlPonderado.Fields.Add('cp_idactividad',     sdqConsulta.FieldByName('co_idactividad').AsString, dtNumber);
      aSqlPonderado.Fields.Add('cp_canttrabajador',  sdqConsulta.FieldByName('co_canttrabajador').AsInteger);
      aSqlPonderado.Fields.Add('cp_masasalarial',    sdqConsulta.FieldByName('co_masasalarial').AsFloat, dtNumber);
      aSqlPonderado.Fields.Add('cp_costosiniestral', sdqConsulta.FieldByName('co_costosiniestral').AsFloat, dtNumber);
      aSqlPonderado.Fields.Add('cp_usuario',         Sesion.UserId);

      EjecutarSqlST(aSqlPonderado.Sql);
      CommitTrans;
    except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al guardar los datos.');
        RollBack;
      end;
    end;
  finally
    aSqlPonderado.Free;
  end;
  ActualizarSeleccionadas;
end;

procedure TfrmAdminPonderado.LockControls(ALocked: Boolean = True);
begin
  if ALocked then
  begin
    Grid.Options              := (Grid.Options - [dgEditing]); //anula la edicion
    Grid.Color                := clBtnFace;
    GridSeleccionadas.Options := (GridSeleccionadas.Options - [dgEditing]); //anula la edicion
    GridSeleccionadas.Color   := clBtnFace;
  end
  else
  begin
    Grid.Options              := (Grid.Options + [dgEditing]); //premite la edicion
    Grid.Color                := clWindow;
    GridSeleccionadas.Options := (GridSeleccionadas.Options - [dgEditing]); //anula la edicion
    GridSeleccionadas.Color   := clWindow;
  end;
  VCLExtra.LockControls (gbTarifa, ALocked);
  VCLExtra.LockControls (gbFecha, ALocked);
end;

procedure TfrmAdminPonderado.ClearCotizacion;
var
  sSql: String;
begin
  //Limpio los registros de la tmp
  sSql := 'DELETE FROM tcp_cotizacionponderado WHERE cp_usuario = :usuario';
  EjecutarSqlEx(sSql, [Sesion.UserId]);
  ActualizarSeleccionadas;
end;

function TfrmAdminPonderado.CargarPonderado(const aId: Integer): Boolean;
var
  sSql: String;
begin
  Result := True;

  //Inserto los registros
  sSql :=
    'INSERT INTO tcp_cotizacionponderado' +
               ' (cp_idcotizacion, cp_nrocotizacion, cp_cuit, cp_razonsocial, cp_sumafija, cp_porcvariable, cp_costofinal,' +
                ' cp_usuario, cp_idactividad, cp_masasalarial, cp_canttrabajador, cp_costosiniestral, cp_tasaincidencia)' +
     ' (SELECT co_id, co_nrocotizacion, co_cuit, co_razonsocial, tc_sumafija, tc_porcvariable, tc_costofinal,' +
              ':usuario, co_idactividad, co_masasalarial, co_canttrabajador, co_costosiniestral, co_tasaincidencia' +
        ' FROM aco_cotizacion, apo_cotizacionponderado, adp_detalleponderado, atc_tarifacobrar' +
       ' WHERE dp_idcotizacion = co_id' +
         ' AND dp_idcotizacionponderado = po_id' +
         ' AND tc_idcotizacion = co_id' +
         ' AND tc_id IN(SELECT MAX(tc_id)' +
                        ' FROM atc_tarifacobrar' +
                    ' GROUP BY tc_idcotizacion)' +
         ' AND po_id = :id)';
  EjecutarSqlEx(sSql, [Sesion.UserID, aId]);

  // Actualizo los campos
  sSql :=
    'SELECT po_nroponderado, po_fechavigencia, po_sumafijafinal, po_porcvariablefinal, po_costofinal, po_usucerrado' +
     ' FROM apo_cotizacionponderado' +
    ' WHERE po_id = :id';
  with GetQueryEx(sSql, [aId]) do
  try
    if not Eof then
    begin
      //carga la informacion en los TEdits
      FNroPonderado                := FieldByName('po_nroponderado').AsInteger;
      edPO_NROPONDERADO.Value      := FieldByName('po_nroponderado').AsInteger;
      cmbPO_FECHAVIGENCIA.Date     := FieldByName('po_fechavigencia').AsDateTime;
      edPO_SUMAFIJAFINAL.Value     := FieldByName('po_sumafijafinal').AsFloat;
      edPO_PORCVARIABLEFINAL.Value := FieldByName('po_porcvariablefinal').AsFloat;
      edPO_COSTOFINAL.Value        := FieldByName('po_costofinal').AsFloat;

      //Carga la lista de empresas seleccionadas
      ActualizarSeleccionadas;
      if FieldByName('po_usucerrado').AsString <> '' then
        FCerrado := True
      else
        FCerrado := False;
    end;
  finally
    Free;
  end;
end;

procedure TfrmAdminPonderado.DoCargar(aIdPonderado: Integer; Estado: String);
begin
  ClearCotizacion;
  ClearControls;

  //cargo los controles
  if Estado = 'alta' then
  begin
    FIdPonderado := aIdPonderado;
    FEstado := Estado;
    LockControls(False);
    VCLExtra.EnableControls([tbImprimir,tbModificar], False);
    VCLExtra.EnableControls([tbGuardar], True);
    VCLExtra.EnableControls([tbNuevo], False);
  end
  else if (Estado = 'modif') and CargarPonderado(aIdPonderado) then
  begin
    FIdPonderado := aIdPonderado;
    FEstado := Estado;
    LockControls(False);
    VCLExtra.EnableControls([tbImprimir], False);
    VCLExtra.EnableControls([tbModificar], False);
    VCLExtra.EnableControls([tbGuardar], True);
    VCLExtra.EnableControls([tbNuevo], True);
  end
  else if (Estado = 'consulta') and CargarPonderado(aIdPonderado) then
  begin
    FIdPonderado := aIdPonderado;
    FEstado := Estado;
    LockControls(True);
    VCLExtra.EnableControls([tbImprimir], True);
    VCLExtra.EnableControls([tbModificar], True);
    VCLExtra.EnableControls([tbGuardar], False);
    VCLExtra.EnableControls([tbNuevo], True);
  end
  else if Estado = 'seleccion' then
  begin
    FIdPonderado := aIdPonderado;
    FEstado := Estado;
    //Ahora me dedico a habilitar y deshabilitar controles segun corresponda
    LockControls(True);
    VCLExtra.EnableControls([tbImprimir], False);
    VCLExtra.EnableControls([tbModificar], False);
    VCLExtra.EnableControls([tbGuardar], False);
    VCLExtra.EnableControls([tbNuevo], True);
  end;
  if FCerrado then
  begin
    LockControls(True);
    VCLExtra.EnableControls([tbModificar], False);
    VCLExtra.EnableControls([tbGuardar], False);
    MessageDlg('La cotización ponderada se encuentra cerrada. Solo puede ingresar en modo consulta.', mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmAdminPonderado.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  //Cargo la lista de cotizaciones
  sSql :=
    'SELECT   co_id, co_nrocotizacion, co_cuit, co_razonsocial, tc_sumafija, tc_porcvariable, tc_costofinal, ac_codigo, ac_descripcion, co_idactividad,' +
            ' co_canttrabajador, co_masasalarial, co_costosiniestral, co_tasaincidencia' +
       ' FROM aco_cotizacion, atc_tarifacobrar, cac_actividad' +
      ' WHERE tc_idcotizacion = co_id' +
        ' AND ac_id = co_idactividad' +
        ' AND tc_id IN(SELECT MAX(tc_id)' +
                       ' FROM atc_tarifacobrar' +
                   ' GROUP BY tc_idcotizacion)' +
   ' ORDER BY 1';
  OpenQuery(sdqConsulta, sSql);

  //Reordeno los botones
  tbGuardar.Left := 0;
end;

function TfrmAdminPonderado.Validar: Boolean;
begin
  Verificar(cmbPO_FECHAVIGENCIA.IsEmpty, cmbPO_FECHAVIGENCIA, 'La fecha de vigencia de la cotización ponderada es obligatoria.');
  Result := True;
end;

function TfrmAdminPonderado.DoABM: Boolean;
var
  SqlPonderado: TSql;
  SqlDetalle: TSql;
  sSql: String;
begin
  BeginTrans;
  Result := True;
  SqlPonderado := TSql.Create('apo_cotizacionponderado');
  SqlDetalle   := TSql.Create('adp_detalleponderado');
  try
    try
      if FEstado = 'alta' then
      begin
        SqlPonderado.SqlType := stInsert;
        FIdPonderado := ValorSql('SELECT seq_apo_id.NEXTVAL FROM DUAL');
        FNroPonderado := ValorSqlInteger('SELECT NVL(MAX(po_nroponderado), 0) + 1 FROM apo_cotizacionponderado', 0);
        SqlPonderado.Fields.Add('po_nroponderado', FNroPonderado, False);
        SqlPonderado.Fields.Add('po_fechaalta',    SQL_ACTUALDATE, False);
        SqlPonderado.Fields.Add('po_usualta',      Sesion.UserID);
      end
      else
      begin
        SqlPonderado.SqlType := stUpdate;
        SqlPonderado.Fields.Add('po_fechamodif', SQL_ACTUALDATE, False);
        SqlPonderado.Fields.Add('po_usumodif',   Sesion.UserID);
      end;
      SqlPonderado.PrimaryKey.Add('po_id',            FIdPonderado, False);
      SqlPonderado.Fields.Add('po_fechavigencia',     SQL_ACTUALDATE, False);
      SqlPonderado.Fields.Add('po_sumafijafinal',     edPO_SUMAFIJAFINAL.Value, dtNumber);
      SqlPonderado.Fields.Add('po_porcvariablefinal', edPO_PORCVARIABLEFINAL.Value, dtNumber);
      SqlPonderado.Fields.Add('po_costofinal',        edPO_COSTOFINAL.Value, dtNumber);
      EjecutarSqlST(SqlPonderado.Sql);

      if FEstado <> 'alta' then
      begin
        sSql := 'DELETE FROM adp_detalleponderado WHERE dp_idcotizacionponderado = :idcotizacion';
        EjecutarSqlSTEx(sSql, [FIdPonderado]);
      end;

      sdqSeleccionadas.First;
      while not sdqSeleccionadas.Eof do
      begin
        SqlDetalle.SqlType := stInsert;
        SqlDetalle.PrimaryKey.Add('dp_id',                'SEQ_ACP_ID.NEXTVAL', False);
        SqlDetalle.Fields.Add('dp_idcotizacionponderado', FIdPonderado, False);
        SqlDetalle.Fields.Add('dp_idcotizacion',          sdqSeleccionadas.FieldByName('cp_idcotizacion').AsString, False);
        SqlPonderado.Fields.Add('dp_fechaalta',           SQL_ACTUALDATE, False);
        SqlPonderado.Fields.Add('dp_usualta',             Sesion.UserID);
        EjecutarSqlST(SqlDetalle.Sql);

        SqlDetalle.Clear;
        SqlDetalle.TableName := 'adp_detalleponderado';
        sdqSeleccionadas.Next;
      end;

      CommitTrans;
      MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
    except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al guardar los datos.');
        RollBack;
        Result := False;
      end;
    end;
  finally
    SqlPonderado.Free;
    SqlDetalle.Free;
  end;
end;

procedure TfrmAdminPonderado.GridDblClick(Sender: TObject);
begin
  if ((sdqConsulta.Active) and (not sdqConsulta.Eof) and (FEstado = 'modif')) then
    AgregaCotizacion;
end;

procedure TfrmAdminPonderado.GridSeleccionadasDblClick(Sender: TObject);
begin
  if ((sdqSeleccionadas.Active) and (not sdqSeleccionadas.Eof) and (FEstado = 'modif')) then
    EliminaCotizacion;
end;

procedure TfrmAdminPonderado.tbGuardarClick(Sender: TObject);
begin
  inherited;

  if Validar and DoABM then
    DoCargar(FIdPonderado, 'consulta')
end;

procedure TfrmAdminPonderado.edPO_NROPONDERADOKeyPress(Sender: TObject; var Key: Char);
var
  iId: Integer;
  sSql: String;
begin
  if Key = #13 then
    if (edPO_NROPONDERADO.Value <> 0) then
    begin
      sSql :=
        'SELECT NVL(po_id, 0)' +
         ' FROM apo_cotizacionponderado' +
        ' WHERE po_nroponderado = :nroponderado';
      iId := ValorSqlIntegerEx(sSql, [edPO_NROPONDERADO.Value], 0);
      DoCargar(iId, 'consulta');
    end;
end;

procedure TfrmAdminPonderado.tbNuevoClick(Sender: TObject);
begin
  DoCargar(0, 'alta');
end;

procedure TfrmAdminPonderado.tbModificarClick(Sender: TObject);
var
  iId: Integer;
  sSql: String;
begin
  if (edPO_NROPONDERADO.Value <> 0) then
  begin
    sSql :=
      'SELECT NVL(po_id, 0)' +
       ' FROM apo_cotizacionponderado' +
      ' WHERE po_nroponderado = :nroponderado';
    iId := ValorSqlIntegerEx(sSql, [edPO_NROPONDERADO.Value], 0);
    DoCargar(iId, 'modif');
  end;
end;

end.
