unit QRpt_RepOwner;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;


type
  TQRpt_Owner_Tablas = class(TQuickRep)
    Sdq_ConsRep: TSDQuery;
    Ds_Reporte: TDataSource;
    Qrb_Detalles: TQRBand;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    Qrb_Encabezados: TQRBand;
    Qrl_Titulo: TQRLabel;
    Qrb_ColHeder: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    Qrb_Pie: TQRBand;
    QrSd_NumPagina: TQRSysData;
    QRSysData1: TQRSysData;
    QRBand1: TQRBand;
    Qrl_Copete: TQRLabel;
    Procedure ImprimirReporte (sOwner, sFiltro, sTipo : String; iAccion : Integer);
  private

  public

  end;

var
  QRpt_Owner_Tablas: TQRpt_Owner_Tablas;

implementation

uses BaseDeDatos, Frm_Reporte;

{$R *.DFM}
Procedure TQRpt_Owner_Tablas.ImprimirReporte (sOwner, sFiltro, sTipo : String; iAccion : Integer);
Begin
// Enum
           with QRpt_Owner_Tablas do begin
                if Sdq_ConsRep.Active then
                   Sdq_ConsRep.Close;

                Sdq_ConsRep.SQL.Clear ;
                Sdq_ConsRep.SQL.Add ('SELECT TB.OBJECT_NAME,' );
                Sdq_ConsRep.SQL.Add ('COMMENTS,' );
                Sdq_ConsRep.SQL.Add ('TO_CHAR(CREATED,''DD/MM/YYYY'') CREADO,' );
                Sdq_ConsRep.SQL.Add ('TO_CHAR(LAST_DDL_TIME,''DD/MM/YYYY'') MODIFICADO,');
                Sdq_ConsRep.SQL.Add ('COUNT(*) COLUMNAS');
                Sdq_ConsRep.SQL.Add ('FROM SYS.ALL_OBJECTS TB, SYS.ALL_TAB_COMMENTS CM, SYS.ALL_TAB_COLUMNS CO');
                Sdq_ConsRep.SQL.Add ('WHERE TB.OBJECT_NAME = CM.TABLE_NAME (+)');
                Sdq_ConsRep.SQL.Add ('AND TB.OBJECT_NAME = CO.TABLE_NAME (+)');
                Sdq_ConsRep.SQL.Add ('AND TB.OWNER = ''' + sOwner + ''' ');
                Sdq_ConsRep.SQL.Add ('AND CM.OWNER = ''' + sOwner + ''' ');
                Sdq_ConsRep.SQL.Add ('AND CO.OWNER = ''' + sOwner + ''' ');
                Sdq_ConsRep.SQL.Add ('AND OBJECT_TYPE = ''' + sTipo + ''' ');
                Sdq_ConsRep.SQL.Add (sFiltro);
                Sdq_ConsRep.SQL.Add ('GROUP BY TB.OBJECT_NAME, COMMENTS, CREATED, LAST_DDL_TIME');
                Sdq_ConsRep.SQL.Add ('ORDER BY TB.OBJECT_NAME');


                //Sdq_ConsRep.ParamByName('sOwner').Value :=  Tv_Arbol.Selected.Text ;

                Sdq_ConsRep.Open ;
                Qrl_Titulo.Caption := 'Objetos de ' + sOwner;

                if (sTipo = 'TABLE') then
                   Qrl_Copete.Caption := 'Descripción de las Tablas'
                else
                   Qrl_Copete.Caption := 'Descripción de las Vistas';

                if iAccion = 0 then
                   Print
                else
                   Preview;
           end;
end;
end.
