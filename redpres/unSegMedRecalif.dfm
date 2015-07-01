object FrmSegMedRecalif: TFrmSegMedRecalif
  Left = 345
  Top = 262
  Caption = 'Seguimiento M'#233'dico de Siniestros - Recalificaci'#243'n'
  ClientHeight = 462
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar: TCoolBar
    Left = 0
    Top = 169
    Width = 744
    Height = 28
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 24
        Width = 738
      end>
    object ToolBar: TToolBar
      Left = 11
      Top = 0
      Width = 729
      Height = 24
      Align = alNone
      ButtonHeight = 30
      ButtonWidth = 36
      Caption = 'ToolBar'
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'tbRefrescar'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = tbRefrescarClick
      end
      object tbLimpiar: TToolButton
        Left = 36
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        Caption = 'tbLimpiar'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = tbLimpiarClick
      end
      object tbOrdenar: TToolButton
        Left = 72
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        Caption = 'tbOrdenar'
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        OnClick = tbOrdenarClick
      end
      object tbImprimirSRT: TToolButton
        Left = 108
        Top = 0
        Hint = 'Imprimir Informe SRT (Ctrl + P)'
        Caption = 'tbImprimirSRT'
        Enabled = False
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = tbImprimirSRTClick
      end
      object ToolButton8: TToolButton
        Left = 144
        Top = 0
        Width = 9
        Caption = 'ToolButton8'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbNuevo: TToolButton
        Left = 153
        Top = 0
        Hint = 'Agregar evento (Ctrl + N)'
        Caption = 'tbNuevo'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = tbNuevoClick
      end
      object tbModificar: TToolButton
        Left = 189
        Top = 0
        Hint = 'Modificar Evento (Ctrl + M)'
        Caption = 'tbModificar'
        ImageIndex = 24
        ParentShowHint = False
        ShowHint = True
        OnClick = tbModificarClick
      end
      object tbEliminar: TToolButton
        Left = 225
        Top = 0
        Hint = 'Eliminar Evento (Ctrl + E)'
        Caption = 'tbEliminar'
        ImageIndex = 25
        ParentShowHint = False
        ShowHint = True
        OnClick = tbEliminarClick
      end
      object ToolButton5: TToolButton
        Left = 261
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 269
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 4
        Style = tbsSeparator
        Visible = False
      end
      object tbInfoRecaidas: TToolButton
        Left = 277
        Top = 0
        Hint = 'Info Reca'#237'das (Ctrl + I)'
        Caption = 'tbInfoRecaidas'
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
        OnClick = tbInfoRecaidasClick
      end
      object tbViajar: TToolButton
        Left = 313
        Top = 0
        Hint = 'Viajar...'
        Caption = 'tbViajar'
        DropdownMenu = pMenuViajar
        ImageIndex = 21
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = tbViajarClick
      end
      object tbTrabajador: TToolButton
        Left = 364
        Top = 0
        Caption = 'tbTrabajador'
        ImageIndex = 6
        OnClick = tbTrabajadorClick
      end
      object tbVerBajas: TToolButton
        Left = 400
        Top = 0
        Hint = 'Ver/Ocultar bajas'
        Caption = 'tbVerBajas'
        ImageIndex = 16
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton1: TToolButton
        Left = 436
        Top = 0
        Width = 12
        Caption = 'ToolButton1'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 448
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = tbSalirClick
      end
      object lblTotales: TLabel
        Left = 484
        Top = 0
        Width = 27
        Height = 30
        Caption = '         '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
    end
  end
  object Grid: TArtDBGrid
    Left = 0
    Top = 197
    Width = 744
    Height = 265
    Align = alClient
    DataSource = dsDatos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = tbModificarClick
    OnGetCellParams = GridGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ER_EVENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Ev.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR_CODIGO'
        Title.Caption = 'Evento'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ER_FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ER_FECHACONTROL1'
        Title.Alignment = taCenter
        Title.Caption = 'F.Citaci'#243'n'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ER_HORACITACION1'
        Title.Alignment = taCenter
        Title.Caption = 'Hora'
        Width = 36
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ER_FECHACONTROL2'
        Title.Alignment = taCenter
        Title.Caption = '2 F.Citaci'#243'n'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ER_HORACITACION2'
        Title.Alignment = taCenter
        Title.Caption = '2 Hora'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RE_NOMBRE'
        Title.Caption = 'Responsable'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_NOMBRE'
        Title.Caption = 'Profesional'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR_UBICACION'
        Title.Caption = 'Lugar Citaci'#243'n'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ER_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ER_CODIGO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ER_USUALTA'
        Title.Caption = 'Usuario alta'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ER_AUTORIZACION'
        Title.Caption = 'Nro. Aut.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'capint'
        Title.Caption = 'Capital - Interior'
        Visible = True
      end>
  end
  object grpEmpresa: TGroupBox
    Left = 0
    Top = 0
    Width = 744
    Height = 87
    Align = alTop
    Caption = 'Empresa'
    TabOrder = 1
    DesignSize = (
      744
      87)
    object Label3: TLabel
      Left = 626
      Top = 16
      Width = 18
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Tel.'
    end
    object Label19: TLabel
      Left = 10
      Top = 17
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inline fraEmpresa: TfraEmpresa
      Left = 52
      Top = 12
      Width = 571
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitLeft = 52
      ExplicitTop = 12
      ExplicitWidth = 571
      ExplicitHeight = 23
      DesignSize = (
        571
        23)
      inherited lbRSocial: TLabel
        Left = 87
        ExplicitLeft = 87
      end
      inherited lbContrato: TLabel
        Left = 465
        ExplicitLeft = 465
      end
      inherited edContrato: TIntEdit
        Left = 512
        ExplicitLeft = 512
      end
      inherited cmbRSocial: TArtComboBox
        Left = 128
        Width = 327
        ExplicitLeft = 128
        ExplicitWidth = 327
      end
    end
    inline fradireccion: TfraDireccion
      Left = 5
      Top = 37
      Width = 736
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 5
      ExplicitTop = 37
      ExplicitWidth = 736
      ExplicitHeight = 46
      DesignSize = (
        736
        46)
      inherited lbCalle: TLabel
        Left = 5
        ExplicitLeft = 5
      end
      inherited lbNro: TLabel
        Left = 485
        Width = 37
        Caption = 'N'#250'mero'
        ExplicitLeft = 485
        ExplicitWidth = 37
      end
      inherited lbPiso: TLabel
        Left = 585
        Width = 20
        ExplicitLeft = 585
        ExplicitWidth = 20
      end
      inherited lbDto: TLabel
        Left = 664
        Width = 20
        ExplicitLeft = 664
        ExplicitWidth = 20
      end
      inherited lbCPostal: TLabel
        Left = 5
        Top = 28
        Width = 39
        ExplicitLeft = 5
        ExplicitTop = 28
        ExplicitWidth = 39
      end
      inherited lbCPA: TLabel
        Left = 113
        Top = 28
        Width = 21
        ExplicitLeft = 113
        ExplicitTop = 28
        ExplicitWidth = 21
      end
      inherited lbLocalidad: TLabel
        Left = 196
        Top = 28
        Width = 46
        ExplicitLeft = 196
        ExplicitTop = 28
        ExplicitWidth = 46
      end
      inherited lbProvincia: TLabel
        Left = 485
        Top = 28
        Width = 44
        ExplicitLeft = 485
        ExplicitTop = 28
        ExplicitWidth = 44
      end
      inherited cmbCalle: TArtComboBox
        Left = 49
        Width = 429
        Color = clBtnFace
        ReadOnly = True
        ExplicitLeft = 49
        ExplicitWidth = 429
      end
      inherited edNumero: TEdit
        Left = 534
        Color = clBtnFace
        ReadOnly = True
        ExplicitLeft = 534
      end
      inherited edPiso: TEdit
        Left = 613
        Width = 42
        Color = clBtnFace
        ReadOnly = True
        ExplicitLeft = 613
        ExplicitWidth = 42
      end
      inherited edDto: TEdit
        Left = 691
        Width = 40
        Color = clBtnFace
        ReadOnly = True
        ExplicitLeft = 691
        ExplicitWidth = 40
      end
      inherited edCPostal: TIntEdit
        Left = 49
        Top = 24
        Width = 54
        Color = clBtnFace
        ReadOnly = True
        ExplicitLeft = 49
        ExplicitTop = 24
        ExplicitWidth = 54
      end
      inherited cmbLocalidad: TArtComboBox
        Left = 247
        Top = 24
        Width = 232
        Color = clBtnFace
        ReadOnly = True
        ExplicitLeft = 247
        ExplicitTop = 24
        ExplicitWidth = 232
      end
      inherited edProvincia: TEdit
        Left = 534
        Top = 24
        Width = 198
        ExplicitLeft = 534
        ExplicitTop = 24
        ExplicitWidth = 198
      end
      inherited edCPA: TPatternEdit
        Left = 141
        Top = 24
        Width = 47
        ExplicitLeft = 141
        ExplicitTop = 24
        ExplicitWidth = 47
      end
    end
    object edTelEmpresa: TEdit
      Left = 647
      Top = 12
      Width = 89
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
  end
  object grpSiniestro: TGroupBox
    Left = 0
    Top = 130
    Width = 744
    Height = 39
    Align = alTop
    Caption = 'Siniestro'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    DesignSize = (
      744
      39)
    object blSinFecha: TLabel
      Left = 132
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label1: TLabel
      Left = 420
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label2: TLabel
      Left = 550
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Diagn'#243'stico'
    end
    object Bevel5: TBevel
      Left = 414
      Top = 10
      Width = 2
      Height = 25
    end
    object Bevel1: TBevel
      Left = 238
      Top = 10
      Width = 2
      Height = 25
    end
    object Label16: TLabel
      Left = 260
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Reca/dict.'
    end
    object Label23: TLabel
      Left = 348
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Pluriempleo'
    end
    object pnlSiniestro: TPanel
      Left = 1
      Top = 13
      Width = 128
      Height = 22
      BevelOuter = bvNone
      TabOrder = 0
      object sbtnBuscar: TSpeedButton
        Left = 104
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Buscar Siniestro'
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000C40E0000C40E00000001000000000000000000000000
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
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FAFAFAFAFAFA
          FAFAFAFAFAFAFA0A0A0AFAFAFAFAFAFAFAFAFAFAFAFAFAF8F8F8FAFAFAFAFAFA
          FAFAFAFAFAFA0A4A740AFAFAFAFAFAFAFAFAFAFAFAFAF81C99F8FAFAFAFAFAFA
          FAFAFAFAFA0A4A991A0AFAFAFAFAFAFAFAFAFAFAFAF81C1A1BF8FAFAFAFAFAFA
          FAFAFAFA0A4A741A0AFAFAFAFAFAFAFAFAFAFAFAF81C991BF8FAFAFAFAFAFAFA
          FAFAFA0A4A741A0AFAFAFAFAFAFAFAFAFAFAFAF81C991BF8FAFAFAFAFAFAFAFA
          FAFA0A4A74990AFAFAFAFAFAFAFAFAFAFAFAF81C991AF8FAFAFAFAFAFA0A0A0A
          0A0A74521A0AFAFAFAFAFAFAFAF8F8F8F8F899991BF8FAFAFAFAFAFA0AB9E1B9
          B90A0A520AFAFAFAFAFAFAFAF8BB19BBBBF8F899F8FAFAFAFAFAFA0AB9E1E1B9
          B9B90A0AFAFAFAFAFAFAFAF8BB1919BBBBBBF8F8FAFAFAFAFAFA0AE2FF19E1BA
          B9B9B90AFAFAFAFAFAFAF8F3F4F31909BBBBBBF8FAFAFAFAFAFA0AE11919E1BA
          B9B9B90AFAFAFAFAFAFAF819F3F31909BBBBBBF8FAFAFAFAFAFA0AE1E1E1DBB9
          B9B3B30AFAFAFAFAFAFAF819191909BBBBBBBBF8FAFAFAFAFAFA0ADFDCDCDBB9
          B990B30AFAFAFAFAFAFAF8E1191909BBBBBBBBF8FAFAFAFAFAFAFA0ABABAB9B9
          B9900AFAFAFAFAFAFAFAFAF80909BBBBBBBBF8FAFAFAFAFAFAFAFAFA0AB9B9B3
          B30AFAFAFAFAFAFAFAFAFAFAF8BBBBBBBBF8FAFAFAFAFAFAFAFAFAFAFA0A0A0A
          0AFAFAFAFAFAFAFAFAFAFAFAFAF8F8F8F8FAFAFAFAFAFAFAFAFA}
        NumGlyphs = 2
        OnClick = sbtnBuscarClick
      end
      object SinEdit: TSinEdit
        Left = 4
        Top = 0
        Width = 100
        Height = 21
        TabOrder = 0
        OnSelect = SinEditSelect
      end
    end
    object edEstado: TEdit
      Left = 457
      Top = 13
      Width = 90
      Height = 21
      Hint = 'Causa Fin'
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edSinFecha: TDateEditor
      Left = 165
      Top = 13
      Width = 69
      Height = 21
      Hint = 'Fecha del Siniestro'
      TabStop = False
      Date = 36812.000000000000000000
      BlanksChar = '_'
      Color = clBtnFace
      ReadOnly = True
      ShowButton = False
      TabOrder = 2
      ParentCtl3D = False
    end
    object edDiagnostico: TEdit
      Left = 608
      Top = 13
      Width = 131
      Height = 21
      Hint = 'Causa Fin'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object chkRecaDictamen: TCheckBox
      Left = 243
      Top = 15
      Width = 15
      Height = 17
      Enabled = False
      TabOrder = 4
    end
    object chkPluriempleo: TCheckBox
      Left = 328
      Top = 15
      Width = 13
      Height = 17
      Enabled = False
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 87
    Width = 744
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      744
      43)
    object grpTrabajador: TGroupBox
      Left = 0
      Top = 2
      Width = 403
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Trabajador'
      TabOrder = 0
      DesignSize = (
        403
        41)
      object Label22: TLabel
        Left = 273
        Top = 19
        Width = 33
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'F. Baja'
      end
      inline fraTrabajadorSIN: TfraTrabajadorSIN
        Left = 2
        Top = 15
        Width = 269
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 15
        ExplicitWidth = 269
        ExplicitHeight = 24
        DesignSize = (
          269
          24)
        inherited lbTrabCUIL: TLabel
          Left = 3
          Width = 24
          ExplicitLeft = 3
          ExplicitWidth = 24
        end
        inherited lbTrabNombre: TLabel
          Left = 111
          ExplicitLeft = 111
        end
        inherited mskTrabCUIL: TMaskEdit
          Left = 30
          Width = 77
          ExplicitLeft = 30
          ExplicitWidth = 77
        end
        inherited dbcTrabNombre: TArtComboBox
          Left = 154
          Width = 113
          ExplicitLeft = 154
          ExplicitWidth = 113
        end
      end
      object edFechaBaja: TDateEdit
        Left = 311
        Top = 15
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object gbUbicacion: TGroupBox
      Left = 406
      Top = 2
      Width = 336
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Ubicaci'#243'n del Siniestro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      DesignSize = (
        336
        41)
      object Label7: TLabel
        Left = 210
        Top = 18
        Width = 31
        Height = 13
        Caption = 'Deleg.'
      end
      object Label6: TLabel
        Left = 4
        Top = 18
        Width = 50
        Height = 13
        Caption = 'G. Trabajo'
      end
      object edDelegacion: TEdit
        Left = 244
        Top = 14
        Width = 86
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edGTrabajo: TEdit
        Left = 59
        Top = 15
        Width = 146
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object fpSeleccionRecaida: TFormPanel
    Left = 191
    Top = 240
    Width = 201
    Height = 76
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnClose = fpSeleccionRecaidaClose
    OnBeforeShow = fpSeleccionRecaidaBeforeShow
    Constraints.MinHeight = 70
    Constraints.MinWidth = 200
    DesignSize = (
      201
      76)
    object lbSelRecaida: TLabel
      Left = 18
      Top = 11
      Width = 104
      Height = 13
      Caption = 'Seleccione la reca'#237'da'
    end
    object Bevel8: TBevel
      Left = 7
      Top = 36
      Width = 187
      Height = 8
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarRecaida: TButton
      Left = 68
      Top = 45
      Width = 61
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Default = True
      TabOrder = 1
      OnClick = btnAceptarRecaidaClick
    end
    object btnCancelarRecaida: TButton
      Left = 135
      Top = 45
      Width = 60
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarRecaidaClick
    end
    object cmbRecaida: TRxDBLookupCombo
      Left = 135
      Top = 7
      Width = 50
      Height = 21
      DropDownCount = 3
      Anchors = [akLeft, akTop, akRight]
      LookupField = 'EX_RECAIDA'
      LookupDisplay = 'EX_RECAIDA'
      LookupSource = dsRecaidas
      TabOrder = 0
    end
  end
  object ScrollBox1: TScrollBox
    Left = 136
    Top = 324
    Width = 493
    Height = 513
    HorzScrollBar.Position = 767
    TabOrder = 7
    Visible = False
    object qrDerivacion: TQuickRep
      Left = 33
      Top = 28
      Width = 1056
      Height = 816
      IDReport = 0
      BeforePrint = qrDerivacionBeforePrint
      DataSet = sdqPartes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Functions.Strings = (
        'PAGENUMBER'
        'COLUMNNUMBER'
        'REPORTTITLE')
      Functions.DATA = (
        '0'
        '0'
        #39#39)
      Options = [FirstPageHeader, LastPageFooter]
      Page.Columns = 1
      Page.Orientation = poLandscape
      Page.PaperSize = Letter
      Page.Continuous = False
      Page.Values = (
        100.000000000000000000
        2159.000000000000000000
        100.000000000000000000
        2794.000000000000000000
        40.000000000000000000
        40.000000000000000000
        0.000000000000000000)
      PrinterSettings.Copies = 1
      PrinterSettings.OutputBin = Auto
      PrinterSettings.Duplex = False
      PrinterSettings.FirstPage = 0
      PrinterSettings.LastPage = 0
      PrinterSettings.UseStandardprinter = False
      PrinterSettings.UseCustomBinCode = False
      PrinterSettings.CustomBinCode = 0
      PrinterSettings.ExtendedDuplex = 0
      PrinterSettings.UseCustomPaperCode = False
      PrinterSettings.CustomPaperCode = 0
      PrinterSettings.PrintMetaFile = False
      PrinterSettings.PrintQuality = 0
      PrinterSettings.Collate = 0
      PrinterSettings.ColorOption = 0
      PrintIfEmpty = True
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsNormal
      PrevInitialZoom = qrZoomToFit
      PreviewDefaultSaveType = stQRP
      PreviewLeft = 0
      PreviewTop = 0
      object TitleBand1: TQRBand
        Left = 15
        Top = 38
        Width = 1026
        Height = 294
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          777.875000000000000000
          2714.625000000000000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbTitle
        object qriLogo: TQRImage
          Left = 808
          Top = 1
          Width = 213
          Height = 88
          Size.Values = (
            232.833333333333400000
            2137.833333333333000000
            2.645833333333333000
            563.562500000000000000)
          XLColumn = 0
        end
        object QRSysData2: TQRSysData
          Left = 4
          Top = 4
          Width = 417
          Height = 17
          Size.Values = (
            44.979166666666670000
            10.583333333333330000
            10.583333333333330000
            1103.312500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          Data = qrsDate
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          FontSize = 10
        end
        object QRLabel1: TQRLabel
          Left = 372
          Top = 32
          Width = 241
          Height = 24
          Size.Values = (
            63.500000000000000000
            984.250000000000000000
            84.666666666666680000
            637.645833333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'DERIVACION AL INTERIOR'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 12
        end
        object QRLabel2: TQRLabel
          Left = 8
          Top = 72
          Width = 64
          Height = 17
          Size.Values = (
            44.979166666666670000
            21.166666666666670000
            190.500000000000000000
            169.333333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Siniestro:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object qrlSiniestro: TQRLabel
          Left = 76
          Top = 72
          Width = 121
          Height = 17
          Size.Values = (
            44.979166666666670000
            201.083333333333300000
            190.500000000000000000
            320.145833333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlSiniestro'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel3: TQRLabel
          Left = 8
          Top = 95
          Width = 187
          Height = 17
          Size.Values = (
            44.979166666666670000
            21.166666666666670000
            251.354166666666700000
            494.770833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Mecanismo accidentol'#243'gico:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object qrlBreveDescripcion: TQRLabel
          Left = 196
          Top = 95
          Width = 825
          Height = 39
          Size.Values = (
            103.187500000000000000
            518.583333333333400000
            251.354166666666700000
            2182.812500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlBreveDescripcion'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object qrlCUIT: TQRLabel
          Left = 45
          Top = 176
          Width = 112
          Height = 17
          Size.Values = (
            44.979166666666670000
            119.062500000000000000
            465.666666666666800000
            296.333333333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlCUIT'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel5: TQRLabel
          Left = 3
          Top = 176
          Width = 39
          Height = 17
          Size.Values = (
            44.979166666666670000
            7.937500000000000000
            465.666666666666700000
            103.187500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'CUIT:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object qrlRSocial: TQRLabel
          Left = 234
          Top = 175
          Width = 787
          Height = 17
          Size.Values = (
            44.979166666666670000
            619.125000000000000000
            463.020833333333400000
            2082.270833333333000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlRSocial'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel6: TQRLabel
          Left = 164
          Top = 175
          Width = 64
          Height = 17
          Size.Values = (
            44.979166666666670000
            433.916666666666700000
            463.020833333333400000
            169.333333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'R. Social:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel4: TQRLabel
          Left = 164
          Top = 195
          Width = 63
          Height = 17
          Size.Values = (
            44.979166666666670000
            433.916666666666700000
            515.937500000000000000
            166.687500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Domicilio:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object qrlDomEmpresa: TQRLabel
          Left = 234
          Top = 195
          Width = 531
          Height = 17
          Size.Values = (
            44.979166666666670000
            619.125000000000000000
            515.937500000000000000
            1404.937500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlDomEmpresa'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object qrlTelEmpresa: TQRLabel
          Left = 834
          Top = 195
          Width = 187
          Height = 17
          Size.Values = (
            44.979166666666670000
            2206.625000000000000000
            515.937500000000000000
            494.770833333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlTelEmpresa'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel8: TQRLabel
          Left = 768
          Top = 195
          Width = 64
          Height = 17
          Size.Values = (
            44.979166666666670000
            2032.000000000000000000
            515.937500000000000000
            169.333333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Tel'#233'fono:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object qrlCUIL: TQRLabel
          Left = 45
          Top = 226
          Width = 112
          Height = 17
          Size.Values = (
            44.979166666666670000
            119.062500000000000000
            597.958333333333400000
            296.333333333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlCUIL'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel9: TQRLabel
          Left = 3
          Top = 226
          Width = 37
          Height = 17
          Size.Values = (
            44.979166666666670000
            7.937500000000000000
            597.958333333333400000
            97.895833333333340000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'CUIL:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object qrlNombreTrab: TQRLabel
          Left = 234
          Top = 225
          Width = 787
          Height = 17
          Size.Values = (
            44.979166666666670000
            619.125000000000000000
            595.312500000000000000
            2082.270833333333000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlNombreTrab'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel11: TQRLabel
          Left = 164
          Top = 225
          Width = 56
          Height = 17
          Size.Values = (
            44.979166666666670000
            433.916666666666700000
            595.312500000000000000
            148.166666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Nombre:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel12: TQRLabel
          Left = 164
          Top = 245
          Width = 63
          Height = 17
          Size.Values = (
            44.979166666666670000
            433.916666666666700000
            648.229166666666800000
            166.687500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Domicilio:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object qrlDomTrab: TQRLabel
          Left = 234
          Top = 245
          Width = 531
          Height = 17
          Size.Values = (
            44.979166666666670000
            619.125000000000000000
            648.229166666666800000
            1404.937500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlDomTrab'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object qrlTelTrab: TQRLabel
          Left = 834
          Top = 245
          Width = 187
          Height = 17
          Size.Values = (
            44.979166666666670000
            2206.625000000000000000
            648.229166666666800000
            494.770833333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlTelTrab'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel15: TQRLabel
          Left = 768
          Top = 245
          Width = 64
          Height = 17
          Size.Values = (
            44.979166666666670000
            2032.000000000000000000
            648.229166666666800000
            169.333333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Tel'#233'fono:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel7: TQRLabel
          Left = 8
          Top = 136
          Width = 171
          Height = 17
          Size.Values = (
            44.979166666666670000
            21.166666666666670000
            359.833333333333300000
            452.437500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Ubicaci'#243'n de la denuncia:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object qrlUbicacion: TQRLabel
          Left = 196
          Top = 136
          Width = 825
          Height = 17
          Size.Values = (
            44.979166666666670000
            518.583333333333400000
            359.833333333333400000
            2182.812500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlUbicacion'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel19: TQRLabel
          Left = 4
          Top = 273
          Width = 226
          Height = 17
          Size.Values = (
            44.979166666666670000
            10.583333333333330000
            722.312500000000000000
            597.958333333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'DETALLE DE PARTES EVOLUTIVOS'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRShape1: TQRShape
          Left = 4
          Top = 292
          Width = 1021
          Height = 3
          Size.Values = (
            7.937500000000000000
            10.583333333333330000
            772.583333333333400000
            2701.395833333333000000)
          XLColumn = 0
          Shape = qrsHorLine
          VertAdjust = 0
        end
      end
      object ColumnHeaderBand1: TQRBand
        Left = 15
        Top = 332
        Width = 1026
        Height = 22
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          58.208333333333340000
          2714.625000000000000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbColumnHeader
        object QRLabel10: TQRLabel
          Left = 2
          Top = 3
          Width = 25
          Height = 17
          Size.Values = (
            44.979166666666670000
            5.291666666666667000
            7.937500000000000000
            66.145833333333340000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'N'#186
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel13: TQRLabel
          Left = 30
          Top = 3
          Width = 70
          Height = 17
          Size.Values = (
            44.979166666666670000
            79.375000000000000000
            7.937500000000000000
            185.208333333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'F. control'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel14: TQRLabel
          Left = 102
          Top = 3
          Width = 48
          Height = 17
          Size.Values = (
            44.979166666666670000
            269.875000000000000000
            7.937500000000000000
            127.000000000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'CIE 10'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel16: TQRLabel
          Left = 151
          Top = 3
          Width = 239
          Height = 17
          Size.Values = (
            44.979166666666670000
            399.520833333333400000
            7.937500000000000000
            632.354166666666800000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'Prestador'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel17: TQRLabel
          Left = 392
          Top = 3
          Width = 633
          Height = 17
          Size.Values = (
            44.979166666666670000
            1037.166666666667000000
            7.937500000000000000
            1674.812500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'Observaciones'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRShape2: TQRShape
          Left = 4
          Top = 20
          Width = 1021
          Height = 3
          Size.Values = (
            7.937500000000000000
            10.583333333333330000
            52.916666666666660000
            2701.395833333333000000)
          XLColumn = 0
          Shape = qrsHorLine
          VertAdjust = 0
        end
      end
      object DetailBand1: TQRBand
        Left = 15
        Top = 384
        Width = 1026
        Height = 20
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          52.916666666666670000
          2714.625000000000000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbDetail
        object qrdbParte: TQRDBText
          Left = 2
          Top = 2
          Width = 25
          Height = 16
          Size.Values = (
            42.333333333333340000
            5.291666666666667000
            5.291666666666667000
            66.145833333333340000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqPartes
          DataField = 'PV_NROPARTE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText1: TQRDBText
          Left = 30
          Top = 2
          Width = 69
          Height = 16
          Size.Values = (
            42.333333333333340000
            79.375000000000000000
            5.291666666666667000
            182.562500000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqPartes
          DataField = 'PV_FECHACONTROL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText2: TQRDBText
          Left = 102
          Top = 2
          Width = 48
          Height = 16
          Size.Values = (
            42.333333333333340000
            269.875000000000000000
            5.291666666666667000
            127.000000000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqPartes
          DataField = 'PV_DIAGNOSTICOOMS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText3: TQRDBText
          Left = 151
          Top = 2
          Width = 239
          Height = 16
          Size.Values = (
            42.333333333333340000
            399.520833333333400000
            5.291666666666667000
            632.354166666666800000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqPartes
          DataField = 'CA_NOMBREFANTA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText4: TQRDBText
          Left = 392
          Top = 3
          Width = 633
          Height = 15
          Size.Values = (
            39.687500000000000000
            1037.166666666667000000
            7.937500000000000000
            1674.812500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqPartes
          DataField = 'PV_OBSERVACIONES'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRShape4: TQRShape
          Left = 4
          Top = -1
          Width = 1021
          Height = 3
          Size.Values = (
            7.937500000000000000
            10.583333333333330000
            -2.645833333333333000
            2701.395833333333000000)
          XLColumn = 0
          Shape = qrsHorLine
          VertAdjust = 0
        end
      end
      object PageFooterBand1: TQRBand
        Left = 15
        Top = 404
        Width = 1026
        Height = 20
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          52.916666666666670000
          2714.625000000000000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbPageFooter
        object QRSysData1: TQRSysData
          Left = 1004
          Top = 3
          Width = 17
          Height = 14
          Size.Values = (
            37.041666666666670000
            2656.416666666667000000
            7.937500000000000000
            44.979166666666670000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          Data = qrsPageNumber
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          FontSize = 8
        end
        object QRLabel18: TQRLabel
          Left = 964
          Top = 3
          Width = 39
          Height = 14
          Size.Values = (
            37.041666666666670000
            2550.583333333333000000
            7.937500000000000000
            103.187500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'P'#225'gina'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
      end
      object QRGroup1: TQRGroup
        Left = 15
        Top = 354
        Width = 1026
        Height = 30
        AlignToBottom = False
        Color = clActiveBorder
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          79.375000000000000000
          2714.625000000000000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        Expression = 'sdqPartes.PV_RECAIDA'
        Master = qrDerivacion
        ReprintOnNewPage = False
        object QRDBText5: TQRDBText
          Left = 102
          Top = 7
          Width = 33
          Height = 17
          Size.Values = (
            44.979166666666670000
            269.875000000000000000
            18.520833333333330000
            87.312500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clActiveBorder
          DataSet = sdqPartes
          DataField = 'PV_RECAIDA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 10
        end
        object QRLabel20: TQRLabel
          Left = 40
          Top = 7
          Width = 63
          Height = 17
          Size.Values = (
            44.979166666666670000
            105.833333333333300000
            18.520833333333330000
            166.687500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Reca'#237'da:'
          Color = clActiveBorder
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel21: TQRLabel
          Left = 140
          Top = 7
          Width = 50
          Height = 17
          Size.Values = (
            44.979166666666670000
            370.416666666666700000
            18.520833333333330000
            132.291666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Fecha:'
          Color = clActiveBorder
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRDBText6: TQRDBText
          Left = 191
          Top = 7
          Width = 106
          Height = 17
          Size.Values = (
            44.979166666666670000
            505.354166666666700000
            18.520833333333330000
            280.458333333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clActiveBorder
          DataSet = sdqPartes
          DataField = 'FECHA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 10
        end
        object QRLabel22: TQRLabel
          Left = 298
          Top = 7
          Width = 92
          Height = 17
          Size.Values = (
            44.979166666666670000
            788.458333333333400000
            18.520833333333330000
            243.416666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Alta m'#233'dica:'
          Color = clActiveBorder
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRDBText7: TQRDBText
          Left = 391
          Top = 7
          Width = 113
          Height = 17
          Size.Values = (
            44.979166666666670000
            1034.520833333333000000
            18.520833333333330000
            298.979166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clActiveBorder
          DataSet = sdqPartes
          DataField = 'EX_ALTAMEDICA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 10
        end
      end
    end
  end
  object fpEventos: TFormPanel
    Left = 190
    Top = 206
    Width = 546
    Height = 349
    Caption = 'Carga de Eventos'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnClose = fpEventosClose
    OnBeforeShow = fpEventosBeforeShow
    Constraints.MinHeight = 70
    Constraints.MinWidth = 310
    object gbProtocolo: TGroupBox
      Left = 4
      Top = 2
      Width = 539
      Height = 314
      Caption = 'Datos del evento'
      TabOrder = 0
      DesignSize = (
        539
        314)
      object Label9: TLabel
        Left = 4
        Top = 22
        Width = 40
        Height = 13
        Caption = 'Siniestro'
      end
      object Label11: TLabel
        Left = 210
        Top = 22
        Width = 30
        Height = 13
        Caption = 'Fecha'
      end
      object Label4: TLabel
        Left = 4
        Top = 224
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object Label5: TLabel
        Left = 4
        Top = 51
        Width = 34
        Height = 13
        Caption = 'Evento'
      end
      object Label8: TLabel
        Left = 4
        Top = 75
        Width = 52
        Height = 13
        Caption = 'Profesional'
      end
      object Label10: TLabel
        Left = 4
        Top = 99
        Width = 62
        Height = 13
        Caption = 'Responsable'
      end
      object Label12: TLabel
        Left = 4
        Top = 123
        Width = 40
        Height = 13
        Caption = 'Firmante'
      end
      object Label13: TLabel
        Left = 4
        Top = 147
        Width = 67
        Height = 13
        Caption = 'Lugar citaci'#243'n'
      end
      object Label14: TLabel
        Left = 4
        Top = 177
        Width = 70
        Height = 13
        Caption = 'Fecha citaci'#243'n'
      end
      object Label15: TLabel
        Left = 176
        Top = 177
        Width = 63
        Height = 13
        Caption = 'Hora citaci'#243'n'
      end
      object Label17: TLabel
        Left = 4
        Top = 202
        Width = 73
        Height = 13
        Caption = 'Segunda fecha'
      end
      object Label18: TLabel
        Left = 176
        Top = 202
        Width = 63
        Height = 13
        Caption = 'Hora citaci'#243'n'
      end
      object edObservaciones: TMemo
        Left = 3
        Top = 238
        Width = 530
        Height = 71
        MaxLength = 550
        TabOrder = 14
      end
      object SinEditABM: TSinEdit
        Left = 81
        Top = 18
        Width = 122
        Height = 21
        TabOrder = 0
        Enabled = False
      end
      inline fraProfesional: TfraCodDesc
        Left = 80
        Top = 71
        Width = 455
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ExplicitLeft = 80
        ExplicitTop = 71
        ExplicitWidth = 455
        DesignSize = (
          455
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 44
          Width = 411
          ExplicitLeft = 44
          ExplicitWidth = 411
        end
        inherited edCodigo: TPatternEdit
          Width = 40
          OnKeyPress = fraProfesionaledCodigoKeyPress
          ExplicitWidth = 40
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'AU_FBAJA'
          FieldCodigo = 'AU_AUDITOR'
          FieldDesc = 'AU_NOMBRE'
          FieldID = 'AU_AUDITOR'
          TableName = 'MAU_AUDITORES'
        end
      end
      inline fraResponsable: TfraCodDesc
        Left = 80
        Top = 95
        Width = 455
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        ExplicitLeft = 80
        ExplicitTop = 95
        ExplicitWidth = 455
        DesignSize = (
          455
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 44
          Width = 411
          ExplicitLeft = 44
          ExplicitWidth = 411
        end
        inherited edCodigo: TPatternEdit
          Width = 40
          OnKeyPress = fraResponsableedCodigoKeyPress
          ExplicitWidth = 40
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'RE_FECBAJA'
          FieldCodigo = 'RE_RESPONSABLE'
          FieldDesc = 'RE_NOMBRE'
          FieldID = 'RE_RESPONSABLE'
          TableName = 'MRE_RESPONSABLE'
        end
      end
      inline fraUbicacion: TfraCtbTablas
        Left = 80
        Top = 143
        Width = 454
        Height = 23
        TabOrder = 7
        ExplicitLeft = 80
        ExplicitTop = 143
        ExplicitWidth = 454
        DesignSize = (
          454
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 45
          Width = 410
          ExplicitLeft = 45
          ExplicitWidth = 410
        end
        inherited edCodigo: TPatternEdit
          Width = 40
          OnKeyPress = fraUbicacionedCodigoKeyPress
          ExplicitWidth = 40
        end
      end
      object DateCitacion: TDateComboBox
        Left = 80
        Top = 172
        Width = 91
        Height = 21
        TabOrder = 8
        OnKeyPress = DateCitacionKeyPress
      end
      object edHora: TMaskEdit
        Left = 242
        Top = 172
        Width = 40
        Height = 21
        EditMask = '##:##;1;_'
        MaxLength = 5
        TabOrder = 9
        Text = '  :  '
        OnKeyPress = edHoraKeyPress
      end
      object edSinFechaABM: TDateComboBox
        Left = 243
        Top = 18
        Width = 89
        Height = 21
        TabOrder = 1
        OnKeyPress = edSinFechaABMKeyPress
      end
      object chkRecaDictamenABM: TCheckBox
        Left = 343
        Top = 10
        Width = 117
        Height = 17
        Caption = 'Reca/dictamen'
        Enabled = False
        TabOrder = 2
      end
      object DateCitacion2: TDateComboBox
        Left = 80
        Top = 197
        Width = 90
        Height = 21
        TabOrder = 12
        OnKeyPress = DateCitacionKeyPress
      end
      object edHora2: TMaskEdit
        Left = 242
        Top = 197
        Width = 40
        Height = 21
        EditMask = '##:##;1;_'
        MaxLength = 5
        TabOrder = 13
        Text = '  :  '
        OnKeyPress = edHoraKeyPress
      end
      object gbConformeAlta: TGroupBox
        Left = 292
        Top = 166
        Width = 113
        Height = 32
        Caption = 'Conforme alta'
        TabOrder = 10
        object rbSiAlta: TRadioButton
          Left = 13
          Top = 14
          Width = 31
          Height = 14
          Caption = 'Si'
          Enabled = False
          TabOrder = 0
        end
        object rbNoAlta: TRadioButton
          Left = 61
          Top = 14
          Width = 35
          Height = 14
          Caption = 'No'
          Enabled = False
          TabOrder = 1
        end
      end
      object gbConformeCese: TGroupBox
        Left = 292
        Top = 199
        Width = 113
        Height = 31
        Caption = 'Conforme cese ILT'
        TabOrder = 11
        object rbSiCese: TRadioButton
          Left = 13
          Top = 14
          Width = 31
          Height = 14
          Caption = 'Si'
          Enabled = False
          TabOrder = 0
        end
        object rbNoCese: TRadioButton
          Left = 61
          Top = 14
          Width = 35
          Height = 14
          Caption = 'No'
          Enabled = False
          TabOrder = 1
        end
      end
      inline fraEvento: TfraCodDesc
        Left = 80
        Top = 47
        Width = 455
        Height = 23
        TabOrder = 3
        ExplicitLeft = 80
        ExplicitTop = 47
        ExplicitWidth = 455
        DesignSize = (
          455
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 44
          Width = 411
          ExplicitLeft = 44
          ExplicitWidth = 411
        end
        inherited edCodigo: TPatternEdit
          Width = 40
          ExplicitWidth = 40
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND em_automatico = '#39'N'#39' '
          ExtraFields = 
            ', em_automatico, em_codcartadoc, em_digitaliza, em_imprimirsrt, ' +
            'em_telegrama, em_telegramatrab, em_citacion, em_seguimiento, em_' +
            'reubicacion, em_parteevolutivo, em_altareca, em_citaciondoble, e' +
            'm_notificacion, em_responsable, em_segterreno, em_derivinterior,' +
            ' em_profesional, em_fechaantalta, em_recadictamen, em_telegrecap' +
            'rof, em_telegrecaprest, em_generaautorizacion, em_eventoanterior' +
            ', em_capint, em_prestacionaut'
          FieldBaja = 'EM_FECHABAJA'
          FieldCodigo = 'EM_CODIGO'
          FieldDesc = 'EM_DESCRIPCION'
          FieldID = 'EM_ID'
          OrderBy = 'EM_CODIGO'
          TableName = 'sin.sem_eventomedicoreca'
          OnChange = fraEventoPropiedadesChange
        end
      end
      inline fraFirmante: TfraCodigoDescripcion
        Left = 80
        Top = 119
        Width = 455
        Height = 23
        TabOrder = 6
        ExplicitLeft = 80
        ExplicitTop = 119
        ExplicitWidth = 455
        DesignSize = (
          455
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 44
          Width = 411
          ExplicitLeft = 44
          ExplicitWidth = 411
        end
        inherited edCodigo: TPatternEdit
          Width = 40
          ExplicitWidth = 40
        end
      end
      object gbPresupIncap: TGroupBox
        Left = 412
        Top = 166
        Width = 122
        Height = 32
        Caption = 'Presup. Incap.'
        TabOrder = 15
        object rbSiPresupIncap: TRadioButton
          Left = 8
          Top = 14
          Width = 31
          Height = 14
          Caption = 'Si'
          Enabled = False
          TabOrder = 0
        end
        object rbNoPresupIncap: TRadioButton
          Left = 64
          Top = 14
          Width = 35
          Height = 14
          Caption = 'No'
          Enabled = False
          TabOrder = 1
        end
      end
      object rgCapInt: TRadioGroup
        Left = 412
        Top = 199
        Width = 122
        Height = 32
        Columns = 2
        Items.Strings = (
          'Capital'
          'Interior')
        TabOrder = 16
      end
      object chkAviso30dias: TCheckBox
        Left = 343
        Top = 28
        Width = 190
        Height = 17
        Caption = 'Aviso Espera Inicio Capacit. 30 d'#237'as'
        Enabled = False
        TabOrder = 17
      end
    end
    object btnAceptar: TBitBtn
      Left = 378
      Top = 319
      Width = 80
      Height = 24
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
      TabOrder = 1
      OnClick = btnAceptarClick
    end
    object btnCancelar: TBitBtn
      Left = 461
      Top = 319
      Width = 80
      Height = 24
      Caption = '&Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
  object fpDatosAutorizacion: TFormPanel
    Left = 711
    Top = 332
    Width = 522
    Height = 302
    Caption = 'Datos para la Autorizaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpDatosAutorizacionBeforeShow
    ActiveControl = rbEntregaSi
    Constraints.MinHeight = 70
    Constraints.MinWidth = 310
    object gbConEntregaMaterial: TGroupBox
      Left = 5
      Top = 4
      Width = 136
      Height = 31
      Caption = 'Con entrega de material '
      TabOrder = 0
      object rbEntregaSi: TRadioButton
        Left = 24
        Top = 14
        Width = 31
        Height = 14
        Caption = 'Si'
        TabOrder = 0
        OnClick = rbEntregaSiClick
      end
      object rbEntregaNo: TRadioButton
        Left = 76
        Top = 14
        Width = 35
        Height = 14
        Caption = 'No'
        TabOrder = 1
        OnClick = rbEntregaNoClick
      end
    end
    object gbDireccionEntrega: TGroupBox
      Left = 6
      Top = 39
      Width = 512
      Height = 129
      Caption = 'Direcci'#243'n entrega'
      TabOrder = 1
      object rbDireccionPaciente: TRadioButton
        Left = 12
        Top = 19
        Width = 131
        Height = 14
        Caption = 'Direcci'#243'n del paciente'
        TabOrder = 0
        OnClick = rbDireccionPacienteClick
      end
      object rbDireccionART: TRadioButton
        Left = 12
        Top = 35
        Width = 131
        Height = 14
        Caption = 'Direcci'#243'n de la ART'
        TabOrder = 1
        OnClick = rbDireccionARTClick
      end
      object rbOtraDireccion: TRadioButton
        Left = 12
        Top = 51
        Width = 105
        Height = 14
        Caption = 'Otra direcci'#243'n:'
        TabOrder = 2
        OnClick = rbOtraDireccionClick
      end
      inline fraDomicilio: TfraDomicilio
        Left = 4
        Top = 71
        Width = 502
        Height = 52
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ExplicitLeft = 4
        ExplicitTop = 71
        ExplicitWidth = 502
        ExplicitHeight = 52
        DesignSize = (
          502
          52)
        inherited lbNro: TLabel
          Left = 287
          ExplicitLeft = 287
        end
        inherited lbPiso: TLabel
          Left = 359
          Width = 20
          ExplicitLeft = 359
          ExplicitWidth = 20
        end
        inherited lbDto: TLabel
          Left = 435
          Width = 20
          ExplicitLeft = 435
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
          Left = 340
          Width = 44
          ExplicitLeft = 340
          ExplicitWidth = 44
        end
        inherited cmbCalle: TArtComboBox
          Width = 202
          ExplicitWidth = 202
        end
        inherited edNumero: TEdit
          Left = 309
          ExplicitLeft = 309
        end
        inherited edPiso: TEdit
          Left = 385
          ExplicitLeft = 385
        end
        inherited edDto: TEdit
          Left = 457
          ExplicitLeft = 457
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 70
          ExplicitWidth = 70
        end
        inherited edProvincia: TEdit
          Left = 389
          ExplicitLeft = 389
        end
        inherited btnBuscar: TButton
          Left = 252
          ExplicitLeft = 252
        end
      end
    end
    object gbPersonaRecibe: TGroupBox
      Left = 5
      Top = 170
      Width = 513
      Height = 61
      Caption = 'Persona que recibe'
      TabOrder = 2
      DesignSize = (
        513
        61)
      object Label20: TLabel
        Left = 86
        Top = 38
        Width = 19
        Height = 13
        Caption = 'DNI'
      end
      object Label21: TLabel
        Left = 209
        Top = 38
        Width = 84
        Height = 13
        Caption = 'Nombre y apellido'
      end
      object rbSiniestrado: TRadioButton
        Left = 12
        Top = 19
        Width = 77
        Height = 14
        Caption = 'Siniestrado'
        TabOrder = 0
        OnClick = rbSiniestradoClick
      end
      object rbOtro: TRadioButton
        Left = 12
        Top = 39
        Width = 51
        Height = 14
        Caption = 'Otro:'
        TabOrder = 1
        OnClick = rbOtroClick
      end
      object edNombreApellido: TEdit
        Left = 296
        Top = 33
        Width = 210
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 3
      end
      object edDNI: TEdit
        Left = 112
        Top = 32
        Width = 76
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 2
      end
    end
    object gbTelContacto: TGroupBox
      Left = 5
      Top = 232
      Width = 179
      Height = 42
      Caption = 'Tel'#233'fono de contacto'
      TabOrder = 3
      object edTelContacto: TEdit
        Left = 11
        Top = 15
        Width = 154
        Height = 21
        MaxLength = 20
        TabOrder = 0
      end
    end
    object btnAceptarAut: TBitBtn
      Left = 354
      Top = 274
      Width = 78
      Height = 24
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
      TabOrder = 4
      OnClick = btnAceptarAutClick
    end
    object btnCancelarAut: TBitBtn
      Left = 438
      Top = 274
      Width = 78
      Height = 24
      Caption = '&Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 5
      OnClick = btnCancelarAutClick
    end
  end
  object dsSiniestro: TDataSource
    DataSet = sdqSiniestro
    Left = 48
    Top = 136
  end
  object sdqSiniestro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT 1'
      'FROM ctj_trabajadores, sex_expedientes, ctb_Tablas '
      'WHERE tj_CUIL=ex_cuil AND '
      #9'  ex_siniestro=:pSiniestro AND '
      #9'  ex_orden=:pOrden AND '
      #9'  ex_recaida=:pRecaida AND '
      #9'  tb_Clave ='#39'SIEST'#39' AND '
      #9'  tb_Codigo=ex_Estado')
    Left = 68
    Top = 148
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pOrden'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pRecaida'
        ParamType = ptInput
      end>
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'Nro. Ev.'
        DataField = 'ER_EVENTO'
        FieldIndex = 0
      end
      item
        Title = 'C'#243'digo'
        DataField = 'ER_CODIGO'
        FieldIndex = 0
      end
      item
        Title = 'M'#243'dulo'
        DataField = 'ER_MODULO'
        FieldIndex = 0
      end
      item
        Title = 'Evento'
        DataField = 'DESCR_CODIGO'
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'ER_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'F.Citaci'#243'n'
        DataField = 'ER_FECHACONTROL1'
        FieldIndex = 0
      end
      item
        Title = 'Hora'
        DataField = 'ER_HORACITACION1'
        FieldIndex = 0
      end
      item
        Title = 'Responsable'
        DataField = 'RE_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Rehab.'
        DataField = 'ER_PLANREHABILITACION'
        FieldIndex = 0
      end
      item
        Title = 'Profesional'
        DataField = 'AU_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Ubicaci'#243'n de Incapacidad'
        DataField = 'DESCR_UBICACION'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'ER_OBSERVACIONES'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 128
    Top = 40
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16452
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
        LinkControl = tbInfoRecaidas
      end
      item
        Key = 16453
        LinkControl = tbEliminar
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16464
        LinkControl = tbImprimirSRT
      end>
    Left = 156
    Top = 40
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 103
    Top = 68
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDatosAfterScroll
    SQL.Strings = (
      
        'SELECT er_siniestro, er_orden, er_codigo, er_auditor, er_respons' +
        'able, er_evento, '
      
        '       er_fechacontrol1, er_horacitacion1, er_firma, er_codubic,' +
        ' er_evolutivo, '
      
        '       er_reca_evo, em_descripcion descr_codigo, au_auditor, au_' +
        'nombre, re_responsable, '
      
        '       re_nombre, ctb2.tb_descripcion descr_ubicacion, er_fechac' +
        'ontrol2, '
      
        '       er_horacitacion2, er_fecha, er_observaciones, em_segterre' +
        'no, em_seguimiento, '
      
        '       er_conformealta, er_conformecese, em_automatico, em_impri' +
        'mirsrt, er_capint, '
      
        '       em_telegramatrab, em_altareca, em_fechaantalta, er_usualt' +
        'a, em_responsable, '
      '       er_presupincapacidad, er_chkaviso30dias'
      
        '  FROM ser_evemedrecalif, SIN.sem_eventomedicoreca, ctb_tablas c' +
        'tb2, mau_auditores, mre_responsable'
      ' WHERE er_siniestro = :pSiniestro'
      '   AND er_orden = :pOrden'
      '   AND er_evento <> 0'
      '   AND em_codigo(+) = er_codigo'
      '   AND ctb2.tb_codigo(+) = er_codubic'
      '   AND ctb2.tb_clave(+) = '#39'CUBIC'#39
      '   AND er_auditor = au_auditor(+)'
      '   AND er_responsable = re_responsable(+)'
      '   AND er_evento > 0'
      '')
    Left = 128
    Top = 68
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pOrden'
        ParamType = ptInput
      end>
    object sdqDatosER_SINIESTRO: TFloatField
      FieldName = 'ER_SINIESTRO'
      Required = True
    end
    object sdqDatosER_ORDEN: TFloatField
      FieldName = 'ER_ORDEN'
      Required = True
    end
    object sdqDatosER_CODIGO: TStringField
      FieldName = 'ER_CODIGO'
      Size = 5
    end
    object sdqDatosER_AUDITOR: TFloatField
      FieldName = 'ER_AUDITOR'
    end
    object sdqDatosER_RESPONSABLE: TFloatField
      FieldName = 'ER_RESPONSABLE'
    end
    object sdqDatosER_EVENTO: TFloatField
      FieldName = 'ER_EVENTO'
      Required = True
    end
    object sdqDatosER_FECHA: TDateTimeField
      FieldName = 'ER_FECHA'
    end
    object sdqDatosER_OBSERVACIONES: TStringField
      FieldName = 'ER_OBSERVACIONES'
      Size = 550
    end
    object sdqDatosER_FECHACONTROL1: TDateTimeField
      FieldName = 'ER_FECHACONTROL1'
    end
    object sdqDatosER_HORACITACION1: TStringField
      FieldName = 'ER_HORACITACION1'
      Size = 5
    end
    object sdqDatosER_FIRMA: TStringField
      FieldName = 'ER_FIRMA'
      Size = 5
    end
    object sdqDatosER_CODUBIC: TStringField
      FieldName = 'ER_CODUBIC'
      Size = 10
    end
    object sdqDatosER_EVOLUTIVO: TFloatField
      FieldName = 'ER_EVOLUTIVO'
    end
    object sdqDatosER_RECA_EVO: TFloatField
      FieldName = 'ER_RECA_EVO'
    end
    object sdqDatosDESCR_CODIGO: TStringField
      FieldName = 'DESCR_CODIGO'
      Size = 150
    end
    object sdqDatosAU_AUDITOR: TFloatField
      FieldName = 'AU_AUDITOR'
    end
    object sdqDatosAU_NOMBRE: TStringField
      FieldName = 'AU_NOMBRE'
      Size = 50
    end
    object sdqDatosRE_RESPONSABLE: TFloatField
      FieldName = 'RE_RESPONSABLE'
    end
    object sdqDatosRE_NOMBRE: TStringField
      FieldName = 'RE_NOMBRE'
      Size = 50
    end
    object sdqDatosDESCR_UBICACION: TStringField
      FieldName = 'DESCR_UBICACION'
      Size = 150
    end
    object sdqDatosER_FECHACONTROL2: TDateTimeField
      FieldName = 'ER_FECHACONTROL2'
    end
    object sdqDatosER_HORACITACION2: TStringField
      FieldName = 'ER_HORACITACION2'
      Size = 5
    end
    object sdqDatosER_CONFORMEALTA: TStringField
      FieldName = 'ER_CONFORMEALTA'
      Size = 1
    end
    object sdqDatosER_CONFORMECESE: TStringField
      FieldName = 'ER_CONFORMECESE'
      Size = 1
    end
    object sdqDatosEM_SEGTERRENO: TStringField
      FieldName = 'EM_SEGTERRENO'
      Size = 1
    end
    object sdqDatosEM_SEGUIMIENTO: TStringField
      FieldName = 'EM_SEGUIMIENTO'
      Size = 1
    end
    object sdqDatosEM_AUTOMATICO: TStringField
      FieldName = 'EM_AUTOMATICO'
      Size = 1
    end
    object sdqDatosEM_IMPRIMIRSRT: TStringField
      FieldName = 'EM_IMPRIMIRSRT'
      Size = 1
    end
    object sdqDatosEM_TELEGRAMATRAB: TStringField
      FieldName = 'EM_TELEGRAMATRAB'
      Size = 1
    end
    object sdqDatosEM_ALTARECA: TStringField
      FieldName = 'EM_ALTARECA'
      Size = 1
    end
    object sdqDatosEM_FECHAANTALTA: TStringField
      FieldName = 'EM_FECHAANTALTA'
      Size = 1
    end
    object sdqDatosER_USUALTA: TStringField
      FieldName = 'ER_USUALTA'
    end
    object sdqDatosEM_RESPONSABLE: TStringField
      FieldName = 'EM_RESPONSABLE'
      Size = 1
    end
    object sdqDatosER_PRESUPINCAPACIDAD: TStringField
      FieldName = 'ER_PRESUPINCAPACIDAD'
      Size = 1
    end
    object sdqDatosER_CAPINT: TStringField
      FieldName = 'ER_CAPINT'
    end
    object sdqDatosER_CHKAVISO30DIAS: TStringField
      FieldName = 'ER_CHKAVISO30DIAS'
      Size = 1
    end
    object sdqDatoscapint: TStringField
      FieldName = 'capint'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 156
    Top = 68
  end
  object dsRecaidas: TDataSource
    DataSet = sdqRecaidas
    Left = 458
    Top = 156
  end
  object sdqRecaidas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TO_CHAR(ex_recaida) EX_RECAIDA'
      '  FROM sex_expedientes'
      ' WHERE ex_siniestro = :siniestro'
      '   AND ex_orden = :orden'
      '   AND NVL(ex_causafin, '#39' '#39') NOT IN('#39'02'#39', '#39'99'#39', '#39'95'#39')'
      '')
    Left = 430
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'siniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptInput
      end>
    object sdqRecaidasEX_RECAIDA: TStringField
      FieldName = 'EX_RECAIDA'
    end
  end
  object Seguridad: TSeguridad
    AutoEjecutar = False
    Claves = <
      item
        Name = 'IMPRIMIR_CARTA_DOC'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 104
    Top = 40
  end
  object dsBusqueda: TDataSource
    DataSet = sdqBusqueda
    Left = 52
    Top = 144
  end
  object sdqBusqueda: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT ex_id, ex_siniestro,ex_orden, ex_recaida, ex_diagnostico,'
      '       ex_estado, ex_causafin, tb_descripcion Estado,'
      '       ex_fechaaccidente, tj_Cuil,tj_Nombre, ex_Cuit, '
      
        '       ca_identificador, gp_nombre GTrabajo, lg_nombre Delegacio' +
        'n,'
      
        '       mp_calle, mp_numero, mp_piso, mp_departamento, mp_localid' +
        'ad, '
      
        '       mp_cpostal, mp_cpostala, mp_provincia, pv_descripcion Des' +
        'cProv,'
      '       mp_telefonos, ex_brevedescripcion, ud_nombre,'
      
        '       siniestro.get_usuariogestor(ex_id) usugestor, ex_contrato' +
        ', ex_pluriempleo,'
      '       tj_id'
      'FROM ctj_trabajador, sex_expedientes, cpr_prestador,'
      '     ctb_tablas, mgp_gtrabajo, dlg_delegaciones,'
      '     cmp_empresas, cpv_provincias, sin.sud_ubicaciondenuncia'
      'WHERE tj_id=ex_idtrabajador AND'
      '      mp_cuit=ex_cuit AND'
      '      mp_provincia=pv_codigo AND'
      '      ex_prestador=ca_identificador AND'
      '      ex_gtrabajo=gp_codigo AND'
      '      ex_delegacion=lg_codigo AND'
      '      tb_clave(+)='#39'SIEST'#39' AND'
      '      tb_codigo(+)=ex_estado AND'
      '      NVL(ex_causafin,'#39' '#39') NOT IN ('#39'99'#39','#39'95'#39','#39'02'#39') AND'
      '      ex_id = ud_idexpediente(+)AND'
      '      ex_siniestro= :pSiniestro AND'
      '      ex_orden= :pOrden AND'
      '      ex_recaida= :pRecaida'
      ''
      '')
    Left = 16
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pOrden'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pRecaida'
        ParamType = ptInput
      end>
    object sdqBusquedaEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqBusquedaEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqBusquedaEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqBusquedaEX_DIAGNOSTICO: TStringField
      FieldName = 'EX_DIAGNOSTICO'
      Size = 250
    end
    object sdqBusquedaEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqBusquedaTJ_CUIL: TStringField
      FieldName = 'TJ_CUIL'
      Required = True
      Size = 11
    end
    object sdqBusquedaTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqBusquedaEX_CUIT: TStringField
      FieldName = 'EX_CUIT'
      Size = 11
    end
    object sdqBusquedaCA_IDENTIFICADOR: TFloatField
      FieldName = 'CA_IDENTIFICADOR'
      Required = True
    end
    object sdqBusquedaGTRABAJO: TStringField
      FieldName = 'GTRABAJO'
      Size = 30
    end
    object sdqBusquedaDELEGACION: TStringField
      FieldName = 'DELEGACION'
      Size = 50
    end
    object sdqBusquedaEX_ESTADO: TStringField
      FieldName = 'EX_ESTADO'
      Size = 2
    end
    object sdqBusquedaEX_CAUSAFIN: TStringField
      FieldName = 'EX_CAUSAFIN'
      Size = 10
    end
    object sdqBusquedaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 150
    end
    object sdqBusquedaMP_CALLE: TStringField
      FieldName = 'MP_CALLE'
      Size = 60
    end
    object sdqBusquedaMP_NUMERO: TStringField
      FieldName = 'MP_NUMERO'
      Required = True
    end
    object sdqBusquedaMP_PISO: TStringField
      FieldName = 'MP_PISO'
    end
    object sdqBusquedaMP_DEPARTAMENTO: TStringField
      FieldName = 'MP_DEPARTAMENTO'
    end
    object sdqBusquedaMP_LOCALIDAD: TStringField
      FieldName = 'MP_LOCALIDAD'
      Size = 60
    end
    object sdqBusquedaMP_CPOSTAL: TStringField
      FieldName = 'MP_CPOSTAL'
      Size = 5
    end
    object sdqBusquedaMP_CPOSTALA: TStringField
      FieldName = 'MP_CPOSTALA'
      Size = 8
    end
    object sdqBusquedaMP_PROVINCIA: TStringField
      FieldName = 'MP_PROVINCIA'
      Size = 2
    end
    object sdqBusquedaDESCPROV: TStringField
      FieldName = 'DESCPROV'
      Size = 50
    end
    object sdqBusquedaMP_TELEFONOS: TStringField
      FieldName = 'MP_TELEFONOS'
      Size = 60
    end
    object sdqBusquedaEX_BREVEDESCRIPCION: TStringField
      FieldName = 'EX_BREVEDESCRIPCION'
      Size = 250
    end
    object sdqBusquedaUD_NOMBRE: TStringField
      FieldName = 'UD_NOMBRE'
      Size = 100
    end
    object sdqBusquedaEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
    object sdqBusquedaUSUGESTOR: TStringField
      FieldName = 'USUGESTOR'
      Size = 4000
    end
    object sdqBusquedaEX_CONTRATO: TFloatField
      FieldName = 'EX_CONTRATO'
    end
    object sdqBusquedaex_pluriempleo: TStringField
      FieldName = 'ex_pluriempleo'
    end
    object sdqBusquedaTJ_ID: TFloatField
      FieldName = 'TJ_ID'
      Required = True
    end
  end
  object dsPartes: TDataSource
    DataSet = sdqPartes
    Left = 94
    Top = 256
  end
  object sdqPartes: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT pv_recaida, pv_nroparte, pv_fechacontrol, nvl(ex_fecharec' +
        'aida, ex_fechaaccidente) fecha,'
      
        '       ex_altamedica, ca_nombrefanta, pv_observaciones, pv_diagn' +
        'osticooms'
      '  FROM spv_parteevolutivo, cpr_prestador, sex_expedientes'
      ' WHERE pv_identifprestador = ca_identificador'
      '   AND pv_idexpediente = ex_id   '
      '   AND pv_fechabaja IS NULL'
      '   AND pv_siniestro = :psiniestro'
      '   AND pv_orden = :porden'
      'ORDER BY pv_recaida, pv_nroparte')
    Left = 66
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'psiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'porden'
        ParamType = ptInput
      end>
    object sdqPartesPV_RECAIDA: TFloatField
      FieldName = 'PV_RECAIDA'
      Required = True
    end
    object sdqPartesPV_NROPARTE: TFloatField
      FieldName = 'PV_NROPARTE'
      Required = True
    end
    object sdqPartesPV_FECHACONTROL: TDateTimeField
      FieldName = 'PV_FECHACONTROL'
    end
    object sdqPartesFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object sdqPartesEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
    object sdqPartesCA_NOMBREFANTA: TStringField
      FieldName = 'CA_NOMBREFANTA'
      Size = 150
    end
    object sdqPartesPV_OBSERVACIONES: TStringField
      FieldName = 'PV_OBSERVACIONES'
      Size = 2000
    end
    object sdqPartesPV_DIAGNOSTICOOMS: TStringField
      FieldName = 'PV_DIAGNOSTICOOMS'
      Size = 10
    end
  end
  object TimerConfidencial: TTimer
    Enabled = False
    Interval = 0
    OnTimer = TimerConfidencialTimer
    Left = 184
    Top = 68
  end
  object pMenuViajar: TPopupMenu
    OnPopup = pMenuViajarPopup
    Left = 368
    Top = 167
    object mnuViajarParteEvolutivo: TMenuItem
      Caption = 'Viajar a Parte Evolutivo'
      OnClick = mnuViajarParteEvolutivoClick
    end
    object mnuViajarAutorizaciones: TMenuItem
      Caption = 'Viajar a Autorizaciones'
      OnClick = mnuViajarAutorizacionesClick
    end
  end
end
