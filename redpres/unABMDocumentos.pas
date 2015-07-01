unit unABMDocumentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, Placemnt;

type
  TfrmABMDocumentos = class(TForm)
    StaticText1: TStaticText;
    edCodigo: TEdit;
    StaticText2: TStaticText;
    edDescripcion: TEdit;
    btnAceptar: TBitBtn;
    BitBtn2: TBitBtn;
    FormPlacement1: TFormPlacement;
    procedure edCodigoExit(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
  public
  end;

var
  frmABMDocumentos: TfrmABMDocumentos;

implementation

uses
  unDmPrincipal, AnsiSql;

{$R *.DFM}

procedure TfrmABMDocumentos.edCodigoExit(Sender: TObject);
begin
  if edCodigo.Text = '' then
  begin
    MessageDlg('El campo CODIGO no debe estar vacío.', mtWarning, [mbOK], 0);
    edCodigo.SetFocus;
  end;
end;

procedure TfrmABMDocumentos.btnAceptarClick(Sender: TObject);
var
  cClave: String;
  ssql: String;
begin
  cClave := 'TDOCU';

  case btnAceptar.Tag of
    1:
    begin //---------------------- Agregar Documento
      ssql :=
        'Select tb_codigo' +
         ' From ctb_tablas' +
        ' Where tb_codigo = ' + SqlValue(edCodigo.Text) +
          ' And tb_clave = ' + SqlValue(cClave) +
          ' And tb_modulo = ''MUTUAL''';

      if unDmPrincipal.ExisteSQL(ssql) then
      begin
        MessageDlg('Ya existe un Documento con ese Código.', mtWarning, [mbOK], 0);
        edCodigo.Setfocus;
      end
      else
      begin
        ssql :=
          'Insert Into ctb_tablas (tb_clave, tb_codigo, tb_descripcion, tb_modulo)' +
                         ' Values (' + SqlValue(cClave) + ',' +
                                       SqlValue(edCodigo.Text) + ',' +
                                       SqlValue(edDescripcion.Text) + ',' +
                                       '''MUTUAL'')';
        unDmPrincipal.EjecutarSQL(ssql);
      end;
    end;
    2:
    begin //----------------------- Modificar Prestacion
      ssql :=
        'Update ctb_tablas' +
          ' Set tb_descripcion = ' + SqlValue(edDescripcion.Text) +
        ' Where tb_codigo = ' + SqlValue(edCodigo.Text) +
          ' And tb_clave = ''TDOCU''' +
          ' And tb_modulo = ''MUTUAL''';
      unDmPrincipal.EjecutarSQL(ssql);
    end;
  end;
end;

end.
