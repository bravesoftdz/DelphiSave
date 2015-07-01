unit unConceptosExenciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArt, Mask, ToolEdit,
  DateComboBox, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS;

type
  TfrmConceptosExenciones = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    fraEC_IMPUESTO: TfraStaticCTB_TABLAS;
    Label1: TLabel;
    edEC_FECHADESDE: TDateComboBox;
    Label2: TLabel;
    edEC_FECHAHASTA: TDateComboBox;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    FIdConcepto: TTableId;
    procedure SetIdConcepto(const Value: TTableId);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure RefreshData; override;
  public
    property IdConcepto: TTableId    read FIdConcepto   write SetIdConcepto;
  end;

var
  frmConceptosExenciones: TfrmConceptosExenciones;

implementation

uses
  unDmPrincipal, AnsiSql, unSesion, CustomDlgs, SqlFuncs, DateTimeFuncs, VCLExtra,
  General;

{$R *.dfm}

procedure TfrmConceptosExenciones.ClearControls;
begin
  fraEC_IMPUESTO.Clear;
  edEC_FECHADESDE.Clear;
  edEC_FECHAHASTA.Clear;

  VCLExtra.LockControls([fraEC_IMPUESTO, edEC_FECHADESDE], False);
end;

function TfrmConceptosExenciones.DoABM: Boolean;
var
  fId: TTableId;
begin
  with Sql do
    begin
      Clear;
      TableName := 'XEC_EXENCIONCONCEPTO';

      if ModoABM = maAlta then
        fId := GetSecNextVal('COM.SEQ_XEC_ID')
      else
        fId := sdqConsulta.FieldByName('ID').AsInteger;

      PrimaryKey.Add('EC_ID',             fId, False);

      if ModoABM = maBaja then
        begin
          SqlType := stUpdate;

          Fields.Add('EC_USUBAJA',        Sesion.UserID);
          Fields.Add('EC_FECHABAJA',      exDateTime);
        end
      else
        begin
          Fields.Add('EC_IDCONCEPTO',     IdConcepto);
          Fields.Add('EC_IMPUESTO',       fraEC_IMPUESTO.Value);
          Fields.Add('EC_FECHADESDE',     edEC_FECHADESDE.Date);

          if not edEC_FECHAHASTA.IsEmpty then
            Fields.Add('EC_FECHAHASTA',   edEC_FECHAHASTA.Date);

          if ModoABM = maAlta then
            begin
              SqlType := stInsert;

              Fields.Add('EC_USUALTA',    Sesion.UserID);
              Fields.Add('EC_FECHAALTA',  exDateTime);
            end
          else
            begin
              SqlType := stUpdate;

              Fields.Add('EC_USUMODIF',   Sesion.UserID);
              Fields.Add('EC_FECHAMODIF', exDateTime);
            end;
        end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmConceptosExenciones.LoadControls;
begin
  with sdqConsulta do
    begin
      fraEC_IMPUESTO.Value := FieldByName('CODIMPUESTO').AsString;
      edEC_FECHADESDE.Date := FieldByName('FECHA_DESDE').AsDateTime;
      edEC_FECHAHASTA.Date := FieldByName('FECHA_HASTA').AsDateTime;
    end;

  VCLExtra.LockControls([fraEC_IMPUESTO, edEC_FECHADESDE]);
end;

procedure TfrmConceptosExenciones.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT TB_DESCRIPCION IMPUESTO, EC_FECHADESDE FECHA_DESDE, ' +
                 'EC_FECHAHASTA FECHA_HASTA, TRUNC(EC_FECHABAJA) FECHA_BAJA, ' +
                 'EC_IMPUESTO CODIMPUESTO, EC_ID ID ' +
            'FROM CTB_TABLAS, XEC_EXENCIONCONCEPTO ' +
           'WHERE TB_CODIGO = EC_IMPUESTO ' +
             'AND TB_CLAVE = ''RETEN'' ' +
             'AND EC_IDCONCEPTO = ' + SqlValue(IdConcepto);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmConceptosExenciones.SetIdConcepto(const Value: TTableId);
begin
  if FIdConcepto <> Value then
    begin
      FIdConcepto := Value;
      RefreshData;
    end;
end;

function TfrmConceptosExenciones.Validar: Boolean;
var
  sSql: String;
begin
  if ModoAbm = maAlta then
    begin
      Verificar(not fraEC_IMPUESTO.IsSelected, fraEC_IMPUESTO, 'Debe ingresar el impuesto.');
      Verificar(edEC_FECHADESDE.IsEmpty, edEC_FECHADESDE, 'Debe ingresar la fecha desde.');
    end
  else
    Verificar(edEC_FECHAHASTA.IsEmpty, edEC_FECHAHASTA, 'Debe ingresar la fecha hasta.');

  if ModoAbm = maAlta then
    begin
      sSql := 'SELECT 1 ' +
                'FROM XEC_EXENCIONCONCEPTO ' +
               'WHERE EC_FECHABAJA IS NULL ' +
                 'AND EC_IDCONCEPTO = :IdConcepto ' +
                 'AND EC_IMPUESTO = :Impuesto ' +
                 'AND :FechaDesde BETWEEN EC_FECHADESDE AND NVL(EC_FECHAHASTA, TO_DATE(''31/12/2999'', ''DD/MM/YYYY''))';
      Verificar(ExisteSqlEx(sSql, [IdConcepto, fraEC_IMPUESTO.Value, TDateTimeEx.Create(edEC_FECHADESDE.Date)]), edEC_FECHADESDE, 'Ya existe una excepción de conceptos activa con fechas incluidas en la fecha desde ingresada.' );
    end;

  if not edEC_FECHAHASTA.IsEmpty then
    begin
      sSql := 'SELECT 1 ' +
                'FROM XEC_EXENCIONCONCEPTO ' +
               'WHERE EC_FECHABAJA IS NULL ' +
                 'AND EC_IDCONCEPTO = :IdConcepto ' +
                 'AND EC_IMPUESTO = :Impuesto ' +
                 Iif(ModoAbm = maAlta, '', 'AND EC_ID <> ' + SqlValue(sdqConsulta.FieldByName('ID').AsInteger) + ' ') +
                 'AND :FechaaHasta BETWEEN EC_FECHADESDE AND NVL(EC_FECHAHASTA, TO_DATE(''31/12/2999'', ''DD/MM/YYYY''))';
      Verificar(ExisteSqlEx(sSql, [IdConcepto, fraEC_IMPUESTO.Value, TDateTimeEx.Create(edEC_FECHAHASTA.Date)]), edEC_FECHAHASTA, 'Ya existe una excepción de conceptos activa con fechas incluidas en la fecha hasta ingresada.' );
    end;

  sSql := 'SELECT 1 ' +
            'FROM XEC_EXENCIONCONCEPTO ' +
           'WHERE EC_FECHABAJA IS NULL ' +
             'AND EC_IDCONCEPTO = :IdConcepto ' +
             'AND EC_IMPUESTO = :Impuesto ' +
             Iif(ModoAbm = maAlta, '', 'AND EC_ID <> ' + SqlValue(sdqConsulta.FieldByName('ID').AsInteger) + ' ') +
             'AND EC_FECHADESDE BETWEEN :FechaDesde AND NVL(:FechaaHasta, TO_DATE(''31/12/2999'', ''DD/MM/YYYY''))';
  Verificar(ExisteSqlEx(sSql, [IdConcepto, fraEC_IMPUESTO.Value, TDateTimeEx.Create(edEC_FECHADESDE.Date), TDateTimeEx.Create(edEC_FECHAHASTA.Date)]), edEC_FECHADESDE, 'Ya existe una excepción de conceptos activa posterior a la fecha desde ingresada.' );

  Result := True;
end;

procedure TfrmConceptosExenciones.FormCreate(Sender: TObject);
begin
  inherited;

  with fraEC_IMPUESTO do
    begin
      Clave     := 'RETEN';
      ShowBajas := False;
    end;

  FieldBaja := 'FECHA_BAJA';
end;

procedure TfrmConceptosExenciones.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, Grid, 'No se puede modificar un registro dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_HASTA').IsNull, Grid, 'No se puede modificar un registro con Fecha Hasta.');

  inherited;
end;

procedure TfrmConceptosExenciones.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, Grid, 'El registro ya se encuentra dado de baja.');

  inherited;
end;

end.
