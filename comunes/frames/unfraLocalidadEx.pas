unit unfraLocalidadEx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unfraLocalidad, Db, SDEngine, PatternEdit, ComboEditor, CheckCombo,
  StdCtrls, Mask, ToolEdit, ArtComboBox, unDmPrincipal, AnsiSql;

type
  TfraLocalidadEx = class(TfraLocalidad)
    procedure cmbLocalidadDropDown(Sender: TObject);
    procedure edCPostalKeyPress(Sender: TObject; var Key: Char);
    procedure cmbProvinciaCloseUp(Sender: TObject; var Cancel: Boolean);
    procedure cmbProvinciaDropDown(Sender: TObject);
    procedure cmbLocalidadCloseUp(Sender: TObject);
  private
    tmpProvincias: string;
  protected
    procedure EjecutaConsulta; override;
  public
    { Public declarations }
  end;

  implementation

{$R *.DFM}

procedure TfraLocalidadEx.cmbLocalidadDropDown(Sender: TObject);
begin
    EjecutaConsulta;
end;

procedure TfraLocalidadEx.edCPostalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
      cmbProvincia.ClearChecks(false);
      cmbLocalidad.Text := '';
      EjecutaConsulta;
      if sdqDatos.Active and (sdqDatos.RecordCount > 0) and (trim(edCPostal.Text) <> '') then
          CheckProvincia(sdqDatos.FieldByName('CP_PROVINCIA').AsInteger);
  end;

end;

procedure TfraLocalidadEx.EjecutaConsulta;
Var
  sSql : String;
begin
  sSql := 'SELECT CP_LOCALIDAD, CP_PROVINCIA, CP_CODIGO, PV_DESCRIPCION DESCPROVINCIA' +
          ' FROM ccp_codigopostal, cpv_provincias ' +
          ' WHERE CP_PROVINCIA = PV_CODIGO';
  cmbLocalidad.Text := Trim( cmbLocalidad.Text );
  //Condiciones
  if (cmbLocalidad.Text<>'') then
    sSql := sSql + ' AND CP_LOCALIDAD LIKE ''' + cmbLocalidad.Text + '%''' ;

  if (cmbProvincia.Text <> '') then
    sSql := sSql + ' AND CP_PROVINCIA IN ' + GetProvincias;

  if (trim(edCPostal.Text) <> '') then
    sSql := sSql + ' AND CP_CODIGO = ' + SqlValue(edCPostal.Text);

  //Abre el query
  if sdqDatos.SQL.Text <> sSql then
    OpenQuery( sdqDatos, sSql, True );
end;

procedure TfraLocalidadEx.cmbProvinciaCloseUp(Sender: TObject;
  var Cancel: Boolean);
begin
  inherited;
  if (tmpProvincias <> '') and (Pos(tmpProvincias, cmbProvincia.Text) = 0) then
  begin
      cmbLocalidad.Text := '';
      edCPostal.Text := '';
  end;
end;

procedure TfraLocalidadEx.cmbProvinciaDropDown(Sender: TObject);
begin
  inherited;
  tmpProvincias := cmbProvincia.Text;
end;

procedure TfraLocalidadEx.cmbLocalidadCloseUp(Sender: TObject);
begin
    if sdqDatos.Active and (trim(cmbLocalidad.Text) <> '') then
    begin
        CheckProvincia(sdqDatos.FieldByName('CP_PROVINCIA').AsInteger);
        edCPostal.Text := sdqDatos.FieldByName('CP_CODIGO').AsString;
    end;
end;

end.
