unit unManAcreed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, QueryPrint, Db, ABMDialog, SDEngine,
  StdCtrls, Mask, IntEdit, ExtCtrls, FormPanel, PatternEdit, EditDialog, unArtFrame, unArtDBAwareFrame, unfraCtbTablas,
  unFraDomicilio, ToolEdit, DateComboBox, unFraCodigoDescripcion,
  QueryToFile, ExportDialog;

type
  TfrmManAcreed = class(TForm)
    fpEditor: TFormPanel;
    Label1: TLabel;
    lbRSocial: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Bevel2: TBevel;
    edAcreedor: TEdit;
    edTelefono: TEdit;
    btnAceptar: TButton;
    btnCancelar: TButton;
    sdqDatos: TSDQuery;
    ABMDialog: TABMDialog;
    dsDatos: TDataSource;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    fraTipoAcreedor: TfraCtbTablas;
    Label2: TLabel;
    edCuit: TMaskEdit;
    Bevel3: TBevel;
    chkConcertado: TCheckBox;
    edCodArea: TEdit;
    Label6: TLabel;
    fraRetIB: TfraCtbTablas;
    Label7: TLabel;
    chkRetCajaMed: TCheckBox;
    Label4: TLabel;
    dcFechaForm: TDateComboBox;
    Bevel4: TBevel;
    sdqDatosPA_CUITCUIL: TStringField;
    sdqDatosPA_ACREEDOR: TStringField;
    sdqDatosPA_DENOMINA: TStringField;
    sdqDatosPA_CONCERTADO: TStringField;
    sdqDatosPA_FORMACOBRO: TStringField;
    sdqDatosPA_FECHAALTA: TDateTimeField;
    sdqDatosPA_DOMICILIO: TStringField;
    sdqDatosPA_TELCOD: TStringField;
    sdqDatosPA_TELNUM: TStringField;
    sdqDatosPA_LOCALIDAD: TStringField;
    sdqDatosPA_CODPOSTAL: TFloatField;
    sdqDatosPA_PROVINCIA: TStringField;
    sdqDatosPA_PAIS: TStringField;
    sdqDatosPA_ORIGEN: TStringField;
    sdqDatosPA_RETGANANCIAS: TStringField;
    sdqDatosPA_RETINGRESOSBRUTOS: TStringField;
    sdqDatosPA_CODPOSTALA: TStringField;
    sdqDatosPA_TELPREFIJO: TStringField;
    sdqDatosPA_RETENCAJAMED: TStringField;
    sdqDatosPA_FECHABAJA: TDateTimeField;
    sdqDatosPA_FECHAIMPRESIONFORMINSCR: TDateTimeField;
    sdqDatosTIPOACRE: TStringField;
    sdqDatosFORMACOBRO: TStringField;
    sdqDatosRETGANANCIAS: TStringField;
    sdqDatosRETIB: TStringField;
    fraFormaCobro: TfraCtbTablas;
    Label5: TLabel;
    edDomicilio: TEdit;
    Label8: TLabel;
    fraDomicilio: TfraDomicilio;
    sdqDatosPROVINCIA: TStringField;
    sdqDatosPA_CALLE: TStringField;
    sdqDatosPA_NUMERO: TStringField;
    sdqDatosPA_PISO: TStringField;
    sdqDatosPA_DEPARTAMENTO: TStringField;
    sdqDatosDOMICILIO: TStringField;
    sdqDatosPA_CPOSTAL: TStringField;
    fraRetGanancias: TfraCtbTablas;
    btnCuentasBancarias: TButton;
    ExportDialog: TExportDialog;
    procedure btnAceptarClick(Sender: TObject);
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ABMDialogGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnCuentasBancariasClick(Sender: TObject);
    procedure ABMDialogBeforeExport(Sender: TObject; var Cancel: Boolean);
  private
    function ValidarDatos :Boolean;
  public
    procedure Execute;
  end;

var
  frmManAcreed: TfrmManAcreed;

implementation

uses unDmPrincipal, unSesion, General, AnsiSql, CUIT, Internet, CustomDLGs,
     VCLExtra, unManCCP_CUENTAPAGO, unArt;

{$R *.DFM}
{-------------------------------------------------------------------------------}
{ TfrmManAcreed }
{-------------------------------------------------------------------------------}
procedure TfrmManAcreed.Execute;
begin
  OpenQuery(sdqDatos);
  ABMDialog.Execute;
  sdqDatos.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAcreed.btnAceptarClick(Sender: TObject);
var
  sSql :String;
begin
  if ValidarDatos then
  begin
    if (TABMActions(fpEditor.Tag) = aaAdd) then
    begin
      Verificar(ExisteSql('SELECT 1 FROM spa_pagoacre WHERE pa_cuitcuil = ' + SqlValue(edCuit.Text)),
                edCuit, 'Ya existe un acreedor con ese CUIT/CUIT.');

      sSql := 'INSERT INTO spa_pagoacre ( ' +
              ' pa_cuitcuil, pa_acreedor, pa_denomina, pa_concertado, pa_formacobro, pa_fechaalta, ' +
              ' pa_telcod, pa_telnum, pa_localidad, pa_provincia, pa_retganancias, pa_retingresosbrutos, ' +
              ' pa_retencajamed, pa_fechaimpresionforminscr, pa_calle, pa_numero, pa_piso, pa_departamento, ' +
              ' pa_cpostal, pa_codpostala) VALUES ( ' +
              SqlValue(edCuit.Text) + ',' + SqlValue(fraTipoAcreedor.Codigo) + ',' +
              SqlValue(edAcreedor.Text) + ',' + IIF(chkConcertado.Checked, '''S''', '''N''') + ',' +
              SqlValue(fraFormaCobro.Codigo) + ', ActualDate, ' + SqlValue(edCodArea.Text) + ',' +
              SqlValue(edTelefono.Text) + ',' + SqlValue(fraDomicilio.Localidad) + ',' +
              SqlValue(fraDomicilio.Prov) + ',' + SqlValue(fraRetGanancias.Codigo) + ',' +
              SqlValue(fraRetIB.Codigo) + ',' + IIF(chkRetCajaMed.Checked, '''S''', '''N''') + ',' +
              SqlDate(dcFechaForm.Date) + ',' + SqlValue(fraDomicilio.Calle) + ',' +
              SqlValue(fraDomicilio.Numero) + ',' + SqlValue(fraDomicilio.Piso) + ',' +
              SqlValue(fraDomicilio.Departamento) + ',' + SqlValue(fraDomicilio.CodigoPostal) + ',' +
              SqlValue(fraDomicilio.CPA) + ')';
    end else
      sSql := 'UPDATE spa_pagoacre ' +
                ' SET pa_acreedor = ' + SqlValue(fraTipoAcreedor.Codigo) + ',' +
                    ' pa_denomina = ' + SqlValue(edAcreedor.Text) + ',' +
                    ' pa_concertado = ' + IIF(chkConcertado.Checked, '''S''', '''N''') + ',' +
                    ' pa_formacobro = ' + SqlValue(fraFormaCobro.Codigo) + ',' +
                    ' pa_telcod = ' + SqlValue(edCodArea.Text) + ',' +
                    ' pa_telnum = ' + SqlValue(edTelefono.Text) + ',' +
                    ' pa_localidad = ' + SqlValue(fraDomicilio.Localidad) + ',' +
                    ' pa_provincia = ' + SqlValue(fraDomicilio.Prov) + ',' +
                    ' pa_retganancias = ' + SqlValue(fraRetGanancias.Codigo) + ',' +
                    ' pa_retingresosbrutos = ' + SqlValue(fraRetIB.Codigo) + ',' +
                    ' pa_retencajamed = ' + IIF(chkRetCajaMed.Checked, '''S''', '''N''') + ',' +
                    ' pa_fechaimpresionforminscr = ' + SqlDate(dcFechaForm.Date) + ',' +
                    ' pa_calle = ' + SqlValue(fraDomicilio.Calle) + ',' +
                    ' pa_numero = ' + SqlValue(fraDomicilio.Numero) + ',' +
                    ' pa_piso = ' + SqlValue(fraDomicilio.Piso) + ',' +
                    ' pa_departamento = ' + SqlValue(fraDomicilio.Departamento) + ',' +
                    ' pa_cpostal = ' + SqlValue(fraDomicilio.CodigoPostal) + ',' +
                    ' pa_codpostala = ' + SqlValue(fraDomicilio.CPA) + ',' +
                    ' pa_fechabaja = Null, ' +
                    ' pa_domicilio = Null ' +
              ' WHERE pa_cuitcuil = ' + SqlValue(edCuit.Text);
    //------------------------------------------------------------------
    try
      EjecutarSql(sSql);
      RefreshAndLocate(sdqDatos, ['PA_CUITCUIL'], [edCuit.Text]);
      fpEditor.ModalResult := mrOk;
    except
      on E: Exception do ErrorMsg(E);
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAcreed.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  QueryPrint.Footer.Text := Sesion.Usuario;
  if PrintDialog.Execute then
    QueryPrint.Print;

  Cancel := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAcreed.ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
var
  sSql :String;
begin
  Cancel := True;
  if (ABMAction = aaDelete) then
  begin
    if (MsgBox( 'Se dispone a dar de baja el Acreedor "' + sdqDatosPA_DENOMINA.AsString + '".' + #13 +
                '¿Está usted Seguro?', MB_ICONEXCLAMATION + MB_YESNO) = IDYES) then
    begin
      sSql := 'UPDATE spa_pagoacre ' +
                ' SET pa_fechabaja = ActualDate ' +
              ' WHERE pa_cuitcuil = ' + SqlValue(sdqDatosPA_CUITCUIL.AsString);
       EjecutarSql(sSql);
       RefreshAndLocate(sdqDatos, ['PA_CUITCUIL'], [edCuit.Text]);
    end;
  end
  else begin
    if (ABMAction = aaAdd) then
    begin
      LockControl(edCuit, False);
      fraTipoAcreedor.Clear;
      edCuit.Clear;
      edAcreedor.Clear;
      fraFormaCobro.Clear;
      edCodArea.Clear;
      edTelefono.Clear;
      edDomicilio.Clear;
      fraDomicilio.Clear;
      fraRetGanancias.Clear;
      fraRetIB.Clear;
      dcFechaForm.Clear;
      chkRetCajaMed.Checked := False;
      chkConcertado.Checked := False;
    end
    else if (ABMAction = aaModify) then begin
      if not(sdqDatosPA_FECHABAJA.IsNull) and
         not(MsgAsk('Se dispone a reincorporar un acreedor dado de baja.' + #13 + '¿Está usted Seguro?')) then
            Exit;

      LockControl(edCuit, True);
      fraTipoAcreedor.Codigo    := sdqDatosPA_ACREEDOR.AsString;
      chkConcertado.Checked     := (sdqDatosPA_CONCERTADO.AsString = 'S');
      edCuit.Text               := sdqDatosPA_CUITCUIL.AsString;
      edAcreedor.Text           := sdqDatosPA_DENOMINA.AsString;
      fraFormaCobro.Codigo      := sdqDatosPA_FORMACOBRO.AsString;
      edCodArea.Text            := sdqDatosPA_TELCOD.AsString;
      edTelefono.Text           := sdqDatosPA_TELNUM.AsString;
      edDomicilio.Text          := sdqDatosPA_DOMICILIO.AsString;
      fraRetGanancias.Codigo    := sdqDatosPA_RETGANANCIAS.AsString;
      fraRetIB.Codigo           := sdqDatosPA_RETINGRESOSBRUTOS.AsString;
      chkRetCajaMed.Checked     := (sdqDatosPA_RETENCAJAMED.AsString = 'S');
      dcFechaForm.Date          := sdqDatosPA_FECHAIMPRESIONFORMINSCR.AsDateTime;
      with fraDomicilio do
      begin
        Calle        := sdqDatosPA_CALLE.AsString;
        Numero       := sdqDatosPA_NUMERO.AsString;
        Piso         := sdqDatosPA_PISO.AsString;
        Departamento := sdqDatosPA_DEPARTAMENTO.AsString;
        CodigoPostal := sdqDatosPA_CPOSTAL.AsString;
        CPA          := sdqDatosPA_CODPOSTALA.AsString;
        Localidad    := sdqDatosPA_LOCALIDAD.AsString;
        Provincia    := sdqDatosPROVINCIA.AsString;
        if sdqDatosPA_PROVINCIA.IsNull then
          Prov := -1
        else
          Prov := sdqDatosPA_PROVINCIA.AsInteger;
      end;
    end;
  end;

  if ABMAction <> aaDelete then
    begin
      fpEditor.Tag := Integer(ABMAction);
      fpEditor.ShowModal;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAcreed.FormCreate(Sender: TObject);
begin
  fraFormaCobro.Clave             := 'COBRO';
  fraRetGanancias.Clave           := 'RETGA';
  fraRetIB.Clave                  := 'RETIB';
  fraTipoAcreedor.Clave           := 'TACRE';
  fraTipoAcreedor.ExtraCondition  := ' AND tb_codigo IN (''OA'', ''PA'') ';
  dcFechaForm.MaxDate             := DBDate;
end;
{-------------------------------------------------------------------------------}
function TfrmManAcreed.ValidarDatos :Boolean;
begin
  Verificar(fraTipoAcreedor.IsEmpty, fraTipoAcreedor, 'Debe seleccionar el tipo de acreedor.');
  Verificar((Length(edCuit.Text) <> 11), edCuit, 'Debe ingresar el CUIT o CUIL del acreedor.');
  Verificar(not(IsCuit(edCuit.Text)), edCuit, 'El CUIT o CUIL no es válido.');
  Verificar(Trim(edAcreedor.Text) = '', edAcreedor, 'Debe ingresar el acreedor.');
  Verificar(fraFormaCobro.IsEmpty, fraFormaCobro, 'Debe seleccionar la forma de cobro.');
  Verificar(fraRetGanancias.IsEmpty, fraRetGanancias, 'Debe ingresar el tipo de retención de ganancias.');
  Result := fraDomicilio.IsValid and fraDomicilio.ValidarPermisoCalle;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAcreed.ABMDialogGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
   if not sdqDatosPA_FECHABAJA.IsNull then AFont.Color := clRed;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAcreed.btnCuentasBancariasClick(Sender: TObject);
begin
  if not sdqDatos.Eof and edCuit.ReadOnly then
    with TfrmManCCP_CUENTAPAGO.Create(Self) do
    begin
      FormStyle := fsNormal;
      Execute(fraTipoAcreedor.Codigo, ART_EMPTY_ID, edCuit.Text);
    end
  else
    MsgBox('No ha seleccionado ningún acreedor.');
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAcreed.ABMDialogBeforeExport(Sender: TObject; var Cancel: Boolean);
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) then
    begin
      try
        ABMDialog.ABMForm.tbSave.Enabled := False;
        ExportDialog.DataSet := ABMDialog.ABMForm.DBGrid.DataSource.DataSet;
        ExportDialog.Fields.Assign(ABMDialog.ABMForm.DBGrid.Columns);
        ExportDialog.Execute;
      finally
        ExportDialog.Fields.Clear;
        ABMDialog.ABMForm.tbSave.Enabled := True;
      end;
    end;

  Cancel := True;
end;
{-------------------------------------------------------------------------------}
end.

