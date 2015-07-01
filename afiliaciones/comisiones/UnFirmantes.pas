unit UnFirmantes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, StdCtrls, PatternEdit, DBIncrementalSearch, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ExtCtrls, unDMPrincipal, Mask;

type
  TfrmFirmantes = class(TForm)
    dbgDatos: TArtDBGrid;
    isFirmante: TDBIncrementalSearch;
    sdqFirmas: TSDQuery;
    dsFirmas: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    pnlbtnAceptar: TPanel;
    btnAceptar: TButton;
    edFirmante: TEdit;
    procedure edFirmanteKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgDatosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgDatosCellClick(Column: TColumn);
    procedure isFirmanteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDatosDblClick(Sender: TObject);
    procedure CargarDatos;
  end;
implementation

{$R *.DFM}
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmFirmantes.edFirmanteKeyUp(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if (Length(edFirmante.Text) > 1 ) then
    if sdqFirmas.Locate('FI_ID', edFirmante.Text, [] ) then
      isFirmante.Text := sdqFirmas.FieldByName('FI_FIRMANTE').AsString;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmFirmantes.dbgDatosKeyUp(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  CargarDatos;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmFirmantes.dbgDatosCellClick(Column: TColumn);
begin
  CargarDatos;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmFirmantes.isFirmanteChange(Sender: TObject);
begin
    edFirmante.Text := sdqFirmas.FieldByName('FI_ID').AsString;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmFirmantes.FormShow(Sender: TObject);
begin
  CargarDatos;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmFirmantes.dbgDatosDblClick(Sender: TObject);
begin
  self.ModalResult := mrOk;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmFirmantes.CargarDatos;
begin
   isFirmante.Text := sdqFirmas.FieldByName('FI_FIRMANTE').AsString;
   edFirmante.Text := sdqFirmas.FieldByName('FI_ID').AsString;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
end.
