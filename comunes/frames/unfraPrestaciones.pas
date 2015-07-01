{ MPR_PRESTACIONES }
unit unfraPrestaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, ArtComboBox, StdCtrls, Db, SDEngine ;

type
  TfraPrestacion = class(TFrame)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    edCodigo: TEdit;
    cmbDescripcion: TArtComboBox;
    sdqDatosPR_CODIGO: TStringField;
    sdqDatosPR_DESCRIPCION: TStringField;
    sdqDatosPR_DIASEVO: TFloatField;
    sdqDatosPR_FBAJA: TDateTimeField;
    sdqDatosPR_FORMULARIO: TStringField;
    sdqDatosPR_DIASEVOP: TFloatField;
    sdqDatosPR_GTRABAJO: TStringField;
    sdqDatosPR_REQUIERETURNOS: TStringField;
    sdqDatosPR_MULTIPLESPRESTACIONES: TStringField;
    sdqDatosPR_EXIGETURNO: TStringField;
    sdqDatospr_canttiempo: TStringField;
    sdqDatosPR_PERMITEESPERA: TStringField;
    sdqDatospr_presupuestos: TStringField;
    sdqDatosPR_EXCLUYEVALIDFECHAS: TStringField;
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FShowBajas, FModoCarga :Boolean;
    FOnChange: TNotifyEvent;
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
  protected
    function  SqlWhere : String;
  public
    procedure Limpiar;
    procedure DoLostFocus;
    procedure Cargar( ACodigo : String; OnlyValids : Boolean = False );
    procedure SetColors( AColor : TColor);
    procedure AfterConstruction; override;
  published
    property  ShowBajas  : Boolean      read FShowBajas   write FShowBajas;
    Property  OnChange   : TNotifyEvent read FOnChange    write FOnChange;
    Property  Modified   : Boolean      read GetModified  write SetModified;
    property  ModoCarga  : Boolean      read FModoCarga   write FModoCarga;
  end;

implementation

uses unDmPrincipal, General;


Const
  BaseSql = 'SELECT pr_codigo, pr_descripcion, pr_diasevo, pr_formulario, ' +
                  ' pr_fbaja, pr_diasevop, pr_gtrabajo, pr_requiereturnos, ' +
                  ' pr_multiplesprestaciones, pr_exigeturno, pr_canttiempo, ' +
                  ' pr_permiteespera, pr_presupuestos, pr_excluyevalidfechas ' +
             ' FROM mpr_prestaciones WHERE 1=1 ';
  OrderBy = ' ORDER BY pr_descripcion';

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
{ TfraPrestacion }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestacion.Cargar(ACodigo: String; OnlyValids: Boolean);
var sSql : String;
begin
  sSql := BaseSql + SqlWhere + ' AND PR_CODIGO = ''' + ACodigo + '''' ;

  if OpenQuery(sdqDatos, sSql, True) then
    cmbDescripcionCloseUp(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestacion.DoLostFocus;
begin
  try
    if edCodigo.Focused or cmbDescripcion.Focused then
    begin // Self.Focused
       cmbDescripcion.SetFocus;
       SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  except
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestacion.GetModified: Boolean;
begin
  Result := edCodigo.Modified or cmbDescripcion.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestacion.Limpiar;
begin
  edCodigo.Text       := '';
  cmbDescripcion.Text := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestacion.SetColors(AColor: TColor);
begin
  edCodigo.Font.Color       := AColor;
  cmbDescripcion.Font.Color := AColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestacion.SetModified(const Value: Boolean);
begin
  edCodigo.Modified       := Value ;
  cmbDescripcion.Modified := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestacion.SqlWhere: String;
begin
  Result := IIF(FShowBajas   , '', ' AND PR_FBAJA IS NULL ') +
            IIF(FModoCarga   , ' AND PR_AUTOMATICO = ''N'' ', '') ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestacion.cmbDescripcionDropDown(Sender: TObject);
var Sql : String;
begin
  if (sdqDatos.Active and (sdqDatosPR_DESCRIPCION.AsString = cmbDescripcion.Text) or (cmbDescripcion.Text = '')) then
      Sql := BaseSql + SqlWhere + OrderBy
  else
      Sql := BaseSql +
             ' AND UPPER(PR_DESCRIPCION) LIKE UPPER(''' + cmbDescripcion.Text + '%'') ' +
             SqlWhere + OrderBy;

  OpenQuery(sdqDatos, Sql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestacion.cmbDescripcionCloseUp(Sender: TObject);
begin
  edCodigo.Text       := sdqDatosPR_CODIGO.AsString ;
  cmbDescripcion.Text := sdqDatosPR_DESCRIPCION.AsString ;
  if sdqDatosPR_FBAJA.IsNull then
     SetColors(clWindowText)
  else
     SetColors(clRed);

  if Assigned(Sender) then
  begin
     if Assigned(FOnChange) then
        OnChange(Self);

     if (edCodigo.Text <> '') then
        DoLostFocus;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestacion.edCodigoKeyPress(Sender: TObject; var Key: Char);
var Sql : String;
begin
   if Key = #13 then
   begin
      Sql := BaseSql +
             ' AND PR_CODIGO = ''' + edCodigo.Text + '''' +
             SqlWhere;
      if OpenQuery(sdqDatos, Sql, True) then
         cmbDescripcionCloseUp(Sender);
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestacion.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqDatosPR_FBAJA.IsNull then AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestacion.FrameExit(Sender: TObject);
begin
   if (edCodigo.Text = '') then
      cmbDescripcion.Text := ''
   else begin
      if (edCodigo.Text <> sdqDatosPR_CODIGO.AsString) then
        Cargar(edCodigo.Text, True)
      else
        cmbDescripcion.Text := sdqDatosPR_DESCRIPCION.AsString;
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestacion.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbDescripcion.DoDropDown;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestacion.AfterConstruction;
begin
  inherited;
  cmbDescripcion.DataSource := dsDatos;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
