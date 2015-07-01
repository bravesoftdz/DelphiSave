
{********************************************************}
{                                                        }
{    FraDireccion (SISTEMAS VIEJOS)                      }
{    Frame para la carga de Domicilios                   }
{                                                        }
{    Autor: Federico Firenze                             }
{                                                        }
{********************************************************}

unit unfraDireccion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntEdit, StdCtrls, Mask, ToolEdit, ArtComboBox, Db, SDEngine, PatternEdit,
  RxToolEdit;

type
  TfraDireccion = class(TFrame)
    cmbCalle: TArtComboBox;
    edNumero: TEdit;
    edPiso: TEdit;
    edDto: TEdit;
    edCPostal: TIntEdit;
    cmbLocalidad: TArtComboBox;
    edProvincia: TEdit;
    lbCalle: TLabel;
    lbNro: TLabel;
    lbPiso: TLabel;
    lbDto: TLabel;
    lbCPostal: TLabel;
    lbCPA: TLabel;
    lbLocalidad: TLabel;
    sdqLocalidad: TSDQuery;
    lbProvincia: TLabel;
    dsLocalidad: TDataSource;
    edCPA: TPatternEdit;
    sdqLocalidadCP_CODIGO: TStringField;
    sdqLocalidadCP_LOCALIDAD: TStringField;
    sdqLocalidadPV_CODIGO: TStringField;
    sdqLocalidadPV_DESCRIPCION: TStringField;
    procedure edCPostalExit(Sender: TObject);
    procedure cmbLocalidadCloseUp(Sender: TObject);
    procedure cmbLocalidadDropDown(Sender: TObject);
    procedure cmbCalleCloseUp(Sender: TObject);
    procedure cmbCalleDropDown(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure cmbCalleExit(Sender: TObject);
  private
    FCheckData : Boolean;
    FModified  : Boolean;
    procedure DoLostFocus;
    function GetProvincia: Integer;
    procedure SetProvincia(const Value: Integer);
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    function GetProvinciaSql: String;
    function GetDomicilio: string;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetColors( AColor : TColor);
    procedure Limpiar ;
    procedure SetBackGroundColor(AColor : TColor; ADisColor : TColor = clBtnFace);
    function IsEmpty : boolean;
    property Domicilio: string read GetDomicilio;
  published
    property  ProvinciaSql : String  read GetProvinciaSql;
    property  Provincia    : Integer read GetProvincia write SetProvincia;
    property  Modified     : Boolean read GetModified  write SetModified;
    property  CheckData    : Boolean read FCheckData   write FCheckData    default True;
  end;

implementation

uses unDmPrincipal, General, strFuncs, AnsiSQL;


Const
     CAPFED = 'CAPITAL FEDERAL';
     MAXCODCAPFED = 1440;
     BaseSql =   'SELECT CP_CODIGO, CP_LOCALIDAD, PV_CODIGO, PV_DESCRIPCION ' +
                 'FROM CCP_CODIGOPOSTAL, CPV_PROVINCIAS ' +
                 'WHERE PV_CODIGO = CP_PROVINCIA ' ;
     BaseOrder = ' ORDER BY CP_LOCALIDAD, PV_DESCRIPCION';


{$R *.DFM}

{ TfraDireccion }
{-[  Limpia los objetos ]----------------------------------------------------------------------------------------------}
procedure TfraDireccion.Limpiar;
begin
    FModified         := False;
    cmbCalle.Text     := '';
    cmbLocalidad.Text := '';
    edNumero.Text     := '';
    edPiso.Text       := '';
    edDto.Text        := '';
    edCPostal.Text    := '';
    edCPA.Text        := '';
    edProvincia.Text  := '';
    edProvincia.Tag   := -1;
    sdqLocalidad.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Exit del Cod.Postal, se fija si es de Cap Fed o Provincia, de acuerdo a eso abre el combo de Calle o Localidad, en ese orden.
procedure TfraDireccion.edCPostalExit(Sender: TObject);
begin
   if edCPostal.Modified and FCheckData then begin
       if( edCPostal.Text = '' ) then begin
            edProvincia.Tag   := -1;
            edProvincia.Text  := '';
            cmbLocalidad.Text := '';
       end else begin
             OpenQuery(sdqLocalidad, BaseSql + 'AND CP_CODIGO = ' + SqlValue(edCPostal.Text) + BaseOrder );
             if sdqLocalidad.IsEmpty Then begin
                MsgBox('No se encontró el código postal ingresado', MB_ICONEXCLAMATION);
                edCPostal.SelectAll ;
                edCPostal.SetFocus ;
             end else if (sdqLocalidad.RecordCount = 1) or (sdqLocalidadPV_DESCRIPCION.AsString = CAPFED) Then begin
                   edProvincia.Tag  := sdqLocalidadPV_CODIGO.AsInteger;
                   edProvincia.Text := sdqLocalidadPV_DESCRIPCION.AsString;

                   if sdqLocalidadPV_DESCRIPCION.AsString = CAPFED Then begin
                       cmbLocalidad.Text := CAPFED;

                       if (cmbCalle.Text <> '') and sdqLocalidad.Locate('CP_LOCALIDAD', cmbCalle.Text, [loCaseInsensitive]) Then begin
                           cmbCalle.Text := sdqLocalidadCP_LOCALIDAD.AsString;
                           DoLostFocus;
                       end else begin
                          cmbCalleDropDown( Nil );// LLama los eventos a mano para poder pasarle el Nil en el Sender
                          cmbCalle.DoDropDown( False );
                       end;

                   end else begin
                       cmbLocalidad.Text := sdqLocalidadCP_LOCALIDAD.AsString;
                       DoLostFocus;
                   end;

             end else
                   cmbLocalidad.DoDropDown( False );
       end;
       FModified          := True;
       edCPostal.Modified := False;
   end;
end;
{--[ Luego de seleccionar la localidad, expando los datos ]------------------------------------------------------------}
procedure TfraDireccion.cmbLocalidadCloseUp(Sender: TObject);
begin
    if (cmbLocalidad.Text <> '') Then begin
        With sdqLocalidad do begin
             edProvincia.Tag  := sdqLocalidadPV_CODIGO.AsInteger;
             edProvincia.Text := sdqLocalidadPV_DESCRIPCION.AsString;
             edCPostal.Value  := sdqLocalidadCP_CODIGO.AsInteger;
        end;
        DoLostFocus;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraDireccion.cmbLocalidadDropDown(Sender: TObject);
Var Sql : String;
begin
    Sql := BaseSql +
           ' AND CP_LOCALIDAD LIKE ''' + Ucase(Trim( cmbLocalidad.Text )) + SQL_WILLCARD + '''' +
           ' AND PV_CODIGO <> ''1'' ' +
           IIF(edCPostal.Text <> '', ' AND CP_CODIGO = ' + SqlValue(edCPostal.Text), '') +
           BaseOrder ;
    OpenQuery( sdqLocalidad, Sql, True );
end;
{--[ Al cerrar el combo de Calle, expando los datos ]------------------------------------------------------------------}
procedure TfraDireccion.cmbCalleCloseUp(Sender: TObject);
begin
    If cmbCalle.Text <> '' Then begin
       edCPostal.Text    := sdqLocalidadCP_CODIGO.AsString;
       cmbLocalidad.Text := CAPFED;
       edProvincia.Tag   := 1;
       edProvincia.Text  := CAPFED;

       FModified         := True;
       cmbCalle.Modified := False; // By Fede 26/09/2002

       if (cmbCalle.Tag = 0) Then
          edNumero.SetFocus
       else
          DoLostFocus
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraDireccion.cmbCalleDropDown(Sender: TObject);
Var Sql : String;
begin
    if (cmbLocalidad.Text = CAPFED) or (cmbLocalidad.Text = '') then begin
       Sql := BaseSql +
              'AND CP_PROVINCIA = ''1'' ';

       if (edCPostal.Text <> '' ) then
           Sql := Sql + 'AND CP_CODIGO = ''' + edCPostal.Text + ''' ';

       if Assigned(Sender) and (TRim(cmbCalle.Text) <> '') Then
           Sql := Sql + 'AND CP_LOCALIDAD LIKE ''' + cmbCalle.Text + SQL_WILLCARD + ''' ';

       OpenQuery( sdqLocalidad, Sql + BaseOrder, True );

       if not Assigned(Sender) then begin
          cmbCalle.Tag := 1;
          sdqLocalidad.Locate('CP_LOCALIDAD', cmbCalle.Text, [loCaseInsensitive, loPartialKey]);
       end else
          cmbCalle.Tag := 0;

       cmbCalle.AllowDropDown := True;
    end else
       cmbCalle.AllowDropDown := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraDireccion.FrameExit(Sender: TObject);             {ERROR!!!!! al hacer exit del Frame, si el prestador es otro, me guardaría los datos guardados del anterior. by Lu. (Ej:555)}
begin
    if sdqLocalidad.Active and (not sdqLocalidad.IsEmpty) then begin
       edProvincia.Tag  := sdqLocalidadPV_CODIGO.AsInteger;
       edProvincia.Text := sdqLocalidadPV_DESCRIPCION.AsString;
       edCPostal.Text   := sdqLocalidadCP_CODIGO.AsString;
       if (sdqLocalidadPV_CODIGO.AsInteger = 1) Then begin
          cmbLocalidad.Text := CAPFED ;
          if (sdqLocalidad.RecordCount = 1) or (sdqLocalidad.Locate('CP_LOCALIDAD', cmbCalle.Text, [loCaseInsensitive])) Then
             cmbCalle.Text := sdqLocalidadCP_LOCALIDAD.AsString
          else
             cmbCalle.Text := '';

       end else
          cmbLocalidad.Text := sdqLocalidadCP_LOCALIDAD.AsString ;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraDireccion.cmbCalleExit(Sender: TObject);
begin
     if FCheckData and cmbCalle.Modified then begin
        FModified         := True;
        cmbCalle.Modified := False;
        if (cmbCalle.Text <> '') and (cmbLocalidad.Text = CAPFED) Then begin
           cmbCalleDropDown( Self );

           if (sdqLocalidad.RecordCount = 1) or
              (UCase(Trim(cmbCalle.Text)) = UCase(Trim(sdqLocalidadCP_LOCALIDAD.AsString))) or
              sdqLocalidad.Locate('CP_LOCALIDAD', cmbCalle.Text, [loCaseInsensitive]) Then

              cmbCalle.Text := sdqLocalidadCP_LOCALIDAD.AsString
           else
              cmbCalle.Text := '';

        end;
     end;
end;
{--[ Procedimiento para Pasar el Foco fuera del Frame ]----------------------------------------------------------------}
procedure TfraDireccion.DoLostFocus;
begin
    edProvincia.SetFocus ;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraDireccion.SetBackGroundColor(AColor: TColor; ADisColor : TColor = clBtnFace);
begin
    cmbCalle.Color     := AColor;
    cmbLocalidad.Color := AColor;
    edNumero.Color     := AColor;
    edPiso.Color       := AColor;
    edDto.Color        := AColor;
    edCPostal.Color    := AColor;

    edProvincia.Color  := ADisColor;
    edCPA.Color        := ADisColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraDireccion.SetColors(AColor: TColor);
begin
    cmbCalle.Font.Color     := AColor;
    cmbLocalidad.Font.Color := AColor;
    edNumero.Font.Color     := AColor;
    edPiso.Font.Color       := AColor;
    edDto.Font.Color        := AColor;
    edCPostal.Font.Color    := AColor;
    edCPA.Font.Color        := AColor;
    edProvincia.Font.Color  := AColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraDireccion.GetProvincia: Integer;
begin
     if edProvincia.Text = '' Then
         Result := -1
     else
         Result := edProvincia.Tag;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraDireccion.SetProvincia(const Value: Integer);
Var Sql : String;
begin
     if Value < 0 Then begin
         edProvincia.Text := '' ;
         edProvincia.Tag  := -1 ;
     end else begin
         Sql := 'SELECT PV_DESCRIPCION ' +
                'FROM CPV_PROVINCIAS ' +
                'WHERE PV_CODIGO = ' + SQL_QUOTE + IntToStr(Value) + SQL_QUOTE;
         edProvincia.Tag  := Value ;
         edProvincia.Text := ValorSql( Sql );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraDireccion.GetModified: Boolean;
begin
    Result := FModified             or
              cmbCalle.Modified     or
              cmbLocalidad.Modified or
              edNumero.Modified     or
              edPiso.Modified       or
              edDto.Modified        or
              edCPostal.Modified ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraDireccion.SetModified(const Value: Boolean);
begin
    FModified             := Value ;
    cmbCalle.Modified     := Value ;
    cmbLocalidad.Modified := Value ;
    edNumero.Modified     := Value ;
    edPiso.Modified       := Value ;
    edDto.Modified        := Value ;
    edCPostal.Modified    := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraDireccion.GetProvinciaSql: String;
Var iProv : Integer;
begin
   iProv := GetProvincia;
   if iProv < 1 Then
      Result := SQL_NULL
   else
      Result := SQL_QUOTE + IntToStr(iProv) + SQL_QUOTE;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraDireccion.Create(AOwner: TComponent);
begin
  inherited;
  FModified  := False;
  FCheckData := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraDireccion.IsEmpty: boolean;
begin
  Result := (cmbCalle.Text     = '') and
            (cmbLocalidad.Text = '') and
            (edNumero.Text     = '') and
            (edPiso.Text       = '') and
            (edDto.Text        = '') and
            (edCPostal.Text    = '');
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraDireccion.GetDomicilio: string;
begin
  Result := cmbCalle.Text;

  if edNumero.Text <> '' then
    Result := Result + ' Nro:' + edNumero.Text;

  if edPiso.Text <> '' then
    Result := Result + ' Piso:' + edPiso.Text;

  if edDto.Text <> '' then
    Result := Result + ' Dto:' + edDto.Text;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
