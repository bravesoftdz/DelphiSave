unit unConvertirEnConvenio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, ExtCtrls, unArt, General;

type
  TTipoConvenio = (tcConvenio, tcConvenioCuotaBonif);

type
  TfrmConvertirEnConvenio = class(TForm)
    Bevel1: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    fraPP_ARTFIRMANTE: TfraStaticCodigoDescripcion;
    edPP_ARTDOCUMENTO: TEdit;
    edPP_ARTCARACTER: TEdit;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edPP_EMPDOCUMENTO: TEdit;
    edPP_EMPCARACTER: TEdit;
    edPP_EMPFIRMANTE: TEdit;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CambiaFirmante(Sender: TObject);
  private
    FConTrans: Boolean;
    FId: TTableId;
    FTipoConvenio: TTipoConvenio;
  public
    property ConTrans    : Boolean       read FConTrans     write FConTrans;
    property Id          : TTableId      read FId           write FId;
    property TipoConvenio: TTipoConvenio read FTipoConvenio write FTipoConvenio;
  end;

implementation

{$R *.DFM}

uses
  unDmPrincipal, AnsiSql, unCobranzas, VCLExtra, unPrincipal;

procedure TfrmConvertirEnConvenio.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'UPDATE ZPP_PLANPAGO ' +
      ' SET PP_ESTADO = ' + SqlValue(String(Iif(TipoConvenio = tcConvenio, '06', '14'))) +
         ', PP_ARTFIRMANTE  = ' + SqlValue(fraPP_ARTFIRMANTE.CmbDescripcion.Text) +
         ', PP_ARTDOCUMENTO = ' + SqlValue(edPP_ARTDOCUMENTO.Text) +
         ', PP_ARTCARACTER  = ' + SqlValue(edPP_ARTCARACTER.Text) +
         ', PP_EMPFIRMANTE  = ' + SqlValue(edPP_EMPFIRMANTE.Text) +
         ', PP_EMPDOCUMENTO = ' + SqlValue(edPP_EMPDOCUMENTO.Text) +
         ', PP_EMPCARACTER  = ' + SqlValue(edPP_EMPCARACTER.Text) +
         ', PP_FECHAMODIF = SYSDATE ' +
         ', PP_USUMODIF = ' + SqlValue( frmPrincipal.DBLogin.UserId) +
    ' WHERE PP_ID = ' + SqlValue(FId);

  if ConTrans then
    BeginTrans;

  try
    Redevengar_PeriodosPlan(FId);
    EjecutarSqlST(sSql);

    if TipoConvenio = tcConvenio then  // si es conv. cuota bonificada no va a tener valores cargados, así que queda en el estado cargado 14
      ActualizarEstadoPlanPago(FId, frmPrincipal.DBLogin.UserId);

    Actualizar_MontoRefinanciado(FId);

    if ConTrans then
      CommitTrans;

    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtWarning, [mbOK], 0);
      if ConTrans then
        RollBack;
    end;
  end;
end;

procedure TfrmConvertirEnConvenio.btnCancelarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrCancel;
end;

procedure TfrmConvertirEnConvenio.FormCreate(Sender: TObject);
begin
  with fraPP_ARTFIRMANTE do
  begin
    TableName   := 'CFI_FIRMA';
    FieldID     := 'FI_ID';
    FieldCodigo := 'FI_ID';
    FieldDesc   := 'FI_FIRMANTE';
    FieldBaja   := 'FI_FECHABAJA';
    ShowBajas   := True;
    OnChange    := CambiaFirmante;
  end;

  edPP_EMPDOCUMENTO.Text := 'D.N.I. Nº ';

  VCLExtra.LockControls([edPP_ARTDOCUMENTO, edPP_ARTCARACTER], True);
end;

procedure TfrmConvertirEnConvenio.CambiaFirmante(Sender: TObject);
var
  sSql: String;
begin
  if fraPP_ARTFIRMANTE.IsSelected then
  begin
    sSql :=
      'SELECT FI_DOCUMENTO, FI_CARACTER' +
       ' FROM CFI_FIRMA' +
      ' WHERE FI_ID = :p1';

    with GetQueryEx(sSql, [fraPP_ARTFIRMANTE.Value]) do
    try
      if not IsEmpty then
      begin
        edPP_ARTDOCUMENTO.Text := FieldByName('FI_DOCUMENTO').AsString;
        edPP_ARTCARACTER.Text  := FieldByName('FI_CARACTER').AsString;
      end;
    finally
      Free;
    end;
  end
  else
  begin
    edPP_ARTDOCUMENTO.Text := 'D.N.I. Nº ';
    edPP_ARTCARACTER.Text  := '';
  end;
end;

end.
