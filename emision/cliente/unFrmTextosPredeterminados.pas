unit unFrmTextosPredeterminados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ExtCtrls, DB, SDEngine, StdCtrls, RxRichEd, DBRichEd,
  ExComboBox, AnsiSql, FormPanel, unFraToolbarRTF, ImageComboBox, Menus,
  unConstEmision, unCustomPanelABM, CustomDlgs, Strfuncs, SqlFuncs, DBSql,
  unSesion, ImgList;

type
  TfrmTextosPredeterminados = class(TForm)
    Panel1: TPanel;
    Grid: TArtDBGrid;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbNuevo: TToolButton;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    tbPropiedades: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    tbEnviarMail: TToolButton;
    tbBuscar: TToolButton;
    tbMaxRegistros: TToolButton;
    tbSalir: TToolButton;
    sdqTextosPredeterminados: TSDQuery;
    Panel2: TPanel;
    reTexto: TRxDBRichEdit;
    dsTextoPredeterminados: TDataSource;
    gbTipoContacto: TGroupBox;
    Label1: TLabel;
    cmbTipoContacto: TExComboBox;
    fpEventosABM: TFormPanel;
    Bevel4: TBevel;
    Label21: TLabel;
    Label16: TLabel;
    Bevel5: TBevel;
    btnEvAceptar: TButton;
    btnEvCancelar: TButton;
    pnlEventSql: TPanel;
    cmbAbmTipoContacto: TExComboBox;
    edFormatoMensaje: TRxRichEdit;
    fraFormatoMensaje: TfraToolbarRTF;
    Label2: TLabel;
    edNombreTexto: TEdit;
    pmnuCampos: TPopupMenu;
    mnuRazonSocial: TMenuItem;
    mnuCuit: TMenuItem;
    mnuContrato: TMenuItem;
    mnuMasaTotal: TMenuItem;
    mnuCantidadEmpledos: TMenuItem;
    mnuVigenciaDesde: TMenuItem;
    MnuVigenciaHasta: TMenuItem;
    mnuUltimaNomina: TMenuItem;
    mnuFechaInicioActividades: TMenuItem;
    mnuSector: TMenuItem;
    mnuSuss: TMenuItem;
    mnuFechaAfiliacion: TMenuItem;
    mnuCodigoActividad: TMenuItem;
    Domicilio1: TMenuItem;
    mnuTelefono: TMenuItem;
    mnuContacto: TMenuItem;
    tbEvToolBar: TToolBar;
    tbEvAgrCampo: TToolButton;
    tbEvAgrParametro: TToolButton;
    ToolButton1: TToolButton;
    tbEvAbmImprimir: TToolButton;
    pmnuParametros: TPopupMenu;
    mnuFecha: TMenuItem;
    mnuHora: TMenuItem;
    Ao1: TMenuItem;
    mnudiaSemana: TMenuItem;
    mnuMes: TMenuItem;
    mnuProvinciaArt: TMenuItem;
    mnuDomicilioProvinciaART: TMenuItem;
    mnuObservacionesRealizadas: TMenuItem;
    mnuPeriodosAdeudados: TMenuItem;
    Imagenes: TImageList;
    Perodo1: TMenuItem;
    FormularioNota1: TMenuItem;
    procedure tbBuscarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure mnuCamposClick(Sender: TObject);
    procedure mnuParametrosClick(Sender: TObject);
    procedure btnEvAceptarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure btnEvCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    FIdTextoReferenciaSeleccionado: integer;
    FTipoContacto: string;
    ModoABM: TModoABM;
    procedure MostrarRegistros(MostrarTodos: boolean);
    procedure Cargar;
    procedure Limpiar;
    procedure Guardar;
    function Validar: Boolean;
    function  IsBaja : Boolean;
    procedure SeleccionarTexto;
  public
    procedure CargarTextoTipoGestion(aTipoContacto: String; AidTextoReferencia:integer = -1);
    property IdTextoReferenciaSeleccionado: integer read FIdTextoReferenciaSeleccionado write FIdTextoReferenciaSeleccionado;
    property TipoContacto: string read FTipoContacto write FTipoContacto;
  end;

var
  frmTextosPredeterminados: TfrmTextosPredeterminados;

implementation

uses unDmPrincipal, unDmEmision;

{$R *.dfm}

{ TfrmTextosPredeterminados }

procedure TfrmTextosPredeterminados.CargarTextoTipoGestion(
  aTipoContacto: String; AidTextoReferencia: integer);
begin
  FIdTextoReferenciaSeleccionado := AidTextoReferencia;
  FTipoContacto := aTipoContacto;
  cmbTipoContacto.Value := trim(aTipoContacto);
  cmbTipoContacto.Enabled := false;
  cmbAbmTipoContacto.Enabled := false;
  MostrarRegistros(False);
  tbBuscar.Visible := true;
  Grid.Columns[0].Width := 18;
  Grid.Columns[0].Title.Caption := '';
  Grid.Columns[0].Visible := true;
end;

procedure TfrmTextosPredeterminados.MostrarRegistros(
  MostrarTodos: boolean);
begin
  sdqTextosPredeterminados.Close;
  sdqTextosPredeterminados.SQL.Clear;
  sdqTextosPredeterminados.SQL.Add('SELECT ITS.TS_ID, ');
  sdqTextosPredeterminados.SQL.Add('       DECODE(ITS.TS_IDTIPOCONTACTO, ');
  sdqTextosPredeterminados.SQL.Add('              ''T'', ''Telefónico'', ');
  sdqTextosPredeterminados.SQL.Add('              ''M'', ''Mail'', ');
  sdqTextosPredeterminados.SQL.Add('              ''C'', ''Correo'', ');
  sdqTextosPredeterminados.SQL.Add('              ''P'', ''Personal'', ');
  sdqTextosPredeterminados.SQL.Add('              ''F'', ''Fax'') TipoContacto, ');
  sdqTextosPredeterminados.SQL.Add('       ITS.TS_TEXTO, ITS.TS_USUALTA, ITS.TS_FECHAALTA, ITS.TS_USUBAJA, ');
  sdqTextosPredeterminados.SQL.Add('       ITS.TS_FECHABAJA, ITS.TS_DESCRIPCION, ITS.TS_IDTIPOCONTACTO');
  sdqTextosPredeterminados.SQL.Add('  FROM EMI.ITS_TEXTOREFERENCIA ITS ');
  sdqTextosPredeterminados.SQL.Add(' WHERE TS_IDTIPOCONTACTO = :tipocontacto');
  if not MostrarTodos then sdqTextosPredeterminados.SQL.Add(' AND TS_ID = ' + SqlValue(FIdTextoReferenciaSeleccionado));
  sdqTextosPredeterminados.ParamByName('tipocontacto').AsString := cmbTipoContacto.Value;
  sdqTextosPredeterminados.Open;
end;

procedure TfrmTextosPredeterminados.tbBuscarClick(
  Sender: TObject);
begin
  MostrarRegistros(TToolButton(Sender).Down);
end;

procedure TfrmTextosPredeterminados.tbPropiedadesClick(Sender: TObject);
begin
  SeleccionarTexto;
end;

procedure TfrmTextosPredeterminados.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var bmp: TBitMap;
begin
    with (Sender as TDBGrid) do
    begin
        if (datacol = 0) then
        begin
            canvas.FillRect(rect);
            bmp := TBitMap.Create;
            if (Column.Field.Value = FIdTextoReferenciaSeleccionado) then
          	    Imagenes.GetBitmap(0, Bmp)
            else
                Imagenes.GetBitmap(1, Bmp);
            canvas.Draw(rect.Left, rect.Top,bmp);
            bmp.Free;
        end;
    end;
end;

procedure TfrmTextosPredeterminados.tbNuevoClick(Sender: TObject);
begin
  Limpiar;
  cmbAbmTipoContacto.Value := cmbTipoContacto.Value;
  ModoABM := maAlta;
  fpEventosABM.ShowModal;
  tbRefrescarClick(Sender);
end;

procedure TfrmTextosPredeterminados.tbModificarClick(Sender: TObject);
begin
  if sdqTextosPredeterminados.Active and (not sdqTextosPredeterminados.IsEmpty) then
  begin
    Limpiar;
    cmbAbmTipoContacto.Value := cmbTipoContacto.Value;
    ModoABM := maModificacion;
    Cargar;
    fpEventosABM.ShowModal;
    tbRefrescarClick(Sender);
  end;
end;

procedure TfrmTextosPredeterminados.mnuCamposClick(Sender: TObject);
begin
  edFormatoMensaje.SelText := '<:' + FIELD_PARAM +  StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]) + '>';
end;

procedure TfrmTextosPredeterminados.mnuParametrosClick(Sender: TObject);
begin
  edFormatoMensaje.SelText := '<:' + ACTION_PARAM + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]) + '>';
end;

procedure TfrmTextosPredeterminados.Cargar;
begin
  cmbAbmTipoContacto.Value := trim(sdqTextosPredeterminados.FieldByName('TS_IDTIPOCONTACTO').AsString);
  edNombreTexto.Text := sdqTextosPredeterminados.FieldByName('TS_DESCRIPCION').AsString;
  BlobSql('SELECT TS_TEXTO ' +
          'FROM EMI.ITS_TEXTOREFERENCIA ' +
          'WHERE TS_ID = ' + SqlValue(sdqTextosPredeterminados.FieldByName('TS_ID').AsInteger), edFormatoMensaje.Lines);
end;

procedure TfrmTextosPredeterminados.Limpiar;
begin
  cmbAbmTipoContacto.Text := '';
  edNombreTexto.Clear;
  edFormatoMensaje.Lines.Clear;
end;

procedure TfrmTextosPredeterminados.btnEvAceptarClick(Sender: TObject);
begin
  Guardar;
end;

procedure TfrmTextosPredeterminados.Guardar;
var
  Sql: TCustomSql;
begin
  if Validar then
  begin
    Sql := TDBSql.Create;
    Sql.TableName := 'EMI.ITS_TEXTOREFERENCIA';
    try
      BeginTrans(true);
      Sql.Clear;
      if ModoABM = maBaja Then
      begin
        Sql.PrimaryKey.Add('TS_ID', sdqTextosPredeterminados.FieldByName('TS_ID').AsInteger );
        Sql.Fields.Add('TS_USUBAJA', Sesion.LoginName );
        Sql.Fields.Add('TS_FECHABAJA', exDateTime );
        Sql.SqlType := stUpdate;
      end else begin
        Sql.Fields.Add('TS_DESCRIPCION', edNombreTexto.Text);
        Sql.Fields.Add('TS_IDTIPOCONTACTO', cmbAbmTipoContacto.Value);
        if ModoABM = maAlta Then
        begin
          Sql.PrimaryKey.Add('TS_ID', GetSecNextVal('emi.seq_its_id'));
          Sql.Fields.Add('TS_USUALTA', Sesion.LoginName );
          Sql.Fields.Add('TS_FECHAALTA', exDateTime );
          Sql.SqlType := stInsert;
        end else begin
          Sql.PrimaryKey.Add('TS_ID', sdqTextosPredeterminados.FieldByName('TS_ID').AsInteger);
  //        Sql.Fields.Add('TS_USUMODIF', Sesion.LoginName);
  //        Sql.Fields.Add('TS_FECHAMODIF', exDateTime );
          Sql.Fields.Add('TS_USUBAJA', exNull );
          Sql.Fields.Add('TS_FECHABAJA', exNull );
          Sql.SqlType := stUpdate;
        end;
      end;
      EjecutarSqlST( Sql.Sql );

      edFormatoMensaje.PlainText := true;
      if ModoABM <> maBaja then
        SaveBlob(  'SELECT TS_TEXTO ' +
                   'FROM EMI.ITS_TEXTOREFERENCIA ' +
                   'WHERE TS_ID = ' + SqlValue(Integer(Sql.PrimaryKey[0].Value)),
                   'UPDATE EMI.ITS_TEXTOREFERENCIA ' +
                   'SET TS_TEXTO = :TS_TEXTO ' +
                   'WHERE TS_ID = ' + SqlValue(Integer(Sql.PrimaryKey[0].Value)),
                   'TS_TEXTO', 
                    edFormatoMensaje.Lines);

      CommitTrans(true);
      if (tbBuscar.Visible) and (not tbBuscar.Down) then begin
        FIdTextoReferenciaSeleccionado := Integer(Sql.PrimaryKey[0].Value);
        MostrarRegistros(tbBuscar.Down);
      end;
      fpEventosABM.ModalResult := mrOk;
    except
      on E: Exception do begin
         Rollback(true);
         ErrorMsg(E, 'Error al guardar el Registro.');
      end;
    end;
    Sql.Free;
  end;
end;

function TfrmTextosPredeterminados.Validar: Boolean;
begin
  if ModoABM <> maBaja then
    Result := VerificarMultiple(['Administración de Textos Predeterminados',
                                  cmbTipoContacto, not IsEmptyString(cmbTipoContacto.text), 'Debe especificar el tipo de contacto.',
                                  edNombreTexto, not IsEmptyString(edNombreTexto.text), 'Debe especificar nombre del texto.',
                                  edFormatoMensaje, (edFormatoMensaje.Lines.Count > 0) , 'Debe especificar el texto.'
                                ])
  else result := true;
end;

procedure TfrmTextosPredeterminados.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTextosPredeterminados.btnEvCancelarClick(Sender: TObject);
begin
  fpEventosABM.ModalResult := mrOk;
end;

procedure TfrmTextosPredeterminados.FormCreate(Sender: TObject);
begin
  fraFormatoMensaje.Edit := edFormatoMensaje;
end;

procedure TfrmTextosPredeterminados.GridDblClick(Sender: TObject);
begin
  SeleccionarTexto;
end;

procedure TfrmTextosPredeterminados.SeleccionarTexto;
begin
  if (FIdTextoReferenciaSeleccionado = sdqTextosPredeterminados.fieldbyname('TS_ID').AsInteger) then
    FIdTextoReferenciaSeleccionado := -1
  else
    FIdTextoReferenciaSeleccionado := sdqTextosPredeterminados.fieldbyname('TS_ID').AsInteger;
  Grid.Refresh;
end;

procedure TfrmTextosPredeterminados.tbRefrescarClick(Sender: TObject);
begin
  if sdqTextosPredeterminados.Active then sdqTextosPredeterminados.Refresh
  else sdqTextosPredeterminados.Open;
end;

procedure TfrmTextosPredeterminados.tbEliminarClick(Sender: TObject);
begin
  ModoABM := maBaja;
  Guardar;
  tbRefrescarClick(Sender);
end;

procedure TfrmTextosPredeterminados.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if IsBaja Then
    AFont.Color := clRed;
end;

function TfrmTextosPredeterminados.IsBaja: Boolean;
begin
  Result := sdqTextosPredeterminados.Active and ( not sdqTextosPredeterminados.FieldByName('TS_FECHABAJA').IsNull);
end;

end.
