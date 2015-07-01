unit unManSegRetiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ComCtrls, QueryPrint, ABMDialog, SDEngine,
  PatternEdit, StdCtrls, ExtCtrls, FormPanel, EditDialog, Mask, unArtFrame,
  unFraDomicilio;

type
  TfrmManSegRetiro = class(TForm)
    fpEditor: TFormPanel;
    Label1: TLabel;
    lbRSocial: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Bevel2: TBevel;
    edRSocial: TEdit;
    edDirElectronica: TEdit;
    btnAceptar: TButton;
    btnCancelar: TButton;
    edCodigo: TPatternEdit;
    sdqDatos: TSDQuery;
    ABMDialog: TABMDialog;
    dsDatos: TDataSource;
    QueryPrint: TQueryPrint;
    pcDomicilios: TPageControl;
    tsDomParticular: TTabSheet;
    tsDomCapital: TTabSheet;
    Label2: TLabel;
    edPartFAX: TEdit;
    Label6: TLabel;
    edPartTelefonos: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edCapFAX: TEdit;
    edCapTelefonos: TEdit;
    sdqDatosUR_CODIGO: TStringField;
    sdqDatosUR_NOMBRE: TStringField;
    sdqDatosUR_CALLE: TStringField;
    sdqDatosUR_NUMERO: TStringField;
    sdqDatosUR_PISO: TStringField;
    sdqDatosUR_DEPARTAMENTO: TStringField;
    sdqDatosUR_LOCALIDAD: TStringField;
    sdqDatosUR_CPOSTAL: TStringField;
    sdqDatosUR_CPOSTALA: TStringField;
    sdqDatosUR_PROVINCIA: TStringField;
    sdqDatosPROVINCIA_PART: TStringField;
    sdqDatosUR_TELEFONOS: TStringField;
    sdqDatosUR_FAX: TStringField;
    sdqDatosUR_DIRCAP_CALLE: TStringField;
    sdqDatosUR_DIRCAP_NUMERO: TStringField;
    sdqDatosUR_DIRCAP_PISO: TStringField;
    sdqDatosUR_DIRCAP_DEPARTAMENTO: TStringField;
    sdqDatosUR_DIRCAP_LOCALIDAD: TStringField;
    sdqDatosUR_DIRCAP_CPOSTAL: TStringField;
    sdqDatosUR_DIRCAP_CPOSTALA: TStringField;
    sdqDatosUR_DIRCAP_PROVINCIA: TStringField;
    sdqDatosPROVINCIA_CAP: TStringField;
    sdqDatosUR_DIRCAP_TELEFONOS: TStringField;
    sdqDatosUR_DIRCAP_FAX: TStringField;
    sdqDatosUR_DIRELECTRONICA: TStringField;
    sdqDatosUR_FECHAALTA: TDateTimeField;
    sdqDatosUR_USUALTA: TStringField;
    sdqDatosUR_FECHAMODIF: TDateTimeField;
    sdqDatosUR_USUMODIF: TStringField;
    sdqDatosUR_FECHABAJA: TDateTimeField;
    sdqDatosUR_USUBAJA: TStringField;
    PrintDialog: TPrintDialog;
    edCUIT: TMaskEdit;
    Label7: TLabel;
    sdqDatosUR_CUIT: TStringField;
    fraPartDireccion: TfraDomicilio;
    fraCapDireccion: TfraDomicilio;
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
    procedure btnAceptarClick(Sender: TObject);
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure fpEditorBeforeShow(Sender: TObject);
  private
  public
    procedure Execute;
  end;

var
  frmManSegRetiro: TfrmManSegRetiro;

implementation

uses unDmPrincipal, General, AnsiSql, CUIT, Internet, CustomDLGs, unSesion;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSegRetiro.Execute;
begin
  OpenQuery(sdqDatos);
  ABMDialog.Execute;
  sdqDatos.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSegRetiro.ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
var
  Sql : String;
begin
   Cancel := True;
   if ABMAction = aaDelete then
   begin
    if (MsgBox( 'Se dispone a dar de baja la Aseguradora "' + sdqDatosUR_NOMBRE.AsString + '".' + #13 +
                '¿Esta usted Seguro?', MB_ICONEXCLAMATION + MB_YESNO) = IDYES) then
    begin
       Sql := 'UPDATE sur_seguroretiro ' +
                 'SET ur_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                    ' ur_fechabaja = actualdate ' +
               'WHERE ur_codigo = ' + SqlValue(sdqDatosUR_CODIGO.AsString);
       EjecutarSql(Sql);
       RefreshAndLocate(sdqDatos, ['UR_CODIGO'], [sdqDatosUR_CODIGO.AsString]);
    end;
   end
   else begin
     if ABMAction = aaAdd then
     begin
        edCodigo.Clear;
        edCodigo.ReadOnly := False;
        edRSocial.Clear;
        fraPartDireccion.Clear;
        edPartTelefonos.Clear;
        edPartFAX.Clear;
        fraCapDireccion.Clear;
        edCapTelefonos.Clear;
        edCapFAX.Clear;
        edDirElectronica.Clear;
        edCUIT.Clear;
     end else
     begin
        if not sdqDatosUR_FECHABAJA.IsNull then
           if (MsgBox('Se dispone a reincorporar una Aseguradora dada de baja.' + #13 + '¿Esta usted Seguro?', MB_ICONQUESTION + MB_YESNO) = IDNO) then
              Exit;

        edCodigo.Text           := sdqDatosUR_CODIGO.AsString;
        edCodigo.ReadOnly       := True;
        edCUIT.Text             := sdqDatosUR_CUIT.AsString;
        edRSocial.Text          := sdqDatosUR_NOMBRE.AsString;
        fraPartDireccion.Cargar(sdqDatosUR_CALLE.AsString, sdqDatosUR_CPOSTAL.AsString,
                                sdqDatosUR_LOCALIDAD.AsString, sdqDatosUR_NUMERO.AsString,
                                sdqDatosUR_PISO.AsString, sdqDatosUR_DEPARTAMENTO.AsString,
                                sdqDatosUR_PROVINCIA.AsString, sdqDatosUR_CPOSTALA.AsString);
        edPartTelefonos.Text    := sdqDatosUR_TELEFONOS.AsString;
        edPartFAX.Text          := sdqDatosUR_FAX.AsString;
        fraCapDireccion.Cargar(sdqDatosUR_DIRCAP_CALLE.AsString, sdqDatosUR_DIRCAP_CPOSTAL.AsString,
                               sdqDatosUR_DIRCAP_LOCALIDAD.AsString, sdqDatosUR_DIRCAP_NUMERO.AsString,
                               sdqDatosUR_DIRCAP_PISO.AsString, sdqDatosUR_DIRCAP_DEPARTAMENTO.AsString,
                               sdqDatosUR_DIRCAP_PROVINCIA.AsString, sdqDatosUR_DIRCAP_CPOSTALA.AsString);
        edCapTelefonos.Text     := sdqDatosUR_DIRCAP_TELEFONOS.AsString;
        edCapFAX.Text           := sdqDatosUR_DIRCAP_FAX.AsString;
        edDirElectronica.Text   := sdqDatosUR_DIRELECTRONICA.AsString;
     end;
     fpEditor.Tag := Integer(ABMAction);
     fpEditor.ShowModal;
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSegRetiro.btnAceptarClick(Sender: TObject);
var
  Sql : String;
begin
   Verificar((TABMActions(fpEditor.Tag) = aaAdd) and
              ExisteSql('SELECT 1 FROM sur_seguroretiro WHERE ur_codigo = ' + SqlValue(edCodigo.Text)),
             edCodigo, 'Ya existe una aseguradora con el código seleccionado.');
   Verificar((Trim(edCUIT.Text) <> '') and not(IsCuit(edCUIT.Text)), edCUIT, 'El CUIT no es válido.');
   Verificar((edRSocial.Text = ''), edRSocial, 'Debe completar la Razón Social.');
   Verificar((edDirElectronica.Text <> '') and (not IsEMails(edDirElectronica.Text)),
             edDirElectronica, 'El E-Mail no es válido.');

   if TABMActions(fpEditor.Tag) = aaAdd then
   begin
      Sql := 'INSERT INTO sur_seguroretiro ( ' +
             ' ur_codigo, ur_nombre, ur_cuit, ur_calle, ur_numero, ur_piso, ur_departamento, ' +
             ' ur_localidad, ur_cpostal, ur_cpostala, ur_provincia, ur_telefonos, ur_fax, ' +
             ' ur_dircap_calle, ur_dircap_numero, ur_dircap_piso, ur_dircap_departamento, ur_dircap_localidad, ' +
             ' ur_dircap_cpostal, ur_dircap_cpostala, ur_dircap_provincia, ur_dircap_telefonos, ur_dircap_fax, ' +
             ' ur_direlectronica, ur_usualta, ur_fechaalta ) VALUES (' +
             SqlString(edCodigo.Text, True) + ', ' + SqlString(edRSocial.Text, True) + ',' +
             SqlString(edCUIT.Text, True) + ',';
      with fraPartDireccion do
            Sql := Sql + SqlString(Calle, True) + ', ' + SqlString(Numero, True) + ', ' +
                         SqlString(Piso, True) + ', ' + SqlString(Departamento, True) + ', ' +
                         SqlString(Localidad, True) + ', ' + SqlString(CodigoPostal, True) + ', ' +
                         SqlString(CPA, True) + ', ' + SqlInt(Prov, True) + ', ' +
                         SqlString(edPartTelefonos.Text, True) + ', ' + SqlString(edPartFax.Text, True) + ', ';
      with fraCapDireccion do
            Sql := Sql + SqlString(Calle, True) + ', ' + SqlString(Numero, True) + ', ' +
                         SqlString(Piso, True) + ', ' + SqlString(Departamento, True) + ', ' +
                         SqlString(Localidad, True) + ', ' + SqlString(CodigoPostal, True) + ', ' +
                         SqlString(CPA, True) + ', ' + SqlInt(Prov, True) + ', ' +
                         SqlString(edCapTelefonos.Text, True) + ', ' + SqlString(edCapFax.Text, True) + ', ';

      Sql := Sql + SqlString(edDirElectronica.Text, True) + ',' + SqlValue(Sesion.UserID) + ', ACTUALDATE)';
   end
   else begin
      Sql := 'UPDATE sur_seguroretiro ' +
               ' SET ur_nombre = ' + SqlString(edRSocial.Text, True) + ',' +
                   ' ur_cuit = ' + SqlString(edCUIT.Text, True) + ',';
      with fraPartDireccion do
            Sql := Sql + ' ur_calle = ' + SqlString(Calle, True) + ', ' +
                         ' ur_numero = ' + SqlString(Numero, True) + ', ' +
                         ' ur_piso = ' + SqlString(Piso, True) + ', ' +
                         ' ur_departamento = ' + SqlString(Departamento, True) + ', ' +
                         ' ur_localidad = ' + SqlString(Localidad, True) + ', ' +
                         ' ur_cpostal = ' + SqlString(CodigoPostal, True) + ', ' +
                         ' ur_cpostala = ' + SqlString(CPA, True) + ', ' +
                         ' ur_provincia = ' + SqlInt(Prov, True) + ', ' +
                         ' ur_telefonos = ' + SqlString(edPartTelefonos.Text, True) + ', ' +
                         ' ur_fax = ' + SqlString(edPartFax.Text, True) + ', ';
      with fraCapDireccion do
            Sql := Sql + ' ur_dircap_calle = ' + SqlString(Calle, True) + ', ' +
                         ' ur_dircap_numero = ' + SqlString(Numero, True) + ', ' +
                         ' ur_dircap_piso = ' + SqlString(Piso, True) + ', ' +
                         ' ur_dircap_departamento = ' + SqlString(Departamento, True) + ', ' +
                         ' ur_dircap_localidad = ' + SqlString(Localidad, True) + ', ' +
                         ' ur_dircap_cpostal = ' + SqlString(CodigoPostal, True) + ', ' +
                         ' ur_dircap_cpostala = ' + SqlString(CPA, True) + ', ' +
                         ' ur_dircap_provincia = ' + SqlInt(Prov, True) + ', ' +
                         ' ur_dircap_telefonos = ' + SqlString(edCapTelefonos.Text, True) + ', ' +
                         ' ur_dircap_fax = ' + SqlString(edCapFax.Text, True) + ', ';

      Sql := Sql + ' ur_direlectronica = ' + SqlString(edDirElectronica.Text, True) + ', ' +
                   ' ur_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                   ' ur_fechamodif = actualdate, ' +
                   ' ur_usubaja = NULL, ' +
                   ' ur_fechabaja = NULL ' +
             ' WHERE ur_codigo = ' + SqlString(edCodigo.Text, True) ;
   end;
   //------------------------------------------------------------------
   try
      EjecutarSql(Sql);
      RefreshAndLocate(sdqDatos, ['UR_CODIGO'], [edCodigo.Text]);
      fpEditor.ModalResult := mrOk;
   except
      on E: Exception do ErrorMsg(E);
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSegRetiro.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  Cancel := True;
  if PrintDialog.Execute then
  begin
    QueryPrint.Footer.Text := Sesion.Usuario;
    QueryPrint.Print;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSegRetiro.fpEditorBeforeShow(Sender: TObject);
begin
  pcDomicilios.ActivePage := tsDomParticular;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
