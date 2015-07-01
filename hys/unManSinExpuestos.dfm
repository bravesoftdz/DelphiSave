inherited frmManSinExpuestos: TfrmManSinExpuestos
  Left = 203
  Width = 775
  Height = 550
  Caption = 'Sin Expuestos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 767
    Height = 77
    Visible = True
    DesignSize = (
      767
      77)
    object Label1: TLabel
      Left = 4
      Top = 5
      Width = 28
      Height = 13
      Caption = 'CUIT:'
    end
    object Label2: TLabel
      Left = 4
      Top = 28
      Width = 77
      Height = 13
      Caption = 'Establecimiento:'
    end
    object Label3: TLabel
      Left = 4
      Top = 52
      Width = 101
      Height = 13
      Caption = 'Fecha Relevamiento:'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 116
      Top = 0
      Width = 649
      Height = 21
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = fraEmpresaFiltroExit
      DesignSize = (
        649
        21)
      inherited lbContrato: TLabel
        Left = 545
      end
      inherited edContrato: TIntEdit
        Left = 592
      end
      inherited cmbRSocial: TArtComboBox
        Width = 410
      end
    end
    inline fraEstablecimientoFiltro: TfraEstablecimiento
      Left = 115
      Top = 22
      Width = 650
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        650
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 88
        Width = 562
      end
      inherited edCodigo: TPatternEdit
        Width = 80
      end
    end
    object edFechaRelevFiltro: TDateEdit
      Left = 116
      Top = 46
      Width = 105
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 77
    Width = 767
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 763
      end>
    inherited ToolBar: TToolBar
      Width = 750
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 106
    Width = 767
    Height = 417
    Columns = <
      item
        Expanded = False
        FieldName = 'SR_CUIT'
        Title.Caption = 'CUIT'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 232
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SR_ESTABLECI'
        Title.Caption = 'Estab. Nro.'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Establecimiento'
        Width = 257
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SR_FECHA'
        Title.Caption = 'Fecha Relevamiento'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SR_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SR_USUALTA'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 84
    Top = 260
    Width = 545
    Height = 141
    OnClose = fpAbmClose
    DesignSize = (
      545
      141)
    inherited BevelAbm: TBevel
      Top = 105
      Width = 537
    end
    object Label4: TLabel [1]
      Left = 4
      Top = 5
      Width = 28
      Height = 13
      Caption = 'CUIT:'
    end
    object Label6: TLabel [2]
      Left = 4
      Top = 82
      Width = 101
      Height = 13
      Caption = 'Fecha Relevamiento:'
    end
    object Label5: TLabel [3]
      Left = 236
      Top = 82
      Width = 93
      Height = 13
      Caption = 'F Ult Relevamiento:'
    end
    object lbExpuesto: TLabel [4]
      Left = 436
      Top = 82
      Width = 3
      Height = 13
    end
    inherited btnAceptar: TButton
      Left = 387
      Top = 111
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 465
      Top = 111
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    inline fraEmpresaABM: TfraEmpresa
      Left = 39
      Top = 1
      Width = 502
      Height = 21
      Align = alCustom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = fraEmpresaABMExit
      DesignSize = (
        502
        21)
      inherited lbContrato: TLabel
        Left = 398
      end
      inherited edContrato: TIntEdit
        Left = 445
      end
      inherited cmbRSocial: TArtComboBox
        Width = 263
      end
    end
    object edFechaRelevABM: TDateEdit
      Left = 116
      Top = 76
      Width = 101
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    inline fraEstablecimientoDomicABM: TfraEstablecimientoDomic
      Left = 2
      Top = 28
      Width = 539
      Height = 47
      TabOrder = 1
      OnExit = fraEstablecimientoDomicABMExit
      DesignSize = (
        539
        47)
      inherited lbLocalidad: TLabel
        Left = 305
      end
      inherited lbCPostal: TLabel
        Left = 468
      end
      inherited lbProvincia: TLabel
        Left = 305
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 87
        Width = 210
      end
      inherited edLocalidad: TEdit
        Left = 357
      end
      inherited edCPostal: TEdit
        Left = 492
      end
      inherited edDomicilio: TEdit
        Width = 244
      end
      inherited edProvincia: TEdit
        Left = 357
      end
      inherited sdqDatos: TSDQuery
        Left = 376
        Top = 12
      end
      inherited dsDatos: TDataSource
        Left = 404
        Top = 12
      end
    end
    object edFechaUltRelev: TDateEdit
      Left = 332
      Top = 77
      Width = 101
      Height = 21
      Enabled = False
      NumGlyphs = 2
      TabOrder = 5
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      ' SELECT  *'
      '  FROM  art.psr_sinriesgo psr,'
      '        afi.aem_empresa aem,'
      '        afi.aco_contrato aco,'
      '        afi.aes_establecimiento aes'
      ' WHERE  aes.es_contrato = aco.co_contrato'
      '    AND aco.co_idempresa = aem.em_id'
      '    AND psr.sr_cuit = aem.em_cuit'
      '    AND psr.sr_estableci = aes.es_nroestableci')
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
