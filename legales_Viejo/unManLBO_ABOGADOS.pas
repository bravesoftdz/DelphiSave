unit unManLBO_ABOGADOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, StdCtrls, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db,
  SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, IntEdit, Mask, PatternEdit;

type
  TfrmManLBO_ABOGADOS = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edBO_NOMBRE: TEdit;
    edBO_DIRECCION: TEdit;
    edBO_TELEFONO: TEdit;
    Label5: TLabel;
    edBO_DIRELECTRONICA: TEdit;
    edBO_CODIGO: TIntEdit;
    chkBO_PROVINCIART: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;

    function DoABM: Boolean; override;
  public
  end;

implementation

uses unPrincipal, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, Internet;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmCustomGridABM1 }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManLBO_ABOGADOS.ClearControls;
begin
  edBO_CODIGO.Value := IncSql('SELECT MAX(BO_CODIGO) FROM LBO_ABOGADOS');
  edBO_NOMBRE.Clear;
  edBO_DIRECCION.Clear;
  edBO_TELEFONO.Clear;
  chkBO_PROVINCIART.Checked := False;
  edBO_DIRELECTRONICA.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManLBO_ABOGADOS.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('BO_CODIGO', sdqConsulta.FieldByName('BO_CODIGO').AsInteger);
    Sql.Fields.Add('BO_USUBAJA', frmPrincipal.dbLogin.UserId );
    Sql.Fields.Add('BO_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.PrimaryKey.Add('BO_CODIGO', edBO_CODIGO.Value);
    Sql.Fields.Add('BO_NOMBRE', edBO_NOMBRE.Text);
    Sql.Fields.Add('BO_DIRECCION', edBO_DIRECCION.Text);
    Sql.Fields.Add('BO_TELEFONO', edBO_TELEFONO.Text);
    Sql.Fields.Add('BO_PROVINCIART', chkBO_PROVINCIART.Checked);
    Sql.Fields.Add('BO_DIRELECTRONICA', edBO_DIRELECTRONICA.Text);
    if ModoABM = maAlta Then
    begin
      Sql.Fields.Add('BO_USUALTA', frmPrincipal.dbLogin.UserId );
      Sql.Fields.Add('BO_FECHAALTA', exDateTime );
    end else begin
      Sql.Fields.Add('BO_USUMODIF', frmPrincipal.dbLogin.UserId );
      Sql.Fields.Add('BO_FECHAMODIF', exDateTime );
      Sql.Fields.Add('BO_USUBAJA', exNull );
      Sql.Fields.Add('BO_FECHABAJA', exNull );
    end;
  end;

  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManLBO_ABOGADOS.LoadControls;
begin
  with sdqConsulta do
  begin
    edBO_CODIGO.Value         := FieldByName('BO_CODIGO').AsInteger;
    edBO_NOMBRE.Text          := FieldByName('BO_NOMBRE').AsString;
    edBO_DIRECCION.Text       := FieldByName('BO_DIRECCION').AsString;
    edBO_TELEFONO.Text        := FieldByName('BO_TELEFONO').AsString;
    chkBO_PROVINCIART.Checked := (FieldByName('BO_PROVINCIART').AsString='S');
    edBO_DIRELECTRONICA.Text  := FieldByName('BO_DIRELECTRONICA').AsString;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManLBO_ABOGADOS.Validar: Boolean;
begin
  Result := False;
  if edBO_CODIGO.Text = '' Then
    InvalidMsg( edBO_CODIGO, 'Debe ingresar el código del Abogado' )

  else if edBO_NOMBRE.Text = '' Then
    InvalidMsg( edBO_NOMBRE, 'Debe ingresar el Apellido y Nombre del Abogado' )

  else if (edBO_DIRELECTRONICA.Text <> '') and (not IsEmails(edBO_DIRELECTRONICA.Text)) then
    InvalidMsg( edBO_DIRELECTRONICA, 'La dirección electrónica es inválida' )

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManLBO_ABOGADOS.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'BO_FECHABAJA';
  Sql.TableName := 'LBO_ABOGADOS';
  CheckPK := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
{
create table art.borrar_lbo_abogados as
select * from lbo_abogados
/
ALTER TABLE ART.LGD_GESTIONDEUDA
 DROP CONSTRAINT FK_LGD_ABOGADO
/
ALTER TABLE ART.LRS_RECUPEROSINIESTROS
 DROP CONSTRAINT FK_LRS_ABOGADO
/
DROP TABLE art.lbo_abogados
/
CREATE TABLE art.lbo_abogados
 (
  bo_codigo                  NUMBER(3) NOT NULL,
  bo_nombre                  VARCHAR2(50),
  bo_direccion               VARCHAR2(100),
  bo_telefono                VARCHAR2(20),
  bo_codareatelefono         VARCHAR2(5),
  bo_prefijotelefono         VARCHAR2(3),
  bo_direlectronica          VARCHAR2(120),
  bo_usualta                 VARCHAR2(20),
  bo_fechaalta               DATE,
  bo_usumodif                VARCHAR2(20),
  bo_fechamodif              DATE,
  bo_usubaja                 VARCHAR2(20),
  bo_fechamodif              DATE,
  CONSTRAINT pk_lbo_abogados PRIMARY KEY (bo_codigo)
 )
/
COMMENT ON TABLE art.lbo_abogados IS 'SINIESTROS - Tabla con los datos de los abogados - '
/
COMMENT ON COLUMN art.lbo_abogados.bo_codareatelefono IS 'Código de area del teléfono'
/
COMMENT ON COLUMN art.lbo_abogados.bo_codigo IS 'Código de abogado'
/
COMMENT ON COLUMN art.lbo_abogados.bo_direccion IS 'Dirección completa'
/
COMMENT ON COLUMN art.lbo_abogados.bo_direlectronica IS 'Dirección Electrónica'
/
COMMENT ON COLUMN art.lbo_abogados.bo_fechaalta IS 'Fecha de Alta'
/
COMMENT ON COLUMN art.lbo_abogados.bo_fechabaja IS 'Fecha de Baja'
/
COMMENT ON COLUMN art.lbo_abogados.bo_fechamodif IS 'Fecha de la última Modificación'
/
COMMENT ON COLUMN art.lbo_abogados.bo_nombre IS 'Nombre y Apellido'
/
COMMENT ON COLUMN art.lbo_abogados.bo_prefijotelefono IS 'Prefijo del teléfono'
/
COMMENT ON COLUMN art.lbo_abogados.bo_telefono IS 'Nro. de teléfono'
/
COMMENT ON COLUMN art.lbo_abogados.bo_usualta IS 'Usuario de Alta'
/
COMMENT ON COLUMN art.lbo_abogados.bo_usumodif IS 'Usuario de la última Modificación'
/
INSERT INTO lbo_abogados
(    BO_CODIGO,
    BO_NOMBRE,
    BO_DIRECCION,
    BO_TELEFONO,
    BO_CODAREATELEFONO,
    BO_PREFIJOTELEFONO,
    BO_FECHABAJA,
    BO_DIRELECTRONICA,
    BO_USUBAJA)
SELECT BO_CODIGO,
    BO_NOMBRE,
    BO_DIRECCION,
    BO_TELEFONO,
    BO_CODAREATELEFONO,
    BO_PREFIJOTELEFONO,
    BO_FECHABAJA,
    BO_DIRELECTRONICA,
    BO_USUBAJA
FROM art.borrar_lbo_abogados
/

ALTER TABLE ART.LGD_GESTIONDEUDA
 ADD CONSTRAINT FK_LGD_ABOGADO
 FOREIGN KEY
 (GD_ABOGADO
 )
 REFERENCES ART.LBO_ABOGADOS
  (BO_CODIGO
 )
/

ALTER TABLE ART.LRS_RECUPEROSINIESTROS
 ADD CONSTRAINT FK_LRS_ABOGADO
 FOREIGN KEY
 (RS_ABOGADO
 )
 REFERENCES ART.LBO_ABOGADOS
  (BO_CODIGO
 )
/
DROP TABLE art.borrar_lbo_abogados
/
}
end.

