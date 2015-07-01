inherited frmSiniestrosMarcados: TfrmSiniestrosMarcados
  Left = 219
  Top = 240
  Width = 771
  Height = 528
  Caption = 'Siniestros Marcados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 763
    Height = 95
    object gbEmpresa: TGroupBox
      Left = 0
      Top = 0
      Width = 593
      Height = 45
      Caption = 'Empresa'
      TabOrder = 0
      inline fraEmpresa1: TfraEmpresa
        Left = 12
        Top = 17
        Width = 566
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object gbFechaMarca: TGroupBox
      Left = 0
      Top = 45
      Width = 273
      Height = 45
      Caption = 'Fecha Marca'
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label2: TLabel
        Left = 138
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object cbFechaMarcaDesde: TDateComboBox
        Left = 41
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cbFechaMarcaHasta: TDateComboBox
        Left = 173
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbFechaDesmarca: TGroupBox
      Left = 276
      Top = 45
      Width = 273
      Height = 45
      Caption = 'Fecha Desmarca'
      TabOrder = 2
      object Label3: TLabel
        Left = 6
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 138
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object cbFechaDesmarcaDesde: TDateComboBox
        Left = 41
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cbFechaDesmarcaHasta: TDateComboBox
        Left = 173
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object rgActMarcado: TRadioGroup
      Left = 552
      Top = 45
      Width = 185
      Height = 45
      Caption = 'Actualmente Marcado'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 3
    end
    object gbSiniestro: TGroupBox
      Left = 596
      Top = 0
      Width = 141
      Height = 45
      Caption = 'Siniestro'
      TabOrder = 4
      object edSiniestro: TSinEdit
        Left = 10
        Top = 17
        Width = 115
        Height = 21
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 95
    Width = 763
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 759
      end>
    inherited ToolBar: TToolBar
      Width = 746
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 124
    Width = 763
    Height = 377
    Columns = <
      item
        Expanded = False
        FieldName = 'siniestro'
        Title.Caption = 'Siniestro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'orden'
        Title.Caption = 'Orden'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recaida'
        Title.Caption = 'Recaida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha_accidente'
        Title.Caption = 'Fecha Accidente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'contrato'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cuit'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'empresa'
        Title.Caption = 'Empresa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'marcado'
        Title.Caption = 'Marcado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'enf_no_listada'
        Title.Caption = 'Enf. No Listada'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hipoacusia'
        Title.Caption = 'Hipoacusia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha_marca'
        Title.Caption = 'Fecha Marca'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'obs_marca'
        Title.Caption = 'Obs. Marca'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha_desmarca'
        Title.Caption = 'Fecha Desmarca'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'obs_desmarca'
        Title.Caption = 'Obs. Desmarca'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tarea'
        Title.Caption = 'Tarea'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'enfermedad'
        Title.Caption = 'Enfermedad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'agente'
        Title.Caption = 'Agente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tj_nombre'
        Title.Caption = 'Trabajador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tj_cuil'
        Title.Caption = 'CUIL'
        Visible = True
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
