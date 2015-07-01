inherited frmConsultaVisitasAnual: TfrmConsultaVisitasAnual
  Left = 574
  Top = 238
  Caption = 'Consulta Visitas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 85
    Visible = True
    ExplicitHeight = 85
    object pcFilter: TPageControl
      Left = 0
      Top = 0
      Width = 621
      Height = 85
      ActivePage = tbGeneral
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 93
      object tbGeneral: TTabSheet
        Caption = 'General'
        ExplicitHeight = 26
        object Label2: TLabel
          Left = 5
          Top = 8
          Width = 46
          Height = 13
          Caption = 'Preventor'
        end
        object Label1: TLabel
          Left = 381
          Top = 8
          Width = 20
          Height = 13
          Caption = 'Mes'
        end
        object Label9: TLabel
          Left = 5
          Top = 29
          Width = 57
          Height = 13
          Caption = 'Coordinador'
        end
        inline fraPreventorFiltro: TfraCodigoDescripcion
          Left = 70
          Top = 3
          Width = 301
          Height = 23
          TabOrder = 0
          ExplicitLeft = 70
          ExplicitTop = 3
          ExplicitWidth = 301
          DesignSize = (
            301
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 68
            Width = 236
            CharCase = ecUpperCase
            ExplicitLeft = 68
            ExplicitWidth = 235
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            CharCase = ecNormal
            ExplicitWidth = 64
          end
        end
        object edMes: TPeriodoPicker
          Left = 408
          Top = 4
          Width = 49
          Height = 21
          TabOrder = 1
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '206401'
          Periodo.MinPeriodo = '196402'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          Fuente.Charset = DEFAULT_CHARSET
          Fuente.Color = clWindowText
          Fuente.Height = -11
          Fuente.Name = 'MS Sans Serif'
          Fuente.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NullDropDown = SetMax
        end
        inline fraCoordinadorFiltro: TfraCodigoDescripcion
          Left = 70
          Top = 28
          Width = 301
          Height = 23
          TabOrder = 2
          ExplicitLeft = 70
          ExplicitTop = 28
          ExplicitWidth = 301
          DesignSize = (
            301
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 68
            Width = 236
            CharCase = ecUpperCase
            ExplicitLeft = 68
            ExplicitWidth = 235
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            CharCase = ecNormal
            ExplicitWidth = 64
          end
        end
      end
      object tbAfiliaciones: TTabSheet
        Caption = 'Afiliaciones'
        ImageIndex = 2
        ExplicitHeight = 26
        DesignSize = (
          613
          57)
        object Label18: TLabel
          Left = 5
          Top = 9
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        object Label19: TLabel
          Left = 5
          Top = 33
          Width = 30
          Height = 13
          Caption = 'Estab.'
        end
        inline fraEmpresaFiltro: TfraEmpresa
          Left = 78
          Top = 3
          Width = 529
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
          ExplicitLeft = 78
          ExplicitTop = 3
          ExplicitWidth = 529
          ExplicitHeight = 21
          DesignSize = (
            529
            21)
          inherited lbContrato: TLabel
            Left = 425
            ExplicitLeft = 542
          end
          inherited edContrato: TIntEdit
            Left = 472
            ExplicitLeft = 711
          end
          inherited cmbRSocial: TArtComboBox
            Width = 290
            ExplicitWidth = 529
          end
        end
        object edEstablecimiento: TPatternEdit
          Left = 77
          Top = 29
          Width = 530
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Pattern = '1234567890,'
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 85
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 615
      end>
    ExplicitTop = 54
    inherited ToolBar: TToolBar
      Left = 9
      Width = 608
      ExplicitLeft = 9
      ExplicitWidth = 608
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Ver Detalle Anual'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 114
    Height = 285
    Columns = <
      item
        Expanded = False
        FieldName = 'COORDINADOR'
        Title.Caption = 'Coordinador'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'it_nombre'
        Title.Caption = 'Preventor'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MES'
        Title.Caption = 'Mes'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Visitas'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VISITAMAX'
        Title.Caption = 'M'#225'x. por Mes'
        Width = 70
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 275
    Top = 272
    ExplicitLeft = 275
    ExplicitTop = 272
  end
  object pnlBottom: TPanel [4]
    Left = 0
    Top = 399
    Width = 621
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    DesignSize = (
      621
      37)
    object btnSeleccionar: TButton
      Left = 458
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnSeleccionarClick
    end
    object btnNoSeleccionar: TButton
      Left = 540
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
