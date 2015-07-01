object frmAutorizacionPagosSumarios: TfrmAutorizacionPagosSumarios
  Left = 93
  Top = 103
  Width = 670
  Height = 500
  Caption = 'Autorizaci'#243'n de Pagos Sumarios'
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 670
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
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
      DataSource = dsPagoSumario
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
          FieldName = 'PS_FECHAVENCIMIENTOPAGO'
          Title.Alignment = taCenter
          Title.Caption = 'Vencimiento'
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'su_numerosumario'
          Title.Alignment = taCenter
          Title.Caption = 'Sumario'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'art'
          Title.Caption = 'A.R.T.'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'concepto'
          Title.Alignment = taCenter
          Title.Caption = 'Concepto'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ps_detallebeneficiario'
          Title.Alignment = taCenter
          Title.Caption = 'Beneficiario'
          Width = 200
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'ps_importeconretencion'
          Title.Alignment = taCenter
          Title.Caption = 'Importe c/Ret.'
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'ps_importepago'
          Title.Alignment = taCenter
          Title.Caption = 'Importe s/Ret.'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ps_fechafactura'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha Factura'
          Width = 85
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'NroFactura'
          Title.Alignment = taCenter
          Title.Caption = 'Factura'
          Width = 100
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
        DataSource = dsPagoAprobado
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
            Expanded = False
            FieldName = 'PS_FECHAVENCIMIENTOPAGO'
            Title.Alignment = taCenter
            Title.Caption = 'Vencimiento'
            Width = 70
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'su_numerosumario'
            Title.Alignment = taCenter
            Title.Caption = 'Sumario'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'art'
            Title.Caption = 'A.R.T.'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'concepto'
            Title.Alignment = taCenter
            Title.Caption = 'Concepto'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ps_detallebeneficiario'
            Title.Alignment = taCenter
            Title.Caption = 'Beneficiario'
            Width = 200
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'ps_importeconretencion'
            Title.Alignment = taCenter
            Title.Caption = 'Importe c/Ret.'
            Width = 80
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'ps_importepago'
            Title.Alignment = taCenter
            Title.Caption = 'Importe s/Ret.'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ps_fechafactura'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha Factura'
            Width = 85
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'NroFactura'
            Title.Alignment = taCenter
            Title.Caption = 'Factura'
            Width = 100
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
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
      OnClick = ToolButton1Click
    end
    object tbImprimirPagos: TToolButton
      Left = 23
      Top = 0
      Hint = 'Imprimir Liquidaci'#243'n de Pago'
      ImageIndex = 4
      OnClick = tbImprimirPagosClick
    end
    object tbAprobacionPagos: TToolButton
      Left = 46
      Top = 0
      Hint = 'Aprobaci'#243'n de Pago'
      Caption = 'Aprobaci'#243'n de Pagos'
      ImageIndex = 19
      OnClick = tbAprobacionPagosClick
    end
    object ToolButton4: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object tbGrabar: TToolButton
      Left = 77
      Top = 0
      Hint = 'Grabar las autorizaciones '#13#10'efectuadas'
      Caption = 'Grabar'
      Enabled = False
      ImageIndex = 3
      OnClick = tbGrabarClick
    end
    object tbCancelar: TToolButton
      Left = 100
      Top = 0
      Hint = 'Cancelar las autorizaciones '#13#10'efectuadas'
      Caption = 'Cancelar'
      Enabled = False
      ImageIndex = 1
      OnClick = tbCancelarClick
    end
    object tbOrdenar: TToolButton
      Left = 123
      Top = 0
      Caption = 'tbOrdenar'
      ImageIndex = 2
      OnClick = tbOrdenarClick
    end
    object TToolButton
      Left = 146
      Top = 0
      Width = 8
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbSalir: TToolButton
      Left = 154
      Top = 0
      Hint = 'Salir'
      Caption = 'tbSalir'
      ImageIndex = 5
      OnClick = tbSalirClick
    end
    object ToolButton2: TToolButton
      Left = 177
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object pnlColoresGrilla: TPanel
      Left = 185
      Top = 0
      Width = 92
      Height = 22
      TabOrder = 0
      object pnlColor1: TPanel
        Left = 3
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
        TabOrder = 0
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
    AfterExecute = SeguridadAfterExecute
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 422
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 445
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
      end
      item
        Key = 16460
      end
      item
        Key = 16453
      end
      item
        Key = 16455
      end
      item
        Key = 16467
      end
      item
        Key = 16457
      end
      item
        Key = 16468
      end>
    Left = 337
  end
  object iStates: TImageList
    Left = 183
    Top = 126
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
  object sdqPagoSumario: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqPagoSumarioAfterScroll
    SQL.Strings = (
      
        'SELECT   cp_denpago || '#39': '#39' || is_detalle concepto, su_numerosum' +
        'ario,'
      '         bp_descripcion, ps_id, ps_numpago,'
      '         ps_fechapago, ps_conpago, ps_fechaemision, ps_cuitcuil,'
      '         ps_letrafactura, ps_situacionfactura, ps_numerofactura,'
      
        '         ps_fechafactura, ps_importepago, ps_comentario, ps_esta' +
        'do,'
      '         ps_usualta, ps_fechaalta, ps_usumodif, ps_fechamodif,'
      
        '         ps_fechavencimiento, ps_usuarioaprobado, ps_fechaaproba' +
        'do,'
      '         ps_importeconretencion, ps_chequenombre, ps_idsumario,'
      '         ps_idbeneficiariopago, ps_detallebeneficiario,'
      
        '         ps_iddetallebeneficiario, ps_fechavencimientopago, cp_c' +
        'tapago,'
      
        '         cp_especie, cp_codigossn, cp_retencion, cp_tipo, cp_aut' +
        'orizacion,'
      
        '         cp_altamedica, cp_fbaja, cp_descripcion, cp_tipomonto, ' +
        'cp_telegrama,'
      
        '         cp_nomenclado, cp_legales, cp_grado, cp_caracter, cp_ad' +
        'elanto,'
      '         cp_espagomensual, cp_aporycontri, cp_retiva,'
      '         TO_NUMBER (NULL) ordennro, TO_DATE (NULL) ordenfecha,'
      
        '         TO_NUMBER (NULL) chequenro, TO_DATE (NULL) chequefecha,' +
        ' ps_paguesea,'
      '            ps_letrafactura'
      '         || '#39'-'#39
      '         || ps_situacionfactura'
      '         || '#39'-'#39
      '         || ps_numerofactura AS nrofactura,'
      '         ps_usuarioemision'
      '    FROM legales.lps_pagosumario,'
      '         legales.lbp_beneficiariopago,'
      '         art.scp_conpago,'
      '         legales.lis_importesentenciasumario,'
      '         legales.lsu_sumario'
      '   WHERE ps_idbeneficiariopago = bp_id(+)'
      '     AND ps_conpago = cp_conpago'
      '     AND ps_estado = '#39'C'#39
      '     AND is_nropago = ps_id'
      '     AND su_id = ps_idsumario'
      'ORDER BY ps_fechavencimientopago DESC, ps_id, ps_idsumario'
      '')
    UpdateObject = sduPagoSumario
    Left = 153
    Top = 126
  end
  object dsPagoSumario: TDataSource
    DataSet = sdqPagoSumario
    Left = 153
    Top = 156
  end
  object imCustom: TImageList
    Left = 183
    Top = 156
  end
  object sdqPagoSumarioAprobado: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqPagoSumarioAfterScroll
    SQL.Strings = (
      'SELECT   ps_fechavencimientopago, ps_id, ps_idsumario,'
      '         su_numerosumario, ar_nombre art,'
      '         cp_denpago || '#39': '#39' || is_detalle concepto,'
      '         ps_detallebeneficiario, ps_importeconretencion,'
      '         ps_importepago,'
      '            ps_letrafactura'
      '         || '#39'-'#39
      '         || ps_situacionfactura'
      '         || '#39'-'#39
      '         || ps_numerofactura AS nrofactura,'
      '         ps_fechafactura'
      '    FROM legales.lps_pagosumario,'
      '         legales.lbp_beneficiariopago,'
      '         art.scp_conpago,'
      '         legales.lis_importesentenciasumario,'
      '         legales.lsu_sumario,'
      '         afi.aar_art'
      '   WHERE (ps_idbeneficiariopago = bp_id(+))'
      '     AND (ps_conpago = cp_conpago)'
      '     AND (ps_estado = '#39'E'#39')'
      '     AND (ps_fechaaprobado >= :fecharef)'
      '     AND (ps_fechaaprobado < CAST (:fecharef AS DATE) + 1)'
      '     AND (is_nropago(+) = ps_id)'
      '     AND (su_id = ps_idsumario)'
      '     AND (ar_id = su_idart)'
      'ORDER BY ps_fechavencimientopago DESC, ps_id, ps_idsumario')
    Left = 213
    Top = 126
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecharef'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fecharef'
        ParamType = ptInput
      end>
  end
  object dsPagoAprobado: TDataSource
    DataSet = sdqPagoSumarioAprobado
    Left = 213
    Top = 156
  end
  object sduPagoSumario: TSDUpdateSQL
    Left = 120
    Top = 127
  end
  object SortDialog1: TSortDialog
    Caption = 'Orden'
    DataSet = sdqPagoSumario
    SortFields = <
      item
        Title = 'Vencimiento'
        DataField = 'PL_FECHAVENCIMIENTOPAGO'
        FieldIndex = 0
      end
      item
        Title = 'Carpeta'
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
        DataField = 'pl_detallebeneficiario'
        FieldIndex = 3
      end
      item
        Title = 'Importe c/Ret.'
        DataField = 'pl_importeconretencion'
        FieldIndex = 4
      end
      item
        Title = 'Importe s/Ret.'
        DataField = 'pl_importepago'
        FieldIndex = 5
      end
      item
        Title = 'Fecha Factura'
        DataField = 'pl_fechafactura'
        FieldIndex = 6
      end
      item
        Title = 'Factura'
        DataField = 'NroFactura'
        FieldIndex = 7
      end>
    FixedRows = 0
    Left = 120
    Top = 157
  end
end
