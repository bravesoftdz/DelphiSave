unit unManEntidadesOficiantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, DBCtrls, Mask, unArtFrame,
  unFraCodigoDescripcion, AnsiSql, unCustomDataModule;

type
  TfrmManEntidadesOficiantes = class(TfrmCustomGridABM)
    lblDescripcion: TLabel;
    edNombre: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    { Private declarations }
  public
    { Public declarations }
    class procedure MostrarAbm;
  end;



implementation

uses unDmPrincipal, unPrincipal, unSesion, CustomDlgs, SqlFuncs, General, StrFuncs;


{$R *.dfm}

procedure TfrmManEntidadesOficiantes.ClearControls;
begin
  edNombre.Clear;
end;
{------------------------------------------------------------------------------}
function TfrmManEntidadesOficiantes.DoABM: Boolean;
begin

  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('EO_ID', sdqConsulta.FieldByName('EO_ID').AsInteger );
      Sql.Fields.Add('EO_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('EO_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('EO_DESCRIPCION', edNombre.Text);

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('EO_ID', GetSecNextVal('LEGALES.SEQ_LEO_ID'));
        Sql.Fields.Add('EO_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('EO_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('EO_ID', sdqConsulta.FieldByName('EO_ID').AsInteger);
        Sql.Fields.Add('EO_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('EO_FECHAMODIF', exDateTime );
        Sql.Fields.Add('EO_USUBAJA', exNull );
        Sql.Fields.Add('EO_FECHABAJA', exNull );
      end;
    end;

    EjecutarSqlST(Sql.Sql);
    Result := true;
  except
    on e: Exception do
      begin
        result := false;
        MsgBox('Error al actualizar la entidad.' + #13#10 + e.Message, MB_ICONERROR, 'ABM Entidades')
      end;
  end;

end;
{------------------------------------------------------------------------------}
procedure TfrmManEntidadesOficiantes.LoadControls;
begin
  with sdqConsulta do
  begin
    edNombre.Text          := FieldByName('EO_DESCRIPCION').AsString;
  end;
end;
{------------------------------------------------------------------------------}
function TfrmManEntidadesOficiantes.Validar: Boolean;
begin
  Result := True;
  VerificarMultiple(['Mantenimiento de Abogados',
                     edNombre, not IsEmptyString(edNombre.text), 'Debe especificar un Nombre para la entidad'
                    ])
end;
{------------------------------------------------------------------------------}
procedure TfrmManEntidadesOficiantes.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'EO_FECHABAJA';
  Sql.TableName := 'LEGALES.LEO_ENTIDADOFICIANTE';
end;
{------------------------------------------------------------------------------}
procedure TfrmManEntidadesOficiantes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

class procedure TfrmManEntidadesOficiantes.MostrarAbm;
begin
   with TfrmManEntidadesOficiantes.Create(nil) do
  try
    FormStyle := fsNormal;
    Visible := false;
    ShowModal;
  finally
    free;
  end;
end;

end.
