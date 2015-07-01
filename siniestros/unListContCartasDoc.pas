unit unListContCartasDoc;     // creacion por TK 2233. Lu 05/02/2009

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  StdCtrls, Mask, ToolEdit, DateComboBox, SinEdit, Buttons, FormPanel,
  CheckPanel, unArtDbFrame, unFraTrabajador, Menus;

type
  TAccion = (Alta, Modif);
  TfrmListContCartasDoc = class(TfrmCustomConsulta)
    fpAbm: TFormPanel;
    btnCerrar: TBitBtn;
    btnGuardar: TBitBtn;
    edSiniestroAbm: TSinEdit;
    Label1: TLabel;
    gbIngreso: TGroupBox;
    Label2: TLabel;
    dcIngresoAbm: TDateComboBox;
    memoIngreso: TMemo;
    Label4: TLabel;
    gbEgreso: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    dcEgresoAbm: TDateComboBox;
    memoEgreso: TMemo;
    fraAreaAbm: TfraCodigoDescripcion;
    Label3: TLabel;
    memoObservaciones: TMemo;
    Label6: TLabel;
    chkSiniestro: TCheckPanel;
    edSiniestro: TSinEdit;
    chkFIngreso: TCheckPanel;
    dcIngresoDesde: TDateComboBox;
    chkFEgreso: TCheckPanel;
    dcEgresoDesde: TDateComboBox;
    chkArea: TCheckPanel;
    fraArea: TfraCodigoDescripcion;
    dcIngresoHasta: TDateComboBox;
    Label8: TLabel;
    dcEgresoHasta: TDateComboBox;
    Label9: TLabel;
    edEstado: TEdit;
    fraTrabajador: TfraTrabajador;
    Label10: TLabel;
    chkEstado: TCheckPanel;
    cmbEstado: TComboBox;
    tbViajar: TToolButton;
    ToolButton2: TToolButton;
    mnuViajar: TPopupMenu;
    mnuSeguimientoIncapacidades: TMenuItem;
    tbSalir2: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure QueryPrintReportBegin(Sender: TObject);
    procedure edSiniestroAbmSelect(Sender: TObject);
    procedure chkEstadoChange(Sender: TObject);
    procedure chkSiniestroChange(Sender: TObject);
    procedure chkFIngresoChange(Sender: TObject);
    procedure chkFEgresoChange(Sender: TObject);
    procedure chkAreaChange(Sender: TObject);
    procedure mnuSeguimientoIncapacidadesClick(Sender: TObject);
  private
    { Private declarations }
    Accion :TAccion;
    function ValidarDatos: boolean;
    procedure DoLimpiarAbm;
    procedure DoAsignaDatosAbm;
    function HayRegistroActivo :Boolean;
    procedure DoHabilitarDatosModif;
    procedure DoHabilitarDatosAlta;
    procedure DoDeshabilitarDatosModif;
    procedure DoBuscarTrabajador;
  public
    { Public declarations }
  end;

var
  frmListContCartasDoc: TfrmListContCartasDoc;
  iIdExped: Integer;
implementation

uses CustomDlgs, AnsiSql, unComunes, General, unCustomDataModule, VCLExtra, unDmPrincipal, unSesion,
  unSegIncapacidades, unPrincipal;

{$R *.dfm}

procedure TfrmListContCartasDoc.tbRefrescarClick(Sender: TObject);
var sSql: String;
begin
  sSql := ' SELECT CI_ID, CI_IDEXPEDIENTE, EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, EL_NOMBRE DELEGACION, ' +
                 ' CI_FECINGRESO, CI_DESCCARTAINGRESO, TB_DESCRIPCION AREA, CI_AREA,' +
                 ' CI_FECEGRESO, CI_DESCCARTAEGRESO, CI_OBSERVACIONES, ' +
                 ' DECODE(CI_ESTADO, ''P'', ''Pendiente'', ''Enviado'') ESTADO, CI_ESTADO ' +
            ' FROM ART.SEX_EXPEDIENTES, SIN.SCI_INCACARTASDOC, ART.DEL_DELEGACION, ART.CTB_TABLAS ' +
           ' WHERE CI_IDEXPEDIENTE = EX_ID ' +
             ' AND EX_DELEGACION = EL_ID ' +
             ' AND TB_CLAVE = ''AREA'' ' +
             ' AND CI_AREA = TB_CODIGO' ;

  if chkSiniestro.Checked then
    sSql := sSql + ' AND EX_SINIESTRO = ' + edSiniestro.SiniestroSql +
                   ' AND EX_ORDEN = ' + edSiniestro.OrdenSql +
                   ' AND EX_RECAIDA = ' + edSiniestro.RecaidaSql;
  if chkFIngreso.Checked then
    sSql := sSql + ' AND CI_FECINGRESO between ' + SqlDate(dcIngresoDesde.Date) +
                                         ' and ' + SqlDate(dcIngresoHasta.Date);
  if chkFEgreso.Checked then
    sSql := sSql + ' AND CI_FECEGRESO between ' + SqlDate(dcEgresoDesde.Date) +
                                        ' and ' + SqlDate(dcEgresoHasta.Date);
  if chkArea.Checked then
    sSql := sSql + ' AND CI_AREA = ' + SqlString(fraArea.Codigo, true);

  if chkEstado.Checked and (cmbEstado.ItemIndex > 0) then
    sSql := sSql + ' AND CI_ESTADO = ' + SqlString(IIF(cmbEstado.ItemIndex = 1, 'P', 'E'), true);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmListContCartasDoc.tbNuevoClick(Sender: TObject);
var sSql: string;
    iCi_id: integer;
begin
  fpAbm.Caption := 'Alta de Carta Documento';
  Accion := Alta;
  DoLimpiarAbm;
  DoHabilitarDatosAlta;
  edEstado.Text := '';

  if (fpAbm.ShowModal = MrOk) then
  begin
    BeginTrans;
    Try
      iCi_id := ValorSql('SELECT NVL(MAX(CI_ID)+1, 1) ID FROM SIN.SCI_INCACARTASDOC '); // El NVL es para la insercion del PRIMER REGISTRO solamente... se podria sacar... Lu 06/02/2009

      sSql := 'INSERT INTO SIN.SCI_INCACARTASDOC ' +
              ' (CI_IDEXPEDIENTE, CI_FECINGRESO, ' +
               ' CI_DESCCARTAINGRESO, CI_OBSERVACIONES, CI_USUALTA, CI_FECHAALTA, ' +
               ' CI_ID, CI_AREA ) ' +
              ' VALUES ' +
              ' ( ' + SqlInt(iIdExped) + ',' +
                      SqlDate(dcIngresoAbm.Date) + ',' + SqlString(Trim(memoIngreso.Lines.Text),true) + ',' +
                      SqlString(Trim(memoObservaciones.Lines.Text),true) + ',' + SqlString(Sesion.UserID, true) + ',' +
                      ' Art.Actualdate, ' + SqlInt(iCi_id) + ',' + SqlString(fraAreaAbm.edCodigo.Text, true) + ')';
      EjecutarSqlST(sSql);
      CommitTrans;
      tbRefrescarClick(Nil);
    except on E: Exception do
      begin
        Rollback;
        MsgBox('Ocurrió un error al intentar guardar los datos.' +#13 + E.Message);
      end;
    end;
  end;
end;

procedure TfrmListContCartasDoc.tbModificarClick(Sender: TObject);
var sSql: string;
begin
  if HayRegistroActivo then
  begin
    Accion := Modif;
    DoLimpiarAbm;
    DoAsignaDatosAbm;
    if (sdqConsulta.FieldByName('CI_ESTADO').AsString = 'P') then
    begin
      DoHabilitarDatosModif;
      fpAbm.Caption := 'Modificación de Carta Documento';
    end
    else begin
      DoDeshabilitarDatosModif;
      fpAbm.Caption := 'Visualización de Carta Documento';
    end;

    if (fpAbm.ShowModal = MrOk) then
    begin
      BeginTrans;
      Try
        sSql := 'UPDATE SIN.SCI_INCACARTASDOC ' +
                  ' SET CI_FECEGRESO = ' + SqlDate(dcEgresoAbm.Date) + ', ' +
                      ' CI_DESCCARTAEGRESO = ' + SqlString(Trim(memoEgreso.Lines.Text),true) + ', ' +
                      ' CI_OBSERVACIONES = ' + SqlString(Trim(memoObservaciones.Lines.Text),true) + ', ' +
                      ' CI_ESTADO = ''E'', ' +
                      ' CI_FECHAMODIF = art.actualdate, ' +
                      ' CI_USUMODIF = ' + SqlString(Sesion.UserID, true) +
                ' WHERE CI_ID = ' + SqlInt(sdqConsulta.FieldByName('CI_ID').AsInteger);
        EjecutarSqlST(sSql);
        CommitTrans;
        tbRefrescarClick(Nil);
      except on E: Exception do
        begin
          Rollback;
          MsgBox('Ocurrió un error al intentar guardar los datos.' +#13 + E.Message);
        end;
      end;
    end;
  end;
  inherited;
end;

procedure TfrmListContCartasDoc.FormCreate(Sender: TObject);
begin
  inherited;
  with fraArea do
  begin
    TableName      := 'CTB_TABLAS';
    FieldID        := 'TB_ID';
    FieldCodigo    := 'TB_CODIGO';
    FieldDesc      := 'TB_DESCRIPCION';
    FieldBaja      := 'TB_FECHABAJA';
    ExtraCondition := 'AND TB_CLAVE = ''AREA'' AND TB_CODIGO <> ''0'' ';
    OrderBy        := 'TB_CODIGO';
    ShowBajas      := True;
  end;

  with fraAreaAbm do
  begin
    TableName      := 'CTB_TABLAS';
    FieldID        := 'TB_ID';
    FieldCodigo    := 'TB_CODIGO';
    FieldDesc      := 'TB_DESCRIPCION';
    FieldBaja      := 'TB_FECHABAJA';
    ExtraCondition := 'AND TB_CLAVE = ''AREA'' AND TB_CODIGO <> ''0'' ';
    OrderBy        := 'TB_CODIGO';
    ShowBajas      := True;
  end;
  iIdExped := 0;
  LockControls([fraTrabajador], true);
end;

procedure TfrmListContCartasDoc.btnGuardarClick(Sender: TObject);
begin
  if ValidarDatos then fpAbm.ModalResult := mrOk;
end;

function TfrmListContCartasDoc.ValidarDatos: boolean;
begin
  Verificar(edSiniestroAbm.IsEmpty, edSiniestroAbm, 'El Siniestro no puede ser nulo.');
  // Esto valida que exista el siniestro que se esta por insertar en la tabla.
  iIdExped := Get_IdExpediente(edSiniestroAbm.Siniestro, edSiniestroAbm.Orden, edSiniestroAbm.Recaida);
  Verificar(iIdExped = 0, edSiniestroAbm, 'El Siniestro esta incompleto o es inválido.');
  Verificar(fraAreaAbm.IsEmpty, fraAreaAbm, 'El Área no puede ser nula.');
  Verificar(dcIngresoAbm.IsEmpty, dcIngresoAbm, 'La fecha de Ingreso de la Carta no puede ser nula.');
  Verificar(Trim(memoIngreso.Lines.Text) = '', memoIngreso, 'La Descripción de la Carta de Ingreso no puede ser nula.');

  if Accion = Modif then
  begin
    Verificar(dcEgresoAbm.IsEmpty, dcEgresoAbm, 'La fecha de Egreso de la Carta no puede ser nula');
    Verificar(Trim(memoEgreso.Lines.Text) = '', memoEgreso, 'La Descripción de la Carta de Egreso no puede ser nula.');
  end;

  Result := True;
end;

procedure TfrmListContCartasDoc.tbLimpiarClick(Sender: TObject);
begin
  chkSiniestro.Checked := False;
  chkFIngreso.Checked  := False;
  chkFEgreso.Checked   := False;
  chkArea.Checked      := False;
  edSiniestro.Clear;
  dcIngresoDesde.Clear;
  dcIngresoHasta.Clear;
  dcEgresoDesde.Clear;
  dcEgresoHasta.Clear;
  fraArea.Clear;
  sdqConsulta.Close;
  inherited;
end;

procedure TfrmListContCartasDoc.DoLimpiarAbm;
begin
  edSiniestroAbm.Clear;
  fraAreaAbm.Clear;
  dcIngresoAbm.Clear;
  memoIngreso.Clear;
  dcEgresoAbm.Clear;
  memoEgreso.Clear;
  memoObservaciones.Clear;
  fraTrabajador.Clear;
end;

procedure TfrmListContCartasDoc.DoAsignaDatosAbm;
begin
  edSiniestroAbm.SetValues(sdqConsulta.FieldByName('EX_SINIESTRO').AsInteger,
                           sdqConsulta.FieldByName('EX_ORDEN').AsInteger,
                           sdqConsulta.FieldByName('EX_RECAIDA').AsInteger);
  fraAreaAbm.Codigo            := sdqConsulta.FieldByName('CI_AREA').AsString;
  dcIngresoAbm.Date            := sdqConsulta.FieldByName('CI_FECINGRESO').AsDateTime;
  memoIngreso.Lines.Text       := sdqConsulta.FieldByName('CI_DESCCARTAINGRESO').AsString;
  dcEgresoAbm.Date             := sdqConsulta.FieldByName('CI_FECEGRESO').AsDateTime;
  memoEgreso.Lines.Text        := sdqConsulta.FieldByName('CI_DESCCARTAEGRESO').AsString;
  memoObservaciones.Lines.Text := sdqConsulta.FieldByName('CI_OBSERVACIONES').AsString;
  edEstado.Text                := sdqConsulta.FieldByName('ESTADO').AsString;
  DoBuscarTrabajador;
  if edEstado.Text = 'Pendiente' then
    edEstado.Font.Color := clGreen
  else
    edEstado.Font.Color := clMaroon;
end;

function TfrmListContCartasDoc.HayRegistroActivo: Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty);
end;

procedure TfrmListContCartasDoc.DoHabilitarDatosModif;
begin
  LockControls([gbEgreso, dcEgresoAbm, memoEgreso, btnGuardar, memoObservaciones],False);
  LockControls([edSiniestroAbm, fraAreaAbm, gbIngreso, dcIngresoAbm, memoIngreso], True);
end;

procedure TfrmListContCartasDoc.DoHabilitarDatosAlta;
begin
  LockControls([dcEgresoAbm, memoEgreso, gbEgreso], true);
  LockControls([edSiniestroAbm, fraAreaAbm, gbIngreso, dcIngresoAbm, memoIngreso, btnGuardar, memoObservaciones], False);
end;

procedure TfrmListContCartasDoc.DoDeshabilitarDatosModif;
begin
  LockControls([gbEgreso, dcEgresoAbm, memoEgreso],True);
  LockControls([edSiniestroAbm, fraAreaAbm, gbIngreso, dcIngresoAbm, memoIngreso, memoObservaciones, btnGuardar], True);
end;

procedure TfrmListContCartasDoc.QueryPrintReportBegin(Sender: TObject);
begin
  QueryPrint.SubTitle.Lines.Clear;
  if chkSiniestro.Checked then
    QueryPrint.SubTitle.Lines.Add('Siniestro: ' + edSiniestro.SinOrdRec);
  if chkFIngreso.Checked then
    QueryPrint.SubTitle.Lines.Add('F.Ingreso: ' + dcIngresoDesde.Text + ' al ' + dcIngresoHasta.Text);
  if chkFEgreso.Checked then
    QueryPrint.SubTitle.Lines.Add('F.Egreso: ' + dcEgresoDesde.Text + ' al ' + dcEgresoHasta.Text);
  if chkArea.Checked then
    QueryPrint.SubTitle.Lines.Add('Área: ' + fraArea.Descripcion);
  if chkEstado.Checked then
    QueryPrint.SubTitle.Lines.Add('Estado: ' + cmbEstado.Text);
  QueryPrint.SubTitle.Lines.Add('');
end;

procedure TfrmListContCartasDoc.DoBuscarTrabajador;
var sSql, sCuil: String;
begin
  sSql := 'SELECT EX_CUIL ' +
           ' FROM ART.SEX_EXPEDIENTES ' +
          ' WHERE EX_SINIESTRO = ' + edSiniestroAbm.SiniestroSql +
            ' AND EX_ORDEN = ' + edSiniestroAbm.OrdenSql +
           ' AND EX_RECAIDA = ' + edSiniestroAbm.RecaidaSql;
  sCuil := ValorSql(sSql);
  Verificar(sCuil = '', edSiniestroAbm, 'No existe Cuil del trabajador o el Siniestro es inválido');
  fraTrabajador.CUIL := sCuil;
end;

procedure TfrmListContCartasDoc.edSiniestroAbmSelect(Sender: TObject);
begin
  inherited;
  if not edSiniestroAbm.IsEmpty then
    DoBuscarTrabajador;
end;

procedure TfrmListContCartasDoc.chkEstadoChange(Sender: TObject);
begin
  if not chkEstado.Checked then
    cmbEstado.ItemIndex := -1;
end;

procedure TfrmListContCartasDoc.chkSiniestroChange(Sender: TObject);
begin
  if not chkSiniestro.Checked then
    edSiniestro.Clear;
end;

procedure TfrmListContCartasDoc.chkFIngresoChange(Sender: TObject);
begin
  if not chkFIngreso.Checked then
  begin
    dcIngresoDesde.Clear;
    dcIngresoHasta.Clear;
  end;
end;

procedure TfrmListContCartasDoc.chkFEgresoChange(Sender: TObject);
begin
  if not chkFEgreso.Checked then
  begin
    dcEgresoDesde.Clear;
    dcEgresoHasta.Clear;
  end;
end;

procedure TfrmListContCartasDoc.chkAreaChange(Sender: TObject);
begin
  if not chkArea.Checked then
    fraArea.Clear;
end;

procedure TfrmListContCartasDoc.mnuSeguimientoIncapacidadesClick(Sender: TObject);    // TK 7725
var
  frmSegIncapacidades: TfrmSegIncapacidades;
begin
  if not edSiniestro.IsEmpty then
    with frmSegIncapacidades do
    begin
      frmSegIncapacidades := TfrmSegIncapacidades.Create(frmPrincipal);
      MenuItem            := frmPrincipal.mnuSegIncapacidades;
      edSiniestro.SetValues(Self.edSiniestro.Siniestro,
                            Self.edSiniestro.Orden,
                            Self.edSiniestro.Recaida);
      tbRefrescarClick(Nil);
      Show;
      Self.Close;
    end;
end;

end.
