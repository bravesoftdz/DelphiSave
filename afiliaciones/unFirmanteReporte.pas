unit unFirmanteReporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, ImgList, XPMenu, Placemnt,
  StdCtrls, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion, ExtCtrls, Db;

type
  TfrmFirmanteReporte = class(TfrmCustomForm)
    GroupBox1: TGroupBox;
    fraFirmante: TfraStaticCodigoDescripcion;
    btnAceptar: TButton;
    btnCancelar: TButton;
    GroupBox2: TGroupBox;
    imgFirma: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure CargarFirma(Sender: TObject);
  private
    FDataIsLoaded: Boolean;
    FId: Integer;

    procedure SetId(const Value: Integer);
  public
    property Id: Integer read FId write SetId default 0;
  end;

var
  frmFirmanteReporte: TfrmFirmanteReporte;

implementation

uses
  AnsiSql, unDmPrincipal, General, unSesion, CustomDlgs;

{$R *.DFM}

{ TfrmFirmanteReporte }

procedure TfrmFirmanteReporte.SetID(const Value: Integer);
begin
  FId := Value;
end;

procedure TfrmFirmanteReporte.FormCreate(Sender: TObject);
begin
  inherited;

  FDataIsLoaded := False;

  with fraFirmante do
  begin
   ShowBajas   := True;
   TableName   := 'cfi_firma';
   FieldID     := 'fi_id';
   FieldCodigo := 'fi_id';
   FieldDesc   := 'fi_firmante';
   FieldBaja   := 'fi_fechabaja';
  end;
end;

procedure TfrmFirmanteReporte.FormShow(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  if not FDataIsLoaded then
  begin
    sSql :=
      'SELECT tb_descripcion, tb_especial1' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''FI_RE''' +
        ' AND tb_codigo = :codigo';
    with GetQueryEx(sSql, [FId]) do
    try
      Caption := Caption + FieldByName('tb_descripcion').AsString;
      fraFirmante.Value := StrToIntDef(FieldByName('tb_especial1').AsString, 0);
    finally
      FDataIsLoaded := True;
      Free;
    end;
    CargarFirma(nil);
  end;
end;

procedure TfrmFirmanteReporte.btnCancelarClick(Sender: TObject);
begin
  inherited;
  
  Close;
end;

procedure TfrmFirmanteReporte.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  Verificar(fraFirmante.IsEmpty, fraFirmante, 'Debe elegir el firmante.');

  sSql :=
    'UPDATE ctb_tablas' +
      ' SET tb_especial1 = :especial1,' +
          ' tb_usumodif = :usumodif,' +
          ' tb_fechamodif = actualdate' +
    ' WHERE tb_clave = ''FI_RE''' +
      ' AND tb_codigo = :codigo';
  EjecutarSqlEx(sSql, [fraFirmante.Value, Sesion.UserID, FId]);

  Close;
end;

procedure TfrmFirmanteReporte.CargarFirma(Sender: TObject);
var
  aStream: TStream;
  sSql: String;
begin
  inherited;

  sSql :=
    'SELECT fi_firma' +
     ' FROM cfi_firma' +
    ' WHERE fi_id = :id';
  with GetQueryEx(sSql, [StrToIntDef(fraFirmante.edCodigo.Text, 0)]) do
  try
    if not FieldByName('fi_firma').IsNull then
    begin
      aStream := CreateBlobStream(FieldByName('fi_firma'), bmReadWrite);
      try
        imgFirma.Picture.Bitmap.LoadFromStream(aStream);
      finally
        aStream.Free;
      end;
    end
    else
      imgFirma.Picture.Bitmap := nil;
  finally
    Free;
  end;
end;

end.
