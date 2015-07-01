unit unFraABM_ACT_CONTACTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraABMFrame, SDEngine, DB, AdvToolBar, AdvToolBarStylers,
  Grids, BaseGrid, AdvGrid, DBAdvGrid, AdvGlowButton, FormPanel, StdCtrls,
  AdvEdit, DBAdvEd, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraTelefono,
  AdvMenus, AdvMenuStylers, ExtCtrls;

type
  TfraABM_ACT_CONTACTO = class(TART_ABMFrame)
    sdqConsultaFrameCT_ID: TFloatField;
    sdqConsultaFrameCT_IDEMPRESA: TFloatField;
    sdqConsultaFrameCT_CONTACTO: TStringField;
    sdqConsultaFrameCT_CARGO: TStringField;
    sdqConsultaFrameCT_AREA: TStringField;
    sdqConsultaFrameCT_CODAREATELEFONOS: TStringField;
    sdqConsultaFrameCT_TELEFONOS: TStringField;
    sdqConsultaFrameCT_CODAREAFAX: TStringField;
    sdqConsultaFrameCT_FAX: TStringField;
    sdqConsultaFrameCT_DIRELECTRONICA: TStringField;
    sdqConsultaFrameCT_FECHAALTA: TDateTimeField;
    sdqConsultaFrameCT_USUALTA: TStringField;
    sdqConsultaFrameCT_FECHAMODIF: TDateTimeField;
    sdqConsultaFrameCT_USUMODIF: TStringField;
    sdqConsultaFrameCT_FECHABAJA: TDateTimeField;
    sdqConsultaFrameCT_USUBAJA: TStringField;
    sdqConsultaFrameCT_AREACARGA: TStringField;
    sdqConsultaFrameCT_TIPODOCUMENTO: TStringField;
    sdqConsultaFrameCT_NUMERODOCUMENTO: TStringField;
    sdqConsultaFrameCT_FIRMANTE: TStringField;
    edCT_CONTACTO: TDBAdvEdit;
    DBAdvEdit2: TDBAdvEdit;
    DBAdvEdit5: TDBAdvEdit;
    DBAdvEdit6: TDBAdvEdit;
    sdqConsultaFrameTELEFONO: TStringField;
    sdqConsultaFrameFAX: TStringField;
    fraCargo: TfraStaticCTB_TABLAS;
    Label1: TLabel;
    fraArea: TfraStaticCTB_TABLAS;
    Label2: TLabel;
    sdqConsultaFrameCARGO: TStringField;
    sdqConsultaFrameAREA: TStringField;
    fraTelefonos: TfraTelefono;
    procedure AfterClose(DataSet: TDataSet);
    procedure fpDatosShow(Sender: TObject);
    procedure BeforeEdit(DataSet: TDataSet);
    procedure BeforePost(DataSet: TDataSet);
    procedure BeforeInsert(DataSet: TDataSet);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraABM_ACT_CONTACTO: TfraABM_ACT_CONTACTO;

implementation

uses unSesion, CustomDlgs;

{$R *.dfm}

constructor TfraABM_ACT_CONTACTO.Create(AOwner: TComponent);
begin
  inherited;
  fraCargo.Clave := 'CARGO';
  fraArea.Clave := 'AREA';
  fraTelefonos.Initialize(False, 'TN_IDCONTACTO', 'TN', 'ATN_TELEFONOCONTACTO');
end;

procedure TfraABM_ACT_CONTACTO.AfterClose(DataSet: TDataSet);
begin
  inherited;
  fraTelefonos.QuitarTelefonosTemporales;
end;

procedure TfraABM_ACT_CONTACTO.fpDatosShow(Sender: TObject);
begin
  inherited;
  fraTelefonos.Clear(True);
  fraCargo.Clear;
  fraArea.Clear;
end;

procedure TfraABM_ACT_CONTACTO.BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  try
    fraCargo.Value := FieldByName('CT_CARGO').AsString;
    fraArea.Value := FieldByName('CT_AREA').AsString;
    fraTelefonos.FillCombo(True, FieldByName('CT_ID').AsInteger);
    fraTelefonos.ShowCargaRapida := False;
  except
  end;
end;

procedure TfraABM_ACT_CONTACTO.BeforePost(DataSet: TDataSet);
begin
  Verificar(Trim(edCT_CONTACTO.Text) = EmptyStr, edCT_CONTACTO, 'Debe completar el nombre del contacto.');
  inherited;
  with DataSet do
  try
    FieldByName('CT_CARGO').AsString := fraCargo.Value;
    FieldByName('CT_AREA').AsString := fraArea.Value;
    FieldByName('CT_AREACARGA').AsString := Sesion.Sector;
    FieldByName('CT_IDEMPRESA').AsInteger := TSDQuery(DataSet).Params[0].AsInteger;

    if not fraTelefonos.AutoCommit then
      fraTelefonos.CopiarTempATelefonos(FieldByName('CT_ID').AsInteger);
  except
  end;
end;

procedure TfraABM_ACT_CONTACTO.BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  fraTelefonos.ShowCargaRapida := True;
end;

end.
