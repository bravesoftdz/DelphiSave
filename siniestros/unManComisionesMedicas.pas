unit unManComisionesMedicas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Placemnt, QueryPrint, Db, ABMDialog,
  SDEngine, unArtFrame, unFraCodigoDescripcion, EditDialog, Mask, PatternEdit, StdCtrls, ExtCtrls, FormPanel,
  unFraDomicilio, unArtDBAwareFrame, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, Buttons;

type
  TfrmManComisionesMedicas = class(TForm)
    sdqDatos: TSDQuery;
    ABMDialog: TABMDialog;
    dsDatos: TDataSource;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    FormStorage: TFormStorage;
    fpEditor: TFormPanel;
    Label1: TLabel;
    lbRSocial: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Bevel2: TBevel;
    edDescripcion: TEdit;
    edTelefono: TEdit;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Label2: TLabel;
    chkIncluirListado: TCheckBox;
    edCodigo: TEdit;
    edCodigoUart: TEdit;
    fraDomicilio: TfraDomicilio;
    Button1: TButton;
    fpCodigosPostales: TFormPanel;
    Bevel5: TBevel;
    Label29: TLabel;
    btnAgregarRegion: TBitBtn;
    btnQuitarRegion: TBitBtn;
    btnCerrarRegion: TBitBtn;
    dgCodigos: TArtDBGrid;
    sdqCodigos: TSDQuery;
    dsCodigos: TDataSource;
    fraCodigoPostal: TfraCodigoDescripcion;
    Label4: TLabel;
    edHoraDesde: TMaskEdit;
    Label5: TLabel;
    edHoraHasta: TMaskEdit;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure btnAceptarClick(Sender: TObject);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnAgregarRegionClick(Sender: TObject);
    procedure btnQuitarRegionClick(Sender: TObject);
  private

  public
    procedure Execute;
  end;

var
  frmManComisionesMedicas: TfrmManComisionesMedicas;

implementation

uses unDmPrincipal, unSesion, AnsiSql, General, CustomDlgs, ValFuncs,
  unComunes;

const
  sqlCodigos =
    'SELECT cp_codigo as codigo, cp_id as id, cp_localidad as descripcion, ' +
          ' null as baja, pv_descripcion as provincia ' +
     ' FROM ccp_codigopostal, cpv_provincias ' +
    ' WHERE cp_provincia = pv_codigo ';

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmManComisionesMedicas.Execute;
begin
  try
    sdqDatos.Open;
    ABMDialog.Execute;
    sdqDatos.Close;
  except
    on E: Exception do ErrorMsg(E);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManComisionesMedicas.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  if PrintDialog.Execute then
  begin
    QueryPrint.Footer.Text := Sesion.Usuario;
    QueryPrint.Print;
    Cancel := True;
   end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManComisionesMedicas.btnAceptarClick(Sender: TObject);
var
  sSql :String;
begin
  if (TABMActions(fpEditor.Tag) = aaAdd) and
      ExisteSql('SELECT 1 FROM sin.scm_comisionmedica WHERE cm_codigo = ''' + edCodigo.Text + '''' ) then
  begin
    MsgBox('Ya existe una Comisión Médica con el código seleccionado.', MB_ICONEXCLAMATION);
    edCodigo.SetFocus;

  end else if (Trim(edDescripcion.Text) = '') then begin
    MsgBox('Debe completar la Descripción.', MB_ICONEXCLAMATION);
    edDescripcion.SetFocus;

  end else if (Trim(edHoraDesde.Text) <> ':') and not(IsTime(edHoraDesde.Text)) then begin
    MsgBox('Hora no válida.', MB_ICONEXCLAMATION);
    edHoraDesde.SetFocus;

  end else if (Trim(edHoraHasta.Text) <> ':') and not(IsTime(edHoraHasta.Text)) then begin
    MsgBox('Hora no válida.', MB_ICONEXCLAMATION);
    edHoraHasta.SetFocus;

  end else
    with fraDomicilio do
    begin
      if TABMActions(fpEditor.Tag) = aaAdd then
        sSql := 'INSERT INTO sin.scm_comisionmedica ' +
                '(cm_codigo, cm_descripcion, cm_calle, cm_numero, cm_localidad, cm_provincia, ' +
                ' cm_codigo_uart, cm_incluirlistado, cm_cpostal, cm_telefono, cm_piso, ' +
                ' cm_usualta, cm_fechaalta, cm_horadesde, cm_horahasta) VALUES ( ' +
                SqlValue(edCodigo.Text) + ',' + SqlValue(edDescripcion.Text) + ',' +
                SqlValue(Calle) + ',' + SqlValue(Numero) + ',' +
                SqlValue(Localidad) + ',' + SqlInt(Prov) + ',' +
                SqlValue(edCodigoUART.Text) + ',' + IIF(chkIncluirListado.Checked, SqlValue('S'), SqlValue('N')) + ',' +
                SqlValue(CodigoPostal) + ',' + SqlValue(edTelefono.Text) + ', ' +
                SqlValue(Piso) + ', ' +  SqlValue(Sesion.LoginName) + ', actualdate, ' +
                SqlValue(HoraSinMascara(edHoraDesde.Text)) + ',' + SqlValue(HoraSinMascara(edHoraHasta.Text)) + ')'
      else
        sSql := 'UPDATE sin.scm_comisionmedica ' +
                 ' SET cm_codigo = ' + SqlValue(edCodigo.Text) + ',' +
                     ' cm_descripcion = ' + SqlValue(edDescripcion.Text) + ',' +
                     ' cm_calle = ' + SqlValue(Calle) + ',' +
                     ' cm_numero = ' + SqlValue(Numero) + ',' +
                     ' cm_localidad = ' + SqlValue(Localidad) + ',' +
                     ' cm_provincia = ' + SqlInt(Prov) + ',' +
                     ' cm_codigo_uart = ' + SqlValue(edCodigoUART.Text) + ',' +
                     ' cm_incluirlistado = ' + IIF(chkIncluirListado.Checked, SqlValue('S'), SqlValue('N')) + ',' +
                     ' cm_cpostal = ' + SqlValue(CodigoPostal) + ',' +
                     ' cm_telefono = ' + SqlValue(edTelefono.Text) + ',' +
                     ' cm_piso = ' + SqlValue(Piso) + ',' +
                     ' cm_horadesde = ' + SqlValue(HoraSinMascara(edHoraDesde.Text)) + ',' +
                     ' cm_horahasta = ' + SqlValue(HoraSinMascara(edHoraHasta.Text)) + ',' +
                     ' cm_usumodif = ' + SqlValue(Sesion.LoginName) + ',' +
                     ' cm_fechamodif = actualdate, cm_usubaja = null, cm_fechabaja = null ' +
               ' WHERE cm_id = ' + SqlInt(sdqDatos.FieldByName('CM_ID').AsInteger);
           //------------------------------------------------------------------
      EjecutarSql(sSql);
      RefreshAndLocate(sdqDatos, ['CM_CODIGO'], [edCodigo.Text]);
      fpEditor.ModalResult := mrOk;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManComisionesMedicas.ABMDialogBeforeABM(Sender: TObject;
  ABMAction: TABMActions; var Cancel: Boolean);
var
  sSql :String;
begin
  Cancel := True;
  if ABMAction = aaDelete then
  begin
    if (MsgBox('Se dispone a dar de baja la Comisión Medica "' + sdqDatos.FieldByName('CM_DESCRIPCION').AsString + '".' + #13 +
               '¿Esta usted Seguro?', MB_ICONEXCLAMATION + MB_YESNO) = IDYES) then
    begin
      SSql := 'UPDATE sin.scm_comisionmedica ' +
                ' SET cm_usubaja = ' + SqlValue(Sesion.LoginName) + ',' +
                    ' cm_fechabaja = actualdate ' +
              ' WHERE cm_id = ' + SqlInt(sdqDatos.FieldByName('CM_ID').AsInteger);
       EjecutarSql(sSql);
       RefreshAndLocate(sdqDatos, ['CM_CODIGO'], [sdqDatos.FieldByName('CM_CODIGO').AsString]);
    end;
  end
  else begin
    if ABMAction = aaAdd then
    begin
      edCodigo.Clear;
      edCodigo.ReadOnly         := False;
      chkIncluirListado.Checked := False;
      edCodigoUART.Clear;
      edDescripcion.Clear;
      edHoraDesde.Clear;
      edHoraHasta.Clear;
      fraDomicilio.Clear;
      edTelefono.Clear;
    end
    else begin
      if not sdqDatos.FieldByName('CM_FECHABAJA').IsNull then
        if (MsgBox('Se dispone a reincorporar una Comisión Médica dada de baja.' + #13 +
                   '¿Esta usted Seguro?', MB_ICONQUESTION + MB_YESNO) = IDNO) then
          Exit;

        edCodigo.Text             := sdqDatos.FieldByName('CM_CODIGO').AsString;
        edCodigo.ReadOnly         := True;
        edCodigoUART.Text         := sdqDatos.FieldByName('CM_CODIGO_UART').AsString;
        edDescripcion.Text        := sdqDatos.FieldByName('CM_DESCRIPCION').AsString;
        edHoraDesde.Text          := sdqDatos.FieldByName('CM_HORADESDE').AsString;
        edHoraHasta.Text          := sdqDatos.FieldByName('CM_HORAHASTA').AsString;
        chkIncluirListado.Checked := IIF(sdqDatos.FieldByName('CM_INCLUIRLISTADO').AsString = 'S', True, False);
        fraDomicilio.Cargar(sdqDatos.FieldByName('CM_CALLE').AsString,
                            sdqDatos.FieldByName('CM_CPOSTAL').AsString,
                            sdqDatos.FieldByName('CM_LOCALIDAD').AsString,
                            sdqDatos.FieldByName('CM_NUMERO').AsString,
                            sdqDatos.FieldByName('CM_PISO').AsString, '',
                            sdqDatos.FieldByName('PV_DESCRIPCION').AsString, '');
        edTelefono.Text     := sdqDatos.FieldByName('CM_TELEFONO').AsString;
    end;
    fpEditor.Tag := Integer(ABMAction);
    fpEditor.ShowModal;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManComisionesMedicas.FormCreate(Sender: TObject);
begin
  with fraCodigoPostal do
  begin
    TableName   := 'CCP_CODIGOPOSTAL';
    FieldID     := 'CP_ID';
    FieldCodigo := 'CP_CODIGO';
    FieldDesc   := 'CP_LOCALIDAD';
    Sql         := sqlCodigos;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManComisionesMedicas.Button1Click(Sender: TObject);
begin
  sdqCodigos.Close;
  sdqCodigos.ParamByName('IdComision').AsInteger := sdqDatos.FieldByName('CM_ID').AsInteger;
  sdqCodigos.Open;
  fraCodigoPostal.Clear;
  fpCodigosPostales.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManComisionesMedicas.btnAgregarRegionClick(Sender: TObject);
var
  sSql :String;
  IdComision, IdCPostal :Integer;
begin
  Verificar(fraCodigoPostal.IsEmpty, fraCodigoPostal, 'Debe seleccionar un código postal');
  IdComision := sdqDatos.FieldByName('CM_ID').AsInteger;
  IdCPostal  := fraCodigoPostal.Value;
  sSql := 'SELECT 1 FROM sin.scp_comisioncpostal ' +
          ' WHERE cp_idcpostal = :CP ';

  Verificar(ExisteSqlEx(sSql + ' AND cp_fechabaja IS NULL AND cp_idcomision = :IdCom ', [IdCPostal, IdComision]),
            fraCodigoPostal, 'El código postal ya existe en la comisión médica seleccionada');
  Verificar(ExisteSqlEx(sSql + ' AND cp_fechabaja IS NULL ', [IdCPostal]),
            fraCodigoPostal, 'El código postal ya existe en otra comisión médica');
  try
    if ExisteSqlEx(sSql + ' AND cp_idcomision = :IdCom', [IdCPostal, IdComision]) then
      sSql := 'UPDATE sin.scp_comisioncpostal ' +
                ' SET cp_fechabaja = Null, ' +
                    ' cp_usubaja = Null, ' +
                    ' cp_fechaalta = ActualDate, ' +
                    ' cp_usualta = ' + SqlValue(Sesion.UserID) +
              ' WHERE cp_idcomision = ' + SqlInt(IdComision) +
                ' AND cp_idcpostal = ' + SqlInt(IdCPostal)
    else
      sSql := 'INSERT INTO sin.scp_comisioncpostal ' +
              '(cp_idcomision, cp_idcpostal, cp_fechaalta, cp_usualta) VALUES ( ' +
              SqlInt(IdComision) + ',' + SqlInt(IdCPostal) + ', ActualDate, ' +
              SqlValue(Sesion.UserID) + ')';
    EjecutarSql(sSql);
    sdqCodigos.Refresh;
  except
    on E:Exception do ErrorMsg(E, 'Error al intentar dar de alta el código postal');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManComisionesMedicas.btnQuitarRegionClick(Sender: TObject);
var
  sSql :String;
begin
  if sdqCodigos.Active and not(sdqCodigos.Eof) and
     MsgAsk('¿Confirma la baja de la localidad ' + sdqCodigos.FieldByName('CP_LOCALIDAD').AsString + ' (CP: ' +
                                                   sdqCodigos.FieldByName('CP_CODIGO').AsString + ')?') then
  begin
    sSql := 'UPDATE sin.scp_comisioncpostal ' +
              ' SET cp_fechabaja = ActualDate, ' +
                  ' cp_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE cp_idcomision = ' + SqlInt(sdqDatos.FieldByName('CM_ID').AsInteger) +
              ' AND cp_idcpostal = ' + SqlInt(sdqCodigos.FieldByName('CP_ID').AsInteger);
    EjecutarSql(sSql);
    sdqCodigos.Refresh;
  end;
end;
{-------------------------------------------------------------------------------}
end.
