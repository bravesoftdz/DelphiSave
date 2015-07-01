object frmImpresionContratos: TfrmImpresionContratos
  Left = 250
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impresi'#243'n de Contratos'
  ClientHeight = 293
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbRangoContratos: TGroupBox
    Left = 3
    Top = 25
    Width = 150
    Height = 69
    Caption = 'Rango de Contratos'
    TabOrder = 1
    object Label1: TLabel
      Left = 19
      Top = 19
      Width = 27
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Inicial'
    end
    object Label2: TLabel
      Left = 19
      Top = 44
      Width = 27
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Final'
    end
    object edContratoDesde: TIntEdit
      Left = 53
      Top = 16
      Width = 80
      Height = 21
      TabOrder = 0
      MaxLength = 8
    end
    object edContratoHasta: TIntEdit
      Left = 53
      Top = 41
      Width = 80
      Height = 21
      TabOrder = 1
      MaxLength = 8
    end
  end
  object rgTipoImpresion: TRadioGroup
    Left = 161
    Top = 25
    Width = 174
    Height = 69
    Caption = 'Reimpresi'#243'n'
    ItemIndex = 2
    Items.Strings = (
      '&Reimprimir siempre'
      '&No Reimprimir nunca'
      'Pregun&tar')
    TabOrder = 2
  end
  object gbRangoEmpleados: TGroupBox
    Left = 3
    Top = 94
    Width = 333
    Height = 44
    Caption = 'Rango de Empleados'
    TabOrder = 4
    inline fraStaticCTBRangoEmpleados: TfraStaticCTB_TABLAS
      Left = 5
      Top = 14
      Width = 323
      Height = 23
      TabOrder = 0
      ExplicitLeft = 5
      ExplicitTop = 14
      ExplicitWidth = 323
      inherited cmbDescripcion: TComboGrid
        Width = 259
        ExplicitWidth = 259
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
  end
  object gbTipoContrato: TGroupBox
    Left = 3
    Top = 205
    Width = 185
    Height = 80
    Caption = 'Tipo de Contrato'
    TabOrder = 7
    object chkTipoContratoCliente: TCheckBox
      Left = 16
      Top = 16
      Width = 161
      Height = 17
      Caption = 'Para el Cli&ente'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chkTipoContratoAseguradora: TCheckBox
      Left = 16
      Top = 36
      Width = 161
      Height = 17
      Caption = 'Para la &Aseguradora'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chkTipoContratoAseguradoraArchivo: TCheckBox
      Left = 16
      Top = 56
      Width = 161
      Height = 17
      Caption = 'Para la A&seguradora (Archivo)'
      TabOrder = 2
    end
  end
  object btnSoloActivas: TButton
    Left = 192
    Top = 225
    Width = 144
    Height = 20
    Caption = '&Imprimir s'#243'lo Contr. Activos'
    TabOrder = 9
    OnClick = btnSoloActivasClick
  end
  object btnSoloDeBaja: TButton
    Left = 192
    Top = 245
    Width = 144
    Height = 20
    Caption = 'I&mprimir s'#243'lo Contr. de Baja'
    TabOrder = 10
    OnClick = btnSoloActivasClick
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 676
    Height = 27
    BorderWidth = 1
    Caption = 'ToolBar'
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tbLimpiar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Limpiar (Ctrl+L)'
      ImageIndex = 1
      OnClick = tbLimpiarClick
    end
    object ToolButton6: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbSalir: TToolButton
      Left = 31
      Top = 0
      Hint = 'Salir (Ctrl+S)'
      ImageIndex = 5
      OnClick = tbSalirClick
    end
    object ToolButton1: TToolButton
      Left = 54
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 6
      Style = tbsSeparator
    end
  end
  object gbImpresora: TGroupBox
    Left = 3
    Top = 138
    Width = 333
    Height = 42
    Caption = 'Impresora'
    TabOrder = 5
    DesignSize = (
      333
      42)
    object cmbImpresoras: TComboBox
      Left = 6
      Top = 14
      Width = 321
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object btnParar: TButton
    Left = 192
    Top = 265
    Width = 144
    Height = 20
    Caption = '&Parar'
    TabOrder = 11
    OnClick = btnPararClick
  end
  object BarProgreso: TProgressBar
    Left = 3
    Top = 186
    Width = 332
    Height = 16
    Position = 50
    Smooth = True
    TabOrder = 6
  end
  object chkImprimirMembrete: TCheckBox
    Left = 192
    Top = 208
    Width = 125
    Height = 17
    Caption = 'Imprimir membrete'
    TabOrder = 8
  end
  object gbCartaBienvenida: TGroupBox
    Left = 340
    Top = 84
    Width = 332
    Height = 96
    TabOrder = 13
    DesignSize = (
      332
      96)
    object lbTexto: TLabel
      Left = 4
      Top = 21
      Width = 27
      Height = 13
      Caption = 'Texto'
      Enabled = False
    end
    object lbFirmante: TLabel
      Left = 4
      Top = 45
      Width = 40
      Height = 13
      Caption = 'Firmante'
      Enabled = False
    end
    object lbCorreo: TLabel
      Left = 4
      Top = 69
      Width = 31
      Height = 13
      Caption = 'Correo'
      Enabled = False
    end
    inline fraTexto: TfraStaticCodigoDescripcion
      Left = 48
      Top = 16
      Width = 280
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 0
      ExplicitLeft = 48
      ExplicitTop = 16
      ExplicitWidth = 280
      ExplicitHeight = 24
      inherited edCodigo: TPatternEdit
        Width = 56
        ExplicitWidth = 56
      end
      inherited cmbDescripcion: TComboGrid
        Left = 60
        Width = 216
        ExplicitLeft = 60
        ExplicitWidth = 216
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          240
          -1
          -1)
      end
    end
    inline fraFirmante: TfraStaticCodigoDescripcion
      Left = 48
      Top = 40
      Width = 280
      Height = 25
      Enabled = False
      TabOrder = 1
      ExplicitLeft = 48
      ExplicitTop = 40
      ExplicitWidth = 280
      ExplicitHeight = 25
      inherited edCodigo: TPatternEdit
        Width = 56
        ExplicitWidth = 56
      end
      inherited cmbDescripcion: TComboGrid
        Left = 60
        Width = 216
        ExplicitLeft = 60
        ExplicitWidth = 216
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
    inline fraCorreo: TfraStaticCTB_TABLAS
      Left = 48
      Top = 64
      Width = 280
      Height = 25
      Enabled = False
      TabOrder = 2
      ExplicitLeft = 48
      ExplicitTop = 64
      ExplicitWidth = 280
      ExplicitHeight = 25
      inherited edCodigo: TPatternEdit
        Width = 56
        ExplicitWidth = 56
      end
      inherited cmbDescripcion: TComboGrid
        Left = 60
        Width = 216
        ExplicitLeft = 60
        ExplicitWidth = 216
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
  end
  object chkImpCartaBienvenida: TCheckBox
    Left = 356
    Top = 81
    Width = 116
    Height = 17
    Caption = 'Carta de Bienvenida'
    TabOrder = 12
    OnClick = chkImpCartaBienvenidaClick
  end
  object gbAnexo: TGroupBox
    Left = 340
    Top = 190
    Width = 332
    Height = 96
    TabOrder = 15
    DesignSize = (
      332
      96)
    object lbTexto2: TLabel
      Left = 4
      Top = 21
      Width = 27
      Height = 13
      Caption = 'Texto'
      Enabled = False
    end
    object lbFirmante2: TLabel
      Left = 4
      Top = 45
      Width = 40
      Height = 13
      Caption = 'Firmante'
      Enabled = False
    end
    object lbCorreo2: TLabel
      Left = 4
      Top = 69
      Width = 31
      Height = 13
      Caption = 'Correo'
      Enabled = False
    end
    inline fraTexto2: TfraStaticCodigoDescripcion
      Left = 48
      Top = 16
      Width = 280
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 0
      ExplicitLeft = 48
      ExplicitTop = 16
      ExplicitWidth = 280
      ExplicitHeight = 24
      inherited edCodigo: TPatternEdit
        Width = 56
        ExplicitWidth = 56
      end
      inherited cmbDescripcion: TComboGrid
        Left = 60
        Width = 217
        ExplicitLeft = 60
        ExplicitWidth = 217
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          240
          -1
          -1)
      end
    end
    inline fraFirmante2: TfraStaticCodigoDescripcion
      Left = 48
      Top = 40
      Width = 280
      Height = 25
      Enabled = False
      TabOrder = 1
      ExplicitLeft = 48
      ExplicitTop = 40
      ExplicitWidth = 280
      ExplicitHeight = 25
      inherited edCodigo: TPatternEdit
        Width = 56
        ExplicitWidth = 56
      end
      inherited cmbDescripcion: TComboGrid
        Left = 60
        Width = 217
        ExplicitLeft = 60
        ExplicitWidth = 217
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
    inline fraCorreo2: TfraStaticCTB_TABLAS
      Left = 48
      Top = 64
      Width = 280
      Height = 25
      Enabled = False
      TabOrder = 2
      ExplicitLeft = 48
      ExplicitTop = 64
      ExplicitWidth = 280
      ExplicitHeight = 25
      inherited edCodigo: TPatternEdit
        Width = 56
        ExplicitWidth = 56
      end
      inherited cmbDescripcion: TComboGrid
        Left = 60
        Width = 216
        ExplicitLeft = 60
        ExplicitWidth = 216
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
  end
  object chkImprimirAnexo: TCheckBox
    Left = 356
    Top = 187
    Width = 208
    Height = 17
    Caption = 'Anexo Res. 365 (Ventanilla Electronica)'
    TabOrder = 14
    OnClick = chkImprimirAnexoClick
  end
  object gbRegimen: TGroupBox
    Left = 341
    Top = 25
    Width = 331
    Height = 56
    Caption = 'R'#233'gimen'
    TabOrder = 3
    inline fraRegimen: TfraCodDesc
      Left = 13
      Top = 20
      Width = 310
      Height = 23
      TabOrder = 0
      ExplicitLeft = 13
      ExplicitTop = 20
      ExplicitWidth = 310
      inherited cmbDescripcion: TArtComboBox
        Width = 245
        ExplicitWidth = 245
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'TR_FECHABAJA'
        FieldCodigo = 'TR_CODIGO'
        FieldDesc = 'TR_DESCRIPCION'
        FieldID = 'TR_ID'
        OrderBy = 'TR_CODIGO'
        TableName = 'AFI.ATR_TIPOREGIMEN'
      end
    end
  end
  object FormStorage1: TFormStorage
    StoredValues = <>
    Left = 292
    Top = 4
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 264
    Top = 4
  end
end
