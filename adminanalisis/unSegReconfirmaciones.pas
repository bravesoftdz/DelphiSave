unit unSegReconfirmaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, unFraTrabajador, StdCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, Mask, ToolEdit, DateComboBox, unArtFrame,
  unFraCodigoDescripcion, unfraCtbTablas, IntEdit, FormPanel, unArtDbFrame,
  unFraReconfirmacion, unfraEstudio, unSegRecEstudios, Cuit, PatternEdit,
  unArtDBAwareFrame;

type
  TfrmSegReconfirmaciones = class(TfrmCustomConsulta)
    GroupBox1: TGroupBox;
    fpAbm: TFormPanel;
    Label1: TLabel;
    edEvento: TIntEdit;
    Label2: TLabel;
    fraCodigo: TfraCtbTablas;
    Label3: TLabel;
    edFecha: TDateComboBox;
    Label4: TLabel;
    edObservaciones: TMemo;
    Bevel1: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Splitter1: TSplitter;
    pnlSpool: TPanel;
    fraTrabajador: TfraTrabajador;
    ShortCutControl1: TShortCutControl;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
  private
    frmSegRecEstudios : TfrmSegRecEstudios;
    procedure OnFraTrabajadorChange(Sender: TObject);
  public
    procedure ShowFixed( ACuil : TCuil ); {NO SACAR EL SELF!!}
  end;

var
  frmSegReconfirmaciones: TfrmSegReconfirmaciones;

implementation

uses unPrincipal, unDmPrincipal, CustomDlgs, unArt, AnsiSql, SqlFuncs;

{$R *.DFM}

procedure TfrmSegReconfirmaciones.tbRefrescarClick(Sender: TObject);
Var sSql : String;
begin
  if fraTrabajador.IsEmpty Then
     InvalidMsg( fraTrabajador.mskCUIL, 'Debe seleccionar el trabajador' )
  else begin
     sSql := 'SELECT RE_CUIL, RE_EVENTO, RE_CODIGO, TB_DESCRIPCION, RE_FECHA, RE_OBSERVACIONES ' +
               'FROM ARE_RECONFIRMACIONEVENTOS, CTB_TABLAS ' +
              'WHERE TB_CLAVE = ''ERECO'' ' +
                'AND TB_CODIGO = RE_CODIGO ' +
                'AND RE_CUIL = ' + SQLValue(fraTrabajador.CUIL) + ' ' +
              SortDialog.OrderBy ;

     sdqConsulta.SQL.Text := sSql ;
     inherited;

     sdqConsultaAfterScroll( sdqConsulta );
  end;
end;

procedure TfrmSegReconfirmaciones.FormCreate(Sender: TObject);
begin
  inherited;
  fraCodigo.Clave           := 'ERECO';
  fraTrabajador.OnChange    := OnFraTrabajadorChange;

  frmSegRecEstudios         := TfrmSegRecEstudios.Create( Self );
  frmSegRecEstudios.Parent  := pnlSpool;
  frmSegRecEstudios.Visible := True;
//  frmSegRecEstudios
end;

procedure TfrmSegReconfirmaciones.tbNuevoClick(Sender: TObject);
begin
  if fraTrabajador.IsEmpty Then
     InvalidMsg( fraTrabajador.mskCUIL, 'Debe seleccionar el trabajador' )

  else begin
     fpAbm.Caption        := TXT_INSERT_CAPTION;
     edEvento.Value       := IncSql('SELECT MAX(RE_EVENTO) FROM ARE_RECONFIRMACIONEVENTOS WHERE RE_CUIL = ' + SQLValue(fraTrabajador.CUIL) + ' ' );
     fraCodigo.Clear ;
     edFecha.Date         := Date;
     edObservaciones.Text := '';
     fpAbm.ShowModal ;
  end;
end;

procedure TfrmSegReconfirmaciones.tbModificarClick(Sender: TObject);
begin
  if tbModificar.Enabled and (not sdqConsulta.IsEmpty) Then begin
     fpAbm.Caption        := TXT_MODIFY_CAPTION;
     fraTrabajador.CUIL   := sdqConsulta.FieldByName('RE_CUIL').AsString;
     edEvento.Value       := sdqConsulta.FieldByName('RE_EVENTO').AsInteger;
     fraCodigo.Value      := sdqConsulta.FieldByName('RE_CODIGO').AsString;
     edFecha.Date         := sdqConsulta.FieldByName('RE_FECHA').AsDateTime;
     edObservaciones.Text := sdqConsulta.FieldByName('RE_OBSERVACIONES').AsString;
     fpAbm.ShowModal ;
  end;
end;

procedure TfrmSegReconfirmaciones.tbEliminarClick(Sender: TObject);
begin
  //
end;

procedure TfrmSegReconfirmaciones.tbLimpiarClick(Sender: TObject);
begin
  fraTrabajador.Clear;
  frmSegRecEstudios.Cuil := '';
  inherited;
end;

procedure TfrmSegReconfirmaciones.btnAceptarClick(Sender: TObject);
Var
  Sql : TSql;
begin
   if fraCodigo.IsEmpty Then
      InvalidMsg( fraCodigo.edCodigo, 'Debe seleccionar el Código de Evento' )

   else if edFecha.IsEmpty Then
      InvalidMsg( edFecha, 'Debe ingresar la fecha del evento' )

   else if edObservaciones.Text = '' Then
      InvalidMsg( edObservaciones, 'Debe ingresar las observaciones del evento' )

   else begin
      Sql := TSql.Create( 'ARE_RECONFIRMACIONEVENTOS' );
      try
         Sql.PrimaryKey.Add( 'RE_CUIL', fraTrabajador.CUIL );
         Sql.PrimaryKey.Add( 'RE_EVENTO', edEvento.Value );
         Sql.PrimaryKey.Add( 'RE_CODIGO', fraCodigo.Value );
         Sql.PrimaryKey.Add( 'RE_FECHA', edFecha.Date );
         Sql.Fields.Add( 'RE_OBSERVACIONES', edObservaciones.Text );
         if fpAbm.Caption = TXT_MODIFY_CAPTION Then begin
            Sql.Fields.Add( 'RE_USUMODIF', frmPrincipal.DBLogin.LoginName );
            Sql.Fields.Add( 'RE_FECHAMODIF', SQL_ACTUALDATE, False );
            Sql.SqlType := stUpdate;
         end else begin
            Sql.Fields.Add( 'RE_USUALTA', frmPrincipal.DBLogin.LoginName );
            Sql.Fields.Add( 'RE_FECHAALTA', SQL_ACTUALDATE, False );
            Sql.SqlType := stInsert;
         end;
         EjecutarSql( Sql.Sql );

         if sdqConsulta.Active then begin
            sdqConsulta.Refresh;
            sdqConsultaAfterScroll( sdqConsulta );
         end else
            tbRefrescarClick( Nil );

         fpAbm.ModalResult := mrOk;
      finally
         Sql.Free;
      end;
   end;
end;

procedure TfrmSegReconfirmaciones.FSFormDestroy(Sender: TObject);
begin
  frmSegRecEstudios.Free;
  inherited;
end;

procedure TfrmSegReconfirmaciones.sdqConsultaAfterScroll( DataSet: TDataSet);
begin
  inherited;
  if not sdqConsulta.IsEmpty then begin
     frmSegRecEstudios.Cuil   := fraTrabajador.CUIL;
     frmSegRecEstudios.Evento := sdqConsulta.FieldByName('RE_EVENTO').AsInteger;
     frmSegRecEstudios.Fecha  := sdqConsulta.FieldByName('RE_FECHA').AsDateTime;
     frmSegRecEstudios.tbRefrescarClick( Nil );
  end else begin
     frmSegRecEstudios.Cuil   := '' ;
     frmSegRecEstudios.Evento := 0;
     frmSegRecEstudios.Fecha  := 0;
     frmSegRecEstudios.tbLimpiarClick( Nil );
  end;
end;

procedure TfrmSegReconfirmaciones.OnFraTrabajadorChange(Sender: TObject);
begin
  frmSegRecEstudios.Cuil := fraTrabajador.CUIL;
  tbRefrescarClick( Nil );
end;

procedure TfrmSegReconfirmaciones.ShowFixed(ACuil: TCuil);
begin
   fraTrabajador.CUIL := ACuil;
   OnFraTrabajadorChange( Nil );
   ShowModal;
end;

end.
