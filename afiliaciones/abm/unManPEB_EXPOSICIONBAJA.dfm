inherited frmManPEB_EXPOSICIONBAJA: TfrmManPEB_EXPOSICIONBAJA
  Left = 217
  Top = 116
  Width = 631
  Caption = 'Exposici'#243'n Baja'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 623
    Height = 85
    Visible = True
    object GroupBox2: TGroupBox
      Left = 4
      Top = 0
      Width = 605
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        605
        41)
      object Label4: TLabel
        Left = 12
        Top = 16
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 44
        Top = 12
        Width = 549
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
        TabOrder = 0
        inherited lbContrato: TLabel
          Left = 445
        end
        inherited edContrato: TIntEdit
          Left = 492
        end
        inherited cmbRSocial: TArtComboBox
          Width = 310
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 4
      Top = 40
      Width = 185
      Height = 41
      TabOrder = 1
      DesignSize = (
        185
        41)
      object Vigencia: TLabel
        Left = 12
        Top = 16
        Width = 41
        Height = 13
        Caption = 'Vigencia'
      end
      object edVigenciaFiltro: TDateComboBox
        Left = 72
        Top = 12
        Width = 105
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 85
    Width = 623
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 619
      end>
    inherited ToolBar: TToolBar
      Width = 606
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 114
    Width = 623
    Height = 325
    Columns = <
      item
        Expanded = False
        FieldName = 'co_contrato'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_cuit'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Raz'#243'n Social'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'eb_fechadesde'
        Title.Caption = 'Fecha Desde'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'eb_fechahasta'
        Title.Caption = 'Fecha Hasta'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'eb_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'eb_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'eb_usumodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'eb_fechamodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 113
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 84
    Top = 108
    Width = 501
    Height = 125
    Constraints.MaxHeight = 125
    Constraints.MaxWidth = 501
    Constraints.MinHeight = 125
    Constraints.MinWidth = 501
    inherited BevelAbm: TBevel
      Top = 89
      Width = 493
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 64
      Width = 108
      Height = 13
      Caption = 'Fecha Vigencia Desde'
    end
    object Label3: TLabel [2]
      Left = 248
      Top = 64
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    inherited btnAceptar: TButton
      Left = 343
      Top = 95
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 421
      Top = 95
      TabOrder = 4
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 493
      Height = 43
      Constraints.MaxHeight = 43
      Constraints.MaxWidth = 493
      Constraints.MinHeight = 43
      Constraints.MinWidth = 493
      TabOrder = 0
      object Label1: TLabel
        Left = 4
        Top = 20
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresa: TfraEmpresa
        Left = 32
        Top = 16
        Width = 453
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited lbContrato: TLabel
          Left = 349
        end
        inherited edContrato: TIntEdit
          Left = 396
        end
        inherited cmbRSocial: TArtComboBox
          Width = 214
        end
      end
    end
    object edFechaDesde: TDateComboBox
      Left = 128
      Top = 60
      Width = 105
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object edFechaHasta: TDateComboBox
      Left = 284
      Top = 60
      Width = 105
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
end
