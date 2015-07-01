unit unPerfilesFax;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, ImgList, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, CheckLst, ARTCheckListBox, FormPanel,
  unArtFrame, unfraUsuarios, dblookup, JvExControls, JvComponent,
  JvDBLookup, DBCtrls, Menus, JvExExtCtrls, JvSplitter;

type
  TfrmPerfilesFax = class(TfrmCustomConsulta)
    ilColor: TImageList;
    ilByN: TImageList;
    fpFax: TFormPanel;
    Bevel6: TBevel;
    Label7: TLabel;
    btnAplicarFax: TButton;
    btnCerrarFax: TButton;
    clbUsuarios: TARTCheckListBox;
    sdqSector: TSDQuery;
    dsSector: TDataSource;
    dbgSectores: TArtDBGrid;
    clbSectores: TARTCheckListBox;
    sdqPerfiles: TSDQuery;
    dsPerfiles: TDataSource;
    Label1: TLabel;
    pmuPopUp: TPopupMenu;
    mnuSeleccionarTodos: TMenuItem;
    mnuNoSeleccionarNinguno: TMenuItem;
    cmbPerfiles: TJvDBLookupCombo;
    JvSplitter: TJvSplitter;
    pnlLeft: TPanel;
    clbPerfiles: TARTCheckListBox;
    fraFU_USUARIO: TfraUsuario;
    chkUsuariosBaja: TCheckBox;
    chkBajas: TCheckBox;
    mnuPopUpFiltroSectores: TPopupMenu;
    mnuSelectAllFiltroSectores: TMenuItem;
    mnuUnSelectAllFiltroSectores: TMenuItem;
    chkPerfilesBaja: TCheckBox;
    ShortCutControlHijo: TShortCutControl;
    mnuPopUpFiltroPerfiles: TPopupMenu;
    mnuSeleccionarTodosPerfiles: TMenuItem;
    mnuNoSeleccionarNingunoPerfiles: TMenuItem;
    sdqConsultaFU_USUARIO: TStringField;
    sdqConsultaFU_IDFORMULARIO: TFloatField;
    sdqConsultaFO_DESCRIPCION: TStringField;
    sdqConsultaSE_SECTOR: TStringField;
    sdqConsultaSE_NOMBRE: TStringField;
    sdqConsultaSC_DESCRIPCION: TStringField;
    sdqConsultaSE_FECHABAJA: TDateTimeField;
    sdqConsultaSC_FECHABAJA: TDateTimeField;
    sdqConsultaFU_FECHABAJA: TDateTimeField;
    sdqConsultaFU_SOLOLECTURA: TStringField;
    chkSoloLectura: TCheckBox;
    procedure tbEliminarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqSectorAfterScroll(DataSet: TDataSet);
    procedure cmbPerfilesChange(Sender: TObject);
    procedure fpFaxShow(Sender: TObject);
    procedure mnuSeleccionarTodosClick(Sender: TObject);
    procedure mnuNoSeleccionarNingunoClick(Sender: TObject);
    procedure btnAplicarFaxClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure chkBajasClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure mnuSelectAllFiltroSectoresClick(Sender: TObject);
    procedure mnuUnSelectAllFiltroSectoresClick(Sender: TObject);
    procedure mnuSeleccionarTodosPerfilesClick(Sender: TObject);
    procedure mnuNoSeleccionarNingunoPerfilesClick(Sender: TObject);
    procedure btnCerrarFaxClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
    bHuboCambios: Boolean;
    FSQL: String;
    procedure CambioUsuarios;
  public
    procedure AfterConstruction; override;
    procedure RefreshData; override;
  end;

var
  frmPerfilesFax: TfrmPerfilesFax;

implementation

uses CustomDlgs, unDmPrincipal, SqlFuncs, AnsiSql, General, unSesion,
  VCLExtra;

{$R *.dfm}

{ TfrmPerfilesFax }

procedure TfrmPerfilesFax.RefreshData;
var
  sSQL, sUsuario: String;
  iIdFormulario: Integer;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
  begin
    sUsuario := sdqConsulta.FieldByName('FU_USUARIO').AsString;
    iIdFormulario := sdqConsulta.FieldByName('FU_IDFORMULARIO').AsInteger;
  end else
    iIdFormulario := 0;

  sSQL := FSQL;
  if not chkUsuariosBaja.Checked then
    AddCondition(sSQL, ' SE_FECHABAJA IS NULL ');
  if not chkPerfilesBaja.Checked then
    AddCondition(sSQL, ' FU_FECHABAJA IS NULL ');
  if fraFU_USUARIO.IsSelected then
    AddCondition(sSQL, ' SE_USUARIO = ' + SqlValue(fraFU_USUARIO.UserID));
  if clbSectores.CheckCount > 0 then
    sSQL := sSQL + clbSectores.InSQL_StringValues('SE_SECTOR');
  if clbPerfiles.CheckCount > 0 then
     sSQL := sSQL + clbPerfiles.InSQL_StringValues('FU_IDFORMULARIO');
  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited;

  if iIdFormulario > 0 then
    sdqConsulta.Locate('FU_USUARIO;FU_IDFORMULARIO', VarArrayOf([sUsuario, iIdFormulario]), []);
end;

procedure TfrmPerfilesFax.tbEliminarClick(Sender: TObject);
begin
//  inherited;
  with sdqConsulta do
  if MsgAsk(Format('¿Desea remover el perfil %s al usuario %s?', [FieldByName('FO_DESCRIPCION').AsString, FieldByName('SE_NOMBRE').AsString])) then
  begin
    EjecutarSqlEx('UPDATE ART.FFU_FORMULARIOUSUARIO ' +
                     'SET FU_FECHABAJA = SYSDATE, ' +
                         'FU_USUBAJA = :Usuario ' +
                   'WHERE FU_IDFORMULARIO = :Formulario ' +
                     'AND FU_USUARIO = :USUARIO', [Sesion.UserID, FieldByName('FU_IDFORMULARIO').AsString, FieldByName('FU_USUARIO').AsString]);
    RefreshData;
  end;
end;

procedure TfrmPerfilesFax.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  chkSoloLectura.Checked := False;
  if fpFax.ShowModal = mrOk then
    RefreshData;
end;

procedure TfrmPerfilesFax.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmPerfilesFax.AfterConstruction;
begin
  RefreshData;
end;

procedure TfrmPerfilesFax.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkUsuariosBaja.Checked := False;
  chkPerfilesBaja.Checked := False;
  fraFU_USUARIO.Limpiar;
  clbSectores.ClearChecks;
  clbPerfiles.ClearChecks;
end;

procedure TfrmPerfilesFax.sdqSectorAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CambioUsuarios;
end;

procedure TfrmPerfilesFax.CambioUsuarios;
begin
  if Assigned(sdqSector.AfterScroll) then
  begin
    if not VarIsNull(cmbPerfiles.KeyValue) then
    begin
      clbUsuarios.SQL := ' SELECT SE_NOMBRE, SE_USUARIO ' +
                            'FROM ART.USE_USUARIOS ' +
                           'WHERE SE_SECTOR = ' + SQLValue(sdqSector.FieldByName('SC_CODIGO').AsString) +
                            iif(chkBajas.Checked, ' ', ' AND SE_FECHABAJA IS NULL ') +
                       ' ORDER BY 1 ';

      with GetQueryEx('SELECT FU_USUARIO ' +
                        'FROM ART.FFU_FORMULARIOUSUARIO, ART.USE_USUARIOS ' +
                       'WHERE FU_USUARIO = SE_USUARIO ' +
                         'AND SE_SECTOR = :SECTOR ' +
                         iif(chkSoloLectura.Checked, ' AND FU_SOLOLECTURA = ''S'' ', ' AND FU_SOLOLECTURA = ''N'' ') +
                         iif(chkBajas.Checked, ' ', ' AND SE_FECHABAJA IS NULL ') +
                         'AND FU_IDFORMULARIO = :Formulario ' +
                         'AND FU_FECHABAJA IS NULL ', [sdqSector.FieldByName('SC_CODIGO').AsString, cmbPerfiles.KeyValue]) do
      try
        clbUsuarios.ClearChecks;
        while not Eof do
        begin
          clbUsuarios.Check(Fields[0].AsString);
          Next;
        end;
      finally
        Free;
      end;
    end else
      clbUsuarios.Clear;
  end;
end;

procedure TfrmPerfilesFax.cmbPerfilesChange(Sender: TObject);
begin
  inherited;
  CambioUsuarios;
end;

procedure TfrmPerfilesFax.fpFaxShow(Sender: TObject);
begin
  inherited;
  sdqSector.AfterScroll := nil;
  OpenQuery(sdqSector);
  OpenQuery(sdqPerfiles);
  cmbPerfiles.KeyValue := 0;
  sdqSector.AfterScroll := sdqSectorAfterScroll;
  clbUsuarios.Clear;
  bHuboCambios := False;
end;

procedure TfrmPerfilesFax.mnuSeleccionarTodosClick(Sender: TObject);
begin
  clbUsuarios.CheckAll;
end;

procedure TfrmPerfilesFax.mnuNoSeleccionarNingunoClick(Sender: TObject);
begin
  clbUsuarios.UncheckAll;
end;

procedure TfrmPerfilesFax.btnAplicarFaxClick(Sender: TObject);
var
  i: Integer;
begin
  Verificar(VarIsNull(cmbPerfiles.KeyValue), cmbPerfiles, 'Debe seleccionar un perfil.');
  inherited;
  BeginTrans(True);
  try
    EjecutarSqlSTEx('DELETE FROM ART.FFU_FORMULARIOUSUARIO ' +
                     'WHERE FU_IDFORMULARIO = :Formulario ' +
                       iif(chkSoloLectura.Checked,
                      ' AND FU_SOLOLECTURA = ''S'' ',
                      ' AND FU_SOLOLECTURA = ''N'' ') +
                      ' AND EXISTS (SELECT 1 ' +
                                     'FROM ART.USE_USUARIOS ' +
                                    'WHERE SE_USUARIO = FU_USUARIO ' +
                                      'AND SE_SECTOR = :SECTOR)', [cmbPerfiles.KeyValue,
                                                                   sdqSector.FieldByName('SC_CODIGO').AsString]);
    for i := 0 to clbUsuarios.CheckCount - 1 do
      EjecutarSQLSTEx('INSERT INTO ART.FFU_FORMULARIOUSUARIO (FU_USUARIO, FU_IDFORMULARIO, FU_FECHAALTA, FU_USUALTA, FU_SOLOLECTURA) ' +
                      'VALUES (:USUARIO, :PERFIL, SYSDATE, :USUARIO_ALTA, :SOLO_LECTURA)', [clbUsuarios.ValuesChecked[i], cmbPerfiles.KeyValue, Sesion.UserID, iif(chkSoloLectura.Checked, 'S', 'N')]);

    CommitTrans(True);
    bHuboCambios := True;
    InfoHint(btnAplicarFax, 'Se realizaron los cambios con éxito.');
  except
    RollBack;
    InfoHint(btnAplicarFax, 'Hubo un error al realizar los cambios.', False, 'Error', blnError);
  end;
end;

procedure TfrmPerfilesFax.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  bBaja: Boolean;
begin
  inherited;
  if AreIn(Field.FieldName, ['FO_DESCRIPCION', 'SE_NOMBRE']) and (not sdqConsulta.FindField('FU_FECHABAJA').IsNull) then
    AFont.Style := AFont.Style + [fsStrikeOut]; 

  if AreIn(Field.FieldName, ['FU_USUARIO', 'SE_NOMBRE']) and (not sdqConsulta.FindField('SE_FECHABAJA').IsNull) then
     bBaja := True
  else if (Field.FieldName = 'SC_DESCRIPCION') and (not sdqConsulta.FindField('SC_FECHABAJA').IsNull) then
     bBaja := True
  else
     bBaja := False;

  if bBaja then
    if Highlight then
      AFont.Color := clSilver
    else
      AFont.Color := clRed;

  if AreIn(Field.FieldName, ['FU_SOLOLECTURA']) and (sdqConsulta.FieldByName('FU_SOLOLECTURA').AsString = 'S') then
  begin
    AFont.Style := AFont.Style + [fsBold];
    AFont.Color := clMaroon;
  end;
end;

procedure TfrmPerfilesFax.chkBajasClick(Sender: TObject);
begin
  inherited;
  CambioUsuarios;
end;

procedure TfrmPerfilesFax.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);
end;

procedure TfrmPerfilesFax.mnuSelectAllFiltroSectoresClick(Sender: TObject);
begin
  clbSectores.CheckAll;
end;

procedure TfrmPerfilesFax.mnuUnSelectAllFiltroSectoresClick(Sender: TObject);
begin
  clbSectores.UncheckAll;
end;

procedure TfrmPerfilesFax.mnuSeleccionarTodosPerfilesClick(Sender: TObject);
begin
  clbPerfiles.CheckAll;
end;

procedure TfrmPerfilesFax.mnuNoSeleccionarNingunoPerfilesClick(Sender: TObject);
begin
  clbPerfiles.UncheckAll;  
end;

procedure TfrmPerfilesFax.btnCerrarFaxClick(Sender: TObject);
begin
  inherited;
  if bHuboCambios then
    fpFax.ModalResult := mrOk
  else
    fpFax.ModalResult := mrCancel;
end;

procedure TfrmPerfilesFax.tbModificarClick(Sender: TObject);
var
  sPregunta, sPreguntaParcial: String;
begin
  with sdqConsulta do
  begin
    if FieldByName('FU_SOLOLECTURA').AsString = 'S' then
      sPreguntaParcial := '¿Desea dar permiso de impresión sobre el perfil %s al usuario %s?'
    else
      sPreguntaParcial := '¿Desea marcar como sólo lectura al perfil %s al usuario %s?';

    sPregunta := Format(sPreguntaParcial, [FieldByName('FO_DESCRIPCION').AsString, FieldByName('SE_NOMBRE').AsString]);

    if MsgAsk(sPregunta) then
    begin
      EjecutarSqlEx('UPDATE ART.FFU_FORMULARIOUSUARIO ' +
                       'SET FU_SOLOLECTURA = DECODE(FU_SOLOLECTURA, :V1, :V2, :V3) ' +
                     'WHERE FU_IDFORMULARIO = :Formulario ' +
                       'AND FU_USUARIO = :USUARIO', ['S', 'N', 'S', FieldByName('FU_IDFORMULARIO').AsString, FieldByName('FU_USUARIO').AsString]);
      RefreshData;
    end;
  end;
end;

end.
