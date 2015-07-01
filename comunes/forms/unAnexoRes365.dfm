inherited frmAnexoRes365: TfrmAnexoRes365
  Left = 376
  Top = 200
  Width = 629
  Height = 412
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Impresi'#243'n del Anexo Res. 365 (Ventanilla Electr'#243'nica)'
  Constraints.MinHeight = 100
  Constraints.MinWidth = 600
  Font.Name = 'Tahoma'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poOwnerFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object gbDatosCliente: TJvgGroupBox [0]
    Left = 0
    Top = 124
    Width = 620
    Height = 261
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '  Impresiones anteriores'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Border.Inner = bvNone
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvRaised
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = 10461087
    CaptionGradient.ToColor = clSilver
    CaptionGradient.Active = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
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
    Options = [fgoCanCollapse, fgoCollapseOther, fgoResizeParent, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GlyphCollapsed.Data = {
      DE000000424DDE0000000000000076000000280000000F0000000D0000000100
      0400000000006800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
      7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
      FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
      FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
      FFF0}
    GlyphExpanded.Data = {
      DE000000424DDE0000000000000076000000280000000F0000000D0000000100
      0400000000006800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
      7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
      FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
      FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
      FFF0}
    FullHeight = 342
    object grid: TArtDBGrid
      Left = 2
      Top = 16
      Width = 616
      Height = 243
      Align = alClient
      DataSource = dsConsulta
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnMouseDown = gridMouseDown
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'AN_ID'
          Title.Alignment = taRightJustify
          Title.Caption = 'N'#186' Formulario'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SE_NOMBRE'
          Title.Caption = 'Usuario'
          Width = 160
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'AN_FECHAIMPRESION'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha de Impresi'#243'n'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AN_EMAIL'
          Title.Caption = 'E-mail'
          Width = 168
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORIGEN'
          Title.Caption = 'Or'#237'gen'
          Visible = True
        end>
    end
  end
  object pnlTop: TPanel [1]
    Left = 0
    Top = 0
    Width = 621
    Height = 125
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      621
      125)
    object lbMensaje: TLabel
      Left = 8
      Top = 64
      Width = 252
      Height = 13
      Caption = 
        '                                                                ' +
        '                    '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 12
      Top = 36
      Width = 40
      Height = 13
      Caption = 'C.U.I.T.'
    end
    object Label2: TLabel
      Left = 12
      Top = 12
      Width = 49
      Height = 13
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inline fraEmpresa: TfraEmpresa
      Left = 56
      Top = 32
      Width = 556
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited lbContrato: TLabel
        Left = 452
      end
      inherited mskCUIT: TMaskEdit
        Font.Name = 'Tahoma'
        ParentFont = False
      end
      inherited edContrato: TIntEdit
        Left = 499
        Font.Name = 'Tahoma'
        ParentFont = False
      end
      inherited cmbRSocial: TArtComboBox
        Width = 317
        Font.Name = 'Tahoma'
        ParentFont = False
      end
    end
    object btnImprimir: TBitBtn
      Left = 529
      Top = 88
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnImprimirClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000008583
        82FF5C5A59FF63605FFF605E5DFF5F5D5CFF5E5C5BFF5D5B5AFF5D5C5BFF5E5C
        5BFF5F5D5CFF5F5E5CFF605E5DFF5C5A59FF615F5EFF00000000000000006E6C
        6BFF6D6B6AFF757372FF898685FF9B9897FFA5A3A3FFABA8A9FFABA9A9FFA2A1
        A0FF979594FF898786FF7B7978FF706E6DFF676564FF636160FF000000006A68
        67FFA09F9DFFECEBEAFFF2F0F0FFF8F7F5FFF6F5F3FFF3F0F0FFEEEBEBFFE9E6
        E5FFE5E3E1FFDFDDDCFFDDDBDBFFB9B7B6FF716F6EFF595756FF000000007775
        74FFCDCBCAFFF9F7F6FFD9D6D5FFC5C2C1FFAFACABFF9F9E9DFF9E9C9BFFAAA6
        A5FFBBB7B7FFCDCBC9FFE2E0E0FFDCDADAFF838180FF535150FF00000000827F
        7EFFD1CFCEFFD9D6D5FF8F8F8EFF656463FF5B5B5AFF575655FF565453FF5653
        52FF5A5757FF7C7B7AFFCAC9C8FFE0DEDEFF8B8989FF585655FF000000008784
        83FFD2D0CFFFBBB9B8FF535251FF5D5B5AFF605F5EFF5F5E5DFF5C5B5AFF5857
        56FF525150FF383736FF858483FFE1DEDDFF8E8C8AFF5A5958FF000000008886
        85FFC8C6C5FFABAAA9FF605F5EFF6F6C6BFF6A6867FF666665FF646362FF6160
        5FFF605F5EFF4B4A49FF6C6C6BFFCDCBCAFF82807FFF585655FF000000008A86
        85FFADAAA9FFA3A2A1FF6B6A69FF706F6EFF6C6B6AFF696766FF666564FF6262
        61FF5F5E5DFF525150FF706F6EFFA8A7A6FF716F6EFF5C5958FF00000000918E
        8DFF949291FF8A8A88FF706764FF746A68FF6E6866FF6D6663FF69625FFF655E
        5CFF635C5AFF534D4AFF605E5DFF767473FF6A6867FF00000000000000000000
        00008B8886FF8E8D8BFF7B8283FF6C6E6EFF736D6AFF706B68FF6B6563FF6862
        60FF605C59FF676766FF727271FF676563FF605E5DFF00000000000000000000
        0000CE937DFF9F9895FF6BA4B7FF65BDD0FF459DB3FF3D97B0FF46A0B5FF4DA5
        B8FF3B9FB9FF5693A9FF858484FF74665FFF0000000000000000000000000000
        0000FFBE8DFF888687FF559DB4FF88E9F9FF54CCE1FF29AECFFF2EAFD1FF36B7
        D7FF37C7E9FF2589ABFF5C6870FF9A5842FF0000000000000000000000000000
        000000000000000002FF3399C1FF85DAEAFF9FDEE8FF35A7C7FF39B1D1FF3CB7
        D5FF1A8AB1FF036691FF01577EFF000000000000000000000000000000000000
        000000000000000000000080C3FF27ABD3FF73CEE6FF88DCEBFF79E1F0FF47BD
        D9FF09729DFF005181FF007AEDFF000000000000000000000000000000000000
        00000000000000000000000000000066B2FF1082BDFF1B9FC7FF249CC2FF1086
        B0FF016D99FF003367FF00000000000000000000000000000000}
    end
    object btnImpresionMasiva: TButton
      Left = 8
      Top = 88
      Width = 104
      Height = 25
      Caption = 'Impresi'#243'n Masiva'
      TabOrder = 2
      Visible = False
      OnClick = btnImpresionMasivaClick
    end
  end
  inherited FormStorage: TFormStorage
    Left = 92
    Top = 180
  end
  inherited XPMenu: TXPMenu
    Left = 120
    Top = 180
  end
  inherited ilByN: TImageList
    Left = 92
    Top = 208
  end
  inherited ilColor: TImageList
    Left = 120
    Top = 208
  end
  inherited IconosXP: TImageList
    Left = 148
    Top = 208
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    Left = 176
    Top = 208
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 204
    Top = 208
  end
end
