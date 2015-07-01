unit unCargaTablasSin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  artSeguridad, FileReader, Mask, ToolEdit, CurrEdit, IntEdit, PatternEdit,
  StdCtrls, DateComboBox, SinEdit, ExtCtrls, Placemnt, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, DBFileReader;

type
  TfrmCargaTablasSin = class(TForm)
    FileReader: TFileReader;
    OpenDialog: TOpenDialog;
    rgTipoDeTabla: TRadioGroup;
    btnCargar: TButton;
    FormStorage1: TFormStorage;
    ArtDBGrid1: TArtDBGrid;
    sdqSiniestros: TSDQuery;
    dsSiniestros: TDataSource;
    btnCargarTabla: TButton;
    btnSalir: TButton;
    DBFileReader1: TDBFileReader;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCargarClick(Sender: TObject);
    procedure FileReaderEndParse(Sender: TObject; Number: Integer);
    procedure FileReaderReadField(Sender: TObject; Line, Field: Integer; Value: String);
    procedure FileReaderReadLine(Sender: TObject; Number: Integer; var Line: String);
    procedure ArtDBGrid1PaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure btnSalirClick(Sender: TObject);
    procedure btnCargarTablaClick(Sender: TObject);
    procedure rgTipoDeTablaClick(Sender: TObject);
  private
    iRegPorTrans: Integer;
    sLinea: String;
    iSiniestro, iOrden, iRecaida, iNroJuicio, iContrato: Integer;
    sCuit: String;
    procedure DoLimpiarGrilla(sUsuario: String);
    procedure DoCargarGrilla(iTipo: Integer; sUsuario: String);
    procedure DoLimpiarTablaTemporal(sUsuario: String);
    procedure DoInsertarRegTablaTemporal(iTipo: Integer; sUsuario: String; iSiniestroAct, iOrdenAct, iRecaidaAct, iNroJuicioAct: Integer; sCuitAct: String; iContratoAct: Integer);
    function GetCantErroresArchivo(sUsuario: String): Integer;
    function ArchivoSinErrores(sUsuario: String): Boolean;
    procedure DoLimpiarTabla(iTipo: Integer; sUsuario: String);
    procedure DoCargarTabla(iTipo: Integer; sUsuario: String);
  public
  end;

var
  frmCargaTablasSin: TfrmCargaTablasSin;

implementation

uses
  unPrincipal, SqlOracle, General, unDmPrincipal, strFuncs, ArtFuncs;

{$R *.DFM}
{-------------------------------------------------------------------------------------------}
procedure TfrmCargaTablasSin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DoLimpiarTablaTemporal(frmPrincipal.DBLogin.LoginName);

  Action := caFree;
end;
{-------------------------------------------------------------------------------------------}
procedure TfrmCargaTablasSin.btnCargarClick(Sender: TObject);
  Var
    Archivo: TFileName;
    CantCols: byte;
    sUsuario: String;
begin
  OpenDialog.Filter := 'CSV (delimitado por comas)|*.csv|CSV (Utilizando Configuración Regional)|*.csv|Documentos de texto (*.txt)|*.txt|Todos los documentos (*.*)|*.*';
  OpenDialog.FilterIndex := 1;

  If OpenDialog.Execute Then
    Begin
      self.Refresh;

      iRegPorTrans:=1;
      sUsuario:=frmPrincipal.DBLogin.LoginName;

      DoLimpiarTablaTemporal(sUsuario);

      Archivo:=OpenDialog.FileName;

      Case rgTipoDeTabla.ItemIndex Of
        0: CantCols:=3;   // siniestros con recaida
        1: CantCols:=2;   // siniestros sin recaida
        2: CantCols:=1;   // Cuit
        3: CantCols:=1;   // juicios
        4: CantCols:=1;   // Cuil        
        5: CantCols:=1;   // Contrato        
      Else
        CantCols:=0;
      End;

      FileReader.MinFields:=CantCols;
      FileReader.MaxFields:=CantCols;

      if OpenDialog.FilterIndex = 2 Then
         FileReader.Separator := ListSeparator
      else
         FileReader.Separator := ';';

      If FileReader.ReadFile(Archivo) Then
        Begin
          If iRegPorTrans > 1 Then
            Try
              CommitTrans;

              DoCargarGrilla(rgTipoDeTabla.ItemIndex, sUsuario);

              btnCargarTabla.Enabled:=(ArchivoSinErrores(sUsuario));
            Except
              On E: Exception Do
                Begin
                  MsgBox('Error al importar el archivo:' + #13 + E.Message, MB_ICONEXCLAMATION);

                  Rollback(True);
                  DoLimpiarGrilla(sUsuario);
                End;
            End;
        End
      Else
        Begin
          Msgbox('Error al leer el archivo', MB_ICONEXCLAMATION);

          Rollback(True);
          DoLimpiarGrilla(sUsuario)
        End;
    End;
end;
{-------------------------------------------------------------------------------------------}
procedure TfrmCargaTablasSin.FileReaderEndParse(Sender: TObject; Number: Integer);
begin
  try
    If iRegPorTrans <= 1 Then
      BeginTrans
    Else If iRegPorTrans > 500 Then
      Begin
        Try
          CommitTrans;
        Except
          On E: Exception Do
            Begin
              RollBack(True);
              Raise;
            End;
        End;

        iRegPorTrans := 0;
      End;

    If Trim(sLinea) <> '' Then
      Begin
        Inc(iRegPorTrans);

        DoInsertarRegTablaTemporal(rgTipoDeTabla.ItemIndex, frmPrincipal.DBLogin.LoginName, iSiniestro, iOrden, iRecaida, iNroJuicio, sCuit, iContrato);
      End;
  Except
    On E: Exception Do
      Begin
        RollBack(True);
        Raise;
      End;
  End;
end;
{-------------------------------------------------------------------------------------------}
procedure TfrmCargaTablasSin.FileReaderReadField(Sender: TObject; Line, Field: Integer; Value: String);
begin
  Case rgTipoDeTabla.ItemIndex Of
    0,1:  // siniestros con/sin recaida
      Begin
        Case Field Of
          0: iSiniestro:=StrToInt(Value);   // Carga siniestro
          1: iOrden:=StrToInt(Value);       // Carga orden
          2: iRecaida:=StrToInt(Value);     // Carga recaida
        End;
      End;     
    2:    // Cuit
      If Field=0 Then
        sCuit:=Value;                       // Carga Cuit
    3:    // juicio
      If Field=0 Then
        iNroJuicio:=StrToInt(Value);        // Carga nro. de juicio
    4:    // Cuil
      If Field=0 Then
        sCuit:=Value;                       // Carga Cuil
    5:    // Contrato
      If Field=0 Then
        iContrato:=StrToInt(Value);         // Carga Contrato
  End;
end;
{-------------------------------------------------------------------------------------------}
procedure TfrmCargaTablasSin.FileReaderReadLine(Sender: TObject; Number: Integer; var Line: String);
begin
  sLinea:=Line;   // Para guardarlo como error en el caso en que ocurra
end;
{-------------------------------------------------------------------------------------------}
procedure TfrmCargaTablasSin.ArtDBGrid1PaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  If Column='MP_DESCRIPCIONERROR' Then
    Begin
      Value:='Reg. Erróneos: ' + IntToStr(GetCantErroresArchivo(frmPrincipal.DBLogin.LoginName));
    End;
end;
{-------------------------------------------------------------------------------------------}
{Limpia la grilla de siniestros}
procedure TfrmCargaTablasSin.DoLimpiarGrilla(sUsuario: String);
begin
  DoLimpiarTablaTemporal(sUsuario);

  If sdqSiniestros.Active Then
    sdqSiniestros.Refresh;

  btnCargarTabla.Enabled:=False;
end;
{-------------------------------------------------------------------------------------------}
{Carga la grilla con los reg. de la tabla temporal}
procedure TfrmCargaTablasSin.DoCargarGrilla(iTipo: Integer; sUsuario: String);
  Var
    sSQL, sOrden: String;
begin
  Case iTipo Of
    0,1: sOrden:='mp_Siniestro, mp_Orden, mp_Recaida';    // siniestros con/sin recaida
    2:   sOrden:='mp_Cuit';                               // Cuit
    3:   sOrden:='mp_NroJuicio';                          // juicios
    4:   sOrden:='mp_Cuit';                               // Cuil
    5:   sOrden:='mp_Contrato';                           // Contrato
  End;

  sSQL:='SELECT mp_Cuit, mp_Siniestro, mp_Orden, mp_Recaida, mp_NroJuicio, mp_Contrato, mp_DescripcionError ' +
        'FROM Gestion.tmp_TablasSiniestros ' +
        'WHERE mp_Usuario='+SqlString(sUsuario, True) + ' ' +
        'ORDER BY ' + sOrden;

  sdqSiniestros.Close;
  sdqSiniestros.SQL.Text:=sSQL;
  sdqSiniestros.Open;
end;
{-------------------------------------------------------------------------------------------}
{Limpia la tabla temporal}
procedure TfrmCargaTablasSin.DoLimpiarTablaTemporal(sUsuario: String);
  Var
    sSQL: String;
Begin
  sSQL:= 'DELETE FROM Gestion.tmp_TablasSiniestros ' +
         'WHERE mp_Usuario='+SqlString(sUsuario, True);

  EjecutarSql(sSQL);
End;
{-------------------------------------------------------------------------------------------}
{Inserta un registro en la tabla temporal}
procedure TfrmCargaTablasSin.DoInsertarRegTablaTemporal(iTipo: Integer; sUsuario: String; iSiniestroAct, iOrdenAct, iRecaidaAct, iNroJuicioAct: Integer; sCuitAct: String; iContratoAct: Integer);
  Var
    sFields, sValues, sSQL, sError: String;
    iRecaidaBusq: Integer;
begin
  sError:='';

  sFields:='';
  sValues:='';

  Case iTipo Of
    0,1:  // siniestros con/sin recaida
      Begin
        MakeSQL(sFields, sValues, 'mp_Siniestro',          SqlNumber(iSiniestroAct));
        MakeSQL(sFields, sValues, 'mp_Orden',              SqlNumber(iOrdenAct));

        If iTipo=0 Then    // con recaida
          Begin
            MakeSQL(sFields, sValues, 'mp_Recaida',            SqlNumber(iRecaidaAct));
            iRecaidaBusq:=iRecaidaAct;
          End
        Else
          iRecaidaBusq:=0;

        If not IsDbSiniestro(iSiniestroAct, iOrdenAct, iRecaidaBusq) Then
          sError:='El siniestro no existe';
       End;
    2:    // Cuit
      Begin
        MakeSQL(sFields, sValues, 'mp_Cuit',               SqlString(sCuitAct, True));

        If not IsDbCuit(sCuitAct) Then
          sError:='El CUIT no existe';
      End;
    3:    // juicios
      Begin
        MakeSQL(sFields, sValues, 'mp_NroJuicio',          SqlNumber(iNroJuicioAct, True));

        If not IsDbNroJuicio(iNroJuicioAct) Then
          sError:='El nro. de juicio no existe';
      End;
    4:    // Cuil
      Begin
        MakeSQL(sFields, sValues, 'mp_Cuit',               SqlString(sCuitAct, True));

        If not IsDbCuil(sCuitAct) Then
          sError:='El CUIL no existe';
      End;
    5:    // Contrato
      Begin
        MakeSQL(sFields, sValues, 'mp_Contrato',           SqlNumber(iContratoAct, True));

        If not IsDbNroContrato(iContratoAct) Then
          sError:='El nro. de contrato no existe';
      End;
  End;

  If sError<>'' Then
    MakeSQL(sFields, sValues, 'mp_DescripcionError',   SqlString(sError, True));

  MakeSQL(sFields, sValues, 'mp_Usuario',            SqlString(sUsuario, True));

  sSQL:='INSERT INTO Gestion.tmp_TablasSiniestros (' + sFields + ') '+
        'SELECT ' + sValues + ' FROM Dual';

  EjecutarSqlST(sSQL);
end;
{-------------------------------------------------------------------------------------------}
{Determina la cant. de errores producidos en la carga del archivo de entrada}
function TfrmCargaTablasSin.GetCantErroresArchivo(sUsuario: String): Integer;
Var
  sSQL: String;
begin
  sSQL:='SELECT COUNT(*) ' +
        'FROM Gestion.tmp_TablasSiniestros ' +
        'WHERE mp_Usuario='+SqlString(sUsuario, True) +
        '  AND mp_DescripcionError IS NOT NULL';

  GetCantErroresArchivo:=ValorSql(sSQL);
end;
{-------------------------------------------------------------------------------------------}
{Determina si se han encontrado errores en el archivo de entrada}
function TfrmCargaTablasSin.ArchivoSinErrores(sUsuario: String): Boolean;
Begin
  ArchivoSinErrores:=(GetCantErroresArchivo(sUsuario)=0);
End;
{-------------------------------------------------------------------------------------------}
procedure TfrmCargaTablasSin.btnSalirClick(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------------------}
procedure TfrmCargaTablasSin.btnCargarTablaClick(Sender: TObject);
begin
  DoCargarTabla(rgTipoDeTabla.ItemIndex, frmPrincipal.DBLogin.LoginName);
end;
{-------------------------------------------------------------------------------------------}
{Limpia las tablas definitivas de Gestión}
procedure TfrmCargaTablasSin.DoLimpiarTabla(iTipo: Integer; sUsuario: String);
  Var
    sTabla, sCampo, sSQL: String;
begin
  Case iTipo Of
    0: Begin    // con recaida
         sTabla:='Gestion.scr_SiniestrosConRecaida';
         sCampo:='cr';
       End;
    1: Begin    // sin recaida
         sTabla:='Gestion.ssr_SiniestrosSinRecaida';
         sCampo:='sr';
       End;
    2: Begin    // Cuit
         sTabla:='Gestion.scu_Cuits';
         sCampo:='cu';
       End;
    3: Begin    // juicios
         sTabla:='Gestion.sju_Juicio';
         sCampo:='ju';
       End;
    4: Begin    // Cuil
         sTabla:='Gestion.scl_Cuiles';
         sCampo:='cl';
       End;
    5: Begin    // contrato
         sTabla:='Gestion.sco_Contrato';
         sCampo:='co';
       End;
  End;

  sSQL:='DELETE FROM ' + sTabla + ' ' +
        'WHERE ' + sCampo + '_Usuario='+SqlString(sUsuario, True);

  EjecutarSql(sSQL);
end;
{-------------------------------------------------------------------------------------------}
{Carga las tablas definitivas de Gestión con los datos de la tabla temporal}
procedure TfrmCargaTablasSin.DoCargarTabla(iTipo: Integer; sUsuario: String);
  Var
    sSQL: String;
begin
  DoLimpiarTabla(iTipo, sUsuario);

  Case iTipo Of
    0: sSQL:='INSERT INTO Gestion.scr_SiniestrosConRecaida (cr_Siniestro, cr_Orden,'+  // siniestros con recaida
             '  cr_Recaida, cr_Usuario) ' +
             '(SELECT mp_Siniestro, mp_Orden, mp_Recaida, mp_Usuario' +
             ' FROM Gestion.tmp_TablasSiniestros' +
             ' WHERE mp_Usuario='+SqlString(sUsuario, True) + ')';
    1: sSQL:='INSERT INTO Gestion.ssr_SiniestrosSinRecaida (sr_Siniestro, sr_Orden,'+  // siniestros sin recaida
             '  sr_Usuario) ' +
             '(SELECT mp_Siniestro, mp_Orden, mp_Usuario' +
             ' FROM Gestion.tmp_TablasSiniestros' +
             ' WHERE mp_Usuario='+SqlString(sUsuario, True) + ')';
    2: sSQL:='INSERT INTO Gestion.scu_Cuits (cu_Cuit, cu_Usuario)'+                                // Cuit
             '(SELECT mp_Cuit, mp_Usuario' +
             ' FROM Gestion.tmp_TablasSiniestros' +
             ' WHERE mp_Usuario='+SqlString(sUsuario, True) + ')';
    3: sSQL:='INSERT INTO Gestion.sju_Juicio (ju_NroJuicio, ju_Usuario)'+                                // juicios
             '(SELECT mp_NroJuicio, mp_Usuario' +
             ' FROM Gestion.tmp_TablasSiniestros' +
             ' WHERE mp_Usuario='+SqlString(sUsuario, True) + ')';
    4: sSQL:='INSERT INTO Gestion.scl_Cuiles (cl_Cuil, cl_Usuario)'+                                // Cuil
             '(SELECT mp_Cuit, mp_Usuario' +
             ' FROM Gestion.tmp_TablasSiniestros' +
             ' WHERE mp_Usuario='+SqlString(sUsuario, True) + ')';
    5: sSQL:='INSERT INTO Gestion.sco_Contrato (co_Contrato, co_Usuario)'+                                // juicios
             '(SELECT mp_Contrato, mp_Usuario' +
             ' FROM Gestion.tmp_TablasSiniestros' +
             ' WHERE mp_Usuario='+SqlString(sUsuario, True) + ')';
  End;

  EjecutarSql(sSQL);

  Msgbox('Los datos se cargaron correctamente', MB_ICONINFORMATION);
end;
{-------------------------------------------------------------------------------------------}
procedure TfrmCargaTablasSin.rgTipoDeTablaClick(Sender: TObject);
begin
  DoLimpiarGrilla(frmPrincipal.DBLogin.LoginName);
end;
{-------------------------------------------------------------------------------------------}
end.

