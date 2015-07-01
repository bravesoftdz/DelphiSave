inherited frmManOCO_CODIGOCONCILIACION: TfrmManOCO_CODIGOCONCILIACION
  Left = 313
  Top = 114
  Caption = 'C'#243'digos de Conciliaci'#243'n Bancaria'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CO_GRUPO'
        Title.Caption = 'Grupo'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEBCO_DESCRIPCION'
        Title.Caption = 'Desc.Grupo'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_DESCRIPCION'
        Title.Caption = 'Desc.C'#243'digo'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CUENTACONTABLE'
        Title.Caption = 'Cuenta Contable'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TCBAN_DESCRIPCION'
        Title.Caption = 'Tipo'
        Width = 144
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 108
    Height = 185
    BorderStyle = bsSingle
    inherited BevelAbm: TBevel
      Top = 149
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 18
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Grupo'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 46
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 72
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Descripci'#243'n'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 102
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Cuenta Contable'
    end
    object Label5: TLabel [5]
      Left = 8
      Top = 130
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Tipo'
    end
    inherited btnAceptar: TButton
      Top = 155
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Top = 155
      TabOrder = 5
    end
    inline fraCO_GRUPO: TfraStaticCTB_TABLAS
      Left = 92
      Top = 12
      Width = 364
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TComboGrid
        Width = 300
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object edCO_CODIGO: TPatternEdit
      Left = 93
      Top = 41
      Width = 60
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 1
      Pattern = '0123456789'
    end
    object edCO_DESCRIPCION: TEdit
      Left = 93
      Top = 68
      Width = 362
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 2
    end
    object edCO_CUENTACONTABLE: TPatternEdit
      Left = 93
      Top = 97
      Width = 157
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 25
      TabOrder = 3
      Pattern = '0123456789'
    end
    inline fraCO_TIPOCONC: TfraStaticCTB_TABLAS
      Left = 92
      Top = 124
      Width = 364
      Height = 23
      TabOrder = 6
      inherited cmbDescripcion: TComboGrid
        Width = 300
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      ' SELECT CO_ID, CO_GRUPO, CEBCO.TB_DESCRIPCION CEBCO_DESCRIPCION,'
      '        CO_CODIGO, CO_DESCRIPCION, CO_CUENTACONTABLE,'
      
        '        TCBAN.TB_DESCRIPCION TCBAN_DESCRIPCION, CO_TIPOCONC, CO_' +
        'FECHABAJA'
      ' FROM OCO_CODIGOCONCILIACION, CTB_TABLAS CEBCO, CTB_TABLAS TCBAN'
      ' WHERE CEBCO.TB_CODIGO = CO_GRUPO'
      ' AND CEBCO.TB_CLAVE = '#39'CEBCO'#39
      ' AND TCBAN.TB_CODIGO = CO_TIPOCONC'
      ' AND TCBAN.TB_CLAVE = '#39'TCBAN'#39
      ''
      ''
      ' '
      ' ')
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
