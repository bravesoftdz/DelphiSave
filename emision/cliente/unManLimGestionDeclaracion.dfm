inherited ManLimGestionDeclaracion: TManLimGestionDeclaracion
  Left = 199
  Top = 104
  Width = 704
  Height = 563
  Caption = 'Mantenimiento de L'#237'mites de Gesti'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 696
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 696
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 692
      end>
    inherited ToolBar: TToolBar
      Width = 679
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 696
    Height = 506
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'LG_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lg_desde'
        Title.Caption = 'Desde'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lg_hasta'
        Title.Caption = 'Hasta'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipotam'
        Title.Caption = 'Tipo Tama'#241'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lg_variacionmasa'
        Title.Caption = 'Var. Masa'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lg_variaciontrabajadores'
        Title.Caption = 'Var. Trabajadores'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipovar'
        Title.Caption = 'Tipo Variaci'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipoproc'
        PickList.Strings = (
          '')
        Title.Caption = 'Tipo Proceso'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fuente'
        Title.Caption = 'Fuente Comparaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lg_idobservacion'
        Visible = False
      end
      item
        Expanded = False
        Visible = False
      end
      item
        Expanded = False
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 160
    Width = 441
    Height = 233
    inherited BevelAbm: TBevel
      Top = 197
      Width = 433
    end
    object lblTipo: TLabel [1]
      Left = 10
      Top = 34
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Tama'#241'o'
      FocusControl = cboTipoTamanio
    end
    object lblDesde: TLabel [2]
      Left = 10
      Top = 10
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
      FocusControl = iedDesde
    end
    object lblHasta: TLabel [3]
      Left = 287
      Top = 10
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
      FocusControl = iedHasta
    end
    object lblVariacionMasa: TLabel [4]
      Left = 10
      Top = 61
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Variaci'#243'n Masa'
      FocusControl = iedVariacionMasa
    end
    object lblTrabajadores: TLabel [5]
      Left = 254
      Top = 59
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Trabajadores'
      FocusControl = iedTrabajadores
    end
    object lblTipoProceso: TLabel [6]
      Left = 10
      Top = 84
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Proceso'
      FocusControl = cboTipoProceso
    end
    object lblProcesoVariacion: TLabel [7]
      Left = 10
      Top = 109
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Variaci'#243'n'
      FocusControl = cboTipoVariacion
    end
    object lblFuenteComparacion: TLabel [8]
      Left = 10
      Top = 136
      Width = 98
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fuente Comparaci'#243'n'
      FocusControl = cboFuenteComparacion
    end
    object lblObservacion: TLabel [9]
      Left = 12
      Top = 165
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observaci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 283
      Top = 203
      TabOrder = 9
    end
    inherited btnCancelar: TButton
      Left = 361
      Top = 203
      TabOrder = 10
    end
    object cboTipoTamanio: TComboBox
      Left = 111
      Top = 31
      Width = 311
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = cboTipoTamanioChange
      Items.Strings = (
        'Masa'
        'Trabajadores')
    end
    object cboTipoProceso: TComboBox
      Left = 111
      Top = 81
      Width = 311
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        'Manual'
        'Autom'#225'tico'
        'Indistinto')
    end
    object cboTipoVariacion: TComboBox
      Left = 111
      Top = 106
      Width = 311
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      Items.Strings = (
        '% Porcentual'
        'Valor')
    end
    object cboFuenteComparacion: TComboBox
      Left = 111
      Top = 133
      Width = 311
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      Items.Strings = (
        #218'ltima'
        #218'ltima Per'#237'odo Anterior')
    end
    object iedDesde: TIntEdit
      Left = 111
      Top = 7
      Width = 100
      Height = 21
      TabOrder = 0
    end
    object iedHasta: TIntEdit
      Left = 321
      Top = 7
      Width = 100
      Height = 21
      TabOrder = 1
    end
    object iedVariacionMasa: TIntEdit
      Left = 111
      Top = 56
      Width = 100
      Height = 21
      TabOrder = 3
    end
    object iedTrabajadores: TIntEdit
      Left = 321
      Top = 56
      Width = 100
      Height = 21
      TabOrder = 4
    end
    inline fraObservacion: TfraCodigoDescripcion
      Left = 111
      Top = 158
      Width = 311
      Height = 23
      TabOrder = 8
      inherited cmbDescripcion: TArtComboBox
        Width = 246
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT lg_id, lg_desde, lg_hasta, lg_tipotamanio, lg_variacionma' +
        'sa,'
      '       lg_variaciontrabajadores, lg_proceso, lg_tipovariacion,'
      
        '       lg_fuentecomparacion, lg_idobservacion, lg_usualta, lg_fe' +
        'chaalta,'
      '       lg_usubaja, lg_fechabaja,'
      '       CASE'
      '         WHEN lg_tipotamanio = '#39'M'#39
      '           THEN '#39'Masa'#39
      '         ELSE '#39'Trabajadores'#39
      '       END AS tipotam,'
      '       CASE'
      '         WHEN lg_tipovariacion = '#39'P'#39
      '           THEN '#39'Porcentual'#39
      '         ELSE '#39'Valor'#39
      '       END AS tipovar,'
      '       CASE'
      '         WHEN lg_fuentecomparacion = '#39'U'#39
      '           THEN '#39#218'ltima'#39
      '         ELSE '#39#218'ltima Per'#237'odo Ant.'#39
      '       END AS fuente,'
      '       CASE'
      '         WHEN lg_proceso = '#39'M'#39
      '           THEN '#39'Manual'#39
      '         ELSE CASE'
      '         WHEN lg_proceso = '#39'A'#39
      '           THEN '#39'Autom'#225'tico'#39
      '         ELSE '#39'Indistinto'#39
      '       END'
      '       END AS tipoproc'
      '  FROM emi.ilg_limitegestiondeclaracion')
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        MaxLength = 0
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
