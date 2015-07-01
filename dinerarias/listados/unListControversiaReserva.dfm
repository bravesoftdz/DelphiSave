inherited frmListControversiaReserva: TfrmListControversiaReserva
  Left = 273
  Top = 171
  Width = 713
  Height = 419
  Caption = 'Listado de siniestros con controversia/reserva'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 705
    Height = 46
    object gbConcepto: TGroupBox
      Left = 2
      Top = 1
      Width = 215
      Height = 43
      Caption = ' Tipo '
      TabOrder = 0
      object rbTipoTodos: TRadioButton
        Left = 4
        Top = 20
        Width = 50
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbTipoReserva: TRadioButton
        Left = 146
        Top = 20
        Width = 63
        Height = 17
        Caption = 'Reserva'
        TabOrder = 1
      end
      object rbTipoControversia: TRadioButton
        Left = 58
        Top = 20
        Width = 81
        Height = 17
        Caption = 'Controversia'
        TabOrder = 2
      end
    end
    object gbFechaControversia: TGroupBox
      Left = 219
      Top = 1
      Width = 209
      Height = 43
      Caption = ' Fecha controversia/reserva '
      TabOrder = 1
      object Label1: TLabel
        Left = 98
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcContDesde: TDateComboBox
        Left = 7
        Top = 17
        Width = 88
        Height = 21
        MaxDateCombo = dcContHasta
        TabOrder = 0
      end
      object dcContHasta: TDateComboBox
        Left = 114
        Top = 17
        Width = 88
        Height = 21
        MinDateCombo = dcContDesde
        TabOrder = 1
      end
    end
    object gbSiniestro: TGroupBox
      Left = 431
      Top = 1
      Width = 137
      Height = 43
      Caption = ' Siniestro '
      TabOrder = 2
      object edSiniestro: TSinEdit
        Left = 8
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 571
      Top = 1
      Width = 131
      Height = 43
      Caption = ' Activos '
      TabOrder = 3
      object rbActivoTodos: TRadioButton
        Left = 73
        Top = 20
        Width = 51
        Height = 17
        Caption = 'Todos'
        TabOrder = 0
      end
      object rbActivoNo: TRadioButton
        Left = 36
        Top = 20
        Width = 33
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbActivoSi: TRadioButton
        Left = 3
        Top = 20
        Width = 31
        Height = 17
        Caption = 'Si'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 46
    Width = 705
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 701
      end>
    inherited ToolBar: TToolBar
      Width = 688
    end
  end
  inherited Grid: TArtDBGrid
    Top = 75
    Width = 705
    Height = 317
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EB_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EB_GRUPOFAMILIAR'
        Title.Alignment = taCenter
        Title.Caption = 'Grupo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_DOCUMENTO'
        Title.Caption = 'Documento'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EB_PORCENTAJE'
        Title.Alignment = taCenter
        Title.Caption = 'Porcentaje'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRPARENTEZCO'
        Title.Caption = 'Parentezco'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTROVERSIA'
        Title.Caption = 'Tipo'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_CONTROVERSIADESDE'
        Title.Caption = 'F. desde'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_CONTROVERSIAHASTA'
        Title.Caption = 'F. hasta'
        Width = 65
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnGetCellParams = QueryPrintGetCellParams
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
      end
      item
        Key = 16453
      end
      item
        Key = 16467
      end>
    Left = 80
    Top = 256
  end
end
