unit unfraInfoEmpresaExt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unfraInfoEmpresa, StdCtrls, DB, SDEngine;

type
  TfraInfoEmpresaExt = class(TfraInfoEmpresa)
    lbl_12: TLabel;
    lblAdic_12: TLabel;
    Label98: TLabel;
    lblAdic_13: TLabel;
    sdqUsuariosWEB: TSDQuery;
    sdqLitigios: TSDQuery;
    procedure lblAdic_12Click(Sender: TObject);
    procedure lblAdic_13Click(Sender: TObject);
  protected
    procedure ClearControls; override;
  public
    procedure CargarContrato(const aContrato: Integer; const aCuit: String); override;
  end;

var
  fraInfoEmpresaExt: TfraInfoEmpresaExt;

implementation

uses
  CustomDlgs, Numeros, unConsultasAdicionales, AnsiSql, unDmPrincipal;

{$R *.dfm}

{ TfraInfoEmpresaExt }

procedure TfraInfoEmpresaExt.CargarContrato(const aContrato: Integer; const aCuit: String);
var
  sUsuariosWeb, sSQL: String;
begin
  inherited;
  sSql := 'SELECT COUNT (DISTINCT email) ' +
          '  FROM (SELECT uc_email AS email, cu_contrato as contrato ' +
          '          FROM web.wue_usuariosextranet, web.wuc_usuariosclientes, web.wcu_contratosxusuarios ' +
          '         WHERE uc_idusuarioextranet = ue_id ' +
          '           AND cu_idusuario = uc_id ' +
          '           AND ue_fechabaja IS NULL) ' +
          ' WHERE contrato = :contrato ';

  sUsuariosWeb := ValorSqlEx(sSql, [aContrato], 'Sin datos');
  CargarLabel(lblAdic_13, sUsuariosWeb, '0', '0');
  lblAdic_13.OnClick := lblAdic_13Click;
end;

procedure TfraInfoEmpresaExt.ClearControls;
begin
  inherited;
  lblAdic_12.Caption := 'Ver...';
  CargarLabel(lblAdic_13, 'Ver...', '');
end;

procedure TfraInfoEmpresaExt.lblAdic_12Click(Sender: TObject);
begin
  Verificar((FContrato < 1), nil, 'Debe elegir una empresa.');

  with TfrmConsultasAdicionales.Create(Self ) do
  try
    Caption := 'Juicios / Litigios';
    tbImprimirCarta.Visible := False;
    SetLength(NombreCampos, 25);
    NombreCampos[0]  := 'Carpeta';
    NombreCampos[1]  := 'Notificación juicio';
    NombreCampos[2]  := 'Estado';
    NombreCampos[3]  := 'Siniestro';
    NombreCampos[4]  := 'Orden';
    NombreCampos[5]  := 'Recaida';
    NombreCampos[6]  := 'Accidente';
    NombreCampos[7]  := 'Importe demandado';
    NombreCampos[8]  := 'Demandante';
    NombreCampos[9]  := 'Demandado';
    NombreCampos[10] := 'Jurisdicción';
    NombreCampos[11] := 'Reclamo';
//    NombreCampos[12] := 'Contrato';
    NombreCampos[12] := 'C.U.I.T.';
    NombreCampos[13] := 'Empresa';
    NombreCampos[14] := 'C.U.I.L.';
    NombreCampos[15] := 'Accidentado';
    NombreCampos[16] := 'Fecha fin juicio';
    NombreCampos[17] := 'Federal';
    NombreCampos[18] := 'Juzgado';
    NombreCampos[19] := 'Fuero';
    NombreCampos[20] := 'N° expediente';
    NombreCampos[21] := 'Año expediente';
    NombreCampos[22] := 'Abogado actor';
    NombreCampos[23] := 'Estudio asignado';
    NombreCampos[24] := 'Importe sentencia';

    //CAMPOBAJA        := 'JT_FECHABAJA';

    Maxcols := 1;
    SetLength(CamposSuma, Maxcols);
    SetLength(TotalConsulta, Maxcols);
    CamposSuma[0] := UpperCase(NombreCampos[7]);

    Sql := sdqLitigios.SQL.Text;
    MostrarConsulta([FContrato], CamposSuma);
  finally
    Free;
  end;
end;

procedure TfraInfoEmpresaExt.lblAdic_13Click(Sender: TObject);
begin
  Verificar((FContrato < 1), nil, 'Debe elegir una empresa.');

  with TfrmConsultasAdicionales.Create(Self ) do
  try
    Caption := 'Usuarios web';
    tbImprimirCarta.Visible := False;
    SetLength(NombreCampos, 8);
    NombreCampos[0]  := 'Nombre';
    NombreCampos[1]  := 'Correo electrónico';
    NombreCampos[2]  := 'Cargo';
    NombreCampos[3]  := 'Teléfono';
//    NombreCampos[4]  := 'Fecha de alta';
    NombreCampos[4]  := 'Estado';
    NombreCampos[5]  := 'Principal';
    NombreCampos[6]  := 'Adm. Holding';
    NombreCampos[7]  := 'Baja';
    CAMPOBAJA        := 'BAJA';

    Sql := sdqUsuariosWEB.SQL.Text;
    MostrarConsulta([FContrato]);
  finally
    Free;
  end;
end;

end.
