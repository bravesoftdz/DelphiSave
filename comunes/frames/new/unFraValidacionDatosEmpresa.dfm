inherited fraValidacionDatosEmpresa: TfraValidacionDatosEmpresa
  Width = 660
  Height = 408
  Constraints.MaxHeight = 408
  Constraints.MaxWidth = 660
  Constraints.MinHeight = 408
  Constraints.MinWidth = 660
  Font.Name = 'Tahoma'
  ParentFont = False
  object AdvToolPanelValidacionDatos: TAdvToolPanel
    Left = 0
    Top = 0
    Width = 660
    Height = 408
    BackgroundTransparent = False
    BackGroundPosition = bpTopLeft
    Button3D = False
    HoverButtonColor = 14483455
    HoverButtonColorTo = 6013175
    DownButtonColor = 557032
    DownButtonColorTo = 8182519
    CaptionButton = False
    Color = 16774371
    ColorTo = 15587784
    GradientDirection = gdVertical
    DockDots = False
    Caption = 'Validaci'#243'n de datos'
    CaptionGradientDirection = gdVertical
    FocusCaptionFontColor = 7485192
    FocusCaptionColor = 12316415
    FocusCaptionColorTo = 7920383
    NoFocusCaptionFontColor = 7485192
    NoFocusCaptionColor = 16773091
    NoFocusCaptionColorTo = 16765615
    CloseHint = 'Close panel'
    LockHint = 'Lock panel'
    UnlockHint = 'Unlock panel'
    Sections = <
      item
        Autosize = False
        Caption = 'Domicilio constituido'
        Draw = True
        SectionItems = <>
        Height = 121
        CaptionImageIndex = -1
      end
      item
        Autosize = False
        Caption = 'Correo Electr'#243'nico Corporativo'
        Draw = True
        SectionItems = <>
        Height = 72
        CaptionImageIndex = -1
      end
      item
        Autosize = False
        Caption = 'Contacto con la empresa'
        Draw = True
        SectionItems = <>
        Height = 140
        CaptionImageIndex = -1
      end>
    SectionLayout.CaptionColor = 16635575
    SectionLayout.CaptionColorTo = 13146742
    SectionLayout.CaptionFontColor = clBlack
    SectionLayout.CaptionRounded = False
    SectionLayout.Corners = scRectangle
    SectionLayout.BackGroundColor = 16248798
    SectionLayout.BackGroundColorTo = 16242365
    SectionLayout.BorderColor = 16765615
    SectionLayout.BorderWidth = 1
    SectionLayout.CaptionGradientDir = gdVertical
    SectionLayout.BackGroundGradientDir = gdVertical
    SectionLayout.Indent = 4
    SectionLayout.Spacing = 4
    SectionLayout.ItemFontColor = 11876608
    SectionLayout.ItemHoverTextColor = 11876608
    SectionLayout.ItemHoverUnderline = True
    SectionLayout.UnderLineCaption = False
    ShowCaptionBorder = False
    ShowClose = False
    ShowLock = False
    Style = esOffice2007Luna
    Version = '1.4.6.2'
    DesignSize = (
      660
      408)
    object pnlDomicilioLegal: TPanel
      Left = 12
      Top = 48
      Width = 550
      Height = 85
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvLowered
      Color = 13421772
      TabOrder = 0
      DesignSize = (
        550
        85)
      inline fraDomicilioEmpresaLegal: TfraDomicilioEmpresa
        Left = 6
        Top = 8
        Width = 536
        Height = 69
        Anchors = [akLeft, akTop, akRight]
        Color = 13421772
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          536
          69)
        inherited lbCalle: TLabel
          Left = 26
        end
        inherited lbNro: TLabel
          Left = 323
        end
        inherited lbPiso: TLabel
          Left = 395
          Width = 19
        end
        inherited lbDto: TLabel
          Left = 471
          Width = 21
        end
        inherited lbCPostal: TLabel
          Left = 9
          Width = 40
        end
        inherited lbCPA: TLabel
          Width = 20
        end
        inherited lbLocalidad: TLabel
          Width = 44
        end
        inherited lbProvincia: TLabel
          Left = 376
          Width = 43
        end
        inherited lbTelefonos: TLabel
          Left = 2
        end
        inherited cmbCalle: TArtComboBox
          Width = 244
        end
        inherited edNumero: TEdit
          Left = 345
        end
        inherited edPiso: TEdit
          Left = 421
        end
        inherited edDto: TEdit
          Left = 492
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 97
        end
        inherited edProvincia: TEdit
          Left = 424
        end
        inherited edTelefonos: TEdit
          Width = 484
        end
        inherited btnBuscar: TButton
          Left = 298
        end
        inherited sdqLocalidad: TSDQuery
          Left = 148
          Top = 32
        end
        inherited dsLocalidad: TDataSource
          Left = 176
          Top = 32
        end
      end
    end
    object edCorreoElectronico: TEdit
      Left = 12
      Top = 174
      Width = 398
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 422
      Top = 166
      Width = 232
      Height = 43
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      Color = 13421772
      TabOrder = 3
      DesignSize = (
        232
        43)
      object rgCorreoElectronico: TAdvOfficeRadioGroup
        Left = 5
        Top = 2
        Width = 222
        Height = 35
        Version = '1.2.1.0'
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Seleccione la respuesta'
        ParentBackground = False
        ParentCtl3D = True
        TabOrder = 0
        OnClick = rgCorreoElectronicoClick
        Ellipsis = False
        Columns = 3
        Items.Strings = (
          'Correcto'
          'Incorrecto'
          'No posee')
      end
    end
    object pnlDomicilioOpciones: TPanel
      Left = 569
      Top = 48
      Width = 85
      Height = 85
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      Color = 13421772
      TabOrder = 1
      DesignSize = (
        85
        85)
      object rgDomicilio: TAdvOfficeRadioGroup
        Left = 2
        Top = 2
        Width = 79
        Height = 79
        Version = '1.2.1.0'
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Respuesta '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentCtl3D = True
        ParentFont = False
        TabOrder = 0
        OnClick = rgDomicilioClick
        Ellipsis = False
        Items.Strings = (
          'Correcto'
          'Incorrecto'
          'NS/NC')
      end
    end
    object pnlDomicilioCorrecto: TPanel
      Left = 9
      Top = 292
      Width = 642
      Height = 61
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvLowered
      Color = 13421772
      TabOrder = 5
      inline fraDomicilioCorrecto: TfraDomicilioGIS
        Left = 2
        Top = 2
        Width = 638
        Height = 57
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          638
          57)
        inherited lbNro: TLabel
          Left = 461
        end
        inherited lbPiso: TLabel
          Left = 525
        end
        inherited lbDto: TLabel
          Left = 577
        end
        inherited lbProvincia: TLabel
          Left = 481
        end
        inherited cmbCalle: TArtComboBox
          Width = 310
        end
        inherited edNumero: TEdit
          Left = 477
        end
        inherited edPiso: TEdit
          Left = 549
        end
        inherited edDto: TEdit
          Left = 601
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 206
        end
        inherited edProvincia: TEdit
          Left = 529
        end
        inherited btnBuscar: TButton
          Left = 177
        end
        inherited btnBuscarGIS: TAdvGlowButton
          Left = 365
        end
        inherited btnMapaGIS: TAdvGlowButton
          Left = 411
        end
      end
    end
    object pnlCorreoTelefono: TPanel
      Left = 9
      Top = 238
      Width = 642
      Height = 49
      BevelInner = bvLowered
      Color = 13421772
      TabOrder = 4
      DesignSize = (
        642
        49)
      object Label1: TLabel
        Left = 6
        Top = 5
        Width = 148
        Height = 13
        Caption = 'Correo Electr'#243'nico Corporativo'
        Transparent = True
      end
      object Label2: TLabel
        Left = 329
        Top = 5
        Width = 47
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Tel'#233'fonos'
        Transparent = True
      end
      object edCorreoElectronicoCorrecto: TEdit
        Left = 4
        Top = 21
        Width = 320
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edTelefonosCorrecto: TEdit
        Left = 327
        Top = 21
        Width = 307
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 1
      end
    end
    object pnlBotones: TPanel
      Left = 9
      Top = 358
      Width = 642
      Height = 43
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      Color = 13421772
      TabOrder = 6
      DesignSize = (
        642
        43)
      object btnGuardar: TAdvGlowButton
        Left = 462
        Top = 6
        Width = 85
        Height = 31
        Anchors = [akTop, akRight]
        Caption = 'Guardar'
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000000473424954080808087C086488000000097048597300000B1200000B
          1201D2DD7EFC0000002574455874536F667477617265004D6163726F6D656469
          612046697265776F726B73204D5820323030348776ACCF000000147445587443
          72656174696F6E2054696D6500392F342F3034795EA3D5000005834944415478
          9CB596DB6F5C471DC73F736EBBDE5D6777BDB1E3BB8D036E69A80C2169A23642
          C1A56AA4AA108AD23EA14A951A54E1074A058D14FE0190FA404C2188A6970714
          904A44A2D244A2118EA2D48DDBDA0A4EB7218ED776D697B5BD9BBD5FCE9973CE
          F0E060911A1EF3937E4F33F3FDE87799DF8C504A713F4DBBAFEA80F1FF169E7A
          EAB81E0C864DD0E2954ABDD5B2AC01A00540D7A9BAAE7DCB30C49A944E2E999C
          B7E7E64E7BFF4B47FC778A5E7DF58FBA52226A9AC69E6C36B717C4236D6D2D5F
          8F4643BDCDCD41C26113D775A95424F97C9562B1BC9ECDE63FB66DE74A34DAF4
          89EBFB9F78AE5F78EBCD9FFA5B00C78FFF69BB94EAFB8D46E30560FFE0E04E06
          06DAE9E848D0D5152791D0D0F58D4352C2CA8AC3F272816CB640A59C67FCA369
          EEE48B1FE986F88DA169EFBDF1C64F8A9B8063C74E0F699A782D140A3F1E8B35
          914AA5191E1EE6E0C13E6A35D0B40D0710027C7FC31B0DE8E981CC7A8993272E
          A0F9B05ECE53AFD5FFAC941A3975EAE5AC06E079DEA8A6998F3FF1C45E4646BE
          C39E3D3B3977EE2233330DCA65C8E5A0508072198AC50D5F5FDF88444A8FDFFD
          E1025F8EEFE0D80F9FE5C97DFBD174FD39D7F38EC0DD2E725D79560854474784
          6A1512899D28E570E9D2049605A609810084426059A0EBE079D0D70B1F8ECF90
          9E5925B22D8C2E150FB6B6A3C0755D776913303D3DF7EB72B9F8F7AB5767B87D
          DB434A8BC1C19D2493496CBB4C5F9F8BE7E5A854D66834D671DD3B74777BD4EA
          35DE3B3FC1437DFDB46C6B6669ADC007D7A6B0EBF5AB4A7817EF29F24B2F9D7C
          3491485C7CFAE983C16A1532991C972F5FA2AB2B4A7F7F0FA9D42A524A945258
          96C9C0401BF3E93516665739FCD8A37CB5BB8BD54A8137CF9F474AF9E3B7DF7A
          E5B79B1100944ACE44A9541A4B266788C52C344DE3E1877791CBF9A452252291
          1662B1569A9BE30811606A7291F45C96BD0F0D128B8409062C266EFE0BD7758B
          9A263ED872D17CBFE6795EF06C3ABD7C6868E8010201412CB69D030776609A16
          BEEF22A5444A07473A7476B662FA3E2D812622C10025596721B38AEFFB13BA50
          B7FFA3BB19C1E9D3C7946D3B53D5AAED96CB155A5A42542A5594526432AB4C4E
          4E333E3EC9D45492D95B0B140A797421A8D46C62D130D96A915ABD0EF099619A
          DE16C0DD76AD3A8E746D5B128F47D034C567D73F676CEC12F57A814442231251
          148B77181F9FE4C6EC1C2E8A48B409DBB571A4C4F7555EA06F6A7E6116094329
          A50B21B00216333767482FCDF1CC33DF62787837A0532AD5719C2A57AE24397F
          6102D7F1F8EEB7BF81699A08210015014F6C011CFDD1EB42D3F88A15308CB6D6
          5656D2ABAC65963972E410DFDC3DC4D8D875FAFA7AE9ED8D1308C4387CB88B60
          28CCFB7FBBC2FC4A86FE9E769A8241EC86D3E3BAFEE62CDA4C51A152D40D437F
          B22D1117ED1DDB589C5DA2B3BB93A1A1DDBCFBEE18A3A3EF70F6DC452A95064A
          413E0FFB1ED9CFF6ED6DDC4A2DD2FDA5381D6D71401D90AED7BE05100E34F504
          03C6A15DBB1EC4AF835BB689C5A2206061619E62B140763D433CE6D3D9099108
          84C31A91C8364AF91A9A0607F67F0DD334BB7DDF7B6E0BC030F47DBAAE778582
          21AA776C2C05B5BA4D6A76154D87FEBE5E5CE9333AFA575E3F718EB17F7C4C3A
          5D42081FA7A1A8641D424D610C5347085E7CFEF95FEDB8A70602EA8E2DB936F9
          4F1AFDFD5471492FA63973E60C523AB4B625504A919ACBA859A58461CCD274F9
          537CD767E081163E9D9A63E2C60D1CDB4608D10B84EEED22213E743CF7C2CD54
          EAD07266854AA381AFFC25BBD1785FD3B469044B4AA9B210C245A0B9AE17CD15
          F28F85ACC00FAECFCFF45D4BDD245F2EDD9512BF0416E10B2FDAD1A327DA3CDF
          FF9952EA7BC05F2CD3780D250A087C29A53A75EAE5CDCD23232745AE90D77DE1
          599A278E0B215ED175DDD184F88580DFBFFDCECFED2D80FB61F7FD57F16F496C
          BCC992EE8A1E0000000049454E44AE426082}
        TabOrder = 0
        OnClick = btnGuardarClick
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
      object btnCancelar: TAdvGlowButton
        Left = 550
        Top = 6
        Width = 85
        Height = 31
        Anchors = [akTop, akRight]
        Caption = 'Cancelar'
        ModalResult = 2
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000000473424954080808087C086488000000097048597300000B1200000B
          1201D2DD7EFC0000002574455874536F667477617265004D6163726F6D656469
          612046697265776F726B73204D5820323030348776ACCF000000157445587443
          72656174696F6E2054696D6500392F31302F3034B6FA8A300000047B49444154
          789CB5964D6C554518869F9973CEBDB7E5DE40B1148B262D058A8244C0107E0A
          B2D09DC10D5252581A821A138CB0A0C1204D4C145C6070013190405C59904483
          0931C082053F89058C34A5B4050A2DB4F7DEFEDEBF73CE9C997123A4458241C2
          BB9DEF7D9FCC37F34D46586B7991922F341D709FD5B063C74FC992AFAB8C518B
          8DD6E3D8A84B3AE6C1C1831F854FAA170F5BB463C7C972AD7562FFFE0DC34F2A
          6C6E3E551545BAC9F7FDF55AAB354218B48E504A85604E7B9EFBC3A1435B7E7B
          0AE0E759523A87411EDDB7EFFDD68945BB76FDBE4EA9F06BAC59585D3D8DDAD9
          3349A5CAD11A8687C7E8E8E8E2DEBDFB4847B41C39FCC99E2702B66F3F51E738
          6E8F10D2F8BE39505D5DD9BC73E76ABFB9F9F4B64845DFCE9C39D56B68A8A7FA
          E50AB482C27880B69644B21CA50DE7CE5EE04ADB35A423D61F3DBAEDE4BF005B
          B71E9D934A4DED5EB46836E9F428B76FA72FA45289334A992F16BF3947AE5D5B
          0FBEE541F728AA18A0234DC12F910F8AA4AAA7F34A5D1DBFFE728ACECE9BDDF1
          B8B3F4C891CF7230E116E572E371210C0B17D6B265CB4AEAEB2B578D8D1576AF
          583E5FAE7BEF0D8A038AFBEDE3F88580BE4C963B83835803158924D95BFDDCEB
          B94D43C32A1C47CE552ADAFC30F711C075E5026B0D4200C4D9B46925EBD72F67
          CDEAB9F47715191D0CB8373CC0B9AB6D5CE868E7726707176F5C67B490A73239
          8DA1DE7E3C37465DDD6C4AA5625353D357894900A5024F088BEB0ADADBF3F4DE
          D12C5D524BBA2F249DCEF3C7CDEB9CBFDAC683E10C415842E980FBC319FEBAD3
          8301924E8CF174969ADA5A82D05F09A20626CC815241CA9808AD21F48B8C6515
          F94C81B01470E94A1BBD03F7918EE817F0BDB174586B2A8D8E760F8E646A4672
          A354252B08724512656578AEE30581FF2ED0F908606D345F0A4B508A888A019E
          B2C4B404659046A37588D6F6D2B1639FEF7DE8D9BC79EF12ADF974686C949A8A
          99445180F623A65554904E0F2E9BD4A2202809D7B184458529842434941BC18C
          F814DE796B050B66CF01ABDFDFB4F99B0F1F7AA228CC452A248A1471D7C34312
          158BB88E8B14F2B549008499E1C53CFC428089347E18305C18E76EF6017707FA
          284BC4F13CD78B54F85D6363CBDB00DA44C26288C762C48447C2F1306184D506
          21849E740689447C5E3A3DC0D9F3E7084B3EC65AB4D6842A24542141140202AC
          492238DCD8B86719D696BB5232B52C49CC71881B0F1D4584618894B26A12400A
          5936343444269BE59FE1D31646852027102308D12985E81142FC097423C85B78
          D5952E95C969C4707000630DC61A80FC2400D02BA4EC726000B803745BB885B5
          778F1F6F19E5317DB061F774604EB27C0A1565291C213002948ED0468320F338
          E0E3D6D63DFD8F073D4535025E7F69EA741CC7A164228A5A3192CF51F24B38D2
          B93009F08CE1482167194C6C2C9FA32F9F25EE78F464FAB8D9DB8D141221C599
          C777F0AC6A1388AEC191CCBC33D72EE2B92EE9E12194899052FE88A50D26BCA6
          FF471B37B62CB2D69E30C6D45B400A714308710038DCDABA473D37006043E397
          55581A2C844270F9786B4B76E2FA7303FE4B2FFC57F1377C82542CFBAE89F900
          00000049454E44AE426082}
        TabOrder = 1
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
    end
  end
end
