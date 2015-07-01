object frmRecalculoDevengado: TfrmRecalculoDevengado
  Left = 377
  Top = 118
  ActiveControl = fraEmpresaDevengado
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emisi'#243'n Por Contrato'
  ClientHeight = 520
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    566
    520)
  PixelsPerInch = 96
  TextHeight = 13
  object btnRecalcular: TBitBtn
    Left = 375
    Top = 468
    Width = 88
    Height = 26
    Anchors = [akRight, akBottom]
    Caption = '&Recalcular'
    TabOrder = 3
    OnClick = btnRecalcularClick
    NumGlyphs = 2
  end
  object btnSalir: TBitBtn
    Left = 468
    Top = 468
    Width = 88
    Height = 26
    Anchors = [akRight, akBottom]
    Caption = '&Salir'
    TabOrder = 4
    OnClick = btnSalirClick
    NumGlyphs = 2
  end
  object sbDevengadoMensual: TStatusBar
    Left = 0
    Top = 501
    Width = 566
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = ' Nivel Requerido: '
  end
  object btnSimularAutorizar: TBitBtn
    Left = 282
    Top = 468
    Width = 88
    Height = 26
    Anchors = [akRight, akBottom]
    Caption = '&Simular'
    TabOrder = 2
    Visible = False
    OnClick = btnSimularAutorizarClick
    NumGlyphs = 2
  end
  object gbEmisionContrato: TGroupBox
    Left = 2
    Top = 0
    Width = 557
    Height = 67
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    DesignSize = (
      557
      67)
    object lbCuit: TLabel
      Left = 7
      Top = 19
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object lbPerDesde: TLabel
      Left = 6
      Top = 42
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object lbPerHasta: TLabel
      Left = 143
      Top = 43
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    inline fraEmpresaDevengado: TfraEmpresa
      Left = 46
      Top = 14
      Width = 500
      Height = 21
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
      OnExit = fraEmpresaDevengadoExit
      DesignSize = (
        500
        21)
      inherited lbContrato: TLabel
        Left = 398
      end
      inherited edContrato: TIntEdit
        Left = 443
      end
      inherited cmbRSocial: TArtComboBox
        Width = 261
      end
    end
    object ppDesde: TPeriodoPicker
      Left = 46
      Top = 40
      Width = 49
      Height = 21
      OnExit = ppDesdeExit
      TabOrder = 1
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205309'
      Periodo.MinPeriodo = '195310'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object ppHasta: TPeriodoPicker
      Left = 176
      Top = 40
      Width = 49
      Height = 21
      OnExit = ppHastaExit
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205309'
      Periodo.MinPeriodo = '195310'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
  end
  object gbDetallePeriodosRecalculo: TGroupBox
    Left = 2
    Top = 72
    Width = 557
    Height = 392
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '  Detalle Per'#237'odos Afectados '
    TabOrder = 1
    DesignSize = (
      557
      392)
    object dbgPeriodos: TArtDBGrid
      Left = 8
      Top = 16
      Width = 541
      Height = 146
      Anchors = [akLeft, akTop, akRight, akBottom]
      Ctl3D = True
      DataSource = dsPeriodosAfectados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 32
      Columns = <
        item
          Expanded = False
          FieldName = 'PERIODO'
          Title.Caption = 'Per'#237'odo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Title.Caption = 'Estado'
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEVENGADO_CUOTA'
          Title.Caption = 'Dev. Cuota'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PREVISTO'
          Title.Caption = 'Dev. Cuota Rec'#225'lculo'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMENTARIO_DEVENGADO'
          Title.Caption = 'Observ.'
          Width = 300
          Visible = True
        end>
    end
    object gbDetalleNominaTrabajadores: TGroupBox
      Left = 8
      Top = 166
      Width = 541
      Height = 71
      Anchors = [akLeft, akRight, akBottom]
      Caption = ' Presentaci'#243'n '
      Enabled = False
      TabOrder = 1
      DesignSize = (
        541
        71)
      object Label8: TLabel
        Left = 7
        Top = 20
        Width = 41
        Height = 13
        Caption = 'Per'#237'odo:'
      end
      object Label2: TLabel
        Left = 170
        Top = 19
        Width = 56
        Height = 13
        Caption = 'Cant. Trab.:'
      end
      object Label3: TLabel
        Left = 345
        Top = 19
        Width = 29
        Height = 13
        Caption = 'Masa:'
      end
      object Label1: TLabel
        Left = 7
        Top = 43
        Width = 34
        Height = 13
        Caption = 'Origen:'
      end
      object Label5: TLabel
        Left = 318
        Top = 44
        Width = 74
        Height = 13
        Caption = 'F.Presentaci'#243'n:'
      end
      object edtPeriodo: TEdit
        Left = 54
        Top = 18
        Width = 66
        Height = 21
        TabStop = False
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtOrigen: TEdit
        Left = 54
        Top = 41
        Width = 243
        Height = 21
        TabStop = False
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtFechaPresentacion: TEdit
        Left = 397
        Top = 40
        Width = 66
        Height = 21
        TabStop = False
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object ToolBarSeleccionContrato: TToolBar
        Left = 466
        Top = 37
        Width = 33
        Height = 27
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        ButtonWidth = 25
        Caption = 'Botones Formulas de Estados'
        EdgeBorders = []
        Flat = True
        HotImages = DmEmision.ilByN
        Images = DmEmision.ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Visible = False
        object tbSeleccionContratos: TToolButton
          Left = 0
          Top = 0
          Hint = 'Nueva F'#243'rmula de Estado'
          Caption = 'Nueva F'#243'rmula de Estado'
          ImageIndex = 34
          OnClick = tbSeleccionContratosClick
        end
      end
      object edtCantidadTrabajadores: TIntEdit
        Left = 234
        Top = 17
        Width = 63
        Height = 21
        TabStop = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        MaxLength = 0
      end
      object edtMasa: TCurrencyEdit
        Left = 397
        Top = 15
        Width = 124
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        DisplayFormat = '$,0.00;-$ ,0.00'
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object gbMotivoRecalculo: TGroupBox
      Left = 8
      Top = 293
      Width = 541
      Height = 92
      Anchors = [akLeft, akRight, akBottom]
      Caption = ' Motivos '
      TabOrder = 3
      object Label4: TLabel
        Left = 9
        Top = 22
        Width = 37
        Height = 13
        Caption = 'Observ:'
      end
      object mObservaciones: TMemo
        Left = 62
        Top = 16
        Width = 469
        Height = 65
        TabOrder = 0
      end
    end
    object gbTarifaAplicar: TGroupBox
      Left = 8
      Top = 242
      Width = 541
      Height = 46
      Anchors = [akLeft, akRight, akBottom]
      Caption = ' Tarifa '
      Enabled = False
      TabOrder = 2
      object Label6: TLabel
        Left = 11
        Top = 22
        Width = 19
        Height = 13
        Caption = 'Fijo:'
      end
      object Label7: TLabel
        Left = 111
        Top = 22
        Width = 41
        Height = 13
        Caption = 'Variable:'
      end
      object lblVigenciaTarifaOriginal: TLabel
        Left = 385
        Top = 21
        Width = 51
        Height = 13
        Caption = 'Vig. Tarifa:'
      end
      object lblFechaEndosoOrigenal: TLabel
        Left = 240
        Top = 21
        Width = 42
        Height = 13
        Caption = 'F. Tarifa:'
      end
      object edtFechaTarifa: TDateComboBox
        Left = 286
        Top = 17
        Width = 90
        Height = 21
        ButtonWidth = 19
        TabOrder = 2
      end
      object edtVigenciaTarifa: TDateComboBox
        Left = 440
        Top = 17
        Width = 92
        Height = 21
        ButtonWidth = 19
        TabOrder = 3
      end
      object edtSumaFija: TCurrencyEdit
        Left = 35
        Top = 18
        Width = 66
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        DisplayFormat = ' ,0.00;- ,0.00'
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtPorcentajeMasa: TCurrencyEdit
        Left = 158
        Top = 18
        Width = 70
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        DisplayFormat = ' ,0.0000;- ,0.0000'
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 65429
    Top = 45
  end
  object sdqPeriodosAfectados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqPeriodosAfectadosAfterScroll
    SQL.Strings = (
      'SELECT irp.rp_contrato contrato,'
      '       irp.rp_periodo periodo,'
      
        #9'   decode(irp.rp_estado, '#39'I'#39', '#39'Invalido'#39', '#39'V'#39', '#39'V'#225'lido'#39', '#39'N'#39', '#39 +
        'No Tomar'#39', '#39'P'#39', '#39'Pendiente Aprob.'#39') estado, '
      #9'   ide.de_devengadocuota devengado_cuota,'
      
        #9'   emi.emision.get_devengadoprevisto(rp_contrato,rp_periodo) pr' +
        'evisto,'
      '   '#9'   ide.de_comentariodevengado comentario_devengado'
      '  FROM emi.irp_resumenperiodo irp,'
      '       emi.ide_devengado ide,'
      '       emi.idj_ddjj idj_devengado'
      ' WHERE irp.rp_iddevengado = ide.de_id (+)'
      '   AND ide.de_idddjj = idj_devengado.dj_id  (+)'
      '   AND irp.rp_contrato = :contrato '
      
        '   AND irp.rp_periodo >= :periodo_desde AND irp.rp_periodo <= :p' +
        'eriodo_hasta'
      '')
    Left = 210
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'periodo_desde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'periodo_hasta'
        ParamType = ptInput
      end>
  end
  object dsPeriodosAfectados: TDataSource
    DataSet = sdqPeriodosAfectados
    Left = 216
    Top = 168
  end
end
