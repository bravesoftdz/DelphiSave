unit unFraNormaLegal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, PatternEdit, unArtFrame, unFraCodigoDescripcionExt,
  ComCtrls, ToolWin, ToolEdit, unFraCodigoDescripcion, FormPanel, DB,
  SDEngine, DateComboBox, IntEdit, unArtDBAwareFrame;

type
  TfraNormaLegal = class(TFrame)
    fraNorma: TfraCodigoDescripcionExt;
    lblDescripcionSentencia: TLabel;
    fraNombreNorma: TfraCodigoDescripcionExt;
    lblNombre: TLabel;
    lblArticulo: TLabel;
    edInciso: TPatternEdit;
    edDescripcion: TPatternEdit;
    lblNro: TLabel;
    lblInciso: TLabel;
    lblFechaNorma: TLabel;
    lblFechaPublicacion: TLabel;
    lblFechaDerogacion: TLabel;
    fpTexto: TFormPanel;
    mTexto: TMemo;
    tbExporarTextoNorma: TToolBar;
    tbHistoricoEstados: TToolButton;
    edFechaNorma: TDateComboBox;
    edFechaPublicacion: TDateComboBox;
    edFechaDerogacion: TDateComboBox;
    edArticulo: TIntEdit;
    Label1: TLabel;
    edApartado: TPatternEdit;
    Label2: TLabel;
    edanexo: TPatternEdit;
    procedure tbHistoricoEstadosClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeNorma(Sender: TObject);
    procedure ChangeTipoNorma(Sender: TObject);
    function GetIsSelected : boolean;
    function GetIdTipoNorma : integer;
    function GetArticulo : integer;
    function GetIdNorma : integer;
    function GetInciso : String;
    function GetAnexo: string;
    function GetApartado: string;
    procedure SetArticulo(const Value: integer);
    procedure SetAnexo(const Value: string);
    procedure SetApartado(const Value: string);
    procedure SetInciso(const Value: string);
    procedure SetIdTipoNorma(const Value: integer);
  public
    { Public declarations }
    procedure Init;
    procedure Limpiar;
    procedure Cargar(AIdSumario : Integer);
    function  Validar : boolean;
    property IsSelected : boolean read GetIsSelected;
    property IdTipoNorma : integer read GetIdTipoNorma write SetIdTipoNorma;
    property IdNorma : integer read GetIdNorma;
    property Articulo : integer read GetArticulo write SetArticulo;
    property Inciso : string read GetInciso write SetInciso;
    property Apartado : string read GetApartado write SetApartado;
    property Anexo : string read GetAnexo write SetAnexo;
  end;

implementation

uses unDmPrincipal, AnsiSql, SqlFuncs, StrFuncs, CustomDlgs;

{$R *.dfm}

procedure TfraNormaLegal.Limpiar;
begin
  fraNorma.Codigo := '';
  fraNombreNorma.Codigo := '';
  edArticulo.Text := '';
  edInciso.Text := '';
  edanexo.Text := '';
  edApartado.Text := '';
  edDescripcion.Text := '';
  edFechaNorma.Date := 0;
  edFechaPublicacion.Date := 0;
  edFechaDerogacion.Date :=  0;
  mTexto.Text := '';
end;

procedure TfraNormaLegal.Init;
begin
  with fraNorma do
  begin
    TableName   := 'legales.ltn_tiponorma';
    FieldID     := 'tn_id';
    FieldCodigo := 'tn_id';
    FieldDesc   := 'tn_descripcion';
    OnChange := ChangeTipoNorma;
    ShowBajas := false;
  end;

  with fraNombreNorma do
  begin
    TableName   := 'legales.lno_norma';
    FieldID     := 'no_id';
    FieldCodigo := 'no_id';
    FieldDesc   := 'no_nro';
    FieldBaja   := 'no_fechabaja';
    ExtraCondition := ' and 1 = 2 ';
    ExtraFields := ' ,no_descripcion, NO_FECHANORMA, NO_FECHAPUBLICACION, NO_FECHADEROGACION, NO_TEXTONORMA, NO_CANTIDADARTICULOS ';
//    OrderBy := ' no_nro ';
    OnChange := ChangeNorma;
    ShowBajas := false;
  end;

  Limpiar;
end;


procedure TfraNormaLegal.ChangeTipoNorma(Sender: TObject);
begin
  fraNombreNorma.Limpiar;
  edDescripcion.Text := '';
  edFechaNorma.Date := 0;
  edFechaPublicacion.Date := 0;
  edFechaDerogacion.Date :=  0;

  if fraNorma.IsSelected  then
    fraNombreNorma.ExtraCondition := ' and no_idtiponorma = ' + fraNorma.Codigo
  else
  begin
    fraNombreNorma.ExtraCondition := ' and 1 = 2 ';
    fraNombreNorma.Codigo := '';
  end;

end;

procedure TfraNormaLegal.ChangeNorma(Sender: TObject);
begin
  if fraNombreNorma.IsSelected  then
  begin
    edDescripcion.Text := fraNombreNorma.sdqDatos.FieldByName('NO_DESCRIPCION').AsString;
    edFechaNorma.Date := fraNombreNorma.Fields.FieldByName('NO_FECHANORMA').AsDateTime;
    edFechaPublicacion.Date := fraNombreNorma.Fields.FieldByName('NO_FECHAPUBLICACION').AsDateTime;
    edFechaDerogacion.Date :=  fraNombreNorma.Fields.FieldByName('NO_FECHADEROGACION').AsDateTime;
    edArticulo.MaxValue := fraNombreNorma.Fields.FieldByName('NO_CANTIDADARTICULOS').AsInteger;
  end
  else
  begin
    edDescripcion.Text := '';
    edFechaNorma.Date := 0;
    edFechaPublicacion.Date := 0;
    edFechaDerogacion.Date :=  0;

  end;

end;




procedure TfraNormaLegal.tbHistoricoEstadosClick(Sender: TObject);
begin
  if fraNombreNorma.IsSelected then
  if IsEmptyString(fraNombreNorma.Fields.FieldByName('no_textonorma').AsString) then
       mTexto.Text := fraNombreNorma.Fields.FieldByName('no_textonorma').AsString
  else mTexto.Text := 'Texto de Norma No Cargada.';

  fpTexto.ShowModal;

end;

procedure TfraNormaLegal.Cargar(AIdSumario: Integer);
var
 Query : TSDQuery;
begin
  Query := GetQuery('select * from legales.lrs_reclamosumario lrs, legales.lno_norma lno ' +
                    ' where lrs.rs_idnorma = lno.no_id ' +
                    '   and rs_id = ' + SqlValue(AIdSumario));
  try
    if Query.RecordCount > 0 then
    begin
      fraNorma.Codigo := Query.FieldByName('no_idtiponorma').AsString;
      ChangeTipoNorma(self);
      fraNombreNorma.Codigo := Query.FieldByName('rs_idnorma').AsString;
      ChangeNorma(self);
      edArticulo.Text := Query.FieldByName('rs_articulo').AsString;
      edInciso.Text := Query.FieldByName('rs_inciso').AsString;
      edanexo .Text := Query.FieldByName('rs_anexo').AsString;
      edApartado.Text := Query.FieldByName('rs_apartado').AsString;

      Query.Close;
    end else raise Exception.Create('No se encuentra la norma citada.');
  finally
      Query.Free;
  end;
end;

function TfraNormaLegal.GetIsSelected : boolean;
begin
  result := (fraNorma.IsSelected and fraNombreNorma.IsSelected and
             Not IsEmptyString(edArticulo.text) and Not IsEmptyString(edInciso.text));
end;


function TfraNormaLegal.GetArticulo: integer;
begin
  if not IsEmptyString(edArticulo.Text) then
       result := edArticulo.Value
  else result := 0;
end;

function TfraNormaLegal.GetIdNorma: integer;
begin
 if fraNombreNorma.IsSelected then
   result :=  StrToInt(fraNombreNorma.Codigo)
 else result := 0;
end;

function TfraNormaLegal.GetIdTipoNorma: integer;
begin
 if fraNorma.IsSelected then
   result :=  StrToInt(fraNorma.Codigo)
 else result := 0;
end;

function TfraNormaLegal.GetInciso: String;
begin
  if not IsEmptyString(edInciso.Text) then
       result := edInciso.Text
  else result := '';

end;

function TfraNormaLegal.GetAnexo: string;
begin
  if not IsEmptyString(edanexo.Text) then
       result := edanexo.Text
  else result := '';
end;

function TfraNormaLegal.GetApartado: string;
begin
  if not IsEmptyString(edApartado.Text) then
       result := edApartado.Text
  else result := '';
end;

function TfraNormaLegal.Validar: boolean;
begin
  VerificarMultiple(['Selección de Norma Legal',
                    fraNorma.edCodigo, fraNorma.IsSelected, 'Debe seleccionar un tipo de norma.',
                    fraNombreNorma.edCodigo, fraNombreNorma.IsSelected, 'Debe seleccionar una norma.']);

  Result := True;
end;

procedure TfraNormaLegal.SetArticulo(const Value: integer);
begin
  edArticulo.Value := value;
end;

procedure TfraNormaLegal.SetAnexo(const Value: string);
begin
  edanexo.Text := value;
end;

procedure TfraNormaLegal.SetApartado(const Value: string);
begin
  edApartado.Text := value;
end;

procedure TfraNormaLegal.SetInciso(const Value: string);
begin
  edInciso.Text := value;
end;

procedure TfraNormaLegal.SetIdTipoNorma(const Value: integer);
begin
  fraNorma.Codigo := IntToStr(Value);
  ChangeTipoNorma(self);
end;

end.
