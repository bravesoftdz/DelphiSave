inherited frmTableroCO: TfrmTableroCO
  Left = 402
  Top = 189
  Caption = 'Tablero de Obras'
  ClientHeight = 554
  ClientWidth = 861
  ExplicitWidth = 869
  ExplicitHeight = 584
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter2: TJvNetscapeSplitter [0]
    Left = 0
    Top = 417
    Width = 861
    Height = 10
    Cursor = crVSplit
    Align = alBottom
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ExplicitTop = 300
    ExplicitWidth = 739
  end
  inherited pnlFiltros: TPanel
    Width = 861
    Height = 165
    Visible = True
    ExplicitWidth = 861
    ExplicitHeight = 165
    object pcFilter: TPageControl
      Left = 0
      Top = 0
      Width = 861
      Height = 165
      ActivePage = tbGeneral
      Align = alClient
      TabOrder = 0
      object tbGeneral: TTabSheet
        Caption = 'General'
        DesignSize = (
          853
          137)
        object Label2: TLabel
          Left = 7
          Top = 33
          Width = 46
          Height = 13
          Caption = 'Preventor'
        end
        object Label9: TLabel
          Left = 7
          Top = 57
          Width = 57
          Height = 13
          Caption = 'Coordinador'
        end
        object Label4: TLabel
          Left = 7
          Top = 82
          Width = 70
          Height = 13
          Caption = 'Tipo Prev. Est.'
        end
        object Label21: TLabel
          Left = 7
          Top = 9
          Width = 73
          Height = 13
          Caption = 'Fecha Fin Obra'
        end
        object Label22: TLabel
          Left = 182
          Top = 9
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        inline fraPreventorFiltro: TfraCodigoDescripcion
          Left = 88
          Top = 28
          Width = 654
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          ExplicitLeft = 88
          ExplicitTop = 28
          ExplicitWidth = 654
          DesignSize = (
            654
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 68
            Width = 588
            CharCase = ecUpperCase
            ExplicitLeft = 68
            ExplicitWidth = 588
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            CharCase = ecNormal
            ExplicitWidth = 64
          end
        end
        inline fraCoordinadorFiltro: TfraCodigoDescripcion
          Left = 88
          Top = 52
          Width = 654
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          ExplicitLeft = 88
          ExplicitTop = 52
          ExplicitWidth = 654
          DesignSize = (
            654
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 68
            Width = 588
            CharCase = ecUpperCase
            ExplicitLeft = 68
            ExplicitWidth = 588
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            CharCase = ecNormal
            ExplicitWidth = 64
          end
        end
        object chkExcluirBajasEstabs: TCheckBox
          Left = 314
          Top = 5
          Width = 163
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Excluir Bajas Establecimientos'
          TabOrder = 2
        end
        object cmbTipoEmpresaPrev: TCheckCombo
          Left = 89
          Top = 78
          Width = 191
          Height = 21
          TabOrder = 6
        end
        object chkExcluirBajasEmpresas: TCheckBox
          Left = 506
          Top = 5
          Width = 131
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Excluir Bajas Empresas'
          TabOrder = 3
        end
        object chkSoloInconistentes: TCheckBox
          Left = 296
          Top = 80
          Width = 112
          Height = 17
          Alignment = taLeftJustify
          Caption = 'S'#243'lo Inconsistentes'
          Enabled = False
          TabOrder = 7
        end
        object edFechaFinAODesdeFiltro: TDateComboBox
          Left = 89
          Top = 5
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object edFechaFinAOHastaFiltro: TDateComboBox
          Left = 213
          Top = 5
          Width = 88
          Height = 21
          TabOrder = 1
        end
        object cbExcavacion: TCheckBox
          Left = 3
          Top = 105
          Width = 98
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Excavaci'#243'n'
          TabOrder = 8
        end
        object cbExcavacion503: TCheckBox
          Left = 219
          Top = 105
          Width = 98
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Excavaci'#243'n 503'
          TabOrder = 9
        end
        object cbDemolicion: TCheckBox
          Left = 411
          Top = 105
          Width = 98
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Demolici'#243'n'
          TabOrder = 10
        end
        object cmbExcavacion: TExComboBox
          Left = 109
          Top = 103
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 11
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cmbExcavacion503: TExComboBox
          Left = 338
          Top = 103
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 12
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cmbDemolicion: TExComboBox
          Left = 520
          Top = 103
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 13
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
      end
      object tbAfiliaciones: TTabSheet
        Caption = 'Afiliaciones'
        ImageIndex = 2
        DesignSize = (
          853
          137)
        object Label47: TLabel
          Left = 4
          Top = 83
          Width = 67
          Height = 13
          Caption = 'Departamento'
        end
        object Label5: TLabel
          Left = 4
          Top = 104
          Width = 31
          Height = 13
          Caption = 'Sector'
        end
        object Label18: TLabel
          Left = 5
          Top = 9
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        object Label19: TLabel
          Left = 5
          Top = 33
          Width = 30
          Height = 13
          Caption = 'Estab.'
        end
        inline fraLocalidad: TfraLocalidadEx
          Left = 4
          Top = 53
          Width = 846
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 4
          ExplicitTop = 53
          ExplicitWidth = 846
          ExplicitHeight = 25
          DesignSize = (
            846
            25)
          inherited lbCPostal: TLabel
            Left = 0
            Width = 39
            ExplicitLeft = 0
            ExplicitWidth = 39
          end
          inherited lbLocalidad: TLabel
            Left = 127
            Width = 46
            ExplicitLeft = 127
            ExplicitWidth = 46
          end
          inherited lbProvincia: TLabel
            Left = 647
            Width = 44
            ExplicitLeft = 525
            ExplicitWidth = 44
          end
          inherited cmbLocalidad: TArtComboBox
            Left = 176
            Width = 467
            ExplicitLeft = 176
            ExplicitWidth = 467
          end
          inherited cmbProvincia: TCheckCombo
            Left = 693
            Width = 150
            ExplicitLeft = 693
            ExplicitWidth = 150
          end
          inherited edCPostal: TPatternEdit
            Left = 72
            Width = 47
            ExplicitLeft = 72
            ExplicitWidth = 47
          end
          inherited sdqDatos: TSDQuery
            Left = 162
            Top = 19
          end
          inherited dsDatos: TDataSource
            Left = 321
            Top = 22
          end
        end
        inline fraDepart: TfraCodDesc
          Left = 76
          Top = 78
          Width = 451
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 76
          ExplicitTop = 78
          ExplicitWidth = 451
          DesignSize = (
            451
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 0
            Width = 447
            OnChange = fraDepartcmbDescripcionChange
            OnExit = fraDepartcmbDescripcionExit
            ExplicitLeft = 0
            ExplicitWidth = 447
          end
          inherited edCodigo: TPatternEdit
            Left = -128
            Anchors = [akTop, akRight]
            Visible = False
            ExplicitLeft = -128
          end
          inherited sdqDatos: TSDQuery
            SQL.Strings = (
              '  SELECT  ROWNUM AS ID,'
              '          ROWNUM AS codigo,'
              '          cp_departamento AS descripcion,'
              '          '#39#39' AS baja'
              '    FROM  (SELECT  DISTINCT cp_departamento'
              '             FROM  art.ccp_codigopostal'
              '            WHERE  cp_departamento IS NOT NULL) depto'
              'ORDER BY  cp_departamento')
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'NULL'
            FieldCodigo = 'rownum'
            FieldDesc = 'cp_departamento'
            FieldID = 'rownum'
            IdType = ctInteger
            OrderBy = 'cp_departamento'
            TableName = 'art.ccp_codigopostal'
          end
        end
        object cmbSector: TCheckCombo
          Left = 76
          Top = 104
          Width = 447
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        inline fraEmpresaFiltro: TfraEmpresa
          Left = 78
          Top = 3
          Width = 768
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          ExplicitLeft = 78
          ExplicitTop = 3
          ExplicitWidth = 768
          ExplicitHeight = 21
          DesignSize = (
            768
            21)
          inherited lbContrato: TLabel
            Left = 664
            ExplicitLeft = 542
          end
          inherited edContrato: TIntEdit
            Left = 711
            ExplicitLeft = 711
          end
          inherited cmbRSocial: TArtComboBox
            Width = 529
            ExplicitWidth = 529
          end
        end
        object edEstablecimiento: TPatternEdit
          Left = 77
          Top = 29
          Width = 767
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Pattern = '1234567890,'
        end
      end
      object tbObservaciones: TTabSheet
        Caption = 'Observaciones'
        ImageIndex = 2
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 165
    Width = 861
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 855
      end>
    ExplicitTop = 165
    ExplicitWidth = 861
    inherited ToolBar: TToolBar
      Left = 9
      Width = 848
      ExplicitLeft = 9
      ExplicitWidth = 848
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        Caption = 'Sumatoria'
        ImageIndex = 48
        OnClick = tbSumatoriaClick
      end
      object tbExportarVisitas: TToolButton
        Left = 393
        Top = 0
        Hint = 'Exportar Tablero y Visitas'
        Caption = 'tbExportar'
        ImageIndex = 15
        OnClick = tbExportarVisitasClick
      end
      object tbProximasVisitas: TToolButton
        Left = 416
        Top = 0
        Hint = 'Pr'#243'ximas Visitas'
        Caption = 'Pr'#243'ximas Visitas'
        ImageIndex = 18
        OnClick = tbProximasVisitasClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 194
    Width = 861
    Height = 223
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 85
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
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_ESTABLECI'
        Title.Caption = 'Nro.Estab.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Nombre Estab.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_TIPOSTR'
        Title.Caption = 'Tipo Estab.SRT'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOESTABPREV'
        Title.Caption = 'Tipo Estab.Prev'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_RELACION'
        Title.Caption = 'CIUU Viejo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'CIUU Actual'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Desc. CIUU'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHAALTAESTAB'
        Title.Caption = 'F.Alta Estab.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHABAJAESTAB'
        Title.Caption = 'Fecha Baja Estab.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHABAJACONTRATO'
        Title.Caption = 'F.Baja Contrato'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHAVIGENCIATRASPASO'
        Title.Caption = 'Vigencia Traspaso'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_eventual'
        Title.Caption = 'Eventual'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_avisoobra'
        Title.Caption = 'Aviso Obra'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fecharecepcionao'
        Title.Caption = 'F.Recepcion AO'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechacargaao'
        Title.Caption = 'F.Carga AO'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_programaseguridad'
        Title.Caption = 'Programa Seguridad'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fecharecepcionps'
        Title.Caption = 'F.Recepcion PS'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechaaprobacionps'
        Title.Caption = 'F.Aprobaci'#243'n PS'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechadenunciaao'
        Title.Caption = 'F.Denuncia AO'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_denunciaps'
        Title.Caption = 'F.Denuncia PS'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_denunciapsfueratermino'
        Title.Caption = 'F.Denuncia PS Fuera Termino'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_demolicion'
        Title.Caption = 'Demolici'#243'n'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechadesdedemolicion'
        Title.Caption = 'F.Desde Demolici'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechahastademolicion'
        Title.Caption = 'F.Hasta Demolici'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_excavacion'
        Title.Caption = 'Excavaci'#243'n'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechadesdeexcavacion'
        Title.Caption = 'F.Desde Excavaci'#243'n'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechahastaexcavacion'
        Title.Caption = 'F.Hasta Excavaci'#243'n'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_excavacion503'
        Title.Caption = 'Excavaci'#243'n Res.503'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechadesdeexcavacion503'
        Title.Caption = 'F.Desde Excavaci'#243'n Res.503'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechahastaexcavacion503'
        Title.Caption = 'F.Hasta Excavaci'#243'n Res.503'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechainicioobra'
        Title.Caption = 'Fecha Inicio Obra'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechafinobra'
        Title.Caption = 'Fecha Fin Obra'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechaextension'
        Title.Caption = 'Fecha Extensi'#243'n'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechasuspension'
        Title.Caption = 'Fecha Suspensi'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechareinicio'
        Title.Caption = 'Fecha Reinicio'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechafinoriginal'
        Title.Caption = 'Fecha Fin Original'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cumplimiento'
        Title.Caption = 'Cumplimiento'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tareasfuturas'
        Title.Caption = 'Tareas Futuras'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigopreventorestab'
        Title.Caption = 'Codigo Preventor Estab.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombrepreventorestab'
        Title.Caption = 'Nombre Preventor estab}'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'domicilioestab'
        Title.Caption = 'Domicilio Establecimiento'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CantidaddiasObra'
        Title.Caption = 'Cantidad dias obra'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_observaciones'
        Title.Caption = 'Observaciones de obra'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_ultimorar'
        Title.Caption = 'Ultimo RAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_rgrl'
        Title.Caption = 'Fecha RGRL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechaverosimilitud'
        Title.Caption = 'Fecha Verosimilitud'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechaultcapacitacion'
        Title.Caption = 'Fecha Ultima capacitaci'#243'n'
        Visible = True
      end>
  end
  object gbVisitas: TJvgGroupBox [4]
    Left = 0
    Top = 427
    Width = 861
    Height = 127
    Align = alBottom
    Caption = 'Visitas'
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
    OnExpanded = gbVisitasExpanded
    FullHeight = 127
    object dbgVisitas: TArtDBGrid
      Left = 2
      Top = 16
      Width = 857
      Height = 109
      Align = alClient
      DataSource = dsVisitas
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
      OnGetCellParams = dbgVisitasGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'pv_mes'
          Title.Caption = 'Mes'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'it_nombre'
          Title.Caption = 'Preventor'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cumplimiento'
          Title.Caption = 'Cumplimiento'
          Width = 70
          Visible = True
        end>
    end
  end
  inherited fpAbm: TFormPanel
    Left = 298
    Top = 459
    Width = 589
    Height = 350
    ExplicitLeft = 298
    ExplicitTop = 459
    ExplicitWidth = 589
    ExplicitHeight = 350
    inherited BevelAbm: TBevel
      Top = 314
      Width = 581
      ExplicitTop = 314
      ExplicitWidth = 581
    end
    inherited btnAceptar: TButton
      Left = 431
      Top = 320
      ExplicitLeft = 431
      ExplicitTop = 320
    end
    inherited btnCancelar: TButton
      Left = 509
      Top = 320
      ExplicitLeft = 509
      ExplicitTop = 320
    end
  end
  object dbgTareasObra: TArtDBGrid [6]
    Left = 536
    Top = 471
    Width = 244
    Height = 73
    DataSource = dsTareasObra
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = GridDblClick
    OnKeyDown = GridKeyDown
    IniStorage = FormStorage
    OnGetCellParams = GridGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'em_cuit'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Raz'#243'n Social'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'co_contrato'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_estableci'
        Title.Caption = 'Nro. Establecimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Caption = 'Nombre Establecimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'it_nombre'
        Title.Caption = 'Preventor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_tipostr'
        Title.Caption = 'Tipo SRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_actividad'
        Title.Caption = 'Actividad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'te_codigo'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ac_relacion'
        Title.Caption = 'CIUU Viejo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ac_codigo'
        Title.Caption = 'CIIU Nuevo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ac_descripcion'
        Title.Caption = 'Actividad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_eventual'
        Title.Caption = 'Eventual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_avisodeobra'
        Title.Caption = 'Aviso de Obra'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fecharecepcionao'
        Title.Caption = 'Fecha Recepci'#243'n AO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechacargaao'
        Title.Caption = 'Fecha Carga AO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_programaseguridad'
        Title.Caption = 'Programa de Seguridad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fecharecepcionps'
        Title.Caption = 'Fecha Recepci'#243'n PS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechaaprobacionps'
        Title.Caption = 'Fecha Aprobaci'#243'n PS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechadenunciaao'
        Title.Caption = 'Fecha denuncia AO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_denunciaps'
        Title.Caption = 'Denuncia PS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_denunciapsfueratermino'
        Title.Caption = 'Denuncia PS fuera de termino'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_demolicion'
        Title.Caption = 'Demolici'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechadesdedemolicion'
        Title.Caption = 'Fecha desde Demolici'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechahastademolicion'
        Title.Caption = 'Fecha hasta Demolici'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_excavacion'
        Title.Caption = 'Excavaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechadesdeexcavacion'
        Title.Caption = 'Fecha desde Excavaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechahastaexcavacion'
        Title.Caption = 'Fecha hasta Excavaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_excavacion503'
        Title.Caption = 'Excavaci'#243'n 503'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechadesdeexcavacion503'
        Title.Caption = 'Fecha desde Excavaci'#243'n 503'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechahastaexcavacion503'
        Title.Caption = 'Fecha hasta Excavaci'#243'n 503'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechainicioobra'
        Title.Caption = 'Fecha inicio obra'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechaextension'
        Title.Caption = 'Fecha Extensi'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechasuspension'
        Title.Caption = 'Fecha Suspensi'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechafinobra'
        Title.Caption = 'Fecha fin de obra'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechareinicio'
        Title.Caption = 'fecha reinicio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechafinoriginal'
        Title.Caption = 'Fecha fin original'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechaaltaestab'
        Title.Caption = 'Fecha alta Establecimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechaalta'
        Title.Caption = 'Fecha Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechamodif'
        Title.Caption = 'Fecha modificaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechabajaestab'
        Title.Caption = 'Fecha baja Establecimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechabajacontrato'
        Title.Caption = 'Fecha baja Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_fechavigenciatraspaso'
        Title.Caption = 'Fecha vigencia traspaso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_cumplimiento'
        Title.Caption = 'Cumplimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_tareasfuturas'
        Title.Caption = 'Tareas futuras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pv_mes'
        Title.Caption = 'Mes'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preventortarea'
        Title.Caption = 'Preventor Tarea'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cumplimientomes'
        Title.Caption = 'Cumplimiento Mes'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    AfterClose = sdqConsultaAfterClose
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'select 1 from dual')
  end
  inherited ShortCutControl: TShortCutControl
    Enabled = False
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object sdqVisitas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   pv_mes,'
      '         it_nombre,'
      '         TRUNC(COUNT (DISTINCT CASE'
      '                    WHEN ps_estado <> '#39'N'#39
      '                       THEN ts_idplan'
      
        '                 END) / COUNT (DISTINCT ts_idplan) * 100) cumpli' +
        'miento'
      
        '    FROM hys.hpv_procesovisita, art.pit_firmantes, hys.hps_planh' +
        'ys, hys.hts_tareahys tarea'
      '   WHERE tarea.ts_idempresa = :idempresa'
      '     AND tarea.ts_estableci = :estableci'
      '     AND ts_idplan = ps_id'
      '     AND tarea.ts_fechabaja IS NULL'
      '     AND ps_fechabaja IS NULL'
      '     AND NOT EXISTS (SELECT 1'
      '                       FROM hys.hta_tarea'
      '                      WHERE ta_complementaria = '#39'S'#39
      '                        AND tarea.ts_idtarea = ta_id)'
      '     AND tarea.ts_idproceso = pv_id'
      '     AND it_id = ps_idpreventor'
      '     AND pv_tipoproceso = '#39'M'#39
      'GROUP BY pv_mes, it_nombre'
      'ORDER BY pv_mes DESC, it_nombre')
    Left = 32
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end>
  end
  object dsVisitas: TDataSource
    DataSet = sdqVisitas
    Left = 60
    Top = 340
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
    Left = 81
    Top = 256
  end
  object sdqTareasObra: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT em_cuit, em_nombre, co_contrato, tablero.ts_estableci , e' +
        's_nombre,'
      
        '       prevprgseg.it_nombre , ts_tipostr, ts_actividad, te_codig' +
        'o, ac_relacion,'
      '       ac_codigo, ac_descripcion,'
      '       DECODE (ts_eventual, '#39'S'#39', '#39'Si'#39', '#39'No'#39') ts_eventual,'
      '       DECODE (ts_avisoobra, '#39'S'#39', '#39'Si'#39', '#39'No'#39') ts_avisodeobra,'
      '       ts_fecharecepcionao, ts_fechacargaao,'
      
        '       DECODE (ts_programaseguridad, '#39'S'#39', '#39'Si'#39', '#39'No'#39') ts_program' +
        'aseguridad,'
      
        '       ts_fecharecepcionps, ts_fechaaprobacionps, ts_fechadenunc' +
        'iaao,'
      '       ts_denunciaps, ts_denunciapsfueratermino,'
      '       DECODE (ts_demolicion, '#39'S'#39', '#39'Si'#39', '#39'No'#39') ts_demolicion,'
      '       ts_fechadesdedemolicion, ts_fechahastademolicion,'
      '       DECODE (ts_excavacion, '#39'S'#39', '#39'Si'#39', '#39'No'#39') ts_excavacion,'
      '       ts_fechadesdeexcavacion, ts_fechahastaexcavacion,'
      
        '       DECODE (ts_excavacion503, '#39'S'#39', '#39'Si'#39', '#39'No'#39') ts_excavacion5' +
        '03,'
      '       ts_fechadesdeexcavacion503, ts_fechahastaexcavacion503,'
      
        '       ts_fechainicioobra, ts_fechaextension, ts_fechasuspension' +
        ','
      '       ts_fechafinobra, ts_fechareinicio, ts_fechafinoriginal,'
      
        '       ts_fechaaltaestab, ts_fechaalta, ts_fechamodif, ts_fechab' +
        'ajaestab,'
      
        '       ts_fechabajacontrato, ts_fechavigenciatraspaso, ts_cumpli' +
        'miento,'
      '       ts_tareasfuturas, pv_mes, preventortarea, cumplimientomes'
      '  FROM art.pit_firmantes prevprgseg,'
      '       comunes.cac_actividad,'
      '       hys.hte_tipoempresaprev,'
      '       afi.aes_establecimiento,'
      '       afi.aco_contrato,'
      '       afi.aem_empresa,'
      '       hys.hts_tableroseguimientoco tablero,'
      '       (SELECT   tarea.ts_idempresa, tarea.ts_estableci, pv_mes,'
      '                 it_nombre preventortarea,'
      '                 TRUNC'
      '                    (  COUNT (DISTINCT CASE'
      '                                 WHEN ps_estado <> '#39'N'#39
      '                                    THEN ts_idplan'
      '                              END'
      '                             )'
      '                     / COUNT (DISTINCT ts_idplan)'
      '                     * 100'
      '                    ) cumplimientomes'
      '            FROM hys.hpv_procesovisita,'
      '                 art.pit_firmantes,'
      '                 hys.hps_planhys,'
      '                 hys.hts_tareahys tarea'
      '           WHERE ts_idplan = ps_id'
      '             AND tarea.ts_fechabaja IS NULL'
      '             AND ps_fechabaja IS NULL'
      '             AND NOT EXISTS ('
      '                    SELECT 1'
      '                      FROM hys.hta_tarea'
      '                     WHERE ta_complementaria = '#39'S'#39
      '                           AND tarea.ts_idtarea = ta_id)'
      '             AND tarea.ts_idproceso = pv_id'
      '             AND it_id = ps_idpreventor'
      '             AND pv_tipoproceso = '#39'M'#39
      
        '        GROUP BY tarea.ts_idempresa, tarea.ts_estableci, pv_mes,' +
        ' it_nombre) tareasqry'
      ' WHERE em_id = tablero.ts_idempresa'
      '   AND co_idempresa = em_id'
      '   AND es_contrato = co_contrato'
      '   AND es_nroestableci = tablero.ts_estableci'
      '   AND co_contrato ='
      
        '          NVL (art.afiliacion.get_contratovigente (em_cuit, ts_f' +
        'echaalta),'
      '               art.get_vultcontrato (em_cuit)'
      '              )'
      '   AND ts_tipoprev = te_id'
      '   AND ac_id = es_idactividad'
      '   AND ts_idpreventoraprobacionps = prevprgseg.it_id(+)'
      '   AND tareasqry.ts_idempresa(+) = tablero.ts_idempresa'
      '   AND tareasqry.ts_estableci(+) = tablero.ts_estableci')
    Left = 32
    Top = 368
  end
  object dsTareasObra: TDataSource
    DataSet = sdqTareasObra
    Left = 60
    Top = 372
  end
  object ExportDialogTareasObra: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqTareasObra
    Fields = <>
    IniStorage = FormStorage
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
    Left = 92
    Top = 370
  end
end
