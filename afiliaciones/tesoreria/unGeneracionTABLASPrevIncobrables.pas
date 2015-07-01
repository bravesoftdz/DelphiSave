unit unGeneracionTABLASPrevIncobrables;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, DateComboBox,
  PeriodoPicker, artSeguridad, ComCtrls, FormPanel, unCustomForm, ImgList,
  XPMenu, Placemnt;

type
  TfrmGeneracionTABLASPrevIncobrables = class(TfrmCustomForm)
    Seguridad: TSeguridad;
    lbFechaDesde: TLabel;
    edPERIODO: TPeriodoPicker;
    edDESC_PERIODO: TEdit;
    btnCancelar: TButton;
    btnAceptar: TButton;
    procedure btnAceptarClick(Sender: TObject);
    procedure edPERIODOExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure DoProcesoPrevIncobrables;
  end;

var
  frmGeneracionTABLASPrevIncobrables: TfrmGeneracionTABLASPrevIncobrables;

implementation

uses
  unPrincipal, AnsiSql, General, unDmPrincipal, CustomDlgs, Periodo;

{$R *.DFM}

procedure TfrmGeneracionTABLASPrevIncobrables.btnAceptarClick(Sender: TObject);
begin
  Verificar(edPERIODO.Periodo.Valor = '', edPERIODO, 'El período no puede quedar en blanco.');

  IniciarEspera;
  DoProcesoPrevIncobrables;
  FinalizarEspera;
end;

procedure TfrmGeneracionTABLASPrevIncobrables.DoProcesoPrevIncobrables;
var
  sSql: String;
begin
  sSql := 'ART.CONT.DO_TABLASPREVISION(:Periodo);';
  EjecutarStoreEx(sSql, [edPERIODO.Text]);
  MsgBox('El proceso finalizó correctamente.');
end;

procedure TfrmGeneracionTABLASPrevIncobrables.edPERIODOExit(Sender: TObject);
begin
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

procedure TfrmGeneracionTABLASPrevIncobrables.FormCreate(Sender: TObject);
begin
  edPERIODO.Periodo.Valor := GetPeriodo(DBDate, fpAnioMes);
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

end.

