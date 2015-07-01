
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
  ToolWin, unArtDBAwareFrame, ImgList;

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
    ilByN: TImageList;
    ilColor: TImageList;
    chkFU_SOLOLECTURA: TCheckBox;
    chkBajas: TCheckBox;
    Panel1: TPanel;
    pnlTotal: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure cmbCopPerfAceptarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure chkBajasClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbModificarClick(Sender: TObject);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
    procedure EnableButtons(AEnabled : Boolean = True); override;
  public
    procedure RefreshData; override;  
  end;

var
  frmManFFU_FORMULARIOUSUARIO: TfrmManFFU_FORMULARIOUSUARIO;

implementation

uses
  unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unSesion, General, unArt;

{$R *.DFM}

procedure TfrmManFFU_FORMULARIOUSUARIO.ClearControls;
begin
  chkFU_SOLOLECTURA.Checked := False;
  fraFU_IDFORMULARIO.Locked := False;
  fraFU_IDFORMULARIO.Clear;
  fraFU_IDFORMULARIO.ExtraCondition := ' AND FO_ID NOT IN ( SELECT FU_IDFORMULARIO ' +
                                                             'FROM FFU_FORMULARIOUSUARIO ' +
                                                            'WHERE FU_USUARIO = ' + SQLValue(fraFU_USUARIO.Value) +
                                                             ' AND FU_FECHABAJA IS NULL ) ';
end;

function TfrmManFFU_FORMULARIOUSUARIO.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.PrimaryKey.Add('FU_USUARIO', fraFU_USUARIO.Value);
  case ModoABM of
    maAlta:
    begin
      Sql.PrimaryKey.Add('FU_IDFORMULARIO', fraFU_IDFORMULARIO.Value);
      Sql.Fields.Add('FU_USUALTA', Sesion.UserID);
      Sql.Fields.Add('FU_FECHAALTA', exDateTime);
    end;
    maBaja:
    begin
      Sql.PrimaryKey.Add('FU_IDFORMULARIO', sdqConsulta.FieldByName('FU_IDFORMULARIO').AsInteger);
      Sql.Fields.Add('FU_USUBAJA', Sesion.UserID);
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
  Sql.Fields.Add('FU_SOLOLECTURA', iif(chkFU_SOLOLECTURA.Checked, 'S', 'N'), dtString);
  Result := inherited DoABM;
end;

procedure TfrmManFFU_FORMULARIOUSUARIO.FormCreate(Sender: TObject);
begin
  FSQL := sdqConsulta.SQL.Text;
  inherited;
  if Sesion.Sector <> 'COMPUTOS' Then
    fraFU_USUARIO.Sector := Sesion.Sector;

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
    ShowBajas   := True;
  end;
end;

function TfrmManFFU_FORMULARIOUSUARIO.Validar: Boolean;
begin
  Verificar(fraFU_IDFORMULARIO.IsEmpty, fraFU_IDFORMULARIO.edCodigo, 'Debe seleccionar un Formulario');
  Verificar((ModoABM = maAlta) and fraFU_IDFORMULARIO.IsBaja, fraFU_IDFORMULARIO.edCodigo, 'Al dar de alta un vínculo de este estilo el formulario seleccionado no debería estar dado de baja.');  
  Result := True;
end;

procedure TfrmManFFU_FORMULARIOUSUARIO.RefreshData;
var
  sSQL: String;
begin
  if fraFU_USUARIO.IsSelected Then
  begin
    sdqConsulta.ParamByName('SE_USUARIO').AsString := fraFU_USUARIO.Value;

    sSQL := FSQL;
    if chkBajas.Checked then
      AddCondition(sSQL, ' FU_FECHABAJA IS NULL ');
    sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
    inherited RefreshData;
  end
  else
    ClearData;
end;

procedure TfrmManFFU_FORMULARIOUSUARIO.LoadControls;
begin
  fraFU_IDFORMULARIO.Locked := True;
  fraFU_IDFORMULARIO.Value  := sdqConsulta.FieldByName('FU_IDFORMULARIO').Value;
  chkFU_SOLOLECTURA.Checked := sdqConsulta.FieldByName('FU_SOLOLECTURA').AsString = 'S';
end;

procedure TfrmManFFU_FORMULARIOUSUARIO.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CheckButtons;
end;

procedure TfrmManFFU_FORMULARIOUSUARIO.EnableButtons(AEnabled: Boolean);
begin
  inherited EnableButtons(AEnabled);
//  tbModificar.Enabled := tbModificar.Enabled and (not IsBaja);
  tbEliminar.Enabled  := tbEliminar.Enabled and (not IsBaja);
end;

procedure TfrmManFFU_FORMULARIOUSUARIO.tbPropiedadesClick(Sender: TObject);
begin
  if fpCopiarPerfil.ShowModal = mrOk Then
    sdqConsulta.Refresh;
end;

procedure TfrmManFFU_FORMULARIOUSUARIO.cmbCopPerfAceptarClick(Sender: TObject);
begin
  EjecutarStore('FAX.DoCopiarPerfil(' + SqlValue(fraFU_USUARIO_Copia.Value) + ', ' +
                                        SqlValue(fraFU_USUARIO.Value) + ', ' +
                                        SqlValue(Sesion.UserID) + ');');
end;

procedure TfrmManFFU_FORMULARIOUSUARIO.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(Field.FieldName, ['FU_SOLOLECTURA']) and (sdqConsulta.FieldByName('FU_SOLOLECTURA').AsString = 'S') then
  begin
    AFont.Style := AFont.Style + [fsBold];
    AFont.Color := clMaroon;
  end;
  if AreIn(Field.FieldName, ['FO_DESCRIPCION']) and (not sdqConsulta.FieldByName('FO_FECHABAJA').IsNull) then
    AFont.Color := clRed;

  if (not sdqConsulta.FieldByName('FU_FECHABAJA').IsNull) then
    AFont.Color := clRed;
end;

procedure TfrmManFFU_FORMULARIOUSUARIO.chkBajasClick(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmManFFU_FORMULARIOUSUARIO.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pnlTotal.Caption := 'Total: ' + IntToStr(sdqConsulta.RecordCount);
end;

procedure TfrmManFFU_FORMULARIOUSUARIO.tbModificarClick(Sender: TObject);
begin
  if IsBaja then
  begin
    if MsgAsk('El formulario ha sido dado de baja para el usuario indicado.' + CRLF + '¿Desea reactivarlo?') then
      inherited;
  end else
    inherited;
end;

end.
