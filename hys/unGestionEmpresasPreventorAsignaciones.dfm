inherited frmGestionEmpPrevAsig: TfrmGestionEmpPrevAsig
  Left = 295
  Top = 131
  Width = 799
  Height = 573
  Caption = 'frmGestionEmpPrevAsig'
  Constraints.MinHeight = 573
  Constraints.MinWidth = 792
  KeyPreview = True
  OnKeyPress = FSFormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter: TSplitter
    Top = 413
    Width = 791
  end
  inherited Grid: TArtDBGrid [1]
    Width = 791
    Height = 195
    OnDblClick = nil
    OnKeyPress = GridKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EP_CUIT'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        ReadOnly = True
        Title.Caption = 'Empresa'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_ESTABLECI'
        ReadOnly = True
        Title.Caption = 'Nro. Estab.'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        ReadOnly = True
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        ReadOnly = True
        Title.Caption = 'Nombre Establecimiento'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOPREVENCION'
        ReadOnly = True
        Title.Caption = 'Tipo Prevenci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPOSRT'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Tipo Empresa SRT'
        Width = 77
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EP_ACTIVIDAD'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Actividad'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREFIRMANTE'
        ReadOnly = True
        Title.Caption = 'Preventor'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_COORDINADOR'
        ReadOnly = True
        Title.Caption = 'Coordinador'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LOCALIDAD'
        ReadOnly = True
        Title.Caption = 'Localidad'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPARTAMENTO'
        Title.Caption = 'Departamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PD_NOMBREREFERENTE'
        ReadOnly = True
        Title.Caption = 'Referente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTAL'
        ReadOnly = True
        Title.Caption = 'C.Postal'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROV'
        ReadOnly = True
        Title.Caption = 'Provincia'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        ReadOnly = True
        Title.Caption = 'Domicilio'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_RELACION'
        ReadOnly = True
        Title.Caption = 'CIUU'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_EMPLEADOS'
        ReadOnly = True
        Title.Caption = 'Cant. Trab. Empresa'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHABAJA'
        ReadOnly = True
        Title.Caption = 'Fecha Baja'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_USUBAJA'
        ReadOnly = True
        Title.Caption = 'Usuario Baja'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_DESCRIPCION'
        ReadOnly = True
        Title.Caption = 'Estado'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_ANEXO1'
        ReadOnly = True
        Title.Caption = 'Tiene Anexo I/III'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_ANEXO2'
        ReadOnly = True
        Title.Caption = 'Tiene Anexo II/IV'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_ANEXO1FICTICIO'
        ReadOnly = True
        Title.Caption = 'Tiene Anexo Fict.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_TIENEPRS'
        ReadOnly = True
        Title.Caption = 'Tiene PRS'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_TIENEDENUNCIAGRAL'
        ReadOnly = True
        Title.Caption = 'Tiene Denuncias Grales.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_TIENEDENUNCIA'
        ReadOnly = True
        Title.Caption = 'Tiene Otras Denuncias'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAULTVISITA'
        ReadOnly = True
        Title.Caption = 'Fecha Ult.Visita'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAULTRELEV'
        ReadOnly = True
        Title.Caption = 'Fecha Ult. Relev.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAULTCAP'
        ReadOnly = True
        Title.Caption = 'Fecha Ult. Cap.'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ES_EVENTUAL'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Eventual'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAINICIOOBRA'
        ReadOnly = True
        Title.Caption = 'Inicio Obra'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAEXTENSIONOBRA'
        ReadOnly = True
        Title.Caption = 'Extensi'#243'n Obra'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAFINOBRA'
        ReadOnly = True
        Title.Caption = 'Fin Obra'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVULTVISITA'
        ReadOnly = True
        Title.Caption = 'Prev.Ult. Visita'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVSUGERIDO'
        ReadOnly = True
        Title.Caption = 'Prev. Sugerido'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EP_CANTVISITAS'
        ReadOnly = True
        Title.Caption = 'Visitas Operativo'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_CANTCAPACIT'
        ReadOnly = True
        Title.Caption = 'Capacit.Oper.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_CANTRELEV'
        ReadOnly = True
        Title.Caption = 'Relev.Operativo'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MA_DESCRIPCION'
        ReadOnly = True
        Title.Caption = 'Motivo Asignaci'#243'n'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAVENCIMIENTOASIG'
        ReadOnly = True
        Title.Caption = 'F.Vencimiento Asignaci'#243'n'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_OBSERVACION'
        ReadOnly = True
        Title.Caption = 'Observaci'#243'n'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_TELEFONOS'
        ReadOnly = True
        Title.Caption = 'Tel'#233'fono'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_DESCRIPCION'
        ReadOnly = True
        Title.Caption = 'Holding'
        Width = 255
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        ReadOnly = True
        Title.Caption = 'Categor'#237'a Riesgo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_CANCERIGENOS'
        ReadOnly = True
        Title.Caption = 'Res.415/02(Cancer'#237'genos)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_DIFENILOS'
        ReadOnly = True
        Title.Caption = 'Res.497/03(Difenilos)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_ACCMAYORES'
        ReadOnly = True
        Title.Caption = 'Res.743/03(Acc. Mayores)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PD_TIPO_ASIGNACION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EP_TIPORELEV'
        Title.Caption = 'Tipo Relevamiento'
        Width = 104
        Visible = True
      end>
  end
  inherited pnlFiltros: TPanel [2]
    Width = 791
    inherited pcFiltros: TPageControl
      Width = 791
      inherited tbGeneral: TTabSheet
        DesignSize = (
          783
          141)
        inherited fraPreventorFiltro: TfraCodigoDescripcion
          Width = 291
          DesignSize = (
            291
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 279
          end
        end
        inherited cbSinPreventor: TCheckBox
          Left = 562
        end
        inherited edEstablecimiento: TPatternEdit
          Width = 616
        end
        inherited cbPreventorReferente: TCheckBox
          Left = 494
        end
        inherited fraEmpresaFiltro: TfraEmpresa
          Width = 614
          DesignSize = (
            614
            21)
          inherited lbContrato: TLabel
            Left = 510
          end
          inherited edContrato: TIntEdit
            Left = 557
          end
          inherited cmbRSocial: TArtComboBox
            Width = 375
          end
        end
        inherited cbListarCoordinados: TCheckBox
          Left = 415
        end
        inherited cbCtosActivos: TCheckBox
          Left = 688
        end
        inherited cbExcluirBajas: TCheckBox
          Left = 670
        end
        inherited cmbVerPreventorExclusivo: TCheckBox
          Left = 651
        end
        inherited cmbResolucion: TCheckCombo [13]
          Width = 340
        end
        inherited cbSinReferente: TCheckBox [14]
          Left = 562
        end
        inherited chkEstabConCPPrev: TCheckBox [15]
          Left = 431
        end
        inherited tbComandosSel: TToolBar [16]
          Left = 341
        end
        inherited cbVerPreventorSugerido: TCheckBox [17]
          Visible = False
        end
        inherited cmbPreventorUltVisita: TCheckBox [18]
          Left = 717
        end
      end
      inherited tbAfiliacion: TTabSheet
        DesignSize = (
          783
          141)
        inherited lbCategoriaRiesgo: TLabel
          Left = 425
        end
        inherited fraLocalidad: TfraLocalidadEx
          Width = 513
          DesignSize = (
            513
            25)
          inherited lbProvincia: TLabel
            Left = 325
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 122
          end
          inherited cmbProvincia: TCheckCombo
            Left = 371
          end
          inherited sdqDatos: TSDQuery
            Left = 266
            Top = 15
          end
          inherited dsDatos: TDataSource
            Left = 305
          end
        end
        inherited cmbHolding: TCheckCombo
          Width = 267
        end
        inherited cmbSector: TCheckCombo
          Width = 299
        end
        inherited cmbCategoriaRiesgo: TCheckCombo
          Width = 267
        end
        inherited cmbZona: TCheckCombo
          Left = 604
        end
      end
      inherited tbVarios: TTabSheet
        DesignSize = (
          783
          141)
        inherited Label21: TLabel
          Left = 354
        end
        inherited Label11: TLabel
          Left = 354
        end
        inherited Label25: TLabel
          Left = 354
        end
        inherited Label32: TLabel
          Left = 355
        end
        inherited Label33: TLabel
          Left = 567
        end
        inherited Label34: TLabel
          Left = 435
        end
        inherited fraRanking: TfraCodigoDescripcion
          Left = 420
        end
        inherited fraSubTipoFiltro: TfraCodigoDescripcion
          Width = 263
          DesignSize = (
            263
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 198
          end
        end
        inherited fraTipoFiltroSRT: TfraCtbTablas
          Width = 262
          DesignSize = (
            262
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 198
          end
        end
        inherited cmbTipoEmpresaPrev: TCheckCombo
          Width = 261
        end
        inherited cmbEstadoEstab: TCheckCombo
          Left = 421
        end
        inherited fraPerfil: TfraCodigoDescripcion
          Left = 420
        end
        inherited fraMotivoAsignacionFiltro: TfraCodigoDescripcion
          Width = 263
          DesignSize = (
            263
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 198
          end
        end
        inherited edVigenciaAsigFiltro: TDateComboBox
          Left = 472
        end
        inherited edVigenciaAsigFiltro2: TDateComboBox
          Left = 600
        end
      end
      inherited tbOperativo: TTabSheet
        inherited cbTercerizado: TCheckBox
          Left = 310
        end
      end
    end
  end
  inherited CoolBar: TCoolBar [3]
    Width = 791
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 787
      end>
    inherited ToolBar: TToolBar
      Width = 774
      inherited tbNuevo: TToolButton
        Enabled = False
      end
      inherited tbModificar: TToolButton
        Enabled = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Propiedades (Ctrl+P)'
      end
      inherited tbDomicilioMiRegistro: TToolButton
        Enabled = False
      end
      inherited tbExclusionEmpresas: TToolButton
        Enabled = False
      end
      inherited tbAplicarSugerido: TToolButton
        Enabled = False
      end
      inherited tbCambioVista: TToolButton
        Enabled = False
      end
      object tbDetalleCUIT: TToolButton
        Left = 677
        Top = 0
        Hint = 'Preventores del CUIT del registro actual'
        Caption = 'DetalleCUIT'
        ImageIndex = 9
        OnClick = tbDetalleCUITClick
      end
    end
  end
  inherited dbgEmpresa: TArtDBGrid
    Top = 418
    Width = 791
    Visible = False
  end
  inherited tbEmpresas: TToolBar
    Top = 500
    Width = 791
    Visible = False
  end
  inherited fpCambioPrevExclusivo: TFormPanel [7]
    Left = 546
    Top = 389
  end
  inherited fpEmpresaModif: TFormPanel [8]
    inherited fraEmpresaModif: TfraEmpresa
      inherited lbContrato: TLabel
        Left = 394
      end
    end
    inherited fraEstablecimientoModif: TfraEstablecimientoDomic
      inherited lbLocalidad: TLabel
        Left = 429
      end
      inherited lbProvincia: TLabel
        Left = 429
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 342
      end
      inherited edLocalidad: TEdit
        Left = 481
      end
      inherited edDomicilio: TEdit
        Width = 372
      end
      inherited edProvincia: TEdit
        Left = 481
      end
    end
  end
  inherited fpCambioPreventorRef: TFormPanel [9]
    Left = 194
    Top = 377
  end
  inherited fpAbm: TFormPanel [10]
    Left = 64
    Top = 516
    inherited fraPreventor: TfraCodigoDescripcion
      inherited cmbDescripcion: TArtComboBox
        Width = 338
      end
    end
    inherited fraEstablecimiento: TfraEstablecimientoDomic
      inherited lbLocalidad: TLabel
        Left = 333
      end
      inherited lbCPostal: TLabel
        Left = 496
      end
      inherited lbProvincia: TLabel
        Left = 333
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 246
      end
      inherited edLocalidad: TEdit
        Left = 385
      end
      inherited edCPostal: TEdit
        Left = 520
      end
      inherited edDomicilio: TEdit
        Width = 276
      end
      inherited edProvincia: TEdit
        Left = 385
      end
    end
    inherited fraEmpresaEstab: TfraEmpresa
      inherited lbContrato: TLabel
        Left = 414
      end
      inherited edContrato: TIntEdit
        Left = 461
      end
      inherited cmbRSocial: TArtComboBox
        Width = 279
      end
    end
    inherited fraTipoEmpresa: TfraCodigoDescripcion
      inherited cmbDescripcion: TArtComboBox
        Width = 227
      end
    end
  end
  inherited fpPreventoresSel: TFormPanel [11]
  end
  inherited fpCambiarPreventor: TFormPanel [12]
    OnEnter = fpCambiarPreventorEnter
    inherited Label13: TLabel
      Left = 38
    end
    inherited Label26: TLabel
      Left = 10
    end
    inherited btnAceptarCambioPreventor: TButton
      Left = 476
    end
  end
  object stsBar: TStatusBar [13]
    Left = 0
    Top = 527
    Width = 791
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  inherited pnlColorRef: TPanel [14]
    Width = 791
    TabOrder = 13
    object Label450: TLabel [2]
      Left = 267
      Top = 4
      Width = 89
      Height = 13
      Caption = 'Posible Asignaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel10: TPanel
      Left = 248
      Top = 5
      Width = 12
      Height = 12
      Color = clPurple
      TabOrder = 2
    end
  end
  inherited fpCambioTipoPrevencion: TFormPanel [15]
  end
  inherited fpMotivoReasignacion: TFormPanel [16]
  end
  inherited fpFrecuenciaVisita: TFormPanel [17]
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      '')
    object sdqConsultaPD_ID: TFloatField [1]
      FieldName = 'PD_ID'
    end
    object sdqConsultaPD_NOMBREFIRMANTE: TStringField
      FieldName = 'NOMBREFIRMANTE'
      Size = 80
    end
    object sdqConsultaPD_TIPOASIGNACION: TStringField
      FieldName = 'PD_TIPO_ASIGNACION'
    end
    object sdqConsultaPD_IDEXCLUSIVO: TStringField
      FieldName = 'PD_IDEXCLUSIVO'
    end
    object sdqConsultaNOMBREREFERENTE: TStringField
      FieldName = 'PD_NOMBREREFERENTE'
      Size = 80
    end
  end
  inherited PrintDialog: TPrintDialog
    Left = 72
    Top = 359
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16464
        LinkControl = tbPropiedades
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
  end
end
