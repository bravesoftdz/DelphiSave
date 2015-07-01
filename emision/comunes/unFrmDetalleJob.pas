unit unFrmDetalleJob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, SDEngine;

type
  TForm1 = class(TForm)
    SDQuery1: TSDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses unDmPrincipal, unDmEmision;

{$R *.dfm}

end.
