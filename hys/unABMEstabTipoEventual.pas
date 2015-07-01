unit unABMEstabTipoEventual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmABMEstabTipoEventual = class(TfrmCustomGridABM)
    chkAsignable: TCheckBox;
    Label1: TLabel;
    edDescrip: TEdit;
    edCodigo: TEdit;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure FSFormKeyPress(Sender: TObject; var Key: Char);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  end;

var
  frmABMEstabTipoEventual: TfrmABMEstabTipoEventual;

implementation

uses unCustomConsulta, VCLExtra, undmPrincipal, General, DateTimeFuncs, unSesion,
  CustomDlgs;

{$R *.dfm}

procedure TfrmABMEstabTipoEventual.btnAceptarClick(Sender: TObject);
begin
  if DoABM then
  begin
    fpAbm.ModalResult := mrOk;
  end;
end;

procedure TfrmABMEstabTipoEventual.btnCancelarClick(Sender: TObject);
begin
  fpAbm.ModalResult := mrCancel;
end;

procedure TfrmABMEstabTipoEventual.ClearControls;
begin
//  inherited;
end;

function TfrmABMEstabTipoEventual.DoABM: Boolean;
var
  FechaABM: TDate;
  UsuarioABM: string;
begin
  FechaABM := Date;
  UsuarioABM := Sesion.UserID;
  try
    case ModoABM of
      maAlta: EjecutarSqlEx('INSERT INTO HYS.PEV_ESTABEVENTUAL '
                           +'(EV_ID,'
                           +' EV_DESCRIPCION, '
                           +' EV_ASIGNABLE,   '
                           +' EV_FECHAALTA,   '
                           +' EV_USUALTA)     '
                           +'VALUES(:id, :descrip, :asignable, :fechaalta, :usualta)',
                             [0,
                              edDescrip.Text,
                              IIF(chkAsignable.Checked, 'S', 'N'),
                              TDateTimeEx.Create(FechaABM),
                              UsuarioABM
                             ]
               ) ;
      maModificacion: EjecutarSqlEx(
                          'UPDATE HYS.PEV_ESTABEVENTUAL    '
                         +'   SET EV_DESCRIPCION = :decrip, '
                         +'       EV_ASIGNABLE  = :asig,    '
                         +'       EV_FECHAMODIF = :fecha,   '
                         +'       EV_USUMODIF   = :usuario  '
                         +'WHERE EV_ID = :id',
                          [ edDescrip.Text,
                            IIF(chkAsignable.Checked, 'S', 'N'),
                            TDateTimeEx.Create(FechaABM),
                            UsuarioABM,
                            sdqConsulta.FieldByName('EV_ID').AsInteger
                          ]
              );
    end;
    Result := True;
    tbRefrescar.Click;
  except
    on E: Exception do
      Raise Exception.Create('Error en el ABM de Tipo Establecimiento Eventual.' + chr(13) +
          E.Message
      );
  end;
end;

procedure TfrmABMEstabTipoEventual.fpAbmBeforeShow(Sender: TObject);
begin
  VCLExtra.LockControl(edCodigo);

  case ModoABM of
    maAlta: begin
            edCodigo.Text := '';
            edDescrip.Text := '';
            chkAsignable.Checked := False;
            VCLExtra.LockControl(edDescrip, False);
            chkAsignable.Enabled := True;
            end;
    maModificacion:
            begin
            edCodigo.Text := sdqConsulta.FieldByName('EV_ID').AsString;
            edDescrip.Text := sdqConsulta.FieldByName('EV_DESCRIPCION').AsString;
            chkAsignable.Checked :=
                IIF(sdqConsulta.FieldByName('EV_ASIGNABLE').AsString = 'S', True, False);
            VCLExtra.LockControl(edDescrip, False);
            chkAsignable.Enabled := True;
            end;
    maNone: begin {no se permite la modificación del registro base}
            edDescrip.Text := sdqConsulta.FieldByName('EV_DESCRIPCION').AsString;
            VCLExtra.LockControl(edDescrip);
            chkAsignable.Enabled := False;
            chkAsignable.Checked := True;
            VCLExtra.LockControl(edDescrip);
            end;
    end;
end;

procedure TfrmABMEstabTipoEventual.FSFormKeyPress(Sender: TObject; var Key:
    Char);
begin
  if Key = #27 then
    ModalResult := mrOk;
end;

procedure TfrmABMEstabTipoEventual.GridGetCellParams(Sender: TObject; Field:
    TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqConsulta.FieldByName('EV_FECHABAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmABMEstabTipoEventual.LoadControls;
begin
  //inherited;
end;

procedure TfrmABMEstabTipoEventual.tbEliminarClick(Sender: TObject);
begin
  if MessageBox(0, PCHAR('Confirme la baja el registro: ' + chr(13) +
        sdqConsulta.FieldByName('EV_ID').AsString + ' ' +
        sdqConsulta.FieldByName('EV_DESCRIPCION').AsString),
        'Atención',
        MB_ICONEXCLAMATION or MB_YESNO) = IDYES then
  begin
    try
      EjecutarSqlEx(
                    'UPDATE HYS.PEV_ESTABEVENTUAL   '
                   +'   SET EV_FECHABAJA = :fecha,  '
                   +'       EV_USUBAJA   = :usuario '
                   +'WHERE EV_ID = :id',
                    [ TDateTimeEx.Create(Date),
                      Sesion.UserID,
                      sdqConsulta.FieldByName('EV_ID').AsInteger
                    ]
      );
      tbRefrescarClick(Sender);
    except
      on E: Exception do
        Raise Exception.Create('Error al intentar la baja del registro.' + chr(13) +
            E.Message
        );
    end;
  end;
end;

procedure TfrmABMEstabTipoEventual.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('EV_REGISTROBASE').AsInteger = 1 then
    ModoABM := maNone
  else
    ModoABM := maModificacion;

  edCodigo.Text := sdqConsulta.FieldByName('EV_ID').AsString; {el id es el código}
  fpAbm.ShowModal;
end;

procedure TfrmABMEstabTipoEventual.tbNuevoClick(Sender: TObject);
begin
  ModoABM := maAlta;
  fpAbm.ShowModal;
end;

procedure TfrmABMEstabTipoEventual.tbRefrescarClick(Sender: TObject);
var
  bkm: TBookmark;
begin
  bkm := sdqConsulta.GetBookmark;
  inherited;
  sdqConsulta.GotoBookmark(bkm);
end;

function TfrmABMEstabTipoEventual.Validar: Boolean;
begin
  Verificar(edDescrip.Text = '', edDescrip, 'Se debe ingresar una descripción.');
  Result := True;
end;

end.
