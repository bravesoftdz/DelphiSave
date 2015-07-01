unit unListExamenesPreocupacionales;     // TK 23169

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unfraPrestador, StdCtrls, unfraEstablecimiento, unFraEmpresa, Mask,
  ToolEdit, DateComboBox, Buttons, FormPanel, unFraTrabajador,
  unFraCodigoDescripcion, unFraTrabajadorSIN;

type
  TfrmListExamenesPreocupacionales = class(TfrmCustomConsulta)
    GroupBox1: TGroupBox;
    fraPrestador: TfraPrestador;
    GroupBox2: TGroupBox;
    fraEmpresa: TfraEmpresa;
    fraEstablecimiento: TfraEstablecimiento;
    lbCUIT: TLabel;
    GroupBox3: TGroupBox;
    dcFecAutorizDesde: TDateComboBox;
    dcFecAutorizHasta: TDateComboBox;
    Label2: TLabel;
    fpPersonasLote: TFormPanel;
    btnCerrar: TButton;
    btnExportarPersonas: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    dbgPersonasLote: TArtDBGrid;
    sdqPersonasLote: TSDQuery;
    dsPersonasLote: TDataSource;
    ExportDialog_PersonasLote: TExportDialog;
    ShortCutControl1: TShortCutControl;
    GroupBox4: TGroupBox;
    fraTipoEstudioPrest: TfraCodigoDescripcion;
    GroupBox5: TGroupBox;
    fraEmpleado: TfraCodigoDescripcion;
    edLote: TEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure fpPersonasLoteBeforeShow(Sender: TObject);
    procedure btnExportarPersonasClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure fraTipoEstudioPrestcmbDescripcionDropDown(Sender: TObject);
    procedure fraEmpleadoExit(Sender: TObject);
    procedure edLoteExit(Sender: TObject);
    procedure edLoteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    function Validar: boolean;
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnPrestadorChange(Sender: TObject);
    procedure Ver_PersonasLote;
    procedure Do_CompletarEmpleadoConLote;
  public
    { Public declarations }
  end;

var
  frmListExamenesPreocupacionales: TfrmListExamenesPreocupacionales;

implementation

uses
  CustomDlgs, AnsiSql, VCLExtra, unDmPrincipal;

{$R *.dfm}

procedure TfrmListExamenesPreocupacionales.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  if Validar then
  begin
    sSql := 'SELECT ep_id, ep_descripcion examen_preocup, ep_valor valor, ' +
                  ' ep_vigenciadesde Vig_desde, ep_vigenciahasta Vig_hasta, ' +
                  ' le_id Lote, le_cantidad Cant_personas, le_autorizado Aut, ' +
                  ' le_fechaaut FechaAut, em_cuit CUIT, em_nombre Empresa, ' +
                  ' es_contrato Contrato, es_nroestableci NroEstableci, ' +
                  ' es_nombre Establecimiento, le_idempresa, le_establecimiento, ' +
                  ' ep_idprestador, ca_descripcion DESCPRESTADOR ' +
             ' FROM aem_empresa, aco_contrato, aes_establecimiento, ' +
                  ' comunes.cle_lotesexamenes, comunes.cep_examenespreocupacionales, ' +
                  ' cpr_prestador ' +
            ' WHERE le_idexamen(+) = ep_id ' +
              ' AND le_establecimiento = es_id(+) ' +
              ' AND es_contrato = co_contrato(+) ' +
              ' AND le_idempresa = em_id(+) ' +
              ' AND ep_idprestador = ca_identificador ' +
              ' AND le_fechabaja IS NULL ' +
              ' AND ep_fechabaja IS NULL ';

    if not(fraPrestador.IsEmpty) then
      sSql := sSql + ' AND ep_idprestador = ' + SqlValue(fraPrestador.IDPrestador);

    if not(fraEmpresa.IsEmpty) then
      sSql := sSql + ' AND es_contrato = ' + SQLValue(fraEmpresa.Contrato);

    if not(fraEstablecimiento.IsEmpty) then
      sSql := sSql + ' AND es_id = ' + SqlValue(fraEstablecimiento.ID);

    if not(dcFecAutorizDesde.IsEmpty) then
      sSql := sSql + ' AND le_fechaaut >= ' + dcFecAutorizDesde.SqlText;

    if not(dcFecAutorizHasta.IsEmpty) then
      sSql := sSql + ' AND le_fechaaut <= ' + dcFecAutorizHasta.SqlText;

    if not(fraTipoEstudioPrest.IsEmpty) then
      sSql := sSql + ' AND ep_id = ' + SqlValue(fraTipoEstudioPrest.Value);

    if (edLote.Text <> '') then
      sSql := sSql + 'AND LE_ID = ' + SqlValue(edLote.Text);

    sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
    inherited;
  end;
end;

function TfrmListExamenesPreocupacionales.Validar: boolean;
begin
   Verificar(fraPrestador.IsEmpty and fraEmpresa.IsEmpty and (edLote.Text = '') , fraPrestador, 'Debe completar el Prestador y/o la Empresa y/o el Empleado para realizar la búsqueda');
   Result := True;
end;

procedure TfrmListExamenesPreocupacionales.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraPrestador.Clear;
  fraEmpresa.Clear;
  fraEstablecimiento.Clear;
  dcFecAutorizDesde.Clear;
  dcFecAutorizHasta.Clear;
  fraTipoEstudioPrest.Clear;
  fraEmpleado.Clear;
  edLote.Clear;
  
  OnPrestadorChange(self);
end;

procedure TfrmListExamenesPreocupacionales.OnEmpresaChange(Sender: TObject);
begin
  fraEstablecimiento.Contrato := fraEmpresa.Contrato;

end;

procedure TfrmListExamenesPreocupacionales.FSFormShow(Sender: TObject);
begin
  fraEmpresa.OnChange   := OnEmpresaChange;
  fraPrestador.OnChange := OnPrestadorChange;

  with fraTipoEstudioPrest do
  begin
    ShowBajas   := False;
    TableName   := 'COMUNES.CEP_EXAMENESPREOCUPACIONALES';
    FieldID     := 'EP_ID';
    FieldCodigo := 'EP_ID';
    FieldDesc   := 'EP_DESCRIPCION';
    FieldBaja   := 'EP_FECHABAJA';
    Sql         := 'SELECT EP_ID as id, EP_ID as codigo, EP_DESCRIPCION as descripcion, ' +
                         ' EP_FECHABAJA as baja ' +
                    ' FROM comunes.cep_examenespreocupacionales ' +
                   ' WHERE ep_fechabaja IS NULL';
  end;
  LockControl(fraTipoEstudioPrest, True);

  with fraEmpleado do
  begin
    ShowBajas   := False;
    TableName   := 'COMUNES.CPL_PERSONASXLOTE';
    FieldID     := 'PL_ID';
    FieldCodigo := 'PL_DNI';
    FieldDesc   := 'PL_NOMBRE';
    FieldBaja   := 'PL_FECHABAJA';
    Sql         := ' SELECT PL_ID as id, PL_DNI as CODIGO, PL_NOMBRE as descripcion, PL_IDLOTE ' +
                     ' FROM COMUNES.CPL_PERSONASXLOTE ' +
                    ' WHERE PL_FECHABAJA IS NULL ';
  end;

  inherited;
end;

procedure TfrmListExamenesPreocupacionales.tbPropiedadesClick(Sender: TObject); // Personas por Lote
begin
  Ver_PersonasLote;
end;

procedure TfrmListExamenesPreocupacionales.fpPersonasLoteBeforeShow(Sender: TObject);
var sSql:  string;
    iLote: integer;
begin
  iLote := sdqConsulta.FieldByName('LOTE').AsInteger;

  sSql := 'SELECT pl_dni, pl_nombre ' +
           ' FROM comunes.cpl_personasxlote ' +
          ' WHERE pl_idlote = ' + SqlInt(iLote) +
           '  AND pl_fechabaja IS NULL ';
  sdqPersonasLote.Close;
  sdqPersonasLote.SQL.Text := sSql;
  sdqPersonasLote.Open;
end;

procedure TfrmListExamenesPreocupacionales.btnExportarPersonasClick(Sender: TObject);
begin
  if sdqPersonasLote.Active then
    ExportDialog_PersonasLote.Execute;
end;

procedure TfrmListExamenesPreocupacionales.Ver_PersonasLote;
begin
  fpPersonasLote.Caption := 'Personas del Lote ' + InttoStr(sdqConsulta.FieldByName('LOTE').AsInteger);

  if (sdqConsulta.Active) and (fpPersonasLote.ShowModal = mrOk) then
  begin
      //
  end;
end;

procedure TfrmListExamenesPreocupacionales.GridDblClick(Sender: TObject);
begin
  inherited;
  Ver_PersonasLote;
end;

procedure TfrmListExamenesPreocupacionales.OnPrestadorChange(Sender: TObject);  // TK 26729
begin
  LockControl(fraTipoEstudioPrest, fraPrestador.IsEmpty); // lo deshabilito si esta vacío, ya que el tipo de estudio depende del Prestador.
end;

procedure TfrmListExamenesPreocupacionales.fraTipoEstudioPrestcmbDescripcionDropDown(Sender: TObject);  // TK 26729
begin
  fraTipoEstudioPrest.Sql := 'SELECT EP_ID as id, EP_ID as codigo, EP_DESCRIPCION as descripcion, ' +
                                   ' EP_FECHABAJA as baja ' +
                              ' FROM comunes.cep_examenespreocupacionales ' +
                             ' WHERE ep_fechabaja IS NULL ' +
                               ' AND EP_IDPRESTADOR = ' + SqlValue(fraPrestador.IDPrestador);
  inherited;
  fraTipoEstudioPrest.cmbDescripcionDropDown(Sender);
end;


procedure TfrmListExamenesPreocupacionales.fraEmpleadoExit(Sender: TObject);   // TK 26729
begin
  inherited;
  fraEmpleado.FrameExit(Sender);
  if not (fraEmpleado.IsEmpty) then
    edLote.Text := fraEmpleado.sdqDatos.fieldByname('PL_IDLOTE').AsString;
end;

procedure TfrmListExamenesPreocupacionales.edLoteExit(Sender: TObject);   // TK 26729
begin
  Do_CompletarEmpleadoConLote;
end;

procedure TfrmListExamenesPreocupacionales.edLoteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState); // TK 26729
begin
  if (Key = VK_RETURN) then
    Do_CompletarEmpleadoConLote;
end;

procedure TfrmListExamenesPreocupacionales.Do_CompletarEmpleadoConLote;  // TK 26729
var sSql: string;
begin
  sSql := 'SELECT pl_id, pl_dni, pl_nombre ' +
           ' FROM comunes.cpl_personasxlote ' +
          ' WHERE pl_idlote = ' + SqlValue(edLote.Text) +
            ' AND pl_fechabaja IS NULL ';
  with GetQuery(sSql) do
  try
     if not Eof then
     begin
       fraEmpleado.Codigo              := FieldByName('PL_DNI').AsString;
       fraEmpleado.cmbDescripcion.Text := FieldByName('PL_NOMBRE').AsString;
     end
     else
       fraEmpleado.Clear;
  finally
    Free;
  end;
end;


end.
