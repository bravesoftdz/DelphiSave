unit unDatosLesion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm,
  ImgList, XPMenu, Placemnt, StdCtrls,
  unFraSLM_LESIONAGENTEMATERIAL, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCodDesc, unFraSLF_LESIONFORMA, unFraSLZ_LESIONZONA, unFraSLN_LESIONNATURALEZA,
  DB, SDEngine, unFraSLA_LESIONAGENTE, ExtCtrls;

type
  TfrmDatosLesion = class(TfrmCustomForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraDL_IDLESIONFORMA: TfraSLF_LESIONFORMA;
    fraDL_IDLESIONAGENTEMATERIAL: TfraSLM_LESIONAGENTEMATERIAL;
    Label3: TLabel;
    lbForma: TLabel;
    fraDL_IDLESIONNATURALEZA: TfraSLN_LESIONNATURALEZA;
    fraDL_IDLESIONZONA: TfraSLZ_LESIONZONA;
    Label6: TLabel;
    Label5: TLabel;
    sduDatos: TSDUpdateSQL;
    dsDatos: TDataSource;
    sdqDatos: TSDQuery;
    sdqDatosDL_ID: TFloatField;
    sdqDatosDL_IDEXPEDIENTE: TFloatField;
    sdqDatosDL_IDLESIONFORMA: TFloatField;
    sdqDatosDL_IDLESIONAGENTEMATERIAL: TFloatField;
    sdqDatosDL_IDLESIONNATURALEZA: TFloatField;
    sdqDatosDL_IDLESIONZONA: TFloatField;
    sdqDatosDL_USUALTA: TStringField;
    sdqDatosDL_FECHAALTA: TDateTimeField;
    sdqDatosDL_USUMODIF: TStringField;
    sdqDatosDL_FECHAMODIF: TDateTimeField;
    fraDL_IDLESIONAGENTECAUSANTE: TfraSLA_LESIONAGENTE;
    Label1: TLabel;
    sdqDatosDL_IDAGENTECAUSANTE: TFloatField;
    pnlFiltros: TPanel;
    lbTitulo: TLabel;
    lbSubtitulo: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure dsDatosUpdateData(Sender: TObject);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
  private
    FIDExpediente: integer;
    procedure SetIDExpediente(const Value: integer);
  public
    property IDExpediente: integer read FIDExpediente write SetIDExpediente;
  end;

var
  frmDatosLesion: TfrmDatosLesion;

implementation

uses unDmPrincipal, CustomDlgs, unSesion, unSinForm;

{$R *.dfm}

procedure TfrmDatosLesion.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraDL_IDLESIONAGENTEMATERIAL.IsSelected and (fraDL_IDLESIONAGENTEMATERIAL.IsSubTitulo or fraDL_IDLESIONAGENTEMATERIAL.IsTitulo), fraDL_IDLESIONAGENTEMATERIAL.edCodigo, Format(Msg_74, ['un agente']));
  Verificar(fraDL_IDLESIONAGENTEMATERIAL.IsSelected and fraDL_IDLESIONAGENTEMATERIAL.IsBaja, fraDL_IDLESIONAGENTEMATERIAL.edCodigo, Format(Msg_73, ['un agente']));
  Verificar(fraDL_IDLESIONFORMA.IsSelected and fraDL_IDLESIONFORMA.IsSubTitulo, fraDL_IDLESIONFORMA.edCodigo, Format(Msg_74, ['una forma']));
  Verificar(fraDL_IDLESIONFORMA.IsSelected and fraDL_IDLESIONFORMA.IsBaja, fraDL_IDLESIONFORMA.edCodigo, Format(Msg_73, ['una forma']));
  Verificar(fraDL_IDLESIONNATURALEZA.IsSelected and fraDL_IDLESIONNATURALEZA.IsBaja, fraDL_IDLESIONNATURALEZA.edCodigo, Format(Msg_73, ['una naturaleza']));
  Verificar(fraDL_IDLESIONZONA.IsSelected and fraDL_IDLESIONZONA.IsBaja, fraDL_IDLESIONZONA.edCodigo, Format(Msg_73, ['una zona']));
  Verificar(fraDL_IDLESIONAGENTECAUSANTE.IsSelected and fraDL_IDLESIONAGENTECAUSANTE.IsBaja, fraDL_IDLESIONAGENTECAUSANTE.edCodigo, Format(Msg_73, ['un agente']));
  Verificar((sdqDatos.State = dsInsert) and fraDL_IDLESIONFORMA.IsEmpty and fraDL_IDLESIONAGENTEMATERIAL.IsEmpty and fraDL_IDLESIONNATURALEZA.IsEmpty and fraDL_IDLESIONZONA.IsEmpty and fraDL_IDLESIONAGENTECAUSANTE.IsEmpty,
            btnAceptar, 'Si quiere guardar datos adicionales de la lesión debe seleccionar al menos algún dato.');

  sdqDatos.FieldByName('DL_IDEXPEDIENTE').AsInteger := IDExpediente;
  sdqDatos.Post;
  DoAplicarUpdates(sdqDatos);

  if fraDL_IDLESIONFORMA.IsEmpty and fraDL_IDLESIONAGENTEMATERIAL.IsEmpty and fraDL_IDLESIONNATURALEZA.IsEmpty and fraDL_IDLESIONZONA.IsEmpty and fraDL_IDLESIONAGENTECAUSANTE.IsEmpty then
  begin
    sdqDatos.Delete;
    DoAplicarUpdates(sdqDatos);
  end;

  ModalResult := mrOk;
end;

procedure TfrmDatosLesion.dsDatosUpdateData(Sender: TObject);
begin
  with sdqDatos do
  begin
    FieldByName('DL_IDLESIONFORMA').AsInteger := fraDL_IDLESIONFORMA.VariantValue;
    FieldByName('DL_IDLESIONZONA').AsInteger := fraDL_IDLESIONZONA.VariantValue;
    FieldByName('DL_IDLESIONNATURALEZA').AsInteger := fraDL_IDLESIONNATURALEZA.VariantValue;
    FieldByName('DL_IDLESIONAGENTEMATERIAL').AsInteger := fraDL_IDLESIONAGENTEMATERIAL.VariantValue;
    FieldByName('DL_IDAGENTECAUSANTE').AsInteger := fraDL_IDLESIONAGENTECAUSANTE.VariantValue;

    if State = dsInsert then
    begin
      FieldByName('DL_USUALTA').AsString      := Sesion.UserID;
      FieldByName('DL_FECHAALTA').AsDateTime  := DBDate;
      FieldByName('DL_ID').AsInteger          := 0;
    end else
    if State = dsEdit then
    begin
      FieldByName('DL_USUMODIF').AsString     := Sesion.UserID;
      FieldByName('DL_FECHAMODIF').AsDateTime := DBDate;
    end;
  end;
end;

procedure TfrmDatosLesion.SetIDExpediente(const Value: integer);
begin
  FIDExpediente := Value;
  sdqDatos.ParamByName('DL_IDEXPEDIENTE').AsInteger := Value;
  OpenQuery(sdqDatos);
  if sdqDatos.IsEmpty then
    sdqDatos.Insert
  else
    sdqDatos.Edit;
end;

procedure TfrmDatosLesion.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  if not sdqDatos.IsEmpty then
  with sdqDatos do
  begin
    fraDL_IDLESIONAGENTEMATERIAL.Value := FieldByName('DL_IDLESIONAGENTEMATERIAL').AsInteger;
    fraDL_IDLESIONFORMA.Value := FieldByName('DL_IDLESIONFORMA').AsInteger;
    fraDL_IDLESIONNATURALEZA.Value := FieldByName('DL_IDLESIONNATURALEZA').AsInteger;
    fraDL_IDLESIONZONA.Value := FieldByName('DL_IDLESIONZONA').AsInteger;
    fraDL_IDLESIONAGENTECAUSANTE.Value := FieldByName('DL_IDAGENTECAUSANTE').AsInteger;    
  end;
end;

end.
