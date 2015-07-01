object frmAutTurnos: TfrmAutTurnos
  Left = 244
  Top = 170
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Turnos de la prestaci'#243'n'
  ClientHeight = 310
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    311
    310)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 12
    Width = 45
    Height = 13
    Caption = 'Prestador'
  end
  object Label2: TLabel
    Left = 2
    Top = 40
    Width = 50
    Height = 13
    Caption = 'Prestaci'#243'n'
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 63
    Width = 303
    Height = 211
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    object Label11: TLabel
      Left = 41
      Top = 20
      Width = 36
      Height = 13
      Caption = 'Turnos:'
    end
    object btnAgregarTurno: TSpeedButton
      Left = 4
      Top = 43
      Width = 27
      Height = 25
      Cursor = crArrow
      Hint = 'Insertar Turno (Ctrl + I)'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0010101010101000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0010
        1010007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00101010009090007F7F10101000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0010
        101000CFCF009090007F7F10101000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0010101000FFFF00CFCF009090007F7F1010
        1000FF0000FF0000FF00002F2F10101010101010101010101010101010101010
        101000FFFF00FFFF00CFCF009090007F7F10101000FF0000FF00002F2F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F2FFFFF00FFFF00FFFF00CFCF0090
        90007F7F10101000FF00002F2F60FFFF60FFFF60FFFF60FFFF60FFFF60FFFF60
        FFFF60FFFF2FFFFF00FFFF00FFFF00CFCF009090007F7F101010002F2F90FFFF
        EFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FF00FF
        FF00CFCF007F7F002F2F002F2FCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCF
        FFFFCFFFFFCFFFFFEFF0FF2FFFFF00FFFF007F7F002F2F00FF00002F2F002F2F
        002F2F002F2F002F2F002F2F002F2F002F2FCFFFFFEFF0FFCFFFFF2FFFFF007F
        7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        2F2FCFFFFFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFF007F7F002F2F00FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        2F2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00002F2F007F7F002F2F00FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        2F2F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAgregarTurnoClick
    end
    object btnEliminarTurno: TSpeedButton
      Left = 4
      Top = 75
      Width = 27
      Height = 25
      Cursor = crArrow
      Hint = 'Borrar Turno (Ctrl + D)'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        200000000000000400000000000000000000000000000000000000FF00FF00FF
        000000FF00FF00FF000000FF00FF00FF000000FF00FF101010001010101000FF
        001000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
        000000FF00FF00FF000000FF00FF00FF0000101010FF007F7F101010107F00FF
        001000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
        000000FF00FF00FF000000FF00FF10101000007F7F1000CFCF7F101010CF00FF
        001000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
        000000FF00FF00FF0000101010FF007F7F102FFFFF7F00CFCFFF101010CF00FF
        001000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF002F00FF
        000000FF00FF10101000007F7F102FFFFF7F2FFFFFFF00CFCFFF101010CF00FF
        001000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF002F00FF
        0000101010FF007F7F102FFFFF7FCFFFFFFF2FFFFFFF00CFCFFF101010CF1010
        10101010101010101010101010101010101010101010002F2F1000FF002F1010
        1000007F7F102FFFFF7FCFFFFFFFCFFFFFFF2FFFFFFF00CFCFFF007F7FCF007F
        7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F002F2F7F1010102F007F
        7F102FFFFF7FCFFFFFFFCFFFFFFFCFFFFFFF2FFFFFFF60FFFFFF60FFFFFF60FF
        FFFF60FFFFFF60FFFFFF60FFFFFF00CFCFFF009090CF002F2F90002F2F2F007F
        7F2F00CFCF7F00FFFFCFEFF0FFFFEFF0FFFFEFF0FFF0EFF0FFFFEFF0FFF0EFF0
        FFFFEFF0FFF0FFFFFFFF60FFFFFF00CFCFFF009090CF002F2F9000FF002F002F
        2F00007F7F2F00FFFF7F2FFFFFFFEFF0FFFFCFFFFFF0CFFFFFFFCFFFFFFFCFFF
        FFFFCFFFFFFFFFFFFFFF60FFFFFF00CFCFFF009090CF002F2F9000FF00FF00FF
        0000002F2FFF007F7F2F2FFFFF7FCFFFFFFF2FFFFFFF00CFCFFF002F2FCF002F
        2F2F002F2F2F002F2F2F002F2F2F002F2F2F002F2F2F002F2F2F00FF00FF00FF
        000000FF00FF002F2F00007F7F2FCFFFFF7F2FFFFFFF00CFCFFF002F2FCF00FF
        002F00FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
        000000FF00FF00FF0000002F2FFF007F7F2F2FFFFF7F00CFCFFF002F2FCF00FF
        002F00FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
        000000FF00FF00FF000000FF00FF002F2F00007F7F2F00CFCF7F002F2FCF00FF
        002F00FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
        000000FF00FF00FF000000FF00FF00FF0000002F2FFF007F7F2F002F2F7F00FF
        002F00FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF000000FF
        000000FF00FF00FF000000FF00FF00FF000000FF00FF002F2F00002F2F2F00FF
        002F00FF00FF00FF000000FF00FF00FF000000FF00FF00FF0000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEliminarTurnoClick
    end
    object btnAnularTurno: TSpeedButton
      Left = 4
      Top = 107
      Width = 27
      Height = 25
      Cursor = crArrow
      Hint = 'Baja de turno (Ctrl + X)'
      Enabled = False
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888808888888888088800088888888888880000888888
        8088888000888888088888880008888008888888800088008888888888000008
        8888888888800088888888888800000888888888800088008888888000088880
        0888880000888888008888000888888888088888888888888888}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAnularTurnoClick
    end
    object cmbTurnoFecha: TDateComboBox
      Left = 83
      Top = 12
      Width = 93
      Height = 21
      TabOrder = 0
    end
    object mskTurnoHora: TMaskEdit
      Left = 189
      Top = 12
      Width = 36
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
    end
    object ScrollBox1: TScrollBox
      Left = 36
      Top = 40
      Width = 262
      Height = 164
      TabOrder = 2
      object lstTurnos: TListBox
        Left = -2
        Top = -3
        Width = 467
        Height = 147
        Style = lbOwnerDrawFixed
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        IntegralHeight = True
        ItemHeight = 13
        MultiSelect = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnDrawItem = lstTurnosDrawItem
      end
    end
  end
  object btnAceptarTurno: TButton
    Left = 154
    Top = 281
    Width = 75
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnAceptarTurnoClick
  end
  object btnCancelarTurno: TButton
    Left = 240
    Top = 281
    Width = 67
    Height = 24
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object edPrestador: TEdit
    Left = 56
    Top = 8
    Width = 250
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  inline fraPrestacion: TfraPrestacion
    Left = 56
    Top = 34
    Width = 250
    Height = 23
    TabOrder = 4
    inherited edCodigo: TEdit
      Width = 48
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
    end
    inherited cmbDescripcion: TArtComboBox
      Left = 52
      Width = 199
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
    end
  end
  object fpAnular: TFormPanel
    Left = 59
    Top = 124
    Width = 336
    Height = 75
    Caption = 'Ingrese motivo de anulaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    Constraints.MinHeight = 70
    Constraints.MinWidth = 310
    DesignSize = (
      336
      75)
    object Bevel5: TBevel
      Left = -69
      Top = 37
      Width = 402
      Height = 3
      Anchors = [akRight, akBottom]
      Shape = bsBottomLine
    end
    object Label18: TLabel
      Left = 4
      Top = 13
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object btnAnuAceptar: TButton
      Left = 186
      Top = 45
      Width = 70
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAnuAceptarClick
    end
    object btnAnuCancelar: TButton
      Left = 261
      Top = 45
      Width = 70
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraMotivoAnulacion: TfraCodigoDescripcion
      Left = 40
      Top = 8
      Width = 294
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 48
        Width = 229
      end
      inherited edCodigo: TPatternEdit
        Width = 44
      end
    end
  end
  object btnAprobarCT: TButton
    Left = 5
    Top = 281
    Width = 112
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = 'Aprobar con trasl.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnAprobarCTClick
  end
  object btnAprobarST: TButton
    Left = 121
    Top = 281
    Width = 115
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = 'Aprobar sin trasl.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnAprobarSTClick
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16457
        LinkControl = btnAgregarTurno
      end
      item
        Key = 16452
        LinkControl = btnEliminarTurno
      end
      item
        Key = 16472
        LinkControl = btnAnularTurno
      end>
    Left = 12
  end
end
