inherited frmCiiusSuspendidosAutomaticamente: TfrmCiiusSuspendidosAutomaticamente
  Left = 343
  Top = 110
  Width = 784
  Height = 572
  Caption = 'CIIUs Suspendidos Autom'#225'ticamente'
  Constraints.MinHeight = 360
  Constraints.MinWidth = 600
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar [0]
    Top = 101
    Width = 776
    Height = 32
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 772
      end>
    inherited ToolBar: TToolBar
      Width = 759
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid [1]
    Top = 133
    Width = 776
    Height = 412
    Columns = <
      item
        Expanded = False
        FieldName = 'ciiu'
        Title.Caption = 'CIIU'
        Width = 188
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'cu_capitas'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#225'pitas'
        Width = 53
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cu_fechadesde'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Vigencia Desde'
        Width = 135
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cu_fechahasta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Vigencia Hasta'
        Width = 121
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechamodif'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Modificaci'#243'n'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usumodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 108
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel [2]
    Left = 140
    Top = 200
    Width = 520
    Height = 224
    Caption = 'CIIU Suspendido Autom'#225'ticamente'
    BorderStyle = bsDialog
    OnShow = fpAbmShow
    ActiveControl = fraCiiu.edCodigo
    inherited BevelAbm: TBevel
      Top = 188
      Width = 512
    end
    object lbFactor: TLabel [1]
      Left = 8
      Top = 12
      Width = 21
      Height = 13
      Caption = 'CIIU'
    end
    object lbValor: TLabel [2]
      Left = 8
      Top = 36
      Width = 35
      Height = 13
      Caption = 'C'#225'pitas'
    end
    object lbFechaVigencia: TLabel [3]
      Left = 8
      Top = 60
      Width = 108
      Height = 13
      Caption = 'Fecha Vigencia Desde'
    end
    object Label2: TLabel [4]
      Left = 8
      Top = 84
      Width = 105
      Height = 13
      Caption = 'Fecha Vigencia Hasta'
    end
    object Label3: TLabel [5]
      Left = 8
      Top = 108
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    inherited btnAceptar: TButton
      Left = 360
      Top = 194
      Width = 72
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 440
      Top = 194
      Width = 72
      TabOrder = 6
    end
    object edFechaVigenciaDesde: TDateComboBox
      Left = 120
      Top = 56
      Width = 88
      Height = 21
      TabOrder = 2
    end
    inline fraCiiu: TfraStaticActividad
      Left = 120
      Top = 8
      Width = 392
      Height = 23
      TabOrder = 0
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 329
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
    object edCapitas: TIntEdit
      Left = 120
      Top = 32
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edFechaVigenciaHasta: TDateComboBox
      Left = 120
      Top = 80
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object memoObservaciones: TMemo
      Left = 120
      Top = 104
      Width = 392
      Height = 72
      Lines.Strings = (
        '11111'
        '222'
        '3333'
        '44444'
        '55555555')
      ScrollBars = ssVertical
      TabOrder = 4
    end
  end
  inherited pnlFiltros: TPanel [3]
    Width = 776
    Height = 101
    Visible = True
    object gbVigenciaFiltro: TGroupBox
      Left = 4
      Top = 49
      Width = 228
      Height = 48
      Caption = ' Fecha Vigencia '
      TabOrder = 1
      object Label1: TLabel
        Left = 104
        Top = 20
        Width = 18
        Height = 13
        Caption = ' >> '
      end
      object edFechaVigenciaDesdeFiltro: TDateComboBox
        Left = 12
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaVigenciaHastaFiltro: TDateComboBox
        Left = 128
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbFactorFiltro: TGroupBox
      Left = 4
      Top = 0
      Width = 770
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = ' CIIU '
      TabOrder = 0
      DesignSize = (
        770
        48)
      inline fraCiiuFiltro: TfraStaticActividad
        Left = 12
        Top = 16
        Width = 748
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 685
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
  end
  inherited sdqConsulta: TSDQuery
    Top = 172
  end
  inherited dsConsulta: TDataSource
    Top = 172
  end
  inherited SortDialog: TSortDialog
    Top = 200
  end
  inherited ExportDialog: TExportDialog
    Top = 200
  end
  inherited QueryPrint: TQueryPrint
    Top = 228
  end
  inherited Seguridad: TSeguridad
    Top = 144
  end
  inherited FormStorage: TFormStorage
    Top = 144
  end
  inherited PrintDialog: TPrintDialog
    Top = 228
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
    Top = 144
  end
  inherited FieldHider: TFieldHider
    Top = 172
  end
end
