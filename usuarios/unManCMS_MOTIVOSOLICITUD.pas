unit unManCMS_MOTIVOSOLICITUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, Mask, PatternEdit, IntEdit,
  JvExControls, JvComponent, JvXPCore, JvXPCheckCtrls, JvXPContainer,
  ImgList, JvComponentBase, RxPlacemnt;

type
  TfrmManCMS_MOTIVOSOLICITUD = class(TfrmCustomGridABM)
    sdqConsultaMS_ID: TFloatField;
    sdqConsultaMS_DESCRIPCION: TStringField;
    sdqConsultaMS_NIVEL: TFloatField;
    sdqConsultaMS_VISIBLE: TStringField;
    sdqConsultaMS_IDPADRE: TFloatField;
    sdqConsultaMS_IDSECTORDEFAULT: TFloatField;
    sdqConsultaMS_TIEMPORESOLUCION: TFloatField;
    sdqConsultaPADRE: TStringField;
    Label2: TLabel;
    Label4: TLabel;
    fraMotivo: TfraCodDesc;
    edMS_DESCRIPCION: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    fraMotivoPadre: TfraCodDesc;
    cmbMS_NIVEL: TComboBox;
    Label1: TLabel;
    Label5: TLabel;
    fraMS_IDSECTORDEFAULT: TfraCodDesc;
    edDIAS_RESOLUCION: TIntEdit;
    sdqConsultaMS_USUALTA: TStringField;
    sdqConsultaMS_FECHAALTA: TDateTimeField;
    sdqConsultaMS_USUMODIF: TStringField;
    sdqConsultaMS_FECHAMODIF: TDateTimeField;
    sdqConsultaMS_USUBAJA: TStringField;
    sdqConsultaMS_FECHABAJA: TDateTimeField;
    sdqConsultaSECTOR_DEFAULT: TStringField;
    sdqConsultaDIAS_RESOLUCION: TFloatField;
    sdqConsultaHORAS_RESOLUCION: TFloatField;
    sdqConsultaMINUTOS_RESOLUCION: TFloatField;
    edHORAS_RESOLUCION: TIntEdit;
    Label7: TLabel;
    Label8: TLabel;
    edMINUTOS_RESOLUCION: TIntEdit;
    Label9: TLabel;
    edMS_ID: TIntEdit;
    Label10: TLabel;
    sdqConsultaMS_EJECUTABLEOBLIGATORIO: TStringField;
    chkMS_EJECUTABLEOBLIGATORIO: TJvXPCheckbox;
    JvXPStyleManager: TJvXPStyleManager;
    sdqConsultaMS_MAXIMAPRIORIDAD: TFloatField;
    Label11: TLabel;
    cmbMS_MAXIMAPRIORIDAD: TComboBox;
    sdqConsultaMAX_PRIORIDAD: TStringField;
    sdqConsultaNIVEL_REQUERIDO: TStringField;
    chkMS_VISIBLE: TJvXPCheckbox;
    ToolBarSectores: TToolBar;
    tbArbolSectores: TToolButton;
    ImageListSectores: TImageList;
    Label12: TLabel;
    cmbMS_FECHA_SOLICITUD_REQUERIDA: TComboBox;
    sdqConsultaMS_FECHA_SOLICITUD_REQUERIDA: TStringField;
    sdqConsultaSOLICITUD_REQUERIDA: TStringField;
    sdqConsultaNUM_FECHA_SOLICITUD_REQUERIDA: TFloatField;
    ShortCutControlHijo: TShortCutControl;
    Label13: TLabel;
    fraMS_IDPADRE: TfraCodDesc;
    chkNoVerBajas: TCheckBox;
    Label14: TLabel;
    cmbMS_PLAZO_ESTIMADO_USUARIO: TComboBox;
    sdqConsultaPLAZO_ESTIMADO_USUARIO: TStringField;
    sdqConsultaNUM_PLAZO_ESTIMADO_USUARIO: TFloatField;
    Label15: TLabel;
    cmbMS_FECHA_INICIO_PROBABLE: TComboBox;
    sdqConsultaFECHA_INICIO_PROBABLE: TStringField;
    sdqConsultaNUM_FECHA_INICIO_PROBABLE: TFloatField;
    Label16: TLabel;
    cmbMS_FECHA_FIN_PROBABLE: TComboBox;
    sdqConsultaFECHA_FIN_PROBABLE: TStringField;
    sdqConsultaNUM_FECHA_FIN_PROBABLE: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbArbolSectoresClick(Sender: TObject);
  private
    FIdSistemaTicket: Integer;  
    FSQL, FMotivoPadreExtraCondition: String;  
  public
    procedure RefreshData; override;

    procedure ClearData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
    function  DoABM: Boolean; override;
  end;

var
  frmManCMS_MOTIVOSOLICITUD: TfrmManCMS_MOTIVOSOLICITUD;

implementation

uses
  unDmPrincipal, VCLExtra, CustomDlgs, AnsiSql, SqlFuncs, unArt, Math,
  unCustomConsulta, unFiltros, unSesion, General, unGrids, Strfuncs,
  unArbolSectores, unSistemas, DateTimeFuncs;

{$R *.dfm}

{ TfrmCMS_MOTIVOSOLICITUD }

procedure TfrmManCMS_MOTIVOSOLICITUD.ClearControls;
begin
  fraMotivo.Clear;
  fraMotivoPadre.Clear;
  fraMS_IDSECTORDEFAULT.Clear;
  cmbMS_NIVEL.ItemIndex := 0;
  cmbMS_MAXIMAPRIORIDAD.ItemIndex := 2;
  cmbMS_FECHA_SOLICITUD_REQUERIDA.ItemIndex := 0;
  cmbMS_PLAZO_ESTIMADO_USUARIO.ItemIndex := 0;
  cmbMS_FECHA_INICIO_PROBABLE.ItemIndex := 0;
  cmbMS_FECHA_FIN_PROBABLE.ItemIndex := 0;
  edMS_DESCRIPCION.Clear;
  edDIAS_RESOLUCION.Clear;
  edHORAS_RESOLUCION.Clear;
  edMINUTOS_RESOLUCION.Clear;
  chkMS_EJECUTABLEOBLIGATORIO.Checked := False;
  chkMS_VISIBLE.Checked := True; 
  edMS_ID.Value := ValorSQLInteger('SELECT MAX(MS_ID) + 1 FROM COMPUTOS.CMS_MOTIVOSOLICITUD');
  VCLExtra.LockControls(edMS_ID, True);
end;

function TfrmManCMS_MOTIVOSOLICITUD.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'COMPUTOS.CMS_MOTIVOSOLICITUD';

  try
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('MS_ID', sdqConsulta.FieldByName('MS_ID').AsInteger, False);
      Sql.Fields.Add('MS_FECHABAJA', exDateTime);
      Sql.Fields.Add('MS_USUBAJA', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end else
    begin
      if ModoABM = maAlta then
        begin
          Sql.PrimaryKey.Add('MS_ID', ValorSQLInteger('SELECT MAX(MS_ID) + 1 FROM COMPUTOS.CMS_MOTIVOSOLICITUD'), False);
          Sql.Fields.Add('MS_FECHAALTA', exDateTime);
          Sql.Fields.Add('MS_USUALTA', Sesion.UserID);
          Sql.SqlType := stInsert;
        end
      else if ModoABM = maModificacion then
        begin
          Sql.PrimaryKey.AddInteger('MS_ID', edMS_ID.Value, False);
          Sql.Fields.Add('MS_FECHAMODIF', exDateTime);
          Sql.Fields.Add('MS_USUMODIF', Sesion.UserID);
          Sql.Fields.Add('MS_FECHABAJA', exNull);
          Sql.Fields.Add('MS_USUBAJA', exNull);
          Sql.SqlType := stUpdate;
        end;

      Sql.Fields.Add('MS_DESCRIPCION', edMS_DESCRIPCION.Text);
      Sql.Fields.AddInteger('MS_IDPADRE', StrToIntDef(Nvl(fraMotivoPadre.Id, -1), -1), False);
      Sql.Fields.Add('MS_IDSECTORDEFAULT', fraMS_IDSECTORDEFAULT.Id);
      Sql.Fields.Add('MS_NIVEL', cmbMS_NIVEL.ItemIndex);
      Sql.Fields.Add('MS_MAXIMAPRIORIDAD', cmbMS_MAXIMAPRIORIDAD.ItemIndex + 1);
      case cmbMS_FECHA_SOLICITUD_REQUERIDA.ItemIndex of
        0: Sql.Fields.Add('MS_FECHA_SOLICITUD_REQUERIDA', 'N');
        1: Sql.Fields.Add('MS_FECHA_SOLICITUD_REQUERIDA', 'S');
        2: Sql.Fields.Add('MS_FECHA_SOLICITUD_REQUERIDA', 'O');
      end;
      case cmbMS_PLAZO_ESTIMADO_USUARIO.ItemIndex of
        0: Sql.Fields.Add('MS_PLAZO_ESTIMADO_USUARIO', 'N');
        1: Sql.Fields.Add('MS_PLAZO_ESTIMADO_USUARIO', 'S');
        2: Sql.Fields.Add('MS_PLAZO_ESTIMADO_USUARIO', 'O');
      end;
      case cmbMS_FECHA_INICIO_PROBABLE.ItemIndex of
        0: Sql.Fields.Add('MS_FECHA_INICIO_PROBABLE', 'N');
        1: Sql.Fields.Add('MS_FECHA_INICIO_PROBABLE', 'S');
        2: Sql.Fields.Add('MS_FECHA_INICIO_PROBABLE', 'O');
      end;
      case cmbMS_FECHA_FIN_PROBABLE.ItemIndex of
        0: Sql.Fields.Add('MS_FECHA_FIN_PROBABLE', 'N');
        1: Sql.Fields.Add('MS_FECHA_FIN_PROBABLE', 'S');
        2: Sql.Fields.Add('MS_FECHA_FIN_PROBABLE', 'O');
      end;
      Sql.Fields.AddString('MS_EJECUTABLEOBLIGATORIO', VarToStr(IIF(chkMS_EJECUTABLEOBLIGATORIO.Checked, 'S', 'N')));
      Sql.Fields.AddString('MS_VISIBLE', VarToStr(IIF(chkMS_VISIBLE.Checked, 'S', 'N')));
      Sql.Fields.AddInteger('MS_TIEMPORESOLUCION', ConvertToMinutes(edDIAS_RESOLUCION.Value, edHORAS_RESOLUCION.Value, edMINUTOS_RESOLUCION.Value));
    end;

    Result := inherited DoABM;
    // Por algún motivo se perdían los motivos al cargarlos y quiero que no me digan mas que el sistema les borra los motivos.
    CommitTrans(True); 
  except
    on E:Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al grabar el sector.');
  end;
end;

procedure TfrmManCMS_MOTIVOSOLICITUD.LoadControls;
begin
  fraMotivo.Codigo := sdqConsultaMS_ID.AsString;
  fraMotivoPadre.Codigo := sdqConsultaMS_IDPADRE.AsString;
  cmbMS_NIVEL.ItemIndex := sdqConsultaMS_NIVEL.AsInteger;
  edMS_ID.Value := sdqConsultaMS_ID.AsInteger;
  edMS_DESCRIPCION.Text := sdqConsultaMS_DESCRIPCION.AsString;
  edDIAS_RESOLUCION.Value := sdqConsultaDIAS_RESOLUCION.AsInteger;
  edHORAS_RESOLUCION.Value := sdqConsultaHORAS_RESOLUCION.AsInteger;
  edMINUTOS_RESOLUCION.Value := sdqConsultaMINUTOS_RESOLUCION.AsInteger;
  fraMS_IDSECTORDEFAULT.Codigo := sdqConsultaMS_IDSECTORDEFAULT.AsString;
  chkMS_EJECUTABLEOBLIGATORIO.Checked := sdqConsultaMS_EJECUTABLEOBLIGATORIO.AsString = 'S';
  chkMS_VISIBLE.Checked := sdqConsultaMS_VISIBLE.AsString = 'S';;
  cmbMS_MAXIMAPRIORIDAD.ItemIndex := sdqConsultaMS_MAXIMAPRIORIDAD.AsInteger - 1;
  cmbMS_FECHA_SOLICITUD_REQUERIDA.ItemIndex := sdqConsultaNUM_FECHA_SOLICITUD_REQUERIDA.AsInteger;
  cmbMS_PLAZO_ESTIMADO_USUARIO.ItemIndex := sdqConsultaNUM_PLAZO_ESTIMADO_USUARIO.AsInteger;
  cmbMS_FECHA_INICIO_PROBABLE.ItemIndex := sdqConsultaNUM_FECHA_INICIO_PROBABLE.AsInteger;
  cmbMS_FECHA_FIN_PROBABLE.ItemIndex := sdqConsultaNUM_FECHA_FIN_PROBABLE.AsInteger;
  VCLExtra.LockControls(edMS_ID, False);
end;

procedure TfrmManCMS_MOTIVOSOLICITUD.RefreshData;
var
  sSQL: String;
begin
  sSQL := FSQL + DoFiltro(pnlFiltros);

  if chkNoVerBajas.Checked then
    sSQL := sSQL + ' AND MS_FECHABAJA IS NULL '; 

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManCMS_MOTIVOSOLICITUD.Validar: Boolean;
begin
  Verificar(IsEmptyString(edMS_DESCRIPCION.Text), edMS_DESCRIPCION, 'Debe indicar una descripción para el motivo.');
  Verificar((ModoABM = maAlta) and fraMotivoPadre.IsEmpty, fraMotivoPadre.edCodigo, 'Debe indicar el motivo del cual depende el actual motivo.');
  Verificar(cmbMS_NIVEL.ItemIndex = -1, cmbMS_NIVEL, 'Debe indicar el nivel del actual motivo.');
  Verificar(fraMS_IDSECTORDEFAULT.IsEmpty, fraMS_IDSECTORDEFAULT.edCodigo, 'Debe indicar sector por default al cual se debe asignar el pedido para este motivo en particular.');
  Verificar(edMS_ID.IsEmpty, edMS_ID, 'Debe indicar un código para el actual motivo.');

  Result := True;
end;

procedure TfrmManCMS_MOTIVOSOLICITUD.FormCreate(Sender: TObject);
begin
  FIdSistemaTicket := GetIdSistemaTicket();
  sdqConsulta.SQL.Text := StringReplace(sdqConsulta.SQL.Text, '%usuario%', SqlValue(Sesion.UserID), [rfReplaceAll]);
  FMotivoPadreExtraCondition := 'AND ms_idpadre = -1 ' +
                                'AND ms_id IN (SELECT ms_idpadre ' +
                                                'FROM computos.cms_motivosolicitud, computos.cts_ticketsector ' +
                                               'WHERE art.agenda_pkg.is_sectordependiente(ts_idsector, ms_idsectordefault) = ''S'' ' +
                                                 'AND ts_idsistematicket = ' + SqlValue(FIdSistemaTicket) + ')';
  fraMS_IDPADRE.Propiedades.ExtraCondition := FMotivoPadreExtraCondition;
  fraMotivoPadre.Propiedades.ExtraCondition := FMotivoPadreExtraCondition;

  fraMS_IDSECTORDEFAULT.Propiedades.ExtraCondition := 'AND se_nivel = 4 ' +
                                                      'AND se_id IN (SELECT sector2.se_id ' +
                                                                      'FROM computos.cse_sector sector2, computos.cts_ticketsector, computos.cse_sector sector, computos.csu_sectorusuario, ' +
                                                                           'art.use_usuarios users ' +
                                                                     'WHERE users.se_usuario = ' + SQLValue(Sesion.UserID) + ' ' +
                                                                       'AND art.agenda_pkg.is_sectordependiente(su_idsector, users.se_idsector) = ''S'' ' +
                                                                       'AND art.agenda_pkg.is_sectordependiente(su_idsector, sector.se_id) = ''S'' ' +
                                                                       'AND art.agenda_pkg.is_sectordependiente(ts_idsector, sector2.se_id) = ''S'' ' +
                                                                       'AND ts_idsistematicket = ' + SqlValue(FIdSistemaTicket) + ')';

  inherited;
  VCLExtra.LockControls(fraMotivo, True);
  FieldBaja := 'MS_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmManCMS_MOTIVOSOLICITUD.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(DBGrid);
  if WindowState = wsNormal then
    Width := Min(1000, Max(Width, GetColumnWidths(DBGrid, True)));

  Grid.ColumnByField['MAX_PRIORIDAD'].Width := 48;
  Grid.ColumnByField['MS_IDPADRE'].Width := 65;
end;

procedure TfrmManCMS_MOTIVOSOLICITUD.tbArbolSectoresClick(Sender: TObject);
begin
  inherited;
  with TfrmArbolSectores.Create(Self) do
  try
    MostrarSector(StrToIntDef(fraMS_IDSECTORDEFAULT.Id, 0));
    ShowModal;
  finally
    if sdqSectores.Active and (fraMS_IDSECTORDEFAULT.Id <> sdqSectores.FieldByName('SE_ID').AsString) then
    begin
      fraMS_IDSECTORDEFAULT.Codigo := sdqSectores.FieldByName('SE_ID').AsString;
    end;

    Free;
  end;
end;

procedure TfrmManCMS_MOTIVOSOLICITUD.ClearData;
begin
  fraMS_IDPADRE.Clear;
end;

end.
