inherited frmImpuestosConsultaFacturas: TfrmImpuestosConsultaFacturas
  Left = 54
  Top = 221
  Caption = 'Liquidaciones'
  ClientHeight = 536
  ClientWidth = 861
  Constraints.MinHeight = 500
  Constraints.MinWidth = 748
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Visible = False
  ExplicitLeft = 54
  ExplicitTop = 221
  ExplicitWidth = 869
  ExplicitHeight = 566
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 861
    Height = 173
    ExplicitWidth = 861
    ExplicitHeight = 173
    object GBEntidad: TGroupBox
      Left = 4
      Top = 4
      Width = 852
      Height = 45
      Caption = 'Entidad'
      TabOrder = 0
      DesignSize = (
        852
        45)
      inline fraIE_ID: TfraCodigoDescripcion
        Left = 10
        Top = 15
        Width = 834
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 10
        ExplicitTop = 15
        ExplicitWidth = 834
        DesignSize = (
          834
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 769
          ExplicitWidth = 769
        end
      end
    end
    object gbFactura: TGroupBox
      Left = 4
      Top = 50
      Width = 853
      Height = 118
      Caption = 'Datos de la Liquidaci'#243'n'
      TabOrder = 1
      object Label4: TLabel
        Left = 8
        Top = 19
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object pnlIL_FECHA: TPanel
        Left = 7
        Top = 74
        Width = 208
        Height = 41
        BevelOuter = bvNone
        Caption = ' >>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object cmbIL_FECHADesde: TDateComboBox
          Left = 1
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MaxDateCombo = cmbIL_FECHAHasta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cmbIL_FECHAHasta: TDateComboBox
          Left = 113
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MinDateCombo = cmbIL_FECHADesde
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object edIL_NUMERO: TMaskEdit
        Left = 8
        Top = 35
        Width = 82
        Height = 21
        EditMask = '9999-99999999;1;_'
        MaxLength = 13
        TabOrder = 0
        Text = '    -        '
        OnExit = CompletarFactura
      end
      object Panel1: TPanel
        Left = 8
        Top = 65
        Width = 205
        Height = 17
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Fecha de Liquidaci'#243'n'
        TabOrder = 8
      end
      object pnlIL_FECHAAPROBADO: TPanel
        Left = 217
        Top = 74
        Width = 208
        Height = 41
        BevelOuter = bvNone
        Caption = ' >>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object cmbIL_FECHAAPROBADODesde: TDateComboBox
          Left = 1
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MaxDateCombo = cmbIL_FECHAAPROBADOHasta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cmbIL_FECHAAPROBADOHasta: TDateComboBox
          Left = 113
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MinDateCombo = cmbIL_FECHAAPROBADODesde
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel4: TPanel
        Left = 218
        Top = 65
        Width = 205
        Height = 17
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Fecha de Aprobaci'#243'n'
        TabOrder = 9
      end
      object pnlIL_FECHAALTA: TPanel
        Left = 428
        Top = 74
        Width = 210
        Height = 41
        BevelOuter = bvNone
        Caption = ' >>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object cmbIL_FECHAALTADesde: TDateComboBox
          Left = 1
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MaxDateCombo = cmbIL_FECHAALTAHasta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cmbIL_FECHAALTAHasta: TDateComboBox
          Left = 113
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MinDateCombo = cmbIL_FECHAALTADesde
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel3: TPanel
        Left = 430
        Top = 65
        Width = 205
        Height = 17
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Fecha de Alta'
        TabOrder = 10
      end
      object pnlIL_FECHAVENCIMIENTO: TPanel
        Left = 639
        Top = 74
        Width = 208
        Height = 41
        BevelOuter = bvNone
        Caption = ' >>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object cmbIL_FECHAVENCIMIENTODesde: TDateComboBox
          Left = 1
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MaxDateCombo = cmbIL_FECHAVENCIMIENTOHasta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cmbIL_FECHAVENCIMIENTOHasta: TDateComboBox
          Left = 113
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MinDateCombo = cmbIL_FECHAVENCIMIENTODesde
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 640
        Top = 65
        Width = 205
        Height = 17
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Fecha de Vencimiento'
        TabOrder = 11
      end
      object pnlIL_PERIODO: TPanel
        Left = 92
        Top = 24
        Width = 121
        Height = 41
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label9: TLabel
          Left = 52
          Top = 15
          Width = 17
          Height = 11
          Caption = ' >>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object ppIL_PERIODODesde: TPeriodoPicker
          Left = 3
          Top = 11
          Width = 49
          Height = 21
          OnExit = ppIL_PERIODODesdeExit
          TabOrder = 0
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205310'
          Periodo.MinPeriodo = '195310'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          Fuente.Charset = DEFAULT_CHARSET
          Fuente.Color = clWindowText
          Fuente.Height = -11
          Fuente.Name = 'Tahoma'
          Fuente.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NullDropDown = SetMax
        end
        object ppIL_PERIODOHasta: TPeriodoPicker
          Left = 72
          Top = 11
          Width = 49
          Height = 21
          TabOrder = 1
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205310'
          Periodo.MinPeriodo = '195310'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          Fuente.Charset = DEFAULT_CHARSET
          Fuente.Color = clWindowText
          Fuente.Height = -11
          Fuente.Name = 'Tahoma'
          Fuente.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NullDropDown = SetMax
        end
      end
      object Panel6: TPanel
        Left = 96
        Top = 15
        Width = 117
        Height = 17
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Periodo'
        TabOrder = 12
      end
      object chkSoloActivas: TCheckBox
        Left = 501
        Top = 33
        Width = 80
        Height = 17
        Caption = 'Solo Activas'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object rgFacturas: TRadioGroup
        Left = 219
        Top = 14
        Width = 275
        Height = 45
        Caption = 'Liquidaciones'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          '&Todas'
          '&Aprobadas'
          '&Sin Aprobar')
        TabOrder = 2
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 173
    Width = 861
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 855
      end>
    ExplicitTop = 173
    ExplicitWidth = 861
    inherited ToolBar: TToolBar
      Width = 846
      ExplicitWidth = 846
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Detalle de Liquidaciones'
        ImageIndex = 9
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited ToolButton8: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
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
      object tbAprobar: TToolButton
        Left = 401
        Top = 0
        Hint = 'Aprobar (Ctrl+A)'
        ImageIndex = 13
        OnClick = tbAprobarClick
      end
      object ToolButton2: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbAdjuntos: TToolButton
        Left = 432
        Top = 0
        Hint = 'Adjuntos'
        DropdownMenu = mnuAdjuntos
        ImageIndex = 22
        Style = tbsDropDown
        OnClick = tbAdjuntosClick
      end
      object ToolButton7: TToolButton
        Left = 470
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbAnular: TToolButton
        Left = 478
        Top = 0
        Hint = 'Anular'
        ImageIndex = 29
        OnClick = tbAnularClick
      end
      object ToolButton9: TToolButton
        Left = 501
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 509
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 202
    Width = 861
    Height = 334
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnPaintFooter = GridPaintFooter
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'IL_ID'
        Title.Alignment = taCenter
        Title.Caption = 'ID Liquid.'
        Width = 59
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT_ENTIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT Entidad'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOM_ENTIDAD'
        Title.Caption = 'Nombre Entidad'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero'
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAVENCIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Vencimiento'
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 107
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAAPROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Aprobado'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUAPROBADO'
        Title.Caption = 'Usuario Aprobado'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BENEFICIARIO'
        Title.Caption = 'Beneficiario'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OP'
        Title.Alignment = taCenter
        Title.Caption = 'Orden Pago'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUE'
        Title.Caption = 'Cheque'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BENEFICIARIOCH'
        Title.Caption = 'Beneficiario del Cheque'
        Width = 164
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_OP'
        Title.Alignment = taCenter
        Title.Caption = 'F. Orden Pago'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 294
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EXISTENOMBREARCHIVO'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Archivo Adj.'
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 93
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha del Cheque'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUAC_DESCRIPCION'
        Title.Caption = 'Situaci'#243'n del Cheque'
        Width = 116
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_SITUAC'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Situac.'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DEBITADO'
        Title.Alignment = taCenter
        Title.Caption = 'Debitado'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHADEBITADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Debitado'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 168
    Top = 264
    Width = 501
    Height = 250
    BorderStyle = bsSingle
    Constraints.MaxHeight = 250
    Constraints.MaxWidth = 501
    Constraints.MinHeight = 250
    Constraints.MinWidth = 501
    ExplicitLeft = 168
    ExplicitTop = 264
    ExplicitWidth = 501
    ExplicitHeight = 250
    DesignSize = (
      501
      250)
    inherited BevelAbm: TBevel
      Top = 214
      Width = 493
      ExplicitTop = 214
      ExplicitWidth = 493
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 47
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label3: TLabel [2]
      Left = 96
      Top = 47
      Width = 84
      Height = 13
      Caption = 'Fecha Liquidaci'#243'n'
    end
    object Label6: TLabel [3]
      Left = 341
      Top = 47
      Width = 38
      Height = 13
      Caption = 'Importe'
    end
    object Label2: TLabel [4]
      Left = 12
      Top = 91
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label5: TLabel [5]
      Left = 12
      Top = 7
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label7: TLabel [6]
      Left = 192
      Top = 47
      Width = 89
      Height = 13
      Caption = 'Fecha Vencimiento'
    end
    object Label8: TLabel [7]
      Left = 288
      Top = 47
      Width = 36
      Height = 13
      Caption = 'Periodo'
    end
    inherited btnAceptar: TButton
      Left = 346
      Top = 220
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      ExplicitLeft = 346
      ExplicitTop = 220
    end
    inherited btnCancelar: TButton
      Left = 421
      Top = 220
      TabOrder = 8
      ExplicitLeft = 421
      ExplicitTop = 220
    end
    object cmbfpIL_FECHA: TDateComboBox
      Left = 96
      Top = 63
      Width = 94
      Height = 21
      MinDate = 35247.000000000000000000
      TabOrder = 2
    end
    object edfpIL_NUMERO: TMaskEdit
      Left = 11
      Top = 63
      Width = 82
      Height = 21
      EditMask = '9999-99999999;1;_'
      MaxLength = 13
      TabOrder = 1
      Text = '    -        '
      OnExit = CompletarFactura
    end
    object edIL_MONTO: TCurrencyEdit
      Left = 341
      Top = 63
      Width = 89
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 5
    end
    object edIL_OBSERVACIONES: TMemo
      Left = 11
      Top = 105
      Width = 479
      Height = 103
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 240
      TabOrder = 6
    end
    inline fraEntidad: TfraCodigoDescripcion
      Left = 10
      Top = 22
      Width = 483
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 10
      ExplicitTop = 22
      ExplicitWidth = 483
      DesignSize = (
        483
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 418
        ExplicitWidth = 418
      end
    end
    object edIL_FECHAVENCIMIENTO: TDateComboBox
      Left = 192
      Top = 63
      Width = 94
      Height = 21
      MinDate = 35247.000000000000000000
      TabOrder = 3
    end
    object edIL_PERIODO: TPeriodoPicker
      Left = 288
      Top = 63
      Width = 49
      Height = 21
      TabOrder = 4
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205310'
      Periodo.MinPeriodo = '195310'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'Tahoma'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NullDropDown = SetMax
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT IE_ID, IE_CUIT CUIT_ENTIDAD, IE_NOMBRE NOM_ENTIDAD,'
      '       IL_NUMERO NUMERO, IL_FECHA FECHA, IL_MONTO IMPORTE,'
      
        '       IL_ID, IL_FECHAAPROBADO FECHAAPROBADO, TRUNC(IL_FECHABAJA' +
        ') FECHABAJA,'
      
        '       IL_USUAPROBADO USUAPROBADO, IL_OBSERVACIONES OBSERVACIONE' +
        'S,'
      '       TRUNC(IL_FECHAALTA) FECHAALTA, IL_USUALTA USUALTA'
      '  FROM CONT.OIE_IMPENTIDAD, CONT.OIL_IMPLIQUIDACION'
      ' WHERE IL_IDENTIDAD = IE_ID'
      '')
    Top = 307
  end
  inherited dsConsulta: TDataSource
    Top = 307
  end
  inherited SortDialog: TSortDialog
    Top = 335
  end
  inherited ExportDialog: TExportDialog
    Top = 335
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
    Top = 363
  end
  inherited Seguridad: TSeguridad
    Top = 279
  end
  inherited FormStorage: TFormStorage
    Top = 279
  end
  inherited PrintDialog: TPrintDialog
    Top = 363
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
      end
      item
        Key = 16449
        LinkControl = tbAprobar
      end
      item
        Key = 16452
      end>
    Top = 279
  end
  inherited FieldHider: TFieldHider
    Top = 307
  end
  object mnuAdjuntos: TPopupMenu
    Left = 24
    Top = 391
    object mnuAdjuntosCargar: TMenuItem
      Caption = 'Cargar'
      OnClick = mnuAdjuntosCargarClick
    end
    object mnuAdjuntosVisualizar: TMenuItem
      Caption = 'Visualizar'
      OnClick = mnuAdjuntosVisualizarClick
    end
    object mnuAdjuntosEliminar: TMenuItem
      Caption = 'Eliminar'
      OnClick = mnuAdjuntosEliminarClick
    end
  end
  object OpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 24
    Top = 419
  end
end
