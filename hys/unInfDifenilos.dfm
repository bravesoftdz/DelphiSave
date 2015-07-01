object frmInfDifenilos: TfrmInfDifenilos
  Left = 236
  Top = 160
  Width = 812
  Height = 612
  Caption = 'Informe Difenilos Policlorados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pcInforme: TPageControl
    Left = 0
    Top = 0
    Width = 804
    Height = 544
    ActivePage = tsInforme
    Align = alClient
    TabOrder = 0
    object tsInforme: TTabSheet
      Caption = 'Informe'
      object ScrollBox: TScrollBox
        Left = 0
        Top = 0
        Width = 796
        Height = 516
        Align = alClient
        TabOrder = 0
        object gbInforme: TGroupBox
          Left = 0
          Top = 0
          Width = 776
          Height = 73
          Align = alTop
          Caption = ' Informe '
          TabOrder = 0
          DesignSize = (
            776
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
            Left = 821
            Top = 56
            Width = 3
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
          end
          object Label12: TLabel
            Left = 255
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
            Left = 243
            Top = 8
            Width = 225
            Height = 31
            Caption = ' Tipo de Informe '
            Columns = 3
            Items.Strings = (
              'Original'
              'Copia'
              'Fax')
            TabOrder = 1
            TabStop = True
          end
          object edFechaRecepcion: TDateComboBox
            Left = 371
            Top = 44
            Width = 88
            Height = 21
            TabOrder = 3
          end
        end
        object gbEmpresa: TGroupBox
          Left = 0
          Top = 73
          Width = 776
          Height = 113
          Align = alTop
          Caption = ' Empresa/Establecimiento (1) '
          TabOrder = 1
          DesignSize = (
            776
            113)
          object CUIT: TLabel
            Left = 11
            Top = 21
            Width = 25
            Height = 13
            Caption = 'CUIT'
          end
          object lbCPostalA: TLabel
            Left = 698
            Top = 46
            Width = 30
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'C.P.A.'
          end
          object Label18: TLabel
            Left = 698
            Top = 70
            Width = 21
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'CIIU'
          end
          inline fraEmpresa: TfraEmpresa
            Left = 41
            Top = 14
            Width = 783
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
              Left = 655
              Top = 6
            end
            inherited mskCUIT: TMaskEdit
              Left = 10
              Top = 3
            end
            inherited edContrato: TIntEdit
              Left = 702
              Top = 3
              Width = 80
            end
            inherited cmbRSocial: TArtComboBox
              Left = 161
              Top = 3
              Width = 485
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
            Width = 682
            Height = 47
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            inherited lbLocalidad: TLabel
              Left = 442
            end
            inherited lbEstableci: TLabel
              Left = 3
            end
            inherited lbCPostal: TLabel
              Left = 614
            end
            inherited lbDomicilio: TLabel
              Left = -1
            end
            inherited lbProvincia: TLabel
              Left = 442
            end
            inherited edCodigo: TIntEdit
              Left = 45
            end
            inherited cmbDescripcion: TArtComboBox
              Left = 93
              Width = 345
            end
            inherited edLocalidad: TEdit
              Left = 491
              Width = 120
            end
            inherited edCPostal: TEdit
              Left = 635
            end
            inherited edDomicilio: TEdit
              Left = 45
              Width = 392
            end
            inherited edProvincia: TEdit
              Left = 491
              Width = 189
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
            Left = 752
            Top = 42
            Width = 72
            Height = 21
            TabStop = False
            Anchors = [akTop, akRight]
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 2
          end
          object edCiuu: TEdit
            Left = 752
            Top = 66
            Width = 72
            Height = 21
            TabStop = False
            Anchors = [akTop, akRight]
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 3
          end
          object chbDenunciarEmpresa: TCheckBox
            Left = 672
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
          Width = 776
          Height = 143
          Align = alTop
          Caption = ' Responsable (2)'
          TabOrder = 2
          DesignSize = (
            776
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
            Width = 693
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            inherited edCodigo: TPatternEdit
              Left = 0
            end
            inherited cmbDescripcion: TComboGrid
              Width = 629
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
            Width = 693
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
            end
            inherited cmbDescripcion: TComboGrid
              Top = 0
              Width = 629
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
            Width = 691
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object chbDenunciarResponsable: TCheckBox
            Left = 672
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
          Width = 776
          Height = 101
          Align = alTop
          Caption = ' Datos del Establecimiento (3)'
          TabOrder = 3
          DesignSize = (
            776
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
            Left = 672
            Top = 80
            Width = 148
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'Denunciar datos faltantes'
            TabOrder = 3
          end
        end
        object gbCaratEstab: TGroupBox
          Left = 0
          Top = 540
          Width = 776
          Height = 68
          Align = alTop
          Caption = 'Medidas de Prevenci'#243'n (10)'
          TabOrder = 5
          object Label8: TLabel
            Left = 8
            Top = 24
            Width = 199
            Height = 13
            Caption = 'Medidas de Prev. en Ambientes y Equipos'
          end
          object Label11: TLabel
            Left = 8
            Top = 46
            Width = 148
            Height = 13
            Caption = 'Medidas de Prev. en Dep'#243'sitos'
          end
          object chkSiMedPrevAmbEqui: TCheckBox
            Left = 218
            Top = 24
            Width = 37
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Si'
            TabOrder = 0
            OnClick = chkSiMedPrevAmbEquiClick
          end
          object chkNoMedPrevAmbEqui: TCheckBox
            Left = 262
            Top = 24
            Width = 37
            Height = 17
            Alignment = taLeftJustify
            Caption = 'No'
            TabOrder = 1
            OnClick = chkNoMedPrevAmbEquiClick
          end
          object chkNoMedPrevDeposito: TCheckBox
            Left = 262
            Top = 46
            Width = 37
            Height = 17
            Alignment = taLeftJustify
            Caption = 'No'
            TabOrder = 3
            OnClick = chkNoMedPrevDepositoClick
          end
          object chkSiMedPrevDeposito: TCheckBox
            Left = 218
            Top = 46
            Width = 37
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Si'
            TabOrder = 2
            OnClick = chkSiMedPrevDepositoClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 430
          Width = 776
          Height = 110
          Align = alTop
          Caption = 'Caracter'#237'sticas del Establecimiento (7)'
          TabOrder = 4
          DesignSize = (
            776
            110)
          object edCaracteristicas: TMemo
            Left = 10
            Top = 22
            Width = 809
            Height = 78
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
    object tsProfesionales: TTabSheet
      Caption = 'Profesionales'
      ImageIndex = 1
    end
    object tsSustanciasSector: TTabSheet
      Caption = 'Sustancias por Sector'
      ImageIndex = 3
    end
    object tsTraslados: TTabSheet
      Caption = 'Traslados'
      ImageIndex = 4
    end
    object tsTrabajadores: TTabSheet
      Caption = 'Trabajadores'
      ImageIndex = 2
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 544
    Width = 804
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      804
      41)
    object btnAplicar: TButton
      Left = 566
      Top = 8
      Width = 73
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'A&plicar'
      TabOrder = 0
      OnClick = btnAplicarClick
    end
    object btnAceptar: TButton
      Left = 643
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 721
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object sdqDifenilos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hin_informe, afi.aes_establecimiento'
      'WHERE IN_TIPOINFORME = '#39'D'#39
      '      AND in_idestableci = es_id  '
      '      AND IN_ID = :IDINFORME')
    Left = 24
    Top = 228
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDINFORME'
        ParamType = ptInput
      end>
  end
end
