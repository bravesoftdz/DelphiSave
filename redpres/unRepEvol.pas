unit unRepEvol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, SDEngine, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit,
  SinEdit, Placemnt, Registros, General, ShortCutControl;

type
  TfrmRepEvol = class(TForm)
    sdqEvolutivo: TSDQuery;
    dsEvolutivo: TDataSource;
    dsSiniestro: TDataSource;
    sdqSiniestro: TSDQuery;
    Label2: TLabel;
    Bevel1: TBevel;
    btnImprimir: TBitBtn;
    btnSalir: TBitBtn;
    SinEdit: TSinEdit;
    Label1: TLabel;
    Bevel2: TBevel;
    chkPartes: TCheckBox;
    chkAutorizac: TCheckBox;
    chkPrestDin: TCheckBox;
    chkPresteMed: TCheckBox;
    btnSiniMasDatos: TSpeedButton;
    chkAuditoria: TCheckBox;
    FormPlacement: TFormPlacement;
    sbtnBuscar: TSpeedButton;
    ShortCutControl: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalirClick(Sender: TObject);
    procedure SinEditSelect(Sender: TObject);
    procedure btnSiniMasDatosClick(Sender: TObject);
    procedure sbtnBuscarClick(Sender: TObject);
  private
  public
  end;

implementation

uses unDmPrincipal, unPrincipal, unDatosSiniestro, unBusqSini, CustomDlgs,
     unRptEvolucion, unMoldeEnvioMail, unArt;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRepEvol.FormCreate(Sender: TObject);
begin
   Width  := 362;
   Height := 230;
   chkPartes.Checked    := GetRegFromValue(Self, chkPartes.Caption,    REG_FALSE) = REG_TRUE;
   chkAutorizac.Checked := GetRegFromValue(Self, chkAutorizac.Caption, REG_FALSE) = REG_TRUE;
   chkAuditoria.Checked := GetRegFromValue(Self, chkAuditoria.Caption, REG_FALSE) = REG_TRUE;
   chkPrestDin.Checked  := GetRegFromValue(Self, chkPrestDin.Caption,  REG_FALSE) = REG_TRUE;
   chkPresteMed.Checked := GetRegFromValue(Self, chkPresteMed.Caption, REG_FALSE) = REG_TRUE;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRepEvol.btnImprimirClick(Sender: TObject);
var
  sCuerpo :String;
  vAdjuntos: TArrayOfAttach;
  lCuerpo: TStringList;
begin
   if (SinEdit.SiniestroSql = '0') or (SinEdit.OrdenSql = '0') then
      MsgBox('Debe completar Siniestro/Orden para emitir el listado',MB_ICONEXCLAMATION)
   else begin

      sCuerpo := 'Se adjuntan los siguientes formularios:' + CRLF;
      lCuerpo := TStringList.Create;
      with lCuerpo do
      begin
        Sorted     := True;
        Duplicates := dupIgnore;
      end;

      DoGenerarReporte(SinEdit.Siniestro, SinEdit.Orden, chkPartes.Checked,
                       chkAutorizac.Checked, chkAuditoria.Checked, chkPrestDin.Checked,
                       chkPresteMed.Checked, 'I', vAdjuntos, lCuerpo, true);

      {if msgbox('Desea enviar po mail?', MB_YESNO) = mrYes then
          DoGenerarReporte(SinEdit.Siniestro, SinEdit.Orden, chkPartes.Checked,
                       chkAutorizac.Checked, chkAuditoria.Checked, chkPrestDin.Checked,
                       chkPresteMed.Checked, 'M', vAdjuntos, lCuerpo, True);  }

//         qrlUsuario.Caption := frmPrincipal.DBLogin.Usuario ;
//         sSql := 'SELECT EV_SINIESTRO,EV_ORDEN,EV_DOCU,EV_RECAIDA,EV_NUMERO,EV_PRESTADOR,EV_ESTADO,EV_DIAGNOSTICO,EV_DETALLE, ' +
//                       ' EV_OBSERVACIONES,EV_PROXIMOCONTROL,EV_FECHAALTA,EV_IMPORTE,GP_NOMBRE ' +
//                 ' FROM  SEX_EXPEDIENTES,MGP_GTRABAJO,MEV_EVOLUCION ' +
//                 ' WHERE EX_SINIESTRO = EV_SINIESTRO ' +
//                   ' AND EX_ORDEN = EV_ORDEN ' +
//                   ' AND EX_RECAIDA = EV_RECAIDA ' +
//                   ' AND EX_GTRABAJO = GP_CODIGO ' +
//                   ' AND EV_SINIESTRO = ' + SinEdit.SiniestroSql +
//                   ' AND EV_ORDEN = ' + SinEdit.OrdenSql ;
//         if chkPartes.Checked or chkAutorizac.Checked or chkAuditoria.Checked or chkPrestDin.Checked or chkPresteMed.Checked Then Begin
//            sSql := sSql + ' AND EV_TIPO IN (';
//            if chkPartes.Checked    Then sSql := sSql + '''I'', ''E'', ''V'', ';
//            if chkAutorizac.Checked Then sSql := sSql + '''A'', ';
//            if chkAuditoria.Checked Then sSql := sSql + '''U'', ';
//            if chkPrestDin.Checked  Then sSql := sSql + '''L'', ';
//            if chkPresteMed.Checked Then sSql := sSql + '''O'', ''M'', ';
//            sSql := sSql + '''C'')';
//         end;
//         //----------------------------------------------------------------------
//         Try
//             OpenQuery(sdqEvolutivo, sSql );
//             //----------------------------------------------------------------------
//             with sdqSiniestro do
//             begin
//               Close;
//               ParamByName('nSiniestro').AsInteger := SinEdit.Siniestro;
//               ParamByName('nOrden').AsInteger     := SinEdit.Orden;
//               Open;
//             end;
//             //----------------------------------------------------------------------
//             QuickRep1.PreviewModal;
//         except
//             on E: Exception do ErrorMsg( E );
//         end;
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRepEvol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   frmPrincipal.mnuInformeEvol.Enabled := True;
   SetRegFromValue(Self, chkPartes.Caption, String(IIF(chkPartes.Checked, REG_TRUE, REG_FALSE)) );
   SetRegFromValue(Self, chkAutorizac.Caption, String(IIF(chkAutorizac.Checked, REG_TRUE, REG_FALSE)) );
   SetRegFromValue(Self, chkAuditoria.Caption, String(IIF(chkAuditoria.Checked, REG_TRUE, REG_FALSE)) );
   SetRegFromValue(Self, chkPrestDin.Caption, String(IIF(chkPrestDin.Checked, REG_TRUE, REG_FALSE)) );
   SetRegFromValue(Self, chkPresteMed.Caption, String(IIF(chkPresteMed.Checked, REG_TRUE, REG_FALSE)) );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRepEvol.btnSalirClick(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRepEvol.SinEditSelect(Sender: TObject);
var
  Sql : String;
begin
   Sql := 'SELECT 1 FROM sex_expedientes ' +
          ' WHERE ex_siniestro = ' + SinEdit.SiniestroSql +
            ' AND ex_orden = ' + SinEdit.OrdenSql;
   if not ExisteSql(Sql) then
   begin
      MsgBox('No existe el Siniestro '  + SinEdit.Text, MB_ICONEXCLAMATION );
      SinEdit.Clear;
      SinEdit.SetFocus;
      btnSiniMasDatos.Enabled := False;
   end else
      btnSiniMasDatos.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRepEvol.btnSiniMasDatosClick(Sender: TObject);
var
  frmDatosSiniestro: TfrmDatosSiniestro;
begin
  frmDatosSiniestro := TfrmDatosSiniestro.Create(Self);
  try
    frmDatosSiniestro.ShowDialog (SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
  finally
    frmDatosSiniestro.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRepEvol.sbtnBuscarClick(Sender: TObject);
var
  dlgBusqSini: TdlgBusqSini;
begin
  dlgBusqSini := TdlgBusqSini.Create(Self);
  try
     dlgBusqSini.Siniestro  := SinEdit.Siniestro;
     dlgBusqSini.Orden      := SinEdit.Orden;
     dlgBusqSini.Recaida    := SinEdit.Recaida;
     if dlgBusqSini.ShowModal = mrOk then
       SinEdit.SetValues(dlgBusqSini.Siniestro, dlgBusqSini.Orden, dlgBusqSini.Recaida);
     if SinEdit.Siniestro > 0 then
       SinEditSelect(Nil);
  finally
     dlgBusqSini.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
