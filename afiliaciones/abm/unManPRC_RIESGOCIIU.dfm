inherited frmManPRC_RIESGOCIIU: TfrmManPRC_RIESGOCIIU
  Left = 250
  Top = 110
  Width = 631
  Caption = 'Categorizaci'#243'n Riesgo por CIIU'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 623
    Height = 85
    Visible = True
    object GroupBox2: TGroupBox
      Left = 4
      Top = 0
      Width = 605
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        605
        41)
      object Label1: TLabel
        Left = 4
        Top = 16
        Width = 69
        Height = 13
        Caption = 'Cod. Actividad'
      end
      inline fraActividadFiltro: TfraActividad
        Left = 76
        Top = 10
        Width = 521
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 472
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 4
      Top = 40
      Width = 217
      Height = 41
      TabOrder = 1
      DesignSize = (
        217
        41)
      object Vigencia: TLabel
        Left = 8
        Top = 16
        Width = 92
        Height = 13
        Caption = 'Fecha  de Vigencia'
      end
      object edVigenciaFiltro: TDateComboBox
        Left = 108
        Top = 12
        Width = 105
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 85
    Width = 623
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 619
      end>
    inherited ToolBar: TToolBar
      Width = 606
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 114
    Width = 623
    Height = 325
    Columns = <
      item
        Expanded = False
        FieldName = 'ac_codigo'
        Title.Caption = 'Codigo'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ac_descripcion'
        Title.Caption = 'Actividad'
        Width = 234
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_nivelriesgo'
        Title.Caption = 'Nivel de Riesgo'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_fechadesde'
        Title.Caption = 'Fecha Desde'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_fechahasta'
        Title.Caption = 'Fecha Hasta'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_usumodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rc_fechamodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 113
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 88
    Top = 192
    Width = 501
    Height = 145
    Constraints.MaxHeight = 145
    Constraints.MaxWidth = 501
    Constraints.MinHeight = 145
    Constraints.MinWidth = 501
    inherited BevelAbm: TBevel
      Top = 109
      Width = 493
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 84
      Width = 108
      Height = 13
      Caption = 'Fecha Vigencia Desde'
    end
    object Label3: TLabel [2]
      Left = 240
      Top = 84
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label5: TLabel [3]
      Left = 40
      Top = 56
      Width = 75
      Height = 13
      Caption = 'Nivel de Riesgo'
    end
    inherited btnAceptar: TButton
      Left = 343
      Top = 115
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 421
      Top = 115
      TabOrder = 5
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 493
      Height = 43
      Constraints.MaxHeight = 43
      Constraints.MaxWidth = 493
      Constraints.MinHeight = 43
      Constraints.MinWidth = 493
      TabOrder = 0
      DesignSize = (
        493
        43)
      object Label4: TLabel
        Left = 4
        Top = 20
        Width = 69
        Height = 13
        Caption = 'Cod. Actividad'
      end
      inline fraActividad: TfraActividad
        Left = 76
        Top = 14
        Width = 413
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 364
        end
      end
    end
    object edFechaDesde: TDateComboBox
      Left = 120
      Top = 80
      Width = 105
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object edFechaHasta: TDateComboBox
      Left = 272
      Top = 80
      Width = 105
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    object edRiesgo: TIntEdit
      Left = 120
      Top = 52
      Width = 80
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '1'
      Alignment = taRightJustify
      Value = 1
    end
  end
end
