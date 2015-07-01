object frmLiquiAutPago: TfrmLiquiAutPago
  Left = 285
  Top = 149
  Width = 693
  Height = 383
  Caption = 'Liquidaci'#243'n - Autorizaci'#243'n del pago'
  Color = clBtnFace
  Constraints.MinHeight = 382
  Constraints.MinWidth = 693
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    685
    353)
  PixelsPerInch = 96
  TextHeight = 13
  object tbcPaginas: TTabControl
    Left = 4
    Top = 1
    Width = 678
    Height = 351
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Tabs.Strings = (
      'Autorizaci'#243'n Individual'
      'Autorizaci'#243'n Masiva')
    TabIndex = 0
    OnChange = tbcPaginasChange
    DesignSize = (
      678
      351)
    object grpVolantes: TGroupBox
      Left = 5
      Top = 24
      Width = 667
      Height = 115
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Volantes'
      TabOrder = 0
      DesignSize = (
        667
        115)
      inline fraVolantes: TfraVolantes
        Left = 2
        Top = 14
        Width = 661
        Height = 96
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited Label7: TLabel
          Left = 275
        end
        inherited Label10: TLabel
          Left = 429
        end
        inherited Label11: TLabel
          Left = 544
        end
        inherited Label13: TLabel
          Left = 488
        end
        inherited Label14: TLabel
          Left = 561
        end
        inherited Label15: TLabel
          Left = 633
        end
        inherited edEstado: TEdit
          Width = 407
        end
        inherited edPrestRSocial: TEdit
          Width = 218
        end
        inherited edObservaciones: TMemo
          Width = 595
        end
        inherited edTotFact: TCurrencyEdit
          Left = 354
        end
        inherited edVO_MONTOPERCEPCION: TCurrencyEdit
          Left = 483
        end
        inherited edVO_MONTODEBITO: TCurrencyEdit
          Left = 604
        end
        inherited edVO_OBSERVACIONDEBITO: TMemo
          Width = 595
        end
        inherited chContratoART: TCheckBox
          Left = 473
        end
        inherited chContratoMutual: TCheckBox
          Left = 546
        end
        inherited chMixto: TCheckBox
          Left = 618
        end
      end
    end
    object dbgListado: TRxDBGrid
      Tag = 132
      Left = 4
      Top = 171
      Width = 669
      Height = 174
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsConsulta
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = tbDetallesClick
      IniStorage = FormPlacement
      MultiSelect = True
      OnGetCellParams = dbgListadoGetCellParams
      Columns = <
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'AM_VOLANTE'
          Title.Caption = 'Volante'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AM_TIPO'
          Title.Caption = 'Tipo volante'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AM_DESTINO'
          Title.Caption = 'Destino'
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AM_PRESTADORES'
          Title.Caption = 'Prestador'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AM_FACTURA'
          Title.Caption = 'Factura'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AM_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AM_FECHAFACTURA'
          Title.Caption = 'Fecha de Factura'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AM_IMPORTE'
          Title.Caption = 'Importe'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AM_FECHAAPROBACION'
          Title.Caption = 'Fecha de Aprobaci'#243'n'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AM_USUARIOAPROBACION'
          Title.Caption = 'Usuario de Aprobaci'#243'n'
          Width = 111
          Visible = True
        end>
    end
    object cbHerramientas: TCoolBar
      Left = 4
      Top = 140
      Width = 201
      Height = 29
      Align = alNone
      Bands = <
        item
          Control = tbHerramientas
          ImageIndex = -1
          Width = 197
        end>
      object tbHerramientas: TToolBar
        Left = 9
        Top = 0
        Width = 184
        Height = 25
        Align = alNone
        Caption = 'tbHerramientas'
        EdgeBorders = []
        Flat = True
        HotImages = frmPrincipal.imgGenColor
        Images = frmPrincipal.imgGenBW
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbAutorizar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Autorizar'
          Caption = 'tbAutorizar'
          ImageIndex = 13
          OnClick = tbAutorizarClick
        end
        object ToolButton6: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object tbFiltro: TToolButton
          Left = 31
          Top = 0
          Hint = 'Filtros'
          Caption = 'tbFiltro'
          DropdownMenu = pmnuFiltros
          ImageIndex = 16
          Style = tbsDropDown
          OnClick = tbFiltroClick
        end
        object ToolButton1: TToolButton
          Left = 69
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 10
          Style = tbsSeparator
        end
        object tbRefrescar: TToolButton
          Left = 77
          Top = 0
          Hint = 'Refrescar'
          Caption = 'tbRefrescar'
          ImageIndex = 4
          OnClick = tbRefrescarClick
        end
        object tbLimpiar: TToolButton
          Left = 100
          Top = 0
          Hint = 'Limpiar'
          Caption = 'tbLimpiar'
          ImageIndex = 3
          OnClick = tbLimpiarClick
        end
        object ToolButton3: TToolButton
          Left = 123
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object tbDetalles: TToolButton
          Left = 131
          Top = 0
          Hint = 'Detalle del Volante'
          ImageIndex = 15
          OnClick = tbDetallesClick
        end
        object ToolButton2: TToolButton
          Left = 154
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object tbSalir: TToolButton
          Left = 162
          Top = 0
          Hint = 'Salir'
          Caption = 'tbSalir'
          ImageIndex = 8
          OnClick = tbSalirClick
        end
      end
    end
    object pnlTotalFacturado: TPanel
      Left = 208
      Top = 140
      Width = 465
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT * FROM MAM_AUTOPAGOMIXTO')
    Left = 236
    object sdqConsultaAM_VOLANTE: TFloatField
      FieldName = 'AM_VOLANTE'
    end
    object sdqConsultaAM_DESTINO: TStringField
      FieldName = 'AM_DESTINO'
      Size = 4000
    end
    object sdqConsultaAM_IDPRESTADOR: TFloatField
      FieldName = 'AM_IDPRESTADOR'
    end
    object sdqConsultaAM_PRESTADORES: TStringField
      FieldName = 'AM_PRESTADORES'
      Size = 150
    end
    object sdqConsultaAM_FACTURA: TStringField
      FieldName = 'AM_FACTURA'
      Size = 15
    end
    object sdqConsultaAM_FECHAFACTURA: TDateTimeField
      FieldName = 'AM_FECHAFACTURA'
    end
    object sdqConsultaAM_IMPORTE: TFloatField
      FieldName = 'AM_IMPORTE'
    end
    object sdqConsultaAM_DESCRIPCION: TStringField
      DisplayWidth = 20
      FieldName = 'AM_DESCRIPCION'
    end
    object sdqConsultaAM_FECHAAPROBACION: TDateTimeField
      FieldName = 'AM_FECHAAPROBACION'
    end
    object sdqConsultaAM_USUARIOAPROBACION: TStringField
      FieldName = 'AM_USUARIOAPROBACION'
    end
    object sdqConsultaAM_DESTINATARIO: TStringField
      FieldName = 'AM_DESTINATARIO'
      Size = 1
    end
    object sdqConsultaAM_ASISTENCIAL: TFloatField
      FieldName = 'AM_ASISTENCIAL'
    end
    object sdqConsultaAM_PREST_FECHABAJA: TDateTimeField
      FieldName = 'AM_PREST_FECHABAJA'
    end
    object sdqConsultaAM_ESTADO: TStringField
      FieldName = 'AM_ESTADO'
      Size = 3
    end
    object sdqConsultaAM_TIPO: TStringField
      FieldName = 'AM_TIPO'
      Size = 13
    end
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 264
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 292
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'LIMITAR'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 320
  end
  object pmnuFiltros: TPopupMenu
    Images = frmPrincipal.ilImagenes
    Left = 348
    object mnuFiltroTodo: TMenuItem
      Caption = '(Todo)'
      OnClick = mnuFiltroClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuFiltroProvincia: TMenuItem
      Tag = 1
      Caption = 'Provincia A.R.T.'
      ImageIndex = 8
      OnClick = mnuFiltroClick
    end
    object mnuFiltroMutual: TMenuItem
      Tag = 2
      Caption = 'Mutual'
      ImageIndex = 9
      OnClick = mnuFiltroClick
    end
  end
end
