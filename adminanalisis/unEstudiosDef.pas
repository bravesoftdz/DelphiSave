unit unEstudiosDef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit,
  DateComboBox, unfraEstudio, StrFuncs, unfraPrestadorAMP, CurrEdit, unFormEstudios, Db, SDEngine, unfraOperativo,
  unArtFrame, unFraCodigoDescripcion, unfraCtbTablas, unFraTipoEstudio, unArtDbFrame, unFraReconfirmacion,
  unArtDBAwareFrame, ComCtrls, GroupCheckBox;

type
  TfrmEstudioDef = class(TFormEstudios)
    Label13: TLabel;
    edFecha: TDateComboBox;
    lbResultado: TLabel;
    Bevel9: TBevel;
    btnEstAceptar: TButton;
    btnEstCancelar: TButton;
    lbFPEstudio: TLabel;
    fraPrestador: TfraPrestadorAMP;
    Label1: TLabel;
    edFechaText: TEdit;
    nbEstudio: TNotebook;
    lbEstUMedida: TLabel;
    edResultado: TCurrencyEdit;
    fraEstudio: TfraEstudio;
    Label2: TLabel;
    fraOperativo: TfraOperativo;
    cmbNormAnorm: TComboBox;
    fraTipoEstudio: TfraTipoEstudio;
    Label3: TLabel;
    fraReconfirmacion: TfraReconfirmacion;
    Label5: TLabel;
    edFechaRPrest: TDateComboBox;
    Label4: TLabel;
    edFechaRML: TDateComboBox;
    Label6: TLabel;
    memObsEstudio: TRichEdit;
    nbDatosAdic: TNotebook;
    Label7: TLabel;
    cgEst35: TCheckGroup;
    cbEstudioUnico: TCheckBox;
    procedure FSFormCreate(Sender: TObject);
    procedure btnEstAceptarClick(Sender: TObject);
  private
    procedure OnEstudioChange(Sender: TObject);
  public
    function Execute(AModoABM: TModoABM = maAdd): Boolean; override;
  end;

var
  frmEstudioDef: TfrmEstudioDef;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, CustomDlgs, Numeros;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmEstudioDef }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstudioDef.FSFormCreate(Sender: TObject);
begin
  fraEstudio.OnChange                := OnEstudioChange;
  fraTipoEstudio.FrameOperativo      := fraOperativo;
  fraTipoEstudio.FrameReconfirmacion := fraReconfirmacion;

  fraPrestador.ShowBajas := true;
end;

{function TfrmEstudioDef.Execute(AModoABM: TModoABM): boolean;
Var sdqConsulta : TSDQuery;
    Sql         : String;
begin
    fraEstudio.Cargar( ClaveEstudio.Estudio );
    fraEstudio.SetColors( clWindowText, clBtnFace );
    fraEstudio.ReadOnly := True;

    if AModoABM = maUpdate Then begin
       With ClaveEstudio do
            Sql := 'SELECT ET_PRESTADOR, ET_FECHA, ET_RESULTADO, ET_TIPORES ' +
                     'FROM AET_ESTRAB ' +
                    'WHERE ET_CUIT = ''' + Cuit + ''' ' +
                      'AND ET_ESTABLECI = ' + SqlInt( Estableci ) + ' ' +
                      'AND ET_CUIL = ''' + Cuil + ''' ' +
                      'AND ET_ESTUDIO = ''' + Estudio + '''';

       sdqConsulta := GetQuery( Sql );
       Try
          fraPrestador.Cargar( sdqConsulta.FieldByName('ET_PRESTADOR').AsString );
          edFecha.Date := sdqConsulta.FieldByName('ET_FECHA').AsDateTime;
          if (fraEstudio.sdqDatosES_MINIMO.AsCurrency = 0) and (fraEstudio.sdqDatosES_MAXIMO.AsCurrency = 0) then begin
              nbEstudio.PageIndex     := 1;
              if sdqConsulta.FieldByName('ET_TIPORES').AsString = 'N' then
                 rbEstudioNormal.Checked := True
              else
                 rbEstudioAnormal.Checked := True;
          end else begin
              nbEstudio.PageIndex  := 0;
              edResultado.Value := sdqConsulta.FieldByName('ET_RESULTADO').AsInteger;
          end;
       finally
         sdqConsulta.Free;
       end;
    end;
    Result := Inherited Execute(AModoABM);
end;}

function TfrmEstudioDef.Execute(AModoABM: TModoABM): Boolean;
var
  S1: String;
  S2: String;
begin
  btnEstAceptar.Enabled := AModoABM <> maConsulta;

  fraEstudio.Codigo := ClaveEstudio.Estudio;
  fraEstudio.Locked := True;

  fraReconfirmacion.Fecha := ClaveEstudio.Fecha;
  fraReconfirmacion.Cuil  := ClaveEstudio.Cuil;
     //fraReconfirmacion.Estudio      := ClaveEstudio.Estudio;
  fraReconfirmacion.Value := DatosEstudio.Reconfirmacion;

  edFecha.Date := ClaveEstudio.Fecha;
  edFechaText.Text := edFecha.LongDate;

  edFechaRPrest.Date := DatosEstudio.FechaRecPrest;
  edFechaRML.Date := DatosEstudio.FechaRecML;

  memObsEstudio.Lines.Text := AdjustLineBreaks(DatosEstudio.Observaciones);
  cbEstudioUnico.Checked   := DatosEstudio.EstudioUnico = 'S';

  nbDatosAdic.PageIndex := 0;
  if ClaveEstudio.Estudio = '00000035' then
  begin
    nbDatosAdic.PageIndex := 1;
    cgEst35.Value  := DatosEstudio.AdicEst;
  end;

  if (fraEstudio.sdqDatos.FieldByName('ES_MINIMO').AsCurrency = 0) and
     (fraEstudio.sdqDatos.FieldByName('ES_MAXIMO').AsCurrency = 0) then
  begin
    // Armo el contenido de cmbNormAnorm
    cmbNormAnorm.Items.Clear;
    S1 := fraEstudio.sdqDatos.FieldByName('ES_UMEDIDA').AsString;
    S2 := S1;

    S1 := Trim(Copy (S1, 1, Pos('/', S1) - 1));
    S2 := Trim(StringReplace (StringReplace (S2, S1, '',[]), '/', '', [rfReplaceAll]));

    cmbNormAnorm.Items.Add(S1);
    cmbNormAnorm.Items.Add(S2);

    nbEstudio.PageIndex     := 1;
    if DatosEstudio.ResNormal then
      cmbNormAnorm.ItemIndex := 0 //rbEstudioNormal.Checked  := True
    else
      cmbNormAnorm.ItemIndex := 1; //rbEstudioAnormal.Checked := True;

    ActiveControl := cmbNormAnorm; //rbEstudioNormal;
  end
  else
  begin
    nbEstudio.PageIndex := 0;
    lbEstUMedida.Caption := fraEstudio.sdqDatos.FieldByName('ES_UMEDIDA').AsString;
    edResultado.Value := DatosEstudio.Resultado;
    ActiveControl := edResultado;
  end;

  With DatosEstudio do begin
    fraPrestador.Cargar(Prestador);
    fraOperativo.Cargar(Periodo);
    fraTipoEstudio.PeriodoOriginal := Periodo;
    fraTipoEstudio.Value           := Tipo;

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

  if not fraPrestador.IsSelected then
    ActiveControl := fraPrestador.edCodigo
  else if (fraOperativo.edPeriodo.Text = '') and (not fraOperativo.ReadOnly) then
    ActiveControl := fraOperativo.edPeriodo;
    { Sinó le deja el Foco al componente que se asignó arriba }

  Result := inherited Execute(AModoABM);
end;

procedure TfrmEstudioDef.OnEstudioChange(Sender: TObject);
begin
  if (fraEstudio.sdqDatos.FieldByName('ES_MINIMO').AsCurrency = 0) and
     (fraEstudio.sdqDatos.FieldByName('ES_MAXIMO').AsCurrency = 0) then
    nbEstudio.PageIndex := 1
  else
  begin
    nbEstudio.PageIndex  := 0;
    lbEstUMedida.Caption := fraEstudio.sdqDatos.FieldByName('ES_UMEDIDA').AsString;
  end;
end;

procedure TfrmEstudioDef.btnEstAceptarClick(Sender: TObject);
var
  sEstudioUnico : String;
begin
  if not fraPrestador.IsSelected then
    InvalidMsg(fraPrestador.edCodigo, 'Debe seleccionar el Prestador')

{     else if edFecha.Date = 0 Then
        InvalidMsg( edFecha,  'Debe seleccionar la fecha del Estudio' )
 }
  else if fraTipoEstudio.IsEmpty then
    InvalidMsg(fraTipoEstudio.edCodigo, 'Debe seleccionar el Tipo de Estudio.')

  else if (fraTipoEstudio.Value = TE_EXAMEN_RECONFIRMACION) and fraReconfirmacion.IsEmpty then
    InvalidMsg(fraReconfirmacion.cmbEstudio, 'Debe seleccionar el estudio a reconfirmar.')

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

  else if (nbEstudio.PageIndex = 0) and (edResultado.Value < fraEstudio.sdqDatos.FieldByName('ES_MINIMO').AsCurrency) then
    InvalidMsg(edResultado, 'El valor ingresado es menor al mínimo posible (' + fraEstudio.sdqDatos.FieldByName('ES_MINIMO').AsString + ')')

  else if (nbEstudio.PageIndex = 0) and (fraEstudio.sdqDatos.FieldByName('ES_MAXIMO').AsCurrency <> 0) and
          (edResultado.Value > fraEstudio.sdqDatos.FieldByName('ES_MAXIMO').AsCurrency) then
    InvalidMsg(edResultado, 'El valor ingresado es mayor al máximo posible (' + fraEstudio.sdqDatos.FieldByName('ES_MAXIMO').AsString + ')')

  else if (nbEstudio.PageIndex = 1) and (cmbNormAnorm.ItemIndex = -1) then
    InvalidMsg(cmbNormAnorm,  'Debe seleccionar alguna opción (Normal / Anormal)')

   else if (edFechaRPrest.Date <> 0) and (edFechaRPrest.Date < ClaveEstudio.Fecha) then
     InvalidMsg( edFechaRPrest, 'La fecha de recepción por parte del prestador ' +
                                'debe ser posterior o igual a la fecha del estudio.' )

   else if (edFechaRML.Date <> 0) and
           ((edFechaRML.Date < ClaveEstudio.Fecha) or (edFechaRML.Date < edFechaRPrest.Date)) then
     InvalidMsg( edFechaRML, 'La fecha de recepción en ML debe ser posterior o igual ' +
                             'a la fecha del estudio y/o de recepción por parte ' +
                             'del prestador.' )
{     else if (nbEstudio.PageIndex = 1) and not (rbEstudioNormal.Checked  or rbEstudioAnormal.Checked) Then
        InvalidMsg( Nil,  'Debe seleccionar alguna opción (Normal / Anormal)' )
}
  else
  try
    BeginTrans;
    if cbEstudioUnico.Checked then
      sEstudioUnico := 'S'
    else
      sEstudioUnico := 'N';
    if nbEstudio.PageIndex  = 0 then
      SaveResult(edResultado.Value,
                 trNone,
                 fraPrestador.edCodigo.Text,
                 fraOperativo.edPeriodo.Text,
                 fraTipoEstudio.PeriodoOriginal,
                 DatosEstudio.IDCarpetaAMP,
                 DatosEstudio.IDDetalleArchivo,
                 DatosEstudio.CarpetaPendiente,
                 fraTipoEstudio.Value,
                 fraReconfirmacion.Value,
                 edFechaRPrest.Date,
                 edFechaRML.Date,
                 memObsEstudio.Text,
                 cgEst35.Value,sEstudioUnico)
    else
      SaveResult(0,
                 TipoResultado(cmbNormAnorm.ItemIndex = 0 {rbEstudioNormal.Checked}),
                 fraPrestador.edCodigo.Text,
                 fraOperativo.edPeriodo.Text,
                 fraTipoEstudio.PeriodoOriginal,
                 DatosEstudio.IDCarpetaAMP,
                 DatosEstudio.IDDetalleArchivo,
                 DatosEstudio.CarpetaPendiente,
                 fraTipoEstudio.Value,
                 fraReconfirmacion.Value,
                 edFechaRPrest.Date,
                 edFechaRML.Date,
                 memObsEstudio.Text,
                 cgEst35.Value,sEstudioUnico);

    CommitTrans;
    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      RollBack;
      ErrorMsg( E, 'Error guardando los resultados del Estudio');
    end;
  end;
end;

end.
