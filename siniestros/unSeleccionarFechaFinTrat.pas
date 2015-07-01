unit unSeleccionarFechaFinTrat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, unDmPrincipal, CustomDlgs;

type
  TfrmSeleccionarFechaFinTrat = class(TForm)
    rbPAOdontologico: TRadioButton;
    rbPADermatologico: TRadioButton;
    rbPAPsicologico: TRadioButton;
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetFechaTrat(idExped:Integer; var bCancelar:boolean): TDateTime;
  end;

var
  frmSeleccionarFechaFinTrat: TfrmSeleccionarFechaFinTrat;

implementation

{$R *.dfm}

{ TfrmSeleccionarFechaFinTrat }

procedure TfrmSeleccionarFechaFinTrat.btnAceptarClick(Sender: TObject);
begin
  Verificar(not rbPAOdontologico.Checked and not rbPADermatologico.Checked and not rbPAPsicologico.Checked, nil, 'Debe seleccionar una Fecha.');

  ModalResult := mrOk;
end;

procedure TfrmSeleccionarFechaFinTrat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmSeleccionarFechaFinTrat.GetFechaTrat(idExped: Integer; var bCancelar: boolean): TDateTime;
var sSql, sSqlMaxFecha: string;
    dFecha, dMaxFecha: TDateTime;
    iMostrar: integer;
begin
  iMostrar  := 0;
  dFecha    := 0;
  Result    := 0;
  bCancelar := False;
  sSql := 'SELECT pe_altaodontdef, pe_altadermatdef, pe_altapsicoldef ' +
           ' FROM sin.spe_partedeegreso ' +
          ' WHERE pe_idexpediente = :idexp ';
  with GetQueryEx(sSQL, [idExped]) do
  try
    if not IsEmpty then
    begin
      if not FieldByName('PE_ALTAODONTDEF').IsNull then
      begin
        rbPAOdontologico.Visible := true;
        rbPAOdontologico.Caption := 'Post Alta Odontológico:  ' + DateToStr(FieldByName('PE_ALTAODONTDEF').AsDateTime);
        inc(iMostrar);
      end
      else
        rbPAOdontologico.Visible := false;

      if not FieldByName('PE_ALTADERMATDEF').IsNull then
      begin
        rbPADermatologico.Visible := true;
        rbPADermatologico.Caption := 'Post Alta Dermatológico: ' + DateToStr(FieldByName('PE_ALTADERMATDEF').AsDateTime);
        inc(iMostrar);
      end
      else
        rbPADermatologico.Visible := false;

      if not FieldByName('PE_ALTAPSICOLDEF').IsNull then
      begin
        rbPAPsicologico.Visible := true;
        rbPAPsicologico.Caption := 'Post Alta Psicológico:      ' + DateToStr(FieldByName('PE_ALTAPSICOLDEF').AsDateTime);
        inc(iMostrar);
      end
      else
        rbPAPsicologico.Visible := false;
    end;

    if (iMostrar > 1) then   // Esto es para chequear por default la fecha mas alta
    begin
      sSqlMaxFecha := ' SELECT Greatest(NVL(pe_altaodontdef, to_date(''01/01/1900'',''dd/mm/yyyy'')), ' +
                             ' Greatest(NVL(pe_altadermatdef, to_date(''01/01/1900'',''dd/mm/yyyy'')), ' +
                                      ' NVL(pe_altapsicoldef, to_date(''01/01/1900'',''dd/mm/yyyy'')) ) ) maxfecha ' +
                        ' FROM sin.spe_partedeegreso ' +
                       ' WHERE pe_idexpediente = :idexp ';
      dMaxFecha := ValorSqlDateTimeEx(sSqlMaxFecha, [idExped]);

      rbPAOdontologico.Checked  := (FieldByName('PE_ALTAODONTDEF').AsDateTime = dMaxFecha);
      rbPADermatologico.Checked := (FieldByName('PE_ALTADERMATDEF').AsDateTime = dMaxFecha);
      rbPAPsicologico.Checked   := (FieldByName('PE_ALTAPSICOLDEF').AsDateTime = dMaxFecha);
    end;

    if (iMostrar > 1)  then
    begin
      if (ShowModal = mrOk) then
      begin
        if rbPAOdontologico.Checked then
          dFecha := FieldByName('PE_ALTAODONTDEF').AsDateTime
        else if rbPADermatologico.Checked then
          dFecha := FieldByName('PE_ALTADERMATDEF').AsDateTime
        else if rbPAPsicologico.Checked then
          dFecha := FieldByName('PE_ALTAPSICOLDEF').AsDateTime;
        Result := dFecha;
      end
      else
        bCancelar := True;

    end
    else if (iMostrar = 1) then  // si hay una sola fecha, entonces no muestro la pantalla, directamente es esa la fecha fin de tratamiento a devolver.
    begin
      if not FieldByName('PE_ALTAODONTDEF').IsNull then
        dFecha := FieldByName('PE_ALTAODONTDEF').AsDateTime
      else if not FieldByName('PE_ALTADERMATDEF').isNull then
        dFecha := FieldByName('PE_ALTADERMATDEF').AsDateTime
      else if not FieldByName('PE_ALTAPSICOLDEF').IsNull then
        dFecha := FieldByName('PE_ALTAPSICOLDEF').AsDateTime;
      Result := dFecha;
    end
    else
      Result := 0;

  finally
      Free;
  end;

end;


end.
