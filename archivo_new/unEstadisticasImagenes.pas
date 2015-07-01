unit unEstadisticasImagenes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, PatternEdit,
  CardinalEdit;

type
  TfrmEstadisticasImagenes = class(TfrmCustomConsulta)
    gbFechaAltaReposit: TGroupBox;
    Label1: TLabel;
    edFAltaRepositDesde: TDateComboBox;
    edFAltaRepositHasta: TDateComboBox;
    ShortCutControl1: TShortCutControl;
    pnlTotal: TPanel;
    edTotal: TCardinalEdit;
    rgOrden: TRadioGroup;
    gbGerencias: TGroupBox;
    lblg1: TLabel;
    lblg2: TLabel;
    lblg3: TLabel;
    lblg4: TLabel;
    lblg5: TLabel;
    lblg6: TLabel;
    lblg7: TLabel;
    lblg8: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgOrdenClick(Sender: TObject);
  private
    function GetColorGerencia(Indice: Integer): TColor;
    procedure DoLimpiarGerencias(Desde: Integer);
    function IsBusquedaPorGerencia: Boolean;
    function GetDescripcionTipoArchivo(Texto: String): String;
    function GetLabelGerencia(Indice: Integer): TLabel;
  protected
    procedure RefreshData; override;
  public
  end;

var
  frmEstadisticasImagenes: TfrmEstadisticasImagenes;

Const
  MAXCANTGERENCIAS = 8;
  CANTDIGITOSINDICEGERENCIA = 2;

implementation

uses
  unArt, unDmPrincipal, AnsiSql, General, StrFuncs, CustomDlgs, unSesion, unComunes,
  DateTimeFuncs, unConstantArchivo, Numeros;

{$R *.dfm}

procedure TfrmEstadisticasImagenes.RefreshData;
var
  sDescrAnt, sSqlTiposArch, sTiposArch, sWhere, sSql: String;
  i: Integer;
  bOrdenGerencia: Boolean;
begin
  DoPerderFoco(Grid, Grid);
  Verificar(edFAltaRepositDesde.IsEmpty, nil, 'Debe indicar la fecha de alta desde en el repositorio.');

  sTiposArch := '';
  sWhere     := SqlBetweenDateTime(' AND RRA1.RA_FECHAALTA ', edFAltaRepositDesde.Date, edFAltaRepositHasta.Date);

  Do_LimpiarTablaTemporal('TEI_ESTADISTICAIMAGEN', 'EI_USUARIO', Sesion.Userid);
  DoLimpiarGerencias(1);
  sdqConsulta.Close;

  // Para Liquidaciones no está contando los documentos LOTE, los cuenta para el tipo de archivo Siniestros
  sSql := 'INSERT INTO TEI_ESTADISTICAIMAGEN(EI_USUARIO, EI_FECHAALTA, EI_IDTIPOARCHIVO, EI_CANTIDAD) ' +
               'SELECT :Usuario, TRUNC(RRA1.RA_FECHAALTA), ' +
                       '(CASE WHEN TA_ID = ' + SqlValue(ID_CARPETA_SINIESTRO) + ' AND TD_CODIGO IN (' + CODDOCS_LIQ + ') THEN -1 ' +
                             'WHEN TA_ID = ' + SqlValue(ID_CARPETA_SINIESTRO) + ' AND TD_CODIGO = ' + SqlValue(CODDOC_LOTE) + ' AND EXISTS (SELECT 1 ' +
                                                                                                                                             'FROM ARCHIVO.RTD_TIPODOCUMENTO RTD, ARCHIVO.RAR_ARCHIVO RAR, ARCHIVO.RRA_REPOSITORIOARCHIVO RRA2 ' +
                                                                                                                                            'WHERE RRA2.RA_IDARCHIVO = RAR.AR_ID ' +
                                                                                                                                              'AND RRA2.RA_FECHABAJA IS NULL ' +
                                                                                                                                              'AND RRA2.RA_NROMEDIO = RRA1.RA_NROMEDIO ' +
                                                                                                                                              'AND RRA2.RA_IDTIPODOCUMENTO = TD_ID ' +
                                                                                                                                              'AND RTD.TD_CODIGO IN (' + CODDOCS_LIQ + ')) THEN -1 ' +
                        'ELSE TA_ID ' +
                        'END), ' +
                       'COUNT(*) ' +
                 'FROM ARCHIVO.RTD_TIPODOCUMENTO, ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RAR_ARCHIVO, ARCHIVO.RRA_REPOSITORIOARCHIVO RRA1 ' +
                'WHERE RRA1.RA_IDARCHIVO = AR_ID ' +
                  'AND RRA1.RA_FECHABAJA IS NULL ' +
                  'AND AR_TIPO = TA_ID ' +
                  'AND RRA1.RA_NROMEDIO IS NOT NULL ' +
                  'AND RRA1.RA_IDTIPODOCUMENTO = TD_ID(+) ' +
                  sWhere + ' ' +
                'GROUP BY TRUNC(RRA1.RA_FECHAALTA), RRA1.RA_NROMEDIO, TA_ID, TD_CODIGO';
  EjecutarSqlEx(sSql, [Sesion.UserId]);

  sSql := 'SELECT NVL(SUM(EI_CANTIDAD), 0) ' +
            'FROM TEI_ESTADISTICAIMAGEN ' +
           'WHERE EI_USUARIO = :Usuario';
  edTotal.Value := ValorSqlIntegerEx(sSql, [Sesion.UserId]);

  Verificar(edTotal.Value = 0, nil, 'No se han encontrado imágenes.');

  sSqlTiposArch := '(SELECT TA_ID, TA_DESCRIPCION, TA_DESCRIPCIONREDUCIDA, TA_FECHABAJA, TA_IDSECTOR_GERENCIA ' +
                      'FROM ARCHIVO.RTA_TIPOARCHIVO ' +
                     'UNION ALL ' +
                    'SELECT -1, ''Liquidaciones'', ''Liquidaciones'', NULL, ' + SqlValue(SECTOR_GCIA_AMINFINANZAS) + ' ' +
                      'FROM DUAL)';

  i              := 0;
  sDescrAnt      := '';
  bOrdenGerencia := IsBusquedaPorGerencia();

  sSql := 'SELECT A.*, UPPER(NVL(SE_DESCRIPCION, ''ZZZ'')) DESCR_SECTOR_GERENCIA ' +
            'FROM (SELECT TA_ID ID, TA_DESCRIPCIONREDUCIDA DESCR, TA_IDSECTOR_GERENCIA IDSECTOR_GERENCIA ' +
                    'FROM ' + sSqlTiposArch + ' ' +
                   'WHERE TA_FECHABAJA IS NULL ' +
                     'AND EXISTS (SELECT 1 ' +
                                   'FROM TEI_ESTADISTICAIMAGEN ' +
                                  'WHERE EI_USUARIO = :Usuario ' +
                                    'AND EI_IDTIPOARCHIVO = TA_ID)) A, COMPUTOS.CSE_SECTOR ' +
           'WHERE IDSECTOR_GERENCIA = SE_ID(+) ' +
           'ORDER BY ' + Iif(bOrdenGerencia, 'DESCR_SECTOR_GERENCIA', 'DESCR');
  with GetQueryEx(sSql, [Sesion.UserId]) do
    try
      Verificar(Eof, nil, 'No se han encontrado tipos de archivos que tengan imágenes.');

      while not Eof do
        begin
          if bOrdenGerencia and (sDescrAnt <> FieldByName('DESCR_SECTOR_GERENCIA').AsString) then
            begin
              Inc(i);
              sDescrAnt := FieldByName('DESCR_SECTOR_GERENCIA').AsString;
              with GetLabelGerencia(i) do
                begin
                  Caption    := Trim(StrReplace(sDescrAnt, 'GERENCIA', ''));
                  Font.Color := GetColorGerencia(i);
                end;
            end;

          sTiposArch := sTiposArch + CRLF + 'MAX(DECODE(A.IDTIPOARCHIVO, ' + SqlValue(FieldByName('ID').AsString) + ', A.CANT, NULL)) "' + FieldByName('DESCR').AsString + Iif(bOrdenGerencia, LPad(i, '0', CANTDIGITOSINDICEGERENCIA), '') + '", ';

          Next;
        end;
    finally
      Free;
    end;
  sTiposArch := CutRight(sTiposArch, 2);

  sSql :=  'SELECT A.FECHAALTA "Fecha Entrega", ' +
            sTiposArch + ' ' +
             'FROM (SELECT EI_FECHAALTA FECHAALTA, EI_IDTIPOARCHIVO IDTIPOARCHIVO, TA_DESCRIPCION ARCHIVO, SUM(EI_CANTIDAD) CANT ' +
                     'FROM TEI_ESTADISTICAIMAGEN, ' + sSqlTiposArch + ' ' +
                    'WHERE EI_USUARIO = ' + SqlValue(Sesion.UserId) + ' ' +
                      'AND EI_IDTIPOARCHIVO = TA_ID ' +
                 'GROUP BY EI_FECHAALTA, EI_IDTIPOARCHIVO, TA_DESCRIPCION) A ' +
            'GROUP BY FECHAALTA';

  sdqConsulta.Sql.Text := sSql + NVL(SortDialog.OrderBy, ' ORDER BY FECHAALTA');
  inherited;
end;

procedure TfrmEstadisticasImagenes.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  DoLimpiarGerencias(1);

  edFAltaRepositDesde.Clear;
  edFAltaRepositHasta.Clear;
  edTotal.Clear;
end;

procedure TfrmEstadisticasImagenes.tbPropiedadesClick(Sender: TObject);
var
  dFecha: TDateTime;
  sLista, sSql, sDescrTipo: String;
  i: Integer;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay registros en la grilla.');
  Verificar(Grid.Col = 1, Grid, 'Debe posicionarse en algún tipo de archivo.');

  dFecha     := sdqConsulta.FieldByname('Fecha Entrega').AsDateTime;
  sDescrTipo := Grid.Columns[Grid.Col-1].FieldName;

  Verificar(sdqConsulta.FieldByName(sDescrTipo).IsNull, Grid, 'Debe eligir una celda en la grilla que contenga imágenes.');

  if IsBusquedaPorGerencia() then
    sDescrTipo := GetDescripcionTipoArchivo(sDescrTipo);

  sSql := 'SELECT RA_NROMEDIO NROMEDIO, COUNT(*) CANTIMAG ' +
            'FROM ARCHIVO.RTD_TIPODOCUMENTO, ARCHIVO.RAR_ARCHIVO, ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RRA_REPOSITORIOARCHIVO ' +
           'WHERE AR_TIPO = TA_ID ' +
             'AND RA_IDARCHIVO = AR_ID ' +
             'AND RA_FECHABAJA IS NULL ' +
             'AND RA_NROMEDIO IS NOT NULL ' +
             'AND RA_FECHAALTA >= :Fecha ' +
             'AND RA_FECHAALTA < :Fecha + 1 ' +
             'AND RA_IDTIPODOCUMENTO = TD_ID(+) ' +
             'AND TD_CODIGO <> ' + SqlValue(CODDOC_LOTE) + ' ' +

             Iif(sDescrTipo = 'Liquidaciones',
                 'AND TA_ID = ' + SqlValue(ID_CARPETA_SINIESTRO) + ' ' +
                 'AND TD_CODIGO IN (' + CODDOCS_LIQ + ')',    // else:
                 'AND TA_DESCRIPCIONREDUCIDA = ' + SqlValue(sDescrTipo) + ' ' +
                 'AND (TA_ID <> ' + SqlValue(ID_CARPETA_SINIESTRO) + ' ' +
                      'OR TD_CODIGO NOT IN (' + CODDOCS_LIQ + '))') + ' ' +

           'GROUP BY RA_NROMEDIO ' +
           'ORDER BY RA_NROMEDIO';

  sLista := '';
  i      := 0;
  with GetQueryEx(sSql, [TDateTimeEx.Create(dFecha), TDateTimeEx.Create(dFecha)]) do
    try
      while not Eof do
        begin
          Inc(i);
          if i-1 Mod 3 = 0 then
            sLista := sLista + CRLF;

          sLista := sLista + FieldByName('NROMEDIO').AsString + ' (' + FieldByName('CANTIMAG').AsString + ' imág.) / ';

          Next;
        end;
    finally
      Free;
    end;

  Verificar(IsEmptyString(sLista), Grid, 'No se han encontrado CD´s.');

  sLista := 'Se han encontrado los siguientes nros. de CD´s:' + CRLF + CutRight(sLista, 3);
  MsgBox(sLista, MB_ICONINFORMATION, 'Detalle de CD´s');
end;

procedure TfrmEstadisticasImagenes.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  sIndice: String;
begin
  if IsBusquedaPorGerencia() then
    with Column.Title do
      if Caption <> 'Fecha Entrega' then
        begin
          sIndice := StrRight(Caption, CANTDIGITOSINDICEGERENCIA);

          if IsNumber(sIndice) then
            begin
              Font.Color := GetColorGerencia(StrToInt(sIndice));
              Caption    := GetDescripcionTipoArchivo(Caption); 
            end;
        end;
end;

function TfrmEstadisticasImagenes.GetColorGerencia(Indice: Integer): TColor;
begin
  case Indice of
    1: Result := clTeal;
    2: Result := clFuchsia;
    3: Result := TColor($B3FFFF);
    4: Result := clBlue;
    5: Result := clGray;
    6: Result := TColor($6C6CFF);
    7: Result := TColor($005E92FF);  // tono naranja
    8: Result := clBlack;
  else
    Result := clBlack;
  end;
end;

procedure TfrmEstadisticasImagenes.rgOrdenClick(Sender: TObject);
begin
  case rgOrden.ItemIndex of
    0: pnlFiltros.Height := 45;
    1: pnlFiltros.Height := 95;
  end;
end;

procedure TfrmEstadisticasImagenes.DoLimpiarGerencias(Desde: Integer);
var
  n: Integer;
begin
  for n := Desde to MAXCANTGERENCIAS do
    GetLabelGerencia(n).Caption := '';
end;

function TfrmEstadisticasImagenes.IsBusquedaPorGerencia: Boolean;
begin
  Result := (rgOrden.ItemIndex = 1);  // Orden por Gerencia
end;

function TfrmEstadisticasImagenes.GetDescripcionTipoArchivo(Texto: String): String;
begin
  Result := StrLeft(Texto, Length(Texto) - CANTDIGITOSINDICEGERENCIA);
end;

function TfrmEstadisticasImagenes.GetLabelGerencia(Indice: Integer): TLabel;
begin
  Result := TLabel(Self.FindComponent('lblg' + IntToStr(Indice)))
end;

end.

