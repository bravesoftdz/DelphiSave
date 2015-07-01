unit unConsultaTIFF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, SDEngine, unArtFrame,
  unFraVistaTIFF, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid;

type
  TfrmConsultaTIFF = class(TForm)
    grdConsulta: TArtDBGrid;
    fraVistaTIFF: TfraVistaTIFF;
    dsConsulta: TDataSource;
    sdqConsulta: TSDQuery;
    sdqConsultaCODIGO: TStringField;
    sdqConsultaDETALLE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    FConsulta: String;
    FCampoImagen: String;
  public
    property Consulta:    String        read FConsulta            write FConsulta;
    property CampoImagen: String        read FCampoImagen         write FCampoImagen;
  end;

var
  frmConsultaTIFF: TfrmConsultaTIFF;

implementation

{$R *.dfm}

uses General, unDmPrincipal;

procedure TfrmConsultaTIFF.FormCreate(Sender: TObject);
begin
  //sdqConsulta.Open;
end;

procedure TfrmConsultaTIFF.FormShow(Sender: TObject);
begin
  OpenQuery(sdqConsulta, FConsulta);
end;

procedure TfrmConsultaTIFF.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  try
    fraVistaTIFF.Image   := sdqConsulta.FieldByName(Trim(FCampoImagen)).AsString;
  except
    on E: Exception do
    begin
      fraVistaTIFF.Image   := '';
      Msgbox('Error al recuperar la imagen ');
    end;
  end;
end;

end.
