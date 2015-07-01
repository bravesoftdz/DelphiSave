unit unLiqAMPNotaDebito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, RXDBCtrl, Db, SDEngine, CustomDlgs, RxMemDS, General, AnsiSql;

type
  TfrmLiqAMPNotaDebito = class(TForm)
    GroupBox1: TGroupBox;
    dbgLista: TRxDBGrid;
    btnCancelar: TButton;
    btnAceptar: TButton;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    mdDatos: TRxMemoryData;
    mdDatosif_fecha: TDateTimeField;
    mdDatosconcepto: TStringField;
    mdDatosfacturados: TIntegerField;
    mdDatosaprobados: TIntegerField;
    mdDatosa_pagar: TFloatField;
    mdDatostotal_facturado: TFloatField;
    mdDatosmotivo: TStringField;
    mdDatosif_idvolante: TIntegerField;
    mdDatosif_motivodebito: TStringField;
    mdDatosmodificado: TBooleanField;
    mdDatosestado: TIntegerField;
    mdDatosif_id: TIntegerField;
    mdDatosconpago: TIntegerField;
    mdDatosvaloraprobado: TFloatField;
    mdDatosif_idlote: TIntegerField;
    mdDatosif_idempresa: TIntegerField;
    mdDatosif_idestudio: TStringField;
    mdDatosif_idestableci: TIntegerField;
    mdDatosvalorfacturado: TFloatField;
    mdDatosif_seqvolante: TIntegerField;
    mdDatosif_seqpago: TIntegerField;
    mdDatosvg_pres_nomenclador: TStringField;
    mdDatosvg_pres_capitulo: TStringField;
    mdDatosvg_pres_codigo: TStringField;
    mdDatosvg_prestadesde: TDateField;
    mdDatosvg_prestahasta: TDateField;
    mdDatosvg_presdet: TStringField;
    mdDatostipo: TStringField;
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
  frmLiqAMPNotaDebito: TfrmLiqAMPNotaDebito;

implementation

uses unDmPrincipal, unPrincipal, unSesion;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPNotaDebito.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 116) and (Shift = []) Then
    Refrescar( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPNotaDebito.Mostrar(pVolante: Integer);
begin
  FVolante := pVolante;
  Refrescar( False );

  if not sdqConsulta.Eof Then begin
    mdDatos.First;
    ShowModal;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPNotaDebito.dbgListaDblClick(Sender: TObject);
Var slMotivo : TStringList;
begin
  slMotivo := TStringList.Create;
  try
    slMotivo.Text := mdDatos.FieldByName('motivo').AsString;
    if InputMemoBox('Motivo', slMotivo) Then begin
       mdDatos.Edit ;
       mdDatos.FieldByName('motivo').AsString      := Trim(slMotivo.Text);
       mdDatos.FieldByName('modificado').AsBoolean := True ;
       mdDatos.Post ;
    end;
  finally
    slMotivo.Free ;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPNotaDebito.Refrescar(ShwMsg: Boolean);
begin
  if ShwMsg and
     (MsgBox('Al refrescar la lista se perderán los cambios.' + #13 +
             '¿Desea Continuar?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDNO) then
    Exit;

  sdqConsulta.Close;
  sdqConsulta.ParamByName( 'pVolante' ).AsInteger := FVolante;
  sdqConsulta.Open ;

  mdDatos.Active := True;
  mdDatos.EmptyTable ;

  if not sdqConsulta.Eof then
  begin
    repeat
       mdDatos.Insert;
       mdDatos.FieldByName('tipo').AsString             := sdqConsulta.FieldByName('tipo').AsString;
       mdDatos.FieldByName('if_idestudio').AsString     := sdqConsulta.FieldByName('if_idestudio').AsString;
       mdDatos.FieldByName('if_id').AsInteger           := sdqConsulta.FieldByName('if_id').AsInteger;
       mdDatos.FieldByName('total_facturado').AsFloat   := sdqConsulta.FieldByName('total_facturado').AsFloat;
       mdDatos.FieldByName('if_fecha').AsDateTime       := sdqConsulta.FieldByName('if_fecha').AsDateTime;
       mdDatos.FieldByName('concepto').AsString         := sdqConsulta.FieldByName('concepto').AsString;
       mdDatos.FieldByName('facturados').AsInteger      := sdqConsulta.FieldByName('facturados').AsInteger;
       mdDatos.FieldByName('aprobados').AsInteger       := sdqConsulta.FieldByName('aprobados').AsInteger;
       mdDatos.FieldByName('a_pagar').AsFloat           := sdqConsulta.FieldByName('a_pagar').AsFloat;
       mdDatos.FieldByName('motivo').AsString           := sdqConsulta.FieldByName('motivo').AsString;
       mdDatos.FieldByName('estado').AsInteger          := sdqConsulta.FieldByName('estado').AsInteger;
       mdDatos.FieldByName('modificado').AsBoolean      := sdqConsulta.FieldByName('motivo').AsString <> '';
       mdDatos.FieldByName('if_idvolante').AsInteger    := sdqConsulta.FieldByName('if_idvolante').AsInteger;
       mdDatos.FieldByName('if_idlote').AsInteger       := sdqConsulta.FieldByName('if_idlote').AsInteger;
       mdDatos.FieldByName('if_motivodebito').AsString  := sdqConsulta.FieldByName('if_motivodebito').AsString;
       //mdDatos.FieldByName('valor_facturado').AsFloat   := sdqConsulta.FieldByName('valor_facturado').AsFloat;
       mdDatos.FieldByName('valoraprobado').AsFloat := sdqConsulta.FieldByName('valoraprobado').AsFloat;
       mdDatos.FieldByName('valorfacturado').AsFloat := sdqConsulta.FieldByName('valorfacturado').AsFloat;
       mdDatos.FieldByName('conpago').AsInteger         := sdqConsulta.FieldByName('conpago').AsInteger;
       mdDatos.FieldByName('if_idempresa').AsInteger    := sdqConsulta.FieldByName('if_idempresa').AsInteger;
       mdDatos.FieldByName('if_idestableci').AsInteger  := sdqConsulta.FieldByName('if_idestableci').AsInteger;
       mdDatos.FieldByName('if_seqvolante').AsInteger   := sdqConsulta.FieldByName('if_seqvolante').AsInteger;
       mdDatos.FieldByName('if_seqpago').AsInteger      := sdqConsulta.FieldByName('if_seqpago').AsInteger;
       mdDatos.FieldByName('vg_pres_nomenclador').AsString := sdqConsulta.FieldByName('vg_pres_nomenclador').AsString;
       mdDatos.FieldByName('vg_pres_capitulo').AsString    := sdqConsulta.FieldByName('vg_pres_capitulo').AsString;
       mdDatos.FieldByName('vg_pres_codigo').AsString      := sdqConsulta.FieldByName('vg_pres_codigo').AsString;
       mdDatos.FieldByName('vg_prestadesde').AsDateTime := sdqConsulta.FieldByName('vg_prestadesde').AsDateTime;
       mdDatos.FieldByName('vg_prestahasta').AsDateTime := sdqConsulta.FieldByName('vg_prestahasta').AsDateTime;
       mdDatos.FieldByName('vg_presdet').AsString       := sdqConsulta.FieldByName('vg_presdet').AsString;
       
       sdqConsulta.Next;
    until sdqConsulta.Eof;

    sdqConsulta.First;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPNotaDebito.btnAceptarClick(Sender: TObject);
Var
  Sql,
  sTmp : String;
  seqVolante,
  seqPago,
  Cantidad : Integer;
  Valor    : Currency;
begin
  btnAceptar.Enabled := False;

  mdDatos.First ;
  with mdDatos do
  repeat
    if (FieldByName('tipo').AsString = 'SIN') then //si es por siniestro...
    begin
      if FieldByName('ESTADO').AsInteger > 0 then
      begin
        sTmp := mdDatos.FieldByName('estado').AsString;
        if (sTmp = '0') or (sTmp = '6') Then
           sTmp := 'AM';

        //--------------------------------------------------------------------------------------------------------------//
        Sql := 'UPDATE sif_itemfacturaamp ' +
               '   SET if_estado = ''A' + sTmp + ''' ' +
               ' WHERE if_id = ' + SqlInteger(FieldByName('if_id').AsInteger) +
               '   AND if_estado = ''P'' ';
        EjecutarSqlST( Sql );
        //--------------------------------------------------------------------------------------------------------------//

        Sql := ' SELECT MAX(if_seqvolante) ' +
                '   FROM sif_itemfacturaamp ' +
                ' WHERE if_idvolante = ' + SqlInteger(FieldByName('if_idvolante').AsInteger);
        seqVolante := StrToInt('0' + ValorSql(Sql) + 1);

        seqPago := ValorSqlInteger('SELECT NVL(MAX(if_seqpago)+1, 1) ' +
                                   '  FROM sif_itemfacturaamp ' +
                                   ' WHERE if_idvolante = ' + SqlInteger(FieldByName('if_idvolante').AsInteger) +
                                   '   AND if_idlote = ' + SqlInteger(FieldByName('if_idlote').AsInteger) +
                                   '   AND if_idempresa = ' + SqlInteger(FieldByName('if_idempresa').AsInteger) +
                                   '   AND if_idestableci = ' + SqlInteger(FieldByName('if_idestableci').AsInteger));

        case FieldByName('ESTADO').AsInteger of
          9: begin            // por TK 20909
            Cantidad := 1;
            Valor    := ((FieldByName('facturados').AsInteger - FieldByName('aprobados').AsInteger) * FieldByName('valorfacturado').AsFloat) +
                        ((FieldByName('valorfacturado').AsFloat - FieldByName('valoraprobado').AsFloat) * FieldByName('aprobados').AsInteger);
          end;

          6: begin
            Cantidad := FieldByName('facturados').AsInteger;
            Valor    := ABS(FieldByName('valorfacturado').AsFloat - FieldByName('valoraprobado').AsFloat)
          end;

          else begin
            if FieldByName('facturados').AsInteger = FieldByName('aprobados').AsInteger then
            begin
              Cantidad := 1;
              Valor    := ABS((FieldByName('facturados').AsInteger * FieldByName('valorfacturado').AsFloat -
                              FieldByName('aprobados').AsInteger * FieldByName('valoraprobado').AsFloat));
            end
            else begin
              Cantidad := FieldByName('facturados').AsInteger - FieldByName('aprobados').AsInteger;
              Valor    := ABS((FieldByName('facturados').AsInteger * FieldByName('valorfacturado').AsFloat -
                              FieldByName('aprobados').AsInteger * FieldByName('valoraprobado').AsFloat) /
                             (FieldByName('facturados').AsInteger - FieldByName('aprobados').AsInteger))
            end;
          end
        end;

        Sql:= 'INSERT INTO sif_itemfacturaamp ' +
              '            (if_id, if_idvolante, if_fecha, if_idestudio, ' +
              '             if_fechaalta, if_usualta, ' +
              '             if_idlote, if_idempresa, if_idestableci, ' +
              '             if_estado, if_motivo, if_motivodebito, ' +
              '             if_cantfacturada, if_valorfacturado, ' +
              '             if_concepto, if_seqvolante, if_seqpago, if_seqdebito, ' +
              '             if_refitem) ' +
              '     VALUES (seq_sif_id.NEXTVAL, ' +
                            SqlInteger(sdqConsulta.FieldByName('if_idvolante').AsInteger) + ', ' +
                            SqlDate(FieldByName('if_fecha').AsDateTime) + ', ' +
                            SqlValue(FieldByName('if_idestudio').AsString) + ', ' +
              '             SYSDATE, ' +
                            SqlValue(Sesion.LoginName) + ', ' +
                            SqlInteger(FieldByName('if_idlote').AsInteger) + ', ' +
                            SqlInteger(FieldByName('if_idempresa').AsInteger) + ', ' +
                            SqlInteger(FieldByName('if_idestableci').AsInteger) + ', ' +
                            SqlValue('C' + FieldByName('ESTADO').AsString) + ', ' +
                            SqlString(FieldByName('motivo').AsString, True) + ', ' +
                            SqlValue(FieldByName('if_motivodebito').AsString) + ', ' +
                            SqlInteger(Cantidad) + ', ' +
                            'ROUND (' + SqlNumber(-Valor) + ',2) , ' +
                            SqlInteger(FieldByName('conpago').AsInteger) + ', ' +
                            SqlValue(seqvolante) + ', ' +
                            SqlValue(seqpago) + ', ' +
                            SqlInteger(FieldByName('if_seqvolante').AsInteger) + ', ' +
                            SqlInteger(FieldByName('if_id').AsInteger) + ')';

        EjecutarSqlST(Sql);
      end;
    end
    else
    begin
      Sql := 'SELECT art.amebpba.get_svg_maxnumpago(' + sdqConsulta.ParamByName('pVolante').AsString + ' )  + 1 ' +
              ' FROM dual ';
      sTmp := ValorSql(Sql);

      Sql := 'INSERT INTO svg_vol_generico ' +
              '(vg_volante, vg_numpago, vg_conpago, vg_prestadesde, vg_prestahasta, vg_pres_nomenclador, ' +
              ' vg_pres_capitulo, vg_pres_codigo, vg_presdet, vg_cantidad, vg_impfacturado, vg_motivo, ' +
              ' vg_estado, vg_usualta, vg_fecalta ) VALUES ( ' +
                sdqConsulta.ParamByName('pVolante').AsString + ', ' + sTmp + ', ' +
                FieldByName('conpago').AsString + ', ' +
                SqlDate(FieldByName('vg_prestadesde').AsDateTime) + ', ' +
                SqlDate(FieldByName('vg_prestahasta').AsDateTime) + ', ' +
                SqlValue(FieldByName('vg_pres_nomenclador').AsString) + ', ' +
                SqlValue(FieldByName('vg_pres_capitulo').AsString) + ',' +
                SqlValue(FieldByName('vg_pres_codigo').AsString) + ',' +
                SqlValue(FieldByName('vg_presdet').AsString) + ',' +
                SqlNumber(FieldByName('aprobados').AsFloat) + ', ' +
                SqlNumber(Abs(FieldByName('valorfacturado').AsFloat - FieldByName('valoraprobado').AsFloat) * (-1)) + ', ' +
                SqlString( IIF(FieldByName('modificado').AsBoolean, FieldByName('motivo').AsString, ''), True) + ', ' +
                SQL_QUOTE + IIF(FieldByName('modificado').AsBoolean, 'CM', 'C6') + SQL_QUOTE + ',' +
                SqlValue(Sesion.UserID) + ', ActualDate )' ;

      EjecutarSqlST(Sql);

    end;
    mdDatos.Next;
  until mdDatos.Eof ;

  ModalResult := mrOk;
end;

{----------------------------------------------------------------------------------------------------------------------}
end.


