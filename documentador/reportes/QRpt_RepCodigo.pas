unit QRpt_RepCodigo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, Dialogs;

type
  TQRpt_RepCodigos = class(TQuickRep)
    Sdq_ConsRep: TSDQuery;
    Ds_Reporte: TDataSource;
    Qrb_Pie: TQRBand;
    QrSd_NumPagina: TQRSysData;
    QRSysData1: TQRSysData;
    Qrb_Detalles: TQRBand;
    QRDBText1: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    Qrb_ColHeder: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    Qrb_Encabezados: TQRBand;
    Qrl_Copete: TQRLabel;
    Qrl_Titulo: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    Procedure ImprimirReporte (sOwner, sFiltro, sTipo : String; iAccion : Integer);
  private

  public

  end;

var
  QRpt_RepCodigos: TQRpt_RepCodigos;

implementation

uses BaseDeDatos;



{$R *.DFM}
Procedure TQRpt_RepCodigos.ImprimirReporte (sOwner, sFiltro, sTipo : String; iAccion : Integer);
Var TablaComments : String;
Begin
           TablaComments := Dm_BaseDeDatos.TablaComentarios;
           with QRpt_RepCodigos do begin
                if Sdq_ConsRep.Active then
                   Sdq_ConsRep.Close;

                Sdq_ConsRep.SQL.Clear ;
                if TablaComments = '' then
                    Sdq_ConsRep.SQL.Add (' SELECT OBJECT_NAME, '' COMMENTS, OBJECT_TYPE, STATUS, ' +
                                         ' TO_CHAR(CREATED,''DD/MM/YYYY'') CREADO, TO_CHAR(LAST_DDL_TIME,''DD/MM/YYYY'') MODIFICADO ' +
                                         ' FROM SYS.ALL_OBJECTS ' +
                                         ' WHERE OWNER = ''' + sOwner + ''' ')
                Else
                    Sdq_ConsRep.SQL.Add (' SELECT OBJECT_NAME, COMMENTS, SYS.ALL_OBJECTS.OBJECT_TYPE, STATUS, ' +
                                         ' TO_CHAR(CREATED,''DD/MM/YYYY'') CREADO, TO_CHAR(LAST_DDL_TIME,''DD/MM/YYYY'') MODIFICADO ' +
                                         ' FROM SYS.ALL_OBJECTS, ' + TablaComments +
                                         ' WHERE SYS.ALL_OBJECTS.OWNER = ''' + sOwner + ''' ' +
                                         ' AND SYS.ALL_OBJECTS.OWNER  = ' + TablaComments + '.OWNER (+)' +
                                         ' AND SYS.ALL_OBJECTS.OBJECT_NAME  = ' + TablaComments + '.OBJECT (+)' +
                                         ' AND SYS.ALL_OBJECTS.OBJECT_TYPE  = ' + TablaComments + '.OBJECT_TYPE (+)' +
                                         '');

                if (sTipo = '') then
                    Sdq_ConsRep.SQL.Add ('AND SYS.ALL_OBJECTS.OBJECT_TYPE IN (''PROCEDURE'', ''FUNCTION'', ''PACKAGE'', ''PACKAGE BODY'') ')
                else
                    Sdq_ConsRep.SQL.Add ('AND SYS.ALL_OBJECTS.OBJECT_TYPE = ''' + sTipo + ''' ')  ;
                Sdq_ConsRep.SQL.Add (sFiltro);
                Sdq_ConsRep.SQL.Add ('ORDER BY SYS.ALL_OBJECTS.OBJECT_TYPE, OBJECT_NAME');

//                ShowMessage( Sdq_ConsRep.SQL.Text );
                Sdq_ConsRep.Open ;
                Qrl_Titulo.Caption := 'Códigos Fuentes en ' + sOwner;

               Qrl_Copete.Caption := 'Descripción de las Funciones, Procedimientos y Paquetes' ;
                if iAccion = 0 then
                   Print
                else
                   Preview;
           end;
end;
end.
