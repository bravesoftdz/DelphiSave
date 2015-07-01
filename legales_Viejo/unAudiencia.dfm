inherited frmAudiencia: TfrmAudiencia
  Left = 244
  Top = 30
  Caption = 'Audiencia'
  ClientHeight = 655
  ClientWidth = 894
  ExplicitWidth = 902
  ExplicitHeight = 685
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 894
    Height = 164
    Visible = True
    ExplicitWidth = 894
    ExplicitHeight = 164
    object Label11: TLabel
      Left = 16
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Juicio'
    end
    object Label12: TLabel
      Left = 17
      Top = 83
      Width = 82
      Height = 13
      Caption = 'Fecha audiencia:'
    end
    object Label13: TLabel
      Left = 390
      Top = 83
      Width = 23
      Height = 13
      Caption = 'Hora'
    end
    object Label14: TLabel
      Left = 17
      Top = 32
      Width = 66
      Height = 13
      Caption = 'P Interno Asig'
    end
    object Label15: TLabel
      Left = 480
      Top = 6
      Width = 38
      Height = 13
      Caption = 'Estudio:'
    end
    object Label16: TLabel
      Left = 478
      Top = 58
      Width = 61
      Height = 13
      Caption = 'Fecha Carga'
    end
    object Label18: TLabel
      Left = 480
      Top = 34
      Width = 40
      Height = 13
      Caption = 'Analista:'
    end
    object Label19: TLabel
      Left = 16
      Top = 56
      Width = 57
      Height = 13
      Caption = 'T.Audiencia'
    end
    object Label20: TLabel
      Left = 107
      Top = 83
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object lbHasta: TLabel
      Left = 243
      Top = 83
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label21: TLabel
      Left = 547
      Top = 83
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label22: TLabel
      Left = 427
      Top = 83
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    inline fraJuicioFiltro: TfraCodigoDescripcion
      Left = 98
      Top = 3
      Width = 363
      Height = 22
      TabOrder = 0
      ExplicitLeft = 98
      ExplicitTop = 3
      ExplicitWidth = 363
      ExplicitHeight = 22
      inherited cmbDescripcion: TArtComboBox
        Width = 298
        ExplicitWidth = 298
      end
    end
    object edFechaAudienciaDesdeFiltro: TDateComboBox
      Left = 146
      Top = 79
      Width = 88
      Height = 21
      Weekends = [Sun, Sat]
      TabOrder = 6
    end
    object edHoraDesdeFiltro: TDateTimePicker
      Left = 466
      Top = 79
      Width = 68
      Height = 21
      Date = 37372.000000000000000000
      Time = 37372.000000000000000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 8
    end
    inline fraPInternoAsigFiltro: TfraCodigoDescripcion
      Left = 98
      Top = 28
      Width = 363
      Height = 23
      TabOrder = 2
      ExplicitLeft = 98
      ExplicitTop = 28
      ExplicitWidth = 363
      inherited cmbDescripcion: TArtComboBox
        Width = 298
        ExplicitWidth = 298
      end
    end
    inline fraEstudioFiltro: TfraCodigoDescripcion
      Left = 530
      Top = 3
      Width = 363
      Height = 22
      TabOrder = 1
      ExplicitLeft = 530
      ExplicitTop = 3
      ExplicitWidth = 363
      ExplicitHeight = 22
      inherited cmbDescripcion: TArtComboBox
        Width = 298
        ExplicitWidth = 298
      end
    end
    inline fraDatosJuzgadoFiltro: TfraJuzgados
      Left = 14
      Top = 101
      Width = 876
      Height = 62
      TabOrder = 10
      ExplicitLeft = 14
      ExplicitTop = 101
      ExplicitWidth = 876
      ExplicitHeight = 62
      inherited gbJuzgados: TGroupBox
        Left = 0
        Top = 0
        Width = 876
        Height = 62
        Align = alClient
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 876
        ExplicitHeight = 62
        DesignSize = (
          876
          62)
        inherited lblFuero: TLabel
          Width = 30
          ExplicitWidth = 30
        end
        inherited lblJuzgado: TLabel
          Width = 63
          ExplicitWidth = 63
        end
        inherited lblInstancia: TLabel
          Width = 46
          ExplicitWidth = 46
        end
        inherited lblExpediente: TLabel
          Width = 39
          ExplicitWidth = 39
        end
        inherited lblFechaIngreso: TLabel
          Width = 47
          ExplicitWidth = 47
        end
        inherited Label1: TLabel
          Width = 5
          ExplicitWidth = 5
        end
        inherited fraFuero: TfraCodigoDescripcionExt
          Width = 521
          ExplicitWidth = 521
          DesignSize = (
            521
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 456
            ExplicitWidth = 456
          end
        end
        inherited fraSecretaria: TfraCodigoDescripcionExt
          Width = 520
          ExplicitWidth = 520
          DesignSize = (
            520
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 455
            ExplicitWidth = 455
          end
        end
        inherited fpMasDatosJuzgado: TFormPanel
          inherited pgMasDatosJuzgado: TPageControl
            inherited tsSede: TTabSheet
              ExplicitLeft = 4
              ExplicitTop = 24
              ExplicitWidth = 445
              ExplicitHeight = 111
              inherited lblDomicilioJuzgado: TLabel
                Width = 45
                ExplicitWidth = 45
              end
              inherited lblTelefonoJuzgado: TLabel
                Width = 50
                ExplicitWidth = 50
              end
              inherited lblFaxJuzgado: TLabel
                Width = 20
                ExplicitWidth = 20
              end
              inherited lblLocJuzgado: TLabel
                Width = 49
                ExplicitWidth = 49
              end
            end
          end
        end
        inherited dteFechaIngreso: TDateComboBox
          ErrorMessage = 
            'La fecha debe ser mayor o igual que la fecha de inicio del juici' +
            'o'
          DialogTitle = 'Seleccione una fecha.'
          Weekends = [Sun, Sat]
        end
      end
      inherited sdqJuzgado: TSDQuery
        DataSource = fraDatosJuzgado.fraJuzgado.dsDatos
      end
    end
    object edFechaCargaFiltro: TDateComboBox
      Left = 546
      Top = 54
      Width = 88
      Height = 21
      Weekends = [Sun, Sat]
      TabOrder = 5
    end
    inline fraAnalistaFiltro: TfraCodigoDescripcion
      Left = 530
      Top = 29
      Width = 362
      Height = 23
      TabOrder = 3
      ExplicitLeft = 530
      ExplicitTop = 29
      ExplicitWidth = 362
      inherited cmbDescripcion: TArtComboBox
        Width = 297
        ExplicitWidth = 297
      end
    end
    inline fraTipoAudienciaFiltro: TfraCodigoDescripcion
      Left = 98
      Top = 52
      Width = 362
      Height = 23
      TabOrder = 4
      ExplicitLeft = 98
      ExplicitTop = 52
      ExplicitWidth = 362
      inherited cmbDescripcion: TArtComboBox
        Width = 297
        ExplicitWidth = 297
      end
    end
    object edFechaAudienciaHastaFiltro: TDateComboBox
      Left = 285
      Top = 79
      Width = 88
      Height = 21
      Weekends = [Sun, Sat]
      TabOrder = 7
    end
    object edHoraHastaFiltro: TDateTimePicker
      Left = 586
      Top = 79
      Width = 68
      Height = 21
      Date = 37372.000000000000000000
      Time = 37372.000000000000000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 9
    end
  end
  inherited CoolBar: TCoolBar
    Top = 164
    Width = 894
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 890
      end>
    ExplicitTop = 164
    ExplicitWidth = 894
    inherited ToolBar: TToolBar
      Width = 881
      ExplicitWidth = 881
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Caption = 'ToolButton1'
        ImageIndex = 6
        Visible = False
        OnClick = ToolButton1Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 193
    Width = 894
    Height = 462
    Columns = <
      item
        Expanded = False
        FieldName = 'AU_NROAUDIENCIA'
        Title.Caption = 'Nro Audiencia'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JT_NUMEROCARPETA'
        Title.Caption = 'N'#250'mero Carpeta'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARATULA'
        Title.Caption = 'Car'#225'tula'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTUDIO'
        Title.Caption = 'Estudio'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCION'
        Title.Caption = 'Tipo Audiencia'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHAAUDIENCIA'
        Title.Caption = 'Fecha Audiencia'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHANOTIFICACION'
        Title.Caption = 'Fecha Notificaci'#243'n'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_HORA'
        Title.Caption = 'Hora'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_USUARIO'
        Title.Caption = 'P Interno Asignado'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_OBSERVACION'
        Title.Caption = 'Observaci'#243'n'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHAALTA'
        Title.Caption = 'Fecha de Carga'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_USUALTA'
        Title.Caption = 'Usuario de Carga'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JU_DESCRIPCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FU_DESCRIPCION'
        Title.Caption = 'Fuero'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JZ_DESCRIPCION'
        Title.Caption = 'Juzgado'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Secretaria'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JZ_DIRECCION'
        Title.Caption = 'Direcci'#243'n Juzgado'
        Width = 99
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 52
    Top = 40
    Width = 797
    Height = 562
    ExplicitLeft = 52
    ExplicitTop = 40
    ExplicitWidth = 797
    ExplicitHeight = 562
    inherited BevelAbm: TBevel
      Top = 526
      Width = 789
      ExplicitTop = 526
      ExplicitWidth = 789
    end
    object Label1: TLabel [1]
      Left = 16
      Top = 40
      Width = 27
      Height = 13
      Caption = 'Juicio'
    end
    object Label2: TLabel [2]
      Left = 16
      Top = 64
      Width = 61
      Height = 13
      Caption = 'Demandante'
    end
    object lbDemandante: TLabel [3]
      Left = 90
      Top = 64
      Width = 61
      Height = 13
      Caption = 'Demandante'
    end
    object Label3: TLabel [4]
      Left = 16
      Top = 176
      Width = 35
      Height = 13
      Caption = 'Estudio'
    end
    object lbEstudio: TLabel [5]
      Left = 90
      Top = 176
      Width = 35
      Height = 13
      Caption = 'Estudio'
    end
    object Label4: TLabel [6]
      Left = 16
      Top = 208
      Width = 57
      Height = 13
      Caption = 'T.Audiencia'
    end
    object Label5: TLabel [7]
      Left = 422
      Top = 208
      Width = 31
      Height = 13
      Caption = 'F.Notif'
    end
    object Label6: TLabel [8]
      Left = 16
      Top = 232
      Width = 56
      Height = 13
      Caption = 'F.Audiencia'
    end
    object Label7: TLabel [9]
      Left = 420
      Top = 232
      Width = 23
      Height = 13
      Caption = 'Hora'
    end
    object Label8: TLabel [10]
      Left = 16
      Top = 256
      Width = 66
      Height = 13
      Caption = 'P Interno Asig'
    end
    object Label9: TLabel [11]
      Left = 16
      Top = 280
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    object Label17: TLabel [12]
      Left = 419
      Top = 256
      Width = 40
      Height = 13
      Caption = 'Analista:'
    end
    object lblCarpeta: TLabel [13]
      Left = 16
      Top = 13
      Width = 70
      Height = 13
      Caption = 'Nro Audiencia:'
    end
    object Label23: TLabel [14]
      Left = 224
      Top = 13
      Width = 48
      Height = 13
      Caption = 'Siniestros:'
    end
    inherited btnAceptar: TButton
      Left = 639
      Top = 532
      Caption = '&Guardar'
      TabOrder = 12
      ExplicitLeft = 639
      ExplicitTop = 532
    end
    inherited btnCancelar: TButton
      Left = 717
      Top = 532
      TabOrder = 13
      OnClick = btnCancelarClick
      ExplicitLeft = 717
      ExplicitTop = 532
    end
    inline fraJuicio: TfraCodigoDescripcion
      Left = 90
      Top = 35
      Width = 363
      Height = 22
      TabOrder = 0
      ExplicitLeft = 90
      ExplicitTop = 35
      ExplicitWidth = 363
      ExplicitHeight = 22
      inherited cmbDescripcion: TArtComboBox
        Width = 298
        ExplicitWidth = 298
      end
    end
    inline fraDatosJuzgado: TfraJuzgados
      Left = 6
      Top = 80
      Width = 788
      Height = 91
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 6
      ExplicitTop = 80
      ExplicitWidth = 788
      ExplicitHeight = 91
      inherited gbJuzgados: TGroupBox
        Left = 0
        Top = 0
        Width = 788
        Height = 91
        Align = alClient
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 788
        ExplicitHeight = 91
        DesignSize = (
          788
          91)
        inherited lblFuero: TLabel
          Width = 30
          ExplicitWidth = 30
        end
        inherited lblJuzgado: TLabel
          Width = 63
          ExplicitWidth = 63
        end
        inherited lblInstancia: TLabel
          Width = 46
          ExplicitWidth = 46
        end
        inherited lblExpediente: TLabel
          Width = 39
          ExplicitWidth = 39
        end
        inherited lblFechaIngreso: TLabel
          Width = 47
          ExplicitWidth = 47
        end
        inherited Label1: TLabel
          Width = 5
          ExplicitWidth = 5
        end
        inherited fraFuero: TfraCodigoDescripcionExt
          Width = 433
          ExplicitWidth = 433
          DesignSize = (
            433
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 368
            ExplicitWidth = 368
          end
        end
        inherited fraSecretaria: TfraCodigoDescripcionExt
          Width = 432
          ExplicitWidth = 432
          DesignSize = (
            432
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 367
            ExplicitWidth = 367
          end
        end
        inherited btnMasDatosJuzgado: TBitBtn
          OnClick = fraDatosJuzgadobtnMasDatosJuzgadoClick
        end
        inherited fpMasDatosJuzgado: TFormPanel
          inherited pgMasDatosJuzgado: TPageControl
            inherited tsSede: TTabSheet
              ExplicitLeft = 4
              ExplicitTop = 24
              ExplicitWidth = 445
              ExplicitHeight = 111
              inherited lblDomicilioJuzgado: TLabel
                Width = 45
                ExplicitWidth = 45
              end
              inherited lblTelefonoJuzgado: TLabel
                Width = 50
                ExplicitWidth = 50
              end
              inherited lblFaxJuzgado: TLabel
                Width = 20
                ExplicitWidth = 20
              end
              inherited lblLocJuzgado: TLabel
                Width = 49
                ExplicitWidth = 49
              end
            end
          end
        end
        inherited dteFechaIngreso: TDateComboBox
          ErrorMessage = 
            'La fecha debe ser mayor o igual que la fecha de inicio del juici' +
            'o'
          DialogTitle = 'Seleccione una fecha.'
          Weekends = [Sun, Sat]
        end
      end
      inherited sdqJuzgado: TSDQuery
        DataSource = fraDatosJuzgado.fraJuzgado.dsDatos
      end
    end
    inline fraTipoAudiencia: TfraCodigoDescripcion
      Left = 90
      Top = 203
      Width = 310
      Height = 23
      TabOrder = 2
      ExplicitLeft = 90
      ExplicitTop = 203
      ExplicitWidth = 310
      inherited cmbDescripcion: TArtComboBox
        Width = 245
        ExplicitWidth = 245
      end
    end
    object edFechaAudiencia: TDateComboBox
      Left = 92
      Top = 228
      Width = 88
      Height = 21
      Weekends = [Sun, Sat]
      TabOrder = 4
    end
    object edHora: TDateTimePicker
      Left = 478
      Top = 228
      Width = 68
      Height = 21
      Date = 37372.000000000000000000
      Time = 37372.000000000000000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 5
    end
    inline fraPInternoAsig: TfraCodigoDescripcion
      Left = 90
      Top = 252
      Width = 311
      Height = 23
      TabOrder = 6
      ExplicitLeft = 90
      ExplicitTop = 252
      ExplicitWidth = 311
      inherited cmbDescripcion: TArtComboBox
        Width = 246
        ExplicitWidth = 246
      end
    end
    object edObservacion: TMemo
      Left = 90
      Top = 277
      Width = 697
      Height = 31
      MaxLength = 400
      TabOrder = 8
    end
    object gbPericias: TGroupBox
      Left = 8
      Top = 312
      Width = 444
      Height = 68
      Caption = 'Pericia'
      TabOrder = 9
      object cbPC: TCheckBox
        Left = 16
        Top = 18
        Width = 46
        Height = 17
        Alignment = taLeftJustify
        Caption = 'PC'
        TabOrder = 0
      end
      object cbPM: TCheckBox
        Left = 16
        Top = 42
        Width = 46
        Height = 17
        Alignment = taLeftJustify
        Caption = 'PM'
        TabOrder = 1
      end
      object cbPAS: TCheckBox
        Left = 152
        Top = 18
        Width = 58
        Height = 17
        Alignment = taLeftJustify
        Caption = 'PAS'
        TabOrder = 2
      end
      object cbPP: TCheckBox
        Left = 152
        Top = 42
        Width = 57
        Height = 17
        Alignment = taLeftJustify
        Caption = 'PP'
        TabOrder = 3
      end
      object cbPT: TCheckBox
        Left = 304
        Top = 18
        Width = 58
        Height = 17
        Alignment = taLeftJustify
        Caption = 'PT'
        TabOrder = 4
      end
      object cbPO: TCheckBox
        Left = 304
        Top = 42
        Width = 57
        Height = 17
        Alignment = taLeftJustify
        Caption = 'PO'
        TabOrder = 5
      end
    end
    object PageControl: TPageControl
      Left = 8
      Top = 384
      Width = 780
      Height = 136
      ActivePage = tbTestigos
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 10
      object tbEventos: TTabSheet
        Caption = 'Eventos'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cbEventos: TCoolBar
          Left = 0
          Top = 0
          Width = 772
          Height = 29
          Bands = <
            item
              Control = tbrEventos
              ImageIndex = -1
              MinHeight = 27
              Width = 768
            end>
          object tbrEventos: TToolBar
            Left = 9
            Top = 0
            Width = 755
            Height = 27
            BorderWidth = 1
            Caption = ' '
            HotImages = dmLegales.ilByN
            Images = dmLegales.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbNuevoEvento: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo'
              ImageIndex = 6
              OnClick = tbNuevoEventoClick
            end
            object tbModificarEvento: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar'
              ImageIndex = 7
              OnClick = tbModificarEventoClick
            end
            object tbEliminarEvento: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar'
              ImageIndex = 8
              OnClick = tbEliminarEventoClick
            end
          end
        end
        object dbgEventos: TRxDBGrid
          Left = 0
          Top = 29
          Width = 772
          Height = 79
          Align = alClient
          DataSource = dsEvento
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgEventosDblClick
          RowColor2 = 16776176
          OnGetCellParams = dbgEventosGetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'ta_descripcion'
              Title.Caption = 'Tipo de Evento'
              Width = 181
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ae_fecha'
              Title.Caption = 'Fecha'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ae_montoanegociar'
              Title.Caption = 'Monto a Negociar'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ae_fechaautorizacion'
              Title.Caption = 'Fecha Autorizaci'#243'n'
              Width = 133
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'se_nombre'
              Title.Caption = 'Usuario Autorizaci'#243'n'
              Width = 151
              Visible = True
            end>
        end
      end
      object tbTestigos: TTabSheet
        Caption = 'Testigos'
        ImageIndex = 1
        object Label10: TLabel
          Left = 512
          Top = 32
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        object cbTestigos: TCoolBar
          Left = 0
          Top = 0
          Width = 772
          Height = 29
          Bands = <
            item
              Control = tbrTestigos
              ImageIndex = -1
              MinHeight = 27
              Width = 766
            end>
          object tbrTestigos: TToolBar
            Left = 9
            Top = 0
            Width = 759
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = dmLegales.ilByN
            Images = dmLegales.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbNuevoTestigo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo'
              ImageIndex = 6
              OnClick = tbNuevoTestigoClick
            end
            object ToolButton7: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar'
              ImageIndex = 7
              OnClick = ToolButton7Click
            end
            object tbEliminarTestigo: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar'
              ImageIndex = 8
              OnClick = tbEliminarTestigoClick
            end
            object tbMail: TToolButton
              Left = 69
              Top = 0
              Caption = 'tbMail'
              ImageIndex = 34
              OnClick = tbMailClick
            end
          end
        end
        object dbgTestigos: TRxDBGrid
          Left = 0
          Top = 29
          Width = 505
          Height = 79
          Align = alLeft
          DataSource = dsTestigo
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgTestigosDblClick
          RowColor2 = 16776176
          OnGetCellParams = dbgTestigosGetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'AT_ID'
              Title.Caption = 'Id de testigo'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'se_nombre'
              Title.Caption = 'Nombre Testigo'
              Width = 144
              Visible = True
            end>
        end
        object edObservacionTestigo: TMemo
          Left = 514
          Top = 53
          Width = 255
          Height = 91
          MaxLength = 400
          TabOrder = 2
        end
      end
    end
    object btNotificarAudiencia: TButton
      Left = 534
      Top = 533
      Width = 99
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = 'Notificar Audiencia'
      TabOrder = 11
      OnClick = btNotificarAudienciaClick
    end
    object edFechaNotificacion: TDateComboBox
      Left = 478
      Top = 204
      Width = 88
      Height = 21
      Weekends = [Sun, Sat]
      TabOrder = 3
    end
    object btnCerrar: TButton
      Left = 717
      Top = 532
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      TabOrder = 14
      Visible = False
      OnClick = btnCerrarClick
    end
    inline fraAnalista: TfraCodigoDescripcion
      Left = 477
      Top = 252
      Width = 311
      Height = 23
      TabOrder = 7
      ExplicitLeft = 477
      ExplicitTop = 252
      ExplicitWidth = 311
      inherited cmbDescripcion: TArtComboBox
        Width = 246
        ExplicitWidth = 246
      end
    end
    object edNroAudiencia: TIntEdit
      Left = 91
      Top = 9
      Width = 78
      Height = 21
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
      Alignment = taRightJustify
      MaxLength = 8
    end
    object edSiniestros: TEdit
      Left = 280
      Top = 8
      Width = 305
      Height = 21
      Color = 16776176
      ReadOnly = True
      TabOrder = 16
    end
    object tbEdicionAbogado: TToolBar
      Left = 464
      Top = 32
      Width = 33
      Height = 27
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      HotImages = dmLegales.ilByN
      Images = dmLegales.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      object tbNuevoAbogado: TToolButton
        Left = 0
        Top = 0
        Hint = 'Modificar'
        ImageIndex = 14
        OnClick = tbNuevoAbogadoClick
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT au_id, au_idjuicio, au_idtipoaudiencia, au_fechaaudiencia' +
        ', au_fechanotificacion, au_hora, au_idpersonainterna,'
      
        '       au_observacion, au_observaciontestigo, jt_numerocarpeta, ' +
        'au_idanalista, au_fechaalta, au_usualta, au_nroaudiencia,'
      '       (SELECT bo_nombre'
      '          FROM legales.lbo_abogado'
      
        '         WHERE bo_id = jt_idabogado) AS estudio, jt_demandante |' +
        '| '#39' C/ '#39' || jt_demandado || '#39' '#39' || jt_caratula AS caratula,'
      
        '       jt_idjurisdiccion, jt_idfuero, jt_idjuzgado, au_fechabaja' +
        ', au_usubaja, jt_idsecretaria, jt_expediente, jt_nroexpediente,'
      
        '       jt_anioexpediente, jt_sinexpediente, jt_fechaingreso, ta_' +
        'descripcion, se_usuario, ju_descripcion, jz_descripcion,'
      '       jz_direccion, fu_descripcion, sc_descripcion'
      
        '  FROM art.use_usuarios, legales.ljt_juicioentramite, legales.lt' +
        'a_tipoaudiencia, legales.lau_audiencia, legales.ljz_juzgado,'
      
        '       legales.lju_jurisdiccion, legales.lfu_fuero, legales.lsc_' +
        'secretaria'
      ' WHERE au_idjuicio = jt_id'
      '   AND au_idtipoaudiencia = ta_id'
      '   AND au_idpersonainterna = se_id(+)'
      '   AND jt_idjuzgado = jz_id(+)'
      '   AND jt_idjurisdiccion = ju_id(+)'
      '   AND jt_idfuero = fu_id(+)'
      '   AND jt_idsecretaria = sc_id(+)'
      '   AND 1 = 2')
    Left = 16
    Top = 268
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 268
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 296
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 296
  end
  inherited QueryPrint: TQueryPrint
    Left = 44
    Top = 324
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 240
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 240
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 324
  end
  inherited ShortCutControl: TShortCutControl
    Left = 72
    Top = 240
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 72
    Top = 268
  end
  object sdqTestigo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT a.*, se_nombre'
      '  FROM legales.lat_audienciatestigo a, art.use_usuarios'
      ' WHERE at_idusuario = se_id'
      '   AND at_idaudiencia = :idaud'
      'order by at_id')
    Left = 24
    Top = 380
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idaud'
        ParamType = ptInput
      end>
  end
  object dsTestigo: TDataSource
    DataSet = sdqTestigo
    Left = 52
    Top = 380
  end
  object sdqEvento: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT ae_id, ae_idtipoevento, ae_idaudiencia, ae_fecha, ae_inst' +
        'ruccion, ae_respuesta, ae_montoanegociar, ae_fechaautorizacion,'
      
        '       ae_idusuarioautorizacion, ta_descripcion, se_nombre, ae_f' +
        'echabaja,ta_tipo'
      
        '  FROM legales.lae_audienciaevento, legales.lta_tipoeventoaudien' +
        'cia, art.use_usuarios'
      ' WHERE ae_idtipoevento = ta_id'
      '   AND ae_idusuarioautorizacion = se_id(+)'
      '   AND ae_idaudiencia = :idaud'
      'order by ae_id')
    Left = 24
    Top = 409
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idaud'
        ParamType = ptInput
      end>
  end
  object dsEvento: TDataSource
    DataSet = sdqEvento
    Left = 52
    Top = 409
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
    Left = 72
    Top = 300
  end
  object sdqModificacionRegistro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM ljg_juiciogestion, legales.ljt_juicioentramite'
      'WHERE jt_id = :jt_id'
      '  AND jt_id = jg_idjuicioentramite(+)')
    Left = 72
    Top = 326
    ParamData = <
      item
        DataType = ftInteger
        Name = 'jt_id'
        ParamType = ptInput
      end>
  end
  object sdqConsultaRegistro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM legales.ljt_juicioentramite'
      'WHERE jt_id = :jt_id')
    Left = 13
    Top = 354
    ParamData = <
      item
        DataType = ftInteger
        Name = 'jt_id'
        ParamType = ptInput
      end>
  end
end
