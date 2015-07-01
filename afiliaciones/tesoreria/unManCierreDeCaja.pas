unit unManCierreDeCaja;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   21-08-03
 ULTIMA MODIFICACION: 17-09-03
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox;

type
  TfrmManCierreDeCaja = class(TfrmCustomGridABM)
    cmbCC_TIPO: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbCC_FECHACAJA: TDateComboBox;
    cmbAccion: TComboBox;
    tbAbrirCerrar: TToolButton;
    tbSalir2: TToolButton;
    procedure tbRefrescarClick(Sender: TObject); 
    procedure tbAbrirCerrarClick(Sender: TObject);
    procedure cmbAccionChange(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
    procedure cmbCC_TIPOChange(Sender: TObject);
  private
    fIDCaja: String;
    fTipoCaja: String;

    function Get_ProxFechaAbrirCaja(Tipo: String): TDateTime;
    function Get_TipoCaja: String;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  end;

var
  frmManCierreDeCaja: TfrmManCierreDeCaja;

implementation

{$R *.DFM}

uses
  unDmPrincipal, unPrincipal, SqlFuncs, AnsiSql, CustomDlgs, unDmFinancials, unSesion;
  
procedure TfrmManCierreDeCaja.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT CC_FECHACAJA FECHA, DECODE(CC_TIPO, ''E'', ''Egreso'', ''I'', ''Ingreso'', ''V'', ''Efectivo'') TIPO, ' +
          '       DECODE(CC_ACTIVA, ''S'', ''SI'', ''NO'') ACTIVA,' +
          '       CC_USUALTA, CC_FECHAALTA, ' +
          '       CC_USUMODIF, CC_FECHAMODIF ' +
          '  FROM RCC_CIERRECAJA' +
          ' ORDER BY CC_ID DESC ';
  sdqConsulta.SQL.Clear;
  sdqConsulta.Sql.Add(sSql);
  
  inherited;
end;

procedure TfrmManCierreDeCaja.tbAbrirCerrarClick(Sender: TObject);
begin
  inherited;

  cmbAccion.ItemIndex  := 0;
  cmbCC_TIPO.ItemIndex := 0;
  cmbAccionChange(Sender);
  fpABM.ShowModal;
end;

function TfrmManCierreDeCaja.Validar: boolean;
var
  sSql: String;
begin
  fTipoCaja := Get_TipoCaja();

  Verificar(cmbAccion.ItemIndex = -1, cmbAccion, 'Debe elegir una acción a realizar.');
  Verificar(cmbCC_TIPO.ItemIndex = -1, cmbCC_TIPO, 'Debe elegir una caja.');
  Verificar((cmbAccion.ItemIndex = 0) and (cmbCC_FECHACAJA.IsEmpty), cmbCC_FECHACAJA, 'Debe indicar la fecha de apertura de la caja.');

  if (cmbAccion.ItemIndex = 0) then //Abrir caja -> NO tiene que haber una caja abierta
  begin
    fIDCaja := ValorSql('SELECT CC_ID FROM RCC_CIERRECAJA WHERE CC_TIPO = ''' + fTipoCaja + ''' AND CC_ACTIVA = ''S''','');
    Verificar(fIDCaja <> '', cmbAccion, 'La caja ya se encuentra abierta.');

//    dFecha := ValorSqlDateTime('SELECT MAX(CC_FECHACAJA) FROM RCC_CIERRECAJA ');
//    Verificar(dFecha + 1 <= cmbCC_FECHACAJA.Date, cmbCC_FECHACAJA, 'La fecha de apertura de la caja debe ser posterior a la última ingresada.');
  end;

  if (cmbAccion.ItemIndex = 1) then //Cerrar caja -> Tiene que haber una caja abierta
  begin
    fIDCaja := ValorSql( 'SELECT CC_ID FROM RCC_CIERRECAJA WHERE CC_TIPO = ''' + fTipoCaja + ''' AND CC_ACTIVA = ''S''','');
    Verificar(fIDCaja = '', nil, 'La caja no está abierta.');

    //No pueden haber valores sin recibo
    Verificar(ExisteSql('SELECT 1 FROM ZVA_VALOR WHERE VA_ESTADO = ''01'' AND COBRANZA.GETTIPORECIBOVALOR(VA_ID) IN (''01'', ''02'', ''04'', ''08'')'),
              nil, 'La caja no se puede cerrar si existen valores sin recibo.');

    //No pueden haber boletas de deposito sin fecha
    Verificar(ExisteSql('SELECT 1 FROM RBD_BOLETADEPOSITO WHERE BD_FECHA IS NULL'), nil, 'La caja no se puede cerrar si existen boletas de deposito sin fecha.');

    if fTipoCaja = 'V' then   // efectivo
      begin
        sSql := 'SELECT 1 ' +
                  'FROM CTB_TABLAS ' +
                 'WHERE TB_CLAVE = ''TFFEF'' ' +
                   'AND TB_ESPECIAL1 <> (SELECT NVL(SUM(EF_MONTOINGRESO-EF_MONTOEGRESO), 0) ' +
                                          'FROM REF_EFECTIVO ' +
                                         'WHERE EF_FECHABAJA IS NULL ' +
                                           'AND EF_TIPO = TB_CODIGO)';
        Verificar(ExisteSql(sSql), nil, 'El saldo de efectivo no es igual al establecido.');
      end;
  end;

  Result := True;
end;

function TfrmManCierreDeCaja.DoABM: Boolean;
var
  dFecha: TDateTime;
begin
  Sql.Clear;
  Sql.TableName := 'RCC_CIERRECAJA';

  if cmbAccion.ItemIndex = 0 then
  begin
    //Abrir caja
    Sql.SqlType := stInsert;
    Sql.PrimaryKey.Add('CC_ID', 'SEQ_RCC_ID.NEXTVAL', False);
    Sql.Fields.Add('CC_FECHACAJA', cmbCC_FECHACAJA.Date);
    Sql.Fields.Add('CC_TIPO', fTipoCaja);
    Sql.Fields.Add('CC_ACTIVA', 'S');
    Sql.Fields.Add('CC_FECHAALTA', SQL_ACTUALDATE, False);
    Sql.Fields.Add('CC_USUALTA', Sesion.UserID);
  end
  else
  begin
    //Cerrar caja
    Sql.SqlType := stUpdate;

    Sql.PrimaryKey.Add('CC_ID', fIDCaja);
    Sql.Fields.Add('CC_TIPO', fTipoCaja);
    Sql.Fields.Add('CC_ACTIVA', 'N');
    Sql.Fields.Add('CC_FECHAMODIF', SQL_ACTUALDATE, False);
    Sql.Fields.Add('CC_USUMODIF', Sesion.UserID);
  end;

  dFecha := ValorSqlDateTime('SELECT CC_FECHACAJA FROM RCC_CIERRECAJA WHERE CC_TIPO = ''' + fTipoCaja + ''' AND CC_ACTIVA = ''S''', 0);
  Result := inherited DoABM;

  if Result and (cmbCC_TIPO.ItemIndex = 1) and (cmbAccion.ItemIndex = 1) then
    with dmFinancials do
    begin
      Conectar;
      dmFinancials.EjecutarStore('ART_TESORERIA.DO_INTERFACEASIENTOS(''T'',' + SQLDate(dFecha) + ',' + SQLValue(Sesion.UserID) + ');');
      DesConectar;
    end;
end;

procedure TfrmManCierreDeCaja.cmbAccionChange(Sender: TObject);
var
  sTipo: String;
begin
  if (cmbAccion.ItemIndex = 0) then    //Abrir caja -> NO tiene que haber una caja abierta
  begin
    sTipo := Get_TipoCaja();

    cmbCC_FECHACAJA.Date := Get_ProxFechaAbrirCaja(sTipo);
  end
  else
    cmbCC_FECHACAJA.Clear;
end;

procedure TfrmManCierreDeCaja.ClearControls;
begin
  //Evita el warning del compilador por no tener definido un metodo (abstracto en la clase base)
end;

procedure TfrmManCierreDeCaja.LoadControls;
begin
  //Evita el warning del compilador por no tener definido un metodo (abstracto en la clase base)
end;

function TfrmManCierreDeCaja.Get_ProxFechaAbrirCaja(Tipo: String): TDateTime;
var
  sSql: String;
begin
  sSql := 'SELECT NVL(MAX(CC_FECHACAJA) + 1, ACTUALDATE) ' +
            'FROM RCC_CIERRECAJA ' +
           'WHERE CC_TIPO=:Tipo';

  Result := ValorSqlDateTimeEx(sSql, [Tipo]);
end;

function TfrmManCierreDeCaja.Get_TipoCaja: String;
var
  sTipo: String;
begin
  case cmbCC_TIPO.ItemIndex of
    0: sTipo := 'E';
    1: sTipo := 'I';
  else
    sTipo := 'V';
  end;

  Result := sTipo;
end;

procedure TfrmManCierreDeCaja.fpAbmEnter(Sender: TObject);
begin
  cmbCC_FECHACAJA.Enabled := False;
end;

procedure TfrmManCierreDeCaja.cmbCC_TIPOChange(Sender: TObject);
begin
  cmbAccionChange(nil);
end;

end.
