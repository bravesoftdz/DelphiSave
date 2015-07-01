inherited frmManPresupuestoMensual: TfrmManPresupuestoMensual
  Left = 189
  Top = 133
  Caption = 'Mantenimiento de Presupuesto Mensual'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'RM_ID'
        Title.Caption = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AREA'
        Title.Caption = 'Area'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RM_PERIODO'
        Title.Caption = 'Periodo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RM_MONTO'
        Title.Caption = 'Monto Presupuesto'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RM_FECHABAJA'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 240
    Top = 108
    Width = 268
    Height = 181
    DesignSize = (
      268
      181)
    inherited BevelAbm: TBevel
      Top = 145
      Width = 260
    end
    object Label1: TLabel [1]
      Left = 43
      Top = 25
      Width = 9
      Height = 13
      Caption = 'Id'
    end
    object Label2: TLabel [2]
      Left = 33
      Top = 52
      Width = 22
      Height = 13
      Caption = #193'rea'
    end
    object Label3: TLabel [3]
      Left = 19
      Top = 107
      Width = 36
      Height = 13
      Caption = 'Periodo'
    end
    object Label4: TLabel [4]
      Left = 26
      Top = 79
      Width = 30
      Height = 13
      Caption = 'Monto'
    end
    inherited btnAceptar: TButton
      Left = 110
      Top = 151
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 188
      Top = 151
      TabOrder = 5
    end
    object edId: TEdit
      Left = 62
      Top = 20
      Width = 69
      Height = 21
      TabOrder = 0
    end
    object edArea: TEdit
      Left = 62
      Top = 47
      Width = 194
      Height = 21
      TabOrder = 1
    end
    object edMonto: TCurrencyEdit
      Left = 62
      Top = 74
      Width = 124
      Height = 21
      AutoSize = False
      MaxValue = 999999999999.990000000000000000
      TabOrder = 2
    end
    object pPeriodo: TPeriodoPicker
      Left = 62
      Top = 102
      Width = 125
      Height = 21
      TabOrder = 3
      TabStop = True
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poMesAno
      Periodo.Separador = '/'
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '06/2050'
      Periodo.MinPeriodo = '06/1996'
      WidthMes = 22
      Separation = 1
      ShowButton = True
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
  end
  object fpArea: TFormPanel [4]
    Left = 124
    Top = 208
    Width = 361
    Height = 96
    Caption = 'Area'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      361
      96)
    object Bevel1: TBevel
      Left = 4
      Top = 60
      Width = 353
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 9
      Top = 8
      Width = 195
      Height = 13
      Caption = 'Seleccione el Area a la que corresponde:'
    end
    object btnAceptarArea: TButton
      Left = 203
      Top = 66
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarAreaClick
    end
    object btnCancelarArea: TButton
      Left = 281
      Top = 66
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarAreaClick
    end
    inline fraArea: TfraCodigoDescripcion
      Left = 9
      Top = 28
      Width = 346
      Height = 24
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 281
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT RM_ID, SC_DESCRIPCION Area, '
      
        '       RM_PERIODO, RM_MONTO, RM_USUALTA, RM_FECHAALTA, RM_USUMOD' +
        'IF, '
      '       RM_FECHAMODIF, RM_USUBAJA,  RM_FECHABAJA, RM_CLAVEAREA'
      'FROM ART.PRM_PRESUPUESTOMENSUAL, ART.USC_SECTORES'
      'WHERE RM_CLAVEAREA = SC_CODIGO')
    object sdqConsultaRM_CLAVEAREA: TStringField
      FieldName = 'RM_CLAVEAREA'
    end
    object sdqConsultaRM_PERIODO: TStringField
      FieldName = 'RM_PERIODO'
    end
    object sdqConsultaRM_USUALTA: TStringField
      FieldName = 'RM_USUALTA'
    end
    object sdqConsultaRM_FECHAALTA: TDateTimeField
      FieldName = 'RM_FECHAALTA'
    end
    object sdqConsultaRM_USUMODIF: TStringField
      FieldName = 'RM_USUMODIF'
    end
    object sdqConsultaRM_FECHAMODIF: TDateTimeField
      FieldName = 'RM_FECHAMODIF'
    end
    object sdqConsultaRM_USUBAJA: TStringField
      FieldName = 'RM_USUBAJA'
    end
    object sdqConsultaRM_FECHABAJA: TDateTimeField
      FieldName = 'RM_FECHABAJA'
    end
    object sdqConsultaRM_ID: TFloatField
      FieldName = 'RM_ID'
    end
    object sdqConsultaRM_MONTO: TFloatField
      FieldName = 'RM_MONTO'
    end
    object sdqConsultaAREA: TStringField
      FieldName = 'AREA'
      Size = 100
    end
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'LIQUI'
      end
      item
        Name = 'PRESDIN'
      end>
  end
end
