inherited frmAnalisisDeEmision: TfrmAnalisisDeEmision
  Left = 9
  Top = 129
  Width = 770
  Height = 215
  Caption = 'An'#225'lisis de Emisi'#243'n'
  Constraints.MaxHeight = 215
  Constraints.MinHeight = 215
  Constraints.MinWidth = 770
  OldCreateOrder = True
  OnActivate = FormActivate
  DesignSize = (
    762
    188)
  PixelsPerInch = 96
  TextHeight = 13
  object pgTiposConsultas: TPageControl [0]
    Left = 198
    Top = 5
    Width = 562
    Height = 154
    ActivePage = tsEmpresasConDiferencias
    Anchors = [akLeft, akTop, akRight]
    MultiLine = True
    TabOrder = 1
    TabPosition = tpBottom
    object tsEmisionMes: TTabSheet
      Caption = 'Emisi'#243'n del Mes'
      object GroupBox1: TGroupBox
        Left = 7
        Top = 3
        Width = 172
        Height = 48
        TabOrder = 0
        object lbPeriodo: TLabel
          Left = 16
          Top = 20
          Width = 85
          Height = 13
          AutoSize = False
          Caption = 'Periodo Contable'
        end
        object ppPerEmisionMes: TPeriodoPicker
          Left = 104
          Top = 17
          Width = 49
          Height = 21
          TabOrder = 0
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205309'
          Periodo.MinPeriodo = '195310'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          Fuente.Charset = DEFAULT_CHARSET
          Fuente.Color = clWindowText
          Fuente.Height = -11
          Fuente.Name = 'Tahoma'
          Fuente.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NullDropDown = SetMax
        end
      end
    end
    object tsEvolMesesMoviles: TTabSheet
      Caption = 'Evoluci'#243'n Emisi'#243'n-Meses M'#243'viles'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 7
        Top = 3
        Width = 227
        Height = 50
        TabOrder = 0
        object Label1: TLabel
          Left = 14
          Top = 20
          Width = 85
          Height = 13
          AutoSize = False
          Caption = 'Periodo Contable'
        end
        object Label2: TLabel
          Left = 154
          Top = 20
          Width = 17
          Height = 13
          AutoSize = False
          Caption = '>>'
        end
        object ppPerMesMovilDesde: TPeriodoPicker
          Left = 102
          Top = 17
          Width = 49
          Height = 21
          TabOrder = 0
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205309'
          Periodo.MinPeriodo = '195310'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          Fuente.Charset = DEFAULT_CHARSET
          Fuente.Color = clWindowText
          Fuente.Height = -11
          Fuente.Name = 'Tahoma'
          Fuente.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NullDropDown = SetMax
        end
        object ppPerMesMovilHasta: TPeriodoPicker
          Left = 170
          Top = 17
          Width = 49
          Height = 21
          TabOrder = 1
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205309'
          Periodo.MinPeriodo = '195310'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          Fuente.Charset = DEFAULT_CHARSET
          Fuente.Color = clWindowText
          Fuente.Height = -11
          Fuente.Name = 'Tahoma'
          Fuente.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NullDropDown = SetMax
        end
      end
    end
    object tsEmisAcumulada2Anios: TTabSheet
      Caption = 'Emisi'#243'n Acumulada-Comparaci'#243'n 2 a'#241'os'
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 7
        Top = 3
        Width = 135
        Height = 74
        TabOrder = 0
        object Label3: TLabel
          Left = 17
          Top = 12
          Width = 47
          Height = 27
          AutoSize = False
          Caption = '1er. A'#241'o Contable'
          WordWrap = True
        end
        object Label4: TLabel
          Left = 17
          Top = 42
          Width = 47
          Height = 27
          AutoSize = False
          Caption = '2do. A'#241'o Contable'
          WordWrap = True
        end
        object edEmisAcumAnio1: TIntEdit
          Left = 67
          Top = 15
          Width = 49
          Height = 21
          TabOrder = 0
          Text = '1996'
          MaxLength = 4
          MaxValue = 9999
          MinValue = 1996
          Value = 1996
        end
        object edEmisAcumAnio2: TIntEdit
          Left = 67
          Top = 45
          Width = 49
          Height = 21
          TabOrder = 1
          Text = '1996'
          MaxLength = 4
          MaxValue = 9999
          MinValue = 1996
          Value = 1996
        end
      end
    end
    object tsControles: TTabSheet
      Caption = 'Controles'
      ImageIndex = 3
      object GroupBox4: TGroupBox
        Left = 8
        Top = 7
        Width = 172
        Height = 48
        TabOrder = 0
        object Label5: TLabel
          Left = 15
          Top = 20
          Width = 85
          Height = 13
          AutoSize = False
          Caption = 'Periodo Cobertura'
        end
        object ppPerControles: TPeriodoPicker
          Left = 105
          Top = 17
          Width = 49
          Height = 21
          TabOrder = 0
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205309'
          Periodo.MinPeriodo = '195310'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          Fuente.Charset = DEFAULT_CHARSET
          Fuente.Color = clWindowText
          Fuente.Height = -11
          Fuente.Name = 'Tahoma'
          Fuente.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NullDropDown = SetMax
        end
      end
    end
    object tsRanking: TTabSheet
      Caption = 'Ranking'
      ImageIndex = 4
      object GroupBox5: TGroupBox
        Left = 7
        Top = 3
        Width = 172
        Height = 100
        TabOrder = 0
        object Label6: TLabel
          Left = 6
          Top = 20
          Width = 108
          Height = 13
          AutoSize = False
          Caption = '1er. Periodo Contable'
        end
        object Label7: TLabel
          Left = 6
          Top = 46
          Width = 108
          Height = 13
          AutoSize = False
          Caption = '2do. Periodo Contable'
        end
        object Label8: TLabel
          Left = 6
          Top = 72
          Width = 108
          Height = 13
          AutoSize = False
          Caption = 'Cant. Clientes'
        end
        object ppPer1Ranking: TPeriodoPicker
          Left = 114
          Top = 17
          Width = 49
          Height = 21
          TabOrder = 0
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205309'
          Periodo.MinPeriodo = '195310'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          Fuente.Charset = DEFAULT_CHARSET
          Fuente.Color = clWindowText
          Fuente.Height = -11
          Fuente.Name = 'Tahoma'
          Fuente.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NullDropDown = SetMax
        end
        object ppPer2Ranking: TPeriodoPicker
          Left = 114
          Top = 43
          Width = 49
          Height = 21
          TabOrder = 1
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205309'
          Periodo.MinPeriodo = '195310'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          Fuente.Charset = DEFAULT_CHARSET
          Fuente.Color = clWindowText
          Fuente.Height = -11
          Fuente.Name = 'Tahoma'
          Fuente.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NullDropDown = SetMax
        end
        object edCantClientesRanking: TIntEdit
          Left = 114
          Top = 69
          Width = 49
          Height = 21
          TabOrder = 2
          Text = '0'
          MaxLength = 4
          MaxValue = 9999
        end
      end
    end
    object tsPrincipalesClientes: TTabSheet
      Caption = 'Principales Clientes'
      ImageIndex = 5
      object GroupBox6: TGroupBox
        Left = 7
        Top = 3
        Width = 135
        Height = 74
        TabOrder = 0
        object Label9: TLabel
          Left = 7
          Top = 20
          Width = 68
          Height = 13
          AutoSize = False
          Caption = 'A'#241'o Contable'
        end
        object Label13: TLabel
          Left = 7
          Top = 48
          Width = 68
          Height = 13
          AutoSize = False
          Caption = 'Cant. Clientes'
        end
        object edAnioContPrincClientes: TIntEdit
          Left = 77
          Top = 17
          Width = 49
          Height = 21
          TabOrder = 0
          Text = '1996'
          MaxLength = 4
          MaxValue = 9999
          MinValue = 1996
          Value = 1996
        end
        object edCantClientesPrincClientes: TIntEdit
          Left = 77
          Top = 44
          Width = 49
          Height = 21
          TabOrder = 1
          Text = '0'
          MaxLength = 4
          MaxValue = 9999
        end
      end
    end
    object tsCalidadEstimacion: TTabSheet
      Caption = 'Calidad de Estimaci'#243'n'
      ImageIndex = 6
      object GroupBox7: TGroupBox
        Left = 7
        Top = 3
        Width = 172
        Height = 48
        TabOrder = 0
        object Label10: TLabel
          Left = 16
          Top = 20
          Width = 85
          Height = 13
          AutoSize = False
          Caption = 'Periodo Contable'
        end
        object ppPerCalidadEstim: TPeriodoPicker
          Left = 104
          Top = 17
          Width = 49
          Height = 21
          TabOrder = 0
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205309'
          Periodo.MinPeriodo = '195310'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          Fuente.Charset = DEFAULT_CHARSET
          Fuente.Color = clWindowText
          Fuente.Height = -11
          Fuente.Name = 'Tahoma'
          Fuente.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NullDropDown = SetMax
        end
      end
    end
    object tsEmpresasConDiferencias: TTabSheet
      Caption = 'Princ. Empr. con Diferencias'
      ImageIndex = 7
      object GroupBox8: TGroupBox
        Left = 7
        Top = 3
        Width = 172
        Height = 74
        TabOrder = 0
        object Label11: TLabel
          Left = 16
          Top = 20
          Width = 85
          Height = 13
          AutoSize = False
          Caption = 'Periodo Contable'
        end
        object Label14: TLabel
          Left = 16
          Top = 48
          Width = 85
          Height = 13
          AutoSize = False
          Caption = 'Cant. Clientes'
        end
        object ppEmprDiferencias: TPeriodoPicker
          Left = 104
          Top = 17
          Width = 49
          Height = 21
          TabOrder = 0
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205309'
          Periodo.MinPeriodo = '195310'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          Fuente.Charset = DEFAULT_CHARSET
          Fuente.Color = clWindowText
          Fuente.Height = -11
          Fuente.Name = 'Tahoma'
          Fuente.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NullDropDown = SetMax
        end
        object edCantClientesEmprDiferencias: TIntEdit
          Left = 104
          Top = 44
          Width = 49
          Height = 21
          TabOrder = 1
          Text = '0'
          MaxLength = 4
          MaxValue = 9999
        end
      end
    end
    object tsCadenciaEstimacion: TTabSheet
      Caption = 'Cadencia de la Estimaci'#243'n'
      ImageIndex = 8
      object GroupBox9: TGroupBox
        Left = 7
        Top = 3
        Width = 172
        Height = 48
        TabOrder = 0
        object Label12: TLabel
          Left = 16
          Top = 20
          Width = 85
          Height = 13
          AutoSize = False
          Caption = 'Periodo Contable'
        end
        object ppCadenciaEstimac: TPeriodoPicker
          Left = 104
          Top = 17
          Width = 49
          Height = 21
          TabOrder = 0
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205309'
          Periodo.MinPeriodo = '195310'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          Fuente.Charset = DEFAULT_CHARSET
          Fuente.Color = clWindowText
          Fuente.Height = -11
          Fuente.Name = 'Tahoma'
          Fuente.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NullDropDown = SetMax
        end
      end
    end
  end
  object btnAceptar: TButton [1]
    Left = 604
    Top = 163
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 2
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [2]
    Left = 684
    Top = 163
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object GroupBox10: TGroupBox [3]
    Left = 3
    Top = 0
    Width = 191
    Height = 157
    Caption = 'Tipo de An'#225'lisis'
    TabOrder = 0
    object cbEmisionMes: TCheckBox
      Left = 7
      Top = 16
      Width = 179
      Height = 17
      Caption = 'Emisi'#243'n del Mes'
      TabOrder = 0
      OnClick = cbEmisionMesClick
    end
    object cbEvolMesesMoviles: TCheckBox
      Left = 7
      Top = 31
      Width = 179
      Height = 17
      Caption = 'Evoluci'#243'n Emisi'#243'n-Meses M'#243'viles'
      TabOrder = 1
      OnClick = cbEvolMesesMovilesClick
    end
    object cbEmisAcumulada2Anios: TCheckBox
      Left = 7
      Top = 46
      Width = 179
      Height = 17
      Caption = 'Emisi'#243'n Acumul.-Compar. 2 a'#241'os'
      TabOrder = 2
      OnClick = cbEmisAcumulada2AniosClick
    end
    object cbControles: TCheckBox
      Left = 7
      Top = 61
      Width = 179
      Height = 17
      Caption = 'Controles'
      TabOrder = 3
      OnClick = cbControlesClick
    end
    object cbRanking: TCheckBox
      Left = 7
      Top = 76
      Width = 179
      Height = 17
      Caption = 'Ranking'
      TabOrder = 4
      OnClick = cbRankingClick
    end
    object cbPrincipalesClientes: TCheckBox
      Left = 7
      Top = 91
      Width = 179
      Height = 17
      Caption = 'Principales Clientes'
      TabOrder = 5
      OnClick = cbPrincipalesClientesClick
    end
    object cbCalidadEstimacion: TCheckBox
      Left = 7
      Top = 106
      Width = 179
      Height = 17
      Caption = 'Calidad de Estimaci'#243'n'
      TabOrder = 6
      OnClick = cbCalidadEstimacionClick
    end
    object cbEmpresasConDiferencias: TCheckBox
      Left = 7
      Top = 121
      Width = 179
      Height = 17
      Caption = 'Princ. Empr. con Diferencias'
      TabOrder = 7
      OnClick = cbEmpresasConDiferenciasClick
    end
    object cbCadenciaEstimacion: TCheckBox
      Left = 7
      Top = 136
      Width = 179
      Height = 17
      Caption = 'Cadencia de la Estimaci'#243'n'
      TabOrder = 8
      OnClick = cbCadenciaEstimacionClick
    end
  end
  inherited FormStorage: TFormStorage
    Left = 20
    Top = 220
  end
  inherited XPMenu: TXPMenu
    Left = 48
    Top = 220
  end
  inherited ilByN: TImageList
    Left = 20
    Top = 248
  end
  inherited ilColor: TImageList
    Left = 48
    Top = 248
  end
  inherited IconosXP: TImageList
    Left = 76
    Top = 248
  end
end
