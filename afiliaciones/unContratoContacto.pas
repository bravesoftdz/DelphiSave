unit unContratoContacto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, Db, SDEngine, PatternEdit, CurrEdit, unArtFrame, Mask, ToolEdit, DateComboBox,
  HotKeyControl, IntEdit, ShortCutControl, unfraContacto, unART, QueryPrint, artSeguridad {$IFDEF CAS}, unMenu{$ENDIF},
  Placemnt, ExtCtrls, unArtDBAwareFrame, unArtDbFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS;

type
  TfrmContratoContacto = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tlbGuardar: TToolButton;
    tlbBaja: TToolButton;
    tlbImprimir: TToolButton;
    tlbSalir: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    ArtDBGrid: TArtDBGrid;
    sdqDatos: TSDQuery;
    sdDatos: TDataSource;
    ToolButton2: TToolButton;
    ShortCutControl: TShortCutControl;
    grbContacto: TGroupBox;
    fraContacto: TfraContacto;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    Seguridad: TSeguridad;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    stNumeroContrato: TStaticText;
    stRazonSocial: TStaticText;
    stTelefonos: TStaticText;
    stEmail: TStaticText;
    FormStorage: TFormStorage;
    Panel1: TPanel;
    btnAceptar: TButton;
    Button1: TButton;
    pnlBottom: TPanel;
    Label5: TLabel;
    fraTipoDocumento: TfraStaticCTB_TABLAS;
    Label6: TLabel;
    edNumeroDocumento: TEdit;
    procedure FormDestroy(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure ArtDBGridCellClick(Column: TColumn);
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure tlbImprimirClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fraTelefonosbtnABMTelefonosClick(Sender: TObject);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure btnAceptarClick(Sender: TObject);
  private
    {$IFDEF CAS}
    frmPrincipal: TfrmMenu;
    {$ENDIF}
    FAllowBaja: Boolean;
    FAutoCommit: Boolean;
    FCodigo: String;
    FContrato: Integer;
    FFuncion: TFuncionShowForm;
    FIdEmpresa: String;
    FItemSelected: Integer;

    function GetAutoCommit: Boolean;
    function IsValidar: Boolean;

    procedure DoGuardarSRT;
    procedure DoItemSelect(IdContacto: Integer);
    procedure SeleccionSRT;
    procedure SetFuncion(F: TFuncionShowForm);
    procedure setItemSelect(const Value: Integer);

    property Funcion: TFuncionShowForm read FFuncion write SetFuncion;
  public
    function ObtenerContacto: String;

    procedure DoCargarDatos(const aContrato, aIdEmpresa: Integer);
    procedure SetAutoCommit(Value: Boolean);
    procedure VerSeleccion;

    property AutoCommit: Boolean read GetAutoCommit;
    property ItemSelect: Integer write setItemSelect;

    {$IFDEF CAS}
    procedure AgregarShortCusts;
    procedure DoCargar(aCuit, aContrato: String);
    procedure QuitarShortCusts;
    {$ENDIF}
  end;

implementation

uses
  {$IFDEF CUSTOM_PRINCIPAL}unCustomPrincipal,{$ENDIF}{$IFNDEF CAS}unPrincipal,{$ENDIF}unDmPrincipal, AnsiSQL, SqlFuncs,
  CustomDlgs, General, unSesion;

{$R *.DFM}

const
  CaptionBase: String = 'Contrato Contactos';

procedure TfrmContratoContacto.DoCargarDatos(const aContrato, aIdEmpresa: Integer);
var
  sSql: String;
  sTelefonos: String;
begin
  FFuncion := fsAgregar;
  FContrato := aContrato;
  FIdEmpresa := inttostr(aIdEmpresa);

  fraContacto.fraTelefonos.Initialize(True, 'TN_IDCONTACTO', 'TN', 'ATN_TELEFONOCONTACTO');

  sdqDatos.ParamByName('co_contrato').AsInteger := FContrato;
  OpenQuery(sdqDatos);

  // Cargo los datos básicos de un contrato..
  sSql :=
    'SELECT co_contrato, co_direlectronica, dc_codareatelefonos,' +
                                                              ' /*AFI.Get_Telefonos(''ATO_TELEFONOCONTRATO'', CO_CONTRATO) TEL,*/' +
                                                              ' dc_telefonos, em_nombre' +
     ' FROM adc_domiciliocontrato, aco_contrato, aem_empresa' +
    ' WHERE dc_contrato = co_contrato' +
      ' AND co_idempresa = em_id' +
      ' AND dc_tipo = ''P''' +
      ' AND dc_contrato = :contrato';
  with GetQueryEx(sSql, [FContrato]) do
  try
    sTelefonos := FieldByName('dc_telefonos').AsString;
    if FieldByName('dc_codareatelefonos').AsString <> '' then
      sTelefonos := Format('(%s) %s', [FieldByName('dc_codareatelefonos').AsString, sTelefonos]);

    stNumeroContrato.Caption := FieldByName('co_contrato').AsString;
    stRazonSocial.Caption 	 := FieldByName('em_nombre').AsString;
    stTelefonos.Caption 		 := sTelefonos;
    stEmail.Caption 				 := FieldByName('co_direlectronica').AsString;
  finally
    Free;
  end;
end;

procedure TfrmContratoContacto.SetFuncion(F: TFuncionShowForm);
begin
  FFuncion := F;
  case F of
    fsNone:
    begin
      Caption := CaptionBase;
      tlbBaja.Enabled := False;
      tlbImprimir.Enabled := False;
    end;
    fsAgregar:
    begin
      Caption := CaptionBase + ' [ALTA]';
      tlbBaja.Enabled := False;
      tlbImprimir.Enabled := False;
    end;
    fsModificar:
    begin
      Caption := CaptionBase + ' [MODIFICACION]';
      tlbBaja.Enabled := FAllowBaja;
      tlbImprimir.Enabled := True;
    end;
  end;
end;

procedure TfrmContratoContacto.FormDestroy(Sender: TObject);
begin
  sdqDatos.Close;

  {$IFDEF CAS}
  QuitarShortCusts
  {$ENDIF}
end;

procedure TfrmContratoContacto.SeleccionSRT;
begin
  Funcion := fsModificar;

  with fraContacto, sdqDatos do
  begin
    Contacto       := FieldByName('ct_contacto').AsString;
    Cargo          := FieldByName('ct_cargo').AsString;
    Area           := FieldByName('ct_area').AsString;
    AreaFax        := FieldByName('ct_codareafax').AsString;
    Fax            := FieldByName('ct_fax').AsString;
    Email          := FieldByName('ct_direlectronica').AsString;
    RemitenteCarta := (FieldByName('ct_remitentecarta').AsString = 'S');

    fraTelefonos.FillCombo(True, FieldByName('ct_id').AsInteger);

    fraTipoDocumento.Value := FieldByName('ct_tipodocumento').AsString;
    edNumeroDocumento.Text := FieldByName('ct_numerodocumento').AsString;
  end;
end;

procedure TfrmContratoContacto.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  SeleccionSRT;
end;

procedure TfrmContratoContacto.ArtDBGridCellClick(Column: TColumn);
begin
  SeleccionSRT;
end;

function TfrmContratoContacto.IsValidar: Boolean;
begin
  if Funcion = fsModificar then
    if not Seguridad.Claves.IsActive(0) then
      Verificar(Sesion.Sector <> sdqDatos.FieldByName('ct_areacarga').AsString, nil, 'El área del contacto (' + sdqDatos.FieldByName('ct_areacarga').AsString + ') ' + 'debe ser igual al area del usuario logueado.');

  Result := fraContacto.isValid;
end;

procedure TfrmContratoContacto.DoGuardarSRT;
var
  iContactoId: Integer;
  sSql: String;
begin
  iContactoId := 0;

  with TSql.Create('act_contacto') do
  try
    case Funcion of
      fsAgregar:
      begin
        iContactoId := GetSecNextVal('SEQ_ACT_ID');

        SqlType := stInsert;
        //PrimaryKey.Add('ct_id', 'SEQ_ACT_ID.NEXTVAL', False);
        Fields.Add('ct_fechaalta', SQL_ACTUALDATE, False);
        Fields.Add('ct_usualta', 	 Sesion.UserId);
        Fields.Add('ct_areacarga', Sesion.Sector);
      end;
      fsModificar:
      begin
        iContactoId := sdqDatos.FieldByName('ct_id').AsInteger;

        SqlType := stUpdate;
        Fields.Add('ct_fechamodif', SQL_ACTUALDATE, False);
        Fields.Add('ct_usumodif', 	Sesion.UserId);
      end;
    end;

    PrimaryKey.Add('ct_id', 				 iContactoId, False);
    Fields.Add('ct_idempresa', 			 FIdEmpresa, False);
    Fields.Add('ct_contacto', 			 fraContacto.Contacto);
    Fields.Add('ct_cargo', 					 fraContacto.Cargo);
    Fields.Add('ct_area', 					 fraContacto.Area);
    Fields.Add('ct_remitentecarta',  String(IIF(fraContacto.RemitenteCarta, 'S', 'N')));
    Fields.Add('ct_codareafax', 		 fraContacto.AreaFax);
    Fields.Add('ct_fax', 						 fraContacto.Fax);
    Fields.Add('ct_direlectronica',  fraContacto.Email);
    Fields.Add('ct_tipodocumento',   fraTipoDocumento.Value);
    Fields.Add('ct_numerodocumento', edNumeroDocumento.Text);
    
    try
      if Self.AutoCommit then
        BeginTrans;

      if fraContacto.RemitenteCarta then
      begin
        sSql :=
          'UPDATE act_contacto' +
            ' SET ct_remitentecarta = ''N''' +
          ' WHERE ct_idempresa = :idempresa';
        EjecutarSqlSTEx(sSql, [FIdEmpresa]);
      end;
      
      EjecutarSqlST(Sql);

      if not fraContacto.fraTelefonos.AutoCommit then
        fraContacto.fraTelefonos.CopiarTempATelefonos(iContactoId);

      if Self.AutoCommit then
        CommitTrans;

      if (fraContacto.fraTelefonos.AutoCommit) and (Funcion = fsAgregar) then
        fraContacto.fraTelefonos.CopiarTempATelefonos(iContactoId);

      sdqDatos.Close;
      OpenQuery(sdqDatos);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
  finally
    Free;
  end;
end;

procedure TfrmContratoContacto.tlbNuevoClick(Sender: TObject);
begin
  Funcion := fsAgregar;

  fraContacto.Clear;
  fraTipoDocumento.Clear;
  edNumeroDocumento.Clear;
end;

procedure TfrmContratoContacto.tlbGuardarClick(Sender: TObject);
begin
  Verificar((Funcion = fsModificar) and (not sdqDatos.IsEmpty and not sdqDatos.FieldByName('ct_fechabaja').IsNull), nil, 'Este registro se encuentra dado de baja.');
  Verificar((Funcion = fsModificar) and (sdqDatos.FieldByName('ct_firmante').AsString = 'S') and (Sesion.Sector <> 'AFI') and (Sesion.Sector <> 'GERTEAC'), nil, 'Usted no tiene permiso para modificar un contacto que es firmante.');

  if IsValidar then
    DoGuardarSRT;
end;

procedure TfrmContratoContacto.tlbBajaClick(Sender: TObject);
begin
  if Funcion = fsModificar then   // Este es el único caso en el que hay contacto seleccionado
  begin
    Verificar(not sdqDatos.IsEmpty and not sdqDatos.FieldByName('ct_fechabaja').IsNull, nil, 'Este registro se encuentra dado de baja.');
    Verificar((sdqDatos.FieldByName('ct_firmante').AsString = 'S') and (Sesion.Sector <> 'AFI') and (Sesion.Sector <> 'GERTEAC'), nil, 'Usted no tiene permiso para eliminar un contacto que es firmante.');

    if not sdqDatos.IsEmpty then
      if MsgAsk('¿ Realmente desea eliminar este registro ?') then
        with TSql.Create('act_contacto') do
        try
          SqlType := stUpdate;
          PrimaryKey.Add('ct_id', 	 sdqDatos.FieldByName('ct_id').AsInteger, false);
          Fields.Add('ct_fechabaja', SQL_ACTUALDATE, false);
          Fields.Add('ct_usubaja', 	 Sesion.UserId);

          try
            if Self.AutoCommit then
              EjecutarSql(Sql)
            else
              EjecutarSqlST(Sql);

            MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
            sdqDatos.Close;
            OpenQuery(sdqDatos);
          except
            on E: Exception do
              ErrorMsg(E, 'Error al guardar los datos.');
          end;
        finally
          Free;
        end;
  end;
end;

procedure TfrmContratoContacto.tlbImprimirClick(Sender: TObject);
begin
  try
    if sdqDatos.Active and (not sdqDatos.IsEmpty) and PrintDialog.Execute then
    begin
      QueryPrint.SubTitle.Lines.Add('Contrato: ' + inttostr(FContrato));
      QueryPrint.SubTitle.Lines.Add('Razón Social: ' + FIdEmpresa);
      QueryPrint.SetGridColumns(ArtDBGrid, true, [baDetail, baHeader, baTotal, baSubTotal]);
      QueryPrint.Title.Text := CaptionBase;
      QueryPrint.Print;
    end;
  finally
    QueryPrint.SubTitle.Lines.Clear;
    QueryPrint.Fields.Clear;
  end;
end;

procedure TfrmContratoContacto.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContratoContacto.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                      var Background: TColor; Highlight: Boolean);
begin
  if not sdqDatos.FieldByName('ct_fechabaja').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clRed);
end;

procedure TfrmContratoContacto.FormCreate(Sender: TObject);
begin
  {$IFDEF CAS}
  frmPrincipal     := frmMenu;
  tlbSalir.Visible := False;

  tlbNuevo.Enabled   := frmPrincipal.Seguridad.Claves.IsActive('Afi_Contactos_Alta');
  tlbGuardar.Enabled := frmPrincipal.Seguridad.Claves.IsActive('Afi_Contactos_Modificar');
  FAllowBaja         := frmPrincipal.Seguridad.Claves.IsActive('Afi_Contactos_Eliminar');
  {$ELSE}
  FAllowBaja := True; { Mantengo la variable, porque habría que ponerle algún control al de afi }
  {$ENDIF}
  FAutoCommit := True;
  tlbControl.HotImages := frmPrincipal.ilColor;
  tlbControl.Images    := frmPrincipal.ilByN;

  fraTipoDocumento.Clave := 'TDOC';

  FItemSelected := -1;
  Seguridad.DBLogin := frmPrincipal.DBLogin;
  Seguridad.Ejecutar;
end;

{$IFDEF CAS}
procedure TfrmContratoContacto.DoCargar(aCuit, aContrato: String);
var
  sSql: String;
begin
  sSql :=
    'SELECT em_id' +
     ' FROM aem_empresa' +
    ' WHERE em_cuit = :cuit';
  DoCargarDatos(aContrato, ValorSqlEx(sSql, [aCuit]));
end;

procedure TfrmContratoContacto.AgregarShortCusts;
  procedure AddKey(AKey: TShortcut; ALinkControl: TControl);
  begin
     frmMenu.ShortCutControl.ShortCuts.Add;
     with frmMenu.ShortCutControl.ShortCuts.Items[frmMenu.ShortCutControl.ShortCuts.Count - 1] do
     begin
       Key := AKey;
       LinkControl := ALinkControl;
     end;
  end;
begin
  AddKey(16462, tlbNuevo);
  AddKey(16455, tlbGuardar);
  AddKey(16450, tlbBaja);
  AddKey(16457, tlbImprimir);
end;

procedure TfrmContratoContacto.QuitarShortCusts;
  procedure DelKey(AKey: TShortcut);
  var
    AShortCut: TShortCutItem;
  begin
    AShortCut := frmMenu.ShortCutControl.ShortCuts.ItemsByShortCut[AKey];
    if Assigned(AShortCut) then
      frmMenu.ShortCutControl.ShortCuts.Delete(AShortCut.Index);
  end;
begin
  DelKey(16462);
  DelKey(16455);
  DelKey(16450);
  DelKey(16457);
end;
{$ENDIF}

procedure TfrmContratoContacto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fraContacto.fraTelefonos.QuitarTelefonosTemporales;
end;

procedure TfrmContratoContacto.fraTelefonosbtnABMTelefonosClick(Sender: TObject);
begin
  fraContacto.fraTelefonosbtnABMTelefonosClick(Sender);
end;

procedure TfrmContratoContacto.setItemSelect(const Value: integer);
begin
  FItemSelected := Value;
  if sdqDatos.Active then
    DoItemSelect(FItemSelected);
end;


procedure TfrmContratoContacto.DoItemSelect(IdContacto: integer);
begin
  if FItemSelected <> -1 then
    with sdqDatos do
    begin
      while (not Eof) and (FieldByName('ct_id').AsInteger <> IdContacto) do
        Next;

      if Eof then
        First;
    end;
end;

procedure TfrmContratoContacto.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  DoItemSelect(FItemSelected);
end;

function TfrmContratoContacto.GetAutoCommit: Boolean;
begin
  Result := FAutoCommit;
end;

procedure TfrmContratoContacto.SetAutoCommit(Value: boolean);
begin
  FAutoCommit := Value;
end;

procedure TfrmContratoContacto.VerSeleccion;
begin
  Panel1.Visible := True;
  Panel1.Top := 500;
end;

function TfrmContratoContacto.ObtenerContacto: String;
begin
  Result := FCodigo;
end;

procedure TfrmContratoContacto.btnAceptarClick(Sender: TObject);
begin
  Verificar(sdqDatos.IsEmpty, btnAceptar, 'Debe seleccionar un Contacto.');
  FCodigo := sdqDatos.FieldByName('ct_id').AsString;
  ModalResult := mrOK;
end;

end.
