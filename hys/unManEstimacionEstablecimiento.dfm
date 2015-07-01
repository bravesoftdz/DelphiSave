inherited frmManEstimacionEstablecimiento: TfrmManEstimacionEstablecimiento
  Width = 748
  Caption = 'Estimaci'#243'n Establecimientos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 740
  end
  inherited CoolBar: TCoolBar
    Width = 740
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 736
      end>
    inherited ToolBar: TToolBar
      Width = 723
      object tbCotizacionVisitas: TToolButton
        Left = 370
        Top = 0
        Hint = 'Cotizaci'#243'n Visitas'
        Caption = 'tbCotizacion'
        ImageIndex = 23
        OnClick = tbCotizacionVisitasClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 740
    Columns = <
      item
        Expanded = False
        FieldName = 'EE_CIIU'
        Title.Caption = 'CIIU'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_CAPITASDESDE'
        Title.Caption = 'Cant Capitas Desde'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_CAPITASHASTA'
        Title.Caption = 'Cant Capitas Hasta'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_CANTESTAB'
        Title.Caption = 'Cantidad Establecimientos'
        Width = 130
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 108
    Top = 96
    Height = 127
    DesignSize = (
      461
      127)
    inherited BevelAbm: TBevel
      Top = 91
    end
    object lbCIIU: TLabel [1]
      Left = 10
      Top = 14
      Width = 21
      Height = 13
      Caption = 'CIIU'
    end
    object lbCapitas: TLabel [2]
      Left = 10
      Top = 40
      Width = 35
      Height = 13
      Caption = 'Capitas'
    end
    object lbCapitasDesde: TLabel [3]
      Left = 56
      Top = 40
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object lbCapitasHasta: TLabel [4]
      Left = 216
      Top = 40
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object lbCantidadEstab: TLabel [5]
      Left = 10
      Top = 64
      Width = 75
      Height = 13
      Caption = 'Cantidad Estab.'
    end
    inherited btnAceptar: TButton
      Top = 97
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Top = 97
      TabOrder = 5
    end
    object edCapitasDesde: TPatternEdit
      Left = 97
      Top = 35
      Width = 108
      Height = 21
      MaxLength = 20
      TabOrder = 1
    end
    object edCapitasHasta: TPatternEdit
      Left = 257
      Top = 35
      Width = 108
      Height = 21
      MaxLength = 20
      TabOrder = 2
    end
    object edCantidadEstab: TPatternEdit
      Left = 97
      Top = 59
      Width = 108
      Height = 21
      MaxLength = 20
      TabOrder = 3
    end
    object edCIIU: TPatternEdit
      Left = 97
      Top = 11
      Width = 108
      Height = 21
      MaxLength = 6
      TabOrder = 0
    end
  end
  object fpCotizacionVisitas: TFormPanel [4]
    Left = 164
    Top = 116
    Width = 629
    Height = 275
    FormWidth = 0
    FormHeigth = 0
    Position = poScreenCenter
    Constraints.MaxHeight = 275
    Constraints.MaxWidth = 629
    Constraints.MinHeight = 275
    Constraints.MinWidth = 629
    DesignSize = (
      629
      275)
    object Bevel1: TBevel
      Left = 5
      Top = 237
      Width = 619
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbCUIT: TLabel
      Left = 15
      Top = 11
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label1: TLabel
      Left = 15
      Top = 32
      Width = 83
      Height = 13
      Caption = 'Cant. Empleados:'
    end
    object Label2: TLabel
      Left = 15
      Top = 57
      Width = 58
      Height = 13
      Caption = 'Cant. Estab:'
    end
    object lbCIUU: TLabel
      Left = 15
      Top = 81
      Width = 26
      Height = 13
      Caption = 'CIUU'
    end
    object Label3: TLabel
      Left = 15
      Top = 134
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label4: TLabel
      Left = 15
      Top = 107
      Width = 44
      Height = 13
      Caption = 'Provincia'
    end
    object Label5: TLabel
      Left = 15
      Top = 160
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object lbCosto: TLabel
      Left = 448
      Top = 184
      Width = 27
      Height = 13
      Caption = 'Costo'
    end
    object btnAceptarCotIzacion: TButton
      Left = 468
      Top = 243
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Calcular'
      TabOrder = 8
      OnClick = btnCalcularClick
    end
    object btnCancelCotizacion: TButton
      Left = 548
      Top = 243
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 9
    end
    object edCantEmpleados: TIntEdit
      Left = 112
      Top = 30
      Width = 86
      Height = 21
      TabOrder = 1
      AutoExit = True
      MaxLength = 4
    end
    object edCantEstab: TIntEdit
      Left = 112
      Top = 54
      Width = 86
      Height = 21
      TabOrder = 2
      AutoExit = True
      MaxLength = 4
    end
    object mskCUIT: TMaskEdit
      Left = 112
      Top = 5
      Width = 81
      Height = 21
      Hint = 'CUIT de la Empresa'
      EditMask = '99-99999999-9;0;'
      MaxLength = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    inline fraActividad: TfraStaticCodigoDescripcion
      Left = 111
      Top = 78
      Width = 506
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        506
        23)
      inherited edCodigo: TPatternEdit
        Width = 56
      end
      inherited cmbDescripcion: TComboGrid
        Left = 59
        Width = 443
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
    inline fraProvincia: TfraCodigoDescripcion
      Left = 112
      Top = 104
      Width = 370
      Height = 23
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 305
      end
    end
    inline fraTipoFet: TfraCtbTablas
      Left = 112
      Top = 129
      Width = 164
      Height = 23
      TabOrder = 5
      inherited cmbDescripcion: TArtComboBox
        Left = 27
        Width = 97
      end
      inherited edCodigo: TPatternEdit
        Width = 24
      end
    end
    object cbLicitacion: TCheckBox
      Left = 15
      Top = 184
      Width = 110
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Licitaci'#243'n'
      TabOrder = 7
    end
    inline fraSectores: TfraCtbTablas
      Left = 112
      Top = 156
      Width = 164
      Height = 23
      TabOrder = 6
      inherited cmbDescripcion: TArtComboBox
        Left = 27
        Width = 111
      end
      inherited edCodigo: TPatternEdit
        Width = 24
      end
    end
    object edCosto: TCurrencyEdit
      Left = 489
      Top = 180
      Width = 121
      Height = 21
      AutoSize = False
      TabOrder = 10
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hee_estimacionestab')
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
    Left = 80
    Top = 260
  end
  object SDcotizacionprevencion: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'art.hys.get_cotizacionvisitas'
    Left = 32
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'CUIT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDACTIVIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTEMPLEADOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTESTAB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODPROVINCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SECTOREMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LICITACION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COSTO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'MSGRESULTADO'
        ParamType = ptOutput
      end>
  end
end
