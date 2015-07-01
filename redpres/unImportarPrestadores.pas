{-----------------------------------------------------------------------------
 Unit Name: unImportarPrestadores
 Author:    RACastro
 Date:      10-Jul-2006
 Purpose:   Procesa padrón de prestadores asociados
 History:
-----------------------------------------------------------------------------}

unit unImportarPrestadores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Placemnt, StdCtrls, Mask, ToolEdit, ExtCtrls,
  unImpoExpoWizard, Db, SDEngine, Grids, DBGrids;

type
  TfrmImportarPrestadores = class(TForm)
    Label1: TLabel;
    edtRazonSocial: TEdit;
    FormStorage1: TFormStorage;
    btnGuardar: TButton;
    btnSalir: TButton;
    Panel1: TPanel;
    DataSource1: TDataSource;
    sdqPadron: TSDQuery;
    sdqRedundancia: TSDQuery;
    Memo: TMemo;
    Label2: TLabel;
    sdgGuardar: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
  private
    FCancelar: Boolean;
    FEspecialidad: String;
    FCUIT: String;
    FTipoPrestador: String;

    // Campos Importación
    FCalle    : String;
    FCodigo   : String;
    FCPostal  : String;
    FDpto     : String;
    FLocalidad: String;
    FNro      : String;
    FPcia     : String;
    FPiso     : String;
    FRsocial  : String;
    FTelefono : String;
  public
    function Execute(ARazonSocial, ACUIT, AEspecialidad, ATipoPrestador: String): Boolean;
  end;

var
  frmImportarPrestadores: TfrmImportarPrestadores;

implementation

uses
  unDmPrincipal, ANSISql, unSesion, CustomDlgs;

{$R *.DFM}

procedure TfrmImportarPrestadores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

{-----------------------------------------------------------------------------
  Procedure: Execute
  Author:    RACastro
  Date:      10-Jul-2006
  Arguments: ARazonSocial, ACUIT, AEspecialidad, ATipoPrestador: String
  Purpose:   Ejecuta ImpoExpo y actualiza la BD con los datos leídos
  Result:    Boolean
-----------------------------------------------------------------------------}

function TfrmImportarPrestadores.Execute(ARazonSocial, ACUIT, AEspecialidad, ATipoPrestador: String): Boolean;
var
  ssql: String;
  FCantPrest: Integer;
  FProxSeq: Integer;

  procedure Agregar;
  begin
    FProxSeq  := ValorSQLInteger('SELECT MAX (ca_secuencia)' +
                                  ' FROM art.cpr_prestador' +
                                 ' WHERE UPPER (ca_clave) = UPPER (' + SqlValue(FCUIT) + ')') + 1;

    ssql :=
      'INSERT INTO art.cpr_prestador (ca_identificador, ca_clave, ca_secuencia, ca_descripcion, ca_nombrefanta,' +
                                    ' ca_domicilio, ca_tipo, ca_especialidad, ca_calle, ca_numero, ca_pisocalle,' +
                                    ' ca_departamento, ca_codpostal, ca_localidad, ca_provincia, ca_telefono,' +
                                    ' ca_callelegal, ca_numerolegal, ca_pisolegal, ca_departamentolegal,' +
                                    ' ca_codpostallegal, ca_localidadlegal, ca_provincialegal, ca_bonificacion,' +
                                    ' ca_concertado, ca_contrato, ca_prestadormutual, ca_auditable, ca_visible,' +
                                    ' ca_cartillaweb, ca_fechalta, ca_usualta, ca_codfarmacia)' +
                            ' VALUES (art.seq_presta.NEXTVAL, ' +
                                      SqlValue(FCUIT) + ', ' +
                                      SqlNumber(FProxSeq) + ', ' +
                                      SqlValue(FRSOCIAL) + ', ' +
                                      SqlValue(FRSOCIAL) + ', ' +
                                      SqlValue(FCALLE + ' ' + FNRO + ' ' + FPISO + ' ' + FDPTO) + ', ' +
                                      SqlValue('P') + ', ' +
                                      SqlValue('015') + ', ' +
                                      SqlValue(FCALLE) + ', ' +
                                      SqlValue(FNRO) + ', ' +
                                      SqlValue(FPISO) + ', ' +
                                      SqlValue(FDPTO) + ', ' +
                                      SqlValue(FCPOSTAL) + ', ' +
                                      SqlValue(FLOCALIDAD) + ', ' +
                                      SqlValue(FPCIA) + ', ' +
                                      SqlValue(FTELEFONO) + ', ' +
                                      SqlValue(FCALLE) + ', ' +
                                      SqlValue(FNRO) + ', ' +
                                      SqlValue(FPISO) + ', ' +
                                      SqlValue(FDPTO) + ', ' +
                                      SqlValue(FCPOSTAL) + ', ' +
                                      SqlValue(FLOCALIDAD) + ', ' +
                                      SqlValue(FPCIA) + ', ' +
                                      '0, ''N'', ''N'', ''1'', ''N'', ''S'', ''S'', art.actualdate, ' +
                                      SqlValue(Sesion.UserId) + ', ' +
                                      SqlValue(FCodigo) + ')';

    EjecutarSql (ssql)
  end;

  procedure ActualizarPorCodigoExistente;
  begin
    ssql :=
      'UPDATE art.cpr_prestador' +
        ' SET ca_descripcion = '       + SqlValue(FRSOCIAL) +
           ', ca_calle = '             + SqlValue(FCALLE) +
           ', ca_numero = '            + SqlValue(FNRO) +
           ', ca_pisocalle = '         + SqlValue(FPISO) +
           ', ca_departamento = '      + SqlValue(FDPTO) +
           ', ca_codpostal = '         + SqlValue(FCPOSTAL) +
           ', ca_localidad = '         + SqlValue(FLOCALIDAD) +
           ', ca_provincia = '         + SqlValue(FPCIA) +
           ', ca_telefono = '          + SqlValue(FTELEFONO) +
           ', ca_callelegal = '        + SqlValue(FCALLE) +
           ', ca_numerolegal = '       + SqlValue(FNRO) +
           ', ca_pisolegal = '         + SqlValue(FPISO) +
           ', ca_departamentolegal = ' + SqlValue(FDPTO) +
           ', ca_codpostallegal = '    + SqlValue(FCPOSTAL) +
           ', ca_localidadlegal = '    + SqlValue(FLOCALIDAD) +
           ', ca_provincialegal = '    + SqlValue(FPCIA) +
      ' WHERE ca_codfarmacia = '       + SqlValue(FCodigo);

    EjecutarSql(ssql)
  end;

  procedure ActualizarPorCodigoNoExistente(CondExtra: String);
  begin
    ssql :=
      'UPDATE art.cpr_prestador' +
        ' SET ca_codfarmacia = '       + SqlValue(FCodigo) + 
           ', ca_descripcion = '       + SqlValue(FRSOCIAL) +
           ', ca_calle = '             + SqlValue(FCALLE) +
           ', ca_numero = '            + SqlValue(FNRO) +
           ', ca_pisocalle = '         + SqlValue(FPISO) +
           ', ca_departamento = '      + SqlValue(FDPTO) +
           ', ca_codpostal = '         + SqlValue(FCPOSTAL) +
           ', ca_localidad = '         + SqlValue(FLOCALIDAD) +
           ', ca_provincia = '         + SqlValue(FPCIA) +
           ', ca_telefono = '          + SqlValue(FTELEFONO) +
           ', ca_callelegal = '        + SqlValue(FCALLE) +
           ', ca_numerolegal = '       + SqlValue(FNRO) +
           ', ca_pisolegal = '         + SqlValue(FPISO) +
           ', ca_departamentolegal = ' + SqlValue(FDPTO) +
           ', ca_codpostallegal = '    + SqlValue(FCPOSTAL) +
           ', ca_localidadlegal = '    + SqlValue(FLOCALIDAD) +
           ', ca_provincialegal = '    + SqlValue(FPCIA) +
      ' WHERE ca_identificador = (SELECT pr.ca_identificador' +
                                  ' FROM art.cpr_prestador pr ' +
                                 ' WHERE UPPER(pr.ca_descripcion) = UPPER(' + SqlValue(FRSOCIAL) + ')' +
                                   ' AND UPPER(pr.ca_clave) = UPPER(' + SqlValue(FCUIT) + ')' +
                                         CondExtra +
                                   ' AND UPPER(pr.ca_codpostal) = UPPER(' + SqlValue(FCPOSTAL) + ')' +
                                   ' AND pr.ca_provincia = ' + SqlValue(FPCIA) + ')';

    EjecutarSql(ssql)
  end;

begin
  edtRazonSocial.Text := ARazonSocial;

  FCUIT          := ACUIT;
  FEspecialidad  := AEspecialidad;
  FTipoPrestador := ATipoPrestador;

  FCancelar := False;

  if ImpoExpoWizard('FARMA') then
  begin
    Memo.Lines.Clear;
    Memo.Lines.Add('Padrón para ' + edtRazonSocial.Text);
    Memo.Lines.Add('Redundancias en BD que no permiten identificar unívocamente al prestador');

    with sdqPadron do
    begin
      DisableControls;

      Close;
      ParamByName('usuario').Value := Sesion.UserId;
      Open;

      try
        try
          while (not Eof) and (not FCancelar) do
          begin
            Application.ProcessMessages;

            FCodigo    := Trim(FieldByName('PF_CODIGO').AsString);
            FRsocial   := Copy(Trim(FieldByName('PF_RSOCIAL').AsString), 1, 70);
            FCalle     := Copy(Trim(FieldByName('PF_CALLE').AsString), 1, 60);
            FNro       := Copy(Trim(FieldByName('PF_NRO').AsString), 1, 20);
            FPiso      := Copy(Trim(FieldByName('PF_PISO').AsString), 1, 20);
            FDpto      := Copy(Trim(FieldByName('PF_DPTO').AsString), 1, 20);
            FCPostal   := Copy(Trim(FieldByName('PF_CPOSTAL').AsString), 1, 5);
            FLocalidad := Copy(Trim(FieldByName('PF_LOCALIDAD').AsString), 1, 85);
            FPcia      := ValorSQL('SELECT pv_codigo' +
                                    ' FROM cpv_provincias' +
                                   ' WHERE pv_descripcion LIKE ' + SqlValue ('%' + FieldByName ('PF_PCIA').AsString + '%'));
            FTelefono  := Copy(Trim(FieldByName('PF_TELEFONO').AsString), 1, 50);

            ssql :=
              'SELECT 1' +
               ' FROM art.cpr_prestador' +
              ' WHERE UPPER (ca_codfarmacia) = UPPER (' + SqlValue(FCodigo) + ')';

            if ExisteSQL(ssql) then
              // Ya existe el prestador
              ActualizarPorCodigoExistente
            else
            begin
              // Me fijo qué cantidad de prestadores hay con el mismo nombre, CUIT, CP y Provincia
              FCantPrest := ValorSQLInteger('SELECT COUNT (*)' +
                                             ' FROM art.cpr_prestador' +
                                            ' WHERE UPPER (ca_descripcion) = UPPER (' + SqlValue(FRSOCIAL) + ')' +
                                              ' AND UPPER (ca_clave) = UPPER (' + SqlValue(FCUIT) + ')' +
                                              ' AND UPPER (ca_codpostal) = UPPER (' + SqlValue(FCPOSTAL) + ')' +
                                              ' AND ca_provincia = ' + SqlValue(FPCIA));
              case FCantPrest of
                // No hay ninguno, entonces lo agrego
                0:  Agregar;

                // Sólo hay uno, lo actualizo
                1:  ActualizarPorCodigoNoExistente('');
              else
                // Posibles Redundancias
                // Ahora me fijo si hay alguno en la calle y nro. y que no haya sido identificado antes
                FCantPrest := ValorSQLInteger('SELECT COUNT (*)' +
                                               ' FROM art.cpr_prestador' +
                                              ' WHERE UPPER(ca_descripcion) = UPPER(' + SqlValue (FRSOCIAL) + ')' +
                                                ' AND UPPER(ca_clave) = UPPER(' + SqlValue(FCUIT) + ')' +
                                                ' AND UPPER(ca_calle) = UPPER(' + SqlValue(FCALLE) + ')' +
                                                ' AND UPPER(ca_numero) = UPPER(' + SqlValue(FNRO) + ')' +
                                                ' AND UPPER(ca_codpostal) = UPPER(' + SqlValue(FCPOSTAL) + ')' +
                                                ' AND ca_codfarmacia IS NULL' +
                                                ' AND ca_provincia = ' + SqlValue(FPCIA));

                case FCantPrest of
                  // Sólo encontré uno, lo actualizo
                  1:  ActualizarPorCodigoNoExistente(' AND UPPER(ca_calle) = UPPER(' + SqlValue(FCALLE) + ')' +
                                                     ' AND UPPER(ca_numero) = UPPER(' + SqlValue(FNRO) + ')');
                else
                  // No encontré ninguno que pueda asociar unívocamente, reporto las redundancias
                  with sdqRedundancia do
                  begin
                    Memo.Lines.Add(' ');
                    Memo.Lines.Add('Código ' + FCodigo + ' - ' + FRSOCIAL + '; ' + FCALLE + ' ' + FNRO + '; ' +
                                    FCPOSTAL + '; ' + FPCIA);
                    SQL.Clear;
                    SQL.Add('SELECT ca_identificador, ca_descripcion, ca_calle, ca_numero, ca_codpostal, ca_localidad' +
                             ' FROM art.cpr_prestador' +
                            ' WHERE UPPER(ca_descripcion) = UPPER(' + SqlValue(FRSOCIAL) + ')' +
                              ' AND UPPER(ca_clave) = UPPER(' + SqlValue(FCUIT) + ')' +
                              ' AND ca_codfarmacia IS NULL' +
                              ' AND ca_provincia = ' + SqlValue(FPCIA));
                    Open;

                    while not Eof do
                    begin
                      Memo.Lines.Add(FieldByName('ca_identificador').AsString + '; ' +
                                     FieldByName('ca_descripcion').AsString + '; ' +
                                     FieldByName('ca_calle').AsString + ' ' +
                                     FieldByName('ca_numero').AsString + '; ' +
                                     FieldByName('ca_codpostal').AsString + '; ' +
                                     FieldByName('ca_localidad').AsString);
                      Next;
                    end;
                    Close;
                  end;
                end;
              end;
            end;

            Next;
          end;

          if FCancelar then
            MsgBox('Proceso cancelado.');
        except
          on E: Exception do
            ErrorMsg(E)
        end;
      finally
        EnableControls;
        Close;
      end
    end;

    Memo.Lines.Add(' ');
    Memo.Lines.Add('************** Fin de Redundancias **************');
  end;

  Result := ShowModal = mrOk;
end;

procedure TfrmImportarPrestadores.btnSalirClick(Sender: TObject);
begin
  Close
end;

procedure TfrmImportarPrestadores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    FCancelar := True;
    Key := #0
  end
end;

procedure TfrmImportarPrestadores.FormCreate(Sender: TObject);
begin
  KeyPreview := True
end;

{-----------------------------------------------------------------------------
  Procedure: btnGuardarClick
  Author:    RACastro
  Date:      10-Jul-2006
  Arguments: Sender: 8TObject
  Purpose:   Genera el archivo de redundancias para el padrón procesado
  Result:    None
-----------------------------------------------------------------------------}
procedure TfrmImportarPrestadores.btnGuardarClick(Sender: TObject);
begin
  sdgGuardar.FileName := 'REDUND_' + edtRazonSocial.Text + '.txt';
  if sdgGuardar.Execute then
    Memo.Lines.SaveToFile (sdgGuardar.FileName)
end;

end.
