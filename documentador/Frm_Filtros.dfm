object Frm_Filtrar: TFrm_Filtrar
  Left = 264
  Top = 117
  BorderStyle = bsDialog
  Caption = 'Filtrar la Estructura de la Base de Datos'
  ClientHeight = 254
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    00000000000000000000000000000000000000000000E6000000000000000000
    000000000000E6000000000000000000000000000000E6000000000000000000
    00000000000F766000000000000000000000000000FEE7660000000000000000
    000000000FEF7E76600000000000000000000000FEFEE7676600000000000000
    0000000FEFEF7E767660000000000000000000FEFEFEE7676766000000000000
    00000FEFEFEF7E7676766000000000000000FEF0000000000006660000000000
    00000008888FFFFF0800000000000000000660FFFFF8888F0706666600000000
    0666608888FFFFFF087066666000000066660FFFFF8888F08780666666000000
    666608888FFFFFF078780666660000006660FFFFF88888F07787066666000000
    06608888FFFFFFF0F778706660000000000FFFFF88888F0F7F87806000000000
    0008888FFFFFFF07F77878000000000000FFFFF88888F00F7F77870000000000
    008888FFFFFFF0F7F7F77800000000000FFFFFFF000000FF7F7F778000000000
    0F000000770FFFFFF7F0007000000000008878787F0FFFF0000FFF0000000000
    888787877700000FFFFFFFFF00000000888878777F7F7FFFFFFFFFFF00000000
    00878787F7F7F7FFFFFFFFF000000000000078777F7F7FFFFFFF000000000000
    00000007F7F7F7FF00000000000000000000000000000000000000000000FFFE
    1FFFFFFE1FFFFFFE1FFFFFFE1FFFFFFC0FFFFFF807FFFFF003FFFFE001FFFFC0
    00FFFF80007FFF00003FFE00001FFC00000FF8000007F0000003E0000001E000
    0001E0000001F0000003F8000007FC00001FF800001FF800001FF000000FF000
    000FF0000007E0000007E0000007F000000FFC00001FFF0000FFFFE00FFF}
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Pnl_Filtros: TPageControl
    Left = 0
    Top = 0
    Width = 305
    Height = 225
    ActivePage = Ts_Fecha
    Align = alTop
    TabOrder = 0
    object Ts_Fecha: TTabSheet
      Caption = 'Fechas y Estados'
      object Pnl_FechaCreacion: TPanel
        Left = 0
        Top = 8
        Width = 297
        Height = 41
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Enabled = False
        TabOrder = 2
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 25
          Height = 13
          Caption = 'Entre'
        end
        object Label2: TLabel
          Left = 156
          Top = 16
          Width = 21
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'y'
        end
        object Dtp_FechCreaIni: TDateTimePicker
          Left = 40
          Top = 12
          Width = 113
          Height = 21
          Date = 36067.583041666700000000
          Time = 36067.583041666700000000
          TabOrder = 0
          OnCloseUp = ActualizarSql
          OnChange = ActualizarSql
        end
        object Dtp_FechCreaFin: TDateTimePicker
          Left = 180
          Top = 12
          Width = 113
          Height = 21
          Date = 36067.583041666700000000
          Time = 36067.583041666700000000
          TabOrder = 1
          OnCloseUp = ActualizarSql
          OnChange = ActualizarSql
        end
      end
      object Chk_FechaCreacion: TCheckBox
        Left = 8
        Top = 0
        Width = 165
        Height = 17
        Caption = 'Fecha de Creaci'#243'n del Objeto'
        TabOrder = 0
        OnClick = Chk_FechaCreacionClick
      end
      object Pnl_FechaModificacion: TPanel
        Left = 0
        Top = 68
        Width = 297
        Height = 41
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Enabled = False
        TabOrder = 3
        object Label3: TLabel
          Left = 8
          Top = 16
          Width = 25
          Height = 13
          Caption = 'Entre'
        end
        object Label4: TLabel
          Left = 156
          Top = 16
          Width = 21
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'y'
        end
        object Dtp_FechUltModIni: TDateTimePicker
          Left = 40
          Top = 12
          Width = 113
          Height = 21
          Date = 36067.583041666700000000
          Time = 36067.583041666700000000
          TabOrder = 0
          OnCloseUp = ActualizarSql
          OnChange = ActualizarSql
        end
        object Dtp_FechUltModFin: TDateTimePicker
          Left = 180
          Top = 12
          Width = 113
          Height = 21
          Date = 36067.583041666700000000
          Time = 36067.583041666700000000
          TabOrder = 1
          OnCloseUp = ActualizarSql
          OnChange = ActualizarSql
        end
      end
      object Chk_FechaModificacion: TCheckBox
        Left = 8
        Top = 60
        Width = 165
        Height = 17
        Caption = 'Fecha de Ultima Modificaci'#243'n'
        TabOrder = 1
        OnClick = Chk_FechaModificacionClick
      end
      object RGrp_Estado: TRadioGroup
        Left = 0
        Top = 123
        Width = 297
        Height = 41
        Columns = 2
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          'V'#225'lido'
          'Inv'#225'lido')
        TabOrder = 5
        OnClick = Chk_EstadoClick
      end
      object Chk_Estado: TCheckBox
        Left = 8
        Top = 120
        Width = 57
        Height = 17
        Caption = 'Estado'
        TabOrder = 4
        OnClick = Chk_EstadoClick
      end
      object chkPorDefecto: TCheckBox
        Left = 8
        Top = 176
        Width = 97
        Height = 17
        Caption = 'Por defecto'
        TabOrder = 6
      end
    end
    object Ts_Personalisar: TTabSheet
      Caption = 'Personalizado'
      ImageIndex = 1
      object Consulta: TLabel
        Left = 4
        Top = 4
        Width = 41
        Height = 13
        Caption = 'Consulta'
      end
      object Panel1: TPanel
        Left = 0
        Top = 20
        Width = 297
        Height = 177
        BevelOuter = bvLowered
        Color = clBtnShadow
        TabOrder = 0
        object Te_Sql: TMemo
          Left = 2
          Top = 55
          Width = 295
          Height = 121
          BorderStyle = bsNone
          TabOrder = 0
        end
        object Memo2: TMemo
          Left = 2
          Top = 2
          Width = 295
          Height = 53
          BorderStyle = bsNone
          Lines.Strings = (
            'SELECT OBJECT_NAME, STATUS'
            'FROM SYS.ALL_OBJECTS'
            'WHERE OWNER = '#39'????'#39
            'AND OBJECT_TYPE = '#39'????'#39)
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  object Cmd_Filtrar: TButton
    Left = 228
    Top = 227
    Width = 75
    Height = 23
    Caption = '&Filtrar'
    TabOrder = 1
    OnClick = Cmd_FiltrarClick
  end
  object Cmd_Cancelar: TButton
    Left = 151
    Top = 227
    Width = 75
    Height = 23
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
end
