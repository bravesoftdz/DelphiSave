{
   Mantenimiento del Médico de Análisis Médicos Periódicos.
   ABM de la AME_MEDICO
   Federico Firenze, 20/10/2000
}
unit unManMedicos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, unfraDireccion, ExtCtrls, StdCtrls, Mask, IntEdit,
  ABMDialog, FormPanel, EditDialog, QueryPrint, PatternEdit;

type
  TfrmManMedicos = class(TForm)
    sdqDatos: TSDQuery;
    fpEditor: TFormPanel;
    ABMDialog: TABMDialog;
    dsDatos: TDataSource;
    lbMatricula: TLabel;
    blNombre: TLabel;
    edRSocial: TEdit;
    lbCUIL: TLabel;
    mskCUIT: TMaskEdit;
    Bevel1: TBevel;
    fraDireccion: TfraDireccion;
    Label3: TLabel;
    edTelefono: TEdit;
    Label4: TLabel;
    edFAX: TEdit;
    Label5: TLabel;
    edDirElectronica: TEdit;
    Bevel2: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    QueryPrint: TQueryPrint;
    sdqDatosME_MATRICULA: TStringField;
    sdqDatosME_NOMBRE: TStringField;
    sdqDatosME_CUIT: TStringField;
    sdqDatosME_CALLE: TStringField;
    sdqDatosME_NUMERO: TStringField;
    sdqDatosME_PISO: TStringField;
    sdqDatosME_DEPARTAMENTO: TStringField;
    sdqDatosME_LOCALIDAD: TStringField;
    sdqDatosME_CPOSTAL: TStringField;
    sdqDatosME_CPOSTALA: TStringField;
    sdqDatosME_PROVINCIA: TStringField;
    sdqDatosPV_DESCRIPCION: TStringField;
    sdqDatosME_TELEFONOS: TStringField;
    sdqDatosME_FAX: TStringField;
    sdqDatosME_DIRELECTRONICA: TStringField;
    sdqDatosME_USUALTA: TStringField;
    sdqDatosME_FECHALTA: TDateTimeField;
    sdqDatosME_USUMODIF: TStringField;
    sdqDatosME_FECHAMODIF: TDateTimeField;
    sdqDatosME_USUBAJA: TStringField;
    sdqDatosME_FECHABAJA: TDateTimeField;
    edCodigo: TPatternEdit;
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
    procedure btnAceptarClick(Sender: TObject);
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
  private
  public
    procedure Execute;
  end;

var
  frmManMedicos: TfrmManMedicos;

implementation

uses unDmPrincipal, unPrincipal, General, AnsiSql, CUIT, Internet, CustomDLGs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMedicos.ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
Var
   Sql : String;
begin
     Cancel := True;
     if ABMAction = aaDelete then begin
        if (MsgBox( 'Se dispone a dar de baja el médico "' + sdqDatosME_NOMBRE.AsString + '".' + #13 +
                    '¿Esta usted Seguro?', MB_ICONEXCLAMATION + MB_YESNO) = IDYES) then begin
           Sql := 'UPDATE AME_MEDICO ' +
                  'SET ME_USUBAJA = ''' + frmPrincipal.DBLogin.LoginName + ''', ' +
                  'ME_FECHABAJA = ACTUALDATE ' +
                  'WHERE ME_MATRICULA = ''' + sdqDatosME_MATRICULA.AsString + '''';
           EjecutarSql( Sql );
           RefreshAndLocate(sdqDatos, ['ME_MATRICULA'], [sdqDatosME_MATRICULA.AsString]);
        end;
     end else begin
         if ABMAction = aaAdd Then begin
            edCodigo.Text         := '';
            edCodigo.ReadOnly     := False;
            edRSocial.Text        := '';
            mskCUIT.Text          := '';
            fraDireccion.Limpiar ;
            edTelefono.Text       := '';
            edFAX.Text            := '';
            edDirElectronica.Text := '';

         end else begin
            if not sdqDatosME_FECHABAJA.IsNull Then
               if (MsgBox('Se dispone a reincorporar un médico dado de baja.' + #13 + '¿Esta usted Seguro?', MB_ICONQUESTION + MB_YESNO) = IDNO) Then
                  Exit;

            edCodigo.Text         := sdqDatosME_MATRICULA.AsString ;
            edCodigo.ReadOnly     := True;
            edRSocial.Text        := sdqDatosME_NOMBRE.AsString ;
            mskCUIT.Text          := sdqDatosME_CUIT.AsString ;
            with fraDireccion do begin
                 cmbCalle.Text     := sdqDatosME_CALLE.AsString ;
                 cmbLocalidad.Text := sdqDatosME_LOCALIDAD.AsString ;
                 edNumero.Text     := sdqDatosME_NUMERO.AsString ;
                 edPiso.Text       := sdqDatosME_PISO.AsString ;
                 edDto.Text        := sdqDatosME_DEPARTAMENTO.AsString ;
                 edCPostal.Text    := sdqDatosME_CPOSTAL.AsString ;
                 edCPA.Text        := sdqDatosME_CPOSTALA.AsString ;
                 edProvincia.Text  := sdqDatosPV_DESCRIPCION.AsString ;
                 if sdqDatosME_PROVINCIA.IsNull Then
                    edProvincia.Tag := -1
                 else
                    edProvincia.Tag := sdqDatosME_PROVINCIA.AsInteger ;
            end;
            edTelefono.Text       := sdqDatosME_TELEFONOS.AsString ;
            edFAX.Text            := sdqDatosME_FAX.AsString ;
            edDirElectronica.Text := sdqDatosME_DIRELECTRONICA.AsString ;

         end;

         fpEditor.Tag := Integer(ABMAction);
         fpEditor.ShowModal ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMedicos.Execute;
begin
     sdqDatos.Open;
     ABMDialog.Execute ;
     sdqDatos.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMedicos.btnAceptarClick(Sender: TObject);
Var Sql : String;
begin
     if (TABMActions(fpEditor.Tag) = aaAdd) and ExisteSql('SELECT 1 FROM AME_MEDICO WHERE ME_MATRICULA = ' + SqlString(edCodigo.Text, True) ) then begin
        MsgBox('La Matrícula ya ha sido utilizado anteriormente.', MB_ICONEXCLAMATION );
        edCodigo.SetFocus ;

     end else if (edRSocial.Text = '') then begin
        MsgBox('Debe completar la Razón Social del médico.', MB_ICONEXCLAMATION );
        edRSocial.SetFocus ;

     end else if (mskCUIT.Text <> '') and (not IsCUIT(mskCUIT.Text)) then begin
        MsgBox('El CUIT no es válido.', MB_ICONEXCLAMATION );
        mskCUIT.SetFocus ;

     end else if (edDirElectronica.Text <> '') and (not IsEMails(edDirElectronica.Text)) then begin
        MsgBox('El E-Mail no es válido.', MB_ICONEXCLAMATION );
        edDirElectronica.SetFocus ;

     end else
       with fraDireccion do begin
         if TABMActions(fpEditor.Tag) = aaAdd then
            Sql := 'INSERT INTO AME_MEDICO (' +
                   'ME_MATRICULA, ME_NOMBRE, ME_CUIT, ' +
                   'ME_CALLE, ME_NUMERO, ME_PISO, ME_DEPARTAMENTO, ME_LOCALIDAD, ME_CPOSTAL, ME_CPOSTALA, ' +
                   'ME_PROVINCIA, ME_TELEFONOS, ME_FAX, ME_DIRELECTRONICA, ME_USUALTA, ME_FECHALTA) VALUES (' +
                   SqlString(edCodigo.Text, True) + ', ' + SqlString(edRSocial.Text, True) + ', ''' + mskCUIT.Text + ''', ' +
                   SqlString(cmbCalle.Text, True) + ', ' + SqlString(edNumero.Text, True) + ', ' +
                   SqlString(edPiso.Text, True) + ', ' + SqlString(edDto.Text, True) + ', ' +
                   SqlString(cmbLocalidad.Text, True) + ', ' + SqlString(edCPostal.Text, True) + ', ' +
                   SqlString(edCPA.Text, True) + ', ' + SqlInt(Provincia, True) + ', ' +
                   SqlString(edTelefono.Text, True) + ', ' + SqlString(edFax.Text, True) + ', ' +
                   SqlString(edDirElectronica.Text, True) + ', ''' + frmPrincipal.DBLogin.LoginName + ''', ACTUALDATE)'
         else
            Sql := 'UPDATE AME_MEDICO ' +
                   'SET ME_NOMBRE = ' + SqlString(edRSocial.Text, True) + ', ' +
                   'ME_CUIT = ''' + mskCUIT.Text + ''', ' +
                   'ME_CALLE = ' + SqlString(cmbCalle.Text, True) + ', ' +
                   'ME_NUMERO = ' + SqlString(edNumero.Text, True) + ', ' +
                   'ME_PISO = ' + SqlString(edPiso.Text, True) + ', ' +
                   'ME_DEPARTAMENTO = ' + SqlString(edDto.Text, True) + ', ' +
                   'ME_LOCALIDAD = ' + SqlString(cmbLocalidad.Text, True) + ', ' +
                   'ME_CPOSTAL = ' + SqlString(edCPostal.Text, True) + ', ' +
                   'ME_CPOSTALA = ' + SqlString(edCPA.Text, True) + ', ' +
                   'ME_PROVINCIA = ' + SqlInt(Provincia, True) + ', ' +
                   'ME_TELEFONOS = ' + SqlString(edTelefono.Text, True) + ', ' +
                   'ME_FAX = ' + SqlString(edFax.Text, True) + ', ' +
                   'ME_DIRELECTRONICA = ' + SqlString(edDirElectronica.Text, True) + ', ' +
                   'ME_USUMODIF = ''' + frmPrincipal.DBLogin.LoginName + ''', ' +
                   'ME_FECHAMODIF = ACTUALDATE, ' +
                   'ME_USUBAJA = NULL, ' +
                   'ME_FECHABAJA = NULL ' +
                   'WHERE ME_MATRICULA = ' + SqlString(edCodigo.Text, True) ;
         //------------------------------------------------------------------
         Try
            EjecutarSql( Sql );
            RefreshAndLocate(sdqDatos, ['ME_MATRICULA'], [edCodigo.Text]);
            fpEditor.ModalResult := mrOk;
         except
            on E: Exception do ErrorMsg(E);
         end;
       end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMedicos.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
     QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
     QueryPrint.Print ;
     Cancel := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.


