unit unConsExpuestos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa,
  unFraCodigoDescripcion, unFraEstablecimiento, Mask, ToolEdit,
  DateComboBox, unFraTrabajador, unFraStaticCodigoDescripcion;

type
  TfrmConsExpuestos = class(TfrmCustomConsulta)
    fraRT_CUIT: TfraEmpresa;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Riesgo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    fraRT_CUIL: TfraTrabajador;
    edRT_FECHADesde: TDateComboBox;
    edRT_FECHAHasta: TDateComboBox;
    chkRT_FECHATodas: TCheckBox;
    edRT_FECHAALTADesde: TDateComboBox;
    edRT_FECHAALTAHasta: TDateComboBox;
    fraRT_ESTABLECI: TfraEstablecimiento;
    Label7: TLabel;
    fraRT_RIESGO: TfraStaticCodigoDescripcion;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    procedure OnfraRT_CUITChange(Sender: TObject);
    procedure OnfraRT_ESTABLECIChange(Sender: TObject);
  protected
    procedure ClearData; override;
    procedure RefreshData; override;
  public
  end;

implementation

uses
  AnsiSql, unArt, unPrincipal, unDmPrincipal;

{$R *.DFM}

{ TfrmConsExpuestos }

procedure TfrmConsExpuestos.ClearData;
begin
  fraRT_CUIT.Clear;
  fraRT_ESTABLECI.Clear;
  fraRT_CUIL.Clear;
  fraRT_RIESGO.Clear;
  edRT_FECHADesde.Clear;
  edRT_FECHAHasta.Clear;
  chkRT_FECHATodas.Checked := False;
  edRT_FECHAALTADesde.Clear;
  edRT_FECHAALTAHasta.Clear;

  fraRT_ESTABLECI.IdEmpresa := ART_EMPTY_ID;
  fraRT_CUIL.IdEmpresa := ART_EMPTY_ID;
  fraRT_CUIL.IdEstableci := ART_EMPTY_ID;

  inherited;
end;

procedure TfrmConsExpuestos.OnfraRT_CUITChange(Sender: TObject);
begin
  fraRT_ESTABLECI.IdEmpresa := fraRT_CUIT.Value;
  fraRT_CUIL.IdEmpresa := fraRT_CUIT.Value;
end;

procedure TfrmConsExpuestos.OnfraRT_ESTABLECIChange(Sender: TObject);
begin
  fraRT_CUIL.IdEstableci := fraRT_ESTABLECI.IdEmpresa;
end;

procedure TfrmConsExpuestos.RefreshData;
var
  sSql: string;
begin
  QueryPrint.SubTitle.Lines.Clear;

  sSql := 'SELECT RT_CUIT, EM_NOMBRE, RT_ESTABLECI, RT_FECHA, RT_RIESGO, RG_DESCRIPCION, ' +
                 'RT_CUIL, NVL(RT_NOMBRE, TJ_NOMBRE) NOMBRE, RG_ESOP ' +
            'FROM AEM_EMPRESA, CTJ_TRABAJADOR, PRG_RIESGOS, PRT_RIESTRAB PRT1 ' +
           'WHERE RT_CUIL = TJ_CUIL(+) ' +
             'AND RT_CUIT = EM_CUIT(+) ' +
             'AND RT_RIESGO = RG_CODIGO';

  if fraRT_CUIT.IsSelected Then
  begin
    sSql := sSql + ' AND RT_CUIT = ' + SqlValue(fraRT_CUIT.mskCuit.Text);
    QueryPrint.SubTitle.Lines.Add(Format('CUIT: %s Razón Social: %s', [fraRT_CUIT.mskCuit.Text, fraRT_CUIT.cmbRSocial.Text]));
  end;

  if fraRT_ESTABLECI.IsSelected Then
  begin
    sSql := sSql + ' AND RT_ESTABLECI = ' + SqlValue(fraRT_ESTABLECI.edCodigo.Text);
    QueryPrint.SubTitle.Lines.Add('Establecimiento: ' + fraRT_ESTABLECI.edCodigo.Text);
  end;

  if fraRT_CUIL.IsSelected Then
  begin
    sSql := sSql + ' AND RT_CUIL = ' + SqlValue(fraRT_CUIL.mskCUIL.Text);
    QueryPrint.SubTitle.Lines.Add(Format('CUIL: %s Apellido y Nombre: %s', [fraRT_CUIL.mskCUIL.Text, fraRT_CUIL.cmbNombre.Text]));
  end;

  if fraRT_RIESGO.IsSelected Then
  begin
    sSql := sSql + ' AND TRIM(RG_ESOP || '' '' || RG_SUFIJOESOP) = ' + SqlValue(fraRT_RIESGO.Codigo);
    QueryPrint.SubTitle.Lines.Add(Format('Riesgo: %s %s', [fraRT_RIESGO.Codigo, fraRT_RIESGO.cmbDescripcion.Text]));
  end;

  if (edRT_FECHADesde.Date <> 0) and (edRT_FECHAHasta.Date <> 0) then
  begin
    sSql := sSql + ' AND RT_FECHA BETWEEN ' + edRT_FECHADesde.SqlText + ' AND ' + edRT_FECHAHasta.SqlText + ' ';
    QueryPrint.SubTitle.Lines.Add(Format('Fecha de Relevamiento entre %s %s', [edRT_FECHADesde.Text, edRT_FECHAHasta.Text]));
  end
  else if (edRT_FECHADesde.Date <> 0) then
  begin
    sSql := sSql + ' AND RT_FECHA >= '  + edRT_FECHADesde.SqlText + ' ';
    QueryPrint.SubTitle.Lines.Add('Fecha de Relevamiento mayor o igual a ' + edRT_FECHADesde.Text);

  end
  else if (edRT_FECHAHasta.Date <> 0) then
  begin
    sSql := sSql + ' AND RT_FECHA <= '  + edRT_FECHAHasta.SqlText + ' ';
    QueryPrint.SubTitle.Lines.Add('Fecha de Relevamiento menor o igual a ' + edRT_FECHAHasta.Text);

  end;


  if not chkRT_FECHATodas.Checked then
  begin
    sSql := sSql + ' AND RT_FECHA = (SELECT MAX(RT_FECHA) ' +
                                      'FROM PRT_RIESTRAB PRT2 ' +
                                     'WHERE PRT1.RT_CUIT = PRT2.RT_CUIT ' +
                                       'AND PRT1.RT_ESTABLECI = PRT2.RT_ESTABLECI) ';
    QueryPrint.SubTitle.Lines.Add('Último Relevamiento realizado al Establecimiento');
  end;


  if (edRT_FECHAALTADesde.Date <> 0) and (edRT_FECHAALTAHasta.Date <> 0) then
  begin
    sSql := sSql + ' AND RT_FECHAALTA BETWEEN ' + edRT_FECHAALTADesde.SqlText + ' AND ' + edRT_FECHAALTAHasta.SqlText + ' ';
    QueryPrint.SubTitle.Lines.Add(Format('Fecha de Alta entre %s %s', [edRT_FECHAALTADesde.Text, edRT_FECHAALTAHasta.Text]));
  end
  else if (edRT_FECHAALTADesde.Date <> 0) then
  begin
    sSql := sSql + ' AND RT_FECHAALTA >= '  + edRT_FECHAALTADesde.SqlText + ' ';
    QueryPrint.SubTitle.Lines.Add('Fecha de Alta mayor o igual a ' + edRT_FECHAALTADesde.Text);

  end
  else if (edRT_FECHAALTAHasta.Date <> 0) then
  begin
    sSql := sSql + ' AND RT_FECHAALTA <= '  + edRT_FECHAALTAHasta.SqlText + ' ';
    QueryPrint.SubTitle.Lines.Add('Fecha de Alta menor o igual a ' + edRT_FECHAALTAHasta.Text);

  end;

  sdqConsulta.Sql.Text := sSql + ' ' + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmConsExpuestos.FormCreate(Sender: TObject);
begin
  inherited;
  fraRT_CUIT.OnChange := OnfraRT_CUITChange;
  fraRT_CUIT.ShowBajas := True;
  fraRT_ESTABLECI.OnChange := OnfraRT_ESTABLECIChange;

  with fraRT_RIESGO do
  begin
    TableName := 'PRG_RIESGOS';
    FieldId := '1';
    FieldCodigo := 'TRIM(RG_ESOP || '' '' || RG_SUFIJOESOP)';
    FieldDesc := 'RG_DESCRIPCION';
    FieldBaja := 'RG_FECHABAJA';
  end;
end;


end.
