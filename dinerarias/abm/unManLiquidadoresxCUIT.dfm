inherited frmManLiquidadoresxCUIT: TfrmManLiquidadoresxCUIT
  Left = 278
  Top = 166
  Width = 780
  Caption = 'Mantenimiento de liquidadores por CUIT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 770
    Visible = True
    object GroupBox1: TGroupBox
      Left = 4
      Top = 1
      Width = 225
      Height = 40
      Caption = ' Usuario '
      TabOrder = 0
      DesignSize = (
        225
        40)
      inline fraUsuarioFiltro: TfraUsuario
        Left = 4
        Top = 14
        Width = 216
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited edCodigo: TPatternEdit
          Width = 69
        end
        inherited cmbDescripcion: TArtComboBox
          Left = 72
          Width = 144
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 232
      Top = 1
      Width = 538
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 1
      DesignSize = (
        538
        40)
      object rbTermFiltro: TRadioButton
        Left = 8
        Top = 15
        Width = 78
        Height = 17
        Caption = 'Terminaci'#243'n'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbTermFiltroClick
      end
      object edTermFiltro: TIntEdit
        Left = 89
        Top = 12
        Width = 24
        Height = 21
        TabOrder = 1
        MaxLength = 1
        MaxValue = 9
      end
      object rbCuitFiltro: TRadioButton
        Left = 124
        Top = 15
        Width = 45
        Height = 17
        Caption = 'CUIT'
        TabOrder = 2
        OnClick = rbCuitFiltroClick
      end
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 172
        Top = 12
        Width = 361
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
        TabOrder = 3
        inherited lbContrato: TLabel
          Left = 257
        end
        inherited edContrato: TIntEdit
          Left = 304
        end
        inherited cmbRSocial: TArtComboBox
          Width = 122
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Width = 770
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 766
      end>
    inherited ToolBar: TToolBar
      Width = 753
    end
  end
  inherited Grid: TArtDBGrid
    Width = 770
    Columns = <
      item
        Expanded = False
        FieldName = 'LE_LIQUIDADOR'
        Title.Caption = 'Liquidador'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Nombre liquidador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LE_TERMINACION'
        Title.Alignment = taCenter
        Title.Caption = 'Terminaci'#243'n'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 250
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 136
    Width = 573
    Height = 137
    inherited BevelAbm: TBevel
      Top = 101
      Width = 565
    end
    object Label1: TLabel [1]
      Left = 4
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label2: TLabel [2]
      Left = 4
      Top = 36
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    inherited btnAceptar: TButton
      Left = 415
      Top = 107
    end
    inherited btnCancelar: TButton
      Left = 493
      Top = 107
    end
    inline fraUsuarioABM: TfraUsuario
      Left = 51
      Top = 8
      Width = 328
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 244
      end
    end
    object GroupBox3: TGroupBox
      Left = 51
      Top = 29
      Width = 518
      Height = 67
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        518
        67)
      object rbTermABM: TRadioButton
        Left = 8
        Top = 15
        Width = 78
        Height = 17
        Caption = 'Terminaci'#243'n'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbTermABMClick
      end
      object edTermABM: TIntEdit
        Left = 89
        Top = 12
        Width = 24
        Height = 21
        TabOrder = 1
        MaxLength = 1
        MaxValue = 9
      end
      object rbCUITABM: TRadioButton
        Left = 8
        Top = 41
        Width = 45
        Height = 17
        Caption = 'CUIT'
        TabOrder = 2
        OnClick = rbCUITABMClick
      end
      inline fraEmpresaABM: TfraEmpresa
        Left = 56
        Top = 38
        Width = 457
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
        TabOrder = 3
        inherited lbContrato: TLabel
          Left = 353
        end
        inherited edContrato: TIntEdit
          Left = 400
        end
        inherited cmbRSocial: TArtComboBox
          Width = 218
        end
      end
    end
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
        LinkControl = tbSalir
      end>
    Left = 80
    Top = 256
  end
end
