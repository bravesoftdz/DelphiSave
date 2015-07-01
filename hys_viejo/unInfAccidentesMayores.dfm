object frmInfAccidentesMayores: TfrmInfAccidentesMayores
  Left = 236
  Top = 160
  Width = 702
  Height = 532
  Caption = 'Informe Accidentes Industriales Mayores'
  Color = clBtnFace
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
  object pcInforme: TPageControl
    Left = 0
    Top = 0
    Width = 694
    Height = 464
    ActivePage = tsInforme
    Align = alClient
    TabOrder = 0
    object tsInforme: TTabSheet
      Caption = 'Informe'
      object ScrollBox: TScrollBox
        Left = 0
        Top = 0
        Width = 686
        Height = 436
        Align = alClient
        TabOrder = 0
        object gbInforme: TGroupBox
          Left = 0
          Top = 0
          Width = 682
          Height = 73
          Align = alTop
          Caption = ' Informe '
          TabOrder = 0
          DesignSize = (
            682
            73)
          object Label9: TLabel
            Left = 6
            Top = 20
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
          end
          object Label10: TLabel
            Left = 7
            Top = 48
            Width = 30
            Height = 13
            Caption = 'Fecha'
          end
          object lbInfExportado: TLabel
            Left = 673
            Top = 56
            Width = 3
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
          end
          object Label12: TLabel
            Left = 248
            Top = 48
            Width = 85
            Height = 13
            Caption = 'Fecha Recepci'#243'n'
          end
          object edNroInforme: TEdit
            Left = 133
            Top = 15
            Width = 87
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 0
          end
          object edFechaInforme: TDateComboBox
            Left = 133
            Top = 45
            Width = 88
            Height = 21
            TabOrder = 2
          end
          object rgTipoInforme: TRadioGroup
            Left = 247
            Top = 8
            Width = 232
            Height = 31
            Caption = ' Tipo de Informe '
            Columns = 3
            Items.Strings = (
              'Original'
              'Copia'
              'Fax')
            TabOrder = 1
          end
          object edFechaRecepcion: TDateComboBox
            Left = 364
            Top = 44
            Width = 88
            Height = 21
            TabOrder = 3
          end
        end
        object gbEmpresa: TGroupBox
          Left = 0
          Top = 73
          Width = 682
          Height = 113
          Align = alTop
          Caption = ' Empresa/Establecimiento (1) '
          TabOrder = 1
          DesignSize = (
            682
            113)
          object CUIT: TLabel
            Left = 11
            Top = 21
            Width = 25
            Height = 13
            Caption = 'CUIT'
          end
          object lbCPostalA: TLabel
            Left = 550
            Top = 46
            Width = 30
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'C.P.A.'
          end
          object Label18: TLabel
            Left = 550
            Top = 70
            Width = 21
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'CIIU'
          end
          inline fraEmpresa: TfraEmpresa
            Left = 41
            Top = 14
            Width = 635
            Height = 26
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
            inherited lbRSocial: TLabel
              Left = 97
              Top = 6
              Width = 60
              Caption = 'Raz'#243'n Social'
            end
            inherited lbContrato: TLabel
              Left = 507
              Top = 6
            end
            inherited mskCUIT: TMaskEdit
              Left = 10
              Top = 3
            end
            inherited edContrato: TIntEdit
              Left = 554
              Top = 3
              Width = 80
            end
            inherited cmbRSocial: TArtComboBox
              Left = 161
              Top = 3
              Width = 337
              DataSource = nil
            end
            inherited sdqDatos: TSDQuery
              Left = 568
              Top = 21
            end
            inherited dsDatos: TDataSource
              Left = 596
              Top = 18
            end
            inherited TimerConfidencial: TTimer
              Left = 683
              Top = 9
            end
          end
          inline fraEstablecimiento: TfraEstablecimientoDomic
            Left = 6
            Top = 42
            Width = 534
            Height = 47
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            inherited lbLocalidad: TLabel
              Left = 294
            end
            inherited lbEstableci: TLabel
              Left = 3
            end
            inherited lbCPostal: TLabel
              Left = 466
            end
            inherited lbDomicilio: TLabel
              Left = -1
            end
            inherited lbProvincia: TLabel
              Left = 294
            end
            inherited edCodigo: TIntEdit
              Left = 45
            end
            inherited cmbDescripcion: TArtComboBox
              Left = 93
              Width = 197
            end
            inherited edLocalidad: TEdit
              Left = 343
              Width = 120
              TabStop = True
            end
            inherited edCPostal: TEdit
              Left = 487
              TabStop = True
            end
            inherited edDomicilio: TEdit
              Left = 45
              Width = 244
              TabStop = True
            end
            inherited edProvincia: TEdit
              Left = 343
              Width = 189
              TabStop = True
            end
            inherited sdqDatos: TSDQuery
              Left = 111
              Top = 30
            end
            inherited dsDatos: TDataSource
              Left = 154
              Top = 30
            end
          end
          object edCPA: TEdit
            Left = 604
            Top = 42
            Width = 72
            Height = 21
            Anchors = [akTop, akRight]
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 2
          end
          object edCiuu: TEdit
            Left = 604
            Top = 66
            Width = 72
            Height = 21
            Anchors = [akTop, akRight]
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 3
          end
          object chbDenunciarEmpresa: TCheckBox
            Left = 524
            Top = 91
            Width = 148
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'Denunciar datos faltantes'
            TabOrder = 4
          end
        end
        object gbResponsable: TGroupBox
          Left = 0
          Top = 186
          Width = 682
          Height = 143
          Align = alTop
          Caption = ' Responsable (2)'
          TabOrder = 2
          DesignSize = (
            682
            143)
          object Label1: TLabel
            Left = 6
            Top = 21
            Width = 60
            Height = 13
            Caption = 'CUIT / CUIL'
          end
          object Label5: TLabel
            Left = 6
            Top = 48
            Width = 85
            Height = 13
            Caption = 'Apellido y Nombre'
          end
          object Label6: TLabel
            Left = 6
            Top = 75
            Width = 94
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object Label7: TLabel
            Left = 6
            Top = 102
            Width = 75
            Height = 13
            Caption = 'Representaci'#243'n'
          end
          object edCuitResponsable: TMaskEdit
            Left = 132
            Top = 18
            Width = 81
            Height = 21
            EditMask = '99-########-c;0; '
            MaxLength = 13
            TabOrder = 0
          end
          inline fraTipoDocumento: TfraStaticCTB_TABLAS
            Left = 132
            Top = 69
            Width = 545
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            inherited edCodigo: TPatternEdit
              Left = 0
            end
            inherited cmbDescripcion: TComboGrid
              Width = 481
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
          inline fraRepresentacion: TfraStaticCTB_TABLAS
            Left = 132
            Top = 96
            Width = 545
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
            end
            inherited cmbDescripcion: TComboGrid
              Top = 0
              Width = 481
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
          object edApellidoNombre: TEdit
            Left = 132
            Top = 45
            Width = 543
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object chbDenunciarResponsable: TCheckBox
            Left = 524
            Top = 123
            Width = 148
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'Denunciar datos faltantes'
            TabOrder = 4
          end
        end
        object gbDatosEstab: TGroupBox
          Left = 0
          Top = 329
          Width = 682
          Height = 101
          Align = alTop
          Caption = ' Datos del Establecimiento (3)'
          TabOrder = 3
          DesignSize = (
            682
            101)
          object Label2: TLabel
            Left = 6
            Top = 18
            Width = 62
            Height = 13
            Caption = 'Administativo'
          end
          object Label3: TLabel
            Left = 6
            Top = 45
            Width = 54
            Height = 13
            Caption = 'Producci'#243'n'
          end
          object Label4: TLabel
            Left = 7
            Top = 80
            Width = 24
            Height = 13
            Caption = 'Total'
          end
          object Bevel3: TBevel
            Left = 122
            Top = 69
            Width = 115
            Height = 3
            Shape = bsTopLine
          end
          object edAdministrativo: TIntEdit
            Left = 133
            Top = 15
            Width = 90
            Height = 21
            TabOrder = 0
            Alignment = taRightJustify
          end
          object edProduccion: TIntEdit
            Left = 133
            Top = 42
            Width = 90
            Height = 21
            TabOrder = 1
            Alignment = taRightJustify
          end
          object edtotal: TIntEdit
            Left = 133
            Top = 75
            Width = 90
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 2
            Alignment = taRightJustify
          end
          object chbDenunciarPersonal: TCheckBox
            Left = 524
            Top = 80
            Width = 148
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'Denunciar datos faltantes'
            TabOrder = 3
          end
        end
      end
    end
    object tsProfesionales: TTabSheet
      Caption = 'Profesionales'
      ImageIndex = 1
    end
    object tsEvalEstab: TTabSheet
      Caption = 'Evaluaci'#243'n del Establecimiento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 5
      ParentFont = False
      object lstEvalEstab: TJvgAskListBox
        Left = 0
        Top = 17
        Width = 686
        Height = 419
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 0
        OnKeyDown = lstEvalEstabKeyDown
        OnKeyUp = lstEvalEstabKeyUp
        GlyphsAlign.Vertical = fvaCenter
        ItemStyle.BtnColor = clBtnFace
        ItemStyle.BtnFont.Charset = DEFAULT_CHARSET
        ItemStyle.BtnFont.Color = clWindowText
        ItemStyle.BtnFont.Height = -11
        ItemStyle.BtnFont.Name = 'MS Sans Serif'
        ItemStyle.BtnFont.Style = []
        ItemStyle.BtnTextStyle = fstPushed
        ItemStyle.Color = clBtnFace
        ItemStyle.DelineateColor = clBlack
        ItemStyle.Font.Charset = DEFAULT_CHARSET
        ItemStyle.Font.Color = clWindowText
        ItemStyle.Font.Height = -11
        ItemStyle.Font.Name = 'MS Sans Serif'
        ItemStyle.Font.Style = []
        ItemStyle.Bevel.Inner = bvSpace
        ItemStyle.Bevel.Outer = bvNone
        ItemStyle.Bevel.Sides = [fsdTop]
        ItemStyle.Bevel.Bold = False
        ItemStyle.TextStyle = fstNone
        ItemSelStyle.BtnColor = clBtnFace
        ItemSelStyle.BtnFont.Charset = DEFAULT_CHARSET
        ItemSelStyle.BtnFont.Color = clWindowText
        ItemSelStyle.BtnFont.Height = -11
        ItemSelStyle.BtnFont.Name = 'MS Sans Serif'
        ItemSelStyle.BtnFont.Style = []
        ItemSelStyle.BtnTextStyle = fstNone
        ItemSelStyle.Color = clWindow
        ItemSelStyle.DelineateColor = clBlack
        ItemSelStyle.Font.Charset = DEFAULT_CHARSET
        ItemSelStyle.Font.Color = clBlack
        ItemSelStyle.Font.Height = -11
        ItemSelStyle.Font.Name = 'MS Sans Serif'
        ItemSelStyle.Font.Style = []
        ItemSelStyle.Bevel.Inner = bvLowered
        ItemSelStyle.Bevel.Outer = bvNone
        ItemSelStyle.Bevel.Bold = False
        ItemSelStyle.TextStyle = fstNone
        TextAlign.Vertical = fvaCenter
        TransparentColor = clOlive
        Buttons.Strings = (
          'No'
          'Si')
        Options = []
      end
      object HeaderControl1: THeaderControl
        Left = 0
        Top = 0
        Width = 686
        Height = 17
        Sections = <
          item
            AllowClick = False
            ImageIndex = -1
            MaxWidth = 70
            MinWidth = 70
            Text = 'C'#243'digo'
            Width = 70
          end
          item
            AutoSize = True
            ImageIndex = -1
            Text = 'Descripci'#243'n'
            Width = 616
          end>
      end
    end
    object tsDatosComplementarios: TTabSheet
      Caption = 'Datos Complementarios'
      ImageIndex = 6
      object Label8: TLabel
        Left = 6
        Top = 4
        Width = 198
        Height = 13
        Caption = 'Descripci'#243'n del M'#233'todo de Evaluaci'#243'n (7)'
      end
      object Label11: TLabel
        Left = 6
        Top = 150
        Width = 54
        Height = 13
        Caption = 'Grado Impl.'
      end
      object Label16: TLabel
        Left = 6
        Top = 176
        Width = 64
        Height = 13
        Caption = 'Per'#237'odo Rev.'
      end
      object Label17: TLabel
        Left = 6
        Top = 201
        Width = 56
        Height = 13
        Caption = 'Fecha Rev.'
      end
      object Label38: TLabel
        Left = 6
        Top = 228
        Width = 177
        Height = 13
        Caption = 'Descripci'#243'n del Plan de Capacitaci'#243'n'
      end
      object edDescMetEval: TMemo
        Left = 10
        Top = 22
        Width = 667
        Height = 119
        MaxLength = 4000
        TabOrder = 0
      end
      object edGradoImplementacion: TIntEdit
        Left = 74
        Top = 146
        Width = 57
        Height = 21
        TabOrder = 1
      end
      object cbPeriodoRev: TExComboBox
        Left = 74
        Top = 172
        Width = 144
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 2
        Items.Strings = (
          '1=Semestral'
          '2=Anual'
          '3=Bianual')
        ItemIndex = -1
        Options = []
        ValueWidth = 64
      end
      object edFechaRev: TDateComboBox
        Left = 74
        Top = 199
        Width = 88
        Height = 21
        TabOrder = 3
      end
      object edDescPlanCapacitacion: TMemo
        Left = 10
        Top = 246
        Width = 667
        Height = 119
        MaxLength = 4000
        TabOrder = 4
      end
    end
    object tsCapacitacionResponsable: TTabSheet
      Caption = 'Capacitaci'#243'n de Responsables'
      ImageIndex = 4
    end
    object tsSustanciasSector: TTabSheet
      Caption = 'Sustancias por Sector'
      ImageIndex = 3
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 464
    Width = 694
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      694
      41)
    object btnAplicar: TButton
      Left = 456
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'A&plicar'
      TabOrder = 0
      OnClick = btnAplicarClick
    end
    object btnAceptar: TButton
      Left = 535
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 613
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
  object sdqAccMayores: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hin_informe, afi.aes_establecimiento'
      'WHERE IN_TIPOINFORME = '#39'A'#39
      '      AND in_idestableci = es_id  '
      '      AND IN_ID = :IDINFORME')
    Left = 256
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDINFORME'
        ParamType = ptInput
      end>
  end
  object sdqEvalEstab: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   ie_id, ie_codigo, ie_descripcion, he_id, he_respuesta'
      '    FROM hys.hee_evaluacionestab, hys.hie_itemsaevaluar'
      '   WHERE he_iditemevaluado(+) = ie_id'
      '     AND ie_fechabaja IS NULL'
      '     AND he_fechabaja(+) IS NULL'
      '     AND ie_informe = '#39'A'#39
      '     AND he_idinforme(+) = :idinforme'
      'ORDER BY to_number(ie_codigo)')
    Left = 320
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDINFORME'
        ParamType = ptInput
      end>
  end
end
