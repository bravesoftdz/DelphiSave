unit unfraUsuDatos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, RxLookup, unfraPerfiles, unfraSectores,
  StdCtrls, Mask, ToolEdit, ArtComboBox, Db, SDEngine, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, ComCtrls,
  ToolWin, ImgList, unfraDelegacion;

type
  TfraUsuDatos = class(TFrame)
    sdqCargos: TSDQuery;
    dsCargos: TDataSource;
    Label9: TLabel;
    Label6: TLabel;
    fraSectores: TfraSectores;
    Label7: TLabel;
    fraPerfiles: TfraPerfiles;
    Label8: TLabel;
    cmbCargos: TRxDBLookupCombo;
    chkAccesoSeguridad: TCheckBox;
    edSE_MAIL: TEdit;
    Label1: TLabel;
    chkUsuarioGenerico: TCheckBox;
    Label2: TLabel;
    fraSector: TfraCodDesc;
    ToolBarSectores: TToolBar;
    tbArbolSectores: TToolButton;
    ImageListSectores: TImageList;
    Label3: TLabel;
    fraEquipo: TfraCodDesc;
    fraUsuarioJefe: TfraCodDesc;
    Label4: TLabel;
    fraRelacionLaboral: TfraCodDesc;
    Label5: TLabel;
    Label10: TLabel;
    fraNivelCobranzas: TfraCodDesc;
    fraDelegacion: TfraDelegacion;
    procedure cmbDelegacionesChange(Sender: TObject);
    procedure tbArbolSectoresClick(Sender: TObject);
    procedure AnalizoCambioSectorUsuGenerico(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    function GetCargoSql: String;
    procedure Limpiar(ADelegacion: String = '840');
  end;

implementation

uses
  unDmPrincipal, CustomDlgs, SqlOracle, unArbolSectores, VCLExtra,
  Strfuncs, General;

{$R *.DFM}

procedure TfraUsuDatos.cmbDelegacionesChange(Sender: TObject);
begin
//  fraSectores.Delegacion := cmbDelegaciones.FieldValue;
end;

procedure TfraUsuDatos.AnalizoCambioSectorUsuGenerico(Sender: TObject);
begin
  {
  if AreIn(fraSectores.Codigo, ['CALLCENT', 'BPAGOS', 'BAPRO', 'BANK', 'AUDGRUP']) or chkUsuarioGenerico.Checked then
  begin
    fraSector.Clear;
    VCLExtra.LockControls([fraSector, ToolBarSectores], True);
  end else
  begin
    VCLExtra.LockControls([fraSector, ToolBarSectores], False);
  end;
  }
end;

constructor TfraUsuDatos.Create(AOwner: TComponent);
begin
  inherited;
  try
    OpenQuery(sdqCargos);
    fraSectores.OnChange := AnalizoCambioSectorUsuGenerico;
  except
    on E: Exception do
      ErrorMsg(E);
  end;
end;

function TfraUsuDatos.GetCargoSql: String;
begin
  if cmbCargos.Value = cmbCargos.EmptyValue then
    Result := SQL_NULL
  else
    Result := SqlString(cmbCargos.Value, True);
end;

procedure TfraUsuDatos.Limpiar(ADelegacion: String = '840');
begin
  fraDelegacion.Codigo := ADelegacion;
  fraSectores.Limpiar;
  fraPerfiles.Limpiar;
  cmbCargos.Value := '';
  chkAccesoSeguridad.Checked := False;
  chkUsuarioGenerico.Checked := False;
  edSE_MAIL.Clear;
  fraSector.Clear;
  fraRelacionLaboral.Clear;
  fraNivelCobranzas.Clear;
  fraEquipo.Clear;
  fraUsuarioJefe.Clear;
end;

procedure TfraUsuDatos.tbArbolSectoresClick(Sender: TObject);
begin
  with TfrmArbolSectores.Create(Self) do
  try
    MostrarSector(StrToIntDef(fraSector.Id, 0));
    ShowModal;
  finally
    if sdqSectores.Active and (fraSector.Id <> sdqSectores.FieldByName('SE_ID').AsString) then
      fraSector.Codigo := sdqSectores.FieldByName('SE_ID').AsString;

    Free;
  end;
end;

end.
