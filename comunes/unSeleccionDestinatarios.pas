unit unSeleccionDestinatarios;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   19-12-2003
 ULTIMA MODIFICACION: 19-12-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls,
  RxPlacemnt;

type

  TTipoDestinario = (tdContactoContrato, tdVendedor);

  TfrmSeleccionDestinatarios = class(TfrmCustomConsulta)
    btnAceptar: TButton;
    btnCancelar: TButton;
    btnActualizar: TButton;
    lbEmpresa: TLabel;
    edOtrasDirecciones: TEdit;
    lbOtrasDirecciones: TLabel;
    lbExplicacion: TLabel;
    Label1: TLabel;
    TimerConsulta: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure FSFormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FSFormActivate(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure TimerConsultaTimer(Sender: TObject);
  private
    FAllowOther: Boolean;
    FCantMaxDestinatarios: Integer;
    FContrato: Integer;
    FIdEmpresa: Integer;
    FTipoDestinatario: TTipoDestinario;

    function GetListaDestinatarios: String;

    procedure SetAllowOther(const Value: Boolean);
    procedure SetContrato(const Value: Integer);
    procedure SetTipoDestinatario(const Value: TTipoDestinario);
  public
    property AllowOtherDirections: boolean     read FAllowOther               write SetAllowOther;
    property CantMaxDestinatarios: Integer     read FCantMaxDestinatarios     write FCantMaxDestinatarios;
    property Contrato: Integer                 read FContrato                 write SetContrato;
    property IdEmpresa: Integer                read FIdEmpresa                write FIdEmpresa;
    property ListaDestinatarios: string        read GetListaDestinatarios;
    property TipoDestinatario: TTipoDestinario read FTipoDestinatario         write SetTipoDestinatario     default tdContactoContrato;
  end;


implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, Internet, {$IFNDEF MAIL_A_CONTRATO}unContratoContacto,{$ENDIF}unART;

{$R *.DFM}

{ TfrmSeleccionDestinatarios }

function TfrmSeleccionDestinatarios.GetListaDestinatarios: String;
var
  iLoop: Integer;
  tslResultado: TStringList;
  tslOtros: TStringList;
begin
  tslResultado := TStringList.Create;
  try
    for iLoop := 0 to Grid.SelectedRows.Count - 1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(pointer(Grid.SelectedRows.Items[0]));
      tslResultado.Add(sdqConsulta.FieldByName('direlectronica').AsString);
      Grid.ToggleRowSelection;
    end;

    if FAllowOther then
    begin
      tslOtros := TStringList.Create;
      try
        tslOtros.Duplicates := dupIgnore;
        tslOtros.CommaText  := StringReplace(edOtrasDirecciones.Text, ';', ',', [rfReplaceAll]);
        tslOtros.Text       := StringReplace(tslOtros.Text, ' ', '', [rfReplaceAll]);
        tslResultado.AddStrings(tslOtros);
      finally
        tslOtros.Free;
      end;
    end;

    while (CantMaxDestinatarios > 0) and (tslResultado.Count > CantMaxDestinatarios) do
      tslResultado.Delete(tslResultado.Count - 1);

    Result := tslResultado.CommaText;
  finally
    tslResultado.Free;
  end;
end;

procedure TfrmSeleccionDestinatarios.SetContrato(const Value: Integer);
begin
  FContrato := Value;

  if Value = ART_EMPTY_ID then
  begin
    AllowOtherDirections := True;

    lbEmpresa.Caption := '';
    lbEmpresa.Left    := 1024;

    tbPropiedades.Enabled := False;
    btnActualizar.Enabled := False;
  end
  else
  begin
    sdqConsulta.Close;
    sdqConsulta.ParamByName('contrato').AsInteger := FContrato;
    TimerConsulta.Enabled := True;
  end;
end;

procedure TfrmSeleccionDestinatarios.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFNDEF RED_PRES}
  Toolbar.HotImages := frmPrincipal.ilColor;
  Toolbar.Images    := frmPrincipal.ilByN;
  {$ELSE}
  tbPropiedades.Enabled := False;
  {$ENDIF}

  AutoColWidths        := True;
  CantMaxDestinatarios := 0;
  FAllowOther          := False;
  TipoDestinatario     := tdContactoContrato;
end;

procedure TfrmSeleccionDestinatarios.btnActualizarClick(Sender: TObject);
begin
  inherited;
  tbRefrescar.Click;
end;

procedure TfrmSeleccionDestinatarios.FSFormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOK) then
  begin
    if (CantMaxDestinatarios > 0) and (Grid.SelectedRows.Count > CantMaxDestinatarios) then
    begin
      InvalidMsg(btnAceptar, Format('La cantidad máxima de destinatarios que puede seleccionar es %d.', [CantMaxDestinatarios]));
      CanClose := False;
    end;

    if (FAllowOther) and (edOtrasDirecciones.Text > '') and (not IsEMails(edOtrasDirecciones.Text)) then
    begin
      InvalidMsg(edOtrasDirecciones, 'Las direcciones de e-mail ingresadas no son válidas.');
      CanClose := False;
    end;

    if  (Grid.SelectedRows.Count = 0) and ((not sdqConsulta.IsEmpty and not FAllowOther)
     or (sdqConsulta.IsEmpty and FAllowOther and (Trim(edOtrasDirecciones.Text) = ''))) then
    begin
      InvalidMsg(btnAceptar, 'Debe seleccionar al menos un destinatario.');
      CanClose := False;
    end;
  end;
end;

procedure TfrmSeleccionDestinatarios.SetAllowOther(const Value: Boolean);
begin
  FAllowOther                := Value;
  lbOtrasDirecciones.Visible := Value;
  edOtrasDirecciones.Visible := Value;
  lbExplicacion.Visible      := Value;
end;

procedure TfrmSeleccionDestinatarios.sdqConsultaAfterOpen(DataSet: TDataSet);
var
  sSql: String;
  sTipoDest: String;
begin
  inherited;

  case FTipoDestinatario of
    tdContactoContrato:
      sTipoDest := 'Contactos';
    tdVendedor:
      sTipoDest := 'Vendedores';
  end;

  lbEmpresa.Caption := sTipoDest + ' de la empresa ' + sdqConsulta.FieldByName('em_nombre').AsString +
                       ' (Contrato Nº ' + IntToStr(FContrato) + ')';
  lbEmpresa.Left := 1024;
  if not sdqConsulta.IsEmpty then
    IdEmpresa := sdqConsulta.FieldByName('em_id').AsInteger
  else
  begin
    sSql :=
      'SELECT em_id' +
       ' FROM aem_empresa, aco_contrato' +
      ' WHERE em_id = co_idempresa' +
        ' AND co_contrato = :contrato';
    IdEmpresa := ValorSqlIntegerEx(sSql, [FContrato]);
  end;

  if DataSet.IsEmpty and FAllowOther then
    AllowOtherDirections := True;
end;

procedure TfrmSeleccionDestinatarios.FSFormActivate(Sender: TObject);
begin
  inherited;
  if not FAllowOther then
    Grid.Height := Grid.Height + lbExplicacion.Height;
end;

procedure TfrmSeleccionDestinatarios.tbPropiedadesClick(Sender: TObject);
begin
  {$IFNDEF MAIL_A_CONTRATO}
  if FTipoDestinatario = tdContactoContrato then
    with TfrmContratoContacto.Create(Self) do
    try
      DoCargarDatos(Contrato, IdEmpresa);
      ShowModal;
      Self.tbRefrescar.Click;
    finally
      Free;
    end;
  {$ENDIF}
end;

procedure TfrmSeleccionDestinatarios.TimerConsultaTimer(Sender: TObject);
begin
  TimerConsulta.Enabled := False;
  OpenQuery(sdqConsulta);
end;

procedure TfrmSeleccionDestinatarios.SetTipoDestinatario(const Value: TTipoDestinario);
var
  sSql: String;
begin
  FTipoDestinatario := Value;

  case FTipoDestinatario of
    tdContactoContrato:
      begin
        tbPropiedades.Visible := True;

        sSql :=
          'SELECT em_id, em_nombre, em_nombre nombre, ''Correo electrónico corporativo'' cargo, co_direlectronica direlectronica ' +
           ' FROM aco_contrato, aem_empresa ' +
          ' WHERE co_idempresa = em_id' +
            ' AND co_direlectronica IS NOT NULL' +
            ' AND co_contrato = :contrato ' +
          ' UNION ALL ' +
          'SELECT em_id, em_nombre, ct_contacto nombre, tb_descripcion cargo, ct_direlectronica direlectronica ' +
           ' FROM art.ctb_tablas, aco_contrato, aem_empresa, act_contacto' +
          ' WHERE tb_codigo = ct_cargo' +
            ' AND tb_clave = ''CARGO''' +
            ' AND co_idempresa = em_id' +
            ' AND em_id = ct_idempresa' +
            ' AND ct_fechabaja IS NULL' +
            ' AND ct_direlectronica IS NOT NULL' +
            ' AND co_contrato = :contrato';
      end;
    tdVendedor:
      begin
        tbPropiedades.Visible := False;

        sSql :=
          'SELECT DISTINCT em_id, em_nombre, ve_nombre nombre, NULL cargo, ve_direlectronica direlectronica' +
                    ' FROM aco_contrato, aem_empresa, xve_vendedor, xev_entidadvendedor, avc_vendedorcontrato' +
                   ' WHERE vc_identidadvend = ev_id' +
                     ' AND ev_fechabaja IS NULL' +
                     ' AND ev_idvendedor = ve_id' +
                     ' AND ve_fechabaja IS NULL' +
                     ' AND ve_direlectronica IS NOT NULL' +
                     ' AND vc_fechabaja IS NULL' +
                     ' AND co_idempresa = em_id' +
                     ' AND vc_contrato = co_contrato' +
                     ' AND vc_contrato = :contrato';
      end;
  end;

  sdqConsulta.Sql.Text := sSql;
end;

end.
