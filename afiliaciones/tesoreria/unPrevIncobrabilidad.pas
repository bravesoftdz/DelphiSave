unit unPrevIncobrabilidad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Db, SDEngine, RxLookup, RxGIF,
  ExtCtrls, ComCtrls, PeriodoPicker;

type
  TfrmPrevIncobrabilidad = class(TForm)
    lbFechaDesde: TLabel;
    edPERIODO: TPeriodoPicker;
    edDESC_PERIODO: TEdit;
    btnCancelar: TButton;
    btnAceptar: TButton;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edPERIODOExit(Sender: TObject);
  end;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, Periodo, unRptPrevIncobrabilidad;

{$R *.DFM}

procedure TfrmPrevIncobrabilidad.btnAceptarClick(Sender: TObject);
begin
  Verificar(edPERIODO.Periodo.Valor = '', edPERIODO, 'El período no puede quedar en blanco.');

  DoImprimirPrevIncobrabilidad( edPERIODO.Periodo.Valor );
end;

procedure TfrmPrevIncobrabilidad.FormCreate(Sender: TObject);
begin
  edPERIODO.Periodo.Valor := GetPeriodo(DBDate, fpAnioMes);
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

procedure TfrmPrevIncobrabilidad.edPERIODOExit(Sender: TObject);
begin
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

end.

