inherited frmTableroEP: TfrmTableroEP
  Left = 402
  Top = 189
  Caption = 'Tablero Empresas PyMes'
  ClientHeight = 554
  ClientWidth = 861
  ExplicitWidth = 869
  ExplicitHeight = 581
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
        object Label6: TLabel
          Left = 7
          Top = 8
          Width = 46
          Height = 13
          Caption = 'Operativo'
        end
        inline fraPreventorFiltro: TfraCodigoDescripcion
          Left = 88
          Top = 28
          Width = 654
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
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
          TabOrder = 4
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
          Left = 294
          Top = 5
          Width = 163
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Excluir Bajas Establecimientos'
          TabOrder = 1
        end
        object cmbTipoEmpresaPrev: TCheckCombo
          Left = 89
          Top = 78
          Width = 191
          Height = 21
          TabOrder = 5
        end
        object chkExcluirBajasEmpresas: TCheckBox
          Left = 486
          Top = 5
          Width = 131
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Excluir Bajas Empresas'
          TabOrder = 2
        end
        object chkSoloInconistentes: TCheckBox
          Left = 296
          Top = 80
          Width = 112
          Height = 17
          Alignment = taLeftJustify
          Caption = 'S'#243'lo Inconsistentes'
          Enabled = False
          TabOrder = 6
        end
        object cmbOperativo: TCheckCombo
          Left = 89
          Top = 4
          Width = 191
          Height = 21
          TabOrder = 0
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
      Width = 848
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
      object tbProximasVisitas: TToolButton
        Left = 393
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
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COORDINADOR'
        Title.Caption = 'Coordinador'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVULTVIS'
        Title.Caption = 'Prev.Ult. Visita'
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
        FieldName = 'trabactual'
        Title.Caption = 'Cant.Trab.Actual'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TrabPromUltAno'
        Title.Caption = 'Trab.Prom.Ant.Operativo'
        Width = 130
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
        FieldName = 'TS_OPERATIVO'
        Title.Caption = 'Operativo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHANOTIFICACION'
        Title.Caption = 'F.Notificaci'#243'n'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_ESTABNOTIFICACION'
        Title.Caption = 'Estab. Notificaci'#243'n'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_ANEXO3'
        Title.Caption = 'Anexo III'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_siniestrosmortalesan3'
        Title.Caption = 'Siniestros Mortales An.III'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_siniestrosausenciaan3'
        Title.Caption = 'Siniestros c/Ausencia An.III'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_enferprofesionalesan3'
        Title.Caption = 'Enf. Profesionales An.III'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHADENUNCIAANEXO3'
        Title.Caption = 'F.Denuncia An.III'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_ANEXO4'
        Title.Caption = 'Anexo IV'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'firmasanexo4'
        Title.Caption = 'Firma Anexo IV'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ts_evalriesgo'
        Title.Caption = 'Evaluaci'#243'n del Riesgo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_PAPE'
        Title.Caption = 'PAPE'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHADENUNCIAPAPE'
        Title.Caption = 'F.Denuncia PAPE'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_CANTVISITASVERIF'
        Title.Caption = 'Cant.Visitas de Verif.'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHAULTVERIF'
        Title.Caption = 'F.Ult.Verificaci'#243'n'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHAVISITA1'
        Title.Caption = 'Visita 1'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCVISITA1'
        Title.Caption = '% Verif. Visita 1'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHAVISITA2'
        Title.Caption = 'Visita 2'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCVISITA2'
        Title.Caption = '% Verif. Visita 2'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHAVISITA3'
        Title.Caption = 'Visita 3'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCVISITA3'
        Title.Caption = '% Verif. Visita 3'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHAVISITA4'
        Title.Caption = 'Visita 4'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCVISITA4'
        Title.Caption = '% Verif. Visita 4'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIRMASPAPE'
        Title.Caption = 'Firmas PAPE'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_ULTIMORAR'
        Title.Caption = 'F.Ult. RAR'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_IARC'
        Title.Caption = 'Grupo IARC'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_RGRL'
        Title.Caption = 'RGRL'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHAVEROSIMILITUD'
        Title.Caption = 'Eval. Verosimilitud'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_CORRESPONDEVEROSIMILITUD'
        Title.Caption = 'Corresp. Verosimilitud'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_CANCERIGENOS'
        Title.Caption = 'Res. 415/02'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_DIFENILOS'
        Title.Caption = 'Res. 497/03'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_ACCMAYORES'
        Title.Caption = 'Res. 743/03'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHADEFINICION'
        Title.Caption = 'F. Definici'#243'n'
        Width = 80
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
        FieldName = 'TS_FECHAULTVISITA'
        Title.Caption = 'F.Ult.Visita'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHAULTCAPACIT'
        Title.Caption = 'F.Ult.Capacitaci'#243'n'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHAANTULTCAPACIT'
        Title.Caption = 'F.AnteUlt.Capacitaci'#243'n'
        Width = 95
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
        FieldName = 'ts_actividad'
        Title.Caption = 'Actividad'
        Width = 55
        Visible = True
      end>
  end
  object gbObservaciones: TJvgGroupBox [4]
    Left = 0
    Top = 427
    Width = 861
    Height = 127
    Align = alBottom
    Caption = 'Observaciones'
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
    OnExpanded = gbObservacionesExpanded
    FullHeight = 127
    object dbgObservaciones: TArtDBGrid
      Left = 2
      Top = 16
      Width = 857
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
      OnGetCellParams = dbgObservacionesGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'CO_DESCRIPCION'
          Title.Caption = 'Observaci'#243'n'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OT_FECHARESUELTO'
          Title.Caption = 'F.Resuelto'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OT_USURESUELTO'
          Title.Caption = 'Usuario Resoluci'#243'n'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OT_OBSERVACION'
          Title.Caption = 'Obs. Resoluci'#243'n'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OT_FECHAALTA'
          Title.Caption = 'F.Alta'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OT_USUALTA'
          Title.Caption = 'Usu.Alta'
          Width = 90
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
  object sdqObservaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT ot_idobservacion,'
      '       co_descripcion,'
      '       co_detalle,'
      '       co_tipo,'
      '       ot_fechaalta,'
      '       ot_usualta,'
      '       ot_fechabaja,'
      '       ot_usubaja,'
      '       ot_fecharesuelto,'
      '       ot_usuresuelto,'
      '       ot_observacion'
      '  FROM hys.hco_casoobservable, hys.hot_observaciontableroep'
      ' WHERE ot_idobservacion = co_id'
      '   AND ot_idtablero = :idtablero')
    Left = 32
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idtablero'
        ParamType = ptInput
      end>
  end
  object dsDetalleTareas: TDataSource
    DataSet = sdqObservaciones
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
end
