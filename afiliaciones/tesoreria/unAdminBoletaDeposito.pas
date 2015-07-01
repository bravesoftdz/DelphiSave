unit unAdminBoletaDeposito;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   22-08-03
 ULTIMA MODIFICACION: 17-09-03

 Modificación: FFirenze (02/2004)
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ToolEdit, DateComboBox, unArtFrame,
  unFraStaticCodigoDescripcion, CurrEdit, IntEdit, Mask, PatternEdit, unfraCuentaBancaria, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmAdminBoletaDeposito = class(TfrmCustomGridABM)
    lbBancoBoletaDeposito: TLabel;
    lbSerieBoletaDeposito: TLabel;
    lbNumeroBoletaDeposito: TLabel;
    Label7: TLabel;
    edSerieBoletaDeposito: TPatternEdit;
    edNumeroBoletaDeposito: TIntEdit;
    edfpMontoBoletaDeposito: TCurrencyEdit;
    cmbFechaBoletaDeposito: TDateComboBox;
    Label1: TLabel;
    gbFecha: TGroupBox;
    Label6: TLabel;
    cmbBD_FECHADesde: TDateComboBox;
    Label5: TLabel;
    cmbBD_FECHAHasta: TDateComboBox;
    gbNumero: TGroupBox;
    edBD_NUMERODesde: TIntEdit;
    Label4: TLabel;
    edBD_NUMEROHasta: TIntEdit;
    Label8: TLabel;
    gbOpciones: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edBD_SERIE: TPatternEdit;
    chkPendientes: TCheckBox;
    fraBD_IDCUENTABANCARIA: TfraCuentaBancaria;
    fraBancoBoletaDeposito: TfraCuentaBancaria;
    tbAprobar: TToolButton;
    fpClearing: TFormPanel;
    Bevel1: TBevel;
    lbClearing: TLabel;
    btnAceptar2: TButton;
    btnCancelar2: TButton;
    fraClearing: TfraCodigoDescripcion;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject); {$IFDEF REFRESH} override; {$ENDIF}
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure btnAceptar2Click(Sender: TObject);
    procedure fpClearingEnter(Sender: TObject);
  private
  protected
    function DoABM: boolean; override;
    function Validar: boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmAdminBoletaDeposito: TfrmAdminBoletaDeposito;

implementation

{$R *.DFM}

uses
  unPrincipal, AnsiSql, SqlFuncs, undmPrincipal, VCLExtra, unFiltros, CustomDlgs, DBSql,
  unSesion;

procedure TfrmAdminBoletaDeposito.FormCreate(Sender: TObject);
begin
  inherited;

  with fraClearing do
  begin
    ShowBajas   := False;
    TableName   := 'RCB_CLEARINGBANCARIO';
    FieldID     := 'CB_ID';
    FieldCodigo := 'CB_ID';
    FieldDesc   := 'CB_DESCRIPCION';
    FieldBaja   := 'CB_FECHABAJA';
    OrderBy     := 'CB_DIAS';
  end;

  Sql.TableName := 'RBD_BOLETADEPOSITO';
end;

procedure TfrmAdminBoletaDeposito.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text := 'SELECT RBD.BD_ID, RBD.BD_IDCUENTABANCARIA, ZBA.BA_CODIGO, ZCB.CB_SUCURSAL, ' +
                                 'ZCB.CB_NUMERO, ZBA.BA_NOMBRE, RBD.BD_SERIE, RBD.BD_NUMERO, RBD.BD_MONTO, ' +
                                 'RBD.BD_FECHA, RCB.CB_DESCRIPCION CLEARING ' +
                            'FROM RCB_CLEARINGBANCARIO RCB, ZCB_CUENTABANCARIA ZCB, ' +
                                 'ZBA_BANCO ZBA, RBD_BOLETADEPOSITO RBD ' +
                           'WHERE ZCB.CB_ID = RBD.BD_IDCUENTABANCARIA ' +
                             'AND ZCB.CB_IDBANCO = ZBA.BA_ID ' +
                             'AND RCB.CB_ID(+) = RBD.BD_IDCLEARING ' +
                                  DoFiltro(gbOpciones) + ' ' +
                                  DoFiltro(gbNumero) + ' ' +
                                  DoFiltro(gbFecha);

  if chkPendientes.Checked then
    sdqConsulta.Sql.Add(' AND RBD.BD_FECHA IS NULL');

  sdqConsulta.Sql.Add(SortDialog.OrderBy);

  inherited;
end;

procedure TfrmAdminBoletaDeposito.tbModificarClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('BD_FECHA').IsNull then
    InvalidMsg(nil, 'La boleta ya posee fecha de depósito.')
  else
    inherited;
end;

function TfrmAdminBoletaDeposito.Validar: boolean;
begin
  Verificar(fraBancoBoletaDeposito.IsEmpty, fraBancoBoletaDeposito.edCodigo, 'Debe indicar la cuenta bancaria de la boleta.');
  Verificar(edSerieBoletaDeposito.Text = '', edSerieBoletaDeposito, 'Debe indicar la serie de la boleta.');
  Verificar(edNumeroBoletaDeposito.IsEmpty, edNumeroBoletaDeposito, 'Debe indicar el número de la boleta.');

  Result := True;
end;

function TfrmAdminBoletaDeposito.DoABM: boolean;
begin
  Sql.Clear;

  Sql.SqlType := stUpdate;
  Sql.PrimaryKey.Add( 'BD_ID', sdqConsulta.FieldByName('BD_ID').AsString, False);
  Sql.Fields.Add( 'BD_IDCUENTABANCARIA', fraBancoBoletaDeposito.Value, False);
  Sql.Fields.Add( 'BD_SERIE', edSerieBoletaDeposito.Text);
  Sql.Fields.Add( 'BD_NUMERO', edNumeroBoletaDeposito.Text, False);
  Sql.Fields.Add( 'BD_FECHAMODIF', SQL_ACTUALDATE, False);
  Sql.Fields.Add( 'BD_USUMODIF', Sesion.UserID);

  Result := inherited DoABM;
end;

procedure TfrmAdminBoletaDeposito.ClearControls;
begin
  fraBancoBoletaDeposito.Clear;
  edSerieBoletaDeposito.Clear;
  edNumeroBoletaDeposito.Clear;
  cmbFechaBoletaDeposito.Clear;
end;

procedure TfrmAdminBoletaDeposito.LoadControls;
begin
  fraBancoBoletaDeposito.Value  := sdqConsulta.FieldByName( 'BD_IDCUENTABANCARIA' ).AsInteger;
  edSerieBoletaDeposito.Text    := sdqConsulta.FieldByName( 'BD_SERIE' ).AsString;
  edNumeroBoletaDeposito.Value  := sdqConsulta.FieldByName( 'BD_NUMERO' ).AsInteger;
  cmbFechaBoletaDeposito.Date   := sdqConsulta.FieldByName( 'BD_FECHA' ).AsDateTime;
  edfpMontoBoletaDeposito.Value := sdqConsulta.FieldByName( 'BD_MONTO' ).AsFloat;
  VCLExtra.LockControls( [cmbFechaBoletaDeposito, edfpMontoBoletaDeposito], True );
  //VCLExtra.LockControls( [cmbFechaBoletaDeposito, btnAceptar, btnCancelar], False );
end;

procedure TfrmAdminBoletaDeposito.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraBD_IDCUENTABANCARIA.Clear;
  edBD_SERIE.Clear;
  chkPendientes.Checked := False;
  edBD_NUMERODesde.Clear;
  edBD_NUMEROHasta.Clear;
  cmbBD_FECHADesde.Clear;
  cmbBD_FECHAHasta.Clear;
end;

procedure TfrmAdminBoletaDeposito.tbAprobarClick(Sender: TObject);
var
  FechaCaja: TDateTime;
begin
  Verificar(sdqConsulta.FieldByName('BD_FECHA').AsString <> '', nil, 'La boleta ya posee fecha de depósito.');

  FechaCaja := ValorSqlDateTime('SELECT TESORERIA.GET_FECHACAJAACTIVA(''I'') FROM DUAL');
  Verificar(FechaCaja = 0, nil, 'La caja de Ingreso no está abierta.');

//  if (msgBox('¿Está seguro de querer aprobar está boleta de depósito?', MB_YESNO) = IDYES) then
  if fpClearing.ShowModal = mrOK then
  begin
    Sql.Clear;
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add( 'BD_ID', sdqConsulta.FieldByName('BD_ID').AsString, False);
    Sql.Fields.Add( 'BD_FECHA', FechaCaja);
    Sql.Fields.Add( 'BD_IDCLEARING', fraClearing.Value, False);
    Sql.Fields.Add( 'BD_FECHAMODIF', exDateTime);
    Sql.Fields.Add( 'BD_USUMODIF', Sesion.UserID);

    if Sql is TDBSql Then
      TDBSql(Sql).Execute
    else
      EjecutarSql(Sql.Sql);

    MessageDlg('La operación se ha efectuado con éxito.', mtInformation, [mbOK], 0);
    tbRefrescarClick ( nil );
  end;
end;

procedure TfrmAdminBoletaDeposito.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
    TFloatField(FieldByName('BD_MONTO')).Currency := True;
end;

procedure TfrmAdminBoletaDeposito.btnAceptar2Click(Sender: TObject);
begin
  Verificar(fraClearing.IsEmpty, fraClearing.edCodigo, 'Debe seleccionar el tipo de clearing bancario.');
  fpClearing.ModalResult := mrOk;
end;

procedure TfrmAdminBoletaDeposito.fpClearingEnter(Sender: TObject);
begin
  fraClearing.Clear;
end;

end.
