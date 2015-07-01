{
INSERT INTO CTB_TABLAS
(TB_CLAVE, TB_CODIGO, TB_DESCRIPCION, TB_BAJA)
VALUES
('TARCH', 'SIN', 'Sinestro, Orden y Recaída', 'N')
/
INSERT INTO CTB_TABLAS
(TB_CLAVE, TB_CODIGO, TB_DESCRIPCION, TB_BAJA)
VALUES
('TARCH', 'TN', 'Tipo + Número', 'N')
/
INSERT INTO CTB_TABLAS
(TB_CLAVE, TB_CODIGO, TB_DESCRIPCION, TB_BAJA)
VALUES
('TARCH', 'CUIT', 'Empresa (CUIT)', 'N')
/
INSERT INTO CTB_TABLAS
(TB_CLAVE, TB_CODIGO, TB_DESCRIPCION, TB_BAJA)
VALUES
('TARCH', 'N', 'Número', 'N')
/
INSERT INTO CTB_TABLAS
(TB_CLAVE, TB_CODIGO, TB_DESCRIPCION, TB_BAJA)
VALUES
('TARCH', 'J', 'Juicio', 'N')
/
INSERT INTO CTB_TABLAS
(TB_CLAVE, TB_CODIGO, TB_DESCRIPCION, TB_BAJA)
VALUES
('TARCH', 'CE', 'Cuit+Establecimiento', 'N')
/
}
unit unFraRAR_ARCHIVO;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, unArtFrame, unArtDBFrame, ExComboBox, ComCtrls, FSPageControl,
  SinEdit, Mask, PatternEdit, ComboEditor, DBComboGrid, Db, SDEngine,
  CardinalEdit, unFraCodigoDescripcion, unFraEmpresa, IntEdit,
  unfraArchJuicio, unArt, ExtCtrls, unfraEstablecimiento, unArtDBAwareFrame;

type
  TFormulario = (ftNone, ftCuit, ftSiniestro, ftTipoNumero, ftNumero, ftJuicio, ftCuitEstableci, ftBiblioratoNota);
  TfraRAR_ARCHIVO = class(TArtDbFrame)
    lbTipoArchivo: TLabel;
    pcFormulario: TFSPageControl;
    cmbTipoArchivo: TDBComboGrid;
	tsNone: TTabSheet;
    tsCuit: TTabSheet;
    tsSiniestro: TTabSheet;
    tsTipoNumero: TTabSheet;
    fraEmpresa: TfraEmpresa;
    lblSiniestro: TLabel;
    edSiniestro: TSinEdit;
    lblTipoNumero: TLabel;
    fraTipNumTipo: TfraCodigoDescripcion;
    lblNumero: TLabel;
    edTipNumNumero: TIntEdit;
    tsJuicio: TTabSheet;
    fraJuicio: TfraArchJuicio;
    Juicio: TLabel;
    pnlNone: TPanel;
    tsNumero: TTabSheet;
    lblNumeroNumero: TLabel;
    edNumNumero: TIntEdit;
    fraEstablecimiento: TfraEstablecimiento;
    tsBiblioratoNota: TTabSheet;
    lblBilbliorato: TLabel;
    lblNota: TLabel;
    edBibliorato: TIntEdit;
    edNota: TIntEdit;
    tsCuitEstablecim: TTabSheet;
    procedure cmbTipoArchivoValueChange(Sender: TObject);
  private
    FFormulario: TFormulario;
    FValue: TTableID;
    FSoloExistente: boolean;
    procedure SetFormulario(const Value: TFormulario);
    function GetNombre: string; {Devuelve en forma agradable el nombre de la carpeta}
    function GetIsDataSelected: boolean;
    function GetIsDataEmpty: boolean;
    function GetIsAdministrator: boolean;
    function GetValueOrNew: TTableId;
  protected
    procedure Internal_SetValue(AValue: TTableId; ADoChanges: Boolean = True; AAllwaysCange: Boolean = False);
    function GetIsEmpty: boolean; override;
    function GetValue: TTableID; override;
    procedure SetValue(const Value: TTableID); override;
    procedure OnfraEmpresaChange(Sender: TObject);
    procedure OnDatosChange(ASender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    procedure Validate;
    procedure ClearData;
    procedure WaitForInput; {Setea el foco según el formulario seleccionado esperando datos}
    function IsValid: boolean;

    procedure NewRecord;
    property IsAdministrator: boolean read GetIsAdministrator;
    property IsDataEmpty: boolean read GetIsDataEmpty;
    property IsDataSelected: boolean read GetIsDataSelected;
    property Value;
    property Nombre: string read GetNombre;
    property ValueOrNew: TTableId    read GetValueOrNew;
  published
    property Formulario: TFormulario read FFormulario write SetFormulario default ftNone;
    property SoloExistente: boolean read FSoloExistente write FSoloExistente default False;
  end;

function StrToFormulario(AValue: string): TFormulario;
function FormularioToPageIndex(AValue: TFormulario): Integer;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, Consts;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
function FormularioToPageIndex(AValue: TFormulario): Integer;
begin
  if AValue = ftCuitEstableci Then
    Result := Integer(ftCuit)
  else
    Result := Integer(AValue);
end;
{----------------------------------------------------------------------------------------------------------------------}
function StrToFormulario(AValue: string): TFormulario;
begin
  if AValue = 'CUIT' Then
    Result := ftCuit
  else if AValue = 'SIN' Then
    Result := ftSiniestro
  else if AValue = 'TN' Then
    Result := ftTipoNumero
  else if AValue = 'N' Then
    Result := ftNumero
  else if AValue = 'J' Then
    Result := ftJuicio
  else if AValue = 'CE' Then
    Result := ftCuitEstableci
  else if AValue = 'BN' Then
    Result := ftBiblioratoNota
  else
    Result := ftNone;
    //raise Exception.Create(SInvalidPropertyValue);
end;
{----------------------------------------------------------------------------------------------------------------------}
{ TfraRAR_ARCHIVO }
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraRAR_ARCHIVO.Create(AOwner: TComponent);
begin
  inherited;
  sdqDatos.ParamByName('pUsuario').AsString := frmPrincipal.DBLogin.UserID;
  OpenQuery(sdqDatos);

  fraEmpresa.OnChange := OnfraEmpresaChange;
  fraJuicio.OnChange  := OnDatosChange;
  fraEstablecimiento.OnChange := OnDatosChange;

  fraEstablecimiento.ShowBajas := True;

  FSoloExistente := False;

  cmbTipoArchivo.KeyValue := IdTipoArchivo;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraRAR_ARCHIVO.GetIsEmpty: boolean;
begin
  Result := FValue = ART_EMPTY_ID;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraRAR_ARCHIVO.GetNombre: string;
begin
  if IsEmpty Then
    Result := ''
  else
    case Formulario of
      ftCuit:
        with fraEmpresa do
          Result := Format('Cuit: %s, Contrato: %s, Razón Social: %s', [mskCuit.Text, edContrato.Text, cmbRSocial.Text]);
      ftSiniestro:
        Result := 'Siniestro ' + edSiniestro.Text;
      ftTipoNumero:
        Result := Format('Tipo: %s Número: %d', [fraTipNumTipo.Value, edTipNumNumero.Value]);
      ftNumero:
        Result := 'Número: ' + edNumNumero.Text;
      ftJuicio:
        Result := 'Juicio Número ' + fraJuicio.Codigo;
      ftCuitEstableci:
        with fraEmpresa, fraEstablecimiento do
          Result := Format('Cuit: %s, Contrato: %s, Razón Social: %s, Establecimiento: %d', [mskCuit.Text, edContrato.Text, cmbRSocial.Text, NroEstablecimiento]);
      ftBiblioratoNota:
        Result := 'Bibliorato:' + edBibliorato.Text + ', Nota: ' + edNota.Text;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraRAR_ARCHIVO.GetValue: TTableID;
begin
  Result := FValue;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraRAR_ARCHIVO.OnDatosChange(ASender: TObject);
var
  sTabla,
  sPrefijo,
  sSql: String;
begin
  if Formulario = ftNone Then
    Internal_SetValue(ART_EMPTY_ID)

  else if Formulario = ftJuicio Then
    {$IFDEF ART2}
    Internal_SetValue(fraJuicio.Value)
    {$ELSE}
    Internal_SetValue(StrToIntDef(fraJuicio.Value, ART_EMPTY_ID))
    {$ENDIF}
  else
  begin
    sTabla := sdqDatos.FieldByName('TA_TABLA').AsString;
    sPrefijo := Copy(sTabla, 2, 2);

    sSql := 'SELECT ' + sPrefijo + '_IDARCHIVO FROM ' + sTabla + ' WHERE ' + sPrefijo;

    case Formulario of
      ftCuit:
        sSql := sSql + '_CUIT = ' + SqlValue(fraEmpresa.Value);
      ftSiniestro:
        sSql := sSql     + '_SINIESTRO = ' + SqlValue(edSiniestro.Siniestro) + ' AND ' +
                sPrefijo + '_ORDEN = ' + SqlValue(edSiniestro.Orden);
      {ftTipoNumero:
        sSql := '_SINIESTRO = ' + SqlValue(SinEdit.Siniestro) + ' ' + sPrefijo +
                '_ORDEN = ' + SqlValue(SinEdit.Orden);}
      ftCuitEstableci:
        sSql := sSql     + '_CUIT = ' + SqlValue(fraEmpresa.Value) + ' AND ' +
                sPrefijo + '_ESTABLECI = ' + SqlValue(fraEstablecimiento.Value);
      ftBiblioratoNota:
        sSql := sSql     + '_BIBLIORATO = ' + SqlValue(edBibliorato.Text) + ' AND ' +
                sPrefijo + '_NOTA = ' + SqlValue(edNota.Text);
    end;
    Internal_SetValue(ValorSqlInteger(sSql), Assigned(ASender), True);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraRAR_ARCHIVO.SetFormulario(const Value: TFormulario);
begin
  if FFormulario <> Value then
  begin
    FFormulario := Value;
    pcFormulario.ActivePageIndex := FormularioToPageIndex(FFormulario);
    fraEstablecimiento.Visible   := FFormulario = ftCuitEstableci;
    pcFormulario.Refresh;
  //  pcFormulario.ActivePageIndex := 7;
{    if CanFocus Then
      pcFormulario.ActivePage.SetFocus;}
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraRAR_ARCHIVO.SetValue(const Value: TTableID);
var
  sTabla,
  sPrefijo: string;
  Sql: TSql;
begin
  if VarIsNull(cmbTipoArchivo.KeyValue) then
    raise Exception.Create('Error Interno: Debe asignar el tipo antes del valor');

  sTabla := sdqDatos.FieldByName('TA_TABLA').AsString;
  if (sTabla = '') Then
    raise Exception.Create('El tipo de archivo no tiene definido la tabla de datos');

  sPrefijo := Copy(sTabla, 2, 2);

  Sql := TSql.Create(sTabla);
  try
    if not (Formulario in [ftNumero, ftJuicio]) Then
    begin
      Sql.PrimaryKey.Add(sPrefijo + '_IDARCHIVO', Value);
      Sql.PrimaryKey.Add(sPrefijo + '_TIPOARCHIVO', cmbTipoArchivo.KeyValue, dtNumber);
    end;
    
    case Formulario of
      ftCuit:
        Sql.Fields.Add(sPrefijo + '_CUIT', exNull);
      ftSiniestro:
      begin
        Sql.Fields.Add(sPrefijo + '_SINIESTRO', exNull);
        Sql.Fields.Add(sPrefijo + '_ORDEN', exNull);
      end;
      ftTipoNumero:
      begin
        Sql.Fields.Add(sPrefijo + '_CARPETA_TIPOS', exNull);
        Sql.Fields.Add(sPrefijo + '_CARPETA_NUMERO', exNull);
      end;
      ftNumero:
        Sql.Fields.Add(sPrefijo + '_NUMERO', exNull);
      ftJuicio:
        Sql.Fields.Add(sPrefijo + '_NROJUICIO', exNull);
      ftCuitEstableci:
      begin
        Sql.Fields.Add(sPrefijo + '_CUIT', exNull);
        Sql.Fields.Add(sPrefijo + '_ESTABLECI', exNull);
      end;
      ftBiblioratoNota:
      begin
        Sql.Fields.Add(sPrefijo + '_BIBLIORATO', exNull);
        Sql.Fields.Add(sPrefijo + '_NOTA', exNull);
      end;
    end;
    { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
    Sql.SelectOptions := [soPrimaryKeyAsWhere]; 
    with GetQuery(Sql.SelectSql) do
      try
        if IsEmpty Then
          ClearData
        else
        begin
          case Formulario of
            ftCuit:
              fraEmpresa.CUIT := FieldByName(sPrefijo + '_CUIT').AsString;
            ftSiniestro:
            begin
              edSiniestro.Siniestro := FieldByName(sPrefijo + '_SINIESTRO').AsInteger;
              edSiniestro.Orden     := FieldByName(sPrefijo + '_ORDEN').AsInteger;
            end;
            ftTipoNumero:
            begin
              fraTipNumTipo.Codigo := FieldByName(sPrefijo + '_CARPETA_TIPOS').AsString;
              edTipNumNumero.Value := FieldByName(sPrefijo + '_CARPETA_NUMERO').AsInteger;
            end;
            ftNumero:
              edNumNumero.Value := FieldByName(sPrefijo + '_NUMERO').AsInteger;
            ftJuicio:
              fraJuicio.Codigo := FieldByName(sPrefijo + '_NROJUICIO').AsString;
            ftCuitEstableci:
            begin
              fraEmpresa.CUIT          := FieldByName(sPrefijo + '_CUIT').AsString;
              fraEstablecimiento.Value :=  FieldByName(sPrefijo + '_ESTABLECI').AsInteger;
            end;
            ftBiblioratoNota:
            begin
              edBibliorato.Text  :=  FieldByName(sPrefijo + '_BIBLIORATO').AsString;
              edNota.Text         :=  FieldByName(sPrefijo + '_NOTA').AsString;
            end;
          end;
        end;
      finally
        Free;
      end;
  finally
    Sql.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraRAR_ARCHIVO.Internal_SetValue(AValue: TTableId; ADoChanges: Boolean = True; AAllwaysCange: Boolean = False);
begin
  if FSoloExistente and (AValue = ART_EMPTY_ID) Then
    begin
      MsgBox('No se ha encontrado una carpeta con los datos ingresados', MB_ICONEXCLAMATION);
      WaitForInput;
  end else
  if AValue <> FValue Then
  begin
    FValue := AValue;

    if ADoChanges Then
      Change;
  end
  else if AAllwaysCange and ADoChanges Then
    Change;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraRAR_ARCHIVO.Validate;
begin
  if cmbTipoArchivo.KeyValue = Null Then
    InvalidExcept(cmbTipoArchivo, 'Debe seleccionar el Tipo de Archivo');

  case Formulario of
    ftCuit:
      if fraEmpresa.IsEmpty Then
        InvalidExcept(fraEmpresa.mskCUIT, 'Debe seleccionar la Empresa');
    ftSiniestro:
      if edSiniestro.IsEmpty Then
        InvalidExcept(edSiniestro, 'Debe seleccionar el Siniestro');
    ftTipoNumero:
    begin
      if fraTipNumTipo.IsEmpty Then
        InvalidExcept(fraTipNumTipo.edCodigo, 'Debe seleccionar el Tipo');

      if edTipNumNumero.Value = 0 then
        InvalidExcept(edTipNumNumero, 'Debe seleccionar el Número');
    end;
    ftNumero:
      if edNumNumero.Value = 0 Then
        InvalidExcept(edNumNumero, 'Debe seleccionar el Número');
    ftJuicio:
      if fraJuicio.IsEmpty Then
        InvalidExcept(fraJuicio.edCodigo, 'Debe seleccionar el Juicio');
    ftCuitEstableci:
    begin
      if fraEmpresa.IsEmpty Then
        InvalidExcept(fraEmpresa.mskCUIT, 'Debe seleccionar la Empresa');

      if fraEstablecimiento.IsEmpty Then
        InvalidExcept(fraEstablecimiento.edCodigo, 'Debe seleccionar el Establecimiento');
    end;
    ftBiblioratoNota:
    begin
      if edBibliorato.isEmpty Then
        InvalidExcept(fraEmpresa.mskCUIT, 'Debe seleccionar la Empresa');
//fixme
//todo arreglar
      if edNota.IsEmpty Then
        InvalidExcept(fraEstablecimiento.edCodigo, 'Debe seleccionar el Establecimiento');
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraRAR_ARCHIVO.ClearData;
begin
  case Formulario of
    ftCuit:
      fraEmpresa.Clear;
    ftSiniestro:
      edSiniestro.Clear;
    ftTipoNumero:
    begin
      fraTipNumTipo.Clear;
      edTipNumNumero.Clear;
    end;
    ftNumero:
      edNumNumero.Clear;
    ftJuicio:
      fraJuicio.Clear;
    ftCuitEstableci:
    begin
      fraEmpresa.Clear;
      fraEstablecimiento.Clear;
    end;
    ftBiblioratoNota:
    begin
      edBibliorato.Clear;
      edNota.Clear;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraRAR_ARCHIVO.WaitForInput;
begin
  ClearData;
  {Esto quedó así porque antes hacía todo junto.. [Modificarlo]}
  case Formulario of
    ftCuit, ftCuitEstableci:
      fraEmpresa.mskCUIT.SetFocus;
    ftSiniestro:
      edSiniestro.SetFocus;
    ftTipoNumero:
      fraTipNumTipo.edCodigo.SetFocus;
    ftNumero:
      edNumNumero.SetFocus;
    ftJuicio:
      fraJuicio.edCodigo.SetFocus;
    ftBiblioratoNota:
      edBibliorato.SetFocus;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraRAR_ARCHIVO.NewRecord;
var
  sTabla,
  sPrefijo: string;
  Sql: TSql;
begin
  if IsSelected Then
    raise Exception.Create('Hay datos seleccionados, no se puede crear el registro');

  if IsDataEmpty Then
    raise Exception.Create('Debe seleccionar alguna carpeta');

  sTabla := sdqDatos.FieldByName('TA_TABLA').AsString;
  if sTabla <> '' Then
  begin
    sPrefijo := Copy(sTabla, 2, 2);

    Sql := TSql.Create(sTabla);
    try
      Sql.PrimaryKey.Add(sPrefijo + '_IDARCHIVO', 'SEQ_' + Copy(sTabla, 1, 3) + '_IDARCHIVO.NEXTVAL', False);
      Sql.PrimaryKey.Add(sPrefijo + '_TIPOARCHIVO', cmbTipoArchivo.KeyValue, dtNumber);
      case Formulario of
        ftCuit:
          Sql.Fields.Add(sPrefijo + '_CUIT', fraEmpresa.Value);
        ftSiniestro:
        begin
          Sql.Fields.Add(sPrefijo + '_SINIESTRO', edSiniestro.Siniestro);
          Sql.Fields.Add(sPrefijo + '_ORDEN', edSiniestro.Orden);
        end;
        ftTipoNumero:
        begin
          Sql.Fields.Add(sPrefijo + '_CARPETA_TIPOS', fraTipNumTipo.Value);
          Sql.Fields.Add(sPrefijo + '_CARPETA_NUMERO', edTipNumNumero.Value);
        end;
        ftNumero:
          Sql.Fields.Add(sPrefijo + '_NUMERO', edNumNumero.Value);
        ftJuicio:
          Sql.Fields.Add(sPrefijo + 'JT_NROJUICIO', fraJuicio.Value);
        ftCuitEstableci:
        begin
          Sql.Fields.Add(sPrefijo + '_CUIT', fraEmpresa.Value);
          Sql.Fields.Add(sPrefijo + '_ESTABLECI', fraEstablecimiento.Value);
        end;
        ftBiblioratoNota:
        begin
          Sql.Fields.Add(sPrefijo + '_BIBLIORATO', edBibliorato.Text);
          Sql.Fields.Add(sPrefijo + '_NOTA', edNota.Text);
        end;
      end;

      Sql.Fields.Add(sPrefijo + '_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add(sPrefijo + '_FECHAALTA', exDateTime);

      EjecutarSql(Sql.InsertSql);
      OnDatosChange(Nil);
    finally
      Sql.Free;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraRAR_ARCHIVO.GetIsDataEmpty: boolean;
begin
  case Formulario of
    ftCuit:
      Result := fraEmpresa.IsEmpty;
    ftSiniestro:
      Result := edSiniestro.IsEmpty;
    ftTipoNumero:
      Result := fraTipNumTipo.IsEmpty or (edTipNumNumero.Value = 0);
    ftNumero:
      Result := edNumNumero.Value = 0;
    ftJuicio:
      Result := fraJuicio.IsEmpty;
    ftCuitEstableci:
      Result := fraEmpresa.IsEmpty or fraEstablecimiento.IsEmpty;
    ftBiblioratoNota:
      Result := edBibliorato.IsEmpty or edNota.IsEmpty;
  else
    Result := True;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraRAR_ARCHIVO.GetIsDataSelected: boolean;
begin
  Result := not GetIsDataEmpty;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraRAR_ARCHIVO.GetIsAdministrator: boolean;
begin
  Result := not sdqDatos.FieldByName('AU_USUARIO').IsNull;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraRAR_ARCHIVO.IsValid: boolean;
begin
  try
    Validate;
    Result := True;
  except
    on E: Exception do
    begin
      InvalidMsg(nil, E.Message);
      Result := False;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraRAR_ARCHIVO.Clear;
begin
  cmbTipoArchivo.KeyValue := IdTipoArchivo; 
  ClearData;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraRAR_ARCHIVO.GetValueOrNew: TTableId;
begin
  Result := GetValue;
  if (Result = ART_EMPTY_ID) and IsDataSelected Then
  begin
    NewRecord;
    Result := GetValue;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraRAR_ARCHIVO.cmbTipoArchivoValueChange(Sender: TObject);
begin
  if not VarIsNull(cmbTipoArchivo.KeyValue) Then
    IdTipoArchivo := cmbTipoArchivo.KeyValue;

  Formulario := StrToFormulario(sdqDatos.FieldByName('TA_FORMULARIO').AsString);

  if (not (csLoading in ComponentState)) and Visible and CanFocus Then
    WaitForInput;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraRAR_ARCHIVO.OnfraEmpresaChange(Sender: TObject);
begin
  if Formulario = ftCuit Then
    OnDatosChange(Sender)
  else
    fraEstablecimiento.IdEmpresa := fraEmpresa.Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
