unit unFFMantFondoFijo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, OptionGroup;

type
  TfrmFFMantFondoFijo = class(TfrmCustomGridABM)
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    Label2: TLabel;
    edDescripcionAltaModif: TEdit;
    fraSectorAltaModif: TfraCodigoDescripcion;
    Label1: TLabel;
    rgTipoAltaModif: TOptionGroup;
    Label3: TLabel;
    fraResponsableAltaModif: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure fraSectorAltaModifChange(Sender: TObject);
  private
  public
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmFFMantFondoFijo: TfrmFFMantFondoFijo;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, CustomDlgs, unDmPrincipal, StrFuncs,
  unFFManMontos;

{$R *.dfm}

procedure TfrmFFMantFondoFijo.ClearControls;
begin
  edDescripcionAltaModif.Clear;
  fraSectorAltaModif.Clear;
  fraResponsableAltaModif.Clear;
  rgTipoAltaModif.ItemIndex := -1;
end;

function TfrmFFMantFondoFijo.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maBaja then
        begin
           PrimaryKey.Add('FF_ID',            sdqConsulta.FieldByName('ID').AsInteger);
           Fields.Add('FF_FECHABAJA',         exDateTime);
           Fields.Add('FF_USUBAJA',           Sesion.UserID);

           SqlType := stUpdate;
        end
      else
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.AddInteger('FF_ID',  GetSecNextVal('CONT.SEQ_OFF_ID'));
              Fields.Add('FF_FECHAALTA',      exDateTime);
              Fields.Add('FF_USUALTA',        Sesion.UserID);

              SqlType := stInsert;
            end;

          Fields.Add('FF_DESCRIPCION',        Trim(edDescripcionAltaModif.Text));
          Fields.Add('FF_SECTOR',             fraSectorAltaModif.Codigo);
          Fields.Add('FF_RESPONSABLE',        fraResponsableAltaModif.Codigo);
          Fields.Add('FF_TIPO',               String(Iif(rgTipoAltaModif.ItemIndex = 0, 'S', 'G')));
        end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmFFMantFondoFijo.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived   := True;
  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'OFF_FONDOFIJO';

  with fraSectorAltaModif do
    begin
      TableName   := 'USC_SECTORES';
      FieldID     := 'SC_ID';
      FieldCodigo := 'SC_CODIGO';
      FieldDesc   := 'SC_DESCRIPCION';
      FieldBaja   := 'SC_USUBAJA';
      ShowBajas   := False;
      OnChange    := fraSectorAltaModifChange;
    end;

  with fraResponsableAltaModif do
    begin
      TableName   := 'USE_USUARIOS';
      FieldID     := 'SE_ID';
      FieldCodigo := 'SE_USUARIO';
      FieldDesc   := 'SE_NOMBRE';
      FieldBaja   := 'SE_USUBAJA';
      ShowBajas   := False;
    end;
end;

procedure TfrmFFMantFondoFijo.fraSectorAltaModifChange(Sender: TObject);
begin
  if fraSectorAltaModif.IsSelected then
    begin
      fraResponsableAltaModif.ExtraCondition := ' AND SE_SECTOR = ' + SqlValue(fraSectorAltaModif.Codigo);
      fraResponsableAltaModif.Clear;
    end;
end;

procedure TfrmFFMantFondoFijo.LoadControls;
begin
  // no se usa
  with sdqConsulta do
    begin
      edDescripcionAltaModif.Text    := FieldByName('DESCRIPCION').AsString;
      fraSectorAltaModif.Codigo      := FieldByName('CODSECTOR').AsString;
      fraResponsableAltaModif.Codigo := FieldByName('CODRESPONSABLE').AsString;
      rgTipoAltaModif.ItemIndex      := Iif(FieldByName('CODTIPO').AsString = 'S', 0, 1);
    end;
end;

procedure TfrmFFMantFondoFijo.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT CASE FF_TIPO WHEN ''S'' THEN ''Siniestros'' WHEN ''G'' THEN ''Gastos'' END TIPO, ' +
                 'FF_DESCRIPCION DESCRIPCION, SC_DESCRIPCION SECTOR, FF_SECTOR CODSECTOR, FF_TIPO CODTIPO, ' +
                 'FF_ID ID, TRUNC(FF_FECHABAJA) FECHA_BAJA, FF_RESPONSABLE CODRESPONSABLE, ' +
                 'SE_NOMBRE NOMBRERESPONSABLE ' +
            'FROM OFF_FONDOFIJO, USE_USUARIOS, USC_SECTORES ' +
           'WHERE SC_CODIGO = FF_SECTOR ' +
             'AND FF_RESPONSABLE = SE_USUARIO';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND FF_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmFFMantFondoFijo.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro ya se encuentra dado de baja.');

  inherited;
end;

procedure TfrmFFMantFondoFijo.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmFFMantFondoFijo.tbPropiedadesClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro se encuentra dado de baja.');

  with TfrmFFManMontos.Create(nil) do
    try
      IdFondoFijo := Self.sdqConsulta.FieldByName('ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

function TfrmFFMantFondoFijo.Validar: Boolean;
begin
  Verificar(IsEmptyString(edDescripcionAltaModif.Text), edDescripcionAltaModif, 'Debe ingresar la descripción.');
  Verificar(fraSectorAltaModif.IsEmpty, fraSectorAltaModif, 'Debe ingresar el sector.');
  Verificar(fraResponsableAltaModif.IsEmpty, fraResponsableAltaModif, 'Debe ingresar el responsable.');
  Verificar(rgTipoAltaModif.ItemIndex = -1, rgTipoAltaModif, 'Debe ingresar el tipo.');

  Result := True;
end;

end.
