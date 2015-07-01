unit unManNormasReserva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, PatternEdit, IntEdit, Mask, ToolEdit,
  CurrEdit;

type
  TfrmManNormasReservas = class(TfrmCustomGridABM)
    fraNorma: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edReservaCapital: TCurrencyEdit;
    Label6: TLabel;
    edArticulo: TIntEdit;
    edInciso: TIntEdit;
    edApartado: TIntEdit;
    edAnexo: TIntEdit;
    fraSector: TfraCodigoDescripcion;
    cbValidaSector: TCheckBox;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManNormasReservas: TfrmManNormasReservas;

implementation

USES
  unSesion, SqlFuncs, unDmPrincipal, CustomDlgs;
{$R *.dfm}

procedure TfrmManNormasReservas.ClearControls;
begin
  fraNorma.Clear;
  edArticulo.Clear;
  edInciso.Clear;
  edApartado.Clear;
  edAnexo.Clear;
  edReservaCapital.Clear;
  fraSector.Clear;
  cbValidaSector.Checked := False;
end;

function TfrmManNormasReservas.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('nr_id', sdqConsulta.FieldByName('nr_id').AsInteger);
    Sql.Fields.Add('NR_USUBAJA', Sesion.LoginName);
    Sql.Fields.Add('NR_FECHABAJA', exDateTime);
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('nr_idnorma', fraNorma.Value);
    Sql.Fields.Add('nr_articulo', edArticulo.Text);
    Sql.Fields.Add('nr_inciso', edInciso.Text);
    Sql.Fields.Add('nr_apartado', edApartado.Text);
    Sql.Fields.Add('nr_anexo', edAnexo.Text);
    Sql.Fields.AddExtended('nr_reservacapital', edReservaCapital.Value,2, True);
    Sql.Fields.Add('nr_idsector', fraSector.Codigo);
    if cbValidaSector.Checked then
      Sql.Fields.Add('nr_validasector', 'S')
    else
      Sql.Fields.Add('nr_validasector', 'N');

    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('NR_ID', GetSecNextVal('legales.seq_lnr_id'));
      Sql.Fields.Add('NR_USUALTA', Sesion.LoginName);
      Sql.Fields.Add('NR_FECHAALTA', exDateTime);
    end else begin
      Sql.PrimaryKey.Add('NR_ID', sdqConsulta.FieldByName('NR_ID').AsInteger);
      Sql.Fields.Add('NR_USUMODIF', Sesion.LoginName);
      Sql.Fields.Add('NR_FECHAMODIF', exDateTime);
      Sql.Fields.Add('NR_USUBAJA', exNull);
      Sql.Fields.Add('NR_FECHABAJA', exNull);
    end;
  end;

  Result := inherited DoABM;
end;
procedure TfrmManNormasReservas.LoadControls;
begin
  with sdqConsulta do
  begin
    fraNorma.Value         := FieldByName('NR_IDNORMA').AsInteger;
    edArticulo.Text        := FieldByName('nr_articulo').AsString;
    edInciso.Text          := FieldByName('nr_inciso').AsString;
    edApartado.Text        := FieldByName('nr_apartado').AsString;
    edAnexo.Text           := FieldByName('nr_anexo').AsString;
    edReservaCapital.Text  := FieldByName('nr_reservacapital').AsString;
    fraSector.Codigo       := FieldByName('nr_idsector').AsString;
    cbValidaSector.Checked := FieldByName('nr_validasector').AsString = 'S';
  end;
end;
{------------------------------------------------------------------------------}
function TfrmManNormasReservas.Validar: Boolean;
begin
  Result := True;
  Verificar(not fraNorma.IsSelected, fraNorma, 'Debe especificar Norma.');
  Verificar(edReservaCapital.Text = '', edReservaCapital, 'Debe Especificar Reserva Capital.');
  Verificar(not fraSector.IsSelected, fraSector, 'Debe especificar Sector.');
end;
{------------------------------------------------------------------------------}
procedure TfrmManNormasReservas.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja     := 'nr_fechabaja';
  Sql.TableName := 'legales.lnr_normareserva';
  CheckPK := True;

  with fraNorma do
  begin
    TableName   := 'LEGALES.lno_norma';
    FieldID     := 'no_id';
    FieldCodigo := 'no_nro';
    FieldDesc   := 'no_descripcion';
    FieldBaja   := 'no_fechabaja';
    Showbajas   := false;
  end;

  with fraSector do
  begin
    TableName   := 'ART.USC_SECTORES';
    FieldID     := 'SC_ID';
    FieldCodigo := 'sc_id';
    FieldDesc   := 'SC_DESCRIPCION';
    FieldBaja   := 'SC_FECHABAJA';
    ShowBajas := true;
  end;

  tbRefrescarClick(nil);
end;


procedure TfrmManNormasReservas.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin

  sSql :=
    ' SELECT nr_id, nr_idnorma, nr_fechaalta, nr_usualta, nr_reservacapital, '+
    '        nr_idsector, nr_validasector, no_nro, no_descripcion, '+
    '        nr_articulo, nr_inciso, nr_apartado, nr_anexo,nr_fechabaja '+
    '   FROM legales.lnr_normareserva, legales.lno_norma '+
    '  WHERE no_id = nr_idnorma ';
  sdqConsulta.Sql.Text := sSql;

  inherited;

end;

end.
