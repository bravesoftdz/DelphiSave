unit unCustomGridABM;

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

interface

uses
  {$IFDEF VER150} Placemnt, {$ELSE} rxPlacemnt, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, unCustomPanelABM, ExtCtrls,
  StdCtrls, FormPanel, FieldHider, ShortCutControl, artSeguridad, QueryPrint, QueryToFile, ExportDialog,
  SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, SqlFuncs;

type
  TModoABM = (maNone, maAlta, maModificacion, maBaja); {unCustomPanelABM}
  TfrmCustomGridABM = class(TfrmCustomConsulta)
    fpAbm: TFormPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    BevelAbm: TBevel;
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FSFormShow(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
    																	var ABackground: TColor; var AAlignment: TAlignment);
  private
    FAutoLock: Boolean;
    FTacharBajaEnReporte: Boolean;
    FOkABM: Boolean;

    procedure SetBackColor(AControl: TControl; BackColor: TColor);
    procedure SetReadOnly(AControl: TControl; Value: Boolean);
  protected
  	FieldBaja: String;
    ShowActived: Boolean;

    function DoABM: Boolean; virtual ;
    function GetSqlABM: String; virtual;
    function IsBaja: Boolean; virtual;
    function Validar: Boolean; virtual; abstract;

    procedure ClearControls; virtual; abstract;
    procedure LoadControls; virtual; abstract;
    procedure LockControl(AWinControl: TWinControl; ALocked: Boolean); virtual;
    procedure LockControls(ALocked: Boolean = True); overload; virtual;
    procedure LockControls(aWinControls: Array of TWinControl; aLocked: Boolean); overload; virtual;
  	procedure CreateSql; virtual;
    procedure ModoABMToSqlType;
  public
    CheckPK: Boolean;
    ModoABM: TModoABM;
    Sql: TCustomSql;
    UnTouch: TList;
  published
    property AutoLock           : Boolean    read FAutoLock              write FAutoLock;
    property TacharBajaEnReporte: Boolean    read FTacharBajaEnReporte   write FTacharBajaEnReporte;
    property OkABM              : Boolean    read FOkABM                 write FOkABM;
  end;

var
  CAPTION_ALTA    : String = 'Agregar';
  CAPTION_MODIFIC : String = 'Modificar';
  MSG_BAJA        : String = '¿ Desea dar de baja el registro seleccionado ?';
  MSG_PK_VIOLATED : String = 'No se pudo ingresar el registro porque ya existe uno con la misma clave';

implementation

uses
  TypInfo, unRtti, General, unDmPrincipal, CustomDlgs, AnsiSql, DBSql,
  {Para pintar los controles según las clases :}
  DBCtrls, RxLookup;

{$R *.DFM}

procedure TfrmCustomGridABM.tbNuevoClick(Sender: TObject);
begin
  ModoABM := maAlta;
  ModoABMToSqlType;
  ClearControls;
  if FAutoLock then
  	LockControls(False);
  fpABM.Caption := CAPTION_ALTA;
  FOkABM := (fpABM.ShowModal = mrOk);
end;

procedure TfrmCustomGridABM.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
  begin
    ModoABM := maModificacion;
    ModoABMToSqlType;
    LoadControls;
    if FAutoLock then
    	LockControls(True);
    fpABM.Caption := CAPTION_MODIFIC;
    FOkABM := (fpABM.ShowModal = mrOk);
  end;
end;

procedure TfrmCustomGridABM.tbEliminarClick(Sender: TObject);
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not IsBaja) and (MsgBox(MSG_BAJA, MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    ModoABM := maBaja;
    ModoABMToSqlType;
    if DoABM then
    begin
    	if sdqConsulta.Active then
     	begin
      	sdqConsulta.Refresh;
      	CheckButtons;
     	end
      else
      	tbRefrescarClick(nil);
		end;
  end;
end;

function TfrmCustomGridABM.DoABM: Boolean;
begin
  if CheckPK and (Sql.SqlType = stInsert) and (Sql.PrimaryKey.Count > 0) then
    if ExisteSql('SELECT 1 FROM ' + Sql.TableName + ' ' + Sql.Where) then
      raise Exception.Create(MSG_PK_VIOLATED);

  try
    if Sql is TDBSql then
    begin
      if dmPrincipal.sdbPrincipal.InTransaction then
        TDBSql(Sql).ExecuteST
      else
        TDBSql(Sql).Execute
    end
    else
    begin
      if dmPrincipal.sdbPrincipal.InTransaction then
        EjecutarSqlST(GetSqlABM)
      else
        EjecutarSql(GetSqlABM)
    end;

    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      ErrorMsg(E);
    end;
  end;
end;

procedure TfrmCustomGridABM.LockControl(AWinControl: TWinControl; ALocked: Boolean);
var
	i: Integer;

  function CanChange(AControl: TControl): Boolean;
  begin
  	Result := ((not Assigned(UnTouch)) or (UnTouch.IndexOf(AControl) = -1)) and (not IsIn(AControl, [TFormPanel]));
  end;

begin
	for i := 0 to AWinControl.ControlCount - 1 do
  	if CanChange(AWinControl.Controls[i]) then
    begin
    	{Cambia de estado a los componentes }
      SetReadOnly(AWinControl.Controls[i], ALocked);
      if (AWinControl.Controls[i] is TWinControl) then
      begin
      	LockControl(TWinControl(AWinControl.Controls[i]), ALocked);

        if ALocked then
        	SetBackColor(TWinControl(TWinControl(AWinControl).Controls[i]), clBtnFace)
        else
        	SetBackColor(TWinControl(TWinControl(AWinControl).Controls[i]), clWindow);
      end{ else
            SetReadOnly( AWinControl.Controls[i], ALocked );}
		end;
end;

procedure TfrmCustomGridABM.LockControls(ALocked: Boolean);
begin
  LockControl(fpAbm, ALocked);
  btnAceptar.Enabled  := not ALocked;
  btnCancelar.Enabled := not ALocked;
end;

procedure TfrmCustomGridABM.FormCreate(Sender: TObject);
begin
  inherited;

  CreateSql;
  {$IFDEF ART2}
  CheckPK     := False;
  {$ELSE}
  CheckPK     := True;
  {$ENDIF}
  ShowActived := True;
  TacharBajaEnReporte := True;
  FAutoLock   := False;
  FOkABM      := False
end;

procedure TfrmCustomGridABM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Sql.Free;
  inherited;
end;

procedure TfrmCustomGridABM.CreateSql;
begin
  Sql := TDBSql.Create;
  //Sql := TSql.Create;
end;

procedure TfrmCustomGridABM.SetBackColor(AControl: TControl; BackColor: TColor);
//Var i : Integer;
begin
	if IsIn(AControl, [TCustomEdit, TCustomComboBox, TCustomListBox, TCustomTreeView, TCustomListView, TDateTimePicker,
  									 TCustomHotKey, TCustomGrid, TDBLookupControl, TRxLookupControl]) then
		TWinColor(AControl).Color := BackColor;
{
   if AControl is TWinControl Then
      for i := 0 to TWinControl(AControl).ControlCount -1 do
          SetBackColor(TWinControl(AControl).Controls[i], BackColor);}
end;

procedure TfrmCustomGridABM.SetReadOnly(AControl: TControl; Value: Boolean);
const
  PROP_READONLY = 'ReadOnly';
begin
  if ExistsProperty(AControl, PROP_READONLY) then
  	SetPropByName(AControl, PROP_READONLY, Value)
  else if AControl is TCustomLabel then
  else
    AControl.Enabled := not Value ;
end;

procedure TfrmCustomGridABM.btnAceptarClick(Sender: TObject);
{
Var sFields : string;
    Values  : array of variant;
    i       : Integer;
}
begin
	if Validar and DoABM then
  begin
  	if sdqConsulta.Active then
    begin
    	sdqConsulta.Refresh;
      CheckButtons;
    end
    else
    	tbRefrescarClick(nil);
     {
     if (ModoABM = maModificacion) and sdqConsulta.Active Then
        sdqConsulta.Refresh
     else begin
        sFields := '';
        SetLength( Values, Sql.PrimaryKey.Count -1 );
        for i := 0 to Sql.PrimaryKey.Count -1 do begin
            sFields   := sFields + Sql.PrimaryKey[i].FieldName + ';';
            Values[i] := Sql.PrimaryKey[i].Value;
        end;

        sdqConsulta.Locate(sFields, Values, []);
     end;
     }

     { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
		fpABM.ModalResult := mrOk;
	end;
end;

procedure TfrmCustomGridABM.ModoABMToSqlType;
begin
  case ModoABM of
    maAlta:         Sql.SqlType := stInsert;
    maModificacion: Sql.SqlType := stUpdate;
    maBaja:         Sql.SqlType := stDelete;
  end;
end;

procedure TfrmCustomGridABM.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
																							Highlight: Boolean);
begin
  inherited;
  if IsBaja then
    AFont.Color := clRed;
end;

procedure TfrmCustomGridABM.FSFormShow(Sender: TObject);
begin
  inherited;
  if ShowActived then
  	tbRefrescarClick(nil);
end;

function TfrmCustomGridABM.IsBaja: Boolean;
begin
  Result := (FieldBaja <> '') and sdqConsulta.Active and (not sdqConsulta.FieldByName(FieldBaja).IsNull);
end;

function TfrmCustomGridABM.GetSqlABM: String;
begin
  Result := Sql.Sql;
end;

procedure TfrmCustomGridABM.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String;
																										var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
  inherited;
  if IsBaja and TacharBajaEnReporte then
     AFont.Style := AFont.Style + [fsStrikeOut];
end;

procedure TfrmCustomGridABM.LockControls(aWinControls: Array of TWinControl; aLocked: Boolean);
var
  iLoop: Integer;
begin
  for iLoop := Low(aWinControls) to High(aWinControls) do
    LockControl(aWinControls[iLoop], aLocked);
end;

end.


