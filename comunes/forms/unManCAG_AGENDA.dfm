inherited frmManCAG_AGENDA: TfrmManCAG_AGENDA
  Left = 299
  Top = 183
  Width = 626
  Height = 500
  BorderIcons = []
  Caption = 'Mantenimiento | Agenda'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 626
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  OnResize = AjustarGrillas
  PixelsPerInch = 96
  TextHeight = 13
  object splBottom: TJvgSplitter [0]
    Left = 157
    Top = 0
    Height = 473
    MinSize = 0
    Displace = False
  end
  object pnlLeft: TPanel [1]
    Left = 0
    Top = 0
    Width = 157
    Height = 473
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    OnResize = AjustarGrillas
    object dbgSectores: TArtDBGrid
      Left = 0
      Top = 0
      Width = 157
      Height = 473
      Align = alClient
      Constraints.MinWidth = 150
      DataSource = dsSector
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'SC_DESCRIPCION'
          Title.Caption = 'Sector'
          Width = 134
          Visible = True
        end>
    end
  end
  object pnlRight: TPanel [2]
    Left = 163
    Top = 0
    Width = 455
    Height = 473
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 455
      Height = 73
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 93
        Top = 16
        Width = 282
        Height = 13
        Caption = #191'Cada cu'#225'ntos minutos se revisan los eventos pendientes?'
      end
      object Label2: TLabel
        Left = 93
        Top = 44
        Width = 256
        Height = 13
        Caption = 'Cantidad m'#225'xima de alertas que se muestran a la vez'
      end
      object edMinutos: TIntEdit
        Left = 385
        Top = 12
        Width = 60
        Height = 21
        TabOrder = 0
      end
      object edCantidadMaxima: TIntEdit
        Left = 385
        Top = 40
        Width = 60
        Height = 21
        TabOrder = 1
      end
      object btnActivar: TButton
        Left = 5
        Top = 10
        Width = 75
        Height = 25
        Caption = 'Activar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnActivarClick
      end
      object btnDesactivar: TButton
        Left = 5
        Top = 37
        Width = 75
        Height = 25
        Caption = 'Desactivar'
        TabOrder = 3
        OnClick = btnDesactivarClick
      end
    end
    object Paginas: TJvPageControl
      Left = 0
      Top = 73
      Width = 455
      Height = 367
      ActivePage = AG_IDEVENTO
      Align = alClient
      TabOrder = 1
      OnChange = PaginasChange
      object AG_IDEVENTO: TTabSheet
        Caption = 'Eventos'
        OnResize = AjustarGrillas
        object JvgSplitter1: TJvgSplitter
          Left = 161
          Top = 0
          Height = 339
          MinSize = 0
          Displace = False
        end
        object dbgEventosAsociados: TArtDBGrid
          Tag = 1
          Left = 194
          Top = 0
          Width = 253
          Height = 339
          Align = alClient
          Constraints.MinWidth = 150
          DataSource = dsEventosAsociados0
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = AsociacionesDeItems
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'CE_DESCRIPCION'
              Title.Caption = 'Disponibles'
              Width = 140
              Visible = True
            end>
        end
        object dbgEventosDisponibles: TArtDBGrid
          Left = 0
          Top = 0
          Width = 161
          Height = 339
          Align = alLeft
          Constraints.MinWidth = 150
          DataSource = dsEventosDisponibles0
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = AsociacionesDeItems
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'CE_DESCRIPCION'
              Title.Caption = 'Asociados'
              Width = 140
              Visible = True
            end>
        end
        object pnlDivisorEventos: TPanel
          Left = 167
          Top = 0
          Width = 27
          Height = 339
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
          object tbEventos: TToolBar
            Left = 0
            Top = 45
            Width = 23
            Height = 294
            Align = alLeft
            AutoSize = True
            Color = clBtnFace
            EdgeBorders = []
            Flat = True
            HotImages = ilColor
            Images = ilByN
            ParentColor = False
            TabOrder = 0
            object tbAgregarEventos: TToolButton
              Tag = 1
              Left = 0
              Top = 0
              Hint = 'Asociar'
              Caption = 'tbAgregarEventos'
              ImageIndex = 25
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = AsociacionesDeItems
            end
            object tbQuitarEventos: TToolButton
              Left = 0
              Top = 22
              Hint = 'Remover'
              Caption = 'tbQuitarEventos'
              ImageIndex = 26
              ParentShowHint = False
              ShowHint = True
              OnClick = AsociacionesDeItems
            end
          end
          object pnlRelleno: TPanel
            Left = 0
            Top = 0
            Width = 27
            Height = 45
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
      end
      object AG_IDINGRESOEVENTO: TTabSheet
        Caption = 'Ingresos'
        ImageIndex = 1
        OnResize = AjustarGrillas
        object JvgSplitter2: TJvgSplitter
          Left = 161
          Top = 0
          Height = 339
          MinSize = 0
          Displace = False
        end
        object dbgIngresosAsociados1: TArtDBGrid
          Tag = 1
          Left = 194
          Top = 0
          Width = 253
          Height = 339
          Align = alClient
          Constraints.MinWidth = 150
          DataSource = dsIngresosAsociados1
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = AsociacionesDeItems
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'IE_DESCRIPCION'
              Title.Caption = 'Disponibles'
              Width = 140
              Visible = True
            end>
        end
        object dbgIngresosDisponibles1: TArtDBGrid
          Left = 0
          Top = 0
          Width = 161
          Height = 339
          Align = alLeft
          Constraints.MinWidth = 150
          DataSource = dsIngresosDisponibles1
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = AsociacionesDeItems
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'IE_DESCRIPCION'
              Title.Caption = 'Asociados'
              Width = 140
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 167
          Top = 0
          Width = 27
          Height = 339
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
          object ToolBar1: TToolBar
            Left = 0
            Top = 45
            Width = 23
            Height = 294
            Align = alLeft
            AutoSize = True
            EdgeBorders = []
            Flat = True
            HotImages = ilColor
            Images = ilByN
            TabOrder = 0
            Transparent = True
            object ToolButton1: TToolButton
              Tag = 1
              Left = 0
              Top = 0
              Hint = 'Asociar'
              Caption = 'tbAgregarEventos'
              ImageIndex = 25
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = AsociacionesDeItems
            end
            object ToolButton2: TToolButton
              Left = 0
              Top = 22
              Hint = 'Remover'
              Caption = 'tbQuitarEventos'
              ImageIndex = 26
              ParentShowHint = False
              ShowHint = True
              OnClick = AsociacionesDeItems
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 27
            Height = 45
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
      end
      object AG_IDMOTIVO: TTabSheet
        Caption = 'Motivos de Ingreso'
        ImageIndex = 2
        OnResize = AjustarGrillas
        object JvgSplitter3: TJvgSplitter
          Left = 161
          Top = 21
          Height = 318
          MinSize = 0
          Displace = False
        end
        object dbgMotivoIngresosAsociados2: TArtDBGrid
          Tag = 1
          Left = 194
          Top = 21
          Width = 253
          Height = 318
          Align = alClient
          Constraints.MinWidth = 150
          DataSource = dsMotivoIngresosAsociados2
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = AsociacionesDeItems
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'ME_DESCRIPCION'
              Title.Caption = 'Disponibles'
              Width = 140
              Visible = True
            end>
        end
        object dbgMotivoIngresosDisponibles2: TArtDBGrid
          Left = 0
          Top = 21
          Width = 161
          Height = 318
          Align = alLeft
          Constraints.MinWidth = 150
          DataSource = dsMotivoIngresosDisponibles2
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = AsociacionesDeItems
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'ME_DESCRIPCION'
              Title.Caption = 'Asociados'
              Width = 140
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 167
          Top = 21
          Width = 27
          Height = 318
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
          object ToolBar2: TToolBar
            Left = 0
            Top = 45
            Width = 23
            Height = 273
            Align = alLeft
            AutoSize = True
            EdgeBorders = []
            Flat = True
            HotImages = ilColor
            Images = ilByN
            TabOrder = 0
            Transparent = True
            object ToolButton3: TToolButton
              Tag = 1
              Left = 0
              Top = 0
              Hint = 'Asociar'
              Caption = 'tbAgregarEventos'
              ImageIndex = 25
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = AsociacionesDeItems
            end
            object ToolButton4: TToolButton
              Left = 0
              Top = 22
              Hint = 'Remover'
              Caption = 'tbQuitarEventos'
              ImageIndex = 26
              ParentShowHint = False
              ShowHint = True
              OnClick = AsociacionesDeItems
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 27
            Height = 45
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 447
          Height = 21
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          object FiltroIngresos: TJvDBLookupCombo
            Left = 0
            Top = 0
            Width = 447
            Height = 21
            Align = alClient
            LookupField = 'IE_ID'
            LookupDisplay = 'IE_DESCRIPCION'
            LookupSource = dsIngresosDisponibles1
            TabOrder = 0
            OnChange = FiltroIngresosChange
          end
        end
      end
      object AG_IDRESPUESTA: TTabSheet
        Caption = 'Respuestas precodificadas'
        ImageIndex = 3
        OnResize = AjustarGrillas
        object JvgSplitter4: TJvgSplitter
          Left = 161
          Top = 0
          Height = 339
          MinSize = 0
          Displace = False
        end
        object dbgRespuestasAsociados3: TArtDBGrid
          Tag = 1
          Left = 194
          Top = 0
          Width = 253
          Height = 339
          Align = alClient
          Constraints.MinWidth = 150
          DataSource = dsRespuestasAsociados3
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = AsociacionesDeItems
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'RR_DESCRIPCION'
              Title.Caption = 'Disponibles'
              Width = 140
              Visible = True
            end>
        end
        object dbgRespuestasDisponibles3: TArtDBGrid
          Left = 0
          Top = 0
          Width = 161
          Height = 339
          Align = alLeft
          Constraints.MinWidth = 150
          DataSource = dsRespuestasDisponibles3
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = AsociacionesDeItems
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'RR_DESCRIPCION'
              Title.Caption = 'Asociados'
              Width = 140
              Visible = True
            end>
        end
        object Panel5: TPanel
          Left = 167
          Top = 0
          Width = 27
          Height = 339
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
          object ToolBar3: TToolBar
            Left = 0
            Top = 45
            Width = 23
            Height = 294
            Align = alLeft
            AutoSize = True
            EdgeBorders = []
            Flat = True
            HotImages = ilColor
            Images = ilByN
            TabOrder = 0
            Transparent = True
            object ToolButton5: TToolButton
              Tag = 1
              Left = 0
              Top = 0
              Hint = 'Asociar'
              Caption = 'tbAgregarEventos'
              ImageIndex = 25
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = AsociacionesDeItems
            end
            object ToolButton6: TToolButton
              Left = 0
              Top = 22
              Hint = 'Remover'
              Caption = 'tbQuitarEventos'
              ImageIndex = 26
              ParentShowHint = False
              ShowHint = True
              OnClick = AsociacionesDeItems
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 27
            Height = 45
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
      end
    end
    object pnlBottom: TPanel
      Left = 0
      Top = 440
      Width = 455
      Height = 33
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        455
        33)
      object btnCancelar: TButton
        Left = 301
        Top = 5
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Cancelar'
        TabOrder = 0
        OnClick = btnCancelarClick
      end
      object btnAceptar: TButton
        Left = 226
        Top = 5
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Aceptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnAceptarClick
      end
      object btnAplicar: TButton
        Left = 376
        Top = 5
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Aplicar'
        TabOrder = 2
        OnClick = btnAplicarClick
      end
      object chkSaludo: TCheckBox
        Left = 1
        Top = 9
        Width = 197
        Height = 17
        Caption = 'Mostrar saludo de bienvenida'
        TabOrder = 3
        OnClick = chkSaludoClick
      end
    end
  end
  inherited FormStorage: TFormStorage
    Left = 24
    Top = 124
  end
  inherited XPMenu: TXPMenu
    Left = 52
    Top = 124
  end
  inherited ilByN: TImageList
    Left = 24
    Top = 152
  end
  inherited ilColor: TImageList
    Left = 52
    Top = 152
  end
  inherited IconosXP: TImageList
    Left = 80
    Top = 152
  end
  object sdqSector: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqSectorAfterScroll
    SQL.Strings = (
      '  SELECT *'
      '    FROM USC_SECTORES'
      '   WHERE SC_MOSTRAR = '#39'S'#39
      '     AND SC_FECHABAJA IS NULL'
      'ORDER BY SC_DESCRIPCION')
    Left = 24
    Top = 180
  end
  object dsSector: TDataSource
    DataSet = sdqSector
    Left = 52
    Top = 180
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 80
    Top = 124
  end
  object sdqEventosDisponibles0: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT CCE_CODIGOEVENTO.*, CE_ID as ID'
      '  FROM CCE_CODIGOEVENTO'
      ' WHERE CE_ID IN (SELECT AG_IDEVENTO'
      '                       FROM CAG_AGENDA'
      '                      WHERE AG_SECTOR = :Sector'
      '                        AND AG_TIPO = '#39'E'#39
      
        '                        AND AG_FECHABAJA IS NULL                ' +
        '        '
      '                        AND CE_ID = AG_IDEVENTO)'
      'ORDER BY CE_DESCRIPCION')
    Left = 24
    Top = 212
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sector'
        ParamType = ptInput
      end>
  end
  object dsEventosDisponibles0: TDataSource
    DataSet = sdqEventosDisponibles0
    Left = 52
    Top = 212
  end
  object sdqEventosAsociados0: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT CCE_CODIGOEVENTO.*, CE_ID as ID'
      '  FROM CCE_CODIGOEVENTO'
      ' WHERE CE_ID NOT IN (SELECT AG_IDEVENTO'
      '                       FROM CAG_AGENDA'
      '                      WHERE AG_SECTOR = :Sector'
      '                        AND AG_TIPO = '#39'E'#39
      
        '                        AND AG_FECHABAJA IS NULL                ' +
        '        '
      '                        AND CE_ID = AG_IDEVENTO)'
      'ORDER BY CE_DESCRIPCION')
    Left = 24
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sector'
        ParamType = ptInput
      end>
  end
  object dsEventosAsociados0: TDataSource
    DataSet = sdqEventosAsociados0
    Left = 52
    Top = 240
  end
  object sdqIngresosDisponibles1: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT CIE_INGRESOEVENTO.*, IE_ID as ID'
      '  FROM CIE_INGRESOEVENTO'
      ' WHERE IE_ID IN (SELECT AG_IDINGRESOEVENTO'
      '                   FROM CAG_AGENDA'
      '                  WHERE AG_SECTOR = :Sector'
      '                    AND AG_TIPO = '#39'I'#39
      '                    AND AG_FECHABAJA IS NULL'
      '                    AND IE_ID = AG_IDINGRESOEVENTO)'
      'ORDER BY IE_DESCRIPCION')
    Left = 24
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sector'
        ParamType = ptInput
      end>
  end
  object dsIngresosDisponibles1: TDataSource
    DataSet = sdqIngresosDisponibles1
    Left = 52
    Top = 272
  end
  object sdqIngresosAsociados1: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT CIE_INGRESOEVENTO.*, IE_ID as ID'
      '  FROM CIE_INGRESOEVENTO'
      ' WHERE IE_ID NOT IN (SELECT AG_IDINGRESOEVENTO'
      '                       FROM CAG_AGENDA'
      '                      WHERE AG_SECTOR = :Sector'
      '                        AND AG_TIPO = '#39'I'#39
      '                        AND AG_FECHABAJA IS NULL'
      '                        AND IE_ID = AG_IDINGRESOEVENTO)'
      'ORDER BY IE_DESCRIPCION')
    Left = 24
    Top = 300
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sector'
        ParamType = ptInput
      end>
  end
  object dsIngresosAsociados1: TDataSource
    DataSet = sdqIngresosAsociados1
    Left = 52
    Top = 300
  end
  object dsMotivoIngresosAsociados2: TDataSource
    DataSet = sdqMotivoIngresosAsociados2
    Left = 52
    Top = 360
  end
  object sdqMotivoIngresosAsociados2: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT CME_MOTIVOEVENTO.*, ME_ID as ID'
      '  FROM CME_MOTIVOEVENTO'
      ' WHERE ME_ID NOT IN (SELECT AG_IDMOTIVO'
      '                       FROM CAG_AGENDA'
      '                      WHERE AG_SECTOR = :Sector'
      '                        AND AG_TIPO = '#39'M'#39
      '                        AND AG_FECHABAJA IS NULL'
      '                        AND ME_ID = AG_IDMOTIVO)'
      '   AND ME_IDINGRESOEVENTO = :Ingreso'
      '   AND ME_SECTOR = :Sector'
      'ORDER BY ME_DESCRIPCION')
    Left = 24
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sector'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Ingreso'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Sector'
        ParamType = ptInput
      end>
  end
  object sdqMotivoIngresosDisponibles2: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT CME_MOTIVOEVENTO.*, ME_ID as ID'
      '  FROM CME_MOTIVOEVENTO'
      ' WHERE ME_ID IN (SELECT AG_IDMOTIVO'
      '                   FROM CAG_AGENDA'
      '                  WHERE AG_SECTOR = :Sector'
      '                    AND AG_TIPO = '#39'M'#39
      '                    AND AG_FECHABAJA IS NULL'
      '                    AND ME_ID = AG_IDMOTIVO)'
      '   AND ME_IDINGRESOEVENTO = :Ingreso'
      '   AND ME_SECTOR = :Sector '
      'ORDER BY ME_DESCRIPCION')
    Left = 24
    Top = 332
    ParamData = <
      item
        DataType = ftString
        Name = 'Sector'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Ingreso'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Sector'
        ParamType = ptInput
      end>
  end
  object dsMotivoIngresosDisponibles2: TDataSource
    DataSet = sdqMotivoIngresosDisponibles2
    Left = 52
    Top = 332
  end
  object sdqRespuestasAsociados3: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT CRR_RESPUESTA.*, RR_ID as ID'
      '  FROM CRR_RESPUESTA'
      ' WHERE RR_ID NOT IN (SELECT AG_IDRESPUESTA'
      '                       FROM CAG_AGENDA'
      '                      WHERE AG_SECTOR = :Sector'
      '                        AND AG_TIPO = '#39'R'#39
      '                        AND AG_FECHABAJA IS NULL'
      '                        AND RR_ID = AG_IDRESPUESTA)'
      '   AND RR_SECTOR = :Sector'
      'ORDER BY RR_DESCRIPCION')
    Left = 24
    Top = 420
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sector'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Sector'
        ParamType = ptInput
      end>
  end
  object sdqRespuestasDisponibles3: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT CRR_RESPUESTA.*, RR_ID as ID'
      '  FROM CRR_RESPUESTA'
      ' WHERE RR_ID IN (SELECT AG_IDRESPUESTA'
      '                   FROM CAG_AGENDA'
      '                  WHERE AG_SECTOR = :Sector'
      '                    AND AG_TIPO = '#39'R'#39
      '                    AND AG_FECHABAJA IS NULL'
      '                    AND RR_ID = AG_IDRESPUESTA)'
      '   AND RR_SECTOR = :Sector'
      'ORDER BY RR_DESCRIPCION')
    Left = 24
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sector'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Sector'
        ParamType = ptInput
      end>
  end
  object dsRespuestasDisponibles3: TDataSource
    DataSet = sdqRespuestasDisponibles3
    Left = 52
    Top = 392
  end
  object dsRespuestasAsociados3: TDataSource
    DataSet = sdqRespuestasAsociados3
    Left = 52
    Top = 420
  end
end
