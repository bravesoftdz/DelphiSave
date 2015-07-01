unit unConsultaUsuariosExternos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, Mask, PatternEdit, IntEdit, RxLookup, Buttons, ImgList;

type
  TfrmConsultaUsuariosExternos = class(TfrmCustomGridABM)
    edUE_NOMBRE: TEdit;
    edUE_USUARIO: TEdit;
    lbCodigo: TLabel;
    Label2: TLabel;
    ilColor: TImageList;
    ilByN: TImageList;
    Label1: TLabel;
    edUE_MAIL: TEdit;
    procedure FormCreate(Sender: TObject);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmConsultaUsuariosExternos: TfrmConsultaUsuariosExternos;

implementation

{$R *.DFM}

uses
  unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unSesion;

{ TfrmConsultaProyectos }

procedure TfrmConsultaUsuariosExternos.ClearControls;
begin
  edUE_USUARIO.Clear;
  edUE_NOMBRE.Clear;
end;

function TfrmConsultaUsuariosExternos.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'CUE_USUARIOEXTERNO';

  if ModoABM = maBaja Then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('UE_ID', sdqConsulta.FieldByName('UE_ID').AsInteger);
    Sql.Fields.Add('UE_USUBAJA', Sesion.UserId);
    Sql.Fields.Add('UE_FECHABAJA', exDateTime);
  end
  else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.Add('UE_ID', 'SEQ_CUE_ID.NEXTVAL', False);
      Sql.Fields.Add('UE_USUALTA', Sesion.UserId);
      Sql.Fields.Add('UE_FECHAALTA', exDateTime);
    end
    else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('UE_ID', sdqConsulta.FieldByName('UE_ID').AsInteger);
      Sql.Fields.Add('UE_USUMODIF', Sesion.UserId);
      Sql.Fields.Add('UE_FECHAMODIF', exDateTime);
      Sql.Fields.Add('UE_USUBAJA', exNull);
      Sql.Fields.Add('UE_FECHABAJA', exNull);
    end;
    Sql.Fields.Add('UE_USUARIO', edUE_USUARIO.Text);
    Sql.Fields.Add('UE_NOMBRE', edUE_NOMBRE.Text);
    Sql.Fields.Add('UE_MAIL', edUE_MAIL.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmConsultaUsuariosExternos.LoadControls;
begin
  edUE_USUARIO.Text := sdqConsulta.FieldByName('UE_USUARIO').AsString;
  edUE_NOMBRE.Text  := sdqConsulta.FieldByName('UE_NOMBRE').AsString;
  edUE_MAIL.Text    := sdqConsulta.FieldByName('UE_MAIL').AsString;
end;

function TfrmConsultaUsuariosExternos.Validar: Boolean;
begin
  Verificar(edUE_USUARIO.Text = '', edUE_USUARIO, 'El usuario es obligatorio.');
  Verificar(edUE_NOMBRE.Text = '', edUE_NOMBRE, 'La descripción es obligatoria.');  
  Result := True;
end;

procedure TfrmConsultaUsuariosExternos.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'UE_FECHABAJA';
end;

end.
