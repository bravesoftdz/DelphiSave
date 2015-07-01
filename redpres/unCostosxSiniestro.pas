unit unCostosxSiniestro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, SinEdit, ImgList, FormPanel, Menus;

type
  TfrmCostosxSiniestro = class(TfrmCustomConsulta)
    edSOR: TSinEdit;
    Label1: TLabel;
    FPanelComun: TFormPanel;
    DsGrilla: TDataSource;
    SdqGrilla: TSDQuery;
    ArtDBGrid1: TArtDBGrid;
    Button1: TButton;
    LblTitulo: TLabel;
    tbPEvolutivo: TToolButton;
    tbAutorizac: TToolButton;
    tbDetPrestac: TToolButton;
    tbDetILT: TToolButton;
    tbetILP: TToolButton;
    tbDetOC: TToolButton;
    Label3: TLabel;
    EdSO: TSinEdit;
    FPanelC: TFormPanel;
    lblTituloC: TLabel;
    ArtDBGrid2: TArtDBGrid;
    Button2: TButton;
    SdqC: TSDQuery;
    DSc: TDataSource;
    ToolButton1: TToolButton;
    FPReca: TFormPanel;
    Label2: TLabel;
    ArtDBGrid3: TArtDBGrid;
    Button3: TButton;
    SDQReca: TSDQuery;
    DSReca: TDataSource;
    MnuPop: TPopupMenu;
    VerDetalle1: TMenuItem;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbDetILTClick(Sender: TObject);
    procedure tbetILPClick(Sender: TObject);
    procedure tbDetOCClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdSOExit(Sender: TObject);
    procedure edSORExit(Sender: TObject);
    procedure tbDetPrestacClick(Sender: TObject);
    procedure tbAutorizacClick(Sender: TObject);
    procedure tbPEvolutivoClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure VerDetalle1Click(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure edSOREnter(Sender: TObject);
    procedure EdSOEnter(Sender: TObject);
  private
  public
  end;

var
  frmCostosxSiniestro: TfrmCostosxSiniestro;

implementation

uses
  unPrincipal, unAutSelPorSiniestro, unParteEvolutivo;

{$R *.DFM}

procedure TfrmCostosxSiniestro.tbRefrescarClick(Sender: TObject);
var
  Orden: String;
  Rec: String;
  Sin: String;
  SSQL: String;
begin
  if edSOR.Text <> '' then
  begin
    Sin := IntToStr(edSOR.Siniestro);
    Orden := IntToStr(edSOR.Orden);
    Rec := IntToStr(edSOR.Recaida);
  end
  else
  begin
    Sin := IntToStr(edSO.Siniestro);
    Orden := IntToStr(edSO.Orden);
    Rec := 'NULL';
  end;

  if Sin <> '' then
  begin
    SSQL :=
      'Select 1 N,''Prestaciones Medicas Autorizadas'' Descrip, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',1),''999,999,990.00'') Efectivos,to_char(0,''999,999,990.00'') Estimados,0 CantDias, ''ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,1) Efectivos,0 Estimados,0 CantDias '' Func from dual UNION' +
     ' Select 2 N, ''Prestaciones Medicas Pendientes'' Descrip, to_char(0,''999,999,990.00'') Efectivos, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',2),''999,999,990.00'') Estimados,0 CantDias,''0 Efectivos, ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,2) Estimados,0 CantDias'' Func from dual UNION' +
     ' Select 3 N, ''Otros conceptos Autorizados'' Descrip, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',3),''999,999,990.00'') Efectivos,to_char(0,''999,999,990.00'') Estimados,0 CantDias,'' ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,3)  Efectivos, 0 Estimados, 0 CantDias '' func from dual UNION' +
     ' Select 4 N, ''Otros conceptos Pendientes'' Descrip, to_char(0,''999,999,990.00'') Efectivos, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',4),''999,999,990.00'') Estimados,0 CantDias,'' 0  Efectivos,  ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,4)  Estimados,0  CantDias'' func from dual UNION' +
     ' Select 5 N, ''Autorizaciones Aprobadas'' Descrip, to_char(0,''999,999,990.00'') Efectivos, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',5),''999,999,990.00'') Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',6) CantDias, ''0 Efectivos, ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,5) Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,6) CantDias'' func  from dual UNION' +
     ' Select 6 N, ''Autorizaciones Pendientes'' Descrip, to_char(0,''999,999,990.00'') Efectivos, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',7),''999,999,990.00'') Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',8) CantDias, ''0 Efectivos, ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,7) Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,8) CantDias'' func from dual UNION' +
     ' Select 7 N, ''Autorizaciones sin Nomenclador'' Descrip, to_char(0,''999,999,990.00'') Efectivos, to_char(0,''999,999,990.00'') Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',9) CantDias,''0 Efectivos, 0 Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,9) CantDias'' func from dual UNION' +
     ' Select 8 N, ''ILT Pagada'' Descrip, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',10),''999,999,990.00'') Efectivos, to_char(0,''999,999,990.00'') Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',11) CantDias, ''ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,10) Efectivos, 0 Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,11) CantDias'' func from dual UNION' +
     ' Select 9 N, ''ILT Devengada'' Descrip, to_char(0,''999,999,990.00'') Efectivos, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',12),''999,999,990.00'') Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',13) CantDias, ''0 Efectivos, ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,12) Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,13) CantDias'' func from dual UNION' + //NO
     ' Select 10 N, ''Incapacidad Pagada'' Descrip, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',14),''999,999,990.00'') Efectivos, to_char(0,''999,999,990.00'') Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',15) CantDias, ''ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,14) Efectivos, 0 Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,15) CantDias'' func from dual UNION' +
     ' Select 11 N, ''Incapacidad Estimada'' Descrip, to_char(0,''999,999,990.00'') Efectivos, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',16),''999,999,990.00'') Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',17) CantDias, ''0 Efectivos, ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,16) Estimados,ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,17) CantDias'' func from dual UNION' + //NO
     ' Select 12 N, ''Mortal Pagado'' Descrip, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',18),''999,999,990.00'') Efectivos, to_char(0,''999,999,990.00'') Estimados,0 CantDias, ''ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,18) Efectivos, 0 Estimados,0 CantDias '' func  from dual UNION' +
     ' Select 13 N, ''Mortal Estimado'' Descrip, to_char(0,''999,999,990.00'') Efectivos, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',19),''999,999,990.00'') Estimados, 0 CantDias,''ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',EX_RECAIDA,19) Estimados, 0 CantDias'' func from dual UNION' +
     ' Select 14 N, ''Legales Pagados'' Descrip, to_char(ART.Amebpba.get_costossin('+ Sin + ',' + Orden + ',NULL,20),''999,999,990.00'') Efectivos, to_char(0,''999,999,990.00'') Estimados, 0 CantDias, ''ART.Amebpba.get_costossin('+ Sin + ',' + Orden + ',' + Rec + ',20) Efectivos, 0 Estimados, 0 CantDias'' func  from dual UNION' +
     ' Select 15 N, ''Legales Pendientes'' Descrip, to_char(0,''999,999,990.00'') Efectivos, to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',NULL,21),''999,999,990.00'') Estimados, 0 CantDias,''ART.Amebpba.get_costossin('+ Sin + ',' + Orden + ',' + Rec + ',21) Estimados, 0 CantDias'' func from dual UNION' +
     ' Select 16 N, ''Mediaciones'' Descrip, TO_CHAR (art.amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ', 23), ''999,999,990.00'') efectivos, TO_CHAR (0, ''999,999,990.00'') estimados, 0 cantdias, NULL func from dual UNION ' +
     ' Select 17 N, ''Monto Recuperado'' Descrip, to_char(ART.Amebpba.get_costossin('+ Sin + ',' + Orden + ',NULL,22),''999,999,990.00'') Efectivos, to_char(0,''999,999,990.00'') Estimados,0 CantDias,''ART.Amebpba.get_costossin (siniestro,orden,recaida,22) Efectivos, 0 Estimados,0 CantDias '' func  from dual UNION' +

      // TOTALES
     ' Select 18 N, ''TOTALES'' Descrip,' +
            ' to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',1) + ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',3) + ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',10) + ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',14) + ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',18)+ ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ', NULL,20) - ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',NULL,22) + art.amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ', 23),''999,999,990.00'') Efectivos,' +
            ' to_char(ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',2) + ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',4) + ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',5) + ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',7) + ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',12) + ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',16) + ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',' + Rec + ',19)+ ART.Amebpba.get_costossin ('+ Sin + ',' + Orden + ',NULL,21) ,''999,999,990.00'') Estimados,' +
            ' 0 CantDias, '''' func' +
       ' from dual' +
   ' order by N';

    SdqConsulta.SQL.Text := SSQL;

    inherited;
  end;
end;

procedure TfrmCostosxSiniestro.tbDetILTClick(Sender: TObject);
var
  Orden: String;
  Rec: String;
  Sin: String;
  SSQL: String;
begin
  if edSOR.Text <> '' then
  begin
    Sin := IntToStr(edSOR.Siniestro);
    Orden := IntToStr(edSOR.Orden);
    Rec := ' AND LE_RECAIDA = ' + IntToStr(edSOR.Recaida);
  end
  else
  begin
    Sin := IntToStr(edSO.Siniestro);
    Orden := IntToStr(edSO.Orden);
    Rec := ' ';
  end;

  SSQL :=
    'SELECT LE_RECAIDA RECAIDA, LE_NUMLIQUI NRO,' +
          ' DECODE(LE_ESTADO, ''C'', ''Liquidada'', ''M'', ''Liquidada'', ''E'', ''Aprobada'', NULL) ESTADO,' +
          ' LE_FECHADES DESDE, LE_FECHAHAS HASTA, LE_DIASAPLICA DIAS, LE_IMPILTP LIQUIDADO,' +
          ' TO_CHAR(LE_IMPORPERI, ''999,999,990.000'') A_PAGAR, LE_USUALTA USU_PROC, LE_FEMISION FEC_IMP,' +
          ' LE_FAPROBADO FEC_APRO, LE_APROBADO USU_APRO, NULL CONCEPTO, NULL FEC_PAG' +
     ' FROM ART.SLE_LIQUIEMPSIN' +
    ' WHERE LE_CONPAGO IN (''50'', ''51'')' +
      ' AND LE_SINIESTRO = ' + Sin +
      ' AND LE_ORDEN = ' + Orden +
      ' AND NVL(LE_ESTADO,'' '') NOT IN (''A'', ''X'')' +
      ' AND LE_TIPOLIQUI NOT IN (''W'', ''X'')';
  SdqGrilla.SQL.Text := SSQL;
  SdqGrilla.Open;
  lblTitulo.Caption := tbDetILT.Hint;
  FPanelComun.ShowModal;
  
  inherited;
end;

procedure TfrmCostosxSiniestro.tbetILPClick(Sender: TObject);
var
  Orden: String;
  Rec: String;
  Sin: String;
  SSQL: String;
begin
  if edSOR.Text <> '' then
  begin
    Sin := IntToStr(edSOR.Siniestro);
    Orden := IntToStr(edSOR.Orden);
    Rec := ' AND LE_RECAIDA = ' + IntToStr(edSOR.Recaida);
  end
  else
  begin
    Sin := IntToStr(edSO.Siniestro);
    Orden := IntToStr(edSO.Orden);
    Rec := ' ';
  end;

  SSQL :=
    'SELECT LE_RECAIDA RECAIDA, LE_NUMLIQUI NRO,' +
          ' DECODE(LE_ESTADO, ''C'', ''Liquidada'', ''M'', ''Liquidada'', ''E'', ''Aprobada'', NULL) ESTADO,' +
          ' CP_DENPAGO CONCEPTO, LE_FECHADES DESDE, LE_FECHAHAS HASTA, LE_DIASAPLICA DIAS, LE_IMPILTP LIQUIDADO,' +
          ' TO_CHAR(LE_IMPORPERI, ''999,999,990.000'') A_PAGAR, LE_USUALTA USU_PROC, LE_FEMISION FEC_IMP,' +
          ' LE_FAPROBADO FEC_APRO, LE_APROBADO USU_APRO' +
     ' FROM ART.SLE_LIQUIEMPSIN, ART.SCP_CONPAGO' +
    ' WHERE LE_CONPAGO NOT IN (''50'', ''51'')' +
      ' AND LE_CONPAGO = CP_CONPAGO' +
      ' AND LE_SINIESTRO = ' + Sin +
      ' AND LE_ORDEN = ' + Orden +
      ' AND NVL(LE_ESTADO, '' '') NOT IN (''A'',''X'')' +
      ' AND LE_TIPOLIQUI NOT IN (''W'',''X'')';
  SdqGrilla.SQL.Text := SSQL;
  SdqGrilla.Open;
  lblTitulo.caption := tbetILP.Hint;
  FPanelComun.ShowModal;
  
  inherited;
end;

procedure TfrmCostosxSiniestro.tbDetOCClick(Sender: TObject);
var
  Orden: String;
  Rec: String;
  Sin: String;
  SSQL: String;
begin
  if edSOR.Text <> '' then
  begin
    Sin := IntToStr(edSOR.Siniestro);
    Orden := IntToStr(edSOR.Orden);
    Rec := ' AND PR_RECAIDA = ' + IntToStr(edSOR.Recaida);
  end
  else
  begin
    Sin := IntToStr(edSO.Siniestro);
    Orden := IntToStr(edSO.Orden);
    Rec := ' ';
  end;

  SSQL :=
    'SELECT PR_RECAIDA RECAIDA, PR_NUMPAGO NRO,' +
          ' DECODE(PR_ESTADO, ''C'', ''Pendiente'', ''M'', ''Pendiente'', ''E'',''Aprobada'', NULL) ESTADO,' +
          ' CP_DENPAGO CONCEPTO, to_char(PR_IMPORPAGO, ''999,999,990.000'') A_PAGAR, PR_COMENTARIO COMENTARIO,' +
          ' PR_USUALTA USU_PROC, PR_FECHAPAGO FEC_PAG, PR_FAPROBADO FEC_APRO, PR_APROBADO USU_APRO' +
     ' FROM ART.SPR_PAGOEXPESIN, ART.SCP_CONPAGO' +
    ' WHERE PR_CONPAGO = CP_CONPAGO' +
      ' AND PR_SINIESTRO = ' + Sin +
      ' AND PR_ORDEN = ' + Orden +
      ' AND PR_ESTADO NOT IN (''A'',''X'',''Z'')';
  SdqGrilla.SQL.Text := SSQL;
  SdqGrilla.Open;
  lblTitulo.caption := tbDetOC.Hint;
  FPanelComun.ShowModal;
  inherited;
end;

procedure TfrmCostosxSiniestro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCostosxSiniestro.EdSOExit(Sender: TObject);
begin
  EdSO.Recaida := 0;
  if edSO.text <> '' then
    edSOR.Clear;
end;

procedure TfrmCostosxSiniestro.edSORExit(Sender: TObject);
begin
  if edSOR.text <> '' then
    edSO.Clear;
end;

procedure TfrmCostosxSiniestro.tbDetPrestacClick(Sender: TObject);
var
  Orden: String;
  Rec: String;
  Sin: String;
  SSQL: String;
begin
  if edSOR.Text <> '' then
  begin
    Sin := IntToStr(edSOR.Siniestro);
    Orden := IntToStr(edSOR.Orden);
    Rec := ' AND IV_RECAIDA = ' + IntToStr(edSOR.Recaida);
  end
  else
  begin
    Sin := IntToStr(edSO.Siniestro);
    Orden := IntToStr(edSO.Orden);
    Rec := ' ';
  end;

  SSQL :=
    'SELECT IV_VOLANTE VOLANTE, IV_NUMPAGO NRO, TB_DESCRIPCION ESTADO, CA_DESCRIPCION PRESTADOR, CP_DENPAGO CONCEPTO,' +
          ' IV_FECPRESTA FEC_PRESTA, IV_CANTIDAD CANTIDAD, TO_CHAR(IV_IMPFACTURADO, ''999,999,990.000'') IMPORTE,' +
          ' VO_FECHAPAGO FEC_APROBACION, VO_USUPAGO USU_APROBACION' +
     ' FROM ART.SVO_VOLANTES, ART.CPR_PRESTADOR, ART.SCP_CONPAGO,ART.CTB_TABLAS, ART.SIV_ITEMVOLANTE' +
    ' WHERE TB_CODIGO = IV_ESTADO' +
      ' AND TB_CLAVE = ''MUVOL''' +
      ' AND IV_CONPAGO = CP_CONPAGO' +
      ' AND VO_VOLANTE = IV_VOLANTE' +
      ' AND VO_PRESTADOR = CA_IDENTIFICADOR' +
      ' AND IV_SINIESTRO = ' + Sin +
      ' AND IV_ORDEN = ' + Orden +
            Rec +
      ' AND IV_ESTADO NOT IN (''X'',''Z'')' +
      ' AND VO_ESTADO <> ''C''';
  SdqC.SQL.Text := SSQL;
  SdqC.Open;
  lblTituloC.caption := tbDetPrestac.Hint;
  FPanelC.ShowModal;
end;

procedure TfrmCostosxSiniestro.tbAutorizacClick(Sender: TObject);
var
  FormTmp: TfrmAutSelPorSiniestro;
  Orden: String;
  Rec: String;
  Sin: String;
begin
  if edSOR.Text <> '' then
  begin
    Sin := IntToStr(edSOR.Siniestro);
    Orden := IntToStr(edSOR.Orden);
    Rec := IntToStr(edSOR.Recaida);
  end
  else
  begin
    Sin := IntToStr(edSO.Siniestro);
    Orden := IntToStr(edSO.Orden);
    Rec := '0';
  end;
  
  FormTmp := TfrmAutSelPorSiniestro.Create(self);
  try
    FormTmp.sinedit.Siniestro := StrToInt(Sin);
    FormTmp.sinedit.Orden := StrToInt(Orden);
    FormTmp.sinedit.Recaida := StrToInt(Rec);
    FormTmp.tbRefrescar.Click;
    FormTmp.Show;
  finally
//     FormTmp.Free ;
  end;
end;

procedure TfrmCostosxSiniestro.tbPEvolutivoClick(Sender: TObject);
var
  Orden: String;
  Rec: String;
  Sin: String;
//   FormTmp:TfrmParteEvolutivo;
begin
  if edSOR.Text <> '' then
  begin
    Sin := IntToStr(edSOR.Siniestro);
    Orden := IntToStr(edSOR.Orden);
    Rec := IntToStr(edSOR.Recaida);
  end
  else
  begin
    Sin := IntToStr(edSO.Siniestro);
    Orden := IntToStr(edSO.Orden);
    Rec := '0';
  end;
  
  frmParteEvolutivo.Free;
  frmParteEvolutivo :=TfrmParteEvolutivo.Create(self);
  try
    frmParteEvolutivo.sinedit.Siniestros := Sin;
    frmParteEvolutivo.sinedit.Ordens := Orden;
    frmParteEvolutivo.sinedit.Recaidas := Rec;
    frmParteEvolutivo.SinEditSelect(nil);
//     FormTmp.sinedit.
    frmParteEvolutivo.Show;
  finally
//     FormTmp.Free ;
  end;
end;

procedure TfrmCostosxSiniestro.tbImprimirClick(Sender: TObject);
var
  Orden: String;
  Rec: String;
  Sin: String;  
begin
  if edSOR.Text <> '' then
  begin
    Sin := IntToStr(edSOR.Siniestro);
    Orden := IntToStr(edSOR.Orden);
    Rec := IntToStr(edSOR.Recaida);
    Queryprint.Title.Text := 'Costos del Siniestro ' + Sin + ' - Orden ' + Orden + ' - Recaida ' + Rec;
  end
  else
  begin
    Sin := IntToStr(edSO.Siniestro);
    Orden := IntToStr(edSO.Orden);
    Rec := '0';
    Queryprint.Title.Text := 'Costos del Siniestro ' + Sin + ' - Orden ' + Orden;
  end;
  
  inherited;
end;

procedure TfrmCostosxSiniestro.tbLimpiarClick(Sender: TObject);
begin
  edSO.Clear;
  edSOR.Clear;
  inherited;
end;

procedure TfrmCostosxSiniestro.VerDetalle1Click(Sender: TObject);
var
  Orden: String;
  Sin: String;
begin
  inherited;

  if edSOR.Text <> '' then
  begin
    Sin := IntToStr(edSOR.Siniestro);
    Orden := IntToStr(edSOR.Orden);
  end
  else
  begin
    Sin := IntToStr(edSO.Siniestro);
    Orden := IntToStr(edSO.Orden);
  end;

  label2.caption := sdqconsulta.FieldByName('Descrip').AsString ;
  SDQReca.SQL.Text :=
    'Select EX_Recaida, ' + sdqConsulta.FieldByName('Func').AsString +
     ' From ART.SEX_EXPEDIENTES' +
    ' Where EX_SINIESTRO = ' + SIN +
      ' AND EX_ORDEN = ' + ORDEN +
      ' AND NVL(EX_CAUSAFIN, '' '') <> ''99''';

  if SDQReca.Active then
    SDQReca.Refresh
  else
    SDQReca.Open;

  FPReca.ShowModal;
end;

procedure TfrmCostosxSiniestro.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if edso.Siniestro > 0 then
  begin
    if (sdqconsulta.FieldByName('N').AsString = '9') or (sdqconsulta.FieldByName('N').AsString = '11') or
       (sdqconsulta.FieldByName('N').AsString = '13') or (sdqconsulta.FieldByName('N').AsString = '14')then
      Verdetalle1.Enabled := False
    else
      Verdetalle1.Enabled := True;
  end
  else
    Verdetalle1.Enabled := False;
end;

procedure TfrmCostosxSiniestro.edSOREnter(Sender: TObject);
begin
  edSO.Clear;
end;

procedure TfrmCostosxSiniestro.EdSOEnter(Sender: TObject);
begin
  edSOR.Clear ;
end;

end.
