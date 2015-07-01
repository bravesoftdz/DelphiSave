object frmTextosPredeterminados: TfrmTextosPredeterminados
  Left = 96
  Top = 71
  Width = 780
  Height = 570
  Caption = 'Texto Predeterminados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 543
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Grid: TArtDBGrid
      Left = 0
      Top = 67
      Width = 377
      Height = 476
      Align = alClient
      DataSource = dsTextoPredeterminados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = GridDrawColumnCell
      OnDblClick = GridDblClick
      ClearSelection = False
      OnGetCellParams = GridGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TS_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TS_ID'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPOCONTACTO'
          Title.Caption = 'Tipo Contacto'
          Width = 129
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TS_TEXTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TS_USUALTA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TS_FECHAALTA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TS_USUBAJA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TS_FECHABAJA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TS_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Visible = True
        end>
    end
    object CoolBar: TCoolBar
      Left = 0
      Top = 0
      Width = 377
      Height = 29
      Bands = <
        item
          Control = ToolBar
          ImageIndex = -1
          MinHeight = 27
          Width = 373
        end>
      object ToolBar: TToolBar
        Left = 9
        Top = 0
        Width = 360
        Height = 27
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = []
        Flat = True
        HotImages = DmEmision.ilColor
        Images = DmEmision.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbRefrescar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar (F5)'
          ImageIndex = 0
          OnClick = tbRefrescarClick
        end
        object TToolButton
          Left = 23
          Top = 0
          Width = 8
          ImageIndex = 14
          Style = tbsSeparator
        end
        object tbNuevo: TToolButton
          Left = 31
          Top = 0
          Hint = 'Nuevo (Ctrl+N)'
          ImageIndex = 6
          OnClick = tbNuevoClick
        end
        object tbModificar: TToolButton
          Left = 54
          Top = 0
          Hint = 'Modificar (Ctrl+M)'
          ImageIndex = 7
          OnClick = tbModificarClick
        end
        object tbEliminar: TToolButton
          Left = 77
          Top = 0
          Hint = 'Dar de Baja (Ctrl+Del)'
          ImageIndex = 8
          OnClick = tbEliminarClick
        end
        object TToolButton
          Left = 100
          Top = 0
          Width = 8
          ImageIndex = 3
          Style = tbsSeparator
        end
        object tbPropiedades: TToolButton
          Left = 108
          Top = 0
          Hint = 'Seleccionar/DesSeleccionar'
          ImageIndex = 13
          OnClick = tbPropiedadesClick
        end
        object TToolButton
          Left = 131
          Top = 0
          Width = 8
          ImageIndex = 5
          Style = tbsSeparator
        end
        object tbImprimir: TToolButton
          Left = 139
          Top = 0
          Hint = 'Imprimir (Ctrl+I)'
          Enabled = False
          ImageIndex = 4
          Visible = False
        end
        object tbExportar: TToolButton
          Left = 162
          Top = 0
          Hint = 'Exportar (Ctrl+E)'
          Enabled = False
          ImageIndex = 3
          Visible = False
        end
        object tbEnviarMail: TToolButton
          Left = 185
          Top = 0
          Hint = 'Enviar E-Mail'
          Enabled = False
          ImageIndex = 31
          Visible = False
        end
        object TToolButton
          Left = 208
          Top = 0
          Width = 8
          ImageIndex = 4
          Style = tbsSeparator
          Visible = False
        end
        object tbBuscar: TToolButton
          Left = 216
          Top = 0
          Hint = 'Buscar'
          ImageIndex = 14
          Style = tbsCheck
          Visible = False
          OnClick = tbBuscarClick
        end
        object tbMaxRegistros: TToolButton
          Left = 239
          Top = 0
          Hint = 'Cantidad'
          ImageIndex = 12
          Style = tbsCheck
          Visible = False
        end
        object TToolButton
          Left = 262
          Top = 0
          Width = 8
          ImageIndex = 6
          Style = tbsSeparator
        end
        object tbSalir: TToolButton
          Left = 270
          Top = 0
          Hint = 'Salir (Ctrl+S)'
          ImageIndex = 5
          OnClick = tbSalirClick
        end
      end
    end
    object gbTipoContacto: TGroupBox
      Left = 0
      Top = 29
      Width = 377
      Height = 38
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 15
        Width = 70
        Height = 13
        Caption = 'Tipo Contacto:'
      end
      object cmbTipoContacto: TExComboBox
        Left = 89
        Top = 10
        Width = 273
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 0
        Items.Strings = (
          'A=Todos'
          'T=Telef'#243'nico'
          'F=Fax'
          'M=Mail'
          'C=Correo'
          'P=Personal')
        ItemIndex = -1
        Options = []
        ValueWidth = 64
      end
    end
  end
  object Panel2: TPanel
    Left = 377
    Top = 0
    Width = 395
    Height = 543
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object reTexto: TRxDBRichEdit
      Left = 0
      Top = 0
      Width = 395
      Height = 543
      DataField = 'TS_TEXTO'
      DataSource = dsTextoPredeterminados
      Align = alClient
      TabOrder = 0
    end
  end
  object fpEventosABM: TFormPanel
    Left = 40
    Top = 108
    Width = 692
    Height = 381
    HelpContext = 14
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poScreenCenter
    Constraints.MinHeight = 200
    Constraints.MinWidth = 570
    DesignSize = (
      692
      381)
    object Bevel4: TBevel
      Left = 4
      Top = 348
      Width = 684
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label21: TLabel
      Left = 160
      Top = 124
      Width = 3
      Height = 13
    end
    object Label16: TLabel
      Left = 8
      Top = 33
      Width = 40
      Height = 13
      Caption = 'Nombre:'
    end
    object Bevel5: TBevel
      Left = 4
      Top = 56
      Width = 684
      Height = 8
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 8
      Top = 9
      Width = 70
      Height = 13
      Caption = 'Tipo Contacto:'
    end
    object btnEvAceptar: TButton
      Left = 531
      Top = 352
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnEvAceptarClick
    end
    object btnEvCancelar: TButton
      Left = 611
      Top = 352
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnEvCancelarClick
    end
    object pnlEventSql: TPanel
      Left = 0
      Top = 60
      Width = 690
      Height = 284
      BevelOuter = bvNone
      TabOrder = 0
      object edFormatoMensaje: TRxRichEdit
        Left = 0
        Top = 31
        Width = 690
        Height = 253
        Align = alClient
        TabOrder = 0
      end
      inline fraFormatoMensaje: TfraToolbarRTF
        Left = 0
        Top = 0
        Width = 690
        Height = 31
        Align = alTop
        TabOrder = 1
        inherited tBarRTF: TToolBar
          Width = 690
          Visible = False
        end
      end
    end
    object cmbAbmTipoContacto: TExComboBox
      Left = 89
      Top = 5
      Width = 249
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 3
      Items.Strings = (
        'T=Telef'#243'nico'
        'F=Fax'
        'M=Mail'
        'C=Correo'
        'P=Personal')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object edNombreTexto: TEdit
      Left = 89
      Top = 30
      Width = 249
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 250
      TabOrder = 4
    end
    object tbEvToolBar: TToolBar
      Left = 576
      Top = 28
      Width = 110
      Height = 26
      Align = alNone
      BorderWidth = 1
      Caption = 'tbarEventosABM'
      EdgeBorders = []
      Flat = True
      HotImages = DmEmision.ilColor
      Images = DmEmision.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      object tbEvAgrCampo: TToolButton
        Left = 0
        Top = 0
        Hint = 'Agregar Campo'
        Caption = 'tbEvAgrCampo'
        DropdownMenu = pmnuCampos
        ImageIndex = 24
        PopupMenu = pmnuCampos
        Style = tbsDropDown
      end
      object tbEvAgrParametro: TToolButton
        Left = 36
        Top = 0
        Caption = 'Agregar Par'#225'metros'
        DropdownMenu = pmnuParametros
        ImageIndex = 24
        PopupMenu = pmnuParametros
        Style = tbsDropDown
      end
      object ToolButton1: TToolButton
        Left = 72
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbEvAbmImprimir: TToolButton
        Left = 80
        Top = 0
        Hint = 'Imprimir'
        Enabled = False
        ImageIndex = 4
        Visible = False
      end
    end
  end
  object sdqTextosPredeterminados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT ITS.TS_ID,'
      '       DECODE(ITS.TS_IDTIPOCONTACTO,'
      '              '#39'T'#39', '#39'Telef'#243'nico'#39','
      '              '#39'M'#39', '#39'Mail'#39','
      '              '#39'C'#39', '#39'Correo'#39','
      '              '#39'F'#39', '#39'Fax'#39') TipoContacto,'
      
        '       ITS.TS_TEXTO, ITS.TS_USUALTA, ITS.TS_FECHAALTA, ITS.TS_US' +
        'UBAJA,'
      '       ITS.TS_FECHABAJA, ITS.TS_DESCRIPCION'
      '  FROM EMI.ITS_TEXTOREFERENCIA ITS'
      ' WHERE ((TS_IDTIPOCONTACTO ='
      '                 DECODE(:tipocontacto,'
      '                        '#39'1'#39', '#39'T'#39','
      '                        '#39'2'#39', '#39'F'#39','
      '                        '#39'3'#39', '#39'C'#39','
      '                        '#39'4'#39', '#39'M'#39'))'
      '    OR (TS_IDTIPOCONTACTO = 0))'
      '')
    Left = 440
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tipocontacto'
        ParamType = ptInput
      end>
  end
  object dsTextoPredeterminados: TDataSource
    DataSet = sdqTextosPredeterminados
    Left = 472
    Top = 24
  end
  object pmnuCampos: TPopupMenu
    MenuAnimation = [maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop]
    Left = 508
    Top = 230
    object mnuRazonSocial: TMenuItem
      Caption = 'Raz'#243'n Social'
      OnClick = mnuCamposClick
    end
    object mnuCuit: TMenuItem
      Caption = 'CUIT'
      OnClick = mnuCamposClick
    end
    object mnuContrato: TMenuItem
      Caption = 'Contrato'
      OnClick = mnuCamposClick
    end
    object mnuSector: TMenuItem
      Caption = 'Sector'
      OnClick = mnuCamposClick
    end
    object mnuSuss: TMenuItem
      Caption = 'SUSS'
      OnClick = mnuCamposClick
    end
    object mnuMasaTotal: TMenuItem
      Caption = 'Masa Total'
      OnClick = mnuCamposClick
    end
    object mnuCantidadEmpledos: TMenuItem
      Caption = 'Cantidad Empleados'
      OnClick = mnuCamposClick
    end
    object mnuVigenciaDesde: TMenuItem
      Caption = 'Vigencia Desde'
      OnClick = mnuCamposClick
    end
    object MnuVigenciaHasta: TMenuItem
      Caption = 'Vigencia Hasta'
      OnClick = mnuCamposClick
    end
    object mnuUltimaNomina: TMenuItem
      Caption = 'Ultima N'#243'mina'
      OnClick = mnuCamposClick
    end
    object mnuFechaInicioActividades: TMenuItem
      Caption = 'Fecha Inicio Actividades'
      OnClick = mnuCamposClick
    end
    object mnuFechaAfiliacion: TMenuItem
      Caption = 'Fecha Afiliaci'#243'n'
      OnClick = mnuCamposClick
    end
    object mnuCodigoActividad: TMenuItem
      Caption = 'C'#243'digo de Actividad'
      OnClick = mnuCamposClick
    end
    object Domicilio1: TMenuItem
      Caption = 'Domicilio'
      OnClick = mnuCamposClick
    end
    object mnuTelefono: TMenuItem
      Caption = 'Tel'#233'fono'
      OnClick = mnuCamposClick
    end
    object mnuContacto: TMenuItem
      Caption = 'Contacto/Responsable'
      OnClick = mnuCamposClick
    end
    object mnuObservacionesRealizadas: TMenuItem
      Caption = 'Observaciones Realizadas'
    end
    object mnuPeriodosAdeudados: TMenuItem
      Caption = 'Per'#237'odos Adeudados'
    end
    object Perodo1: TMenuItem
      Caption = 'Per'#237'odo'
    end
    object FormularioNota1: TMenuItem
      Caption = 'Formulario Nota'
    end
  end
  object pmnuParametros: TPopupMenu
    MenuAnimation = [maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop]
    Left = 540
    Top = 230
    object mnuFecha: TMenuItem
      Caption = 'Fecha (dd/mm/aaaa)'
      OnClick = mnuParametrosClick
    end
    object mnuHora: TMenuItem
      Caption = 'Hora (hh:ss)'
      OnClick = mnuParametrosClick
    end
    object Ao1: TMenuItem
      Caption = 'A'#241'o (aaaa)'
      OnClick = mnuParametrosClick
    end
    object mnudiaSemana: TMenuItem
      Caption = 'D'#237'a de la Semana'
      OnClick = mnuParametrosClick
    end
    object mnuMes: TMenuItem
      Caption = 'Mes'
      OnClick = mnuParametrosClick
    end
    object mnuProvinciaArt: TMenuItem
      Caption = 'Provincia A.R.T.'
      OnClick = mnuParametrosClick
    end
    object mnuDomicilioProvinciaART: TMenuItem
      Caption = 'Domicilio Provincia A.R.T.'
      OnClick = mnuParametrosClick
    end
  end
  object Imagenes: TImageList
    Left = 504
    Top = 24
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF008C8C9400B5B5B500F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00E7E7
      E7003939420018212100ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C6C6
      C600182121000000000031313900F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF003942
      4200181821003942420018182100ADB5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0063636B001818
      210031313900E7E7E7003131390029293100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C6C6C6003939
      4200FFFFFF00FFFFFF00A5A5A500212129004A525200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006B6B7300212929007B848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007373730021212900C6C6C600F7F7
      F700FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F7005A5A5A0031313900D6DE
      DE00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042424A001821
      2100949C9C00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
      9C002129290094949C00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E7E70042424A00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000008001800100000000
      8001800100000000800180010000000084018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
