object frmEstudioDef: TfrmEstudioDef
  Left = 434
  Top = 260
  Width = 535
  Height = 385
  Caption = 'Estudio por Defecto'
  Color = clBtnFace
  Constraints.MaxHeight = 500
  Constraints.MinHeight = 385
  Constraints.MinWidth = 535
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FSFormCreate
  DesignSize = (
    527
    358)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 68
    Width = 45
    Height = 13
    Caption = '&Prestador'
    FocusControl = fraPrestador.edCodigo
  end
  object Label13: TLabel
    Left = 6
    Top = 40
    Width = 30
    Height = 13
    Caption = '&Fecha'
    FocusControl = edFecha
  end
  object lbResultado: TLabel
    Left = 6
    Top = 152
    Width = 48
    Height = 13
    Caption = '&Resultado'
    FocusControl = nbEstudio
  end
  object Bevel9: TBevel
    Left = 4
    Top = 323
    Width = 520
    Height = 5
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object lbFPEstudio: TLabel
    Left = 6
    Top = 12
    Width = 35
    Height = 13
    Caption = '&Estudio'
  end
  object Label2: TLabel
    Left = 8
    Top = 124
    Width = 46
    Height = 13
    Caption = '&Operativo'
  end
  object Label3: TLabel
    Left = 8
    Top = 98
    Width = 21
    Height = 13
    Caption = '&Tipo'
    FocusControl = fraTipoEstudio.edCodigo
  end
  object Label5: TLabel
    Left = 6
    Top = 215
    Width = 92
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'F.Recep. Prestador'
    FocusControl = edFechaRPrest
    WordWrap = True
  end
  object Label4: TLabel
    Left = 197
    Top = 215
    Width = 92
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'F.Recep. Med.Lab.'
    FocusControl = edFechaRML
    WordWrap = True
  end
  object Label6: TLabel
    Left = 6
    Top = 235
    Width = 74
    Height = 13
    Caption = 'Observaciones:'
  end
  object Label7: TLabel
    Left = 6
    Top = 188
    Width = 88
    Height = 13
    Caption = 'Datos Adicionales:'
    FocusControl = nbEstudio
  end
  inline fraPrestador: TfraPrestadorAMP
    Left = 64
    Top = 64
    Width = 460
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    inherited cmbDescripcion: TArtComboBox
      Left = 92
      Width = 368
    end
    inherited edCodigo: TIntEdit
      Width = 89
    end
  end
  object edFecha: TDateComboBox
    Left = 64
    Top = 36
    Width = 89
    Height = 21
    Hint = 'Fecha de Realizaci'#243'n del Estudio'
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object btnEstAceptar: TButton
    Left = 371
    Top = 331
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 10
    OnClick = btnEstAceptarClick
  end
  object btnEstCancelar: TButton
    Left = 451
    Top = 331
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 11
  end
  object edFechaText: TEdit
    Left = 156
    Top = 36
    Width = 368
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object nbEstudio: TNotebook
    Left = 64
    Top = 148
    Width = 460
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
    object TPage
      Left = 0
      Top = 0
      Caption = 'NUMERICO'
      DesignSize = (
        460
        25)
      object lbEstUMedida: TLabel
        Left = 96
        Top = 4
        Width = 364
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
      end
      object edResultado: TCurrencyEdit
        Left = 0
        Top = 0
        Width = 89
        Height = 21
        Hint = 'Resultado del Estudio'
        AutoSize = False
        DisplayFormat = ' ,0.00;- ,0.00'
        MaxLength = 12
        TabOrder = 0
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'BOOLEANO'
      object cmbNormAnorm: TComboBox
        Left = 0
        Top = 0
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Normal'
          'Anormal')
      end
    end
  end
  inline fraEstudio: TfraEstudio
    Left = 64
    Top = 8
    Width = 460
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    inherited cmbDescripcion: TArtComboBox
      Left = 92
      Width = 368
      TabStop = False
    end
    inherited edCodigo: TPatternEdit
      Width = 89
      TabStop = False
    end
  end
  inline fraOperativo: TfraOperativo
    Left = 64
    Top = 120
    Width = 460
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
    inherited cmbDescripcion: TArtComboBox
      Width = 408
    end
  end
  inline fraTipoEstudio: TfraTipoEstudio
    Left = 64
    Top = 92
    Width = 281
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    inherited cmbDescripcion: TArtComboBox
      Width = 228
    end
  end
  inline fraReconfirmacion: TfraReconfirmacion
    Left = 347
    Top = 93
    Width = 177
    Height = 22
    Anchors = [akTop, akRight]
    TabOrder = 5
    inherited cmbEstudio: TArtComboBox
      Width = 109
    end
  end
  object edFechaRPrest: TDateComboBox
    Left = 103
    Top = 211
    Width = 88
    Height = 21
    TabStop = False
    MinDate = 35065.000000000000000000
    Anchors = [akTop, akRight]
    TabOrder = 8
  end
  object edFechaRML: TDateComboBox
    Left = 298
    Top = 211
    Width = 88
    Height = 21
    TabStop = False
    MinDate = 35065.000000000000000000
    Anchors = [akTop, akRight]
    TabOrder = 9
  end
  object memObsEstudio: TRichEdit
    Left = 6
    Top = 249
    Width = 517
    Height = 70
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 12
  end
  object nbDatosAdic: TNotebook
    Left = 102
    Top = 174
    Width = 422
    Height = 34
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 13
    object TPage
      Left = 0
      Top = 0
      Caption = 'NINGUNO'
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'EST35'
      object cgEst35: TCheckGroup
        Tag = 6
        Left = 0
        Top = 0
        Width = 421
        Height = 31
        TabOrder = 0
        Columns = 3
        Items.Strings = (
          'Cervicalgia'
          'Dorsalgia'
          'Lumbalgia')
        Value = '000'
      end
    end
  end
  object cbEstudioUnico: TCheckBox
    Left = 394
    Top = 212
    Width = 103
    Height = 17
    Caption = 'Estudio Unico'
    TabOrder = 14
  end
end
