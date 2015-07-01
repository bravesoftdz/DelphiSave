unit unFraSDA_DETALLEARCHIVO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtFrame, StdCtrls, Mask, PatternEdit, IntEdit, ComCtrls;

type
  TfraSDA_DETALLEARCHIVO = class(TArtFrame)
    Label1: TLabel;
    cmbDA_OPCION: TComboBox;
    Label2: TLabel;
    edDA_HOJAS: TIntEdit;
    edDA_HOJASDef: TIntEdit;
    procedure cmbDA_OPCIONChange(Sender: TObject);
  private
    FFormulario: string;
    function GetOpcion: string;
    procedure SetOpcion(const Value: string);
    function GetHojas: Integer;

    function GetHojasDefault: integer;                  // Lu WF 8131
    procedure SetHojasDefault(const Value: integer);

  protected
    procedure SetLocked(const Value: Boolean); override;
  public
    function  Validate(ATabIndex: Integer = -1): Boolean;
    procedure Clear; override;
  published
    property Opcion: string read GetOpcion write SetOpcion;
    property Hojas: Integer read GetHojas;
    property HojasDefault: Integer read GetHojasDefault write SetHojasDefault; // Lu WF 8131
    property Formulario: string read FFormulario write FFormulario;
  end;

implementation

{$R *.DFM}

uses
  CustomDlgs, StrFuncs;                             


{ TfraSDA_DETALLEARCHIVO }

function TfraSDA_DETALLEARCHIVO.GetOpcion: string;
begin
  if cmbDA_OPCION.ItemIndex = -1 Then
    Result := ''
  else
    Result := GetFirstChar(cmbDA_OPCION.Text);
end;

procedure TfraSDA_DETALLEARCHIVO.SetLocked(const Value: Boolean);
begin
  inherited;
  cmbDA_OPCION.Enabled := not Value;
end;

procedure TfraSDA_DETALLEARCHIVO.SetOpcion(const Value: string);
begin
  cmbDA_OPCION.ItemIndex := Pos(Value, 'DGAS') -1;
end;

function TfraSDA_DETALLEARCHIVO.Validate(ATabIndex: Integer = -1): Boolean;
  function GetParentTabSheet(AControl: TWinControl): TTabSheet;
  begin
    if Assigned(AControl) then
      if (AControl.ClassType <> TTabSheet) then
        Result := GetParentTabSheet(AControl.Parent)
      else
        Result := TTabSheet(AControl)
    else
      Result := nil;
  end;

  function GetParentPageControl(AControl: TWinControl): TPageControl;
  begin
    if Assigned(AControl) then
      if (AControl.ClassType <> TPageControl) then
        Result := GetParentPageControl(AControl.Parent)
      else
        Result := TPageControl(AControl)
    else
      Result := nil;
  end;
begin
  if ATabIndex > -1 then
  begin
    if (cmbDA_OPCION.ItemIndex = -1) then
    begin
      GetParentPageControl(Self).ActivePage := GetParentTabSheet(Self);
      InvalidMsg(cmbDA_OPCION, 'Debe seleccionar un destino de papel.');
      Abort;
    end;

    if (cmbDA_OPCION.ItemIndex <> cmbDA_OPCION.Items.Count - 1) and (edDA_HOJAS.Value = 0) then
    begin
      GetParentPageControl(Self).ActivePage := GetParentTabSheet(Self);
      InvalidMsg(edDA_HOJAS, 'Debe ingresar una cantidad válida de hojas.');
      Abort;
    end;

    if (cmbDA_OPCION.ItemIndex = 2) then
    begin
      GetParentPageControl(Self).ActivePage := GetParentTabSheet(Self);
      InvalidMsg(cmbDA_OPCION, 'La opción Archivo ART se encuentra momentáneamente deshabilitada.');
      Abort;
    end;
  end
  else begin
    Verificar(cmbDA_OPCION.ItemIndex = -1, cmbDA_OPCION, 'Debe seleccionar un destino de papel.');
    Verificar((cmbDA_OPCION.ItemIndex <> cmbDA_OPCION.Items.Count - 1) and (edDA_HOJAS.Value = 0), edDA_HOJAS, 'Debe ingresar una cantidad válida de hojas.');
    Verificar(cmbDA_OPCION.ItemIndex = 2, cmbDA_OPCION, 'La opción Archivo ART se encuentra momentáneamente deshabilitada.');
  end;

  Result := True;
end;

procedure TfraSDA_DETALLEARCHIVO.cmbDA_OPCIONChange(Sender: TObject);
begin
  inherited;
  if cmbDA_OPCION.ItemIndex = cmbDA_OPCION.Items.Count - 1 then
  begin
    edDA_HOJAS.Value := 0;
    edDA_HOJAS.Enabled := False;
  end else
  begin                                    // Lu WF 8131
    if (edDA_HOJASDef.Value = 0) then
      edDA_HOJAS.Value := 1
    else
      edDA_HOJAS.Value := edDA_HOJASDef.Value;
    edDA_HOJAS.Enabled := True;
  end;
end;

procedure TfraSDA_DETALLEARCHIVO.Clear;
begin
  inherited;
  Opcion := '';
  edDA_HOJAS.Value    := 0;
  edDA_HOJASDef.Value := 0;
end;

function TfraSDA_DETALLEARCHIVO.GetHojas: Integer;
begin
  Result := edDA_HOJAS.Value;
end;

function TfraSDA_DETALLEARCHIVO.GetHojasDefault: integer;   // Lu WF 8131
begin
  Result := edDA_HOJASDef.Value;
end;

procedure TfraSDA_DETALLEARCHIVO.SetHojasDefault(const Value: integer);  // Lu WF 8131
begin
  edDA_HOJASDef.Value := Value;
end;

end.
