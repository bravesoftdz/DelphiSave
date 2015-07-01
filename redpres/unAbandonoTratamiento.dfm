inherited frmAbandonoTratamiento: TfrmAbandonoTratamiento
  Left = 376
  Top = 188
  ActiveControl = edSiniestro
  Caption = 'Abandono de tratamiento'
  ClientHeight = 567
  ClientWidth = 699
  OldCreateOrder = True
  ExplicitLeft = 376
  ExplicitTop = 188
  ExplicitWidth = 707
  ExplicitHeight = 597
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 699
    Height = 86
    ExplicitWidth = 699
    ExplicitHeight = 86
    object GroupBox1: TGroupBox
      Left = 0
      Top = 1
      Width = 115
      Height = 41
      Caption = 'Siniestro'
      TabOrder = 0
      object edSiniestro: TSinEdit
        Left = 4
        Top = 14
        Width = 107
        Height = 21
        TabOrder = 0
        TabStop = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 192
      Top = 1
      Width = 294
      Height = 41
      Caption = 'Evento'
      TabOrder = 2
      inline fraEvento: TfraCodigoDescripcion
        Left = 4
        Top = 13
        Width = 287
        Height = 23
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 13
        ExplicitWidth = 287
        inherited cmbDescripcion: TArtComboBox
          Width = 222
          ExplicitWidth = 222
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 489
      Top = 1
      Width = 208
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Delegaci'#243'n'
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
      DesignSize = (
        208
        41)
      inline fraDelegacion: TfraDelegacion
        Left = 3
        Top = 13
        Width = 202
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 13
        ExplicitWidth = 202
        inherited cmbDescripcion: TArtComboBox
          Width = 137
          ExplicitWidth = 137
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 117
      Top = 1
      Width = 74
      Height = 41
      TabOrder = 1
      DesignSize = (
        74
        41)
      object chkImpresos: TCheckBox
        Left = 5
        Top = 7
        Width = 61
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Impresos'
        Checked = True
        Color = clScrollBar
        Enabled = False
        ParentColor = False
        State = cbChecked
        TabOrder = 0
      end
      object chkAbandonoMixto: TCheckBox
        Left = 5
        Top = 23
        Width = 65
        Height = 15
        Anchors = [akTop, akRight]
        Caption = 'Ab. Mixto'
        TabOrder = 1
      end
    end
    object GroupBox5: TGroupBox
      Left = 193
      Top = 42
      Width = 504
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Grupo de Trabajo'
      TabOrder = 5
      DesignSize = (
        504
        41)
      inline fraGrupoTrabajo: TfraGrupoTrabajo
        Left = 4
        Top = 14
        Width = 495
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 14
        ExplicitWidth = 495
        DesignSize = (
          495
          23)
        inherited lblGestor: TLabel
          Left = 324
          Width = 31
          ExplicitLeft = 324
          ExplicitWidth = 31
        end
        inherited cmbGestor: TArtComboBox
          Left = 360
          ExplicitLeft = 360
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 270
          ExplicitWidth = 270
        end
      end
    end
    object gbFAltaMed: TGroupBox
      Left = 1
      Top = 42
      Width = 191
      Height = 41
      Caption = 'F. Alta M'#233'dica'
      TabOrder = 4
      object Label1: TLabel
        Left = 92
        Top = 19
        Width = 6
        Height = 14
        Caption = '>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dtAltaMedDesde: TDateComboBox
        Left = 3
        Top = 15
        Width = 87
        Height = 21
        MaxDateCombo = dtAltaMedHasta
        ErrorMessage = 
          'La fecha de Control debe ser posterior a la fecha del accidente ' +
          'y no puede ser mayor a la fecha actual'
        TabOrder = 0
      end
      object dtAltaMedHasta: TDateComboBox
        Left = 101
        Top = 15
        Width = 88
        Height = 21
        MinDateCombo = dtAltaMedDesde
        ErrorMessage = 
          'La fecha de Control debe ser posterior a la fecha del accidente ' +
          'y no puede ser mayor a la fecha actual'
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 86
    Width = 699
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 693
      end>
    ExplicitTop = 86
    ExplicitWidth = 699
    inherited ToolBar: TToolBar
      Width = 684
      ExplicitWidth = 684
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Detalles (Ctrl+D)'
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 115
    Width = 699
    Height = 452
    Columns = <
      item
        Expanded = False
        FieldName = 'EX_SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_ORDEN'
        Title.Caption = 'Orden'
        Width = 40
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
        FieldName = 'FECHAACCIDENTE'
        Title.Caption = 'F. Accidente'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_BAJAMEDICA'
        Title.Caption = 'F. Baja M'#233'd.'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_ALTAMEDICA'
        Title.Caption = 'F. Alta M'#233'd.'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRAVEDAD'
        Title.Caption = 'Gravedad'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIE10'
        Title.Caption = 'CIE-10'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEMPRESA'
        Title.Caption = 'Raz'#243'n Social'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMTRABAJADOR'
        Title.Caption = 'Apellido y Nombre'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTRABAJO'
        Title.Caption = 'Gr. Trabajo'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Gestor'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADORCONSULTORIO'
        Title.Caption = 'Prestador/Consultorio'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FSRT'
        Title.Caption = 'F. SRT'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F1CIT'
        Title.Caption = 'F. 1ra. Cita'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F2CIT'
        Title.Caption = 'F. 2da. Cita'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FCARGA'
        Title.Caption = 'F. Carga'
        Width = 65
        Visible = True
      end>
  end
  object fpEventos: TFormPanel [3]
    Left = 376
    Top = 88
    Width = 555
    Height = 549
    Caption = 'Eventos'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    Constraints.MinHeight = 350
    Constraints.MinWidth = 440
    DesignSize = (
      555
      549)
    object Bevel2: TBevel
      Left = 4
      Top = 483
      Width = 547
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 415
      Top = 68
      Width = 27
      Height = 13
      Caption = 'F.Alta'
    end
    object Label3: TLabel
      Left = 412
      Top = 45
      Width = 30
      Height = 13
      Caption = 'F.Baja'
    end
    object btnTrabajador: TSpeedButton
      Left = 5
      Top = 488
      Width = 24
      Height = 23
      Hint = 'Modificar datos del Trabajador'
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
      OnClick = btnTrabajadorClick
    end
    object Label4: TLabel
      Left = 6
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object btnSiniMasDatos: TSpeedButton
      Left = 168
      Top = 8
      Width = 16
      Height = 22
      Hint = 'Ver datos del Siniestro'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      ParentFont = False
      OnClick = btnSiniMasDatosClick
    end
    object btnBuscarSini: TSpeedButton
      Left = 187
      Top = 8
      Width = 23
      Height = 22
      Hint = 'Buscar Siniestro'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00040404000404040004040400FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0004040400336666006699CC0004040400FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00040404003366660099CCCC00C6D6EF0004040400FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0004040400336666006699CC00C6D6EF0004040400FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000404
        0400336666006699CC00C6D6EF0004040400FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00040404003366
        66006699CC0099CCCC0004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0004040400040404000404040004040400040404006699CC003399
        CC00C6D6EF0004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0004040400CCCC3300FFFF9900CCCC3300CCCC330004040400040404003399
        CC0004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000404
        0400CCCC3300FFFF9900FFFF9900CCCC3300CCCC3300CCCC3300040404000404
        0400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0004040400FFFF
        CC00FFFFFF00FFECCC00FFFF9900CCCC6600CCCC3300CCCC3300CCCC33000404
        0400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0004040400FFFF
        9900FFECCC00FFECCC00FFFF9900CCCC6600CCCC3300CCCC3300CCCC33000404
        0400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0004040400FFFF
        9900FFFF9900FFFF9900FFCC6600CCCC3300CCCC3300CC993300CC9933000404
        0400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0004040400FFFF
        3300FFCC9900FFCC9900FFCC6600CCCC3300CCCC330099993300CC9933000404
        0400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000404
        0400CCCC6600CCCC6600CCCC3300CCCC3300CCCC33009999330004040400FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0004040400CCCC3300CCCC3300CC993300CC99330004040400FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0004040400040404000404040004040400FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBuscarSiniClick
    end
    object Label5: TLabel
      Left = 12
      Top = 42
      Width = 34
      Height = 13
      Caption = 'Evento'
    end
    object Label7: TLabel
      Left = 7
      Top = 67
      Width = 40
      Height = 13
      Caption = 'Firmante'
    end
    object Label8: TLabel
      Left = 15
      Top = 94
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object Label9: TLabel
      Left = 14
      Top = 311
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label11: TLabel
      Left = 2
      Top = 337
      Width = 43
      Height = 13
      Caption = '2'#186' Fecha'
      Visible = False
    end
    object btnGetTurno2: TSpeedButton
      Left = 151
      Top = 333
      Width = 23
      Height = 22
      Hint = 'Obtener turno libre'
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
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      Visible = False
      OnClick = btnGetTurno2Click
    end
    object btnGetTurno: TSpeedButton
      Left = 151
      Top = 307
      Width = 23
      Height = 22
      Hint = 'Obtener turno libre'
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
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      Visible = False
      OnClick = btnGetTurnoClick
    end
    object Label10: TLabel
      Left = 9
      Top = 363
      Width = 37
      Height = 13
      Caption = 'Observ.'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 400
      Width = 550
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object btnAceptar: TBitBtn
      Left = 398
      Top = 522
      Width = 72
      Height = 23
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 13
      OnClick = btnAceptarClick
    end
    object btnCancelar: TBitBtn
      Left = 478
      Top = 522
      Width = 72
      Height = 23
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 14
    end
    object edFechaBaja: TEdit
      Left = 446
      Top = 40
      Width = 101
      Height = 21
      TabStop = False
      Color = clSilver
      TabOrder = 15
    end
    object edFechaAlta: TEdit
      Left = 446
      Top = 63
      Width = 101
      Height = 21
      TabStop = False
      Color = clSilver
      TabOrder = 16
    end
    object edSiniestroABM: TSinEdit
      Left = 51
      Top = 8
      Width = 115
      Height = 21
      TabOrder = 0
      OnSelect = edSiniestroABMSelect
      Color = clCream
    end
    inline fraEventoABM: TfraCodigoDescripcion
      Left = 51
      Top = 37
      Width = 356
      Height = 23
      TabOrder = 1
      TabStop = True
      ExplicitLeft = 51
      ExplicitTop = 37
      ExplicitWidth = 356
      inherited cmbDescripcion: TArtComboBox
        Left = 56
        Width = 297
        OnGetCellParams = nil
        ExplicitLeft = 56
        ExplicitWidth = 297
      end
      inherited edCodigo: TPatternEdit
        Width = 53
        ExplicitWidth = 53
      end
    end
    object pnlPrestador: TPanel
      Left = 4
      Top = 145
      Width = 547
      Height = 37
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 5
      TabStop = True
      OnExit = pnlPrestadorExit
      inline fraPrestador: TfraPrestador
        Left = 2
        Top = 8
        Width = 541
        Height = 25
        VertScrollBar.Range = 49
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 2
        ExplicitTop = 8
        ExplicitWidth = 541
        ExplicitHeight = 25
        inherited lbCUIT: TLabel
          Width = 25
          ExplicitWidth = 25
        end
        inherited lbSec: TLabel
          Width = 22
          ExplicitWidth = 22
        end
        inherited lbIdentif: TLabel
          Width = 35
          ExplicitWidth = 35
        end
        inherited lbRSocial: TLabel
          Width = 40
          ExplicitWidth = 40
        end
        inherited lbDomicilio: TLabel
          Width = 42
          ExplicitWidth = 42
        end
        inherited lbLocalidad: TLabel
          Width = 46
          ExplicitWidth = 46
        end
        inherited lbCPostal: TLabel
          Left = 453
          Width = 14
          ExplicitLeft = 453
          ExplicitWidth = 14
        end
        inherited lbTelefono: TLabel
          Left = 365
          ExplicitLeft = 365
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 70
          ExplicitWidth = 70
        end
        inherited cmbPrestador: TArtComboBox
          Width = 195
          ExplicitWidth = 195
        end
        inherited edPresLocalidad: TEdit
          Width = 99
          ExplicitWidth = 99
        end
        inherited edPresCPostal: TEdit
          Left = 470
          ExplicitLeft = 470
        end
        inherited edPresTelefono: TEdit
          Left = 385
          ExplicitLeft = 385
        end
      end
    end
    object rbPrestador: TRadioButton
      Left = 15
      Top = 137
      Width = 66
      Height = 17
      Caption = 'Prestador'
      TabOrder = 4
      OnClick = rbPrestadorClick
    end
    object pnlConsultorio: TPanel
      Left = 4
      Top = 189
      Width = 548
      Height = 37
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 7
      TabStop = True
      OnExit = pnlConsultorioExit
      DesignSize = (
        548
        37)
      object Label6: TLabel
        Left = 279
        Top = 15
        Width = 35
        Height = 13
        Caption = 'M'#233'dico'
      end
      inline fraConsultorio: TfraCtbTablas
        Left = 6
        Top = 9
        Width = 268
        Height = 23
        Enabled = False
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 6
        ExplicitTop = 9
        ExplicitWidth = 268
        DesignSize = (
          268
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 42
          Width = 224
          ExplicitLeft = 42
          ExplicitWidth = 224
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Width = 40
          ExplicitLeft = 0
          ExplicitWidth = 40
        end
      end
      inline fraMedico: TfraCodigoDescripcion
        Left = 318
        Top = 9
        Width = 227
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        TabOrder = 1
        TabStop = True
        ExplicitLeft = 318
        ExplicitTop = 9
        ExplicitWidth = 227
        DesignSize = (
          227
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 44
          Width = 181
          ExplicitLeft = 44
          ExplicitWidth = 181
        end
        inherited edCodigo: TPatternEdit
          Width = 41
          ExplicitWidth = 41
        end
      end
    end
    object rbConsultorio: TRadioButton
      Left = 15
      Top = 182
      Width = 73
      Height = 17
      Caption = 'Consultorio'
      TabOrder = 6
      OnClick = rbConsultorioClick
    end
    inline fraSector: TfraCtbTablas
      Left = 51
      Top = 87
      Width = 355
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      TabStop = True
      ExplicitLeft = 51
      ExplicitTop = 87
      ExplicitWidth = 355
      DesignSize = (
        355
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 56
        Width = 297
        ExplicitLeft = 56
        ExplicitWidth = 297
      end
      inherited edCodigo: TPatternEdit
        Width = 53
        ExplicitWidth = 53
      end
    end
    object edFecha: TDateComboBox
      Tag = 2
      Left = 51
      Top = 307
      Width = 96
      Height = 21
      TabOrder = 8
      OnExit = edFechaExit
    end
    object edFecha2: TDateComboBox
      Tag = 2
      Left = 51
      Top = 333
      Width = 96
      Height = 21
      TabOrder = 10
      Visible = False
      OnExit = edFecha2Exit
    end
    object edHora: TMaskEdit
      Left = 178
      Top = 307
      Width = 41
      Height = 21
      EditMask = '##:##;1;_'
      MaxLength = 5
      TabOrder = 9
      Text = '  :  '
    end
    object edHora2: TMaskEdit
      Left = 178
      Top = 333
      Width = 41
      Height = 21
      EditMask = '##:##;1;_'
      MaxLength = 5
      TabOrder = 11
      Text = '  :  '
      Visible = False
    end
    object edFecha2TXT: TEdit
      Left = 222
      Top = 333
      Width = 329
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      TabOrder = 18
      Visible = False
    end
    object edFechaTXT: TEdit
      Left = 222
      Top = 307
      Width = 328
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      TabOrder = 17
    end
    object edObservaciones: TMemo
      Tag = 5
      Left = 51
      Top = 359
      Width = 500
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 250
      TabOrder = 12
    end
    object dbgEventos: TRxDBGrid
      Tag = 6
      Left = 3
      Top = 409
      Width = 550
      Height = 103
      TabStop = False
      Anchors = []
      Color = clGradientInactiveCaption
      DataSource = dsEvSini
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 19
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      IniStorage = FormStorage
      RowColor2 = 16776176
      Columns = <
        item
          Expanded = False
          FieldName = 'AT_CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AT_EVENTO'
          Title.Caption = 'Evento'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_EVENTO'
          Title.Caption = 'Descripci'#243'n'
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AT_FECHA'
          Title.Caption = 'Fecha'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AT_HORA'
          Title.Caption = 'Hora'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AT_SEGUNDAFECHA'
          Title.Caption = '2'#186' Fecha'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AT_SEGUNDAHORA'
          Title.Caption = 'Hora'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AT_OBSERVACIONES'
          Title.Caption = 'Observaciones'
          Width = 251
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FIRMANTE'
          Title.Caption = 'Firmante'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_CONSUL'
          Title.Caption = 'Consultorio'
          Width = 132
          Visible = True
        end>
    end
    inline fraFirmantes: TfraFirmantes
      Left = 52
      Top = 63
      Width = 360
      Height = 21
      TabOrder = 2
      ExplicitLeft = 52
      ExplicitTop = 63
      ExplicitWidth = 360
      inherited cmbDescripcion: TArtComboBox
        Left = 55
        Width = 297
        ExplicitLeft = 55
        ExplicitWidth = 297
      end
      inherited edCodigo: TIntEdit
        Width = 53
        ExplicitWidth = 53
      end
    end
    object pnlOtro: TPanel
      Left = 3
      Top = 231
      Width = 548
      Height = 72
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 20
      TabStop = True
      OnExit = pnlConsultorioExit
      inline fraDomicilioOtro: TfraDomicilio
        Left = 3
        Top = 16
        Width = 539
        Height = 51
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 16
        ExplicitWidth = 539
        inherited lbNro: TLabel
          Left = 324
          ExplicitLeft = 324
        end
        inherited lbPiso: TLabel
          Left = 396
          Width = 20
          ExplicitLeft = 396
          ExplicitWidth = 20
        end
        inherited lbDto: TLabel
          Left = 472
          Width = 20
          ExplicitLeft = 472
          ExplicitWidth = 20
        end
        inherited lbCPostal: TLabel
          Width = 39
          ExplicitWidth = 39
        end
        inherited lbCPA: TLabel
          Width = 21
          ExplicitWidth = 21
        end
        inherited lbLocalidad: TLabel
          Width = 46
          ExplicitWidth = 46
        end
        inherited lbProvincia: TLabel
          Left = 377
          Width = 44
          ExplicitLeft = 377
          ExplicitWidth = 44
        end
        inherited cmbCalle: TArtComboBox
          Width = 239
          ExplicitWidth = 239
        end
        inherited edNumero: TEdit
          Left = 346
          ExplicitLeft = 346
        end
        inherited edPiso: TEdit
          Left = 422
          ExplicitLeft = 422
        end
        inherited edDto: TEdit
          Left = 494
          ExplicitLeft = 494
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 107
          ExplicitWidth = 107
        end
        inherited edProvincia: TEdit
          Left = 426
          ExplicitLeft = 426
        end
        inherited btnBuscar: TButton
          Left = 289
          ExplicitLeft = 289
        end
      end
    end
    object rbOtro: TRadioButton
      Left = 15
      Top = 226
      Width = 128
      Height = 17
      Caption = 'Otro Lugar de Citaci'#243'n'
      TabOrder = 21
      OnClick = rbOtroClick
    end
    object chkSerolOdont: TCheckBox
      Left = 50
      Top = 117
      Width = 217
      Height = 17
      Caption = 'Notificaci'#243'n por serolog'#237'a u odontolog'#237'a'
      TabOrder = 22
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT at_evento, ex_siniestro, ex_orden, ex_recaida, ta_descrip' +
        'cion tipoacc, el_nombre delegacion,'
      
        '       art.amebpba.get_nombregtrabajo(ex_gtrabajo) gtrabajo, NVL' +
        '(ex_fecharecaida, ex_fechaaccidente) fechaaccidente, at_fecha,'
      
        '       at_hora, at_segundafecha, at_segundahora, NVL(cubic.tb_de' +
        'scripcion, ca_descripcion) prestadorconsultorio, ex_bajamedica,'
      
        '       ex_altamedica, sgrav.tb_descripcion gravedad, ex_diagnost' +
        'icooms cie10, art.utiles.armar_cuit(ex_cuit) cuit,'
      
        '       em_nombre nomempresa, art.utiles.armar_cuit(ex_cuil) cuil' +
        ', tj_nombre nomtrabajador,'
      
        '       art.amebpba.get_datosabandono(ex_siniestro, ex_orden, NUL' +
        'L, '#39'1'#39') fsrt,'
      
        '       art.amebpba.get_datosabandono(ex_siniestro, ex_orden, ex_' +
        'recaida, '#39'2'#39') f1cit,'
      
        '       art.amebpba.get_datosabandono(ex_siniestro, ex_orden, ex_' +
        'recaida, '#39'3'#39') f2cit, pe_fechaalta fcarga,'
      
        '       art.siniestro.get_usuariogestor(ex_id) usugestor, ex_cuil' +
        ', ex_cuit,'
      '       ex_contrato, tj_id'
      '  FROM art.sex_expedientes,'
      '       SIN.sta_tipoaccidente,'
      '       art.del_delegacion,'
      '       art.cpr_prestador,'
      '       art.ctb_tablas cubic,'
      '       art.ctb_tablas sgrav,'
      '       aem_empresa,'
      '       ctj_trabajador,'
      '       SIN.spe_partedeegreso,'
      
        '       (SELECT at_siniestro, at_orden, at_recaida, at_firmante, ' +
        'at_codigo, at_evento, at_fecha, at_hora, at_consultorio,'
      '               at_segundafecha, at_segundahora, at_prestador'
      '          FROM art.sat_abandonotratamiento t1'
      '         WHERE at_codigo = '#39'001'#39
      '           AND t1.at_evento = (SELECT MAX(t2.at_evento)'
      
        '                                 FROM art.sat_abandonotratamient' +
        'o t2'
      
        '                                WHERE t1.at_siniestro = t2.at_si' +
        'niestro'
      '                                  AND t1.at_orden = t2.at_orden'
      
        '                                  AND t1.at_recaida = t2.at_reca' +
        'ida))'
      ' WHERE ex_tipo = ta_codigo(+)'
      '   AND ex_delegacion = el_id(+)'
      '   AND cubic.tb_clave(+) = '#39'CUBIC'#39
      '   AND cubic.tb_codigo(+) = at_consultorio'
      '   AND sgrav.tb_clave(+) = '#39'SGRAV'#39
      '   AND sgrav.tb_codigo(+) = ex_gravedad'
      '   AND at_prestador = ca_identificador(+)'
      '   AND NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39')'
      '   AND at_siniestro = ex_siniestro'
      '   AND at_orden = ex_orden'
      '   AND at_recaida = ex_recaida'
      '   AND em_cuit = ex_cuit'
      '   AND tj_cuil = ex_cuil'
      '   AND ex_id = pe_idexpediente'
      '   AND ((pe_idtipodeegreso IN(3, 8)))'
      '   AND at_siniestro = 847562'
      '   AND at_orden = 1'
      '   AND at_recaida = 0')
    Left = 580
    Top = 32
    object sdqConsultaAT_EVENTO: TFloatField
      FieldName = 'AT_EVENTO'
      Required = True
    end
    object sdqConsultaEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqConsultaEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqConsultaEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqConsultaTIPOACC: TStringField
      FieldName = 'TIPOACC'
      Size = 25
    end
    object sdqConsultaDELEGACION: TStringField
      FieldName = 'DELEGACION'
      Size = 50
    end
    object sdqConsultaGTRABAJO: TStringField
      FieldName = 'GTRABAJO'
      Size = 4000
    end
    object sdqConsultaFECHAACCIDENTE: TDateTimeField
      FieldName = 'FECHAACCIDENTE'
    end
    object sdqConsultaAT_FECHA: TDateTimeField
      FieldName = 'AT_FECHA'
    end
    object sdqConsultaAT_HORA: TStringField
      FieldName = 'AT_HORA'
      Size = 5
    end
    object sdqConsultaAT_SEGUNDAFECHA: TDateTimeField
      FieldName = 'AT_SEGUNDAFECHA'
    end
    object sdqConsultaAT_SEGUNDAHORA: TStringField
      FieldName = 'AT_SEGUNDAHORA'
      Size = 5
    end
    object sdqConsultaPRESTADORCONSULTORIO: TStringField
      FieldName = 'PRESTADORCONSULTORIO'
      Size = 150
    end
    object sdqConsultaEX_BAJAMEDICA: TDateTimeField
      FieldName = 'EX_BAJAMEDICA'
    end
    object sdqConsultaEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
    object sdqConsultaGRAVEDAD: TStringField
      FieldName = 'GRAVEDAD'
      Size = 150
    end
    object sdqConsultaCIE10: TStringField
      FieldName = 'CIE10'
      Size = 10
    end
    object sdqConsultaCUIT: TStringField
      FieldName = 'CUIT'
      Size = 4000
    end
    object sdqConsultaNOMEMPRESA: TStringField
      FieldName = 'NOMEMPRESA'
      Required = True
      Size = 60
    end
    object sdqConsultaCUIL: TStringField
      FieldName = 'CUIL'
      Size = 4000
    end
    object sdqConsultaNOMTRABAJADOR: TStringField
      FieldName = 'NOMTRABAJADOR'
      Required = True
      Size = 60
    end
    object sdqConsultaFSRT: TDateTimeField
      FieldName = 'FSRT'
    end
    object sdqConsultaF1CIT: TDateTimeField
      FieldName = 'F1CIT'
    end
    object sdqConsultaF2CIT: TDateTimeField
      FieldName = 'F2CIT'
    end
    object sdqConsultaFCARGA: TDateTimeField
      FieldName = 'FCARGA'
    end
    object sdqConsultaUSUGESTOR: TStringField
      FieldName = 'USUGESTOR'
      Size = 4000
    end
    object sdqConsultaEX_CUIL: TStringField
      FieldName = 'EX_CUIL'
      Size = 11
    end
    object sdqConsultaEX_CUIT: TStringField
      FieldName = 'EX_CUIT'
      Size = 11
    end
    object sdqConsultaEX_CONTRATO: TFloatField
      FieldName = 'EX_CONTRATO'
    end
    object sdqConsultaTJ_ID: TFloatField
      FieldName = 'TJ_ID'
      Required = True
    end
  end
  inherited dsConsulta: TDataSource
    Left = 608
    Top = 32
  end
  inherited SortDialog: TSortDialog
    Left = 580
    Top = 60
  end
  inherited ExportDialog: TExportDialog
    Left = 608
    Top = 60
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Sin.'
        DataField = 'EX_SINIESTRO'
        Width = 95
        MaxLength = 0
      end
      item
        Title = 'Ord.'
        DataField = 'EX_ORDEN'
        Width = 50
        MaxLength = 0
      end
      item
        Title = 'Rec.'
        DataField = 'EX_RECAIDA'
        Width = 40
        MaxLength = 0
      end
      item
        Title = 'Fec. Accid.'
        DataField = 'FECHAACCIDENTE'
        Width = 130
        MaxLength = 0
      end
      item
        Title = 'Fec.Baja Med.'
        DataField = 'EX_BAJAMEDICA'
        Width = 130
        MaxLength = 0
      end
      item
        Title = 'Fec.Alta Med.'
        DataField = 'EX_ALTAMEDICA'
        Width = 130
        MaxLength = 0
      end
      item
        Title = 'Gravedad'
        DataField = 'GRAVEDAD'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Cie10'
        DataField = 'CIE10'
        Width = 90
        MaxLength = 0
      end
      item
        Title = 'Cuit'
        DataField = 'CUIT'
        Width = 180
        MaxLength = 0
      end
      item
        Title = 'Empresa'
        DataField = 'NOMEMPRESA'
        Width = 210
        MaxLength = 0
      end
      item
        Title = 'Cuil'
        DataField = 'CUIL'
        Width = 180
        MaxLength = 0
      end
      item
        Title = 'Trabajador'
        DataField = 'NOMTRABAJADOR'
        Width = 210
        MaxLength = 0
      end
      item
        Title = 'Gr.Trabajo'
        DataField = 'GTRABAJO'
        Width = 180
        MaxLength = 0
      end
      item
        Title = 'Usu.Gestor'
        DataField = 'USUGESTOR'
        Width = 170
        MaxLength = 0
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'DELEGACION'
        Width = 180
        MaxLength = 0
      end
      item
        Title = 'Prest.Consult.'
        DataField = 'PRESTADORCONSULTORIO'
        Width = 190
        MaxLength = 0
      end
      item
        Title = 'F.SRT'
        DataField = 'FSRT'
        Width = 130
        MaxLength = 0
      end
      item
        Title = 'F.1ra.Cita'
        DataField = 'F1CIT'
        Width = 130
        MaxLength = 0
      end
      item
        Title = 'F.2da.Cita'
        DataField = 'F2CIT'
        Width = 130
        MaxLength = 0
      end
      item
        Title = 'F.Carga'
        DataField = 'FCARGA'
        Width = 130
        MaxLength = 0
      end>
    PageOrientation = pxLandscape
    Left = 644
    Top = 376
  end
  inherited Seguridad: TSeguridad
    Left = 580
    Top = 4
  end
  inherited FormStorage: TFormStorage
    Left = 608
    Top = 4
  end
  inherited PrintDialog: TPrintDialog
    Left = 616
    Top = 376
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16452
        LinkControl = tbPropiedades
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
      end
      item
        Key = 0
      end>
    Left = 636
    Top = 4
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 636
    Top = 32
  end
  object sdqEvSini: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT AT_EVENTO, AT_CODIGO,'
      '              AE_DESCRIPCION DESC_EVENTO,'
      '              CUBIC.TB_DESCRIPCION DESC_CONSUL,'
      
        '              AT_FECHA, AT_HORA, AT_SEGUNDAFECHA, AT_SEGUNDAHORA' +
        ','
      '              INITCAP(DF_USUARIO) FIRMANTE, AT_OBSERVACIONES, '
      '              AT_CONSULTORIO'
      'FROM CDF_FIRMASCARTASDOC, SAE_ABANDONOEVENTOS, CTB_TABLAS CUBIC,'
      '           SAT_ABANDONOTRATAMIENTO'
      'WHERE  AE_CODIGO = AT_CODIGO'
      ''
      '      AND CUBIC.TB_CLAVE = '#39'CUBIC'#39
      '      AND CUBIC.TB_CODIGO = AT_CONSULTORIO'
      ' '
      '      AND AT_FIRMANTE = DF_CODFIRMA  (+)'
      ''
      'AND AT_SINIESTRO = :pSiniestro'
      'AND AT_ORDEN = :pOrden'
      'AND AT_RECAIDA = :pRecaida'
      ''
      'ORDER BY AT_EVENTO'
      ' ')
    Left = 208
    Top = 462
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pOrden'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pRecaida'
        ParamType = ptInput
      end>
  end
  object dsEvSini: TDataSource
    DataSet = sdqEvSini
    Left = 236
    Top = 462
  end
end
