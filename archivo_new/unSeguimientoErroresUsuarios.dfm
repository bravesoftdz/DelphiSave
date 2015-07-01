inherited frmSeguimientoErroresUsuarios: TfrmSeguimientoErroresUsuarios
  Left = 129
  Top = 172
  Caption = 'Seguimiento de Errores de Usuarios'
  ClientHeight = 420
  ClientWidth = 787
  Constraints.MinHeight = 450
  Constraints.MinWidth = 795
  ExplicitLeft = 129
  ExplicitTop = 172
  ExplicitWidth = 795
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 787
    Height = 176
    Visible = True
    ExplicitWidth = 787
    ExplicitHeight = 176
    DesignSize = (
      787
      176)
    object gbUsuario: TGroupBox
      Left = 409
      Top = 43
      Width = 376
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Usuario'
      TabOrder = 4
      DesignSize = (
        376
        43)
      inline fraUsuarioBusq: TfraUsuarios
        Left = 8
        Top = 13
        Width = 362
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 13
        ExplicitWidth = 362
        DesignSize = (
          362
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 85
          Width = 275
          ExplicitLeft = 85
          ExplicitWidth = 275
        end
        inherited edCodigo: TPatternEdit
          Width = 81
          ExplicitWidth = 81
        end
      end
    end
    object gbError: TGroupBox
      Left = 4
      Top = 0
      Width = 444
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Errores'
      TabOrder = 0
      DesignSize = (
        444
        43)
      object cmbErroresBusq: TDBCheckCombo
        Left = 8
        Top = 13
        Width = 428
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ItemsSeparator = ';'
        DataSource = dsErrores
        KeyField = 'TB_CODIGO'
        ListField = 'DESCRIPCION'
      end
    end
    object gbFechaAltaBusq: TGroupBox
      Left = 565
      Top = 0
      Width = 220
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Alta'
      TabOrder = 2
      object Label1: TLabel
        Left = 105
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFAltaDesdeBusq: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFAltaHastaBusq
        TabOrder = 0
      end
      object edFAltaHastaBusq: TDateComboBox
        Left = 123
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFAltaDesdeBusq
        TabOrder = 1
      end
    end
    object gbLote: TGroupBox
      Left = 452
      Top = 0
      Width = 108
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Nro. de Lote'
      TabOrder = 1
      DesignSize = (
        108
        43)
      object edLoteBusq: TIntEdit
        Left = 9
        Top = 15
        Width = 91
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Options = [ioAllowEmpty, ioAllowNegative]
      end
    end
    object rgAjustes: TRadioGroup
      Left = 409
      Top = 129
      Width = 376
      Height = 43
      Caption = 'Estado de los Ajustes'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Ajustes Finalizados'
        'Ajustes Pendientes'
        'Todos')
      TabOrder = 8
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 43
      Width = 400
      Height = 43
      Caption = 'Gerencia'
      TabOrder = 3
      DesignSize = (
        400
        43)
      inline fraGerenciasBusq: TfraCodDesc
        Left = 8
        Top = 14
        Width = 386
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 386
        DesignSize = (
          386
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 54
          Width = 330
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'se_nivel'
              Title.Caption = 'Nivel'
              Visible = False
            end>
          ExplicitLeft = 54
          ExplicitWidth = 330
        end
        inherited edCodigo: TPatternEdit
          Width = 52
          ExplicitWidth = 52
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          ExtraCondition = ' AND se_nivel = 2 AND upper(se_descripcion) not like '#39'%BAJA%'#39
          ExtraFields = ', se_nivel'
          FieldBaja = 'se_fechabaja'
          FieldCodigo = 'se_id'
          FieldDesc = 'se_descripcion'
          FieldID = 'se_id'
          FullLikeComparison = True
          IdType = ctInteger
          OrderBy = 'se_descripcion'
          TableName = 'computos.cse_sector'
          OnChange = ControlFiltros
          Left = 103
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 86
      Width = 400
      Height = 43
      Caption = 'Jefatura'
      TabOrder = 5
      DesignSize = (
        400
        43)
      inline fraJefaturasBusq: TfraCodDesc
        Left = 8
        Top = 14
        Width = 386
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 386
        DesignSize = (
          386
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 54
          Width = 330
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'se_nivel'
              Title.Caption = 'Nivel'
              Visible = False
            end>
          ExplicitLeft = 54
          ExplicitWidth = 330
        end
        inherited edCodigo: TPatternEdit
          Width = 52
          ExplicitWidth = 52
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          ExtraCondition = 
            ' AND se_nivel = 3 AND upper(se_descripcion) not like '#39'%GERENCIA%' +
            #39
          ExtraFields = ', se_nivel'
          FieldBaja = 'se_fechabaja'
          FieldCodigo = 'se_id'
          FieldDesc = 'se_descripcion'
          FieldID = 'se_id'
          FullLikeComparison = True
          IdType = ctInteger
          OrderBy = 'se_descripcion'
          TableName = 'computos.cse_sector'
          OnChange = ControlFiltros
          Left = 103
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 4
      Top = 129
      Width = 400
      Height = 43
      Caption = 'Sector'
      TabOrder = 7
      DesignSize = (
        400
        43)
      inline fraSectoresBusq: TfraCodDesc
        Left = 8
        Top = 14
        Width = 386
        Height = 23
        Anchors = [akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 386
        DesignSize = (
          386
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 54
          Width = 330
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GERENCIA'
              Title.Caption = 'Gerencia'
              Visible = True
            end>
          ExplicitLeft = 54
          ExplicitWidth = 330
        end
        inherited edCodigo: TPatternEdit
          Width = 52
          ExplicitWidth = 52
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = 
            ' AND SE_NIVEL = 4 AND EXISTS (SELECT 1 FROM ART.USE_USUARIOS WHE' +
            'RE ART.USE_USUARIOS.SE_IDSECTOR = COMPUTOS.CSE_SECTOR.SE_ID)'
          ExtraFields = 
            ', se_nivel, (SELECT ger.se_descripcion FROM computos.cse_sector ' +
            'ger WHERE ger.se_id = (SELECT jef.se_idsectorpadre FROM computos' +
            '.cse_sector jef WHERE jef.se_id = (SELECT sec.se_idsectorpadre F' +
            'ROM computos.cse_sector sec WHERE sec.se_id = computos.cse_secto' +
            'r.se_id))) AS gerencia'
          FieldBaja = 'SE_FECHABAJA'
          FieldCodigo = 'SE_ID'
          FieldDesc = 'SE_DESCRIPCION'
          FieldID = 'SE_ID'
          FullLikeComparison = True
          OrderBy = 'SE_DESCRIPCION'
          ShowBajas = True
          TableName = 'COMPUTOS.CSE_SECTOR'
          Left = 88
        end
      end
    end
    object gbArchivo: TGroupBox
      Left = 409
      Top = 86
      Width = 376
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Archivo del Lote'
      TabOrder = 6
      DesignSize = (
        376
        43)
      inline fraTipoArchivoBusq: TfraCodigoDescripcion
        Left = 8
        Top = 15
        Width = 360
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 15
        ExplicitWidth = 360
        DesignSize = (
          360
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 96
          Width = 264
          ExplicitLeft = 96
          ExplicitWidth = 264
        end
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 90
          ExplicitLeft = 2
          ExplicitWidth = 90
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 176
    Width = 787
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 781
      end>
    ExplicitTop = 176
    ExplicitWidth = 787
    inherited ToolBar: TToolBar
      Width = 774
      ExplicitWidth = 774
      DesignSize = (
        770
        23)
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImprimir
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
        Visible = True
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        Visible = True
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
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
      object tbEnviarMailErrores: TToolButton
        Left = 385
        Top = 0
        Hint = 'Mails pendientes de env'#237'o a Jefes por Errores de Usuarios'
        ImageIndex = 31
        OnClick = tbEnviarMailErroresClick
      end
      object ToolButton7: TToolButton
        Left = 408
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbBuscarRepositorio: TToolButton
        Left = 416
        Top = 0
        Hint = 'B'#250'squeda aprox. en Repositorio de Error CD'
        ImageIndex = 47
        OnClick = tbBuscarRepositorioClick
      end
      object ToolButton9: TToolButton
        Left = 439
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbMarcarAjustado: TToolButton
        Left = 447
        Top = 0
        Hint = 'Marcar Ajuste Finalizado'
        ImageIndex = 18
        OnClick = tbMarcarAjustadoClick
      end
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Wrap = True
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 0
        Top = 30
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 30
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 31
        Top = 30
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlSeleccionados: TPanel
        Left = 54
        Top = 30
        Width = 313
        Height = 22
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = ' Cant. Reg.: '
        TabOrder = 1
        object Label6: TLabel
          Left = 106
          Top = 4
          Width = 51
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Aj. Finaliz.'
        end
        object Label7: TLabel
          Left = 211
          Top = 4
          Width = 47
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Aj. Pend.'
        end
        object edTotalRegistros: TCardinalEdit
          Left = 57
          Top = 0
          Width = 49
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object edTotalAjFinalizados: TCardinalEdit
          Left = 160
          Top = 0
          Width = 49
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object edTotalAjPendientes: TCardinalEdit
          Left = 262
          Top = 0
          Width = 49
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object pnlBajas: TPanel
        Left = 367
        Top = 30
        Width = 107
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkNoBajas: TCheckBox
          Left = 4
          Top = 2
          Width = 103
          Height = 18
          Caption = 'No Mostrar Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 205
    Width = 787
    Height = 215
    MultiSelect = True
    Columns = <
      item
        Expanded = False
        FieldName = 'USUGERENCIA'
        Title.Caption = 'Gerencia Usuario Error'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUJEFATURA'
        Title.Caption = 'Jefatura Usuario Error'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUSECTOR'
        Title.Caption = 'Sector Usuario Error'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Title.Caption = 'Usuario Error'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODERROR'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Error'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRERROR'
        Title.Caption = 'Descripci'#243'n Error'
        Width = 269
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODORESOLERROR'
        Title.Caption = 'Modo de Resoluci'#243'n Error'
        Width = 276
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOTE'
        Title.Alignment = taCenter
        Title.Caption = 'Lote'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEQ_LOTE'
        Title.Alignment = taCenter
        Title.Caption = 'Sec. Lote'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROMEDIO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. CD'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTERRORES'
        Title.Alignment = taCenter
        Title.Caption = 'Cant. Errores'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones - Carpeta - C'#243'd. Documento'
        Width = 280
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta Error'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTA'
        Title.Caption = 'Usuario Alta Error'
        Width = 136
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AJUSTADO'
        Title.Alignment = taCenter
        Title.Caption = 'Ajustado'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOARCHIVOLOTE'
        Title.Caption = 'Tipo Archivo Lote'
        Width = 192
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 212
    Top = 244
    Height = 227
    Constraints.MaxHeight = 227
    Constraints.MinHeight = 227
    Constraints.MinWidth = 461
    OnEnter = fpAbmEnter
    ExplicitLeft = 212
    ExplicitTop = 244
    ExplicitHeight = 227
    DesignSize = (
      461
      227)
    inherited BevelAbm: TBevel
      Top = 191
      ExplicitTop = 191
    end
    object Label2: TLabel [1]
      Left = 4
      Top = 14
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Usuario'
    end
    object Label3: TLabel [2]
      Left = 4
      Top = 40
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Error'
    end
    object Label4: TLabel [3]
      Left = 4
      Top = 92
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observac.'
    end
    object lblNroLote: TLabel [4]
      Left = 4
      Top = 67
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Lote'
    end
    object Label5: TLabel [5]
      Left = 164
      Top = 67
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cant. Errores'
    end
    inherited btnAceptar: TButton
      Top = 197
      TabOrder = 5
      ExplicitTop = 197
    end
    inherited btnCancelar: TButton
      Top = 197
      TabOrder = 6
      ExplicitTop = 197
    end
    inline fraUsuariosCarga: TfraUsuarios
      Left = 63
      Top = 9
      Width = 392
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 63
      ExplicitTop = 9
      ExplicitWidth = 392
      DesignSize = (
        392
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 85
        Width = 305
        ExplicitLeft = 85
        ExplicitWidth = 305
      end
      inherited edCodigo: TPatternEdit
        Width = 81
        ExplicitWidth = 81
      end
    end
    inline fraErrorCarga: TfraStaticCTB_TABLAS
      Left = 63
      Top = 36
      Width = 391
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 63
      ExplicitTop = 36
      ExplicitWidth = 391
      DesignSize = (
        391
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 327
        ExplicitWidth = 327
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
    object edObservacionesCarga: TMemo
      Left = 64
      Top = 89
      Width = 387
      Height = 97
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        '')
      MaxLength = 512
      TabOrder = 4
    end
    object edLoteCarga: TIntEdit
      Left = 64
      Top = 63
      Width = 81
      Height = 21
      TabOrder = 2
      MaxLength = 8
    end
    object edCantErroresCarga: TIntEdit
      Left = 240
      Top = 63
      Width = 81
      Height = 21
      TabOrder = 3
      Text = '1'
      MaxLength = 3
      MaxValue = 999
      MinValue = 1
      Value = 1
    end
    object edNroMedio: TIntEdit
      Left = 368
      Top = 63
      Width = 81
      Height = 21
      Color = clRed
      TabOrder = 7
      Visible = False
      MaxLength = 8
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT SE_NOMBRE USUARIO, EU_CODERROR CODERROR, TB_DESCRIPCION D' +
        'ESCRERROR'
      '  FROM CTB_TABLAS, ARCHIVO.REU_ERRORUSUARIO, USE_USUARIOS'
      ' WHERE EU_USUARIO = SE_USUARIO'
      '   AND TB_CLAVE = '#39'EUAGA'#39
      '   AND TB_CODIGO = EU_CODERROR'
      '   AND 1 = 2')
    Top = 266
  end
  inherited dsConsulta: TDataSource
    Top = 266
  end
  inherited SortDialog: TSortDialog
    Top = 294
  end
  inherited ExportDialog: TExportDialog
    Top = 294
  end
  inherited QueryPrint: TQueryPrint
    Totals.Font.Style = [fsBold]
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnReportBegin = QueryPrintReportBegin
    Top = 322
  end
  inherited Seguridad: TSeguridad
    Top = 238
  end
  inherited FormStorage: TFormStorage
    Top = 238
  end
  inherited PrintDialog: TPrintDialog
    Top = 322
  end
  inherited ShortCutControl: TShortCutControl
    Top = 238
  end
  inherited FieldHider: TFieldHider
    Top = 266
  end
  object sdqErrores: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT TB_CODIGO, TB_DESCRIPCION || '#39' ('#39' || TRIM(TB_CODIGO) || '#39 +
        ')'#39' DESCRIPCION'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CODIGO <> '#39'0'#39
      '   AND TB_CLAVE = '#39'EUAGA'#39' '
      ' ORDER BY TB_DESCRIPCION')
    Left = 67
    Top = 9
  end
  object dsErrores: TDataSource
    DataSet = sdqErrores
    Left = 95
    Top = 9
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
    Left = 109
    Top = 238
  end
  object pmnuImprimir: TPopupMenu
    Left = 154
    Top = 242
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
    object mnuImprimirResumenGcia: TMenuItem
      Caption = 'Imprimir Resumen Por Gerencia'
      OnClick = mnuImprimirResumenGciaClick
    end
    object ImprimirResumenUsuario: TMenuItem
      Caption = 'Imprimir Resumen Por Usuario'
      OnClick = ImprimirResumenUsuarioClick
    end
  end
end
