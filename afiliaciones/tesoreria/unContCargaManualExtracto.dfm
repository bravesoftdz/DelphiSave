inherited frmContCargaManualExtracto: TfrmContCargaManualExtracto
  Left = 208
  Top = 107
  Width = 635
  Height = 477
  Caption = 'Carga Manual de Extracto'
  Constraints.MinHeight = 477
  Constraints.MinWidth = 635
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 627
    Height = 74
    Visible = True
    object lbBanco: TLabel
      Left = 2
      Top = 7
      Width = 29
      Height = 13
      Caption = 'Banco'
    end
    object lbCuenta: TLabel
      Left = 2
      Top = 31
      Width = 35
      Height = 13
      Caption = 'Cuenta'
    end
    object Label1: TLabel
      Left = 2
      Top = 55
      Width = 29
      Height = 13
      Caption = 'Fecha'
    end
    object Label2: TLabel
      Left = 141
      Top = 55
      Width = 16
      Height = 13
      Caption = '>>'
    end
    inline fraBanco: TfraStaticCodigoDescripcion
      Left = 48
      Top = 1
      Width = 576
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TComboGrid
        Width = 513
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
    inline fraCuentaBancaria: TfraStaticCodigoDescripcion
      Left = 48
      Top = 25
      Width = 576
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TComboGrid
        Width = 513
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
    object edFechaDesde: TDateComboBox
      Left = 49
      Top = 50
      Width = 88
      Height = 21
      MaxDateCombo = edFechaHasta
      TabOrder = 2
    end
    object edFechaHasta: TDateComboBox
      Left = 157
      Top = 50
      Width = 88
      Height = 21
      MinDateCombo = edFechaDesde
      TabOrder = 3
    end
  end
  inherited CoolBar: TCoolBar
    Top = 74
    Width = 627
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 623
      end>
    inherited ToolBar: TToolBar
      Width = 610
      inherited tbNuevo: TToolButton
        Enabled = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 9
        Visible = True
      end
      inherited ToolButton8: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 128
    Width = 627
    Height = 297
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'EB_FECHAMOVIMIENTO'
        Title.Caption = 'Fecha Movimiento'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_FECHAVALOR'
        Title.Caption = 'Fecha Valor'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_DEBITOCREDITO'
        Title.Caption = 'D'#233'bito / Cr'#233'dito'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_IMPORTE'
        Title.Caption = 'Importe'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_NROCOMP'
        Title.Caption = 'Nro.Comprobante'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_CODOPERACION'
        Title.Caption = 'Cod.Operaci'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_DESCRIPCION'
        Title.Caption = 'Tipo'
        Width = 65
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 168
    Height = 237
    OnEnter = fpAbmEnter
    inherited BevelAbm: TBevel
      Top = 201
    end
    object Label3: TLabel [1]
      Left = 16
      Top = 12
      Width = 86
      Height = 13
      Caption = 'Fecha Movimiento'
    end
    object Label4: TLabel [2]
      Left = 16
      Top = 40
      Width = 56
      Height = 13
      Caption = 'Fecha Valor'
    end
    object Label5: TLabel [3]
      Left = 16
      Top = 68
      Width = 76
      Height = 13
      Caption = 'D'#233'bito / Cr'#233'dito'
    end
    object Label6: TLabel [4]
      Left = 16
      Top = 96
      Width = 38
      Height = 13
      Caption = 'Importe'
    end
    object Label7: TLabel [5]
      Left = 16
      Top = 124
      Width = 120
      Height = 13
      Caption = 'N'#250'mero de Comprobante'
    end
    object Label8: TLabel [6]
      Left = 16
      Top = 152
      Width = 100
      Height = 13
      Caption = 'C'#243'digo de Operaci'#243'n'
    end
    object Label9: TLabel [7]
      Left = 16
      Top = 180
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 304
      Top = 207
      TabOrder = 9
    end
    inherited btnCancelar: TButton
      Top = 207
      TabOrder = 10
    end
    object edEB_FECHAMOVIMIENTO: TDateComboBox
      Left = 150
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 0
      OnChange = edEB_FECHAMOVIMIENTOChange
    end
    object edEB_FECHAVALOR: TDateComboBox
      Left = 150
      Top = 36
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edEB_DEBITOCREDITO: TComboBox
      Left = 150
      Top = 64
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'D'#233'bito'
        'Cr'#233'dito')
    end
    object edEB_IMPORTE: TCurrencyEdit
      Left = 150
      Top = 92
      Width = 89
      Height = 21
      AutoSize = False
      TabOrder = 3
    end
    object edEB_DESCRIPCION: TEdit
      Left = 150
      Top = 176
      Width = 295
      Height = 21
      AutoSize = False
      TabOrder = 7
    end
    object btnContinuar: TButton
      Left = 225
      Top = 207
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'C&ontinuar'
      Default = True
      TabOrder = 8
      OnClick = btnContinuarClick
    end
    inline fraOperaciones: TfraStaticCodigoDescripcion
      Left = 149
      Top = 147
      Width = 272
      Height = 23
      TabOrder = 6
      inherited cmbDescripcion: TComboGrid
        Width = 209
        OnDropDown = fraOperacionescmbDescripcionDropDown
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
    object ToolBar1: TToolBar
      Left = 420
      Top = 145
      Width = 33
      Height = 27
      Align = alNone
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      object ToolButton7: TToolButton
        Left = 0
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        ImageIndex = 6
        OnClick = ToolButton7Click
      end
    end
    object edEB_NROCOMP: TIntEdit
      Left = 150
      Top = 120
      Width = 51
      Height = 21
      AutoSize = False
      TabOrder = 4
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edEB_NROCOMP2: TIntEdit
      Left = 202
      Top = 120
      Width = 51
      Height = 21
      AutoSize = False
      TabOrder = 5
      Alignment = taRightJustify
      MaxLength = 0
    end
  end
  object pnlTotales: TPanel [4]
    Left = 0
    Top = 425
    Width = 627
    Height = 25
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object lbSaldoFinal: TLabel
      Left = 4
      Top = 4
      Width = 69
      Height = 16
      Caption = 'lbSaldoFinal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlArriba: TPanel [5]
    Left = 0
    Top = 103
    Width = 627
    Height = 25
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object lbSaldoInicial: TLabel
      Left = 4
      Top = 4
      Width = 75
      Height = 16
      Caption = 'lbSaldoInicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
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
