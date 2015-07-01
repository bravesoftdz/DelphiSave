unit unFrmMantenimientoNivelesAutorizacionRequerido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unFraCodigoDescripcion, unfraCodigoDescripcionExt, PatternEdit, IntEdit,
  Mask, ToolEdit, CurrEdit, DateComboBox, DBCtrls, unArtDBAwareFrame;

type
  TFrmAdministracionNivelesAutorizacionRequerido = class(TfrmCustomGridABM)
    lblNivel: TLabel;
    fraNivelAutorizacion: TfraCodigoDescripcionExt;
    edtMontoMinimo: TCurrencyEdit;
    lblMontoMinimo: TLabel;
    lblMontoMaximo: TLabel;
    edtMontoMaximo: TCurrencyEdit;
    edtCantidadPeriodosDesde: TIntEdit;
    lblPeriodosDesde: TLabel;
    lblPeriodoHasta: TLabel;
    IntEdit1: TIntEdit;
    edtFechaVigenciaDesde: TDateComboBox;
    lblVigenciaDesde: TLabel;
    Label10: TLabel;
    edtFechaVigenciaHasta: TDateComboBox;
    fpAsignacionUsuarios: TFormPanel;
    Label5: TLabel;
    btnAceptarAsignacionUsuario: TButton;
    btnCancelarAsignacionUsuario: TButton;
    edtNivelAutorizacion: TEdit;
    lbUsuariosAsignados: TDBListBox;
    lbUsuarios: TDBListBox;
    btnAgregar: TButton;
    btnQuitar: TButton;
    sdqUsuariosDisponibles: TSDQuery;
    sdqUsuariosAsignados: TSDQuery;
    dsUsuariosDisponibles: TDataSource;
    dsUsuariosAsignados: TDataSource;
    procedure tbPropiedadesClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarAsignacionUsuarioClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdministracionNivelesAutorizacionRequerido: TFrmAdministracionNivelesAutorizacionRequerido;

implementation

uses unDmEmision, unDmPrincipal, unCustomConsulta, CustomDlgs, DbFuncs, General, StrFuncs;

{$R *.dfm}

procedure TFrmAdministracionNivelesAutorizacionRequerido.tbPropiedadesClick(
  Sender: TObject);
begin
//  inherited;
  if sdqConsulta.RecordCount > 0 then
  begin
    BeginTrans(true);
    edtNivelAutorizacion.Text := sdqConsulta.FieldByName('NA_DESCRIPCION').AsString;
    sdqUsuariosDisponibles.ParamByName('idnivelautorizacion').AsInteger := sdqConsulta.FieldByName('NA_ID').AsInteger;
    sdqUsuariosDisponibles.Open;
    sdqUsuariosAsignados.ParamByName('idnivelautorizacion').AsInteger := sdqConsulta.FieldByName('NA_ID').AsInteger;
    sdqUsuariosAsignados.Open;
    fpAsignacionUsuarios.ShowModal;
  end;
end;

procedure TFrmAdministracionNivelesAutorizacionRequerido.btnAceptarClick(
  Sender: TObject);
begin
  try
    CommitTrans(true);
  finally
    fpAsignacionUsuarios.Close;
    sdqUsuariosDisponibles.Close;
    sdqUsuariosAsignados.Close;
  end;
end;

procedure TFrmAdministracionNivelesAutorizacionRequerido.btnCancelarAsignacionUsuarioClick(
  Sender: TObject);
begin
  try
    Rollback(true);
  finally
    fpAsignacionUsuarios.Close;
    sdqUsuariosDisponibles.Close;
    sdqUsuariosAsignados.Close;
  end;
end;

procedure TFrmAdministracionNivelesAutorizacionRequerido.btnAgregarClick(
  Sender: TObject);
begin
  if lbUsuarios.SelCount > 0 then
  begin
    EjecutarSql('INSERT INTO EMI.INU_NIVELAUTORIZACIONUSUARIO            '            +
                ' (NU_ID, NU_USUARIO, NU_IDNIVELAUTORIZACION, NU_USUALTA,'            +
                '  NU_FECHAALTA, NU_USUMODIF, NU_FECHAMODIF, NU_USUBAJA, '            +
                '  NU_FECHABAJA) '                                                    +
                'VALUES (:NU_ID, :NU_USUARIO, :NU_IDNIVELAUTORIZACION, :NU_USUALTA, ' +
                '        :NU_FECHAALTA, :NU_USUMODIF, :NU_FECHAMODIF, :NU_USUBAJA,  ' +
                '        :NU_FECHABAJA)');
  end;
end;

end.
