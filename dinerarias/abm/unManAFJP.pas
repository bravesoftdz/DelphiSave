unit unManAFJP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryPrint, Db, ABMDialog, SDEngine, StdCtrls, Mask, IntEdit, ExtCtrls,
  FormPanel, PatternEdit, EditDialog, unArtFrame, unFraDomicilio;

type
  TfrmManAFJP = class(TForm)
    fpEditor: TFormPanel;
    Label1: TLabel;
    lbRSocial: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    edRSocial: TEdit;
    edTelefono: TEdit;
    edFAX: TEdit;
    edDirElectronica: TEdit;
    btnAceptar: TButton;
    btnCancelar: TButton;
    sdqDatos: TSDQuery;
    ABMDialog: TABMDialog;
    dsDatos: TDataSource;
    QueryPrint: TQueryPrint;
    edCodigo: TPatternEdit;
    PrintDialog: TPrintDialog;
    Label2: TLabel;
    edContactos: TEdit;
    fraDireccion: TfraDomicilio;
    pnlTipo: TPanel;
    rbSussABM: TRadioButton;
    rbNoSussABM: TRadioButton;
    Label6: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
  private
  public
    procedure Execute;
  end;

var
  frmManAFJP: TfrmManAFJP;

implementation

uses unDmPrincipal, unPrincipal, General, AnsiSql, CUIT, Internet, CustomDLGs,
  unSesion;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmManAFJP }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManAFJP.Execute;
begin
  OpenQuery(sdqDatos);
  ABMDialog.Execute;
  sdqDatos.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManAFJP.btnAceptarClick(Sender: TObject);
Var
  Sql : String;
begin
  if (TABMActions(fpEditor.Tag) = aaAdd) and
     ExisteSql('SELECT 1 FROM sju_jubilacion WHERE ju_codigo = ''' + edCodigo.Text + '''' ) then
  begin
    MsgBox('Ya existe una aseguradora con el código seleccionado.', MB_ICONEXCLAMATION );
    edCodigo.SetFocus;

  end else if (edRSocial.Text = '') then
  begin
    MsgBox('Debe completar la Razón Social.', MB_ICONEXCLAMATION );
    edRSocial.SetFocus;

  end else if (edDirElectronica.Text <> '') and (not IsEMails(edDirElectronica.Text)) then
  begin
    MsgBox('El E-Mail no es válido.', MB_ICONEXCLAMATION );
    edDirElectronica.SetFocus;

  end else if not(rbSussABM.Checked) and not(rbNoSussABM.Checked) then
  begin
    MsgBox('Debe seleccionar el tipo de sistema previsional.', MB_ICONEXCLAMATION);
    pnlTipo.SetFocus;

  end else
    with fraDireccion do
    begin
      if TABMActions(fpEditor.Tag) = aaAdd then
        Sql := 'INSERT INTO sju_jubilacion ' +
               '(ju_codigo, ju_nombre, ju_calle, ju_numero, ju_piso, ju_departamento, ' +
               ' ju_localidad, ju_cpostal, ju_cpostala, ju_provincia, ju_telefonos, ju_fax, ' +
               ' ju_direlectronica, ju_usualta, ju_fechaalta, ju_contactos, ju_tipo) VALUES (' +
               SqlString(edCodigo.Text, True) + ', ' + SqlString(edRSocial.Text, True) + ', ' +
               SqlString(Calle, True) + ', ' + SqlString(Numero, True) + ', ' +
               SqlString(Piso, True) + ', ' + SqlString(Departamento, True) + ', ' +
               SqlString(Localidad, True) + ', ' + SqlString(CodigoPostal, True) + ', ' +
               SqlString(CPA, True) + ', ' + SqlInt(Prov, True) + ', ' +
               SqlString(edTelefono.Text, True) + ', ' + SqlString(edFax.Text, True) + ', ' +
               SqlString(edDirElectronica.Text, True) + ', ' + SqlValue(Sesion.UserID) + ', ACTUALDATE, ' +
               SqlString(edContactos.Text, True) + ',' + SqlBoolean(rbSussABM.Checked) + ')'
      else
        Sql := 'UPDATE sju_jubilacion ' +
                 ' SET ju_nombre = ' + SqlString(edRSocial.Text, True) + ', ' +
                     ' ju_calle = ' + SqlString(Calle, True) + ', ' +
                     ' ju_numero = ' + SqlString(Numero, True) + ', ' +
                     ' ju_piso = ' + SqlString(Piso, True) + ', ' +
                     ' ju_departamento = ' + SqlString(Departamento, True) + ', ' +
                     ' ju_localidad = ' + SqlString(Localidad, True) + ', ' +
                     ' ju_cpostal = ' + SqlString(CodigoPostal, True) + ', ' +
                     ' ju_cpostala = ' + SqlString(CPA, True) + ', ' +
                     ' ju_provincia = ' + SqlInt(Prov, True) + ', ' +
                     ' ju_telefonos = ' + SqlString(edTelefono.Text, True) + ', ' +
                     ' ju_fax = ' + SqlString(edFax.Text, True) + ', ' +
                     ' ju_direlectronica = ' + SqlString(edDirElectronica.Text, True) + ', ' +
                     ' ju_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                     ' ju_fechamodif = actualdate, ' +
                     ' ju_usubaja = NULL, ' +
                     ' ju_fechabaja = NULL, ' +
                     ' ju_contactos = ' + SqlString(edContactos.Text, True) + ', ' +
                     ' ju_tipo = ' + SqlBoolean(rbSussABM.Checked) +
               ' WHERE ju_codigo = ' + SqlString(edCodigo.Text, True);
      //------------------------------------------------------------------
      try
        EjecutarSql(Sql);
        RefreshAndLocate(sdqDatos, ['JU_CODIGO'], [edCodigo.Text]);
        fpEditor.ModalResult := mrOk;
      except
        on E: Exception do ErrorMsg(E);
      end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManAFJP.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  QueryPrint.Footer.Text := Sesion.Usuario;
  if PrintDialog.Execute then
  begin
    QueryPrint.Print;
    Cancel := True;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManAFJP.ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
Var
  Sql : String;
begin
  Cancel := True;
  if ABMAction = aaDelete then
  begin
    if MsgAsk('Se dispone a dar de baja la AFJP "' + sdqDatos.FieldByName('JU_NOMBRE').AsString + '".' + #13 +
              '¿Está usted seguro?') then
    begin
      Sql := 'UPDATE sju_jubilacion ' +
               ' SET ju_usubaja = ' + SqlValue(Sesion.UserID) + ', ' +
                   ' ju_fechabaja = actualdate ' +
              'WHERE ju_codigo = ''' + sdqDatos.FieldByName('JU_CODIGO').AsString + '''';
      EjecutarSql(Sql);
      RefreshAndLocate(sdqDatos, ['JU_CODIGO'], [sdqDatos.FieldByName('JU_CODIGO').AsString]);
    end;
  end else
  begin
    if ABMAction = aaAdd then
    begin
      edCodigo.Clear;
      edCodigo.ReadOnly     := False;
      edRSocial.Clear;
      fraDireccion.Clear;
      edTelefono.Clear;
      edFAX.Clear;
      edDirElectronica.Clear;
      edContactos.Clear;
      rbSussABM.Checked   := False;
      rbNoSussABM.Checked := False;
    end else
    begin
      if not(sdqDatos.FieldByName('JU_FECHABAJA').IsNull) and
         not(MsgAsk('Se dispone a reincorporar una AFJP dada de baja.' + #13 + '¿Está usted seguro?')) then
          Exit;

      edCodigo.Text         := sdqDatos.FieldByName('JU_CODIGO').AsString;
      edCodigo.ReadOnly     := True;
      edRSocial.Text        := sdqDatos.FieldByName('JU_NOMBRE').AsString;
      fraDireccion.Cargar(sdqDatos.FieldByName('JU_CALLE').AsString,
                          sdqDatos.FieldByName('JU_CPOSTAL').AsString,
                          sdqDatos.FieldByName('JU_LOCALIDAD').AsString,
                          sdqDatos.FieldByName('JU_NUMERO').AsString,
                          sdqDatos.FieldByName('JU_PISO').AsString,
                          sdqDatos.FieldByName('JU_DEPARTAMENTO').AsString,
                          sdqDatos.FieldByName('JU_PROVINCIA').AsString,
                          sdqDatos.FieldByName('JU_CPOSTALA').AsString);
      edTelefono.Text       := sdqDatos.FieldByName('JU_TELEFONOS').AsString;
      edFAX.Text            := sdqDatos.FieldByName('JU_FAX').AsString;
      edDirElectronica.Text := sdqDatos.FieldByName('JU_DIRELECTRONICA').AsString;
      edContactos.Text      := sdqDatos.FieldByName('JU_CONTACTOS').AsString;
      rbSussABM.Checked     := (sdqDatos.FieldByName('JU_TIPO').AsString = 'S');
      rbNoSussABM.Checked   := (sdqDatos.FieldByName('JU_TIPO').AsString = 'N');
    end;

    fpEditor.Tag := Integer(ABMAction);
    fpEditor.ShowModal;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

