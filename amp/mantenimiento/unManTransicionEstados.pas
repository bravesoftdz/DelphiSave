{-----------------------------------------------------------------------------
 Unit Name: unManTransicionEstados
 Author:    racastro
 Date:      15-Feb-2008
 Purpose:   Mantenimiento de transición entre estados
 History:
-----------------------------------------------------------------------------}

unit unManTransicionEstados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, ANSISql,
  unFraCodigoDescripcion, unArtDBAwareFrame, RXCtrls;

type
  TfrmManTransicionEstados = class(TfrmCustomGridABM)
    fraEstadoInicial: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    clbEdoFinal: TRxCheckListBox;
    sdqEdoFinal: TSDQuery;
    procedure FormCreate(Sender: TObject);
  protected
    { Private declarations }
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    procedure OnEstadoInicialChange(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmManTransicionEstados: TfrmManTransicionEstados;

implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

{$R *.dfm}

{------------------------------------------------------------------------------}

procedure TfrmManTransicionEstados.ClearControls;
begin
  inherited;

  fraEstadoInicial.Clear;
  clbEdoFinal.Clear;
end;

{------------------------------------------------------------------------------}

function TfrmManTransicionEstados.DoABM: Boolean;
var
  EstadoInicial,
  EstadoFinal: String;
  Existe : boolean;
  i: integer;
begin
  Result := true;

  if ModoABM = maBaja Then
  begin
    Sql.Clear;

    Sql.PrimaryKey.Add('te_id', sdqConsulta.FieldByName('te_id').AsInteger);
    Sql.Fields.Add('te_usubaja', Sesion.LoginName );
    Sql.Fields.Add('te_fechabaja', exDateTime );
    Sql.SqlType := stUpdate;

    Result := inherited DoABM;
  end
  else begin
    EstadoInicial := fraEstadoInicial.Codigo;

    for i := 0 to clbEdoFinal.Items.Count-1 do
    begin
      EstadoFinal := char(clbEdoFinal.Items.Objects[i]);

      Sql.Clear;
      Sql.Fields.Add('te_inicial', EstadoInicial);
      Sql.Fields.Add('te_final', EstadoFinal);

      Existe := ExisteSQL('SELECT 1 ' +
                          '  FROM hys.hte_transicionestado ' +
                          ' WHERE te_inicial = ' + SqlValue (EstadoInicial) +
                          '   AND te_final = ' + SqlValue (EstadoFinal));

      case clbEdoFinal.Checked[i] of
        true: if not Existe then
              begin
                ModoABM := maAlta;

                Sql.PrimaryKey.Add('te_id', GetSecNextVal('hys.seq_htr_id') );
                Sql.Fields.Add('te_usualta', Sesion.LoginName );
                Sql.Fields.Add('te_fechaalta', exDateTime );
                Sql.SqlType := stInsert
              end
              else begin
                ModoABM := maModificacion;

                Sql.PrimaryKey.Add ('te_id',
                                    ValorSqlInteger('SELECT te_id ' +
                                                    '  FROM hys.hte_transicionestado ' +
                                                    ' WHERE te_inicial = ' + SqlValue (EstadoInicial) +
                                                    '   AND te_final = ' + SqlValue (EstadoFinal)));
                Sql.Fields.Add('te_usumodif', Sesion.LoginName );
                Sql.Fields.Add('te_fechamodif', exDateTime );
                Sql.Fields.Add('te_usubaja', exNull );
                Sql.Fields.Add('te_fechabaja', exNull );
                Sql.SqlType := stUpdate;
              end
        else  if Existe then
              begin
                ModoABM := maBaja;

                Sql.PrimaryKey.Add ('te_id',
                                    ValorSqlInteger('SELECT te_id ' +
                                                    '  FROM hys.hte_transicionestado ' +
                                                    ' WHERE te_inicial = ' + SqlValue (EstadoInicial) +
                                                    '   AND te_final = ' + SqlValue (EstadoFinal)));
                Sql.Fields.Add('te_usubaja', Sesion.LoginName );
                Sql.Fields.Add('te_fechabaja', exDateTime );
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

procedure TfrmManTransicionEstados.LoadControls;
begin
  inherited;

  fraEstadoInicial.Value := sdqConsulta.FieldByName('id_inicial').AsInteger;

  OnEstadoInicialChange(nil);
end;

{------------------------------------------------------------------------------}

function TfrmManTransicionEstados.Validar: Boolean;
begin
  Result := True;
  VerificarMultiple(['Guardando Transición de Estados',
                      fraEstadoInicial, fraEstadoInicial.IsSelected, 'Debe Seleccionar un Estado Inicial'
                    ]);
end;

{------------------------------------------------------------------------------}

procedure TfrmManTransicionEstados.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'te_fechabaja';
  Sql.TableName := 'hys.hte_transicionestado';
  CheckPK := false;

  with fraEstadoInicial do
  begin
    TableName := 'hys.hde_descripcionestadolote';
    FieldID     := 'de_id';
    FieldCodigo := 'de_codigo';
    FieldDesc   := 'de_descripcion';
    FieldBaja   := 'de_fechabaja';
    OnChange    := OnEstadoInicialChange;
  end;
end;

{------------------------------------------------------------------------------}

procedure TfrmManTransicionEstados.OnEstadoInicialChange(Sender: TObject);
begin
  clbEdoFinal.Clear;

  with sdqEdoFinal do
  begin
    ParamByName('pinicial').Value := fraEstadoInicial.Codigo;
    Open;

    while not EoF do
    begin
      clbEdoFinal.Items.AddObject(FieldByName('de_descripcion').AsString,
                                  TObject(FieldByName('de_codigo').AsString[1]));
      clbEdoFinal.Checked[clbEdoFinal.Items.Count-1] := not FieldByName('te_id').IsNull and
                                                        FieldByName('te_fechabaja').IsNull;
      Next
    end;

    Close
  end;

end;

{------------------------------------------------------------------------------}

end.


