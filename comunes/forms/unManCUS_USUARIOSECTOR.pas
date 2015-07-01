unit unManCUS_USUARIOSECTOR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ImgList, ActnList, DBCtrls,
  unArtFrame, unfraUsuarios, unfraSectores;

type
  TfrmManCUS_USUARIOSECTOR = class(TfrmCustomGridABM)
    sdqConsultaCR_ID: TFloatField;
    sdqConsultaCR_DESCRIPCION: TStringField;
    sdqConsultaCR_CODIGO: TStringField;
    fpAsociacion: TFormPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    btnCerrar: TButton;
    dbgDisponibles: TArtDBGrid;
    dbgAsociados: TArtDBGrid;
    tbAsociacion: TToolBar;
    tbAgregar: TToolButton;
    tbQuitar: TToolButton;
    dsSectoresDisponibles: TDataSource;
    sdqSectoresDisponibles: TSDQuery;
    sdqSectoresAsociados: TSDQuery;
    dsSectoresAsociados: TDataSource;
    acListaDeAcciones: TActionList;
    acAgregar: TAction;
    acQuitar: TAction;
    Imagenes: TImageList;
    Label3: TLabel;
    Label4: TLabel;
    edCR_CODIGO: TEdit;
    fraUsuario: TfraUsuario;
    fraSectores: TfraSectores;
    Label5: TLabel;
    Label6: TLabel;
    edMemo: TDBMemo;
    edCR_DESCRIPCION: TMemo;
    ilByN: TImageList;
    ilColor: TImageList;
    procedure tbAgregarClick(Sender: TObject);
    procedure tbQuitarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure UsuarioChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChequeoBotones(DataSet: TDataSet);
    procedure fraUsuarioEnter(Sender: TObject);
    procedure SectorPropio(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
  private
    sSQL: string;
    procedure SectoresChange(Sender: TObject);
  public
    procedure Preparar;

    procedure RefreshData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
    function  DoABM: Boolean; override;
  end;

var
  frmManCUS_USUARIOSECTOR: TfrmManCUS_USUARIOSECTOR;

implementation

uses
  SqlFuncs, CustomDlgs, unDmPrincipal, General, unArt, unSesion;

{$R *.dfm}

procedure TfrmManCUS_USUARIOSECTOR.Preparar;
begin
  with sdqSectoresDisponibles do
  begin
    Close;
    ParamByName('CRITERIO').AsInteger := sdqConsulta.FieldByName('CR_ID').AsInteger;
    ParamByName('USUARIO').AsString := fraUsuario.UserID;
    sdqSectoresDisponibles.Open;
  end;
  with sdqSectoresAsociados do
  begin
    Close;
    ParamByName('CRITERIO').AsInteger := sdqConsulta.FieldByName('CR_ID').AsInteger;
    ParamByName('USUARIO').AsString := fraUsuario.UserID;
    sdqSectoresAsociados.Open;
  end;
end;

procedure TfrmManCUS_USUARIOSECTOR.tbAgregarClick(Sender: TObject);
begin
  if MsgAsk('¿Está seguro que desea asociar a ' + fraUsuario.Nombre + ' con el sector ' + sdqSectoresDisponibles.FieldByName('SC_DESCRIPCION').AsString + '?', 'Agregar') then
  begin
    EjecutarSQLEx('INSERT INTO COMUNES.CUS_USUARIOSECTOR (us_idusuario, us_idsector, us_criterio, us_id, us_usualta, us_fechaalta) ' +
                  'VALUES (:V1, :V2, :V3, COMUNES.SEQ_CUS_ID.NEXTVAL, :V4, SYSDATE)', [fraUsuario.ID, sdqSectoresDisponibles.FieldByName('SC_ID').AsInteger, sdqConsultaCR_ID.AsInteger, Sesion.UserID]);
    Preparar;
  end;
end;

procedure TfrmManCUS_USUARIOSECTOR.tbQuitarClick(Sender: TObject);
begin
  if MsgAsk('¿Está seguro que desea quitar la asociación de ' + fraUsuario.Nombre + ' con el sector ' + sdqSectoresAsociados.FieldByName('SC_DESCRIPCION').AsString + '?', 'Quitar') then
  begin
    EjecutarSQLEx('UPDATE COMUNES.CUS_USUARIOSECTOR SET us_fechabaja = sysdate, us_usubaja = :V1 ' +
                   'WHERE us_id = :V2', [fraUsuario.UserID, sdqSectoresAsociados.FieldByName('us_id').AsInteger]);
    Preparar;
  end;
end;

procedure TfrmManCUS_USUARIOSECTOR.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
//  fpAsociacion.Caption := sdqConsultaCR_DESCRIPCION.;
  fraUsuario.Limpiar;
  Preparar;
  fpAsociacion.ShowModal;
end;

procedure TfrmManCUS_USUARIOSECTOR.LoadControls;
begin
  with sdqConsulta do
  begin
    edCR_CODIGO.Text := FieldByName('CR_CODIGO').AsString;
    edCR_DESCRIPCION.Lines.Text := FieldByName('CR_DESCRIPCION').AsString;
  end;
  inherited;
end;

function TfrmManCUS_USUARIOSECTOR.Validar: Boolean;
begin
  Verificar(edCR_CODIGO.Text = EmptyStr, edCR_CODIGO, 'Debe completar el código.');
  Verificar(edCR_DESCRIPCION.Lines.Text = EmptyStr, edCR_DESCRIPCION, 'Debe completar la descripción.');
  Result := True;
end;

procedure TfrmManCUS_USUARIOSECTOR.ClearControls;
begin
  edCR_CODIGO.Clear;
  edCR_DESCRIPCION.Lines.Clear;
end;

function TfrmManCUS_USUARIOSECTOR.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'COMUNES.CCR_CRITERIO';

  try
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('CR_ID', sdqConsulta.FieldByName('CR_ID').AsInteger, False);
      Sql.SqlType := stDelete;
    end else
    begin
      if ModoABM = maAlta then
        begin
          Sql.PrimaryKey.Add('CR_ID', ValorSQLInteger('SELECT MAX(CR_ID) + 1 FROM COMUNES.CCR_CRITERIO'), False);
{
          Sql.Fields.Add('SE_FECHAALTA', exDateTime);
          Sql.Fields.Add('SE_USUALTA', Sesion.UserID);
}
          Sql.SqlType := stInsert;
        end
      else if ModoABM = maModificacion then
        begin
          Sql.PrimaryKey.Add('CR_ID', sdqConsulta.FieldByName('CR_ID').AsInteger, False);
{
          Sql.Fields.Add('SE_FECHAMODIF', exDateTime);
          Sql.Fields.Add('SE_USUMODIF', Sesion.UserID);
}
          Sql.SqlType := stUpdate;
        end;


      Sql.Fields.Add('CR_CODIGO', edCR_CODIGO.Text);
      Sql.Fields.Add('CR_DESCRIPCION', edCR_DESCRIPCION.Lines.Text);
    end;

    Result := inherited DoABM;
  except
    on E:Exception do
      Raise Exception.Create( E.Message + CRLF + 'Error al grabar el hecho.' );
  end;
end;

procedure TfrmManCUS_USUARIOSECTOR.RefreshData;
begin
  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManCUS_USUARIOSECTOR.UsuarioChange(Sender: TObject);
begin
  Preparar;
end;

procedure TfrmManCUS_USUARIOSECTOR.SectoresChange(Sender: TObject);
begin
  fraUsuario.Sector := fraSectores.Codigo;
  Preparar;
end;

procedure TfrmManCUS_USUARIOSECTOR.FormCreate(Sender: TObject);
begin
  inherited;
  sSQL := sdqConsulta.SQL.Text;
  fraUsuario.OnChange := UsuarioChange;
  fraSectores.OnChange := SectoresChange;
end;

procedure TfrmManCUS_USUARIOSECTOR.ChequeoBotones(DataSet: TDataSet);
begin
  inherited;
  tbAgregar.Enabled := not sdqSectoresDisponibles.IsEmpty and fraUsuario.IsSelected;
  tbQuitar.Enabled := not sdqSectoresAsociados.IsEmpty and fraUsuario.IsSelected;
end;

procedure TfrmManCUS_USUARIOSECTOR.fraUsuarioEnter(Sender: TObject);
begin
  inherited;
  fraUsuario.Sector := fraSectores.Codigo;
end;

procedure TfrmManCUS_USUARIOSECTOR.SectorPropio(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;
  if ((Sender as TARTDBGrid).DataSource.DataSet.FieldByName('SC_CODIGO').AsString = fraUsuario.Sector) then
    BackGround := TColor($C0DCC0)//clMoneyGreen
  else
    BackGround := clWhite;
end;

end.
