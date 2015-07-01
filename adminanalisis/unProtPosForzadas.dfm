inherited frmProtPosForzadas: TfrmProtPosForzadas
  Left = 242
  Top = 157
  Width = 845
  Height = 618
  Caption = 
    'Protocolo Posiciones Forzadas y Gestos Repetitivos  ESOP 80004 /' +
    ' 80005'
  FormStyle = fsNormal
  KeyPreview = True
  OnKeyPress = FSFormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 837
    Height = 105
    Visible = True
    DesignSize = (
      837
      105)
    object Label41: TLabel
      Left = 11
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object Label43: TLabel
      Left = 11
      Top = 80
      Width = 33
      Height = 13
      Caption = 'Estab.:'
    end
    object Label44: TLabel
      Left = 10
      Top = 58
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label42: TLabel
      Left = 9
      Top = 36
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    object edFechaFiltro: TDateEdit
      Left = 65
      Top = 8
      Width = 97
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    inline fraEstablecimientoFiltro: TfraEstablecimiento
      Left = 64
      Top = 76
      Width = 767
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        767
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 702
      end
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 65
      Top = 54
      Width = 767
      Height = 167
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      DesignSize = (
        767
        167)
      inherited lbContrato: TLabel
        Left = 663
      end
      inherited edContrato: TIntEdit
        Left = 710
        Width = 55
      end
      inherited cmbRSocial: TArtComboBox
        Width = 528
      end
    end
    inline fraTrabajadorFiltro: TfraTrabajador
      Left = 65
      Top = 31
      Width = 767
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        767
        22)
      inherited cmbNombre: TArtComboBox
        Width = 683
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 105
    Width = 837
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 833
      end>
    inherited ToolBar: TToolBar
      Width = 820
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 134
    Width = 837
    Height = 457
    Columns = <
      item
        Expanded = False
        FieldName = 'PF_FECHA'
        Title.Caption = 'Fecha'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_CUIL'
        Title.Caption = 'CUIL'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador '
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_CALLE'
        Title.Caption = 'Calle'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_NUMERO'
        Title.Caption = 'Nro.'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_PISO'
        Title.Caption = 'Piso'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_DEPARTAMENTO'
        Title.Caption = 'Dto.'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_ESTABLECI'
        Title.Caption = 'Nro Establecimiento'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Establecimiento'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_RUBRO'
        Title.Caption = 'Rubro'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_ANTIGUEDAD'
        Title.Caption = 'Antiguedad'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_PUESTOTRABAJO'
        Title.Caption = 'Puesto de Trabajo'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_DESCTRABHABITUAL'
        Title.Caption = 'Desc. Trabajo Habitual'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_ANTECEDENTES'
        Title.Caption = 'Antecedentes Laborales'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_NROHORASDIA'
        Title.Caption = 'N'#186' Horas/D'#237'a'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_NROHORASSEMANA'
        Title.Caption = 'N'#186' Horas/Semana'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 57
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 64
    Top = 136
    Width = 759
    Height = 418
    OnShow = fpAbmShow
    KeyPreview = True
    Constraints.MinHeight = 1
    Constraints.MinWidth = 759
    OnKeyDown = fpAbmKeyDown
    OnKeyPress = fpAbmKeyPress
    DesignSize = (
      759
      418)
    inherited BevelAbm: TBevel
      Top = 382
      Width = 751
    end
    object Label47: TLabel [1]
      Left = 16
      Top = 394
      Width = 307
      Height = 13
      Caption = 
        'F2 para ir al bloque siguiente y Shift + F2 para ir al bloque an' +
        'terior'
    end
    inherited btnAceptar: TButton
      Left = 601
      Top = 388
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 679
      Top = 388
      TabOrder = 2
    end
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 0
      Width = 759
      Height = 378
      VertScrollBar.Position = 87
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      TabOrder = 0
      OnMouseWheelDown = ScrollBox1MouseWheelDown
      OnMouseWheelUp = ScrollBox1MouseWheelUp
      object gbDescripcion: TGroupBox
        Left = 0
        Top = -87
        Width = 743
        Height = 237
        Align = alTop
        Caption = 'Descripci'#243'n'
        TabOrder = 0
        DesignSize = (
          743
          237)
        object lbFecha: TLabel
          Left = 9
          Top = 16
          Width = 33
          Height = 13
          Caption = 'Fecha:'
        end
        object lbCUIT: TLabel
          Left = 10
          Top = 127
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        object lbEstab: TLabel
          Left = 11
          Top = 152
          Width = 33
          Height = 13
          Caption = 'Estab.:'
        end
        object lbRubro: TLabel
          Left = 12
          Top = 180
          Width = 29
          Height = 13
          Caption = 'Rubro'
        end
        object lbPuestodeTrabajo: TLabel
          Left = 7
          Top = 200
          Width = 54
          Height = 26
          Caption = ' Puesto de '#13#10'   Trabajo'
        end
        object lbAntiguedad: TLabel
          Left = 477
          Top = 208
          Width = 57
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Antiguedad:'
        end
        object Label39: TLabel
          Left = 542
          Top = 208
          Width = 27
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'A'#241'os:'
        end
        object Label40: TLabel
          Left = 634
          Top = 208
          Width = 34
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Meses:'
        end
        object Label45: TLabel
          Left = 9
          Top = 42
          Width = 51
          Height = 13
          Caption = 'Trabajador'
        end
        object Label46: TLabel
          Left = 173
          Top = 16
          Width = 48
          Height = 13
          Caption = 'Prestador:'
        end
        object edFechaProt: TDateEdit
          Left = 65
          Top = 12
          Width = 97
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
          OnChange = fraTrabajadorOnChange
        end
        inline fraDomicilioTrabajador: TfraDomicilio
          Left = 6
          Top = 67
          Width = 726
          Height = 51
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          DesignSize = (
            726
            51)
          inherited lbCalle: TLabel
            Left = 0
          end
          inherited lbNro: TLabel
            Left = 511
          end
          inherited lbPiso: TLabel
            Left = 583
          end
          inherited lbDto: TLabel
            Left = 659
          end
          inherited lbCPA: TLabel
            Left = 115
          end
          inherited lbLocalidad: TLabel
            Left = 223
          end
          inherited lbProvincia: TLabel
            Left = 564
          end
          inherited cmbCalle: TArtComboBox
            Left = 59
            Width = 413
          end
          inherited edNumero: TEdit
            Left = 533
          end
          inherited edPiso: TEdit
            Left = 609
          end
          inherited edDto: TEdit
            Left = 681
            Width = 40
          end
          inherited edCPostal: TIntEdit
            Left = 59
          end
          inherited cmbLocalidad: TArtComboBox
            Left = 273
            Width = 288
          end
          inherited edProvincia: TEdit
            Left = 613
            Width = 108
          end
          inherited edCPA: TPatternEdit
            Left = 141
          end
          inherited btnBuscar: TButton
            Left = 476
          end
        end
        inline fraEmpresa: TfraEmpresa
          Left = 65
          Top = 122
          Width = 666
          Height = 167
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          DesignSize = (
            666
            167)
          inherited lbContrato: TLabel
            Left = 562
          end
          inherited edContrato: TIntEdit
            Left = 609
            Width = 59
          end
          inherited cmbRSocial: TArtComboBox
            Width = 427
          end
        end
        inline fraEstablecimiento: TfraEstablecimiento
          Left = 64
          Top = 148
          Width = 667
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          DesignSize = (
            667
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 602
          end
        end
        object edRubro: TPatternEdit
          Left = 65
          Top = 176
          Width = 380
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 6
        end
        object edPuestodeTrabajo: TPatternEdit
          Left = 65
          Top = 204
          Width = 405
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          TabOrder = 7
        end
        object edAntiguedadAnios: TPatternEdit
          Left = 573
          Top = 204
          Width = 57
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 8
          Pattern = '1234567890-,'
        end
        object edAntiguedadMeses: TPatternEdit
          Left = 673
          Top = 204
          Width = 57
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 9
          Pattern = '1234567890-,'
        end
        inline fraTrabajadorProt: TfraTrabajador
          Left = 65
          Top = 39
          Width = 668
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnExit = fraTrabajadorProtExit
          DesignSize = (
            668
            22)
          inherited cmbNombre: TArtComboBox
            Width = 584
          end
        end
        inline fraPrestador: TfraCodigoDescripcion
          Left = 225
          Top = 10
          Width = 508
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          DesignSize = (
            508
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 443
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            CharCase = ecNormal
          end
        end
      end
      object gbTiempoTarea: TGroupBox
        Left = 0
        Top = 219
        Width = 743
        Height = 79
        Align = alTop
        Caption = 'Tiempo de tarea'
        TabOrder = 2
        object Label3: TLabel
          Left = 10
          Top = 18
          Width = 139
          Height = 13
          Caption = 'N'#186' de horas/dia en el trabajo:'
        end
        object Label4: TLabel
          Left = 266
          Top = 18
          Width = 162
          Height = 13
          Caption = 'N'#186' de horas/semana en el trabajo:'
        end
        object edHorasDia: TPatternEdit
          Left = 153
          Top = 15
          Width = 94
          Height = 21
          MaxLength = 2
          TabOrder = 0
          Pattern = '1234567890-,'
        end
        object edHorasSemana: TPatternEdit
          Left = 433
          Top = 15
          Width = 94
          Height = 21
          MaxLength = 3
          TabOrder = 1
          Pattern = '1234567890-,'
        end
        object rgTiempoTarea: TRadioGroup
          Left = 2
          Top = 38
          Width = 739
          Height = 39
          Align = alBottom
          Columns = 4
          Items.Strings = (
            ' Esporadico'
            'Continuo:> 2hs y <4hs'
            'Continuo:>4h'
            'N/I')
          TabOrder = 2
        end
      end
      object gbCiclodeTrabajo: TGroupBox
        Left = 0
        Top = 298
        Width = 743
        Height = 52
        Align = alTop
        Caption = 'Ciclo de Trabajo'
        TabOrder = 3
        object rgCiclodeTrabajo: TRadioGroup
          Left = 2
          Top = 15
          Width = 739
          Height = 35
          Align = alClient
          Columns = 4
          Items.Strings = (
            'Largo:<2 minutos'
            'Moderado: 30 seg. - 1 a 2 minutos'
            'Corto: hasta 30 seg.'
            'N/I')
          TabOrder = 0
        end
      end
      object gbManipulacionCargas: TGroupBox
        Left = 0
        Top = 350
        Width = 743
        Height = 54
        Align = alTop
        Caption = 'Manipulacion manual de cargas:'
        TabOrder = 4
        object rgManipulacionCargas: TRadioGroup
          Left = 2
          Top = 15
          Width = 739
          Height = 37
          Align = alClient
          Columns = 4
          Items.Strings = (
            '< de 1 Kg'
            'Entre 1 Kg y 3 Kgs'
            '> de 3 Kgs'
            'N/I')
          TabOrder = 0
        end
      end
      object gbTipoTarea: TGroupBox
        Left = 0
        Top = 404
        Width = 743
        Height = 300
        Align = alTop
        Caption = 'Tipo Tarea'
        TabOrder = 5
        DesignSize = (
          743
          300)
        object lbOtros: TLabel
          Left = 11
          Top = 146
          Width = 28
          Height = 13
          Caption = 'Otros:'
        end
        object lbHerramientas: TLabel
          Left = 11
          Top = 170
          Width = 262
          Height = 13
          Caption = 'Herramientas y elementos que utiliza a diario (describir) :'
        end
        object lbTurnoTrabajo: TLabel
          Left = 11
          Top = 250
          Width = 149
          Height = 13
          Caption = 'Turnos de trabajo: (especificar):'
        end
        object lbPausasTrabajo: TLabel
          Left = 11
          Top = 277
          Width = 147
          Height = 13
          Caption = 'Pausas en el trabajo:(describir):'
        end
        object cgTipoTarea: TCheckGroup
          Left = 2
          Top = 15
          Width = 739
          Height = 122
          Align = alTop
          TabOrder = 0
          Columns = 2
          Items.Strings = (
            'Movimientos de alcance repetidos por encima del hombro'
            'Movimientos de flexi'#243'n o extensi'#243'n forzados de mu'#241'eca'
            'Compresi'#243'n de nervio a trav'#233's de dos vientres musculares'
            'Desviaciones cubitales o radiales forzadas de mu'#241'eca'
            'Otros especificar '
            'El cuello se mantiene flexionado'
            'Giros de columna'
            'Rotaci'#243'n extrema del antebrazo'
            'Flexi'#243'n extrema del codo'
            'Flexi'#243'n mantenida de dedos')
          Value = '0000000000'
        end
        object edOtros: TPatternEdit
          Left = 44
          Top = 142
          Width = 427
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object edHerramientasADiario: TRichEdit
          Left = 12
          Top = 192
          Width = 722
          Height = 48
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object edPausasTrabajo: TPatternEdit
          Left = 165
          Top = 273
          Width = 569
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          TabOrder = 4
        end
        object edTurnosTrabajo: TPatternEdit
          Left = 165
          Top = 247
          Width = 569
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          TabOrder = 3
        end
      end
      object gbArticualaciones: TGroupBox
        Left = 0
        Top = 704
        Width = 743
        Height = 406
        Align = alTop
        Caption = 'Articulaciones: Movilidad - Dolor :'
        TabOrder = 6
        object Label5: TLabel
          Left = 108
          Top = 24
          Width = 51
          Height = 13
          Caption = 'Abducci'#243'n'
        end
        object Label6: TLabel
          Left = 185
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Aducci'#243'n'
        end
        object Label7: TLabel
          Left = 265
          Top = 24
          Width = 33
          Height = 13
          Caption = 'Flexi'#243'n'
        end
        object Label8: TLabel
          Left = 329
          Top = 24
          Width = 46
          Height = 13
          Caption = 'Extensi'#243'n'
        end
        object Label9: TLabel
          Left = 396
          Top = 24
          Width = 55
          Height = 13
          Caption = 'Rot.externa'
        end
        object Label10: TLabel
          Left = 468
          Top = 24
          Width = 52
          Height = 13
          Caption = 'Rot.interna'
        end
        object Label11: TLabel
          Left = 540
          Top = 24
          Width = 49
          Height = 13
          Caption = 'Irradiaci'#243'n'
        end
        object Label12: TLabel
          Left = 611
          Top = 19
          Width = 43
          Height = 26
          Caption = 'Alt.masa '#13#10'muscular'
        end
        object Label13: TLabel
          Left = 24
          Top = 24
          Width = 55
          Height = 13
          Caption = 'Articulaci'#243'n'
        end
        object Label14: TLabel
          Left = 20
          Top = 68
          Width = 37
          Height = 13
          Caption = 'Hombro'
        end
        object Label15: TLabel
          Left = 20
          Top = 116
          Width = 25
          Height = 13
          Caption = 'Codo'
        end
        object Label16: TLabel
          Left = 20
          Top = 163
          Width = 39
          Height = 13
          Caption = 'Mu'#241'eca'
        end
        object Label17: TLabel
          Left = 20
          Top = 204
          Width = 38
          Height = 26
          Caption = 'Mano y '#13#10'Dedos'
        end
        object Label18: TLabel
          Left = 20
          Top = 260
          Width = 34
          Height = 13
          Caption = 'Cadera'
        end
        object Label19: TLabel
          Left = 20
          Top = 308
          Width = 32
          Height = 13
          Caption = 'Rodilla'
        end
        object Label20: TLabel
          Left = 20
          Top = 356
          Width = 31
          Height = 13
          Caption = 'Tobillo'
        end
        object Label21: TLabel
          Left = 76
          Top = 79
          Width = 14
          Height = 13
          Caption = 'Izq'
        end
        object Label22: TLabel
          Left = 74
          Top = 54
          Width = 17
          Height = 13
          Caption = 'Der'
        end
        object Label23: TLabel
          Left = 74
          Top = 102
          Width = 17
          Height = 13
          Caption = 'Der'
        end
        object Label24: TLabel
          Left = 76
          Top = 127
          Width = 14
          Height = 13
          Caption = 'Izq'
        end
        object Label25: TLabel
          Left = 74
          Top = 150
          Width = 17
          Height = 13
          Caption = 'Der'
        end
        object Label26: TLabel
          Left = 76
          Top = 175
          Width = 14
          Height = 13
          Caption = 'Izq'
        end
        object Label27: TLabel
          Left = 74
          Top = 198
          Width = 17
          Height = 13
          Caption = 'Der'
        end
        object Label28: TLabel
          Left = 76
          Top = 223
          Width = 14
          Height = 13
          Caption = 'Izq'
        end
        object Label29: TLabel
          Left = 74
          Top = 246
          Width = 17
          Height = 13
          Caption = 'Der'
        end
        object Label30: TLabel
          Left = 76
          Top = 271
          Width = 14
          Height = 13
          Caption = 'Izq'
        end
        object Label31: TLabel
          Left = 74
          Top = 294
          Width = 17
          Height = 13
          Caption = 'Der'
        end
        object Label32: TLabel
          Left = 76
          Top = 319
          Width = 14
          Height = 13
          Caption = 'Izq'
        end
        object Label33: TLabel
          Left = 74
          Top = 342
          Width = 17
          Height = 13
          Caption = 'Der'
        end
        object Label34: TLabel
          Left = 76
          Top = 367
          Width = 14
          Height = 13
          Caption = 'Izq'
        end
        object Panel24: TPanel
          Left = 96
          Top = 17
          Width = 3
          Height = 368
          Caption = 'Panel1'
          TabOrder = 23
        end
        object Panel26: TPanel
          Left = 64
          Top = 49
          Width = 3
          Height = 338
          Caption = 'Panel1'
          TabOrder = 26
        end
        object cgArticulaciones: TCheckGroup
          Left = 128
          Top = 50
          Width = 569
          Height = 337
          TabOrder = 0
          Columns = 8
          Items.Strings = (
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            '')
          BorderStyle = bsNone
          Value = 
            '0000000000000000000000000000000000000000000000000000000000000000' +
            '000000000000000000000000000000000000000000000000'
        end
        object Panel22: TPanel
          Left = 600
          Top = 17
          Width = 3
          Height = 368
          Caption = 'Panel7'
          TabOrder = 1
        end
        object Panel21: TPanel
          Left = 528
          Top = 17
          Width = 3
          Height = 368
          Caption = 'Panel7'
          TabOrder = 2
        end
        object Panel20: TPanel
          Left = 384
          Top = 17
          Width = 3
          Height = 368
          Caption = 'Panel1'
          TabOrder = 3
        end
        object Panel19: TPanel
          Left = 456
          Top = 17
          Width = 3
          Height = 368
          Caption = 'Panel7'
          TabOrder = 4
        end
        object Panel1: TPanel
          Left = 168
          Top = 17
          Width = 3
          Height = 368
          Caption = 'Panel1'
          TabOrder = 5
        end
        object Panel2: TPanel
          Left = 240
          Top = 17
          Width = 3
          Height = 368
          Caption = 'Panel7'
          TabOrder = 6
        end
        object Panel3: TPanel
          Left = 312
          Top = 17
          Width = 3
          Height = 368
          Caption = 'Panel7'
          TabOrder = 7
        end
        object Panel5: TPanel
          Left = 64
          Top = 72
          Width = 605
          Height = 3
          TabOrder = 8
        end
        object Panel6: TPanel
          Left = 13
          Top = 96
          Width = 657
          Height = 3
          TabOrder = 9
        end
        object Panel7: TPanel
          Left = 64
          Top = 168
          Width = 605
          Height = 3
          TabOrder = 10
        end
        object Panel8: TPanel
          Left = 64
          Top = 120
          Width = 605
          Height = 3
          TabOrder = 11
        end
        object Panel9: TPanel
          Left = 13
          Top = 144
          Width = 657
          Height = 3
          TabOrder = 12
        end
        object Panel10: TPanel
          Left = 13
          Top = 192
          Width = 657
          Height = 3
          TabOrder = 13
        end
        object Panel11: TPanel
          Left = 64
          Top = 216
          Width = 605
          Height = 3
          TabOrder = 14
        end
        object Panel12: TPanel
          Left = 13
          Top = 240
          Width = 657
          Height = 3
          TabOrder = 15
        end
        object Panel13: TPanel
          Left = 64
          Top = 312
          Width = 605
          Height = 3
          TabOrder = 16
        end
        object Panel14: TPanel
          Left = 64
          Top = 264
          Width = 605
          Height = 3
          TabOrder = 17
        end
        object Panel15: TPanel
          Left = 13
          Top = 288
          Width = 657
          Height = 3
          TabOrder = 18
        end
        object Panel17: TPanel
          Left = 13
          Top = 336
          Width = 657
          Height = 3
          TabOrder = 19
        end
        object Panel18: TPanel
          Left = 64
          Top = 360
          Width = 605
          Height = 3
          TabOrder = 20
        end
        object Panel4: TPanel
          Left = 13
          Top = 48
          Width = 657
          Height = 3
          TabOrder = 21
        end
        object Panel23: TPanel
          Left = 668
          Top = 17
          Width = 3
          Height = 368
          Caption = 'Panel7'
          TabOrder = 22
        end
        object Panel16: TPanel
          Left = 13
          Top = 384
          Width = 657
          Height = 3
          TabOrder = 24
        end
        object Panel25: TPanel
          Left = 13
          Top = 16
          Width = 657
          Height = 3
          TabOrder = 25
        end
        object Panel27: TPanel
          Left = 12
          Top = 17
          Width = 3
          Height = 370
          Caption = 'Panel1'
          TabOrder = 27
        end
      end
      object gbFlexionSostenida: TGroupBox
        Left = 0
        Top = 1110
        Width = 743
        Height = 54
        Align = alTop
        TabOrder = 7
        object Label35: TLabel
          Left = 16
          Top = 21
          Width = 145
          Height = 13
          Caption = 'Flexion sostenida de columna: '
        end
        object rgFlexionSostenida: TRadioGroup
          Left = 166
          Top = 7
          Width = 179
          Height = 37
          Columns = 3
          Items.Strings = (
            'Si'
            'No'
            'N/I')
          TabOrder = 0
        end
      end
      object gbObservaciones: TGroupBox
        Left = 0
        Top = 1324
        Width = 743
        Height = 100
        Align = alTop
        Caption = 'Observaciones'
        TabOrder = 9
        DesignSize = (
          743
          100)
        object edObservaciones: TRichEdit
          Left = 10
          Top = 18
          Width = 719
          Height = 69
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 1164
        Width = 743
        Height = 160
        Align = alTop
        TabOrder = 8
        object Label36: TLabel
          Left = 16
          Top = 21
          Width = 87
          Height = 13
          Caption = 'Signos y sintomas:'
        end
        object Label37: TLabel
          Left = 392
          Top = 21
          Width = 25
          Height = 13
          Caption = 'Dolor'
        end
        object Label38: TLabel
          Left = 392
          Top = 85
          Width = 72
          Height = 13
          Caption = 'Curso del Dolor'
        end
        object rgDolor: TRadioGroup
          Left = 390
          Top = 35
          Width = 223
          Height = 46
          Columns = 3
          Items.Strings = (
            'Agudo'
            'Insidioso'
            'N/I')
          TabOrder = 1
        end
        object rgCursoDelDolor: TRadioGroup
          Left = 390
          Top = 99
          Width = 298
          Height = 50
          Columns = 4
          Items.Strings = (
            'Continuo'
            'Brotes'
            'C'#237'clico'
            'N/I')
          TabOrder = 2
        end
        object rgSignosySintomas: TRadioGroup
          Left = 10
          Top = 35
          Width = 359
          Height = 115
          Items.Strings = (
            'Grado 0 : Ausencia de signos y s'#237'ntomas.'
            
              'Grado 1 : Dolor en reposo y/o existencia de sintomatologia suges' +
              'tiva.'
            'Grado 2 : Grado 1 mas contractura y/o dolor a la movilizacion.'
            'Grado 3 : Grado 2 mas dolor a la palpacion y/o percusion.'
            
              'Grado 4 : Grado 3 mas limitacion funcional evidente clinicamente' +
              '.')
          TabOrder = 0
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 150
        Width = 743
        Height = 69
        Align = alTop
        Caption = 'Descripci'#243'n'
        TabOrder = 1
        DesignSize = (
          743
          69)
        object Label1: TLabel
          Left = 12
          Top = 20
          Width = 200
          Height = 13
          Caption = 'Descripcion somera de su trabajo habitual:'
        end
        object Label2: TLabel
          Left = 12
          Top = 44
          Width = 218
          Height = 13
          Caption = 'Antecedentes laborales en la misma actividad:'
        end
        object edDescTrabajoHabitual: TPatternEdit
          Left = 236
          Top = 16
          Width = 493
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object edAntecedentesLaborales: TPatternEdit
          Left = 236
          Top = 44
          Width = 493
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          TabOrder = 1
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT pf_id, pf_fecha, pf_cuil, pf_calle, pf_numero, pf_piso,'
      
        '       pf_departamento, pf_cpostal, pf_cpa, pf_localidad, pf_pro' +
        'v,'
      
        '       pf_idempresa, pf_estableci, pf_rubro, pf_desctrabhabitual' +
        ','
      
        '       pf_antecedentes, pf_nrohorasdia, pf_nrohorassemana, pf_ti' +
        'empotarea,'
      '       pf_ciclotrabajo, pf_manualcargas, pf_tipotarea, pf_otros,'
      
        '       pf_herramientasyelem, PF_TURNOSDETRABAJO, pf_pausatrabajo' +
        ','
      
        '       pf_articulaciones, pf_flexioncolumna, pf_signosysintomas,' +
        ' pf_dolor,'
      
        '       pf_cursodeldolor, pf_observaciones, pf_idprestador, pf_fe' +
        'chaalta,'
      
        '       pf_usualta, pf_fechamodif, pf_usumodif, pf_fechabaja, pf_' +
        'usubaja,'
      
        '       tj_nombre, tj_cuil, ca_descripcion, em_cuit, em_nombre, e' +
        's_nombre,'
      '       pf_puestotrabajo, pf_antiguedad'
      '  FROM hys.hpf_posicionesforzadas,'
      '       ctj_trabajador,'
      '       art.cpr_prestador,'
      '       aem_empresa,'
      '       aes_establecimiento,'
      '       aco_contrato'
      ' WHERE pf_cuil = tj_cuil'
      '   AND pf_idprestador = ca_identificador'
      '   AND pf_idempresa = em_id'
      '   AND es_contrato = co_contrato'
      '   AND em_id = co_idempresa'
      '   AND pf_estableci = es_nroestableci'
      '   AND co_contrato = art.get_vultcontrato (em_cuit)'
      '   AND 1 = 2')
  end
  inherited ShortCutControl: TShortCutControl
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
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
end
