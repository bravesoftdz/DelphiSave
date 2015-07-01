object frmCargaNominaDsk: TfrmCargaNominaDsk
  Left = 384
  Top = 124
  Anchors = []
  Caption = 'Carga Autom'#225'tica de N'#243'minas'
  ClientHeight = 472
  ClientWidth = 867
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 867
  DockSite = True
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbContrato: TGroupBox
    Left = 0
    Top = 0
    Width = 867
    Height = 69
    Align = alTop
    Caption = ' Empresa '
    TabOrder = 0
    DesignSize = (
      867
      69)
    object lbRSocial: TLabel
      Left = 3
      Top = 20
      Width = 24
      Height = 13
      Caption = 'CUIT'
      FocusControl = fraEmpresaAfi.cmbRSocial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 706
      Top = 11
      Width = 65
      Height = 26
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Modalidad de Presentaci'#243'n'
      WordWrap = True
    end
    object Label25: TLabel
      Left = 702
      Top = 43
      Width = 75
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Mi Simplificaci'#243'n'
      WordWrap = True
    end
    inline fraEmpresaAfi: TfraEmpresaAfi
      Left = 27
      Top = 16
      Width = 672
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
      ExplicitLeft = 27
      ExplicitTop = 16
      ExplicitWidth = 672
      inherited lbRSocial: TLabel
        Left = 84
        ExplicitLeft = 84
      end
      inherited lbContrato: TLabel
        Left = 433
        ExplicitLeft = 433
      end
      inherited lbFormulario: TLabel
        Left = 540
        Width = 50
        Font.Name = 'Tahoma'
        ExplicitLeft = 540
        ExplicitWidth = 50
      end
      inherited edContrato: TIntEdit
        Left = 478
        ExplicitLeft = 478
      end
      inherited cmbRSocial: TArtComboBox
        Left = 123
        Width = 303
        ExplicitLeft = 123
        ExplicitWidth = 303
      end
      inherited edFormulario: TPatternEdit
        Left = 592
        ExplicitLeft = 592
      end
    end
    object edModalidadPresentacion: TEdit
      Left = 782
      Top = 12
      Width = 72
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      AutoSelect = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'edSuss'
    end
    object edMiSimplificacion: TEdit
      Left = 782
      Top = 40
      Width = 73
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 2
      Text = 'edMiSimplificacion'
    end
  end
  object gbEmpresa: TGroupBox
    Left = 0
    Top = 69
    Width = 867
    Height = 97
    Align = alTop
    Caption = ' Identificaci'#243'n de la Empresa '
    TabOrder = 1
    DesignSize = (
      867
      97)
    object lbEstablecimento: TLabel
      Left = 144
      Top = 22
      Width = 74
      Height = 13
      Caption = 'Establecimiento'
    end
    object Label1: TLabel
      Left = 25
      Top = 47
      Width = 36
      Height = 13
      Caption = 'Archivo'
    end
    object Label2: TLabel
      Left = 25
      Top = 22
      Width = 36
      Height = 13
      Caption = 'Periodo'
    end
    object lbFInicioAct: TLabel
      Left = 11
      Top = 72
      Width = 49
      Height = 13
      Caption = 'Recepci'#243'n'
    end
    object Label3: TLabel
      Left = 697
      Top = 72
      Width = 68
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Baja'
    end
    object edFilename: TFilenameEdit
      Left = 72
      Top = 43
      Width = 762
      Height = 21
      Filter = 
        'Archivos de Excel 2007 (*.xlsx)|*.xlsx|Hojas de C'#225'lculo (*.xls)|' +
        '*.xls'
      DialogOptions = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
      DialogTitle = 'Selecci'#243'n de archivo externo'
      Color = clBtnFace
      DirectInput = False
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 2
    end
    object cmbFechaRecepcion: TDateComboBox
      Left = 72
      Top = 68
      Width = 88
      Height = 21
      TabOrder = 4
    end
    object chkBajas: TCheckBox
      Left = 164
      Top = 68
      Width = 229
      Height = 25
      Caption = 'Dar de baja a los trabajadores no incluidos en el archivo'
      TabOrder = 5
      WordWrap = True
      OnClick = chkBajasClick
    end
    object cmbFechaBaja: TDateComboBox
      Left = 772
      Top = 68
      Width = 88
      Height = 21
      Enabled = False
      Anchors = [akTop, akRight]
      TabOrder = 6
    end
    object edPeriodo: TPeriodoPicker
      Left = 72
      Top = 18
      Width = 49
      Height = 21
      TabOrder = 0
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = '/'
      Periodo.Mes = 1
      Periodo.Ano = 2004
      Periodo.Valor = '2004/01'
      Periodo.MaxPeriodo = '2053/12'
      Periodo.MinPeriodo = '1954/01'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
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
    inline fraEstablecimiento: TfraEstablecimiento
      Left = 224
      Top = 17
      Width = 634
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 224
      ExplicitTop = 17
      ExplicitWidth = 634
      inherited cmbDescripcion: TArtComboBox
        Width = 569
        ExplicitWidth = 569
      end
    end
    object btnVerFormato: TBitBtn
      Left = 837
      Top = 43
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000525252005252
        5200525252005252520052525200525252005252520052525200525252005252
        52005252520052525200525252005252520052525200FF00FF00A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6006363FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000
        FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C6000000FF00C6C6C600C6C6C6000000
        FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C6000000FF006363FF006363FF000000
        FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600737373007373730073737300737373007373730073737300737373007373
        730073737300737373007373730073737300C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500A5A5
        A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
        A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500FF00FF00}
      TabOrder = 3
      TabStop = False
      OnClick = btnVerFormatoClick
    end
    object chkSoloEnBase: TCheckBox
      Left = 404
      Top = 68
      Width = 213
      Height = 25
      Caption = 'Solo Actualizar trabajadores que se encuentren en la base'
      TabOrder = 7
      WordWrap = True
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 359
    Width = 867
    Height = 65
    Align = alBottom
    Caption = 'Resultados'
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 18
      Width = 55
      Height = 13
      Caption = 'Procesados'
    end
    object Label5: TLabel
      Left = 74
      Top = 18
      Width = 57
      Height = 13
      Caption = 'Con errores'
    end
    object Label6: TLabel
      Left = 140
      Top = 18
      Width = 52
      Height = 13
      Caption = 'Sin errores'
    end
    object Label7: TLabel
      Left = 436
      Top = 18
      Width = 64
      Height = 13
      Caption = 'Bajas archivo'
    end
    object Label8: TLabel
      Left = 586
      Top = 18
      Width = 83
      Height = 13
      Caption = 'Bajas potenciales'
    end
    object btnImprimirBajasPotenciales: TSpeedButton
      Left = 651
      Top = 34
      Width = 24
      Height = 21
      Hint = 'Imprimir listado de bajas potenciales'
      Enabled = False
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btnImprimirBajasPotencialesClick
    end
    object Label9: TLabel
      Left = 784
      Top = 18
      Width = 71
      Height = 13
      Caption = 'Masa potencial'
    end
    object Label10: TLabel
      Left = 206
      Top = 18
      Width = 63
      Height = 13
      Caption = 'Masa archivo'
    end
    object Label11: TLabel
      Left = 356
      Top = 18
      Width = 66
      Height = 13
      Caption = 'Masa de altas'
    end
    object Label12: TLabel
      Left = 286
      Top = 18
      Width = 62
      Height = 13
      Caption = 'Altas archivo'
    end
    object Label13: TLabel
      Left = 506
      Top = 18
      Width = 69
      Height = 13
      Caption = 'Masa de bajas'
    end
    object Label26: TLabel
      Left = 682
      Top = 18
      Width = 81
      Height = 13
      Caption = 'Altas potenciales'
    end
    object SpeedButton1: TSpeedButton
      Left = 749
      Top = 33
      Width = 24
      Height = 22
      Hint = 'Imprimir listado de bajas potenciales'
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E0000000100000001000000751F000075
        2000007622000076240000792400007A2600007A2900007B2C00077D3200047E
        310000802F0001813100028132000380320003823300078235000A8035000E82
        39000F833B000C84380011853D0011873C0014873F0012883E0015884000178A
        420032AA6B003BAF74003FB4740049BD79004EC67E0050C77F0052C8810057D0
        82005ED388006DD1950077D39C00A5A5A300A7A7A400ADADAB00ADAEAB00AEAE
        AB00AEAEAC00AFAEAC00B0AFAD00B0B0AD00B4B1B100B5B0B000B6B6B400B7B7
        B500BEB6B900BABAB800C1B3B900C4B8BD00C5B9BE0080D2A40086D5A80096D8
        B500A5DCBF00C7B9C000B0DECA00B2DECB00B6E1CE00BEE5D500CDC1C700CAC9
        C800CACAC800CBCBCA00CCCCCC00DCDCDC00E0DFDE00E1DFDE00E1E0DF00E0E0
        E000E3E3E200E4E4E300E4E5E400E7E5E400E8E7E600E8E8E800E9E9E800EAEA
        E900EBEBEA00ECEBEA00EDECEB00EEECEC00EFEFEE00F3EEF000F4EEF000F1F0
        F000F2F1F000F4F2F200F4F4F300F5F4F400F6F5F400F6F6F600FCF2F600FFF4
        F900FEF6FA00F9F8F800FAF8F800FCF8F900FFF8FC00FCFCFD00FDFDFD00FFFC
        FE00FFFEFE000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000454444444444
        44444444444449444444332B2927272B2E323536363B400F14182D6A6A6A6A6A
        6A050A0B0C0E0D212216296A6867676A6A01231E20101F241244276A64636364
        696A0337081D38111619276A5F5F5F5F636A6A071C3910446A6A276A5C5C5C5D
        656A021A3A091B13446A276A5A5A5A5B66003C3D06063E3F156A276A56565659
        62000401696A050F176A276A5354545557606160586A346A6A6A276A50515151
        515E6A6A6A6A2F6A6A6A286A4D4E4E4E4D6A4326256A2C6A6A6A296A4A4B4C4B
        4A6A26526A50416A6A6A2A6A46474847466A256A4F426A6A6A6A2B6A6A6A6A6A
        6A6A6A50426A6A6A6A6A312D2A29292928292B306A6A6A6A6A6A}
      Layout = blGlyphBottom
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object edTotal: TIntEdit
      Left = 8
      Top = 34
      Width = 60
      Height = 21
      TabOrder = 0
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edError: TIntEdit
      Left = 74
      Top = 34
      Width = 60
      Height = 21
      TabOrder = 1
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edCorrectos: TIntEdit
      Left = 140
      Top = 34
      Width = 60
      Height = 21
      TabOrder = 2
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edBajasDSK: TIntEdit
      Left = 436
      Top = 34
      Width = 64
      Height = 21
      TabOrder = 3
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edBajasCausadas: TIntEdit
      Left = 586
      Top = 34
      Width = 64
      Height = 21
      TabOrder = 4
      Text = '0'
      OnChange = edBajasCausadasChange
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edMasaResultante: TCurrencyEdit
      Left = 784
      Top = 34
      Width = 76
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 5
    end
    object edMasaDSK: TCurrencyEdit
      Left = 206
      Top = 34
      Width = 76
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 6
    end
    object edMasaAltasDSK: TCurrencyEdit
      Left = 356
      Top = 34
      Width = 76
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 7
    end
    object edAltasDSK: TIntEdit
      Left = 286
      Top = 34
      Width = 64
      Height = 21
      TabOrder = 8
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edMasaBajasDSK: TCurrencyEdit
      Left = 506
      Top = 34
      Width = 76
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 9
    end
    object edAltasPotenciales: TIntEdit
      Left = 682
      Top = 34
      Width = 64
      Height = 21
      TabOrder = 10
      Text = '0'
      OnChange = edBajasCausadasChange
      Alignment = taRightJustify
      MaxLength = 0
    end
  end
  object Grid: TArtDBGrid
    Left = 0
    Top = 235
    Width = 867
    Height = 124
    Align = alClient
    DataSource = dsConsulta
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = mnuGrid
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GridDblClick
    OnKeyUp = GridKeyUp
    IniStorage = FormStorage
    MultiSelect = True
    FooterBand = False
    TitleHeight = 17
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'MP_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_APELLIDO'
        Title.Caption = 'Apellido'
        Width = 185
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_PUESTO'
        Title.Caption = 'Puesto'
        Width = 144
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_NACIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Nacimiento'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_SEXO'
        Title.Caption = 'Sexo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NROLINEA'
        Title.Caption = 'Nro. Registro'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_ERROR'
        Title.Caption = 'Error'
        Width = 369
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_GRAVE'
        Title.Caption = 'Grave'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_CONFIRMAPUESTO'
        Title.Caption = 'Confirmado al Puesto'
        Width = 136
        Visible = True
      end>
  end
  object sbEstado: TStatusBar
    Left = 0
    Top = 455
    Width = 867
    Height = 17
    AutoHint = True
    Panels = <
      item
        Width = 280
      end
      item
        Width = 100
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 166
    Width = 867
    Height = 40
    Align = alTop
    TabOrder = 6
    DesignSize = (
      867
      40)
    object BarProgreso: TJvSpecialProgress
      Left = 84
      Top = 12
      Width = 696
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsSingle
      Caption = 'BarProgreso'
      Color = clGray
      EndColor = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Position = 77
      Solid = True
      StartColor = clGreen
      Step = 1
      TextCentered = True
      TextOption = toPercent
    end
    object lbProceso: TLabel
      Left = 690
      Top = 16
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'lbProceso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btnProcesar: TButton
      Left = 5
      Top = 12
      Width = 75
      Height = 21
      Caption = '&Procesar'
      TabOrder = 0
      OnClick = btnProcesarClick
    end
    object btnCorrecciones: TButton
      Left = 787
      Top = 12
      Width = 76
      Height = 21
      Hint = 'Corrige las inconsistencias'
      Anchors = [akTop, akRight]
      Caption = '&Correcciones'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCorreccionesClick
    end
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 206
    Width = 867
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 861
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 854
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbLimpiar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Limpiar'
        Caption = 'tbLimpiar'
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object tbOrdenar: TToolButton
        Left = 23
        Top = 0
        Hint = 'Ordenar '
        Caption = 'Ordenar'
        ImageIndex = 2
        OnClick = tbOrdenarClick
      end
      object tbExportar: TToolButton
        Left = 46
        Top = 0
        Hint = 'Exportar'
        Caption = 'tbExportar'
        ImageIndex = 3
        OnClick = tbExportarClick
      end
      object tbImprimir: TToolButton
        Left = 69
        Top = 0
        Hint = 'Imprimir'
        Caption = 'Imprimir Grilla'
        ImageIndex = 4
        OnClick = tbImprimirClick
      end
      object tbOcultarColumnas: TToolButton
        Left = 92
        Top = 0
        Hint = 'Ocultar Columnas'
        Caption = 'tbOcultarColumnas'
        ImageIndex = 14
        OnClick = tbOcultarColumnasClick
      end
      object tbMostrarFiltros: TToolButton
        Left = 115
        Top = 0
        Hint = 'Ocultar Filtros'
        Caption = 'tbMostrarFiltros'
        ImageIndex = 11
        OnClick = tbMostrarFiltrosClick
      end
      object tbIgnorar: TToolButton
        Left = 138
        Top = 0
        Hint = 'Ignorar errores seleccionados'
        Caption = 'Ignorar Errores'
        ImageIndex = 45
        OnClick = tbIgnorarClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 424
    Width = 867
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 8
    DesignSize = (
      867
      31)
    object pnComputerUser: TPanel
      Left = 4
      Top = 3
      Width = 527
      Height = 24
      Anchors = [akLeft, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object btnVerHistorial: TButton
      Left = 555
      Top = 2
      Width = 80
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Ver Historial'
      TabOrder = 1
      OnClick = btnVerHistorialClick
    end
    object btnClearControls: TButton
      Left = 639
      Top = 2
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Limpiar'
      TabOrder = 2
      OnClick = btnClearControlsClick
    end
    object btnGrabar: TButton
      Left = 715
      Top = 2
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Grabar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnGrabarClick
    end
    object btnSalir: TButton
      Left = 791
      Top = 2
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Salir'
      TabOrder = 4
      OnClick = btnSalirClick
    end
  end
  object fpTrabajador: TFormPanel
    Left = 80
    Top = 32
    Width = 281
    Height = 305
    Caption = 'Editar Trabajador'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    ActiveControl = meCuil
    DesignSize = (
      281
      305)
    object Label14: TLabel
      Left = 4
      Top = 36
      Width = 37
      Height = 13
      Caption = 'Apellido'
    end
    object Label16: TLabel
      Left = 4
      Top = 60
      Width = 65
      Height = 13
      Caption = 'F. Nacimiento'
    end
    object Label17: TLabel
      Left = 4
      Top = 112
      Width = 24
      Height = 13
      Caption = 'Sexo'
    end
    object Label18: TLabel
      Left = 4
      Top = 12
      Width = 39
      Height = 13
      Caption = 'C.U.I.L.'
    end
    object Label15: TLabel
      Left = 4
      Top = 140
      Width = 32
      Height = 13
      Caption = 'Sueldo'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 261
      Width = 248
      Height = 8
      Anchors = [akLeft, akBottom]
      Shape = bsTopLine
    end
    object Label19: TLabel
      Left = 4
      Top = 164
      Width = 55
      Height = 13
      Caption = 'Estado Civil'
    end
    object Label20: TLabel
      Left = 4
      Top = 188
      Width = 43
      Height = 13
      Caption = 'Provincia'
    end
    object Label21: TLabel
      Left = 4
      Top = 212
      Width = 44
      Height = 13
      Caption = 'Localidad'
    end
    object Label22: TLabel
      Left = 4
      Top = 84
      Width = 50
      Height = 13
      Caption = 'F. Ingreso'
    end
    object Label24: TLabel
      Left = 4
      Top = 236
      Width = 73
      Height = 13
      Caption = 'Origen de Dato'
    end
    object meCuil: TMaskEdit
      Left = 80
      Top = 8
      Width = 81
      Height = 21
      Hint = 'CUIT de la Empresa'
      EditMask = '99-99999999-9;0;'
      MaxLength = 13
      TabOrder = 0
    end
    object edApellido: TEdit
      Left = 80
      Top = 32
      Width = 189
      Height = 21
      MaxLength = 60
      TabOrder = 1
      Text = 'edApellido'
    end
    object dcbNacimiento: TDateComboBox
      Left = 80
      Top = 56
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object rgSexo: TRadioGroup
      Left = 80
      Top = 100
      Width = 189
      Height = 33
      Columns = 2
      Items.Strings = (
        'Femenino'
        'Masculino')
      TabOrder = 4
    end
    object btnAceptar: TButton
      Left = 96
      Top = 272
      Width = 72
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Aceptar'
      TabOrder = 9
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 176
      Top = 272
      Width = 72
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Cancelar'
      TabOrder = 10
      OnClick = btnCancelarClick
    end
    object ceSueldo: TCurrencyEdit
      Left = 80
      Top = 136
      Width = 76
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 5
    end
    inline fraEstadoCivil: TfraStaticCTB_TABLAS
      Left = 78
      Top = 160
      Width = 193
      Height = 23
      TabOrder = 6
      ExplicitLeft = 78
      ExplicitTop = 160
      ExplicitWidth = 193
      inherited edCodigo: TPatternEdit
        Width = 24
        ExplicitWidth = 24
      end
      inherited cmbDescripcion: TComboGrid
        Left = 27
        Width = 165
        ExplicitLeft = 27
        ExplicitWidth = 165
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
    inline fraProvincia: TfraCodigoDescripcion
      Left = 78
      Top = 184
      Width = 193
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      OnExit = fraProvinciaExit
      ExplicitLeft = 78
      ExplicitTop = 184
      ExplicitWidth = 193
      inherited cmbDescripcion: TArtComboBox
        Left = 27
        Width = 165
        ExplicitLeft = 27
        ExplicitWidth = 165
      end
      inherited edCodigo: TPatternEdit
        Width = 24
        ExplicitWidth = 24
      end
    end
    inline fraLocalidad: TfraCodigoDescripcion
      Left = 78
      Top = 208
      Width = 193
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      ExplicitLeft = 78
      ExplicitTop = 208
      ExplicitWidth = 193
      inherited cmbDescripcion: TArtComboBox
        Left = 27
        Width = 165
        ExplicitLeft = 27
        ExplicitWidth = 165
      end
      inherited edCodigo: TPatternEdit
        Width = 24
        ExplicitWidth = 24
      end
    end
    object edFechaIngreso: TDateComboBox
      Left = 80
      Top = 80
      Width = 88
      Height = 21
      TabOrder = 3
    end
    inline fraOrigenDato: TfraCodDesc
      Left = 79
      Top = 232
      Width = 194
      Height = 23
      TabOrder = 11
      ExplicitLeft = 79
      ExplicitTop = 232
      ExplicitWidth = 194
      DesignSize = (
        194
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 62
        Width = 129
        ExplicitLeft = 62
        ExplicitWidth = 129
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        ExplicitLeft = 0
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'od_fechabaja'
        FieldCodigo = 'od_codigo'
        FieldDesc = 'od_detalle'
        FieldID = 'od_id'
        IdType = ctInteger
        OrderBy = 'od_detalle'
        TableName = 'afi.aod_origendato'
      end
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select *'
      'from tmp_afinomi'
      'where mp_valido = '#39'N'#39)
    Left = 222
    Top = 429
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 250
    Top = 429
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <
      item
        Title = 'CUIL'
        DataField = 'MP_CUIL'
        Width = 350
        MaxLength = 0
        DataFormat = False
      end
      item
        Title = 'Apellido'
        DataField = 'MP_APELLIDO'
        Width = 1000
        MaxLength = 0
        DataFormat = False
      end
      item
        Title = 'Nro. Linea'
        DataField = 'MP_NROLINEA'
        Width = 200
        MaxLength = 0
        DataFormat = False
      end
      item
        Title = 'Error'
        DataField = 'MP_ERROR'
        MaxLength = 0
        DataFormat = False
      end>
    DataSource = dsConsulta
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Carga Masiva de Trabajadores'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    SubTitle.Alignment = taLeftJustify
    SubTitle.PrintOptions = poFirstPage
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxPortrait
    PageSize = psLegal
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 306
    Top = 429
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    MaxPage = 2147483647
    Options = [poPageNums]
    Left = 278
    Top = 429
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqConsulta
    Fields = <>
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 334
    Top = 429
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 362
    Top = 429
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 390
    Top = 429
  end
  object sdspSaveTrabajador: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'art.trabajador.do_abmtrabajador'
    Left = 194
    Top = 429
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'CUIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBRE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SEXO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FNACIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDUBICACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PISO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPOSTALA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODAREATELEFONO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TELEFONO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ESTADOCIVIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ORIGEN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LATERALIDADDOMINANTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAMOVI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOMICILIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CALLE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOCALIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPOSTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROVINCIA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDNACIONALIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OTRANACIONALIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOMICILIODEL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MODULO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ERROR'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'DESC_ERROR'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'CONFIRMAPUESTO'
        ParamType = ptInput
      end>
  end
  object ExcelWB: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 40
    Top = 296
  end
  object ExcelWS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 72
    Top = 296
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 104
    Top = 296
  end
  object mnuGrid: TPopupMenu
    Left = 140
    Top = 298
    object mnuIgnorar: TMenuItem
      Caption = 'Ignorar Error'
      OnClick = mnuIgnorarClick
    end
  end
  object FieldHider: TFieldHider
    DBGrid = Grid
    SortDialog = SortDialog
    Left = 168
    Top = 428
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 144
    Top = 428
  end
  object GuardarExcel: TSaveDialog
    Filter = 'Excel|*.xlsx'
    Left = 696
    Top = 392
  end
end
