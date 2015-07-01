unit unManConceptos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArt, Mask, PatternEdit;

type
  TfrmManConceptos = class(TfrmCustomGridABM)
    Label1: TLabel;
    edConcepto: TEdit;
    rgSigno: TRadioGroup;
    chkAsignableVendedor: TCheckBox;
    ShortCutControl1: TShortCutControl;
    chkAsignableContrato: TCheckBox;
    chkRequiereContrato: TCheckBox;
    pnlBusqueda: TPanel;
    chkSoloActivos: TCheckBox;
    gbCuenta: TGroupBox;
    rbOtrosGstosProd: TRadioButton;
    rbComisionesPorPrimas: TRadioButton;
    rbDGIGcias: TRadioButton;
    rbHonorariosProf: TRadioButton;
    Label2: TLabel;
    edObservaciones: TMemo;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbExenciones: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
    procedure tbExencionesClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

var
  frmManConceptos: TfrmManConceptos;

implementation

{$R *.dfm}

uses
  unDmPrincipal, unSesion, AnsiSql, CustomDlgs, SqlFuncs, General, StrFuncs, StrUtils,
  VCLExtra, unConceptosExenciones;

procedure TfrmManConceptos.ClearControls;
begin
  edConcepto.Clear;
  rgSigno.ItemIndex := -1;
  chkAsignableVendedor.Checked  := False;
  chkAsignableContrato.Checked  := False;
  chkRequiereContrato.Checked   := False;
  rbOtrosGstosProd.Checked      := False;
  rbComisionesPorPrimas.Checked := False;
  rbDGIGcias.Checked            := False;
  rbHonorariosProf.Checked      := False;
  edObservaciones.Clear;

  VCLExtra.LockControls([rbOtrosGstosProd, rbComisionesPorPrimas, rbDGIGcias, rbHonorariosProf, rgSigno]);
  VCLExtra.LockControls([edConcepto, chkAsignableVendedor, chkAsignableContrato, chkRequiereContrato], False);
end;

procedure TfrmManConceptos.LoadControls;
var
  sCuenta: String;
begin
  with sdqConsulta do
    begin
      edConcepto.Text := FieldByName('CO_DESCRIPCION').AsString;

      sCuenta                       := '(' + FieldByName('CO_CUENTACONTABLE').AsString + ')';
      rbOtrosGstosProd.Checked      := (Instr(rbOtrosGstosProd.Caption, sCuenta) > 0);
      rbComisionesPorPrimas.Checked := (Instr(rbComisionesPorPrimas.Caption, sCuenta) > 0);
      rbDGIGcias.Checked            := (Instr(rbDGIGcias.Caption, sCuenta) > 0);
      rbHonorariosProf.Checked      := (Instr(rbHonorariosProf.Caption, sCuenta) > 0);

      case FieldByName('CO_SIGNO').AsInteger of
        -1: rgSigno.ItemIndex := 0;   // Débito
         1: rgSigno.ItemIndex := 1;   // Crédito
      else
        rgSigno.ItemIndex := -1;
      end;

      chkAsignableVendedor.Checked := (FieldByName('CO_ASIGNABLEVENDEDOR').AsString = 'S');
      chkAsignableContrato.Checked := (FieldByName('CO_ASIGNABLECONTRATO').AsString = 'S');
      chkRequiereContrato.Checked  := (FieldByName('CO_REQUIERECONTRATO').AsString = 'S');
      edObservaciones.Lines.Text   := FieldByName('CO_OBSERVACIONES').AsString;
    end;

  VCLExtra.LockControls([rbOtrosGstosProd, rbComisionesPorPrimas, rbDGIGcias, rbHonorariosProf, rgSigno], False);
  VCLExtra.LockControls([edConcepto, chkAsignableVendedor, chkAsignableContrato, chkRequiereContrato]);
end;

function TfrmManConceptos.DoABM: Boolean;
var
  fId: TTableId;
  iPos1, iPos2, iSigno: Integer;
  sCuenta: String;
begin
  Sql.Clear;
  Sql.TableName := 'XCO_CONCEPTO';

  if ModoABM = maAlta then
    fId := GetSecNextVal('SEQ_XCO_ID')
  else
    fId := sdqConsulta.FieldByName('CO_ID').AsInteger;

  Sql.PrimaryKey.Add('CO_ID',                    fId, False);

  if ModoABM = maBaja then
    begin
      Sql.SqlType := stUpdate;

      Sql.Fields.Add('CO_USUBAJA',               Sesion.UserID);
      Sql.Fields.Add('CO_FECHABAJA',             SQL_DATETIME, False);
    end
  else
    begin
      if ModoABM = maAlta then
        begin
          Sql.Fields.Add('CO_DESCRIPCION',       edConcepto.Text);
          Sql.Fields.Add('CO_ASIGNABLEVENDEDOR', String(Iif(chkAsignableVendedor.Checked, 'S', 'N')));
          Sql.Fields.Add('CO_ASIGNABLECONTRATO', String(Iif(chkAsignableContrato.Checked, 'S', 'N')));
          Sql.Fields.Add('CO_REQUIERECONTRATO',  String(Iif(chkRequiereContrato.Checked, 'S', 'N')));
          Sql.Fields.Add('CO_USUALTA',           Sesion.UserID);
          Sql.Fields.Add('CO_FECHAALTA',         SQL_DATETIME, False);

          Sql.SqlType := stInsert
        end
      else
        begin
          if rbOtrosGstosProd.Checked then
            sCuenta := rbOtrosGstosProd.Caption
          else if rbComisionesPorPrimas.Checked then
            sCuenta := rbComisionesPorPrimas.Caption
          else if rbDGIGcias.Checked then
            sCuenta := rbDGIGcias.Caption
          else if rbHonorariosProf.Checked then
            sCuenta := rbHonorariosProf.Caption
          else
            sCuenta := '';

          if not IsEmptyString(sCuenta) then
            begin
              iPos1   := Instr(sCuenta, '(');
              iPos2   := Instr(sCuenta, ')');
              sCuenta := Midstr(sCuenta, iPos1+1, iPos2-iPos1-1);
            end;

          Sql.Fields.Add('CO_CUENTACONTABLE',    sCuenta);

          case rgSigno.ItemIndex of
            0: iSigno := -1;   // Débito
            1: iSigno := 1;    // Crédito
          else
            iSigno := 0;
          end;
          Sql.Fields.Add('CO_SIGNO',             iSigno, dtNumber);

          Sql.Fields.Add('CO_USUMODIF',          Sesion.UserID);
          Sql.Fields.Add('CO_FECHAMODIF',        SQL_DATETIME, False);

          Sql.SqlType := stUpdate;
        end;

      Sql.Fields.Add('CO_OBSERVACIONES',         Trim(edObservaciones.Lines.Text));
    end;

  Result := inherited DOABM;
end;

function TfrmManConceptos.Validar: Boolean;
begin
  if ModoABM = maAlta then
    begin
      Verificar((edConcepto.Text = ''), edConcepto, 'El Concepto es obligatorio.');
      Verificar(chkAsignableContrato.Checked and chkRequiereContrato.Checked, chkAsignableContrato, 'Asignable Contrato y Requiere Contrato no pueden estar seleccionados a la vez.');
    end
  else if ModoABM = maModificacion then
    begin
      Verificar((chkAsignableVendedor.Checked or chkAsignableContrato.Checked) and not (rbOtrosGstosProd.Checked or rbComisionesPorPrimas.Checked or rbDGIGcias.Checked or rbHonorariosProf.Checked), gbCuenta, 'Debe indicar la Cuenta Contable.');
      Verificar(rgSigno.ItemIndex = -1, rgSigno, 'El campo Signo es obligatorio.');
    end;

  Result := True;
end;

procedure TfrmManConceptos.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'FECHABAJA';
end;

procedure TfrmManConceptos.tbLimpiarClick(Sender: TObject);
begin
  chkSoloActivos.Checked := True;

  inherited;
end;

procedure TfrmManConceptos.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT CO_ID, CO_DESCRIPCION, CO_ASIGNABLEVENDEDOR, CO_ASIGNABLECONTRATO, ' +
                 'TRUNC(CO_FECHABAJA) FECHABAJA, CO_SIGNO, CO_CUENTACONTABLE, ' +
                 'CO_REQUIERECONTRATO, CO_OBSERVACIONES ' +
            'FROM XCO_CONCEPTO ' +
           'WHERE 1 = 1';

  if chkSoloActivos.Checked then
    sWhere := sWhere + ' AND CO_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManConceptos.fpAbmEnter(Sender: TObject);
begin
  if ModoABM = maAlta then
    edConcepto.SetFocus
  else
    gbCuenta.SetFocus;
end;

procedure TfrmManConceptos.tbExencionesClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'La grilla está vacía.');

  with TfrmConceptosExenciones.Create(nil) do
    try
      IdConcepto := Self.sdqConsulta.FieldByName('CO_ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

end.

