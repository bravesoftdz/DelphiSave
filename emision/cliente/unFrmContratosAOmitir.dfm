inherited frmContratosAOmitir: TfrmContratosAOmitir
  Left = 182
  Top = 158
  Width = 754
  Height = 476
  Caption = 'Mantenimiento de Contrato a Omitir'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 746
    Height = 33
  end
  inherited CoolBar: TCoolBar
    Top = 33
    Width = 746
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 742
      end>
    inherited ToolBar: TToolBar
      Width = 729
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 62
    Width = 746
    Height = 380
    Columns = <
      item
        Expanded = False
        FieldName = 'CM_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CM_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'R. Social'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_PERIODODESDE'
        Title.Caption = 'Periodo Desde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_PERIODOHASTA'
        Title.Caption = 'Periodo Hasta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CM_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CM_FECHABAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CM_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CO_IDEMPRESA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EM_ID'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 104
    Top = 152
    Width = 581
    Height = 133
    Caption = 'Agregar Contrato a Omitir'
    inherited BevelAbm: TBevel
      Left = 0
      Top = 97
      Width = 573
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 4
      Width = 54
      Height = 13
      Caption = 'Busqueda: '
    end
    object lblPerVigenciaDesde: TLabel [2]
      Left = 10
      Top = 52
      Width = 96
      Height = 13
      Caption = 'Per'#237'odo Vig. Desde:'
    end
    object Label5: TLabel [3]
      Left = 184
      Top = 52
      Width = 93
      Height = 13
      Caption = 'Per'#237'odo Vig. Hasta:'
    end
    object lblMotrechazo: TLabel [4]
      Left = 8
      Top = 76
      Width = 97
      Height = 13
      Caption = 'Motivo de rechazo : '
    end
    inherited btnAceptar: TButton
      Left = 423
      Top = 103
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 501
      Top = 103
      TabOrder = 5
    end
    inline fraEmpresaOmitir: TfraEmpresa
      Left = 8
      Top = 20
      Width = 566
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = fraEmpresaOmitirExit
      inherited lbContrato: TLabel
        Left = 460
      end
      inherited edContrato: TIntEdit
        Width = 56
      end
      inherited cmbRSocial: TArtComboBox
        Top = 1
        Height = 18
      end
    end
    object edPeriodoHasta: TPeriodoPicker
      Left = 287
      Top = 48
      Width = 49
      Height = 20
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 12
      Periodo.Ano = 2005
      Periodo.Valor = '200512'
      Periodo.MaxPeriodo = '205511'
      Periodo.MinPeriodo = '195512'
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
    object edPeriodoDesde: TPeriodoPicker
      Left = 112
      Top = 48
      Width = 49
      Height = 20
      OnExit = edPeriodoDesdeExit
      TabOrder = 1
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 12
      Periodo.Ano = 2005
      Periodo.Valor = '200512'
      Periodo.MaxPeriodo = '205512'
      Periodo.MinPeriodo = '195512'
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
    inline fraMotivoRechazo: TfraCodigoDescripcion
      Left = 110
      Top = 71
      Width = 357
      Height = 23
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ICM.CM_ID, ICM.CM_CONTRATO, ICM.CM_PERIODOHASTA, ICM.CM_P' +
        'ERIODODESDE,'
      
        '       ICM.CM_FECHAALTA, ICM.CM_USUALTA, ICM.CM_FECHABAJA, ICM.C' +
        'M_USUBAJA,'
      '       ACO.CO_IDEMPRESA, AEM.EM_ID, AEM.EM_CUIT, AEM.EM_NOMBRE'
      
        '  FROM EMI.ICM_CONTRATOOMITIR ICM, AFI.AEM_EMPRESA AEM, AFI.ACO_' +
        'CONTRATO ACO'
      ' WHERE (    (AEM.EM_ID = ACO.CO_IDEMPRESA)'
      '        AND (ACO.CO_CONTRATO = ICM.CM_CONTRATO)'
      '       )')
  end
end
