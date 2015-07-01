unit unABMFirmantes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, Placemnt;

type
  TfrmABMFirmantes = class(TForm)
    StaticText1: TStaticText;
    edCodigo: TEdit;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    StaticText2: TStaticText;
    edUsuario: TEdit;
    StaticText3: TStaticText;
    edTipoNroDoc: TEdit;
    StaticText4: TStaticText;
    edCaracter: TEdit;
    StaticText5: TStaticText;
    checkEspecial: TCheckBox;
    FormPlacement1: TFormPlacement;
    procedure edCodigoExit(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
  public
  end;

var
  frmABMFirmantes: TfrmABMFirmantes;

implementation

uses
  unDmPrincipal, AnsiSql;

{$R *.DFM}

procedure TfrmABMFirmantes.edCodigoExit(Sender: TObject);
begin
  if edCodigo.Text = '' then
  begin
    MessageDlg('El campo CODIGO no debe estar vacío.', mtWarning, [mbOK], 0);
    edCodigo.SetFocus;
  end;
end;

procedure TfrmABMFirmantes.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := '';
  case btnAceptar.Tag of
    1:
    begin //----------------------- Agregar Firmante
      ssql :=
        'Select df_codFirma' +
         ' From cdf_FirmasCartasDoc'+
        ' Where df_CodFirma = ' + SqlValue(edCodigo.Text);
      if unDmPrincipal.ExisteSQL(ssql) then
      begin
        MessageDlg('Ya existe un Firmante con ese Código.', mtWarning, [mbOK], 0);
        edCodigo.Setfocus;
      end
      else
      begin
        ssql :=
          'Insert Into cdf_FirmasCartasDoc (df_CodFirma, df_usuario, df_TipoNroDoc, df_Caracter, df_Especial)' +
                                  ' Values (' + SqlValue(edCodigo.Text) + ', ' + SqlValue(edUsuario.Text) + ', ' +
                                                SqlValue(edTipoNroDoc.Text) + ', ' + SqlValue(edCaracter.Text) + ',';
        if checkEspecial.Checked then
          ssql := ssql + '''NNNNNS'')'
        else
          ssql := ssql + '''NNNNNN'')';
      end;
    end;
    2:
    begin //----------------------- Modificar Firmante (Activo)
      ssql :=
        'Update cdf_FirmasCartasDoc'+
          ' Set df_Usuario = ' + SqlValue(edUsuario.Text) +
             ', df_TipoNroDoc = ' + SqlValue(edTipoNroDoc.Text) +
             ', df_Caracter = ' + SqlValue(edCaracter.Text);
      if checkEspecial.Checked then
        ssql := ssql + ', df_Especial = SubStr(df_Especial, 1, 5) || ''S'''
      else
        ssql := ssql + ', df_Especial = SubStr(df_Especial, 1, 5) || ''N''';

      ssql := ssql + ' Where df_CodFirma = ' + SqlValue(edCodigo.Text);
    end;
    3:
    begin //----------------------- Modificar Firmante (No activo) (dados de baja, al modificarlos los doy de alta nuevamente)
      ssql :=
        'Update cdf_firmasCartasDoc' +
          ' Set df_fbaja = null' +
        ' Where df_codfirma = ' + SqlValue(edCodigo.Text);
    end;
    4:
    begin  //---------------------- Eliminar Firmante (baja Lógica)
      ssql :=
        'Update cdf_FirmasCartasDoc' +
          ' Set df_fbaja = Actualdate' +
        ' Where df_CodFirma = ' + SqlValue(edCodigo.Text);
    end;
  end;

  if ssql <> '' then
    EjecutarSql(ssql);
end;

procedure TfrmABMFirmantes.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
