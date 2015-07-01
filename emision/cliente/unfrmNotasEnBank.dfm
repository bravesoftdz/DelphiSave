object FrmNotasEnBank: TFrmNotasEnBank
  Left = 264
  Top = 96
  Width = 681
  Height = 573
  Caption = 'Notas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlVistaPrevia: TPanel
    Left = 7
    Top = 23
    Width = 659
    Height = 521
    BevelOuter = bvNone
    TabOrder = 0
    object imgBank: TImgEdit
      Left = 0
      Top = 29
      Width = 659
      Height = 473
      Align = alClient
      TabOrder = 0
      ControlData = {
        010002001C440000E3300000600000000100013E5C5C6E746461746162616E6B
        5C494D414745533130245C454D4953494F4E5C303030315C3035313231355F31
        37343833335C30303030303032412E544946000000000008496D674564697431
        010000010000000000C84200000200FF000000FFFF00000000FF000000000352
        E30B918FCE119DE300AA004BB851010000009001C0D401000D4D532053616E73
        20536572696600000000000001000000000000010000000452E30B918FCE119D
        E300AA004BB8516C7400006C00000001000000580000000000000000000000FF
        FFFFFFFFFFFFFF00000000000000006C520000B83D000020454D46000001006C
        00000002000000010000000000000000000000000000002003000058020000D3
        0000009E0000000E000000140000000000000010000000140000000101000000
        00030000000052930318EC000000000100}
    end
    object cbComandos: TCoolBar
      Left = 0
      Top = 0
      Width = 659
      Height = 29
      Bands = <
        item
          Control = tbComandos
          ImageIndex = -1
          MinHeight = 26
          Width = 655
        end>
      object tbComandos: TToolBar
        Left = 9
        Top = 0
        Width = 642
        Height = 26
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = []
        Flat = True
        HotImages = DmEmision.ilByN
        Images = DmEmision.ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbZoomDec: TToolButton
          Left = 0
          Top = 0
          ImageIndex = 41
        end
        object edZoom: TCurrencyEdit
          Left = 23
          Top = 0
          Width = 38
          Height = 22
          Alignment = taCenter
          AutoSize = False
          DisplayFormat = ',0.##;-,0.##'
          MaxLength = 11
          MaxValue = 400.000000000000000000
          MinValue = 2.000000000000000000
          TabOrder = 1
          Value = 25.000000000000000000
        end
        object tbZoomInc: TToolButton
          Left = 61
          Top = 0
          ImageIndex = 42
        end
        object TToolButton
          Left = 84
          Top = 0
          Width = 8
          ImageIndex = 37
          Style = tbsSeparator
        end
        object tbPageFirst: TToolButton
          Left = 92
          Top = 0
          ImageIndex = 43
        end
        object tbPagePrior: TToolButton
          Left = 115
          Top = 0
          ImageIndex = 31
        end
        object edPage: TIntEdit
          Left = 138
          Top = 0
          Width = 25
          Height = 22
          TabOrder = 0
          Text = '1'
          Alignment = taCenter
          MinValue = 1
          Value = 1
        end
        object edPageCount: TIntEdit
          Left = 163
          Top = 0
          Width = 25
          Height = 22
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
          Text = '1'
          Alignment = taCenter
          Value = 1
        end
        object tbPageNext: TToolButton
          Left = 188
          Top = 0
          ImageIndex = 32
        end
        object tbPageLast: TToolButton
          Left = 211
          Top = 0
          ImageIndex = 44
        end
        object TToolButton
          Left = 234
          Top = 0
          Width = 8
          ImageIndex = 37
          Style = tbsSeparator
        end
        object tbAbrirImagen: TToolButton
          Left = 242
          Top = 0
          Hint = 'Abrir Imagen'
          Enabled = False
          ImageIndex = 13
        end
        object tbGuardarImagen: TToolButton
          Left = 265
          Top = 0
          Caption = 'Guardar Imagen'
          ImageIndex = 3
        end
        object TToolButton
          Left = 288
          Top = 0
          Width = 8
          ImageIndex = 4
          Style = tbsSeparator
        end
        object pnDerivacionNota: TPanel
          Left = 296
          Top = 0
          Width = 340
          Height = 22
          BevelOuter = bvNone
          TabOrder = 3
          DesignSize = (
            340
            22)
          object lblBibliorato: TLabel
            Left = 14
            Top = 3
            Width = 46
            Height = 13
            Caption = 'Bibliorato:'
          end
          object lblSecuencia: TLabel
            Left = 156
            Top = 3
            Width = 54
            Height = 13
            Caption = 'Secuencia:'
          end
          object edtBiblioratoNota: TIntEdit
            Left = 63
            Top = 1
            Width = 87
            Height = 21
            Hint = 'Bibliorato'
            TabOrder = 0
            MaxLength = 3
          end
          object edtSecuenciaNota: TIntEdit
            Left = 215
            Top = 1
            Width = 86
            Height = 21
            Hint = 'N'#250'mero de Secuencia'
            Anchors = [akTop, akRight]
            TabOrder = 1
            MaxLength = 8
          end
        end
      end
    end
    object pnlImgStatus: TPanel
      Left = 0
      Top = 502
      Width = 659
      Height = 19
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  object gbDerivacionNota: TJvgGroupBox
    Left = 6
    Top = 1
    Width = 661
    Height = 23
    Caption = ' Derivaci'#243'n de Nota  '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Border.Inner = bvNone
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvRaised
    CaptionBorder.Outer = bvSpace
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = 10461087
    CaptionGradient.ToColor = clSilver
    CaptionGradient.Active = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    CaptionTextStyle = fstVolumetric
    Colors.Text = clHighlightText
    Colors.TextActive = clHighlightText
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBtnShadow
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GroupIndex = 2
    FullHeight = 59
  end
end
