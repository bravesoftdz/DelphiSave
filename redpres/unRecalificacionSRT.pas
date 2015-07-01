unit unRecalificacionSRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, ToolEdit, DateComboBox, SinEdit, SDEngine,
  QuickRpt, QRCtrls, Db, Placemnt;

type
  TFrmRecalificacionSRT = class(TForm)
    btnImprimir: TBitBtn;
    btnCerrar: TBitBtn;
    gbNroSiniestro: TGroupBox;
    SinNro: TSinEdit;
    FormPlacement: TFormPlacement;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure LimpiarDatos;
    procedure DoGenerarInformeRecalifSRT;
    function GetSqlExistenSiniestros :String;
    function GetSqlDetalleReporte(iSiniestro, iOrden :Integer; CodEventosRecSRT :String) :String;
  public
    { Public declarations }
  end;

var
  FrmRecalificacionSRT: TFrmRecalificacionSRT;

implementation

uses unPrincipal, unDmPrincipal, strfuncs, AnsiSql, CustomDlgs,
  unRptInformeSRT;

{$R *.DFM}

procedure TFrmRecalificacionSRT.LimpiarDatos;
begin
  SinNro.Clear;
end;

procedure TFrmRecalificacionSRT.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRecalificacionSRT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.MnuRecalificacionSRT.Enabled := True;
  Action := caFree;
end;

procedure TFrmRecalificacionSRT.FormCreate(Sender: TObject);
begin
  LimpiarDatos;
end;

procedure TFrmRecalificacionSRT.btnImprimirClick(Sender: TObject);
begin
  DoGenerarInformeRecalifSRT;
end;

procedure TFrmRecalificacionSRT.DoGenerarInformeRecalifSRT;
var
  Consulta :TSDQuery;
  vSiniestro, vOrden :Integer;
begin
// imprime el listado de recalificación a SRT - si el criterio de selección es por rango de siniestros,
// se seleccionan solo aquellos siniestros de la tabla ser_EveMedRecalif que no tengan ningun código de
// evento 099 (informe final srt) y que tengan por lo menos algún evento de recalificación no generado
// automáticamente y que además (si corresponde) la fecha de alta o de modificación del evento esté en el rango seleccionado

  Consulta := GetQuery(GetSqlExistenSiniestros);
  try
    if Consulta.Eof then
      MsgBox('No existen siniestros en el rango indicado.', 0,'Error')
    else begin
      while not Consulta.Eof do
      begin
        vSiniestro := Consulta.FieldByName('er_siniestro').AsInteger;
        vOrden := Consulta.FieldByName('er_orden').AsInteger;
        rptInformeSRT := TRptInformeSRT.Create(Self);
        with RptInformeSRT do
        begin
          try
            sdqDatosReporte.ParamByName('pSiniestro').AsInteger := vSiniestro;
            sdqDatosReporte.ParamByName('pOrden').AsInteger := vOrden;
            sdqDatosReporte.Open;
            sdqDetalleReporte.SQL.Text := GetSqlDetalleReporte(vSiniestro, vOrden, DoGenerarCodEventosRecSRT);
            sdqDetalleReporte.Open;
            Print;
          finally
            Free;
          end;
        end;
        Consulta.Next;
      end;
    end;
  finally
    Consulta.Free;
  end;
end;

function TFrmRecalificacionSRT.GetSqlExistenSiniestros :String;
var
  sSql :String;
begin
  sSql := ' SELECT rec1.er_siniestro, rec1.er_orden ' +
            ' FROM ser_evemedrecalif rec1 ' +
           ' WHERE rec1.er_siniestro = ' + SqlInt(SinNro.Siniestro) +
             ' AND rec1.er_orden = ' + SqlInt(SinNro.Orden) +
           ' GROUP BY rec1.er_siniestro, rec1.er_orden ';
  Result := sSql;
end;

function TFrmRecalificacionSRT.GetSqlDetalleReporte(iSiniestro, iOrden :Integer; CodEventosRecSRT :String):String;
var
  sSql :String;
begin
  sSql := 'SELECT em_descripcion, er_observaciones' +
          ' FROM ser_evemedrecalif, sin.sem_eventomedicoreca ' +
          ' WHERE er_siniestro = ' + SqlInt(iSiniestro) +
            ' AND er_orden = ' + SqlInt(iOrden) +
            ' AND er_evento > 0 ' +
            ' AND er_codigo IN ' + CodEventosRecSRT +
            ' AND em_codigo = er_codigo ' +
          ' ORDER BY er_codigo, er_fecha, er_evento ';
  GetSqlDetalleReporte := sSql;
end;

end.
