unit unManBenefChequePorCuit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unArtDbFrame, unFraEmpresa;

type
  TfrmManBenefChequePorCuit = class(TfrmCustomGridABM)
    fraConceptoPago: TfraCodigoDescripcion;
    Label1: TLabel;
    edBeneficiario: TEdit;
    Label2: TLabel;
    fraCUITEmpresa: TfraEmpresa;
    Label3: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;

  public
    { Public declarations }
  end;

var
  frmManBenefChequePorCuit: TfrmManBenefChequePorCuit;

implementation

uses CustomDlgs, SqlFuncs, unSesion, Cuit, unDmPrincipal, AnsiSql;

const CONCEPTO_REINTEGROILT = '50';

{$R *.dfm}

procedure TfrmManBenefChequePorCuit.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  inherited;

  sSql := 'SELECT be_id, be_cuit CUIT, em_nombre RAZONSOCIAL, be_beneficiario Beneficiario, cp_denPago ConceptoPago, ' +
                ' be_autorizado Autorizado, be_fechaauto FecAuto ' +
           ' FROM SIN.sbe_beneficiariosporempresa, scp_conpago, aem_empresa ' +
          ' WHERE be_fechabaja IS NULL ' +
            ' AND cp_conpago = be_conpago ' +
            ' AND be_cuit = em_cuit ';

  sdqConsulta.SQL.Text := ssql;
  sdqConsulta.Open;
end;

procedure TfrmManBenefChequePorCuit.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;
  with fraConceptoPago do
  begin
    TableName      := 'SCP_CONPAGO';
    FieldID        := 'CP_CONPAGO';
    FieldDesc      := 'CP_DENPAGO';
    FieldCodigo    := 'CP_CONPAGO';
    FieldBaja      := 'CP_FBAJA';
    ExtraCondition := 'AND CP_TIPO in (''I'',''P'',''M'')';
  end;
  fraCUITEmpresa.ShowBajas := true;
  tbRefrescarClick(nil);
end;

procedure TfrmManBenefChequePorCuit.ClearControls;
begin
  fraCUITEmpresa.Clear;
  edBeneficiario.Clear;
  fraConceptoPago.Clear;
end;

procedure TfrmManBenefChequePorCuit.LoadControls;
begin
  fraCUITEmpresa.mskCUIT.Text := sdqConsulta.FieldByName('be_cuit').AsString;
  edBeneficiario.Text         := sdqConsulta.FieldByName('be_beneficiario').AsString;
  fraConceptoPago.Codigo      := sdqConsulta.FieldByName('be_conpago').AsString;
end;

function TfrmManBenefChequePorCuit.Validar: Boolean;
begin
  Verificar(fraCUITEmpresa.IsEmpty, fraCUITEmpresa, 'Debe completar la Empresa');
  Verificar(edBeneficiario.Text = '', edBeneficiario, 'Debe completar el Beneficiario');
  Verificar(fraConceptoPago.IsEmpty, fraConceptoPago, 'Debe completar el Concepto de Pago');
  Result := True;
end;

function TfrmManBenefChequePorCuit.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    TableName := 'SIN.sbe_beneficiariosporempresa';
    case ModoABM of
      maAlta: begin
                SqlType := stInsert;
                Fields.Add('be_cuit', fraCUITEmpresa.mskCUIT.Text);
                Fields.Add('be_beneficiario', edBeneficiario.Text);
                Fields.Add('be_conpago', fraConceptoPago.Codigo);
                Fields.Add('be_usualta',   Sesion.UserID);
                Fields.Add('be_fechaalta', exDateTime);
              end;
      maBaja: begin
                SqlType := stUpdate;
                PrimaryKey.Add('be_id',    sdqConsulta.FieldByName('be_id').AsString);
                Fields.Add('be_usubaja',   Sesion.UserID);
                Fields.Add('be_fechabaja', exDateTime);
              end;
    end;
    
    Result := inherited DoABM;
  end;
end;

procedure TfrmManBenefChequePorCuit.fpAbmBeforeShow(Sender: TObject);
begin
  fraConceptoPago.Codigo := CONCEPTO_REINTEGROILT;
  LockControl(fraConceptoPago, true);
end;

procedure TfrmManBenefChequePorCuit.tbPropiedadesClick(Sender: TObject);   // tuve que hacer el autorizar en este boton porque al poner uno nuevo, en algún momento agarra el bug de los botones famosos...
var sSql: string;
begin
  Verificar(sdqConsulta.FieldByName('AUTORIZADO').AsString = 'S', tbPropiedades, 'El beneficiario ya se encuentra autorizado');

  if MsgBox('¿Esta seguro que desea autorizar el beneficiario:' + #13#10 +
            'CUIT ' + PonerGuiones(sdqConsulta.FieldByName('CUIT').AsString) + ' - ' +
            sdqConsulta.FieldByName('BENEFICIARIO').AsString + '?'
            ,MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    Try
      Begintrans;
      sSql := 'UPDATE SIN.sbe_beneficiariosporempresa ' +
                ' SET be_autorizado = ''S'', ' +
                  ' be_usuauto = ' + SqlValue(Sesion.UserID) + ',' +
                  ' be_fechaauto = art.actualdate ' +
            ' WHERE be_id = ' + SqlInt(sdqConsulta.FieldByName('BE_ID').AsInteger);

      EjecutarSqlST(sSql);
      CommitTrans;
      tbRefrescarClick(nil);
    except
      on E:Exception do
        begin
          ErrorMsg(E, 'Error al intentar autorizar el registro.');
          Rollback;
        end;
    end;
  end;
end;


end.
