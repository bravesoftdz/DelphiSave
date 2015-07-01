inherited frmSaldoEmbargos: TfrmSaldoEmbargos
  Left = 86
  Top = 107
  Width = 650
  Height = 450
  Caption = 'Saldo de Embargos'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 650
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 642
    Height = 47
    object GroupBox1: TGroupBox
      Left = 4
      Top = -1
      Width = 149
      Height = 44
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 17
        Width = 44
        Height = 13
        AutoSize = False
        Caption = 'Saldo al'
      end
      object edSaldoHasta: TDateComboBox
        Left = 53
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 47
    Width = 642
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 638
      end>
    inherited ToolBar: TToolBar
      Width = 625
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
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
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
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
      object ToolButton2: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object Panel1: TPanel
        Left = 432
        Top = 0
        Width = 107
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object chkSoloConSaldo: TCheckBox
          Left = 11
          Top = 4
          Width = 94
          Height = 14
          Caption = 'S'#243'lo con Saldo'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 76
    Width = 642
    Height = 347
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 109
        Visible = True
      end
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
        Width = 86
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
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'APLICADO'
        Title.Alignment = taCenter
        Title.Caption = 'Aplicado'
        Width = 80
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOJUICIO'
        Title.Caption = 'Tipo de Juicio '
        Width = 87
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GPBA'
        Title.Alignment = taCenter
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MALA_PRAXIS'
        Title.Alignment = taCenter
        Title.Caption = 'Mala Praxis'
        Width = 62
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TIPO, CARPETA, DEMANDANTE, DEMANDADO, CARATULA, JURISDICC' +
        'ION, FUERO, JUZGADO, INSTANCIA,'
      
        '       SECRETARIA, REPETIDO, BANCO, CUENTA, IMPORTE, APLICADO, S' +
        'ALDO, FECHA, OFICIO, ESTADO, OBSERVACIONES'
      '  FROM ( SELECT '#39'EMBARGO'#39' TIPO,'
      
        '         '#9'    JT_NUMEROCARPETA CARPETA, JT_DEMANDANTE DEMANDANTE' +
        ', JT_DEMANDADO DEMANDADO, NVL(JT_CARATULA, EM_CARATULA) CARATULA' +
        ','
      
        '                JU_DESCRIPCION JURISDICCION, FU_DESCRIPCION FUER' +
        'O, JZ_DESCRIPCION JUZGADO, IN_DESCRIPCION INSTANCIA,'
      
        '                SC_DESCRIPCION SECRETARIA, BA_NOMBRE BANCO, CB_N' +
        'UMERO CUENTA, EM_IMPORTE IMPORTE,'
      
        '                ART.LEGALES.GET_MONTOAPLICADOEMBARGO(EM_ID) APLI' +
        'CADO, EM_IMPORTE - ART.LEGALES.GET_MONTOAPLICADOEMBARGO(EM_ID) S' +
        'ALDO,'
      
        '                EM_FECHA FECHA, EM_OFICIO OFICIO, EE_DESCRIPCION' +
        ' ESTADO, EM_REPETIDO REPETIDO, EM_OBSERVACIONES OBSERVACIONES  '
      
        '           FROM ZBA_BANCO, ZCB_CUENTABANCARIA, LEGALES.LJT_JUICI' +
        'OENTRAMITE, LEGALES.LJU_JURISDICCION, LEGALES.LFU_FUERO,'
      
        '                LEGALES.LJZ_JUZGADO, LEGALES.LIN_INSTANCIA, LEGA' +
        'LES.LSC_SECRETARIA, LRE_REGULARIZACIONEMBARGO, LEE_ESTADOEMBARGO' +
        ','
      '                LEM_EMBARGO'
      '          WHERE EE_ID = EM_IDESTADO'
      '            AND CB_ID(+) = EM_IDCUENTABANCARIA'
      '            AND BA_ID(+) = CB_IDBANCO'
      '            AND RE_ID(+) = EM_IDREGULARIZADO'
      '            AND JT_ID(+) = EM_IDJUICIO'
      '            AND IN_ID = JZ_IDINSTANCIA'
      
        '            AND JU_ID = NVL(JT_IDJURISDICCION, EM_IDJURISDICCION' +
        ')'
      '            AND FU_ID = NVL(JT_IDFUERO, EM_IDFUERO)'
      '            AND JZ_ID = NVL(JT_IDJUZGADO, EM_IDJUZGADO)'
      '            AND SC_ID = NVL(JT_IDSECRETARIA, EM_IDSECRETARIA)'
      '            AND EM_FECHABAJA IS NULL'
      '          UNION ALL'
      '         SELECT '#39'DEVOLUCION'#39' TIPO,'
      '         '#9'    NULL CARPETA, NULL DEMANDANTE, NULL DEMANDADO,'
      
        '         '#9'    VE_CARATULA CARATULA, JU_DESCRIPCION JURISDICCION,' +
        ' FU_DESCRIPCION FUERO, JZ_DESCRIPCION JUZGADO,'
      
        '                IN_DESCRIPCION INSTANCIA, SC_DESCRIPCION SECRETA' +
        'RIA, BA_NOMBRE BANCO, CB_NUMERO CUENTA, -VE_IMPORTE IMPORTE,'
      
        '                0 APLICADO, -VE_IMPORTE SALDO, VE_FECHA FECHA, V' +
        'E_OFICIO OFICIO, '#39'Sin Asignar'#39' ESTADO, null REPETIDO, VE_OBSERVA' +
        'CIONES OBSERVACIONES'
      
        '           FROM ZBA_BANCO, ZCB_CUENTABANCARIA, LEGALES.LJU_JURIS' +
        'DICCION, LEGALES.LFU_FUERO, LEGALES.LJZ_JUZGADO, LEGALES.LIN_INS' +
        'TANCIA,'
      '                LEGALES.LSC_SECRETARIA, LVE_DEVOLUCIONEMBARGO'
      '          WHERE CB_ID = VE_IDCUENTABANCARIA'
      '            AND BA_ID = CB_IDBANCO'
      '            AND IN_ID = JZ_IDINSTANCIA'
      '            AND JU_ID = VE_IDJURISDICCION'
      '            AND FU_ID = VE_IDFUERO'
      '            AND JZ_ID = VE_IDJUZGADO'
      '            AND SC_ID = VE_IDSECRETARIA'
      '            AND VE_ASIGNADO = '#39'N'#39
      '            AND VE_FECHABAJA IS NULL )'
      ' WHERE SALDO <> 0'
      '   AND 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 75
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
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end>
  end
end
