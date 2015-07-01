inherited frmEmbargosAplicacion: TfrmEmbargosAplicacion
  Left = 23
  Top = 48
  Width = 765
  Height = 460
  Caption = 'Embargos - Aplicaci'#243'n'
  Constraints.MinHeight = 460
  Constraints.MinWidth = 765
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 757
    Height = 149
    DesignSize = (
      757
      149)
    object lbBanco: TLabel
      Left = 27
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Banco'
    end
    object lbCuenta: TLabel
      Left = 21
      Top = 32
      Width = 34
      Height = 13
      Caption = 'Cuenta'
    end
    object Label22: TLabel
      Left = 241
      Top = 104
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nro. Carpeta'
    end
    object Label1: TLabel
      Left = 395
      Top = 6
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Demandante'
    end
    object label2: TLabel
      Left = 398
      Top = 30
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Demandado'
    end
    object label3: TLabel
      Left = 15
      Top = 104
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Car'#225'tula'
    end
    object lbJurisdiccion: TLabel
      Left = 1
      Top = 56
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jurisdicci'#243'n'
    end
    object Label18: TLabel
      Left = 429
      Top = 54
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fuero'
    end
    object Label19: TLabel
      Left = 16
      Top = 77
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Juzgado'
    end
    object Label20: TLabel
      Left = 406
      Top = 79
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Secretar'#237'a'
    end
    object Label4: TLabel
      Left = 556
      Top = 105
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object Label5: TLabel
      Left = 397
      Top = 104
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'F. Aplicaci'#243'n'
    end
    object Label6: TLabel
      Left = 6
      Top = 129
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aplicaci'#243'n'
    end
    inline fraCuentaBancaria: TfraStaticCodigoDescripcion
      Left = 60
      Top = 26
      Width = 330
      Height = 24
      TabOrder = 1
      DesignSize = (
        330
        24)
      inherited cmbDescripcion: TComboGrid
        Width = 267
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
    inline fraBanco: TfraStaticCodigoDescripcion
      Left = 60
      Top = 2
      Width = 330
      Height = 24
      TabOrder = 0
      DesignSize = (
        330
        24)
      inherited cmbDescripcion: TComboGrid
        Width = 267
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
    object edCarpeta: TIntEdit
      Left = 305
      Top = 100
      Width = 84
      Height = 21
      TabOrder = 9
      MaxLength = 8
      MaxValue = 99999999
    end
    object edDemandante: TEdit
      Left = 463
      Top = 2
      Width = 290
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edDemandado: TEdit
      Left = 463
      Top = 26
      Width = 290
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object edCaratula: TEdit
      Left = 61
      Top = 100
      Width = 175
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 8
    end
    inline fraJurisdiccion: TfraCodigoDescripcion
      Left = 60
      Top = 50
      Width = 330
      Height = 24
      TabOrder = 4
      DesignSize = (
        330
        24)
      inherited cmbDescripcion: TArtComboBox
        Width = 265
      end
    end
    inline fraFuero: TfraCodigoDescripcion
      Left = 463
      Top = 50
      Width = 291
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DesignSize = (
        291
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 226
      end
    end
    inline fraJuzgado: TfraCodigoDescripcion
      Left = 60
      Top = 75
      Width = 330
      Height = 24
      TabOrder = 6
      DesignSize = (
        330
        24)
      inherited cmbDescripcion: TArtComboBox
        Width = 265
      end
    end
    inline fraSecretaria: TfraCodigoDescripcion
      Left = 463
      Top = 75
      Width = 291
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      DesignSize = (
        291
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 226
      end
    end
    object edFechaAplDesde: TDateComboBox
      Left = 464
      Top = 100
      Width = 88
      Height = 21
      MaxDateCombo = edFechaAplHasta
      TabOrder = 10
    end
    object edFechaAplHasta: TDateComboBox
      Left = 572
      Top = 100
      Width = 88
      Height = 21
      MinDateCombo = edFechaAplDesde
      TabOrder = 11
    end
    inline fraTipoAplicacion: TfraCodigoDescripcion
      Left = 60
      Top = 124
      Width = 330
      Height = 24
      TabOrder = 12
      DesignSize = (
        330
        24)
      inherited cmbDescripcion: TArtComboBox
        Width = 265
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 149
    Width = 757
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 753
      end>
    inherited ToolBar: TToolBar
      Width = 740
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 178
    Width = 757
    Height = 255
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'CARPETA'
        Title.Caption = 'Carpeta'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEMANDANTE'
        Title.Caption = 'Demandante'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEMANDADO'
        Title.Caption = 'Demandado'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARATULA'
        Title.Caption = 'Car'#225'tula'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JURISDICCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUERO'
        Title.Caption = 'Fuero'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUZGADO'
        Title.Caption = 'Juzgado'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSTANCIA'
        Title.Caption = 'Instancia'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECRETARIA'
        Title.Caption = 'Secretar'#237'a'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOEMBARGADO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Embargado'
        Width = 95
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Retenido'
        Width = 89
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OFICIO'
        Title.Caption = 'Oficio'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REPETIDO'
        Title.Alignment = taCenter
        Title.Caption = 'Repetido'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 211
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_APLICACION'
        Title.Caption = 'Tipo Aplicaci'#243'n'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTEAPLICADO'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Aplicado'
        Width = 87
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_APLICACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aplicaci'#243'n'
        Width = 75
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT JT_NUMEROCARPETA CARPETA, JT_DEMANDANTE DEMANDANTE, JT_DE' +
        'MANDADO DEMANDADO, NVL(JT_CARATULA, EM_CARATULA) CARATULA,'
      
        '       JU_DESCRIPCION JURISDICCION, FU_DESCRIPCION FUERO, JZ_DES' +
        'CRIPCION JUZGADO, IN_DESCRIPCION INSTANCIA,'
      
        '       SC_DESCRIPCION SECRETARIA, BA_NOMBRE BANCO, CB_NUMERO CUE' +
        'NTA, EM_IMPORTE IMPORTE, EM_FECHA FECHA, EM_OFICIO OFICIO,'
      
        '       EE_DESCRIPCION ESTADO, EM_REPETIDO REPETIDO, EM_OBSERVACI' +
        'ONES OBSERVACIONES, EM_ID, '
      
        '  '#9'   TA_DESCRIPCION TIPO_APLICACION, AE_IMPORTE IMPORTEAPLICADO' +
        ', TRUNC(AE_FECHAALTA) FECHA_APLICACION '
      
        '  FROM ZBA_BANCO, ZCB_CUENTABANCARIA, LEGALES.LJT_JUICIOENTRAMIT' +
        'E, LEGALES.LJU_JURISDICCION, LEGALES.LFU_FUERO,'
      
        '       LEGALES.LJZ_JUZGADO, LEGALES.LIN_INSTANCIA, LEGALES.LSC_S' +
        'ECRETARIA, LEE_ESTADOEMBARGO,'
      
        '       LAE_APLICACIONEMBARGO, LTA_TIPOAPLICACIONEMBARGO, LEM_EMB' +
        'ARGO'
      ' WHERE EE_ID = EM_IDESTADO'
      '   AND CB_ID(+) = EM_IDCUENTABANCARIA'
      '   AND BA_ID(+) = CB_IDBANCO'
      '   AND EM_ID = AE_IDEMBARGO'
      '   AND TA_ID = AE_IDTIPOAPLICACION'
      '   AND JT_ID(+) = EM_IDJUICIO'
      '   AND IN_ID = JZ_IDINSTANCIA'
      '   AND JU_ID = NVL(JT_IDJURISDICCION, EM_IDJURISDICCION)'
      '   AND FU_ID = NVL(JT_IDFUERO, EM_IDFUERO)'
      '   AND JZ_ID = NVL(JT_IDJUZGADO, EM_IDJUZGADO)'
      '   AND SC_ID = NVL(JT_IDSECRETARIA, EM_IDSECRETARIA)'
      '   AND EM_FECHABAJA IS NULL'
      '   AND AE_FECHABAJA IS NULL'
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 80
    Options = [qoZoomPrint, qoZoomCalcFontSize]
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
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
      end>
    Left = 124
    Top = 200
  end
end
