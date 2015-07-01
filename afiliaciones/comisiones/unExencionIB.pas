unit unExencionIB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unArt, Mask, ToolEdit, CurrEdit;

type
  TfrmExencionIB = class(TfrmCustomGridABM)
    Label1: TLabel;
    cmbProvincias: TComboBox;
    Label2: TLabel;
    edAlicuota: TCurrencyEdit;
    rgTipo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbEliminarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    fTipo: string;
    fId: TTableID;
    procedure CargarProvincias;
  protected
    procedure RefreshData; override;
    function DoABM: Boolean; override;
    function Validar : Boolean; override;
    procedure ClearControls; override;
    function GetCodProvincia: TTableID;
  public
    procedure DoCargarDatos(Id: TTableId; Tipo: string);
  end;

var
  frmExencionIB: TfrmExencionIB;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, General;

{$R *.DFM}

procedure TfrmExencionIB.DoCargarDatos(Id: TTableId; Tipo: string);
begin
  fTipo := Tipo;
  fId   := Id;
  RefreshData;
end;

procedure TfrmExencionIB.RefreshData;
var
  sSql: string;
begin
  sSql := 'SELECT PV_CODIGO, PV_DESCRIPCION, EI_FECHABAJA, EI_ID, EI_ALICUOTA ALICUOTA, ' +
                 'DECODE(EI_TIPO, ''E'', ''Exento'', ''A'', ''Alícuota Especial'', NULL) DESCRTIPO, ' +
                 'EI_TIPO TIPO ' +
            'FROM CPV_PROVINCIAS, XEI_EXENCIONIB ' +
           'WHERE PV_CODIGO = EI_PROVINCIA ';

  if fTipo = 'E' then
    sSql := sSql + ' AND EI_IDENTIDAD = ' + SqlValue(fId)
  else
    sSql := sSql + ' AND EI_IDENTIDADVEND = ' + SqlValue(fId);

  sdqConsulta.Sql.Text := sSql;
  inherited;
end;

procedure TfrmExencionIB.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;
  CargarProvincias;
end;

procedure TfrmExencionIB.CargarProvincias;
var
  sSql: string;
  Query: TSDQuery;
begin
  sSql := 'SELECT PV_CODIGO || '' - '' || PV_DESCRIPCION PROV ' +
            'FROM CPV_PROVINCIAS ';
  Query := GetQuery ( sSql );

  cmbProvincias.Clear;
  try
    while not Query.Eof do
      begin
        cmbProvincias.Items.Add( Query.FieldByName('PROV').AsString );
        Query.Next;
      end;
  finally
    Query.Free;
  end;
end;

procedure TfrmExencionIB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  frmExencionIB := Nil;
  Action        := caFree;
end;

function TfrmExencionIB.DoABM: Boolean;
var
  IDExencion: TTableID;
begin
  Sql.Clear ;
  Sql.TableName := 'XEI_EXENCIONIB';

  if ModoABM = maBaja Then
    begin
      Sql.SqlType := stUpdate;

      Sql.PrimaryKey.Add( 'EI_ID',        sdqConsulta.FieldByName('EI_ID').AsInteger );
      Sql.Fields.Add( 'EI_FECHABAJA',     'ACTUALDATE', False );
      Sql.Fields.Add( 'EI_USUBAJA',       frmPrincipal.DBLogin.UserID );
    end
  else
  begin
    if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        IDExencion := ValorSql( 'SELECT SEQ_XEI_ID.NEXTVAL FROM DUAL' );

        Sql.PrimaryKey.Add( 'EI_ID',      IDExencion );
        Sql.Fields.Add( 'EI_FECHAALTA',   'ACTUALDATE', False );
        Sql.Fields.Add( 'EI_USUALTA',     frmPrincipal.DBLogin.UserID );
      end
    else
      begin { ModoABM = maModificacion }
        Sql.SqlType := stUpdate;

        Sql.PrimaryKey.Add( 'EI_ID',      sdqConsulta.FieldByName('EI_ID').AsInteger );
        Sql.Fields.Add( 'EI_FECHAMODIF',  'ACTUALDATE', False );
        Sql.Fields.Add( 'EI_USUMODIF',    frmPrincipal.DBLogin.UserID );
      end;

    Sql.Fields.Add( 'EI_PROVINCIA',       GetCodProvincia );
    Sql.Fields.Add( 'EI_TIPO',            String(Iif(rgTipo.ItemIndex = 0, 'E', Iif(rgTipo.ItemIndex = 1, 'A', exNull))) );
    Sql.Fields.Add( 'EI_ALICUOTA',        edAlicuota.Value );

    if fTipo = 'E' then
      Sql.Fields.Add( 'EI_IDENTIDAD',     fID )
    else
      Sql.Fields.Add( 'EI_IDENTIDADVEND', fID );
  end;

  Result := inherited DOABM;
end;

function TfrmExencionIB.Validar: Boolean;
var
  sSql: string;
begin
  sSql := 'SELECT 1 ' +
            'FROM CPV_PROVINCIAS, XEI_EXENCIONIB ' +
           'WHERE PV_CODIGO = EI_PROVINCIA ' +
             'AND EI_FECHABAJA IS NULL ' +
             'AND EI_PROVINCIA = ' + SqlValue(GetCodProvincia);

  if fTipo = 'E' then
    sSql := sSql + ' AND EI_IDENTIDAD = ' + SqlValue(fId)
  else
    sSql := sSql + ' AND EI_IDENTIDADVEND = ' + SqlValue(fId);

  Verificar(cmbProvincias.ItemIndex = -1, cmbProvincias, 'La provincia es obligatoria.');
  Verificar(ExisteSql(sSql), cmbProvincias, 'La provincia ya está incluída.' );
  Verificar(rgTipo.ItemIndex = -1, rgTipo, 'Debe indicar el tipo.' );
  Verificar((rgTipo.ItemIndex = 0) and (edAlicuota.Value > 0), edAlicuota, 'Para el tipo seleccionado la alícuota debe ser igual a 0.' );
  Verificar((rgTipo.ItemIndex = 1) and (edAlicuota.Value = 0), edAlicuota, 'Para el tipo seleccionado debe ingresar la alícuota.' );

  Result := True;
end;

procedure TfrmExencionIB.ClearControls;
begin
  cmbProvincias.ItemIndex := -1;
  rgTipo.ItemIndex        := -1;
  edAlicuota.Clear;
end;

function TfrmExencionIB.GetCodProvincia: TTableID;
begin
  Result:= StrToIntDef(Copy(cmbProvincias.Text, 0, Pos(' - ',cmbProvincias.Text)-1), -1);
end;

procedure TfrmExencionIB.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if sdqConsulta.FieldByName('EI_FECHABAJA').AsString <> '' then
    AFont.Color := clRed;
end;

procedure TfrmExencionIB.tbEliminarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.FieldByName('EI_FECHABAJA').AsString <> '', nil, 'El registro ya ha sido dado de baja');

  inherited;
end;

procedure TfrmExencionIB.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('ALICUOTA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('ALICUOTA')).DisplayFormat := '% 0.000;-% 0.000';
end;

end.

