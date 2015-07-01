unit unModificaTraspasoIngresos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, ShortCutControl, Db, SDEngine, StdCtrls, CurrEdit, Mask, ToolEdit, unArt, DateComboBox,
  QRPrntr, LookupDialog, ExtCtrls, QueryPrint, SortDlg, Menus, artSeguridad;

type
  TfrmModificaTraspasoIngresos = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tblSeparador1: TToolButton;
    tlbBaja: TToolButton;
    tblSeparador2: TToolButton;
    tlbModificacion: TToolButton;
    tlbSalir: TToolButton;
    ArtDBGrid: TArtDBGrid;
    ShortCutControl: TShortCutControl;
    sdqCargaDatos: TSDQuery;
    dsCargaDatos: TDataSource;
    edSA_CUIT: TMaskEdit;
    edSA_NOMBRE: TEdit;
    tlbCartas: TToolButton;
    ToolButton2: TToolButton;
    tbImprimir: TToolButton;
    ToolButton3: TToolButton;
    lbCUIT: TLabel;
    edFORMULARIO: TEdit;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    tbOrdenar: TToolButton;
    SortDialog: TSortDialog;
    mnuImprimir: TPopupMenu;
    mnuGrilla: TMenuItem;
    mnuCarta: TMenuItem;
    ToolButton1: TToolButton;
    Seguridad: TSeguridad;
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure tlbModificacionClick(Sender: TObject);
    procedure tlbCartasClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                     Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbOrdenarClick(Sender: TObject);
    procedure mnuGrillaClick(Sender: TObject);
    procedure mnuCartaClick(Sender: TObject);
  private
    FIdSolicitud: TTableId;

    procedure LoadDynamicSortFields(aSortFields: TSortFields; aColumns: TDBGridColumns);
  public
    function DoCargaDatos(aId: TTableID): Boolean;
  end;

var
  frmModificaTraspasoIngresos: TfrmModificaTraspasoIngresos;

implementation

uses
  General, CustomDlgs, unPrincipal, AnsiSQL, unDmPrincipal, SqlFuncs, unEventosTraspasoIngreso, unFrmConsultaCarta,
  unAfiliaciones, unCustomDataModule, unAfiGeneracionCartas, Printers, unAfiCartasDoc;

{$R *.DFM}

function TfrmModificaTraspasoIngresos.DoCargaDatos(aId: TTableID): Boolean;
var
  iIdFormulario: Integer;
  sSql: String;
begin
  Result := True;

  FIdSolicitud := aId;
  try
    sSql :=
      'SELECT sa_cuit, sa_nombre, fo_formulario, sa_idformulario' +
       ' FROM asa_solicitudafiliacion, afo_formulario' +
      ' WHERE sa_idformulario = fo_id' +
        ' AND sa_id = :id';
    with GetQueryEx(sSql, [aId]) do
    try
      edSA_CUIT.Text    := FieldByName('sa_cuit').AsString;
      edSA_NOMBRE.Text  := FieldByName('sa_nombre').AsString;
      edFORMULARIO.Text := FieldByName('fo_formulario').AsString;
      iIdFormulario     := FieldByName('sa_idformulario').AsInteger;
    finally
      Free;
    end;
    
    // Cargar datos de grilla
    sdqCargaDatos.Close;
    sdqCargaDatos.SQL.Text :=
      'SELECT   ti_id, ti_idformulario, ti_codigo, ti_fecha, ti_observaciones, ti_deuda, ti_idcarta, ht_nombre tipo_de_carta,' +
              ' ca_fechaimpresion, tb_descripcion tipo_de_evento,' +
              ' art.utiles.iif_compara(''IN'', ca_recepcionok, ''S N'', 0,' +
                                     ' (actualdate - TO_DATE(ca_fechaimpresion, ''DD/MM/YYYY''))) dias_transcurridos,' +
              ' sa_idformulario, ca_recepcionok, ti_fechabaja, sa_idartanterior' +
         ' FROM ati_traspasoingreso, cca_carta, comunes.cht_historicotextocarta, ctb_tablas, asa_solicitudafiliacion' +
        ' WHERE tb_fechabaja IS NULL' +
          ' AND ti_codigo = tb_codigo' +
          ' AND tb_clave = ''EVTIN''' +
          ' AND ti_idformulario = sa_idformulario(+)' +
          ' AND ti_idcarta = ca_id(+)' +
          ' AND ca_idhistoricotextocarta = ht_id(+)' +
          ' AND tb_especial1 IS NULL' +
          ' AND ti_idformulario = :idformulario' +
     ' UNION' +
     ' SELECT   ti_id, ti_idformulario, ti_codigo, ti_fecha, ti_observaciones, ti_deuda, ti_idcarta, tc_nombre tipo_de_carta,' +
              ' ca_fechaimpresion, tb_descripcion tipo_de_evento,' +
              ' art.utiles.iif_compara(''IN'', ca_recepcionok, ''S N'', 0,' +
                                     ' (actualdate - TO_DATE(ca_fechaimpresion, ''DD/MM/YYYY''))) dias_transcurridos,' +
              ' sa_idformulario, ca_recepcionok, ti_fechabaja, sa_idartanterior' +
         ' FROM ati_traspasoingreso, cca_carta, ctc_textocarta, ctb_tablas, asa_solicitudafiliacion' +
        ' WHERE tb_fechabaja IS NULL' +
          ' AND ti_codigo = tb_codigo' +
          ' AND tb_clave = ''EVTIN''' +
          ' AND ti_idformulario = sa_idformulario(+)' +
          ' AND ti_idcarta = ca_id(+)' +
          ' AND tc_id(+) = tb_especial1' +
          ' AND ti_idformulario = :idformulario' +
     ' ORDER BY ti_id';
    OpenQueryEx(sdqCargaDatos, [iIdFormulario]);
  except
    on E: exception do
    begin
      ErrorMsg(E, 'Ocurrió un error en la recuperación de datos.');
      Result := false;
    end;
  end;
end;

procedure TfrmModificaTraspasoIngresos.tlbModificacionClick(Sender: TObject);
begin
  if not sdqCargaDatos.IsEmpty then
  begin
    if not sdqCargaDatos.FieldByName('ti_fechabaja').IsNull then
    begin
      MsgBox('No se puede modificar un evento eliminado.');
      Abort;
    end;

    with TfrmEventosTraspasoIngreso.Create(Self) do
    try
      DoCargarDatos(sdqCargaDatos.FieldByName('ti_id').AsInteger, fsModificar);
      ShowModal;
      sdqCargaDatos.Close;
      OpenQuery(sdqCargaDatos);
    finally
      Free;
    end;
  end;
end;

procedure TfrmModificaTraspasoIngresos.tlbNuevoClick(Sender: TObject);
begin
  with TfrmEventosTraspasoIngreso.Create(Self) do
  try
    DoCargarDatos(sdqCargaDatos.FieldByName('ti_idformulario').AsInteger, fsAgregar);
    ShowModal;
    sdqCargaDatos.Close;
    OpenQuery(sdqCargaDatos);
  finally
    Free;
  end;
end;

procedure TfrmModificaTraspasoIngresos.tlbBajaClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar((not sdqCargaDatos.FieldByName('ti_fechabaja').IsNull), ArtDBGrid, 'No se puede eliminar un evento ya eliminado.');
  Verificar((sdqCargaDatos.FieldByName('ti_codigo').AsString = '001'), ArtDBGrid, 'No se puede eliminar el evento seleccionado.');
  Verificar((sdqCargaDatos.FieldByName('ca_recepcionok').AsString = 'S'), ArtDBGrid, 'No se puede eliminar el evento seleccionado porque ya tiene una carta recepcionada.');

  if Msgbox('¿ Realmente desea eliminar este evento ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    BeginTrans;

    with sdqCargaDatos do
    try
      sSql :=
        'UPDATE ati_traspasoingreso' +
          ' SET ti_usubaja = :usuario,' +
              ' ti_fechabaja = SYSDATE' +
        ' WHERE ti_id = :id';
      EjecutarSqlSTEx(sSql, [frmPrincipal.DBLogin.UserId, FieldByName('ti_id').AsInteger]);
      
      if not FieldByName('ti_idcarta').IsNull then
      begin
        sSql :=
          'UPDATE cca_carta' +
            ' SET ca_usubaja = :usuario,' +
                ' ca_fechabaja = SYSDATE' +
          ' WHERE ca_id = :id';
        EjecutarSqlSTEx(sSql, [frmPrincipal.DBLogin.UserId, FieldByName('ti_idcarta').AsInteger]);
      end;

      CommitTrans;

      Close;
      OpenQuery(sdqCargaDatos);
    except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Se produjo un error en la baja.');
      end;
    end;
  end;
end;

procedure TfrmModificaTraspasoIngresos.tlbCartasClick(Sender: TObject);
begin
  with TfrmConsultaCarta.Create(Self) do
  try
    DoCargaCartas(sdqCargaDatos.FieldByName('sa_idformulario').AsInteger);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmModificaTraspasoIngresos.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmModificaTraspasoIngresos.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmModificaTraspasoIngresos.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                              var Background: TColor; Highlight: Boolean);
begin
  inherited;

  // Poner en rojo los registros que tengan "Fecha de Baja"
  if not sdqCargaDatos.FieldByName('ti_fechabaja').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clRed)

  // Poner en "otro color" los registro con DIAS_TRANSCURRIDOS > 3
  else if not sdqCargaDatos.FieldByName('dias_transcurridos').IsNull and
     (sdqCargaDatos.FieldByName('dias_transcurridos').AsInteger > 3) then
    AFont.Color := IIF(Highlight, clBtnFace, clBlue);
end;

procedure TfrmModificaTraspasoIngresos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmModificaTraspasoIngresos := nil;
end;

procedure TfrmModificaTraspasoIngresos.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, ArtDBGrid.Columns);
  SortDialog.Execute;
end;

procedure TfrmModificaTraspasoIngresos.LoadDynamicSortFields(ASortFields: TSortFields; AColumns: TDBGridColumns);
var
  iLoop: Integer;
begin
  if ASortFields.Count = 0 then
    for iLoop := 0 to AColumns.Count - 1 do
      with ASortFields.Add do
      begin
        Title     := AColumns[iLoop].Title.Caption;
        DataField := AColumns[iLoop].FieldName;

        if Assigned(AColumns[iLoop].Field) then
          FieldIndex := AColumns[iLoop].Field.FieldNo;
      end;
end;
procedure TfrmModificaTraspasoIngresos.mnuGrillaClick(Sender: TObject);
  procedure ArmarLinea(Lineas: TStrings; TextoCondicion1, TextoCompleto1: String; TextoCondicion2: String = '';
                       TextoCompleto2: String = '');
  var
    sAuxiliar: String;
  begin
    sAuxiliar := IIF(TextoCondicion1 <> '', TextoCompleto1, '') + IIF(TextoCondicion2 <> '', TextoCompleto2, '');
    if sAuxiliar <> '' then
      Lineas.Add(sAuxiliar);
  end;
begin
  with QueryPrint do
  try
    if sdqCargaDatos.Active and (not sdqCargaDatos.IsEmpty) and PrintDialog.Execute then
    begin
      ArmarLinea(SubTitle.Lines, edSA_CUIT.EditText, 'CUIT: ' + edSA_CUIT.EditText);
      ArmarLinea(SubTitle.Lines, edSA_NOMBRE.Text, 'Nombre: ' + edSA_NOMBRE.Text);
      ArmarLinea(SubTitle.Lines, edFORMULARIO.Text, 'Formulario: ' + edFORMULARIO.Text);
      SetGridColumns(ArtDBGrid, True, [baDetail, baHeader, baTotal, baSubTotal]);
      Title.Text := Caption;
      Print;
    end;
  finally
    SubTitle.Lines.Clear;
    Fields.Clear;
  end;
end;

procedure TfrmModificaTraspasoIngresos.mnuCartaClick(Sender: TObject);
var
  bCargarValores: Boolean;
  bExisteDoc: Boolean;
  sCodPrevio: String;
  sSql: String;
begin
  if sdqCargaDatos.FieldByName('ti_idcarta').AsInteger < 1 then
  begin
    sCodPrevio  := sdqCargaDatos.FieldByName('ti_codigo').AsString;

    //Se fija si este evento tiene asociadas cartas documento o no
    sSql :=
      'SELECT tc_id' +
       ' FROM ctb_tablas, ctc_textocarta' +
      ' WHERE tc_id = tb_especial1' +
        ' AND tb_clave = ''EVTIN''' +
        ' AND tb_codigo = :codigo';
    bExisteDoc := ExisteSqlEx(sSql, [sCodPrevio]);
    
    if not bExisteDoc then
      raise Exception.Create('Este evento no tiene asociado un texto para la carta.');

    //Imprime la carta documento
    with TFrmAfiGeneracionCartas.Create(Self) do
    try
      bCargarValores := True;
      ExecuteIngreso(sdqCargaDatos.FieldByName('ti_id').AsString, sCodPrevio, fsAgregar, bCargarValores);
    finally
      Free;
    end;
  end
  else
    with TAfiCartasDoc.Create do
    try
      MostrarCartaDocumento(sdqCargaDatos.FieldByName('ti_idcarta').AsInteger, tmBeginEnd);
    finally
      Free;
    end;
  DoCargaDatos(FIdSolicitud);
end;

end.
