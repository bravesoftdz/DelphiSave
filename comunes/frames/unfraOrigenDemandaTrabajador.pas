unit unfraOrigenDemandaTrabajador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RXDBCtrl, ArtComboBox, ArtDBGrid,
  FormPanel, SDEngine, DB, JvMemoryDataset, unFraTrabajador, StdCtrls, Mask, ToolEdit, CurrEdit, Grids, DBGrids,
  ComCtrls, ToolWin, CheckPanel, ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame;

type
  TfraOrigenDemandaTrabajador = class(TFrame)
    pnTrabajador: TPanel;
    chkOrigenDemanda: TCheckPanel;
    lblPorcentajeIncapacidad: TLabel;
    CoolBar1: TCoolBar;
    tbOrigenDemandaSiniestro: TToolBar;
    tbBusquedaSiniestros: TToolButton;
    tbEliminarSiniestroSeleccionado: TToolButton;
    ToolButton8: TToolButton;
    tbLimpiarTodo: TToolButton;
    chkBoxCumpleHS: TCheckBox;
    dbgSiniestros: TDBGrid;
    edPorcentajeIncapacidad: TCurrencyEdit;
    grpTrabajador: TGroupBox;
    fraTrabajadorOrigenDemanda: TfraTrabajador;
    sdqDatosContrato: TSDQuery;
    sdqBusqueda: TSDQuery;
    sdqBusquedaEX_SINIESTRO: TFloatField;
    sdqBusquedaEX_ORDEN: TFloatField;
    sdqBusquedaEX_RECAIDA: TFloatField;
    sdqBusquedaCODSINI: TStringField;
    sdqBusquedaEX_SINIESTRORED: TFloatField;
    sdqBusquedaMP_CONTRATO: TFloatField;
    sdqBusquedaMP_CUIT: TStringField;
    sdqBusquedaMP_NOMBRE: TStringField;
    sdqBusquedaTJ_CUIL: TStringField;
    sdqBusquedaTJ_NOMBRE: TStringField;
    sdqBusquedaEX_DIAGNOSTICO: TStringField;
    sdqBusquedaEX_FECHAACCIDENTE: TDateTimeField;
    sdqBusquedaEX_BAJAMEDICA: TDateTimeField;
    sdqBusquedaEX_FECHARECAIDA: TDateTimeField;
    sdqBusquedaEX_ALTAMEDICA: TDateTimeField;
    sdqBusquedaTB_DESCRIPCION: TStringField;
    rxmSiniestrosOrigenDemanda: TJvMemoryData;
    rxmSiniestrosOrigenDemandaEX_SINIESTRO: TFloatField;
    rxmSiniestrosOrigenDemandaEX_ORDEN: TFloatField;
    rxmSiniestrosOrigenDemandaEX_RECAIDA: TFloatField;
    rxmSiniestrosOrigenDemandaCODSINI: TStringField;
    rxmSiniestrosOrigenDemandaEX_SINIESTRORED: TFloatField;
    rxmSiniestrosOrigenDemandaMP_CONTRATO: TFloatField;
    rxmSiniestrosOrigenDemandaMP_CUIT: TStringField;
    rxmSiniestrosOrigenDemandaMP_NOMBRE: TStringField;
    rxmSiniestrosOrigenDemandaTJ_CUIL: TStringField;
    rxmSiniestrosOrigenDemandaTJ_NOMBRE: TStringField;
    rxmSiniestrosOrigenDemandaEX_DIAGNOSTICO: TStringField;
    rxmSiniestrosOrigenDemandaEX_FECHAACCIDENTE: TDateTimeField;
    rxmSiniestrosOrigenDemandaEX_BAJAMEDICA: TDateTimeField;
    rxmSiniestrosOrigenDemandaEX_FECHARECAIDA: TDateTimeField;
    rxmSiniestrosOrigenDemandaEX_ALTAMEDICA: TDateTimeField;
    rxmSiniestrosOrigenDemandaTB_DESCRIPCION: TStringField;
    dsSiniestrosOrigenDemanda: TDataSource;
    sdqUpdSiniestrosEnTramite: TSDUpdateSQL;
    sdqSiniestroJuicioEnTramite: TSDQuery;
    tbRevisarGastosSiniestro: TToolButton;
    tbSeparador4: TToolButton;
    sdqConsultaSiniestro: TSDQuery;
    FormPanel1: TFormPanel;
    edILT: TCurrencyEdit;
    Label8: TLabel;
    edILP: TCurrencyEdit;
    Label9: TLabel;
    Label10: TLabel;
    edMORTALES: TCurrencyEdit;
    Label11: TLabel;
    edOTROS: TCurrencyEdit;
    Label12: TLabel;
    edPRESTMED: TCurrencyEdit;
    Label14: TLabel;
    edTOTAL: TCurrencyEdit;
    sdqGastos: TSDQuery;
    dsGastos: TDataSource;
    ArtDBGrid1: TArtDBGrid;
  private
  public
  end;

implementation

uses unDmLegales;

{$R *.dfm}

end.
