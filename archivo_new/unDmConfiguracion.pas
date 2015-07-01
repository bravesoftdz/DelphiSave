unit unDmConfiguracion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArt, DBComboGrid,
  SDEngine, VCLExtra, AnsiSql, SqlFuncs, unDmPrincipal, unSesion;

type
  TdmConfiguracion = class(TDataModule)
  private
    FArchivoActivo: Integer;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    procedure   SetMenuItem(FormOrigen: TForm; const Value: Integer);
    procedure   SetTipoArchivo(FormOrigen: TForm; ATipoArchivo: TTableId);
    { Public declarations }
  published
    property ArchivoActivo: Integer read FArchivoActivo write FArchivoActivo;
  end;

var
  dmConfiguracion: TdmConfiguracion;

implementation

uses unUtilsArchivo, unConstantArchivo;


{$R *.DFM}

{ TdmConfiguracion }
constructor TdmConfiguracion.Create(AOwner: TComponent);
begin
  inherited;
  FArchivoActivo := 0;
end;

procedure TdmConfiguracion.SetMenuItem(FormOrigen: TForm; const Value: Integer);
var
  nComp : Integer;
begin
  if FArchivoActivo <> Value then
  begin
    FArchivoActivo := Value;
    if FArchivoActivo <> 0 then
    begin
      for nComp := 0 to Application.ComponentCount - 1  do
      begin
//        if FormOrigen.Components[nComp].Name = 'cmbTipoArchivo' then
        if FormOrigen.Components[nComp].Name = 'edTipoArchivo' then
       // TDBComboGrid(FormOrigen.Components[nComp]).Text := StringReplace(FMenuItem.Caption, '&', '', []);
        //      edTipoArchivo.Text := StringReplace(FMenuItem.Caption, '&', '', []);
      end;
      SetTipoArchivo(FormOrigen, FArchivoActivo);
//      FMenuItem.Enabled := False;
    end;
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TdmConfiguracion.SetTipoArchivo(FormOrigen: TForm; ATipoArchivo: TTableId);
var
  sSql: string;
  sdqTipoArchivo: TSDQuery;
begin
//  FIdTipoArchivo := ATipoArchivo;
  if ATipoArchivo = ART_EMPTY_ID Then
  begin
    LockControls( FormOrigen, True );
//    btnCancelar.Enabled := True;
  end else
  begin
    sSql := 'SELECT TA_DESCRIPCION, TA_FORMULARIO, TA_TABLA ' +
              'FROM ART.RTA_TIPOARCHIVO ' +
             'WHERE TA_ID = ' + SqlValue(ATipoArchivo);
    sdqTipoArchivo := GetQuery(sSql);
    try
//      edTipoArchivo.Text := sdqTipoArchivo.FieldByName('TA_DESCRIPCION').AsString;
//      FTabla             := sdqTipoArchivo.FieldByName('TA_TABLA').AsString;
  //    FFormulario        := StrToFormulario(sdqTipoArchivo.FieldByName('TA_FORMULARIO').AsString);

    //  fraCarpetaTipo.ExtraCondition := ' AND TB_ESPECIAL1 = ' + SqlValue(FTabla);
//      CheckPage;
    finally
      sdqTipoArchivo.Free;
    end;
  end;
end;




end.
