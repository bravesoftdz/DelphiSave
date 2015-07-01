unit unManTipoDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmManTipoDocumento = class(TfrmCustomGridABM)
    fraTipoDocumentoABM: TfraCodDesc;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edClaseABM: TEdit;
    edCodigoABM: TEdit;
    edDescripcionABM: TEdit;
    GroupBox1: TGroupBox;
    fraTipoDocumento: TfraCodDesc;
    Label1: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManTipoDocumento: TfrmManTipoDocumento;

implementation

uses
  General, CustomDlgs, unArt, unSesion, AnsiSql, SqlFuncs, unDmPrincipal,
  unCustomConsulta;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TfrmManTipoDocumento.ClearControls;
begin
  fraTipoDocumentoABM.Clear;
  edClaseABM.Clear;
  edCodigoABM.Clear;
  edDescripcionABM.Clear;
end;
{------------------------------------------------------------------------------}
function TfrmManTipoDocumento.DoABM: Boolean;
var
  TDIId: TTableId;
begin
  Sql.Clear;
  Sql.TableName := 'sin.std_tipodocumento';

  TDIId := ART_EMPTY_ID;

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    TDIId := sdqConsulta.FieldByName('td_id').AsInteger;

    Sql.Fields.Add ('td_usubaja',   Sesion.UserID);
    Sql.Fields.Add ('td_fechabaja', SQL_ACTUALDATE, False);
  end
  else begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      TDIId       := GetSecNextVal('sin.seq_std_id');

      Sql.Fields.Add ('td_usualta',   Sesion.UserID);
      Sql.Fields.Add ('td_fechaalta', SQL_ACTUALDATE, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      TDIId       := sdqConsulta.FieldByName('td_id').AsInteger;

      Sql.Fields.Add ('td_usubaja',    '');
      Sql.Fields.Add ('td_fechabaja',  0, True);
      Sql.Fields.Add ('td_usumodif',   Sesion.UserID);
      Sql.Fields.Add ('td_fechamodif', SQL_ACTUALDATE, False);
    end;

    Sql.Fields.Add('td_idorigen',     fraTipoDocumentoABM.Value);
    Sql.Fields.Add('td_codigo',       edCodigoABM.Text);
    Sql.Fields.Add('td_clase',        edClaseABM.Text);
    Sql.Fields.Add('td_descripcion',  edDescripcionABM.Text);
  end;

  Sql.PrimaryKey.Add('td_id', TDIId, False);

  Result := inherited DoABM;
end;
{------------------------------------------------------------------------------}
procedure TfrmManTipoDocumento.LoadControls;
begin
  fraTipoDocumentoABM.Value := sdqConsulta.fieldbyname('oc_id').AsInteger;
  edClaseABM.Text           := sdqConsulta.fieldbyname('td_clase').AsString;
  edCodigoABM.Text          := sdqConsulta.fieldbyname('td_codigo').AsString;
  edDescripcionABM.Text     := sdqConsulta.fieldbyname('td_descripcion').AsString;
end;
{------------------------------------------------------------------------------}
function TfrmManTipoDocumento.Validar: Boolean;
begin
  Verificar(fraTipoDocumentoABM.IsEmpty, fraTipoDocumentoABM.edCodigo, 'Debe ingresar un tipo de documento.');
  Verificar((fraTipoDocumentoABM.sdqDatos.FieldByName('oc_manual').AsString = 'N') and
            (Trim(edClaseABM.Text) = ''), edClaseABM,
            'Para este tipo de documento debe ingresar la clase.');
  Verificar((fraTipoDocumentoABM.sdqDatos.FieldByName('oc_manual').AsString = 'S') and
            (Trim(edClaseABM.Text) <> ''), edClaseABM,
            'Para este tipo de documento no debe ingresar la clase.');
  Verificar((Trim(edClaseABM.Text) <> '') and not(AreIn(edClaseABM.Text, ['R','M','I','P', 'O'])), edClaseABM,
            'La clase de documento ingresada no es correcta (R=Reintegro, P= Pago directo, M=Mortal, I= Incapacidades, O=Otros).');
  Verificar((Trim(edCodigoABM.Text) = ''), edCodigoABM, 'Debe ingresar el código.');
  Verificar((Trim(edDescripcionABM.Text) = ''), edDescripcionABM, 'Debe ingresar la descripción.');

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmManTipoDocumento.FormCreate(Sender: TObject);
begin
  ShowActived := False;
  FieldBaja   := 'td_fechabaja';
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmManTipoDocumento.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := ' SELECT td_id, td_codigo, td_descripcion, td_clase, oc_descripcion, td_fechabaja, oc_id, ' +
                 ' DECODE(td_clase, ''R'', ''Reintegro'', ''P'', ''Pago directo'', ''I'', ''Incapacidades'', ' +
                 ' ''M'', ''Mortales'', ''O'', ''Otros'') clase ' +
            ' FROM SIN.std_tipodocumento, SIN.soc_origencasosdocum ' +
           ' WHERE td_idorigen = oc_id ' ;

  if not fraTipoDocumento.IsEmpty then
    sSql := sSql + ' AND td_idorigen = ' + SqlInt(fraTipoDocumento.Value);
                
  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;  
  inherited;
end;
{------------------------------------------------------------------------------}
end.
