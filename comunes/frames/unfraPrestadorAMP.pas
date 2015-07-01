unit unfraPrestadorAMP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, ArtComboBox, StdCtrls, PatternEdit, Db, SDEngine, IntEdit;

type
  TfraPrestadorAMP = class(TFrame)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    cmbDescripcion: TArtComboBox;
    sdqDatosPR_CODIGO: TFloatField;
    sdqDatosPR_NOMBRE: TStringField;
    sdqDatosDOMICILIO: TStringField;
    sdqDatosPR_LOCALIDAD: TStringField;
    sdqDatosPROVINCIA: TStringField;
    sdqDatosPR_CPOSTAL: TStringField;
    sdqDatosPR_FECHABAJA: TDateTimeField;
    edCodigo: TIntEdit;
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FShowBajas: Boolean;
    FOnChange: TNotifyEvent;
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
  public
    procedure Limpiar;
    procedure DoLostFocus;
    procedure Cargar( ACodigo : String ; OnlyValids : Boolean = False );
    procedure SetColors( AColor : TColor; ABackGround : TColor = -1);
    function IsSelected : Boolean ;
  published
    property  ShowBajas  : Boolean      read FShowBajas;
    Property  OnChange   : TNotifyEvent read FOnChange    write FOnChange;
    Property  Modified   : Boolean      read GetModified  write SetModified;
  end;

implementation

{$R *.DFM}

uses unDmPrincipal, General;

Const
    BaseSql = 'SELECT PR_CODIGO, PR_NOMBRE, ' +
              'INITCAP(UTILES.ARMAR_DOMICILIO(PR_CALLE, PR_NUMERO, PR_PISO, PR_DEPARTAMENTO)) DOMICILIO, ' +
              'INITCAP(PR_LOCALIDAD) PR_LOCALIDAD, INITCAP(PV_DESCRIPCION) PROVINCIA, PR_CPOSTAL, PR_FECHABAJA ' +
              'FROM CPV_PROVINCIAS, APR_PRESTADORES ' +
              'WHERE PR_PROVINCIA = PV_CODIGO(+) ';

    OrderBy = ' ORDER BY PR_NOMBRE';

{----------------------------------------------------------------------------------------------------------------------}
{ TfraPrestadorAMP }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMP.Cargar(ACodigo: String ; OnlyValids : Boolean = False );
Var Sql : String;
begin
     Sql := BaseSql + ' AND PR_CODIGO = ''' + ACodigo + '''' ; // Permite Cargar dados de Baja

     if OnlyValids Then
        Sql := Sql + IIF(FShowBajas, '', ' AND PR_FECHABAJA IS NULL');

     if OpenQuery(sdqDatos, Sql, True) Then
        cmbDescripcionCloseUp( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMP.DoLostFocus;
begin
    if edCodigo.Focused or cmbDescripcion.Focused Then begin // Self.Focused
       cmbDescripcion.SetFocus ;
       SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestadorAMP.GetModified: Boolean;
begin
    Result := edCodigo.Modified or cmbDescripcion.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMP.Limpiar;
begin
    edCodigo.Text       := '';
    cmbDescripcion.Text := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMP.SetColors( AColor : TColor; ABackGround : TColor = -1);
begin
    edCodigo.Font.Color       := AColor;
    cmbDescripcion.Font.Color := AColor;

    if ABackGround <> -1 then begin
       edCodigo.Color       := ABackGround;
       cmbDescripcion.Color := ABackGround;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMP.SetModified(const Value: Boolean);
begin
    edCodigo.Modified       := Value ;
    cmbDescripcion.Modified := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMP.cmbDescripcionCloseUp(Sender: TObject);
begin
    edCodigo.Text       := sdqDatosPR_CODIGO.AsString ;
    cmbDescripcion.Text := sdqDatosPR_NOMBRE.AsString ;
    if sdqDatosPR_FECHABAJA.IsNull Then
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
procedure TfraPrestadorAMP.edCodigoKeyPress(Sender: TObject; var Key: Char);
Var Sql : String;
begin
     if Key = #13 Then begin
        Sql := BaseSql +
               ' AND PR_CODIGO = ''' + edCodigo.Text + '''' +
               IIF(FShowBajas,'', ' AND PR_FECHABAJA IS NULL');
        if OpenQuery(sdqDatos, Sql, True) Then
           cmbDescripcionCloseUp( Sender );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMP.cmbDescripcionDropDown(Sender: TObject);
Var Sql : String;
begin
      if (sdqDatos.Active and (sdqDatosPR_NOMBRE.AsString = cmbDescripcion.Text)) Then
          Sql := BaseSql + OrderBy
      else
          Sql := BaseSql +
                 ' AND UPPER(PR_NOMBRE) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' +
                 IIF(FShowBajas,'', ' AND PR_FECHABAJA IS NULL') +
                 OrderBy;

      OpenQuery(sdqDatos, Sql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMP.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if not sdqDatosPR_FECHABAJA.IsNull Then
        AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMP.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text <> '') Then begin
        if (edCodigo.Text <> sdqDatosPR_CODIGO.AsString) Then
            Cargar( edCodigo.Text, True )
        else
            cmbDescripcion.Text := sdqDatosPR_NOMBRE.AsString ;
     end else
        cmbDescripcion.Text := '' ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMP.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key = VK_DOWN) and (Shift = [ssAlt]) Then
        cmbDescripcion.DoDropDown ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestadorAMP.IsSelected: Boolean;
begin
     Result := (edCodigo.Text <> '');
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
