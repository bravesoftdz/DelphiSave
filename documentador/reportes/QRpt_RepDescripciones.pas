unit QRpt_RepDescripciones;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TQrpt_Descripciones = class(TQuickRep)
    Qrb_Encabezados: TQRBand;
    Qrl_Copete: TQRLabel;
    Qrl_Titulo: TQRLabel;
    Qrb_Pie: TQRBand;
    QrSd_NumPagina: TQRSysData;
    QRSysData1: TQRSysData;
    Qrb_Detalles: TQRBand;
    Qrm_Lineas: TQRMemo;
    Procedure ImprimirReporte (sTitulo, sCopete: String; sLineas: TStrings ; Accion : Integer);
    Procedure ImprimirQuery   (sTitulo, sCopete, sConsulta: String; Accion: Integer);
    Procedure ImprimirTabla (sOwner, sTabla: String; Accion: Integer);
    Function LargoFijo (Cadena: String; Largo: Integer): String;
  private

  public

  end;

var
  Qrpt_Descripciones: TQrpt_Descripciones;

implementation

uses BaseDeDatos;

{$R *.DFM}
Function TQrpt_Descripciones.LargoFijo (Cadena: String; Largo: Integer): String;
begin
     if (Length(Cadena) < Largo) then
        Result :=  Cadena + StringOfChar(' ', Largo - Length(Cadena))
     else
        Result :=  Copy(Cadena,1, Largo);
end;

Procedure TQrpt_Descripciones.ImprimirReporte (sTitulo, sCopete: String; sLineas: TStrings ; Accion : Integer);
begin
     Qrl_Titulo.Caption := sTitulo;
     Qrl_Copete.Caption := sCopete;
     Qrm_Lineas.Lines := sLineas;

     if Accion = 0 then
        Print
     else
        Preview;
end;

Procedure TQrpt_Descripciones.ImprimirQuery (sTitulo, sCopete, sConsulta: String; Accion: Integer);
Var    Cursor : TSDQuery;
       Lineas : TStringList;
begin
   Lineas := TStringList.Create;
   Lineas.Clear ;
   Cursor := TSDQuery.Create( Self );
   Cursor.Databasename := BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.DatabaseName   ;
   Cursor.SQL.Add(sConsulta);
   Try
      Cursor.Open ;
      if Cursor.Fields[0].DataType = ftString then
        while not Cursor.Eof do begin
            Lineas.Add(Cursor.Fields[0].AsString);
            Cursor.Next;
        end
     else
        Lineas.Text := Cursor.Fields[0].AsString;

   finally
      Cursor.Close ;
      ImprimirReporte(sTitulo,sCopete,Lineas,Accion);
   end;
end;

Procedure TQrpt_Descripciones.ImprimirTabla (sOwner, sTabla: String; Accion: Integer);
Var    Cursor       : TSDQuery;
       SubCursor    : TSDQuery;
       Linea        : String;
       Lineas       : TStringList;
       sDescripcion : String;
       sTipoConst   : String;
       sBuffer      : String;
       nIndice      : Integer;
begin
  Lineas := TStringList.Create;
  Cursor := TSDQuery.Create( Self );
  SubCursor := TSDQuery.Create( Self );
  Try
     Lineas.Clear ;
     Cursor.Databasename := BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.DatabaseName   ;

     SubCursor.Databasename := BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.DatabaseName   ;


     sDescripcion := ValorSql (' SELECT COMMENTS FROM SYS.ALL_TAB_COMMENTS ' +
                               ' WHERE TABLE_TYPE = ''TABLE'' ' +
                               ' AND OWNER = ''' + sOwner  +  ''' ' +
                               ' AND TABLE_NAME = ''' + sTabla  +  ''' ') ;
     if (sDescripcion = '') then sDescripcion := 'Estructura de la Tabla' ;

//Imprime datos de los Campos
{
     Cursor.SQL.Add(' SELECT COL.COLUMN_NAME, DATA_TYPE, DATA_LENGTH, DATA_PRECISION, DATA_SCALE, NULLABLE , COMMENTS ');
     Cursor.SQL.Add(' FROM SYS.ALL_TAB_COLUMNS COL, SYS.ALL_COL_COMMENTS COM ');
     Cursor.SQL.Add(' WHERE COL.OWNER = ''' + sOwner  +  ''' ');
     Cursor.SQL.Add(' AND COL.TABLE_NAME = ''' + sTabla  +  ''' ');
     Cursor.SQL.Add(' AND COL.OWNER = COM.OWNER (+) ');
     Cursor.SQL.Add(' AND COL.TABLE_NAME = COM.TABLE_NAME (+) ');
     Cursor.SQL.Add(' AND COL.COLUMN_NAME = COM.COLUMN_NAME (+) ');
     Cursor.SQL.Add(' ORDER BY COLUMN_ID ');
}
     Cursor.Sql.Add( 'select c.name COLUMN_NAME, ' +
                            'decode(c.type#, 1, decode(c.charsetform, 2, ''NVARCHAR2'', ''VARCHAR2''), ' +
                                  '2, decode(c.scale, null, ' +
                                             'decode(c.precision#, null, ''NUMBER'', ''FLOAT''), ' +
                                             '''NUMBER''), ' +
                                  '8, ''LONG'', ' +
                                  '9, decode(c.charsetform, 2, ''NCHAR VARYING'', ''VARCHAR''), ' +
                                  '12, ''DATE'', 23, ''RAW'', 24, ''LONG RAW'', ' +
                                  '69, ''ROWID'', ' +
                                  '96, decode(c.charsetform, 2, ''NCHAR'', ''CHAR''), ' +
                                  '105, ''MLSLABEL'', ' +
                                  '106, ''MLSLABEL'', ' +
                                  '111, ot.name, ' +
                                  '112, decode(c.charsetform, 2, ''NCLOB'', ''CLOB''), ' +
                                  '113, ''BLOB'', 114, ''BFILE'', 115, ''CFILE'', ' +
                                  '121, ot.name, ' +
                                  '122, ot.name, ' +
                                  '123, ot.name, ' +
                                  '''UNDEFINED'') DATA_TYPE, ' +
                            'c.length DATA_LENGTH, c.precision# DATA_PRESICION, c.scale DATA_SCALE, ' +
                            'decode(sign(c.null$),-1,''D'', 0, ''Y'', ''N'') NULLABLE, co.comment$ ' +
                      'from sys.col$ c, sys.obj$ o, sys.user$ u, ' +
                           'sys.coltype$ ac, sys.obj$ ot, sys.com$ co ' +
                     'where o.obj# = c.obj# ' +
                       'and o.owner# = u.user# ' +
                       'and bitand(c.property, 32) = 0 /* not hidden column */ ' +
                       'and c.obj# = ac.obj#(+) and c.intcol# = ac.intcol#(+) ' +
                       'and ac.toid = ot.oid$(+) ' +
                       'and (o.type# in (3, 4) ' + { cluster, view }
                            'or ' +
                            '(o.type# = 2 ' + { tables, excluding iot - overflow and nested tables }
                             'and ' +
                             'not exists (select null ' +
                                           'from sys.tab$ t ' +
                                          'where t.obj# = o.obj# ' +
                                            'and (bitand(t.property, 512) = 512 or ' +
                                                 'bitand(t.property, 8192) = 8192)))) ' +
                       'and c.obj# = co.obj#(+) ' +
                       'and c.col# = co.col#(+) ' +
                       'AND u.name = ''' + sOwner  +  ''' ' +
                       'AND o.name = ''' + sTabla  +  ''' ' +
              'ORDER BY c.col#' );
     Try
        Cursor.Open ;
        if not Cursor.Eof then begin
            Lineas.Add ('Campos: ');
            while not Cursor.Eof do begin
                Linea := LargoFijo(Cursor.Fields[0].AsString, 20) + ' ' +
                         LargoFijo(Cursor.Fields[1].AsString, 8) + ' ' ;
                         if (Cursor.Fields[1].AsString = 'NUMBER') then
                             Linea :=  Linea + LargoFijo(Cursor.Fields[3].AsString + '.' + Cursor.Fields[4].AsString , 8)
                         else
                             Linea :=  Linea + LargoFijo(Cursor.Fields[2].AsString, 8);

                             Linea :=  Linea + LargoFijo(Cursor.Fields[5].AsString, 1) + ' ' +
                                               Cursor.Fields[6].AsString ;
                while Length(Linea) <> 0 do begin
                     if ( Length(Linea) > 92 ) then begin
                          if ( Copy(Linea, 92, 1) = '' ) then begin
                            Lineas.Add ( Copy(Linea, 1, 92) );
                            Linea := StringOfChar(' ', 40) + Trim(Copy(Linea, 93, Length(Linea) - 92));
                          end else begin  // Busca un espacio para poder separar las palabras (WordWrap)
                             for nIndice := 92 downto 52 do begin
                                 if ( Copy(Linea, nIndice, 1) = ' ' ) then
                                    break;
                             end;
                             if not ( Copy(Linea, nIndice, 1) = ' ' ) then
                                    nIndice := 92;

                            Lineas.Add ( Copy(Linea, 1, nIndice) );
                            Linea := StringOfChar(' ', 40) + Trim(Copy(Linea, nIndice + 1, Length(Linea) - nIndice));
                          end ;
                     end else begin
                          Lineas.Add ( Linea );
                          Linea := '';
                     end;
                end;

                Cursor.Next;
            end
        end;
     finally
        Cursor.Close ;
     end;

//Imprime los Índices
     Cursor.Sql.Clear ;
     Cursor.Sql.Add (' SELECT INDEX_NAME, UNIQUENESS, STATUS FROM SYS.ALL_INDEXES  ' +
                     ' WHERE TABLE_NAME =''' + sTabla + '''' +
                     ' AND TABLE_OWNER =''' + sOwner + '''' +
                     ' ORDER BY INDEX_NAME ');
     Try
        Cursor.Open ;
        if not Cursor.Eof then begin
            Lineas.Add ('Indices: ');
            while not Cursor.Eof do begin
                sBuffer := Cursor.Fields[1].AsString;
                if sBuffer = 'UNIQUE' then
                   sBuffer := '(Unico)'
                else
                   sBuffer := '';

                IF Cursor.Fields[2].AsString = 'INVALID' then
                   sBuffer := sBuffer + '- INVÁLIDO -' ;

                Lineas.Add ( '     ' + Cursor.Fields[0].AsString + ' ' + sBuffer );
                SubCursor.SQL.Clear ;
                SubCursor.SQL.Add ('SELECT COLUMN_NAME ' +
                                     'FROM SYS.ALL_IND_COLUMNS ' +
                                    'WHERE TABLE_OWNER = ''' + sOwner + ''' ' +
                                      'AND TABLE_NAME = ''' + sTabla + ''' ' +
                                      'AND INDEX_NAME = ''' + Cursor.Fields[0].AsString + ''' ' +
                                 'ORDER BY COLUMN_POSITION' );
                Try
                   SubCursor.Open;
                   while not SubCursor.Eof do begin
                             //+ StringOfChar(' ', Length(Cursor.Fields[0].AsString))
                       Lineas.Add ( '         '  + SubCursor.Fields[0].AsString );
                       SubCursor.Next;
                   end;
                finally
                   SubCursor.Close ;
                end;
                Cursor.Next;
            end;
        end;
     finally
        Cursor.Close ;
     end;

//Constantes
     Cursor.Sql.Clear ;
     Cursor.Sql.Add (' SELECT CONSTRAINT_TYPE, CONSTRAINT_NAME, STATUS, SEARCH_CONDITION, DELETE_RULE ' +
                     ' FROM SYS.ALL_CONSTRAINTS ' +
                     ' WHERE TABLE_NAME =''' + sTabla + '''' +
                     ' AND OWNER =''' + sOwner + '''' +
                     ' ORDER BY CONSTRAINT_TYPE ');
     Try
        Cursor.Open ;
        if not Cursor.Eof then begin
           Lineas.Add ('Constantes: ');
            while not Cursor.Eof do begin
                If not ((Cursor.Fields[0].AsString = 'C') and (Copy(Cursor.Fields[1].AsString,1,4) = 'SYS_')) Then begin
                  if not (Cursor.Fields[0].AsString = sTipoConst) then begin
                    if (Cursor.Fields[0].AsString = 'P') then
                       Lineas.Add ('    Primary Key:')
                    else if (Cursor.Fields[0].AsString = 'R') then
                       Lineas.Add ('    Foreing Key:')
                    else if (Cursor.Fields[0].AsString = 'U') then
                       Lineas.Add ('    Unique:')
                    else if (Cursor.Fields[0].AsString = 'C') then
                       Lineas.Add ('    Check:');

                    sTipoConst := Cursor.Fields[0].AsString;
                  end; // If

                  if (Cursor.Fields[2].AsString = 'DISABLED') then
                     sBuffer := ' (Deshabilitado)'
                  else
                     sBuffer := '';

                  if (Cursor.Fields[4].AsString = 'CASCADE') then
                     sBuffer := sBuffer + ' (Eliminación en Cascada)';

                       Lineas.Add ('        ' + Cursor.Fields[1].AsString + sBuffer );

                    If Cursor.Fields[0].AsString = 'C' Then begin
                       //Imprime el Código de los Checks
                       //Lineas.Add ('                Código:') ;
                       Lineas.Add ('                ' +  Cursor.Fields[3].AsString ) ;
                    end else Begin
                        //Campo de los Indices
                        SubCursor.SQL.Clear ;
                        SubCursor.SQL.Add (' SELECT COLUMN_NAME ' +
                                           ' FROM  SYS.ALL_CONS_COLUMNS ' +
                                           ' WHERE OWNER = ''' + sOwner + ''' ' +
                                           ' AND TABLE_NAME = ''' + sTabla + ''' ' +
                                           ' AND CONSTRAINT_NAME = ''' + Cursor.Fields[1].AsString + '''  ' +
                                           ' ORDER BY POSITION ');
                        Try
                           SubCursor.Open;
                           while not SubCursor.Eof do begin
                               Lineas.Add ( '                '  + SubCursor.Fields[0].AsString );
                               SubCursor.Next;
                           end; // While
                        finally
                           SubCursor.Close ;
                        end; // Try
                    end; // If
                end; // If (SYS_)
                Cursor.Next;
            end; // While
        end; // If
     finally
        Cursor.Close ;
     end; // Try


// Triggers
     Cursor.Sql.Clear ;
     Cursor.Sql.Add (' SELECT OWNER, TRIGGER_NAME, TRIGGER_TYPE, TRIGGERING_EVENT, ' +
                     ' REFERENCING_NAMES, WHEN_CLAUSE, STATUS, DESCRIPTION, TRIGGER_BODY ' +
                     ' FROM SYS.ALL_TRIGGERS ' +
                     ' WHERE TABLE_NAME = ''' + sTabla + '''' +
                     ' AND TABLE_OWNER =''' + sOwner + '''' );
     Try
        Cursor.Open ;
        if not Cursor.Eof then begin
           Lineas.Add ('Triggers: ');
            while not Cursor.Eof do begin

//                  sTipoConst := Cursor.Fields[0].AsString;

                if (Cursor.FieldByName('STATUS').AsString= 'INVALID') then
                   sBuffer := '(Estado Inválido)'
                else
                   sBuffer := '';
                Lineas.Add ('    ' + Cursor.FieldByName('OWNER').AsString + '.' +
                            Cursor.FieldByName('TRIGGER_NAME').AsString +
                            sBuffer);
                Lineas.Add ('        Tipo:' + Cursor.FieldByName('TRIGGER_TYPE').AsString );
                Lineas.Add ('        Evento:' + Cursor.FieldByName('TRIGGERING_EVENT').AsString );
                Lineas.Add ('        Referencias:' + Cursor.FieldByName('REFERENCING_NAMES').AsString );
                Lineas.Add ('        Clausula:' + Cursor.FieldByName('WHEN_CLAUSE').AsString );

        //Campos del Trigger
                SubCursor.SQL.Clear ;
                SubCursor.SQL.Add (' SELECT TABLE_OWNER || ''.'' || TABLE_NAME || ''.'' ||  COLUMN_NAME,  COLUMN_LIST, COLUMN_USAGE ' +
                                   ' FROM SYS.ALL_TRIGGER_COLS ' +
                                   ' WHERE TRIGGER_OWNER = ''' + Cursor.FieldByName('OWNER').AsString + ''' ' +
                                   ' AND TRIGGER_NAME = ''' + Cursor.FieldByName('TRIGGER_NAME').AsString + ''' ' );
                Try
                   SubCursor.Open;
                   if not SubCursor.Eof Then
                       Lineas.Add ('        Campos Relacionados:' + Cursor.FieldByName('WHEN_CLAUSE').AsString );

                   while not SubCursor.Eof do begin
                       Lineas.Add ( '                '  + SubCursor.Fields[0].AsString );
                       Lineas.Add ( '                        Listada: '  + SubCursor.Fields[1].AsString );
                       Lineas.Add ( '                        Uso: '  + SubCursor.Fields[1].AsString );
                       SubCursor.Next;
                   end; // While
                finally
                   SubCursor.Close ;
                end; // Try

                Cursor.Next;
            end; // While
        end; // If
     finally
        Cursor.Close ;
     end; // Try
//----------------------------------------------------------------------------------------------------------------------


     Cursor.Sql.Clear ;
     Cursor.Sql.Add ('SELECT OWNER || ''.'' || TABLE_NAME || ''.'' || CONSTRAINT_NAME, DELETE_RULE, STATUS ' +
                     'FROM SYS.ALL_CONSTRAINTS O ' +
                     'WHERE CONSTRAINT_TYPE = ''R'' ' +
                     'AND EXISTS (SELECT 1 FROM SYS.ALL_CONSTRAINTS D ' +
                                  'WHERE O.R_OWNER = D.OWNER ' +
                                    'AND O.R_CONSTRAINT_NAME = D.CONSTRAINT_NAME ' +
                                    'AND D.OWNER = ''' + sOwner + '''' +
                                    'AND D.TABLE_NAME = ''' + sTabla + ''')');
     Try
        Cursor.Open ;
        if not Cursor.Eof then begin
           Lineas.Add ('Relaciones a esta Tabla: ');
            while not Cursor.Eof do begin
                Linea := '    ' + Cursor.Fields[0].AsString + ' ';
                if Cursor.Fields[1].AsString = 'CASCADE' Then
                   Linea := Linea + 'Con Eliminación en Cascada ';
                if Cursor.Fields[2].AsString = 'DISABLED' Then
                   Linea := Linea + '(Deshabilitada)';

                Lineas.Add ( Linea );

                Cursor.Next;
            end; // While
        end; // If
     finally
        Cursor.Close ;
     end; // Try

   //Imprime el Reporte
     ImprimirReporte(sTabla, sDescripcion, Lineas, Accion);

  finally
    Lineas.Free;
    Cursor.Free;
    SubCursor.Free;
  end;

end;
//----------------------------------------------------------------------------------------------------------------------
end.
