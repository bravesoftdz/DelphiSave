unit unEstAudiometria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, IntEdit, unFormEstudios, ComCtrls, Db, SDEngine,
  GroupCheckBox, Mask, ToolEdit, DateComboBox, unfraPrestadorAMP,
  CoordGrid, Menus, RXSwitch, unfraOperativo,unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraCtbTablas, unFraTipoEstudio, unArtFrame,
  ExtDlgs, unArtDbFrame, unFraReconfirmacion, CurrEdit, PatternEdit,
  Audiometria;

type
  TDibGroupBox = class(TGroupBox)
  public
     property Canvas;
  end;

  TfrmEstAudiometria = class(TFormEstudios)
    //Audiometria: TAudiometria;
    btnAceptar: TButton;
    btnCancelar: TButton;
    pnlEstudio: TPanel;
    Label6: TLabel;
    fraPrestador: TfraPrestadorAMP;
    PageControl1: TPageControl;
    tsAudicion: TTabSheet;
    tsAudiometria: TTabSheet;
    cgAlteraciones: TCheckGroup;
    pnlHipoacusia: TGroupBox;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    chkHipoPerceDer: TCheckBox;
    chkHipoConduDer: TCheckBox;
    chkHipoMixtaDer: TCheckBox;
    chkHipoPerceIzq: TCheckBox;
    chkHipoConduIzq: TCheckBox;
    chkHipoMixtaIzq: TCheckBox;
    pnlPorcentajes: TPanel;
    Label28: TLabel;
    Label39: TLabel;
    edPorceIncap: TIntEdit;
    edIncapLabo: TIntEdit;
    pnlOtros: TGroupBox;
    edOtros: TEdit;
    pnlOtotoxicos: TGroupBox;
    edOtotoxicos: TEdit;
    pnlAudiometrias: TPanel;
    edtI500: TIntEdit;
    edtD500: TIntEdit;
    edtD1000: TIntEdit;
    edtI1000: TIntEdit;
    edtI2000: TIntEdit;
    edtD2000: TIntEdit;
    edtI4000: TIntEdit;
    edtD4000: TIntEdit;
    edtDperd: TIntEdit;
    edtIperd: TIntEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    edtI125: TIntEdit;
    edtD125: TIntEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    edtD250: TIntEdit;
    edtI250: TIntEdit;
    edtI8000: TIntEdit;
    edtD8000: TIntEdit;
    Panel9: TPanel;
    pmnuAudiometria: TPopupMenu;
    mnuAudCopiar: TMenuItem;
    N1: TMenuItem;
    chkOidoDerecho: TRxSwitch;
    chkOidoIzquierdo: TRxSwitch;
    chkOseoDerecho: TRxSwitch;
    chkOseoIzquierdo: TRxSwitch;
    edOseoI250: TIntEdit;
    edOseoI500: TIntEdit;
    edOseoI1000: TIntEdit;
    edOseoI2000: TIntEdit;
    edOseoI4000: TIntEdit;
    edOseoD4000: TIntEdit;
    edOseoD2000: TIntEdit;
    edOseoD1000: TIntEdit;
    edOseoD500: TIntEdit;
    edOseoD250: TIntEdit;
    Operativo: TLabel;
    fraOperativo: TfraOperativo;
    fraTipoEstudio: TfraTipoEstudio;
    Label7: TLabel;
    SavePictureDialog: TSavePictureDialog;
    mnuGuardarComo: TMenuItem;
    Label8: TLabel;
    fraReconfirmacion: TfraReconfirmacion;
    pnlSisigrama: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edSisigramaDerecho: TCurrencyEdit;
    edSisigramaIzquierdo: TCurrencyEdit;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    bgLogoAudiometria: TGroupBox;
    cmbLogoAudiometria: TComboBox;
    lbFechaRPrest: TLabel;
    edFechaRPrest: TDateComboBox;
    lbFechaRML: TLabel;
    edFechaRML: TDateComboBox;
    pnlChks: TPanel;
    chkAM_AUDNORMAL: TCheckBox;
    chkAM_AUDTA: TCheckBox;
    chkAM_AUDINCULP: TCheckBox;
    chkAM_AUDTASC: TCheckBox;
    procedure OnOidoDerechoChange(Sender: TObject);
    procedure OnOidoIzquierdoChange(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure chkHipoacusiaEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
//    procedure OnAudItemExit(Sender: TObject);
//    procedure AudiometriaItemChange(Sender: TObject; Item: TAudioItem; LasPosition: TPoint);
//    procedure mnuAudCopiarClick(Sender: TObject);
//    procedure OnChkAudiometriaChange(Sender: TObject);
//    procedure mnuGuardarComoClick(Sender: TObject);
  private
//    procedure ReubicarAudiometrias(Editor : TIntEdit; Sharpes: TAudSharpe; Repaint : Boolean = True);
//    procedure ReubicarAudiometrias(xPos, Value : Integer; Sharpes: TAudSharpe; Repaint : Boolean = True);
    procedure CalcularPerdida;
    function GuardarDatos : Boolean;
    function Validar : Boolean;
//    function GetEditor(xPos : Integer; Tipo: TAudSharpe) : TIntEdit;

//    procedure SaveGif(Bitmap: TBitmap);
//    procedure SaveJPEG(Bitmap: TBitmap);

    procedure OnFraTipoEstudioChange(Sender: TObject);
  public
    function Execute(AModoABM : TModoABM = maAdd) : boolean; override;
  end;

//var  frmEstAudiometria: TfrmEstAudiometria;

implementation

uses unPrincipal, TBL_PerdAudi2, strFuncs, AnsiSql, CustomDlgs, unDmPrincipal,
     BinUtils, General, Clipbrd, RxGIF, JPeg, SqlFuncs, uncomunes;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmEstAudiometria }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstAudiometria.OnOidoDerechoChange(Sender: TObject);
begin
     edtDperd.Value := edtD500.Value + edtD1000.Value + edtD2000.Value + edtD4000.Value;
     CalcularPerdida;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstAudiometria.OnOidoIzquierdoChange(Sender: TObject);
begin
     edtIperd.Value := edtI500.Value + edtI1000.Value + edtI2000.Value + edtI4000.Value;
     CalcularPerdida;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstAudiometria.CalcularPerdida; {NFERNANDEZ}
var
   tmpdbDer,
   tmpdbIzq   : Real;
   dbDer,
   dbIzq      : Integer;
begin
  if (edtDperd.Value + edtIPerd.Value > 0) Then begin
     tmpdbDer := edtDperd.Value;
     tmpdbIzq := edtIperd.Value;

     If ( tmpdbDer = 368 ) then
        dbDer := 55
     else begin
        tmpdbDer := ( ( tmpdbDer / 5 ) - 20 ) + 1;
        dbDer    := Trunc( tmpdbDer );
     end;

     If ( tmpdbIzq = 368 ) then
        dbIzq := 55
     else begin
        tmpdbIzq := ( ( tmpdbIzq / 5 ) - 20 ) + 1;
        dbIzq    := Trunc( tmpdbIzq );
     end;

     if ( dbDer < 1 ) or ( dbIzq < 1 ) then begin
        dbDer := 1;
        dbIzq := 1;
     end;

     if ( dbDer > 55 ) or ( dbIzq > 55 )  then begin
        dbDer := 1;
        dbIzq := 1;
     end;

     If ( dbDer > dbIzq ) then
        edPorceIncap.Text := PerdAudi[ dbDer, dbIzq ]
     else
        edPorceIncap.Text := PerdAudi[ dbIzq, dbDer ];

     if ( DecimalSeparator <> '.' ) then
        edPorceIncap.Text := strReplace( edPorceIncap.Text, '.', DecimalSeparator );

     If ( edPorceIncap.Text = '0' ) then
        edIncapLabo.Text := '0'
     else
        edIncapLabo.Text := FloatToStr( edPorceIncap.Value * 0.42 );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmEstAudiometria.Validar: Boolean;
begin
  Result := False;
  if not fraPrestador.IsSelected Then
    InvalidMsg( fraPrestador.edCodigo, 'Debe seleccionar el prestador' )

  else if fraTipoEstudio.IsEmpty Then
    InvalidMsg( fraTipoEstudio.edCodigo, 'Debe seleccionar el Tipo de Estudio.' )

  else if (fraTipoEstudio.Value = TE_EXAMEN_RECONFIRMACION) and fraReconfirmacion.IsEmpty then
    InvalidMsg( fraReconfirmacion.cmbEstudio, 'Debe seleccionar el estudio a reconfirmar.' )

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

  else if (edFechaRPrest.Date <> 0) and (edFechaRPrest.Date < ClaveEstudio.Fecha) then
    InvalidMsg( edFechaRPrest, 'La fecha de recepción por parte del prestador ' +
                               'debe ser posterior o igual a la fecha del estudio.' )

  else if (edFechaRML.Date <> 0) and
          ((edFechaRML.Date < ClaveEstudio.Fecha) or (edFechaRML.Date < edFechaRPrest.Date)) then
    InvalidMsg( edFechaRML, 'La fecha de recepción en ML debe ser posterior o igual ' +
                            'a la fecha del estudio y/o de recepción por parte ' +
                            'del prestador.' )

  else if not(chkAM_AUDNORMAL.Checked or chkAM_AUDTA.Checked or chkAM_AUDTASC.Checked or chkAM_AUDINCULP.Checked ) then
    InvalidMsg(chkAM_AUDNORMAL , 'Debe Seleccionarse un Tipo.' )
//  else if (edtD4000.Text = '') then
//    InvalidMsg( edtD4000, 'Debe completar O. Derecho frecuencia 4000.')
//  else if (edtI4000.Text = '') then
//    InvalidMsg( edtI4000, 'Debe completar O. Izquierdo frecuencia 4000.')

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmEstAudiometria.GuardarDatos: Boolean;
Var
  Sql : TSql;
begin
    Result := False;
    if Validar Then With ClaveEstudio do begin
      Sql := TSql.Create ;
      Sql.TableName := 'AAM_AUDIOMETRIA';

      Sql.PrimaryKey.Add('AM_CUIT', CUIT);
      Sql.PrimaryKey.Add('AM_ESTABLECI', Estableci);
      Sql.PrimaryKey.Add('AM_CUIL', Cuil);
      Sql.PrimaryKey.Add('AM_FECHA', Fecha);
      Sql.PrimaryKey.Add('AM_ESTUDIO', Estudio);

      Sql.Fields.Add('AM_PERIODO', fraOperativo.edPeriodo.Text); {DESPUES QUITAR ESTO, PORQUE LO GUARDA EN LA AET_ESTRAB }

      Sql.Fields.Add('AM_ALTERACIONES', cgAlteraciones.Value);
      Sql.Fields.Add('AM_HIPOACUSIA', GetBinChecks([chkHipoPerceDer, chkHipoConduDer, chkHipoMixtaDer, chkHipoPerceIzq, chkHipoConduIzq, chkHipoMixtaIzq]) );
      Sql.Fields.Add('AM_ATOTOXICOS', edOtotoxicos.Text );
      Sql.Fields.Add('AM_AUDI_OTROS', edOtros.Text );

      Sql.Fields.Add('AM_D125',  edtD125.Value );
      Sql.Fields.Add('AM_I125',  edtI125.Value );
{      Sql.Fields.Add('AM_OD125', edOseoD125.Value );
      Sql.Fields.Add('AM_OI125', edOseoI125.Value );
}
      Sql.Fields.Add('AM_D250',  edtD250.Value );
      Sql.Fields.Add('AM_I250',  edtI250.Value );
      Sql.Fields.Add('AM_OD250', edOseoD250.Value );
      Sql.Fields.Add('AM_OI250', edOseoI250.Value );

      Sql.Fields.Add('AM_D500',  edtD500.Value );
      Sql.Fields.Add('AM_I500',  edtI500.Value );
      Sql.Fields.Add('AM_OD500', edOseoD500.Value );
      Sql.Fields.Add('AM_OI500', edOseoI500.Value );

      Sql.Fields.Add('AM_D1000',  edtD1000.Value );
      Sql.Fields.Add('AM_I1000',  edtI1000.Value );
      Sql.Fields.Add('AM_OD1000', edOseoD1000.Value );
      Sql.Fields.Add('AM_OI1000', edOseoI1000.Value );

      Sql.Fields.Add('AM_D2000',  edtD2000.Value );
      Sql.Fields.Add('AM_I2000',  edtI2000.Value );
      Sql.Fields.Add('AM_OD2000', edOseoD2000.Value );
      Sql.Fields.Add('AM_OI2000', edOseoI2000.Value );


      Sql.Fields.Add('AM_D4000',  edtD4000.Value );
      Sql.Fields.Add('AM_I4000',  edtI4000.Value );
      Sql.Fields.Add('AM_OD4000', edOseoD4000.Value );
      Sql.Fields.Add('AM_OI4000', edOseoI4000.Value );

      Sql.Fields.Add('AM_D8000',  edtD8000.Value );
      Sql.Fields.Add('AM_I8000',  edtI8000.Value );
{      Sql.Fields.Add('AM_OD8000', edOseoD8000.Value );
      Sql.Fields.Add('AM_OI8000', edOseoI8000.Value );
}

      Sql.Fields.Add('AM_PORINCA', edPorceIncap.Value );
      Sql.Fields.Add('AM_POIINCL', edIncapLabo.Value );

      Sql.Fields.Add('AM_LOGOAUDIOMETRIA', SqlSwitch(cmbLogoAudiometria.ItemIndex, ['C', 'S'], True), False );
      Sql.Fields.AddExtended('AM_SISIGRAMA_OD', edSisigramaDerecho.Value,   ALL_DECIMALS, True );
      Sql.Fields.AddExtended('AM_SISIGRAMA_OI', edSisigramaIzquierdo.Value, ALL_DECIMALS, True );


      if ModoABM = maUpdate Then begin
         Sql.Fields.Add('AM_USUMODIF', frmPrincipal.DBLogin.LoginName );
         Sql.Fields.Add('AM_FECHAMODIF', 'ACTUALDATE', False );
         Sql.SqlType := stUpdate;
      end else begin
         Sql.Fields.Add('AM_USUALTA', frmPrincipal.DBLogin.LoginName );
         Sql.Fields.Add('AM_FECHAALTA', 'ACTUALDATE', False );
         Sql.SqlType := stInsert;
      end;
        {                     'SET AM_ALTERACIONES = ''' + GetBinChecks([chkProteccion, chkTapon, chkTimpano, chkEczema, chkSupuracion]) + ''', ' +}
{
           Sql := 'UPDATE AAM_AUDIOMETRIA ' +
                     'SET AM_ALTERACIONES = ''' + cgAlteraciones.Value + ''', ' +
                         'AM_HIPOACUSIA = ''' + GetBinChecks([chkHipoPerceDer, chkHipoConduDer, chkHipoMixtaDer, chkHipoPerceIzq, chkHipoConduIzq, chkHipoMixtaIzq]) + ''', ' +
                         'AM_ATOTOXICOS = ' + SqlString( edOtotoxicos.Text, True ) + ', ' +
                         'AM_AUDI_OTROS = ' + SqlString( edOtros.Text, True ) + ', ' +
                         'AM_D500 = ' + edtD500.TextSql + ', ' +
                         'AM_I500 = ' + edtI500.TextSql + ', ' +
                         'AM_D1000 = ' + edtD1000.TextSql + ', ' +
                         'AM_I1000 = ' + edtI1000.TextSql + ', ' +
                         'AM_D2000 = ' + edtD2000.TextSql + ', ' +
                         'AM_I2000 = ' + edtI2000.TextSql + ', ' +
                         'AM_D4000 = ' + edtD4000.TextSql + ', ' +
                         'AM_I4000 = ' + edtI4000.TextSql + ', ' +
                         'AM_PORINCA = ' + edPorceIncap.TextSql + ', ' +
                         'AM_POIINCL = ' + edIncapLabo.TextSql + ', ' +
                         'AM_USUMODIF = ''' + frmPrincipal.DBLogin.LoginName + ''', ' +
                         'AM_FECHAMODIF = ACTUALDATE ' +
                   'WHERE AM_CUIT = ''' + CUIT + ''' ' +
                     'AND AM_ESTABLECI = ' + SqlInt( Estableci ) + ' ' +
                     'AND AM_PERIODO = ''' + Periodo + ''' ' +
                     'AND AM_CUIL = ''' + Cuil + ''' ' +
                     'AND AM_ESTUDIO = ''' + Estudio + ''''
        else
           Sql := 'INSERT INTO AAM_AUDIOMETRIA ' +
                  '(AM_CUIT, AM_ESTABLECI, AM_PERIODO, AM_CUIL, AM_ESTUDIO, AM_ALTERACIONES, AM_HIPOACUSIA, AM_ATOTOXICOS, ' +
                   'AM_AUDI_OTROS, AM_D500, AM_I500, AM_D1000, AM_I1000, AM_D2000, AM_I2000, AM_D4000, AM_I4000, ' +
                   'AM_PORINCA, AM_POIINCL, AM_USUALTA, AM_FECHAALTA) ' +
                   'VALUES (''' + CUIT + ''', ' + SqlInt( Estableci ) + ', ''' + Periodo + ''', ''' + Cuil + ''', ' +
                   '''' + Estudio + ''', ''' + cgAlteraciones.Value + ''', ''' +
                   GetBinChecks([chkHipoPerceDer, chkHipoConduDer, chkHipoMixtaDer, chkHipoPerceIzq, chkHipoConduIzq, chkHipoMixtaIzq]) + ''', ' +
                   SqlString( edOtotoxicos.Text, True ) + ', ' + SqlString( edOtros.Text, True ) + ', ' +
                   edtD500.TextSql + ', ' + edtI500.TextSql + ', ' + edtD1000.TextSql + ', ' + edtI1000.TextSql + ', ' +
                   edtD2000.TextSql + ', ' + edtI2000.TextSql + ', ' + edtD4000.TextSql + ', ' + edtI4000.TextSql + ', ' +
                   edPorceIncap.TextSql + ', ' + edIncapLabo.TextSql + ', ''' + frmPrincipal.DBLogin.LoginName + ''', ACTUALDATE)';
}
      {- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
      Try
         BeginTrans;
           SaveResult(0,
                      TipoResultado(edtDperd.Value + edtIperd.Value <= 180),
                      fraPrestador.edCodigo.Text,
                      fraOperativo.edPeriodo.Text,
                      fraTipoEstudio.PeriodoOriginal,
                      DatosEstudio.IDCarpetaAMP,
                      DatosEstudio.IDDetalleArchivo,
                      DatosEstudio.CarpetaPendiente,
                      fraTipoEstudio.Value,
                      fraReconfirmacion.Value,
                      edFechaRPrest.Date,
                      edFechaRML.Date );

           DatosFormularioGuardar(
               Self,
               Sql,
               GetQuery('SELECT * FROM ' + SQL.TableName + ' WHERE ROWNUM = 0').FieldList
           );
           EjecutarSqlST( Sql.Sql );
           Result := True;
         CommitTrans;
      Except
         on E: Exception do begin
            Rollback;
            ErrorMsg(E);
         end;
      End;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmEstAudiometria.Execute(AModoABM : TModoABM = maAdd): boolean;
Var sdqConsulta : TSDQuery;
//    sBinary,
    Sql         : String;
//    i           : Integer;
begin
  btnAceptar.Enabled := AModoABM <> maConsulta;
    Try
      fraReconfirmacion.Fecha          := ClaveEstudio.Fecha;
      fraReconfirmacion.Cuil           := ClaveEstudio.Cuil;
      //fraReconfirmacion.Estudio        := ClaveEstudio.Estudio;
      fraReconfirmacion.Value          := DatosEstudio.Reconfirmacion;

      With DatosEstudio do begin
        fraPrestador.Cargar(Prestador);
        fraOperativo.Cargar(Periodo);
        fraTipoEstudio.PeriodoOriginal := Periodo;
        fraTipoEstudio.Value           := Tipo;
        OnFraTipoEstudioChange( Nil );

        if Tipo <> TE_EXAMEN_RECONFIRMACION then
        begin
          fraReconfirmacion.Clear;
          fraReconfirmacion.ForeColor := clBtnFace;
          fraReconfirmacion.ReadOnly  := True;
        end
        else begin
          fraReconfirmacion.ForeColor := clWindow;
          fraReconfirmacion.ReadOnly  := False;
        end;
      end;

      edFechaRPrest.Date := DatosEstudio.FechaRecPrest;
      edFechaRML.Date := DatosEstudio.FechaRecML;

      if not fraPrestador.IsSelected Then
         ActiveControl := fraPrestador.edCodigo
      else if (fraOperativo.edPeriodo.Text = '') and (not fraOperativo.ReadOnly) Then
         ActiveControl := fraOperativo.edPeriodo
      else
         ActiveControl := chkAM_AUDNORMAL; //edtD500;


       if AModoABM in [maUpdate, maConsulta] Then begin
         With ClaveEstudio do
             Sql := 'SELECT AM_ALTERACIONES, AM_HIPOACUSIA, AM_ATOTOXICOS, AM_AUDI_OTROS, AM_PORINCA, AM_POIINCL, ' +
                           'AM_D125, AM_I125, AM_D250, AM_I250, AM_OD250, AM_OI250, AM_D500, ' +
                           'AM_I500, AM_OD500, AM_OI500, ' +
                           'AM_D1000, AM_I1000, AM_OD1000, AM_OI1000, AM_D2000, AM_I2000, AM_OD2000, AM_OI2000, ' +
                           'AM_D4000, AM_I4000, AM_OD4000, AM_OI4000, AM_D8000, AM_I8000, AM_PORINCA, ' +
                           'AM_LOGOAUDIOMETRIA, AM_SISIGRAMA_OD, AM_SISIGRAMA_OI, ' +
                           'AM_AUDINCULP, AM_AUDTA, AM_AUDTASC, AM_AUDNORMAL ' +
                      'FROM AAM_AUDIOMETRIA ' +
                     'WHERE AM_CUIT = ''' + Cuit + ''' ' +
                       'AND AM_ESTABLECI = ' + SqlInt( Estableci ) + ' ' +
                       'AND AM_CUIL = ''' + Cuil + ''' ' +
                       'AND AM_FECHA = ' + SqlDate(Fecha) + ' ' +
                       'AND AM_ESTUDIO = ''' + Estudio + '''';
         sdqConsulta := GetQuery( Sql );
         Try
            if sdqConsulta.IsEmpty Then
               Raise Exception.Create('ERROR - No se encontró la Audiometría')
            else begin
//               SetBinChecks( sdqConsulta.FieldByName('AM_ALTERACIONES').AsString, [chkProteccion, chkTapon, chkTimpano, chkEczema, chkSupuracion]);
               cgAlteraciones.Value := sdqConsulta.FieldByName('AM_ALTERACIONES').AsString;
               SetBinChecks( sdqConsulta.FieldByName('AM_HIPOACUSIA').AsString,   [chkHipoPerceDer, chkHipoConduDer, chkHipoMixtaDer, chkHipoPerceIzq, chkHipoConduIzq, chkHipoMixtaIzq]);
               edOtotoxicos.Text  := sdqConsulta.FieldByName('AM_ATOTOXICOS').AsString;
               edOtros.Text       := sdqConsulta.FieldByName('AM_AUDI_OTROS').AsString;
               edtD125.Value      := sdqConsulta.FieldByName('AM_D125').AsInteger;
               edtI125.Value      := sdqConsulta.FieldByName('AM_I125').AsInteger;
{               edOseoD125.Value   := sdqConsulta.FieldByName('AM_OD125').AsInteger;
               edOseoI125.Value   := sdqConsulta.FieldByName('AM_OI125').AsInteger;
}
               edtD250.Value      := sdqConsulta.FieldByName('AM_D250').AsInteger;
               edtI250.Value      := sdqConsulta.FieldByName('AM_I250').AsInteger;
               edOseoD250.Value   := sdqConsulta.FieldByName('AM_OD250').AsInteger;
               edOseoI250.Value   := sdqConsulta.FieldByName('AM_OI250').AsInteger;

               edtD500.Value      := sdqConsulta.FieldByName('AM_D500').AsInteger;
               edtI500.Value      := sdqConsulta.FieldByName('AM_I500').AsInteger;
               edOseoD500.Value   := sdqConsulta.FieldByName('AM_OD500').AsInteger;
               edOseoI500.Value   := sdqConsulta.FieldByName('AM_OI500').AsInteger;

               edtD1000.Value     := sdqConsulta.FieldByName('AM_D1000').AsInteger;
               edtI1000.Value     := sdqConsulta.FieldByName('AM_I1000').AsInteger;
               edOseoD1000.Value  := sdqConsulta.FieldByName('AM_OD1000').AsInteger;
               edOseoI1000.Value  := sdqConsulta.FieldByName('AM_OI1000').AsInteger;

               edtD2000.Value     := sdqConsulta.FieldByName('AM_D2000').AsInteger;
               edtI2000.Value     := sdqConsulta.FieldByName('AM_I2000').AsInteger;
               edOseoD2000.Value  := sdqConsulta.FieldByName('AM_OD2000').AsInteger;
               edOseoI2000.Value  := sdqConsulta.FieldByName('AM_OI2000').AsInteger;

               edtD4000.Value     := sdqConsulta.FieldByName('AM_D4000').AsInteger;
               edtI4000.Value     := sdqConsulta.FieldByName('AM_I4000').AsInteger;
               edOseoD4000.Value  := sdqConsulta.FieldByName('AM_OD4000').AsInteger;
               edOseoI4000.Value  := sdqConsulta.FieldByName('AM_OI4000').AsInteger;

               edtD8000.Value     := sdqConsulta.FieldByName('AM_D8000').AsInteger;
               edtI8000.Value     := sdqConsulta.FieldByName('AM_I8000').AsInteger;
{               edOseoD8000.Value  := sdqConsulta.FieldByName('AM_OD8000').AsInteger;
               edOseoI8000.Value  := sdqConsulta.FieldByName('AM_OI8000').AsInteger;
}
               edPorceIncap.Value := sdqConsulta.FieldByName('AM_PORINCA').AsInteger;
               edIncapLabo.Value  := sdqConsulta.FieldByName('AM_POIINCL').AsInteger;

               cmbLogoAudiometria.ItemIndex := -1;
               if sdqConsulta.FieldByName('AM_LOGOAUDIOMETRIA').AsString = 'C' then
                 cmbLogoAudiometria.ItemIndex := 0
               else
                 if sdqConsulta.FieldByName('AM_LOGOAUDIOMETRIA').AsString = 'S' then
                   cmbLogoAudiometria.ItemIndex := 1;

               edSisigramaDerecho.Value     := sdqConsulta.FieldByName('AM_SISIGRAMA_OD').AsCurrency;
               edSisigramaIzquierdo.Value   := sdqConsulta.FieldByName('AM_SISIGRAMA_OI').AsCurrency;

               DatosFormularioLeer(pnlChks, sdqConsulta);
               
               {for i := 0 To Audiometria.References.Horizontal.Count - 1 do begin
                   ReubicarAudiometrias(i, -1, asOidoDerecho);
                   ReubicarAudiometrias(i, -1, asOidoIzquierdo);
                   if (i > 0) and (i < Audiometria.References.Horizontal.Count - 1) Then begin
                      ReubicarAudiometrias(i, -1, asOseoDerecho);
                      ReubicarAudiometrias(i, -1, asOseoIzquierdo);
                   end;
               end;
               }

            end;
         finally
            sdqConsulta.Free;
         end;
      end; {IF}
    Except
      On E: Exception do ErrorMsg( E, 'Error inicializar el formulario de estudios de la Audición');
    end;

    Result := Inherited Execute(AModoABM);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstAudiometria.btnAceptarClick(Sender: TObject);
begin
  {VerificarMultiple (['Infrmación no completada',
                        edtD500,
                        edtD500.Text <> EmptyStr,
                        'Los valores de 500Hz para oído derecho deben ser completados.',

                        edtI500,
                        edtI500.Text <> EmptyStr,
                        'Los valores de 500Hz para oído izquierdo deben ser completados.',

                        edtD1000,
                        edtD1000.Text <> EmptyStr,
                        'Los valores de 1000Hz para oído derecho deben ser completados. ',

                        edtI1000,
                        edtI1000.Text <> EmptyStr,
                        'Los valores de 1000Hz para oído izquierdo deben ser completados. ',

                        edtD2000,
                        edtD2000.Text <> EmptyStr,
                        'Los valores de 2000Hz para oído derecho deben ser completados. ',

                        edtI2000,
                        edtI2000.Text <> EmptyStr,
                        'Los valores de 2000Hz para oído izquierdo deben ser completados. ',

                        edtD4000,
                        edtD4000.Text <> EmptyStr,
                        'Los valores de 4000Hz para oído derecho deben ser completados. ',

                        edtI4000,
                        edtI4000.Text <> EmptyStr,
                        'Los valores de 4000Hz para oído izquierdo deben ser completados. '
                      ]
  );
  }
   if GuardarDatos Then
      ModalResult := mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstAudiometria.chkHipoacusiaEnter(Sender: TObject);
Var
   ARect : TRect;
begin
   ARect :=  TCheckBox(Sender).BoundsRect;
   InflateRect( ARect, 4, 4);
   TDibGroupBox(pnlHipoacusia).Canvas.DrawFocusRect( ARect );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstAudiometria.FormCreate(Sender: TObject);
begin
//  StatusBar                          := frmPrincipal.StatusBar ;
  fraTipoEstudio.FrameOperativo      := fraOperativo;
  fraTipoEstudio.FrameReconfirmacion := fraReconfirmacion;
  fraTipoEstudio.OnChange            := OnFraTipoEstudioChange;

  fraPrestador.ShowBajas := true;
end;
{----------------------------------------------------------------------------------------------------------------------}
//procedure TfrmEstAudiometria.ReubicarAudiometrias(Editor : TIntEdit; Sharpes: TAudSharpe; Repaint : Boolean = True);
{procedure TfrmEstAudiometria.ReubicarAudiometrias(xPos, Value : Integer; Sharpes: TAudSharpe; Repaint : Boolean = True);
Var
    AudioItem : TAudioItem;
    Editor    : TIntEdit;
begin
    if Value = -1 Then begin
       Editor := GetEditor(xPos, Sharpes);
       if Assigned(Editor) Then
          Value := Editor.Value
       else
          Raise Exception.Create('Error interno: No se encotró el editor.');
    end;

    AudioItem := Audiometria.Items.FindItem(Point(xPos, -1), [Sharpes]);
    if Assigned(AudioItem) and (((Value div 5) + 3) <> AudioItem.Position.y) Then begin
       AudioItem.Position := Point(xPos, (Value div 5) + 3);
       if Repaint Then
          Audiometria.Repaint ;
    end;
end;}
{----------------------------------------------------------------------------------------------------------------------}
{procedure TfrmEstAudiometria.AudiometriaItemChange(Sender: TObject; Item: TAudioItem; LasPosition: TPoint);
Var
   Editor : TComponent;
begin
   Editor := GetEditor( Item.Position.x, Item.Sharpe);
   if Assigned(Editor) Then
      TIntEdit(Editor).Text := Audiometria.References.Vertical[ Item.Position.y ].Title;
end;
}
{----------------------------------------------------------------------------------------------------------------------}
{function TfrmEstAudiometria.GetEditor(xPos: Integer; Tipo: TAudSharpe): TIntEdit;
Var sName : String;
begin
   Case Tipo of
      asOidoDerecho:   sName := 'edtD';
      asOidoIzquierdo: sName := 'edtI';
      asOseoDerecho:   sName := 'edOseoD';
      asOseoIzquierdo: sName := 'edOseoI';
   end;
   sName := sName + Audiometria.References.Horizontal[ xPos ].Title ;
   Result := TIntEdit( FindComponent(sName) );
end;}
{----------------------------------------------------------------------------------------------------------------------}
//procedure TfrmEstAudiometria.mnuAudCopiarClick(Sender: TObject);
{Var Clipboard : TClipboard;
    Bmp       : TBitmap;}
//begin
{    Clipboard := TClipboard.Create ;
    Bmp       := TBitmap.Create;
    Try
      Bmp.Height  := Audiometria.Height ;
      Bmp.Width   := Audiometria.Width ;
      Bmp.Palette := SystemPalette16;
      With Bmp do
        Canvas.CopyRect( Rect(0, 0, Width, Height), Audiometria.Canvas, Rect(0, 0, Width, Height));
      Clipboard.Assign( Bmp );
    finally
      Bmp.Free ;
      Clipboard.Free ;
    end;}
//    Audiometria.CopyToClipboard;
//end;
{----------------------------------------------------------------------------------------------------------------------}
{procedure TfrmEstAudiometria.OnChkAudiometriaChange(Sender: TObject);
begin
   With TRxSwitch(Sender) do begin
     if StateOn Then
        Audiometria.VisibleSharpes := Audiometria.VisibleSharpes + [TAudSharpe(Tag)]
     else
        Audiometria.VisibleSharpes := Audiometria.VisibleSharpes - [TAudSharpe(Tag)];
   end;
end;  }
{----------------------------------------------------------------------------------------------------------------------}
{procedure TfrmEstAudiometria.OnAudItemExit(Sender: TObject);
begin
   With TIntEdit(Sender) do
     ReubicarAudiometrias((Tag mod 7), Value, TAudSharpe( Tag div 7 ));
end;}
{----------------------------------------------------------------------------------------------------------------------}
{procedure TfrmEstAudiometria.mnuGuardarComoClick(Sender: TObject);
Var Bmp : TBitmap;
begin
    if SavePictureDialog.Execute Then begin
        Bmp  := TBitmap.Create;
        Try
          Bmp.Height           := Height ;
          Bmp.Width            := Width ;
          Bmp.PixelFormat      := pf8bit;
          Audiometria.DrawToCanvas( Bmp.Canvas );
          Case ArrayPos(UpperCase(ExtractFileExt(SavePictureDialog.FileName)), ['.BMP', '.GIF']) of
               0: Bmp.SaveToFile( SavePictureDialog.FileName );
               1: SaveGif( Bmp );
          else
             SaveJpeg( Bmp );
          end;
        finally
          Bmp.Free ;
        end;
    end;
end; }
{----------------------------------------------------------------------------------------------------------------------}
{procedure TfrmEstAudiometria.SaveGif(Bitmap: TBitmap);
Var
    GIFImage  : TGIFImage;
begin
    GIFImage  := TGIFImage.Create ;
    Try
       GIFImage.AddFrame( Bitmap );
       GIFImage.SaveToFile( SavePictureDialog.FileName );
    finally
       GIFImage.Free ;
    end;
end;}
{----------------------------------------------------------------------------------------------------------------------}
{procedure TfrmEstAudiometria.SaveJPEG(Bitmap: TBitmap);
Var Jpeg : TJpegImage;
begin
   Jpeg := TJpegImage.Create ;
   Try
       Jpeg.Assign ( Bitmap );
       Jpeg.CompressionQuality := 100;
       Jpeg.Compress ;
       Jpeg.SaveToFile( SavePictureDialog.FileName );
   finally
       Jpeg.Free ;
   end;
end;          }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstAudiometria.OnFraTipoEstudioChange(Sender: TObject);
Var bValue : Boolean;
    aColor : TColor;
begin
   if fraTipoEstudio.Value = TE_EXAMEN_RECONFIRMACION Then begin
      bValue := False;
      aColor := clWindow;
   end else begin
      bValue := True;
      aColor := clBtnFace;
   end;
   { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
   edSisigramaIzquierdo.ReadOnly := bValue;
   edSisigramaIzquierdo.TabStop  := not bValue;
   edSisigramaIzquierdo.Color    := aColor;

   edSisigramaDerecho.ReadOnly   := bValue;
   edSisigramaDerecho.TabStop    := not bValue;
   edSisigramaDerecho.Color      := aColor;

   cmbLogoAudiometria.Enabled    := not bValue;
   cmbLogoAudiometria.Color      := aColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

