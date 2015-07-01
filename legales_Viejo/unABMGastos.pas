{----------------------------------------------------------------------------------------------------------------------
   Modulo de ABL de Gastos.
   Autor: EVila.
}
unit unABMGastos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unFraCtbTablas, unFraEmpresa, unArtFrame, unFraCodigoDescripcion,
  StdCtrls, IntEdit, RxLookup, CurrEdit, Mask, ToolEdit,
  DateComboBox, FormPanel, Menus, PatternEdit;

type
  TfrmABMGastos = class(TfrmCustomConsulta)
    frmPanelABMGastos: TFormPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    lbNroGasto: TLabel;
    lbConcepto: TLabel;
    lbFecha: TLabel;
    lbMonto: TLabel;
    lbBeneficiario: TLabel;
    lbObservaciones: TLabel;
    edGS_NROGASTO: TIntEdit;
    edGS_FECHA: TDateComboBox;
    edGS_MONTO: TCurrencyEdit;
    edGS_BENEFICIARIO: TEdit;
    eGS_OBSERVACIONES: TMemo;
    sdqConcepto: TSDQuery;
    dsConcepto: TDataSource;
    cmbConcepto: TRxDBLookupCombo;
    lbNroOrden: TLabel;
    lbCaratula: TLabel;
    lbAbogado: TLabel;
    lbFuero: TLabel;
    lbJuzgado: TLabel;
    lbSecretaria: TLabel;
    lbJurisdiccion: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edGD_NROORDEN: TIntEdit;
    edGD_CARATULA: TEdit;
    edGD_JUZGADO: TIntEdit;
    edGD_SECRETARIA: TIntEdit;
    edGD_GESTOR: TEdit;
    edGE_NOMBRE: TEdit;
    edGD_ABOGADO: TEdit;
    edBO_NOMBRE: TEdit;
    edGD_FUERO: TEdit;
    edFUERO: TEdit;
    edGD_JURISDICCION: TEdit;
    edJURISDICCION: TEdit;
    edMP_CONTRATO: TEdit;
    edMP_NOMBRE: TEdit;
    edGD_CUIT: TMaskEdit;
    edGD_FECHAASIGN: TEdit;
    edGD_CARTERA: TEdit;
    pmnuImpresion: TPopupMenu;
    mnuImprResultados: TMenuItem;
    mnuImprGastos: TMenuItem;
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure GridGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure tbSalirDefinitivoClick(Sender: TObject);
    procedure mnuImprResultadosClick(Sender: TObject);
    procedure mnuImprGastosClick(Sender: TObject);
  private
  public
        function GetExecute(AOrden: Integer) : boolean;
  end;

var
  frmABMGastos: TfrmABMGastos;

const
  TitGASTOS_Alta           = 'Alta de Gastos';
  TitGASTOS_Bajas          = 'Baja de Gastos' ;
  TitGASTOS_Consulta       = 'Contulta de Gastos';

implementation

uses unPrincipal, CustomDlgs, General, AnsiSql, SqlFuncs, unDmPrincipal,
     UnRptGasto, unfraAbogadosLegales;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmABMGastos }
{----------------------------------------------------------------------------------------------------------------------}
// Function que se usa para cargar los datos del gasto cuando es llamado desde otro form.
function TfrmABMGastos.GetExecute(AOrden: Integer): boolean;
var
  sSql : string;
  sdqCarga : TSDQuery;
begin
  sSql := 'SELECT GD_NROORDEN, GD_CARATULA, GD_FECHAASIGN, GD_CARTERA, ' +
                 'GD_GESTOR, GE_NOMBRE, ' +
                 'GD_ABOGADO, BO_NOMBRE, ' +
                 'GD_CUIT, MP_NOMBRE, MP_CONTRATO, ' +
                 'GD_FUERO, FUERO.TB_DESCRIPCION FUERO, ' +
                 'GD_JUZGADO, GD_SECRETARIA, ' +
                 'GD_JURISDICCION, JURIS.JU_DESCRIPCION JURISDICCION ' +
            'FROM CMP_EMPRESAS, LGD_GESTIONDEUDA, AGE_GESTORCUENTA, LEGALES.LBO_ABOGADO, ' +
                 'CTB_TABLAS FUERO, LEGALES.LJU_JURISDICCION JURIS ' +
           'WHERE MP_CUIT = GD_CUIT ' +
             'AND GE_CODGESTOR(+) = GD_GESTOR ' +
             'AND BO_ID(+) = GD_ABOGADO ' +
             'AND FUERO.TB_CLAVE(+) = ''FUERO'' ' +
             'AND FUERO.TB_CODIGO(+) = GD_FUERO ' +
             'AND JURIS.JU_ID(+) = TO_NUMBER(GD_JURISDICCION) ' +
             'AND GD_NROORDEN = ' + SqlValue( AOrden );

  sdqCarga := GetQuery(sSql);
  try
    edGD_NROORDEN.Value    := AOrden;
    edGD_CARATULA.Text     := sdqCarga.FieldByName('GD_CARATULA').asString;
    edGD_GESTOR.Text       := sdqCarga.FieldByName('GD_GESTOR').asString;
    edGE_NOMBRE.Text       := sdqCarga.FieldByName('GE_NOMBRE').asString;
    edGD_ABOGADO.Text      := sdqCarga.FieldByName('GD_ABOGADO').asString;
    edBO_NOMBRE.Text       := sdqCarga.FieldByName('BO_NOMBRE').asString;
    edGD_CUIT.Text         := sdqCarga.FieldByName('GD_CUIT').asString;
    edMP_NOMBRE.Text       := sdqCarga.FieldByName('MP_NOMBRE').asString;
    edMP_CONTRATO.Text     := sdqCarga.FieldByName('MP_CONTRATO').asString;
    edGD_FUERO.Text        := sdqCarga.FieldByName('GD_FUERO').asString;
    edFUERO.Text           := sdqCarga.FieldByName('FUERO').asString;
    edGD_JUZGADO.Text      := sdqCarga.FieldByName('GD_JUZGADO').asString;
    edGD_SECRETARIA.Text   := sdqCarga.FieldByName('GD_SECRETARIA').asString;
    edGD_JURISDICCION.Text := sdqCarga.FieldByName('GD_JURISDICCION').asString;
    edJURISDICCION.Text    := sdqCarga.FieldByName('JURISDICCION').asString;
    edGD_FECHAASIGN.Text   := sdqCarga.FieldByName('GD_FECHAASIGN').asString;
    edGD_CARTERA.Text      := sdqCarga.FieldByName('GD_CARTERA').asString;
  finally
    sdqCarga.Free;
  end;

   sdqConsulta.ParamByName('NROORDEN').asInteger := AOrden;
   tbRefrescarClick( Nil );

   // Muestra la ventana y devuelve Ok si todo esta bien.
   Result := ShowModal = mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Alta de un nuevo Gasto.
procedure TfrmABMGastos.tbNuevoClick(Sender: TObject);
begin
  if self.tag=0 then begin
      Try
         edGS_NROGASTO.Clear;
         cmbConcepto.ClearValue;
         edGS_FECHA.Clear;
         edGS_MONTO.Clear;
         edGS_BENEFICIARIO.Clear;
         eGS_OBSERVACIONES.Clear;
         //
         sdqConcepto.Active := True;
         frmPanelABMGastos.Caption := TitGASTOS_Alta;
         if frmPanelABMGastos.ShowModal = mrOk Then
            tbRefrescarClick( Nil );
         sdqConcepto.Close;
      Except                                                // Si existe algun erro en el proceso lo captura para su tratamiento.
        on E: Exception do begin
           ErrorMsg( E );                                  // Muestra el mensaje de error.
        end;
      end;
  end else begin
      msgbox('No puede agregar un gasto ya que el juicio esta cerrado.',0,'Error de Gastos')
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Baja de un Gasto Existente.
procedure TfrmABMGastos.tbEliminarClick(Sender: TObject);
begin
  if self.tag=0 then begin
    if NOT sdqConsulta.IsEmpty then begin
        Try
           sdqConcepto.Active := True;
           edGS_NROGASTO.Text       := sdqConsulta.FieldByName( 'gs_nrogasto' ).asString;
           cmbConcepto.Value        := sdqConsulta.FieldByName( 'gs_concepto' ).asString;
           edGS_FECHA.Date          := sdqConsulta.FieldByName( 'gs_fecha' ).asDateTime;
           edGS_MONTO.Value         := sdqConsulta.FieldByName( 'gs_monto' ).asInteger;
           edGS_BENEFICIARIO.Text   := sdqConsulta.FieldByName( 'gs_beneficiario' ).asString;
           eGS_OBSERVACIONES.Text   := sdqConsulta.FieldByName( 'gs_observaciones' ).asString;
           //
           frmPanelABMGastos.Caption := TitGASTOS_Bajas;
           if frmPanelABMGastos.ShowModal = mrOk Then
              tbRefrescarClick( Nil );
           sdqConcepto.Close;
        Except                                                // Si existe algun erro en el proceso lo captura para su tratamiento.
          on E: Exception do begin
             ErrorMsg( E );                                  // Muestra el mensaje de error.
          end;
        end;
    end;
    end else begin
      msgbox('No puede Borrar un gasto ya que el juicio esta cerrado.',0,'Error de Gastos')
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Boton de Aceptar del FromPanel de Alta o Baja.
procedure TfrmABMGastos.btnAceptarClick(Sender: TObject);
Var sSqlTrans : TSql;
    bTodoOK   : Boolean;
    iNroGasto : Integer;
begin
    if frmPanelABMGastos.Caption = TitGASTOS_Alta then begin
       // control
       bTodoOK := True;
       if cmbConcepto.Text = '' then begin
          invalidMsg( cmbConcepto, 'El concepto de pago no puede quedar en blanco' );
          bTodoOK := False;
       end;
       if edGS_FECHA.IsEmpty then begin
          InvalidMsg( edGS_FECHA, 'La fecha no puede quedar en blanco' );
          bTodoOK := False;
       end;
       if edGS_MONTO.Value <= 0 then begin
          InvalidMsg(edGS_MONTO, 'El monto no puede ser menor o igual a 0 (cero)' );
          bTodoOK := False;
       end;
       if edGS_BENEFICIARIO.Text = '' then begin
          InvalidMsg( edGS_BENEFICIARIO, 'El beneficiario no puede quedar en blanco' );
          bTodoOK := False;
       end;
       // Fin Control...
       if bTodoOK then begin
         iNroGasto := ValorSql('SELECT NVL(Max( GS_NROGASTO ), 0) +1 FROM LGS_GASTOSGDEUDA WHERE GS_NROORDEN = ' + IntToStr( edGD_NROORDEN.Value ) );
         sSqlTrans := TSql.Create('LGS_GASTOSGDEUDA');
         sSqlTrans.Fields.Add( 'GS_NROORDEN', edGD_NROORDEN.Text );
         sSqlTrans.Fields.Add( 'GS_NROGASTO', IntToStr(iNroGasto), False );
         sSqlTrans.Fields.Add( 'GS_CONCEPTO', sdqConcepto.FieldByName( 'cp_ConPago').asString );
         sSqlTrans.Fields.Add( 'GS_FECHA', edGS_FECHA.Date );
         sSqlTrans.Fields.AddExtended( 'GS_MONTO', edGS_MONTO.Value, ALL_DECIMALS, False );
         sSqlTrans.Fields.Add( 'GS_BENEFICIARIO', edGS_BENEFICIARIO.Text );
         sSqlTrans.Fields.Add( 'GS_OBSERVACIONES', eGS_OBSERVACIONES.Text );
         sSqlTrans.Fields.Add( 'GS_USUALTA', frmPrincipal.DBLogin.UserId );
         sSqlTrans.Fields.Add( 'GS_FECHAALTA', 'Actualdate', False);
         Try
            EjecutarSQL( sSqlTrans.InsertSql );
            msgBox('El alta se realizó con exito', MB_ICONEXCLAMATION, 'Atención');
            frmPanelABMGastos.ModalResult := mrOk;
         Finally
            sSqlTrans.Free;
         end;
       end;
    end else if frmPanelABMGastos.Caption = TitGASTOS_Bajas then begin
        if msgBox( '¿Esta Ud. seguro que desea dar de baja este Gasto?', MB_ICONINFORMATION + MB_YESNO, 'Atención' ) = ID_YES then begin
           sSqlTrans := TSql.Create('LGS_GASTOSGDEUDA');
           sSqlTrans.PrimaryKey.Add( 'GS_NROORDEN', edGD_NROORDEN.Text );
           sSqlTrans.PrimaryKey.Add( 'GS_NROGASTO', edGS_NROGASTO.Text );
           sSqlTrans.Fields.Add( 'GS_USUMODIF', frmPrincipal.DBLogin.UserId );
           sSqlTrans.Fields.Add( 'GS_FECHAMODIF', 'Actualdate', False);
           sSqlTrans.Fields.Add( 'GS_FECHABAJA', 'Actualdate', False);
           Try
              EjecutarSQL( sSqlTrans.UpdateSql );
              msgBox('La baja se realizó con exito', MB_ICONEXCLAMATION, 'Atención');
              frmPanelABMGastos.ModalResult := mrOk;
           Finally
              sSqlTrans.Free;
           end;
        end;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMGastos.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMGastos.GridGetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
  inherited;
  if sdqConsulta.FieldByName('GS_FECHABAJA').IsNull then begin
     Afont.color:=clBlack;
  end else begin
     Afont.color:=clRed;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMGastos.tbSalirDefinitivoClick(Sender: TObject);
begin
     ModalResult := mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMGastos.mnuImprResultadosClick(Sender: TObject);
begin
  QueryPrint.SubTitle.Lines.Clear;
  QueryPrint.SubTitle.Lines.Add( 'Nro. Orden: ' + edGD_NROORDEN.Text );
  QueryPrint.SubTitle.Lines.Add( 'Carátula: '   + edGD_CARATULA.Text );
  QueryPrint.SubTitle.Lines.Add( 'Abogado: '    + fraAbogadosLegales.cmbDescripcion.Text + '    ' + 'CUIT: '+ edGD_CUIT.Text + '    ' + 'Contrato: '+ edMP_CONTRATO.Text);
  PrintResults;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmABMGastos.mnuImprGastosClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('GS_FECHABAJA').IsNull then
    with TRptGasto.Create( Self ) do
    try
      VistaPrevia( edGD_NROORDEN.Value, sdqconsulta.Fieldbyname('gs_nrogasto').AsInteger );
    finally
      Free;
    end
  else
    MsgBox('No puede imprimir un gasto dado de baja', MB_ICONEXCLAMATION, 'Gasto dado de baja');
end;
{----------------------------------------------------------------------------------------------------------------------}
end.



