unit QREtqUsers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls;

type
  TfrmPrint = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    qrlUsuario: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure qrNombrePrint(sender: TObject; var Value: String);
    procedure qrClavePrint(sender: TObject; var Value: String);
    procedure qrlUsuarioPrint(sender: TObject; var Value: String);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    function Scramble( Value: string ): string;
  public
    { Public declarations }
  end;

var
  frmPrint: TfrmPrint;

implementation

{$R *.DFM}
Uses ComCtrls, CRC32, General, unFrmEtiquetasUsuarios;

var
   CurrentItem : integer;

//----------------------------------------------------------------------------//
procedure TfrmPrint.QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
begin
     if ( CurrentItem < frmEtiquetasUSR.lvLstUsuario.Items.Count ) then
        MoreData := True
     else
        MoreData := False;

     Inc(CurrentItem);
end;


//----------------------------------------------------------------------------//
procedure TfrmPrint.qrNombrePrint(sender: TObject; var Value: String);
var
   tmpItem : TListItem;
   str     : string;
begin
     if (CurrentItem <= frmEtiquetasUSR.lvLstUsuario.Items.Count) then begin
        tmpItem := frmEtiquetasUSR.lvLstUsuario.Items[CurrentItem-1];
        str     := ParseNombre( tmpItem.SubItems.Strings[1] );
        Value   := '*' + UpperCase( str ) + '*';
     end;

end;

//----------------------------------------------------------------------------//
procedure TfrmPrint.qrClavePrint(sender: TObject; var Value: String);
var
   tmpItem : TListItem;
   tmp     : integer;
begin
     if (CurrentItem <= frmEtiquetasUSR.lvLstUsuario.Items.Count) then begin
        tmpItem := frmEtiquetasUSR.lvLstUsuario.Items[CurrentItem-1];
        Value   := UpperCase( tmpItem.SubItems.Strings[1] );
        Value   := Scramble( Value );

        tmp      := 0;
        CalcCRC32( pChar( Value ), length( Value ), tmp );
        Value := '*' + IntToStr( Abs( tmp ) ) + '*' ;
     end;
end;              

//----------------------------------------------------------------------------//
procedure TfrmPrint.qrlUsuarioPrint(sender: TObject; var Value: String);
var
   tmpItem : TListItem;
begin
     if (CurrentItem <= frmEtiquetasUSR.lvLstUsuario.Items.Count) then begin
        tmpItem := frmEtiquetasUSR.lvLstUsuario.Items[CurrentItem-1];
        Value   := tmpItem.Caption;
     end;
end;

//----------------------------------------------------------------------------//
function TfrmPrint.Scramble( Value: string ): string;
var
   nLoop : integer;
begin
     for nLoop := 1 to Length( Value ) do
         inc( Value[ nLoop ] );

     Result := Value;
end;

//----------------------------------------------------------------------------//
procedure TfrmPrint.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     CurrentItem := 0;
end;

end.


