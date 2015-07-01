unit unOpcionesDeImpresion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomForm, ComCtrls, StdCtrls, Mask, PatternEdit, IntEdit, ExtCtrls,
  ImgList, XPMenu, Placemnt;

type
  TfrmOpcionesDeImpresion = class(TfrmCustomForm)
    Bevel2: TBevel;
    Label8: TLabel;
    btnAceptarImpresion: TButton;
    btnCancelarImpresion: TButton;
    btnParar: TButton;
    cmbImpresoras: TComboBox;
    BarProgreso: TProgressBar;
    rgOpciones: TGroupBox;
    chkFirma: TCheckBox;
    edCantCopias: TIntEdit;
    Label7: TLabel;
    rgImpresion: TRadioGroup;
    rgDatos: TRadioGroup;
    rgIntimacion: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure OpcionesImpresion(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    PararImpresion: boolean;
    procedure CargarImpresoras;
  public
    tslListaCartas: TStringList;
  end;

implementation

uses
  unSesion, VCLExtra, Printers, unCobranzas, unDmPrincipal, unCustomDataModule, CustomDlgs;

{$R *.DFM}

procedure TfrmOpcionesDeImpresion.CargarImpresoras;
begin
  cmbImpresoras.Clear;
  cmbImpresoras.Items.Assign(Printer.Printers);
  cmbImpresoras.ItemIndex := Printer.PrinterIndex;
end;

procedure TfrmOpcionesDeImpresion.FormCreate(Sender: TObject);
begin
  inherited;
  BarProgreso.Position := 0;
  btnParar.Enabled := False;
  CargarImpresoras;
  tslListaCartas := TStringList.Create;
end;

procedure TfrmOpcionesDeImpresion.OpcionesImpresion(Sender: TObject);
begin
  VCLExtra.LockControls( [edCantCopias, cmbImpresoras], rgImpresion.ItemIndex = 0 );
end;

procedure TfrmOpcionesDeImpresion.btnAceptarImpresionClick(Sender: TObject);
var
  i: Integer;
  IdCarta: integer;
  OldImpresora: integer;
begin
  OldImpresora := Printer.PrinterIndex;
  Printer.PrinterIndex := cmbImpresoras.ItemIndex;
  try
    PararImpresion := False;
    btnParar.Enabled := True;
    for i := 0 to tslListaCartas.Count - 1 do
    begin
      if PararImpresion then
        InfoHint(btnParar, 'Ha decidido cancelar la impresión.', True);

      IdCarta := StrToInt(Trim(tslListaCartas.Strings[i]));

      MostrarCartaDocumentoCob(IdCarta, tmBeginEnd, rgImpresion.ItemIndex = 1,
                               edCantCopias.Value, rgDatos.ItemIndex = 1,
                               (rgIntimacion.ItemIndex = 1) or (rgIntimacion.ItemIndex = 2),
                               (rgIntimacion.ItemIndex = 0) or (rgIntimacion.ItemIndex = 2),
                               chkFirma.Checked);
      BarProgreso.Position := Round((i+1)/tslListaCartas.Count*100);
      Application.ProcessMessages;
    end;
    ModalResult := mrOk;
  finally
    Printer.PrinterIndex := OldImpresora;
    btnParar.Enabled := False;
  end;
end;

procedure TfrmOpcionesDeImpresion.btnPararClick(Sender: TObject);
begin
  PararImpresion   := True;
  btnParar.Enabled := False;
end;

procedure TfrmOpcionesDeImpresion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  tslListaCartas.Free;
end;

end.
