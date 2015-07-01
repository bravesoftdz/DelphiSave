inherited frmPuestaDisposicion: TfrmPuestaDisposicion
  Left = 358
  Top = 170
  Caption = 'CD puesta a disposici'#243'n'
  ClientHeight = 409
  ClientWidth = 804
  OldCreateOrder = True
  ExplicitLeft = 358
  ExplicitTop = 170
  ExplicitWidth = 812
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TArtDBGrid [0]
    Left = 0
    Top = 156
    Width = 804
    Height = 253
    Align = alClient
    DataSource = dsConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnKeyDown = GridKeyDown
    IniStorage = FormStorage
    OnGetCellParams = GridGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Caption = '.'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'siniestro'
        Title.Caption = 'Siniestro'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nroliq'
        Title.Caption = 'Nro. Liq.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'faccid'
        Title.Caption = 'F. accidente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cuil'
        Title.Caption = 'CUIL'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'trabajador'
        Title.Caption = 'Trabajador'
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'contrato'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cuit'
        Title.Caption = 'CUIT'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'empresa'
        Title.Caption = 'Empresa'
        Width = 314
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'faprob'
        Title.Caption = 'F. Aprob'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cp_conpago'
        Title.Caption = 'Conpago'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'conpago'
        Title.Caption = 'Conc. pago'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'importe'
        Title.Caption = 'Importe'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fdesde'
        Title.Caption = 'F. desde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fhasta'
        Title.Caption = 'F. hasta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fvencimiento'
        Title.Caption = 'F. vencimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dompostal'
        Title.Caption = 'Domicilio'
        Width = 356
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codcarta'
        Title.Caption = 'Cod. carta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fimpresion'
        Title.Caption = 'F. impresi'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'facuse'
        Title.Caption = 'F. acuse'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estadoacuse'
        Title.Caption = 'Estado acuse'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nrocarta'
        Title.Caption = 'Nro. carta'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'firmante'
        Title.Caption = 'Firmante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ce_beneficiario'
        Title.Caption = 'Beneficiario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'grupofam'
        Title.Caption = 'Grupo Fam.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cp_fechabaja'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mp_descripcion'
        Title.Caption = 'Motivo Baja'
        Width = 120
        Visible = True
      end>
  end
  object pnlTop: TPanel [1]
    Left = 0
    Top = 0
    Width = 804
    Height = 126
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 795
    DesignSize = (
      804
      126)
    object Label9: TLabel
      Left = 266
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label10: TLabel
      Left = 420
      Top = 12
      Width = 51
      Height = 13
      Caption = 'Estado CD'
    end
    object Label11: TLabel
      Left = 523
      Top = 12
      Width = 38
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nro. CD'
      ExplicitLeft = 514
    end
    object gbFAprobLiq: TGroupBox
      Left = 2
      Top = 0
      Width = 257
      Height = 32
      TabOrder = 0
      object Label1: TLabel
        Left = 153
        Top = 12
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
      object Label3: TLabel
        Left = 5
        Top = 12
        Width = 58
        Height = 13
        Caption = 'F. aprob. liq.'
      end
      object deFechaAprobLiqDesde: TDateComboBox
        Left = 67
        Top = 8
        Width = 84
        Height = 21
        MaxDateCombo = deFechaAprobLiqHasta
        TabOrder = 0
      end
      object deFechaAprobLiqHasta: TDateComboBox
        Left = 168
        Top = 8
        Width = 84
        Height = 21
        MinDateCombo = deFechaAprobLiqDesde
        TabOrder = 1
      end
    end
    object gbFImpCD: TGroupBox
      Left = 2
      Top = 31
      Width = 257
      Height = 32
      TabOrder = 1
      object Label2: TLabel
        Left = 153
        Top = 12
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
      object Label4: TLabel
        Left = 5
        Top = 12
        Width = 49
        Height = 13
        Caption = 'F. imp. CD'
      end
      object deFechaImpCDDesde: TDateComboBox
        Left = 67
        Top = 8
        Width = 84
        Height = 21
        MaxDateCombo = deFechaImpCDHasta
        TabOrder = 0
      end
      object deFechaImpCDHasta: TDateComboBox
        Left = 168
        Top = 8
        Width = 84
        Height = 21
        MinDateCombo = deFechaImpCDDesde
        TabOrder = 1
      end
    end
    object gbFGenCD: TGroupBox
      Left = 2
      Top = 62
      Width = 257
      Height = 32
      TabOrder = 2
      object Label5: TLabel
        Left = 153
        Top = 12
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
      object Label6: TLabel
        Left = 5
        Top = 12
        Width = 51
        Height = 13
        Caption = 'F. gen. CD'
      end
      object deFechaGenCDDesde: TDateComboBox
        Left = 67
        Top = 8
        Width = 84
        Height = 21
        MaxDateCombo = deFechaGenCDHasta
        TabOrder = 0
      end
      object deFechaGenCDHasta: TDateComboBox
        Left = 168
        Top = 8
        Width = 84
        Height = 21
        MinDateCombo = deFechaGenCDDesde
        TabOrder = 1
      end
    end
    object gbEmpresa: TGroupBox
      Left = 261
      Top = 62
      Width = 540
      Height = 32
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitWidth = 531
      DesignSize = (
        540
        32)
      object Label7: TLabel
        Left = 5
        Top = 11
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      inline fraEmpresa: TfraEmpresa
        Left = 53
        Top = 8
        Width = 485
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 53
        ExplicitTop = 8
        ExplicitWidth = 476
        ExplicitHeight = 21
        DesignSize = (
          485
          21)
        inherited lbContrato: TLabel
          Left = 381
          ExplicitLeft = 372
        end
        inherited edContrato: TIntEdit
          Left = 428
          Width = 53
          ExplicitLeft = 419
          ExplicitWidth = 53
        end
        inherited cmbRSocial: TArtComboBox
          Left = 128
          Width = 246
          Text = '|'
          DataSource = nil
          ExplicitLeft = 128
          ExplicitWidth = 237
        end
      end
    end
    object gbTrabajador: TGroupBox
      Left = 261
      Top = 31
      Width = 262
      Height = 32
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ExplicitWidth = 253
      DesignSize = (
        262
        32)
      object Label8: TLabel
        Left = 5
        Top = 12
        Width = 51
        Height = 13
        Caption = 'Trabajador'
      end
      inline fraTrabajador: TfraTrabajador
        Left = 61
        Top = 8
        Width = 197
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 61
        ExplicitTop = 8
        ExplicitWidth = 188
        ExplicitHeight = 21
        DesignSize = (
          197
          21)
        inherited cmbNombre: TArtComboBox
          Width = 113
          DataSource = nil
          ExplicitWidth = 104
        end
      end
    end
    object edSiniestro: TSinEdit
      Left = 312
      Top = 8
      Width = 100
      Height = 21
      Hint = 'C'#243'digo de Siniestro'
      TabOrder = 5
    end
    object edNroCartaDoc: TMaskEdit
      Left = 565
      Top = 8
      Width = 91
      Height = 21
      Anchors = [akTop, akRight]
      EditMask = '9999-99-9999999;0;_'
      MaxLength = 15
      TabOrder = 6
      Text = '3779'
      ExplicitLeft = 556
    end
    object gbGPBA: TGroupBox
      Left = 660
      Top = 0
      Width = 142
      Height = 32
      Anchors = [akTop, akRight]
      Caption = 'GPBA'
      TabOrder = 7
      ExplicitLeft = 651
      object rbGPBASi: TRadioButton
        Left = 6
        Top = 12
        Width = 33
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbGPBANo: TRadioButton
        Left = 44
        Top = 12
        Width = 33
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbGPBATodos: TRadioButton
        Left = 88
        Top = 12
        Width = 52
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object gbRecepcionOK: TGroupBox
      Left = 227
      Top = 93
      Width = 206
      Height = 32
      Caption = 'Recepci'#243'n OK'
      TabOrder = 8
      object rbRecSi: TRadioButton
        Left = 6
        Top = 12
        Width = 33
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbRecNo: TRadioButton
        Left = 47
        Top = 12
        Width = 33
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbRecTodos: TRadioButton
        Left = 148
        Top = 12
        Width = 52
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object rbSinAc: TRadioButton
        Left = 89
        Top = 12
        Width = 52
        Height = 17
        Caption = 'Sin ac.'
        TabOrder = 2
      end
    end
    object gbFirmante: TGroupBox
      Left = 524
      Top = 31
      Width = 278
      Height = 32
      Anchors = [akTop, akRight]
      TabOrder = 9
      ExplicitLeft = 515
      DesignSize = (
        278
        32)
      object Label12: TLabel
        Left = 5
        Top = 12
        Width = 40
        Height = 13
        Caption = 'Firmante'
      end
      inline fraFirmantesFiltro: TfraFirmantes
        Left = 50
        Top = 8
        Width = 225
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 50
        ExplicitTop = 8
        ExplicitWidth = 225
        DesignSize = (
          225
          21)
        inherited cmbDescripcion: TArtComboBox
          Width = 181
          ExplicitWidth = 181
        end
      end
    end
    object cbEstadoCD: TComboBox
      Left = 475
      Top = 8
      Width = 43
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemIndex = 0
      TabOrder = 10
      Items.Strings = (
        ''
        'Vencida'
        'Pendiente'
        'Generada'
        'Impresa')
      ExplicitWidth = 34
    end
    object gbTipoLiq: TGroupBox
      Left = 2
      Top = 93
      Width = 223
      Height = 32
      Caption = 'Tipo Liq.'
      TabOrder = 11
      object cbILP: TCheckBox
        Left = 8
        Top = 12
        Width = 41
        Height = 17
        Caption = 'ILP'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbILT: TCheckBox
        Left = 57
        Top = 12
        Width = 36
        Height = 17
        Caption = 'ILT'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cbOP: TCheckBox
        Left = 105
        Top = 12
        Width = 41
        Height = 17
        Caption = 'OP'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object cbMort: TCheckBox
        Left = 155
        Top = 12
        Width = 62
        Height = 17
        Caption = 'Mortales'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
    end
    object rgBajas: TRadioGroup
      Left = 436
      Top = 93
      Width = 164
      Height = 32
      Caption = 'Ver Bajas'
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 12
    end
  end
  object CoolBar: TCoolBar [2]
    Left = 0
    Top = 126
    Width = 804
    Height = 30
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 798
      end>
    ExplicitWidth = 795
    object ToolBar: TToolBar
      Left = 11
      Top = 0
      Width = 789
      Height = 27
      Align = alClient
      Caption = 'ToolBar'
      DisabledImages = frmPrincipal.ilByN
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Transparent = False
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'tbRefrescar'
        ImageIndex = 0
        OnClick = tbRefrescarClick
      end
      object tbSeparador3: TToolButton
        Left = 23
        Top = 0
        Width = 3
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbNuevo: TToolButton
        Left = 26
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        Caption = 'tbNuevo'
        DropdownMenu = pmNuevo
        ImageIndex = 6
        Style = tbsDropDown
      end
      object tbModificar: TToolButton
        Left = 64
        Top = 0
        Hint = 'Modificar (Ctrl+M)'
        Caption = 'tbModificar'
        ImageIndex = 7
        OnClick = tbModificarClick
      end
      object tbEliminar: TToolButton
        Left = 87
        Top = 0
        Hint = 'Eliminar (Ctrl+Del)'
        Caption = 'tbEliminar'
        ImageIndex = 8
        OnClick = tbEliminarClick
      end
      object ToolButton5: TToolButton
        Left = 110
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbGenerarCD: TToolButton
        Left = 118
        Top = 0
        Hint = 'Generar CD (Ctrl+G)'
        Caption = 'Generar CD'
        ImageIndex = 3
        OnClick = tbGenerarCDClick
      end
      object ToolButton4: TToolButton
        Left = 141
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 149
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object tbOrdenar: TToolButton
        Left = 172
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        Caption = 'tbOrdenar'
        ImageIndex = 2
        OnClick = tbOrdenarClick
      end
      object tbImprimir: TToolButton
        Left = 195
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        ImageIndex = 4
        OnClick = tbImprimirClick
      end
      object tbExportar: TToolButton
        Left = 218
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        ImageIndex = 3
        OnClick = tbExportarClick
      end
      object ToolButton2: TToolButton
        Left = 241
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 249
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object fpFirmantes: TFormPanel [3]
    Left = 181
    Top = 244
    Width = 388
    Height = 109
    Caption = 'Generar CD'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnShow = fpFirmantesShow
    DesignSize = (
      388
      109)
    object BevelAbm: TBevel
      Left = 4
      Top = 71
      Width = 380
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label13: TLabel
      Left = 12
      Top = 19
      Width = 40
      Height = 13
      Caption = 'Firmante'
    end
    object btnAceptar: TButton
      Left = 230
      Top = 77
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 308
      Top = 77
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraFirmantesfp: TfraFirmantes
      Left = 60
      Top = 15
      Width = 318
      Height = 21
      TabOrder = 2
      ExplicitLeft = 60
      ExplicitTop = 15
      ExplicitWidth = 318
      DesignSize = (
        318
        21)
      inherited cmbDescripcion: TArtComboBox
        Width = 274
        ExplicitWidth = 274
      end
    end
    object chkUltimoPago: TCheckBox
      Left = 12
      Top = 46
      Width = 97
      Height = 17
      Caption = #218'ltimo Pago'
      TabOrder = 3
    end
  end
  object fpBaja: TFormPanel [4]
    Left = 239
    Top = 169
    Width = 388
    Height = 96
    Caption = 'Baja de caso'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnShow = fpBajaShow
    DesignSize = (
      388
      96)
    object Bevel1: TBevel
      Left = 4
      Top = 58
      Width = 380
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label14: TLabel
      Left = 12
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object btnAceptarBaja: TButton
      Left = 230
      Top = 64
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarBajaClick
    end
    object btnCancelarBaja: TButton
      Left = 308
      Top = 64
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraMotBaja: TfraCodigoDescripcion
      Left = 49
      Top = 14
      Width = 329
      Height = 25
      TabOrder = 2
      ExplicitLeft = 49
      ExplicitTop = 14
      ExplicitWidth = 329
      ExplicitHeight = 25
      DesignSize = (
        329
        25)
      inherited cmbDescripcion: TArtComboBox
        Width = 264
        ExplicitWidth = 264
      end
    end
  end
  inherited FormStorage: TFormStorage
    Left = 16
    Top = 220
  end
  inherited XPMenu: TXPMenu
    Left = 44
    Top = 220
  end
  inherited ilByN: TImageList
    Left = 16
    Top = 248
    Bitmap = {
      494C01011F002100140010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000393939003939390039393900393939003939390039393900393939003939
      3900393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000003939
      3900737373006363630063636300636363006363630063636300636363006363
      6300636363003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000313131003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000004A4A
      4A00A5A5A500A5A5A500B5B5B500FFFFFF0063636300FFFFFF00B5B5B500B5B5
      B500A5A5A5007373730039393900000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031313100A5A5
      A500424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000000000000000000021212100A5A5
      A500C6C6C600DEDEDE00FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B5009C9C9C0039393900000000000000000000000000000000000000
      000000000000313131003131310031313100313131003131310031313100DEDE
      DE00A5A5A5004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000000000000084848400000000000000
      000000000000000000008484840000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F70063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C600B5B5B50063636300393939000000000000000000000000000000
      0000000000004242420094949400A5A5A500B5B5B500DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00A5A5A50042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840084848400000000000000000084848400848484000000
      000000000000000000008484840000000000000000003939390063636300B5B5
      B500D6D6D600F7FFFF00FFFFFF00FFFFFF006363630063636300FFFFFF00F7F7
      F700CECECE00B5B5B50063636300393939000000000000000000000000000000
      00000000000042424200424242005A5A5A005A5A5A005A5A5A005A5A5A00A5A5
      A500949494004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000848484008484840084848400000000000000000084848400848484008484
      840000000000000000008484840000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F700FFFFFF006363630063636300FFFFFF00FFFFFF00EFEF
      EF00D6D6D600B5B5B50063636300393939000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A009494
      9400424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400848484008484840084848400000000000000000084848400848484008484
      84008484840000000000848484000000000000000000000000004A4A4A00A5A5
      A500CECECE00EFEFEF0063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C6009C9C9C004A4A4A00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484000000000084848400000000000000000000000000393939008484
      8400B5B5B500D6D6D600FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B5008484840039393900000000000000000000000000000000000000
      0000313131003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000848484008484840084848400000000000000000084848400848484008484
      8400000000000000000084848400000000000000000000000000000000004242
      42009C9C9C00B5B5B500C6C6C600FFFFFF0063636300FFFFFF00CECECE00B5B5
      B5009C9C9C003939390000000000000000000000000000000000000000004242
      4200A5A5A5003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840084848400000000000000000084848400848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      000039393900636363009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C007373
      730039393900000000000000000000000000000000000000000042424200A5A5
      A500DEDEDE005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000000000000084848400000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000031313100636363005A5A5A005A5A5A00313131000000
      0000000000000000000000000000000000000000000042424200A5A5A500DEDE
      DE00DEDEDE00DEDEDE00B5B5B500A5A5A500949494005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000000000004A4A4A007373730094949400848484004A4A4A000000
      0000000000000000000000000000000000000000000000000000424242009494
      9400A5A5A5003131310031313100313131005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000003939390094949400B5B5B500A5A5A500DEDEDE00848484003939
      3900000000000000000000000000000000000000000000000000000000004242
      4200949494003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000006363630084848400C6C6C600B5B5B500B5B5B500848484004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000313131003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630039393900636363003939390063636300393939006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010009494940010101000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A500B5B5B50094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A5001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000A5A5A50094949400101010000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B500C6C6C600C6C6C600949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B5001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000B5B5B500A5A5A500949494001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C600E7E7E700C6C6C600C6C6C6009494
      9400003131000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C6001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000C6C6C600B5B5B500A5A5A5009494
      9400101010000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000008484840000000000000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C600E7E7E700E7E7E700DEDEDE00DEDE
      DE00949494000031310000000000000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C6001010100010101000101010001010
      1000101010001010100010101000101010001010100010101000101010001010
      100010101000101010001010100010101000C6C6C600C6C6C600B5B5B500A5A5
      A500949494001010100000000000000000000000000084848400848484000000
      0000000000000000000084848400000000008484840000000000000000000000
      000084848400848484000000000000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C600E7E7E700DEDEDE00F7F7F700DEDE
      DE00DEDEDE00949494000031310000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C6009494940094949400949494009494
      9400949494009494940094949400003131000031310094949400949494009494
      940094949400949494009494940094949400C6C6C600C6C6C600C6C6C600B5B5
      B500A5A5A5009494940010101000000000000000000084848400848484008484
      8400000000000000000084848400000000008484840000000000000000008484
      8400848484008484840000000000000000001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0094949400003131001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE000031310000313100CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00C6C6C600C6C6C600C6C6
      C600B5B5B500A5A5A50094949400101010000000000084848400848484008484
      8400848484000000000084848400000000008484840000000000848484008484
      8400848484008484840000000000000000001010100010101000101010001010
      1000101010001010100094949400CECECE00E7E7E700DEDEDE00003131000031
      3100003131000031310000313100003131000031310094949400B5B5B500C6C6
      C600E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700C6C6C600C6C6C6000031310000313100C6C6C600C6C6C600E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700C6C6C600B5B5B50094949400003131000000000084848400848484008484
      8400848484000000000084848400000000008484840000000000848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      000000000000000000000000000000000000000000000031310094949400C6C6
      C600C6C6C600E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE000031310000313100DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700C6C6
      C600C6C6C6009494940000313100000000000000000084848400848484008484
      8400000000000000000084848400000000008484840000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000003131009494
      9400C6C6C600DEDEDE00F7F7F700DEDEDE000031310000313100003131000031
      3100003131000031310000313100003131000031310000313100003131000031
      310000313100003131000031310000313100DEDEDE00F7F7F700DEDEDE00C6C6
      C600949494000031310000000000000000000000000084848400848484000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000031
      310094949400DEDEDE00DEDEDE00DEDEDE000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE00DEDEDE00DEDEDE009494
      9400003131000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000031310094949400DEDEDE00DEDEDE000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE00DEDEDE00949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310094949400DEDEDE000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE0094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000313100949494000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000313100003131000031310000313100003131000000
      0000000000000000000000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A5004A4A
      4A00C6C6C600D6D6D600D6D6D600D6D6D6004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A5004A4A
      4A00C6C6C600C6C6C600C6C6C600D6D6D6004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE004A4A4A000000000000000000000000000000000063636300CECE
      CE00949494009494940094949400949494009494940094949400949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300949494006363630000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A0000000000000000000000000063636300CECE
      CE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5B5009494
      9400B5B5B5009494940000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5
      B500848484000000000094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00CECE
      CE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C
      9C00B5B5B5000000000094949400000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5000000000000000000636363000000
      0000636363009494940063636300000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A000000000063636300CECECE00C6C6C600B5B5
      B500CECECE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5
      B50000000000B5B5B50094949400000000000000000084848400C6C6C6005252
      5200525252005252520052525200B5B5B5000000000000000000636363006363
      6300636363009494940063636300000000001010100010101000101010001010
      1000101010001010100094949400CECECE00E7E7E700DEDEDE00003131000031
      3100003131000031310000313100003131004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A00A5A5A500A5A5A5004A4A4A004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A000000000063636300CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000009494940094949400000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363009C9C
      9C00636363006363630063636300000000001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE009494940000313100000000004A4A4A00A5A5A5004A4A
      4A00CECECE004A4A4A00A5A5A5004A4A4A00CECECE004A4A4A00A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      63009C9C9C00B5B5B50094949400000000000000000084848400C6C6C6006363
      6300636363006363630063636300B5B5B5000000000000000000636363009C9C
      9C00B5B5B500636363000000000000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C600E7E7E700DEDEDE00F7F7F700DEDE
      DE00DEDEDE0094949400003131000000000000000000000000004A4A4A004A4A
      4A00CECECE00CECECE004A4A4A004A4A4A00CECECE00CECECE004A4A4A004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500B5B5B5009C9C
      9C00B5B5B5009C9C9C0094949400000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363006363
      6300636363006363630063636300000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C600E7E7E700E7E7E700DEDEDE00DEDE
      DE00949494000031310000000000000000000000000000000000000000004A4A
      4A00CECECE00CECECE00CECECE004A4A4A00CECECE00CECECE00CECECE004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00C6C6
      C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500E7E7E700CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000084848400C6C6C6008484
      84008484840084848400C6C6C600B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C600E7E7E700C6C6C600C6C6C6009494
      9400003131000000000000000000000000000000000000000000000000000000
      00004A4A4A00CECECE004A4A4A00000000004A4A4A00CECECE004A4A4A000000
      00004A4A4A00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500CECECE00B5B5B5009C9C9C0063636300636363006363
      6300636363006363630063636300636363000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B500C6C6C600C6C6C600949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A0000000000000000004A4A4A004A4A4A000000
      0000000000004A4A4A004A4A4A0000000000000000000000000063636300CECE
      CE00CECECE00CECECE00CECECE009C9C9C006363630000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E70084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A500B5B5B50094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A000000000000000000000000004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400848484008484840084848400D6D6D600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600EFEF
      EF00D6D6D600B5B5B500C6C6C600C6C6C600000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363005A5A5A0000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      94009C9C9C009C9C9C00F7F7F700B5B5B5009C9C9C009C9C9C00B5B5B500FFFF
      FF00B5B5B500949494009C9C9C009C9C9C00000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630073737300737373007373
      730063636300C6C6C600636363005A5A5A005A5A5A0000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0084848400848484008484
      84008484840084848400FFFFFF0084848400C6C6C60094949400949494009C9C
      9C009494940094949400F7F7F700B5B5B5009494940094949400CECECE00DEDE
      DE00949494009C9C9C0094949400B5B5B5000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000737373000000000084848400848484008484
      8400C6C6C600B5B5B500A5A5A500848484005A5A5A00A5A5A500949494006363
      63005A5A5A0084848400000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      9400949494009C9C9C00F7F7F700B5B5B5009C9C9C0094949400F7F7F700B5B5
      B500949494009C9C9C009C9C9C009C9C9C000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B500000000007373730042424200000000000000000084848400C6C6
      C600B5B5B500A5A5A50084848400848484005A5A5A005A5A5A00C6C6C6006363
      63005A5A5A0084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF0084848400D6D6D600C6C6C600CECECE00CECE
      CE00B5B5B50094949400F7F7F700C6C6C600B5B5B500DEDEDE00DEDEDE009494
      9400949494009C9C9C00949494009C9C9C00000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000000000000000000000848484008484
      8400C6C6C6008484840084848400848484005A5A5A00C6C6C600B5B5B500A5A5
      A5008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF0084848400F7F7F700CECECE00C6C6C600CECE
      CE00F7F7F700D6D6D600F7F7F700DEDEDE00DEDEDE00EFEFEF00D6D6D600B5B5
      B500F7F7F7009C9C9C00949494009C9C9C00000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000000000000084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400B5B5B500A5A5A5008484
      84008484840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0084848400C6C6C600949494009C9C9C009494
      9400B5B5B500FFFFFF00FFFFFF00B5B5B5009494940094949400C6C6C600F7F7
      F700F7F7F7009C9C9C0094949400B5B5B500000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400A5A5A500848484008484
      84008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      940094949400EFEFEF00FFFFFF00B5B5B500949494009494940094949400FFFF
      FF00F7F7F700B5B5B5009C9C9C009C9C9C00000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600CECECE00CECECE00C6C6C60084848400D6D6D600D6D6
      D600C6C6C60084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      9400B5B5B500FFFFFF00FFFFFF00B5B5B5009494940094949400B5B5B500FFFF
      FF00F7F7F7009C9C9C009C9C9C009C9C9C00000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000008484840084848400848484008484
      840084848400D6D6D600D6D6D6005A5A5A0084848400D6D6D600D6D6D600D6D6
      D600C6C6C60084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0084848400C6C6C6009494940094949400C6C6
      C600F7F7F700C6C6C600FFFFFF00C6C6C600C6C6C600CECECE00EFEFEF00DEDE
      DE00F7F7F7009C9C9C00949494009C9C9C00000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000008484840084848400848484008484
      840084848400C6C6C600D6D6D600D6D6D60084848400C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60084848400000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600B5B5B500EFEFEF00EFEF
      EF00B5B5B5009C9C9C00CECECE00D6D6D600D6D6D600CECECE00C6C6C6009C9C
      9C00F7F7F7009C9C9C0094949400B5B5B500000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400C6C6C600C6C6C60084848400D6D6D600D6D6
      D6005A5A5A0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840084848400D6D6D600F7F7F700C6C6C6009494
      94009C9C9C0094949400949494009C9C9C00949494009C9C9C009C9C9C009C9C
      9C00F7F7F7009C9C9C00949494009C9C9C00000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      0000636363004242420000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600D6D6
      D600D6D6D60084848400000000000000000084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C60084848400FFFFFF00C6C6C600949494009494
      9400949494009C9C9C0094949400949494009494940094949400949494009494
      9400F7F7F7009C9C9C009C9C9C009C9C9C0000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00C6C6C6009C9C9C009494
      9400949494009C9C9C00949494009C9C9C00949494009C9C9C009C9C9C009494
      9400F7F7F700B5B5B5009C9C9C009C9C9C00000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      0000000000000000000073737300424242000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400DEDEDE00F7F7F700B5B5B5009C9C
      9C00B5B5B500B5B5B50094949400949494009C9C9C00D6D6D600D6D6D600CECE
      CE00FFFFFF00D6D6D600D6D6D600DEDEDE004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600CECECE00F7F7F700E7E7
      E700F7F7F700CECECE009C9C9C009C9C9C009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630084848400636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      0000424242007373730084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600636363009494940073737300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      420073737300C6C6C600B5B5B5004242420084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400F7F7F700848484008484
      84008484840084848400636363009C9C9C0073737300C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00CECECE009C9C9C00424242007373
      7300A5A5A500C6C6C600424242000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7007373730073737300F7F7F700C6C6C600737373006363
      630000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00CECECE009C9C9C00CECECE004242420073737300A5A5
      A500B5B5B50042424200000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500F7F7F700C6C6C600000000007373
      730063636300000000000000000000000000000000000000000000000000FFFF
      FF00CECECE009C9C9C00CECECE009C9C9C004242420073737300A5A5A500B5B5
      B5004242420000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000000000000031313100DEDEDE004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F700949494009494
      940094949400949494009494940094949400F7F7F700C6C6C60000000000C6C6
      C6007373730063636300000000000000000000000000FFFFFF0042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242009C9C
      9C00CECECE00C6C6C600000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C009C9C9C004A4A4A004A4A4A000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600737373006363630000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200CECECE009C9C
      9C009C9C9C00FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A00000000004A4A4A000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      0000000000004A4A4A004A4A4A000000000084848400F7F7F700B5B5B500B5B5
      B500B5B5B500C6C6C600F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000073737300636363000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C600424242009C9C9C00CECE
      CE009C9C9C00CECECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A004A4A4A009C9C9C004A4A
      4A004A4A4A009C9C9C009C9C9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000000000000737373006363630042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F7009C9C9C009C9C
      9C00C6C6C600F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000000000000000000007373730042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000000000000000000000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A5004242420094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C6008484840042424200DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C0000000000000000000000000084848400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6
      C60000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000737373009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B5000000000073737300424242009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      0000636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      0000000000000000000073737300424242009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D6009C9C9C00D6D6D600D6D6D600D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600D6D6D6009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600292929003131310000000000000000000000
      0000000000000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00949494009494
      9400949494009494940094949400636363000000000000000000000000008484
      8400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      0000000000000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00A5A5A5009494
      9400949494009494940094949400636363000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600292929003131310000000000000000005A5A
      5A00636363000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00A5A5A500A5A5
      A500949494009494940094949400636363000000000000000000000000008484
      8400E7E7E7005252520052525200525252005252520052525200525252005252
      5200C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000E7E7E700E7E7E700E7E7E70063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7005252
      5200525252005252520000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A00000000006363630084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000063636300636363006363630063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7006363630063636300636363006363630063636300636363006363
      6300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000000000008484840084848400848484006363
      63006363630063636300000000008484840084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0029292900313131004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      63000000000084848400848484008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7006363
      6300636363006363630000000000949494000000000000000000B5B5B500B5B5
      B5008484840084848400000000009494940084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300A5A5A50084848400848484008484840063636300CECECE0042424200A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7007373730073737300737373007373730073737300737373007373
      7300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000C6C6C6009494940000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE006363630073737300C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300CECECE00A5A5A500848484008484840063636300CECECE00FFFFFF00A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700E7E7E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7007373
      730073737300737373007373730000000000C6C6C60094949400000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600525252004A4A4A00D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C600737373008484840000000000A5A5A500A5A5A500A5A5A500A5A5
      A500CECECE00CECECE00A5A5A5008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000006363
      6300E7E7E7008484840084848400848484008484840084848400C6C6C600E7E7
      E700E7E7E700B5B5B50000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C6000000000000000000949494000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D6008484840084848400C6C6C600C6C6C6000000
      0000DEDEDE00000000000000000000000000CECECE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700CECECE006363630063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000063636300000000006363
      6300E7E7E70063636300E7E7E700E7E7E700E7E7E700C6C6C600E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E7009494
      9400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF0084848400C6C6C600C6C6C600C6C6C600D6D6D600CECE
      CE00000000000000000000000000000000006363630063636300636363006363
      6300E7E7E700CECECE00636363008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400E7E7E7000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      0000949494000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400C6C6C600CECECE00CECECE00CECECE00D6D6
      D600CECECE000000000000000000000000000000000000000000000000006363
      6300CECECE0063636300848484008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000006363630063636300636363008484
      8400636363006363630063636300E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000009494940000000000000000000000000000000000000000000000
      000000000000000000000000000094949400D6D6D600CECECE00D6D6D600CECE
      CE00F7FFFF00F7FFFF0000000000000000000000000000000000000000006363
      63006363630084848400848484008484840084848400E7E7E700A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000636363006363
      6300636363008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400D6D6D600F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400E7E7E700A5A5
      A500424242000000000000000000000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400E7E7
      E700424242000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000525252005252
      5200525252005252520052525200000000000000000000000000000000005252
      5200525252000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300E7E7E700A5A5A50063636300000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000007373
      73007373730073737300000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600DEDEDE00C6C6C600848484000000000000000000525252005A5A5A005A5A
      5A005A5A5A005A5A5A0052525200000000000000000000000000000000008484
      8400525252000000000000000000000000000000000000000000000000000000
      00000000000063636300E7E7E700A5A5A500E7E7E700A5A5A500636363000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000007373
      73007373730073737300000000000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A0073737300737373007373
      73005A5A5A005252520000000000000000000000000018181800848484008484
      8400848484005252520052525200000000000000000000000000000000000000
      00000000000000848400A5A5A500E7E7E700CECECE00D6D6D600B5B5B5006363
      6300000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A000000000000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00848484003131
      3100525252000000000000000000000000001818180084848400848484008484
      8400848484008484840063636300525252000000000000000000000000000000
      000063636300B5B5B500E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7
      E700636363000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00636363005252
      52000000000000000000000000005A5A5A0084848400C6C6C600A5A5A5008484
      8400848484008484840063636300525252000000000000000000000000008484
      840063636300E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5
      A500C6C6C600636363000000000000000000000000004A4A4A00000000000000
      0000000000004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00737373006363
      630018181800000000000000000084848400EFEFEF00DEDEDE00C6C6C600A5A5
      A500848484008484840063636300525252000000000000000000000000008484
      840063636300CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5A500C6C6
      C600C6C6C600B5B5B5006363630000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00949494007373
      73006363630052525200000000000000000084848400EFEFEF00DEDEDE00C6C6
      C600A5A5A5008484840052525200525252000000000000000000000000008484
      84008484840063636300B5B5B500A5A5A500E7E7E700A5A5A500C6C6C600C6C6
      C600B5B5B5000063630021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00EFEFEF009494
      940073737300636363004A4A4A004A4A4A004A4A4A0084848400EFEFEF00DEDE
      DE00C6C6C600848484006363630052525200000000000000000000000000A5A5
      A500A5A5A5008484840063636300E7E7E700B5B5B500C6C6C600C6C6C600A5A5
      A50063636300393939000000000000000000000000004A4A4A004A4A4A004A4A
      4A00000000004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A00EFEFEF00949494004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0084848400EFEF
      EF004A4A4A00B5B5B5006363630052525200000000000000000000000000A5A5
      A500B5B5B500B5B5B5008484840063636300B5B5B500319C9C00636363006363
      63000000000000000000000000000000000000000000737373004A4A4A000000
      000000000000000000004A4A4A00737373000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A008484
      84004A4A4A004A4A4A006363630052525200000000000000000094949400C6C6
      C600B5B5B500B5B5B50084848400848484006363630063636300000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A0094949400737373004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A0094949400313131000000000094949400B5B5B5008484
      8400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000737373004A4A
      4A00000000004A4A4A0073737300000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C6008484840000000000000000005A5A5A00949494007373
      73004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A0073737300525252000000000094949400A5A5A500848484009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE0000000000848484000000000000000000000000005A5A5A005A5A
      5A005A5A5A005252520052525200525252005252520052525200525252005252
      5200525252005252520000000000000000008484840084848400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      73004A4A4A007373730000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFF007FFFF0000BFFDE003FFCF0000
      BFFDE001FFC70000BFFDC001F8030000BDBD8000F8010000B99D8000F8030000
      B18D8000FFC70000A185C001FFCF0000A185C001F3FF0000B18DE003E3FF0000
      B99DF007C03F0000BDBDFC1F803F0000BFFDFC1FC03F0000BFFDF80FE3FF0000
      BFFDF80FF3FF0000FFFFF80FFFFF0000FE7FFE7FFE7FFFFFFC3FFC7FFE3FFD7F
      F81FF87FFE1FFD7FF00FF07FFE0FFD7FE007E07FFE07BD7BC003C00000039D73
      8001800000018D6300000000000085430000000000008543F81F800000018D63
      F81FC00000039D73F81FE07FFE07BD7BF81FF07FFE0FFD7FF81FF87FFE1FFD7F
      F81FFC7FFE3FFD7FF81FFE7FFE7FFFFFFFFFFFFFFFFFF81F000FFFFFFFFFF81F
      0007E000FE07F81F0003C000FDE3F81F0001C000FBF1F81F000180008071F81F
      000180008051F81F000100008041000000010000804100008001000080438001
      C00180008041C003E0018000807FE007F1118000807FF00FF999C07F80FFF81F
      FDDDE0FF81FFFC3FFFFFFFFFFFFFFE7FFE00000087FF007F000000008003007F
      00000000C002800300000000C000C00300000000C001C00700000000C0038007
      00000000C003000700000000C003000300000000C003000300000000C0030001
      00000000C003000300000000C003800300000000C001800100000000800CC001
      00000000001FFC01FFFF00000FFFFE078001FFBFFF18FFFFFFFF001FFC000000
      8001001FF0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000300010000000100038001000055D9000100000000
      000000040000000077760006000000008001000700010000FFFF000780030000
      8001C007C0070000FFFFC007E00FFFFF87FFFFFFFFFFFFFF8003FFFFFFFF8001
      C0020000F00FFFFFC0000000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0010000FC3FFE7F800C0000F81FFFFF
      001F0000F00F80010FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000000E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00E003B9F700000600E00181F700000300E001FFF700000000E00388F70000
      0000E00F9CF700000000C03FC1F70000000087FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  inherited ilColor: TImageList
    Left = 44
    Top = 248
    Bitmap = {
      494C01011F002100140010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      3100008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A0094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E70094ADAD0094AD
      AD0094ADAD000084840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084000000FFCE
      3100840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002121210094AD
      AD009CCECE00E7E7E700EFEFEF00848400008484000084840000FFFFFF00C6C6
      C6009CCECE0094ADAD0021212100000000000000000000000000000000000000
      0000000000009C0000008400000084000000840000008400000084000000FFFF
      9C00FFCE31008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00F7F7F70084840000FFFFFF0084840000FFFFFF0084840000D6D6
      D6009CCECE009CCECE0000848400000000000000000000000000000000000000
      00000000000084000000FFCE3100FFCE3100FFFF9C00FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFCE310084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00F7FFFF00EFEFEF00FFFFFF008484000084840000FFFFFF00F7F7
      F7009CCECE009CCECE0000848400000000000000000000000000000000000000
      00000000000084000000840000009C0000009C0000009C0000009C000000FFCE
      3100FFCE31009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00E7E7E700FFFFFF008484000084840000FFFFFF00FFFFFF00EFEF
      EF009CCECE009CCECE0000848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C000000FFCE
      31009C0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A0094AD
      AD009CCECE00E7E7E70084840000FFFFFF0084840000FFFFFF0084840000E7E7
      E7009CCECE0094ADAD004A4A4A00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C0000009C00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000101010000084
      840094ADAD00C6C6C600EFEFEF00848400008484000084840000EFEFEF00D6D6
      D60094ADAD00009C9C0010101000000000000000000000000000000000000000
      0000840000009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E700D6D6D60094AD
      AD0094ADAD004242420000000000000000000000000000000000000000008400
      0000FFCE31009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000021212100009C9C00639C9C00639C9C00639C9C00639C9C00639C9C00009C
      9C0021212100000000000000000000000000000000000000000084000000FFCE
      3100FFFF9C008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000031313100009C9C000084840000848400313131000000
      0000000000000000000000000000000000000000000084000000FFCE3100FFFF
      9C00FFFF9C00FFFF9C00FFFF9C00FFCE3100FFCE310084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00009C9C0094ADAD00009C9C004A4A4A000000
      00000000000000000000000000000000000000000000000000009C000000FFCE
      3100FFCE31009C0000009C0000009C0000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000CECE009CCECE0094ADAD0094ADAD0000CECE001010
      1000000000000000000000000000000000000000000000000000000000009C00
      0000FFCE31009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C00009C9C009CCECE009CCECE0094ADAD0000CECE004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      00009C0000009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C0021212100009C9C0042424200009C9C0021212100009C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000084840010101000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C0000CECE0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000009C9C0000848400101010000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE0000FFFF0000FFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001010100000CECE00009C9C00008484001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF00F7FFFF0031FFFF0031FFFF000084
      8400003131000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001010100000FFFF0000CECE00009C9C000084
      8400101010000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF00F7FFFF00F7FFFF00CEFFFF00CEFF
      FF00008484000031310000000000000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF001010100010101000101010001010
      1000101010001010100010101000003131000031310010101000101010001010
      10001010100010101000101010001010100000FFFF0000FFFF0000CECE00009C
      9C00008484001010100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF00F7FFFF00CEFFFF00F7FFFF00CEFF
      FF00CEFFFF00008484000031310000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF000084840000848400008484000084
      8400008484000084840000848400003131000031310000848400008484000084
      84000084840000848400008484000084840031FFFF0000FFFF0000FFFF0000CE
      CE00009C9C000084840010101000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF00F7FFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF0000848400003131001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF0063FFFF0063FFFF0063FFFF0063FF
      FF0063FFFF0063FFFF0063FFFF00003131000031310063FFFF0063FFFF0063FF
      FF0063FFFF0063FFFF0063FFFF0063FFFF0063FFFF0031FFFF0000FFFF0000FF
      FF0000CECE00009C9C0000848400101010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001010100010101000101010001010
      100010101000101010000084840063FFFF00F7FFFF00CEFFFF00003131000031
      310000313100003131000031310000313100003131000084840000CECE0000FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF009CFFFF0000313100003131009CFFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF0000FFFF0000CECE0000848400003131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000003131000084840000FF
      FF0031FFFF00F7FFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF000031310000313100CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00F7FFFF0031FF
      FF0000FFFF000084840000313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000003131000084
      840031FFFF00CEFFFF00F7FFFF00CEFFFF000031310000313100003131000031
      3100003131000031310000313100003131000031310000313100003131000031
      310000313100003131000031310000313100CEFFFF00F7FFFF00CEFFFF0031FF
      FF00008484000031310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000031
      310000848400CEFFFF00CEFFFF00CEFFFF000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF00CEFFFF00CEFFFF000084
      8400003131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000031310000848400CEFFFF00CEFFFF000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF00CEFFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000848400CEFFFF000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF009CFFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000313100008484000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF009CFFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000C6C6C6000000000000000000000000000000000000000000006363009CFF
      FF00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00009CCE00009CCE0000000000000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE0000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C60000000000000000000000000000000000006363009CFF
      FF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CEFF00009C
      CE0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CE
      FF00009CCE0000000000009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF009CFF
      FF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009C
      CE0000CEFF0000000000009CCE00000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000CE000000
      00000000CE000000FF000000CE00000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF00CEFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF000000000000CEFF00009CCE000000000000000000848484009CFFFF00CE31
      0000CE310000CE310000CE310000C6C6C60000000000000000000000CE000000
      CE000000CE000000FF000000CE00000000001010100010101000101010001010
      100010101000101010000084840063FFFF00F7FFFF00CEFFFF00003131000031
      3100003131000031310000313100003131000000000084848400848484000000
      0000000000008484840084848400000000000000000084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF0000000000009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      FF000000CE000000CE000000CE00000000001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF00F7FFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF0000848400003131000000000000000000848484000000
      0000C6C6C600000000008484840000000000C6C6C60000000000848484000000
      0000C6C6C600C6C6C60000000000000000000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      6300009CCE0000CEFF00009CCE000000000000000000848484009CFFFF00FF00
      0000FF000000FF000000FF000000C6C6C60000000000000000000000CE000000
      FF00847BFF000000CE000000000000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF00F7FFFF00CEFFFF00F7FFFF00CEFF
      FF00CEFFFF000084840000313100000000000000000000000000000000000000
      0000C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600000000000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF0000CEFF00009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      CE000000CE000000CE000000CE00000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF00F7FFFF00F7FFFF00CEFFFF00CEFF
      FF00008484000031310000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6C6000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF00CEFF
      FF0000CEFF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF000000000000000000848484009CFFFF00FF63
      3100FF633100FF6331009CFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF00F7FFFF0031FFFF0031FFFF000084
      8400003131000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000000000000000000000C6C6C600000000000000
      000000000000C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF00CEFFFF0000CEFF009CFFFF0000CEFF009CCECE0000636300006363000063
      6300006363000063630000636300006363000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE0000FFFF0000FFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006363009CFF
      FF009CFFFF009CFFFF009CFFFF009CCECE000063630000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C0000CECE0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      6300006363000063630000636300006363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECE9C00CE9C6300CE9C6300CE9C
      6300CE9C6300CE9C6300FFFFFF00CE9C6300CE9C6300CE9C6300CE9C6300FFEF
      CE00CECE9C00CE9C3100CE9C6300CE9C6300000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE630000CE630000F7F7F700CE633100CE630000CE630000CE633100FFFF
      FF00CE6331009C630000CE6300009C633100000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF0084000000FF000000FF000000FF00
      000084000000C6C6C60084000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0000000000000000000000
      00000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE63
      00009C6300009C630000F7F7F700CE6331009C6300009C630000CE9C9C00F7CE
      A5009C630000CE6300009C630000CE633100000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000000000000084000000840000008400
      0000C6C6C600B5B5B500A5A5A50000000000000084000000FF000000CE000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000CE630000F7F7F700CE633100CE6300009C630000EFEFEF00CE9C
      31009C630000CE630000CE6300009C633100000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF0000000000000000000000000084848400C6C6
      C600B5B5B500A5A5A50000000000000000000000840000008400C6C6C6000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CECE9C00CE9C6300CECE6300CECE
      6300CE6331009C630000F7F7F700CE9C6300CE9C3100CECECE00CECECE009C63
      00009C630000CE6300009C6300009C63310000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C00000000000000000000000000000000000000
      0000C6C6C60000000000000000000000000000008400C6C6C600B5B5B500A5A5
      A5000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF0000000000EFEFEF00CE9C9C00CE9C6300CE9C
      9C00F7F7F700CECE9C00F7F7F700F7CEA500F7CEA500DEDEDE00CECE9C00CE63
      3100EFEFEF009C6331009C6300009C6331000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C0000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000B5B5B500A5A5A5000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C630000CE6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE9C6300EFEF
      EF00F7F7F7009C6331009C630000CE633100000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000A5A5A500000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000FFEFCE00FFFFFF00CE6331009C6300009C6300009C630000FFFF
      FF00F7F7F700CE633100CE6300009C633100000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600CECECE00CECECE00C6C6C60000000000D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE633100FFFF
      FF00F7F7F7009C633100CE6300009C633100000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      000000000000D6D6D600D6D6D600FF00000000000000D6D6D600D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE9C
      6300F7F7F700CE9C6300FFFFFF00CE9C6300CE9C6300CE9C9C00E7E7E700F7CE
      A500EFEFEF009C6331009C6300009C633100000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600D6D6D600D6D6D60000000000C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C6300CE9C3100E7E7E700FFCE
      CE00CE9C3100CE630000CE9C9C00CECE9C00CECE9C00CE9C9C00CE9C6300CE63
      0000F7F7F7009C6331009C630000CE633100000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000D6D6D600D6D6
      D600FF00000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840000000000CECE9C00F7F7F700CE9C63009C63
      0000CE6300009C6300009C630000CE6300009C630000CE630000CE630000CE63
      0000F7F7F7009C6331009C6300009C633100000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600D6D6
      D600D6D6D60000000000000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C60000000000FFFFFF00CE9C63009C6300009C63
      00009C630000CE6300009C6300009C6300009C6300009C6300009C6300009C63
      0000F7F7F7009C633100CE6300009C63310000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00CE9C6300CE6300009C63
      00009C630000CE6300009C630000CE6300009C630000CE630000CE6300009C63
      0000F7F7F700CE633100CE6300009C633100000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400F7CEA500EFEFEF00CE9C31009C63
      3100CE633100CE6331009C6300009C630000CE630000CECE9C00CECE9C00B5B5
      B500FFFFFF00CECE9C00CECE9C00F7CEA5000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE9C6300CECE6300F7F7F700D6D6
      D600EFEFEF00CECE6300CE630000CE630000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000009C000000FF000000CE0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000316363009CCECE00C6D6EF000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00CE310000CE31
      0000CE310000CE31000000009C00319CFF000000CE00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300000000003163
      6300639CCE00C6D6EF00000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF000000CE000000CE009CFFFF00C6C6C6000000CE000000
      9C0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000000031636300639C
      CE00C6D6EF0000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00C6C6C600000000000000
      CE0000009C00000000000000000000000000000000000000000000000000FFFF
      FF00FFCECE00FF636300FFCECE00FF6363000000000031636300639CCE009CCE
      CE000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000031313100DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF633100FF63
      3100FF633100FF633100FF633100FF633100FFFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C00000000000000000000000000FFFFFF0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FFCECE00C6C6C600000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C00FF9C9C0000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000FFCECE00FF63
      6300FF636300FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00000084000000
      84000000840000008400FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000CE0000009C000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FF636300FFCE
      CE00FF636300FFCECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000FF9C9C000000
      000000000000FF9C9C00FF9C9C0000000000FF9C9C0000000000FF9C9C00FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C60000000000000000000000CE000000840000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFCECE00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF003100FF003100
      FF0000008400FFFFFF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000FF0000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000000094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C0000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C60000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C00000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C60084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600313131003939390000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600313131003939390000000000000000005A5A
      5A0063636300000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF00CE310000CE310000CE310000CE310000CE310000CE310000CE31
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE31000000000000000000000000000000000000000000006363
      9C0063639C0063639C0000000000FF00000084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00000000000000000094ADAD0094ADAD0094ADAD00639C
      9C00639C9C0094ADAD0000000000FF31310084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0031313100393939004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF63630084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE003131FF0000000000C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D6009CFF9C0000FF0000D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C6007373730084848400000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000000000000000000000000000031CE
      FF00FFFFFF00FF633100FF633100FF633100FF633100FF6331009CFFFF00FFFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000000000FFFF000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D60084848400848484009CFFFF009CFFFF000000
      0000DEDEDE00000000000000000000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00848484009CFFFF009CFFFF009CFFFF00CEFFFF00CEFF
      FF00000000000000000000000000000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000084848400848484009CFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000031CEFF0031CEFF0031CEFF008484
      840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00F7FFFF00F7FFFF0000000000000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C000000000000000000000000000000000000000000000000000000000031CE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002942420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000018180000FFFF0063A5A50031525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008400000084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000FF633100FF63
      3100FF633100FF6331000000000000000000000000000000000000000000FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FF9C3100FF9C3100FF9C
      3100FF6331000000000000000000000000000000000029292900FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      00008400000084000000848484000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFCE31009C31
      00000000000000000000000000000000000029292900FF633100FF9C3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
      E700294A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C009C3100000000
      0000000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
      C60063BDBD003152520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FF9C31009C31
      0000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C3100CE6300009C31000000000000000000000000000000000000BDA5
      A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
      EF0000E7E70018CECE0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FFCE3100FF9C
      31009C310000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE3100CE9C3100CE630000000000000000000000000000000000008C00
      0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
      F7007BDEDE00005A5A0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFFFCE00FFCE
      3100FF9C31009C310000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE3100CE9C3100CE630000000000000000000000000000BD9C9C00FFFF
      0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
      B500003131003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFFCE00FFCE31000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      CE0000000000FFCE3100CE630000000000000000000000000000BD9C9C00FFFF
      0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
      5200000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000CE9C31000000000000000000C6BDBD00B5631000FFFF
      F700BDADAD008473000084000000942121002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFCE3100FF9C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE31009C31000000000000C6841000FFFFE7008C8C
      2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FF633100FFCE3100FF9C
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100CE6300000000000094393900F7F76B009C843900AD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF000000000084848400000000000000000000000000FF633100FF63
      3100FF633100CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300000000000000000000943939007B7B0000AD6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFF007FFFF0000BFFDE003FFCF0000
      BFFDE001FFC70000BFFDC001F8030000BDBD8000F8010000B99D8000F8030000
      B18D8000FFC70000A185C001FFCF0000A185C001F3FF0000B18DE003E3FF0000
      B99DF007C03F0000BDBDFC1F803F0000BFFDFC1FC03F0000BFFDF80FE3FF0000
      BFFDF80FF3FF0000FFFFF80FFFFF0000FE7FFE7FFE7FFFFFFC3FFC7FFE3FFD7F
      F81FF87FFE1FFD7FF00FF07FFE0FFD7FE007E07FFE07BD7BC003C00000039D73
      8001800000018D6300000000000085430000000000008543F81F800000018D63
      F81FC00000039D73F81FE07FFE07BD7BF81FF07FFE0FFD7FF81FF87FFE1FFD7F
      F81FFC7FFE3FFD7FF81FFE7FFE7FFFFFFFFFFFFFFFFFF81F000FFFFFFFFFF81F
      0007E000FE07F81F0003C000FDE3F81F0001C000FBF1F81F000180008071F81F
      000180008051F81F000100008041000000010000804100008001000080438001
      C00180008041C003E0018000807FE007F1118000807FF00FF999C07F80FFF81F
      FDDDE0FF81FFFC3FFFFFFFFFFFFFFE7FFE000000DFFF007F000000008002007F
      0000000080038003000000008001C00300000000C001C00700000000C0038007
      00000000C003000700000000C003000300000000C003000300000000C0030001
      00000000C003000300000000C003800300000000C0078001000000008003C001
      00000000001DFC01FFFF00009FFFFE078001FFBFFF18FFFFFFFF001FFC000000
      8001001FF0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000300010000000100038001000055D9000100000000
      000000040000000077760006000000008001000700010000FFFF000780030000
      8001C007C0070000FFFFC007E00FFFFFDFFFFFFFFFFFFFFF8002FFFFFFFF8001
      80030000F00FFFFF80010000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0070000FC3FFE7F80030000F81FFFFF
      001D0000F00F80019FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000100E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00F003B9F700000600E00181F700000300E001FFF700000000C00388F70000
      0000C00F9CF700000000803FC1F70000000081FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  inherited IconosXP: TImageList
    Left = 72
    Top = 248
    Bitmap = {
      494C010130003200140010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000D0000000010020000000000000D0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000525A420008313900000008002118
      31005A4A4A0084636300846B63007B3129000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5736300BD737B007B52730042316B0018217300081852000010
      73004A5294008C94AD00EFEFF700000000000000000000000000000000003921
      2900633929007B422100733918004A29080073391000633921004A3129002921
      4A005252840000000000000000000000000031526300E7F7FF005ACEFF0031B5
      E700108CB500085A7300185A6300317B8400429CAD005AC6D6006BDEE70073E7
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8C00C64A39000829A5000829A5001831A50010299C0000104A00425294000021
      A5000818940000188400001873000000000000000000BDA58400944A10008C4A
      10008C521800844A1800844208008463420039210800844A10007B4A10007339
      08006B3908006331100000000000000000001084AD008CD6EF0073DEFF0073DE
      FF007BDEFF007BE7FF006BD6FF004AC6EF001094BD00106B8C00215A63003973
      7B0052B5BD00A5E7FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C524A009431
      1800842110002131BD006373D6006B7BDE00314AD600636BB5005A7BF7001021
      73001831CE001029B500001884000000000000000000AD733900B57B3900BD8C
      5200C68C5A00BD7B42004A311800E7AD73009C735200B56B2100AD6B21009C5A
      1800844A10006331080000000000000000001084B50031B5DE00B5F7FF007BE7
      FF007BE7FF007BE7FF007BE7FF007BE7FF0084E7FF0084EFFF007BE7FF0052CE
      EF003163630073D6DE0000000000000000000000000000000000B5EFFF0073D6
      EF006BC6DE006BC6D6006BBDD6006BBDD6006BC6DE007BD6EF007BE7FF000000
      000000000000000000000000000000000000000000007B524A008C2918008421
      100084211000522963007384E700737BDE00212973008C9CFF006B84EF005263
      B5001829D6001029B50000218C00000000000000000094633900CE9C6300DEB5
      8C00D6AD7B00C6844200BD9C7300EFC68C00D69C63005A422100C6843100B573
      2900945218006B3108000000000000000000108CBD0039BDEF00EFFFFF0084EF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF0084E7
      FF00188CAD002139520000000000000000000000000039A5D60073737B00635A
      63008C6B6B00A5737300A5737300A57373006B5A5A0042525A00396B73006BBD
      CE00188CAD00000000000000000000000000297B9C008C2918008C2918008C31
      18009431210094392100215A94002942DE00185A84004AADD60031ADE700085A
      8400082973000021A5009C312100000000000000000000000000C6945200DEB5
      8400D6A56B0052422900EFC68C00EFBD8C00DEA57300BD946B00BD732100AD63
      21008C4A100029296B0000000000000000001894BD0052C6F7008CCEE7008CF7
      FF0094F7FF0094F7FF0094FFFF008CF7FF0084EFFF008CF7FF0094FFFF007BE7
      FF008CEFF700292121002121210000000000107BA5008C7B7B00F7E7E700F7DE
      DE00FFE7E700FFEFEF00FFFFFF00FFEFEF00FFEFEF00FFFFFF00D6949400424A
      52005A9CA50029212100212121000000000084312900943118009C392100A542
      2900AD5239009C5A3900086B100000526B0084D6F70084D6F7004ABDEF001094
      D6001084BD003918180031420000D6CEC60000000000000000009C392100C68C
      4200C6843900185A7B0042A5CE004ABDEF0021A5DE000873A500394239009C52
      10005A635A00000000000000000000000000189CCE0063CEFF0039B5E700BDFF
      FF0094FFFF009CFFFF006BD6FF0063CEFF0063C6FF006BD6FF006BCEFF0084EF
      FF00CEFFFF00086384005A52520000000000BDADAD00E7BDBD00AD7B7B00CEB5
      B500A57B7B00BD949400B5848400D69C9C00FFADAD00FFADAD00FFA5A500FFD6
      D6006352520000213100292929004A4242009C311800A5422100AD4A3100BD5A
      3900C6634A0084733900080808006BCEF70094DEF70094D6F70063C6F700319C
      DE002984BD0010527300002100005A3918000000000000000000000000004221
      1000005A84007BD6F70084D6F70063CEF70031ADE7000894D600108CC6002173
      94002173AD0000000000000000000000000039ADD6006BD6FF0063CEFF00ADDE
      EF00EFFFFF00BDF7FF0094E7FF00B5FFFF00ADEFFF00E7FFFF0084CEFF0073DE
      FF00D6FFFF0084D6EF004A4A4A0042292900E7C6C6008C7394005A73E7008C6B
      7B00DEC6C600D6BDBD00A57B7B00B58C8C00C6ADAD00E7DEDE00B58C8C00C684
      8400FFE7E700FFE7E700FFDEDE0021101000B54A2900BD523100C65A4200D66B
      4A006BA54200184210002929290063B5DE008CD6F70084D6F70052BDEF00399C
      DE00318CBD0021526B00000000003131000000000000000000006B3121000000
      000073CEF7008CDEF70094DEF7007BD6F70042B5EF002194D6002184C6002184
      B500000000000000000000000000000000004AB5D6007BE7FF007BE7FF007BE7
      FF0063BDD6006B9CAD0073C6C600CEEFF700BDFFFF0094FFFF00F7FFFF008CCE
      FF007BD6FF00FFFFFF0018526B00392929004AA5C600737B7B00D6CECE00D6BD
      BD00BD8C6B00D6842900CEB5B5009C636300AD84840084846300B58C8C00C68C
      8C00CE8C8C00FFB5B500B57B7B0039212100CE633900D66B4A00DE7B5A0063C6
      390039E7100029211800393939004273840073CEF70063C6F7004AB5EF004AAD
      E7004AA5CE000818210000000000214A00000000000000000000101010001010
      100073CEF70094DEF70094D6F70073CEF7004AB5EF00399CD6002984BD003994
      BD00000000000010100000000000000000006BC6E7008CF7FF008CF7FF008CF7
      FF009CB5B500CEBD9C00FFF7BD00D6E7BD006BC6DE00ADDEF700CEEFFF00EFFF
      FF00B5EFFF00FFFFFF006BC6DE0042313100528C9C00738C9400739494004A7B
      84005A636300736363009C8C8C00BDADAD00DEC6C600C6A5A500F7C6C600D69C
      9C00F7BDBD00A58C8C0063BDDE0000000000D67B4A00E78C6B009CBD63004AD6
      08004AFF0000395A290031313100393939003963730021212100101010000000
      0000295A73000000000000000000393908000000000000000000212121003131
      31006BCEF70084D6F70084D6F7005AC6EF004AB5EF00399CD600398CC600398C
      B500000000000000000000000000000000008CD6EF0094FFFF009CFFFF009CFF
      FF00BDC6C600BDBDB500FFFFEF00FFFFCE00ADA58400D6AD8400F7CE9400DEF7
      EF006B949C00215A6B002984A500735252009CA5AD0063A5A5007BD6D6008CCE
      CE009C9C9C009C9C9400D6D6CE00FFFFCE000000000000000000F7CE9400DEF7
      E7006B949C00000000000000000000000000DE845A00E79C730052DE29007BF7
      39009CFF39009CE742002121210063636300848484007B7B7B004A4A4A000808
      0800000000000000000000290000734231000000000000000000292929003939
      3900529CBD006BCEF7006BC6F70052BDEF004AB5EF004AADDE004AA5D6002952
      6B000000000000000000000000000000000039ADCE00A5FFFF009CFFFF009CFF
      FF00BDCECE00D6C6B500FFFFFF00FFFFE700B5B59C0029292900C6B59400F7EF
      E70084848C00292121004A393100000000006BB5CE00C6C6C600B5BDBD00A5BD
      BD00ADADAD0094948C0084848400EFEFD6000000000000000000000000000000
      000000000000000000000000000000000000AD948400ADAD5A0039DE180084FF
      3900ADFF6300C6FF73007BAD4A003939390084848400737373004A4A4A000808
      08000000000000000000086B00007B5252000000000000000000181818004242
      4200313939004A94AD00213131001010100008080800081821004294B5000000
      0000000000000000000000000000000000000073A500CEEFF700D6FFFF00D6FF
      FF00C6D6CE00CEBDAD00FFFFFF00FFFFF700FFFFE700DEDEBD0063524A00FFFF
      D6008484840039212100735A5A0000000000000000000000000000000000A5C6
      C6009C9C9C009C9C9400BDBDBD00F7F7EF000000000000000000000000000000
      0000000000000000000000000000000000000073A5009CBD520018D6080073F7
      42009CFF5A00CEFF9400FFF7EF00CEB5AD002921210021212100181818000000
      00000831000000B500008C422100000000000000000000000000081008004242
      42005A5A5A006B6B6B006B6B6B004A4A4A002121210000000000000000000000
      0000000000000084000000000000000000000000000000000000E7F7FF00C6E7
      EF00A5D6E700F7F7F700EFD6BD00FFFFFF00FFFFFF00FFFFE700B5B59400C6B5
      94008C8C8C00292110000000000000000000000000000000000000000000D6DE
      DE009CCEDE00F7EFEF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000319CBD008CD6520039F7
      10007BFF5A00D6FFB500FFF7D600BDF78C0063FF52007BFF3900FF843100FF5A
      0800DE3900005A520000000000000000000000000000000000006BA539002929
      2900636363008C8C8C008C8C8C00636363003939390000000000000000000000
      0000100000000000000000000000000000000000000000000000000000000000
      0000000000004A84A500F7F7F700CEB59C00D6D6CE00F7E7CE00BDAD9400B5B5
      B500295A7B006B524A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000528CA500F7CE
      AD00F7DEB500FFDEBD0094F763005AEF52005ADE5A0052F74A00FF7B3100F752
      0800AD4218000000000000000000000000000000000000000000000000007363
      5200313131006B6B6B006B6B6B005A5A5A002929290000000000000000000000
      0000AD4218000000000000000000000000000000000000000000000000000000
      000000000000000000006BCEDE00C6CECE00DEDEDE00CED6D600A5ADAD005AB5
      C60063DEEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDDED600FFDEBD00F7D694009CE74200A5CE4200EF8C3900E76B390073A5
      9C00000000000000000000000000000000000000000000000000000000000000
      000094ADAD0021212100212121002121210008080800000000004A2110000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B59494009C3939006329310000000000000000000000
      0000000000000000000000000000000000006B52310010100800000029004242
      7300947B8400BD9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010100800000021004239
      6B00947B84000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B52310018100800100818003931
      5200735A5A0094736B008C6B6B007B3129005221210018213100293142001008
      4200C6BDB500CECECE00F7F7F700FFFFFF000000000000000000000000000000
      0000DED6D600B55A5A00E79C9C00EFADA500ADA5A500AD847B0084426B000000
      0000000000000000000000000000000000005A393100D69C9C00D69C9C00846B
      6B00525252005A2929009C6B6B00CE8C8C00A5949400AD847B0084426B000000
      00000000000000000000000000000000000052393100734A42006B3939004229
      2900211818004A292900000000000000000000000000AD7B7B007B426B005A73
      F700FFFFFF000000000000000000000000004A3129009CCEEF0021ADD60029B5
      DE0031BDDE0039C6E70042CEE70052D6EF005AD6EF0063DEEF006BE7F70073EF
      F70084F7FF0063524A00B5B5B500F7F7F7000000000000000000E7E7E700C673
      7300E7BDB500EFBDBD00EFB5AD00EF948C00B57B7B00BD949400C68C8C009CAD
      8400FFFFFF00000000000000000000000000D6CECE00E7AD9C00FFCE9C00FFCE
      9C00F7BD9C00E7AD9C00D6A59C00A57373005A393900523939007B525A007B8C
      6B00E7E7E700FFFFFF00FFFFFF0000000000AD5A5A00B5636300C6737300EF8C
      8C00C68484004A393100CE9C9400000000005239390029212100292929002929
      21005A5A5A00E7E7E7000000000000000000187BAD009CFFFF0021A5CE006BE7
      F7006BE7F7006BE7F7006BE7F7006BE7F7006BE7F7006BE7F7006BE7F7006BE7
      F7006BE7F700ADE7FF00736B6B00E7E7E700CECECE00BD848C00DEBDB500EFD6
      D600EFC6C600EF949400EF7B7B00EFA59C00BD737300BD4A4200BD736B00CE84
      840084948C00DEDEDE00FFFFFF0000000000CECECE00FFCE9C00E7AD9C00FFE7
      AD00FFDEAD00FFD6A500FFCE9C00FFCE9C00F7BD9C00E7B59C00D6A59C00AD84
      84005A524A005A5A5A00ADADAD00FFFFFF007B4242009C5A5A008C4A4A007339
      3900DE84840073424200CEAD7B00F7C6940063636300C6C6C600BDBDBD00DEDE
      DE006B6B6B00181818009C9C9C0000000000187BAD009CFFFF00187BA500BDFF
      FF00B5FFFF00B5FFFF00B5FFFF00ADFFFF00ADFFFF00ADFFFF00A5FFFF00A5FF
      FF00A5FFFF007BE7EF00636B7300F7F7F700BD4A4A00EFEFEF00EFCECE00EF8C
      8C00EF9C9C00EFBDBD00EFADAD00EFA5A500BD524A00C6636300CE737300C652
      52005AC6730031944A00DEDEDE0000000000BD4A4A00FFE7B500FFDEAD00D6A5
      9C00FFF7C600FFEFBD00FFEFB500FFE7AD00FFDEAD00FFD6A500FFCE9C00FFCE
      9C00F7BD9C00CE9C9C0073737300FFFFFF00DE848400FFA5A500F7949400A55A
      5A008C4A4A00D67B7B00CEB58C004A4A420094949400B5B5B500CECECE00BDBD
      BD00DEDEDE007373730029292900FFFFFF00187BAD009CFFFF00C6FFFF00C6FF
      FF00C6FFFF00BDFFFF005AD6EF004AB5CE0039C6E7005AD6EF00B5FFFF00B5FF
      FF00ADFFFF00315A7B0029292900FFFFFF00B54A4A00EF8C8C00EFC6C600EFD6
      D600EFC6C600EFBDB500EFADAD00EFA5A500C6524A00EF7B7300EF737300CE5A
      52004AC66B0042BD6300C6C6C60000000000B54A4A00FFFFCE00FFF7C600FFEF
      BD00EFD6BD00FFFFCE00FFFFCE00FFFFCE00FFF7C600FFEFBD00FFEFB500FFE7
      AD00D6A59C00E7B59C0063636300FFFFFF00E78C8C00FFEFEF00FFADAD00C673
      73006B313100AD636300E7E7B500525252006B6B6B0084636300524A4A00CECE
      CE00BDBDBD00F7F7F70029292900E7E7E700187BAD009CFFFF00D6FFFF00D6FF
      FF00CEFFFF0094949400948C8C0094948400A5949400EFC6C60042BDD600BDFF
      FF00BDFFFF006B5A52002929210000000000BD525200EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDB500EFADAD00EFA5A500CE4A4A00C6524A00EF7B7300D652
      4A0052C67300319C52005A393900B5ADAD00BD525200FFFFD600FFFFD600FFFF
      CE00F7EFC600FFFFDE00FFFFDE00FFFFDE00FFFFD600FFFFCE00FFFFCE00DEBD
      AD00FFD69C00FFCE9C0029212100ADADAD0000000000E7848400FFA5A500BD6B
      6B007B3939005A393900106394004A4A4A00524A4A00736B6B00947373005A4A
      4A00D6D6D600B5B5B500737373006B6B6B00187BAD0094FFFF00DEFFFF00DEFF
      FF00ADADAD00EFDEAD00FFF7DE00FFEFCE00FFFFFF00F7E7BD00F7C6C6004ACE
      E700C6FFFF005A4A4200736B6B0000000000BD525200EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDB500EFADAD00EFA5A500CE4A4200D65A5A00E76B6B00D64A
      4A005ACE7B0039B55A00849C8400734A4A00CE7B7B00FFFFDE00FFFFDE00FFFF
      DE00FFFFD600DEB5AD00FFFFF700FFFFEF00FFFFE700FFFFE700EFDEC600FFEF
      BD00FFEFB500FFE7AD0042524200734A4A00000000000000000000000000F7E7
      C600B56B6B00294A6300399CFF0042424200636363009C9C9C007B7B7B009473
      7300B5B5B500A5A5A500A5A5A50042292900107BAD007BEFF700EFFFFF00ADB5
      B500DEC6A500FFF7BD00FFEFBD00FFEFB500FFDEAD00FFFFF700B5B59C007384
      8C00D6FFFF00524239009C9C9C0000000000B5525200EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDB500EFADAD00EFA5A500CE423900E7737300F77B7300D64A
      420063CE7B0039AD5A0084635A006B4A4A00BD7B7B00FFFFEF00FFFFE700FFFF
      DE00C6ADAD00ADF7FF00B5B5BD00E7C6C600F7E7E700EFDED600FFF7CE00FFFF
      CE00FFFFCE00FFFFC600423131006B4A4A000000000000000000000000000000
      0000FFA5A500217394008CEFFF003131310031313100CECECE009C9C9C006B63
      630094949400ADADAD00A5A5A5004A313100107BAD0063DEEF00F7FFFF00B5B5
      B500FFEFBD00FFFFD600FFFFCE009C846300DEBD9400FFD69C00FFEFC600CEAD
      AD00CEFFFF005A4239009C9C9C0000000000B5525200EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDB500EFADAD00EFA5A500F7393900F7423900E7393100DE42
      390052C6730039AD5A00946B6B007B5A5200CE949400FFFFF700DEB5AD00B5F7
      FF00F7FFFF00F7FFFF00EFFFFF00E7FFFF00C6F7FF00BDF7FF0094C6DE00FFFF
      D600FFFFD600FFFFD6004A3939007B5A5200000000000000000000000000B5E7
      EF00DE8C8C00ADC6CE0084DEE7006BBDCE003939390042424200737373003939
      39007B7B7B00949494004A4A4A0073524A00087BA50052CEE700FFFFFF00CECE
      CE00FFE7CE00FFFFFF00FFFFDE009C9C84007B6B5200FFE7B500F7E7BD00AD9C
      9C00EFFFFF00523931004A42420000000000BD524A00EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDBD00EFBDBD00F7D6D600FF9C9400F74A4200F7393100F742
      39006BCE840039AD5A00A57B7B007B525200BD636300CE9C9C00ADCEDE00FFFF
      FF00FFFFFF00FFFFFF00F7FFFF00EFFFFF00EFFFFF00E7FFFF00DEFFFF0094C6
      DE00FFFFDE00FFFFDE00524242007B525200000000000000000000000000D6A5
      A500BD6B6B00E7E7E700633939004AB5DE0021425A00393939004A4A4A005252
      5200636363007373730031292900000000000873A50039C6E700FFFFFF00D6D6
      D600C6BDB500FFFFFF00FFFFF700FFFFDE00E7E7B5007B6B520094948C00739C
      A500F7FFFF00423129003129290000000000C6635A00EFEFEF00EFCECE00EFBD
      BD00F7BDB500F7BDB500F7BDB500F7BDB500FFBDB500F7BDBD00DEADA500D642
      420039BD630039B55A009C7373007B52520000000000DECECE009CEFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00B5DEF7008CC6EF006BAD
      E7008CA5D600FFFFE700523939007B525200000000000000000000000000B56B
      6B007B525200A55A5A008C4242006B737300000000008CADB500393939004242
      420042424200ADA59C0000000000000000000873A50021B5DE00FFFFFF00FFFF
      FF00CECECE00BDAD9C00FFFFFF00A5CEFF00FFFFCE00D6C6A5009C9C9C00FFFF
      FF00FFFFFF005A4239004A39310000000000B5ADA5008C5A5A00BD737300D66B
      6300E7737300DE6B6300C66B5A00AD735A00A59C8400ADD6B500B5E7BD0084D6
      9C0052C6730039B55A00A57B7B007B5252000000000000000000BD7B7B0063B5
      FF0052B5FF0073CEFF0094DEFF0094D6FF0094CEFF008CC6FF0084BDFF0094B5
      E700A5A5CE00C69C9C007B635A0000000000000000000000000000000000D694
      9400A5525200CE636300AD5252007BB5DE000000000000000000000000000000
      0000000000000000000000000000000000000073A50010A5D600FFFFFF00FFFF
      FF00FFFFFF00ADADAD00EFEFEF00D6D6D600D6D6D600A5A5A500FFFFFF00FFFF
      FF00FFFFFF0063423900735A5A0000000000000000000000000000000000B5E7
      BD0094DEA5008CDEA5008CD69C008CD69C008CDEA5008CD69C007BD6940042C6
      630031844200425A3900AD6363007B525200000000000000000000000000B5D6
      B500A5E7EF0094EFFF0094E7FF0094DEFF0094D6FF0094CEFF008CC6FF008CC6
      FF00BD949C0042523900000000000000000000000000000000009C9C9C00EFB5
      B50084424200AD5252008CB5CE00000000000000000000000000000000000000
      000000000000000000000000000000000000006BA500009CCE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00312918009C5A5A0000000000000000000000000000000000DEE7
      EF00CED6A500526B4A005A9C6B00528C63007B9C7B00A5A59C00CEBDBD00DECE
      CE00E7DEDE00EFCECE00DE9C9C007B4A4A000000000000000000000000000000
      0000CEC6A500A5EFEF0094F7FF0094EFFF0094E7FF0094D6FF00A5BDDE00B59C
      9C00E7DEDE000000000000000000000000000000000000000000EFD6D600BD7B
      7B006B4239009CE7E70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006BA500009CCE00297BAD00297B
      AD00297BAD00297BAD00297BAD00297BAD00297BAD00297BAD00297BAD00297B
      AD00297BAD006B524A00CE949400000000000000000000000000000000000000
      000000000000848484009C848400C69C9C00D6ADAD00D6ADAD00C69C9C009C73
      73008C6B6B0094848400B5ADAD00E7E7E7000000000000000000000000000000
      0000000000008C848400ADD6D6009CF7FF0094EFFF00C69C9C00B59494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001073A50000639C0063DEEF0063DE
      EF0063DEEF0063DEEF0063DEEF0063DEEF0063DEEF0063DEEF0063DEEF0063DE
      EF0063DEEF006B5A5A00ADA5A500000000006B52310021181000080000000808
      0800000800000818180000000000000000000000000000000000394A52001808
      08002910100042424A00293139005A5A52000000000000000000000031000000
      630000005200001031000018390000294A0000214A0010214200293952000000
      630000004A000808080000000000000000000000000000000000000000000000
      000008085A00847394009C848C00BD9C9C00BD9C9C009C848C00737384000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A393100C6A5A500C6A5A500C69C
      9C003931310018393900000000000000000000000000000000004A424200C6A5
      A500C6A5A500C69C9C00422929001829290000000000000000003952FF006373
      FF005263FF003952FF003952FF00395AFF00425AFF003952FF004A63FF006373
      FF002942FF001010CE0000000000000000000000000000000000CEADAD00DED6
      D600E7E7E700DEDEDE00DEDEDE00DED6D600DECECE00D6CECE00C6ADAD00CEA5
      A500C69C9C004A63FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6CECE00F7F7F700CEADAD00AD84
      8400CE9C9C00BDCED60000000000000000000000000000000000D6CECE00F7F7
      F700CEADAD00AD848400CE9C9C004229210000000000000000004239DE000000
      FF000008F7000000B5000818BD002939CE001829C6000000AD000000CE000000
      BD0000006300A57B8400000000000000000000000000EFE7E700D6C6C600EFEF
      EF00F7F7F700EFEFEF00EFEFEF00DEDEDE00DED6D600D6ADAD00CEA5A500CEA5
      A500B58C8C00BD8C8C001818D600000000000000000000000000000000000000
      00000000000000000000CEB5B500947B7B00BD94940000000000000000000000
      000000000000000000000000000000000000CECECE00DE947300DE947300CE6B
      6B004A636300A5CEDE00B5BDC6007384840063635A00A5A59400BDCECE00DE94
      7300DE947300CE6B6B0052525200392921000000000000000000000000005229
      73003142DE004A4A84005A5A5A000000000084847B0039394A00525AB5000808
      A500CE8C730000000000000000000000000000000000CEADAD00D6C6C600F7F7
      F700FFFFFF00F7F7F700EFEFEF00DEDEDE00CEA5A500CE8C8C00CE8C8C00CE8C
      8C00B58C8C00BD8C940000000000000000000000000000000000000000000000
      0000E7E7E700636363008C8C8C007373730039292900736363004A52A5000000
      0000000000000000000000000000000000007394A500FFB53100FFBD4200FFBD
      4A00DE947300212121002121210021ADDE00186B84002121210042424200FFB5
      3100FFBD4200FFBD4A00DE9473002118080000000000000000004231A500394A
      DE006B6B6B00F7F7F700EFEFEF00EFEFEF00D6D6D600DEDEDE00ADA5A5004A52
      84000008AD00EFB54A000000000000000000000000000000000000000000DED6
      D600CE949400D6ADAD00E7DEDE00D6BDBD00CE9C9C00CE6B6B00CE6B6B00CE7B
      7B00BD94940000000000000000000000000000000000EFAD3100ADA5A5008C63
      63004A4A4A00F7F7F7008CD6A5009C9C9C00AD9C9C0084737300313129002929
      4A00EFEFEF00000000000000000000000000D6B5B500FFCE6300FFCE6B00FFCE
      6300DE9473009C9C9C009C9C9C0029ADD60029ADD6009C9C9C00D6B5B500FFCE
      6300FFCE6B00FFCE6300DE9473001008000000000000BD948C000821F7009C9C
      9C00FFFFFF00DEDEDE00CECECE00B5B5B500ADADAD00ADADAD00C6C6C600C6C6
      C6003942A500080894000000000000000000000000000000000000000000847B
      D600BD848400FFA51000F7AD6300CE949400C6737300B54A4A00B54A4A00BD7B
      7B0094AD9400B5BDB50000000000000000007B6B6B008C8C8C00636363007373
      7300DEDEDE00E7E7E700D6D6D600CECECE00B5A5A500BD9C9C00C69C9C008463
      6300424242009C9C9C00F7F7F70000000000D6B5B500FFDE8C00FFEFA500FFE7
      9400DE947300A5A5A500000000009C9C9C0021212100ADADB500D6B5B500FFDE
      8C00FFEFA500FFE79400DE94730018080000000000001008F7005263E7008484
      7B00FFFFFF00E7E7E700D6D6D600C6C6C600ADADAD009C9C9C009C9C9C00CECE
      CE008C8C8C000000AD00AD737B0000000000000000000000000000000000CEA5
      A500D69C9400FFB52900FFB53100FFB53100FFB53100D6A55200A58C5A00BD6B
      6B00BDADAD0031B54A002984310000000000DEDEDE00DEDEDE00DEDEDE00EFEF
      EF00E7E7E700E7DED600FFDEB500FFFFFF00F7D6AD00B5ADAD00AD9C9C00D69C
      9C00E79C9C00946363004A4A4A00CECECE00D6B5B500D6B5B500D6C6AD00EFD6
      A500DE947300009C7B00000000009C9C9C009C9C9C004273E700D6B5B500D6B5
      B500D6C6AD00EFD6A500DE94730018080000000000000010FF00CED6F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00B5B5B5009C9C9C00B5B5
      B500DEDEDE000000BD0042298C0000000000000000000000000000000000C69C
      9C00E7A55200FFBD4200FFBD4A00FFC64A00FFC64A005A841800088C1800D6AD
      3900187B10004AE7840031B5520000000000EFEFEF00F7F7F700F7DEC600F7CE
      A500F7EFE700F7E7D600FFDEB500FFFFFF00FFD6A500F7BD7B00EFA55A00AD8C
      6B008C848400EF949400CE848400BDBDBD000000000000000000000000000000
      0000319C4200219C10008C9C9C00847B7B006352630042424A009CA5AD00DEDE
      DE000000000000000000C6BDBD0021100000000000000829FF0063635200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000212121008C8C8C00C6C6
      C600D6D6D60000009C000808A50000000000000000000000000000000000B58C
      8400FFC64A00FFC65A00FFCE6300FFCE6300FFCE6B005A8C2100088C180029C6
      520031CE630039DE73001084180000000000000000001029F70094848400ADAD
      AD00C6C6BD00F7E7D600FFDEB500FFFFFF00FFD6A500F7BD7B00EFA55A00DE8C
      3900C6732100736B5A009C7373009C9C9C000000000000000000000000000000
      000000000000CEBDBD00EFEFEF00E7DEDE00D6CECE00BD9C9C00734A1800EF9C
      210000000000000000000000000000000000000000002139FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00F7F7F700DEDEDE00E7E7
      E700FFFFFF000008BD001810AD0000000000000000004A6BF7008C8C9400948C
      8C00A59C9400AD9C9400BDA5A500A5947B00F7D67B005A942900088C080018B5
      390021BD420000730800B5C6AD00000000000000000000000000000000000000
      0000000000007B7363009C948400A5A5A500DEB59400C69C73006B6B63004A4A
      4A00C6848400EF9C9C00946B6B00FFFFFF000000000000000000000000000000
      00000000000000000000CEBDBD00E7D6D600C68C8C00C68C8C00B57331000000
      00000000000000000000000000000000000000000000425AFF00848CE700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000AD00421873000000000000000000ADADAD00DEC6A500FFF7
      CE00FFEFC600FFF7D600FFFFF700ADA59400D6B5B5005A943900007B00000894
      1000089C180018A53100108C2100EFF7EF000000000000000000000000000000
      0000F7F7EF008C8C7B005A524200212921003131310073636300CE9C9C00CE9C
      9C0084737300FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000CE9C8C00FFAD2100DE947300CE6B6B004A7B84000000
      000000000000000000000000000000000000000000006384FF000818BD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006B6B6B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005263BD000000DE009CA5BD0000000000B5ADAD00F7E7B500FFFFCE00FFFF
      CE00FFFFC600FFEFBD00FFE7B500FFFFF700D6CEAD00BDB59400FFEFAD00FFE7
      9C00FFE79400DEB5B50000000000000000000000000000000000CEC69C00635A
      4A0031313100525252009C9C9C00D6D6D600C6C6C600A59C9C00736B6B00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFBD8400FFC65A00FFCE5A00FFBD4A00426373000000
      000000000000000000000000000000000000000000008CEFFF00637BFF000010
      8C00D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00BDBD
      E7000000C6001818CE000000000000000000C6C6C6008CC6F700FFFFFF00FFFF
      DE00B5A58400423939004A4A4200FFE7C6006384EF00A59C9400FFF7BD00FFEF
      AD00FFE79C00EFDEDE0000000000000000000000000063636300BDBDBD00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00E7E7E70084846B00DEAD8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039BDDE00EFC66B00FFDE8400FFDE8C00FFD67300526B73000000
      00000000000000000000000000000000000000000000000000008CD6FF006B84
      FF00000084009C9CBD00FFFFFF0039393100FFFFFF00FFFFFF00101873000008
      D6000008FF00000000000000000000000000C6CECE00FFF7EF00FFFFFF00FFFF
      EF00FFFFE700ADAD94005A524A00FFFFD600D6C6A500ADA59400E7D6B500FFEF
      AD00FFEFA500ADADC600000000000000000000000000CECECE009C9C9C00A59C
      9C009C525200AD847B008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000639CAD00E7CE8400FFEFAD00FFF7B500FFE79400215A6B000000
      00000000000000000000000000000000000000000000000000000000000094E7
      FF008494FF005A73FF001831DE001029D6000010C6001831F7002942FF001039
      E7000000000000000000000000000000000000000000EFEFEF00E7CEB500FFFF
      FF00FFFFFF00E7F7EF00FFFFCE00B5A58C00ADADAD00C6A5A500BD9C9C00AD84
      8400AD848400314AFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004AC6E7006BBDD600CEADAD00CEADAD00295A39000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A94BD006B9CF7006B84FF006B7BF7008484DE00295A4A000000
      0000000000000000000000000000000000000000000063A5BD00B5BDC600DEDE
      DE00CEC6BD00BDBDB500CECECE009CADB50063ADF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100808001008
      0800000000000800000008080000101010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000080800001821000029310000394A00003942001039420039525A002108
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100808001008
      0800080808000818210000293100003942000031420010313900394A52002108
      1000391818006B637B0031394A005A5A5A004A29080073390800523931008C6B
      6B00AD8C8C00846363004A394200214A5A00428CB500426B8400000000000000
      0000000000000000000000000000000000000000000000000000423931000063
      7300009CB50000B5D60000ADCE00009CBD000094AD00008CAD0000739400005A
      730008394200000000000000000000000000000000005A422100423931000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042313100184A
      520021424200214A4A0021424A00214242002139390021393900213131002129
      2900212118003118100039180800213131006B4A3900DEDEDE00E7E7E700DED6
      D600DECECE00D6B5B500BDA5A500CE9C9C004A393900295A7300000000000000
      000000000000000000000000000000000000000000009CB5BD005AC6DE007BEF
      FF0008DEFF0000B5DE0000ADCE00009CBD00008CAD000084A500008CAD00007B
      9C00006B8C0000394A000000000000000000000000007B949C00397B84003173
      7B0008CEE7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B4A39007394940039737B00A552
      2100DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEF
      EF00DEEFEF00DEEFEF00CECEC6004A312900E7E7E700EFEFEF00EFEFEF00E7E7
      E700DED6D600E7D6D600CEADAD00C69C9C00CE9C9C0039180800213139000000
      00000000000000000000292121004A3939000000000052BDDE008CE7F700219C
      B50000ADDE0000BDF70000BDFF0000A5DE000094C6000084A500006B8400005A
      730000637B00005A6B000000000000000000000000000000000000000000218C
      9C0039737B00186B7B0021BDF70042A5C6005294AD0029849400000000000000
      000000000000000000000000000000000000CECED600428C9C006BA5AD00A552
      2100BDE7F700B5E7F700DEEFEF00DEEFEF00DEDEC600DEDECE00DEEFEF00BDD6
      F700B5CEF700DEEFEF00CECEC60042292100E7DEDE00F7FFFF00FFFFFF00E7E7
      E700D6C6C600D6ADAD00CE949400BD848400CE9C9C00BD845200000000000000
      0000E7B5940084635A0018291800211818000000000021A5C6006BE7FF0094F7
      FF0000F7FF0000D6FF0000A5E700008CB5000084B50000A5D60000ADDE00009C
      BD0000738C0000394A0000000000000000000000000000000000000000000000
      000000000000738C8C00316373009CB5B5009CADAD008CA5A500849C9400529C
      A5000000000000000000000000000000000073ADBD0018ADDE0010738C00A552
      210021D6FF00C6A53900DEEFEF00DEEFEF0063EF4A00FFA52100DEEFEF00425A
      DE005A4A8C00DEEFEF00CECEC600291810008C635A00D6BDB500CE8C9400DEC6
      C600CEA5A500CE737300CE737300BD737300C6843900E7A56B00393129002931
      420031522900108C2900007308000000000000000000108CA500BDFFFF0063FF
      FF0029C6E70010BDDE0000BDE700009CC60000739400006B8400005A6B00007B
      9C000094B50000637B0000000000000000000000000000000000000000000000
      000039BDD60094A5A500B5CECE00316B7B00B5C6C600BDCECE00B5CEC600A5B5
      B500849C9C0000000000000000000000000039738C0084DEFF0073D6FF00A552
      210021D6FF0021CEF700DEEFEF00DEEFEF00FFA52100E7CE9C00DEEFEF00426B
      FF00395AF700DEEFEF00CECEC6001808000000000000BD847300FFA50000FFBD
      5A00DE9C9400C6636300BD5252008C5A5200A59C8C009C633900214A290018A5
      390021AD4200188C29004AB56B0000000000000000006B84840094F7FF007BFF
      FF0052D6EF005AE7FF0021DEFF0000C6F7000073A500005A7B00004A5A000073
      940000849C000073840000000000000000000000000000000000000000000000
      00006BBDCE009CB5B500BDCECE00C6D6D600396B7B009CADAD00C6D6D600BDCE
      CE00A5B5B50073949400000000000000000031738C009CE7FF007BE7FF00A552
      2100CECECE00C6C6CE00D6E7EF00DEEFEF00C6B5BD00CED6DE00DEEFEF00CECE
      CE00C6C6CE00D6E7EF00CECEC600180800008C635A00C6949C00FFAD2100FFB5
      3100FFB52900FFBD4200EF9C5200BD6B6B002931290031C65A00189C39004ADE
      7B00106310007352520000000000000000000000000000000000C6AD4A004294
      940000CEF70084D6E7005AE7FF0008D6FF000084B500005A7B00005A73000073
      8C00086B4A000000000000000000000000000000000000000000000000000000
      00004AB5C6009CB5B500BDCECE00C6D6D600C6D6D600316B7B00A5B5B500C6D6
      D600BDCECE0094ADAD0073525200000000001884AD00A5EFFF0084EFFF00A552
      210021A5210000AD8C00DEEFEF00DEEFEF00AD6373004A84FF00DEEFEF00D6D6
      D6009C8C9400DEEFEF00CECEC6002110000084635200CE9C8400FFBD4200FFBD
      4A00FFC64A00FF9C0000E78400005A42210021CE520031B5520063E78400527B
      4200E79C5A000000000000000000000000000000000000000000000000000000
      000000000000BDA55A006BEFFF0018D6FF000073A500004A6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6B56B009CADAD00BDCECE00BDCECE00C6D6D600D6E7E700316B7B00C6DE
      DE00D6EFEF00B5CECE006B737300000000004294B500C6F7FF008CF7FF00A552
      210021A5390021A51800DEEFEF00DEEFEF005263D600B5B5C600DEEFEF00DEDE
      DE008C8CB500DEEFEF00CECEC600211000008C6B6300D69C6300FFC65A00FFCE
      6300DE840800C6843900FFEFD600EFC69C00D6DED60021732100393918007B52
      2900000000000000000000000000000000000000000000000000000000000000
      000000000000C6844A007BEFFF0018DEFF00008CB50000525A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094A5A500B5C6C600CEDEDE00BDCECE00C6DEDE00B5C6C600426B
      7300CEDEDE00BDCED60094ADB5000000000029ADDE00BDF7FF0094FFFF00C65A
      0000F7A52100F7A52100F7A52100F7A52100F7A52100F7A52100F7A52100F7A5
      2100F7A52100F7A52100DEA5630018081800AD949400F7BD6300FFD66B00D6B5
      52001884C600005A9400B5845200FFDE9C00B5845200734A3100293129000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000085A94001894AD00005A7B00004A6B00214A5200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000427B94009CADAD00BDCECE00CEDEDE00CEE7E700C6D6CE007394
      94009CADAD00C6D6D600ADBDBD00000000005AC6E700ADE7F7009CFFFF00AD52
      2100E7944200E7944200E7944200E7944200E7944200E7944200E7944200E794
      4200E7944200E7944200A539000010080800D6C6C600FFD66B00FFDE840063B5
      CE0063CEFF007BE7FF0042ADDE007B8C6B00E7AD730084522900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000C6EF0000B5DE000094C600006B9C0000426B00184242000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000739C9C009CB5B500B5C6C600CEDEDE00DEF7F700D6DE
      DE00316B7B00BDCECE00ADBDC6000000000063C6E70073CEE700D6FFFF00C6FF
      FF00BDFFFF00BDFFFF00BDFFFF00BDFFFF00BDFFFF00BDFFFF0094E7FF0031B5
      DE00314A5200B5BDBD00ADB5B50008000000CEC6C600FFDE7B00FFE79400FFF7
      A50094B5A5002994C60063BDE700FFE78C00CE947B00945A3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007BBDB50000DEFF0000E7FF0000C6F700009CCE00005A8C00004A6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000738C94009CADAD00B5BDBD00C6D6CE00BDCE
      CE007B7373006B736B009C5A5A0000000000A5DEF7008CF7FF007BEFFF004ACE
      E70018ADD600EFFFFF00D6FFFF00D6FFFF00D6FFFF00D6FFFF009CE7FF0073CE
      E7004A524A006B6B6B000000000000000000ADA5A500AD9C8C00CEBD9400F7EF
      B500FFFFCE00FFFFCE00FFEFB500FFE79C00AD737300A55A2900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEF7D60029E7FF0042EFFF0018EFFF0000B5F7000073AD00005273000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000739CA5008C9C9C0094A5A5003142
      5A008C8C8C00427B7B00A5B5B50000000000ADDEF7009CFFFF009CFFFF009CFF
      FF009CFFFF0039BDDE0039B5DE007BCEE700BDE7F700FFFFFF00C6EFFF00BDE7
      F7005A5A5A0042737B000000000000000000A5A5A500CEC6C600D6CECE00BDA5
      A500AD8C8C00AD848400BD9C8C00E7C694009C6B6300B5520000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A58C8C0063E7FF00A5F7FF0039E7FF0000B5F700007BBD00085A73000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001884B500738C94002942
      520084949400638484007B8C7B0000000000429CBD00A5FFFF009CFFFF009CFF
      FF00D6FFFF004AA5C6007BCEE700B5E7F700DEFFFF00C6FFFF0052C6E700106B
      8400738C8C0063847B0000000000000000000000000000000000000000000000
      00005A737B0073848C00A5949400C6A5A500A5847300CE9C5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000052A5B50039D6FF0008C6FF0000A5DE000894AD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000424A
      5A00B59C9C00C6B5B5000000000000000000B58C5A004AA5C60073C6E7009CDE
      EF00399CC6004A949C0039D6F70008C6F700009CD600108CA500396B4A00424A
      5A00B59C9C000000000000000000000000000000000000000000000000000000
      00000000000008000000000000005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000010080800181810005A525200635A5A0063635A00636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000808000008080800101010002118180042423900636363000000
      0000000000000000000000000000000000000000000029181000100808001008
      0800000000000808000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5848400AD5A210073392900080000001808000031180000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C7B7B009C735200AD9C9400A5948C006352420042291800392108003921
      000000000000000000000000000000000000000000000000000000000000735A
      5A003163A5004284B5004A8CB5005AC6FF0063C6FF0042738400100800003118
      0000000000000000000000000000000000004A2908009C521000633110002929
      29001021390021425A003163840052ADE7005AC6F70042738400000000000000
      000000000000000000000000000000000000000000000000000000000000B5AD
      AD00D65A1000FF6B3100FF8C1000FFA531004A312900212121006B6B6B000000
      000000000000000000000000000000000000000000000000000000000000B5AD
      AD00C67B4A00D6DECE0073A56300FFD6AD00EFC6AD00948C7B00635A52003921
      0800000000000000000000000000000000000000000000000000000000004A5A
      7B003173C6005A5A5A00528C9C0052B5FF0063C6F70063C6FF0063C6F7001008
      0000A59C9C0000000000000000000000000052311800B55A1000C67B4A00D68C
      6300AD4208007B310800422921002131420029526300397B9C0052A5CE001008
      000000000000000000000000000000000000BDB5B500636363006B6B6B00EF84
      1000C65A3100D6731800FF732100FF9C0000FFBD5A00734A3900292929001008
      000010080800424242002921210000000000000000000000000000000000E784
      1000EFE7CE00A5BD8C0029843100BDBDB5001052FF00EFE7CE00392921001810
      0000000000000000000000000000000000000000000000000000000000005A52
      5A003173C6004AADFF0052A5FF0084C6EF006B9CB5006373730063B5CE00314A
      5A0010080800000000000000000000000000BDB5B500CE6B1000CE846300FFE7
      C600FFE7C600FFE7BD00EFB58C00C67339009C31000063311000213139002942
      4A00000000000000000000000000000000008C525200FFF7E700F7EFE700F7EF
      DE00F7EFDE00F7EFD600F7DEAD00FF841000FFA52900FFC68400CEAD9400FFCE
      AD00FFCEAD00AD7B7B003931310000000000000000000000000000000000E7DE
      CE00DEB573004A944A0039735A007B9494002173FF00DE945A00634A3900EFBD
      9C00000000000000000000000000000000000000000000000000000000005A6B
      84003173C6006B846B0094B5940063847B00427BA5004AADFF0084ADEF00425A
      6300EFBD9C000000000000000000000000008C525200CE6B1800DEAD8C00FFE7
      CE00FFE7C600FFDEBD00FFDEB500FFD6B500FFC67300E7A56B0042312900394A
      52000000000000000000000000000000000094635A00FFF7EF00FFF7EF00F7F7
      E700F7EFE700F7EFDE00F7EFDE00F7DEAD00FF9C0000FFB55200FFD69C00FFEF
      BD00E7CEAD00AD7B7B005A424200000000000000000000000000F7F7EF00DED6
      CE00FFCE9C0021842900217384006B8C7300298CFF00526BD600846B5A00D6C6
      9C00E7CEAD000000000000000000000000000000000000000000000000005A63
      6B00317BCE006B846B00ADCE9C009CD6A500B5E7B500C6FFC6009CBD9C003952
      6300D6BDA5000000000000000000000000008C5A5200CE732100E7B59C00FFEF
      D600FFE7CE004AADCE00FFE7BD00FFDEB500FFAD3900E7A56B0042312900394A
      5A00000000000000000000000000000000009C6B6300FFFFF700FFF7F700FFF7
      EF00EFEFE700EFE7DE00EFE7DE00EFE7D600F7BD6B00FFA52100FFC67B00F7CE
      9C00EFE7C600AD7B7B0052CE7B00000000000000000000000000FFF7EF00DED6
      CE00BDD6B500298C29001894BD004A949C003994FF001052FF00BDB5AD00BD9C
      7300EFDEC6000000000000000000000000000000000000000000000000005A6B
      7B00317BCE006B846B00B5D6AD006B9C73007BAD840094C6940094BD94003952
      6300DECEB5000000000000000000000000008C635A00CE6B2100EFCEBD00FFEF
      DE00ADD6D60018A5CE00E7DEC600FFC67B00C6BDAD00DE945200313129002939
      4A00D6C6AD00000000000000000000000000AD7B6B00FFFFFF00FFFFF700FFF7
      F700FFF7F700FFF7F700FFF7F700E7D6AD00FF732100FF940000FFB54A00B57B
      5A00F7E7CE00AD7B7B007B525200000000000000000000000000FFF7F700E7E7
      DE00B5D6B500BDD69C008CE7DE008CB5AD00EFE7BD00CEB59C00CED6EF007B52
      4200EFDEC6000000000000000000000000000000000000000000000000005A5A
      6300397BCE006B846B00BDE7B5006B9C6B006B9C6B006B9C6B0084AD8400314A
      5A00DECEBD000000000000000000000000008C635A00CE6B2100FFEFE700B5D6
      DE0039ADCE00FFEFD60042ADCE00E7CEB5007B7B5200FFDEAD00E78C39006339
      08005A5A52007B5A52007352520008000000BD847300FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF00F7F7E700F7EFE700F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7E7D600AD7B7B008C636300000000000000000000000000FFFFF700DEB5
      8C0039BD5A000063000000CEFF00186B8C00DE9C6300084AFF008494C6008C7B
      7300EFDECE000000000000000000000000000000000000000000000000005A63
      6B003984CE006B846B00C6F7C600ADD6A50094CE9C00A5D6A5008CAD8C00314A
      6300DECEBD0000000000000000000000000084635200CE6B2100FFF7EF00FFF7
      EF00FFF7E700FFF7DE00009CCE00FFEFCE00FFDEBD00D6843100FFD6B500FFE7
      BD00EFA55A00845221003121290000000000C6947B00FFFFFF00D65A3900CE7B
      6B00CEA59C00E7DED600EFEFEF00EFEFE700EFEFE700EFEFE700F7EFE700F7EF
      DE00F7EFDE00AD7B7B00946B6B00000000000000000000000000D65A3900CEAD
      8400AD4A4A005252210000D6FF00007BAD00EFC68C003173EF000018CE007363
      5A00E7D6CE000000000000000000000000000000000000000000000000005A6B
      73003984CE006B846B00CEFFCE00C6F7C6008CBD8C0094CE9C0084AD8400314A
      5A00D6C6BD00000000000000000000000000846B5A00C6630800FFFFFF00FFFF
      F700FFF7EF00FFF7E7007BC6D600DEDED600FFE7CE00D68452004A3921007B52
      2900F7B57B00E7EFF700084AD60000003100D6A57B00FFFFF700FF7B1800FF6B
      2900DE4A2100CEAD9C00FFFFFF00FFFFF700FFF7F700FFF7EF00FFF7E700735A
      73009C94B500AD7B7B008C636300000000000000000000000000FF7B1800BD6B
      4A00B55A5200D6A5630000D6FF00008CBD00EFDEC600639CF7000042FF003921
      3900847B9C00AD7B7B0000000000000000000000000000000000000000005A5A
      6B0042A5FF0073847300DEFFDE00CEFFCE0094C694008CBD8C007BA57B002942
      5A007B738C00000000000000000000000000846B5A00C65A0000FFFFFF00FFFF
      FF00FFFFF700FFF7EF00FFF7E70018A5CE00FFEFD600D68C5200293129002942
      5200000000009473730018219C0008000800DEAD8400FFCE9400FFAD3100FF9C
      0800FF841000C68C7300FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7EF00427B
      E7006394E700AD7B7B00946B6B00000000000000000000000000F7A53100CEAD
      9400CE7352006342310039CEDE00008CBD00847B7300D6CEC6002163FF003139
      9400527BB500AD7B7B0000000000000000000000000000000000000000005A6B
      7B004AA5FF007B8C7B00E7FFE700DEFFDE00CEFFCE0084B58400739C73002942
      63005273AD000000000000000000000000007B635200BD4A0000FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7EF0031ADD600FFEFDE00CE7B4200293129002942
      5A0000000000000000000000000000000000EFB58C00FFAD3900FFFFFF00FFC6
      7B00FFB54A00FFA51800D6AD9C00F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7
      E700E7E7E700AD7B7B00A55A5A000000000000000000FFAD3900DED6D600DEB5
      B500DEAD8C007B4A100094ADBD006BA5C600948C8C00E7DEDE00DED6D6007B6B
      7300948C8400A57B730000000000000000000000000000000000000000006373
      84004AADFF008C948C00F7FFF700E7FFE700D6FFD60073A57B006B946B00314A
      63008C7B7B000000000000000000000000008C736300BD520000C6845A00E7C6
      B500FFFFFF00FFFFFF00FFFFFF00FFFFEF00FFF7E700CE7B4200293129002942
      5A0000000000000000000000000000000000000000000000000000000000F7C6
      8400FFDEA500FFCE8C00FFBD6300844A3100BD5A5200CE7342008C523900E7DE
      DE000000000000000000000000000000000000000000DEBD8400C6AD8C00C684
      8400C673730084634A00D6AD7300ADD6F700944A4200CE734200E7D6D600C67B
      7B007B635A00DECEC60000000000000000000000000000000000000000005A63
      730052ADFF0039526B0073847300ADC6AD00D6F7D6006B9C6B00638C6300314A
      6300735A5200000000000000000000000000847B7300C65A0000C65A0000C65A
      0000C65A0000BD520000B54A0000C67B4A00D6A58C00C6733100213129003142
      5A00000000000000000000000000000000000000000000000000000000000000
      0000BD8C7300FFEFBD00FFE7AD00FFD69C00D6844A00BD521000B59494000000
      00000000000000000000000000000000000000000000EFE7E7007B94BD001829
      84001842A5008C7B6B00F7D6A5004AC6FF00C67B4A00BD521000E7DED600AD7B
      73006B524A00CEB5A50000000000000000000000000000000000000000003952
      7B0052B5FF002173F7003163C600425A94002984FF002984EF003163A500314A
      6300634A42000000000000000000000000009C9C9C00BDB59400DEC69400F7BD
      7300E7943900CE6B1000C65A0000C65A0000CE630000CE630000182939003142
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEB58C00FFF7C600DEA573005A636300000000000000
      000000000000000000000000000000000000BD8C5A0073849400317BD600214A
      B5002173D6007B6B6B00D6AD8C00FFF7C600DEA573000000000073A59C00CE8C
      6B00BD9C9C00DEBDBD0000000000000000000000000000000000000000002142
      8C005A8C940073CEDE005AADD600428CD6003184EF00395A42005ACE8400424A
      5A00BD9C9C000000000000000000000000000000000000000000000000002142
      8C004A737B004A7B840063737B008C8C7B00BDB58C00D6A5630039734A00424A
      5A00000000000000000000000000000000000000000000000000000000000000
      000008000000080808000808000063635A0063635A0063636300636363002108
      1000000000000000000000000000000000000000000031211000181008001810
      1000000000000800000008080000635A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000181008001808
      10000000000008000000000800005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7D6D600FFEF
      EF00EFDED6005A524A007B6B520073635200736352007B6B5A00736B6300635A
      5A002118100000000000000000000000000000000000CE949C00F7C6AD00FFBD
      9C00EF8C5A00AD6339007B42290031212100392929005A524200635A5200635A
      5A00000000000000000000000000000000004A29080042210800392108003921
      0800392108003921080039210000392100003921000039210000392100003921
      00000000000000000000000000000000000000000000392100004A292900846B
      6300BD9494009C7373005A393900181008002110000039180000000000000000
      000000000000000000000000000000000000CEA5A500EFF7F700CED6D600BDB5
      B5008C5A2100D66B1800D66B5200D66B5200DE735A00B5521800633110005A42
      3900ADA5A50042393900000000000000000000000000CE949C00F7FFF700C6F7
      C600A5EFAD00ADEFAD009CEF9400E7DEAD00F7C69400F7946300843921004A39
      310000000000000000000000000000000000522908004A290800848484008484
      84007B7B7B007B7B7B007B7B7B007373730073737300737373006B6B6B003921
      00000000000000000000000000000000000052311800DED6D600DEDEDE00DED6
      D600DECECE00C6A5A500B5848400D6ADAD00A5737300313131006B6B6B000000
      000000000000000000000000000000000000C6B5B500636B7B00424A5A00EFA5
      3900AD4A2100A539100073633900A5390800AD421800B5522900CE634A00AD52
      210042292100ADADA500312929000000000000000000CE949C00B5EFBD00A5E7
      A500DEBD6300DEAD5A00EFBD5A00FFD68C00EFDE9C00ADE78400735221006331
      1000312118009C9C9400000000000000000052310800522908009C9C9C009494
      9400949494008C8C8C008C8C8C005A4229005A423100737373006B6B6B003921
      000000000000000000000000000000000000DED6D600EFEFEF00EFEFEF00E7E7
      E700DED6D600DECECE00A58C8C00A58C8C00CEA5A500634A4A006B6B6B003118
      0000291810009C94940000000000000000007BA5C6000863B500AD9463009C31
      00009C310000A539000029630800844A0000A53900009C3100009C391000B552
      2900AD5229007B6B5A00635A5A000000000000000000CE949400ADEFAD00ADEF
      AD00DEAD5200DE9C6300C6944A00CE8C5200BD8C4200C6943900D6843900EFB5
      7300DEAD6B009C7B4A0052525200000000005A3108005A310800ADADAD00ADAD
      AD00ADADAD00A5A5A50084736B007B522100633910007B7B7B00737373003921
      000000000000000000000000000000000000E7DEDE00F7F7F700FFFFFF00EFEF
      EF00DEDEDE00DEC6C600B5848400B57B7B00CEA5A5006B52520052424200CE9C
      9C008C73730031291800424242003129210084FFFF004A5A63009C390000AD42
      0000BD520000C65A000063630000006B0000B55A00007BF7FF009C390000844A
      1800A5635200422110007B7373000000000000000000C6949400C6F7C600E7EF
      BD00EFAD5A00E7A55A00CE9C4A00CE9C4200B5943100B5943900BD6B3100CE8C
      6B00C6846300C6945A007B736B00000000006339080063390800C6C6C600C6C6
      C600C6C6C600948C840084522100B57331009C63290042290800737373003921
      0000000000000000000000000000000000006B421800EFE7E700BD737300DECE
      CE00CEADAD00CE949400C6737300C66B6B00C6949400D6BDBD00DEBDBD00D6B5
      B500ADA5A500ADA5A5006B525200000000006BEFFF0052EFFF0031CEEF00B55A
      0000CE630000D66B000000840800008400007BF7FF005AEFFF0031DEFF004A52
      3100636331008C3910006B5A52000800000000000000CE949400EFFFEF00FFD6
      AD00EFB55A00E7AD5200C6A53900C69C3900C69C3900CE9C4200C6733100D69C
      6B00DE9C6B006B4221006B5A5200000000006B3908006B390800D6D6D600D6D6
      D6008473630084522100C67B3900B59C8400C68C5A00946329005A5242003921
      0000000000000000000000000000000000000000000094634A00FF9C1000FFC6
      6B00DEADAD00C66B6B00CE636300C66B6B00E7CECE00DEC6C600D6A5A500CE9C
      9C009C6B6B00B59C9C006BFF9C00000000009C9C9C0039E7FF0021DEFF0008CE
      FF0000B5E7009C63100008A5E700E78400006BE7EF0039E7FF0010D6FF0000CE
      FF0000BDF7008C5218004A4239002910100000000000CE949C00EFFFF700EFBD
      6300EFBD5200DEB54200C6AD3100D6AD3900DEAD4200DEAD4A00D6843100E7A5
      6B00F7BD73006B42100000000000000000006B39080073390800D6D6CE006339
      0800B5733100D69C6B00CE844200BDB5B500D6CEBD00CE9452006B4218003921
      08000000000000000000000000000000000000000000C6949400FFAD2100FFB5
      2900CE944200FFB53100E7B59400CE7B7B00CE949400D6B5B500DEBDBD00CEAD
      AD00A57B7B00AD8484009C6B6B000800000000000000EFB5630010CEF70000CE
      FF0000B5FF0008A5FF001094F70084733900EF9C1000AD5A000031CEC60000BD
      FF0008ADFF0008A5FF00392921002910180000000000CE949400D6F7CE00E7BD
      5200DEBD4A00DEBD4200D6B53900EFB54A00EFB54A00F7B55200E78C3100EFB5
      6B00C6A56B00089CEF0000000000000000007342080073420800E7E7E700DED6
      CE00C6A58400EFCEAD007B421000CECECE00B5B5B500D6A57300B57331005231
      10000000000000000000000000000000000000000000D6B5B500FFBD3900EFAD
      4A001008940073527300FFBD4200FFBD4200F7AD5A00CE6B6B00DEBDBD00CEAD
      AD00BD8C8C00CE9C9C00AD7373000800000000000000FFE7A500DE73000010AD
      310008ADF7001094FF001884F7002173EF00FFAD2100FF94000073840000007B
      000018ADE7001094F7001084F7002921290000000000CE949400C6D67B00DECE
      6300E7C66300EFC66300E7BD5200F7C65A00FFBD5A00F7BD5200EF943100FFBD
      6B00527373001094F7000000000000000000734208007B421000F7F7F700F7F7
      F700F7F7F700B59C8C00BDAD9C00D6D6D600BDBDBD006B421000DEAD84009C63
      29005229100000000000000000000000000073420800CEA5A500EFB552000000
      9C00FFCE630000009C00FFCE6300FFC65A00FFBD4A00CE7B7B00DEBDBD00CEA5
      A500A5737300BD848400B58484000808080000000000E7BD9400E77B000021BD
      420031CE63001094EF002994CE00E7EFA500FFCE5A00FF9C00004A940000637B
      000000730000639CCE00187BF7002110180000000000C6949C00DEC66300EFD6
      8C00FFD68C00FFD68C00EFCE6B00FFCE7300F7C66300EFC65200EF9C3100FFC6
      7B00005A00000000000000000000000000007B4210007B421000F7F7F700F7F7
      F700F7F7F700EFEFEF00E7E7E700D6D6D600C6C6C600ADADAD00B57B4200D6A5
      6B00945A29004A2908001873EF000000000084522900CEA57B00FFCE6300FFD6
      7300FFD67B0052429400FFD67300FFCE6B00FFCE6300CE949400DEBDBD00CE9C
      9C00BD8C8C00A5737300AD7B7B000800000000000000000000005AB57B0029CE
      630052DE7B00E7E7AD00F7FFE700FFFFCE00ADCE6B006BAD2100EF8C0000637B
      0000397B0000086BC600395A9C001808080000000000CE949400F7D68400F7E7
      AD00FFDEA500FFDEA500EFD68400F7D67B00E7CE6B00E7CE6300E7A54200DEAD
      6B0031730000000000000000000000000000844A1000844A1000844A1000844A
      10007B4210007B42100073420800733908006B3908005A31080063310800DEAD
      7B00CE8C4200945A29006B42180000000000AD948400EFBD7300FFD67B00FFDE
      8C00FFE79400FFE7940063529400FFDE8400FFD67300D6A5A500DEBDBD00CE94
      9400AD737300CE949400B58484000000000000000000000000005AB55200BDC6
      5A0094CE6300EFDE8400BDF7B500FFE79C0031CE630084AD2100EF840000DE73
      0000638C8400638C9C00636363001008080000000000CE8C8C00FFEFBD00FFEF
      BD00F7E7AD00EFDEA500DED68400E7D68400E7D67B00E7CE7300EFAD52008C5A
      1800638C8400000000000000000000000000844A1000844A1000844A1000844A
      10007B4210007B42100073420800734208006B390800633908005A310800945A
      2900EFCEAD00BD7B39005A31080000000000D6CECE00FFD67300FFDE8C00FFEF
      9C00FFEFAD00FFEFAD0000009C00FFE79400FFDE8400DEB5B500DEBDBD00CE94
      9400CE6B6B00CE6B6B00BD6B6B000000000000000000000000000000000052D6
      7B00DEEFA500ADCE6B008CDE8C004AD6730029C6520042AD2100F7A52900C673
      1000427B0000636363005A3939000000000000000000D69C940084737B00FFF7
      CE008C94A500FFF7CE00949C9C00FFE7A500D6C6B500FFE7AD00EFA563007342
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007342
      0800BD946B00E7C6A5005A31080000000000F7F7F700DEBD8400FFE79C00FFF7
      AD00FFFFC600FFFFC600BDBDB500ADA59C00EFC68C00F7E7E700F7E7E700F7E7
      E700F7E7E700F7DEDE00DE949400000000000000000000000000000000000000
      000000000000D6E7A500E7DEBD00EFD68C00BDC6940063AD5200E7840000E784
      00000000000000000000000000000000000000000000AD736300C68484009484
      9400C6847B0094849400BD848400A5949C00A58C9400E7A59400A5ADBD009C5A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B636300E7CEBD007342100000000000D6D6D600F7EFEF00CEC6C600BDA5
      A500A58C8C00C6A59C00E7CEAD00FFEFAD00DEAD8400DEB5B500D6ADAD00BD94
      8C008C737300D6B5AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073848C00738484008C8C
      840063ADA500BDB5630052C6CE005AB55A004ACEDE007B848C0073AD9C006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEBDBD00A5734200000000000000000000000000000000008C8C
      8C00849C9C00C6ADA500DEBDBD00D6BDBD00BD8C8C006B6B7300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001000080021001000290010002900
      1000421818007B738C0031425200000000000000000000000000000000000000
      0000000000000000000000000000000000001800080029081000290810002908
      100042211800736B840031425200000000000000000000000000000000000000
      0000000000000000000000000000000000001000000018000800180808002108
      1000421818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD949C00C6A5A500DED6D600DECECE00D6C6C600D6BD
      BD00C69C9C00734242005A21100010424A000000000000000000000000000000
      000000000000FFEFEF00B58C94008C737300635A52006B5A52006B5A52006352
      4A00523931004A2921005221100010394A000000000000000000000000000000
      0000FFEFEF00CEBDBD0084848400C6C6C600CECECE00CECECE00ADADAD006B6B
      6B00211810003921180052211000000000000000000000000000000000000000
      00000000000063636300C6C6C600FFFFFF00FFFFFF00DEDEDE00848484006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000AD7B7B00DEDEDE00E7E7E700E7E7E700DED6D600CEBDBD00C6C6
      C6009C7B7B00D6ADAD00A56B6B005A4A5200000000000000000000000000DEDE
      DE00DED6D600A5737300948C8C00BDA5A500DEDEDE00DED6D600D6CECE00CEB5
      B500C6A5A500947373004A312100524242000000000000000000000000000000
      0000B5ADAD00C6C6C600EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00F7F7
      F700C6C6C6004239390039211800000000000000000000000000000000000000
      000000000000DEDEDE00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      000000000000C69C9C00EFEFEF00F7F7F700EFEFEF00DEDEDE00BD949400B59C
      9C00AD848400D6ADAD00C69494005A4A52000000000000000000F7FFF700CEC6
      C6008C84840063423900BD9C9C00EFEFEF00EFEFEF00E7E7E700DECECE00DECE
      CE00CEB5B500C6949400846B6B0052393900000000000000000000000000C6C6
      C600BDBDBD00DEDEDE00EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600312929004A3939000000000000000000000000000000
      0000ADB5B500E7E7E700E7E7E700E7E7E700DEDEDE00E7E7E700FFFFFF00E7E7
      E700636363000000000000000000000000000000000000000000000000000000
      000000000000D6B5B500EFEFEF00FFFFFF00F7F7F700E7E7E700CEA5A500B57B
      7B00BD7B7B00D6ADAD00AD7B7B00312931000000000000000000E7D6D6009494
      9400DEDEDE00ADADAD00BD9C9C00F7F7F700FFFFFF00EFEFEF00D6B5B500CE94
      9400CE8C8C00C6949400846B6B00392929000000000000000000000000008C8C
      8C00E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00E7E7E700EFEFEF00FFFF
      FF00FFFFFF00EFEFEF006363630031292100000000000000000000000000D684
      1800CED6D600FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700FFFFFF00E7E7
      E70063636300000000000000000000000000000000000000000000000000B56B
      9400A5738400A55A6300BD636300CE949400DEADAD00CE9C9C00CE9C9C00C66B
      6B00CE6B6B009C6B7300F7BDBD000000000000000000000000009C6B6300DEDE
      DE00DEDEDE00ADADAD00A58C8C00D6A5A500D6ADAD00CE9C9C00CE9C9C00CE6B
      6B00CE6B6B00947B7B00B5847B0000000000000000000000000000000000ADAD
      AD00FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDE
      DE00FFFFFF00FFFFFF008C8C8C00000000000000000000000000DE9439009C31
      0000E7E7E700FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700CED6
      D6009C5A310063636300000000000000000000000000F7EFF700AD5A1000CE63
      2100CE6B4200CE63420094311800D6947300FFA51800FFAD2900EFC6B500C673
      7300BD52520073424A00EFADB500000000000000000000000000AD521000CECE
      CE00DEDEDE00ADADAD00A58C8C00C6848400FFA51800FFAD1800F7C69400CE7B
      7B00B552520042312900845A5A0008000000000000000000000000000000B5B5
      B500FFFFFF00F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7
      E700FFFFFF00FFFFFF007B7B7B000800000000000000000000009C310000A542
      0000E7E7E700FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7E700946B
      63008C6342009C5A3100000000000000000000000000DE842100AD421800A539
      10009C421000AD421000B55A4200DE945200FFB53100FFB53900FFB53900FFB5
      3900F7B56300CE8484007B3942002100080000000000D67B2100943918006B39
      2100DEDEDE00C69C9C00A58C8C00CEA5A500FFB53100FFB53900FFBD3900FFBD
      3900FFB54A00D68C84008463630029101000000000000000000000000000C6C6
      BD00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7E700E7E7
      E700F7F7F700F7F7F700524A4A002910100000000000DE9C4200B54A0000BD52
      0000CED6D600CED6D600FFFFFF00DEDEDE00FFFFFF00FFFFFF00DEDEDE009452
      0800736331009C5A31006363630000000000DEAD7300A5390000AD420000B54A
      000008630000AD4A0000BD7B6B00FFB54200FFBD4A00FFC65200FFC65200FFC6
      5200FFBD4A00FFBD4200FFB5390021001000D6A56B007B3108008C736B00B58C
      8C00BD8C8C007B6B6B00CE848400CEA5A500FFBD4A00FFC65200FFC65A00FFC6
      5A00FFC65200FFBD4200B56B6B0029101000000000000000000000000000CECE
      CE00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7
      E700EFEFEF00CECECE00845252000000000000000000C66B1800BD520000D66B
      0000DEDEDE00FFFFFF00CED6D600BD635A00C6C6C600DEDEDE00397B3900006B
      000039631800736331006363630000000000B5520800BD520000C66300008473
      0000007B000021730000D6BDBD00FFC65200FFCE6300FFCE6B00FFCE6B00FFCE
      6B00FFCE6300FFC65A00F7AD5200180008008C421000CECECE00E7E7E700C6C6
      C6009C9C9C00C69C9C00CE8C8C00CEA58400FFCE6300FFD67300FFD67300FFD6
      7300FFCE6B00FFCE5A009C6B6B0021080800000000000000000000000000A5A5
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00E7E7
      E700E7E7E7008C847300946363000000000000000000C66B1800BD844A00BDAD
      A500399C4200DEDEDE00E7E7E700BDBDC600E7E7E700AD8C7300008400000073
      0000006B00004A6321006363630000000000BD520000D66B0000D67B00004A94
      000039940000E77B0000DECECE00FFCE6B00FFD67300FFDE8400FFDE8400FFDE
      8400FFD67B00FFD66B00E79C6B0010000800B5B5B500E7E7E700F7F7F700FFFF
      FF00FFFFFF00A5A5A500BDA5A500EFBD7300FFD67B00FFDE8C00FFE79400FFE7
      9400FFDE8400FFD673007B5A5A0018080800000000000000000000000000C6C6
      C600C6C6C600E7E7E700FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEF
      EF00CECECE00CEAD5A00000000000000000000000000D6731000AD8C73004A9C
      4A00C6C6C60063A57300E7E7E700EFB55200FFA51800F78C0000528C00002173
      000021730000106308006363630000000000CE630000BD84000010AD210031AD
      2900FFAD2100FF9C0000C6B5B500FFD67B00FFDE8C00FFE79400FFE79C00FFE7
      9C00FFE78C00FFDE8400CE8C730008000000C6C6C600D6D6D600E7E7E700F7F7
      F700FFFFFF00FFFFFF00D6CECE00FFD67B00FFE79400FFEFA500FFF7AD00FFEF
      AD00FFE79C00FFDE840063524A0010080800000000000000000000000000B5B5
      B500FFFFFF00FFFFFF00DEDEDE008C6363009C636300BDBDBD00BDBDBD00BDBD
      BD009C8C6B00FFDE8400000000000000000000000000EFB56300EF7B00004AAD
      520052BD7300A5BDAD0052BD7300D6DE8400FFCE5A00FF9C0000738C08000084
      000000730000316300006363630000000000D673000042AD290029C65A0039CE
      6B009CD67B00CEAD7B00BDA59400FFDE8C00FFE79C00FFEFAD00FFF7B500FFF7
      B500FFEFA500FFE79400BD7373000000000094949400C6C6C600D6D6D6008484
      8400F7F7F700FFFFFF00EFEFEF009C949400BDA59400E7D6A500FFFFCE00FFFF
      C600FFEFAD00FFDE8C005A424200100808008C8C8C009C9C9C008C8C8C008484
      8400FFFFFF00FFFFFF00FFFFFF00AD5A5A008C848400F7F7F700EFEFEF009494
      8C00F7E7A50000000000000000000000000000000000D6DE840021A5210021BD
      52004AD67300FFE79C0073E79400FFFFD600EFCE7B00FFAD2900F78C00004284
      000000730000AD7B00006363630000000000CEE7A50021C64A005ADE8400BDEF
      AD00D6F7CE00C6BDB5009C949400CEB59400EFDEA500FFFFBD00FFFFCE00FFFF
      C600FFF7B500FFE79C00A5636B0000000000ADB58C00ADADAD00424242008C8C
      8C00E7E7E700F7F7F700FFFFFF00AD9C9C00BDB5B500D6C6C600C6B5B500AD8C
      8C00AD848400C69484005A393900080000008C947B00C6C6C600BDBDBD003939
      3900A5A5A500BDBDBD00EFEFEF00CECECE00FFFFFF00E7E7E70094949400A584
      8400000000000000000000000000000000000000000000000000D6DE840029CE
      630073E79400A5F7B500CEF7BD00FFF7B50031CE63004AB53100D6940000EF7B
      000042840000636363000000000000000000000000009CBD4A007BDE8C00CEF7
      B500D6EFAD006BB58400C6BDBD00E7DEDE00E7D6D600C6ADAD00AD8C8C00AD84
      8400D6B59C00F7DE9C008C525A0000000000000000007B846300ADADAD00BDBD
      BD00D6D6D600E7E7E700F7F7F700736B6300CEBDBD0000000000000000008C73
      73008C7B7300948484007B4A4A0000000000ADADAD00424231009C9C9C00D6D6
      D600525252007B7B7B00FFFFFF009C9C9C00BDADAD00C6ADAD00000000000000
      000000000000000000000000000000000000000000000000000000000000D6DE
      840063D67B00C6DE8C00D6E79C0073E7940031CE630018B53100F78C0000EF84
      0000636363000000000000000000000000000000000000000000D6DEA50084DE
      84005ADE840029C6520073AD2100D6A573000000000000000000B5ADAD00BDA5
      AD00CEADAD00DEBDBD00B59CA500000000000000000000000000A5AD8400A5A5
      A500BDBDBD00D6D6D6006B6B5200BD946B00C6848C0000000000000000000000
      000000000000000000000000000000000000BD8C5A0073848C006B735A009494
      9400E7E7E700EFEFEF009C9C9C00B58463000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6DE8400CECE6B0094CE630052CE630039BD42004AB53100EFB563006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A392100311818003918
      1800391018003908180029081000291010002918100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003118
      1800080000000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084420800733908006B3108007331
      080073390800843908000000000000000000218421008C6B6300D6CECE00DED6
      D600DECECE00D6C6C600D6B5B500B58484005A2121006B290800000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      840084848400000000000000000000000000000000009C7B7B00F7D6D600FFEF
      F700FFEFEF00FFEFEF00FFE7E700EFB5B5004242420000000000000000000000
      00000000000000000000000000000000000039B53900188C2100085A08000852
      3900085229001894210021AD290021631800734A21008C6B6300A5847B008C63
      5A005231180063310800A552100000000000C6ADAD00E7E7E700E7E7E700DEDE
      DE00DED6D600CEB5B5009C949400AD7B7B00CEA5A500633139009C7B7B000000
      0000522918000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60084848400848484000000
      000000000000000000000000000000000000D6A5A500FFFFFF00EFEFEF00DEE7
      E700DEDEDE00B5848400948C8C00A5737300FFCECE0063636300000000000000
      0000000000000000000000000000000000007B8C6B00DED6D600DECECE00BD94
      9400C69C9C0010392100189C2900C6B5B500DEDEDE00DEDEDE00DECECE00B59C
      9C00B58C8C00BD9494006339080000000000E7E7E700F7F7F700F7F7F700E7E7
      E700DEDEDE00E7D6D600AD848400AD848400CEA5A50094636B00C6ADB500845A
      6300633142009C6B730063390800000000000000000000000000000000000000
      0000000000008484840084848400848484008484840000000000000000000000
      000000000000000000000000000000000000D6C6CE00F7FFFF00FFFFFF00EFEF
      EF00E7EFF700CEADAD009C7B7B009C7B7B00E7BDBD00D6A5A500000000006342
      4A0052293900000000000000000000000000EFEFEF00F7F7F700DEDEDE00C6B5
      B500B5949400C68C8C0018942900E7E7E700EFEFEF00EFEFEF00D6C6C600C6B5
      B500AD8C8C00CEA5A5006B42100000000000CEB5B500F7F7F700F7EFEF00EFEF
      EF00D6BDBD00D6ADAD00BD7B7B00BD737300CEA5A5008C636B00D6B5B500D6B5
      B500ADA5A500946B73004A181000313131000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484000000000000000000D6B5B500FFFFFF00F7EFEF00F7FF
      FF00E7EFEF00DEBDBD00AD6B6B00B5636300DEB5B500C6ADAD00FFEFEF00FFE7
      EF00FFDEDE00B58C8C000000000000000000B5C6A500D6A5A500D6B5B500C673
      7300C67B7B00217B290021AD290039733900735A5A00E7DEDE00CEA5A500BD7B
      7B00BD737300CE9C9C00CE8429000000000000000000C68C8C00F7C69400D69C
      9C00CE8C8C00C6737300C66B6B00CE6B6B00DECECE00DEC6C600DEBDBD00D6A5
      A500AD9C9C00B59C9C00A5AD9C003108180000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600848484000000000000000000EFE7E700C6736300BD73
      9C00BD8C9C00CE7B7B00CE636300CE4A5200DEE7E700F7FFFF00E7E7E700CEB5
      B5009C9C9C00C6949400FFBDBD000000000052AD4A00FFAD1800FFB53100DEAD
      9C00845242002963290039B539003973390018630800B58C4A00D6A5A500CE6B
      6B00C66363009C8C4200E79C31000000000000000000D69C8400FFA51800FFAD
      2100FFB54A00DEADA500C6636300BD6B6B00DEC6C600CE9C9C00D6A5A500D6B5
      B500AD8484009C6B6B00B59494003108180000000000FFFFFF0000000000FF00
      0000FF000000FF000000FF0000000000000000000000FF000000FF000000FF00
      000084000000C6C6C600848484000000000000000000F7EFF700DE842100FFA5
      0000FFD64A00737B8C00BD4A630094293100FFFFFF00FFFFFF00EFFFFF00CEA5
      A500AD636B00CE9C9C00FFC6C60000000000B57B6B00FFBD4200FFC65200FFC6
      52008C8C21005A3921004210000039733900009C08005A391000E79C2900FFB5
      3100E7AD8400A55A5A004A4A4A001810100000000000D6B5B500FFB53100FFB5
      3900FFBD3900FFBD3900FFB53900EFB57B00CE7B7B00DEADAD00DEBDBD00CEAD
      AD00BD8C8C00AD7B7B00B58484003108100000000000FFFFFF0000000000FF00
      0000FF00000000000000C6C6C60000000000FF000000FF000000FF000000FF00
      000084000000C6C6C600848484000000000000000000E7CEE700FFA51000FFBD
      2100AD84290021636300FFE72900F7AD9400BD6B9400CE735200C694BD00BD73
      8400D65A6300DE9C9C000000000000000000D6C6C600FFCE6300FFD67300FFD6
      730031CE6B0029CE5A0021BD420010AD210008A51800009C080084632900FFBD
      5200FFBD4A00FFBD4200733939000810100000000000CEA5A500FFBD4A00FFC6
      5200FFC65200FFC65A00FFC65200FFBD4A00FFBD4200CE6B6B00DEBDBD00CEAD
      AD00BD8C8C00CE9C9C00B58484002908100000000000FFFFFF00000000000000
      0000C6C6C600FFFFFF00FFFFFF0000000000FF000000FF000000FF000000FF00
      000084000000C6C6C600848484000000000000000000D6ADD600FFC61800C68C
      210000C6F700295A42007B632900A56B1000E78C0000DE523100FFB50000FFDE
      42007B5A7300947B8C007373730000000000E7D6BD00FFDE8400FFE79400FFE7
      94004AE77B0031CE6B0029C65A0021BD420018B5310008A51800216B0800BD9C
      5200FFCE6B00FFC65A004A29290000181800D6C6AD00CEA58400FFCE5A00FFCE
      6B00FFD66B00FFD66B00FFCE6B00FFCE6300FFC65200CE848400DEBDBD00D6A5
      A500BD8C8C00AD7B7B00AD7373002908180000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FF000000FF00
      000084000000C6C6C600848484000000000000000000BD9CBD00FFD6290029F7
      FF0063EFF70073F7FF0073FFFF004AF7FF0018FFFF0000D6F700007B8400DE73
      0000009CBD00FFBD1000FFDE840000000000B5AD9C00DEC69400FFF7BD00FFFF
      BD005AF78C004AE77B0031CE6B0029C65A0021BD420018B5310008A518008C7B
      4A00FFDE8C00FFD673003918180000000000B59C9C00DEAD7300FFD67300FFDE
      7B00FFDE8400FFDE8C00FFDE8400FFD67B00FFCE6B00CE949400DEBDBD00D6A5
      A500BD8C8C00C68C8C00B584840029081800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00
      000084000000C6C6C6008484840000000000F7F7F700B5949C00FFD65A0073B5
      7300BDFFFF005AE7F7005ADEF7007BF7FF0094F7FF00ADFFFF007BF7FF0039F7
      FF0018F7FF00AD732100FFD6730000000000000000006BB5DE00A5B5C600D6C6
      C60021BD310042DE6B004AE77B0031CE630029C65A0021BD4200109C1000EFDE
      A500FFEF9C00FFDE84003131180000000000CEBDBD00FFD67300FFDE8400FFE7
      9400FFEF9C00FFEFA500FFE79C00FFDE8C00FFD67B00D6ADAD00DEBDBD00CE94
      9400C6737300AD6B6B00AD73730031081800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00
      000084000000C6C6C6008484840000000000EFE7E700BD947300FFDE7300FFE7
      73007BFFFF00D6A55200FFEF8400FFDE7300FFEF5200B552420063C69C0039DE
      F70084F7FF0039AD9C00FFBD9400000000000000000000000000000000000000
      00000000000000000000E7E7E70042DE7B0031CE6300109C1800D6CEAD00FFFF
      C600FFEFAD00EFBD84000842000000000000F7EFEF00FFDE7B00FFE79400FFEF
      AD00FFF7B500FFF7BD00FFF7AD00FFEF9C00FFDE8C00E7C6C600EFDEDE00FFFF
      FF00DEADAD00CE6B6B00CE6B6B0039102100FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00
      000084000000C6C6C6008484840000000000EFEFF700DEBD6300FFE78C00FFEF
      A5007BCEAD00F7DE9400FFF7B500FFEF9C00FFF78C00D69C7B00FFF79C00E7DE
      8C0084F7FF00FFE76B00E7949400000000000000000000000000000000000000
      000000000000000000000000000052F78C0021941800BD9C7B00D6B5A500DEC6
      C600D6B5B500BD8C8C00005A000000000000EFEFEF009C949400B5A59400DEC6
      A500FFFFCE00FFFFCE00FFFFBD00FFEFAD00EFC68C00EFD6D600EFD6D600EFD6
      D600EFD6D600E7CECE00CEA5A5007B737B0084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484008484
      840084848400C6C6C6008484840000000000F7EFF70094847B00D6B58C00FFFF
      B500FFFFD600FFFFDE00FFFFCE00FFF7AD00FFE78C00B59C9400F7EFB50073E7
      CE00FFFFBD00FFFFAD00CE8C9C00000000000000000000000000000000000000
      000000000000000000000000000029941000EF9C310000000000000000000000
      000000000000000000000000000000000000DEDEDE00BDBDBD00C6BDBD00DED6
      D600DECECE00BDA5A500AD848400BD948C00C69C8400BD847300D68C4A00EF9C
      310000000000000000000000000000000000000000008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840000000000C6C6C600F7EFF700DED6D600AD9C
      A5008C63730084526300B5948C00EFDEA500F7CE8C00D6D6DE00EFDEE700C694
      9C009C637300BD847B00AD8C9400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CE844A00C6947B00BD8C8C00DE842900000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00000000000000000000000000000000000000
      0000C6C6C600D6CECE00E7CECE00CEADAD00CE848C0094949400000000000000
      000000000000D6D6D600F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000291810003929180000000000000000000000
      00000000000000000000000000000000000000000000634A2900423121005239
      29004A3921000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000735231004A392100312118004231
      2100393118003929180018100800181008002921100031211000392918004A31
      18004A392100848CA500314252005A5A5A000000000000000000000000000000
      0000000000000000000039313100313142003931310029212900211818000000
      000000000000000000000000000000000000735A390018394A00212929002121
      2100292929002121210031292900313139000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002121210031293100313139003931310029212900000000000000
      00000000000000000000000000000000000021842100317B2100317B2100317B
      2100317B210031731800317B21004A5A18008442080084390800843908008439
      080084390800843908008442080010424A000000000000000000000000000000
      0000000000005A4A4A001818390031293900636B730031293900392931003931
      290021181800000000000000000000000000422918004A6BB5003984DE00218C
      DE000094C600215A6B0018182100101018003139390021182900312929003931
      290000000000000000000000000000000000000000000000000000000000218C
      D600088CB500294A5A0029212100211818003939390029212900392929003931
      29002118180021080000000000000000000039BD390021B5290008A510000894
      6B001084420021AD290021AD2900216B2100CE732100C66B1800C66B1800C66B
      1800C66B1800C66B1800B5631800737373000000000000000000000000000000
      0000527BBD00181831002129520029316300525A73008C9CA5006B6B7B003931
      4200393129006B63630073635A0000000000393939004A63AD00427BD6003984
      DE003984E700398CEF003194F7001894E7000884AD00214A5A00292929001810
      1800211818005A52520000000000000000000000000000000000427BCE00426B
      B5006B6B7B00F7EFEF00EFDEDE00B5A59C006B635A0031292100392921002921
      1800292118005A524A00736352008C8C8C0039BD390021843900E79418007BB5
      940008ADB500188C4A0021AD290052731800DE943100DE7B2100DE7B2100DE7B
      2100DE7B2100DE7B2100C67318006B6B6B00000000000000000000000000848C
      9C002118310031396B00293163002931630029316B00424A6B00CEEFEF00949C
      A50063637300312131004231290042524A004A5A63004A6BB5004273CE00427B
      D6003984DE003984E700398CEF003194F7003194FF00319CFF00299CFF00109C
      DE00107B9C00181018000000000000000000000000004A6BB50042639C00A57B
      7B00D69C9C00F7E7E700E7CECE00D6ADAD00D6A5A500D6A5A500D6A5A500DECE
      C6008C7B73003929210042292100424A420039BD390010844200DEB5180063AD
      5A0042FF7B00087B520021AD290042732100EFA53900EF942900EF942900EF94
      2900EF942900EF942900D6842100313939000000000000000000217BFF003931
      390021214A00394273008CB5EF0029316B00293163002931630039396300CEF7
      FF00ADC6CE0084949C00393142002121180029526300426BBD004273C6004273
      CE00427BD6003984DE003984E700398CEF003194F7003194FF00319CFF00319C
      FF00089CDE00424A5200000000000000000029525A0042528400C6848400C67B
      7B00CE848400EFDEDE00E7CECE00D6ADAD00009C0000D6A5A500D6A5A500D6A5
      A500D6A5A500D6A5A500DECECE003129210042C6420010A521001052F7001829
      FF00108C210021A5310021AD2900396B1800FFBD4A00F7A53100F7A53100F7A5
      3100F7A53100F7A53100E79429002121180000000000B5CEDE00634A29002931
      63002939730029396B0029396B0084ADDE003142730029316300213163002929
      5200CEF7F700B5D6D6004252730021181800294A5A004273BD004A6BBD004273
      C6004273CE00427BD6003984DE003984E700398CEF003194F7003194FF00319C
      FF00089CDE005A7373000000000000000000424A5200C67B7B00C67B7B000000
      9C00C67B7B00E7CECE00E7CECE00D6ADAD00D6A5A500109C0800D6A5A500D6A5
      A500D6A5A500DEB5B500FFF7F7003121180042CE420052DE520063EF6B005ADE
      5A006BF76B0063EF630042CE42004A732100FFDE6300FFDE6300FFDE6B00FFE7
      6B00FFDE6B00FFE76B00F7A531002921180000000000295A940018214A002931
      6B0031428400394A8C0031427B0029316B0094C6E700425A8C00212952002931
      63002121520073848C00426B94000000000021638C00427BCE004A63B5004A6B
      BD004273C6004273CE00427BD6003984DE003984E700398CEF003194F7003194
      FF00089CDE0039424A000000000000000000CE9C9C00C67B7B00C67B7B008452
      8400C67B7B00DEB5B500EFD6D600DEB5B500D6A5A500CEA5A5004A9C3900D6A5
      A500D6A5A500E7C6C600A5A5A500181810009C3100009C3100009C3100009C31
      00009C3100009C3100009C3100009C3100009C3100009C3100009C3100009C31
      0000A5848400000000000000000000000000736B730018214A00293963002931
      6B00314284004252A5004252AD00424A9C0031397B005273A500739CCE002129
      630029316B00312942007363630000000000296B8C004284D600425A8C00394A
      6B003139420039527B004273C600427BD6003984DE003984E700398CEF003194
      F700089CDE00181021000000000000000000DEBDBD002118940063398C006339
      8C00C67B7B00D6A5A500EFD6D600DEB5B500D6A5A500D6A5A50084A56B0084A5
      6B00D6A5A500EFD6D6005242390008101000FFFFFF00FFEFEF00FFFFFF00F7EF
      E700F7EFE700FFEFEF00FFFFFF0094947B00A54A1800C68C6300D69C8400A539
      0000A584840000000000000000000000000018213900212952008CB5E7004A5A
      8C0029317300394A94004252AD004252A50039428C0029316B004A5A8C00739C
      CE0029294A006BADEF000000000000000000318CBD00426BA500426BBD00426B
      BD00426BBD00426BBD00426BBD005A9CCE0039527B0031424A00315A8400397B
      CE000894D600314A6300524A4A00000000007BADC600CE8C8C00BD7B7B002110
      9400C67B7B00CE8C8C00EFDEDE00DEB5B500D6A5A500D6A5A500429C3100009C
      0000D6A5A500F7E7E7004A42390000211800FFFFFF00FFFFFF00FFFFF700F7E7
      DE00F7EFE700FFF7EF00FFFFFF00B5521000B5520800B5520800B5521000B552
      0800A5848400000000000000000000000000212142002931630021295A006B84
      B5007394C600293173003142840039428C0031397B002931630021295A003942
      6300318CE7000000000000000000000000003194BD00394A7300427BCE00427B
      CE00427BCE00427BCE00427BCE007BE7FF007BE7FF00427BCE00427BCE00427B
      CE00427BCE0029211800844231000000000000000000D6ADAD00945A84002110
      9400C67B7B00C6848400EFD6D600DEBDBD00D6A5A500D6A5A500D6A5A500D6A5
      A500DEB5B500B5ADAD007B42310008292900FFFFFF00FFFFFF00F7EFE700F7E7
      D600F7EFE700FFFFFF00FFFFFF00A5B59400BD844200C66B2100CE732900C663
      1000AD8C8C000000000000000000000000000000000039395A0029316B002129
      5A00526B9C0084ADDE0029316B0029396B0029316B006B8CB5004A639400A5C6
      DE000000000000000000000000000000000042ADDE0039394A007BADE7003984
      DE003984DE003984DE003984DE003984DE003984DE003984DE003984DE003984
      DE003984DE00212110005A633100000000000000000094949400C67B8400C67B
      7B00C67B7B00EFDEDE00DEB5B500D6A5A500D69C9C00CE8C8C00D69C9C00EFD6
      D600FFF7F700423129005A5A31000000000052CEFF0052CEFF0052CEFF0052CE
      FF0052CEFF0029BDFF00C6EFFF00D6731800D6731800D6731800D6731800D673
      1800C6BDBD0000000000000000000000000000000000000000004A425A002931
      6B0029316B00394A840084B5DE002129630029316B0029295A00D6DEE7000000
      000000000000000000000000000000000000315A84003973BD00398CEF00398C
      EF006BB5F700ADDEFF00D6FFFF00A5E7FF0073BDF7004294EF00398CEF00398C
      EF00398CEF000831080010630800000000000000000000000000DEADAD00F7E7
      E700E7CECE00E7C6C600CE6B0000CE630000CE630000D69C9C00CE949400CE8C
      8C008C7B8C00103108001063080000000000BDF7FF00EFFFFF00FFFFFF00F7EF
      E700FFF7EF00FFFFFF00FFFFFF00D6944A00DE842100E78C3100DE842100DE84
      21006B636B000000000000000000000000000000000000000000000000009484
      8C0029316B0029316B0031396B0084ADE700394A7B00298C420063C6D6000000
      000000000000000000000000000000000000000000000000000000000000524A
      4A001039B5002929310031394A00315A8C002973D6003194FF0052B5FF006BCE
      FF0084DEE7000063000000000000000000000000000000000000F7DECE007B73
      73005263AD008C848400B5A5A500D6BDBD008C8CA5004284D60052A5EF006BC6
      F7007BD6E700006300000000000000000000EFF7EF00F7FFF700F7E7DE00F7E7
      DE00F7EFE700FFFFFF00FFFFFF00C6BD8400EF942900F7BD7300EFAD5A00EF94
      290063ADB5000000000000000000000000000000000000000000000000000000
      0000CEC6BD00293163002931630021295A0084AD8C0052D67B00000000000000
      0000000000000000000000000000000000000000000000000000000000008C84
      84001852D6002939520031313100292929000018840021294200739C7B000000
      0000000000000000000000000000000000000000000000000000000000008C84
      84001852D6002939520031313100292929000818840021294200000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7AD5200F79C3100F79C3100F79C3100F79C
      3100399431000000000000000000000000000000000000000000000000000000
      000000000000FFF7F70029315A009C949C0094A5B50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400529CCE00185AD6001852CE001042BD001031A50029314A0073BD7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE8429004294BD00E78C2900E78C
      2900DE8C2900E78C2900E78C2900DE8C2900DE842900DE842900EF943100B59C
      390018B539000000000000000000000000000000000000000000000000000000
      000000000000634A2900292110003121100042311800392918004A3118005A42
      2100000000000000000000000000000000000000000000000000000000005242
      29004A3921006342290021181000292110004231180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004231180000000000000000003929180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000211810002921100039291800392918004A3121005A42
      2100000000000000000000000000000000000000000000000000000000001863
      8C00312929004A4A4A00313131002921180039312900B5A5A500291818001810
      0800392110000808210000000000000000000000000021638C00105273007373
      73002929290029292900BDADAD00212118001810100094848400291818000000
      0000000000000000000000000000000000000000000000000000000000005252
      52004A4A4A00313131004242420031292900B5A5A50031313100100808001810
      0000000000000000000000000000000000000000000000000000000000005252
      52004A4A4A003131310042393900313131008473730031313100211818001810
      080039211000000000000000000000000000000000007B310800632108003131
      3100EFEFEF00EFEFEF00B5B5B500BDADAD007B6B6B007B7B7B00D6D6D600F7F7
      F70042393900291000006B31100000000000632908004A4A4200FFFFFF00E7E7
      E700BDBDBD00635252005A5A5A00BDBDBD00E7E7E70063636300737373000000
      000000000000000000000000000000000000000000004A42420042424200EFEF
      EF00EFEFEF00B5B5B500BDADAD007B6B6B007B7B7B00D6D6D600F7F7F7005A5A
      5A0018181000210800000000000000000000000000000000000042424200C6C6
      C600948C8C006352520052423900423131004A5A840042393100423129004239
      390021181800210800006B31100000000000000000006B737300C6C6C600F7F7
      F700EFEFEF00E7E7E700ADADAD00B5B5B5006B6B6B005A5A5A007B7B7B009C9C
      9C00C6C6C600FFFFFF007B6B5A0000000000DEDEDE00FFFFFF00FFFFFF00A5A5
      A5009C9C9C00C6C6C600ADADAD008C8C8C006B636300949494004A4A4A000000
      0000000000000000000000000000000000006B6B6B00C6C6C600F7F7F700EFEF
      EF00E7E7E700ADADAD00B5B5B5006B6B6B005A5A5A007B7B7B009C9C9C00C6C6
      C600FFFFFF009C9C9C0000000000000000000000000000000000E7E7E7008494
      A5005A84C600737BBD00A56B7B00D6847300DE9C8400BD949C004A6BAD003921
      100063524A0073736B0073635A008C8C8C0000000000D6D6D600F7F7F700EFEF
      EF00E7E7E700737373007B7B7B00A5A5A500B5B5B500B5B5B500B5B5B5009494
      9400313131007B7B7B008C73630000000000EFEFEF00ADADAD00A5A5A500D6D6
      D6009C9C9C00848484007B7B7B00ADADAD00BDC6C600739C8400525252005252
      5200212121006B6B6B008C73630000000000D6D6D600F7F7F700EFEFEF00E7E7
      E700737373007B7B7B00A5A5A500B5B5B500B5B5B500B5B5B500949494003131
      31007B7B7B004A4A4A00000000000000000000000000F7F7F70073B5F700848C
      A500FFD6A500FFDEB500FFE7C600FFEFCE00D69C7B00D68C5A00FFEFD6001863
      FF0039211800312118005A4A420042524A0000000000CECECE00E7E7E7007373
      7300CECECE00D6D6D6009C9C9C00A5A5A5008484840073737300A5A5A500BDBD
      BD0073A58400737373008C735A0000000000B5B5B500EFEFEF00D6D6D600E7E7
      E700CECECE00E7E7E700D6D6D600C6C6C600948C8C00ADADAD00DEDEDE00E7E7
      E700C6C6C600636363003931290010292100CECECE00E7E7E70073737300CECE
      CE00D6D6D6009C9C9C00A5A5A5008484840073737300A5A5A500BDBDBD0073A5
      84007373730042424200000000000000000000000000DEDEDE00217BFF00EFB5
      9400FFD6AD00FFE7C600FFF7D600EFBDA500D68C5A00FFDEAD00FFF7EF00FFFF
      FF008CB5FF005263840031181000212121000000000073737300E7E7E700DEDE
      DE00D6D6D600DEDEDE00E7E7E700EFEFEF00DEDEDE00B5B5B500B5B5B5009494
      9400636363007B7B7B008C735A0000000000EFEFEF00DEDEDE00DEDEDE00D6D6
      D600FFFFFF00EFEFEF00DEDEDE00C6C6C600D6D6D600EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A5A5A5000810100073737300E7E7E700DEDEDE00D6D6
      D600DEDEDE00E7E7E700EFEFEF00DEDEDE00B5B5B500B5B5B500949494006363
      63007B7B7B00B5B5B500000000000000000000000000B5CEE700FFAD3100FFEF
      CE00FFDEC600FFF7EF00FFFFF700D6B5B500D68C5A00FFE7C600FFFFFF00FFFF
      F700FFFFFF00CEE7FF005AA5F7002118180000000000E7E7E700DEDEDE00D6D6
      D600CECECE00D6D6D600EFEFEF00EFEFEF00BDBDBD00BDBDBD00E7E7E700E7E7
      E700CECECE008C8C8C00A58C6B0000000000C6DEDE009C9C9C00CED6D6009494
      9400A5A5A500B5ADAD00BDBDBD00CECECE00EFEFEF00E7E7E700DEDEDE00DEDE
      DE00EFEFEF00FFFFFF00EFEFEF0000080000E7E7E700DEDEDE00D6D6D600CECE
      CE00D6D6D600EFEFEF00EFEFEF00BDBDBD00BDBDBD00E7E7E700E7E7E700CECE
      CE008C8C8C00C6C6C6000000000000000000E7E7E700319CFF00DE945A00FFF7
      E700FFFFF700FFFFFF00EFC6A500E79C6B00EFBDA500FFF7E700FFFFFF00FFFF
      FF00FFFFFF004AE76B00527BAD0010100800000000008C8C8C00D6D6D600D6D6
      D600B5B5B500D6D6D600F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7E700DEDE
      DE00ADADAD005A5A5A00E7BD940000000000000000008C8C8C00FFC6AD00FFCE
      BD00FFDECE00EFDED600DEE7E700B5B5B500FFFFFF00EFEFEF00EFEFEF00E7E7
      E700E7E7E700EFEFEF00FFFFFF00000808008C8C8C00D6D6D600D6D6D600B5B5
      B500D6D6D600F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7E700DEDEDE00ADAD
      AD0052525200BDBDBD0000000000000000008C8C8C0000DEFF00F7EFD600FFEF
      D600FFFFFF00FFFFFF00D6B5B500D68C5A00FFDEB500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0010CE31007B6B6300081008000000000000000000BDCECE00EFEF
      EF00EFEFEF00ADADAD00BDBDBD00ADADAD008C8C8C00A5A5A500E7E7E700B5B5
      B5007B7B7B00DEE7EF00000000000000000000000000D6D6DE00FFEFC600FFE7
      BD00FFE7BD00FFE7C6005A4A4A00CECECE00FFFFFF00F7F7F700F7F7F700EFEF
      EF00E7E7E700E7E7E700F7F7F7000018180000000000B5BDBD00EFEFEF00EFEF
      EF00ADADAD00BDBDBD00ADADAD008C8C8C00A5A5A500E7E7E700B5B5B5007B7B
      7300C6634200A55231006B6B6B0000000000A5D6EF00188C6300FFFFFF00FFFF
      FF00FFFFFF00EFC6A500D68C5A00E79C6B00FFE7C600FFF7E700FFFFFF00FFFF
      FF008CC6FF007BBDFF005A52520000181800000000000000000000000000BDB5
      B500FFB5A500FFC6BD00FFE7DE00EFEFEF00D6D6D600D6D6D6006B6B6B00CED6
      D6000000000000000000000000000000000000000000B5A5A500FFF7DE00FFEF
      D600FFEFD600FFFFDE008C7B7B00D6D6D600FFFFFF00FFFFFF00F7F7F700F7F7
      F700EFEFEF00E7E7E700A5A5A500083931000000000000000000BDB5B500FFB5
      A500FFC6BD00FFE7DE00EFEFEF00D6D6D600D6D6D6005A423100A54A08002163
      0000AD420000A53908009C523100082929004AADEF00ADC67300FFFFFF00FFFF
      FF00FFFFFF0094B5FF006B8CD600FFE7CE00FFFFF700FFFFFF00FFFFFF00FFFF
      FF00399CFF0052291000944A310000000000000000000000000000000000AD8C
      8C00FFDEB500FFDEB500FFDEB500FFDEB500FFD6B50063525200DEEFEF000000
      000000000000000000000000000000000000E7FFFF00CEB5AD00FFFFEF00FFF7
      EF00FFF7EF00EFDED600DEBD9C00C6C6C600D6D6D600FFFFFF00FFFFFF00FFFF
      FF00F7F7F700EFEFEF00AD8C6300000000000000000000000000BD949400FFDE
      B500FFDEB500FFDEB500FFDEB500FFD6B50063312100CE6300007B7B00000084
      0000CE6B0000735A000063633100212929002994FF00DED6CE0073ADFF00ADB5
      CE00F7D6B500FFDEB500FFDEB500317BFF00FFFFFF00FFFFFF00FFFFFF00BDE7
      FF005ABDFF005A4210006363310000000000000000000000000000000000BD94
      8C00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE006B6B5A00000000000000
      000000000000000000000000000000000000C6BDB500D6C6C600DECECE00EFDE
      DE00EFE7E700D6B5A500EFD6BD00C6BDBD00FFFFFF00EFF7F700C6424200C6CE
      CE00D6D6D60084847B00F7BD7300000000000000000000000000BD948C00FFE7
      CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE0073390000429C080029AD1800EF9C
      0000D68C0000007B000010630800393939009CB5CE00CEC6BD00BD948C00FFE7
      C600000000000000000000000000000000006B4A310073BDFF00FFFFFF004AB5
      FF00735A31000873080010630800000000000000000000000000B55A0000F7DE
      CE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00F7DECE00944A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6BDAD0094949400635A5200DEDEDE00FFFFFF00B5ADAD00FFFF
      FF00A59C9400735A5A0000000000000000000000000000000000F7DECE00FFEF
      DE00FFEFDE00FFEFDE00FFEFDE00F7DECE00C66B000021C64A0042D67300CEDE
      7B00FFAD1800008C0000007300007B7B7B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063C6D60052BD
      FF00EF9C2100008C000000000000000000000000000000000000AD6B3900FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A57B7300D67B1000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B5009C948C00D6D6D6004A393900FFFFFF00946331000000
      00000000000000000000000000000000000000000000B5734200FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A584840094B56B0052D67B00B5F7BD00BDF7
      B5004ABD4200DE840000737B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DE8C2900EFE7DE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000873AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFE7E700BDBDBD00FFF7F70094ADB50094633100000000000000
      00000000000000000000000000000000000000000000EFE7DE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF0000000000BDCE84008CE794005ADE
      840018B53900DE94290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B52310042311800312110004A3121005A422100634A29000000
      00000000000000000000000000000000000084633900634A2900423121005A4A
      31006B5231006B4A290042311800312110004231180052392100523921005A42
      2100634A2900ADB5D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A009C9C9C00F7D6D600A58C8C0031312900313129009484
      73000000000000000000000000000000000084633900296B9C00189CDE00216B
      9C00524A42005252520084847B008C5A2900AD521000B56329008C4210004A29
      10004A2910000808210000637300000000007B5A390021638C00188CCE001863
      8C004A4239004A4A4A007B736B00845221009C4A1000AD5A29007B3910004229
      10004229100008082100005A6B00185263000000000000000000000000000000
      0000000000000000000000000000000000000000000018212100636352000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C00848484003131310094848400FFCECE00212121008C7B
      6B00000000000000000000000000000000006B6B5200299CD600217BB50021A5
      E7002173A50042424200DE7B1800B54A21007B633900AD421800B5522900CE63
      4200BD63420029312900217B8400FFFFFF007B3108007B3108007B3108007B31
      08007B3108007B3108007B3108007B3108007B3108007B3108007B3108007B31
      08007B3108007B3108008C421800949494000000000000000000000000000000
      000000000000524A420073847B00317B7300088C8400088C840008948C000063
      5A0000636B00187B8C0000000000000000000000000000000000000000000000
      000000000000A5A5A5008C8C8C00635A5A007B7373006363630018292900005A
      5A0000000000000000000000000000000000736B520031A5D6004284AD00317B
      D6004294C6009C6B31009C310000A5420000315A080094420000A53900009C31
      0000B54A2100AD5A310021214200F7F7F700E7FFFF00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00DEBDA500948C8C0000000000CEC6BD0073A59C001084
      8C0000948C00009C9C0000ADA50000A5A50008ADA50000948C0008A59C000094
      8C0000847B0000736B00085A52008CADAD000000000000000000000000000000
      000000000000B5B5B5008C8C8C004A4A4A005A5A5A004A4A4A0018313100008C
      8400000000000000000000000000000000008C6B420039A5CE004A6363000000
      000063948400636B5200BD520000C65A00003173000000730000BD5A0000B54A
      0000944200008C634200292118007B949400E7FFFF00DEEFEF00DEEFEF00DEEF
      F700EFF7F700EFD6B500637BCE005A5A9C00E7EFEF00EFDEBD00DEE7E700DEEF
      F700DEEFEF00DEEFF700DEBD9C004A5A520000B5AD0000B5B50000B5A50010A5
      94005AA5630094A54A00D6BD6300B59C310000FFFF0008CEC60008DED60008E7
      DE0008948C00008C8400006B6300185252000000000000000000000000000000
      000000000000B5B5B500949494006B6B6B007B7B7B004A4A4A001839390008DE
      CE000000000000000000000000000000000008A59C0021738400216363000000
      0000C684390010293900D66B0000DE730000008C00008C7B0000D6730000526B
      0000106300004A6321006B310800214A4200E7FFFF00DEEFEF00DEEFF700E7F7
      F7000029A5007B6B94004AB5E7004AB5DE008C637B000029B500FFE7B500DEEF
      F700DEEFF700DEEFF700E7BD9C0010292100A5B55A00E7BD6300F7DE9400FFEF
      B500F7E7AD00EFDEA500DEC67300F7CE7B0029FFEF0008EFDE0008EFE70008DE
      DE00004A4A000039390000948C00104239000000000000000000000000000000
      000000000000BDBDBD00BDBDBD007B7B7B005A5A5A004A4A4A001839390008D6
      CE00000000000000000000000000000000004A7B7B0021ADEF00AD9C73000000
      0000D67B2100D66B0000848C0000DE940000CE9C0000FF940000EF8C00001884
      000000730000216300007B4A080018393100E7FFFF00DEEFF700DEEFF700FFF7
      CE0084F7FF0052ADDE0063CEF70052CEF700319CD60021D6FF00FFCE7B00E7E7
      DE00DEEFEF00DEEFF700E7BD9C001021180052BD7B00FFE7AD00DEC67300E7CE
      8400F7E7A500DECE7B00F7E7AD00FFEFB5008C9C5A0000DED60008D6D600007B
      7300005A5A0000948C00008C8400083931000000000000000000000000000000
      000000000000C6C6C600BDBDBD0039D66B004AE77B0052CE7B00183939000073
      6B0000000000000000000000000000000000189CDE0031637B006B634200C6B5
      7300D69C4200E77B000018B5310031BD4A008CC65A00FFC65200FF9C0800DE8C
      0000107B0000006B0000734A100010392900E7FFFF00DEEFF700E7F7F7000031
      A5004A9CD6006BD6F7005ACEF70052BDE7004ACEEF0039ADDE000039AD00FFF7
      DE00DEEFF700DEEFF700E7BD94000821180000E7DE00A5A54A00FFE7AD00FFEF
      B500F7DE9C00C6CE84008CE7C60031DECE00006B6B0008E7D60008FFF70008F7
      F70008DED60008BDB500005A5200003931000000000000000000000000000000
      000000000000C6C6C600BDBDBD004AE7840031CE6B004AE77B001839390008EF
      EF0000000000000000000000000000000000108CBD00187BF700215A8C006B5A
      4A00DED6B5005AA5210029CE5A007BDE7B005ADE8400FFEFAD00FFBD3900EF94
      000063840000007300003142210008393100E7FFFF00DEEFF700E7EFF70084E7
      FF007BDEFF005ACEF700F7DEDE004A3129002194E70021BDE70008BDEF00F7EF
      EF00DEEFF700DEEFF700EFC694000021180008D6C60010ADA500008C84000063
      6300006B63000084840008B5B50010FFFF0010FFFF0008FFEF0008D6CE0008FF
      FF0008FFFF000063630000292900084A4A000000000000000000000000000000
      000000000000CECECE00BDBDBD0063FF940042DE730031CE6B001839310008F7
      F7000000000000000000000000000000000000ADE700089CEF00187BF700086B
      A5002142420073D6730042D6730094EFA500E7FFCE00E7EFAD0073C64A00BD94
      0000DE7300008C8C080008292100084A4200E7FFFF00DEEFF700E7EFF700E7F7
      F700527BC60052CEF700E7DEDE00423129004AE7FF00299CD600F7EFDE00E7EF
      F700DEEFF700E7EFF700EFC694000029290008BDB50008EFE70010FFFF0021FF
      FF0042FFFF0073FFFF0094FFFF00B5FFFF00B5FFFF0084FFFF0000BDAD0008FF
      F70008FFEF0008D6CE0008A59C00186B63000000000000000000000000000000
      000000000000D6D6D600BDBDBD0052CE63004AE77B0029C652001831310008EF
      EF000000000000000000000000000000000063C6DE0042D6FF0008ADFF00087B
      D60039ADAD00D6D6D600BDDE8400C6CE6B00BDE7940052D67B0021BD4A00EF8C
      0000D694210010B5AD0008A59C0000000000E7FFFF00E7EFF700E7EFF700E7EF
      F7009CE7F70063D6F700CEBDBD00292121007BE7FF0052CEEF00E7EFF700E7EF
      F700E7EFF700E7EFF700F7C6940008393900089C940008DED60094FFFF00BDFF
      FF008CFFFF0084FFFF0084FFF70063FFF70063FFF70018E7D60000C6B50008AD
      A50008BDB50008A59C0008948C00ADCEC6000000000000000000000000000000
      000000000000DEDEDE00BDBDBD007B7B7B0084848400737373001831310008A5
      9C00000000000000000000000000000000001084A50042E7FF0031D6FF00294A
      63005A949400C6C6C600A5A5A500A5A59C00CECE9C00E7C66300949C7B003994
      7B0008B5AD0008A59C000000000000000000E7FFFF00E7EFF700E7EFF700E7EF
      F700E7EFF700EFF7F700D6CEBD005A636300EFFFFF00E7EFF700E7EFF700E7EF
      F700E7EFF700E7F7F700F7C69400637373005A735A0008C6B50010C6BD0029CE
      C60021C6BD0010C6BD0008BDB50008B5A50008B5AD0008A59C00089C94000894
      8C0010948C00218C8C004A423100000000000000000000000000000000000000
      000000000000DEDEDE00B5B5B500737373008484840094949400183939000894
      8C000000000000000000000000000000000052735200187BAD0063EFFF0008C6
      F70021425200635A5A00086BA50029425A00524A520084848400183939000000
      000000000000000000000000000000000000DEDED600DED6BD00DED6BD00DED6
      BD00DED6BD00DED6BD00DED6BD00DED6BD00DED6BD00DED6BD00DED6BD00DED6
      BD00DED6BD00DED6BD00F7BD73009494940000000000ADDEDE00429C9C0063A5
      A50084B5B50094BDBD00ADC6CE00BDD6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B73730021101000424A4A00848C8C00A5ADAD00D6DEE7000000
      00000000000000000000000000000000000000000000ADD6D600187BAD007BEF
      FF0010D6FF001894D600007BBD00187BF7002152840052525200C6CED6000000
      000000000000000000000000000000000000BD5A0000B55A0000B55A0000B55A
      0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A0000C673
      1800CE7B29007B5A5A00DE841000ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B4A00393131006B4A21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B58442003184
      AD00DEFFFF0021D6FF0008C6FF00088CD600187BF70031526300AD7B42000000
      000000000000000000000000000000000000DE841800E7841800E7841800E784
      1800DE841000E7841800E7841800E7841800E7841800DE841000DE7B0800DE7B
      0800DE7B0000E7840800C6731000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE84310039313100BD7318000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E78C
      2100847B6B001884AD0052E7FF0029CEFF00088CD600A5632100EF9C4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFD6CE00D6949C0084527B004A3973002931840021316B00394A
      9C006373AD00ADB5D600FFFFFF00000000000000000000000000EFEFEF00CECE
      CE00CECECE00F7CEC60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084633900846339007B5A31007352
      3100735231006B5231006B4A2900634A2900634A2900634A2900634A2900634A
      2900634A29000000000042526B0063636300000000006B4A29004A3921006B4A
      2900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7A5
      9C00C64A39000829A5000829A5001831A50010299C0000104A00425294000021
      A5000818940000188400001873000000000000000000FFFFFF0073635A007373
      73009C84A5001018520008299C00000000000000000000000000000000000000
      0000000000000000000000000000000000008C633900CEBDA500C6B59C00BDAD
      9400ADA58C00A59C8400A5947B009C8C73007B6B5A00736B5A00847363009484
      7300634A29000000290000637B00185A6B00000000006B849400A58CB500524A
      42009C8C7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD5A4A009431
      1800842110002131BD006373D6006B7BDE00314AD600636BB5005A7BF7001021
      73001831CE001029B500001884000000000000000000FFFFFF006342390052BD
      FF003973CE00A58CA500393963006373D6000000000000000000000000000000
      0000000000000000000000000000000000008C6B3900D6C6B500CEBDA500C6B5
      9C00B5AD9400ADA58C00A59484009C947B0021211800211818006B6352009484
      73000018390008738400218C9C00000000000000000052C6FF00397BDE009C84
      AD00524A4200A594840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD6352008C2918008421
      100084211000522963007384E700737BDE00212973008C9CFF006B84EF005263
      B5001829D6001029B50000218C0000000000FFFFFF009C5A4A00631810004A39
      420052C6FF003973CE00A58CA50042426B002129730000000000000000000000
      0000000000000000000000000000000000008C6B3900DECEBD00D6C6B500CEBD
      AD00C6B5A500BDAD9400ADA58C00A5948400736B5A00000000007B7363000010
      3100007B8C00187B9400000000000000000000000000D6CEBD005AC6FF003184
      E7009C8CAD005A4A42009C947B00000000000000000000000000000000000000
      000000000000000000000000000000000000EFD6D6008C2918008C2918008C31
      18009431210094392100215A94002942DE00185A84004AADD60031ADE700085A
      8400082973000021A500AD39310000000000AD390800CE421800E7523100F763
      4A0084525A0052C6FF003973CE00AD8CAD00103952004294B500297B9C000842
      6300082163000021A5000000000000000000946B4200E7D6CE00DED6C600D6CE
      B500B5946B009C5A2100944A08009C6B3900393129006B635A0052637300004A
      6300106B7B0000000000000000000000000000000000DED6C600CECEBD0052C6
      FF003184E7009484AD005A310800734A29002118180039313100313942000042
      5A00106B7B0000219C00A539310000000000A5423100943118009C392100A542
      2900AD5239009C5A3900086B100000526B0084D6F70084D6F7004ABDEF001094
      D6001084BD003918180031420000EFE7DE00C6421000EF5A4200FF6B5A00FF7B
      6300DE6B4200847B7B0052C6FF006B84AD007B5A4A009C736B00D6B59400E7CE
      B5009C7B730029181000294200000000000094734200EFE7D600E7D6BD008C42
      0000A55A1000AD732100A56B2100B5732100944A0000844A100000C6FF00529C
      AD00634A29000000000000000000000000000000000094391000943910009439
      100052ADE70094949400A5848400F7D6AD00FFFFDE00FFFFDE00E7CEBD004A29
      2100843910009442100029210800000000009C311800A5422100AD4A3100BD5A
      3900C6634A0084733900080808006BCEF70094DEF70094D6F70063C6F700319C
      DE002984BD001052730000210000A5846300A5310000FF6B5200FF846300FF94
      7300E7A57300FFD6A500B55A4A009C7B7300EFB59400FFFFCE00FFFFD600FFFF
      DE00FFFFEF00E7CEC600001000009C8463009C734200F7EFE7008C420000D68C
      3100DE9C39003121080042291000BD843100D6943100A55A10008C5218009C8C
      7B00634A290000000000000000000000000000000000DEFFFF00DEF7FF00DEF7
      FF00E7F7F700BDADAD00FFEFB500FFFFC600FFFFDE00FFFFEF00FFFFFF00F7E7
      DE0063636B00E7FFFF001808000000000000B54A2900BD523100C65A4200D66B
      4A006BA54200184210002929290063B5DE008CD6F70084D6F70052BDEF00399C
      DE00318CBD0021526B00000000004A4A18009C422100CE4A2100FF8C7300BD4A
      1800FFC69400FFCE9400BD522900CE9C8C00FFFFCE00FFF7BD00FFFFDE00FFFF
      EF00FFFFFF00FFFFF700AD7B7300424218009C7342008C420000C6843100DEA5
      5200DEAD5A00312110007B5A2900B5843100AD7B2900DE943100944A00009C8C
      7B00634A290000000000000000000000000000000000DEF7FF00B5BDC600ADBD
      BD00ADBDBD00CEB59C00C6BDA500C6C6AD00CECEBD00CECEC600D6D6D600E7EF
      CE00846B6B00CEE7EF005231210000000000CE633900D66B4A00DE7B5A0063C6
      390039E7100029211800393939004273840073CEF70063C6F7004AB5EF004AAD
      E7004AA5CE00081821000000000029520800C6633900945231005A1800000008
      6B000821840000086B0084391800F7D6B500FFE7AD00FFEFBD00FFFFD600FFFF
      EF00FFFFEF00FFFFDE00EFD6B500183108009C7342008C420000E7AD6300E7BD
      7B00EFBD840031291800AD8C520000000000A57B3100DE943100BD7321009463
      3900634A290000000000000000000000000000000000DEF7FF00D6E7EF00D6E7
      EF00C6CED600EFDEB500CEB59400CEC6A500CED6B500CED6C600D6DEC600DEDE
      C600BDA58C00C6DEE7006B4A390000000000D67B4A00E78C6B009CBD63004AD6
      08004AFF0000395A290031313100393939003963730021212100101010000000
      0000295A73000000000000000000636331003921100008080800000000001039
      A5001042AD001042A50021215A00F7DEBD00FFDEAD00FFEFB500FFFFCE00FFFF
      D600FFFFDE00FFFFD600EFD6AD00394221009C7342008C420000EFBD8400EFCE
      A500F7D6AD0031292100A58C6B0010100800CE9C5200DE9C3900D6943100944A
      08006B4A290000000000000000000000000000000000DEF7FF00DEEFF700DEEF
      F700DEEFF700EFDEB500FFEFC600FFE7B500FFFFC600FFFFD600FFFFD600FFFF
      CE00A5847300DEF7FF006B5239000000000000000000A5A5A5009C9C9C009494
      9400949494009CE742002121210063636300848484007B7B7B004A4A4A000808
      0800000000000000000000290000CEAD9C00101010001818180010398C00185A
      BD00185AC600185AC600184AA500DEB59C00FFFFEF00FFEFCE00FFE7B500FFEF
      BD00FFF7BD00FFFFCE00C6948400AD9484009C7342008C420000EFCEA500E7D6
      B500EFE7CE00000000000808080063524200E7B56B00DEA54A00CE842900945A
      21006B52310000000000000000000000000000000000E7F7FF00B5C6C600B5BD
      C600B5C6C600B5A59C00D6DEDE00D6D6CE00DEC6A500DEC69C00E7D6AD00EFDE
      B50084848400EFFFFF00633929000000000000000000BDBDBD001010BD003131
      A5009C9C9C00C6FF73007BAD4A003939390084848400737373004A4A4A000808
      08000000000000000000086B0000FFFFFF00212121002929290018529C002173
      DE00297BE7002973DE00216BD6005A424200FFF7EF00FFFFFF00FFE7BD00FFDE
      A500FFF7C600FFD6AD0010290800FFF7F7009C7342008C420000EFD6AD009C94
      8C00CECEC600FFF7EF00F7E7CE00EFCEA500E7B57300DEA55200A55A1000AD8C
      6B007352310000000000000000000000000000000000E7F7FF00BDCECE00BDCE
      CE00BDCECE00BDC6CE00BDA59C00E7E7D600EFEFC600EFE7BD00EFDEB5009C7B
      7B00CEDEDE00EFFFFF002918000000000000000000004A4AEF00A5A5E7001818
      DE008484A500CEFF9400FFF7EF00CEB5AD002921210021212100181818000000
      00000831000000B50000C68C730000000000292929003939390000101800319C
      FF00319CFF00319CFF00298CF700525A6B004A393100D6AD9C00F7E7B500FFDE
      B500EFBDA50010420800B57B6B00000000009C734200B58C5A00A56329000000
      0000DED6D600F7EFE700F7E7CE00EFCE9C00E7B57300D69C42008C420000C6BD
      B500735A310000000000000000000000000000000000E7F7FF00E7F7F700E7F7
      F700E7F7F700E7F7F700E7F7F700CEBDBD00AD8C8C00C6A5A500CECED600E7F7
      F700E7EFF700E7FFFF00633121000000000000000000F7F7F700E7E7E700C6C6
      D6001818DE00B5DEB500FFF7D600BDF78C0063FF52007BFF3900FF843100FF5A
      0800DE390000736B21000000000000000000080808004A4A4A00525252001818
      1800082163001852D6001852A5009CC66B005AF74A0063CE3100B55A2100B542
      0000BD290000736B180000000000000000009C734200FFFFFF006B3910008452
      2100C6B5A500F7E7CE00F7D6B500EFC68C00CE944A008C420000D6C6BD00CEC6
      C6007B5A310000000000000000000000000000000000E7FFFF00C6D6DE00C6D6
      DE00C6D6DE00C6D6DE00C6D6DE00CED6DE00CED6DE00CEDEDE00D6DEE700D6E7
      E700D6E7E700EFFFFF007B635200000000002929290000000000000000000000
      0000B5B5E7005A52CE0094F763005AEF52005ADE5A0052F74A00FF7B3100F752
      0800DE6B390000000000000000000000000018181800424242006B6B6B008C8C
      8C00BDBDBD006B6B6B000808080052DE52000000000000000000000000000000
      0000000000000000000000000000000000009C734200FFFFFF0000000000B58C
      5A008C4200008C4200008C4200008C4200008C420000E7E7E700DEDED600D6D6
      CE008463390000000000000000000000000000000000BD8C4A00BD844200BD84
      4200BD844200BD844200BD844200BD844200BD844200BD844200BD844200BD84
      4200BD844200C68C4A007B6B5200000000000000000000000000000000000000
      0000FFEFDE00847BDE00F7D694009CE74200A5CE4200EF8C3900F77B4A00F7DE
      CE0000000000000000000000000000000000FFFFFF00BDBDBD00181818007B7B
      7B005A5A5A0008080800D6BD8400000000000000000000000000000000000000
      0000000000000000000000000000000000009C7342009C7342009C7342009C73
      42009C7342009C7342009C7342009C734200946B42008C6B42008C6B39008C63
      39008463390000000000000000000000000000000000DE8C2900E78C2100E78C
      2100E78C2900E78C2100E78C2100E78C2100E7841800E7841800F7A54A00EF94
      2900DE8C3900AD8473009C8C840000000000424D3E000000000000003E000000
      2800000040000000D00000000100010000000000800600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FFFFFFF801E007000FFFFFE0018003
      0003FFFFC00180030003C01F80018003000380070001C003000100010000C007
      000100000000E007000000000000C007000000000000C003000000010000C003
      000000C70000C003000100FF0000C0030001E0FF0001C003C003E3FF8003C007
      F803FFFFC007E007FC07FFFFF00FF01FFC7F03FF87FF0000F01F001F03870000
      C007000101030000000100000001000000010000000000000001000000000001
      000000008000000100000000E000000100000000F000000100000000E0000001
      00000000E001000100008000E08300010000C001E0FF0001E000E003C1FF0001
      E000F007C3FF0001F800F81FFFFF000103C0C003F01FFFFF03C0C003C003FFFF
      03C0C0038001FC7F0000E0078003F01F0000C003E007800700008003E0030001
      02008001E001000002008001E0010000F00C8001E0018000F80F80018001F800
      FC1F80018000F003FC1F80010003C00FFC1F80030003803FF81FC007000381FF
      F81FE00F8003FFFFFC1FF81F807FFFFFC0FFF00FFFFFC000003FC0079FFFC000
      003F800387FF0000001C8003E03F000000308003F80F000000008003F0070000
      80018003F00300000003C007F00100000007F83FF0010000000FF83FF8010000
      001FF83FF8010000003FF81FFC010000003FF01FFE010003003FF01FFF010003
      003FF01FFF810003F03FF83FFFE30007F8FFF01FF01F83FFF03FF00FE00F003F
      E01FE00FE007000F0001E00FE007000F0001E00FE007000F0001C007E007000F
      0001C007E00700070001C007E00700000001C007E00700000001C007E0070000
      0001C003E00700080001C003E007000F00018003E007000FE00F8003E007000F
      F01F8003E007000FFC3F0043E007E00FF00F80FFFFFFC0FFC007800F000F803F
      0003800F000F001F00018003000F000300018001000F000000008001000F0000
      00008001000F800000008003000F800080008003000F80008000800300070000
      8000800700010000C000800700010000C000800700010000E001800FFFE10000
      F80F800FFFF10003FFFF800FFFF9E03FFE01FC01FC07FE1FFC00F800F001F80F
      F800E000F001F80FF800C000E000F007F800C000E000E007E001C000E000C003
      8001C000E000C00380008000E000800100000000E001800100000000E0018001
      00000000E003800100000000E0038001000000000007800100000000000FC003
      80008060003FE007C0C0C07F00FFF00FFFFF807FF00FE0FFFF03003FE007807F
      00010017E007003F00010001F81F000700010000800100010001800080008000
      0001800080008001000080008000800300008000800080010000000080008000
      00010000000000018001000000000001FC01000000000001FE01000000000001
      FE7F000F80000001FFFFFC3FC000F039FE7F87FFFFFF0000FC1F00FFF83F0000
      F807000FE0030000F0010003C0000000E000000380000000C000000300000000
      8000000300000000800100030000000700010003000000070003000100000007
      0007000180000007800F000180010007C01F0001C0010007E01FE003C0030007
      F03FE01FE03F0007F87FE01FFFFF0007F80FE07FFB7FFC0FE003801FE00FE007
      8001001F8003C0018001001F0003C00080010001000380008001000000038000
      800100000003800080010000000300008001800000030000C003800080010000
      E00F8000C0000001E01F0001C0000001E03F0001C0000F01C03FF803C000FFC3
      C03FF81F8001FFFF807FF83F8083FFFFFFFFF81F0003FFFFFFFFF80F00010000
      FF9FF80F00000000F803F80F000000008000F80F100000000000F80F10000000
      0000F80F100000000000F80F000000000000F80F000000000000F80F00000000
      0000F80F000100000000F80F000300000001F80F001F000080FFF81F801F0000
      FFFFF8FFC01F0000FFFFF8FFE01FFFFFF801C3FF00048FFFE00181FF000087FF
      C00180FF000183FF8001007F000381FF00010003000780010000000100078001
      0000000000078001000000000007800100000000000780010000000000078001
      0000000000078001000000000007800100010001000780010003000300078001
      000700FF00078001F00F01FF0007800100000000000000000000000000000000
      000000000000}
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'select 1 from dual')
    Left = 16
    Top = 277
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 44
    Top = 277
  end
  object sdGrilla: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <
      item
        Title = 'Siniestro'
        DataField = 'Siniestro'
        FieldIndex = 0
      end
      item
        Title = 'Fecha accidente'
        DataField = 'faccid'
        FieldIndex = 0
      end
      item
        Title = 'CUIL'
        DataField = 'cuil'
        FieldIndex = 0
      end
      item
        Title = 'Contrato'
        DataField = 'contrato'
        FieldIndex = 0
      end
      item
        Title = 'CUIT'
        DataField = 'cuit'
        FieldIndex = 0
      end
      item
        Title = 'Fecha aprob.'
        DataField = 'faprob'
        FieldIndex = 0
      end
      item
        Title = 'Concepto pago'
        DataField = 'conpago'
        FieldIndex = 0
      end
      item
        Title = 'Fecha vencimiento'
        DataField = 'fvencimiento'
        FieldIndex = 0
      end
      item
        Title = 'Cod. carta'
        DataField = 'codcarta'
        FieldIndex = 0
      end
      item
        Title = 'Nro. carta'
        DataField = 'nrocarta'
        FieldIndex = 0
      end
      item
        Title = 'Firmante'
        DataField = 'firmante'
        FieldIndex = 0
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 16
    Top = 305
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
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 20
    Top = 332
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 48
    Top = 332
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'siniestro'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Nro Liq.'
        DataField = 'nroliq'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'F. Accidente'
        DataField = 'faccid'
        Width = 120
        MaxLength = 0
      end
      item
        Title = 'CUIL'
        DataField = 'cuil'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Trabajador'
        DataField = 'trabajador'
        Width = 400
        MaxLength = 0
      end
      item
        Title = 'Contrato'
        DataField = 'contrato'
        Width = 130
        MaxLength = 0
      end
      item
        Title = 'CUIT'
        DataField = 'cuit'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Empresa'
        DataField = 'empresa'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'F. Aprob.'
        DataField = 'faprob'
        Width = 120
        MaxLength = 0
      end
      item
        Title = 'Conpago'
        DataField = 'cp_conpago'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'Conc. Pago'
        DataField = 'conpago'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'Importe'
        DataField = 'importe'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'F. Desde'
        DataField = 'fdesde'
        Width = 120
        MaxLength = 0
      end
      item
        Title = 'F. Hasta'
        DataField = 'fhasta'
        Width = 120
        MaxLength = 0
      end
      item
        Title = 'F. Vencimiento'
        DataField = 'fvencimiento'
        Width = 120
        MaxLength = 0
      end
      item
        Title = 'Domicilio Postal'
        DataField = 'dompostal'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Estado'
        DataField = 'estado'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'Estado Acuse'
        DataField = 'estadoacuse'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Nro. Carta'
        DataField = 'nrocarta'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Beneficiario'
        DataField = 'ce_beneficiario'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Grupo Fam.'
        DataField = 'grupofam'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'Motivo Baja'
        DataField = 'mp_descripcion'
        Width = 200
        MaxLength = 0
      end>
    DataSource = dsConsulta
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PrinterOptions.PrintDialog = PrintDialog
    Left = 76
    Top = 332
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqConsulta
    Fields = <
      item
        DataField = 'siniestro'
        Title = 'Siniestro'
      end
      item
        DataField = 'nroliq'
        Title = 'Nro. Liq'
      end
      item
        DataField = 'faccid'
        Title = 'F. Accidente'
      end
      item
        DataField = 'cuil'
        Title = 'CUIL'
      end
      item
        DataField = 'trabajador'
        Title = 'Trabajador'
      end
      item
        DataField = 'contrato'
        Title = 'Contrato'
      end
      item
        DataField = 'cuit'
        Title = 'CUIT'
      end
      item
        DataField = 'empresa'
        Title = 'Empresa'
      end
      item
        DataField = 'faprob'
        Title = 'F. Aprob'
      end
      item
        DataField = 'cp_conpago'
        Title = 'Conpago'
      end
      item
        DataField = 'conpago'
        Title = 'Conc. pago'
      end
      item
        DataField = 'importe'
        Title = 'Importe'
      end
      item
        DataField = 'fdesde'
        Title = 'F. Desde'
      end
      item
        DataField = 'fhasta'
        Title = 'F. Hasta'
      end
      item
        DataField = 'fvencimiento'
        Title = 'F. Vencimiento'
      end
      item
        DataField = 'dompostal'
        Title = 'Domicilio Postal'
      end
      item
        DataField = 'estado'
        Title = 'Estado'
      end
      item
        DataField = 'estadoacuse'
        Title = 'Estado acuse'
      end
      item
        DataField = 'nrocarta'
        Title = 'Nro. Carta'
      end
      item
        DataField = 'ce_beneficiario'
        Title = 'Beneficiario'
      end
      item
        DataField = 'grupofam'
        Title = 'Grupo Fam.'
      end
      item
        DataField = 'mp_descripcion'
        Title = 'Motivo Baja'
      end>
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
    Left = 104
    Top = 332
  end
  object pmNuevo: TPopupMenu
    OwnerDraw = True
    Left = 44
    Top = 304
    object mnuNuevoILP: TMenuItem
      Caption = 'ILP'
      OnClick = mnuNuevoILPClick
    end
    object mnuNuevoILT: TMenuItem
      Caption = 'ILT'
      OnClick = mnuNuevoILTClick
    end
    object mnuNuevoMort: TMenuItem
      Caption = 'Mortales'
      OnClick = mnuNuevoMortClick
    end
    object mnuNuevoOP: TMenuItem
      Caption = 'OP'
      OnClick = mnuNuevoOPClick
    end
  end
end
