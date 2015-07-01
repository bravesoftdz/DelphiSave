unit unManLimGestionDeclaracion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, Mask, PatternEdit, IntEdit,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin,
  SqlFuncs, unDmPrincipal, unSesion, General, unArtFrame, CustomDlgs,
  unFraCodigoDescripcion;

type
  TManLimGestionDeclaracion = class(TfrmCustomGridABM)
    lblTipo: TLabel;
    cboTipoTamanio: TComboBox;
    lblDesde: TLabel;
    lblHasta: TLabel;
    lblVariacionMasa: TLabel;
    lblTrabajadores: TLabel;
    cboTipoProceso: TComboBox;
    lblTipoProceso: TLabel;
    cboTipoVariacion: TComboBox;
    lblProcesoVariacion: TLabel;
    lblFuenteComparacion: TLabel;
    cboFuenteComparacion: TComboBox;
    lblObservacion: TLabel;
    iedDesde: TIntEdit;
    iedHasta: TIntEdit;
    iedVariacionMasa: TIntEdit;
    iedTrabajadores: TIntEdit;
    fraObservacion: TfraCodigoDescripcion;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cboTipoTamanioChange(Sender: TObject);
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

implementation

{$R *.dfm}

{ TFrmManPeritos }

procedure TManLimGestionDeclaracion.ClearControls;
begin
  inherited;

  // Defaults
  cboTipoTamanio.ItemIndex      := ArrayPos('T', ['M', 'T']);
  cboTipoProceso.ItemIndex      := ArrayPos('A', ['M', 'A', 'I']);
  cboTipoVariacion.ItemIndex    := ArrayPos('P', ['P', 'V']);
  cboFuenteComparacion.ItemIndex:= ArrayPos('U', ['U', 'P']);
  fraObservacion.Clear;

  iedDesde.Text                 := '';
  iedHasta.Text                 := '';
  iedVariacionMasa.Text         := '';
  iedTrabajadores.Text          := '';

  cboTipoTamanioChange(nil);
end;

function TManLimGestionDeclaracion.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('LG_ID', sdqConsulta.FieldByName('LG_ID').AsInteger );
    Sql.Fields.Add('LG_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('LG_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('LG_DESDE', iedDesde.Value);
    Sql.Fields.Add('LG_HASTA', iedHasta.Value);

    case cboTipoTamanio.ItemIndex of
      0 : Sql.Fields.Add('LG_TIPOTAMANIO', 'M');
      1 : Sql.Fields.Add('LG_TIPOTAMANIO', 'T');
    end;

    Sql.Fields.Add('LG_VARIACIONMASA', iedVariacionMasa.Text);
    Sql.Fields.Add('LG_VARIACIONTRABAJADORES', iedTrabajadores.Text);

    case cboTipoProceso.ItemIndex of
      0 : Sql.Fields.Add('LG_PROCESO', 'M');
      1 : Sql.Fields.Add('LG_PROCESO', 'A');
      2 : Sql.Fields.Add('LG_PROCESO', 'I');
    end;

    case cboTipoVariacion.ItemIndex of
      0 : Sql.Fields.Add('LG_TIPOVARIACION', 'P');
      1 : Sql.Fields.Add('LG_TIPOVARIACION', 'V');
    end;

    case cboFuenteComparacion.ItemIndex of
      0 : Sql.Fields.Add('LG_FUENTECOMPARACION', 'U');
      1 : Sql.Fields.Add('LG_FUENTECOMPARACION', 'P');
    end;

    Sql.Fields.Add('LG_IDOBSERVACION', fraObservacion.Value);

    if ModoABM = maAlta Then begin
      Sql.PrimaryKey.Add('LG_ID', GetSecNextVal('EMI.SEQ_ILG_ID'));
      Sql.Fields.Add('LG_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('LG_FECHAALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('LG_ID', sdqConsulta.FieldByName('LG_ID').AsInteger);
      Sql.Fields.Add('LG_USUBAJA', exNull );
      Sql.Fields.Add('LG_FECHABAJA', exNull );
    end
  end;

  Result := inherited DoABM;
end;

procedure TManLimGestionDeclaracion.FormCreate(Sender: TObject);
begin
  inherited;

  with fraObservacioN do
  begin
      TableName := 'EMI.IOB_OBSERVACION';
      FieldDesc := 'OB_DESCRIPCION';
      FieldID := 'OB_ID';
      FieldCodigo := 'OB_ID';
      FieldBaja := 'OB_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := true;
      ExtraCondition := 'AND (OB_TIPO = ''D'') AND (OB_MANUAL = ''S'')'
  end;

  Sql.TableName := 'EMI.ILG_LIMITEGESTIONDECLARACION';
end;

procedure TManLimGestionDeclaracion.LoadControls;
begin
  inherited;

  iedDesde.Text                 := sdqConsulta.fieldbyname('LG_DESDE').AsString;
  iedHasta.Text                 := sdqConsulta.fieldbyname('LG_HASTA').AsString;
  cboTipoTamanio.ItemIndex      := ArrayPos(sdqConsulta.fieldbyname('LG_TIPOTAMANIO').AsString, ['M', 'T']);
  iedVariacionMasa.Text         := sdqConsulta.fieldbyname('LG_VARIACIONMASA').AsString;
  iedTrabajadores.Text          := sdqConsulta.fieldbyname('LG_VARIACIONTRABAJADORES').AsString;
  cboTipoProceso.ItemIndex      := ArrayPos(sdqConsulta.fieldbyname('LG_PROCESO').AsString, ['M', 'A', 'I']);
  cboTipoVariacion.ItemIndex    := ArrayPos(sdqConsulta.fieldbyname('LG_TIPOVARIACION').AsString, ['P', 'V']);
  cboFuenteComparacion.ItemIndex:= ArrayPos(sdqConsulta.fieldbyname('LG_FUENTECOMPARACION').AsString, ['U', 'P']);
  fraObservacion.Value          := sdqConsulta.FieldbyName('LG_IDOBSERVACION').AsInteger;

  cboTipoTamanioChange(nil);
end;

function TManLimGestionDeclaracion.Validar: Boolean;
begin
  result := true;

  VerificarMultiple(['Mantenimiento de Límites de Gestión',
     iedDesde, iedDesde.Value <= iedHasta.Value, 'El valor Desde debe ser menor o igual que Hasta',
     iedHasta, iedHasta.Value >= iedDesde.Value, 'El valor Hasta debe ser mayor o igual que Desde',
     fraObservacion, fraObservacion.IsSelected, 'Debe ingresar una Observación']);
end;

procedure TManLimGestionDeclaracion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TManLimGestionDeclaracion.cboTipoTamanioChange(Sender: TObject);
begin
  inherited;

  iedVariacionMasa.Enabled := cboTipoTamanio.ItemIndex = 0;
  iedTrabajadores.Enabled := not iedVariacionMasa.Enabled;

  if iedVariacionMasa.Enabled then begin
    iedTrabajadores.Text := '';
    iedTrabajadores.Color := clSilver;
    iedVariacionMasa.Color := clWindow;
  end;

  if iedTrabajadores.Enabled then begin
    iedVariacionMasa.Text := '';
    iedTrabajadores.Color := clWindow;
    iedVariacionMasa.Color := clSilver
  end;
end;

end.

