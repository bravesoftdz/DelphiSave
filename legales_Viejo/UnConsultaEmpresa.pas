unit UnConsultaEmpresa;

{----------------------------------------------------------------------------------------------------------------------
   Modulo de Consulta de Empresa.
   Autor: EVila.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Db, SDEngine, ExtCtrls, Mask,
  ToolEdit, DateComboBox;

type
  TfrmConsultaEmpresa = class(TForm)
    btnSalir: TButton;
    sdqConsultaEmpresa: TSDQuery;
    Panel: TPanel;
    lbCUIT: TLabel;
    edmp_cuit: TEdit;
    edmp_nombre: TEdit;
    lbRazonSocial: TLabel;
    edmp_contrato: TEdit;
    lbContrato: TLabel;
    Label1: TLabel;
    edmp_calle: TEdit;
    lbNumero: TLabel;
    edmp_numero: TEdit;
    lbPiso: TLabel;
    edmp_piso: TEdit;
    lbDepartamento: TLabel;
    edmp_departamento: TEdit;
    lbLocalidad: TLabel;
    edmp_localidad: TEdit;
    edmp_cpostal: TEdit;
    lbCodigoPostal: TLabel;
    lbDescripcion: TLabel;
    edpv_descripcion: TEdit;
    lbTelefono: TLabel;
    edmp_telefonos: TEdit;
    lbContacto: TLabel;
    edmp_contacto: TEdit;
    edmp_fbaja: TDateComboBox;
    edEstado: TEdit;
    GroupBox1: TGroupBox;
    lbVigDesde: TLabel;
    edmp_vigenciadesde: TDateComboBox;
    lbVigHasta: TLabel;
    edmp_vigenciahasta: TDateComboBox;
    lbFechaBaja: TLabel;
    lbPeriodo: TLabel;
    edBaja: TEdit;
    LblBaja: TLabel;
  private
  public
    function GetExecute(ACuit: String): Boolean;
  end;

var
  frmConsultaEmpresa: TfrmConsultaEmpresa;

implementation

uses
	unDmPrincipal, AnsiSql;

{$R *.DFM}

function TfrmConsultaEmpresa.GetExecute(ACuit: String): Boolean;
begin
	with sdqConsultaEmpresa do
  begin
  	ParamByName('cuit').asString := ACuit;
   	Open;
   	edmp_cuit.Text          := FieldByName('mp_Cuit').AsString;
   	edmp_contrato.Text      := FieldByName('mp_Contrato').AsString;
   	edmp_nombre.Text        := FieldByName('mp_nombre').AsString;
   	edmp_calle.Text         := FieldByName('mp_calle').AsString;
   	edmp_numero.Text        := FieldByName('mp_numero').AsString;
   	edmp_piso.Text          := FieldByName('mp_piso').AsString;
   	edmp_departamento.Text  := FieldByName('mp_departamento').AsString;
   	edmp_localidad.Text     := FieldByName('mp_localidad').AsString;
   	edmp_cpostal.Text       := FieldByName('mp_cpostal').AsString;
   	edpv_descripcion.Text   := FieldByName('pv_descripcion').AsString;
   	edmp_telefonos.Text     := FieldByName('mp_telefonos').AsString;
   	edmp_contacto.Text      := FieldByName('mp_contacto').AsString;
   	edmp_vigenciadesde.Date := FieldByName('mp_vigenciadesde').AsDatetime;
   	edmp_vigenciahasta.Date := FieldByName('mp_vigenciahasta').AsDatetime;
   	edmp_fbaja.Date         := FieldByName('mp_fbaja').AsDatetime;
   	edEstado.Text 					:= ValorSQL('SELECT TB_Descripcion FROM CTB_TABLAS WHERE TB_CLAVE = ''AFEST'' AND TB_CODIGO = ' + SqlValue(FieldByName('mp_Estado').AsString));
   	edBaja.Text   					:= ValorSQL('SELECT TB_Descripcion FROM CTB_TABLAS WHERE TB_CLAVE = ''MOTIB'' AND TB_CODIGO = ' + SqlValue(FieldByName('mp_motivobaja').AsString));
   	sdqConsultaEmpresa.Close;
	end;

	// Muestra la ventana y devuelve Ok si todo esta bien.
  Result := ShowModal = mrOk;
end;

end.
