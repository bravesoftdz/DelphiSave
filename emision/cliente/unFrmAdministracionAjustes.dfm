inherited frmAdministracionAjustes: TfrmAdministracionAjustes
  Left = 267
  Top = 118
  Width = 643
  Caption = 'Administracion Ajustes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 635
    Height = 21
  end
  inherited CoolBar: TCoolBar
    Top = 21
    Width = 635
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 631
      end>
    inherited ToolBar: TToolBar
      Width = 618
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
    end
  end
  inherited Grid: TArtDBGrid
    Top = 50
    Width = 635
    Height = 416
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'AJ_ID'
        Title.Caption = 'Nro.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AJ_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AJ_MODO_DECODE'
        Title.Caption = 'Modo'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 76
    Width = 493
    Height = 365
    inherited BevelAbm: TBevel
      Top = 329
      Width = 485
    end
    inherited pnlTop: TPanel [1]
      Width = 493
      Height = 322
      object lblNroAjuste: TLabel [0]
        Left = 16
        Top = 13
        Width = 59
        Height = 13
        Caption = 'Nro. Ajuste:'
      end
      object lblDescripcion: TLabel [1]
        Left = 16
        Top = 37
        Width = 58
        Height = 13
        Caption = 'Descripci'#243'n:'
      end
      object LblModo: TLabel [2]
        Left = 16
        Top = 61
        Width = 33
        Height = 13
        Caption = 'Modo: '
      end
      inherited pnlBottom: TPanel
        Top = 88
        Width = 493
        Height = 234
        Anchors = [akLeft, akTop, akRight, akBottom]
        inherited cbDetalle: TCoolBar
          Width = 493
          Bands = <
            item
              Control = tbDetalle
              ImageIndex = -1
              MinHeight = 480
              Width = 489
            end>
          inherited tbDetalle: TToolBar
            Width = 476
          end
        end
        inherited GridDetalle: TArtDBGrid
          Width = 493
          Height = 204
          Columns = <
            item
              Expanded = False
              FieldName = 'MA_ID'
              Title.Caption = 'Nro.'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MA_OPERACION_DECODE'
              Title.Caption = 'Operaci'#243'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MA_SIGNO_DECODE'
              Title.Caption = 'Signo'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGOMOVIMIENTO'
              Title.Caption = 'Codigo Movimiento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCIONMOVIMIENTO'
              Title.Caption = 'Descripcion Movimiento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGOREVERSION'
              Title.Caption = 'Codigo Reversion'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCIONREVERSION'
              Title.Caption = 'Descripcion Reversion'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGOMOVIMIENTOEMPAREJA'
              Title.Caption = 'Codigo Movimiento Empareja'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCIONMOVIMIENTOEMPAREJA'
              Title.Caption = 'Codigo Movimiento Empareja'
              Visible = True
            end>
        end
      end
      object edNroAjuste: TPatternEdit
        Left = 80
        Top = 9
        Width = 60
        Height = 21
        CharCase = ecUpperCase
        Color = clInactiveCaptionText
        MaxLength = 10
        ReadOnly = True
        TabOrder = 1
        Alignment = taRightJustify
        Pattern = '0123456789'
      end
      object edDescripcionAjuste: TEdit
        Left = 80
        Top = 34
        Width = 401
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 250
        TabOrder = 2
      end
      object rbManual: TRadioButton
        Left = 80
        Top = 59
        Width = 113
        Height = 17
        Caption = 'Manual'
        TabOrder = 3
      end
      object rbAutomatico: TRadioButton
        Left = 150
        Top = 59
        Width = 113
        Height = 17
        Caption = 'Autom'#225'tico'
        TabOrder = 4
      end
    end
    inherited btnCancelar: TButton
      Left = 413
      Top = 335
    end
    inherited btnAceptar: TButton [3]
      Left = 338
      Top = 335
    end
  end
  inherited fpABMDetalle: TFormPanel
    Left = 172
    Top = 224
    Constraints.MaxHeight = 185
    Constraints.MaxWidth = 381
    Constraints.MinHeight = 185
    Constraints.MinWidth = 381
    object lblMovimiento: TLabel [1]
      Left = 14
      Top = 20
      Width = 58
      Height = 13
      Caption = 'Movimiento:'
    end
    object LblReversion: TLabel [2]
      Left = 14
      Top = 52
      Width = 52
      Height = 13
      Caption = 'Reversion:'
    end
    object LblEmpareja: TLabel [3]
      Left = 14
      Top = 84
      Width = 49
      Height = 13
      Caption = 'Empareja:'
    end
    object lblSigno: TLabel [4]
      Left = 16
      Top = 114
      Width = 30
      Height = 13
      Caption = 'Signo:'
    end
    inline fraMovimiento: TfraCodigoDescripcion
      Left = 78
      Top = 16
      Width = 290
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 225
      end
    end
    inline fraReversion: TfraCodigoDescripcion
      Left = 78
      Top = 48
      Width = 290
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 225
      end
    end
    inline fraEmpareja: TfraCodigoDescripcion
      Left = 78
      Top = 80
      Width = 290
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 225
      end
    end
    object cmbSigno: TComboBox
      Left = 78
      Top = 110
      Width = 81
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        'Positivo'
        'Negativo'
        'Ambos')
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT IAJ.*, '
      
        '               DECODE(AJ_MODO, '#39'A'#39', '#39'Autom'#225'tico'#39', '#39'M'#39', '#39'Manual'#39')' +
        ' AS AJ_MODO_DECODE'
      'FROM EMI.IAJ_AJUSTE IAJ')
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
  end
  inherited sdqConsultaDetalle: TSDQuery
    SQL.Strings = (
      'SELECT IMA.*, (SELECT ZCM.CM_CODIGO'
      '                 FROM COB.ZCM_CODIGOMOVIMIENTO ZCM'
      
        '                WHERE CM_ID = IMA.MA_IDCODIGOMOVIMIENTO) AS CODI' +
        'GOMOVIMIENTO,'
      '       (SELECT ZCM.CM_DESCRIPCION'
      '          FROM COB.ZCM_CODIGOMOVIMIENTO ZCM'
      
        '         WHERE CM_ID = IMA.MA_IDCODIGOMOVIMIENTO) AS DESCRIPCION' +
        'MOVIMIENTO,'
      '       (SELECT ZCM.CM_CODIGO'
      '          FROM COB.ZCM_CODIGOMOVIMIENTO ZCM'
      
        '         WHERE CM_ID = IMA.MA_IDCODIGOREVERSION) AS CODIGOREVERS' +
        'ION,'
      '       (SELECT ZCM.CM_DESCRIPCION'
      '          FROM COB.ZCM_CODIGOMOVIMIENTO ZCM'
      
        '         WHERE CM_ID = IMA.MA_IDCODIGOREVERSION) AS DESCRIPCIONR' +
        'EVERSION,'
      '       (SELECT ZCM.CM_CODIGO'
      '          FROM COB.ZCM_CODIGOMOVIMIENTO ZCM'
      
        '         WHERE CM_ID = IMA.MA_IDCODIGOMOVIMIENTOEMPAREJA) AS COD' +
        'IGOMOVIMIENTOEMPAREJA,'
      '       (SELECT ZCM.CM_DESCRIPCION'
      '          FROM COB.ZCM_CODIGOMOVIMIENTO ZCM'
      
        '         WHERE CM_ID = IMA.MA_IDCODIGOMOVIMIENTOEMPAREJA) AS DES' +
        'CRIPCIONMOVIMIENTOEMPAREJA,'
      
        '   DECODE(MA_OPERACION, '#39'A'#39', '#39'Anular'#39', '#39'G'#39', '#39'Generar'#39') AS MA_OPE' +
        'RACION_DECODE,'
      
        '   DECODE(MA_SIGNO, '#39'P'#39', '#39'Positivo'#39', '#39'N'#39', '#39'Negativo'#39','#39'A'#39', '#39'Ambos' +
        #39') AS MA_SIGNO_DECODE'
      'FROM EMI.IMA_MOVIMIENTOAJUSTE IMA'
      'WHERE MA_IDAJUSTE = :ID')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
