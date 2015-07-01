unit unMotivoEstudio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unArtFrame, unFraCodigoDescripcion, unFraRiesgo, unArt,
  unArtDBAwareFrame;

type
  TfrmMotivoEstudio = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraRiesgo: TfraRiesgo;
    procedure tbPropiedadesClick(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    procedure Execute(ACuit: String; AEstableci: Integer; ACuil, AEstudio: String; AFecha : TDateTime);
  end;

implementation

uses unDmPrincipal, unPrincipal, SqlFuncs, AnsiSql, CustomDlgs, General;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmMotivoEstudio }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmMotivoEstudio.ClearControls;
begin
  fraRiesgo.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmMotivoEstudio.DoABM: Boolean;
begin
   With Sql.PrimaryKey.FieldByName['ME_RIESGO'] do begin
      Visible := True;
      if ModoABM = maAlta Then
         Value := String( fraRiesgo.Value )
      else
         Value := sdqConsulta.FieldByName('rg_id').AsString
   end;
   Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmMotivoEstudio.Execute(ACuit: String; AEstableci: Integer; ACuil, AEstudio: String; AFecha : TDateTime);
begin
   sdqConsulta.ParamByName( 'pCuit' ).AsString       := ACuit;
   sdqConsulta.ParamByName( 'pEstableci' ).AsInteger := AEstableci;
   sdqConsulta.ParamByName( 'pCuil' ).AsString       := ACuil;
   sdqConsulta.ParamByName( 'pEstudio' ).AsString    := AEstudio;
   sdqConsulta.ParamByName( 'pFecha' ).AsDateTime    := AFecha;
//   tbRefrescarClick( Nil );

   Sql.TableName := 'AME_MOTIVOESTUDIO';
   Sql.PrimaryKey.Add( 'ME_CUIT', ACuit );
   Sql.PrimaryKey.Add( 'ME_ESTABLECI', AEstableci );
   Sql.PrimaryKey.Add( 'ME_CUIL', ACuil );
   Sql.PrimaryKey.Add( 'ME_ESTUDIO', AEstudio );
   Sql.PrimaryKey.Add( 'ME_FECHA', AFecha );
   Sql.PrimaryKey.Add( 'ME_RIESGO', '' );

   Width  := Trunc(Screen.Width  * 0.9);
   Height := Trunc(Screen.Height * 0.9);
   ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmMotivoEstudio.LoadControls;
begin
  fraRiesgo.Value := sdqConsulta.FieldByName('RG_id').Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmMotivoEstudio.Validar: Boolean;
begin
  Result := False;
  if fraRiesgo.IsEmpty Then
     InvalidMsg( fraRiesgo.edCodigo, 'Debe seleccionar un Riesgo' )
  else
     Result := True;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmMotivoEstudio.tbPropiedadesClick(Sender: TObject);
Var sSql : String;
begin
  if MsgBox( 'Desea ' + IIF( sdqConsulta.IsEmpty, '', 'eliminar todos los riesgos ingresados y ' ) +
             'cargar todos los riesgos relacionados con los riesgos del trabajador', MB_ICONQUESTION + MB_YESNO ) = IDYES Then begin

     Try
        BeginTrans;
        if not sdqConsulta.IsEmpty Then begin
           Sql.PrimaryKey.FieldByName['ME_RIESGO'].Visible := False;
           EjecutarSqlST( Sql.DeleteSql );
        end;

        sSql := 'INSERT INTO AME_MOTIVOESTUDIO ' +
                '(ME_CUIT, ME_ESTABLECI, ME_CUIL, ME_ESTUDIO, ME_FECHA, ME_RIESGO, ME_IDRG) ' +
                'SELECT RT_CUIT, RT_ESTABLECI, RT_CUIL, ER_ESTUDIO, ' +
                        SqlDate( sdqConsulta.ParamByName( 'pFecha' ).AsDateTime ) + ', RT_RIESGO, RT_IDRG ' +
                  'FROM PRT_RIESTRAB PRT1, AER_ESTRIESG ' +
                 'WHERE RT_CUIT = ''' + sdqConsulta.ParamByName( 'pCuit' ).AsString + ''' ' +
                  ' AND RT_ESTABLECI = ' + SqlInt( sdqConsulta.ParamByName( 'pEstableci' ).AsInteger ) +
                  ' AND RT_CUIL = ''' + sdqConsulta.ParamByName( 'pCuil' ).AsString + ''' ' +
                  ' AND ER_ESTUDIO = ''' + sdqConsulta.ParamByName( 'pEstudio' ).AsString + ''' ' +
                  ' AND ER_IDRG = RT_IDRG ' +
                  ' AND ER_FECHABAJA IS NULL ' +
                  ' AND RT_FECHA = (SELECT MAX(RT_FECHA) ' +
                                     'FROM PRT_RIESTRAB PRT2 ' +
                                    'WHERE PRT1.RT_CUIT = PRT2.RT_CUIT ' +
                                      'AND PRT1.RT_ESTABLECI = PRT2.RT_ESTABLECI ' +
                                      'AND PRT1.RT_CUIL = PRT2.RT_CUIL ' +
                                      'AND PRT1.RT_IDRG = PRT2.RT_IDRG ' +
                                      'AND PRT2.RT_FECHA <= ' + SqlDate( sdqConsulta.ParamByName( 'pFecha' ).AsDateTime ) + ' )';
        EjecutarSqlST( sSql );

        CommitTrans;
        RefreshData ;
     Except
        On E: Exception do begin
           RollBack;
           ErrorMsg( E, 'Error cargar automáticamente los procesos');
        end;
     end;

  end;
end;

end.
