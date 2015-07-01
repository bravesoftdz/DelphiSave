inherited frmReservasCuit: TfrmReservasCuit
  Left = 211
  Top = 110
  Caption = 'Reservas de CUIT'
  ClientWidth = 592
  Constraints.MinWidth = 600
  ExplicitWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 196
    Visible = True
    ExplicitWidth = 592
    ExplicitHeight = 196
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 304
      Height = 48
      Caption = ' Canal '
      TabOrder = 0
      inline fraCanalFiltro: TfraCanal
        Tag = 1
        Left = 8
        Top = 16
        Width = 288
        Height = 23
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 288
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Width = 224
          ExplicitLeft = 64
          ExplicitWidth = 224
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
    end
    object GroupBox2: TGroupBox
      Left = 308
      Top = 0
      Width = 284
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Entidad '
      TabOrder = 1
      DesignSize = (
        284
        48)
      inline fraEntidadFiltro: TfraEntidades
        Tag = 1
        Left = 8
        Top = 16
        Width = 268
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 268
        inherited cmbDescripcion: TArtComboBox
          Width = 203
          ExplicitWidth = 203
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 0
      Top = 48
      Width = 484
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Vendedor '
      TabOrder = 2
      DesignSize = (
        484
        48)
      inline fraVendedorFiltro: TfraVendedores
        Tag = 1
        Left = 8
        Top = 16
        Width = 468
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 468
        inherited cmbDescripcion: TArtComboBox
          Width = 403
          ExplicitWidth = 403
        end
      end
    end
    object GroupBox7: TGroupBox
      Left = 488
      Top = 48
      Width = 104
      Height = 48
      Anchors = [akTop, akRight]
      Caption = ' Fecha Vigencia '
      TabOrder = 3
      object dcbFechaVigenciaFiltro: TDateComboBox
        Left = 8
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 0
      Top = 96
      Width = 96
      Height = 48
      Caption = ' CUIT '
      TabOrder = 4
      object meCUITFiltro: TMaskEdit
        Left = 8
        Top = 16
        Width = 81
        Height = 21
        EditMask = '99-99999999-c;0;'
        MaxLength = 13
        TabOrder = 0
        OnExit = meCUITFiltroExit
      end
    end
    object GroupBox5: TGroupBox
      Left = 0
      Top = 144
      Width = 284
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Obervaci'#243'n '
      TabOrder = 7
      DesignSize = (
        284
        48)
      object edObservacionFiltro: TEdit
        Left = 8
        Top = 16
        Width = 268
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        CharCase = ecUpperCase
        TabOrder = 0
        Text = 'EDIT1'
      end
    end
    object GroupBox10: TGroupBox
      Left = 288
      Top = 144
      Width = 304
      Height = 48
      Anchors = [akTop, akRight]
      Caption = ' Usuario Alta '
      TabOrder = 8
      DesignSize = (
        304
        48)
      inline fraUsuarioAltaFiltro: TfraUsuarios
        Left = 8
        Top = 16
        Width = 292
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 292
        inherited cmbDescripcion: TArtComboBox
          Left = 83
          Top = 0
          Width = 205
          ExplicitLeft = 83
          ExplicitTop = 0
          ExplicitWidth = 205
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Top = 0
          Width = 80
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 80
        end
      end
    end
    object GroupBox6: TGroupBox
      Left = 100
      Top = 96
      Width = 208
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Raz'#243'n Social'
      TabOrder = 5
      DesignSize = (
        208
        48)
      object edRazonSocialFiltro: TEdit
        Left = 8
        Top = 16
        Width = 192
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        CharCase = ecUpperCase
        TabOrder = 0
        Text = 'EDIT1'
      end
    end
    object GroupBox8: TGroupBox
      Left = 312
      Top = 96
      Width = 280
      Height = 48
      Anchors = [akTop, akRight]
      Caption = ' Fecha Alta '
      TabOrder = 6
      object Label8: TLabel
        Left = 144
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object Label9: TLabel
        Left = 12
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object edFechaAltaDesde: TDateComboBox
        Left = 48
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaAltaHasta: TDateComboBox
        Left = 176
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 196
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 586
      end>
    ExplicitTop = 196
    ExplicitWidth = 592
    inherited ToolBar: TToolBar
      Width = 579
      ExplicitWidth = 579
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 225
    Width = 592
    Height = 211
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'CANAL'
        Title.Caption = 'Canal'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENTIDAD'
        Title.Caption = 'Entidad'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDEDOR'
        Title.Caption = 'Vendedor'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RU_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RU_RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 247
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTIVIDAD'
        Title.Caption = 'Actividad Principal'
        Width = 151
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RU_FECHADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Desde'
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RU_FECHAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Hasta'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RU_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RU_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RU_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ru_usubaja'
        Title.Caption = 'Usuario Baja'
        Width = 127
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ru_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 90
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 60
    Top = 16
    Width = 472
    Height = 360
    Constraints.MinHeight = 320
    ExplicitLeft = 60
    ExplicitTop = 16
    ExplicitWidth = 472
    ExplicitHeight = 360
    inherited BevelAbm: TBevel
      Top = 324
      Width = 464
      ExplicitTop = 324
      ExplicitWidth = 464
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 21
      Width = 27
      Height = 13
      Caption = 'Canal'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 53
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label20: TLabel [3]
      Left = 8
      Top = 117
      Width = 37
      Height = 13
      Caption = 'C.U.I.T.'
      Layout = tlCenter
    end
    object Label3: TLabel [4]
      Left = 8
      Top = 181
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object Label11: TLabel [5]
      Left = 8
      Top = 213
      Width = 64
      Height = 13
      Caption = 'Fecha Desde'
    end
    object Label4: TLabel [6]
      Left = 8
      Top = 85
      Width = 46
      Height = 13
      Caption = 'Vendedor'
    end
    object Label6: TLabel [7]
      Left = 8
      Top = 245
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label5: TLabel [8]
      Left = 216
      Top = 213
      Width = 64
      Height = 13
      Caption = 'Fecha Hasta:'
    end
    object Label7: TLabel [9]
      Left = 8
      Top = 149
      Width = 63
      Height = 13
      Caption = 'Raz'#243'n Social'
      Layout = tlCenter
    end
    inherited btnAceptar: TButton
      Left = 312
      Top = 330
      Width = 72
      TabOrder = 9
      ExplicitLeft = 312
      ExplicitTop = 330
      ExplicitWidth = 72
    end
    inherited btnCancelar: TButton
      Left = 392
      Top = 330
      Width = 72
      TabOrder = 10
      ExplicitLeft = 392
      ExplicitTop = 330
      ExplicitWidth = 72
    end
    inline fraCanal: TfraCanal
      Left = 96
      Top = 16
      Width = 367
      Height = 23
      TabOrder = 0
      ExplicitLeft = 96
      ExplicitTop = 16
      ExplicitWidth = 367
      inherited cmbDescripcion: TComboGrid
        Left = 64
        Width = 303
        ExplicitLeft = 64
        ExplicitWidth = 303
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
    inline fraEntidad: TfraEntidades
      Left = 95
      Top = 48
      Width = 368
      Height = 23
      TabOrder = 1
      ExplicitLeft = 95
      ExplicitTop = 48
      ExplicitWidth = 368
      inherited cmbDescripcion: TArtComboBox
        Width = 303
        ExplicitWidth = 303
      end
    end
    object meCuit: TMaskEdit
      Left = 95
      Top = 112
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 3
      OnExit = meCuitExit
    end
    inline fraActividad: TfraStaticActividad
      Left = 95
      Top = 176
      Width = 368
      Height = 26
      TabOrder = 5
      ExplicitLeft = 95
      ExplicitTop = 176
      ExplicitWidth = 368
      ExplicitHeight = 26
      inherited cmbDescripcion: TComboGrid
        Left = 64
        Width = 304
        ExplicitLeft = 64
        ExplicitWidth = 304
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
    object dcbFechaVigenciaDesde: TDateComboBox
      Left = 96
      Top = 208
      Width = 88
      Height = 21
      TabOrder = 6
    end
    inline fraVendedor: TfraVendedores
      Left = 95
      Top = 80
      Width = 368
      Height = 23
      TabOrder = 2
      ExplicitLeft = 95
      ExplicitTop = 80
      ExplicitWidth = 368
      inherited cmbDescripcion: TArtComboBox
        Width = 303
        ExplicitWidth = 303
      end
    end
    object memoObservaciones: TMemo
      Left = 96
      Top = 240
      Width = 368
      Height = 72
      Lines.Strings = (
        '111'
        '222'
        '333'
        '444'
        '555'
        '666'
        '777')
      ScrollBars = ssVertical
      TabOrder = 8
    end
    object dcbFechaVigenciaHasta: TDateComboBox
      Left = 288
      Top = 208
      Width = 88
      Height = 21
      TabOrder = 7
    end
    object edRazonSocial: TEdit
      Left = 96
      Top = 144
      Width = 368
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 250
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
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
end
