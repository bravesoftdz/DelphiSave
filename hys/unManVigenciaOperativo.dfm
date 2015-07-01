inherited frmManVigenciaOperativo: TfrmManVigenciaOperativo
  Left = 286
  Top = 277
  Caption = 'Mantenimiento Vigencia Operativo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'VO_OPERATIVO'
        Title.Caption = 'Operativo'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_TIPO'
        Title.Caption = 'Tipo'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_VIGENCIADESDE'
        Title.Caption = 'Vigencia Desde'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_VIGENCIAHASTA'
        Title.Caption = 'Vigencia Hasta'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_MUESTRA'
        Title.Caption = 'Muestra'
        Width = 79
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 325
    Height = 177
    inherited BevelAbm: TBevel
      Top = 141
      Width = 317
    end
    object lbOperativo: TLabel [1]
      Left = 8
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Operativo: '
    end
    object lbTipo: TLabel [2]
      Left = 8
      Top = 36
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 120
      Width = 38
      Height = 13
      Caption = 'Muestra'
    end
    inherited btnAceptar: TButton
      Left = 167
      Top = 147
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 245
      Top = 147
      TabOrder = 4
    end
    object Vigencia: TGroupBox
      Left = 3
      Top = 55
      Width = 321
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Vigencia'
      TabOrder = 2
      object Label1: TLabel
        Left = 15
        Top = 26
        Width = 34
        Height = 13
        Caption = 'Desde:'
      end
      object Label2: TLabel
        Left = 166
        Top = 26
        Width = 31
        Height = 13
        Caption = 'Hasta:'
      end
      object edVigenciaDesde: TDateComboBox
        Left = 53
        Top = 23
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edVigenciaHasta: TDateComboBox
        Left = 201
        Top = 23
        Width = 89
        Height = 21
        TabOrder = 1
      end
    end
    object cbTipo: TExComboBox
      Left = 78
      Top = 31
      Width = 152
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
      Items.Strings = (
        'GB= GB'
        'CO= CO'
        'ET= ET'
        'EP= EP'
        'EAS=EAS')
      ItemIndex = -1
      Options = [coShowValues, coGridLines]
      ValueWidth = 64
    end
    object edOperativo: TIntEdit
      Left = 80
      Top = 4
      Width = 147
      Height = 21
      TabOrder = 0
      AutoExit = True
      MaxLength = 6
    end
    object edMuestra: TIntEdit
      Left = 80
      Top = 116
      Width = 147
      Height = 21
      TabOrder = 5
      AutoExit = True
      MaxLength = 6
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'select *'
      'from hys.hvo_vigenciaoperativo'
      'where vo_tipo not in ('#39'CO'#39','#39'GB'#39')')
  end
end
