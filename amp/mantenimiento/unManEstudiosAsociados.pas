{-----------------------------------------------------------------------------
 Unit Name: unManEstadosAsociados
 Author:    racastro
 Date:      20-May-2008
 Purpose:   Mantenimiento de Asociación entre Estudios para Seguimiento
 History:
-----------------------------------------------------------------------------}

unit unManEstudiosAsociados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, ANSISql,
  unFraCodigoDescripcion, unArtDBAwareFrame, RXCtrls;

type
  TfrmManEstudiosAsociados = class(TfrmCustomGridABM)
    fraEstBase: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    clbEstAsociado: TRxCheckListBox;
    sdqEdoFinal: TSDQuery;
    procedure FormCreate(Sender: TObject);
  protected
    { Private declarations }
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    procedure OnEstudioBaseChange(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmManEstudiosAsociados: TfrmManEstudiosAsociados;

implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

{$R *.dfm}

{------------------------------------------------------------------------------}

procedure TfrmManEstudiosAsociados.ClearControls;
begin
  inherited;

  fraEstBase.Clear;
  clbEstAsociado.Clear;
end;

{------------------------------------------------------------------------------}

function TfrmManEstudiosAsociados.DoABM: Boolean;
var
  EstudioBase,
  EstudioAsociado,
  i: integer;
  Existe : boolean;
begin
  Result := true;

  if ModoABM = maBaja Then
  begin
    Sql.Clear;

    Sql.PrimaryKey.Add('ea_id', sdqConsulta.FieldByName('ea_id').AsInteger);
    Sql.Fields.Add('ea_usubaja', Sesion.LoginName );
    Sql.Fields.Add('ea_fechabaja', exDateTime );
    Sql.SqlType := stUpdate;

    Result := inherited DoABM;
  end
  else begin
    EstudioBase := fraEstBase.Value;

    for i := 0 to clbEstAsociado.Items.Count-1 do
    begin
      EstudioAsociado := Integer(clbEstAsociado.Items.Objects[i]);

      Sql.Clear;
      Sql.Fields.Add('ea_estudiobase', EstudioBase);
      Sql.Fields.Add('ea_estudioasociado', EstudioAsociado);

      Existe := ExisteSQL('SELECT 1 ' +
                          '  FROM hys.hea_estudioasociado ' +
                          ' WHERE ea_estudiobase = ' + SqlValue (EstudioBase) +
                          '   AND ea_estudioasociado = ' + SqlValue (EstudioAsociado));

      case clbEstAsociado.Checked[i] of
        true: if not Existe then
              begin
                ModoABM := maAlta;

                Sql.PrimaryKey.Add('ea_id', GetSecNextVal('hys.seq_hes_id') );
                Sql.Fields.Add('ea_usualta', Sesion.LoginName );
                Sql.Fields.Add('ea_fechaalta', exDateTime );
                Sql.SqlType := stInsert
              end
              else begin
                ModoABM := maModificacion;

                Sql.PrimaryKey.Add ('ea_id',
                                    ValorSqlInteger('SELECT ea_id ' +
                                                    '  FROM hys.hea_estudioasociado ' +
                                                    ' WHERE ea_estudiobase = ' + SqlValue (EstudioBase) +
                                                    '   AND ea_estudioasociado = ' + SqlValue (EstudioAsociado)));
                Sql.Fields.Add('ea_usumodif', Sesion.LoginName );
                Sql.Fields.Add('ea_fechamodif', exDateTime );
                Sql.Fields.Add('ea_usubaja', exNull );
                Sql.Fields.Add('ea_fechabaja', exNull );
                Sql.SqlType := stUpdate;
              end
        else  if Existe then
              begin
                ModoABM := maBaja;

                Sql.PrimaryKey.Add ('ea_id',
                                    ValorSqlInteger('SELECT ea_id ' +
                                                    '  FROM hys.hea_estudioasociado ' +
                                                    ' WHERE ea_estudiobase = ' + SqlValue (EstudioBase) +
                                                    '   AND ea_estudioasociado = ' + SqlValue (EstudioAsociado)));
                Sql.Fields.Add('ea_usubaja', Sesion.LoginName );
                Sql.Fields.Add('ea_fechabaja', exDateTime );
                Sql.SqlType := stUpdate;
              end
              else
                ModoABM := maNone;
      end;

      if ModoABM <> maNone then
        Result := inherited DoABM
    end
  end
end;

{------------------------------------------------------------------------------}

procedure TfrmManEstudiosAsociados.LoadControls;
begin
  inherited;

  fraEstBase.Value := sdqConsulta.FieldByName('idbase').AsInteger;

  OnEstudioBaseChange(nil);
end;

{------------------------------------------------------------------------------}

function TfrmManEstudiosAsociados.Validar: Boolean;
begin
  Result := True;
  VerificarMultiple(['Guardando Estudios Asociados',
                     fraEstBase,
                     fraEstBase.IsSelected or (fraEstBase.edCodigo.Text = '00000000'),
                     'Debe Seleccionar un Estudio Base'
                    ]);
end;

{------------------------------------------------------------------------------}

procedure TfrmManEstudiosAsociados.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ea_fechabaja';
  Sql.TableName := 'hys.hea_estudioasociado';
  CheckPK := false;

  with fraEstBase do
  begin
    TableName   := 'art.aes_estudios';
    FieldID     := 'es_id';
    FieldCodigo := 'es_codigo';
    FieldDesc   := 'es_descripcion';
    FieldBaja   := 'es_fechabaja';
    OnChange    := OnEstudioBaseChange;
    ShowBajas   := true;
  end;
end;

{------------------------------------------------------------------------------}

procedure TfrmManEstudiosAsociados.OnEstudioBaseChange(Sender: TObject);
begin
  clbEstAsociado.Clear;

  with sdqEdoFinal do
  begin
    ParamByName('idbase').Value := fraEstBase.Value;
    Open;

    while not EoF do
    begin
      clbEstAsociado.Items.AddObject(FieldByName('descripcion').AsString,
                                  TObject(FieldByName('es_id').AsInteger));
      clbEstAsociado.Checked[clbEstAsociado.Items.Count-1] := not FieldByName('ea_id').IsNull and
                                                        FieldByName('ea_fechabaja').IsNull;
      Next
    end;

    Close
  end;
end;

{------------------------------------------------------------------------------}

end.


