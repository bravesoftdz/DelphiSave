{-----------------------------------------------------------------------------
 Unit Name: unfrmUbicacionActual
 Author:    cchiappero
 Date:      06-Abr-2006
 Purpose:   Interfaz que permite la localización inicial de una carpeta cuando
            no se haya registro anterior de esta. Equivale a la creación de la
            carpeta.
 History:   0.0 Versión Inicial
-----------------------------------------------------------------------------}

unit unfrmUbicacionActual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unArtFrame, unFraCodigoDescripcion, Strfuncs, CustomDlgs,
  unArtDBAwareFrame;

type
  TFrmUbicacionActual = class(TForm)
    gbUbicacion: TGroupBox;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraUbicacion: TfraCodigoDescripcion;
    lblUbicacion: TLabel;
    cmbTipoUbicacion: TComboBox;
    lblTipoUbicacion: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cmbTipoUbicacionChange(Sender: TObject);
  private
  public
    class function SeleccionarUbicacion(var ATipoUbicacion : String; var AUbicacion : string) : boolean;
  end;

var
  frmUbicacionActual: TFrmUbicacionActual;

implementation

uses
  unConstantArchivo;

{$R *.dfm}

class function TFrmUbicacionActual.SeleccionarUbicacion(var ATipoUbicacion, AUbicacion: string) : boolean;
begin
  with TfrmUbicacionActual.Create(nil) do
  try
    if ShowModal = mrOk then
    begin
      ATipoUbicacion := GetChar(cmbTipoUbicacion.Text);
      AUbicacion     := fraUbicacion.Codigo;
      result         := True;
    end
    else
      result := false;
  finally
    free;
  end;
end;

procedure TFrmUbicacionActual.btnAceptarClick(Sender: TObject);
begin
  if cmbTipoUbicacion.ItemIndex = -1 Then
    InvalidExcept(cmbTipoUbicacion, 'Debe seleccionar el Tipo de Ubicación donde enviará la carpeta');

  if fraUbicacion.IsEmpty Then
    InvalidExcept(fraUbicacion.edCodigo, 'Debe seleccionar la Ubicación donde enviará la carpeta');

  ModalResult := mrOk;
end;

procedure TFrmUbicacionActual.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmUbicacionActual.cmbTipoUbicacionChange(Sender: TObject);
begin
  with fraUbicacion do
  begin
    ExtraCondition := '';
    Clear;

    with cmbTipoUbicacion do
      case ItemIndex  of
        UBIC_DELEGACION:
        begin {Delegación}
          TableName   := 'DEL_DELEGACION';
          FieldID     := 'EL_ID';
          FieldCodigo := 'EL_ID';
          FieldDesc   := 'EL_NOMBRE';
          FieldBaja   := 'EL_FECHABAJA';
          ShowBajas   := False;
        end;

        UBIC_LUGAR:
        begin
          TableName   := 'CTB_TABLAS';
          FieldID     := 'TB_CODIGO';
          FieldCodigo := 'TB_CODIGO';
          FieldDesc   := 'TB_DESCRIPCION';
          {$IFDEF ART2}
          FieldBaja   := 'TB_FECHABAJA';
          {$ELSE}
          FieldBaja   := 'DECODE(TB_BAJA, ''S'', SYSDATE, NULL)';
          {$ENDIF}
          ExtraCondition := ' AND TB_CLAVE = ''UBIC'' ' +
                            ' AND TB_CODIGO <> ''0'' ';
          ShowBajas   := False;
        end;

        UBIC_SECTOR:
        begin
          TableName   := 'USC_SECTORES';
          FieldID     := 'SC_CODIGO';
          FieldCodigo := 'SC_CODIGO';
          FieldDesc   := 'SC_DESCRIPCION';
          FieldBaja   := 'SC_USUBAJA';
          ShowBajas   := False;
        end;

        UBIC_USUARIO:
        begin
          TableName   := 'USE_USUARIOS';
          FieldID     := 'SE_ID';
          FieldCodigo := 'SE_USUARIO';
          FieldDesc   := 'SE_NOMBRE';
          FieldBaja   := 'SE_FECHABAJA';
          ShowBajas   := False;
        end;
      end;
  end;

  fraUbicacion.Enabled := True;
end;

end.

