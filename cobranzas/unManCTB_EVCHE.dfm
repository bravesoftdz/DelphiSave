inherited frmManCTB_EVCHE: TfrmManCTB_EVCHE
  Left = 198
  Top = 106
  Caption = 'Mantenimiento de Eventos de Valores Rechazados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object chkSoloActivos: TCheckBox
        Left = 378
        Top = 0
        Width = 112
        Height = 22
        Caption = 'Ver Solo Activos'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = chkSoloActivosClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'TB_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 343
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEXTO'
        Title.Caption = 'Texto'
        Width = 348
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 108
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TB_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Width = 61
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 122
    Top = 104
    Height = 143
    Constraints.MaxHeight = 0
    inherited BevelAbm: TBevel
      Top = 107
    end
    inherited lbDescripcion: TLabel
      Top = 37
    end
    inherited lbEspecial: TLabel
      Top = 86
      Width = 28
      Caption = 'Texto'
    end
    object Label2: TLabel [4]
      Left = 8
      Top = 61
      Width = 34
      Height = 13
      Caption = 'M'#243'd&ulo'
    end
    inherited btnAceptar: TButton
      Top = 113
    end
    inherited btnCancelar: TButton
      Top = 113
      TabOrder = 7
    end
    inherited edCodigo: TPatternEdit
      Left = 68
      Top = 6
      Width = 99
      Anchors = [akLeft, akTop, akRight]
    end
    inherited edDescripcion: TEdit
      Left = 68
      Top = 31
      Width = 267
    end
    inherited edEspecial: TEdit
      Left = 67
      Top = 80
      Width = 268
    end
    inline fraCodigoModulo: TfraStaticCodigoDescripcion
      Left = 67
      Top = 55
      Width = 269
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      inherited cmbDescripcion: TComboGrid
        Width = 206
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
    inline fraCodigoCodTexto: TfraStaticCodigoDescripcion
      Left = 67
      Top = 80
      Width = 269
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      inherited cmbDescripcion: TComboGrid
        Width = 206
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
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TB_CODIGO, TB_DESCRIPCION, TB_MODULO, TB_ESPECIAL1, TB_BA' +
        'JA, TC_NOMBRE TEXTO,'
      '       TB_USUALTA, TRUNC(TB_FECHAALTA) TB_FECHAALTA'
      'FROM CTB_TABLAS, CTC_TEXTOCARTA, CTA_TEXTOAREA'
      'WHERE TB_CLAVE = :pClave'
      'AND (TB_MODULO = :pModulo OR :pModulo IS NULL)'
      'AND TB_CODIGO <> '#39'0'#39' '
      'AND TA_ID (+)= TB_ESPECIAL1'
      'AND TA_IDTEXTOCARTA = TC_ID (+)'
      ' ')
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'TB_CODIGO'
      end
      item
        DataField = 'TB_DESCRIPCION'
      end
      item
        DataField = 'TB_ESPECIAL1'
      end>
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
