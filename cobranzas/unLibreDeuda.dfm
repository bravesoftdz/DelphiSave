inherited frmLibreDeuda: TfrmLibreDeuda
  Left = 19
  Top = 79
  Width = 665
  Height = 400
  Caption = 'Libre Deuda'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 665
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 657
    Height = 90
    DesignSize = (
      657
      90)
    object gbContrato: TGroupBox
      Left = 1
      Top = 1
      Width = 654
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Contrato '
      TabOrder = 0
      DesignSize = (
        654
        43)
      inline fraEmpresa: TfraEmpresa
        Left = 8
        Top = 16
        Width = 638
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        DesignSize = (
          638
          21)
        inherited lbContrato: TLabel
          Left = 534
        end
        inherited edContrato: TIntEdit
          Left = 581
        end
        inherited cmbRSocial: TArtComboBox
          Width = 399
        end
      end
    end
    object gbFechaAlta: TGroupBox
      Left = 1
      Top = 44
      Width = 267
      Height = 43
      Caption = 'Fecha de Carga'
      TabOrder = 1
      object Label6: TLabel
        Left = 8
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object Label15: TLabel
        Left = 138
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFAltaDesde: TDateComboBox
        Left = 44
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edFAltaHasta
        TabOrder = 0
      end
      object edFAltaHasta: TDateComboBox
        Left = 171
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edFAltaDesde
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 90
    Width = 657
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 653
      end>
    inherited ToolBar: TToolBar
      Width = 640
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbVerReportes: TToolButton
        Left = 370
        Top = 0
        Hint = 'Ver Reportes'
        DropdownMenu = mnuVerReportes
        ImageIndex = 9
        Style = tbsDropDown
      end
      object ToolButton1: TToolButton
        Left = 408
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 38
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 416
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 439
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 447
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 119
    Width = 657
    Height = 231
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 219
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRESTADOAF'
        Title.Caption = 'Estado Afil.'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRESTADO'
        Title.Caption = 'Estado'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 310
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. de Alta'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTA'
        Title.Caption = 'Usuario de Alta'
        Width = 151
        Visible = True
      end>
  end
  object pnlTotalRegistros: TPanel [3]
    Left = 0
    Top = 350
    Width = 657
    Height = 23
    Align = alBottom
    Alignment = taRightJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Total                     '
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    DesignSize = (
      657
      23)
    object edTotalRegistros: TCardinalEdit
      Left = 602
      Top = 2
      Width = 52
      Height = 19
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT LD_CONTRATO CONTRATO, TB_DESCRIPCION DESCRESTADO, LD_USUA' +
        'LTA USUALTA, LD_FECHAALTA FECHAALTA'
      '  FROM CTB_TABLAS, ZLD_LIBREDEUDA'
      ' WHERE TB_CLAVE='#39'LDEUD'#39
      '   AND TB_CODIGO=LD_ESTADO'
      '   AND 1=2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
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
        Key = 16470
        LinkControl = tbVerReportes
      end>
    Left = 120
    Top = 200
  end
  object mnuVerReportes: TPopupMenu
    Left = 188
    Top = 204
    object mnuVerLibreDeuda: TMenuItem
      Caption = 'Ver Libre Deuda'
      OnClick = mnuVerLibreDeudaClick
    end
    object mnuVerEstadoCuenta: TMenuItem
      Caption = 'Ver Estado de Cuenta asociado'
      OnClick = mnuVerEstadoCuentaClick
    end
  end
end
