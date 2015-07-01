unit unPagosLegalesPendientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls,
  CurrEdit, PatternEdit, Mask, ToolEdit, DateComboBox, unArtFrame, unSesion,
  unFraCodigoDescripcion, FormPanel, DB, SDEngine, JvMemoryDataset, AnsiSql,
  ComCtrls, ToolWin;

type
  TfrmPagosLegalesPendientes = class(TForm)
    dbgConceptosPendientesDePago: TDBGrid;
    sdqPagoLegal: TSDQuery;
    dsPagoLegal: TDataSource;
    JvMemoryData1: TJvMemoryData;
    sdqConceptosOperaciones: TSDQuery;
    cbEdicionPagosEfectudos: TCoolBar;
    tbPagos: TToolBar;
    tbIngresoPago: TToolButton;
    tbEdicionPago: TToolButton;
    tbEliminarPago: TToolButton;
    ToolButton21: TToolButton;
    tbSalir: TToolButton;
    procedure dbgConceptosPendientesDePagoDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure tbSalirClick(Sender: TObject);
  private
    { Private declarations }
    FIdJuicioEnTramite : integer;
  public
    { Public declarations }
    procedure MostrarPagosLegalesPendientes(IdJuicioEnTramite: integer;
      rxmListaOperacionesRealizadas : TJvMemoryData);

  end;

var
  frmPagosLegalesPendientes: TfrmPagosLegalesPendientes;

implementation

uses unDmPrincipal, unCustomDataModule, unDmLegales;

{$R *.dfm}

procedure TfrmPagosLegalesPendientes.dbgConceptosPendientesDePagoDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if Field.FieldName = 'LP_NUMPAGO' then
  begin
    canvas.FillRect(Rect);
    if Field.Text <> '' then
     canvas.TextOut(Rect.Left, Rect.Top, 'ü')
    else canvas.TextOut(Rect.Left, Rect.Top, 'û');
  end;
end;

procedure TfrmPagosLegalesPendientes.MostrarPagosLegalesPendientes(IdJuicioEnTramite: integer;
  rxmListaOperacionesRealizadas : TJvMemoryData);
begin
  FIdJuicioEnTramite := IdJuicioEnTramite;

  try
    while not rxmListaOperacionesRealizadas.eof do
    begin
        sdqConceptosOperaciones.ParamByName('idoperacion').AsInteger :=
                  rxmListaOperacionesRealizadas.FieldByName('IdOperacion').AsInteger;

        sdqConceptosOperaciones.Open;
        while not sdqConceptosOperaciones.Eof do
        begin

          EjecutarSqlST(' INSERT INTO legales.lpl_pagolegal (pl_id, pl_numpago, ' +
                      ' pl_fechaemision, pl_importepago, pl_usualta, pl_fechaalta, pl_comentario, ' +
                      ' pl_idjuicioentramite, pl_idtipooperacion) ' +
                      ' VALUES ( LEGALES.SEQ_LPL_ID.NextVal, Null, SysDate,' +

                      SqlValue( sdqConceptosOperaciones.FieldByName('op_cargofijo').asCurrency) + ', ' +
                      SqlValue( Sesion.Usuario) + ', Sysdate, ''Pago por confirmar.'', ' +
                      SqlValue( FIdJuicioEnTramite)  + ', ' +
                      SqlValue( rxmListaOperacionesRealizadas.FieldByName('IdOperacion').AsInteger) + ')');
          sdqConceptosOperaciones.Next;
        end;
        rxmListaOperacionesRealizadas.Next;
    end;
  finally
    sdqConceptosOperaciones.close;
    rxmListaOperacionesRealizadas.EmptyTable;
  end;
end;

procedure TfrmPagosLegalesPendientes.tbSalirClick(Sender: TObject);
begin
  Close;
end;

end.
