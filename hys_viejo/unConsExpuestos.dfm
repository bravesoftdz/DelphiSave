inherited frmConsExpuestos: TfrmConsExpuestos
  Left = 243
  Top = 206
  Width = 639
  Height = 376
  Caption = 'Consulta de Expuestos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 631
    Height = 158
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Bevel1: TBevel
      Left = 2
      Top = 30
      Width = 629
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel3: TBevel
      Left = -4
      Top = 62
      Width = 635
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = -4
      Top = 94
      Width = 635
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Riesgo: TLabel
      Left = 4
      Top = 104
      Width = 33
      Height = 13
      Caption = 'Riesgo'
    end
    object Label2: TLabel
      Left = 4
      Top = 137
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label3: TLabel
      Left = 148
      Top = 136
      Width = 26
      Height = 13
      Caption = 'hasta'
    end
    object Bevel5: TBevel
      Left = -4
      Top = 126
      Width = 635
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel6: TBevel
      Left = 328
      Top = 132
      Width = 5
      Height = 23
      Shape = bsLeftLine
    end
    object Label5: TLabel
      Left = 339
      Top = 136
      Width = 76
      Height = 13
      Caption = 'Fecha de Carga'
    end
    object Label6: TLabel
      Left = 511
      Top = 136
      Width = 26
      Height = 13
      Caption = 'hasta'
    end
    object Label7: TLabel
      Left = 4
      Top = 40
      Width = 74
      Height = 13
      Caption = 'Establecimiento'
    end
    object Label4: TLabel
      Left = 4
      Top = 72
      Width = 24
      Height = 13
      Caption = 'CUIL'
    end
    inline fraRT_CUIT: TfraEmpresa
      Left = 56
      Top = 4
      Width = 571
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
        Left = 469
      end
      inherited edContrato: TIntEdit
        Left = 514
      end
      inherited cmbRSocial: TArtComboBox
        Width = 332
      end
    end
    inline fraRT_CUIL: TfraTrabajador
      Left = 56
      Top = 68
      Width = 573
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbNombre: TArtComboBox
        Width = 489
      end
    end
    object edRT_FECHADesde: TDateComboBox
      Left = 56
      Top = 132
      Width = 88
      Height = 21
      MaxDateCombo = edRT_FECHAHasta
      TabOrder = 4
    end
    object edRT_FECHAHasta: TDateComboBox
      Left = 179
      Top = 132
      Width = 88
      Height = 21
      MinDateCombo = edRT_FECHADesde
      TabOrder = 5
    end
    object chkRT_FECHATodas: TCheckBox
      Left = 273
      Top = 134
      Width = 49
      Height = 17
      Caption = 'Todas'
      TabOrder = 6
    end
    object edRT_FECHAALTADesde: TDateComboBox
      Left = 420
      Top = 132
      Width = 88
      Height = 21
      MaxDateCombo = edRT_FECHAALTAHasta
      TabOrder = 7
    end
    object edRT_FECHAALTAHasta: TDateComboBox
      Left = 541
      Top = 132
      Width = 88
      Height = 21
      MinDateCombo = edRT_FECHAALTADesde
      TabOrder = 8
    end
    inline fraRT_ESTABLECI: TfraEstablecimiento
      Left = 84
      Top = 36
      Width = 545
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 480
      end
    end
    inline fraRT_RIESGO: TfraStaticCodigoDescripcion
      Left = 56
      Top = 100
      Width = 573
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 510
        ListCol = 2
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
  inherited CoolBar: TCoolBar
    Top = 158
    Width = 631
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 627
      end>
    inherited ToolBar: TToolBar
      Width = 614
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 187
    Width = 631
    Height = 162
    Columns = <
      item
        Expanded = False
        FieldName = 'RT_CUIT'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_ESTABLECI'
        Title.Caption = 'Nro.Estab.'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_FECHA'
        Title.Caption = 'Fecha'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_RIESGO'
        Title.Caption = 'Riesgo'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG_ESOP'
        Title.Caption = 'ESOP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG_DESCRIPCION'
        Title.Caption = 'Riesgo Descripci'#243'n'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 260
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    Left = 20
    Top = 252
  end
  inherited dsConsulta: TDataSource
    Left = 48
    Top = 252
  end
  inherited SortDialog: TSortDialog
    Left = 20
    Top = 280
  end
  inherited ExportDialog: TExportDialog
    Left = 48
    Top = 280
  end
  inherited QueryPrint: TQueryPrint
    Left = 48
    Top = 308
  end
  inherited Seguridad: TSeguridad
    Left = 20
    Top = 224
  end
  inherited FormStorage: TFormStorage
    Left = 48
    Top = 224
  end
  inherited PrintDialog: TPrintDialog
    Left = 20
    Top = 308
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
    Left = 76
    Top = 224
  end
  inherited FieldHider: TFieldHider
    Left = 76
    Top = 252
  end
end
