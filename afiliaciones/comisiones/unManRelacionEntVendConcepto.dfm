inherited frmManRelacionEntVendConcepto: TfrmManRelacionEntVendConcepto
  Left = 151
  Top = 166
  Width = 650
  Height = 450
  Caption = 'Mantenimiento de Relaciones Entidad-Vendedor-Conceptos'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 650
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 642
    Height = 11
  end
  inherited CoolBar: TCoolBar
    Top = 11
    Width = 642
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 638
      end>
    inherited ToolBar: TToolBar
      Width = 625
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbCerrar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Cerrar'
        ImageIndex = 16
        OnClick = tbCerrarClick
      end
      object tbAprobar: TToolButton
        Left = 393
        Top = 0
        Hint = 'Aprobar'
        ImageIndex = 13
        OnClick = tbAprobarClick
      end
      object ToolButton1: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 424
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 40
    Width = 642
    Height = 382
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCONCEPTO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Concepto'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 143
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIGENCIADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Desde'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIGENCIAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Hasta'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCPRIVADO'
        Title.Alignment = taCenter
        Title.Caption = 'Comisi'#243'n Sect. Priv.'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCPUBLICO'
        Title.Alignment = taCenter
        Title.Caption = 'Comisi'#243'n Sect. P'#250'bl.'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOFIJO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Fijo'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 51
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHACIERRE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Cierre'
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAAPROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobado'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTASDESCUENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Cuotas a Descontar'
        Width = 104
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAHASTADESCUENTO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Hasta Descuento'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 323
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 72
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 80
    Top = 88
    Width = 541
    Height = 257
    BorderStyle = bsDialog
    DesignSize = (
      541
      257)
    inherited BevelAbm: TBevel
      Top = 221
      Width = 533
    end
    object Label1: TLabel [1]
      Left = 14
      Top = 13
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Concepto'
    end
    object Label2: TLabel [2]
      Left = 11
      Top = 88
      Width = 115
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Comisi'#243'n Sector Privado'
    end
    object Label3: TLabel [3]
      Left = 364
      Top = 88
      Width = 114
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Comisi'#243'n Sector P'#250'blico'
    end
    object Label4: TLabel [4]
      Left = 14
      Top = 36
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vig. Desde'
    end
    object Label5: TLabel [5]
      Left = 389
      Top = 36
      Width = 49
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Vig. Hasta'
    end
    object Label6: TLabel [6]
      Left = 14
      Top = 63
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Monto Fijo'
    end
    object Label7: TLabel [7]
      Left = 11
      Top = 137
      Width = 79
      Height = 13
      AutoSize = False
      Caption = 'Observaciones'
    end
    object lbContrato: TLabel [8]
      Left = 188
      Top = 63
      Width = 95
      Height = 13
      Caption = 'Cuotas a Descontar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel [9]
      Left = 340
      Top = 63
      Width = 95
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F. Hasta Descuento'
    end
    inherited btnAceptar: TButton
      Left = 383
      Top = 227
      TabOrder = 10
    end
    inherited btnCancelar: TButton
      Left = 461
      Top = 227
      TabOrder = 11
    end
    inline fraVC_IDCONCEPTO: TfraStaticCodigoDescripcion
      Left = 89
      Top = 7
      Width = 442
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        442
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 379
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
    object edVC_PORCPUBLICO: TCurrencyEdit
      Left = 482
      Top = 84
      Width = 48
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      Anchors = [akTop, akRight]
      MaxLength = 10
      MaxValue = 100.000000000000000000
      TabOrder = 7
      ZeroEmpty = False
    end
    object edVC_PORCPRIVADO: TCurrencyEdit
      Left = 130
      Top = 84
      Width = 48
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      MaxValue = 100.000000000000000000
      TabOrder = 6
      ZeroEmpty = False
    end
    object edVC_VIGENCIADESDE: TDateComboBox
      Left = 90
      Top = 33
      Width = 88
      Height = 21
      MaxDateCombo = edVC_VIGENCIAHASTA
      TabOrder = 1
    end
    object edVC_VIGENCIAHASTA: TDateComboBox
      Left = 443
      Top = 33
      Width = 88
      Height = 21
      MinDateCombo = edVC_VIGENCIADESDE
      Anchors = [akTop, akRight]
      TabOrder = 2
      OnChange = DoCalcularFHastaDescuento
    end
    object edVC_MONTOFIJO: TCurrencyEdit
      Left = 90
      Top = 59
      Width = 88
      Height = 21
      AutoSize = False
      MaxLength = 15
      MaxValue = 99999999999.000000000000000000
      TabOrder = 3
    end
    inline fraVC_CONTRATO: TfraEmpresa
      Left = 7
      Top = 110
      Width = 524
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
      TabOrder = 8
      inherited lbContrato: TLabel
        Left = 420
      end
      inherited edContrato: TIntEdit
        Left = 467
      end
      inherited cmbRSocial: TArtComboBox
        Width = 285
      end
    end
    object edObservaciones: TMemo
      Left = 8
      Top = 152
      Width = 523
      Height = 63
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 255
      TabOrder = 9
    end
    object edVC_CUOTASDESCUENTO: TIntEdit
      Left = 289
      Top = 59
      Width = 43
      Height = 21
      Hint = 'N'#250'mero de Contrato'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnChange = DoCalcularFHastaDescuento
      MaxLength = 4
    end
    object edVC_FECHAHASTADESCUENTO: TDateComboBox
      Left = 443
      Top = 59
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
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
        LinkControl = tbSalir2
      end
      item
        Key = 16469
      end
      item
        Key = 16458
      end>
    Left = 110
    Top = 200
  end
end
