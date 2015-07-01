inherited frmRemitoSolicitudesCargadas: TfrmRemitoSolicitudesCargadas
  Left = 213
  Top = 107
  Width = 760
  Height = 360
  Caption = 'Remitos de Solicitudes Cargadas'
  Constraints.MinHeight = 360
  Constraints.MinWidth = 400
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 752
    Height = 52
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 268
      Height = 44
      Caption = ' Fecha Emisi'#243'n '
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object Label1: TLabel
        Left = 140
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object edFechaEmisionDesde: TDateComboBox
        Left = 44
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaEmisionHasta: TDateComboBox
        Left = 172
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 276
      Top = 4
      Width = 112
      Height = 44
      TabOrder = 1
      object checkSolNoImpresa: TCheckBox
        Left = 8
        Top = 20
        Width = 100
        Height = 17
        Caption = 'Sol. NO Impresa'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 392
      Top = 4
      Width = 184
      Height = 44
      TabOrder = 2
      object checkCotizacionRevision: TCheckBox
        Left = 8
        Top = 20
        Width = 168
        Height = 17
        Caption = 'Cotizaci'#243'n / Revisi'#243'n de Precio'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 52
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
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Quitar Info Remito'
        ImageIndex = 39
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 81
    Width = 752
    Height = 252
    PopupMenu = popupGrilla
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnGetCellProps = GridGetCellProps
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Alignment = taCenter
        Title.Caption = '.'
        Width = 31
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'sa_nrointerno'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Interno'
        Width = 56
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'NUMEROSOLICITUD'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Solic. Cotizaci'#243'n'
        Width = 104
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'NUMEROCOTIZACION'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Cotizaci'#243'n'
        Width = 85
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'NUMEROREAFILIACION'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Revisi'#243'n Precio'
        Width = 107
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'C.U.I.T.'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 86
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'contrato'
        Title.Alignment = taRightJustify
        Title.Caption = 'Contrato'
        Width = 60
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'totempleados'
        Title.Alignment = taRightJustify
        Title.Caption = 'Empleados'
        Width = 63
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'masatotal'
        Title.Alignment = taRightJustify
        Title.Caption = 'Masa Salarial'
        Width = 71
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'cod_actividad'
        Title.Alignment = taRightJustify
        Title.Caption = 'CIIU'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'desc_actividad'
        Title.Caption = 'Descripci'#243'n CIIU'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estadosolicitudafi'
        Title.Caption = 'Estado Solic. Afi.'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estadocontrato'
        Title.Caption = 'Estado Contrato'
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechaimpresion'
        Title.Alignment = taCenter
        Title.Caption = 'F. Impresi'#243'n'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAAPROBACION'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Aprobaci'#243'n'
        Width = 103
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAREMITO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Remito'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIOREMITO'
        Title.Caption = 'Usuario Remito'
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fecharecepcionafi'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Recepci'#243'n Afiliaciones'
        Width = 159
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    SubTitle.Font.Height = -15
    PageOrientation = pxLandscape
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
        Key = 16449
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
  object popupGrilla: TPopupMenu
    Left = 80
    Top = 256
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
end
