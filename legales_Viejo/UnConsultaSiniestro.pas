unit UnConsultaSiniestro;

{----------------------------------------------------------------------------------------------------------------------
   Modulo de Consulta de Siniestros.
   Autor: EVila.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Db, SDEngine, ExtCtrls, Mask,
  ToolEdit, DateComboBox, unFraTrabajador, unFraEmpresa, SinEdit, CurrEdit, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, unArtFrame, unArtDbFrame, unArtDBAwareFrame, vclextra;

type
  TfrmConsultaSiniestro = class(TForm)
    btnSalir: TButton;
    sdqConsultaSiniestro: TSDQuery;
    Panel: TPanel;
    lbRS_SINIESTRO: TLabel;
    edRS_SINIESTRO: TSinEdit;
    Label1: TLabel;
    fraEmpresa: TfraEmpresa;
    fraTrabajador: TfraTrabajador;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbCausaFin: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edEX_FECHAACCIDENTE: TDateComboBox;
    edEX_TIPO: TEdit;
    edEX_ACCIDENTETRANSITO: TEdit;
    edEX_POSIBLERECUPERO: TEdit;
    edEX_CAUSAFIN: TEdit;
    edILT: TCurrencyEdit;
    edILP: TCurrencyEdit;
    edMORTALES: TCurrencyEdit;
    edOTROS: TCurrencyEdit;
    edPRESTMED: TCurrencyEdit;
    edCA_DESCRIPTCION: TEdit;
    ArtDBGrid1: TArtDBGrid;
    Label7: TLabel;
    sdqGastos: TSDQuery;
    dsGastos: TDataSource;
    edTOTAL: TCurrencyEdit;
    Label14: TLabel;
    Label2: TLabel;
    edLeg: TCurrencyEdit;
    Label16: TLabel;
    edMediaciones: TCurrencyEdit;
    procedure ArtDBGrid1PaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor;
      															var AlignFooter: TAlingFooter);
  private
  public
    function GetExecute(NroSiniestro, NroOrden: String): Boolean;
  end;

var
  frmConsultaSiniestro: TfrmConsultaSiniestro;
  rImporteSumado: Currency;

implementation

uses
	unDmPrincipal;

{$R *.DFM}

function TfrmConsultaSiniestro.GetExecute(NroSiniestro, NroOrden: String): Boolean;
var
	sSql: String;
begin
  fraEmpresa.ShowBajas := True;
  fraEmpresa.UltContrato := True;
  Panel.Enabled := False;

	with sdqConsultaSiniestro do
  begin
  	ParamByName('nNroSiniestro').AsString := NroSiniestro;
   	ParamByName('nNroOrden').AsString     := NroOrden;
   	Open;

    if sdqConsultaSiniestro.RecordCount > 0 then
    begin
      edLeg.Value := ValorSqlExtendedEx(
             'SELECT NVL(SUM(NVL(lpl.pl_importepago, 0) + NVL(lpl.pl_importeconretencion, 0)), 0)	'
            +'  FROM legales.lsj_siniestrosjuicioentramite sj, 	'
            +'       legales.lod_origendemanda od, 	'
            +'       legales.ljt_juicioentramite jt, 	'
            +'       legales.lpl_pagolegal lpl, 	'
            +'       legales.lbp_beneficiariopago lbp, 	'
            +'       art.scp_conpago scp, 	'
            +'       legales.lir_importesreguladosjuicio irj 	'
            +' WHERE od.od_id = sj.sj_idorigendemanda 	'
            +'   AND jt.jt_id = od.od_idjuicioentramite 	'
            +'   AND lpl.pl_idjuicioentramite = od.od_idjuicioentramite 	'
            +'   AND lbp.bp_id(+) = lpl.pl_idbeneficiariopago 	'
            +'   AND lpl.pl_conpago = scp.cp_conpago 	'
            +'   AND irj.ir_nropago(+) = lpl.pl_id 	'
            +'   AND sj.sj_siniestro = :siniestro 	'
            +'   AND sj.sj_orden = :orden 	'
            +'   AND sj.sj_recaida = 0 '
            +'   AND pl_estado <> ''C'' ',
             [ NroSiniestro, NroOrden ]);
       edMediaciones.Value := ValorSqlExtendedEx(
             ' SELECT NVL(SUM(pm_importepago), 0) + NVL(SUM(pm_importeconretencion), 0) ' +
             '   FROM legales.lpm_pagomediacion, art.scp_conpago, legales.lme_mediacion, art.sex_expedientes ' +
             '  WHERE pm_conpago = cp_conpago ' +
             '    AND pm_estado IN (''C'', ''E'') ' +
             '    AND pm_idmediacion = me_id ' +
             '    AND me_idexpediente = ex_id ' +
             '    AND ex_siniestro = :siniestro ' +
             '    AND ex_orden = :orden ' +
             '    AND ex_recaida = 0 ', [NroSiniestro, NroOrden]);
    end
    else
    begin
      edLeg.Value := 0;
      edMediaciones.Value := 0;
    end;

    edRS_SINIESTRO.SiniestroS  	:= NroSiniestro;
  	edRS_SINIESTRO.OrdenS      	:= NroOrden;
	  fraEmpresa.CUIT 						:= FieldByName('CUIT').AsString;
  	fraTrabajador.CUIL 					:= FieldByName('CUIL').AsString;
	  edEX_FECHAACCIDENTE.Date   	:= FieldByName('EX_FECHAACCIDENTE').AsDateTime;
  	edEX_TIPO.Text              := FieldByName('EX_TIPO').AsString;
  	edEX_ACCIDENTETRANSITO.Text := FieldByName('EX_ACCIDENTETRANSITO').AsString;
	  edEX_POSIBLERECUPERO.Text  	:= FieldByName('EX_POSIBLERECUPERO').AsString;
  	edEX_CAUSAFIN.Text         	:= FieldByName('CAUSAFIN').AsString;
	  edILT.Text                 	:= FieldByName('ILT').AsString;
	  edILP.Text                 	:= FieldByName('ILP').AsString;
  	edMORTALES.Text            	:= FieldByName('Mortales').AsString;
	  edOTROS.Text               	:= FieldByName('Otros').AsString;
  	edPRESTMED.Text            	:= FieldByName('Prestmed').AsString;
	  edTOTAL.Text               	:= FloatToStr(
                                      edILT.Value +
                                      edILP.Value +
                                      edMORTALES.Value +
                                      edOTROS.Value +
                                      edPRESTMED.Value +
                                      edLeg.Value +
                                      edMediaciones.Value);
  	edCA_DESCRIPTCION.Text     	:= FieldByName('ca_descripcion').AsString;
	  Close;
  end;


  // Carga la Grilla.
  sdqGastos.ParamByName('nNroSiniestro').asString := NroSiniestro;
  sdqGastos.ParamByName('nNroOrden').asString     := NroOrden;
  sdqGastos.Open;

	sSql :=
  	'SELECT NVL(SUM(pr_imporpago), 0)' +
     ' FROM spr_pagoexpesin, scp_Conpago '+
    ' WHERE pr_conpago = cp_conpago '+
    	' AND cp_legales = ''S'' '+
      ' AND pr_estado = ''E'' '+
      ' AND pr_imporpago > 0 '+
      ' AND pr_siniestro = '+ NroSiniestro  +
      ' AND pr_orden = '+ NroOrden;
	rImporteSumado := ValorSQL(sSql);

	// Muestra la ventana y devuelve Ok si todo esta bien.
  Result := ShowModal = mrOk;
end;

procedure TfrmConsultaSiniestro.ArtDBGrid1PaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
																											FontColor: TColor; var AlignFooter: TAlingFooter);
begin
	// Cuando carga el form hace un valorSQL select sum(... y mostra aca el valor.
  if Column = 'PR_IMPORPAGO' then
  	Value := FloatToStr(rImporteSumado);
end;

end.
