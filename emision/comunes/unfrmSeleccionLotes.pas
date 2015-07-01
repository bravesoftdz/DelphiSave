unit unfrmSeleccionLotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ImgList, unfrmAdministracionLotes;

type
  TfrmSeleccionLote = class(TForm)
    gbLotesDisponibles: TGroupBox;
    bvSeparadorLotesDisponibles: TBevel;
    btnAdministrar: TButton;
    btnAceptarAsignacionLote: TButton;
    btnCancelarAsignacionLote: TButton;
    sdqLotes: TSDQuery;
    dsLotes: TDataSource;
    Grid: TArtDBGrid;
    Imagenes: TImageList;
    procedure GridDblClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure btnAdministrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarAsignacionLoteClick(Sender: TObject);
  private
    FIdLoteSelecciondo: integer;
    function GetIsSelected: boolean;
  public
    property IdLoteSelecciondo: integer read FIdLoteSelecciondo write FIdLoteSelecciondo;
    property IsSelected: boolean read GetIsSelected;
  end;

var
  frmSeleccionLote: TfrmSeleccionLote;

implementation

{$R *.dfm}

function TfrmSeleccionLote.GetIsSelected: boolean;
begin
  result := FIdLoteSelecciondo <> -1;
end;

procedure TfrmSeleccionLote.GridDblClick(Sender: TObject);
begin
  if (FIdLoteSelecciondo = sdqLotes.fieldbyname('LO_ID').AsInteger) then
    FIdLoteSelecciondo := -1
  else
    FIdLoteSelecciondo := sdqLotes.fieldbyname('LO_ID').AsInteger;
  Grid.Refresh;
end;

procedure TfrmSeleccionLote.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var bmp: TBitMap;
begin
    with (Sender as TDBGrid) do
    begin
        if (datacol = 0) then
        begin
            canvas.FillRect(rect);
            bmp := TBitMap.Create;
            if (Column.Field.Value = FIdLoteSelecciondo) then
          	    Imagenes.GetBitmap(0, Bmp)
            else
                Imagenes.GetBitmap(1, Bmp);
            canvas.Draw(rect.Left, rect.Top,bmp);
            bmp.Free;
        end;
    end;
end;

procedure TfrmSeleccionLote.FormCreate(Sender: TObject);
begin
  FIdLoteSelecciondo := -1;
  Grid.Columns[0].Title.Caption := '';
  sdqLotes.Open;
end;

procedure TfrmSeleccionLote.btnAdministrarClick(Sender: TObject);
begin
  with TfrmAdministracionLotes.Create(self) do
  try
    FormStyle := fsNormal;
    hide;
    showmodal;
    sdqLotes.Refresh;
  finally
    free;
  end;
end;

procedure TfrmSeleccionLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sdqLotes.Close;
end;

procedure TfrmSeleccionLote.btnCancelarAsignacionLoteClick(
  Sender: TObject);
begin
  close;
end;

end.
