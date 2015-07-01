inherited frmVentanillaElectronica: TfrmVentanillaElectronica
  Left = 524
  Top = 378
  Caption = 'SRT - Ventanilla electr'#243'nica'
  ClientHeight = 763
  ClientWidth = 1016
  Constraints.MinHeight = 680
  Constraints.MinWidth = 1024
  Font.Name = 'Tahoma'
  ExplicitWidth = 1024
  ExplicitHeight = 793
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 1016
    Height = 295
    AutoSize = True
    Visible = True
    ExplicitWidth = 1016
    ExplicitHeight = 295
    object gbFiltrosEmpresa: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 1016
      Height = 226
      Align = alTop
      Caption = ' Filtros '
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
      Options = [fgoCanCollapse, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 1
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
      DesignSize = (
        1016
        226)
      FullHeight = 226
      object pnlSubFiltros: TPanel
        Left = 2
        Top = 16
        Width = 1012
        Height = 208
        Align = alClient
        TabOrder = 0
        DesignSize = (
          1012
          208)
        object Label1: TLabel
          Left = 168
          Top = 4
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label8: TLabel
          Left = 626
          Top = 4
          Width = 40
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Reclamo'
        end
        object Label9: TLabel
          Left = 717
          Top = 24
          Width = 12
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '>>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 626
          Top = 43
          Width = 186
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Motivo del reclamo seg'#250'n la Resoluci'#243'n'
        end
        object Label2: TLabel
          Left = 8
          Top = 120
          Width = 41
          Height = 13
          Caption = 'Empresa'
        end
        object Label3: TLabel
          Left = 626
          Top = 81
          Width = 41
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Siniestro'
        end
        object Label17: TLabel
          Left = 728
          Top = 81
          Width = 76
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Expediente SRT'
        end
        object Label23: TLabel
          Left = 423
          Top = 163
          Width = 82
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Grupo de trabajo'
        end
        object Label26: TLabel
          Left = 284
          Top = 4
          Width = 20
          Height = 13
          Caption = 'Tipo'
        end
        object Label27: TLabel
          Left = 626
          Top = 163
          Width = 57
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Vencimiento'
        end
        object Label28: TLabel
          Left = 715
          Top = 181
          Width = 12
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '>>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 626
          Top = 120
          Width = 73
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Documentaci'#243'n'
        end
        object Label31: TLabel
          Left = 733
          Top = 120
          Width = 40
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Recibido'
        end
        object Label32: TLabel
          Left = 7
          Top = 163
          Width = 53
          Height = 13
          Caption = 'Trabajador'
        end
        object Label33: TLabel
          Left = 292
          Top = 163
          Width = 52
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Delegaci'#243'n'
          ExplicitLeft = 248
        end
        object lblFiltroAseguradora: TLabel
          Left = 409
          Top = 120
          Width = 62
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Aseguradora'
        end
        object Label43: TLabel
          Left = 409
          Top = 4
          Width = 72
          Height = 13
          Caption = 'Usuario de alta'
        end
        inline fraVE_ID_LIKE: TfraCodDesc
          Left = 164
          Top = 18
          Width = 117
          Height = 23
          TabOrder = 0
          ExplicitLeft = 164
          ExplicitTop = 18
          ExplicitWidth = 117
          DesignSize = (
            117
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 24
            Width = 92
            ExplicitLeft = 24
            ExplicitWidth = 92
          end
          inherited edCodigo: TPatternEdit
            Width = 20
            ExplicitWidth = 20
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'NULL'
            FieldCodigo = 'VE_ID'
            FieldDesc = 'VE_DESCRIPCION'
            FieldID = 'VE_ID'
            IdType = ctInteger
            OrderBy = 'VE_DESCRIPCION'
            TableName = 'COMUNES.CVE_VENTANILLA_ESTADOS'
            OnChange = tbRefrescarClick
            Left = 196
            Top = 34
          end
        end
        object edVR_FECHARECLAMODesde: TDateComboBox
          Left = 625
          Top = 19
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edVR_FECHARECLAMOHasta: TDateComboBox
          Left = 732
          Top = 19
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 3
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 159
          Height = 116
          BevelInner = bvLowered
          TabOrder = 5
          object Panel6: TPanel
            Left = 2
            Top = 2
            Width = 155
            Height = 20
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Estados'
            TabOrder = 0
          end
          object cblVE_ID: TARTCheckListBox
            Left = 2
            Top = 22
            Width = 155
            Height = 92
            Align = alClient
            BevelEdges = []
            BorderStyle = bsNone
            Columns = 1
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
            AutoAjustarColumnas = False
            Locked = False
            SQL = 
              'SELECT ve_descripcion, ve_id FROM comunes.cve_ventanilla_estados' +
              ' WHERE ve_id <> 5 UNION ALL SELECT '#39'Respondido vencido'#39', 51 FROM' +
              ' DUAL UNION ALL SELECT '#39'Respondido a t'#233'rmino'#39', 52 FROM DUAL UNIO' +
              'N ALL SELECT '#39'Respondido parcialmente vencido'#39', 53 FROM DUAL UNI' +
              'ON ALL SELECT '#39'Respondido parcialmente a t'#233'rmino'#39', 54 FROM DUAL ' +
              'ORDER BY 1'
          end
        end
        object calVR_FECHAVENCIMIENTODesde: TJvMonthCalendar
          Left = 825
          Top = 43
          Width = 183
          Height = 158
          Hint = 'Fecha de vencimiento (a partir de la fecha seleccionada)'
          Anchors = [akTop, akRight]
          CalColors.BackColor = 16053492
          CalColors.TitleTextColor = 16053492
          CalColors.MonthBackColor = 16053492
          Date = 39602.445960937500000000
          FirstDayOfWeek = dowMonday
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          OnClick = tbRefrescarClick
        end
        inline fraVA_ID: TfraCodDesc
          Left = 624
          Top = 57
          Width = 200
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 4
          ExplicitLeft = 624
          ExplicitTop = 57
          ExplicitWidth = 200
          DesignSize = (
            200
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 33
            Width = 163
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Title.Caption = 'C'#243'digo'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRIPCION'
                Title.Caption = 'Descripci'#243'n'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'se_nivel'
                Title.Caption = 'Nivel'
                Visible = False
              end>
            OnDropDown = ControlFiltroMotivoArticulo
            ExplicitLeft = 33
            ExplicitWidth = 163
          end
          inherited edCodigo: TPatternEdit
            Width = 32
            ExplicitWidth = 32
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            ExtraFields = ' , VA_IDTEMA '
            FieldBaja = 'NULL'
            FieldCodigo = 'VA_ID'
            FieldDesc = 'VA_DESCRIPCION'
            FieldID = 'VA_ID'
            IdType = ctInteger
            OrderBy = 'VA_DESCRIPCION'
            ShowBajas = True
            TableName = 'COMUNES.CVA_VENTANILLA_ARTICULOS'
            OnChange = tbRefrescarClick
            Left = 136
          end
        end
        inline fraCO_CONTRATO: TfraEmpresa
          Left = 4
          Top = 135
          Width = 398
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
          TabOrder = 9
          ExplicitLeft = 4
          ExplicitTop = 135
          ExplicitWidth = 398
          ExplicitHeight = 21
          DesignSize = (
            398
            21)
          inherited lbContrato: TLabel
            Left = 294
            ExplicitLeft = 141
          end
          inherited edContrato: TIntEdit
            Left = 341
            ExplicitLeft = 341
          end
          inherited cmbRSocial: TArtComboBox
            Width = 159
            ExplicitWidth = 159
          end
        end
        object edEX_ID: TSinEdit
          Left = 624
          Top = 97
          Width = 100
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 7
          OnSelect = tbRefrescarClick
        end
        object edVR_NRORECLAMO_SRT: TJvMaskEdit
          Left = 725
          Top = 97
          Width = 95
          Height = 21
          Anchors = [akTop, akRight]
          EditMask = '!9999999\/9999;1;_'
          MaxLength = 12
          TabOrder = 8
          Text = '       /    '
          OnExit = tbRefrescarClick
        end
        inline fraEX_GTRABAJO: TfraCodDesc
          Left = 420
          Top = 177
          Width = 197
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 18
          ExplicitLeft = 420
          ExplicitTop = 177
          ExplicitWidth = 197
          DesignSize = (
            197
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 132
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Title.Caption = 'C'#243'digo'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRIPCION'
                Title.Caption = 'Descripci'#243'n'
                Width = 450
                Visible = True
              end>
            ExplicitWidth = 132
          end
          inherited edCodigo: TPatternEdit
            CharCase = ecNormal
          end
          inherited Propiedades: TPropiedadesFrame
            FieldBaja = 'GP_FBAJA'
            FieldCodigo = 'GP_NOMBRE'
            FieldDesc = 'GP_DESCRIPCION'
            FieldID = 'GP_CODIGO'
            OrderBy = 'GP_DESCRIPCION'
            ShowBajas = True
            TableName = 'ART.MGP_GTRABAJO'
            OnChange = tbRefrescarClick
            Left = 84
          end
        end
        inline fraVP_ID: TfraCodDesc
          Left = 280
          Top = 18
          Width = 126
          Height = 23
          TabOrder = 1
          ExplicitLeft = 280
          ExplicitTop = 18
          ExplicitWidth = 126
          DesignSize = (
            126
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 20
            Width = 106
            OnDropDown = ControlFiltroMotivoTipo
            ExplicitLeft = 20
            ExplicitWidth = 106
          end
          inherited edCodigo: TPatternEdit
            Width = 19
            ExplicitWidth = 19
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'VP_FECHABAJA'
            FieldCodigo = 'VP_ID'
            FieldDesc = 'VP_DESCRIPCION'
            FieldID = 'VP_ID'
            IdType = ctInteger
            OrderBy = 'VP_ID'
            ShowBajas = True
            TableName = 'COMUNES.CVP_VENTANILLA_TIPO'
            Left = 40
          end
        end
        object edVR_FECHAVENCIMIENTODesde: TDateComboBox
          Left = 624
          Top = 178
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 16
        end
        object edVR_FECHAVENCIMIENTOHasta: TDateComboBox
          Left = 732
          Top = 178
          Width = 89
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 17
        end
        object cmbDOCUMENTACION_FULL_LIKE: TComboBox
          Left = 624
          Top = 135
          Width = 103
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemIndex = 0
          TabOrder = 11
          Text = 'Indistinto'
          Items.Strings = (
            'Indistinto'
            'Completa'
            'Incompleta')
        end
        object cmbRECIBIDO_FULL_LIKE: TComboBox
          Left = 729
          Top = 135
          Width = 93
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemIndex = 0
          TabOrder = 12
          Text = 'Indistinto'
          Items.Strings = (
            'Indistinto'
            'Recibido'
            'No recibido')
        end
        inline fraTJ_ID: TfraTrabajador
          Left = 4
          Top = 178
          Width = 282
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 14
          ExplicitLeft = 4
          ExplicitTop = 178
          ExplicitWidth = 282
          DesignSize = (
            282
            22)
          inherited cmbNombre: TArtComboBox
            Left = 87
            Width = 196
            ExplicitLeft = 87
            ExplicitWidth = 196
          end
        end
        inline fraLG_CODIGO: TfraDelegacion
          Left = 288
          Top = 177
          Width = 130
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 15
          ExplicitLeft = 288
          ExplicitTop = 177
          ExplicitWidth = 130
          DesignSize = (
            130
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 48
            Width = 81
            ExplicitLeft = 48
            ExplicitWidth = 81
          end
          inherited edCodigo: TPatternEdit
            Width = 44
            ExplicitWidth = 44
          end
        end
        object rbFiltroFecha: TRadioButton
          Left = 827
          Top = 12
          Width = 161
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Filtrar por vencimiento'
          Checked = True
          TabOrder = 19
          TabStop = True
          OnClick = rbFiltroFechaClick
        end
        object rbFiltroFechaNo: TRadioButton
          Left = 827
          Top = 28
          Width = 145
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'No filtrar por vencimiento'
          TabOrder = 20
          OnClick = rbFiltroFechaNoClick
        end
        object gbFiltroBajas: TGroupBox
          Left = 489
          Top = 54
          Width = 128
          Height = 63
          Anchors = [akTop, akRight]
          TabOrder = 6
          object chkVerTodos: TRadioButton
            Left = 4
            Top = 16
            Width = 113
            Height = 17
            Caption = 'Ver Todo'
            TabOrder = 0
          end
          object chkNoVerTodos: TRadioButton
            Left = 4
            Top = 36
            Width = 121
            Height = 17
            Caption = 'Omitir dados de baja'
            Checked = True
            TabOrder = 1
            TabStop = True
          end
        end
        inline fraAR_ID: TfraCodDesc
          Left = 406
          Top = 134
          Width = 210
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 10
          ExplicitLeft = 406
          ExplicitTop = 134
          ExplicitWidth = 210
          DesignSize = (
            210
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 40
            Width = 171
            ExplicitLeft = 40
            ExplicitWidth = 171
          end
          inherited edCodigo: TPatternEdit
            Width = 36
            ExplicitWidth = 36
          end
          inherited Propiedades: TPropiedadesFrame
            ExtraCondition = ' and ar_codigosrt in ('#39'00051'#39', '#39'50040'#39') '
            FieldBaja = 'ar_fechabaja'
            FieldCodigo = 'ar_codigosrt'
            FieldDesc = 'ar_nombre'
            FieldID = 'ar_id'
            IdType = ctInteger
            OrderBy = 'ar_codigosrt'
            ShowBajas = True
            TableName = 'afi.aar_art'
            Left = 76
          end
        end
        inline fraVR_USUALTA: TfraCodDesc
          Left = 407
          Top = 18
          Width = 211
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 21
          TabStop = True
          ExplicitLeft = 407
          ExplicitTop = 18
          ExplicitWidth = 211
          DesignSize = (
            211
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 92
            Width = 120
            ExplicitLeft = 92
            ExplicitWidth = 120
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Width = 89
            ExplicitLeft = 0
            ExplicitWidth = 89
          end
          inherited Propiedades: TPropiedadesFrame
            ExtraCondition = 'AND SE_USUARIOGENERICO = '#39'N'#39
            FieldBaja = 'SE_FECHABAJA'
            FieldCodigo = 'SE_USUARIO'
            FieldDesc = 'SE_NOMBRE'
            FieldID = 'SE_USUARIO'
            ShowBajas = True
            TableName = 'ART.USE_USUARIOS'
            Left = 44
          end
        end
      end
      object pnlNofiltro: TPanel
        Left = 166
        Top = 60
        Width = 322
        Height = 77
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          322
          77)
        object Label6: TLabel
          Left = 4
          Top = 38
          Width = 32
          Height = 13
          Caption = 'Motivo'
        end
        object Label24: TLabel
          Left = 4
          Top = 0
          Width = 46
          Height = 13
          Caption = 'Ventanilla'
        end
        object Label44: TLabel
          Left = 179
          Top = 0
          Width = 138
          Height = 13
          Caption = 'Usuario de alta de respuesta'
        end
        inline fraVS_ID: TfraCodDesc
          Left = 0
          Top = 52
          Width = 323
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitTop = 52
          ExplicitWidth = 323
          DesignSize = (
            323
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 36
            Width = 286
            OnDropDown = ControlSubtemaFiltro
            ExplicitLeft = 36
            ExplicitWidth = 286
          end
          inherited edCodigo: TPatternEdit
            Width = 32
            ExplicitWidth = 32
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            ExtraFields = ' , VS_IDTEMA '
            FieldBaja = 'VS_FECHABAJA'
            FieldCodigo = 'VS_ID'
            FieldDesc = 'VS_DESCRIPCION'
            FieldID = 'VS_ID'
            IdType = ctInteger
            OrderBy = 'VS_DESCRIPCION'
            ShowBajas = True
            TableName = 'COMUNES.CVS_VENTANILLA_SUBTEMAS'
            OnChange = ControlFiltroMotivo
            Left = 52
          end
        end
        inline fraVT_ID: TfraCodDesc
          Left = 0
          Top = 14
          Width = 175
          Height = 23
          TabOrder = 0
          ExplicitTop = 14
          ExplicitWidth = 175
          DesignSize = (
            175
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 36
            Width = 138
            ExplicitLeft = 36
            ExplicitWidth = 138
          end
          inherited edCodigo: TPatternEdit
            Width = 32
            ExplicitWidth = 32
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'VT_FECHABAJA'
            FieldCodigo = 'VT_ID'
            FieldDesc = 'VT_DESCRIPCION'
            FieldID = 'VT_ID'
            IdType = ctInteger
            OrderBy = 'VT_DESCRIPCION'
            ShowBajas = True
            TableName = 'COMUNES.CVT_VENTANILLA_TEMAS'
            OnChange = ControlSubtemaFiltro
            Left = 52
          end
        end
        inline fraUsuAltaResp_NO_FILTRAR: TfraCodDesc
          Left = 179
          Top = 14
          Width = 142
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          TabStop = True
          ExplicitLeft = 179
          ExplicitTop = 14
          ExplicitWidth = 142
          inherited cmbDescripcion: TArtComboBox
            Left = 92
            Width = 52
            ExplicitLeft = 92
            ExplicitWidth = 52
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Width = 89
            ExplicitLeft = 0
            ExplicitWidth = 89
          end
          inherited Propiedades: TPropiedadesFrame
            ExtraCondition = 'AND SE_USUARIOGENERICO = '#39'N'#39
            FieldBaja = 'SE_FECHABAJA'
            FieldCodigo = 'SE_USUARIO'
            FieldDesc = 'SE_NOMBRE'
            FieldID = 'SE_USUARIO'
            ShowBajas = True
            TableName = 'ART.USE_USUARIOS'
            Left = 56
          end
        end
      end
    end
    object gbFiltrosHYS: TJvgGroupBox
      Left = 0
      Top = 226
      Width = 1016
      Height = 69
      Align = alTop
      Caption = ' Higiene y Seguridad'
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
      Options = [fgoCanCollapse, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 1
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
      FullHeight = 226
      object Panel10: TPanel
        Left = 2
        Top = 16
        Width = 1012
        Height = 51
        Align = alClient
        TabOrder = 0
        DesignSize = (
          1012
          51)
        object Label38: TLabel
          Left = 3
          Top = 4
          Width = 64
          Height = 13
          Caption = 'Tipo empresa'
        end
        object Label39: TLabel
          Left = 257
          Top = 4
          Width = 97
          Height = 13
          Caption = 'Tipo Establecimiento'
        end
        object Label40: TLabel
          Left = 513
          Top = 4
          Width = 141
          Height = 13
          Caption = ' Actividad del Establecimiento'
        end
        inline fraTIPOEMPRESA: TfraCodDesc
          Left = 1
          Top = 20
          Width = 252
          Height = 23
          TabOrder = 0
          ExplicitLeft = 1
          ExplicitTop = 20
          ExplicitWidth = 252
          DesignSize = (
            252
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 32
            Width = 221
            ExplicitLeft = 32
            ExplicitWidth = 221
          end
          inherited edCodigo: TPatternEdit
            Width = 31
            ExplicitWidth = 31
          end
          inherited Propiedades: TPropiedadesFrame
            ExtraCondition = 'and TB_CLAVE = '#39'TFET'#39' and tb_codigo <> '#39'0'#39
            FieldBaja = 'TB_FECHABAJA'
            FieldCodigo = 'TB_CODIGO'
            FieldDesc = 'TB_DESCRIPCION'
            FieldID = 'TB_CODIGO'
            OrderBy = 'TB_DESCRIPCION'
            ShowBajas = True
            TableName = 'art.ctb_tablas'
            Left = 152
          end
        end
        inline fraES_TIPOESTABLECIMIENTO: TfraCodDesc
          Left = 256
          Top = 20
          Width = 255
          Height = 23
          TabOrder = 1
          ExplicitLeft = 256
          ExplicitTop = 20
          ExplicitWidth = 255
          DesignSize = (
            255
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 32
            Width = 224
            ExplicitLeft = 32
            ExplicitWidth = 224
          end
          inherited edCodigo: TPatternEdit
            Width = 31
            ExplicitWidth = 31
          end
          inherited Propiedades: TPropiedadesFrame
            FieldBaja = 'BAJA'
            FieldCodigo = 'CODIGO'
            FieldDesc = 'DESCRIPCION'
            FieldID = 'ID'
            OrderBy = 'ORDEN'
            ShowBajas = True
            TableName = 'conexia.tipo_documento'
            Left = 72
          end
        end
        inline fraES_IDACTIVIDAD: TfraCodDesc
          Left = 515
          Top = 20
          Width = 685
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ExplicitLeft = 515
          ExplicitTop = 20
          ExplicitWidth = 685
          DesignSize = (
            685
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 59
            Width = 625
            ExplicitLeft = 59
            ExplicitWidth = 625
          end
          inherited edCodigo: TPatternEdit
            Width = 58
            ExplicitWidth = 58
          end
          inherited Propiedades: TPropiedadesFrame
            FieldBaja = 'AC_FECHABAJA'
            FieldCodigo = 'AC_CODIGO'
            FieldDesc = 'AC_DESCRIPCION'
            FieldID = 'AC_ID'
            IdType = ctInteger
            ShowBajas = True
            TableName = 'comunes.cac_actividad'
            Left = 72
            Top = 2
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 295
    Width = 1016
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1010
      end>
    ExplicitTop = 295
    ExplicitWidth = 1016
    inherited ToolBar: TToolBar
      Left = 9
      Width = 1003
      ExplicitLeft = 9
      ExplicitWidth = 1003
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Imprimir respuesta'
        ImageIndex = 18
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      object tbRevisarSRT: TToolButton
        Left = 370
        Top = 0
        Hint = 'Revisar SRT'
        ImageIndex = 17
        Visible = False
        OnClick = tbRevisarSRTClick
      end
      object tbFechaVencimiento: TToolButton
        Left = 393
        Top = 0
        Hint = 'Modificar fecha vencimiento'
        Caption = 'tbFechaVencimiento'
        ImageIndex = 16
        OnClick = tbFechaVencimientoClick
      end
      object tbRecategorizarMotivo: TToolButton
        Left = 416
        Top = 0
        Hint = 'Recategorizar motivo'
        Caption = 'tbRecategorizarMotivo'
        ImageIndex = 13
        OnClick = tbRecategorizarMotivoClick
      end
      object pnlSumatoria: TPanel
        Left = 439
        Top = 0
        Width = 203
        Height = 22
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 324
    Width = 757
    Height = 394
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'VR_FECHAALTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_NRORECLAMO_SRT'
        Title.Caption = 'N'#176' Expediente SRT'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_DESCRIPCION'
        Title.Caption = 'Ventanilla'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_DESCRIPCION'
        Title.Caption = 'Motivo'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VP_DESCRIPCION'
        Title.Caption = 'Tipos  de comunicaci'#243'n'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_FECHARECLAMO'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_FECHAVENCIMIENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_NOMBRE_DENUNCIANTE'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_CUIL_CUIT_DENUNCIANTE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_DESCRIPCION'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_NOMBRE'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LG_NOMBRE'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_CONTRATO'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_SECUENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_DOCUMENTACION_COMPLETA'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_RECIBIDO'
        Title.Caption = 'Recibido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_FECHA_RESPUESTA'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AR_NOMBRE'
        Title.Caption = 'Aseguradora'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAS_RESOLUCION'
        Title.Caption = 'Resoluci'#243'n (d'#237'as)'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMERA_RESPUESTA'
        Title.Caption = 'Resoluci'#243'n (d'#237'as para la primera respuesta)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENCIDO_HACE'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENCIDO_PRIMERA_RESPUESTA'
        Title.Caption = 'Vencido (d'#237'as a partir de la primera respuesta)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VA_DESCRIPCION'
        Title.Caption = 'Motivo seg'#250'n la Resoluci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_OBSERVACIONES'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCTIPOEMPRESA'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOESTABLECIMIENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_USUALTA'
        Title.Caption = 'Usu. Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DERIVACION'
        Width = 80
        Visible = True
      end>
  end
  object Panel11: TPanel [3]
    Left = 0
    Top = 718
    Width = 1016
    Height = 45
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 5
    object pnl2: TPanel
      Left = 187
      Top = 2
      Width = 65
      Height = 41
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Le'#237'do'
      Color = 13361608
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object pnl4: TPanel
      Left = 317
      Top = 2
      Width = 65
      Height = 41
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Vencido'
      Color = 11645432
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 120
      Height = 41
      Align = alLeft
      Caption = 'Referencias ->'
      TabOrder = 4
    end
    object pnl6: TPanel
      Left = 642
      Top = 2
      Width = 65
      Height = 41
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Finalizado'
      Color = 15658734
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object pnl0: TPanel
      Left = 707
      Top = 2
      Width = 19
      Height = 41
      Align = alLeft
      BevelInner = bvLowered
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Visible = False
    end
    object pnl1: TPanel
      Left = 122
      Top = 2
      Width = 65
      Height = 41
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Notificado'
      Color = 7446527
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object pnl53: TJvPanel
      Left = 382
      Top = 2
      Width = 65
      Height = 41
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Respondido parcialmente vencido'
      Color = 9009873
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 10
    end
    object pnl3: TJvPanel
      Left = 252
      Top = 2
      Width = 65
      Height = 41
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Pr'#243'ximo a vencer'
      Color = 12180735
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object pnl52: TJvPanel
      Left = 577
      Top = 2
      Width = 65
      Height = 41
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Respondido a t'#233'rmino'
      Color = 16757911
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
    end
    object pnl51: TJvPanel
      Left = 447
      Top = 2
      Width = 65
      Height = 41
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Respondido vencido'
      Color = 5061032
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 8
    end
    object pnl54: TJvPanel
      Left = 512
      Top = 2
      Width = 65
      Height = 41
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Respondido parcialmente a t'#233'rmino'
      Color = 16767434
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 9
    end
  end
  object fpRespuesta: TFormPanel [4]
    Left = 14
    Top = 411
    Width = 433
    Height = 189
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    Position = poOwnerFormCenter
    DesignSize = (
      433
      189)
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 153
      Height = 13
      Caption = 'Respuesta otorgada (PDF, JPG)'
    end
    object Label5: TLabel
      Left = 322
      Top = 8
      Width = 98
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Respuesta'
    end
    object lbAbrirRespuestaOtorgada: TLabel
      Left = 284
      Top = 8
      Width = 23
      Height = 13
      Cursor = crHandPoint
      Hint = 'Haga click aqu'#237' para ver el archivo'
      Anchors = [akTop, akRight]
      Caption = 'Abrir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = lbAbrirRespuestaOtorgadaClick
    end
    object Label19: TLabel
      Left = 8
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Respuesta'
    end
    object edRespuestaOtorgada: TFilenameEdit
      Left = 8
      Top = 24
      Width = 305
      Height = 21
      FileEditStyle = fsComboBox
      Filter = 
        'Archivos Adobe PDF|*.pdf|Archivos de Imagenes JPG|*.jpg|Todos lo' +
        's archivos|*.*'
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
      OnChange = edRespuestaOtorgadaChange
    end
    object edFechaRta: TDateComboBox
      Left = 320
      Top = 24
      Width = 105
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object edHecho: TMemo
      Left = 8
      Top = 64
      Width = 416
      Height = 85
      Anchors = [akLeft, akTop, akRight]
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object btnGuardar: TButton
      Left = 8
      Top = 156
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 3
      OnClick = btnGuardarClick
    end
    object btnCerrarRespuesta: TButton
      Left = 342
      Top = 156
      Width = 83
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Cerrar'
      TabOrder = 4
      OnClick = btnCerrarRespuestaClick
    end
  end
  object AdvToolPanelTab1: TAdvToolPanelTab [5]
    Left = 757
    Top = 324
    Width = 259
    Height = 394
    Alignment = taLeftJustify
    Color = clWhite
    ColorTo = 15527920
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Position = ppRight
    Style = esOffice2003Classic
    TabColor = clWhite
    TabColorTo = 13226453
    TabHoverColor = 13811126
    TabHoverColorTo = 13811126
    Version = '1.5.4.2'
    object AdvToolPanelSIC: TAdvToolPanel
      Left = 0
      Top = 0
      Width = 236
      Height = 394
      AutoLock = True
      BackgroundTransparent = False
      BackGroundPosition = bpTopLeft
      Button3D = False
      HoverButtonColor = 13811126
      HoverButtonColorTo = 13811126
      DownButtonColor = 11899525
      DownButtonColorTo = 11899525
      CaptionButton = False
      Color = 15198191
      ColorTo = 13029070
      GradientDirection = gdVertical
      DockDots = False
      CanSize = False
      Caption = 'SIC'
      CaptionGradientDirection = gdVertical
      FocusCaptionFontColor = clBlack
      FocusCaptionColor = 14671839
      FocusCaptionColorTo = 11511715
      NoFocusCaptionFontColor = clBlack
      NoFocusCaptionColor = 15724527
      NoFocusCaptionColorTo = 12634569
      OpenWidth = 236
      CloseHint = 'Ocultar panel'
      LockHint = 'Anclar panel'
      UnlockHint = 'Unlock panel'
      Sections = <>
      SectionLayout.CaptionColor = 15198183
      SectionLayout.CaptionColorTo = 14606046
      SectionLayout.CaptionFontColor = clBlack
      SectionLayout.CaptionRounded = False
      SectionLayout.Corners = scRectangle
      SectionLayout.BackGroundColor = 16250871
      SectionLayout.BackGroundColorTo = 15527920
      SectionLayout.BorderColor = clWhite
      SectionLayout.BorderWidth = 1
      SectionLayout.BackGroundGradientDir = gdVertical
      SectionLayout.Indent = 4
      SectionLayout.Spacing = 4
      SectionLayout.ItemFontColor = clBlue
      SectionLayout.ItemHoverTextColor = clBlue
      SectionLayout.ItemHoverUnderline = True
      SectionLayout.UnderLineCaption = False
      ShowCaptionBorder = False
      ShowClose = False
      ShowHint = True
      Style = esOffice2003Classic
      Version = '1.5.4.2'
      object pnlSIC: TPanel
        Left = 1
        Top = 24
        Width = 234
        Height = 369
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object DBAdvCardListPrestadores: TDBAdvCardList
          Left = 2
          Top = 2
          Width = 230
          Height = 365
          DataSource = dsSIC
          CardTemplate.CardCaptionHeight = 16
          CardTemplate.CardWidth = 222
          CardTemplate.DefaultItem.Caption = 'AdvCardTemplateItem0'
          CardTemplate.DefaultItem.CaptionFont.Charset = DEFAULT_CHARSET
          CardTemplate.DefaultItem.CaptionFont.Color = clWindowText
          CardTemplate.DefaultItem.CaptionFont.Height = -11
          CardTemplate.DefaultItem.CaptionFont.Name = 'Tahoma'
          CardTemplate.DefaultItem.CaptionFont.Style = []
          CardTemplate.DefaultItem.ItemEditor = ieText
          CardTemplate.DefaultItem.Name = 'AdvCardTemplateItem0'
          CardTemplate.DefaultItem.Tag = 0
          CardTemplate.DefaultItem.ValueFont.Charset = DEFAULT_CHARSET
          CardTemplate.DefaultItem.ValueFont.Color = clWindowText
          CardTemplate.DefaultItem.ValueFont.Height = -11
          CardTemplate.DefaultItem.ValueFont.Name = 'Tahoma'
          CardTemplate.DefaultItem.ValueFont.Style = []
          CardTemplate.HorMargins = 5
          CardTemplate.Indent = 2
          CardTemplate.ItemLabelWidth = 72
          CardTemplate.Items = <
            item
              Caption = 'N'#250'mero'
              CaptionFont.Charset = DEFAULT_CHARSET
              CaptionFont.Color = clWindowText
              CaptionFont.Height = -11
              CaptionFont.Name = 'Tahoma'
              CaptionFont.Style = []
              ItemEditor = ieNumber
              Name = 'DBAdvCardTemplateItem0'
              Tag = 0
              ValueFont.Charset = DEFAULT_CHARSET
              ValueFont.Color = clWindowText
              ValueFont.Height = -11
              ValueFont.Name = 'Tahoma'
              ValueFont.Style = []
              FieldName = 'ID'
            end
            item
              Caption = 'Canal'
              CaptionFont.Charset = DEFAULT_CHARSET
              CaptionFont.Color = clWindowText
              CaptionFont.Height = -11
              CaptionFont.Name = 'Tahoma'
              CaptionFont.Style = []
              ItemEditor = ieText
              Name = 'DBAdvCardTemplateItem1'
              Tag = 0
              ValueFont.Charset = DEFAULT_CHARSET
              ValueFont.Color = clWindowText
              ValueFont.Height = -11
              ValueFont.Name = 'Tahoma'
              ValueFont.Style = []
              FieldName = 'CANAL'
            end
            item
              Caption = 'Motivo'
              CaptionFont.Charset = DEFAULT_CHARSET
              CaptionFont.Color = clWindowText
              CaptionFont.Height = -11
              CaptionFont.Name = 'Tahoma'
              CaptionFont.Style = []
              ItemEditor = ieText
              Name = 'DBAdvCardTemplateItem2'
              Tag = 0
              ValueFont.Charset = DEFAULT_CHARSET
              ValueFont.Color = 22784
              ValueFont.Height = -11
              ValueFont.Name = 'Tahoma'
              ValueFont.Style = []
              WordWrap = True
              FieldName = 'TIPO'
            end
            item
              Caption = 'Fecha'
              CaptionFont.Charset = DEFAULT_CHARSET
              CaptionFont.Color = clWindowText
              CaptionFont.Height = -11
              CaptionFont.Name = 'Tahoma'
              CaptionFont.Style = []
              ItemEditor = ieDate
              Name = 'DBAdvCardTemplateItem3'
              Tag = 0
              ValueFont.Charset = DEFAULT_CHARSET
              ValueFont.Color = clWindowText
              ValueFont.Height = -11
              ValueFont.Name = 'Tahoma'
              ValueFont.Style = []
              FieldName = 'FECHA'
            end
            item
              Caption = 'Observaciones'
              CaptionFont.Charset = DEFAULT_CHARSET
              CaptionFont.Color = clWindowText
              CaptionFont.Height = -11
              CaptionFont.Name = 'Tahoma'
              CaptionFont.Style = []
              ItemEditor = ieText
              Name = 'DBAdvCardTemplateItem5'
              Tag = 0
              ValueFont.Charset = DEFAULT_CHARSET
              ValueFont.Color = clMaroon
              ValueFont.Height = -13
              ValueFont.Name = 'Wingdings'
              ValueFont.Style = []
              FieldName = 'OBS'
            end
            item
              Caption = 'Descripci'#243'n'
              CaptionFont.Charset = DEFAULT_CHARSET
              CaptionFont.Color = clWindowText
              CaptionFont.Height = -11
              CaptionFont.Name = 'Tahoma'
              CaptionFont.Style = []
              ItemEditor = ieText
              Name = 'DBAdvCardTemplateItem6'
              Tag = 0
              ValueFont.Charset = DEFAULT_CHARSET
              ValueFont.Color = clWindowText
              ValueFont.Height = -11
              ValueFont.Name = 'Tahoma'
              ValueFont.Style = []
              WordWrap = True
              FieldName = 'DESCRIPCION'
            end
            item
              Caption = 'Responsable'
              CaptionFont.Charset = DEFAULT_CHARSET
              CaptionFont.Color = clWindowText
              CaptionFont.Height = -11
              CaptionFont.Name = 'Tahoma'
              CaptionFont.Style = []
              ItemEditor = ieText
              Name = 'DBAdvCardTemplateItem7'
              Tag = 0
              ValueFont.Charset = DEFAULT_CHARSET
              ValueFont.Color = clNavy
              ValueFont.Height = -11
              ValueFont.Name = 'Tahoma'
              ValueFont.Style = []
              WordWrap = True
              FieldName = 'RESPONSABLE'
            end>
          CardTemplate.ItemSpacing = 0
          CardTemplate.VertMargins = 5
          CardTemplate.CaptionFieldName = 'INSTANCIA'
          Align = alClient
          TabOrder = 0
          DockOrientation = doVertical
          PopupMenu = pmSIC
          AutoEdit = False
          BorderColor = 12164479
          CardEditingAppearance.BevelOuter = bvNone
          CardEditingAppearance.BorderColor = clBtnFace
          CardEditingAppearance.CaptionColor.Color = clNavy
          CardEditingAppearance.CaptionFont.Charset = DEFAULT_CHARSET
          CardEditingAppearance.CaptionFont.Color = clWhite
          CardEditingAppearance.CaptionFont.Height = -11
          CardEditingAppearance.CaptionFont.Name = 'Tahoma'
          CardEditingAppearance.CaptionFont.Style = [fsBold]
          CardEditingAppearance.Color.Color = clInfoBk
          CardEditingAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
          CardEditingAppearance.ItemLabelFont.Color = clWindowText
          CardEditingAppearance.ItemLabelFont.Height = -11
          CardEditingAppearance.ItemLabelFont.Name = 'Tahoma'
          CardEditingAppearance.ItemLabelFont.Style = []
          CardEditingAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
          CardEditingAppearance.ItemEditFont.Color = clWindowText
          CardEditingAppearance.ItemEditFont.Height = -11
          CardEditingAppearance.ItemEditFont.Name = 'Tahoma'
          CardEditingAppearance.ItemEditFont.Style = []
          CardNormalAppearance.BevelOuter = bvNone
          CardNormalAppearance.CaptionColor.Color = clBtnFace
          CardNormalAppearance.CaptionFont.Charset = DEFAULT_CHARSET
          CardNormalAppearance.CaptionFont.Color = clBlack
          CardNormalAppearance.CaptionFont.Height = -11
          CardNormalAppearance.CaptionFont.Name = 'Tahoma'
          CardNormalAppearance.CaptionFont.Style = [fsBold]
          CardNormalAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
          CardNormalAppearance.ItemLabelFont.Color = clWindowText
          CardNormalAppearance.ItemLabelFont.Height = -11
          CardNormalAppearance.ItemLabelFont.Name = 'Tahoma'
          CardNormalAppearance.ItemLabelFont.Style = []
          CardNormalAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
          CardNormalAppearance.ItemEditFont.Color = clWindowText
          CardNormalAppearance.ItemEditFont.Height = -11
          CardNormalAppearance.ItemEditFont.Name = 'Tahoma'
          CardNormalAppearance.ItemEditFont.Style = []
          CardSelectedAppearance.BevelOuter = bvNone
          CardSelectedAppearance.BorderColor = clBtnFace
          CardSelectedAppearance.CaptionColor.Color = clNavy
          CardSelectedAppearance.CaptionFont.Charset = DEFAULT_CHARSET
          CardSelectedAppearance.CaptionFont.Color = clWhite
          CardSelectedAppearance.CaptionFont.Height = -11
          CardSelectedAppearance.CaptionFont.Name = 'Tahoma'
          CardSelectedAppearance.CaptionFont.Style = [fsBold]
          CardSelectedAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
          CardSelectedAppearance.ItemLabelFont.Color = clWindowText
          CardSelectedAppearance.ItemLabelFont.Height = -11
          CardSelectedAppearance.ItemLabelFont.Name = 'Tahoma'
          CardSelectedAppearance.ItemLabelFont.Style = []
          CardSelectedAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
          CardSelectedAppearance.ItemEditFont.Color = clWindowText
          CardSelectedAppearance.ItemEditFont.Height = -11
          CardSelectedAppearance.ItemEditFont.Name = 'Tahoma'
          CardSelectedAppearance.ItemEditFont.Style = []
          CardHoverAppearance.BevelOuter = bvNone
          CardHoverAppearance.BorderColor = clSilver
          CardHoverAppearance.CaptionColor.Color = clBtnFace
          CardHoverAppearance.CaptionFont.Charset = DEFAULT_CHARSET
          CardHoverAppearance.CaptionFont.Color = clBlack
          CardHoverAppearance.CaptionFont.Height = -11
          CardHoverAppearance.CaptionFont.Name = 'Tahoma'
          CardHoverAppearance.CaptionFont.Style = [fsBold]
          CardHoverAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
          CardHoverAppearance.ItemLabelFont.Color = clWindowText
          CardHoverAppearance.ItemLabelFont.Height = -11
          CardHoverAppearance.ItemLabelFont.Name = 'Tahoma'
          CardHoverAppearance.ItemLabelFont.Style = []
          CardHoverAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
          CardHoverAppearance.ItemEditFont.Color = clWindowText
          CardHoverAppearance.ItemEditFont.Height = -11
          CardHoverAppearance.ItemEditFont.Name = 'Tahoma'
          CardHoverAppearance.ItemEditFont.Style = []
          CardHorSpacing = 5
          CardVertSpacing = 5
          Color.Color = clSilver
          ColumnSizing = False
          ColumnWidth = 232
          DelayedCardLoad = False
          DelayedCardLoadInterval = 100
          GridLineWidth = 2
          ReadOnly = True
          ShowGridLine = False
          Version = '2.0.0.0'
        end
      end
    end
  end
  object fpObservacionesSIC: TFormPanel [6]
    Left = 67
    Top = 514
    Width = 433
    Height = 329
    Caption = 'SIC'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu, biMinimize]
    Position = poOwnerFormCenter
    OnShow = fpObservacionesSICShow
    DesignSize = (
      433
      329)
    object lbl4: TLabel
      Left = 8
      Top = 188
      Width = 71
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Observaciones'
    end
    object lblMotivo: TLabel
      Left = 8
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object dbtxtTIPO: TDBText
      Left = 8
      Top = 24
      Width = 58
      Height = 13
      AutoSize = True
      DataField = 'TIPO'
      DataSource = dsSIC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 8
      Top = 40
      Width = 70
      Height = 13
      Caption = 'Responsable/s'
    end
    object dbtxtRESPONSABLE: TDBText
      Left = 8
      Top = 56
      Width = 413
      Height = 13
      DataField = 'RESPONSABLE'
      DataSource = dsSIC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 8
      Top = 76
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object dbtxtINSTANCIA: TDBText
      Left = 329
      Top = 188
      Width = 92
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      AutoSize = True
      DataField = 'INSTANCIA'
      DataSource = dsSIC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object mmoObservacionesSIC: TMemo
      Left = 8
      Top = 204
      Width = 416
      Height = 85
      Anchors = [akLeft, akBottom]
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object btnGuardarObservacionesSIC: TButton
      Left = 266
      Top = 296
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Guardar'
      TabOrder = 1
      OnClick = btnGuardarObservacionesSICClick
    end
    object btnCancelarObservacionesSIC: TButton
      Left = 342
      Top = 296
      Width = 83
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object dbmmoDESCRIPCION: TDBMemo
      Left = 8
      Top = 92
      Width = 417
      Height = 89
      BevelKind = bkFlat
      BorderStyle = bsNone
      Color = clSilver
      DataField = 'DESCRIPCION'
      DataSource = dsSIC
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
    end
  end
  object fpAvisos: TFormPanel [7]
    Left = 237
    Top = 489
    Width = 656
    Height = 437
    Caption = 'Provincia ART - Aviso autom'#225'tico'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnShow = fpAvisosShow
    DesignSize = (
      656
      437)
    object Bevel1: TBevel
      Left = 4
      Top = 393
      Width = 648
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitWidth = 609
    end
    object btnAvisar: TButton
      Left = 501
      Top = 407
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Avisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAvisarClick
    end
    object btnNoAvisar: TButton
      Left = 576
      Top = 407
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&No avisar'
      ModalResult = 2
      TabOrder = 3
    end
    object Panel1: TPanel
      Left = 8
      Top = 8
      Width = 640
      Height = 375
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvLowered
      TabOrder = 0
      object Panel2: TPanel
        Left = 2
        Top = 145
        Width = 636
        Height = 24
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Destinatarios del aviso sobre la existencia de este reclamo'
        TabOrder = 0
      end
      object clbUsuarios: TARTCheckListBox
        Left = 2
        Top = 169
        Width = 636
        Height = 61
        Align = alClient
        BevelEdges = []
        BorderStyle = bsNone
        Columns = 2
        ItemHeight = 13
        TabOrder = 1
        OnClick = RegistroUsuarios
        OnKeyPress = RegistroUsuariosTecla
        AutoAjustarColumnas = False
        Locked = False
        SQL = 'SELECT 1, 1 FROM DUAL WHERE 1=2'
      end
      object edObservaciones: TMemo
        Left = 2
        Top = 281
        Width = 636
        Height = 47
        Align = alBottom
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object Panel3: TPanel
        Left = 2
        Top = 257
        Width = 636
        Height = 24
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Texto que acompa'#241'a el aviso'
        TabOrder = 2
      end
      object Panel7: TPanel
        Left = 2
        Top = 328
        Width = 636
        Height = 24
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Direcciones de correo adicionales (separadas por punto y coma)'
        TabOrder = 4
      end
      object edDireccionesDeCorreo: TJvEdit
        Left = 2
        Top = 352
        Width = 636
        Height = 21
        Align = alBottom
        TabOrder = 5
      end
      object clbUsuariosART: TARTCheckListBox
        Left = 2
        Top = 26
        Width = 636
        Height = 119
        Align = alTop
        BevelEdges = []
        BorderStyle = bsNone
        Columns = 3
        ItemHeight = 13
        TabOrder = 6
        OnClick = RegistroUsuarios
        OnKeyPress = RegistroUsuariosTecla
        AutoAjustarColumnas = False
        Locked = False
        SQL = 'SELECT 1, 1 FROM DUAL WHERE 1=2'
      end
      object Panel8: TPanel
        Left = 2
        Top = 2
        Width = 636
        Height = 24
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 
          'Destinatarios del aviso sobre la existencia de este reclamo (Tod' +
          'os los usuarios)'
        TabOrder = 7
      end
      object pnlUsuariosSeleccionados: TPanel
        Left = 2
        Top = 230
        Width = 636
        Height = 27
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 8
        DesignSize = (
          636
          27)
        object edUsuarios: TEdit
          Left = 4
          Top = 4
          Width = 629
          Height = 21
          Hint = 'Lista de usuarios seleccionados'
          Anchors = [akLeft, akTop, akRight]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
      end
    end
    object rgMailOrSIC: TAdvOfficeRadioGroup
      Left = 7
      Top = 398
      Width = 210
      Height = 35
      BorderStyle = bsNone
      Version = '1.3.2.0'
      Anchors = [akLeft, akBottom]
      Caption = ' Tipo de aviso '
      ParentBackground = False
      ParentCtl3D = True
      TabOrder = 4
      Columns = 2
      Items.Strings = (
        'Tarea en el SIC'
        'Mail')
      Ellipsis = False
    end
    object chkAdjuntar: TCheckBox
      Left = 172
      Top = 413
      Width = 97
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Adjuntar el PDF'
      TabOrder = 1
    end
    object chkIncluirmeComoDest: TCheckBox
      Left = 276
      Top = 413
      Width = 165
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Incluirme como destinatario'
      TabOrder = 5
    end
  end
  object fpFechaVencimiento: TFormPanel [8]
    Left = 257
    Top = 395
    Width = 320
    Height = 113
    Caption = 'Cambiar fecha de vencimiento'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu, biMinimize]
    BorderStyle = bsDialog
    Position = poScreenCenter
    DesignSize = (
      320
      113)
    object Bevel2: TBevel
      Left = -488
      Top = 73
      Width = 808
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 131
      ExplicitWidth = 772
    end
    object Label25: TLabel
      Left = 15
      Top = 10
      Width = 89
      Height = 13
      Caption = 'Fecha vencimiento'
    end
    object Label34: TLabel
      Left = 115
      Top = 10
      Width = 67
      Height = 13
      Caption = 'Nuevo estado'
    end
    object btnAceptarFechaVencimiento: TButton
      Left = 163
      Top = 81
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarFechaVencimientoClick
    end
    object btnCancelarFechaVencimiento: TButton
      Left = 238
      Top = 81
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object edFechaVencimientoModificar: TDateComboBox
      Left = 14
      Top = 29
      Width = 91
      Height = 21
      TabOrder = 2
      OnChange = edFechaVencimientoModificarChange
      OnKeyUp = edFechaVencimientoModificarKeyUp
    end
    object edNuevoEstado: TEdit
      Left = 115
      Top = 29
      Width = 190
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
  end
  object fpRecategorizarMotivo: TFormPanel [9]
    Left = 462
    Top = 343
    Width = 425
    Height = 174
    Caption = 'Recategorizar motivo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu, biMinimize]
    BorderStyle = bsDialog
    Position = poScreenCenter
    DesignSize = (
      425
      174)
    object Bevel3: TBevel
      Left = -488
      Top = 134
      Width = 913
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 131
      ExplicitWidth = 772
    end
    object Label35: TLabel
      Left = 12
      Top = 10
      Width = 66
      Height = 13
      Caption = 'Nuevo motivo'
    end
    object Label36: TLabel
      Left = 11
      Top = 62
      Width = 104
      Height = 13
      Caption = 'Tipo  de comunicaci'#243'n'
    end
    object btnAceptarRecategorizarMotivo: TButton
      Left = 268
      Top = 142
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarRecategorizarMotivoClick
    end
    object btnCancelarRecategorizarMotivo: TButton
      Left = 343
      Top = 142
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraRecategorizarMotivo: TfraCodDesc
      Left = 11
      Top = 27
      Width = 403
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 11
      ExplicitTop = 27
      ExplicitWidth = 403
      DesignSize = (
        403
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 32
        Width = 368
        ExplicitLeft = 32
        ExplicitWidth = 368
      end
      inherited edCodigo: TPatternEdit
        Width = 31
        ExplicitWidth = 31
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraFields = 
          ' , VS_IDTEMA, VS_TIENEVENCIMIENTO, VS_PLAZOPREDETERMINADO, VS_SI' +
          'NIESTRO, VS_CONTRATO '
        FieldBaja = 'VS_FECHABAJA'
        FieldCodigo = 'VS_ID'
        FieldDesc = 'VS_DESCRIPCION'
        FieldID = 'VS_ID'
        IdType = ctInteger
        OrderBy = 'VS_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMUNES.CVS_VENTANILLA_SUBTEMAS'
        OnChange = fraRecategorizarMotivoPropiedadesChange
        Left = 40
        Top = 2
      end
    end
    inline fraTipoDeComunicacion: TfraCodDesc
      Left = 11
      Top = 81
      Width = 403
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 11
      ExplicitTop = 81
      ExplicitWidth = 403
      DesignSize = (
        403
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 32
        Width = 368
        ExplicitLeft = 32
        ExplicitWidth = 368
      end
      inherited edCodigo: TPatternEdit
        Width = 31
        ExplicitWidth = 31
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'VP_FECHABAJA'
        FieldCodigo = 'VP_ID'
        FieldDesc = 'VP_DESCRIPCION'
        FieldID = 'VP_ID'
        IdType = ctInteger
        OrderBy = 'VP_ID'
        ShowBajas = True
        TableName = 'COMUNES.CVP_VENTANILLA_TIPO'
        Left = 40
        Top = 2
      end
    end
  end
  inherited fpAbm: TFormPanel
    Left = 111
    Top = 154
    Width = 980
    Height = 597
    Position = poScreenCenter
    OnClose = fpAbmClose
    OnShow = fpAbmShow
    Constraints.MaxHeight = 640
    Constraints.MaxWidth = 980
    Constraints.MinHeight = 540
    Constraints.MinWidth = 980
    ExplicitLeft = 111
    ExplicitTop = 154
    ExplicitWidth = 980
    ExplicitHeight = 597
    DesignSize = (
      980
      597)
    inherited BevelAbm: TBevel
      Left = 0
      Top = 561
      Width = 980
      Height = 36
      Align = alBottom
      ExplicitLeft = 0
      ExplicitTop = 560
      ExplicitWidth = 980
      ExplicitHeight = 36
    end
    inherited btnAceptar: TButton
      Left = 825
      Top = 567
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 825
      ExplicitTop = 567
    end
    inherited btnCancelar: TButton
      Left = 900
      Top = 567
      Caption = '&Cerrar'
      TabOrder = 2
      ExplicitLeft = 900
      ExplicitTop = 567
    end
    object pgDatos: TPageControl
      Left = 0
      Top = 0
      Width = 980
      Height = 403
      ActivePage = tsPrincipal
      Align = alTop
      MultiLine = True
      TabOrder = 0
      TabStop = False
      object tsPrincipal: TTabSheet
        Caption = 'Datos'
        object pnlDatos: TPanel
          Left = 0
          Top = 0
          Width = 972
          Height = 43
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            972
            43)
          object lbTipo: TLabel
            Left = 340
            Top = 4
            Width = 109
            Height = 13
            Caption = 'Tipos  de comunicaci'#243'n'
          end
          object lbTema: TLabel
            Left = 7
            Top = 4
            Width = 46
            Height = 13
            Caption = 'Ventanilla'
          end
          object lbMotivo: TLabel
            Left = 187
            Top = 4
            Width = 32
            Height = 13
            Caption = 'Motivo'
          end
          object Label13: TLabel
            Left = 779
            Top = 4
            Width = 33
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Estado'
            ExplicitLeft = 579
          end
          object Label16: TLabel
            Left = 867
            Top = 4
            Width = 76
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Expediente SRT'
            ExplicitLeft = 667
          end
          inline fraVR_IDTIPO: TfraCodDesc
            Left = 339
            Top = 20
            Width = 435
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitLeft = 339
            ExplicitTop = 20
            ExplicitWidth = 435
            DesignSize = (
              435
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 20
              Width = 414
              OnDropDown = ControlMotivoTipo
              ExplicitLeft = 20
              ExplicitWidth = 414
            end
            inherited edCodigo: TPatternEdit
              Width = 19
              ExplicitWidth = 19
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              FieldBaja = 'VP_FECHABAJA'
              FieldCodigo = 'VP_ID'
              FieldDesc = 'VP_DESCRIPCION'
              FieldID = 'VP_ID'
              IdType = ctInteger
              OrderBy = 'VP_ID'
              ShowBajas = True
              TableName = 'COMUNES.CVP_VENTANILLA_TIPO'
              OnChange = fraVR_IDTIPOPropiedadesChange
              Left = 32
              Top = 2
            end
          end
          inline fraTEMA: TfraCodDesc
            Left = 7
            Top = 20
            Width = 177
            Height = 23
            TabOrder = 0
            ExplicitLeft = 7
            ExplicitTop = 20
            ExplicitWidth = 177
            DesignSize = (
              177
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 32
              Width = 142
              ExplicitLeft = 32
              ExplicitWidth = 142
            end
            inherited edCodigo: TPatternEdit
              Width = 31
              ExplicitWidth = 31
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              FieldBaja = 'VT_FECHABAJA'
              FieldCodigo = 'VT_ID'
              FieldDesc = 'VT_DESCRIPCION'
              FieldID = 'VT_ID'
              IdType = ctInteger
              OrderBy = 'VT_DESCRIPCION'
              ShowBajas = True
              TableName = 'COMUNES.CVT_VENTANILLA_TEMAS'
              OnChange = ControlSubtema
              Left = 40
              Top = 2
            end
          end
          inline fraVR_IDSUBTEMA: TfraCodDesc
            Left = 183
            Top = 20
            Width = 156
            Height = 23
            TabOrder = 1
            ExplicitLeft = 183
            ExplicitTop = 20
            ExplicitWidth = 156
            DesignSize = (
              156
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 32
              Width = 121
              OnDropDown = ControlSubtema
              ExplicitLeft = 32
              ExplicitWidth = 121
            end
            inherited edCodigo: TPatternEdit
              Width = 31
              ExplicitWidth = 31
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              ExtraFields = 
                ' , VS_IDTEMA, VS_TIENEVENCIMIENTO, VS_PLAZOPREDETERMINADO, VS_SI' +
                'NIESTRO, VS_CONTRATO , VS_ESTABLECIMIENTO'
              FieldBaja = 'VS_FECHABAJA'
              FieldCodigo = 'VS_ID'
              FieldDesc = 'VS_DESCRIPCION'
              FieldID = 'VS_ID'
              IdType = ctInteger
              OrderBy = 'VS_DESCRIPCION'
              ShowBajas = True
              TableName = 'COMUNES.CVS_VENTANILLA_SUBTEMAS'
              OnChange = CambioMotivo
              Left = 40
              Top = 2
            end
          end
          inline fraVR_IDESTADO: TfraCodDesc
            Left = 775
            Top = 20
            Width = 101
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 3
            ExplicitLeft = 775
            ExplicitTop = 20
            ExplicitWidth = 101
            DesignSize = (
              101
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 20
              Width = 69
              ExplicitLeft = 20
              ExplicitWidth = 69
            end
            inherited edCodigo: TPatternEdit
              Width = 19
              ExplicitWidth = 19
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              FieldBaja = 'NULL'
              FieldCodigo = 'VE_ID'
              FieldDesc = 'VE_DESCRIPCION'
              FieldID = 'VE_ID'
              IdType = ctInteger
              OrderBy = 'VE_ID'
              TableName = 'COMUNES.CVE_VENTANILLA_ESTADOS'
              OnChange = fraVR_IDESTADOPropiedadesChange
              Left = 44
              Top = 2
            end
          end
          object edNRORECLAMOSRT: TJvMaskEdit
            Left = 866
            Top = 20
            Width = 79
            Height = 21
            Anchors = [akTop, akRight]
            EditMask = '!9999999\/9999;1;_'
            MaxLength = 12
            TabOrder = 4
            Text = '       /    '
          end
          object btnBuscarExpedienteSrt: TBitBtn
            Left = 947
            Top = 16
            Width = 23
            Height = 23
            Hint = 
              'Recuperar informaci'#243'n en base a un registro anterior (en caso de' +
              ' que exista alguno)'
            Anchors = [akTop, akRight]
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000220B0000220B00000001000000010000003100000042
              0000004A000000520000006B0000004A080000630800006B0800007B0800008C
              080000940800009C080000A50800006B10000873100000A51000089C180000A5
              180008A5180008AD180008842100109C210008A5210010AD2100108C290008A5
              290008AD290008B5290010A5310018A5310021A5310008AD310010AD3100189C
              390010AD390010A5420010B5420029A54A0010AD4A0018B54A0021BD4A0042BD
              4A0018B5520021B5520039B5520029BD520042BD52004AC6520029BD5A0039BD
              5A0042BD5A0042C65A0031BD630039BD630042BD63004ABD630039BD6B004ABD
              6B0042C673004AC6730052C673004AC67B0052C67B0073D67B0063CE8C006BCE
              8C006BD68C0084D68C0073D694007BDE9C0084DEA5008CDEAD0094DEB50094E7
              B5009CE7B500ADE7B500B5E7B500A5E7BD00B5E7BD00A5E7C600ADE7C600B5EF
              C600BDEFCE00BDEFD600C6F7DE00D6F7DE00D6F7E700E7F7EF00EFFFEF00F7FF
              F700FF00FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5A5A5A5A00
              01030301005A5A5A5A5A5A5A5A0101080B0B0B0B0802025A5A5A5A5A05060F0C
              0B0B0B0B0C0C07005A5A5A050D16120B0B0B0B0B0B0B0C07025A5A05201A120F
              2F5755170B0B0B0C025A0314241C1029595C430F0B0B0B0C0801032327202959
              5C3F0B0B0B0B0B0C0A010D2B2B44585C59514E4B4B4B4B0B0B020E3830525C5C
              5C5C5C5C5C5C5C0B0B030E3E3A304D5C59463232323232120B010E39462B2B48
              5C573C202020191209015A1E50412627475C592D1C191613075A5A1E3C53402B
              2A48502B22202015075A5A5A1541564A3E35303434281C065A5A5A5A5A373748
              534F47453D21215A5A5A5A5A5A5A5A1E2C363625185A5A5A5A5A}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = btnBuscarExpedienteSrtClick
          end
        end
        object pnlDenunciante: TPanel
          Left = 0
          Top = 210
          Width = 972
          Height = 42
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
          DesignSize = (
            972
            42)
          object Denunciante: TLabel
            Left = 8
            Top = 0
            Width = 60
            Height = 13
            Caption = 'Denunciante'
          end
          object Label14: TLabel
            Left = 591
            Top = 0
            Width = 91
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Tipo de documento'
            ExplicitLeft = 391
          end
          object Label15: TLabel
            Left = 883
            Top = 0
            Width = 54
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Documento'
            ExplicitLeft = 683
          end
          object edVR_NOMBRE_DENUNCIANTE: TEdit
            Left = 8
            Top = 16
            Width = 576
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            TabOrder = 0
          end
          inline fraVR_TIPODOCUMENTO_DENUNCIANTE: TfraCodDesc
            Left = 587
            Top = 15
            Width = 289
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 1
            ExplicitLeft = 587
            ExplicitTop = 15
            ExplicitWidth = 289
            DesignSize = (
              289
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 32
              Width = 254
              ExplicitLeft = 32
              ExplicitWidth = 254
            end
            inherited edCodigo: TPatternEdit
              Width = 31
              ExplicitWidth = 31
            end
            inherited Propiedades: TPropiedadesFrame
              FieldBaja = 'NULL'
              FieldCodigo = 'abreviatura'
              FieldDesc = 'descripcion'
              FieldID = 'id'
              IdType = ctInteger
              OrderBy = 'id'
              TableName = 'conexia.tipo_documento'
              Left = 40
            end
          end
          object edVR_CUIL_CUIT_DENUNCIANTE: TMaskEdit
            Left = 879
            Top = 16
            Width = 89
            Height = 21
            Anchors = [akTop, akRight]
            CharCase = ecUpperCase
            EditMask = '99-99999999-c;0;'
            MaxLength = 13
            TabOrder = 2
          end
        end
        object pnlEmpresa: TPanel
          Left = 0
          Top = 128
          Width = 972
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          DesignSize = (
            972
            40)
          object Label11: TLabel
            Left = 8
            Top = 0
            Width = 41
            Height = 13
            Caption = 'Empresa'
          end
          inline fraVR_CONTRATO: TfraEmpresa
            Left = 4
            Top = 16
            Width = 964
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
            ExplicitLeft = 4
            ExplicitTop = 16
            ExplicitWidth = 964
            ExplicitHeight = 21
            DesignSize = (
              964
              21)
            inherited lbRSocial: TLabel
              Left = 90
              ExplicitLeft = 90
            end
            inherited lbContrato: TLabel
              Left = 848
              ExplicitLeft = 648
            end
            inherited mskCUIT: TMaskEdit
              Left = 4
              ParentFont = False
              ExplicitLeft = 4
            end
            inherited edContrato: TIntEdit
              Left = 895
              Width = 65
              ParentFont = False
              ExplicitLeft = 895
              ExplicitWidth = 65
            end
            inherited cmbRSocial: TArtComboBox
              Left = 133
              Width = 713
              ParentFont = False
              ExplicitLeft = 133
              ExplicitWidth = 713
            end
          end
        end
        object pnlMotivo: TPanel
          Left = 0
          Top = 43
          Width = 972
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            972
            40)
          object Label21: TLabel
            Left = 8
            Top = 0
            Width = 186
            Height = 13
            Caption = 'Motivo del reclamo seg'#250'n la Resoluci'#243'n'
          end
          object lblAseguradora: TLabel
            Left = 748
            Top = 0
            Width = 62
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Aseguradora'
            ExplicitLeft = 548
          end
          inline fraVR_IDARTICULO: TfraCodDesc
            Left = 4
            Top = 14
            Width = 737
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 4
            ExplicitTop = 14
            ExplicitWidth = 737
            DesignSize = (
              737
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 36
              Width = 701
              OnDropDown = ControlMotivoArticulo
              ExplicitLeft = 36
              ExplicitWidth = 701
            end
            inherited edCodigo: TPatternEdit
              Left = 5
              Width = 31
              ExplicitLeft = 5
              ExplicitWidth = 31
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              ExtraFields = ' , VA_IDTEMA '
              FieldBaja = 'NULL'
              FieldCodigo = 'VA_ID'
              FieldDesc = 'VA_DESCRIPCION'
              FieldID = 'VA_ID'
              IdType = ctInteger
              OrderBy = 'VA_DESCRIPCION'
              ShowBajas = True
              TableName = 'COMUNES.CVA_VENTANILLA_ARTICULOS'
              Top = 2
            end
          end
          inline fraVR_IDASEGURADORA: TfraCodDesc
            Left = 744
            Top = 13
            Width = 224
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 1
            ExplicitLeft = 744
            ExplicitTop = 13
            ExplicitWidth = 224
            DesignSize = (
              224
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 159
              ExplicitWidth = 159
            end
            inherited Propiedades: TPropiedadesFrame
              ExtraCondition = ' and ar_codigosrt in ('#39'00051'#39', '#39'50040'#39') '
              FieldBaja = 'ar_fechabaja'
              FieldCodigo = 'ar_codigosrt'
              FieldDesc = 'ar_nombre'
              FieldID = 'ar_id'
              IdType = ctInteger
              OrderBy = 'ar_codigosrt'
              ShowBajas = True
              TableName = 'afi.aar_art'
            end
          end
        end
        object pnlTrabajador: TPanel
          Left = 0
          Top = 83
          Width = 972
          Height = 45
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            972
            45)
          object Label12: TLabel
            Left = 8
            Top = 4
            Width = 121
            Height = 13
            Caption = 'Trabajador / Damnificado'
          end
          inline fraVR_IDEXPEDIENTE: TfraTrabajadorSiniestro
            Left = 8
            Top = 20
            Width = 956
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 8
            ExplicitTop = 20
            ExplicitWidth = 956
            DesignSize = (
              956
              21)
            inherited lbSiniestro: TLabel
              Left = 790
              ExplicitLeft = 590
            end
            inherited cmbNombre: TArtComboBox
              Width = 703
              ExplicitWidth = 703
            end
            inherited edSiniestro: TSinEdit
              Left = 855
              ExplicitLeft = 855
            end
            inherited ToolBar: TToolBar
              Left = 832
              ExplicitLeft = 832
            end
            inherited ImageList: TImageList
              Bitmap = {
                494C010101000400900110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
                0000000000003600000028000000400000001000000001002000000000000010
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000666666006666660000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000066666600E3E3E300A4A0A00066666600000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000066666600E3E3E300A4A0A000E3E3E300A4A0A000666666000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000808000A4A0A000E3E3E300CCCCCC00D7D7D700B2B2B2006666
                6600000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000066666600B2B2B200E3E3E300CCCCCC00D7D7D700E3E3E300A4A0A000E3E3
                E300666666000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000008080
                800066666600E3E3E300CCCCCC00D7D7D700E3E3E300A4A0A000E3E3E300A4A0
                A000C0C0C0006666660000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000008080
                800066666600CCCCCC00D7D7D700E3E3E300A4A0A000E3E3E300A4A0A000C0C0
                C000C0C0C000B2B2B20066666600000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000008080
                80008080800066666600B2B2B200A4A0A000E3E3E300A4A0A000C0C0C000C0C0
                C000B2B2B2000066660022222200000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000A4A0
                A000A4A0A0008080800066666600E3E3E300B2B2B200C0C0C000C0C0C000A4A0
                A000666666003939390000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000A4A0
                A000B2B2B200B2B2B2008080800066666600B2B2B20033999900666666006666
                6600000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000096969600C0C0
                C000B2B2B200B2B2B20080808000808080006666660066666600000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000096969600B2B2B2008686
                8600969696000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000096969600A4A0A000868686009696
                9600000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000008686860086868600969696000000
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
                000000000000000000000000000000000000424D3E000000000000003E000000
                2800000040000000100000000100010000000000800000000000000000000000
                000000000000000000000000FFFFFF00FFFF000000000000FE7F000000000000
                FC3F000000000000F81F000000000000F80F000000000000F007000000000000
                E003000000000000E001000000000000E001000000000000E003000000000000
                E00F000000000000C03F00000000000087FF0000000000000FFF000000000000
                1FFF000000000000FFFF00000000000000000000000000000000000000000000
                000000000000}
            end
          end
        end
        object pnlUsuarios: TPanel
          Left = 0
          Top = 252
          Width = 972
          Height = 39
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 5
          DesignSize = (
            972
            39)
          object Label41: TLabel
            Left = 8
            Top = 0
            Width = 72
            Height = 13
            Caption = 'Usuario Solicit'#243
          end
          object Label42: TLabel
            Left = 200
            Top = 0
            Width = 83
            Height = 13
            Caption = 'Usuario Asignado'
          end
          object edUsuarioSRT: TEdit
            Left = 8
            Top = 16
            Width = 185
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object edUsuarioART: TEdit
            Left = 200
            Top = 16
            Width = 209
            Height = 21
            TabOrder = 1
          end
          object edVR_RESPUESTA: TMemo
            Left = 412
            Top = 4
            Width = 555
            Height = 33
            Anchors = [akLeft, akTop, akRight]
            Lines.Strings = (
              'edVR_RESPUESTA')
            TabOrder = 2
            Visible = False
          end
        end
        object pnlReclamo: TPanel
          Left = 0
          Top = 291
          Width = 972
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 6
          DesignSize = (
            972
            40)
          object Label45: TLabel
            Left = 200
            Top = 0
            Width = 132
            Height = 13
            Caption = 'Reclamo original (PDF, JPG)'
            Visible = False
          end
          object lbAbrirReclamoAfi: TLabel
            Left = 943
            Top = 0
            Width = 23
            Height = 13
            Cursor = crHandPoint
            Hint = 'Haga click aqu'#237' para ver el archivo'
            Anchors = [akTop, akRight]
            Caption = 'Abrir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Visible = False
            OnClick = lbAbrirReclamoAfiClick
            ExplicitLeft = 743
          end
          object Label7: TLabel
            Left = 8
            Top = 0
            Width = 40
            Height = 13
            Caption = 'Reclamo'
          end
          object Label10: TLabel
            Left = 104
            Top = 0
            Width = 57
            Height = 13
            Caption = 'Vencimiento'
          end
          object edReclamoOriginalNO: TFilenameEdit
            Left = 199
            Top = 17
            Width = 768
            Height = 21
            FileEditStyle = fsComboBox
            Filter = 
              'Archivos Adobe PDF|*.pdf|Archivos de Imagenes JPG|*.jpg|Todos lo' +
              's archivos|*.*'
            Anchors = [akLeft, akTop, akRight]
            NumGlyphs = 1
            TabOrder = 2
            Visible = False
          end
          object edSecuencia: TIntEdit
            Left = 352
            Top = 12
            Width = 53
            Height = 21
            TabStop = False
            Color = clRed
            TabOrder = 3
            Visible = False
          end
          object edVR_FECHARECLAMO: TDateComboBox
            Left = 8
            Top = 16
            Width = 88
            Height = 21
            TabOrder = 0
            OnChange = edVR_FECHARECLAMOChange
          end
          object edVR_FECHAVENCIMIENTO: TDateComboBox
            Left = 104
            Top = 16
            Width = 89
            Height = 21
            TabOrder = 1
          end
        end
        object pnlDocumentacion: TPanel
          Left = 815
          Top = 331
          Width = 157
          Height = 44
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 8
          DesignSize = (
            157
            44)
          object chkDocumentacion: TCheckBox
            Left = 8
            Top = 28
            Width = 141
            Height = 12
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Documentaci'#243'n completa'
            TabOrder = 0
          end
          object pnlRecibido: TPanel
            Left = 0
            Top = 0
            Width = 157
            Height = 27
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              157
              27)
            object chkRecibido: TCheckBox
              Left = 88
              Top = 10
              Width = 61
              Height = 13
              Alignment = taLeftJustify
              Anchors = [akRight, akBottom]
              Caption = 'Recibido'
              TabOrder = 0
            end
          end
        end
        object pnlHecho: TPanel
          Left = 0
          Top = 331
          Width = 815
          Height = 44
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 7
          DesignSize = (
            815
            44)
          object Label18: TLabel
            Left = 4
            Top = 4
            Width = 30
            Height = 13
            Caption = 'Hecho'
          end
          object Label22: TLabel
            Left = 284
            Top = 4
            Width = 71
            Height = 13
            Caption = 'Observaciones'
          end
          object edVR_HECHO: TMemo
            Left = 40
            Top = 4
            Width = 240
            Height = 40
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object edVR_OBSERVACIONES: TMemo
            Left = 360
            Top = 2
            Width = 453
            Height = 40
            Anchors = [akLeft, akTop, akRight]
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
        object pnlEstablecimiento: TPanel
          Left = 0
          Top = 168
          Width = 972
          Height = 42
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 9
          object Label37: TLabel
            Left = 8
            Top = 2
            Width = 74
            Height = 13
            Caption = 'Establecimiento'
          end
        end
      end
    end
    object pgRespuestas: TPageControl
      Left = 0
      Top = 403
      Width = 980
      Height = 158
      ActivePage = tsRespuestas
      Align = alClient
      TabOrder = 3
      object tsArchivos: TTabSheet
        Caption = 'Archivos (PDF, JPG)'
        ImageIndex = 1
        object tlbArchivos: TToolBar
          Left = 0
          Top = 0
          Width = 972
          Height = 26
          AutoSize = True
          BorderWidth = 1
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object btnRefreshArchivos: TToolButton
            Left = 0
            Top = 0
            Hint = 'Refrescar'
            ImageIndex = 0
          end
          object ToolButton7: TToolButton
            Left = 23
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 14
            Style = tbsSeparator
          end
          object btnAgregarArchivo: TToolButton
            Left = 31
            Top = 0
            Hint = 'Agregar archivo'
            ImageIndex = 6
            OnClick = btnAgregarArchivoClick
          end
          object btnEliminarArchivo: TToolButton
            Left = 54
            Top = 0
            Hint = 'Eliminar archivo'
            ImageIndex = 8
            OnClick = btnEliminarArchivoClick
          end
          object ToolButton17: TToolButton
            Left = 77
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 11
            Style = tbsSeparator
          end
          object btnVerArchivo: TToolButton
            Left = 85
            Top = 0
            Hint = 'Abrir archivo'
            ImageIndex = 21
            OnClick = btnVerArchivoClick
          end
          object Panel12: TPanel
            Left = 108
            Top = 0
            Width = 203
            Height = 22
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object GridArchivos: TArtDBGrid
          Left = 0
          Top = 26
          Width = 972
          Height = 104
          Align = alClient
          DataSource = dsArchivos
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = GridArchivosDblClick
          OnGetCellParams = GridArchivosGetCellParams
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'VJ_NOMBREARCHIVO'
              Title.Caption = 'Nombre Archivo'
              Width = 277
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VJ_USUALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VJ_FECHAALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VJ_USUBAJA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VJ_FECHABAJA'
              Visible = True
            end>
        end
      end
      object tsRespuestas: TTabSheet
        Caption = 'Respuestas'
        object tlbBarra: TToolBar
          Left = 0
          Top = 0
          Width = 972
          Height = 26
          AutoSize = True
          BorderWidth = 1
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object btnRefresh: TToolButton
            Left = 0
            Top = 0
            Hint = 'Refrescar'
            ImageIndex = 0
            OnClick = btnRefreshClick
          end
          object ToolButton2: TToolButton
            Left = 23
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 14
            Style = tbsSeparator
          end
          object btnAgregar: TToolButton
            Left = 31
            Top = 0
            Hint = 'Agregar Respuesta'
            ImageIndex = 6
            OnClick = btnAgregarClick
          end
          object btnModificar: TToolButton
            Left = 54
            Top = 0
            Hint = 'Modificar una respuesta'
            ImageIndex = 7
            OnClick = btnModificarClick
          end
          object btnEliminar: TToolButton
            Left = 77
            Top = 0
            Hint = 'Eliminar respuesta'
            ImageIndex = 8
            OnClick = btnEliminarClick
          end
          object ToolButton12: TToolButton
            Left = 100
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
            Visible = False
          end
          object btnAGA: TToolButton
            Left = 108
            Top = 0
            ImageIndex = 18
            Visible = False
          end
          object ToolButton14: TToolButton
            Left = 131
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 11
            Style = tbsSeparator
          end
          object btnVerRespuesta: TToolButton
            Left = 139
            Top = 0
            Hint = 'Abrir documentaci'#243'n'
            Caption = 'btnVerRespuesta'
            ImageIndex = 21
            OnClick = btnVerRespuestaClick
          end
          object Panel9: TPanel
            Left = 162
            Top = 0
            Width = 203
            Height = 22
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object GridRespuestas: TArtDBGrid
          Left = 0
          Top = 26
          Width = 972
          Height = 104
          Align = alClient
          DataSource = dsRespuestas
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = GridRespuestasCellClick
          OnDblClick = GridRespuestasDblClick
          OnGetCellParams = GridRespuestasGetCellParams
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'VR_SECUENCIA'
              Title.Caption = 'Nro.'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VR_ID'
              Title.Caption = 'Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'VR_IDRECLAMO'
              Title.Caption = 'Reclamo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'VR_FECHA'
              Title.Caption = 'Fecha'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VR_FECHA_ENVIO'
              Title.Caption = 'Fecha Envio'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VR_ARCHIVO'
              Title.Caption = 'Archivo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'VR_RESPUESTA'
              Title.Caption = 'Resumen'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VR_USUALTA'
              Title.Caption = 'Usu. Alta'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VR_FECHAALTA'
              Title.Caption = 'Fecha Alta'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VR_USUMODIF'
              Title.Caption = 'Usu. Modif.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VR_FECHAMODIF'
              Title.Caption = 'Fecha Modif.'
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VR_USUBAJA'
              Title.Caption = 'Usu. Baja'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VR_FECHABAJA'
              Title.Caption = 'Fecha Baja'
              Width = 62
              Visible = True
            end>
        end
      end
    end
  end
  object fpTextosRespuesta: TFormPanel [11]
    Left = 458
    Top = 272
    Width = 534
    Height = 279
    Caption = 'Ingresar textos opcionales'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu, biMinimize]
    BorderStyle = bsDialog
    Position = poScreenCenter
    DesignSize = (
      534
      279)
    object Bevel4: TBevel
      Left = -488
      Top = 239
      Width = 1022
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 131
      ExplicitWidth = 772
    end
    object Label47: TLabel
      Left = 14
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Texto 1'
    end
    object Label46: TLabel
      Left = 14
      Top = 82
      Width = 37
      Height = 13
      Caption = 'Texto 2'
    end
    object Label48: TLabel
      Left = 14
      Top = 154
      Width = 37
      Height = 13
      Caption = 'Texto 3'
    end
    object btnAceptarTextosRespuesta: TButton
      Left = 377
      Top = 247
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Visualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarTextosRespuestaClick
    end
    object Button2: TButton
      Left = 452
      Top = 247
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 1
    end
    object btnLimpiar: TButton
      Left = 14
      Top = 247
      Width = 85
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Limpiar textos'
      TabOrder = 2
      OnClick = btnLimpiarClick
    end
    object mTexto1: TMemo
      Left = 14
      Top = 23
      Width = 505
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 1024
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object mTexto2: TMemo
      Left = 14
      Top = 98
      Width = 505
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object mTexto3: TMemo
      Left = 14
      Top = 170
      Width = 505
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      ScrollBars = ssVertical
      TabOrder = 5
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT vr_idtipo,'
      '               vp_descripcion,'
      '               vr_id,'
      '               vr_idexpediente,'
      '               vr_nroreclamo_srt,'
      '               vr_idsubtema,'
      '               vr_idestado,'
      '               vr_fechareclamo,'
      '               vr_fechavencimiento,'
      '               vr_contrato,'
      '               vr_cuil_cuit_denunciante,'
      '               vr_usuario_srt,'
      '               vr_archivo_srt,'
      '               vr_idaseguradora,'
      '               ar_codigosrt,'
      '               ar_nombre,'
      '               ar_id,'
      '               vr_nombre_denunciante,'
      '               CASE'
      '                 WHEN vr_idestado = 5'
      '                 THEN'
      '                   CASE'
      
        '                     WHEN DECODE (GREATEST (NVL (vr_fecha_respue' +
        'sta, TRUNC(vr_fechamodif)) - vr_fechavencimiento, 0),'
      '                                  0, TO_NUMBER (NULL),'
      
        '                                  NVL (vr_fecha_respuesta, TRUNC' +
        '(vr_fechamodif)) - vr_fechavencimiento) > 0'
      '                     THEN'
      
        '                       ve_id * 10 + 1 + CASE NVL (vr_documentaci' +
        'on_completa, '#39'S'#39') WHEN '#39'S'#39' THEN 0 ELSE 2 END'
      '                     ELSE'
      
        '                       ve_id * 10 + 2 + CASE NVL (vr_documentaci' +
        'on_completa, '#39'S'#39') WHEN '#39'S'#39' THEN 0 ELSE 2 END'
      '                   END'
      '                 ELSE'
      '                   ve_id'
      '               END'
      '                 ve_id,'
      '               CASE'
      '                 WHEN vr_idestado = 5'
      '                 THEN'
      '                   CASE'
      
        '                     WHEN DECODE (GREATEST (NVL (vr_fecha_respue' +
        'sta, TRUNC(vr_fechamodif)) - vr_fechavencimiento, 0),'
      '                                  0, TO_NUMBER (NULL),'
      
        '                                  NVL (vr_fecha_respuesta, TRUNC' +
        '(vr_fechamodif)) - vr_fechavencimiento) > 0'
      '                     THEN'
      '                          ve_descripcion'
      
        '                       || CASE NVL (vr_documentacion_completa, '#39 +
        'S'#39') WHEN '#39'S'#39' THEN '#39#39' ELSE '#39' parcialmente '#39' END'
      '                       || '#39' vencido'#39
      '                     ELSE'
      '                          ve_descripcion'
      
        '                       || CASE NVL (vr_documentacion_completa, '#39 +
        'S'#39') WHEN '#39'S'#39' THEN '#39#39' ELSE '#39' parcialmente '#39' END'
      '                       || '#39' a t'#233'rmino'#39
      '                   END'
      '                 ELSE'
      '                   ve_descripcion'
      '               END'
      '                 ve_descripcion,'
      '               vs_descripcion,'
      '               vt_descripcion,'
      '               ex_id,'
      '               gp_nombre,'
      '               vs_id,'
      '               vt_id,'
      '               ex_siniestro,'
      '               ex_orden,'
      '               ex_recaida,'
      '               vr_tipodocumento_denunciante,'
      '               vr_usuario_asignado,'
      
        '               art.utiles.armar_siniestro (ex_siniestro, ex_orde' +
        'n, ex_recaida) AS siniestro,'
      '               em_nombre,'
      '               vr_usualta,'
      '               vr_fechaalta,'
      '               vr_usumodif,'
      '               vr_fechamodif,'
      '               vr_usubaja,'
      '               vr_fechabaja,'
      '               vr_idarticulo,'
      '               vr_hecho,'
      '               vr_respuesta,'
      '               tj_nombre,'
      '               tj_id,'
      '               vr_secuencia,'
      '               lg_nombre,'
      '               vr_fecha_respuesta,'
      '               co_contrato,'
      '               va_id,'
      '               va_descripcion,'
      '               vp_id,'
      
        '               NVL (vr_documentacion_completa, '#39'S'#39') AS vr_docume' +
        'ntacion_completa,'
      '               vr_recibido,'
      '               ex_gtrabajo,'
      '               lg_codigo,'
      '               DECODE (vr_idestado,'
      
        '                       5, NVL (vr_fecha_respuesta, TRUNC (vr_fec' +
        'hamodif)) - vr_fechareclamo,'
      
        '                       6, NVL (vr_fecha_respuesta, TRUNC (vr_fec' +
        'hamodif)) - vr_fechareclamo,'
      '                       NULL)'
      '                 AS dias_resolucion,'
      '               (SELECT TRUNC (MIN (pr.vr_fechaalta))'
      '                  FROM comunes.cvr_ventanilla_respuesta pr'
      '                 WHERE pr.vr_idreclamo = cvr.vr_id)'
      '               - cvr.vr_fechareclamo'
      '                 AS primera_respuesta,'
      '               CASE'
      
        '                 WHEN vr_documentacion_completa IS NULL THEN '#39'01' +
        #39
      '                 WHEN vr_documentacion_completa = '#39'S'#39' THEN '#39'01'#39
      '                 WHEN vr_documentacion_completa = '#39'N'#39' THEN '#39'02'#39
      '               END'
      '                 AS documentacion,'
      '               CASE'
      '                 WHEN vr_recibido IS NULL THEN '#39'00'#39
      '                 WHEN vr_recibido = '#39'S'#39' THEN '#39'01'#39
      '                 WHEN vr_recibido = '#39'N'#39' THEN '#39'02'#39
      '               END'
      '                 AS recibido,'
      '               CASE'
      '                 WHEN vr_idestado = 4'
      '                 THEN'
      '                   art.actualdate - vr_fechavencimiento'
      '                 WHEN vr_idestado >= 5'
      '                 THEN'
      
        '                   DECODE (GREATEST (NVL (vr_fecha_respuesta, TR' +
        'UNC (vr_fechamodif)) - vr_fechavencimiento, 0),'
      '                           0, TO_NUMBER (NULL),'
      
        '                           NVL (vr_fecha_respuesta, TRUNC (vr_fe' +
        'chamodif)) - vr_fechavencimiento)'
      '               END'
      '                 AS vencido_hace,'
      '               CASE'
      '                 WHEN vr_idestado = 4'
      '                 THEN'
      '                   art.actualdate - vr_fechavencimiento'
      '                 WHEN vr_idestado >= 5'
      '                 THEN'
      
        '                   DECODE (GREATEST (NVL ( (SELECT TRUNC (MIN (p' +
        'r.vr_fechaalta))'
      
        '                                              FROM comunes.cvr_v' +
        'entanilla_respuesta pr'
      
        '                                             WHERE pr.vr_idrecla' +
        'mo = cvr.vr_id), TRUNC (vr_fechamodif))'
      '                                     - vr_fechavencimiento, 0),'
      '                           0, TO_NUMBER (NULL),'
      
        '                           NVL ( (SELECT TRUNC (MIN (pr.vr_fecha' +
        'alta))'
      
        '                                    FROM comunes.cvr_ventanilla_' +
        'respuesta pr'
      
        '                                   WHERE pr.vr_idreclamo = cvr.v' +
        'r_id), TRUNC (vr_fechamodif))'
      '                           - vr_fechavencimiento)'
      '               END'
      '                 AS vencido_primera_respuesta,'
      '               vs_fechabaja, vp_fechabaja,'
      '               vr_observaciones,'
      '               vr_idestablecimiento,'
      '               es_tipoestablecimiento,'
      '               es_idactividad,'
      '               ac_descripcion,'
      '               tb_codigo as tipoempresa,'
      '               tb_descripcion as desctipoempresa,'
      '               case'
      '                when es_tipoestablecimiento = '#39'P'#39' then '#39'Propio'#39
      '                when es_tipoestablecimiento = '#39'T'#39' then '#39'tercero'#39
      
        '                when es_tipoestablecimiento = '#39'O'#39' then '#39'Obra Civ' +
        'il'#39
      '                when es_tipoestablecimiento = '#39'A'#39' then '#39'Agro'#39
      '               end as tipoestablecimiento,'
      
        '               GREATEST(TRUNC(vr_fechaalta - vr_fechareclamo), 0' +
        ') dif,'
      '               CASE'
      '                 WHEN NOT EXISTS (SELECT 1'
      '                                    FROM agenda.aat_agendatarea'
      
        '                                   WHERE at_idtipoevento IN (423' +
        ', 424, 425)'
      '                                     AND at_idmotivoingreso = 12'
      
        '                                     AND at_contrato = vr_contra' +
        'to'
      
        '                                     AND at_idtrabajador = ex_id' +
        'trabajador'
      
        '                                     AND at_idexpediente = vr_id' +
        'expediente'
      
        '                                     AND at_fechaalta >= vr_fech' +
        'aalta) THEN'
      '                   '#39'No derivado'#39
      
        '                 WHEN TRUNC(vr_fechaalta) < (SELECT MIN(TRUNC(at' +
        '_fechaalta))'
      
        '                                               FROM agenda.aat_a' +
        'gendatarea'
      
        '                                              WHERE at_idtipoeve' +
        'nto IN (423, 424, 425)'
      
        '                                                AND at_idmotivoi' +
        'ngreso = 12'
      
        '                                                AND at_contrato ' +
        '= vr_contrato'
      
        '                                                AND at_idtrabaja' +
        'dor = ex_idtrabajador'
      
        '                                                AND at_idexpedie' +
        'nte = vr_idexpediente'
      
        '                                                AND at_fechaalta' +
        ' >= vr_fechaalta) THEN'
      '                   '#39'Fuera de t'#233'rmino'#39
      '                 ELSE'
      '                   '#39'A t'#233'rmino'#39
      '               END'
      '                 derivacion'
      '          FROM art.ctb_tablas,'
      '               cac_actividad,'
      '               afi.aes_establecimiento,'
      '               aem_empresa,'
      '               aco_contrato,'
      '               art.mgp_gtrabajo,'
      '               art.dlg_delegaciones,'
      '               ctj_trabajador,'
      '               art.sex_expedientes,'
      '               afi.aar_art,'
      '               comunes.cve_ventanilla_estados,'
      '               comunes.cva_ventanilla_articulos,'
      '               comunes.cvp_ventanilla_tipo,'
      '               comunes.cvt_ventanilla_temas,'
      '               comunes.cvs_ventanilla_subtemas,'
      '               comunes.cvr_ventanilla_reclamos cvr'
      '         WHERE vr_idsubtema = vs_id'
      '           AND vs_idtema = vt_id'
      '           AND vr_idtipo = vp_id(+)'
      '           AND vr_idarticulo = va_id(+)'
      '           AND vr_idestado = ve_id'
      '           AND vr_idaseguradora = ar_id(+)'
      '           AND vr_idexpediente = ex_id(+)'
      '           AND ex_cuil = tj_cuil(+)'
      '           AND ex_delegacion = lg_codigo(+)'
      '           AND ex_gtrabajo = gp_codigo(+)'
      '           AND vr_contrato = co_contrato(+)'
      '           AND co_idempresa = em_id(+)'
      '           AND vr_idestablecimiento = es_id(+)'
      '           AND es_idactividad = ac_id(+)'
      '           AND tb_clave(+) = '#39'TFET'#39
      
        '           AND tb_codigo(+) = art.hys.get_tipo_empresa(em_cuit, ' +
        'null, SYSDATE)) tabla'
      ' WHERE 1 = 1')
    Top = 304
    object sdqConsultaVR_ID: TFloatField
      FieldName = 'VR_ID'
      Required = True
    end
    object sdqConsultaVR_IDEXPEDIENTE: TFloatField
      FieldName = 'VR_IDEXPEDIENTE'
    end
    object sdqConsultaVR_IDSUBTEMA: TFloatField
      FieldName = 'VR_IDSUBTEMA'
      Required = True
    end
    object sdqConsultaVR_IDESTADO: TFloatField
      FieldName = 'VR_IDESTADO'
      Required = True
    end
    object sdqConsultaVR_FECHARECLAMO: TDateTimeField
      DisplayLabel = 'Reclamo'
      FieldName = 'VR_FECHARECLAMO'
      Required = True
    end
    object sdqConsultaVR_FECHAVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VR_FECHAVENCIMIENTO'
      Required = True
    end
    object sdqConsultaVR_CONTRATO: TFloatField
      DisplayLabel = 'Contrato'
      FieldName = 'VR_CONTRATO'
    end
    object sdqConsultaVR_CUIL_CUIT_DENUNCIANTE: TStringField
      DisplayLabel = 'CUIT/CUIL'
      FieldName = 'VR_CUIL_CUIT_DENUNCIANTE'
      Size = 11
    end
    object sdqConsultaVR_NOMBRE_DENUNCIANTE: TStringField
      DisplayLabel = 'Denunciante'
      FieldName = 'VR_NOMBRE_DENUNCIANTE'
      Size = 255
    end
    object sdqConsultaVE_DESCRIPCION: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'VE_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaVS_DESCRIPCION: TStringField
      DisplayLabel = 'Subtema'
      FieldName = 'VS_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaVT_DESCRIPCION: TStringField
      DisplayLabel = 'Tema'
      FieldName = 'VT_DESCRIPCION'
      Required = True
      Size = 200
    end
    object sdqConsultaEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
    object sdqConsultaSINIESTRO: TStringField
      DisplayLabel = 'Siniestro'
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqConsultaEM_NOMBRE: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EM_NOMBRE'
      Size = 60
    end
    object sdqConsultaVR_USUALTA: TStringField
      FieldName = 'VR_USUALTA'
      Required = True
    end
    object sdqConsultaVR_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'VR_FECHAALTA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy HH:nn'
    end
    object sdqConsultaVR_USUMODIF: TStringField
      FieldName = 'VR_USUMODIF'
    end
    object sdqConsultaVR_FECHAMODIF: TDateTimeField
      FieldName = 'VR_FECHAMODIF'
    end
    object sdqConsultaVR_USUBAJA: TStringField
      FieldName = 'VR_USUBAJA'
    end
    object sdqConsultaVR_FECHABAJA: TDateTimeField
      FieldName = 'VR_FECHABAJA'
    end
    object sdqConsultaVS_ID: TFloatField
      FieldName = 'VS_ID'
      Required = True
    end
    object sdqConsultaVT_ID: TFloatField
      FieldName = 'VT_ID'
      Required = True
    end
    object sdqConsultaVR_NRORECLAMO_SRT: TStringField
      DisplayLabel = 'N'#176' Reclamo'
      FieldName = 'VR_NRORECLAMO_SRT'
      Required = True
      Size = 15
    end
    object sdqConsultaEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
    end
    object sdqConsultaEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
    end
    object sdqConsultaEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
    end
    object sdqConsultaVR_TIPODOCUMENTO_DENUNCIANTE: TStringField
      FieldName = 'VR_TIPODOCUMENTO_DENUNCIANTE'
      Size = 10
    end
    object sdqConsultaVR_IDARTICULO: TFloatField
      FieldName = 'VR_IDARTICULO'
      Required = True
    end
    object sdqConsultaVR_HECHO: TStringField
      FieldName = 'VR_HECHO'
      Size = 2000
    end
    object sdqConsultaVR_RESPUESTA: TStringField
      FieldName = 'VR_RESPUESTA'
      Size = 2000
    end
    object sdqConsultaTJ_NOMBRE: TStringField
      DisplayLabel = 'Trabajador'
      FieldName = 'TJ_NOMBRE'
      Size = 60
    end
    object sdqConsultaVE_ID: TFloatField
      FieldName = 'VE_ID'
      Required = True
    end
    object sdqConsultaGP_NOMBRE: TStringField
      DisplayLabel = 'Grupo de trabajo'
      FieldName = 'GP_NOMBRE'
      Size = 30
    end
    object sdqConsultaVR_IDTIPO: TFloatField
      FieldName = 'VR_IDTIPO'
    end
    object sdqConsultaVP_DESCRIPCION: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'VP_DESCRIPCION'
      Size = 30
    end
    object sdqConsultaVR_SECUENCIA: TFloatField
      DisplayLabel = 'Sec.'
      FieldName = 'VR_SECUENCIA'
    end
    object sdqConsultaLG_NOMBRE: TStringField
      DisplayLabel = 'Delegaci'#243'n'
      FieldName = 'LG_NOMBRE'
      Size = 50
    end
    object sdqConsultaVR_FECHA_RESPUESTA: TDateTimeField
      DisplayLabel = 'Respuesta'
      FieldName = 'VR_FECHA_RESPUESTA'
    end
    object sdqConsultaVR_DOCUMENTACION_COMPLETA: TStringField
      DisplayLabel = 'Documentaci'#243'n completa'
      FieldName = 'VR_DOCUMENTACION_COMPLETA'
      Size = 1
    end
    object sdqConsultaDIAS_RESOLUCION: TFloatField
      DisplayLabel = 'Resoluci'#243'n'
      FieldName = 'DIAS_RESOLUCION'
    end
    object sdqConsultaVENCIDO_HACE: TFloatField
      DisplayLabel = 'Vencido (d'#237'as)'
      FieldName = 'VENCIDO_HACE'
    end
    object sdqConsultaDOCUMENTACION: TStringField
      FieldName = 'DOCUMENTACION'
      FixedChar = True
      Size = 2
    end
    object sdqConsultaVR_RECIBIDO: TStringField
      FieldName = 'VR_RECIBIDO'
      Size = 1
    end
    object sdqConsultaRECIBIDO: TStringField
      FieldName = 'RECIBIDO'
      FixedChar = True
      Size = 2
    end
    object sdqConsultaTJ_ID: TFloatField
      FieldName = 'TJ_ID'
      Required = True
    end
    object sdqConsultaCO_CONTRATO: TFloatField
      FieldName = 'CO_CONTRATO'
      Required = True
    end
    object sdqConsultaEX_GTRABAJO: TStringField
      FieldName = 'EX_GTRABAJO'
      Size = 2
    end
    object sdqConsultaVA_ID: TFloatField
      FieldName = 'VA_ID'
      Required = True
    end
    object sdqConsultaVP_ID: TFloatField
      FieldName = 'VP_ID'
    end
    object sdqConsultavr_usuario_srt: TStringField
      FieldName = 'VR_USUARIO_SRT'
      Size = 250
    end
    object sdqConsultaVR_USUARIO_ASIGNADO: TStringField
      FieldName = 'VR_USUARIO_ASIGNADO'
      Size = 250
    end
    object sdqConsultaVR_ARCHIVO_SRT: TStringField
      FieldName = 'VR_ARCHIVO_SRT'
      Size = 250
    end
    object sdqConsultaVR_IDASEGURADORA: TFloatField
      FieldName = 'VR_IDASEGURADORA'
    end
    object sdqConsultaAR_CODIGOSRT: TStringField
      FieldName = 'AR_CODIGOSRT'
      Size = 5
    end
    object sdqConsultaAR_NOMBRE: TStringField
      FieldName = 'AR_NOMBRE'
      Size = 60
    end
    object sdqConsultaLG_CODIGO: TStringField
      FieldName = 'LG_CODIGO'
      Size = 4
    end
    object sdqConsultaAR_ID: TFloatField
      FieldName = 'AR_ID'
    end
    object sdqConsultaPRIMERA_RESPUESTA: TFloatField
      FieldName = 'PRIMERA_RESPUESTA'
    end
    object sdqConsultaVENCIDO_PRIMERA_RESPUESTA: TFloatField
      FieldName = 'VENCIDO_PRIMERA_RESPUESTA'
    end
    object sdqConsultaVS_FECHABAJA: TDateTimeField
      FieldName = 'VS_FECHABAJA'
    end
    object sdqConsultaVP_FECHABAJA: TDateTimeField
      FieldName = 'VP_FECHABAJA'
    end
    object sdqConsultaVA_DESCRIPCION: TStringField
      FieldName = 'VA_DESCRIPCION'
      Size = 1000
    end
    object sdqConsultaVR_OBSERVACIONES: TStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'VR_OBSERVACIONES'
      Size = 2000
    end
    object sdqConsultaVR_IDESTABLECIMIENTO: TFloatField
      FieldName = 'VR_IDESTABLECIMIENTO'
    end
    object sdqConsultaES_TIPOESTABLECIMIENTO: TStringField
      FieldName = 'ES_TIPOESTABLECIMIENTO'
      FixedChar = True
      Size = 1
    end
    object sdqConsultaTIPOEMPRESA: TStringField
      FieldName = 'TIPOEMPRESA'
      Size = 4000
    end
    object sdqConsultaES_IDACTIVIDAD: TFloatField
      FieldName = 'ES_IDACTIVIDAD'
    end
    object sdqConsultaAC_DESCRIPCION: TStringField
      DisplayLabel = 'Actividad'
      FieldName = 'AC_DESCRIPCION'
      Size = 200
    end
    object sdqConsultaDESCTIPOEMPRESA: TStringField
      DisplayLabel = 'Tipo Empresa'
      FieldName = 'DESCTIPOEMPRESA'
      Size = 150
    end
    object sdqConsultaTIPOESTABLECIMIENTO: TStringField
      DisplayLabel = 'Tipo de establecimiento'
      FieldName = 'TIPOESTABLECIMIENTO'
      Size = 10
    end
    object sdqConsultaDIF: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Demora de carga'
      FieldName = 'DIF'
    end
    object sdqConsultaDERIVACION: TStringField
      DisplayLabel = 'Derivaci'#243'n'
      DisplayWidth = 25
      FieldName = 'DERIVACION'
      FixedChar = True
    end
  end
  inherited dsConsulta: TDataSource
    Top = 304
  end
  inherited SortDialog: TSortDialog
    Top = 332
  end
  inherited ExportDialog: TExportDialog
    Top = 332
  end
  inherited QueryPrint: TQueryPrint
    Top = 360
  end
  inherited Seguridad: TSeguridad
    Top = 276
  end
  inherited FormStorage: TFormStorage
    Top = 276
  end
  inherited PrintDialog: TPrintDialog
    Top = 360
  end
  inherited ShortCutControl: TShortCutControl
    Top = 276
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Top = 304
  end
  object ShortCutControlHijo: TShortCutControl
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
    Top = 332
  end
  object sdqDestinatarios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT '#39'Preventor ('#39' || it_nombre || '#39')'#39' AS nombre,'
      '       it_email AS correo,'
      '       se_id AS id'
      '  FROM art.use_usuarios, art.pit_firmantes, art.sex_expedientes'
      'WHERE it_codigo = art.hys.get_preventor_referente(ex_cuit)'
      '   AND ex_id = :id_expediente'
      '   AND it_email IS NOT NULL'
      '   AND it_usuario = se_usuario'
      '   AND se_fechabaja IS NULL'
      '   AND se_mail IS NOT NULL'
      '   AND :ventanilla IN (8)'
      'UNION'
      'SELECT '#39'Preventor ('#39' || it_nombre || '#39')'#39' AS nombre,'
      '       it_email AS correo,'
      '       se_id AS id'
      
        '  FROM art.use_usuarios, art.pit_firmantes, aem_empresa, aco_con' +
        'trato'
      'WHERE co_contrato = :contrato'
      
        '   AND co_contrato = art.afiliacion.get_contratovigente(em_cuit,' +
        ' art.actualdate)'
      '   AND co_idempresa = em_id'
      '   AND it_codigo = art.hys.get_preventor_referente(em_cuit)'
      '   AND it_email IS NOT NULL'
      '   AND it_usuario = se_usuario'
      '   AND se_fechabaja IS NULL'
      '   AND se_mail IS NOT NULL'
      '   AND :ventanilla IN (8)'
      'UNION'
      'SELECT '#39'Gestor del siniestro ('#39' || se_nombre || '#39')'#39' AS nombre,'
      '       se_mail AS correo,'
      '       se_id AS id'
      '  FROM art.use_usuarios, art.sex_expedientes'
      'WHERE ex_gestor = se_usuario'
      '   AND ex_id = :id_expediente'
      '   AND se_mail IS NOT NULL'
      '   AND se_fechabaja IS NULL'
      '   AND :ventanilla NOT IN (2, 7, 8)'
      '   AND :motivo <> 79'
      'UNION'
      
        'SELECT tb_descripcion || '#39' del grupo de trabajo ('#39' || se_nombre ' +
        '|| '#39')'#39' AS nombre,'
      '       se_mail AS correo,'
      '       se_id AS id'
      
        '  FROM art.use_usuarios, art.ctb_tablas, art.mug_usuariogrupotra' +
        'bajo, art.sex_expedientes'
      'WHERE ug_usuario = se_usuario'
      '   AND tb_clave = '#39'TUSU'#39
      '   AND tb_codigo IN ('#39'02'#39')'
      '   AND tb_codigo = ug_tipousuario'
      '   AND ug_grupo = ex_gtrabajo'
      '   AND ex_id = :id_expediente'
      '   AND se_mail IS NOT NULL'
      '   AND se_fechabaja IS NULL'
      '   AND :ventanilla NOT IN (2, 7, 8)'
      '   AND :motivo <> 79'
      'UNION'
      
        'SELECT '#39'Gestor de cobranzas ('#39' || INITCAP(gc_nombre) || '#39')'#39' AS n' +
        'ombre,'
      '       gc_direlectronica AS correo,'
      '       se_id AS id'
      
        '  FROM art.use_usuarios, afi.agc_gestorcuenta, aem_empresa, aco_' +
        'contrato'
      'WHERE co_contrato = :contrato'
      
        '   AND co_contrato = art.afiliacion.get_contratovigente(em_cuit,' +
        ' art.actualdate)'
      '   AND co_idempresa = em_id'
      '   AND co_idgestor = gc_id'
      '   AND gc_usuario = se_usuario'
      '   AND se_fechabaja IS NULL'
      '   AND se_mail IS NOT NULL'
      '   AND gc_direlectronica IS NOT NULL'
      '   AND :ventanilla IN (2, 7)'
      'UNION'
      
        'SELECT '#39'Ejecutivo de cuentas ('#39' || INITCAP(ec_nombre) || '#39')'#39' AS ' +
        'nombre,'
      '       se_mail AS correo,'
      '       se_id AS id'
      
        '  FROM art.use_usuarios, afi.aec_ejecutivocuenta, aem_empresa, a' +
        'co_contrato'
      'WHERE co_contrato = :contrato'
      
        '   AND co_contrato = art.afiliacion.get_contratovigente(em_cuit,' +
        ' art.actualdate)'
      '   AND co_idempresa = em_id'
      '   AND co_idejecutivo = ec_id'
      '   AND UPPER(se_nombre) = ec_nombre'
      '   AND se_mail IS NOT NULL'
      '   AND se_fechabaja IS NULL'
      '   AND :ventanilla IN (2, 7)'
      'UNION'
      'SELECT '#39'Incapacidades - '#39' || se_nombre AS nombre,'
      '       se_mail AS correo,'
      '       se_id AS id'
      '  FROM art.use_usuarios'
      'WHERE se_mail IS NOT NULL'
      '   AND se_fechabaja IS NULL'
      
        '   AND se_usuario IN ('#39'KSZEINKOP'#39', '#39'JBUSCIOLANO'#39', '#39'DPLACHE'#39', '#39'EC' +
        'ANOSA'#39' )'
      '   AND :motivo = 79'
      'ORDER BY 1'
      '')
    Left = 24
    Top = 388
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_expediente'
        ParamType = ptInput
        Size = 8
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'ventanilla'
        ParamType = ptInput
        Size = 8
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
        Size = 8
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'ventanilla'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_expediente'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ventanilla'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'motivo'
        ParamType = ptInput
        Size = 8
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'id_expediente'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ventanilla'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'motivo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ventanilla'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ventanilla'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'motivo'
        ParamType = ptInput
      end>
  end
  object sdqUsuariosART: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT se_nombre AS nombre, se_mail AS correo, se_id as id'
      '  FROM art.use_usuarios'
      ' WHERE se_mail IS NOT NULL'
      '   AND se_fechabaja IS NULL'
      ' ORDER BY 1')
    Left = 52
    Top = 388
  end
  object dsRespuestas: TDataSource
    DataSet = sdqRespuestas
    Left = 24
    Top = 416
  end
  object sdqRespuestas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqRespuestasAfterOpen
    Left = 52
    Top = 416
  end
  object dsSIC: TDataSource
    DataSet = sdqSIC
    Left = 616
    Top = 408
  end
  object sdqSIC: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT at_id AS id,'
      '       '#39'Tarea en curso'#39' AS instancia,'
      '       '#39'S'#39' as tarea,'
      '       mi_descripcion AS canal,'
      '       te_descripcion AS tipo,'
      '       at_fechaalta AS fecha,'
      '       at_descripcion AS descripcion,'
      '       CASE'
      '         WHEN EXISTS (SELECT 1'
      '                        FROM agenda.aot_observaciontarea'
      '                       WHERE ot_idagendatarea = at_id)'
      '         THEN'
      '           '#39#252#39
      '         ELSE'
      '           '#39#251#39
      '       END'
      '         AS obs,'
      '       (SELECT CAST(wm_concat (se_nombre) as VARCHAR2(4000))'
      '          FROM art.use_usuarios, agenda.ast_seguimientotarea'
      '         WHERE se_id = st_idusuario'
      '           AND at_id = st_idtarea'
      '           AND st_estado IN ('#39'A'#39', '#39'T'#39'))'
      '         AS responsable'
      
        '  FROM agenda.aat_agendatarea, agenda.ami_motivoingreso, agenda.' +
        'ate_tipoevento'
      ' WHERE at_idexpediente = :idexpediente'
      '   AND at_idtipoevento = te_id'
      '   AND at_idmotivoingreso = mi_id'
      '   AND at_ideventotarea IS NULL'
      'UNION ALL'
      'SELECT ae_id AS id,'
      '       '#39'Evento'#39' AS instancia,'
      '       '#39'N'#39' as tarea,       '
      '       mi_descripcion AS canal,'
      '       te_descripcion AS tipo,'
      '       ae_fechaalta AS fecha,'
      '       ae_descripcion AS descripcion,'
      '       CASE'
      '         WHEN EXISTS (SELECT 1'
      '                        FROM agenda.aoe_observacionevento'
      '                       WHERE oe_idagendaevento = ae_id)'
      '         THEN'
      '           '#39#252#39
      '         ELSE'
      '           '#39#251#39
      '       END'
      '         AS obs,'
      '       se_nombre AS responsable'
      '  FROM art.use_usuarios,'
      '       agenda.aae_agendaevento,'
      '       agenda.ami_motivoingreso,'
      '       agenda.ate_tipoevento'
      ' WHERE ae_idexpediente = :idexpediente'
      '   AND ae_idtipoevento = te_id'
      '   AND ae_idusuario = se_id'
      '   AND ae_idmotivoingreso = mi_id'
      '   AND NOT EXISTS (SELECT 1'
      '                     FROM agenda.aat_agendatarea'
      '                    WHERE at_idagendaevento = ae_id)'
      'ORDER BY fecha DESC')
    Left = 644
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idexpediente'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idexpediente'
        ParamType = ptInput
      end>
  end
  object pmSIC: TPopupMenu
    OnPopup = pmSICPopup
    Left = 672
    Top = 408
    object mnuAgregarObservacionesTarea: TMenuItem
      Caption = 'Agregar observaciones en la Tarea'
      OnClick = mnuAgregarObservacionesTareaClick
    end
    object mnuAgregarObservacionesEvento: TMenuItem
      Caption = 'Agregar observaciones en el Evento'
      OnClick = mnuAgregarObservacionesEventoClick
    end
  end
  object sdqTipoEstablecimiento: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqRespuestasAfterOpen
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT '#39'P'#39' id,'
      '               '#39'P'#39' codigo,'
      '               '#39'Propio'#39' descripcion,'
      '               TO_DATE(NULL) AS baja,'
      '               1 orden'
      '          FROM DUAL'
      '        UNION'
      '        SELECT '#39'T'#39' id,'
      '               '#39'T'#39' codigo,'
      '               '#39'Tercero'#39' descripcion,'
      '               TO_DATE(NULL) AS baja,'
      '               2 orden'
      '          FROM DUAL'
      '        UNION'
      '        SELECT '#39'O'#39' id,'
      '               '#39'O'#39' codigo,'
      '               '#39'Obra Civil'#39' descripcion,'
      '               TO_DATE(NULL) AS baja,'
      '               3 orden'
      '          FROM DUAL'
      '        UNION'
      '        SELECT '#39'A'#39' id,'
      '               '#39'A'#39' codigo,'
      '               '#39'Agro'#39' descripcion,'
      '               TO_DATE(NULL) AS baja,'
      '               4 orden'
      '          FROM DUAL'
      '        ORDER BY orden)'
      ' WHERE 1 = 1')
    Left = 168
    Top = 388
  end
  object dsArchivos: TDataSource
    DataSet = sdqArchivos
    Left = 24
    Top = 460
  end
  object sdqArchivos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqArchivosAfterOpen
    SQL.Strings = (
      '  SELECT *'
      '    FROM comunes.cvj_ventanilla_adjunto'
      '   WHERE vj_idreclamo = :idreclamo'
      'ORDER BY vj_id')
    Left = 52
    Top = 460
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idreclamo'
        ParamType = ptInput
      end>
    object sdqArchivosVJ_ARCHIVO: TStringField
      DisplayLabel = 'Archivo'
      FieldName = 'VJ_ARCHIVO'
      Required = True
      Size = 255
    end
    object sdqArchivosVJ_USUALTA: TStringField
      DisplayLabel = 'Usu. Alta'
      FieldName = 'VJ_USUALTA'
      Required = True
    end
    object sdqArchivosVJ_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha Alta'
      FieldName = 'VJ_FECHAALTA'
      Required = True
    end
    object sdqArchivosVJ_USUBAJA: TStringField
      DisplayLabel = 'Usu. Baja'
      FieldName = 'VJ_USUBAJA'
    end
    object sdqArchivosVJ_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha Baja'
      FieldName = 'VJ_FECHABAJA'
    end
    object sdqArchivosVJ_ID: TFloatField
      FieldName = 'VJ_ID'
      Required = True
    end
    object sdqArchivosVJ_IDRECLAMO: TFloatField
      FieldName = 'VJ_IDRECLAMO'
      Required = True
    end
    object sdqArchivosVJ_NOMBREARCHIVO: TStringField
      FieldName = 'VJ_NOMBREARCHIVO'
      Size = 255
    end
  end
end
