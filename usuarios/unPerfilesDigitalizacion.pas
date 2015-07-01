unit unPerfilesDigitalizacion;

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
  TfrmPerfilesDigitalizacion = class(TfrmCustomConsulta)
    ilColor: TImageList;
    ilByN: TImageList;
    fpDigitalizacion: TFormPanel;
    Bevel6: TBevel;
    Label7: TLabel;
    btnAplicarDigitalizacion: TButton;
    btnCerrarDigitalizacion: TButton;
    clbUsuarios: TARTCheckListBox;
    sdqSector: TSDQuery;
    dsSector: TDataSource;
    dbgSectores: TArtDBGrid;
    clbSectores: TARTCheckListBox;
    sdqPerfiles: TSDQuery;
    dsPerfiles: TDataSource;
    Label1: TLabel;
    pmuPopUp: TPopupMenu;
    Seleccionartodos1: TMenuItem;
    Noseleccionarninguno1: TMenuItem;
    cmbPerfiles: TJvDBLookupCombo;
    JvSplitter: TJvSplitter;
    pnlLeft: TPanel;
    clbPerfiles: TARTCheckListBox;
    fraBA_USUARIO: TfraUsuario;
    chkUsuariosBaja: TCheckBox;
    chkBajas: TCheckBox;
    ShortCutControlHijo: TShortCutControl;
    mnuPopUpFiltroSectores: TPopupMenu;
    mnuSelectAllFiltroSectores: TMenuItem;
    mnuUnSelectAllFiltroSectores: TMenuItem;
    mnuPopUpFiltroPerfiles: TPopupMenu;
    mnuSeleccionarTodosPerfiles: TMenuItem;
    mnuNoSeleccionarNingunoPerfiles: TMenuItem;
    sdqConsultaAU_USUARIO: TStringField;
    sdqConsultaAU_IDTIPOARCHIVO: TFloatField;
    sdqConsultaSE_SECTOR: TStringField;
    sdqConsultaSE_NOMBRE: TStringField;
    sdqConsultaSC_DESCRIPCION: TStringField;
    sdqConsultaSE_FECHABAJA: TDateTimeField;
    sdqConsultaSC_FECHABAJA: TDateTimeField;
    sdqConsultaTA_DESCRIPCION: TStringField;
    procedure tbEliminarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqSectorAfterScroll(DataSet: TDataSet);
    procedure cmbPerfilesChange(Sender: TObject);
    procedure fpDigitalizacionShow(Sender: TObject);
    procedure Seleccionartodos1Click(Sender: TObject);
    procedure Noseleccionarninguno1Click(Sender: TObject);
    procedure btnAplicarDigitalizacionClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure chkBajasClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure mnuSelectAllFiltroSectoresClick(Sender: TObject);
    procedure mnuUnSelectAllFiltroSectoresClick(Sender: TObject);
    procedure mnuSeleccionarTodosPerfilesClick(Sender: TObject);
    procedure mnuNoSeleccionarNingunoPerfilesClick(Sender: TObject);
  private
    FSQL: String;
    procedure CambioUsuarios;
  public
    procedure AfterConstruction; override;
    procedure RefreshData; override;
  end;

var
  frmPerfilesDigitalizacion: TfrmPerfilesDigitalizacion;

implementation

uses
  CustomDlgs, unDmPrincipal, SqlFuncs, AnsiSql, General, VCLExtra, unSesion;

{$R *.dfm}

{ TfrmPerfilesDigitalizacion }

procedure TfrmPerfilesDigitalizacion.RefreshData;
var
  sSQL: String;
begin
  sSQL := FSQL;
  if not chkUsuariosBaja.Checked then
    AddCondition(sSQL, ' SE_FECHABAJA IS NULL ');
  if fraBA_USUARIO.IsSelected then
    AddCondition(sSQL, ' SE_USUARIO = ' + SqlValue(fraBA_USUARIO.UserID));
  if clbSectores.CheckCount > 0 then
    sSQL := sSQL + clbSectores.InSQL_StringValues('SE_SECTOR');
  if clbPerfiles.CheckCount > 0 then
     sSQL := sSQL + clbPerfiles.InSQL_StringValues('AU_IDTIPOARCHIVO');
  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmPerfilesDigitalizacion.tbEliminarClick(Sender: TObject);
begin
  inherited;
  with sdqConsulta do
  if MsgAsk(Format('¿Desea remover el perfil %s al usuario %s?', [FieldByName('TA_DESCRIPCION').AsString, FieldByName('SE_NOMBRE').AsString])) then
  begin
    EjecutarSqlEx('UPDATE ARCHIVO.RAU_TIPOARCHIVOUSUARIO SET AU_USUBAJA = :USUARIO, AU_FECHABAJA = SYSDATE WHERE AU_USUARIO = :USUARIO AND AU_IDTIPOARCHIVO = :IDTIPOARCHIVO', [Sesion.UserId, FieldByName('AU_USUARIO').AsString, FieldByName('AU_IDTIPOARCHIVO').AsInteger]);

    RefreshData;
  end;
end;

procedure TfrmPerfilesDigitalizacion.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  if fpDigitalizacion.ShowModal = mrOk then
    RefreshData;
end;

procedure TfrmPerfilesDigitalizacion.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmPerfilesDigitalizacion.AfterConstruction;
begin
  RefreshData;
end;

procedure TfrmPerfilesDigitalizacion.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkUsuariosBaja.Checked := False;
  fraBA_USUARIO.Limpiar;
  clbSectores.ClearChecks;
  clbPerfiles.ClearChecks;
end;

procedure TfrmPerfilesDigitalizacion.sdqSectorAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CambioUsuarios;
end;

procedure TfrmPerfilesDigitalizacion.CambioUsuarios;
begin
  if Assigned(sdqSector.AfterScroll) then
  begin
    if not VarIsNull(cmbPerfiles.KeyValue) then
    begin
      clbUsuarios.SQL := 'SELECT 1,1 FROM DUAL';  // limpio el SQL del componente, sino no lo ejecuta
      clbUsuarios.SQL := ' SELECT SE_NOMBRE, SE_USUARIO ' +
                            'FROM ART.USE_USUARIOS ' +
                           'WHERE SE_SECTOR = ' + SQLValue(sdqSector.FieldByName('SC_CODIGO').AsString) +
                            iif(chkBajas.Checked, ' ', ' AND SE_FECHABAJA IS NULL ') +
                       ' ORDER BY 1 ';

      with GetQueryEx('SELECT AU_USUARIO FROM ARCHIVO.RAU_TIPOARCHIVOUSUARIO, ART.USE_USUARIOS WHERE AU_FECHABAJA IS NULL AND AU_USUARIO = SE_USUARIO AND SE_SECTOR = :SECTOR AND AU_IDTIPOARCHIVO = :IDTIPOARCHIVO', [sdqSector.FieldByName('SC_CODIGO').AsString, cmbPerfiles.KeyValue]) do
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

procedure TfrmPerfilesDigitalizacion.cmbPerfilesChange(Sender: TObject);
begin
  inherited;
  CambioUsuarios;
end;

procedure TfrmPerfilesDigitalizacion.fpDigitalizacionShow(Sender: TObject);
begin
  inherited;
  sdqSector.AfterScroll := nil;
  OpenQuery(sdqSector);
  OpenQuery(sdqPerfiles);
  cmbPerfiles.KeyValue := 0;
  clbUsuarios.Clear;  
  sdqSector.AfterScroll := sdqSectorAfterScroll;
end;

procedure TfrmPerfilesDigitalizacion.Seleccionartodos1Click(Sender: TObject);
begin
  clbUsuarios.CheckAll;
end;

procedure TfrmPerfilesDigitalizacion.Noseleccionarninguno1Click(Sender: TObject);
begin
  clbUsuarios.UncheckAll;
end;

procedure TfrmPerfilesDigitalizacion.btnAplicarDigitalizacionClick(Sender: TObject);
var
  i: Integer;
begin
  Verificar(VarIsNull(cmbPerfiles.KeyValue), cmbPerfiles, 'Debe seleccionar un perfil.');

  if MsgBox('¿Confirma la modificación de todos los Perfiles?', MB_ICONQUESTION + MB_YESNO, 'Confirmar la Operación') = IDYES then
    begin
      BeginTrans(True);
      try
(*
        EjecutarSqlSTEx('UPDATE ARCHIVO.RAU_TIPOARCHIVOUSUARIO ' +
                           'SET AU_USUBAJA = :USUARIO, ' +
                               'AU_FECHABAJA = SYSDATE ' +
                         'WHERE AU_IDTIPOARCHIVO = :IDTIPOARCHIVO ' +
                           'AND EXISTS (SELECT 1 ' +
                                         'FROM ART.USE_USUARIOS ' +
                                        'WHERE SE_USUARIO = AU_USUARIO ' +
                                          'AND SE_SECTOR = :SECTOR)', [Sesion.Userid,
                                                                       cmbPerfiles.KeyValue,
                                                                       sdqSector.FieldByName('SC_CODIGO').AsString]);

        for i := 0 to clbUsuarios.CheckCount - 1 do
          EjecutarSQLSTEx('INSERT INTO ARCHIVO.RAU_TIPOARCHIVOUSUARIO(AU_ID, AU_IDTIPOARCHIVO, AU_USUARIO, AU_USUALTA, AU_FECHAALTA) ' +
                          'VALUES (:ID, :IDTIPOARCHIVO, :USUARIO, :USUALTA, SYSDATE)', [GetSecNextVal('SEQ_RAU_ID'), cmbPerfiles.KeyValue, clbUsuarios.ValuesChecked[i], Sesion.UserId]);
*)


        for i := 0 to clbUsuarios.Count - 1 do
          begin
            if clbUsuarios.Checked[i] then
              EjecutarSQLSTEx('INSERT INTO ARCHIVO.RAU_TIPOARCHIVOUSUARIO ' +
                              '(AU_ID, AU_IDTIPOARCHIVO, AU_USUARIO, AU_USUALTA, AU_FECHAALTA) ' +
                              'SELECT ARCHIVO.SEQ_RAU_ID.NEXTVAL, :IDTIPOARCHIVO, :USUARIO, :USUALTA, SYSDATE ' +
                                'FROM DUAL ' +
                               'WHERE NOT EXISTS(SELECT 1 ' +
                                                  'FROM ARCHIVO.RAU_TIPOARCHIVOUSUARIO ' +
                                                 'WHERE AU_IDTIPOARCHIVO = :IDTIPOARCHIVO ' +
                                                   'AND AU_USUARIO = :USUARIO ' +
                                                   'AND AU_FECHABAJA IS NULL)',
                               [cmbPerfiles.KeyValue, clbUsuarios.Values[i], Sesion.UserId])

            else
              EjecutarSqlSTEx('UPDATE ARCHIVO.RAU_TIPOARCHIVOUSUARIO ' +
                                 'SET AU_USUBAJA = :USUARIO, AU_FECHABAJA = SYSDATE ' +
                               'WHERE AU_IDTIPOARCHIVO = :IDTIPOARCHIVO ' +
                                 'AND AU_USUARIO = :USUARIO ' +
                                 'AND AU_FECHABAJA IS NULL', [Sesion.UserId,
                                                              cmbPerfiles.KeyValue,
                                                              clbUsuarios.Values[i]]);
          end;

        CommitTrans(True);
        InfoHint(btnAplicarDigitalizacion, 'Se realizaron los cambios con éxito.');
      except
        RollBack;
        InfoHint(btnAplicarDigitalizacion, 'Hubo un error al realizar los cambios.', False, 'Error', blnError);
      end;
    end;
end;

procedure TfrmPerfilesDigitalizacion.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  bBaja: Boolean;
begin
  inherited;
  if AreIn(Field.FieldName, ['AU_IDTIPOARCHIVO', 'SE_NOMBRE']) and (not sdqConsulta.FieldByName('SE_FECHABAJA').IsNull) then
     bBaja := True
  else if (Field.FieldName = 'SC_DESCRIPCION') and (not sdqConsulta.FieldByName('SC_FECHABAJA').IsNull) then
     bBaja := True
  else
     bBaja := False;

  if bBaja then
    if Highlight then
      AFont.Color := clSilver
    else
      AFont.Color := clRed;
end;

procedure TfrmPerfilesDigitalizacion.chkBajasClick(Sender: TObject);
begin
  inherited;
  CambioUsuarios;
end;

procedure TfrmPerfilesDigitalizacion.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);
end;

procedure TfrmPerfilesDigitalizacion.mnuSelectAllFiltroSectoresClick(Sender: TObject);
begin
  clbSectores.CheckAll;
end;

procedure TfrmPerfilesDigitalizacion.mnuUnSelectAllFiltroSectoresClick(Sender: TObject);
begin
  clbSectores.UncheckAll;
end;

procedure TfrmPerfilesDigitalizacion.mnuSeleccionarTodosPerfilesClick(Sender: TObject);
begin
  clbPerfiles.CheckAll;
end;

procedure TfrmPerfilesDigitalizacion.mnuNoSeleccionarNingunoPerfilesClick(Sender: TObject);
begin
  clbPerfiles.UncheckAll;
end;

end.
