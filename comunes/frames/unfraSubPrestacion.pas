{ CTB_TABLAS CLAVE: SUBPR }
unit unfraSubPrestacion;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, ArtComboBox, StdCtrls, PatternEdit, Db, SDEngine;

type
  TfraSubPrestacion = class(TFrame)
    cmbDescripcion: TArtComboBox;
    edCodigo: TPatternEdit;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sdqDatosTB_CODIGO: TStringField;
    sdqDatosTB_DESCRIPCION: TStringField;
    sdqDatosTB_ESPECIAL1: TStringField;
    sdqDatosTB_BAJA: TStringField;
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FOnChange: TNotifyEvent;
    FShowBajas: Boolean;
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
  end;

implementation

{$R *.DFM}

uses unDmPrincipal, General;

Const
    BaseSql = 'SELECT TB_CODIGO, TB_DESCRIPCION, TB_BAJA, TB_ESPECIAL1 ' +
                'FROM CTB_TABLAS ' +
               'WHERE TB_CLAVE = ''SUBPR'' ' +
                  'AND TB_CODIGO <> ''0'' ' ;
    OrderBy = ' ORDER BY TB_DESCRIPCION';

{----------------------------------------------------------------------------------------------------------------------}
{ TfraSubPrestacion }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSubPrestacion.Cargar(ACodigo: String; OnlyValids : Boolean = False );
Var sSql : String;
begin
     sSql := BaseSql + SqlWhere + ' AND TB_CODIGO = ''' + ACodigo + '''' ;

     if OpenQuery(sdqDatos, sSql, True) Then
        cmbDescripcionCloseUp( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSubPrestacion.DoLostFocus;
begin
    Try
      if edCodigo.Focused or cmbDescripcion.Focused Then begin // Self.Focused
         cmbDescripcion.SetFocus ;
         SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
      end;
    Except
    End;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraSubPrestacion.GetModified: Boolean;
begin
    Result := edCodigo.Modified or cmbDescripcion.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSubPrestacion.Limpiar;
begin
    edCodigo.Text       := '';
    cmbDescripcion.Text := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSubPrestacion.SetColors(AColor: TColor);
begin
    edCodigo.Font.Color       := AColor;
    cmbDescripcion.Font.Color := AColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSubPrestacion.SetModified(const Value: Boolean);
begin
    edCodigo.Modified       := Value ;
    cmbDescripcion.Modified := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraSubPrestacion.SqlWhere: String;
begin
     Result := IIF(FShowBajas   , '', ' AND TB_BAJA <> ''S'' ');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSubPrestacion.cmbDescripcionDropDown(Sender: TObject);
Var Sql : String;
begin
      if (sdqDatos.Active and (sdqDatosTB_DESCRIPCION.AsString = cmbDescripcion.Text) or (cmbDescripcion.Text = '')) Then
          Sql := BaseSql + SqlWhere + OrderBy
      else
          Sql := BaseSql +
                 ' AND UPPER(TB_DESCRIPCION) LIKE UPPER(''' + cmbDescripcion.Text + '%'') ' +
                 SqlWhere + OrderBy;

      OpenQuery(sdqDatos, Sql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSubPrestacion.cmbDescripcionCloseUp(Sender: TObject);
begin
    edCodigo.Text       := sdqDatosTB_CODIGO.AsString ;
    cmbDescripcion.Text := sdqDatosTB_DESCRIPCION.AsString ;
    if sdqDatosTB_BAJA.AsString <> 'S' Then
       SetColors(clWindowText)
    else
       SetColors(clRed);

    if Assigned(Sender) Then begin
       if Assigned(FOnChange) Then
          OnChange( Self );

       if (edCodigo.Text <> '') Then
          DoLostFocus;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSubPrestacion.edCodigoKeyPress(Sender: TObject; var Key: Char);
Var Sql : String;
begin
     if Key = #13 Then begin
        Sql := BaseSql +
               ' AND TB_CODIGO = ''' + edCodigo.Text + '''' +
               SqlWhere;
        if OpenQuery(sdqDatos, Sql, True) Then
           cmbDescripcionCloseUp( Sender );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSubPrestacion.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if sdqDatosTB_BAJA.AsString = 'S' Then
        AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSubPrestacion.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text = '') Then
        cmbDescripcion.Text := ''
     else begin
        if (edCodigo.Text <> sdqDatosTB_CODIGO.AsString) Then
            Cargar( edCodigo.Text, True )
        else
            cmbDescripcion.Text := sdqDatosTB_DESCRIPCION.AsString ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSubPrestacion.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key = VK_DOWN) and (ssAlt in Shift) then
        cmbDescripcion.DoDropDown ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSubPrestacion.AfterConstruction;
begin
  inherited;
  cmbDescripcion.DataSource := dsDatos;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
