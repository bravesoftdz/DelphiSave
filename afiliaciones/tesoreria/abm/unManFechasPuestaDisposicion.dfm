inherited frmManFechasPuestaDisposicion: TfrmManFechasPuestaDisposicion
  Caption = 'Fechas Puesta a Disposici'#243'n'
  ClientWidth = 562
  ExplicitWidth = 570
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 562
    Height = 70
    Visible = True
    ExplicitTop = -4
    ExplicitHeight = 70
    object Label4: TLabel
      Left = 7
      Top = 12
      Width = 82
      Height = 13
      Caption = 'M'#233'todo de Pago:'
    end
    object Label5: TLabel
      Left = 5
      Top = 45
      Width = 87
      Height = 13
      Caption = 'Situaci'#243'n Cheque:'
    end
    object GroupBox1: TGroupBox
      Left = 492
      Top = 1
      Width = 70
      Height = 67
      Caption = ' Ver Bajas '
      TabOrder = 2
      object rbSi_VerBajas: TRadioButton
        Left = 10
        Top = 14
        Width = 37
        Height = 17
        Caption = 'S'#237
        TabOrder = 0
      end
      object rbNo_VerBajas: TRadioButton
        Left = 10
        Top = 30
        Width = 37
        Height = 17
        Caption = 'No'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object rbTodos_VerBajas: TRadioButton
        Left = 10
        Top = 47
        Width = 51
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
      end
    end
    inline fraMetodoPago_Filtro: TfraCtbTablas
      Left = 98
      Top = 6
      Width = 382
      Height = 23
      TabOrder = 0
      ExplicitLeft = 98
      ExplicitTop = 6
      ExplicitWidth = 382
      inherited cmbDescripcion: TArtComboBox
        Left = 53
        Width = 329
        ExplicitLeft = 53
        ExplicitWidth = 285
      end
      inherited edCodigo: TPatternEdit
        Width = 49
        ExplicitWidth = 49
      end
    end
    inline fraSituacionCheque_Filtro: TfraCtbTablas
      Left = 97
      Top = 39
      Width = 383
      Height = 23
      TabOrder = 1
      ExplicitLeft = 97
      ExplicitTop = 39
      ExplicitWidth = 383
      inherited cmbDescripcion: TArtComboBox
        Left = 54
        Width = 330
        ExplicitLeft = 54
        ExplicitWidth = 289
      end
      inherited edCodigo: TPatternEdit
        Width = 50
        ExplicitWidth = 50
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 70
    Width = 562
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 558
      end>
    ExplicitTop = 89
    inherited ToolBar: TToolBar
      Left = 9
      Width = 549
      ExplicitLeft = 9
      ExplicitWidth = 549
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 99
    Width = 562
    Height = 337
    Columns = <
      item
        Expanded = False
        FieldName = 'FP_ID'
        Title.Caption = 'ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'METODOPAGO'
        Title.Caption = 'M'#233'todo Pago'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACIONCHEQUE'
        Title.Caption = 'Situaci'#243'n Cheque'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FP_DIAS'
        Title.Caption = 'Dias'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FBAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F.Baja'
        Width = 70
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 73
    Top = 188
    Width = 444
    Height = 135
    ExplicitLeft = 73
    ExplicitTop = 188
    ExplicitWidth = 444
    ExplicitHeight = 135
    inherited BevelAbm: TBevel
      Top = 99
      Width = 436
      ExplicitTop = 161
      ExplicitWidth = 464
    end
    object Label1: TLabel [1]
      Left = 7
      Top = 17
      Width = 82
      Height = 13
      Caption = 'M'#233'todo de Pago:'
    end
    object Label2: TLabel [2]
      Left = 6
      Top = 45
      Width = 87
      Height = 13
      Caption = 'Situaci'#243'n Cheque:'
    end
    object Label3: TLabel [3]
      Left = 66
      Top = 77
      Width = 24
      Height = 13
      Caption = 'Dias:'
    end
    inherited btnAceptar: TButton
      Left = 283
      Top = 105
      TabOrder = 3
      ExplicitLeft = 283
      ExplicitTop = 105
    end
    inherited btnCancelar: TButton
      Left = 361
      Top = 105
      TabOrder = 4
      ExplicitLeft = 361
      ExplicitTop = 105
    end
    inline fraMetodoPago: TfraCtbTablas
      Left = 97
      Top = 11
      Width = 342
      Height = 23
      TabOrder = 0
      ExplicitLeft = 97
      ExplicitTop = 11
      ExplicitWidth = 342
      inherited cmbDescripcion: TArtComboBox
        Width = 289
        ExplicitWidth = 289
      end
      inherited edCodigo: TPatternEdit
        Width = 49
        ExplicitWidth = 49
      end
    end
    inline fraSituacionCheque: TfraCtbTablas
      Left = 97
      Top = 39
      Width = 342
      Height = 23
      TabOrder = 1
      ExplicitLeft = 97
      ExplicitTop = 39
      ExplicitWidth = 342
      inherited cmbDescripcion: TArtComboBox
        Left = 51
        Width = 290
        ExplicitLeft = 51
        ExplicitWidth = 290
      end
    end
    object edDias: TIntEdit
      Left = 98
      Top = 69
      Width = 49
      Height = 21
      TabOrder = 2
      MaxLength = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'select fp_id, fp_metodopago, COBRO.tb_descripcion MetodoPago, '
      
        '       fp_situacioncheque, SITCH.tb_descripcion SituacionCheque,' +
        ' fp_dias, '
      
        '       fp_usualta, fp_fechaalta, fp_usumodif, fp_fechamodif, fp_' +
        'usubaja, fp_fechabaja, trunc(fp_fechabaja) fbaja'
      
        '  from teso.rfp_fechapuestadisp, art.ctb_tablas COBRO, art.ctb_t' +
        'ablas SITCH'
      ' where COBRO.tb_clave = '#39'COBRO'#39
      '   and COBRO.tb_codigo = fp_metodopago'
      '   and SITCH.tb_clave = '#39'SITCH'#39
      '   and SITCH.tb_codigo = fp_situacioncheque')
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
  end
end
