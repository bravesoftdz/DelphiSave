unit unBajaPapeleria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraCodDesc, ToolEdit, ArtComboBox, Mask, StdCtrls, PatternEdit,
  IntEdit, Buttons, DB, SDEngine, unCustomForm, ImgList, XPMenu, Placemnt;

type
  TfrmBajaPapeleria = class(TfrmCustomForm)
    btnAceptar: TBitBtn;
    btnCerrar: TBitBtn;
    cmbTrabDoc: TArtComboBox;
    dsPapeleria: TDataSource;
    edIDDoc: TIntEdit;
    fraMotivo: TfraCodDesc;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    mskCUITDoc: TMaskEdit;
    sdqPapeleria: TSDQuery;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure edIDDocEnter(Sender: TObject);
    procedure edIDDocExit(Sender: TObject);
    procedure edIDDocKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    bEncontrado :Boolean;
    procedure DoCargarDocumentacion(iID :Integer);
  end;

var
  frmBajaPapeleria: TfrmBajaPapeleria;

implementation

uses CustomDlgs, unPrincipal, unSesion, AnsiSql, unDmPrincipal;

{$R *.dfm}

procedure TfrmBajaPapeleria.btnAceptarClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not bEncontrado, edIDDoc, 'Debe ingresar el ID.');
  Verificar(fraMotivo.IsEmpty, fraMotivo, 'Debe seleccionar el motivo.');
  if MsgAsk('¿Confirma dar de baja la documentación seleccionada?') then
  begin
    sSql := 'UPDATE SIN.sid_informacion_dictamen ' +
              ' SET id_fechabaja = actualdate, ' +
                  ' id_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                  ' id_idmotivobaja = ' + SqlInt(fraMotivo.ID) +
            ' WHERE id_id = ' + SqlInt(edIDDoc.Value);
    EjecutarSql(sSql);
    edIDDoc.Clear;
    mskCUITDoc.Clear;
    cmbTrabDoc.Clear;
    edIDDoc.SetFocus;
    fraMotivo.Clear;
  end;
end;

procedure TfrmBajaPapeleria.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBajaPapeleria.edIDDocEnter(Sender: TObject);
begin
  edIDDoc.Tag := edIDDoc.Value;
end;

procedure TfrmBajaPapeleria.edIDDocExit(Sender: TObject);
begin
  if (edIDDoc.Tag <> edIDDoc.Value) then
  begin
    DoCargarDocumentacion(edIDDoc.Value);
    edIDDoc.Tag := edIDDoc.Value;
  end;
end;

procedure TfrmBajaPapeleria.edIDDocKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then edIDDocExit(Nil);
end;

procedure TfrmBajaPapeleria.FormShow(Sender: TObject);
begin
  edIDDoc.SetFocus;
end;

procedure TfrmBajaPapeleria.DoCargarDocumentacion(iID :Integer);
begin
  sdqPapeleria.Close;
  sdqPapeleria.ParamByName('IdPapel').AsInteger := iID;
  sdqPapeleria.Open;
  if not(sdqPapeleria.Eof) then
  begin
    bEncontrado     := True;
    edIDDoc.Value   := sdqPapeleria.FieldByName('ID_ID').AsInteger;
    mskCUITDoc.Text := sdqPapeleria.FIeldByName('ID_CUIL').AsString;
    cmbTrabDoc.Text := sdqPapeleria.FieldByName('ID_NOMBRE').AsString;
  end
  else begin
    MsgBox('No se encontró la documentación.', MB_ICONEXCLAMATION);
    bEncontrado := False;
    edIDDoc.Clear;
    mskCUITDoc.Clear;
    cmbTrabDoc.Clear;
  end;
end;

end.
