unit unfrmABMSecretaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, ComCtrls,
  StdCtrls, Mask, PatternEdit, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ToolWin,
  Buttons, unArtFrame, ExComboBox;

type
  TfrmABMSecretaria = class(TfrmCustomGridABM)
    Label18: TLabel;
    edNroSec: TPatternEdit;
    Label19: TLabel;
    edDescripcionSec: TEdit;
    Label1: TLabel;
    edCodigoSrt: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaBeforeOpen(DataSet: TDataSet);
  private
    FIdJuzgado: Integer;
  public
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;

    property IdJuzgado: Integer read FIdJuzgado write FIdJuzgado;
  end;

var
  frmABMSecretaria: TfrmABMSecretaria;

implementation

uses
	unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, General,   StrFuncs, unCustomConsulta;

{$R *.dfm}

procedure TfrmABMSecretaria.ClearControls;
begin
  inherited;
  edNroSec.Clear;
  edDescripcionSec.Clear;
  edCodigoSrt.Clear;
end;

function TfrmABMSecretaria.DoABM: Boolean;
begin
  try
    Result := True;

    BeginTrans(True);
    Sql.Clear;
    if ModoABM = maBaja then
    begin
    	Sql.PrimaryKey.Add('SC_ID', 	 sdqConsulta.FieldByName('SC_ID').AsInteger);
      Sql.Fields.Add('SC_USUBAJA', 	 Sesion.LoginName);
      Sql.Fields.Add('SC_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end
    else
    begin
      Sql.Fields.Add('SC_DESCRIPCION', edDescripcionSec.Text);
      Sql.Fields.Add('SC_CODIGOSRT',   edCodigoSrt.Text);
      Sql.Fields.Add('SC_IDJUZGADO', 	 FIdJuzgado);
      if ModoABM = maAlta then
      begin
        Sql.PrimaryKey.Add('SC_ID', 	 GetSecNextVal('legales.seq_lsc_id'));
        Sql.Fields.Add('SC_USUALTA', 	 Sesion.LoginName);
        Sql.Fields.Add('SC_FECHAALTA', exDateTime);
      end
      else
      begin
        Sql.PrimaryKey.Add('SC_ID', 		sdqConsulta.FieldByName('SC_ID').AsInteger);
        Sql.Fields.Add('SC_USUMODIF', 	Sesion.LoginName);
        Sql.Fields.Add('SC_FECHAMODIF', exDateTime);
        Sql.Fields.Add('SC_USUBAJA', exNull );
        Sql.Fields.Add('SC_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST(GetSqlABM);
    CommitTrans(True);
  except
    on E: Exception do
    begin
    	Result := False;
      Rollback(True);
      ErrorMsg(E, 'Error al guardar la secretaría.');
    end;
  end;
end;

procedure TfrmABMSecretaria.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'SC_FECHABAJA';
  Sql.TableName := 'legales.lsc_secretaria';
  CheckPK := True;
end;

procedure TfrmABMSecretaria.LoadControls;
begin
  inherited;
  edNroSec.Text 				:= sdqConsulta.fieldbyname('SC_ID').AsString;
  edDescripcionSec.Text := sdqConsulta.fieldbyname('SC_DESCRIPCION').AsString;
  edCodigoSrt.Text      := sdqConsulta.fieldbyname('SC_CODIGOSRT').AsString;
end;

function TfrmABMSecretaria.Validar: Boolean;
begin
	Result := VerificarMultiple(['ABM de Secretarías',
                                  edDescripcionSec, not IsEmptyString(edDescripcionSec.text), 'Debe especificar la descripción de la secretaría.'
                              ]);

  if (ModoABM = maModificacion) and (sdqConsulta.fieldbyname('SC_CODIGOSRT').AsString <> edCodigoSrt.Text) then
    Verificar(ExisteSql('SELECT 1 FROM legales.ljt_juicioentramite WHERE jt_idsecretaria = '+SqlValue(edNroSec.Text)+
                        '   AND jt_fechaexport IS NOT NULL '), edCodigoSrt,'No puede cambiar el codigo Srt se encuentra en un juicio exportado.');


end;

procedure TfrmABMSecretaria.sdqConsultaBeforeOpen(DataSet: TDataSet);
begin
  sdqConsulta.ParamByName('SC_IDJUZGADO').Value := FIdJuzgado;
  inherited;
end;

end.
