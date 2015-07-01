unit unHistoricoEstablecimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, QueryToFile, ExportDialog, artSeguridad,
  QueryPrint, ShortCutControl, Db, SDEngine, unFraEstablecimiento, StdCtrls, ExtCtrls, FormPanel, unFraDomicilio,
  PatternEdit, CurrEdit, IntEdit, unArtFrame, unFraCodigoDescripcion, unFraActividad, Mask, ToolEdit, DateComboBox,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtDBAwareFrame;

type
  TfrmHistoricoEstablecimiento = class(TForm)
    tlbControl: TToolBar;
    tlbImprimir: TToolButton;
    tbExportar: TToolButton;
    ToolButton5: TToolButton;
    tlbSalir: TToolButton;
    ArtDBGrid: TArtDBGrid;
    grbIdentifica: TGroupBox;
    lbNombre: TLabel;
    lbAlta: TLabel;
    Label1: TLabel;
    lbActividad: TLabel;
    lbCantEmpleados: TLabel;
    lbMasaSalarial: TLabel;
    lbNivel: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    edES_NOMBRE: TEdit;
    edES_FEINICACTIV: TDateComboBox;
    edES_FECHAINICEST: TDateComboBox;
    fraES_ACTIVIDAD: TfraActividad;
    edES_EMPLEADOS: TIntEdit;
    edES_MASA: TCurrencyEdit;
    edES_NIVEL: TPatternEdit;
    edES_OBSERVACIONES: TMemo;
    grbSolicitud: TGroupBox;
    edES_FORMULARIO: TIntEdit;
    cbES_EVENTUAL: TCheckBox;
    edES_FECHARECEPCIONBAJA: TDateComboBox;
    grbDomicilio: TGroupBox;
    lbCAFaxPostal: TLabel;
    lbFaxPostal: TLabel;
    Label3: TLabel;
    edES_CODAREAFAX: TPatternEdit;
    edES_FAX: TPatternEdit;
    edES_DOMICILIO: TEdit;
    fraDomicilio: TfraDomicilio;
    sdqDatos: TSDQuery;
    sdDatos: TDataSource;
    ShortCutControl: TShortCutControl;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    Seguridad: TSeguridad;
    ExportDialog: TExportDialog;
    Label4: TLabel;
    edTelefonos: TEdit;
    Label6: TLabel;
    dcbFechaBajaReal: TDateComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edDescripcionActividad: TEdit;
    edSuperficie: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure tlbImprimirClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ArtDBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FContrato: Integer;

    procedure SeleccionEstablecimiento;
  public
    procedure CargarDatos(const aContrato, aNroEstablecimiento: Integer);
  end;

var
  frmHistoricoEstablecimiento: TfrmHistoricoEstablecimiento;

implementation

uses
  General, AnsiSql, unDmPrincipal;

{$R *.DFM}

procedure TfrmHistoricoEstablecimiento.CargarDatos(const aContrato, aNroEstablecimiento: Integer);
begin
  FContrato := aContrato;

  sdqDatos.ParamByName('contrato').AsInteger := aContrato;
  sdqDatos.ParamByName('nroestablecimiento').AsInteger := aNroEstablecimiento;
  sdqDatos.Open;

  ShowModal;
end;

procedure TfrmHistoricoEstablecimiento.SeleccionEstablecimiento;
begin
  if not Visible then
    Exit;

  with sdqDatos do
  begin
    // Grupo Identificación del Establecimiento
    edES_NOMBRE.Text             := FieldByName('he_nombre').AsString;
    fraES_ACTIVIDAD.Value        := FieldByName('he_idactividad').AsInteger;
    edES_NIVEL.Text              := FieldByName('he_nivel').AsString;
    edES_FEINICACTIV.Date        := FieldByName('he_feinicactiv').AsDateTime;
    edES_FECHAINICEST.Date       := FieldByName('he_fechainicest').AsDateTime;
    dcbFechaBajaReal.Date        := FieldByName('he_fechabajareal').AsDateTime;
    edES_FECHARECEPCIONBAJA.Date := FieldByName('he_fecharecepcionbaja').AsDateTime;
    edES_EMPLEADOS.Value         := FieldByName('he_empleados').AsInteger;
    edES_MASA.Value              := FieldByName('he_masa').AsCurrency;
    cbES_EVENTUAL.Checked        := (FieldByName('he_eventual').AsString = 'S');
    edSuperficie.Value           := FieldByName('he_superficie').AsFloat;
    edDescripcionActividad.Text  := FieldByName('he_descripcionactividad').AsString;
    edES_OBSERVACIONES.Text      := FieldByName('he_observaciones').AsString;

    // Grupo Domicilio
    //DIRECCION A LA ANTIGUA...
    fraDomicilio.CodigoPostal := FieldByName('he_cpostal').AsString;
    fraDomicilio.Calle        := FieldByName('he_calle').AsString;
    fraDomicilio.Localidad    := FieldByName('he_localidad').AsString;
    fraDomicilio.Provincia    := FieldByName('pv_descripcion').AsString;
    fraDomicilio.Numero       := IIF((FieldByName('he_numero').AsString <> ''), FieldByName('he_numero').AsString, 'S/N');
    fraDomicilio.Piso         := FieldByName('he_piso').AsString;
    fraDomicilio.Departamento := FieldByName('he_departamento').AsString;
    fraDomicilio.CPA          := FieldByName('he_cpostala').AsString;

    edES_CODAREAFAX.Text := FieldByName('he_codareafax').AsString;
    edTelefonos.Text     := FieldByName('he_telefonos').AsString;
    edES_FAX.Text        := FieldByName('he_fax').AsString;
    edES_DOMICILIO.Text  := FieldByName('he_domicilio').AsString;
  end;
end;


procedure TfrmHistoricoEstablecimiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmHistoricoEstablecimiento := nil;
end;

procedure TfrmHistoricoEstablecimiento.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  SeleccionEstablecimiento;
end;

procedure TfrmHistoricoEstablecimiento.tlbImprimirClick(Sender: TObject);
begin
  try
    if (sdqDatos.Active) and (not sdqDatos.IsEmpty) and (PrintDialog.Execute) then
    begin
      QueryPrint.SubTitle.Lines.Add(Format('Contrato: %d', [FContrato]));
      QueryPrint.SetGridColumns(ArtDBGrid, True, [baDetail, baHeader, baTotal, baSubTotal]);
      QueryPrint.Title.Text := Caption;
      QueryPrint.Print;
    end;
  finally
    QueryPrint.SubTitle.Lines.Clear;
    QueryPrint.Fields.Clear;
  end;
end;

procedure TfrmHistoricoEstablecimiento.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHistoricoEstablecimiento.tbExportarClick(Sender: TObject);
var
  bAutoCols: Boolean;
begin
  if (ArtDBGrid.DataSource.DataSet.Active) and (not ArtDBGrid.DataSource.DataSet.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    try
      bAutoCols := (ExportDialog.Fields.Count = 0);
      try
        if bAutoCols then
          ExportDialog.Fields.Assign(ArtDBGrid.Columns);

        ExportDialog.Execute;
      finally
        if bAutoCols then
          ExportDialog.Fields.Clear;
      end;
    finally
      tbExportar.Enabled := True;
    end;
  end;
end;

procedure TfrmHistoricoEstablecimiento.FormShow(Sender: TObject);
begin
  SeleccionEstablecimiento;
end;

procedure TfrmHistoricoEstablecimiento.ArtDBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                                                               Column: TColumn; State: TGridDrawState);
begin
  if LowerCase(Column.FieldName) = 'he_superficie' then
    with ArtDBGrid do
      if not DataSource.DataSet.FieldByName('he_superficie').IsNull then
      begin
        Canvas.FillRect(Rect);
        Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, DataSource.DataSet.FieldByName('he_superficie').AsString + ' mt2');
      end;
end;

end.
