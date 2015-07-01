unit UnDocumentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, StdCtrls, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, unFraEmpresa, unfraPrestador, ExtCtrls, Mask, DBCtrls, General, PatternEdit,
  DBIncrementalSearch, ToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame, unArtDbFrame, JvExControls, JvComponent,
  JvXPCore, JvXPButtons;

type
  TfrmDocumentos = class(TForm)
    Label1: TLabel;
    edCodigo: TDBEdit;
    Label2: TLabel;
    edDescripcion: TDBEdit;
    Bevel2: TBevel;
    cmbDestinatario: TComboBox;
    Label4: TLabel;
    pnlPrestador: TPanel;
    fraPrestador: TfraPrestador;
    pnlEmpresa: TPanel;
    fraEmpresa: TfraEmpresa;
    Label3: TLabel;
    MemoObservaciones: TMemo;
    Bevel1: TBevel;
    dbgDocumentos: TArtDBGrid;
    sdqDocumentos: TSDQuery;
    dsDocumentos: TDataSource;
    Label5: TLabel;
    edSiniestro: TEdit;
    edOrden: TEdit;
    edRecaida: TEdit;
    edsfada: TLabel;
    edNroAuto: TEdit;
    lblModulo: TLabel;
    lblVolante: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    isCodigo: TDBIncrementalSearch;
    isDescripcion: TDBIncrementalSearch;
    FecDde: TDateComboBox;
    FecHta: TDateComboBox;
    Label8: TLabel;
    Label9: TLabel;
    sdqDocumentosTD_CODIGO: TStringField;
    sdqDocumentosTD_DESCRIPCION: TStringField;
    sdqDocumentosTD_TIENEFECHAS: TStringField;
    btnAceptar: TJvXPButton;
    btnCancelar: TJvXPButton;
    Label10: TLabel;
    procedure cmbDestinatarioChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure isDescripcionChange(Sender: TObject);
    procedure dbgDocumentosCellClick(Column: TColumn);
    procedure sdqDocumentosAfterScroll(DataSet: TDataSet);
    procedure btnAceptarClick(Sender: TObject);
  private
  public
    Procedure HabilitarEmpresa;
    Procedure HabilitarPrestador;
    Procedure SoloLecturaPrestador;
  end;

var
  frmDocumentos: TfrmDocumentos;

implementation

uses
  unPedidoInfo, unDmPrincipal, VCLExtra;

{$R *.DFM}

procedure TfrmDocumentos.cmbDestinatarioChange(Sender: TObject);
begin
  if (cmbDestinatario.Text = 'Prestador') then
  begin
    HabilitarPrestador;
    if lblModulo.Caption = 'A' then
      fraPrestador.IDPrestador := ValorSqlInteger('SELECT au_identifprestador' +
                                                   ' FROM Sau_autorizaciones' +
                                                  ' WHERE au_siniestro = ' + edSiniestro.Text +
                                                    ' AND au_orden = ' + edOrden.Text +
                                                    ' AND au_recaida = ' + edRecaida.Text +
                                                    ' AND au_numauto = ' + edNroAuto.Text)
    else if lblModulo.Caption = 'L' then
      fraPrestador.IDPrestador := ValorSqlInteger('SELECT vo_prestador' +
                                                   ' FROM siv_itemvolante, svo_volantes' +
                                                  ' WHERE iv_volante = vo_volante' +
                                                    ' AND iv_volante = ' + lblVolante.Caption) // Aca estas Consultando una tabla de mas (By Fede)
    else if lblModulo.Caption = 'E' then
      fraPrestador.IDPrestador := ValorSqlInteger('SELECT ex_prestador' +
                                                   ' FROM Sex_expedientes' +
                                                  ' WHERE ex_siniestro = ' + edSiniestro.Text +
                                                    ' AND ex_orden = ' + edOrden.Text +
                                                    ' AND ex_recaida = ' + edRecaida.Text);

    fraPrestador.FrameExit(Self);
    fraEmpresa.Clear;
  end
  else
  begin
    HabilitarEmpresa;
    fraEmpresa.Contrato := ValorSqlInteger('SELECT mp_contrato' +
                                            ' FROM cmp_empresas, Sex_expedientes' +
                                           ' WHERE mp_cuit = ex_cuit' +
                                             ' AND ex_siniestro = ' + edSiniestro.Text +
                                             ' AND ex_orden = ' + edOrden.Text +
                                             ' AND ex_recaida = ' + edRecaida.Text);
    fraPrestador.Limpiar;
  end;
end;

procedure TfrmDocumentos.HabilitarEmpresa;
begin
  with fraPrestador do
  begin
    Enabled           := False;
    lbCUIT.Enabled    := False;
    lbSec.Enabled     := False;
    lbIdentif.Enabled := False;
    lbRSocial.Enabled := False;
    CambiarColor(clMenu);
  end;

  VCLExtra.LockControls(fraEmpresa, False);
end;

procedure TfrmDocumentos.HabilitarPrestador;
begin
  VCLExtra.LockControls(fraEmpresa, True);

  with fraPrestador do
  begin
    Enabled           := True;
    lbCUIT.Enabled    := True;
    lbSec.Enabled     := True;
    lbIdentif.Enabled := True;
    lbRSocial.Enabled := True;
    CambiarColor(clWindow);
  end;
end;

procedure TfrmDocumentos.SoloLecturaPrestador;
begin
 {
     with fraPrestador do begin
         mskPrestCUIT.ReadOnly     := True;
         edPrestSecuencia.ReadOnly := True;
         edPrestIdentif.ReadOnly   := True;
         cmbPrestador.ReadOnly     := True;
     end;
}
  fraPrestador.ReadOnly := True; (*By Fede*)  { TENES QUE RECOMPILAR EL PROYECTO me da error Fede, Undeclared Identifier "ReadOnly"}
end;

procedure TfrmDocumentos.FormCreate(Sender: TObject);
begin
  fraPrestador.ShowBajas := True;
end;

procedure TfrmDocumentos.isDescripcionChange(Sender: TObject);
begin
  isCodigo.Text := sdqDocumentosTD_CODIGO.AsString;
end;

procedure TfrmDocumentos.dbgDocumentosCellClick(Column: TColumn);
begin
  isCodigo.Text := sdqDocumentosTD_CODIGO.AsString;
  isDescripcion.Text := sdqDocumentosTD_DESCRIPCION.AsString;
  if sdqDocumentos.FieldByName('TD_TIENEFECHAS').AsString = 'S' then
  begin
    Fecdde.enabled := True;
    Fechta.enabled := True;
  end
  else
  begin
    Fecdde.enabled := False;
    Fechta.enabled := False;
  end;
end;

procedure TfrmDocumentos.sdqDocumentosAfterScroll(DataSet: TDataSet);
begin
  isDescripcion.Text := sdqDocumentosTD_DESCRIPCION.AsString;
  if sdqDocumentos.FieldByName('TD_TIENEFECHAS').AsString = 'S' then
  begin
    Fecdde.enabled := True;
    Fechta.enabled := True;
  end
  else
  begin
    Fecdde.enabled := False;
    Fechta.enabled := False;
  end;
end;

procedure TfrmDocumentos.btnAceptarClick(Sender: TObject);
begin
  if (sdqDocumentos.FieldByName('TD_TIENEFECHAS').AsString = 'S') and ((fecdde.IsEmpty) or (fechta.IsEmpty)) then
    MsgBox('La fecha desde y la fecha hasta son obligatorias, por favor verifique sus valores.', MB_ICONEXCLAMATION)
  else
    Self.ModalResult:= mrOk;
end;

end.
