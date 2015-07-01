inherited frmCasosMortales: TfrmCasosMortales
  Left = 634
  Top = 258
  Caption = 'Casos Mortales'
  ClientHeight = 496
  ClientWidth = 696
  ExplicitLeft = 634
  ExplicitTop = 258
  ExplicitWidth = 704
  ExplicitHeight = 526
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 696
    Height = 123
    Visible = True
    ExplicitWidth = 696
    ExplicitHeight = 123
    object GroupBox1: TGroupBox
      Left = 2
      Top = 1
      Width = 200
      Height = 40
      Caption = ' Fecha de caso'
      TabOrder = 0
      object Label1: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcDesdeCaso: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaCaso
        TabOrder = 0
      end
      object dcHastaCaso: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeCaso
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 41
      Width = 200
      Height = 40
      Caption = ' Fecha de accidente'
      TabOrder = 1
      object Label2: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcDesdeAccidente: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaAccidente
        TabOrder = 0
      end
      object dcHastaAccidente: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeAccidente
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 204
      Top = 41
      Width = 491
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 2
      DesignSize = (
        491
        40)
      object Label3: TLabel
        Left = 8
        Top = 19
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 39
        Top = 14
        Width = 446
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
        TabOrder = 0
        ExplicitLeft = 39
        ExplicitTop = 14
        ExplicitWidth = 446
        ExplicitHeight = 21
        inherited lbContrato: TLabel
          Left = 342
          ExplicitLeft = 829
        end
        inherited edContrato: TIntEdit
          Left = 389
          ExplicitLeft = 389
        end
        inherited cmbRSocial: TArtComboBox
          Width = 207
          ExplicitWidth = 207
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 204
      Top = 1
      Width = 491
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Trabajador'
      TabOrder = 3
      DesignSize = (
        491
        40)
      inline fraTrabajadorSiniestro: TfraTrabajadorSiniestro
        Left = 5
        Top = 14
        Width = 481
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 14
        ExplicitWidth = 481
        inherited lbSiniestro: TLabel
          Left = 315
          ExplicitLeft = 469
        end
        inherited cmbNombre: TArtComboBox
          Width = 228
          ExplicitWidth = 228
        end
        inherited edSiniestro: TSinEdit
          Left = 380
          ExplicitLeft = 380
        end
        inherited ToolBar: TToolBar
          Left = 357
          ExplicitLeft = 357
        end
        inherited ImageList: TImageList
          Bitmap = {
            494C010101007800800010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
            0000000000000000000000000000636363006363630000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000063636300E7E7E700A5A5A50063636300000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000063636300E7E7E700A5A5A500E7E7E700A5A5A500636363000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000848400A5A5A500E7E7E700CECECE00D6D6D600B5B5B5006363
            6300000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000063636300B5B5B500E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7
            E700636363000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008484
            840063636300E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5
            A500C6C6C6006363630000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008484
            840063636300CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5A500C6C6
            C600C6C6C600B5B5B50063636300000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008484
            84008484840063636300B5B5B500A5A5A500E7E7E700A5A5A500C6C6C600C6C6
            C600B5B5B5000063630021212100000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A5A5
            A500A5A5A5008484840063636300E7E7E700B5B5B500C6C6C600C6C6C600A5A5
            A500636363003939390000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A5A5
            A500B5B5B500B5B5B5008484840063636300B5B5B500319C9C00636363006363
            6300000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000094949400C6C6
            C600B5B5B500B5B5B50084848400848484006363630063636300000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000094949400B5B5B5008484
            8400949494000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000094949400A5A5A500848484009494
            9400000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000008484840084848400949494000000
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
    object GroupBox5: TGroupBox
      Left = 114
      Top = 81
      Width = 581
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Sector'
      TabOrder = 4
      DesignSize = (
        581
        40)
      inline fraSector: TfraCodigoDescripcion
        Left = 4
        Top = 14
        Width = 573
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 14
        ExplicitWidth = 573
        inherited cmbDescripcion: TArtComboBox
          Width = 508
          ExplicitWidth = 508
        end
      end
    end
    object rgActivos: TRadioGroup
      Left = 2
      Top = 81
      Width = 110
      Height = 40
      Caption = 'Activos'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 5
    end
  end
  inherited CoolBar: TCoolBar
    Top = 123
    Width = 696
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 690
      end>
    ExplicitTop = 123
    ExplicitWidth = 696
    inherited ToolBar: TToolBar
      Width = 681
      ExplicitWidth = 681
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = mnuImprimir
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        ExplicitLeft = 362
      end
      object tbRealizarAccion: TToolButton
        Left = 385
        Top = 0
        Hint = 'Realizar acci'#243'n'
        Caption = 'Realizar acci'#243'n'
        ImageIndex = 18
        OnClick = tbRealizarAccionClick
      end
      object tbHistoricoAcciones: TToolButton
        Left = 408
        Top = 0
        Hint = 'Hist'#243'rico Acciones'
        Caption = 'tbHistoricoAcciones'
        ImageIndex = 9
        OnClick = tbHistoricoAccionesClick
      end
      object tbVerDigitalizaciones: TToolButton
        Left = 431
        Top = 0
        Hint = 'Ver digitalizaciones'
        Caption = 'Ver digitalizaciones'
        ImageIndex = 55
        OnClick = tbVerDigitalizacionesClick
      end
      object tbPDF: TToolButton
        Left = 454
        Top = 0
        Hint = 'Archivo PDF'
        DropdownMenu = pmPDF
        ImageIndex = 41
        Style = tbsDropDown
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 152
    Width = 696
    Height = 344
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OnDblClick = nil
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCASO'
        Title.Caption = 'ID Caso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMTRAB'
        Title.Caption = 'Domicilio'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTORACTUAL'
        Title.Caption = 'Sector'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPODECASO'
        Title.Caption = 'Tipo de caso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOALTA'
        Title.Caption = 'Tipo alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRECSINIESTRO'
        Title.Caption = 'F. Recep. Sin.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELPARTICULAR'
        Title.Caption = 'Tel part.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CELULAR'
        Title.Caption = 'Celular'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCIONINVEST'
        Title.Caption = 'Acci'#243'n Investigaciones'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVINVEST'
        Title.Caption = 'Obs. Investigaciones'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCIONLEGALES'
        Title.Caption = 'Acci'#243'n Legales'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVLEGALES'
        Title.Caption = 'Obs. Legales'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCIONMEDICA'
        Title.Caption = 'Acci'#243'n A. M'#233'dica'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVMEDICA'
        Title.Caption = 'Obs. A. M'#233'dica'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCIONGERENCIA'
        Title.Caption = 'Acci'#243'n Gerencia PyS'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVGERENCIA'
        Title.Caption = 'Obs. Gerencia PyS'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FSUSPENSION'
        Title.Caption = 'F. suspensi'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FACUSE'
        Title.Caption = 'F. Acuse'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FINFORME'
        Title.Caption = 'F. informe'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FSOCIOAMBIENTAL'
        Title.Caption = 'F. socioambiental'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FSOLICITUDDOCUM'
        Title.Caption = 'F. sol. docum.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FSOLICINVESTIG'
        Title.Caption = 'F. sol. invest.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_FECHABAJA'
        Visible = False
      end>
  end
  object fpInvestigacion: TFormPanel [3]
    Left = 182
    Top = 223
    Width = 489
    Height = 273
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      489
      273)
    object Bevel2: TBevel
      Left = 4
      Top = 237
      Width = 481
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 41
      ExplicitWidth = 497
    end
    object Label6: TLabel
      Left = 18
      Top = 12
      Width = 68
      Height = 13
      Caption = 'Breve Rese'#241'a'
    end
    object Label8: TLabel
      Left = 18
      Top = 85
      Width = 52
      Height = 13
      Caption = 'Conclusi'#243'n'
    end
    object Label9: TLabel
      Left = 18
      Top = 158
      Width = 156
      Height = 13
      Caption = 'Sugerencia estudio investigaci'#243'n'
    end
    object btnAceptarInvest: TButton
      Left = 331
      Top = 243
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarInvestClick
    end
    object Button2: TButton
      Left = 409
      Top = 243
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object mResena: TMemo
      Left = 18
      Top = 28
      Width = 455
      Height = 48
      Lines.Strings = (
        '')
      TabOrder = 2
    end
    object mConclusion: TMemo
      Left = 18
      Top = 101
      Width = 455
      Height = 48
      Lines.Strings = (
        '')
      TabOrder = 3
    end
    object mSugerencia: TMemo
      Left = 18
      Top = 174
      Width = 455
      Height = 48
      Lines.Strings = (
        '')
      TabOrder = 4
    end
  end
  object fpObservaciones: TFormPanel [4]
    Left = 118
    Top = 328
    Width = 489
    Height = 125
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      489
      125)
    object Bevel3: TBevel
      Left = 4
      Top = 89
      Width = 481
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 41
      ExplicitWidth = 497
    end
    object Label10: TLabel
      Left = 18
      Top = 12
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object btnAceptarObs: TButton
      Left = 331
      Top = 95
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarObsClick
    end
    object Button4: TButton
      Left = 409
      Top = 95
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object mObservaciones: TMemo
      Left = 18
      Top = 28
      Width = 455
      Height = 48
      Lines.Strings = (
        '')
      TabOrder = 2
    end
  end
  inherited fpAbm: TFormPanel
    Left = 152
    Top = 212
    Width = 505
    Height = 114
    ExplicitLeft = 152
    ExplicitTop = 212
    ExplicitWidth = 505
    ExplicitHeight = 114
    DesignSize = (
      505
      114)
    inherited BevelAbm: TBevel
      Top = 78
      Width = 497
      ExplicitTop = 41
      ExplicitWidth = 497
    end
    object Label4: TLabel [1]
      Left = 13
      Top = 19
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label5: TLabel [2]
      Left = 183
      Top = 19
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    inherited btnAceptar: TButton
      Left = 347
      Top = 84
      ExplicitLeft = 347
      ExplicitTop = 47
    end
    inherited btnCancelar: TButton
      Left = 425
      Top = 84
      ExplicitLeft = 425
      ExplicitTop = 47
    end
    object SinEditABM: TSinEdit
      Left = 61
      Top = 15
      Width = 100
      Height = 21
      OnExit = SinEditABMExit
      TabOrder = 2
    end
    object edTrabajadorABM: TEdit
      Left = 241
      Top = 15
      Width = 256
      Height = 21
      Color = clMenuBar
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object rgTipoCaso: TRadioGroup
      Left = 11
      Top = 44
      Width = 486
      Height = 33
      Caption = 'Tipo de caso'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Inmediato'
        'Posterior')
      TabOrder = 4
    end
  end
  object fpHistoricoAcciones: TFormPanel [6]
    Left = 59
    Top = 240
    Width = 637
    Height = 220
    Caption = 'Hist'#243'rico Acciones'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      637
      220)
    object Bevel4: TBevel
      Left = 4
      Top = 184
      Width = 629
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 123
      ExplicitWidth = 497
    end
    object Button1: TButton
      Left = 557
      Top = 190
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 0
    end
    object GridHistoricoAcciones: TArtDBGrid
      Left = 6
      Top = 8
      Width = 626
      Height = 169
      DataSource = dsCasosRelacionados
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SECTOR'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACCION'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBSERVACION'
          Width = 200
          Visible = True
        end>
    end
  end
  object fpRealizarAccion: TFormPanel [7]
    Left = 110
    Top = 305
    Width = 439
    Height = 77
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnShow = fpRealizarAccionShow
    DesignSize = (
      439
      77)
    object Bevel1: TBevel
      Left = 4
      Top = 41
      Width = 431
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitWidth = 497
    end
    object Label7: TLabel
      Left = 14
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Acci'#243'n'
    end
    object btnAceptarAccion: TButton
      Left = 281
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarAccionClick
    end
    object btnCancelarAccion: TButton
      Left = 359
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraAcciones: TfraCodigoDescripcion
      Left = 57
      Top = 12
      Width = 372
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 57
      ExplicitTop = 12
      ExplicitWidth = 372
      inherited cmbDescripcion: TArtComboBox
        Width = 307
        ExplicitWidth = 307
      end
    end
  end
  object fpAsociarArchivo: TFormPanel [8]
    Left = 63
    Top = 388
    Width = 420
    Height = 74
    Caption = 'Asociar Archivo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnShow = fpAsociarArchivoShow
    DesignSize = (
      420
      74)
    object Bevel5: TBevel
      Left = 4
      Top = 41
      Width = 414
      Height = 2
      Anchors = []
    end
    object Label12: TLabel
      Left = 5
      Top = 16
      Width = 36
      Height = 13
      Caption = 'Archivo'
    end
    object tbSeleccionArchivoAsociar: TSpeedButton
      Left = 393
      Top = 12
      Width = 23
      Height = 23
      Hint = 'Asociar Archivo...'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = tbSeleccionArchivoAsociarClick
    end
    object btnAbrirArchivo: TSpeedButton
      Left = 5
      Top = 45
      Width = 88
      Height = 22
      Caption = 'Abrir Archivo'
      Glyph.Data = {
        A6020000424DA6020000000000003600000028000000100000000D0000000100
        18000000000070020000C40E0000C40E0000000000000000000000FF0000FF00
        00FF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000FF0000FF0000909000909000909000909000909000
        909000909000909000909000909000909000909000000000000000FF0000FF00
        009090F0F0F090CFFF90FFFF90CFFF90FFFF90CFFF90CFFF90CFFF90CFFF60CF
        CF00909000000000000000FF00009090F0F0F090FFFF90FFFF90CFFF90FFFF90
        CFFF90FFFF90CFFF90CFFF90CFFF60CFCF00000000909000000000FF00009090
        F0F0F090FFFF90FFFF90FFFF90FFFF90FFFF90CFFF90FFFF90CFFF90CFFF0090
        90000000009090000000009090F0F0F090FFFF90FFFF90FFFF90FFFF90CFFF90
        FFFF90FFFF90CFFF90FFFF60CFCF00000060CFCF60CFCF000000009090F0F0F0
        90FFFF90FFFF90FFFF90FFFF90FFFF90FFFF90CFFF90FFFF90CFFF60CFCF0000
        0060CFCF60CFCF00000000909000909000909000909000909000909000909000
        909000909000909000909000909060CFCF90FFFF60CFCF00000000FF00009090
        F0F0F090FFFF90FFFF90FFFF90FFFF90FFFF90FFFF90FFFF90FFFF90FFFF90FF
        FF90FFFF60CFCF00000000FF00009090F0F0F090FFFF90FFFF90FFFF90FFFF90
        FFFF90FFFF90FFFFF0F0F0F0F0F0F0F0F0F0F0F060CFCF00000000FF00009090
        F0F0F090FFFF90FFFF90FFFF90FFFF90FFFFF0F0F00090900090900090900090
        9000909000909000FF0000FF0000FF00009090F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F000909000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000909000909000909000909000909000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00}
      OnClick = btnAbrirArchivoClick
    end
    object btnAceptar_AsocArchivo: TBitBtn
      Left = 260
      Top = 45
      Width = 75
      Height = 24
      Anchors = []
      Caption = '&Aceptar'
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnAceptar_AsocArchivoClick
    end
    object btnCerrar_AsocArchivo: TBitBtn
      Left = 341
      Top = 45
      Width = 75
      Height = 24
      Anchors = []
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 2
    end
    object edArchivoAsociado: TEdit
      Left = 47
      Top = 13
      Width = 344
      Height = 21
      Color = 15262169
      ReadOnly = True
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT cm_id idcaso,'
      
        '       art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_rec' +
        'aida) siniestro, '
      
        '       art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre trabajador' +
        ', '
      
        '       art.utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, ' +
        'tj_departamento, tj_localidad, tj_edificio) domtrab,'
      '       art.utiles.armar_cuit(em_cuit) cuit, em_nombre empresa,'
      
        '       sm_descripcion sectoractual, DECODE(cm_tipocaso, '#39'I'#39', '#39'In' +
        'mediato'#39', '#39'P'#39', '#39'Posterior'#39') tipodecaso,'
      
        '       DECODE(cm_tipoalta, '#39'A'#39', '#39'Autom'#225'tica'#39', '#39'M'#39', '#39'Manual'#39') tip' +
        'oalta, ex_fecharecepcion frecsiniestro,'
      
        '       art.trabajador.get_telefono(tj_id, 2) telparticular, art.' +
        'trabajador.get_telefono(tj_id, 3) celular,'
      
        '       art.dinerarias.get_accionrealizada(cm_id, 1) accioninvest' +
        ', '
      
        '       art.dinerarias.get_accionrealizada(cm_id, 1, '#39'S'#39') observi' +
        'nvest, '
      
        '       art.dinerarias.get_accionrealizada(cm_id, 2) accionlegale' +
        's,'
      
        '       art.dinerarias.get_accionrealizada(cm_id, 2, '#39'S'#39') observl' +
        'egales, '
      
        '       art.dinerarias.get_accionrealizada(cm_id, 3) accionmedica' +
        ', '
      
        '       art.dinerarias.get_accionrealizada(cm_id, 3, '#39'S'#39') observm' +
        'edica, '
      
        '       art.dinerarias.get_accionrealizada(cm_id, 4) acciongerenc' +
        'ia,'
      
        '       art.dinerarias.get_accionrealizada(cm_id, 4, '#39'S'#39') observg' +
        'erencia, '
      
        '       art.siniestro.get_datoscarta(ex_id, DECODE(art.siniestro.' +
        'is_siniestrogobernacion(ex_id, '#39'S'#39'), '#39'S'#39', '#39'SP01G'#39', '#39'SP01'#39'), '#39'I'#39')' +
        ' fsuspension, '
      
        '       art.siniestro.get_datoscarta(ex_id, DECODE(art.siniestro.' +
        'is_siniestrogobernacion(ex_id, '#39'S'#39'), '#39'S'#39', '#39'SP01G'#39', '#39'SP01'#39'), '#39'R'#39')' +
        ' facuse,'
      
        '       art.siniestro.get_datosparteevolutivo(ex_id, '#39'I'#39', '#39'A'#39') fi' +
        'nforme,'
      
        '       art.siniestro.get_datosparteevolutivo(ex_id, '#39'S'#39', '#39'A'#39') fs' +
        'ocioambiental,       '
      
        '       art.siniestro.get_datoscarta(ex_id, '#39'GM01'#39', '#39'I'#39') fsolicit' +
        'uddocum,       '
      
        '       art.siniestro.get_datosinvestigacion(ex_id, '#39'F'#39') fsolicin' +
        'vestig,'
      
        '       art.siniestro.get_datosinvestigacion(ex_id, '#39'I'#39') investig' +
        'ador,'
      
        '       cm_fechabaja, sm_codigo, cm_idsector, ex_siniestro, ex_or' +
        'den, cm_rutaarchivoasociado, '
      '       cm_rutaarchivosocioamb'
      
        '  FROM din.dcm_casosmortales, din.dsm_sectoresmortales, art.sex_' +
        'expedientes, '
      '       ctj_trabajador, aem_empresa'
      ' WHERE cm_idexpediente = ex_id'
      '   AND ex_idtrabajador = tj_id'
      '   AND ex_cuit = em_cuit'
      '   AND cm_idsector = sm_id')
    object sdqConsultaIDCASO: TFloatField
      FieldName = 'IDCASO'
      Required = True
    end
    object sdqConsultaSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqConsultaCUIL: TStringField
      FieldName = 'CUIL'
      Size = 4000
    end
    object sdqConsultaTRABAJADOR: TStringField
      FieldName = 'TRABAJADOR'
      Required = True
      Size = 60
    end
    object sdqConsultaDOMTRAB: TStringField
      FieldName = 'DOMTRAB'
      Size = 4000
    end
    object sdqConsultaCUIT: TStringField
      FieldName = 'CUIT'
      Size = 4000
    end
    object sdqConsultaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 200
    end
    object sdqConsultaSECTORACTUAL: TStringField
      FieldName = 'SECTORACTUAL'
      Required = True
      Size = 100
    end
    object sdqConsultaTIPODECASO: TStringField
      FieldName = 'TIPODECASO'
      Size = 9
    end
    object sdqConsultaTIPOALTA: TStringField
      FieldName = 'TIPOALTA'
      Size = 10
    end
    object sdqConsultaFRECSINIESTRO: TDateTimeField
      FieldName = 'FRECSINIESTRO'
    end
    object sdqConsultaTELPARTICULAR: TStringField
      FieldName = 'TELPARTICULAR'
      Size = 4000
    end
    object sdqConsultaCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 4000
    end
    object sdqConsultaACCIONINVEST: TStringField
      FieldName = 'ACCIONINVEST'
      Size = 4000
    end
    object sdqConsultaOBSERVINVEST: TStringField
      FieldName = 'OBSERVINVEST'
      Size = 4000
    end
    object sdqConsultaACCIONLEGALES: TStringField
      FieldName = 'ACCIONLEGALES'
      Size = 4000
    end
    object sdqConsultaOBSERVLEGALES: TStringField
      FieldName = 'OBSERVLEGALES'
      Size = 4000
    end
    object sdqConsultaACCIONMEDICA: TStringField
      FieldName = 'ACCIONMEDICA'
      Size = 4000
    end
    object sdqConsultaOBSERVMEDICA: TStringField
      FieldName = 'OBSERVMEDICA'
      Size = 4000
    end
    object sdqConsultaACCIONGERENCIA: TStringField
      FieldName = 'ACCIONGERENCIA'
      Size = 4000
    end
    object sdqConsultaOBSERVGERENCIA: TStringField
      FieldName = 'OBSERVGERENCIA'
      Size = 4000
    end
    object sdqConsultaFSUSPENSION: TStringField
      FieldName = 'FSUSPENSION'
      Size = 4000
    end
    object sdqConsultaFACUSE: TStringField
      FieldName = 'FACUSE'
      Size = 4000
    end
    object sdqConsultaFINFORME: TStringField
      FieldName = 'FINFORME'
      Size = 4000
    end
    object sdqConsultaFSOCIOAMBIENTAL: TStringField
      FieldName = 'FSOCIOAMBIENTAL'
      Size = 4000
    end
    object sdqConsultaFSOLICITUDDOCUM: TStringField
      FieldName = 'FSOLICITUDDOCUM'
      Size = 4000
    end
    object sdqConsultaCM_FECHABAJA: TDateTimeField
      FieldName = 'CM_FECHABAJA'
    end
    object sdqConsultaCM_IDSECTOR: TFloatField
      FieldName = 'CM_IDSECTOR'
      Required = True
      Visible = False
    end
    object sdqConsultaINVESTIGADOR: TStringField
      FieldName = 'INVESTIGADOR'
      Size = 4000
    end
    object sdqConsultaFSOLICINVESTIG: TStringField
      FieldName = 'FSOLICINVESTIG'
      Size = 4000
    end
    object sdqConsultaSM_CODIGO: TStringField
      FieldName = 'SM_CODIGO'
      Required = True
      Visible = False
      Size = 10
    end
    object sdqConsultaEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqConsultaEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqConsultaCM_RUTAARCHIVOASOCIADO: TStringField
      FieldName = 'CM_RUTAARCHIVOASOCIADO'
      Size = 2000
    end
    object sdqConsultaCM_RUTAARCHIVOSOCIOAMB: TStringField
      FieldName = 'CM_RUTAARCHIVOSOCIOAMB'
      Size = 2000
    end
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'SuperUserSectores'
      end>
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
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 316
  end
  object mnuImprimir: TPopupMenu
    Left = 128
    Top = 200
    object mnuImprimirGrilla: TMenuItem
      Caption = 'Imprimir Grilla'
      Hint = 'Imprimir Grilla'
      OnClick = mnuImprimirGrillaClick
    end
    object mnuImprimirPlanilla: TMenuItem
      Caption = 'Imprimir Planilla'
      Hint = 'Imprimir Planilla'
      OnClick = mnuImprimirPlanillaClick
    end
  end
  object sdqCasosRelacionados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   ha_fechaalta fecha, ha_usualta usuario, sm_descripcion ' +
        'sector, '
      
        '         art.dinerarias.get_accionrealizada(ha_idcaso, ha_idsect' +
        'or) accion,'
      
        '         art.dinerarias.get_accionrealizada(ha_idcaso, ha_idsect' +
        'or, '#39'S'#39') observacion'
      '    FROM din.dha_historicoacciones, din.dsm_sectoresmortales'
      '   WHERE ha_idsector = sm_id'
      '     AND ha_idcaso = :idcaso'
      '     AND ha_fechabaja IS NULL '
      'ORDER BY ha_id'
      '')
    Left = 23
    Top = 351
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idcaso'
        ParamType = ptInput
      end>
    object sdqCasosRelacionadosFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object sdqCasosRelacionadosUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
    object sdqCasosRelacionadosSECTOR: TStringField
      FieldName = 'SECTOR'
      Required = True
      Size = 100
    end
    object sdqCasosRelacionadosACCION: TStringField
      FieldName = 'ACCION'
      Size = 4000
    end
    object sdqCasosRelacionadosOBSERVACION: TStringField
      FieldName = 'OBSERVACION'
      Size = 4000
    end
  end
  object dsCasosRelacionados: TDataSource
    DataSet = sdqCasosRelacionados
    Left = 53
    Top = 351
  end
  object pmPDF: TPopupMenu
    Left = 80
    Top = 264
    object mnuCargar: TMenuItem
      Caption = 'Cargar'
      Hint = 'Cargar'
      object mnuCargarInvestigacion: TMenuItem
        Caption = 'Informe Investigaci'#243'n'
        OnClick = mnuCargarInvestigacionClick
      end
      object mnuCargarSocioambiental: TMenuItem
        Caption = 'Informe Socioambiental'
        OnClick = mnuCargarSocioambientalClick
      end
    end
    object mnuVer: TMenuItem
      Caption = 'Ver'
      Hint = 'Ver'
      object VerInvestigacion: TMenuItem
        Caption = 'Informe Investigaci'#243'n'
        OnClick = VerInvestigacionClick
      end
      object VerSocioambiental: TMenuItem
        Caption = 'Informe Socioambiental'
        OnClick = VerSocioambientalClick
      end
    end
  end
  object OpenDialog_AsocArch: TOpenDialog
    Left = 26
    Top = 318
  end
end
