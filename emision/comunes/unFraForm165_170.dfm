object fraForm165_170: TfraForm165_170
  Left = 0
  Top = 0
  Width = 408
  Height = 281
  TabOrder = 0
  object lblTotalEmpleados: TLabel
    Left = 8
    Top = 31
    Width = 57
    Height = 15
    AutoSize = False
    Caption = 'Total Empl:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lblTotalMasaSalarial: TLabel
    Left = 163
    Top = 31
    Width = 79
    Height = 16
    AutoSize = False
    Caption = 'Total Masa Sal.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lblInscripcion: TLabel
    Left = 8
    Top = 55
    Width = 54
    Height = 13
    Caption = 'Inscripci'#243'n:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edTotalEmpleados: TIntEdit
    Left = 71
    Top = 28
    Width = 88
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '0'
    Alignment = taRightJustify
    MaxLength = 6
    MaxValue = 999999
  end
  object edTotalMasaSalarial: TCurrencyEdit
    Left = 243
    Top = 28
    Width = 80
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 $;-,0.00 $'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 12
    MaxValue = 999999999.000000000000000000
    ParentFont = False
    TabOrder = 2
    ZeroEmpty = False
  end
  object cbInscripcion: TComboBox
    Left = 70
    Top = 51
    Width = 255
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 3
    OnChange = cbInscripcionChange
  end
  object gbDetalle: TGroupBox
    Left = 0
    Top = 76
    Width = 408
    Height = 205
    Align = alBottom
    Caption = 'Detalle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    DesignSize = (
      408
      205)
    object lbCUIL: TLabel
      Left = 8
      Top = 21
      Width = 24
      Height = 13
      Caption = 'CUIL'
      FocusControl = edCUIL
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblMasaSalarial: TLabel
      Left = 173
      Top = 21
      Width = 67
      Height = 17
      AutoSize = False
      Caption = 'Masa Salarial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblCondicion: TLabel
      Left = 8
      Top = 44
      Width = 50
      Height = 13
      Caption = 'Condici'#243'n:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSumTotalEmpleados: TLabel
      Left = 10
      Top = 186
      Width = 82
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Total Empleados:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edSumlMasaSalarial: TLabel
      Left = 169
      Top = 186
      Width = 77
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Total Masa Sal.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblFechaPresentacion: TLabel
      Left = 173
      Top = 67
      Width = 60
      Height = 13
      Caption = 'Fecha Pres.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 354
      Top = 186
      Width = 48
      Height = 13
      Caption = 'Sin Ticket'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edCUIL: TMaskEdit
      Left = 72
      Top = 17
      Width = 83
      Height = 21
      EditMask = '99-########-c;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      TabOrder = 0
    end
    object edMasaSalarialCuil: TCurrencyEdit
      Left = 244
      Top = 17
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 $;-,0.00 $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 12
      MaxValue = 999999999.000000000000000000
      ParentFont = False
      TabOrder = 1
      ZeroEmpty = False
    end
    object tbComandosDetalle: TToolBar
      Left = 330
      Top = 23
      Width = 73
      Height = 33
      Align = alNone
      Anchors = [akLeft, akTop, akBottom]
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object tbAddCuil: TToolButton
        Left = 0
        Top = 2
        Action = acNew
      end
      object tbDeleteCuil: TToolButton
        Left = 23
        Top = 2
        Action = acDelete
      end
      object tbLimpiarCuil: TToolButton
        Left = 46
        Top = 2
        Action = acClear
      end
    end
    inline fraCondicion: TfraStaticCodigoDescripcion
      Left = 71
      Top = 39
      Width = 255
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      DesignSize = (
        255
        23)
      inherited edCodigo: TPatternEdit
        Width = 39
      end
      inherited cmbDescripcion: TComboGrid
        Left = 42
        Width = 212
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
    object dbgDetalleCUIL: TRxDBGrid
      Left = 9
      Top = 90
      Width = 395
      Height = 90
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsTrab
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = dbgDetalleCUILGetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'Cuil'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MasaSalarial'
          Title.Caption = 'Masa Salarial'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ConTicket'
          Title.Caption = 'Ticket'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FechaPresentacion'
          Title.Caption = 'Fecha'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Condicion'
          Title.Caption = 'Condici'#243'n'
          Width = 210
          Visible = True
        end>
    end
    object edSumMasaSalarial: TCurrencyEdit
      Left = 251
      Top = 185
      Width = 72
      Height = 16
      TabStop = False
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      DisplayFormat = '$ ,0.00;$ - ,0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Anchors = [akLeft, akBottom]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object edSumTotalEmpleados: TIntEdit
      Left = 97
      Top = 185
      Width = 59
      Height = 16
      TabStop = False
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edFechaPresentacion: TDateComboBox
      Left = 235
      Top = 63
      Width = 90
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object chkConTicket: TCheckBox
      Left = 6
      Top = 67
      Width = 79
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Con Ticket'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = chkConTicketClick
    end
    object Panel3: TPanel
      Left = 334
      Top = 184
      Width = 16
      Height = 16
      BevelOuter = bvNone
      Color = 13041606
      TabOrder = 9
    end
  end
  object chkConResumen: TCheckBox
    Left = 7
    Top = 7
    Width = 151
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Con Resumen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = chkConResumenClick
  end
  object cdsTrab: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Cuil'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MasaSalarial'
        DataType = ftFloat
      end
      item
        Name = 'IdCondicion'
        DataType = ftInteger
      end
      item
        Name = 'Condicion'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ConTicket'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FechaPresentacion'
        DataType = ftDate
      end
      item
        Name = 'idddjjTrabajador'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'cdsTrab165_170Index'
        Fields = 'Cuil'
        Options = [ixUnique, ixDescending]
      end>
    IndexName = 'cdsTrab165_170Index'
    Params = <>
    StoreDefs = True
    Left = 365
    Top = 3
  end
  object dsTrab: TDataSource
    DataSet = cdsTrab
    Left = 395
    Top = 3
  end
  object ActionList: TActionList
    Images = DmEmision.ilColor
    Left = 352
    Top = 48
    object acNew: TAction
      Category = 'Buttons'
      Caption = 'Nuevo'
      Hint = 'Nuevo'
      ImageIndex = 28
      ShortCut = 16462
      OnExecute = tbAddCuilClick
    end
    object acDelete: TAction
      Category = 'Buttons'
      Caption = 'Eliminar'
      Hint = 'Eliminar'
      ImageIndex = 27
      ShortCut = 16453
      OnExecute = tbDeleteCuilClick
    end
    object acClear: TAction
      Category = 'Buttons'
      Caption = 'Limpiar'
      Hint = 'Limpiar'
      ImageIndex = 1
      ShortCut = 16460
      OnExecute = tbLimpiarCuilClick
    end
  end
end
