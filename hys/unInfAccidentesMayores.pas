unit unInfAccidentesMayores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unfraEstablecimientoDomic, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, ExtCtrls, Mask, ToolEdit,
  DateComboBox, ComCtrls, PatternEdit, IntEdit,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraTrabajadorAMP,
  unFraCodigoDescripcion, unFraCodDesc, Buttons, FormPanel, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ToolWin, CurrEdit, ExComboBox,
  JvgAskListBox, unComunesFet, SqlFuncs, DB, SDEngine,
  unProfesionales, unSustanciasSector, unCapacitacionResponsable;

type
  TModoABM = (maNone, maAlta, maModificacion, maBaja);

  TInfoItem = class
  private
    IdItem: Integer;
    IdItemEvaluado: Integer;
    Respuesta: String[1];
    constructor Create(aIdItem: integer; aIdItemEvaluado: integer; aRespuesta: String); overload;
  end;

  TfrmInfAccidentesMayores = class(TForm)
    pcInforme: TPageControl;
    tsInforme: TTabSheet;
    tsProfesionales: TTabSheet;
    pnlBottom: TPanel;
    ScrollBox: TScrollBox;
    gbInforme: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    lbInfExportado: TLabel;
    edNroInforme: TEdit;
    edFechaInforme: TDateComboBox;
    rgTipoInforme: TRadioGroup;
    gbEmpresa: TGroupBox;
    CUIT: TLabel;
    lbCPostalA: TLabel;
    Label18: TLabel;
    fraEmpresa: TfraEmpresa;
    fraEstablecimiento: TfraEstablecimientoDomic;
    edCPA: TEdit;
    edCiuu: TEdit;
    gbResponsable: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edCuitResponsable: TMaskEdit;
    fraTipoDocumento: TfraStaticCTB_TABLAS;
    fraRepresentacion: TfraStaticCTB_TABLAS;
    edApellidoNombre: TEdit;
    gbDatosEstab: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel3: TBevel;
    edAdministrativo: TIntEdit;
    edProduccion: TIntEdit;
    edtotal: TIntEdit;
    btnAplicar: TButton;
    btnAceptar: TButton;
    btnCancelar: TButton;
    tsSustanciasSector: TTabSheet;
    chbDenunciarResponsable: TCheckBox;
    chbDenunciarEmpresa: TCheckBox;
    chbDenunciarPersonal: TCheckBox;
    tsCapacitacionResponsable: TTabSheet;
    tsEvalEstab: TTabSheet;
    lstEvalEstab: TJvgAskListBox;
    tsDatosComplementarios: TTabSheet;
    edDescMetEval: TMemo;
    Label8: TLabel;
    edGradoImplementacion: TIntEdit;
    Label11: TLabel;
    cbPeriodoRev: TExComboBox;
    Label16: TLabel;
    Label17: TLabel;
    edFechaRev: TDateComboBox;
    Label38: TLabel;
    edDescPlanCapacitacion: TMemo;
    sdqAccMayores: TSDQuery;
    sdqEvalEstab: TSDQuery;
    HeaderControl1: THeaderControl;
    Label12: TLabel;
    edFechaRecepcion: TDateComboBox;
    procedure btnAplicarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fraEstablecimientoOnChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraEmpresaOnChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure lstEvalEstabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstEvalEstabKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    ModoABM : TModoABM;
    Sql: TCustomSql;
    frmProfesionales : TfrmProfesionales;
    frmSustanciasSector : TfrmSustanciasSector;
    frmCapacitacionResponsable : TfrmCapacitacionResponsable;
    arrObjects: array of TInfoItem;
    procedure LiberarArray;
    procedure BloquearProfesionales(estado : Boolean);
    procedure BloquearSustanciasSector(estado : Boolean);
    procedure BloquearCapacitacionResp(estado : Boolean);
    procedure BloquearEvalEstab(estado : Boolean);
    procedure BloquearDatosCompletario(estado: boolean);
    procedure BloquearBarras(bloqueo: Boolean);
    procedure ValidarInforme;
    procedure GuardarInforme;
    procedure CargarItemsAEvaluar(idInforme: integer = -1);
    procedure ValidarItemsAEvaluar;
    procedure GuardarItemsAEvaluar(idInforme: integer);
  public
    procedure NuevoInforme;
    procedure Cargar(idInforme : Integer);
  end;

var
  frmInfAccidentesMayores: TfrmInfAccidentesMayores;

implementation

uses
  CustomDlgs, unDmPrincipal, unSesion, Math, DBSql, AnsiSql, Strfuncs, VclExtra, Cuit;

{$R *.dfm}

procedure TfrmInfAccidentesMayores.btnAplicarClick(Sender: TObject);
begin
  BeginTrans(True);
  ValidarInforme;
  GuardarInforme;
  if ModoABM = maalta then
  begin
    bloquearBarras(False);
    ModoABM := maModificacion;
  end
  else begin
    if ModoABM = maModificacion then
    begin
      GuardarItemsAEvaluar(tsEvalEstab.Tag);
      CargarItemsAEvaluar(tsEvalEstab.Tag);
    end;
  end;
  CommitTrans(True);
end;

procedure TfrmInfAccidentesMayores.btnAceptarClick(Sender: TObject);
begin
  BeginTrans(True);
  validarInforme;
  guardarInforme;
  if ModoABM = maModificacion then
    GuardarItemsAEvaluar(tsEvalEstab.Tag);
  CommitTrans(True);
  ModalResult := mrOK;
end;

procedure TfrmInfAccidentesMayores.Cargar(idInforme: Integer);
begin
  ModoABM := maModificacion;
  sdqAccMayores.Close;
  sdqAccMayores.ParamByName('IDINFORME').AsInteger := idInforme;
  frmProfesionales.IDInforme := idInforme;
  frmSustanciasSector.IDInforme := idInforme;
  frmCapacitacionResponsable.IDInforme := idInforme;
  tsEvalEstab.Tag := idInforme;
  sdqAccMayores.Open;
  edNroInforme.Text := sdqAccMayores.FieldByName('IN_NROINFORME').AsString;
  edFechaInforme.Date := sdqAccMayores.FieldByName('IN_FECHAINFORME').AsDateTime;
  edFechaRecepcion.Date := sdqAccMayores.FieldByName('IN_FECHARECEPCION').AsDateTime;
  rgTipoInforme.ItemIndex := sdqAccMayores.FieldByName('IN_CATINFORME').AsInteger;
  chbDenunciarEmpresa.Checked := sdqAccMayores.FieldByName('IN_FALTAEMPRESA').AsString = 'S';
  if not chbDenunciarEmpresa.Checked then
  begin
    fraEmpresa.CUIT := sdqAccMayores.FieldByName('IN_CUIT').AsString;
    fraEstablecimiento.Cargar(sdqAccMayores.FieldByName('IN_CUIT').AsString,
                              sdqAccMayores.FieldByName('es_nroestableci').AsString);
    fraEstablecimientoOnChange(nil);
  end;

  chbDenunciarResponsable.Checked := sdqAccMayores.FieldByName('IN_FALTARESPONSABLE').AsString = 'S';

  if not chbDenunciarResponsable.Checked then
  begin
    edCuitResponsable.Text := sdqAccMayores.FieldByName('IN_CUIL').AsString;
    edApellidoNombre.Text := sdqAccMayores.FieldByName('IN_NOMBREAPELLIDO').AsString;
    fraTipoDocumento.Codigo := sdqAccMayores.FieldByName('IN_TIPODOCUMENTO').AsString;
    fraRepresentacion.Codigo := sdqAccMayores.FieldByName('IN_REPRESENTACION').AsString;
  end;

  chbDenunciarPersonal.Checked := sdqAccMayores.FieldByName('IN_FALTADATOSESTAB').AsString = 'S';

  if not chbDenunciarPersonal.Checked then
  begin
    edAdministrativo.Value := sdqAccMayores.FieldByName('IN_CANTTRABADMINISTRATIVOS').AsInteger;
    edProduccion.Value := sdqAccMayores.FieldByName('IN_CANTTRABPRODUCCION').AsInteger;
    edtotal.Text := IntToStr(StrToInt(edProduccion.Text)+StrToInt(edAdministrativo.Text));
  end;

  edDescMetEval.Text := sdqAccMayores.FieldByName('IN_METODOEVALUACION').AsString;
  edGradoImplementacion.Value := sdqAccMayores.FieldByName('IN_GRADOIMPLEMENTACION').AsInteger;
  cbPeriodoRev.Value := sdqAccMayores.FieldByName('IN_PERIODOREV').AsString;
  edFechaRev.Date := sdqAccMayores.FieldByName('IN_FECHAULTREV').AsDateTime;
  edDescPlanCapacitacion.Text := sdqAccMayores.FieldByName('IN_PLANCAPACITACION').AsString;

  CargarItemsAEvaluar(idInforme);
end;

procedure TfrmInfAccidentesMayores.NuevoInforme;
begin
  ModoABM := maAlta;
  bloquearBarras(True);
  CargarItemsAEvaluar;
end;

procedure TfrmInfAccidentesMayores.GuardarInforme;
var
  IDInforme, nroInforme : Integer;
begin
  nroInforme := 0;
  Sql.Clear;
  Sql.TableName := 'HYS.HIN_INFORME';
  if ModoABM = maAlta then
  begin
    nroInforme := ValorSql('SELECT NVL(MAX(in_nroinforme)+1,1) FROM hys.hin_informe WHERE in_tipoinforme = ''A'' ');
    Sql.SqlType := stInsert;
    IDInforme:= GetSecNextVal('HYS.SEQ_HIN_ID');
    Sql.Fields.Add('IN_USUALTA', Sesion.UserID );
    Sql.Fields.Add('IN_FECHAALTA', exDateTime );
    Sql.Fields.Add('IN_NROINFORME', nroInforme);
    Sql.Fields.Add('IN_TIPOINFORME', 'A');
  end
  else
  begin
    Sql.SqlType := stUpdate;
    IDInforme := sdqAccMayores.FieldByName('IN_ID').AsInteger;
    Sql.Fields.Add('IN_USUMODIF', Sesion.UserID);
    Sql.Fields.Add('IN_FECHAMODIF', exDateTime );
    Sql.Fields.Add('IN_USUBAJA', exNull );
    Sql.Fields.Add('IN_FECHABAJA', exNull );

    Sql.Fields.Add('IN_METODOEVALUACION', edDescMetEval.Text);
    Sql.Fields.Add('IN_GRADOIMPLEMENTACION', edGradoImplementacion.Value);
    Sql.Fields.Add('IN_PERIODOREV', cbPeriodoRev.Value);
    Sql.Fields.AddDate('IN_FECHAULTREV', edFechaRev.Date);
    Sql.Fields.Add('IN_PLANCAPACITACION', edDescPlanCapacitacion.Text);
  end;
  Sql.Fields.Add('IN_FECHAINFORME', edFechaInforme.Date);
  Sql.Fields.Add('IN_FECHARECEPCION', edFechaRecepcion.Date);
  Sql.Fields.Add('IN_CATINFORME', rgTipoInforme.ItemIndex);

  Sql.PrimaryKey.Add('IN_ID',IDInforme);

  if chbDenunciarEmpresa.Checked then
  begin
    Sql.Fields.Add('IN_FALTAEMPRESA', 'S');
    if ((ModoABM = maAlta) or (sdqAccMayores.FieldByName('IN_FALTAEMPRESA').AsString = 'N')) then
      DenunciaDatosIncompletos(fraEmpresa.CUIT,fraEstablecimiento.IdEstablecimiento,nroInforme,'Empresa','Accidente mayores');
  end
  else
  begin
    Sql.Fields.Add('IN_FALTAEMPRESA', 'N');
    Sql.Fields.Add('IN_CUIT', fraEmpresa.CUIT);
    Sql.Fields.Add('IN_IDESTABLECI', fraEstablecimiento.IdEstablecimiento);
  end;

  if chbDenunciarResponsable.Checked then
  begin
    Sql.Fields.Add('IN_FALTARESPONSABLE', 'S');
    if ((ModoABM = maAlta) or (sdqAccMayores.FieldByName('IN_FALTARESPONSABLE').AsString = 'N')) then
      DenunciaDatosIncompletos(fraEmpresa.CUIT,fraEstablecimiento.IdEstablecimiento,nroInforme,'Responsable','Accidente mayores');
  end
  else
  begin
    Sql.Fields.Add('IN_FALTARESPONSABLE', 'N');
    Sql.Fields.Add('IN_CUIL', edCuitResponsable.Text);
    Sql.Fields.Add('IN_NOMBREAPELLIDO', edApellidoNombre.Text);
    Sql.Fields.Add('IN_TIPODOCUMENTO', fraTipoDocumento.Codigo);
    Sql.Fields.Add('IN_REPRESENTACION', fraRepresentacion.Codigo);
  end;

  if chbDenunciarPersonal.Checked then
  begin
    Sql.Fields.Add('IN_FALTADATOSESTAB', 'S');
    if ((ModoABM = maAlta) or (sdqAccMayores.FieldByName('IN_FALTADATOSESTAB').AsString = 'N')) then
      DenunciaDatosIncompletos(fraEmpresa.CUIT,fraEstablecimiento.IdEstablecimiento,nroInforme,'Datos Establecimiento','Accidente mayores');
  end
  else
  begin
    Sql.Fields.Add('IN_FALTADATOSESTAB', 'N');
    Sql.Fields.Add('IN_CANTTRABADMINISTRATIVOS', edAdministrativo.Text);
    Sql.Fields.Add('IN_CANTTRABPRODUCCION', edProduccion.Text);
  end;

  EjecutarSqlST(Sql.Sql);
  if ModoABM = maAlta then
  begin
    frmProfesionales.IDInforme := IDInforme;
    frmSustanciasSector.IDInforme := IDInforme;
    frmCapacitacionResponsable.IDInforme := IDInforme;
    tsEvalEstab.Tag := IDInforme;
    MsgBox('El Número de Informe es: '+ IntToStr(nroInforme));
    edNroInforme.Text := IntToStr(nroInforme);
    sdqAccMayores.Close;
    sdqAccMayores.ParamByName('IDINFORME').AsInteger := IDInforme;
    sdqAccMayores.Open;
  end;
end;

procedure TfrmInfAccidentesMayores.ValidarInforme;
begin
  Verificar(edFechaInforme.Date = 0 ,edFechaInforme, 'Debe Ingresar la fecha de Informe.');
  Verificar(edFechaRecepcion.Date = 0 ,edFechaRecepcion, 'Debe Ingresar la fecha de Recepción.');
  Verificar(rgTipoInforme.ItemIndex = -1, rgTipoInforme, 'Debe indicar que tipo de informe es.');

  if not chbDenunciarEmpresa.Checked then
  begin
    Verificar(not fraEmpresa.IsSelected, fraEmpresa, 'Debe Seleccionar la empresa.');
    Verificar(not fraEstablecimiento.IsSelected, fraEstablecimiento, 'Debe Seleccionar el establecimiento');
  end;
  if not chbDenunciarResponsable.Checked then
  begin
    Verificar(edCuitResponsable.Text = '', edCuitResponsable,'Debe completar el campo');
    Verificar(not IsCuil(edCuitResponsable.Text), edCuitResponsable,'Debe completar con un Cuil válido.');

    Verificar(edApellidoNombre.Text = '',edApellidoNombre, 'Debe Ingresar el nombre y apellido.');
    Verificar(not fraTipoDocumento.IsSelected, fraTipoDocumento,'Debe seleccionar el tipo de documento.');
    Verificar(not fraRepresentacion.IsSelected, fraRepresentacion,'Debe seleccionar el tipo de representación.');
  end;
  if not chbDenunciarPersonal.Checked then
  begin
    Verificar(edAdministrativo.Text = '', edAdministrativo,'Debe ingresar el administrativo ');
    Verificar(edProduccion.Text = '', edProduccion,'Debe ingresar la producción');
  end;
end;

procedure TfrmInfAccidentesMayores.BloquearBarras(bloqueo: Boolean);
begin
  bloquearProfesionales(bloqueo);
  bloquearSustanciasSector(bloqueo);
  BloquearEvalEstab(bloqueo);
  BloquearDatosCompletario(bloqueo);
  BloquearCapacitacionResp(bloqueo);
end;

procedure TfrmInfAccidentesMayores.BloquearProfesionales(estado: Boolean);
begin
  frmProfesionales.ToolBar.Enabled := not estado;
end;

procedure TfrmInfAccidentesMayores.BloquearSustanciasSector(
  estado: Boolean);
begin
  frmSustanciasSector.ToolBar.Enabled := not estado;
end;


procedure TfrmInfAccidentesMayores.fraEstablecimientoOnChange(
  Sender: TObject);
begin
  if fraEstablecimiento.IsSelected then
  begin
    edCPA.Text := fraEstablecimiento.CPostalA;
    edCiuu.Text := ValorSql('select substr(art.hys.get_codactividadrevdos(ac_id, ac_revision),1,6) from comunes.cac_actividad where ac_codigo = ' + SqlValue(fraEstablecimiento.Actividad));
  end;
end;

procedure TfrmInfAccidentesMayores.FormCreate(Sender: TObject);
var
  i: integer;
begin
  fraEmpresa.ShowBajas := true;
  fraEmpresa.UltContrato := true;

  frmProfesionales := TfrmProfesionales.Create( Self );
  frmProfesionales.Parent    := tsProfesionales;
  frmProfesionales.Visible   := True;
  frmProfesionales.Align     := alClient;

  frmSustanciasSector := TfrmSustanciasSector.Create(Self);
  frmSustanciasSector.TipoAbm := taAccMayores;
  frmSustanciasSector.Parent := tsSustanciasSector;
  frmSustanciasSector.Visible := True;
  frmSustanciasSector.Align := alClient;

  frmCapacitacionResponsable := TfrmCapacitacionResponsable.Create( Self );
  frmCapacitacionResponsable.Parent    := tsCapacitacionResponsable;
  frmCapacitacionResponsable.Visible   := True;
  frmCapacitacionResponsable.Align     := alClient;

  pcInforme.ActivePageIndex := 0;
  fraRepresentacion.Clave      := 'TREPR';
  fraRepresentacion.AutoFilter := True;
  fraTipoDocumento.Clave       := 'TDOCN';
  fraEmpresa.OnChange := fraEmpresaOnChange;
  fraEstablecimiento.ShowBajas := True;
  fraEstablecimiento.OnChange := fraEstablecimientoOnChange;
  Sql := TDBSql.Create;
  //Otro Bug del componente
  for i:=0 to 100 do
    lstEvalEstab.AddItem(' ', nil);
end;

procedure TfrmInfAccidentesMayores.fraEmpresaOnChange(Sender: TObject);
begin
  inherited;
  if fraEmpresa.IsSelected then
    fraEstablecimiento.CUIT := fraEmpresa.CUIT
  else
    fraEstablecimiento.Clear;
end;


procedure TfrmInfAccidentesMayores.FormDestroy(Sender: TObject);
begin
  LiberarArray;
  Sql.free;
  frmProfesionales.free;
  frmSustanciasSector.free;
  frmCapacitacionResponsable.Free;
end;

procedure TfrmInfAccidentesMayores.btnCancelarClick(Sender: TObject);
begin
  Rollback(true);
  ModalResult := mrOk;
end;

procedure TfrmInfAccidentesMayores.CargarItemsAEvaluar(idInforme: integer);
var
  stritem: String;
begin
  lstEvalEstab.Items.Clear;
  LiberarArray;
  lstEvalEstab.Invalidate;

  sdqEvalEstab.Close;
  sdqEvalEstab.ParamByName('idinforme').AsInteger := idInforme;
  sdqEvalEstab.Open;
  while not sdqEvalEstab.Eof do
  begin
    stritem := RPad(sdqEvalEstab.fieldbyname('ie_codigo').AsString, ' ', 20) +
                    sdqEvalEstab.fieldbyname('ie_descripcion').AsString;
    lstEvalEstab.AddItem(stritem, nil);
    if sdqEvalEstab.fieldbyname('he_respuesta').AsString = 'S' then
      lstEvalEstab.SetPushedButtonInLine(lstEvalEstab.Count-1, 2)
    else begin
      if sdqEvalEstab.fieldbyname('he_respuesta').AsString = 'N' then
        lstEvalEstab.SetPushedButtonInLine(lstEvalEstab.Count-1, 1);
    end;
    SetLength(arrObjects, length(arrObjects)+1);
    arrObjects[length(arrObjects)-1] := TInfoItem.Create(sdqEvalEstab.fieldbyname('ie_id').AsInteger,
                                                         sdqEvalEstab.fieldbyname('he_id').AsInteger,
                                                         sdqEvalEstab.fieldbyname('he_respuesta').AsString);
    sdqEvalEstab.Next;
  end;
  lstEvalEstab.Invalidate;
end;

procedure TfrmInfAccidentesMayores.LiberarArray;
var
  i: integer;
begin
  for i:=0 to length(arrObjects)-1 do
    if Assigned(arrObjects[i]) then
      arrObjects[i].Free;
  SetLength(arrObjects, 0);
end;

{ TInfoItem }

constructor TInfoItem.Create(aIdItem, aIdItemEvaluado: integer;
  aRespuesta: String);
begin
  inherited Create;
  IdItem := aIdItem;
  Respuesta := aRespuesta;
  IdItemEvaluado := aIdItemEvaluado;
end;

procedure TfrmInfAccidentesMayores.lstEvalEstabKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  aValue: integer;
begin
  if (Key = 32) then
  begin
    if lstEvalEstab.GetPushedButtonInLine(lstEvalEstab.SelectedItem) =
        lstEvalEstab.Buttons.Count then
      aValue := 0
    else
      aValue := lstEvalEstab.GetPushedButtonInLine(lstEvalEstab.SelectedItem) + 1;

    lstEvalEstab.SetPushedButtonInLine(lstEvalEstab.SelectedItem, aValue);
  end
  else begin
    if (Key in [83, 115]) then
      lstEvalEstab.SetPushedButtonInLine(lstEvalEstab.SelectedItem, 2)
    else begin
      if (Key in [78, 110]) then
        lstEvalEstab.SetPushedButtonInLine(lstEvalEstab.SelectedItem, 1);
    end;
  end;
end;

procedure TfrmInfAccidentesMayores.lstEvalEstabKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 9) then
    lstEvalEstab.SelectedItem := lstEvalEstab.SelectedItem + 1;
end;

procedure TfrmInfAccidentesMayores.BloquearEvalEstab(estado: Boolean);
begin
  tsEvalEstab.Enabled := not estado;
end;

procedure TfrmInfAccidentesMayores.ValidarItemsAEvaluar;
begin
  Verificar(((lstEvalEstab.CountPushedButtonsInColon(1) + lstEvalEstab.CountPushedButtonsInColon(2))<> lstEvalEstab.Items.Count), lstEvalEstab, 'Existen items sin contestar.');
end;

procedure TfrmInfAccidentesMayores.GuardarItemsAEvaluar(
  idInforme: integer);
var
  i: integer;
  sResultadoSelect: String;
begin
  ValidarItemsAEvaluar;

  with TSql.Create do
  try
    if arrObjects[0].IdItemEvaluado = 0 then
      SqlType := stInsert
    else
      SqlType := stUpdate;

    TableName := 'hys.hee_evaluacionestab';

    for i:=0 to length(arrObjects)-1 do
    begin
      if lstEvalEstab.GetPushedButtonInLine(i) = 1 then
        sResultadoSelect := 'N'
      else begin
        if lstEvalEstab.GetPushedButtonInLine(i) = 2 then
          sResultadoSelect := 'S';
      end;

      Fields.Add('he_idinforme', idInforme);
      Fields.Add('he_iditemevaluado', arrObjects[i].IdItem);
      if (SqlType = stInsert) then
      begin
        PrimaryKey.Add('he_id', GetSecNextVal('hys.seq_hee_evaluacionestab'));
        Fields.Add('he_respuesta', sResultadoSelect);
        Fields.Add('he_fechaalta', exDateTime);
        Fields.Add('he_usualta', Sesion.LoginName);
        EjecutarSqlST(Sql);
      end
      else begin
        if (arrObjects[i].Respuesta <> sResultadoSelect) and (SqlType = stUpdate) then
        begin
          Fields.Add('he_respuesta', sResultadoSelect);
          PrimaryKey.Add('he_id', arrObjects[i].IdItemEvaluado);
          Fields.Add('he_fechamodif', exDateTime);
          Fields.Add('he_usumodif', Sesion.LoginName);
          EjecutarSqlST(Sql);
        end;
      end;
      Clear;
    end;
  finally
    free;
  end;
end;

procedure TfrmInfAccidentesMayores.BloquearDatosCompletario(
  estado: boolean);
begin
  LockControls(tsDatosComplementarios, estado);
  tsDatosComplementarios.Enabled := not estado;
end;

procedure TfrmInfAccidentesMayores.BloquearCapacitacionResp(
  estado: Boolean);
begin
  frmCapacitacionResponsable.ToolBar.Enabled := not estado;
end;

end.
