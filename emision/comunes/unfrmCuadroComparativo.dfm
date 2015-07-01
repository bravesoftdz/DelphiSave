object frmCuadroComparativo: TfrmCuadroComparativo
  Left = 64
  Top = 175
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Cuadro Comparativo'
  ClientHeight = 255
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbCuadroCuota: TGroupBox
    Left = 0
    Top = 0
    Width = 675
    Height = 156
    Align = alTop
    Caption = ' Cuota '
    TabOrder = 0
    DesignSize = (
      675
      156)
    object Label21: TLabel
      Left = 8
      Top = 19
      Width = 89
      Height = 13
      Alignment = taRightJustify
      Caption = 'Actual Devengado'
    end
    object Label22: TLabel
      Left = 27
      Top = 42
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Actual Pagado'
    end
    object Label23: TLabel
      Left = 49
      Top = 64
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Diferencia'
    end
    object Label24: TLabel
      Left = 18
      Top = 86
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#225'lculo Deveng.'
    end
    object Label31: TLabel
      Left = 234
      Top = 20
      Width = 29
      Height = 13
      Caption = 'Clase:'
    end
    object lblProcesarInfo: TLabel
      Left = 532
      Top = 72
      Width = 131
      Height = 46
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'FALTA PROCESAR INFORMACI'#211'N'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      WordWrap = True
    end
    object Label12: TLabel
      Left = 35
      Top = 110
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Actual Ajuste'
    end
    object Label13: TLabel
      Left = 30
      Top = 132
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#225'lculo Ajuste'
    end
    object Label2: TLabel
      Left = 228
      Top = 86
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dif.Dev.'
    end
    object edDevengadoActual: TCurrencyEdit
      Left = 101
      Top = 16
      Width = 121
      Height = 20
      AutoSize = False
      TabOrder = 0
    end
    object edPagadoActual: TCurrencyEdit
      Left = 101
      Top = 39
      Width = 121
      Height = 20
      AutoSize = False
      TabOrder = 1
    end
    object edDiferenciaActual: TCurrencyEdit
      Left = 101
      Top = 61
      Width = 121
      Height = 20
      AutoSize = False
      TabOrder = 2
    end
    object edDevengadoCalculado: TCurrencyEdit
      Left = 101
      Top = 83
      Width = 121
      Height = 20
      AutoSize = False
      TabOrder = 3
    end
    inline fraClase1: TfraStaticCTB_TABLAS
      Left = 266
      Top = 16
      Width = 254
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      inherited cmbDescripcion: TComboGrid
        Width = 190
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
    object edAjusteActual: TCurrencyEdit
      Left = 101
      Top = 107
      Width = 121
      Height = 20
      AutoSize = False
      TabOrder = 5
    end
    object edAjusteCalculado: TCurrencyEdit
      Left = 101
      Top = 129
      Width = 121
      Height = 20
      AutoSize = False
      TabOrder = 6
    end
    object gbCuadroPeriodo: TGroupBox
      Left = 522
      Top = 7
      Width = 147
      Height = 39
      Anchors = [akTop, akRight]
      TabOrder = 8
      DesignSize = (
        147
        39)
      object Label20: TLabel
        Left = 6
        Top = 15
        Width = 38
        Height = 13
        Caption = 'Per'#237'odo'
      end
      object tbPeriodo1: TToolBar
        Left = 46
        Top = 11
        Width = 96
        Height = 22
        Align = alNone
        Anchors = [akTop, akRight]
        Caption = 'tbPeriodo1'
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        TabOrder = 0
        object tbAnterior1: TToolButton
          Left = 0
          Top = 0
          Hint = 'Anterior (Ctrl -)'
          Caption = 'tbAnterior1'
          ImageIndex = 31
          ParentShowHint = False
          ShowHint = True
          OnClick = tbAnterior1Click
        end
        object edPeriodoCuadro: TPeriodoPicker
          Left = 23
          Top = 0
          Width = 49
          Height = 22
          TabOrder = 0
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205405'
          Periodo.MinPeriodo = '195406'
          WidthMes = 19
          Separation = 0
          ShowButton = False
          ShowOrder = poAnoMes
          ReadOnly = False
          Enabled = True
          OnKeyPress = edPeriodoCuadroKeyPress
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
        object tbSiguiente1: TToolButton
          Left = 72
          Top = 0
          Hint = 'Siguiente (Ctrl +)'
          Caption = 'tbSiguiente1'
          ImageIndex = 32
          ParentShowHint = False
          ShowHint = True
          OnClick = tbSiguiente1Click
        end
      end
    end
    object edDifDevengado: TCurrencyEdit
      Left = 268
      Top = 83
      Width = 121
      Height = 20
      AutoSize = False
      TabOrder = 4
    end
  end
  object gbCuadroTrabajadores: TGroupBox
    Left = 0
    Top = 156
    Width = 675
    Height = 99
    Align = alClient
    Caption = ' Trabajadores '
    TabOrder = 1
    DesignSize = (
      675
      99)
    object Label25: TLabel
      Left = 16
      Top = 46
      Width = 75
      Height = 26
      Alignment = taRightJustify
      Caption = 'Seg'#250'n N'#243'minas'#13#10'Previsto'
    end
    object Label26: TLabel
      Left = 16
      Top = 74
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Seg'#250'n Contrato'
    end
    object Label27: TLabel
      Left = 135
      Top = 9
      Width = 42
      Height = 13
      Caption = 'Cantidad'
    end
    object Label28: TLabel
      Left = 231
      Top = 9
      Width = 72
      Height = 13
      Caption = 'Remuneraci'#243'n '
    end
    object Label29: TLabel
      Left = 338
      Top = 9
      Width = 41
      Height = 13
      Caption = 'Per'#237'odo '
    end
    object Label30: TLabel
      Left = 426
      Top = 9
      Width = 27
      Height = 13
      Caption = 'Tarifa'
    end
    object Label1: TLabel
      Left = 16
      Top = 22
      Width = 75
      Height = 26
      Alignment = taRightJustify
      Caption = 'Seg'#250'n N'#243'minas'#13#10'Actual'
    end
    object edCantEmpleadosNomimaPrev: TIntEdit
      Left = 96
      Top = 47
      Width = 108
      Height = 21
      TabOrder = 0
      Text = '1'
      Alignment = taRightJustify
      Value = 1
    end
    object edRemuneracionNominaPrev: TCurrencyEdit
      Left = 208
      Top = 47
      Width = 121
      Height = 21
      AutoSize = False
      TabOrder = 1
    end
    object edPeriodoNomina: TPeriodoPicker
      Left = 334
      Top = 23
      Width = 49
      Height = 21
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205405'
      Periodo.MinPeriodo = '195406'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poMesAno
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
    object edTarifaVigCuadro: TEdit
      Left = 384
      Top = 23
      Width = 285
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object edCantEmpleadosContrato: TIntEdit
      Left = 96
      Top = 71
      Width = 108
      Height = 21
      TabOrder = 4
      Text = '1'
      Alignment = taRightJustify
      Value = 1
    end
    object edRemuneracionContrato: TCurrencyEdit
      Left = 208
      Top = 71
      Width = 121
      Height = 21
      AutoSize = False
      TabOrder = 5
    end
    object edCantEmpleadosNomimaAct: TIntEdit
      Left = 96
      Top = 23
      Width = 108
      Height = 21
      TabOrder = 6
      Text = '1'
      Alignment = taRightJustify
      Value = 1
    end
    object edRemuneracionNominaAct: TCurrencyEdit
      Left = 208
      Top = 23
      Width = 121
      Height = 21
      AutoSize = False
      TabOrder = 7
    end
  end
end
