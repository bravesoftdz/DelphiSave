unit unVerReemplazos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, Db, SDEngine, Placemnt,
  artSeguridad, ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  QueryPrint, unArt;

type
  TfrmVerReemplazos = class(TfrmCustomPanelABM)
    sdqAdic: TSDQuery;
    dsAdic: TDataSource;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    Label6: TLabel;
    GridAdicionales: TArtDBGrid;
    Splitter1: TSplitter;
    lblReemplazantes: TLabel;
    GridAdicionales2: TArtDBGrid;
    procedure tbImprimirClick(Sender: TObject);
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqAdicAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    IDReemplazo: TTableId;
  public
    procedure Preparar (ID: TTableId);
  end;

var
  frmVerReemplazos: TfrmVerReemplazos;

implementation

uses
  unPrincipal, unDmPrincipal, unQrChequesReemplazados, AnsiSql;
  
{$R *.DFM}

procedure TfrmVerReemplazos.Preparar(ID: TTableId);
var
  sSql: String;
begin
  IDReemplazo := ID;

  sSql :=
    'SELECT BA_CODIGO, BA_NOMBRE, VA_NROCHEQUE, VA_VENCIMIENTO, VA_IMPORTE, TV_DESCRIPCION TIPO_VALOR, VA_NEGOCIABLE' +
     ' FROM ZRD_REEMPLAZODETALLE, ZVA_VALOR, ZBA_BANCO, OTV_TIPOVALOR' +
    ' WHERE RD_IDVALOR = VA_ID' +
      ' AND VA_IDBANCO = BA_ID(+)' +
      ' AND RD_TIPO = ''R''' +
      ' AND VA_IDTIPOVALOR = TV_ID' +
      ' AND RD_IDREEMPLAZOVALOR = (SELECT MAX(RD_IDREEMPLAZOVALOR)' +
                                   ' FROM ZRD_REEMPLAZODETALLE' +
                                  ' WHERE RD_IDVALOR = ' + SQLValue(ID) + ')';
  OpenQuery(sdqAdic, sSql, True);

  sSql :=
    'SELECT BA_CODIGO, BA_NOMBRE, VA_NROCHEQUE, VA_VENCIMIENTO, VA_IMPORTE, TV_DESCRIPCION TIPO_VALOR, VA_NEGOCIABLE,' +
          ' TB_DESCRIPCION ESTADO, COBRANZA.GET_FECHACONCILIADO(VA_ID) FECHACONCILIADO' +
     ' FROM CTB_TABLAS, ZRD_REEMPLAZODETALLE, ZVA_VALOR, ZBA_BANCO, OTV_TIPOVALOR' +
    ' WHERE RD_IDVALOR = VA_ID' +
      ' AND VA_IDBANCO = BA_ID(+)' +
      ' AND RD_TIPO = ''E''' +
      ' AND VA_IDTIPOVALOR = TV_ID' +
      ' AND VA_ESTADO = TB_CODIGO(+)' +
      ' AND TB_CLAVE(+) = ''ESVAL''' +
      ' AND RD_IDREEMPLAZOVALOR = (SELECT MAX(RD_IDREEMPLAZOVALOR)' +
                                   ' FROM ZRD_REEMPLAZODETALLE' +
                                  ' WHERE RD_IDVALOR = ' + SQLValue(ID) + ')';
  OpenQuery(sdqConsulta, sSql, True);
end;

procedure TfrmVerReemplazos.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.Enabled := False;
  try
    PrepararListado(IDReemplazo);
  finally
    tbImprimir.Enabled := True;
  end;
end;

procedure TfrmVerReemplazos.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  frmVerReemplazos := nil;
  Action := caFree;
end;

procedure TfrmVerReemplazos.sdqAdicAfterOpen(DataSet: TDataSet);
begin
  if sdqAdic.FieldByName('VA_IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField( sdqAdic.FieldByName('VA_IMPORTE')).Currency := True;
end;

procedure TfrmVerReemplazos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('VA_IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('VA_IMPORTE')).Currency := True;
end;

end.
