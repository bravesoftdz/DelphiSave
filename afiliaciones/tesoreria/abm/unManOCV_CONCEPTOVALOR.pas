
{********************************************************}
{                                                        }
{    Contaduría, Mantenimiento de Conceptos de Valores   }
{                                                        }
{    Autor: Federico Firenze                             }
{    Análisis: Sebastián Gabrielli                       }
{    Fecha: 11/2003                                      }
{    Proyectos: Afiliaciones(Tesorería)                  }
{                                                        }
{********************************************************}

unit unManOCV_CONCEPTOVALOR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, Mask, PatternEdit;

type
  TfrmManOCV_CONCEPTOVALOR = class(TfrmCustomGridABM)
    Label3: TLabel;
    Label4: TLabel;
    edCV_DESCRIPCION: TEdit;
    edCV_CUENTACONTABLE: TPatternEdit;
    chkCV_IVA: TCheckBox;
    chkCV_TESORERIA: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmManOCV_CONCEPTOVALOR: TfrmManOCV_CONCEPTOVALOR;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, StrFuncs,
  unSesion, VCLExtra;

{$R *.DFM}

function TfrmManOCV_CONCEPTOVALOR.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if (ModoABM = maAlta) or (ModoABM = maModificacion) then
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.Add('CV_ID', 'SEQ_OCV_ID.NEXTVAL',   False);
              Fields.Add('CV_DESCRIPCION',                    edCV_DESCRIPCION.Text);
              Fields.Add('CV_IVA',                            chkCV_IVA.Checked);
              Fields.Add('CV_TESORERIA',                      chkCV_TESORERIA.Checked);
              Fields.Add('CV_USUALTA',                        Sesion.UserId);
              Fields.Add('CV_FECHAALTA',                      exDateTime);

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('CV_ID',                         sdqConsulta.FieldByName('CV_ID').AsInteger);
              Fields.Add('CV_USUMODIF',                       Sesion.UserId);
              Fields.Add('CV_FECHAMODIF',                     exDateTime);

              SqlType := stUpdate;
            end;

          Fields.Add('CV_CUENTACONTABLE',                     edCV_CUENTACONTABLE.Text);
        end
      else if ModoABM = maBaja Then
        begin
          SqlType := stUpdate;

          PrimaryKey.Add('CV_ID',                             sdqConsulta.FieldByName('CV_ID').AsInteger);
          Fields.Add('CV_USUBAJA',                            Sesion.UserId);
          Fields.Add('CV_FECHABAJA',                          exDateTime);
        end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmManOCV_CONCEPTOVALOR.ClearControls;
begin
  VCLExtra.LockControls([edCV_DESCRIPCION, chkCV_IVA, chkCV_TESORERIA], False);

  edCV_DESCRIPCION.Clear;
  edCV_CUENTACONTABLE.Clear;
  chkCV_IVA.Checked       := False;
  chkCV_TESORERIA.Checked := False;
end;

procedure TfrmManOCV_CONCEPTOVALOR.LoadControls;
begin
  VCLExtra.LockControls([edCV_DESCRIPCION, chkCV_IVA, chkCV_TESORERIA]);

  edCV_DESCRIPCION.Text    := sdqConsulta.FieldByName('CV_DESCRIPCION').AsString;
  edCV_CUENTACONTABLE.Text := sdqConsulta.FieldByName('CV_CUENTACONTABLE').AsString;
  chkCV_IVA.Checked        := (sdqConsulta.FieldByName('CV_IVA').AsString = 'S');
  chkCV_TESORERIA.Checked  := (sdqConsulta.FieldByName('CV_TESORERIA').AsString = 'S');
end;

function TfrmManOCV_CONCEPTOVALOR.Validar: Boolean;
begin
  Verificar(IsEmptyString(edCV_DESCRIPCION.Text), edCV_DESCRIPCION, 'La descripción es obligatoria.');

  Result := True;
end;

procedure TfrmManOCV_CONCEPTOVALOR.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'OCV_CONCEPTOVALOR';
  FieldBaja     := 'CV_FECHABAJA';
end;

end.


