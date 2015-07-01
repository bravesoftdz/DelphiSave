unit unCentroComercializacion;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  DBCtrls, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraCanal, unFraCodigoDescripcion, unFraEntidades, unCustomForm, ImgList, XPMenu, Placemnt,
  unfraSucursal, Db, SDEngine, unFraCentroRegional, Menus, SortDlg, JvExExtCtrls, JvSplitter, artSeguridad, JvgGroupBox, JvExControls, JvComponent, JvDBLookup, Mask,
  JvExMask, JvToolEdit, JvDBControls, JvMaskEdit, ToolWin, ShortCutControl;

type
  TfrmCentroComercializacion = class(TfrmCustomForm)
    pnlFiltros: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fraSC_CANAL: TfraCanal;
    fraSC_IDENTIDAD: TfraEntidades;
    fraSC_IDSUCURSAL: TfraSucursal;
    dsACO_COTIZACION: TDataSource;
    sdqACO_COTIZACION: TSDQuery;
    dsASA_SOLICITUDAFILIACION: TDataSource;
    sdqASA_SOLICITUDAFILIACION: TSDQuery;
    sdqXVE_VENDEDOR: TSDQuery;
    dsXVE_VENDEDOR: TDataSource;
    Label6: TLabel;
    fraSU_IDCENTROREG: TfraCentroRegional;
    pmuGeneral: TPopupMenu;
    mnuOrdenar: TMenuItem;
    SortDialogACO_COTIZACION: TSortDialog;
    pnlIzquierda: TPanel;
    pnlDerecha: TPanel;
    pcPaginas: TPageControl;
    tsACO_COTIZACION: TTabSheet;
    ACO_COTIZACION: TArtDBGrid;
    tsASA_SOLICITUDAFILIACION: TTabSheet;
    ASA_SOLICITUDAFILIACION: TArtDBGrid;
    tsACO_CONTRATO: TTabSheet;
    ACO_CONTRATO: TArtDBGrid;
    tsCPR_PRESTADORES: TTabSheet;
    CPR_PRESTADORES: TArtDBGrid;
    Splitter: TJvSplitter;
    sdqACO_CONTRATO: TSDQuery;
    dsACO_CONTRATO: TDataSource;
    SortDialogASA_SOLICITUDAFILIACION: TSortDialog;
    SortDialogACO_CONTRATO: TSortDialog;
    Seguridad: TSeguridad;
    JvgGroupBox1: TJvgGroupBox;
    JvgGroupBox2: TJvgGroupBox;
    gbDatosAdicionales: TJvgGroupBox;
    pnl2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edBusqueda: TEdit;
    dsCPR_PRESTADORES: TDataSource;
    sdqCPR_PRESTADORES: TSDQuery;
    SortDialogCPR_PRESTADORES: TSortDialog;
    VE_DIRELECTRONICA: TDBText;
    VE_CUIT: TDBText;
    VE_VENDEDOR: TDBText;
    Label7: TLabel;
    DOMICILIO: TDBMemo;
    dbgXVE_VENDEDOR: TArtDBGrid;
    JvgGroupBox3: TJvgGroupBox;
    JvgGroupBox4: TJvgGroupBox;
    JvgGroupBox5: TJvgGroupBox;
    Label8: TLabel;
    JvDBDateEdit1: TJvDBDateEdit;
    Label9: TLabel;
    JvDBDateEdit2: TJvDBDateEdit;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    lbCantidad: TLabel;
    chkVerVendedores: TCheckBox;
    DBEdit2: TDBEdit;
    Label12: TLabel;
    tsCSE_SEGUIMIENTOEVENTO: TTabSheet;
    CSE_SEGUIMIENTOEVENTO: TArtDBGrid;
    dsCSE_SEGUIMIENTOEVENTO: TDataSource;
    sdqCSE_SEGUIMIENTOEVENTO: TSDQuery;
    SortDialogCSE_SEGUIMIENTOEVENTO: TSortDialog;
    JvDBMaskEdit1: TJvDBMaskEdit;
    Label13: TLabel;
    Label14: TLabel;
    JvDBMaskEdit2: TJvDBMaskEdit;
    Label15: TLabel;
    JvDBMaskEdit3: TJvDBMaskEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit3: TDBEdit;
    Label16: TLabel;
    DBMemo1: TDBMemo;
    Label17: TLabel;
    DBMemo2: TDBMemo;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit4: TDBEdit;
    Label20: TLabel;
    DBEdit5: TDBEdit;
    Label21: TLabel;
    DBEdit6: TDBEdit;
    Label22: TLabel;
    DBMemo3: TDBMemo;
    Label23: TLabel;
    DBEdit7: TDBEdit;
    tbToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbLimpiar: TToolButton;
    tbOrdenar: TToolButton;
    tbExportar: TToolButton;
    tbImprimir: TToolButton;
    tbSalir: TToolButton;
    Panel2: TPanel;
    rbCodigo: TRadioButton;
    rbNombre: TRadioButton;
    tbOcultarVendedores: TToolButton;
    Panel1: TPanel;
    Panel3: TPanel;
    JvgGroupBox6: TJvgGroupBox;
    Label24: TLabel;
    DBEdit8: TDBEdit;
    Label25: TLabel;
    DBEdit9: TDBEdit;
    Label26: TLabel;
    JvDBMaskEdit4: TJvDBMaskEdit;
    Label27: TLabel;
    DBEdit10: TDBEdit;
    Label28: TLabel;
    DBEdit11: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    JvDBDateEdit3: TJvDBDateEdit;
    JvDBDateEdit4: TJvDBDateEdit;
    Label31: TLabel;
    DBEdit12: TDBEdit;
    Label32: TLabel;
    DBEdit13: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    JvDBDateEdit5: TJvDBDateEdit;
    JvDBDateEdit6: TJvDBDateEdit;
    Label35: TLabel;
    DBMemo4: TDBMemo;
    Label36: TLabel;
    DBEdit14: TDBEdit;
    Label37: TLabel;
    DBEdit15: TDBEdit;
    Label38: TLabel;
    DBEdit16: TDBEdit;
    Label39: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label40: TLabel;
    Label41: TLabel;
    DBEdit19: TDBEdit;
    Label42: TLabel;
    DBEdit20: TDBEdit;
    Label44: TLabel;
    JvDBDateEdit7: TJvDBDateEdit;
    Label45: TLabel;
    DBMemo5: TDBMemo;
    Label43: TLabel;
    DBEdit21: TDBEdit;
    ShortCutControl: TShortCutControl;
    procedure fraSC_IDENTIDADcmbDescripcionDropDown(Sender: TObject);
    procedure fraSC_IDSUCURSALcmbDescripcionDropDown(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acMnuOrdenar(Sender: TObject);
    procedure edBusquedaChange(Sender: TObject);
    procedure pcPaginasChange(Sender: TObject);
    procedure dbgXVE_VENDEDORGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure pnl2CanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
    procedure ACO_COTIZACIONGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbSalirClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOcultarVendedoresClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure chkVerVendedoresClick(Sender: TObject);
  private
    FConsultas: Array [0..4] of TSDQuery;
    FSqls: Array [0..4] of String;

    procedure Actualizar(bPaginas: Boolean = True);
    procedure fraSC_CANALOnChange(Sender: TObject);
    procedure fraSU_IDCENTROREGOnChange(Sender: TObject);
    procedure fraSC_IDENTIDADOnChange(Sender: TObject);
  end;

var
  frmCentroComercializacion: TfrmCentroComercializacion;

implementation

uses
  AnsiSql, unDmPrincipal, unART, unSesion, CustomDlgs, unCotizacion, unEspera;

{$R *.DFM}

procedure TfrmCentroComercializacion.fraSC_IDENTIDADcmbDescripcionDropDown(Sender: TObject);
begin
  fraSC_IDENTIDAD.Canal := ART_EMPTY_ID;
  if fraSC_CANAL.IsSelected and (fraSC_IDENTIDAD.Canal <> fraSC_CANAL.Value) then
    fraSC_IDENTIDAD.Canal := fraSC_CANAL.Value;
  fraSC_IDENTIDAD.cmbDescripcionDropDown(Sender);
end;

procedure TfrmCentroComercializacion.fraSC_IDSUCURSALcmbDescripcionDropDown(Sender: TObject);
begin
  fraSC_IDSUCURSAL.Entidad := ART_EMPTY_ID;
  fraSC_IDSUCURSAL.CentroReg := ART_EMPTY_ID;
  if fraSC_IDENTIDAD.IsSelected and (fraSC_IDENTIDAD.Value <> fraSC_IDSUCURSAL.Entidad) then
  begin
    fraSC_IDSUCURSAL.Clear;
    fraSC_IDSUCURSAL.Entidad := fraSC_IDENTIDAD.Value;
  end;
  if fraSU_IDCENTROREG.IsSelected and (fraSU_IDCENTROREG.Value <> fraSC_IDSUCURSAL.CentroReg) then
  begin
    fraSC_IDSUCURSAL.Clear;
    fraSC_IDSUCURSAL.CentroReg := fraSU_IDCENTROREG.Value;
  end;
  fraSC_IDSUCURSAL.cmbDescripcionDropDown(Sender);
end;

procedure TfrmCentroComercializacion.FormCreate(Sender: TObject);
begin
  inherited;

  pcPaginas.ActivePage := tsACO_COTIZACION;
  fraSC_CANAL.FiltraUsuario := False;
  fraSC_CANAL.OnChange := fraSC_CANALOnChange;
  fraSC_IDENTIDAD.OnChange := fraSC_IDENTIDADOnChange;
  fraSU_IDCENTROREG.OnChange := fraSU_IDCENTROREGOnChange;

  FConsultas[0] := sdqACO_COTIZACION;
  FConsultas[1] := sdqASA_SOLICITUDAFILIACION;
  FConsultas[2] := sdqACO_CONTRATO;
  FConsultas[3] := sdqCPR_PRESTADORES;
  FConsultas[4] := sdqCSE_SEGUIMIENTOEVENTO;

  FSqls[0] := sdqACO_COTIZACION.SQL.Text;
  FSqls[1] := sdqASA_SOLICITUDAFILIACION.SQL.Text;
  FSqls[2] := sdqACO_CONTRATO.SQL.Text;
  FSqls[3] := sdqCPR_PRESTADORES.SQL.Text;
  FSqls[4] := sdqCSE_SEGUIMIENTOEVENTO.SQL.Text;
end;

procedure TfrmCentroComercializacion.fraSC_CANALOnChange(Sender: TObject);
begin
  if fraSC_CANAL.IsSelected and (fraSC_CANAL.Value <> fraSC_IDENTIDAD.Canal) then
    fraSC_IDENTIDAD.Canal := fraSC_CANAL.Value;
  Actualizar(False);
end;

procedure TfrmCentroComercializacion.fraSC_IDENTIDADOnChange(Sender: TObject);
begin
  if fraSC_IDENTIDAD.IsSelected and (fraSC_IDSUCURSAL.Entidad <> fraSC_IDENTIDAD.Value) then
    fraSC_IDSUCURSAL.Entidad := fraSC_IDENTIDAD.Value;

  fraSC_CANAL.Value := fraSC_IDENTIDAD.Canal;
  Actualizar(False);
end;

procedure TfrmCentroComercializacion.fraSU_IDCENTROREGOnChange(Sender: TObject);
begin
  if fraSU_IDCENTROREG.IsSelected and (fraSU_IDCENTROREG.Value <> fraSC_IDSUCURSAL.Value) then
    fraSC_IDSUCURSAL.CentroReg := fraSU_IDCENTROREG.Value;
  Actualizar(False);
end;

procedure TfrmCentroComercializacion.Actualizar(bPaginas: Boolean = True);
  procedure Preparar(sdqConsulta: TSDQuery);
  var
    nPos: Byte;
  begin
    if Assigned(sdqConsulta) then
    begin
      if bPaginas and (sdqConsulta <> sdqXVE_VENDEDOR) then
      begin
        for nPos := Low(FConsultas) to High(FConsultas) do
          if FConsultas[nPos] = sdqConsulta then
            Break;
        sdqConsulta.SQL.Text := FSqls[nPos] + TSortDialog(FindComponent('SortDialog' + Copy(sdqConsulta.Name, 4, MAXINT))).OrderBy;
        sdqConsulta.Prepare;
      end;

      for nPos := 0 to sdqConsulta.ParamCount - 1 do
        if LowerCase(sdqConsulta.Params[nPos].Name) = 'canal' then
          if fraSC_CANAL.IsSelected then
            sdqConsulta.Params[nPos].AsString := fraSC_CANAL.AsString
          else
            sdqConsulta.Params[nPos].Value := null
        else if LowerCase(sdqConsulta.Params[nPos].Name) = 'entidad' then
          if fraSC_IDENTIDAD.IsSelected then
            sdqConsulta.Params[nPos].AsInteger := fraSC_IDENTIDAD.Value
          else
            sdqConsulta.Params[nPos].Value := null
        else if LowerCase(sdqConsulta.Params[nPos].Name) = 'sucursal' then
          if fraSC_IDSUCURSAL.IsSelected then
            sdqConsulta.Params[nPos].AsInteger := fraSC_IDSUCURSAL.Value
          else
            sdqConsulta.Params[nPos].Value := null
        else if LowerCase(sdqConsulta.Params[nPos].Name) = 'usuario' then
          sdqConsulta.Params[nPos].AsString := Sesion.UserID
        else if LowerCase(sdqConsulta.Params[nPos].Name) = 'vendedor' then
          if sdqXVE_VENDEDOR.Active then
            sdqConsulta.Params[nPos].Value := sdqXVE_VENDEDOR.FieldByName('ve_id').Value
          else
            sdqConsulta.Params[nPos].Value := null;

      OpenQuery(sdqConsulta);
      lbCantidad.Caption := IntToStr(sdqConsulta.RecordCount);
    end;

    for nPos := Low(FConsultas) to High(FConsultas) do
      if FConsultas[nPos] <> sdqConsulta then
        FConsultas[nPos].Close;
  end;

begin
//  IniciarEspera;
  Preparar(nil);

  if not(fraSC_CANAL.IsSelected and fraSC_IDENTIDAD.IsSelected) then
    Abort;

  inherited;

  with sdqXVE_VENDEDOR do
    if chkVerVendedores.Checked then
    begin
      if (ParamByName('canal').AsString <> fraSC_CANAL.AsString) or
         (ParamByName('entidad').AsInteger <> fraSC_IDENTIDAD.Value) or
         (ParamByName('sucursal').AsInteger <> fraSC_IDSUCURSAL.Value) or
         (not sdqXVE_VENDEDOR.Active)
      then
      begin
        Preparar(sdqXVE_VENDEDOR);
        if sdqXVE_VENDEDOR.RecordCount > 100 then
          InfoHint(dbgXVE_VENDEDOR, 'Hay ' + IntToStr(sdqXVE_VENDEDOR.RecordCount) + ' vendedores con el filtro especificado y recorrerlos puede demorar. Se sugiere especificar la sucursal en caso de que corresponda.');
      end;
    end;

  if not bPaginas then
    Abort;

  case pcPaginas.ActivePageIndex of
    0:
      with sdqACO_COTIZACION do
        if (ParamByName('canal').AsString <> fraSC_CANAL.AsString) or
           (ParamByName('entidad').AsInteger <> fraSC_IDENTIDAD.Value) or
           (ParamByName('sucursal').AsInteger <> fraSC_IDSUCURSAL.Value) or
           (ParamByName('usuario').AsString <> Sesion.UserID) or
           ((sdqXVE_VENDEDOR.Active) and (ParamByName('vendedor').Value <> sdqXVE_VENDEDOR.FieldByName('ve_id').Value)) or
            not Active then
        begin
          Preparar(sdqACO_COTIZACION);
        end;
    1:
      with sdqASA_SOLICITUDAFILIACION do
        if (ParamByName('canal').AsInteger <> fraSC_CANAL.Value) or
           (ParamByName('entidad').AsInteger <> fraSC_IDENTIDAD.Value) or
           ((sdqXVE_VENDEDOR.Active) and (ParamByName('vendedor').Value <> sdqXVE_VENDEDOR.FieldByName('ve_id').Value)) or
           not Active then
        begin
          Preparar(sdqASA_SOLICITUDAFILIACION);
        end;
    2:
      with sdqACO_CONTRATO do
        if (ParamByName('canal').AsString <> fraSC_CANAL.AsString) or
           (ParamByName('entidad').AsInteger <> fraSC_IDENTIDAD.Value) or
           ((sdqXVE_VENDEDOR.Active) and (ParamByName('vendedor').Value <> sdqXVE_VENDEDOR.FieldByName('ve_id').Value)) or
           not Active then
        begin
          Preparar(sdqACO_CONTRATO);
        end;
    3:
      with sdqCPR_PRESTADORES do
        if (ParamByName('canal').AsString <> fraSC_CANAL.AsString) or
           (ParamByName('entidad').AsInteger <> fraSC_IDENTIDAD.Value) or
           not Active then
        begin
          Preparar(sdqCPR_PRESTADORES);
        end;
    4:
      with sdqCSE_SEGUIMIENTOEVENTO do
        if (ParamByName('entidad').AsInteger <> fraSC_IDENTIDAD.Value) or not Active then
        begin
          Preparar(sdqCSE_SEGUIMIENTOEVENTO);
        end;
  end;
//  DetenerEspera;
end;

procedure TfrmCentroComercializacion.acMnuOrdenar(Sender: TObject);
begin
  tbOrdenar.Click;
end;

procedure TfrmCentroComercializacion.edBusquedaChange(Sender: TObject);
begin
  if rbNombre.Checked then
    sdqXVE_VENDEDOR.Locate('ve_nombre', edBusqueda.Text, [loPartialKey, loCaseInsensitive])
  else
    sdqXVE_VENDEDOR.Locate('ve_vendedor', edBusqueda.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmCentroComercializacion.pcPaginasChange(Sender: TObject);
begin
  Actualizar(True);
end;

procedure TfrmCentroComercializacion.dbgXVE_VENDEDORGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  with Field.DataSet do
  begin
    if FieldByName('ev_fechabaja').IsNull and FieldByName('ve_fechabaja').IsNull then
      AFont.Color := clBlack
    else if FieldByName('ev_fechabaja').IsNull then
      AFont.Color := clPurple
    else if FieldByName('ve_fechabaja').IsNull then
      AFont.Color := clRed;
  end;
end;

procedure TfrmCentroComercializacion.pnl2CanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  dbgXVE_VENDEDOR.Columns[1].Width := dbgXVE_VENDEDOR.Columns[1].Width + NewWidth - (Sender as TPanel).Width;
end;

procedure TfrmCentroComercializacion.ACO_COTIZACIONGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  Estado: String;
begin
  if HighLight then
    AFont.Color := clWhite
  else
  begin
    Estado := Field.DataSet.FieldByName('co_estado').AsString;

    if (Estado = EC_PEND_COTIZ) or (Estado = EC_ASIGNADA)  then
      AFont.Color := clGray;
    if (Estado = EC_CERRADA_MAL) then
      AFont.Color := clGreen;
    if (Estado = EC_CANCELADA) then
      AFont.Color := clRed;
  end;
end;

procedure TfrmCentroComercializacion.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCentroComercializacion.tbRefrescarClick(Sender: TObject);
begin
  Actualizar(True);
end;

procedure TfrmCentroComercializacion.tbLimpiarClick(Sender: TObject);
begin
  fraSC_CANAL.Clear;
  fraSC_IDENTIDAD.Clear;
  fraSC_IDSUCURSAL.Clear;
  fraSU_IDCENTROREG.Clear;
  lbCantidad.Caption := '-';
  sdqXVE_VENDEDOR.Close;
  Actualizar;
end;

procedure TfrmCentroComercializacion.tbOcultarVendedoresClick(Sender: TObject);
begin
  pnlIzquierda.Visible := not pnlIzquierda.Visible;
  if pnlIzquierda.Visible then
  begin
    tbOcultarVendedores.Hint := 'Ocultar vendedores';
    tbOcultarVendedores.ImageIndex := 27;
  end
  else
  begin
    tbOcultarVendedores.Hint := 'Mostrar vendedores';
    tbOcultarVendedores.ImageIndex := 28;
  end;
end;

procedure TfrmCentroComercializacion.tbOrdenarClick(Sender: TObject);
begin
  case pcPaginas.ActivePageIndex of
    0:  begin
          LoadDynamicSortFields(SortDialogACO_COTIZACION.SortFields, ACO_COTIZACION.Columns);
          SortDialogACO_COTIZACION.Execute;
        end;
    1:  begin
          LoadDynamicSortFields(SortDialogASA_SOLICITUDAFILIACION.SortFields, ASA_SOLICITUDAFILIACION.Columns);
          SortDialogASA_SOLICITUDAFILIACION.Execute;
        end;
    2:  begin
          LoadDynamicSortFields(SortDialogACO_CONTRATO.SortFields, ACO_CONTRATO.Columns);
          SortDialogACO_CONTRATO.Execute;
        end;
    3:  begin
          LoadDynamicSortFields(SortDialogCPR_PRESTADORES.SortFields, CPR_PRESTADORES.Columns);
          SortDialogCPR_PRESTADORES.Execute;
        end;
    4:  begin
          LoadDynamicSortFields(SortDialogCSE_SEGUIMIENTOEVENTO.SortFields, CSE_SEGUIMIENTOEVENTO.Columns);
          SortDialogCSE_SEGUIMIENTOEVENTO.Execute;
        end;
  end;
end;

procedure TfrmCentroComercializacion.chkVerVendedoresClick(Sender: TObject);
begin
  if not chkVerVendedores.Checked then
    sdqXVE_VENDEDOR.Close
  else
    Actualizar(False);
end;

end.
