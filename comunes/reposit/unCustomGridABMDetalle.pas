unit unCustomGridABMDetalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, SqlFuncs, DBSql;

type
  TfrmCustomGridABMDetalle = class(TfrmCustomGridABM)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    cbDetalle: TCoolBar;
    tbDetalle: TToolBar;
    tbNuevoDetalle: TToolButton;
    tbModificarDetalle: TToolButton;
    tbEliminarDetalle: TToolButton;
    GridDetalle: TArtDBGrid;
    sdqConsultaDetalle: TSDQuery;
    dsConsultaDetalle: TDataSource;
    fpABMDetalle: TFormPanel;
    BevelAbmDetalle: TBevel;
    btnAceptarDetalle: TButton;
    btnCancelarDetalle: TButton;
    procedure GridDetalleGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarDetalleClick(Sender: TObject);
    procedure tbNuevoDetalleClick(Sender: TObject);
    procedure tbModificarDetalleClick(Sender: TObject);
    procedure tbEliminarDetalleClick(Sender: TObject);
    procedure GridDetalleDblClick(Sender: TObject);
    procedure GridDetalleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sdqConsultaDetalleAfterOpen(DataSet: TDataSet);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  protected
    FieldBajaDetalle : String;
    procedure LoadControls; override;
    function  IsBajaDetalle : Boolean; virtual;
    procedure ClearControlsDetalle; virtual; abstract;
    procedure LoadControlsDetalle; virtual; abstract;
    procedure CreateSqlDetalle; virtual;
    function  ValidarDetalle : Boolean; virtual; abstract;
    procedure LoadQueryDetalle; virtual; 
    // Inicializa los componentes del form panel del detalle
    procedure InicializarDetalle; virtual;
    procedure CheckButtonsDetalle; virtual;
    procedure EnableButtonsDetalle(AEnabled : Boolean = True); virtual;

    function DoABMDetalle: Boolean; virtual ;
    function GetSqlABMDetalle: string; virtual;
    procedure ModoABMToSqlTypeDetalle;
  public
    SqlDetalle: TCustomSql;
    ModoABMDetalle: TModoABM;
  end;

var
  frmCustomGridABMDetalle: TfrmCustomGridABMDetalle;

implementation

uses
  unDmPrincipal, CustomDlgs, Clipbrd;

{$R *.dfm}

procedure TfrmCustomGridABMDetalle.CreateSqlDetalle;
begin
  SqlDetalle := TDBSql.Create;
end;

function TfrmCustomGridABMDetalle.DoABMDetalle: Boolean;
begin
  try
    EjecutarSqlST( GetSqlABMDetalle );
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      ErrorMsg(E);
    end;
  end;
end;

function TfrmCustomGridABMDetalle.GetSqlABMDetalle: string;
begin
  Result := SqlDetalle.Sql;
end;

procedure TfrmCustomGridABMDetalle.GridDetalleGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if IsBajaDetalle Then
    AFont.Color := clRed;
end;

function TfrmCustomGridABMDetalle.IsBajaDetalle: Boolean;
begin
  Result := (FieldBajaDetalle <> '') and sdqConsultaDetalle.Active and ( not sdqConsultaDetalle.FieldByName( FieldBajaDetalle ).IsNull);
end;

procedure TfrmCustomGridABMDetalle.ModoABMToSqlTypeDetalle;
begin
  case ModoABMDetalle of
    maAlta:         SqlDetalle.SqlType := stInsert;
    maModificacion: SqlDetalle.SqlType := stUpdate;
    maBaja:         SqlDetalle.SqlType := stDelete;
  end;
end;

procedure TfrmCustomGridABMDetalle.FormCreate(Sender: TObject);
begin
  inherited;
  CreateSqlDetalle;
  InicializarDetalle;  
end;

procedure TfrmCustomGridABMDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SqlDetalle.Free;
  inherited;
end;

procedure TfrmCustomGridABMDetalle.btnAceptarDetalleClick(Sender: TObject);
begin
  if ValidarDetalle and DoABMDetalle then
  begin
     if sdqConsultaDetalle.Active then
     begin
       sdqConsultaDetalle.Refresh;
       CheckButtonsDetalle;
     end else
       sdqConsultaDetalle.Refresh;

     fpABMDetalle.ModalResult := mrOk;
  end;
end;

procedure TfrmCustomGridABMDetalle.EnableButtonsDetalle(AEnabled: Boolean);
begin
  tbModificarDetalle.Enabled  := AEnabled and bAllowModify;
  tbEliminarDetalle.Enabled   := AEnabled and bAllowDelete;
end;

procedure TfrmCustomGridABMDetalle.InicializarDetalle;
begin
// a implementar...
end;

procedure TfrmCustomGridABMDetalle.CheckButtonsDetalle;
begin
  EnableButtonsDetalle( sdqConsultaDetalle.Active and (not sdqConsultaDetalle.IsEmpty) );
end;

procedure TfrmCustomGridABMDetalle.tbNuevoDetalleClick(Sender: TObject);
begin
  ModoABMDetalle := maAlta;
  ModoABMToSqlTypeDetalle;
  ClearControlsDetalle;
  fpABMDetalle.Caption := CAPTION_ALTA;
  fpABMDetalle.ShowModal;
end;

procedure TfrmCustomGridABMDetalle.tbModificarDetalleClick(Sender: TObject);
begin
  if sdqConsultaDetalle.Active and (not sdqConsultaDetalle.IsEmpty) then
  begin
    ModoABMDetalle := maModificacion;
    ModoABMToSqlTypeDetalle;
    LoadControlsDetalle;
    fpABMDetalle.Caption := CAPTION_MODIFIC;
    fpABMDetalle.ShowModal;
  end;
end;

procedure TfrmCustomGridABMDetalle.tbEliminarDetalleClick(Sender: TObject);
begin
  if sdqConsultaDetalle.Active and (not sdqConsultaDetalle.IsEmpty) and (not IsBajaDetalle) and (MsgBox(MSG_BAJA, MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    ModoABMDetalle := maBaja;
    ModoABMToSqlTypeDetalle;
    if DoABMDetalle then
    begin
      sdqConsultaDetalle.Refresh;
      CheckButtonsDetalle;
    end;
  end;
end;

procedure TfrmCustomGridABMDetalle.GridDetalleDblClick(Sender: TObject);
begin
  if tbModificarDetalle.Visible and tbModificarDetalle.Enabled Then
     tbModificarDetalle.Click ;
end;

procedure TfrmCustomGridABMDetalle.GridDetalleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Uppercase(Chr(Key)) = 'C') and (ssCtrl in Shift) and (not (dgRowSelect in GridDetalle.Options)) then
    Clipboard.AsText := GridDetalle.SelectedField.Value;
end;

procedure TfrmCustomGridABMDetalle.sdqConsultaDetalleAfterOpen(DataSet: TDataSet);
begin
  CheckButtonsDetalle;
end;

procedure TfrmCustomGridABMDetalle.tbNuevoClick(Sender: TObject);
begin
  GridDetalle.Color := clBtnFace;
  pnlBottom.Enabled := False;
  sdqConsultaDetalle.Close;
  inherited;
end;

procedure TfrmCustomGridABMDetalle.tbModificarClick(Sender: TObject);
begin
  pnlBottom.Enabled := True;
  GridDetalle.Color := clWindow;
  inherited;
end;

procedure TfrmCustomGridABMDetalle.LoadControls;
begin
  inherited;
  LoadQueryDetalle;
end;

procedure TfrmCustomGridABMDetalle.LoadQueryDetalle;
begin
  OpenQuery(sdqConsultaDetalle);
end;

end.
