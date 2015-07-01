unit unSeleccionTurnosTraslados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomForm, StdCtrls, CheckLst, ARTCheckListBox, ImgList, XPMenu,
  Placemnt, Menus;

type
  TfrmSeleccionTurnosTraslados = class(TfrmCustomForm)
    ARTCheckListBox: TARTCheckListBox;
    lbSeleccion: TLabel;
    btnAceptar: TButton;
    pmuSeleccion: TPopupMenu;
    Marcartodos1: TMenuItem;
    Desmarcartodos1: TMenuItem;
    gbTurnos: TGroupBox;
    rbActivos: TRadioButton;
    rbAnulados: TRadioButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Marcartodos1Click(Sender: TObject);
    procedure Desmarcartodos1Click(Sender: TObject);
    procedure rbActivosClick(Sender: TObject);
    procedure rbAnuladosClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    sqlBase :String;
    procedure DoRefrescarList;
  public
    procedure SetDatos(iSini, iOrden, iReca, iNumAuto: Integer; anulada: boolean = false);
  end;

var
  frmSeleccionTurnosTraslados: TfrmSeleccionTurnosTraslados;

implementation

uses General, AnsiSql, CustomDlgs;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmSeleccionTurnosTraslados.FormCreate(Sender: TObject);
begin
  inherited;
  ARTCheckListBox.AutoAjustarColumnas := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeleccionTurnosTraslados.Marcartodos1Click(Sender: TObject);
begin
  ARTCheckListBox.CheckAll;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeleccionTurnosTraslados.Desmarcartodos1Click(Sender: TObject);
begin
  ARTCheckListBox.UncheckAll;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeleccionTurnosTraslados.rbActivosClick(Sender: TObject);
begin
  DoRefrescarList;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeleccionTurnosTraslados.SetDatos(iSini, iOrden, iReca, iNumAuto: Integer; anulada: boolean = false);
begin
  sqlBase := 'SELECT to_char(tr_fecha) || '' '' || tr_hora, tr_numtraslado ' +
              ' FROM str_traslados ' +
             ' WHERE tr_siniestro = ' + SqlInt(iSini) +
               ' AND tr_orden = ' + SqlInt(iOrden) +
               ' AND tr_recaida = ' + SqlInt(iReca) +
               ' AND tr_numauto = ' + SqlInt(iNumAuto) +
               ' AND tr_fechabaja IS NULL ';
  DoRefrescarList;
  if anulada = true then
  begin
    rbActivos.Enabled := false;
    rbAnulados.Checked := true;
  end
  else
    rbActivos.Enabled := true;
    
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeleccionTurnosTraslados.DoRefrescarList;
begin
  ARTCheckListBox.SQL := sqlBase +
                        IIF(rbActivos.Checked, ' AND tr_fechaanulacion IS NULL ',
                                               ' AND tr_fechaanulacion IS NOT NULL ');
  ARTCheckListBox.CheckAll;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeleccionTurnosTraslados.rbAnuladosClick(Sender: TObject);
begin
  DoRefrescarList;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeleccionTurnosTraslados.btnAceptarClick(Sender: TObject);
begin
  Verificar((ARTCheckListBox.CheckCount = 0), ARTCheckListBox,
            'Debe seleccionar al menos un turno');
   ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
end.
