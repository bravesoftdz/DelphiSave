unit unManEstudioRiesgo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, unfraRiesgo, StdCtrls,
  ExtCtrls, QueryPrint, SortDlg, QueryToFile, ExportDialog,
  ShortCutControl, Db, SDEngine, unfraEstudio, Placemnt, Mask, ToolEdit,
  CurrEdit, FormPanel, artSeguridad, IntEdit, unArtFrame,
  unFraCodigoDescripcion, PatternEdit, unArtDBAwareFrame;

type
  TfrmManEstudioRiesgo = class(TForm)
    pnlFiltros: TPanel;
    lbRiesgo: TLabel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbLimpiar: TToolButton;
    SEP2: TToolButton;
    tbOrdenar: TToolButton;
    SEP3: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    SEP4: TToolButton;
    tbSalir: TToolButton;
    DBGrid: TRxDBGrid;
    tbAgregar: TToolButton;
    tbEliminar: TToolButton;
    SEP1: TToolButton;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    ShortCutControl: TShortCutControl;
    ExportDialog: TExportDialog;
    SortDialog: TSortDialog;
    QueryPrint: TQueryPrint;
    fraRiesgoFiltro: TfraRiesgo;
    fraEstudioFiltro: TfraEstudio;
    lbEstudio: TLabel;
    FormPlacement: TFormPlacement;
    PrintDialog: TPrintDialog;
    Seguridad: TSeguridad;
    tbModificar: TToolButton;
    fpABM: TFormPanel;
    lbEstudioABM: TLabel;
    lbRiesgoABM: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edPeriodicidad: TIntEdit;
    Label6: TLabel;
    edValorMinimo: TCurrencyEdit;
    edValorMaximo: TCurrencyEdit;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraEstudioABM: TfraEstudio;
    fraRiesgoABM: TfraRiesgo;
    lbMedida1: TLabel;
    lbMedida2: TLabel;
    chkExcluirBaja: TCheckBox;
    procedure tbAgregarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
    procedure btnAceptarClick(Sender: TObject);
    procedure DBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
  private
    procedure OnEstudioABMChange(Sender: TObject);
  public
  end;

var
  frmManEstudioRiesgo: TfrmManEstudioRiesgo;

implementation

uses unDmPrincipal, General, CustomDlgs, AnsiSql, unPrincipal;

Const
     CAP_ALTA    = 'Alta de Estudios por Riesgo';
     CAP_MODIFIC = 'Modificación de Estudios por Riesgo';

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.tbAgregarClick(Sender: TObject);
begin
     fraEstudioABM.Codigo := fraEstudioFiltro.edCodigo.Text;
     OnEstudioABMChange( Nil );

     fraRiesgoABM.Codigo       := fraRiesgoFiltro.Codigo ;
     fraRiesgoABM.cmbDescripcion.Text := fraRiesgoFiltro.cmbDescripcion.Text ;

     edValorMinimo.Text  := '';
     edValorMaximo.Text  := '';
     edPeriodicidad.Text := '';

     fraEstudioABM.Enabled := True;
     fraRiesgoABM.Enabled  := True;

     fpABM.ActiveControl := fraRiesgoABM.edCodigo ;
     fpABM.Caption := CAP_ALTA;
     fpABM.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('ER_BAJAESTUDIO').AsString = 'S' then
  begin
    MsgBox('El estudio asociado fue dado de baja. ' + #13 + 'No es posible modificar los datos.', MB_OK + MB_ICONERROR);
    Exit
  end;

     if sdqConsulta.FieldByName('ER_FECHABAJA').IsNull or (MsgBox('El registro seleccionado esta dado de baja.' + #13 + '¿Desea reactivarlo?', MB_YESNO + MB_ICONQUESTION) = IDYES) Then begin
        fraEstudioABM.Codigo := sdqConsulta.FieldByName('ER_ESTUDIO').AsString;
        OnEstudioABMChange( Nil );

        fraRiesgoABM.Value   := sdqConsulta.FieldByName('er_idrg').AsInteger;

        edValorMinimo.Value  := sdqConsulta.FieldByName('ER_MINIMONORMAL').AsCurrency ;
        edValorMaximo.Value  := sdqConsulta.FieldByName('ER_MAXIMONORMAL').AsCurrency ;
        edPeriodicidad.Value := sdqConsulta.FieldByName('ER_PERIODICIDAD').AsInteger  ;

        fraEstudioABM.Enabled := False;
        fraRiesgoABM.Enabled  := False;

        fpABM.ActiveControl := edValorMinimo;
        fpABM.Caption := CAP_MODIFIC;
        fpABM.ShowModal;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{
procedure TfrmManEstudioRiesgo.tbAgregarClick(Sender: TObject);
var Sql : String;
begin
     if fraRiesgo.edCodigo.Text = '' Then begin
        MsgBox('Debe seleccionar el Riesgo', MB_ICONEXCLAMATION);
        fraRiesgo.edCodigo.SetFocus ;

     end else if fraEstudio.edCodigo.Text = '' Then begin
        MsgBox('Debe seleccionar el Estudio', MB_ICONEXCLAMATION);
        fraEstudio.edCodigo.SetFocus ;

     end else begin
         Sql := 'INSERT INTO AER_ESTRIESG ' +
                '(ER_RIESGO, ER_ESTUDIO) VALUES (' +
                '''' + fraRiesgo.edCodigo.Text + ''', ' +
                '''' + fraEstudio.edCodigo.Text + ''')';
         Try
            EjecutarSql( Sql );
            RefreshAndLocate(sdqConsulta, ['ER_RIESGO', 'ER_ESTUDIO'], [fraRiesgo.edCodigo.Text, fraEstudio.edCodigo.Text]);
          except
             on E: Exception do ErrorMsg(E);
          end;
     end;
end;
}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.tbEliminarClick(Sender: TObject);
var Sql : String;
begin
     if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and sdqConsulta.FieldByName('ER_FECHABAJA').IsNull then
        if MsgBox('Se dispone a eliminar la relación seleccionada.' + #13 + '¿Está usted seguro?', MB_ICONQUESTION + MB_YESNO) = IDYES then begin
           Sql := 'UPDATE AER_ESTRIESG ' +
                     'SET ER_USUBAJA = ''' + frmPrincipal.DBLogin.LoginName + ''', ' +
                         'ER_FECHABAJA = ACTUALDATE, ' +
                         'ER_BAJAESTUDIO = ' + SqlValue ('N')+
                   'WHERE er_idrg = ''' + sdqConsulta.FieldByName('er_idrg').AsString + '''' +
                    ' AND ER_ESTUDIO = ''' + sdqConsulta.FieldByName('ER_ESTUDIO').AsString + '''';
            //--------------------------------------------------------------------------------------------------------------
           Try
              EjecutarSql( Sql );
              RefreshAndRelocate(sdqConsulta, ['ER_RIESGO', 'ER_ESTUDIO']);
            except
               on E: Exception do ErrorMsg(E);
            end;
        end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.tbRefrescarClick(Sender: TObject);
Var Sql : String;
begin
     Sql := ' SELECT ER_RIESGO, RG_DESCRIPCION, ER_ESTUDIO, ES_DESCRIPCION, ER_MINIMONORMAL, ER_MAXIMONORMAL, ' +
                    'ER_PERIODICIDAD, ES_UMEDIDA, ER_FECHABAJA, ER_IDRG, ER_BAJAESTUDIO, RG_ESOP || RG_SUFIJOESOP ESOP ' +
              ' FROM AER_ESTRIESG, PRG_RIESGOS, AES_ESTUDIOS ' +
             ' WHERE ER_IDRG = RG_ID ' +
               ' AND ER_ESTUDIO = ES_CODIGO ';

     if fraRiesgoFiltro.Codigo <> '' Then
        Sql := Sql + 'AND ER_IDRG = ''' + fraRiesgoFiltro.ID + ''' ';

     if fraEstudioFiltro.Codigo <> '' Then
        Sql := Sql + 'AND ER_ESTUDIO = ''' + fraEstudioFiltro.Codigo + ''' ';

     if chkExcluirBaja.Checked Then
        Sql := Sql + 'AND ER_FECHABAJA IS NULL ';

     OpenQuery(sdqConsulta, Sql + SortDialog.Orderby, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.tbLimpiarClick(Sender: TObject);
begin
     fraRiesgoFiltro.Clear ;
     fraEstudioFiltro.Clear;
     chkExcluirBaja.Checked := false;
     sdqConsulta.Close ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.tbOrdenarClick(Sender: TObject);
begin
     SortDialog.Execute;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.tbImprimirClick(Sender: TObject);
begin
     if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
        if PrintDialog.Execute then begin
           QueryPrint.Footer.Text := frmPrincipal.dbLogin.Usuario;
           QueryPrint.Print ;
        end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.tbSalirClick(Sender: TObject);
begin
     Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     frmPrincipal.mnuEstudiosporRiesgo.Enabled := True;
     Action := caFree;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.tbExportarClick(Sender: TObject);
begin
     if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
        ExportDialog.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.FormCreate(Sender: TObject);
begin
     tbRefrescarClick( Nil );
     fraRiesgoFiltro.FieldCodigo := 'RG_ESOP || RG_SUFIJOESOP';
     fraRiesgoFiltro.ShowBajas := true;
     fraRiesgoABM.FieldCodigo := 'RG_ESOP || RG_SUFIJOESOP';
     fraRiesgoABM.ShowBajas := true;
     fraEstudioABM.ExtraFields := ' ,ES_UMEDIDA, ES_MAXIMO, ES_MINIMO ';
     fraEstudioABM.ShowBajas := true;
     fraEstudioABM.OnChange := OnEstudioABMChange;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.OnEstudioABMChange(Sender: TObject);
begin
{
     edValorMinimo.MinValue := fraEstudioABM.sdqDatosES_MINIMO.AsInteger;
     edValorMinimo.MaxValue := fraEstudioABM.sdqDatosES_MAXIMO.AsInteger;

     edValorMaximo.MinValue := fraEstudioABM.sdqDatosES_MINIMO.AsInteger;
     edValorMaximo.MaxValue := fraEstudioABM.sdqDatosES_MAXIMO.AsInteger;
 }
     if fraEstudioABM.IsSelected then
     begin
       lbMedida1.Caption := fraEstudioABM.sdqDatos.FieldByName('ES_UMEDIDA').AsString;
       lbMedida2.Caption := fraEstudioABM.sdqDatos.FieldByName('ES_UMEDIDA').AsString;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.DBGridDblClick(Sender: TObject);
begin
     if tbModificar.Enabled then
        tbModificarClick( nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.DBGridTitleClick(Column: TColumn);
begin
     SortDialog.SortBy( SortDialog.SortFields.ItemsByField[Column.Field.FieldName], otNone);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.btnAceptarClick(Sender: TObject);
var
  Sql : String;
begin
  if fraEstudioABM.IsEmpty and (fraEstudioABM.Codigo <> '00000000') Then
    InvalidMsg( fraEstudioABM.edCodigo, 'Debe seleccionar un estudio')

  else if (edValorMinimo.Value <> 0) and (fraEstudioABM.sdqDatos.FieldByName('ES_MINIMO').AsInteger <> 0) and (edValorMinimo.Value < fraEstudioABM.sdqDatos.FieldByName('ES_MINIMO').AsInteger) then
    InvalidMsg( edValorMinimo, 'El valor mínimo normal es menor al valor mínimo posible del estudio (' + fraEstudioABM.sdqDatos.FieldByName('ES_MINIMO').AsString + ')')

  else if (fraEstudioABM.sdqDatos.FieldByName('ES_MAXIMO').AsInteger <> 0) and (edValorMinimo.Value > fraEstudioABM.sdqDatos.FieldByName('ES_MAXIMO').AsInteger) then
    InvalidMsg( edValorMinimo, 'El valor mínimo normal es mayor al valor máximo posible del estudio (' + fraEstudioABM.sdqDatos.FieldByName('ES_MAXIMO').AsString + ')')

  else if (edValorMaximo.Value <> 0) and (fraEstudioABM.sdqDatos.FieldByName('ES_MINIMO').AsInteger <> 0) and (edValorMaximo.Value < fraEstudioABM.sdqDatos.FieldByName('ES_MINIMO').AsInteger) then
    InvalidMsg( edValorMaximo, 'El valor máximo normal es menor al valor mínimo posible del estudio (' + fraEstudioABM.sdqDatos.FieldByName('ES_MINIMO').AsString + ')')

  else if (fraEstudioABM.sdqDatos.FieldByName('ES_MAXIMO').AsInteger <> 0) and (edValorMaximo.Value > fraEstudioABM.sdqDatos.FieldByName('ES_MAXIMO').AsInteger) then
    InvalidMsg( edValorMaximo, 'El valor máximo normal es mayor al valor máximo posible del estudio (' + fraEstudioABM.sdqDatos.FieldByName('ES_MAXIMO').AsString + ')')

  else if (edValorMaximo.Value <> 0) and (edValorMinimo.Value > edValorMaximo.Value) then
    InvalidMsg( edValorMinimo, 'El valor mínimo no puede ser mayor al máximo')

  else begin
    if fpABM.Caption = CAP_ALTA then
       Sql := 'INSERT INTO AER_ESTRIESG( ' +
              '  ER_RIESGO, ER_ESTUDIO, ER_MINIMONORMAL, ER_MAXIMONORMAL, ' +
              '  ER_PERIODICIDAD, ER_USUALTA, ER_FECHALTA, ER_USUMODIF, ' +
              '  ER_FECHAMODIF, ER_USUBAJA, ER_FECHABAJA, ER_IDRG, ' +
              '  ER_BAJAESTUDIO, ER_ID) ' +
              'VALUES ( ' +
              '(SELECT RG_CODIGO ' +
              'FROM ART.PRG_RIESGOS ' +
              'WHERE RG_ID = ' + SqlValue(fraRiesgoABM.ID) + '), ' +
              SqlValue (fraEstudioABM.Codigo) + ', ' +
              SqlNumber( edValorMinimo.Value, True ) + ', ' +
              SqlNumber( edValorMaximo.Value, True ) + ', ' +
              edPeriodicidad.TextSql + ', ' +
              SqlValue (frmPrincipal.DBLogin.LoginName) + ', ' +
              'ACTUALDATE, NULL, NULL, NULL, NULL,' + SqlNumber (fraRiesgoABM.ID) + ', NULL, NULL)'
    else
       Sql := 'UPDATE AER_ESTRIESG ' +
              '   SET ER_MINIMONORMAL = ' + SqlNumber( edValorMinimo.Value, True) + ', ' +
              '       ER_MAXIMONORMAL = ' + SqlNumber( edValorMaximo.Value, True ) + ', ' +
              '       ER_PERIODICIDAD = ' + edPeriodicidad.TextSql + ', ' +
              '       ER_USUMODIF = ' + SqlValue (frmPrincipal.DBLogin.LoginName) + ', ' +
              '       ER_FECHAMODIF = ACTUALDATE, ' +
              '       ER_USUBAJA = NULL, ' +
              '       ER_FECHABAJA = NULL ' +
              ' WHERE ER_idRG = ' + SqlNumber (fraRiesgoABM.ID) + ' ' +
              '   AND ER_ESTUDIO = ' + SqlValue (fraEstudioABM.edCodigo.Text);

     Try
        EjecutarSql( Sql );
        RefreshAndLocate(sdqConsulta, ['ER_RIESGO', 'ER_ESTUDIO'], [fraRiesgoABM.edCodigo.Text, fraEstudioABM.edCodigo.Text]);
        fpABM.ModalResult := mrOk;
      except
         on E: Exception do ErrorMsg(E);
      end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.DBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if not sdqConsulta.FieldByName('ER_FECHABAJA').IsNull then
        AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEstudioRiesgo.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
     if not sdqConsulta.FieldByName('ER_FECHABAJA').IsNull Then
        AFont.Style := [fsStrikeOut];
end;
{----------------------------------------------------------------------------------------------------------------------}

end.
