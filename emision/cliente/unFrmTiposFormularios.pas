unit unFrmTiposFormularios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit;

type
  TfrmTiposFormularios = class(TfrmCustomGridABM)
    chkDetallaTrabajadores: TCheckBox;
    chkContieneNomina: TCheckBox;
    chkCantTrabajadores: TCheckBox;
    chkDetallaEspecificaPeriodosMultiples: TCheckBox;
    chkPermiteCargaManual: TCheckBox;
    edNroFormulario: TPatternEdit;
    Label18: TLabel;
    Label19: TLabel;
    edDescripcionFormulario: TEdit;
    Label1: TLabel;
    edCodigoArchivo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    rbModoLocal: TRadioButton;
    cmbFormato: TComboBox;
    rbModoServidor: TRadioButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmTiposFormularios: TfrmTiposFormularios;

implementation

uses unDmPrincipal, unDmEmision, AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, General,   StrFuncs,
  unConstEmision;

{$R *.dfm}

procedure TfrmTiposFormularios.FormCreate(Sender: TObject);
var
 i: Integer;
begin
  inherited;

  FieldBaja := 'TF_FECHABAJA';
  Sql.TableName := 'EMI.ITF_TIPOFORMULARIO';
  CheckPK := True;

  cmbFormato.Clear;
  for i := Low(TF_FORMATO) to High(TF_FORMATO_DESCRIPCION) do
    cmbFormato.AddItem(TF_FORMATO_DESCRIPCION[i], TObject(TF_FORMATO[i]));
end;

procedure TfrmTiposFormularios.ClearControls;
begin
  inherited;
  edNroFormulario.Clear;
  edDescripcionFormulario.Clear;
  chkDetallaTrabajadores.Checked := false;
  chkContieneNomina.Checked := false;
  chkCantTrabajadores.Checked := false;
  chkDetallaEspecificaPeriodosMultiples.Checked := false;
  chkPermiteCargaManual.Checked := false;
  edCodigoArchivo.Clear;
  cmbFormato.ClearSelection;
  rbModoLocal.Checked := false;
  rbModoServidor.Checked := True;
end;


function TfrmTiposFormularios.DoABM: Boolean;
begin
  try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('TF_ID', sdqConsulta.FieldByName('TF_ID').AsInteger );
      Sql.Fields.Add('TF_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('TF_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('TF_DESCRIPCION', edDescripcionFormulario.Text);
      Sql.Fields.Add('TF_HEADER', edCodigoArchivo.Text);
      Sql.Fields.Add('TF_TRABAJADORES', chkDetallaTrabajadores.Checked);
      Sql.Fields.Add('TF_NOMINA', chkContieneNomina.Checked);
      Sql.Fields.Add('TF_SINPERSONAL', chkCantTrabajadores.Checked);
      Sql.Fields.Add('TF_MULTIPERIODO', chkDetallaEspecificaPeriodosMultiples.Checked);
      Sql.Fields.Add('TF_PRESENTACIONMANUAL', chkPermiteCargaManual.Checked);

      if cmbFormato.ItemIndex >= 0 then
        Sql.Fields.Add('TF_FORMATO', TF_FORMATO[cmbFormato.ItemIndex]);

      if rbModoLocal.Checked then
         Sql.Fields.Add('TF_MODO', 'L')
      else
         Sql.Fields.Add('TF_MODO', 'S');

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('TF_ID', GetSecNextVal('EMI.SEQ_ITF_ID'));
        Sql.Fields.Add('TF_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('TF_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('TF_ID', sdqConsulta.FieldByName('TF_ID').AsInteger);
        Sql.Fields.Add('TF_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('TF_FECHAMODIF', exDateTime );
        Sql.Fields.Add('TF_USUBAJA', exNull );
        Sql.Fields.Add('TF_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el formulario.');
    end;
  end;
end;

procedure TfrmTiposFormularios.LoadControls;
begin
  inherited;
  edNroFormulario.Text           := sdqConsulta.fieldbyname('TF_ID').AsString;
  edDescripcionFormulario.Text   := sdqConsulta.fieldbyname('TF_DESCRIPCION').AsString;
  edCodigoArchivo.Text           := sdqConsulta.fieldbyname('TF_HEADER').AsString;
  chkDetallaTrabajadores.Checked := (sdqConsulta.fieldbyname('TF_TRABAJADORES').AsString = 'S');
  chkContieneNomina.Checked      := (sdqConsulta.fieldbyname('TF_NOMINA').AsString = 'S');
  chkCantTrabajadores.Checked    := (sdqConsulta.fieldbyname('TF_SINPERSONAL').AsString = 'S');
  chkPermiteCargaManual.Checked  := (sdqConsulta.fieldbyname('TF_PRESENTACIONMANUAL').AsString = 'S');
  chkDetallaEspecificaPeriodosMultiples.Checked := (sdqConsulta.fieldbyname('TF_MULTIPERIODO').AsString = 'S');

  cmbFormato.ItemIndex := ArrayPosI(sdqConsulta.fieldbyname('TF_FORMATO').asInteger, TF_FORMATO);

  if sdqConsulta.fieldbyname('TF_MODO').asString = 'S' then
     rbModoServidor.Checked := True
  else
     rbModoLocal.Checked := True;

end;

function TfrmTiposFormularios.Validar: Boolean;
begin
    Result := VerificarMultiple(['Administración de Tipos de Formularios',
                                  edDescripcionFormulario, not IsEmptyString(edDescripcionFormulario.text), 'Debe especificar la descripción del formulario.',
                                  chkDetallaTrabajadores, not (chkDetallaTrabajadores.Checked and chkCantTrabajadores.Checked), 'No debe especificar Sin Trabajadores si detalla trabajadores .'
                                ]);
end;

end.
