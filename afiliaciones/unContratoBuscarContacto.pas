unit unContratoBuscarContacto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DB, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, VCLExtra;

type
  TDocumento = record
    Numero: String;
    Tipo: String;
  end;


  TDatosContacto = record
    CaracterFirma: String;
    Nombre : String;
    Documento: TDocumento;
    Email: String;
    Id: Integer;
    Sexo: String;
    TipoFirma: String;
  end;

  TfrmContratoBuscarContacto = class(TForm)
    gbBuscarContacto: TGroupBox;
    btnSeleccionar: TButton;
    btnCancelar: TButton;
    GridBuscarContacto: TArtDBGrid;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    procedure btnSeleccionarClick(Sender: TObject);
    procedure CargarListaContacto(const aIdContrato: Integer);
    procedure btnCancelarClick(Sender: TObject);
    procedure GridBuscarContactoDblClick(Sender: TObject);
  private
    procedure Seleccionar;
  public
    FDatosCOntacto: TDatosContacto;
  end;

var
  frmContratoBuscarContacto: TfrmContratoBuscarContacto;

implementation

{$R *.dfm}

procedure TfrmContratoBuscarContacto.btnSeleccionarClick(Sender: TObject);
begin
  Seleccionar;
end;

procedure TfrmContratoBuscarContacto.CargarListaContacto(const aIdContrato: Integer);
begin
  FDatosContacto.Id := -1;
  sdqDatos.ParamByName('co_contrato').AsInteger := aIdContrato;
  sdqDatos.Open;
  DynColWidthsByData(GridBuscarContacto);
end;

procedure TfrmContratoBuscarContacto.btnCancelarClick(Sender: TObject);
begin
  ModalResult := MrCancel;
  sdqDatos.Close;
end;

procedure TfrmContratoBuscarContacto.GridBuscarContactoDblClick(Sender: TObject);
begin
  Seleccionar;
end;

procedure TfrmContratoBuscarContacto.Seleccionar;
begin
  with sdqDatos do
  begin
    FDatosContacto.Id               := FieldByName('ct_id').AsInteger;
    FDatosContacto.Documento.Tipo   := FieldByName('ct_tipodocumento').AsString;
    FDatosContacto.Documento.Numero := FieldByName('ct_numerodocumento').AsString;
    FDatosContacto.Sexo             := FieldByName('ct_sexo').AsString;
    FDatosContacto.CaracterFirma    := FieldByName('ct_idcaracterfirma').AsString;
    FDatosContacto.TipoFirma        := FieldByName('ct_tipofirma').AsString;
    FDatosContacto.Nombre           := FieldByName('ct_contacto').AsString;
  end;
  ModalResult := MrOk;
end;

end.
