inherited frmCotizacionPrevencion: TfrmCotizacionPrevencion
  Left = 484
  Top = 378
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Cotizaci'#243'n Prevenci'#243'n'
  ClientHeight = 273
  ClientWidth = 494
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 502
  Constraints.MinHeight = 300
  Constraints.MinWidth = 502
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 11
    Top = 238
    Width = 473
    Height = 1
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object lbCUIT: TLabel [1]
    Left = 15
    Top = 11
    Width = 25
    Height = 13
    Caption = 'CUIT'
  end
  object Label1: TLabel [2]
    Left = 15
    Top = 32
    Width = 83
    Height = 13
    Caption = 'Cant. Empleados:'
  end
  object Label2: TLabel [3]
    Left = 15
    Top = 57
    Width = 58
    Height = 13
    Caption = 'Cant. Estab:'
  end
  object lbCIUU: TLabel [4]
    Left = 15
    Top = 81
    Width = 26
    Height = 13
    Caption = 'CIUU'
  end
  object Label3: TLabel [5]
    Left = 15
    Top = 134
    Width = 21
    Height = 13
    Caption = 'Tipo'
  end
  object Label4: TLabel [6]
    Left = 15
    Top = 107
    Width = 44
    Height = 13
    Caption = 'Provincia'
  end
  object Label5: TLabel [7]
    Left = 15
    Top = 160
    Width = 31
    Height = 13
    Caption = 'Sector'
  end
  object lbCosto: TLabel [8]
    Left = 328
    Top = 184
    Width = 27
    Height = 13
    Caption = 'Costo'
  end
  object btnAceptarCotIzacion: TButton [9]
    Left = 323
    Top = 244
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Calcular'
    TabOrder = 8
    OnClick = btnAceptarCotIzacionClick
  end
  object btnCancelCotizacion: TButton [10]
    Left = 411
    Top = 244
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 9
    OnClick = btnCancelCotizacionClick
  end
  object edCantEmpleados: TIntEdit [11]
    Left = 112
    Top = 30
    Width = 85
    Height = 21
    TabOrder = 1
    AutoExit = True
    MaxLength = 4
  end
  object edCantEstab: TIntEdit [12]
    Left = 112
    Top = 54
    Width = 85
    Height = 21
    TabOrder = 2
    AutoExit = True
    MaxLength = 4
  end
  object mskCUIT: TMaskEdit [13]
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
  inline fraActividad: TfraStaticCodigoDescripcion [14]
    Left = 111
    Top = 78
    Width = 383
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    DesignSize = (
      383
      23)
    inherited edCodigo: TPatternEdit
      Width = 56
    end
    inherited cmbDescripcion: TComboGrid
      Left = 59
      Width = 320
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
  inline fraProvincia: TfraCodigoDescripcion [15]
    Left = 112
    Top = 104
    Width = 378
    Height = 23
    TabOrder = 4
    inherited cmbDescripcion: TArtComboBox
      Width = 313
    end
  end
  inline fraTipoFet: TfraCtbTablas [16]
    Left = 112
    Top = 129
    Width = 164
    Height = 23
    TabOrder = 5
    inherited cmbDescripcion: TArtComboBox
      Left = 27
      Width = 111
    end
    inherited edCodigo: TPatternEdit
      Width = 24
    end
  end
  object cbLicitacion: TCheckBox [17]
    Left = 15
    Top = 184
    Width = 110
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Licitaci'#243'n'
    TabOrder = 7
  end
  inline fraSectores: TfraCtbTablas [18]
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
  object edCosto: TCurrencyEdit [19]
    Left = 364
    Top = 180
    Width = 121
    Height = 21
    AutoSize = False
    TabOrder = 10
  end
  inherited FormStorage: TFormStorage [20]
    Left = 384
  end
  inherited XPMenu: TXPMenu
    Left = 412
  end
  inherited ilByN: TImageList
    Left = 384
  end
  inherited ilColor: TImageList
    Left = 412
  end
  inherited IconosXP: TImageList
    Left = 440
  end
  object SDcotizacionPrevencion: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'art.hys.get_cotizacionprevencion'
    Left = 440
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
