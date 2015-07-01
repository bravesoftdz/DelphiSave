inherited frmHistoricoPlanMejoras: TfrmHistoricoPlanMejoras
  Left = 272
  Top = 155
  Height = 469
  Caption = 'Historico Plan de Mejoras'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel [0]
    Left = 0
    Top = 338
    Width = 621
    Height = 13
    Align = alBottom
    Alignment = taCenter
    Caption = 'Item'
    Layout = tlCenter
  end
  object Label1: TLabel [1]
    Left = 0
    Top = 381
    Width = 621
    Height = 13
    Align = alBottom
    Alignment = taCenter
    Caption = 'Sub Item'
    Layout = tlCenter
  end
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      ButtonWidth = 27
      inherited ToolButton5: TToolButton
        Left = 27
      end
      inherited tbNuevo: TToolButton
        Left = 35
        Visible = False
      end
      inherited tbModificar: TToolButton
        Left = 62
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Left = 89
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Left = 116
      end
      inherited tbPropiedades: TToolButton
        Left = 124
      end
      inherited ToolButton3: TToolButton
        Left = 151
      end
      inherited tbLimpiar: TToolButton
        Left = 159
      end
      inherited tbOrdenar: TToolButton
        Left = 186
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 213
      end
      inherited ToolButton6: TToolButton
        Left = 240
      end
      inherited tbImprimir: TToolButton
        Left = 248
      end
      inherited tbExportar: TToolButton
        Left = 275
      end
      inherited tbEnviarMail: TToolButton
        Left = 302
      end
      inherited ToolButton8: TToolButton
        Left = 329
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 337
      end
      inherited tbMaxRegistros: TToolButton
        Left = 364
      end
      inherited ToolButton11: TToolButton
        Left = 391
      end
      inherited tbSalir: TToolButton
        Left = 399
      end
    end
  end
  inherited Grid: TArtDBGrid
    Height = 264
    Columns = <
      item
        Expanded = False
        FieldName = 'MS_ITEM'
        Title.Caption = 'Item'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_ORDEN'
        Title.Caption = 'Orden'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_FECHINI'
        Title.Caption = 'Inicio'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_TIPO'
        Title.Caption = 'Tipo'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_CANTIDAD'
        Title.Caption = 'Plazo'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_UNIDAD'
        Title.Caption = 'Unidad'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_FECHCUMP'
        Title.Caption = 'Cumplimiento'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_FIRMANTE'
        Title.Caption = 'Firmante'
        Width = 84
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 112
    Top = 128
    Width = 457
    Height = 181
    inherited BevelAbm: TBevel
      Top = 145
      Width = 449
    end
    object lbMenu: TLabel [1]
      Left = 8
      Top = 15
      Width = 30
      Height = 13
      Caption = 'Menu:'
    end
    object lbSubMenu: TLabel [2]
      Left = 8
      Top = 47
      Width = 52
      Height = 13
      Caption = 'Sub Menu:'
    end
    inherited btnAceptar: TButton
      Left = 299
      Top = 151
    end
    inherited btnCancelar: TButton
      Left = 377
      Top = 151
      Visible = False
    end
    object edMenu: TEdit
      Left = 63
      Top = 12
      Width = 387
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edSubMenu: TMemo
      Left = 62
      Top = 40
      Width = 387
      Height = 97
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 3
    end
  end
  object redSubMenu: TRichEdit [6]
    Left = 0
    Top = 394
    Width = 621
    Height = 48
    Align = alBottom
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object redMenu: TRichEdit [7]
    Left = 0
    Top = 351
    Width = 621
    Height = 30
    Align = alBottom
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 5
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT   ms_cuit, ms_estableci, ms_item, a.descripcion AS submen' +
        'u, ms_tipo,'
      
        '         ms_observaciones, ms_fechini, ms_cantidad, ms_unidad, m' +
        's_fechcump,'
      '         ms_orden, ms_firmante, ms_usumodif, ms_fechamodif,'
      '         ptf.descripcion AS menu'
      '    FROM pms_planes, ptf_formulario a, ptf_formulario ptf'
      '   WHERE ms_cuit = :cuit'
      '     AND ms_estableci = :estableci'
      '     AND ms_fechabaja IS NULL'
      '     AND ms_item = a.item'
      '     AND SUBSTR (a.item, 1, 2) = ptf.item'
      '     AND INSTR (a.item, '#39'.'#39') > 0'
      '     AND INSTR (ptf.item, '#39'.'#39') = 0'
      'ORDER BY ms_item, ms_orden')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end>
  end
end
