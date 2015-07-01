unit unCancelarLiquidacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Placemnt, ExtCtrls, StdCtrls, unArtFrame, unFraCodigoDescripcion,
  unfraCtbTablas, unArtDBAwareFrame;

type
  TfrmCancelarLiquidacion = class(TForm)
    lbMotivo: TLabel;
    fraMotivoCancelac: TfraCtbTablas;
    BevelAbm: TBevel;
    FormStorage: TFormStorage;
    btnAceptarCancLiq: TButton;
    btnCancelarCancLiq: TButton;
    procedure btnAceptarCancLiqClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FOrden: Integer;
    FSiniestro: Integer;
    FNroLiquidacion: Integer;
    FRecaida: Integer;
    FEsMortal: Boolean;
    function ValidaPorcyContr :Boolean;
  public
    property Siniestro: Integer      read FSiniestro      write FSiniestro;
    property Orden: Integer          read FOrden          write FOrden;
    property Recaida: Integer        read FRecaida        write FRecaida;
    property NroLiquidacion: Integer read FNroLiquidacion write FNroLiquidacion;
    property EsMortal: Boolean       read FEsMortal       write FEsMortal;
  end;

implementation

{$R *.DFM}

uses AnsiSql, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, unArt;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCancelarLiquidacion.btnAceptarCancLiqClick(Sender: TObject);
var
  iNLiq: Integer;
  sSql: String;
  dImporteNeg: Currency;
begin
  if fraMotivoCancelac.IsEmpty then
    MsgBox('Debe seleccionar un motivo de cancelación')
  else begin
    sSql := 'SELECT le_estado, le_imporperi, le_imporperi, le_fechades, le_fechahas, ' +
                   'le_diasaplica, le_ibasediaria, le_comentario, le_conpago, le_espagounico, ' +
                   'le_chequenombre, le_delegacion, le_tipobeneficiario ' +
             ' FROM sle_liquiempsin ' +
            ' WHERE le_siniestro = ' + SqlValue(Siniestro) +
              ' AND le_orden = ' + SqlValue(Orden) +
              ' AND le_recaida = ' + SqlValue(Recaida) +
              ' AND le_numliqui = ' + SqlValue(NroLiquidacion);

    with GetQuery(sSql) do
      try
        if IsEmpty then
          MsgBox('La liquidación no existe')
        else if MsgBox('¿Está seguro de cancelar la liquidación ' + IntToStr(NroLiquidacion) + '?', MB_YESNO + MB_ICONQUESTION, 'Cancelar Liquidación')=IDYES then
        begin
          if FieldByName('LE_ESTADO').AsString = 'E' then   // aprobada
          begin
            if not(ValidaPorcyContr) then
            begin
              MsgBox('Ya se realizó el cierre de Aportes y Contribuciones del mes y deberá esperarse para la aprobación al mes siguiente');
              Exit;
            end;

            try
              BeginTrans;

              EjecutarSqlST('UPDATE sle_liquiempsin ' +
                              ' SET le_estado = ''X'', ' +
                                  ' le_usumodif = ' + SqlValue(Sesion.UserId) + ', ' +
                                  ' le_fmodif=actualdate, ' +
                                  ' le_mcancelacion = ' + SqlValue(fraMotivoCancelac.Value) +
                            ' WHERE le_siniestro = ' + SqlValue(Siniestro) +
                              ' AND le_orden = ' + SqlValue(Orden) + ' ' +
                              ' AND le_recaida = ' + SqlValue(Recaida) +
                              ' AND le_numliqui = ' + SqlValue(NroLiquidacion));

              iNLiq := ValorSql('SELECT max(le_numliqui) + 1 ' +
                                 ' FROM sle_liquiempsin ' +
                                ' WHERE le_siniestro = ' + SqlValue(Siniestro) +
                                  ' AND le_orden = ' + SqlValue(Orden) +
                                  ' AND le_recaida = ' + SqlValue(Recaida));

              dImporteNeg := -FieldByName('LE_IMPORPERI').AsCurrency;

              with TSql.Create do
              try
                TableName := 'SLE_LIQUIEMPSIN';

                Fields.Add('LE_SINIESTRO',       Siniestro);
                Fields.Add('LE_ORDEN',           Orden);
                Fields.Add('LE_RECAIDA',         Recaida);
                Fields.Add('LE_NUMLIQUI',        iNLiq);
                Fields.Add('LE_FPROCESO',        'ACTUALDATE', False);
                Fields.Add('LE_FSOLICITA',       'ACTUALDATE', False);
                Fields.Add('LE_TIPOLIQUI',       'W');
                Fields.Add('LE_ESTADO',          'E');
                Fields.Add('LE_FECHADES',        FieldByName('LE_FECHADES').AsDateTime);
                Fields.Add('LE_FECHAHAS',        FieldByName('LE_FECHAHAS').AsDateTime);
                Fields.Add('LE_DIASAPLICA',      FieldByName('LE_DIASAPLICA').AsFloat, dtNumber);
                Fields.Add('LE_IBASEDIARIA',     FieldByName('LE_IBASEDIARIA').AsCurrency, dtNumber);
                Fields.Add('LE_IMPILTP',         0);
                Fields.Add('LE_DECLARAEMP',      0);
                Fields.Add('LE_DIFERENCIA',      0);
                Fields.Add('LE_SUBTOTAL',        dImporteNeg, dtNumber);
                Fields.Add('LE_PAPOREMP',        0);
                Fields.Add('LE_ICONEMP',         0);
                Fields.Add('LE_PAPORTRA',        0);
                Fields.Add('LE_ICONTRA',         0);
                Fields.Add('LE_ASIGFAMILIAR',    0);
                Fields.Add('LE_IMPORPERI',       dImporteNeg, dtNumber);
                Fields.Add('LE_COMENTARIO',      FieldByName('LE_COMENTARIO').AsString);
                Fields.Add('LE_USUALTA',         Sesion.LoginName);
                Fields.Add('LE_PLUSAMPO',        0);
                Fields.Add('LE_CANTIDADAMPO',    0);
                Fields.Add('LE_CONPAGO',         FieldByName('LE_CONPAGO').AsInteger);
                Fields.Add('LE_PORCINCAPACIDAD', 0);
                Fields.Add('LE_FVENCIMI',        'NULL', False);
                Fields.Add('LE_ESPAGOUNICO',     FieldByName('LE_ESPAGOUNICO').AsString);
                Fields.Add('LE_ESANTICIPOMOPRES','N');
                Fields.Add('LE_PEJUBILA',        0);
                Fields.Add('LE_PEINSSJP',        0);
                Fields.Add('LE_PEFNEMPLEO',      0);
                Fields.Add('LE_PESFAMILIAR',     0);
                Fields.Add('LE_PEANSSAL',        0);
                Fields.Add('LE_PEOSOCIAL',       0);
                Fields.Add('LE_PTJUBILA',        0);
                Fields.Add('LE_PTINSSJP',        0);
                Fields.Add('LE_PTANSSAL',        0);
                Fields.Add('LE_PTOSOCIAL',       0);
                Fields.Add('LE_CHEQUENOMBRE',    FieldByName('LE_CHEQUENOMBRE').AsString);
                Fields.Add('LE_MCANCELACION',    fraMotivoCancelac.Value);
                Fields.Add('LE_DELEGACION',      FieldByName('LE_DELEGACION').AsString);
                Fields.Add('LE_FAPROBADO',       'ACTUALDATE', False);
                Fields.Add('LE_APROBADO',         Sesion.LoginName);
                Fields.Add('LE_TIPOBENEFICIARIO',FieldByName('LE_TIPOBENEFICIARIO').AsString);

                SqlType := stInsert;

                EjecutarSqlST(Sql);
              finally
                Free;
              end;

              if EsMortal then
              begin
                sSql := 'INSERT INTO sbl_beneficiarioliquidacion ' +
                       ' SELECT bl_siniestro, bl_orden, bl_recaida, ' + SqlValue(iNLiq) + ', bl_beneficiario, bl_porcentaje ' +
                         ' FROM sbl_beneficiarioliquidacion ' +
                        ' WHERE bl_siniestro = ' + SqlValue(Siniestro) +
                          ' AND bl_orden = ' + SqlValue(Orden) +
                          ' AND bl_recaida = ' + SqlValue(Recaida) +
                          ' AND bl_numliq = ' + SqlValue(NroLiquidacion);
                EjecutarSqlST(sSql);
              end;

              CommitTrans;

            except
              On E: Exception do
              begin
                Rollback;
                Raise Exception.Create (E.Message + CRLF + 'No se pudo cancelar la liquidación ');
              end;
            end;
          end
          else begin
            try
              EjecutarSql('UPDATE sle_liquiempsin ' +
                            ' SET le_estado=''A'', ' +
                                ' le_imporperi=0, ' +
                                ' le_usumodif=' + SqlValue(Sesion.UserId) + ', ' +
                                ' le_fmodif=actualdate, ' +
                                ' le_mcancelacion=' + SqlValue(fraMotivoCancelac.Value) +
                             ' WHERE le_siniestro=' + SqlValue(Siniestro) +
                               ' AND le_orden=' + SqlValue(Orden) +
                               ' AND le_recaida=' + SqlValue(Recaida) +
                               ' AND le_numliqui=' + SqlValue(NroLiquidacion));
            except
              on E: Exception do
              begin
                Rollback;
                Raise Exception.Create (E.Message + CRLF + 'No se pudo cancelar la liquidación ');
              end;
            end;
          end;
          ModalResult := mrOK;
        end;
      finally
        free;
      end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCancelarLiquidacion.FormCreate(Sender: TObject);
begin
  fraMotivoCancelac.Clave     := 'MCANC';
  fraMotivoCancelac.ShowBajas := False;
  fraMotivoCancelac.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmCancelarLiquidacion.ValidaPorcyContr :Boolean;
var
  sSql :String;
begin
  sSql := 'SELECT 1 ' +
           ' FROM dual ' +
          ' WHERE actualdate > liq.get_maxfechagenaporycont';
  Result := ExisteSql(sSql);
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
