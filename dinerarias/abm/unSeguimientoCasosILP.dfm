inherited frmSeguimCasosILP: TfrmSeguimCasosILP
  Left = 244
  Top = 91
  Caption = 'Seguimiento de Casos de ILP'
  ClientHeight = 603
  ClientWidth = 938
  ExplicitLeft = 244
  ExplicitTop = 91
  ExplicitWidth = 946
  ExplicitHeight = 633
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 938
    Height = 237
    Visible = True
    ExplicitWidth = 937
    ExplicitHeight = 237
    object Label23: TLabel
      Left = 766
      Top = 197
      Width = 51
      Height = 13
      Caption = 'COLORES:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 777
      Top = 208
      Width = 42
      Height = 13
      Caption = 'Vencidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 777
      Top = 220
      Width = 62
      Height = 13
      Caption = 'Doc. vencida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 863
      Top = 208
      Width = 72
      Height = 13
      Caption = '7 d'#237'as s/aprob.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox6: TGroupBox
      Left = 203
      Top = 1
      Width = 441
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 1
      DesignSize = (
        441
        40)
      object Label7: TLabel
        Left = 8
        Top = 19
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 39
        Top = 14
        Width = 396
        Height = 21
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
        ExplicitLeft = 39
        ExplicitTop = 14
        ExplicitWidth = 396
        ExplicitHeight = 21
        inherited lbContrato: TLabel
          Left = 292
          ExplicitLeft = 829
        end
        inherited edContrato: TIntEdit
          Left = 339
          ExplicitLeft = 339
        end
        inherited cmbRSocial: TArtComboBox
          Width = 157
          ExplicitWidth = 157
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 645
      Top = 1
      Width = 291
      Height = 40
      Anchors = [akTop, akRight]
      Caption = 'Estado'
      TabOrder = 2
      DesignSize = (
        291
        40)
      object cmbEstCaso: TDBCheckCombo
        Left = 5
        Top = 14
        Width = 283
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsEstadoCaso
        KeyField = 'EL_ID'
        ListField = 'EL_DESCRIPCION'
      end
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 1
      Width = 200
      Height = 40
      Caption = ' Fecha de caso'
      TabOrder = 0
      object Label1: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcDesdeCaso: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaCaso
        TabOrder = 0
      end
      object dcHastaCaso: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeCaso
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 40
      Width = 200
      Height = 40
      Caption = ' Fecha de liquidaci'#243'n'
      TabOrder = 3
      object Label2: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcDesdeLiquid: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaLiquid
        TabOrder = 0
      end
      object dcHastaLiquid: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeLiquid
        TabOrder = 1
      end
    end
    object GroupBox5: TGroupBox
      Left = 405
      Top = 40
      Width = 531
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Trabajador'
      TabOrder = 4
      DesignSize = (
        531
        40)
      inline fraTrabajadorSiniestro: TfraTrabajadorSiniestro
        Left = 5
        Top = 14
        Width = 521
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 14
        ExplicitWidth = 521
        inherited lbSiniestro: TLabel
          Left = 355
          ExplicitLeft = 469
        end
        inherited cmbNombre: TArtComboBox
          Width = 268
          ExplicitWidth = 268
        end
        inherited edSiniestro: TSinEdit
          Left = 420
          ExplicitLeft = 420
        end
        inherited ToolBar: TToolBar
          Left = 397
          ExplicitLeft = 397
        end
        inherited ImageList: TImageList
          Bitmap = {
            494C010101003800A40010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
            0000000000003600000028000000400000001000000001002000000000000010
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000636363006363630000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000063636300E7E7E700A5A5A50063636300000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000063636300E7E7E700A5A5A500E7E7E700A5A5A500636363000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000848400A5A5A500E7E7E700CECECE00D6D6D600B5B5B5006363
            6300000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000063636300B5B5B500E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7
            E700636363000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008484
            840063636300E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5
            A500C6C6C6006363630000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008484
            840063636300CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5A500C6C6
            C600C6C6C600B5B5B50063636300000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008484
            84008484840063636300B5B5B500A5A5A500E7E7E700A5A5A500C6C6C600C6C6
            C600B5B5B5000063630021212100000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A5A5
            A500A5A5A5008484840063636300E7E7E700B5B5B500C6C6C600C6C6C600A5A5
            A500636363003939390000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A5A5
            A500B5B5B500B5B5B5008484840063636300B5B5B500319C9C00636363006363
            6300000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000094949400C6C6
            C600B5B5B500B5B5B50084848400848484006363630063636300000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000094949400B5B5B5008484
            8400949494000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000094949400A5A5A500848484009494
            9400000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000008484840084848400949494000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000424D3E000000000000003E000000
            2800000040000000100000000100010000000000800000000000000000000000
            000000000000000000000000FFFFFF00FFFF000000000000FE7F000000000000
            FC3F000000000000F81F000000000000F80F000000000000F007000000000000
            E003000000000000E001000000000000E001000000000000E003000000000000
            E00F000000000000C03F00000000000087FF0000000000000FFF000000000000
            1FFF000000000000FFFF00000000000000000000000000000000000000000000
            000000000000}
        end
      end
    end
    object rgLiquidado: TRadioGroup
      Left = 108
      Top = 157
      Width = 105
      Height = 40
      Caption = 'Liquidado'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 14
    end
    object rgSUSS: TRadioGroup
      Left = 2
      Top = 157
      Width = 105
      Height = 40
      Caption = 'SUSS'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 13
    end
    object GroupBox7: TGroupBox
      Left = 2
      Top = 79
      Width = 200
      Height = 40
      Caption = ' Fecha Inactivo'
      TabOrder = 5
      object Label3: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcDesdeInactivo: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaInactivo
        TabOrder = 0
      end
      object dcHastaInactivo: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeInactivo
        TabOrder = 1
      end
    end
    object GroupBox8: TGroupBox
      Left = 203
      Top = 79
      Width = 201
      Height = 40
      Caption = ' Fecha baja trabajador'
      TabOrder = 6
      object Label4: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcDesdeBajaTrab: TDateComboBox
        Left = 4
        Top = 14
        Width = 86
        Height = 21
        MaxDateCombo = dcHastaBajaTrab
        TabOrder = 0
      end
      object dcHastaBajaTrab: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeBajaTrab
        TabOrder = 1
      end
    end
    object GroupBox9: TGroupBox
      Left = 203
      Top = 40
      Width = 201
      Height = 40
      Caption = ' Fecha de accidente'
      TabOrder = 7
      object Label5: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcDesdeAccidente: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaAccidente
        TabOrder = 0
      end
      object dcHastaAccidente: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeAccidente
        TabOrder = 1
      end
    end
    object gbMotivoIngreso: TGroupBox
      Left = 320
      Top = 118
      Width = 417
      Height = 40
      Caption = 'Motivo ingreso'
      TabOrder = 11
      DesignSize = (
        417
        40)
      inline fraMotivoIngreso: TfraCodigoDescripcion
        Left = 4
        Top = 14
        Width = 409
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 14
        ExplicitWidth = 409
        inherited cmbDescripcion: TArtComboBox
          Width = 344
          ExplicitWidth = 344
        end
      end
    end
    object GroupBox10: TGroupBox
      Left = 738
      Top = 118
      Width = 198
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Motivo baja trabajador'
      TabOrder = 12
      DesignSize = (
        198
        40)
      inline fraMotBajaTrab: TfraCodigoDescripcion
        Left = 4
        Top = 14
        Width = 190
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 14
        ExplicitWidth = 190
        inherited cmbDescripcion: TArtComboBox
          Width = 125
          ExplicitWidth = 125
        end
      end
    end
    object GroupBox11: TGroupBox
      Left = 426
      Top = 157
      Width = 393
      Height = 40
      Caption = 'Liquidador'
      TabOrder = 15
      DesignSize = (
        393
        40)
      inline fraLiquidador: TfraCodigoDescripcion
        Left = 4
        Top = 14
        Width = 385
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 14
        ExplicitWidth = 385
        inherited cmbDescripcion: TArtComboBox
          Width = 320
          ExplicitWidth = 320
        end
      end
    end
    object rgActivos: TRadioGroup
      Left = 2
      Top = 196
      Width = 105
      Height = 40
      Caption = 'Activos'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 17
    end
    object rgDocPendiente: TRadioGroup
      Left = 108
      Top = 196
      Width = 105
      Height = 40
      Caption = 'Doc. Pendiente'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 18
    end
    object rgConAltaMed: TRadioGroup
      Left = 214
      Top = 196
      Width = 105
      Height = 40
      Caption = 'Con alta m'#233'dica'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 19
    end
    object rgExtensionILT: TRadioGroup
      Left = 320
      Top = 196
      Width = 105
      Height = 40
      Caption = 'Extensi'#243'n ILT'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 20
    end
    object rgBloqueoILT: TRadioGroup
      Left = 426
      Top = 196
      Width = 105
      Height = 40
      Caption = 'Bloqueo ILT'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 21
    end
    object GroupBox13: TGroupBox
      Left = 405
      Top = 79
      Width = 531
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estado siniestro'
      TabOrder = 8
      DesignSize = (
        531
        40)
      inline fraEstadoSiniestro: TfraCodigoDescripcion
        Left = 4
        Top = 14
        Width = 523
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 14
        ExplicitWidth = 523
        inherited cmbDescripcion: TArtComboBox
          Width = 458
          ExplicitWidth = 458
        end
      end
    end
    object GroupBox15: TGroupBox
      Left = 820
      Top = 157
      Width = 116
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estado Liq.'
      TabOrder = 16
      DesignSize = (
        116
        40)
      object cmbEstLiq: TDBCheckCombo
        Left = 5
        Top = 15
        Width = 106
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsEstadoLiq
        KeyField = 'LI_ID'
        ListField = 'LI_DESCRIPCION'
      end
    end
    object rgDocVencida: TRadioGroup
      Left = 532
      Top = 196
      Width = 105
      Height = 40
      Caption = 'Doc. Vencida'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 22
    end
    object Panel2: TPanel
      Left = 760
      Top = 210
      Width = 13
      Height = 11
      BevelInner = bvLowered
      Color = 7504122
      ParentBackground = False
      TabOrder = 25
    end
    object Panel1: TPanel
      Left = 760
      Top = 222
      Width = 13
      Height = 11
      BevelInner = bvLowered
      Color = 42495
      ParentBackground = False
      TabOrder = 26
    end
    object rgCasosPendientes: TRadioGroup
      Left = 2
      Top = 118
      Width = 105
      Height = 40
      Caption = 'Casos Pendientes'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 9
    end
    object rgSolAuditoria: TRadioGroup
      Left = 108
      Top = 118
      Width = 105
      Height = 40
      Caption = 'Solicitud Auditor'#237'a'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 10
    end
    object rgConCheque: TRadioGroup
      Left = 638
      Top = 196
      Width = 105
      Height = 40
      Caption = 'Con Cheque'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 23
    end
    object rgAnticipo: TRadioGroup
      Left = 214
      Top = 157
      Width = 105
      Height = 40
      Caption = 'Anticipo'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 24
    end
    object Panel3: TPanel
      Left = 846
      Top = 210
      Width = 13
      Height = 11
      BevelInner = bvLowered
      Color = 55295
      ParentBackground = False
      TabOrder = 27
    end
    object rgConJuicio: TRadioGroup
      Left = 214
      Top = 118
      Width = 105
      Height = 40
      Caption = 'Con Juicio'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 28
    end
    object rgGPBA: TRadioGroup
      Left = 320
      Top = 157
      Width = 105
      Height = 40
      Caption = 'GPBA'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 29
    end
  end
  inherited CoolBar: TCoolBar
    Top = 237
    Width = 938
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 934
      end>
    ExplicitTop = 237
    ExplicitWidth = 938
    inherited ToolBar: TToolBar
      Width = 925
      ExplicitWidth = 925
      inherited tbEliminar: TToolButton
        Hint = 'Pasar a inactivo (Ctrl+Del)'
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Hint = 'Mostrar total'
        ImageIndex = 48
        Style = tbsCheck
        Visible = True
      end
      inherited tbImprimir: TToolButton
        Enabled = True
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      inherited tbEnviarMail: TToolButton
        Enabled = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbAceptar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Aceptar'
        Caption = 'tbAceptar'
        ImageIndex = 27
        OnClick = tbAceptarClick
      end
      object tbSolicDocum: TToolButton
        Left = 393
        Top = 0
        Hint = 'Solicitar documentaci'#243'n'
        Caption = 'tbSolicDocum'
        ImageIndex = 13
        OnClick = tbSolicDocumClick
      end
      object tbCasosPorLiq: TToolButton
        Left = 416
        Top = 0
        Hint = 'Ver casos por liquidador'
        ImageIndex = 19
        OnClick = tbCasosPorLiqClick
      end
      object tbVerListPedidosDoc: TToolButton
        Left = 439
        Top = 0
        Hint = 'Ver pedidos de documentaci'#243'n'
        ImageIndex = 44
        OnClick = tbVerListPedidosDocClick
      end
      object tbVerCasosRelacionados: TToolButton
        Left = 462
        Top = 0
        Hint = 'Ver casos relacionados'
        ImageIndex = 22
        OnClick = tbVerCasosRelacionadosClick
      end
      object tbHistoricoEstados: TToolButton
        Left = 485
        Top = 0
        Hint = 'Hist'#243'rico de estados'
        ImageIndex = 9
        OnClick = tbHistoricoEstadosClick
      end
      object tbReasignarCaso: TToolButton
        Left = 508
        Top = 0
        Hint = 'Reasignar Caso'
        ImageIndex = 45
        OnClick = tbReasignarCasoClick
      end
      object tbViajar: TToolButton
        Left = 531
        Top = 0
        Hint = 'Ir a liquidaci'#243'n de incapacidades'
        DropdownMenu = pmViajar
        ImageIndex = 50
        Style = tbsDropDown
        OnClick = tbViajarClick
      end
      object tbVerDigitalizaciones: TToolButton
        Left = 569
        Top = 0
        Hint = 'Ver Digitalizaciones'
        Caption = 'Consulta de digitalizaciones'
        ImageIndex = 55
        OnClick = tbVerDigitalizacionesClick
      end
      object tbLinks: TToolButton
        Left = 592
        Top = 0
        Caption = 'tbLinks'
        DropdownMenu = mnuLinks
        ImageIndex = 17
        Style = tbsDropDown
      end
      object ToolButton7: TToolButton
        Left = 630
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 58
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 638
        Top = 0
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
      object lTotal: TLabel
        Left = 661
        Top = 0
        Width = 142
        Height = 22
        Caption = '       Cantidad de casos: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 266
    Width = 938
    Height = 337
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCASO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROLIQ'
        Title.Caption = 'N'#176' LIQ.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FACCIDENTE'
        Title.Caption = 'F. ACCIDENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADOSIN'
        Title.Caption = 'EST. SINIESTRO'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FBAJAMEDICA'
        Title.Caption = 'F. BAJA MED.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FALTAMEDICA'
        Title.Caption = 'F. ALTA MED.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRECAIDA'
        Title.Caption = 'F. RECAIDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FINGRESOCASO'
        Title.Caption = 'F. ING. CASO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FEGRESOTRAB'
        Title.Caption = 'F. EGRESO TRAB.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADOCASO'
        Title.Caption = 'ESTADO CASO'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADOLIQ'
        Title.Caption = 'ESTADO LIQ.'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIQUIDADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUSS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVOCASO'
        Title.Caption = 'MOTIVO CASO'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MBAJATRAB'
        Title.Caption = 'MOT. BAJA TRAB.'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FINACTIVO'
        Title.Caption = 'F. INACTIVO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTBAJACASO'
        Title.Caption = 'MOT. BAJA CASO'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIQUIDADOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CL_DOCPENDIENTE'
        Title.Caption = 'DOC. PENDIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BLOQUEOILT'
        Title.Caption = 'BLOQUEO ILT'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXTENSIONILT'
        Title.Caption = 'EXTENSION ILT'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACION'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOLAUDIT'
        Title.Caption = 'SOL AUDIT.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCHEQUE'
        Title.Caption = 'CON CHEQUE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROCHEQUE'
        Title.Caption = 'NRO. CHEQUE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTCHEQUE'
        Title.Caption = 'EST. CHEQUE'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIASENESTADO'
        Title.Caption = 'DIAS EN ESTADO'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CL_ALTAMANUAL'
        Title.Caption = 'ALTA MANUAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FDICTAMEN'
        Title.Caption = 'F. DICTAMEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FCARGADICTAMEN'
        Title.Caption = 'F. CARGA DICT.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISIONMEDICA'
        Title.Caption = 'COM. MEDICA'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPEDINCAPACIDAD'
        Title.Caption = 'EXP. INCAP.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRECEPDICTAMEN'
        Title.Caption = 'F. RECEP. DICT.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOCVENCIDA'
        Title.Caption = 'DOC. VENCIDA'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACIONDDJJ'
        Title.Caption = 'SITUACION DDJJ'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACIONREVISTA'
        Title.Caption = 'SIT. REVISTA'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIASASIGNADO'
        Title.Caption = 'DIAS ASIGNADO'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CL_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EX_SINIESTRO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EX_ORDEN'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EX_RECAIDA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LC_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EL_CODIGO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EX_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ANTICIPO'
        Title.Caption = 'Anticipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCINA'
        Title.Caption = '% Incap.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRADOINC'
        Title.Caption = 'Grado Inc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARACTERINC'
        Title.Caption = 'Car'#225'cter Inc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRANINV'
        Title.Caption = 'Gran Inv.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIASSINAPROB'
        Title.Caption = 'Dias s/aprob.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUICIO'
        Title.Caption = 'Juicio'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESGPBA'
        Title.Caption = 'GPBA'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTAREASIC'
        Title.Caption = 'N'#176' Tarea SIC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEXTORECLAMO'
        Title.Caption = 'Texto Reclamo'
        Width = 800
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_INTEGRAL'
        Title.Caption = 'Integral'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_PORCINTEGRAL'
        Title.Caption = 'Porc. Integral'
        Width = 150
        Visible = True
      end>
  end
  object fpHistoricoEstados: TFormPanel [3]
    Left = 222
    Top = 284
    Width = 637
    Height = 220
    Caption = 'Hist'#243'rico de estados'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      637
      220)
    object Bevel6: TBevel
      Left = 4
      Top = 184
      Width = 629
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 123
      ExplicitWidth = 497
    end
    object Button3: TButton
      Left = 557
      Top = 190
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 0
    end
    object GridHistoricoEstados: TArtDBGrid
      Left = 6
      Top = 8
      Width = 626
      Height = 169
      DataSource = dsHistoricoEstados
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'HL_ID'
          Title.Caption = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SINIESTRO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRABAJADOR'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FESTADO'
          Title.Caption = 'F. ESTADO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDADOR'
          Visible = True
        end>
    end
  end
  object fpReasignarCaso: TFormPanel [4]
    Left = 360
    Top = 281
    Width = 476
    Height = 86
    Caption = 'Reasignar caso'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      476
      86)
    object Bevel7: TBevel
      Left = 4
      Top = 50
      Width = 468
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 123
      ExplicitWidth = 497
    end
    object Label22: TLabel
      Left = 18
      Top = 19
      Width = 49
      Height = 13
      Caption = 'Liquidador'
    end
    object btnAceptarReasigCaso: TButton
      Left = 318
      Top = 56
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarReasigCasoClick
    end
    object Button5: TButton
      Left = 396
      Top = 56
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraLiquidadorReasignarCaso: TfraCodigoDescripcion
      Left = 79
      Top = 14
      Width = 384
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnEnter = fraMotivoIngresoABMEnter
      ExplicitLeft = 79
      ExplicitTop = 14
      ExplicitWidth = 384
      inherited cmbDescripcion: TArtComboBox
        Width = 319
        ExplicitWidth = 319
      end
    end
  end
  inherited fpAbm: TFormPanel
    Left = 282
    Top = 319
    Width = 505
    Height = 159
    Caption = 'Nuevo caso'
    BorderStyle = bsSingle
    ExplicitLeft = 282
    ExplicitTop = 319
    ExplicitWidth = 505
    ExplicitHeight = 159
    DesignSize = (
      505
      159)
    inherited BevelAbm: TBevel
      Top = 123
      Width = 497
      ExplicitTop = 123
      ExplicitWidth = 497
    end
    object Label6: TLabel [1]
      Left = 16
      Top = 19
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label8: TLabel [2]
      Left = 186
      Top = 19
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    object Label9: TLabel [3]
      Left = 18
      Top = 51
      Width = 70
      Height = 13
      Caption = 'Motivo Ingreso'
    end
    object Label10: TLabel [4]
      Left = 18
      Top = 84
      Width = 49
      Height = 13
      Caption = 'Liquidador'
    end
    inherited btnAceptar: TButton
      Left = 347
      Top = 129
      TabOrder = 3
      ExplicitLeft = 347
      ExplicitTop = 129
    end
    inherited btnCancelar: TButton
      Left = 425
      Top = 129
      TabOrder = 4
      ExplicitLeft = 425
      ExplicitTop = 129
    end
    object SinEditABM: TSinEdit
      Left = 64
      Top = 15
      Width = 100
      Height = 21
      OnExit = SinEditABMExit
      TabOrder = 0
    end
    object edTrabajadorABM: TEdit
      Left = 245
      Top = 15
      Width = 244
      Height = 21
      Color = clMenuBar
      Enabled = False
      ReadOnly = True
      TabOrder = 5
    end
    inline fraMotivoIngresoABM: TfraCodigoDescripcion
      Left = 96
      Top = 46
      Width = 393
      Height = 23
      TabOrder = 1
      OnEnter = fraMotivoIngresoABMEnter
      ExplicitLeft = 96
      ExplicitTop = 46
      ExplicitWidth = 393
      inherited cmbDescripcion: TArtComboBox
        Width = 328
        ExplicitWidth = 328
      end
    end
    inline fraLiquidadorABM: TfraCodigoDescripcion
      Left = 74
      Top = 79
      Width = 415
      Height = 23
      TabOrder = 2
      ExplicitLeft = 74
      ExplicitTop = 79
      ExplicitWidth = 415
      inherited cmbDescripcion: TArtComboBox
        Width = 350
        ExplicitWidth = 350
      end
    end
  end
  object fpPedidoDoc: TFormPanel [6]
    Left = 317
    Top = 302
    Width = 596
    Height = 191
    Caption = 'Pedido de documentaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      596
      191)
    object Bevel3: TBevel
      Left = 4
      Top = 155
      Width = 588
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 123
      ExplicitWidth = 497
    end
    object Label15: TLabel
      Left = 16
      Top = 19
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label16: TLabel
      Left = 186
      Top = 19
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    object Label19: TLabel
      Left = 18
      Top = 53
      Width = 49
      Height = 13
      Caption = 'Carta doc.'
    end
    object Label20: TLabel
      Left = 18
      Top = 87
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    object Label21: TLabel
      Left = 305
      Top = 53
      Width = 40
      Height = 13
      Caption = 'Firmante'
    end
    object btnAceptarPedidoDoc: TButton
      Left = 438
      Top = 161
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 3
      OnClick = btnAceptarPedidoDocClick
    end
    object btnCancelarPedidoDoc: TButton
      Left = 516
      Top = 161
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object SinEditPedidoDoc: TSinEdit
      Left = 64
      Top = 15
      Width = 100
      Height = 21
      TabOrder = 5
      ReadOnly = True
      Enabled = False
      Color = clMenuBar
    end
    object edTrabajadorPedidoDoc: TEdit
      Left = 245
      Top = 15
      Width = 334
      Height = 21
      Color = clMenuBar
      Enabled = False
      ReadOnly = True
      TabOrder = 6
    end
    inline fraCDPedidoDoc: TfraCodigoDescripcion
      Left = 74
      Top = 48
      Width = 220
      Height = 23
      TabOrder = 0
      ExplicitLeft = 74
      ExplicitTop = 48
      ExplicitWidth = 220
      inherited cmbDescripcion: TArtComboBox
        Width = 155
        ExplicitWidth = 155
      end
    end
    object mObservacionPedidoDoc: TMemo
      Left = 89
      Top = 84
      Width = 490
      Height = 57
      TabOrder = 2
    end
    inline fraFirmantePedidoDoc: TfraFirmantes
      Left = 353
      Top = 49
      Width = 226
      Height = 21
      TabOrder = 1
      ExplicitLeft = 353
      ExplicitTop = 49
      ExplicitWidth = 226
      inherited cmbDescripcion: TArtComboBox
        Width = 182
        ExplicitWidth = 182
      end
    end
  end
  object fpModificar: TFormPanel [7]
    Left = 159
    Top = 319
    Width = 505
    Height = 235
    Caption = 'Modificaci'#243'n de caso'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      505
      235)
    object Bevel1: TBevel
      Left = 4
      Top = 199
      Width = 497
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 123
    end
    object Label11: TLabel
      Left = 16
      Top = 19
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label12: TLabel
      Left = 186
      Top = 19
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    object Label14: TLabel
      Left = 18
      Top = 51
      Width = 49
      Height = 13
      Caption = 'Liquidador'
    end
    object Label13: TLabel
      Left = 18
      Top = 139
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    object btnAceptarModif: TButton
      Left = 347
      Top = 205
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 3
      OnClick = btnAceptarModifClick
    end
    object btnCancelarModif: TButton
      Left = 425
      Top = 205
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object SinEditModif: TSinEdit
      Left = 64
      Top = 15
      Width = 100
      Height = 21
      TabOrder = 5
      ReadOnly = True
      Enabled = False
      Color = clMenuBar
    end
    object edTrabajadorModif: TEdit
      Left = 245
      Top = 15
      Width = 244
      Height = 21
      Color = clMenuBar
      Enabled = False
      ReadOnly = True
      TabOrder = 6
    end
    inline fraLiquidadorModif: TfraCodigoDescripcion
      Left = 74
      Top = 46
      Width = 415
      Height = 23
      TabOrder = 7
      ExplicitLeft = 74
      ExplicitTop = 46
      ExplicitWidth = 415
      inherited cmbDescripcion: TArtComboBox
        Width = 350
        ExplicitWidth = 350
      end
    end
    object chkSolAudit: TCheckBox
      Left = 20
      Top = 81
      Width = 131
      Height = 17
      Caption = 'Solicitud de auditor'#237'a'
      TabOrder = 0
      Visible = False
    end
    object chkPedidoDoc: TCheckBox
      Left = 20
      Top = 105
      Width = 150
      Height = 17
      Caption = 'Pedido de documentaci'#243'n'
      TabOrder = 1
    end
    object mObservacionModif: TMemo
      Left = 89
      Top = 136
      Width = 400
      Height = 57
      TabOrder = 2
    end
  end
  object fpListPedidosDoc: TFormPanel [8]
    Left = 146
    Top = 324
    Width = 637
    Height = 220
    Caption = 'Pedidos de documentaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      637
      220)
    object Bevel4: TBevel
      Left = 4
      Top = 184
      Width = 629
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 123
      ExplicitWidth = 497
    end
    object Button2: TButton
      Left = 557
      Top = 190
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 0
    end
    object GridListPedidosDoc: TArtDBGrid
      Left = 6
      Top = 8
      Width = 626
      Height = 169
      DataSource = dsPedidosDoc
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'FPEDIDO'
          Title.Caption = 'F. PEDIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBSERVACION'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODCARTA'
          Title.Caption = 'COD. CARTA'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CARTAIMPRESA'
          Title.Caption = 'CARTA IMPRESA'
          Visible = True
        end>
    end
  end
  object fpBaja: TFormPanel [9]
    Left = 221
    Top = 393
    Width = 476
    Height = 134
    Caption = 'Baja de caso'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnShow = fpBajaShow
    DesignSize = (
      476
      134)
    object Bevel2: TBevel
      Left = 4
      Top = 98
      Width = 468
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 123
      ExplicitWidth = 497
    end
    object Label17: TLabel
      Left = 18
      Top = 19
      Width = 55
      Height = 13
      Caption = 'Motivo baja'
    end
    object Label18: TLabel
      Left = 18
      Top = 49
      Width = 60
      Height = 13
      Caption = 'Relacionar a'
    end
    object btnAceptarBaja: TButton
      Left = 318
      Top = 104
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnAceptarBajaClick
    end
    object btnCancelarBaja: TButton
      Left = 396
      Top = 104
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    inline fraMotivoBaja: TfraCodigoDescripcion
      Left = 93
      Top = 14
      Width = 366
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnEnter = fraMotivoIngresoABMEnter
      ExplicitLeft = 93
      ExplicitTop = 14
      ExplicitWidth = 366
      inherited cmbDescripcion: TArtComboBox
        Width = 301
        ExplicitWidth = 301
      end
    end
    object cbCasosARelacionar: TArtComboBox
      Left = 94
      Top = 45
      Width = 364
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      NumGlyphs = 1
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'IDCASO'
          Title.Caption = 'ID'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FCASO'
          Title.Caption = 'Fecha Alta'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTIVO'
          Title.Caption = 'Motivo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADOCASO'
          Title.Caption = 'Estado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDADOR'
          Title.Caption = 'Liquidador'
          Visible = True
        end>
      DataSource = dsCasosARelacionar
      FieldList = 'descr'
      FieldKey = 'idcaso'
      ClearOnCancel = True
    end
    object chkEnSuspenso: TCheckBox
      Left = 18
      Top = 75
      Width = 97
      Height = 17
      Caption = 'En Suspenso'
      TabOrder = 4
    end
  end
  object fpCasosRelacionados: TFormPanel [10]
    Left = 218
    Top = 373
    Width = 637
    Height = 220
    Caption = 'Casos relacionados'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      637
      220)
    object Bevel5: TBevel
      Left = 4
      Top = 184
      Width = 629
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 123
      ExplicitWidth = 497
    end
    object Button1: TButton
      Left = 557
      Top = 190
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 0
    end
    object GridCasosRelacionados: TArtDBGrid
      Left = 6
      Top = 8
      Width = 626
      Height = 169
      DataSource = dsCasosRelacionados
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'IDCASO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FCASO'
          Title.Caption = 'F. CASO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTIVO'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADOCASO'
          Title.Caption = 'ESTADO CASO'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDADOR'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTIVOBAJA'
          Title.Caption = 'MOTIVO BAJA'
          Width = 200
          Visible = True
        end>
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   cl_id idcaso, art.utiles.armar_siniestro(ex_siniestro, ' +
        'ex_orden, ex_recaida) siniestro,'
      
        '         le_numliqui nroliq, ex_fechaaccidente faccidente, art.u' +
        'tiles.armar_cuit(em_cuit) cuit,'
      
        '         em_nombre empresa, art.utiles.armar_cuit(tj_cuil) cuil,' +
        ' tj_nombre trabajador,'
      
        '         est.tb_descripcion estadosin, ex_bajamedica fbajamedica' +
        ', ex_altamedica faltamedica,'
      
        '         ex_fecharecaida frecaida, TRUNC(cl_fechaalta) fingresoc' +
        'aso, hl_fechaegreso fegresotrab,'
      
        '         el_descripcion estadocaso, li_descripcion estadoliq, DE' +
        'CODE(cl_idliquidacion, NULL, '#39'N'#39', '#39'S'#39') liquidado,'
      
        '         DECODE(em_suss, 1, '#39'S'#39', 2, '#39'N'#39', 3, '#39'M'#39') suss, mi_descri' +
        'pcion motivocaso,'
      
        '         mot.tb_descripcion mbajatrab, cl_fechabaja finactivo, m' +
        'l_descripcion motbajacaso,'
      
        '         lc_usuario liquidador, cl_docpendiente, art.liq.is_bloq' +
        'ueoiltempresa(em_cuit, art.actualdate) bloqueoilt,'
      
        '         art.inca.is_extensionilt(ex_id) extensionilt, cl_observ' +
        'acion observacion, cl_solauditoria solaudit,'
      
        '         DECODE(le_idchequeemitido, NULL, '#39'N'#39', '#39'S'#39') concheque, c' +
        'e_numero nrocheque, che.tb_descripcion estcheque,'
      
        '         art.dinerarias.get_diasenestado(cl_id) diasenestado, cl' +
        '_altamanual, ev_fecha fdictamen,'
      
        '         ev_fechaalta fcargadictamen, comi.tb_descripcion comisi' +
        'onmedica, ev_expedincapacidad expedincapacidad,'
      
        '         ev_fecharecepcion frecepdictamen, art.dinerarias.get_do' +
        'cuvencida(cl_id) docvencida,'
      
        '         tm_descripcion situacionddjj, art.dinerarias.get_situac' +
        'ionrevista(ex_cuil) situacionrevista,'
      
        '         art.dinerarias.get_diasenestado(cl_id, 12) diasasignado' +
        ', cl_id, ex_siniestro, ex_orden,'
      
        '         ex_recaida, tj_nombre, lc_id, el_codigo, ex_id, tj_id, ' +
        'lc_usuario, cl_idliquidador,'
      
        '         el_pendienteliq, se_id, cl_anticipo anticipo, ev_porcin' +
        'capacidad porcina,'
      
        '         ev_grado gradoinc, ev_caracter caracterinc, ev_graninc ' +
        'graninv,'
      '         art.dinerarias.get_diassinaprob(cl_id) diassinaprob,'
      
        '         at_id idtareasic, at_descripcion textoreclamo, ev_integ' +
        'ral, ev_porcintegral'
      
        '    FROM din.dcl_casosparaliquidar, din.dml_motivobajaliq, din.d' +
        'el_estadoliq,'
      
        '         din.dmi_motivoingresoliq, din.dlc_liquidadorescasos, ar' +
        't.sex_expedientes,'
      
        '         aem_empresa, ctj_trabajador, art.sle_liquiempsin, art.c' +
        'tb_tablas est,'
      
        '         comunes.chl_historicolaboral, art.sli_estadosliquidacio' +
        'n, art.ctb_tablas mot,'
      
        '         teso.rce_chequeemitido, art.ctb_tablas che, art.ctb_tab' +
        'las comi,'
      
        '         art.sev_eventosdetramite, emi.itm_topemasas, use_usuari' +
        'os,'
      '         agenda.aat_agendatarea'
      '   WHERE cl_idexpediente = ex_id'
      '     AND ex_cuit = em_cuit'
      '     AND ex_idtrabajador = tj_id'
      '     AND ex_estado = est.tb_codigo'
      '     AND est.tb_clave = '#39'SIEST'#39
      '     AND hl_motivobaja = mot.tb_codigo(+)'
      '     AND mot.tb_clave(+) = '#39'MOTIB'#39
      '     AND le_idchequeemitido = ce_id(+)'
      '     AND ce_estado = che.tb_codigo(+)'
      '     AND che.tb_clave(+) = '#39'ESTCH'#39
      '     AND comi.tb_codigo(+) = ev_comision'
      '     AND comi.tb_clave(+) = '#39'COMED'#39
      '     AND cl_idliquidacion = le_id(+)'
      '     AND cl_idmotivobaja = ml_id(+)'
      '     AND cl_idestado = el_id'
      '     AND cl_idmotivoingreso = mi_id'
      '     AND cl_idliquidador = lc_id(+)'
      '     AND cl_idhistoricolaboral = hl_id(+)'
      '     AND le_estado = li_codigo(+)'
      '     AND cl_ideventoinca = ev_idevento(+)'
      '     AND cl_idsituacion = tm_id(+)'
      '     AND cl_idtareasic = at_id(+)'
      '     AND cl_idtipocaso = 3  /*casos de ILP*/'
      '     AND se_usuario = lc_usuario'
      '     AND se_fechabaja IS NULL'
      '     AND cl_fechabaja IS NULL'
      'ORDER BY siniestro')
    Top = 305
    object sdqConsultaIDCASO: TFloatField
      FieldName = 'IDCASO'
      Required = True
    end
    object sdqConsultaSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqConsultaNROLIQ: TFloatField
      FieldName = 'NROLIQ'
    end
    object sdqConsultaFACCIDENTE: TDateTimeField
      FieldName = 'FACCIDENTE'
    end
    object sdqConsultaCUIT: TStringField
      FieldName = 'CUIT'
      Size = 4000
    end
    object sdqConsultaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 200
    end
    object sdqConsultaCUIL: TStringField
      FieldName = 'CUIL'
      Size = 4000
    end
    object sdqConsultaTRABAJADOR: TStringField
      FieldName = 'TRABAJADOR'
      Required = True
      Size = 60
    end
    object sdqConsultaESTADOSIN: TStringField
      FieldName = 'ESTADOSIN'
      Size = 150
    end
    object sdqConsultaFBAJAMEDICA: TDateTimeField
      FieldName = 'FBAJAMEDICA'
    end
    object sdqConsultaFALTAMEDICA: TDateTimeField
      FieldName = 'FALTAMEDICA'
    end
    object sdqConsultaFRECAIDA: TDateTimeField
      FieldName = 'FRECAIDA'
    end
    object sdqConsultaFINGRESOCASO: TDateTimeField
      FieldName = 'FINGRESOCASO'
    end
    object sdqConsultaFEGRESOTRAB: TDateTimeField
      FieldName = 'FEGRESOTRAB'
    end
    object sdqConsultaESTADOCASO: TStringField
      FieldName = 'ESTADOCASO'
      Required = True
      Size = 150
    end
    object sdqConsultaESTADOLIQ: TStringField
      FieldName = 'ESTADOLIQ'
      Size = 50
    end
    object sdqConsultaLIQUIDADO: TStringField
      FieldName = 'LIQUIDADO'
      Size = 1
    end
    object sdqConsultaSUSS: TStringField
      FieldName = 'SUSS'
      Size = 1
    end
    object sdqConsultaMOTIVOCASO: TStringField
      FieldName = 'MOTIVOCASO'
      Required = True
      Size = 500
    end
    object sdqConsultaMBAJATRAB: TStringField
      FieldName = 'MBAJATRAB'
      Size = 150
    end
    object sdqConsultaFINACTIVO: TDateTimeField
      FieldName = 'FINACTIVO'
    end
    object sdqConsultaMOTBAJACASO: TStringField
      FieldName = 'MOTBAJACASO'
      Size = 500
    end
    object sdqConsultaLIQUIDADOR: TStringField
      FieldName = 'LIQUIDADOR'
    end
    object sdqConsultaCL_DOCPENDIENTE: TStringField
      FieldName = 'CL_DOCPENDIENTE'
      Size = 1
    end
    object sdqConsultaBLOQUEOILT: TStringField
      FieldName = 'BLOQUEOILT'
      Size = 4000
    end
    object sdqConsultaEXTENSIONILT: TStringField
      FieldName = 'EXTENSIONILT'
      Size = 4000
    end
    object sdqConsultaOBSERVACION: TStringField
      FieldName = 'OBSERVACION'
      Size = 1000
    end
    object sdqConsultaSOLAUDIT: TStringField
      FieldName = 'SOLAUDIT'
      Size = 1
    end
    object sdqConsultaCONCHEQUE: TStringField
      FieldName = 'CONCHEQUE'
      Size = 1
    end
    object sdqConsultaNROCHEQUE: TFloatField
      FieldName = 'NROCHEQUE'
    end
    object sdqConsultaESTCHEQUE: TStringField
      FieldName = 'ESTCHEQUE'
      Size = 150
    end
    object sdqConsultaDIASENESTADO: TStringField
      FieldName = 'DIASENESTADO'
      Size = 4000
    end
    object sdqConsultaCL_ALTAMANUAL: TStringField
      FieldName = 'CL_ALTAMANUAL'
      Size = 1
    end
    object sdqConsultaFDICTAMEN: TDateTimeField
      FieldName = 'FDICTAMEN'
    end
    object sdqConsultaFCARGADICTAMEN: TDateTimeField
      FieldName = 'FCARGADICTAMEN'
    end
    object sdqConsultaCOMISIONMEDICA: TStringField
      FieldName = 'COMISIONMEDICA'
      Size = 150
    end
    object sdqConsultaEXPEDINCAPACIDAD: TStringField
      FieldName = 'EXPEDINCAPACIDAD'
    end
    object sdqConsultaFRECEPDICTAMEN: TDateTimeField
      FieldName = 'FRECEPDICTAMEN'
    end
    object sdqConsultaDOCVENCIDA: TStringField
      FieldName = 'DOCVENCIDA'
      Size = 4000
    end
    object sdqConsultaSITUACIONDDJJ: TStringField
      FieldName = 'SITUACIONDDJJ'
      Size = 250
    end
    object sdqConsultaSITUACIONREVISTA: TStringField
      FieldName = 'SITUACIONREVISTA'
      Size = 4000
    end
    object sdqConsultaDIASASIGNADO: TStringField
      FieldName = 'DIASASIGNADO'
      Size = 4000
    end
    object sdqConsultaCL_ID: TFloatField
      FieldName = 'CL_ID'
      Required = True
    end
    object sdqConsultaEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqConsultaEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqConsultaEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqConsultaTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqConsultaLC_ID: TFloatField
      FieldName = 'LC_ID'
    end
    object sdqConsultaEL_CODIGO: TStringField
      FieldName = 'EL_CODIGO'
      Required = True
      Size = 2
    end
    object sdqConsultaEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
    object sdqConsultaTJ_ID: TFloatField
      FieldName = 'TJ_ID'
      Required = True
    end
    object sdqConsultaLC_USUARIO: TStringField
      FieldName = 'LC_USUARIO'
    end
    object sdqConsultaCL_IDLIQUIDADOR: TFloatField
      FieldName = 'CL_IDLIQUIDADOR'
    end
    object sdqConsultaEL_PENDIENTELIQ: TStringField
      FieldName = 'EL_PENDIENTELIQ'
      Size = 1
    end
    object sdqConsultaSE_ID: TFloatField
      FieldName = 'SE_ID'
    end
    object sdqConsultaANTICIPO: TStringField
      FieldName = 'ANTICIPO'
      Size = 1
    end
    object sdqConsultaPORCINA: TFloatField
      FieldName = 'PORCINA'
    end
    object sdqConsultaGRADOINC: TStringField
      FieldName = 'GRADOINC'
      Size = 1
    end
    object sdqConsultaCARACTERINC: TStringField
      FieldName = 'CARACTERINC'
      Size = 1
    end
    object sdqConsultaGRANINV: TStringField
      FieldName = 'GRANINV'
      Size = 1
    end
    object sdqConsultaDIASSINAPROB: TFloatField
      FieldName = 'DIASSINAPROB'
    end
    object sdqConsultaEV_IDEVENTO: TFloatField
      FieldName = 'EV_IDEVENTO'
    end
    object sdqConsultaJUICIO: TStringField
      FieldName = 'JUICIO'
      Size = 800
    end
    object sdqConsultaESGPBA: TStringField
      FieldName = 'ESGPBA'
      Size = 1
    end
    object sdqConsultaIDTAREASIC: TFloatField
      FieldName = 'IDTAREASIC'
    end
    object sdqConsultaTEXTORECLAMO: TStringField
      FieldName = 'TEXTORECLAMO'
      Size = 1000
    end
    object sdqConsultaEV_INTEGRAL: TStringField
      FieldName = 'EV_INTEGRAL'
      Size = 1
    end
    object sdqConsultaEV_PORCINTEGRAL: TFloatField
      FieldName = 'EV_PORCINTEGRAL'
    end
  end
  inherited dsConsulta: TDataSource
    Top = 305
  end
  inherited SortDialog: TSortDialog
    Top = 333
  end
  inherited ExportDialog: TExportDialog
    Top = 333
  end
  inherited QueryPrint: TQueryPrint
    Top = 361
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'Supervisor'
      end>
    Top = 277
  end
  inherited FormStorage: TFormStorage
    Top = 277
  end
  inherited PrintDialog: TPrintDialog
    Top = 361
  end
  inherited ShortCutControl: TShortCutControl
    Top = 277
  end
  inherited FieldHider: TFieldHider
    Top = 305
  end
  object sdqEstadoLiq: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   li_id, li_codigo, li_descripcion'
      '  FROM   art.sli_estadosliquidacion'
      ' WHERE   li_fechabaja IS NULL')
    Left = 722
    Top = 155
  end
  object dsEstadoLiq: TDataSource
    DataSet = sdqEstadoLiq
    Left = 750
    Top = 155
  end
  object sdqEstadoCaso: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   el_id, el_codigo, el_descripcion'
      '  FROM   din.del_estadoliq'
      ' WHERE  el_fechabaja IS NULL'
      '      AND  el_idtipocaso = :idtipocaso'
      '      AND  el_estadooculto = '#39'N'#39)
    Left = 668
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idtipocaso'
        ParamType = ptInput
      end>
  end
  object dsEstadoCaso: TDataSource
    DataSet = sdqEstadoCaso
    Left = 696
    Top = 16
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
    Left = 80
    Top = 364
  end
  object sdqCasosARelacionar: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT cl_id idcaso, TRUNC(cl_fechaalta) fcaso, mi_descripcion m' +
        'otivo, el_descripcion estadocaso, lc_usuario'
      
        '       liquidador, cl_id || '#39' - '#39' || mi_descripcion || '#39' - '#39' || ' +
        'lc_usuario descr'
      
        '  FROM din.dcl_casosparaliquidar, din.del_estadoliq, din.dmi_mot' +
        'ivoingresoliq, din.dlc_liquidadorescasos'
      ' WHERE cl_idestado = el_id'
      '   AND cl_idmotivoingreso = mi_id'
      '   AND cl_idliquidador = lc_id'
      '   AND cl_idtipocaso = :idtipocaso'
      '   AND cl_fechabaja IS NULL'
      '   AND cl_idexpediente = :idexped'
      '   AND cl_id <> :idcaso'
      ' ORDER BY cl_id')
    Left = 23
    Top = 418
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idtipocaso'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idexped'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idcaso'
        ParamType = ptInput
      end>
  end
  object dsCasosARelacionar: TDataSource
    DataSet = sdqCasosARelacionar
    Left = 53
    Top = 418
  end
  object sdqPedidosDoc: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   TRUNC(pd_fechaalta) fpedido, pd_observacion observacion' +
        ', tc_codigo codcarta,'
      '         DECODE(ca_nrocartadoc, NULL, '#39'N'#39', '#39'S'#39') cartaimpresa'
      '    FROM din.dpd_pedidosdocum, cca_carta, ctc_textocarta'
      '   WHERE pd_idcarta = ca_id(+)'
      '     AND ca_idtextocarta = tc_id(+)'
      '     AND pd_fechabaja IS NULL'
      '     AND ca_fechabaja(+) IS NULL'
      '     AND pd_idcaso = :idcaso'
      'ORDER BY pd_id'
      '')
    Left = 23
    Top = 389
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idcaso'
        ParamType = ptInput
      end>
    object sdqPedidosDocFPEDIDO: TDateTimeField
      FieldName = 'FPEDIDO'
    end
    object sdqPedidosDocOBSERVACION: TStringField
      FieldName = 'OBSERVACION'
      Size = 1000
    end
    object sdqPedidosDocCODCARTA: TStringField
      FieldName = 'CODCARTA'
      Size = 5
    end
    object sdqPedidosDocCARTAIMPRESA: TStringField
      FieldName = 'CARTAIMPRESA'
      Size = 1
    end
  end
  object dsPedidosDoc: TDataSource
    DataSet = sdqPedidosDoc
    Left = 53
    Top = 390
  end
  object dsCasosRelacionados: TDataSource
    DataSet = sdqCasosRelacionados
    Left = 53
    Top = 447
  end
  object sdqCasosRelacionados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   cl_id idcaso, TRUNC(cl_fechaalta) fcaso, mi_descripcion' +
        ' motivo, '
      
        #9'  el_descripcion estadocaso, lc_usuario liquidador, ml_descripc' +
        'ion motivobaja'
      '    FROM din.dcl_casosparaliquidar, din.del_estadoliq, '
      #9'  din.dmi_motivoingresoliq, din.dlc_liquidadorescasos,'
      '         din.dml_motivobajaliq'
      '   WHERE cl_idestado = el_id'
      '     AND cl_idmotivoingreso = mi_id'
      '     AND cl_idliquidador = lc_id'
      '     AND cl_idmotivobaja = ml_id'
      '     AND cl_idtipocaso = :idtipocaso'
      '     AND cl_idexpediente = :idexped'
      '     AND cl_id IN(SELECT cr_idcasorel'
      '                    FROM din.dcr_casosrelacion'
      '                   WHERE cr_idcasomandat = :idcaso'
      '                     AND cr_fechabaja IS NULL)'
      'ORDER BY cl_id'
      '')
    Left = 23
    Top = 447
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idtipocaso'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idexped'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idcaso'
        ParamType = ptInput
      end>
    object sdqCasosRelacionadosIDCASO: TFloatField
      FieldName = 'IDCASO'
      Required = True
    end
    object sdqCasosRelacionadosFCASO: TDateTimeField
      FieldName = 'FCASO'
    end
    object sdqCasosRelacionadosMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Required = True
      Size = 500
    end
    object sdqCasosRelacionadosESTADOCASO: TStringField
      FieldName = 'ESTADOCASO'
      Required = True
      Size = 150
    end
    object sdqCasosRelacionadosLIQUIDADOR: TStringField
      FieldName = 'LIQUIDADOR'
      Required = True
    end
    object sdqCasosRelacionadosMOTIVOBAJA: TStringField
      FieldName = 'MOTIVOBAJA'
      Required = True
      Size = 500
    end
  end
  object sdqHistoricoEstados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   hl_id, art.utiles.armar_siniestro(ex_siniestro, ex_orde' +
        'n, ex_recaida) siniestro, '
      
        '                 tj_nombre trabajador, TRUNC(hl_fechaalta) festa' +
        'do, el_descripcion estado, lc_usuario liquidador'
      
        '    FROM din.dcl_casosparaliquidar, din.del_estadoliq, din.dlc_l' +
        'iquidadorescasos, '
      
        '                 din.dhl_historicoestadoliq, art.sex_expedientes' +
        ', ctj_trabajador'
      '   WHERE cl_idexpediente = ex_id'
      '     AND ex_idtrabajador = tj_id'
      '     AND hl_idestado = el_id'
      '     AND cl_id = hl_idcaso'
      '     AND hl_idliquidador = lc_id(+)'
      '     AND cl_id = :idcaso'
      'ORDER BY hl_id'
      '')
    Left = 23
    Top = 476
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idcaso'
        ParamType = ptInput
      end>
    object sdqHistoricoEstadosHL_ID: TFloatField
      FieldName = 'HL_ID'
      Required = True
    end
    object sdqHistoricoEstadosSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqHistoricoEstadosTRABAJADOR: TStringField
      FieldName = 'TRABAJADOR'
      Required = True
      Size = 60
    end
    object sdqHistoricoEstadosFESTADO: TDateTimeField
      FieldName = 'FESTADO'
    end
    object sdqHistoricoEstadosESTADO: TStringField
      FieldName = 'ESTADO'
      Required = True
      Size = 150
    end
    object sdqHistoricoEstadosLIQUIDADOR: TStringField
      FieldName = 'LIQUIDADOR'
    end
  end
  object dsHistoricoEstados: TDataSource
    DataSet = sdqHistoricoEstados
    Left = 53
    Top = 476
  end
  object pmViajar: TPopupMenu
    Left = 80
    Top = 336
    object mnuViajarLiqIncap: TMenuItem
      Caption = 'Liq. Incapacidades'
      OnClick = mnuViajarLiqIncapClick
    end
    object mnuViajarAdmCD: TMenuItem
      Caption = 'Administraci'#243'n de CD'
      OnClick = mnuViajarAdmCDClick
    end
  end
  object mnuLinks: TPopupMenu
    Left = 83
    Top = 393
    object mnuAnses: TMenuItem
      Caption = 'http://www.anses.gob.ar'
      OnClick = mnuAnsesClick
    end
    object mnuAfip: TMenuItem
      Caption = 'http://www.afip.gob.ar/home/index.html'
      OnClick = mnuAfipClick
    end
    object mnuSSS: TMenuItem
      Caption = 'http://www.sssalud.gov.ar'
      OnClick = mnuSSSClick
    end
    object mnuARTs: TMenuItem
      Caption = 'http://www.arts.gob.ar'
      OnClick = mnuARTsClick
    end
    object mnuSRT: TMenuItem
      Caption = 'http://www.srt.gob.ar'
      OnClick = mnuSRTClick
    end
    object mnuBNA: TMenuItem
      Caption = 'http://www.bna.com.ar'
      OnClick = mnuBNAClick
    end
    object mnuCorreo: TMenuItem
      Caption = 'http://www.correo-argentino.com'
      OnClick = mnuCorreoClick
    end
    object mnuBcoPatag: TMenuItem
      Caption = 'http://www.bancopatagonia.com/personas/personas.shtml'
      OnClick = mnuBcoPatagClick
    end
    object mnuSSN: TMenuItem
      Caption = 'http://www2.ssn.gob.ar'
      OnClick = mnuSSNClick
    end
    object mnuUART: TMenuItem
      Caption = 'http://www.uart.org.ar/~uart'
      OnClick = mnuUARTClick
    end
    object mnuInfoleg: TMenuItem
      Caption = 'http://www.infoleg.gov.ar'
      OnClick = mnuInfolegClick
    end
  end
end
