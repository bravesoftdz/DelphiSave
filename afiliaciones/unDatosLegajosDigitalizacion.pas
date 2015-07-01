unit unDatosLegajosDigitalizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, ExtCtrls, Mask, PatternEdit,
  IntEdit, unArt;

type
  TfrmDatosLegajosDigitalizacion = class(TfrmCustomForm)
    lblCantidadHojas: TLabel;
    edHojasLegajos: TIntEdit;
    lblObservaciones: TLabel;
    edObservacionesLegajos: TMemo;
    BevelAbm: TBevel;
    btnAceptarLegajos: TButton;
    btnCancelarLegajos: TButton;
    Button1: TButton;
    procedure btnCancelarLegajosClick(Sender: TObject);
    procedure btnAceptarLegajosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FIdFormulario: TTableId;
    FIdSolicitudAfiliacion: TTableId;
  public
  end;

  function GetObservacionesLegajos(aIdFormulario: TTableId): String;
  function DoCargarLegajosDigitalizacion(aIdSolicitudAfiliacion: TTableId): Boolean;

  procedure DoActualizarLegajosDigitalizacion(aHojasLegajos: Integer; aObservacionesLegajos: String; aIdSolicitudAfiliacion: TTableId);

implementation

uses
  CustomDlgs, unDmPrincipal, StrFuncs, General;

{$R *.dfm}

procedure TfrmDatosLegajosDigitalizacion.btnCancelarLegajosClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDatosLegajosDigitalizacion.btnAceptarLegajosClick(Sender: TObject);
begin
  Verificar(edHojasLegajos.Value = 0, edHojasLegajos, 'Debe indicar la cantidad total de hojas de los legajos.');

  DoActualizarLegajosDigitalizacion(edHojasLegajos.Value, edObservacionesLegajos.Lines.Text, FIdSolicitudAfiliacion);

  ModalResult := mrOk;
end;

function DoCargarLegajosDigitalizacion(aIdSolicitudAfiliacion: TTableId): Boolean;
var
  sSql: String;
begin
  with TfrmDatosLegajosDigitalizacion.Create(nil) do
    try
      FIdSolicitudAfiliacion := aIdSolicitudAfiliacion;

      sSql :=
        'SELECT sa_hojaslegajos hojaslegajos, sa_observacioneslegajos observacioneslegajos, sa_idformulario idformulario, sa_id idsolicitudafi' +
         ' FROM asa_solicitudafiliacion' +
        ' WHERE sa_id = :id';

      with GetQueryEx(sSql, [aIdSolicitudAfiliacion]) do
      try
        FIdFormulario                     := FieldByName('idformulario').AsInteger;
        edHojasLegajos.Value              := FieldByName('hojaslegajos').AsInteger;
        edObservacionesLegajos.Lines.Text := NVL(FieldByName('observacioneslegajos').AsString, GetObservacionesLegajos(FIdFormulario));
      finally
        Free;
      end;

      Result := (ShowModal = mrOk);
    finally
      Free;
    end;
end;

function GetObservacionesLegajos(aIdFormulario: TTableId): String;
var
  sSql: String;
begin
  Result := 'Constancia de Inscripción / ' +
          //  'Extranet SRT / ' +      eliminado tk 51483
            'Mi Simplificación / ';

  sSql :=
    'SELECT   df_descripcion' +
       ' FROM art.ado_documentacion, art.adf_documentoafi' +
      ' WHERE df_id = do_iddocumentoafi' +
        ' AND do_presente = ''S''' +
        ' AND do_fechabaja IS NULL' +
        ' AND df_usubaja IS NULL' +
        ' AND df_id <> 11' +
        ' AND do_idformulario = :idformulario' +
   ' ORDER BY df_id';
  with GetQueryEx(sSql, [aIdFormulario]) do
  try
    while not eof do
    begin
      Result := Result + FieldByName('df_descripcion').AsString + ' / ';
      Next;
    end;
  finally
    Free;
  end;

  sSql :=
    'SELECT 1' +
     ' FROM art.ape_personaexpuesta' +
    ' WHERE pe_idformulario = :idformulario' +
      ' AND pe_presente = ''S''';
  if ExisteSqlEx(sSql, [aIdFormulario]) then
    Result := Result + 'PEP / ';

  Result := CutRight(Result, 3);
end;

procedure DoActualizarLegajosDigitalizacion(aHojasLegajos: Integer; aObservacionesLegajos: String; aIdSolicitudAfiliacion: TTableId);
var
  sSql: String;
begin
  sSql :=
    'UPDATE asa_solicitudafiliacion' +
      ' SET sa_hojaslegajos = :hojaslegajos,' +
          ' sa_observacioneslegajos = :observacioneslegajos' +
    ' WHERE sa_id = :id';
  EjecutarSqlEx(sSql, [aHojasLegajos, aObservacionesLegajos, aIdSolicitudAfiliacion]);
end;

procedure TfrmDatosLegajosDigitalizacion.Button1Click(Sender: TObject);
begin
  edObservacionesLegajos.Lines.Text := GetObservacionesLegajos(FIdFormulario);
end;

end.
