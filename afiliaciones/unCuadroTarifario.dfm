object frmCuadroTarifario: TfrmCuadroTarifario
  Left = 215
  Top = 138
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Cuadro Tarifario'
  ClientHeight = 490
  ClientWidth = 792
  Color = clBtnFace
  Constraints.MaxHeight = 517
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 517
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -9
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel28: TPanel
    Left = 0
    Top = 31
    Width = 398
    Height = 459
    Caption = 'No est'#225' autorizado para ver esta tarifa'
    TabOrder = 3
  end
  object Panel21: TPanel
    Left = 396
    Top = 31
    Width = 396
    Height = 459
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      396
      459)
    object Label1: TLabel
      Left = 38
      Top = 9
      Width = 28
      Height = 13
      Caption = 'Tarifa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 134
      Width = 50
      Height = 13
      Caption = 'F.Autoriza'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 30
      Top = 159
      Width = 36
      Height = 13
      Caption = 'Usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 15
      Top = 58
      Width = 51
      Height = 13
      Caption = 'Actividad I'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbEstado: TLabel
      Left = 33
      Top = 34
      Width = 33
      Height = 13
      Caption = 'Estado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 11
      Top = 84
      Width = 55
      Height = 13
      Caption = 'Actividad II'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 7
      Top = 109
      Width = 59
      Height = 13
      Caption = 'Actividad III'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 6
      Top = 374
      Width = 369
      Height = 50
      Shape = bsBottomLine
    end
    object lbNivel: TLabel
      Left = 58
      Top = 209
      Width = 23
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nivel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbCantEmpleados: TLabel
      Left = 10
      Top = 183
      Width = 56
      Height = 13
      Caption = 'Cant. Empl.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbMasaSalarial: TLabel
      Left = 4
      Top = 235
      Width = 62
      Height = 13
      Caption = 'Masa Salarial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbMotivosNoAprobacion: TLabel
      Left = 8
      Top = 428
      Width = 160
      Height = 26
      Cursor = crHandPoint
      Alignment = taCenter
      AutoSize = False
      Caption = 'Motivos de NO aprobaci'#243'n autom'#225'tica de la tarifa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
      OnClick = lbMotivosNoAprobacionClick
      OnMouseEnter = lbMotivosNoAprobacionMouseEnter
      OnMouseLeave = lbMotivosNoAprobacionMouseLeave
    end
    object edSA_FECHAAUTORIZA: TDateComboBox
      Left = 69
      Top = 130
      Width = 86
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ButtonWidth = 19
      ParentFont = False
      TabOrder = 5
    end
    object edSA_USUARIOAUTORIZA: TEdit
      Left = 69
      Top = 155
      Width = 150
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object btGuardar: TButton
      Left = 241
      Top = 430
      Width = 75
      Height = 25
      Caption = '&Guardar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = btGuardarClick
    end
    object btSalir: TButton
      Left = 316
      Top = 430
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 8
      OnClick = btSalirClick
    end
    inline fraSA_TIPOTARIFA: TfraStaticCTB_TABLAS
      Left = 67
      Top = 4
      Width = 320
      Height = 22
      TabOrder = 0
      inherited edCodigo: TPatternEdit
        Font.Name = 'Tahoma'
        ParentFont = False
      end
      inherited cmbDescripcion: TComboGrid
        Width = 256
        Font.Name = 'Tahoma'
        ParentFont = False
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    inline fraSA_ESTADO: TfraStaticCTB_TABLAS
      Left = 68
      Top = 29
      Width = 320
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      inherited cmbDescripcion: TComboGrid
        Width = 256
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    inline fraSA_ACTIVIDAD: TfraStaticActividad
      Left = 68
      Top = 54
      Width = 320
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inherited cmbDescripcion: TComboGrid
        Width = 256
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
    inline fraSA_ACTIVIDAD2: TfraStaticActividad
      Left = 68
      Top = 79
      Width = 320
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      inherited cmbDescripcion: TComboGrid
        Width = 256
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
    inline fraSA_ACTIVIDAD3: TfraStaticActividad
      Left = 68
      Top = 104
      Width = 320
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      inherited cmbDescripcion: TComboGrid
        Width = 256
        Font.Name = 'Tahoma'
        ParentFont = False
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
    object gbTarifario: TGroupBox
      Left = 3
      Top = 256
      Width = 390
      Height = 168
      Caption = ' Tarifario '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      DesignSize = (
        390
        168)
      object lbObservaciones: TLabel
        Left = 281
        Top = 8
        Width = 83
        Height = 13
        Caption = 'Observaciones'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
      object GridTarifario: TStaticGrid
        Left = 2
        Top = 24
        Width = 385
        Height = 112
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        ColCount = 4
        DefaultColWidth = 88
        DefaultRowHeight = 20
        RowCount = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        RowHeights = (
          20
          20
          20
          20)
        Cells = (
          ''
          'Suma Fija'
          'Porc. Var.'
          'Prima por C'#225'pita'
          'Aprobado SSN'
          ''
          ''
          ''
          'Comercial (25 tbj)')
      end
      object btnActualizar: TButton
        Left = 166
        Top = 140
        Width = 88
        Height = 24
        Anchors = [akTop, akRight]
        Caption = 'Actualizar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnActualizarClick
      end
    end
    object edTOTEMPLEADOS: TIntEdit
      Left = 69
      Top = 180
      Width = 86
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      Alignment = taRightJustify
      MaxLength = 6
    end
    object edMASATOTAL: TCurrencyEdit
      Left = 69
      Top = 231
      Width = 86
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      TabOrder = 12
    end
    object edNIVEL: TIntEdit
      Left = 69
      Top = 205
      Width = 86
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      Alignment = taRightJustify
      MaxLength = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 396
    Height = 459
    TabOrder = 0
    object IntEdit19: TIntEdit
      Left = 208
      Top = 433
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 47
      Alignment = taRightJustify
    end
    object IntEdit18: TIntEdit
      Left = 208
      Top = 411
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 44
      Alignment = taRightJustify
    end
    object Panel2: TPanel
      Left = 5
      Top = 15
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Suma fija por trabajador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 50
    end
    object Panel3: TPanel
      Left = 5
      Top = 37
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Porc. variable sobre la masa salarial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 51
    end
    object Panel4: TPanel
      Left = 5
      Top = 59
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Rebaja por volumen masa salarial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 52
    end
    object Panel5: TPanel
      Left = 5
      Top = 81
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Rebaja por Higiene y Seguridad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 53
    end
    object Panel6: TPanel
      Left = 5
      Top = 103
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'SubTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 54
    end
    object Panel7: TPanel
      Left = 5
      Top = 125
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Recargo por Siniestralidad % s/variable'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 55
    end
    object Panel8: TPanel
      Left = 5
      Top = 147
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Recargo por Siniestralidad % s/fijo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 56
    end
    object Panel9: TPanel
      Left = 5
      Top = 169
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Recargo por Siniestralidad monto fijo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 57
    end
    object Panel10: TPanel
      Left = 5
      Top = 191
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Rebaja por Siniestralidad % s/variable'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 58
    end
    object Panel11: TPanel
      Left = 5
      Top = 213
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Rebaja por Siniestralidad % s/fijo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 59
    end
    object Panel12: TPanel
      Left = 5
      Top = 235
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Rebaja por Siniestralidad monto fijo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 60
    end
    object Panel13: TPanel
      Left = 5
      Top = 257
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Recargo Especial % s/variable'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 61
    end
    object Panel14: TPanel
      Left = 5
      Top = 279
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Recargo Especial % s/fijo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 62
    end
    object Panel15: TPanel
      Left = 5
      Top = 301
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Rebaja Especial % s/variable'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 63
    end
    object Panel16: TPanel
      Left = 5
      Top = 323
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Rebaja Especial % s/fijo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 64
    end
    object Panel17: TPanel
      Left = 5
      Top = 367
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Aporte a la SRT y SSN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 65
    end
    object Panel18: TPanel
      Left = 5
      Top = 389
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Subtotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 66
    end
    object Panel19: TPanel
      Left = 5
      Top = 411
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Fondo espec'#237'fico dto. 590/97'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 67
    end
    object Panel20: TPanel
      Left = 5
      Top = 433
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Al'#237'cuota Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 68
    end
    object Panel22: TPanel
      Left = 209
      Top = 3
      Width = 58
      Height = 11
      Caption = 'Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 69
    end
    object Panel23: TPanel
      Left = 271
      Top = 3
      Width = 58
      Height = 11
      Caption = '$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 70
    end
    object Panel24: TPanel
      Left = 333
      Top = 3
      Width = 58
      Height = 11
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 71
    end
    object Panel25: TPanel
      Left = 5
      Top = 4
      Width = 200
      Height = 11
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 78
    end
    object Panel26: TPanel
      Left = 5
      Top = 345
      Width = 200
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Subtotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 80
    end
    object IntEdit3: TIntEdit
      Left = 208
      Top = 15
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 72
      Alignment = taRightJustify
    end
    object edSA_SUMAFIJATARIFA: TCurrencyEdit
      Left = 270
      Top = 15
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      TabOrder = 0
      OnChange = DoCambio
      OnExit = edSA_SUMAFIJATARIFAExit
    end
    object IntEdit39: TIntEdit
      Left = 332
      Top = 15
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 73
      Alignment = taRightJustify
    end
    object IntEdit4: TIntEdit
      Left = 208
      Top = 37
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 77
      Alignment = taRightJustify
    end
    object IntEdit21: TIntEdit
      Left = 270
      Top = 37
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 74
      Alignment = taRightJustify
    end
    object edSA_PORCMASATARIFA: TCurrencyEdit
      Left = 332
      Top = 37
      Width = 60
      Height = 21
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      MaxLength = 10
      TabOrder = 1
      OnChange = DoCambio
      OnExit = edSA_PORCMASATARIFAExit
    end
    object edSA_PORCDESCVOLUMEN: TCurrencyEdit
      Left = 208
      Top = 59
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 6
      TabOrder = 2
      OnChange = DoCambio
      OnExit = edSA_PORCDESCVOLUMENExit
    end
    object IntEdit22: TIntEdit
      Left = 270
      Top = 59
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 75
      Alignment = taRightJustify
    end
    object edCalculo1: TCurrencyEdit
      Left = 332
      Top = 59
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 3
    end
    object edSA_PORCDESCNIVEL: TCurrencyEdit
      Left = 208
      Top = 81
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 6
      TabOrder = 4
      OnChange = DoCambio
      OnExit = edSA_PORCDESCNIVELExit
    end
    object IntEdit23: TIntEdit
      Left = 270
      Top = 81
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 76
      Alignment = taRightJustify
    end
    object edCalculo2: TCurrencyEdit
      Left = 332
      Top = 81
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 5
    end
    object IntEdit1: TIntEdit
      Left = 208
      Top = 103
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 79
      Alignment = taRightJustify
    end
    object edSUBT1_SUMAFIJA: TCurrencyEdit
      Left = 270
      Top = 103
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DisplayFormat = '0.00;-0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object edSUBT1: TCurrencyEdit
      Left = 332
      Top = 103
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object edSA_RECARGOSIN: TCurrencyEdit
      Left = 208
      Top = 125
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 6
      TabOrder = 8
      OnExit = edSA_RECARGOSINExit
    end
    object IntEdit25: TIntEdit
      Left = 270
      Top = 125
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 9
      Alignment = taRightJustify
    end
    object edCalculo3: TCurrencyEdit
      Left = 332
      Top = 125
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 10
    end
    object edSA_RECARGOSIN_SOBREFIJO: TCurrencyEdit
      Left = 208
      Top = 147
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 6
      TabOrder = 11
      OnExit = edSA_RECARGOSIN_SOBREFIJOExit
    end
    object edCalculo4: TCurrencyEdit
      Left = 270
      Top = 147
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 12
    end
    object IntEdit45: TIntEdit
      Left = 332
      Top = 147
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 13
      Alignment = taRightJustify
    end
    object IntEdit10: TIntEdit
      Left = 208
      Top = 169
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 14
      Alignment = taRightJustify
    end
    object edRCSMF: TCurrencyEdit
      Left = 270
      Top = 169
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      MaxValue = 9.000000000000000000
      TabOrder = 15
      OnChange = DoCambio
      OnExit = edRCSMFExit
    end
    object IntEdit46: TIntEdit
      Left = 332
      Top = 169
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 16
      Alignment = taRightJustify
    end
    object edSAN_RECARGOSIN: TCurrencyEdit
      Left = 208
      Top = 191
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 6
      TabOrder = 17
      OnExit = edSAN_RECARGOSINExit
    end
    object IntEdit28: TIntEdit
      Left = 270
      Top = 191
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 18
      Alignment = taRightJustify
    end
    object edCalculo3bis: TCurrencyEdit
      Left = 332
      Top = 191
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 19
    end
    object edSA_REBAJASIN_MONTOFIJO: TCurrencyEdit
      Left = 208
      Top = 213
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 6
      TabOrder = 20
      OnExit = edSA_REBAJASIN_MONTOFIJOExit
    end
    object edCalculo4bis: TCurrencyEdit
      Left = 270
      Top = 213
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 21
    end
    object IntEdit48: TIntEdit
      Left = 332
      Top = 213
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 22
      Alignment = taRightJustify
    end
    object IntEdit11: TIntEdit
      Left = 208
      Top = 235
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 23
      Alignment = taRightJustify
    end
    object edRBSMF: TCurrencyEdit
      Left = 270
      Top = 235
      Width = 60
      Height = 21
      AutoSize = False
      Color = clWhite
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      TabOrder = 24
      OnChange = DoCambio
      OnExit = edRBSMFExit
    end
    object IntEdit49: TIntEdit
      Left = 332
      Top = 235
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 25
      Alignment = taRightJustify
    end
    object edSA_RECARGOESP: TCurrencyEdit
      Left = 208
      Top = 257
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 6
      TabOrder = 26
      OnExit = edSA_RECARGOESPExit
    end
    object IntEdit31: TIntEdit
      Left = 270
      Top = 257
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 27
      Alignment = taRightJustify
    end
    object edCalculo5: TCurrencyEdit
      Left = 332
      Top = 257
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 28
    end
    object edSA_RECARGOESP_SOBREFIJO: TCurrencyEdit
      Left = 208
      Top = 279
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 6
      TabOrder = 29
      OnExit = edSA_RECARGOESP_SOBREFIJOExit
    end
    object edCalculo6: TCurrencyEdit
      Left = 270
      Top = 279
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 30
    end
    object IntEdit51: TIntEdit
      Left = 332
      Top = 279
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 31
      Alignment = taRightJustify
    end
    object edSA_REBAJAESP: TCurrencyEdit
      Left = 208
      Top = 301
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 6
      TabOrder = 32
      OnExit = edSA_REBAJAESPExit
    end
    object IntEdit33: TIntEdit
      Left = 270
      Top = 301
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 33
      Alignment = taRightJustify
    end
    object edCalculo5bis: TCurrencyEdit
      Left = 332
      Top = 301
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 34
    end
    object edSA_REBAJAESP_SOBREFIJO: TCurrencyEdit
      Left = 208
      Top = 323
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 6
      TabOrder = 35
      OnExit = edSA_REBAJAESP_SOBREFIJOExit
    end
    object edCalculo6bis: TCurrencyEdit
      Left = 270
      Top = 323
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 36
    end
    object IntEdit53: TIntEdit
      Left = 332
      Top = 323
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 37
      Alignment = taRightJustify
    end
    object IntEdit2: TIntEdit
      Left = 208
      Top = 345
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 81
      Alignment = taRightJustify
    end
    object edCalculo7: TCurrencyEdit
      Left = 270
      Top = 345
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DisplayFormat = '0.00;-0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 82
    end
    object edCalculo8: TCurrencyEdit
      Left = 332
      Top = 345
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 83
    end
    object edAporteSSN: TCurrencyEdit
      Left = 208
      Top = 367
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 38
      Value = 3.000000000000000000
    end
    object edCalculo9: TCurrencyEdit
      Left = 270
      Top = 367
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 39
    end
    object edCalculo10: TCurrencyEdit
      Left = 332
      Top = 367
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 40
    end
    object ed9: TIntEdit
      Left = 208
      Top = 389
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 41
      Alignment = taRightJustify
    end
    object edCalculo11: TCurrencyEdit
      Left = 270
      Top = 389
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DisplayFormat = '0.00;-0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 42
    end
    object edCalculo12: TCurrencyEdit
      Left = 332
      Top = 389
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 43
    end
    object ed060: TCurrencyEdit
      Left = 270
      Top = 411
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 45
      Value = 0.600000000000000000
    end
    object ed12: TIntEdit
      Left = 332
      Top = 411
      Width = 60
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      TabOrder = 46
      Alignment = taRightJustify
    end
    object edALICUOTAPESOS: TCurrencyEdit
      Left = 270
      Top = 433
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 48
      OnExit = DoCambioInv
    end
    object edALICUOTAPORC: TCurrencyEdit
      Left = 332
      Top = 433
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 49
      OnExit = DoCambioInv
    end
  end
  object Panel27: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      792
      30)
    object lbCUIT: TLabel
      Left = 6
      Top = 8
      Width = 24
      Height = 13
      Caption = 'CUIT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inline fraEmpresa: TfraEmpresaSolicitud
      Left = 32
      Top = 4
      Width = 755
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited lbContrato: TLabel
        Left = 520
        Visible = False
      end
      inherited lbFormulario: TLabel
        Left = 627
        ParentFont = True
      end
      inherited edContrato: TIntEdit
        Left = 565
        Visible = False
      end
      inherited cmbRSocial: TArtComboBox
        Width = 494
      end
      inherited edFormulario: TPatternEdit
        Left = 679
      end
    end
  end
  object fpMotivosNoAprobacion: TFormPanel
    Left = 176
    Top = 128
    Width = 480
    Height = 200
    Caption = 'Motivos de NO aprobaci'#243'n autom'#225'tica de la tarifa'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    KeyPreview = True
    OnKeyPress = fpMotivosNoAprobacionKeyPress
    DesignSize = (
      480
      200)
    object memoMotivosNoAprobacion: TMemo
      Left = 8
      Top = 8
      Width = 464
      Height = 153
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        'memoMotivosNoAprobacion')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object btnCerrar: TButton
      Left = 400
      Top = 168
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = btnCerrarClick
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT sa_estado, sa_sumafijatarifa, sa_sumafija, sa_recargoesp_' +
        'sobrefijo, sa_recargosin_sobrefijo, sa_recargosin_montofijo,'
      
        '       sa_porcmasatarifa, sa_porcdescvolumen, sa_porcdescnivel, ' +
        'sa_recargoesp, sa_recargosin, sa_porcmasa, sa_tipodetarifa,'
      
        '       sa_usuarioautoriza, sa_fechaautoriza, sa_idactividad, sa_' +
        'idactividad2, sa_idactividad3, sa_alicuotapesos,'
      
        '       sa_alicuotaporc, sa_usumodif, sa_fechamodif, sa_nivel, sa' +
        '_totempleados, sa_masatotal, sa_fechaafiliacion,'
      '       sa_idformulario, sa_motivosnoaprobaciontarifa'
      '  FROM asa_solicitudafiliacion'
      ' WHERE sa_id = :iidparam'
      '')
    Left = 25
    Top = 62
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iIDParam'
        ParamType = ptInput
      end>
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'PermisoModificar'
      end
      item
        Name = 'PermisoVisualizar'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 64
    Top = 8
  end
  object sdspGerValorOnLine: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'ART.COTIZACION.get_valor_online'
    Left = 26
    Top = 92
    ParamData = <
      item
        DataType = ftFloat
        Name = 'nid_ciiu'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nmasa_salarial'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ncant_trabajador'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nerror'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'serror'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'nsuma_fija'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'nvariable'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'ncosto_capitas'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'ncosto_mensual'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'ncosto_anual'
        ParamType = ptOutput
      end>
  end
end
