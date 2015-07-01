inherited frmManTurnosMedicos: TfrmManTurnosMedicos
  Left = 300
  Top = 156
  Caption = 'Mantenimiento de Turnos M'#233'dicos'
  ClientHeight = 470
  ClientWidth = 647
  Constraints.MinHeight = 500
  Constraints.MinWidth = 650
  OldCreateOrder = True
  ExplicitLeft = 300
  ExplicitTop = 156
  ExplicitWidth = 655
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 647
    Height = 28
    ExplicitWidth = 647
    ExplicitHeight = 28
    object Label9: TLabel
      Left = 6
      Top = 6
      Width = 35
      Height = 13
      Caption = 'M'#233'dico'
    end
    inline fraMedico: TfraCodigoDescripcion
      Left = 47
      Top = 2
      Width = 360
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 47
      ExplicitTop = 2
      ExplicitWidth = 360
      inherited cmbDescripcion: TArtComboBox
        Left = 60
        Width = 295
        ExplicitLeft = 60
        ExplicitWidth = 295
      end
      inherited edCodigo: TPatternEdit
        Width = 53
        ExplicitWidth = 53
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 28
    Width = 647
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 641
      end>
    ExplicitTop = 28
    ExplicitWidth = 647
    inherited ToolBar: TToolBar
      Width = 632
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ExplicitWidth = 632
      inherited tbRefrescar: TToolButton
        ImageIndex = 4
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 23
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        ImageIndex = 24
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 25
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited ToolButton4: TToolButton
        Hint = 'Licencias'
        Caption = ''
        ImageIndex = 38
        Style = tbsButton
        Visible = True
        OnClick = ToolButton4Click
        ExplicitWidth = 23
      end
      inherited tbPropiedades: TToolButton
        Left = 123
        Hint = 'Replicar turno (Ctrl+R)'
        ImageIndex = 41
        Visible = True
        OnClick = tbPropiedadesClick
        ExplicitLeft = 123
      end
      inherited ToolButton3: TToolButton
        Left = 146
        ExplicitLeft = 146
      end
      inherited tbLimpiar: TToolButton
        Left = 154
        ImageIndex = 3
        ExplicitLeft = 154
      end
      inherited tbOrdenar: TToolButton
        Left = 177
        ImageIndex = 5
        ExplicitLeft = 177
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 200
        ImageIndex = 28
        ExplicitLeft = 200
      end
      inherited ToolButton6: TToolButton
        Left = 223
        ExplicitLeft = 223
      end
      inherited tbImprimir: TToolButton
        Left = 231
        ImageIndex = 7
        ExplicitLeft = 231
      end
      inherited tbExportar: TToolButton
        Left = 254
        ImageIndex = 1
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        Visible = False
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ImageIndex = 17
        Visible = False
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        ImageIndex = 19
        Visible = False
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        ImageIndex = 8
        ExplicitLeft = 362
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 57
    Width = 647
    Height = 413
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'DIA'
        Title.Caption = 'D'#237'a'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREMEDICO'
        Title.Caption = 'M'#233'dico'
        Width = 168
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM_FRECUENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Frecuencia'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM_HORADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Hora de Inicio'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM_HORAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Hora de Fin'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM_HORADESDE2'
        Title.Alignment = taCenter
        Title.Caption = '2da. Hora Inicio'
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM_HORAHASTA2'
        Title.Alignment = taCenter
        Title.Caption = '2da. Hora Fin'
        Width = 80
        Visible = True
      end>
  end
  object FPABM: TFormPanel [3]
    Left = 104
    Top = 48
    Width = 412
    Height = 176
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      412
      176)
    object Label1: TLabel
      Left = 6
      Top = 9
      Width = 18
      Height = 13
      Caption = 'D'#237'a'
    end
    object Label3: TLabel
      Left = 6
      Top = 69
      Width = 51
      Height = 13
      Caption = 'Hora Inicio'
    end
    object Label4: TLabel
      Left = 6
      Top = 94
      Width = 40
      Height = 13
      Caption = 'Hora Fin'
    end
    object Label5: TLabel
      Left = 6
      Top = 118
      Width = 53
      Height = 13
      Caption = 'Frecuencia'
    end
    object Label6: TLabel
      Left = 251
      Top = 69
      Width = 75
      Height = 13
      Caption = '2da. Hora Inicio'
    end
    object Label7: TLabel
      Left = 251
      Top = 94
      Width = 64
      Height = 13
      Caption = '2da. Hora Fin'
    end
    object Label8: TLabel
      Left = 90
      Top = 110
      Width = 36
      Height = 13
      Caption = 'minutos'
    end
    object bvNomTop: TBevel
      Left = 4
      Top = 57
      Width = 402
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel1: TBevel
      Left = 4
      Top = 138
      Width = 403
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 6
      Top = 33
      Width = 35
      Height = 13
      Caption = 'M'#233'dico'
    end
    object CmbDia: TComboBox
      Left = 65
      Top = 6
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        '1-Lunes'
        '2-Martes'
        '3-Miercoles'
        '4-Jueves'
        '5-Viernes'
        '6-S'#225'bado')
    end
    inline framedicoABM: TfraCodigoDescripcion
      Left = 65
      Top = 29
      Width = 340
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 65
      ExplicitTop = 29
      ExplicitWidth = 340
      inherited cmbDescripcion: TArtComboBox
        Left = 59
        Width = 281
        ExplicitLeft = 59
        ExplicitWidth = 281
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 53
        ExplicitLeft = 0
        ExplicitWidth = 53
      end
    end
    object dtHoraDesde: TDateTimePicker
      Left = 65
      Top = 65
      Width = 76
      Height = 21
      Date = 37372.500000000000000000
      Time = 37372.500000000000000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 2
    end
    object dtHoraHasta: TDateTimePicker
      Left = 65
      Top = 89
      Width = 76
      Height = 21
      Date = 37372.500000000000000000
      Time = 37372.500000000000000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 3
    end
    object btnAceptar: TButton
      Left = 250
      Top = 146
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      TabOrder = 7
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 331
      Top = 145
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 8
    end
    object edFrecuencia: TRxSpinEdit
      Left = 65
      Top = 113
      Width = 76
      Height = 21
      Increment = 5.000000000000000000
      MaxValue = 60.000000000000000000
      MinValue = 5.000000000000000000
      Value = 5.000000000000000000
      TabOrder = 4
    end
    object dtHoraDesde2: TDateTimePicker
      Left = 331
      Top = 65
      Width = 76
      Height = 21
      Date = 37372.500000000000000000
      Time = 37372.500000000000000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 5
    end
    object dtHoraHasta2: TDateTimePicker
      Left = 331
      Top = 89
      Width = 76
      Height = 21
      Date = 37372.500000000000000000
      Time = 37372.500000000000000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 6
    end
  end
  object fpLicencias: TFormPanel [4]
    Left = 96
    Top = 225
    Width = 441
    Height = 213
    Caption = 'Licencias'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      441
      213)
    object Label12: TLabel
      Left = 6
      Top = 48
      Width = 28
      Height = 13
      Caption = 'Tarea'
    end
    object Bevel3: TBevel
      Left = 4
      Top = 97
      Width = 432
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label17: TLabel
      Left = 6
      Top = 12
      Width = 35
      Height = 13
      Caption = 'M'#233'dico'
    end
    object Label10: TLabel
      Left = 141
      Top = 75
      Width = 12
      Height = 13
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 6
      Top = 75
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Bevel2: TBevel
      Left = 5
      Top = 34
      Width = 432
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object DTPHasta: TDateComboBox
      Left = 159
      Top = 71
      Width = 88
      Height = 21
      MinDateCombo = DTPDesde
      TabOrder = 3
    end
    object DTPDesde: TDateComboBox
      Left = 48
      Top = 71
      Width = 88
      Height = 21
      MaxDateCombo = DTPHasta
      TabOrder = 2
    end
    inline fraTarea: TfraCodigoDescripcion
      Left = 48
      Top = 42
      Width = 388
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 48
      ExplicitTop = 42
      ExplicitWidth = 388
      inherited cmbDescripcion: TArtComboBox
        Left = 94
        Width = 293
        ExplicitLeft = 94
        ExplicitWidth = 293
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 88
        ExplicitLeft = 0
        ExplicitWidth = 88
      end
    end
    object btnAgregarLicencia: TBitBtn
      Left = 363
      Top = 104
      Width = 73
      Height = 26
      Caption = '&Agregar'
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
      TabOrder = 5
      OnClick = btnAgregarLicenciaClick
    end
    object btnQuitarLicencia: TBitBtn
      Left = 363
      Top = 134
      Width = 73
      Height = 26
      Caption = '&Quitar'
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
      TabOrder = 6
      OnClick = btnQuitarLicenciaClick
    end
    object btnCerrarLicencia: TBitBtn
      Left = 363
      Top = 181
      Width = 73
      Height = 26
      Caption = '&Cerrar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 7
    end
    object dgLicencias: TArtDBGrid
      Left = 7
      Top = 104
      Width = 348
      Height = 103
      DataSource = dsLicencias
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      AutoTitleHeight = True
      Columns = <
        item
          Expanded = False
          FieldName = 'DescTarea'
          Title.Caption = 'Tarea'
          Width = 180
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'lm_desde'
          Title.Alignment = taCenter
          Title.Caption = 'Desde'
          Width = 72
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'lm_hasta'
          Title.Alignment = taCenter
          Title.Caption = 'Hasta'
          Width = 72
          Visible = True
        end>
    end
    inline fraMedicoLic: TfraCodigoDescripcion
      Left = 48
      Top = 8
      Width = 388
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnExit = fraMedicoLicExit
      ExplicitLeft = 48
      ExplicitTop = 8
      ExplicitWidth = 388
      inherited cmbDescripcion: TArtComboBox
        Width = 323
        ExplicitWidth = 323
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        ExplicitLeft = 0
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT tm_dia, DECODE(tm_dia,2,'#39'Lunes'#39',3,'#39'Martes'#39',4,'#39'Miercoles'#39',' +
        '5,'#39'Jueves'#39',6,'#39'Viernes'#39') Dia,'
      
        '               tm_auditor CodMedico, au_nombre NombreMedico, tm_' +
        'horadesde, '
      
        '               tm_horahasta, tm_horadesde2, tm_horahasta2, tm_fr' +
        'ecuencia, tm_fechabaja '
      '   FROM stm_turnosmedicos, mau_auditores'
      'WHERE tm_auditor=au_auditor'
      '')
  end
  inherited QueryPrint: TQueryPrint
    Headers.Color = 11184810
    Totals.Color = 14079702
    SubTotals.Color = 12961221
    Margins.Left = 10
    Margins.Right = 10
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
      end
      item
        Key = 16466
        LinkControl = tbPropiedades
      end>
  end
  object dsLicencias: TDataSource
    DataSet = sdqLicencias
    Left = 156
    Top = 348
  end
  object sdqLicencias: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT ta_codigo CodTarea, ta_descripcion DescTarea, '
      '               lm_idtarea, lm_idmedico, lm_desde, lm_hasta'
      '   FROM slm_licenciasmedicas, cta_tarea'
      'WHERE lm_idtarea = ta_id'
      '      AND lm_idmedico = :IdMedico'
      '      AND lm_fechabaja IS NULL'
      'ORDER BY lm_desde DESC')
    Left = 128
    Top = 348
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdMedico'
        ParamType = ptInput
      end>
  end
end
