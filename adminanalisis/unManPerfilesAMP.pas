{-----------------------------------------------------------------------------
 Unit Name: unManPerfilesAMP
 Author:    racastro
 Date:      26-Jun-2008
 Purpose:   Mantenimiento de Perfiles AMP
 History:
-----------------------------------------------------------------------------}

unit unManPerfilesAMP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, DBTables, Mask, PatternEdit, DBIncrementalSearch;

type
  TfrmManPerfilesAMP = class(TfrmCustomGridABM)
    Label1: TLabel;
    edCodigo: TPatternEdit;
    edDescripcion: TEdit;
    Label2: TLabel;
    dbiBusqueda: TDBIncrementalSearch;
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmManPerfilesAMP: TfrmManPerfilesAMP;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs;

{$R *.DFM}

{-----------------------------------------------------------------------------
  Procedure: ClearControls
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmManPerfilesAMP.ClearControls;
begin
  edCodigo.Clear;
  edDescripcion.Clear;
end;

{-----------------------------------------------------------------------------
  Procedure: DoABM
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: None
  Result:    Boolean
-----------------------------------------------------------------------------}

function TfrmManPerfilesAMP.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('pa_id', sdqConsulta.FieldByName('pa_id').AsString);
    Sql.Fields.Add('pa_usubaja', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('pa_fechabaja', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('pa_id', GetSecNextVal('hys.seq_hpa_id'));
      Sql.Fields.Add('pa_usualta', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('pa_fechaalta', exDateTime);
    end
    else
    begin
      Sql.PrimaryKey.Add('pa_id', sdqConsulta.FieldByName('pa_id').AsString);
      Sql.Fields.Add('pa_usumodif', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('pa_fechamodif', exDateTime);
      Sql.Fields.Add('pa_usubaja', exNull);
      Sql.Fields.Add('pa_fechabaja', exNull);
    end;

    Sql.Fields.Add('pa_descripcion', edDescripcion.Text);
  end;
  Result := inherited DoABM;
end;

{-----------------------------------------------------------------------------
  Procedure: LoadControls
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmManPerfilesAMP.LoadControls;
begin
  edCodigo.Text      := sdqConsulta.FieldByName('pa_id').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('pa_descripcion').AsString;
end;

{-----------------------------------------------------------------------------
  Procedure: Validar
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: None
  Result:    Boolean
-----------------------------------------------------------------------------}

function TfrmManPerfilesAMP.Validar: Boolean;
begin
  Result := False;
  if IsEmptyString(edDescripcion.Text) Then
    InvalidMsg(edDescripcion, 'Debe ingresar la Descripción')
  else
    Result := True;
end;

{-----------------------------------------------------------------------------
  Procedure: FormCreate
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmManPerfilesAMP.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hpa_perfilamp';
  FieldBaja := 'pa_fechabaja';
  CheckPK := True;
end;

end.
