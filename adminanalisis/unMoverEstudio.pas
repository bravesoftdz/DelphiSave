unit unMoverEstudio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, unfraEstablecimiento_OLD, unFraEmpresa, StdCtrls, Mask, ToolEdit,
  DateComboBox, unfraEstudio, unFraTrabajador, Cuit, unArtFrame,
  unFraCodigoDescripcion, unArtDBAwareFrame, unArtDbFrame, unFraEstablecimiento;

type
  TfrmMoverEstudio = class(TForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraEstablecimiento: TfraEstablecimiento_OLD;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    fraEstudio: TfraEstudio;
    Label1: TLabel;
    Label2: TLabel;
    Bevel4: TBevel;
    edFecha: TDateComboBox;
    edFechaText: TEdit;
    pnlDatos: TPanel;
    fraEmpresa: TfraEmpresa;
    fraTrabajador: TfraTrabajador;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edFechaExit(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    FCuit : TCuit;
    FEstableci : Integer;
    FCuil : TCuil;
    FFecha : TDateTime;
    FEstudio : String;
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnEstableciChange(Sender: TObject);
    procedure OnTrabajadorChange(Sender: TObject);
    procedure OnEstudioChange(Sender: TObject);
    function Validar : Boolean;
  public
    function Execute(ACuit : TCuit; AEstableci : Integer; ACuil : TCuil; AFecha : TDateTime; AEstudio : String) : boolean;
  end;
{
var
  frmMoverEstudio: TfrmMoverEstudio;
}
implementation

uses unDmPrincipal, CustomDlgs, AnsiSql, unPrincipal;

Const
  FONT_COLOR = clWindowText; {clGray; Esto no está terminado}

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
function TfrmMoverEstudio.Execute(ACuit: TCuit; AEstableci: Integer; ACuil: TCuil; AFecha: TDateTime; AEstudio: String): boolean;
begin
    FCuit      := ACuit;
    FEstableci := AEstableci;
    FCuil      := ACuil;
    FFecha     := AFecha;
    FEstudio   := AEstudio;

    fraEmpresa.mskCUIT.Text := ACuit;
//    fraEmpresa  .Value    := ACuit;

    fraEstablecimiento.Cargar( ACuit, AEstableci );
    fraTrabajador.CUIL := ACuil;
    edFecha.Date        := AFecha;
    edFechaExit( Nil );

    fraEstudio.Codigo := AEstudio;
//    fraEstudio.Value := AEstudio;

    fraEstudio.Formulario := fraEstudio.sdqDatos.FieldByName('ES_FORMULARIO').AsString ;
    if (fraEstudio.sdqDatos.FieldByName('ES_MAXIMO').AsInteger = 0) and (fraEstudio.sdqDatos.FieldByName('ES_MINIMO').AsInteger = 0) Then
       fraEstudio.TipoResultado := trBoleano
    else
       fraEstudio.TipoResultado := trNumerico;


    OnEmpresaChange( Nil );
    OnEstableciChange( Nil );
    OnTrabajadorChange( Nil );
    OnEstudioChange( Nil );

    Result := ShowModal = mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmMoverEstudio.FormCreate(Sender: TObject);
begin
     fraEmpresa.OnChange         := OnEmpresaChange;
     fraEmpresa.ShowBajas        := True;
     fraEstablecimiento.OnChange := OnEstableciChange;
     fraTrabajador.OnChange      := OnTrabajadorChange;
     fraEstudio.OnChange         := OnEstudioChange;

     edFecha.MaxDate := DBDateTime;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmMoverEstudio.OnEmpresaChange(Sender: TObject);
begin
     if not fraEmpresa.IsSelected Then begin
//     if fraEmpresa.Value = '' Then begin
        fraEstablecimiento.CUIT       := FCuit;
        fraEstablecimiento.Font.Color := clWindowText;

     end else begin
        fraEstablecimiento.CUIT       := fraEmpresa.mskCUIT.Text;
//        fraEstablecimiento.CUIT       := fraEmpresa.Value;
        fraEstablecimiento.Font.Color := FONT_COLOR;

     end;
     {-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --}
     if fraEmpresa.mskCUIT.Text = FCuit Then
//     if fraEmpresa.Value = FCuit Then
        fraEmpresa.Font.Color := FONT_COLOR
     else
        fraEmpresa.Font.Color := clWindowText;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmMoverEstudio.OnEstableciChange(Sender: TObject);
begin
     if (fraEmpresa.mskCUIT.Text = FCuit) and (fraEstablecimiento.edCodigo.Value = FEstableci) Then
//     if (fraEmpresa.Value = FCuit) and (fraEstablecimiento.edCodigo.Value = FEstableci) Then
        fraEstablecimiento.Font.Color := FONT_COLOR
     else
        fraEstablecimiento.Font.Color := clWindowText;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmMoverEstudio.edFechaExit(Sender: TObject);
begin
   edFechaText.Text := edFecha.LongDate ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmMoverEstudio.OnEstudioChange(Sender: TObject);
begin
     if fraEstudio.edCodigo.Text = FEstudio Then
        fraEstudio.Font.Color := FONT_COLOR
     else
        fraEstudio.Font.Color := clWindowText;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmMoverEstudio.OnTrabajadorChange(Sender: TObject);
begin
     if fraTrabajador.CUIL = FCuil Then
        fraTrabajador.Font.Color := FONT_COLOR
     else
        fraTrabajador.Font.Color := clWindowText;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmMoverEstudio.btnAceptarClick(Sender: TObject);
begin
   if Validar Then
       Try
          //BeginTrans;
          EjecutarSql( 'BEGIN '  +
                         'AMP.MoverEstudio(' + SqlValue (FCuit) + ', ' +
                                               SqlValue (FEstableci) + ', ' +
                                               SqlValue (FCuil) + ', ' +
                                               SqlValue (FFecha) + ', ' +
                                               SqlValue (FEstudio) + ', ' +
                                               SqlValue (fraEmpresa.mskCUIT.Text) + ', ' +
    //                                           '''' + fraEmpresa.Value + ''', ' +
                                               SqlValue(fraEstablecimiento.edCodigo.Value) + ', ' +
                                               SqlValue (fraTrabajador.CUIL) + ', ' +
                                               edFecha.SqlText + ', ' +
                                               SqlValue (fraEstudio.edCodigo.Text) + ', ' +
                                               SqlValue (frmPrincipal.dbLogin.UserId) + '); ' +
                       'END;' );
          //CommitTrans;
          ModalResult := mrOk;
       Except
          On E: Exception do begin
             //RollBack;
             ErrorMsg( E, 'Error al mover el estudio' );
          end;
       end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmMoverEstudio.Validar: Boolean;
begin
     Result := False ;
     if ( Trim( fraEmpresa.mskCUIT.Text ) = '' ) then
        InvalidMsg(fraEmpresa.mskCUIT, 'Se debe ingresar el CUIT de la empresa')

     else if ( Trim( fraEstablecimiento.edCodigo.Text ) = '' ) then
        InvalidMsg(fraEstablecimiento.edCodigo, 'Se debe ingresar el Establecimiento')

     else if ( Trim( fraTrabajador.mskCUIL.Text ) = '' ) then
        InvalidMsg(fraTrabajador.mskCUIL, 'Se debe ingresar el CUIL del trabajador')

     else if ( Trim( fraEstudio.edCodigo.Text ) = '' ) then
        InvalidMsg(fraEstudio.edCodigo, 'Se debe seleccionar un Estudio')

     else if ( edFecha.Date = 0 ) then
        InvalidMsg(edFecha, 'Se debe seleccionar la Fecha del Estudio')

     else if (fraEmpresa.mskCUIT.Text  = FCuit) and
             (fraEstablecimiento.edCodigo.Value = FEstableci) and
             (fraTrabajador.CUIL = FCuil) and
             (fraEstudio.edCodigo.Text = FEstudio) and
             (edFecha.Date = FFecha ) then
        InvalidMsg(nil, 'No se registraron cambios')

     else
        Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
