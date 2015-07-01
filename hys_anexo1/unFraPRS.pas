unit unFraPRS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  StdCtrls, ExtCtrls, IntEdit, PatternEdit, FormPanel, Db, SDEngine,
  ImgList, Placemnt, QueryToFile, ExportDialog, QueryPrint, SortDlg,
  ShortCutControl, DBCGrids, Mask, ToolEdit, DateComboBox, DateTimeFuncs,
  unfraEstablecimientoDomic, Menus, ImageComboBox, unArtFrame, unConstFet,
  unFraCodigoDescripcion, unfraCtbTablas, unArtDbFrame, unArtDBAwareFrame,
  VCLExtra, ExComboBox, RXCtrls, Buttons, unfraCodigoDescripcionExt,
  unfraEstablecimiento, DBCtrls, unComunesFet, Vcl.CheckLst, RxPlacemnt,
  RxToolEdit;

type
  TfrmPRS = class(TForm)
    sdqDiagnostico: TSDQuery;
    dsDiagnostico: TDataSource;
    sdDiagnostico: TSortDialog;
    QueryPrint: TQueryPrint;
    edDiagnostico: TExportDialog;
    FormPlacement: TFormPlacement;
    sccDiagnostico: TShortCutControl;
    sdqRecomendaciones: TSDQuery;
    dsRecomendaciones: TDataSource;
    sdRecomendaciones: TSortDialog;
    qpRecomendaciones: TQueryPrint;
    edRecomendaciones: TExportDialog;
    sccRecomendaciones: TShortCutControl;
    sdqRelaciones: TSDQuery;
    dsRelaciones: TDataSource;
    sdqRelacionesROWNUM: TFloatField;
    sdqRelacionesDE_DESCRIPCION1: TStringField;
    sdqRelacionesDR_DIAGNOSTICO: TFloatField;
    sdqVisitas: TSDQuery;
    dsVisitas: TDataSource;
    sdVisitas: TSortDialog;
    sdqRepRecomendaciones: TSDQuery;
    qpRepRecomendaciones: TQueryPrint;
    dsRepRecomendaciones: TDataSource;
    sdqRepRecomendacionesRE_RECOMENDACION: TFloatField;
    sdqRepRecomendacionesRE_DESCRIPCION1: TStringField;
    sdqRepRecomendacionesRE_CUMPLIMIENTO: TDateTimeField;
    sdqRepRecomendacionesRE_DESCRIPCION2: TStringField;
    sdqRepRecomendacionesRE_SEGUIMIENTO: TDateTimeField;
    sdqRepRecomendacionesRV_FECHA: TDateTimeField;
    sdqRepRecomendacionesTIPO_VISITA: TStringField;
    sdqRepRecomendacionesDESCRIPCION: TStringField;
    sdqRepRecomendacionesRE_RESPONSABLE: TStringField;
    qryDiagnosticos: TSDQuery;
    SDQuery1: TSDQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    StringField3: TStringField;
    pcTipoPRS: TPageControl;
    pcPRS: TPageControl;
    tsDiagEstableci: TTabSheet;
    cBarDiagEstableci: TCoolBar;
    tBarDiagEstableci: TToolBar;
    tbDiagRefrescar: TToolButton;
    ToolButton2: TToolButton;
    tbDiagAgregar: TToolButton;
    tbDiagModificar: TToolButton;
    tbDiagQuitar: TToolButton;
    ToolButton4: TToolButton;
    tbDiagOrdenar: TToolButton;
    ToolButton6: TToolButton;
    tbDiagExportar: TToolButton;
    tbDiagImprimir: TToolButton;
    dbgDiagnostico: TArtDBGrid;
    fpDiagAMB: TFormPanel;
    lbDiagTipo: TLabel;
    lbDiagNro: TLabel;
    Bevel1: TBevel;
    lblPuestoTrabajo: TLabel;
    lblTrabajadoresExpuestos: TLabel;
    edDiagTipo: TPatternEdit;
    cmbDiagTipo: TComboBox;
    edDiagNro: TIntEdit;
    edMemoDiagnostico: TMemo;
    btnDiagAceptar: TButton;
    btnDiagCancelar: TButton;
    edPuestoTrabajo: TEdit;
    edTrabajadoresExpuestos: TIntEdit;
    tsRecomendaciones: TTabSheet;
    Splitter1: TSplitter;
    pnlRecomendaciones: TPanel;
    CoolBar1: TCoolBar;
    tBarRecomendaciones: TToolBar;
    tbRecRefrescar: TToolButton;
    ToolButton3: TToolButton;
    tbRecNuevo: TToolButton;
    tbRecModificar: TToolButton;
    tbRecEliminar: TToolButton;
    ToolButton9: TToolButton;
    tbRecOrdenar: TToolButton;
    ToolButton11: TToolButton;
    tbRecExportar: TToolButton;
    tbRecImprimir: TToolButton;
    dbgRecomendaciones: TArtDBGrid;
    ArtDBGrid1: TArtDBGrid;
    prItemsRec: TPageControl;
    tsVisitas: TTabSheet;
    pnlVisitas: TPanel;
    CoolBar3: TCoolBar;
    tbVisitas: TToolBar;
    tbVisAgregar: TToolButton;
    tbVisQuitar: TToolButton;
    ToolButton5: TToolButton;
    tbVisOrdenar: TToolButton;
    dbgVisitas: TArtDBGrid;
    fpRecAMB: TFormPanel;
    Bevel2: TBevel;
    Label1: TLabel;
    lbRelCumplimiento: TLabel;
    lbRelSeguimiento: TLabel;
    Bevel5: TBevel;
    Label6: TLabel;
    lblPreventorRecomendacion: TLabel;
    lblVisita: TLabel;
    Bevel6: TBevel;
    btnBuscarVisitas: TSpeedButton;
    btnRecAceptar: TButton;
    btnRecCancelar: TButton;
    edRecDescripcion: TMemo;
    edRecNumero: TIntEdit;
    edResponsableEjecucion: TEdit;
    fraPreventorRecomendacion: TfraCodigoDescripcionExt;
    cbDiagnosticos: TRxCheckListBox;
    edVisita: TEdit;
    fpVisitas: TFormPanel;
    Label5: TLabel;
    Bevel7: TBevel;
    Label3: TLabel;
    btnVisAceptar: TButton;
    btnVisCancelar: TButton;
    cmbVisTipo: TExComboBox;
    edRelCumplimiento: TDateEdit;
    edRelSeguimiento: TDateEdit;
    edVisFecha: TDateEdit;
    Label2: TLabel;
    Label4: TLabel;
    sccVisitas: TShortCutControl;
    chkNoamerita: TCheckBox;
    btnCopiarDe: TButton;
    fpCopiarEstableci: TFormPanel;
    BevelAbm: TBevel;
    btnCopEstAceptar: TButton;
    btnCopEstCancelar: TButton;
    fraEstabCopia: TfraEstablecimientoDomic;
    fpHistorico: TFormPanel;
    dbgHistorico: TArtDBGrid;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbSalir: TToolButton;
    DBMemo2: TDBMemo;
    tbHistorico: TToolButton;
    ToolButton7: TToolButton;
    sdqHistorico: TSDQuery;
    dsHistorico: TDataSource;
    pnlPlanVisitas: TPanel;
    CoolBar4: TCoolBar;
    ToolBar1: TToolBar;
    tbNuevoVisitaPlan: TToolButton;
    tbEliminarVisitaPlan: TToolButton;
    ToolButton10: TToolButton;
    tbOrdenarVisitaPlan: TToolButton;
    dbgPlanVisitas: TArtDBGrid;
    pnlCaptionPlan: TPanel;
    sdqPlanVisitas: TSDQuery;
    dsPlanVisitas: TDataSource;
    fpPlanVisita: TFormPanel;
    Label7: TLabel;
    Bevel3: TBevel;
    btnAceptarPlanVisitas: TButton;
    Button2: TButton;
    edFechaPlanVisitas: TDateEdit;
    sdPlanVisitas: TSortDialog;
    Panel2: TPanel;
    Label8: TLabel;
    chkNivelFirmas: TCheckListBox;
    cbSinFirmas: TCheckBox;
    procedure edDiagTipoExit(Sender: TObject);
    procedure tbDiagAgregarClick(Sender: TObject);
    procedure edDiagTipoKeyPress(Sender: TObject; var Key: Char);
    procedure btnDiagAceptarClick(Sender: TObject);
    procedure tbDiagModificarClick(Sender: TObject);
    procedure tbDiagQuitarClick(Sender: TObject);
    procedure tbDiagOrdenarClick(Sender: TObject);
    procedure tbDiagExportarClick(Sender: TObject);
    procedure tbDiagImprimirClick(Sender: TObject);
    procedure tbDiagRefrescarClick(Sender: TObject);
    procedure pcPRSChange(Sender: TObject);
    procedure cmbDiagTipoChange(Sender: TObject);
    procedure tbRecRefrescarClick(Sender: TObject);
    procedure btnRecAceptarClick(Sender: TObject);
    procedure tbRecNuevoClick(Sender: TObject);
    procedure tbRecModificarClick(Sender: TObject);
    procedure tbRecEliminarClick(Sender: TObject);
    procedure tbRecOrdenarClick(Sender: TObject);
    procedure tbRecExportarClick(Sender: TObject);
    procedure tbRecImprimirClick(Sender: TObject);
    procedure sdqRecomendacionesAfterScroll(DataSet: TDataSet);
    procedure pcTipoPRSChange(Sender: TObject);
    procedure pcTipoPRSChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure prItemsRecChange(Sender: TObject);
    procedure tbVisQuitarClick(Sender: TObject);
    procedure tbVisAgregarClick(Sender: TObject);
    procedure btnVisAceptarClick(Sender: TObject);
    procedure tbVisOrdenarClick(Sender: TObject);
    procedure qpRepRecomendacionesGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure sdqRepRecomendacionesAfterScroll(DataSet: TDataSet);
    procedure sdqRepRecomendacionesCalcFields(DataSet: TDataSet);
    procedure CargarComboVisitas;
    procedure btnBuscarVisitasClick(Sender: TObject);
    procedure dbgRecomendacionesCellClick(Column: TColumn);
    procedure fraPreventorRecomendacioncmbDescripcionDropDown(Sender: TObject);
    procedure chkNoameritaClick(Sender: TObject);
    procedure btnCopiarDeClick(Sender: TObject);
    procedure fpCopiarEstableciBeforeShow(Sender: TObject);
    procedure btnCopEstAceptarClick(Sender: TObject);
    procedure tbHistoricoClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure UpdateDiagPorRec;
    procedure dbgPlanVisitasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbNuevoVisitaPlanClick(Sender: TObject);
    procedure btnAceptarPlanVisitasClick(Sender: TObject);
    procedure tbEliminarVisitaPlanClick(Sender: TObject);
    procedure tbOrdenarVisitaPlanClick(Sender: TObject);
    procedure cbSinFirmasClick(Sender: TObject);
    procedure chkNivelFirmasClickCheck(Sender: TObject);
  private
    iRepRecNro     : Integer;
    sRepLastNroRec : String;
    FIdUltimaVisita,
    FIdVisita,
    FEstableci: Integer;
    FCUIT: String;
    FContrato: String;
    FRazonSocial: String;
    FTipo: String;
    FOperativo : String;
    FTipoDescripcion: String;
    FTipoFormulario: integer;
    FInformoFaltaAnexo1 : boolean;
    FInformoFaltaAnexo2 : boolean;
    procedure SetCuit(const Value: String);
    procedure SetEstableci(const Value: Integer);
    procedure SetTipoFormulario(const Value: integer);
    procedure CargarComboDiagnosticos (Sender: TObject);
    function VerifyChecked: boolean;
    procedure AgregarDiagnosticoNoAmerita;
    procedure CargarPlanVisitas;
  public
    FCantRecIniciales : Integer;
    procedure Load;
    procedure Save ;
    procedure Limpiar;
    procedure GuardarNivelFirma;
  published
    property CUIT             : String   read FCUIT             write SetCuit;
    property Estableci        : Integer  read FEstableci        write SetEstableci;
    property RazonSocial      : String   read FRazonSocial      write FRazonSocial;
    property Tipo             : String   read FTipo             write FTipo;
    property Operativo        : String   read FOperativo        write FOperativo;
    property TipoDescripcion  : String   read FTipoDescripcion  write FTipoDescripcion;
    property Contrato         : String   read FContrato         write FContrato;
    property TipoFormulario   : integer  read FTipoFormulario   write SetTipoFormulario;
  end;

Const
  TXT_AGREGAR   = '&Agregar';
  TXT_MODIFICAR = 'Modific&ar';
  MAX_RELATIONS = 10;

implementation

uses unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, General, StrFuncs, Numeros,
  unCustomDataModule, unFet, unConsVisitasRealizadas, unFraEmpresa, unSesion,
  Math;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.edDiagTipoExit(Sender: TObject);
begin
  if (edDiagTipo.Text = 'C') Then
    cmbDiagTipo.ItemIndex := 0
  else if (edDiagTipo.Text = 'R') Then
    cmbDiagTipo.ItemIndex := 1
  else if (edDiagTipo.Text = 'E') Then
    cmbDiagTipo.ItemIndex := 2
  else
    cmbDiagTipo.ItemIndex := -1;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.cmbDiagTipoChange(Sender: TObject);
begin
  edDiagTipo.Text := Switch(cmbDiagTipo.ItemIndex, ['C', 'R', 'E']);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbDiagAgregarClick(Sender: TObject);
begin
  if not FInformoFaltaAnexo1 and (Tipo = 'ET') and (frmFet.edItem4.IsEmpty or frmFet.edItem5.IsEmpty or frmFet.edItem6.IsEmpty) then
  begin
    if (MsgBox('No existe Anexo 1. ¿Desea cargar el PRS de todas formas?',  MB_ICONQUESTION + MB_YESNO, 'Diagnósticos') <> IDYES) then
      Exit;
  end;

  if not FInformoFaltaAnexo1 and (Tipo = 'EP') and ((frmFet.rbGroupItem4.ItemIndex = -1) or frmFet.edItem5.IsEmpty or frmFet.edItem6.IsEmpty) then
  begin
    if (MsgBox('No existe Anexo 3. ¿Desea cargar el PAPE de todas formas?',  MB_ICONQUESTION + MB_YESNO, 'Diagnósticos') <> IDYES) then
      Exit;
  end;

  if not FInformoFaltaAnexo2 and (Tipo = 'ET') and (frmFet.Anexo1_IsEmpty) then
  begin
    if (MsgBox('No existe Anexo 2. ¿Desea cargar el PRS de todas formas?',  MB_ICONQUESTION + MB_YESNO, 'Diagnósticos') <> IDYES) then
      Exit;
  end;

  if not FInformoFaltaAnexo2 and (Tipo = 'EP') and (frmFet.Anexo1_IsEmpty) then
  begin
    if (MsgBox('No existe Anexo 4. ¿Desea cargar el PAPE de todas formas?',  MB_ICONQUESTION + MB_YESNO, 'Diagnósticos') <> IDYES) then
      Exit;
  end;

  FInformoFaltaAnexo1 := true;
  FInformoFaltaAnexo2 := true;

  repeat
    edDiagNro.Text         := '';
    edDiagTipo.Text        := '';
    cmbDiagTipo.ItemIndex  := -1;
    edMemoDiagnostico.Text := '';
    edPuestoTrabajo.Text   := '';
    edTrabajadoresExpuestos.text := '';

    btnDiagAceptar.Caption := TXT_AGREGAR;
  until fpDiagAMB.ShowModal <> mrOk
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbDiagModificarClick(Sender: TObject);
begin
  if (not sdqDiagnostico.IsEmpty) then begin
    edDiagNro.Value        := sdqDiagnostico.FieldByName('DE_DIAGNOSTICO').AsInteger ;
    edDiagTipo.Text        := sdqDiagnostico.FieldByName('DE_TIPO_DIAGNOSTICO').AsString ;
    edPuestoTrabajo.Text   := sdqDiagnostico.FieldByName('DE_SECTOREMPRESA').AsString ;
    edTrabajadoresExpuestos.text := sdqDiagnostico.FieldByName('DE_TRABAJADORESEXPUESTOS').AsString ;
    edDiagTipoExit( Nil );
    edMemoDiagnostico.Text := AdjustLineBreaks( sdqDiagnostico.FieldByName('DE_DESCRIPCION1').AsString + sdqDiagnostico.FieldByName('DE_DESCRIPCION2').AsString );

    btnDiagAceptar.Caption := TXT_MODIFICAR;
    fpDiagAMB.ShowModal ;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbDiagQuitarClick(Sender: TObject);
Var Sql : String;
begin
  if sdqDiagnostico.Active and (not sdqDiagnostico.IsEmpty) then
    if MsgBox('¿Desea eliminar el registro seleccionado?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES Then
    Try
      Sql := 'UPDATE PDE_DIAGESTABLECI ' +
               'SET DE_FECHABAJA = SYSDATE, ' +
                   'DE_USUBAJA = ''' + frmPrincipal.DBLogin.LoginName + ''' ' +
             'WHERE DE_CUIT = ''' + FCUIT +  '''' +
               'AND DE_ESTABLECI = ' + SqlInt( FEstableci ) +
               'AND DE_TIPO = ''' + FTipo + ''' ' +
               'AND DE_OPERATIVO = ''' + FOperativo + ''' ' +
               'AND DE_DIAGNOSTICO = ' + sdqDiagnostico.FieldByName('DE_DIAGNOSTICO').AsString ;
      EjecutarSqlST( Sql);
      {-------------------------------------------------------------------------------------------------------}
      Sql := 'UPDATE PRE_RECOMENDACIONES ' +
               'SET RE_FECHAMODIF = SYSDATE, ' +
                   'RE_USUMODIF = ''' + frmPrincipal.DBLogin.LoginName + ''' ' +
             'WHERE RE_CUIT = ''' + FCUIT +  ''' ' +
               'AND RE_ESTABLECI = ' + SqlInt( FEstableci ) + ' ' +
               'AND RE_TIPO = ''' + FTipo + ''' ' +
               'AND RE_OPERATIVO = ''' + FOperativo + ''' ' +
               'AND EXISTS (SELECT 1 FROM PDR_DIAGPORREC ' +
                            'WHERE RE_CUIT = DR_CUIT ' +
                              'AND RE_ESTABLECI = DR_ESTABLECI ' +
                              'AND RE_TIPO = DR_TIPO ' +
                              'AND RE_OPERATIVO = DR_OPERATIVO ' +
                              'AND RE_RECOMENDACION = DR_RECOMENDACION ' +
                              'AND DR_DIAGNOSTICO = ''' + sdqDiagnostico.FieldByName('DE_DIAGNOSTICO').AsString + ''')' ;
      EjecutarSqlST( Sql );
      {-------------------------------------------------------------------------------------------------------}
      Sql := 'UPDATE PDR_DIAGPORREC' +
             ' SET DR_FECHABAJA = SYSDATE, ' +
             ' DR_USUBAJA = ''' + frmPrincipal.DBLogin.LoginName + ''' ' +
             ' WHERE DR_CUIT = ''' + FCUIT +  '''' +
               ' AND DR_ESTABLECI = ' + SqlInt( FEstableci ) +
               ' AND DR_TIPO = ''' + FTipo + '''' +
               ' AND DR_OPERATIVO = ''' + FOperativo + ''' ' +
               ' AND DR_DIAGNOSTICO = ''' + sdqDiagnostico.FieldByName('DE_DIAGNOSTICO').AsString + '''' ;
      EjecutarSqlST( Sql);
      (*
      Sql := 'DELETE PDR_DIAGPORREC' +
             ' WHERE DR_CUIT = ''' + FCUIT +  '''' +
               ' AND DR_ESTABLECI = ' + SqlInt( FEstableci ) +
               ' AND DR_TIPO = ''' + FTipo + '''' +
               ' AND DR_OPERATIVO = ''' + FOperativo + ''' ' +
               ' AND DR_DIAGNOSTICO = ''' + sdqDiagnostico.FieldByName('DE_DIAGNOSTICO').AsString + '''' ;
      EjecutarSqlST( Sql);
      *)
      {-------------------------------------------------------------------------------------------------------}
      tbDiagRefrescarClick( Nil );
      sdqRecomendacionesAfterScroll( Nil );
    except
      on E: Exception do ErrorMsg( E );
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.edDiagTipoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) Then
  begin
    if not edPuestoTrabajo.ReadOnly then
      edPuestoTrabajo.SetFocus
    else
      edMemoDiagnostico.SetFocus;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.btnDiagAceptarClick(Sender: TObject);
Var Sql : String;
begin
     if (edDiagTipo.Text = '') Then
        InvalidMsg(edDiagTipo, 'Debe especificar el tipo de Diagnóstico')

     else if (FTipoFormulario = TIPO_FORMULARIO_PAPE) and (trim(edPuestoTrabajo.Text) = '') Then
        InvalidMsg(edMemoDiagnostico, 'Debe especificar el puesto de trabajo')

//     else if (FTipoFormulario = TIPO_FORMULARIO_PAPE) and (edTrabajadoresExpuestos.Value = 0) Then
//        InvalidMsg(edMemoDiagnostico, 'Debe especificar la cantidad de expuestos')

     else if (trim(edMemoDiagnostico.Text) = '') Then
        InvalidMsg(edMemoDiagnostico, 'Debe especificar la Descripción del Diagnóstico')

     else begin
          if (btnDiagAceptar.Caption = TXT_AGREGAR) Then begin
             edDiagNro.Value := IncSql('SELECT MAX(DE_DIAGNOSTICO) ' +
                                         'FROM PDE_DIAGESTABLECI ' +
                                        'WHERE DE_CUIT = ''' + FCUIT +  '''' +
                                          'AND DE_ESTABLECI = ' + SqlInt( FEstableci ) + ' ' +
                                          'AND DE_TIPO = ''' + FTipo + '''' +
                                          'AND DE_OPERATIVO = ''' + FOperativo + ''' ' );

             Sql := 'INSERT INTO PDE_DIAGESTABLECI ' +
                    '(DE_CUIT, DE_ESTABLECI, DE_TIPO, DE_OPERATIVO, DE_DIAGNOSTICO, DE_TIPO_DIAGNOSTICO, DE_DESCRIPCION1, DE_DESCRIPCION2, DE_SECTOREMPRESA, DE_TRABAJADORESEXPUESTOS, DE_FECHAALTA, DE_USUALTA) ' +
                    'VALUES (''' + FCUIT +  ''', ' + SqlInt( FEstableci ) + ', ''' + FTipo + ''', ''' + FOperativo + ''', ' + edDiagNro.TextSql + ', ''' + edDiagTipo.Text + ''', ' +
                    SqlString(TrimLeft(Copy(trim(edMemoDiagnostico.Text),0, 4000)), True) + ', ' + SqlString( Copy(trim(edMemoDiagnostico.Text), 4001, 3900), True) + ', ' +
                    SqlValue(edPuestoTrabajo.Text)  + ', ' + SqlValue(edTrabajadoresExpuestos.Value)  + ', ' +
                    'SYSDATE, ''' + frmPrincipal.DBLogin.LoginName + ''') ';
          end else
             Sql := 'UPDATE PDE_DIAGESTABLECI ' +
                       'SET DE_TIPO_DIAGNOSTICO = ''' + edDiagTipo.Text + ''', ' +
                           'DE_DESCRIPCION1 = ' + SqlString(TrimLeft (Copy(trim(edMemoDiagnostico.Text),0, 4000)), True) + ', ' +
                           'DE_DESCRIPCION2 = ' + SqlString(Copy(trim(edMemoDiagnostico.Text), 4001, 3900), True) + ', ' +
                           'DE_SECTOREMPRESA = ' + SqlValue(edPuestoTrabajo.Text) + ', ' +
                           'DE_TRABAJADORESEXPUESTOS = ' + SqlValue(edTrabajadoresExpuestos.Value) + ', ' +
                           'DE_FECHAMODIF = SYSDATE, ' +
                           'DE_USUMODIF = ''' + frmPrincipal.DBLogin.LoginName + ''' ' +
                     'WHERE DE_CUIT = ''' + FCUIT +  '''' +
                       'AND DE_ESTABLECI = ' + SqlInt( FEstableci ) + ' ' +
                       'AND DE_TIPO = ''' + FTipo + ''' ' +
                       'AND DE_OPERATIVO = ''' + FOperativo + ''' ' +
                       'AND DE_DIAGNOSTICO = ' + edDiagNro.TextSql ;
          //------------------------------------------------------------------------------------------------------------
          Try
             EjecutarSqlST( Sql );
             RefreshAndLocate(sdqDiagnostico, ['DE_DIAGNOSTICO'], [edDiagNro.TextSql]);
             fpDiagAMB.ModalResult := mrOk;
          Except
             on E: Exception do ErrorMsg( E );
          end;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.Load;
Var Sql        : String;
    iEstableci, i : Integer;
begin
  FInformoFaltaAnexo1 := false;
  FInformoFaltaAnexo2 := false;
  Try
    iEstableci := FEstableci;

    pcTipoPRS.ActivePageIndex := 0;
    // Carga la Grilla de Diagnósticos por Establecimientos
    Sql := 'SELECT DE_DIAGNOSTICO, DECODE(DE_TIPO_DIAGNOSTICO, ''C'', ''Causales de Accidente'', ''E'',''Enfermedad Profesional'' , ''Riesgo Potencial'') TIPO, ' +
                 'DE_TIPO_DIAGNOSTICO, DE_DESCRIPCION1, DE_DESCRIPCION2, DE_SECTOREMPRESA, DE_TRABAJADORESEXPUESTOS ' +
            'FROM PDE_DIAGESTABLECI ' +
           'WHERE DE_CUIT = ''' + FCUIT + ''' ' +
             'AND DE_ESTABLECI = ' + SqlInt( iEstableci ) + ' ' +
             'AND DE_TIPO = ''' + FTipo + ''' ' +
             'AND DE_OPERATIVO = ''' + FOperativo + ''' ' +
             'AND DE_FECHABAJA IS NULL ' +
             sdDiagnostico.OrderBy ;
    OpenQuery( sdqDiagnostico, Sql );

    pcTipoPRSChange( Nil );

    // Carga la Grilla de Recomendaciones por Establecimientos
    Sql := 'SELECT RE_RECOMENDACION, RE_DESCRIPCION1, RE_DESCRIPCION2, ' +
           '       RE_CUMPLIMIENTO, RE_SEGUIMIENTO, RE_RESPONSABLE, ' +
           '       RE_IDVISITA, RE_IDFIRMANTE, RE_NOAMERITA, RE_ID ' +
           '  FROM PRE_RECOMENDACIONES ' +
           ' WHERE RE_CUIT = ' + SqlValue (FCUIT) + ' ' +
           '   AND RE_ESTABLECI = ' + SqlInt( iEstableci ) + ' ' +
           '   AND RE_TIPO = ' + SqlValue (FTipo) + ' ' +
           '   AND RE_OPERATIVO = ' + SqlValue (FOperativo) + ' ' +
           '   AND RE_FECHABAJA IS NULL'+
           sdRecomendaciones.OrderBy ;
    OpenQuery( sdqRecomendaciones, Sql );


    tBarDiagEstableci.Enabled   := True;
    tBarRecomendaciones.Enabled := True;
    //SET_ITEM_PROPERTY('BLOCK.tBarDiagXRec', ENABLED, PROPERTY_TRUE);

    pcPRSChange( Nil );

    sdqRecomendacionesAfterScroll( Nil );

    CargarPlanVisitas;
    with GetQueryEx('SELECT * ' +
                    '  FROM HYS.HNF_NIVELFIRMA' +
                    ' WHERE NF_USUBAJA IS NULL ' +
                    '   AND NF_CUIT = :cuit ' +
                    '   AND NF_ESTABLECI = :estableci ' +
                    '   AND NF_TIPO = :tipo '+
                    '   AND NF_OPERATIVO = :operativo '+
                    '   AND NF_TIPOFORMULARIO = '+IIF(FTipo='ET','''PRS''','''PAPE''')+
                    ' ORDER BY 1 DESC ',
                      [FCUIT,
                       FEstableci,
                       FTipo,FOperativo]) do
    try
      while not Eof do
      begin
        for i:=0 to chkNivelFirmas.Count-1 do
          if (integer(chkNivelFirmas.Items.Objects[i]) = FieldByName('NF_IDTIPOFIRMA').AsInteger) then
          begin
            chkNivelFirmas.Checked[i] := true;
            break;
          end;
        Next;
      end;

    finally
      free;
    end;
    cbSinFirmas.Checked := ExisteSqlEx('SELECT 1 ' +
                                       '  FROM HYS.HNF_NIVELFIRMA' +
                                       ' WHERE NF_USUBAJA IS NULL ' +
                                       '   AND NF_CUIT = :cuit ' +
                                       '   AND NF_ESTABLECI = :estableci ' +
                                       '   AND NF_TIPO = :tipo '+
                                       '   AND NF_OPERATIVO = :operativo '+
                                       '   AND NF_IDTIPOFIRMA = 5 '+
                                       '   AND NF_TIPOFORMULARIO = '+IIF(FTipo='ET','''PRS''','''PAPE''')+
                                       ' ORDER BY 1 DESC ',
                                         [FCUIT,
                                          FEstableci,
                                          FTipo,FOperativo]);

    FCantRecIniciales := sdqRecomendaciones.RecordCount;
  except
    on E: Exception do ErrorMsg(E, 'Error al cargar el PRS');
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.Limpiar;
var
  i :Integer;
begin
  FInformoFaltaAnexo1 := false;
  FInformoFaltaAnexo2 := false;
  sdqDiagnostico.Close;
  sdqRecomendaciones.Close;
  sdqRelaciones.Close;
  sdqVisitas.Close ;

  tBarDiagEstableci.Enabled    := False;
  tBarRecomendaciones.Enabled  := False;
   for i := 0 to chkNivelFirmas.Items.Count - 1 do
    chkNivelFirmas.Checked[i] := False;
  cbSinFirmas.Checked := False;
  pcPRS.ActivePageIndex := 1;

//     tBarDiagXRec.Enabled        := False;
//     FRazonSocial     := '';
//     FContrato        := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbDiagOrdenarClick(Sender: TObject);
begin
  sdDiagnostico.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbDiagExportarClick(Sender: TObject);
begin
  edDiagnostico.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbDiagImprimirClick(Sender: TObject);
begin
  if frmFet.PrintSetup.Execute then begin
    QueryPrint.SubTitle.Lines.Clear;
    QueryPrint.SubTitle.Lines.Add( FTipoDescripcion );
    QueryPrint.SubTitle.Lines.Add( FCUIT + ' - ' + FContrato + ' - ' + FRazonSocial );
    qpRepRecomendaciones.SubTitle.Lines.Add( 'Operativo: ' +  FOperativo );
    QueryPrint.Footer.Text   := frmPrincipal.DBLogin.Usuario ;
    QueryPrint.Print ;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbDiagRefrescarClick(Sender: TObject);
begin
  RefreshAndRelocate(sdqDiagnostico, ['DE_DIAGNOSTICO']);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.pcPRSChange(Sender: TObject);
begin
  sccDiagnostico.Enabled     := pcPRS.ActivePageIndex = 0;
  sccRecomendaciones.Enabled := pcPRS.ActivePageIndex = 1;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbRecRefrescarClick(Sender: TObject);
begin
  RefreshAndRelocate(sdqRecomendaciones, ['RE_RECOMENDACION']);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.btnRecAceptarClick(Sender: TObject);
Var
  Sql : String;
  i: integer;
  aCantidadChecked: integer;
  fechaVisita : TDate;

  procedure GenerarSQLAlta (IDDiagnostico: Integer);
  begin
    Sql := 'INSERT INTO pdr_diagporrec (dr_cuit, dr_estableci, dr_recomendacion, ' +
          '                            dr_diagnostico, dr_tipo, dr_operativo, ' +
          '                            dr_idvisita, dr_usualta, dr_fechaalta) ' +
          '     VALUES (' + SqlValue(FCUIT) +  ', ' + SqlInt(FEstableci) + ', ' + edRecNumero.TextSql + ', ' +
                        SqlValue (IDDiagnostico) + ', ' + SqlValue(FTipo) + ', ' + SqlValue(FOperativo) + ', '  +
                        SqlValue (FIdVisita) + ', ' + SqlValue (frmPrincipal.DBLogin.LoginName) + ', SYSDATE' +
          '            )';
  end;

  procedure GenerarSQLModif (IDDiagnostico: Integer);
  begin
    Sql := 'UPDATE pdr_diagporrec ' +
           '       SET dr_idvisita  = ' + SqlValue (FIdVisita) + ', ' +
           '           dr_fechamodif= SYSDATE, ' +
           '           dr_usumodif  = ' + SqlValue (frmPrincipal.DBLogin.LoginName) + ' ' +
           ' WHERE dr_cuit = ' + SqlValue(FCUIT) + ' ' +
           '   AND dr_estableci = ' + SqlInt(FEstableci) +
           '   AND dr_tipo = ' + SqlValue(FTipo) + ' ' +
           '   AND dr_operativo = ' + SqlValue(FOperativo) + ' ' +
           '   AND dr_diagnostico = ' + SqlValue(IDDiagnostico) + ' ' +
           '   AND dr_recomendacion = ' + edRecNumero.TextSql;
  end;

  procedure GenerarSQLBaja (IDDiagnostico: Integer);
  begin
    Sql := 'UPDATE pdr_diagporrec ' +
           '   SET dr_fechabaja= SYSDATE, ' +
           '       dr_usubaja  = ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ' ' +
           ' WHERE dr_cuit = ' + SqlValue(FCUIT) + ' ' +
           '   AND dr_estableci = ' + SqlInt(FEstableci) +
           '   AND dr_tipo = ' + SqlValue(FTipo) + ' ' +
           '   AND dr_operativo = ' + SqlValue(FOperativo) + ' ' +
           '   AND dr_diagnostico = ' + SqlValue(IDDiagnostico) + ' ' +
           '   AND dr_recomendacion = ' + edRecNumero.TextSql;
  end;

begin
  aCantidadChecked := 0;
  for i := 0 to cbDiagnosticos.Items.Count-1 do
    if cbDiagnosticos.Checked[i] then
      inc(aCantidadChecked);

  VerificarMultiple (['Registro de Recomendación',
                      edResponsableEjecucion,
                      (FTipoFormulario <> TIPO_FORMULARIO_PAPE) or
                      ((FTipoFormulario = TIPO_FORMULARIO_PAPE) and
                       (Trim(edResponsableEjecucion.Text) <> '')),
                      'Debe especificar el responsable de ejecución',
                      edRecDescripcion,
                      Trim(edRecDescripcion.Text) <> '',
                      'Debe especificar la Descripción de la Recomendación',
                      edRelCumplimiento,
                      IsValidDate (edRelCumplimiento.Text, 'DD/MM/YYYY'),
                      'Debe especificar la ' + lbRelCumplimiento.Caption,
                      edRelSeguimiento,
                      IsValidDate (edRelSeguimiento.Text, 'DD/MM/YYYY'),
                      'Debe especificar la ' + lbRelSeguimiento.Caption,
                      edRelCumplimiento,
                      edRelCumplimiento.Date <= edRelSeguimiento.Date,
                      'El rango de fechas es inválido',
                      edVisita,
                      Trim(edVisita.Text) <> '',
                      'Debe indicar la visita asociada',
                      fraPreventorRecomendacion,
                      fraPreventorRecomendacion.IsSelected,
                      'Debe indicar el preventor firmante',
                      cbDiagnosticos,
                      VerifyChecked or chkNoamerita.Checked,
                      'Debe especificar al menos un diagnóstico',
                      cbDiagnosticos,
                      aCantidadChecked <= 10,
                      'El límite de diagnósticos por recomendación es 10.'
                     ]);

  fechaVisita := ValorSqlDateTime('SELECT RV_FECHA FROM art.prv_resvisitas WHERE rv_id = '+SqlValue(FIdVisita));
  Verificar(fechaVisita > edRelCumplimiento.Date, edVisita, 'La fecha de visita no debe ser mayor a la fecha de cumplimiento.');
  Verificar(fechaVisita > edRelSeguimiento.Date, edVisita, 'La fecha de visita no debe ser mayor a la fecha de Seguimiento.');

  Sql :=
    ' SELECT 1 '+
    '   FROM hys.hvo_vigenciaoperativo '+
    '  WHERE vo_operativo = '+ SqlValue(FOperativo)+
    '    AND vo_tipo = '+SqlValue(FTipo)+
    '    AND vo_vigenciadesde < '+SqlDate(edRelCumplimiento.Date);

  with Getquery(Sql) do
  try
    Verificar( Fields[0].AsString <> '1' ,  edRelCumplimiento,'No puede ser la fecha menor a la vigencia del operativo.');
  finally
    Free;
  end;

  if (DaysBetween(edRelSeguimiento.Date,edRelCumplimiento.Date) > 30)
    and (MsgBox('La Diferencia entre las fechas es mayor a 1 mes ¿Desea Continuar?',  MB_ICONQUESTION + MB_YESNO, 'Guardar Datos') = IDNO) then
    begin
      Abort;
    end;

  if (edRelCumplimiento.Date <> ValorSqlDateTime('SELECT ''01/'' || TO_CHAR('+SqlDate(edRelCumplimiento.Date)+', ''mm/yyyy'') FROM DUAL')) or
     (edRelSeguimiento.Date  <> ValorSqlDateTime('SELECT LAST_DAY('+SqlDate(edRelSeguimiento.Date)+') FROM DUAL')) then
    MsgBox('Por favor (Usuario de carga), notifique al (coordinador), que las fechas de cumplimiento y verificación no cumplen con los criterios de 1er día y/o ultimo del mes, respectivamente. (detallar los puntos).',  MB_OK, 'Información');

  if (btnRecAceptar.Caption = TXT_AGREGAR) then
  begin

    if chkNoamerita.Checked then AgregarDiagnosticoNoAmerita;

    if ValorSql(' SELECT count(*) FROM PRE_RECOMENDACIONES '+
                  ' WHERE RE_CUIT = ' + SqlValue (FCUIT) +
                  '   AND RE_ESTABLECI = ' + SqlInt( FEstableci ) +
                  '   AND RE_TIPO = ' + SqlValue (FTipo) +
                  '   AND RE_OPERATIVO = ' + SqlValue (FOperativo)+
                  '   AND RE_FECHABAJA IS NULL ')= 0 THEN
    begin
        EjecutarSqlST(
                    ' INSERT INTO hys.hee_eventoempresa '+
                    '             (ee_id, ee_cuit, ee_establecimiento, ee_tipo, ee_operativo,'+
                    '              ee_idtipoevento, ee_observacion, ee_muestracuit, ee_fechaevento,'+
                    '              ee_fechaalta, ee_usualta, ee_usuario '+
                    '             )'+
                    '      VALUES (hys.seq_hee_id.NEXTVAL,'+SqlValue(FCUIT)+', '+
                                   SqlValue(FEstableci)+', '+SqlValue(FTipo)+', '+
                                   SqlValue(FOperativo)+', 16,'+ ''''',''N'', art.actualdate'+
                                   ',sysdate,'+SqlValue(Sesion.UserID)+','+SqlValue(Sesion.UserID)+')');
    end;


    edRecNumero.Value := IncSql('SELECT MAX(RE_RECOMENDACION) ' +
                                '  FROM PRE_RECOMENDACIONES ' +
                                ' WHERE RE_CUIT = ' + SqlValue (FCUIT) + ' ' +
                                '   AND RE_ESTABLECI = ' + SqlInt( FEstableci ) + ' ' +
                                '   AND RE_TIPO = ' + SqlValue (FTipo) + ' ' +
                                '   AND RE_OPERATIVO = ' + SqlValue (FOperativo));

    Sql:= 'INSERT INTO PRE_RECOMENDACIONES ' +
          '            (RE_CUIT, RE_ESTABLECI, RE_TIPO, RE_OPERATIVO, ' +
          '             RE_RECOMENDACION, RE_DESCRIPCION1, RE_DESCRIPCION2, ' +
          '             RE_CUMPLIMIENTO, RE_SEGUIMIENTO, RE_FECHAALTA, ' +
          '             RE_USUALTA, RE_RESPONSABLE, RE_IDVISITA, ' +
          '             RE_IDFIRMANTE, RE_NOAMERITA) ' +
          '     VALUES (' + SqlValue(FCUIT) +  ', ' + SqlInt(FEstableci) + ', ' + SqlValue(FTipo) + ', ' + SqlValue(FOperativo) + ', '  +
                        edRecNumero.TextSql + ', ' + SqlString(Copy(trim(edRecDescripcion.Text),0, 4000), True) + ', ' + SqlString(Copy(trim(edRecDescripcion.Text), 4001, 3900), True) + ', ' +
                        SqlDate (edRelCumplimiento.Date) + ', ' + SqlDate (edRelSeguimiento.Date) + ', SYSDATE, ' +
                        SqlValue (frmPrincipal.DBLogin.LoginName) + ', ' + SqlValue(edResponsableEjecucion.Text) + ', ' +
                        SqlValue (FIdVisita)  + ', ' + SqlValue (fraPreventorRecomendacion.Value) + ', ' +
                        SqlBoolean(chkNoamerita.Checked) +
          '            )';



  end
  else begin
    Sql:= 'UPDATE PRE_RECOMENDACIONES ' +
          '       SET RE_DESCRIPCION1 = ' + SqlString(Copy(trim(edRecDescripcion.Text),0, 4000), True) + ', ' +
          '           RE_DESCRIPCION2 = ' + SqlString(Copy(trim(edRecDescripcion.Text), 4001, 3900), True) + ', ' +
          '           RE_CUMPLIMIENTO = ' + SqlDate (edRelCumplimiento.Date) + ', ' +
          '           RE_SEGUIMIENTO  = ' + SqlDate (edRelSeguimiento.Date) + ', ' +
          '           RE_FECHAMODIF   = SYSDATE, ' +
          '           RE_RESPONSABLE  = ' + SqlValue(edResponsableEjecucion.Text) + ', ' +
          '           RE_USUMODIF     = ' + SqlValue (frmPrincipal.DBLogin.LoginName) + ', ' +
          '           RE_IDVISITA     = ' + SqlValue (FIdVisita) + ', ' +
          '           RE_IDFIRMANTE   = ' + SqlValue (fraPreventorRecomendacion.Value) + ', ' +
          '           RE_NOAMERITA    = ' + SqlBoolean(chkNoamerita.Checked) +
          ' WHERE RE_CUIT = ' + SqlValue(FCUIT) + ' ' +
          '   AND RE_ESTABLECI = ' + SqlInt(FEstableci) +
          '   AND RE_TIPO = ' + SqlValue(FTipo) + ' ' +
          '   AND RE_OPERATIVO = ' + SqlValue(FOperativo) + ' ' +
          '   AND RE_RECOMENDACION = ' + edRecNumero.TextSql;
 end;

  try
    EjecutarSqlST (Sql);
  except
    on E: Exception do ErrorMsg( E );
  end;

  // Analiza cada item del la lista de diagnósticos y procesa en consecuencia
  for i := 0 to cbDiagnosticos.Items.Count-1 do
  begin
    Sql := '';

    if (btnRecAceptar.Caption = TXT_AGREGAR) and cbDiagnosticos.Checked[i] then
      GenerarSQLAlta (Integer(cbDiagnosticos.Items.Objects[i])) // Alta
    else begin // Modificación
      // Analiza estado actual
      if cbDiagnosticos.Checked[i] then
      begin
        // Actualmente Seleccionado - Analiza estado previo
        if Integer(cbDiagnosticos.Items.Objects[i]) > 10000 then
          GenerarSQLModif (Integer(cbDiagnosticos.Items.Objects[i])-10000) // Previamente Seleccionado - Modificación
        else
          GenerarSQLAlta (Integer(cbDiagnosticos.Items.Objects[i])) // Previamente NO Seleccionado - Alta
      end
      else begin
        // Actualmente NO Seleccionado - Analiza estado previo
        if Integer(cbDiagnosticos.Items.Objects[i]) > 10000 then
          GenerarSQLBaja (Integer(cbDiagnosticos.Items.Objects[i])-10000) // Previamente Seleccionado - Baja
      end;
    end;

    if Sql <> '' then
      try
        EjecutarSqlST (Sql);
      except
        on E: Exception do ErrorMsg( E );
      end;
  end;

  RefreshAndLocate (sdqRecomendaciones, ['re_recomendacion'], [edRecNumero.TextSql]);

  if (not chkNoamerita.Checked)  and (FTipo = 'ET') then
  begin
    GuardarVisitaEnPlan(FCUIT,FEstableci,FTipo,FOperativo,edRelSeguimiento.Date,false,
                        edFechaPlanVisitas);
    CargarPlanVisitas;
  end;

  fpRecAMB.ModalResult := mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbRecNuevoClick(Sender: TObject);
var
  bExisteNFirmaPRS : Boolean;
  i : integer;
begin
  edRelCumplimiento.Clear;
  edRelSeguimiento.Clear;
  bExisteNFirmaPRS := False;
  for i:=0 to chkNivelFirmas.Count-1 do
  begin
    if chkNivelFirmas.Checked[i] then
    begin
      bExisteNFirmaPRS := True;
      break;
    end;
  end;
  Verificar(not bExisteNFirmaPRS and not cbSinFirmas.Checked, chkNivelFirmas, 'Debe especificar el nivel de firmas.');
  Verificar(bExisteNFirmaPRS and cbSinFirmas.Checked, cbSinFirmas, 'No puede estar marcado sin firma y firma a la vez');

  repeat
    FIdUltimaVisita := ValorSqlInteger ('SELECT MAX (rv.rv_id) rv_id ' +
                                        '  FROM art.prv_resvisitas rv ' +
                                        ' WHERE rv.rv_cuit = ' + SqlValue (FCUIT) +
                                        '   AND rv.rv_estableci = ' + SqlValue (FEstableci) +
                                        '   AND rv.rv_operativo = ' + SqlValue (FOperativo) +
                                        '   AND rv.rv_fechabaja IS NULL ' );
(*
                                        '   AND rv.rv_fecha = ' +
                                        '          (SELECT MAX (rv_fecha) ' +
                                        '             FROM art.prv_resvisitas ' +
                                        '            WHERE rv_cuit = rv.rv_cuit ' +
                                        '              AND rv_estableci = rv.rv_estableci ' +
                                        '              AND rv_operativo = rv.rv_operativo ' +
                                        '              AND rv_fechabaja IS NULL) '
                                       );
*)

    FIdVisita  := FIdUltimaVisita;
    chkNoamerita.Checked := false;
    edRecNumero.Text := '';
    edRecDescripcion.Lines.Clear;
    edResponsableEjecucion.Clear;
    edVisita.Text:= ValorSql (
                      'SELECT TO_CHAR (rv_fecha, ''DD/MM/YYYY'') || '' '' || rv_descripcion ' +
                      '  FROM art.prv_resvisitas ' +
                      ' WHERE rv_id = ' + SqlValue (FIdUltimaVisita)
                    );
    fraPreventorRecomendacion.Codigo := ValorSql (
                                          'SELECT rv_firmante ' +
                                          '  FROM art.prv_resvisitas ' +
                                          ' WHERE rv_id = ' + SqlValue (FIdUltimaVisita)
                                        );

    btnRecAceptar.Caption := TXT_AGREGAR;
    CargarComboDiagnosticos (Sender)
  until fpRecAMB.ShowModal <> mrOk
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbRecModificarClick(Sender: TObject);
begin
  if tBarRecomendaciones.Enabled and (not sdqRecomendaciones.IsEmpty) then begin
    FIdUltimaVisita := ValorSqlInteger ('SELECT MAX (rv.rv_id) rv_id ' +
                                        '  FROM art.prv_resvisitas rv ' +
                                        ' WHERE rv.rv_cuit = ' + SqlValue (FCUIT) +
                                        '   AND rv.rv_estableci = ' + SqlValue (FEstableci) +
                                        '   AND rv.rv_operativo = ' + SqlValue (FOperativo) +
                                        '   AND rv.rv_fechabaja IS NULL ' );
(*
                                        '   AND rv.rv_fecha = ' +
                                        '          (SELECT MAX (rv_fecha) ' +
                                        '             FROM art.prv_resvisitas ' +
                                        '            WHERE rv_cuit = rv.rv_cuit ' +
                                        '              AND rv_estableci = rv.rv_estableci ' +
                                        '              AND rv_operativo = rv.rv_operativo ' +
                                        '              AND rv_fechabaja IS NULL) '
                                       );
*)                                       

    FIdVisita  := sdqRecomendaciones.fieldbyname('re_idvisita').AsInteger;
    edRecNumero.Value      := sdqRecomendaciones.fieldbyname('re_recomendacion').AsInteger ;
    chkNoamerita.Checked   := (sdqRecomendaciones.fieldbyname('re_noamerita').AsString = 'S');
    edRecDescripcion.Text  := AdjustLineBreaks (sdqRecomendaciones.fieldbyname('re_descripcion1').AsString +
                                                sdqRecomendaciones.fieldbyname('re_descripcion2').AsString);
    edRelCumplimiento.Date := sdqRecomendaciones.fieldbyname('re_cumplimiento').AsDateTime ;
    edRelSeguimiento.Date  := sdqRecomendaciones.fieldbyname('re_seguimiento').AsDateTime ;
    edResponsableEjecucion.Text := sdqRecomendaciones.fieldbyname('re_responsable').AsString;
    edVisita.Text:= ValorSql (
                      'SELECT TO_CHAR (rv_fecha, ''DD/MM/YYYY'') || '' '' || rv_descripcion ' +
                      '  FROM art.prv_resvisitas ' +
                      ' WHERE rv_id = ' + SqlValue (FIdVisita)
                    );
    fraPreventorRecomendacion.Value := sdqRecomendaciones.fieldbyname('re_idfirmante').AsInteger;

    btnRecAceptar.Caption := TXT_MODIFICAR;
    CargarComboDiagnosticos (Sender);

    fpRecAMB.ShowModal ;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbRecEliminarClick(Sender: TObject);
Var Sql : String;
begin
     if sdqRecomendaciones.Active and (not sdqRecomendaciones.IsEmpty) then
        if MsgBox('¿Desea eliminar el registro seleccionado?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES Then
        begin
            Sql := 'UPDATE PRE_RECOMENDACIONES ' +
                   '   SET RE_FECHABAJA = SYSDATE, ' +
                   '       RE_USUBAJA = ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ' ' +
                   ' WHERE RE_CUIT = ' + SqlValue(FCUIT) + ' ' +
                   '   AND RE_ESTABLECI = ' + SqlInt(FEstableci) +
                   '   AND RE_TIPO = ' + SqlValue(FTipo) + ' ' +
                   '   AND RE_OPERATIVO = ' + SqlValue(FOperativo) + ' ' +
                   '   AND RE_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString ;
            Try
               EjecutarSqlST( Sql );
            except
               on E: Exception do
               begin
                 ErrorMsg( E );
                 Exit;
               end;
            end;

            if ValorSql(' SELECT count(*) FROM PRE_RECOMENDACIONES '+
                  ' WHERE RE_CUIT = '+ SqlValue (FCUIT) +
                  '   AND RE_ESTABLECI = ' + SqlInt( FEstableci ) +
                  '   AND RE_TIPO = ' + SqlValue (FTipo) +
                  '   AND RE_OPERATIVO = ' + SqlValue (FOperativo)+
                  '   AND RE_FECHABAJA IS NULL ')= 0 THEN
            BEGIN
              EjecutarSql(
              ' UPDATE hys.hee_eventoempresa '+
              '    SET EE_FECHABAJA = SYSDATE, '+
              '        EE_USUBAJA = ' + SqlValue(frmPrincipal.DBLogin.LoginName)+
              '  WHERE ee_cuit = '+SqlValue (FCUIT) +
              '    AND ee_establecimiento = '+ SqlInt( FEstableci ) +
              '    AND ee_tipo = '+  SqlValue (FTipo) +
              '    AND ee_operativo = '+ SqlValue (FOperativo) +
              '    AND EE_FECHABAJA IS NULL '+
              '    AND ee_idtipoevento = 16');

            END;

            Sql := 'UPDATE PDR_DIAGPORREC ' +
                   '   SET DR_FECHABAJA = SYSDATE, ' +
                   '       DR_USUBAJA = ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ' ' +
                   ' WHERE DR_CUIT = ' + SqlValue(FCUIT) + ' ' +
                   '   AND DR_ESTABLECI = ' + SqlInt(FEstableci) +
                   '   AND DR_TIPO = ' + SqlValue(FTipo) + ' ' +
                   '   AND DR_OPERATIVO = ' + SqlValue(FOperativo) + ' ' +
                   '   AND DR_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString ;

            Try
               EjecutarSqlST( Sql );
               tbRecRefrescarClick( Nil );
            except
               on E: Exception do ErrorMsg( E );
            end;
        end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbRecOrdenarClick(Sender: TObject);
begin
     sdRecomendaciones.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbRecExportarClick(Sender: TObject);
begin
     edRecomendaciones.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbRecImprimirClick(Sender: TObject);
Var sSql : String;
begin
  if frmFet.PrintDialog.Execute Then begin
        sRepLastNroRec := '';
        qpRepRecomendaciones.SubTitle.Lines.Clear;
        qpRepRecomendaciones.SubTitle.Lines.Add( FTipoDescripcion );
        qpRepRecomendaciones.SubTitle.Lines.Add( FCUIT + ' - ' + FContrato + ' - ' + FRazonSocial);
        qpRepRecomendaciones.SubTitle.Lines.Add( 'Establecimiento: ' +  IntToStr( FEstableci ));
        qpRepRecomendaciones.SubTitle.Lines.Add( 'Operativo: ' +  FOperativo );

        sdqRepRecomendaciones.Close;

//        sSql := 'SELECT RE_RECOMENDACION, RE_DESCRIPCION1 || RE_DESCRIPCION2 DESCRIPCION, RE_CUMPLIMIENTO, ' +
//        sSql := 'SELECT RE_RECOMENDACION, RE_DESCRIPCION1 DESCRIPCION, RE_CUMPLIMIENTO, RE_DESCRIPCION2, ' +
        sSql := 'SELECT RE_RECOMENDACION, RE_DESCRIPCION1, RE_CUMPLIMIENTO, RE_DESCRIPCION2, ' +
                       'RE_SEGUIMIENTO, RV_FECHA, RE_RESPONSABLE, ' +
                       'RE_IDVISITA, RE_IDFIRMANTE, ' +
                       'DECODE(RV_TIPO_VISITA, ''C'', ''Cumplimiento'', ''I'', ''Incumplimiento'', ''S'', ''Seguimiento'', ''T'', ''Cumpl.Tardío'', ''V'', ''Visita'') TIPO_VISITA ' +
                  'FROM PRE_RECOMENDACIONES, PRV_RECVISITAS ' +
                 'WHERE RE_CUIT = RV_CUIT (+) ' +
                   'AND RE_TIPO = RV_TIPO (+) ' +
                   'AND RE_OPERATIVO = RV_OPERATIVO (+) ' +
                   'AND RE_RECOMENDACION = RV_RECOMENDACION (+) ' +
                   'AND RE_FECHABAJA IS NULL ' +
                   'AND RV_FECHABAJA(+) IS NULL ' +
                   'AND RE_CUIT = ''' + FCuit + ''' ' +
                   'AND RE_TIPO = ''' + FTipo + ''' ' +
                   'AND RE_OPERATIVO = ''' + FOperativo + ''' ' ;


           sSql := sSql + 'AND RE_ESTABLECI = ' + SqlNumber(FEstableci) + ' ' +
                          'AND RE_ESTABLECI = RV_ESTABLECI (+) ';

        OpenQuery( sdqRepRecomendaciones, sSql + ' ORDER BY RE_RECOMENDACION, RV_FECHA' );


        qpRepRecomendaciones.Footer.Text := frmPrincipal.DBLogin.Usuario ;
        qpRepRecomendaciones.Print ;

        sdqRepRecomendaciones.Close;
{
        qpRecomendaciones.SubTitle.Text      := FCUIT + ' - ' + FContrato + ' - ' + FRazonSocial;
        qpRecomendaciones.Footer.Text := frmPrincipal.DBLogin.Usuario ;
        qpRecomendaciones.Print ;
}
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.sdqRecomendacionesAfterScroll(DataSet: TDataSet);
Var Sql : String;
begin
     if sdqRecomendaciones.IsEmpty Then begin
        sdqRelaciones.Close;
        sdqVisitas.Close;
     end else
     Try
         Sql := 'SELECT ROWNUM, DE_DESCRIPCION1, DR_DIAGNOSTICO  ' +
                  'FROM PDR_DIAGPORREC, PDE_DIAGESTABLECI ' +
                 'WHERE DR_CUIT = DE_CUIT ' +
                  ' AND DR_ESTABLECI = DE_ESTABLECI ' +
                  ' AND DR_TIPO = DE_TIPO ' +
                  ' AND DR_OPERATIVO = DE_OPERATIVO ' +
                  ' AND DR_DIAGNOSTICO = DE_DIAGNOSTICO ' +
                  ' AND DR_CUIT = ''' + FCUIT +  '''' +
                  ' AND DR_ESTABLECI = ' + SqlInt( FEstableci ) +
                  ' AND DR_TIPO = ''' + FTipo + ''' ' +
                  ' AND DR_OPERATIVO = ''' + FOperativo + ''' ' +
                  ' AND DR_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString +
                  ' AND DR_FECHABAJA IS NULL ';
         // ' ORDER BY PDR_DIAGPORREC.ROWID'
        OpenQuery(sdqRelaciones, Sql);

        Sql := 'SELECT RV_CUIT, RV_ESTABLECI, RV_RECOMENDACION, RV_TIPO_VISITA, ' +
                      'TB_DESCRIPCION TIPO, RV_FECHA, RV_FECHAALTA, RV_USUALTA ' +
                 'FROM CTB_TABLAS, PRV_RECVISITAS ' +
                'WHERE RV_FECHABAJA IS NULL ' +
                  'AND TB_CLAVE = ''TVISI'' ' +
                  'AND TB_CODIGO = RV_TIPO_VISITA ' +
                 ' AND RV_CUIT = ''' + FCUIT +  '''' +
                 ' AND RV_ESTABLECI = ' + SqlInt( FEstableci ) +
                 ' AND RV_TIPO = ''' + FTipo + ''' ' +
                 ' AND RV_OPERATIVO = ''' + FOperativo + ''' ' +
                 ' AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString  +
                 iif(sdVisitas.OrderBy = '', ' ORDER BY RV_FECHA DESC ', sdVisitas.OrderBy);
        OpenQuery(sdqVisitas, Sql);
     Except
        on E: Exception do ErrorMsg(E);
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.UpdateDiagPorRec;
Var Sql : String;
begin
    Sql := 'UPDATE PRE_RECOMENDACIONES ' +
              'SET RE_FECHAMODIF = SYSDATE, ' +
                  'RE_USUMODIF = ''' + frmPrincipal.DBLogin.LoginName + ''' ' +
            'WHERE RE_CUIT = ''' + FCUIT +  '''' +
              'AND RE_ESTABLECI = ' + SqlInt( FEstableci ) +
              'AND RE_TIPO = ''' + FTipo + ''' ' +
              'AND RE_OPERATIVO = ''' + FOperativo + ''' ' +
              'AND RE_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString ;

    EjecutarSqlST( Sql );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.SetCuit(const Value: String);
begin
  if (FCUIT <> Value) Then begin
    FCUIT := Value;
    Limpiar;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.SetEstableci(const Value: Integer);
begin
     if (FEstableci <> Value) Then begin
         FEstableci := Value;
         Limpiar;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.pcTipoPRSChange(Sender: TObject);
Const
     IMG_CHECKED   = 7;
     IMG_UNCHECKED = 8;
begin
//        tsPorEstablecimiento.ImageIndex := IMG_CHECKED;
//        tsIdentico.ImageIndex           := IMG_UNCHECKED;
        pnlVisitas.Parent               := tsVisitas;
        dbgRecomendaciones.Parent       := pnlRecomendaciones;
        dbgRecomendaciones.Color        := clWindow;
        dbgRecomendaciones.OnDblClick   := tbRecModificarClick;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.pcTipoPRSChanging(Sender: TObject; var AllowChange: Boolean);
begin
        AllowChange := sdqDiagnostico.IsEmpty and sdqRecomendaciones.IsEmpty
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.FormCreate(Sender: TObject);
begin
  SetTipoFormulario(TIPO_FORMULARIO_PRS);

  with fraPreventorRecomendacion do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_codigo';
    FieldBaja := 'it_fechabaja';
    CaseSensitive := false;
  end;
  chkNivelFirmas.Clear;
  with GetQuery(' SELECT * ' +
                  ' FROM HYS.HFF_TIPOFIRMA ' +
                  ' WHERE FF_FECHABAJA IS NULL AND FF_TIPO LIKE ''%PRS%'' ') do
  try
    while not Eof do
    begin
      chkNivelFirmas.AddItem(FieldByName('FF_DESCRIPCION').AsString, TObject(FieldByName('FF_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.Save;
//Var Sql : String;
begin
(*
     if fraEstableciIdentico.edCodigo.Value <> fraEstableciIdentico.Tag Then
     Try
//        dmPrincipal.sdbPrincipal.StartTransaction;
        if (fraEstableciIdentico.edCodigo.Value <> 0) Then begin
           //-----------------------------------------------------------------------------------------------------------
           Sql := 'SELECT FFF.GET_NRO_PRS(''' + FCUIT + ''', ' + fraEstableciIdentico.edCodigo.TextSql + ', ''' + FTipo + ''', ''' + FOperativo + ''' ) FROM DUAL';
           if (ValorSql(Sql) = '') Then begin
              // Marca los registros como modificados para que se exporte el nro de PRS
              Sql := 'UPDATE PDE_DIAGESTABLECI ' +
                     'SET DE_FECHAMODIF = SYSDATE, ' +
                         'DE_USUMODIF = ''' + frmPrincipal.DBLogin.LoginName + ''' ' +
                   'WHERE DE_CUIT = ''' + FCUIT + ''' ' +
                     'AND DE_ESTABLECI = ' + fraEstableciIdentico.edCodigo.TextSql +
                     'AND DE_TIPO = ''' + FTipo + ''' ' +
                     'AND DE_OPERATIVO = ''' + FOperativo + ''' ' ;
              EjecutarSqlST( Sql );

              Sql := 'UPDATE PRE_RECOMENDACIONES ' +
                     'SET RE_FECHAMODIF = SYSDATE, ' +
                         'RE_USUMODIF = ''' + frmPrincipal.DBLogin.LoginName + ''' ' +
                   'WHERE RE_CUIT = ''' + FCUIT + ''' ' +
                     'AND RE_ESTABLECI = ' + fraEstableciIdentico.edCodigo.TextSql +
                     'AND RE_TIPO = ''' + FTipo + ''' ' +
                     'AND RE_OPERATIVO = ''' + FOperativo + ''' ' ;
              EjecutarSqlST( Sql );
           end;
           Sql := 'SELECT 1 FROM PPI_PRS_IDENTICOS ' +
                   'WHERE PI_CUIT = ''' + FCUIT + ''' ' +
                     'AND PI_ESTABLECI = ' + SqlInt( FEstableci ) + ' ' +
                     'AND PI_TIPO = ''' + FTipo + ''' ' +
                     'AND PI_OPERATIVO = ''' + FOperativo + ''' ' ;
           if ExisteSql(Sql) Then begin
               Sql := 'UPDATE PPI_PRS_IDENTICOS ' +
                         'SET PI_IDENTICO = ' + fraEstableciIdentico.edCodigo.TextSql + ', ' +
                             'PI_FECHAMODIF = SYSDATE, ' +
                             'PI_USUMODIF = ''' + frmPrincipal.DBLogin.LoginName + ''', ' +
                             'PI_FECHABAJA = NULL, ' +
                             'PI_USUBAJA = NULL ' +
                       'WHERE PI_CUIT = ''' + FCUIT + ''' ' +
                         'AND PI_ESTABLECI = ' + SqlInt( FEstableci ) + ' ' +
                         'AND PI_TIPO = ''' + FTipo + ''' ' +
                         'AND PI_OPERATIVO = ''' + FOperativo + ''' ' ;
               EjecutarSqlST( Sql );
           end else begin
               Sql := 'INSERT INTO PPI_PRS_IDENTICOS (PI_CUIT, PI_ESTABLECI, PI_TIPO, PI_OPERATIVO, PI_IDENTICO, PI_FECHAALTA, PI_USUALTA) ' +
                      'VALUES (''' + FCUIT + ''', ' + SqlInt( FEstableci ) + ', ''' + FTipo + ''', ''' + FOperativo + ''', ' + fraEstableciIdentico.edCodigo.TextSql + ', ' +
                             'SYSDATE, ''' + frmPrincipal.DBLogin.LoginName + ''')';
               EjecutarSqlST( Sql );
           end;
           //-----------------------------------------------------------------------------------------------------------
        end else if (fraEstableciIdentico.Tag <> 0) and (fraEstableciIdentico.edCodigo.Value = 0) Then begin
               Sql := 'UPDATE PPI_PRS_IDENTICOS ' +
                         'SET PI_FECHABAJA = SYSDATE, ' +
                             'PI_USUBAJA = ''' + frmPrincipal.DBLogin.LoginName + ''' ' +
                       'WHERE PI_CUIT = ''' + FCUIT + ''' ' +
                         'AND PI_ESTABLECI = ' + SqlInt( FEstableci ) + ' ' +
                         'AND PI_TIPO = ''' + FTipo + ''' ' +
                         'AND PI_OPERATIVO = ''' + FOperativo + ''' ' ;
               EjecutarSqlST( Sql );
        end;
//        dmPrincipal.sdbPrincipal.Commit ;
        fraEstableciIdentico.Tag      := fraEstableciIdentico.edCodigo.Value;
        fraEstableciIdentico.Modified := False;
           //-----------------------------------------------------------------------------------------------------------
     Except
        on E: Exception do begin
//           dmPrincipal.sdbPrincipal.Rollback ;
           Raise Exception.Create( E.Message + #13 + 'Error al guardar los cambios del PRS Identico.');
        end;
     end;
     pnlIdentDatos.Enabled         := Not fraEstableciIdentico.IsEmpty ;
     *)
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.prItemsRecChange(Sender: TObject);
begin
(*
     With sccRecomendaciones.ShortCuts do
          if prItemsRec.ActivePageIndex = 0 Then begin
             ItemsByShortCut[ 16449 ].OnShortCutPress := tbRelAgregarClick;
             ItemsByShortCut[ 16460 ].OnShortCutPress := tbRelEliminarClick;
          end else begin
             ItemsByShortCut[ 16449 ].OnShortCutPress := tbVisAgregarClick;
             ItemsByShortCut[ 16460 ].OnShortCutPress := tbVisAgregarClick;
          end;
*)
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbVisAgregarClick(Sender: TObject);
begin
  if dbgRecomendaciones.SelectedRows.Count > 0 then begin
    cmbVisTipo.ItemIndex := 0;

    FIdUltimaVisita := ValorSqlInteger ('SELECT MAX (rv.rv_id) rv_id ' +
                                        '  FROM art.prv_resvisitas rv ' +
                                        ' WHERE rv.rv_cuit = ' + SqlValue (FCUIT) +
                                        '   AND rv.rv_estableci = ' + SqlValue (FEstableci) +
                                        '   AND rv.rv_operativo = ' + SqlValue (FOperativo) +
                                        '   AND rv.rv_fechabaja IS NULL ' );

    edVisFecha.Date      := ValorSqlDateTime (
                              'SELECT rv_fecha ' +
                              '  FROM art.prv_resvisitas ' +
                              ' WHERE rv_id = ' + SqlValue (FIdUltimaVisita)
                            );

    if fpVisitas.ShowModal = mrOk Then
      sdqVisitas.Refresh ;
  end;
  //       RefreshAndLocate(sdqVisitas, ['RV_TIPO_VISITA', 'RV_FECHA'], [GetChar(cmbVisTipo.Text);, edVisFecha.Text])
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbVisQuitarClick(Sender: TObject);
Var Sql : String;
begin
  Try
    Sql := 'UPDATE PRV_RECVISITAS ' +
              'SET RV_USUBAJA = ''' + frmPrincipal.DBLogin.LoginName + ''', ' +
                  'RV_FECHABAJA = SYSDATE ' +
            'WHERE RV_CUIT = ''' + FCUIT + '''' +
             ' AND RV_ESTABLECI = ' + SqlInt( FEstableci ) +
             ' AND RV_TIPO = ''' + FTipo + ''' ' +
             ' AND RV_OPERATIVO = ''' + FOperativo + ''' ' +
             ' AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString +
             ' AND RV_TIPO_VISITA = ''' + sdqVisitas.FieldByName('RV_TIPO_VISITA').AsString + '''' +
             ' AND RV_FECHA = ' + SqlDate(sdqVisitas.FieldByName('RV_FECHA').AsDateTime);
    EjecutarSqlST( Sql );
    sdqVisitas.Refresh ;
  Except
    on E: Exception do ErrorMsg(E);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.btnVisAceptarClick(Sender: TObject);
Var Sql,
    Sql2    : String;
    i       : Integer;
    VisTipo : Char;
begin
  VerificarMultiple (['Registro de Visita',
                      edVisFecha,
                      IsValidDate (edVisFecha.Text, 'DD/MM/YYYY'),
                      'Debe especificar la fecha de la visita',
                      edVisFecha,
                      edVisFecha.Date <= DBDateTime,
                      'La fecha no puede ser posterior a la fecha actual'
                     ]);

  try
    for i := 0 to dbgRecomendaciones.SelectedRows.Count -1 do
    begin

        sdqRecomendaciones.GotoBookmark( Pointer(dbgRecomendaciones.SelectedRows.Items[i]) );
        //VisTipo := cmbVisTipo.Value[1];
        VisTipo := GetVisitaCorrecta(FCUIT, FEstableci, FTipo, FOperativo,
                                     sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsInteger,
                                     edVisFecha.Date, cmbVisTipo.Value[1])[1];

        Sql := 'SELECT 1 FROM PRV_RECVISITAS ' +
               ' WHERE RV_CUIT = ' + SqlValue(FCUIT) +
               '   AND RV_ESTABLECI = ' + SqlInt( FEstableci ) +
               '   AND RV_TIPO = ' + SqlValue(FTipo) +
               '   AND RV_OPERATIVO = ' + SqlValue(FOperativo) +
               '   AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString +
               '   AND RV_FECHABAJA IS NULL ';

        if (VisTipo = 'C') or (VisTipo = 'T') then
          Sql := Sql + ' AND (RV_TIPO_VISITA <> ' + SqlValue(VisTipo) + ' AND RV_FECHA > ' + SqlDate (edVisFecha.Date) + ') '
      (*Pablo 26/12/2006
          Sql := Sql + ' AND ((RV_TIPO_VISITA <> ' + SqlValue(VisTipo) + ' AND RV_FECHA > ' + SqlValue (edVisFecha.Date)+ ') ' +
                       'OR (RV_TIPO_VISITA = ' + SqlValue(VisTipo) + ')) '
      *)
        else
          Sql := Sql + ' AND RV_TIPO_VISITA = ' + SqlValue(VisTipo);


        Sql2 := 'SELECT 1 FROM PRV_RECVISITAS' +
                ' WHERE RV_CUIT = ' + SqlValue(FCUIT) +
                '   AND RV_ESTABLECI = ' + SqlInt( FEstableci ) +
                '   AND RV_TIPO = ' + SqlValue(FTipo) +
                '   AND RV_OPERATIVO = ' + SqlValue(FOperativo) +
                '   AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString +
                '   AND RV_TIPO_VISITA = ''I''' +
                '   AND RV_FECHABAJA IS NULL';

        if cmbVisTipo.ItemIndex = -1 then
          InvalidMsg(cmbVisTipo, 'Debe seleccionar el Tipo de Seguimiento')

        else
          if ((VisTipo = 'C') or (VisTipo = 'T')) and ExisteSql( Sql ) then
            InvalidMsg(cmbVisTipo, 'No se puede seleccionar un tipo "' + copy(cmbVisTipo.Text, 3, Length(cmbVisTipo.Text))  +
                                   '" cuando hay visitas posteriores o cuando ya se ha cumplido' )
          else
            if ((VisTipo = 'C') or (VisTipo = 'T')) and not ExisteSql( Sql2 ) then
              InvalidMsg(cmbVisTipo, 'No se puede seleccionar un tipo "' + copy(cmbVisTipo.Text, 3, Length(cmbVisTipo.Text)) +
                                      '" cuando no existe una denuncia de incumplimiento' )

      { By Fede 10/05/2002
           else if (VisTipo <> 'C') and ExisteSql( Sql ) Then
              InvalidMsg(cmbVisTipo, 'No se puede seleccionar un tipo "' + cmbVisTipo.Text + '" cuando hay un cumplimiento' )
      }
            else
              if (FTipoFormulario = TIPO_FORMULARIO_PAPE) and
                 (ExisteSql('SELECT 1 FROM PRV_RECVISITAS ' +
                            ' WHERE RV_CUIT = ' + SqlValue(FCUIT) +
                            '   AND RV_ESTABLECI = ' + SqlInt( FEstableci ) +
                            '   AND RV_TIPO = ' + SqlValue(FTipo) +
                            '   AND RV_OPERATIVO = ' + SqlValue(FOperativo) +
                            '   AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('re_recomendacion').AsString +
                            '   AND RV_FECHABAJA IS NULL' +
                            '   AND RV_FECHA = ' + SqlDate (edVisFecha.Date))) then
                InvalidMsg(edVisFecha, 'Ya existe una visita en esa fecha')
              else begin
                    Sql := 'SELECT NVL(TO_CHAR(RV_FECHABAJA), ''EXISTE'') ' +
                           '  FROM PRV_RECVISITAS ' +
                           ' WHERE RV_CUIT = ' + SqlValue(FCUIT) +
                           '   AND RV_ESTABLECI = ' + SqlInt(FEstableci) +
                           '   AND RV_TIPO = ' + SqlValue(FTipo) +
                           '   AND RV_OPERATIVO = ' + SqlValue(FOperativo) +
                           '   AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('re_recomendacion').AsString +
                           '   AND RV_TIPO_VISITA = ' + SqlValue (VisTipo) +
                           '   AND RV_FECHA = ' + SqlDate(edVisFecha.Date);
                    Sql := ValorSql(Sql);

                    if Sql = 'EXISTE' then
                      MsgBox('El registro ya ha sido cargado para la recomendación ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString)
                    else
                      if ((VisTipo = 'S') or (VisTipo = 'V')) and
                        (ValorSQL('SELECT rv_tipo_visita ' +
                                  '  FROM prv_recvisitas v1 ' +
                                  ' WHERE rv_cuit = ' + SqlValue(FCUIT) +
                                  '   AND rv_estableci = ' + SqlInt(FEstableci) +
                                  '   AND rv_tipo = ' + SqlValue(FTipo) +
                                  '   AND rv_operativo = ' + SqlValue(FOperativo) +
                                  '   AND rv_recomendacion = ' + sdqRecomendaciones.fieldbyname('re_recomendacion').AsString +
                                  '   AND rv_fechabaja IS NULL ' +
                                  '   AND rv_fecha = ' +
                                  '          (SELECT MAX (v2.rv_fecha) ' +
                                  '             FROM prv_recvisitas v2 ' +
                                  '            WHERE v2.rv_cuit = v1.rv_cuit ' +
                                  '              AND v2.rv_estableci = v1.rv_estableci ' +
                                  '              AND v2.rv_tipo = v1.rv_tipo ' +
                                  '              AND v2.rv_operativo = v1.rv_operativo ' +
                                  '              AND v2.rv_recomendacion = v1.rv_recomendacion ' +
                                  '              AND v2.rv_fechabaja IS NULL) '
                                 ) = 'I') then
                        MsgBox( 'No se puede asignar el tipo "' + copy(cmbVisTipo.Text, 3, Length(cmbVisTipo.Text)) +
                                '" cuando existe una denuncia de incumplimiento previo')
                      else begin
                        if Sql <> '' then
                          Sql := 'UPDATE PRV_RECVISITAS ' +
                                 '   SET RV_USUALTA = ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
                                 '       RV_FECHAALTA = SYSDATE, ' +
                                 '       RV_USUBAJA = NULL, ' +
                                 '       RV_FECHABAJA = NULL ' +
                                 ' WHERE RV_CUIT = ' + SqlValue(FCUIT) +
                                 '   AND RV_ESTABLECI = ' + SqlInt(FEstableci) +
                                 '   AND RV_TIPO = ' + SqlValue(FTipo) +
                                 '   AND RV_OPERATIVO = ' + SqlValue(FOperativo) +
                                 '   AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString +
                                 '   AND RV_TIPO_VISITA = ' + SqlValue(VisTipo) +
                                 '   AND RV_FECHA = ' + SqlDate(edVisFecha.Date)
                        else
                          Sql := 'INSERT INTO PRV_RECVISITAS ' +
                                 '       (RV_CUIT, ' +
                                 '        RV_ESTABLECI, ' +
                                 '        RV_TIPO, ' +
                                 '        RV_OPERATIVO, ' +
                                 '        RV_RECOMENDACION, ' +
                                 '        RV_TIPO_VISITA, ' +
                                 '        RV_FECHA, ' +
                                 '        RV_FECHAALTA, ' +
                                 '        RV_USUALTA) ' +
                                 'VALUES (' +
                                          SqlValue(FCUIT) + ', ' +
                                          SqlInt(FEstableci) + ', ' +
                                          SqlValue(FTipo) + ', ' +
                                          SqlValue(FOperativo) + ', ' +
                                          sdqRecomendaciones.FieldByName('RE_RECOMENDACION').AsString + ', ' +
                                          SqlValue(VisTipo) + ', ' +
                                          SqlDate (edVisFecha.Date) + ', ' +
                                 '        SYSDATE, ' +
                                          SqlValue(frmPrincipal.DBLogin.LoginName) +
                                        ')';

                        EjecutarSqlST( Sql );
                      end;
                  end;
      end;
    except
      on E: Exception do begin
        ErrorMsg(E, 'Error al guardar los datos');
      end;
    end;
    fpVisitas.ModalResult := mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.tbVisOrdenarClick(Sender: TObject);
begin
     sdVisitas.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.qpRepRecomendacionesGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
     if sRepLastNroRec = sdqRepRecomendaciones.FieldByName('RE_RECOMENDACION').AsString Then begin
        if AreIn(Field.Field.FieldName, ['RE_RECOMENDACION', 'DESCRIPCION', 'RE_CUMPLIMIENTO', 'RE_SEGUIMIENTO']) Then begin
           AText       := '';
           //ABackground := clWhite;
        end;
     end else begin
        if Field.DataField = 'RV_FECHA' Then
           sRepLastNroRec := sdqRepRecomendaciones.FieldByName('RE_RECOMENDACION').AsString;
     end;

(*

     if (sRepLastNroRec <> sdqRepRecomendaciones.FieldByName('RE_RECOMENDACION').AsString)
        and (Field.Field.FieldName = 'DESCRIPCION') then
     begin
         AText := AText + sdqRepRecomendaciones.FieldByName('RE_DESCRIPCION2').AsString;
     end;

     if Length(AText) > 900 then
     begin
        AFont.Size :=  AFont.Size -1;
     end;
*)
     if IsPair( iRepRecNro ) Then
        ABackground := $00E0E0E0
     else
        ABackground := $00EFEFEF; //$00F2F2F2;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.sdqRepRecomendacionesAfterScroll(DataSet: TDataSet);
begin
   if sRepLastNroRec <> sdqRepRecomendaciones.FieldByName('RE_RECOMENDACION').AsString Then
      Inc(iRepRecNro);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPRS.sdqRepRecomendacionesCalcFields(DataSet: TDataSet);
begin
    DataSet.FieldByName('DESCRIPCION').AsString :=
            DataSet.FieldByName('RE_DESCRIPCION1').AsString + DataSet.FieldByName('RE_DESCRIPCION2').AsString;
end;

procedure TfrmPRS.SetTipoFormulario(const Value: integer);
begin
  if Value = TIPO_FORMULARIO_PRS then
  begin
    VCLExtra.LockControls([edPuestoTrabajo, edTrabajadoresExpuestos, edResponsableEjecucion], true);
    dbgDiagnostico.ColumnByField['DE_SECTOREMPRESA'].Visible := false;
    dbgDiagnostico.ColumnByField['DE_TRABAJADORESEXPUESTOS'].Visible := false;
    dbgRecomendaciones.ColumnByField['RE_RESPONSABLE'].Visible := false;
    if not (cmbDiagTipo.Items.Count > 2) then
      cmbDiagTipo.Items.Add('Enfermedad Profesional');
    pnlPlanVisitas.Visible := true;
  end
  else begin
    VCLExtra.LockControls([edPuestoTrabajo, edTrabajadoresExpuestos, edResponsableEjecucion], false);
    dbgDiagnostico.ColumnByField['DE_SECTOREMPRESA'].Visible := true;
    dbgDiagnostico.ColumnByField['DE_TRABAJADORESEXPUESTOS'].Visible := true;
    dbgRecomendaciones.ColumnByField['RE_RESPONSABLE'].Visible := true;
    pnlPlanVisitas.Visible := false;
    if (cmbDiagTipo.Items.Count > 2) then
      cmbDiagTipo.Items.Delete(2);
  end;
  FTipoFormulario := Value;
  CargarComboVisitas;
end;

procedure TfrmPRS.CargarComboVisitas;
begin
  cmbVisTipo.Items.Clear;
  cmbVisTipo.Items.Add('C=Cumplimiento');
  cmbVisTipo.Items.Add('I=Incumplimiento');

(*
  cmbVisTipo.Items.Clear;
  if (FTipoFormulario = TIPO_FORMULARIO_PRS) then
  begin
    cmbVisTipo.Items.Add('S=Seguimiento');
    cmbVisTipo.Items.Add('C=Cumplimiento');
    cmbVisTipo.Items.Add('I=Incumplimiento');
  end
  else begin
    cmbVisTipo.Items.Add('V=Visita');
    cmbVisTipo.Items.Add('I=Incumplimiento');
    cmbVisTipo.Items.Add('T=Cumplimiento Tardío');
  end;
*)
end;

procedure TfrmPRS.btnBuscarVisitasClick(Sender: TObject);
var
  format :TFormatSettings;
begin
  format.DateSeparator := '/';
  format.ShortDateFormat := 'dd/mm/yyyy';
  with TfrmConsVisitasRealizadas.Create(self) do
  try
    Init (FCUIT, FEstableci, FOperativo, FTipo, True);

    if ShowModal = mrOk then
    begin
      fraPreventorRecomendacion.Codigo := FFirmanteVisitaSeleccionada;
      FIdVisita := FIdVisitaSeleccionada;
      edVisita.Text := DateToStr(FFechaVisitaSeleccionada,format) + ' ' + FDescripcionVisitaSeleccionada;
    end
  finally
    Free
  end;
end;

procedure TfrmPRS.CargarComboDiagnosticos (Sender: TObject);
begin
  cbDiagnosticos.Items.Clear;

  with qryDiagnosticos do
  begin
    ParamByName ('fcuit').Value := FCUIT;
    ParamByName ('festableci').Value := FEstableci;
    ParamByName ('ftipo').Value := FTipo;
    ParamByName ('foperativo').Value := FOperativo;
    ParamByName ('frecomendacion').Value := edRecNumero.Value;

    Open;
    while not EoF do
    begin
      cbDiagnosticos.Items.AddObject(FieldByName('de_descripcion1').AsString, TObject(FieldByName('checked').AsInteger));
      cbDiagnosticos.Checked [cbDiagnosticos.Items.Count-1] := FieldByName ('checked').AsInteger > 10000;

      Next
    end;
    Close
  end
end;

procedure TfrmPRS.dbgRecomendacionesCellClick(Column: TColumn);
begin
  dbgRecomendaciones.Hint := sdqRecomendaciones.FieldByName('RE_DESCRIPCION1').AsString
end;

function TfrmPRS.VerifyChecked: boolean;
var
  i: integer;
begin
  i:=0;
  while (i<= cbDiagnosticos.Items.Count-1) and (not cbDiagnosticos.Checked[i]) do
    i:= i + 1;
  result := (i<= cbDiagnosticos.Items.Count-1);
end;

procedure TfrmPRS.fraPreventorRecomendacioncmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraPreventorRecomendacion.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorRecomendacion.cmbDescripcion.Text)[1] <> '%') then
      fraPreventorRecomendacion.cmbDescripcion.Text := '%' + fraPreventorRecomendacion.cmbDescripcion.Text;
  fraPreventorRecomendacion.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventorRecomendacion.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorRecomendacion.cmbDescripcion.Text)[1] = '%') then
      fraPreventorRecomendacion.cmbDescripcion.Text := copy(fraPreventorRecomendacion.cmbDescripcion.Text, 2, length(fraPreventorRecomendacion.cmbDescripcion.Text));
end;

procedure TfrmPRS.AgregarDiagnosticoNoAmerita;
var
 Sql: String;
begin
  Sql := 'INSERT INTO PDE_DIAGESTABLECI ' +
         '(DE_CUIT, DE_ESTABLECI, DE_TIPO, DE_OPERATIVO, DE_DIAGNOSTICO, DE_TIPO_DIAGNOSTICO, ' +
         'DE_DESCRIPCION1, DE_DESCRIPCION2, DE_SECTOREMPRESA, DE_TRABAJADORESEXPUESTOS, DE_FECHAALTA, DE_USUALTA) ' +
         'VALUES (''' + FCUIT +  ''', ' + SqlInt( FEstableci ) + ', ''' + FTipo + ''', ''' + FOperativo + ''', ' + SqlInt(cbDiagnosticos.Items.Count+1) + ',' +
          SqlString('R', true) + ',' + SqlString(trim(edRecDescripcion.Text), true) + ', NULL, ';

  if (FTipo = 'EP') then
    Sql := Sql + SqlValue(0)  + ', ' + SqlValue(0)  + ', '
  else
    Sql := Sql + ' NULL, NULL, ';

  Sql := Sql + 'SYSDATE, ''' + frmPrincipal.DBLogin.LoginName + ''') ';

  EjecutarSqlST(Sql);

  CargarComboDiagnosticos(self);
  cbDiagnosticos.Checked[cbDiagnosticos.Items.Count-1] := true; ;
end;

procedure TfrmPRS.cbSinFirmasClick(Sender: TObject);
var
  i : Integer;
begin
  if cbSinFirmas.Checked then
    for i := 0 to chkNivelFirmas.Items.Count - 1 do
      chkNivelFirmas.Checked[i] := False;
end;

procedure TfrmPRS.chkNivelFirmasClickCheck(Sender: TObject);
begin
  cbSinFirmas.Checked := False;
end;

procedure TfrmPRS.chkNoameritaClick(Sender: TObject);
begin
  if chkNoamerita.Checked then
  begin
    if Tipo = 'ET' then
    begin
      edRecDescripcion.Text := 'NO AMERITA PRS';
      edRelSeguimiento.Date := ValorSqlDateTimeEx('SELECT MAX(PA_SEGUIMIENTO) FROM HYS.HPA_PAL WHERE PA_CUIT = :CUIT AND PA_ESTABLECI = :ESTAB AND PA_FECHABAJA IS NULL', [FCUIT, FEstableci]);
      edRelCumplimiento.Date := edRelSeguimiento.Date;
    end
    else
      edRecDescripcion.Text := 'NO AMERITA PAPE'
  end;

  edRecDescripcion.Enabled := not chkNoamerita.Checked;
end;

procedure TfrmPRS.btnCopiarDeClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
          '  FROM PDE_DIAGESTABLECI ' +
          ' WHERE DE_CUIT = ' + SqlValue (FCUIT) +
          '   AND DE_ESTABLECI = ' + SqlInt (FEstableci) +
          '   AND DE_TIPO = ' + SqlValue (FTipo) +
          '   AND DE_OPERATIVO = ' + SqlValue (FOperativo) +
          '   AND DE_FECHABAJA IS NULL ';

  if ExisteSql(sSql) then
  begin
    MsgBox( 'Ya existe PRS cargado para el establecimiento.', MB_ICONERROR );
    Exit
  end;

  if fpCopiarEstableci.ShowModal = mrOk Then
  begin
    sSql := 'SELECT 1 ' +
            '  FROM PDE_DIAGESTABLECI ' +
            ' WHERE DE_CUIT = ' + SqlValue (FCUIT) +
            '   AND DE_ESTABLECI = ' + fraEstabCopia.edCodigo.TextSql +
            '   AND DE_TIPO = ' + SqlValue (FTipo) +
            '   AND DE_OPERATIVO = ' + SqlValue (FOperativo) +
            '   AND DE_FECHABAJA IS NULL ';

    if ExisteSql(sSql) then
    begin
      Try
        sSql := 'INSERT INTO art.pde_diagestableci ' +
                '            (de_cuit, de_estableci, de_diagnostico, de_tipo, de_descripcion1, ' +
                '             de_descripcion2, de_fechaalta, de_usualta, de_tipo_diagnostico, ' +
                '             de_operativo, de_sectorempresa, de_trabajadoresexpuestos, ' +
                '             de_idvisita, de_id) ' +
                '  SELECT de_cuit, ' +
                          SqlValue (FEstableci) + ', ' +
                '         de_diagnostico, de_tipo, de_descripcion1, de_descripcion2, SYSDATE, ' +
                          SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
                '         de_tipo_diagnostico, ' +
                '         de_operativo, de_sectorempresa, de_trabajadoresexpuestos, de_idvisita, ' +
                '         art.seq_pde_id.NEXTVAL ' +
                '    FROM art.pde_diagestableci ' +
                '   WHERE de_cuit = ' + SqlValue (FCUIT) +
                '     AND de_estableci = ' + fraEstabCopia.edCodigo.TextSql +
                '     AND de_tipo = ' + SqlValue (FTipo) +
                '     AND de_operativo = ' + SqlValue (FOperativo) +
                '     AND de_fechabaja IS NULL ';
        EjecutarSqlST( sSql );

        sSql := 'INSERT INTO art.pre_recomendaciones ' +
                '            (re_cuit, re_estableci, re_recomendacion, re_cumplimiento, ' +
                '             re_seguimiento, re_descripcion1, re_descripcion2, ' +
                '             re_fechaalta, re_usualta, re_tipo, re_operativo, re_responsable, ' +
                '             re_idvisita, re_idfirmante, re_id, re_noamerita) ' +
                '  SELECT re_cuit, ' +
                          SqlValue (FEstableci) + ', ' +
                '         re_recomendacion, re_cumplimiento, re_seguimiento, re_descripcion1, ' +
                '         re_descripcion2, SYSDATE, ' +
                          SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
                '         re_tipo, re_operativo, re_responsable, re_idvisita, re_idfirmante, ' +
                '         art.seq_pre_id.NEXTVAL, re_noamerita ' +
                '    FROM art.pre_recomendaciones ' +
                '   WHERE re_cuit = ' + SqlValue (FCUIT) +
                '     AND re_estableci = ' + fraEstabCopia.edCodigo.TextSql +
                '     AND re_tipo = ' + SqlValue (FTipo) +
                '     AND re_operativo = ' + SqlValue (FOperativo) +
                '     AND re_fechabaja IS NULL';
        EjecutarSqlST( sSql );

        sSql := 'INSERT INTO pdr_diagporrec ' +
                '            (dr_cuit, dr_estableci, dr_recomendacion, dr_diagnostico, ' +
                '             dr_tipo, dr_operativo, dr_idvisita, dr_fechaalta, ' +
                '             dr_usualta) ' +
                '  SELECT dr_cuit, ' +
                          SqlValue (FEstableci) + ', ' +
                '         dr_recomendacion, dr_diagnostico, ' +
                '         dr_tipo, dr_operativo, dr_idvisita, SYSDATE, ' +
                          SqlValue(frmPrincipal.DBLogin.LoginName) +
                '    FROM pdr_diagporrec, pde_diagestableci, pre_recomendaciones ' +
                '   WHERE dr_cuit = de_cuit ' +
                '     AND dr_estableci = de_estableci ' +
                '     AND dr_tipo = de_tipo ' +
                '     AND dr_operativo = de_operativo ' +
                '     AND dr_diagnostico = de_diagnostico ' +
                '     AND re_cuit = de_cuit ' +
                '     AND re_estableci = de_estableci ' +
                '     AND re_tipo = de_tipo ' +
                '     AND re_operativo = de_operativo ' +
                '     AND re_fechabaja IS NULL ' +
                '     AND dr_cuit = ' + SqlValue (FCUIT) +
                '     AND dr_estableci = ' + fraEstabCopia.edCodigo.TextSql +
                '     AND dr_tipo = ' + SqlValue (FTipo) +
                '     AND dr_operativo = ' + SqlValue (FOperativo) +
                '     AND dr_recomendacion = re_recomendacion '+
                '     AND dr_fechabaja IS NULL';
        EjecutarSqlST( sSql );

        sdqDiagnostico.Refresh;
        sdqRecomendaciones.Refresh;
      except
        Raise;
      end;
    end
    else
      MsgBox( 'No se encontraron datos para copiar', MB_ICONERROR )
  end;
end;

procedure TfrmPRS.fpCopiarEstableciBeforeShow(Sender: TObject);
begin
  fraEstabCopia.CUIT           := FCUIT;
  fraEstabCopia.ExtraCondition := ' AND ST_CLAVE <> ' + SqlInt(FEstableci) + ' ';
end;

procedure TfrmPRS.btnCopEstAceptarClick(Sender: TObject);
begin
  if fraEstabCopia.IsEmpty Then
    InvalidMsg( fraEstabCopia.edCodigo, 'Debe seleccionar un establecimiento' )
  else
    if fraEstabCopia.edCodigo.Value = FEstableci Then
      InvalidMsg( fraEstabCopia.edCodigo, 'No puede copiar datos del mismo establecimiento' )
    else
      fpCopiarEstableci.ModalResult := mrOk;
end;

procedure TfrmPRS.tbHistoricoClick(Sender: TObject);
begin
  if sdqRecomendaciones.IsEmpty then Exit;
  sdqHistorico.Close;
  sdqHistorico.ParamByName('re_id').AsInteger := sdqRecomendaciones.FieldByName('re_id').AsInteger;
  sdqHistorico.Open;
  fpHistorico.ShowModal;
end;          

procedure TfrmPRS.tbSalirClick(Sender: TObject);
begin
  fpHistorico.ModalResult := mrOk;
end;

procedure TfrmPRS.CargarPlanVisitas;
begin
  sdqPlanVisitas.Close;
  sdqPlanVisitas.SQL.Text :=  'SELECT pv_cuit, pv_estableci, pv_fecha, pv_fechaalta, pv_usualta, ' +
                              '       pv_fechabaja, pv_usubaja, pv_fechaexport, pv_usuexport, ' +
                              '       pv_fechamodif, pv_usumodif, pv_operativo, pv_tipo, pv_id ' +
                              '  FROM hys.hpv_planvisitas ' +
                              ' WHERE pv_cuit = ' + SqlValue(FCUIT) +
                              '   AND pv_estableci = ' + SqlValue(FEstableci) +
                              '   AND pv_tipo = ' + SqlValue(FTipo) +
                              '   AND pv_operativo = ' + SqlValue(FOperativo);
  sdqPlanVisitas.Open;
end;

procedure TfrmPRS.dbgPlanVisitasGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPlanVisitas.IsEmpty and not sdqPlanVisitas.FieldByName('pv_fechabaja').IsNull then
    AFont.Color := clRed;
end;


procedure TfrmPRS.tbNuevoVisitaPlanClick(Sender: TObject);
begin
  edFechaPlanVisitas.Clear;
  fpPlanVisita.ShowModal;
end;

procedure TfrmPRS.btnAceptarPlanVisitasClick(Sender: TObject);
begin
  Verificar(edFechaPlanVisitas.Date=0, edFechaPlanVisitas, 'Debe ingresar una fecha de visita.');
  Verificar((FTipo <> 'ET'), btnAceptarPlanVisitas,'Debe ser ET la empresa.');
  GuardarVisitaEnPlan(FCUIT,FEstableci,FTipo,FOperativo,edFechaPlanVisitas.Date,true,
                        edFechaPlanVisitas);
  CargarPlanVisitas;
  fpPlanVisita.ModalResult := mrOk;
end;

procedure TfrmPRS.tbEliminarVisitaPlanClick(Sender: TObject);
begin
  if not sdqPlanVisitas.IsEmpty then
  begin
    if ExisteSql(' SELECT 1 FROM PRE_RECOMENDACIONES '+
                 ' WHERE RE_CUIT = ' + SqlValue (FCUIT) +
                 '   AND RE_ESTABLECI = ' + SqlInt( FEstableci ) +
                 '   AND RE_TIPO = ' + SqlValue (FTipo) +
                 '   AND RE_OPERATIVO = ' + SqlValue (FOperativo)+
                 '   AND RE_SEGUIMIENTO = ' + SqlDate(sdqPlanVisitas.FieldByName('pv_fecha').AsDateTime)+
                 '   AND RE_FECHABAJA IS NULL ') then
      Verificar(true, dbgPlanVisitas, 'Esta visita está vinculada con un seguimiento de una recomendación.')
    else begin
      EjecutarSqlST('UPDATE hys.hpv_planvisitas ' +
              'SET pv_usubaja = ' + SqlValue(Sesion.LoginName) + ',' +
              ' pv_fechabaja = sysdate ' +
              'WHERE pv_cuit = ' + SqlValue(FCUIT) +
              '   AND pv_estableci = ' + SqlValue(FEstableci) +
              '   AND pv_tipo = ' + SqlValue(FTipo) +
              '   AND pv_operativo = ' + SqlValue(FOperativo) +
              '   AND pv_fecha = ' + SqlDate(sdqPlanVisitas.FieldByName('pv_fecha').AsDateTime));
      CargarPlanVisitas;
    end;
  end;
end;

procedure TfrmPRS.tbOrdenarVisitaPlanClick(Sender: TObject);
begin
  sdPlanVisitas.Execute;
end;

procedure TfrmPRS.GuardarNivelFirma;
var
  i : Integer;
begin
  for i:=0 to chkNivelFirmas.Count-1 do
  begin
    if chkNivelFirmas.Checked[i] then
    begin
      if ExisteSql('SELECT 1 FROM HYS.HNF_NIVELFIRMA '+
                   ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                    '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                    '  AND NF_TIPO = '+SqlValue(FTipo)+
                    '  AND NF_IDTIPOFIRMA = '+ SqlValue(Integer(chkNivelFirmas.Items.Objects[i]))+
                    '  AND NF_TIPOFORMULARIO = '+IIF(FTipo='ET','''PRS''','''PAPE''')+
                    '  AND NF_OPERATIVO = '+SqlValue(FOperativo)) then
      begin
        if ExisteSql('SELECT 1 FROM HYS.HNF_NIVELFIRMA '+
                   ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                    '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                    '  AND NF_TIPO = '+SqlValue(FTipo)+
                    '  AND NF_OPERATIVO = '+SqlValue(FOperativo)+
                    '  AND NF_IDTIPOFIRMA = '+ SqlValue(Integer(chkNivelFirmas.Items.Objects[i]))+
                    '  AND NF_TIPOFORMULARIO = '+IIF(FTipo='ET','''PRS''','''PAPE''')+
                    '  AND NF_FECHABAJA IS NOT NULL ') then
        begin
          EjecutarSqlST('UPDATE HYS.HNF_NIVELFIRMA '+
                        '   SET NF_FECHABAJA = NULL, NF_USUBAJA = NULL, '+
                        '       NF_FECHAMODIF = SYSDATE, NF_USUMODIF = '+SqlValue(Sesion.LoginName)+
                        ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                        '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                        '  AND NF_TIPO = '+SqlValue(FTipo)+
                        '  AND NF_IDTIPOFIRMA = '+ SqlValue(Integer(chkNivelFirmas.Items.Objects[i]))+
                        '  AND NF_TIPOFORMULARIO = '+IIF(FTipo='ET','''PRS''','''PAPE''')+
                        '  AND NF_OPERATIVO = '+SqlValue(FOperativo));
        end;
      end
      else
      begin
        EjecutarSqlST(
                    ' INSERT INTO hys.HNF_NIVELFIRMA '+
                    '             (NF_ID, NF_CUIT, NF_ESTABLECI, NF_TIPO, NF_OPERATIVO,'+
                    '              NF_TIPOFORMULARIO, NF_IDTIPOFIRMA, '+
                    '              NF_FECHAALTA, NF_USUALTA '+
                    '             )'+
                    '      VALUES (hys.SEQ_HNF_ID.NEXTVAL,'+SqlValue(FCUIT)+', '+
                                   SqlValue(FEstableci)+', '+SqlValue(FTipo)+', '+
                                   SqlValue(FOperativo)+','+IIF(FTipo='ET','''PRS''','''PAPE''')+','+
                                   SqlValue(Integer(chkNivelFirmas.Items.Objects[i]))+
                                   ',sysdate,'+SqlValue(Sesion.UserID)+')');
      end;
    end
    else
    begin
      if ExisteSql('SELECT 1 FROM HYS.HNF_NIVELFIRMA '+
                   ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                    '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                    '  AND NF_TIPO = '+SqlValue(FTipo)+
                    '  AND NF_OPERATIVO = '+SqlValue(FOperativo)+
                    '  AND NF_IDTIPOFIRMA = '+ SqlValue(Integer(chkNivelFirmas.Items.Objects[i]))+
                    '  AND NF_TIPOFORMULARIO = '+IIF(FTipo='ET','''PRS''','''PAPE''')+
                    '  AND NF_FECHABAJA IS NULL ') then
        begin
          EjecutarSqlST('UPDATE HYS.HNF_NIVELFIRMA '+
                        '   SET NF_FECHABAJA = SYSDATE, NF_USUBAJA = '+SqlValue(Sesion.LoginName)+
                        ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                        '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                        '  AND NF_TIPO = '+SqlValue(FTipo)+
                        '  AND NF_IDTIPOFIRMA = '+ SqlValue(Integer(chkNivelFirmas.Items.Objects[i]))+
                        '  AND NF_TIPOFORMULARIO = '+IIF(FTipo='ET','''PRS''','''PAPE''')+
                        '  AND NF_OPERATIVO = '+SqlValue(FOperativo));
        end;

    end;
  end;
  if cbSinFirmas.Checked then
  begin
    if ExisteSql('SELECT 1 FROM HYS.HNF_NIVELFIRMA '+
                 ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                  '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                  '  AND NF_TIPO = '+SqlValue(FTipo)+
                  '  AND NF_IDTIPOFIRMA = 5'+
                  '  AND NF_TIPOFORMULARIO = '+IIF(FTipo='ET','''PRS''','''PAPE''')+
                  '  AND NF_OPERATIVO = '+SqlValue(FOperativo)) then
    begin
      if ExisteSql('SELECT 1 FROM HYS.HNF_NIVELFIRMA '+
                 ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                  '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                  '  AND NF_TIPO = '+SqlValue(FTipo)+
                  '  AND NF_OPERATIVO = '+SqlValue(FOperativo)+
                  '  AND NF_IDTIPOFIRMA = 5'+
                  '  AND NF_TIPOFORMULARIO = '+IIF(FTipo='ET','''PRS''','''PAPE''')+
                  '  AND NF_FECHABAJA IS NOT NULL ') then
      begin
        EjecutarSqlST('UPDATE HYS.HNF_NIVELFIRMA '+
                      '   SET NF_FECHABAJA = NULL, NF_USUBAJA = NULL, '+
                      '       NF_FECHAMODIF = SYSDATE, NF_USUMODIF = '+SqlValue(Sesion.LoginName)+
                      ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                      '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                      '  AND NF_TIPO = '+SqlValue(FTipo)+
                      '  AND NF_IDTIPOFIRMA = 5'+
                      '  AND NF_TIPOFORMULARIO = '+IIF(FTipo='ET','''PRS''','''PAPE''')+
                      '  AND NF_OPERATIVO = '+SqlValue(FOperativo));
      end;
    end
    else
    begin
      EjecutarSqlST(
                  ' INSERT INTO hys.HNF_NIVELFIRMA '+
                  '             (NF_ID, NF_CUIT, NF_ESTABLECI, NF_TIPO, NF_OPERATIVO,'+
                  '              NF_TIPOFORMULARIO, NF_IDTIPOFIRMA, '+
                  '              NF_FECHAALTA, NF_USUALTA '+
                  '             )'+
                  '      VALUES (hys.SEQ_HNF_ID.NEXTVAL,'+SqlValue(FCUIT)+', '+
                                 SqlValue(FEstableci)+', '+SqlValue(FTipo)+', '+
                                 SqlValue(FOperativo)+','+IIF(FTipo='ET','''PRS''','''PAPE''')+',5,sysdate,'+
                                 SqlValue(Sesion.UserID)+')');
    end;
  end
  else
  begin
    if ExisteSql('SELECT 1 FROM HYS.HNF_NIVELFIRMA '+
                 ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                  '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                  '  AND NF_TIPO = '+SqlValue(FTipo)+
                  '  AND NF_OPERATIVO = '+SqlValue(FOperativo)+
                  '  AND NF_IDTIPOFIRMA = 5'+
                  '  AND NF_TIPOFORMULARIO = '+IIF(FTipo='ET','''PRS''','''PAPE''')+
                  '  AND NF_FECHABAJA IS NULL ') then
      begin
        EjecutarSqlST('UPDATE HYS.HNF_NIVELFIRMA '+
                      '   SET NF_FECHABAJA = SYSDATE, NF_USUBAJA = '+SqlValue(Sesion.LoginName)+
                      ' WHERE NF_CUIT = ' +SqlValue(FCUIT)+
                      '  AND NF_ESTABLECI = ' +SqlValue(FEstableci)+
                      '  AND NF_TIPO = '+SqlValue(FTipo)+
                      '  AND NF_IDTIPOFIRMA = 5'+
                      '  AND NF_TIPOFORMULARIO = '+IIF(FTipo='ET','''PRS''','''PAPE''')+
                      '  AND NF_OPERATIVO = '+SqlValue(FOperativo));
      end;

  end;
end;

end.

