inherited frmListContCartasDoc: TfrmListContCartasDoc
  Left = 275
  Top = 145
  Width = 589
  Height = 471
  Caption = 'Control de Cartas Documento de Incapacidades'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 581
    Height = 99
    object chkSiniestro: TCheckPanel
      Left = 1
      Top = 2
      Width = 141
      Height = 46
      Caption = 'Siniestro '
      TabOrder = 0
      Checked = False
      OnChange = chkSiniestroChange
      object edSiniestro: TSinEdit
        Left = 8
        Top = 17
        Width = 125
        Height = 21
        TabOrder = 0
      end
    end
    object chkFIngreso: TCheckPanel
      Left = 146
      Top = 2
      Width = 215
      Height = 46
      Caption = 'Fecha Ingreso Carta '
      TabOrder = 1
      Checked = False
      OnChange = chkFIngresoChange
      object Label8: TLabel
        Left = 102
        Top = 22
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dcIngresoDesde: TDateComboBox
        Left = 8
        Top = 18
        Width = 89
        Height = 21
        MaxDateCombo = dcIngresoHasta
        TabOrder = 0
      end
      object dcIngresoHasta: TDateComboBox
        Left = 120
        Top = 18
        Width = 89
        Height = 21
        MinDateCombo = dcIngresoDesde
        TabOrder = 1
      end
    end
    object chkFEgreso: TCheckPanel
      Left = 366
      Top = 2
      Width = 213
      Height = 46
      Caption = 'Fecha Egreso Carta '
      TabOrder = 2
      Checked = False
      OnChange = chkFEgresoChange
      object Label9: TLabel
        Left = 101
        Top = 22
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dcEgresoDesde: TDateComboBox
        Left = 7
        Top = 18
        Width = 90
        Height = 21
        MaxDateCombo = dcEgresoHasta
        TabOrder = 0
      end
      object dcEgresoHasta: TDateComboBox
        Left = 117
        Top = 18
        Width = 90
        Height = 21
        MinDateCombo = dcEgresoDesde
        TabOrder = 1
      end
    end
    object chkArea: TCheckPanel
      Left = 145
      Top = 49
      Width = 434
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Area '
      TabOrder = 4
      Checked = False
      OnChange = chkAreaChange
      DesignSize = (
        434
        46)
      inline fraArea: TfraCodigoDescripcion
        Left = 7
        Top = 16
        Width = 423
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          423
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 63
          Width = 358
        end
        inherited edCodigo: TPatternEdit
          Width = 61
        end
      end
    end
    object chkEstado: TCheckPanel
      Left = 1
      Top = 49
      Width = 140
      Height = 46
      Caption = 'Estado '
      TabOrder = 3
      Checked = False
      OnChange = chkEstadoChange
      object cmbEstado: TComboBox
        Left = 8
        Top = 17
        Width = 126
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 0
        Items.Strings = (
          'Todos'
          'Pendiente'
          'Enviado')
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 99
    Width = 581
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 577
      end>
    inherited ToolBar: TToolBar
      Width = 564
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbSalir: TToolButton
        Visible = False
        OnClick = nil
      end
      object tbViajar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Viajar...'
        Caption = 'tbViajar'
        DropdownMenu = mnuViajar
        ImageIndex = 50
        Style = tbsDropDown
      end
      object ToolButton2: TToolButton
        Left = 406
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 414
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 128
    Width = 581
    Height = 309
    Columns = <
      item
        Expanded = False
        FieldName = 'EX_SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_ORDEN'
        Title.Caption = 'Orden'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_RECAIDA'
        Title.Caption = 'Recaida'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegacion del Siniestro'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CI_FECINGRESO'
        Title.Caption = 'Fec. Ingreso Carta'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CI_DESCCARTAINGRESO'
        Title.Caption = 'Descrip. Carta Ingreso'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AREA'
        Title.Caption = #192'rea'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CI_FECEGRESO'
        Title.Caption = 'Fec. Egreso Carta'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CI_DESCCARTAEGRESO'
        Title.Caption = 'Descrip. Carta Egreso'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CI_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end>
  end
  object fpAbm: TFormPanel [3]
    Left = 32
    Top = 150
    Width = 501
    Height = 375
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      501
      375)
    object Label1: TLabel
      Left = 21
      Top = 14
      Width = 43
      Height = 13
      Caption = 'Siniestro:'
    end
    object Label3: TLabel
      Left = 189
      Top = 15
      Width = 25
      Height = 13
      Caption = 'Area:'
    end
    object Label6: TLabel
      Left = 19
      Top = 300
      Width = 52
      Height = 13
      Caption = 'Observac.:'
    end
    object Label10: TLabel
      Left = 11
      Top = 42
      Width = 54
      Height = 13
      Caption = 'Trabajador:'
    end
    object btnCerrar: TBitBtn
      Left = 417
      Top = 343
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Cerrar'
      TabOrder = 6
      Kind = bkCancel
    end
    object btnGuardar: TBitBtn
      Left = 330
      Top = 343
      Width = 77
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Guardar'
      TabOrder = 5
      OnClick = btnGuardarClick
      Glyph.Data = {
        B6010000424DB601000000000000760000002800000022000000100000000100
        0400000000004001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AA0000000000
        0000AAA88888888888888A000000A8888800000088880A777778888887777800
        0000A8F7778888807F780A7FFFF7777787FF78000400A8F7778078807F780A7F
        FFF7877787FF78006F01A8F7778078807F780A7FFFF7877787FF78028181A8F7
        7778888887780A7FFFFF777777FF78011D01A8F77777777777780A7FFFFFFFFF
        FFFF78001D01A8F77888888887780A7FFF77777777FF78001C02A8F78FFFFFFF
        FF780A7FF7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801
        9E01A8F78FFFFFFFFF780A7FF7FFFFFFFFFF78000600A8F78FFFFFFFFF780A7F
        F7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801A601A8F7
        8FFFFFFFFF080A7FF7FFFFFFFFF078005E02A8F78FFFFFFFFF780A7FF7FFFFFF
        FFF778016E02AA88888888888888AAA77777777777777A006701}
      NumGlyphs = 2
    end
    object edSiniestroAbm: TSinEdit
      Left = 73
      Top = 9
      Width = 107
      Height = 21
      TabOrder = 0
      OnSelect = edSiniestroAbmSelect
      Color = clInfoBk
    end
    object gbIngreso: TGroupBox
      Left = 6
      Top = 69
      Width = 489
      Height = 110
      Caption = ' Ingreso de la Carta '
      Color = clActiveBorder
      ParentColor = False
      TabOrder = 2
      object Label2: TLabel
        Left = 29
        Top = 24
        Width = 33
        Height = 13
        Caption = 'Fecha:'
      end
      object Label4: TLabel
        Left = 4
        Top = 42
        Width = 59
        Height = 13
        Caption = 'Descripci'#243'n:'
      end
      object dcIngresoAbm: TDateComboBox
        Left = 65
        Top = 20
        Width = 99
        Height = 21
        TabOrder = 0
      end
      object memoIngreso: TMemo
        Left = 65
        Top = 44
        Width = 418
        Height = 60
        MaxLength = 200
        TabOrder = 1
      end
    end
    object gbEgreso: TGroupBox
      Left = 6
      Top = 182
      Width = 489
      Height = 111
      Caption = ' Egreso de la Carta '
      TabOrder = 3
      object Label5: TLabel
        Left = 29
        Top = 24
        Width = 33
        Height = 13
        Caption = 'Fecha:'
      end
      object Label7: TLabel
        Left = 4
        Top = 42
        Width = 59
        Height = 13
        Caption = 'Descripci'#243'n:'
      end
      object dcEgresoAbm: TDateComboBox
        Left = 66
        Top = 20
        Width = 99
        Height = 21
        MinDateCombo = dcEgresoDesde
        TabOrder = 0
      end
      object memoEgreso: TMemo
        Left = 66
        Top = 44
        Width = 418
        Height = 61
        MaxLength = 200
        TabOrder = 1
      end
    end
    inline fraAreaAbm: TfraCodigoDescripcion
      Left = 217
      Top = 8
      Width = 219
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        219
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 63
        Width = 154
      end
      inherited edCodigo: TPatternEdit
        Width = 61
      end
    end
    object memoObservaciones: TMemo
      Left = 74
      Top = 299
      Width = 419
      Height = 35
      Color = clHighlightText
      Ctl3D = True
      MaxLength = 150
      ParentCtl3D = False
      TabOrder = 4
    end
    object edEstado: TEdit
      Left = 439
      Top = 13
      Width = 54
      Height = 18
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Text = 'Pendiente'
    end
    inline fraTrabajador: TfraTrabajador
      Left = 73
      Top = 37
      Width = 420
      Height = 22
      Enabled = False
      TabOrder = 8
      inherited cmbNombre: TArtComboBox
        Width = 336
      end
    end
  end
  inherited QueryPrint: TQueryPrint
    SubTitle.Font.Height = -12
    FieldSeparation = 8
    PageOrientation = pxLandscape
    OnReportBegin = QueryPrintReportBegin
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
        LinkControl = tbSalir2
      end
      item
        Key = 0
      end>
  end
  object mnuViajar: TPopupMenu
    Left = 80
    Top = 256
    object mnuSeguimientoIncapacidades: TMenuItem
      Caption = 'Seguimiento de Incapacidades'
      OnClick = mnuSeguimientoIncapacidadesClick
    end
  end
end
