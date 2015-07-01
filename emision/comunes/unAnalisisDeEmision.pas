unit unAnalisisDeEmision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, PeriodoPicker, StdCtrls, ImgList, XPMenu, Placemnt,
  ComCtrls, Mask, PatternEdit, IntEdit, Buttons;

type
  TfrmAnalisisDeEmision = class(TfrmCustomForm)
    pgTiposConsultas: TPageControl;
    tsEmisionMes: TTabSheet;
    GroupBox1: TGroupBox;
    lbPeriodo: TLabel;
    ppPerEmisionMes: TPeriodoPicker;
    tsEvolMesesMoviles: TTabSheet;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    ppPerMesMovilDesde: TPeriodoPicker;
    Label2: TLabel;
    ppPerMesMovilHasta: TPeriodoPicker;
    tsEmisAcumulada2Anios: TTabSheet;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    edEmisAcumAnio1: TIntEdit;
    Label4: TLabel;
    edEmisAcumAnio2: TIntEdit;
    tsControles: TTabSheet;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    ppPerControles: TPeriodoPicker;
    tsRanking: TTabSheet;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    ppPer1Ranking: TPeriodoPicker;
    Label7: TLabel;
    ppPer2Ranking: TPeriodoPicker;
    Label8: TLabel;
    edCantClientesRanking: TIntEdit;
    tsPrincipalesClientes: TTabSheet;
    GroupBox6: TGroupBox;
    Label9: TLabel;
    edAnioContPrincClientes: TIntEdit;
    tsCalidadEstimacion: TTabSheet;
    GroupBox7: TGroupBox;
    Label10: TLabel;
    ppPerCalidadEstim: TPeriodoPicker;
    tsEmpresasConDiferencias: TTabSheet;
    GroupBox8: TGroupBox;
    Label11: TLabel;
    ppEmprDiferencias: TPeriodoPicker;
    tsCadenciaEstimacion: TTabSheet;
    GroupBox9: TGroupBox;
    Label12: TLabel;
    ppCadenciaEstimac: TPeriodoPicker;
    btnAceptar: TButton;
    btnCancelar: TButton;
    GroupBox10: TGroupBox;
    cbEmisionMes: TCheckBox;
    cbEvolMesesMoviles: TCheckBox;
    cbEmisAcumulada2Anios: TCheckBox;
    cbControles: TCheckBox;
    cbRanking: TCheckBox;
    cbPrincipalesClientes: TCheckBox;
    cbCalidadEstimacion: TCheckBox;
    cbEmpresasConDiferencias: TCheckBox;
    cbCadenciaEstimacion: TCheckBox;
    Label13: TLabel;
    edCantClientesPrincClientes: TIntEdit;
    Label14: TLabel;
    edCantClientesEmprDiferencias: TIntEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbEmisionMesClick(Sender: TObject);
    procedure cbEvolMesesMovilesClick(Sender: TObject);
    procedure cbEmisAcumulada2AniosClick(Sender: TObject);
    procedure cbControlesClick(Sender: TObject);
    procedure cbRankingClick(Sender: TObject);
    procedure cbPrincipalesClientesClick(Sender: TObject);
    procedure cbCalidadEstimacionClick(Sender: TObject);
    procedure cbEmpresasConDiferenciasClick(Sender: TObject);
    procedure cbCadenciaEstimacionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    function Validar: Boolean;
    procedure EjecutarProcesos;
  public
  end;

var
  frmAnalisisDeEmision: TfrmAnalisisDeEmision;

implementation

Uses
  unSesion, unDmPrincipal, CustomDlgs, Periodo, unFuncionesEmision;

{$R *.dfm}
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.btnCancelarClick(Sender: TObject);
begin
  Close;
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.FormActivate(Sender: TObject);
begin
  inherited;

  pgTiposConsultas.ActivePage := tsEmisionMes;
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.cbEmisionMesClick(Sender: TObject);
begin
  tsEmisionMes.Enabled := cbEmisionMes.Checked;

  if not cbEmisionMes.Checked then
    ppPerEmisionMes.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.cbEvolMesesMovilesClick(Sender: TObject);
begin
  tsEvolMesesMoviles.Enabled := cbEvolMesesMoviles.Checked;

  if not cbEvolMesesMoviles.Checked then
    begin
      ppPerMesMovilDesde.Clear;
      ppPerMesMovilHasta.Clear;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.cbEmisAcumulada2AniosClick(Sender: TObject);
begin
  tsEmisAcumulada2Anios.Enabled := cbEmisAcumulada2Anios.Checked;

  if not cbEmisAcumulada2Anios.Checked then
    begin
      edEmisAcumAnio1.Clear;
      edEmisAcumAnio2.Clear;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.cbControlesClick(Sender: TObject);
begin
  tsControles.Enabled := cbControles.Checked;

  if not cbControles.Checked then
    ppPerControles.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.cbRankingClick(Sender: TObject);
begin
  tsRanking.Enabled := cbRanking.Checked;

  if not cbRanking.Checked then
    begin
      ppPer1Ranking.Clear;
      ppPer2Ranking.Clear;
      edCantClientesRanking.Clear;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.cbPrincipalesClientesClick(Sender: TObject);
begin
  tsPrincipalesClientes.Enabled := cbPrincipalesClientes.Checked;

  if not cbPrincipalesClientes.Checked then
    begin
      edAnioContPrincClientes.Clear;
      edCantClientesPrincClientes.Clear;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.cbCalidadEstimacionClick(Sender: TObject);
begin
  tsCalidadEstimacion.Enabled := cbCalidadEstimacion.Checked;

  if not cbCalidadEstimacion.Checked then
    ppPerCalidadEstim.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.cbEmpresasConDiferenciasClick(Sender: TObject);
begin
  tsEmpresasConDiferencias.Enabled := cbEmpresasConDiferencias.Checked;

  if not cbEmpresasConDiferencias.Checked then
    begin
      ppEmprDiferencias.Clear;
      edCantClientesEmprDiferencias.Clear;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.cbCadenciaEstimacionClick(Sender: TObject);
begin
  tsCadenciaEstimacion.Enabled := cbCadenciaEstimacion.Checked;

  if not cbCadenciaEstimacion.Checked then
    ppCadenciaEstimac.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.FormCreate(Sender: TObject);
begin
  inherited;

  cbEmisionMesClick(nil);
  cbEvolMesesMovilesClick(nil);
  cbEmisAcumulada2AniosClick(nil);
  cbControlesClick(nil);
  cbRankingClick(nil);
  cbPrincipalesClientesClick(nil);
  cbCalidadEstimacionClick(nil);
  cbEmpresasConDiferenciasClick(nil);
  cbCadenciaEstimacionClick(nil);
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.btnAceptarClick(Sender: TObject);
begin
  if Validar then
    EjecutarProcesos;
end;
{------------------------------------------------------------------------------}
procedure TfrmAnalisisDeEmision.EjecutarProcesos;
var
  sSql: String;
begin
  if cbEmisionMes.Checked then
    begin
      sSql := 'EMI.ANALISISEMISION.Do_GenEmisionMes(:Usuario, :Per);';
      EjecutarStoreEx(sSql, [Sesion.UserId, ppPerEmisionMes.Periodo.Valor]);
    end;

  if cbEvolMesesMoviles.Checked then
    begin
      sSql := 'EMI.ANALISISEMISION.Do_GenEvolMesesMoviles(:Usuario, :PerDesde, :PerHasta);';
      EjecutarStoreEx(sSql, [Sesion.UserId, ppPerMesMovilDesde.Periodo.Valor, ppPerMesMovilHasta.Periodo.Valor]);
    end;

  if cbEmisAcumulada2Anios.Checked then
    begin
      sSql := 'EMI.ANALISISEMISION.Do_GenEmisionAcumulada2Anios(:Usuario, :Anio1, :Anio2);';
      EjecutarStoreEx(sSql, [Sesion.UserId, edEmisAcumAnio1.Value, edEmisAcumAnio2.Value]);
    end;

  if cbControles.Checked then
    begin
      sSql := 'EMI.ANALISISEMISION.Do_GenControles(:Usuario, :Per);';
      EjecutarStoreEx(sSql, [Sesion.UserId, ppPerControles.Periodo.Valor]);
    end;

  if cbRanking.Checked then
    begin
      sSql := 'EMI.ANALISISEMISION.Do_GenRanking(:Usuario, :Per1, :Per2, :CantClientes);';
      EjecutarStoreEx(sSql, [Sesion.UserId, ppPer1Ranking.Periodo.Valor, ppPer2Ranking.Periodo.Valor, edCantClientesRanking.Value]);
    end;

  if cbPrincipalesClientes.Checked then
    begin
      sSql := 'EMI.ANALISISEMISION.Do_GenPrincipalesClientes(:Usuario, :Anio, :CantClientes);';
      EjecutarStoreEx(sSql, [Sesion.UserId, edAnioContPrincClientes.Value, edCantClientesPrincClientes.Value]);
    end;

  if cbCalidadEstimacion.Checked then
    begin
      sSql := 'EMI.ANALISISEMISION.Do_GenCalidadEstimacion(:Usuario, :Per);';
      EjecutarStoreEx(sSql, [Sesion.UserId, ppPerCalidadEstim.Periodo.Valor]);
    end;

  if cbEmpresasConDiferencias.Checked then
    begin
      sSql := 'EMI.ANALISISEMISION.Do_GenEmpresasDiferencias(:Usuario, :Per, :CantClientes);';
      EjecutarStoreEx(sSql, [Sesion.UserId, ppEmprDiferencias.Periodo.Valor, edCantClientesEmprDiferencias.Value]);
    end;

  if cbCadenciaEstimacion.Checked then
    begin
      sSql := 'EMI.ANALISISEMISION.Do_GenCadenciaEstimacion(:Usuario, :Per);';
      EjecutarStoreEx(sSql, [Sesion.UserId, ppCadenciaEstimac.Periodo.Valor]);
    end;

   MsgBox('Los procesos han finalizado.', MB_ICONINFORMATION);
end;
{------------------------------------------------------------------------------}
function TfrmAnalisisDeEmision.Validar: Boolean;
  function GetParentTabSheet(AControl: TWinControl): TTabSheet;
    begin
      if Assigned(AControl) then
        if (AControl.ClassType <> TTabSheet) then
          Result := GetParentTabSheet(AControl.Parent)
        else
          Result := TTabSheet(AControl)
      else
        Result := nil;
    end;

  function Verificar(Condicion: Boolean; AControl: TWinControl; AText: String): Boolean;
  var
    tsTabSheet: TTabSheet;
  begin
    if Condicion then
      begin
        tsTabSheet := GetParentTabSheet(AControl);
        TPageControl(tsTabSheet.Parent).ActivePage := tsTabSheet;
        Result := CustomDlgs.Verificar(Condicion, AControl, AText);
      end
    else
      Result := False;
  end;
var
  UltPer: String;
begin
  if cbEmisionMes.Checked then
    Verificar(ppPerEmisionMes.Periodo.Valor = '', ppPerEmisionMes, 'Debe ingresar el periodo contable');

  if cbEvolMesesMoviles.Checked then
    begin
      Verificar(ppPerMesMovilDesde.Periodo.Valor = '', ppPerMesMovilDesde, 'Debe ingresar el periodo contable desde');
      Verificar(ppPerMesMovilHasta.Periodo.Valor = '', ppPerMesMovilHasta, 'Debe ingresar el periodo contable hasta');
      Verificar(ppPerMesMovilDesde.Periodo.Valor > ppPerMesMovilHasta.Periodo.Valor, ppPerMesMovilDesde, 'El periodo contable desde debe ser menor o igual que el hasta');
    end;

  if cbEmisAcumulada2Anios.Checked then
    begin
      Verificar(edEmisAcumAnio1.Value <= 1996, edEmisAcumAnio1, 'Debe ingresar el 1er. año');
      Verificar(edEmisAcumAnio2.Value <= 1996, edEmisAcumAnio2, 'Debe ingresar el 2do. año');
    end;

  if cbControles.Checked then
    Verificar(ppPerControles.Periodo.Valor = '', ppPerControles, 'Debe ingresar el periodo de cobertura');

  if cbRanking.Checked then
    begin
      Verificar(ppPer1Ranking.Periodo.Valor = '', ppPer1Ranking, 'Debe ingresar el 1er. periodo contable');
      Verificar(ppPer2Ranking.Periodo.Valor = '', ppPer2Ranking, 'Debe ingresar el 2do. periodo contable');

      UltPer := GetPeriodo(DBDate(), fpAnioMes);
      Verificar(ppPer1Ranking.Periodo.Valor > UltPer, ppPer1Ranking, 'El 1er. periodo contable debe ser menor o igual al periodo de la fecha actual');
      Verificar(ppPer2Ranking.Periodo.Valor > UltPer, ppPer2Ranking, 'El 2do. periodo contable debe ser menor o igual al periodo de la fecha actual');

      Verificar(edCantClientesRanking.Value <= 0, edCantClientesRanking, 'Debe ingresar la cantidad de clientes');
    end;

  if cbPrincipalesClientes.Checked then
    begin
      Verificar(edAnioContPrincClientes.Value <= 1996, edAnioContPrincClientes, 'Debe ingresar el año contable');
      Verificar(edCantClientesPrincClientes.Value <= 0, edCantClientesPrincClientes, 'Debe ingresar la cantidad de clientes');
    end;

  if cbCalidadEstimacion.Checked then
    begin
      Verificar(ppPerCalidadEstim.Periodo.Valor = '', ppPerCalidadEstim, 'Debe ingresar el periodo contable');
      if MsgBox ('Tenga en cuenta que para la Calidad de Estimación se comparará el periodo ingresado con el ' + AddPeriodo(ppPerCalidadEstim.Periodo.Valor, -1) + '. ¿Desea continuar?', MB_YESNO + MB_ICONQUESTION ) = IDNO then
        Abort;
    end;

  if cbEmpresasConDiferencias.Checked then
    begin
      Verificar(ppEmprDiferencias.Periodo.Valor = '', ppEmprDiferencias, 'Debe ingresar el periodo contable');
      Verificar(edCantClientesEmprDiferencias.Value <= 0, edCantClientesEmprDiferencias, 'Debe ingresar la cantidad de clientes');
    end;

  if cbCadenciaEstimacion.Checked then
    Verificar(ppCadenciaEstimac.Periodo.Valor = '', ppCadenciaEstimac, 'Debe ingresar el periodo contable');

  Result := True;
end;
{------------------------------------------------------------------------------}
end.

