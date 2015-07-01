unit unListAportesContrib;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, Mask,
  ToolEdit, DateComboBox, QueryToFile, ExportDialog, DB, SDEngine;

type
  TfrmListAportesContrib = class(TfrmCustomForm)
    gbFechaAprobacion: TGroupBox;
    Label1: TLabel;
    edFechaAprobDesde: TDateComboBox;
    edFechaAprobHasta: TDateComboBox;
    btnImprimir: TButton;
    btnCancelar: TButton;
    btnGenerarArchivo: TButton;
    sdqDetalle: TSDQuery;
    btnExportar: TButton;
    ExportDialog: TExportDialog;
    sdqDetalle1: TSDQuery;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGenerarArchivoClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
  private
    function Validar: Boolean;
  public
  end;

var
  frmListAportesContrib: TfrmListAportesContrib;

implementation

uses
  CustomDlgs, unRptAportesContrib, unImpoExpoWizard, Periodo, SqlFuncs;

{$R *.dfm}
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContrib.btnImprimirClick(Sender: TObject);
var
  sSubTituloRango: String;
begin
  if Validar then
  begin
    sSubTituloRango := 'Liquidaciones Aprobadas entre ' + DateToStr(edFechaAprobDesde.Date) + ' y ' +
                                                          DateToStr(edFechaAprobHasta.Date);

    RptAportesContrib := TRptAportesContrib.Create(nil);
    with RptAportesContrib do
    try
      TipoListado    := tlAFJPOS_SUSS;
      SubTitulo      := 'AFJP/OBRA SOCIAL - SUSS';
      SubTituloRango := sSubTituloRango;

      Preparar(edFechaAprobDesde.Date, edFechaAprobHasta.Date);
    finally
      free;
    end;

    RptAportesContrib := TRptAportesContrib.Create(nil);
    with RptAportesContrib do
    try
      TipoListado    := tlAFJP_NOSUSS;
      SubTitulo      := 'AFJP - NO SUSS';
      SubTituloRango := sSubTituloRango;

      Preparar(edFechaAprobDesde.Date, edFechaAprobHasta.Date);
    finally
      free;
    end;

    RptAportesContrib := TRptAportesContrib.Create(nil);
    with RptAportesContrib do
    try
      TipoListado    := tlOS_NOSUSS;
      SubTitulo      := 'OBRA SOCIAL - NO SUSS';
      SubTituloRango := sSubTituloRango;

      Preparar(edFechaAprobDesde.Date, edFechaAprobHasta.Date);
    finally
      free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContrib.btnCancelarClick(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContrib.btnGenerarArchivoClick(Sender: TObject);
begin
  ImpoExpoWizard('APCON');
end;
{-------------------------------------------------------------------------------}
function TfrmListAportesContrib.Validar: Boolean;
begin
  Verificar(edFechaAprobDesde.IsEmpty, edFechaAprobDesde, 'Debe ingresar la fecha de aprobación desde');
  Verificar(edFechaAprobHasta.IsEmpty, edFechaAprobHasta, 'Debe ingresar la fecha de aprobación hasta');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContrib.btnExportarClick(Sender: TObject);
var
  TipoListado: TTiposListado;
  sCond, sSqlDetalle, sOrderBy, sSql: String;
begin
  if Validar then
  begin
    ExportDialog.Title := 'Liquidaciones Aprobadas entre ' + DateToStr(edFechaAprobDesde.Date) + ' y ' +
                                                             DateToStr(edFechaAprobHasta.Date);
    sSql := sdqDetalle1.SQL.Text;

    with sdqDetalle do
    begin
      TipoListado                              := tlAFJPOS_SUSS;
      ParamByName('PeriodoHasta').AsString     := GetPeriodo(edFechaAprobHasta.Date, fpAnioMes);
      ParamByName('FAprobadoDesde').AsDateTime := edFechaAprobDesde.Date;
      ParamByName('FAprobadoHasta').AsDateTime := edFechaAprobHasta.Date;
      ParamByName('TipoListado').AsInteger     := Ord(TipoListado);
      sCond                                    := '(LE_OBRASOCIAL_SUSS = ''S'' OR LE_AFJP_SUSS = ''S'') ';
      sOrderBy                                 := 'CODGRUPO_CONPAGO, NROSINILIQ';
      sSqlDetalle                              := sSql;
      AddCondition(sSqlDetalle, sCond);
      SQL.Text                                 := sSqlDetalle + ' ORDER BY ' + sOrderBy;
      Open;
      if not IsEmpty then
      begin
       ExportDialog.OutputFile                 := 'AFJP-OBRA SOCIAL - SUSS';
       ExportDialog.Execute;
      end;

      Close;
      TipoListado                              := tlAFJP_NOSUSS;
      ParamByName('TipoListado').AsInteger     := Ord(TipoListado);
      sCond                                    := 'LE_AFJP IS NOT NULL AND LE_AFJP_SUSS <> ''S'' ';
      sOrderBy                                 := 'CODGRUPO_AFJP, CODGRUPO_CONPAGO, NROSINILIQ';
      sSqlDetalle                              := sSql;
      AddCondition(sSqlDetalle, sCond);
      SQL.Text                                 := sSqlDetalle + ' ORDER BY ' + sOrderBy;
      Open;
      if not IsEmpty then
      begin
       ExportDialog.OutputFile                 := 'AFJP - NO SUSS';
       ExportDialog.Execute;
      end;

      Close;
      TipoListado                              := tlOS_NOSUSS;
      ParamByName('TipoListado').AsInteger     := Ord(TipoListado);
      sCond                                    := 'LE_OBRASOCIAL_SUSS <> ''S'' ';
      sOrderBy                                 := 'CODGRUPO_OS, CODGRUPO_CONPAGO, NROSINILIQ';
      sSqlDetalle                              := sSql;
      AddCondition(sSqlDetalle, sCond);
      SQL.Text                                 := sSqlDetalle + ' ORDER BY ' + sOrderBy;

      Open;
      if not IsEmpty then
      begin
       ExportDialog.OutputFile                 := 'OS - NO SUSS';
       ExportDialog.Execute;
      end;
      Close;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
end.

