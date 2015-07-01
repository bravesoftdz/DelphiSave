unit unRecepcionVentanillaElectronica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, ImgList, XPMenu,
  Placemnt, StdCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Buttons, Mask, PatternEdit, IntEdit,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, DB, SDEngine, unFraStaticCTB_TABLAS, unFraStaticCodigoDescripcion,
  ToolEdit, DateComboBox, unFraCodigoDescripcion, unFraCodDesc, ComboEditor, CheckCombo, DBCheckCombo;

type
  TfrmRecepcionVentanillaElectronica = class(TfrmCustomForm)
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    Label2: TLabel;
    grid: TArtDBGrid;
    btnRecepcionar: TBitBtn;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    Label4: TLabel;
    edFechaRecepcion: TDateComboBox;
    fraCodigoRecepcion: TfraCodDesc;
    Label3: TLabel;
    chkPersoneriaFirmante: TDBCheckCombo;
    sdqPersoneriaFirmante: TSDQuery;
    dsPersoneriaFirmante: TDataSource;
    btnLimpiar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CambiaEmpresa(Sender: TObject);
    procedure btnRecepcionarClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    procedure RecepcionarCarta;
  public
  end;

const
  CORREO = '01';
  FIRMANTE = 446;

var
  frmRecepcionVentanillaElectronica: TfrmRecepcionVentanillaElectronica;

implementation

uses
  unDmPrincipal, unAfiliaciones, AnsiSql, unComunes, CustomDlgs, DateTimeFuncs, unSesion, General, VCLExtra, Math,
  unGrids;

{$R *.dfm}

procedure TfrmRecepcionVentanillaElectronica.CambiaEmpresa(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT ca_fechaimpresion, ca_fecharecepcion, ca_observrecepcion,' +
          ' DECODE(ca_recepcionok, ''S'', ''Si'', ''No'') recepcionok' +
     ' FROM cca_carta' +
    ' WHERE ca_idendoso IN(SELECT en_id' +
                           ' FROM aen_endoso' +
                          ' WHERE en_contrato = :contrato)' +
      ' AND ca_fechabaja IS NULL' +
      ' AND ca_idtextocarta = :textocarta' +
 ' ORDER BY ca_fechaimpresion DESC';
  OpenQueryEx(sdqConsulta, [fraEmpresa.Contrato, GetIdTextoAnexoRes365], sSql);
end;

procedure TfrmRecepcionVentanillaElectronica.RecepcionarCarta;
var
  iIdCarta: Integer;
  iLoop: Integer;
  sSql: String;
  sUsuarioImpresion: String;
begin
  // Genero la carta..
  iIdCarta := Do_ImprimirCartaAnexo(fraEmpresa.Contrato, GetIdTextoAnexoRes365, FIRMANTE, CORREO, False);

  BeginTrans;
  try
    // Actualizo los registros con el mismo código de recepción de la tabla del anexo 365..
    sSql :=
      'UPDATE afi.aan_anexo365' +
        ' SET an_fecharecepcion = :fecharecepcion' +
      ' WHERE an_contrato = :contrato' +
        ' AND an_idorigenanexo365 = :origen';
    EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(edFechaRecepcion.Date), fraEmpresa.Contrato, fraCodigoRecepcion.Value]);

    sSql :=
      'SELECT   an_usuimpresion' +
         ' FROM afi.aan_anexo365' +
        ' WHERE an_contrato = :contrato' +
          ' AND an_idorigenanexo365 = :origen' +
          ' AND an_usuimpresion IS NOT NULL' +
     ' ORDER BY 1 DESC';
    sUsuarioImpresion := ValorSqlEx(sSql, [fraEmpresa.Contrato, fraCodigoRecepcion.Value]);
    sUsuarioImpresion := IIF((sUsuarioImpresion = ''), Sesion.UserID, sUsuarioImpresion);
    sUsuarioImpresion := IIF((fraCodigoRecepcion.Value = 1), sUsuarioImpresion, IIF((fraCodigoRecepcion.Value = 4), 'WEB', sUsuarioImpresion));

    // Actualizo los campos de recepción..
    sSql :=
    'UPDATE cca_carta' +
      ' SET ca_fecharecepcion = :fecharecepcion,' +
          ' ca_correo = NULL,' +
          ' ca_recepcionok = ''S'',' +
          ' ca_codrecepcion = NULL,' +
          ' ca_usurecepcion = :usuario,' +
          ' ca_usuimpresion = :usuimpresion,' +
          ' ca_fechaimpresion = :fechaimpresion,' +
          ' ca_observaciones = :observacion,' +
          ' ca_observrecepcion = :observacion2' +
    ' WHERE ca_id = :id';
    EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(edFechaRecepcion.Date), Sesion.UserID, sUsuarioImpresion,
                           TDateTimeEx.Create(edFechaRecepcion.Date), 'Origen: ' + fraCodigoRecepcion.Descripcion,
                           'Origen: ' + fraCodigoRecepcion.Descripcion, iIdCarta]);

    // Actualizo los datos de la personería firmante..
    for iLoop := 0 to chkPersoneriaFirmante.Count - 1 do
      if chkPersoneriaFirmante.Checked[iLoop] then
      begin
        sSql :=
          'INSERT INTO afi.afc_firmantexcarta' +
              ' VALUES (:idcarta, :idpersoneriafirmante)';
        EjecutarSqlSTEx(sSql, [iIdCarta, chkPersoneriaFirmante.ItemValue[iLoop]]);
      end;


    // Actualizo la fecha de recepción de la carta en el contrato..
    sSql :=
      'UPDATE aco_contrato' +
        ' SET co_fecharecepcionanexo = :recepcionanexo' +
      ' WHERE co_contrato = :contrato';
    EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(edFechaRecepcion.Date), fraEmpresa.Contrato]);
    CommitTrans;
    InfoHint(btnRecepcionar, 'Operación exitosa.');
  except
    on E: Exception do
    begin
      Rollback;
      MsgBox(E.Message);
    end;
  end;
end;


procedure TfrmRecepcionVentanillaElectronica.FormCreate(Sender: TObject);
begin
  inherited;

  fraEmpresa.ShowBajas := True;
  fraEmpresa.OnChange := CambiaEmpresa;

  OpenQuery(sdqPersoneriaFirmante);
end;

procedure TfrmRecepcionVentanillaElectronica.btnRecepcionarClick(Sender: TObject);
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa.mskCUIT, 'Debe seleccionar una empresa.');
  Verificar(fraCodigoRecepcion.IsEmpty, fraCodigoRecepcion.edCodigo, 'Debe indicar el código de recepción.');
  Verificar(edFechaRecepcion.IsEmpty, edFechaRecepcion, 'Debe indicar la fecha de recepción.');
  Verificar((edFechaRecepcion.Date < StrToDate('01/05/2009')), edFechaRecepcion, 'La fecha de recepción no puede ser anterior al 01/05/2009.');

  RecepcionarCarta;
  CambiaEmpresa(nil);
end;

procedure TfrmRecepcionVentanillaElectronica.btnLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  fraCodigoRecepcion.Clear;
  edFechaRecepcion.Clear;
  sdqConsulta.Close;
  chkPersoneriaFirmante.Clear;
end;

procedure TfrmRecepcionVentanillaElectronica.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  DynColWidthsByData(Grid);
  Width := Min(Max(GetColumnWidths(Grid, True), 400), Screen.Width);
end;

end.
