unit unListadoCyQ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, IntEdit,
  Mask, PatternEdit;

type
  TfrmListadoCyQ = class(TForm)
    rbVencidas: TRadioButton;
    rbAVencer: TRadioButton;
    edDias: TIntEdit;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Label2: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbVencidasClick(Sender: TObject);
    procedure rbAVencerClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
  public
  end;

implementation

uses
	unRptVencimientosCyQ, unPrincipal, CustomDlgs, General;

{$R *.DFM}

procedure TfrmListadoCyQ.btnCancelarClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmListadoCyQ.FormCreate(Sender: TObject);
begin
	rbVencidas.Checked := True;
end;

procedure TfrmListadoCyQ.rbVencidasClick(Sender: TObject);
begin
	edDias.Enabled := False;
end;

procedure TfrmListadoCyQ.rbAVencerClick(Sender: TObject);
begin
	edDias.Enabled := True;
end;

procedure TfrmListadoCyQ.btnAceptarClick(Sender: TObject);
var
	rptVto: TrptVencimiento;
	sSql: String;
begin
	if (rbAVencer.Checked) and (edDias.IsEmpty) then
  begin
  	InvalidMsg(edDias, 'La cantidad de dias no puede quedar en blanco.');
    Abort;
  end;

	rptVto := TrptVencimiento.Create(Self);
  if rbVencidas.Checked then
  begin
  	sSql :=
    	'SELECT cq_nroorden, cq_cuit, mp_nombre, mp_contrato, ca_nropago, ca_fechavenc, ca_fechapago, ca_monto,' +
      			' ca_observaciones' +
       ' FROM cmp_empresas, lcq_concyquiebra,  lca_acuerdocyq' +
      ' WHERE cq_nroorden = ca_nroorden' +
      	' AND mp_cuit = cq_cuit' +
        ' AND ca_fechapago is null' +
        ' AND ca_fechavenc < actualdate' +
        ' AND ca_NroPago > 0' +
   ' ORDER BY cq_nroorden, ca_fechavenc';
		rptVto.qrlTitulo.Caption := 'Cuotas de Acuerdo Vencidas';
	end;

  if (rbAVencer.Checked) then
  begin
		sSql :=
    	'SELECT cq_nroorden, cq_cuit, mp_nombre, mp_contrato, ca_nropago, ca_fechavenc, ca_fechapago, ca_monto,' +
      			' ca_observaciones' +
       ' FROM cmp_empresas, lcq_concyquiebra,  lca_acuerdocyq' +
      ' WHERE cq_nroorden = ca_nroorden' +
      	' AND mp_cuit = cq_cuit' +
        ' AND ca_fechapago is null' +
        ' AND ca_fechavenc >= actualdate' +
        ' AND ca_fechavenc <= actualdate + ' + edDias.Text +
        ' AND ca_NroPago > 0 '+
   ' ORDER BY cq_nroorden, ca_fechavenc ';
		rptVto.qrlTitulo.Caption := 'Cuotas de Acuerdo a Vencer';
	end;

  try
  	rptVto.sdqConsulta.SQL.Text := sSql;
    rptVto.sdqConsulta.Open;
    rptVto.PreviewModal;
  finally
  	rptVto.Free;
  end;
end;

end.
