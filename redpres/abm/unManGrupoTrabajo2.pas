unit unManGrupoTrabajo2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit;

type
  TfrmManGrupoTrabajo2 = class(TfrmCustomGridABM)
    chkVerBajas: TCheckBox;
    Label1: TLabel;
    edCodigo: TEdit;
    Label2: TLabel;
    edNombre: TEdit;
    Label3: TLabel;
    edDescripcion: TEdit;
    edDiasMaximos: TIntEdit;
    Label4: TLabel;
    chkAsignableASiniestros: TCheckBox;
    edFax: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edEMail: TEdit;
    chkCronico: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmManGrupoTrabajo2: TfrmManGrupoTrabajo2;

implementation

uses unPrincipal, General, SqlFuncs, unDmPrincipal, unABMUsugrp;

{$R *.dfm}

procedure TfrmManGrupoTrabajo2.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edNombre.Clear;
  edDescripcion.Clear;
  edDiasMaximos.Clear;
  chkAsignableASiniestros.Checked := True;
  edFax.Clear;
  edEMail.Clear;
  chkCronico.Checked := False;
end;

function TfrmManGrupoTrabajo2.DoABM: Boolean;
begin
  sql.Clear;
  if ModoABM = maAlta Then
  begin
    Sql.PrimaryKey.Add('GP_CODIGO', edCodigo.Text);
    Sql.Fields.Add('GP_NOMBRE', edNombre.Text);
    Sql.Fields.Add('GP_DESCRIPCION', edDescripcion.Text);
    Sql.Fields.Add('GP_DIASMAX', edDiasMaximos.Value);
    Sql.Fields.Add('GP_SINIESTROS', String(Iif(chkAsignableASiniestros.Checked, 'S', 'N')));
    Sql.Fields.Add('GP_FAX', edFax.Text);
    Sql.Fields.Add('GP_EMAIL', edEMail.Text);
    Sql.Fields.Add('GP_CRONICO', String(Iif(chkCronico.Checked, 'S', 'N')));
  end
  else
  begin
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('GP_CODIGO', sdqConsulta.FieldByName('GP_CODIGO').AsString);
      Sql.Fields.Add('GP_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('GP_FBAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end
    else
    begin
      Sql.PrimaryKey.Add('GP_CODIGO', sdqConsulta.FieldByName('GP_CODIGO').AsString);
      Sql.Fields.Add('GP_NOMBRE', edNombre.Text);
      Sql.Fields.Add('GP_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('GP_DIASMAX', edDiasMaximos.Value);
      Sql.Fields.Add('GP_SINIESTROS', String(Iif(chkAsignableASiniestros.Checked, 'S', 'N')));
      Sql.Fields.Add('GP_FAX', edFax.Text);
      Sql.Fields.Add('GP_EMAIL', edEMail.Text);
      Sql.Fields.Add('GP_CRONICO', String(Iif(chkCronico.Checked, 'S', 'N')));

      Sql.Fields.Add('GP_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('GP_FECHAMODIF', exDateTime);
    end;
  end;
  result := inherited DoABM;

end;


procedure TfrmManGrupoTrabajo2.FormCreate(Sender: TObject);
begin
  inherited;
  sql.TableName := 'mgp_gtrabajo';
  FieldBaja     := 'gp_fbaja';
end;

procedure TfrmManGrupoTrabajo2.LoadControls;
begin
  edCodigo.Text      := sdqConsulta.FieldByName('GP_CODIGO').AsString;
  edNombre.Text      := sdqConsulta.FieldByName('GP_NOMBRE').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('GP_DESCRIPCION').AsString;
  edDiasMaximos.Text := sdqConsulta.FieldByName('GP_DIASMAX').AsString;
  chkAsignableASiniestros.Checked := (sdqConsulta.FieldByName('GP_SINIESTROS').AsString = 'S');
  edFax.Text         := sdqConsulta.FieldByName('GP_FAX').AsString;
  edEMail.Text       := sdqConsulta.FieldByName('GP_EMAIL').AsString;
  chkCronico.Checked := (sdqConsulta.FieldByName('GP_CRONICO').AsString = 'S');
end;

procedure TfrmManGrupoTrabajo2.tbModificarClick(Sender: TObject);
begin
  if not isbaja then
    inherited
  else
    messagedlg('El registro está dado de baja', mtInformation, [mbOk],0);
end;

function TfrmManGrupoTrabajo2.Validar: Boolean;
begin
  Result := True;
end;

procedure TfrmManGrupoTrabajo2.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin

  sSql := ' SELECT gp_codigo, gp_nombre, gp_descripcion, gp_fbaja, gp_siniestros, ' +
                 ' gp_diasmax, gp_fax, gp_email, gp_cronico, gp_usubaja, gp_fechamodif, gp_usumodif ' +
            ' FROM mgp_gtrabajo ' +
           ' WHERE 1 = 1 ';


  if not chkVerBajas.Checked then
    sSql := sSql + ' AND gp_fbaja is null ';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;

end;

procedure TfrmManGrupoTrabajo2.fpAbmBeforeShow(Sender: TObject);
begin
 if ModoABM = maAlta Then
   edCodigo.Text := IntToStr(IncSql('SELECT max(to_number(gp_codigo)) + 1 FROM mgp_gtrabajo'))
end;

procedure TfrmManGrupoTrabajo2.tbPropiedadesClick(Sender: TObject);
var
  frm:TfrmUsugrp;
begin
  if sdqConsulta.fieldbyname('gp_fbaja').IsNull then
  begin
    frm := TfrmUsugrp.Create(nil);
    try
       frm.sdqConsulta.ParamByName('pgtrabajo').Value := sdqConsulta.fieldbyname('gp_codigo').AsInteger;
       frm.tbRefrescarClick(nil);
       frm.Showmodal;
    finally
       frm.free;
    end;
  end else
    MsgBox('No puede agregar usuarios a un grupo dado de baja');
end;

end.
