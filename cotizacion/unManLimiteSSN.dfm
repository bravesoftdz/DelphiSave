inherited frmManLimiteSSN: TfrmManLimiteSSN
  Left = 384
  Top = 148
  Width = 760
  Height = 457
  Caption = 'Mantenimiento del L'#237'mite SSN'
  Constraints.MinHeight = 457
  Constraints.MinWidth = 609
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 752
    Height = 48
    Visible = True
    object GroupBox8: TGroupBox
      Left = 527
      Top = 0
      Width = 224
      Height = 44
      Anchors = [akTop, akRight]
      Caption = ' Vigencia '
      TabOrder = 1
      object Label12: TLabel
        Left = 98
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edVigenciaDesdeBusqueda: TDateComboBox
        Left = 6
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edVigenciaHastaBusqueda: TDateComboBox
        Left = 130
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 0
      Width = 519
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Actividad '
      TabOrder = 0
      inline fraActividadBusqueda: TfraCodDesc
        Left = 8
        Top = 14
        Width = 488
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 423
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = 'AND LENGTH(ac_codigo) = 1'
          FieldBaja = 'ac_fechabaja'
          FieldCodigo = 'ac_codigo'
          FieldDesc = 'ac_descripcion'
          FieldID = 'ac_id'
          IdType = ctInteger
          ShowBajas = True
          TableName = 'cac_actividad'
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 48
    Width = 752
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 748
      end>
    inherited ToolBar: TToolBar
      Width = 735
      ButtonHeight = 104
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 77
    Width = 752
    Height = 353
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ac_codigo'
        Title.Alignment = taCenter
        Title.Caption = 'CIIU'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ac_descripcion'
        Title.Caption = 'Actividad'
        Width = 288
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ls_fechadesde'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Desde'
        Width = 89
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ls_fechahasta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Hasta'
        Width = 92
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ls_minimo'
        Title.Alignment = taRightJustify
        Title.Caption = 'M'#237'nimo'
        Width = 78
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ls_maximo'
        Title.Alignment = taRightJustify
        Title.Caption = 'M'#225'ximo'
        Width = 88
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 50
    Top = 158
    Width = 520
    Height = 176
    Caption = 'L'#237'mite SSN'
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 140
      Width = 512
    end
    inherited btnAceptar: TButton
      Left = 360
      Top = 146
      Width = 72
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 440
      Top = 146
      Width = 72
      TabOrder = 4
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 8
      Width = 504
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Actividad '
      TabOrder = 0
      inline fraActividad: TfraCodDesc
        Left = 8
        Top = 14
        Width = 488
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 423
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = 'AND LENGTH(ac_codigo) = 1'
          FieldBaja = 'ac_fechabaja'
          FieldCodigo = 'ac_codigo'
          FieldDesc = 'ac_descripcion'
          FieldID = 'ac_id'
          IdType = ctInteger
          ShowBajas = True
          TableName = 'cac_actividad'
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 56
      Width = 144
      Height = 72
      Anchors = [akTop, akRight]
      Caption = ' Vigencia '
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 44
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object Label3: TLabel
        Left = 8
        Top = 18
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object edVigenciaDesde: TDateComboBox
        Left = 48
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edVigenciaHasta: TDateComboBox
        Left = 48
        Top = 40
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 160
      Top = 56
      Width = 152
      Height = 72
      Caption = ' L'#237'mite '
      TabOrder = 2
      object Label4: TLabel
        Left = 8
        Top = 18
        Width = 32
        Height = 13
        Caption = 'M'#237'nimo'
      end
      object Label5: TLabel
        Left = 8
        Top = 44
        Width = 36
        Height = 13
        Caption = 'M'#225'ximo'
      end
      object edLimiteMinimo: TCurrencyEdit
        Left = 49
        Top = 14
        Width = 88
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00 %;-,0.00 %'
        MaxValue = 100.000000000000000000
        TabOrder = 0
      end
      object edLimiteMaximo: TCurrencyEdit
        Left = 49
        Top = 40
        Width = 88
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00 %;-,0.00 %'
        MaxValue = 100.000000000000000000
        TabOrder = 1
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    Left = 20
    Top = 298
  end
  inherited dsConsulta: TDataSource
    Left = 48
    Top = 298
  end
  inherited SortDialog: TSortDialog
    Left = 20
    Top = 326
  end
  inherited ExportDialog: TExportDialog
    Left = 48
    Top = 326
  end
  inherited QueryPrint: TQueryPrint
    Left = 48
    Top = 354
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 19
    Top = 270
  end
  inherited FormStorage: TFormStorage
    Version = 1
    Left = 48
    Top = 270
  end
  inherited PrintDialog: TPrintDialog
    Left = 20
    Top = 354
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
    Left = 76
    Top = 270
  end
  inherited FieldHider: TFieldHider
    Left = 76
    Top = 298
  end
end
