inherited frmLiqCartasDoc: TfrmLiqCartasDoc
  Left = 291
  Top = 103
  Width = 801
  Height = 503
  Caption = 'Liquidaciones - Cartas Documento'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 801
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 793
    Height = 87
    Visible = True
    DesignSize = (
      793
      87)
    object Label5: TLabel
      Left = 481
      Top = 2
      Width = 54
      Height = 13
      Caption = 'Delegaci'#243'n'
    end
    object Label6: TLabel
      Left = 481
      Top = 46
      Width = 40
      Height = 13
      Caption = 'Firmante'
    end
    object Bevel3: TBevel
      Left = 482
      Top = 43
      Width = 308
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 600
      Top = 39
      Width = 72
      Height = 13
      Caption = ' Datos Fijos '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gbCriterioBusqueda: TGroupBox
      Left = 5
      Top = 4
      Width = 215
      Height = 77
      Caption = ' Criterio de b'#250'squeda '
      TabOrder = 0
      object rbFechaAprobacion: TRadioButton
        Left = 3
        Top = 19
        Width = 118
        Height = 17
        Caption = 'P&or Fecha de Aprob.'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbFechaAprobacionClick
      end
      object rbNroSiniestro: TRadioButton
        Left = 3
        Top = 49
        Width = 114
        Height = 17
        Caption = 'Por Nro &de Siniestro'
        TabOrder = 1
        OnClick = rbNroSiniestroClick
      end
      object Sindde: TSinEdit
        Left = 122
        Top = 47
        Width = 88
        Height = 21
        Visible = False
        TabOrder = 2
        ViewStyle = [etSiniestro]
      end
      object dcFechaAprob: TDateComboBox
        Left = 122
        Top = 17
        Width = 88
        Height = 21
        TabOrder = 3
      end
    end
    object gbFormatosCarta: TGroupBox
      Left = 222
      Top = 4
      Width = 133
      Height = 77
      Caption = 'Formatos de Cartas Doc.'
      TabOrder = 1
      object rbTransferencia: TRadioButton
        Left = 7
        Top = 24
        Width = 106
        Height = 17
        Caption = 'Por &Transferencia'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbPorCheque: TRadioButton
        Left = 7
        Top = 49
        Width = 78
        Height = 17
        Caption = 'Por &Cheque'
        TabOrder = 1
      end
    end
    inline fraDelegacion: TfraDelegacion
      Left = 481
      Top = 15
      Width = 311
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        311
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 46
        Width = 264
      end
      inherited edCodigo: TPatternEdit
        Width = 40
      end
    end
    object gbCriterios: TGroupBox
      Left = 358
      Top = 4
      Width = 120
      Height = 77
      Caption = ' Criterios de selecci'#243'n '
      TabOrder = 2
      object rbPendientes: TRadioButton
        Left = 6
        Top = 24
        Width = 99
        Height = 17
        Caption = 'S'#243'lo &pendientes'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbEnviadas: TRadioButton
        Left = 6
        Top = 49
        Width = 89
        Height = 17
        Caption = 'S'#243'lo &enviadas'
        TabOrder = 1
      end
    end
    inline fraFirmanteFijo: TfraFirmantes
      Left = 481
      Top = 60
      Width = 311
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      DesignSize = (
        311
        21)
      inherited cmbDescripcion: TArtComboBox
        Left = 46
        Width = 264
      end
      inherited edCodigo: TIntEdit
        Left = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 87
    Width = 793
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 789
      end>
    inherited ToolBar: TToolBar
      Width = 776
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Enabled = True
      end
      inherited tbEliminar: TToolButton
        Enabled = True
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmImprimir
        Enabled = True
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
        Visible = False
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 116
    Width = 793
    Height = 360
    Constraints.MinWidth = 587
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OnDblClick = tbModificarClick
    MultiSelect = True
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMLIQUI'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Liq.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_DENPAGO'
        Title.Caption = 'Concepto de pago'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n Concepto'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LE_PORCINCAPACIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Porc.Inc.'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LE_FAPROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F.Aprobaci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'le_fdisposicion'
        Title.Alignment = taCenter
        Title.Caption = 'F.Disposici'#243'n'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LE_IMPORPERI'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'le_imporcarta'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Carta'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'recibospedidos'
        Title.Alignment = taCenter
        Title.Caption = 'Recibos pedidos'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LE_SINIESTRO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LE_ORDEN'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LE_RECAIDA'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LE_NUMLIQUI'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Liq.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EX_FECHAACCIDENTE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CP_TELEGRAMA'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 104
    Top = 168
    Width = 622
    Height = 259
    Caption = 'Confirmar Datos'
    BorderStyle = bsSingle
    DesignSize = (
      622
      259)
    inherited BevelAbm: TBevel
      Top = 218
      Width = 614
    end
    object Label4: TLabel [1]
      Left = 325
      Top = 59
      Width = 55
      Height = 13
      Caption = 'Fecha disp.'
    end
    object Label7: TLabel [2]
      Left = 475
      Top = 59
      Width = 63
      Height = 13
      Caption = 'Importe Carta'
    end
    object Bevel1: TBevel [3]
      Left = 4
      Top = 42
      Width = 614
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label8: TLabel [4]
      Left = 5
      Top = 18
      Width = 18
      Height = 13
      Caption = 'Sin.'
    end
    object Label10: TLabel [5]
      Left = 137
      Top = 19
      Width = 17
      Height = 13
      Caption = 'Liq.'
    end
    object Label11: TLabel [6]
      Left = 196
      Top = 19
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    object Label9: TLabel [7]
      Left = 7
      Top = 168
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label12: TLabel [8]
      Left = 7
      Top = 192
      Width = 63
      Height = 13
      Caption = 'Ch. a nombre'
    end
    object Bevel2: TBevel [9]
      Left = 4
      Top = 7
      Width = 614
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label14: TLabel [10]
      Left = 5
      Top = 59
      Width = 40
      Height = 13
      Caption = 'Firmante'
    end
    inherited btnAceptar: TButton
      Left = 464
      Top = 226
      Height = 28
      TabOrder = 6
      Visible = False
    end
    inherited btnCancelar: TButton
      Left = 542
      Top = 226
      Height = 28
      TabOrder = 7
    end
    object dcFechaDisp: TDateComboBox
      Left = 383
      Top = 56
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object gbDirDestinatario: TGroupBox
      Left = 6
      Top = 87
      Width = 612
      Height = 72
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Direcci'#243'n destinatario'
      TabOrder = 3
      DesignSize = (
        612
        72)
      inline fraDirDestinatario: TfraDomicilio
        Left = 3
        Top = 16
        Width = 604
        Height = 51
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          604
          51)
        inherited lbNro: TLabel
          Left = 389
        end
        inherited lbPiso: TLabel
          Left = 461
        end
        inherited lbDto: TLabel
          Left = 537
        end
        inherited lbProvincia: TLabel
          Left = 442
        end
        inherited cmbCalle: TArtComboBox
          Width = 304
        end
        inherited edNumero: TEdit
          Left = 411
        end
        inherited edPiso: TEdit
          Left = 487
        end
        inherited edDto: TEdit
          Left = 559
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 172
        end
        inherited edProvincia: TEdit
          Left = 491
        end
        inherited btnBuscar: TButton
          Left = 354
        end
      end
    end
    object edImporteABM: TCurrencyEdit
      Left = 541
      Top = 56
      Width = 77
      Height = 20
      AutoSize = False
      TabOrder = 2
    end
    object edSiniestroABM: TEdit
      Left = 26
      Top = 15
      Width = 105
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 11
    end
    object edNroLiqABM: TEdit
      Left = 158
      Top = 15
      Width = 36
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 12
    end
    object edTrabajadorABM: TEdit
      Left = 252
      Top = 15
      Width = 364
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 13
    end
    object edObservaciones: TEdit
      Left = 83
      Top = 165
      Width = 533
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 250
      TabOrder = 4
    end
    object edChequeNombre: TEdit
      Left = 83
      Top = 190
      Width = 533
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 5
    end
    object btnImprimir: TBitBtn
      Left = 169
      Top = 226
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = '&Imprimir'
      TabOrder = 10
      OnClick = btnImprimirClick
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
      NumGlyphs = 2
    end
    object btnReplicar: TBitBtn
      Left = 88
      Top = 226
      Width = 75
      Height = 28
      Hint = 'Replicar Carta Documento'
      Anchors = [akLeft, akBottom]
      Caption = '&Replicar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btnReplicarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888844444444488888884FFFFFFF488888884F00000F480000004FFFFF
        FF480FFFFF4F00000F480F00004FFFFFFF480FFFFF4F00F444480F00004FFFF4
        F4880FFFFF4FFFF448880F00F044444488880FFFF0F0888888880FFFF0088888
        8888000000888888888888888888888888888888888888888888}
    end
    object btnCartaEnviada: TBitBtn
      Left = 8
      Top = 226
      Width = 75
      Height = 28
      Hint = 'Ver la C.D. enviada'
      Anchors = [akLeft, akBottom]
      Caption = '&Enviada'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnCartaEnviadaClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888800000888880000080F000888880F00080F000888880F
        0008000000080000000800F000000F00000800F000800F00000800F000800F00
        00088000000000000088880F00080F0008888800000800000888888000888000
        88888880F08880F0888888800088800088888888888888888888}
    end
    inline fraFirmanteABM: TfraFirmantes
      Left = 48
      Top = 54
      Width = 274
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        274
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 229
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      '')
    Left = 8
  end
  inherited dsConsulta: TDataSource
    Left = 36
  end
  inherited SortDialog: TSortDialog
    Left = 8
  end
  inherited ExportDialog: TExportDialog
    Left = 36
  end
  inherited QueryPrint: TQueryPrint
    Left = 36
  end
  inherited Seguridad: TSeguridad
    Left = 8
  end
  inherited FormStorage: TFormStorage
    Left = 36
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
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
      end>
    Left = 64
  end
  inherited FieldHider: TFieldHider
    Left = 64
  end
  object pmImprimir: TPopupMenu
    Left = 64
    Top = 256
    object mnuImprimir: TMenuItem
      Caption = 'Imprimir'
      OnClick = mnuImprimirClick
    end
    object mnuReimprimir: TMenuItem
      Caption = 'Reimprimir'
      Enabled = False
      OnClick = mnuImprimirClick
    end
  end
end
