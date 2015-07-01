unit unConsultaTraspasoIngreso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ExtCtrls, Db, SDEngine, StdCtrls, unArt;

type
  TfrmConsultaTraspasoIngreso = class(TForm)
    btnAceptar: TButton;
    dsConsulta: TDataSource;
    sdqConsulta: TSDQuery;
    Bevel1: TBevel;
    ArtDBGrid: TArtDBGrid;
    procedure btnAceptarClick(Sender: TObject);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                     Highlight: Boolean);
  private
  public
    procedure DoCargar(aIdFormulario: TTableId);
  end;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, General, AnsiSQL, SqlFuncs, unConsultaSolicitud;

{$R *.DFM}

{ TfrmConsultaTraspasoIngreso }

procedure TfrmConsultaTraspasoIngreso.DoCargar(aIdFormulario: TTableId);
begin
  sdqConsulta.SQL.Text :=
    'SELECT ti_id, ti_idformulario, ti_codigo, ti_fecha, ti_observaciones, ti_deuda, ti_idcarta, ht_nombre tipo_de_carta,' +
          ' ca_fechaimpresion, tb_descripcion tipo_de_evento,' +
          ' art.utiles.iif_compara(''IN'', ca_recepcionok, ''S N'', 0,' +
                                 ' (actualdate - TO_DATE(ca_fechaimpresion, ''DD/MM/YYYY''))) dias_transcurridos,' +
          ' ca_recepcionok, ti_fechabaja' +
     ' FROM ati_traspasoingreso, cca_carta, comunes.cht_historicotextocarta, ctb_tablas' +
    ' WHERE tb_fechabaja IS NULL' +
      ' AND ti_codigo = tb_codigo' +
      ' AND tb_clave = ''EVTIN''' +
      ' AND ti_idcarta = ca_id(+)' +
      ' AND ca_idhistoricotextocarta = ht_id(+)' +
      ' AND tb_especial1 IS NULL' +
      ' AND ti_idformulario = :idformulario' +
   ' UNION' +
   ' SELECT ti_id, ti_idformulario, ti_codigo, ti_fecha, ti_observaciones, ti_deuda, ti_idcarta, tc_nombre tipo_de_carta,' +
          ' ca_fechaimpresion, tb_descripcion tipo_de_evento,' +
          ' art.utiles.iif_compara(''IN'', ca_recepcionok, ''S N'', 0,' +
                                 ' (actualdate - TO_DATE(ca_fechaimpresion, ''DD/MM/YYYY''))) dias_transcurridos,' +
          ' ca_recepcionok, ti_fechabaja' +
     ' FROM ati_traspasoingreso, cca_carta, ctc_textocarta, ctb_tablas' +
    ' WHERE tb_fechabaja IS NULL' +
      ' AND ti_codigo = tb_codigo' +
      ' AND tb_clave = ''EVTIN''' +
      ' AND ti_idcarta = ca_id(+)' +
      ' AND tc_id(+) = tb_especial1' +
      ' AND ti_idformulario = :idformulario';
  OpenQueryEx(sdqConsulta, [aIdFormulario]);
end;

procedure TfrmConsultaTraspasoIngreso.btnAceptarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmConsultaTraspasoIngreso.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                             var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.FieldByName('ti_fechabaja').AsString <> '' then
    AFont.Color:= clRed;
end;

end.
