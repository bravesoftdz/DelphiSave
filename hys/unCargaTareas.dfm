inherited frmCargaTareas: TfrmCargaTareas
  Left = 540
  Top = 159
  Caption = 'Carga de Tareas'
  ClientHeight = 673
  ClientWidth = 1095
  ExplicitWidth = 1103
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter2: TJvNetscapeSplitter [0]
    Left = 914
    Top = 205
    Height = 468
    Align = alRight
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ExplicitLeft = 440
    ExplicitTop = 140
    ExplicitHeight = 299
  end
  inherited pnlFiltros: TPanel
    Width = 1095
    Height = 176
    Visible = True
    ExplicitWidth = 1095
    ExplicitHeight = 176
    DesignSize = (
      1095
      176)
    object Label5: TLabel
      Left = 8
      Top = 59
      Width = 46
      Height = 13
      Caption = 'Preventor'
    end
    object Label19: TLabel
      Left = 8
      Top = 8
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label14: TLabel
      Left = 8
      Top = 33
      Width = 30
      Height = 13
      Caption = 'Estab.'
    end
    object Label44: TLabel
      Left = 806
      Top = 33
      Width = 62
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Visita Desde:'
      ExplicitLeft = 332
    end
    object Label46: TLabel
      Left = 962
      Top = 33
      Width = 31
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Hasta:'
      ExplicitLeft = 488
    end
    object Label8: TLabel
      Left = 8
      Top = 109
      Width = 57
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Coordinador'
    end
    object Label11: TLabel
      Left = 8
      Top = 158
      Width = 33
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estado'
    end
    object Label31: TLabel
      Left = 8
      Top = 133
      Width = 32
      Height = 13
      Caption = 'Viatico'
    end
    object Label39: TLabel
      Left = 1031
      Top = 159
      Width = 54
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Con Viatico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label38: TLabel
      Left = 8
      Top = 84
      Width = 56
      Height = 13
      Caption = 'Tercerizado'
    end
    object chkExcluirBajas: TCheckBox
      Left = 1003
      Top = 59
      Width = 82
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Excluir Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    inline fraPreventorFiltro: TfraCodigoDescripcion
      Left = 60
      Top = 54
      Width = 937
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ExplicitLeft = 60
      ExplicitTop = 54
      ExplicitWidth = 937
      DesignSize = (
        937
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 68
        Width = 867
        CharCase = ecUpperCase
        DataSource = nil
        ExplicitLeft = 68
        ExplicitWidth = 867
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
        ExplicitWidth = 64
      end
    end
    object edEstablecimientoFiltro: TPatternEdit
      Left = 44
      Top = 29
      Width = 751
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Pattern = '1234567890-,'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 44
      Top = 3
      Width = 1041
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
      ExplicitLeft = 44
      ExplicitTop = 3
      ExplicitWidth = 1041
      ExplicitHeight = 21
      DesignSize = (
        1041
        21)
      inherited lbContrato: TLabel
        Left = 937
        ExplicitLeft = 463
      end
      inherited edContrato: TIntEdit
        Left = 984
        ExplicitLeft = 984
      end
      inherited cmbRSocial: TArtComboBox
        Width = 802
        DataSource = nil
        ExplicitWidth = 802
      end
    end
    object edVisitaDesde: TDateComboBox
      Left = 871
      Top = 29
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object edVisitaHasta: TDateComboBox
      Left = 998
      Top = 29
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    inline fraCoordinador: TfraCodigoDescripcion
      Left = 74
      Top = 104
      Width = 833
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      ExplicitLeft = 74
      ExplicitTop = 104
      ExplicitWidth = 833
      DesignSize = (
        833
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 68
        Width = 763
        CharCase = ecUpperCase
        DataSource = nil
        ExplicitLeft = 68
        ExplicitWidth = 763
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
        ExplicitWidth = 64
      end
    end
    object chkPreventor: TCheckBox
      Left = 904
      Top = 107
      Width = 99
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Origen Preventor'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object chkActuaciones: TCheckBox
      Left = 1008
      Top = 107
      Width = 78
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Actuaciones'
      TabOrder = 8
    end
    object cbPendiente: TCheckBox
      Left = 75
      Top = 156
      Width = 78
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Pendiente'
      TabOrder = 9
    end
    object cbAprobado: TCheckBox
      Left = 195
      Top = 156
      Width = 78
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Aprobado'
      TabOrder = 10
    end
    object ToolBar4: TToolBar
      Left = 1007
      Top = 128
      Width = 27
      Height = 23
      Align = alNone
      Anchors = [akTop, akRight]
      Caption = 'ToolBar4'
      HotImages = dmPrincipal.ilColor
      Images = dmPrincipal.ilByN
      TabOrder = 11
      object tbBusquedaViatico: TToolButton
        Left = 0
        Top = 0
        Hint = 'Seleccionar Viatico'
        Caption = 'tbBusquedaViatico'
        ImageIndex = 38
        OnClick = tbBusquedaViaticoClick
      end
    end
    object Panel3: TPanel
      Left = 1012
      Top = 160
      Width = 12
      Height = 13
      Anchors = [akTop, akRight]
      Color = clBlue
      ParentBackground = False
      TabOrder = 12
    end
    inline fraViaticoFiltro: TfraStaticCodigoDescripcion
      Left = 75
      Top = 128
      Width = 914
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 13
      ExplicitLeft = 75
      ExplicitTop = 128
      ExplicitWidth = 914
      DesignSize = (
        914
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 851
        ExplicitWidth = 851
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
    inline fraPreventorTercerizadoFiltro: TfraCodigoDescripcion
      Left = 75
      Top = 79
      Width = 920
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 14
      ExplicitLeft = 75
      ExplicitTop = 79
      ExplicitWidth = 920
      DesignSize = (
        920
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 68
        Width = 852
        CharCase = ecUpperCase
        DataSource = nil
        ExplicitLeft = 68
        ExplicitWidth = 852
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
        ExplicitWidth = 64
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 176
    Width = 1095
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1089
      end>
    ExplicitTop = 176
    ExplicitWidth = 1095
    inherited ToolBar: TToolBar
      Left = 9
      Width = 1082
      ExplicitLeft = 9
      ExplicitWidth = 1082
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object tbImprimirRemito: TToolButton
        Left = 370
        Top = 0
        Hint = 'Imprimir Remito'
        Caption = 'Imprimir Remito'
        ImageIndex = 15
        OnClick = tbImprimirRemitoClick
      end
      object tbDesSeleccionarTodo: TToolButton
        Left = 393
        Top = 0
        Hint = 'Invertir Selecci'#243'n'
        Caption = 'Invertir Selecci'#243'n'
        ImageIndex = 45
        OnClick = tbDesSeleccionarTodoClick
      end
      object tbSeleccionarTodo: TToolButton
        Left = 416
        Top = 0
        Hint = 'Seleccionar Todo'
        Caption = 'Seleccionar Todo'
        ImageIndex = 46
        OnClick = tbSeleccionarTodoClick
      end
      object tbProcesarViatico: TToolButton
        Left = 439
        Top = 0
        Hint = 'Procesar Viatico'
        Caption = 'tbProcesarViatico'
        ImageIndex = 44
        OnClick = tbProcesarViaticoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 205
    Width = 914
    Height = 468
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 19
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'Nro. Estab.'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Establecimiento'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_FECHAVISITA'
        Title.Caption = 'F.Visita'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VD_CANTVISITAS'
        Title.Caption = 'Visitas Declaradas'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTVISITAS'
        Title.Caption = 'Visitas Cargadas'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_KMS'
        Title.Caption = 'KMS'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_FECHAALTA'
        Title.Caption = 'F.Alta'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_FECHAMODIF'
        Title.Caption = 'F. Modif.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_USUMODIF'
        Title.Caption = 'Usuario Modif.'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_FECHABAJA'
        Title.Caption = 'F.Baja'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESAVIP'
        Title.Caption = 'Empresa VIP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIGENCARGA'
        Title.Caption = 'Origen Carga'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_APROBADO'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_USUAPROBADO'
        Title.Caption = 'Usuario de aprobado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_FECHAAPROBADO'
        Title.Caption = 'Fecha Aprobado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_IDVIATICO'
        Title.Caption = 'Viatico'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_FECHAVIATICO'
        Title.Caption = 'Fecha Viatico'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 298
    Top = 59
    Width = 585
    Height = 634
    OnShow = fpAbmShow
    ExplicitLeft = 298
    ExplicitTop = 59
    ExplicitWidth = 585
    ExplicitHeight = 634
    DesignSize = (
      585
      634)
    inherited BevelAbm: TBevel
      Left = 3
      Top = 598
      Width = 577
      ExplicitLeft = 3
      ExplicitTop = 598
      ExplicitWidth = 577
    end
    inherited btnAceptar: TButton
      Left = 427
      Top = 604
      Caption = '&Guardar'
      TabOrder = 2
      ExplicitLeft = 427
      ExplicitTop = 604
    end
    inherited btnCancelar: TButton
      Left = 505
      Top = 604
      Caption = '&Cerrar'
      TabOrder = 3
      OnClick = btnCancelarClick
      ExplicitLeft = 505
      ExplicitTop = 604
    end
    object btnAprobar: TButton
      Left = 347
      Top = 604
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aprobar'
      TabOrder = 1
      OnClick = btnAprobarClick
    end
    object pnDatos: TPanel
      Left = 0
      Top = 0
      Width = 585
      Height = 605
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        585
        605)
      object Label1: TLabel
        Left = 6
        Top = 14
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      object Label9: TLabel
        Left = 6
        Top = 89
        Width = 58
        Height = 13
        Caption = 'Fecha Visita'
      end
      object Label56: TLabel
        Left = 164
        Top = 89
        Width = 57
        Height = 13
        Caption = 'Hora Desde'
      end
      object Label2: TLabel
        Left = 6
        Top = 140
        Width = 20
        Height = 13
        Caption = 'Kms'
      end
      object Label3: TLabel
        Left = 6
        Top = 166
        Width = 33
        Height = 13
        Caption = 'Tareas'
      end
      object Label4: TLabel
        Left = 6
        Top = 381
        Width = 46
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Preventor'
      end
      object Label6: TLabel
        Left = 288
        Top = 89
        Width = 96
        Height = 13
        Caption = 'Cant. Visitas del D'#237'a'
      end
      object Label7: TLabel
        Left = 469
        Top = 89
        Width = 5
        Height = 13
        Caption = '/'
      end
      object lblDetalle: TLabel
        Left = 6
        Top = 266
        Width = 33
        Height = 13
        Caption = 'Detalle'
      end
      object Label23: TLabel
        Left = 6
        Top = 406
        Width = 56
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Tercerizado'
      end
      object Label22: TLabel
        Left = 6
        Top = 529
        Width = 49
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Falta Doc '#13#10'   Fisico'
      end
      object Label24: TLabel
        Left = 6
        Top = 429
        Width = 60
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Observaci'#243'n'
      end
      object Label32: TLabel
        Left = 8
        Top = 114
        Width = 44
        Height = 13
        Caption = 'F. Viatico'
      end
      inline fraEmpresa: TfraEmpresa
        Left = 46
        Top = 9
        Width = 533
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
        ExplicitLeft = 46
        ExplicitTop = 9
        ExplicitWidth = 533
        ExplicitHeight = 21
        DesignSize = (
          533
          21)
        inherited lbContrato: TLabel
          Left = 429
          ExplicitLeft = 426
        end
        inherited edContrato: TIntEdit
          Left = 476
          ExplicitLeft = 476
        end
        inherited cmbRSocial: TArtComboBox
          Width = 294
          DataSource = nil
          ExplicitWidth = 294
        end
      end
      inline fraEstableci: TfraEstablecimientoDomic
        Left = 0
        Top = 36
        Width = 579
        Height = 47
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitTop = 36
        ExplicitWidth = 579
        DesignSize = (
          579
          47)
        inherited lbLocalidad: TLabel
          Left = 345
          Width = 46
          ExplicitLeft = 342
          ExplicitWidth = 46
        end
        inherited lbEstableci: TLabel
          Left = 6
          Width = 30
          ExplicitLeft = 6
          ExplicitWidth = 30
        end
        inherited lbCPostal: TLabel
          Left = 508
          Width = 20
          ExplicitLeft = 505
          ExplicitWidth = 20
        end
        inherited lbDomicilio: TLabel
          Left = 6
          Width = 42
          ExplicitLeft = 6
          ExplicitWidth = 42
        end
        inherited lbProvincia: TLabel
          Left = 345
          Width = 44
          ExplicitLeft = 342
          ExplicitWidth = 44
        end
        inherited cmbDescripcion: TArtComboBox [5]
          Left = 100
          Width = 242
          DataSource = nil
          ExplicitLeft = 100
          ExplicitWidth = 242
        end
        inherited edCodigo: TIntEdit [6]
          Left = 48
          ExplicitLeft = 48
        end
        inherited edLocalidad: TEdit
          Left = 397
          ExplicitLeft = 397
        end
        inherited edCPostal: TEdit
          Left = 532
          Width = 46
          ExplicitLeft = 532
          ExplicitWidth = 46
        end
        inherited edDomicilio: TEdit
          Left = 62
          Width = 280
          ExplicitLeft = 62
          ExplicitWidth = 280
        end
        inherited edProvincia: TEdit
          Left = 397
          Width = 182
          ExplicitLeft = 397
          ExplicitWidth = 182
        end
        inherited sdqDatos: TSDQuery
          Left = 48
          Top = 5
        end
        inherited dsDatos: TDataSource
          Left = 19
          Top = 5
        end
      end
      object edFechaVisita: TDateEdit
        Left = 69
        Top = 86
        Width = 88
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
        OnChange = edFechaVisitaChange
      end
      object edHoraDesde: TDateTimePicker
        Left = 227
        Top = 86
        Width = 54
        Height = 21
        Date = 37372.000000000000000000
        Format = 'HH:mm'
        Time = 37372.000000000000000000
        DateMode = dmUpDown
        Kind = dtkTime
        TabOrder = 3
      end
      object chkTareas: TCheckListBox
        Left = 68
        Top = 168
        Width = 507
        Height = 93
        OnClickCheck = chkTareasClickCheck
        Anchors = [akLeft, akTop, akRight]
        Columns = 2
        ItemHeight = 13
        TabOrder = 8
        OnClick = chkTareasClick
      end
      inline fraPreventor: TfraCodigoDescripcion
        Left = 66
        Top = 376
        Width = 509
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 10
        ExplicitLeft = 66
        ExplicitTop = 376
        ExplicitWidth = 509
        DesignSize = (
          509
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 68
          Width = 443
          CharCase = ecUpperCase
          DataSource = nil
          ExplicitLeft = 68
          ExplicitWidth = 443
        end
        inherited edCodigo: TPatternEdit
          Width = 64
          CharCase = ecNormal
          ExplicitWidth = 64
        end
      end
      object edCantVisitas: TIntEdit
        Left = 387
        Top = 86
        Width = 77
        Height = 21
        TabOrder = 4
      end
      object edCantVisitasCargadas: TIntEdit
        Left = 479
        Top = 86
        Width = 77
        Height = 21
        TabOrder = 5
      end
      object chkVerTodas: TCheckBox
        Left = 505
        Top = 146
        Width = 69
        Height = 20
        TabStop = False
        Alignment = taLeftJustify
        Caption = 'Ver Todas'
        TabOrder = 7
        OnClick = chkVerTodasClick
      end
      object chkDetalleMotivos: TCheckListBox
        Left = 67
        Top = 265
        Width = 508
        Height = 109
        OnClickCheck = chkDetalleMotivosClickCheck
        Anchors = [akLeft, akTop, akRight]
        Columns = 2
        ItemHeight = 13
        TabOrder = 9
      end
      inline fraPrevTercerizado: TfraCodigoDescripcion
        Left = 67
        Top = 401
        Width = 508
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 11
        ExplicitLeft = 67
        ExplicitTop = 401
        ExplicitWidth = 508
        DesignSize = (
          508
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 68
          Width = 442
          CharCase = ecUpperCase
          DataSource = nil
          ExplicitLeft = 68
          ExplicitWidth = 442
        end
        inherited edCodigo: TPatternEdit
          Width = 64
          CharCase = ecNormal
          ExplicitWidth = 64
        end
      end
      object chkFaltaDocFisico: TCheckListBox
        Left = 67
        Top = 522
        Width = 508
        Height = 73
        OnClickCheck = chkFaltaDocFisicoClickCheck
        Anchors = [akLeft, akTop, akRight]
        Columns = 2
        ItemHeight = 13
        TabOrder = 13
      end
      object edObservacion: TMemo
        Left = 67
        Top = 427
        Width = 508
        Height = 92
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 12
      end
      object edFechaViatico: TDateEdit
        Left = 69
        Top = 111
        Width = 88
        Height = 21
        NumGlyphs = 2
        TabOrder = 6
        OnChange = edFechaVisitaChange
      end
      object edKms: TEdit
        Left = 69
        Top = 138
        Width = 105
        Height = 21
        TabOrder = 14
        OnKeyPress = edKmsKeyPress
      end
    end
  end
  object fpVerificaciones: TFormPanel [5]
    Left = 93
    Top = 35
    Width = 863
    Height = 447
    Caption = 'Verificaciones'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    DesignSize = (
      863
      447)
    object pnControl: TPageControl
      Left = 0
      Top = 0
      Width = 863
      Height = 408
      ActivePage = tsBasica
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tsAccidente: TTabSheet
        Caption = 'Accidente'
        object PageControl1: TPageControl
          Left = 611
          Top = 52
          Width = 244
          Height = 328
          ActivePage = TabSheet1
          Align = alRight
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = 'Visitas'
            ImageIndex = 1
            object CoolBar1: TCoolBar
              Left = 0
              Top = 0
              Width = 236
              Height = 29
              Bands = <
                item
                  Control = ToolBar1
                  ImageIndex = -1
                  MinHeight = 27
                  Width = 230
                end>
              object ToolBar1: TToolBar
                Left = 9
                Top = 0
                Width = 223
                Height = 27
                BorderWidth = 1
                Caption = 'ToolBar'
                HotImages = frmPrincipal.ilColor
                Images = frmPrincipal.ilByN
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                object tbNuevoAccidentes: TToolButton
                  Left = 0
                  Top = 0
                  Hint = 'Nuevo (Ctrl+N)'
                  ImageIndex = 6
                  OnClick = tbNuevoAccidentesClick
                end
                object tbModificarSegAccidente: TToolButton
                  Left = 23
                  Top = 0
                  Hint = 'Modificar (Ctrl+M)'
                  Caption = 'tbPPEModificar'
                  ImageIndex = 7
                  OnClick = tbModificarSegAccidenteClick
                end
                object tbBajaSegAccidente: TToolButton
                  Left = 46
                  Top = 0
                  Hint = 'Eliminar (Cltr+Del)'
                  Enabled = False
                  ImageIndex = 8
                  OnClick = tbBajaSegAccidenteClick
                end
              end
            end
            object RxDBGrid1: TRxDBGrid
              Left = 0
              Top = 29
              Width = 236
              Height = 271
              Align = alClient
              DataSource = dsSeguimientoAccidentes
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              IniStorage = FormStorage
              RowColor2 = 16776176
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TIPO_VISITA'
                  Title.Caption = 'Tipo'
                  Width = 91
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'SV_FECHA'
                  Title.Alignment = taCenter
                  Title.Caption = 'Fecha'
                  Width = 66
                  Visible = True
                end>
            end
            object fpSegAccidente: TFormPanel
              Left = 13
              Top = 72
              Width = 177
              Height = 106
              Caption = 'Visita'
              FormWidth = 0
              FormHeigth = 0
              FormLeft = 0
              FormTop = 0
              BorderIcons = []
              Position = poScreenCenter
              ActiveControl = cbTipoAccidentes
              Constraints.MaxHeight = 106
              Constraints.MaxWidth = 177
              Constraints.MinHeight = 106
              Constraints.MinWidth = 177
              DesignSize = (
                177
                106)
              object Bevel1: TBevel
                Left = 4
                Top = 71
                Width = 169
                Height = 3
                Anchors = [akLeft, akRight, akBottom]
                Shape = bsTopLine
              end
              object Label15: TLabel
                Left = 9
                Top = 44
                Width = 30
                Height = 13
                Caption = 'Fecha'
              end
              object Label16: TLabel
                Left = 9
                Top = 13
                Width = 21
                Height = 13
                Caption = 'Tipo'
              end
              object btnAceptarSegAccidente: TButton
                Left = 15
                Top = 77
                Width = 75
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = '&Aceptar'
                TabOrder = 2
                OnClick = btnAceptarSegAccidenteClick
              end
              object btnCancelarSegAccidente: TButton
                Left = 96
                Top = 77
                Width = 75
                Height = 25
                Anchors = [akRight, akBottom]
                Cancel = True
                Caption = '&Cancelar'
                ModalResult = 2
                TabOrder = 3
              end
              object edFechaSegAccidente: TDateComboBox
                Left = 47
                Top = 40
                Width = 88
                Height = 21
                TabOrder = 1
              end
              object cbTipoAccidentes: TExComboBox
                Left = 47
                Top = 10
                Width = 104
                Height = 22
                Style = csOwnerDrawFixed
                TabOrder = 0
                Items.Strings = (
                  'V=Visita'
                  'C=Cumplimiento'
                  'I=Incumplimiento')
                ItemIndex = -1
                Options = []
                ValueWidth = 64
              end
            end
          end
        end
        object RxDBGrid2: TRxDBGrid
          Left = 0
          Top = 52
          Width = 611
          Height = 328
          Align = alClient
          DataSource = dsMedidasAccidente
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FormStorage
          RowColor2 = 16776176
          Columns = <
            item
              Expanded = False
              FieldName = 'siniestro'
              Title.Caption = 'Siniestro'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MC_MEDIDA'
              Title.Caption = 'N'#250'mero'
              Width = 47
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'MC_FECHAEJECUCION'
              Title.Alignment = taCenter
              Title.Caption = 'F. Ejecuci'#243'n'
              Width = 74
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'MC_FECHAVERIFICACION'
              Title.Alignment = taCenter
              Title.Caption = 'F. Verificaci'#243'n'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MC_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 282
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 855
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 2
          object lbCUIT: TLabel
            Left = 8
            Top = 4
            Width = 24
            Height = 13
            Caption = 'CUIL'
          end
          inline fraTrabajadorAccidente: TfraTrabajadorSiniestro_D5
            Left = 36
            Top = 0
            Width = 781
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 36
            ExplicitWidth = 781
            ExplicitHeight = 21
            DesignSize = (
              781
              21)
            inherited lbSiniestro: TLabel
              Left = 636
              ExplicitLeft = 512
            end
            inherited mskCUIL: TMaskEdit
              Left = 8
              ExplicitLeft = 8
            end
            inherited cmbNombre: TArtComboBox
              Left = 92
              Width = 543
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EX_SINIESTRO'
                  Title.Caption = 'Siniestro'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EX_RECAIDA'
                  Title.Caption = 'Recaida'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMBRE'
                  Title.Caption = 'Apellido y Nombre'
                  Width = 220
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONTRATO'
                  Title.Caption = 'Contrato'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'EM_CUIT'
                  Title.Caption = 'CUIT'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'EM_NOMBRE'
                  Title.Caption = 'Raz'#243'n Social'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'ES_NROESTABLECI'
                  Title.Caption = 'Estab.'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'ES_NOMBRE'
                  Title.Caption = 'Nombre'
                  Width = 180
                  Visible = True
                end>
              DataSource = nil
              ExplicitLeft = 92
              ExplicitWidth = 543
            end
            inherited edSiniestro: TSinEdit
              Left = 680
              Width = 82
              ViewStyle = [etSiniestro, etOrden]
              ExplicitLeft = 680
              ExplicitWidth = 82
            end
            inherited sdqDatos: TSDQuery
              Left = 24
              Top = 65356
            end
            inherited dsDatos: TDataSource
              Left = 52
              Top = 65356
            end
          end
        end
        object ToolBar5: TToolBar
          Left = 0
          Top = 25
          Width = 855
          Height = 27
          BorderWidth = 1
          Caption = 'ToolBar'
          Color = clBtnFace
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentColor = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          object tbRefrescarAccidente: TToolButton
            Left = 0
            Top = 0
            Hint = 'Refrescar'
            Caption = 'tbRefrescarAccidente'
            ImageIndex = 0
            OnClick = tbRefrescarAccidenteClick
          end
          object tbLimpiarAccidente: TToolButton
            Left = 23
            Top = 0
            Hint = 'Limpiar Filtros'
            ImageIndex = 1
            OnClick = tbLimpiarAccidenteClick
          end
        end
      end
      object tsEnfermedad: TTabSheet
        Caption = 'Enfermedades'
        ImageIndex = 1
        object pcCausasVisitas: TPageControl
          Left = 611
          Top = 52
          Width = 244
          Height = 328
          ActivePage = tsSeguimientoVisitas
          Align = alRight
          TabOrder = 0
          object tsSeguimientoVisitas: TTabSheet
            Caption = 'Visitas'
            ImageIndex = 1
            object CoolBar5: TCoolBar
              Left = 0
              Top = 0
              Width = 236
              Height = 29
              Bands = <
                item
                  Control = tBarPSV_SEGUIMIENTOVISITA
                  ImageIndex = -1
                  MinHeight = 27
                  Width = 230
                end>
              object tBarPSV_SEGUIMIENTOVISITA: TToolBar
                Left = 9
                Top = 0
                Width = 223
                Height = 27
                BorderWidth = 1
                Caption = 'ToolBar'
                HotImages = frmPrincipal.ilColor
                Images = frmPrincipal.ilByN
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                object tbNuevoSegEnfermedades: TToolButton
                  Left = 0
                  Top = 0
                  Hint = 'Nuevo (Ctrl+N)'
                  ImageIndex = 6
                  OnClick = tbNuevoSegEnfermedadesClick
                end
                object tbModificarSegEnfermedades: TToolButton
                  Left = 23
                  Top = 0
                  Hint = 'Modificar (Ctrl+M)'
                  Caption = 'tbPPEModificar'
                  ImageIndex = 7
                  OnClick = tbModificarSegEnfermedadesClick
                end
                object tbBajaSegEnfermedades: TToolButton
                  Left = 46
                  Top = 0
                  Hint = 'Eliminar (Cltr+Del)'
                  Enabled = False
                  ImageIndex = 8
                  OnClick = tbBajaSegEnfermedadesClick
                end
              end
            end
            object dbgPSV_SEGUIMIENTOVISITA: TRxDBGrid
              Left = 0
              Top = 29
              Width = 236
              Height = 271
              Align = alClient
              DataSource = dsSeguimientoEnfermedades
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              IniStorage = FormStorage
              RowColor2 = 16776176
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TIPO_VISITA'
                  Title.Caption = 'Tipo'
                  Width = 91
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'SV_FECHA'
                  Title.Alignment = taCenter
                  Title.Caption = 'Fecha'
                  Width = 66
                  Visible = True
                end>
            end
            object fpSeguimientoEnfermedades: TFormPanel
              Left = 13
              Top = 72
              Width = 177
              Height = 106
              Caption = 'Visita'
              FormWidth = 0
              FormHeigth = 0
              FormLeft = 0
              FormTop = 0
              BorderIcons = []
              Position = poScreenCenter
              ActiveControl = cbTipoEnfermedades
              Constraints.MaxHeight = 106
              Constraints.MaxWidth = 177
              Constraints.MinHeight = 106
              Constraints.MinWidth = 177
              DesignSize = (
                177
                106)
              object Bevel12: TBevel
                Left = 4
                Top = 71
                Width = 169
                Height = 3
                Anchors = [akLeft, akRight, akBottom]
                Shape = bsTopLine
              end
              object Label70: TLabel
                Left = 9
                Top = 44
                Width = 30
                Height = 13
                Caption = 'Fecha'
              end
              object Label71: TLabel
                Left = 9
                Top = 13
                Width = 21
                Height = 13
                Caption = 'Tipo'
              end
              object btAceptarSegEnfermedades: TButton
                Left = 15
                Top = 78
                Width = 75
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = '&Aceptar'
                TabOrder = 2
                OnClick = btAceptarSegEnfermedadesClick
              end
              object btCancelarSegEnfermedades: TButton
                Left = 96
                Top = 77
                Width = 75
                Height = 25
                Anchors = [akRight, akBottom]
                Cancel = True
                Caption = '&Cancelar'
                ModalResult = 2
                TabOrder = 3
              end
              object edFechaSegEnfermedades: TDateComboBox
                Left = 47
                Top = 40
                Width = 88
                Height = 21
                TabOrder = 1
              end
              object cbTipoEnfermedades: TExComboBox
                Left = 47
                Top = 10
                Width = 104
                Height = 22
                Style = csOwnerDrawFixed
                TabOrder = 0
                Items.Strings = (
                  'V=Visita'
                  'C=Cumplimiento'
                  'I=Incumplimiento')
                ItemIndex = -1
                Options = []
                ValueWidth = 64
              end
            end
          end
        end
        object dbgPMC_MEDIDACORRECTIVA: TRxDBGrid
          Left = 0
          Top = 52
          Width = 611
          Height = 328
          Align = alClient
          DataSource = dsMedidasEnfermedades
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FormStorage
          RowColor2 = 16776176
          Columns = <
            item
              Expanded = False
              FieldName = 'siniestro'
              Title.Caption = 'Siniestro'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MC_MEDIDA'
              Title.Caption = 'N'#250'mero'
              Width = 47
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'MC_FECHAEJECUCION'
              Title.Alignment = taCenter
              Title.Caption = 'F. Ejecuci'#243'n'
              Width = 74
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'MC_FECHAVERIFICACION'
              Title.Alignment = taCenter
              Title.Caption = 'F. Verificaci'#243'n'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MC_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 282
              Visible = True
            end>
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 855
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 2
          object Label34: TLabel
            Left = 8
            Top = 4
            Width = 24
            Height = 13
            Caption = 'CUIL'
          end
          inline fraTrabajadorEnfermedades: TfraTrabajadorSiniestro_D5
            Left = 36
            Top = 0
            Width = 781
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 36
            ExplicitWidth = 781
            ExplicitHeight = 21
            DesignSize = (
              781
              21)
            inherited lbSiniestro: TLabel
              Left = 636
              ExplicitLeft = 512
            end
            inherited mskCUIL: TMaskEdit
              Left = 8
              ExplicitLeft = 8
            end
            inherited cmbNombre: TArtComboBox
              Left = 90
              Width = 543
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EX_SINIESTRO'
                  Title.Caption = 'Siniestro'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EX_RECAIDA'
                  Title.Caption = 'Recaida'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMBRE'
                  Title.Caption = 'Apellido y Nombre'
                  Width = 220
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONTRATO'
                  Title.Caption = 'Contrato'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'EM_CUIT'
                  Title.Caption = 'CUIT'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'EM_NOMBRE'
                  Title.Caption = 'Raz'#243'n Social'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'ES_NROESTABLECI'
                  Title.Caption = 'Estab.'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'ES_NOMBRE'
                  Title.Caption = 'Nombre'
                  Width = 180
                  Visible = True
                end>
              DataSource = nil
              ExplicitLeft = 90
              ExplicitWidth = 543
            end
            inherited edSiniestro: TSinEdit
              Left = 680
              Width = 82
              ViewStyle = [etSiniestro, etOrden]
              ExplicitLeft = 680
              ExplicitWidth = 82
            end
            inherited sdqDatos: TSDQuery
              Left = 24
              Top = 65356
            end
            inherited dsDatos: TDataSource
              Left = 52
              Top = 65356
            end
          end
        end
        object ToolBar6: TToolBar
          Left = 0
          Top = 25
          Width = 855
          Height = 27
          BorderWidth = 1
          Caption = 'ToolBar'
          Color = clBtnFace
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentColor = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          object tbRefrescarEnfermedades: TToolButton
            Left = 0
            Top = 0
            Hint = 'Refrescar'
            Caption = 'tbRefrescarAccidente'
            ImageIndex = 0
            OnClick = tbRefrescarEnfermedadesClick
          end
          object tbLimpiarEnfermedades: TToolButton
            Left = 23
            Top = 0
            Hint = 'Limpiar Filtros'
            ImageIndex = 1
            OnClick = tbLimpiarEnfermedadesClick
          end
        end
      end
      object tsPRS: TTabSheet
        Caption = 'PRS'
        ImageIndex = 2
        object dbgRecomendaciones: TArtDBGrid
          Left = 0
          Top = 0
          Width = 566
          Height = 380
          Align = alClient
          DataSource = dsRecomendaciones
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          MultiSelect = True
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'RE_RECOMENDACION'
              Title.Caption = 'Nro.'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RE_DESCRIPCION1'
              Title.Caption = 'Recomendaci'#243'n'
              Width = 260
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RE_RESPONSABLE'
              Title.Caption = 'Responsable'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RE_CUMPLIMIENTO'
              Title.Caption = 'Cumplimiento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RE_SEGUIMIENTO'
              Title.Caption = 'Seguimiento'
              Visible = True
            end>
        end
        object prItemsRec: TPageControl
          Left = 566
          Top = 0
          Width = 289
          Height = 380
          ActivePage = tsVisitas
          Align = alRight
          TabOrder = 1
          object tsVisitas: TTabSheet
            Caption = 'Visitas'
            ImageIndex = 1
            object pnlVisitas: TPanel
              Left = 0
              Top = 0
              Width = 281
              Height = 352
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object CoolBar3: TCoolBar
                Left = 0
                Top = 0
                Width = 281
                Height = 30
                Bands = <
                  item
                    Control = tbVisitas
                    ImageIndex = -1
                    MinHeight = 26
                    Width = 275
                  end>
                object tbVisitas: TToolBar
                  Left = 9
                  Top = 0
                  Width = 268
                  Height = 26
                  BorderWidth = 1
                  Caption = 'tBarDiagEstableci'
                  HotImages = frmPrincipal.ilColor
                  Images = frmPrincipal.ilByN
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  object tbVisAgregar: TToolButton
                    Left = 0
                    Top = 0
                    Hint = 'Nuevo (Ctrl+V)'
                    ImageIndex = 6
                    OnClick = tbVisAgregarClick
                  end
                  object tbVisQuitar: TToolButton
                    Left = 23
                    Top = 0
                    Hint = 'Eliminar (Ctrl+E)'
                    ImageIndex = 8
                    OnClick = tbVisQuitarClick
                  end
                end
              end
              object dbgVisitas: TArtDBGrid
                Left = 0
                Top = 30
                Width = 281
                Height = 322
                Align = alClient
                DataSource = dsVisitas
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                FooterBand = False
                TitleHeight = 17
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'TIPO'
                    Title.Caption = 'Tipo'
                    Width = 172
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RV_FECHA'
                    Title.Caption = 'Fecha'
                    Width = 72
                    Visible = True
                  end>
              end
              object fpVisitas: TFormPanel
                Left = 16
                Top = 141
                Width = 281
                Height = 97
                Caption = 'Visitas de Seguimiento de Recomendaciones'
                FormWidth = 0
                FormHeigth = 0
                FormLeft = 0
                FormTop = 0
                Position = poScreenCenter
                Constraints.MaxHeight = 97
                Constraints.MinHeight = 97
                Constraints.MinWidth = 200
                DesignSize = (
                  281
                  97)
                object Label12: TLabel
                  Left = 8
                  Top = 40
                  Width = 30
                  Height = 13
                  Caption = 'Fecha'
                end
                object Bevel7: TBevel
                  Left = 4
                  Top = 60
                  Width = 273
                  Height = 5
                  Anchors = [akLeft, akTop, akRight]
                  Shape = bsTopLine
                end
                object Label13: TLabel
                  Left = 8
                  Top = 12
                  Width = 21
                  Height = 13
                  Caption = 'Tipo'
                end
                object btnVisAceptar: TButton
                  Left = 122
                  Top = 68
                  Width = 75
                  Height = 25
                  Anchors = [akRight, akBottom]
                  Caption = '&Aceptar'
                  TabOrder = 2
                  OnClick = btnVisAceptarClick
                end
                object btnVisCancelar: TButton
                  Left = 202
                  Top = 68
                  Width = 75
                  Height = 25
                  Anchors = [akRight, akBottom]
                  Cancel = True
                  Caption = '&Cancelar'
                  ModalResult = 2
                  TabOrder = 3
                end
                object cmbVisTipo: TExComboBox
                  Left = 132
                  Top = 8
                  Width = 145
                  Height = 22
                  Style = csOwnerDrawFixed
                  TabOrder = 0
                  Items.Strings = (
                    'C=Cumplimiento'
                    'I=Incumplimiento'
                    ' ')
                  ItemIndex = -1
                  Options = []
                  ValueWidth = 64
                end
                object edVisFecha: TDateEdit
                  Left = 132
                  Top = 34
                  Width = 94
                  Height = 21
                  NumGlyphs = 2
                  TabOrder = 1
                end
              end
            end
          end
        end
      end
      object tsPAL: TTabSheet
        Caption = 'PAL'
        ImageIndex = 3
        object Panel1: TPanel
          Left = 570
          Top = 0
          Width = 285
          Height = 380
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object CoolBar2: TCoolBar
            Left = 0
            Top = 0
            Width = 285
            Height = 30
            Bands = <
              item
                Control = ToolBar2
                ImageIndex = -1
                MinHeight = 26
                Width = 279
              end>
            object ToolBar2: TToolBar
              Left = 9
              Top = 0
              Width = 272
              Height = 26
              BorderWidth = 1
              HotImages = frmPrincipal.ilColor
              Images = frmPrincipal.ilByN
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              object tbNuevoPAL: TToolButton
                Left = 0
                Top = 0
                Hint = 'Nuevo'
                ImageIndex = 6
                OnClick = tbNuevoPALClick
              end
              object tbEliminarPAL: TToolButton
                Left = 23
                Top = 0
                Hint = 'Eliminar '
                ImageIndex = 8
                OnClick = tbEliminarPALClick
              end
              object ToolButton13: TToolButton
                Left = 46
                Top = 0
                Width = 8
                Caption = 'ToolButton5'
                ImageIndex = 5
                Style = tbsSeparator
              end
              object tbVisOrdenar: TToolButton
                Left = 54
                Top = 0
                Caption = 'tbVisOrdenar'
                ImageIndex = 2
              end
            end
          end
          object ArtDBGrid1: TArtDBGrid
            Left = 0
            Top = 30
            Width = 285
            Height = 350
            Align = alClient
            DataSource = dsVisitasPal
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            FooterBand = False
            TitleHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'TIPO'
                Title.Caption = 'Tipo'
                Width = 119
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ps_fechavisita'
                Title.Caption = 'Fecha'
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PS_FECHACOMPROMETIDA'
                Title.Caption = 'Fecha Comprometida'
                Width = 110
                Visible = True
              end>
          end
          object fpVisita: TFormPanel
            Left = 4
            Top = 138
            Width = 270
            Height = 124
            Caption = 'Visitas de Seguimiento de Recomend.'
            FormWidth = 0
            FormHeigth = 0
            FormLeft = 0
            FormTop = 0
            Position = poScreenCenter
            Constraints.MaxHeight = 130
            Constraints.MinHeight = 97
            Constraints.MinWidth = 200
            DesignSize = (
              270
              124)
            object Label17: TLabel
              Left = 8
              Top = 40
              Width = 87
              Height = 13
              Caption = 'Fecha de la Visita:'
            end
            object Bevel2: TBevel
              Left = 4
              Top = 88
              Width = 262
              Height = 2
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label18: TLabel
              Left = 8
              Top = 12
              Width = 24
              Height = 13
              Caption = 'Tipo:'
            end
            object lbFechaComprometida: TLabel
              Left = 8
              Top = 64
              Width = 103
              Height = 13
              Caption = 'Fecha Comprometida:'
              Visible = False
            end
            object btnAceptarPAL: TButton
              Left = 111
              Top = 94
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = '&Aceptar'
              TabOrder = 2
              OnClick = btnAceptarPALClick
            end
            object btnCancelarPAL: TButton
              Left = 191
              Top = 94
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Cancel = True
              Caption = '&Cancelar'
              ModalResult = 2
              TabOrder = 3
            end
            object edFechaVisitaPal: TDateComboBox
              Left = 126
              Top = 36
              Width = 98
              Height = 21
              MinDate = 36526.000000000000000000
              AutoExit = True
              TabOrder = 1
            end
            object cmbTipoCumplimientoPAL: TExComboBox
              Left = 126
              Top = 8
              Width = 139
              Height = 22
              Style = csOwnerDrawFixed
              TabOrder = 0
              Text = 'C=Cumplimiento'
              OnChange = cmbTipoCumplimientoPALChange
              Items.Strings = (
                'C=Cumplimiento'
                'I=Incumplimiento')
              ItemIndex = 0
              Options = []
              ValueWidth = 64
            end
            object edFechaComprometidaPal: TDateComboBox
              Left = 126
              Top = 60
              Width = 98
              Height = 21
              MinDate = 36526.000000000000000000
              AutoExit = True
              TabOrder = 4
              Visible = False
            end
          end
        end
        object dbgPAL: TArtDBGrid
          Left = 0
          Top = 0
          Width = 570
          Height = 380
          Align = alClient
          DataSource = dsPAL
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          MultiSelect = True
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'tipoanexo'
              Title.Caption = 'Anexo'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PA_ITEMANEXO'
              Title.Caption = 'Nro. Item'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescItem'
              Title.Caption = 'Desc.Item'
              Width = 255
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PA_CUMPLIMIENTO'
              Title.Alignment = taCenter
              Title.Caption = 'F.Cumplimiento'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PA_SEGUIMIENTO'
              Title.Alignment = taCenter
              Title.Caption = 'F.Seguimiento'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PA_TIPO'
              Title.Caption = 'Tipo'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PA_OPERATIVO'
              Title.Caption = 'Operativo'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PA_FECHACUMPLIMIENTOPOST'
              Title.Caption = 'Fecha Cumplimiento Posterior'
              Width = 181
              Visible = True
            end>
        end
      end
      object ts463: TTabSheet
        Caption = 'Verosimilitud'
        ImageIndex = 4
        object Panel2: TPanel
          Left = 570
          Top = 0
          Width = 285
          Height = 380
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object CoolBar4: TCoolBar
            Left = 0
            Top = 0
            Width = 285
            Height = 30
            Bands = <
              item
                Control = ToolBar3
                ImageIndex = -1
                MinHeight = 26
                Width = 279
              end>
            object ToolBar3: TToolBar
              Left = 9
              Top = 0
              Width = 272
              Height = 26
              BorderWidth = 1
              HotImages = frmPrincipal.ilColor
              Images = frmPrincipal.ilByN
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              object tbNuevoRes463: TToolButton
                Left = 0
                Top = 0
                Hint = 'Nuevo'
                ImageIndex = 6
                OnClick = tbNuevoRes463Click
              end
              object tbEliminarRes463: TToolButton
                Left = 23
                Top = 0
                Hint = 'Eliminar (Ctrl+E)'
                ImageIndex = 8
                OnClick = tbEliminarRes463Click
              end
              object ToolButton16: TToolButton
                Left = 46
                Top = 0
                Width = 8
                Caption = 'ToolButton5'
                ImageIndex = 5
                Style = tbsSeparator
              end
            end
          end
          object ArtDBGrid2: TArtDBGrid
            Left = 0
            Top = 30
            Width = 285
            Height = 350
            Align = alClient
            DataSource = dsSeguimientoRes463
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            FooterBand = False
            TitleHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'RT_CUMPLE'
                Title.Caption = 'Cumple'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RT_FECHASEGUIMIENTO'
                Title.Caption = 'Fecha Seguimiento'
                Width = 110
                Visible = True
              end>
          end
          object fpSeguimiento463: TFormPanel
            Left = 6
            Top = 166
            Width = 241
            Height = 97
            Caption = 'Seguimiento'
            FormWidth = 0
            FormHeigth = 0
            FormLeft = 0
            FormTop = 0
            Position = poScreenCenter
            Constraints.MaxHeight = 97
            Constraints.MinHeight = 97
            Constraints.MinWidth = 200
            DesignSize = (
              241
              97)
            object Label20: TLabel
              Left = 8
              Top = 40
              Width = 30
              Height = 13
              Caption = 'Fecha'
            end
            object Bevel3: TBevel
              Left = 4
              Top = 60
              Width = 233
              Height = 5
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label21: TLabel
              Left = 8
              Top = 12
              Width = 65
              Height = 13
              Caption = 'Cumplimiento:'
            end
            object btnAceptarSeg463: TButton
              Left = 82
              Top = 68
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = '&Aceptar'
              TabOrder = 2
              OnClick = btnAceptarSeg463Click
            end
            object btnCancelarSeg463: TButton
              Left = 162
              Top = 68
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Cancel = True
              Caption = '&Cancelar'
              ModalResult = 2
              TabOrder = 3
            end
            object cmbSegTipo463: TExComboBox
              Left = 90
              Top = 8
              Width = 145
              Height = 22
              Style = csOwnerDrawFixed
              TabOrder = 0
              Items.Strings = (
                'S=SI'
                'N=NO')
              ItemIndex = -1
              Options = []
              ValueWidth = 64
            end
            object edSegFecha463: TDateEdit
              Left = 142
              Top = 34
              Width = 94
              Height = 21
              NumGlyphs = 2
              TabOrder = 1
            end
          end
        end
        object ArtDBGrid3: TArtDBGrid
          Left = 0
          Top = 0
          Width = 570
          Height = 380
          Align = alClient
          DataSource = dsRes463
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          MultiSelect = True
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'IA_NRODESCRIPCION'
              Title.Caption = 'Item'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IA_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IL_FECHAREGULARIZACION'
              Title.Caption = 'Fecha Regularizaci'#243'n'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IL_FECHAVERIFICACION'
              Title.Caption = 'Fecha Verificaci'#243'n'
              Width = 103
              Visible = True
            end>
        end
      end
      object tsBasica: TTabSheet
        Caption = 'Basica'
        ImageIndex = 5
        DesignSize = (
          855
          380)
        object Label43: TLabel
          Left = 1
          Top = 10
          Width = 29
          Height = 13
          Caption = 'Grupo'
        end
        object Label45: TLabel
          Left = 1
          Top = 42
          Width = 34
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Rubros'
        end
        inline fraGrupoDenuncia: TfraCodigoDescripcion
          Left = 64
          Top = 6
          Width = 486
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 64
          ExplicitTop = 6
          ExplicitWidth = 486
          DesignSize = (
            486
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 421
            CharCase = ecUpperCase
            ExplicitWidth = 421
          end
          inherited edCodigo: TPatternEdit
            Width = 59
            CharCase = ecNormal
            ExplicitWidth = 59
          end
        end
        object chkRubros: TCheckListBox
          Left = 65
          Top = 35
          Width = 746
          Height = 318
          OnClickCheck = chkFaltaDocFisicoClickCheck
          Anchors = [akLeft, akTop, akRight]
          Columns = 1
          ItemHeight = 13
          TabOrder = 1
        end
      end
    end
    object btnCerrarVerificacion: TButton
      Left = 782
      Top = 413
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = btnCerrarVerificacionClick
    end
  end
  object fpViaticos: TFormPanel [6]
    Left = 801
    Top = -166
    Width = 584
    Height = 336
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnShow = fpAbmShow
    DesignSize = (
      584
      336)
    object Bevel4: TBevel
      Left = 4
      Top = 300
      Width = 576
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 344
      ExplicitWidth = 577
    end
    object Label25: TLabel
      Left = 7
      Top = 13
      Width = 46
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Preventor'
    end
    object Label26: TLabel
      Left = 5
      Top = 38
      Width = 64
      Height = 13
      Caption = 'Fecha Desde'
    end
    object Label27: TLabel
      Left = 203
      Top = 38
      Width = 61
      Height = 13
      Caption = 'Fecha Hasta'
    end
    object Label28: TLabel
      Left = 8
      Top = 65
      Width = 20
      Height = 13
      Caption = 'Kms'
    end
    object Label29: TLabel
      Left = 8
      Top = 122
      Width = 57
      Height = 13
      Caption = 'Monto Total'
    end
    object Label30: TLabel
      Left = 8
      Top = 181
      Width = 60
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Observaci'#243'n'
    end
    object Label33: TLabel
      Left = 207
      Top = 89
      Width = 61
      Height = 13
      Caption = 'Otros Gastos'
    end
    object Label10: TLabel
      Left = 408
      Top = 65
      Width = 32
      Height = 13
      Caption = 'Peajes'
    end
    object Label36: TLabel
      Left = 410
      Top = 87
      Width = 36
      Height = 13
      Caption = 'Hoteles'
    end
    object Label37: TLabel
      Left = 9
      Top = 89
      Width = 78
      Height = 13
      Caption = 'Estacionamiento'
    end
    object Label40: TLabel
      Left = 209
      Top = 65
      Width = 63
      Height = 13
      Caption = 'Kms Regreso'
    end
    object Label41: TLabel
      Left = 5
      Top = 150
      Width = 119
      Height = 13
      Caption = 'Fecha Recepci'#243'n viatico'
    end
    object Label42: TLabel
      Left = 227
      Top = 150
      Width = 130
      Height = 13
      Caption = 'Fecha Entrega Coordinador'
    end
    object btnAceptarViatico: TButton
      Left = 426
      Top = 306
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 13
      OnClick = btnAceptarViaticoClick
    end
    object btnCancelarViatico: TButton
      Left = 504
      Top = 306
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 14
    end
    inline fraPreventorViatico: TfraCodigoDescripcion
      Left = 91
      Top = 8
      Width = 484
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 91
      ExplicitTop = 8
      ExplicitWidth = 484
      DesignSize = (
        484
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 68
        Width = 417
        CharCase = ecUpperCase
        DataSource = nil
        ExplicitLeft = 68
        ExplicitWidth = 417
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
        ExplicitWidth = 64
      end
    end
    object edFechaDesdeViatico: TDateEdit
      Left = 92
      Top = 35
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnChange = edFechaVisitaChange
    end
    object edFechaHastaViatico: TDateEdit
      Left = 268
      Top = 35
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
      OnChange = edFechaVisitaChange
    end
    object edObservacionViatico: TMemo
      Left = 91
      Top = 177
      Width = 485
      Height = 121
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 12
    end
    object edMontoTotalViaticos: TCurrencyEdit
      Left = 92
      Top = 117
      Width = 121
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      TabOrder = 9
    end
    object edOtrosGastos: TCurrencyEdit
      Left = 280
      Top = 84
      Width = 121
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      TabOrder = 7
      OnChange = edKmsViaticosChange
    end
    object edPeaje: TCurrencyEdit
      Left = 454
      Top = 60
      Width = 121
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      TabOrder = 5
      OnChange = edKmsViaticosChange
    end
    object edEstacionamiento: TCurrencyEdit
      Left = 93
      Top = 86
      Width = 107
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      TabOrder = 6
      OnChange = edKmsViaticosChange
    end
    object edHoteles: TCurrencyEdit
      Left = 454
      Top = 85
      Width = 121
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      TabOrder = 8
      OnChange = edKmsViaticosChange
    end
    object edKmsViatico: TEdit
      Left = 93
      Top = 62
      Width = 107
      Height = 21
      TabOrder = 3
      OnChange = edKmsViaticosChange
      OnKeyPress = edKmsViaticoKeyPress
    end
    object edKmRegreso: TEdit
      Left = 280
      Top = 62
      Width = 121
      Height = 21
      TabOrder = 4
      OnChange = edKmsViaticosChange
      OnKeyPress = edKmsViaticoKeyPress
    end
    object edFechaRecepcionViatico: TDateEdit
      Left = 131
      Top = 147
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 10
      OnChange = edFechaVisitaChange
    end
    object edFechaEntregaCoordinador: TDateEdit
      Left = 366
      Top = 147
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 11
      OnChange = edFechaVisitaChange
    end
  end
  object gbDetalleTareas: TJvgGroupBox [7]
    Left = 924
    Top = 205
    Width = 171
    Height = 468
    Align = alRight
    Caption = '  Detalle Tareas'
    TabOrder = 6
    Border.Inner = bvNone
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvRaised
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = 10461087
    CaptionGradient.ToColor = clSilver
    CaptionGradient.Active = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clHighlightText
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBtnShadow
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    TransparentCaption = True
    GroupIndex = 1
    OnExpanded = gbDetalleTareasExpanded
    DesignSize = (
      171
      468)
    FullHeight = 127
    object Label35: TLabel
      Left = 6
      Top = 453
      Width = 64
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'No Realizado'
      Color = 10021355
      ParentColor = False
      ExplicitTop = 284
    end
    object gridDetalleTareas: TArtDBGrid
      Left = 2
      Top = 16
      Width = 167
      Height = 199
      Align = alClient
      DataSource = dsDetalleTareas
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      IniStorage = FormStorage
      OnGetCellParams = dbgDetalleTareasGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'TA_DESCRIPCION'
          Title.Caption = 'Tarea'
          Width = 150
          Visible = True
        end>
    end
    object gbSubDetalleTareas: TArtDBGrid
      Left = 2
      Top = 215
      Width = 167
      Height = 251
      Align = alBottom
      DataSource = dsTareaSubDetalle
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'mo_descripcion'
          Title.Caption = 'Detalle'
          Width = 150
          Visible = True
        end>
    end
  end
  inherited sdqConsulta: TSDQuery
    BeforeClose = sdqConsultaBeforeClose
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      ''
      
        'SELECT em_cuit, em_nombre, co_contrato, es_nroestableci, es_nomb' +
        're,'
      
        '       vp_fechavisita, vd_cantvisitas, vp_kms, it_nombre, vp_fec' +
        'haalta,'
      
        '       vp_usualta, vp_fechamodif, vp_usumodif, vp_fechabaja, vp_' +
        'usubaja,'
      
        '       vp_aprobado, vp_usuaprobado, vp_fechaaprobado, vp_idempre' +
        'sa,'
      
        '       vp_establecimiento, vp_idpreventor, vp_observaciones,vp_o' +
        'rigen,'
      
        '       vp_idpreventorconsultora, vp_id, vp_idviatico, vp_fechavi' +
        'atico,'
      '       (SELECT COUNT (*)'
      '          FROM hys.hvp_visitapreventor hvp2'
      '         WHERE hvp2.vp_fechabaja IS NULL'
      
        '           AND TRUNC (hvp2.vp_fechavisita) = TRUNC (hvp.vp_fecha' +
        'visita)'
      
        '           AND hvp2.vp_idpreventor = hvp.vp_idpreventor) cantvis' +
        'itas,'
      '       DECODE (art.afiliacion.is_empresavip (co_contrato),'
      '               '#39'S'#39', '#39'VIP'#39','
      '               '#39'N'#39', NULL'
      '              ) empresavip,'
      
        '       DECODE (vp_origen, '#39'P'#39', '#39'Preventor'#39', '#39'A'#39', '#39'Actuaciones'#39') ' +
        'origencarga'
      '  FROM art.pit_firmantes pit,'
      '       afi.aes_establecimiento aes,'
      '       afi.aco_contrato aco,'
      '       afi.aem_empresa aem,'
      '       hys.hvd_visitadeclarada hvd,'
      '       hys.hvp_visitapreventor hvp'
      ' WHERE em_id = vp_idempresa'
      '   AND em_id = co_idempresa'
      '   AND es_contrato = co_contrato'
      '   AND co_contrato = art.get_vultcontrato (em_cuit)'
      '   AND es_nroestableci = vp_establecimiento'
      '   AND TRUNC (vp_fechavisita) = vd_fechavisita(+)'
      '   AND vp_idpreventor = vd_idpreventor(+)'
      '   AND it_id = vp_idpreventor')
    object sdqConsultaSELECTED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      Calculated = True
    end
    object sdqConsultaEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 200
    end
    object sdqConsultaCO_CONTRATO: TFloatField
      FieldName = 'CO_CONTRATO'
      Required = True
    end
    object sdqConsultaES_NROESTABLECI: TFloatField
      FieldName = 'ES_NROESTABLECI'
      Required = True
    end
    object sdqConsultaES_NOMBRE: TStringField
      FieldName = 'ES_NOMBRE'
      Required = True
      Size = 100
    end
    object sdqConsultaVP_FECHAVISITA: TDateTimeField
      FieldName = 'VP_FECHAVISITA'
      Required = True
    end
    object sdqConsultaVD_CANTVISITAS: TFloatField
      FieldName = 'VD_CANTVISITAS'
    end
    object sdqConsultaVP_KMS: TFloatField
      FieldName = 'VP_KMS'
      Required = True
    end
    object sdqConsultaIT_NOMBRE: TStringField
      FieldName = 'IT_NOMBRE'
      Required = True
      Size = 255
    end
    object sdqConsultaVP_FECHAALTA: TDateTimeField
      FieldName = 'VP_FECHAALTA'
      Required = True
    end
    object sdqConsultaVP_USUALTA: TStringField
      FieldName = 'VP_USUALTA'
      Required = True
    end
    object sdqConsultaVP_FECHAMODIF: TDateTimeField
      FieldName = 'VP_FECHAMODIF'
    end
    object sdqConsultaVP_USUMODIF: TStringField
      FieldName = 'VP_USUMODIF'
    end
    object sdqConsultaVP_FECHABAJA: TDateTimeField
      FieldName = 'VP_FECHABAJA'
    end
    object sdqConsultaVP_USUBAJA: TStringField
      FieldName = 'VP_USUBAJA'
    end
    object sdqConsultaVP_APROBADO: TStringField
      FieldName = 'VP_APROBADO'
      Size = 1
    end
    object sdqConsultaVP_USUAPROBADO: TStringField
      FieldName = 'VP_USUAPROBADO'
    end
    object sdqConsultaVP_FECHAAPROBADO: TDateTimeField
      FieldName = 'VP_FECHAAPROBADO'
    end
    object sdqConsultaVP_IDEMPRESA: TFloatField
      FieldName = 'VP_IDEMPRESA'
      Required = True
    end
    object sdqConsultaVP_ESTABLECIMIENTO: TFloatField
      FieldName = 'VP_ESTABLECIMIENTO'
      Required = True
    end
    object sdqConsultaVP_IDPREVENTOR: TFloatField
      FieldName = 'VP_IDPREVENTOR'
      Required = True
    end
    object sdqConsultaVP_OBSERVACIONES: TStringField
      FieldName = 'VP_OBSERVACIONES'
      Size = 400
    end
    object sdqConsultaVP_IDPREVENTORCONSULTORA: TFloatField
      FieldName = 'VP_IDPREVENTORCONSULTORA'
    end
    object sdqConsultaVP_ID: TFloatField
      FieldName = 'VP_ID'
      Required = True
    end
    object sdqConsultaCANTVISITAS: TFloatField
      FieldName = 'CANTVISITAS'
    end
    object sdqConsultaEMPRESAVIP: TStringField
      FieldName = 'EMPRESAVIP'
      Size = 3
    end
    object sdqConsultaORIGENCARGA: TStringField
      FieldName = 'ORIGENCARGA'
      Size = 11
    end
    object sdqConsultaVP_ORIGEN: TStringField
      FieldName = 'VP_ORIGEN'
      Required = True
      Size = 1
    end
    object sdqConsultaVP_IDVIATICO: TFloatField
      FieldName = 'VP_IDVIATICO'
    end
    object sdqConsultaVP_FECHAVIATICO: TDateTimeField
      FieldName = 'VP_FECHAVIATICO'
    end
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
  end
  inherited ShortCutControl: TShortCutControl
    Enabled = False
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
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
    Left = 81
    Top = 256
  end
  object sdqDetalleTareas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT ta_id, ta_descripcion, tp_fechabaja, '#39'S'#39' realizado'
      '  FROM hys.htp_tareapreventor, hys.hta_tarea'
      ' WHERE tp_idtarea = ta_id'
      '   AND tp_idvisitapreventor = :ID'
      'UNION'
      
        'SELECT DISTINCT ta_id, ta_descripcion, NULL tp_fechabaja, '#39'N'#39' re' +
        'alizado'
      '           FROM hys.hts_tareahys, hys.hta_tarea'
      '          WHERE ts_idvisitapreventor IS NULL'
      '            AND ts_idtarea = ta_id'
      '            AND ts_idempresa = :idempresa'
      '            AND ts_estableci = :estableci'
      
        '            AND ts_idproceso = art.hys_plan.get_idproceso('#39'M'#39', t' +
        'runc(:fecha, '#39'MM'#39'), LAST_DAY(:fecha))'
      '            AND NOT EXISTS(SELECT 1'
      '                             FROM hys.htp_tareapreventor'
      '                            WHERE tp_idtarea = ta_id'
      '                               AND tp_idvisitapreventor = :ID)'
      'UNION'
      
        'SELECT DISTINCT ta_id, ta_descripcion, NULL tp_fechabaja, '#39'N'#39' re' +
        'alizado'
      '           FROM hys.hts_tareahys, hys.hta_tarea'
      '          WHERE ts_idvisitapreventor IS NULL'
      '            AND ts_idtarea = ta_id'
      '            AND ts_idempresa = :idempresa'
      '            AND ts_estableci = :estableci'
      
        '            AND (ts_idproceso = art.hys_plan.get_idproceso('#39'M'#39', ' +
        'trunc(add_months(:fecha, -1), '#39'MM'#39'), LAST_DAY(add_months(:fecha,' +
        ' -1)))'
      
        '                 OR ts_idproceso = art.hys_plan.get_idproceso('#39'M' +
        #39', trunc(:fecha, '#39'MM'#39'), LAST_DAY(:fecha)))'
      '            AND NOT EXISTS(SELECT 1'
      '                             FROM hys.hts_tareahys a'
      '                            WHERE a.ts_idvisitapreventor IS NULL'
      '                              AND a.ts_idempresa = :idempresa'
      '                              AND a.ts_estableci = :estableci'
      
        '                              AND a.ts_idproceso = art.hys_plan.' +
        'get_idproceso('#39'M'#39', trunc(:fecha, '#39'MM'#39'), LAST_DAY(:fecha)))'
      '            AND NOT EXISTS(SELECT 1'
      '                             FROM hys.htp_tareapreventor'
      '                            WHERE tp_idtarea = ta_id'
      '                               AND tp_idvisitapreventor = :ID)')
    Left = 14
    Top = 612
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsDetalleTareas: TDataSource
    DataSet = sdqDetalleTareas
    Left = 40
    Top = 612
  end
  object sdqRecomendaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqRecomendacionesAfterScroll
    SQL.Strings = (
      
        'SELECT re_cuit, re_estableci,re_recomendacion, re_descripcion1, ' +
        're_descripcion2, re_cumplimiento,'
      
        '       re_seguimiento, re_responsable, re_noamerita, re_operativ' +
        'o, re_tipo'
      '  FROM art.pre_recomendaciones'
      
        ' WHERE re_cuit = :cuit AND re_estableci = :estableci AND re_fech' +
        'abaja IS NULL')
    Left = 16
    Top = 332
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end>
  end
  object dsRecomendaciones: TDataSource
    DataSet = sdqRecomendaciones
    Left = 44
    Top = 332
  end
  object sdqVisitas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT rv_cuit, rv_estableci, rv_recomendacion, rv_tipo_visita,'
      '       tb_descripcion tipo, rv_fecha'
      '  FROM ctb_tablas, prv_recvisitas'
      ' WHERE rv_fechabaja IS NULL'
      '   AND tb_clave = '#39'TVISI'#39
      '   AND tb_codigo = rv_tipo_visita'
      '   AND rv_cuit = :cuit'
      '   AND rv_estableci = :estableci'
      '   AND rv_tipo = :tipo'
      '   AND rv_operativo = :operativo'
      '   AND rv_recomendacion = :recomendacion'
      'order by rv_fecha DESC')
    Left = 15
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'operativo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'recomendacion'
        ParamType = ptInput
      end>
  end
  object dsVisitas: TDataSource
    DataSet = sdqVisitas
    Left = 44
    Top = 360
  end
  object sdqMedidasEnfermedades: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqMedidasEnfermedadesAfterScroll
    SQL.Strings = (
      'SELECT   ee_id, ee_idexpediente,'
      
        '         ex_siniestro || '#39'/'#39' || ex_orden || '#39'/'#39' || ex_recaida si' +
        'niestro,'
      
        '         ee_nroestablecimiento, mc_id, mc_idenfermedadestablecim' +
        'iento,'
      
        '         mc_medida, mc_fechaejecucion, mc_fechaverificacion, mc_' +
        'descripcion,'
      
        '         mc_usualta usuario, mc_usubaja, mc_fechabaja, mc_fechae' +
        'xport'
      '    FROM hys.pee_enfermedadestablecimiento,'
      '         art.sex_expedientes,'
      '         hys.pmc_medidacorrectivaenf'
      '   WHERE ee_idexpediente = ex_id'
      '     AND ee_cuit = :cuit'
      '     AND ee_nroestablecimiento = :nroestableci'
      '     AND mc_idenfermedadestablecimiento = ee_id'
      'ORDER BY mc_medida')
    Left = 16
    Top = 388
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nroestableci'
        ParamType = ptInput
      end>
  end
  object sdqSeguimientoEnfermedades: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT SV_ID,'
      '       SV_IDMEDIDACORRECTIVA,'
      '       SV_TIPO,'
      
        '       DECODE(SV_TIPO, '#39'V'#39', '#39'Visita'#39', '#39'C'#39', '#39'Cumplimiento'#39', '#39'I'#39', ' +
        #39'Incumplimiento'#39') TIPO_VISITA,'
      '       SV_FECHA,'
      '       SV_USUALTA USUARIO,'
      '       SV_USUBAJA,'
      '       SV_FECHABAJA,'
      '       SV_FECHAEXPORT'
      '  FROM HYS.PSV_SEGUIMIENTOVISITAENF'
      ' WHERE SV_IDMEDIDACORRECTIVA = :ID'
      'ORDER BY SV_FECHA DESC'
      ' '
      ' '
      ' ')
    Left = 16
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsSeguimientoEnfermedades: TDataSource
    DataSet = sdqSeguimientoEnfermedades
    Left = 44
    Top = 416
  end
  object dsMedidasEnfermedades: TDataSource
    DataSet = sdqMedidasEnfermedades
    Left = 44
    Top = 388
  end
  object sdqMedidasAccidente: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqMedidasAccidenteAfterScroll
    SQL.Strings = (
      ''
      'SELECT   ae_id, ae_cuit, ae_nroestablecimiento,'
      
        '         ex_siniestro || '#39'/'#39' || ex_orden || '#39'/'#39' || ex_recaida si' +
        'niestro,'
      
        '         mc_id, mc_idaccidenteestablecimiento, mc_medida, mc_fec' +
        'haejecucion,'
      
        '         mc_fechaverificacion, mc_descripcion, mc_usualta usuari' +
        'o, mc_usubaja,'
      '         mc_fechabaja, mc_fechaexport'
      '    FROM hys.pmc_medidacorrectiva,'
      '         hys.pae_accidenteestablecimiento,'
      '         art.sex_expedientes'
      '   WHERE ae_idexpediente = ex_id'
      '     AND mc_idaccidenteestablecimiento = ae_id'
      '     AND ae_cuit = :cuit'
      '     AND ae_nroestablecimiento = :nroestableci'
      'ORDER BY mc_medida')
    Left = 16
    Top = 444
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nroestableci'
        ParamType = ptInput
      end>
  end
  object dsMedidasAccidente: TDataSource
    DataSet = sdqMedidasAccidente
    Left = 44
    Top = 444
  end
  object sdqSeguimientoAccidentes: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT SV_ID,'
      '       SV_IDMEDIDACORRECTIVA,'
      '       SV_TIPO,'
      
        '       DECODE(SV_TIPO, '#39'V'#39', '#39'Visita'#39', '#39'C'#39', '#39'Cumplimiento'#39', '#39'I'#39', ' +
        #39'Incumplimiento'#39') TIPO_VISITA,'
      '       SV_FECHA,'
      '       SV_USUALTA USUARIO,'
      '       SV_USUBAJA,'
      '       SV_FECHABAJA,'
      '       SV_FECHAEXPORT'
      '  FROM HYS.PSV_SEGUIMIENTOVISITA'
      ' WHERE SV_IDMEDIDACORRECTIVA = :ID'
      'ORDER BY SV_FECHA DESC'
      ' '
      ' '
      ' ')
    Left = 15
    Top = 472
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsSeguimientoAccidentes: TDataSource
    DataSet = sdqSeguimientoAccidentes
    Left = 43
    Top = 472
  end
  object sdqPAL: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqPALAfterScroll
    SQL.Strings = (
      
        'SELECT pa_id, pa_cuit, pa_estableci, pa_tipo, pa_operativo, pa_a' +
        'nexo,'
      
        '       pa_itemanexo, pa_cumplimiento, pa_seguimiento, pa_fechaal' +
        'ta,'
      
        '       pa_usualta, pa_fechamodif, pa_usumodif, pa_fechabaja, pa_' +
        'usubaja,'
      
        '       DECODE (pa_noamerita, '#39'S'#39', '#39'No Amerita'#39', ai_descripcion) ' +
        'descitem,'
      '       ai_anexosrt tipoanexo, pa_idvisita, pa_noamerita,'
      '       pa_fechacumplimientopost'
      '  FROM hys.hpa_pal, art.pai_anexo2items'
      ' WHERE pa_anexo = ai_anexo(+)'
      '   AND ai_codigo(+) = pa_itemanexo'
      '   AND pa_cuit = :cuit'
      '   AND pa_estableci = :estableci'
      'ORDER BY pa_itemanexo')
    Left = 15
    Top = 500
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end>
  end
  object sdqVisitasPal: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    DataSource = dsConsulta
    SQL.Strings = (
      
        'SELECT   ps_id, ps_idpal, ps_fechavisita, ps_tiposeguimiento, ps' +
        '_idvisita, ps_fechaalta, ps_usualta, ps_fechamodif, ps_usumodif,'
      
        '         ps_fechabaja, ps_usubaja, iif_char(ps_tiposeguimiento, ' +
        #39'C'#39', '#39'Cumplimiento'#39', '#39'Incumplimiento'#39') tipo,ps_fechacomprometida'
      '    FROM hys.hps_palseguimiento'
      '   WHERE ps_idpal = :pa_id'
      'ORDER BY ps_fechavisita DESC'
      '')
    Left = 14
    Top = 528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pa_id'
        ParamType = ptInput
      end>
  end
  object dsPAL: TDataSource
    DataSet = sdqPAL
    Left = 42
    Top = 500
  end
  object dsVisitasPal: TDataSource
    DataSet = sdqVisitasPal
    Left = 42
    Top = 528
  end
  object dsRes463: TDataSource
    DataSet = sdqRes463
    Left = 42
    Top = 556
  end
  object dsSeguimientoRes463: TDataSource
    DataSet = sdqSeguimientoRes463
    Left = 42
    Top = 584
  end
  object sdqRes463: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqRes463AfterScroll
    SQL.Strings = (
      
        'SELECT   rl_id,RL_ESTABLECI, em_cuit, il_id, ia_id, ia_nrodescri' +
        'pcion, ia_descripcion,'
      '         il_fecharegularizacion, il_fechaverificacion'
      '    FROM hys.hrl_relevriesgolaboral,'
      '         afi.aem_empresa,'
      '         afi.aco_contrato,'
      '         hys.hil_itemsriesgolaboral,'
      '         hys.hia_itemanexo'
      '   WHERE rl_id = il_idrelevriesgolaboral'
      '     AND rl_fechabaja IS NULL'
      '     AND ia_id = il_iditemanexo'
      '     AND em_id = co_idempresa'
      '     AND co_contrato = rl_contrato'
      
        '     AND (   (ia_idtipoformanexo IS NULL AND il_cumplimiento = '#39 +
        'N'#39')'
      
        '          OR (ia_idtipoformanexo IS NOT NULL AND il_cumplimiento' +
        ' = '#39'S'#39')'
      '         )'
      
        '     AND rl_id = art.hys.get_ultidrelev463 (:contrato, :establec' +
        'i, '#39'P'#39')'
      'ORDER BY ia_id')
    Left = 14
    Top = 556
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end>
  end
  object sdqSeguimientoRes463: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    DataSource = dsConsulta
    SQL.Strings = (
      'SELECT   *'
      '    FROM hys.hrt_relevseguimiento'
      '   WHERE rt_idrelevriesgolaboral = :idrelev'
      '     AND rt_iditem = :iditem'
      '     AND rt_fechabaja IS NULL'
      'ORDER BY rt_fechaseguimiento DESC')
    Left = 13
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idrelev'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'iditem'
        ParamType = ptInput
      end>
  end
  object sdqTareaSubDetalle: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT mo_codigo, mo_descripcion, mo_fechabaja, '#39'S'#39' realizado'
      '  FROM hys.htp_tareapreventor,'
      '       hys.hta_tarea,'
      '       art.pmo_motivos,'
      '       hys.htm_tareamotivo'
      ' WHERE tp_idtarea = ta_id'
      '   AND tp_idvisitapreventor = :ID'
      '   AND tm_idtarea = ta_id'
      '   AND tm_fechabaja IS NULL'
      '   AND tm_idmotivo = mo_id'
      '   AND mo_fechabaja IS NULL'
      '   AND tp_idmotivo = mo_id')
    Left = 15
    Top = 640
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsTareaSubDetalle: TDataSource
    DataSet = sdqTareaSubDetalle
    Left = 41
    Top = 640
  end
end
