object frmAutAprob: TfrmAutAprob
  Left = 467
  Top = 125
  ActiveControl = fraPrestadorAprob.mskPrestCUIT
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Autorizaciones - Aprobaci'#243'n / Rechazo'
  ClientHeight = 557
  ClientWidth = 774
  Color = clBtnFace
  Constraints.MinHeight = 561
  Constraints.MinWidth = 782
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000000000000680500001600000028000000100000002000
    0000010008000000000000010000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C000C0DC
    C000F0CAA60004040400080808000C0C0C0011111100161616001C1C1C002222
    220029292900555555004D4D4D004242420039393900807CFF005050FF009300
    D600FFECCC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000
    CC00003300000033330000336600003399000033CC000033FF00006600000066
    330000666600006699000066CC000066FF000099000000993300009966000099
    99000099CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CC
    FF0000FF660000FF990000FFCC00330000003300330033006600330099003300
    CC003300FF00333300003333330033336600333399003333CC003333FF003366
    00003366330033666600336699003366CC003366FF0033990000339933003399
    6600339999003399CC003399FF0033CC000033CC330033CC660033CC990033CC
    CC0033CCFF0033FF330033FF660033FF990033FFCC0033FFFF00660000006600
    330066006600660099006600CC006600FF006633000066333300663366006633
    99006633CC006633FF00666600006666330066666600666699006666CC006699
    00006699330066996600669999006699CC006699FF0066CC000066CC330066CC
    990066CCCC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00
    CC009999000099339900990099009900CC009900000099333300990066009933
    CC009900FF00996600009966330099336600996699009966CC009933FF009999
    330099996600999999009999CC009999FF0099CC000099CC330066CC660099CC
    990099CCCC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FF
    FF00CC00000099003300CC006600CC009900CC00CC0099330000CC333300CC33
    6600CC339900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66
    CC009966FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC
    0000CCCC3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF
    6600CCFF9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF33
    3300FF336600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF66
    9900FF66CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99
    FF00FFCC0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF
    6600FFFF9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF
    66002100A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7
    D700DDDDDD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000A0A
    0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A2D0A0A0A0A0A0A0A0A0A0A
    0A0A0A0A2D2D0A0A0A0A0A0A0A0A0A0A0A0A0A2D2D2D0A0A0A0A0A0A0A0A0A0A
    0A0A2D2D022D2D0A0A0A0A0A0A0A0A0A0A2D2D020A022D0A0A0A0A0A0A0A0A0A
    2D2D020A0A022D2D0A0A0A0A0A0A0A0A0A0A0A0A0A0A022D0A0A0A0A0A0A0A0A
    0A0A0A0A0A0A0A022D0A0A0A0A0A0A0A0A0A0A0A0A0A0A022D2D0A0A0A0A0A0A
    0A0A0A0A0A0A0A0A022D0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A022D0A0A0A0A0A
    0A0A0A0A0A0A0A0A0A0A022D0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A022D0A0A0A
    0A0A0A0A0A0A0A0A0A0A0A0A020A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A02FFFF
    D700FEFFDD00FCFFE300F8FFEA00F07FF100E27FF800C63FFF00FF3FA000FF9F
    8000FF8FFF00FFCF0000FFE7FF00FFF30000FFF9FF00FFFD0000FFFEFF00}
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  DesignSize = (
    774
    557)
  PixelsPerInch = 96
  TextHeight = 13
  object grpPaciente: TGroupBox
    Left = 0
    Top = 0
    Width = 774
    Height = 56
    Align = alTop
    Caption = 'Paciente'
    TabOrder = 0
    DesignSize = (
      774
      56)
    object lbTrabCUIL: TLabel
      Left = 4
      Top = 16
      Width = 23
      Height = 13
      Caption = 'CUIL'
    end
    object lbTrabNombre: TLabel
      Left = 148
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object lbTrabFecha: TLabel
      Left = 155
      Top = 37
      Width = 29
      Height = 13
      Caption = 'Fecha'
    end
    object lbTrabDiagn: TLabel
      Left = 265
      Top = 37
      Width = 55
      Height = 13
      Caption = 'Diagn'#243'stico'
    end
    object lbTrabNumAuto: TLabel
      Left = 687
      Top = 37
      Width = 42
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'N'#186' Auto.'
      ExplicitLeft = 685
    end
    object lbTrabSiniestro: TLabel
      Left = 3
      Top = 37
      Width = 41
      Height = 13
      Caption = 'Siniestro'
    end
    object btnSiniMasDatos: TSpeedButton
      Left = 136
      Top = 33
      Width = 14
      Height = 19
      Hint = 'Ver datos del Siniestro'
      Flat = True
      Glyph.Data = {
        0E010000424D0E01000000000000360000002800000007000000090000000100
        180000000000D8000000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000000000000000FF0000FF0000000000FF
        0000FF0000FF0000000000FF0000000000FF0000FF0000000000FF0000FF0000
        000000FF0000FF0000000000FF0000FF0000000000FF0000000000FF0000FF00
        00FF0000000000FF0000FF0000000000000000FF0000FF0000000000FF0000FF
        0000000000FF0000000000FF0000000000FF0000FF0000000000FF0000FF0000
        000000000000FF0000FF0000000000FF0000FF0000FF0000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSiniMasDatosClick
    end
    object btnTrabajador: TSpeedButton
      Left = 723
      Top = 11
      Width = 22
      Height = 20
      Hint = 'Modificar Datos del Trabajador (Ctrl+T)'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        36050000424D360500000000000036000000280000001A000000100000000100
        18000000000000050000C40E0000C40E0000000000000000000000FF00000033
        0000330000990000800000FF0000CC0000CC00009900008004040400FF0000FF
        0000FF005F5F5F5F5F5F5F5F5F5555557777776666666666666666665F5F5F77
        777700FF0000FF00000000FF0000FF000000FF000099000080969696A4A0A086
        868666666604040400FF0000FF0000FF0000FF0000FF007777775F5F5F4D4D4D
        969696A4A0A086868666666677777700FF0000FF0000FF00000000FF0000FF00
        000080969696C0C0C0B2B2B2A4A0A086868604040400FF0000FF0000FF0000FF
        0000FF0000FF00555555969696C0C0C0B2B2B2A4A0A086868680808000FF0000
        FF0000FF0000FF00000000FF0000FF00040404CCCCCCC0C0C0B2B2B2A4A0A086
        868604040404040404040400FF0000FF0000FF0000FF00808080CCCCCCC0C0C0
        B2B2B2A4A0A086868680808080808080808000FF0000FF00000000FF00040404
        1C1C1C040404C0C0C0B2B2B2A4A0A004040404040404040404040404040400FF
        0000FF00808080808080868686C0C0C0B2B2B2A4A0A080808080808080808080
        808080808000FF00000000FF001C1C1C1C1C1C040404040404C0C0C0CCCCCCCC
        CCCCCCCCCCCCCCCCC0C0C004040400FF0000FF00868686808080868686868686
        C0C0C0CCCCCCCCCCCCCCCCCCCCCCCCC0C0C080808000FF0000001C1C1C1C1C1C
        1C1C1C040404040404040404DDDDDDD7D7D7D7D7D7CCCCCCC0C0C004040400FF
        00808080808080808080868686868686868686DDDDDDD7D7D7D7D7D7CCCCCCC0
        C0C080808000FF0000001C1C1C1C1C1C040404040404040404C0C0C0DDDDDDDD
        DDDDD7D7D7CCCCCCC0C0C0040404040404808080808080868686868686868686
        C0C0C0DDDDDDDDDDDDD7D7D7CCCCCCC0C0C086868680808000001C1C1C1C1C1C
        040404040404C0C0C0E3E3E3E3E3E3DDDDDDD7D7D7D7D7D7CCCCCCC0C0C000FF
        00808080808080868686868686C0C0C0DDDDDDDDDDDDDDDDDDD7D7D7D7D7D7CC
        CCCCC0C0C000FF0000001C1C1C1C1C1C040404040404040404C0C0C0DDDDDDDD
        DDDDDDDDDDFF0000E3E3E304040400FF00808080868686868686868686868686
        C0C0C0DDDDDDDDDDDDDDDDDD5F5F5FDDDDDD86868600FF0000001C1C1C1C1C1C
        1C1C1C040404040404040404040404DDDDDDDDDDDD04040404040404040400FF
        00808080808080808080868686868686868686868686DDDDDDDDDDDD86868686
        868686868600FF0000001C1C1C1C1C1C1C1C1C040404040404040404040404C0
        C0C0DDDDDDDDDDDDCCCCCC04040400FF00808080808080808080868686868686
        868686868686C0C0C0DDDDDDDDDDDDCCCCCC86868600FF00000000FF001C1C1C
        1C1C1C1C1C1C040404040404040404040404C0C0C0DDDDDDCCCCCC04040400FF
        0000FF00808080808080808080868686868686868686868686C0C0C0DDDDDDCC
        CCCC86868600FF00000000FF001C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C04
        040404040404040404040404040400FF0000FF00868686808080808080808080
        86868680808086868686868686868686868686868600FF00000000FF0000FF00
        1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C0404040404040404040404041C1C1C00FF
        0000FF0000FF0080808080808080808080808080808086868686868686868686
        868680808000FF00000000FF0000FF0000FF001C1C1C1C1C1C1C1C1C1C1C1C1C
        1C1C1C1C1C1C1C1C1C1C1C00FF0000FF0000FF0000FF0000FF00868686808080
        80808080808086868680808080808080808000FF0000FF000000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnTrabajadorClick
      ExplicitLeft = 721
    end
    object btnSIC: TSpeedButton
      Left = 746
      Top = 11
      Width = 22
      Height = 20
      Hint = 'SIC - Agenda de Eventos'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFCFFFFF9FFFFFAFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFEF6F3F1EEE5DD568ED10075E2007BE70079E720
        7AD8A5B8D3FCF3E8F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBF9E3E0E0
        0C72D90F98FF3A9AF06BA9E55EA6E71090FD0F90F56896D1FFF9EEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF2C84E00E95FFA4C1DBF2EBD8EAEADFF1EFE2EA
        E2D12B8FEF0E8EF4C8D9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D9F20D8EF3
        76ADE2F3EEE0E8EBE9F1F4F33F3C37EEF3EFEBE2CF1090FC3289E0FFFFFEFFFF
        FAFFFFFAFFFFF9FFFFFF8CB6E9088BF9D8DBD9EBEEEAFFFFFF52534E9D9E9BF2
        F7F5E8E6D9539DE4198BEC136A9E1676B41575B21275B28EADC192BBEB007EF3
        EBE5D8EEF0EEFFFFFF4C4C483C3D37DADDDBF3F2E75998DA198CF0968A779B9A
        91A39F935D819581AFCD92B9EA118EF4B1C2D5F3F3ECF3F5F3FFFFFFD3D4D23D
        3C35BCB29F378FE72790ECFFFFFFB4B8B5A2A19C5D869E82AFCCFFFFFF0380E9
        277DD8F8EEDAF0F2ECECEFECEFF2EFFFFEF1A3B7CF1195FF618AB8BDB6AEEBEB
        EBD0CECA729BB280ADCAFFFFFF97BAE80F90F42375D2AEBCCBE9E1D2D5D4CE6A
        93C50987F33692E9A29588BBB9B8FBFBFBFFFFFF49728983B0CDFFFFFFFFFFFF
        91B6E8007BE8138DF1097EEA158AF20E8DF34594E4D4CBC69C9A95A8A7A5F5F4
        F5FFFFFF4C748B83B0CDFFFFFFFFFFFFFFFFFFFFFFFE8DB6EB3C84CB2767A4E4
        E9F6E1D8CCEBEBEAEDEDEDECEDEDC8CBCAFFFFFF4D748B83B0CDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7BAAC64C7080FFFFFF88908EC0C1BEFFFFFFC0C1BE8890
        8EFFFFFF4B718683B0CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A9DBE629CC03D
        677FD2CFC9677E8845718A667D87D3D0CA3F698066A0C479A7C4FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE8F1F5689CBD6AA2C5DAD5CF7693A170A8CB85A0AFCCC7
        C26BA3C6689CBDEDF3F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC8CAC9FCFAF8FFFFFFFBF9F7C9CBCAFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      Transparent = False
      OnClick = btnSICClick
      ExplicitLeft = 744
    end
    object edTrabCUIL: TEdit
      Left = 45
      Top = 11
      Width = 89
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      Text = '__-________-_'
    end
    object edTrabNombre: TEdit
      Left = 188
      Top = 11
      Width = 535
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edSiniFecha: TEdit
      Left = 188
      Top = 33
      Width = 68
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
      Text = '__/__/____'
    end
    object edSiniDiagnostico: TEdit
      Left = 324
      Top = 33
      Width = 359
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edNroAuto: TEdit
      Left = 730
      Top = 33
      Width = 39
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edSiniestro: TEdit
      Left = 45
      Top = 33
      Width = 89
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
  end
  object grpPrestador: TGroupBox
    Left = 0
    Top = 56
    Width = 774
    Height = 38
    Align = alTop
    Caption = 'Prestador'
    TabOrder = 1
    DesignSize = (
      774
      38)
    inline fraPrestadorAut: TfraPrestador
      Left = 2
      Top = 11
      Width = 768
      Height = 24
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 11
      ExplicitWidth = 768
      ExplicitHeight = 24
      DesignSize = (
        751
        24)
      inherited lbLocalidad: TLabel
        Left = 286
        ExplicitLeft = 286
      end
      inherited lbCPostal: TLabel
        Left = 510
        ExplicitLeft = 678
      end
      inherited lbTelefono: TLabel
        Left = 406
        Visible = True
        ExplicitLeft = 574
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 92
        ExplicitWidth = 92
      end
      inherited cmbPrestador: TArtComboBox
        Width = 252
        ExplicitWidth = 252
      end
      inherited edPresDomicilio: TEdit
        Width = 225
        ExplicitWidth = 225
      end
      inherited edPresLocalidad: TEdit
        Left = 336
        Width = 66
        ExplicitLeft = 336
        ExplicitWidth = 66
      end
      inherited edPresCPostal: TEdit
        Left = 527
        ExplicitLeft = 527
      end
      inherited edPresTelefono: TEdit
        Left = 425
        Width = 82
        Visible = True
        ExplicitLeft = 425
        ExplicitWidth = 82
      end
    end
  end
  object grpPrestacion: TGroupBox
    Left = 0
    Top = 94
    Width = 774
    Height = 96
    Align = alTop
    Caption = 'Prestaci'#243'n'
    TabOrder = 2
    DesignSize = (
      774
      96)
    object lbPrestFSolicitud: TLabel
      Left = 4
      Top = 13
      Width = 49
      Height = 13
      Caption = 'F.Solicitud'
    end
    object lbPrestFRecep: TLabel
      Left = 142
      Top = 13
      Width = 59
      Height = 13
      Caption = 'F.Recepci'#243'n'
    end
    object lbPrestPrestacion: TLabel
      Left = 2
      Top = 57
      Width = 60
      Height = 13
      Caption = 'T.Prestaci'#243'n'
    end
    object lbPrestCantidad: TLabel
      Left = 289
      Top = 13
      Width = 43
      Height = 13
      Caption = 'Cantidad'
    end
    object lbPrestDetalle: TLabel
      Left = 4
      Top = 77
      Width = 33
      Height = 13
      Caption = 'Detalle'
    end
    object lbPrestImporte: TLabel
      Left = 396
      Top = 13
      Width = 38
      Height = 13
      Caption = 'Importe'
    end
    object Label6: TLabel
      Left = 519
      Top = 13
      Width = 33
      Height = 13
      Caption = 'M'#233'dico'
    end
    object Label12: TLabel
      Left = 519
      Top = 36
      Width = 47
      Height = 13
      Caption = 'Subprest.'
    end
    object lbPrestFDesde: TLabel
      Left = 4
      Top = 35
      Width = 40
      Height = 13
      Caption = 'F.Desde'
    end
    object lbPrestFHasta: TLabel
      Left = 164
      Top = 36
      Width = 38
      Height = 13
      Caption = 'F.Hasta'
    end
    object Label15: TLabel
      Left = 284
      Top = 36
      Width = 66
      Height = 13
      Caption = 'G. de Trabajo'
    end
    object Label17: TLabel
      Left = 270
      Top = 57
      Width = 50
      Height = 13
      Caption = 'Prestaci'#243'n'
    end
    object edPrestDetalle: TEdit
      Left = 64
      Top = 72
      Width = 705
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edPrestacFSolicitud: TEdit
      Left = 64
      Top = 9
      Width = 75
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '__/__/____'
    end
    object edPrestFRecepcion: TEdit
      Left = 205
      Top = 9
      Width = 75
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '__/__/____'
    end
    object edPrestPrestacCodigo: TEdit
      Left = 64
      Top = 51
      Width = 48
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edPrestPrestDescripcion: TEdit
      Left = 112
      Top = 51
      Width = 155
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edPrestImporte: TEdit
      Left = 435
      Top = 9
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edMedico: TEdit
      Left = 557
      Top = 9
      Width = 213
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object edPrestCodSubPrest: TEdit
      Left = 568
      Top = 30
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object edPrestDescSubPrest: TEdit
      Left = 610
      Top = 30
      Width = 160
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object edPrestFDesde: TEdit
      Left = 64
      Top = 30
      Width = 75
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
      Text = '__/__/____'
    end
    object edPrestFHasta: TEdit
      Left = 205
      Top = 30
      Width = 75
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      Text = '__/__/____'
    end
    object edPrestGTrabajo: TEdit
      Left = 353
      Top = 30
      Width = 163
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object edNomNomenclador: TEdit
      Left = 322
      Top = 51
      Width = 17
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object edNomCapitulo: TEdit
      Left = 339
      Top = 51
      Width = 25
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object edNomCodigo: TEdit
      Left = 364
      Top = 51
      Width = 59
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
    end
    object edNomDescripcion: TEdit
      Left = 424
      Top = 51
      Width = 346
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object edPrestCantidad: TCurrencyEdit
      Left = 336
      Top = 9
      Width = 52
      Height = 20
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clBtnFace
      DisplayFormat = ' ,0.00;- ,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
    end
  end
  object groAprobacion: TGroupBox
    Left = 0
    Top = 216
    Width = 774
    Height = 304
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Aprobaci'#243'n / Rechazo'
    TabOrder = 4
    DesignSize = (
      774
      304)
    object lbAproCantidad: TLabel
      Left = 300
      Top = 164
      Width = 27
      Height = 13
      Caption = 'Cant.'
    end
    object lbAproDetalle: TLabel
      Left = 6
      Top = 196
      Width = 33
      Height = 13
      Caption = 'Detalle'
    end
    object lbAproImporte: TLabel
      Left = 380
      Top = 164
      Width = 38
      Height = 13
      Caption = 'Importe'
    end
    object lbAproObservaciones: TLabel
      Left = 6
      Top = 260
      Width = 50
      Height = 13
      Caption = 'Observac.'
    end
    object Label1: TLabel
      Left = 4
      Top = 164
      Width = 28
      Height = 13
      Caption = 'Turno'
    end
    object Label2: TLabel
      Left = 124
      Top = 164
      Width = 36
      Height = 13
      Caption = 'Hora T.'
    end
    object Label7: TLabel
      Left = 413
      Top = 236
      Width = 21
      Height = 13
      Caption = 'Aval'
    end
    object Label9: TLabel
      Left = 6
      Top = 237
      Width = 42
      Height = 13
      Caption = 'Implante'
    end
    object Label13: TLabel
      Left = 429
      Top = 75
      Width = 43
      Height = 13
      Caption = 'Subprest'
    end
    object Label14: TLabel
      Left = 200
      Top = 164
      Width = 54
      Height = 13
      Caption = 'Dias Devol.'
    end
    object Label16: TLabel
      Left = 6
      Top = 76
      Width = 60
      Height = 13
      Caption = 'T.Prestaci'#243'n'
    end
    object lbPrestacion: TLabel
      Left = 6
      Top = 98
      Width = 50
      Height = 13
      Caption = 'Prestaci'#243'n'
    end
    object Label18: TLabel
      Left = 363
      Top = 256
      Width = 74
      Height = 26
      AutoSize = False
      Caption = 'Observaciones '#13#10'de Impresi'#243'n'
    end
    object Bevel12: TBevel
      Left = 4
      Top = 66
      Width = 765
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
      ExplicitWidth = 763
    end
    object Bevel1: TBevel
      Left = 4
      Top = 156
      Width = 765
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
      ExplicitWidth = 763
    end
    object Bevel2: TBevel
      Left = 4
      Top = 184
      Width = 765
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
      ExplicitWidth = 763
    end
    object Label4: TLabel
      Left = 8
      Top = 46
      Width = 55
      Height = 13
      Caption = 'N. Fantas'#237'a'
    end
    object Label21: TLabel
      Left = 496
      Top = 164
      Width = 71
      Height = 13
      Caption = 'Entrega ortop.'
    end
    object Label22: TLabel
      Left = 388
      Top = 46
      Width = 53
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Prest. sug.'
      ExplicitLeft = 386
    end
    object btnAgregarSubPr: TSpeedButton
      Tag = 2
      Left = 746
      Top = 116
      Width = 24
      Height = 20
      Anchors = [akTop, akRight]
      Enabled = False
      Flat = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
        2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
        CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
        00000033330000336600003399000033CC000033FF0000660000006633000066
        6600006699000066CC000066FF00009900000099330000996600009999000099
        CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
        660000FF990000FFCC00330000003300330033006600330099003300CC003300
        FF00333300003333330033336600333399003333CC003333FF00336600003366
        330033666600336699003366CC003366FF003399000033993300339966003399
        99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
        FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
        6600660099006600CC006600FF00663300006633330066336600663399006633
        CC006633FF00666600006666330066666600666699006666CC00669900006699
        330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
        CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
        000099339900990099009900CC009900000099333300990066009933CC009900
        FF00996600009966330099336600996699009966CC009933FF00999933009999
        6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
        CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
        000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
        9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
        FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
        3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
        9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
        6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
        CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFF
        0AA6A60AFFFFFFFFFFFFFFFFFFFFFFFF0AC7C70AFFFFFFFFFFFFFFFFFFFFFFFF
        0AACAC0AFFFFFFFFFFFFFFFFFFFFFFFF0ACECE0AFFFFFFFFFFFFFF0A0A0A0A0A
        0AD4D40A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
        D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0AD5D50A0A0A0A0A0AFFFFFFFFFFFFFF
        0AD5D50AFFFFFFFFFFFFFFFFFFFFFFFF0ADBDB0AFFFFFFFFFFFFFFFFFFFFFFFF
        0ADCDC0AFFFFFFFFFFFFFFFFFFFFFFFF0ADADA0AFFFFFFFFFFFFFFFFFFFFFFFF
        0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      Margin = 2
      Spacing = 0
      OnClick = btnAgregarSubPrClick
      ExplicitLeft = 744
    end
    object btnQuitarSubPr: TSpeedButton
      Tag = 2
      Left = 746
      Top = 137
      Width = 24
      Height = 18
      Anchors = [akTop, akRight]
      Enabled = False
      Flat = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
        2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
        CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
        00000033330000336600003399000033CC000033FF0000660000006633000066
        6600006699000066CC000066FF00009900000099330000996600009999000099
        CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
        660000FF990000FFCC00330000003300330033006600330099003300CC003300
        FF00333300003333330033336600333399003333CC003333FF00336600003366
        330033666600336699003366CC003366FF003399000033993300339966003399
        99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
        FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
        6600660099006600CC006600FF00663300006633330066336600663399006633
        CC006633FF00666600006666330066666600666699006666CC00669900006699
        330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
        CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
        000099339900990099009900CC009900000099333300990066009933CC009900
        FF00996600009966330099336600996699009966CC009933FF00999933009999
        6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
        CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
        000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
        9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
        FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
        3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
        9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
        6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
        CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0A0A
        0A0A0A0A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
        D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0A0A0A0A0A0A0A0A0AFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      Margin = 2
      Spacing = 0
      OnClick = btnQuitarSubPrClick
      ExplicitLeft = 744
    end
    object Label24: TLabel
      Left = 4
      Top = 118
      Width = 61
      Height = 26
      Caption = 'Prestaciones'#13#10'incluidas'
    end
    object Label25: TLabel
      Left = 653
      Top = 164
      Width = 18
      Height = 13
      Cursor = crHelp
      Hint = 'Haga click aqu'#237' para ver informaci'#243'n adicional'
      Caption = 'Km.'
      ParentShowHint = False
      ShowHint = True
      OnClick = Label25Click
    end
    object Label26: TLabel
      Left = 714
      Top = 164
      Width = 16
      Height = 13
      Cursor = crHelp
      Hint = 'Haga click aqu'#237' para ver informaci'#243'n adicional'
      Anchors = [akTop, akRight]
      Caption = 'Ex.'
      ParentShowHint = False
      ShowHint = True
      OnClick = Label26Click
      ExplicitLeft = 712
    end
    object lblEspera: TLabel
      Left = 346
      Top = 75
      Width = 33
      Height = 13
      Caption = 'Espera'
    end
    object memoObservaciones: TMemo
      Left = 69
      Top = 255
      Width = 289
      Height = 47
      Anchors = [akLeft, akTop, akBottom]
      MaxLength = 1000
      TabOrder = 14
    end
    object edHoraTurno: TMaskEdit
      Left = 160
      Top = 160
      Width = 36
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 6
      Text = '00:00'
      OnExit = edHoraTurnoExit
    end
    object edFechaTurno: TDateComboBox
      Left = 35
      Top = 160
      Width = 85
      Height = 21
      MinDate = 35582.000000000000000000
      TabOrder = 5
      OnChange = edFechaTurnoChange
    end
    object edAval: TEdit
      Left = 440
      Top = 232
      Width = 328
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 13
    end
    object edImporte: TCurrencyEdit
      Left = 420
      Top = 160
      Width = 73
      Height = 20
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 9
      OnChange = edImporteChange
      OnEnter = edImporteEnter
    end
    object cmbImplante: TArtComboBox
      Left = 125
      Top = 232
      Width = 279
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 12
      Columns = <
        item
          Expanded = False
          FieldName = 'IM_CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IM_MARCA'
          Title.Caption = 'Marca'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IM_EMPRESA'
          Title.Caption = 'Empresa'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PA_DESCRIPCION'
          Title.Caption = 'Origen'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IM_FBAJA'
          Title.Caption = 'Fecha Baja'
          Width = 60
          Visible = True
        end>
      DataSource = dsImplante
      FieldList = 'IM_MARCA'
      FieldKey = 'IM_CODIGO'
      OnCloseUp = cmbImplanteCloseUp
      OnGetCellParams = cmbImplanteGetCellParams
    end
    object edDiasDevol: TIntEdit
      Left = 256
      Top = 160
      Width = 41
      Height = 21
      TabOrder = 7
      MaxLength = 3
    end
    object edImplante: TIntEdit
      Left = 69
      Top = 232
      Width = 56
      Height = 21
      TabOrder = 11
      OnExit = edImplanteExit
      OnKeyPress = edImplanteKeyPress
    end
    inline fraSubPrestacion: TfraSubPrestacion
      Left = 474
      Top = 69
      Width = 296
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      TabStop = True
      ExplicitLeft = 474
      ExplicitTop = 69
      ExplicitWidth = 296
      ExplicitHeight = 24
      DesignSize = (
        296
        24)
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        ExplicitLeft = 52
      end
      inherited edCodigo: TPatternEdit
        Width = 48
        ExplicitWidth = 48
      end
    end
    inline fraPrestacionAut: TfraPrestacion
      Left = 68
      Top = 69
      Width = 270
      Height = 24
      TabOrder = 1
      OnExit = fraPrestacionAutExit
      ExplicitLeft = 68
      ExplicitTop = 69
      ExplicitWidth = 270
      DesignSize = (
        270
        24)
      inherited edCodigo: TEdit
        Width = 50
        ExplicitWidth = 50
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 218
        ExplicitLeft = 52
        ExplicitWidth = 218
      end
    end
    inline fraNomencladorAprob: TfraNomenclador
      Left = 65
      Top = 93
      Width = 706
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      PopupMenu = fraNomencladorAprob.PopupMenu
      TabOrder = 4
      OnExit = fraNomencladorAprobExit
      ExplicitLeft = 65
      ExplicitTop = 93
      ExplicitWidth = 706
      ExplicitHeight = 21
      DesignSize = (
        706
        21)
      inherited cmbDescripcion: TLookupComboDlg
        Width = 591
        DataSource = nil
        ExplicitWidth = 591
      end
      inherited edNomenclador: TPatternEdit
        Left = 4
        ExplicitLeft = 4
      end
      inherited ImageList: TImageList
        Bitmap = {
          494C010102002800380010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
          0000000000003600000028000000400000001000000001002000000000000010
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000808080000000000080808000000
          0000000000000808080000000000080808000000000000000000080808000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002942420000000000000000000000
          00000000000000000000000000000000000084848400CECECE00CECECE00CECE
          CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
          CE00080808000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000018180000FFFF0063A5A50031525200000000000000
          00000000000000000000000000000000000084848400FFFFFF009CFFFF00FF00
          0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
          00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
          FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
          18000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF00
          0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
          E700294A4A0000000000000000000000000084848400FFFFFF009CFFFF00FFFF
          FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
          C60063BDBD0031525200000000000000000084848400FFFFFF00FFFFFF00FF63
          3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000BDA5
          A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
          EF0000E7E70018CECE00212121000000000084848400FFFFFF00FFFFFF009CFF
          FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
          CE00080808000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008C00
          0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
          F7007BDEDE00005A5A00212121000000000084848400FFFFFF009CCECE009CCE
          CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
          0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
          B5000031310039393900000000000000000084848400FFFFFF00003100000031
          00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
          0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
          52000000000000000000000000000000000084848400FFFFFF00639C9C00CEFF
          FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
          0000080808000000000008080800000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000C6BDBD00B5631000FFFF
          F700BDADAD008473000084000000942121002121210021212100000000000000
          00000000000000000000000000000000000084848400FFFFFF00FFFFFF00639C
          9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
          9C00639C9C0000000000FF633100FF6331000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000C6841000FFFFE7008C8C
          2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
          0000000000000000000000000000000000008484840084848400848484008484
          8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
          CE00639C9C00639C9C00FF9C3100FF9C31000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000094393900F7F76B009C843900AD84
          7B00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
          CE009CCECE009CCECE00FFCE3100FFCE31000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000943939007B7B0000AD6B6B000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
          FF00CEFFFF00639C9C00FFFF9C00FFFF9C000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
          9C00639C9C00FFFFFF00FF633100FF6331000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000424D3E000000000000003E000000
          2800000040000000100000000100010000000000800000000000000000000000
          000000000000000000000000FFFFFF00FFFF000700000000FE7F000700000000
          FC3F000700000000F81F000700000000F80F000700000000F007000700000000
          F003000700000000E001000700000000E001000700000000C003000700000000
          C00F000000000000803F00000000000081FF0000000000000FFFF80000000000
          1FFFFC0000000000FFFFFE000000000000000000000000000000000000000000
          000000000000}
      end
    end
    object edCantidad: TCurrencyEdit
      Left = 328
      Top = 160
      Width = 49
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;- ,0.00'
      TabOrder = 8
      Value = 1.000000000000000000
      OnChange = edCantidadChange
      OnExit = edCantidadExit
    end
    object memoObservacionesImpresion: TMemo
      Left = 440
      Top = 255
      Width = 329
      Height = 47
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 250
      TabOrder = 15
    end
    object edNomFantaAprob: TEdit
      Left = 67
      Top = 42
      Width = 314
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 16
    end
    inline fraPrestadorAprob: TfraPrestador
      Left = 2
      Top = 15
      Width = 770
      Height = 26
      VertScrollBar.Range = 49
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 15
      ExplicitWidth = 770
      ExplicitHeight = 26
      DesignSize = (
        753
        26)
      inherited lbCUIT: TLabel
        Top = 6
        ExplicitTop = 6
      end
      inherited lbSec: TLabel
        Top = 6
        ExplicitTop = 6
      end
      inherited lbIdentif: TLabel
        Left = 197
        Top = 6
        ExplicitLeft = 197
        ExplicitTop = 6
      end
      inherited lbRSocial: TLabel
        Left = 285
        Top = 6
        ExplicitLeft = 285
        ExplicitTop = 6
      end
      inherited lbLocalidad: TLabel
        Left = 319
        ExplicitLeft = 319
      end
      inherited lbCPostal: TLabel
        Left = 512
        ExplicitLeft = 680
      end
      inherited lbTelefono: TLabel
        Left = 390
        Visible = True
        ExplicitLeft = 558
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 109
        ExplicitWidth = 109
      end
      inherited cmbPrestador: TArtComboBox
        Left = 329
        Width = 253
        ExplicitLeft = 329
        ExplicitWidth = 253
      end
      inherited edPresDomicilio: TEdit
        Width = 265
        ExplicitWidth = 265
      end
      inherited edPresLocalidad: TEdit
        Left = 369
        Width = 17
        ExplicitLeft = 369
        ExplicitWidth = 17
      end
      inherited edPresCPostal: TEdit
        Left = 528
        ExplicitLeft = 528
      end
      inherited edPrestIdentif: TIntEdit
        Left = 234
        ExplicitLeft = 234
      end
      inherited edPresTelefono: TEdit
        Left = 409
        Width = 99
        Visible = True
        ExplicitLeft = 409
        ExplicitWidth = 99
      end
    end
    object edFechaOrtop: TDateComboBox
      Left = 568
      Top = 160
      Width = 83
      Height = 21
      TabOrder = 10
    end
    object edPrestSugerido: TEdit
      Left = 444
      Top = 42
      Width = 327
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
    end
    object lvRelaciones: TListView
      Left = 68
      Top = 116
      Width = 676
      Height = 39
      Hint = 'Prestaciones relacionadas con la ingresada'
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Columns = <
        item
          Caption = 'id'
          Width = 0
        end
        item
          Caption = 'nomenclador'
          Width = 10
        end
        item
          Caption = 'capitulo'
          Width = 30
        end
        item
          Caption = 'codigo'
          Width = 70
        end
        item
          Caption = 'descripcion'
          Width = 300
        end>
      ReadOnly = True
      RowSelect = True
      ParentShowHint = False
      ShowColumnHeaders = False
      ShowHint = False
      TabOrder = 18
      ViewStyle = vsReport
      OnResize = lvRelacionesResize
    end
    object edKilometraje: TCurrencyEdit
      Left = 672
      Top = 160
      Width = 39
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.0;- ,0.0'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      OnExit = edCantidadExit
    end
    object edKilometrajeExcedente: TCurrencyEdit
      Left = 730
      Top = 160
      Width = 37
      Height = 21
      Hint = 
        'Kilometraje excedente expl'#237'citamente autorizado por motivos ajen' +
        'os al GIS'
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.0;- ,0.0'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
      OnExit = edCantidadExit
    end
    object meEspera: TMaskEdit
      Left = 382
      Top = 71
      Width = 40
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
      OnExit = meEsperaExit
    end
    object edDetalle: TMemo
      Left = 69
      Top = 191
      Width = 699
      Height = 37
      Anchors = [akLeft, akTop, akRight]
      Lines.Strings = (
        '')
      MaxLength = 2000
      TabOrder = 21
    end
  end
  object grpDatoRef: TGroupBox
    Left = 0
    Top = 520
    Width = 774
    Height = 37
    Align = alBottom
    Caption = 'Datos Referenciales'
    TabOrder = 5
    DesignSize = (
      774
      37)
    object lbDatRefFAlta: TLabel
      Left = 8
      Top = 17
      Width = 29
      Height = 13
      Caption = 'F.Alta'
    end
    object lbDatRefUsuario: TLabel
      Left = 112
      Top = 17
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object lbDatRefEstado: TLabel
      Left = 260
      Top = 17
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lbDatRefFAprob: TLabel
      Left = 490
      Top = 17
      Width = 64
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F.Aprobaci'#243'n'
      ExplicitLeft = 488
    end
    object lbDatRefUAprob: TLabel
      Left = 626
      Top = 17
      Width = 40
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'U.Aprob'
      ExplicitLeft = 624
    end
    object edDatRefFAlta: TEdit
      Left = 40
      Top = 13
      Width = 65
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      Text = '__/__/____'
    end
    object edDatRefUsuAlta: TEdit
      Left = 152
      Top = 13
      Width = 100
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edDatRefEstado: TEdit
      Left = 296
      Top = 13
      Width = 187
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edDatRefFAprob: TEdit
      Left = 558
      Top = 13
      Width = 65
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
      Text = '__/__/____'
    end
    object edDatRefUsuAprob: TEdit
      Left = 670
      Top = 13
      Width = 98
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
  end
  object pnlBotones: TPanel
    Left = -1
    Top = 191
    Width = 781
    Height = 26
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      781
      26)
    object btnAprobar: TSpeedButton
      Left = 561
      Top = -1
      Width = 73
      Height = 26
      Anchors = [akTop, akRight]
      Caption = '&Aprobar'
      Flat = True
      Glyph.Data = {
        9E0D0000424D9E0D000000000000360000002800000034000000160000000100
        180000000000680D0000C40E0000C40E00000000000000000000808000808000
        80800080800080800080800080800080800080800000B0000000008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        808000C0C0C04848488080008080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        800080800080800080800080800000B00000B000000000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        00808000808000808000808000808000808000808000808000808000C0C0C0C0
        C0C0484848808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800000B00000970000970000B00000000080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        808000808000808000808000808000808000808000C0C0C0B2B2B2AAAAAAC0C0
        C048484880800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        00B00000970000860000970000B0000000008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000C0C0C0B2B2B29F9F9FAAAAAAC0C0C0484848
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800000B00000970000
        860000770000970000B000000000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        00808000808000C0C0C0B2B2B29F9F9F969696AAAAAAC0C0C048484880800080
        8000808000808000808000808000808000808000808000808000808000808000
        80800080800080800080800080800080800000B0000097000086000077000064
        0000770000970000B00000000080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        C0C0C0B2B2B29F9F9F9696967F7F7F969696AAAAAAC0C0C04848488080008080
        0080800080800080800080800080800080800080800080800080800080800080
        800080800080800080800000B000009700008600007700000000808000006400
        00860000B0000000008080008080008080008080008080008080008080008080
        00808000808000808000808000808000808000808000808000C0C0C0B2B2B29F
        9F9F9696964848488080007F7F7FAAAAAAC0C0C0484848808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800000B00000970000860000770000000080800080800000530000770000
        970000B000000000808000808000808000808000808000808000808000808000
        808000808000808000808000808000808000C0C0C0B2B2B29F9F9F9696964848
        488080008080007F7F7F8E8E8EAAAAAAC0C0C048484880800080800080800080
        800080800080800080800080800080800080800080800080800080800000B000
        00970000860000770000000080800080800080800080800000640000860000B0
        0000000080800080800080800080800080800080800080800080800080800080
        8000808000808000808000C0C0C0B2B2B29F9F9F969696484848808000808000
        8080008080007F7F7F969696C0C0C04848488080008080008080008080008080
        0080800080800080800080800080800080800080800000B00000970000860000
        770000000080800080800080800080800080800000530000770000970000B000
        0000008080008080008080008080008080008080008080008080008080008080
        00808000C0C0C0B2B2B29F9F9F96969648484880800080800080800080800080
        80007F7F7F8E8E8EAAAAAAC0C0C0484848808000808000808000808000808000
        8080008080008080008080008080008080000097000086000077000000008080
        0080800080800080800080800080800080800000530000860000B00000000080
        8000808000808000808000808000808000808000808000808000808000808000
        B2B2B29F9F9F9696964848488080008080008080008080008080008080008080
        007F7F7F8E8E8EC0C0C048484880800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        80800080800080800080800080800080800000640000970000B0000000008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        7F7F7FAAAAAAC0C0C04848488080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        800080800080800080800080800000530000640000B000000000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        008080008080008080008080008080008080008080008080008080007575757F
        7F7FC0C0C0484848808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800080800080800000530000640000B00000000080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080007575757F7F
        7FC0C0C048484880800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        80800080800080800080800000530000640000B0000000008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        80008080008080008080008080008080008080008080008080007575757F7F7F
        C0C0C04848488080008080008080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000005300006400000000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        008080008080008080008080008080008080008080008080007575757F7F7F48
        4848808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800080800000530000B00000000080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        808000808000808000808000808000808000808000808000757575C0C0C04848
        4880800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080000053000000008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000757575484848808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000005300000000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800075757548484880800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800000530000000080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080007575754848488080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080000000008080008080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000484848808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000000000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800080800080800080800080800048484880800080800080800080
        8000}
      Layout = blGlyphRight
      NumGlyphs = 2
      OnClick = btnAprobarClick
    end
    object btnRechazar: TSpeedButton
      Left = 634
      Top = -1
      Width = 74
      Height = 26
      Anchors = [akTop, akRight]
      Caption = '&Rechazar'
      Flat = True
      Glyph.Data = {
        5E080000424D5E08000000000000360000002800000026000000120000000100
        18000000000028080000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000C0C0C00
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF00000000FF0000FF003333CC0000FF00009900FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF000000FF00FF0000FF008686868686860C0C0C00FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF004D4D4D
        000000FF0000FF003333CC0066FF0000FF00009900FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        00868686CCCCCC8686860C0C0C00FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF003333CC33
        99FF0066FF0000CC00009900FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF000000FF00FF0000FF0000FF00868686FFFFFFCCCCCC8686
        8633333300FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF004D4D4D00FF00000000FF0000FF0000FF003333CC3399FF0000FF00009900
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF00FF00
        00FF0000FF0000FF0000FF00868686FFFFFFCCCCCC33333300FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0086868600FF0000FF00000000FF
        0000FF0000FF0000FF000000CC3399FF0000CC00009900FF0000FF0000FF0000
        FF0000FF0000FF0000FF000000FF00009900FF0000FF0000FF0000FF0000FF00
        00FF00868686FFFFFF86868633333300FF0000FF0000FF0000FF0000FF0000FF
        0000FF008686860C0C0C00FF0000FF00000000FF0000FF0000FF0000FF0000FF
        000000CC0066FF00009900FF0000FF0000FF0000FF0000FF0000FF000000FF00
        009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00868686CCCCCC
        33333300FF0000FF0000FF0000FF0000FF0000FF008686860C0C0C00FF0000FF
        0000FF00000000FF0000FF0000FF0000FF0000FF0000FF000000CC0000FF0000
        9900FF0000FF0000FF0000FF000000FF00009900FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF008686868686860C0C0C00FF0000FF00
        00FF0000FF008686860C0C0C00FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF000000CC0000FF00009900FF0000FF000000
        FF00009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF008686868686860C0C0C00FF0000FF008686860C0C0C00FF00
        00FF0000FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF000000CC0000FF0000990000FF00009900FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0086
        86868686860C0C0C8686860C0C0C00FF0000FF0000FF0000FF0000FF0000FF00
        000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000CC
        0000FF00009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0086868686868633333300
        FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF000000CC0000FF0000990000CC00009900FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF008686868686860C0C0C8686860C0C0C00FF0000FF0000FF0000
        FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        00CC0000FF00009900FF0000FF000000CC00009900FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008686868686860C0C
        0C00FF0000FF008686860C0C0C00FF0000FF0000FF0000FF0000FF00000000FF
        0000FF0000FF0000FF0000FF000000CC0000CC0000FF00009900FF0000FF0000
        FF0000FF000000CC00009900FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF008686868686868686860C0C0C00FF0000FF0000FF0000FF008686
        860C0C0C00FF0000FF0000FF0000FF00000000FF0000FF0000FF000000CC0000
        CC3399FF0000FF00009900FF0000FF0000FF0000FF0000FF0000FF000000CC00
        009900FF0000FF0000FF0000FF0000FF0000FF00868686868686CCCCCC868686
        0C0C0C00FF0000FF0000FF0000FF0000FF0000FF008686860C0C0C00FF0000FF
        0000FF00000000FF0000FF000000CC3399FF0066FF0000FF00009900FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF000000CC00009900FF0000FF0000
        FF0000FF00868686FFFFFFCCCCCC8686860C0C0C00FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF008686860C0C0C00FF0000FF00000000FF000000CC
        3399FF0066FF0000FF00009900FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF000000CC00FF0000FF00868686FFFFFFCCCCCC86
        86860C0C0C00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF004D4D4D00FF00000000FF006666990000CC0000CC66669900FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0086868686868686868686868600FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        0000}
      Layout = blGlyphRight
      NumGlyphs = 2
      OnClick = btnRechazarClick
    end
    object btnHistoria: TSpeedButton
      Left = 489
      Top = -1
      Width = 72
      Height = 26
      Anchors = [akTop, akRight]
      Caption = '&Historial'
      Flat = True
      Glyph.Data = {
        1E090000424D1E09000000000000360000002800000028000000130000000100
        180000000000E8080000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF000404040404040404040404040404040404
        0400FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0004040404040404040404040404040404040400FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        00040404040404C0C0C0C0C0C0B2B2B2B2B2B296969696969604040404040400
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00040404
        040404C0C0C0C0C0C0B2B2B2B2B2B296969696969604040404040400FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF00040404040404D7D7D7C0C0C086
        86868686867777775F5F5F4D4D4D4D4D4D96969686868604040404040400FF00
        00FF0000FF0000FF0000FF0000FF00040404040404D7D7D7C0C0C08686868686
        867777775F5F5F4D4D4D4D4D4D96969686868604040404040400FF0000FF0000
        FF0000FF0000FF00040404D7D7D7C0C0C0777777777777B2B2B2B2B2B24D4D4D
        9696969696969696964D4D4D4D4D4D77777777777704040400FF0000FF0000FF
        0000FF00040404D7D7D7C0C0C0777777777777B2B2B2B2B2B24D4D4D96969696
        96969696964D4D4D4D4D4D77777777777704040400FF0000FF0000FF004D4D4D
        D7D7D7969696868686C0C0C0C0C0C0B2B2B2B2B2B24D4D4DB2B2B2B2B2B2B2B2
        B29696969696964D4D4D4D4D4D5F5F5F04040400FF0000FF004D4D4DD7D7D796
        9696868686C0C0C0C0C0C0B2B2B2B2B2B24D4D4DB2B2B2B2B2B2B2B2B2969696
        9696964D4D4D4D4D4D5F5F5F04040400FF0000FF004D4D4D969696C0C0C0B2B2
        B24D4D4DD7D7D7C0C0C0C0C0C0C0C0C0B2B2B2B2B2B2B2B2B2B2B2B296969604
        04043399CC4D4D4D04040400FF0000FF004D4D4D969696C0C0C0B2B2B24D4D4D
        D7D7D7C0C0C0C0C0C0C0C0C0B2B2B2B2B2B2B2B2B2B2B2B29696960404047777
        774D4D4D04040400FF00777777969696D7D7D7D7D7D7E3E3E3C0C0C04D4D4DD7
        D7D7D7D7D7C0C0C0C0C0C0C0C0C0B2B2B2B2B2B20404043399CC3399CC3399CC
        336699040404777777969696D7D7D7D7D7D7E3E3E3C0C0C04D4D4DD7D7D7D7D7
        D7C0C0C0C0C0C0C0C0C0B2B2B2B2B2B20404047777777777777777775F5F5F04
        0404777777CCFFFFFFFFFFE3E3E3E3E3E3E3E3E3D7D7D7D7D7D7D7D7D7D7D7D7
        C0C0C0C0C0C03399CC3399CC3399CC3399CC3399CC3399CC3366990404047777
        77FFFFFFFFFFFFE3E3E3E3E3E3E3E3E3D7D7D7D7D7D7D7D7D7D7D7D7C0C0C0C0
        C0C07777777777777777777777777777777777775F5F5F040404777777CCFFFF
        CCFFFFFFFFFFFFFFFFE3E3E3E3E3E3E3E3E3D7D7D7D7D7D73399CC3399CC3399
        CC3399CC3399CC3399CC3399CC3399CC336699040404777777FFFFFFFFFFFFFF
        FFFFFFFFFFE3E3E3E3E3E3E3E3E3D7D7D7D7D7D7777777777777777777777777
        7777777777777777777777775F5F5F0404047777775F5F5F5F5F5F5F5F5FFFFF
        FFFFFFFFE3E3E3E3E3E3E3E3E3D7D7D74D4D4D0404043366993399CC3399CC33
        99CC0404040404040404040404047777775F5F5F5F5F5F5F5F5FFFFFFFFFFFFF
        E3E3E3E3E3E3E3E3E3D7D7D74D4D4D0404045F5F5F7777777777777777770404
        04040404040404040404777777CCFFFFCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3
        E3E3E3E3E3868686E3E3E34D4D4D0404040404043366993399CC3399CC3399CC
        336699040404777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3E3E3
        E3868686E3E3E34D4D4D0404040404045F5F5F7777777777777777775F5F5F04
        0404777777D7D7D7CCFFFFCCFFFFCCFFFFFFFFFFFFFFFFFFFFFFE3E3E3E3E3E3
        868686E3E3E34D4D4D0404040404040404043366993399CC3366990404047777
        77D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3E3E3E3868686E3
        E3E34D4D4D0404040404040404045F5F5F7777775F5F5F04040400FF00777777
        CCFFFFCCFFFFCCFFFFCCFFFFFFFFFFFFFFFFFFFFFFE3E3E3E3E3E3868686E3E3
        E34D4D4D04040404040404040404040404040400FF0000FF00777777FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3E3E3E3868686E3E3E34D4D4D
        04040404040404040404040404040400FF0000FF00777777D7D7D7CCFFFFCCFF
        FF5F5F5FCCFFFFCCFFFFFFFFFFFFFFFFE3E3E3E3E3E3868686E3E3E34D4D4D04
        040404040404040404040400FF0000FF00777777D7D7D7FFFFFFFFFFFF5F5F5F
        FFFFFFFFFFFFFFFFFFFFFFFFE3E3E3E3E3E3868686E3E3E34D4D4D0404040404
        0404040404040400FF0000FF0000FF00777777D7D7D75F5F5FCCFFFFCCFFFFCC
        FFFFCCFFFFFFFFFFFFFFFFE3E3E3E3E3E3868686E3E3E34D4D4D040404040404
        04040400FF0000FF0000FF00777777D7D7D75F5F5FFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE3E3E3E3E3E3868686E3E3E34D4D4D04040404040404040400
        FF0000FF0000FF0000FF00777777777777D7D7D7CCFFFFCCFFFFCCFFFF5F5F5F
        CCFFFFFFFFFFCCFFFFD7D7D7868686E3E3E34D4D4D04040404040400FF0000FF
        0000FF0000FF00777777777777D7D7D7FFFFFFFFFFFFFFFFFF5F5F5FFFFFFFFF
        FFFFFFFFFFD7D7D7868686E3E3E34D4D4D04040404040400FF0000FF0000FF00
        00FF0000FF0000FF00777777777777D7D7D7CCFFFF5F5F5FCCFFFFCCFFFFD7D7
        D7777777777777868686E3E3E34D4D4D04040400FF0000FF0000FF0000FF0000
        FF0000FF00777777777777D7D7D7FFFFFF5F5F5FFFFFFFFFFFFFD7D7D7777777
        777777868686E3E3E34D4D4D04040400FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0077777777777777777777777777777777777700FF0000FF0000
        FF00868686E3E3E34D4D4D00FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0077777777777777777777777777777777777700FF0000FF0000FF008686
        86E3E3E34D4D4D00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00868686
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0086868600FF0000
        FF00}
      Layout = blGlyphRight
      NumGlyphs = 2
      OnClick = btnHistoriaClick
    end
    object btnSalir: TSpeedButton
      Left = 708
      Top = -1
      Width = 57
      Height = 26
      Hint = 'Salir (Esc)'
      Anchors = [akTop, akRight]
      Caption = '&Salir'
      Flat = True
      Glyph.Data = {
        36080000424D360800000000000036000000280000002A000000100000000100
        18000000000000080000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0010101010101000FF0000FF0000FF001010
        1010101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0016161616161600FF0000FF0000FF00161616
        16161600FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00101010007F7F10101000FF0000FF001010
        10007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0016161696969616161600FF0000FF00161616
        96969616161600FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00101010009090007F7F10101000FF001010
        10009090007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF00161616A1A1A196969616161600FF00161616
        A1A1A196969616161600FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0010101000CFCF009090007F7F1010101010
        1000CFCF009090007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF00161616AAAAAAA1A1A1969696161616161616
        AAAAAAA1A1A196969616161600FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0010101000FFFF00CFCF009090007F7F1010
        1000FFFF00CFCF009090007F7F10101000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF00161616B8B8B8AAAAAAA1A1A1969696161616
        B8B8B8AAAAAAA1A1A196969616161600FF0000FF0000FF000000002F2F101010
        10101010101010101010101010101010101000FFFF00FFFF00CFCF009090007F
        7F10101000FFFF00CFCF009090007F7F10101000FF0000FF0016161616161616
        1616161616161616161616161616161616B8B8B8B8B8B8AAAAAAA1A1A1969696
        161616B8B8B8AAAAAAA1A1A196969616161600FF0000FF000000002F2F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F2FFFFF00FFFF00FFFF00CFCF0090
        90007F7F10101000FFFF00CFCF009090007F7F10101000FF0000333396969696
        9696969696969696969696969696969696C1C1C1B8B8B8B8B8B8AAAAAAA1A1A1
        969696161616B8B8B8AAAAAAA1A1A196969616161600FF000000002F2F60FFFF
        60FFFF60FFFF60FFFF60FFFF60FFFF60FFFF60FFFF2FFFFF00FFFF00FFFF00CF
        CF009090007F7F10101000FFFF00CFCF009090007F7F101010003333CACACACA
        CACACACACACACACACACACACACACACACACACACACAC1C1C1B8B8B8B8B8B8AAAAAA
        A1A1A1969696161616B8B8B8AAAAAAA1A1A19696961616160000002F2F90FFFF
        EFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FF00FF
        FF00CFCF007F7F002F2FEFF0FF00FFFF00CFCF007F7F002F2F003333B8B8B8B8
        B8B8E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3B8B8B8
        AAAAAA969696003333E3E3E3B8B8B8AAAAAA9696960033330000002F2FCFFFFF
        CFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFEFF0FF2FFFFF00FF
        FF007F7F002F2FEFF0FF2FFFFF00FFFF007F7F002F2F00FF00003333DADADADA
        DADADADADADADADADADADADADADADADADADADADADADADAE3E3E3C1C1C1B8B8B8
        969696003333E3E3E3C1C1C1B8B8B896969600333300FF000000002F2F002F2F
        002F2F002F2F002F2F002F2F002F2F002F2FCFFFFFEFF0FFCFFFFF2FFFFF007F
        7F002F2FEFF0FFCFFFFF2FFFFF007F7F002F2F00FF0000FF0000333300333300
        3333003333003333003333003333003333DADADAF1F1F1DADADAC1C1C1969696
        003333F1F1F1DADADAC1C1C196969600333300FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFFCFFFFF007F7F002F
        2FCFFFFFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF00003333DADADADADADADADADA969696003333
        DADADADADADADADADA96969600333300FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFF007F7F002F2F002F
        2FCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF00003333DADADADADADA969696003333003333
        DADADADADADA96969600333300FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00002F2FCFFFFF007F7F002F2F00FF00002F
        2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF00003333DADADA96969600333300FF00003333
        DADADA96969600333300FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00002F2F007F7F002F2F00FF0000FF00002F
        2F007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000333396969600333300FF0000FF00003333
        96969600333300FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00002F2F002F2F00FF0000FF0000FF00002F
        2F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000333300333300FF0000FF0000FF00003333
        00333300FF0000FF0000FF0000FF0000FF0000FF0000FF000000}
      Layout = blGlyphRight
      NumGlyphs = 2
      OnClick = btnSalirClick
    end
    object btnPedInfo: TSpeedButton
      Left = 326
      Top = -1
      Width = 94
      Height = 26
      Anchors = [akTop, akRight]
      Caption = '&Pedido info.'
      Flat = True
      Glyph.Data = {
        3E0C0000424D3E0C00000000000036000000280000002E000000160000000100
        180000000000080C0000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000
        0000000000000000000000000000000000000000000000000000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00000000000000000000000000000000000000000000000000000000000000FF
        0000FF00000000000000000000000000000000000000FF0000FF0000FF0000FF
        0000000000000080808080808080808080808080808080808080808080808080
        808080808000000000000000000000000000000000000000000000FF0000FF00
        00FF0000FF000000000000008080808080808080808080808080808080808080
        8080808080808080808000000000000000008000008000008000008000008000
        0000000000FF0000FF00000000C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C08080805B5B5B5B5B5B5B5B5B
        5B5B5B5B5B5B00000000FF0000FF00000000C0C0C0C0C0C0C0C0C0C0C0C0D3D3
        D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3C0C0C080808000008000
        00800000800000800000800000000000000000000000C0C0C0C0C0C0C0C0C0FF
        FFFFFFFFFFFFFFFFFFFFFF808080808080808080000000000000000000000000
        00FF00646464646464646464646464646464000000000000000000C0C0C0C0C0
        C0C0C0C0D3D3D3D3D3D3D3D3D3D3D3D380808080808080808000000000000000
        000000000000FF000000800000800000800000800000800000000000C0C0C0C0
        C0C0C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
        000000FFFFFFF0FBFF00000000FF006C6C6C6C6C6C6C6C6C6C6C6C6C6C6C0000
        00C0C0C0C0C0C0C0C0C0D3D3D3D3D3D3D3D3D3D3D3D3D3D3D300000000000000
        0000000000000000DFDFDFDFDFDF00000000FF00000080000080000080000080
        0000800000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        FFFFFFFFFFFFFFFFFFFFFFFF777777000000F0FBFF00000000FF007474747474
        74747474747474747474000000C0C0C0D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
        D3D3000000D3D3D3D3D3D3D3D3D3D3D3D3777777000000DFDFDF00000000FF00
        0000800000800000800000800000800000000000C0C0C0FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000F0FBFFF0FBFFFFFF
        FF00000000FF00959595959595959595959595959595000000C0C0C0D3D3D3D3
        D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3000000DFDFDF
        DFDFDFDFDFDF00000000FF000000800000800000800000800000800000000000
        C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080808080
        80777777777777777777F0FBFF00000000FF00ACACACACACACACACACACACACAC
        ACAC000000C0C0C0D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
        808080808080777777777777777777DFDFDF00000000FF000000FF0000FF0000
        FF0000FF0000FF00000000008080808080808080808080808080808080808080
        80808080808080F0FBFFFFFFFFFFFFFFF0FBFFF0FBFFFFFFFF00000000FF00BF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBF000000808080808080808080808080808080
        808080808080808080808080DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF0000
        0000FF000000FF0000FF0000FF0000FF0000FF0000000000000000FFFFFFF0FB
        FFF0FBFFF0FBFF77777777777777777777777777777777777777777777777777
        7777F0FBFF00000000FF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000000000
        DFDFDFDFDFDFDFDFDFDFDFDF7777777777777777777777777777777777777777
        77777777777777DFDFDF00000000FF0000008000008000008000008000008000
        00000000000000F0FBFFF0FBFFFFFFFFF0FBFFFFFFFFF0FBFFF0FBFFFFFFFFF0
        FBFFF0FBFFFFFFFFF0FBFFF0FBFFFFFFFF00000000FF00ACACACACACACACACAC
        ACACACACACAC000000000000DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF00000000FF0000000000
        0000000000000000000000000000FF00000000FFFFFFFFFFFF77777777777777
        7777777777777777777777777777777777777777777777777777F0FBFF000000
        00FF0000000000000000000000000000000000FF00000000DFDFDFDFDFDF7777
        77777777777777777777777777777777777777777777777777777777777777DF
        DFDF00000000FF00000000FF0000FF0000FF0000FF0000FF0000FF00000000F0
        FBFFF0FBFFFFFFFFF0FBFFFFFFFFF0FBFFF0FBFFFFFFFFF0FBFFF0FBFFFFFFFF
        F0FBFFF0FBFFFFFFFF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF
        00000000DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDF00000000FF00000000FF0000FF0000FF0000
        FF0000FF0000FF00000000FFFFFFFFFFFFF0FBFFFFFFFF777777777777777777
        777777777777777777777777777777FFFFFFF0FBFF00000000FF0000FF0000FF
        0000FF0000FF0000FF0000FF00000000DFDFDFDFDFDFDFDFDFDFDFDF77777777
        7777777777777777777777777777777777777777DFDFDFDFDFDF00000000FF00
        000000FF0000FF0000FF0000FF0000FF0000FF00000000F0FBFFF0FBFFFFFFFF
        F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF7777777777777777777777777777
        7700000000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000DFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF777777777777777777
        77777777777700000000FF00000000FF0000FF0000FF0000FF0000FF0000FF00
        000000FFFFFFFFFFFF777777777777777777777777FFFFFFFFFFFF0000000000
        0000000000000000000000000000000000FF0000FF0000FF0000FF0000FF0000
        FF0000FF00000000DFDFDFDFDFDF777777777777777777777777DFDFDFDFDFDF
        00000000000000000000000000000000000000000000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF00000000F0FBFFF0FBFFFFFFFFF0FBFFF0FBFFF0FB
        FFF0FBFFF0FBFF000000FFFFFFF0FBFFFFFFFFF0FBFF00000000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF00000000DFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDF000000DFDFDFDFDFDFDFDFDFDFDFDF00000000FF
        0000FF00000000FF0000FF0000FF0000FF0000FF0000FF00000000FFFFFFFFFF
        FF777777777777777777777777777777FFFFFF000000F0FBFFFFFFFFF0FBFF00
        000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000
        DFDFDFDFDFDF777777777777777777777777777777DFDFDF000000DFDFDFDFDF
        DFDFDFDF00000000FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF
        0000FF00000000F0FBFFF0FBFFFFFFFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF00
        0000FFFFFFF0FBFF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF00000000DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDF000000DFDFDFDFDFDF00000000FF0000FF0000FF0000FF00000000FF
        0000FF0000FF0000FF0000FF0000FF00000000FFFFFFFFFFFFF0FBFFFFFFFFF0
        FBFFF0FBFFFFFFFFFFFFFF000000F0FBFF00000000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF00000000DFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF000000DFDFDF00000000FF0000FF0000
        FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF00000000F0
        FBFFF0FBFFFFFFFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF00000000000000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        00000000DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF00000000
        000000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF0000FF0000
        FF0000FF0000FF00000000000000000000000000000000000000000000000000
        00000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000000000000000000000000000000000000000
        000000000000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        0000}
      Layout = blGlyphRight
      NumGlyphs = 2
      OnClick = btnPedInfoClick
    end
    object btnImprimir: TSpeedButton
      Left = 420
      Top = -1
      Width = 69
      Height = 26
      Anchors = [akTop, akRight]
      Caption = '&Imprimir'
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000000000000000000000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0004040404
        040404040400FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00000000000000BFBFBF2F2F2F30303000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF00040404040404C0C0C029
        292933333304040404040400FF0000FF0000FF0000FF0000FF0000FF0000FF00
        000000000000CFCFCFBFBFBF7F7F7F0000000000004F4F4F5050500000000000
        0000FF0000FF0000FF0000FF0000FF00040404040404CCCCCCC0C0C080808004
        04040404044D4D4D55555504040404040400FF0000FF0000FF0000FF00000000
        DFDFDFD0D0D07F7F7F7F7F7FBFBFBF2F2F2F3030300000000000005F5F5F6060
        6000000000000000FF0000FF00040404DDDDDDD7D7D7808080808080C0C0C029
        29293333330404040404045F5F5F66666604040404040400FF0000FF007F7F7F
        7F7F7FA09F9FCFCFCFBFBFBFBFBFBF2F2F2F3030304F4F4F5050500000000000
        0070707000000000FF0000FF00808080808080A4A0A0CCCCCCC0C0C0C0C0C029
        29293333334D4D4D55555504040404040477777704040400FF007F7F7FA09F9F
        DFDFDFD0D0D0CFCFCFBFBFBFBFBFBF2F2F2F3030304F4F4F5050505F5F5F6060
        6000000000000000FF00808080A4A0A0DDDDDDD7D7D7CCCCCCC0C0C0C0C0C029
        29293333334D4D4D5555555F5F5F66666604040404040400FF007F7F7FFFFFFF
        DFDFDFD0D0D0CFCFCFBFBFBFFFFFFF2F2F2F3030304F4F4F5050505F5F5F6060
        607070707F7F7F000000808080FFFFFFDDDDDDD7D7D7CCCCCCC0C0C0FFFFFF29
        29293333334D4D4D5555555F5F5F6666667777778080800404047F7F7FFFFFFF
        DFDFDFD0D0D0FFFFFFFFFFFFBFBFBFBFBFBFBFBFBF4F4F4F5050505F5F5F6060
        607070707F7F7F000000808080FFFFFFDDDDDDD7D7D7FFFFFFFFFFFFC0C0C0C0
        C0C0C0C0C04D4D4D5555555F5F5F6666667777778080800404047F7F7FFFFFFF
        FFFFFFFFFFFFD0D0D0CFCFCF2F2FFFFF00FFBFBFBFBFBFBFBFBFBF5F5F5F6060
        607070707F7F7F000000808080FFFFFFFFFFFFFFFFFFD7D7D7CCCCCC66666677
        7777C0C0C0C0C0C0C0C0C05F5F5F6666667777778080800404047F7F7FFFFFFF
        DFDFDFD0D0D090FF9000FF00D0D0D0CFCFCFCFCFCF7F7F7F7F7F7F000000BFBF
        BF7070707F7F7F000000808080FFFFFFDDDDDDD7D7D75555554D4D4DD7D7D7CC
        CCCCCCCCCC808080808080040404C0C0C077777780808004040400FF007F7F7F
        7F7F7FFFFFFFDFDFDFBFBFBFD0D0D07F7F7F7F7F7F90FFFF90FFFF000000DFDF
        DF00000000000000FF0000FF00808080808080FFFFFFDDDDDDC0C0C0D7D7D780
        8080808080C0C0C0C0C0C0040404DDDDDD04040404040400FF0000FF0000FF00
        00FF007F7F7F7F7F7FFFFFFF7F7F7F90FFFF90FFFF90FFFFCFFFFFCFFFFF0000
        0000FF0000FF0000FF0000FF0000FF0000FF00808080808080FFFFFF808080C0
        C0C0C0C0C0C0C0C0D7D7D7CCCCCC04040400FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF007F7F7F7F7F7F90FFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFF
        FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF00808080808080C0
        C0C0CCCCCCCCCCCCCCCCCCD7D7D7CCCCCC04040400FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00909090CFFFFFCFFFFFCFFFFFCFFFFFEFF0
        FFEFF0FF00000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0096
        9696D7D7D7CCCCCCD7D7D7CCCCCCF0FBFFF0FBFF04040404040400FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF00909090CFFFFFEFF0FFEFF0FF9090
        9090909000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF00969696D7D7D7F0FBFFF0FBFF96969696969600FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF00AFAFAFAFAFAFAFAFAF00FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF00B2B2B2B2B2B2B2B2B200FF0000FF0000FF0000FF00}
      Layout = blGlyphRight
      NumGlyphs = 2
      OnClick = btnImprimirClick
    end
    object btnVerTraslado: TSpeedButton
      Left = 4
      Top = -1
      Width = 50
      Height = 26
      Anchors = [akTop, akRight]
      Caption = '&Traslado'
      Flat = True
      Layout = blGlyphRight
      NumGlyphs = 2
      OnClick = btnVerTrasladoClick
    end
    object btnCotizPresupuesto: TSpeedButton
      Left = 148
      Top = -1
      Width = 91
      Height = 26
      Anchors = [akTop, akRight]
      Caption = '&Cotiz. presup.'
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000
        00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF5F5F5F5F5F5F5F5F5F5F5F5FFF00FFFF00FFFF00FFFF00FF
        000000808080FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00
        FF000000000000FF00FFFF00FFFF00FF5F5F5FB0B0B0FF00FFFF00FFFF00FFFF
        00FFFF00FF5F5F5F5F5F5FFF00FFFF00FF5F5F5F5F5F5FFF00FFFF00FFFF00FF
        808080000000808080FF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFB0B0B05F5F5FB0B0B0FF00FFFF00FFFF
        00FFFF00FF5F5F5F5F5F5FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF808080000000808080FF00FFFF00FFFF00FF000000000000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0B0B05F5F5FB0B0B0FF00FFFF
        00FFFF00FF5F5F5F5F5F5FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF808080000000808080FF00FFFF00FF000000000000FF00FFFF00
        FF000000000000FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B05F5F5FB0B0B0FF
        00FFFF00FF5F5F5F5F5F5FFF00FFFF00FF5F5F5F5F5F5FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF808080000000808080FF00FFFF00FF0000000000000000
        00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0B0B05F5F5FB0
        B0B0FF00FFFF00FF5F5F5F5F5F5F5F5F5F5F5F5FFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF808080000000808080FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0B0B05F
        5F5FB0B0B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF808080000000808080FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0
        B0B05F5F5FB0B0B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        000000000000000000000000FF00FFFF00FF808080000000808080FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF5F5F5F5F5F5F5F5F5F5F5F5FFF00FFFF
        00FFB0B0B05F5F5FB0B0B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000
        000000FF00FFFF00FF000000000000FF00FFFF00FF808080000000808080FF00
        FFFF00FFFF00FFFF00FFFF00FF5F5F5F5F5F5FFF00FFFF00FF5F5F5F5F5F5FFF
        00FFFF00FFB0B0B05F5F5FB0B0B0FF00FFFF00FFFF00FFFF00FFFF00FF000000
        000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8080800000008080
        80FF00FFFF00FFFF00FFFF00FF5F5F5F5F5F5FFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFB0B0B05F5F5FB0B0B0FF00FFFF00FFFF00FFFF00FF000000
        000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8080800000
        00808080FF00FFFF00FFFF00FF5F5F5F5F5F5FFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFB0B0B05F5F5FB0B0B0FF00FFFF00FFFF00FF000000
        000000FF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00FF8080
        80000000FF00FFFF00FFFF00FF5F5F5F5F5F5FFF00FFFF00FF5F5F5F5F5F5FFF
        00FFFF00FFFF00FFFF00FFFF00FFB0B0B05F5F5FFF00FFFF00FFFF00FFFF00FF
        000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF5F5F5F5F5F5F5F5F5F5F5F5FFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphRight
      NumGlyphs = 2
      OnClick = btnCotizPresupuestoClick
    end
    object btnStockOrtopedia: TSpeedButton
      Left = 237
      Top = -1
      Width = 89
      Height = 26
      Anchors = [akTop, akRight]
      Caption = 'Stoc&k ortop.'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
        055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
        88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
        F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
        F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
        0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
        00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
        0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
        05555575FF777777755555500055555555555557775555555555}
      Layout = blGlyphRight
      NumGlyphs = 2
      OnClick = btnStockOrtopediaClick
    end
    object btnVerTurnos: TSpeedButton
      Left = 50
      Top = -1
      Width = 51
      Height = 26
      Anchors = [akTop, akRight]
      Caption = 'T&urnos'
      Flat = True
      Layout = blGlyphRight
      NumGlyphs = 2
      OnClick = btnVerTurnosClick
    end
    object btnSICToolbar: TSpeedButton
      Left = 101
      Top = -1
      Width = 47
      Height = 26
      Hint = 'SIC - Agenda de Eventos'
      Anchors = [akTop, akRight]
      Caption = 'SIC'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFCFFFFF9FFFFFAFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFEF6F3F1EEE5DD568ED10075E2007BE70079E720
        7AD8A5B8D3FCF3E8F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBF9E3E0E0
        0C72D90F98FF3A9AF06BA9E55EA6E71090FD0F90F56896D1FFF9EEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF2C84E00E95FFA4C1DBF2EBD8EAEADFF1EFE2EA
        E2D12B8FEF0E8EF4C8D9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D9F20D8EF3
        76ADE2F3EEE0E8EBE9F1F4F33F3C37EEF3EFEBE2CF1090FC3289E0FFFFFEFFFF
        FAFFFFFAFFFFF9FFFFFF8CB6E9088BF9D8DBD9EBEEEAFFFFFF52534E9D9E9BF2
        F7F5E8E6D9539DE4198BEC136A9E1676B41575B21275B28EADC192BBEB007EF3
        EBE5D8EEF0EEFFFFFF4C4C483C3D37DADDDBF3F2E75998DA198CF0968A779B9A
        91A39F935D819581AFCD92B9EA118EF4B1C2D5F3F3ECF3F5F3FFFFFFD3D4D23D
        3C35BCB29F378FE72790ECFFFFFFB4B8B5A2A19C5D869E82AFCCFFFFFF0380E9
        277DD8F8EEDAF0F2ECECEFECEFF2EFFFFEF1A3B7CF1195FF618AB8BDB6AEEBEB
        EBD0CECA729BB280ADCAFFFFFF97BAE80F90F42375D2AEBCCBE9E1D2D5D4CE6A
        93C50987F33692E9A29588BBB9B8FBFBFBFFFFFF49728983B0CDFFFFFFFFFFFF
        91B6E8007BE8138DF1097EEA158AF20E8DF34594E4D4CBC69C9A95A8A7A5F5F4
        F5FFFFFF4C748B83B0CDFFFFFFFFFFFFFFFFFFFFFFFE8DB6EB3C84CB2767A4E4
        E9F6E1D8CCEBEBEAEDEDEDECEDEDC8CBCAFFFFFF4D748B83B0CDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7BAAC64C7080FFFFFF88908EC0C1BEFFFFFFC0C1BE8890
        8EFFFFFF4B718683B0CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A9DBE629CC03D
        677FD2CFC9677E8845718A667D87D3D0CA3F698066A0C479A7C4FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE8F1F5689CBD6AA2C5DAD5CF7693A170A8CB85A0AFCCC7
        C26BA3C6689CBDEDF3F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC8CAC9FCFAF8FFFFFFFBF9F7C9CBCAFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphRight
      ParentShowHint = False
      ShowHint = True
      Transparent = False
      OnClick = btnSICClick
    end
  end
  object fpVencimiento: TFormPanel
    Left = 780
    Top = 88
    Width = 276
    Height = 81
    Caption = 'Presupuesto de ortopedia'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      276
      81)
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 162
      Height = 13
      Caption = 'Fecha de vencimiento del alquiler:'
    end
    object Bevel3: TBevel
      Left = 3
      Top = 45
      Width = 271
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object dcFechaAlquiler: TDateComboBox
      Left = 179
      Top = 12
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object btnAceptarFecha: TButton
      Left = 114
      Top = 52
      Width = 75
      Height = 24
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarFechaClick
    end
    object btnCancelarFecha: TButton
      Left = 194
      Top = 52
      Width = 75
      Height = 24
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object fpStockOrto: TFormPanel
    Left = 380
    Top = 501
    Width = 489
    Height = 180
    Caption = 'Stock ortopedia'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      489
      180)
    object Bevel4: TBevel
      Left = 4
      Top = 148
      Width = 481
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lvStockOrto: TListView
      Left = 5
      Top = 5
      Width = 479
      Height = 139
      Anchors = [akLeft, akTop, akRight]
      Checkboxes = True
      Columns = <
        item
          Caption = 'Id. Mat.'
          Width = 55
        end
        item
          Caption = 'Descripci'#243'n'
          Width = 160
        end
        item
          Caption = 'Origen'
          Width = 80
        end
        item
          Caption = 'Observaciones'
          Width = 180
        end>
      TabOrder = 0
      ViewStyle = vsReport
    end
    object btnAceptarOrto: TButton
      Left = 341
      Top = 153
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarOrtoClick
    end
    object btnCancelarOrto: TButton
      Left = 416
      Top = 153
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object fpTurnoExistente: TFormPanel
    Left = 464
    Top = 380
    Width = 457
    Height = 193
    Caption = 'Verificaci'#243'n turnos'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      457
      193)
    object Bevel5: TBevel
      Left = 3
      Top = 157
      Width = 451
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label5: TLabel
      Left = 4
      Top = 4
      Width = 444
      Height = 16
      Caption = 'Atenci'#243'n: ya existe un turno para el siniestro en el mismo d'#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel6: TBevel
      Left = 3
      Top = 23
      Width = 451
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label8: TLabel
      Left = 5
      Top = 35
      Width = 53
      Height = 13
      Caption = 'N'#186' Autoriz.'
    end
    object Label10: TLabel
      Left = 5
      Top = 60
      Width = 47
      Height = 13
      Caption = 'Prestador'
    end
    object Label11: TLabel
      Left = 5
      Top = 85
      Width = 52
      Height = 13
      Caption = 'Hora turno'
    end
    object Label19: TLabel
      Left = 5
      Top = 135
      Width = 36
      Height = 13
      Caption = 'Destino'
    end
    object Label20: TLabel
      Left = 5
      Top = 110
      Width = 50
      Height = 13
      Caption = 'Prestaci'#243'n'
    end
    object btnCancelarTurno: TButton
      Left = 384
      Top = 163
      Width = 68
      Height = 26
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'C&ancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object btnContinuarTurno: TButton
      Left = 305
      Top = 163
      Width = 73
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Continuar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object edNroAutTurno: TEdit
      Left = 64
      Top = 31
      Width = 37
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    inline fraPrestacionTurno: TfraPrestacion
      Left = 63
      Top = 104
      Width = 390
      Height = 24
      TabOrder = 3
      ExplicitLeft = 63
      ExplicitTop = 104
      ExplicitWidth = 390
      DesignSize = (
        390
        24)
      inherited edCodigo: TEdit
        Width = 52
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        ExplicitWidth = 52
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 56
        Width = 335
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        ExplicitLeft = 56
        ExplicitWidth = 335
      end
    end
    object edPresTurno: TEdit
      Left = 64
      Top = 56
      Width = 389
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edHoraTur: TMaskEdit
      Left = 64
      Top = 81
      Width = 37
      Height = 21
      TabStop = False
      Color = clBtnFace
      EditMask = '!90:00;1;_'
      MaxLength = 5
      ReadOnly = True
      TabOrder = 5
      Text = '  :  '
      OnExit = edHoraTurnoExit
    end
    object edDestinoTurno: TEdit
      Left = 64
      Top = 131
      Width = 389
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
  end
  object fpAgregarRel: TFormPanel
    Left = 416
    Top = 408
    Width = 527
    Height = 70
    Caption = 'Agregar prestaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpAgregarRelBeforeShow
    DesignSize = (
      527
      70)
    object Bevel7: TBevel
      Left = 3
      Top = 36
      Width = 521
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label23: TLabel
      Left = 5
      Top = 12
      Width = 50
      Height = 13
      Caption = 'Prestaci'#243'n'
    end
    object btnAceptarRel: TButton
      Left = 379
      Top = 43
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarRelClick
    end
    object btnCancelarRel: TButton
      Left = 454
      Top = 43
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraNomencladorRel: TfraNomenclador
      Left = 58
      Top = 9
      Width = 463
      Height = 21
      PopupMenu = fraNomencladorRel.PopupMenu
      TabOrder = 0
      ExplicitLeft = 58
      ExplicitTop = 9
      ExplicitWidth = 463
      ExplicitHeight = 21
      DesignSize = (
        463
        21)
      inherited cmbDescripcion: TLookupComboDlg
        Width = 348
        DataSource = nil
        ExplicitWidth = 348
      end
      inherited ImageList: TImageList
        Bitmap = {
          494C010102002800380010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
          0000000000003600000028000000400000001000000001002000000000000010
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000808080000000000080808000000
          0000000000000808080000000000080808000000000000000000080808000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002942420000000000000000000000
          00000000000000000000000000000000000084848400CECECE00CECECE00CECE
          CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
          CE00080808000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000018180000FFFF0063A5A50031525200000000000000
          00000000000000000000000000000000000084848400FFFFFF009CFFFF00FF00
          0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
          00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
          FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
          18000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF00
          0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
          E700294A4A0000000000000000000000000084848400FFFFFF009CFFFF00FFFF
          FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
          C60063BDBD0031525200000000000000000084848400FFFFFF00FFFFFF00FF63
          3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000BDA5
          A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
          EF0000E7E70018CECE00212121000000000084848400FFFFFF00FFFFFF009CFF
          FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
          CE00080808000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008C00
          0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
          F7007BDEDE00005A5A00212121000000000084848400FFFFFF009CCECE009CCE
          CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
          0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
          B5000031310039393900000000000000000084848400FFFFFF00003100000031
          00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
          0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
          52000000000000000000000000000000000084848400FFFFFF00639C9C00CEFF
          FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
          0000080808000000000008080800000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000C6BDBD00B5631000FFFF
          F700BDADAD008473000084000000942121002121210021212100000000000000
          00000000000000000000000000000000000084848400FFFFFF00FFFFFF00639C
          9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
          9C00639C9C0000000000FF633100FF6331000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000C6841000FFFFE7008C8C
          2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
          0000000000000000000000000000000000008484840084848400848484008484
          8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
          CE00639C9C00639C9C00FF9C3100FF9C31000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000094393900F7F76B009C843900AD84
          7B00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
          CE009CCECE009CCECE00FFCE3100FFCE31000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000943939007B7B0000AD6B6B000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
          FF00CEFFFF00639C9C00FFFF9C00FFFF9C000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
          9C00639C9C00FFFFFF00FF633100FF6331000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000424D3E000000000000003E000000
          2800000040000000100000000100010000000000800000000000000000000000
          000000000000000000000000FFFFFF00FFFF000700000000FE7F000700000000
          FC3F000700000000F81F000700000000F80F000700000000F007000700000000
          F003000700000000E001000700000000E001000700000000C003000700000000
          C00F000000000000803F00000000000081FF0000000000000FFFF80000000000
          1FFFFC0000000000FFFFFE000000000000000000000000000000000000000000
          000000000000}
      end
    end
  end
  object fpCartelEnvio: TFormPanel
    Left = 581
    Top = 464
    Width = 359
    Height = 101
    Caption = 'Agregar prestaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      359
      101)
    object Bevel8: TBevel
      Left = 3
      Top = 69
      Width = 350
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label27: TLabel
      Left = 8
      Top = 10
      Width = 343
      Height = 14
      Caption = 'Atenci'#243'n: Ud. debe enviar Partes evolutivos al m'#233'dico Auditor.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 287
      Top = 74
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object memoDirecciones: TMemo
      Left = 8
      Top = 29
      Width = 341
      Height = 36
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT au_id, ex_siniestro, ex_orden, ex_recaida, art.SIN.gettip' +
        'o(ex_tipo) tipo, '
      
        '       ex_causafin, mp_nombre, mp_contrato, ex_cuit, INITCAP(tj_' +
        'nombre) tj_nombre,'
      '       art.trabajador.get_telefono(tj_id, 4) Telefono,'
      
        '       mp_calle, mp_numero, mp_piso, mp_departamento, mp_localid' +
        'ad,'
      
        '       mp_cpostal, mp_telefonos, mp_fax, mp_provincia, tj_calle,' +
        ' tj_numero, tj_piso, tj_documento,'
      
        '       tj_departamento, tj_cpostal, tj_localidad, tj_provincia, ' +
        'ex_cuil, ex_fechaaccidente, '
      
        '       ex_fecharecaida, ex_altamedica, ex_brevedescripcion, ca_c' +
        'lave, ca_descripcion,'
      
        '       ca_secuencia, ca_identificador, ca_direlectronica, ca_dom' +
        'icilio, ca_localidad, '
      
        '       ca_codpostal, ca_telefono, ca_fax, ex_diagnostico, au_fec' +
        'hasoli, au_fecharecep, '
      
        '       au_pressol, pr_descripcion, au_cantidad, au_diasdevol, au' +
        '_fechadesde, au_fechahasta, '
      
        '       au_estado, au_subprest, au_subapro, au_usualta, au_fechaa' +
        'lta, au_implante, au_aval,'
      
        '       au_observacionesimpresion, au_detalle, au_trabajo, au_usu' +
        'apro, au_fechapro, au_presapro, '
      
        '       au_cantapro, au_observaciones, au_identifapro, tb_descrip' +
        'cion estado, au_importe, '
      
        '       au_detalleapro, au_impoapro, au_numauto, au_turno, au_tur' +
        'nohora, fi_firmante, '
      
        '       au_medico, pr_diasevo, au_nropedido, gp_codigo, gp_nombre' +
        ', on_descripcion, '
      
        '       au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, au' +
        '_accionauditoria, '
      
        '       pr_formulario, au_fechaauditoria, pv_descripcion, on_id i' +
        'dnomenclador, '
      
        '       ex_suspensionplazo, ex_id, au_fentregaortop, tj_id, ex_es' +
        'tado,'
      
        '       NVL(au_idstock, 0) au_idstock, NVL(au_idpresupuesto, 0) a' +
        'u_idpresupuesto,'
      
        '       dg_codigo || '#39' - '#39' || dg_descripcion cie10, au_kmviaje, a' +
        'u_kmbase, au_kmexcedente,'
      
        '       au_tiempoespera, ex_contrato, pr_requisitospedent, tp_des' +
        'cripcion, pr_presupuestos'
      '  FROM sex_expedientes, ctb_tablas, cfi_firma,'
      
        '       mpr_prestaciones, ctj_trabajador, cpv_provincias, cmp_emp' +
        'resas,'
      
        '       cpr_prestador, sau_autorizaciones, mgp_gtrabajo, son_nome' +
        'nclador,'
      '       cdg_diagnostico, art.mtp_tipoprestador'
      ' WHERE ex_cuit = mp_cuit'
      '   AND ex_cuil = tj_cuil(+)'
      '   AND au_identifprestador = ca_identificador(+)'
      '   AND au_siniestro = ex_siniestro'
      '   AND au_orden = ex_orden'
      '   AND au_recaida = ex_recaida'
      '   AND au_pressol = pr_codigo(+)'
      '   AND tb_codigo = au_estado'
      '   AND tb_clave = '#39'MUAUT'#39
      '   AND au_aval = fi_id(+)'
      '   AND au_trabajo = gp_codigo(+)'
      '   AND au_pres_codigo = on_codigo(+)'
      '   AND au_pres_nomenclador = on_nomenclador(+)'
      '   AND au_pres_capitulo = on_capitulo(+)'
      '   AND ca_provincia = pv_codigo(+)'
      '   AND ex_diagnosticooms = dg_codigo(+) '
      '   AND au_id = :pidauto'
      '   AND tp_codigo = ca_especialidad'
      '')
    Left = 364
    Top = 38
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIdAuto'
        ParamType = ptInput
      end>
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'AutorizaTrasladoRemis'
      end
      item
        Name = 'AutorizaExcepcion'
      end
      item
        Name = 'AprobRechTrasladosSML'
      end
      item
        Name = 'AprobRechSML'
      end
      item
        Name = 'AprobarSinValor'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 388
    Top = 10
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 416
    Top = 10
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16468
        OnShortCutPress = btnTrabajadorClick
        LinkControl = btnTrabajador
      end>
    Left = 444
    Top = 10
  end
  object sdqImplante: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'select im_codigo, im_marca, im_empresa, im_origen, im_fbaja, pa_' +
        'descripcion'
      'from mim_implantes, cpa_paises '
      'where im_origen = pa_codigo (+)')
    Left = 212
    Top = 438
  end
  object dsImplante: TDataSource
    DataSet = sdqImplante
    Left = 240
    Top = 438
  end
  object sdqRecorreTurnos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   tp_fechaturno, tp_horaturno'
      '    FROM SIN.stp_turnosprestaciones'
      '   WHERE tp_idautorizacion = :idautoorig'
      '     AND tp_fechabaja IS NULL'
      'ORDER BY tp_fechaturno, tp_horaturno'
      ''
      ''
      ''
      ''
      '')
    Left = 9
    Top = 251
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idautoorig'
        ParamType = ptInput
      end>
  end
end
