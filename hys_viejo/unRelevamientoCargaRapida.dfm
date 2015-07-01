inherited frmRelevamientoCargaRapida: TfrmRelevamientoCargaRapida
  Left = 385
  Top = 224
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Estado de Carga'
  ClientHeight = 389
  ClientWidth = 514
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottomPanel: TPanel [0]
    Left = 0
    Top = 353
    Width = 514
    Height = 36
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      514
      36)
    object btnGuardar: TButton
      Left = 356
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnGuardarClick
    end
    object btnCancelar: TButton
      Left = 434
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object gbCargaEstimada: TGroupBox [1]
    Left = 0
    Top = 117
    Width = 514
    Height = 120
    Align = alTop
    Caption = 'Carga Estimada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    object lblFechaCargaEstimado: TLabel
      Left = 11
      Top = 24
      Width = 61
      Height = 13
      Caption = 'Fecha Carga'
    end
    object lblRelevamientosRecibidos: TLabel
      Left = 11
      Top = 48
      Width = 78
      Height = 13
      Caption = 'Relev.Recibidos'
    end
    object lblCantidadEstabEstimado: TLabel
      Left = 11
      Top = 72
      Width = 104
      Height = 13
      Caption = 'Cant.Establecimientos'
    end
    object lblPrioridadEstimado: TLabel
      Left = 229
      Top = 48
      Width = 67
      Height = 13
      Caption = 'Prioridad/Tipo'
    end
    object lblVigenciaEstimado: TLabel
      Left = 229
      Top = 72
      Width = 41
      Height = 13
      Caption = 'Vigencia'
    end
    object lblCumplimientoEstimado: TLabel
      Left = 197
      Top = 101
      Width = 95
      Height = 13
      Caption = 'Cumplimiento ----'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnHistoricoEstimado: TSpeedButton
      Left = 381
      Top = 68
      Width = 23
      Height = 22
      Hint = 'Hist'#243'rico'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000000000000000000000000000000000006A5030001A15
        0E0010091F003D315000765C5F0090716D008C6C68007C332E00562427001B23
        34002F30400010084600C0B8B400CFCAC900F5F5F500FDFEFE004E372C009CCB
        E80020AFD70029B5DA0033BBDD003EC3E10046C8E40052D0E8005AD5EA0064DC
        EE006FE3F10077E9F40084F1F80061504900B4B2B400F2F3F400197FAA0099FF
        FF0022A1C9006EE2F1006EE2F1006EE2F1006EE2F1006EE2F1006EE2F1006EE2
        F1006EE2F1006EE2F1006EE2F100A8E2FF00756F6F00E4E5E700197FAA0099FF
        FF001A7BA700B8FFFF00B6FFFF00B3FFFF00B1FFFF00AEFFFF00ACFFFF00A9FF
        FF00A7FFFF00A4FFFF00A0FFFF007FE1EB00626A7300F3F3F400197FAA0099FF
        FF00C6FFFF00C4FFFF00C1FFFF00BFFFFF005DD3E90048B6CE003DC2E1005AD1
        E800B3FFFF00B0FFFF00AEFFFF0032587B002C2B2B00FAFAFA00197FAA0099FF
        FF00D4FFFF00D1FFFF00CCFBFB0093939300938D8D0095908700A7949400EFC2
        C20041BBD700BCFFFF00B9FFFF006C5C530028282600FF00FF00197FAA0091FA
        FC00DFFFFF00DDFFFF00ADADAD00ECDAAE00FFF6DA00FFEBCC00FFFFFB00F2E5
        B800F7C7C7004ACBE500C6FFFF005C4A4100716F6E00FF00FF00177EA9007DED
        F600EBFFFF00ACB3B300D9C5A600FFF2BF00FFEFBC00FFE8B500FFDCA900FFFB
        F400B7B59C0077868A00D2FFFF0057453C009D9B9A00FF00FF00137BA80067DE
        EE00F7FFFF00B7B7B700FFEAB900FFFFD400FFFFCC0099806700DDBF9500F9D0
        9E00FAEDC200CEAFAF00C8F9FC0059473E009C9A9900FF00FF000F79A60050CE
        E700FFFFFF00C8C8C800FCE6CD00FFFFFC00FFFFDC00999981007C6A5700FFE4
        B100F3E7BB00AA9B9B00EAFFFF00513F360048464500FF00FF000C76A5003BC1
        E000FFFFFF00D0D0D000C0BBB500FFFFFF00FFFFF400FFFFD900E2E2B6007C6A
        570096938900759BA000F5FFFF0047352C00372B2A00FF00FF000874A40025B2
        D900FFFFFF00FFFFFF00C8C8C800B9AB9D00FFFFFF00A2CEFF00FFFDCA00D3C1
        A0009D9D9D00FFFFFF00FFFFFF00584538004E3A3700FF00FF000572A30011A4
        D200FFFFFF00FFFFFF00FFFFFF00AAAAAA00ECECEC00D3D3D300D1D1D100A7A7
        A700FFFFFF00FFFFFF00FFFFFF0061413A00775A5900FF00FF00016FA2000099
        CC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00372C1A009F5E5C00FF00FF00006EA1000099
        CC002A7FAA002A7FAA002A7FAA002A7FAA002A7FAA002A7FAA002A7FAA002A7F
        AA002A7FAA002A7FAA002A7FAA006F574F00CC929100FF00FF001572A1000066
        990066DDEE0066DDEE0066DDEE0066DDEE0066DDEE0066DDEE0066DDEE0066DD
        EE0066DDEE0066DDEE0066DDEE006B5D5900ADA4A400FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnHistoricoEstimadoClick
    end
    object lblUsuarioCargaEstimado: TLabel
      Left = 229
      Top = 24
      Width = 67
      Height = 13
      Caption = 'Usuario Carga'
    end
    object edFechaCargaEstimado: TDateEdit
      Left = 118
      Top = 20
      Width = 93
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object edRelevamientosRecibidos: TIntEdit
      Left = 118
      Top = 44
      Width = 93
      Height = 21
      TabOrder = 1
      OnChange = edRelevamientosRecibidosChange
    end
    object edCantidadEstabEstimado: TIntEdit
      Left = 118
      Top = 68
      Width = 93
      Height = 21
      TabOrder = 2
    end
    object edPrioridadEstimado: TEdit
      Left = 300
      Top = 44
      Width = 204
      Height = 21
      TabOrder = 4
    end
    object edVigenciaEstimado: TEdit
      Left = 300
      Top = 68
      Width = 77
      Height = 21
      TabOrder = 5
    end
    object edUsuarioCargaEstimado: TEdit
      Left = 300
      Top = 20
      Width = 204
      Height = 21
      TabOrder = 3
    end
    object chkPresentoRectEstab: TCheckBox
      Left = 11
      Top = 96
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Present'#243' Rect.Estab.'
      TabOrder = 6
    end
  end
  object gbCargaDefinitiva: TGroupBox [2]
    Left = 0
    Top = 237
    Width = 514
    Height = 116
    Align = alTop
    Caption = 'Carga Definitiva'
    TabOrder = 3
    object lblFechaAprobado: TLabel
      Left = 11
      Top = 24
      Width = 87
      Height = 13
      Caption = 'Fecha Aprobaci'#243'n'
    end
    object lblVigenciaDefinitivo: TLabel
      Left = 229
      Top = 72
      Width = 41
      Height = 13
      Caption = 'Vigencia'
    end
    object lblRelevValidos: TLabel
      Left = 11
      Top = 48
      Width = 65
      Height = 13
      Caption = 'Relev.V'#225'lidos'
    end
    object lblCantidadEstabDefinitivo: TLabel
      Left = 11
      Top = 72
      Width = 104
      Height = 13
      Caption = 'Cant.Establecimientos'
    end
    object lblCumplimientoDefinitivo: TLabel
      Left = 197
      Top = 96
      Width = 95
      Height = 13
      Caption = 'Cumplimiento ----'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEstadoDefinitivo: TLabel
      Left = 229
      Top = 48
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object btnHistoricoDefinitivo: TSpeedButton
      Left = 381
      Top = 68
      Width = 23
      Height = 22
      Hint = 'Hist'#243'rico'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000000000000000000000000000000000006A5030001A15
        0E0010091F003D315000765C5F0090716D008C6C68007C332E00562427001B23
        34002F30400010084600C0B8B400CFCAC900F5F5F500FDFEFE004E372C009CCB
        E80020AFD70029B5DA0033BBDD003EC3E10046C8E40052D0E8005AD5EA0064DC
        EE006FE3F10077E9F40084F1F80061504900B4B2B400F2F3F400197FAA0099FF
        FF0022A1C9006EE2F1006EE2F1006EE2F1006EE2F1006EE2F1006EE2F1006EE2
        F1006EE2F1006EE2F1006EE2F100A8E2FF00756F6F00E4E5E700197FAA0099FF
        FF001A7BA700B8FFFF00B6FFFF00B3FFFF00B1FFFF00AEFFFF00ACFFFF00A9FF
        FF00A7FFFF00A4FFFF00A0FFFF007FE1EB00626A7300F3F3F400197FAA0099FF
        FF00C6FFFF00C4FFFF00C1FFFF00BFFFFF005DD3E90048B6CE003DC2E1005AD1
        E800B3FFFF00B0FFFF00AEFFFF0032587B002C2B2B00FAFAFA00197FAA0099FF
        FF00D4FFFF00D1FFFF00CCFBFB0093939300938D8D0095908700A7949400EFC2
        C20041BBD700BCFFFF00B9FFFF006C5C530028282600FF00FF00197FAA0091FA
        FC00DFFFFF00DDFFFF00ADADAD00ECDAAE00FFF6DA00FFEBCC00FFFFFB00F2E5
        B800F7C7C7004ACBE500C6FFFF005C4A4100716F6E00FF00FF00177EA9007DED
        F600EBFFFF00ACB3B300D9C5A600FFF2BF00FFEFBC00FFE8B500FFDCA900FFFB
        F400B7B59C0077868A00D2FFFF0057453C009D9B9A00FF00FF00137BA80067DE
        EE00F7FFFF00B7B7B700FFEAB900FFFFD400FFFFCC0099806700DDBF9500F9D0
        9E00FAEDC200CEAFAF00C8F9FC0059473E009C9A9900FF00FF000F79A60050CE
        E700FFFFFF00C8C8C800FCE6CD00FFFFFC00FFFFDC00999981007C6A5700FFE4
        B100F3E7BB00AA9B9B00EAFFFF00513F360048464500FF00FF000C76A5003BC1
        E000FFFFFF00D0D0D000C0BBB500FFFFFF00FFFFF400FFFFD900E2E2B6007C6A
        570096938900759BA000F5FFFF0047352C00372B2A00FF00FF000874A40025B2
        D900FFFFFF00FFFFFF00C8C8C800B9AB9D00FFFFFF00A2CEFF00FFFDCA00D3C1
        A0009D9D9D00FFFFFF00FFFFFF00584538004E3A3700FF00FF000572A30011A4
        D200FFFFFF00FFFFFF00FFFFFF00AAAAAA00ECECEC00D3D3D300D1D1D100A7A7
        A700FFFFFF00FFFFFF00FFFFFF0061413A00775A5900FF00FF00016FA2000099
        CC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00372C1A009F5E5C00FF00FF00006EA1000099
        CC002A7FAA002A7FAA002A7FAA002A7FAA002A7FAA002A7FAA002A7FAA002A7F
        AA002A7FAA002A7FAA002A7FAA006F574F00CC929100FF00FF001572A1000066
        990066DDEE0066DDEE0066DDEE0066DDEE0066DDEE0066DDEE0066DDEE0066DD
        EE0066DDEE0066DDEE0066DDEE006B5D5900ADA4A400FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnHistoricoDefinitivoClick
    end
    object lblUsuarioAprobado: TLabel
      Left = 229
      Top = 24
      Width = 65
      Height = 13
      Caption = 'U.Aprobaci'#243'n'
    end
    object lblRelevInval: TLabel
      Left = 159
      Top = 48
      Width = 18
      Height = 13
      Caption = 'Inv.'
    end
    object edFechaAprobado: TDateEdit
      Left = 118
      Top = 20
      Width = 96
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object edVigenciaDefinitivo: TEdit
      Left = 300
      Top = 68
      Width = 77
      Height = 21
      TabOrder = 5
    end
    object edRelevValidos: TIntEdit
      Left = 118
      Top = 44
      Width = 36
      Height = 21
      TabOrder = 1
    end
    object edCantidadEstabDefinitivo: TIntEdit
      Left = 118
      Top = 68
      Width = 96
      Height = 21
      TabOrder = 2
    end
    object edEstadoDefinitivo: TEdit
      Left = 300
      Top = 44
      Width = 204
      Height = 21
      TabOrder = 4
    end
    object edUsuarioAprobado: TEdit
      Left = 300
      Top = 20
      Width = 204
      Height = 21
      TabOrder = 3
    end
    object edRelevInval: TIntEdit
      Left = 178
      Top = 44
      Width = 36
      Height = 21
      TabOrder = 6
    end
  end
  object pnlNavigator: TPanel [3]
    Left = 0
    Top = 88
    Width = 514
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object pnlNavegacion: TPanel
      Left = 0
      Top = 0
      Width = 68
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      object btnPrimero: TBitBtn
        Left = 2
        Top = 2
        Width = 16
        Height = 21
        Hint = 'Primero'
        TabOrder = 0
        OnClick = btnPrimeroClick
        Glyph.Data = {
          76040000424D7604000000000000360000002800000016000000100000000100
          18000000000040040000C40E0000C40E0000000000000000000000FF00000000
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0010101010101000FF000000
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0016161616161600000000
          0000CFCF00000000FF0000FF0000FF0000FF0000FF00101010007F7F10101000
          0000A1A1A100000000FF0000FF0000FF0000FF0000FF00161616969696161616
          000000000000CFCF00000000FF0000FF0000FF0000FF00101010007F7F009090
          101010000000A1A1A100000000FF0000FF0000FF0000FF00161616969696A1A1
          A1161616000000000000CFCF00000000FF0000FF0000FF00101010007F7F0090
          9000CFCF101010000000A1A1A100000000FF0000FF0000FF00161616969696A1
          A1A1AAAAAA161616000000000000CFCF00000000FF0000FF00101010007F7F00
          909000CFCF00FFFF101010000000A1A1A100000000FF0000FF00161616969696
          A1A1A1AAAAAAB8B8B8000000000000000000CFCF00000000FF00101010007F7F
          00909000CFCF00FFFF00FFFF000000000000A1A1A100000000FF001616169696
          96A1A1A1AAAAAAB8B8B8B8B8B800000000000000002FFFFF000000101010007F
          7F00909000CFCF00FFFF00FFFF2FFFFF000000000000CACACA00000016161696
          9696A1A1A1AAAAAAB8B8B8B8B8B8C1C1C100000000000000002FFFFF10101000
          7F7F00909000CFCF00FFFF00FFFF2FFFFF60FFFF000000000000CACACA000000
          969696A1A1A1AAAAAAB8B8B8B8B8B8C1C1C1CACACA00000000000000002FFFFF
          002F2F007F7F00CFCF00FFFFEFF0FFEFF0FFEFF0FFEFF0FF000000000000CACA
          CA000000969696AAAAAAB8B8B8E3E3E3E3E3E3E3E3E3E3E3E300000000000000
          002FFFFF000000002F2F007F7F00FFFF2FFFFFEFF0FFCFFFFFCFFFFF00000000
          0000CACACA000000003333969696B8B8B8C1C1C1E3E3E3DADADADADADA000000
          00000000002FFFFF00000000FF00002F2F007F7F2FFFFFCFFFFFEFF0FFCFFFFF
          000000000000CACACA00000000FF00003333969696C1C1C1DADADAF1F1F1DADA
          DA00000000000000002FFFFF00000000FF0000FF00002F2F007F7FCFFFFFCFFF
          FFCFFFFF000000000000CACACA00000000FF0000FF00003333969696DADADADA
          DADADADADA0000000000000000CFFFFF00000000FF0000FF0000FF00002F2F00
          7F7FCFFFFFCFFFFF002F2F000000F1F1F100000000FF0000FF0000FF00003333
          969696DADADADADADA0033330000000000CFFFFF00000000FF0000FF0000FF00
          00FF00002F2F007F7FCFFFFF002F2F000000F1F1F100000000FF0000FF0000FF
          0000FF00003333969696DADADA0033330000000000CFFFFF00000000FF0000FF
          0000FF0000FF0000FF00002F2F007F7F002F2F000000F1F1F100000000FF0000
          FF0000FF0000FF0000FF00003333969696003333000000FF0000000000FF0000
          FF0000FF0000FF0000FF0000FF0000FF00002F2F002F2F00FF0000000000FF00
          00FF0000FF0000FF0000FF0000FF0000FF000033330033330000}
        NumGlyphs = 2
      end
      object btnAnterior: TBitBtn
        Left = 18
        Top = 2
        Width = 16
        Height = 21
        Hint = 'Anterior'
        TabOrder = 1
        OnClick = btnAnteriorClick
        Glyph.Data = {
          B6030000424DB603000000000000360000002800000012000000100000000100
          18000000000080030000C40E0000C40E0000000000000000000000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0010101010101000FF0000FF0000FF0000FF
          0000FF0000FF0000FF00161616161616000000FF0000FF0000FF0000FF0000FF
          0000FF00101010007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0016
          1616969696161616000000FF0000FF0000FF0000FF0000FF00101010007F7F00
          909010101000FF0000FF0000FF0000FF0000FF00161616969696A1A1A1161616
          000000FF0000FF0000FF0000FF00101010007F7F00909000CFCF10101000FF00
          00FF0000FF0000FF00161616969696A1A1A1AAAAAA161616000000FF0000FF00
          00FF00101010007F7F00909000CFCF00FFFF10101000FF0000FF0000FF001616
          16969696A1A1A1AAAAAAB8B8B8000000000000FF0000FF00101010007F7F0090
          9000CFCF00FFFF00FFFF00000000FF0000FF00161616969696A1A1A1AAAAAAB8
          B8B8B8B8B8000000000000FF00101010007F7F00909000CFCF00FFFF00FFFF2F
          FFFF00000000FF00161616969696A1A1A1AAAAAAB8B8B8B8B8B8C1C1C1000000
          0000101010007F7F00909000CFCF00FFFF00FFFF2FFFFF60FFFF000000161616
          969696A1A1A1AAAAAAB8B8B8B8B8B8C1C1C1CACACA0000000000002F2F007F7F
          00CFCF00FFFFEFF0FFEFF0FFEFF0FFEFF0FF000000003333969696AAAAAAB8B8
          B8E3E3E3E3E3E3E3E3E3E3E3E3000000000000FF00002F2F007F7F00FFFF2FFF
          FFEFF0FFCFFFFFCFFFFF00000000FF00003333969696B8B8B8C1C1C1E3E3E3DA
          DADADADADA000000000000FF0000FF00002F2F007F7F2FFFFFCFFFFFEFF0FFCF
          FFFF00000000FF0000FF00003333969696C1C1C1DADADAF1F1F1DADADA000000
          000000FF0000FF0000FF00002F2F007F7FCFFFFFCFFFFFCFFFFF00000000FF00
          00FF0000FF00003333969696DADADADADADADADADA000000000000FF0000FF00
          00FF0000FF00002F2F007F7FCFFFFFCFFFFF002F2F00FF0000FF0000FF0000FF
          00003333969696DADADADADADA003333000000FF0000FF0000FF0000FF0000FF
          00002F2F007F7FCFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000333396
          9696DADADA003333000000FF0000FF0000FF0000FF0000FF0000FF00002F2F00
          7F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF00003333969696003333
          000000FF0000FF0000FF0000FF0000FF0000FF0000FF00002F2F002F2F00FF00
          00FF0000FF0000FF0000FF0000FF0000FF000033330033330000}
        NumGlyphs = 2
      end
      object btnSiguiente: TBitBtn
        Left = 34
        Top = 2
        Width = 16
        Height = 21
        Hint = 'Siguiente'
        TabOrder = 2
        OnClick = btnSiguienteClick
        Glyph.Data = {
          F6030000424DF603000000000000360000002800000014000000100000000100
          180000000000C0030000C40E0000C40E0000000000000000000000FF00101010
          10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF001616161616
          1600FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00101010007F7F10
          101000FF0000FF0000FF0000FF0000FF0000FF0000FF00161616969696161616
          00FF0000FF0000FF0000FF0000FF0000FF0000FF00101010009090007F7F1010
          1000FF0000FF0000FF0000FF0000FF0000FF00161616A1A1A196969616161600
          FF0000FF0000FF0000FF0000FF0000FF0010101000CFCF009090007F7F101010
          00FF0000FF0000FF0000FF0000FF00161616AAAAAAA1A1A196969616161600FF
          0000FF0000FF0000FF0000FF0010101000FFFF00CFCF009090007F7F10101000
          FF0000FF0000FF0000FF00161616B8B8B8AAAAAAA1A1A196969616161600FF00
          00FF0000FF0000FF0010101000FFFF00FFFF00CFCF009090007F7F10101000FF
          0000FF0000FF00002F2FB8B8B8B8B8B8AAAAAAA1A1A196969616161600FF0000
          FF0000FF00002F2F2FFFFF00FFFF00FFFF00CFCF009090007F7F10101000FF00
          00FF00002F2FC1C1C1B8B8B8B8B8B8AAAAAAA1A1A196969616161600FF0000FF
          00002F2F60FFFF2FFFFF00FFFF00FFFF00CFCF009090007F7F10101000FF0000
          2F2FCACACAC1C1C1B8B8B8B8B8B8AAAAAAA1A1A196969616161600FF00002F2F
          EFF0FFEFF0FFEFF0FFEFF0FF00FFFF00CFCF007F7F002F2F00FF00002F2FE3E3
          E3E3E3E3E3E3E3E3E3E3B8B8B8AAAAAA96969600333300FF00002F2FCFFFFFCF
          FFFFEFF0FF2FFFFF00FFFF007F7F002F2F00FF0000FF00002F2FDADADADADADA
          E3E3E3C1C1C1B8B8B896969600333300FF0000FF00002F2FCFFFFFEFF0FFCFFF
          FF2FFFFF007F7F002F2F00FF0000FF0000FF00002F2FDADADAF1F1F1DADADAC1
          C1C196969600333300FF0000FF0000FF00002F2FCFFFFFCFFFFFCFFFFF007F7F
          002F2F00FF0000FF0000FF0000FF00003333DADADADADADADADADA9696960033
          3300FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFF007F7F002F2F00FF0000
          FF0000FF0000FF0000FF00003333DADADADADADA96969600333300FF0000FF00
          00FF0000FF0000FF00002F2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF
          0000FF0000FF00003333DADADA96969600333300FF0000FF0000FF0000FF0000
          FF0000FF00002F2F007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000333396969600333300FF0000FF0000FF0000FF0000FF0000FF0000FF
          00002F2F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          333300333300FF0000FF0000FF0000FF0000FF0000FF0000FF00}
        NumGlyphs = 2
      end
      object btnUltimo: TBitBtn
        Left = 50
        Top = 2
        Width = 16
        Height = 21
        Hint = #218'ltimo'
        TabOrder = 3
        OnClick = btnUltimoClick
        Glyph.Data = {
          B6040000424DB604000000000000360000002800000018000000100000000100
          18000000000080040000C40E0000C40E0000000000000000000000FF00101010
          10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF
          0016161616161600FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000
          FF0000FF00101010007F7F10101000FF0000FF0000FF0000FF0000FF00000000
          00CFCF00000000FF0016161696969616161600FF0000FF0000FF0000FF0000FF
          00000000A1A1A100000000FF00101010009090007F7F10101000FF0000FF0000
          FF0000FF0000000000CFCF00000000FF00161616A1A1A196969616161600FF00
          00FF0000FF0000FF00000000A1A1A100000000FF0010101000CFCF009090007F
          7F10101000FF0000FF0000FF0000000000CFCF00000000FF00161616AAAAAAA1
          A1A196969616161600FF0000FF0000FF00000000A1A1A100000000FF00101010
          00FFFF00CFCF009090007F7F10101000FF0000FF0000000000CFCF00000000FF
          00161616B8B8B8AAAAAAA1A1A196969616161600FF0000FF00000000A1A1A100
          000000FF0010101000FFFF00FFFF00CFCF009090007F7F10101000FF00000000
          00CFCF00000000FF00002F2FB8B8B8B8B8B8AAAAAAA1A1A196969616161600FF
          00000000A1A1A100000000FF00002F2F2FFFFF00FFFF00FFFF00CFCF00909000
          7F7F0000000000002FFFFF00000000FF00002F2FC1C1C1B8B8B8B8B8B8AAAAAA
          A1A1A1969696000000000000CACACA00000000FF00002F2F60FFFF2FFFFF00FF
          FF00FFFF00CFCF009090007F7F0000002FFFFF10101000FF00002F2FCACACAC1
          C1C1B8B8B8B8B8B8AAAAAAA1A1A1969696000000CACACA00000000FF00002F2F
          EFF0FFEFF0FFEFF0FFEFF0FF00FFFF00CFCF007F7F0000002FFFFF002F2F00FF
          00002F2FE3E3E3E3E3E3E3E3E3E3E3E3B8B8B8AAAAAA969696000000CACACA00
          000000FF00002F2FCFFFFFCFFFFFEFF0FF2FFFFF00FFFF007F7F002F2F000000
          2FFFFF00000000FF00002F2FDADADADADADAE3E3E3C1C1C1B8B8B8969696002F
          2F000000CACACA00000000FF00002F2FCFFFFFEFF0FFCFFFFF2FFFFF007F7F00
          2F2F00FF000000002FFFFF00000000FF00002F2FDADADAF1F1F1DADADAC1C1C1
          96969600333300FF00000000CACACA00000000FF00002F2FCFFFFFCFFFFFCFFF
          FF007F7F002F2F00FF0000FF000000002FFFFF00000000FF00003333DADADADA
          DADADADADA96969600333300FF0000FF00000000CACACA00000000FF00002F2F
          CFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF00000000CFFFFF00000000FF
          00003333DADADADADADA96969600333300FF0000FF0000FF00000000F1F1F100
          000000FF00002F2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF00000000
          CFFFFF00000000FF00003333DADADA96969600333300FF0000FF0000FF0000FF
          00000000F1F1F100000000FF00002F2F007F7F002F2F00FF0000FF0000FF0000
          FF0000FF00000000CFFFFF00000000FF0000333396969600333300FF0000FF00
          00FF0000FF0000FF00000000F1F1F100000000FF00002F2F002F2F00FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000333300333300
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF00}
        NumGlyphs = 2
      end
    end
  end
  object pnlTop: TPanel [4]
    Left = 0
    Top = 0
    Width = 514
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblCUIT: TLabel
      Left = 4
      Top = 11
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label1: TLabel
      Left = 3
      Top = 36
      Width = 109
      Height = 13
      Caption = 'Fecha Vigencia desde:'
    end
    object Label2: TLabel
      Left = 227
      Top = 36
      Width = 106
      Height = 13
      Caption = 'Fecha Vigencia hasta:'
    end
    inline fraEmpresa: TfraEmpresa
      Left = 33
      Top = 8
      Width = 472
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
      inherited lbContrato: TLabel
        Left = 368
      end
      inherited mskCUIT: TMaskEdit
        OnChange = fraEmpresamskCUITChange
      end
      inherited edContrato: TIntEdit
        Left = 415
      end
      inherited cmbRSocial: TArtComboBox
        Width = 233
        Columns = <
          item
            Expanded = False
            FieldName = 'CUIT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Caption = 'Contrato'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Raz'#243'n Social'
            Width = 260
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'co_vigenciadesde'
            Title.Caption = 'Vigencia Desde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'co_vigenciahasta'
            Title.Caption = 'Vigencia Hasta'
            Visible = True
          end>
      end
    end
    object edVigenciaDesde: TDateEdit
      Left = 114
      Top = 32
      Width = 93
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object edVigenciaHasta: TDateEdit
      Left = 338
      Top = 32
      Width = 93
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  object CoolBar: TCoolBar [5]
    Left = 0
    Top = 59
    Width = 514
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 510
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 497
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbNuevo: TToolButton
        Left = 0
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        ImageIndex = 6
        Visible = False
        OnClick = tbNuevoClick
      end
      object tbEliminar: TToolButton
        Left = 23
        Top = 0
        Hint = 'Dar de Baja (Ctrl+Del)'
        ImageIndex = 8
        Visible = False
        OnClick = tbEliminarClick
      end
      object ToolButton4: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
        Visible = False
      end
      object tbVerDetalle: TToolButton
        Left = 54
        Top = 0
        Hint = 'Ver Detalle Actual'
        ImageIndex = 13
        OnClick = tbVerDetalleClick
      end
      object tbEstablecimientos: TToolButton
        Left = 77
        Top = 0
        Hint = 'Establecimientos'
        ImageIndex = 15
        OnClick = tbEstablecimientosClick
      end
      object ToolButton3: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 108
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object ToolButton11: TToolButton
        Left = 131
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 139
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object fpDetalle: TFormPanel [6]
    Left = 434
    Top = 51
    Width = 516
    Height = 238
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    object CoolBar1: TCoolBar
      Left = 0
      Top = 0
      Width = 516
      Height = 29
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 27
          Width = 512
        end>
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 499
        Height = 27
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = []
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbDetalleActual: TToolButton
          Left = 0
          Top = 0
          Hint = 'Salir (Ctrl+S)'
          ImageIndex = 5
          OnClick = tbDetalleActualClick
        end
      end
    end
    object Grid: TArtDBGrid
      Left = 0
      Top = 29
      Width = 516
      Height = 209
      Align = alClient
      DataSource = dsConsultaDetalle
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'ES_ID'
          Title.Caption = 'Nombre'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ES_NROESTABLECI'
          Title.Caption = 'Nro.Estab.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ES_NOMBRE'
          Title.Caption = 'Nombre'
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ES_FECHAALTA'
          Title.Caption = 'F.Alta'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rl_vigencia'
          Title.Caption = 'Vigencia'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'conrelev'
          Title.Caption = 'Con Relev.'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rl_valido'
          Title.Caption = 'Relev.V'#225'lido'
          Width = 67
          Visible = True
        end>
    end
  end
  object fpHistorico: TFormPanel [7]
    Left = 434
    Top = 141
    Width = 544
    Height = 238
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    object CoolBar2: TCoolBar
      Left = 0
      Top = 29
      Width = 544
      Height = 29
      Bands = <
        item
          Control = ToolBar2
          ImageIndex = -1
          MinHeight = 27
          Width = 540
        end>
      object ToolBar2: TToolBar
        Left = 9
        Top = 0
        Width = 527
        Height = 27
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = []
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbRefrescar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar (F5)'
          ImageIndex = 0
          OnClick = tbRefrescarClick
        end
        object ToolButton1: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object tbHistorico: TToolButton
          Left = 31
          Top = 0
          Hint = 'Salir (Ctrl+S)'
          ImageIndex = 5
          OnClick = tbHistoricoClick
        end
      end
    end
    object ArtDBGrid1: TArtDBGrid
      Left = 0
      Top = 58
      Width = 544
      Height = 180
      Align = alClient
      DataSource = dsConsultaHistorico
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'CR_VIGENCIA'
          Title.Caption = 'Vigencia'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CR_CANTRELEVAMIENTOS'
          Title.Caption = 'Relev. V'#225'lidos'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CR_CANTRELEVINVAL'
          Title.Caption = 'Relev. Inv'#225'lidos'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CR_CANTESTABLECIMIENTOS'
          Title.Caption = 'Cant.Estab'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CR_CUMPLIMIENTO'
          Title.Caption = 'Cumplimiento'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPOCARGA'
          Title.Caption = 'Tipo Carga'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Title.Caption = 'Estado'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CR_FECHAAUTORIZACION'
          Title.Caption = 'F.Aprobaci'#243'n'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CR_USUAUTORIZACION'
          Title.Caption = 'Usu.Aprobaci'#243'n'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CR_FECHAALTA'
          Title.Caption = 'F.Alta'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CR_USUALTA'
          Title.Caption = 'Usu.Alta'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CR_FECHAMODIF'
          Title.Caption = 'F.Modif.'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CR_USUMODIF'
          Title.Caption = 'Usu.Modif'
          Width = 82
          Visible = True
        end>
    end
    object pnlFiltroHistorico: TPanel
      Left = 0
      Top = 0
      Width = 544
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblTipodeCarga: TLabel
        Left = 9
        Top = 8
        Width = 67
        Height = 13
        Caption = 'Tipo de Carga'
      end
      object cmbTipoCarga: TExComboBox
        Left = 81
        Top = 3
        Width = 145
        Height = 22
        Style = csOwnerDrawFixed
        Enabled = False
        ItemHeight = 16
        TabOrder = 0
        Items.Strings = (
          'T=Todos'
          'E=Estimada'
          'R=Definitiva')
        ItemIndex = -1
        Options = []
        ValueWidth = 64
      end
    end
  end
  inherited FormStorage: TFormStorage
    Active = False
    Left = 304
    Top = 328
  end
  inherited XPMenu: TXPMenu
    Left = 332
    Top = 328
  end
  inherited ilByN: TImageList
    Left = 304
    Top = 300
  end
  inherited ilColor: TImageList
    Left = 332
    Top = 300
  end
  inherited IconosXP: TImageList
    Left = 360
    Top = 300
  end
  object sdqDatosEstimados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   er_id, er_contrato, er_vigencia, er_cantrelevamientos, ' +
        'er_cantestablecimientos, er_fechaalta, er_usualta,'
      
        '         er_fechamodif, er_usumodif, er_fechabaja, er_usubaja, e' +
        'r_prioridad,'
      
        '         DECODE(er_prioridad, 1, '#39'Traspaso Egreso'#39', 2, '#39'Renovaci' +
        #243'n'#39', 3, '#39'Alta Contrato'#39') prioridad, er_rectificativaestab'
      '    FROM hys.her_estimacionrelevamiento'
      '   WHERE er_contrato = :contrato'
      '     AND er_fechabaja IS NULL'
      'UNION ALL'
      
        'SELECT   cr_id, cr_contrato, cr_vigencia, 0, 0, NULL, NULL, NULL' +
        ', NULL, NULL, NULL, NULL, '#39'Estimado No Cargado'#39', NULL'
      '    FROM hys.hcr_cumplimientorelev'
      '   WHERE cr_id IN(SELECT   MAX(cr_id)'
      '                      FROM hys.hcr_cumplimientorelev'
      '                     WHERE cr_contrato = :contrato'
      '                       AND cr_tipocarga = '#39'R'#39
      '                       AND NOT EXISTS(SELECT 1'
      
        '                                        FROM hys.her_estimacionr' +
        'elevamiento'
      
        '                                       WHERE er_contrato = cr_co' +
        'ntrato'
      
        '                                         AND er_vigencia = cr_vi' +
        'gencia'
      
        '                                         AND er_fechabaja IS NUL' +
        'L)'
      '                  GROUP BY cr_vigencia)'
      'ORDER BY 3, 1 DESC'
      '')
    Left = 453
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object sdqDatosDefinitivo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT cr_id, cr_vigencia, cr_contrato, cr_cantestablecimientos,' +
        ' cr_cantrelevamientos, cr_cumplimiento, cr_tipocarga,'
      
        '       cr_fechaalta, cr_usualta, cr_fechaautorizacion, cr_usuaut' +
        'orizacion, cr_vigenciadesde, cr_vigenciahasta, cr_fechamodif,'
      
        '       cr_usumodif, cr_estado, decode(cr_estado, '#39'A'#39', '#39'Aprobado'#39 +
        ', '#39'P'#39', '#39'Cargando...'#39') estado, CR_CANTRELEVINVAL'
      '  FROM hys.hcr_cumplimientorelev'
      ' WHERE  cr_contrato = :contrato AND'
      '                 cr_tipocarga = '#39'R'#39' AND '
      
        '                 (cr_vigenciadesde <= SYSDATE OR cr_vigenciadesd' +
        'e IS NULL)  AND '
      
        '                 (cr_vigenciahasta > SYSDATE  OR cr_vigenciahast' +
        'a IS NULL)'
      'ORDER BY CR_ID desc'
      '')
    Left = 481
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object sdqConsultaDetalle: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   es_id, es_nroestableci, es_nombre, es_fechaalta, rl_vig' +
        'encia, NVL2(rl_fechaalta, '#39'S'#39', '#39'N'#39') conrelev, rl_valido'
      '    FROM afi.aes_establecimiento, hys.hrl_relevriesgolaboral'
      '   WHERE es_contrato = :contrato'
      '     AND es_fechabaja IS NULL'
      '     AND es_contrato = rl_contrato'
      '     AND es_nroestableci = rl_estableci'
      '     AND rl_fechabaja IS NULL'
      '     AND rl_vigencia = :vigencia'
      'UNION ALL'
      
        'SELECT   es_id, es_nroestableci, es_nombre, es_fechaalta, :vigen' +
        'cia, '#39'N'#39', '#39'N'#39
      '    FROM afi.aes_establecimiento'
      '   WHERE es_contrato = :contrato'
      '     AND es_fechabaja IS NULL'
      '     AND NOT EXISTS(SELECT 1'
      '                      FROM hys.hrl_relevriesgolaboral'
      '                     WHERE es_contrato = rl_contrato'
      '                       AND es_nroestableci = rl_estableci'
      '                       AND rl_fechabaja IS NULL)'
      'ORDER BY 1')
    Left = 480
    Top = 100
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'vigencia'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'vigencia'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object dsConsultaDetalle: TDataSource
    DataSet = sdqConsultaDetalle
    Left = 452
    Top = 100
  end
  object dsConsultaHistorico: TDataSource
    DataSet = sdqConsultaHistorico
    Left = 444
    Top = 196
  end
  object sdqConsultaHistorico: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   cr_id, cr_vigencia, cr_cantrelevamientos, cr_cantestabl' +
        'ecimientos, cr_cumplimiento,'
      
        '         DECODE(cr_tipocarga, '#39'E'#39', '#39'Estimado'#39', '#39'R'#39', '#39'Definitivo'#39 +
        ') tipocarga, cr_fechaautorizacion, cr_usuautorizacion,'
      
        '         cr_vigenciadesde, cr_vigenciahasta, cr_fechamodif, cr_u' +
        'sumodif, cr_fechaalta, cr_usualta,'
      
        '         DECODE(cr_estado, '#39'A'#39', '#39'Aprobado'#39', '#39'P'#39', '#39'Cargando...'#39') ' +
        'estado, CR_CANTRELEVINVAL'
      '    FROM hys.hcr_cumplimientorelev'
      '   WHERE cr_vigencia = :vigencia'
      '     AND cr_contrato = :contrato'
      '     AND (   cr_tipocarga = :tipocarga'
      '          OR :tipocarga = '#39'T'#39')'
      'ORDER BY 1 DESC'
      '')
    Left = 472
    Top = 196
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vigencia'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipocarga'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipocarga'
        ParamType = ptInput
      end>
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 744
    Top = 84
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
      end
      item
        Key = 16457
      end
      item
        Key = 16453
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 360
    Top = 328
  end
end
