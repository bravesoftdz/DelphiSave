unit unGeneraDBF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Db, SDEngine, IntEdit, Placemnt, Mask, ToolEdit,
  DataExport, DataToDbf, PatternEdit, DataToXLS;

type
  TfrmGeneraDBF = class(TForm)
    Label1: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Bevel1: TBevel;
    sdqConsulta: TSDQuery;
    sdqParametro: TSDQuery;
    edIDLIQ: TIntEdit;
    Label2: TLabel;
    edDirectorio: TDirectoryEdit;
    FormStorage: TFormStorage;
    DataToXLS: TDataToXLS;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  frmGeneraDBF: TfrmGeneraDBF;

implementation

uses
  unDmPrincipal, unPrincipal, FileCtrl, CustomDlgs, StrFuncs, AnsiSql, unSesion;

{$R *.DFM}

procedure TfrmGeneraDBF.btnAceptarClick(Sender: TObject);
var
  sSql : string;
  bGenerado: Boolean;
begin
  if not DirectoryExists( edDirectorio.Text ) Then
    InvalidMsg( edDirectorio, 'Directorio inválido o inexistente' )
  else begin
    bGenerado := False;

    //Llamo a la consulta en el Oracle que genera la tabla temporaria
    sSql := 'COMISION.DO_TMPDBF(:IdLiquidacion, :Usuario ); ';
    EjecutarStoreEx(sSql, [edIDLIQ.Value, Sesion.UserID]);

    sSql := 'SELECT TB_CODIGO CORTE, TB_ESPECIAL1 ADICIONAL ' +
              'FROM CTB_TABLAS ' +
             'WHERE TB_CLAVE = ''CBDBF'' ' +
               'AND TB_CODIGO <> 0 ' +
               'AND TB_FECHABAJA IS NULL';
    OpenQuery(sdqParametro, sSql, True);

    while not sdqParametro.Eof do
    begin
      sSQL := 'SELECT CB_NOMBRE RAZON , CB_CUIT CUIT2, CB_SUMAFIJA SUMAINI, CB_VARIABLE PORCINI, NVL(CB_SUCURSAL, EN_CODBANCO) CODORG, ' +
                     'VE_VENDEDOR CODVEND, CB_COBRADONETO PAGOS, CB_IMPCANT IMPCANT, CB_COMISION COMISION, ' +
                     'CB_OS RET_OS, CB_COMISIONNETA COM_NETA, CB_VIGENCIADESDE VIGENCIADESDE ' +
                'FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, TCB_COMISIONESBANCO ' +
               'WHERE EV_ID = CB_IDENTIDADVEND ' +
                 'AND EN_ID = EV_IDENTIDAD ' +
                 'AND VE_ID = EV_IDVENDEDOR ' +
                 'AND CB_USUALTA = :Usuario ' +
                 'AND CB_CORTE = :Corte ' ;

      OpenQueryEx(sdqConsulta, [Sesion.UserID, sdqParametro.FieldByName('CORTE').AsString], sSQL, True);

      if not sdqConsulta.IsEmpty then
        begin
          DataToXLS.SaveToFile( IncludeTrailingBackslash( edDirectorio.Text ) + sdqParametro.FieldByName('ADICIONAL').AsString + '.xls' );
          bGenerado := True;
        end;

      //Sigue con los campos restantes
      sdqParametro.Next;
    end;

    //Cerrar el formulario
    if bGenerado then
      begin
        MsgBox( 'Los archivos han sido generados.', MB_ICONEXCLAMATION );
        Close;
      end
    else
      MsgBox( 'No se ha generado ningún archivo.', MB_ICONERROR );
  end;
end;

procedure TfrmGeneraDBF.btnCancelarClick(Sender: TObject);
begin
  Close;
end;
    
procedure TfrmGeneraDBF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
    
end.
