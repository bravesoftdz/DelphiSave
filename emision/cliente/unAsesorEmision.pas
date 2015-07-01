unit unAsesorEmision;

interface

uses
  Forms, ShortCutControl, unFraCodigoDescripcion, unArtFrame, unFraDomicilio, StdCtrls, PatternEdit, Controls, ComCtrls,
  Classes, ToolWin, Mask, unFraDomicilioTrab, artSeguridad, unART, unArtDBAwareFrame;

type
  TfrmAsesorEmision = class(TForm)
    tlbControl: TToolBar;
    tlbLimpiar: TToolButton;
    tlbGuardar: TToolButton;
    tlbSalir: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    ToolButton2: TToolButton;
    ShortCutControl: TShortCutControl;
    StatusBar: TStatusBar;
    grbContacto: TGroupBox;
    Label1: TLabel;
    fraAS_ID: TfraCodigoDescripcion;
    Seguridad: TSeguridad;
    procedure FormCreate(Sender: TObject);
    procedure tlbLimpiarClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
  private
    FCodigoContrato: Integer;
  public
    procedure DoCargarDatos(const CodigoContrato: Integer); overload;
  end;

implementation

uses
  Windows, SysUtils, unDmPrincipal, VCLExtra, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs,
  General, unComunes;

{$R *.DFM}

procedure TfrmAsesorEmision.FormCreate(Sender: TObject);
begin
  inherited;

  fraAS_ID.TableName   := 'IAS_ASESOREMISION';
  fraAS_ID.FieldID     := 'AS_ID';
  fraAS_ID.FieldCodigo := 'AS_ID';
  fraAS_ID.FieldDesc   := 'AS_NOMBRE';
  fraAS_ID.FieldBaja   := 'AS_FECHABAJA';
end;

procedure TfrmAsesorEmision.DoCargarDatos(const CodigoContrato: Integer);
begin
  FCodigoContrato := CodigoContrato;
  if FCodigoContrato <> 0 then
    fraAS_ID.Value := ValorSql('SELECT NVL(CO_IDASESOREMISION, 0) FROM ACO_CONTRATO WHERE CO_CONTRATO = ' + SqlValue(CodigoContrato));
end;

procedure TfrmAsesorEmision.tlbLimpiarClick(Sender: TObject);
begin
  fraAS_ID.Value := 0;
end;

procedure TfrmAsesorEmision.tlbGuardarClick(Sender: TObject);
begin
  Verificar(fraAS_ID.IsEmpty, nil, 'Debe elegir un asesor.');

  with TSQL.Create('ACO_CONTRATO') do
    try
      PrimaryKey.Add('CO_CONTRATO',    FCodigoContrato, False);
      Fields.Add('CO_IDASESOREMISION', fraAS_ID.Value, True);
      SqlType := stUpdate;

      BeginTrans;
      try
        EjecutarSqlST(Sql);

        Do_ActualizarHistoricoContrato(FCodigoContrato, False);

        CommitTrans;
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
      except
        on E: Exception do
          begin
            RollBack;
            ErrorMsg(E, 'Error al guardar los datos.');
          end;
      end;
    finally
      Free;
    end;
end;

procedure TfrmAsesorEmision.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

end.

