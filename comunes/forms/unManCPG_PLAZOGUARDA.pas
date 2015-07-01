unit unManCPG_PLAZOGUARDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmManCPG_PLAZOGUARDA = class(TfrmCustomGridABM)
    Label3: TLabel;
    edPG_DESCRIPCION: TEdit;
    sdqConsultaPG_ID: TFloatField;
    sdqConsultaPG_DESCRIPCION: TStringField;
    sdqConsultaPG_FECHAALTA: TDateTimeField;
    sdqConsultaPG_USUALTA: TStringField;
    sdqConsultaPG_FECHAMODIF: TDateTimeField;
    sdqConsultaPG_USUMODIF: TStringField;
    sdqConsultaPG_FECHABAJA: TDateTimeField;
    sdqConsultaPG_USUBAJA: TStringField;
    ShortCutControlHijo: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure SeguridadAfterExecute(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManCPG_PLAZOGUARDA: TfrmManCPG_PLAZOGUARDA;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, unArt;

{$R *.dfm}

procedure TfrmManCPG_PLAZOGUARDA.ClearControls;
begin
  inherited;
  edPG_DESCRIPCION.Clear;
end;

function TfrmManCPG_PLAZOGUARDA.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('PG_ID', sdqConsulta.FieldByName('PG_ID').AsInteger);
     Sql.Fields.Add('PG_FECHABAJA', exDate);
     Sql.Fields.Add('PG_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('PG_ID', ValorSQLInteger('SELECT NVL(MAX(PG_ID), 0) FROM COMUNES.CPG_PLAZOGUARDA') + 1);
       Sql.Fields.Add('PG_FECHAALTA', exDate);
       Sql.Fields.Add('PG_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('PG_ID', sdqConsulta.FieldByName('PG_ID').AsInteger);
       Sql.Fields.Add('PG_FECHAMODIF', exDate);
       Sql.Fields.Add('PG_USUMODIF', Sesion.UserID);
       Sql.Fields.Add('PG_FECHABAJA', exNull);
       Sql.Fields.Add('PG_USUBAJA', exNull);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('PG_DESCRIPCION', edPG_DESCRIPCION.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCPG_PLAZOGUARDA.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMUNES.CPG_PLAZOGUARDA';
  FieldBaja := 'PG_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmManCPG_PLAZOGUARDA.LoadControls;
begin
  edPG_DESCRIPCION.Text := sdqConsulta.FieldByName('PG_DESCRIPCION').AsString;
end;

procedure TfrmManCPG_PLAZOGUARDA.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManCPG_PLAZOGUARDA.Validar: Boolean;
begin
  Verificar(Trim(edPG_DESCRIPCION.Text) = '', edPG_DESCRIPCION, 'Debe completar la descripción.');
  Result := True;
end;

procedure TfrmManCPG_PLAZOGUARDA.SeguridadAfterExecute(Sender: TObject);
begin
  inherited;
  tbNuevo.Enabled := (Sesion.Sector = 'COMPUTOS') or Seguridad.Activar(tbNuevo);
  tbModificar.Enabled := (Sesion.Sector = 'COMPUTOS') or Seguridad.Activar(tbModificar);
  tbEliminar.Enabled := (Sesion.Sector = 'COMPUTOS') or Seguridad.Activar(tbEliminar);    
end;

procedure TfrmManCPG_PLAZOGUARDA.tbModificarClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.IsEmpty, tbRefrescar, 'Debe seleccionar un registro.');
  if not sdqConsulta.FieldByName(FieldBaja).IsNull then
    if not MsgAsk('El registro seleccionado ha sido dado de baja.' + CRLF + '¿Desea reactivarlo?') then
      Abort;
  inherited;
end;

end.
