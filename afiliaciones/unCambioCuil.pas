unit unCambioCuil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls;

type
  TfrmCambioCuil = class(TForm)
    btnCambioCuil: TButton;
    btnCancelar: TButton;
    procedure btnCambioCuilClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    bSuspenderCambioCuil: Boolean;
  public
  end;

var
  frmCambioCuil: TfrmCambioCuil;

implementation

uses
  unDmPrincipal, AnsiSql, unCompatibilidad, CustomDlgs, unAfiliaciones, unPrincipal;

{$R *.DFM}

procedure TfrmCambioCuil.btnCambioCuilClick(Sender: TObject);
var
  iContador: Integer;
  sCuilNuevo: String;
  sCuilViejo: String;
  sMensajeError: String;
  sOk: String;
  sSql: String;
begin
  bSuspenderCambioCuil := False;

  btnCambioCuil.Enabled := False;
  btnCancelar.Visible   := True;
  Refresh;

  sSql :=
    'SELECT   *' +
       ' FROM nel.xxx_cambiocuil' +
      ' WHERE xx_ok IS NULL' +
   ' ORDER BY xp_prioridad, xx_cuilviejo';

  with GetQuery(sSql) do
  try
    iContador := 0;

    while not Eof do
    begin
      Application.ProcessMessages;

      Inc(iContador);

      sCuilViejo := FieldByName('xx_cuilviejo').AsString;
      sCuilNuevo := FieldByName('xx_cuilnuevo').AsString;

      btnCambioCuil.Caption := 'Cambio CUIL - ' + IntToStr(iContador) + ' - ' + sCuilViejo + ' (' +
                                FieldByName('xp_prioridad').AsString + ')';

      if ExisteCuil(sCuilViejo) then
      begin
        if DoCambiarCuilBaseDatos(sCuilViejo, sCuilNuevo, sMensajeError) then
          sOk := 'S'
        else
        begin
          sOk := 'N';

          if sMensajeError <> '' then
            InvalidMsg(btnCambioCuil, sMensajeError);
        end;
      end
      else
        sOk := 'I';  // CUIL INEXISTENTE

      try
        sSql :=
          'UPDATE nel.xxx_cambiocuil' +
            ' SET xx_ok = :ok' +
          ' WHERE xx_cuilviejo = :cuilviejo';
//        EjecutarSqlEx(sSql, [Ok, sCuilViejo]);
      except
        on E: Exception do
          ErrorMsg(E, 'Error al guardar los datos.');
      end;

      if bSuspenderCambioCuil then
        Break;

      Next;
    end;
  finally
    Free;
  end;

  MsgBox('Proceso Finalizado.');
  btnCambioCuil.Enabled := True;
  btnCancelar.Visible   := False;
end;

procedure TfrmCambioCuil.btnCancelarClick(Sender: TObject);
begin
  bSuspenderCambioCuil := True;
end;

procedure TfrmCambioCuil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCambioCuil := nil;
  frmPrincipal.mnuCambiodeCUIL.Enabled := True;

  inherited;
end;

procedure TfrmCambioCuil.FormCreate(Sender: TObject);
begin
  inherited;

  frmPrincipal.mnuCambiodeCUIL.Enabled := False;
end;

end.
