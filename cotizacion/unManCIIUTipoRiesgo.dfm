inherited frmManCIIUTipoRiesgo: TfrmManCIIUTipoRiesgo
  Left = 271
  Top = 127
  Width = 624
  Height = 398
  Caption = 'Mantenimiento | CIIU Tipo de Riesgo'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 616
  end
  inherited CoolBar: TCoolBar
    Width = 616
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 612
      end>
    inherited ToolBar: TToolBar
      Width = 599
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      object tbImportarTiposRiesgo: TToolButton
        Left = 370
        Top = 0
        Hint = 'Importar Tipos de Riesgo'
        Caption = 'tbImportarTiposRiesgo'
        ImageIndex = 21
        OnClick = tbImportarTiposRiesgoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 616
    Height = 297
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n de la actividad'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tr_detalle'
        Title.Caption = 'Tipo de Riesgo'
        Width = 147
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'AC_AUTOCOTIZA'
        Title.Alignment = taRightJustify
        Title.Caption = '# Trabajadores Autocotizable'
        Width = 148
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 64
    Top = 116
    Width = 360
    Height = 120
    Caption = 'Tipo de Riesgo'
    inherited BevelAbm: TBevel
      Top = 84
      Width = 352
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 22
      Height = 13
      Caption = 'CIIU'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 36
      Width = 70
      Height = 13
      Caption = 'Tipo de Riesgo'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 60
      Width = 183
      Height = 13
      Caption = 'Cantidad Trabajadores Autocotizables'
    end
    inherited btnAceptar: TButton
      Left = 200
      Top = 90
      Width = 72
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 280
      Top = 90
      Width = 72
      TabOrder = 3
    end
    inline fraTipoRiesgo: TfraCodDesc
      Left = 80
      Top = 32
      Width = 272
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 62
        Width = 210
      end
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'tr_fechabaja'
        FieldCodigo = 'tr_id'
        FieldDesc = 'tr_detalle'
        FieldID = 'tr_id'
        IdType = ctInteger
        TableName = 'afi.atr_tiporiesgociiu'
      end
    end
    inline fraCiiu: TfraStaticActividad
      Left = 80
      Top = 8
      Width = 272
      Height = 23
      TabOrder = 4
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 209
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
    object edAutocotizables: TIntEdit
      Left = 272
      Top = 56
      Width = 80
      Height = 21
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ac_id, ac_codigo, ac_descripcion, ac_idtiporiesgo, tr_det' +
        'alle'
      '  FROM cac_actividad, afi.atr_tiporiesgociiu'
      ' WHERE ac_idtiporiesgo = tr_id(+)')
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
