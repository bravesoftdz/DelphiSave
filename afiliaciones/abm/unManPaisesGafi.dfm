inherited frmManPaisesGafi: TfrmManPaisesGafi
  Left = 921
  Top = 335
  Width = 500
  Caption = 'GAFI - Pa'#237'ses con deficiencias en PLA'
  Constraints.MinWidth = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 492
    Height = 85
    Visible = True
    object Vigencia: TLabel
      Left = 4
      Top = 56
      Width = 41
      Height = 13
      Caption = 'Vigencia'
    end
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 22
      Height = 13
      Caption = 'Pa'#237's'
    end
    object Label6: TLabel
      Left = 8
      Top = 32
      Width = 22
      Height = 13
      Caption = 'Lista'
    end
    inline fraFiltroPais: TfraCodigoDescripcion
      Left = 51
      Top = 4
      Width = 339
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 274
        CharCase = ecUpperCase
      end
    end
    object cboxFiltroColores: TComboBox
      Left = 52
      Top = 28
      Width = 337
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object edVigenciaFiltro: TDateComboBox
      Left = 52
      Top = 52
      Width = 105
      Height = 21
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 85
    Width = 492
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 488
      end>
    inherited ToolBar: TToolBar
      Width = 475
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 114
    Width = 492
    Height = 326
    Columns = <
      item
        Expanded = False
        FieldName = 'pd_id'
        Title.Caption = 'Nro.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pa_descripcion'
        Title.Caption = 'Pa'#237's'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pd_color'
        Title.Caption = 'Lista'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pd_desde'
        Title.Caption = 'Vig. Desde'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pd_hasta'
        Title.Caption = 'Vig. Hasta'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pd_usualta'
        Title.Caption = 'Usu. Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pd_fechaalta'
        Title.Caption = 'Fecha alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pd_usumodif'
        Title.Caption = 'Usu. Modif.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pd_fechamodif'
        Title.Caption = 'Fecha modif.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pd_usubaja'
        Title.Caption = 'Usu. Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pd_fechabaja'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 12
    Top = 104
    Height = 137
    inherited BevelAbm: TBevel
      Top = 101
    end
    object Label1: TLabel [1]
      Left = 248
      Top = 64
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 64
      Width = 108
      Height = 13
      Caption = 'Fecha Vigencia Desde'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 20
      Width = 22
      Height = 13
      Caption = 'Pa'#237's'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 40
      Width = 22
      Height = 13
      Caption = 'Lista'
    end
    inherited btnAceptar: TButton
      Top = 107
    end
    inherited btnCancelar: TButton
      Top = 107
    end
    inline fraPais: TfraCodigoDescripcion
      Left = 51
      Top = 12
      Width = 338
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 275
        CharCase = ecUpperCase
      end
    end
    object edFechaHasta: TDateComboBox
      Left = 284
      Top = 60
      Width = 105
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    object edFechaDesde: TDateComboBox
      Left = 128
      Top = 60
      Width = 105
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
    end
    object cboxColores: TComboBox
      Left = 52
      Top = 36
      Width = 337
      Height = 21
      ItemHeight = 13
      TabOrder = 5
    end
  end
end
