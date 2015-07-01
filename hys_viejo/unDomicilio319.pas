unit unDomicilio319;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unFraDomicilio,
  Mask, ToolEdit, DateComboBox;

type
  TfrmDomicilio319 = class(TfrmCustomGridABM)
    lbFRecepcion: TLabel;
    edFechaRecepcion: TDateComboBox;
    lbFechaInicio: TLabel;
    edFechaInicioObra: TDateComboBox;
    Label3: TLabel;
    edFechaFinObra: TDateComboBox;
    grbDomicilio: TGroupBox;
    fraDomicilio319: TfraDomicilio;
    Label1: TLabel;
    edObservaciones: TMemo;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
    FDomModificado : Boolean;
    procedure SetDomModificado(const Value: Boolean);
  public
    { Public declarations }
    FIDProgramaSeguridad : Integer;
    property DomModificado      : Boolean  read FDomModificado write setDomModificado;
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmDomicilio319: TfrmDomicilio319;

implementation

uses
  unDmPrincipal, SqlFuncs, ansiSql, VclExtra, CustomDlgs, unSesion, General,
  unCustomConsulta;

{$R *.dfm}

procedure TfrmDomicilio319.ClearControls;
begin
  inherited;
  fraDomicilio319.Clear;
  edFechaRecepcion.Clear;
  edFechaInicioObra.Clear;
  edFechaFinObra.Clear;
  edObservaciones.Clear;
end;

function TfrmDomicilio319.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('do_id').AsInteger;
      Sql.Fields.Add('do_usubaja', Sesion.UserID );
      Sql.Fields.Add('do_fechabaja', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      FDomModificado := True;
      Sql.Fields.Add('do_idprogramaseguridad', FIDProgramaSeguridad);
      Sql.Fields.Add('do_calle',fraDomicilio319.Calle);
      Sql.Fields.Add('do_numero',fraDomicilio319.Numero);
      Sql.Fields.Add('do_piso',fraDomicilio319.Piso);
      Sql.Fields.Add('do_departamento',fraDomicilio319.Departamento);
      Sql.Fields.Add('do_cpostal',fraDomicilio319.CodigoPostal);
      Sql.Fields.Add('do_cpostala',fraDomicilio319.CPA);
      Sql.Fields.Add('do_localidad',fraDomicilio319.Localidad);
      Sql.Fields.Add('do_provincia',fraDomicilio319.Prov);
      Sql.Fields.Add('do_fecharecepcion',edFechaRecepcion.Date);
      Sql.Fields.Add('do_fechainicioobra',edFechaInicioObra.Date);
      Sql.Fields.Add('do_fechafinobra',edFechaFinObra.Date);
      Sql.Fields.Add('do_observaciones',edObservaciones.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HDO_ID');
        Sql.Fields.Add('do_usualta', Sesion.UserID );
        Sql.Fields.Add('do_fechaalta', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('do_id').AsInteger;
        Sql.Fields.Add('do_usumodif', Sesion.UserID);
        Sql.Fields.Add('do_fechamodif', exDateTime );
        Sql.Fields.Add('do_usubaja', exNull );
        Sql.Fields.Add('do_fechabaja', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('do_id', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TfrmDomicilio319.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'do_fechabaja';
  Sql.TableName := 'hys.hdo_domicilio319';
  sdqConsulta.ParamByName('progseg').AsInteger := FIDProgramaSeguridad;
end;

procedure TfrmDomicilio319.LoadControls;
begin
  inherited;
  ClearControls;
  fraDomicilio319.Cargar(sdqConsulta.FieldByName('do_calle').AsString,
                         sdqConsulta.FieldByName('do_cpostal').AsString,
                         sdqConsulta.FieldByName('do_localidad').AsString,
                         sdqConsulta.FieldByName('do_numero').AsString,
                         sdqConsulta.FieldByName('do_piso').AsString,
                         sdqConsulta.FieldByName('do_departamento').AsString,
                         sdqConsulta.FieldByName('do_provincia').AsString,
                         sdqConsulta.FieldByName('do_cpostala').AsString);
  edFechaRecepcion.Date  := sdqConsulta.FieldByName('do_fecharecepcion').AsDateTime;
  edFechaInicioObra.Date := sdqConsulta.FieldByName('do_fechainicioobra').AsDateTime;
  edFechaFinObra.Date    := sdqConsulta.FieldByName('do_fechafinobra').AsDateTime;
  edObservaciones.Text   := sdqConsulta.FieldByName('do_observaciones').AsString;
end;

procedure TfrmDomicilio319.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.ParamByName('progseg').AsInteger := FIDProgramaSeguridad;

  if FIDProgramaSeguridad > 0 then
  begin
    tbNuevo.Enabled := True;
  end
  else
    tbNuevo.Enabled := False;
  inherited;
end;

function TfrmDomicilio319.Validar: Boolean;
begin
  Verificar(not fraDomicilio319.IsValid, fraDomicilio319, 'Debe ingresar el Domicilio.');
  Verificar(edFechaRecepcion.Date = 0, edFechaRecepcion, 'Debe ingresar la fecha de recepción.');
  Verificar(edFechaInicioObra.Date = 0, edFechaInicioObra, 'Debe ingresar la fecha de Inicio de Obra.');
  Verificar(edFechaFinObra.Date = 0, edFechaFinObra, 'Debe ingresar la fecha de Fin de Obra.');
  result := true;
end;

procedure TfrmDomicilio319.SetDomModificado(const Value: Boolean);
begin
  FDomModificado := Value;
end;

end.
