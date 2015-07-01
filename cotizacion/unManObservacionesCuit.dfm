inherited frmManObservacionesCuit: TfrmManObservacionesCuit
  Left = 382
  Top = 114
  Caption = 'Mantenimiento | Observaciones por C.U.I.T.'
  ClientHeight = 450
  ClientWidth = 792
  ExplicitLeft = 382
  ExplicitTop = 114
  ExplicitWidth = 800
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    ExplicitWidth = 630
  end
  inherited CoolBar: TCoolBar
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 786
      end>
    ExplicitWidth = 792
    inherited ToolBar: TToolBar
      Width = 777
      ExplicitWidth = 777
      inherited ToolButton11: TToolButton
        Width = 10
        ExplicitWidth = 10
      end
      inherited tbSalir: TToolButton
        Left = 349
        ExplicitLeft = 349
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 792
    Height = 376
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'C.U.I.T.'
        Width = 126
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'oc_fechadesde'
        Title.Alignment = taCenter
        Title.Caption = 'Vigencia Desde'
        Width = 103
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'oc_fechahasta'
        Title.Alignment = taCenter
        Title.Caption = 'Vigencia Hasta'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'oc_observacion'
        Title.Caption = 'Observaciones'
        Width = 371
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usumodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 107
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechamodif'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Modificaci'#243'n'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'oc_usubaja'
        Title.Caption = 'Usuario Baja'
        Width = 81
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'oc_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 82
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 223
    Top = 152
    Width = 320
    Height = 248
    OnShow = fpAbmShow
    ActiveControl = edCuit
    Constraints.MaxHeight = 400
    Constraints.MaxWidth = 600
    ExplicitLeft = 223
    ExplicitTop = 152
    ExplicitWidth = 320
    ExplicitHeight = 248
    inherited BevelAbm: TBevel
      Top = 196
      Width = 312
      ExplicitTop = 196
      ExplicitWidth = 312
    end
    object lbEntidad: TLabel [1]
      Left = 8
      Top = 12
      Width = 37
      Height = 13
      Caption = 'C.U.I.T.'
    end
    object Label1: TLabel [2]
      Left = 8
      Top = 98
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    inherited btnAceptar: TButton
      Left = 155
      Top = 210
      Width = 72
      TabOrder = 3
      ExplicitLeft = 152
      ExplicitTop = 199
      ExplicitWidth = 72
    end
    inherited btnCancelar: TButton
      Left = 235
      Top = 210
      Width = 72
      TabOrder = 4
      ExplicitLeft = 232
      ExplicitTop = 199
      ExplicitWidth = 72
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 31
      Width = 304
      Height = 61
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Vigencia '
      TabOrder = 1
      ExplicitWidth = 301
      DesignSize = (
        304
        61)
      object lbDesde: TLabel
        Left = 12
        Top = 28
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object lbHasta: TLabel
        Left = 167
        Top = 28
        Width = 28
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Hasta'
        ExplicitLeft = 164
      end
      object edHasta: TDateComboBox
        Left = 201
        Top = 24
        Width = 88
        Height = 21
        TabOrder = 1
      end
      object edDesde: TDateComboBox
        Left = 49
        Top = 24
        Width = 88
        Height = 21
        TabOrder = 0
      end
    end
    object memoObservaciones: TMemo
      Left = 8
      Top = 117
      Width = 304
      Height = 72
      Lines.Strings = (
        '111'
        '222'
        '333'
        '444'
        '555')
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object edCuit: TMaskEdit
      Left = 52
      Top = 8
      Width = 88
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 0
    end
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
