object frmHistoriaClinica: TfrmHistoriaClinica
  Left = 257
  Top = 171
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Formulario de Historia Cl'#237'nica'
  ClientHeight = 495
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    594
    495)
  PixelsPerInch = 96
  TextHeight = 13
  object btnGrabar: TBitBtn
    Left = 517
    Top = 29
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Grabar'
    TabOrder = 2
    OnClick = btnGrabarClick
    Glyph.Data = {
      B6010000424DB601000000000000760000002800000022000000100000000100
      0400000000004001000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AA0000000000
      0000AAA88888888888888A000000A8888800000088880A777778888887777800
      0000A8F7778888807F780A7FFFF7777787FF78000400A8F7778078807F780A7F
      FFF7877787FF78006F01A8F7778078807F780A7FFFF7877787FF78028181A8F7
      7778888887780A7FFFFF777777FF78011D01A8F77777777777780A7FFFFFFFFF
      FFFF78001D01A8F77888888887780A7FFF77777777FF78001C02A8F78FFFFFFF
      FF780A7FF7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801
      9E01A8F78FFFFFFFFF780A7FF7FFFFFFFFFF78000600A8F78FFFFFFFFF780A7F
      F7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801A601A8F7
      8FFFFFFFFF080A7FF7FFFFFFFFF078005E02A8F78FFFFFFFFF780A7FF7FFFFFF
      FFF778016E02AA88888888888888AAA77777777777777A006701}
    NumGlyphs = 2
  end
  object btnCancelar: TBitBtn
    Left = 517
    Top = 57
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 3
    OnClick = btnCancelarClick
    Glyph.Data = {
      5E080000424D5E08000000000000360000002800000026000000120000000100
      18000000000028080000C40E0000C40E0000000000000000000000FF0000FF00
      00FF0000009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000C0C0C00
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF00000000FF0000FF003333CC0000FF00009900FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF000000FF00FF0000FF008686868686860C0C0C00FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF004D4D4D
      000000FF0000FF003333CC0066FF0000FF00009900FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      00868686CCCCCC8686860C0C0C00FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF003333CC33
      99FF0066FF0000CC00009900FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF000000FF00FF0000FF0000FF00868686FFFFFFCCCCCC8686
      8633333300FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF004D4D4D00FF00000000FF0000FF0000FF003333CC3399FF0000FF00009900
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF00FF00
      00FF0000FF0000FF0000FF00868686FFFFFFCCCCCC33333300FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0086868600FF0000FF00000000FF
      0000FF0000FF0000FF000000CC3399FF0000CC00009900FF0000FF0000FF0000
      FF0000FF0000FF0000FF000000FF00009900FF0000FF0000FF0000FF0000FF00
      00FF00868686FFFFFF86868633333300FF0000FF0000FF0000FF0000FF0000FF
      0000FF008686860C0C0C00FF0000FF00000000FF0000FF0000FF0000FF0000FF
      000000CC0066FF00009900FF0000FF0000FF0000FF0000FF0000FF000000FF00
      009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00868686CCCCCC
      33333300FF0000FF0000FF0000FF0000FF0000FF008686860C0C0C00FF0000FF
      0000FF00000000FF0000FF0000FF0000FF0000FF0000FF000000CC0000FF0000
      9900FF0000FF0000FF0000FF000000FF00009900FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF008686868686860C0C0C00FF0000FF00
      00FF0000FF008686860C0C0C00FF0000FF0000FF0000FF00000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF000000CC0000FF00009900FF0000FF000000
      FF00009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF008686868686860C0C0C00FF0000FF008686860C0C0C00FF00
      00FF0000FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF000000CC0000FF0000990000FF00009900FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0086
      86868686860C0C0C8686860C0C0C00FF0000FF0000FF0000FF0000FF0000FF00
      000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000CC
      0000FF00009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0086868686868633333300
      FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF000000CC0000FF0000990000CC00009900FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF008686868686860C0C0C8686860C0C0C00FF0000FF0000FF0000
      FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      00CC0000FF00009900FF0000FF000000CC00009900FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008686868686860C0C
      0C00FF0000FF008686860C0C0C00FF0000FF0000FF0000FF0000FF00000000FF
      0000FF0000FF0000FF0000FF000000CC0000CC0000FF00009900FF0000FF0000
      FF0000FF000000CC00009900FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF008686868686868686860C0C0C00FF0000FF0000FF0000FF008686
      860C0C0C00FF0000FF0000FF0000FF00000000FF0000FF0000FF000000CC0000
      CC3399FF0000FF00009900FF0000FF0000FF0000FF0000FF0000FF000000CC00
      009900FF0000FF0000FF0000FF0000FF0000FF00868686868686CCCCCC868686
      0C0C0C00FF0000FF0000FF0000FF0000FF0000FF008686860C0C0C00FF0000FF
      0000FF00000000FF0000FF000000CC3399FF0066FF0000FF00009900FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF000000CC00009900FF0000FF0000
      FF0000FF00868686FFFFFFCCCCCC8686860C0C0C00FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF008686860C0C0C00FF0000FF00000000FF000000CC
      3399FF0066FF0000FF00009900FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF000000CC00FF0000FF00868686FFFFFFCCCCCC86
      86860C0C0C00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF004D4D4D00FF00000000FF006666990000CC0000CC66669900FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0086868686868686868686868600FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      0000}
    NumGlyphs = 2
  end
  object pnlDatosFijos: TPanel
    Left = 0
    Top = 0
    Width = 515
    Height = 112
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvLowered
    BorderWidth = 1
    TabOrder = 0
    DesignSize = (
      515
      112)
    object Label14: TLabel
      Left = 8
      Top = 86
      Width = 92
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F.Recep. Prestador'
      FocusControl = edFechaRPrest
      WordWrap = True
    end
    object Label16: TLabel
      Left = 199
      Top = 86
      Width = 92
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F.Recep. Med.Lab.'
      FocusControl = edFechaRML
      WordWrap = True
    end
    object Label17: TLabel
      Left = 387
      Top = 81
      Width = 124
      Height = 26
      Anchors = [akTop, akRight]
      Caption = 'F9   = Solapa Previa'#13#10'F10 = Solapa Pr'#243'xima'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Panel2: TPanel
      Left = 4
      Top = 4
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      Caption = ' CUIT'
      TabOrder = 0
    end
    object pnlCUIT: TPanel
      Left = 56
      Top = 4
      Width = 93
      Height = 17
      Caption = 'XXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 152
      Top = 4
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      Caption = ' Contrato'
      TabOrder = 2
    end
    object pnlContrato: TPanel
      Left = 204
      Top = 4
      Width = 53
      Height = 17
      Caption = 'XXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object Panel6: TPanel
      Left = 260
      Top = 4
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      Caption = ' R.Social'
      TabOrder = 4
    end
    object pnlRSocial: TPanel
      Left = 312
      Top = 4
      Width = 198
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object Panel8: TPanel
      Left = 4
      Top = 23
      Width = 81
      Height = 17
      Alignment = taLeftJustify
      Caption = ' Establecimiento'
      TabOrder = 6
    end
    object pnlEstableciCodigo: TPanel
      Left = 88
      Top = 23
      Width = 61
      Height = 17
      Caption = 'XXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object pnlEstableciDesc: TPanel
      Left = 152
      Top = 23
      Width = 358
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object Panel10: TPanel
      Left = 4
      Top = 42
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      Caption = ' Fecha'
      TabOrder = 9
    end
    object pnlFecha: TPanel
      Left = 56
      Top = 42
      Width = 93
      Height = 17
      Caption = 'XX/XX/XXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object pnlFechaText: TPanel
      Left = 152
      Top = 42
      Width = 358
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
    end
    object Panel14: TPanel
      Left = 4
      Top = 61
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      Caption = ' CUIL'
      TabOrder = 12
    end
    object pnlCUIL: TPanel
      Left = 56
      Top = 61
      Width = 93
      Height = 17
      Caption = 'XXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
    end
    object Panel16: TPanel
      Left = 152
      Top = 61
      Width = 93
      Height = 17
      Alignment = taLeftJustify
      Caption = ' Apellido y Nombre'
      TabOrder = 14
    end
    object pnlNombre: TPanel
      Left = 248
      Top = 61
      Width = 262
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
    end
    object edFechaRPrest: TDateComboBox
      Left = 105
      Top = 82
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 16
    end
    object edFechaRML: TDateComboBox
      Left = 294
      Top = 82
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 17
    end
  end
  object btnImprimir: TBitBtn
    Left = 517
    Top = 1
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Imprimir'
    Enabled = False
    TabOrder = 4
    OnClick = btnGrabarClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C40E0000C40E0000000000000000000000FF0000FF00
      00FF0000FF0000FF0000FF0000000000000000000000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0004040404
      040404040400FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF00000000000000BFBFBF2F2F2F30303000000000000000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF00040404040404C0C0C029
      292933333304040404040400FF0000FF0000FF0000FF0000FF0000FF0000FF00
      000000000000CFCFCFBFBFBF7F7F7F0000000000004F4F4F5050500000000000
      0000FF0000FF0000FF0000FF0000FF00040404040404CCCCCCC0C0C080808004
      04040404044D4D4D55555504040404040400FF0000FF0000FF0000FF00000000
      DFDFDFD0D0D07F7F7F7F7F7FBFBFBF2F2F2F3030300000000000005F5F5F6060
      6000000000000000FF0000FF00040404DDDDDDD7D7D7808080808080C0C0C029
      29293333330404040404045F5F5F66666604040404040400FF0000FF007F7F7F
      7F7F7FA09F9FCFCFCFBFBFBFBFBFBF2F2F2F3030304F4F4F5050500000000000
      0070707000000000FF0000FF00808080808080A4A0A0CCCCCCC0C0C0C0C0C029
      29293333334D4D4D55555504040404040477777704040400FF007F7F7FA09F9F
      DFDFDFD0D0D0CFCFCFBFBFBFBFBFBF2F2F2F3030304F4F4F5050505F5F5F6060
      6000000000000000FF00808080A4A0A0DDDDDDD7D7D7CCCCCCC0C0C0C0C0C029
      29293333334D4D4D5555555F5F5F66666604040404040400FF007F7F7FFFFFFF
      DFDFDFD0D0D0CFCFCFBFBFBFFFFFFF2F2F2F3030304F4F4F5050505F5F5F6060
      607070707F7F7F000000808080FFFFFFDDDDDDD7D7D7CCCCCCC0C0C0FFFFFF29
      29293333334D4D4D5555555F5F5F6666667777778080800404047F7F7FFFFFFF
      DFDFDFD0D0D0FFFFFFFFFFFFBFBFBFBFBFBFBFBFBF4F4F4F5050505F5F5F6060
      607070707F7F7F000000808080FFFFFFDDDDDDD7D7D7FFFFFFFFFFFFC0C0C0C0
      C0C0C0C0C04D4D4D5555555F5F5F6666667777778080800404047F7F7FFFFFFF
      FFFFFFFFFFFFD0D0D0CFCFCF2F2FFFFF00FFBFBFBFBFBFBFBFBFBF5F5F5F6060
      607070707F7F7F000000808080FFFFFFFFFFFFFFFFFFD7D7D7CCCCCC66666677
      7777C0C0C0C0C0C0C0C0C05F5F5F6666667777778080800404047F7F7FFFFFFF
      DFDFDFD0D0D090FF9000FF00D0D0D0CFCFCFCFCFCF7F7F7F7F7F7F000000BFBF
      BF7070707F7F7F000000808080FFFFFFDDDDDDD7D7D75555554D4D4DD7D7D7CC
      CCCCCCCCCC808080808080040404C0C0C077777780808004040400FF007F7F7F
      7F7F7FFFFFFFDFDFDFBFBFBFD0D0D07F7F7F7F7F7F90FFFF90FFFF000000DFDF
      DF00000000000000FF0000FF00808080808080FFFFFFDDDDDDC0C0C0D7D7D780
      8080808080C0C0C0C0C0C0040404DDDDDD04040404040400FF0000FF0000FF00
      00FF007F7F7F7F7F7FFFFFFF7F7F7F90FFFF90FFFF90FFFFCFFFFFCFFFFF0000
      0000FF0000FF0000FF0000FF0000FF0000FF00808080808080FFFFFF808080C0
      C0C0C0C0C0C0C0C0D7D7D7CCCCCC04040400FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF007F7F7F7F7F7F90FFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFF
      FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF00808080808080C0
      C0C0CCCCCCCCCCCCCCCCCCD7D7D7CCCCCC04040400FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF00909090CFFFFFCFFFFFCFFFFFCFFFFFEFF0
      FFEFF0FF00000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0096
      9696D7D7D7CCCCCCD7D7D7CCCCCCF0FBFFF0FBFF04040404040400FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF00909090CFFFFFEFF0FFEFF0FF9090
      9090909000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF00969696D7D7D7F0FBFFF0FBFF96969696969600FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF00AFAFAFAFAFAFAFAFAF00FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF00B2B2B2B2B2B2B2B2B200FF0000FF0000FF0000FF00}
    NumGlyphs = 2
  end
  object pcHistoriasClinicas: TPageControl
    Left = 0
    Top = 114
    Width = 593
    Height = 381
    ActivePage = tsResultados
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabHeight = 15
    TabOrder = 1
    object TabSheet5: TTabSheet
      Caption = '&0 - Datos Principales'
      ImageIndex = 9
      DesignSize = (
        585
        356)
      object Label41: TLabel
        Left = 0
        Top = 216
        Width = 69
        Height = 26
        Caption = 'Antecedentes '#13#10'Pers&onales'
        FocusControl = edObservaciones
      end
      object Bevel1: TBevel
        Left = 0
        Top = 209
        Width = 587
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Bevel10: TBevel
        Left = -4
        Top = 174
        Width = 587
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Label42: TLabel
        Left = 0
        Top = 96
        Width = 93
        Height = 13
        Caption = '&Secci'#243'n de Trabajo'
        FocusControl = edSeccionTrab
      end
      object lbAntiguedad: TLabel
        Left = 0
        Top = 152
        Width = 89
        Height = 13
        Caption = 'Antig. en el &Puesto'
        FocusControl = edAntiguedad
      end
      object Meses: TLabel
        Left = 156
        Top = 152
        Width = 24
        Height = 13
        Caption = 'A'#241'os'
      end
      object Label43: TLabel
        Left = 0
        Top = 186
        Width = 88
        Height = 13
        Caption = '&M'#233'dico Informante'
        FocusControl = fraMedico.edCodigo
      end
      object Label55: TLabel
        Left = 0
        Top = 124
        Width = 87
        Height = 13
        Caption = 'Puesto de Trabajo'
        FocusControl = edPuestoTrabajo
      end
      object Bevel3: TBevel
        Left = -2
        Top = 83
        Width = 587
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Label13: TLabel
        Left = 0
        Top = 4
        Width = 45
        Height = 13
        Caption = 'Prestador'
      end
      object lbOperativo: TLabel
        Left = 0
        Top = 60
        Width = 46
        Height = 13
        Caption = 'Operativo'
      end
      object Label5: TLabel
        Left = 0
        Top = 32
        Width = 59
        Height = 13
        Caption = 'Tipo Estudio'
      end
      object edObservaciones: TMemo
        Left = 96
        Top = 215
        Width = 489
        Height = 139
        Anchors = [akLeft, akTop, akRight, akBottom]
        MaxLength = 254
        TabOrder = 8
      end
      object edSeccionTrab: TEdit
        Left = 96
        Top = 92
        Width = 489
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 4
      end
      object edAntiguedad: TIntEdit
        Left = 96
        Top = 148
        Width = 53
        Height = 21
        TabOrder = 6
        MaxLength = 3
      end
      inline fraMedico: TfraMedico
        Left = 96
        Top = 182
        Width = 489
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        inherited cmbDescripcion: TArtComboBox
          Width = 433
        end
      end
      object edPuestoTrabajo: TEdit
        Left = 96
        Top = 120
        Width = 489
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 5
      end
      inline fraPrestador: TfraPrestadorAMP
        Left = 96
        Top = 0
        Width = 489
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 52
          Width = 437
        end
        inherited edCodigo: TIntEdit
          Width = 49
        end
      end
      inline fraOperativo: TfraOperativo
        Left = 96
        Top = 56
        Width = 489
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        inherited cmbDescripcion: TArtComboBox
          Width = 437
        end
      end
      inline fraTipoEstudio: TfraTipoEstudio
        Left = 95
        Top = 27
        Width = 322
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 269
        end
      end
      inline fraReconfirmacion: TfraReconfirmacion
        Left = 420
        Top = 28
        Width = 165
        Height = 22
        TabOrder = 2
        inherited cmbEstudio: TArtComboBox
          Width = 97
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&1- General'
      DesignSize = (
        585
        356)
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 585
        Height = 356
        Align = alClient
        Shape = bsFrame
      end
      object Label6: TLabel
        Left = 12
        Top = 4
        Width = 228
        Height = 13
        Caption = '&S'#237'ntomas que el trabajador atribuye a su trabajo:'
      end
      object Bevel4: TBevel
        Left = 8
        Top = 80
        Width = 573
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Label7: TLabel
        Left = 12
        Top = 92
        Width = 27
        Height = 13
        Caption = '&Peso:'
      end
      object Label8: TLabel
        Left = 12
        Top = 116
        Width = 26
        Height = 13
        Caption = '&Talla:'
      end
      object Label10: TLabel
        Left = 204
        Top = 92
        Width = 80
        Height = 13
        Caption = 'Presi'#243'n S&ist'#243'lica:'
      end
      object Label11: TLabel
        Left = 204
        Top = 116
        Width = 87
        Height = 13
        Caption = 'Presi'#243'n &Diast'#243'lica:'
      end
      object Label12: TLabel
        Left = 12
        Top = 140
        Width = 85
        Height = 13
        Caption = 'F&recuencia Pulso:'
      end
      object Label3: TLabel
        Left = 12
        Top = 248
        Width = 148
        Height = 13
        Caption = 'Re&aliza Tratamiento ? (Detallar)'
      end
      object Label53: TLabel
        Left = 152
        Top = 116
        Width = 17
        Height = 13
        Caption = 'cm.'
      end
      object Label54: TLabel
        Left = 152
        Top = 92
        Width = 15
        Height = 13
        Caption = 'kg.'
      end
      object dmObsTrabajador: TMemo
        Left = 12
        Top = 20
        Width = 561
        Height = 57
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 254
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object dbmTratamiento: TMemo
        Left = 12
        Top = 262
        Width = 561
        Height = 89
        Anchors = [akLeft, akTop, akRight, akBottom]
        MaxLength = 254
        ScrollBars = ssVertical
        TabOrder = 10
      end
      object gbTabaquismo: TRadioGroup
        Left = 12
        Top = 160
        Width = 246
        Height = 87
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Tabaquismo (En Cigarrillos)'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'No Fuma'
          ' 1-10'
          '11-20'
          '21-30'
          '31-40'
          '41-50'
          '51-60'
          '61-70'
          '71 o m'#225's')
        TabOrder = 8
      end
      object dbePeso: TIntEdit
        Left = 104
        Top = 88
        Width = 45
        Height = 21
        TabOrder = 1
        Alignment = taRightJustify
        MaxLength = 3
        MaxValue = 250
      end
      object dbePulso: TIntEdit
        Left = 104
        Top = 136
        Width = 45
        Height = 21
        TabOrder = 3
        Alignment = taRightJustify
        MaxLength = 3
        MaxValue = 180
      end
      object edPersSistolica: TIntEdit
        Left = 300
        Top = 88
        Width = 53
        Height = 21
        TabOrder = 4
        OnChange = ChkPresion
        Alignment = taRightJustify
        MaxLength = 3
        MaxValue = 280
      end
      object edPersDiastolica: TIntEdit
        Left = 300
        Top = 112
        Width = 53
        Height = 21
        TabOrder = 5
        OnChange = ChkPresion
        Alignment = taRightJustify
        MaxLength = 3
        MaxValue = 150
      end
      object dbeTalla: TCurrencyEdit
        Left = 104
        Top = 112
        Width = 45
        Height = 21
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 7
        MaxValue = 250.000000000000000000
        MinValue = 60.000000000000000000
        TabOrder = 2
        Value = 60.000000000000000000
      end
      object gbTipoPresion: TGroupBox
        Left = 376
        Top = 84
        Width = 197
        Height = 69
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Presi'#243'n'
        TabOrder = 7
        object rbPresionNormal: TRadioButton
          Left = 40
          Top = 16
          Width = 113
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Normal'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = ChkPresion
        end
        object rbPresionAnormal: TRadioButton
          Left = 40
          Top = 40
          Width = 113
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Anormal'
          TabOrder = 1
          OnClick = ChkPresion
        end
      end
      object gbAlcoholismo2: TGroupBox
        Left = 265
        Top = 160
        Width = 309
        Height = 87
        Anchors = [akTop, akRight]
        Caption = 'Consume Alcohol'
        TabOrder = 9
        object Label56: TLabel
          Left = 8
          Top = 64
          Width = 21
          Height = 13
          Caption = 'Tipo'
        end
        object rbAlcoholNC: TRadioButton
          Left = 8
          Top = 28
          Width = 85
          Height = 17
          Caption = 'No Consume'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbAlcoholClick
        end
        object rbAlcohol250: TRadioButton
          Left = 108
          Top = 16
          Width = 97
          Height = 17
          Caption = '0 a 250 cm'#179
          TabOrder = 1
          OnClick = rbAlcoholClick
        end
        object rbAlcohol500: TRadioButton
          Left = 108
          Top = 40
          Width = 97
          Height = 17
          Caption = '251 a 500 cm'#179
          TabOrder = 2
          OnClick = rbAlcoholClick
        end
        object rbAlcohol1000: TRadioButton
          Left = 208
          Top = 16
          Width = 93
          Height = 17
          Caption = '501 a 1000 cm'#179
          TabOrder = 3
          OnClick = rbAlcoholClick
        end
        object rbAlcoholMas: TRadioButton
          Left = 208
          Top = 40
          Width = 97
          Height = 17
          Caption = '1001 o m'#225's cm'#179
          TabOrder = 4
          OnClick = rbAlcoholClick
        end
        object edTipoAlcohol: TEdit
          Left = 36
          Top = 60
          Width = 269
          Height = 21
          MaxLength = 20
          TabOrder = 5
        end
      end
      object chkSobrepeso: TCheckBox
        Left = 202
        Top = 139
        Width = 97
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Sobrepeso'
        TabOrder = 6
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&2- Hist.Cl'#237'nica'
      DesignSize = (
        585
        356)
      object gbPiel: TGroupBox
        Left = 0
        Top = -1
        Width = 583
        Height = 141
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = '1- Piel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          583
          141)
        object Label27: TLabel
          Left = 8
          Top = 76
          Width = 28
          Height = 13
          Caption = '&Otros:'
        end
        object Bevel5: TBevel
          Left = 4
          Top = 66
          Width = 577
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object dbePiel_Otros: TEdit
          Left = 40
          Top = 72
          Width = 539
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          MaxLength = 100
          TabOrder = 1
        end
        object cgPiel: TCheckGroup
          Tag = 1
          Left = 8
          Top = 12
          Width = 569
          Height = 53
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Columns = 4
          Items.Strings = (
            '&Ves'#237'culas'
            '&Prurito'
            '&Eritema'
            '&Ulceraci'#243'n'
            '&Boton de Aceite'
            'Hipe&rpigmentaci'#243'n'
            '&Fisuras'
            'P&etequias'
            'Ec&zema'
            '&Hipopigmentaci'#243'n'
            'H&iperqueratosis'
            '&Onicomicosis')
          OnItemChange = OnCheckGroupChange
          BorderStyle = bsNone
          Value = '000000000000'
        end
      end
      object gbOjos: TGroupBox
        Left = 0
        Top = 143
        Width = 583
        Height = 105
        Anchors = [akLeft, akRight, akBottom]
        Caption = '2- Ojos'
        TabOrder = 1
        DesignSize = (
          583
          105)
        object Label32: TLabel
          Left = 8
          Top = 52
          Width = 169
          Height = 13
          Caption = 'Alteraciones In&ducidas por A. de T.:'
        end
        object Llabel: TLabel
          Left = 8
          Top = 80
          Width = 166
          Height = 13
          Caption = 'Agudeza Visual:         O&jo Derecho:'
        end
        object Label34: TLabel
          Left = 265
          Top = 80
          Width = 65
          Height = 13
          Caption = 'Ojo Iz&quierdo:'
        end
        object Label1: TLabel
          Left = 220
          Top = 80
          Width = 20
          Height = 13
          Caption = '/ 10'
        end
        object Label2: TLabel
          Left = 372
          Top = 80
          Width = 20
          Height = 13
          Caption = '/ 10'
        end
        object dbeOjos_Alteracion: TEdit
          Left = 184
          Top = 52
          Width = 395
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 100
          TabOrder = 1
        end
        object edOjos_AgudezaD: TIntEdit
          Left = 184
          Top = 76
          Width = 30
          Height = 21
          TabOrder = 2
          MaxLength = 2
          MaxValue = 10
        end
        object edOjos_AgudezaI: TIntEdit
          Left = 335
          Top = 77
          Width = 30
          Height = 21
          TabOrder = 3
          MaxLength = 2
          MaxValue = 10
        end
        object cgOjos: TCheckGroup
          Tag = 2
          Left = 8
          Top = 12
          Width = 569
          Height = 37
          Anchors = [akLeft, akTop, akRight]
          Caption = 'cgOjos'
          TabOrder = 0
          Columns = 3
          Items.Strings = (
            'Irri&taci'#243'n conjuntival'
            '&Cicatrices en cornea'
            'Nist'#225'&gmus'
            'Vi&si'#243'n monocular'
            '&Alteraci'#243'n en la visi'#243'n de colores'
            'Agudeza visual &disminuida')
          OnItemChange = OnCheckGroupChange
          BorderStyle = bsNone
          Value = '000000'
        end
      end
      object cgBoca: TCheckGroup
        Tag = 3
        Left = 0
        Top = 251
        Width = 285
        Height = 102
        Anchors = [akLeft, akBottom]
        Caption = '3 - Cavidad Oral'
        TabOrder = 2
        Items.Strings = (
          'Sa&ngrado de las Enc'#237'as'
          'Ribete gingiva&l'
          '&Caries m'#250'ltiples'
          'Alteraci&ones en el esmalte dentario'
          'Faltan piezas &Dentarias')
        OnItemChange = OnCheckGroupChange
        Value = '00000'
      end
      object cgNariz: TCheckGroup
        Tag = 4
        Left = 292
        Top = 251
        Width = 289
        Height = 102
        Anchors = [akLeft, akRight, akBottom]
        Caption = '4- Nariz'
        TabOrder = 3
        Items.Strings = (
          'Insu&ficiencia Respiratoria Nasal'
          'Mucosa Nasal &P'#225'lida'
          'Mucosa Nasal &Ulcerada:'
          'Mucosa Nasal P&erforaci'#243'n tabique nasal')
        OnItemChange = OnCheckGroupChange
        Value = '0000'
      end
    end
    object TabSheet3: TTabSheet
      Caption = '&3- Hist.Cl'#237'nica'
      DesignSize = (
        585
        356)
      object rgVarices: TRadioGroup
        Left = 488
        Top = 90
        Width = 94
        Height = 77
        Anchors = [akRight, akBottom]
        Caption = ' Varices '
        Items.Strings = (
          'No'
          'Grado 1'
          'Grado 2 '
          'Grado 3')
        TabOrder = 3
      end
      object gbCuello: TGroupBox
        Left = 0
        Top = 0
        Width = 584
        Height = 84
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = '5- Cuello'
        TabOrder = 0
        DesignSize = (
          584
          84)
        object dbeCuello_Obs: TEdit
          Left = 8
          Top = 16
          Width = 570
          Height = 62
          Anchors = [akLeft, akTop, akRight, akBottom]
          MaxLength = 100
          TabOrder = 0
        end
      end
      object rgOsteoartucular: TRadioGroup
        Left = 0
        Top = 307
        Width = 582
        Height = 45
        Anchors = [akLeft, akRight, akBottom]
        Caption = '9 - Examen Osteoarticular'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Normal'
          'Anormal')
        TabOrder = 5
      end
      object cgTorax: TCheckGroup
        Tag = 6
        Left = 0
        Top = 89
        Width = 247
        Height = 77
        Anchors = [akLeft, akRight, akBottom]
        Caption = '6- T'#243'rax'
        TabOrder = 1
        Columns = 2
        Items.Strings = (
          '&Rales Crepitantes'
          'D&eformaciones'
          'Ronc&us'
          '&Sibilancias'
          '&Disnea')
        OnItemChange = OnCheckGroupChange
        Value = '00000'
      end
      object cgCorazon: TCheckGroup
        Tag = 7
        Left = 252
        Top = 89
        Width = 232
        Height = 77
        Anchors = [akRight, akBottom]
        Caption = '7- Cardiocirculatorio      7'#39'- Circulatorio Venoso'
        TabOrder = 2
        Columns = 2
        Items.Strings = (
          '&Arritmia'
          'So&plo'
          '&Hemorroides')
        OnItemChange = OnCheckGroupChange
        Value = '000'
      end
      object gbAbdomen: TGroupBox
        Left = 0
        Top = 169
        Width = 582
        Height = 137
        Anchors = [akLeft, akRight, akBottom]
        Caption = '8- Abdomen'
        TabOrder = 4
        DesignSize = (
          582
          137)
        object Label18: TLabel
          Left = 7
          Top = 113
          Width = 28
          Height = 13
          Caption = 'O&tras:'
        end
        object SpeedButton1: TSpeedButton
          Left = 549
          Top = 13
          Width = 23
          Height = 22
          Hint = 'Limpiar Hernia Inguinal'
          Anchors = [akRight, akBottom]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF1616CA0000DDFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2727E6
            0000FF0000EBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF0000D8FF00FFFF00FFFF00FF4D4DF31313FD0000FF0000CBFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF0000E1FF00FFFF00FFFF00FFFF00FFFF00FF
            5252F90B0BFD0000FF0000C9FF00FFFF00FFFF00FFFF00FF0000B70000F40000
            DFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4646F30707FF0000FD0000C7FF
            00FFFF00FF0000C50000FF0000F0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF4949F80E0EFB0000F30000C20000D20000FF0000EEFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3D3DE20909F900
            00FF0000FF0000EBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF0000C30000E90000FF0808FE0000FF0000D8FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF0000C60000E10000F50000FF0B0BFE2424F2FF
            00FF3C3CEE1616F30000EF0000D1FF00FFFF00FFFF00FFFF00FFFF00FF1818E7
            0C0CFF1717FA2C2CF2FF00FFFF00FFFF00FFFF00FFFF00FF3636EE1919F00707
            DFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF2F2FE81F1FE4FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 549
          Top = 45
          Width = 23
          Height = 22
          Hint = 'Limpiar Hernia Crural'
          Anchors = [akRight, akBottom]
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001616
            CA000000DD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002727
            E6000000FF000000EB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000D800FF00FF00FF00FF00FF00FF004D4D
            F3001313FD000000FF000000CB00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000000E100FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF005252F9000B0BFD000000FF000000C900FF00FF00FF00FF00FF00FF00FF00
            FF000000B7000000F4000000DF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF004646F3000707FF000000FD000000C700FF00FF00FF00FF000000
            C5000000FF000000F000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF004949F8000E0EFB000000F3000000C2000000D2000000
            FF000000EE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF003D3DE2000909F9000000FF000000FF000000
            EB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000000C3000000E9000000FF000808FE000000FF000000
            D800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            C6000000E1000000F5000000FF000B0BFE002424F200FF00FF003C3CEE001616
            F3000000EF000000D100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001818
            E7000C0CFF001717FA002C2CF200FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF003636EE001919F0000707DF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF002F2FE8001F1FE400FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton2Click
        end
        object dbeAbdomen_Otras: TEdit
          Left = 40
          Top = 109
          Width = 537
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 50
          TabOrder = 3
        end
        object gbHernia_Inguinal: TRadioGroup
          Left = 273
          Top = 7
          Width = 271
          Height = 30
          Anchors = [akTop, akRight]
          Caption = 'Hernia Inguinal'
          Columns = 3
          Items.Strings = (
            'Derecha'
            'Izquierda'
            'Bilateral')
          TabOrder = 1
        end
        object gbHernia_Crural: TRadioGroup
          Left = 273
          Top = 39
          Width = 271
          Height = 30
          Anchors = [akTop, akRight]
          Caption = 'Hernia Crural'
          Columns = 3
          Items.Strings = (
            'Derecha'
            'Izquierda'
            'Bilateral')
          TabOrder = 2
        end
        object cgAbdomen: TCheckGroup
          Tag = 8
          Left = 8
          Top = 16
          Width = 128
          Height = 63
          Caption = 'cgAbdomen'
          TabOrder = 0
          Items.Strings = (
            '&Hepatomegalia'
            '&Cicatrices quir'#250'rgicas'
            'Espleno&megalia')
          OnItemChange = OnCheckGroupChange
          BorderStyle = bsNone
          Value = '000'
        end
        object chbHernia_Umbilical: TCheckBox
          Left = 273
          Top = 76
          Width = 97
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Hernia Umbilical'
          TabOrder = 4
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = '&4- Hist.Cl'#237'nica'
      DesignSize = (
        585
        356)
      object grpEdemasPretibiales: TGroupBox
        Left = 0
        Top = 233
        Width = 584
        Height = 44
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = '12 - Edemas Pretibiales'
        TabOrder = 2
        DesignSize = (
          584
          44)
        object dbeEdemasPre_Obs: TEdit
          Left = 8
          Top = 14
          Width = 570
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          MaxLength = 100
          TabOrder = 0
        end
      end
      object grpColumnaVertebral: TGroupBox
        Left = 0
        Top = 0
        Width = 584
        Height = 168
        Anchors = [akLeft, akTop, akRight]
        Caption = '10 - Columna Vertebral'
        TabOrder = 0
        DesignSize = (
          584
          168)
        object Label9: TLabel
          Left = 109
          Top = 69
          Width = 80
          Height = 13
          Caption = 'Lasegue positivo'
        end
        object Label44: TLabel
          Left = 8
          Top = 132
          Width = 181
          Height = 13
          Caption = 'Deformidades (lordosis, escoliosis, etc)'
        end
        object Label45: TLabel
          Left = 89
          Top = 86
          Width = 100
          Height = 13
          Caption = 'Cicatrices quir'#250'rgicas'
        end
        object Label46: TLabel
          Left = 108
          Top = 117
          Width = 81
          Height = 13
          Caption = 'Puntos dolorosos'
        end
        object Label47: TLabel
          Left = 88
          Top = 101
          Width = 101
          Height = 13
          Caption = 'Contractura Muscular'
        end
        object Label4: TLabel
          Left = 58
          Top = 148
          Width = 131
          Height = 13
          Caption = 'Limitaciones en la movilidad'
        end
        object Label19: TLabel
          Left = 78
          Top = 20
          Width = 111
          Height = 13
          Caption = 'Hernia Discal Obstruida'
        end
        object Label20: TLabel
          Left = 70
          Top = 38
          Width = 119
          Height = 13
          Caption = 'Espondiloart.Lumbosacra'
        end
        object Label21: TLabel
          Left = 117
          Top = 54
          Width = 73
          Height = 13
          Caption = 'Espondiloartritis'
        end
        object rgEspondiloartritis: TJvRadioGroup
          Left = 190
          Top = 41
          Width = 384
          Height = 28
          Caption = 'JvRadioGroup1'
          Columns = 3
          Ctl3D = True
          Items.Strings = (
            'Secundaria'
            'Degenerativa'
            'NO')
          ParentCtl3D = False
          TabOrder = 2
          CaptionVisible = False
          EdgeInner = esNone
          EdgeOuter = esNone
        end
        object rgEspondiloart: TJvRadioGroup
          Left = 190
          Top = 24
          Width = 259
          Height = 28
          Caption = 'JvRadioGroup1'
          Columns = 2
          Ctl3D = True
          Items.Strings = (
            'SI'
            'NO')
          ParentCtl3D = False
          TabOrder = 1
          CaptionVisible = False
          EdgeInner = esNone
          EdgeOuter = esNone
        end
        object rbLasegue_Izq: TRadioButton
          Left = 198
          Top = 67
          Width = 113
          Height = 17
          Hint = 'Doble click para desmarcar'
          Anchors = [akTop]
          Caption = 'Lasegue Izquierdo'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnDblClick = rbLasegue_IzqDblClick
        end
        object rbLasegue_Der: TRadioButton
          Left = 322
          Top = 67
          Width = 113
          Height = 17
          Hint = 'Doble click para desmarcar'
          Anchors = [akTop]
          Caption = 'Lasegue Derecho'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnDblClick = rbLasegue_DerDblClick
        end
        object cgColDeformidades: TCheckGroup
          Tag = 4
          Left = 200
          Top = 132
          Width = 373
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
          Columns = 3
          Items.Strings = (
            'CC'
            'CD'
            'CLS')
          OnItemChange = cgColumnaItemChange
          BorderStyle = bsNone
          Value = '000'
        end
        object cgColPuntosDolosos: TCheckGroup
          Tag = 3
          Left = 200
          Top = 116
          Width = 373
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
          Columns = 3
          Items.Strings = (
            'CC'
            'CD'
            'CLS')
          OnItemChange = cgColumnaItemChange
          BorderStyle = bsNone
          Value = '000'
        end
        object cgColContractura: TCheckGroup
          Tag = 1
          Left = 200
          Top = 100
          Width = 373
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          Columns = 3
          Items.Strings = (
            'CC'
            'CD'
            'CLS')
          OnItemChange = cgColumnaItemChange
          BorderStyle = bsNone
          Value = '000'
        end
        object cgColCicatrices: TCheckGroup
          Left = 200
          Top = 84
          Width = 373
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          Columns = 3
          Items.Strings = (
            'CC'
            'CD'
            'CLS')
          OnItemChange = cgColumnaItemChange
          BorderStyle = bsNone
          Value = '000'
        end
        object cgColLimitaciones: TCheckGroup
          Tag = 5
          Left = 200
          Top = 148
          Width = 373
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 9
          Columns = 3
          Items.Strings = (
            'CC'
            'CD'
            'CLS')
          OnItemChange = cgColumnaItemChange
          BorderStyle = bsNone
          Value = '000'
        end
        object rgHerniaDiscal: TJvRadioGroup
          Left = 190
          Top = 8
          Width = 259
          Height = 28
          Caption = 'rgHerniaDiscal'
          Columns = 2
          Ctl3D = True
          Items.Strings = (
            'SI'
            'NO')
          ParentCtl3D = False
          TabOrder = 0
          CaptionVisible = False
          EdgeInner = esNone
          EdgeOuter = esNone
        end
      end
      object cgExtremidades: TCheckGroup
        Tag = 11
        Left = 0
        Top = 168
        Width = 584
        Height = 65
        Anchors = [akLeft, akTop, akRight]
        Caption = '11 - Extremidades'
        TabOrder = 1
        Columns = 4
        Items.Strings = (
          'Miembro S.&D.'
          'Miemb&ro S.I.'
          'Ma&no Derecha'
          'Mano I&zquierda'
          'D&edos Mano Der.'
          'Ded&os Mano Izq.'
          '&Miembro I. Der'
          'Miembro I. Iz&q.'
          'Rodilla Derec&ha'
          'Rodi&lla Izquierda'
          'P&ie Derecho'
          'Pie Izq&uierdo')
        OnItemChange = OnCheckGroupChange
        Value = '000000000000'
      end
      object cgNeurologico: TCheckGroup
        Tag = 13
        Left = 0
        Top = 278
        Width = 584
        Height = 77
        Anchors = [akLeft, akRight, akBottom]
        Caption = '13 - Examen neurol'#243'gico'
        TabOrder = 3
        Columns = 3
        Items.Strings = (
          'Romber&g Anormal'
          'M&archa'
          'Sensi&bilidad'
          '&Coordinaci'#243'n'
          '&Temblor'
          '&Prueba dedo-nariz'
          'Refle&jos'
          'Alt.Importante del sentido del ol&fato')
        OnItemChange = OnCheckGroupChange
        Value = '00000000'
      end
    end
    object tsAlteracionesClinicas: TTabSheet
      Caption = '&5- Alteraciones Cl'#237'nicas'
      object dbgItemsObs: TDBGrid
        Left = 0
        Top = 30
        Width = 585
        Height = 326
        Align = alClient
        DataSource = dsObserv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgItemsObsDblClick
        OnKeyPress = dbgItemsObsKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'ITEM'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEN'
            Title.Caption = 'Orden'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 183
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACIONES'
            Title.Caption = 'Observaciones'
            Width = 278
            Visible = True
          end>
      end
      object cBarAltClinic: TCoolBar
        Left = 0
        Top = 0
        Width = 585
        Height = 30
        Bands = <
          item
            Control = tbarAltClinic
            ImageIndex = -1
            MinHeight = 26
            Width = 581
          end>
        object tbarAltClinic: TToolBar
          Left = 9
          Top = 0
          Width = 568
          Height = 26
          Align = alNone
          BorderWidth = 1
          EdgeBorders = []
          Flat = True
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          TabOrder = 0
          object tbAgregarDC: TToolButton
            Left = 0
            Top = 0
            Hint = 'Agregar'
            ImageIndex = 0
            OnClick = tbAgregarDCClick
          end
          object tbModificarDC: TToolButton
            Left = 23
            Top = 0
            Hint = 'Modificar'
            Caption = 'tbEstudiosModificar'
            ImageIndex = 1
            OnClick = tbModificarDCClick
          end
          object tbEliminarDC: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar'
            Caption = 'tbEstudiosEliminar'
            ImageIndex = 2
            OnClick = tbEliminarDCClick
          end
          object ToolButton1: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object tbAltAutomatica: TToolButton
            Left = 77
            Top = 0
            Hint = 'GrIlla Autom'#225'tica'
            ImageIndex = 16
            ParentShowHint = False
            ShowHint = True
            Style = tbsCheck
          end
        end
      end
      object fpDatosClinicos: TFormPanel
        Left = 16
        Top = 68
        Width = 405
        Height = 169
        Caption = 'Datos Cl'#237'nicos'
        FormWidth = 0
        FormHeigth = 0
        Position = poScreenCenter
        ActiveControl = edDcObservaciones
        Constraints.MinHeight = 89
        Constraints.MinWidth = 300
        DesignSize = (
          405
          169)
        object Label15: TLabel
          Left = 4
          Top = 12
          Width = 20
          Height = 13
          Caption = 'Item'
        end
        object Label52: TLabel
          Left = 4
          Top = 36
          Width = 34
          Height = 13
          Caption = 'Observ'
        end
        object Bevel11: TBevel
          Left = 4
          Top = 136
          Width = 397
          Height = 5
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object edDcItemDesc: TEdit
          Left = 108
          Top = 8
          Width = 293
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
        object edDcItem: TPatternEdit
          Left = 40
          Top = 8
          Width = 53
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          Alignment = taCenter
        end
        object edDcObservaciones: TMemo
          Left = 40
          Top = 32
          Width = 361
          Height = 101
          Anchors = [akLeft, akTop, akRight, akBottom]
          MaxLength = 250
          TabOrder = 2
        end
        object btnDcAceptar: TButton
          Left = 244
          Top = 140
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 4
          OnClick = btnDcAceptarClick
        end
        object btnDcCancelar: TButton
          Left = 324
          Top = 140
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 5
        end
        object edDcItemOrden: TIntEdit
          Left = 92
          Top = 8
          Width = 17
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 3
          Alignment = taCenter
        end
      end
    end
    object tsResultados: TTabSheet
      Caption = '&6- Resultados'
      OnEnter = tsResultadosEnter
      DesignSize = (
        585
        356)
      object Bevel15: TBevel
        Left = 0
        Top = 0
        Width = 585
        Height = 356
        Align = alClient
        Shape = bsFrame
      end
      object Label31: TLabel
        Left = 104
        Top = 20
        Width = 137
        Height = 13
        Caption = 'Resultados del Examen:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Image1: TImage
        Left = 4
        Top = 4
        Width = 92
        Height = 42
        AutoSize = True
        Picture.Data = {
          07544269746D61707E2D0000424D7E2D00000000000036000000280000005C00
          00002A0000000100180000000000482D0000C40E0000C40E0000000000000000
          000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000007F00007F00FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000007F00007FFFFFFFFFFFFF
          00007F00007F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F00007F
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000007F00007F00FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000007F00007FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F00007F00FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          007F00007FFFFFFFFFFFFF00007F00007F00FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
          7F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F00007F00FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00007F00007F00FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF00007F00007F00FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000007F0000
          7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          007F00007F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000007F00007F
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF00
          00FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF00007F00007F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F00007F00
          FF0000FF0000FF0000007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF0000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF00007F00
          007F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000007F00007FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F00007F00007FFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFF
          FFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF00
          00FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF00007F00007F00FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00FFFF00FFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF00
          00FF0000FFFFFFFFFFFFFFFFFFFFFFFF00007F00007F00FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000007F00007FFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00007F00007FFFFFFFFFFFFFFF0000FF0000000000FFFFFFFF
          FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FFFF
          FFFFFFFFFFFFFFFFFFFF00007F00007F00FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00007F00007FFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0000FF0000FFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFF
          FFFFFFFF00007F00007F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000007F00007FFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F0000
          7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF00
          00FFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF0000
          7F00007F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000007F
          00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FF0000FFFFFFFFFFFFFF0000FF0000000000FFFFFFFFFFFFFF0000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F00007FFFFFFF00FF
          FF00FFFFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFF0000FF0000
          FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF00007F00007F00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF000000
          0000FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F00007F00FFFF00FFFF00FFFFFFFF
          FFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFF0000FF0000FF0000FF0000
          FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF00007F00007F00FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000007F00007FFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF00
          00FFFFFFFFFFFFFF0000FF0000000000FFFFFFFFFFFFFF0000FF0000FFFFFFFF
          FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00007F00007F00FFFF00FFFF00FFFFFFFFFFFFFFFF0000
          FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF00007F00007F00FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF00BFBFBFBFBFBFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF0000000000FFFF
          FFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00007F00007F00FFFF00FFFF00FFFFFFFFFFFFFFFF0000FF0000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
          000000FF0000FF0000FFFFFFFFFFFFFF0000FF0000000000FFFFFFFFFFFFFF00
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF
          0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F
          00007F00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBFBFBFBFBFBF00FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF0000000000007F7F7FBFBFBF7F7F7FFFFFFFFFFFFFFFFFFFFF0000
          FF0000FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0000FF0000FFFFFFFFFFFFFF0000FF0000000000FFFFFFFFFFFFFF0000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F00007F00FFFF
          00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF00FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFF000000000000007F7F00FFFF00
          FFFF7F7F7F000000FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF00
          00000000FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFFFF
          FFFFFFFFFFBFBFBFBFBFBFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFBFBFBFBFBFBF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00BFBFBFBFBF
          BF000000000000007F7F00FFFF0000007F7F7F7F7F7FFFFFFFFFFFFFFF0000FF
          0000FFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FFFFFFFFFFFFFF0000FF0000000000FFFFFFFFFFFFFF0000FF0000FFFF
          FFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFFFF00FFFF00FF
          FF00FFFFFFFFFFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF00FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF00000000000000007F7F00FFFF00FFFF7F7F
          7F000000FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF0000000000
          FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFF
          FFBFBFBFBFBFBFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BFBFBFBFBFBFFFFFFF00007F00007F00FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000
          000000007F7F00FFFF00FFFF7F7F7F000000BFBFBFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF
          FFFFFFFFFFFF0000FF0000000000FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFF
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFF00FFFF00FFFFFFFFFFFFFF
          FFFFFF00007F00007F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF00000000000000007F7F00FFFF00FFFF7F7F7F000000
          00FF0000FF0000FF00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF0000000000FFFFFFFF
          FFFFFF0000FF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
          BFBFBFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBF
          BFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFF00007F
          00007F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000000000
          7F7F00FFFF00FFFF7F7F7F00000000FF0000FF0000FF0000FF0000FF0000FF00
          00FF00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFF
          FFFF0000FF0000000000FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF
          FFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
          7F7F7FFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFF00007F00007F00FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF00000000000000007F7F00FFFF00FFFF7F7F7F00000000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00BFBFBF
          BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF00
          00000000FFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFF
          FFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFF
          FFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF00007F00007F00FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000007F7F00FF
          FF00FFFF7F7F7F00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00BFBFBFBFBFBFFFFFFF
          FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF0000FFFFFFFFFF
          FFFFFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFBFBFBFBFBFBF
          FFFFFF000000BFBFBFBFBFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFF0000007F
          7F7FFFFFFFFFFFFFFFFFFF00007F00007F00FF0000FF0000FF0000FF0000FF00
          00FF00000000000000007F7F00FFFF00FFFF7F7F7F00000000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFF
          FFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F
          7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF7F7F
          7F7F7F7FFFFFFFFFFFFF0000007F7F7FFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF00
          FF0000FF0000FF0000FF0000FF0000FF000000000000007F000000FFFF00FFFF
          7F7F7F00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFBFBFBFBFBFBF00FF0000FF00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFF00FFFFFFFFFFFFFF7F7F7F7F7F7F000000FFFFFFFFFFFF7F7F7FFFFF
          FFFFFFFFFFFFFFBFBFBFBFBFBF00FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000007F7F00007F7F7F7F00007F7F7F00FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF00BFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBF00FF0000FF0000FF00
          00FF0000FF0000FF00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F
          7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F
          FFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF00FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF0000FF7F
          000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00BF
          BFBFBFBFBF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFF
          FFFFFFBFBFBFBFBFBF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00BFBFBF
          BFBFBFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF00FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00BFBFBFBFBFBFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFBF
          BFBFBFBFBF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFF
          FFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F
          7FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF00FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBF
          BF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF00BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFBFBFBFBFBFBF00FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00BF
          BFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF00FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00BFBFBFBFBFBFFF
          FFFFFFFFFFBFBFBFBFBFBF00FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF00BFBFBFBFBFBF00FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF00}
        Transparent = True
      end
      object rgResultados: TRadioGroup
        Left = 44
        Top = 50
        Width = 494
        Height = 274
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemIndex = 0
        Items.Strings = (
          '&El resultado del examen es normal'
          'El resultado del examen es &anormal'
          '&Debe ampliarse el estudio del paciente'
          '&Se requiere derivaci'#243'n para tratamiento'
          'S&e requiere cambio temporal de tareas'
          'Se &requiere cambio definitivo de tareas'
          
            'Se req&uiere evaluaci'#243'n de incapacidad y presentaci'#243'n ante comis' +
            'iones m'#233'dicas')
        TabOrder = 0
      end
    end
  end
  object dsAltera: TDataSource
    DataSet = qryAlteras
    Left = 264
    Top = 40
  end
  object qryAlteras: TQuery
    SessionName = 'ssAbm_2'
    Left = 292
    Top = 40
  end
  object qryAnalisis: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT TE_MEDICO, TE_SECCION, TE_PUESTO, TE_ANTIGPUESTO, TE_ANTE' +
        'CEDENTES, TE_SINTOMAS, TE_OBSERV, TE_PESO, TE_TALLA, TE_PULSO, T' +
        'E_SISTOLE, TE_DIASTOLE, TE_TABAQUISMO, TE_ALCOHOLISMO, TE_ALCOHO' +
        'L_TIPO, TE_TRATAMIENT, TE_PIEL, TE_PIEL_OTROS, TE_OJO, TE_OJOS_A' +
        'LTE, TE_OJOS_AGUDD, TE_OJOS_AGUDI, TE_BOCA, TE_NARIZ, TE_CUELLO,' +
        ' TE_TORAX, TE_CORAZON, TE_ABDOMEN, TE_ABDO_OTROS, TE_HERNIA_ING,' +
        ' TE_HERNIA_CRU, TE_EXTREMIDAD, TE_EDEMAS, TE_NEUROLOGIC, TE_OPAC' +
        '_PROFI, TE_OPAC_PROFU, TE_OPAC_REDON, TE_OPAC_IRREG, TE_OPAC_GRA' +
        'ND, TE_OPAC_PLEUR, TE_CALCIFIC, TE_COLUMDEFO, TE_COLUMCICA, TE_C' +
        'OLUMDOLO, TE_COLUMCONT, TE_COLUMLIMIT, TE_COLUMLASEG, TE_INCARES' +
        'P, TE_INCARESPTO, TE_OSTEOARTICULAR, TE_ESPIROMETRIA, TE_ESPIRO_' +
        'GRADO, TE_USUALTA, TE_FECHAALTA, TE_VARICES'
      'FROM ATE_EXATRAB'
      ''
      'where 1=2')
    Left = 292
    Top = 12
  end
  object mdDatosClinicos: TRxMemoryData
    FieldDefs = <>
    Left = 420
    Top = 12
    object mdDatosClinicosITEM: TStringField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object mdDatosClinicosDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object mdDatosClinicosORDEN: TFloatField
      FieldName = 'ORDEN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object mdDatosClinicosOBSERVACIONES: TStringField
      FieldName = 'OBSERVACIONES'
      Size = 250
    end
  end
  object dsObserv: TDataSource
    DataSet = mdDatosClinicos
    Left = 392
    Top = 12
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 328
    Top = 13
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 356
    Top = 13
  end
  object PrintDialog: TPrintDialog
    Left = 328
    Top = 41
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16455
        OnShortCutPress = btnGrabarClick
        LinkControl = btnGrabar
      end
      item
        Key = 120
        OnShortCutPress = ShortCutControlShortCuts1ShortCutPress
        LinkControl = pcHistoriasClinicas
      end
      item
        Key = 121
        OnShortCutPress = ShortCutControlShortCuts2ShortCutPress
        LinkControl = pcHistoriasClinicas
      end>
    Left = 356
    Top = 40
  end
end
