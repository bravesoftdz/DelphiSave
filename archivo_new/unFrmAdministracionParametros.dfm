inherited frmAdministracionParametros: TfrmAdministracionParametros
  Left = 92
  Top = 97
  Width = 600
  Height = 400
  Caption = 'Administraci'#243'n de Par'#225'metros'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 0
    Visible = True
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited ToolButton4: TToolButton
        Enabled = False
      end
      inherited tbPropiedades: TToolButton
        Enabled = False
      end
      inherited ToolButton3: TToolButton
        Enabled = False
      end
      inherited tbLimpiar: TToolButton
        Enabled = False
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Enabled = False
      end
      inherited ToolButton6: TToolButton
        Enabled = False
      end
      inherited ToolButton8: TToolButton
        Enabled = False
      end
      inherited tbMostrarFiltros: TToolButton
        Enabled = False
      end
      inherited tbMaxRegistros: TToolButton
        Enabled = False
      end
      inherited ToolButton11: TToolButton
        Enabled = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 29
    Width = 592
    Height = 325
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Name = 'Tahoma'
    TitleHeight = 30
    Columns = <
      item
        Expanded = False
        FieldName = 'PA_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 288
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_TIPO'
        Title.Caption = 'Tipo Par'#225'metro'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_VALOR'
        Title.Caption = 'Valor'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_USUMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_FECHAMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_FECHABAJA'
        Visible = False
      end>
  end
  object sb: TStatusBar [3]
    Left = 0
    Top = 354
    Width = 592
    Height = 19
    Panels = <>
  end
  inherited fpAbm: TFormPanel
    Top = 140
    Width = 450
    Height = 120
    Constraints.MinHeight = 120
    Constraints.MinWidth = 450
    inherited BevelAbm: TBevel
      Top = 84
      Width = 442
    end
    object lblDescripcion: TLabel [1]
      Left = 6
      Top = 11
      Width = 58
      Height = 13
      Caption = 'Descripci'#243'n:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited btnAceptar: TButton
      Left = 292
      Top = 90
      Default = True
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 370
      Top = 90
      TabOrder = 3
    end
    object edtDescripcionParametro: TEdit
      Left = 100
      Top = 8
      Width = 341
      Height = 21
      Hint = 'Descripci'#243'n del Par'#225'metro'
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Color = clWhite
      TabOrder = 0
    end
    inline fraParametro: TfraParametroValor
      Left = 6
      Top = 31
      Width = 439
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        439
        48)
      inherited fraTipoDatoParametro: TfraCodigoDescripcionExt
        Left = 93
        Width = 344
        DesignSize = (
          344
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 279
          DataSource = nil
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT pa_id, pa_descripcion, pa_tipo, pa_valor, pa_usualta,'
      '       pa_fechaalta, pa_usubaja, pa_fechabaja, pa_usumodif,'
      '       pa_fechamodif'
      '  FROM rpa_parametro'
      '')
    Left = 16
    Top = 100
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 100
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 128
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 128
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    Left = 44
    Top = 156
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 72
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 72
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 156
  end
  inherited ShortCutControl: TShortCutControl
    Left = 72
    Top = 72
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 100
  end
  object ShortCutControl1: TShortCutControl
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
    Left = 104
    Top = 72
  end
end
