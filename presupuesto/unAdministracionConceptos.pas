unit unAdministracionConceptos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Mask, PatternEdit, IntEdit;

type
  TfrmAdministracionConceptos = class(TfrmCustomGridABM)
    chkNoMostrarBajas: TCheckBox;
    fraSector: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    fraSectorAltaModif: TfraCodigoDescripcion;
    edConceptoAltaModif: TEdit;
    Label3: TLabel;
    ShortCutControl1: TShortCutControl;
    rgTipoAltaModif: TRadioGroup;
    Label4: TLabel;
    edOrdenAltaModif: TIntEdit;
    Label5: TLabel;
    edNivelAltaModif: TIntEdit;
    rgSignoAltaModif: TRadioGroup;
    Label6: TLabel;
    fraConcSumaEnAltaModif: TfraCodigoDescripcion;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbCuentas: TToolButton;
    tbSemaforos: TToolButton;
    tbIndicadores: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbCuentasClick(Sender: TObject);
    procedure tbSemaforosClick(Sender: TObject);
    procedure tbIndicadoresClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
  public
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmAdministracionConceptos: TfrmAdministracionConceptos;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, unArt,
  VCLExtra, CustomDlgs, unCuentasConcepto, unSemaforosConcepto, unIndicadores;

procedure TfrmAdministracionConceptos.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT OPC.PC_DESCRIPCION CONCEPTO, SC_DESCRIPCION SECTOR, TRUNC(OPC.PC_FECHABAJA) FECHA_BAJA, ' +
                 'SC_ID, OPC.PC_ID ID, OPC.PC_TIPO TIPO, OPC.PC_ORDEN ORDEN, OPC.PC_SUMAEN SUMAEN, ' +
                 'OPC.PC_NIVEL NIVEL, DECODE(OPC.PC_SIGNO, -1, ''Negativo'', ''Positivo'') SIGNO, ' +
                 'OPC.PC_SIGNO, OPCPADRE.PC_DESCRIPCION RUBROPADRE ' +
            'FROM USC_SECTORES, OPC_PRESUPUESTOCONCEPTO OPCPADRE, OPC_PRESUPUESTOCONCEPTO OPC ' +
           'WHERE SC_CODIGO(+) = OPC.PC_SECTOR ' +
             'AND OPC.PC_SUMAEN = OPCPADRE.PC_ID(+)';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND OPC.PC_FECHABAJA IS NULL';

  if fraSector.IsSelected then
    sWhere := sWhere + ' AND OPC.PC_SECTOR = ' + SqlValue(fraSector.Codigo);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmAdministracionConceptos.FormCreate(Sender: TObject);
begin
  inherited;

  with fraSector do
    begin
      TableName   := 'USC_SECTORES';
      FieldID     := 'SC_ID';
      FieldCodigo := 'SC_CODIGO';
      FieldDesc   := 'SC_DESCRIPCION';
      FieldBaja   := 'SC_FECHABAJA';
      ShowBajas   := True;
    end;

  with fraSectorAltaModif do
    begin
      TableName   := 'USC_SECTORES';
      FieldID     := 'SC_ID';
      FieldCodigo := 'SC_CODIGO';
      FieldDesc   := 'SC_DESCRIPCION';
      FieldBaja   := 'SC_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraConcSumaEnAltaModif do
    begin
      TableName      := 'OPC_PRESUPUESTOCONCEPTO';
      FieldID        := 'PC_ID';
      FieldCodigo    := 'PC_ID';
      FieldDesc      := 'PC_DESCRIPCION';
      FieldBaja      := 'PC_FECHABAJA';
      ShowBajas      := False;
      ExtraCondition := ' AND PC_TIPO = ''S''';
    end;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'OPC_PRESUPUESTOCONCEPTO';
end;

procedure TfrmAdministracionConceptos.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraSector.Clear;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmAdministracionConceptos.ClearControls;
begin
  edConceptoAltaModif.Clear;
  fraSectorAltaModif.Clear;
  edOrdenAltaModif.Clear;
  edNivelAltaModif.Clear;
  fraConcSumaEnAltaModif.Clear;
  rgTipoAltaModif.ItemIndex  := -1;
  rgSignoAltaModif.ItemIndex := -1;
end;

function TfrmAdministracionConceptos.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if (ModoABM = maAlta) or (ModoABM = maModificacion) then
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.Add('PC_ID',      GetSecNextVal('SEQ_OPC_ID'));
              Fields.Add('PC_FECHAALTA',   exDateTime);
              Fields.Add('PC_USUALTA',     Sesion.UserID );

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('PC_ID',      sdqConsulta.FieldByName('ID').AsInteger);
              Fields.Add('PC_FECHAMODIF',  exDateTime);
              Fields.Add('PC_USUMODIF',    Sesion.UserID );

              SqlType := stUpdate;
            end;

          Fields.Add('PC_DESCRIPCION', Trim(edConceptoAltaModif.Text));
          Fields.Add('PC_SECTOR',      fraSectorAltaModif.Codigo);

          if fraConcSumaEnAltaModif.IsEmpty then
            Fields.Add('PC_SUMAEN',    exNull)
          else
            Fields.Add('PC_SUMAEN',    fraConcSumaEnAltaModif.Value);

          Fields.Add('PC_NIVEL',       edNivelAltaModif.Value);
          Fields.Add('PC_ORDEN',       edOrdenAltaModif.Value);
          Fields.Add('PC_TIPO',        String(Decode(IntToStr(rgTipoAltaModif.ItemIndex), ['0', '1', '2'], ['C', 'I', 'S'])));
          Fields.Add('PC_SIGNO',       String(Decode(IntToStr(rgSignoAltaModif.ItemIndex), ['0', '1'], ['1', '-1'])));
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('PC_ID',      sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('PC_FECHABAJA',   exDateTime);
          Fields.Add('PC_USUBAJA',     Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

procedure TfrmAdministracionConceptos.LoadControls;
begin
  edConceptoAltaModif.Text     := sdqConsulta.FieldByName('CONCEPTO').AsString;
  fraSectorAltaModif.Value     := sdqConsulta.FieldByName('SC_ID').AsInteger;
  edOrdenAltaModif.Value       := sdqConsulta.FieldByName('ORDEN').AsInteger;
  edNivelAltaModif.Value       := sdqConsulta.FieldByName('NIVEL').AsInteger;
  fraConcSumaEnAltaModif.Value := sdqConsulta.FieldByName('SUMAEN').AsInteger;
  rgSignoAltaModif.ItemIndex   := StrToInt(Decode(sdqConsulta.FieldByName('PC_SIGNO').AsString, ['1', '-1'], ['0', '1']));
  rgTipoAltaModif.ItemIndex    := StrToInt(Decode(sdqConsulta.FieldByName('TIPO').AsString, ['C', 'I', 'S'], ['0', '1', '2']));
end;

function TfrmAdministracionConceptos.Validar: Boolean;
begin
  Verificar(IsEmptyString(edConceptoAltaModif.Text), edConceptoAltaModif, 'El concepto es obligatorio.');
  Verificar(fraSectorAltaModif.IsEmpty, fraSectorAltaModif, 'El sector es obligatorio.');

  if ModoABM = maModificacion then
    Verificar(fraConcSumaEnAltaModif.Value = sdqConsulta.FieldByName('ID').AsInteger, fraConcSumaEnAltaModif, 'El rubro padre no puede ser el concepto actual.');

  Verificar(edOrdenAltaModif.IsEmpty, edOrdenAltaModif, 'El orden es obligatorio.');
  Verificar(rgTipoAltaModif.ItemIndex = -1, rgTipoAltaModif, 'El tipo es obligatorio.');
  Verificar(rgSignoAltaModif.ItemIndex = -1, rgSignoAltaModif, 'El signo es obligatorio.');

  Result := True;
end;

procedure TfrmAdministracionConceptos.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El concepto ya ha sido dado de baja.');

  inherited;
end;

procedure TfrmAdministracionConceptos.tbCuentasClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El concepto ha sido dado de baja.');

  with TfrmCuentasConcepto.Create(nil) do
    try
      IdConcepto := Self.sdqConsulta.FieldByName('ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmAdministracionConceptos.tbSemaforosClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El concepto ha sido dado de baja.');

  with TfrmSemaforosConcepto.Create(nil) do
    try
      IdConcepto := Self.sdqConsulta.FieldByName('ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmAdministracionConceptos.tbIndicadoresClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El concepto ha sido dado de baja.');

  with TfrmIndicadores.Create(nil) do
    try
      IdConcepto := Self.sdqConsulta.FieldByName('ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmAdministracionConceptos.tbModificarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El concepto ha sido dado de baja.'); 

  inherited;
end;

end.


