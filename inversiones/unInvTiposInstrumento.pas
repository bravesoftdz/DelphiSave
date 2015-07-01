unit unInvTiposInstrumento;

interface

uses
  {$IFDEF VER150} Placemnt, {$ELSE} rxPlacemnt, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin,
  Mask, PatternEdit, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion;

type
  TfrmInvTiposInstrumento = class(TfrmCustomGridABM)
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    edDescripcionAltaModif: TEdit;
    Label1: TLabel;
    chkVencimientoAltaModif: TCheckBox;
    chkCuponAltaModif: TCheckBox;
    chkBancoAltaModif: TCheckBox;
    chkTasaAltaModif: TCheckBox;
    ShortCutControl1: TShortCutControl;
    chkTasaRefAltaModif: TCheckBox;
    chkLicitacionAltaModif: TCheckBox;
    chkPlazoFijoAltaModif: TCheckBox;
    edCtaContAltaModif: TPatternEdit;
    Label2: TLabel;
    Label3: TLabel;
    edCtaIntAltaModif: TPatternEdit;
    Label4: TLabel;
    edCtaGEAltaModif: TPatternEdit;
    Label5: TLabel;
    edCtaRetAltaModif: TPatternEdit;
    edCtaGastosAltaModif: TPatternEdit;
    Label6: TLabel;
    Label7: TLabel;
    edCtaFFEPAltaModif: TPatternEdit;
    Label8: TLabel;
    edCtaDifCotAltaModif: TPatternEdit;
    Label9: TLabel;
    edCtaResRealAltaModif: TPatternEdit;
    edCtaImpAltaModif: TPatternEdit;
    Label10: TLabel;
    Label11: TLabel;
    edCtaRegulAltaModif: TPatternEdit;
    Label12: TLabel;
    edCtaResTenAltaModif: TPatternEdit;
    chkActInteresAltaModif: TCheckBox;
    Label16: TLabel;
    fraCuentaAltaModif: TfraCodigoDescripcion;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmInvTiposInstrumento: TfrmInvTiposInstrumento;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, unArt,
  VCLExtra, CustomDlgs;

procedure TfrmInvTiposInstrumento.LoadControls;
begin
  VCLExtra.LockControls([edDescripcionAltaModif, chkVencimientoAltaModif, chkCuponAltaModif, chkBancoAltaModif,
                         chkTasaAltaModif, chkTasaRefAltaModif, chkLicitacionAltaModif, chkPlazoFijoAltaModif,
                         chkActInteresAltaModif]);

  with sdqConsulta do
    begin
      edDescripcionAltaModif.Text     := FieldByName('TIPO_INSTRUMENTO').AsString;
      chkVencimientoAltaModif.Checked := (FieldByName('CON_VENCIMIENTO').AsString = 'S');
      chkCuponAltaModif.Checked       := (FieldByName('CON_CUPON').AsString = 'S');
      chkBancoAltaModif.Checked       := (FieldByName('CON_BANCO').AsString = 'S');
      chkTasaAltaModif.Checked        := (FieldByName('CON_TASA').AsString = 'S');
      chkTasaRefAltaModif.Checked     := (FieldByName('CON_TASA_REFERENCIA').AsString = 'S');
      chkLicitacionAltaModif.Checked  := (FieldByName('LICITACION').AsString = 'S');
      chkPlazoFijoAltaModif.Checked   := (FieldByName('PLAZO_FIJO').AsString = 'S');
      chkActInteresAltaModif.Checked  := (FieldByName('ACTUALIZA_INTERES').AsString = 'S');
      edCtaContAltaModif.Text         := FieldByName('CUENTA').AsString;
      edCtaGEAltaModif.Text           := FieldByName('CUENTA_GECON').AsString;
      edCtaIntAltaModif.Text          := FieldByName('CUENTA_INTERES').AsString;
      edCtaRetAltaModif.Text          := FieldByName('CUENTA_RETENCION').AsString;
      edCtaGastosAltaModif.Text       := FieldByName('CUENTA_GASTOS').AsString;
      edCtaDifCotAltaModif.Text       := FieldByName('CUENTA_DIF_COTIZACION').AsString;
      edCtaFFEPAltaModif.Text         := FieldByName('CUENTA_FFEP').AsString;
      edCtaResRealAltaModif.Text      := FieldByName('CUENTA_REALIZACION').AsString;
      edCtaImpAltaModif.Text          := FieldByName('CUENTA_IMPUESTO').AsString;
      edCtaResTenAltaModif.Text       := FieldByName('CUENTA_RXT').AsString;
      edCtaRegulAltaModif.Text        := FieldByName('CUENTA_REGULARIZADORA').AsString;
      fraCuentaAltaModif.Value        := FieldByName('IDCUENTACUSTODIA').AsInteger;
    end;
end;

procedure TfrmInvTiposInstrumento.ClearControls;
begin
  VCLExtra.LockControls([edDescripcionAltaModif, chkVencimientoAltaModif, chkCuponAltaModif, chkBancoAltaModif,
                         chkTasaAltaModif, chkTasaRefAltaModif, chkLicitacionAltaModif, chkPlazoFijoAltaModif,
                         chkActInteresAltaModif], False);

  edDescripcionAltaModif.Clear;
  chkVencimientoAltaModif.Checked := False;
  chkCuponAltaModif.Checked       := False;
  chkBancoAltaModif.Checked       := False;
  chkTasaAltaModif.Checked        := False;
  chkTasaRefAltaModif.Checked     := False;
  chkLicitacionAltaModif.Checked  := False;
  chkPlazoFijoAltaModif.Checked   := False;
  chkActInteresAltaModif.Checked  := False;
  edCtaContAltaModif.Clear;
  edCtaGEAltaModif.Clear;
  edCtaIntAltaModif.Clear;
  edCtaRetAltaModif.Clear;
  edCtaGastosAltaModif.Clear;
  edCtaDifCotAltaModif.Clear;
  edCtaFFEPAltaModif.Clear;
  edCtaResRealAltaModif.Clear;
  edCtaImpAltaModif.Clear;
  edCtaResTenAltaModif.Clear;
  edCtaRegulAltaModif.Clear;
  fraCuentaAltaModif.Clear;
end;

function TfrmInvTiposInstrumento.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if (ModoABM = maAlta) or (ModoABM = maModificacion) then
        begin
          if (ModoABM = maAlta) then
            begin
              PrimaryKey.Add('TI_ID',           GetSecNextVal('INV.SEQ_NTI_ID'));
              Fields.Add('TI_FECHAALTA',        exDateTime);
              Fields.Add('TI_USUALTA',          Sesion.UserID);

              Fields.Add('TI_DESCRIPCION',      Trim(edDescripcionAltaModif.Text));
              Fields.Add('TI_VENCIMIENTO',      chkVencimientoAltaModif.Checked);
              Fields.Add('TI_CUPON',            chkCuponAltaModif.Checked);
              Fields.Add('TI_BANCO',            chkBancoAltaModif.Checked);
              Fields.Add('TI_TASA',             chkTasaAltaModif.Checked);
              Fields.Add('TI_TASAREFERENCIA',   chkTasaRefAltaModif.Checked);
              Fields.Add('TI_LICITACION',       chkLicitacionAltaModif.Checked);
              Fields.Add('TI_PLAZOFIJO',        chkPlazoFijoAltaModif.Checked);
              Fields.Add('TI_ACTUALIZAINTERES', chkActInteresAltaModif.Checked);

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('TI_ID',           sdqConsulta.FieldByName('CODIGO').AsInteger);
              Fields.Add('TI_FECHAMODIF',       exDateTime);
              Fields.Add('TI_USUMODIF',         Sesion.UserID);

              SqlType := stUpdate;
            end;

          Fields.Add('TI_CUENTA',               edCtaContAltaModif.Text);
          Fields.Add('TI_CUENTAGECON',          edCtaGEAltaModif.Text);
          Fields.Add('TI_CUENTAINTERES',        edCtaIntAltaModif.Text);
          Fields.Add('TI_CUENTARETENCION',      edCtaRetAltaModif.Text);
          Fields.Add('TI_CUENTAGASTOS',         edCtaGastosAltaModif.Text);
          Fields.Add('TI_CUENTADIFCOTIZACION',  edCtaDifCotAltaModif.Text);
          Fields.Add('TI_CUENTAFFEP',           edCtaFFEPAltaModif.Text);
          Fields.Add('TI_CUENTAREALIZACION',    edCtaResRealAltaModif.Text);
          Fields.Add('TI_CUENTAIMPUESTO',       edCtaImpAltaModif.Text);
          Fields.Add('TI_CUENTARXT',            edCtaResTenAltaModif.Text);
          Fields.Add('TI_CUENTAREGULARIZADORA', edCtaRegulAltaModif.Text);
          Fields.Add('TI_IDCUENTACUSTODIA',     fraCuentaAltaModif.Value, True);
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('TI_ID',               sdqConsulta.FieldByName('CODIGO').AsInteger);
          Fields.Add('TI_FECHABAJA',            exDateTime);
          Fields.Add('TI_USUBAJA',              Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmInvTiposInstrumento.Validar: Boolean;
begin
  Verificar(IsEmptyString(edDescripcionAltaModif.Text), edDescripcionAltaModif, 'Debe indicar el nombre.');

  Result := True;
end;

procedure TfrmInvTiposInstrumento.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT TI_ID CODIGO, TI_DESCRIPCION TIPO_INSTRUMENTO, ' +
                 'TI_VENCIMIENTO CON_VENCIMIENTO, TI_CUPON CON_CUPON, ' +
                 'TI_BANCO CON_BANCO, TI_TASA CON_TASA, TI_TASAREFERENCIA CON_TASA_REFERENCIA, ' +
                 'TI_LICITACION LICITACION, TI_PLAZOFIJO PLAZO_FIJO, TI_CUENTA CUENTA, ' +
                 'TI_CUENTAGECON CUENTA_GECON, TI_CUENTAINTERES CUENTA_INTERES, ' +
                 'TI_CUENTARETENCION CUENTA_RETENCION, TI_CUENTAGASTOS CUENTA_GASTOS, ' +
                 'TI_CUENTADIFCOTIZACION CUENTA_DIF_COTIZACION, TI_CUENTAFFEP CUENTA_FFEP, ' +
                 'TI_CUENTAREALIZACION CUENTA_REALIZACION, TI_CUENTAIMPUESTO CUENTA_IMPUESTO, ' +
                 'TI_CUENTARXT CUENTA_RXT, TI_CUENTAREGULARIZADORA CUENTA_REGULARIZADORA, ' +
                 'TI_FECHABAJA FECHA_BAJA, TI_ACTUALIZAINTERES ACTUALIZA_INTERES, ' +
                 'TI_IDCUENTACUSTODIA IDCUENTACUSTODIA, BA_NOMBRE BANCOCUST, CB_NUMERO CUENTACUST ' +
            'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, NTI_TIPOINSTRUMENTO ' +
           'WHERE BA_ID(+) = CB_IDBANCO ' +
             'AND CB_ID(+) = TI_IDCUENTACUSTODIA';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND TI_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmInvTiposInstrumento.FormCreate(Sender: TObject);
begin
  inherited;

  with fraCuentaAltaModif do
    begin
      TableName      := 'ZCB_CUENTABANCARIA';
      FieldID        := 'CB_ID';
      FieldCodigo    := 'CB_ID';
      FieldDesc      := 'CB_NUMERO || '' - '' || BA_NOMBRE';
      FieldBaja      := 'CB_FECHABAJA';
      ExtraTables    := ', ZBA_BANCO';
      ExtraCondition := 'AND BA_ID = CB_IDBANCO AND BA_FECHABAJA IS NULL';
      ShowBajas      := False;
    end;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NTI_TIPOINSTRUMENTO';
end;

procedure TfrmInvTiposInstrumento.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmInvTiposInstrumento.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El tipo de instrumento ya ha sido dado de baja.');

  inherited;
end;

end.
