unit unFraCriterios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, StdCtrls, ExtCtrls, FormPanel, unArtFrame,
  unFraCodigoDescripcion, unfraCodigoDescripcionExt, Buttons, DB, SDEngine;

type
  TModoEjecucion = (meAlta, meModificacion, meBaja);

  TfraCriterios = class(TFrame)
    cbCriterios: TCoolBar;
    tbComandosCriterios: TToolBar;
    tbNuevo: TToolButton;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    dbgCriterios: TArtDBGrid;
    tbSalir: TToolButton;
    fpCriterios: TFormPanel;
    bvSeparador: TBevel;
    btnAceptarCriterio: TButton;
    btnCancelarCriterio: TButton;
    cbReglasparaVariables: TCoolBar;
    tbReglasVariables: TToolBar;
    tbNuevaReglaVariable: TToolButton;
    tbEditarReglaParaVariable: TToolButton;
    tbEliminarReglaParaVariable: TToolButton;
    gbCriterio: TGroupBox;
    lblDescripcion: TLabel;
    edtDescripcionCriterio: TEdit;
    gbEdicionReglaVariables: TGroupBox;
    lblNombresVariable: TLabel;
    AceptarReglaDeVariable: TSpeedButton;
    lblValoresEntreVariable: TLabel;
    cboRelacionVariable: TComboBox;
    dbgReglasParaVariables: TDBGrid;
    sdqCriterio: TSDQuery;
    sdqRelacion: TSDQuery;
    cboVariables: TComboBox;
    dsCriterio: TDataSource;
    dsRelacion: TDataSource;
    btnSeparador2: TToolButton;
    procedure cboVariablesChange(Sender: TObject);
    procedure btnAceptarCriterioClick(Sender: TObject);
    procedure btnCancelarCriterioClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure cboRelacionVariableChange(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbNuevaReglaVariableClick(Sender: TObject);
    procedure tbEditarReglaParaVariableClick(Sender: TObject);
    procedure tbEliminarReglaParaVariableClick(Sender: TObject);
    procedure Limpiar;
  private
    { Private declarations }
    FModo : TModoEjecucion;
    FId : Integer;
    DefParamEditorUnario: TWinControl;
    DefParamEditorBinario: TWinControl;
    procedure OnTipoDatoParametroChange(Sender: TObject);
    procedure CargarDatos;
    procedure GuardarCriterio;
  public
    { Public declarations }
    procedure Inicializar;    
  end;

implementation

uses unDmPrincipal, unDmEmision, unParams, unImpoExpoTypes, unConstEmision,
     AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, General, StrFuncs;

{$R *.dfm}
{-----------------------------------------------------------------------------------}
procedure TfraCriterios.OnTipoDatoParametroChange(Sender: TObject);
var
  AClass: TWinControlClass;
  TipoDato : String;
begin
  if (cboVariables.ItemIndex > -1) and
     (TIPO_DATOS[Integer(cboVariables.Items.Objects[cboVariables.ItemIndex])] = 'B') then
  begin
   cboRelacionVariable.Visible := False;
   cboRelacionVariable.ItemIndex := 0;
  end
  else
   cboRelacionVariable.Visible := True;

  if (cboVariables.ItemIndex > -1) and
     (cboRelacionVariable.ItemIndex > -1)  Then
  begin
    TipoDato := TIPO_DATOS[Integer(cboVariables.Items.Objects[cboVariables.ItemIndex])];
    AClass := GetParamEditorClass(TipoDato);

    if (DefParamEditorUnario = nil) or (DefParamEditorUnario.ClassType <> AClass) then
    begin
      DefParamEditorUnario.Free;
      DefParamEditorUnario := AClass.Create(Self);
      ParamInitializeEditor(DefParamEditorUnario, '', 150);
      with DefParamEditorUnario do
      begin
        Left := 56;
        Top := 36;
        Parent := gbEdicionReglaVariables;
        TabOrder := 2;
      end;
    end;

    if (Integer(cboRelacionVariable.Items.Objects[cboRelacionVariable.ItemIndex]) = 2) and
       (TipoDato <> 'B') then
    begin
      if (DefParamEditorBinario = nil) or (DefParamEditorBinario.ClassType <> AClass) then
      begin
        DefParamEditorBinario.Free;
        DefParamEditorBinario := AClass.Create(Self);
        ParamInitializeEditor(DefParamEditorBinario, '', 150);
        with DefParamEditorBinario do
        begin
          Left := 210;
          Top := 36;
          Parent := gbEdicionReglaVariables;
          TabOrder := 3;
        end;
      end
    end
    else
      DefParamEditorBinario.Free;
  end;
end;
{-----------------------------------------------------------------------------------}
procedure TfraCriterios.cboVariablesChange(Sender: TObject);
begin
  OnTipoDatoParametroChange(sender);
end;
{-----------------------------------------------------------------------------------}
procedure TfraCriterios.tbNuevoClick(Sender: TObject);
begin
  FModo := meAlta;
  FId := GetSecNextVal('emi.SEQ_ica_criteriolote');
  edtDescripcionCriterio.Enabled := true;
  fpCriterios.ShowModal;
end;
{-----------------------------------------------------------------------------------}
procedure TfraCriterios.tbModificarClick(Sender: TObject);
begin
  FModo := meBaja;
  edtDescripcionCriterio.Enabled := false;
  CargarDatos;
  fpCriterios.ShowModal;
end;
{-----------------------------------------------------------------------------------}
procedure TfraCriterios.btnAceptarCriterioClick(Sender: TObject);
begin
  GuardarCriterio;
end;
{-----------------------------------------------------------------------------------}
procedure TfraCriterios.btnCancelarCriterioClick(Sender: TObject);
begin
  fpCriterios.Close;
end;
{-----------------------------------------------------------------------------------}
procedure TfraCriterios.GuardarCriterio;
begin
  VerificarMultiple(['Verificación de Criterio.',
                      edtDescripcionCriterio, not IsEmptyString(edtDescripcionCriterio.Text), 'Debe completar una Descripción para el criterio.'
                     ]);

  if FModo = meAlta then
  begin
    EjecutarSqlST('INSERT INTO EMI.ICA_CRITERIOLOTE ' +
                  ' (CA_ID, CA_DESCRIPCION, CA_USUALTA, CA_FECHAALTA) ' +
                '  VALUES (' +  SqlValue(FId) + ', ' +
                    SqlValue(edtDescripcionCriterio.Text)  + ', ' +
                    SqlValue(Sesion.LoginName) + ', Sysdate )');
  end;
  fpCriterios.close;
  sdqCriterio.Refresh;
end;
{-----------------------------------------------------------------------------------}
procedure TfraCriterios.Limpiar;
begin
  edtDescripcionCriterio.Text := '';
  if Assigned(DefParamEditorUnario) then DefParamEditorUnario.Free;
  if Assigned(DefParamEditorBinario) then DefParamEditorBinario.Free;
  sdqRelacion.Close;
  gbEdicionReglaVariables.Enabled := false;
end;
{-----------------------------------------------------------------------------------}
procedure TfraCriterios.CargarDatos;
begin
    FId := sdqCriterio.FieldByName('ca_id').AsInteger;
    edtDescripcionCriterio.Text := sdqCriterio.FieldByName('ca_descripcion').AsString;
    sdqRelacion.ParamByName('criterio').AsInteger := FId;
    sdqRelacion.Open;
end;
{-----------------------------------------------------------------------------------}
procedure TfraCriterios.Inicializar;
var
 Q : TSDQuery;
 i : integer;
 TipoDato : Integer;
begin
  cboVariables.Clear;
  Q := GetQuery('select * from emi.iva_variablecriterio');
  try
    while not Q.Eof do
    begin
      TipoDato := ArrayPos(Q.FieldByName('va_tipodato').AsString, TIPO_DATOS);
      cboVariables.AddItem(Q.FieldByName('va_descripcion').AsString, TObject(TipoDato));
      Q.Next;
    end;
  finally
    Q.Free;
  end;

  cboRelacionVariable.Clear;
  for i := Low(DESCRIPCIONRELACION) to High(DESCRIPCIONRELACION) do
    cboRelacionVariable.AddItem(DESCRIPCIONRELACION[i], TObject(TIPORELACION[i]));

  sdqCriterio.Open;
end;
{-----------------------------------------------------------------------------------}
procedure TfraCriterios.cboRelacionVariableChange(Sender: TObject);
begin
  OnTipoDatoParametroChange(sender);
end;
{-------------------------------------------------------------------------------------------------------}
{ Reglas                                                                                                }
{-------------------------------------------------------------------------------------------------------}
procedure TfraCriterios.tbNuevaReglaVariableClick(Sender: TObject);
begin

end;
{-------------------------------------------------------------------------------------------------------}
procedure TfraCriterios.tbEditarReglaParaVariableClick(Sender: TObject);
begin

end;
{-------------------------------------------------------------------------------------------------------}
procedure TfraCriterios.tbEliminarReglaParaVariableClick(Sender: TObject);
begin

end;
{-------------------------------------------------------------------------------------------------------}
end.
