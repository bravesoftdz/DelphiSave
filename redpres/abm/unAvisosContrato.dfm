inherited frmAvisosContrato: TfrmAvisosContrato
  Left = 389
  Top = 198
  Caption = 'Avisos autom'#225'ticos por contrato'
  ClientHeight = 627
  ClientWidth = 1217
  Constraints.MinHeight = 500
  Constraints.MinWidth = 750
  Font.Name = 'Tahoma'
  ExplicitWidth = 1225
  ExplicitHeight = 657
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 1217
    Visible = True
    ExplicitWidth = 1217
    DesignSize = (
      1217
      45)
    object gbEmpresa: TGroupBox
      Left = 2
      Top = 0
      Width = 575
      Height = 43
      Caption = 'Empresa'
      TabOrder = 0
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 9
        Top = 16
        Width = 558
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ExplicitLeft = 9
        ExplicitTop = 16
        ExplicitWidth = 558
        ExplicitHeight = 21
        DesignSize = (
          558
          21)
        inherited lbContrato: TLabel
          Left = 454
          ExplicitLeft = 454
        end
        inherited edContrato: TIntEdit
          Left = 501
          ExplicitLeft = 501
        end
        inherited cmbRSocial: TArtComboBox
          Width = 319
          ExplicitWidth = 319
        end
      end
    end
    object gbMotivo: TGroupBox
      Left = 584
      Top = 0
      Width = 630
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Motivo'
      TabOrder = 1
      DesignSize = (
        630
        43)
      inline fraMotivos: TfraCodigoDescripcion
        Left = 7
        Top = 15
        Width = 617
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 7
        ExplicitTop = 15
        ExplicitWidth = 617
        DesignSize = (
          617
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 47
          Width = 569
          ExplicitLeft = 47
          ExplicitWidth = 569
        end
        inherited edCodigo: TPatternEdit
          Width = 43
          ExplicitWidth = 43
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Width = 1217
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1211
      end>
    ExplicitWidth = 1217
    inherited ToolBar: TToolBar
      Width = 1204
      ExplicitWidth = 1204
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 1217
    Height = 553
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'ma_descripcion'
        Title.Caption = 'Motivo'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_cuit'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Empresa'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Caption = 'Establecimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ac_mails'
        Title.Caption = 'Destinatarios'
        Width = 1000
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 142
    Top = 101
    Width = 637
    Height = 225
    Caption = 'Agregar aviso'
    BorderStyle = bsSingle
    OnShow = fpAbmShow
    ExplicitLeft = 142
    ExplicitTop = 101
    ExplicitWidth = 637
    ExplicitHeight = 225
    DesignSize = (
      637
      225)
    inherited BevelAbm: TBevel
      Top = 189
      Width = 629
      ExplicitTop = 189
      ExplicitWidth = 629
    end
    object lblEmpresa: TLabel [1]
      Left = 10
      Top = 23
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object lblMotivo: TLabel [2]
      Left = 10
      Top = 59
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object lblMails: TLabel [3]
      Left = 10
      Top = 96
      Width = 54
      Height = 39
      Caption = 'Mails'#13#10'(separados'#13#10'por coma)'
    end
    inherited btnAceptar: TButton
      Left = 479
      Top = 195
      TabOrder = 4
      ExplicitLeft = 479
      ExplicitTop = 195
    end
    inherited btnCancelar: TButton
      Left = 557
      Top = 195
      TabOrder = 5
      ExplicitLeft = 557
      ExplicitTop = 195
    end
    inline fraEmpresaABM: TfraEmpresa
      Left = 68
      Top = 19
      Width = 558
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitLeft = 68
      ExplicitTop = 19
      ExplicitWidth = 558
      ExplicitHeight = 21
      DesignSize = (
        558
        21)
      inherited lbContrato: TLabel
        Left = 454
        ExplicitLeft = 454
      end
      inherited edContrato: TIntEdit
        Left = 501
        ExplicitLeft = 501
      end
      inherited cmbRSocial: TArtComboBox
        Width = 319
        ExplicitWidth = 319
      end
    end
    inline fraMotivosABM: TfraCodigoDescripcion
      Left = 67
      Top = 54
      Width = 357
      Height = 23
      TabOrder = 1
      ExplicitLeft = 67
      ExplicitTop = 54
    end
    object edMails: TMemo
      Left = 68
      Top = 89
      Width = 558
      Height = 85
      TabOrder = 3
    end
    object chkEstablecimiento: TCheckBox
      Left = 459
      Top = 59
      Width = 97
      Height = 17
      Caption = 'Establecimiento'
      TabOrder = 2
    end
  end
  object fpEstablecimiento: TFormPanel [4]
    Left = 210
    Top = 332
    Width = 637
    Height = 265
    Caption = 'Agregar establecimiento'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnShow = fpEstablecimientoShow
    DesignSize = (
      637
      265)
    object Bevel1: TBevel
      Left = 4
      Top = 229
      Width = 629
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 10
      Top = 23
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Label2: TLabel
      Left = 10
      Top = 59
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object Label3: TLabel
      Left = 10
      Top = 140
      Width = 54
      Height = 39
      Caption = 'Mails'#13#10'(separados'#13#10'por coma)'
    end
    object Label4: TLabel
      Left = 11
      Top = 101
      Width = 54
      Height = 13
      Caption = 'Establecim.'
    end
    object btnAceptarEst: TButton
      Left = 479
      Top = 235
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 5
      OnClick = btnAceptarEstClick
    end
    object btnCancelarEst: TButton
      Left = 557
      Top = 235
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    inline fraEmpresaEst: TfraEmpresa
      Left = 68
      Top = 19
      Width = 558
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitLeft = 68
      ExplicitTop = 19
      ExplicitWidth = 558
      ExplicitHeight = 21
      DesignSize = (
        558
        21)
      inherited lbContrato: TLabel
        Left = 454
        ExplicitLeft = 454
      end
      inherited edContrato: TIntEdit
        Left = 501
        ExplicitLeft = 501
      end
      inherited cmbRSocial: TArtComboBox
        Width = 319
        ExplicitWidth = 319
      end
    end
    inline fraMotivoEst: TfraCodigoDescripcion
      Left = 67
      Top = 54
      Width = 357
      Height = 23
      TabOrder = 1
      ExplicitLeft = 67
      ExplicitTop = 54
    end
    object edMailsEst: TMemo
      Left = 68
      Top = 137
      Width = 558
      Height = 86
      TabOrder = 2
    end
    object btnContinuarEst: TButton
      Left = 395
      Top = 236
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Continuar'
      TabOrder = 4
      OnClick = btnContinuarEstClick
    end
    object gbEstablecimiento: TGroupBox
      Left = 68
      Top = 82
      Width = 557
      Height = 44
      TabOrder = 3
      DesignSize = (
        557
        44)
      inline fraEstab: TfraEstablecimiento
        Left = 9
        Top = 12
        Width = 539
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 9
        ExplicitTop = 12
        ExplicitWidth = 539
        inherited cmbDescripcion: TArtComboBox
          Width = 474
          ExplicitWidth = 474
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      
        '  FROM (SELECT AC_ID, AC_IDMOTIVO, AC_CONTRATO, AC_MAILS, EM_CUI' +
        'T, EM_NOMBRE,'
      
        '               AC_FECHABAJA, MA_DESCRIPCION, NULL ES_NOMBRE, NUL' +
        'L ES_NROESTABLECI,'
      
        '               NULL AE_ID, NULL AE_FECHABAJA, NULL AE_MAILS, AC_' +
        'ESTABLECIMIENTO'
      '          FROM SIN.SAC_AVISOSPORCONTRATO, AFI.ACO_CONTRATO,'
      '               AFI.AEM_EMPRESA, SIN.SMA_MOTIVOSAVISOS'
      
        '         WHERE AC_CONTRATO = CO_CONTRATO AND CO_IDEMPRESA = EM_I' +
        'D'
      '           AND AC_IDMOTIVO = MA_CODIGO AND MA_FECHABAJA IS NULL'
      '         UNION ALL'
      
        '        SELECT AC_ID, AC_IDMOTIVO, AC_CONTRATO, AE_MAILS, EM_CUI' +
        'T, EM_NOMBRE,'
      
        '               AC_FECHABAJA, MA_DESCRIPCION, ES_NOMBRE, ES_NROES' +
        'TABLECI, AE_ID,'
      '               AE_FECHABAJA, AE_MAILS, AC_ESTABLECIMIENTO'
      
        '          FROM SIN.SAC_AVISOSPORCONTRATO, AFI.ACO_CONTRATO, AFI.' +
        'AEM_EMPRESA,'
      
        '               SIN.SMA_MOTIVOSAVISOS, SIN.SAE_AVISOSESTABLECIMIE' +
        'NTO, AES_ESTABLECIMIENTO'
      
        '         WHERE AC_CONTRATO = CO_CONTRATO AND CO_IDEMPRESA = EM_I' +
        'D AND AC_IDMOTIVO = MA_CODIGO'
      
        '           AND MA_FECHABAJA IS NULL AND AE_IDAVISOCONTRATO = AC_' +
        'ID'
      '           AND ES_ID = AE_IDESTABLECIMIENTO)'
      ' WHERE 1 = 2'
      '')
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'ma_descripcion'
        DataField = 'ma_descripcion'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'ac_contrato'
        DataField = 'ac_contrato'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'em_cuit'
        DataField = 'em_cuit'
        Width = 120
        MaxLength = 0
      end
      item
        Title = 'em_nombre'
        DataField = 'em_nombre'
        Width = 500
        MaxLength = 0
      end
      item
        Title = 'ac_mails'
        DataField = 'ac_mails'
        Width = 900
        MaxLines = 3
        MaxLength = 0
      end>
    PageOrientation = pxLandscape
  end
  object ShortCutControl1: TShortCutControl
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
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 344
  end
end
