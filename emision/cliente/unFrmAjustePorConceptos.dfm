object FrmAjustePorConceptos: TFrmAjustePorConceptos
  Left = 220
  Top = 101
  Width = 616
  Height = 558
  BorderIcons = [biSystemMenu]
  Caption = 'Ajustes por Conceptos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    608
    531)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 7
    Top = 496
    Width = 587
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object btnAceptarAjuste: TButton
    Left = 452
    Top = 502
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 0
    OnClick = btnAceptarAjusteClick
  end
  object btnCancelarAjuste: TButton
    Left = 530
    Top = 502
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelarAjusteClick
  end
  object gbAjuste: TGroupBox
    Left = 5
    Top = 0
    Width = 598
    Height = 158
    Caption = 'Ajuste'
    TabOrder = 2
    object Label18: TLabel
      Left = 8
      Top = 88
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object lblAjuste: TLabel
      Left = 8
      Top = 68
      Width = 32
      Height = 13
      Caption = 'Ajuste:'
    end
    object Label2: TLabel
      Left = 8
      Top = 44
      Width = 41
      Height = 13
      Caption = 'Per'#237'odo:'
    end
    object lblCUIT: TLabel
      Left = 10
      Top = 19
      Width = 18
      Height = 13
      Caption = 'Cuit'
    end
    object pnContratoPeriodo: TPanel
      Left = 96
      Top = 8
      Width = 491
      Height = 54
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        491
        54)
      inline fraContrato: TfraEmpresa
        Left = 3
        Top = 3
        Width = 483
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          483
          21)
        inherited lbContrato: TLabel
          Left = 381
        end
        inherited edContrato: TIntEdit
          Left = 426
        end
        inherited cmbRSocial: TArtComboBox
          Width = 244
          DataSource = nil
        end
      end
      object edtPeriodo: TPeriodoPicker
        Left = 4
        Top = 29
        Width = 49
        Height = 21
        OnEnter = edtPeriodoEnter
        OnExit = edtPeriodoExit
        TabOrder = 1
        Color = clWindow
        Periodo.AllowNull = False
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 6
        Periodo.Ano = 2005
        Periodo.Valor = '200506'
        Periodo.MaxPeriodo = '205506'
        Periodo.MinPeriodo = '195506'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        OnChange = edtPeriodoChange
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
    object pnAjuste: TPanel
      Left = 96
      Top = 60
      Width = 491
      Height = 87
      BevelOuter = bvNone
      Caption = 'pnAjuste'
      TabOrder = 1
      DesignSize = (
        491
        87)
      inline fraConceptoAjuste: TfraCodigoDescripcionExt
        Left = 3
        Top = 1
        Width = 485
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 420
        end
      end
      object mObservacionConcepto: TMemo
        Left = 3
        Top = 27
        Width = 483
        Height = 58
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 160
    Width = 600
    Height = 327
    Caption = ' Detalle de Movimientos '
    TabOrder = 3
    DesignSize = (
      600
      327)
    object dbgMovimientosAjuste: TArtDBGrid
      Left = 7
      Top = 19
      Width = 583
      Height = 271
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsMovimientos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = dbgMovimientosAjusteGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'Nro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C'#243'digo'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Movim.'
          Width = 145
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Importe'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fecha Recepci'#243'n'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fecha Distrib.'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fecha Aprobado'
          Width = 128
          Visible = True
        end>
    end
    object gbReferenciasColores: TGroupBox
      Left = 5
      Top = 289
      Width = 587
      Height = 35
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      object lblReferenciaPeriodoEstimado: TLabel
        Left = 31
        Top = 12
        Width = 105
        Height = 13
        Caption = 'Movimiento A Generar'
      end
      object lblReferenciaPeriodoRecalculo: TLabel
        Left = 187
        Top = 12
        Width = 110
        Height = 13
        Caption = 'Pendientes Aprobaci'#243'n'
      end
      object Label1: TLabel
        Left = 449
        Top = 12
        Width = 30
        Height = 13
        Caption = 'Saldo:'
      end
      object pnPeriodoARecalcular: TPanel
        Left = 160
        Top = 10
        Width = 16
        Height = 16
        BevelOuter = bvNone
        Color = 16758711
        TabOrder = 0
      end
      object pn: TPanel
        Left = 10
        Top = 10
        Width = 16
        Height = 16
        BevelOuter = bvNone
        Color = 14811135
        TabOrder = 1
      end
      object edtSaldo: TCurrencyEdit
        Left = 484
        Top = 9
        Width = 98
        Height = 20
        AutoSize = False
        TabOrder = 2
      end
    end
  end
  object mdMovimientos: TJvMemoryData
    FieldDefs = <
      item
        Name = 'Nro'
        Attributes = [faRequired]
        DataType = ftFloat
        Precision = 8
      end
      item
        Name = 'C'#243'digo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Movim.'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Fecha Recepci'#243'n'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha Distrib.'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'Importe'
        Attributes = [faRequired]
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'Fecha Aprobado'
        DataType = ftDateTime
      end
      item
        Name = 'IDCODIGOMOVIMIENTO'
        Attributes = [faRequired]
        DataType = ftFloat
        Precision = 8
      end>
    Left = 386
    Top = 127
    object mdMovimientosNro: TFloatField
      FieldName = 'Nro'
      Required = True
    end
    object mdMovimientosCdigo: TStringField
      FieldName = 'C'#243'digo'
      Required = True
      Size = 3
    end
    object mdMovimientosMovim: TStringField
      FieldName = 'Movim.'
      Required = True
      Size = 40
    end
    object mdMovimientosFechaRecepcin: TDateTimeField
      FieldName = 'Fecha Recepci'#243'n'
    end
    object mdMovimientosFechaDistrib: TDateTimeField
      FieldName = 'Fecha Distrib.'
      Required = True
    end
    object mdMovimientosImporte: TFloatField
      FieldName = 'Importe'
      Required = True
    end
    object mdMovimientosFechaAprobado: TDateTimeField
      FieldName = 'Fecha Aprobado'
    end
    object mdMovimientosIDCODIGOMOVIMIENTO: TFloatField
      FieldName = 'IDCODIGOMOVIMIENTO'
      Required = True
    end
  end
  object dsMovimientos: TDataSource
    DataSet = mdMovimientos
    Left = 394
    Top = 172
  end
  object sdqMovimientosActual: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT zmo.mo_id "Nro",'
      '       zcm.cm_codigo "C'#243'digo",'
      '       zcm.cm_descripcion "Movim.",'
      '       zmo.mo_fecharecepcion "Fecha Recepci'#243'n",'
      '       zmo.mo_fechadist "Fecha Distrib.",'
      '       zmo.mo_importe "Importe",'
      '       zmo.mo_fechaaprobado "Fecha Aprobado",'
      '       zmo.mo_idcodigomovimiento IdCodigoMovimiento'
      '  FROM cob.zmo_movimiento zmo, cob.zcm_codigomovimiento zcm'
      ' WHERE ((zcm.cm_id = zmo.mo_idcodigomovimiento))'
      '   AND zmo.mo_contrato = :contrato'
      '   AND zmo.mo_periodo = :periodo'
      'ORDER BY mo_id ')
    Left = 220
    Top = 121
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsMovimientosActual: TDataSource
    DataSet = sdqMovimientosActual
    Left = 172
    Top = 117
  end
end
