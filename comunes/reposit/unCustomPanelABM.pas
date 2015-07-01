
{********************************************************}
{                                                        }
{    Clase Abstracta para Mantenimientos de Tablas       }
{    Esta clase se utiliza para crear mantenimientos     }
{    de datos de la base de datos por herencia visual.   }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha: 05/2002                                      }
{                                                        }
{********************************************************}

unit unCustomPanelABM;

interface

uses
  {$IFDEF VER150} Placemnt, {$ELSE} rxPlacemnt, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FSForm, StdCtrls, ComCtrls,
  ToolWin, ExtCtrls, Db, SDEngine, artSeguridad, ShortCutControl, Menus;

type
  TModoABM = (maNone, maAlta, maModificacion, maBaja);
  TWinColor = class(TWinControl)
  published
    property Color;
  end;

  TfrmCustomPanelABM = class(TFSForm)
    pnlBusqueda: TPanel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    ToolButton4: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton6: TToolButton;
    tbImprimir: TToolButton;
    ToolButton11: TToolButton;
    tbSalir: TToolButton;
    tbNuevo: TToolButton;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    pnlDatos: TPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    ShortCutControl: TShortCutControl;
    Seguridad: TSeguridad;
    FormStorage: TFormStorage;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    btnAplicar: TButton;
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormCreate(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure SeguridadAfterExecute(Sender: TObject);
  private
    FAutoTransactions: Boolean;
    FMenuItem: TMenuItem;
    procedure SetReadOnly(AControl : TControl; Value : Boolean);
    procedure SetBackColor(AControl: TControl; BackColor : TColor);
  protected
    FAllowInsert,
    FAllowModify,
    FAllowDelete,
    FAllowPrint  : Boolean;
    Selected,
    DataLoaded : Boolean;
    procedure PKChange(ASelected : Boolean); virtual;
    procedure ClearControls(ClearPK : Boolean = False); virtual;
    procedure LockControl(AWinControl: TWinControl; ALocked: Boolean); virtual;
    procedure LoadControls; virtual;
    procedure LockControls(ALocked: Boolean = True); virtual;
    function Validar: Boolean; virtual;
    function DoABM: Boolean; virtual ;
  public
    UnTouch : TList;
    ModoABM : TModoABM;
  published
    property AutoTransactions : Boolean read FAutoTransactions write FAutoTransactions default False;
    property MenuItem: TMenuItem read FMenuItem write FMenuItem;    
  end;
{
var
  CustomPanelABM: TCustomPanelABM;
}

implementation

uses
  TypInfo, unRtti, General, unDmPrincipal, VCLExtra,
  {Para pintar los controles según las clases :}
  Grids, DBCtrls, RxLookup, FormPanel, unPrincipal;

{$R *.DFM}

{ TCustomPanelABM }


procedure TfrmCustomPanelABM.ClearControls(ClearPK : Boolean = False);
begin
  tbModificar.Enabled := False;
  tbEliminar.Enabled  := False;
  tbImprimir.Enabled  := False;
  Selected            := False;
  DataLoaded          := False;
end;

procedure TfrmCustomPanelABM.LoadControls;
begin
  tbModificar.Enabled := FAllowModify;
  tbEliminar.Enabled  := FAllowDelete;
  tbImprimir.Enabled  := FAllowPrint;
  DataLoaded          := True;
end;

procedure TfrmCustomPanelABM.LockControl(AWinControl: TWinControl; ALocked: Boolean);
var i : Integer;
  function CanChange(AControl : TControl) : boolean;
  begin
    Result := ( ( not Assigned(UnTouch)) or (UnTouch.IndexOf( AControl ) = -1) ) and
                (not IsIn(AControl, [TFormPanel]));
  end;
begin
  for i := 0 to AWinControl.ControlCount -1 do
    if CanChange( AWinControl.Controls[i] ) then
    begin
      {Cambia de estado a los componentes }
      SetReadOnly( AWinControl.Controls[i], ALocked );
      if (AWinControl.Controls[i] is TWinControl) then
      begin
        LockControl(TWinControl(AWinControl.Controls[i]), ALocked );

        if ALocked then
          SetBackColor( TWinControl(TWinControl(AWinControl).Controls[i]), clBtnFace )
        else
          SetBackColor( TWinControl(TWinControl(AWinControl).Controls[i]), clWindow );

      end{ else
        SetReadOnly( AWinControl.Controls[i], ALocked );}
    end;
end;

procedure TfrmCustomPanelABM.LockControls(ALocked: Boolean);
begin
  LockControl( pnlDatos, ALocked );
  btnAplicar.Enabled  := not ALocked;
  btnAceptar.Enabled  := not ALocked;
  btnCancelar.Enabled := not ALocked;
end;

procedure TfrmCustomPanelABM.PKChange(ASelected: Boolean);
begin
  Selected := ASelected;
  LockControls( True );
  ModoABM := maNone;

  if ASelected then
    LoadControls
  else
    ClearControls( False );
end;

procedure TfrmCustomPanelABM.SetReadOnly(AControl: TControl; Value: Boolean);
Const
  PROP_READONLY = 'ReadOnly';
begin
  if ExistsProperty( AControl, PROP_READONLY ) then
     SetPropByName(AControl, PROP_READONLY, Value)
  else if (AControl is TCustomLabel) or (AControl is TGroupBox) then
  else
     AControl.Enabled := not Value ;
end;

procedure TfrmCustomPanelABM.SetBackColor(AControl: TControl; BackColor: TColor);
//Var i : Integer;
begin
   if IsIn(AControl, [TCustomEdit, TCustomComboBox, TCustomListBox, TCustomTreeView, TCustomListView, TDateTimePicker, TCustomHotKey, TCustomGrid, TDBLookupControl, TRxLookupControl]) then
      TWinColor(AControl).Color := BackColor;
{
   if AControl is TWinControl then
      for i := 0 to TWinControl(AControl).ControlCount -1 do
          SetBackColor(TWinControl(AControl).Controls[i], BackColor);}
end;

procedure TfrmCustomPanelABM.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(MenuItem) then
    MenuItem.Enabled := True;
    
  Action := caFree;
end;

procedure TfrmCustomPanelABM.FSFormCreate(Sender: TObject);
begin
//  if not Assigned(UnTouch) then
//     UnTouch    := TList.Create ;

  FAutoTransactions := False;
  Selected          := False;
  DataLoaded        := False;

  { Por si deshabilita el control de Seguridad }
  FAllowInsert  := True;
  FAllowModify  := True;
  FAllowDelete  := True;
  FAllowPrint   := True;

  LockControls( True );

  if Owner is TMenuItem then
    TMenuItem(Owner).Enabled := False;
end;

procedure TfrmCustomPanelABM.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCustomPanelABM.tbNuevoClick(Sender: TObject);
begin
    //Sql.SqlType := stInsert;
    ModoABM     := maAlta;
    LockControls( False ); { Esto estaba debajo del ClearControls, By Fede 23/07/2004 }
    ClearControls( True );

     if FAutoTransactions then
        BeginTrans;
{    if pnlDatos.CanFocus then
       pnlDatos.SetFocus;}
     if Visible then
       SelectNext(pnlDatos, True, True);
end;

procedure TfrmCustomPanelABM.tbModificarClick(Sender: TObject);
begin
    if Selected then
    begin
       //Sql.SqlType := stUpdate;
       ModoABM     := maModificacion;
       LockControls( False );
{       if pnlDatos.CanFocus then
          pnlDatos.SetFocus;}
       if FAutoTransactions then
          BeginTrans;

       if Visible then
         SelectNext(pnlDatos, True, True);
    end;
end;

procedure TfrmCustomPanelABM.tbEliminarClick(Sender: TObject);
begin
    if Selected then begin
       //Sql.SqlType := stDelete;
       ModoABM     := maBaja;
       if FAutoTransactions then
          BeginTrans;
       DoABM;
    end;
end;

procedure TfrmCustomPanelABM.tbLimpiarClick(Sender: TObject);
begin
   Case ModoABM of
        maAlta, maNone: ClearControls( True );
        maModificacion: LoadControls;
   end;
end;

function TfrmCustomPanelABM.Validar: Boolean;
begin
    Result := False;
end;

procedure TfrmCustomPanelABM.btnAceptarClick(Sender: TObject);
begin
  if Validar and DoABM then
  begin
    LockControls;
    if ModoABM = maBaja then
      ClearControls( False )
    else
      DataLoaded := True;

    if FAutoTransactions then
      CommitTrans;
    ModoABM := maNone;
  end;
end;

procedure TfrmCustomPanelABM.btnAplicarClick(Sender: TObject);
begin
    if Validar and DoABM then begin
       if ModoABM = maBaja then begin
          ClearControls( False );
          ModoABM := maNone;
       end else begin
          ModoABM    := maModificacion;
          tbModificar.Enabled := FAllowModify;
          tbEliminar.Enabled  := FAllowDelete;
          tbImprimir.Enabled  := FAllowPrint;
          DataLoaded := True;
       end;

       if FAutoTransactions then begin
          CommitTrans;
          BeginTrans;
       end;
    end;
end;

function TfrmCustomPanelABM.DoABM: Boolean;
begin
  Result := False;
end;

procedure TfrmCustomPanelABM.btnCancelarClick(Sender: TObject);
begin
  LockControls;
  case ModoABM of
    maAlta:
      ClearControls( False );
    maModificacion:
    begin
      LockControls;
      LoadControls;
    end;
  end;

  if FAutoTransactions then
    Rollback;

  ModoABM := maNone;
end;

procedure TfrmCustomPanelABM.FSFormDestroy(Sender: TObject);
begin
  if Assigned(MenuItem) then
    MenuItem.Enabled := True;
    
  if Assigned(UnTouch) then
     UnTouch.Free;
end;

procedure TfrmCustomPanelABM.SeguridadAfterExecute(Sender: TObject);
begin
    { Guarda en una variable el estado de los botones despues de aplicar la seguridad }
    FAllowInsert  := tbNuevo.Enabled;
    FAllowModify  := tbModificar.Enabled;
    FAllowDelete  := tbEliminar.Enabled;
    FAllowPrint   := tbImprimir.Enabled;
end;

end.
