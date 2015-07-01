unit unRelevTiposAnexos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, StdCtrls, JvgAskListBox, ImgList, XPMenu, Placemnt,
  ComCtrls, ToolWin, DB, SDEngine, ExtCtrls, unDmPrincipal, SqlFuncs, unComunesFet,
  ShortCutControl, unConstFet, JvExExtCtrls, JvComponent, JvPanel;

type

  TInfoItem = class
  private
    IdItem: Integer;
    IdItemFormRelev: Integer;
    Cumplimiento: String[1];
    constructor Create(aIdItem: integer; aIdItemFormRelev: integer; aCumplimiento: String); overload;
  end;

  TfrmRelevTiposAnexos = class(TfrmCustomForm)
    lstTipoAnexo: TJvgAskListBox;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbNuevo: TToolButton;
    tbEliminar: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton11: TToolButton;
    tbSalir: TToolButton;
    sdqConsultaTipoFormulario: TSDQuery;
    pnlHeader: TPanel;
    HeaderControl1: THeaderControl;
    tbModificar: TToolButton;
    ToolButton1: TToolButton;
    lblValido: TLabel;
    ShortCutControl1: TShortCutControl;
    panComandos: TPanel;
    btnGuardar: TButton;
    btnCancelar: TButton;
    tbTodosNo: TToolButton;
    ToolButton3: TToolButton;
    pnlTransparente: TJvPanel;
    procedure lstTipoAnexoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbSalirClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure lstTipoAnexoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbTodosNoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
  private
    FModoABM: TModoABM;
    FIdTipoAnexo: integer;
    FIdRelevRiesgoLab: integer;
    FIdFormularioRelev: integer;
    FContrato: integer;
    FVigencia: String;
    FIdResolucion: integer;
    FValido: Boolean;
    //genero un array dinamico porque no funcionan los Objetos almacenados en la AddObjects de la lista
    arrObjects: array of TInfoItem;

    procedure ConfigurarControles;
    procedure GuardarItemsFormulario(aIdFormularioRelev: integer; aSqlType: TSqlType);
    procedure SetQuery(aModoForm: TModoABM);
    function Validar: boolean;
    procedure LiberarArray;
    function GetModo: TModoABM;
    procedure SetModo(Value: TModoABM);
  public
    FModoEmpleador : Boolean;
    procedure Cargar(aContrato: integer; aVigencia: String; aIdTipoAnexo: integer; aIdResolucion: integer; aIdRelevRiesgoLab: integer = -1);
    procedure Guardar(aIdTipoAnexo: integer; aIdRelevRiesgoLab: integer; aIdFormularioRelev: integer);
    property ModoABM: TModoABM read GetModo write SetModo;
  end;

var
  frmRelevTiposAnexos: TfrmRelevTiposAnexos;

implementation

uses
  strFuncs, StrUtils, VclExtra, AnsiSql, unSesion, CustomDlgs, General;

{$R *.dfm}

procedure TfrmRelevTiposAnexos.Cargar(aContrato: integer; aVigencia: String; aIdTipoAnexo: integer;
  aIdResolucion: integer; aIdRelevRiesgoLab: integer);
var
  stritem: String;
begin
  lstTipoAnexo.Items.Clear;
  LiberarArray;
  lstTipoAnexo.Invalidate;

  FContrato := aContrato;
  FVigencia := aVigencia;
  FIdResolucion := aIdResolucion;
  FIdTipoAnexo := aIdTipoAnexo;
  FIdRelevRiesgoLab := aIdRelevRiesgoLab;

  with GetQueryEx(
      'SELECT fr_id, fr_valido, fr_fechabaja FROM hys.hfr_formulariorelev ' +
      'WHERE fr_idtipoanexo = :idtipoanexo AND fr_idrelevriesgolaboral = :id',
      [aIdTipoAnexo, aIdRelevRiesgoLab]) do
  try
    if Eof then
      FIdFormularioRelev := -1
    else begin
      FIdFormularioRelev := fieldbyname('fr_id').AsInteger;
      lblValido.Caption := 'Válido: ' + fieldbyname('fr_valido').AsString;
      FValido := (fieldbyname('fr_valido').AsString = 'S');
      if not FieldByName('fr_fechabaja').IsNull then
      begin
        lstTipoAnexo.ItemStyle.BtnFont.Color := clRed;
        lstTipoAnexo.ItemStyle.Font.Color := clRed;
        lblValido.Font.Color := clRed;
      end
      else begin
        lstTipoAnexo.ItemStyle.BtnFont.Color := clWindowText;
        lstTipoAnexo.ItemStyle.Font.Color := clWindowText;
        lblValido.Font.Color := clWindowText;
      end;
    end;
  finally
    free;
  end;

  If not (ModoABM = mfNone) then
  begin
    if FIdFormularioRelev = -1 then
      SetModo(mfAlta)
    else
      SetModo(mfModif);
  end;
  pnlHeader.Caption :=
      ValorSqlEx(
        'SELECT ta_descripcion FROM hys.hta_tipoanexo WHERE ta_id = :id',
        [aIdTipoAnexo]
      );

  SetQuery(FModoABM);

  while not sdqConsultaTipoFormulario.Eof do
  begin
    stritem := RPad(sdqConsultaTipoFormulario.fieldbyname('it_codigo').AsString, ' ', 20) +
                    sdqConsultaTipoFormulario.fieldbyname('it_descripcion').AsString;
    lstTipoAnexo.AddItem(stritem, nil);
    if sdqConsultaTipoFormulario.fieldbyname('cumplimiento').AsString = 'S' then
      lstTipoAnexo.SetPushedButtonInLine(lstTipoAnexo.Count-1, 2)
    else begin
      if sdqConsultaTipoFormulario.fieldbyname('cumplimiento').AsString = 'N' then
        lstTipoAnexo.SetPushedButtonInLine(lstTipoAnexo.Count-1, 1);
    end;
    SetLength(arrObjects, length(arrObjects)+1);
    arrObjects[length(arrObjects)-1] := TInfoItem.Create(sdqConsultaTipoFormulario.fieldbyname('it_id').AsInteger,
                                                           sdqConsultaTipoFormulario.fieldbyname('iditemformrelev').AsInteger,
                                                           sdqConsultaTipoFormulario.fieldbyname('cumplimiento').AsString);
    sdqConsultaTipoFormulario.Next;
  end;
  lstTipoAnexo.Invalidate;
  {
  sSql := 'select 1 from hys.hrl_relevriesgolaboral where rl_id=  '+SqlValue(FIdRelevRiesgoLab)+ 'and rl_fechaexport is not null ';
  if ExisteSql(sSql) then
  begin
    tbNuevo.Enabled := False;
    tbModificar.Enabled := False;
    tbEliminar .Enabled := False;
  end;
  }
end;

procedure TfrmRelevTiposAnexos.lstTipoAnexoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  aValue: integer;
begin
  if (FModoABM in [mfEdit]) then begin
    if (Key = 32) then
    begin
      if lstTipoAnexo.GetPushedButtonInLine(lstTipoAnexo.SelectedItem) =
          lstTipoAnexo.Buttons.Count then
        aValue := 0
      else
        aValue := lstTipoAnexo.GetPushedButtonInLine(lstTipoAnexo.SelectedItem) + 1;

      lstTipoAnexo.SetPushedButtonInLine(lstTipoAnexo.SelectedItem, aValue);
    end
    else begin
      if (Key in [83, 115]) then
        lstTipoAnexo.SetPushedButtonInLine(lstTipoAnexo.SelectedItem, 2)
      else begin
        if (Key in [78, 110]) then
          lstTipoAnexo.SetPushedButtonInLine(lstTipoAnexo.SelectedItem, 1);
      end;
    end;
  end;
end;

procedure TfrmRelevTiposAnexos.tbSalirClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfrmRelevTiposAnexos.Guardar(aIdTipoAnexo: integer; aIdRelevRiesgoLab: integer; aIdFormularioRelev: integer);
begin
  with TSql.Create do
  try
    try
      BeginTrans(true);
      if aIdFormularioRelev = -1 then
        SqlType := stInsert
      else
        SqlType := stUpdate;

      TableName := 'HYS.HFR_FORMULARIORELEV';
      Fields.Add('FR_IDRELEVRIESGOLABORAL', aIdRelevRiesgoLab);
      Fields.Add('FR_IDTIPOANEXO', aIdTipoAnexo);
      if ((lstTipoAnexo.CountPushedButtonsInColon(1) + lstTipoAnexo.CountPushedButtonsInColon(2))<> lstTipoAnexo.Items.Count) then
      begin
        Fields.Add('FR_VALIDO', 'N');
        FValido := false;
      end
      else begin
        Fields.Add('FR_VALIDO', 'S');
        FValido := true;
      end;

      if aIdFormularioRelev = -1 then
      begin
        aIdFormularioRelev := GetSecNextVal('HYS.SEQ_HFR_ID');
        PrimaryKey.Add('FR_ID', aIdFormularioRelev);
        Fields.Add('FR_FECHAALTA', exDateTime);
        Fields.Add('FR_USUALTA', Sesion.LoginName);
      end
      else begin
        PrimaryKey.Add('FR_ID', aIdFormularioRelev);
        Fields.Add('FR_FECHAMODIF', exDateTime);
        Fields.Add('FR_USUMODIF', Sesion.LoginName);
        Fields.Add('FR_FECHABAJA', exNull);
        Fields.Add('FR_USUBAJA', exNull);
      end;

      EjecutarSqlST(Sql);
      GuardarItemsFormulario(aIdFormularioRelev, SqlType);
      if FModoEmpleador then
      begin
        ProcesarObservacionFormulario(aIdRelevRiesgoLab, aIdTipoAnexo, FIdResolucion);
        ProcesarValidezRelev(aIdRelevRiesgoLab, false);
        EjecutarStoreSTEx('hys.do_procesarcumplimiento(:contrato, :vigencia, :tipocarga);', [FContrato, FVigencia, 'R']);
      end;
      CommitTrans(True);
      Cargar(FContrato, FVigencia, FIdTipoAnexo, FIdResolucion, FIdRelevRiesgoLab);
    finally
      free;
    end;
  except
    on E: Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al guardar anexo. ' + #13#10 + E.Message );
    end;
  end;
end;

procedure TfrmRelevTiposAnexos.btnGuardarClick(Sender: TObject);
begin
  inherited;
  if Validar then
  begin
    Guardar(FIdTipoAnexo, FIdRelevRiesgoLab, FIdFormularioRelev);
    ModalResult:= mrOk;
    FModoABM := mfNone;
  end;
end;

procedure TfrmRelevTiposAnexos.lstTipoAnexoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = 9) then
    lstTipoAnexo.SelectedItem := lstTipoAnexo.SelectedItem + 1;
end;

procedure TfrmRelevTiposAnexos.GuardarItemsFormulario(
  aIdFormularioRelev: integer; aSqlType: TSqlType);
var
  i: integer;
  sCumplimientoSelect: String;
begin

  with TSql.Create do
  try
    SqlType := aSqlType;

    TableName := 'HYS.HIF_ITEMSFORMULARIORELEV';

    for i:=0 to length(arrObjects)-1 do
    begin
      Fields.Add('IF_IDFORMULARIORELEV', aIdFormularioRelev);
      if lstTipoAnexo.GetPushedButtonInLine(i) = 1 then
        sCumplimientoSelect := 'N'
      else begin
        if lstTipoAnexo.GetPushedButtonInLine(i) = 2 then
          sCumplimientoSelect := 'S'
        else
          sCumplimientoSelect := '';
      end;

      if (aSqlType = stInsert) then
      begin
        PrimaryKey.Add('IF_ID', GetSecNextVal('HYS.SEQ_HIF_ID'));
        Fields.Add('IF_IDITEMTIPOANEXO', arrObjects[i].IdItem);
        Fields.Add('IF_FECHAALTA', exDateTime);
        Fields.Add('IF_USUALTA', Sesion.LoginName);
        if sCumplimientoSelect = '' then
          Fields.Add('IF_CUMPLIMIENTO', exNull)
        else
          Fields.Add('IF_CUMPLIMIENTO', sCumplimientoSelect);
        EjecutarSqlST(Sql);
      end
      else begin
        if (arrObjects[i].Cumplimiento <> sCumplimientoSelect) and (aSqlType = stUpdate) then
        begin
          if sCumplimientoSelect = '' then
            Fields.Add('IF_CUMPLIMIENTO', exNull)
          else
            Fields.Add('IF_CUMPLIMIENTO', sCumplimientoSelect);
          PrimaryKey.Add('IF_ID', arrObjects[i].IdItemFormRelev);
          Fields.Add('IF_IDITEMTIPOANEXO', arrObjects[i].IdItem);
          Fields.Add('IF_FECHAMODIF', exDateTime);
          Fields.Add('IF_USUMODIF', Sesion.LoginName);
          EjecutarSqlST(Sql);
        end;
      end;
      Clear;
    end;
  finally
    free;
  end;
end;

procedure TfrmRelevTiposAnexos.SetQuery(aModoForm: TModoABM);
begin
  with sdqConsultaTipoFormulario do
  begin
    Close;
    if (aModoForm = mfAlta) or (FIdFormularioRelev = -1) then
    begin
      SQL.Text := ' SELECT   it_id, it_codigo, substr(it_descripcion,1,220) it_descripcion, it_masdatos, null cumplimiento, 0 iditemformrelev ' +
                  ' FROM hys.hit_itemtipoanexo ' +
                  ' WHERE it_idtipoanexo = :idtipoAnexo ' +
                  ' ORDER BY it_orden ';
      Prepare;
      ParamByName('idtipoAnexo').AsInteger := FIdTipoAnexo;
      Open;
    end
    else begin
      SQL.Text := ' SELECT   it_id, it_codigo, substr(it_descripcion,1,220) it_descripcion, it_masdatos, if_cumplimiento cumplimiento, if_id iditemformrelev' +
                  ' FROM hys.hif_itemsformulariorelev, hys.hfr_formulariorelev, hys.hit_itemtipoanexo ' +
                  ' WHERE fr_id = :idformrelev ' +
                  ' AND if_iditemtipoanexo = it_id ' +
                  ' AND if_idformulariorelev = fr_id ' +
                  ' ORDER BY it_orden ';
      Prepare;
      ParamByName('idformrelev').AsInteger := FIdFormularioRelev;
      Open;
    end;
  end;
end;

{ TInfoItem }

constructor TInfoItem.Create(aIdItem: integer; aIdItemFormRelev: integer; aCumplimiento: String);
begin
  inherited Create;
  IdItem := aIdItem;
  Cumplimiento := aCumplimiento;
  IdItemFormRelev := aIdItemFormRelev;
end;

procedure TfrmRelevTiposAnexos.FormDestroy(Sender: TObject);
begin
  LiberarArray;
  inherited;
end;

function TfrmRelevTiposAnexos.Validar: boolean;
begin
  result := true;
  if ((lstTipoAnexo.CountPushedButtonsInColon(1) + lstTipoAnexo.CountPushedButtonsInColon(2))<> lstTipoAnexo.Items.Count) and
      (MsgBox('Existen opciones sin seleccionar. ¿Desea guardar de todas formas?', MB_ICONQUESTION + MB_YESNO) = IDNO) then
    result := false;
end;

procedure TfrmRelevTiposAnexos.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;
  //Otro Bug del componente
  for i:=0 to 100 do
    lstTipoAnexo.AddItem(' ', nil);

  VCLExtra.LockControls([lstTipoAnexo], False);
end;

procedure TfrmRelevTiposAnexos.LiberarArray;
var
  i: integer;
begin
  for i:=0 to length(arrObjects)-1 do
    if Assigned(arrObjects[i]) then
      arrObjects[i].Free;
  SetLength(arrObjects, 0);
end;

procedure TfrmRelevTiposAnexos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  tbSalir.Click;
  //Cargar(FContrato, FVigencia, FIdTipoAnexo, FIdResolucion, FIdRelevRiesgoLab);
end;

procedure TfrmRelevTiposAnexos.ConfigurarControles;
begin
  if (ModoABM = mfAlta) then
  begin
    tbNuevo.Enabled := true;
    tbModificar.Enabled := false;
    tbEliminar.Enabled := false;
    btnGuardar.Enabled := false;
    tbLimpiar.Enabled := false;
    tbTodosNo.Enabled := false;
    btnCancelar.Enabled := false;
  end
  else begin
    if (ModoABM = mfModif) then
    begin
      if ValorSqlDateTime(
        ' SELECT fr_fechabaja '+
        '   FROM hys.hfr_formulariorelev '+
        '  WHERE fr_idrelevriesgolaboral = '+SqlValue(FIdRelevRiesgoLab)+
        '    AND fr_idtipoanexo = '+SqlValue(FIdTipoAnexo)) >0
      then
        tbEliminar.Enabled := False
      else
        tbEliminar.Enabled := true;
      tbNuevo.Enabled := false;
      tbModificar.Enabled := true;
      btnGuardar.Enabled := false;
      tbLimpiar.Enabled := false;
      tbTodosNo.Enabled := false;
      btnCancelar.Enabled := false;
    end
    else begin
      if (ModoABM = mfEdit) then
      begin
        tbNuevo.Enabled := false;
        tbEliminar.Enabled := false;
        tbModificar.Enabled := false;
        tbLimpiar.Enabled := true;
        btnGuardar.Enabled := true;
        tbTodosNo.Enabled := true;
        btnCancelar.Enabled := true;
      end
      else if (ModoABM = mfNone) then
      begin
        tbNuevo.Enabled := false;
        tbEliminar.Enabled := false;
        tbModificar.Enabled := false;
        tbLimpiar.Enabled := false;
        btnGuardar.Enabled := false;
        tbTodosNo.Enabled := false;
        btnCancelar.Enabled := false;
      end;
    end;
  end;

{  tbNuevo.Enabled := isEnabled;
  tbModificar.Enabled := isEnabled;
  tbEliminar.Enabled := isEnabled;
  btnGuardar.Enabled := isEnabled;
  tbLimpiar.Enabled := isEnabled;
  tbTodosNo.Enabled := isEnabled;
  btnGuardar.Enabled := isEnabled;
  btnCancelar.Enabled := isEnabled;}
  lstTipoAnexo.SelectedItem := 0;
  pnlTransparente.BringToFront;
end;


procedure TfrmRelevTiposAnexos.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  btnCancelarClick(Sender);
end;

procedure TfrmRelevTiposAnexos.tbTodosNoClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i:=0 to lstTipoAnexo.Count-1 do
    lstTipoAnexo.SetPushedButtonInLine(i, 1);
end;

procedure TfrmRelevTiposAnexos.tbEliminarClick(Sender: TObject);
begin
  inherited;
  BeginTrans;
  ModoABM := mfBaja;
  try
    EjecutarSqlSTEx(' UPDATE hys.hfr_formulariorelev ' +
                    ' SET fr_fechabaja = sysdate, ' +
                    '     fr_usubaja = :usubaja ' +
                    ' WHERE fr_id = :id ', [Sesion.LoginName, FIdFormularioRelev]);
    if FModoEmpleador then
    begin
      ProcesarObservacionFormulario(FIdRelevRiesgoLab , FIdTipoAnexo, FIdResolucion);
      ProcesarValidezRelev(FIdRelevRiesgoLab, false);
      EjecutarStoreSTEx('hys.do_procesarcumplimiento(:contrato, :vigencia, :tipocarga);', [FContrato, FVigencia, 'R']);
    end;
    Cargar(FContrato, FVigencia, FIdTipoAnexo, FIdResolucion, FIdRelevRiesgoLab);
    CommitTrans;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al eliminar anexo. ' + #13#10 + E.Message );
    end;
  end;
end;

function TfrmRelevTiposAnexos.GetModo: TModoABM;
begin
  Result := FModoABM;
end;

procedure TfrmRelevTiposAnexos.SetModo(Value: TModoABM);
begin
  FModoABM := Value;
  ConfigurarControles;
end;

procedure TfrmRelevTiposAnexos.tbModificarClick(Sender: TObject);
begin
  SetModo(mfEdit);
  pnlTransparente.SendToBack;
end;

procedure TfrmRelevTiposAnexos.tbNuevoClick(Sender: TObject);
begin
  SetModo(mfEdit);
  pnlTransparente.SendToBack;
end;

end.
