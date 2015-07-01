unit unManCriticidadSectores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmManCriticidadSectores = class(TfrmCustomGridABM)
    gbSectores: TGroupBox;
    fraSector: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    fraSectorModif: TfraCodigoDescripcion;
    Label1: TLabel;
    rgCriticidadModif: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  public
  protected
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure RefreshData; override;
  end;

var
  frmManCriticidadSectores: TfrmManCriticidadSectores;

implementation

uses
  unConstantArchivo, AnsiSql, VCLExtra, General, CustomDlgs;

{$R *.dfm}

function TfrmManCriticidadSectores.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('SC_ID',     sdqConsulta.FieldByName('SC_ID').AsInteger);
      Sql.Fields.Add('SC_PRIORIDAD',  Decode(IntToStr(rgCriticidadModif.ItemIndex), ['0', '1', '2'], [PRIORSECT_BAJA, PRIORSECT_MEDIA, PRIORSECT_ALTA]));
    end;

  Result := inherited DoABM;
end;

procedure TfrmManCriticidadSectores.LoadControls;
begin
  fraSectorModif.Codigo       := sdqConsulta.FieldByName('SC_CODIGO').AsString;
  rgCriticidadModif.ItemIndex := StrToInt(Decode(sdqConsulta.FieldByName('SC_PRIORIDAD').AsString, [PRIORSECT_BAJA, PRIORSECT_MEDIA, PRIORSECT_ALTA], ['0', '1', '2']));
end;

procedure TfrmManCriticidadSectores.RefreshData;
var
  sSqlWhere, sSql: String;
begin
  sSqlWhere := '';
  
  sSql := 'SELECT SC_ID, SC_CODIGO, SC_DESCRIPCION, SC_PRIORIDAD, SC_FECHABAJA, ' +
                 'DECODE(SC_PRIORIDAD, ' + PRIORSECT_ALTA + ', ''Alta'', ' +
                                           PRIORSECT_MEDIA + ', ''Media'', ' +
                                           PRIORSECT_BAJA + ', ''Baja'') CRITICIDAD ' +
            'FROM USC_SECTORES ' +
           'WHERE SC_FECHABAJA IS NULL ';

  if fraSector.IsSelected then
    sSqlWhere := sSqlWhere + ' AND SC_ID = ' + SqlValue(fraSector.Value);

  sdqConsulta.Sql.Text := sSql + sSqlWhere + SortDialog.OrderBy;
  inherited;
end;

function TfrmManCriticidadSectores.Validar: Boolean;
begin
  Verificar(rgCriticidadModif.ItemIndex = -1, rgCriticidadModif, 'Debe indicar la criticidad.');

  Result := True;
end;

procedure TfrmManCriticidadSectores.FormCreate(Sender: TObject);
begin
  inherited;

  with fraSector do
    begin
      TableName   := 'USC_SECTORES';
      FieldID     := 'SC_ID';
      FieldCodigo := 'SC_CODIGO';
      FieldDesc   := 'SC_DESCRIPCION';
      FieldBaja   := 'SC_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraSectorModif do
    begin
      TableName   := 'USC_SECTORES';
      FieldID     := 'SC_ID';
      FieldCodigo := 'SC_CODIGO';
      FieldDesc   := 'SC_DESCRIPCION';
      FieldBaja   := 'SC_FECHABAJA';
      ShowBajas   := False;
    end;

  VCLExtra.LockControl(fraSectorModif);

  FieldBaja     := 'SC_FECHABAJA';
  Sql.TableName := 'USC_SECTORES';
end;

procedure TfrmManCriticidadSectores.tbLimpiarClick(Sender: TObject);
begin
  fraSector.Clear;

  inherited;
end;

end.
 