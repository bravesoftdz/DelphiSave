unit unSistemasdeTickets;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, PatternEdit, IntEdit, Vcl.Mask, RxToolEdit, QueryToFile,
  ExportDialog, SortDlg, SDEngine, FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin;

type
  TfrmSistemasDeTickets = class(TfrmCustomGridABM)
    Label1: TLabel;
    edDescripcion: TEdit;
    Label2: TLabel;
    edUltimoTicket: TIntEdit;
    Label3: TLabel;
    edFechaUltimoTicket: TDateEdit;
    Label4: TLabel;
    edPrefijoAsuntoMail: TEdit;
    Label5: TLabel;
    edTituloMail: TEdit;
    Label6: TLabel;
    edInterno: TEdit;
    Label7: TLabel;
    edColor: TEdit;
    Label8: TLabel;
    edEncabezadoEnLaWeb: TEdit;
    edSubheaderNew: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edSubheaderAuth: TEdit;
    Label11: TLabel;
    edSubheaderQuali: TEdit;
    Label12: TLabel;
    edSubheaderInfo: TEdit;
    Label13: TLabel;
    edHome: TEdit;
    cbColor: TColorBox;
    lbColor: TLabel;
    edST_DESCRIPCION_FULL_LIKE: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    edST_FECHAULTIMOTICKETDesde: TDateEdit;
    Label16: TLabel;
    edST_FECHAULTIMOTICKETHasta: TDateEdit;
    Label17: TLabel;
    ShortCutControl1: TShortCutControl;
    sdqConsultaST_ID: TFloatField;
    sdqConsultaST_DESCRIPCION: TStringField;
    sdqConsultaST_ULTIMOTICKET: TFloatField;
    sdqConsultaST_FECHAULTIMOTICKET: TDateTimeField;
    sdqConsultaST_PREFIJO_ASUNTO_MAIL: TStringField;
    sdqConsultaST_TITULO_MAIL: TStringField;
    sdqConsultaST_INTERNO: TStringField;
    sdqConsultaST_COLOR: TStringField;
    sdqConsultaST_HEADER: TStringField;
    sdqConsultaST_SUBHEADER_NEW: TStringField;
    sdqConsultaST_SUBHEADER_AUTH: TStringField;
    sdqConsultaST_SUBHEADER_QUALI: TStringField;
    sdqConsultaST_SUBHEADER_INFO: TStringField;
    sdqConsultaST_HOME: TStringField;
    sdqConsultaST_USUALTA: TStringField;
    sdqConsultaST_FECHAALTA: TDateTimeField;
    sdqConsultaST_USUMODIF: TStringField;
    sdqConsultaST_FECHAMODIF: TDateTimeField;
    sdqConsultaST_USUBAJA: TStringField;
    sdqConsultaST_FECHABAJA: TDateTimeField;
    Label28: TLabel;
    procedure FormCreate(Sender: TObject);
    function HexToTColor(sColor : string) : TColor;
    function TColorToHex(Color : TColor) : string;
    function IsValidHexa(sColor : string) : Boolean;

    procedure cbColorChange(Sender: TObject);
    procedure edColorChange(Sender: TObject);
    procedure edColorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbModificarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
      var Background: TColor; Highlight: Boolean);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
    procedure ClearData; override;
  end;

var
  frmSistemasDeTickets: TfrmSistemasDeTickets;

implementation

uses
  SqlFuncs, unSesion, unDmPrincipal, VCLExtra, CustomDlgs, unFiltros, General;

{$R *.dfm}

{ TfrmSistemasDeTickets }

procedure TfrmSistemasDeTickets.cbColorChange(Sender: TObject);
begin
  inherited;
  lbColor.Font.Color := cbColor.Selected;
  edColor.Text := TColorToHex(cbColor.Selected);
end;

procedure TfrmSistemasDeTickets.ClearControls;
begin
  inherited;
  edDescripcion.Clear;
  edUltimoTicket.Text := '0';
  edFechaUltimoTicket.Date := Now;
  edPrefijoAsuntoMail.Clear;
  edTituloMail.Clear;
  edInterno.Clear;
  edColor.Clear;
  edEncabezadoEnLaWeb.Clear;
  edSubheaderNew.Clear;
  edSubheaderAuth.Clear;
  edSubheaderQuali.Clear;
  edSubheaderInfo.Clear;
  edHome.Clear;
  cbColor.Selected := clBlack;
  edColor.Text := '000000';
end;

procedure TfrmSistemasDeTickets.ClearData;
begin
  ClearComponentData(pnlFiltros);
  inherited;
end;

function TfrmSistemasDeTickets.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('ST_ID', sdqConsulta.FieldByName('ST_ID').AsInteger);
    Sql.Fields.Add('ST_FECHABAJA', exDate);
    Sql.Fields.Add('ST_USUBAJA', Sesion.UserID);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddInteger('ST_ID', ValorSQLInteger('SELECT NVL(MAX(ST_ID), 0) FROM COMPUTOS.CST_SISTEMATICKET') + 1);
      Sql.Fields.Add('ST_FECHAALTA', exDate);
      Sql.Fields.Add('ST_USUALTA', Sesion.UserID);
      Sql.SqlType := stInsert;
    end else
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('ST_ID', sdqConsulta.FieldByName('ST_ID').AsInteger);
      Sql.Fields.Add('ST_FECHAMODIF', exDate);
      Sql.Fields.Add('ST_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('ST_FECHABAJA', exNull);
      Sql.Fields.Add('ST_USUBAJA', exNull);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('ST_DESCRIPCION', edDescripcion.Text);
    Sql.Fields.Add('ST_ULTIMOTICKET', edUltimoTicket.Text);
    Sql.Fields.Add('ST_FECHAULTIMOTICKET', edFechaUltimoTicket.Date);
    Sql.Fields.Add('ST_PREFIJO_ASUNTO_MAIL', edPrefijoAsuntoMail.Text);
    Sql.Fields.Add('ST_TITULO_MAIL', edTituloMail.Text);
    Sql.Fields.Add('ST_INTERNO', edinterno.Text);
    Sql.Fields.Add('ST_COLOR', edColor.Text);
    Sql.Fields.Add('ST_HEADER', edEncabezadoEnLaWeb.Text);
    Sql.Fields.Add('ST_SUBHEADER_NEW', edSubheaderNew.Text);
    Sql.Fields.Add('ST_SUBHEADER_AUTH', edSubheaderAuth.Text);
    Sql.Fields.Add('ST_SUBHEADER_QUALI', edSubheaderQuali.Text);
    Sql.Fields.Add('ST_SUBHEADER_INFO', edSubheaderInfo.Text);
    Sql.Fields.Add('ST_HOME', edHome.Text);
  end;
  Result := inherited DoABM;
end;

procedure TfrmSistemasDeTickets.edColorChange(Sender: TObject);
begin
  if IsValidHexa(edColor.Text) then
  begin
    lbColor.Font.Color := HexToTColor(edColor.Text);
    cbColor.Selected := HexToTColor(edColor.Text);
  end;
end;

procedure TfrmSistemasDeTickets.edColorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not (Char(key) in ['0'..'9','a'..'f', 'A'..'F', #7, #8, #13]) then
  begin
    Key := ord(#0);
  end
  else
  if IsValidHexa(edColor.Text) then
  begin
    lbColor.Font.Color := HexToTColor(edColor.Text);
    cbColor.Selected := HexToTColor(edColor.Text);
  end;

end;

procedure TfrmSistemasDeTickets.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMPUTOS.CST_SISTEMATICKET';
  FieldBaja := 'ST_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  lbColor.Caption := Sesion.Usuario;
  VCLExtra.LockControls([edUltimoTicket, edFechaUltimoTicket], True);
  AutoColWidths := True;
end;

procedure TfrmSistemasDeTickets.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(UpperCase(Field.FullName), ['ST_COLOR']) then
  begin
      AFont.Color := HexToTColor(sdqConsulta.FieldByName('ST_COLOR').AsString);
  end;
end;

procedure TfrmSistemasDeTickets.LoadControls;
begin
  edDescripcion.Text := sdqConsulta.FieldByName('ST_DESCRIPCION').AsString;
  edUltimoTicket.Value := sdqConsulta.FieldByName('ST_ULTIMOTICKET').AsInteger;
  edFechaUltimoTicket.Date := sdqConsulta.FieldByName('ST_FECHAULTIMOTICKET').AsDateTime;
  edPrefijoAsuntoMail.Text := sdqConsulta.FieldByName('ST_PREFIJO_ASUNTO_MAIL').AsString;
  edTituloMail.Text := sdqConsulta.FieldByName('ST_TITULO_MAIL').AsString;
  edinterno.Text := sdqConsulta.FieldByName('ST_INTERNO').AsString;
  edColor.Text := sdqConsulta.FieldByName('ST_COLOR').AsString;
  edEncabezadoEnLaWeb.Text := sdqConsulta.FieldByName('ST_HEADER').AsString;
  edSubheaderNew.Text := sdqConsulta.FieldByName('ST_SUBHEADER_NEW').AsString;
  edSubheaderAuth.Text := sdqConsulta.FieldByName('ST_SUBHEADER_AUTH').AsString;
  edSubheaderQuali.Text := sdqConsulta.FieldByName('ST_SUBHEADER_QUALI').AsString;
  edSubheaderInfo.Text := sdqConsulta.FieldByName('ST_SUBHEADER_INFO').AsString;
  edHome.Text := sdqConsulta.FieldByName('ST_HOME').AsString;
  lbColor.Font.Color := HexToTColor(edColor.Text);
  cbColor.Selected := HexToTColor(edColor.Text);
end;

procedure TfrmSistemasDeTickets.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmSistemasDeTickets.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not sdqConsulta.FieldByName(FieldBaja).IsNull) then
  begin
    if MsgAsk('El registro esta dado de baja. ¿Desea reactivarlo?')then
      inherited;
  end
  else
     inherited;
end;

function TfrmSistemasDeTickets.Validar: Boolean;
begin
  Verificar(Trim(edDescripcion.Text)='', edDescripcion, 'Debe completar el campo descripción.');
  Verificar(Trim(edPrefijoAsuntoMail.Text)='', edPrefijoAsuntoMail, 'Debe completar el campo prefijo asunto mail.');
  Verificar(Trim(edTituloMail.Text)='', edTituloMail, 'Debe completar el campo título mail.');
  Verificar(Trim(edInterno.Text)='', edInterno, 'Debe completar el campo interno.');
  Verificar(Length(edColor.Text) <> 6, edColor, 'Debe completar el campo con 6 dígitos.');
  Verificar(Trim(edEncabezadoEnLaWeb.Text)='', edEncabezadoEnLaWeb, 'Debe completar el campo encabezado en la web.');
  Verificar(Trim(edSubheaderNew.Text)='', edSubheaderNew, 'Debe completar el campo subheader new.');
  Verificar(Trim(edSubheaderAuth.Text)='', edSubheaderAuth, 'Debe completar el campo subheader authorization.');
  Verificar(Trim(edSubheaderQuali.Text)='', edSubheaderQuali, 'Debe completar el campo subheader qualification.');
  Verificar(Trim(edSubheaderInfo.Text)='', edSubheaderInfo, 'Debe completar el campo subheader info.');
  Verificar(Trim(edHome.Text)='', edHome, 'Debe completar el campo Texto Home.');
  Verificar(not IsValidHexa(edColor.Text), edColor, 'Por favor ingrese un nro. hexadecimal válido.');
  Result := True;
end;

function TfrmSistemasDeTickets.HexToTColor(sColor : string) : TColor;
 begin
    if(Copy(sColor, 1, 2)<>'')and(Copy(sColor, 3, 2)<>'')and(Copy(sColor, 5, 2)<>'')then
    Result :=
      RGB(
        StrToInt('$'+Copy(sColor, 1, 2)),
        StrToInt('$'+Copy(sColor, 3, 2)),
        StrToInt('$'+Copy(sColor, 5, 2))
      )
    else
     Result :=
      RGB(
        StrToInt('$'+'AA'),
        StrToInt('$'+'AA'),
        StrToInt('$'+'AA')
      ) ;
 end;

function TfrmSistemasDeTickets.TColorToHex(Color : TColor) : string;
 begin
    Result :=
      IntToHex(GetRValue(Color), 2) +
      IntToHex(GetGValue(Color), 2) +
      IntToHex(GetBValue(Color), 2) ;
 end;

function TfrmSistemasDeTickets.IsValidHexa(sColor : string) : Boolean;
var i : Integer;
begin
  Result := false;
  for i := 1 to length(sColor) do
    if not (sColor[i] in ['0'..'9','a'..'f','A'..'F']) then exit;
  Result := true;
end;

end.
