unit unInfDifenilos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unfraEstablecimientoDomic, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, ExtCtrls, Mask, ToolEdit,
  DateComboBox, ComCtrls, PatternEdit, IntEdit,SqlFuncs,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraTrabajadorAMP,
  unFraCodigoDescripcion, unFraCodDesc, Buttons, FormPanel, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ToolWin, CurrEdit, ExComboBox, DB,
  SDEngine, unProfesionales, unSustanciasSector,unTraslados, unTrabajadoresDifenilos;

type
  TModoABM = (maNone, maAlta, maModificacion, maBaja);

  TfrmInfDifenilos = class(TForm)
    pcInforme: TPageControl;
    tsInforme: TTabSheet;
    pnlBottom: TPanel;
    ScrollBox: TScrollBox;
    gbInforme: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    lbInfExportado: TLabel;
    edNroInforme: TEdit;
    edFechaInforme: TDateComboBox;
    rgTipoInforme: TRadioGroup;
    gbEmpresa: TGroupBox;
    CUIT: TLabel;
    lbCPostalA: TLabel;
    Label18: TLabel;
    fraEmpresa: TfraEmpresa;
    fraEstablecimiento: TfraEstablecimientoDomic;
    edCPA: TEdit;
    edCiuu: TEdit;
    gbResponsable: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edCuitResponsable: TMaskEdit;
    fraTipoDocumento: TfraStaticCTB_TABLAS;
    fraRepresentacion: TfraStaticCTB_TABLAS;
    edApellidoNombre: TEdit;
    gbDatosEstab: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel3: TBevel;
    edAdministrativo: TIntEdit;
    edProduccion: TIntEdit;
    edtotal: TIntEdit;
    tsTrabajadores: TTabSheet;
    btnAplicar: TButton;
    btnAceptar: TButton;
    btnCancelar: TButton;
    chbDenunciarResponsable: TCheckBox;
    chbDenunciarEmpresa: TCheckBox;
    chbDenunciarPersonal: TCheckBox;
    tsTraslados: TTabSheet;
    gbCaratEstab: TGroupBox;
    GroupBox2: TGroupBox;
    edCaracteristicas: TMemo;
    Label8: TLabel;
    chkSiMedPrevAmbEqui: TCheckBox;
    chkNoMedPrevAmbEqui: TCheckBox;
    chkNoMedPrevDeposito: TCheckBox;
    chkSiMedPrevDeposito: TCheckBox;
    Label11: TLabel;
    sdqDifenilos: TSDQuery;
    tsProfesionales: TTabSheet;
    tsSustanciasSector: TTabSheet;
    edFechaRecepcion: TDateComboBox;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chkSiMedPrevAmbEquiClick(Sender: TObject);
    procedure chkNoMedPrevAmbEquiClick(Sender: TObject);
    procedure chkSiMedPrevDepositoClick(Sender: TObject);
    procedure chkNoMedPrevDepositoClick(Sender: TObject);
    procedure fraEmpresaOnChange(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fraEstablecimientoOnChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ModoABM : TModoABM;
    Sql: TCustomSql;
    frmProfesionales : TfrmProfesionales;
    frmSustanciasSector : TfrmSustanciasSector;
    frmTraslados : TfrmTraslados;
    frmTrabajadoresDifenilos : TfrmTrabajadoresDifenilos;
    procedure bloquearProfesionales(estado : Boolean);
    procedure bloquearSustanciasSector(estado : Boolean);
    procedure bloquearTraslados(estado : Boolean);
    procedure bloquearTrabajadores(estado : Boolean);
    procedure bloquearBarras(bloqueo: Boolean);
    procedure validarInforme;
    procedure guardarInforme;
  public
    { Public declarations }
    procedure nuevoInforme;
    procedure Cargar(idInforme : Integer);
  end;

var
  frmInfDifenilos: TfrmInfDifenilos;

implementation

uses CustomDlgs, unDmPrincipal, unSesion, Math, DBSql, AnsiSql, CUIT, unComunesFet;

{$R *.dfm}

{ TfrmInfDifenilos }

procedure TfrmInfDifenilos.bloquearProfesionales(estado: Boolean);
begin
  frmProfesionales.ToolBar.Enabled := not estado;
end;

procedure TfrmInfDifenilos.bloquearSustanciasSector(estado: Boolean);
begin
  frmSustanciasSector.ToolBar.Enabled := not estado;
end;

procedure TfrmInfDifenilos.bloquearTrabajadores(estado: Boolean);
begin
  frmTrabajadoresDifenilos.ToolBar.Enabled := not estado;
end;

procedure TfrmInfDifenilos.bloquearTraslados(estado: Boolean);
begin
  frmTraslados.ToolBar.Enabled := not estado;
end;

procedure TfrmInfDifenilos.nuevoInforme;
begin
  ModoABM := maAlta;
  bloquearBarras(True);
end;

procedure TfrmInfDifenilos.bloquearBarras(bloqueo : Boolean);
begin
  bloquearProfesionales(bloqueo);
  bloquearSustanciasSector(bloqueo);
  bloquearTraslados(bloqueo);
  bloquearTrabajadores(bloqueo);
end;

procedure TfrmInfDifenilos.FormCreate(Sender: TObject);
begin
  fraEmpresa.ShowBajas := true;
  fraEmpresa.UltContrato := true;

  frmProfesionales := TfrmProfesionales.Create( Self );
  frmProfesionales.Parent    := tsProfesionales;
  frmProfesionales.Visible   := True;
  frmProfesionales.Align     := alClient;

  frmSustanciasSector := TfrmSustanciasSector.Create(Self);
  frmSustanciasSector.Parent := tsSustanciasSector;
  frmSustanciasSector.Visible := True;
  frmSustanciasSector.Align := alClient;
  frmSustanciasSector.TipoAbm := taDifenilos;

  frmTraslados := TfrmTraslados.Create(Self);
  frmTraslados.Parent := tsTraslados;
  frmTraslados.Visible := True;
  frmTraslados.Align := alClient;

  frmTrabajadoresDifenilos := TfrmTrabajadoresDifenilos.Create(Self);
  frmTrabajadoresDifenilos.Parent := tsTrabajadores;
  frmTrabajadoresDifenilos.Visible := True;
  frmTrabajadoresDifenilos.Align := alClient;

  pcInforme.ActivePageIndex := 0;
  fraRepresentacion.Clave      := 'TREPR';
  fraRepresentacion.AutoFilter := True;
  fraTipoDocumento.Clave       := 'TDOCN';
  fraEmpresa.OnChange := fraEmpresaOnChange;
  fraEstablecimiento.ShowBajas := True;
  fraEstablecimiento.OnChange := fraEstablecimientoOnChange;
  Sql := TDBSql.Create;
end;

procedure TfrmInfDifenilos.btnAplicarClick(Sender: TObject);
begin
  BeginTrans(True);
  validarInforme;
  guardarInforme;
  if ModoABM = maalta then
  begin
    bloquearBarras(False);
    ModoABM := maModificacion;
  end;
  CommitTrans(True);
end;

procedure TfrmInfDifenilos.fraEstablecimientoOnChange(Sender: TObject);
begin
  if fraEstablecimiento.IsSelected then
  begin
    edCPA.Text := fraEstablecimiento.CPostalA;
    edCiuu.Text := ValorSql('select substr(art.hys.get_codactividadrevdos(ac_id, ac_revision),1,6) from comunes.cac_actividad where ac_codigo = ' + SqlValue(fraEstablecimiento.Actividad));
  end;
end;

procedure TfrmInfDifenilos.Cargar(idInforme :integer);
begin
  ModoABM := maModificacion;
  sdqDifenilos.Close;
  sdqDifenilos.ParamByName('IDINFORME').AsInteger := idInforme;
  frmProfesionales.IDInforme := idInforme;
  frmSustanciasSector.IDInforme := idInforme;
  frmTraslados.IDInforme := idInforme;
  frmTrabajadoresDifenilos.IDInforme := idInforme;
  sdqDifenilos.Open;
  edNroInforme.Text := sdqDifenilos.FieldByName('IN_NROINFORME').AsString;
  edFechaInforme.Date := sdqDifenilos.FieldByName('IN_FECHAINFORME').AsDateTime;
  edFechaRecepcion.Date := sdqDifenilos.FieldByName('IN_FECHARECEPCION').AsDateTime;
  rgTipoInforme.ItemIndex := sdqDifenilos.FieldByName('IN_CATINFORME').AsInteger;
  chbDenunciarEmpresa.Checked := sdqDifenilos.FieldByName('IN_FALTAEMPRESA').AsString = 'S';
  if not chbDenunciarEmpresa.Checked then
  begin
    fraEmpresa.CUIT := sdqDifenilos.FieldByName('IN_CUIT').AsString;
    fraEstablecimiento.Cargar(sdqDifenilos.FieldByName('IN_CUIT').AsString,
                              sdqDifenilos.FieldByName('es_nroestableci').AsString);
    fraEstablecimientoOnChange(nil);
  end;

  chbDenunciarResponsable.Checked := sdqDifenilos.FieldByName('IN_FALTARESPONSABLE').AsString = 'S';

  if not chbDenunciarResponsable.Checked then
  begin
    edCuitResponsable.Text := sdqDifenilos.FieldByName('IN_CUIL').AsString;
    edApellidoNombre.Text := sdqDifenilos.FieldByName('IN_NOMBREAPELLIDO').AsString;
    fraTipoDocumento.Codigo := sdqDifenilos.FieldByName('IN_TIPODOCUMENTO').AsString;
    fraRepresentacion.Codigo := sdqDifenilos.FieldByName('IN_REPRESENTACION').AsString;
  end;

  chbDenunciarPersonal.Checked := sdqDifenilos.FieldByName('IN_FALTADATOSESTAB').AsString = 'S';

  if not chbDenunciarPersonal.Checked then
  begin
    edAdministrativo.Value := sdqDifenilos.FieldByName('IN_CANTTRABADMINISTRATIVOS').AsInteger;
    edProduccion.Value := sdqDifenilos.FieldByName('IN_CANTTRABPRODUCCION').AsInteger;
    edtotal.Value := edProduccion.Value+edAdministrativo.Value;
  end;

  edCaracteristicas.Text := sdqDifenilos.FieldByName('IN_CARACTERISTICAS').AsString;

  if sdqDifenilos.FieldByName('IN_PREVAMBEQUIPOS').AsString = 'S' then
    chkSiMedPrevAmbEqui.Checked := True
  else
    chkNoMedPrevAmbEqui.Checked := True;

  if sdqDifenilos.FieldByName('IN_PREVDEPOSITO').AsString = 'S' then
    chkSiMedPrevDeposito.Checked := True
  else
    chkNoMedPrevDeposito.Checked := True;

  frmTraslados.CUIT := fraEmpresa.CUIT;
  frmTrabajadoresDifenilos.Contrato := fraEmpresa.Contrato;
  frmTrabajadoresDifenilos.NroEstableci := StrToInt(fraEstablecimiento.edCodigo.text);
  frmTrabajadoresDifenilos.FechaInforme := edFechaInforme.Date;
  
end;

procedure TfrmInfDifenilos.validarInforme;
begin
  Verificar(edFechaInforme.Date = 0 ,edFechaInforme, 'Debe Ingresar la fecha de Informe.');
  Verificar(edFechaRecepcion.Date = 0 ,edFechaRecepcion, 'Debe Ingresar la fecha de Recepción.');
  Verificar(rgTipoInforme.ItemIndex = -1, rgTipoInforme, 'Debe indicar que tipo de informe es.');
  Verificar(edCaracteristicas.Text = '', edCaracteristicas,'Debe ingresar Caracteristicas.');
  Verificar(not chkSiMedPrevAmbEqui.Checked and not chkNoMedPrevAmbEqui.Checked, chkSiMedPrevAmbEqui,'Debe seleccionar la medida.');
  Verificar(not chkSiMedPrevDeposito.Checked and not chkNoMedPrevDeposito.Checked, chkSiMedPrevDeposito,'Debe seleccionar la medida.');
  if not chbDenunciarEmpresa.Checked then
  begin
    Verificar(not fraEmpresa.IsSelected, fraEmpresa, 'Debe Seleccionar la empresa.');
    Verificar(not fraEstablecimiento.IsSelected, fraEstablecimiento, 'Debe Seleccionar el establecimiento');
  end;
  if not chbDenunciarResponsable.Checked then
  begin
    Verificar(edCuitResponsable.Text = '', edCuitResponsable,'Debe completar el campo');
    Verificar(not IsCuil(edCuitResponsable.Text),edCuitResponsable,'Debe ser un CUIL valido.');
    Verificar(edApellidoNombre.Text = '',edApellidoNombre, 'Debe Ingresar el nombre y apellido.');
    Verificar(not fraTipoDocumento.IsSelected, fraTipoDocumento,'Debe seleccionar el tipo de documento.');
    Verificar(not fraRepresentacion.IsSelected, fraRepresentacion,'Debe seleccionar el tipo de representación.');
  end;
  if not chbDenunciarPersonal.Checked then
  begin
    Verificar(edAdministrativo.Text = '', edAdministrativo,'Debe ingresar el administrativo ');
    Verificar(edProduccion.Text = '', edProduccion,'Debe ingresar la producción');
  end;
end;

procedure TfrmInfDifenilos.guardarInforme;
var
  IDInforme, nroInforme : Integer;
begin
  Sql.Clear;
  Sql.TableName := 'HYS.HIN_INFORME';
  if ModoABM = maAlta then
  begin
    nroInforme := ValorSql('SELECT NVL(MAX(in_nroinforme+1),1) FROM hys.hin_informe WHERE in_tipoinforme = ''D'' ');
    Sql.SqlType := stInsert;
    IDInforme:= GetSecNextVal('HYS.SEQ_HIN_ID');
    Sql.Fields.Add('IN_USUALTA', Sesion.UserID );
    Sql.Fields.Add('IN_FECHAALTA', exDateTime );
    Sql.Fields.Add('IN_NROINFORME', nroInforme);
    Sql.Fields.Add('IN_TIPOINFORME', 'D');
  end
  else
  begin
    Sql.SqlType := stUpdate;
    nroInforme := sdqDifenilos.FieldByName('IN_NROINFORME').AsInteger;
    IDInforme := sdqDifenilos.FieldByName('IN_ID').AsInteger;
    Sql.Fields.Add('IN_USUMODIF', Sesion.UserID);
    Sql.Fields.Add('IN_FECHAMODIF', exDateTime );
    Sql.Fields.Add('IN_USUBAJA', exNull );
    Sql.Fields.Add('IN_FECHABAJA', exNull );
  end;
  Sql.Fields.Add('IN_FECHAINFORME', edFechaInforme.Date);
  Sql.Fields.Add('IN_FECHARECEPCION', edFechaRecepcion.Date);
  Sql.Fields.Add('IN_CATINFORME', rgTipoInforme.ItemIndex);

  Sql.PrimaryKey.Add('IN_ID',IDInforme);

  if chbDenunciarEmpresa.Checked then
  begin
    Sql.Fields.Add('IN_FALTAEMPRESA', 'S');
    if ((ModoABM = maAlta) or (sdqDifenilos.FieldByName('IN_FALTAEMPRESA').AsString = 'N')) then
      DenunciaDatosIncompletos(fraEmpresa.CUIT,fraEstablecimiento.IdEstablecimiento,nroInforme,'Empresa','Difenilos');
  end
  else
  begin
    Sql.Fields.Add('IN_FALTAEMPRESA', 'N');
    Sql.Fields.Add('IN_CUIT', fraEmpresa.CUIT);
    Sql.Fields.Add('IN_IDESTABLECI', fraEstablecimiento.IdEstablecimiento);
  end;

  if chbDenunciarResponsable.Checked then
  begin
    Sql.Fields.Add('IN_FALTARESPONSABLE', 'S');
    if ((ModoABM = maAlta) or (sdqDifenilos.FieldByName('IN_FALTARESPONSABLE').AsString = 'N')) then
      DenunciaDatosIncompletos(fraEmpresa.CUIT,fraEstablecimiento.IdEstablecimiento,nroInforme,'Responsable','Difenilos');
  end
  else
  begin
    Sql.Fields.Add('IN_FALTARESPONSABLE', 'N');
    Sql.Fields.Add('IN_CUIL', edCuitResponsable.Text);
    Sql.Fields.Add('IN_NOMBREAPELLIDO', edApellidoNombre.Text);
    Sql.Fields.Add('IN_TIPODOCUMENTO', fraTipoDocumento.Codigo);
    Sql.Fields.Add('IN_REPRESENTACION', fraRepresentacion.Codigo);

  end;

  if chbDenunciarPersonal.Checked then
  begin
    Sql.Fields.Add('IN_FALTADATOSESTAB', 'S');
    if ((ModoABM = maAlta) or (sdqDifenilos.FieldByName('IN_FALTADATOSESTAB').AsString = 'N')) then
      DenunciaDatosIncompletos(fraEmpresa.CUIT,fraEstablecimiento.IdEstablecimiento,nroInforme,'Datos del establecimiento','Difenilos');
  end
  else
  begin
    Sql.Fields.Add('IN_FALTADATOSESTAB', 'N');
    Sql.Fields.Add('IN_CANTTRABADMINISTRATIVOS', edAdministrativo.Text);
    Sql.Fields.Add('IN_CANTTRABPRODUCCION', edProduccion.Text);
  end;

  Sql.Fields.Add('IN_CARACTERISTICAS', edCaracteristicas.Text);
  If chkSiMedPrevAmbEqui.Checked then
    Sql.Fields.Add('IN_PREVAMBEQUIPOS', 'S')
  else if chkNoMedPrevAmbEqui.Checked then
    Sql.Fields.Add('IN_PREVAMBEQUIPOS', 'N');

  if chkSiMedPrevDeposito.Checked then
    Sql.Fields.Add('IN_PREVDEPOSITO', 'S')
  else if chkNoMedPrevDeposito.Checked then
    Sql.Fields.Add('IN_PREVDEPOSITO', 'N');

  EjecutarSqlST(Sql.Sql);
  frmTraslados.CUIT := fraEmpresa.CUIT;
  frmTrabajadoresDifenilos.Contrato := fraEmpresa.Contrato;
  frmTrabajadoresDifenilos.NroEstableci := StrToInt(fraEstablecimiento.edCodigo.text);
  frmTrabajadoresDifenilos.FechaInforme := edFechaInforme.Date;

  if ModoABM = maAlta then
  begin
    frmProfesionales.IDInforme := IDInforme;
    frmSustanciasSector.IDInforme := IDInforme;
    frmTraslados.IDInforme := IDInforme ;
    frmTrabajadoresDifenilos.IDInforme := IDInforme ;
    MsgBox('El número de Informe es: '+ IntToStr(nroInforme));
    edNroInforme.Text := IntToStr(nroInforme);
    sdqDifenilos.Close;
    sdqDifenilos.ParamByName('IDINFORME').AsInteger := IDInforme;
    sdqDifenilos.Open;
  end;
end;

procedure TfrmInfDifenilos.FormDestroy(Sender: TObject);
begin
  Sql.free;
end;

procedure TfrmInfDifenilos.chkSiMedPrevAmbEquiClick(Sender: TObject);
begin
  if chkSiMedPrevAmbEqui.Checked then
    chkNoMedPrevAmbEqui.Checked := False;
end;

procedure TfrmInfDifenilos.chkNoMedPrevAmbEquiClick(Sender: TObject);
begin
  if chkNoMedPrevAmbEqui.Checked then
    chkSiMedPrevAmbEqui.Checked := False;
end;

procedure TfrmInfDifenilos.chkSiMedPrevDepositoClick(Sender: TObject);
begin
  if chkSiMedPrevDeposito.Checked then
    chkNoMedPrevDeposito.Checked := False;
end;

procedure TfrmInfDifenilos.chkNoMedPrevDepositoClick(Sender: TObject);
begin
  if chkNoMedPrevDeposito.Checked then
    chkSiMedPrevDeposito.Checked := False;
end;

procedure TfrmInfDifenilos.fraEmpresaOnChange(Sender: TObject);
begin
  inherited;
  if fraEmpresa.IsSelected then
    fraEstablecimiento.CUIT := fraEmpresa.CUIT
  else
    fraEstablecimiento.Clear;
end;

procedure TfrmInfDifenilos.btnAceptarClick(Sender: TObject);
begin
  BeginTrans(True);
  validarInforme;
  guardarInforme;
  ModalResult := mrOK;
  CommitTrans(True);
end;

procedure TfrmInfDifenilos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmProfesionales.Free;
  frmSustanciasSector.Free;
  frmTraslados.Free;
  frmTrabajadoresDifenilos.Free;
end;

end.
