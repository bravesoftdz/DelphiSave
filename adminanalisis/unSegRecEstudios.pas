unit unSegRecEstudios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unArtFrame, unArtDbFrame, unFraReconfirmacion,
  Cuit, unArtDBAwareFrame;

type
  TfrmSegRecEstudios = class(TfrmCustomGridABM)
    Label2: TLabel;
    fraReconfirmacion: TfraReconfirmacion;
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FEvento: Integer;
    FCuil: TCuil;
    FFecha: TDateTime;
    procedure SetCuil(const Value: TCuil);
    procedure SetFecha(const Value: TDateTime);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: Boolean; override;
    function Validar : Boolean; override;
  public
  published
    property Cuil   : TCuil     read FCuil     write SetCuil;
    property Evento : Integer   read FEvento   write FEvento;
    property Fecha  : TDateTime read FFecha    write SetFecha;
  end;

implementation

uses unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmSegRecEstudios }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSegRecEstudios.ClearControls;
begin
  fraReconfirmacion.Clear ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmSegRecEstudios.DoABM: Boolean;
begin
    ModoABMToSqlType;
    Sql.Clear ;
    Sql.TableName := 'ARS_RECONFIRMACIONESTUDIO';
    Sql.PrimaryKey.Add( 'RS_CUIL',    FCuil );
    Sql.PrimaryKey.Add( 'RS_EVENTO',  FEvento );

    if ModoABM = maBaja Then begin
       Sql.PrimaryKey.Add( 'RS_ESTUDIO', sdqConsulta.FieldByName('RS_ESTUDIO').AsString );
       Sql.PrimaryKey.Add( 'RS_FECHA',   sdqConsulta.FieldByName('RS_FECHA').AsDateTime );
    end else begin
//       Sql.PrimaryKey.Add( 'RS_ESTUDIO', fraEstudio.edCodigo.Text );
       Sql.PrimaryKey.Add( 'RS_ESTUDIO', fraReconfirmacion.Value.Estudio );
       Sql.PrimaryKey.Add( 'RS_FECHA',   fraReconfirmacion.Value.Fecha );
    end;

    Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSegRecEstudios.LoadControls;
begin
  fraReconfirmacion.Value := Reconfirmacion(sdqConsulta.FieldByName('RS_FECHA').AsDateTime,
                                            sdqConsulta.FieldByName('RS_ESTUDIO').AsString, 0);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSegRecEstudios.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived     := False;                              
  CAPTION_ALTA    := 'Agregar Estudio Reconfirmado';
  CAPTION_MODIFIC := 'Modificar Estudio Reconfirmado';
  MSG_BAJA        := '¿Desea eliminar el estudio reconfirmado seleccionado?';
  MSG_PK_VIOLATED := 'No se pudo ingresar el estudio reconfirmado porque ya existe para la misma fecha';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmSegRecEstudios.Validar: Boolean;
begin
   Result := False;
   if fraReconfirmacion.IsEmpty Then
      InvalidMsg( fraReconfirmacion.cmbEstudio, 'Debe seleccionar la fecha del exámen a reconfirmar')

   else
      Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSegRecEstudios.tbNuevoClick(Sender: TObject);
begin
  if (FCuil <> '') and (FEvento <> 0) Then
     inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSegRecEstudios.tbEliminarClick(Sender: TObject);
begin
  if (FCuil <> '') and (FEvento <> 0) Then
     inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSegRecEstudios.SetCuil(const Value: TCuil);
begin
  if FCuil <> Value Then begin
     FCuil := Value;
     fraReconfirmacion.Cuil   := FCuil;
     tbRefrescarClick( Nil );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSegRecEstudios.SetFecha(const Value: TDateTime);
begin
  if FFecha <> Value then begin
     FFecha := Value;
     fraReconfirmacion.Fecha := Value;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSegRecEstudios.tbRefrescarClick(Sender: TObject);
begin
  if (FCuil <> '') and (FEvento <> 0) Then begin
      sdqConsulta.Sql.Text := 'SELECT RS_CUIL, RS_EVENTO, RS_ESTUDIO, ES_DESCRIPCION, RS_FECHA ' +
                                'FROM AES_ESTUDIOS, ARS_RECONFIRMACIONESTUDIO ' +
                               'WHERE RS_ESTUDIO = ES_CODIGO ' +
                                 'AND RS_CUIL = ''' + FCuil + ''' ' +
                                 'AND RS_EVENTO = ' + SqlInt( FEvento );

      inherited; { Ejecuta la Consulta SQL }

      tbNuevo.Enabled      := True;
      tbEliminar.Enabled   := True;
  end else begin
      tbNuevo.Enabled      := False;
      tbEliminar.Enabled   := False;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSegRecEstudios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
