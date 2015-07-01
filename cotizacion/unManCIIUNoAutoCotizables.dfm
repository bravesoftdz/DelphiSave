inherited frmManCIIUNoAutoCotizables: TfrmManCIIUNoAutoCotizables
  Left = 418
  Top = 224
  Width = 477
  Height = 369
  Caption = 'Mantenimiento | CIIU sin permiso de auto-cotizaci'#243'n'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 469
  end
  inherited CoolBar: TCoolBar
    Width = 469
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 465
      end>
    inherited ToolBar: TToolBar
      Width = 452
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 469
    Height = 268
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
        Width = 353
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 152
    Top = 220
    Width = 285
    Height = 101
    OnBeforeShow = fpAbmBeforeShow
    inherited BevelAbm: TBevel
      Top = 65
      Width = 277
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    inherited btnAceptar: TButton
      Left = 130
      Top = 71
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 205
      Top = 71
    end
    inline fraCAC_ACTIVIDAD: TfraStaticActividad
      Left = 10
      Top = 31
      Width = 266
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TComboGrid
        Width = 203
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
      'SELECT AC_ID, AC_CODIGO, AC_DESCRIPCION, AC_COTIZABLE'
      '  FROM CAC_ACTIVIDAD'
      ' WHERE AC_COTIZABLE = '#39'N'#39)
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
