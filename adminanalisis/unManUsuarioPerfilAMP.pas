{-----------------------------------------------------------------------------
 Unit Name: unManUsuarioPerfilAMP
 Author:    racastro
 Date:      26-Jun-2008
 Purpose:   Mantenimiento de Usuarios con Perfiles AMP
 History:
-----------------------------------------------------------------------------}

unit unManUsuarioPerfilAMP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryPrint, ABMDialog, Db, SDEngine, PatternEdit, Mask, ToolEdit,
  CurrEdit, StdCtrls, FormPanel, ExtCtrls, EditDialog, RxLookup,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unfraUsuarios;

type
  TfrmManUsuariosPerfilesAMP = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    QueryPrint: TQueryPrint;
    fpABM: TFormPanel;
    bvSep1: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraPerfilAMP: TfraCodigoDescripcion;
    Label7: TLabel;
    Label2: TLabel;
    fraUsuario: TfraUsuario;
    sdqDatospu_usuario: TStringField;
    sdqDatospu_usualta: TStringField;
    sdqDatospu_usubaja: TStringField;
    sdqDatospu_usumodif: TStringField;
    sdqDatospu_fechaalta: TDateTimeField;
    sdqDatospu_fechabaja: TDateTimeField;
    sdqDatospu_fechamodif: TDateTimeField;
    sdqDatosse_nombre: TStringField;
    sdqDatospa_descripcion: TStringField;
    sdqDatospu_id: TFloatField;
    sdqDatospu_idperfil: TFloatField;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure btnAceptarClick(Sender: TObject);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure FormCreate(Sender: TObject);
  private
  public
    procedure Execute;
  end;

var
  frmManUsuariosPerfilesAMP: TfrmManUsuariosPerfilesAMP;

implementation

uses unPrincipal, unDmPrincipal, General, AnsiSql, CustomDlgs, StrFuncs;

{$R *.DFM}


{ TfrmManEstudios }

{-----------------------------------------------------------------------------
  Procedure: Execute
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmManUsuariosPerfilesAMP.Execute;
begin
  sdqDatos.Open;
  ABMDialog.Execute;
  sdqDatos.Close;
end;

{-----------------------------------------------------------------------------
  Procedure: ABMDialogBeforePrint
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject; var Cancel: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmManUsuariosPerfilesAMP.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
  QueryPrint.Print;
  Cancel := True;
end;

{-----------------------------------------------------------------------------
  Procedure: ABMDialogBeforeABM
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmManUsuariosPerfilesAMP.ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
begin
  if (ABMAction <> aaDelete) then
  begin
    Cancel := True;
    if (ABMAction = aaAdd) then
    begin
      fraUsuario.Limpiar;
      fraPerfilAMP.Clear;
    end else
    begin
      fraUsuario.edCodigo.Text:= sdqDatosPU_USUARIO.AsString;
      fraPerfilAMP.Value      := sdqDatosPU_IDPERFIL.AsInteger;
    end;
    fpABM.Tag := Integer(ABMAction);
    fpABM.ShowModal;
  end
end;

{-----------------------------------------------------------------------------
  Procedure: btnAceptarClick
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmManUsuariosPerfilesAMP.btnAceptarClick(Sender: TObject);
var
  Sql: String;
begin
  VerificarMultiple(['Carga de perfil',

                     fraUsuario,
                     fraUsuario.IsSelected,
                     'Debe indicar el Usuario del perfil',

                     fraPerfilAMP,
                     fraPerfilAMP.IsSelected,
                     'Debe indicar el perfil para el Usuario',

                     fraPerfilAMP,
                     not ((TABMActions(fpABM.Tag) = aaAdd) and
                          ExisteSqlEx ('SELECT 1 ' +
                                       '  FROM hys.hpu_perfilusuarioamp ' +
                                       ' WHERE pu_idperfil = :pidperfil ' +
                                       '   AND pu_usuario = :pusuario ',
                                       [fraPerfilAMP.Value, fraUsuario.edCodigo.Text])),
                     'Ya existe este perfil para el usuario',

                     fraPerfilAMP,
                     not ((TABMActions(fpABM.Tag) <> aaAdd) and
                          ExisteSqlEx ('SELECT 1 ' +
                                       '  FROM hys.hpu_perfilusuarioamp ' +
                                       ' WHERE pu_idperfil = :pidperfil ' +
                                       '   AND pu_usuario = :pusuario ' +
                                       '   AND pu_id <> :pid',
                                       [fraPerfilAMP.Value, fraUsuario.edCodigo.Text, sdqDatosPU_ID.AsInteger])),
                     'Ya existe este perfil para el usuario'
                     ]);

  if TABMActions(fpABM.Tag) = aaAdd then
    Sql := 'INSERT INTO hys.hpu_perfilusuarioamp ' +
           '(pu_id, pu_idperfil, pu_usuario, pu_usualta, pu_fechaalta) ' +
           'VALUES(hys.seq_hpu_id.NEXTVAL, ' +
                   SqlInteger( fraPerfilAMP.Value, True ) + ', ' +
                   SqlString( fraUsuario.edCodigo.Text, True ) + ', ' +
                   SqlString( frmPrincipal.DBLogin.LoginName, True ) + ', ' +
                   'SYSDATE) '
  else
    Sql := 'UPDATE hys.hpu_perfilusuarioamp ' +
              'SET pu_usuario = ' + SqlString( fraUsuario.edCodigo.Text, True ) + ', ' +
                  'pu_usubaja = NULL, ' +
                  'pu_fechabaja = NULL, ' +
                  'pu_usumodif = ' + SqlString( frmPrincipal.DBLogin.LoginName, True ) + ', ' +
                  'pu_fechamodif = SYSDATE, ' +
                  'pu_idperfil = ' + SqlInteger( fraPerfilAMP.Value, True ) +
              ' WHERE pu_id = ' + SqlInteger(sdqDatosPU_ID.AsInteger);

  try
    EjecutarSql(Sql);

    fpABM.ModalResult := mrOk ;
    RefreshAndLocate(sdqDatos, ['pu_id'], [sdqDatosPU_ID.AsInteger]);
  except
    on E: Exception do
      ErrorMsg(E);
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: QueryPrintGetCellParams
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmManUsuariosPerfilesAMP.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
  if not sdqDatosPU_FECHABAJA.IsNull Then
    AFont.Style := AFont.Style + [fsStrikeOut];
end;

{-----------------------------------------------------------------------------
  Procedure: FormCreate
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmManUsuariosPerfilesAMP.FormCreate(Sender: TObject);
begin
  with fraPerfilAMP do
  begin
    TableName     := 'hys.hpa_perfilamp';
    FieldID       := 'pa_id';
    FieldCodigo   := 'pa_id';
    FieldDesc     := 'pa_descripcion';
    FieldBaja     := 'pa_fechabaja';
  end;
end;

end.




