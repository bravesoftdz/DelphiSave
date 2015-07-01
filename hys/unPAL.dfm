object frmPAL: TfrmPAL
  Left = 145
  Top = 82
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 638
  ClientWidth = 933
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlVisitas: TPanel
    Left = 648
    Top = 0
    Width = 285
    Height = 638
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object CoolBar3: TCoolBar
      Left = 0
      Top = 0
      Width = 285
      Height = 30
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 26
          Width = 279
        end>
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 272
        Height = 26
        BorderWidth = 1
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbVisAgregar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Nuevo (Ctrl+V)'
          ImageIndex = 6
          OnClick = tbVisAgregarClick
        end
        object tbVisQuitar: TToolButton
          Left = 23
          Top = 0
          Hint = 'Eliminar (Ctrl+E)'
          ImageIndex = 8
          OnClick = tbVisQuitarClick
        end
        object ToolButton5: TToolButton
          Left = 46
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object tbVisOrdenar: TToolButton
          Left = 54
          Top = 0
          Caption = 'tbVisOrdenar'
          ImageIndex = 2
          OnClick = tbVisOrdenarClick
        end
      end
    end
    object dbgVisitas: TArtDBGrid
      Left = 0
      Top = 30
      Width = 285
      Height = 487
      Align = alClient
      DataSource = dsVisitas
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      IniStorage = FormPlacement
      OnGetCellParams = dbgVisitasGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Caption = 'Tipo'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ps_fechavisita'
          Title.Caption = 'Fecha'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PS_FECHACOMPROMETIDA'
          Title.Caption = 'Fecha Comprometida'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PS_USUALTA'
          Title.Caption = 'Usuario de Alta'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PS_FECHAALTA'
          Title.Caption = 'Fecha de Alta'
          Visible = True
        end>
    end
    object fpVisita: TFormPanel
      Left = 4
      Top = 138
      Width = 270
      Height = 124
      Caption = 'Visitas de Seguimiento de Recomend.'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      Position = poScreenCenter
      Constraints.MaxHeight = 130
      Constraints.MinHeight = 97
      Constraints.MinWidth = 200
      DesignSize = (
        270
        124)
      object Label5: TLabel
        Left = 8
        Top = 40
        Width = 87
        Height = 13
        Caption = 'Fecha de la Visita:'
      end
      object Bevel7: TBevel
        Left = 4
        Top = 88
        Width = 262
        Height = 2
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Label3: TLabel
        Left = 8
        Top = 12
        Width = 24
        Height = 13
        Caption = 'Tipo:'
      end
      object lbFechaComprometida: TLabel
        Left = 8
        Top = 64
        Width = 103
        Height = 13
        Caption = 'Fecha Comprometida:'
        Visible = False
      end
      object btnVisAceptar: TButton
        Left = 111
        Top = 94
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        TabOrder = 2
        OnClick = btnVisAceptarClick
      end
      object btnVisCancelar: TButton
        Left = 191
        Top = 94
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 3
      end
      object edVisFecha: TDateComboBox
        Left = 126
        Top = 36
        Width = 98
        Height = 21
        MinDate = 36526.000000000000000000
        MaxDateCombo = edFechaCumplimiento
        AutoExit = True
        TabOrder = 1
      end
      object cmbVisTipo: TExComboBox
        Left = 126
        Top = 8
        Width = 139
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 0
        Text = 'C=Cumplimiento'
        OnChange = cmbVisTipoChange
        Items.Strings = (
          'C=Cumplimiento'
          'I=Incumplimiento')
        ItemIndex = 0
        Options = []
        ValueWidth = 64
      end
      object edFechaComprometida: TDateComboBox
        Left = 126
        Top = 60
        Width = 98
        Height = 21
        MinDate = 36526.000000000000000000
        AutoExit = True
        TabOrder = 4
        Visible = False
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 517
      Width = 285
      Height = 121
      Align = alBottom
      TabOrder = 3
      object Label1: TLabel
        Left = 6
        Top = 7
        Width = 67
        Height = 13
        Caption = 'Nivel de Firma'
      end
      object chkNivelFirmas: TCheckListBox
        Left = 3
        Top = 26
        Width = 279
        Height = 90
        OnClickCheck = chkNivelFirmasClickCheck
        ItemHeight = 13
        TabOrder = 0
      end
      object cbSinFirmas: TCheckBox
        Left = 91
        Top = 6
        Width = 97
        Height = 17
        Caption = 'Sin Firmas'
        TabOrder = 1
        OnClick = cbSinFirmasClick
      end
    end
  end
  object pnlRecomendaciones: TPanel
    Left = 0
    Top = 0
    Width = 648
    Height = 638
    Align = alClient
    TabOrder = 1
    object CoolBar1: TCoolBar
      Left = 1
      Top = 25
      Width = 646
      Height = 30
      Bands = <
        item
          Control = tBarPlanMejoras
          ImageIndex = -1
          MinHeight = 26
          Width = 640
        end
        item
          Control = DBMemo1
          ImageIndex = -1
          Width = 640
        end>
      object tBarPlanMejoras: TToolBar
        Left = 9
        Top = 0
        Width = 633
        Height = 26
        BorderWidth = 1
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Wrapable = False
        object tbPMRefrescar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar (F5)'
          Caption = 'tbPMRefrescar'
          ImageIndex = 0
          OnClick = tbPMRefrescarClick
        end
        object ToolButton3: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object tbPMNuevo: TToolButton
          Left = 31
          Top = 0
          Hint = 'Nuevo (Ctrl+N)'
          ImageIndex = 6
          OnClick = tbPMNuevoClick
        end
        object tbPMModificar: TToolButton
          Left = 54
          Top = 0
          Hint = 'Modificar (Ctrl+M)'
          ImageIndex = 7
          OnClick = tbPMModificarClick
        end
        object tbPMEliminar: TToolButton
          Left = 77
          Top = 0
          Hint = 'Eliminar (Del)'
          ImageIndex = 8
          OnClick = tbPMEliminarClick
        end
        object ToolButton9: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object tbHistorico: TToolButton
          Left = 108
          Top = 0
          Hint = 'Hist'#243'rico'
          Caption = 'Hist'#243'rico'
          ImageIndex = 16
          OnClick = tbHistoricoClick
        end
        object ToolButton2: TToolButton
          Left = 131
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object tbPMOrdenar: TToolButton
          Left = 139
          Top = 0
          Hint = 'Ordenar (Ctrl+O)'
          ImageIndex = 2
          OnClick = tbPMOrdenarClick
        end
        object ToolButton11: TToolButton
          Left = 162
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object tbPMExportar: TToolButton
          Left = 170
          Top = 0
          Hint = 'Exportar (Ctrl+E)'
          ImageIndex = 3
          OnClick = tbPMExportarClick
        end
        object ToolButton1: TToolButton
          Left = 193
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object tbNoAmerita: TToolButton
          Left = 201
          Top = 0
          Hint = 'Recepci'#243'n de No Amerita'
          ImageIndex = 44
          OnClick = tbNoAmeritaClick
        end
        object tbSeleccionarTodo: TToolButton
          Left = 224
          Top = 0
          Hint = 'Seleccionar Todo'
          ImageIndex = 46
          OnClick = tbSeleccionarTodoClick
        end
      end
      object DBMemo1: TDBMemo
        Left = 9
        Top = 28
        Width = 633
        Height = 25
        TabOrder = 1
      end
    end
    object dbgPAL: TArtDBGrid
      Left = 1
      Top = 55
      Width = 646
      Height = 582
      Align = alClient
      DataSource = dsPAL
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = tbPMModificarClick
      IniStorage = FormPlacement
      MultiSelect = True
      OnGetCellParams = dbgPALGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'tipoanexo'
          Title.Caption = 'Anexo'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PA_ITEMANEXO'
          Title.Caption = 'Nro. Item'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescItem'
          Title.Caption = 'Desc.Item'
          Width = 255
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PA_CUMPLIMIENTO'
          Title.Alignment = taCenter
          Title.Caption = 'F.Cumplimiento'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PA_SEGUIMIENTO'
          Title.Alignment = taCenter
          Title.Caption = 'F.Seguimiento'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PA_TIPO'
          Title.Caption = 'Tipo'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PA_OPERATIVO'
          Title.Caption = 'Operativo'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PA_FECHACUMPLIMIENTOPOST'
          Title.Caption = 'Fecha Cumplimiento Posterior'
          Width = 181
          Visible = True
        end>
    end
    object fpPAL: TFormPanel
      Left = 32
      Top = 132
      Width = 547
      Height = 132
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poScreenCenter
      DesignSize = (
        547
        132)
      object Bevel2: TBevel
        Left = 4
        Top = 93
        Width = 539
        Height = 5
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object lblItem: TLabel
        Left = 8
        Top = 11
        Width = 23
        Height = 13
        Caption = 'Item:'
      end
      object lblVisita: TLabel
        Left = 9
        Top = 68
        Width = 28
        Height = 13
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Visita:'
      end
      object btnBuscarVisitas: TSpeedButton
        Left = 517
        Top = 65
        Width = 23
        Height = 22
        Hint = 'Buscar Visita'
        Anchors = [akRight, akBottom]
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000003131
          310031313100FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000031313100C6C6C600FFFF
          FF00C6C6C600000000000000000031636300639CCE0000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000031313100C6C6C600FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000316363009CCECE00C6D6EF0000000000FF00FF00FF00
          FF000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF63
          63000000000031636300639CCE00C6D6EF0000000000FF00FF00FF00FF00FF00
          FF0084848400FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000
          000031636300639CCE00C6D6EF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFCECE00FF636300FFCECE00FF636300000000003163
          6300639CCE009CCECE000000000000000000FF00FF00FF00FF00FF00FF003131
          3100DEDEDE000000000000000000000000000000000000000000639CCE00319C
          CE00C6D6EF0000000000FFFFFF0031313100FF00FF00FF00FF0000000000FFFF
          FF0000000000CECE3100FFFF9C00CECE3100CECE31000000000000000000319C
          CE0000000000FF636300FFCECE00C6C6C60000000000FF00FF00FF00FF000000
          0000CECE3100FFFF9C00FFFF9C00CECE3100CECE3100CECE3100000000000000
          0000FFCECE00FF636300FF636300FFFFFF0031313100FF00FF0000000000FFFF
          CE00FFFFFF00FFEFCE00FFFF9C00CECE6300CECE3100CECE3100CECE31000000
          0000FF636300FFCECE00FF636300FFCECE00C6C6C6000000000000000000FFFF
          9C00FFEFCE00FFEFCE00FFFF9C00CECE6300CECE3100CECE3100CECE31000000
          0000FFCECE00FFCECE00FFFFFF00FFFFFF00FFFFFF003131310000000000FFFF
          9C00FFFF9C00FFFF9C00FFCE6300CECE3100CECE3100CE9C3100CE9C31000000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6003131310000000000FFFF
          3100FFCE9C00FFCE9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000
          000094949400DEDEDE00C6C6C6003131310000000000FF00FF00FF00FF000000
          0000CECE6300CECE6300CECE3100CECE3100CECE31009C9C310000000000DEDE
          DE00B5B5B500181818006363630000000000FF00FF00FF00FF00FF00FF00FF00
          FF0000000000CECE3100CECE3100CE9C3100CE9C310000000000848484008484
          8400848484003131310000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000000000000000000000000000000000000000
          00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnBuscarVisitasClick
      end
      object lbFCumplimiento: TLabel
        Left = 8
        Top = 40
        Width = 98
        Height = 13
        Caption = 'Fecha Cumplimiento:'
      end
      object lblFechaSeguimiento: TLabel
        Left = 224
        Top = 40
        Width = 91
        Height = 13
        Caption = 'Fecha Seguimiento'
      end
      object btnPMAceptar: TButton
        Left = 386
        Top = 99
        Width = 75
        Height = 27
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        TabOrder = 4
        OnClick = btnPMAceptarClick
      end
      object btnPMCancelar: TButton
        Left = 466
        Top = 99
        Width = 75
        Height = 27
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 5
      end
      object edVisita: TEdit
        Left = 45
        Top = 66
        Width = 463
        Height = 21
        TabStop = False
        Anchors = [akLeft, akRight, akBottom]
        Color = clSilver
        ReadOnly = True
        TabOrder = 3
      end
      inline fraItem: TfraCodigoDescripcion
        Left = 48
        Top = 8
        Width = 466
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 48
        ExplicitTop = 8
        ExplicitWidth = 466
        DesignSize = (
          466
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 399
          ExplicitWidth = 399
        end
      end
      object edFechaCumplimiento: TDateComboBox
        Left = 110
        Top = 36
        Width = 91
        Height = 21
        MinDate = 2.000000000000000000
        MaxDate = 73051.000000000000000000
        MinDateCombo = edVisFecha
        DialogTitle = 'Select a Date'
        GlyphKind = gkCustom
        Glyph.Data = {
          76050000424D760500000000000036000000280000001C0000000C0000000100
          2000000000004005000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
          0000800000008000000000000000800000000000000000000000800000008080
          8000FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
          0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
          80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
          C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
          8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00}
        StartOfWeek = Mon
        TabOrder = 1
      end
      object edFechaSeguimiento: TDateComboBox
        Left = 320
        Top = 36
        Width = 90
        Height = 21
        MinDate = 2.000000000000000000
        MaxDate = 73051.000000000000000000
        MinDateCombo = edVisFecha
        DialogTitle = 'Select a Date'
        GlyphKind = gkCustom
        Glyph.Data = {
          76050000424D760500000000000036000000280000001C0000000C0000000100
          2000000000004005000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
          0000800000008000000000000000800000000000000000000000800000008080
          8000FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
          0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
          80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
          C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
          8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00}
        StartOfWeek = Mon
        TabOrder = 2
      end
    end
    object pnlHeaderVisitas: TPanel
      Left = 1
      Top = 1
      Width = 646
      Height = 24
      Align = alTop
      TabOrder = 3
      DesignSize = (
        646
        24)
      object Label7: TLabel
        Left = 529
        Top = 5
        Width = 79
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Carga Manual'
        FocusControl = pnlColor7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 239
      end
      object chkTodosOps: TCheckBox
        Left = 8
        Top = 3
        Width = 125
        Height = 17
        Caption = 'Todos los Operativos'
        TabOrder = 0
      end
      object pnlColor7: TPanel
        Left = 516
        Top = 6
        Width = 10
        Height = 10
        Hint = 'Cerrado'
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Color = 13083246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object fpHistorico: TFormPanel
    Left = 64
    Top = 286
    Width = 547
    Height = 221
    Caption = 'Hist'#243'rico Item'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poScreenCenter
    object dbgHistorico: TArtDBGrid
      Left = 0
      Top = 30
      Width = 547
      Height = 191
      Align = alClient
      DataSource = dsHistorico
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = tbPMModificarClick
      IniStorage = FormPlacement
      MultiSelect = True
      OnGetCellParams = dbgPALGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'tipoanexo'
          Title.Caption = 'Tipo Anexo'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pa_itemanexo'
          Title.Caption = 'Nro. Item'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descitem'
          Title.Caption = 'Desc.Item'
          Width = 255
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hp_cumplimiento'
          Title.Caption = 'F.Cumplimiento'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hp_seguimiento'
          Title.Caption = 'F.Seguimiento'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hp_fechamodif'
          Title.Caption = 'Fecha Carga'
          Width = 135
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hp_usumodif'
          Title.Caption = 'Usuario Carga'
          Width = 111
          Visible = True
        end>
    end
    object CoolBar2: TCoolBar
      Left = 0
      Top = 0
      Width = 547
      Height = 30
      Bands = <
        item
          Control = ToolBar2
          ImageIndex = -1
          MinHeight = 26
          Width = 541
        end
        item
          Control = DBMemo2
          ImageIndex = -1
          Width = 541
        end>
      object ToolBar2: TToolBar
        Left = 9
        Top = 0
        Width = 534
        Height = 26
        BorderWidth = 1
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Wrapable = False
        object tbSalir: TToolButton
          Left = 0
          Top = 0
          Hint = 'Salir'
          Caption = 'Salir'
          ImageIndex = 5
          OnClick = tbSalirClick
        end
      end
      object DBMemo2: TDBMemo
        Left = 9
        Top = 28
        Width = 534
        Height = 25
        TabOrder = 1
      end
    end
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Diagn'#243'stico'
        TitleAlignment = taCenter
        DataField = 'DE_DIAGNOSTICO'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'Tipo'
        TitleAlignment = taCenter
        DataField = 'TIPO'
        MaxLength = 17
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'DE_DESCRIPCION1'
        MaxLength = 60
      end>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Diagn'#243'stico por Establecimiento'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Detail.MaxLines = 7
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    Left = 102
    Top = 288
  end
  object FormPlacement: TFormPlacement
    Options = []
    UseRegistry = True
    Left = 132
    Top = 288
  end
  object sdqPAL: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqPALAfterScroll
    SQL.Strings = (
      'SELECT  pa_id,'
      '        pa_cuit,'
      '        pa_estableci,'
      '        pa_tipo,'
      '        pa_operativo,'
      '        pa_anexo,'
      '        pa_itemanexo,'
      '        pa_cumplimiento,'
      '        pa_seguimiento,'
      '        pa_fechaalta,'
      '        pa_usualta,'
      '        pa_fechamodif,'
      '        pa_usumodif,'
      '        pa_fechabaja,'
      '        pa_usubaja,'
      
        '        DECODE (pa_noamerita, '#39'S'#39', '#39'No Amerita'#39', ai_descripcion)' +
        ' descitem,'
      '        ai_anexosrt tipoanexo,'
      '        pa_idvisita,'
      '        pa_noamerita,'
      '        pa_fechacumplimientopost'
      '  FROM  hys.hpa_pal,'
      '        art.pai_anexo2items'
      ' WHERE  pa_anexo = ai_anexo(+)'
      '    AND ai_codigo(+) = pa_itemanexo'
      '    AND pa_cuit = :cuit'
      '    AND pa_estableci = :estableci'
      '    AND pa_tipo = :tipo')
    Left = 12
    Top = 258
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end>
  end
  object dsPAL: TDataSource
    DataSet = sdqPAL
    Left = 42
    Top = 258
  end
  object sdPAL: TSortDialog
    Caption = 'Orden'
    DataSet = sdqPAL
    SortFields = <
      item
        Title = 'Anexo'
        DataField = 'TIPOANEXO'
        FieldIndex = 1
      end
      item
        Title = 'Nro. Item'
        DataField = 'PA_ITEMANEXO'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'Desc, Item'
        DataField = 'DESCITEM'
        FieldIndex = 1
      end
      item
        Title = 'F.Cumplimiento'
        DataField = 'PA_CUMPLIMIENTO'
        FieldIndex = 1
      end
      item
        Title = 'F.Seguimiento'
        DataField = 'PA_SEGUIMIENTO'
        FieldIndex = 1
      end
      item
        Title = 'Tipo'
        DataField = 'PA_TIPO'
        FieldIndex = 1
      end
      item
        Title = 'Operativo'
        DataField = 'PA_OPERATIVO'
        FieldIndex = 1
      end
      item
        Title = 'Fecha Cumplimiento Posterior'
        DataField = 'PA_FECHACUMPLIMIENTOPOST'
        FieldIndex = 1
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 72
    Top = 258
  end
  object Export: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqPAL
    Fields = <>
    IniStorage = FormPlacement
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
    Left = 132
    Top = 258
  end
  object sdqVisitas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   ps_id, ps_idpal, ps_fechavisita, ps_tiposeguimiento, ps' +
        '_idvisita, ps_fechaalta, ps_usualta, ps_fechamodif, ps_usumodif,'
      
        '         ps_fechabaja, ps_usubaja, iif_char(ps_tiposeguimiento, ' +
        #39'C'#39', '#39'Cumplimiento'#39', '#39'Incumplimiento'#39') tipo,ps_fechacomprometida'
      '    FROM hys.hps_palseguimiento'
      '   WHERE ps_idpal = :pa_id'
      'ORDER BY ps_fechavisita DESC'
      '')
    Left = 12
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pa_id'
        ParamType = ptInput
      end>
  end
  object dsVisitas: TDataSource
    DataSet = sdqVisitas
    Left = 42
    Top = 288
  end
  object sdVisitas: TSortDialog
    Caption = 'Orden'
    DataSet = sdqVisitas
    SortFields = <
      item
        Title = 'Tipo'
        DataField = 'TIPO'
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'RV_FECHA'
        FieldIndex = 1
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 72
    Top = 288
  end
  object qpPAL: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Recomendaci'#243'n'
        TitleAlignment = taCenter
        DataField = 'RE_RECOMENDACION'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'Cumplimiento'
        TitleAlignment = taCenter
        DataField = 'RE_CUMPLIMIENTO'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'Seguimiento'
        TitleAlignment = taCenter
        DataField = 'RE_SEGUIMIENTO'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'RE_DESCRIPCION1'
        MaxLength = 60
      end>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Recomendaciones por Establecimiento'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -11
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = []
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Detail.MaxLines = 7
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    Left = 102
    Top = 258
  end
  object sccShortCut: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbPMNuevo
      end
      item
        Key = 16461
        LinkControl = tbPMModificar
      end
      item
        Key = 46
        LinkControl = tbPMEliminar
      end
      item
        Key = 16463
      end
      item
        Key = 16453
        LinkControl = tbVisQuitar
      end
      item
        Key = 16457
      end
      item
        Key = 16449
        OnShortCutPress = btnBuscarVisitasClick
      end
      item
        Key = 16470
        LinkControl = tbVisAgregar
      end
      item
        Key = 116
        LinkControl = tbPMRefrescar
      end>
    Enabled = False
    Left = 163
    Top = 288
  end
  object sdqHistorico: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT pa_anexo, hp_cumplimiento, hp_seguimiento, hp_fechamodif,' +
        ' hp_usumodif, ai_descripcion descitem, ai_anexosrt tipoanexo,'
      '       pa_itemanexo'
      '  FROM hys.hhp_historicopal, hys.hpa_pal, art.pai_anexo2items'
      ' WHERE pa_anexo = ai_anexo'
      '   AND ai_codigo = pa_itemanexo'
      '   AND pa_id = hp_idpal'
      '   AND pa_id = :pa_id'
      'ORDER BY hp_id desc')
    Left = 12
    Top = 318
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pa_id'
        ParamType = ptInput
      end>
  end
  object dsHistorico: TDataSource
    DataSet = sdqHistorico
    Left = 42
    Top = 318
  end
end
