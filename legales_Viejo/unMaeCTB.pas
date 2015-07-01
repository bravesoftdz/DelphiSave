unit unMaeCTB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtFrame, unFraCodigoDescripcion, ImgList,
  General, FormPanel, unfraCtbTablas, unArtDBAwareFrame, CustomDlgs, Strfuncs;

type
  TfrmMaeCTB = class(TfrmCustomConsulta)
    FraCodigoTabla: TfraCodigoDescripcion;
    LblCodigoTabla: TLabel;
    ilSingleImages: TImageList;
    ilColor: TImageList;
    ilByN: TImageList;
    FrmPanelAlta: TFormPanel;
    CmdAceptar: TButton;
    CmdCancelar: TButton;
    LblCodigo: TLabel;
    LblDetalle: TLabel;
    TxtCodigo: TEdit;
    TxtDetalle: TEdit;
    chkTB_ESPECIAL1: TCheckBox;
    rgTB_ESPECIAL1: TRadioGroup;
    lblTB_ESPECIAL1: TLabel;
    chkSoloActivos: TCheckBox;
    ToolButton1: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FraCodigoTablaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CmdAceptarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
  public
  end;

{
var
  frmMaeCTB: TfrmMaeCTB;
}

implementation

uses
	unDmPrincipal, unPrincipal, AnsiSql, SqlFuncs, unSesion, VCLExtra;

{$R *.DFM}

procedure TfrmMaeCTB.FormCreate(Sender: TObject);

begin
  inherited;

  with fraCodigoTabla do
  begin
    TableName      := 'CTB_TABLAS';
//    FieldID        := 'TB_CLAVE';
    FieldID        := 'TB_ID';
    FieldCodigo    := 'TB_CLAVE';
    FieldDesc      := 'TB_DESCRIPCION';
    FieldBaja      := 'DECODE(TB_BAJA, ''S'', TB_BAJA, NULL)';
    ExtraCondition := ' AND TB_CODIGO = ''0'' AND TB_MODULO=''LEGALES''';
    AutoExit       := False;
    OnChange       := FraCodigoTablaChange;
  end;

  {FraCodigoTabla.Sql := 'SELECT TB_CLAVE AS ' + CD_ALIAS_ID + ', ' +
                               'TB_CLAVE AS ' + CD_ALIAS_CODIGO + ', ' +
                               'TB_DESCRIPCION AS ' + CD_ALIAS_DESC + ', ' +
                               'NULL AS ' + CD_ALIAS_BAJA + ' ' +
                          'FROM CTB_TABLAS ' +
                        ' WHERE TB_CODIGO = ''0'' AND TB_MODULO=''LEGALES''';}
end;

procedure TfrmMaeCTB.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text :=
  	'SELECT TB_CODIGO, TB_DESCRIPCION, TB_BAJA, TB_ESPECIAL1' +
     ' FROM CTB_TABLAS' +
    ' WHERE TB_CLAVE = ' + SqlValue(FraCodigoTabla.edCodigo.Text) +
    	' AND TB_CODIGO <> ''0''' +
    Iif(chkSoloActivos.Checked, ' AND TB_BAJA <> ''S''', '');
  inherited;

  tbEliminar.Enabled := sdqConsulta.RecordCount > 0;
end;

procedure TfrmMaeCTB.tbEliminarClick(Sender: TObject);
var
	Borrar: Integer;
	sSql: String;
begin
  sSql :=
  	'UPDATE CTB_TABLAS' +
    	' SET TB_BAJA = ''S'',' +
      		' TB_FECHABAJA = SYSDATE,' +
      		' TB_USUBAJA = :p1' +
    ' WHERE TB_CLAVE = :p2' +
    	' AND TB_CODIGO = :p3';
  Borrar := MsgBox('¿ Está seguro que desea eliminar ' + Self.sdqConsulta.FieldByName('TB_CODIGO').AsString + ' - ' + Self.sdqConsulta.FieldByName('TB_DESCRIPCION').AsString + ' de la tabla ?', 4);

  if Borrar = 6 then
  begin
  	EjecutarSqlEx(sSql, [Sesion.UserID, FraCodigoTabla.edCodigo.Text, Self.sdqConsulta.FieldByName('TB_CODIGO').AsString]);
    tbRefrescarClick(Self);
  end;

  inherited;
end;

procedure TfrmMaeCTB.tbNuevoClick(Sender: TObject);
var
  sSql: String;
begin
  inherited;
  VCLExtra.LockControls([txtCodigo], False);
  TxtCodigo.Clear;
  TxtDetalle.Clear;
  if FrmPanelalta.ShowModal = mrOk then
  begin
    sSql :=
    	'INSERT INTO CTB_TABLAS (TB_CLAVE, TB_CODIGO, TB_DESCRIPCION, TB_BAJA, TB_ESPECIAL1, TB_USUALTA, TB_FECHAALTA)' +
           					 ' VALUES (:p1, :p2, :p3, ''N'', :p4, :p5, SYSDATE)';

    EjecutarSQLEx(sSql, [FraCodigoTabla.edCodigo.Text, TxtCodigo.Text, TxtDetalle.Text,
    										 IIF(chkTB_ESPECIAL1.Visible, SqlValue(chkTB_ESPECIAL1.Checked),
                         IIF(rgTB_ESPECIAL1.Visible, SqlValue(String(IIF(rgTB_ESPECIAL1.ItemIndex = 0, 'N', 'S'))), '')),
                         Sesion.UserID]);
    tbRefrescarClick(self);
  end;
end;

procedure TfrmMaeCTB.FraCodigoTablaChange(Sender: TObject);
begin
  tbRefrescarClick(nil);
  if FraCodigoTabla.IsEmpty then
  begin
    tbNuevo.Enabled    := False;
    tbEliminar.Enabled := False;
  end
  else
  begin
    tbNuevo.Enabled := True;

    chkTB_ESPECIAL1.Visible := fraCodigoTabla.Codigo = 'FUERO';

    // rgTB_ESPECIAL1.Visible := fraCodigoTabla.Codigo = 'LGEST';
    // lblTB_ESPECIAL1.Visible:= fraCodigoTabla.Codigo = 'LGEST';
    // rgTB_ESPECIAL1.ItemIndex := -1;
  end;
end;

procedure TfrmMaeCTB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.mnuOtrosCodigos.Enabled := True;
end;

procedure TfrmMaeCTB.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
																			 Highlight: Boolean);
begin
  if sdqConsulta.FieldByName ('TB_BAJA').AsString = 'S' then
  	AFont.Color:= clRed;
end;

procedure TfrmMaeCTB.CmdAceptarClick(Sender: TObject);
begin
  VerificarMultiple (['Guardando Registro',
                      TxtCodigo,
                      not IsEmptyString(TxtCodigo.Text),

                      'Debe ingresar el Código',
                      TxtDetalle,
                      not IsEmptyString(TxtDetalle.Text),

                      'Debe ingresar la Descripción',
                      rgTB_ESPECIAL1,
                      (not rgTB_ESPECIAL1.Visible) or
                      (rgTB_ESPECIAL1.Visible and
                       (rgTB_ESPECIAL1.ItemIndex <> -1)),
                      'El campo Gestión Activa es obligatorio'
                     ]);

  FrmPanelAlta.ModalResult := mrOk;
end;

procedure TfrmMaeCTB.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  chkSoloActivos.Checked := True;
end;

procedure TfrmMaeCTB.tbModificarClick(Sender: TObject);
var
sSql : String;
begin
  inherited;
  VCLExtra.LockControls([txtCodigo], True);
  TxtCodigo.Text := sdqConsulta.FieldByName('TB_CODIGO').AsString;
  TxtDetalle.Text := sdqConsulta.FieldByName('TB_DESCRIPCION').AsString;
  if FrmPanelalta.ShowModal = mrOk then
  begin
    sSql :=
    	'UPDATE CTB_TABLAS '+
      '   SET TB_DESCRIPCION = '+SqlValue(TxtDetalle.Text)+', '+
      '       TB_USUMODIF = '+SqlValue(Sesion.UserID)+', '+
      '       TB_FECHAMODIF = SYSDATE, '+
      '       TB_BAJA = ''N'', '+
      '       TB_USUBAJA = NULL , '+
      '       TB_FECHABAJA = NULL '+
      ' WHERE TB_CLAVE ='+SqlValue(FraCodigoTabla.edCodigo.Text)+
      '   AND TB_CODIGO = '+SqlValue(sdqConsulta.FieldByName('TB_CODIGO').AsString);
    EjecutarSql(sSql);
    tbRefrescarClick(self);
  end;
end;

end.
