inherited frmCashFlow: TfrmCashFlow
  Width = 780
  Height = 500
  Caption = 'Cash Flow'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 780
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 772
    Height = 90
    DesignSize = (
      772
      90)
    object gbFecha: TGroupBox
      Left = 563
      Top = 1
      Width = 205
      Height = 43
      Anchors = [akTop, akRight]
      Caption = ' Fecha'
      TabOrder = 1
      object Label1: TLabel
        Left = 97
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFechaDesde: TDateComboBox
        Left = 7
        Top = 15
        Width = 88
        Height = 21
        MaxDateCombo = edFechaHasta
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 111
        Top = 15
        Width = 88
        Height = 21
        MinDateCombo = edFechaDesde
        TabOrder = 1
      end
    end
    object gbBanco: TGroupBox
      Left = 3
      Top = 1
      Width = 554
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Banco'
      TabOrder = 0
      DesignSize = (
        554
        43)
      inline fraBanco: TfraStaticCodigoDescripcion
        Left = 6
        Top = 14
        Width = 541
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          541
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 478
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
    object gbCuetna: TGroupBox
      Left = 3
      Top = 44
      Width = 765
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Cuenta'
      TabOrder = 2
      DesignSize = (
        765
        43)
      inline fraCuentaBancaria: TfraStaticCodigoDescripcion
        Left = 6
        Top = 15
        Width = 752
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          752
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 689
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
  inherited CoolBar: TCoolBar
    Top = 90
    Width = 772
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 768
      end>
    inherited ToolBar: TToolBar
      Width = 755
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 119
    Width = 772
    Height = 354
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 112
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO_INICIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo Inicial'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITO'
        Title.Alignment = taCenter
        Title.Caption = 'Cr'#233'dito'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITO'
        Title.Alignment = taCenter
        Title.Caption = 'D'#233'bito'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRANSFERENCIAS'
        Title.Alignment = taCenter
        Title.Caption = 'Transferencias'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVERSIONES'
        Title.Alignment = taCenter
        Title.Caption = 'Inversiones'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO_FINAL'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo Final'
        Width = 85
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
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
      end>
    Left = 108
    Top = 200
  end
end
