inherited frmManLimiteMicroPyme: TfrmManLimiteMicroPyme
  Left = 395
  Top = 154
  Caption = 'Mantenimiento del L'#237'mite Micro Pyme'
  ClientHeight = 427
  ClientWidth = 752
  Constraints.MinHeight = 457
  Constraints.MinWidth = 609
  Font.Name = 'Tahoma'
  ExplicitLeft = 395
  ExplicitTop = 154
  ExplicitWidth = 760
  ExplicitHeight = 457
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 752
    Height = 48
    Visible = True
    ExplicitWidth = 752
    ExplicitHeight = 48
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
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 488
        inherited cmbDescripcion: TArtComboBox
          Width = 423
          ExplicitWidth = 423
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
        Width = 746
      end>
    ExplicitTop = 48
    ExplicitWidth = 752
    inherited ToolBar: TToolBar
      Width = 737
      ButtonHeight = 104
      ExplicitWidth = 737
      inherited tbRefrescar: TToolButton
        ExplicitHeight = 104
      end
      inherited ToolButton5: TToolButton
        ExplicitHeight = 104
      end
      inherited tbNuevo: TToolButton
        ExplicitHeight = 104
      end
      inherited tbModificar: TToolButton
        ExplicitHeight = 104
      end
      inherited tbEliminar: TToolButton
        ExplicitHeight = 104
      end
      inherited ToolButton4: TToolButton
        ExplicitHeight = 104
      end
      inherited tbPropiedades: TToolButton
        ExplicitHeight = 104
      end
      inherited ToolButton3: TToolButton
        ExplicitHeight = 104
      end
      inherited tbLimpiar: TToolButton
        Visible = True
        ExplicitHeight = 104
      end
      inherited tbOrdenar: TToolButton
        ExplicitHeight = 104
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ExplicitHeight = 104
      end
      inherited ToolButton6: TToolButton
        ExplicitHeight = 104
      end
      inherited tbImprimir: TToolButton
        ExplicitHeight = 104
      end
      inherited tbExportar: TToolButton
        ExplicitHeight = 104
      end
      inherited tbEnviarMail: TToolButton
        ExplicitHeight = 104
      end
      inherited ToolButton8: TToolButton
        ExplicitHeight = 104
      end
      inherited tbMostrarFiltros: TToolButton
        ExplicitHeight = 104
      end
      inherited tbMaxRegistros: TToolButton
        ExplicitHeight = 104
      end
      inherited ToolButton11: TToolButton
        ExplicitHeight = 104
      end
      inherited tbSalir: TToolButton
        ExplicitHeight = 104
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 77
    Width = 752
    Height = 350
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
        FieldName = 'lm_fechadesde'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Desde'
        Width = 89
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'lm_fechahasta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Hasta'
        Width = 92
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'lm_maximo'
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
    Caption = 'L'#237'mite Micro Pyme'
    BorderStyle = bsDialog
    ExplicitLeft = 50
    ExplicitTop = 158
    ExplicitWidth = 520
    ExplicitHeight = 176
    inherited BevelAbm: TBevel
      Top = 140
      Width = 512
      ExplicitTop = 140
      ExplicitWidth = 512
    end
    inherited btnAceptar: TButton
      Left = 360
      Top = 146
      Width = 72
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      ExplicitLeft = 360
      ExplicitTop = 146
      ExplicitWidth = 72
    end
    inherited btnCancelar: TButton
      Left = 440
      Top = 146
      Width = 72
      TabOrder = 4
      ExplicitLeft = 440
      ExplicitTop = 146
      ExplicitWidth = 72
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
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 488
        inherited cmbDescripcion: TArtComboBox
          Width = 423
          ExplicitWidth = 423
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
      Height = 44
      Caption = ' L'#237'mite '
      TabOrder = 2
      object Label5: TLabel
        Left = 8
        Top = 20
        Width = 36
        Height = 13
        Caption = 'M'#225'ximo'
      end
      object edLimiteMaximo: TCurrencyEdit
        Left = 49
        Top = 16
        Width = 88
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = ',0.00 %;-,0.00 %'
        MaxValue = 100.000000000000000000
        TabOrder = 0
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
