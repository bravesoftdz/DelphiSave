inherited frmEmpresasBajaTraspaso: TfrmEmpresasBajaTraspaso
  Left = 33
  Top = 92
  Width = 755
  Height = 400
  Caption = 'Empresas de Baja por Traspaso'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 755
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 747
    Height = 46
    DesignSize = (
      747
      46)
    object gbFechaBaja: TGroupBox
      Left = 490
      Top = 0
      Width = 256
      Height = 42
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Baja'
      TabOrder = 1
      object Label9: TLabel
        Left = 6
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label10: TLabel
        Left = 130
        Top = 19
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFBajaDesde: TDateComboBox
        Left = 39
        Top = 14
        Width = 88
        Height = 23
        MaxDateCombo = edFBajaHasta
        TabOrder = 0
      end
      object edFBajaHasta: TDateComboBox
        Left = 162
        Top = 14
        Width = 88
        Height = 23
        MinDateCombo = edFBajaDesde
        TabOrder = 1
      end
    end
    object gbEmpresa: TGroupBox
      Left = 1
      Top = 0
      Width = 486
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        486
        42)
      inline fraEmpresa: TfraEmpresa
        Left = 7
        Top = 14
        Width = 472
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
        DesignSize = (
          472
          21)
        inherited lbContrato: TLabel
          Left = 370
        end
        inherited edContrato: TIntEdit
          Left = 415
        end
        inherited cmbRSocial: TArtComboBox
          Width = 233
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 46
    Width = 747
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 743
      end>
    inherited ToolBar: TToolBar
      Width = 730
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 75
    Width = 747
    Height = 298
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Width = 48
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIG_DESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Desde'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTBMBAJADESCR'
        Title.Caption = 'Motivo de Baja'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESCR_SECTOR'
        Title.Caption = 'Sector'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTUDIO'
        Title.Caption = 'Estudio'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CALLE'
        Title.Caption = 'Calle'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'Nro.'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PISO'
        Title.Caption = 'Piso'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPARTAMENTO'
        Title.Caption = 'Depto.'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPOSTAL'
        Title.Caption = 'C. Postal'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 98
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CONCURSO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Concurso'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ULT_MES_CONCURSO'
        Title.Caption = 'Ult. Mes Conc.'
        Width = 77
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_QUIEBRA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Quiebra'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ULT_MES_QUIEBRA'
        Title.Caption = 'Ult. Mes Quiebra'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEUDATOTAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Deuda Total Neta'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTPERIODOSCUOTA'
        Title.Alignment = taCenter
        Title.Caption = 'Per'#237'odos Cuota Completa'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOREFINANCIADO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Refinanciado'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOREFINANCIADOPENDIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Refinanciado Pend.'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ILT_COMPENSABLE'
        Title.Alignment = taCenter
        Title.Caption = 'ILT Compensable'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEUDATOTEXIGIBLE'
        Title.Alignment = taCenter
        Title.Caption = 'Deuda Total Exigible'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECLAMOAFIP'
        Title.Alignment = taCenter
        Title.Caption = 'Reclamo AFIP'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEUDACONSOLIDADA'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo Consolidado'
        Width = 98
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'BT_TOTAL799'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo 799'
        Width = 89
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ULTPERDEUDOR'
        Title.Alignment = taCenter
        Title.Caption = 'Ult. Per. Deudor'
        Width = 85
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      '  '#9'SELECT BT_CUIT CUIT, BT_NOMBRE RSOCIAL, BT_CONTRATO CONTRATO,'
      
        '    '#9#9#9' BT_FECHA_BAJA FECHABAJA, CTBSECTOR.TB_DESCRIPCION DESCR_' +
        'SECTOR,'
      
        '           BT_CALLE CALLE, BT_NUMERO NUMERO, BT_PISO PISO, BT_DE' +
        'PARTAMENTO DEPARTAMENTO, BT_CPOSTAL CPOSTAL,'
      
        '           BT_LOCALIDAD LOCALIDAD, BT_PROVINCIA PROVINCIA, BT_FE' +
        'CHA_CONCURSO FECHA_CONCURSO,'
      
        '           BT_ULT_MES_CONCURSO ULT_MES_CONCURSO, BT_FECHA_QUIEBR' +
        'A FECHA_QUIEBRA, BT_ULT_MES_QUIEBRA ULT_MES_QUIEBRA,'
      
        '           BT_VIG_DESDE VIG_DESDE, BT_ESTUDIO ESTUDIO, NVL(DC_IL' +
        'TCOMPENSABLE, 0) ILT_COMPENSABLE,'
      
        '           NVL(DC_DEUDACUOTA, 0) + NVL(DC_DEUDACUOTADIFERENCIA, ' +
        '0) DEUDATOTEXIGIBLE,'
      
        '           NVL(DC_PERIODOSCUOTA, 0) CANTPERIODOSCUOTA, NVL(DC_MO' +
        'NTOREFINANCIADO, 0) MONTOREFINANCIADO,'
      
        '           NVL(DC_MONTOREFINANCIADOPEND, 0) MONTOREFINANCIADOPEN' +
        'DIENTE, NVL(DC_RECLAMOAFIP, 0) RECLAMOAFIP,'
      
        '           NVL(DC_DEUDATOTAL, 0) DEUDATOTAL, DEUDA.GET_DEUDATOTA' +
        'LCONSOLIDADA(BT_CONTRATO) DEUDACONSOLIDADA,'
      
        '           BT_TOTAL799, CTBMBAJA.TB_DESCRIPCION CTBMBAJADESCR, B' +
        'T_TELEFONOS TELEFONO,'
      
        '           GREATEST(NVL(DC_ULTPERDEUDADIF, DC_ULTPERDEUDACOMPL),' +
        ' NVL(DC_ULTPERDEUDACOMPL, DC_ULTPERDEUDADIF)) ULTPERDEUDOR'
      
        '      FROM CTB_TABLAS CTBMBAJA, CTB_TABLAS CTBSECTOR, AEM_EMPRES' +
        'A,'
      '     '#9#9#9' TDC_DEUDACOBRANZA, ZBT_BAJATRASPASO'
      '     WHERE CTBSECTOR.TB_CLAVE = '#39'SECT'#39
      '       AND CTBSECTOR.TB_CODIGO = EM_SECTOR'
      '       AND CTBMBAJA.TB_CODIGO(+) = BT_MOTIVOBAJA'
      '       AND CTBMBAJA.TB_CLAVE(+) = '#39'MOTIB'#39
      '       AND BT_CONTRATO = DC_CONTRATO(+)'
      '       AND DC_USUARIO(+) = '#39'SISTEMAS'#39
      '       AND BT_CUIT = EM_CUIT'
      '')
  end
  inherited QueryPrint: TQueryPrint
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
        LinkControl = tbSalir
      end>
    Left = 112
    Top = 200
  end
end
