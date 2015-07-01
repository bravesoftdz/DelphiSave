inherited frmControlStockCajas: TfrmControlStockCajas
  Caption = 'Control de Stock de Cajas Enviadas'
  ClientHeight = 450
  ClientWidth = 792
  Constraints.MinHeight = 480
  Constraints.MinWidth = 800
  OldCreateOrder = True
  ExplicitWidth = 800
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 91
    ExplicitWidth = 792
    ExplicitHeight = 91
    DesignSize = (
      792
      91)
    object gbArchivo: TGroupBox
      Left = 4
      Top = 1
      Width = 534
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Archivo'
      TabOrder = 0
      DesignSize = (
        534
        43)
      inline fraTipoArchivo: TfraStaticCodigoDescripcion
        Left = 9
        Top = 14
        Width = 517
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 9
        ExplicitTop = 14
        ExplicitWidth = 517
        DesignSize = (
          517
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 454
          ExplicitWidth = 454
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
    object rgEstadoCaja: TRadioGroup
      Left = 540
      Top = 1
      Width = 250
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Estado de las Cajas'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Pendientes'
        'Recibidas'
        'Todas')
      TabOrder = 1
    end
    object gbFechaEstado: TGroupBox
      Left = 4
      Top = 44
      Width = 220
      Height = 43
      Caption = 'Fecha de Env'#237'o'
      TabOrder = 2
      object Label1: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaEnvioDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaEnvioHasta
        TabOrder = 0
      end
      object edFechaEnvioHasta: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaEnvioDesde
        TabOrder = 1
      end
    end
    object pnlColores: TPanel
      Left = 674
      Top = 46
      Width = 115
      Height = 41
      Anchors = [akTop, akRight]
      TabOrder = 5
      object Label2: TLabel
        Left = 24
        Top = 6
        Width = 90
        Height = 13
        AutoSize = False
        Caption = 'En T'#233'rmino'
      end
      object shpEnTermino: TShape
        Left = 5
        Top = 5
        Width = 15
        Height = 15
        Brush.Color = clBlue
      end
      object shpFueraTermino: TShape
        Left = 5
        Top = 22
        Width = 15
        Height = 15
        Brush.Color = clRed
      end
      object label11: TLabel
        Left = 24
        Top = 23
        Width = 90
        Height = 13
        AutoSize = False
        Caption = 'Fuera de T'#233'rmino'
      end
    end
    object rgSituacionCaja: TRadioGroup
      Left = 334
      Top = 44
      Width = 340
      Height = 43
      Caption = 'Situaci'#243'n de las Cajas'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'En T'#233'rmino'
        'Fuera de T'#233'rmino'
        'Todas')
      TabOrder = 4
    end
    object gbEstadoAl: TGroupBox
      Left = 226
      Top = 44
      Width = 106
      Height = 43
      Caption = 'Estado al '
      TabOrder = 3
      object edFechaEstadoAl: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 91
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 788
      end>
    ExplicitTop = 91
    ExplicitWidth = 792
    inherited ToolBar: TToolBar
      Width = 779
      ExplicitWidth = 779
      DesignSize = (
        775
        23)
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImpresion
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        Visible = False
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        Visible = False
        ExplicitLeft = 362
      end
      object tbSumatoria: TToolButton
        Left = 385
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Wrap = True
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 0
        Top = 30
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlSeleccionados: TPanel
        Left = 23
        Top = 30
        Width = 384
        Height = 22
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = ' Cant. Cajas: '
        TabOrder = 0
        object Label3: TLabel
          Left = 107
          Top = 4
          Width = 87
          Height = 13
          AutoSize = False
          Caption = 'Cant. en T'#233'rmino:'
        end
        object Label4: TLabel
          Left = 238
          Top = 4
          Width = 100
          Height = 13
          AutoSize = False
          Caption = 'Cant. Fuera T'#233'rmino:'
        end
        object edCantCajas: TCardinalEdit
          Left = 63
          Top = 0
          Width = 40
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object edCantEnTermino: TCardinalEdit
          Left = 196
          Top = 0
          Width = 40
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object edCantFueraTermino: TCardinalEdit
          Left = 342
          Top = 0
          Width = 40
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 120
    Width = 792
    Height = 330
    OnGetCellParams = GridGetCellParams
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPOARCHIVO'
        Title.Caption = 'Tipo de Archivo'
        Width = 236
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Caja'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROREMITO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Remito'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROMEDIO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. CD'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAENVIO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Env'#237'o'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recepci'#243'n'
        Width = 81
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CANTDIAS'
        Title.Alignment = taCenter
        Title.Caption = 'D'#237'as Transcurridos'
        Width = 101
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FUERATERMINO'
        Title.Alignment = taCenter
        Title.Caption = 'Fuera de T'#233'rmino'
        Width = 92
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT IDTIPOARCHIVO, TIPOARCHIVO, CAJA, FECHAENVIO, NROREMITO, '
      
        '       TO_DATE(SUBSTR(FECHARECEPCION_NROMEDIO, 1, INSTR(FECHAREC' +
        'EPCION_NROMEDIO, '#39'-'#39')-1), '#39'DD/MM/YYYY'#39') FECHARECEPCION, '
      
        '       TO_NUMBER(SUBSTR(FECHARECEPCION_NROMEDIO, INSTR(FECHARECE' +
        'PCION_NROMEDIO, '#39'-'#39')+1)) NROMEDIO  '
      
        '  FROM (SELECT DISTINCT A.IDTIPOARCHIVO, A.TIPOARCHIVO, A.CAJA, ' +
        'A.FECHAENVIO, A.NROREMITO, '
      
        '               (SELECT TO_CHAR(TRUNC(RA_FECHAALTA), '#39'DD/MM/YYYY'#39 +
        ') || '#39'-'#39' || TO_CHAR(RA_NROMEDIO) '
      
        '                  FROM ARCHIVO.RAR_ARCHIVO, ARCHIVO.RRA_REPOSITO' +
        'RIOARCHIVO '
      '                 WHERE RA_FECHABAJA IS NULL'
      '                   AND RA_NROMEDIO >= 10000'
      '                   AND RA_IDARCHIVO = AR_ID'
      '                   AND A.LOTE = RA_LOTE(+)'
      '                   AND A.IDTIPOARCHIVO = AR_TIPO(+)'
      '                   AND ROWNUM <= 1) FECHARECEPCION_NROMEDIO'
      
        '    FROM (SELECT DISTINCT TA_ID IDTIPOARCHIVO, TA_DESCRIPCION TI' +
        'POARCHIVO, LO_ID LOTE, TO_NUMBER(SUBSTR(LO_CAJA, 1, INSTR(LO_CAJ' +
        'A, '#39' '#39')-1)) CAJA, TRUNC(RE_FECHAALTA) FECHAENVIO, RE_ID NROREMIT' +
        'O'
      
        '            FROM ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RRE_REMITO, AR' +
        'CHIVO.RLO_LOTE'
      '           WHERE LO_IDREMITO > 0'
      '             AND LO_FECHABAJA IS NULL'
      '             AND LO_IDREMITO = RE_ID'
      '             AND RE_FECHABAJA IS NULL'
      '             AND LO_TIPO = TA_ID '
      '             AND LO_FECHAALTA_CAJA >= SYSDATE - 365) A'
      ') '
      ' WHERE 1 = 2'
      ' ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
    Left = 110
    Top = 200
  end
  object pmnuImpresion: TPopupMenu
    Left = 156
    Top = 200
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
    object mnuImprimirResumen: TMenuItem
      Caption = 'Imprimir Resumen'
      OnClick = mnuImprimirResumenClick
    end
  end
end
