unit UnListSinxEmpv2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  Qrctrls, QuickRpt;

type
  TfrmListxEmpr2 = class(TfrmCustomConsulta)
    qrpReporte: TQuickRep;
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    QRLabel14: TQRLabel;
    qrlFiltros: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel17: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    QRBand4: TQRBand;
    qrlResultados: TQRLabel;
    sdqDatosGrilla: TSDQuery;
    sdqDatosGrillaSINIESTRO: TStringField;
    sdqDatosGrillaPACIENTE: TStringField;
    sdqDatosGrillaCUIL: TStringField;
    sdqDatosGrillaMP_NOMBRE: TStringField;
    sdqDatosGrillaFACCIDENTE: TDateTimeField;
    sdqDatosGrillaDIAS_BAJA: TFloatField;
    sdqDatosGrillaDIAGNOSTICO: TStringField;
    sdqDatosGrillaFCONTROL: TDateTimeField;
    sdqDatosGrillaPV_FECHAALTA: TDateTimeField;
    sdqDatosGrillaOBSERVACIONES: TStringField;
    sdqDatosGrillaNUEVOCONTROL: TDateTimeField;
    sdqDatosGrillaPRESTADOR: TStringField;
    sdqDatosGrillaALTA: TDateTimeField;
    dsDatos: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListxEmpr2: TfrmListxEmpr2;

implementation

{$R *.DFM}

end.
