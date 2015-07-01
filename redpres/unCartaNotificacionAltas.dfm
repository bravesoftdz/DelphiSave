inherited frmCartaNotificacionAltas: TfrmCartaNotificacionAltas
  Left = 461
  Top = 231
  Width = 714
  Height = 501
  Caption = 'Cartas de notificaci'#243'n de alta laboral'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 714
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 706
    Height = 160
    object pnlGTrabajo: TCheckPanel
      Left = 2
      Top = 115
      Width = 431
      Height = 42
      Caption = '&Grupo de trabajo '
      TabOrder = 5
      Checked = False
      OnChange = pnlGTrabajoChange
      AutoFocus = False
      DesignSize = (
        431
        42)
      inline fraGrupoTrabajo: TfraGrupoTrabajo
        Left = 6
        Top = 15
        Width = 421
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited lblGestor: TLabel
          Left = 250
        end
        inherited cmbGestor: TArtComboBox
          Left = 286
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 196
        end
      end
    end
    object pnlDelegacion: TCheckPanel
      Left = 436
      Top = 115
      Width = 268
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Delegaci'#243'n '
      TabOrder = 6
      Checked = False
      OnChange = pnlDelegacionChange
      AutoFocus = False
      DesignSize = (
        268
        42)
      inline fraDelegacion: TfraDelegacion
        Left = 5
        Top = 15
        Width = 259
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 48
          Width = 210
        end
        inherited edCodigo: TPatternEdit
          Width = 44
        end
      end
    end
    object pnlSiniestro: TCheckPanel
      Left = 1
      Top = 2
      Width = 155
      Height = 42
      Caption = '&Siniestro '
      TabOrder = 0
      TabStop = True
      Checked = False
      OnChange = pnlSiniestroChange
      object Label1: TLabel
        Left = 70
        Top = 20
        Width = 15
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edSiniDesde: TIntEdit
        Left = 6
        Top = 16
        Width = 63
        Height = 21
        TabOrder = 0
        Text = '0'
        MaxLength = 8
      end
      object edSiniHasta: TIntEdit
        Left = 86
        Top = 16
        Width = 63
        Height = 21
        TabOrder = 1
        Text = '0'
        MaxLength = 8
      end
    end
    object pnlFechaAlta: TCheckPanel
      Left = 158
      Top = 2
      Width = 201
      Height = 42
      Caption = '&Fecha de carga del alta'
      TabOrder = 1
      TabStop = True
      Checked = False
      OnChange = pnlFechaAltaChange
      object Label2: TLabel
        Left = 92
        Top = 20
        Width = 15
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object deFechaDesde: TDateComboBox
        Left = 4
        Top = 16
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = deFechaHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object deFechaHasta: TDateComboBox
        Left = 108
        Top = 16
        Width = 89
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = deFechaDesde
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object pnlPrestador: TCheckPanel
      Left = 1
      Top = 47
      Width = 704
      Height = 68
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Prestador '
      TabOrder = 4
      TabStop = True
      Checked = False
      OnChange = pnlPrestadorChange
      DesignSize = (
        704
        68)
      inline fraPrestador: TfraPrestador
        Left = 4
        Top = 15
        Width = 696
        Height = 49
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCPostal: TLabel
          Left = 624
        end
        inherited lbTelefono: TLabel
          Left = 536
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 241
        end
        inherited cmbPrestador: TArtComboBox
          Width = 366
        end
        inherited edPresLocalidad: TEdit
          Width = 270
        end
        inherited edPresCPostal: TEdit
          Left = 641
        end
        inherited edPresTelefono: TEdit
          Left = 556
        end
      end
    end
    object pnlEnviadas: TCheckPanel
      Left = 361
      Top = 2
      Width = 82
      Height = 42
      Caption = '&Enviadas'
      TabOrder = 2
      Checked = False
      OnChange = pnlEnviadasChange
      DesignSize = (
        82
        42)
      object cmbEnviadas: TComboBox
        Left = 6
        Top = 16
        Width = 71
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        ItemIndex = 2
        TabOrder = 0
        Text = 'Todas'
        Items.Strings = (
          'Si'
          'No'
          'Todas')
      end
    end
    object chkRegionSanitPrest: TCheckPanel
      Left = 445
      Top = 1
      Width = 259
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Region Sanitaria Prestador Cabecera'
      TabOrder = 3
      Checked = False
      OnChange = chkRegionSanitPrestChange
      DesignSize = (
        259
        43)
      inline fraRegionSanitaria: TfraCtbTablas
        Left = 6
        Top = 16
        Width = 249
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          249
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 30
          Width = 218
          DataSource = nil
        end
        inherited edCodigo: TPatternEdit
          Width = 28
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 160
    Width = 706
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 702
      end>
    inherited ToolBar: TToolBar
      Width = 689
      inherited tbImprimir: TToolButton
        DropdownMenu = MnuPrint
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
      end
      object ToolButton30: TToolButton
        Left = 385
        Top = 0
      end
      object tbTotalesRegGrilla: TToolButton
        Left = 408
        Top = 0
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 189
    Width = 706
    Height = 282
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TitleHeight = 32
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ex_siniestro'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ex_orden'
        Title.Alignment = taCenter
        Title.Caption = 'Orden'
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ex_recaida'
        Title.Alignment = taCenter
        Title.Caption = 'Recaida'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PE_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prestador'
        Title.Caption = 'Prestador cabecera'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipoegreso'
        Title.Caption = 'Tipo de Egreso'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cp_fechaimpresion'
        Title.Alignment = taCenter
        Title.Caption = 'F.Impresi'#243'n / Env'#237'o Mail'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cp_observaciones'
        Title.Caption = 'Observaciones'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTrabajo'
        Title.Caption = 'G.Trabajo'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario gestor'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Delegacion'
        Title.Caption = 'Delegaci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TipoSalidaDescr'
        Title.Caption = 'Tipo de Salida'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REGSANITPREST'
        Title.Caption = 'Reg.Sanit.Prest.Cabecera'
        Width = 180
        Visible = True
      end>
  end
  object fpEmisionCarta: TFormPanel [3]
    Left = 126
    Top = 246
    Width = 514
    Height = 214
    Caption = 'Emisi'#243'n de Carta de Rechazo para el prestador'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      514
      214)
    object Label5: TLabel
      Left = 22
      Top = 58
      Width = 48
      Height = 13
      Caption = 'Contenido'
    end
    object Label6: TLabel
      Left = 30
      Top = 36
      Width = 40
      Height = 13
      Caption = 'Firmante'
    end
    object Label7: TLabel
      Left = 5
      Top = 15
      Width = 65
      Height = 13
      Caption = 'E-mail destino'
    end
    object TxtCarta: TMemo
      Left = 74
      Top = 55
      Width = 433
      Height = 120
      Lines.Strings = (
        'TxtCarta')
      TabOrder = 2
    end
    object TxtEmail: TEdit
      Left = 74
      Top = 12
      Width = 432
      Height = 21
      TabOrder = 0
    end
    object btnImprimir: TBitBtn
      Left = 217
      Top = 183
      Width = 82
      Height = 26
      Anchors = [akLeft, akBottom]
      Caption = '&Imprimir'
      TabOrder = 3
      OnClick = EnviarImprimirClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000000000000000000000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000BFBFBF2F
        2F2F30303000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        000000000000CFCFCFBFBFBF7F7F7F0000000000004F4F4F5050500000000000
        0000FF0000FF0000FF0000FF00000000DFDFDFD0D0D07F7F7F7F7F7FBFBFBF2F
        2F2F3030300000000000005F5F5F60606000000000000000FF0000FF007F7F7F
        7F7F7FA09F9FCFCFCFBFBFBFBFBFBF2F2F2F3030304F4F4F5050500000000000
        0070707000000000FF007F7F7FA09F9FDFDFDFD0D0D0CFCFCFBFBFBFBFBFBF2F
        2F2F3030304F4F4F5050505F5F5F60606000000000000000FF007F7F7FFFFFFF
        DFDFDFD0D0D0CFCFCFBFBFBFFFFFFF2F2F2F3030304F4F4F5050505F5F5F6060
        607070707F7F7F0000007F7F7FFFFFFFDFDFDFD0D0D0FFFFFFFFFFFFBFBFBFBF
        BFBFBFBFBF4F4F4F5050505F5F5F6060607070707F7F7F0000007F7F7FFFFFFF
        FFFFFFFFFFFFD0D0D0CFCFCF2F2FFFFF00FFBFBFBFBFBFBFBFBFBF5F5F5F6060
        607070707F7F7F0000007F7F7FFFFFFFDFDFDFD0D0D090FF9000FF00D0D0D0CF
        CFCFCFCFCF7F7F7F7F7F7F000000BFBFBF7070707F7F7F00000000FF007F7F7F
        7F7F7FFFFFFFDFDFDFBFBFBFD0D0D07F7F7F7F7F7F90FFFF90FFFF000000DFDF
        DF00000000000000FF0000FF0000FF0000FF007F7F7F7F7F7FFFFFFF7F7F7F90
        FFFF90FFFF90FFFFCFFFFFCFFFFF00000000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF007F7F7F7F7F7F90FFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFF
        FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0090
        9090CFFFFFCFFFFFCFFFFFCFFFFFEFF0FFEFF0FF00000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF00909090CFFFFFEFF0FFEFF0FF9090
        9090909000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF00AFAFAFAFAFAFAFAFAF00FF0000FF0000FF0000FF00}
      Style = bsNew
    end
    object btnEnviarMail: TBitBtn
      Left = 306
      Top = 183
      Width = 82
      Height = 26
      Anchors = [akLeft, akBottom]
      Caption = '&Enviar'
      TabOrder = 4
      OnClick = EnviarImprimirClick
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
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF06EAEAEAEAEA
        EAEAEAEAEAEAEAEAEA061392F3F3F2F0F0F0F0F0F00707EF921313F392F3F2F0
        F0F0F0F0F0F00792EF1313F3F392F2F007ED92F1F1F092F0EF1313F3F3F29207
        EDF0F0EDF192F0F0EF1313F2F3F007EDF1F1F1F1EDF1BCF0EF1313F2F107EDF2
        F2F2F2F2F1EDF0F1EF1313F2F0EDF3F3F3F3F3F3F3F2EDF0071313F1EDF4F4F4
        F4F4F4F4F4F4F3EDEF1313EDFFFFFFFFFFFFFFFFFFFFFFF4ED13061313131313
        13131313131313131306FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Style = bsNew
    end
    object btnCancelar: TBitBtn
      Left = 425
      Top = 183
      Width = 82
      Height = 26
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
      OnClick = btnCancelarClick
      Glyph.Data = {
        AA030000424DAA03000000000000360000002800000011000000110000000100
        18000000000074030000C40E0000C40E0000000000000000000000FF00000060
        00006000009000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF007F7FFF00FF000000FF0000009000009000009000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        000000FF0000FF000000CF0000CF0000CF00FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF002F2FFF00FF0000FF000000FF0000FF0000FF0000
        00CF0000CF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF002F2FFF
        00FF0000FF0000FF000000FF0000FF0000FF0000FF000000CF0000CF00FF0000
        FF0000FF0000FF0000FF0000FF002F2FFF2F2FFF00FF0000FF0000FF000000FF
        0000FF0000FF0000FF0000FF002F2FFF2F2FFF00FF0000FF0000FF0000FF002F
        2FFF2F2FFF00FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF
        0000FF002F2FFF2F2FFF00FF0000FF002F2FFF2F2FFF00FF0000FF0000FF0000
        FF0000FF000000FF0000FF0000FF0000FF0000FF0000FF002F2FFF2F2FFF2F2F
        FF2F2FFF2F2FFF00FF0000FF0000FF0000FF0000FF0000FF000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF002F2FFF2F2FFF2F2FFF00FF0000FF0000FF
        0000FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF0000FF00
        2F2FFF2F2FFF2F2FFF2F2FFF2F2FFF00FF0000FF0000FF0000FF0000FF0000FF
        000000FF0000FF0000FF0000FF0000FF002F2FFF2F2FFF2F2FFF00FF0000FF00
        2F2FFF2F2FFF00FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF0000
        FF002F2FFF2F2FFF2F2FFF00FF0000FF0000FF0000FF004F4FFF4F4FFF00FF00
        00FF0000FF0000FF000000FF0000FF002F2FFF2F2FFF2F2FFF2F2FFF00FF0000
        FF0000FF0000FF0000FF0000FF006060FF6060FF00FF0000FF0000FF000000FF
        002F2FFF2F2FFF2F2FFF2F2FFF00FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF007F7FFF00FF0000FF0000FF000000FF002F2FFF2F2FFF2F2FFF00FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF009090FF00
        FF0000FF000000FF002F2FFF2F2FFF00FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF009090FF9090FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000}
      Style = bsNew
    end
    inline fraFirmantes: TfraFirmantes
      Left = 74
      Top = 34
      Width = 432
      Height = 21
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Left = 48
        Width = 384
      end
      inherited edCodigo: TIntEdit
        Width = 45
      end
    end
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
        Key = 16461
        LinkControl = tbModificar
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
        Key = 16462
        LinkControl = tbNuevo
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
  object SDQPDF: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'Select cp_siniestro Siniestro,cp_orden Orden, cp_recaida recaida' +
        ', DECODE(cp_origen,'#39'C'#39','#39'Cierre Multiple'#39','#39'S'#39','#39'Siniestros'#39', '#39'M'#39','#39 +
        'M'#233'dica'#39') Modulo,DECODE(cp_accion,'#39'R'#39','#39'Rechazo'#39','#39'A'#39','#39'Acep/Rech'#39','#39 +
        'C'#39','#39'Reversi'#243'n Rechazo'#39') Accion,cp_fechaalta F_Rechazo,ca_descrip' +
        'cion Prestador,cp_fechabaja F_Suspensi'#243'n, cp_fechaimpresion F_Im' +
        'presion, cp_observaciones Observaciones,art.amebpba.get_nombregt' +
        'rabajo(ex_gtrabajo) G_Trabajo,art.amebpba.get_nombredelegacion(e' +
        'x_siniestro,ex_orden,ex_recaida) '
      
        'from art.sex_expedientes,art.ctj_trabajadores, art.cpr_prestador' +
        ', art.cmp_empresas, art.mcp_cartarechazoprestador '
      'where ex_siniestro=cp_siniestro '
      'and ex_orden=cp_orden '
      'and ex_recaida=cp_recaida '
      'and ca_identificador=cp_prestador '
      'and ex_cuil=tj_cuil '
      'and ex_cuit=mp_cuit')
    Left = 121
    Top = 304
  end
  object MnuPrint: TPopupMenu
    Left = 81
    Top = 260
    object mnuImprimirCartaSel: TMenuItem
      Caption = 'Imprimir &carta del reg. seleccionado'
      OnClick = mnuImprimirCartaSelClick
    end
    object ImprimirCartaTodosRegistrosGrupo: TMenuItem
      Caption = 'Imprimir carta del &grupo del reg. seleccionado'
      OnClick = mnuImprimirCartaSelClick
    end
  end
end
