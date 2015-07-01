unit unManSectoresIntranet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, JvExComCtrls, JvComponent,
  JvDBTreeView, ImgList, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, QuickRpt, QRCtrls, JvExStdCtrls,
  JvCombobox, JvExExtCtrls, JvNavigationPane;

type
  TfrmManSectoresIntranet = class(TfrmCustomGridABM)
    sdqConsultaSE_ID: TFloatField;
    sdqConsultaSE_DESCRIPCION: TStringField;
    sdqConsultaSE_NIVELRESOLUTIVO: TFloatField;
    sdqConsultaSE_IDSECTORPADRE: TFloatField;
    sdqConsultaSE_DEFAULT: TStringField;
    sdqConsultaSE_NIVEL: TFloatField;
    sdqConsultaID_SECTOR_PADRE: TFloatField;
    sdqConsultaDESC_SECTOR_PADRE: TStringField;
    fraSector: TfraCodDesc;
    fraSE_ID: TfraCodDesc;
    fraSectorPadre: TfraCodDesc;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edSE_DESCRIPCION: TEdit;
    Label4: TLabel;
    cmbNivelResolutivo: TComboBox;
    lbNivelResolutivo: TLabel;
    sdqConsultaSE_USUALTA: TStringField;
    sdqConsultaSE_FECHAALTA: TDateTimeField;
    sdqConsultaSE_USUMODIF: TStringField;
    sdqConsultaSE_FECHAMODIF: TDateTimeField;
    sdqConsultaSE_USUBAJA: TStringField;
    sdqConsultaSE_FECHABAJA: TDateTimeField;
    Label6: TLabel;
    cmbNivel: TComboBox;
    Label7: TLabel;
    cmbSE_NIVEL: TJvComboBox;
    sdqConsultaTOTAL_USUARIOS: TFloatField;
    Label8: TLabel;
    fraSE_IDSECTORPADRE: TfraCodDesc;
    sdqConsultaNIVEL: TStringField;
    ShortCutControlHijo: TShortCutControl;
    Label9: TLabel;
    cmbSE_NIVELRESOLUTIVO: TJvComboBox;
    GridUsuarios: TArtDBGrid;
    dsUsuarios: TDataSource;
    sdqUsuarios: TSDQuery;
    sdqUsuariosSE_USUARIO: TStringField;
    sdqUsuariosSE_NOMBRE: TStringField;
    JvOutlookSplitter: TJvOutlookSplitter;
    sdqUsuariosSC_DESCRIPCION: TStringField;
    sdqConsultaNIVEL_RESOLUTIVO: TStringField;
    sdqUsuariosJEFE: TStringField;
    pnlArbol: TPanel;
    JvOutlookSplitter1: TJvOutlookSplitter;
    sdqUsuariosRU_DETALLE: TStringField;
    sdqUsuariosBAJA_SECTOR: TDateTimeField;
    sdqUsuariosBAJA_JEFE: TDateTimeField;
    chkVerBajas: TCheckBox;
    chkVisible: TCheckBox;
    sdqConsultaSE_VISIBLE: TStringField;
    procedure tbPropiedadesClick(Sender: TObject);
    procedure fraSectorPropiedadesChange(Sender: TObject);
    procedure fraSectorPadrecmbDescripcionDropDown(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActualizarNivel(Sender: TObject);
    procedure fraSectorPadrePropiedadesChange(Sender: TObject);
    procedure cmbNivelChange(Sender: TObject);
    procedure sdqUsuariosAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaBeforeOpen(DataSet: TDataSet);
    procedure Actualizar(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridUsuariosGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
  private
    FSQL: String;
    procedure SeleccionarArbol(Sender: TObject; Node: TTreeNode);
  public
    procedure RefreshData; override;
    procedure ClearData; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
    function  DoABM: Boolean; override;
  end;

var
  frmManSectoresIntranet: TfrmManSectoresIntranet;

implementation

uses
  unDmPrincipal, VCLExtra, CustomDlgs, AnsiSql, SqlFuncs, unArt, Printers,
  unImageFunctions, unCustomConsulta, unFiltros, unSesion, unArbolSectores,
  unGrids, Math, Strfuncs, General;

var
  frmArbolSectoresEmbebido: TfrmArbolSectores;

{$R *.dfm}

procedure TfrmManSectoresIntranet.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  with TfrmArbolSectores.Create(Self) do
  try
    MostrarSector(sdqConsulta.FieldByName('SE_ID').AsInteger);
    ShowModal;
  finally
    if sdqSectores.Active and not sdqSectores.FieldByName('SE_ID').IsNull then
      sdqConsulta.Locate('SE_ID', sdqSectores.FieldByName('SE_ID').AsInteger, []);

    Free;
  end;
end;

procedure TfrmManSectoresIntranet.ClearControls;
begin
  chkVisible.AllowGrayed := True;
  fraSector.Clear;
  fraSectorPadre.Clear;
  cmbNivel.ItemIndex := -1;
  cmbNivelResolutivo.ItemIndex := -1;
  edSE_DESCRIPCION.Clear;
  chkVisible.State := cbGrayed;
  VCLExtra.LockControls(cmbNivel, False);

  fraSectorPadre.Propiedades.ExtraCondition := ' and se_idsectorpadre < 4 ';
end;

function TfrmManSectoresIntranet.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'COMPUTOS.CSE_SECTOR';

  try
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('SE_ID', sdqConsulta.FieldByName('SE_ID').AsInteger, False);
      Sql.Fields.Add('SE_FECHABAJA', exDateTime);
      Sql.Fields.Add('SE_USUBAJA', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end else
    begin
      if ModoABM = maAlta then
        begin
          Sql.PrimaryKey.Add('SE_ID', ValorSQLInteger('SELECT MAX(SE_ID) + 1 FROM COMPUTOS.CSE_SECTOR'), False);
          Sql.Fields.Add('SE_FECHAALTA', exDateTime);
          Sql.Fields.Add('SE_USUALTA', Sesion.UserID);
          Sql.SqlType := stInsert;
        end
      else if ModoABM = maModificacion then
        begin
          Sql.PrimaryKey.Add('SE_ID', sdqConsulta.FieldByName('SE_ID').AsInteger, False);
          Sql.Fields.Add('SE_FECHAMODIF', exDateTime);
          Sql.Fields.Add('SE_USUMODIF', Sesion.UserID);
          Sql.SqlType := stUpdate;
        end;

      Sql.Fields.Add('SE_DESCRIPCION', edSE_DESCRIPCION.Text);
      Sql.Fields.AddInteger('SE_IDSECTORPADRE', StrToIntDef(fraSectorPadre.Id, 0), False);
      Sql.Fields.Add('SE_NIVELRESOLUTIVO', cmbNivelResolutivo.ItemIndex);
      Sql.Fields.Add('SE_NIVEL', cmbNivel.ItemIndex + 1);
      Sql.Fields.AddString('SE_VISIBLE', SqlBoolean(chkVisible.Checked, False));
    end;

    Result := inherited DoABM;
    sdqUsuarios.Close;
  except
    on E:Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al grabar el sector.');
  end;
end;

procedure TfrmManSectoresIntranet.LoadControls;
begin
  chkVisible.AllowGrayed := False;
  fraSectorPadre.Propiedades.ExtraCondition := ''; 
  fraSector.Codigo := sdqConsultaSE_ID.AsString;
  fraSectorPadre.Codigo := sdqConsultaSE_IDSECTORPADRE.AsString;
  cmbNivelResolutivo.ItemIndex := sdqConsultaSE_NIVELRESOLUTIVO.AsInteger;
  cmbNivel.ItemIndex := sdqConsultaSE_NIVEL.AsInteger - 1;
  edSE_DESCRIPCION.Text := sdqConsultaSE_DESCRIPCION.AsString;
  chkVisible.Checked := sdqConsultaSE_VISIBLE.AsString = 'S';
  VCLExtra.LockControls(cmbNivel, True);
end;

function TfrmManSectoresIntranet.Validar: Boolean;
begin
  Verificar(IsEmptyString(edSE_DESCRIPCION.Text), edSE_DESCRIPCION, 'Debe indicar una descripción para el sector.');
  Verificar(cmbNivel.ItemIndex = -1, cmbNivel, 'Debe indicar el nivel (del árbol) para el sector actual.');
  Verificar((cmbNivel.ItemIndex = 3) and (cmbNivelResolutivo.ItemIndex = -1), cmbNivelResolutivo, 'Debe indicar el nivel resolutivo del actual sector.');
  Result := True;
end;

procedure TfrmManSectoresIntranet.fraSectorPropiedadesChange(Sender: TObject);
begin
  inherited;
  if fraSector.IsSelected then
    fraSectorPadre.Propiedades.ExtraCondition := ' AND SE_NIVEL = ' + fraSector.sdqDatos.FieldByName('SE_NIVEL').AsString + ' - 1 '
  else
    fraSectorPadre.Propiedades.ExtraCondition := '';
end;

procedure TfrmManSectoresIntranet.fraSectorPadrecmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
  if (ModoABM = maModificacion) and fraSector.IsSelected then
    fraSectorPadre.Propiedades.ExtraCondition := ' AND SE_NIVEL = ' + fraSector.sdqDatos.FieldByName('SE_NIVEL').AsString + ' - 1 ';

  if (ModoABM = maModificacion) and not fraSector.IsSelected then
    fraSectorPadre.Propiedades.ExtraCondition := '';
    
  fraSectorPadre.cmbDescripcionDropDown(Sender);
end;

procedure TfrmManSectoresIntranet.fpAbmShow(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls(fraSector, True);
end;

procedure TfrmManSectoresIntranet.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'SE_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;


  frmArbolSectoresEmbebido := TfrmArbolSectores.Create(pnlArbol);
  with frmArbolSectoresEmbebido do
  begin
    Parent := pnlArbol;
    Align := alClient;
    pnlBottom.Visible := False;
    BorderStyle := TFormBorderStyle(bsNone);
    Constraints.MinHeight := 150;
    MostrarSector(Self.sdqConsulta.FieldByName('SE_ID').AsInteger);
    Visible := True;
    tvSectores.OnChange := SeleccionarArbol;
  end;
end;

procedure TfrmManSectoresIntranet.SeleccionarArbol(Sender: TObject; Node: TTreeNode);
begin
  with frmArbolSectoresEmbebido do
  begin
    if sdqSectores.Active and not sdqSectores.FieldByName('SE_ID').IsNull then
      Self.sdqConsulta.Locate('SE_ID', sdqSectores.FieldByName('SE_ID').AsInteger, []);
  end;
end;

procedure TfrmManSectoresIntranet.RefreshData;
var
  sSQL: String;
  nID: Integer;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    nID := sdqConsultaSE_ID.AsInteger
  else
    nID := 0;

  sSQL := FSQL + DoFiltro(pnlFiltros) + IIF(chkVerBajas.Checked, '', ' AND SE_FECHABAJA IS NULL ');

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited RefreshData;

  if nID > 0 then
    sdqConsulta.Locate('SE_ID', nID, []);  
end;

procedure TfrmManSectoresIntranet.ClearData;
begin
  inherited;
  fraSE_ID.Clear;
  cmbSE_NIVEL.ItemIndex := -1;
  fraSE_IDSECTORPADRE.Clear;
  cmbSE_NIVELRESOLUTIVO.ItemIndex := -1;
  chkVerBajas.Checked := False;
end;

procedure TfrmManSectoresIntranet.ActualizarNivel(Sender: TObject);
begin
  inherited;
  if cmbSE_NIVEL.ItemIndex > -1 then
    fraSE_IDSECTORPADRE.Propiedades.ExtraCondition := Format(' AND SE_IDSECTORPADRE IN (SELECT SECTOR.SE_ID ' +
                                                                                         'FROM COMPUTOS.CSE_SECTOR SECTOR ' +
                                                                                        'WHERE SECTOR.SE_NIVEL = %d - 2)', [cmbSE_NIVEL.ItemIndex])
  else
    fraSE_IDSECTORPADRE.Propiedades.ExtraCondition := '';

  Actualizar(Sender);
end;

procedure TfrmManSectoresIntranet.fraSectorPadrePropiedadesChange(Sender: TObject);
begin
  inherited;
  if fraSectorPadre.IsSelected then
    cmbNivel.ItemIndex := fraSectorPadre.sdqDatos.FieldByName('SE_NIVEL').AsInteger;
end;

procedure TfrmManSectoresIntranet.cmbNivelChange(Sender: TObject);
begin
  inherited;
  if (ModoABM = maAlta) and (cmbNivel.ItemIndex > -1) then
    fraSectorPadre.Propiedades.ExtraCondition := Format(' AND SE_IDSECTORPADRE IN (SELECT SECTOR.SE_ID ' +
                                                                                    'FROM COMPUTOS.CSE_SECTOR SECTOR ' +
                                                                                   'WHERE SECTOR.SE_NIVEL = %d - 1)', [cmbNivel.ItemIndex])
  else
    fraSectorPadre.Propiedades.ExtraCondition := '';

  cmbNivelResolutivo.Enabled := cmbNivel.ItemIndex = 3;
  lbNivelResolutivo.Enabled := cmbNivel.ItemIndex = 3;

  if cmbNivel.ItemIndex <> 3 then
    cmbNivelResolutivo.ItemIndex := -1;
end;

procedure TfrmManSectoresIntranet.sdqUsuariosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(GridUsuarios);
end;

procedure TfrmManSectoresIntranet.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if DataSet.Active and not DataSet.IsEmpty then
  begin
    OpenQueryEx(sdqUsuarios, [sdqConsultaSE_ID.AsInteger]);
    frmArbolSectoresEmbebido.sdqSectores.Locate('SE_ID', sdqConsultaSE_ID.AsInteger, []);
  end else
    sdqUsuarios.Close;
end;

procedure TfrmManSectoresIntranet.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);
  frmArbolSectoresEmbebido.MostrarSector(Self.sdqConsulta.FieldByName('SE_ID').AsInteger);
end;

procedure TfrmManSectoresIntranet.sdqConsultaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  sdqUsuarios.Close;
end;

procedure TfrmManSectoresIntranet.Actualizar(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmManSectoresIntranet.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraSE_ID.Clear;
  cmbSE_NIVEL.ItemIndex := -1;
  fraSE_IDSECTORPADRE.Clear;
  cmbSE_NIVELRESOLUTIVO.ItemIndex := -1;
end;

procedure TfrmManSectoresIntranet.GridUsuariosGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;
  if AreIn(Field.FullName, ['SC_DESCRIPCION']) then
  begin
    if Field.DataSet.FieldByName('BAJA_SECTOR').IsNull then
      AFont.Color := clBlack
    else
      AFont.Color := clRed;
  end;

  if AreIn(Field.FullName, ['JEFE']) then
  begin
    if Field.DataSet.FieldByName('BAJA_JEFE').IsNull then
      AFont.Color := clBlack
    else
      AFont.Color := clRed;
  end;
end;

end.
