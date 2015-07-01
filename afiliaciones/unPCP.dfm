inherited frmPCP: TfrmPCP
  Caption = 'Afiliaci'#243'n Personal Casas Particulares'
  ClientHeight = 634
  ClientWidth = 635
  Constraints.MaxWidth = 643
  Constraints.MinWidth = 643
  FormStyle = fsNormal
  Position = poDesktopCenter
  Visible = False
  OnMouseWheel = FSFormMouseWheel
  OnShow = FSFormShow
  ExplicitWidth = 643
  ExplicitHeight = 664
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Width = 635
    Height = 1
    Visible = False
    ExplicitWidth = 635
    ExplicitHeight = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 635
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 629
      end>
    ExplicitTop = 1
    ExplicitWidth = 635
    inherited ToolBar: TToolBar
      Width = 622
      ExplicitWidth = 622
      inherited tbNuevo: TToolButton
        ImageIndex = 6
        Visible = False
        ExplicitWidth = 23
      end
      inherited tbModificar: TToolButton
        ImageIndex = 7
        Visible = False
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 8
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 1
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 30
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 5
      end
    end
  end
  inherited pnlDatos: TPanel
    Width = 634
    Height = 527
    ExplicitWidth = 634
    ExplicitHeight = 527
  end
  inherited btnAceptar: TButton
    Left = 459
    Top = 601
    ExplicitLeft = 459
    ExplicitTop = 601
  end
  inherited btnCancelar: TButton
    Left = 540
    Top = 601
    ExplicitLeft = 540
    ExplicitTop = 601
  end
  inherited btnAplicar: TButton
    Left = 378
    Top = 601
    ExplicitLeft = 378
    ExplicitTop = 601
  end
  object ScrollBox1: TScrollBox [6]
    Left = 0
    Top = 30
    Width = 635
    Height = 547
    VertScrollBar.Position = 544
    VertScrollBar.Range = 1100
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoScroll = False
    TabOrder = 6
    object GroupBox1: TGroupBox
      Left = 0
      Top = -544
      Width = 614
      Height = 1100
      Align = alClient
      Caption = 'Descripci'#243'n de Tareas y Riesgos Laborales'
      TabOrder = 0
      object cboxInstalacionesEdilicias: TGroupBox
        Left = 9
        Top = 730
        Width = 600
        Height = 192
        Caption = 'Instalaciones Edilicias'
        TabOrder = 5
        DesignSize = (
          600
          192)
        object Label1: TLabel
          Left = 7
          Top = 20
          Width = 292
          Height = 13
          Caption = 'Indique cu'#225'les de las siguientes situaciones posee la vivienda'
        end
        object Bevel1: TBevel
          Left = 3
          Top = 38
          Width = 593
          Height = 6
          Anchors = [akLeft, akRight]
          ExplicitTop = 36
          ExplicitWidth = 476
        end
        object Label5: TLabel
          Left = 317
          Top = 86
          Width = 44
          Height = 13
          Caption = #191'Cu'#225'les?'
        end
        object Label6: TLabel
          Left = 317
          Top = 125
          Width = 44
          Height = 13
          Caption = #191'Cu'#225'les?'
        end
        object Label24: TLabel
          Left = 12
          Top = 50
          Width = 152
          Height = 13
          Caption = 'Protecci'#243'n en Losas y Balcones'
        end
        object Label25: TLabel
          Left = 12
          Top = 89
          Width = 197
          Height = 27
          Caption = 'Realizan tareas interiores en altura, a m'#225's de 2.00 mts.'
          WordWrap = True
        end
        object Label26: TLabel
          Left = 12
          Top = 122
          Width = 222
          Height = 32
          Caption = 
            'Realizan tareas exteriores en altura, a m'#225's de 2.00 mts. (Fachad' +
            'as y frentes/contra-frentes)'
          WordWrap = True
        end
        object Label27: TLabel
          Left = 12
          Top = 160
          Width = 114
          Height = 13
          Caption = 'Escaleras con barandas'
        end
        object edTareasInteriores: TEdit
          Left = 367
          Top = 83
          Width = 220
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 'edTareasInteriores'
        end
        object edTareasExteriores: TEdit
          Left = 367
          Top = 122
          Width = 220
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Text = 'edTareasExteriores'
        end
        object Panel11: TPanel
          Left = 235
          Top = 50
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 2
          object rbProteccionEnLosasSi: TRadioButton
            Tag = 2
            Left = 0
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbProteccionEnLosasNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel12: TPanel
          Left = 235
          Top = 85
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 3
          object rbTareasInterioresSi: TRadioButton
            Tag = 2
            Left = 0
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbTareasInterioresNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel13: TPanel
          Left = 235
          Top = 122
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 4
          object rbTareasExterioresSi: TRadioButton
            Tag = 2
            Left = 0
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbTareasExterioresNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel14: TPanel
          Left = 235
          Top = 159
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 5
          object rbEscalerasConBarandasSi: TRadioButton
            Tag = 2
            Left = 0
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbEscalerasConBarandasNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
      end
      object cboxRiesgoQuimico: TGroupBox
        Left = 11
        Top = 403
        Width = 600
        Height = 321
        Caption = 'Riesgo Qu'#237'mico'
        TabOrder = 4
        DesignSize = (
          600
          321)
        object Label3: TLabel
          Left = 7
          Top = 20
          Width = 251
          Height = 13
          Caption = 'Indique qu'#233' elementos qu'#237'micos utiliza habitualmente'
        end
        object Bevel2: TBevel
          Left = 3
          Top = 36
          Width = 593
          Height = 6
          Anchors = [akLeft, akRight]
          ExplicitWidth = 476
        end
        object Label4: TLabel
          Left = 278
          Top = 84
          Width = 44
          Height = 13
          Caption = #191'Cu'#225'les?'
        end
        object Label2: TLabel
          Left = 278
          Top = 50
          Width = 44
          Height = 13
          Caption = #191'Cu'#225'les?'
        end
        object Otros: TLabel
          Left = 39
          Top = 228
          Width = 25
          Height = 13
          Caption = 'Otros'
        end
        object Label14: TLabel
          Left = 10
          Top = 50
          Width = 56
          Height = 13
          Caption = 'Insecticidas'
        end
        object Label15: TLabel
          Left = 10
          Top = 69
          Width = 39
          Height = 13
          Caption = 'Bencina'
        end
        object Label16: TLabel
          Left = 10
          Top = 87
          Width = 44
          Height = 13
          Caption = 'Raticidas'
        end
        object Label17: TLabel
          Left = 10
          Top = 104
          Width = 71
          Height = 13
          Caption = 'Desinfectantes'
        end
        object Label18: TLabel
          Left = 10
          Top = 122
          Width = 58
          Height = 13
          Caption = 'Detergentes'
        end
        object Label19: TLabel
          Left = 10
          Top = 139
          Width = 68
          Height = 13
          Caption = 'Soda c'#225'ustica'
        end
        object Label20: TLabel
          Left = 10
          Top = 156
          Width = 77
          Height = 13
          Caption = 'Desengrasantes'
        end
        object Label21: TLabel
          Left = 10
          Top = 173
          Width = 166
          Height = 13
          Caption = 'Hipoclorito de sodio (Lavandina)'
          WordWrap = True
        end
        object Label22: TLabel
          Left = 10
          Top = 191
          Width = 49
          Height = 13
          Caption = 'Amon'#237'aco'
        end
        object Label23: TLabel
          Left = 10
          Top = 208
          Width = 123
          Height = 13
          Caption = 'Acido clorhidrico muriatico'
        end
        object edInsecticidas: TEdit
          Left = 328
          Top = 47
          Width = 257
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 'Edit1'
        end
        object edRaticidas: TEdit
          Left = 328
          Top = 81
          Width = 257
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Text = 'Edit1'
        end
        object edOtrosQuimicos: TMemo
          Left = 39
          Top = 245
          Width = 546
          Height = 59
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'edOtrosQuimicos')
          TabOrder = 2
        end
        object Panel1: TPanel
          Left = 190
          Top = 49
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 3
          object rbInsecticidaSi: TRadioButton
            Tag = 2
            Left = 3
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbInsecticidaNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel2: TPanel
          Left = 190
          Top = 68
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 4
          object rbBencinaSi: TRadioButton
            Tag = 2
            Left = 3
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbBencinaNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel3: TPanel
          Left = 190
          Top = 86
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 5
          object rbRaticidaSi: TRadioButton
            Tag = 2
            Left = 3
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbRaticidaNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel4: TPanel
          Left = 190
          Top = 103
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 6
          object rbDesinfectanteSi: TRadioButton
            Tag = 2
            Left = 3
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbDesinfectanteNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel5: TPanel
          Left = 190
          Top = 121
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 7
          object rbDetergenteSi: TRadioButton
            Tag = 2
            Left = 3
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbDetergenteNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel6: TPanel
          Left = 190
          Top = 138
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 8
          object rbSodaCausticaSi: TRadioButton
            Tag = 2
            Left = 3
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbSodaCausticaNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel7: TPanel
          Left = 190
          Top = 155
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 9
          object rbDesengrasanteSi: TRadioButton
            Tag = 2
            Left = 3
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbDesengrasanteNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel8: TPanel
          Left = 190
          Top = 172
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 10
          object rbHipocloritoDeSodioSi: TRadioButton
            Tag = 2
            Left = 3
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbHipocloritoDeSodioNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel9: TPanel
          Left = 190
          Top = 190
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 11
          object rbAmoniacoSi: TRadioButton
            Tag = 2
            Left = 3
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbAmoniacoNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel10: TPanel
          Left = 190
          Top = 207
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 12
          object rbAcidoClorhidricoMuriaticoSi: TRadioButton
            Tag = 2
            Left = 3
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbAcidoClorhidricoMuriaticoNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
      end
      object cboxRopa: TGroupBox
        Left = 9
        Top = 925
        Width = 600
        Height = 138
        Caption = 'Ropa y Elementos de Trabajo'
        TabOrder = 6
        DesignSize = (
          600
          138)
        object Label7: TLabel
          Left = 317
          Top = 34
          Width = 44
          Height = 13
          Caption = #191'Cu'#225'les?'
        end
        object Label8: TLabel
          Left = 317
          Top = 90
          Width = 44
          Height = 13
          Caption = #191'Cu'#225'les?'
        end
        object Label28: TLabel
          Left = 3
          Top = 34
          Width = 206
          Height = 41
          Caption = 
            'Entrega Indumentaria de trabajo (Ejemplo: calzado, delantal, pan' +
            'tal'#243'n, camisa, vestido, etc.)'
          WordWrap = True
        end
        object Label29: TLabel
          Left = 3
          Top = 90
          Width = 206
          Height = 26
          Caption = 
            'Entrega de Elementos de protecci'#243'n personal. (Ejemplo: Guantes, ' +
            'etc.)'
          WordWrap = True
        end
        object edIndumentaria: TEdit
          Left = 367
          Top = 31
          Width = 220
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 'edIndumentaria'
        end
        object edProteccionPersonal: TEdit
          Left = 367
          Top = 87
          Width = 220
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Text = 'edIndumentaria'
        end
        object Panel15: TPanel
          Left = 235
          Top = 34
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 2
          object rbIndumentariaSi: TRadioButton
            Tag = 2
            Left = 0
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbIndumentariaNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
        object Panel16: TPanel
          Left = 235
          Top = 89
          Width = 76
          Height = 16
          BevelOuter = bvNone
          TabOrder = 3
          object rbProteccionPersonalSi: TRadioButton
            Tag = 2
            Left = 0
            Top = 0
            Width = 32
            Height = 17
            Caption = 'S'#237
            TabOrder = 0
          end
          object rbProteccionPersonalNo: TRadioButton
            Tag = 2
            Left = 38
            Top = 0
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbExtintorNoClick
          end
        end
      end
      object gboxDescripcionTareas: TGroupBox
        Left = 9
        Top = 99
        Width = 600
        Height = 105
        Caption = 'Breve descripci'#243'n de las tareas'
        TabOrder = 1
        object edDescripcionTareas: TMemo
          Left = 8
          Top = 22
          Width = 579
          Height = 72
          Lines.Strings = (
            'edDescripcionTareas')
          TabOrder = 0
        end
      end
      object gboxRiesgoElectrico: TGroupBox
        Left = 9
        Top = 206
        Width = 600
        Height = 53
        Caption = 'Riesgo El'#233'ctrico'
        TabOrder = 2
        object Label12: TLabel
          Left = 40
          Top = 24
          Width = 344
          Height = 13
          Caption = 
            'Posee sistema de protecci'#243'n para las personas en la instalaci'#243'n ' +
            'el'#233'ctrica'
        end
        object rbProteccionElectricaSi: TRadioButton
          Left = 410
          Top = 24
          Width = 32
          Height = 17
          Caption = 'S'#237
          TabOrder = 0
        end
        object rbProteccionElectricaNo: TRadioButton
          Left = 448
          Top = 24
          Width = 33
          Height = 17
          Caption = 'No'
          TabOrder = 1
        end
      end
      object gboxRiesgoIncendio: TGroupBox
        Left = 9
        Top = 264
        Width = 600
        Height = 141
        Caption = 'Riesgo de Incendio'
        TabOrder = 3
        object Label13: TLabel
          Left = 40
          Top = 25
          Width = 229
          Height = 13
          Caption = 'Posee alg'#250'n dispositivo de extinci'#243'n de incendio'
        end
        object gboxExtintorDeIncendio: TGroupBox
          Left = 39
          Top = 44
          Width = 548
          Height = 85
          Caption = 'Indique cu'#225'l'
          TabOrder = 0
          object Label9: TLabel
            Left = 19
            Top = 51
            Width = 25
            Height = 13
            Caption = 'Otros'
          end
          object edOtrosExtintores: TEdit
            Left = 63
            Top = 48
            Width = 433
            Height = 21
            TabOrder = 3
            Text = 'edOtrosExtintores'
          end
          object rbExtintorPortatil: TRadioButton
            Left = 41
            Top = 16
            Width = 113
            Height = 17
            Caption = 'Extintor port'#225'til CO2'
            TabOrder = 0
          end
          object rbExtintorTriclase: TRadioButton
            Left = 191
            Top = 16
            Width = 162
            Height = 17
            Caption = 'Extintor triclase polvo qu'#237'mico'
            TabOrder = 1
          end
          object rbExtintorDeAgua: TRadioButton
            Left = 393
            Top = 16
            Width = 113
            Height = 17
            Caption = 'Extintor de agua'
            TabOrder = 2
          end
        end
        object rbExtintorSi: TRadioButton
          Left = 410
          Top = 24
          Width = 32
          Height = 17
          Caption = 'S'#237
          TabOrder = 1
        end
        object rbExtintorNo: TRadioButton
          Left = 448
          Top = 24
          Width = 33
          Height = 17
          Caption = 'No'
          TabOrder = 2
          OnClick = rbExtintorNoClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 9
        Top = 26
        Width = 600
        Height = 71
        TabOrder = 0
        object Label10: TLabel
          Left = 10
          Top = 19
          Width = 63
          Height = 13
          Caption = 'Raz'#243'n Social'
        end
        object Label11: TLabel
          Left = 10
          Top = 46
          Width = 49
          Height = 13
          Caption = 'Nro. Form.'
        end
        object lbContrato: TLabel
          Left = 240
          Top = 46
          Width = 40
          Height = 13
          Caption = 'Contrato'
        end
        object edRazonSocial: TEdit
          Left = 79
          Top = 16
          Width = 506
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edFormulario: TEdit
          Left = 79
          Top = 43
          Width = 130
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object edContrato: TEdit
          Left = 286
          Top = 43
          Width = 121
          Height = 21
          TabOrder = 2
          Text = 'edContrato'
        end
      end
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
      end>
    Left = 320
  end
  inherited Seguridad: TSeguridad
    AutoEjecutar = False
    Left = 408
  end
  inherited FormStorage: TFormStorage
    Left = 292
  end
  inherited sdqConsulta: TSDQuery
    Left = 348
  end
  inherited dsConsulta: TDataSource
    Left = 376
  end
end
