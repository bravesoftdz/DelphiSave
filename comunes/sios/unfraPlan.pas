{ CTB_TABLAS }
unit unfraPlan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, ArtComboBox, StdCtrls, PatternEdit, Db, SDEngine;

type
  TfraPlan = class(TFrame)
    cmbDescripcion: TArtComboBox;
    edCodigo: TPatternEdit;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sdqDatosID_PLAN: TStringField;
    sdqDatosCOD_PLAN: TStringField;
    sdqDatosPORCENTAJE_FARMACIA: TFloatField;
    sdqDatosDESC_PLAN: TStringField;
    sdqDatosCALCULA_CUOTA_MENSUAL: TStringField;
    sdqDatosFECHA_BAJA: TDateTimeField;
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FOnChange  : TNotifyEvent;
    FShowBajas : Boolean;
    FSql       : String;
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    function GetSql: String;
    function GetValue: String;
    procedure SetValue(const Value: String);
  protected
    function  SqlWhere : String;
  public
    procedure Limpiar;
    procedure DoLostFocus;
    procedure Cargar( ACodigo : String; OnlyValids : Boolean = False );
    procedure SetColors( AColor : TColor);
  published
    property  ShowBajas  : Boolean      read FShowBajas   write FShowBajas;
    Property  OnChange   : TNotifyEvent read FOnChange    write FOnChange;
    Property  Modified   : Boolean      read GetModified  write SetModified;
    Property  Sql        : String       read GetSql       write FSql;
    property  Value      : String       read GetValue     write SetValue;
  end;

implementation

{$R *.DFM}

uses unDmPrincipal, General, SqlServer;

Const
    OrderBy = ' ORDER BY DESC_PLAN';

{----------------------------------------------------------------------------------------------------------------------}
{ TfraSubPrestacion }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPlan.Cargar(ACodigo: String; OnlyValids : Boolean = False );
Var sSql : String;
begin
     sSql := GetSql + SqlWhere + ' AND ID_PLAN = ''' + ACodigo + '''' ;

     if OpenQuery(sdqDatos, sSql, True) Then
        cmbDescripcionCloseUp( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPlan.DoLostFocus;
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
function TfraPlan.GetModified: Boolean;
begin
    Result := edCodigo.Modified or cmbDescripcion.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPlan.Limpiar;
begin
    edCodigo.Text       := '';
    cmbDescripcion.Text := '';

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPlan.SetColors(AColor: TColor);
begin
    edCodigo.Font.Color       := AColor;
    cmbDescripcion.Font.Color := AColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPlan.SetModified(const Value: Boolean);
begin
    edCodigo.Modified       := Value ;
    cmbDescripcion.Modified := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPlan.SqlWhere: String;
begin
     Result := IIF(FShowBajas, '', ' AND FECHA_BAJA IS NULL ');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPlan.cmbDescripcionDropDown(Sender: TObject);
Var Sql : String;
begin
      if (sdqDatos.Active and (sdqDatosDESC_PLAN.AsString = cmbDescripcion.Text) or (cmbDescripcion.Text = '')) Then
          Sql := GetSql + SqlWhere + OrderBy
      else
          Sql := GetSql +
                 ' AND UPPER(DESC_PLAN) LIKE UPPER(' + SQL_QUOTE + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE + ') ' +
                 SqlWhere + OrderBy;

      OpenQuery(sdqDatos, Sql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPlan.cmbDescripcionCloseUp(Sender: TObject);
begin
    edCodigo.Text       := sdqDatosCOD_PLAN.AsString ;
    cmbDescripcion.Text := sdqDatosDESC_PLAN.AsString ;
    if sdqDatosFECHA_BAJA.IsNull Then
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
procedure TfraPlan.edCodigoKeyPress(Sender: TObject; var Key: Char);
Var Sql : String;
begin
     if Key = #13 Then begin
        Sql := GetSql +
               ' AND COD_PLAN = ' + SQL_QUOTE + edCodigo.Text + SQL_QUOTE +
               SqlWhere;
        if OpenQuery(sdqDatos, Sql, True) Then
           cmbDescripcionCloseUp( Sender );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPlan.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (sdqDatosFECHA_BAJA.IsNull) Then
     AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPlan.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text = '') Then
        cmbDescripcion.Text := ''
     else begin
        if (edCodigo.Text <> sdqDatosCOD_PLAN.AsString) Then
            Cargar( edCodigo.Text, True )
        else
            cmbDescripcion.Text := sdqDatosDESC_PLAN.AsString ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPlan.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key = VK_DOWN) and (ssAlt in Shift) then
        cmbDescripcion.DoDropDown ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPlan.GetSql: String;
begin
  if FSql = '' Then
    Result := 'SELECT ID_PLAN, COD_PLAN, PORCENTAJE_FARMACIA, DESC_PLAN, CALCULA_CUOTA_MENSUAL, FECHA_BAJA ' +
                'FROM PLANES ' +
               'WHERE 1=1 '
  else
     Result := FSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPlan.GetValue: String;
begin
     FrameExit( Nil );
     Result := sdqDatosID_PLAN.AsString ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPlan.SetValue(const Value: String);
begin
     Cargar( Value, False );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
