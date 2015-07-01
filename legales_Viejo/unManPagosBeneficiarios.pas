unit unManPagosBeneficiarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, ANSISql,
  unFraCodigoDescripcion, unArtDBAwareFrame, General;

type
  TfrmManConPagosBeneficiarios = class(TfrmCustomGridABM)
    fraConPagos: TfraCodigoDescripcion;
    fraBeneficiarios: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    rgAplicacion: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure rgAplicacionClick(Sender: TObject);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

{$R *.dfm}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManConPagosBeneficiarios.ClearControls;
begin
  inherited;

  fraBeneficiarios.Clear;

  rgAplicacion.ItemIndex := 1;
  rgAplicacionClick(nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManConPagosBeneficiarios.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('BC_ID', sdqConsulta.FieldByName('BC_ID').AsInteger);
    Sql.Fields.Add('BC_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('BC_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('BC_CONPAGO', fraConPagos.Value);
    Sql.Fields.Add('BC_IDBENEFICIARIOPAGO', fraBeneficiarios.Value);
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('BC_ID', GetSecNextVal('LEGALES.SEQ_LBC_ID') );
      Sql.Fields.Add('BC_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('BC_FECHAALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('BC_ID', sdqConsulta.FieldByName('BC_ID').AsInteger );
      Sql.Fields.Add('BC_USUMODIF', Sesion.LoginName );
      Sql.Fields.Add('BC_FECHAMODIF', exDateTime );
      Sql.Fields.Add('BC_USUBAJA', exNull );
      Sql.Fields.Add('BC_FECHABAJA', exNull );
    end;
  end;

  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManConPagosBeneficiarios.LoadControls;
begin
  inherited;

  fraBeneficiarios.Value:= sdqConsulta.FieldByName('BC_IDBENEFICIARIOPAGO').AsInteger;

  rgAplicacion.ItemIndex := iif(sdqConsulta.FieldByName('cp_tipo').AsString = 'L', 0, 1);
  rgAplicacionClick(nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManConPagosBeneficiarios.Validar: Boolean;
begin
  Result := True;
  VerificarMultiple(['Guardando Concepto y Beneficiario',
                      fraConPagos, fraConPagos.IsSelected, 'Debe Seleccionar un Concepto',
                      fraBeneficiarios, fraBeneficiarios.IsSelected, 'Debe Seleccionar un Beneficiario.',
                      fraConPagos, not ((ModoABM = maAlta) and
                                        ExisteSql ('SELECT 1 ' +
                                                   '  FROM legales.lbc_beneficiarioconceptopago ' +
                                                   ' WHERE bc_conpago = ' + SqlInteger (fraConPagos.ID) +
                                                   '   AND bc_idbeneficiariopago = ' + SqlInteger (fraBeneficiarios.ID))), 'La relación ya existe',
                      fraConPagos, not ((ModoABM = maModificacion) and
                                        ExisteSql ('SELECT 1 ' +
                                                   '  FROM legales.lbc_beneficiarioconceptopago ' +
                                                   ' WHERE bc_conpago = ' + SqlInteger (fraConPagos.ID) +
                                                   '   AND bc_idbeneficiariopago = ' + SqlInteger (fraBeneficiarios.ID) +
                                                   '   AND bc_id <> ' + SqlInteger (sdqConsulta.FieldByName('bc_id').AsInteger))), 'La relación ya existe'
                    ]);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManConPagosBeneficiarios.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'BC_FECHABAJA';
  Sql.TableName := 'legales.lbc_beneficiarioconceptopago';
  CheckPK := True;

  with fraBeneficiarios do
  begin
    TableName := 'legales.lbp_beneficiariopago';
    FieldID     := 'bp_id';
    FieldCodigo := 'bp_id';
    FieldDesc   := 'bp_descripcion';
  end;

  with fraConPagos do
  begin
    TableName := 'art.scp_conpago';
    FieldID     := 'cp_conpago';
    FieldCodigo := 'cp_conpago';
    FieldDesc   := 'cp_denpago';
    FieldBaja   := 'cp_fbaja';
    ExtraCondition := ' AND cp_tipo IN (''L'', ''U'') ';

    Showbajas   := False;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}

procedure TfrmManConPagosBeneficiarios.rgAplicacionClick(Sender: TObject);
begin
  with fraConPagos do
  begin
    TableName := 'art.scp_conpago';
    FieldID     := 'cp_conpago';
    FieldCodigo := 'cp_conpago';
    FieldDesc   := 'cp_denpago';
    FieldBaja   := 'cp_fbaja';
    ExtraCondition := ' AND cp_tipo = ' + SqlValue(string(iif(rgAplicacion.ItemIndex = 0, 'L', 'U')));

    Showbajas   := False;
  end;

  fraConPagos.Clear;
  if ModoABM = maModificacion then
    fraConPagos.Value := sdqConsulta.FieldByName('BC_CONPAGO').AsInteger;

  if rgAplicacion.ItemIndex = 0 then
    rgAplicacion.Enabled := not ExisteSQLEx ('SELECT 1 ' +
                                             '  FROM legales.lpl_pagolegal ' +
                                             ' WHERE pl_idbeneficiariopago = :pidbeneficiariopago ' +
                                             '   AND pl_conpago = :pidconpago ',
                                             [fraBeneficiarios.Value, fraConPagos.Value])
  else
    rgAplicacion.Enabled := not ExisteSQLEx ('SELECT 1 ' +
                                             '  FROM legales.lps_pagosumario ' +
                                             ' WHERE ps_idbeneficiariopago = :pidbeneficiariopago ' +
                                             '   AND ps_conpago = :pidconpago ',
                                             [fraBeneficiarios.Value, fraConPagos.Value])
end;

end.


