unit unBloqueosDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomForm, Vcl.ComCtrls,
  JvExComCtrls, JvDBTreeView, Vcl.ImgList, XPMenu, RxPlacemnt, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxCustomData, cxStyles,
  cxTL, cxMaskEdit, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Data.DB, SDEngine, Vcl.StdCtrls, cxButtons,
  cxHeader, cxInplaceContainer, cxDBTL, cxTLData, ShortCutControl;

type
  TfrmBloqueosDB = class(TfrmCustomForm)
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxLookAndFeelController: TcxLookAndFeelController;
    cxHeader1: TcxHeader;
    btnActualizar: TcxButton;
    dsLock: TDataSource;
    sdqLock: TSDQuery;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    ShortCutControl: TShortCutControl;
    sdqLockSID: TFloatField;
    sdqLockUSUARIO: TStringField;
    sdqLockEQUIPO: TStringField;
    sdqLockSISTEMA: TStringField;
    sdqLockID_PADRE: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBloqueosDB: TfrmBloqueosDB;

implementation

{$R *.dfm}

uses unDmPrincipal;

procedure TfrmBloqueosDB.btnActualizarClick(Sender: TObject);
begin
  OpenQuery(sdqLock);
end;

procedure TfrmBloqueosDB.FormCreate(Sender: TObject);
begin
  inherited;
  btnActualizarClick(nil);
end;

end.
