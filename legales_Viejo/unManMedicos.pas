unit unManMedicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask;

type
  TfrmManMedico = class(TfrmCustomGridABM)
    edApellido: TEdit;
    lbApellido: TLabel;
    lbNombre: TLabel;
    edNombre: TEdit;
    lbDomicilio: TLabel;
    edDomicilio: TEdit;
    edCuitCuil: TMaskEdit;
    lblCuitCuil: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edCuitCuilExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmManMedico: TfrmManMedico;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs, AnsiSql;

procedure TfrmManMedico.ClearControls;
begin
  inherited;
  edApellido.Clear;
  edNombre.Clear;
  edDomicilio.Clear;
  edCuitCuil.Clear;
end;

function TfrmManMedico.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('MD_ID').AsInteger;
      Sql.Fields.Add('MD_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('MD_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('MD_APELLIDO', edApellido.Text);
      Sql.Fields.Add('MD_NOMBRE', edNombre.Text);
      Sql.Fields.Add('MD_DOMICILIO', edDomicilio.Text);
      Sql.Fields.Add('MD_CUITCUIL', edCuitCuil.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('LEGALES.SEQ_LMD_MED_ID');
        Sql.Fields.Add('MD_USUALTA', Sesion.UserID );
        Sql.Fields.Add('MD_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('MD_ID').AsInteger;
        Sql.Fields.Add('MD_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('MD_FECHAMODIF', exDateTime );
        Sql.Fields.Add('MD_USUBAJA', exNull );
        Sql.Fields.Add('MD_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('MD_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar los médicos.');
    end;
  end;

end;

procedure TfrmManMedico.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'MD_FECHABAJA';
  Sql.TableName := 'LEGALES.LMD_MEDICO';
end;

procedure TfrmManMedico.LoadControls;
begin
  inherited;
  ClearControls;
  edApellido.Text := sdqConsulta.FieldByName('MD_APELLIDO').AsString;
  edNombre.Text := sdqConsulta.FieldByName('MD_NOMBRE').AsString;
  edDomicilio.Text := sdqConsulta.FieldByName('MD_DOMICILIO').AsString;
  edCuitCuil.Text := sdqConsulta.FieldByName('MD_CUITCUIL').AsString;
end;

function TfrmManMedico.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(edApellido.Text),edApellido, 'Debe especificar el Apellido.');
  Verificar(IsEmptyString(edNombre.Text),edNombre, 'Debe especificar el Nombre.');
  Verificar(edDomicilio.Text = '', edDomicilio, 'Debe Especificar un domicilio para el Medico.');
  if edCuitCuil.Text <> '' then
    Verificar(ExisteSql('SELECT 1 FROM legales.lmd_medico WHERE md_cuitcuil = '+SqlValue(edCuitCuil.Text)+
                        '   AND md_id <> '+SqlValue(sdqConsulta.FieldByName('MD_ID').AsInteger)+
                        '   AND md_fechabaja IS NULL '),edCuitCuil,'Ya existe el cuil/Cuit.');
end;

procedure TfrmManMedico.edCuitCuilExit(Sender: TObject);
var
  codigomedico : integer;
begin
  inherited;
  if edCuitCuil.Text <> '' then
  begin
    if ModoABM = maAlta Then
      codigomedico := ValorSqlInteger('SELECT md_id FROM legales.lmd_medico WHERE md_cuitcuil = '+SqlValue(edCuitCuil.Text)+
                               '   AND md_fechabaja IS NULL ')
    else
      codigomedico := ValorSqlInteger('SELECT md_id FROM legales.lmd_medico WHERE md_cuitcuil = '+SqlValue(edCuitCuil.Text)+
                               '   AND md_id <> '+SqlValue(sdqConsulta.FieldByName('MD_ID').AsInteger)+
                               '   AND md_fechabaja IS NULL ');

    Verificar(codigomedico > 0,edCuitCuil,'Ya existe el cuil/Cuit.En el codigo '+IntToStr(codigomedico));
  end
  else
    MsgBox('El CUIT es información relevante a ser informada a los organismos de control, se aconseja su carga, sino posee el dato prosiga con la carga.');       
end;

end.
