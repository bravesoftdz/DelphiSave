inherited rptCartDocTraspasoIngreso: TrptCartDocTraspasoIngreso
  Height = 1056
  DataSet = sdqEmpresas
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE'
    'QRSTRINGSBAND1')
  Functions.DATA = (
    '0'
    '0'
    #39#39
    #39#39)
  Page.PaperSize = Letter
  Page.Values = (
    50.010000000000000000
    2794.000000000000000000
    40.010000000000000000
    2159.000000000000000000
    50.010000000000000000
    50.010000000000000000
    0.000000000000000000)
  inherited qrbPageHeader: TQRBand
    Height = 450
    LinkBand = ChildBand1
    Size.Values = (
      1190.625000000000000000
      2058.458333333333000000)
    inherited qrlDestDomicilio: TArtQRLabel
      Width = 313
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        354.541666666667000000
        828.145833333333000000)
      FontSize = 8
    end
    inherited qrlDestDomicilio_Abajo: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        386.291666666667000000
        793.750000000000000000)
      FontSize = 8
    end
    inherited qrlDestNombre: TArtQRLabel
      Width = 277
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        280.458333333333000000
        732.895833333333000000)
      FontSize = 8
    end
    inherited qrlRemNombre: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        95.250000000000000000
        280.458333333333000000
        923.395833333333000000)
      FontSize = 8
    end
    inherited qrlRemDomicilio: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        95.250000000000000000
        354.541666666667000000
        923.395833333333000000)
      FontSize = 8
    end
    inherited qrlRemCPostal: TArtQRLabel
      Width = 89
      Size.Values = (
        44.979166666666700000
        95.250000000000000000
        423.333333333333000000
        235.479166666667000000)
      FontSize = 8
    end
    inherited qrlRemLocalidad: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        359.833333333333000000
        423.333333333333000000
        383.645833333333000000)
      FontSize = 8
    end
    inherited qrlDestProvincia: TArtQRLabel
      Top = 160
      Width = 82
      Height = 17
      Size.Values = (
        44.979166666666700000
        1746.250000000000000000
        423.333333333333000000
        216.958333333333000000)
      Font.Height = -11
      FontSize = 8
    end
    inherited qrlDestLocalidad: TArtQRLabel
      Top = 160
      Height = 17
      Size.Values = (
        44.979166666666700000
        1299.104166666670000000
        423.333333333333000000
        386.291666666667000000)
      Font.Height = -11
      FontSize = 8
    end
    inherited qrlRemLocalidad1: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        359.833333333333000000
        1111.250000000000000000
        394.229166666667000000)
      FontSize = 8
    end
    inherited qrlRemCPostal1: TArtQRLabel
      Left = 40
      Width = 89
      Size.Values = (
        44.979166666666700000
        105.833333333333000000
        1111.250000000000000000
        235.479166666667000000)
      FontSize = 8
    end
    inherited qrlRemDomicilio1: TArtQRLabel
      Left = 40
      Size.Values = (
        44.979166666666700000
        105.833333333333000000
        1039.812500000000000000
        923.395833333333000000)
      FontSize = 8
    end
    inherited qrlRemNombre1: TArtQRLabel
      Left = 40
      Size.Values = (
        44.979166666666700000
        105.833333333333000000
        963.083333333333000000
        923.395833333333000000)
      FontSize = 8
    end
    inherited qrlDestNombre1: TArtQRLabel
      Width = 277
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        963.083333333333000000
        732.895833333333000000)
      FontSize = 8
    end
    inherited qrlDestDomicilio1: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        1039.812500000000000000
        828.145833333333000000)
      FontSize = 8
    end
    inherited qrlDestLocalidad1: TArtQRLabel
      Top = 420
      Height = 17
      Size.Values = (
        44.979166666666700000
        1299.104166666670000000
        1111.250000000000000000
        396.875000000000000000)
      Font.Height = -11
      FontSize = 8
    end
    inherited qrlDestProvincia1: TArtQRLabel
      Top = 420
      Height = 17
      Size.Values = (
        44.979166666666700000
        1746.250000000000000000
        1111.250000000000000000
        216.958333333333000000)
      Font.Height = -11
      FontSize = 8
    end
    inherited qrlNumero: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        1047.750000000000000000
        21.166666666666700000
        235.479166666667000000)
      FontSize = 8
    end
    inherited qrlNumero1: TArtQRLabel
      Top = 284
      Size.Values = (
        44.979166666666700000
        105.833333333333000000
        751.416666666667000000
        235.479166666667000000)
      FontSize = 8
    end
    inherited qrlBarras2: TArtQRLabel
      Size.Values = (
        121.708333333333000000
        349.250000000000000000
        730.250000000000000000
        679.979166666667000000)
      FontSize = 30
    end
    inherited qrlBarras1: TArtQRLabel
      Size.Values = (
        121.708333333333000000
        1291.166666666670000000
        10.583333333333300000
        679.979166666667000000)
      FontSize = 30
    end
    inherited qrlContrato: TQRLabel
      Height = 18
      Size.Values = (
        47.625000000000000000
        95.250000000000000000
        10.583333333333330000
        291.041666666666700000)
      FontSize = 10
    end
    inherited qrlSector: TQRLabel
      Height = 18
      Size.Values = (
        47.625000000000000000
        582.083333333333400000
        10.583333333333330000
        142.875000000000000000)
      FontSize = 10
    end
    inherited QRAngledLabel1: TQRAngledLabel
      Left = 702
      Size.Values = (
        312.208333333333400000
        1857.375000000000000000
        407.458333333333400000
        31.750000000000000000)
      FontSize = 7
    end
    inherited QRAngledLabel2: TQRAngledLabel
      Left = 714
      Size.Values = (
        187.854166666666700000
        1889.125000000000000000
        698.500000000000000000
        29.104166666666670000)
      FontSize = 6
    end
    inherited QRAngledLabel3: TQRAngledLabel
      Top = 296
      Size.Values = (
        97.895833333333340000
        1915.583333333333000000
        783.166666666666800000
        29.104166666666670000)
      FontSize = 6
    end
    inherited QRAngledLabel4: TQRAngledLabel
      Size.Values = (
        230.187500000000000000
        1942.041666666667000000
        656.166666666666800000
        29.104166666666670000)
      FontSize = 6
    end
    inherited QRAngledLabel5: TQRAngledLabel
      Left = 744
      Top = 296
      Size.Values = (
        100.541666666666700000
        1968.500000000000000000
        783.166666666666800000
        29.104166666666670000)
      FontSize = 6
    end
    inherited QRAngledLabel6: TQRAngledLabel
      Size.Values = (
        161.395833333333300000
        2000.250000000000000000
        724.958333333333400000
        29.104166666666670000)
      FontSize = 6
    end
    inherited QRAngledLabel7: TQRAngledLabel
      Size.Values = (
        82.020833333333340000
        1883.833333333333000000
        476.250000000000000000
        29.104166666666670000)
      FontSize = 6
    end
    inherited QRAngledLabel8: TQRAngledLabel
      Left = 724
      Top = 114
      Size.Values = (
        256.645833333333400000
        1915.583333333333000000
        301.625000000000000000
        29.104166666666670000)
      FontSize = 6
    end
    inherited QRAngledLabel9: TQRAngledLabel
      Size.Values = (
        158.750000000000000000
        1942.041666666667000000
        402.166666666666600000
        29.104166666666670000)
      FontSize = 6
    end
    inherited QRAngledLabel10: TQRAngledLabel
      Left = 744
      Size.Values = (
        119.062500000000000000
        1968.500000000000000000
        439.208333333333400000
        29.104166666666670000)
      FontSize = 6
    end
    inherited QRAngledLabel11: TQRAngledLabel
      Left = 756
      Size.Values = (
        164.041666666666700000
        2000.250000000000000000
        396.875000000000000000
        29.104166666666670000)
      FontSize = 6
    end
    inherited QRAngledLabel12: TQRAngledLabel
      Left = 764
      Top = 104
      Size.Values = (
        283.104166666666700000
        2021.416666666667000000
        275.166666666666700000
        29.104166666666670000)
      FontSize = 6
    end
    inherited QRImage1: TQRImage
      Size.Values = (
        709.083333333333000000
        1844.145833333330000000
        214.312500000000000000
        216.958333333333000000)
      Picture.Data = {
        0954474946496D616765CD0B000047494638396152000C01F70000FFFFFF0000
        00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF6020007728008E2F00A43700BB3E00D24600E84D00FF5500FF6C22FF8244FF
        9966FFB088FFC6AAFFDDCC3322004A3100604000774F008E5E00A46E00BB7D00
        D28C00E89B00FFAA00FFB522FFC144FFCC66FFD788FFE3AAFFEECC3333004747
        005C5C00707000858500999900ADAD00C2C200D6D600EBEB00FFFF00FFFF29FF
        FF52FFFF7AFFFFA3FFFFCC223300314A004060004F77005E8E006EA4007DBB00
        8CD2009BE800AAFF00B5FF22C1FF44CCFF66D7FF88E3FFAAEEFFCC1133001A4D
        002266002B80003399003CB30044CC004DE60055FF0068FF1D7CFF3A8FFF57A3
        FF75B6FF92CAFFAFDDFFCC003300005000006D00008A0000A80000C50000E200
        00FF001AFF1A33FF334DFF4D66FF6680FF8099FF99B3FFB3CCFFCC003311004D
        1A00662200802B00993300B33C00CC4400E64D00FF551DFF683AFF7C57FF8F75
        FFA392FFB6AFFFCACCFFDD003322004A3100604000774F008E5E00A46E00BB7D
        00D28C00E89B00FFAA22FFB544FFC166FFCC88FFD7AAFFE3CCFFEE003333004D
        4D00666600808000999900B3B300CCCC00E6E600FFFF1DFFFF3AFFFF57FFFF75
        FFFF92FFFFAFFFFFCCFFFF001A3300285000376D00458A0054A80062C50071E2
        0080FF1A8CFF3399FF4DA6FF66B3FF80BFFF99CCFFB3D9FFCCE6FF0000330000
        550000770000990000BB0000DD0000FF1717FF2D2DFF4444FF5B5BFF7171FF88
        88FF9F9FFFB5B5FFCCCCFF1A003326004D3300664000804D00995900B36600CC
        7300E68000FF8E1DFF9D3AFFAB57FFBA75FFC892FFD7AFFFE6CCFF3300334D00
        4D660066800080990099B300B3CC00CCE600E6FF00FFFF1DFFFF3AFFFF57FFFF
        75FFFF92FFFFAFFFFFCCFF33001A4D002666003380004099004DB30059CC0066
        E60073FF0080FF1D8EFF3A9DFF57ABFF75BAFF92C8FFAFD7FFCCE62C00000000
        52000C010008FF000108FC07E09F4183030F1E2C4810A1C3860A231264F890A1
        C58A0F252E14C83180C78F20438A1C49B2A4C99328390208A0B26547972A59C2
        14281366CD96375DE6D41973664F9F3B7FDA9C19F4A5CF9542811E2D4A53E950
        A750911E954A7469D4A43CAD1AD55AF52AD6AD4FA332059BB56B589C5CCD52F5
        FAB56DD3B365D58E7DAB362E5AB877C54E5D6B376F5FBA78FDCEE5EBF72F60B7
        87E30E1ECB982D61C48017A735FCB87262C17B1B3BAEAC59EFD4CE812F5B1EBD
        56F266CB45419F355DB7B05BD58A334F764DB636E4D2B24F334D3D1BF36794C0
        830B37797B346CDBC63F173F8E9C73EFA4AC438B767E1AB772DD8E99838D4E19
        75EBDB37B9D3FF6ECEBB7AF8DCDFC9A79F1E19BD74EFEFE79EBFBE1E7E77F9CB
        9F4F2FFFBDE67CFDC9A507DA47D0B9775F765A79C4D77FD86DC6DF50FEF906A0
        760F66A5604E0CD617944CBB69189382DB1938DE7E1E9695617CFA55885687CD
        B5C8E1562C1E182369C96148228A2385481F8477CDF853482FCD285E4F36DAB7
        628F460E69149037F254247E2DB2771C4BBC3DB992483A4E981681D43149DA89
        326229D585C869D7DE8E32C25822870C2A29254D549609279748BD48159823D6
        291788552269678451D678D886CE5979E599ECBD696790A1C5F9E38E6ED629A6
        A3E3513929A422426629902A1229A6755A2A45288E0F46BA299D94BE762593FE
        ED84A7A64FF9FFE8224E6D666ADB9F708A3665960DFAF956AA8FD28561AD68AE
        E8A5A32FF619ECA112F61A2BAEAC2ED81488B1150B2B513602BBA85CB6FE9AEB
        B4DE520BEEAAD44299A8A0638E9B6CB600828A1DAE7AA67BEAB64E7A8B68837C
        322A6F57C7A67B677EEF62A9EC92FE027AAE991D466B25BCEE7A9863BCB41EB9
        F0A7AFCEFAA1BE11133967B9985ACBABA49CB26B1EC0FCBAFA1849017AD930A9
        0A374A2E97DA7E8CA28375715CE4CA078A2A708E19C67CAFC3975EDCA5C90FE3
        9CE780AA3E6C2E8D087F8B31BD791AED299D35EE7CE4C8818AFBAF8322F7BB65
        663753C8AEA19E2D15F6AF802A0CD2B8049B989FCAC8867B75BDCB72EBB1BA72
        7B9AB7D765E3FFBB68CCF942CCA3DD66539CE0DACC266B15D415BFC9F5DE6A32
        4EF2B3A802C5B3B420232E75909A0B5E70DB74834EB8E579F90C78BD648F8E6D
        E9989F7E75BF4537CEAC9A2F63CCB6EDDD19DDAAE14EB17AB9A87DAF0A6BA7BA
        A28D7B81B9DE1CF97A447F9E79E5A02B2FECCB81E31527BCC0227FA8F4FF124F
        18B27F27496B78B1B76EB9C0EDE26930ED732E8978F3D86F4C6C8C54B3899BC8
        C2C70B2DEBA21B2BEDFAA72313DEF62594F9C46E7D634A15E00C163702B2CF5F
        10F259FBD006B3ED712E5AB5D311FDC435AA0D420D3C939B1ECDE6F61EEB94AF
        779A9B97002D9442EA01503670339FD0B4763B083A6D73DF0A5FEAC8D79E1D56
        2B81339C9EA1FFB4563DCFFD6954F6FA5BF994E642175EEF52274CA2084BE432
        AC49F14EC3C9A2168153C06D354D40E90BE1D1106445A685AA8AF53121EFA868
        1833E13040CC63E36A9A34333496F03F3484A374CAC337D511F18C6D345F144F
        16A14DE98D8589CBA0E98A47162252AA90B31BA0A518C5A6F7752C921D79E4D3
        F2052D48BAD1803AABDFD01249A00F4649765F7419130769AA14F12B56AAABE3
        1EE5F8436751C67B5F0A56F86CA9AA32C6CF717194E51C9DE7C42D1A538BBA9C
        A2307B994603AE719972F265B7F458A930660D90D594A6FCAE15CC9C79E66CBC
        8C6633EBB6355A8AF38EE444E018C1A8CD417A3390DAC4E68870B9B4568EF09D
        C3942762E879FFC970AA079ADAF3271DB949B8180A949F5FC31C35E7694EE481
        B3A1D41967FFD449D06C4AD45E303AA6464B7249834214A1C103E8402DF64D81
        1AA9A23FCC632AE179D10571EF5A7CCA1E306339BBA6D98F912D1DD63AABE245
        88224AA55AEAA948CF24ABE1A16FA86F5CA945D1E9BE3EE293994C3D58508FFA
        54DF1495A42C8DAA0D773A4BA43AD3A9EBC460551D6AD206CA74A1560D250717
        97B7B1CA4C270F8D20A77C0A2AB8C5F59674056517F9D74DAE0EF36C1E95EBDA
        406AB7BBFA15AAB9D3EB03DD4AD87CC630A6164B5B5E9773D359E1EFB0CD5ADD
        F7D8AA31AFFE886292035E67DDFAD30DB9B34796F46C235F8AD5A526B62DE562
        5863F6A7DA41FFE91482B36D2B66B5A752D972567194E358420F88D1DC3A9084
        5BAD25B69EE924AA22D7946FDDED486B08DD9FD9E4B4FB2C19F442DADC9941B6
        B1CA0D8B28452B5CD226D56DE4ED2558332BDEB5A6574EA9CBA7CE5836589E22
        29A1855BEF3F4387519A4AF7A4174C2D77C7D7390AF52751A844EF814B555EFF
        7E85A2DB29E267719860BE3EAB9C736B1C2A3F852E0C4F58C36284A92657D360
        F9FA947CA6EC603F97ABDFCB9CF5C52B26314AE19B53F498EC9EC612AB833907
        CDEC5DAFC6BF61AE60AA57415C9ED76FDD1B31904305BB8C462E68031EDE7D57
        3849082338C4B8F32291251CB50ADB979C35D45F0BF14B3AED963869578C328F
        7366484925CFFF79F5B4F17607B72EA7A9B0BAE7056A068D98C85B5D396B09F3
        D521DB7466F6F60592BA7CDFEF5698CB6B4E90BAD3851888AFC9E8E77152B71F
        0621A01B09CBFDE978CE268EA042F3A7BF69D1F6BE6A16967B196DD63E9FF5CF
        5265DD0B7976392692794D0A24E3A0620CD767821AAAAC8D6E01FFB2AEB97EBA
        CB24BB31F3C606E51D2B938285BEA1E7900D68C34D2C64C8A576ACBF3CD16207
        AEB271BE1B9FDDA52C8639BB6A18FC239DFB1B6AD2DE79941E0EAFBB75AD55C9
        3CB6C5E566B7BC33B6587D67127DBF4C3526290A5D1E963AB986E6F7B32127E9
        CE9ABBDD395EABB5E5F6475B0BDCA6E1FADD9203D6B2E3CE38A02C1E330DDFFD
        ED04FE3AE1D0B221B4954BBEC85B8B97D8FBF134AACF3D49C508F7A62C97E1C5
        4F38F2CFA1ECDD8DDEB6608B8CE9D6EEFBE3C643385A417EDD8D3ABD7310473A
        80671A75A367B7B6663CE8641DFDD1AD0B9DB15ECF7AD7B16ECFBE4AFDC8635F
        B8A6BF8EDAB65DA892C67E74B8F3DB42FB0157713ADCDADC45CBDF4B3B3CC992
        75399B93595C062A99E6FAC469BDA76960B233DE958E1777E3CDEB65918217E5
        56DFEF7F4BF3F4CE777E2FA00FBDE8474FFAD29BFEF4A80F08003B}
    end
    inherited QRImage2: TQRImage
      Size.Values = (
        214.312500000000000000
        1058.333333333330000000
        724.958333333333000000
        767.291666666667000000)
      Picture.Data = {
        0954474946496D616765D907000047494638396122015100F70000FFFFFF0000
        00000000FFFFFF3737374949495B5B5B6D6D6D808080929292A4A4A4B6B6B6C8
        C8C8DBDBDBEDEDEDFFFFFF3300004D0000660000800000990000B30000CC0000
        E60000FF0000FF1D1DFF3A3AFF5757FF7575FF9292FFAFAFFFCCCC3311004A19
        006020007728008E2F00A43700BB3E00D24600E84D00FF5500FF6C22FF8244FF
        9966FFB088FFC6AAFFDDCC3322004A3100604000774F008E5E00A46E00BB7D00
        D28C00E89B00FFAA00FFB522FFC144FFCC66FFD788FFE3AAFFEECC3333004747
        005C5C00707000858500999900ADAD00C2C200D6D600EBEB00FFFF00FFFF29FF
        FF52FFFF7AFFFFA3FFFFCC223300314A004060004F77005E8E006EA4007DBB00
        8CD2009BE800AAFF00B5FF22C1FF44CCFF66D7FF88E3FFAAEEFFCC1133001A4D
        002266002B80003399003CB30044CC004DE60055FF0068FF1D7CFF3A8FFF57A3
        FF75B6FF92CAFFAFDDFFCC003300005000006D00008A0000A80000C50000E200
        00FF001AFF1A33FF334DFF4D66FF6680FF8099FF99B3FFB3CCFFCC003311004D
        1A00662200802B00993300B33C00CC4400E64D00FF551DFF683AFF7C57FF8F75
        FFA392FFB6AFFFCACCFFDD003322004A3100604000774F008E5E00A46E00BB7D
        00D28C00E89B00FFAA22FFB544FFC166FFCC88FFD7AAFFE3CCFFEE003333004D
        4D00666600808000999900B3B300CCCC00E6E600FFFF1DFFFF3AFFFF57FFFF75
        FFFF92FFFFAFFFFFCCFFFF001A3300285000376D00458A0054A80062C50071E2
        0080FF1A8CFF3399FF4DA6FF66B3FF80BFFF99CCFFB3D9FFCCE6FF0000330000
        550000770000990000BB0000DD0000FF1717FF2D2DFF4444FF5B5BFF7171FF88
        88FF9F9FFFB5B5FFCCCCFF1A003326004D3300664000804D00995900B36600CC
        7300E68000FF8E1DFF9D3AFFAB57FFBA75FFC892FFD7AFFFE6CCFF3300334D00
        4D660066800080990099B300B3CC00CCE600E6FF00FFFF1DFFFF3AFFFF57FFFF
        75FFFF92FFFFAFFFFFCCFF33001A4D002666003380004099004DB30059CC0066
        E60073FF0080FF1D8EFF3A9DFF57ABFF75BAFF92C8FFAFD7FFCCE62C00000000
        220151000008FE0001081C48B0A0C18308132A5CC8B0A1C38710234A9C48B1A2
        C58B18336ADCC8B1A3C78F2043560C40B2A4C9932853AA5CC9B2A5CB973063CA
        9C49B3A6CD9B3873AE2CA8B3A7CF9F40830A1D4AB428CF0022932A3D4872A9D3
        A7501B36253835AAD58D55AF6ADD0A322B00AF5CC33A042BB6ACD9B148A9A63D
        CB96E9DAB670E30AF44A566ED9BA76F36AA5FB56EFDDBE7E0347E52BD82CDEC2
        883F124ECCF530E3C7181743560838A3E3C998234ACE3CB064D7CA9C433FDC9C
        B86F53D096518B5E9D907460CF543B87BCCCBAF65CD3AAE19E76FB75766EDBB6
        5DDB5D8B1AB647DAC0570B1F8EF4F7EF89C8479BBC3D3DB66CEBD4B1CFA56EFC
        2BDECA2779FE1AAC7E9D7BF4F1B819777F7A5EEA78F1DB89BF25DE39ADE9ED4C
        CBC7063C5F76FFF2CDE9D71B74E941361F4A8A3D07117FF0F5461F7D035E775F
        84DA5118DF7B0046589C860D6A562047E15196E0671D9187207E03DA87DF842C
        863861866A1907A17C2AAE1822814795D82186A309E823880AF6D8E081B03D88
        E28AF081B7E38D47D6576492D54148D17223ED68A58815B62791960B3108638A
        6AF957D59835F2E8A5854AA2F8DF8C152EF8A1462F7AC7244371A63422883C5E
        B85F8737F6C9E47A68B6F96294E2C5E9668E2592875090810EC6687299512912
        A056CEE91497903E2629744886595C7B761EF768A606BE6959A76AF236EAA5AB
        925A9AA9FE91A17A9B851CA2F7E75298BA5AD8A65BCAEA247AB4D2896BABBA0A
        C6AB8796B629A7B04E2A8A15B1C5FA75EC5E5D2A2B6AB4C94D0BE7898B56FBE3
        B5D806076B64F6118B5BB249E51A2E73886235AB458C869AE8BAB5693B56935F
        9A87A9BA94414BAF6EE3C28B6FA3D2511AECB3FF2A17F048DC12EC1E98614EEA
        6FC267D91BABB5DD42ACEFC4BC51CC99C5E41ADC5AC3AC1665F2C9280FD52EC2
        DE0959E6C32F3F9BF2CC34D71CD3CAA7B6BCA0AF24D7C831B01E47BAF09403CB
        0B716E6B0E4C6ED042E37CF1A83EFF98F4C117F1CB745820774972BFB7F2B975
        6A574F9675950C3BCB6AD8A53A3DA9D2D2FE8CB6A36A57ED6CCCCD42BDEC9D6F
        233676FE6B5E772DA0D947E39DB7B143738A719E8DA6F9ADDC83EB5D78AF872F
        99647E914FE976E34AED3D32A0731A2DE7DC80838DF96B8FE359795B568F3E6C
        DC5D5DC9B7C6EC5DAE3A89119BEE30D594C73C55EA40375624B78AB3CDECAFC4
        7357BCC4AC139D65E8AFBF5CAE6F58D79725AD59B55ABD84F9D68A7CED70BA6E
        B8F3C22FBD956AF73138E3EEDF1D5C2E99632ECEB2F4B687EF66D7B2279F3996
        A95A1775FE190F89BD9ABCD39AFD08243251A18B71E3C3DFE706A53129514E3B
        0E4455FD7AF7AEE008EE2AF281E0DF222625F2494E82FC831EF7DA56C118D1CE
        7774D9A00A8924B518B1CF84C71321FC5E5342E94DB086B303D8002B5634F721
        30875572D1DC6094B69B1302518723CC8BE7B273C12356AC749A6AA213FFB2C3
        B005708AEFC3E1E8AE8845D1CD30875CECE20FB588B9308A916155BC9A19CF88
        A3246EF1866CF4501A99B6C6381ECA8D6584A31DD13210806C00001020804083
        07112654B8906143870F21465C485062458B173166D4B81123C5831E39861439
        F22148922751A654D9B1E047822F61C6943993664D9B3771E6D4B993674F9F3F
        8106153AB42642A247912655BA946953A74F5746953A956A55AB57B166D5BA95
        6B57AE0101003B}
    end
    inherited qrlDestNombre_Abajo: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        312.208333333333000000
        785.812500000000000000)
      FontSize = 8
    end
    inherited qrlDestNombre1_Abajo: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        994.833333333333000000
        785.812500000000000000)
      FontSize = 8
    end
    inherited qrlDestDomicilio1_Abajo: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        1071.562500000000000000
        828.145833333333000000)
      FontSize = 8
    end
    inherited qrlRegistroCodFirma: TQRLabel
      Height = 18
      Size.Values = (
        47.625000000000000000
        95.250000000000000000
        95.250000000000000000
        343.958333333333400000)
      FontSize = 10
    end
    inherited qrlOrden: TQRLabel
      Size.Values = (
        44.979166666666700000
        751.416666666667000000
        95.250000000000000000
        291.041666666667000000)
      FontSize = 10
    end
    inherited qrlDelegacion: TQRLabel
      Size.Values = (
        44.979166666666700000
        423.333333333333000000
        137.583333333333000000
        976.312500000000000000)
      FontSize = 10
    end
    inherited qrlRemProvincia: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        814.916666666667000000
        423.333333333333000000
        203.729166666667000000)
      Font.Height = -11
      FontSize = 8
    end
    inherited qrlRemProvincia1: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        814.916666666667000000
        1111.250000000000000000
        203.729166666667000000)
      Font.Height = -11
      FontSize = 8
    end
    inherited qrlDestCPostal: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        423.333333333333000000
        224.895833333333000000)
      FontSize = 8
    end
    inherited qrlDestCPostal1: TArtQRLabel
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        1111.250000000000000000
        224.895833333333000000)
      FontSize = 8
    end
    inherited qrlLeyendaAcuse: TQRLabel
      Size.Values = (
        44.979166666666670000
        748.770833333333400000
        182.562500000000000000
        1296.458333333333000000)
      FontSize = 10
    end
  end
  inherited qrbSummary: TQRBand
    Top = 1054
    Enabled = False
    Size.Values = (
      5.291666666666667000
      2058.458333333333000000)
    BandType = rbGroupFooter
  end
  inherited qrbPageFooter: TQRBand
    Top = 1056
    Height = 144
    AlignToBottom = False
    Size.Values = (
      381.000000000000000000
      2058.458333333333000000)
    inherited qriFirma: TQRImage
      Left = 539
      Top = 3
      Width = 72
      Height = 40
      Size.Values = (
        105.833333333333000000
        1426.104166666670000000
        7.937500000000000000
        190.500000000000000000)
    end
    inherited qrlFirmante: TArtQRLabel
      Left = 459
      Top = 44
      Size.Values = (
        44.979166666666700000
        1214.437500000000000000
        116.416666666667000000
        648.229166666667000000)
      Caption = ''
      Font.Height = -13
      FontSize = 10
    end
    inherited qrlDocumento: TArtQRLabel
      Left = 459
      Top = 70
      Size.Values = (
        44.979166666666700000
        1214.437500000000000000
        185.208333333333000000
        648.229166666667000000)
      Caption = ''
      Font.Height = -13
      FontSize = 10
    end
    inherited qrlCaracter: TArtQRLabel
      Left = 459
      Top = 92
      Size.Values = (
        44.979166666666700000
        1214.437500000000000000
        243.416666666667000000
        648.229166666667000000)
      Caption = ''
      Font.Height = -13
      FontSize = 10
    end
    inherited qrlOrdenPie: TQRLabel
      Size.Values = (
        44.979166666666700000
        814.916666666667000000
        243.416666666667000000
        291.041666666667000000)
      FontSize = 10
    end
    inherited qrmInfoPie: TQRRichText
      Size.Values = (
        1627.187500000000000000
        145.520833333333300000
        330.729166666666700000
        1817.687500000000000000)
    end
    inherited qrlDelegacionPie: TQRLabel
      Left = 308
      Width = 110
      Size.Values = (
        44.979166666666700000
        814.916666666667000000
        285.750000000000000000
        291.041666666667000000)
      FontSize = 10
    end
  end
  object qrbDetail: TQRBand [3]
    Left = 19
    Top = 790
    Width = 778
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      42.333333333333340000
      2058.458333333333000000)
    BandType = rbDetail
    object QRShape2: TQRShape
      Left = 109
      Top = -1
      Width = 500
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        288.395833333333000000
        -2.645833333333330000
        1322.916666666670000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRDBText2: TQRDBText
      Left = 110
      Top = 1
      Width = 348
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        291.041666666667000000
        2.645833333333330000
        920.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqEmpresas
      DataField = 'SA_NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 459
      Top = 1
      Width = 149
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1214.437500000000000000
        2.645833333333330000
        394.229166666667000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqEmpresas
      DataField = 'SA_CUIT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = ImprimeCuit
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape5: TQRShape
      Left = 458
      Top = -2
      Width = 1
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1211.791666666670000000
        -5.291666666666670000
        2.645833333333330000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrGroupHeader: TQRGroup [4]
    Left = 19
    Top = 790
    Width = 778
    Height = 0
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      0.000000000000000000
      2058.458333333333000000)
    Expression = 'DIV(ROWNUM,16)'
    FooterBand = qrbSummary
    Master = Owner
    ReprintOnNewPage = False
  end
  object ChildBand1: TQRChildBand [5]
    Left = 19
    Top = 530
    Width = 778
    Height = 260
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      687.916666666666800000
      2058.458333333333000000)
    ParentBand = qrbPageHeader2
    object QRMemo4: TQRMemo
      Left = 2
      Top = 172
      Width = 690
      Height = 56
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        148.166666666667000000
        5.291666666666670000
        455.083333333333000000
        1825.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      Lines.Strings = (
        
          '                           Con motivo de haber recibido solicitu' +
          'des de traspaso de empresas afiliadas a esta Aseguradora, solici' +
          'tamos tengan a bien emitir el correspondiente comprobante de "Si' +
          'tuaci'#243'n de Pago de Cuotas" y copia del plan de mejoramiento de l' +
          'os contratos que se detallan a continuaci'#243'n:')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel6: TQRLabel
      Left = 483
      Top = 98
      Width = 213
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        1277.937500000000000000
        259.291666666666700000
        563.562500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'REFERENCIA: Sit. Pago de Cuotas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel7: TQRLabel
      Left = 2
      Top = 142
      Width = 213
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        5.291666666666667000
        375.708333333333400000
        563.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'De nuestra mayor consideraci'#243'n: '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QrFecha: TQRLabel
      Left = 94
      Top = 8
      Width = 158
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        248.708333333333300000
        21.166666666666670000
        418.041666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '31 de Diciembre de 2003'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel9: TQRLabel
      Left = 2
      Top = 8
      Width = 91
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        5.291666666666667000
        21.166666666666670000
        240.770833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Buenos Aires, '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRNombreART: TQRLabel
      Left = 2
      Top = 30
      Width = 99
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        5.291666666666667000
        79.375000000000000000
        261.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRNombreART'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDireccionART: TQRLabel
      Left = 2
      Top = 48
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        5.291666666666667000
        127.000000000000000000
        259.291666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRDireccionART'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLocalidadART: TQRLabel
      Left = 2
      Top = 64
      Width = 101
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        5.291666666666667000
        169.333333333333300000
        267.229166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLocalidadART'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRShape1: TQRShape
      Left = 109
      Top = 243
      Width = 500
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Style = psInsideFrame
      Size.Values = (
        50.270833333333300000
        288.395833333333000000
        642.937500000000000000
        1322.916666666670000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel2: TQRLabel
      Left = 109
      Top = 244
      Width = 352
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        288.395833333333000000
        645.583333333333000000
        931.333333333333000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'RAZON SOCIAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 458
      Top = 244
      Width = 150
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1211.791666666670000000
        645.583333333333000000
        396.875000000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CUIT'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape4: TQRShape
      Left = 458
      Top = 243
      Width = 1
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        1211.791666666670000000
        642.937500000000000000
        2.645833333333330000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object ChildBand3: TQRChildBand [6]
    Left = 19
    Top = 806
    Width = 778
    Height = 248
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = ChildBand3AfterPrint
    AlignToBottom = False
    BeforePrint = ChildBand3BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      656.166666666666800000
      2058.458333333333000000)
    ParentBand = qrbDetail
    object QRMemo2: TQRMemo
      Left = 2
      Top = 27
      Width = 690
      Height = 200
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        529.166666666666800000
        5.291666666666667000
        71.437500000000000000
        1825.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      Lines.Strings = (
        
          '                           Asimismo, les informamos que dicho co' +
          'mprobante deber'#225' ser remitido hasta el d'#237'a 20 (veinte) del corri' +
          'ente (o el primer d'#237'a h'#225'bil siguiente si ese d'#237'a fuese feriado),' +
          ' caso contrario procederemos a la presentaci'#243'n del alta ante la ' +
          'Superintendencia de Riesgos del Trabajo.'
        ''
        
          '                           Ponemos a vuestra disposici'#243'n los for' +
          'mularios de Relevamiento General de Riesgos Laborales presentado' +
          's por los empleadores que solicitan el traspaso, sobre los cuale' +
          's puede realizar consultas u obtener copias en nuestras oficinas' +
          ' (Carlos Pellegrini 91, 4'#186' piso, CABA) de lunes a viernes en el ' +
          'horario de 10 a 17.30 hs.'
        ''
        
          '                           "Esta Aseguradora se hace responsable' +
          ' de los da'#241'os y perjuicios que pudiere ocasionar cualquier error' +
          ' en la informaci'#243'n contenida en la presente ".'
        ''
        
          '                           Agradeciendo la atenci'#243'n dispensada a' +
          ' la presente, saludamos a Ustedes muy atentamente.')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel5: TQRLabel
      Left = 453
      Top = 229
      Width = 146
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1198.562500000000000000
        605.895833333333400000
        386.291666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'PROVINCIA A.R.T.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape3: TQRShape
      Left = 109
      Top = -1
      Width = 500
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        288.395833333333000000
        -2.645833333333330000
        1322.916666666670000000)
      Pen.Style = psInsideFrame
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel8: TQRLabel
      Left = 109
      Top = 2
      Width = 349
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        288.395833333333000000
        5.291666666666670000
        923.395833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '    TOTAL DE EMPRESAS'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QrCantEmpresas: TQRExpr
      Left = 459
      Top = 2
      Width = 149
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1214.437500000000000000
        5.291666666666670000
        394.229166666667000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 10
    end
    object QRShape6: TQRShape
      Left = 458
      Top = 0
      Width = 1
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1211.791666666670000000
        0.000000000000000000
        2.645833333333330000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  inherited qrbPageHeader2: TQRChildBand
    Top = 465
    Size.Values = (
      171.979166666666700000
      2058.458333333333000000)
    inherited qrLogo: TQRImage
      Size.Values = (
        171.979166666666700000
        95.250000000000000000
        0.000000000000000000
        436.562499999999900000)
    end
  end
  object sdqEmpresas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT SA_NOMBRE, SA_CUIT, SA_IDARTANTERIOR, CA_FECHAALTA'
      '  FROM ATI_TRASPASOINGRESO,ASA_SOLICITUDAFILIACION, CCA_CARTA'
      ' WHERE TI_IDFORMULARIO = SA_IDFORMULARIO'
      '   AND TI_IDCARTA = CA_ID'
      '   AND TI_IDCARTA = :pIdCarta'
      ' ORDER BY SA_NOMBRE'
      ' ')
    Left = 19
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdCarta'
        ParamType = ptInput
      end>
  end
end
