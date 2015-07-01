unit unManEstudios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryPrint, ABMDialog, Db, SDEngine, PatternEdit, Mask, ToolEdit,
  CurrEdit, StdCtrls, FormPanel, ExtCtrls, EditDialog, RxLookup, Buttons;

type
  TfrmManEstudios = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    QueryPrint: TQueryPrint;
    fpABM: TFormPanel;
    Label1: TLabel;
    Label2: TLabel;
    edDescripcion: TEdit;
    Label3: TLabel;
    edUnidMedida: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    edMinimo: TCurrencyEdit;
    edMaximo: TCurrencyEdit;
    edCodigo: TPatternEdit;
    bvSep1: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    sdqDatosES_CODIGO: TStringField;
    sdqDatosES_DESCRIPCION: TStringField;
    sdqDatosES_COSTO: TFloatField;
    sdqDatosES_UMEDIDA: TStringField;
    sdqDatosES_MAXIMO: TFloatField;
    sdqDatosES_MINIMO: TFloatField;
    sdqDatosES_FORMULARIO: TStringField;
    sdqDatosTB_DESCRIPCION: TStringField;
    sdqDatosES_USUALTA: TStringField;
    sdqDatosES_FECHALTA: TDateTimeField;
    sdqDatosES_USUMODIF: TStringField;
    sdqDatosES_FECHAMODIF: TDateTimeField;
    sdqDatosES_USUBAJA: TStringField;
    sdqDatosES_FECHABAJA: TDateTimeField;
    Label6: TLabel;
    cmbFormulario: TRxDBLookupCombo;
    sdqFormulario: TSDQuery;
    dsFormulario: TDataSource;
    sdqDatosES_SINCOSTO: TStringField;
    chkSinCosto: TCheckBox;
    Label7: TLabel;
    cmbPerfilAMP: TRxDBLookupCombo;
    sdqPerfilAMP: TSDQuery;
    dsPerfilAMP: TDataSource;
    sdqDatoses_idperfil: TFloatField;
    sdqDatosPA_DESCRIPCION: TStringField;
    btnLimpiarPerfil: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    cmbTipoArchivo: TRxDBLookupCombo;
    sdqTipoArchivo: TSDQuery;
    dsTipoArchivo: TDataSource;
    sdqDatoses_tipoarchivo: TFloatField;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure btnAceptarClick(Sender: TObject);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
    procedure edCodigoExit(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure ABMDialogGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fpABMBeforeShow(Sender: TObject);
    procedure ABMDialogAfterABM(Sender: TObject; ABMAction: TABMActions);
    procedure btnLimpiarPerfilClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
  public
    procedure Execute;
  end;

var
  frmManEstudios: TfrmManEstudios;

implementation

uses unPrincipal, unDmPrincipal, General, AnsiSql, CustomDlgs, StrFuncs;

{$R *.DFM}


{ TfrmManEstudios }

procedure TfrmManEstudios.Execute;
begin
  sdqDatos.Open;
  ABMDialog.Execute;
  sdqDatos.Close;
end;

procedure TfrmManEstudios.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
  QueryPrint.Print;
  Cancel := True;
end;

procedure TfrmManEstudios.ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
begin
  if (ABMAction <> aaDelete) then
  begin
    Cancel := True;
    if (ABMAction = aaAdd) then
    begin
      edCodigo.Text       := '';
      edDescripcion.Text  := '';
      edUnidMedida.Text   := '';
      edMinimo.Text       := '';
      edMaximo.Text       := '';
      cmbFormulario.Value := '';
      cmbPerfilAMP.Value  := '';
      cmbTipoArchivo.Value:= '';
      chkSinCosto.Checked := False;
      edCodigo.ReadOnly   := False;
    end else
    begin
      edCodigo.Text       := sdqDatosES_CODIGO.AsString;
      edDescripcion.Text  := sdqDatosES_DESCRIPCION.AsString;
      edUnidMedida.Text   := sdqDatosES_UMEDIDA.AsString;
      edMinimo.Value      := sdqDatosES_MINIMO.AsCurrency;
      edMaximo.Value      := sdqDatosES_MAXIMO.AsCurrency;
      cmbFormulario.Value := sdqDatosES_FORMULARIO.AsString;
      cmbPerfilAMP.Value  := sdqDatosES_IDPERFIL.AsString;
      cmbTipoArchivo.Value:= sdqDatosES_TIPOARCHIVO.AsString;
      chkSinCosto.Checked := sdqDatosES_SINCOSTO.AsString = 'S';
      edCodigo.ReadOnly   := True;
    end;
    fpABM.Tag := Integer(ABMAction);
    fpABM.ShowModal;
  end
end;

procedure TfrmManEstudios.btnAceptarClick(Sender: TObject);
var
  Sql: String;
begin
  Verificar(edCodigo.Text = '', edCodigo,'Debe escribir el codigo del estudio');
   {Sql := 'SELECT 1 ' +
           'FROM AES_ESTUDIOS ' +
          'WHERE ES_CODIGO = ''' + edCodigo.Text + '''';
   }
  if (Trim(edDescripcion.Text) = '') then
  begin
    MsgBox('Debe cargar la descripción del estudio.',  MB_ICONEXCLAMATION);
    edDescripcion.SetFocus;
  end else
    if (edMaximo.Value <> 0) and (edMinimo.Value > edMaximo.Value) then
    begin
      MsgBox('El valor minimo no puede ser mayor al valor máximo.',  MB_ICONEXCLAMATION);
      edMinimo.SetFocus;
    end else
    if cmbTipoArchivo.Value = '' then
    begin
      MsgBox('Debe indicarse el tipo de archivo.',  MB_ICONEXCLAMATION);
      cmbTipoArchivo.SetFocus;
    end else
    begin
      if TABMActions(fpABM.Tag) = aaAdd then
        Sql := 'INSERT INTO AES_ESTUDIOS ' +
               '(ES_CODIGO, ES_DESCRIPCION, ES_UMEDIDA, ES_MINIMO, ES_MAXIMO, ' +
               ' ES_SINCOSTO, ES_FORMULARIO, ES_IDPERFIL, ES_USUALTA, ES_FECHALTA, ES_TIPOARCHIVO) ' +
               ' VALUES (''' + edCodigo.Text + ''', ' +
               SqlString( edDescripcion.Text, True ) + ', ' +
               SqlString( edUnidMedida.Text, True ) + ', ' +
               SqlNumber( edMinimo.Value ) + ', ' +
               SqlNumber( edMaximo.Value ) + ', ' +
               SqlString( iif(chkSinCosto.Checked, 'S', 'N'), True ) + ', ' +
               SqlString( cmbFormulario.Value, True ) + ', ' +
               SqlString( cmbPerfilAMP.Value, True ) + ', ' +
               '''' + frmPrincipal.DBLogin.LoginName + ''', ACTUALDATE, ' +
               SqlString( cmbTipoArchivo.Value, True ) + ') '
      else

        Sql := 'UPDATE AES_ESTUDIOS ' +
                  'SET ES_DESCRIPCION = ' + SqlString( edDescripcion.Text, True ) + ', ' +
                      'ES_UMEDIDA = ' + SqlString( edUnidMedida.Text, True ) + ', ' +
                      'ES_MINIMO = ' + SqlNumber( edMinimo.Value ) + ', ' +
                      'ES_MAXIMO = ' + SqlNumber( edMaximo.Value ) + ', ' +
                      'ES_SINCOSTO = ' + SqlString( iif(chkSinCosto.Checked, 'S', 'N'), True ) + ', ' +
                      'ES_FORMULARIO = ' + SqlString( cmbFormulario.Value, True ) + ', ' +
                      'ES_IDPERFIL = ' + SqlInteger( cmbPerfilAMP.Value, True ) + ', ' +
                      'ES_USUBAJA = NULL, ' +
                      'ES_FECHABAJA = NULL, ' +
                      'ES_USUMODIF = ''' + frmPrincipal.DBLogin.LoginName + ''', ' +
                      'ES_FECHAMODIF = ACTUALDATE, ' +
                      'ES_TIPOARCHIVO = ' + SqlInteger( cmbTipoArchivo.Value, True ) +
                  'WHERE ES_CODIGO = ''' + edCodigo.Text + '''' ;

      try
        EjecutarSql(Sql);
        EjecutarSql('UPDATE AER_ESTRIESG ' +
                    '   SET ER_FECHABAJA = NULL, ' +
                    '       ER_USUBAJA = NULL, ' +
                    '       ER_BAJAESTUDIO = NULL ' +
                    ' WHERE ER_ESTUDIO = ' + SqlValue (edCodigo.Text) +
                    '   AND ER_FECHABAJA IS NOT NULL ' +
                    '   AND ER_BAJAESTUDIO = ' + SqlValue ('S'));

        fpABM.ModalResult := mrOk ;
        RefreshAndLocate(sdqDatos, ['ES_CODIGO'], [edCodigo.Text]);
      except
        on E: Exception do
          ErrorMsg(E);
      end;
    end;
end;

procedure TfrmManEstudios.edCodigoExit(Sender: TObject);
begin
  if (edCodigo.Text <> '') and (not edCodigo.ReadOnly) then
    edCodigo.Text := LPad( IntToStr(StrToInt(edCodigo.Text)), '0', 8);
end;

procedure TfrmManEstudios.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
  if not sdqDatosES_FECHABAJA.IsNull Then
    AFont.Style := AFont.Style + [fsStrikeOut];
end;

procedure TfrmManEstudios.ABMDialogGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (not Highlight) and sdqDatosES_UMEDIDA.IsNull Then
    Background := $00E1FFFF;

  if (Field.FieldName = 'ES_SINCOSTO') and (sdqDatosES_SINCOSTO.AsString = 'S') then
  begin
    AFont.Style := AFont.Style + [fsBold];
    AFont.Color := clMaroon;
  end;
end;

procedure TfrmManEstudios.fpABMBeforeShow(Sender: TObject);
begin
  sdqFormulario.Active := True;
  sdqPerfilAMP.Active := True;
  sdqTipoArchivo.Active := True;
end;

procedure TfrmManEstudios.ABMDialogAfterABM(Sender: TObject; ABMAction: TABMActions);
var
  Sql: String;
begin
  if (ABMAction = aaDelete) and (not sdqDatosES_FECHABAJA.IsNull) then
    try
      Sql := 'UPDATE AER_ESTRIESG ' +
             '   SET ER_FECHABAJA = SYSDATE, ' +
             '       ER_USUBAJA = ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
             '       ER_BAJAESTUDIO = ' + SqlValue('S') +
             ' WHERE ER_ESTUDIO = ' + SqlValue (sdqDatosES_CODIGO.AsString) +
             '   AND ER_FECHABAJA IS NULL';
      EjecutarSql (Sql);
    except
      on E: Exception do
        ErrorMsg(E);
    end;
end;

procedure TfrmManEstudios.btnLimpiarPerfilClick(Sender: TObject);
begin
  cmbPerfilAMP.Value := ''
end;

procedure TfrmManEstudios.SpeedButton1Click(Sender: TObject);
begin
  cmbFormulario.Value := '';
end;

end.
