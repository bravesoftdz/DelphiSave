inherited FrmManParametros: TFrmManParametros
  Left = 179
  Top = 165
  Width = 564
  Height = 289
  Caption = 'Mantenimiento de Par'#225'metros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 556
    Height = 0
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 556
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 552
      end>
    inherited ToolBar: TToolBar
      Width = 539
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 29
    Width = 556
    Height = 233
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'PA_ID'
        Title.Caption = 'C'#243'd.'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_TIPO'
        Title.Caption = 'Tipo Datos'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_VALOR'
        Title.Caption = 'Valor'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_CLAVE'
        Title.Caption = 'Clave'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 44
    Top = 48
    Height = 169
    inherited BevelAbm: TBevel
      Top = 133
    end
    object lblCodigo: TLabel [1]
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblDescripcion: TLabel [2]
      Left = 8
      Top = 40
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object lblTipoDato: TLabel [3]
      Left = 8
      Top = 68
      Width = 62
      Height = 13
      Caption = 'Tipo de Dato'
    end
    object lblValorActual: TLabel [4]
      Left = 8
      Top = 100
      Width = 57
      Height = 13
      Caption = 'Valor Actual'
    end
    inherited btnAceptar: TButton
      Top = 139
    end
    inherited btnCancelar: TButton
      Top = 139
    end
    object edParaCodigo: TPatternEdit
      Left = 104
      Top = 8
      Width = 121
      Height = 21
      Color = 16776176
      ReadOnly = True
      TabOrder = 2
      Pattern = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_'
    end
    object edParaDescripcion: TEdit
      Left = 104
      Top = 36
      Width = 349
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    inline fraParaTipoDato: TfraCtbTablas
      Left = 103
      Top = 64
      Width = 351
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Left = 44
        Width = 298
      end
      inherited edCodigo: TPatternEdit
        Width = 40
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT '
      '      lpa.pa_id, lpa.pa_descripcion, '
      
        '      lpa.pa_tipoparametro, TB_DESCRIPCION pa_tipo , lpa.pa_valo' +
        'r, lpa.pa_clave,'
      '      lpa.pa_fechaalta, lpa.pa_usualta,'
      '      lpa.pa_fechamodif, lpa.pa_usumodif,'
      '      lpa.pa_fechabaja, lpa.pa_usubaja'
      ''
      'FROM  legales.lpa_parametro lpa, CTB_TABLAS  '
      'WHERE TB_CLAVE = '#39'TDAT'#39' '
      '  AND TB_CODIGO = pa_tipoparametro'
      '')
  end
end
