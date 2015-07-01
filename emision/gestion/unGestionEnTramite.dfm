object frmGestionEnTramite: TfrmGestionEnTramite
  Left = 12
  Top = 102
  Width = 755
  Height = 447
  ActiveControl = lblAntecedentes
  Caption = 'Gesti'#243'n en Tr'#225'mite'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    747
    420)
  PixelsPerInch = 96
  TextHeight = 13
  object JvWizard: TJvWizard
    Left = 0
    Top = 0
    Width = 747
    Height = 420
    ActivePage = pgSeleccionarGestion
    ButtonBarHeight = 42
    ButtonStart.Caption = 'To &Start Page'
    ButtonStart.NumGlyphs = 1
    ButtonStart.Width = 85
    ButtonLast.Caption = 'To &Last Page'
    ButtonLast.NumGlyphs = 1
    ButtonLast.Width = 85
    ButtonBack.Caption = '< &Atr'#225's'
    ButtonBack.NumGlyphs = 1
    ButtonBack.Width = 75
    ButtonNext.Caption = '&Siguiente >'
    ButtonNext.NumGlyphs = 1
    ButtonNext.Width = 75
    ButtonFinish.Caption = '&Finalizar'
    ButtonFinish.NumGlyphs = 1
    ButtonFinish.Width = 75
    ButtonCancel.Caption = 'Can&celar'
    ButtonCancel.NumGlyphs = 1
    ButtonCancel.ModalResult = 2
    ButtonCancel.Width = 75
    ButtonHelp.Caption = '&Help'
    ButtonHelp.NumGlyphs = 1
    ButtonHelp.Width = 75
    ShowRouteMap = True
    OnFinishButtonClick = JvWizardFinishButtonClick
    OnCancelButtonClick = JvWizardCancelButtonClick
    OnActivePageChanging = JvWizardActivePageChanging
    DesignSize = (
      747
      420)
    object pgSeleccionarGestion: TJvWizardInteriorPage
      Header.Visible = False
      Header.Title.Color = clNone
      Header.Title.Visible = False
      Header.Title.Text = 'Title'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Visible = False
      Header.Subtitle.Text = 'Subtitle'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -11
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      Panel.Visible = False
      EnabledButtons = [bkNext, bkCancel]
      VisibleButtons = [bkNext, bkCancel]
      Caption = 'Seleccionar Gesti'#243'n'
      DesignSize = (
        602
        378)
      object gbSalidas: TGroupBox
        Left = 9
        Top = 117
        Width = 589
        Height = 116
        Anchors = [akLeft, akTop, akRight]
        Caption = '         Salida por Gestionable'
        TabOrder = 1
        DesignSize = (
          589
          116)
        object btnDefinirParametros: TSpeedButton
          Left = 5
          Top = 0
          Width = 20
          Height = 15
          Anchors = [akTop, akRight]
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00FF000000
            0000FF00FF0000000000FF00FF00FF00FF00FF00FF000000000000000000FF00
            FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF0000000000FF00
            FF0000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF000000
            0000FF00FF00FF00FF00FF00FF0000000000FF00FF000000000000000000FF00
            FF0000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF000000
            0000FF00FF00FF00FF00FF00FF0000000000FF00FF000000000000000000FF00
            FF0000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF000000
            0000FF00FF00FF00FF00FF00FF0000000000FF00FF000000000000000000FF00
            FF0000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF000000
            0000FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF000000
            0000FF00FF0000000000FF00FF00FF00FF00FF00FF000000000000000000FF00
            FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00
            FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Margin = 0
          OnClick = btnDefinirParametrosClick
        end
        object chkSalidas: TARTCheckListBox
          Left = 7
          Top = 16
          Width = 575
          Height = 94
          OnClickCheck = chkSalidasClickCheck
          Anchors = [akLeft, akTop, akRight, akBottom]
          Columns = 2
          ItemHeight = 13
          TabOrder = 0
          AutoAjustarColumnas = True
          Locked = False
        end
      end
      object gbAntecedentes: TGroupBox
        Left = 9
        Top = 235
        Width = 589
        Height = 137
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Antecedentes'
        TabOrder = 0
        DesignSize = (
          589
          137)
        object lblAntecedentes: TListBox
          Left = 7
          Top = 16
          Width = 575
          Height = 113
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = 14548991
          ExtendedSelect = False
          ItemHeight = 13
          TabOrder = 0
        end
      end
    end
    object pgFinalizarGestion: TJvWizardInteriorPage
      Header.Visible = False
      Header.Title.Color = clNone
      Header.Title.Visible = False
      Header.Title.Text = 'Title'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Visible = False
      Header.Subtitle.Text = 'Subtitle'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -11
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      Panel.Visible = False
      EnabledButtons = [bkBack, bkFinish, bkCancel]
      VisibleButtons = [bkBack, bkFinish, bkCancel]
      Caption = 'Finalizar Gesti'#243'n'
      DesignSize = (
        602
        378)
      object pcDetalleGestion: TJvPageControl
        Left = 9
        Top = 117
        Width = 589
        Height = 149
        ActivePage = tbDemo
        Anchors = [akLeft, akTop, akRight, akBottom]
        MultiLine = True
        TabOrder = 0
        TabPosition = tpBottom
        object tbDemo: TTabSheet
          Caption = 'Demo'
        end
      end
      object CoolBar: TCoolBar
        Left = 10
        Top = 268
        Width = 588
        Height = 31
        Align = alNone
        Anchors = [akLeft, akRight, akBottom]
        Bands = <
          item
            Control = ToolBar
            ImageIndex = -1
            MinHeight = 27
            Width = 584
          end>
        object ToolBar: TToolBar
          Left = 9
          Top = 0
          Width = 571
          Height = 27
          BorderWidth = 1
          ButtonWidth = 25
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = frmPrincipal.ilByN
          Images = frmPrincipal.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbNuevo: TToolButton
            Left = 0
            Top = 0
            Hint = 'Realizar Gesti'#243'n (Ctrl+R)'
            ImageIndex = 6
            OnClick = tbNuevoClick
          end
          object tbModificar: TToolButton
            Left = 25
            Top = 0
            Hint = 'Gesti'#243'n Individual (Ctrl+G)'
            ImageIndex = 7
            Visible = False
          end
          object tbEliminar: TToolButton
            Left = 50
            Top = 0
            Hint = 'Eliminar (Ctrl+Del)'
            ImageIndex = 8
            OnClick = tbEliminarClick
          end
          object ToolButton4: TToolButton
            Left = 75
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
            Visible = False
          end
          object ToolButton3: TToolButton
            Left = 83
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 11
            Style = tbsSeparator
          end
          object tbAplicarRegistro: TToolButton
            Left = 91
            Top = 0
            Hint = 'Aplicar Resultado al Registro'
            Caption = 'tbAplicarRegistro'
            Enabled = False
            ImageIndex = 27
            OnClick = tbAplicarRegistroClick
          end
          object tbAplicarGrilla: TToolButton
            Left = 116
            Top = 0
            Hint = 'Aplicar Resultado a toda la Grilla'
            Caption = 'tbAplicarGrilla'
            Enabled = False
            ImageIndex = 44
            OnClick = tbAplicarGrillaClick
          end
          object tbAplicarGestion: TToolButton
            Left = 141
            Top = 0
            Hint = 'Aplicar Resultado a toda la Gesti'#243'n'
            Caption = 'tbAplicarGestion'
            Enabled = False
            ImageIndex = 47
            OnClick = tbAplicarGestionClick
          end
          object tbLimpiar: TToolButton
            Left = 166
            Top = 0
            Hint = 'Limpiar (Ctrl+L)'
            Enabled = False
            ImageIndex = 1
            OnClick = tbLimpiarClick
          end
          object ToolButton1: TToolButton
            Left = 191
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 27
            Style = tbsSeparator
          end
          object tbContacto: TToolButton
            Left = 199
            Top = 0
            Hint = 'Contactos'
            Caption = 'tbContacto'
            ImageIndex = 26
            OnClick = tbContactoClick
          end
        end
      end
      object GroupBox1: TGroupBox
        Left = 9
        Top = 298
        Width = 589
        Height = 77
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Resultado'
        TabOrder = 2
        DesignSize = (
          589
          77)
        object lblContacto: TLabel
          Left = 347
          Top = 18
          Width = 44
          Height = 13
          Caption = 'Contacto'
        end
        inline fraResultado: TfraCodigoDescripcion
          Left = 4
          Top = 13
          Width = 343
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          inherited cmbDescripcion: TArtComboBox
            Left = 55
            Width = 285
            DataSource = nil
          end
          inherited edCodigo: TPatternEdit
            Width = 51
          end
        end
        object edObservacion: TMemo
          Left = 5
          Top = 39
          Width = 578
          Height = 32
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        inline fraContactoSelected: TfraCodigoDescripcion
          Left = 392
          Top = 13
          Width = 192
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          inherited cmbDescripcion: TArtComboBox
            Left = 0
            Width = 192
            CharCase = ecUpperCase
            OnChange = fraContactoSelectedcmbDescripcionChange
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Title.Caption = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRIPCION'
                Title.Caption = 'Descripci'#243'n'
                Width = 300
                Visible = True
              end>
            DataSource = nil
          end
          inherited edCodigo: TPatternEdit
            Left = -70
            Visible = False
          end
        end
      end
    end
    object JvWizardRouteMapList: TJvWizardRouteMapList
      Left = 0
      Top = 0
      Width = 145
      Height = 378
      Cursor = crHandPoint
      ActiveFont.Charset = DEFAULT_CHARSET
      ActiveFont.Color = clWindowText
      ActiveFont.Height = -11
      ActiveFont.Name = 'Tahoma'
      ActiveFont.Style = [fsBold]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clNavy
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = [fsUnderline]
      Rounded = True
    end
    object BarProgreso: TJvProgressBar
      Left = 10
      Top = 71
      Width = 125
      Height = 16
      Position = 50
      Step = 1
      TabOrder = 10
      Visible = False
    end
  end
  object gbItemsGestionables: TGroupBox
    Left = 154
    Top = 2
    Width = 589
    Height = 113
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Gestionables'
    TabOrder = 1
    DesignSize = (
      589
      113)
    object chkGestionables: TARTCheckListBox
      Left = 7
      Top = 16
      Width = 575
      Height = 91
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = 1
      ItemHeight = 13
      TabOrder = 0
      OnClick = chkGestionablesClick
      AutoAjustarColumnas = True
      Locked = False
    end
  end
  object fpMailSalida: TFormPanel
    Left = -4
    Top = 138
    Width = 181
    Height = 102
    Caption = 'Definici'#243'n de Par'#225'metros'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      181
      102)
    object btnAceptarMailContacto: TButton
      Left = 15
      Top = 69
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnAceptarMailContactoClick
    end
    object btnCancelarMailContacto: TButton
      Left = 98
      Top = 69
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    object chkMailContrato: TCheckBox
      Left = 33
      Top = 12
      Width = 119
      Height = 17
      Caption = 'Email del Contrato'
      TabOrder = 0
    end
    object chkMailEmision: TCheckBox
      Left = 33
      Top = 40
      Width = 111
      Height = 17
      Caption = 'Emails de Emisi'#243'n'
      TabOrder = 1
    end
  end
  object fpOpcionesImpresion: TFormPanel
    Left = 306
    Top = 47
    Width = 257
    Height = 133
    Caption = 'Opciones de Impresi'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu, biMaximize]
    BorderStyle = bsDialog
    Position = poScreenCenter
    Constraints.MaxWidth = 257
    Constraints.MinHeight = 107
    Constraints.MinWidth = 257
    DesignSize = (
      257
      133)
    object Bevel2: TBevel
      Left = 4
      Top = 97
      Width = 249
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label7: TLabel
      Left = 30
      Top = 50
      Width = 93
      Height = 13
      Caption = 'Cantidad de Copias'
    end
    object Label8: TLabel
      Left = 12
      Top = 74
      Width = 49
      Height = 13
      Caption = 'Impresora'
    end
    object btnAceptarImpresion: TButton
      Left = 98
      Top = 103
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnAceptarImpresionClick
    end
    object btnCancelarImpresion: TButton
      Left = 177
      Top = 103
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object rbPreview: TRadioButton
      Left = 6
      Top = 6
      Width = 113
      Height = 17
      Caption = 'Mostrar el Preview'
      TabOrder = 2
    end
    object rbImprimir: TRadioButton
      Left = 6
      Top = 28
      Width = 131
      Height = 17
      Caption = 'Imprimir Directamente'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object edCantCopias: TIntEdit
      Left = 128
      Top = 46
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '1'
      MinValue = 1
      Value = 1
    end
    object cmbImpresoras: TComboBox
      Left = 62
      Top = 70
      Width = 187
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
    end
  end
  object fpParametros: TFormPanel
    Left = 190
    Top = 194
    Width = 401
    Height = 178
    Caption = 'Definici'#243'n de Par'#225'metros'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      401
      178)
    object btnAceptarParametro: TButton
      Left = 235
      Top = 145
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object btnCancelarParametro: TButton
      Left = 318
      Top = 145
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object ParamList: TValueListEditor
      Left = 8
      Top = 8
      Width = 384
      Height = 131
      Anchors = [akLeft, akTop, akRight, akBottom]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
      TabOrder = 2
      TitleCaptions.Strings = (
        'Par'#225'metro'
        'Valor')
      ColWidths = (
        170
        208)
    end
    object btnPegar: TButton
      Left = 152
      Top = 145
      Width = 75
      Height = 25
      Caption = 'Pegar'
      TabOrder = 3
      OnClick = btnPegarClick
    end
  end
  object folderDialog: TFolderDialog
    Title = 'Seleccione la carpeta donde desea guardar los archivos PDF'
    Directory = 'E:\'
    DialogX = 0
    DialogY = 0
    Version = '1.1.0.0'
    Left = 516
    Top = 260
  end
end
