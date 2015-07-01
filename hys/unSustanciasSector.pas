unit unSustanciasSector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, Mask, ToolEdit, CurrEdit, unFraCodDesc,
  StdCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, Buttons,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TTipoABM = (taDifenilos, taAccMayores);

  TfrmSustanciasSector = class(TfrmCustomGridABM)
    Bevel1: TBevel;
    lblOtrosModoEmpleo: TLabel;
    Label2: TLabel;
    lblNombreComercial: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    sbMantSectores: TSpeedButton;
    edOtrosModosEmpleo: TMemo;
    fraSectores: TfraCodigoDescripcion;
    edNombreComercial: TEdit;
    gbModoEmpleo: TGroupBox;
    chkMatPrima: TCheckBox;
    chkAlmacenamiento: TCheckBox;
    chkOtros: TCheckBox;
    chkfluidodie: TCheckBox;
    chkFluidoHidra: TCheckBox;
    fraProdSector: TfraCodigoDescripcion;
    edCantidad: TRxCalcEdit;
    tbInformarFaltanteSustancia: TToolButton;
    redOtrosModos: TRichEdit;
    lblModosdeEmpleoBottom: TLabel;
    pnlLabelUbicacion: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure fraProdSectorcmbDescripcionChange(Sender: TObject);
    procedure sbMantSectoresClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbInformarFaltanteSustanciaClick(Sender: TObject);
  private
    FTipoAbm: TTipoABM;
    FIDInforme :Integer;
    procedure setIDInforme(Value : Integer);
    function ModosEmpleo: Integer;
    procedure setTipoAbm(const Value: TTipoABM);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    property TipoAbm: TTipoABM read FTipoAbm write setTipoAbm;
    property IDInforme : Integer read FIDInforme write setIDInforme;
  end;

var
  frmSustanciasSector: TfrmSustanciasSector;

implementation

uses unSesion, sqlFuncs, unDmPrincipal, CustomDlgs, Strfuncs,
  unCustomConsulta, AnsiSQL, unManSectores, General, unComunesFet;

{$R *.dfm}

procedure TfrmSustanciasSector.FormCreate(Sender: TObject);
begin
  inherited;
  with fraProdSector do
  begin
    ShowBajas := true;
    TableName   := 'PRG_RIESGOS';
    FieldID     := 'RG_ID';
    FieldCodigo := 'RG_ESOP || rg_sufijoesop';
    FieldDesc   := 'RG_DESCRIPCION';
    FieldBaja   := 'rg_fechabaja';
    Showbajas   := true;
end;
  with fraSectores do
  begin
    TableName      := 'hys.pce_cansector';
    FieldID        := 'ce_id';
    FieldCodigo    := 'ce_id';
    FieldDesc      := 'ce_descripcion';
    FieldBaja      := 'ce_fechabaja';
    IDType         := ctInteger;
  end;

  FieldBaja := 'SS_FECHABAJA';
  Sql.TableName := 'HYS.HSS_SUSTANCIASECTOR';
  sdqConsulta.ParamByName('IDInforme').AsInteger := 0;
end;

procedure TfrmSustanciasSector.setIDInforme(Value: Integer);
begin
  FIDInforme := Value;
  sdqConsulta.close;
  sdqConsulta.ParamByName('IDINFORME').AsInteger := Value;
  sdqConsulta.Open;
end;

procedure TfrmSustanciasSector.ClearControls;
begin
  fraProdSector.Clear;
  if (FTipoAbm = taDifenilos) then fraProdSector.SelectFirst;
  edNombreComercial.Clear;
  chkfluidodie.Checked := False;
  chkFluidoHidra.Checked := False;
  chkMatPrima.Checked := False;
  chkAlmacenamiento.Checked := False;
  chkOtros.Checked := False;
  edOtrosModosEmpleo.Clear;
  fraSectores.Clear;
  edCantidad.Clear;
end;

function TfrmSustanciasSector.ModosEmpleo : Integer;
begin
  result := 0;
  if chkfluidodie.Checked then
    result := 1
  else if chkFluidoHidra.Checked then
    result := 2
  else if chkMatPrima.Checked then
    result := 3
  else if chkAlmacenamiento.Checked then
    result := 4
  else if chkOtros.Checked then
    result := 5;
end;

function TfrmSustanciasSector.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('SS_ID').AsInteger;
      Sql.Fields.Add('SS_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('SS_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('SS_CODIGOQUIMICO', fraProdSector.Value);
      Sql.Fields.Add('SS_NOMBRECOMERCIAL', edNombreComercial.Text);
      if gbModoEmpleo.Visible then
        Sql.Fields.Add('SS_MODOSDEEMPLEO', ModosEmpleo);
      Sql.Fields.Add('SS_OTRASFORMAS', edOtrosModosEmpleo.Text);
      Sql.Fields.Add('SS_SECTOR', fraSectores.Codigo);
      Sql.Fields.Add('SS_CANTLITROS', edCantidad.Text);
      Sql.Fields.Add('SS_IDINFORME', IDInforme);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HSS_ID');
        Sql.Fields.Add('SS_USUALTA', Sesion.UserID );
        Sql.Fields.Add('SS_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('SS_ID').AsInteger;
        Sql.Fields.Add('SS_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('SS_FECHAMODIF', exDateTime );
        Sql.Fields.Add('SS_USUBAJA', exNull );
        Sql.Fields.Add('SS_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('SS_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       ErrorMsg(E, 'Error al guardar Sustancia por Sector.');
    end;
  end;
end;


procedure TfrmSustanciasSector.LoadControls;
begin
  inherited;
  ClearControls;
  fraProdSector.Value := sdqConsulta.FieldByName('SS_CODIGOQUIMICO').AsInteger;
  edNombreComercial.Text := sdqConsulta.FieldByName('SS_NOMBRECOMERCIAL').AsString;
  if sdqConsulta.FieldByName('SS_MODOSDEEMPLEO').AsInteger = 1 then
    chkfluidodie.Checked := True
  else if sdqConsulta.FieldByName('SS_MODOSDEEMPLEO').AsInteger = 2 then
    chkFluidoHidra.Checked := True
  else if sdqConsulta.FieldByName('SS_MODOSDEEMPLEO').AsInteger = 3 then
    chkMatPrima.Checked := True
  else if sdqConsulta.FieldByName('SS_MODOSDEEMPLEO').AsInteger = 4 then
    chkAlmacenamiento.Checked := True
  else if sdqConsulta.FieldByName('SS_MODOSDEEMPLEO').AsInteger = 5 then
    chkOtros.Checked := True;
  edOtrosModosEmpleo.Text := sdqConsulta.FieldByName('SS_OTRASFORMAS').AsString;
  fraSectores.Codigo := sdqConsulta.FieldByName('SS_SECTOR').AsString;
  edCantidad.Text := sdqConsulta.FieldByName('SS_CANTLITROS').AsString;
end;

function TfrmSustanciasSector.Validar : Boolean;
begin
  Result := True;
  Verificar(not fraProdSector.IsSelected,fraProdSector, 'Debe especificar el Nombre Quimico.');
  Verificar(edNombreComercial.Visible and IsEmptyString(edNombreComercial.Text),edNombreComercial, 'Debe completar el Nombre Comercial.');
  Verificar(gbModoEmpleo.Visible and not chkfluidodie.Checked and not chkFluidoHidra.Checked and not chkMatPrima.Checked and
             not chkAlmacenamiento.Checked and not chkOtros.Checked, chkfluidodie, 'Debe seleccionar un tipo de modo de empleo.');
  Verificar(edOtrosModosEmpleo.Visible and IsEmptyString(edOtrosModosEmpleo.Text),edOtrosModosEmpleo, 'Debe especificar otros modos de empleo.');
  Verificar( not fraSectores.IsSelected,fraSectores, 'Debe completar Sector.');
  Verificar( IsEmptyString(edCantidad.Text),edCantidad, 'Debe completar la cantidad.');
end;


procedure TfrmSustanciasSector.fraProdSectorcmbDescripcionChange(
  Sender: TObject);
begin
  edNombreComercial.Text := fraProdSector.Descripcion;
end;

procedure TfrmSustanciasSector.sbMantSectoresClick(Sender: TObject);
begin
  Abrir(TfrmManSectores, frmManSectores, tmvModal, nil);
end;

procedure TfrmSustanciasSector.setTipoAbm(const Value: TTipoABM);
begin
  FTipoAbm := Value;
  if FTipoAbm = taAccMayores then
  begin
    lblNombreComercial.Visible := false;
    edNombreComercial.Visible := false;
    gbModoEmpleo.Visible := false;
    lblOtrosModoEmpleo.Visible := false;
    edOtrosModosEmpleo.Visible := false;
    lblModosdeEmpleoBottom.Visible := false;
    redOtrosModos.Visible := false;
    Bevel1.Visible := false;
    pnlLabelUbicacion.Caption := '     (13)';
    fpAbm.Height := 119;
    fraProdSector.ExtraCondition := ' AND RG_ACCMAYORES = ''S''';
    fraProdSector.ExtraFields := ', RG_CANTACCMAYORES ';
  end
  else
    fraProdSector.ExtraCondition := ' AND RG_CODIGO = ''105-C''';
end;

procedure TfrmSustanciasSector.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  redOtrosModos.Lines.Clear;
  redOtrosModos.Lines.Add(Trim(DataSet.FieldByName('SS_OTRASFORMAS').AsString));
end;

procedure TfrmSustanciasSector.tbInformarFaltanteSustanciaClick(
  Sender: TObject);
var
  Cuit : String;
  IdEstableci : Integer;
  NroInforme : Integer;
  tipoInforme : String;
begin
  with GetQuery(
    ' SELECT in_nroinforme, in_cuit, in_idestableci,in_tipoinforme '+
    '   FROM hys.hin_informe '+
    '  WHERE in_id = '+SqlValue(IDInforme)) do
  try
    Cuit := FieldByName('in_cuit').AsString;
    IdEstableci := FieldByName('in_idestableci').AsInteger;
    NroInforme := FieldByName('in_nroinforme').AsInteger;
    if FieldByName('in_tipoinforme').AsString = 'A' then
      tipoInforme := 'Accidentes Mayores'
    else
      tipoInforme := 'Difenilos';
  finally
    Free;
  end;

  DenunciaDatosIncompletos(Cuit,IdEstableci,NroInforme,'Sustancias por Sector',tipoInforme);
end;

end.
