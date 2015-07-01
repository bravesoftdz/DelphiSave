object frmEstRespiratorio: TfrmEstRespiratorio
  Left = 177
  Top = 152
  Width = 450
  Height = 430
  ActiveControl = fraPrestador.edCodigo
  Caption = 'Estudios Respiratorios'
  Color = clBtnFace
  Constraints.MaxHeight = 430
  Constraints.MaxWidth = 500
  Constraints.MinHeight = 410
  Constraints.MinWidth = 371
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    442
    403)
  PixelsPerInch = 96
  TextHeight = 13
  object pcDatos: TPageControl
    Left = 0
    Top = 118
    Width = 442
    Height = 252
    ActivePage = tsDatosGenerales
    Align = alTop
    TabOrder = 1
    object tsDatosGenerales: TTabSheet
      Caption = 'Datos Generales'
      DesignSize = (
        434
        224)
      object gbOpaParen: TGroupBox
        Left = 1
        Top = 0
        Width = 210
        Height = 141
        Caption = 'Opacidades Parenquimatosas'
        TabOrder = 0
        object pnlOpacPequenas: TPanel
          Left = 8
          Top = 40
          Width = 69
          Height = 45
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' Peque'#241'as'
          TabOrder = 7
        end
        object pnlOpacRedond: TPanel
          Left = 80
          Top = 40
          Width = 77
          Height = 21
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' Redondeadas'
          TabOrder = 8
        end
        object pnlOpacIrreg: TPanel
          Left = 80
          Top = 64
          Width = 77
          Height = 21
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' Irregulares'
          TabOrder = 9
        end
        object edOpacPequRedDer: TPatternEdit
          Left = 160
          Top = 40
          Width = 20
          Height = 21
          Hint = 'Opacidades Parenquimatosas Peque'#241'as Redondeadas, Pulm'#243'n Derecho'
          CharCase = ecUpperCase
          MaxLength = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Alignment = taCenter
          Pattern = 'PQR'
        end
        object edOpacPequRedIzq: TPatternEdit
          Left = 180
          Top = 40
          Width = 20
          Height = 21
          Hint = 
            'Opacidades Parenquimatosas Peque'#241'as Redondeadas, Pulm'#243'n Izquierd' +
            'o'
          CharCase = ecUpperCase
          MaxLength = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Alignment = taCenter
          Pattern = 'PQR'
        end
        object edOpacPequIrregDer: TPatternEdit
          Left = 160
          Top = 64
          Width = 20
          Height = 21
          Hint = 'Opacidades Parenquimatosas Peque'#241'as Irregulares, Pulm'#243'n Derecho'
          CharCase = ecUpperCase
          MaxLength = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Alignment = taCenter
          Pattern = 'STU'
        end
        object edOpacPequIrregIzq: TPatternEdit
          Left = 180
          Top = 64
          Width = 20
          Height = 21
          Hint = 
            'Opacidades Parenquimatosas Peque'#241'as Irregulares, Pulm'#243'n Izquierd' +
            'o'
          CharCase = ecUpperCase
          MaxLength = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Alignment = taCenter
          Pattern = 'STU'
        end
        object pnlOpacGrandes: TPanel
          Left = 8
          Top = 88
          Width = 149
          Height = 21
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' Grandes'
          TabOrder = 10
        end
        object edOpacGrandes: TPatternEdit
          Left = 160
          Top = 88
          Width = 40
          Height = 21
          Hint = 'Opacidades Parenquimatosas Grandes'
          CharCase = ecUpperCase
          MaxLength = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Alignment = taCenter
          Pattern = 'ABC'
        end
        object pnlOpacDerecho: TPanel
          Left = 160
          Top = 16
          Width = 19
          Height = 21
          BevelOuter = bvLowered
          Caption = 'D'
          TabOrder = 11
        end
        object pnlOpacIzquierdo: TPanel
          Left = 181
          Top = 16
          Width = 19
          Height = 21
          BevelOuter = bvLowered
          Caption = 'I'
          TabOrder = 12
        end
        object pnlOpacHeader: TPanel
          Left = 8
          Top = 16
          Width = 149
          Height = 21
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          TabOrder = 13
        end
        object pnlOpacProfusion: TPanel
          Left = 8
          Top = 112
          Width = 149
          Height = 21
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' Profusi'#243'n'
          TabOrder = 6
        end
        object edOpacProfusion: TPatternEdit
          Left = 160
          Top = 112
          Width = 40
          Height = 21
          Hint = 'Profusiones (0/1/2/3)'
          MaxLength = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Alignment = taCenter
          Pattern = '0123'
        end
      end
      object cgOpacPleurales: TCheckGroup
        Left = 215
        Top = 0
        Width = 216
        Height = 107
        Hint = 'Opacidades Pleurales'
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Opacidades Pleurales'
        TabOrder = 1
        Items.Strings = (
          '&Pared costal'
          'Dia&fragma'
          'A&ngulo costofr'#233'nico')
        Value = '000'
      end
      object gbEspirometria: TGroupBox
        Left = 1
        Top = 142
        Width = 210
        Height = 77
        Hint = 'Espirometr'#237'a'
        Caption = 'Espirometr'#237'a'
        TabOrder = 3
        DesignSize = (
          210
          77)
        object Label40: TLabel
          Left = 8
          Top = 20
          Width = 21
          Height = 13
          Caption = '&Tipo'
          FocusControl = cmbEspirometria
        end
        object Label57: TLabel
          Left = 8
          Top = 52
          Width = 29
          Height = 13
          Caption = '&Grado'
          FocusControl = cmbEspiroGrado
        end
        object cmbEspiroGrado: TComboBox
          Left = 100
          Top = 49
          Width = 102
          Height = 21
          Hint = 'Grado de la Espirometr'#237'a (Leve, Moderada o Grave)'
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 1
          TabStop = False
          Items.Strings = (
            'Leve'
            'Moderada'
            'Grave')
        end
        object cmbEspirometria: TImageComboBox
          Left = 100
          Top = 17
          Width = 102
          Height = 21
          Hint = 
            'Tipo de la Espirometr'#237'a (Normal, Obstructiva, Restrictiva o Mixt' +
            'a)'
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 'Normal'
          OnChange = cmbEspirometriaChange
          Items.Strings = (
            'Normal'
            'Obstructiva'
            'Restrictiva'
            'Mixta')
          ItemIndex = 0
        end
      end
      object cgCalcificaciones: TCheckGroup
        Left = 215
        Top = 109
        Width = 216
        Height = 110
        Hint = 'Calcificaciones'
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Calcificaciones'
        TabOrder = 2
        Items.Strings = (
          'Pare&d'
          'D&iafragma'
          '&Otras')
        Value = '000'
      end
    end
    object tsObservaciones: TTabSheet
      Caption = 'Observaciones'
      ImageIndex = 1
      object edObservaciones: TMemo
        Left = 0
        Top = 0
        Width = 427
        Height = 223
        Align = alClient
        MaxLength = 1000
        TabOrder = 0
      end
    end
  end
  object pnlEstudio: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 118
    Align = alTop
    TabOrder = 0
    DesignSize = (
      442
      118)
    object Label6: TLabel
      Left = 8
      Top = 12
      Width = 45
      Height = 13
      Caption = 'Prestador'
    end
    object lbOperativo: TLabel
      Left = 8
      Top = 68
      Width = 46
      Height = 13
      Caption = 'Operativo'
    end
    object Label1: TLabel
      Left = 8
      Top = 40
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label5: TLabel
      Left = 8
      Top = 95
      Width = 92
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F.Recep. Prestador'
      FocusControl = edFechaRPrest
      WordWrap = True
    end
    object Label2: TLabel
      Left = 244
      Top = 95
      Width = 92
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F.Recep. Med.Lab.'
      FocusControl = edFechaRML
      WordWrap = True
    end
    inline fraTipoEstudio: TfraTipoEstudio
      Left = 63
      Top = 35
      Width = 235
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 182
      end
    end
    inline fraPrestador: TfraPrestadorAMP
      Left = 64
      Top = 8
      Width = 370
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 318
      end
      inherited edCodigo: TIntEdit
        Width = 49
      end
    end
    inline fraOperativo: TfraOperativo
      Left = 64
      Top = 64
      Width = 370
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 318
      end
    end
    inline fraReconfirmacion: TfraReconfirmacion
      Left = 300
      Top = 36
      Width = 134
      Height = 22
      Anchors = [akTop, akRight]
      TabOrder = 3
      inherited cmbEstudio: TArtComboBox
        Width = 66
      end
    end
    object edFechaRPrest: TDateComboBox
      Left = 105
      Top = 91
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 4
    end
    object edFechaRML: TDateComboBox
      Left = 345
      Top = 91
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 5
    end
  end
  object btnAceptar: TButton
    Left = 283
    Top = 375
    Width = 75
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 2
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 363
    Top = 375
    Width = 75
    Height = 24
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
end
