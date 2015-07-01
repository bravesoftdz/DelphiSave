inherited frmManAMS_MOVIMIENTOSTOCK: TfrmManAMS_MOVIMIENTOSTOCK
  Left = 698
  Top = 258
  Caption = 'Administraci'#243'n de Stock de Materiales'
  ClientHeight = 611
  ClientWidth = 825
  ExplicitWidth = 833
  ExplicitHeight = 641
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 825
    Height = 133
    Visible = True
    ExplicitWidth = 825
    ExplicitHeight = 133
    object Panel7: TPanel
      Left = 547
      Top = 88
      Width = 274
      Height = 37
      Anchors = [akTop, akRight]
      Caption = 'Panel7'
      TabOrder = 0
      object rbAlta: TRadioButton
        Left = 4
        Top = 1
        Width = 113
        Height = 17
        Caption = 'Alta'
        TabOrder = 0
      end
      object rbAjuste: TRadioButton
        Left = 4
        Top = 16
        Width = 113
        Height = 17
        Caption = 'Ajuste'
        TabOrder = 1
      end
      object rbMovimiento: TRadioButton
        Left = 68
        Top = 1
        Width = 113
        Height = 17
        Caption = 'Movimiento'
        TabOrder = 2
      end
      object rbEntrega: TRadioButton
        Left = 156
        Top = 1
        Width = 105
        Height = 17
        Caption = 'Entrega Clientes'
        TabOrder = 3
      end
      object rbDevolucion: TRadioButton
        Left = 68
        Top = 16
        Width = 85
        Height = 17
        Caption = 'Devolucion'
        TabOrder = 4
      end
      object rbEntregaInterno: TRadioButton
        Left = 156
        Top = 17
        Width = 101
        Height = 17
        Caption = 'Entrega'
        TabOrder = 5
      end
    end
    object GroupBox1: TGroupBox
      Left = 547
      Top = 0
      Width = 276
      Height = 45
      Anchors = [akTop, akRight]
      Caption = 'Fecha Imp.'
      TabOrder = 1
      object Label18: TLabel
        Left = 101
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edImpresionDesde: TDateComboBox
        Left = 4
        Top = 16
        Width = 89
        Height = 21
        TabOrder = 0
      end
      object edImpresionHasta: TDateComboBox
        Left = 136
        Top = 16
        Width = 89
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 547
      Top = 43
      Width = 277
      Height = 41
      Anchors = [akTop, akRight]
      TabOrder = 2
      object Label17: TLabel
        Left = 4
        Top = 16
        Width = 39
        Height = 13
        Caption = 'ID Carta'
      end
      object Label12: TLabel
        Left = 135
        Top = 16
        Width = 47
        Height = 13
        Caption = 'Con Carta'
      end
      object edCarta: TIntEdit
        Left = 46
        Top = 12
        Width = 74
        Height = 21
        TabOrder = 0
      end
      object cboxConCarta: TComboBox
        Left = 185
        Top = 13
        Width = 85
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        Items.Strings = (
          'S'#237
          'No'
          '')
      end
    end
    object GroupBox3: TGroupBox
      Left = 4
      Top = 0
      Width = 542
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        542
        45)
      object Label16: TLabel
        Left = 4
        Top = 18
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaFiltro: TfraEmpresaSolicitud
        Left = 29
        Top = 14
        Width = 509
        Height = 23
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
        ExplicitLeft = 29
        ExplicitTop = 14
        ExplicitWidth = 509
        inherited lbContrato: TLabel
          Left = 274
          ExplicitLeft = 274
        end
        inherited lbFormulario: TLabel
          Left = 381
          Width = 50
          Font.Name = 'Tahoma'
          ExplicitLeft = 381
          ExplicitWidth = 50
        end
        inherited edContrato: TIntEdit
          Left = 319
          ExplicitLeft = 319
        end
        inherited cmbRSocial: TArtComboBox
          Width = 140
          DataSource = nil
          ExplicitWidth = 140
        end
        inherited edFormulario: TPatternEdit
          Left = 433
          Width = 72
          ExplicitLeft = 433
          ExplicitWidth = 72
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 44
      Width = 541
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      DesignSize = (
        541
        41)
      object Label14: TLabel
        Left = 8
        Top = 16
        Width = 42
        Height = 13
        Caption = 'Dep'#243'sito'
      end
      inline fraDepositoFiltro: TfraCodigoDescripcion
        Left = 61
        Top = 12
        Width = 468
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 61
        ExplicitTop = 12
        ExplicitWidth = 468
        inherited cmbDescripcion: TArtComboBox
          Width = 401
          ExplicitWidth = 401
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 4
      Top = 84
      Width = 541
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DesignSize = (
        541
        41)
      object Label15: TLabel
        Left = 8
        Top = 16
        Width = 37
        Height = 13
        Caption = 'Material'
      end
      inline fraMaterialFiltro: TfraCodigoDescripcion
        Left = 60
        Top = 12
        Width = 465
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 60
        ExplicitTop = 12
        ExplicitWidth = 465
        inherited cmbDescripcion: TArtComboBox
          Width = 401
          ExplicitWidth = 401
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 133
    Width = 825
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 819
      end>
    ExplicitTop = 133
    ExplicitWidth = 825
    inherited ToolBar: TToolBar
      Width = 812
      ExplicitWidth = 812
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 162
    Width = 825
    Height = 449
    Columns = <
      item
        Expanded = False
        FieldName = 'ms_id'
        Title.Caption = 'Id.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ms_idcarta'
        Title.Caption = 'ID Carta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_fechaimpresion'
        Title.Caption = 'Fecha Imp.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'materiales'
        Title.Caption = 'Material'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'co_contrato'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fo_formulario'
        Title.Caption = 'Nro. Formulario'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'empresa'
        Title.Caption = 'Empresa'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cantidad'
        Title.Caption = 'Cantidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cantparcial'
        Title.Caption = 'Cantidad Parcial'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ms_motivo'
        Title.Caption = 'Motivo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'de_descripcion'
        Title.Caption = 'Dep'#243'sito'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ms_usualta'
        Title.Caption = 'Usu. Alta'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ms_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ms_usumodif'
        Title.Caption = 'Usu. Modif.'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ms_fechamodif'
        Title.Caption = 'Fecha Modif.'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ms_usubaja'
        Title.Caption = 'Usu. Baja'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ms_fechabaja'
        Title.Caption = 'Fecha Baja'
        Width = 77
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 90
    Top = 291
    Width = 669
    Height = 289
    OnShow = fpAbmShow
    ExplicitLeft = 90
    ExplicitTop = 291
    ExplicitWidth = 669
    ExplicitHeight = 289
    inherited BevelAbm: TBevel
      Top = 253
      Width = 661
      ExplicitTop = 253
      ExplicitWidth = 661
    end
    inherited btnAceptar: TButton
      Left = 511
      Top = 259
      TabOrder = 4
      ExplicitLeft = 511
      ExplicitTop = 259
    end
    inherited btnCancelar: TButton
      Left = 589
      Top = 259
      TabOrder = 5
      ExplicitLeft = 589
      ExplicitTop = 259
    end
    object pnl1: TPanel
      Left = 0
      Top = 0
      Width = 669
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnl1'
      TabOrder = 0
      DesignSize = (
        669
        81)
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 42
        Height = 13
        Caption = 'Dep'#243'sito'
      end
      object Label2: TLabel
        Left = 8
        Top = 40
        Width = 37
        Height = 13
        Caption = 'Material'
      end
      object Label3: TLabel
        Left = 8
        Top = 64
        Width = 42
        Height = 13
        Caption = 'Cantidad'
      end
      inline fraDeposito: TfraCodigoDescripcion
        Left = 72
        Top = 12
        Width = 589
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 72
        ExplicitTop = 12
        ExplicitWidth = 589
        inherited cmbDescripcion: TArtComboBox
          Width = 524
          ExplicitWidth = 524
        end
      end
      inline fraMaterial: TfraCodigoDescripcion
        Left = 72
        Top = 36
        Width = 589
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 72
        ExplicitTop = 36
        ExplicitWidth = 589
        inherited cmbDescripcion: TArtComboBox
          Width = 524
          ExplicitWidth = 524
        end
      end
      object edCantidad: TIntEdit
        Left = 73
        Top = 60
        Width = 121
        Height = 21
        TabOrder = 2
      end
    end
    object pnl2: TPanel
      Left = 0
      Top = 81
      Width = 669
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnl2'
      TabOrder = 1
      DesignSize = (
        669
        24)
      object Label4: TLabel
        Left = 8
        Top = 4
        Width = 62
        Height = 13
        Caption = 'Dep. Destino'
      end
      inline fraDepositoDestino: TfraCodigoDescripcion
        Left = 72
        Top = 0
        Width = 589
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 72
        ExplicitWidth = 589
        inherited cmbDescripcion: TArtComboBox
          Width = 524
          ExplicitWidth = 524
        end
      end
    end
    object pnl3: TPanel
      Left = 0
      Top = 105
      Width = 669
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnl3'
      TabOrder = 2
      DesignSize = (
        669
        25)
      object Label5: TLabel
        Left = 8
        Top = 4
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaAlta: TfraEmpresaSolicitud
        Left = 73
        Top = 2
        Width = 588
        Height = 23
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
        ExplicitLeft = 73
        ExplicitTop = 2
        ExplicitWidth = 588
        inherited lbContrato: TLabel
          Left = 353
          ExplicitLeft = 353
        end
        inherited lbFormulario: TLabel
          Left = 460
          Width = 50
          Font.Name = 'Tahoma'
          ExplicitLeft = 460
          ExplicitWidth = 50
        end
        inherited edContrato: TIntEdit
          Left = 398
          ExplicitLeft = 398
        end
        inherited cmbRSocial: TArtComboBox
          Width = 219
          DataSource = nil
          ExplicitWidth = 219
        end
        inherited edFormulario: TPatternEdit
          Left = 512
          Width = 72
          ExplicitLeft = 512
          ExplicitWidth = 72
        end
      end
    end
    object pnl4: TPanel
      Left = 0
      Top = 130
      Width = 669
      Height = 107
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnl4'
      TabOrder = 3
      DesignSize = (
        669
        107)
      object Label6: TLabel
        Left = 0
        Top = 0
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object edObservaciones: TMemo
        Left = 73
        Top = 0
        Width = 581
        Height = 101
        Anchors = [akLeft, akTop, akRight]
        Lines.Strings = (
          'edObservaciones')
        TabOrder = 0
      end
    end
  end
  object fpABMEntrega: TFormPanel [4]
    Left = 198
    Top = 230
    Width = 600
    Height = 373
    Caption = 'Entrega de Materiales'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    Position = poOwnerFormCenter
    OnShow = fpABMEntregaShow
    Constraints.MinHeight = 370
    Constraints.MinWidth = 600
    DesignSize = (
      600
      373)
    object Bevel1: TBevel
      Left = 4
      Top = 338
      Width = 592
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarEntregar: TButton
      Left = 426
      Top = 344
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 3
      OnClick = btnAceptarEntregarClick
    end
    object Button2: TButton
      Left = 504
      Top = 344
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 600
      Height = 55
      Align = alTop
      TabOrder = 0
      DesignSize = (
        600
        55)
      object lbCuit: TLabel
        Left = 8
        Top = 12
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      object Label8: TLabel
        Left = 8
        Top = 36
        Width = 42
        Height = 13
        Caption = 'Dep'#243'sito'
      end
      inline fraDepositoEntrega: TfraCodigoDescripcion
        Left = 51
        Top = 29
        Width = 534
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraDepositoEntregaExit
        ExplicitLeft = 51
        ExplicitTop = 29
        ExplicitWidth = 534
        inherited cmbDescripcion: TArtComboBox
          Width = 469
          ExplicitWidth = 469
        end
      end
      inline fraEmpresaEntrega: TfraEmpresaSolicitud
        Left = 52
        Top = 6
        Width = 536
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ExplicitLeft = 52
        ExplicitTop = 6
        ExplicitWidth = 536
        inherited lbContrato: TLabel
          Left = 301
          ExplicitLeft = 301
        end
        inherited lbFormulario: TLabel
          Left = 408
          Width = 50
          Font.Name = 'Tahoma'
          ExplicitLeft = 408
          ExplicitWidth = 50
        end
        inherited edContrato: TIntEdit
          Left = 346
          ExplicitLeft = 346
        end
        inherited cmbRSocial: TArtComboBox
          Width = 167
          DataSource = nil
          ExplicitWidth = 167
        end
        inherited edFormulario: TPatternEdit
          Left = 460
          Width = 72
          ExplicitLeft = 460
          ExplicitWidth = 72
        end
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 55
      Width = 600
      Height = 206
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Panel5'
      TabOrder = 1
      DesignSize = (
        600
        206)
      object GridMateriales: TAdvStringGrid
        Left = 19
        Top = 3
        Width = 568
        Height = 191
        Cursor = crDefault
        Anchors = [akLeft, akTop, akRight, akBottom]
        DrawingStyle = gdsClassic
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnExit = GridMaterialesExit
        OnSelectCell = GridMaterialesSelectCell
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'Tahoma'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDownClear = '(All)'
        FixedRowHeight = 22
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        Look = glClassic
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.Color = clBtnFace
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurence'
        SearchFooter.HintFindPrev = 'Find previous occurence'
        SearchFooter.HintHighlight = 'Highlight occurences'
        SearchFooter.MatchCaseCaption = 'Match case'
        SelectionColor = clHighlight
        SelectionTextColor = clHighlightText
        Version = '5.8.7.0'
        ColWidths = (
          64
          63
          300
          64
          64)
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 261
      Width = 600
      Height = 24
      Align = alTop
      Anchors = [akLeft, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 2
      object Label11: TLabel
        Left = 57
        Top = 7
        Width = 33
        Height = 13
        AutoSize = False
        Caption = 'C&orreo'
      end
      inline fraCtbTablasCorreo: TfraStaticCTB_TABLAS
        Left = 92
        Top = 2
        Width = 493
        Height = 24
        TabOrder = 0
        OnExit = fraCtbTablasCorreoExit
        ExplicitLeft = 92
        ExplicitTop = 2
        ExplicitWidth = 493
        ExplicitHeight = 24
        DesignSize = (
          493
          24)
        inherited cmbDescripcion: TComboGrid
          Width = 429
          ExplicitWidth = 429
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
    end
    object Panel8: TPanel
      Left = 0
      Top = 285
      Width = 600
      Height = 52
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      DesignSize = (
        600
        52)
      object Label7: TLabel
        Left = 7
        Top = 4
        Width = 81
        Height = 13
        Caption = 'Entrega en mano'
      end
      object Label9: TLabel
        Left = 459
        Top = 6
        Width = 26
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'S.I.C.'
      end
      object Label10: TLabel
        Left = 48
        Top = 29
        Width = 40
        Height = 13
        Caption = 'Firmante'
      end
      inline fraEntregaEnMano: TfraUsuarios
        Left = 92
        Top = 1
        Width = 361
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraEntregaEnManoExit
        ExplicitLeft = 92
        ExplicitTop = 1
        ExplicitWidth = 361
        inherited cmbDescripcion: TArtComboBox
          Width = 268
          ExplicitWidth = 268
        end
      end
      object edSIC: TIntEdit
        Left = 490
        Top = 4
        Width = 93
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 1
        AutoExit = True
        MaxLength = 8
      end
      inline fraFirmante: TfraStaticCodigoDescripcion
        Left = 92
        Top = 24
        Width = 492
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        OnEnter = fraFirmanteEnter
        ExplicitLeft = 92
        ExplicitTop = 24
        ExplicitWidth = 492
        ExplicitHeight = 24
        inherited cmbDescripcion: TComboGrid
          Width = 429
          ExplicitWidth = 429
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
    end
  end
  inherited FormStorage: TFormStorage
    Left = 56
    Top = 224
  end
  inherited ShortCutControl: TShortCutControl
    Left = 16
    Top = 316
  end
end
