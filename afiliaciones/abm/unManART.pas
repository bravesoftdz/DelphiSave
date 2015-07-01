unit unManART;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls;

type
  TfrmManAAR_ART = class(TfrmCustomConsulta)
    Label1: TLabel;
    edART: TEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
  public
  end;

var
  frmManAAR_ART: TfrmManAAR_ART;

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSql, SqlFuncs, StrFuncs, CustomDlgs, General, unMAN_ABM_ART;

{$R *.DFM}

procedure TfrmManAAR_ART.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  sWhere := '';
  sSql :=
    'SELECT ar_id codigo, ar_nombre nombre, ar_email,' +
          ' art.utiles.armar_domicilio(ar_calle, ar_numero, ar_piso, ar_departamento, NULL) domicilio,' +
          ' ar_localidad localidad, pv_descripcion provincia, ar_codareatelefonos || '' '' || ar_telefonos telefono,' +
          ' ar_codareafax || '' '' || ar_fax fax, ar_usubaja "U.BAJA", ar_fechabaja "F.BAJA"' +
     ' FROM cpv_provincias, aar_art' +
    ' WHERE ar_provincia = pv_codigo(+)';

  if edART.Text <> '' then
    sWhere := sWhere + ' AND ar_nombre LIKE ' + SqlString(edART.Text + '%', True);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;

  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos para esta selección.', MB_ICONEXCLAMATION, 'Atención');
    Exit;
  end;
end;

procedure TfrmManAAR_ART.tbNuevoClick(Sender: TObject);
begin
  if not Assigned(frmMAN_ABM_ART) then
  begin
    frmMAN_ABM_ART := TfrmMAN_ABM_ART.Create(Self);
    try
      frmMAN_ABM_ART.ShowModal;
    finally
      FreeAndNil(frmMAN_ABM_ART);
    end;
  end
  else
    frmMAN_ABM_ART.Show;
end;

procedure TfrmManAAR_ART.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('u.baja').AsString = '' then
    if not Assigned(frmMAN_ABM_ART) then
    begin
      frmMAN_ABM_ART := TfrmMAN_ABM_ART.Create(Self);
      try
        frmMAN_ABM_ART.DoCargaIDART(sdqConsulta.FieldByName('codigo').AsInteger);
        frmMAN_ABM_ART.ShowModal;
      finally
        FreeAndNil(frmMAN_ABM_ART);
      end
    end
    else
      frmMAN_ABM_ART.Show;
end;

procedure TfrmManAAR_ART.tbEliminarClick(Sender: TObject);
begin
  if not sdqConsulta.Eof then
    if MsgBox('¿ Realmente desea borrar este registro ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
      with TSql.Create('aar_art') do
      try
        SqlType := stUpdate;
        PrimaryKey.Add('ar_id', 		sdqConsulta.fieldByName('codigo').AsInteger, False);
        Fields.Add('ar_fechabaja', 'Actualdate', False);
        Fields.Add('ar_usubaja', 		frmPrincipal.DBLogin.UserId);

        EjecutarSql(Sql);
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
        sdqConsulta.Refresh;
      finally
        Free;
      end;
end;

procedure TfrmManAAR_ART.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                           Highlight: Boolean);
begin
  if sdqConsulta.FieldByName('u.baja').AsString <> '' then
    AFont.Color:= clRed;
end;

end.
