unit unContratoContactoEmi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unContratoContacto, artSeguridad, QueryPrint, ShortCutControl,
  DB, SDEngine, ImgList, XPMenu, Placemnt, StdCtrls, ExtCtrls, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unfraContacto, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unDmPrincipal;

type
  TfrmContratoContactoEmi = class(TfrmContratoContacto)
    chkRemitenteCarta: TCheckBox;
  private
    { Private declarations }
  protected
    procedure DoGuardarSRT; override;
    procedure SeleccionSRT; override;
    procedure ModoABM(AValue: Boolean); override;
  public
    { Public declarations }
  end;

var
  frmContratoContactoEmi: TfrmContratoContactoEmi;

implementation

uses
  unSesion;

{$R *.dfm}

{ TfrmContratoContactoEmi }

procedure TfrmContratoContactoEmi.DoGuardarSRT;
var
  chkGestion: boolean;
begin
  chkGestion := chkRemitenteCarta.Checked;
  inherited;
  if chkGestion then
  begin
    if not ExisteSqlEx('SELECT 1 FROM EMI.ICE_CONTACTOSEMI WHERE CE_IDCONTACTO = :IdContacto', [sdqDatos.FieldByName('CT_ID').AsInteger]) then
      EjecutarSqlEx('INSERT INTO EMI.ICE_CONTACTOSEMI(CE_IDCONTACTO) VALUES(:IdContacto)', [sdqDatos.FieldByName('CT_ID').AsInteger])
    else
      EjecutarSqlEx('UPDATE EMI.ICE_CONTACTOSEMI SET CE_FECHABAJA = NULL, CE_USUBAJA = NULL WHERE CE_IDCONTACTO = :IdContacto', [sdqDatos.FieldByName('CT_ID').AsInteger]);
  end
  else begin
    EjecutarSqlEx('UPDATE EMI.ICE_CONTACTOSEMI SET CE_FECHABAJA = SYSDATE, CE_USUBAJA = :usubaja WHERE CE_IDCONTACTO = :IdContacto', [Sesion.LoginName, sdqDatos.FieldByName('CT_ID').AsInteger]);
  end;
  chkRemitenteCarta.Checked := chkGestion;
end;

procedure TfrmContratoContactoEmi.ModoABM(AValue: Boolean);
begin
  inherited;
  chkRemitenteCarta.Enabled := not AValue;
end;

procedure TfrmContratoContactoEmi.SeleccionSRT;
begin
  inherited;
  chkRemitenteCarta.Checked := ExisteSqlEx('SELECT 1 FROM EMI.ICE_CONTACTOSEMI WHERE CE_FECHABAJA IS NULL AND CE_IDCONTACTO = :IdContacto', [sdqDatos.FieldByName('CT_ID').AsInteger]);
end;

end.
