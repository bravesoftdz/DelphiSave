object GamaCIU: TGamaCIU
  Left = 223
  Top = 113
  Width = 624
  Height = 443
  Caption = 'Gama de Anormalidad'
  Color = clBtnFace
  Constraints.MinHeight = 265
  Constraints.MinWidth = 506
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 134
    Width = 616
    Height = 282
    ActivePage = tsGama
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object tsGama: TTabSheet
      Caption = 'Gama Resultados'
      object dbgAnorma: TRxDBGrid
        Left = 0
        Top = 0
        Width = 608
        Height = 254
        Align = alClient
        DataSource = dsAnormal
        Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgAnormaDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'RA_CIIU'
            Title.Alignment = taCenter
            Title.Caption = 'CIIU'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MG_ESTUDIO'
            Title.Alignment = taCenter
            Title.Caption = 'Cód. Estu.'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ES_DESCRIPCION'
            Title.Caption = 'Descripción Estudio'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MG_MINIMO'
            Title.Alignment = taCenter
            Title.Caption = 'G.Mínimo'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MG_MAXIMO'
            Title.Alignment = taCenter
            Title.Caption = 'G.Máximo'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOT'
            Title.Alignment = taCenter
            Title.Caption = 'Tot. Anormales'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MEDIA'
            Title.Alignment = taCenter
            Title.Caption = 'Media Resultados'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 90
            Visible = True
          end>
      end
    end
    object tsEmpresas: TTabSheet
      Caption = 'Empresas'
      ImageIndex = 1
      object dbgEmpresas: TRxDBGrid
        Left = 0
        Top = 0
        Width = 608
        Height = 254
        Align = alClient
        DataSource = dsEmpres
        Options = [dgTitles, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgEmpresasDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ET_CUIT'
            Title.Caption = 'Cuit'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MP_NOMBRE'
            Title.Caption = 'Empresa'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 340
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOT'
            Title.Caption = 'Total'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MEDIA'
            Title.Caption = 'Media'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end>
      end
    end
    object tsEstudios: TTabSheet
      Caption = 'Estudios'
      ImageIndex = 2
      object dbgEstudios: TRxDBGrid
        Left = 0
        Top = 0
        Width = 608
        Height = 254
        Align = alClient
        DataSource = dsEstudios
        Options = [dgTitles, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgEstudiosDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ET_CUIL'
            Title.Caption = 'Cuil'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TJ_NOMBRE'
            Title.Caption = 'Nombre'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESULTADO'
            Title.Caption = 'Resultado'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 616
    Height = 134
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 24
      Height = 13
      Caption = 'CIIU:'
    end
    object Label5: TLabel
      Left = 8
      Top = 33
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object Label6: TLabel
      Left = 152
      Top = 33
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object Label7: TLabel
      Left = 8
      Top = 67
      Width = 38
      Height = 13
      Caption = 'Estudio:'
    end
    object Label1: TLabel
      Left = 8
      Top = 108
      Width = 44
      Height = 13
      Caption = 'Empresa:'
    end
    object Label2: TLabel
      Left = 8
      Top = 87
      Width = 69
      Height = 13
      Caption = 'Gama Mínimo:'
    end
    object Label3: TLabel
      Left = 144
      Top = 87
      Width = 70
      Height = 13
      Caption = 'Gama Máximo:'
    end
    object Label8: TLabel
      Left = 293
      Top = 87
      Width = 27
      Height = 13
      Caption = 'Total:'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 56
      Width = 603
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 4
      Top = 128
      Width = 603
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lEstudio: TEdit
      Left = 56
      Top = 64
      Width = 81
      Height = 19
      TabStop = False
      Color = clNavy
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object lEstudioDesc: TEdit
      Left = 144
      Top = 64
      Width = 355
      Height = 19
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clNavy
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object dbcActividad: TRxDBLookupCombo
      Left = 128
      Top = 4
      Width = 375
      Height = 21
      DropDownCount = 8
      Anchors = [akLeft, akTop, akRight]
      LookupField = 'AV_CODIGO'
      LookupDisplay = 'AV_DESCRIPCION'
      LookupSource = dsActividad
      TabOrder = 1
      OnCloseUp = dbcActividadCloseUp
    end
    object btnBuscar: TBitBtn
      Left = 514
      Top = 6
      Width = 85
      Height = 35
      Anchors = [akTop, akRight]
      Caption = '&Buscar'
      TabOrder = 4
      OnClick = btnBuscarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888800000888880000080F000888880F00080F000888880F
        0008000000080000000800F000000F00000800F000800F00000800F000800F00
        00088000000000000088880F00080F0008888800000800000888888000888000
        88888880F08880F0888888800088800088888888888888888888}
    end
    object lCuit: TEdit
      Left = 56
      Top = 104
      Width = 81
      Height = 19
      TabStop = False
      Color = clNavy
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object lCuitDesc: TEdit
      Left = 144
      Top = 104
      Width = 355
      Height = 19
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clNavy
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object btnLimpiar: TBitBtn
      Left = 514
      Top = 73
      Width = 85
      Height = 33
      Anchors = [akTop, akRight]
      Caption = 'Limpiar'
      TabOrder = 9
      OnClick = btnLimpiarClick
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A3A36B6B6BBCBCBCFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFF9F9F9FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF9C979715656570AAAA4E6666B2AFAFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA09E9E22
        525200EBEB62CBCB8AA5A5465555B1AEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF75666600DEDE00D5D500E8E8
        2EDADA00B1B1337070B0ADADFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFADA7A7008A8A00C6C600E8E800D9D900E0E000E4E482A7
        A74C5C5CB1AEAEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF5C626200969600EDED00D9D900DFDF00E2E200D6D662E8E880BABA226F6FB1
        AEAEFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFA49E9E2E7B7B00FFFF00
        D6D600DFDF00E1E100D7D700E7E700D0D035F0F07FAAAA465F5FB2AFAFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFF7774741C94942EDEDE00E0E000E2E200D7D7
        00E9E900CFCF3DEFEF5FCACA67E8E886B3B33D7070BDBCBC0000FFFFFFFFFFFF
        FFFFFFFFFFFF73596542696B93D1D13DDDDD00D6D600E9E900CFCF3DECEC62CA
        CA15F1F100C8C848FDFD55B9B96B6D6D0000FFFFFFFFFFFFFFFFFFFFFFFFBEA4
        0075541C546D6F93B4B433EAEA00CFCF3DEFEF62CACA22F3F300C8C82EF7F794
        D1D1576B6B6B6D6D0000FFFFFFFFFFFFFFFFFFB3973DFFFF00D1C88B663D4650
        737486D6D62BF1F160CACA00F2F227C9C955EDED15AEAE225454404242FFFFFF
        0000FFFFFFFFFFFFFFFFFFB59800F0F16FDFE0A3A79D945A0000008F8F8BBABA
        35F2F26EB6B65CBEBE6E7676000000898888FFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFC3AC1CE0E1AA9AA39ED29688A25A005C0000486E6E008F8F3D5C5C4C4A
        4A787676B2B2B2FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFBCA63DFDFCC3C6C8
        C49C89817C5C007C1C008C4444897E7E7D78787B7B7BB5B4B4FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFBDA759FBF9C0C7C8C5806335A79496AFA0A3AD
        A1A1B6AEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000B2946FF9F8A5C7C8C77D5D2EAD9FA0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000B49563E1E25D
        7E5F46AFA1A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000AE938D85856AB0ABABFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
    end
    object edGamaMinimo: TEdit
      Left = 84
      Top = 84
      Width = 53
      Height = 19
      TabStop = False
      Color = clNavy
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object edGamaMaximo: TEdit
      Left = 216
      Top = 84
      Width = 53
      Height = 19
      TabStop = False
      Color = clNavy
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object edGamaTotal: TEdit
      Left = 324
      Top = 84
      Width = 57
      Height = 19
      TabStop = False
      Color = clNavy
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object edCiiu: TPatternEdit
      Left = 56
      Top = 4
      Width = 70
      Height = 21
      MaxLength = 6
      TabOrder = 0
      OnExit = edCiiuExit
      OnKeyPress = edCiiuKeyPress
      Pattern = '0123456789'
    end
    object edDesde: TDateComboBox
      Left = 56
      Top = 28
      Width = 85
      Height = 21
      MaxDateCombo = edHasta
      TabOrder = 2
    end
    object edHasta: TDateComboBox
      Left = 188
      Top = 28
      Width = 85
      Height = 21
      MinDateCombo = edDesde
      TabOrder = 3
    end
  end
  object sdqAnormal: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'select ra_ciiu, ER_estudio, es_descripcion, ER_MINIMONORMAL, ER_' +
        'MAXIMONORMAL,'
      
        '       amp.Anormal_Tot_Act( :CIIU, ER_ESTUDIO, ER_MINIMONORMAL, ' +
        'ER_MAXIMONORMAL ) tot,'
      
        '       amp.Anormal_Media_Act( :CIIU, ER_ESTUDIO, ER_MINIMONORMAL' +
        ', ER_MAXIMONORMAL ) media'
      '  from AER_ESTRIESG, ara_riesporact, aes_estudios'
      ' where ra_ciiu = :CIIU'
      '   and ra_idrg = ER_idrg'
      '   and ER_estudio = es_codigo'
      'order by ra_ciiu, ER_estudio, ER_MINIMONORMAL')
    Left = 212
    Top = 244
    ParamData = <
      item
        DataType = ftString
        Name = 'CIIU'
        ParamType = ptInput
        Value = 342017
      end
      item
        DataType = ftString
        Name = 'CIIU'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIIU'
        ParamType = ptInput
      end>
    object sdqAnormalRA_CIIU: TStringField
      FieldName = 'RA_CIIU'
      Required = True
      Size = 6
    end
    object sdqAnormalER_ESTUDIO: TStringField
      FieldName = 'ER_ESTUDIO'
      Required = True
      Size = 8
    end
    object sdqAnormalES_DESCRIPCION: TStringField
      FieldName = 'ES_DESCRIPCION'
      Required = True
      Size = 100
    end
    object sdqAnormalER_MINIMONORMAL: TFloatField
      FieldName = 'ER_MINIMONORMAL'
    end
    object sdqAnormalER_MAXIMONORMAL: TFloatField
      FieldName = 'ER_MAXIMONORMAL'
    end
    object sdqAnormalTOT: TFloatField
      FieldName = 'TOT'
    end
    object sdqAnormalMEDIA: TFloatField
      FieldName = 'MEDIA'
    end
  end
  object dsAnormal: TDataSource
    DataSet = sdqAnormal
    Left = 240
    Top = 244
  end
  object sdqActividad: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'Select av_codigo, av_descripcion'
      'from cav_actividad'
      'order by av_descripcion')
    Left = 212
    Top = 204
    object sdqActividadAV_CODIGO: TStringField
      FieldName = 'AV_CODIGO'
      Required = True
      Size = 6
    end
    object sdqActividadAV_DESCRIPCION: TStringField
      FieldName = 'AV_DESCRIPCION'
      Size = 200
    end
  end
  object dsActividad: TDataSource
    DataSet = sdqActividad
    Left = 240
    Top = 204
  end
  object sdqEmpres: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT et_cuit, mp_nombre, count(*) tot,'
      
        '               AMP.Anormal_Media( et_cuit,  et_estableci, et_est' +
        'udio, 1,1) media'
      '  FROM aet_estrab, cmp_empresas '
      ' where exists ( select 1'
      '                  from cst_estableci'
      '                 where st_cuit = et_cuit '
      '                   and st_clave = et_estableci'
      '                   and st_actividad = '#39'342017'#39' )'
      '  AND et_cuit = mp_cuit '
      '  AND et_estudio = '#39'00000005'#39
      '  AND ET_FECHABAJA is null '
      '  AND et_resultado >= 30.01'
      '  AND et_resultado <= 40'
      'group by et_cuit, mp_nombre, et_estableci, et_estudio'
      'ORDER by mp_nombre ')
    Left = 212
    Top = 283
    object sdqEmpresET_CUIT: TStringField
      FieldName = 'ET_CUIT'
      Required = True
      Size = 11
    end
    object sdqEmpresMP_NOMBRE: TStringField
      FieldName = 'MP_NOMBRE'
      Size = 60
    end
    object sdqEmpresTOT: TFloatField
      FieldName = 'TOT'
    end
    object sdqEmpresMEDIA: TFloatField
      FieldName = 'MEDIA'
      DisplayFormat = '#,##0.00'
    end
  end
  object dsEmpres: TDataSource
    DataSet = sdqEmpres
    Left = 240
    Top = 283
  end
  object sdqEstudios: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'select et_cuil, tj_nombre, to_number( et_resultado ) resultado,'
      '          et_cuit, et_estableci, et_fecha'
      '  from aet_estrab, ctj_trabajadores'
      ' where exists ( select 1'
      '                  from cst_estableci'
      '                 where st_cuit = et_cuit'
      '                   and st_clave = et_estableci'
      '                   and st_actividad = '#39'342017'#39' )'
      '  AND et_cuil = tj_cuil'
      '  AND et_cuit = '#39'20144308078'#39
      '  AND ET_FECHABAJA is null '
      '  AND et_estudio = '#39'00000005'#39
      '  AND et_resultado >= 30.01'
      '  AND et_resultado <= 40')
    Left = 212
    Top = 323
    object sdqEstudiosET_CUIL: TStringField
      FieldName = 'ET_CUIL'
      Required = True
      Size = 11
    end
    object sdqEstudiosTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Size = 60
    end
    object sdqEstudiosRESULTADO: TFloatField
      FieldName = 'RESULTADO'
    end
    object sdqEstudiosET_CUIT: TStringField
      FieldName = 'ET_CUIT'
      Required = True
      Size = 11
    end
    object sdqEstudiosET_ESTABLECI: TFloatField
      FieldName = 'ET_ESTABLECI'
      Required = True
    end
    object sdqEstudiosET_FECHA: TDateTimeField
      FieldName = 'ET_FECHA'
      Required = True
    end
  end
  object dsEstudios: TDataSource
    DataSet = sdqEstudios
    Left = 240
    Top = 323
  end
end
