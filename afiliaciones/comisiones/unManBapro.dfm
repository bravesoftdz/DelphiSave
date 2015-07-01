inherited frmManBapro: TfrmManBapro
  Left = 100
  Top = 71
  Width = 630
  Height = 450
  Caption = 'Mantenimiento de Vendedores de Bancos'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 630
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 622
    Height = 106
    Visible = True
    DesignSize = (
      622
      106)
    object GBEntidad: TGroupBox
      Left = 0
      Top = 0
      Width = 621
      Height = 52
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Entidad'
      TabOrder = 0
      DesignSize = (
        621
        52)
      inline fraEN_ID: TfraEntidadCUIT
        Left = 2
        Top = 16
        Width = 614
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          614
          23)
        inherited Label1: TLabel
          Left = 120
        end
        inherited lbRSocial: TLabel
          Width = 24
          Caption = 'CUIT'
          Font.Name = 'Tahoma'
        end
        inherited Label2: TLabel
          Left = 214
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 357
        end
        inherited mskCuit: TMaskEdit
          Left = 34
        end
        inherited edEN_CODBANCO: TPatternEdit
          Left = 156
          Width = 50
        end
      end
    end
    object GBVendedor: TGroupBox
      Left = 0
      Top = 52
      Width = 621
      Height = 52
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Vendedor'
      TabOrder = 1
      DesignSize = (
        621
        52)
      inline fraVE_ID: TfraVendedoresCUIT
        Left = 2
        Top = 16
        Width = 613
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          613
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
          Width = 355
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
    Top = 106
    Width = 622
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 618
      end>
    inherited ToolBar: TToolBar
      Width = 605
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 135
    Width = 622
    Height = 288
    Columns = <
      item
        Expanded = False
        FieldName = 'EN_CODBANCO'
        Title.Caption = 'C'#243'd. Entidad'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Nombre Entidad'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_VENDEDOR'
        Title.Caption = 'C'#243'd. Vendedor'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_NOMBRE'
        Title.Caption = 'Nombre Vendedor'
        Width = 223
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 179
    Width = 460
    Height = 150
    Constraints.MaxHeight = 150
    Constraints.MinHeight = 150
    Constraints.MinWidth = 460
    DesignSize = (
      460
      150)
    inherited BevelAbm: TBevel
      Top = 114
      Width = 452
    end
    inherited btnAceptar: TButton
      Left = 302
      Top = 120
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 380
      Top = 120
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 4
      Width = 448
      Height = 52
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Entidad'
      TabOrder = 0
      DesignSize = (
        448
        52)
      inline fraEntidadAlta: TfraEntidadCUIT
        Left = 2
        Top = 16
        Width = 441
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          441
          23)
        inherited Label1: TLabel
          Left = 120
        end
        inherited lbRSocial: TLabel
          Width = 24
          Caption = 'CUIT'
          Font.Name = 'Tahoma'
        end
        inherited Label2: TLabel
          Left = 214
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 184
        end
        inherited mskCuit: TMaskEdit
          Left = 34
        end
        inherited edEN_CODBANCO: TPatternEdit
          Left = 156
          Width = 50
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 56
      Width = 448
      Height = 52
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Vendedor'
      TabOrder = 1
      DesignSize = (
        448
        52)
      object Label1: TLabel
        Left = 3
        Top = 23
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 92
        Top = 23
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object edNombreVendAlta: TEdit
        Left = 134
        Top = 19
        Width = 308
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 1
      end
      object edCodigoVendAlta: TPatternEdit
        Left = 38
        Top = 19
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 0
        Alignment = taRightJustify
        Pattern = '0123456789.'
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT EN_CODBANCO, EN_NOMBRE, VE_VENDEDOR, VE_NOMBRE'
      '  FROM XEV_ENTIDADVENDEDOR, XEN_ENTIDAD, XVE_VENDEDOR'
      ' WHERE EN_ID = EV_IDENTIDAD'
      '   AND VE_ID = EV_IDVENDEDOR'
      '   AND EN_FACTURA = '#39'N'#39
      '   AND VE_FECHABAJA IS NULL'
      '   AND EN_FECHABAJA IS NULL'
      '   AND EV_FECHABAJA IS NULL'
      '   AND 1 = 2'
      '   ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
