unit unFraTrabajadorAMP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, RxLookup, StdCtrls, Mask, Db, SDEngine, ArtComboBox, CUIT, AnsiSql;

type
  TfraTrabajadorAMP = class(TFrame)
    sdqTrabajador: TSDQuery;
    dsTrabajador: TDataSource;
    lbTrabCUIL: TLabel;
    mskCUIL: TMaskEdit;
    lbTrabNombre: TLabel;
    cmbNombre: TArtComboBox;
    procedure mskCUILKeyPress(Sender: TObject; var Key: Char);
    procedure cmbNombreDropDown(Sender: TObject);
    procedure cmbNombreCloseUp(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure cmbNombreGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    FTercerizadoras: boolean;
    FIdExpediente: integer;
    FOnChange: TNotifyEvent;
    FAllwaysShowList: Boolean;
    FSql: String;
    FMinLength: Integer;
    FCuit: String;
    FNeedCUIT: boolean;
    FVerRelLaboral: boolean;
    FShowBajas: boolean;
    FExtraCondition: String;
    FLocked: Boolean;
    function GetSql: String;
    procedure SetCuit(const Value: String);
    procedure SetNeedCUIT(const Value: boolean);
    function GetReadOnly: boolean;
    procedure SetReadOnly(const Value: boolean);
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    function GetVerRLaboral: Boolean;
    procedure SetVerRLaboral(const Value: Boolean);
    function GetValue: TCuil;
    procedure SetValue(const Value: TCuil);
    function GetIsEmpty: boolean;
    function GetIsSelected: boolean;
    procedure SetShowBajas(const Value: boolean);
    function GetCuit: String;
    function GetCUIL: TCuil;
    procedure SetCUIL(const Value: TCuil);
    procedure SetLocked(const Value: Boolean);
    function GetSqlTercerizadora: String;
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
    Property VerRLaboral        : Boolean      read GetVerRLaboral      write SetVerRLaboral;
    Property Modified           : Boolean      read GetModified         write SetModified;
    Property ReadOnly           : boolean      read GetReadOnly         write SetReadOnly;
    Property NeedCUIT           : boolean      read FNeedCUIT           write SetNeedCUIT;         // Pone el frame en ReadOnly si no tiene el CUIT
    property Value              : TCuil        read GetValue            write SetValue;
    property ShowBajas          : boolean      read FShowBajas          write SetShowBajas;
    property ExtraCondition     : String       read FExtraCondition     write FExtraCondition;
    property Locked             : Boolean      read FLocked             write SetLocked;
    property Tercerizadoras     : Boolean      read FTercerizadoras     write FTercerizadoras;     //  por plan ioma
    property IdExpediente       : Integer      read FIdExpediente       write FIdExpediente;     //  por plan ioma
  end;

implementation

uses
  unDmPrincipal, General, Numeros, StrFuncs, VCLExtra, unTercerizadoras, unSesion;

const
  BaseOrder = '';//' ORDER BY TJ_NOMBRE ' ;
{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.mskCUILKeyPress(Sender: TObject; var Key: Char);
Var Sql : String;
begin
     If (Key = #13) Then begin
          if (Length(Trim(mskCUIL.Text)) < 8) and (Copy(mskCUIL.EditText, 1, 2) = '  ') and (Copy(mskCUIL.EditText, 10, 1) = ' ') Then
             mskCUIL.Text := '  ' + LPAD(mskCUIL.Text, '0', 8) + ' ';

          case Length(Trim(mskCUIL.Text)) of
            6..8, //:  Sql := GetSql; // ' AND TJ_DOCUMENTO = ''' + Trim(mskCUIL.Text)  + ''' ';
// cambiado 12/11/08           11: Sql := GetSql + ' ORDER BY lote DESC, co_contrato DESC, baja DESC, esbaja ASC'; // + ' AND TJ_CUIL = ''' + mskCUIL.Text  + ''' ';
            11: Sql := GetSql + GetSqlTercerizadora + ' ORDER BY esbaja ASC, baja DESC, lote DESC, co_contrato DESC '; // + ' AND TJ_CUIL = ''' + mskCUIL.Text  + ''' ';
          else
            mskCUIL.Text := '';
            Exit;
          end;
          //---------------------------------------------------
         if OpenQuery( sdqTrabajador, Sql + BaseOrder, True ) Then begin
//            if Assigned(Sender) and (FAllwaysShowList  or (sdqTrabajador.RecordCount > 1)  ) Then
            if Assigned(Sender) and FAllwaysShowList Then
                cmbNombre.DoDropDown( False )
            else
                cmbNombreCloseUp ( Sender );
         end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.cmbNombreDropDown(Sender: TObject);
Var
  Sql : String;
  Largo: Integer;
begin
     Largo := Length(Trim( cmbNombre.Text ));
     If (Largo >= FMinLength) Then begin
         Sql := GetSql +
                GetSqlTercerizadora +  // plan ioma
                BaseOrder ;
         OpenQuery(sdqTrabajador, Sql, True );

     end else
         MsgBox( 'Debe ingresar como mínimo ' + LowerCase(NumLetras( FMinLength )) + ' caracteres para realizar la búsqueda.', MB_ICONEXCLAMATION );
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.cmbNombreCloseUp(Sender: TObject);
begin
     mskCUIL.Text   := sdqTrabajador.FieldByName('TJ_CUIL').AsString ;
     cmbNombre.Text := sdqTrabajador.FieldByName('TJ_NOMBRE').AsString;
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
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.Limpiar(ClearCUIT : Boolean = True; ClearEstableci : Boolean = True);
begin
     if ClearCUIT then
        FCuit       := '' ;

     //--------------------
     mskCUIL.Text   := '' ;
     cmbNombre.Text := '' ;
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.Cargar(sCUIL: String);
Var tmpEnterKey : Char;
begin
     tmpEnterKey := #13 ;
     mskCUIL.Text := sCUIL;
     mskCUILKeyPress(Nil , tmpEnterKey);
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.SetColors(AColor: TColor);
begin
     mskCUIL.Font.Color   := AColor;
     cmbNombre.Font.Color := AColor;
end;
{------------------------------------------------------------------------------}
function TfraTrabajadorAMP.GetSql: String;
begin
  if FSql = '' then
  begin
    if not FVerRelLaboral then
    begin
      Result:= 'SELECT TJ_CUIL, TJ_NOMBRE, NULL BAJA, '''' DL_CUIT, '''' em_nombre, '''' co_contrato, '''' esbaja , '''' lote ' +
               '  FROM CTJ_TRABAJADOR ' +
               ' WHERE 1=1 ' +
               IIF(Length(Trim( cmbNombre.Text )) > 0, ' AND TJ_NOMBRE LIKE ''' + Trim( cmbNombre.Text ) + '%''', '') +
               IIF(Length(Trim( mskCUIL.Text )) = 11, ' AND TJ_CUIL = ' + SqlValue (Trim(mskCUIL.Text)), '') +
               IIF(Length(Trim( mskCUIL.Text )) in [6,7,8], ' AND TJ_DOCUMENTO = ' + SqlValue (LPad(Trim(mskCUIL.Text),'0',8)), '') +
               FExtraCondition;
      cmbNombre.Columns.Items[2].Visible := false;
      cmbNombre.Columns.Items[3].Visible := false;
      cmbNombre.Columns.Items[4].Visible := false;
    end
    else begin
      Result := 'SELECT   tj_nombre, tj_cuil, baja, dl_cuit, em_nombre, co_contrato, esbaja, lote ' +
                '    FROM (SELECT ctj_trabajador.tj_nombre, ctj_trabajador.tj_cuil, NULL baja, ' +
                '                 em_cuit dl_cuit, em_nombre, co_contrato, ' +
                '                 afiliacion.check_cobertura(co_contrato) esbaja, ' +

                '                 (SELECT NVL (MAX (dl_idlote), 0) ' +
                '                    FROM hys.hdl_detallelote' +
                '                   WHERE dl_idempresa = em_id) lote' +

                '            FROM crl_relacionlaboral, ctj_trabajador, aco_contrato, ' +
                '                 aem_empresa ' +
                '           WHERE rl_idtrabajador = tj_id ' +
                '             AND rl_contrato = co_contrato ' +
                '             AND co_idempresa = em_id ' +
                              //iif (FCuit = '', '', '   AND em_cuit = ' + SqlValue (FCuit)) +
                              iif(Length(Trim(mskCUIL.Text)) = 11,
                                  ' AND tj_cuil = ' + SqlValue(Trim(mskCUIL.Text)), '') +
                              iif(Length(Trim(mskCUIL.Text)) in [6,7,8],
                                  ' AND tj_documento = ' + SqlValue(LPad(Trim(mskCUIL.Text),'0',8)), '') +
                              iif((Length(Trim(mskCUIL.Text)) = 0) and (Length(Trim(cmbNombre.Text)) > 0),
                                  ' AND tj_nombre LIKE ' + SqlValue(Trim(cmbNombre.Text) + '%'), '') +
                '          UNION ALL' +
                '          SELECT ctj_trabajador.tj_nombre, ctj_trabajador.tj_cuil, ' +
                '                 NVL2(hl_fechaegreso, 1, 0) baja, em_cuit dl_cuit, em_nombre, ' +
                '                 co_contrato, afiliacion.check_cobertura(co_contrato) esbaja, ' +

                '                 (SELECT NVL (MAX (dl_idlote), 0) ' +
                '                    FROM hys.hdl_detallelote' +
                '                   WHERE dl_idempresa = em_id) lote' +


                '            FROM chl_historicolaboral, ctj_trabajador, aco_contrato, ' +
                '                 aem_empresa ' +
                '           WHERE hl_contrato = co_contrato ' +
                '             AND hl_idtrabajador = tj_id ' +
                '             AND co_idempresa = em_id ' +
                              //iif (FCuit = '', '', '   AND em_cuit = ' + SqlValue (FCuit)) +
                              iif(Length(Trim(mskCUIL.Text)) = 11,
                                  ' AND tj_cuil = ' + SqlValue(Trim(mskCUIL.Text)), '') +
                              iif(Length(Trim(mskCUIL.Text)) in [6,7,8],
                                  ' AND tj_documento = ' + SqlValue(LPad(Trim(mskCUIL.Text),'0',8)), '') +
                              iif((Length(Trim(mskCUIL.Text)) = 0) and (Length(Trim(cmbNombre.Text)) > 0),
                                  ' AND tj_nombre LIKE ' + SqlValue(Trim(cmbNombre.Text) + '%'), '') +
                '             AND NOT EXISTS(SELECT 1 ' +
                '                              FROM crl_relacionlaboral ' +
                '                             WHERE rl_idtrabajador = tj_id ' +
                '                               AND rl_contrato = co_contrato)) ';

      cmbNombre.Columns.Items[2].Visible := true;
      cmbNombre.Columns.Items[3].Visible := true;
      cmbNombre.Columns.Items[4].Visible := true;
    end
  end
  else
    Result := FSql;
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.SetCuit(const Value: String);
begin
  if FCuit <> Value then
  begin
    FCuit := Value;
    SetReadOnly(FNeedCUIT and (FCuit = '') );
    if (not sdqTrabajador.Active) or (sdqTrabajador.Active and (self.sdqTrabajador.FieldByName('DL_CUIT').AsString <> Value)) then
      Limpiar( False );
  end;
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.DoLostFocus;
begin
  if cmbNombre.CanFocus Then
  begin
    cmbNombre.SetFocus ;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;
{------------------------------------------------------------------------------}
constructor TfraTrabajadorAMP.Create(AOwner: TComponent);
begin
  inherited;
  FSql       := '';
  FMinLength := 4;
  FCuit      := '';
  FVerRelLaboral := false;
  FTercerizadoras := False;
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.SetNeedCUIT(const Value: boolean);
begin
  FNeedCUIT := Value;
  SetReadOnly( FNeedCUIT and (FCuit = '') );
end;
{------------------------------------------------------------------------------}
function TfraTrabajadorAMP.GetReadOnly: boolean;
begin
  Result := mskCUIL.ReadOnly or cmbNombre.ReadOnly;
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.SetReadOnly(const Value: boolean);
begin
  mskCUIL.ReadOnly   := Value ;
  cmbNombre.ReadOnly := Value ;
end;
{------------------------------------------------------------------------------}
function TfraTrabajadorAMP.GetModified: Boolean;
begin
  Result := mskCUIL.Modified or cmbNombre.Modified;
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.SetModified(const Value: Boolean);
begin
  mskCUIL.Modified   := Value ;
  cmbNombre.Modified := Value ;
end;
{------------------------------------------------------------------------------}
function TfraTrabajadorAMP.GetVerRLaboral: Boolean;
begin
  Result := FVerRelLaboral
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.SetVerRLaboral(const Value: Boolean);
begin
  FVerRelLaboral := Value
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.FrameExit(Sender: TObject);
begin
     if (mskCUIL.Text = '') then
       Limpiar( False, False )
{ BY FEDE 19/11/2001
         if Assigned(FOnChange) Then
            OnChange( Self ); }
     else
       if sdqTrabajador.Active and (mskCUIL.Text <> sdqTrabajador.FieldByName('TJ_CUIL').AsString) Then
         Cargar( mskCUIL.Text )
end;
{------------------------------------------------------------------------------}
function TfraTrabajadorAMP.GetValue: TCuil;
begin
    FrameExit(Nil);
    Result := mskCUIL.Text;
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.SetValue(const Value: TCuil);
begin
     Cargar( Value );
end;
{------------------------------------------------------------------------------}
function TfraTrabajadorAMP.GetIsEmpty: boolean;
begin
     Result := GetValue = '';
end;
{------------------------------------------------------------------------------}
function TfraTrabajadorAMP.GetIsSelected: boolean;
begin
     Result := not GetIsEmpty;
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.SetShowBajas(const Value: boolean);
begin
  if FShowBajas <> Value Then begin
     FShowBajas := Value;
     if not FShowBajas and IsBaja Then
        Clear;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.Clear;
begin
   Limpiar( False, False );
end;
{------------------------------------------------------------------------------}
function TfraTrabajadorAMP.IsBaja: Boolean;
begin
  Result := sdqTrabajador.Active and (not sdqTrabajador.FieldByName('BAJA').IsNull);
end;
{------------------------------------------------------------------------------}
function TfraTrabajadorAMP.GetCuit: String;
begin
  if sdqTrabajador.Active and not sdqTrabajador.IsEmpty then
    Result := sdqTrabajador.FieldByName('DL_CUIT').AsString
  else
    Result := FCUIT;
end;
{------------------------------------------------------------------------------}
function TfraTrabajadorAMP.GetCUIL: TCuil;
begin
  FrameExit( nil ); // Valida que todo este completo
  if sdqTrabajador.Active then
    Result := sdqTrabajador.FieldByName( 'TJ_CUIL' ).AsString
  else
    Result := '';
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.SetCUIL(const Value: TCuil);
var
  cEnter: char;
begin
  cEnter := #13;
  mskCUIL.Text := Value;
  mskCUILKeyPress(nil, cEnter);
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.SetLocked(const Value: Boolean);
begin
  if (FLocked <> Value) then
  begin
    FLocked := Value;
    VCLExtra.LockControls([mskCUIL, cmbNombre], FLocked);
  end;
end;
{------------------------------------------------------------------------------}
procedure TfraTrabajadorAMP.cmbNombreGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (Field.FieldName = 'CO_CONTRATO') and (sdqTrabajador.FieldByName('ESBAJA').AsString <> '1') then
    AFont.Color := clRed;

  if IsBaja then
    AFont.Color := clRed;
end;
{------------------------------------------------------------------------------}
function TfraTrabajadorAMP.GetSqlTercerizadora: String;     // Plan ioma
begin
  Result := IIF(Tercerizadoras, ' AND art.siniestro.is_sinitercerizadora(' + SqlInt(IdExpediente) + ', ' + SQLValue(Sesion.UserID) + ') = ''S'' ', '');
end;


end.






