unit unfraPerfilPreventor;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, PatternEdit, IntEdit, ExComboBox, CheckLst,
  ARTCheckListBox, unDmPrincipal, CustomDlgs, AnsiSql, unSesion, ComCtrls,
  ToolWin, JvExCheckLst, JvCheckListBox, CheckPanel, General, VclExtra;

type
  TfraPerfilPreventor = class(TFrame)
    gbCondicion: TGroupBox;
    gbData: TGroupBox;
    gbTipoEmpresa: TGroupBox;
    cmbTipoEmpresa: TExComboBox;
    gbAct: TGroupBox;
    chkActInd: TCheckBox;
    chkActAgro: TCheckBox;
    chkActConst: TCheckBox;
    gbSect: TGroupBox;
    chkS1: TCheckBox;
    chkS2: TCheckBox;
    chkS3: TCheckBox;
    chkS4: TCheckBox;
    gbCap: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    chkCapTodas: TCheckBox;
    edCapDesde: TIntEdit;
    edCapHasta: TIntEdit;
    gbCIIU: TGroupBox;
    lstCIIU: TARTCheckListBox;
    edVisitasGba: TIntEdit;
    edVisitasMunicipios: TIntEdit;
    edVisitasRestoSP: TIntEdit;
    edVisitasPrivado: TIntEdit;
    lblVisitas: TLabel;
    gbCatRiesgo: TGroupBox;
    lstCategoriaRiesgo: TARTCheckListBox;
    procedure chkCapTodasClick(Sender: TObject);
    procedure cmbTipoEmpresaChange(Sender: TObject);
    procedure chkS1Click(Sender: TObject);
    procedure chkS2Click(Sender: TObject);
    procedure chkS3Click(Sender: TObject);
    procedure chkS4Click(Sender: TObject);
  private
    FIdPerfilCondicion: integer;
    procedure Habilitar(ahabilita: boolean);
  public
    property IdPerfilCondicion: integer read FIdPerfilCondicion write FIdPerfilCondicion;
    function Validar: boolean;
    procedure Limpiar;
    procedure SeleccionarTodo;
    procedure CargarGeneral(aIdPerfilCondicion: integer);
    procedure CargarPreventor(aIdPerfilCondicion, aIdPreventor: integer);
    procedure GuardarPreventor(aIdPerfil, aIdPreventor: integer);
    procedure GuardarGeneral(aIdPerfil: integer);
    procedure EliminarGeneral(aIdPerfilCondicion: integer);
    procedure EliminarPreventor(aIdPerfilCondicion: integer);
    procedure Init;
  end;

const

  PARAMETRO_TIPO_EMPRESA = 'TIPO';
  PARAMETRO_ACTIVIDAD = 'ACTIVIDAD';
  PARAMETRO_SECTOR = 'SECTOR';
  PARAMETRO_CAPITAS_DESDE = 'CAPITASDESDE';
  PARAMETRO_CAPITAS_HASTA = 'CAPITASHASTA';
  PARAMETRO_CAPITAS_TODAS = 'CAPITASTODAS';
  PARAMETRO_CIIU = 'CIIU';
  PARAMETRO_CATRIESGO = 'CATRIESGO';

  PARAMETRO_VISITAS_GBA = 'VISITASGBA';
  PARAMETRO_VISITAS_MUNICIPIOS = 'VISITASMUNICIPIOS';
  PARAMETRO_VISITAS_RESTO_SP = 'VISITASRESTOSP';
  PARAMETRO_VISITAS_PRIVADO = 'VISITASPRIVADO';

implementation

{$R *.DFM}

procedure TfraPerfilPreventor.CargarGeneral(aIdPerfilCondicion: integer);
var
  i: integer;
begin
  FIdPerfilCondicion := aIdPerfilCondicion;
  with GetQuery('select * from hys.hcc_condicion where cc_idperfilcondicion = ' + SqlValue(aIdPerfilCondicion)) do
  try
    while not Eof do
    begin
      if FieldByName('cc_parametro').AsString = PARAMETRO_TIPO_EMPRESA then
        cmbTipoEmpresa.Value := fieldbyname('cc_valor').AsString;

      if FieldByName('cc_parametro').AsString = PARAMETRO_ACTIVIDAD then
      begin
        if fieldbyname('cc_valor').AsString = 'I' then
          chkActInd.Checked := true;
        if fieldbyname('cc_valor').AsString = 'A' then
          chkActAgro.Checked := true;
        if fieldbyname('cc_valor').AsString = 'C' then
          chkActConst.Checked := true;
      end;

      if FieldByName('cc_parametro').AsString = PARAMETRO_SECTOR then
      begin
        if fieldbyname('cc_valor').AsString = '1' then
          chkS1.Checked := true;
        if fieldbyname('cc_valor').AsString = '2' then
          chkS2.Checked := true;
        if fieldbyname('cc_valor').AsString = '3' then
          chkS3.Checked := true;
        if fieldbyname('cc_valor').AsString = '4' then
          chkS4.Checked := true;
      end;

      if FieldByName('cc_parametro').AsString = PARAMETRO_VISITAS_GBA then
        edVisitasGba.Text := fieldbyname('cc_valor').AsString;

      if FieldByName('cc_parametro').AsString = PARAMETRO_VISITAS_MUNICIPIOS then
        edVisitasMunicipios.Text := fieldbyname('cc_valor').AsString;

      if FieldByName('cc_parametro').AsString = PARAMETRO_VISITAS_RESTO_SP then
        edVisitasRestoSP.Text := fieldbyname('cc_valor').AsString;

      if FieldByName('cc_parametro').AsString = PARAMETRO_VISITAS_PRIVADO then
        edVisitasPrivado.Text := fieldbyname('cc_valor').AsString;

      if FieldByName('cc_parametro').AsString = PARAMETRO_CAPITAS_TODAS then
      begin
        edCapDesde.Clear;
        edCapHasta.Clear;
        chkCapTodas.Checked := true;
      end;

      if not chkCapTodas.Checked and (FieldByName('cc_parametro').AsString = PARAMETRO_CAPITAS_DESDE) then
        edCapDesde.Text := fieldbyname('cc_valor').AsString;

      if not chkCapTodas.Checked and (FieldByName('cc_parametro').AsString = PARAMETRO_CAPITAS_HASTA) then
        edCapHasta.Text := fieldbyname('cc_valor').AsString;

      if FieldByName('cc_parametro').AsString = PARAMETRO_CIIU then
      begin
        i:= 0;
        while (i<=lstCIIU.Items.Count-1) and (lstCIIU.Values[i] <> fieldbyname('cc_valor').AsString) do
          inc(i);
        if (i<=lstCIIU.Items.Count-1) then
          lstCIIU.Checked[i] := true;
      end;

      if FieldByName('cc_parametro').AsString = PARAMETRO_CATRIESGO then
      begin
        i:= 0;
        while (i<=lstCategoriaRiesgo.Items.Count-1) and (lstCategoriaRiesgo.Values[i] <> fieldbyname('cc_valor').AsString) do
          inc(i);
        if (i<=lstCategoriaRiesgo.Items.Count-1) then
          lstCategoriaRiesgo.Checked[i] := true;
      end;

      Next;
    end;

    chkS1Click(self);
    chkS2Click(self);
    chkS3Click(self);
    chkS4Click(self);

  finally
    Free;
  end;
end;

procedure TfraPerfilPreventor.chkCapTodasClick(Sender: TObject);
begin
  if chkCapTodas.Checked then
  begin
    edCapDesde.Clear;
    edCapHasta.Clear;
  end;

  edCapDesde.Enabled := not chkCapTodas.Checked;
  edCapHasta.Enabled := not chkCapTodas.Checked;
end;

procedure TfraPerfilPreventor.EliminarGeneral(aIdPerfilCondicion: integer);
begin
  BeginTrans(true);
  try
    EjecutarSqlST('delete from hys.hcc_condicion where cc_idperfilcondicion = ' + SqlValue(aIdPerfilCondicion));
    EjecutarSqlST('delete from hys.hpc_perfilcondicion where pc_id = ' + SqlValue(aIdPerfilCondicion));
    CommitTrans(true);
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al eliminar la condición.');
    end;
  end;
end;

procedure TfraPerfilPreventor.GuardarGeneral(aIdPerfil: integer);
var
  i: integer;
begin
  BeginTrans(true);
  try
      if (FIdPerfilCondicion <> -1) then
      begin
        EjecutarSqlST('delete from hys.hcc_condicion where cc_idperfilcondicion = ' + SqlValue(FIdPerfilCondicion));
      end
      else begin
        FIdPerfilCondicion := GetSecNextVal('hys.seq_hpd_id');
        EjecutarSqlST('insert into hys.hpc_perfilcondicion values( ' + SqlValue(FIdPerfilCondicion) + ', ' + SqlValue(aIdPerfil) +
                      ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');
      end;


      //Tipo de Empresa
      EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                      SqlValue(PARAMETRO_TIPO_EMPRESA) + ', ' + SqlValue(cmbTipoEmpresa.Value) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');


      //Actividad
      if chkActInd.Checked then
        EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_ACTIVIDAD) + ', ' + SqlValue('I') + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');

      //Actividad
      if chkActAgro.Checked then
        EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_ACTIVIDAD) + ', ' + SqlValue('A') + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');

      //Actividad
      if chkActConst.Checked then
        EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_ACTIVIDAD) + ', ' + SqlValue('C') + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');

      //Sector
      if chkS1.Checked then
      begin
        EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_SECTOR) + ', ' + SqlValue('1') + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');

        EjecutarSqlST(' Insert into hys.hcc_condicion ' +
                      ' values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_VISITAS_GBA) + ', ' + SqlValue(edVisitasGba.Value) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');
      end;

      //Sector
      if chkS2.Checked then
      begin
        EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_SECTOR) + ', ' + SqlValue('2') + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');

        EjecutarSqlST(' Insert into hys.hcc_condicion ' +
                      ' values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_VISITAS_MUNICIPIOS) + ', ' + SqlValue(edVisitasMunicipios.Value) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');
      end;

      //Sector
      if chkS3.Checked then
      begin
        EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_SECTOR) + ', ' + SqlValue('3') + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');

        EjecutarSqlST(' Insert into hys.hcc_condicion ' +
                      ' values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_VISITAS_RESTO_SP) + ', ' + SqlValue(edVisitasRestoSP.Value) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');
      end;

      //Sector
      if chkS4.Checked then
      begin
        EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_SECTOR) + ', ' + SqlValue('4') + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');

        EjecutarSqlST(' Insert into hys.hcc_condicion ' +
                      ' values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_VISITAS_PRIVADO) + ', ' + SqlValue(edVisitasPrivado.Value) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');
      end;


      //Todas las Capitas
      if chkCapTodas.Checked then
      begin
        EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_CAPITAS_TODAS) + ', ' + SqlValue('T') + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');
        EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_CAPITAS_DESDE) + ', ' + SqlValue(0) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');
        EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_CAPITAS_HASTA) + ', ' + SqlValue(9999999) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');
      end
      else begin
        //Capitas desde
        EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_CAPITAS_DESDE) + ', ' + SqlValue(edCapDesde.Text) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');
        //Capitas hasta
        EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_CAPITAS_HASTA) + ', ' + SqlValue(edCapHasta.Text) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');
      end;

      for i:=0 to lstCIIU.Items.Count-1 do
        if lstCIIU.Checked[i] then
          EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                          SqlValue(PARAMETRO_CIIU) + ', ' + SqlValue(lstCIIU.Values[i]) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');

      for i:=0 to lstCategoriaRiesgo.Items.Count-1 do
        if lstCategoriaRiesgo.Checked[i] then
          EjecutarSqlST(' Insert into hys.hcc_condicion values(hys.seq_hcc_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                          SqlValue(PARAMETRO_CATRIESGO) + ', ' + SqlValue(lstCategoriaRiesgo.Values[i]) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');

      CommitTrans(true);
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al guardar la condición.');
    end;
  end;
end;

procedure TfraPerfilPreventor.Habilitar(ahabilita: boolean);
var
  i: integer;
begin
  chkActInd.Checked  := ahabilita;
  chkActAgro.Checked := ahabilita;
  chkActConst.Checked := ahabilita;
  chkS1.Checked := ahabilita;
  chkS2.Checked := ahabilita;
  chkS3.Checked := ahabilita;
  chkS4.Checked := ahabilita;
  chkCapTodas.Checked := ahabilita;
  if not ahabilita then
  begin
    edCapDesde.Clear;
    edCapHasta.Clear;
  end;
  for i:=0 to lstCIIU.Items.Count-1 do
    lstCIIU.Checked[i] := ahabilita;
  for i:=0 to lstCategoriaRiesgo.Items.Count-1 do
    lstCategoriaRiesgo.Checked[i] := ahabilita;
end;

procedure TfraPerfilPreventor.Init;
begin
  FIdPerfilCondicion := -1;

  with GetQuery(' SELECT * ' +
                ' FROM hys.hte_tipoempresaprev ') do
  try
    cmbTipoEmpresa.Clear;
    while not Eof do
    begin
      cmbTipoEmpresa.Items.Add(fieldbyname('te_id').AsString + '=' + fieldbyname('te_codigo').AsString);
      Next;
    end;
  finally
    free;
  end;

  lstCIIU.AutoAjustarColumnas := false;
  with GetQuery(' SELECT ac_id, ac_relacion, ac_descripcion ' +
                ' FROM comunes.cac_actividad ' +
                ' WHERE length(ac_relacion) = 1') do
  try
    lstCIIU.Clear;
    while not Eof do
    begin
      lstCIIU.Add(fieldbyname('ac_relacion').AsString + ' - ' + fieldbyname('ac_descripcion').AsString, fieldbyname('ac_id').AsString);
      Next;
    end;
  finally
    free;
  end;

  lstCategoriaRiesgo.AutoAjustarColumnas := false;
  with GetQuery(' SELECT ca_id, ca_descripcion ' +
                ' FROM hys.hca_categoriariesgo ') do
  try
    lstCategoriaRiesgo.Clear;
    while not Eof do
    begin
      lstCategoriaRiesgo.Add(fieldbyname('ca_descripcion').AsString , fieldbyname('ca_id').AsString);
      Next;
    end;
  finally
    free;
  end;
end;

procedure TfraPerfilPreventor.Limpiar;
begin
  cmbTipoEmpresa.ItemIndex := -1;
  Habilitar(false);
end;

procedure TfraPerfilPreventor.SeleccionarTodo;
begin
  Habilitar(true);
end;

function TfraPerfilPreventor.Validar: boolean;
begin
  Verificar(cmbTipoEmpresa.ItemIndex < 0, cmbTipoEmpresa, 'Debe ingresar el tipo de empresa.');
  Verificar(not (chkActInd.Checked or chkActAgro.Checked or chkActConst.Checked), gbAct, 'Debe seleccionar una actividad.');
  Verificar(not (chkS1.Checked or chkS2.Checked or chkS3.Checked or chkS4.Checked), gbSect, 'Debe seleccionar un Sector.');
  Verificar(((not chkCapTodas.Checked) and (edCapDesde.IsEmpty or edCapHasta.IsEmpty)), gbCap, 'Debe seleccionar las cápitas.');
  Verificar(((not chkCapTodas.Checked) and (edCapDesde.Value > edCapHasta.Value)), gbCap, 'El valor desde debe ser menor o igual al hasta.');
  Verificar(lstCIIU.CheckCount = 0, lstCIIU, 'Debe seleccionar un CIIU.');
  result := true;
end;

procedure TfraPerfilPreventor.cmbTipoEmpresaChange(Sender: TObject);
begin
  if cmbTipoEmpresa.Value = 'CO' then
  begin
    chkActInd.Checked := false;
    chkActInd.Enabled := false;
    chkActAgro.Checked := false;
    chkActAgro.Enabled := false;
  end
  else begin
    chkActInd.Enabled := true;
    chkActAgro.Enabled := true;
  end;

end;

procedure TfraPerfilPreventor.CargarPreventor(aIdPerfilCondicion, aIdPreventor: integer);
var
  i: integer;
begin
  FIdPerfilCondicion := aIdPerfilCondicion;
  with GetQuery(' select * from hys.hcp_condicionpreventor, hys.hpc_perfilcondicionprev ' +
                ' where cp_idperfilcondicionprev = pc_id ' +
                ' and pc_idpreventor = ' + SqlValue(aIdPreventor) +
                ' and pc_id = ' + SqlValue(aIdPerfilCondicion)) do
  try
    while not Eof do
    begin
      if FieldByName('cp_parametro').AsString = PARAMETRO_TIPO_EMPRESA then
      begin
        cmbTipoEmpresa.Value := fieldbyname('cp_valor').AsString;
        cmbTipoEmpresa.Enabled := FieldByName('CP_IDCONDICION').IsNull;
        if FieldByName('CP_IDCONDICION').IsNull then
          cmbTipoEmpresa.Tag := 0
        else
          cmbTipoEmpresa.Tag := FieldByName('CP_IDCONDICION').AsInteger;
      end;

      if FieldByName('cp_parametro').AsString = PARAMETRO_ACTIVIDAD then
      begin
        if fieldbyname('cp_valor').AsString = 'I' then
        begin
          chkActInd.Checked := true;
          if FieldByName('CP_IDCONDICION').IsNull then
            chkActInd.Tag := 0
          else
            chkActInd.Tag := FieldByName('CP_IDCONDICION').AsInteger;
        end;
        if fieldbyname('cp_valor').AsString = 'A' then
        begin
          chkActAgro.Checked := true;
          if FieldByName('CP_IDCONDICION').IsNull then
            chkActAgro.Tag := 0
          else
            chkActAgro.Tag := FieldByName('CP_IDCONDICION').AsInteger;
        end;
        if fieldbyname('cp_valor').AsString = 'C' then
        begin
          chkActConst.Checked := true;
          if FieldByName('CP_IDCONDICION').IsNull then
            chkActConst.Tag := 0
          else
            chkActConst.Tag := FieldByName('CP_IDCONDICION').AsInteger;
        end;
      end;


      if FieldByName('cp_parametro').AsString = PARAMETRO_SECTOR then
      begin
        if fieldbyname('cp_valor').AsString = '1' then
        begin
          chkS1.Checked := true;
          if FieldByName('CP_IDCONDICION').IsNull then
            chkS1.Tag := 0
          else
            chkS1.Tag := FieldByName('CP_IDCONDICION').AsInteger;
        end;
        if fieldbyname('cp_valor').AsString = '2' then
        begin
          chkS2.Checked := true;
          if FieldByName('CP_IDCONDICION').IsNull then
            chkS2.Tag := 0
          else
            chkS2.Tag := FieldByName('CP_IDCONDICION').AsInteger;
        end;
        if fieldbyname('cp_valor').AsString = '3' then
        begin
          chkS3.Checked := true;
          if FieldByName('CP_IDCONDICION').IsNull then
            chkS3.Tag := 0
          else
            chkS3.Tag := FieldByName('CP_IDCONDICION').AsInteger;
        end;
        if fieldbyname('cp_valor').AsString = '4' then
        begin
          chkS4.Checked := true;
          if FieldByName('CP_IDCONDICION').IsNull then
            chkS4.Tag := 0
          else
            chkS4.Tag := FieldByName('CP_IDCONDICION').AsInteger;
        end;
      end;

      if FieldByName('cp_parametro').AsString = PARAMETRO_VISITAS_GBA then
      begin
        edVisitasGba.Text := fieldbyname('cp_valor').AsString;
        if FieldByName('CP_IDCONDICION').IsNull then
          edVisitasGba.Tag := 0
        else
          edVisitasGba.Tag := FieldByName('CP_IDCONDICION').AsInteger;
      end;

      if FieldByName('cp_parametro').AsString = PARAMETRO_VISITAS_MUNICIPIOS then
      begin
        edVisitasMunicipios.Text := fieldbyname('cp_valor').AsString;
        if FieldByName('CP_IDCONDICION').IsNull then
          edVisitasMunicipios.Tag := 0
        else
          edVisitasMunicipios.Tag := FieldByName('CP_IDCONDICION').AsInteger;
      end;

      if FieldByName('cp_parametro').AsString = PARAMETRO_VISITAS_RESTO_SP then
      begin
        edVisitasRestoSP.Text := fieldbyname('cp_valor').AsString;
        if FieldByName('CP_IDCONDICION').IsNull then
          edVisitasRestoSP.Tag := 0
        else
          edVisitasRestoSP.Tag := FieldByName('CP_IDCONDICION').AsInteger;
      end;

      if FieldByName('cp_parametro').AsString = PARAMETRO_VISITAS_PRIVADO then
      begin
        edVisitasPrivado.Text := fieldbyname('cp_valor').AsString;
        if FieldByName('CP_IDCONDICION').IsNull then
          edVisitasPrivado.Tag := 0
        else
          edVisitasPrivado.Tag := FieldByName('CP_IDCONDICION').AsInteger;
      end;

      if FieldByName('cp_parametro').AsString = PARAMETRO_CAPITAS_TODAS then
      begin
        chkCapTodas.Checked := true;
        edCapDesde.Clear;
        edCapHasta.Clear;
        if FieldByName('CP_IDCONDICION').IsNull then
          chkCapTodas.Tag := 0
        else
          chkCapTodas.Tag := FieldByName('CP_IDCONDICION').AsInteger;
      end;

      if not chkCapTodas.Checked and (FieldByName('cp_parametro').AsString = PARAMETRO_CAPITAS_DESDE) then
      begin
        edCapDesde.Text := fieldbyname('cp_valor').AsString;
        if FieldByName('CP_IDCONDICION').IsNull then
          edCapDesde.Tag := 0
        else
          edCapDesde.Tag := FieldByName('CP_IDCONDICION').AsInteger;
      end;

      if not chkCapTodas.Checked and (FieldByName('cp_parametro').AsString = PARAMETRO_CAPITAS_HASTA) then
      begin
        edCapHasta.Text := fieldbyname('cp_valor').AsString;
        if FieldByName('CP_IDCONDICION').IsNull then
          edCapHasta.Tag := 0
        else
          edCapHasta.Tag := FieldByName('CP_IDCONDICION').AsInteger;
      end;

      if FieldByName('cp_parametro').AsString = PARAMETRO_CIIU then
      begin
        i:= 0;
        while (i<=lstCIIU.Items.Count-1) and (lstCIIU.Values[i] <> fieldbyname('cp_valor').AsString) do
          inc(i);
        if (i<=lstCIIU.Items.Count-1) then
        begin
          lstCIIU.Checked[i] := true;
          if FieldByName('CP_IDCONDICION').IsNull then
            lstCIIU.Items.Objects[i] := TObject(0)
          else
            lstCIIU.Items.Objects[i] := TObject(FieldByName('CP_IDCONDICION').AsInteger);
        end;
      end;

      if FieldByName('cp_parametro').AsString = PARAMETRO_CATRIESGO then
      begin
        i:= 0;
        while (i<=lstCategoriaRiesgo.Items.Count-1) and (lstCategoriaRiesgo.Values[i] <> fieldbyname('cp_valor').AsString) do
          inc(i);
        if (i<=lstCategoriaRiesgo.Items.Count-1) then
        begin
          lstCategoriaRiesgo.Checked[i] := true;
          if FieldByName('CP_IDCONDICION').IsNull then
            lstCategoriaRiesgo.Items.Objects[i] := TObject(0)
          else
            lstCategoriaRiesgo.Items.Objects[i] := TObject(FieldByName('CP_IDCONDICION').AsInteger);
        end;
      end;

      Next;
    end;

    chkS1Click(self);
    chkS2Click(self);
    chkS3Click(self);
    chkS4Click(self);

  finally
    Free;
  end;
end;

procedure TfraPerfilPreventor.GuardarPreventor(aIdPerfil,
  aIdPreventor: integer);
var
  i: integer;
begin
  BeginTrans(true);
  try
      if (FIdPerfilCondicion <> -1) then
        EjecutarSqlST('delete from hys.hcp_condicionpreventor where cp_idperfilcondicionprev = ' + SqlValue(FIdPerfilCondicion))
      else begin
        FIdPerfilCondicion := GetSecNextVal('hys.seq_hpv_id');
        EjecutarSqlST('insert into hys.hpc_perfilcondicionprev values( ' + SqlValue(FIdPerfilCondicion) + ', ' + SqlValue(aIdPerfil) +
                      ', ' + SqlValue(Sesion.LoginName) + ', sysdate, ' + SqlValue(aIdPreventor) + ')');
      end;


      //Tipo de Empresa
      EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                    ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                      SqlValue(PARAMETRO_TIPO_EMPRESA) + ', ' + SqlValue(cmbTipoEmpresa.Value) + ', ' + iif((cmbTipoEmpresa.Tag = 0), 'NULL', SqlValue(cmbTipoEmpresa.Tag)) + ')');


      //Actividad
      if chkActInd.Checked then
        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_ACTIVIDAD) + ', ' + SqlValue('I') + ', ' + iif((chkActInd.Tag = 0), 'NULL', SqlValue(chkActInd.Tag)) + ')');

      //Actividad
      if chkActAgro.Checked then
        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_ACTIVIDAD) + ', ' + SqlValue('A') + ', ' + iif((chkActAgro.Tag = 0), 'NULL', SqlValue(chkActAgro.Tag)) + ')');

      //Actividad
      if chkActConst.Checked then
        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_ACTIVIDAD) + ', ' + SqlValue('C') + ', ' + iif((chkActConst.Tag = 0), 'NULL', SqlValue(chkActConst.Tag)) + ')');

      //Sector
      if chkS1.Checked then
      begin
        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_SECTOR) + ', ' + SqlValue('1') + ', ' + iif((chkS1.Tag = 0), 'NULL', SqlValue(chkS1.Tag)) + ')');

        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_VISITAS_GBA) + ', ' + SqlValue(edVisitasGba.Value) + ', ' + iif((edVisitasGba.Tag = 0), 'NULL', SqlValue(edVisitasGba.Tag)) + ')');
      end;

      //Sector
      if chkS2.Checked then
      begin
        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_SECTOR) + ', ' + SqlValue('2') + ', ' + iif((chkS2.Tag = 0), 'NULL', SqlValue(chkS2.Tag)) + ')');

        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_VISITAS_MUNICIPIOS) + ', ' + SqlValue(edVisitasMunicipios.Value) + ', ' + iif((edVisitasMunicipios.Tag = 0), 'NULL', SqlValue(edVisitasMunicipios.Tag)) + ')');
      end;

      //Sector
      if chkS3.Checked then
      begin
        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_SECTOR) + ', ' + SqlValue('3')  + ', ' + iif((chkS3.Tag = 0), 'NULL', SqlValue(chkS3.Tag)) + ')');

        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_VISITAS_RESTO_SP) + ', ' + SqlValue(edVisitasRestoSP.Value) + ', ' + iif((edVisitasRestoSP.Tag = 0), 'NULL', SqlValue(edVisitasRestoSP.Tag)) + ')');
      end;

      //Sector
      if chkS4.Checked then
      begin
        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_SECTOR) + ', ' + SqlValue('4') + ', ' + iif((chkS4.Tag = 0), 'NULL', SqlValue(chkS4.Tag)) + ')');

        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_VISITAS_PRIVADO) + ', ' + SqlValue(edVisitasPrivado.Value) + ', ' + iif((edVisitasPrivado.Tag = 0), 'NULL', SqlValue(edVisitasPrivado.Tag)) + ')');
      end;


      //Todas las Capitas
      if chkCapTodas.Checked then
      begin
        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_CAPITAS_TODAS) + ', ' + SqlValue('T') + ', ' + iif((chkCapTodas.Tag = 0), 'NULL', SqlValue(chkCapTodas.Tag)) + ')');
        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_CAPITAS_DESDE) + ', ' + SqlValue(0) + ', ' + iif((edCapDesde.Tag = 0), 'NULL', SqlValue(edCapDesde.Tag)) + ')');
        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_CAPITAS_HASTA) + ', ' + SqlValue(9999999) + ', ' + iif((edCapHasta.Tag = 0), 'NULL', SqlValue(edCapHasta.Tag)) + ')');
      end
      else begin
        //Capitas desde
        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_CAPITAS_DESDE) + ', ' + SqlValue(edCapDesde.Text) + ', ' + iif((edCapDesde.Tag = 0), 'NULL', SqlValue(edCapDesde.Tag)) + ')');
        //Capitas hasta
        EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                      ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                        SqlValue(PARAMETRO_CAPITAS_HASTA) + ', ' + SqlValue(edCapHasta.Text) + ', ' + iif((edCapHasta.Tag = 0), 'NULL', SqlValue(edCapHasta.Tag)) + ')');
      end;                        

      for i:=0 to lstCIIU.Items.Count-1 do
        if lstCIIU.Checked[i] then
          EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                        ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                          SqlValue(PARAMETRO_CIIU) + ', ' + SqlValue(lstCIIU.Values[i]) + ', ' + iif((integer(lstCIIU.Items.Objects[i]) = 0), 'NULL', SqlValue(integer(lstCIIU.Items.Objects[i]))) + ')');

      for i:=0 to lstCategoriaRiesgo.Items.Count-1 do
        if lstCategoriaRiesgo.Checked[i] then
          EjecutarSqlST(' Insert into hys.hcp_condicionpreventor(cp_id, cp_idperfilcondicionprev, cp_parametro, cp_valor, cp_idcondicion) ' +
                        ' Values(hys.seq_hcr_id.nextval, ' + SqlValue(FIdPerfilCondicion) + ', ' +
                          SqlValue(PARAMETRO_CATRIESGO) + ', ' + SqlValue(lstCategoriaRiesgo.Values[i]) + ', ' + iif((integer(lstCategoriaRiesgo.Items.Objects[i]) = 0), 'NULL', SqlValue(integer(lstCategoriaRiesgo.Items.Objects[i]))) + ')');
      CommitTrans(true);
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al guardar la condición.');
    end;
  end;
end;

procedure TfraPerfilPreventor.EliminarPreventor(
  aIdPerfilCondicion: integer);
begin
  BeginTrans(true);
  try
    EjecutarSqlST(' delete from hys.hcp_condicionpreventor ' +
                  ' where cp_idperfilcondicionprev = ' + SqlValue(aIdPerfilCondicion));


    EjecutarSqlST(' delete from hys.hpc_perfilcondicionprev ' +
                  ' where pc_id = ' + SqlValue(aIdPerfilCondicion));
                  
    CommitTrans(true);                  
  except
    on E: Exception do begin
       Rollback(true);
       ErrorMsg(E, 'Error al eliminar el perfil del preventor.');
    end;
  end;
end;

procedure TfraPerfilPreventor.chkS1Click(Sender: TObject);
begin
  if chkS1.Checked then
    LockControl(edVisitasGba, false)
  else begin
    edVisitasGba.Clear;
    LockControl(edVisitasGba, true);
  end;
end;

procedure TfraPerfilPreventor.chkS2Click(Sender: TObject);
begin
  if chkS2.Checked then
    LockControl(edVisitasMunicipios, false)
  else begin
    edVisitasMunicipios.Clear;
    LockControl(edVisitasMunicipios, true);
  end;
end;

procedure TfraPerfilPreventor.chkS3Click(Sender: TObject);
begin
  if chkS3.Checked then
    LockControl(edVisitasRestoSP, false)
  else begin
    edVisitasRestoSP.Clear;
    LockControl(edVisitasRestoSP, true);
  end;
end;

procedure TfraPerfilPreventor.chkS4Click(Sender: TObject);
begin
  if chkS4.Checked then
    LockControl(edVisitasPrivado, false)
  else begin
    edVisitasPrivado.Clear;
    LockControl(edVisitasPrivado, true);
  end;
end;

end.
