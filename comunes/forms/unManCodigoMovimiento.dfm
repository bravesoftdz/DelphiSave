inherited frmManCodigoMovimiento: TfrmManCodigoMovimiento
  Left = -4
  Top = -4
  Width = 808
  Height = 608
  Caption = 'Mantenimiento de C'#243'digo de Movimiento'
  Constraints.MinWidth = 580
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 800
    Height = 112
    Visible = True
    object Label7: TLabel
      Left = 20
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label8: TLabel
      Left = 195
      Top = 9
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label10: TLabel
      Left = 4
      Top = 36
      Width = 49
      Height = 13
      Caption = 'Operaci'#243'n'
    end
    object Label11: TLabel
      Left = 7
      Top = 63
      Width = 46
      Height = 13
      Caption = 'Concepto'
    end
    object Label12: TLabel
      Left = 30
      Top = 89
      Width = 23
      Height = 13
      Caption = 'Libro'
    end
    object edfCM_CODIGO: TEdit
      Left = 56
      Top = 5
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 3
      TabOrder = 0
    end
    object edfCM_DESCRIPCION: TEdit
      Left = 236
      Top = 5
      Width = 430
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 1
    end
    object gbComisionable: TGroupBox
      Left = 670
      Top = 0
      Width = 128
      Height = 55
      Anchors = [akTop, akRight]
      Caption = 'Comisionable'
      TabOrder = 2
      object rbfComisionable: TRadioButton
        Left = 8
        Top = 35
        Width = 53
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbfNoComisionable: TRadioButton
        Left = 49
        Top = 35
        Width = 35
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbTodos: TRadioButton
        Left = 8
        Top = 16
        Width = 53
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    inline frafCM_OPERACION: TfraStaticCTB_TABLAS
      Left = 55
      Top = 31
      Width = 612
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TComboGrid
        Width = 548
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    inline frafCM_CONCEPTO: TfraStaticCTB_TABLAS
      Left = 55
      Top = 58
      Width = 612
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      inherited cmbDescripcion: TComboGrid
        Width = 548
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    inline frafCM_LIBRO: TfraStaticCTB_TABLAS
      Left = 55
      Top = 85
      Width = 612
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      inherited cmbDescripcion: TComboGrid
        Width = 548
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object gbEstado: TGroupBox
      Left = 670
      Top = 55
      Width = 128
      Height = 52
      Anchors = [akTop, akRight]
      Caption = 'Estado'
      TabOrder = 6
      object rbEstadoSoloActivos: TRadioButton
        Left = 8
        Top = 31
        Width = 80
        Height = 17
        Caption = 'Solo Activos'
        TabOrder = 0
      end
      object rbEstadoTodos: TRadioButton
        Left = 8
        Top = 14
        Width = 50
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 112
    Width = 800
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 796
      end>
    inherited ToolBar: TToolBar
      Width = 783
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 141
    Width = 800
    Height = 440
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'CM_CODIGO'
        Title.Caption = 'C'#243'digo '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_DESCRIPCION'
        Title.Caption = 'Nombre'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CM_COMISIONABLE'
        Title.Alignment = taCenter
        Title.Caption = 'Comisionable'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_DETALLE'
        Title.Caption = 'Detalle'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPERACION'
        Title.Caption = 'Operaci'#243'n'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBRO'
        Title.Caption = 'Libro'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CM_ESMOVIMIENTOINTERNO'
        Title.Alignment = taCenter
        Title.Caption = 'Mov. Int.'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERFIL'
        Title.Caption = 'Perfil'
        Width = 52
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CM_TRANSFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Transf.'
        Width = 38
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 114
    Top = 158
    Width = 460
    Height = 278
    Caption = 'Carga de C'#243'digos de Movimiento'
    BorderStyle = bsSingle
    Position = poScreenCenter
    inherited BevelAbm: TBevel
      Top = 242
      Width = 452
    end
    object Label1: TLabel [1]
      Left = 20
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 195
      Top = 9
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label3: TLabel [3]
      Left = 20
      Top = 35
      Width = 33
      Height = 13
      Caption = 'Detalle'
    end
    object Label4: TLabel [4]
      Left = 4
      Top = 80
      Width = 49
      Height = 13
      Caption = 'Operaci'#243'n'
    end
    object Label5: TLabel [5]
      Left = 7
      Top = 106
      Width = 46
      Height = 13
      Caption = 'Concepto'
    end
    object Label6: TLabel [6]
      Left = 30
      Top = 132
      Width = 23
      Height = 13
      Caption = 'Libro'
    end
    inherited btnAceptar: TButton
      Left = 302
      Top = 248
    end
    inherited btnCancelar: TButton
      Left = 380
      Top = 248
    end
    object edCM_CODIGO: TEdit
      Left = 56
      Top = 5
      Width = 121
      Height = 21
      MaxLength = 3
      TabOrder = 2
    end
    object edCM_DESCRIPCION: TEdit
      Left = 236
      Top = 5
      Width = 218
      Height = 21
      MaxLength = 40
      TabOrder = 3
    end
    object edCM_DETALLE: TMemo
      Left = 56
      Top = 31
      Width = 398
      Height = 40
      MaxLength = 80
      TabOrder = 4
    end
    object gbCM_COMISIONABLE: TGroupBox
      Left = 55
      Top = 150
      Width = 89
      Height = 44
      Caption = 'Comisionable'
      TabOrder = 8
      object rbComisionable: TRadioButton
        Left = 9
        Top = 16
        Width = 35
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbNoComisionable: TRadioButton
        Left = 47
        Top = 16
        Width = 35
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
    end
    inline fraCM_OPERACION: TfraStaticCTB_TABLAS
      Left = 55
      Top = 75
      Width = 401
      Height = 23
      TabOrder = 5
      inherited cmbDescripcion: TComboGrid
        Width = 337
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    inline fraCM_CONCEPTO: TfraStaticCTB_TABLAS
      Left = 55
      Top = 101
      Width = 401
      Height = 23
      TabOrder = 6
      inherited cmbDescripcion: TComboGrid
        Width = 337
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    inline fraCM_LIBRO: TfraStaticCTB_TABLAS
      Left = 55
      Top = 127
      Width = 401
      Height = 23
      TabOrder = 7
      inherited cmbDescripcion: TComboGrid
        Width = 337
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object gbCM_ESMOVIMIENTOINTERNO: TGroupBox
      Left = 150
      Top = 194
      Width = 111
      Height = 44
      Caption = 'Movimiento Interno'
      TabOrder = 11
      object rbEsMovimientoInterno: TRadioButton
        Left = 9
        Top = 16
        Width = 35
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbNoEsMovimientoInterno: TRadioButton
        Left = 57
        Top = 16
        Width = 35
        Height = 17
        Caption = 'No'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
    end
    object gbCM_PERFIL: TGroupBox
      Left = 150
      Top = 150
      Width = 305
      Height = 44
      Caption = 'Perfil'
      TabOrder = 9
      object rbPerfilCobranza: TRadioButton
        Left = 18
        Top = 16
        Width = 67
        Height = 17
        Caption = 'Cobranza'
        TabOrder = 0
      end
      object rbPerfilEmision: TRadioButton
        Left = 120
        Top = 16
        Width = 59
        Height = 17
        Caption = 'Emisi'#243'n'
        TabOrder = 1
      end
      object rbPerfilAmbos: TRadioButton
        Left = 215
        Top = 16
        Width = 52
        Height = 17
        Caption = 'Ambos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object gbCM_TRANSFERENCIA: TGroupBox
      Left = 55
      Top = 194
      Width = 89
      Height = 44
      Caption = 'Transferencia'
      TabOrder = 10
      object rbConTransferencia: TRadioButton
        Left = 9
        Top = 16
        Width = 35
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbSinTransferencia: TRadioButton
        Left = 47
        Top = 16
        Width = 35
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CM_CODIGO, CM_DESCRIPCION, CM_COMISIONABLE, CM_DETALLE, O' +
        'PER.TB_DESCRIPCION OPERACION,'
      
        '       CONC.TB_DESCRIPCION CONCEPTO, LIBRO.TB_DESCRIPCION LIBRO,' +
        ' CM_CONCEPTO, CM_LIBRO, CM_OPERACION,'
      '       CM_FECHABAJA, CM_TRANSFERENCIA, CM_ESMOVIMIENTOINTERNO'
      
        '  FROM CTB_TABLAS CONC, CTB_TABLAS OPER, ZCM_CODIGOMOVIMIENTO, C' +
        'TB_TABLAS LIBRO'
      ' WHERE CM_OPERACION=OPER.TB_CODIGO'
      '   AND OPER.TB_CLAVE='#39'TOPER'#39
      '   AND CM_CONCEPTO=CONC.TB_CODIGO'
      '   AND CONC.TB_CLAVE='#39'TCONC'#39
      '   AND CM_LIBRO=LIBRO.TB_CODIGO(+)'
      '   AND LIBRO.TB_CLAVE(+)='#39'TLIBR'#39
      ' '
      ' ')
    Left = 9
    Top = 210
  end
  inherited dsConsulta: TDataSource
    Left = 37
    Top = 210
  end
  inherited SortDialog: TSortDialog
    Left = 9
    Top = 238
  end
  inherited ExportDialog: TExportDialog
    Left = 37
    Top = 238
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcNone
    PageOrientation = pxLandscape
    PageSize = psLetter
    Left = 37
    Top = 266
  end
  inherited Seguridad: TSeguridad
    Left = 8
    Top = 182
  end
  inherited FormStorage: TFormStorage
    Left = 37
    Top = 182
  end
  inherited PrintDialog: TPrintDialog
    Left = 9
    Top = 266
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
        LinkControl = tbSalir
      end>
    Left = 65
    Top = 182
  end
  inherited FieldHider: TFieldHider
    Left = 65
    Top = 210
  end
end
