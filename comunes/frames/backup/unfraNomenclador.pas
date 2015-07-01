unit unfraNomenclador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, ArtComboBox, EditNew, StdCtrls, Db, SDEngine, General, SqlOracle, strFuncs,
  IntEdit;

type
  TfraNomenclador = class(TFrame)
    sdqPrestacion: TSDQuery;
    sdqPrestacionON_NOMENCLADOR: TStringField;
    sdqPrestacionON_CAPITULO: TStringField;
    sdqPrestacionON_CODIGO: TStringField;
    sdqPrestacionON_DESCRIPCION: TStringField;
    dsPrestacion: TDataSource;
    Label5: TLabel;
    edPrestNomenc: TEdit;
    edPrestCap: TEdit;
    cmbPrestacion: TArtComboBox;
    edPrestCodigo: TIntEdit;
    procedure edPrestNomencKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPrestCapKeyPress(Sender: TObject; var Key: Char);
    procedure edPrestCapKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPrestCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbPrestacionCloseUp(Sender: TObject);
    procedure cmbPrestacionDropDown(Sender: TObject);
    procedure edPrestCodigoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FrameExit(Sender: TObject);
  private
    FOnChange: TNotifyEvent;
    procedure DoChanges ;
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    procedure DoLostFocus;
  public
    procedure Limpiar;
    function Cargar(sNomenc, sCapitulo, sCodigo: String) : Boolean;
    Property Modified : Boolean read GetModified write SetModified;
    Property OnChange : TNotifyEvent read FOnChange write FOnChange;
  end;

implementation

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraNomenclador.edPrestNomencKeyUp(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
     if (Key = 13) or ((Length(edPrestNomenc.Text) = edPrestNomenc.MaxLength) and (edPrestNomenc.SelLength = 0 )) Then
        edPrestCap.SetFocus ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraNomenclador.edPrestCapKeyPress(Sender: TObject;  var Key: Char);
begin
     if (Key = #8) and (edPrestCap.Text = '') and Visible Then
         edPrestNomenc.SetFocus ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraNomenclador.edPrestCapKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key = 13) or ((Length(edPrestCap.Text) = edPrestCap.MaxLength) and (edPrestCap.SelLength = 0)) Then
        edPrestCodigo.SetFocus
     else if (Key = 8) and (Length(edPrestCap.Text) = 0) Then
        edPrestNomenc.SetFocus ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraNomenclador.edPrestCodigoKeyPress(Sender: TObject;  var Key: Char);
begin
     if (Key = #13) Then
       if Not Cargar(edPrestNomenc.Text, edPrestCap.Text, edPrestCodigo.Text) Then begin
          MsgBox('No se ha encontrado la Prestación', MB_ICONEXCLAMATION);
          edPrestNomenc.SetFocus ;
       end else begin
          DoChanges ;
       end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraNomenclador.cmbPrestacionCloseUp(Sender: TObject);
begin
     edPrestNomenc.Text := sdqPrestacionON_NOMENCLADOR.AsString ;
     edPrestCap.Text    := sdqPrestacionON_CAPITULO.AsString ;
     edPrestCodigo.Text := sdqPrestacionON_CODIGO.AsString ;
     DoChanges ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraNomenclador.cmbPrestacionDropDown(Sender: TObject);
begin
     sdqPrestacion.Close ;
     sdqPrestacion.SQL.Text := ' SELECT ON_NOMENCLADOR, ON_CAPITULO, ON_CODIGO, ON_DESCRIPCION ' +
                               ' FROM SON_NOMENCLADOR ' +
                               ' WHERE ON_DESCRIPCION LIKE ''' + SqlString(UCase(cmbPrestacion.Text)) + '%''' +
                               ' ORDER BY ON_DESCRIPCION ';
     sdqPrestacion.Open ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraNomenclador.DoChanges;
begin
     if Assigned(FOnChange) Then
        OnChange( Self );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraNomenclador.GetModified: Boolean;
begin
    Result := edPrestNomenc.Modified or edPrestCap.Modified or edPrestCodigo.Modified or cmbPrestacion.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraNomenclador.Limpiar;
begin
    edPrestNomenc.Text := '';
    edPrestCap.Text    := '';
    edPrestCodigo.Text := '';
    cmbPrestacion.Text := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraNomenclador.SetModified(const Value: Boolean);
begin
    edPrestNomenc.Modified := Value;
    edPrestCap.Modified    := Value;
    edPrestCodigo.Modified := Value;
    cmbPrestacion.Modified := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraNomenclador.Cargar(sNomenc, sCapitulo, sCodigo: String) : Boolean;
begin
     sdqPrestacion.Close ;
     sdqPrestacion.SQL.Text := ' SELECT ON_NOMENCLADOR, ON_CAPITULO, ON_CODIGO, ON_DESCRIPCION ' +
                               ' FROM SON_NOMENCLADOR ' +
                               ' WHERE ON_NOMENCLADOR = ''' + sNomenc + '''' +
                               ' AND ON_CAPITULO = ''' + sCapitulo + '''' +
                               ' AND ON_CODIGO = ''' + sCodigo + '''';
     sdqPrestacion.Open ;
     if sdqPrestacion.Eof Then begin
        Limpiar;
        Result := False
     end else begin
        cmbPrestacionCloseUp( Nil );
        cmbPrestacion.Text := sdqPrestacionON_DESCRIPCION.AsString ;
        Result := True;
        DoChanges ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraNomenclador.edPrestCodigoKeyUp(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
     if (Key = 8) and (Length(edPrestCodigo.Text) = 0) Then
        edPrestCap.SetFocus ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraNomenclador.FrameExit(Sender: TObject);
begin
     if (edPrestNomenc.Text + edPrestCap.Text + edPrestCodigo.Text <> '') Then
        if (edPrestNomenc.Text <> sdqPrestacionON_NOMENCLADOR.AsString) or
           (edPrestCap.Text    <> sdqPrestacionON_CAPITULO.AsString) or
           (edPrestCodigo.Text <> sdqPrestacionON_CODIGO.AsString) Then begin
                Cargar(edPrestNomenc.Text, edPrestCap.Text, edPrestCodigo.Text );
                if ( edPrestNomenc.Text = '' ) then begin
                    MessageDlg('No se encontró el Nomenclador', mtError, [mbOK], 0);
                    edPrestNomenc.SetFocus ;
                end;
        end;
end;
{---[Pasa el Foco fuera del Frame]-------------------------------------------------------------------------------------}
procedure TfraNomenclador.DoLostFocus;
begin
    if cmbPrestacion.CanFocus Then begin
       cmbPrestacion.SetFocus ;
       SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
