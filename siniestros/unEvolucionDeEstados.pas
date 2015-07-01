unit unEvolucionDeEstados;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, StdCtrls, JvgGroupBox, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ImgList, XPMenu, DB, SDEngine, Mask, DBCtrls, ExtCtrls;

type
  TfrmEvolucionDeEstados = class(TfrmCustomForm)
    dbgEstados: TArtDBGrid;
    gbSuspensionDePlazos: TJvgGroupBox;
    gbAceptacionRechazo: TJvgGroupBox;
    sdqEstados: TSDQuery;
    dsEstados: TDataSource;
    sdqEstadosSE_DESCRIPCION: TStringField;
    sdqEstadosCT_DESCRIPCION: TStringField;
    sdqEstadosES_FECHAFIN: TDateTimeField;
    sdqEstadosES_OBSERVACIONES: TStringField;
    sdqEstadosES_USUALTA: TStringField;
    sdqEstadosES_FECHAALTA: TDateTimeField;
    sdqEstadosES_SINIESTROTRAS: TFloatField;
    sdqEstadosES_ORDENTRAS: TFloatField;
    sdqEstadosES_RECAIDATRAS: TFloatField;
    sdqDatosBasicos: TSDQuery;
    dsDatosBasicos: TDataSource;
    sdqSUSP_TRAB: TSDQuery;
    dsSUSP_TRAB: TDataSource;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    sdqDatosBasicosEX_SUSPPLAZOSIN: TStringField;
    sdqDatosBasicosEX_FSUSPSIN: TDateTimeField;
    sdqDatosBasicosEX_RECHAZOSIN: TStringField;
    sdqDatosBasicosEX_FRECHAZOSIN: TDateTimeField;
    sdqDatosBasicosACEPTACIONRECHAZO_SIN: TStringField;
    sdqDatosBasicosSUSPENSIONPLAZOS_SIN: TStringField;
    sdqDatosBasicosEX_SUSPPLAZOMED: TStringField;
    sdqDatosBasicosEX_FSUSPMED: TDateTimeField;
    sdqDatosBasicosEX_RECHAZOMED: TStringField;
    sdqDatosBasicosEX_FRECHAZOMED: TDateTimeField;
    sdqDatosBasicosACEPTACIONRECHAZO_MED: TStringField;
    sdqDatosBasicosSUSPENSIONPLAZOS_MED: TStringField;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBDateEdit3: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    Panel1: TPanel;
    JvgGroupBox1: TJvgGroupBox;
    JvgGroupBox2: TJvgGroupBox;
    DBDateEdit5: TDBDateEdit;
    DBEdit9: TDBEdit;
    Label5: TLabel;
    Panel2: TPanel;
    JvgGroupBox3: TJvgGroupBox;
    JvgGroupBox4: TJvgGroupBox;
    DBDateEdit6: TDBDateEdit;
    DBDateEdit7: TDBDateEdit;
    DBEdit10: TDBEdit;
    Label6: TLabel;
    DBDateEdit8: TDBDateEdit;
    sdqSUSP_TRABCA_FECHAIMPRESION: TDateTimeField;
    sdqSUSP_TRABIMPRESION: TStringField;
    sdqSUSP_TRABDESCRRECEPCION: TStringField;
    sdqSUSP_TRABCA_FECHARECEPCION: TDateTimeField;
    Label7: TLabel;
    DBDateEdit9: TDBDateEdit;
    DBEdit11: TDBEdit;
    DBDateEdit10: TDBDateEdit;
    Label8: TLabel;
    DBDateEdit11: TDBDateEdit;
    DBEdit12: TDBEdit;
    DBDateEdit12: TDBDateEdit;
    sdqSUSP_EMP: TSDQuery;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField2: TDateTimeField;
    dsSUSP_EMP: TDataSource;
    sdqAR_TRAB: TSDQuery;
    DateTimeField3: TDateTimeField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateTimeField4: TDateTimeField;
    dsAR_TRAB: TDataSource;
    sdqAR_EMP: TSDQuery;
    DateTimeField5: TDateTimeField;
    StringField5: TStringField;
    StringField6: TStringField;
    DateTimeField6: TDateTimeField;
    dsAR_EMP: TDataSource;
    DBEdit14: TDBEdit;
    Label9: TLabel;
    DBEdit13: TDBEdit;
    Label10: TLabel;
    DBEdit15: TDBEdit;
    Label11: TLabel;
    DBEdit16: TDBEdit;
    Label12: TLabel;
    sdqSUSP_TRABCA_NROCARTADOC: TStringField;
    sdqSUSP_EMPCA_NROCARTADOC: TStringField;
    sdqAR_TRABCA_NROCARTADOC: TStringField;
    sdqAR_EMPCA_NROCARTADOC: TStringField;
    edObservaciones: TDBMemo;
    MemoObservacionesErrorCarga: TMemo;
  private
    procedure Do_cargarObservacionesErrorCarga(IdExpediente: integer);   // TK 55650
  public
    procedure LoadControls(IdExpediente: integer);
  end;

var
  frmEvolucionDeEstados: TfrmEvolucionDeEstados;

implementation

uses unDmPrincipal;

{$R *.dfm}

{ TfrmEvolucionDeEstados }

procedure TfrmEvolucionDeEstados.Do_cargarObservacionesErrorCarga(IdExpediente: integer);   // TK 55650
begin
  MemoObservacionesErrorCarga.Lines.Text := ValorSqlEx('SELECT ex_observ_errorcarga FROM art.sex_expedientes WHERE ex_id = :idexped ', [IdExpediente]);
end;

procedure TfrmEvolucionDeEstados.LoadControls(IdExpediente: integer);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i].InheritsFrom(TSDQuery) then
    begin
      with TSDQuery(Components[i]) do
      begin
        Params[0].AsInteger := IdExpediente;
        Open;
      end;
    end;
  end;

  Do_cargarObservacionesErrorCarga(IdExpediente); // TK 55650

end;

end.
