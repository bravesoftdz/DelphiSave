inherited frmValoresConciliados: TfrmValoresConciliados
  Left = 207
  Top = 111
  Width = 766
  Height = 438
  Caption = 'Valores Conciliados'
  Constraints.MinHeight = 438
  Constraints.MinWidth = 766
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 758
    Height = 138
    object gbFechaConciliado: TGroupBox
      Left = 3
      Top = 89
      Width = 288
      Height = 45
      Caption = ' Fecha Conciliado'
      TabOrder = 5
      object Label9: TLabel
        Left = 13
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label10: TLabel
        Left = 155
        Top = 19
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFConciliadoDesde: TDateComboBox
        Left = 50
        Top = 14
        Width = 88
        Height = 23
        MaxDateCombo = edFConciliadoHasta
        TabOrder = 0
      end
      object edFConciliadoHasta: TDateComboBox
        Left = 189
        Top = 14
        Width = 88
        Height = 23
        MinDateCombo = edFConciliadoDesde
        TabOrder = 1
      end
    end
    object gbConcepto: TGroupBox
      Left = 3
      Top = 0
      Width = 288
      Height = 45
      Caption = ' Concepto'
      TabOrder = 0
      DesignSize = (
        288
        45)
      inline fraConcepto: TfraStaticCodigoDescripcion
        Left = 8
        Top = 14
        Width = 273
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 210
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
    object gbTipoValor: TGroupBox
      Left = 295
      Top = 0
      Width = 312
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Tipo de Valor'
      TabOrder = 1
      DesignSize = (
        312
        45)
      inline fraTipoValor: TfraStaticCodigoDescripcion
        Left = 8
        Top = 14
        Width = 297
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 234
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
    object gbCheque: TGroupBox
      Left = 611
      Top = 0
      Width = 144
      Height = 45
      Anchors = [akTop, akRight]
      Caption = ' Cheque'
      TabOrder = 2
      object edNroCheque: TPatternEdit
        Left = 10
        Top = 16
        Width = 125
        Height = 21
        MaxLength = 20
        TabOrder = 0
        Pattern = '0123456789'
      end
    end
    object gbEmpresa: TGroupBox
      Left = 295
      Top = 45
      Width = 460
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 4
      DesignSize = (
        460
        45)
      inline fraEmpresaValor: TfraEmpresa
        Left = 8
        Top = 15
        Width = 442
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
        inherited lbContrato: TLabel
          Left = 340
        end
        inherited edContrato: TIntEdit
          Left = 385
        end
        inherited cmbRSocial: TArtComboBox
          Width = 203
        end
      end
    end
    object gbEstudio: TGroupBox
      Left = 3
      Top = 45
      Width = 288
      Height = 45
      Caption = ' Estudio'
      TabOrder = 3
      DesignSize = (
        288
        45)
      inline fraEstudio: TfraStaticCodigoDescripcion
        Left = 8
        Top = 14
        Width = 276
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 48
        end
        inherited cmbDescripcion: TComboGrid
          Left = 52
          Width = 221
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
  inherited CoolBar: TCoolBar
    Top = 138
    Width = 758
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 754
      end>
    inherited ToolBar: TToolBar
      Width = 741
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 378
        Top = 0
        Hint = 'Sumatoria'
        Caption = 'tbSumatoria'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 401
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 409
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 167
    Width = 758
    Height = 244
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOLETA_DEPOSITO'
        Title.Caption = 'Boleta Dep'#243'sito'
        Width = 85
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_DEPOSITO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Dep'#243'sito'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo Valor'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUE'
        Title.Caption = 'Nro. Cheque'
        Width = 92
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VENCIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Vencimiento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMISOR'
        Title.Caption = 'Emisor'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USU_CONCILIADO'
        Title.Caption = 'Usuario Conciliado'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CONCILIADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Conciliado'
        Width = 69
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ZBA.BA_NOMBRE BANCO, ZCB.CB_NUMERO CUENTA, RBD.BD_NUMERO ' +
        'BOLETA_DEPOSITO, RBD.BD_FECHA FECHA_DEPOSITO,'
      
        '       OTV.TV_DESCRIPCION TIPO, ZVA.VA_NROCHEQUE CHEQUE, ZVA.VA_' +
        'VENCIMIENTO VENCIMIENTO, ZVA.VA_IMPORTE IMPORTE,'
      
        '       OCV.CV_DESCRIPCION CONCEPTO, VA_IDCONTRATO CONTRATO, TESO' +
        'RERIA.GET_EMISORVALOR(VA_ID) EMISOR,'
      
        '       USE.SE_NOMBRE USU_CONCILIADO, OCB.CB_FECHAAPROBADO FECHA_' +
        'CONCILIADO'
      
        ' FROM ZBA_BANCO ZBA, ZCB_CUENTABANCARIA ZCB, RBD_BOLETADEPOSITO ' +
        'RBD,'
      
        '      OCV_CONCEPTOVALOR OCV, OTV_TIPOVALOR OTV, ZVA_VALOR ZVA, U' +
        'SE_USUARIOS USE,'
      '      OMB_MOVIMIENTOBANCO OMB, OCB_CONCILIACIONBANCARIA OCB'
      'WHERE ZCB.CB_ID = RBD.BD_IDCUENTABANCARIA'
      '  AND ZBA.BA_ID = ZCB.CB_IDBANCO'
      '  AND RBD.BD_ID = OMB.MB_IDCOMP'
      '  AND OMB.MB_ID = OCB.CB_IDMOVIMIENTO'
      '  AND RBD.BD_ID = ZVA.VA_IDBOLETADEP'
      '  AND OTV.TV_ID = ZVA.VA_IDTIPOVALOR'
      '  AND OCV.CV_ID = ZVA.VA_IDCONCEPTOVALOR'
      '  AND OCB.CB_USUAPROBADO = USE.SE_USUARIO'
      ' ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 90
    Options = [qoZoomPrint, qoZoomCalcFontSize]
  end
  inherited ShortCutControl: TShortCutControl
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
      end>
  end
end
