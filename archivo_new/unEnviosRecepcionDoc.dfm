inherited frmEnviosRecepcionDoc: TfrmEnviosRecepcionDoc
  Left = 141
  Top = 114
  Caption = 'Env'#237'os y Recepciones de Documentaci'#243'n'
  ClientHeight = 597
  ClientWidth = 790
  Constraints.MinHeight = 540
  Constraints.MinWidth = 798
  ExplicitLeft = 141
  ExplicitTop = 114
  ExplicitWidth = 798
  ExplicitHeight = 627
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 790
    Height = 152
    Visible = True
    ExplicitWidth = 790
    ExplicitHeight = 152
    DesignSize = (
      790
      152)
    object gbUsuarios: TGroupBox
      Left = 5
      Top = 0
      Width = 298
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Usuarios'
      TabOrder = 0
      DesignSize = (
        298
        43)
      object cmbUsuarios: TDBCheckCombo
        Left = 9
        Top = 15
        Width = 280
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ItemsSeparator = ';'
        DataSource = dsUsuario
        KeyField = 'SE_USUARIO'
        ListField = 'SE_NOMBRE'
      end
    end
    object gbArchivo: TGroupBox
      Left = 5
      Top = 43
      Width = 633
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Archivo'
      TabOrder = 4
      DesignSize = (
        633
        43)
      inline fraTipoArchivo: TfraCodigoDescripcion
        Left = 9
        Top = 15
        Width = 615
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 9
        ExplicitTop = 15
        ExplicitWidth = 615
        DesignSize = (
          615
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 96
          Width = 518
          DataSource = nil
          ExplicitLeft = 96
          ExplicitWidth = 518
        end
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 90
          ExplicitLeft = 2
          ExplicitWidth = 90
        end
      end
    end
    object gbFechaEntrega: TGroupBox
      Left = 418
      Top = 0
      Width = 220
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Entrega'
      TabOrder = 2
      object Label1: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaEntregaDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaEntregaHasta
        TabOrder = 0
      end
      object edFechaEntregaHasta: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaEntregaDesde
        TabOrder = 1
      end
    end
    object gbRemito: TGroupBox
      Left = 6
      Top = 87
      Width = 220
      Height = 43
      Caption = 'Nro. de Remito al Usuario'
      TabOrder = 5
      object Label2: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edRemitoDesde: TIntEdit
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        TabOrder = 0
        OnExit = edRemitoDesdeExit
      end
      object edRemitoHasta: TIntEdit
        Left = 122
        Top = 15
        Width = 89
        Height = 21
        TabOrder = 1
      end
    end
    object rgEstadoRemito: TRadioGroup
      Left = 642
      Top = 0
      Width = 145
      Height = 86
      Anchors = [akTop, akRight]
      Caption = 'Estado Remito al Usuario'
      ItemIndex = 2
      Items.Strings = (
        'Pendientes de Generar'
        'Impresos'
        'Todos')
      TabOrder = 3
    end
    object chkPendientesRecepc: TCheckBox
      Left = 7
      Top = 134
      Width = 147
      Height = 14
      Caption = 'Pendientes de Recepci'#243'n'
      TabOrder = 8
    end
    object chkMostrarExtraviados: TCheckBox
      Left = 167
      Top = 134
      Width = 118
      Height = 14
      Caption = 'Mostrar Extraviados'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object chkNoMostrarBajas: TCheckBox
      Left = 292
      Top = 134
      Width = 106
      Height = 14
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
    object gbLote: TGroupBox
      Left = 307
      Top = 0
      Width = 107
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Lote'
      TabOrder = 1
      object edLote: TIntEdit
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 231
      Top = 87
      Width = 220
      Height = 43
      Caption = 'Nro. de Remito a la Administradora'
      TabOrder = 6
      object Label9: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edRemitoAdminDesde: TIntEdit
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        TabOrder = 0
        OnExit = edRemitoAdminDesdeExit
      end
      object edRemitoAdminHasta: TIntEdit
        Left = 122
        Top = 15
        Width = 89
        Height = 21
        TabOrder = 1
      end
    end
    object rgEstadoRemitoAdmin: TRadioGroup
      Left = 457
      Top = 87
      Width = 330
      Height = 43
      Caption = 'Estado Remito a la Administradora'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Pend. Generar'
        'Impresos'
        'Todos')
      TabOrder = 7
    end
  end
  inherited CoolBar: TCoolBar
    Top = 152
    Width = 790
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 784
      end>
    ExplicitTop = 152
    ExplicitWidth = 790
    inherited ToolBar: TToolBar
      Width = 775
      ExplicitWidth = 775
      DesignSize = (
        771
        23)
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImpresion
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        Visible = True
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        Visible = True
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        Visible = False
        ExplicitLeft = 362
      end
      object tbExtraviado: TToolButton
        Left = 385
        Top = 0
        Hint = 'Extraviado (Ctrl+X)'
        DropdownMenu = pmnuExtraviado
        ImageIndex = 56
        Style = tbsDropDown
        OnClick = tbExtraviadoClick
      end
      object ToolButton2: TToolButton
        Left = 423
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbEnviarMailDoc: TToolButton
        Left = 431
        Top = 0
        Hint = 'Enviar Mail Reclamo de Documentaci'#243'n'
        ImageIndex = 31
        OnClick = tbEnviarMailDocClick
      end
      object ToolButton1: TToolButton
        Left = 454
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 32
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 462
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlSeleccionados: TPanel
        Left = 485
        Top = 0
        Width = 145
        Height = 22
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = ' Cant. Reg.: '
        TabOrder = 0
        object edCantSelecc: TCardinalEdit
          Left = 61
          Top = 0
          Width = 82
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 181
    Width = 790
    Height = 416
    PopupMenu = pmnuSeleccionar
    OnCellClick = GridCellClick
    OnKeyUp = GridKeyUp
    MultiSelect = True
    OnGetCellProps = GridGetCellProps
    OnGetCellParams = nil
    Columns = <
      item
        Expanded = False
        FieldName = 'EC_USUARIO'
        Title.Caption = 'Usuario'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCION'
        Title.Caption = 'Archivo'
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLAVE'
        Title.Caption = 'Clave'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_CAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Caja'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TD_DESCRIPCION'
        Title.Caption = 'Documento'
        Width = 209
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_HOJAS'
        Title.Alignment = taCenter
        Title.Caption = 'Cant. Hojas'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_IDLOTE'
        Title.Alignment = taCenter
        Title.Caption = 'Lote'
        Width = 62
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EC_FECHAENTREGA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Entrega'
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EC_FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recepci'#243'n'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_REMITO'
        Title.Alignment = taCenter
        Title.Caption = 'Remito Usuario'
        Width = 89
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAIMPRESION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Impresi'#243'n Rem. Usuario'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_USUIMPRESION'
        Title.Caption = 'Usuario Impresi'#243'n Rem. Usuario'
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 236
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTAEXTRAVIADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Extraviado'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 126
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODERROR'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Error'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRERROR'
        Title.Caption = 'Descripci'#243'n Error'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_REMITOADMIN'
        Title.Alignment = taCenter
        Title.Caption = 'Remito Admin.'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAIMPRESIONADMIN'
        Title.Alignment = taCenter
        Title.Caption = 'F. Impresi'#243'n Rem. Admin.'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_USUIMPRESIONADMIN'
        Title.Caption = 'Usuario Impresi'#243'n Rem. Admin.'
        Width = 152
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 160
    Top = 230
    Width = 624
    Height = 416
    BorderStyle = bsDialog
    OnEnter = fpAbmEnter
    ExplicitLeft = 160
    ExplicitTop = 230
    ExplicitWidth = 624
    ExplicitHeight = 416
    DesignSize = (
      624
      416)
    inherited BevelAbm: TBevel
      Top = 380
      Width = 616
      ExplicitTop = 380
      ExplicitWidth = 616
    end
    object Label3: TLabel [1]
      Left = 2
      Top = 15
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Usuario'
    end
    object lblDocumento: TLabel [2]
      Left = 2
      Top = 184
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Documento'
    end
    object lblCantidadHojas: TLabel [3]
      Left = 2
      Top = 212
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cant. Hojas'
    end
    object lblObservaciones: TLabel [4]
      Left = 2
      Top = 236
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observac.'
    end
    object Label4: TLabel [5]
      Left = 137
      Top = 212
      Width = 28
      Height = 13
      AutoSize = False
      Caption = 'Lote'
    end
    object Label5: TLabel [6]
      Left = 282
      Top = 212
      Width = 54
      Height = 13
      AutoSize = False
      Caption = 'F. Entrega'
    end
    object Label6: TLabel [7]
      Left = 457
      Top = 212
      Width = 69
      Height = 13
      AutoSize = False
      Caption = 'F. Recepci'#243'n'
    end
    object Label7: TLabel [8]
      Left = 29
      Top = 156
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Caja'
    end
    object Label8: TLabel [9]
      Left = 134
      Top = 156
      Width = 31
      Height = 13
      AutoSize = False
      Caption = 'Error'
    end
    inherited btnAceptar: TButton
      Left = 466
      Top = 386
      TabOrder = 10
      ExplicitLeft = 466
      ExplicitTop = 386
    end
    inherited btnCancelar: TButton
      Left = 544
      Top = 386
      TabOrder = 11
      ExplicitLeft = 544
      ExplicitTop = 386
    end
    inline fraAMUsuario: TfraUsuarios
      Left = 69
      Top = 9
      Width = 547
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 69
      ExplicitTop = 9
      ExplicitWidth = 547
      DesignSize = (
        547
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 64
        Width = 483
        ExplicitLeft = 64
        ExplicitWidth = 483
      end
      inherited edCodigo: TPatternEdit
        Width = 60
        ExplicitWidth = 60
      end
    end
    inline fraAMFiltroArchivo: TfraFiltroArchivo
      Left = 18
      Top = 38
      Width = 598
      Height = 103
      VertScrollBar.Visible = False
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 18
      ExplicitTop = 38
      ExplicitWidth = 598
      ExplicitHeight = 103
      inherited pcFormulario: TJvPageControl
        Width = 598
        ExplicitWidth = 598
        inherited tsNone: TTabSheet
          ExplicitWidth = 598
        end
        inherited tsSiniestro: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
          inherited lbRSocial: TLabel
            FocusControl = fraAMFiltroArchivo.fraEmpresaSiniestro.cmbRSocial
          end
        end
        inherited tsBiblioratoNota: TTabSheet
          inherited lbCUIT: TLabel
            FocusControl = fraAMFiltroArchivo.fraEmpresaNota.mskCUIT
          end
        end
        inherited tsExtractoBanc: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
          inherited fraBancoExtracto: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
          inherited fraCuentaBancariaExtracto: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
        end
      end
      inherited pnSeleccionArchivo: TPanel
        Width = 598
        ExplicitWidth = 598
        DesignSize = (
          598
          24)
        inherited btnCargarCodigoBarras: TJvXPButton
          Left = 501
          ExplicitLeft = 501
        end
        inherited fraTipoArchivo: TfraCodDesc
          Width = 445
          ExplicitWidth = 445
          DesignSize = (
            445
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 380
            ExplicitWidth = 380
          end
          inherited Propiedades: TPropiedadesFrame
            OnChange = fraTipoArchivoPropiedadesChange
          end
        end
      end
      inherited ImageList: TImageList
        Bitmap = {
          494C0101010009003C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
          0000000000003600000028000000400000001000000001002000000000000010
          0000000000000000000000000000000000000000000000000000EFEFEF00CECE
          CE00CECECE00F7F7F70000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF0073635A007373
          73009C84A5007B7B7B00F7F7F700000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF006B5A5A0052BD
          FF003973CE00A58CA5007B737300F7F7F7000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00E7E7E700BDBDBD005A5A
          630052C6FF003973CE00A58CA5007B737300F7F7F70000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000AD390800CE421800E7523100F763
          4A0084525A0052C6FF003973CE00AD8CAD009C9C9C00DEDEDE00B5B5B500BDB5
          B500DEDEDE00FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000C6421000EF5A4200FF6B5A00FF7B
          6300DE6B4200847B7B0052C6FF006B84AD007B5A4A00A5736B00D6B59400E7CE
          B500A5847B00847B7B00F7F7F700000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000AD421000FF6B5200FF846300FF94
          7300E7A57300FFD6A500B55A4A009C7B7300EFB59400FFFFCE00FFFFD600FFFF
          DE00FFFFEF00E7CEC60073737300FFFFFF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000DEDEDE00CE4A2100FF8C7300BD4A
          1800FFC69400FFCE9400BD522900CE9C8C00FFFFCE00FFF7BD00FFFFDE00FFFF
          EF00FFFFFF00FFFFF700AD7B7300DEDEDE000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00B5B5B5005A2100000008
          6B000821840000086B0084391800F7D6B500FFE7AD00FFEFBD00FFFFD600FFFF
          EF00FFFFEF00FFFFDE00EFD6B500ADADAD000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000004242420008080800000000001039
          A5001042AD001042A50021215A00F7DEBD00FFDEAD00FFEFB500FFFFCE00FFFF
          D600FFFFDE00FFFFD600EFD6AD00A5A5A5000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101010001818180010398C00185A
          BD00185AC600185AC600184AA500DEB59C00FFFFEF00FFEFCE00FFE7B500FFEF
          BD00FFF7BD00FFFFCE00C6948400D6D6D6000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000212121002929290018529C002173
          DE00297BE7002973DE00216BD600634A4A00FFF7EF00FFFFFF00FFE7BD00FFDE
          A500FFF7C600FFD6AD005A525200FFFFFF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000292929003939390000101800319C
          FF00319CFF00319CFF00298CF7006B7B94007B635A00D6AD9C00F7E7B500FFDE
          B500EFBDA500635A5A00EFEFEF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000080808004A4A4A00525252001818
          1800082163001852D6001852A500CECECE00F7F7F700D6D6D600B5B5B500B5B5
          B500DEDEDE00FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000C6C6C600424242006B6B6B008C8C
          8C00BDBDBD006B6B6B0008080800F7F7F7000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00BDBDBD00181818007B7B
          7B005A5A5A0008080800DEDEDE00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000424D3E000000000000003E000000
          2800000040000000100000000100010000000000800000000000000000000000
          000000000000000000000000FFFFFF00C3FF00000000000081FF000000000000
          80FF000000000000007F00000000000000030000000000000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000000000003000000000000
          00FF00000000000001FF00000000000000000000000000000000000000000000
          000000000000}
      end
    end
    inline fraAMTipoDocumento: TfraCodigoDescripcion
      Left = 68
      Top = 180
      Width = 548
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ExplicitLeft = 68
      ExplicitTop = 180
      ExplicitWidth = 548
      DesignSize = (
        548
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 483
        ExplicitWidth = 483
      end
    end
    object edAMHojas: TIntEdit
      Left = 69
      Top = 209
      Width = 61
      Height = 21
      TabOrder = 5
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edAMObservaciones: TMemo
      Left = 69
      Top = 237
      Width = 546
      Height = 138
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 512
      TabOrder = 9
    end
    object edAMLote: TIntEdit
      Left = 163
      Top = 209
      Width = 89
      Height = 21
      TabOrder = 6
      OnExit = edRemitoDesdeExit
      Alignment = taRightJustify
    end
    object edAMFEntrega: TDateComboBox
      Left = 336
      Top = 209
      Width = 89
      Height = 21
      TabOrder = 7
    end
    object edAMFRecepcion: TDateComboBox
      Left = 526
      Top = 209
      Width = 89
      Height = 21
      TabOrder = 8
    end
    object edAMCaja: TIntEdit
      Left = 69
      Top = 153
      Width = 61
      Height = 21
      TabOrder = 2
      Alignment = taRightJustify
      MaxLength = 8
    end
    inline fraAMErrorCarga: TfraStaticCTB_TABLAS
      Left = 160
      Top = 152
      Width = 456
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 160
      ExplicitTop = 152
      ExplicitWidth = 456
      DesignSize = (
        456
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 392
        ExplicitWidth = 392
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT EC_ID, EC_USUARIO, EC_IDLOTE, EC_HOJAS, EC_FECHAENTREGA, '
      
        '       EC_FECHARECEPCION, TA_DESCRIPCION, TD_DESCRIPCION, ARCHIV' +
        'O.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) CLAVE '
      
        '  FROM RTC_TIPOCLAVE, RAR_ARCHIVO, RTD_TIPODOCUMENTO, RTA_TIPOAR' +
        'CHIVO, REC_ENVIORECEPCIONDOC '
      ' WHERE EC_TIPOARCHIVO = TA_ID(+) '
      '   AND EC_IDTIPODOCUMENTO = TD_ID(+) '
      '   AND EC_IDARCHIVO = AR_ID(+) '
      '   AND TA_FORMULARIO = TC_CLAVE(+)'
      '   AND 1 = 2'
      '   ')
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  object pmnuSeleccionar: TPopupMenu
    Left = 24
    Top = 320
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
  object sdqUsuario: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT SE_USUARIO, SE_NOMBRE || DECODE(SE_FECHABAJA, NULL, '#39#39', '#39 +
        ' (Dado de baja)'#39') as SE_NOMBRE, SE_SECTOR, SE_PERFIL, SE_FECHABA' +
        'JA'
      '  FROM USE_USUARIOS, USC_SECTORES'
      ' WHERE SE_SECTOR=SC_CODIGO'
      '   AND SC_SISTEMAARCHIVO='#39'S'#39
      '   AND SE_USUARIOGENERICO = '#39'N'#39
      'ORDER BY SE_NOMBRE')
    Left = 61
    Top = 12
  end
  object dsUsuario: TDataSource
    DataSet = sdqUsuario
    Left = 89
    Top = 12
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
        LinkControl = tbSalir2
      end
      item
        Key = 16472
        LinkControl = tbExtraviado
      end>
    Left = 108
    Top = 200
  end
  object pmnuImpresion: TPopupMenu
    Left = 53
    Top = 320
    object mnuUsuario: TMenuItem
      Caption = 'Usuario'
      object mnuUsuGenerarRemito: TMenuItem
        Caption = '&Generar Remito'
        OnClick = mnuUsuGenerarRemitoClick
      end
      object mnuUsuImprimirRemito: TMenuItem
        Caption = '&Reimprimir Remito'
        OnClick = mnuUsuImprimirRemitoClick
      end
    end
    object mnuAdministradora: TMenuItem
      Caption = 'Administradora'
      object mnuAdminGenerarRemito: TMenuItem
        Caption = '&Generar Remito'
        OnClick = mnuAdminGenerarRemitoClick
      end
      object mnuAdminUsuImprimirRemito: TMenuItem
        Caption = '&Reimprimir Remito'
        OnClick = mnuAdminUsuImprimirRemitoClick
      end
    end
    object mnuImprimirListado: TMenuItem
      Caption = '&Imprimir Listado'
      OnClick = mnuImprimirListadoClick
    end
  end
  object pmnuExtraviado: TPopupMenu
    Left = 81
    Top = 320
    object mnuMarcarExtraviado: TMenuItem
      Caption = 'Marcar Extraviado'
      OnClick = mnuMarcarExtraviadoClick
    end
    object mnuDesmarcarExtraviado: TMenuItem
      Caption = 'Desmarcar Extraviado'
      OnClick = mnuMarcarExtraviadoClick
    end
  end
end
