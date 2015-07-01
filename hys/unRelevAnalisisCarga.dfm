inherited frmRelevAnalisiCarga: TfrmRelevAnalisiCarga
  Left = 444
  Top = 229
  Width = 504
  Caption = 'An'#225'lisis de Carga de Relevamientos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 496
    Height = 79
    object lblCuit: TLabel
      Left = 5
      Top = 9
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object lblCumplimientoEstimado: TLabel
      Left = 5
      Top = 37
      Width = 116
      Height = 13
      Caption = 'Cumplimiento Estimaci'#243'n'
    end
    object Label1: TLabel
      Left = 186
      Top = 37
      Width = 119
      Height = 13
      Caption = 'Cumplimiento C.Definitiva'
    end
    inline fraEmpresa: TfraEmpresa
      Left = 35
      Top = 5
      Width = 453
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
        Left = 349
      end
      inherited edContrato: TIntEdit
        Left = 396
      end
      inherited cmbRSocial: TArtComboBox
        Width = 214
      end
    end
    object chkRelevSinCargaDef: TCheckBox
      Left = 3
      Top = 60
      Width = 148
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Relev. sin carga definitiva'
      TabOrder = 1
    end
    object chkDif: TCheckBox
      Left = 171
      Top = 60
      Width = 199
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Diferencias (C.R'#225'pida Vs C.Definitiva)'
      TabOrder = 2
    end
    object cmbCumplimientoEstimado: TComboBox
      Left = 129
      Top = 34
      Width = 48
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'Si'
        'No')
    end
    object cmbCumplimientoDef: TComboBox
      Left = 312
      Top = 34
      Width = 48
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'Si'
        'No')
    end
  end
  inherited CoolBar: TCoolBar
    Top = 79
    Width = 496
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 492
      end>
    inherited ToolBar: TToolBar
      Width = 479
      inherited ToolButton11: TToolButton
        Left = 0
        Wrap = True
      end
      inherited tbSalir: TToolButton
        Left = 0
        Top = 30
      end
      object Panel1: TPanel
        Left = 23
        Top = 30
        Width = 327
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object Label3: TLabel
          Left = 34
          Top = 4
          Width = 178
          Height = 13
          Caption = 'Diferencias (C.R'#225'pida Vs C.Definitiva)'
        end
        object Panel3: TPanel
          Left = 12
          Top = 3
          Width = 16
          Height = 16
          BevelOuter = bvNone
          Color = 14811135
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 108
    Width = 496
    Height = 209
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_contrato'
        Title.Caption = 'Contrato'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_vigencia'
        Title.Caption = 'Vigencia'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_relevestimados'
        Title.Caption = 'Relev. Estimados'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_estabestimados'
        Title.Caption = 'Estab. Estimaci'#243'n'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_cumplimientoestimado'
        Title.Caption = 'Cumplimiento Est.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_usuestimacion'
        Title.Caption = 'Usu.Estimaci'#243'n'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_fechaestimacion'
        Title.Caption = 'F.Estimaci'#243'n'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_relevvalidos'
        Title.Caption = 'Relev.V'#225'lidos'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_relevinvalidos'
        Title.Caption = 'Relev.Inv'#225'lidos'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_estabcarga'
        Title.Caption = 'Estab.Carga Def.'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_cumplimientocarga'
        Title.Caption = 'Cumplimiento Carga Def.'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_estadocarga'
        Title.Caption = 'Estado Carga Def.'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_usuariocarga'
        Title.Caption = 'Usu.Carga Def.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_fechacarga'
        Title.Caption = 'F.Carga Def.'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_usuautorizacion'
        Title.Caption = 'Usu.Autorizaci'#243'n'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_fechaautorizacion'
        Title.Caption = 'F.Autorizaci'#243'n'
        Width = 127
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT em_cuit, em_nombre, rc_contrato, rc_vigencia, rc_relevest' +
        'imados, rc_estabestimados, rc_cumplimientoestimado, rc_usuestima' +
        'cion,'
      
        '       rc_fechaestimacion, rc_relevvalidos, rc_relevinvalidos, r' +
        'c_estabcarga,'
      
        '       DECODE(rc_estadocarga, '#39'P'#39', '#39'Cargando'#39',  '#39'A'#39', '#39'Aprobado'#39')' +
        ' rc_estadocarga, rc_cumplimientocarga, rc_usuariocarga, rc_fecha' +
        'carga,'
      
        '       rc_usuautorizacion, rc_fechaautorizacion, rc_usuarioanali' +
        'sis'
      
        '  FROM afi.aem_empresa, afi.aco_contrato, hys.hrc_relevamientoca' +
        'rga'
      '  WHERE em_id = co_idempresa'
      '  AND co_contrato = rc_contrato')
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
end
