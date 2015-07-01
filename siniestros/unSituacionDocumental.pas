unit unSituacionDocumental;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, JvExControls, JvComponent,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraCodDesc, unFraRTD_TIPODOCUMENTO, Mask, unFraSDA_DETALLEARCHIVO,
  RxToolEdit, RxPlacemnt;

type
  TfrmSituacionDocumental = class(TfrmCustomGridABM)
    pnlBottom: TPanel;
    sdqConsultaDO_OBLIGADO: TStringField;
    sdqConsultaDO_CODIGO: TStringField;
    sdqConsultaTD_DESCRIPCION: TStringField;
    sdqConsultaDO_MARCARE: TStringField;
    sdqConsultaDO_RECIENVI: TDateTimeField;
    sdqConsultaDO_RECLAM1: TDateTimeField;
    sdqConsultaDO_RECLAM2: TDateTimeField;
    fraDO_CODIGO: TfraRTD_TIPODOCUMENTO;
    Label1: TLabel;
    rgDO_MARCARE: TRadioGroup;
    edDO_RECIENVI: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edDO_RECLAM1: TDateEdit;
    edDO_RECLAM2: TDateEdit;
    sdqConsultaENVIADORECIBIDO: TFloatField;
    btnSalir: TButton;
    btnAlta: TButton;
    btnModificacion: TButton;
    btnBaja: TButton;
    fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO;
    ShortCutControlDuplicated: TShortCutControl;
    lbTitulo: TLabel;
    lbSubtitulo: TLabel;
    lbLiquidaciones: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    SQLBase: string;
    FMostrandoImagen: Boolean;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
    function  DoABM: Boolean; override;

    procedure RefreshData; override;
  public
    IDExpediente: integer;
    property MostrandoImagen: Boolean read FMostrandoImagen write FMostrandoImagen;  
  end;

var
  frmSituacionDocumental: TfrmSituacionDocumental;

implementation

uses
  unCustomConsulta, unDmPrincipal, CustomDlgs, DateTimeFuncs, General, SqlFuncs,
  AnsiSql, unSesion, VCLExtra;

{$R *.dfm}

procedure TfrmSituacionDocumental.RefreshData;
begin
  sdqConsulta.SQL.Text := SQLBase + SortDialog.OrderBy;
  sdqConsulta.Params[0].AsInteger := IDExpediente;
  inherited;
  if Grid.CanFocus then
    Grid.SetFocus;

  if ExisteSQLEx('SELECT 1 ' +
                   'FROM SLE_LIQUIEMPSIN, ART.SEX_EXPEDIENTES ' +
                  'WHERE LE_SINIESTRO = EX_SINIESTRO ' +
                    'AND LE_ORDEN     = EX_ORDEN ' +
                    'AND LE_RECAIDA   = EX_RECAIDA ' +
                    'AND EX_ID        = :ID ' +
                    'AND NVL(LE_ESTADO, '' '') IN (''E'',''P'',''C'',''V'') ' +
                    'AND LE_IMPORPERI > 0', [IDExpediente]) then
    lbLiquidaciones.Caption := 'Existen liquidaciones de ILT/ILP';

  if ExisteSQLEx('SELECT 1 ' +
                   'FROM SPR_PAGOEXPESIN2, ART.SEX_EXPEDIENTES ' +
                  'WHERE PR_SINIESTRO = EX_SINIESTRO ' +
                    'AND PR_ORDEN     = EX_ORDEN ' +
                    'AND PR_RECAIDA   = EX_RECAIDA ' +
                    'AND EX_ID        = :ID ' +
                    'AND PR_ESTADO IN (''E'',''C'') ' +
                    'AND PR_IMPORPAGO > 0', [IDExpediente]) then
    if lbLiquidaciones.Caption = '' then
      lbLiquidaciones.Caption := 'Existen liquidaciones de Otros Conceptos'
    else
      lbLiquidaciones.Caption := lbLiquidaciones.Caption + '/Otros Conceptos';

  if ExisteSQLEx('SELECT 1 ' +
                   'FROM SIV_ITEMVOLANTE, ART.SEX_EXPEDIENTES ' +
                  'WHERE IV_SINIESTRO = EX_SINIESTRO ' +
                    'AND IV_ORDEN     = EX_ORDEN ' +
                    'AND IV_RECAIDA   = EX_RECAIDA ' +
                    'AND EX_ID        = :ID ' +
                    'AND IV_ESTADO IN (''X'',''Z'')', [IDExpediente]) then
    if lbLiquidaciones.Caption = '' then
      lbLiquidaciones.Caption := 'Existen liquidaciones de Prestaciones Médicas'
    else
      lbLiquidaciones.Caption := lbLiquidaciones.Caption + '/Prestaciones Médicas';
end;

procedure TfrmSituacionDocumental.FormCreate(Sender: TObject);
begin
  inherited;
  SQLBase := sdqConsulta.SQL.Text;
  lbLiquidaciones.Caption := '';
  Sql.TableName := 'ART.SDO_DOCUEXPESIN';
end;

procedure TfrmSituacionDocumental.ClearControls;
begin
  rgDO_MARCARE.ItemIndex := 1;
  edDO_RECIENVI.Clear;
  edDO_RECLAM1.Clear;
  edDO_RECLAM2.Clear;
  fraDO_CODIGO.Clear;
  fraDO_CODIGO.Propiedades.ExtraCondition :=  ' AND TD_SECTOR = ''ARCHSIN'' ' +
                                              ' AND TD_AUTOMATICO = ''N'' ' +
                                              ' AND NOT EXISTS (SELECT 1 ' +
                                                                 'FROM ART.SDO_DOCUEXPESIN ' +
                                                                'WHERE DO_IDEXPEDIENTE = ' + SQLValue(IDExpediente) +
                                                                 ' AND TD_CODIGO = DO_CODIGO) ';
  VCLExtra.LockControls([fraDO_CODIGO, rgDO_MARCARE], False);
  VCLExtra.LockControls([rgDO_MARCARE], True);  
end;

function TfrmSituacionDocumental.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('DO_CODIGO', sdqConsulta.FieldByName('DO_CODIGO').AsString);
    Sql.SqlType := stDelete;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('DO_CODIGO', fraDO_CODIGO.Codigo);
      Sql.SqlType := stInsert;
    end else
    begin // maModificacion
      Sql.PrimaryKey.Add('DO_CODIGO', sdqConsulta.FieldByName('DO_CODIGO').AsString);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('DO_OBLIGADO', 'N');
    Sql.Fields.Add('DO_MARCARE', string(IIF(rgDO_MARCARE.ItemIndex = 0, 'E', 'R')));

    Sql.Fields.Add('DO_RECIENVI', edDO_RECIENVI.Date);

    if edDO_RECLAM1.Date <> 0 then
      Sql.Fields.Add('DO_RECLAM1', edDO_RECLAM1.Date)
    else
      Sql.Fields.AddExpression('DO_RECLAM1', SQL_NULL);

    if edDO_RECLAM2.Date <> 0 then
      Sql.Fields.Add('DO_RECLAM2', edDO_RECLAM2.Date)
    else
      Sql.Fields.AddExpression('DO_RECLAM2', SQL_NULL);
  end;

  Sql.PrimaryKey.Add('DO_IDEXPEDIENTE', IDExpediente);
  Result := inherited DoABM;

  if Result and (ModoABM <> maBaja) then
  begin
    try
      EjecutarStoreEx('ART.SINIESTRO.DO_ACTUALIZAR_ARCHIVO(:IDEXPEDIENTE, :OPCION, :HOJAS, :USUALTA, :CODIGO, NULL);', [IDExpediente, fraSDA_DETALLEARCHIVO.Opcion, fraSDA_DETALLEARCHIVO.Hojas, Sesion.UserID, fraDO_CODIGO.Codigo]);
    except
    end;
    
    EjecutarStoreEx('DECLARE ' +
                      'nSINIESTRO SEX_EXPEDIENTES.EX_SINIESTRO%TYPE; ' +
                      'nORDEN     SEX_EXPEDIENTES.EX_ORDEN%TYPE; ' +
                      'nRECAIDA   SEX_EXPEDIENTES.EX_RECAIDA%TYPE; ' +                      
                    'BEGIN ' +
                      'SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA ' +
                        'INTO nSINIESTRO, nORDEN, nRECAIDA ' +
                        'FROM SEX_EXPEDIENTES ' +
                       'WHERE EX_ID = :ID; ' +
                      'ART.SINIESTRO.DO_ACTUALIZAR_DOCUMENTO(nSINIESTRO, nORDEN, nRECAIDA, :DOCUMENTO, :FECHA); ' +
                    'END;', [IDExpediente, fraDO_CODIGO.Codigo, TDateTimeEx.Create(edDO_RECIENVI.Date)]);
  end;
end;

procedure TfrmSituacionDocumental.LoadControls;
begin
  with sdqConsulta do
  begin
    fraDO_CODIGO.Propiedades.ExtraCondition := ' AND (TD_SECTOR = ''ARCHSIN'' OR TD_SECTOR = ''MUTUAL'') ';
    rgDO_MARCARE.ItemIndex := FieldByName('ENVIADORECIBIDO').AsInteger;
    edDO_RECIENVI.Date     := FieldByName('DO_RECIENVI').AsDateTime;
    edDO_RECLAM1.Date      := FieldByName('DO_RECLAM1').AsDateTime;
    edDO_RECLAM2.Date      := FieldByName('DO_RECLAM2').AsDateTime;
    fraDO_CODIGO.Codigo    := FieldByName('DO_CODIGO').AsString;
    VCLExtra.LockControls([fraDO_CODIGO, rgDO_MARCARE], True);
  end;
end;

function TfrmSituacionDocumental.Validar: Boolean;
var
  dFechaAcc: TDateTime;
begin
  Verificar(fraDO_CODIGO.IsEmpty, fraDO_CODIGO.edCodigo, 'Debe completar el tipo de documento.');
  Verificar(edDO_RECIENVI.Date = 0, edDO_RECIENVI, 'Debe completar la fecha de envío o recepción del documento.');
  Verificar(edDO_RECIENVI.Date > DBDate, edDO_RECIENVI, 'La fecha de envío o recepción del documento no puede ser posterior a hoy.');
  dFechaAcc := ValorSQLDateTimeEx('SELECT EX_FECHAACCIDENTE FROM SEX_EXPEDIENTES WHERE EX_ID = :ID', [IDExpediente]);
  Verificar(edDO_RECIENVI.Date < dFechaAcc, edDO_RECIENVI, Format('La fecha de envío o recepción del documento no puede ser anterior a la fecha del accidente %s.', [DateToStr(dFechaAcc)]));
  Verificar((edDO_RECLAM1.Date = 0) and (edDO_RECLAM2.Date <> 0), edDO_RECLAM1, 'No se puede indicar la fecha del 2do reclamo antes de colocar la fecha del 1er reclamo.');
  fraSDA_DETALLEARCHIVO.Validate;
  Verificar((ModoABM = maAlta) and (fraSDA_DETALLEARCHIVO.Opcion = 'S') and not MostrandoImagen, fraSDA_DETALLEARCHIVO.cmbDA_OPCION, 'No se puede seleccionar la opción sin papel cuando se da de alta el documento.');
  Result := True;
end;

procedure TfrmSituacionDocumental.fpAbmShow(Sender: TObject);
begin
  inherited;
  fraSDA_DETALLEARCHIVO.Clear;
end;

procedure TfrmSituacionDocumental.tbModificarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, btnModificacion, 'Debe seleccionar un documento para modificarlo.');
  Verificar(sdqConsultaDO_OBLIGADO.AsString = 'S', btnModificacion, 'No se puede modificar un documento obligatorio.');
  inherited;
end;

procedure TfrmSituacionDocumental.tbEliminarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, btnBaja, 'Debe seleccionar un documento para darlo de baja.');
  Verificar(sdqConsultaDO_OBLIGADO.AsString = 'S', btnBaja, 'No se puede dar de baja un documento obligatorio.');
  inherited;
end;

procedure TfrmSituacionDocumental.btnCancelarClick(Sender: TObject);
begin
  ClearControls;
  fpABM.ModalResult := mrCancel;
end;

end.
