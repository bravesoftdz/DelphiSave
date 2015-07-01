object frmAutorizacionPagosLegales: TfrmAutorizacionPagosLegales
  Left = 333
  Top = 221
  Width = 670
  Height = 500
  Caption = 'Autorizaci'#243'n de Pagos Legales'
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 670
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object EnterAsTab: TJvEnterAsTab
    Left = 632
    Top = 314
    Width = 28
    Height = 28
  end
  object pnDetalle: TPanel
    Left = 0
    Top = 49
    Width = 662
    Height = 424
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object dbgPagos: TRxDBGrid
      Left = 0
      Top = 0
      Width = 662
      Height = 166
      Align = alClient
      DataSource = dsPagoLegal
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = dbgPagosGetCellParams
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'fechaaprobado'
          Title.Alignment = taCenter
          Title.Caption = 'Aprobado'
          Width = 67
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'fechavencimientopago'
          Title.Alignment = taCenter
          Title.Caption = 'Vencimiento'
          Width = 67
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'carpeta'
          Title.Alignment = taCenter
          Title.Caption = 'Carpeta/Folio'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'concepto'
          Title.Alignment = taCenter
          Title.Caption = 'Concepto'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'detallebeneficiario'
          Title.Alignment = taCenter
          Title.Caption = 'Beneficiario'
          Width = 200
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'importeconretencion'
          Title.Alignment = taCenter
          Title.Caption = 'Importe c/Ret.'
          Width = 94
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'importepago'
          Title.Alignment = taCenter
          Title.Caption = 'Importe s/Ret.'
          Width = 90
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'fechafactura'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha Factura'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NroFactura'
          Title.Alignment = taCenter
          Title.Caption = 'Factura'
          Width = 131
          Visible = True
        end>
    end
    object pnlAprobados: TPanel
      Left = 0
      Top = 166
      Width = 662
      Height = 258
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 662
        Height = 13
        Align = alTop
        Caption = 'Pagos Autorizados en esta sesi'#243'n:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgPagosEfectuados: TRxDBGrid
        Left = 0
        Top = 13
        Width = 662
        Height = 245
        TabStop = False
        Align = alClient
        Color = 16776176
        DataSource = dsPagoLegalAprobado
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fechavencimientopago'
            Title.Alignment = taCenter
            Title.Caption = 'Vencimiento'
            Width = 69
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'carpeta'
            Title.Alignment = taCenter
            Title.Caption = 'Carpeta/Folio'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'concepto'
            Title.Alignment = taCenter
            Title.Caption = 'Concepto'
            Width = 183
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'detallebeneficiario'
            Title.Alignment = taCenter
            Title.Caption = 'Beneficiario'
            Width = 227
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'importeconretencion'
            Title.Alignment = taCenter
            Title.Caption = 'Importe c/Ret.'
            Width = 87
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'importepago'
            Title.Alignment = taCenter
            Title.Caption = 'Importe s/Ret.'
            Width = 92
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fechafactura'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha Factura'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NroFactura'
            Title.Alignment = taCenter
            Title.Caption = 'Factura'
            Width = 120
            Visible = True
          end>
      end
    end
  end
  object tbAcciones: TToolBar
    Left = 0
    Top = 22
    Width = 662
    Height = 27
    BorderWidth = 1
    EdgeBorders = []
    Flat = True
    HotImages = dmLegales.ilByN
    Images = dmLegales.ilColor
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object tbRefrescar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Refrescar (F5)'
      ImageIndex = 0
      OnClick = tbRefrescarClick
    end
    object tbImprimirPagos: TToolButton
      Left = 23
      Top = 0
      Hint = 'Imprimir (Ctrl+I)'
      ImageIndex = 4
      OnClick = tbImprimirPagosClick
    end
    object tbAprobacionPagos: TToolButton
      Left = 46
      Top = 0
      Hint = 'Aprobaci'#243'n de Pago (Ctrl+A)'
      ImageIndex = 19
      OnClick = tbAprobacionPagosClick
    end
    object tbGrabar: TToolButton
      Left = 69
      Top = 0
      Hint = 'Grabar las autorizaciones '#13#10'efectuadas (Ctrl+G)'
      Enabled = False
      ImageIndex = 3
      OnClick = tbGrabarClick
    end
    object tbSep1: TToolButton
      Left = 92
      Top = 0
      Width = 8
      Caption = 'tbSep1'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object tbExportar: TToolButton
      Left = 100
      Top = 0
      Hint = 'Exportar (Ctrl+E)'
      Enabled = False
      ImageIndex = 3
      OnClick = tbExportarClick
    end
    object tbCancelar: TToolButton
      Left = 123
      Top = 0
      Hint = 'Cancelar las autorizaciones '#13#10'efectuadas (Ctrl+L)'
      Enabled = False
      ImageIndex = 1
      OnClick = tbCancelarClick
    end
    object tbOrdenar: TToolButton
      Left = 146
      Top = 0
      Hint = 'Ordenar (Ctrl+O)'
      ImageIndex = 2
      OnClick = tbOrdenarClick
    end
    object tbSep2: TToolButton
      Left = 169
      Top = 0
      Width = 8
      Caption = 'tbSep2'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbSalir: TToolButton
      Left = 177
      Top = 0
      Hint = 'Salir (Ctrl+S)'
      ImageIndex = 5
      OnClick = tbSalirClick
    end
    object ToolButton1: TToolButton
      Left = 200
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object pnlVerPagosBloqueados: TPanel
      Left = 208
      Top = 0
      Width = 141
      Height = 22
      BevelOuter = bvNone
      TabOrder = 0
      object chkPagosBloqueados: TCheckBox
        Left = 10
        Top = 3
        Width = 129
        Height = 17
        Caption = 'Ver Pagos Bloqueados'
        TabOrder = 0
      end
    end
    object pnlColoresGrilla: TPanel
      Left = 349
      Top = 0
      Width = 180
      Height = 22
      TabOrder = 1
      object pnlColor0: TPanel
        Left = 3
        Top = 2
        Width = 86
        Height = 17
        BevelOuter = bvLowered
        Caption = 'Pago Bloqueado'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object pnlColor1: TPanel
        Left = 91
        Top = 2
        Width = 86
        Height = 17
        BevelOuter = bvLowered
        Caption = 'Pago Exclusivo'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 0
    Width = 662
    Height = 22
    Hint = 'pnlFiltros'
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object lblFechaAprobacion: TLabel
      Left = 4
      Top = 5
      Width = 107
      Height = 13
      Caption = 'Fecha Aprobaci'#243'n: del'
    end
    object Label2: TLabel
      Left = 210
      Top = 5
      Width = 8
      Height = 13
      Caption = 'al'
    end
    object Label3: TLabel
      Left = 565
      Top = 3
      Width = 35
      Height = 13
      Caption = 'Copias:'
    end
    object dtpFechaAprobacionDesde: TDateTimePicker
      Left = 116
      Top = 0
      Width = 87
      Height = 22
      Date = 38439.679332037020000000
      Time = 38439.679332037020000000
      TabOrder = 0
      OnChange = dtpFechaAprobacionDesdeChange
    end
    object dtpFechaAprobacionHasta: TDateTimePicker
      Left = 223
      Top = 0
      Width = 87
      Height = 22
      Date = 38439.679332037020000000
      Time = 38439.679332037020000000
      TabOrder = 1
      OnChange = dtpFechaAprobacionDesdeChange
    end
    object spnCopias: TRxSpinEdit
      Left = 604
      Top = 0
      Width = 46
      Height = 21
      MaxValue = 99.000000000000000000
      MinValue = 1.000000000000000000
      Value = 2.000000000000000000
      MaxLength = 2
      TabOrder = 2
    end
  end
  object Seguridad: TSeguridad
    AutoEjecutar = False
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 278
    Top = 128
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 305
    Top = 128
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16460
        LinkControl = tbCancelar
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16455
        LinkControl = tbGrabar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimirPagos
      end
      item
        Key = 16449
        LinkControl = tbAprobacionPagos
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 116
        LinkControl = tbRefrescar
      end>
    Left = 245
    Top = 128
  end
  object iStates: TImageList
    Left = 71
    Top = 127
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00A5A5
      A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A50000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000009C
      FF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF00009CFF00009C
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00A5A5
      A500A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5006B6B
      6B0000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000009C
      FF00009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000063
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE00CECECE00CECECE00A5A5A500A5A5A500A5A5A5006B6B6B000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000031CEFF0031CEFF0031CEFF00009CFF00009CFF00009CFF0000639C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000006B6B6B006B6B6B006B6B6B000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000639C0000639C0000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000006B6B6B006B6B6B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000639C0000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000006B6B6B0039393900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000639C000031630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0039393900393939006B6B6B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000003163000031630000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0039393900393939006B6B6B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000003163000031630000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0039393900393939006B6B6B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000003163000031630000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00393939006B6B6B006B6B6B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000031630000639C0000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000003939390039393900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000003163000031630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF000000F81F000000000000E00700000000
      0000E007000000000000F00F000000000000F00F000000000000F00F00000000
      0000F00F000000000000F00F000000000000F81F000000000000FC7F00000000
      0000FC7F000000000000FC3F000000000000FC3F000000000000FC3F00000000
      0000FC3F000000000000FC7F0000000000000000000000000000000000000000
      000000000000}
  end
  object sdqPagoLegal: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqPagoLegalAfterOpen
    AfterScroll = sdqPagoLegalAfterScroll
    UpdateObject = sduPagoLegal
    Left = 152
    Top = 127
  end
  object dsPagoLegal: TDataSource
    DataSet = sdqPagoLegal
    Left = 152
    Top = 155
  end
  object imCustom: TImageList
    Left = 71
    Top = 155
  end
  object sdqPagoLegalAprobado: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqPagoLegalAfterScroll
    Left = 180
    Top = 127
  end
  object dsPagoLegalAprobado: TDataSource
    DataSet = sdqPagoLegalAprobado
    Left = 180
    Top = 155
  end
  object sduPagoLegal: TSDUpdateSQL
    Left = 153
    Top = 99
  end
  object SortDialog1: TSortDialog
    Caption = 'Orden'
    DataSet = sdqPagoLegal
    SortFields = <
      item
        Title = 'Vencimiento'
        DataField = 'fechavencimientopago'
        FieldIndex = 0
      end
      item
        Title = 'Carpeta/Folio'
        DataField = 'carpeta'
        FieldIndex = 1
      end
      item
        Title = 'Concepto'
        DataField = 'concepto'
        FieldIndex = 2
      end
      item
        Title = 'Beneficiario'
        DataField = 'detallebeneficiario'
        FieldIndex = 3
      end
      item
        Title = 'Importe c/Ret.'
        DataField = 'importeconretencion'
        FieldIndex = 4
      end
      item
        Title = 'Importe s/Ret.'
        DataField = 'importepago'
        FieldIndex = 5
      end
      item
        Title = 'Fecha Factura'
        DataField = 'fechafactura'
        FieldIndex = 6
      end
      item
        Title = 'Factura'
        DataField = 'NroFactura'
        FieldIndex = 7
      end>
    FixedRows = 0
    Left = 100
    Top = 155
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    Fields = <>
    IniStorage = FormStorage
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 100
    Top = 127
  end
end
