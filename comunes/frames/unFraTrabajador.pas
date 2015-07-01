unit unFraTrabajador;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, RxLookup, StdCtrls, Mask, Db, SDEngine, ArtComboBox, CUIT;

type
  TfraTrabajador = class(TFrame)
    sdqTrabajador: TSDQuery;
    dsTrabajador: TDataSource;
    lbTrabCUIL: TLabel;
    mskCUIL: TMaskEdit;
    lbTrabNombre: TLabel;
    cmbNombre: TArtComboBox;
    sdqTrabajadorTJ_NOMBRE: TStringField;
    sdqTrabajadorTJ_CUIL: TStringField;
    sdqTrabajadorDL_FECEGRESO: TDateTimeField;
    sdqTrabajadorDL_CUIT: TStringField;
    sdqTrabajadorDL_ESTABLECIMIENTO: TFloatField;
    procedure mskCUILKeyPress(Sender: TObject; var Key: Char);
    procedure cmbNombreDropDown(Sender: TObject);
    procedure cmbNombreCloseUp(Sender: TObject);
    procedure FrameExit(Sender: TObject);
  private
    FOnChange: TNotifyEvent;
    FAllwaysShowList: Boolean;
    FSql: String;
    FMinLength: Integer;
    FCuit: String;
    FEstablecimiento: Integer;
    FNeedCUIT: boolean;
    FNeedEstableci: boolean;
    FShowBajas: boolean;
    FExtraCondition: String;
    FLocked: Boolean;
    function GetSql: String;
    procedure SetCuit(const Value: String);
    procedure SetEstablecimiento(const Value: Integer);
    procedure SetNeedCUIT(const Value: boolean);
    function GetReadOnly: boolean;
    procedure SetReadOnly(const Value: boolean);
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean); 
    procedure SetNeedEstableci(const Value: boolean);
    function GetValue: TCuil;
    procedure SetValue(const Value: TCuil);
    function GetIsEmpty: boolean;
    function GetIsSelected: boolean;
    procedure SetShowBajas(const Value: boolean);
    function GetCuit: String;
    function GetCUIL: TCuil;
    procedure SetCUIL(const Value: TCuil);
    procedure SetLocked(const Value: Boolean);
    function GetNombre: String;
    procedure SetNombre(const Value: String);
  protected
    function IsBaja : Boolean;
  public
    procedure DoLostFocus;
    procedure Limpiar(ClearCUIT : Boolean = True; ClearEstableci : Boolean = True);
    procedure Clear; { Para Compatibilidad }
    constructor Create(AOwner: TComponent); override;
    procedure Cargar( sCUIL : String ); overload;
    procedure SetColors( AColor : TColor);
    property  IsSelected     : boolean      read GetIsSelected;
    property  IsEmpty        : boolean      read GetIsEmpty;
  published
    Property OnChange           : TNotifyEvent read FOnChange           write FOnChange;
    Property AllwaysShowList    : Boolean      read FAllwaysShowList    write FAllwaysShowList;
    Property Sql                : String       read GetSql              write FSql;
    property MinLength          : Integer      read FMinLength          write FMinLength default 4;
    property CUIL               : TCuil        read GetCUIL             write SetCUIL;
    Property CUIT               : String       read GetCuit             write SetCuit;
    Property Establecimiento    : Integer      read FEstablecimiento    write SetEstablecimiento;
    Property Modified           : Boolean      read GetModified         write SetModified;
    Property ReadOnly           : boolean      read GetReadOnly         write SetReadOnly;
    Property NeedCUIT           : boolean      read FNeedCUIT           write SetNeedCUIT;         // Pone el frame en ReadOnly si no tiene el CUIT
    Property NeedEstableci      : boolean      read FNeedEstableci      write SetNeedEstableci;    // Pone el frame en ReadOnly si no tiele el Establecimiento
    property Nombre             : String       read GetNombre           write SetNombre;
    property Value              : TCuil        read GetValue            write SetValue;
    property ShowBajas          : boolean      read FShowBajas          write SetShowBajas;
    property ExtraCondition     : String       read FExtraCondition     write FExtraCondition;
    property Locked             : Boolean      read FLocked             write SetLocked;    
  end;

implementation

uses
  unDmPrincipal, General, Numeros, StrFuncs, VCLExtra;

const
  BaseOrder = ' ORDER BY TJ_NOMBRE ' ;
{$R *.DFM}

procedure TfraTrabajador.mskCUILKeyPress(Sender: TObject; var Key: Char);
Var Sql : String;
begin
     If (Key = #13) Then begin
          if (Length(Trim(mskCUIL.Text)) < 8) and (Copy(mskCUIL.EditText, 1, 2) = '  ') and (Copy(mskCUIL.EditText, 10, 1) = ' ') Then
             mskCUIL.Text := '  ' + LPAD(mskCUIL.Text, '0', 8) + ' ';

          case Length(Trim(mskCUIL.Text)) of
            8:  Sql := GetSql +
                       ' AND TJ_DOCUMENTO = ''' + Trim(mskCUIL.Text)  + ''' ';
            11: Sql := GetSql +
                       ' AND TJ_CUIL = ''' + mskCUIL.Text  + ''' ';
          else
            mskCUIL.Text := '';
            Exit;
          end;
          //---------------------------------------------------
         if OpenQuery( sdqTrabajador, Sql + BaseOrder, True ) Then begin
            if Assigned(Sender) and (FAllwaysShowList or (sdqTrabajador.RecordCount > 1)) Then
                cmbNombre.DoDropDown( False )
            else
                cmbNombreCloseUp ( Sender );
         end;
    end;
end;

procedure TfraTrabajador.cmbNombreDropDown(Sender: TObject);
Var Sql : String;
    Largo : Integer;
begin
     Largo := Length(Trim( cmbNombre.Text ));
     If (Largo >= FMinLength) Then begin
         Sql := GetSql +
                IIF(Largo > 0, ' AND TJ_NOMBRE LIKE ''' + Trim( cmbNombre.Text ) + '%''', '') +
                BaseOrder ;
         OpenQuery(sdqTrabajador, Sql, True );

     end else
         MsgBox( 'Debe ingresar como mínimo ' + LowerCase(NumLetras( FMinLength )) + ' caracteres para realizar la búsqueda.', MB_ICONEXCLAMATION );
end;

procedure TfraTrabajador.cmbNombreCloseUp(Sender: TObject);
begin
     mskCUIL.Text   := sdqTrabajadorTJ_CUIL.AsString ;
     cmbNombre.Text := sdqTrabajadorTJ_NOMBRE.AsString;
     //------------------------------------------------------

     if IsBaja Then
        SetColors(clRed)
     else
        SetColors(clBlack);
     //------------------------------------------------------

     if Assigned(Sender) then begin // Para que no entre cuando se llama a 'Cargar'
        if Assigned(FOnChange) Then
            OnChange( Self );

        DoLostFocus;
     end;
end;

procedure TfraTrabajador.Limpiar(ClearCUIT : Boolean = True; ClearEstableci : Boolean = True);
begin
     if ClearCUIT then
        FCuit       := '' ;

     if ClearEstableci then
        FEstablecimiento := 0;
     //--------------------
     mskCUIL.Text   := '' ;
     cmbNombre.Text := '' ;
end;

procedure TfraTrabajador.Cargar(sCUIL: String);
Var tmpEnterKey : Char;
begin
     tmpEnterKey := #13 ;
     mskCUIL.Text := sCUIL;
     mskCUILKeyPress(Nil , tmpEnterKey);
end;

procedure TfraTrabajador.SetColors(AColor: TColor);
begin
     mskCUIL.Font.Color   := AColor;
     cmbNombre.Font.Color := AColor;
end;

function TfraTrabajador.GetSql: String;
begin
     if FSql = '' Then begin
        if FCuit = '' Then
           Result := 'SELECT TJ_NOMBRE, TJ_CUIL, TO_DATE(NULL) DL_FECEGRESO, '''' DL_CUIT, 0 DL_ESTABLECIMIENTO ' +
                     'FROM CTJ_TRABAJADORES ' +
                     'WHERE 1=1 ' + FExtraCondition
        else
        begin
           Result := 'SELECT TJ_CUIL, TJ_NOMBRE, DL_FECEGRESO, DL_CUIT, DL_ESTABLECIMIENTO ' + // /*+ INDEX(CDL_DATOSLABORALES.CDL_CUITCUIL)*/
                     'FROM CTJ_TRABAJADORES, CDL_DATOSLABORALES  ' +
                     'WHERE TJ_CUIL = DL_CUIL ' +
                     'AND DL_CUIT = ''' + FCuit + '''' +
                     IIF(FEstablecimiento = 0, '' , ' AND DL_ESTABLECIMIENTO = ' + IntToStr(FEstablecimiento)) +
                     FExtraCondition;
           if FShowBajas Then
           begin
             Result := 'SELECT TJ_CUIL, TJ_NOMBRE, DL_FECEGRESO, DL_CUIT, DL_ESTABLECIMIENTO ' +
                       'FROM (' +  Result + ' UNION ALL ' +
                       'SELECT TJ_CUIL, TJ_NOMBRE, HL_FECHABAJA, HL_CUIT, HL_ESTABLECIMIENTO ' + // /*+ INDEX(CDL_DATOSLABORALES.CDL_CUITCUIL)*/
                       'FROM CTJ_TRABAJADORES, CHL_HISTOLABORAL  ' +
                       'WHERE TJ_CUIL = HL_CUIL ' +
                       'AND HL_CUIT = ''' + FCuit + '''' +
                       IIF(FEstablecimiento = 0, '' , ' AND HL_ESTABLECIMIENTO = ' + IntToStr(FEstablecimiento)) +
                       FExtraCondition + ') WHERE 1=1 ' ;
           end;
        end;
     end else
        Result := FSql;
end;

procedure TfraTrabajador.SetCuit(const Value: String);
begin
  if FCuit <> Value then
  begin
    FCuit := Value;
    SetReadOnly(FNeedCUIT and (FCuit = '') );
    if (not sdqTrabajador.Active) or (sdqTrabajador.Active and (self.sdqTrabajadorDL_CUIT.AsString <> Value)) then
      Limpiar( False );
  end;
end;

procedure TfraTrabajador.SetEstablecimiento(const Value: Integer);
begin
     if FEstablecimiento <> Value then begin
        FEstablecimiento := Value;
        SetReadOnly( FNeedEstableci and (FEstablecimiento = 0) );
        if (not sdqTrabajador.Active) or (sdqTrabajador.Active and (self.sdqTrabajadorDL_ESTABLECIMIENTO.AsInteger <> Value)) then
           Limpiar( False );
     end;
end;

procedure TfraTrabajador.DoLostFocus;
begin
  if cmbNombre.CanFocus Then
  begin
    cmbNombre.SetFocus ;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

constructor TfraTrabajador.Create(AOwner: TComponent);
begin
  inherited;
  FSql       := '';
  FMinLength := 4;
  FCuit      := '';
  FEstablecimiento := 0;
end;

procedure TfraTrabajador.SetNeedCUIT(const Value: boolean);
begin
  FNeedCUIT := Value;
  SetReadOnly( FNeedCUIT and (FCuit = '') );
end;

procedure TfraTrabajador.SetNeedEstableci(const Value: boolean);
begin
   FNeedEstableci := Value;
   SetReadOnly( FNeedEstableci and (FEstablecimiento = 0) );
end;

function TfraTrabajador.GetReadOnly: boolean;
begin
  Result := mskCUIL.ReadOnly or cmbNombre.ReadOnly;
end;

procedure TfraTrabajador.SetReadOnly(const Value: boolean);
begin
  mskCUIL.ReadOnly   := Value ;
  cmbNombre.ReadOnly := Value ;
end;

function TfraTrabajador.GetModified: Boolean;
begin
  Result := mskCUIL.Modified or cmbNombre.Modified;
end;

procedure TfraTrabajador.SetModified(const Value: Boolean);
begin
  mskCUIL.Modified   := Value ;
  cmbNombre.Modified := Value ;
end;

procedure TfraTrabajador.FrameExit(Sender: TObject);
begin
     if (mskCUIL.Text = '') then begin
         Limpiar( False, False );
{ BY FEDE 19/11/2001
         if Assigned(FOnChange) Then
            OnChange( Self ); }
     end else if (mskCUIL.Text <> sdqTrabajadorTJ_CUIL.AsString) Then
         Cargar( mskCUIL.Text );
end;

function TfraTrabajador.GetValue: TCuil;
begin
    FrameExit(Nil);
    Result := mskCUIL.Text;
end;

procedure TfraTrabajador.SetValue(const Value: TCuil);
begin
     Cargar( Value );
end;

function TfraTrabajador.GetIsEmpty: boolean;
begin
     Result := GetValue = '';
end;

function TfraTrabajador.GetIsSelected: boolean;
begin
     Result := not GetIsEmpty;
end;

procedure TfraTrabajador.SetShowBajas(const Value: boolean);
begin
  if FShowBajas <> Value Then begin
     FShowBajas := Value;
     if not FShowBajas and IsBaja Then
        Clear;
  end;
end;

procedure TfraTrabajador.Clear;
begin
   Limpiar( False, False );
end;

function TfraTrabajador.IsBaja: Boolean;
begin
  Result := sdqTrabajador.Active and (not sdqTrabajadorDL_FECEGRESO.IsNull);
end;

function TfraTrabajador.GetCuit: String;
begin
  if sdqTrabajador.Active and not sdqTrabajador.IsEmpty then
    Result := sdqTrabajador.FieldByName('DL_CUIT').AsString
  else
    Result := FCUIT;
end;

function TfraTrabajador.GetCUIL: TCuil;
begin
  FrameExit( nil ); // Valida que todo este completo
  if sdqTrabajador.Active then
    Result := sdqTrabajador.FieldByName( 'TJ_CUIL' ).AsString
  else
    Result := '';
end;

procedure TfraTrabajador.SetCUIL(const Value: TCuil);
var
  cEnter: char;
begin
  cEnter := #13;
  mskCUIL.Text := Value;
  mskCUILKeyPress(nil, cEnter);
end;

procedure TfraTrabajador.SetLocked(const Value: Boolean);
begin
  if (FLocked <> Value) then
  begin
    FLocked := Value;
    VCLExtra.LockControls([mskCUIL, cmbNombre], FLocked);
  end;
end;

function TfraTrabajador.GetNombre: String;
begin
  Result := cmbNombre.Text;
end;

procedure TfraTrabajador.SetNombre(const Value: String);
begin
  cmbNombre.Text := Value;
end;

end.

