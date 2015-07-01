unit unManEmpresasBloqueoILT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, Mask, ToolEdit, DateComboBox;

type
  TfrmManEmpresasBloqueoILT = class(TfrmCustomGridABM)
    fraEmpresaBloqueo: TfraEmpresa;
    gbRangoBloqueoFechas: TGroupBox;
    lbDesde: TLabel;
    lbHasta: TLabel;
    edFBloqueoDesde: TDateComboBox;
    edFBloqueoHasta: TDateComboBox;
    chkBloqueoVigente: TCheckBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override ;
  public
  end;

var
  frmManEmpresasBloqueoILT: TfrmManEmpresasBloqueoILT;

implementation

uses
  General, CustomDlgs, unArt, unSesion, AnsiSql, SqlFuncs, unDmPrincipal;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TfrmManEmpresasBloqueoILT.ClearControls;
begin
  fraEmpresaBloqueo.Clear;
  edFBloqueoDesde.Clear;
  edFBloqueoHasta.Clear;
  chkBloqueoVigente.Checked := True;
end;
{------------------------------------------------------------------------------}
function TfrmManEmpresasBloqueoILT.DoABM: Boolean;
var
  SBIId: TTableId;
begin
  Sql.Clear;
  Sql.TableName := 'SBI_BLOQUEO_ILT';

  SBIId := ART_EMPTY_ID;

  if ModoABM = maBaja then
    begin
      Sql.SqlType := stUpdate;
      SBIId := sdqConsulta.FieldByName('BI_ID').AsInteger;

      Sql.Fields.Add ('BI_USUBAJA',   Sesion.UserID);
      Sql.Fields.Add ('BI_FECHABAJA', SQL_ACTUALDATE, False);
    end
  else
    begin
      if ModoABM = maAlta then
        begin
          Sql.SqlType := stInsert;
          SBIId  := GetSecNextVal('SEQ_SBI_ID');

          Sql.Fields.Add ('BI_USUALTA',   Sesion.UserID);
          Sql.Fields.Add ('BI_FECHAALTA', SQL_ACTUALDATE, False);
        end
      else if ModoABM = maModificacion then
        begin
          Sql.SqlType := stUpdate;
          SBIId  := sdqConsulta.FieldByName('BI_ID').AsInteger;

          Sql.Fields.Add ('BI_USUMODIF',   Sesion.UserID);
          Sql.Fields.Add ('BI_FECHAMODIF', SQL_ACTUALDATE, False);
        end;

      Sql.Fields.Add('BI_CUIT',      fraEmpresaBloqueo.CUIT);
      Sql.Fields.Add('BI_FECHABASE', edFBloqueoDesde.SqlText, False);
      Sql.Fields.Add('BI_FECHATOPE', edFBloqueoHasta.SqlText, False);
      Sql.Fields.Add('BI_VIGENTE',   String(iif(chkBloqueoVigente.Checked, 'S', 'N')));
    end;

  Sql.PrimaryKey.Add('BI_ID', SBIId, False);

  Result := inherited DoABM;
end;
{------------------------------------------------------------------------------}
procedure TfrmManEmpresasBloqueoILT.LoadControls;
begin
  fraEmpresaBloqueo.CUIT    := sdqConsulta.fieldbyname('BI_CUIT').AsString;
  edFBloqueoDesde.Date      := sdqConsulta.fieldbyname('BI_FECHABASE').AsDateTime;
  edFBloqueoHasta.Date      := sdqConsulta.fieldbyname('BI_FECHATOPE').AsDateTime;
  chkBloqueoVigente.Checked := (sdqConsulta.fieldbyname('BI_VIGENTE').AsString = 'S');
end;
{------------------------------------------------------------------------------}
function TfrmManEmpresasBloqueoILT.Validar: Boolean;
var dMaxHasta, dMinDesde: TDateTime;
    bExisteDesdeIgual: boolean;
begin
  Verificar(fraEmpresaBloqueo.IsEmpty, fraEmpresaBloqueo.mskCUIT, 'Debe ingresar una empresa');
  Verificar(edFBloqueoDesde.IsEmpty and edFBloqueoHasta.IsEmpty, edFBloqueoDesde, 'Debe indicar un rango de fechas de bloqueo');

  if ModoABM = maAlta then  // por mail "Validacion"
  begin
    dMaxHasta := ValorSqlDateTimeEx(' SELECT max(bi_fechatope) FHasta ' +
                                      ' FROM SBI_BLOQUEO_ILT ' +
                                     ' WHERE bi_cuit = :cuit ' +
                                       ' AND bi_fechabaja is null ', [fraEmpresaBloqueo.CUIT]);

    dMinDesde := ValorSqlDateTimeEx(' SELECT min(bi_fechabase) FDesde ' +
                                      ' FROM SBI_BLOQUEO_ILT ' +
                                     ' WHERE bi_cuit = :cuit ' +
                                       ' AND bi_fechabaja is null ', [fraEmpresaBloqueo.CUIT]);

    bExisteDesdeIgual := ExisteSqlEx('SELECT 1 FROM SBI_BLOQUEO_ILT ' +
                                     ' WHERE bi_cuit = :cuit ' +
                                       ' AND bi_fechabaja is null ' +
                                       ' AND bi_fechabase = ' + SqlDate(edFBloqueoDesde.Date), [fraEmpresaBloqueo.CUIT]);

    if ( ((edFBloqueoDesde.Date <= dMaxHasta) and (edFBloqueoHasta.Date >= dMinDesde))
          or ((edFBloqueoDesde.Date <= dMaxHasta) and (edFBloqueoHasta.Date = 0))
          or bExisteDesdeIgual ) then
      Verificar( true, fraEmpresaBloqueo.mskCUIT,
                   'La Empresa ya existe en los Bloqueos de ILT y no se pueden solapar las vigencias.' );
  end;
  
  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmManEmpresasBloqueoILT.FormCreate(Sender: TObject);
begin
  fraEmpresaBloqueo.ShowBajas   := True;
  fraEmpresaBloqueo.UltContrato := True;
  FieldBaja := 'BI_FECHABAJA';
  inherited;
end;
{------------------------------------------------------------------------------}
end.

