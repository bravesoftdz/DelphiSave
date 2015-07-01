inherited frmListPagosJudiciales: TfrmListPagosJudiciales
  Left = 522
  Top = 121
  Caption = 'Pagos Judiciales'
  ClientHeight = 706
  ClientWidth = 849
  Constraints.MinHeight = 345
  Constraints.MinWidth = 674
  OldCreateOrder = True
  Scaled = False
  ExplicitWidth = 857
  ExplicitHeight = 736
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 849
    Height = 148
    ExplicitWidth = 849
    ExplicitHeight = 148
    object gbSiniestro: TGroupBox
      Left = 1
      Top = 0
      Width = 137
      Height = 43
      Caption = ' Siniestro '
      TabOrder = 0
      TabStop = True
      object edSiniestro: TSinEdit
        Left = 7
        Top = 16
        Width = 122
        Height = 21
        TabOrder = 0
      end
    end
    object gbFechaDelCaso: TGroupBox
      Left = 141
      Top = 0
      Width = 203
      Height = 43
      Caption = ' Fecha del Caso '
      TabOrder = 1
      TabStop = True
      object Label1: TLabel
        Left = 95
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcCasoDesde: TDateComboBox
        Left = 5
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = dcCasoHasta
        TabOrder = 0
      end
      object dcCasoHasta: TDateComboBox
        Left = 109
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = dcCasoDesde
        TabOrder = 1
      end
    end
    object gbEmpresa: TGroupBox
      Left = 1
      Top = 47
      Width = 596
      Height = 43
      Caption = ' Empresa '
      TabOrder = 4
      TabStop = True
      inline fraEmpresa: TfraEmpresa
        Left = 10
        Top = 15
        Width = 578
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
        ExplicitLeft = 10
        ExplicitTop = 15
        ExplicitWidth = 578
        ExplicitHeight = 21
        inherited lbContrato: TLabel
          Left = 474
          ExplicitLeft = 474
        end
        inherited edContrato: TIntEdit
          Left = 521
          ExplicitLeft = 521
        end
        inherited cmbRSocial: TArtComboBox
          Width = 339
          ExplicitWidth = 339
        end
      end
    end
    object gbConDecision: TGroupBox
      Left = 219
      Top = 90
      Width = 238
      Height = 43
      Caption = ' Decisi'#243'n '
      TabOrder = 7
      TabStop = True
      object rbConDecision: TRadioButton
        Left = 6
        Top = 19
        Width = 83
        Height = 17
        Caption = 'Con decisi'#243'n'
        TabOrder = 0
      end
      object rbSinDecision: TRadioButton
        Left = 96
        Top = 19
        Width = 80
        Height = 17
        Caption = 'Sin decisi'#243'n'
        TabOrder = 1
      end
      object rbDecisionTodos: TRadioButton
        Left = 181
        Top = 19
        Width = 51
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 90
      Width = 74
      Height = 43
      TabOrder = 5
      TabStop = True
      object chkVencidos: TCheckBox
        Left = 6
        Top = 17
        Width = 65
        Height = 17
        Caption = 'Vencidos'
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 79
      Top = 90
      Width = 137
      Height = 43
      Caption = ' Ver Bajas '
      TabOrder = 6
      TabStop = True
      object rbSiBajas: TRadioButton
        Left = 44
        Top = 19
        Width = 35
        Height = 17
        Caption = 'S'#237
        TabOrder = 1
      end
      object rbNoBajas: TRadioButton
        Left = 5
        Top = 19
        Width = 40
        Height = 17
        Caption = 'No'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbTodosBajas: TRadioButton
        Left = 81
        Top = 19
        Width = 51
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      Left = 516
      Top = 0
      Width = 81
      Height = 43
      Caption = ' Juicio Pago '
      TabOrder = 3
      TabStop = True
      object edJuicio: TIntEdit
        Left = 7
        Top = 15
        Width = 66
        Height = 21
        TabOrder = 0
        MaxLength = 8
      end
    end
    object GroupBox4: TGroupBox
      Left = 347
      Top = 0
      Width = 167
      Height = 43
      Caption = ' Estado '
      TabOrder = 2
      TabStop = True
      inline fraEstado: TfraCodigoDescripcion
        Left = 5
        Top = 15
        Width = 159
        Height = 23
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 15
        ExplicitWidth = 159
        inherited cmbDescripcion: TArtComboBox
          Left = 36
          Width = 120
          ExplicitLeft = 36
          ExplicitWidth = 120
        end
        inherited edCodigo: TPatternEdit
          Width = 32
          ExplicitWidth = 32
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 460
      Top = 91
      Width = 137
      Height = 43
      Caption = ' Liquidados '
      TabOrder = 8
      TabStop = True
      object rbSiLiquid: TRadioButton
        Left = 44
        Top = 19
        Width = 35
        Height = 17
        Caption = 'S'#237
        TabOrder = 1
      end
      object rbNoLiquid: TRadioButton
        Left = 5
        Top = 19
        Width = 40
        Height = 17
        Caption = 'No'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbTodosLiquid: TRadioButton
        Left = 81
        Top = 19
        Width = 51
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 148
    Width = 849
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 843
      end>
    ExplicitTop = 148
    ExplicitWidth = 849
    inherited ToolBar: TToolBar
      Left = 9
      Width = 836
      ExplicitLeft = 9
      ExplicitWidth = 836
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Hint = 'Baja (Ctrl+Del)'
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited ToolButton4: TToolButton
        Width = 12
        Visible = True
        ExplicitWidth = 12
      end
      inherited tbPropiedades: TToolButton
        Left = 112
        Hint = 'Devolver a Legales'
        ImageIndex = 45
        Visible = True
        OnClick = tbPropiedadesClick
        ExplicitLeft = 112
      end
      inherited ToolButton3: TToolButton
        Left = 135
        Width = 12
        ExplicitLeft = 135
        ExplicitWidth = 12
      end
      inherited tbLimpiar: TToolButton
        Left = 147
        ExplicitLeft = 147
      end
      inherited tbOrdenar: TToolButton
        Left = 170
        ExplicitLeft = 170
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 193
        Enabled = False
        ExplicitLeft = 193
      end
      inherited ToolButton6: TToolButton
        Left = 216
        ExplicitLeft = 216
      end
      inherited tbImprimir: TToolButton
        Left = 224
        ExplicitLeft = 224
      end
      inherited tbExportar: TToolButton
        Left = 247
        ExplicitLeft = 247
      end
      inherited tbEnviarMail: TToolButton
        Left = 270
        ExplicitLeft = 270
      end
      inherited ToolButton8: TToolButton
        Left = 293
        ExplicitLeft = 293
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 301
        ExplicitLeft = 301
      end
      inherited tbMaxRegistros: TToolButton
        Left = 324
        Enabled = False
        Visible = False
        ExplicitLeft = 324
      end
      inherited ToolButton11: TToolButton
        Left = 347
        ExplicitLeft = 347
      end
      inherited tbSalir: TToolButton
        Left = 355
        Hint = ''
        Enabled = False
        Visible = False
        ExplicitLeft = 355
      end
      object tbAprobar: TToolButton
        Left = 378
        Top = 0
        Hint = 'Aprobar Instrucci'#243'n (Ctrl+A)'
        Caption = 'tbAprobar'
        ImageIndex = 13
        OnClick = tbAprobarClick
      end
      object tbCartaDocTrab: TToolButton
        Left = 401
        Top = 0
        Hint = 'Carta Documento al Trabajador'
        Caption = 'tbCartaDocTrab'
        Enabled = False
        ImageIndex = 30
        OnClick = tbCartaDocTrabClick
      end
      object ToolButton2: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 432
        Top = 0
        Caption = 'tbSalir2'
        Enabled = False
        ImageIndex = 5
        Visible = False
      end
      object tbVerArchivoAsociadoCBU: TToolButton
        Left = 455
        Top = 0
        Hint = 'Ver archivo asociado al CBU'
        Caption = 'tbVerArchivoAsociadoCBU'
        ImageIndex = 14
        OnClick = tbVerArchivoAsociadoCBUClick
      end
      object ToolButton1: TToolButton
        Left = 478
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir3: TToolButton
        Left = 486
        Top = 0
        Hint = 'Salir3'
        Caption = 'tbSalir3'
        ImageIndex = 5
        Visible = False
        OnClick = tbSalir3Click
      end
      object tbSalir4: TToolButton
        Left = 509
        Top = 0
        Hint = 'Salir4'
        Caption = 'tbSalir4'
        ImageIndex = 5
        OnClick = tbSalir4Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 177
    Width = 849
    Height = 529
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'ESTUDIOJURIDICO'
        Title.Caption = 'Estudio Jur'#237'dico'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUICIO'
        Title.Caption = 'Nro. Juicio Siniestro'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUICIO_PAGO'
        Title.Caption = 'Nro. Juicio Pago'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROMEDIACION'
        Title.Caption = 'Nro. Mediaci'#243'n'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
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
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 120
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
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 110
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
        FieldName = 'IMPORTEILP'
        Title.Caption = 'Importe ILP'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCILP'
        Title.Caption = 'Porc. ILP'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRECEPDICTAMEN'
        Title.Caption = 'Fec.Recep.Dictamen'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FCARGADICTAMEN'
        Title.Caption = 'Fec.Carga Dictamen'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DECISIONLEGALES'
        Title.Caption = 'Decisi'#243'n Legales'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMAPAGO'
        Title.Caption = 'Forma de Pago'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CBU'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PJ_ENVIOFONDOS'
        Title.Caption = 'Envio Fondos'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECIBOSA'
        Title.Caption = 'Recibos A'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUEANOMBRE'
        Title.Caption = 'Cheque a nombre'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVOBAJA'
        Title.Caption = 'Motivo baja'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENCIMIENTOLEGALES'
        Title.Caption = 'Vencimiento legales'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PJ_USUABPROBACION'
        Title.Caption = 'Usuario Aprob.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PJ_FAPROBACION'
        Title.Caption = 'F. Aprobaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PJ_FDEVOLEGALES'
        Title.Caption = 'F.Devol.Leg.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PJ_USUDEVOLEGALES'
        Title.Caption = 'Usuario Devol.Leg.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FVENCIDOAUTOMATICO'
        Title.Caption = 'F. Vencido Aut.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_FECHACHEQUE'
        Title.Caption = 'F.Cheque'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_ORDENPAGO'
        Title.Caption = 'Orden Pago'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_NUMERO'
        Title.Caption = 'Nro.Cheque'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_DEBITADO'
        Title.Caption = 'Cheque Debitado'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UBICACIONCHEQUE'
        Title.Caption = 'Ubicaci'#243'n Cheque'
        Visible = True
      end>
  end
  object ScrollBox5: TScrollBox [3]
    Left = 168
    Top = 81
    Width = 617
    Height = 1212
    TabOrder = 3
    Visible = False
    object fpModificar: TFormPanel
      Left = 4
      Top = 7
      Width = 471
      Height = 399
      Caption = 'Modificar...'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      OnBeforeShow = fpModificarBeforeShow
      DesignSize = (
        471
        399)
      object Label80: TLabel
        Left = 8
        Top = 98
        Width = 71
        Height = 13
        Caption = 'Forma de pago'
      end
      object Label75: TLabel
        Left = 8
        Top = 134
        Width = 31
        Height = 13
        Caption = 'Banco'
      end
      object Label81: TLabel
        Left = 7
        Top = 173
        Width = 79
        Height = 13
        Caption = 'Env'#237'o de fondos'
      end
      object Label28: TLabel
        Left = 7
        Top = 210
        Width = 84
        Height = 13
        Caption = 'Cheque a nombre'
      end
      object Label4: TLabel
        Left = 8
        Top = 246
        Width = 48
        Height = 13
        Caption = 'Recibos a'
      end
      object Label27: TLabel
        Left = 8
        Top = 281
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object Bevel1: TBevel
        Left = 276
        Top = 111
        Width = 2
        Height = 24
      end
      object lbDelegacion: TLabel
        Left = 9
        Top = 56
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Delegaci'#243'n'
      end
      object btnAceptarModif: TBitBtn
        Left = 308
        Top = 369
        Width = 75
        Height = 26
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
        TabOrder = 12
        OnClick = btnAceptarModifClick
      end
      object btnCancelarModif: TBitBtn
        Left = 388
        Top = 369
        Width = 75
        Height = 26
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 13
      end
      object gbPagoJudicial: TGroupBox
        Left = 6
        Top = 6
        Width = 340
        Height = 42
        Caption = ' Pago Judicial '
        TabOrder = 0
        TabStop = True
        object rbSiCorresponde: TRadioButton
          Left = 112
          Top = 17
          Width = 98
          Height = 17
          Caption = 'S'#237' Corresponde'
          TabOrder = 0
          OnClick = rbSiCorrespondeClick
        end
        object rbNoCorresponde: TRadioButton
          Left = 227
          Top = 17
          Width = 100
          Height = 17
          Caption = 'No Corresponde'
          TabOrder = 1
          OnClick = rbNoCorrespondeClick
        end
        object rbSinDecisionModif: TRadioButton
          Left = 10
          Top = 18
          Width = 98
          Height = 17
          Caption = 'Sin Decisi'#243'n'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = rbSinDecisionModifClick
        end
      end
      inline fraMetodoPago: TfraCtbTablas
        Left = 7
        Top = 111
        Width = 268
        Height = 23
        TabOrder = 3
        TabStop = True
        ExplicitLeft = 7
        ExplicitTop = 111
        ExplicitWidth = 268
        DesignSize = (
          268
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 33
          Width = 229
          ReadOnly = True
          ExplicitLeft = 33
          ExplicitWidth = 229
        end
        inherited edCodigo: TPatternEdit
          Width = 31
          ReadOnly = True
          ExplicitWidth = 31
        end
      end
      inline fraBanco: TfraCodigoDescripcion
        Left = 5
        Top = 146
        Width = 294
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        TabStop = True
        ExplicitLeft = 5
        ExplicitTop = 146
        ExplicitWidth = 294
        DesignSize = (
          294
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 36
          Width = 228
          ExplicitLeft = 36
          ExplicitWidth = 228
        end
        inherited edCodigo: TPatternEdit
          Left = 3
          Width = 32
          ExplicitLeft = 3
          ExplicitWidth = 32
        end
      end
      object edEnvioFondos: TEdit
        Left = 7
        Top = 186
        Width = 430
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        Color = 15262169
        MaxLength = 100
        ReadOnly = True
        TabOrder = 6
      end
      object btnEnvioFondos: TBitBtn
        Left = 439
        Top = 186
        Width = 24
        Height = 23
        Hint = 'Env'#237'o de fondos'
        Anchors = [akTop, akRight]
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000848404848404
          8484048484048484048484048484048484048484048484048484048484048484
          0404040404040404040484840484840484840484840484840484840484840484
          8404848404848404848404848404848404FFFFFFFFFFFF808080848404848404
          8484048484048484048484048484048484048484048484048484048484040404
          043366666699CC04040484840484840484840484840484840484840484840484
          8404848404848404848404848404FFFFFFC0C0C0C0C0C0808080848404848404
          8484048484048484048484048484048484048484048484048484040404043366
          6699CCCCC6D6EF04040484840484840484840484840484840484840484840484
          8404848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404
          8484048484048484048484048484048484048484048484040404043366666699
          CCC6D6EF04040484840484840484840484840484840484840484840484840484
          8404848404848404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404848404
          8484048484048484048484048484048484048484040404043366666699CCC6D6
          EF04040484840484840484840484840484840484840484840484840484840484
          8404848404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404848404848404
          8484048484048484048484048484048484040404043366666699CC99CCCC0404
          0484840484840484840484840484840484840484840484840484840484840484
          8404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404848404848404848404
          8484040404040404040404040404040404046699CC3399CCC6D6EF0404048484
          04848404848404848404848404848404848404FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC0C0C0C0C0C0C0C0C0808080848404848404848404848404848404848404
          040404CCCC33FFFF99CCCC33CCCC330404040404043399CC0404048484048484
          04848404848404848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C080
          8080808080C0C0C0808080848404848404848404848404848404848404040404
          CCCC33FFFF99FFFF99CCCC33CCCC33CCCC330404040404048484048484048484
          04848404848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0808080808080848404848404848404848404848404848404040404FFFFCC
          FFFFFFFFECCCFFFF99CCCC66CCCC33CCCC33CCCC330404048484048484048484
          04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0808080848404848404848404848404848404848404040404FFFF99
          FFECCCFFECCCFFFF99CCCC66CCCC33CCCC33CCCC330404048484048484048484
          04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0808080848404848404848404848404848404848404040404FFFF99
          FFFF99FFFF99FFCC66CCCC33CCCC33CC9933CC99330404048484048484048484
          04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0808080848404848404848404848404848404848404040404FFFF33
          FFCC99FFCC99FFCC66CCCC33CCCC33999933CC99330404048484048484048484
          04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0808080848404848404848404848404848404848404848404040404
          CCCC66CCCC66CCCC33CCCC33CCCC339999330404048484048484048484048484
          04848404848404848404848404808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0808080848404848404848404848404848404848404848404848404848404
          040404CCCC33CCCC33CC9933CC99330404048484048484048484048484048484
          04848404848404848404848404848404808080C0C0C0C0C0C0C0C0C0C0C0C080
          8080848404848404848404848404848404848404848404848404848404848404
          8484040404040404040404040404048484048484048484048484048484048484
          0484840484840484840484840484840484840480808080808080808080808084
          8404848404848404848404848404848404848404848404848404}
        NumGlyphs = 2
        TabOrder = 7
        OnClick = btnEnvioFondosClick
      end
      object edChequeNombre: TEdit
        Left = 7
        Top = 223
        Width = 455
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 100
        ReadOnly = True
        TabOrder = 8
      end
      object btnRecibosA: TBitBtn
        Left = 440
        Top = 258
        Width = 23
        Height = 23
        Hint = 'Direcci'#243'n para env'#237'o de recibos'
        Anchors = [akTop, akRight]
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000848404848404
          8484048484048484048484048484048484048484048484048484048484048484
          0404040404040404040484840484840484840484840484840484840484840484
          8404848404848404848404848404848404FFFFFFFFFFFF808080848404848404
          8484048484048484048484048484048484048484048484048484048484040404
          043366666699CC04040484840484840484840484840484840484840484840484
          8404848404848404848404848404FFFFFFC0C0C0C0C0C0808080848404848404
          8484048484048484048484048484048484048484048484048484040404043366
          6699CCCCC6D6EF04040484840484840484840484840484840484840484840484
          8404848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404
          8484048484048484048484048484048484048484048484040404043366666699
          CCC6D6EF04040484840484840484840484840484840484840484840484840484
          8404848404848404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404848404
          8484048484048484048484048484048484048484040404043366666699CCC6D6
          EF04040484840484840484840484840484840484840484840484840484840484
          8404848404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404848404848404
          8484048484048484048484048484048484040404043366666699CC99CCCC0404
          0484840484840484840484840484840484840484840484840484840484840484
          8404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404848404848404848404
          8484040404040404040404040404040404046699CC3399CCC6D6EF0404048484
          04848404848404848404848404848404848404FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC0C0C0C0C0C0C0C0C0808080848404848404848404848404848404848404
          040404CCCC33FFFF99CCCC33CCCC330404040404043399CC0404048484048484
          04848404848404848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C080
          8080808080C0C0C0808080848404848404848404848404848404848404040404
          CCCC33FFFF99FFFF99CCCC33CCCC33CCCC330404040404048484048484048484
          04848404848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0808080808080848404848404848404848404848404848404040404FFFFCC
          FFFFFFFFECCCFFFF99CCCC66CCCC33CCCC33CCCC330404048484048484048484
          04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0808080848404848404848404848404848404848404040404FFFF99
          FFECCCFFECCCFFFF99CCCC66CCCC33CCCC33CCCC330404048484048484048484
          04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0808080848404848404848404848404848404848404040404FFFF99
          FFFF99FFFF99FFCC66CCCC33CCCC33CC9933CC99330404048484048484048484
          04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0808080848404848404848404848404848404848404040404FFFF33
          FFCC99FFCC99FFCC66CCCC33CCCC33999933CC99330404048484048484048484
          04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0808080848404848404848404848404848404848404848404040404
          CCCC66CCCC66CCCC33CCCC33CCCC339999330404048484048484048484048484
          04848404848404848404848404808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0808080848404848404848404848404848404848404848404848404848404
          040404CCCC33CCCC33CC9933CC99330404048484048484048484048484048484
          04848404848404848404848404848404808080C0C0C0C0C0C0C0C0C0C0C0C080
          8080848404848404848404848404848404848404848404848404848404848404
          8484040404040404040404040404048484048484048484048484048484048484
          0484840484840484840484840484840484840480808080808080808080808084
          8404848404848404848404848404848404848404848404848404}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = btnRecibosAClick
      end
      object edRecibosA: TMemo
        Left = 7
        Top = 259
        Width = 431
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = 15262169
        MaxLength = 250
        ReadOnly = True
        TabOrder = 9
      end
      object edObservaciones: TMemo
        Left = 7
        Top = 295
        Width = 455
        Height = 68
        Anchors = [akLeft, akTop, akRight, akBottom]
        MaxLength = 250
        TabOrder = 11
      end
      object btnCBU: TBitBtn
        Left = 286
        Top = 111
        Width = 38
        Height = 23
        Hint = 'Completar CBU...'
        Anchors = [akTop, akRight]
        Caption = 'CBU'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Albertus MT Lt'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btnCBUClick
      end
      object gbJuicios: TGroupBox
        Left = 348
        Top = 6
        Width = 118
        Height = 42
        Caption = ' ID Juicios '
        TabOrder = 1
        TabStop = True
        object cmbIdJuicios: TArtComboBox
          Left = 8
          Top = 15
          Width = 103
          Height = 21
          CharCase = ecUpperCase
          DirectInput = False
          GlyphKind = gkDropDown
          NumGlyphs = 1
          TabOrder = 0
          Columns = <
            item
              Expanded = False
              FieldName = 'JUICIO'
              ReadOnly = True
              Title.Caption = 'Juicios'
              Visible = True
            end>
          DataSource = dsIdJuicios
          FieldList = 'JUICIO'
          FieldKey = 'JUICIO'
        end
      end
      inline fraDelegacionPJ: TfraDelegacion
        Left = 8
        Top = 70
        Width = 277
        Height = 23
        TabOrder = 2
        TabStop = True
        ExplicitLeft = 8
        ExplicitTop = 70
        ExplicitWidth = 277
        DesignSize = (
          277
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 36
          Width = 224
          Color = 15262169
          ReadOnly = True
          ExplicitLeft = 36
          ExplicitWidth = 224
        end
        inherited edCodigo: TPatternEdit
          Left = 1
          Width = 33
          Color = 15262169
          ReadOnly = True
          ExplicitLeft = 1
          ExplicitWidth = 33
        end
      end
    end
    object fpEnvioFondos: TFormPanel
      Left = 4
      Top = 415
      Width = 424
      Height = 184
      Caption = 'Selecci'#243'n de lugar de env'#237'o de fondos'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpEnvioFondosBeforeShow
      DesignSize = (
        424
        184)
      object gbEnvioFondos: TGroupBox
        Left = 6
        Top = 3
        Width = 412
        Height = 144
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        DesignSize = (
          412
          144)
        object Label83: TLabel
          Left = 26
          Top = 65
          Width = 41
          Height = 13
          Caption = 'Sucursal'
        end
        object rbBancoFondos: TRadioButton
          Left = 4
          Top = 39
          Width = 74
          Height = 17
          Caption = 'Banco'
          TabOrder = 1
          OnClick = rbBancoFondosClick
        end
        object rbDelegacionFondos: TRadioButton
          Left = 4
          Top = 90
          Width = 74
          Height = 17
          Caption = 'Delegaci'#243'n'
          TabOrder = 4
          OnClick = rbDelegacionFondosClick
        end
        object rbCentralFondos: TRadioButton
          Left = 4
          Top = 118
          Width = 85
          Height = 17
          Caption = 'Casa Central'
          TabOrder = 6
          OnClick = rbCentralFondosClick
        end
        inline fraDelegacionFondos: TfraDelegacion
          Left = 80
          Top = 87
          Width = 329
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          ExplicitLeft = 80
          ExplicitTop = 87
          ExplicitWidth = 329
          DesignSize = (
            329
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 264
            DataSource = nil
            ExplicitWidth = 264
          end
        end
        inline fraBancoFondos: TfraCodigoDescripcion
          Left = 80
          Top = 36
          Width = 329
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ExplicitLeft = 80
          ExplicitTop = 36
          ExplicitWidth = 329
          DesignSize = (
            329
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 264
            DataSource = nil
            ExplicitWidth = 264
          end
        end
        inline fraSucursalFondos: TfraCodigoDescripcion
          Left = 80
          Top = 61
          Width = 329
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          ExplicitLeft = 80
          ExplicitTop = 61
          ExplicitWidth = 329
          DesignSize = (
            329
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 264
            DataSource = nil
            ExplicitWidth = 264
          end
        end
        object rbNingunoFondos: TRadioButton
          Left = 4
          Top = 14
          Width = 65
          Height = 17
          Caption = 'Ninguno'
          TabOrder = 0
          OnClick = rbNingunoFondosClick
        end
      end
      object btnCancelarFondos: TBitBtn
        Left = 341
        Top = 152
        Width = 75
        Height = 26
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 2
      end
      object btnAceptarFondos: TBitBtn
        Left = 259
        Top = 152
        Width = 75
        Height = 26
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
        TabOrder = 1
        OnClick = btnAceptarFondosClick
      end
    end
    object fpDomicilioRecibos: TFormPanel
      Left = 3
      Top = 607
      Width = 578
      Height = 165
      Caption = 'Direcci'#243'n para env'#237'o de recibos'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpDomicilioRecibosBeforeShow
      DesignSize = (
        578
        165)
      object btnCancelarDomRecibo: TBitBtn
        Left = 501
        Top = 136
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Cancelar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 2
      end
      object btnAceptarDomRecibo: TBitBtn
        Left = 419
        Top = 136
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Aceptar'
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
        OnClick = btnAceptarDomReciboClick
      end
      object pnlDomicilio: TPanel
        Left = 4
        Top = 11
        Width = 570
        Height = 68
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 0
        TabStop = True
        inline fraDomicilioRecibos: TfraDomicilio
          Left = 4
          Top = 13
          Width = 561
          Height = 51
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          ExplicitLeft = 4
          ExplicitTop = 13
          ExplicitWidth = 561
          inherited lbNro: TLabel
            Left = 346
            ExplicitLeft = 346
          end
          inherited lbPiso: TLabel
            Left = 418
            Width = 20
            ExplicitLeft = 418
            ExplicitWidth = 20
          end
          inherited lbDto: TLabel
            Left = 494
            Width = 20
            ExplicitLeft = 494
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
            Left = 399
            Width = 44
            ExplicitLeft = 399
            ExplicitWidth = 44
          end
          inherited cmbCalle: TArtComboBox
            Width = 261
            ExplicitWidth = 261
          end
          inherited edNumero: TEdit
            Left = 368
            ExplicitLeft = 368
          end
          inherited edPiso: TEdit
            Left = 444
            ExplicitLeft = 444
          end
          inherited edDto: TEdit
            Left = 516
            ExplicitLeft = 516
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 129
            ExplicitWidth = 129
          end
          inherited edProvincia: TEdit
            Left = 448
            ExplicitLeft = 448
          end
          inherited btnBuscar: TButton
            Left = 311
            ExplicitLeft = 311
          end
        end
      end
      object rbDomicilio_Recibos: TRadioButton
        Left = 12
        Top = 4
        Width = 62
        Height = 17
        Caption = 'Domicilio'
        TabOrder = 3
        OnClick = rbDomicilio_RecibosClick
      end
      object Panel1: TPanel
        Left = 4
        Top = 91
        Width = 570
        Height = 41
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 4
        TabStop = True
        object MemoOtroRecibos: TMemo
          Left = 7
          Top = 11
          Width = 557
          Height = 23
          MaxLength = 250
          TabOrder = 0
        end
      end
      object rbOtro_Recibos: TRadioButton
        Left = 13
        Top = 84
        Width = 42
        Height = 16
        Caption = 'Otro'
        TabOrder = 5
        OnClick = rbOtro_RecibosClick
      end
    end
    object fpCBU: TFormPanel
      Left = 3
      Top = 785
      Width = 461
      Height = 230
      Caption = 'CBU'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      Position = poOwnerFormCenter
      OnBeforeShow = fpCBUBeforeShow
      DesignSize = (
        461
        230)
      object Label5: TLabel
        Left = 6
        Top = 17
        Width = 46
        Height = 13
        Caption = 'Juzgado: '
      end
      object Label10: TLabel
        Left = 6
        Top = 42
        Width = 54
        Height = 13
        Caption = 'Secretaria: '
      end
      object Label11: TLabel
        Left = 6
        Top = 65
        Width = 56
        Height = 13
        Caption = 'Expediente:'
      end
      object Label12: TLabel
        Left = 6
        Top = 90
        Width = 30
        Height = 13
        Caption = 'Fuero:'
      end
      object Label13: TLabel
        Left = 6
        Top = 116
        Width = 45
        Height = 13
        Caption = 'Caratula: '
      end
      object Label14: TLabel
        Left = 6
        Top = 143
        Width = 25
        Height = 13
        Caption = 'CBU:'
      end
      object Bevel2: TBevel
        Left = 299
        Top = 197
        Width = 2
        Height = 24
      end
      object Label6: TLabel
        Left = 7
        Top = 168
        Width = 36
        Height = 13
        Caption = 'Archivo'
      end
      object tbSeleccionArchivoAsociar: TSpeedButton
        Left = 411
        Top = 161
        Width = 22
        Height = 23
        Hint = 'Asociar Archivo...'
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = tbSeleccionArchivoAsociarClick
      end
      object Bevel3: TBevel
        Left = 5
        Top = 191
        Width = 451
        Height = 2
      end
      object edCBU1: TIntEdit
        Left = 63
        Top = 136
        Width = 67
        Height = 21
        TabOrder = 5
        MaxLength = 8
      end
      object edJuzgado: TEdit
        Left = 63
        Top = 11
        Width = 143
        Height = 21
        MaxLength = 20
        TabOrder = 0
      end
      object edSecretaria: TEdit
        Left = 63
        Top = 36
        Width = 143
        Height = 21
        MaxLength = 250
        TabOrder = 1
      end
      object edExpediente: TEdit
        Left = 63
        Top = 61
        Width = 73
        Height = 21
        MaxLength = 10
        TabOrder = 2
      end
      object edFuero: TEdit
        Left = 63
        Top = 86
        Width = 345
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 76
        TabOrder = 3
      end
      object edCaratula: TEdit
        Left = 63
        Top = 111
        Width = 345
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 76
        TabOrder = 4
      end
      object edCBU2: TPatternEdit
        Left = 137
        Top = 136
        Width = 121
        Height = 21
        MaxLength = 14
        TabOrder = 6
        Pattern = '0123456789'
      end
      object btnAceptarCBU: TBitBtn
        Left = 307
        Top = 197
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Aceptar'
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
        TabOrder = 8
        OnClick = btnAceptarCBUClick
      end
      object btnCancelarCBU: TBitBtn
        Left = 385
        Top = 197
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Cancelar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 9
      end
      object ToolBar1: TToolBar
        Left = 268
        Top = 197
        Width = 29
        Height = 26
        Align = alNone
        BorderWidth = 1
        Caption = 'ToolBar'
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        object tbLimpiarCBU: TToolButton
          Left = 0
          Top = 0
          Hint = 'Limpiar'
          Caption = 'Limpiar'
          ImageIndex = 1
          OnClick = btnLimpiarCBUClick
        end
      end
      object edArchivoAsociado: TEdit
        Left = 63
        Top = 162
        Width = 345
        Height = 21
        Color = 15262169
        ReadOnly = True
        TabOrder = 7
      end
      object ToolBar2: TToolBar
        Left = 433
        Top = 160
        Width = 27
        Height = 26
        Align = alNone
        BorderWidth = 1
        Caption = 'ToolBar'
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        object tbLimpiarArchivo: TToolButton
          Left = 0
          Top = 0
          Hint = 'Limpiar archivo asociado'
          Caption = 'Limpiar'
          ImageIndex = 1
          OnClick = tbLimpiarArchivoClick
        end
      end
    end
    object fpMotivoBaja: TFormPanel
      Left = 3
      Top = 1024
      Width = 372
      Height = 73
      Caption = 'Motivo de Baja'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      Position = poOwnerFormCenter
      OnBeforeShow = fpMotivoBajaBeforeShow
      DesignSize = (
        372
        73)
      object Label3: TLabel
        Left = 8
        Top = 17
        Width = 35
        Height = 13
        Caption = 'Motivo:'
      end
      object btnAceptarMotBaja: TBitBtn
        Left = 211
        Top = 43
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Aceptar'
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
        TabOrder = 0
        OnClick = btnAceptarMotBajaClick
      end
      object btnCancelarMotBaja: TBitBtn
        Left = 291
        Top = 43
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Cancelar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
      end
      inline fraMotivoBaja: TfraCodigoDescripcion
        Left = 44
        Top = 11
        Width = 323
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        TabStop = True
        ExplicitLeft = 44
        ExplicitTop = 11
        ExplicitWidth = 323
        DesignSize = (
          323
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 36
          Width = 283
          ExplicitLeft = 36
          ExplicitWidth = 283
        end
        inherited edCodigo: TPatternEdit
          Left = 3
          Width = 32
          ExplicitLeft = 3
          ExplicitWidth = 32
        end
      end
    end
    object fpFirmanteCartaDoc: TFormPanel
      Left = 3
      Top = 1104
      Width = 372
      Height = 73
      Caption = 'Seleccione un firmante para la carta:'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      Position = poOwnerFormCenter
      OnBeforeShow = fpFirmanteCartaDocBeforeShow
      DesignSize = (
        372
        73)
      object Label2: TLabel
        Left = 6
        Top = 17
        Width = 40
        Height = 13
        Caption = 'Firmante'
      end
      object btnAceptarFirmante: TBitBtn
        Left = 211
        Top = 43
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Aceptar'
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
        TabOrder = 0
        OnClick = btnAceptarFirmanteClick
      end
      object BitBtn2: TBitBtn
        Left = 291
        Top = 43
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Cancelar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
      end
      inline fraFirmantes: TfraFirmantes
        Left = 52
        Top = 13
        Width = 313
        Height = 21
        TabOrder = 2
        ExplicitLeft = 52
        ExplicitTop = 13
        ExplicitWidth = 313
        inherited cmbDescripcion: TArtComboBox
          Left = 55
          Width = 256
          ExplicitLeft = 55
          ExplicitWidth = 256
        end
        inherited edCodigo: TIntEdit
          Width = 53
          ExplicitWidth = 53
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Estudio Jur'#237'dico'
        DataField = 'ESTUDIOJURIDICO'
        Width = 480
        MaxLength = 0
      end
      item
        Title = 'Nro.Juicio Sin.'
        DataField = 'JUICIO'
        Width = 230
        MaxLength = 0
      end
      item
        Title = 'Nro.Mediaci'#243'n'
        DataField = 'NROMEDIACION'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Cuit'
        DataField = 'CUIT'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Empresa'
        DataField = 'EMPRESA'
        Width = 450
        MaxLength = 0
      end
      item
        Title = 'Cuil'
        DataField = 'CUIL'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Trabajador'
        DataField = 'TRABAJADOR'
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'Importe ILP'
        DataField = 'IMPORTEILP'
        Width = 220
        MaxLength = 0
      end
      item
        Title = 'Porc. ILP'
        DataField = 'PORCILP'
        Width = 160
        MaxLength = 0
      end
      item
        Title = 'Fec.Recep.Dict.'
        DataField = 'FRecepDictamen'
        Width = 260
        MaxLength = 0
      end
      item
        Title = 'Fec.Carga Dict.'
        DataField = 'FCargaDictamen'
        Width = 260
        MaxLength = 0
      end
      item
        Title = 'Decisi'#243'n Leg.'
        DataField = 'DecisionLegales'
        Width = 250
        MaxLength = 0
      end>
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'VerTodosBancos'
      end>
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16467
        LinkControl = tbSalir4
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16449
        LinkControl = tbAprobar
      end>
  end
  object dsIdJuicios: TDataSource
    DataSet = sdqIdJuicios
    Left = 672
    Top = 52
  end
  object sdqIdJuicios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    Left = 644
    Top = 52
  end
  object OpenDialog_AsocArch: TOpenDialog
    Left = 23
    Top = 312
  end
end
