unit unTrabExt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, ImgList, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unFraTrabajadorSIN, unFraEmpresa, CheckPanel,
  Mask, ToolEdit, FormPanel, DateComboBox, General, unFraTrabajador, unArtFrame, unArtDbFrame, unArtDBAwareFrame;

type
  TfrmTrabExt = class(TfrmCustomConsulta)
    ChkEmpresa: TCheckPanel;
    Empresa: TfraEmpresa;
    Chktrabajador: TCheckPanel;
    edSolic: TEdit;
    CmbViaje: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    FPABM: TFormPanel;
    EmpresaABM: TfraEmpresa;
    FSalida: TDateComboBox;
    Fregreso: TDateComboBox;
    RgFViaje: TRadioGroup;
    FRecep: TDateComboBox;
    EdObs: TMemo;
    edDestino: TEdit;
    EdAsist: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CmdAceptar: TButton;
    cmdCancelar: TButton;
    fraTrabajadorSINABM: TfraTrabajadorSIN;
    TrabajadorSin: TfraTrabajador;
    Label10: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbNuevoClick(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    function ValidarCampos () : Boolean;
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure ChkEmpresaChange(Sender: TObject);
    procedure ChktrabajadorChange(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
                                      var ABackground: TColor; var AAlignment: TAlignment);
    procedure FormCreate(Sender: TObject);
    procedure EdObsExit(Sender: TObject);
    procedure fraTrabajadorSINABMdbcTrabNombreDropDown(Sender: TObject);
    procedure fraTrabajadorSINABMdbcTrabNombreCloseUp(Sender: TObject);
    procedure TrabajadorSINdbcTrabNombreDropDown(Sender: TObject);

    procedure fraTrabajadorSINABMmskTrabCUILKeyPress(Sender: TObject; var Key: Char);
  private
  public
  end;

var
  frmTrabExt: TfrmTrabExt;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, CustomDlgs;

{$R *.DFM}

procedure TfrmTrabExt.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT tv_fechabaja, tv_id "Nro. de solicitud", mp_nombre "Empresa", tj_nombre "Trabajador",' +
          ' cx_fechasalida "F.Inicio", cx_fecharegreso "F.Final", cx_formaviaje,' +
          ' DECODE(cx_formaviaje, ''A'', ''Aéreo'', ''M'', ''Maritimo'', ''T'', ''Terrestre'') "Forma de viaje",' +
          ' cx_destino "Destino", cx_asistenciaviajero "Asis. Viajero", cx_observaciones "Observaciones", cx_cuit,' +
          ' tv_cuil, cx_formaviaje, cx_fecharecepcion' +
     ' FROM cmp_empresas, ctj_trabajadores, mtv_trabajadorenviaje, acx_certxtrabenviaje' +
    ' WHERE mp_cuit = cx_cuit' +
      ' AND tv_fechabaja IS NULL' +
      ' AND tj_cuil = tv_cuil' +
      ' AND tv_idcertxtrab = cx_id';

  if (Empresa.IsSelected) and (ChkEmpresa.Checked) then
    sSql := sSql + ' AND cx_cuit = ' + SQLValue(Empresa.CUIT);

  if (not TrabajadorSIN.IsEmpty) and (ChkTrabajador.Checked) then
    sSql := sSql + ' AND tv_cuil = ' + SqlValue(TrabajadorSIN.CUIL);

  case cmbViaje.ItemIndex of
    0:  sSql := sSql + ' AND cx_fechasalida > TRUNC(SYSDATE)';
    1:  sSql := sSql + ' AND ACTUALDATE BETWEEN cx_fechasalida and cx_fecharegreso';
    2:  sSql := sSql + ' AND cx_fecharegreso < TRUNC(SYSDATE)';
  end;

  if edSolic.Text <> '' then
    sSql := sSql + ' AND tv_id = ' + edSolic.Text;

  SDQConsulta.SQL.Text := sSql;

  inherited;
end;

procedure TfrmTrabExt.tbLimpiarClick(Sender: TObject);
begin
  Empresa.Clear;
  TrabajadorSIN.Clear;
  CmbViaje.ItemIndex := 3;
  edSolic.Text := '';

  inherited;

  chkEmpresa.Checked := False;
  Empresa.enabled := False;
  chktrabajador.Checked := False;
  trabajadorsin.Enabled := False;
  CmbViaje.SetFocus;
end;

procedure TfrmTrabExt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree; 
end;

procedure TfrmTrabExt.tbNuevoClick(Sender: TObject);
begin
  FPABM.Caption := 'Alta de Trabajador';
  FPABM.tag := 1;
  EmpresaABM.Clear;
  EmpresaABM.Enabled := True;
  fraTrabajadorSINABM.Limpiar;
  fraTrabajadorSINABM.Enabled := True;
  Fsalida.ClearDate;
  Fsalida.Enabled := True;
  FRegreso.ClearDate;
  EdDestino.Text := '';
  EdDestino.Enabled := True;
  EdAsist.Text := '';
  EdObs.Text := '';
  FRecep.ClearDate;
  FRecep.Enabled := True;
  RGFViaje.Itemindex := 0;
  RGFViaje.Enabled := True;
  FPABM.ShowModal;
end;

procedure TfrmTrabExt.CmdAceptarClick(Sender: TObject);
var
  SFormaViaje: String;
  SSQL: String;
begin
  //Valido los Datos de la Pantalla
  if ValidarCampos then
  begin
    //Defino SFormaViaje
    //================================================================
    if RgFViaje.ItemIndex = 0 then
      SFormaViaje := '''A''';
    if RgFViaje.ItemIndex = 1 then
      SFormaViaje := '''M''';
    if RgFViaje.ItemIndex = 2 then
      SFormaViaje := '''T''';
    //================================================================

    if FPABM.Tag = 1 then
    begin
      //Armo el Insert
      //================================================================
      SSQL :=
        'INSERT INTO MTV_TRABAJADORENVIAJE(TV_ID, TV_CUIT, TV_CUIL, TV_FECHASALIDA, TV_FECHAREGRESO, TV_FORMAVIAJE,' +
                                         ' TV_DESTINO, TV_ASISTENCIAVIAJERO, TV_OBSERVACIONES, TV_FECHARECEPCION,' +
                                         ' TV_USUALTA, TV_FECHAALTA)' +
                                 ' VALUES (' + ValorSql('SELECT seq_mtv_id.nextval FROM dual') + ',' +
                                           SQLValue(empresaABM.CUIT) + ',''' +
                                           fraTrabajadorSINABM.mskTrabCUIL.Text + ''',' + FSalida.SqlText + ',' +
                                           FRegreso.SqlText + ',' + SFormaViaje + ',''' + edDestino.Text + ''',''' +
                                           EdAsist.Text + ''',''' + EdObs.Text + ''',' + FRecep.SqlText + ',''' +
                                           frmprincipal.DBLogin.UserID  + ''', Actualdate)';
      //================================================================
    end
    else
    begin
      //Armo el Update
      //================================================================
      SSQL :=
        'UPDATE MTV_TRABAJADORENVIAJE' +
          ' SET TV_FECHAREGRESO = ' + FREGRESO.SqlText + ',' +
              ' TV_ASISTENCIAVIAJERO = ''' + edAsist.Text + ''',' +
              ' TV_usumodif = ''' + frmprincipal.DBLogin.UserID + ''',' +
              ' TV_FECHAMODIF = ACTUALDATE,' +
              ' TV_OBSERVACIONES = ''' + edObs.text + ''',' +
              ' TV_FORMAVIAJE = ' + SFormaViaje +
        ' WHERE TV_ID = ' + SDQConsulta.FieldByName('Nro. de solicitud').AsString;
      //================================================================
    end;

    try
      EjecutarSQL(SSQL);
      MsgBox('Operación realizada con éxito.');
      FPabm.ModalResult := mrOK;
      tbRefrescarClick(nil);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Insertar o Modificar los datos en MTV_TRABAJADORENVIAJE');
    end;
  end;
end;

function TfrmTrabExt.ValidarCampos: Boolean;
var
  Error: Boolean;
begin
  Error := False;

  // Valido Todos los Campos
  if EmpresaABM.IsEmpty and (not Error) then
  begin
    MsgBox('Debe seleccionar una empresa.');
    Error := True;
  end
  else
  begin
    if (not ExisteSqlEx('SELECT 1 FROM AEM_EMPRESA WHERE EM_CUIT = :p1', [EmpresaABM.CUIT])) and (not Error) then
    begin
      MsgBox('El CUIT ingresado no pertenece a una empresa activa.');
      Error := True;
    end;

    if (ValorSqlEx('SELECT co_estado' +
                    ' FROM aem_empresa, aco_contrato' +
                   ' WHERE co_idempresa = em_id' +
                     ' AND em_cuit = :p1' +
                     ' AND co_contrato = :p2', [EmpresaABM.CUIT, EmpresaABM.Contrato]) = 6) and (not Error) then
    begin
      MsgBox('No puede cargar un viaje a una empresa inactiva.');
      Error := True;
    end;
  end;

  if (fratrabajadorsinabm.mskTrabCUIL.Text = '') and (not Error) then
  begin
    MsgBox('Debe seleccionar un trabajador.');
    Error := True;
  end
  else
  begin
    if not ExisteSqlEx('SELECT 1' +
                        ' FROM AEM_EMPRESA, ACO_CONTRATO, CTJ_TRABAJADOR, CRL_RELACIONLABORAL' +
                       ' WHERE CO_IDEMPRESA = EM_ID' +
                         ' AND RL_CONTRATO = CO_CONTRATO' +
                         ' AND RL_IDTRABAJADOR = TJ_ID' +
                         ' AND EM_CUIT = :p1' +
                         ' AND TJ_CUIL = :p2', [EmpresaABM.CUIT, fratrabajadorsinabm.mskTrabCUIL.Text]) and (not Error) then
    begin
      MsgBox('El trabajador seleccionado no pertenece a la empresa.');
      Error := True;
    end;
  end;

  if (EdDestino.text = '') and (not Error) then
  begin
    MsgBox('Debe ingresar un destino.');
    Error := True;
  end;

  if (FSalida.IsEmpty) and (not Error) then
  begin
    MsgBox('Debe seleccionar una fecha de salida.');
    Error := True;
  end;

  if (FRegreso.IsEmpty) and (not Error) then
  begin
    MsgBox('Debe seleccionar una fecha de regreso.');
    Error := True;
  end;

  if (FRecep.IsEmpty) and (not Error) then
  begin
    MsgBox('Debe seleccionar una fecha de recepción.');
    Error := True;
  end;

  Result := not Error;
end;

procedure TfrmTrabExt.tbModificarClick(Sender: TObject);
var
  key: Char;
begin
  if not sdqConsulta.FieldByName('tv_fechabaja').IsNull then
  begin
    MsgBox('No puede modificar un registro dado de baja.');
  end
  else
    with sdqConsulta do
    begin
      FPABM.Caption := 'Modificación de Trabajador';
      FPABM.Tag := 2;

      EmpresaABM.CUIT := FieldByName('CX_CUIT').AsString;
      EmpresaABM.Enabled := False;

      fraTrabajadorSINABM.mskTrabCUIL.Text := FieldByName('TV_CUIL').AsString;
      Key := #13;
      fraTrabajadorSINABMmskTrabCUILKeyPress(nil, Key);
      fraTrabajadorSINABM.Enabled := False;

      Fsalida.Date := FieldByName('F.Inicio').AsDateTime;
      Fsalida.Enabled := False;

      FRegreso.Date := FieldByName('F.Final').AsDateTime;

      EdDestino.Text := FieldByName('Destino').AsString;
      EdDestino.Enabled := False;

      EdAsist.Text := FieldByName('Asis. Viajero').AsString;
      EdObs.Text := FieldByName('Observaciones').AsString;
      FRecep.Date := FieldByName('CX_FECHARECEPCION').AsDateTime;
      FRecep.Enabled := False;

      if FieldByName('cx_formaviaje').AsString = 'A' then
        RGFViaje.Itemindex := 0;
      if FieldByName('cx_formaviaje').AsString = 'M' then
        RGFViaje.Itemindex := 1;
      if FieldByName('cx_formaviaje').AsString = 'T' then
        RGFViaje.Itemindex := 2;

      FPABM.ShowModal;
    end;
end;


procedure TfrmTrabExt.tbEliminarClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('tv_fechabaja').IsNull then
    MsgBox('No puede eliminar un registro que ya ha sido dado de baja.')
  else
    if MsgBox('¿ Está seguro que desea eliminar el registro activo ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      EjecutarSqlEx(
        'UPDATE mtv_trabajadorenviaje' +
          ' SET tv_fechabaja = ACTUALDATE,' +
              ' tv_usubaja = :p1' +
        ' WHERE tv_id = :p2', [frmprincipal.DBLogin.UserID, sdqConsulta.FieldByName('Nro. de solicitud').AsInteger]);
      tbRefrescarClick(nil);
    end;
end;

procedure TfrmTrabExt.ChkEmpresaChange(Sender: TObject);
begin
  Empresa.Enabled := not ChkTrabajador.Checked;

  if ChkTrabajador.Checked then
    Empresa.Clear;
end;

procedure TfrmTrabExt.ChktrabajadorChange(Sender: TObject);
begin
  if not chktrabajador.Checked then
  begin
    TrabajadorSIN.Enabled := False;
    TrabajadorSIN.Clear;
  end
  else
    TrabajadorSIN.Enabled := True;
end;

procedure TfrmTrabExt.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                        Highlight: Boolean);
begin
  inherited;

  if not Highlight then
  begin
    if not sdqConsulta.FieldByName('tv_fechabaja').IsNull then
      AFont.Color := clRed
    else
      AFont.Color := clBlack;
  end
  else
    AFont.Color := clwhite;
end;

procedure TfrmTrabExt.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
                                              var ABackground: TColor; var AAlignment: TAlignment);
begin
  if not sdqConsulta.FieldByName('tv_fechabaja').IsNull then
    AFont.Color := clGray
  else
    AFont.Color := clBlack;
end;

procedure TfrmTrabExt.FormCreate(Sender: TObject);
begin
  inherited;
//  FRecep.Maxdate := strtodate(valorSQL('Select actualdate from dual'));
  FRecep.Maxdate := DBDateTime; // By Fede 22/08/2002
end;

procedure TfrmTrabExt.EdObsExit(Sender: TObject);
begin
  EdObs.Text := UpperCase(EdObs.Text);
end;

procedure TfrmTrabExt.fraTrabajadorSINABMdbcTrabNombreDropDown(Sender: TObject);
var
  BaseOrder: String;
  BaseSiniWhere: String;
  BaseSql: String;
  CUIT: String;  
  SQL: String;
begin
//  inherited;
//  fraTrabajadorSINABM.dbcTrabNombreDropDown(Sender);

  CUIT := fraTrabajadorSINABM.mskTrabCUIL.Text;
  BaseSql :=
    'SELECT DISTINCT TJ_CUIL, TJ_NOMBRE, '''' Siniestro, 0 ex_siniestro, 0 ex_orden, 0 ex_recaida,' +
                   ' ACTUALDATE ex_fechaaccidente, ACTUALDATE ex_bajamedica, ACTUALDATE ex_altamedica,' +
                   ' ACTUALDATE ex_fecharecaida, null ex_causafin' +
              ' FROM CTJ_TRABAJADORES, CDL_DATOSLABORALES';
  BaseSiniWhere := ' WHERE DL_CUIL = TJ_CUIL';

  if (Length(Trim(fraTrabajadorSINABM.dbcTrabNombre.Text)) < 4) then
  begin
    fraTrabajadorSINABM.sdqTrabajador.Close;
    MsgBox('Debe ingresar como mínimo cuatro caracteres para realizar la búsqueda.', MB_ICONEXCLAMATION);
  end
  else
  begin
    if CUIT = '' then
      Sql := BaseSql + BaseSiniWhere + ' AND NVL(TJ_NOMBRE, '' '') LIKE ''' +
             Trim(fraTrabajadorSINABM.dbcTrabNombre.Text) + '%''' + BaseOrder
    else
      Sql := BaseSql + BaseSiniWhere + ' AND NVL(TJ_NOMBRE,'' '') LIKE ''' +
             Trim(fraTrabajadorSINABM.dbcTrabNombre.Text) + '%'''  + ' AND DL_CUIT = ''' + CUIT + '''' + BaseOrder;

    Sql:= Sql + ' AND DL_CUIT = ' + SQLValue(EmpresaABM.CUIT) + ' ';

    OpenQuery(fraTrabajadorSINABM.sdqTrabajador, Sql, True);

    if fraTrabajadorSINABM.sdqTrabajador.IsEmpty then
    begin
      fraTrabajadorSINABM.sdqTrabajador.Close;
      MsgBox('No se ha encontrado ningun trabajador para este criterio de búqueda.', MB_ICONEXCLAMATION);
    end;
  end;
end;

procedure TfrmTrabExt.fraTrabajadorSINABMdbcTrabNombreCloseUp(Sender: TObject);
begin
  fraTrabajadorSINABM.mskTrabCUIL.Text := fraTrabajadorSINABM.sdqTrabajador.FieldByName('TJ_CUIL').AsString;
  fraTrabajadorSINABM.dbcTrabNombre.Text := fraTrabajadorSINABM.sdqTrabajador.FieldByName('TJ_NOMBRE').AsString;

  if Assigned(Sender) then    // Para que no entre cuando se llama a 'Cargar'
  begin
    if fraTrabajadorSINABM.dbcTrabNombre.CanFocus then
    begin
      fraTrabajadorSINABM.dbcTrabNombre.SetFocus;
      SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TfrmTrabExt.TrabajadorSINdbcTrabNombreDropDown(Sender: TObject);
begin
  //
 inherited;
end;


procedure TfrmTrabExt.fraTrabajadorSINABMmskTrabCUILKeyPress(Sender: TObject; var Key: Char);
var
  BaseSiniWhere: String;
  BaseSql: String;
  Sql: String;
begin
  BaseSql :=
    'SELECT DISTINCT TJ_CUIL, TJ_NOMBRE, '''' Siniestro, 0 ex_siniestro, 0 ex_orden, 0 ex_recaida,' +
                   ' ACTUALDATE ex_fechaaccidente, ACTUALDATE ex_bajamedica, ACTUALDATE ex_altamedica,' +
                   ' ACTUALDATE ex_fecharecaida, null ex_causafin' +
              ' FROM CTJ_TRABAJADORES, CDL_DATOSLABORALES';
  BaseSiniWhere := ' WHERE DL_CUIL = TJ_CUIL';

  if (Key = #13) then
  begin
    case Length(Trim(fraTrabajadorSINABM.mskTrabCUIL.Text)) of
      8:  Sql := BaseSql + BaseSiniWhere + ' AND TJ_DOCUMENTO = ''' + Trim(fraTrabajadorSINABM.mskTrabCUIL.Text) + '''';
      11: Sql := BaseSql + BaseSiniWhere + ' AND TJ_CUIL = ''' + fraTrabajadorSINABM.mskTrabCUIL.Text + '''';
    else
      Exit;
    end;

    if not (Sql = fraTrabajadorSINABM.sdqTrabajador.SQL.Text) then
    begin
      fraTrabajadorSINABM.sdqTrabajador.Close;
      fraTrabajadorSINABM.sdqTrabajador.SQL.Text := Sql;
      fraTrabajadorSINABM.sdqTrabajador.Open;
      if Assigned(Sender) and (fraTrabajadorSINABM.sdqTrabajador.RecordCount > 1) then
        fraTrabajadorSINABM.dbcTrabNombre.DoDropDown(False)
      else
        fraTrabajadorSINABM.dbcTrabNombreCloseUp(Sender);
    end;
  end;
end;

end.
