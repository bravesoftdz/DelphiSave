
{********************************************************}
{                                                        }
{    Mantenimiento de Formularios por Usuario            }
{    Esta tabla permite que los usuarios puedan acceder  }
{    únicamente a los faxes del tipo de formulario que   }
{    el administrador del sistema halla definido en este }
{    mantenimiento                                       }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha:  10/2003                                     }
{                                                        }
{********************************************************}

unit unManFFU_FORMULARIOUSUARIO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, StdCtrls, unArtFrame, unFraCodigoDescripcion,
  unFraUsuario, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, ExtCtrls,
  FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin;

type
  TfrmManFFU_FORMULARIOUSUARIO = class(TfrmCustomGridABM)
    fraFU_USUARIO: TfraUsuarios;
    lbUsuario: TLabel;
    fraFU_IDFORMULARIO: TfraCodigoDescripcion;
    lbFormulario: TLabel;
    fpCopiarPerfil: TFormPanel;
    Bevel1: TBevel;
    cmbCopPerfAceptar: TButton;
    cmbCopPerfCancelar: TButton;
    Label1: TLabel;
    fraFU_USUARIO_Copia: TfraUsuarios;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure cmbCopPerfAceptarClick(Sender: TObject);
  private
//    procedure OnfraFU_USUARIOChange(Sender: TObject);
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
    procedure EnableButtons(AEnabled : Boolean = True); override;
  public
  end;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFU_FORMULARIOUSUARIO.ClearControls;
begin
  fraFU_IDFORMULARIO.Locked := False;
  fraFU_IDFORMULARIO.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManFFU_FORMULARIOUSUARIO.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.PrimaryKey.Add('FU_USUARIO', fraFU_USUARIO.Value);
  case ModoABM of
    maAlta:
    begin
      Sql.PrimaryKey.Add('FU_IDFORMULARIO', fraFU_IDFORMULARIO.Value);
      Sql.Fields.Add('FU_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('FU_FECHAALTA', exDateTime);
    end;
    maBaja:
    begin
      Sql.PrimaryKey.Add('FU_IDFORMULARIO', sdqConsulta.FieldByName('FU_IDFORMULARIO').AsInteger);
      Sql.Fields.Add('FU_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('FU_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end;
    maModificacion:
    begin
      Sql.PrimaryKey.Add('FU_IDFORMULARIO', sdqConsulta.FieldByName('FU_IDFORMULARIO').AsInteger);
      Sql.Fields.Add('FU_USUBAJA', exNull);
      Sql.Fields.Add('FU_FECHABAJA', exNull);
    end;
  end;

  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFU_FORMULARIOUSUARIO.FormCreate(Sender: TObject);
begin
  inherited;
  if frmPrincipal.DBLogin.Sector <> 'COMPUTOS' Then
    fraFU_USUARIO.Sector := frmPrincipal.DBLogin.Sector;

  Sql.TableName := 'FFU_FORMULARIOUSUARIO';
  FieldBaja := 'FU_FECHABAJA';
  fraFU_USUARIO.OnChange := tbRefrescarClick;
  with fraFU_IDFORMULARIO do
  begin
    TableName   := 'FFO_FAXFORMULARIO';
    FieldID     := 'FO_ID';
    FieldCodigo := 'FO_ID';
    FieldDesc   := 'FO_DESCRIPCION';
    FieldBaja   := 'FO_FECHABAJA';
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManFFU_FORMULARIOUSUARIO.Validar: Boolean;
begin
  Result := False;
  if fraFU_IDFORMULARIO.IsEmpty Then
    InvalidMsg(fraFU_IDFORMULARIO.edCodigo, 'Debe seleccionar un Formulario')
  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFU_FORMULARIOUSUARIO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.ActManFormularioUsuario.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFU_FORMULARIOUSUARIO.RefreshData;
begin
  if fraFU_USUARIO.IsSelected Then
  begin
    sdqConsulta.ParamByName('SE_USUARIO').AsString := fraFU_USUARIO.Value;
    inherited;
  end
  else
    ClearData;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFU_FORMULARIOUSUARIO.LoadControls;
begin
  fraFU_IDFORMULARIO.Value := sdqConsulta.FieldByName('FU_IDFORMULARIO').AsInteger;
  fraFU_IDFORMULARIO.Locked := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFU_FORMULARIOUSUARIO.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CheckButtons;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFU_FORMULARIOUSUARIO.EnableButtons(AEnabled: Boolean);
begin
  inherited EnableButtons(AEnabled);
  tbModificar.Enabled := tbModificar.Enabled and IsBaja;
  tbEliminar.Enabled  := tbEliminar.Enabled  and (not IsBaja);
  //
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFU_FORMULARIOUSUARIO.tbPropiedadesClick(Sender: TObject);
begin
  if fpCopiarPerfil.ShowModal = mrOk Then
    sdqConsulta.Refresh;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFFU_FORMULARIOUSUARIO.cmbCopPerfAceptarClick(Sender: TObject);
begin
  EjecutarStore('FAX.DoCopiarPerfil(' + SqlValue(fraFU_USUARIO_Copia.Value) + ', ' +
                                        SqlValue(fraFU_USUARIO.Value) + ', ' +
                                        SqlValue(frmPrincipal.DBLogin.UserID) + ');');
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
