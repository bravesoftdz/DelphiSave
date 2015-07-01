unit unHistoriaClinica;

interface

uses
  SysUtils, Classes, Controls, Forms, unFormEstudios, StdCtrls, Mask, DBCtrls,
  ComCtrls, ExtCtrls, Grids, Buttons,  DBGrids, RXCtrls, Db,
  DBTables, SDEngine, RxMemDS, FormPanel, ToolEdit, CurrEdit,
  ToolWin, unfraMedico, IntEdit, DateComboBox, PatternEdit, artSeguridad,
  Placemnt, Graphics, ImageComboBox, QueryPrint, Dialogs, unfraPrestadorAMP,
  GroupCheckBox, unfraOperativo, unArtFrame, unFraCodigoDescripcion,
  unfraCtbTablas, unFraTipoEstudio, unArtDbFrame, unFraReconfirmacion,
  unArtDBAwareFrame, ShortCutControl, JvExExtCtrls, JvRadioGroup;

type
  TfrmHistoriaClinica = class(TFormEstudios)
    dsAltera: TDataSource;
    qryAlteras: TQuery;
    qryAnalisis: TSDQuery;
    mdDatosClinicos: TRxMemoryData;
    dsObserv: TDataSource;
    mdDatosClinicosITEM: TStringField;
    mdDatosClinicosDESCRIPCION: TStringField;
    mdDatosClinicosORDEN: TFloatField;
    mdDatosClinicosOBSERVACIONES: TStringField;
    btnGrabar: TBitBtn;
    btnCancelar: TBitBtn;
    pnlDatosFijos: TPanel;
    Panel2: TPanel;
    pnlCUIT: TPanel;
    Panel4: TPanel;
    pnlContrato: TPanel;
    Panel6: TPanel;
    pnlRSocial: TPanel;
    Panel8: TPanel;
    pnlEstableciCodigo: TPanel;
    pnlEstableciDesc: TPanel;
    Panel10: TPanel;
    pnlFecha: TPanel;
    pnlFechaText: TPanel;
    Panel14: TPanel;
    pnlCUIL: TPanel;
    Panel16: TPanel;
    pnlNombre: TPanel;
    btnImprimir: TBitBtn;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    PrintDialog: TPrintDialog;
    pcHistoriasClinicas: TPageControl;
    TabSheet5: TTabSheet;
    Label41: TLabel;
    Bevel1: TBevel;
    Bevel10: TBevel;
    Label42: TLabel;
    lbAntiguedad: TLabel;
    Meses: TLabel;
    Label43: TLabel;
    Label55: TLabel;
    edObservaciones: TMemo;
    edSeccionTrab: TEdit;
    edAntiguedad: TIntEdit;
    fraMedico: TfraMedico;
    edPuestoTrabajo: TEdit;
    TabSheet1: TTabSheet;
    Bevel2: TBevel;
    Label6: TLabel;
    Bevel4: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    dmObsTrabajador: TMemo;
    dbmTratamiento: TMemo;
    gbTabaquismo: TRadioGroup;
    dbePeso: TIntEdit;
    dbePulso: TIntEdit;
    edPersSistolica: TIntEdit;
    edPersDiastolica: TIntEdit;
    dbeTalla: TCurrencyEdit;
    gbTipoPresion: TGroupBox;
    rbPresionNormal: TRadioButton;
    rbPresionAnormal: TRadioButton;
    gbAlcoholismo2: TGroupBox;
    Label56: TLabel;
    rbAlcoholNC: TRadioButton;
    rbAlcohol250: TRadioButton;
    rbAlcohol500: TRadioButton;
    rbAlcohol1000: TRadioButton;
    rbAlcoholMas: TRadioButton;
    edTipoAlcohol: TEdit;
    TabSheet2: TTabSheet;
    gbPiel: TGroupBox;
    Label27: TLabel;
    dbePiel_Otros: TEdit;
    gbOjos: TGroupBox;
    Label32: TLabel;
    Llabel: TLabel;
    Label34: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dbeOjos_Alteracion: TEdit;
    edOjos_AgudezaD: TIntEdit;
    edOjos_AgudezaI: TIntEdit;
    TabSheet3: TTabSheet;
    gbCuello: TGroupBox;
    dbeCuello_Obs: TEdit;
    rgOsteoartucular: TRadioGroup;
    TabSheet4: TTabSheet;
    grpEdemasPretibiales: TGroupBox;
    grpColumnaVertebral: TGroupBox;
    Label9: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label4: TLabel;
    rbLasegue_Izq: TRadioButton;
    rbLasegue_Der: TRadioButton;
    tsAlteracionesClinicas: TTabSheet;
    dbgItemsObs: TDBGrid;
    cBarAltClinic: TCoolBar;
    tbarAltClinic: TToolBar;
    tbAgregarDC: TToolButton;
    tbModificarDC: TToolButton;
    tbEliminarDC: TToolButton;
    fpDatosClinicos: TFormPanel;
    Label15: TLabel;
    Label52: TLabel;
    Bevel11: TBevel;
    edDcItemDesc: TEdit;
    edDcItem: TPatternEdit;
    edDcObservaciones: TMemo;
    btnDcAceptar: TButton;
    btnDcCancelar: TButton;
    edDcItemOrden: TIntEdit;
    tsResultados: TTabSheet;
    Bevel15: TBevel;
    Label31: TLabel;
    Image1: TImage;
    rgResultados: TRadioGroup;
    Bevel3: TBevel;
    Label13: TLabel;
    fraPrestador: TfraPrestadorAMP;
    lbOperativo: TLabel;
    cgPiel: TCheckGroup;
    cgBoca: TCheckGroup;
    Bevel5: TBevel;
    cgOjos: TCheckGroup;
    cgNariz: TCheckGroup;
    cgTorax: TCheckGroup;
    cgCorazon: TCheckGroup;
    cgExtremidades: TCheckGroup;
    cgNeurologico: TCheckGroup;
    cgColCicatrices: TCheckGroup;
    cgColContractura: TCheckGroup;
    cgColDeformidades: TCheckGroup;
    cgColPuntosDolosos: TCheckGroup;
    cgColLimitaciones: TCheckGroup;
    ToolButton1: TToolButton;
    tbAltAutomatica: TToolButton;
    fraOperativo: TfraOperativo;
    fraTipoEstudio: TfraTipoEstudio;
    Label5: TLabel;
    fraReconfirmacion: TfraReconfirmacion;
    Label14: TLabel;
    edFechaRPrest: TDateComboBox;
    Label16: TLabel;
    edFechaRML: TDateComboBox;
    ShortCutControl: TShortCutControl;
    chkSobrepeso: TCheckBox;
    Label17: TLabel;
    rgVarices: TRadioGroup;
    gbAbdomen: TGroupBox;
    Label18: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dbeAbdomen_Otras: TEdit;
    gbHernia_Inguinal: TRadioGroup;
    gbHernia_Crural: TRadioGroup;
    cgAbdomen: TCheckGroup;
    chbHernia_Umbilical: TCheckBox;
    dbeEdemasPre_Obs: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    rgHerniaDiscal: TJvRadioGroup;
    rgEspondiloart: TJvRadioGroup;
    rgEspondiloartritis: TJvRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure dbgItemsObsKeyPress(Sender: TObject; var Key: Char);
    procedure dbgItemsObsDblClick(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure tbAgregarDCClick(Sender: TObject);
    procedure tbModificarDCClick(Sender: TObject);
    procedure tbEliminarDCClick(Sender: TObject);
    procedure btnDcAceptarClick(Sender: TObject);
    procedure rbAlcoholClick(Sender: TObject);
    procedure ChkPresion(Sender: TObject);
    procedure OnCheckGroupChange(Sender: TObject; Index: Integer);
    procedure btnCancelarClick(Sender: TObject);
    procedure cgColumnaItemChange(Sender: TObject; Index: Integer);
    procedure tsResultadosEnter(Sender: TObject);
    procedure ShortCutControlShortCuts1ShortCutPress(Sender: TObject);
    procedure ShortCutControlShortCuts2ShortCutPress(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure rbLasegue_IzqDblClick(Sender: TObject);
    procedure rbLasegue_DerDblClick(Sender: TObject);
  private
    procedure AddItem( Item, Desc: string );
    procedure DelItem( Item: string );
    function GetAlcoholismo: Integer;
    procedure SetAlcoholismo(const Value: Integer);
    function ConversorResultadoLoad(indice: Integer): Integer;
    function ConversorResultadoSave(indice: Integer): Integer;
  private
    function ValidarDatos : boolean;
    procedure CargaDatos;
    procedure CargarAlteraciones;
    function GuardarDatos             : Boolean;
  public
    function Execute(AModoABM : TModoABM = maAdd) : boolean; override;
    property Alcoholismo   : Integer read GetAlcoholismo write SetAlcoholismo;
  end;


implementation

Uses Windows, unPrincipal, strFuncs, AnsiSql, SqlFuncs, unDmPrincipal, CustomDlgs, General ;

Const
   PAG_DATOSPRINCIPALES = 0;
   PAG_GENERAL          = 1;
   PAG_HISTCLI1         = 2;
   PAG_HISTCLI2         = 3;
   PAG_HISTCLI3         = 4;
   PAG_ALTERACIONES     = 5;
   PAG_RESULTADOS       = 6;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.FormCreate(Sender: TObject);
begin
//  StatusBar                          := frmPrincipal.StatusBar;
  fraTipoEstudio.FrameOperativo      := fraOperativo;
  fraTipoEstudio.FrameReconfirmacion := fraReconfirmacion;
  mdDatosClinicos.Open;
  pcHistoriasClinicas.ActivePageIndex := 0;
  rgHerniaDiscal.ItemIndex := 1;
  rgEspondiloart.ItemIndex := 1;
  rgEspondiloartritis.ItemIndex := 2;
  fraPrestador.ShowBajas := true;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.ChkPresion(Sender: TObject);
var
   Sist, Dias: integer;
begin
     If ( ( edPersSistolica.Text ) = '' ) then
        sist := 0
     else
        sist := StrToInt( edPersSistolica.Text );

     If ( ( edPersDiastolica.Text ) = '' ) then
        dias := 0
     else
        dias := StrToInt( edPersDiastolica.Text );

     if ( dias > 90 ) or ( sist > 140 ) then
        rbPresionAnormal.Checked := True
     else
        rbPresionNormal.Checked := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.CargaDatos;
var
   Sql : String;
begin
     With ClaveEstudio do
     Sql := 'SELECT TE_MEDICO, TE_SECCION, TE_PUESTO, TE_ANTIGPUESTO, TE_ANTECEDENTES, TE_SINTOMAS, TE_OBSERV, ' +
                   'TE_PESO, TE_TALLA, TE_PULSO, TE_SISTOLE, TE_DIASTOLE, TE_TABAQUISMO, TE_ALCOHOLISMO, ' +
                   'TE_ALCOHOL_TIPO, TE_TRATAMIENT, TE_PIEL, TE_PIEL_OTROS, TE_OJO, TE_OJOS_ALTE, ' +
                   'TE_OJOS_AGUDD, TE_OJOS_AGUDI, TE_BOCA, TE_NARIZ, TE_CUELLO, TE_TORAX, TE_CORAZON, ' +
                   'TE_ABDOMEN, TE_ABDO_OTROS, TE_HERNIA_ING, TE_HERNIA_CRU, TE_EXTREMIDAD, TE_EDEMAS, ' +
                   'TE_NEUROLOGIC, TE_COLUMDEFO, TE_COLUMCICA, TE_COLUMDOLO, TE_COLUMCONT, ' +
                   // TE_OPAC_PROFI, TE_OPAC_PROFU, TE_OPAC_REDON, TE_OPAC_IRREG, TE_OPAC_GRAND, TE_OPAC_PLEUR, TE_CALCIFIC, TE_INCARESP, TE_INCARESPTO, TE_ESPIROMETRIA, TE_ESPIRO_GRADO,
                   'TE_COLUMLIMIT, TE_COLUMLASEG, TE_OSTEOARTICULAR, TE_VARICES, ' +
                   'TE_USUALTA, TE_FECHAALTA, TE_SOBREPESO, TE_HERNIA_UMB, ' +
                   'nvl(TE_HERNIADISCAL,1) TE_HERNIADISCAL, nvl(TE_ESPONDILOART,1) TE_ESPONDILOART, '+
                   'nvl(TE_ESPONDILOARTRITIS,2) TE_ESPONDILOARTRITIS ' +
              'FROM ATE_EXATRAB ' +
             'WHERE TE_CUIT = ''' + Cuit + ''' ' +
               'AND TE_ESTABLECI = ' + SqlInt( Estableci ) + ' ' +
               'AND TE_CUIL = ''' + Cuil + ''' ' +
               'AND TE_FECHA = ' + SqlDate(Fecha) + ' ' +
               'AND TE_ESTUDIO = ''' + Estudio + '''';
     Try
        OpenQuery( qryAnalisis, Sql );
     Except
        On E: Exception do begin
           ErrorMsg( E, 'Error al Cargar el Análisis Clínico' );
           Raise;
        end;
     End;
     {-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --}
     Try
        cgPiel.Value             := qryAnalisis.FieldByName('TE_PIEL').AsString ;
        cgBoca.Value             := qryAnalisis.FieldByName('TE_BOCA').AsString ;
        cgTorax.Value            := qryAnalisis.FieldByName('TE_TORAX').AsString ;
        cgOjos.Value             := qryAnalisis.FieldByName('TE_OJO').AsString ;
        cgAbdomen.Value          := qryAnalisis.FieldByName('TE_ABDOMEN').AsString ;
        cgNariz.Value            := qryAnalisis.FieldByName('TE_NARIZ').AsString ;
        cgCorazon.Value          := qryAnalisis.FieldByName('TE_CORAZON').AsString ;
        if qryAnalisis.FieldByName('TE_VARICES').AsInteger = 9 then
        begin
          rgVarices.Caption := ' Varices SI ';
          rgVarices.Enabled := False;
        end
        else
        begin
          rgVarices.ItemIndex      := qryAnalisis.FieldByName('TE_VARICES').AsInteger;
          rgVarices.Caption := ' Varices ';
        end;

        cgNeurologico.Value      := qryAnalisis.FieldByName('TE_NEUROLOGIC').AsString ;
        cgExtremidades.Value     := qryAnalisis.FieldByName('TE_EXTREMIDAD').AsString ;
        cgColCicatrices.Value    := NVL(qryAnalisis.FieldByName('TE_COLUMCICA').AsString, '000');
        cgColContractura.Value   := NVL(qryAnalisis.FieldByName('TE_COLUMCONT').AsString, '000');
        cgColPuntosDolosos.Value := NVL(qryAnalisis.FieldByName('TE_COLUMDOLO').AsString, '000');
        cgColDeformidades.Value  := NVL(qryAnalisis.FieldByName('TE_COLUMDEFO').AsString, '000');
        cgColLimitaciones.Value  := NVL(qryAnalisis.FieldByName('TE_COLUMLIMIT').AsString, '000');

        rgHerniaDiscal.ItemIndex := qryAnalisis.FieldByName('TE_HERNIADISCAL').AsInteger;
        rgEspondiloart.ItemIndex := qryAnalisis.FieldByName('TE_ESPONDILOART').AsInteger;
        rgEspondiloartritis.ItemIndex := qryAnalisis.FieldByName('TE_ESPONDILOARTRITIS').AsInteger;


         If qryAnalisis.FieldByName('TE_COLUMLASEG').AsString = 'I' then
            rbLasegue_Izq.Checked := True;

         if qryAnalisis.FieldByName('TE_COLUMLASEG').AsString = 'D' then
            rbLasegue_Der.Checked := True;

         if qryAnalisis.FieldByName('TE_COLUMLASEG').AsString = ' ' then begin
            rbLasegue_Der.Checked := False;
            rbLasegue_Izq.Checked := False;
         end;

         edSeccionTrab.Text           := Trim(qryAnalisis.FieldByName('TE_SECCION').AsString);
         edPuestoTrabajo.Text         := qryAnalisis.FieldByName('TE_PUESTO').AsString ;
         edAntiguedad.Value           := qryAnalisis.FieldByName('TE_ANTIGPUESTO').AsInteger div 12;
         fraMedico.Cargar( qryAnalisis.FieldByName('TE_MEDICO').AsString );
         edObservaciones.Text         := qryAnalisis.FieldByName('TE_OBSERV').AsString ;

         dmObsTrabajador.Text         := qryAnalisis.FieldByName('TE_SINTOMAS').AsString;
         dbePeso.Text                 := qryAnalisis.FieldByName('TE_PESO').AsString;
         dbeTalla.Text                := qryAnalisis.FieldByName('TE_TALLA').AsString;
         dbePulso.Text                := qryAnalisis.FieldByName('TE_PULSO').AsString;
         chkSobrepeso.Checked         := qryAnalisis.FieldByName('TE_SOBREPESO').AsString = 'S';
         edPersSistolica.Text         := qryAnalisis.FieldByName('TE_SISTOLE').AsString;
         edPersDiastolica.Text        := qryAnalisis.FieldByName('TE_DIASTOLE').AsString;

         if qryAnalisis.FieldByName('TE_TABAQUISMO').IsNull Then
            gbTabaquismo.ItemIndex    := -1
         else
            gbTabaquismo.ItemIndex    := qryAnalisis.FieldByName('TE_TABAQUISMO').AsInteger;

         Alcoholismo                  := qryAnalisis.FieldByName('TE_ALCOHOLISMO').AsInteger;
         edTipoAlcohol.Text           := qryAnalisis.FieldByName('TE_ALCOHOL_TIPO').AsString ;


         dbmTratamiento.Text          := qryAnalisis.FieldByName('TE_TRATAMIENT').AsString;

         dbePiel_Otros.Text           := qryAnalisis.FieldByName('TE_PIEL_OTROS').AsString;
         dbeOjos_Alteracion.Text      := qryAnalisis.FieldByName('TE_OJOS_ALTE').AsString;
         edOjos_AgudezaD.Value        := StrToInt( '0' + qryAnalisis.FieldByName('TE_OJOS_AGUDD').AsString );
         edOjos_AgudezaI.Value        := StrToInt( '0' + qryAnalisis.FieldByName('TE_OJOS_AGUDI').AsString );

         dbeCuello_Obs.Text           := qryAnalisis.FieldByName('TE_CUELLO').AsString;
         dbeAbdomen_Otras.Text        := qryAnalisis.FieldByName('TE_ABDO_OTROS').AsString;

         chbHernia_Umbilical.Checked  := qryAnalisis.FieldByName('TE_HERNIA_UMB').AsString = 'S';
         gbHernia_Inguinal.ItemIndex  := ArrayPos( qryAnalisis.FieldByName('TE_HERNIA_ING').AsString, ['D', 'I', 'B']);
         gbHernia_Crural.ItemIndex    := ArrayPos( qryAnalisis.FieldByName('TE_HERNIA_CRU').AsString, ['D', 'I', 'B']);

         rgOsteoartucular.ItemIndex   := ArrayPos(qryAnalisis.FieldByName('TE_OSTEOARTICULAR').AsString, ['N', 'A']);

         dbeEdemasPre_Obs.Text        := qryAnalisis.FieldByName('TE_EDEMAS').AsString;

         // Carga Observaciones
         CargarAlteraciones;
     except
         on E: Exception do ErrorMsg(E);
     end;
     {-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --}
     qryAnalisis.Close;
End;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.AddItem( Item, Desc: String );
begin
     if not mdDatosClinicos.Locate( 'ITEM', Item, [loCaseInsensitive] ) then begin
         mdDatosClinicos.Insert;
         mdDatosClinicosITEM.AsString        := Item;
         mdDatosClinicosDESCRIPCION.AsString := Desc;
         mdDatosClinicosORDEN.AsInteger      := 1;
         mdDatosClinicos.Post;

         if tbAltAutomatica.Down Then
            pcHistoriasClinicas.ActivePage   := tsAlteracionesClinicas;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.DelItem( Item: string );
begin
     if mdDatosClinicos.Locate( 'ITEM', Item, [loCaseInsensitive] ) then
        mdDatosClinicos.Delete;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.dbgItemsObsKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) then begin
        dbgItemsObsDblClick( Nil );
        Key := #0;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.dbgItemsObsDblClick(Sender: TObject);
begin
     if tbModificarDC.Enabled Then
        tbModificarDCClick( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.btnGrabarClick(Sender: TObject);
begin
     if ValidarDatos and GuardarDatos Then
        ModalResult := mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmHistoriaClinica.GuardarDatos : boolean;
Var  Sql  : TSql;
     sSql : String;
begin
     with dmPrincipal do begin
          try
             BeginTrans;
             Screen.Cursor := crHourGlass;

             { Guarda los datos en la tabla de estudios }
             WriteStatusText('Guardando los Datos del Estudio...');
             SaveResult( ConversorResultadoSave(rgResultados.ItemIndex) + 1,
                         TipoResultado(ConversorResultadoSave(rgResultados.ItemIndex) = 0),
                         fraPrestador.edCodigo.Text,
                         fraOperativo.edPeriodo.Text,
                         fraTipoEstudio.PeriodoOriginal,
                         DatosEstudio.IDCarpetaAMP,
                         DatosEstudio.IDDetalleArchivo,
                         DatosEstudio.CarpetaPendiente,
                         fraTipoEstudio.Value,
                         fraReconfirmacion.Value,
                         edFechaRPrest.Date,
                         edFechaRML.Date);

             WriteStatusText('Guardando los Datos de la Historia Clínica...');
             //if (edFecha.Date <> 0) Then begin
               Sql := TSql.Create( 'ATE_EXATRAB' );
               Try
                 Sql.PrimaryKey.Add( 'TE_CUIT', ClaveEstudio.Cuit);
                 Sql.PrimaryKey.Add( 'TE_ESTABLECI', ClaveEstudio.Estableci);
                 Sql.PrimaryKey.Add( 'TE_CUIL', ClaveEstudio.Cuil);
                 Sql.PrimaryKey.Add( 'TE_FECHA', ClaveEstudio.Fecha);
                 Sql.PrimaryKey.Add( 'TE_ESTUDIO', ClaveEstudio.Estudio);

                 Sql.Fields.Add( 'TE_MEDICO', fraMedico.edCodigo.Text);
                 Sql.Fields.Add( 'TE_PERIODO', fraOperativo.edPeriodo.Text );
                 Sql.Fields.Add( 'TE_SECCION', Trim(edSeccionTrab.Text));
                 Sql.Fields.Add( 'TE_PUESTO', edPuestoTrabajo.Text);
                 Sql.Fields.Add( 'TE_ANTIGPUESTO', 12*edAntiguedad.Value );
                 Sql.Fields.Add( 'TE_SINTOMAS', dmObsTrabajador.Text);
                 Sql.Fields.Add( 'TE_OBSERV', edObservaciones.Text);
                 Sql.Fields.Add( 'TE_PESO', dbePeso.Value);
                 Sql.Fields.Add( 'TE_TALLA', dbeTalla.Value);
                 Sql.Fields.Add( 'TE_PULSO', dbePulso.Value);
                 Sql.Fields.Add( 'TE_SOBREPESO', String(iif(chkSobrepeso.Checked, 'S', 'N')));
                 Sql.Fields.Add( 'TE_SISTOLE', edPersSistolica.Value);
                 Sql.Fields.Add( 'TE_DIASTOLE', edPersDiastolica.Value);
                 Sql.Fields.Add( 'TE_TABAQUISMO', gbTabaquismo.ItemIndex);
                 Sql.Fields.Add( 'TE_ALCOHOLISMO', Alcoholismo);
                 Sql.Fields.Add( 'TE_ALCOHOL_TIPO', edTipoAlcohol.Text);
                 Sql.Fields.Add( 'TE_TRATAMIENT', dbmTratamiento.Text);
                 Sql.Fields.Add( 'TE_PIEL', cgPiel.Value);
                 Sql.Fields.Add( 'TE_PIEL_OTROS', dbePiel_Otros.Text);
                 Sql.Fields.Add( 'TE_OJO', cgOjos.Value);
                 Sql.Fields.Add( 'TE_OJOS_ALTE', dbeOjos_Alteracion.Text);
                 Sql.Fields.Add( 'TE_OJOS_AGUDD', edOjos_AgudezaD.Value);
                 Sql.Fields.Add( 'TE_OJOS_AGUDI', edOjos_AgudezaI.Value);
                 Sql.Fields.Add( 'TE_BOCA', cgBoca.Value);
                 Sql.Fields.Add( 'TE_NARIZ', cgNariz.Value);
                 Sql.Fields.Add( 'TE_CUELLO', dbeCuello_Obs.Text);
                 Sql.Fields.Add( 'TE_TORAX', cgTorax.Value);
                 Sql.Fields.Add( 'TE_CORAZON', cgCorazon.Value);
                 if rgVarices.Enabled then
                   Sql.Fields.Add( 'TE_VARICES', rgVarices.ItemIndex);
                 Sql.Fields.Add( 'TE_ABDOMEN', cgAbdomen.Value);
                 Sql.Fields.Add( 'TE_ABDO_OTROS', dbeAbdomen_Otras.Text);
                 Sql.Fields.Add( 'TE_HERNIA_UMB', SqlSwitch(Ord(chbHernia_Umbilical.Checked), ['N', 'S'], True), False);
                 Sql.Fields.Add( 'TE_HERNIA_ING', SqlSwitch(gbHernia_Inguinal.ItemIndex, ['D', 'I', 'B'], True), False);
                 Sql.Fields.Add( 'TE_HERNIA_CRU', SqlSwitch(gbHernia_Crural.ItemIndex, ['D', 'I', 'B'], True), False);
                 Sql.Fields.Add( 'TE_EXTREMIDAD', cgExtremidades.Value);
                 Sql.Fields.Add( 'TE_EDEMAS', dbeEdemasPre_Obs.Text);
                 Sql.Fields.Add( 'TE_NEUROLOGIC', cgNeurologico.Value );
                 Sql.Fields.Add( 'TE_COLUMDEFO', cgColDeformidades.Value);
                 Sql.Fields.Add( 'TE_COLUMCICA', cgColCicatrices.Value);
                 Sql.Fields.Add( 'TE_COLUMDOLO', cgColPuntosDolosos.Value);
                 Sql.Fields.Add( 'TE_COLUMCONT', cgColContractura.Value);
                 Sql.Fields.Add( 'TE_HERNIADISCAL', rgHerniaDiscal.ItemIndex);
                 Sql.Fields.Add( 'TE_ESPONDILOART', rgEspondiloart.ItemIndex);
                 Sql.Fields.Add( 'TE_ESPONDILOARTRITIS', rgEspondiloartritis.ItemIndex);


                 Sql.Fields.Add( 'TE_COLUMLIMIT', cgColLimitaciones.Value);
                 Sql.Fields.Add( 'TE_COLUMLASEG', String(IIF(rbLasegue_Izq.Checked, '''I''', IIF(rbLasegue_Der.Checked, '''D''', 'NULL'))), False);
                 Sql.Fields.Add( 'TE_OSTEOARTICULAR', SqlSwitch(rgOsteoartucular.ItemIndex, ['N', 'A'], True), False);

                 if (ModoABM = maAdd) then begin
                    Sql.SqlType := stInsert;
                    Sql.Fields.Add( 'TE_USUALTA', frmPrincipal.DBLogin.LoginName );
                    Sql.Fields.Add( 'TE_FECHAALTA', SQL_ACTUALDATE, False );
                 end else begin
                    Sql.SqlType := stUpdate;
                    Sql.Fields.Add( 'TE_USUMODIF', frmPrincipal.DBLogin.LoginName );
                    Sql.Fields.Add( 'TE_FECHAMODIF', SQL_ACTUALDATE, False );
                 end;

                 EjecutarSqlST( Sql.Sql );   // Graba Historia Clínica
               finally
                 Sql.Free;
               end;


               // Graba Alteraciones -------------------------------------------------------------------------------------
               WriteStatusText('Guardando las Alteraciones Clínicas...');
               sSql := 'DELETE ACD_DATCLINIC ' +
                        'WHERE CD_CUIT = ''' + ClaveEstudio.CUIT + ''' ' +
                          'AND CD_ESTABLECI = ''' + IntToStr(ClaveEstudio.Estableci) + ''' ' +
                          'AND CD_CUIL = ''' + ClaveEstudio.CUIL + ''' ' +
                          'AND CD_FECHA = ' + SqlDate(ClaveEstudio.Fecha) + ' ' +
                          'AND CD_ESTUDIO = ''' +  ClaveEstudio.Estudio + '''' ;
               EjecutarSqlST( sSql );

               mdDatosClinicos.DisableControls;
               mdDatosClinicos.First;
               try
                  While not mdDatosClinicos.Eof do begin
                        sSql := 'INSERT INTO ACD_DATCLINIC ' +
                                '(CD_CUIT, CD_ESTABLECI, CD_FECHA, CD_CUIL, CD_ESTUDIO, CD_ITEM, CD_ORDEN, CD_DESCRIPCION) ' +
                                'VALUES (''' + ClaveEstudio.CUIT + ''', ' + SqlInt(ClaveEstudio.Estableci) + ', ' +
                                ' ' + SqlDate(ClaveEstudio.Fecha) + ', ''' + ClaveEstudio.CUIL + ''', ''' + ClaveEstudio.Estudio + ''', ''' + mdDatosClinicosITEM.AsString + ''', ' +
                                mdDatosClinicosORDEN.AsString + ', ' + SqlString(mdDatosClinicosOBSERVACIONES.AsString, True) + ')';
                        EjecutarSqlST( sSql );

                        mdDatosClinicos.Next;
                  end;
               finally
                  mdDatosClinicos.EnableControls;
               end;
             //end;

             CommitTrans;
             Result := True;
             WriteStatusText('Los datos se guardaron correctamente.');
          Except
              On E: Exception do begin
                 Result := False;
                 RollBack;
                 ErrorMsg( E );
                 WriteStatusText('');
              end;
          end;
          Screen.Cursor := crDefault;
     end;  // with dmPrincipal
end;
{----------------------------------------------------------------------------------------------------------------------}
{
function TfrmHistoriaClinica.GuardarDatos : boolean;
Var Sql : String;
    Sql : TSql;
begin
     with dmPrincipal do begin
          try
             sdbPrincipal.StartTransaction;
             Screen.Cursor := crHourGlass;

             WriteStatusText('Guardando los Datos del Estudio...');
             SaveResult( rgResultados.ItemIndex + 1,
                         TipoResultado(rgResultados.ItemIndex = 0),
                         fraPrestador.edCodigo.Text,
                         edFecha.Date );

             WriteStatusText('Guardando los Datos de la Historia Clínica...');
             if (edFecha.Date <> 0) Then begin
                 if (ModoABM = maAdd) then
                    sql := ' INSERT INTO ATE_EXATRAB '
                 else
                    sql := ' UPDATE ATE_EXATRAB SET ';

                 Sql := Sql + '( TE_CUIT, TE_ESTABLECI, TE_PERIODO, TE_CUIL, TE_ESTUDIO, ' +
                                'TE_MEDICO, TE_SECCION, TE_PUESTO, TE_ANTIGPUESTO, TE_ANTECEDENTES, TE_SINTOMAS, TE_OBSERV, ' +
                                'TE_PESO, TE_TALLA, TE_PULSO, TE_SISTOLE, TE_DIASTOLE, TE_TABAQUISMO, TE_ALCOHOLISMO, ' +
                                'TE_ALCOHOL_TIPO, TE_TRATAMIENT, TE_PIEL, TE_PIEL_OTROS, TE_OJO, TE_OJOS_ALTE, ' +
                                'TE_OJOS_AGUDD, TE_OJOS_AGUDI, TE_BOCA, TE_NARIZ, TE_CUELLO, TE_TORAX, TE_CORAZON, ' +
                                'TE_ABDOMEN, TE_ABDO_OTROS, TE_HERNIA_ING, TE_HERNIA_CRU, TE_EXTREMIDAD, TE_EDEMAS, ' +
                                'TE_NEUROLOGIC, TE_OPAC_PROFI, TE_OPAC_PROFU, TE_OPAC_REDON, TE_OPAC_IRREG, TE_OPAC_GRAND, ' +
                                'TE_OPAC_PLEUR, TE_CALCIFIC, TE_COLUMDEFO, TE_COLUMCICA, TE_COLUMDOLO, TE_COLUMCONT, ' +
                                'TE_COLUMLIMIT, TE_COLUMLASEG, TE_INCARESP, TE_INCARESPTO, TE_OSTEOARTICULAR, ' +
                                'TE_ESPIROMETRIA, TE_ESPIRO_GRADO, TE_USUALTA, TE_FECHAALTA, TE_USUMODIF, TE_FECHAMODIF) ';
                 if (ModoABM = maAdd) then
                    sql := sql + ' VALUES ( '
                 else
                    sql := sql + ' = (SELECT ';


                 Sql := Sql + '''' + ClaveEstudio.Cuit + ''', ' +
                              SqlInt(ClaveEstudio.Estableci) + ', ' +
                              '''' + ClaveEstudio.Periodo + ''', ' +
                              '''' + ClaveEstudio.Cuil + ''', ' +
                              '''' + ClaveEstudio.Estudio + ''', ' +
                              '''' + fraMedico.edCodigo.Text  + ''', ' +
                              SqlString(edSeccionTrab.Text, True) + ', ' +
                              SqlString(edPuestoTrabajo.Text, True) + ', ' +
                              edAntiguedad.TextSql + ', ' +
                              SqlString(dmObsTrabajador.Text, True) + ', ' +
                              SqlString(edObservaciones.Text, True) + ', ' +
                              dbePeso.TextSql + ', ' +
                              SqlNumber(dbeTalla.Value, True) + ', ' +
                              dbePulso.TextSql + ', ' +
                              edPersSistolica.TextSql + ', ' +
                              edPersDiastolica.TextSql + ', ' +
                              SqlCardinal( gbTabaquismo.ItemIndex ) + ', ' +
                              SqlCardinal( Alcoholismo ) + ', ' +
                              SqlString(edTipoAlcohol.Text, True) + ', ' +
                              SqlString(dbmTratamiento.Text, True) + ', ' +
                              '''' + cgPiel.Value + ''', ' +
                              SqlString(dbePiel_Otros.Text, True) + ', ' +
                              '''' + cgOjos.Value + ''', ' +
                              SqlString(dbeOjos_Alteracion.Text, True) + ', ' +
                              edOjos_AgudezaD.TextSql + ', ' +
                              edOjos_AgudezaI.TextSql + ', ' +
                              '''' + cgBoca.Value + ''', ' +
                              '''' + cgNariz.Value + ''', ' +
                              SqlString(dbeCuello_Obs.Text, True) + ', ' +
                              '''' + cgTorax.Value + ''', ' +
                              '''' + cgCorazon.Value + ''', ' +
                              '''' + cgAbdomen.Value + ''', ' +
                              SqlString(dbeAbdomen_Otras.Text, True) + ', ' +
                              SqlArray(gbHernia_Inguinal.ItemIndex, ['D', 'I', 'B'], True) + ', ' +
                              SqlArray(gbHernia_Crural.ItemIndex, ['D', 'I', 'B'], True) + ', ' +
                              '''' + cgExtremidades.Value + ''', ' +
                              SqlString(dbeEdemasPre_Obs.Text, True) + ', ' +
                              '''' + cgNeurologico.Value + ''', ' +
                              OpacidadesSql +
                              '''' + cgOpacPleurales.Value + ''', ' +
                              '''' + cgCalcificaciones.Value + ''', ' +
                              '''' + cgColDeformidades.Value + ''', ' +
                              '''' + cgColCicatrices.Value + ''', ' +
                              '''' + cgColPuntosDolosos.Value + ''', ' +
                              '''' + cgColContractura.Value + ''', ' +
                              '''' + cgColLimitaciones.Value + ''', ' +
                              IIF(rbLasegue_Izq.Checked, '''I''', IIF(rbLasegue_Der.Checked, '''D''', 'NULL')) + ', ' +
                              SqlString(dbeIncapRepiro.Text, True) + ', ' +
                              SqlString(dbeIncapRespiroTO.Text, True) + ', ' +
                              SqlArray(rgOsteoartucular.ItemIndex, ['N', 'A'], True) + ', ' ;


                 if ( cmbEspirometria.ItemIndex = 0 ) then
                    Sql := Sql + ' NULL, NULL, '
                 else
                    Sql := Sql + SqlInt( cmbEspirometria.ItemIndex ) + ', ' +
                                 SqlArray(cmbEspiroGrado.ItemIndex, ['L', 'M', 'G'], True) + ', ';


                 if (ModoABM = maAdd) then
                    sql := sql + '''' + frmPrincipal.DBLogin.LoginName + ''', ActualDate, null, null )'
                 else begin
                    sql := sql + '''' + NVL(qryAnalisisTE_USUALTA.AsString, frmPrincipal.DBLogin.LoginName) + ''', ' + SqlDate(qryAnalisisTE_FECHAALTA.AsDateTime) + ', ''' + frmPrincipal.DBLogin.LoginName + ''', ActualDate ' +
                                 ' FROM DUAL)' +
                                 ' WHERE te_cuit = ''' + ClaveEstudio.Cuit + '''' +
                                    ' AND te_estableci = ' + SqlInt(ClaveEstudio.Estableci) +
                                    ' AND te_periodo = ''' + ClaveEstudio.Periodo + '''' +
                                    ' AND te_cuil = ''' + ClaveEstudio.Cuil + '''' +
                                    ' AND TE_ESTUDIO = ''' +  ClaveEstudio.Estudio + '''' ;
                 end;
                 EjecutarSqlST( Sql );   // Graba Historia Clínica


                 // Graba Alteraciones -------------------------------------------------------------------------------------
                 WriteStatusText('Guardando las Alteraciones Clínicas...');
                 Sql := 'DELETE ACD_DATCLINIC ' +
                         'WHERE CD_CUIT = ''' + ClaveEstudio.CUIT + ''' ' +
                           'AND CD_ESTABLECI = ''' + IntToStr(ClaveEstudio.Estableci) + ''' ' +
                           'AND CD_PERIODO = ''' + ClaveEstudio.Periodo + ''' ' +
                           'AND CD_CUIL = ''' + ClaveEstudio.CUIL + ''' ' +
                           'AND CD_ESTUDIO = ''' +  ClaveEstudio.Estudio + '''' ;
                 EjecutarSqlST( Sql );

                 mdDatosClinicos.DisableControls;
                 mdDatosClinicos.First;
                 try
                    While not mdDatosClinicos.Eof do begin
                          Sql := 'INSERT INTO ACD_DATCLINIC ' +
                                 '(CD_CUIT, CD_ESTABLECI, CD_PERIODO, CD_CUIL, CD_ESTUDIO, CD_ITEM, CD_ORDEN, CD_DESCRIPCION) ' +
                                 'VALUES (''' + ClaveEstudio.CUIT + ''', ' + SqlInt(ClaveEstudio.Estableci) + ', ' +
                                 '''' + ClaveEstudio.Periodo + ''', ''' + ClaveEstudio.CUIL + ''', ''' + ClaveEstudio.Estudio + ''', ''' + mdDatosClinicosITEM.AsString + ''', ' +
                                 mdDatosClinicosORDEN.AsString + ', ' + SqlString(mdDatosClinicosOBSERVACIONES.AsString, True) + ')';
                          EjecutarSqlST( Sql );

                          mdDatosClinicos.Next;
                    end;
                 finally
                    mdDatosClinicos.EnableControls;
                 end;
             end;

             sdbPrincipal.Commit;
             Result := True;
          Except
              On E: Exception do begin
                 Result := False;
                 sdbPrincipal.Rollback;
                 ErrorMsg( E );
              end;
          end;
          Screen.Cursor := crDefault;
     end;  // with dmPrincipal
end;
}
//----------------------------------------------------------------------------//
procedure TfrmHistoriaClinica.CargarAlteraciones;
var
   sSql    : string;
   sdqTemp : TSDQuery;
begin
     ssql := 'SELECT CD_ITEM, AT_DESCRIPCION, CD_ORDEN, CD_DESCRIPCION' +
              ' FROM AAT_ALTERACIONES, ACD_DATCLINIC' +
             ' WHERE AT_ITEM = CD_ITEM' +
               ' AND CD_CUIT = ''' + ClaveEstudio.Cuit + '''' +
               ' AND CD_CUIL = ''' + ClaveEstudio.Cuil + '''' +
               ' AND CD_ESTABLECI = ' + SqlInt(ClaveEstudio.Estableci) +
               ' AND CD_FECHA = ' + SqlDate(ClaveEstudio.Fecha) + ' ' +
               ' AND CD_ESTUDIO = ''' + ClaveEstudio.Estudio + '''' +
               ' ORDER BY CD_ITEM, CD_ORDEN';


     sdqTemp := GetQuery( sSql );
     if Assigned(sdqTemp) Then
        with sdqTemp do
        Try
             mdDatosClinicos.EmptyTable;
             while not Eof do begin
                   mdDatosClinicos.Insert;
                   mdDatosClinicosITEM.AsString             := FieldByName( 'CD_ITEM' ).AsString;
                   self.mdDatosClinicosDESCRIPCION.AsString := FieldByName( 'AT_DESCRIPCION' ).AsString;
                   mdDatosClinicosOBSERVACIONES.AsString    := FieldByName( 'CD_DESCRIPCION' ).AsString;
                   mdDatosClinicosORDEN.AsInteger           := FieldByName( 'CD_ORDEN' ).AsInteger;
                   mdDatosClinicos.Post;
                   Next;
             end;
             Close
        finally
             sdqTemp.Free ;
        end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmHistoriaClinica.Execute(AModoABM : TModoABM = maAdd): boolean;
begin
  btnGrabar.Enabled := AModoABM <> maConsulta;

     fraPrestador.Cargar( DatosEstudio.Prestador );
     rgResultados.ItemIndex  := ConversorResultadoLoad(trunc(DatosEstudio.Resultado - 1));
     fraOperativo.Cargar( DatosEstudio.Periodo );

     fraTipoEstudio.PeriodoOriginal := DatosEstudio.Periodo;
     fraTipoEstudio.Value           := DatosEstudio.Tipo;

     fraReconfirmacion.Fecha        := ClaveEstudio.Fecha;
     fraReconfirmacion.Cuil         := ClaveEstudio.Cuil;
     //fraReconfirmacion.Estudio      := ClaveEstudio.Estudio;
     fraReconfirmacion.Value        := DatosEstudio.Reconfirmacion;

     edFechaRPrest.Date := DatosEstudio.FechaRecPrest;
     edFechaRML.Date := DatosEstudio.FechaRecML;

     if AModoABM in [maUpdate, maConsulta] Then
       CargaDatos
     else begin
       edSeccionTrab.Text := ValorSqlEx('SELECT rs_sector ' +
                                        '  FROM hys.v_trabajadores_con_riesgo, hys.hur_ultimorelevamiento ' +
                                        ' WHERE rs_cuit = ur_cuit ' +
                                        '   AND rs_estableci = ur_estableci ' +
                                        '   AND rs_fecha = ur_fecharelev ' +
                                        '   AND rs_cuil = :cuil ' +
                                        '   AND ur_cuit = :cuit ' +
                                        '   AND ur_estableci = :estableci ' +
                                        '   AND ROWNUM = 1 ',
                                        [ClaveEstudio.Cuil, ClaveEstudio.Cuit, ClaveEstudio.Estableci]);

       edPuestoTrabajo.Text := ValorSqlEx('SELECT rs_tarea ' +
                                          '  FROM hys.v_trabajadores_con_riesgo, hys.hur_ultimorelevamiento ' +
                                          ' WHERE rs_cuit = ur_cuit ' +
                                          '   AND rs_estableci = ur_estableci ' +
                                          '   AND rs_fecha = ur_fecharelev ' +
                                          '   AND rs_cuil = :cuil ' +
                                          '   AND ur_cuit = :cuit ' +
                                          '   AND ur_estableci = :estableci ' +
                                          '   AND ROWNUM = 1 ',
                                          [ClaveEstudio.Cuil, ClaveEstudio.Cuit, ClaveEstudio.Estableci]);
     end;

     if not fraPrestador.IsSelected Then
        ActiveControl := fraPrestador.edCodigo
     else if (fraOperativo.edPeriodo.Text = '') and (not fraOperativo.ReadOnly) Then
        ActiveControl := fraOperativo.edPeriodo
     else
        ActiveControl := edSeccionTrab;

     if AModoABM = maAdd then
       pcHistoriasClinicas.ActivePageIndex := PAG_RESULTADOS
     else
       pcHistoriasClinicas.ActivePageIndex := PAG_DATOSPRINCIPALES;


     Result := Inherited Execute(AModoABM);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.tbAgregarDCClick(Sender: TObject);
Var iMax : Integer;
begin
     edDcItem.Text      := 'X.X';
     edDcItemDesc.Text  := 'Detalle de otras alteraciones encontradas';
     edDcObservaciones.Lines.Clear ;

     if mdDatosClinicos.IsEmpty Then
        edDcItemOrden.Text := '1'
     else begin
        iMax := 0;
        mdDatosClinicos.First ;
        repeat
           if (mdDatosClinicosITEM.AsString = 'X.X') and (iMax < mdDatosClinicosORDEN.AsInteger) Then
              iMax := mdDatosClinicosORDEN.AsInteger;
           mdDatosClinicos.Next ;
        until mdDatosClinicos.Eof ;
        edDcItemOrden.Value := iMax + 1;
     end;

     if ( fpDatosClinicos.ShowModal = mrOK ) then begin
         mdDatosClinicos.Insert;
         mdDatosClinicosOBSERVACIONES.AsString := edDcObservaciones.Lines.Text;
         mdDatosClinicosITEM.AsString          := edDcItem.Text;
         mdDatosClinicosORDEN.AsInteger        := edDcItemOrden.Value;
         mdDatosClinicosDESCRIPCION.AsString   := edDcItemDesc.Text;
         mdDatosClinicos.Post;

         dbgItemsObs.Refresh;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.tbModificarDCClick(Sender: TObject);
begin
     if not mdDatosClinicos.IsEmpty then begin
        edDcItem.Text          := mdDatosClinicosITEM.AsString ;
        edDcItemOrden.Text     := mdDatosClinicosORDEN.AsString ;
        edDcItemDesc.Text      := mdDatosClinicosDESCRIPCION.AsString ;
        edDcObservaciones.Text := self.mdDatosClinicosOBSERVACIONES.AsString ;
        if (fpDatosClinicos.ShowModal = mrOk) Then begin
            mdDatosClinicos.Edit;
            mdDatosClinicosOBSERVACIONES.AsString := edDcObservaciones.Text;
            mdDatosClinicos.Post;

            dbgItemsObs.Refresh;
        end;

     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.tbEliminarDCClick(Sender: TObject);
begin
     if (not mdDatosClinicos.IsEmpty) and
        (MsgBox('Se dispone a eliminar la Alteración Clínica' + #13 + '¿Esta usted Seguro?', MB_ICONQUESTION + MB_YESNO) = IDYES) then begin
        mdDatosClinicos.Delete;
        dbgItemsObs.DataSource.DataSet.Refresh;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.btnDcAceptarClick(Sender: TObject);
begin
     if (edDcItem.Text = 'X.X') and (edDcObservaciones.Lines.Text = '') then
        InvalidMsg( edDcObservaciones, 'Debe cargar las observaciones del item' )

     else
        fpDatosClinicos.ModalResult := mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmHistoriaClinica.ValidarDatos: boolean;
    procedure InvMsg(AControl : TWinControl; AText : String; APagina : Integer = 0);
    begin
        pcHistoriasClinicas.ActivePageIndex := APagina;
        InvalidMsg( AControl, AText);
    end;
begin
     Result := False;
     if not fraPrestador.IsSelected Then
        InvMsg( fraPrestador.edCodigo, 'Debe seleccionar el Prestador')

     else if fraTipoEstudio.IsEmpty Then
        InvMsg( fraTipoEstudio.edCodigo, 'Debe seleccionar el Tipo de Estudio.' )

     else if (fraTipoEstudio.Value = TE_EXAMEN_RECONFIRMACION) and fraReconfirmacion.IsEmpty then
        InvMsg( fraReconfirmacion.cmbEstudio, 'Debe seleccionar el estudio a reconfirmar.' )

     else if (fraTipoEstudio.Value = TE_EXAMEN_RECONFIRMACION) and
             not ExisteSQLEx('SELECT 1 ' +
                             '  FROM art.aet_estrab ' +
                             ' WHERE et_cuit = :cuit ' +
                             '   AND et_cuil = :cuil ' +
                             '   AND et_estableci = :estableci ' +
                             '   AND et_fecha = ' + SqlDate (fraReconfirmacion.Value.Fecha) +
                             '   AND et_estudio = :estudio ',
                              [ClaveEstudio.CUIT, ClaveEstudio.CUIL,
                               ClaveEstudio.Estableci, fraReconfirmacion.Value.Estudio]) then
       InvalidMsg(fraReconfirmacion.cmbEstudio,
                  'Hay inconsistencia de datos. Revise que CUIT/Estab/CUIL/Fecha/Estudio de la carga coincidan con el estudio existente a reconfirmar')

{     else if fraOperativo.edPeriodo.Text = '' Then
        InvMsg( edFecha, 'Debe cargar la Fecha del Exámen')
}
//     else if edSeccionTrab.Text = '' Then
//        InvMsg( edSeccionTrab, 'Debe cargar la Sección de Trabajo')

//     else if (edPuestoTrabajo.Text = '') then
//        InvMsg( edPuestoTrabajo, 'Debe especificar el Puesto de Trabajo')

     //else if fraMedico.edCodigo.Text = '' Then
     //   InvMsg( fraMedico.edCodigo, 'Debe cargar el Médico Informante')

     else if ((dbePeso.Value <> 0) and (dbePeso.Value < 30)) or (dbePeso.Value > 250) then
        InvMsg( dbePeso, 'Peso Erróneo.' + #13 + #13 + 'El peso debe estar entre los 30 y 250 Kg.', PAG_GENERAL)

     else if ((dbeTalla.Value <> 0) and (dbeTalla.Value < 60)) or (dbeTalla.Value > 250) then
        InvMsg( dbeTalla, 'Talla Errónea.' + #13 + #13 + 'El valor de la talla debe ser superior a 60cm e inferior a 250cm', PAG_GENERAL)

     else if ((dbePulso.Value <> 0) and (dbePulso.Value < 40)) or (dbePulso.Value > 180) then
        InvMsg( dbePulso, 'Pulso Erróneo.' + #13 + #13 + 'El valor del pulso debe estar entre 40 y 180.', PAG_GENERAL)

     else if ((edPersSistolica.Value <> 0) and (edPersSistolica.Value < 50)) or (edPersSistolica.Value > 280) then
        InvMsg( edPersSistolica, 'Presión Sistólica Errónea.' + #13 + #13 + 'El valor de la presión sistólica debe estar entre 50 y 280.', PAG_GENERAL)

     else if (edPersDiastolica.Value > 150) then
        InvMsg(edPersDiastolica, 'Presión Diastólica Errónea.' + #13 + #13 + 'La presión diastólica debe ser menor o igual a 150.', PAG_GENERAL)

     else if (Alcoholismo = -1) then
        InvMsg(gbAlcoholismo2, 'Debe seleccionar una medida de consumo de Alcohol.', PAG_GENERAL)

     else if (Alcoholismo > 0) and (edTipoAlcohol.Text = '') then
        InvMsg(edTipoAlcohol, 'Debe seleccionar el Tipo de Bebidas Alcoholicas.', PAG_GENERAL)

     else if (rgOsteoartucular.ItemIndex = -1) then
        InvMsg(rgOsteoartucular, 'Debe seleccionar el resultado del Exámen Osteoarticular.', PAG_HISTCLI2)

     else if (rgResultados.ItemIndex = -1) then
        InvMsg(rgResultados, 'Debe seleccionar el resultado del Exámen.', PAG_RESULTADOS)

     else if (edFechaRPrest.Date <> 0) and (edFechaRPrest.Date < ClaveEstudio.Fecha) then
       InvalidMsg( edFechaRPrest, 'La fecha de recepción por parte del prestador ' +
                                  'debe ser posterior o igual a la fecha del estudio.' )

     else if (edFechaRML.Date <> 0) and
             ((edFechaRML.Date < ClaveEstudio.Fecha) or (edFechaRML.Date < edFechaRPrest.Date)) then
       InvalidMsg( edFechaRML, 'La fecha de recepción en ML debe ser posterior o igual ' +
                               'a la fecha del estudio y/o de recepción por parte ' +
                               'del prestador.' )
     else if Length(edSeccionTrab.Text) > 60 then
        InvMsg(edSeccionTrab, 'Demasiados caracteres en el campo SECCION.')
     else
        Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmHistoriaClinica.GetAlcoholismo: Integer;
begin
     if rbAlcoholNC.Checked then
        Result := 0
     else if rbAlcohol250.Checked then
        Result := 1
     else if rbAlcohol500.Checked then
        Result := 2
     else if rbAlcohol1000.Checked then
        Result := 3
     else if rbAlcoholMas.Checked then
        Result := 4
     else
        Result := -1;
     //        raise Exception.Create( 'Error al tomar el valor para el Alcoholismo' );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.SetAlcoholismo(const Value: Integer);
begin
     Case Value of
          0: rbAlcoholNC.Checked   := True;
          1: rbAlcohol250.Checked  := True;
          2: rbAlcohol500.Checked  := True;
          3: rbAlcohol1000.Checked := True;
          4: rbAlcoholMas.Checked  := True;
     else
        raise Exception.Create( 'Valor de Alcoholismo fuera de rango' );
     end;
     edTipoAlcohol.Enabled := Alcoholismo <> 0 ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.rbAlcoholClick(Sender: TObject);
begin
     edTipoAlcohol.Enabled := Alcoholismo <> 0 ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.OnCheckGroupChange(Sender: TObject; Index: Integer);
Var sItem   : String;
begin
    if Sender is TCheckGroup Then
       With Sender as TCheckGroup do begin
            sItem   := Lpad( IntToStr(Tag), '0', 2 ) + '.' + Chr( 97 + Index );
            if Checked[ Index ] Then begin
               AddItem( sItem, strReplace( Items[Index], '&', '' ));
            end else
               DelItem( sItem );
       end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{procedure TfrmHistoriaClinica.cgColumnaItemChange(Sender: TObject; Index: Integer);
Var Sql,
    sItem : String;
    iItem : Integer;
begin
    iItem := (Index mod 5);
    if iItem > 1 Then Inc(iItem);
    sItem := '10.' + Chr( 97 + iItem ) + '.' + Chr( 97 + (Index div 5) );
    With cgColumna do
      if Checked[ Index ] Then begin
         Sql := 'SELECT AT_DESCRIPCION ' +
                  'FROM AAT_ALTERACIONES ' +
                 'WHERE AT_ITEM = ''' + sItem + '''';
         AddItem( sItem, 'Columna - ' + ValorSql( Sql ));
         pcHistoriasClinicas.ActivePage := tsAlteracionesClinicas;
      end else
         DelItem( sItem );
end;}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.cgColumnaItemChange(Sender: TObject; Index: Integer);
Var Sql,
    sItem : String;
begin
    if Sender is TCheckGroup Then
       With Sender as TCheckGroup do begin
            sItem := '10.' + Chr( 97 + Tag ) + '.' + Chr( 97 + Index );
              if Checked[ Index ] Then begin
                 Sql := 'SELECT AT_DESCRIPCION ' +
                          'FROM AAT_ALTERACIONES ' +
                         'WHERE AT_ITEM = ''' + sItem + '''';
                 AddItem( sItem, 'Columna - ' + ValorSql( Sql ));
              end else
                 DelItem( sItem );
       end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.btnCancelarClick(Sender: TObject);
begin
     mdDatosClinicos.EmptyTable;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmHistoriaClinica.tsResultadosEnter(Sender: TObject);
begin
   if ModoABM = maAdd then
     rgResultados.ItemIndex := 0
end;

procedure TfrmHistoriaClinica.ShortCutControlShortCuts1ShortCutPress(
  Sender: TObject);
begin
  pcHistoriasClinicas.SelectNextPage(false);
end;

procedure TfrmHistoriaClinica.ShortCutControlShortCuts2ShortCutPress(
  Sender: TObject);
begin
  pcHistoriasClinicas.SelectNextPage(true);
end;

procedure TfrmHistoriaClinica.SpeedButton1Click(Sender: TObject);
begin
  gbHernia_Inguinal.ItemIndex := -1
end;

procedure TfrmHistoriaClinica.SpeedButton2Click(Sender: TObject);
begin
  gbHernia_Crural.ItemIndex := -1
end;

procedure TfrmHistoriaClinica.rbLasegue_IzqDblClick(Sender: TObject);
begin
  rbLasegue_Izq.Checked := false
end;

procedure TfrmHistoriaClinica.rbLasegue_DerDblClick(Sender: TObject);
begin
  rbLasegue_Der.Checked := false
end;

function TfrmHistoriaClinica.ConversorResultadoSave(indice : Integer): Integer;
begin
  case indice of
    0 : Result := 0;
    1 : Result := 7;
    2 : Result := 1;
    3 : Result := 2;
    4 : Result := 3;
    5 : Result := 4;
    6 : Result := 5;
    7 : Result := 6;
  else Result := -1;
  end;
end;

function TfrmHistoriaClinica.ConversorResultadoLoad(indice : Integer): Integer;
begin
  case indice of
    0 : Result := 0;
    1 : Result := 2;
    2 : Result := 3;
    3 : Result := 4;
    4 : Result := 5;
    5 : Result := 6;
    6 : Result := 7;
    7 : Result := 1;
  else Result := -1;
  end;
end;

end.


