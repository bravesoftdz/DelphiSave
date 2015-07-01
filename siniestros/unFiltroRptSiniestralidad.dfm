inherited frmFiltroRptSiniestralidad: TfrmFiltroRptSiniestralidad
  Left = 392
  Top = 213
  Width = 350
  Height = 240
  BorderIcons = [biSystemMenu]
  Caption = 'Reporte de Siniestralidad'
  Constraints.MaxHeight = 240
  Constraints.MaxWidth = 350
  Constraints.MinHeight = 240
  Constraints.MinWidth = 350
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 3
    Top = 166
    Width = 336
    Height = 3
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
  end
  object btnImprimir: TButton [1]
    Left = 190
    Top = 177
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnImprimirClick
  end
  object btnCancelar: TButton [2]
    Left = 265
    Top = 177
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cerrar'
    ModalResult = 2
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object gbGerente: TGroupBox [3]
    Left = 3
    Top = 4
    Width = 174
    Height = 46
    Caption = ' Gerente '
    TabOrder = 0
    DesignSize = (
      174
      46)
    object cmbGerente: TJvDBLookupCombo
      Left = 5
      Top = 17
      Width = 165
      Height = 21
      Enabled = False
      Anchors = [akLeft, akTop, akRight]
      LookupField = 'GERENTE'
      LookupDisplay = 'GERENTE'
      LookupSource = dsGerentes
      TabOrder = 0
    end
  end
  object gbFAccidente: TGroupBox [4]
    Left = 4
    Top = 108
    Width = 215
    Height = 46
    Caption = ' Fecha de accidente '
    TabOrder = 3
    object Label9: TLabel
      Left = 101
      Top = 22
      Width = 13
      Height = 11
      Caption = '>>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edFAcciHasta: TDateComboBox
      Left = 117
      Top = 18
      Width = 90
      Height = 21
      MinDateCombo = edFAcciDesde
      TabOrder = 1
    end
    object edFAcciDesde: TDateComboBox
      Left = 7
      Top = 18
      Width = 90
      Height = 21
      MaxDateCombo = edFAcciHasta
      TabOrder = 0
    end
  end
  object gbRegion: TGroupBox [5]
    Left = 180
    Top = 4
    Width = 158
    Height = 46
    Caption = ' Regi'#243'n '
    TabOrder = 1
    DesignSize = (
      158
      46)
    object cmbRegion: TJvDBLookupCombo
      Left = 5
      Top = 17
      Width = 149
      Height = 21
      Enabled = False
      Anchors = [akLeft, akTop, akRight]
      LookupField = 'ES_REGIONDISCO'
      LookupDisplay = 'ES_REGIONDISCO'
      LookupSource = dsRegion
      TabOrder = 0
    end
  end
  object gbEmpresa: TGroupBox [6]
    Left = 3
    Top = 56
    Width = 335
    Height = 46
    Caption = ' Empresa '
    TabOrder = 2
    DesignSize = (
      335
      46)
    object cmbEmpresa: TJvDBLookupCombo
      Left = 5
      Top = 17
      Width = 326
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      LookupField = 'CO_CONTRATO'
      LookupDisplay = 'EM_NOMBRE'
      LookupSource = dsEmpresas
      TabOrder = 0
    end
  end
  inherited FormStorage: TFormStorage
    Left = 152
    Top = 272
  end
  inherited XPMenu: TXPMenu
    Left = 180
    Top = 272
  end
  inherited ilByN: TImageList
    Left = 152
    Top = 300
  end
  inherited ilColor: TImageList
    Left = 180
    Top = 300
  end
  inherited IconosXP: TImageList
    Left = 208
    Top = 300
  end
  object sdqGerentes: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT DISTINCT gerente'
      '           FROM pablo.tmp_gerentes_x_establecimiento'
      '          WHERE EXISTS(SELECT 1'
      
        '                         FROM afi.aes_establecimiento, art.sex_e' +
        'xpedientes'
      '                        WHERE ex_contrato = es_contrato'
      '                          AND es_contrato = contrato'
      
        '                          AND es_codigoestdisco = establecimient' +
        'o)'
      '       ORDER BY 1')
    Left = 60
    Top = 12
    object sdqGerentesGERENTE: TStringField
      FieldName = 'GERENTE'
      Size = 255
    end
  end
  object dsGerentes: TDataSource
    DataSet = sdqGerentes
    Left = 88
    Top = 12
  end
  object sdqRegion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT DISTINCT es_regiondisco'
      '           FROM afi.aes_establecimiento, art.sex_expedientes'
      '          WHERE ex_contrato = es_contrato'
      '            AND ex_contrato IN(126625, 126623, 100100)'
      '            AND es_codigoestdisco IS NOT NULL'
      '       ORDER BY 1')
    Left = 236
    Top = 12
  end
  object dsRegion: TDataSource
    DataSet = sdqRegion
    Left = 264
    Top = 12
  end
  object sdqEmpresas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT em_nombre, co_contrato'
      '  FROM aem_empresa, aco_contrato'
      ' WHERE co_idempresa = em_id'
      '   AND em_idgrupoeconomico = 981')
    Left = 184
    Top = 56
  end
  object dsEmpresas: TDataSource
    DataSet = sdqEmpresas
    Left = 212
    Top = 56
  end
end
