object fraFormNota: TfraFormNota
  Left = 0
  Top = 0
  Width = 461
  Height = 310
  TabOrder = 0
  DesignSize = (
    461
    310)
  object Nota: TLabel
    Left = 8
    Top = 59
    Width = 23
    Height = 13
    Caption = 'Nota'
  end
  object Label1: TLabel
    Left = 8
    Top = 163
    Width = 56
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Respuestas'
  end
  object edNota: TMemo
    Left = 8
    Top = 76
    Width = 446
    Height = 78
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  object tbComandosNota: TToolBar
    Left = 67
    Top = 155
    Width = 54
    Height = 29
    Align = alNone
    Anchors = [akLeft, akBottom]
    BorderWidth = 1
    Caption = 'ToolBar'
    EdgeBorders = []
    HotImages = DmEmision.ilByN
    Images = DmEmision.ilColor
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object tbNuevaRta: TToolButton
      Left = 0
      Top = 2
      Caption = 'Responder'
      ImageIndex = 6
      OnClick = tbNuevaRtaClick
    end
    object btnEliminarRta: TToolButton
      Left = 23
      Top = 2
      Hint = 'Eliminar'
      Caption = 'Eliminar'
      ImageIndex = 8
      OnClick = btnEliminarRtaClick
    end
  end
  object dbgDetalleRespuesta: TRxDBGrid
    Left = 9
    Top = 183
    Width = 446
    Height = 77
    Anchors = [akLeft, akRight, akBottom]
    DataSource = dsRespuestas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Fecha'
        Title.Caption = 'Fecha Rta.'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Usuario'
        Title.Caption = 'Usuario Rta.'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Respuesta'
        Width = 313
        Visible = True
      end>
  end
  object fpAltaRespuesta: TFormPanel
    Left = 163
    Top = 133
    Width = 382
    Height = 172
    Caption = 'Ingresar Respuesta'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      382
      172)
    object Bevel5: TBevel
      Left = 4
      Top = 136
      Width = 374
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnCancelar: TButton
      Left = 302
      Top = 142
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    object gbRespuesta: TJvgGroupBox
      Left = 6
      Top = 6
      Width = 372
      Height = 25
      Caption = 'Respuesta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionAlignment = fcaWidth
      CaptionBorder.Inner = bvRaised
      CaptionBorder.Outer = bvSpace
      CaptionBorder.Bold = False
      CaptionGradient.FromColor = 10461087
      CaptionGradient.ToColor = clSilver
      CaptionGradient.Active = True
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      CaptionTextStyle = fstVolumetric
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 2
      FullHeight = 59
    end
    object edRespuestaAlta: TMemo
      Left = 6
      Top = 28
      Width = 370
      Height = 101
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
    end
    object btnAceptar: TButton
      Left = 220
      Top = 142
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnAceptarClick
    end
  end
  object edRespuesta: TDBMemo
    Left = 9
    Top = 261
    Width = 448
    Height = 46
    Anchors = [akLeft, akRight, akBottom]
    Color = 16051436
    DataField = 'Respuesta'
    DataSource = dsRespuestas
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object pcNota: TJvPageControl
    Left = 3
    Top = 1
    Width = 455
    Height = 58
    ActivePage = tbNotaActual
    Anchors = [akLeft, akTop, akRight]
    MultiLine = True
    TabOrder = 0
    TabPosition = tpRight
    object tbNotaActual: TTabSheet
      Caption = 'Nota'
      DesignSize = (
        409
        50)
      object lblEmpleados: TLabel
        Left = 0
        Top = 3
        Width = 57
        Height = 15
        AutoSize = False
        Caption = 'Empleados:'
        WordWrap = True
      end
      object lblMasaSalarial: TLabel
        Left = 157
        Top = 3
        Width = 67
        Height = 17
        AutoSize = False
        Caption = 'Masa Salarial:'
        WordWrap = True
      end
      object lblFechaPresentacion: TLabel
        Left = 0
        Top = 27
        Width = 60
        Height = 13
        Caption = 'Fecha Pres.:'
      end
      object Label4: TLabel
        Left = 157
        Top = 27
        Width = 70
        Height = 15
        AutoSize = False
        Caption = 'Tipo N'#243'mina:'
        WordWrap = True
      end
      object edEmpleados: TIntEdit
        Left = 62
        Top = 0
        Width = 89
        Height = 21
        TabOrder = 0
        Text = '0'
        Alignment = taRightJustify
        MaxLength = 6
        MaxValue = 999999
      end
      object edMasaSalarial: TCurrencyEdit
        Left = 225
        Top = 0
        Width = 80
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00 $;-,0.00 $'
        MaxLength = 12
        MaxValue = 999999999.000000000000000000
        TabOrder = 1
        ZeroEmpty = False
      end
      object edFechaPresentacion: TDateComboBox
        Left = 62
        Top = 23
        Width = 90
        Height = 21
        TabOrder = 2
      end
      inline fraTipoNomina: TfraCodigoDescripcionExt
        Left = 224
        Top = 22
        Width = 184
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        inherited cmbDescripcion: TArtComboBox
          Left = 32
          Width = 151
        end
        inherited edCodigo: TPatternEdit
          Width = 28
        end
      end
    end
    object tbNotaHistorica: TTabSheet
      Caption = 'Historica'
      ImageIndex = 1
      object lblTipoFormularioMultiperiodo: TLabel
        Left = 1
        Top = 6
        Width = 75
        Height = 13
        Caption = 'Tipo Formulario:'
      end
      object Label2: TLabel
        Left = 1
        Top = 29
        Width = 36
        Height = 13
        Caption = 'Estado:'
      end
      object Label3: TLabel
        Left = 152
        Top = 29
        Width = 46
        Height = 13
        Caption = 'Derivado:'
      end
      inline fraTipoFormulario: TfraCodigoDescripcionExt
        Left = 81
        Top = 2
        Width = 299
        Height = 23
        TabOrder = 0
        DesignSize = (
          299
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 234
        end
      end
      object edEstadoHist: TEdit
        Left = 82
        Top = 26
        Width = 60
        Height = 21
        TabOrder = 1
      end
      object edDerivado: TEdit
        Left = 200
        Top = 26
        Width = 176
        Height = 21
        TabOrder = 2
      end
    end
  end
  object dsRespuestas: TDataSource
    DataSet = cdsRespuestas
    Left = 267
    Top = 155
  end
  object cdsRespuestas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Fecha'
        DataType = ftDateTime
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Respuesta'
        DataType = ftString
        Size = 4000
      end
      item
        Name = 'Id'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 239
    Top = 155
  end
end
