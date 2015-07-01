unit unfrmNotasEnBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PatternEdit, IntEdit, StdCtrls, Mask, ToolEdit, CurrEdit,
  ComCtrls, ToolWin, AxCtrls, OleCtrls, ImgeditLibCtl_TLB, ExtCtrls,
  JvgGroupBox, DB, SDEngine;

type
  TFrmNotasEnBank = class(TForm)
    pnlVistaPrevia: TPanel;
    imgBank: TImgEdit;
    cbComandos: TCoolBar;
    tbComandos: TToolBar;
    tbZoomDec: TToolButton;
    edZoom: TCurrencyEdit;
    tbZoomInc: TToolButton;
    tbPageFirst: TToolButton;
    tbPagePrior: TToolButton;
    edPage: TIntEdit;
    edPageCount: TIntEdit;
    tbPageNext: TToolButton;
    tbPageLast: TToolButton;
    tbAbrirImagen: TToolButton;
    tbGuardarImagen: TToolButton;
    pnlImgStatus: TPanel;
    gbDerivacionNota: TJvgGroupBox;
    pnDerivacionNota: TPanel;
    edtBiblioratoNota: TIntEdit;
    lblBibliorato: TLabel;
    lblSecuencia: TLabel;
    edtSecuenciaNota: TIntEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure LoadBiblioratoSecuenciaContrato
         (Contrato : Integer; Bibliorato : Integer; Secuencia : Integer);
    class function CheckBiblioratoSecuenciaContrato
          (Contrato : Integer; Bibliorato : Integer; Secuencia : Integer) : boolean;
  end;

var
  FrmNotasEnBank: TFrmNotasEnBank;

implementation

uses unDmEmision, unDmPrincipal;

{$R *.dfm}




{ TFrmNotasEnBank }

class function TFrmNotasEnBank.CheckBiblioratoSecuenciaContrato
  (Contrato, Bibliorato, Secuencia: Integer): boolean;
begin
  result :=   ValorSqlEx('SELECT 1  FROM bank.scanemis    ' +
                         ' WHERE bibliorato = :bibliorato ' +
                         '   AND secuencia = :secuencia   ' +
                         '   AND contrato = :contrato     ' +
                         '   AND ROWNUM <= 1 ', [Bibliorato, Secuencia, Contrato], '0') = 1;
end;

class procedure TFrmNotasEnBank.LoadBiblioratoSecuenciaContrato(Contrato,
  Bibliorato, Secuencia: Integer);
var
 Q : TSdQuery;
 imagen : string;
begin
  Q := GetQueryEx('select * from bank.scanemis    ' +
                  ' WHERE bibliorato = :bibliorato ' +
                  '   AND secuencia = :secuencia   ' +
                  '   AND contrato = :contrato ', [Bibliorato, Secuencia, Contrato]);
  try

    if Q.RecordCount > 0 then
    begin
      with TFrmNotasEnBank.Create(nil) do
      try
        imgBank.ClearDisplay;
        imgBank.Page  := 1;
        imagen := IncludeTrailingBackslash(Q.FieldByName('FD_CARPETA').AsString) +
                                                  Q.FieldByName('FD_IMAGEN').AsString;
        imgBank.Image := imagen;

        edtBiblioratoNota.Value := Bibliorato;
        edtSecuenciaNota.Value := Secuencia;

        Showmodal;
      finally
        Free;
      end;
    end else
      MessageBox(0, 'No se encontró imagen asociada con los datos suministrados.',
                    'Imagenes de Bank', MB_ICONASTERISK or MB_OK);
  finally
    Q.Free;
  end;
end;

procedure TFrmNotasEnBank.FormShow(Sender: TObject);
begin
  try
    if FileExists(imgBank.Image) then imgBank.Display;
  except
  end;
end;

end.
