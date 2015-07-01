inherited frmTransfBancarias: TfrmTransfBancarias
  Left = 170
  Top = 185
  Caption = 'Transferencias Bancarias'
  ClientHeight = 420
  ClientWidth = 787
  Constraints.MinHeight = 450
  Constraints.MinWidth = 795
  ExplicitLeft = 170
  ExplicitTop = 185
  ExplicitWidth = 795
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 787
    Height = 47
    Visible = True
    ExplicitWidth = 787
    ExplicitHeight = 47
    DesignSize = (
      787
      47)
    object gbNroTransf: TGroupBox
      Left = 3
      Top = 0
      Width = 109
      Height = 43
      Caption = ' N'#250'mero de Transf.'
      TabOrder = 0
      object edTransferencia: TIntEdit
        Left = 5
        Top = 15
        Width = 98
        Height = 21
        TabOrder = 0
        MaxLength = 8
      end
    end
    object gbFechaAlta: TGroupBox
      Left = 116
      Top = 0
      Width = 201
      Height = 43
      Caption = ' Fecha de Alta'
      TabOrder = 1
      object Label3: TLabel
        Left = 94
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFechaAltaDesde: TDateComboBox
        Left = 4
        Top = 15
        Width = 88
        Height = 21
        MaxDateCombo = edFechaAltaHasta
        TabOrder = 0
      end
      object edFechaAltaHasta: TDateComboBox
        Left = 108
        Top = 15
        Width = 88
        Height = 21
        MinDateCombo = edFechaAltaDesde
        TabOrder = 1
      end
    end
    object rgImpresos: TRadioGroup
      Left = 625
      Top = 0
      Width = 161
      Height = 43
      Anchors = [akTop, akRight]
      Caption = ' Impresas'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        '&Si'
        '&No'
        '&Todas')
      TabOrder = 3
    end
    object gbBanco: TGroupBox
      Left = 320
      Top = 0
      Width = 303
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Banco '
      TabOrder = 2
      DesignSize = (
        303
        43)
      inline fraZBA_BANCO: TfraStaticCodigoDescripcion
        Left = 6
        Top = 14
        Width = 292
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 14
        ExplicitWidth = 292
        DesignSize = (
          292
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 229
          ExplicitWidth = 229
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
    Top = 47
    Width = 787
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 781
      end>
    ExplicitTop = 47
    ExplicitWidth = 787
    inherited ToolBar: TToolBar
      Width = 772
      ExplicitWidth = 772
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
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
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
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
      object tbDetalle: TToolButton
        Left = 385
        Top = 0
        Hint = 'Detalle (Ctrl+D)'
        ImageIndex = 15
        OnClick = tbDetalleClick
      end
      object tbArchivoBcoPatagonia: TToolButton
        Left = 408
        Top = 0
        Hint = 'Archivo Banco (Ctrl+B)'
        ImageIndex = 9
        OnClick = tbArchivoBcoPatagoniaClick
      end
      object tbRendicion: TToolButton
        Left = 431
        Top = 0
        Hint = 'Rendici'#243'n (Ctrl+R)'
        ImageIndex = 16
        OnClick = tbRendicionClick
      end
      object tbProceso: TToolButton
        Left = 454
        Top = 0
        Hint = 'Proceso (Ctrl+P)'
        ImageIndex = 28
        OnClick = tbProcesoClick
      end
      object ToolButton2: TToolButton
        Left = 477
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 485
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 76
    Width = 787
    Height = 344
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 265
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAIMPRESION'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Impresi'#243'n'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUIMPRESION'
        Title.Caption = 'Usuario Impresi'#243'n'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'METODOPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'M'#233'todo Pago'
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAPROCESO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Proceso'
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 67
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 184
    Top = 126
    ExplicitLeft = 184
    ExplicitTop = 126
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TR_ID ID, TRUNC(TR_FECHAALTA) FECHAALTA, TRUNC(TR_FECHABA' +
        'JA) FECHABAJA, TRUNC(TR_FECHAIMPRESION) FECHAIMPRESION, TR_USUIM' +
        'PRESION USUIMPRESION'
      'FROM TESO.RTR_TRANSFERENCIA')
    Top = 133
  end
  inherited dsConsulta: TDataSource
    Top = 133
  end
  inherited SortDialog: TSortDialog
    Top = 161
  end
  inherited ExportDialog: TExportDialog
    Top = 161
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
    Top = 189
  end
  inherited Seguridad: TSeguridad
    Top = 105
  end
  inherited FormStorage: TFormStorage
    Top = 105
  end
  inherited PrintDialog: TPrintDialog
    Top = 189
  end
  inherited ShortCutControl: TShortCutControl
    Top = 105
  end
  inherited FieldHider: TFieldHider
    Top = 133
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
      end
      item
        Key = 16452
        LinkControl = tbDetalle
      end
      item
        Key = 16450
        LinkControl = tbArchivoBcoPatagonia
      end
      item
        Key = 16466
        LinkControl = tbRendicion
      end
      item
        Key = 16464
        LinkControl = tbProceso
      end>
    Left = 108
    Top = 105
  end
  object pmnuImprimir: TPopupMenu
    Left = 88
    Top = 190
    object mnuImpTransfDepos: TMenuItem
      Caption = 'Imprimir Transferencias y Dep'#243'sitos'
      OnClick = mnuImpTransfDeposClick
    end
    object mnuImpResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImpResultadosClick
    end
  end
end
