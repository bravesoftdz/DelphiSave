unit unLiqNotaDebito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, RXDBCtrl, Db, SDEngine, CustomDlgs, RxMemDS, General, AnsiSql;

type
  TfrmLiqNotaDebito = class(TForm)
    GroupBox1: TGroupBox;
    dbgLista: TRxDBGrid;
    btnCancelar: TButton;
    btnAceptar: TButton;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    mdDatos: TRxMemoryData;
    sdqConsultaDV_TIPO: TStringField;
    sdqConsultaDV_VOLANTE: TFloatField;
    sdqConsultaDV_SINIESTRO: TFloatField;
    sdqConsultaDV_ORDEN: TFloatField;
    sdqConsultaDV_RECAIDA: TFloatField;
    sdqConsultaDV_SINICOMPLE: TStringField;
    sdqConsultaDV_NUMPAGO: TFloatField;
    sdqConsultaDV_FECPRESTA: TDateTimeField;
    sdqConsultaDV_PRESDET: TStringField;
    sdqConsultaDV_CANTIDAD: TFloatField;
    sdqConsultaDV_CANTAPRO: TFloatField;
    sdqConsultaDV_IMPFACTURADO: TFloatField;
    sdqConsultaDV_PAGOCONRET: TFloatField;
    sdqConsultaMOTIVO: TStringField;
    sdqConsultaDV_IVESTADO: TFloatField;
    sdqConsultaDV_NUMVOLANTE: TFloatField;
    sdqConsultaDV_MOTIVODEBITO: TStringField;
    sdqConsultaDV_CONPAGO: TFloatField;
    sdqConsultaDV_DESCRCONCEPTO: TStringField;
    sdqConsultaDV_FECDESDE: TDateTimeField;
    sdqConsultaDV_FECHASTA: TDateTimeField;
    sdqConsultaDV_ESTADO: TStringField;
    sdqConsultaDV_PRES_NOMENCLADOR: TStringField;
    sdqConsultaDV_PRES_CAPITULO: TStringField;
    sdqConsultaDV_PRES_CODIGO: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgListaDblClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    FVolante : integer;
    procedure Refrescar(ShwMsg : Boolean);
  public
    procedure Mostrar(pVolante : Integer);
  end;

var
  frmLiqNotaDebito: TfrmLiqNotaDebito;

implementation

uses unDmPrincipal, unPrincipal, unSesion;

{$R *.DFM}
{-------------------------------------------------------------------------------}
procedure TfrmLiqNotaDebito.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 116) and (Shift = []) then Refrescar(True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqNotaDebito.Mostrar(pVolante: Integer);
begin
  FVolante := pVolante;
  Refrescar(False);
  if not sdqConsulta.Eof then
  begin
    mdDatos.First;
    ShowModal;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqNotaDebito.dbgListaDblClick(Sender: TObject);
var
  slMotivo : TStringList;
begin
  slMotivo := TStringList.Create;
  try
    slMotivo.Text := mdDatos.FieldByName('dv_motivo').AsString;
    if InputMemoBox('Motivo', slMotivo, False, 850) then
    begin
       mdDatos.Edit;
       mdDatos.FieldByName('dv_motivo').AsString   := slMotivo.Text;
       mdDatos.FieldByName('modificado').AsBoolean := True;
       mdDatos.Post;
    end;
  finally
    slMotivo.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqNotaDebito.Refrescar(ShwMsg: Boolean);
begin
  if ShwMsg then
     if MsgBox('Al refrescar la lista se perderán los cambios.' + #13 + '¿Desea Continuar?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDNO then
        Exit;
  sdqConsulta.Close;
  sdqConsulta.ParamByName('pVolante').AsInteger := FVolante;
  sdqConsulta.Open;
  //----------------------------------------------------------------------------//
  mdDatos.Active := True;
  mdDatos.EmptyTable;
  if Not sdqConsulta.Eof then
  begin
     Repeat
       mdDatos.Insert;
       //-----------------------------------------------------------------------//
       mdDatos.FieldByName('dv_tipo').AsString              := sdqConsultaDV_TIPO.AsString;
       mdDatos.FieldByName('dv_sinicomple').AsString        := sdqConsultaDV_SINICOMPLE.AsString;
       mdDatos.FieldByName('dv_siniestro').AsString         := sdqConsultaDV_SINIESTRO.AsString;
       mdDatos.FieldByName('dv_orden').AsString             := sdqConsultaDV_ORDEN.AsString;
       mdDatos.FieldByName('dv_recaida').AsString           := sdqConsultaDV_RECAIDA.AsString;
       mdDatos.FieldByName('dv_numpago').AsString           := sdqConsultaDV_NUMPAGO.AsString;
       mdDatos.FieldByName('dv_fecpresta').AsString         := sdqConsultaDV_FECPRESTA.AsString;
       mdDatos.FieldByName('dv_fecdesde').AsString          := sdqConsultaDV_FECDESDE.AsString;
       mdDatos.FieldByName('dv_fechasta').AsString          := sdqConsultaDV_FECHASTA.AsString;
       mdDatos.FieldByName('dv_presdet').AsString           := sdqConsultaDV_PRESDET.AsString;
       mdDatos.FieldByName('dv_cantidad').AsString          := sdqConsultaDV_CANTIDAD.AsString;
       mdDatos.FieldByName('dv_impfacturado').AsFloat       := sdqConsultaDV_IMPFACTURADO.AsFloat;
       mdDatos.FieldByName('dv_pagconret').AsFloat          := sdqConsultaDV_PAGOCONRET.AsFloat;
       mdDatos.FieldByName('dv_motivo').AsString            := sdqConsultaMOTIVO.AsString;
       mdDatos.FieldByName('dv_ivestado').AsString          := sdqConsultaDV_IVESTADO.AsString;
       mdDatos.FieldByName('modificado').AsBoolean          := (sdqConsultaMOTIVO.AsString <> '');
       mdDatos.FieldByName('dv_conpago').AsString           := sdqConsultaDV_CONPAGO.AsString;
       mdDatos.FieldByName('dv_numvolante').AsInteger       := sdqConsultaDV_NUMVOLANTE.AsInteger;
       mdDatos.FieldByName('dv_motivodebito').AsString      := sdqConsultaDV_MOTIVODEBITO.AsString;
       mdDatos.FieldByName('dv_estado').AsString            := sdqConsultaDV_ESTADO.AsString;
       mdDatos.FieldByName('dv_pres_nomenclador').AsString  := sdqConsultaDV_PRES_NOMENCLADOR.AsString;
       mdDatos.FieldByName('dv_pres_capitulo').AsString     := sdqConsultaDV_PRES_CAPITULO.AsString;
       mdDatos.FieldByName('dv_pres_codigo').AsString       := sdqConsultaDV_PRES_CODIGO.AsString;     // TK 6748 Lo encontreeeeeeeee aca estaba pasando mal el Codigo
       //-----------------------------------------------------------------------//
       sdqConsulta.Next;
     until sdqConsulta.Eof;
     sdqConsulta.First;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqNotaDebito.btnAceptarClick(Sender: TObject);
var
  Sql, sNumVolante, sNumPago, sTmp :String;
begin
   btnAceptar.Enabled := False;
   mdDatos.First;
   with mdDatos do
   Repeat
     if (FieldByName('dv_tipo').AsString = 'SIN') then //si es por siniestro...
     begin
       sTmp := FieldByName('dv_ivestado').AsString;
       if sTmp = '0' then sTmp := '';
       //-----------------------------------------------------------------------//
       Sql := 'UPDATE siv_itemvolante ' +
                ' SET iv_estado = ''A' + sTmp + ''' ' +
              ' WHERE iv_siniestro = ' + FieldByName('dv_siniestro').AsString +
                ' AND iv_orden = ' + FieldByName('dv_orden').AsString +
                ' AND iv_recaida = ' + FieldByName('dv_recaida').AsString +
                ' AND iv_numpago = ' + FieldByName('dv_numpago').AsString;
       EjecutarSqlST(Sql);
       //-----------------------------------------------------------------------//
       Sql := 'SELECT MAX(iv_numpago) + 1  ' +
               ' FROM siv_itemvolante ' +
              ' WHERE iv_siniestro = ' + FieldByName('dv_siniestro').AsString +
                ' AND iv_orden = ' + FieldByName('dv_orden').AsString +
                ' AND iv_recaida = ' + FieldByName('dv_recaida').AsString;
       sNumPago := ValorSql(Sql);
       //-----------------------------------------------------------------------//
       Sql := 'SELECT MAX(iv_numvolante) + 1 ' +
               ' FROM siv_itemvolante ' +
              ' WHERE iv_volante = ' + sdqConsulta.ParamByName('pVolante').AsString;
       sNumVolante := ValorSql(Sql);
       //-----------------------------------------------------------------------//
       Sql := 'INSERT INTO siv_itemvolante ' +
             '(iv_volante, iv_siniestro, iv_orden, iv_recaida, iv_numpago, iv_numvolante, ' +
             ' iv_cantidad, iv_impfacturado, iv_impconvenido, iv_autorizacion, ' +
             ' iv_numauto, iv_imppagconret, iv_motivo, iv_estado, iv_usualta, ' +
             ' iv_fecalta, iv_conpago, iv_numdebito, iv_motivodebito, ' +
             ' iv_pres_codigo, iv_pres_nomenclador, iv_pres_capitulo, iv_fecpresta) VALUES (' +       // TK 6748 agregue iv_pres_codigo, iv_pres_nomenclador, iv_pres_capitulo
             sdqConsulta.ParamByName('pVolante').AsString + ', ' +
             FieldByName('dv_siniestro').AsString + ', ' +
             FieldByName('dv_orden').AsString + ', ' +
             FieldByName('dv_recaida').AsString + ', ' +
             sNumPago + ', ' + sNumVolante + ', ' +
             IntToStr(FieldByName('dv_cantidad').AsInteger - FieldByName('dv_cantapro').AsInteger) + ', ' +
             SqlNumber(ABS(FieldByName('dv_impfacturado').AsFloat - FieldByName('dv_pagconret').AsFloat) * (-1)) + ', ' +
             'NULL, NULL, NULL, NULL, ' +
             SqlString( IIF(FieldByName('modificado').AsBoolean, FieldByName('dv_motivo').AsString, ''), True) + ', ' +
             SQL_QUOTE + IIF(FieldByName('modificado').AsBoolean, 'CM', 'C6') + SQL_QUOTE + ', ' +
             SqlValue(Sesion.UserId) + ', ActualDate, ' +
             FieldByName('dv_conpago').AsString + ', ' +  SqlInt(FieldByName('dv_numvolante').AsInteger, True) + ', ' +
             SqlValue(FieldByName('dv_motivodebito').AsString) + ', ' +
             SqlValue(FieldByName('dv_pres_codigo').AsString) + ', ' +
             SqlValue(FieldByName('dv_pres_nomenclador').AsString) + ', ' +
             SqlValue(FieldByName('dv_pres_capitulo').AsString) + ', ' +
             SqlDate(FieldByName('dv_fecpresta').AsDateTime) + ')';
       EjecutarSqlST(Sql);

       //-----------------------------------------------------------------------//
     end
     else begin  //si es generico..
       //---[ Actualiza el VG_ESTADO ]------------------------------------------//
       if (FieldByName('dv_estado').AsString = 'P') then
       begin
         Sql := 'UPDATE svg_vol_generico ' +
                  ' SET vg_estado = ''AP' + sTmp + ''' ' +
                ' WHERE vg_volante = ' + sdqConsulta.ParamByName('pVolante').AsString +
                  ' AND vg_numpago = ' + FieldByName('dv_numpago').AsString;
         EjecutarSqlST(Sql);
       end;
       //-----------------------------------------------------------------------//
       Sql := 'SELECT art.amebpba.get_svg_maxnumpago(' + sdqConsulta.ParamByName('pVolante').AsString + ' )  + 1 ' +
               ' FROM dual ';
       sTmp := ValorSql(Sql);
       //-----------------------------------------------------------------------//
       Sql := 'INSERT INTO svg_vol_generico ' +
              '(vg_volante, vg_numpago, vg_conpago, vg_prestadesde, vg_prestahasta, vg_pres_nomenclador, ' +
              ' vg_pres_capitulo, vg_pres_codigo, vg_presdet, vg_cantidad, vg_impfacturado, vg_motivo, ' +
              ' vg_estado, vg_usualta, vg_fecalta ) VALUES ( ' +
                sdqConsulta.ParamByName('pVolante').AsString + ', ' + sTmp + ', ' +
                FieldByName('dv_conpago').AsString + ', ' +
                SqlDate(FieldByName('dv_fecdesde').AsDateTime) + ', ' +
                SqlDate(FieldByName('dv_fechasta').AsDateTime) + ', ' +
                SqlValue(FieldByName('dv_pres_nomenclador').AsString) + ', ' +
                SqlValue(FieldByName('dv_pres_capitulo').AsString) + ',' +
                SqlValue(FieldByName('dv_pres_codigo').AsString) + ',' +
                SqlValue(FieldByName('dv_presdet').AsString) + ',' +
                SqlNumber(FieldByName('dv_cantidad').AsFloat - FieldByName('dv_cantapro').AsFloat) + ', ' +
                SqlNumber(Abs(FieldByName('dv_impfacturado').AsFloat - FieldByName('dv_pagconret').AsFloat) * (-1)) + ', ' +
                SqlString( IIF(FieldByName('modificado').AsBoolean, FieldByName('dv_motivo').AsString, ''), True) + ', ' +
                SQL_QUOTE + IIF(FieldByName('modificado').AsBoolean, 'CM', 'C6') + SQL_QUOTE + ',' +
                SqlValue(Sesion.UserID) + ', ActualDate )' ;

       EjecutarSqlST(Sql);
      //------------------------------------------------------------------------//
     end;
     Next;
   until Eof;
   ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
end.
