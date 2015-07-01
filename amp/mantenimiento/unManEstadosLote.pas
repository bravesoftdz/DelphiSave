{-----------------------------------------------------------------------------
 Unit Name: unManEstadosLote
 Author:    racastro
 Date:      19-Feb-2008
 Purpose:   Mantenimiento de Estado de Lotes
 History:
-----------------------------------------------------------------------------}

unit unManEstadosLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, General,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, ANSISql,
  unFraCodigoDescripcion, unArtDBAwareFrame, ToolEdit, CurrEdit, Mask,
  PatternEdit, IntEdit, ComboEditor, CheckCombo;

type
  TfrmManEstadosLote = class(TfrmCustomGridABM)
    fraEstadoBase: TfraCodigoDescripcion;
    edCodigo: TEdit;
    edDescripcion: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    rgTipoEstado: TRadioGroup;
    chbDerivado: TCheckBox;
    edValor: TRxCalcEdit;
    Label3: TLabel;
    chbVerSegEst: TCheckBox;
    chbRecupUltPres: TCheckBox;
    chbRecalculaFecha: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure chbDerivadoClick(Sender: TObject);
    procedure chbRecalculaFechaClick(Sender: TObject);
    procedure chbVerSegEstClick(Sender: TObject);
  protected
    { Private declarations }
    FBaseActual : integer;
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    procedure OnEstadoBaseChange(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmManEstadosLote: TfrmManEstadosLote;

implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

{$R *.dfm}

{------------------------------------------------------------------------------}

procedure TfrmManEstadosLote.ClearControls;
begin
  inherited;

  edCodigo.Clear;
  edCodigo.Enabled := true;
  edDescripcion.Clear;
  rgTipoEstado.ItemIndex := -1;
  chbDerivado.Checked := false;
  fraEstadoBase.Clear;
  fraEstadoBase.Visible := false;
  edValor.Clear;
  chbVerSegEst.Checked := false;
  chbRecupUltPres.Checked := false;
  chbRecalculaFecha.Checked := false;
  FBaseActual := 0;
end;

{------------------------------------------------------------------------------}

function TfrmManEstadosLote.DoABM: Boolean;
var
  sSQL: String;
begin
  Sql.Clear;

  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('de_id', sdqConsulta.FieldByName('de_id').AsInteger);
    Sql.Fields.Add('de_usubaja', Sesion.LoginName );
    Sql.Fields.Add('de_fechabaja', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('de_codigo', edCodigo.Text);
    Sql.Fields.Add('de_descripcion', edDescripcion.Text);
    Sql.Fields.Add('de_valor', edValor.Value);
    Sql.Fields.Add('de_tipoestado', String(iif(rgTipoEstado.ItemIndex = 0, 'A', 'I')));
    Sql.Fields.Add('de_versegestudio', String(iif(chbVerSegEst.Checked, 'S', 'N')));
    Sql.Fields.Add('de_recuperaultpresup', String(iif(chbRecupUltPres.Checked, 'S', 'N')));
    Sql.Fields.Add('de_recalculafechaproxop', String(iif(chbRecalculaFecha.Checked, 'S', 'N')));

    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('de_id', GetSecNextVal('hys.seq_hde_id') );
      Sql.Fields.Add('de_usualta', Sesion.LoginName );
      Sql.Fields.Add('de_fechalta', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('de_id', sdqConsulta.FieldByName('de_id').AsInteger );
      Sql.Fields.Add('de_usumodif', Sesion.LoginName );
      Sql.Fields.Add('de_fechamodif', exDateTime );
      Sql.Fields.Add('de_usubaja', exNull );
      Sql.Fields.Add('de_fechabaja', exNull );
    end;
  end;

  Result := inherited DoABM;

  if Result and (not chbDerivado.Checked) then
  begin
    sSQL := 'UPDATE hys.hde_descripcionestadolote ' +
            '   SET de_tipoestado = :ptipoestado ' +
            ' WHERE de_valor > TRUNC(de_valor) ' +
            '   AND TRUNC(de_valor) = :pbase ';

    if dmPrincipal.sdbPrincipal.InTransaction then
      EjecutarSqlSTEx(sSQL, [String(iif(rgTipoEstado.ItemIndex = 0, 'A', 'I')),
                             Int(edValor.Value)])
    else
      EjecutarSqlEx(sSQL, [String(iif(rgTipoEstado.ItemIndex = 0, 'A', 'I')),
                           Int(edValor.Value)])
  end
end;

{------------------------------------------------------------------------------}

procedure TfrmManEstadosLote.LoadControls;
begin
  edCodigo.Text := sdqConsulta.FieldByName('de_codigo').AsString;
  edCodigo.Enabled := false;
  edDescripcion.Text := sdqConsulta.FieldByName('de_descripcion').AsString;
  chbDerivado.Checked := not sdqConsulta.FieldByName('deriva_codigo').IsNull;
  fraEstadoBase.Codigo := sdqConsulta.FieldByName('deriva_codigo').AsString;
  rgTipoEstado.ItemIndex := iif (sdqConsulta.FieldByName('de_tipoestado').AsString = 'I', 1, 0);
  edValor.Value := sdqConsulta.FieldByName('de_valor').AsFloat;
  chbVerSegEst.Checked := sdqConsulta.FieldByName('de_versegestudio').AsString = 'S';
  chbRecupUltPres.Checked := sdqConsulta.FieldByName('de_recuperaultpresup').AsString = 'S';
  chbRecalculaFecha.Checked := sdqConsulta.FieldByName('de_recalculafechaproxop').AsString = 'S';
  FBaseActual := Trunc(edValor.Value);

  chbDerivadoClick(nil);

  inherited;
end;

{------------------------------------------------------------------------------}

function TfrmManEstadosLote.Validar: Boolean;
begin
  Result := True;

  VerificarMultiple(['Guardando Estados de Lotes',

                     edCodigo,
                     not IsEmptyString(edCodigo.Text),
                     'Debe ingresar el código',

                     edDescripcion,
                     not IsEmptyString(edDescripcion.Text),
                     'Debe ingresar la descripción',

                     fraEstadoBase,
                     (not chbDerivado.Checked) or
                     (chbDerivado.Checked and fraEstadoBase.IsSelected),
                     'Debe seleccionar el estado base del cual deriva el actual',

                     edValor,
                     edValor.Value > 0,
                     'Debe asignar el valor de agrupamiento',

                     edValor,
                     (chbDerivado.Checked) or
                     (not chbDerivado.Checked and (Int(edValor.Value) = edValor.Value)),
                     'El valor de agrupamiento debe ser un valor entero',

                     rgTipoEstado,
                     rgTipoEstado.ItemIndex <> -1,
                     'Debe indicar el tipo de estado asociado']);

  if ModoABM = maAlta then
    VerificarMultiple(['Guardando Estados de Lotes',
                       edCodigo,
                       not ExisteSql ('SELECT 1 ' +
                                      '  FROM hys.hde_descripcionestadolote ' +
                                      ' WHERE de_codigo = ' + SqlValue (edCodigo.Text)),
                       'Ya existe un estado con este código',

                       edValor,
                       not ExisteSql ('SELECT 1 ' +
                                      '  FROM hys.hde_descripcionestadolote ' +
                                      ' WHERE de_valor = ' + SqlValue (edValor.Value)),
                       'Ya existe un estado con este valor'])
  else
    VerificarMultiple(['Guardando Estados de Lotes',
                       chbDerivado,
                       (not chbDerivado.Checked) or
                       (chbDerivado.Checked and
                        ((edValor.Text = sdqConsulta.FieldByName('de_valor').AsString)
                         or
                         ((edValor.Text <> sdqConsulta.FieldByName('de_valor').AsString) and
                          (not ExisteSql ('SELECT 1 ' +
                                          '  FROM hys.hde_descripcionestadolote ' +
                                          ' WHERE de_valor > TRUNC(de_valor) ' +
                                          '   AND TRUNC(de_valor) = ' + SqlInt(FBaseActual)))
                         )
                        )
                       ),
                       'Existen estados que derivan del presente. No puede ser definido como derivado',

                       edCodigo,
                       not ExisteSql ('SELECT 1 ' +
                                      '  FROM hys.hde_descripcionestadolote ' +
                                      ' WHERE de_codigo = ' + SqlValue (edCodigo.Text) +
                                      '   AND de_id <> ' + SqlInteger (sdqConsulta.FieldByName('de_id').AsInteger)),
                       'Ya existe un estado con este código',

                       edValor,
                       not ExisteSql ('SELECT 1 ' +
                                      '  FROM hys.hde_descripcionestadolote ' +
                                      ' WHERE de_valor = ' + SqlValue (edValor.Value) +
                                      '   AND de_id <> ' + SqlInteger (sdqConsulta.FieldByName('de_id').AsInteger)),
                       'Ya existe un estado con este valor'])

end;

{------------------------------------------------------------------------------}

procedure TfrmManEstadosLote.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'de_fechabaja';
  Sql.TableName := 'hys.hde_descripcionestadolote';
  CheckPK := True;

  with fraEstadoBase do
  begin
    TableName     := 'hys.hde_descripcionestadolote';
    FieldID       := 'de_id';
    FieldCodigo   := 'de_codigo';
    FieldDesc     := 'de_descripcion';
    FieldBaja     := 'de_fechabaja';
    ExtraFields   := ', de_valor, de_tipoestado ';
    ExtraCondition:= ' AND de_valor = TRUNC(de_valor) ';
    OnChange      := OnEstadoBaseChange;
  end;
end;

{------------------------------------------------------------------------------}

procedure TfrmManEstadosLote.OnEstadoBaseChange(Sender: TObject);
begin
  rgTipoEstado.ItemIndex := iif (fraEstadoBase.sdqDatos.FieldByName('de_tipoestado').AsString = 'I', 1, 0);
  if Trunc(fraEstadoBase.sdqDatos.FieldByName('de_valor').AsFloat) = FBaseActual then
    edValor.Value := sdqConsulta.FieldByName('de_valor').AsFloat
  else
    edValor.Value := StrToFloat(ValorSQL('SELECT MAX(de_valor) + 0.01 ' +
                                         '  FROM hys.hde_descripcionestadolote ' +
                                         ' WHERE TRUNC(de_valor) = ' + SqlInteger (Trunc(fraEstadoBase.sdqDatos.FieldByName('de_valor').AsFloat))))
end;

{------------------------------------------------------------------------------}

procedure TfrmManEstadosLote.chbDerivadoClick(Sender: TObject);
begin
  if not chbDerivado.Checked then
    fraEstadoBase.Clear;
  fraEstadoBase.Visible := chbDerivado.Checked;
  edValor.Enabled := not chbDerivado.Checked;
  rgTipoEstado.Enabled := not chbDerivado.Checked;
end;

{------------------------------------------------------------------------------}

procedure TfrmManEstadosLote.chbRecalculaFechaClick(Sender: TObject);
begin
  if chbRecalculaFecha.Checked then
    chbVerSegEst.Checked := false
end;

procedure TfrmManEstadosLote.chbVerSegEstClick(Sender: TObject);
begin
  if chbVerSegEst.Checked then
    chbRecalculaFecha.Checked := false
end;

end.


