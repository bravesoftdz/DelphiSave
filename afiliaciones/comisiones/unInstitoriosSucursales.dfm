inherited frmInstitoriosSucursales: TfrmInstitoriosSucursales
  Left = 278
  Top = 183
  Width = 700
  Height = 500
  Caption = 'Institorios en Sucursales'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 89
    Visible = True
    DesignSize = (
      692
      89)
    object gbSucursal: TGroupBox
      Left = 2
      Top = 43
      Width = 578
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Sucursal'
      TabOrder = 1
      DesignSize = (
        578
        42)
      inline fraSucursalFiltro: TfraSucursal
        Left = 9
        Top = 14
        Width = 561
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          561
          23)
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Width = 498
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'Entidad'
            'Centro Regional')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            0)
        end
      end
    end
    object rgAprobado: TRadioGroup
      Left = 585
      Top = 1
      Width = 106
      Height = 84
      Anchors = [akTop, akRight]
      Caption = 'Aprobado'
      ItemIndex = 2
      Items.Strings = (
        'Aprobadas'
        'No Aprobadas'
        'Todas')
      TabOrder = 2
    end
    object gbVendedor: TGroupBox
      Left = 2
      Top = 1
      Width = 578
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Vendedor'
      TabOrder = 0
      DesignSize = (
        578
        42)
      inline fraVendedorCUITFiltro: TfraVendedoresCUIT
        Left = 6
        Top = 13
        Width = 568
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          568
          24)
        inherited lbRSocial: TLabel
          Width = 25
          Caption = 'CUIT'
        end
        inherited Label1: TLabel
          Left = 120
        end
        inherited Label2: TLabel
          Left = 214
          Width = 37
          Caption = 'Nombre'
        end
        inherited cmbDescripcion: TArtComboBox
          Left = 256
          Width = 308
        end
        inherited edCodigo: TPatternEdit
          Left = 156
          Width = 50
        end
        inherited mskCuit: TMaskEdit
          Left = 34
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 89
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 688
      end>
    inherited ToolBar: TToolBar
      Width = 675
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbAprobar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Aprobar'
        ImageIndex = 13
        OnClick = tbAprobarClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlBajas: TPanel
        Left = 424
        Top = 0
        Width = 124
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkNoBajas: TCheckBox
          Left = 8
          Top = 3
          Width = 104
          Height = 17
          Caption = 'No Mostrar Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 118
    Width = 692
    Height = 355
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_VENDEDOR'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Vend.'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT_VENDEDOR'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_VENDEDOR'
        Title.Caption = 'Nombre Vendedor'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_SUCURSAL'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Sucursal'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_SUCURSAL'
        Title.Caption = 'Sucursal'
        Width = 161
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_DESDE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Desde'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_HASTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Hasta'
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_APROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobado'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 81
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 136
    Top = 176
    Width = 504
    Height = 126
    Constraints.MaxHeight = 126
    Constraints.MaxWidth = 504
    Constraints.MinHeight = 126
    Constraints.MinWidth = 504
    DesignSize = (
      504
      126)
    inherited BevelAbm: TBevel
      Top = 90
      Width = 496
    end
    object Label1: TLabel [1]
      Left = 2
      Top = 39
      Width = 46
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Sucursal'
    end
    object Label2: TLabel [2]
      Left = 2
      Top = 66
      Width = 46
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'F. Desde'
    end
    object Label3: TLabel [3]
      Left = 151
      Top = 66
      Width = 44
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Hasta'
    end
    inherited btnAceptar: TButton
      Left = 346
      Top = 96
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 424
      Top = 96
      TabOrder = 5
    end
    inline fraVendedorCUITEdic: TfraVendedoresCUIT
      Left = 18
      Top = 8
      Width = 486
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        486
        24)
      inherited lbRSocial: TLabel
        Width = 25
        Caption = 'CUIT'
      end
      inherited Label1: TLabel
        Left = 120
      end
      inherited Label2: TLabel
        Left = 214
        Width = 37
        Caption = 'Nombre'
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 256
        Width = 224
      end
      inherited edCodigo: TPatternEdit
        Left = 156
        Width = 50
      end
      inherited mskCuit: TMaskEdit
        Left = 34
      end
    end
    inline fraSucursalEdic: TfraSucursal
      Left = 51
      Top = 35
      Width = 446
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        446
        23)
      inherited cmbDescripcion: TComboGrid
        Left = 64
        Width = 383
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'Entidad'
          'Centro Regional')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          0)
      end
    end
    object edFDesdeEdic: TDateComboBox
      Left = 52
      Top = 63
      Width = 89
      Height = 21
      MaxDateCombo = edFHastaEdic
      AutoExit = True
      TabOrder = 2
    end
    object edFHastaEdic: TDateComboBox
      Left = 200
      Top = 63
      Width = 89
      Height = 21
      MinDateCombo = edFDesdeEdic
      AutoExit = True
      TabOrder = 3
    end
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
      end>
    Left = 109
    Top = 200
  end
end
