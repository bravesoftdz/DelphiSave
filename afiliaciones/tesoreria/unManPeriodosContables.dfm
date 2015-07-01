inherited frmManPeriodosContables: TfrmManPeriodosContables
  Left = 73
  Top = 78
  Width = 600
  Height = 450
  Caption = 'Mantenimiento de Per'#237'odos Contables'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 600
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Hint = 'Abrir Per'#237'odo Contable (Ctrl+A)'
        ImageIndex = 28
      end
      inherited tbModificar: TToolButton
        Hint = 'Cerrar Per'#237'odo Contable (Ctrl+R)'
        ImageIndex = 29
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      object tbReapertura: TToolButton
        Left = 370
        Top = 0
        Hint = 'Reapertura de Per'#237'odo Contable (Ctrl+P)'
        ImageIndex = 22
        OnClick = tbReaperturaClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Width = 592
    Height = 389
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'PC_ID'
        Title.Caption = 'ID del Per'#237'odo Contable'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CB_ID'
        Title.Caption = 'ID de la Cuenta'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CB_NUMERO'
        Title.Caption = 'Cuenta'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_PERIODO'
        Title.Caption = 'Per'#237'odo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_FECHAMODIF'
        Title.Caption = 'Fecha de Modificaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_USUMODIF'
        Title.Caption = 'Usuario de Modificaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 254
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 260
    Top = 224
    Width = 250
    Height = 158
    Constraints.MaxHeight = 158
    Constraints.MaxWidth = 250
    Constraints.MinHeight = 158
    Constraints.MinWidth = 250
    DesignSize = (
      250
      158)
    inherited BevelAbm: TBevel
      Top = 122
      Width = 242
    end
    object lbCuenta: TLabel [1]
      Left = 12
      Top = 14
      Width = 35
      Height = 13
      Caption = 'Cuenta'
    end
    object Label1: TLabel [2]
      Left = 12
      Top = 62
      Width = 36
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label2: TLabel [3]
      Left = 68
      Top = 62
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    inherited btnAceptar: TButton
      Left = 95
      Top = 128
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 170
      Top = 128
    end
    inline fraPC_CUENTA: TfraCodDesc
      Left = 10
      Top = 32
      Width = 230
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        230
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 165
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'CB_FECHABAJA'
        FieldCodigo = 'CB_ID'
        FieldDesc = 'CB_NUMERO'
        FieldID = 'CB_ID'
        IdType = ctInteger
        OrderBy = 'CB_NUMERO'
        TableName = 'ZCB_CUENTABANCARIA'
      end
    end
    object edPC_PERIODO: TPeriodoPicker
      Left = 12
      Top = 81
      Width = 49
      Height = 21
      TabOrder = 3
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 10
      Periodo.Ano = 2005
      Periodo.Valor = '200510'
      Periodo.MaxPeriodo = '205510'
      Periodo.MinPeriodo = '195511'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object cmbPC_ESTADO: TComboBox
      Left = 68
      Top = 81
      Width = 172
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'Abierto'
        'Cerrado')
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TESO.RPC_PERIODOCONCILIACION.*, CB_ID, CB_NUMERO, DECODE(' +
        'PC_ESTADO, '#39'A'#39', '#39'Abierto'#39', '#39'C'#39', '#39'Cerrado'#39', '#39'Err'#243'neo'#39') ESTADO,'
      '       BA_NOMBRE BANCO'
      
        '  FROM ZBA_BANCO, ZCB_CUENTABANCARIA, TESO.RPC_PERIODOCONCILIACI' +
        'ON'
      ' WHERE CB_ID = PC_CUENTA'
      '   AND CB_IDBANCO = BA_ID')
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16449
        LinkControl = tbNuevo
      end
      item
        Key = 16466
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
      end
      item
        Key = 16464
        LinkControl = tbReapertura
      end>
  end
end
