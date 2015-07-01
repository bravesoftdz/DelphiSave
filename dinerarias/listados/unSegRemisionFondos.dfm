inherited frmSegRemisionFondos: TfrmSegRemisionFondos
  Left = 482
  Top = 160
  Caption = 'Seguimiento de Remisi'#243'n de Fondos'
  ClientHeight = 394
  ClientWidth = 742
  ExplicitLeft = 482
  ExplicitTop = 160
  ExplicitWidth = 750
  ExplicitHeight = 424
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 742
    Height = 159
    ExplicitWidth = 742
    ExplicitHeight = 159
    object GroupBox1: TGroupBox
      Left = 2
      Top = 1
      Width = 200
      Height = 40
      Caption = 'Fecha cheque'
      TabOrder = 0
      object Label1: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcDesdeCheque: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaCheque
        TabOrder = 0
      end
      object dcHastaCheque: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeCheque
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 204
      Top = 1
      Width = 200
      Height = 40
      Caption = 'Fecha aprob liq.'
      TabOrder = 1
      object Label2: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcDesdeAprobLiq: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaAprobLiq
        TabOrder = 0
      end
      object dcHastaAprobLiq: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeAprobLiq
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 204
      Top = 40
      Width = 200
      Height = 40
      Caption = ' Fecha resp. banco'
      TabOrder = 2
      object Label3: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcDesdeRespBco: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaRespBco
        TabOrder = 0
      end
      object dcHastaRespBco: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeRespBco
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 406
      Top = 40
      Width = 334
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Trabajador'
      TabOrder = 3
      DesignSize = (
        334
        40)
      inline fraTrabajadorSiniestro: TfraTrabajadorSiniestro
        Left = 5
        Top = 14
        Width = 324
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
        ExplicitWidth = 521
        inherited lbSiniestro: TLabel
          Left = 158
          ExplicitLeft = 469
        end
        inherited cmbNombre: TArtComboBox
          Width = 71
          ExplicitWidth = 268
        end
        inherited edSiniestro: TSinEdit
          Left = 223
          ExplicitLeft = 420
        end
        inherited ToolBar: TToolBar
          Left = 200
          ExplicitLeft = 397
        end
        inherited ImageList: TImageList
          Bitmap = {
            494C010101003800AC0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
    object rgConAccion: TRadioGroup
      Left = 109
      Top = 118
      Width = 105
      Height = 40
      Caption = 'Con Acci'#243'n'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 4
    end
    object rgVerBajas: TRadioGroup
      Left = 2
      Top = 118
      Width = 105
      Height = 40
      Caption = 'Ver Bajas'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 5
    end
    object GroupBox5: TGroupBox
      Left = 2
      Top = 40
      Width = 200
      Height = 40
      Caption = ' Fecha accidente'
      TabOrder = 6
      object Label4: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcDesdeAccid: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaAccid
        TabOrder = 0
      end
      object dcHastaAccid: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeAccid
        TabOrder = 1
      end
    end
    object gbConceptoPago: TGroupBox
      Left = 2
      Top = 79
      Width = 579
      Height = 40
      Caption = 'Concepto Pago'
      TabOrder = 7
      DesignSize = (
        579
        40)
      inline fraConceptoPago: TfraCodigoDescripcion
        Left = 4
        Top = 14
        Width = 571
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 14
        ExplicitWidth = 409
        inherited cmbDescripcion: TArtComboBox
          Width = 506
          ExplicitWidth = 344
        end
      end
    end
    object gbMetodoPago: TGroupBox
      Left = 582
      Top = 79
      Width = 158
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'M'#233'todo Pago'
      TabOrder = 8
      DesignSize = (
        158
        40)
      inline fraMetodoPago: TfraCtbTablas
        Left = 4
        Top = 14
        Width = 150
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 14
        ExplicitWidth = 150
        ExplicitHeight = 22
        inherited cmbDescripcion: TArtComboBox
          Width = 97
        end
      end
    end
    object gbSituacionPago: TGroupBox
      Left = 216
      Top = 118
      Width = 524
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Situaci'#243'n Pago'
      TabOrder = 9
      DesignSize = (
        524
        40)
      inline fraSituacionPago: TfraCodigoDescripcion
        Left = 4
        Top = 14
        Width = 516
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 14
        ExplicitWidth = 409
        inherited cmbDescripcion: TArtComboBox
          Width = 451
          ExplicitWidth = 344
        end
      end
    end
    object GroupBox8: TGroupBox
      Left = 406
      Top = 1
      Width = 334
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa '
      TabOrder = 10
      DesignSize = (
        334
        40)
      object Label5: TLabel
        Left = 8
        Top = 19
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 39
        Top = 14
        Width = 289
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
        ExplicitWidth = 396
        ExplicitHeight = 21
        inherited lbContrato: TLabel
          Left = 185
          ExplicitLeft = 829
        end
        inherited edContrato: TIntEdit
          Left = 232
          ExplicitLeft = 339
        end
        inherited cmbRSocial: TArtComboBox
          Width = 50
          ExplicitWidth = 157
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 159
    Width = 742
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 736
      end>
    inherited ToolBar: TToolBar
      Width = 727
      ExplicitWidth = 727
      object tbRealizarAccion: TToolButton [11]
        Left = 208
        Top = 0
        Hint = 'Realizar Acci'#243'n'
        ImageIndex = 27
        OnClick = tbRealizarAccionClick
      end
      object tbAccionesRealizadas: TToolButton [12]
        Left = 231
        Top = 0
        Hint = 'Acciones Realizadas'
        Caption = 'tbAccionesRealizadas'
        ImageIndex = 18
        OnClick = tbAccionesRealizadasClick
      end
      object tbHistorialEstados: TToolButton [13]
        Left = 254
        Top = 0
        Hint = 'Historial Estados'
        ImageIndex = 9
        OnClick = tbHistorialEstadosClick
      end
      inherited ToolButton6: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited tbImprimir: TToolButton
        Left = 285
        ExplicitLeft = 285
      end
      inherited tbExportar: TToolButton
        Left = 308
        Enabled = True
        ExplicitLeft = 308
      end
      inherited tbEnviarMail: TToolButton
        Left = 331
        ExplicitLeft = 331
      end
      inherited ToolButton8: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 362
        Enabled = False
        ExplicitLeft = 362
      end
      inherited tbMaxRegistros: TToolButton
        Left = 385
        ExplicitLeft = 385
      end
      inherited ToolButton11: TToolButton
        Left = 408
        Enabled = False
        ExplicitLeft = 408
      end
      inherited tbSalir: TToolButton
        Left = 416
        ExplicitLeft = 416
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 188
    Width = 742
    Height = 206
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCASO'
        Title.Caption = 'ID CASO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMLIQ'
        Title.Caption = 'N'#176' LIQ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FACCID'
        Title.Caption = 'F. ACCID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONPAGO'
        Title.Caption = 'CON. PAGO'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUICIO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIQUIDADOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAPROBACION'
        Title.Caption = 'F. APROB.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUAPROBACION'
        Title.Caption = 'USU. APROB.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMAPAGO'
        Title.Caption = 'FORMA PAGO'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUENOMBRE'
        Title.Caption = 'CHEQUE NOMBRE'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPAGO'
        Title.Caption = 'O. PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROCHEQUE'
        Title.Caption = 'NRO. CHEQUE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHACHEQUE'
        Title.Caption = 'F. CHEQUE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BENEFCHEQUE'
        Title.Caption = 'BENEF. CHEQUE'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHADEBITADO'
        Title.Caption = 'F. DEBITADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHASITUACION'
        Title.Caption = 'F. SITUACION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITPAGO'
        Title.Caption = 'SIT. PAGO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRESPBANCO'
        Title.Caption = 'F. RESP. BANCO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESPUESTABANCO'
        Title.Caption = 'RESP. BANCO'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANTERIORESSINCOBRAR'
        Title.Caption = 'ANTERIORES SIN COBRAR'
        Width = 60
        Visible = True
      end>
  end
  object fpHistorialEstados: TFormPanel [3]
    Left = 67
    Top = 208
    Width = 629
    Height = 178
    Caption = 'Historial Estados'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      629
      178)
    object Bevel1: TBevel
      Left = 4
      Top = 142
      Width = 621
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 123
      ExplicitWidth = 497
    end
    object Button1: TButton
      Left = 549
      Top = 148
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 0
      ExplicitLeft = 557
      ExplicitTop = 190
    end
    object GridHistoricoEstados: TArtDBGrid
      Left = 6
      Top = 8
      Width = 618
      Height = 128
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsHistorialEstados
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'ESTADOCHEQUE'
          Title.Caption = 'ESTADO CHEQUE'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHAESTADO'
          Title.Caption = 'FECHA ESTADO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SITUACION'
          Title.Caption = 'SITUACI'#211'N'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHASIT'
          Title.Caption = 'FECHA SIT.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIOSIT'
          Title.Caption = 'USUARIO SIT.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHADEBITADO'
          Title.Caption = 'FEC. DEBITADO'
          Visible = True
        end>
    end
  end
  object fpAccionesRealizadas: TFormPanel [4]
    Left = 72
    Top = 208
    Width = 629
    Height = 178
    Caption = 'Acciones Realizadas'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      629
      178)
    object Bevel2: TBevel
      Left = 4
      Top = 142
      Width = 621
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 123
      ExplicitWidth = 497
    end
    object Button2: TButton
      Left = 549
      Top = 148
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 0
    end
    object GridAccionesRealizadas: TArtDBGrid
      Left = 6
      Top = 8
      Width = 618
      Height = 128
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsAccionesRealizadas
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHAACCION'
          Title.Caption = 'FECHA ACCI'#211'N'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIOACCION'
          Title.Caption = 'USU. ACCI'#211'N'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACCION'
          Title.Caption = 'ACCI'#214'N'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AR_OBSERVACION'
          Title.Caption = 'OBSERVACI'#211'N'
          Width = 200
          Visible = True
        end>
    end
  end
  object fpRealizarAccion: TFormPanel [5]
    Left = 154
    Top = 208
    Width = 476
    Height = 117
    Caption = 'Realizar acci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnShow = fpRealizarAccionShow
    DesignSize = (
      476
      117)
    object Bevel3: TBevel
      Left = 4
      Top = 86
      Width = 468
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 82
    end
    object Label6: TLabel
      Left = 18
      Top = 19
      Width = 33
      Height = 13
      Caption = 'Acci'#243'n'
    end
    object Label7: TLabel
      Left = 18
      Top = 43
      Width = 22
      Height = 13
      Caption = 'Obs.'
    end
    object btnAceptarRealizarAccion: TButton
      Left = 318
      Top = 91
      Width = 75
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnAceptarRealizarAccionClick
      ExplicitTop = 95
    end
    object Button3: TButton
      Left = 396
      Top = 91
      Width = 75
      Height = 21
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
      ExplicitTop = 95
    end
    inline fraAccion: TfraCodigoDescripcion
      Left = 57
      Top = 14
      Width = 405
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 57
      ExplicitTop = 14
      ExplicitWidth = 405
      inherited cmbDescripcion: TArtComboBox
        Width = 340
        ExplicitWidth = 319
      end
    end
    object mObservaciones: TMemo
      Left = 58
      Top = 43
      Width = 403
      Height = 36
      Lines.Strings = (
        '')
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT rf_id idcaso, art.utiles.armar_siniestro(ex_siniestro, ex' +
        '_orden, ex_recaida) siniestro, '
      
        '       le_numliqui numliq, ex_fechaaccidente faccid, art.utiles.' +
        'armar_cuit(tj_cuil) cuil, '
      
        '       tj_nombre trabajador, art.utiles.armar_cuit(em_cuit) cuit' +
        ', em_nombre empresa, cp_denpago conpago, '
      
        '       art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex' +
        '_recaida) juicio, le_imporperi monto, '
      
        '       le_usualta liquidador, le_faprobado faprobacion, le_aprob' +
        'ado usuaprobacion, mp.tb_descripcion formapago, '
      
        '       ba.ba_nombre banco, le_chequenombre chequenombre, ce_orde' +
        'npago opago, ce_numero nrocheque,'
      
        '       ce_fechacheque fechacheque, ce_beneficiario benefcheque, ' +
        'ce_fechadebitado fechadebitado,'
      
        '       ce_fechasituacion fechasituacion, sit.tb_descripcion sitp' +
        'ago, ce_fecharespuestabapro frespbanco,'
      '       sit.tb_descripcion respuestabanco,'
      '       NVL((SELECT '#39'S'#39
      '              FROM rce_chequeemitido b'
      '             WHERE b.ce_idtrabajador = a.ce_idtrabajador'
      '               AND b.ce_id < a.ce_id'
      '               AND b.ce_estado = '#39'01'#39
      '               AND b.ce_fechadebitado IS NULL'
      
        '               AND ROWNUM = 1), '#39'N'#39') anterioressincobrar, ce_id,' +
        ' rf_fechabaja'
      
        '  FROM din.drf_casosremisionfondos, art.sle_liquiempsin, art.sex' +
        '_expedientes, '
      
        '       rce_chequeemitido a, ctj_trabajador, aem_empresa, art.ctb' +
        '_tablas mp, '
      
        '       zba_banco ba, art.ctb_tablas sit, art.scp_conpago, art.ct' +
        'b_tablas res'
      ' WHERE rf_idliquidacion = le_id'
      '   AND le_idexpediente = ex_id'
      '   AND ex_idtrabajador = tj_id'
      '   AND ex_cuit = em_cuit'
      '   AND mp.tb_clave = '#39'COBRO'#39
      '   AND mp.tb_codigo = le_metodopago'
      '   AND le_idbanco = ba.ba_id(+)'
      '   AND le_idchequeemitido = ce_id'
      '   AND sit.tb_clave(+) = '#39'SITCH'#39
      '   AND sit.tb_codigo(+) = ce_situacion'
      '   AND le_conpago = cp_conpago'
      '   AND res.tb_clave(+) = '#39'TRABP'#39
      '   AND res.tb_codigo(+) = ce_respuestabapro'
      '   AND cp_tipo IN('#39'P'#39', '#39'I'#39', '#39'M'#39')')
    object sdqConsultaIDCASO: TFloatField
      FieldName = 'IDCASO'
      Required = True
    end
    object sdqConsultaSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqConsultaNUMLIQ: TFloatField
      FieldName = 'NUMLIQ'
      Required = True
    end
    object sdqConsultaFACCID: TDateTimeField
      FieldName = 'FACCID'
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
    object sdqConsultaCUIT: TStringField
      FieldName = 'CUIT'
      Size = 4000
    end
    object sdqConsultaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 200
    end
    object sdqConsultaCONPAGO: TStringField
      FieldName = 'CONPAGO'
      Size = 40
    end
    object sdqConsultaJUICIO: TStringField
      FieldName = 'JUICIO'
      Size = 4000
    end
    object sdqConsultaMONTO: TFloatField
      FieldName = 'MONTO'
    end
    object sdqConsultaLIQUIDADOR: TStringField
      FieldName = 'LIQUIDADOR'
    end
    object sdqConsultaFAPROBACION: TDateTimeField
      FieldName = 'FAPROBACION'
    end
    object sdqConsultaUSUAPROBACION: TStringField
      FieldName = 'USUAPROBACION'
    end
    object sdqConsultaFORMAPAGO: TStringField
      FieldName = 'FORMAPAGO'
      Size = 150
    end
    object sdqConsultaBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object sdqConsultaCHEQUENOMBRE: TStringField
      FieldName = 'CHEQUENOMBRE'
      Size = 100
    end
    object sdqConsultaOPAGO: TFloatField
      FieldName = 'OPAGO'
      Required = True
    end
    object sdqConsultaNROCHEQUE: TFloatField
      FieldName = 'NROCHEQUE'
      Required = True
    end
    object sdqConsultaFECHACHEQUE: TDateTimeField
      FieldName = 'FECHACHEQUE'
      Required = True
    end
    object sdqConsultaBENEFCHEQUE: TStringField
      FieldName = 'BENEFCHEQUE'
      Required = True
      Size = 100
    end
    object sdqConsultaFECHADEBITADO: TDateTimeField
      FieldName = 'FECHADEBITADO'
    end
    object sdqConsultaFECHASITUACION: TDateTimeField
      FieldName = 'FECHASITUACION'
    end
    object sdqConsultaSITPAGO: TStringField
      FieldName = 'SITPAGO'
      Size = 150
    end
    object sdqConsultaFRESPBANCO: TDateTimeField
      FieldName = 'FRESPBANCO'
    end
    object sdqConsultaRESPUESTABANCO: TStringField
      FieldName = 'RESPUESTABANCO'
      Size = 150
    end
    object sdqConsultaANTERIORESSINCOBRAR: TStringField
      FieldName = 'ANTERIORESSINCOBRAR'
      Size = 1
    end
    object sdqConsultaCE_ID: TFloatField
      FieldName = 'CE_ID'
      Required = True
    end
    object sdqConsultaRF_FECHABAJA: TDateTimeField
      FieldName = 'RF_FECHABAJA'
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object sdqHistorialEstados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT   est.tb_descripcion estadocheque, he_fechaestado fechaes' +
        'tado, sit.tb_descripcion situacion, '
      
        '         he_fechasituacion fechasit, se_nombre usuariosit, he_fe' +
        'chadebitado fechadebitado'
      '    FROM art.use_usuarios, art.ctb_tablas sit, '
      '         rhe_historicoestadocheque, art.ctb_tablas est'
      '   WHERE he_situacion = sit.tb_codigo'
      '     AND sit.tb_clave = '#39'SITCH'#39
      '     AND he_estado = est.tb_codigo'
      '     AND est.tb_clave = '#39'ESTCH'#39
      '     AND he_ususituacion = se_usuario(+)'
      '     AND he_idcheque = :idchequeemitido'
      'ORDER BY he_id')
    Left = 16
    Top = 324
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idchequeemitido'
        ParamType = ptInput
      end>
    object sdqHistorialEstadosESTADOCHEQUE: TStringField
      FieldName = 'ESTADOCHEQUE'
      Size = 150
    end
    object sdqHistorialEstadosFECHAESTADO: TDateTimeField
      FieldName = 'FECHAESTADO'
    end
    object sdqHistorialEstadosSITUACION: TStringField
      FieldName = 'SITUACION'
      Size = 150
    end
    object sdqHistorialEstadosFECHASIT: TDateTimeField
      FieldName = 'FECHASIT'
    end
    object sdqHistorialEstadosUSUARIOSIT: TStringField
      FieldName = 'USUARIOSIT'
      Size = 50
    end
    object sdqHistorialEstadosFECHADEBITADO: TDateTimeField
      FieldName = 'FECHADEBITADO'
    end
  end
  object dsHistorialEstados: TDataSource
    DataSet = sdqHistorialEstados
    Left = 44
    Top = 324
  end
  object sdqAccionesRealizadas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT   ar_fechaalta fechaaccion, ar_usualta usuarioaccion, ac_' +
        'descripcion accion, ar_observacion'
      '    FROM din.dar_accionesrealizadasrf, din.dac_accionescasosrf'
      '   WHERE ar_idaccion = ac_id'
      '     AND ar_fechabaja IS NULL'
      '     AND ar_idcaso = :idcaso'
      'ORDER BY ar_id')
    Left = 72
    Top = 324
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idcaso'
        ParamType = ptInput
      end>
    object sdqAccionesRealizadasFECHAACCION: TDateTimeField
      FieldName = 'FECHAACCION'
    end
    object sdqAccionesRealizadasUSUARIOACCION: TStringField
      FieldName = 'USUARIOACCION'
    end
    object sdqAccionesRealizadasACCION: TStringField
      FieldName = 'ACCION'
      Required = True
      Size = 100
    end
    object sdqAccionesRealizadasAR_OBSERVACION: TStringField
      FieldName = 'AR_OBSERVACION'
      Size = 1000
    end
  end
  object dsAccionesRealizadas: TDataSource
    DataSet = sdqAccionesRealizadas
    Left = 100
    Top = 324
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
    Left = 80
    Top = 260
  end
end
