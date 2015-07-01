inherited frmVisitasManuales: TfrmVisitasManuales
  Caption = 'Agregar Visitas al Plan'
  ClientHeight = 590
  ClientWidth = 908
  ExplicitWidth = 916
  ExplicitHeight = 620
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 908
    Height = 34
    ExplicitHeight = 34
  end
  inherited CoolBar: TCoolBar
    Top = 34
    Width = 908
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 902
      end>
    ExplicitTop = 34
    inherited ToolBar: TToolBar
      Width = 893
      ExplicitWidth = 893
    end
  end
  inherited Grid: TArtDBGrid
    Top = 63
    Width = 908
    Height = 400
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VM_ESTABLECI'
        Title.Caption = 'Nro. Estab.'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VM_FECHADESDE'
        Title.Caption = 'F. Desde'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VM_FECHAHASTA'
        Title.Caption = 'F. Hasta'
        Width = 100
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 200
    Top = 96
    Width = 589
    Height = 314
    ExplicitLeft = 200
    ExplicitTop = 96
    ExplicitWidth = 589
    ExplicitHeight = 314
    inherited BevelAbm: TBevel
      Top = 278
      Width = 581
      ExplicitTop = 86
    end
    object Label7: TLabel [1]
      Left = 10
      Top = 138
      Width = 64
      Height = 13
      Caption = 'Fecha Desde'
    end
    object Label11: TLabel [2]
      Left = 182
      Top = 138
      Width = 61
      Height = 13
      Caption = 'Fecha Hasta'
    end
    object Label8: TLabel [3]
      Left = 10
      Top = 161
      Width = 33
      Height = 13
      Caption = 'Tareas'
    end
    object Label10: TLabel [4]
      Left = 4
      Top = 246
      Width = 46
      Height = 13
      Caption = 'Preventor'
    end
    inherited btnAceptar: TButton
      Left = 431
      Top = 284
      ExplicitTop = 92
    end
    inherited btnCancelar: TButton
      Left = 509
      Top = 284
      ExplicitTop = 92
    end
    object pcEmpresa: TPageControl
      Left = 0
      Top = 0
      Width = 589
      Height = 135
      ActivePage = tbAfiliada
      Align = alTop
      Style = tsFlatButtons
      TabOrder = 2
      ExplicitLeft = 229
      ExplicitTop = -6
      object tbAfiliada: TTabSheet
        Caption = 'Afiliada'
        DesignSize = (
          581
          104)
        object Label6: TLabel
          Left = 10
          Top = 10
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        inline fraEmpresa: TfraEmpresa
          Left = 50
          Top = 6
          Width = 531
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ExplicitLeft = 50
          ExplicitTop = 6
          ExplicitWidth = 531
          ExplicitHeight = 22
          DesignSize = (
            531
            22)
          inherited lbContrato: TLabel
            Left = 427
            ExplicitLeft = 427
          end
          inherited edContrato: TIntEdit
            Left = 474
            ExplicitLeft = 474
          end
          inherited cmbRSocial: TArtComboBox
            Width = 292
            ExplicitWidth = 292
          end
        end
        inline fraEstableci: TfraEstablecimientoDomic
          Left = 1
          Top = 36
          Width = 580
          Height = 47
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 1
          ExplicitTop = 36
          ExplicitWidth = 580
          DesignSize = (
            580
            47)
          inherited lbLocalidad: TLabel
            Left = 346
            Width = 46
            ExplicitLeft = 346
            ExplicitWidth = 46
          end
          inherited lbEstableci: TLabel
            Left = 7
            Width = 30
            ExplicitLeft = 7
            ExplicitWidth = 30
          end
          inherited lbCPostal: TLabel
            Left = 509
            Width = 20
            ExplicitLeft = 511
            ExplicitWidth = 20
          end
          inherited lbDomicilio: TLabel
            Left = 7
            Width = 42
            ExplicitLeft = 7
            ExplicitWidth = 42
          end
          inherited lbProvincia: TLabel
            Left = 346
            Width = 44
            ExplicitLeft = 346
            ExplicitWidth = 44
          end
          inherited cmbDescripcion: TArtComboBox [5]
            Left = 97
            Width = 259
            ExplicitLeft = 97
            ExplicitWidth = 259
          end
          inherited edCodigo: TIntEdit [6]
            Left = 49
            ExplicitLeft = 49
          end
          inherited edLocalidad: TEdit
            Left = 398
            Width = 111
            ExplicitLeft = 398
            ExplicitWidth = 111
          end
          inherited edCPostal: TEdit
            Left = 533
            Width = 48
            ExplicitLeft = 533
            ExplicitWidth = 48
          end
          inherited edDomicilio: TEdit
            Width = 289
            ExplicitWidth = 289
          end
          inherited edProvincia: TEdit
            Left = 398
            Width = 182
            ExplicitLeft = 398
            ExplicitWidth = 182
          end
          inherited sdqDatos: TSDQuery
            Left = 144
            Top = 5
          end
          inherited dsDatos: TDataSource
            Left = 115
            Top = 5
          end
        end
      end
      object tbNoAfiliada: TTabSheet
        Caption = 'No Afiliada'
        ImageIndex = 1
        object Label13: TLabel
          Left = 10
          Top = 7
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        object lbRSocial: TLabel
          Left = 138
          Top = 7
          Width = 38
          Height = 13
          Caption = 'R.Social'
          FocusControl = fraEmpresa.cmbRSocial
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 218
          Top = 87
          Width = 44
          Height = 13
          Caption = 'Contacto'
          FocusControl = fraEmpresa.cmbRSocial
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 3
          Top = 87
          Width = 42
          Height = 13
          Caption = 'Tel'#233'fono'
          FocusControl = fraEmpresa.cmbRSocial
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        inline fraDomicilio: TfraDomicilio
          Left = 2
          Top = 28
          Width = 576
          Height = 51
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ExplicitLeft = 2
          ExplicitTop = 28
          ExplicitWidth = 576
          DesignSize = (
            576
            51)
          inherited lbNro: TLabel
            Left = 361
            ExplicitLeft = 361
          end
          inherited lbPiso: TLabel
            Left = 433
            Width = 20
            ExplicitLeft = 433
            ExplicitWidth = 20
          end
          inherited lbDto: TLabel
            Left = 509
            Width = 20
            ExplicitLeft = 509
            ExplicitWidth = 20
          end
          inherited lbCPostal: TLabel
            Width = 39
            ExplicitWidth = 39
          end
          inherited lbCPA: TLabel
            Width = 21
            ExplicitWidth = 21
          end
          inherited lbLocalidad: TLabel
            Width = 46
            ExplicitWidth = 46
          end
          inherited lbProvincia: TLabel
            Left = 414
            Width = 44
            ExplicitLeft = 414
            ExplicitWidth = 44
          end
          inherited cmbCalle: TArtComboBox
            Width = 276
            ExplicitWidth = 276
          end
          inherited edNumero: TEdit
            Left = 383
            ExplicitLeft = 383
          end
          inherited edPiso: TEdit
            Left = 459
            ExplicitLeft = 459
          end
          inherited edDto: TEdit
            Left = 531
            ExplicitLeft = 531
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 144
            ExplicitWidth = 144
          end
          inherited edProvincia: TEdit
            Left = 463
            ExplicitLeft = 463
          end
          inherited btnBuscar: TButton
            Left = 326
            ExplicitLeft = 326
          end
        end
        object mskCUIT: TMaskEdit
          Left = 50
          Top = 3
          Width = 81
          Height = 21
          Hint = 'CUIT de la Empresa'
          EditMask = '99-99999999-9;0;'
          MaxLength = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object edRSocial: TEdit
          Left = 180
          Top = 3
          Width = 398
          Height = 21
          MaxLength = 60
          TabOrder = 1
        end
        object edContacto: TEdit
          Left = 266
          Top = 84
          Width = 312
          Height = 21
          MaxLength = 255
          TabOrder = 4
        end
        object edTelefono: TEdit
          Left = 49
          Top = 84
          Width = 158
          Height = 21
          MaxLength = 100
          TabOrder = 3
        end
      end
    end
    object edFechaDesde: TDateEdit
      Left = 79
      Top = 135
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object edFechaHasta: TDateEdit
      Left = 251
      Top = 135
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
    end
    object chkTareas: TCheckListBox
      Left = 52
      Top = 159
      Width = 531
      Height = 77
      Columns = 2
      ItemHeight = 13
      TabOrder = 5
    end
    inline fraPreventor: TfraCodigoDescripcion
      Left = 51
      Top = 241
      Width = 533
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      ExplicitLeft = 51
      ExplicitTop = 241
      ExplicitWidth = 533
      DesignSize = (
        533
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 68
        Width = 468
        CharCase = ecUpperCase
        ExplicitLeft = 68
        ExplicitWidth = 467
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
        ExplicitWidth = 64
      end
    end
  end
  object gbDetalleTareas: TJvgGroupBox [4]
    Left = 0
    Top = 463
    Width = 908
    Height = 127
    Align = alBottom
    Caption = 'Detalle Tareas'
    TabOrder = 4
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
    Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    TransparentCaption = True
    GroupIndex = 1
    GlyphCollapsed.Data = {
      06050000424D060500000000000036040000280000000F0000000D0000000100
      080000000000D000000000000000000000000001000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0012FA94000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000400000000000000012F8CC0000000000320014007C920700000024000D48
      000000001400001400001522A800F8A40000D00012000012F90012FAE800EE18
      0000387C91007C920700FFFFFF000732FF00AB7C92007C9206009206EB000000
      7C0000000000000000004873A800FFFF0000F8FFFF000012F8000000000005C8
      0000487C92000016E70012F9C40005510000787C92000014070092056D00E770
      7C00500016000016E7001866AC00FBB80000000012000000000012F96400000E
      00008A000000003703000000460000000000450000007C92090092094E006688
      7C00240018000002000012FA480000020000900000007C92410012F95C000000
      0000C80000007C920500154C4000FA280000700012000012F9000000000005C8
      0000907C92000018660012FA3C0005510000D87C92000014070092056D0066AC
      7C0098001800001866000000000000000000800014000018640000000000012E
      0000370000000000000000000200006E0000050001000000000012F908000008
      0000F00000000012F90091EE180005707C00FF7C9200FFFFFF0092056D001962
      7C00937C92007C92190098C0800019707C00707C92000016E7000000380066AC
      0000000018007FFDF00012F9D80000000000340000000012FA0091EE18001978
      7C00FF7C9200FFFFFF009219700000007C00020014007C9219001866AC006698
      0000000018000000000016F72000C0C80000070001000000000012F980000000
      0000800000000012FA0091EE180005707C00FF7C9200FFFFFF0092056D00F05B
      7C00007C80000014000000000000F0670000DE7C800077D1D400000000000001
      0000000000007FFDF00000000000000000000800000000000100186698000000
      0000000000000000000012FA500064E00000B00018000012FF008399F300F070
      7C00FF7C8000FFFFFF0080F0670000247C009800000000186600D1D4DE000000
      77002000000000000000B9F42A00BAFDED00FC01C500478D6C00C5BAFE004246
      0100FDEDC80001C5BA000000000000000000A80000000015220012FA8C00616D
      0000202E7300000001000003320000000000D80014000012F80000000100FB34
      0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
      7C000800140000140000809A2000D4DE7C000877D10000000700000000000708
      0000060000000000000044C0C40022DC0000D40015000016E6001522E00073E0
      0000FF004800FFFFFF001522A800C12E0000DC004400001522000F0F0F0F0707
      070707070707070707000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F000F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F000000000000000F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F000F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F0707
      070707070707070707000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F
      0F0F0F0F0F0F0F0F0F00}
    GlyphExpanded.Data = {
      06050000424D060500000000000036040000280000000F0000000D0000000100
      080000000000D000000000000000000000000001000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000078000000
      0000000000000000000000000000000000000000000000000000140640000000
      0000400000000000000012F8CC0000000000320014007C920700000024000D48
      000000001400001400001522A800F8A40000000012000000000012FAE800EE18
      0000387C91007C920700FFFFFF000732FF00AB7C92007C9206009206EB000000
      7C0000000000000000004873A800FFFF0000F8FFFF000012F8000000000005C8
      0000587C92000016E80012F9C40005510000787C92000014070092056D00E880
      7C00600016000016E80018680400FBB80000000012000000000014017800000E
      0000F0000000001867000000460000000000450000007C920900140178006798
      0000240018000002000012FA480000020000900000007C92410012F95C000000
      0000C80000007C92050014CA2000FA280000700012000012F9000000000005C8
      0000E87C92000018670012FA3C0005510000D87C92000014070092056D006804
      7C00F0001800001867000000000000000000900014000018650000000000010C
      000039000000000000000000020000720000050001000000000012F908000009
      0000F00000000012F90091EE180005707C00FF7C9200FFFFFF0092056D001962
      7C00937C92007C92190098C0800019707C00807C92000016E800000038006804
      0000000018007FFDF00012F9D80001780000340014000012FA0091EE18001978
      7C00FF7C9200FFFFFF009219700000007C00020014007C9219001868040067F0
      0000000018000000000016F83000C0C80000070001000000000012F980000000
      0000800000000012FA0091EE180005707C00FF7C9200FFFFFF0092056D00F05B
      7C00007C80000014000000000000F0670000DE7C800077D1D400000000000001
      0000000000007FFDF000000000000000000008000000000001001867F0000000
      0000000000000000000012FA500065F00000B00018000012FF008399F300F070
      7C00FF7C8000FFFFFF0080F0670000247C00F000000000186700D1D4DE000000
      770020000000000000005CF47600BAFDE5004601C500E5700700C5BAFD000746
      0100FDE5700001C5BA000000000000000000A80000000015220012FA8C00656D
      0000206F6E00000001000000780000000000D80014000012F80000000100FB34
      0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
      7C000800140000140000809A2000D4DE7C000877D10000000700000000000708
      0000060000000000000044C0C40022DE0000E40015000016E7001522E20073E2
      0000FF004800FFFFFF001522A800C12E0000DE004400001522000F0F0F0F0707
      070707070707070707000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F000000000000000F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F0707
      070707070707070707000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F
      0F0F0F0F0F0F0F0F0F00}
    OnExpanded = gbDetalleTareasExpanded
    ExplicitTop = 307
    ExplicitWidth = 739
    FullHeight = 127
    object dbgDetalleTareas: TArtDBGrid
      Left = 2
      Top = 16
      Width = 904
      Height = 109
      Align = alClient
      DataSource = dsDetalleTareas
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
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'tareadesc'
          Title.Caption = 'Tarea'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TM_FECHAALTA'
          Title.Caption = 'Fecha Alta'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TM_USUALTA'
          Title.Caption = 'Usu. Alta'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TM_FECHABAJA'
          Title.Caption = 'Fecha Baja'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TM_USUBAJA'
          Title.Caption = 'Usu. Baja'
          Width = 100
          Visible = True
        end>
    end
  end
  inherited sdqConsulta: TSDQuery
    SessionName = 'Default'
    AfterClose = sdqConsultaAfterClose
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT *'
      '  FROM art.pit_firmantes, afi.aem_empresa, hys.hvm_visitamanual'
      'WHERE em_id = vm_idempresa'
      'AND it_id(+) = vm_idpreventor'
      '')
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 80
    Top = 260
  end
  object sdqDetalleTareas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT tm_idtarea, ta_descripcion tareadesc, ta_complementaria,'
      
        '       tm_fechaalta, tm_usualta, tm_fechamodif, tm_usumodif, tm_' +
        'fechabaja, tm_usubaja'
      '   FROM hys.hta_tarea, hys.htm_tareamanual'
      '  WHERE ta_id = tm_idtarea'
      '    AND tm_idvisitamanual = :idvisita'
      '    AND tm_fechabaja IS NULL'
      'ORDER BY ta_complementaria ASC')
    Left = 32
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idvisita'
        ParamType = ptInput
      end>
  end
  object dsDetalleTareas: TDataSource
    DataSet = sdqDetalleTareas
    Left = 60
    Top = 340
  end
end
