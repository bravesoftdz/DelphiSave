object fraPerfilPreventor: TfraPerfilPreventor
  Left = 0
  Top = 0
  Width = 752
  Height = 165
  Anchors = [akLeft, akTop, akRight]
  TabOrder = 0
  DesignSize = (
    752
    165)
  object gbCondicion: TGroupBox
    Left = 5
    Top = 2
    Width = 746
    Height = 163
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Condici'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object gbData: TGroupBox
      Left = 2
      Top = 15
      Width = 742
      Height = 148
      Align = alTop
      TabOrder = 0
      DesignSize = (
        742
        148)
      object gbTipoEmpresa: TGroupBox
        Left = -2
        Top = 0
        Width = 84
        Height = 148
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object cmbTipoEmpresa: TExComboBox
          Left = 7
          Top = 57
          Width = 70
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 0
          OnChange = cmbTipoEmpresaChange
          ItemIndex = -1
          Options = []
          ValueWidth = 64
        end
      end
      object gbAct: TGroupBox
        Left = 80
        Top = 0
        Width = 81
        Height = 148
        Caption = ' Actividad '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object chkActInd: TCheckBox
          Left = 5
          Top = 32
          Width = 70
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Industria'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object chkActAgro: TCheckBox
          Left = 5
          Top = 62
          Width = 70
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Agro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object chkActConst: TCheckBox
          Left = 5
          Top = 95
          Width = 70
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Construc.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object gbSect: TGroupBox
        Left = 159
        Top = 0
        Width = 128
        Height = 148
        Caption = ' Sector '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object lblVisitas: TLabel
          Left = 85
          Top = 12
          Width = 30
          Height = 13
          Caption = 'Visitas'
        end
        object chkS1: TCheckBox
          Left = 7
          Top = 30
          Width = 65
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Gob.B.A.'
          TabOrder = 0
          OnClick = chkS1Click
        end
        object chkS2: TCheckBox
          Left = 7
          Top = 54
          Width = 65
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Municip.'
          TabOrder = 2
          OnClick = chkS2Click
        end
        object chkS3: TCheckBox
          Left = 7
          Top = 80
          Width = 65
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Resto SP'
          TabOrder = 4
          OnClick = chkS3Click
        end
        object chkS4: TCheckBox
          Left = 7
          Top = 104
          Width = 65
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Privado'
          TabOrder = 6
          OnClick = chkS4Click
        end
        object edVisitasGba: TIntEdit
          Left = 82
          Top = 29
          Width = 38
          Height = 21
          TabOrder = 1
        end
        object edVisitasMunicipios: TIntEdit
          Left = 82
          Top = 53
          Width = 38
          Height = 21
          TabOrder = 3
        end
        object edVisitasRestoSP: TIntEdit
          Left = 82
          Top = 77
          Width = 38
          Height = 21
          TabOrder = 5
        end
        object edVisitasPrivado: TIntEdit
          Left = 82
          Top = 101
          Width = 38
          Height = 21
          TabOrder = 7
        end
      end
      object gbCap: TGroupBox
        Left = 285
        Top = 0
        Width = 75
        Height = 148
        Caption = ' C'#225'pitas '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object Label11: TLabel
          Left = 11
          Top = 19
          Width = 31
          Height = 13
          Caption = 'Desde'
          FocusControl = edCapDesde
        end
        object Label12: TLabel
          Left = 11
          Top = 59
          Width = 28
          Height = 13
          Caption = 'Hasta'
          FocusControl = edCapHasta
        end
        object chkCapTodas: TCheckBox
          Left = 8
          Top = 110
          Width = 53
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Todas'
          TabOrder = 2
          OnClick = chkCapTodasClick
        end
        object edCapDesde: TIntEdit
          Left = 10
          Top = 32
          Width = 54
          Height = 21
          TabOrder = 0
        end
        object edCapHasta: TIntEdit
          Left = 10
          Top = 73
          Width = 54
          Height = 21
          TabOrder = 1
        end
      end
      object gbCIIU: TGroupBox
        Left = 358
        Top = 0
        Width = 243
        Height = 148
        Anchors = [akLeft, akTop, akRight]
        Caption = 'CIIU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object lstCIIU: TARTCheckListBox
          Left = 2
          Top = 15
          Width = 239
          Height = 131
          Align = alClient
          Columns = 1
          ItemHeight = 13
          TabOrder = 0
          AutoAjustarColumnas = True
          Locked = False
          SQL = 'SELECT 1,2 FROM DUAL WHERE 1=2'
        end
      end
      object gbCatRiesgo: TGroupBox
        Left = 600
        Top = 0
        Width = 142
        Height = 148
        Anchors = [akTop]
        Caption = 'Categoria Riesgo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object lstCategoriaRiesgo: TARTCheckListBox
          Left = 2
          Top = 15
          Width = 138
          Height = 131
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
          AutoAjustarColumnas = True
          Locked = False
          SQL = 'SELECT 1,2 FROM DUAL WHERE 1=2'
        end
      end
    end
  end
end
