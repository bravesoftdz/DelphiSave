unit unCompaniaSeguroRetiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, unArtFrame, unFraCodigoDescripcion, Placemnt,
  unArtDBAwareFrame;

type
  TfrmCompaniaSeguroRetiro = class(TForm)
    lbSeguroRetiro: TLabel;
    fraSeguroRetiro: TfraCodigoDescripcion;
    BevelAbm: TBevel;
    btnAceptarSeguroRetiro: TButton;
    btnCancelarSeguroRetiro: TButton;
    FormStorage: TFormStorage;
    procedure btnAceptarSeguroRetiroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FSiniestro: Integer;
    FOrden: Integer;
    FRecaida: Integer;
    FConceptoPago: Integer;
    function IsDatosValidosSeguroRetiro: Boolean;
    function GetCodigoCiaSeguroRetiro(iSiniestro, iOrden: Integer): String;
    function ExistenDatosEconomicos(iSiniestro, iOrden: Integer): Boolean;
  public
    property Siniestro: Integer Read FSiniestro Write FSiniestro;
    property Orden: Integer Read FOrden Write FOrden;
    property Recaida: Integer Read FRecaida Write FRecaida;
    property ConceptoPago: Integer Read FConceptoPago Write FConceptoPago;
  end;

  function PuedeCargarCompaniaSeguroReturo(iSiniestro, iOrden: Integer): Boolean;

implementation

uses AnsiSql, unDmPrincipal, unSesion, SqlFuncs, CustomDlgs, unArt,
  Strfuncs;
{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompaniaSeguroRetiro.btnAceptarSeguroRetiroClick(Sender: TObject);
begin
  if IsDatosValidosSeguroRetiro() then
  try
    // actualizo los datos de la compañía de seguro de retiro del trabajador
    with TSql.Create('SECB_CBASEEXPSIN') do
    try
      PrimaryKey.Add('CB_SINIESTRO',      Siniestro);
      PrimaryKey.Add('CB_ORDEN',          Orden);
      Fields.Add('CB_SEGURORETIRO',       fraSeguroRetiro.Value);
      Fields.Add('CB_FECHASEGURORETIRO',  exDate);
      Fields.Add('CB_USUMODIF',           Sesion.UserID);
      Fields.Add('CB_FMODIF',             exDate);

      SqlType := stUpdate;
      EjecutarSql(Sql);
    finally
      Free;
    end;

    MsgBox('La compañía de seguro de retiro se grabó correctamente', MB_OK + MB_ICONINFORMATION);

    ModalResult := mrOk;
  except
    on E: Exception do
      raise Exception.Create (E.Message + CRLF + 'Error al grabar la compañía de seguro de retiro');
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ by NWK, 12/03/03 }
{ Determina si los datos ingresados del seguro de retiro son o no válidos }
function TfrmCompaniaSeguroRetiro.IsDatosValidosSeguroRetiro: Boolean;
var
  sSql, sCod: String;
begin
  // deben existir los datos económicos
  Verificar(not ExistenDatosEconomicos(Siniestro, Orden), fraSeguroRetiro.edCodigo,
            'Falta información de los datos económicos, no se puede grabar la selección');
  // compañía de seguro obligatoria
  Verificar(not fraSeguroRetiro.IsSelected, fraSeguroRetiro.edCodigo, 'Debe ingresar la compañía de seguro de retiro');

 // no deben existir liquidaciones para la compañia anterior
  sSql := 'SELECT MAX(le_codseguroretiro) ' +
           ' FROM sle_liquiempsin ' +
          ' WHERE le_siniestro = :Sin ' +
            ' AND le_orden = :Ord ' +
            ' AND le_recaida = :Reca ' +
            ' AND le_imporperi > 0 ' +
            ' AND NVL(le_estado, '' '') NOT IN (''X'',''A'') ' +
            ' AND le_conpago = :Conc ' +
            ' AND le_codseguroretiro IS NOT NULL';
  sCod := ValorSqlEx(sSql, [Siniestro, Orden, Recaida, ConceptoPago]);

  Verificar(not(IsEmptyString(sCod)) and (sCod <> fraSeguroRetiro.Codigo), fraSeguroRetiro.edCodigo,
            'Ya existen liquidaciones para la compañía de retiro');

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompaniaSeguroRetiro.FormCreate(Sender: TObject);
begin
  with fraSeguroRetiro do
  begin
    TableName   := 'SUR_SEGURORETIRO';
    FieldId     := 'UR_CODIGO';
    FieldCodigo := 'UR_CODIGO';
    FieldDesc   := 'UR_NOMBRE';
    FieldBaja   := 'UR_FECHABAJA';
    ShowBajas   := False;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ by NWK, 21/03/03 }
function TfrmCompaniaSeguroRetiro.GetCodigoCiaSeguroRetiro(iSiniestro, iOrden: Integer): String;
var
  sSql: String;
begin
  sSql := 'SELECT cb_seguroretiro ' +
           ' FROM secb_cbaseexpsin ' +
          ' WHERE cb_siniestro = :Sin ' +
            ' AND cb_orden = :Ord';
  Result := ValorSqlEx(sSql, [iSiniestro, iOrden]);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompaniaSeguroRetiro.FormShow(Sender: TObject);
begin
  fraSeguroRetiro.Codigo := GetCodigoCiaSeguroRetiro(Siniestro, Orden);
end;
{----------------------------------------------------------------------------------------------------------------------}
{ by NWK, 12/03/03 }
{ Determina si se puede cargar la compañía de seguro del trabajador }
function PuedeCargarCompaniaSeguroReturo(iSiniestro, iOrden: Integer): Boolean;
var
  sSql: String;
begin
  Result := False;
  // debe haber cargado algún siniestro
  if (iSiniestro = 0) or (iOrden = 0) then
    MsgBox ('Debe ingresar algún nro. de siniestro')
  else begin
    sSql := 'SELECT liq.is_afjpreparto(:Sin, :Ord) FROM dual';
    // valida si puede cargar la compañía de seguro
    if ValorSqlEx(sSql, [iSiniestro, iOrden]) <> '1' then
      MsgBox ('El trabajador no pertenece al régimen de reparto')
    else
      Result := True;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmCompaniaSeguroRetiro.ExistenDatosEconomicos(iSiniestro, iOrden: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
           ' FROM secb_cbaseexpsin ' +
          ' WHERE cb_siniestro = :Sin ' +
            ' AND cb_orden = :Ord ';
  Result := (ExisteSqlEx(sSql, [iSiniestro, iOrden]));
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
