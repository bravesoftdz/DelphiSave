unit unManConsultas;

{
CREATE TABLE ico_consulta
 (
  co_id                      NUMBER(8) NOT NULL,
  co_descripcion             VARCHAR2(100) NOT NULL,
  co_herramientas            CHAR(5) NOT NULL,
  co_sql_select              BLOB,
  co_sql_insert              BLOB,
  co_sql_update              BLOB,
  co_sql_delete              BLOB,
  co_fechaalta               DATE DEFAULT SYSDATE,
  co_usualta                 VARCHAR2(20),
  co_fechamodif              DATE,
  co_usumodif                VARCHAR2(20),
  co_fechabaja               DATE,
  co_usubaja                 VARCHAR2(20),
  CONSTRAINT pk_ico_consulta PRIMARY KEY (co_id) USING INDEX TABLESPACE IND
 )
/
COMMENT ON TABLE ico_consulta IS 'ImpoExpo - Consultas Editables'
/
COMMENT ON COLUMN ico_consulta.co_descripcion IS 'Descripción de la Consulta'
/
COMMENT ON COLUMN ico_consulta.co_herramientas IS 'Herramientas habilitadas'
/
COMMENT ON COLUMN ico_consulta.co_id IS 'Id de la Consulta'
/
COMMENT ON COLUMN ico_consulta.co_sql_delete IS 'Sql para la eliminación de registros'
/
COMMENT ON COLUMN ico_consulta.co_sql_insert IS 'Sql para la inserción de los datos'
/
COMMENT ON COLUMN ico_consulta.co_sql_select IS 'Sql de Selección de los datos'
/
COMMENT ON COLUMN ico_consulta.co_sql_update IS 'Sql para la modificación de los datos'
/
CREATE SYNONYM ART.ICO_CONSULTA FOR IMPOEXPO.ICO_CONSULTA
/
CREATE TABLE IMPOEXPO.icc_consultacampo
 (
  cc_idconsulta              NUMBER(8) NOT NULL,
  cc_orden                   NUMBER(4) NOT NULL,
  cc_nombre                  VARCHAR2(30) NOT NULL,
  cc_titulo                  VARCHAR2(100),
  cc_condicion               VARCHAR2(250),
  cc_fechaalta               DATE DEFAULT SYSDATE,
  cc_usualta                 VARCHAR2(20),
  cc_fechamodif              DATE,
  cc_usumodif                VARCHAR2(20),
  cc_fechabaja               DATE,
  cc_usubaja                 VARCHAR2(20),
  CONSTRAINT pk_icc_consultacampo PRIMARY KEY (cc_idconsulta, cc_orden) USING INDEX TABLESPACE IND,
  CONSTRAINT uk_icc_idnombre UNIQUE (cc_idconsulta, cc_nombre) USING INDEX TABLESPACE IND
 )
/
CREATE SYNONYM ART.ICC_CONSULTACAMPO FOR IMPOEXPO.ICC_CONSULTACAMPO
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, Db, SDEngine, Placemnt,
  artSeguridad, ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls, mwCustomEdit, PatternEdit, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, Mask, IntEdit, GroupCheckBox, unArtFrame, unFraCodigoDescripcion,
  ImageComboBox, mwHighlighter, mwSqlSyn, unCustomAccionABM, unArtDBAwareFrame;

type
  TfrmManConsultas = class(TfrmCustomAccionABM)
    PageControl: TPageControl;
    tsDatosGenerales: TTabSheet;
    lbCodigo: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    edCO_ID: TIntEdit;
    edCO_DESCRIPCION: TEdit;
    tsSql: TTabSheet;
    CoolBar1: TCoolBar;
    tbarSql: TToolBar;
    tbSqlLimpiar: TToolButton;
    ToolButton8: TToolButton;
    tbSqlSintaxis: TToolButton;
    tbArmarSql: TToolButton;
    tbSqlAutoCampos: TToolButton;
    ToolButton2: TToolButton;
    tbSqlImprimir: TToolButton;
    tsCampos: TTabSheet;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbCampNuevo: TToolButton;
    tbCampModificar: TToolButton;
    tbCampEliminar: TToolButton;
    ToolButton1: TToolButton;
    tbCampMoverAbajo: TToolButton;
    tbCampMoverArriba: TToolButton;
    ToolButton9: TToolButton;
    tbCampImprimir: TToolButton;
    dbgICC_CONSULTACAMPO: TArtDBGrid;
    fpCamposABM: TFormPanel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel3: TBevel;
    edCampDescripcion: TEdit;
    btnCampAceptar: TButton;
    btnCampCancelar: TButton;
    edCondicion: TEdit;
    CheckBox1: TCheckBox;
    pcSql: TPageControl;
    tsSqlSelect: TTabSheet;
    tsSqlInsert: TTabSheet;
    tsSqlUpdate: TTabSheet;
    tsSqlDelete: TTabSheet;
    mwCO_SQL_SELECT: TmwCustomEdit;
    mwCO_SQL_INSERT: TmwCustomEdit;
    mwCO_SQL_UPDATE: TmwCustomEdit;
    mwCO_SQL_DELETE: TmwCustomEdit;
    chgCO_HERRAMIENTAS: TCheckGroup;
    cmbCC_NOMBRE: TComboBox;
    tsEventos: TTabSheet;
    CoolBar3: TCoolBar;
    ToolBar3: TToolBar;
    tbEvNuevo: TToolButton;
    tbEvModificar: TToolButton;
    tbEvEliminar: TToolButton;
    ToolButton7: TToolButton;
    tbEvMoverAbajo: TToolButton;
    tbEvMoverArriba: TToolButton;
    ToolButton13: TToolButton;
    tbEvImprimir: TToolButton;
    dbgEventos: TArtDBGrid;
    fpEventosABM: TFormPanel;
    Bevel4: TBevel;
    Label21: TLabel;
    Label3: TLabel;
    Label16: TLabel;
    Bevel5: TBevel;
    Label19: TLabel;
    btnEvAceptar: TButton;
    btnEvCancelar: TButton;
    cmbEvMomento: TImageComboBox;
    cmbEvErrores: TImageComboBox;
    pnlEventSql: TPanel;
    mwEvSql: TmwCustomEdit;
    chkEvCheckParams: TCheckBox;
    cmbEvTipoAccion: TImageComboBox;
    ToolBar1: TToolBar;
    tbEvAbmLimpiar: TToolButton;
    ToolButton5: TToolButton;
    tbEvAbmSintaxis: TToolButton;
    tbEvAbmImprimir: TToolButton;
    mwSqlSyn: TmwSqlSyn;
    sduConsulta: TSDUpdateSQL;
    sdqICC_CONSULTACAMPO: TSDQuery;
    sduICC_CONSULTACAMPO: TSDUpdateSQL;
    dsICC_CONSULTACAMPO: TDataSource;
    TabSheet1: TTabSheet;
    procedure FSFormCreate(Sender: TObject);
    procedure tbArmarSqlClick(Sender: TObject);
    procedure tbSqlAutoCamposClick(Sender: TObject);
    procedure tbSqlSintaxisClick(Sender: TObject);
    procedure btnCampAceptarClick(Sender: TObject);
  private
    ModoABMTablas: TModoABM;

    procedure OnfraPrimaryKeyChange(Sender: TObject);
    procedure SetCO_ID(AId: Integer);
  public
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls(ClearPK: Boolean = False); override;
    procedure LoadControls; override;
    procedure LockControls(ALocked: Boolean = True); override;
  end;

implementation

uses
  unPrincipal, CustomDlgs, StrFuncs, DBFuncs, unDmPrincipal, AnsiSql, SqlFuncs;

{$R *.DFM}

const
  PAG_GENERAL = 0;
  PAG_SQL     = 1;
  PAG_CAMPOS  = 2;

procedure TfrmManConsultas.ClearControls(ClearPK: Boolean);
begin
  inherited;

  PageControl.ActivePageIndex := PAG_GENERAL;

  if ClearPK then
    fraPrimaryKey.Clear;

  edCO_ID.Clear;
  edCO_DESCRIPCION.Clear;
  chgCO_HERRAMIENTAS.Value := 'SSSSF';
  mwCO_SQL_SELECT.Lines.Text := ' ';
  mwCO_SQL_INSERT.Lines.Text := ' ';
  mwCO_SQL_UPDATE.Lines.Text := ' ';
  mwCO_SQL_DELETE.Lines.Text := ' ';

  SetCO_ID(0);
  sdqConsulta.Open;
end;

function TfrmManConsultas.DoABM: Boolean;
  procedure SetId(AFieldName: String; ADataSet: TDataSet);
  begin
    if not ADataSet.IsEmpty then
      with TDataCycler.Create(ADataSet) do
      try
        repeat
          if ADataSet.FieldByName(AFieldName).IsNull then
          begin
            ADataSet.Edit;
            ADataSet.FieldByName(AFieldName).AsInteger :=  edCO_ID.Value;
            ADataSet.Post;
          end;
        until not Cycle;
      finally
        Free;
      end;
  end;

begin
  BeginTrans;
  try
    with sdqConsulta do
    begin
      if ModoABM = maAlta then
      begin
        Insert;
        edCO_ID.Value                  := IncSql('SELECT MAX(CO_ID) FROM ICO_CONSULTA');
        FieldByName('CO_ID').AsInteger := edCO_ID.Value;
      end
      else
        Edit;

      FieldByName('CO_DESCRIPCION').AsString  := edCO_DESCRIPCION.Text;
      FieldByName('CO_HERRAMIENTAS').AsString := chgCO_HERRAMIENTAS.Value;
      FieldByName('CO_SQL_SELECT').AsString   := mwCO_SQL_SELECT.Lines.Text;
      FieldByName('CO_SQL_INSERT').AsString   := mwCO_SQL_INSERT.Lines.Text;
      FieldByName('CO_SQL_UPDATE').AsString   := mwCO_SQL_UPDATE.Lines.Text;
      FieldByName('CO_SQL_DELETE').AsString   := mwCO_SQL_DELETE.Lines.Text;

      Post;
      ApplyUpdates;
    end;

    if sdqICC_CONSULTACAMPO.Active then
    begin
      SetId('CC_IDCONSULTA', sdqICC_CONSULTACAMPO);
      sdqICC_CONSULTACAMPO.ApplyUpdates;
    end;

    {
    if sdqPCT_CANCERTRABAJADOR.Active Then
    begin
      SetId('CT_IDCANCERIGENOINFORME', sdqPCT_CANCERTRABAJADOR);
      sdqPCT_CANCERTRABAJADOR.ApplyUpdates;

      if sdqPCO_CANCERSECTORTRAB.Active Then
      begin
        sdqPCO_CANCERSECTORTRAB.Filtered := False;
        Try
          SetId('CO_IDCANCERIGENOINFORME', sdqPCO_CANCERSECTORTRAB);
          sdqPCO_CANCERSECTORTRAB.ApplyUpdates;
        finally
          sdqPCO_CANCERSECTORTRAB.Filtered := True;
        end;
      end;
    end;
}

    CommitTrans;
    Result := True;
//    FDataModified := False;


    case ModoABM of
      maAlta:         fraPrimaryKey.Value := edCO_ID.Value;
      maModificacion: fraPrimaryKey.Reload;
      maBaja:         ClearControls(True);
    end;
  except
    on E: Exception do
    begin
      RollBack;
      Result := False;
      ErrorMsg(E, 'Error al guardar los datos.');
    end;
  end;
end;

procedure TfrmManConsultas.FSFormCreate(Sender: TObject);
begin
  inherited;

  UnTouch := TList.Create;
  UnTouch.Add(edCO_ID);

  with fraPrimaryKey do
  begin
    FieldID       := 'CO_ID';
    FieldCodigo   := 'CO_ID';
    FieldDesc     := 'CO_DESCRIPCION';
    FieldBaja     := 'CO_FECHABAJA';
    TableName     := 'ICO_CONSULTA';
    OnChange      := OnfraPrimaryKeyChange;
    CaseSensitive := False;
    ShowBajas     := True;
  end;
end;

procedure TfrmManConsultas.LoadControls;
begin
  sdqConsulta.Close;
  sdqConsulta.ParamByName('CO_ID').AsInteger := fraPrimaryKey.Value;
  sdqConsulta.Open;

  inherited;

  edCO_ID.Value              := sdqConsulta.FieldByName('CO_ID').AsInteger;
  edCO_DESCRIPCION.Text      := sdqConsulta.FieldByName('CO_DESCRIPCION').AsString;
  chgCO_HERRAMIENTAS.Value   := sdqConsulta.FieldByName('CO_HERRAMIENTAS').AsString;
  mwCO_SQL_SELECT.Lines.Text := sdqConsulta.FieldByName('CO_SQL_SELECT').AsString;
  mwCO_SQL_INSERT.Lines.Text := sdqConsulta.FieldByName('CO_SQL_INSERT').AsString;
  mwCO_SQL_UPDATE.Lines.Text := sdqConsulta.FieldByName('CO_SQL_UPDATE').AsString;
  mwCO_SQL_DELETE.Lines.Text := sdqConsulta.FieldByName('CO_SQL_DELETE').AsString;
end;

procedure TfrmManConsultas.LockControls(ALocked: Boolean);
var
  AColor: TColor;

  procedure SetBackColor(AEdit: TmwCustomEdit);
  var
    i: Integer;
  begin
    AEdit.Color := AColor;

    for i := 0 to mwSqlSyn.AttrCount - 1 do
       mwSqlSyn.Attribute[i].Background := AColor;
  end;

begin
  inherited;

  pcSql.Enabled := True;
  PageControl.Enabled := True;

  if ALocked Then
    AColor := clBtnFace
  else
    AColor := clWindow;

  SetBackColor(mwCO_SQL_SELECT);
  SetBackColor(mwCO_SQL_INSERT);
  SetBackColor(mwCO_SQL_UPDATE);
  SetBackColor(mwCO_SQL_DELETE);
end;

procedure TfrmManConsultas.OnfraPrimaryKeyChange(Sender: TObject);
begin
  PKChange(fraPrimaryKey.IsSelected);
end;

procedure TfrmManConsultas.SetCO_ID(AId: Integer);
  procedure SetID(ADataSet: TSDQuery);
  begin
    ADataSet.Close;
    ADataSet.ParamByName('CO_ID').AsInteger := AId;
  end;
begin
  SetID(sdqConsulta);
//  SetID(sdqPCE_CANCERESTABLECI);
//  SetID(sdqPCT_CANCERTRABAJADOR);
end;

function TfrmManConsultas.Validar: Boolean;
begin
  Result := False;
  if IsEmptyString(edCO_DESCRIPCION.Text) then
    InvalidMsg(edCO_DESCRIPCION, 'Debe ingresar la descripción de la Consulta.')
  else
    Result := True;
end;

procedure TfrmManConsultas.tbArmarSqlClick(Sender: TObject);
var
  ASql: TSql;
  ATableName: String;
  i: Integer;
  sdqPKFields: TSDQuery;
begin
  if MsgAsk('Este proceso creará automáticamente todos los SQL para una tabla especificado, esto producirá que se pierda la información de los SQL anteriores'#13#10'¿ Desea Continuar ?') then
  begin
    ATableName := InputBox('Armar SQL', 'Nombre de la Tabla', '');
    if ATableName <> '' then
      with GetQuery('SELECT * FROM ' + ATableName + ' WHERE 1=2') do
      try
        {$IFDEF SQLSERVER}
        {$ELSE}{$IFDEF MSACCESS}
        {$ELSE}
        sdqPKFields := GetQueryEx('SELECT COLUMN_NAME ' +
                                    'FROM ALL_CONS_COLUMNS COL, ALL_CONSTRAINTS CON ' +
                                   'WHERE CON.TABLE_NAME = :TableName ' +
                                     'AND CONSTRAINT_TYPE = ''P'' ' +
                                     'AND CON.OWNER = COL.OWNER ' +
                                     'AND CON.TABLE_NAME = COL.TABLE_NAME ' +
                                     'AND CON.CONSTRAINT_NAME = COL.CONSTRAINT_NAME', [ATableName]);
        {$ENDIF}{$ENDIF}
        try
          ASql := TSql.Create(ATableName);
          try
            ASql.ValueAsParams := True;
            ASql.SelectOptions := [soPrimaryKeyAsWhere, soPrimaryKeyAsField];

            for i := 0 to Fields.Count - 1 do
              if sdqPKFields.Locate('COLUMN_NAME', Fields[i].FieldName, []) then
                ASql.PrimaryKey.Add(Fields[i].FieldName, '')
              else
                ASql.Fields.Add(Fields[i].FieldName, '');

            mwCO_SQL_SELECT.Lines.Text := ASql.SelectSql;
            mwCO_SQL_INSERT.Lines.Text := ASql.InsertSql;
            mwCO_SQL_UPDATE.Lines.Text := ASql.UpdateSql;
            mwCO_SQL_DELETE.Lines.Text := ASql.DeleteSql;
          finally
            ASql.Free;
          end;
        finally
          sdqPKFields.Free;
        end;
      finally
        Free;
      end;
  end;
end;

procedure TfrmManConsultas.tbSqlAutoCamposClick(Sender: TObject);
begin
  inherited;
//  with GetQuery(mwCO_SQL_SELECT
end;

procedure TfrmManConsultas.tbSqlSintaxisClick(Sender: TObject);
var
  sdqSintaxis: TSDQuery;
  bAsSelect: Boolean;

  function GetActiveSql: String;
  begin
    bAsSelect := False;
    if PageControl.ActivePageIndex = PAG_SQL then
      case pcSql.ActivePageIndex of
        0:
        begin
          Result := mwCO_SQL_SELECT.Lines.Text;
          bAsSelect := True;
        end;
        1: Result := mwCO_SQL_INSERT.Lines.Text;
        2: Result := mwCO_SQL_UPDATE.Lines.Text;
        3: Result := mwCO_SQL_DELETE.Lines.Text;
      end
    else
      Result := mwEvSql.Lines.Text;
  end;

begin
  try
    sdqSintaxis := TSDQuery.Create(Self);
    try
      SetDatabaseToQuery(sdqSintaxis);
//xxxxx      CheckQuery(sdqSintaxis, GetActiveSql, bAsSelect);
      CheckAndOpenQuery(sdqSintaxis, GetActiveSql, bAsSelect);
    finally
      sdqSintaxis.Free;
    end;

    MsgBox('La comprobación de sintaxis fue satisfactoria.', MB_ICONINFORMATION);
  except
    on E: Exception do
      ErrorMsg(E, 'Error de Sintaxis');
   end;
end;

procedure TfrmManConsultas.btnCampAceptarClick(Sender: TObject);
begin
  if IsEmptyString(cmbCC_NOMBRE.Text) then
    InvalidMsg(cmbCC_NOMBRE, 'Debe ingresar el Nombre del Campo.')
  else
  begin
    with sdqICC_CONSULTACAMPO do
    begin
      if ModoABMTablas = maAlta then
        Insert
      else
        Edit;
        {.....}
//      FieldByName('CC_ORDEN').AsInteger        := ;
      FieldByName('CC_NOMBRE').AsString        := cmbCC_NOMBRE.Text;
      FieldByName('USUARIO').AsString          := frmPrincipal.DBLogin.UserID;
      Post;
    end;

    fpCamposABM.ModalResult := mrOk;
  end;
end;

end.
