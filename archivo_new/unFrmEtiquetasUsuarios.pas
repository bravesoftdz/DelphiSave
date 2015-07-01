unit unFrmEtiquetasUsuarios;

interface

uses
    SysUtils, Classes, Controls, Forms, SDEngine, ExtCtrls, Db,
    ComCtrls, StdCtrls, Mask, DBCtrls, RXLookup, Buttons, Menus, ActnList;

type
  TfrmEtiquetasUSR = class(TForm)
    lvLstUsuario: TListView;
    bvMarco: TBevel;
    qryUsuarios: TSDQuery;
    dsUsuarios: TDataSource;
    lcbUsuario: TRxDBLookupCombo;
    lblNombre: TLabel;
    lblSector: TLabel;
    dbeSector: TDBEdit;
    pumMenuOpciones: TPopupMenu;
    btnAgregar: TButton;
    pnBotones: TPanel;
    btnImprimir: TButton;
    mnuQuitar: TMenuItem;
    mnuLimpiarLista: TMenuItem;
    N1: TMenuItem;
    mnuImprimir: TMenuItem;
    cbTodos: TCheckBox;
    ActionList: TActionList;
    actAgregar: TAction;
    actImprimir: TAction;
    actMnuLimpiar: TAction;
    actMnuQuitar: TAction;
    qryUsuariosSE_NOMBRE: TStringField;
    qryUsuariosSC_DESCRIPCION: TStringField;
    qryUsuariosSE_USUARIO: TStringField;
    procedure btnAgregarClick(Sender: TObject);
    procedure mnuQuitarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnuLimpiarListaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure cbTodosClick(Sender: TObject);
    procedure lblSectorDblClick(Sender: TObject);
  private
    { Private declarations }
    Procedure CargaTodos;
  public
    { Public declarations }
  end;

var
  frmEtiquetasUSR: TfrmEtiquetasUSR;

implementation

{$R *.DFM}

Uses Dialogs, QREtqUsers;

//----------------------------------------------------------------------------//
procedure TfrmEtiquetasUSR.FormCreate(Sender: TObject);
begin
     qryUsuarios.Open;
end;

//----------------------------------------------------------------------------//
procedure TfrmEtiquetasUSR.FormDestroy(Sender: TObject);
begin
     qryUsuarios.Close;
end;

//----------------------------------------------------------------------------//
procedure TfrmEtiquetasUSR.btnAgregarClick(Sender: TObject);
var
   tmpItem : TListItem;
begin
     if cbTodos.Checked then begin
        CargaTodos;
        exit;
     end;

     If ( lcbUsuario.Text <> '' ) then begin
        tmpItem := lvLstUsuario.Items.Add;
        tmpItem.Caption := lcbUsuario.KeyValue;
        tmpItem.SubItems.Add( dbeSector.Text );
        tmpItem.SubItems.Add( qryUsuariosSE_USUARIO.AsString);
        actMnuQuitar.Enabled   := True;
        actMnuLimpiar.Enabled  := True;
        actImprimir.Enabled := True;
     end;
end;

//----------------------------------------------------------------------------//
procedure TfrmEtiquetasUSR.mnuQuitarClick(Sender: TObject);
begin
     If ( lvLstUsuario.SelCount = 1 ) then begin
        lvLstUsuario.Selected.Delete;

        if ( lvLstUsuario.Items.Count = 0 ) then begin
           actMnuQuitar.Enabled   := False;
           actMnuLimpiar.Enabled  := False;
           actImprimir.Enabled := False;
        end;
     end;
end;


//----------------------------------------------------------------------------//
procedure TfrmEtiquetasUSR.mnuLimpiarListaClick(Sender: TObject);
begin
     If MessageDlg('Confirma borrar TODA la lista ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
        lvLstUsuario.Items.Clear;

        actMnuQuitar.Enabled   := False;
        actMnuLimpiar.Enabled  := False;
        actImprimir.Enabled := False;
     end;
end;

//----------------------------------------------------------------------------//
procedure TfrmEtiquetasUSR.btnImprimirClick(Sender: TObject);
begin
     frmPrint := TfrmPrint.Create( Self );
     try
        frmPrint.QuickRep1.Preview;
     finally
        frmPrint.Free;
     end;
end;

//----------------------------------------------------------------------------//
procedure TfrmEtiquetasUSR.cbTodosClick(Sender: TObject);
begin
     If cbTodos.Checked then
        lcbUsuario.Enabled := False
     else
        lcbUsuario.Enabled := True;
end;

//----------------------------------------------------------------------------//
procedure TfrmEtiquetasUSR.CargaTodos;
var
   tmpItem : TListItem;
begin
     Screen.Cursor := crHourGlass;
     try
        qryUsuarios.First;
        while not QryUsuarios.Eof do begin

              tmpItem := lvLstUsuario.Items.Add;
              tmpItem.Caption := qryUsuariosSE_NOMBRE.AsString;
              tmpItem.SubItems.Add( qryUsuariosSC_DESCRIPCION.AsString );
              tmpItem.SubItems.Add( qryUsuariosSE_USUARIO.AsString);

              qryUsuarios.Next;
        end;
     finally
        Screen.Cursor := crDefault;
        actMnuQuitar.Enabled   := True;
        actMnuLimpiar.Enabled  := True;
        actImprimir.Enabled := True;
     end;

end;

//--------------------------------------------------------------------------//
procedure TfrmEtiquetasUSR.lblSectorDblClick(Sender: TObject);
var
   Nombre, Clave : string;
   tmpItem : TListItem;
begin
     Nombre := InputBox( 'Nombre', 'Nombre Usuario', 'Nelson' );
     Clave  := InputBox( 'Usuario', 'Codigo Usuario', 'Nelson' );
     if ( Trim( Nombre ) <> 'Nelson' ) then begin
        tmpItem := lvLstUsuario.Items.Add;
        tmpItem.Caption := Nombre;
        tmpItem.SubItems.Add( 'Anónimo' );
        tmpItem.SubItems.Add( Clave );
     end;
end;

end.
