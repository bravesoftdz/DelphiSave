unit unManCTB_EVCHE;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   10-10-03
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, Mask, PatternEdit,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unComunes,
  unFraStaticCodigoDescripcion, unArtDBAwareFrame;

type
  TfrmManCTB_EVCHE = class(TfrmManCtbTablas)
    fraCodigoModulo: TfraStaticCodigoDescripcion;
    Label2: TLabel;
    fraCodigoCodTexto: TfraStaticCodigoDescripcion;
    ToolButton1: TToolButton;
    chkSoloActivos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure chkSoloActivosClick(Sender: TObject);
  private
    FArea: TAreas;

    function GetCodTexto(ID: String): Integer;
    function GetEntidadRelacion(IDModulo, IdCodTexto: Integer): Integer;
    function GetModulo(ID: String): Integer;

    procedure fraCodigoModuloOnChange(Sender: TObject);
    procedure SetArea(const Value: TAreas);
  protected
    function DoABM: Boolean; override;
    function GetSql: String; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure SetEspecialVisible(const Value: Boolean); override;    
  public
    property Area: TAreas read FArea write SetArea;
  end;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, unCustomGridABM;
  
{$R *.DFM}

procedure TfrmManCTB_EVCHE.ClearControls;
begin
  inherited;
  fraCodigoModulo.Clear;
  fraCodigoCodTexto.Clear;
end;

function TfrmManCTB_EVCHE.DoABM: Boolean;
var
  Especial: String;
begin
  //Carga el valor que le corresponde a TB_ESPECIAL1
  if (ModoABM <> maBaja) and (not fraCodigoModulo.IsEmpty) then
    Especial := IntToStr(GetEntidadRelacion(fraCodigoModulo.Value, fraCodigoCodTexto.Value))
  else
    Especial := '';
  edEspecial.Text := Especial;

  //sigue adelante con el resto...
  Result := inherited DoABM;
end;

procedure TfrmManCTB_EVCHE.FormCreate(Sender: TObject);
begin
  inherited;

  ShowBajas       := False;
  Clave           := 'EVCHE';
  EspecialVisible := True;
  
  with fraCodigoModulo do
  begin
    TableName   := 'CAT_AREATEXTO';
    FieldID     := 'AT_ID';
    FieldCodigo := 'AT_ID';
    FieldDesc   := 'AT_DESCRIPCION';
    FieldBaja   := 'AT_FECHABAJA';
    ShowBajas   := False;;
    OnChange    := fraCodigoModuloOnChange;
  end;

  with fraCodigoCodTexto do
  begin
    TableName   := 'CTC_TEXTOCARTA';
    FieldID     := 'TC_ID';
    FieldCodigo := 'TC_ID';
    FieldDesc   := 'TC_NOMBRE';
    FieldBaja   := 'TC_FECHABAJA';
    ShowBajas   := False;
  end;
end;

procedure TfrmManCTB_EVCHE.fraCodigoModuloOnChange(Sender: TObject);
begin
  fraCodigoCodTexto.Sql :=
    'SELECT DISTINCT TC_ID AS ID, TC_ID AS CODIGO, TC_NOMBRE AS DESCRIPCION, TC_FECHABAJA AS BAJA' +
     ' FROM CTC_TEXTOCARTA, CTA_TEXTOAREA' +
    ' WHERE TC_ID = TA_IDTEXTOCARTA' +
      ' AND TA_FECHABAJA IS NULL' +
      ' AND TA_IDAREATEXTO=' + SqlValue(fraCodigoModulo.Value);
end;

function TfrmManCTB_EVCHE.GetCodTexto(ID: String): Integer;
begin
  Result := ValorSql('SELECT TA_IDTEXTOCARTA' +
                      ' FROM CTA_TEXTOAREA' +
                     ' WHERE TA_ID = ' + ID);
end;

function TfrmManCTB_EVCHE.GetEntidadRelacion(IDModulo, IdCodTexto: Integer): Integer;
begin
  Result := ValorSql('SELECT TA_ID' +
                      ' FROM CTA_TEXTOAREA' +
                     ' WHERE TA_IDTEXTOCARTA = ' + SqlValue(IdCodTexto) +
                       ' AND TA_IDAREATEXTO = ' + SqlValue(IDModulo));
end;

function TfrmManCTB_EVCHE.GetModulo(ID: String): Integer;
begin
  Result := ValorSql('SELECT TA_IDAREATEXTO' +
                      ' FROM CTA_TEXTOAREA' +
                     ' WHERE TA_ID = ' + ID);
end;

procedure TfrmManCTB_EVCHE.LoadControls;
begin
  inherited;
  fraCodigoModulo.Value   := GetModulo(sdqConsulta.FieldByName('TB_ESPECIAL1').AsString);
  fraCodigoCodTexto.Value := GetCodTexto(sdqConsulta.FieldByName('TB_ESPECIAL1').AsString);
end;

procedure TfrmManCTB_EVCHE.SetEspecialVisible(const Value: Boolean);
begin
  inherited;
  edEspecial.Visible := False;
end;

function TfrmManCTB_EVCHE.Validar: Boolean;
begin
  Result := False;
  if not fraCodigoModulo.IsEmpty and fraCodigoCodTexto.IsEmpty then
    InvalidMsg(fraCodigoCodTexto, 'El texto es obligatorio si ingresa un módulo.')
  else
    Result := inherited Validar;
end;

procedure TfrmManCTB_EVCHE.SetArea(const Value: TAreas);
begin
  if FArea <> Value then
  begin
    FArea := Value;

    case FArea Of
      aCobranzas:
        fraCodigoModulo.ExtraCondition := ' AND AT_AREA = ' + SqlValue(AREA_COB);

      aAfiliaciones:
        // desde afiliaciones, también se incluye al area técnica
        fraCodigoModulo.ExtraCondition := ' AND AT_AREA IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
    end;
  end;
end;

procedure TfrmManCTB_EVCHE.chkSoloActivosClick(Sender: TObject);
begin
  ShowBajas := not chkSoloActivos.Checked;

  tbRefrescarClick(nil);
end;

function TfrmManCTB_EVCHE.GetSql: String;
var
  sSql: String;
begin
  sSql :=
    'SELECT TB_CODIGO, TB_DESCRIPCION, TB_MODULO, TB_ESPECIAL1, TB_BAJA, TC_NOMBRE TEXTO, TB_USUALTA,' +
          ' TRUNC(TB_FECHAALTA) TB_FECHAALTA' +
     ' FROM CTB_TABLAS, CTC_TEXTOCARTA, CTA_TEXTOAREA' +
    ' WHERE TB_CLAVE = :pClave' +
      ' AND (TB_MODULO = :pModulo OR :pModulo IS NULL)' +
      ' AND TB_CODIGO <> ''0''' +
      ' AND TA_ID(+)= TB_ESPECIAL1' +
      ' AND TA_IDTEXTOCARTA = TC_ID(+)';

  Result := sSql;
end;

end.
