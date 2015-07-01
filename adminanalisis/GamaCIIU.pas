unit GamaCIIU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, RxLookup, EditNew, ExtCtrls, Grids,
  DBGrids, RXDBCtrl, ComCtrls, Db, SDEngine, Mask, ToolEdit, DateComboBox,
  PatternEdit;

type
  TGamaCIU = class(TForm)
    sdqAnormal: TSDQuery;
    dsAnormal: TDataSource;
    PageControl: TPageControl;
    tsGama: TTabSheet;
    tsEmpresas: TTabSheet;
    dbgAnorma: TRxDBGrid;
    dbgEmpresas: TRxDBGrid;
    sdqActividad: TSDQuery;
    dsActividad: TDataSource;
    sdqEmpres: TSDQuery;
    dsEmpres: TDataSource;
    sdqEmpresET_CUIT: TStringField;
    sdqEmpresMP_NOMBRE: TStringField;
    sdqEmpresTOT: TFloatField;
    tsEstudios: TTabSheet;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lEstudio: TEdit;
    lEstudioDesc: TEdit;
    dbcActividad: TRxDBLookupCombo;
    btnBuscar: TBitBtn;
    Label1: TLabel;
    lCuit: TEdit;
    lCuitDesc: TEdit;
    dbgEstudios: TRxDBGrid;
    sdqEstudios: TSDQuery;
    dsEstudios: TDataSource;
    btnLimpiar: TBitBtn;
    sdqEmpresMEDIA: TFloatField;
    Label2: TLabel;
    Label3: TLabel;
    edGamaMinimo: TEdit;
    edGamaMaximo: TEdit;
    Label8: TLabel;
    edGamaTotal: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    sdqActividadAV_CODIGO: TStringField;
    sdqActividadAV_DESCRIPCION: TStringField;
    sdqEstudiosET_CUIL: TStringField;
    sdqEstudiosTJ_NOMBRE: TStringField;
    sdqEstudiosRESULTADO: TFloatField;
    sdqEstudiosET_CUIT: TStringField;
    sdqEstudiosET_ESTABLECI: TFloatField;
    sdqEstudiosET_FECHA: TDateTimeField;
    sdqAnormalRA_CIIU: TStringField;
    sdqAnormalER_ESTUDIO: TStringField;
    sdqAnormalES_DESCRIPCION: TStringField;
    sdqAnormalER_MINIMONORMAL: TFloatField;
    sdqAnormalER_MAXIMONORMAL: TFloatField;
    sdqAnormalTOT: TFloatField;
    sdqAnormalMEDIA: TFloatField;
    edCiiu: TPatternEdit;
    edDesde: TDateComboBox;
    edHasta: TDateComboBox;
    procedure edCiiuKeyPress(Sender: TObject; var Key: Char);
    procedure edCiiuExit(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgAnormaDblClick(Sender: TObject);
    procedure dbgEmpresasDblClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure dbgEstudiosDblClick(Sender: TObject);
    procedure dbcActividadCloseUp(Sender: TObject);
  private
  public
  end;

implementation

uses AnsiSql, unDmPrincipal, unHistoriaClinica;

{$R *.DFM}


//---------------------------------------------------------------------------//
procedure TGamaCIU.FormCreate(Sender: TObject);
begin
  sdqActividad.Open;
  PageControl.ActivePage := tsGama;
end;
//---------------------------------------------------------------------------//
procedure TGamaCIU.FormDestroy(Sender: TObject);
begin
  sdqActividad.Close;
end;
//---------------------------------------------------------------------------//
procedure TGamaCIU.edCiiuKeyPress(Sender: TObject; var Key: Char);
begin
     if ( Key = #13 ) then
        edCiiuExit( Self );
end;

//---------------------------------------------------------------------------//
procedure TGamaCIU.edCiiuExit(Sender: TObject);
var
   ssql : string;
begin
     ssql := ' SELECT av_descripcion ' +
             '   FROM cav_actividad ' +
             '  WHERE av_codigo = ''' + edCiiu.Text + '''';

//     dbcActividad.Value    := ValorSQL( ssql );
     dbcActividad.KeyValue := edCiiu.Text;
end;

//---------------------------------------------------------------------------//
procedure TGamaCIU.btnBuscarClick(Sender: TObject);
var
   ssql : string;
begin

  ssql := ' SELECT ra_ciiu, ER_estudio, es_descripcion, ER_MINIMONORMAL, ER_MAXIMONORMAL, ';

  if ( Trim( edDesde.Text ) = '/  /' ) then

     ssql := ssql + '  AMP.ANORMAL_TOT_ACT( '''+ edCiiu.Text +''', ER_ESTUDIO, ER_MINIMONORMAL, ER_MAXIMONORMAL ) tot, ' +
                    '  AMP.ANORMAL_MEDIA_ACT( '''+ edCiiu.Text +''', ER_ESTUDIO, ER_MINIMONORMAL, ER_MAXIMONORMAL ) media '
  else
     ssql := ssql + '  AMP.ANORMAL_TOT_ACT( '''+ edCiiu.Text +''', ER_ESTUDIO, ER_MINIMONORMAL, ER_MAXIMONORMAL, ' +
                    '     TO_DATE( ''' + edDesde.Text + ''', ''dd/mm/yyyy''), ' +
                    '     TO_DATE( ''' + edHasta.Text + ''', ''dd/mm/yyyy'') ) tot, ' +
                    '  AMP.ANORMAL_MEDIA_ACT( '''+ edCiiu.Text +''', ER_ESTUDIO, ER_MINIMONORMAL, ER_MAXIMONORMAL, ' +
                    '     TO_DATE( ''' + edDesde.Text + ''', ''dd/mm/yyyy''), ' +
                    '     TO_DATE( ''' + edHasta.Text + ''', ''dd/mm/yyyy'') ) media';

  ssql := ssql + '   FROM AER_ESTRIESG, ara_riesporact, aes_estudios ' +
                 '  WHERE ra_ciiu = '''+ edCiiu.Text +''''  +
                 '    AND ra_idrg = ER_idrg ' +
                 '    AND ER_estudio = es_codigo ' +
                 '  ORDER BY ra_ciiu, ER_estudio, ER_MINIMONORMAL ';

   OpenQuery(sdqAnormal, sSql);

   PageControl.ActivePage := tsGama;
end;

//---------------------------------------------------------------------------//
procedure TGamaCIU.dbgAnormaDblClick(Sender: TObject);
var
   ssql : string;
begin
     lEstudio.Text        := sdqAnormalER_ESTUDIO.AsString;
     lEstudioDesc.Text    := sdqAnormalES_DESCRIPCION.AsString;
     edGamaMinimo.Text    := sdqAnormalER_MINIMONORMAL.AsString;
     edGamaMaximo.Text    := sdqAnormalER_MAXIMONORMAL.AsString;
     edGamaTotal.Text     := sdqAnormalTOT.AsString;

     ssql := ' SELECT et_cuit, mp_nombre, count(*) tot, ' +
             '        AMP.Anormal_Media( et_cuit, et_estableci, et_estudio, ' +
             '        ' + SqlNumber( sdqAnormalER_MINIMONORMAL.AsFloat );

     if ( sdqAnormalER_MAXIMONORMAL.AsString <> '' ) then
        ssql := ssql + ', ' + SqlNumber( sdqAnormalER_MAXIMONORMAL.AsFloat ) + ') media'
     else
        ssql := ssql + ') media ';

     ssql := ssql + '   FROM aet_estrab, cmp_empresas ' +
                  '  WHERE exists ( SELECT 1 ' +
                  '                   FROM cst_estableci ' +
                  '                  WHERE st_cuit = et_cuit ' +
                  '                    AND st_clave = et_estableci ' +
                  '                    AND st_actividad = '''+ edCiiu.Text +''' )' +
                  '    AND et_cuit = mp_cuit '+
                  '    AND ET_FECHABAJA IS NULL ' +
                  '    AND et_estudio = ''' + sdqAnormalER_ESTUDIO.AsString + '''' +
                  '    AND et_resultado >= ' + SqlNumber( sdqAnormalER_MINIMONORMAL.AsFloat );

     if ( sdqAnormalER_MAXIMONORMAL.AsString <> '' ) then
        ssql := ssql + '    AND et_resultado <= ' + SqlNumber( sdqAnormalER_MAXIMONORMAL.AsFloat );

    if ( Trim( edDesde.Text ) <> '/  /' ) then
       ssql := ssql + ' AND et_fecha >= TO_DATE( ''' + edDesde.Text + ''', ''dd/mm/yyyy'') ' +
                      ' AND et_fecha <= TO_DATE( ''' + edHasta.Text + ''', ''dd/mm/yyyy'') ';

    ssql := ssql + '  GROUP BY et_cuit, mp_nombre, et_estableci, et_estudio ' +
                   '  ORDER by mp_nombre ';

     with sdqEmpres do begin
          Close;
          SQL.Clear;
          SQL.Add( ssql );
          Open;
     end;

     PageControl.ActivePage := tsEmpresas;

end;

//---------------------------------------------------------------------------//
procedure TGamaCIU.dbgEmpresasDblClick(Sender: TObject);
var
   ssql : string;
begin

     lCuit.Text     := sdqEmpresET_CUIT.AsString;
     lCuitDesc.Text := sdqEmpresMP_NOMBRE.AsString;

     ssql := ' SELECT et_cuil, tj_nombre, TO_NUMBER( et_resultado ) resultado, ' +
             '        et_cuit, et_estableci, et_fecha ' +
             '   FROM aet_estrab, ctj_trabajadores ' +
             '  WHERE exists ( SELECT 1 ' +
             '                   FROM cst_estableci ' +
             '                  WHERE st_cuit = et_cuit ' +
             '                    AND st_clave = et_estableci ' +
             '                    AND st_actividad = '''+ edCiiu.Text +''' )' +
             '    AND et_cuil = tj_cuil ' +
             '    AND ET_FECHABAJA IS NULL ' +  
             '    AND et_cuit = ''' + lCuit.Text + '''' +
             '    AND et_estudio = ''' + sdqAnormalER_ESTUDIO.AsString + '''' +
             '    AND et_resultado >= ' + SqlNumber( sdqAnormalER_MINIMONORMAL.AsFloat );

     if ( sdqAnormalER_MAXIMONORMAL.AsString <> '' ) then
        ssql := ssql + '    AND et_resultado <= ' + SqlNumber( sdqAnormalER_MAXIMONORMAL.AsFloat );

     if ( Trim( edDesde.Text ) <> '/  /' ) then
        ssql := ssql + ' AND et_fecha >= TO_DATE( ''' + edDesde.Text + ''', ''dd/mm/yyyy'') ' +
                       ' AND et_fecha <= TO_DATE( ''' + edHasta.Text + ''', ''dd/mm/yyyy'') ';

     ssql := ssql + '  ORDER BY tj_nombre ';

     with sdqEstudios do begin
          Close;
          SQL.Clear;
          SQL.Add( ssql );
          Open;
     end;

     PageControl.ActivePage := tsEstudios;

end;

//---------------------------------------------------------------------------//
procedure TGamaCIU.btnLimpiarClick(Sender: TObject);
begin
     sdqEstudios.Close;
     sdqEmpres.Close;
     sdqAnormal.Close;

     PageControl.ActivePage := tsGama;
     lEstudio.Text          := '';
     lEstudioDesc.Text      := '';
     lCuit.Text             := '';
     lCuitDesc.Text         := '';
     edGamaMinimo.Text      := '';
     edGamaMaximo.Text      := '';
     edGamaTotal.Text       := '';

     edDesde.Text           := '';
     edHasta.Text           := '';
     edCiiu.Text            := '';
     dbcActividad.KeyValue  := '';
end;

//---------------------------------------------------------------------------//
procedure TGamaCIU.dbgEstudiosDblClick(Sender: TObject);
{
var
   hc : TfrmHistoriaClinica;
}   
begin
{
     hc := TfrmHistoriaClinica.Create( Self );

     try
        with hc do begin
             adsAnalisis.Close;
             sdqAlter.Close;
             sdqEstudios.Close;

             hc.lblEmpresa.Caption  := lCuitDesc.Text;
             hc.lblEmpleado.Caption := sdqEstudiosTJ_NOMBRE.AsString;

             adsAnalisis.ParamByName( 'CUIT' ).asString        := sdqEstudiosET_CUIT.AsString;
             adsAnalisis.ParamByName( 'ESTABLECI' ).asString   := sdqEstudiosET_ESTABLECI.AsString;
             adsAnalisis.ParamByName( 'CUIL' ).asString        := sdqEstudiosET_CUIL.AsString;
             adsAnalisis.ParamByName( 'FECHA' ).AsDateTime     := sdqEstudiosET_FECHA.AsDateTime; //formatdatetime( 'mm/dd/yyyy', sdqEstudiosET_FECHA.AsDateTime );

             sdqAlter.ParamByName( 'CUIT' ).AsString           := sdqEstudiosET_CUIT.AsString;
             sdqAlter.ParamByName( 'ESTAB' ).AsString          := sdqEstudiosET_ESTABLECI.AsString;
             sdqAlter.ParamByName( 'CUIL' ).AsString           := sdqEstudiosET_CUIL.AsString;
             sdqAlter.ParamByName( 'FECHA' ).AsDateTime        := sdqEstudiosET_FECHA.AsDateTime;

             sdqEstudios.ParamByName( 'CUIT' ).AsString        := sdqEstudiosET_CUIT.AsString;
             sdqEstudios.ParamByName( 'ESTAB' ).AsString       := sdqEstudiosET_ESTABLECI.AsString;
             sdqEstudios.ParamByName( 'CUIL' ).AsString        := sdqEstudiosET_CUIL.AsString;
             sdqEstudios.ParamByName( 'FECHA' ).AsDateTime     := sdqEstudiosET_FECHA.AsDateTime;

             adsAnalisis.Open;
             sdqAlter.Open;
             sdqEstudios.Open;

             ShowModal;
        end;
     finally
        hc.adsAnalisis.Close;
        hc.sdqAlter.Close;
        hc.sdqEstudios.Close;
        hc.Free;
     end;
}
end;

//---------------------------------------------------------------------------//
procedure TGamaCIU.dbcActividadCloseUp(Sender: TObject);
begin
     if ( dbcActividad.Text <> '' ) then
        edCiiu.Text := dbcActividad.KeyValue;
end;


end.
