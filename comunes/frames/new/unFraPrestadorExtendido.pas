{Este frame quedó en la nada... :(  by PTD... }

unit unFraPrestadorExtendido;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxCurrEdit, rxToolEdit, {$ELSE} Placemnt, CurrEdit, ToolEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unfraCPR_PRESTADOR, DB, SDEngine, PatternEdit, IntEdit, StdCtrls, ArtComboBox, Mask,
  JvExControls, JvComponent, JvXPCore, JvXPButtons, FormPanel, JvXPCheckCtrls;

type
  TfraPrestadorExtendido = class(TfraCPR_PRESTADOR)
    btnNuevo: TJvXPButton;
    fpAltaPrestadorExterno: TFormPanel;
    btnBuscar: TJvXPButton;
    chkExterno: TJvXPCheckbox;
    lbExterno: TLabel;
    fpBusqueda: TFormPanel;
    btnGuardarAlta: TJvXPButton;
    btnCancelarAlta: TJvXPButton;
    btnAceptarBusqueda: TJvXPButton;
    btnCancelarBusqueda: TJvXPButton;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnGuardarAltaClick(Sender: TObject);
    procedure btnAceptarBusquedaClick(Sender: TObject);
  protected
    function  GetSql: string; override;
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure   Clear; override;    
  end;

var
  fraPrestadorExtendido: TfraPrestadorExtendido;

implementation

uses
  VCLExtra, AnsiSQL, SqlFuncs, CustomDlgs;

{$R *.dfm}

procedure TfraPrestadorExtendido.btnBuscarClick(Sender: TObject);
begin
  if fpBusqueda.ShowModal = mrOk then
  begin

  end;
end;

procedure TfraPrestadorExtendido.btnNuevoClick(Sender: TObject);
begin
  if MsgAsk('¿Realizó la búsqueda correspodiente anter de dar de alta?') then
    if fpAltaPrestadorExterno.ShowModal = mrOk then
    begin

    end;
end;

procedure TfraPrestadorExtendido.Clear;
begin
  inherited;
  chkExterno.Checked := False;
end;

constructor TfraPrestadorExtendido.Create(AOwner: TComponent);
begin
  inherited;
  VCLExtra.LockControls([edCA_DOMICILIO, edCA_LOCALIDAD, edCA_CODPOSTAL]);
end;

function TfraPrestadorExtendido.GetSql: string;
begin
  if FSql = '' Then
  begin
    Result := 'SELECT CA_CLAVE, CA_SECUENCIA, CA_IDENTIFICADOR, ' +
                     'CA_DESCRIPCION, CA_ASISTENCIAL, CA_DOMICILIO, CA_LOCALIDAD, ' +
                     'CA_CODPOSTAL, PV_DESCRIPCION AS PROVINCIA, CA_TELEFONO, CA_FECHABAJA, ' +
                     'CA_CONCERTADO, CA_IVA, CA_TIPOCOMPROBANTE ' +
                'FROM CPR_PRESTADOR WHERE 1=1 ';

    { Para compatibilidad con la base del cem, que esta en Access }
    SqlAddJoin ( Result, 'CPV_PROVINCIAS', 'CPR_PRESTADOR.CA_PROVINCIA', 'CPV_PROVINCIAS.PV_CODIGO', jtOuter );
  end else
    Result := FSql;
end;

procedure TfraPrestadorExtendido.SetLocked(const Value: Boolean);
begin
  inherited;
//
end;

procedure TfraPrestadorExtendido.btnGuardarAltaClick(Sender: TObject);
begin
//

  fpAltaPrestadorExterno.ModalResult := mrOk;
end;

procedure TfraPrestadorExtendido.btnAceptarBusquedaClick(Sender: TObject);
begin
//

  fpBusqueda.ModalResult := mrOk;
end;

end.
