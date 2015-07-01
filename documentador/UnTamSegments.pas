unit UnTamSegments;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Placemnt;

type
  TFrm_TamSegment = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Dbc_Owner: TDBLookupComboBox;
    Sdq_Owner: TSDQuery;
    Ds_Owner: TDataSource;
    Sdq_Tipo: TSDQuery;
    Ds_Tipo: TDataSource;
    Label1: TLabel;
    Dbc_Tipo: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    Sdq_Objetos: TSDQuery;
    Ds_Objetos: TDataSource;
    Sdq_OwnerUSERNAME: TStringField;
    Sdq_TipoSEGMENT_TYPE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Dbc_TipoClick(Sender: TObject);
    procedure MostrarTamanos(Sender: TObject);
    procedure ShowTamanos(sOwner, sTipo: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_TamSegment: TFrm_TamSegment;

implementation

{$R *.DFM}

procedure TFrm_TamSegment.FormCreate(Sender: TObject);
begin
  Sdq_Owner.Open;
  Sdq_Tipo.Open;
end;

procedure TFrm_TamSegment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrm_TamSegment.Dbc_TipoClick(Sender: TObject);
begin

end;

{------------------------------------------------------------}
procedure TFrm_TamSegment.MostrarTamanos(Sender: TObject);
begin
//
  if ( not (Dbc_Owner.Text = '')) and ( not (Dbc_Tipo.Text = '')) then
  begin
    Sdq_Objetos.Close;
    Sdq_Objetos.ParamByName('pOwner').AsString := Dbc_Owner.Text;
    Sdq_Objetos.ParamByName('pTipo').AsString := Dbc_Tipo.Text;
    Sdq_Objetos.Open;
  end; // If
end;

procedure TFrm_TamSegment.ShowTamanos(sOwner, sTipo: string);
begin
  Dbc_Owner.KeyValue := sOwner;
  Dbc_Tipo.KeyValue := sTipo;
  MostrarTamanos(Self);
  Show;
end;

end.
