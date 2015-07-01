inherited fraDomicilioGIS: TfraDomicilioGIS
  Width = 554
  Height = 59
  ExplicitWidth = 554
  ExplicitHeight = 59
  DesignSize = (
    554
    59)
  inherited lbCalle: TLabel
    Left = 24
    Top = 8
    ExplicitLeft = 24
    ExplicitTop = 8
  end
  inherited lbNro: TLabel
    Left = 377
    Top = 8
    Width = 12
    Caption = 'N'#176
    ExplicitLeft = 377
    ExplicitTop = 8
    ExplicitWidth = 12
  end
  inherited lbPiso: TLabel
    Left = 441
    Top = 8
    ExplicitLeft = 441
    ExplicitTop = 8
  end
  inherited lbDto: TLabel
    Left = 493
    Top = 8
    ExplicitLeft = 493
    ExplicitTop = 8
  end
  inherited lbCPostal: TLabel
    Left = 8
    Top = 36
    ExplicitLeft = 8
    ExplicitTop = 36
  end
  inherited lbCPA: TLabel
    Left = 108
    Top = 36
    ExplicitLeft = 108
    ExplicitTop = 36
  end
  inherited lbLocalidad: TLabel
    Left = 216
    Top = 36
    ExplicitLeft = 216
    ExplicitTop = 36
  end
  inherited lbProvincia: TLabel
    Left = 397
    Top = 36
    ExplicitLeft = 397
    ExplicitTop = 36
  end
  inherited cmbCalle: TArtComboBox
    Left = 52
    Top = 4
    Width = 226
    OnChange = cmbCalleChange
    ExplicitLeft = 52
    ExplicitTop = 4
    ExplicitWidth = 226
  end
  inherited edNumero: TEdit
    Left = 393
    Top = 4
    TabOrder = 4
    OnChange = edNumeroChange
    ExplicitLeft = 393
    ExplicitTop = 4
  end
  inherited edPiso: TEdit
    Left = 465
    Top = 4
    Width = 25
    TabOrder = 5
    ExplicitLeft = 465
    ExplicitTop = 4
    ExplicitWidth = 25
  end
  inherited edDto: TEdit
    Left = 517
    Top = 4
    Width = 29
    TabOrder = 6
    ExplicitLeft = 517
    ExplicitTop = 4
    ExplicitWidth = 29
  end
  inherited edCPostal: TIntEdit
    Left = 52
    Top = 32
    TabOrder = 7
    ExplicitLeft = 52
    ExplicitTop = 32
  end
  inherited cmbLocalidad: TArtComboBox
    Left = 268
    Top = 32
    Width = 122
    TabOrder = 9
    ExplicitLeft = 268
    ExplicitTop = 32
    ExplicitWidth = 122
  end
  inherited edProvincia: TEdit
    Left = 445
    Top = 32
    Width = 101
    TabOrder = 10
    ExplicitLeft = 445
    ExplicitTop = 32
    ExplicitWidth = 101
  end
  inherited edCPA: TPatternEdit
    Left = 132
    Top = 32
    TabOrder = 8
    ExplicitLeft = 132
    ExplicitTop = 32
  end
  inherited btnBuscar: TButton
    Left = 93
    Top = 4
    Visible = False
    ExplicitLeft = 93
    ExplicitTop = 4
  end
  object btnBuscarGIS: TAdvGlowButton [17]
    Left = 281
    Top = 4
    Width = 45
    Height = 21
    Hint = 'Permite buscar la direcci'#243'n con mas exactitud, incluyendo el CPA'
    Anchors = [akTop, akRight]
    Caption = 'Buscar'
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnBuscarClick
    Appearance.ColorChecked = 16111818
    Appearance.ColorCheckedTo = 16367008
    Appearance.ColorDisabled = 15921906
    Appearance.ColorDisabledTo = 15921906
    Appearance.ColorDown = 16111818
    Appearance.ColorDownTo = 16367008
    Appearance.ColorHot = 16117985
    Appearance.ColorHotTo = 16372402
    Appearance.ColorMirrorHot = 16107693
    Appearance.ColorMirrorHotTo = 16775412
    Appearance.ColorMirrorDown = 16102556
    Appearance.ColorMirrorDownTo = 16768988
    Appearance.ColorMirrorChecked = 16102556
    Appearance.ColorMirrorCheckedTo = 16768988
    Appearance.ColorMirrorDisabled = 11974326
    Appearance.ColorMirrorDisabledTo = 15921906
  end
  object btnMapaGIS: TAdvGlowButton [18]
    Left = 327
    Top = 4
    Width = 45
    Height = 21
    Hint = 'Despliega el mapa para poder ubicar el domicilio en el mismo'
    Anchors = [akTop, akRight]
    Caption = 'Mapa'
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnMapaGISClick
    Appearance.ColorChecked = 16111818
    Appearance.ColorCheckedTo = 16367008
    Appearance.ColorDisabled = 15921906
    Appearance.ColorDisabledTo = 15921906
    Appearance.ColorDown = 16111818
    Appearance.ColorDownTo = 16367008
    Appearance.ColorHot = 16117985
    Appearance.ColorHotTo = 16372402
    Appearance.ColorMirrorHot = 16107693
    Appearance.ColorMirrorHotTo = 16775412
    Appearance.ColorMirrorDown = 16102556
    Appearance.ColorMirrorDownTo = 16768988
    Appearance.ColorMirrorChecked = 16102556
    Appearance.ColorMirrorCheckedTo = 16768988
    Appearance.ColorMirrorDisabled = 11974326
    Appearance.ColorMirrorDisabledTo = 15921906
  end
  object fpGIS: TFormPanel [19]
    Left = 44
    Top = 108
    Width = 760
    Height = 540
    Caption = 'GIS - Sistema de Informaci'#243'n Geogr'#225'fica'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poScreenCenter
    OnShow = fpGISShow
    Constraints.MinHeight = 540
    Constraints.MinWidth = 760
    DesignSize = (
      760
      540)
    object btnCerrar: TAdvGlowButton
      Left = 687
      Top = 499
      Width = 45
      Height = 21
      Hint = 'Cerrar la ventana de los MAPAS'
      Anchors = [akRight, akBottom]
      Caption = 'Cerrar'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnCerrarClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnBuscarEnMapa: TAdvGlowButton
      Left = 639
      Top = 499
      Width = 45
      Height = 21
      Hint = 
        'Muestra los controles de b'#250'squeda para ajustar la ubicaci'#243'n del ' +
        'domicilio '#13#10'(el mapa es una referencia, no le va a modificar nin' +
        'guna direcci'#243'n autom'#225'ticamente)'
      Anchors = [akRight, akBottom]
      Caption = 'Buscar'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnBuscarEnMapaClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  inherited sdqLocalidad: TSDQuery
    Left = 8
    Top = 64
  end
  inherited dsLocalidad: TDataSource
    Left = 36
    Top = 64
  end
  object TimerCuelgue: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = TimerCuelgueTimer
    Left = 64
    Top = 64
  end
end
