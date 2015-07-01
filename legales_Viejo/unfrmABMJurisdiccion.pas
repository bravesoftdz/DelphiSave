unit unfrmABMJurisdiccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, ComCtrls,
  StdCtrls, Mask, PatternEdit, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ToolWin,
  Buttons, unArtFrame, ExComboBox, unfrmABMJuzgado, unFraCodigoDescripcion, unfraCodigoDescripcionExt, unArtDBAwareFrame;

type
  TfrmABMJurisdiccion = class(TfrmCustomGridABM)
    Label18: TLabel;
    edNroJurisdiccion: TPatternEdit;
    Label19: TLabel;
    Label1: TLabel;
    edDescripcionJuris: TEdit;
    cbTipoJurisdiccion: TExComboBox;
    Label2: TLabel;
    fraProvincias: TfraCodigoDescripcionExt;
    procedure FormCreate(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
  private
  public
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
        
    procedure ClearControls; override;
    procedure LoadControls; override;
  end;

var
  frmABMJurisdiccion: TfrmABMJurisdiccion;

implementation

uses
	unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, General,   StrFuncs, unCustomConsulta;

{$R *.dfm}

procedure TfrmABMJurisdiccion.ClearControls;
begin
  inherited;
  edNroJurisdiccion.Clear;
  edDescripcionJuris.Clear;
  cbTipoJurisdiccion.Text := '';
  fraProvincias.Limpiar;
end;

function TfrmABMJurisdiccion.DoABM: Boolean;
begin
  try
    Result := True;

    BeginTrans(True);
    Sql.Clear;
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('JU_ID', 	 sdqConsulta.FieldByName('JU_ID').AsInteger);
      Sql.Fields.Add('JU_USUBAJA', 	 Sesion.LoginName);
      Sql.Fields.Add('JU_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end
    else
    begin
      Sql.Fields.Add('JU_DESCRIPCION', 	edDescripcionJuris.Text);
      Sql.Fields.Add('JU_JURISDICCION', cbTipoJurisdiccion.Value);
      Sql.Fields.Add('JU_IDPROVINCIA', 	fraProvincias.Codigo);
      if ModoABM = maAlta then
      begin
        Sql.PrimaryKey.Add('JU_ID', 	 GetSecNextVal('legales.seq_lju_id'));
        Sql.Fields.Add('JU_USUALTA', 	 Sesion.LoginName);
        Sql.Fields.Add('JU_FECHAALTA', exDateTime);
      end
      else
      begin
      	Sql.PrimaryKey.Add('JU_ID', 		sdqConsulta.FieldByName('JU_ID').AsInteger);
        Sql.Fields.Add('JU_USUMODIF', 	Sesion.LoginName);
        Sql.Fields.Add('JU_FECHAMODIF', exDateTime);
        Sql.Fields.Add('JU_USUBAJA', exNull );
        Sql.Fields.Add('JU_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST(GetSqlABM);
    CommitTrans(True);
  except
    on E: Exception do
    begin
    	Result := False;
      Rollback(True);
      ErrorMsg(E, 'Error al guardar la jurisdicción.');
    end;
  end;
end;

procedure TfrmABMJurisdiccion.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'JU_FECHABAJA';
  Sql.TableName := 'LEGALES.lju_jurisdiccion';
  CheckPK := True;

  with fraProvincias do
  begin
    TableName := 'art.CPV_PROVINCIAS';
    FieldID := 'PV_CODIGO';
    FieldCodigo := 'PV_CODIGO';
    FieldDesc := 'PV_DESCRIPCION';
  end;
end;

procedure TfrmABMJurisdiccion.LoadControls;
begin
  inherited;
  edNroJurisdiccion.Text 	 := sdqConsulta.fieldbyname('JU_ID').AsString;
  edDescripcionJuris.Text  := sdqConsulta.fieldbyname('JU_DESCRIPCION').AsString;
  cbTipoJurisdiccion.Value := sdqConsulta.fieldbyname('JU_JURISDICCION').AsString;
  fraProvincias.Codigo 		 := sdqConsulta.fieldbyname('JU_IDPROVINCIA').AsString;
end;

function TfrmABMJurisdiccion.Validar: Boolean;
begin
	Result := VerificarMultiple(['ABM de Jurisdicciones',
                                edDescripcionJuris, not IsEmptyString(edDescripcionJuris.text), 'Debe especificar la descripción de la jurisdicción.',
                                fraProvincias, fraProvincias.IsSelected, 'Debe especificar la provincia',
                                cbTipoJurisdiccion, not IsEmptyString(cbTipoJurisdiccion.Text) ,'Debe especificar el tipo jurisdicción.'
                              ]);
end;


procedure TfrmABMJurisdiccion.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  if sdqConsulta.RecNo >= {$IFDEF VER150}0{$ELSE}1{$ENDIF} then
    with TfrmABMJuzgado.Create(self) do
    begin
      FormStyle := fsNormal;
      visible := False;
      FiltarDatos(self.sdqConsulta.FieldByName('JU_ID').AsString);
      frafilterJurisdiccion.Codigo := self.sdqConsulta.FieldByName('JU_ID').AsString;
      frafilterJurisdiccionChange(Sender);
      frafilterJurisdiccion.Locked := True;
      ShowModal;
    end;
end;

end.
