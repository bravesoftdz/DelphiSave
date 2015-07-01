unit unCuitDuplicada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmCuitDuplicada = class(TfrmCustomConsulta)
    procedure tbEliminarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fCuitVendedor: string;
    fCuitEntidad: string;
    fID_Entidad: integer;
    procedure SetCuitVendedor(const Value: string);
    procedure SetCuitEntidad(const Value: string);
  public
    property CuitVendedor: string read fCuitVendedor write SetCuitVendedor;
    property CuitEntidad: string read fCuitEntidad write SetCuitEntidad;
    property ID_Entidad: integer read fID_Entidad write fID_Entidad;
  end;

var
  frmCuitDuplicada: TfrmCuitDuplicada;

implementation
Uses
  unPrincipal, CustomDlgs, AnsiSql, unDmPrincipal, SqlFuncs;
{$R *.DFM}

{ TfrmCuitDuplicada }

procedure TfrmCuitDuplicada.SetCuitEntidad(const Value: string);
var
  sSql: string;
begin
  fCuitEntidad := Value;
  sSql := 'SELECT VE_ID, VE_VENDEDOR CODIGO, VE_CUIT CUIT, VE_NOMBRE NOMBRE, VE_FECHABAJA FECHABAJA ' +
            'FROM XVE_VENDEDOR ' +
           'WHERE VE_CUIT = :CUIT ' +
             'AND NOT EXISTS ( SELECT 1 ' +
                                'FROM XEV_ENTIDADVENDEDOR ' +
                               'WHERE VE_ID = EV_IDVENDEDOR ' +
                                 'AND EV_IDENTIDAD = :ENTIDAD )';
  Caption := 'Vendedores que poseen el mismo CUIT';
  sdqConsulta.SQL.Clear;
  OpenQueryEx(sdqConsulta, [fCuitEntidad, fID_Entidad], sSQL);
end;

procedure TfrmCuitDuplicada.SetCuitVendedor(const Value: string);
var
  sSql: string;
begin
  fCuitVendedor := Value;
  Caption := 'Entidades que poseen el mismo CUIT';
  sSql := 'SELECT EN_ID, EN_CODBANCO CODIGO, EN_CUIT CUIT, EN_NOMBRE NOMBRE, EN_FECHABAJA FECHABAJA' +
          '  FROM XEN_ENTIDAD ' +
          ' WHERE EN_CUIT = ' + SqlValue(fCuitVendedor);
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Text := sSql;
  OpenQuery( sdqConsulta );
end;

procedure TfrmCuitDuplicada.tbEliminarClick(Sender: TObject);
var
  Sql: TSql;
begin
  Verificar(((not sdqConsulta.Active) or sdqConsulta.Eof), Grid, 'Debe elegir un registro.');

  if fCuitVendedor <> '' then
  begin
    Verificar(sdqConsulta.FieldByName('FECHABAJA').AsString <> '', Grid, 'La entidad ya ha sido dada de baja.');
    if MsgAsk('Está por dar de baja la entidad y todas sus relaciones activas.' + #13#10 + '¿Está seguro de querer continuar?') then
    begin
      Sql := TSql.Create('');
      try
        BeginTrans;
        try
          Sql.Clear;
          Sql.TableName := 'XEN_ENTIDAD';
          Sql.PrimaryKey.Add( 'EN_ID',    sdqConsulta.FieldByName('EN_ID').AsInteger );
          Sql.Fields.Add( 'EN_FECHABAJA', 'ACTUALDATE', False );
          Sql.Fields.Add( 'EN_USUBAJA',   frmPrincipal.DBLogin.UserID );
          Sql.SqlType := stUpdate;
          EjecutarSqlST( Sql.Sql );

          Sql.Clear;
          Sql.TableName := 'XEV_ENTIDADVENDEDOR';
          Sql.PrimaryKey.Add( 'EV_IDENTIDAD', sdqConsulta.FieldByName('EN_ID').AsInteger );
          Sql.Fields.Add( 'EV_FECHABAJA', 'ACTUALDATE', False );
          Sql.Fields.Add( 'EV_USUBAJA',   frmPrincipal.DBLogin.UserID );
          Sql.SqlType := stUpdate;
          EjecutarSqlST( Sql.Sql + ' AND EV_FECHABAJA IS NULL');

          CommitTrans;
        except
          on E: Exception do
          begin
            RollBack;
            MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
        end;
      finally
        Sql.Free;
      end;
    end;
  end
  else
  begin
    Verificar(sdqConsulta.FieldByName('FECHABAJA').AsString <> '', Grid, 'El vendedor ya ha sido dado de baja.');
    if MsgAsk('Está por dar de baja el vendedor y todas sus relaciones activas.' + #13#10 + '¿Está seguro de querer continuar?') then
    begin
      Sql := TSql.Create('');
      try
        BeginTrans;
        try
          Sql.Clear;
          Sql.TableName := 'XVE_VENDEDOR';
          Sql.PrimaryKey.Add( 'VE_ID',    sdqConsulta.FieldByName('VE_ID').AsInteger );
          Sql.Fields.Add( 'VE_FECHABAJA', 'ACTUALDATE', False );
          Sql.Fields.Add( 'VE_USUBAJA',   frmPrincipal.DBLogin.UserID );
          Sql.SqlType := stUpdate;
          EjecutarSqlST( Sql.Sql );

          Sql.Clear;
          Sql.TableName := 'XEV_ENTIDADVENDEDOR';
          Sql.PrimaryKey.Add( 'EV_IDVENDEDOR', sdqConsulta.FieldByName('VE_ID').AsInteger );
          Sql.Fields.Add( 'EV_FECHABAJA', 'ACTUALDATE', False );
          Sql.Fields.Add( 'EV_USUBAJA',   frmPrincipal.DBLogin.UserID );
          Sql.SqlType := stUpdate;
          EjecutarSqlST( Sql.Sql + ' AND EV_FECHABAJA IS NULL');

          CommitTrans;
          sdqConsulta.Refresh;
        except
          on E: Exception do
          begin
            RollBack;
            MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
        end;
      finally
        Sql.Free;
      end;
    end;
  end;
  tbRefrescar.Click;
end;

procedure TfrmCuitDuplicada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCuitDuplicada := nil;
  inherited;
end;

end.
