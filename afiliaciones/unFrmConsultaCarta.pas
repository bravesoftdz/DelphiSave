unit unFrmConsultaCarta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, ArtComboBox, Db,
  SDEngine, unArtFrame, unFraCodigoDescripcion, unfraCtbTablas, Grids, DBGrids, RXDBCtrl, ArtDBGrid, ExtCtrls;

type
  TfrmConsultaCarta = class(TForm)
    btnAceptar: TButton;
    tbConsultaCarta: TArtDBGrid;
    dsConsulta: TDataSource;
    sdqConsulta: TSDQuery;
    Bevel1: TBevel;
    procedure btnAceptarClick(Sender: TObject);
    procedure tbConsultaCartaGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                           Highlight: Boolean);
  private
//    iIDFormulario : Integer;
//    sAccion       : String;
  public
    procedure DoCargaCartas(aIdFormulario: Integer);
  end;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, General, AnsiSQL, SqlFuncs, unConsultaSolicitud;

{$R *.DFM}

procedure TfrmConsultaCarta.DoCargaCartas(aIdFormulario: Integer);
begin
  with sdqConsulta do
  begin
    Close;

    SQL.Text :=
      'SELECT ca_id, ca_idformulario, ca_nrocartadoc, ht_nombre tc_nombre, correo.tb_descripcion correo,' +
            ' ca_observaciones, NVL(ca_usureimpresion, ca_usuimpresion) uimpresion,' +
            ' NVL(ca_fechareimpresion, ca_fechaimpresion) fimpresion, ca_recepcionok, ca_fecharecepcion,' +
            ' codre.tb_descripcion, ca_fechabaja, ca_usubaja' +
       ' FROM ctb_tablas codre, cfi_firma, ctb_tablas correo, comunes.cht_historicotextocarta, cca_carta' +
      ' WHERE ca_idhistoricotextocarta = ht_id' +
        ' AND correo.tb_clave(+) = ''CORRE''' +
        ' AND NVL(ca_correoreimpresion, ca_correo) = correo.tb_codigo(+)' +
        ' AND NVL(ca_idfirmareimpresion, ca_idfirma) = fi_id' +
        ' AND codre.tb_clave(+) = ''CODRE''' +
        ' AND ca_codrecepcion = codre.tb_codigo(+)' +
        ' AND (   (ca_idformulario = :idformulario)' +
             ' OR (ca_id IN(SELECT ca_id' +
                            ' FROM ati_traspasoingreso, cca_carta' +
                           ' WHERE ca_id = ti_idcarta' +
                             ' AND ca_idformulario IS NULL' +
                             ' AND ti_idformulario = :idformulario' +
                          ' UNION ALL' +
                          ' SELECT ca_id' +
                            ' FROM aco_contrato, aen_endoso, cca_carta' +
                           ' WHERE ca_idendoso = en_id' +
                             ' AND ca_idformulario IS NULL' +
                             ' AND co_contrato = en_contrato' +
                             ' AND co_idformulario = :idformulario)))';
  end;

  OpenQueryEx(sdqConsulta, [aIdFormulario]);
end;

procedure TfrmConsultaCarta.btnAceptarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmConsultaCarta.tbConsultaCartaGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                         var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.FieldByName('ca_usubaja').AsString <> '' then
     AFont.Color:= clRed;
end;

end.
