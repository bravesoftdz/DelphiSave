unit unCambioEstado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, unArtFrame, unFraCodigoDescripcion,
  unfraCtbTablas, unArt, ExtCtrls, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  Mask, ToolEdit;

type
  TfrmCambioEstado = class(TForm)
    lbEstado: TLabel;
    lbNew: TLabel;
    btGuardar: TButton;
    btSalir: TButton;
    fraSA_ESTADO: TfraStaticCTB_TABLAS;
    fraEstadoNew: TfraStaticCTB_TABLAS;
    Bevel1: TBevel;
    edArchivo: TFilenameEdit;
    Label1: TLabel;
    Label2: TLabel;
    edComentario: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btSalirClick(Sender: TObject);
    procedure btGuardarClick(Sender: TObject);
  private
    FIdSolicitud: Integer;
    function SaveFile: boolean;
  public
    procedure DoCargaIDSolicitud(aId: Integer; aEstadoActual: String);
  end;

implementation

uses
  unPrincipal, AnsiSQL, SqlFuncs, General, unDmPrincipal, CustomDlgs, unConsultaSolicitud, unSesion,
  unAdministracionArchivosRecepcion;

const
  RUTA_ARCHIVOS = '\\ntintraweb\Storage_Data\Afiliaciones\ArchivosRecepcion\';

{$R *.DFM}

procedure TfrmCambioEstado.DoCargaIDSolicitud(aId: Integer; aEstadoActual: String);
begin
  FIdSolicitud := aId;
  fraSA_ESTADO.Value := aEstadoActual;
  fraEstadoNew.ExtraCondition := ' AND tb_codigo <> ''' + aEstadoActual + ''' ';
end;

procedure TfrmCambioEstado.FormCreate(Sender: TObject);
begin
  inherited;

  fraSA_ESTADO.Clave := 'ESSOL';
  fraEstadoNew.Clave := 'ESSOL';

  fraSA_ESTADO.ReadOnly := True;
  fraSA_ESTADO.ForeColor := clBtnFace;
end;

procedure TfrmCambioEstado.btSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCambioEstado.btGuardarClick(Sender: TObject);
var
  sSql: String;
begin
  //Verificar(fraEstadoNew.IsEmpty, fraEstadoNew.edCodigo, 'El campo Nuevo Estado es obligatorio.');
  Verificar(fraEstadoNew.IsEmpty and (edArchivo.Text = '') and (edComentario.Text = ''), fraEstadoNew, 'No hay nada para guardar.');


  BeginTrans;
  try
    sSql :=
      'UPDATE asa_solicitudafiliacion' +
        ' SET sa_estado = :estado,' +
            ' sa_fechamodif = actualdate,' +
            ' sa_usumodif = :usumodif' +
      ' WHERE sa_id = :id';

    if (fraEstadoNew.Value <> fraSA_ESTADO.Value) and (not fraEstadoNew.IsEmpty) then  //pedido de celeste en tk 56212 (en los coments)
      EjecutarSQLSTEx(sSql, [fraEstadoNew.Value, Sesion.UserID, FIdSolicitud]);

    if (edArchivo.Text <> '') or (edComentario.Text <> '') then
    begin
      sSql :=
        'INSERT INTO afi.aar_archivosrecepcion' +
        ' (ar_idsolicitudafiliacion, ar_fechaalta, ar_usualta, ar_nombrearchivo, ar_comentario, ar_razonadjunto)' +
        ' VALUES' +
        ' (:idsolicitud, SYSDATE, :usualta, :archivo, :comentario, ''Cambio Estado'')';

      EjecutarSQLSTEx(sSql, [FIdSolicitud, Sesion.UserID, ExtractFileName(edArchivo.FileName), edComentario.Text]);

      if (edArchivo.Text <> '') then
        SaveFile;
    end;

    CommitTrans;
    MsgBox('La modificación se realizó con éxito.', MB_ICONEXCLAMATION);
    ModalResult := mrOK;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg( E, 'Existe un error en la actualización.');
    end;
  end;
end;

function TfrmCambioEstado.SaveFile: boolean;
var
  sAmbiente: String;
  sTmp: String;
  sArchivoDestino : String;
  aId : Integer;
begin
  if Is_ConectadoProduccion then
    sAmbiente := 'Produccion'
  else
    sAmbiente := 'Desarrollo';

  aId := GetSecCurrVal('AFI.SEQ_AARSOLICITUD_ID');

  // Crea el directorio con el id de la revisión de precio..
  sTmp := Format('%s%s\%d', [RUTA_ARCHIVOS, sAmbiente, FIdSolicitud]);
  if not DirectoryExists(sTmp) then
    CreateDir(sTmp);

  // Crea el directorio con el id del archivo..
  sTmp := Format('%s%s\%d\%d', [RUTA_ARCHIVOS, sAmbiente, FIdSolicitud, aId]);
  if not DirectoryExists(sTmp) then
    CreateDir(sTmp);

  sArchivoDestino := Format('%s%s\%d\%d\%s', [RUTA_ARCHIVOS, sAmbiente, FIdSolicitud, aId, ExtractFileName(edArchivo.FileName)]);
  Result := CopyFile(PChar(edArchivo.FileName), PChar(sArchivoDestino), False);

end;

end.
