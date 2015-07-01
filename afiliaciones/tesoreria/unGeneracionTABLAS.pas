unit unGeneracionTABLAS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, DateComboBox,
  PeriodoPicker, artSeguridad, ComCtrls, FormPanel;

type
  TfrmGeneracionTABLAS = class(TForm)
    Seguridad: TSeguridad;
    lbFechaDesde: TLabel;
    edPERIODO: TPeriodoPicker;
    edDESC_PERIODO: TEdit;
    btnCancelar: TButton;
    btnAceptar: TButton;
    procedure btnAceptarClick(Sender: TObject);
    procedure DoProcesoMensual(Sender: TObject);
    procedure edPERIODOExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

implementation

uses
  unPrincipal, AnsiSql, General, unDmPrincipal, CustomDlgs, unSesion, Periodo;

{$R *.DFM}

procedure TfrmGeneracionTABLAS.btnAceptarClick(Sender: TObject);
begin
  Verificar(edPERIODO.Periodo.Valor = '', edPERIODO, 'El período no puede quedar en blanco.');

  IniciarEspera;
  DoProcesoMensual(nil);
  FinalizarEspera;
end;

procedure TfrmGeneracionTABLAS.DoProcesoMensual(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'ART.CONT.DO_TABLASLIBROS(:Periodo, :Usuario);';
  EjecutarStoreEx(sSql, [edPERIODO.Text, Sesion.UserID]);
  MsgBox('El proceso finalizo correctamente.');
end;

procedure TfrmGeneracionTABLAS.edPERIODOExit(Sender: TObject);
begin
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

procedure TfrmGeneracionTABLAS.FormCreate(Sender: TObject);
begin
  edPERIODO.Periodo.Valor := GetPeriodo(DBDate, fpAnioMes);
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

end.
