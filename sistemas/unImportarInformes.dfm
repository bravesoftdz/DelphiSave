inherited frmImportarInformes: TfrmImportarInformes
  Width = 936
  Height = 456
  ActiveControl = Grid
  Caption = 'Importar Informes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 928
    Height = 63
    object lbCONTRATO: TLabel
      Left = 8
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object lblPeriodo: TLabel
      Left = 589
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Periodo'
    end
    inline fraII_CONTRATO: TfraEmpresa
      Left = 8
      Top = 24
      Width = 566
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited cmbRSocial: TArtComboBox
        Left = 130
        Top = 2
      end
    end
    object edII_PERIODO: TPeriodoPicker
      Left = 589
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 1
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '206401'
      Periodo.MinPeriodo = '196402'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'Tahoma'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NullDropDown = SetMax
    end
  end
  inherited CoolBar: TCoolBar
    Top = 63
    Width = 928
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 924
      end>
    inherited ToolBar: TToolBar
      Width = 911
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 92
    Width = 928
    Height = 337
    OnEditButtonClick = GridEditButtonClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ii_contrato'
        Title.Caption = 'Contrato'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ii_periodo'
        Title.Caption = 'Periodo'
        Width = 100
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ii_archivo'
        Title.Caption = 'Archivo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ii_tipoarchivo'
        Title.Caption = 'Tipo Archivo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ii_usualta'
        Title.Caption = 'Usuario'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ii_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 100
        Visible = True
      end>
  end
  object pnlProgressPanel: TPanel [3]
    Left = 113
    Top = 142
    Width = 657
    Height = 81
    TabOrder = 3
    Visible = False
    DesignSize = (
      657
      81)
    object Bevel1: TBevel
      Left = 11
      Top = 46
      Width = 632
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbProgressOrigen: TLabel
      Left = 16
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Origen'
    end
    object lbProgressDestino: TLabel
      Left = 16
      Top = 27
      Width = 36
      Height = 13
      Caption = 'Destino'
    end
    object pbProcesarArchivos: TProgressBar
      Left = 11
      Top = 57
      Width = 630
      Height = 16
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    CachedUpdates = False
    SQL.Strings = (
      '  SELECT   ii_contrato,'
      '           ii_periodo,'
      '           ii_archivo,'
      '           ii_tipoarchivo,'
      '           ii_usualta,'
      '           ii_fechaalta'
      '    FROM   web.wii_informesiys'
      '   where 1 = 1 ')
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
  object sdFileLog: TSaveDialog
    Left = 32
    Top = 128
  end
  object ShortCutControlHijo: TShortCutControl
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
    Top = 200
  end
end
