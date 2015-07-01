unit unTesterLT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unRelevLT, StdCtrls, DB, DBClient, Provider, Grids, DBGrids, 
  SDEngine, DBTables, unCustomForm, ImgList, XPMenu, Placemnt;

type

  TTesterUIF = class(TfrmCustomForm)
    btnRelev: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    OpenDialog1: TOpenDialog;
    btnCopiar: TButton;
    ClientDataSet1NOMBRE: TStringField;
    ClientDataSet1DIRECCION: TStringField;
    procedure btnCopiarClick(Sender: TObject);
    procedure btnRelevClick(Sender: TObject);
  private
    FPath: WideString;
  public
    { Public declarations }
  end;

var
  TesterUIF: TTesterUIF;

implementation

uses
  unCargaLT, unComunesLT, unDmPrincipal;

{$R *.dfm}

procedure TTesterUIF.btnCopiarClick(Sender: TObject);
begin
  ClientDataSet1.DisableControls;
  ClientDataSet1.First;
  BeginTrans(True);
  try
    while not ClientDataSet1.Eof do begin
      try
        EjecutarSqlSTEx(
            'INSERT INTO ART.PRUEBA_LT VALUES(:V1, :V2)',
            [ClientDataSet1.Fields[0].AsString, ClientDataSet1.Fields[1].AsString]
        );
        ClientDataSet1.Next;
      except
        Rollback(True);
      end;
    end;
  finally
    CommitTrans(True);
  end;
  ClientDataSet1.EnableControls;
end;

procedure TTesterUIF.btnRelevClick(Sender: TObject);
var
  Carga: TCarga;
begin
  FPath := 'E:\ART\UIF\';
  Generar(TRelevSDN, FPath + 'sdn.xml');
  Generar(TRelevGLOBAL, FPath + 'global.xml');
  Generar(TRelevCONS, FPath + 'consolidatedlist.xml');
  Generar(TRelevTXTs, FPath + 'entstld_e.txt', tarEntidad);
  Generar(TRelevTXTs, FPath + 'indstld_e.txt', tarIndividuo);
  Generar(TRelevTXTs, FPath + 'sanctionsconlist.txt', tarSanctList);

  try
    Carga := TCarga.Create(Self);
    Carga.Path := FPath;
    Carga.Cargar;

    ClientDataSet1.CloneCursor(Carga.ClientDS, False);
    Carga.ClientDS.Close;
  finally
    FreeAndNil(Carga);
  end;

end;

end.
