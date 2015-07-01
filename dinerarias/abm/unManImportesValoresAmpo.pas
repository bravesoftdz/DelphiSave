unit unManImportesValoresAmpo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit;

type
  TfrmManImportesValoresAmpo = class(TfrmCustomGridABM)
    Label1: TLabel;
    edPeriodo: TEdit;
    Label2: TLabel;
    edNroDeAMPOS: TCurrencyEdit;
    Label3: TLabel;
    edValorAMPO: TCurrencyEdit;
    Label4: TLabel;
    edImporteTope: TCurrencyEdit;
    Label5: TLabel;
    edImporteContrPat: TCurrencyEdit;
    Label6: TLabel;
    edSalarioMinimo: TCurrencyEdit;
    Label7: TLabel;
    edSalarioMinimoPostDecr: TCurrencyEdit;
    edHaberMinGarantizado: TCurrencyEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

 protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: Boolean; override;
    function Validar : Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManImportesValoresAmpo: TfrmManImportesValoresAmpo;

implementation

uses
  SqlFuncs, unSesion, VCLExtra;

{$R *.dfm}

{ TfrmManImportesValoresAmpo }

procedure TfrmManImportesValoresAmpo.ClearControls;
begin
  edPeriodo.Clear;
  edNroDeAMPOS.Clear;
  edValorAMPO.Clear;
  edImporteTope.Clear;
  edImporteContrPat.Clear;
  edSalarioMinimo.Clear;
  edSalarioMinimoPostDecr.Clear;
  edHaberMinGarantizado.Clear;
end;

function TfrmManImportesValoresAmpo.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    case ModoABM of

      maModificacion:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('am_periodo', sdqConsulta.FieldByName('am_periodo').AsString, False);
        Fields.Add('am_usumodif', Sesion.UserID);
        Fields.Add('am_fechamodif', exDateTime);

        Fields.Add('AM_NUMAMPOS', edNroDeAMPOS.Value);
        Fields.Add('AM_VALORAMPO', edValorAMPO.Value);
        Fields.Add('AM_IMPORTOPE', edImporteTope.Value);
        Fields.Add('AM_IMPORTOPE_CONTRIBPATR', edImporteContrPat.Value);
        Fields.Add('AM_IMPORTEMINIMO', edSalarioMinimo.Value);
        Fields.Add('AM_IMPORTEMINIMOPOSTDE', edSalarioMinimoPostDecr.Value);
        Fields.Add('AM_HABERMINIMOGARANT', edHaberMinGarantizado.Value);     // por plan SIPA
      end;

      maBaja:
      begin
        SqlType := stDelete;
        PrimaryKey.Add('am_periodo', sdqConsulta.FieldByName('am_periodo').AsString);
      end;

    end;
    Result := inherited DoABM;
  end;

end;

procedure TfrmManImportesValoresAmpo.LoadControls;
begin
  edPeriodo.Text                := sdqConsulta.FieldByName('PERIODO').AsString;
  edNroDeAMPOS.Value            := sdqConsulta.FieldByName('AM_NUMAMPOS').AsCurrency;
  edValorAMPO.Value             := sdqConsulta.FieldByName('AM_VALORAMPO').AsCurrency;
  edImporteTope.Value           := sdqConsulta.FieldByName('AM_IMPORTOPE').AsCurrency;
  edImporteContrPat.Value       := sdqConsulta.FieldByName('AM_IMPORTOPE_CONTRIBPATR').AsCurrency;
  edSalarioMinimo.Value         := sdqConsulta.FieldByName('AM_IMPORTEMINIMO').AsCurrency;
  edSalarioMinimoPostDecr.Value := sdqConsulta.FieldByName('AM_IMPORTEMINIMOPOSTDE').AsCurrency;
  edHaberMinGarantizado.Value   := sdqConsulta.FieldByName('AM_HABERMINIMOGARANT').AsCurrency;        // por plan SIPA

 { VCLExtra.LockControl(edNroDeAMPOS,            not Seguridad.Claves.IsActive('NroDeAMPOS'));
  VCLExtra.LockControl(edValorAMPO,             not Seguridad.Claves.IsActive('ValorDeAMPO'));
  VCLExtra.LockControl(edImporteTope,           not Seguridad.Claves.IsActive('ImporteTope'));
  VCLExtra.LockControl(edImporteContrPat,       not Seguridad.Claves.IsActive('ImporteContrPat'));
  VCLExtra.LockControl(edSalarioMinimo,         not Seguridad.Claves.IsActive('SalarioMinimo'));    }
  VCLExtra.LockControl(edSalarioMinimoPostDecr, not Seguridad.Claves.IsActive('SalarioMinimoPostDecreto'));
  VCLExtra.LockControl(edHaberMinGarantizado,   not Seguridad.Claves.IsActive('HaberMinimoGarantizado'));     // por plan SIPA
end;

function TfrmManImportesValoresAmpo.Validar: Boolean;
begin
   result := true;
end;

procedure TfrmManImportesValoresAmpo.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived   := False;
  Sql.TableName := 'CAM_TOPEAMPOS';

  VCLExtra.LockControls([edNroDeAMPOS, edValorAMPO, edImporteTope, edImporteContrPat, edSalarioMinimo], true);

  tbRefrescarClick(nil);
end;

end.
