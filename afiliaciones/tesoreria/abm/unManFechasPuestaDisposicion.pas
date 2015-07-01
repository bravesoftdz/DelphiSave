unit unManFechasPuestaDisposicion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, SqlFuncs, unSesion, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraCtbTablas, Vcl.Mask, PatternEdit, IntEdit, CustomDlgs,
  unDmPrincipal, AnsiSql;

type
  TfrmManFechasPuestaDisposicion = class(TfrmCustomGridABM)
    fraMetodoPago: TfraCtbTablas;
    Label1: TLabel;
    fraSituacionCheque: TfraCtbTablas;
    Label2: TLabel;
    Label3: TLabel;
    edDias: TIntEdit;
    GroupBox1: TGroupBox;
    rbSi_VerBajas: TRadioButton;
    rbNo_VerBajas: TRadioButton;
    rbTodos_VerBajas: TRadioButton;
    fraMetodoPago_Filtro: TfraCtbTablas;
    Label4: TLabel;
    fraSituacionCheque_Filtro: TfraCtbTablas;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    { Public declarations }
  end;

var
  frmManFechasPuestaDisposicion: TfrmManFechasPuestaDisposicion;

implementation

{$R *.dfm}

{ TfrmManFechasPuestaDisposicion }

procedure TfrmManFechasPuestaDisposicion.LoadControls;
begin
  fraMetodoPago.Codigo      := sdqConsulta.FieldByName('fp_metodopago').AsString;
  fraSituacionCheque.Codigo := sdqConsulta.FieldByName('fp_situacioncheque').AsString;
  edDias.Value              := sdqConsulta.FieldByName('fp_dias').AsInteger;
end;

procedure TfrmManFechasPuestaDisposicion.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraMetodoPago_Filtro.Clear;
  fraSituacionCheque_Filtro.Clear;
  rbNo_VerBajas.Checked := True;
end;

procedure TfrmManFechasPuestaDisposicion.tbRefrescarClick(Sender: TObject);
var sSql:string;
begin
  sSql := ' SELECT fp_id, fp_metodopago, COBRO.tb_descripcion MetodoPago, ' +
                 ' fp_situacioncheque, SITCH.tb_descripcion SituacionCheque, fp_dias, ' +
                 ' fp_usualta, fp_fechaalta, fp_usumodif, fp_fechamodif, fp_usubaja, fp_fechabaja, trunc(fp_fechabaja) fbaja ' +
            ' FROM teso.rfp_fechapuestadisp, art.ctb_tablas COBRO, art.ctb_tablas SITCH ' +
           ' WHERE COBRO.tb_clave = ''COBRO'' ' +
             ' AND COBRO.tb_codigo = fp_metodopago ' +
             ' AND SITCH.tb_clave = ''SITCH'' ' +
             ' AND SITCH.tb_codigo = fp_situacioncheque ';


  if not fraMetodoPago_Filtro.IsEmpty then
    sSql := sSql + ' AND fp_metodopago = ' + SqlValue(fraMetodoPago_Filtro.Codigo);
  if not fraSituacionCheque_Filtro.IsEmpty then
    sSql := sSql + ' AND fp_situacioncheque = ' + SqlValue(fraSituacionCheque_Filtro.Codigo);
  if rbSi_VerBajas.Checked then
    sSql := sSql + ' AND fp_fechabaja is not null '
  else if rbNo_VerBajas.Checked then
    sSql := sSql + ' AND fp_fechabaja is null ';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManFechasPuestaDisposicion.ClearControls;
begin
  fraMetodoPago.Clear;
  fraSituacionCheque.Clear;
  edDias.Clear;
end;

function TfrmManFechasPuestaDisposicion.DoABM: Boolean;
begin
  with Sql do
  begin
  	Clear;

    TableName := 'TESO.RFP_FECHAPUESTADISP';

    if ModoABM = maBaja then
    begin
    	PrimaryKey.Add('FP_ID',    sdqConsulta.FieldByName('FP_ID').AsInteger);
      Fields.Add('FP_FECHABAJA', exDateTime);
      Fields.Add('FP_USUBAJA',   Sesion.UserID);

      SqlType := stUpdate;
    end
    else
    begin
    	if ModoABM = maAlta then
      begin
       //	PrimaryKey.Add('FP_ID',    GetSecNextVal(''));
        Fields.Add('FP_FECHAALTA', exDateTime);
        Fields.Add('FP_USUALTA',   Sesion.UserID);

        SqlType := stInsert;
      end
      else
      begin
      	PrimaryKey.Add('FP_ID',     sdqConsulta.FieldByName('FP_ID').AsInteger);
        Fields.Add('FP_FECHAMODIF', exDateTime);
        Fields.Add('FP_USUMODIF',   Sesion.UserID);

        SqlType := stUpdate;
      end;

      Fields.Add('FP_METODOPAGO', fraMetodoPago.Codigo);
      Fields.Add('FP_SITUACIONCHEQUE', fraSituacionCheque.Codigo);
      Fields.Add('FP_DIAS', edDias.Value);

    end;
  end;

  Result := inherited DoABM;

end;

procedure TfrmManFechasPuestaDisposicion.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'FP_FECHABAJA';

  fraMetodoPago.Clave      := 'COBRO';
  fraMetodoPago.ShowBajas  := False;

  fraSituacionCheque.Clave     := 'SITCH';
  fraSituacionCheque.ShowBajas := False;

  fraMetodoPago_Filtro.Clave          := 'COBRO';
  fraMetodoPago_Filtro.ShowBajas      := False;

  fraSituacionCheque_Filtro.Clave     := 'SITCH';
  fraSituacionCheque_Filtro.ShowBajas := False;

  tbRefrescarClick(nil);
end;

function TfrmManFechasPuestaDisposicion.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraMetodoPago.IsEmpty, fraMetodoPago, 'Debe ingresar un Método de Pago.');
  Verificar(fraSituacionCheque.IsEmpty, fraSituacionCheque, 'Debe ingresar una Situación Cheque.');
  Verificar(edDias.IsEmpty, edDias, 'Debe ingresar los Dias.');

  sSql := 'SELECT 1 ' +
         ' FROM teso.rfp_fechapuestadisp ' +
        ' WHERE fp_metodopago = :metpago ' +
          ' AND fp_situacioncheque = :sitpago ' +
          ' AND fp_dias = :dias ' +
          ' AND fp_fechabaja is null ';

  Verificar((ModoABM = maAlta) and ExisteSqlEx(sSql, [fraMetodoPago.Codigo, fraSituacionCheque.Codigo, edDias.value]),
            btnAceptar, 'El registro ya existe en la tabla.');

  Result := True;
end;


end.
