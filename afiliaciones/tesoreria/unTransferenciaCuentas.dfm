inherited frmTransferenciaCuentas: TfrmTransferenciaCuentas
  Left = 17
  Top = 41
  Width = 769
  Height = 500
  Caption = 'Transferencia entre Cuentas'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 769
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 761
    Height = 113
    Visible = True
    DesignSize = (
      761
      113)
    object gbOrigen: TGroupBox
      Left = 1
      Top = 0
      Width = 378
      Height = 66
      Caption = 'Origen'
      TabOrder = 0
      DesignSize = (
        378
        66)
      object lbBanco: TLabel
        Left = 6
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Banco'
      end
      object lbCuenta: TLabel
        Left = 6
        Top = 41
        Width = 34
        Height = 13
        Caption = 'Cuenta'
      end
      inline fraCuentaBancariaOrigen: TfraStaticCodigoDescripcion
        Left = 45
        Top = 37
        Width = 327
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          327
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 264
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
      inline fraBancoOrigen: TfraStaticCodigoDescripcion
        Left = 45
        Top = 13
        Width = 327
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          327
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 264
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
    object gbDest: TGroupBox
      Left = 382
      Top = 0
      Width = 378
      Height = 66
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Destino'
      TabOrder = 1
      DesignSize = (
        378
        66)
      object Label1: TLabel
        Left = 6
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Banco'
      end
      object Label2: TLabel
        Left = 6
        Top = 41
        Width = 34
        Height = 13
        Caption = 'Cuenta'
      end
      inline fraCuentaBancariaDest: TfraStaticCodigoDescripcion
        Left = 45
        Top = 37
        Width = 327
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          327
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 264
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
      inline fraBancoDest: TfraStaticCodigoDescripcion
        Left = 45
        Top = 13
        Width = 327
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          327
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 264
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
    object gbFecha: TGroupBox
      Left = 299
      Top = 66
      Width = 212
      Height = 44
      Caption = 'Fecha'
      TabOrder = 3
      object Label3: TLabel
        Left = 101
        Top = 21
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaDesde: TDateComboBox
        Left = 9
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edFechaHasta
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 117
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edFechaDesde
        TabOrder = 1
      end
    end
    object rgAprobado: TRadioGroup
      Left = 1
      Top = 66
      Width = 294
      Height = 44
      Caption = 'Aprobado'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Aprobadas'
        'No Aprobadas'
        'Todas')
      TabOrder = 2
    end
    object chkNoMostrarBajas: TCheckBox
      Left = 518
      Top = 82
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  inherited CoolBar: TCoolBar
    Top = 113
    Width = 761
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 757
      end>
    inherited ToolBar: TToolBar
      Width = 744
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
        Visible = False
      end
      object tbAltaMasiva: TToolButton
        Left = 383
        Top = 0
        Hint = 'Alta Masiva'
        ImageIndex = 16
        OnClick = tbAltaMasivaClick
      end
      object tbAprobar: TToolButton
        Left = 406
        Top = 0
        Hint = 'Aprobar'
        ImageIndex = 13
        OnClick = tbAprobarClick
      end
      object ToolButton1: TToolButton
        Left = 429
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 437
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 142
    Width = 761
    Height = 331
    Columns = <
      item
        Expanded = False
        FieldName = 'BANCO_ORIGEN'
        Title.Caption = 'Banco Origen'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA_ORIGEN'
        Title.Caption = 'Cuenta Origen'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO_DESTINO'
        Title.Caption = 'Banco Destino'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA_DESTINO'
        Title.Caption = 'Cuenta Destino'
        Width = 106
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
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 201
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_APROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobado'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 69
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 240
    Top = 142
    Width = 431
    Height = 326
    BorderStyle = bsDialog
    DesignSize = (
      431
      326)
    inherited BevelAbm: TBevel
      Top = 290
      Width = 423
    end
    object Label8: TLabel [1]
      Left = 13
      Top = 143
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label9: TLabel [2]
      Left = 13
      Top = 169
      Width = 35
      Height = 13
      Caption = 'Importe'
    end
    object Label10: TLabel [3]
      Left = 13
      Top = 198
      Width = 37
      Height = 13
      Caption = 'Observ.'
    end
    inherited btnAceptar: TButton
      Left = 273
      Top = 296
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 351
      Top = 296
      TabOrder = 6
    end
    object gbOrigenAltaModif: TGroupBox
      Left = 6
      Top = 2
      Width = 420
      Height = 66
      Caption = 'Origen'
      TabOrder = 0
      DesignSize = (
        420
        66)
      object Label4: TLabel
        Left = 6
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Banco'
      end
      object Label5: TLabel
        Left = 6
        Top = 41
        Width = 34
        Height = 13
        Caption = 'Cuenta'
      end
      inline fraCuentaBancariaOrigenAltaModif: TfraStaticCodigoDescripcion
        Left = 45
        Top = 37
        Width = 369
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          369
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 306
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
      inline fraBancoOrigenAltaModif: TfraStaticCodigoDescripcion
        Left = 45
        Top = 13
        Width = 369
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          369
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 306
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
    object gbDestAltaModif: TGroupBox
      Left = 6
      Top = 69
      Width = 420
      Height = 66
      Caption = 'Destino'
      TabOrder = 1
      DesignSize = (
        420
        66)
      object Label6: TLabel
        Left = 6
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Banco'
      end
      object Label7: TLabel
        Left = 6
        Top = 41
        Width = 34
        Height = 13
        Caption = 'Cuenta'
      end
      inline fraCuentaBancariaDestAltaModif: TfraStaticCodigoDescripcion
        Left = 45
        Top = 37
        Width = 369
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          369
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 306
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
      inline fraBancoDestAltaModif: TfraStaticCodigoDescripcion
        Left = 45
        Top = 13
        Width = 369
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          369
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 306
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
    object edFechaAltaModif: TDateComboBox
      Left = 53
      Top = 140
      Width = 88
      Height = 21
      MaxDateCombo = edFechaHasta
      TabOrder = 2
    end
    object edImporteAltaModif: TCurrencyEdit
      Left = 53
      Top = 167
      Width = 88
      Height = 21
      AutoSize = False
      MaxLength = 15
      MaxValue = 99999999999999.000000000000000000
      TabOrder = 3
    end
    object edObservAltaModif: TMemo
      Left = 53
      Top = 195
      Width = 372
      Height = 90
      MaxLength = 250
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ZBAO.BA_NOMBRE BANCO_ORIGEN, ZCBO.CB_NUMERO CUENTA_ORIGEN' +
        ', '
      
        '       ZBAD.BA_NOMBRE BANCO_DESTINO, ZCBD.CB_NUMERO CUENTA_DESTI' +
        'NO,'
      
        '       RTC.TC_FECHA FECHA, RTC.TC_IMPORTE IMPORTE, RTC.TC_OBSERV' +
        'ACIONES OBSERVACIONES, '
      
        '       TRUNC(RTC.TC_FECHAAPROBADO) FECHA_APROBADO, TRUNC(RTC.TC_' +
        'FECHABAJA) FECHA_BAJA'
      
        '  FROM RTC_TRANSFERENCIACUENTA RTC, ZCB_CUENTABANCARIA ZCBO, ZBA' +
        '_BANCO ZBAO, '
      '       ZCB_CUENTABANCARIA ZCBD, ZBA_BANCO ZBAD'
      ' WHERE ZCBO.CB_ID = RTC.TC_IDCUENTAORIGEN'
      '   AND ZBAO.BA_ID = ZCBO.CB_IDBANCO'
      '   AND ZCBD.CB_ID = RTC.TC_IDCUENTADESTINO'
      '   AND ZBAD.BA_ID = ZCBD.CB_IDBANCO'
      '   AND 1 = 2')
    Top = 251
  end
  inherited dsConsulta: TDataSource
    Top = 251
  end
  inherited SortDialog: TSortDialog
    Top = 279
  end
  inherited ExportDialog: TExportDialog
    Top = 279
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Top = 307
  end
  inherited Seguridad: TSeguridad
    Top = 223
  end
  inherited FormStorage: TFormStorage
    Top = 223
  end
  inherited PrintDialog: TPrintDialog
    Top = 307
  end
  inherited ShortCutControl: TShortCutControl
    Top = 223
  end
  inherited FieldHider: TFieldHider
    Top = 251
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
    Left = 108
    Top = 223
  end
  object pmnuImprimir: TPopupMenu
    Left = 92
    Top = 308
    object mnuImpTransfAprobadas: TMenuItem
      Caption = 'Imprimir Transferencias Aprobadas'
      OnClick = mnuImpTransfAprobadasClick
    end
    object mnuImpResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImpResultadosClick
    end
  end
end
