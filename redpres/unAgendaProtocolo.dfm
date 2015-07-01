inherited frmAgenda: TfrmAgenda
  Left = 177
  Top = 148
  Width = 800
  Height = 536
  Caption = 'Agenda'
  Constraints.MinHeight = 494
  Constraints.MinWidth = 627
  Font.Name = 'Tahoma'
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 151
    Visible = True
    object pcFiltros: TPageControl
      Left = 0
      Top = 0
      Width = 792
      Height = 151
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      TabPosition = tpBottom
      object TabSheet1: TTabSheet
        Caption = ' &Filtros >>'
        DesignSize = (
          784
          125)
        object gbSiniestro: TGroupBox
          Left = 2
          Top = -2
          Width = 117
          Height = 41
          Caption = ' Siniestro '
          TabOrder = 0
          object edSiniestro: TSinEdit
            Left = 8
            Top = 15
            Width = 100
            Height = 20
            TabOrder = 0
          end
        end
        object gbProtocolo: TGroupBox
          Left = 122
          Top = -2
          Width = 209
          Height = 41
          Caption = ' Protocolo '
          TabOrder = 1
          DesignSize = (
            209
            41)
          inline fraProtocolo: TfraCtbTablas
            Left = 8
            Top = 14
            Width = 197
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DesignSize = (
              197
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 144
            end
          end
        end
        object gbAlarma: TGroupBox
          Left = 336
          Top = -2
          Width = 446
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Alarma '
          TabOrder = 2
          DesignSize = (
            446
            41)
          inline fraAlarmasPorProtocolo: TfraAlarmasPorProtocolo
            Left = 8
            Top = 14
            Width = 433
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DesignSize = (
              433
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 368
              OnDropDown = fraAlarmasPorProtocolocmbDescripcionDropDown
            end
          end
        end
        object gbCIE10: TGroupBox
          Left = 2
          Top = 39
          Width = 329
          Height = 41
          Caption = ' CIE-10 '
          TabOrder = 3
          inline fraCIE10: TfraCodDesc
            Left = 8
            Top = 13
            Width = 309
            Height = 23
            TabOrder = 0
            DesignSize = (
              309
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 244
            end
            inherited Propiedades: TPropiedadesFrame
              FieldBaja = 'DG_FECHABAJA'
              FieldCodigo = 'DG_CODIGO'
              FieldDesc = 'DG_DESCRIPCION'
              FieldID = 'DG_CODIGO'
              ShowBajas = True
              TableName = 'CDG_DIAGNOSTICO'
            end
          end
        end
        object gbDelegacion: TGroupBox
          Left = 335
          Top = 39
          Width = 254
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Delegaci'#243'n '
          TabOrder = 4
          DesignSize = (
            254
            41)
          inline fraDelegacion: TfraCodDesc
            Left = 8
            Top = 13
            Width = 242
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DesignSize = (
              242
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 177
            end
            inherited Propiedades: TPropiedadesFrame
              ExtraCondition = 'AND LG_SISTEMA = '#39'S'#39
              FieldBaja = 'LG_FECHABAJA'
              FieldCodigo = 'LG_CODIGO'
              FieldDesc = 'LG_NOMBRE'
              FieldID = 'LG_CODIGO'
              ShowBajas = True
              TableName = 'DLG_DELEGACIONES'
            end
          end
        end
        object GroupBox6: TGroupBox
          Left = 592
          Top = 39
          Width = 190
          Height = 41
          Anchors = [akTop, akRight]
          Caption = ' Estado '
          TabOrder = 5
          object cmbEstado: TComboBox
            Left = 9
            Top = 14
            Width = 175
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Text = 'Todos'
            Items.Strings = (
              'Siniestros a vencer'
              'Siniestros en curso normal'
              'Siniestros vencidos'
              'Todos')
          end
        end
        object gbFecha: TGroupBox
          Left = 2
          Top = 80
          Width = 206
          Height = 41
          Caption = ' Fecha '
          TabOrder = 6
          object Label8: TLabel
            Left = 95
            Top = 17
            Width = 16
            Height = 13
            Caption = '>>'
          end
          object cmbDA_FECHADesde: TDateComboBox
            Left = 5
            Top = 14
            Width = 88
            Height = 21
            Hint = 'Desde Fecha'
            MaxDateCombo = cmbDA_FECHAHasta
            DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object cmbDA_FECHAHasta: TDateComboBox
            Left = 113
            Top = 14
            Width = 88
            Height = 21
            Hint = 'Hasta Fecha'
            MinDateCombo = cmbDA_FECHADesde
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
        object gbRealizado: TGroupBox
          Left = 211
          Top = 80
          Width = 120
          Height = 41
          Caption = ' Realizado '
          TabOrder = 7
          object rbRealizadoSi: TRadioButton
            Left = 4
            Top = 16
            Width = 29
            Height = 17
            Caption = 'Si'
            TabOrder = 0
          end
          object rbRealizadoNo: TRadioButton
            Left = 33
            Top = 16
            Width = 33
            Height = 17
            Caption = 'No'
            TabOrder = 1
          end
          object rbRealizadoTodos: TRadioButton
            Left = 68
            Top = 16
            Width = 49
            Height = 17
            Caption = 'Todos'
            Checked = True
            TabOrder = 2
            TabStop = True
          end
        end
        object gbGrupoTrabajo: TGroupBox
          Left = 334
          Top = 80
          Width = 201
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Grupo de Trabajo '
          TabOrder = 8
          DesignSize = (
            201
            41)
          object cmbGtrabajo: TDBCheckCombo
            Left = 7
            Top = 14
            Width = 189
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnCloseUp = cmbGtrabajoCloseUp
            DataSource = dsGtrabajo
            KeyField = 'GP_CODIGO'
            ListField = 'GP_NOMBRE'
          end
        end
        object gbGestor: TGroupBox
          Left = 540
          Top = 80
          Width = 151
          Height = 41
          Anchors = [akTop, akRight]
          Caption = ' Usuario gestor '
          TabOrder = 9
          object cmbGestor: TArtComboBox
            Left = 8
            Top = 14
            Width = 136
            Height = 21
            GlyphKind = gkDropDown
            NumGlyphs = 1
            TabOrder = 0
            Columns = <
              item
                Expanded = False
                FieldName = 'UG_USUARIO'
                Title.Caption = 'Usuario'
                Visible = True
              end>
            DataSource = dsGestor
            FieldList = 'UG_USUARIO'
            FieldKey = 'UG_ID'
          end
        end
        object chkCitacionCons: TCheckBox
          Left = 695
          Top = 84
          Width = 80
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Cit. consult.'
          TabOrder = 10
        end
        object chkSolicitudAud: TCheckBox
          Left = 695
          Top = 104
          Width = 90
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Solicitud audit.'
          TabOrder = 11
        end
      end
      object TabSheet2: TTabSheet
        Caption = ' F&iltros <<'
        ImageIndex = 1
        DesignSize = (
          784
          125)
        object gbPrestadorCabecera: TGroupBox
          Left = 2
          Top = -2
          Width = 781
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Prestador cabecera '
          TabOrder = 0
          DesignSize = (
            781
            41)
          inline fraPrestadorCabecera: TfraPrestador
            Left = 4
            Top = 13
            Width = 770
            Height = 24
            VertScrollBar.Range = 49
            Anchors = [akLeft, akTop, akRight]
            AutoScroll = False
            TabOrder = 0
            DesignSize = (
              756
              24)
            inherited lbCUIT: TLabel
              Top = 5
              Width = 24
            end
            inherited lbSec: TLabel
              Top = 5
              Width = 21
            end
            inherited lbIdentif: TLabel
              Top = 5
              Width = 40
            end
            inherited lbRSocial: TLabel
              Top = 5
              Width = 38
            end
            inherited lbDomicilio: TLabel
              Width = 40
            end
            inherited lbLocalidad: TLabel
              Width = 44
            end
            inherited lbCPostal: TLabel
              Left = 586
              Width = 13
            end
            inherited lbTelefono: TLabel
              Left = 498
            end
            inherited cmbPrestFantasia: TArtComboBox
              Width = 203
            end
            inherited mskPrestCUIT: TMaskEdit
              Top = 1
            end
            inherited cmbPrestador: TArtComboBox
              Top = 1
              Width = 328
            end
            inherited edPresLocalidad: TEdit
              Width = 232
            end
            inherited edPresCPostal: TEdit
              Left = 603
            end
            inherited edPrestIdentif: TIntEdit
              Top = 1
            end
            inherited edPrestSecuencia: TIntEdit
              Left = 147
              Top = 1
            end
            inherited edPresTelefono: TEdit
              Left = 518
            end
          end
        end
        object gbPrestadorEfector: TGroupBox
          Left = 2
          Top = 39
          Width = 781
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Prestador que hizo la pr'#225'ctica '
          TabOrder = 1
          DesignSize = (
            781
            41)
          inline fraPrestadorEfector: TfraPrestador
            Left = 4
            Top = 13
            Width = 770
            Height = 24
            VertScrollBar.Range = 49
            Anchors = [akLeft, akTop, akRight]
            AutoScroll = False
            TabOrder = 0
            DesignSize = (
              756
              24)
            inherited lbCUIT: TLabel
              Top = 5
              Width = 24
            end
            inherited lbSec: TLabel
              Top = 5
              Width = 21
            end
            inherited lbIdentif: TLabel
              Top = 5
              Width = 40
            end
            inherited lbRSocial: TLabel
              Top = 5
              Width = 38
            end
            inherited lbDomicilio: TLabel
              Width = 40
            end
            inherited lbLocalidad: TLabel
              Width = 44
            end
            inherited lbCPostal: TLabel
              Left = 586
              Width = 13
            end
            inherited lbTelefono: TLabel
              Left = 498
            end
            inherited cmbPrestFantasia: TArtComboBox
              Width = 203
            end
            inherited mskPrestCUIT: TMaskEdit
              Top = 1
            end
            inherited cmbPrestador: TArtComboBox
              Top = 1
              Width = 328
            end
            inherited edPresLocalidad: TEdit
              Width = 232
            end
            inherited edPresCPostal: TEdit
              Left = 603
            end
            inherited edPrestIdentif: TIntEdit
              Top = 1
            end
            inherited edPrestSecuencia: TIntEdit
              Left = 147
              Top = 1
            end
            inherited edPresTelefono: TEdit
              Left = 518
            end
          end
        end
        object gbUsuarios: TGroupBox
          Left = 2
          Top = 80
          Width = 317
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Usuarios por prestador '
          TabOrder = 2
          DesignSize = (
            317
            41)
          inline fraUsuarios: TfraCodigoDescripcion
            Left = 5
            Top = 14
            Width = 307
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DesignSize = (
              307
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 88
              Width = 218
            end
            inherited edCodigo: TPatternEdit
              Width = 84
            end
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 151
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 788
      end>
    inherited ToolBar: TToolBar
      Width = 775
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Marcar como realizado'
        ImageIndex = 18
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbEnviarMail: TToolButton
        DropdownMenu = pMenuMail
        Enabled = True
        ImageIndex = 39
        Style = tbsDropDown
        Visible = True
      end
      inherited ToolButton8: TToolButton
        Left = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        Visible = False
      end
      object tbViajar: TToolButton
        Left = 385
        Top = 0
        Hint = 'Viajar'
        Caption = 'tbViajar'
        DropdownMenu = pMenuViajar
        ImageIndex = 21
        Style = tbsDropDown
        OnClick = tbViajarClick
      end
      object ToolButton2: TToolButton
        Left = 423
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 431
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 8
        OnClick = tbSalir2Click
      end
      object pnlSpacer: TPanel
        Left = 454
        Top = 0
        Width = 131
        Height = 22
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'COLORES | PRIORIDAD  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object pnl1: TPanel
        Left = 585
        Top = 0
        Width = 22
        Height = 22
        Hint = 'Haga doble click para cambiar el color'
        BevelOuter = bvNone
        Caption = '1'
        Color = 8421631
        TabOrder = 1
        OnDblClick = CambioColor
      end
      object pnl2: TPanel
        Left = 607
        Top = 0
        Width = 22
        Height = 22
        Hint = 'Haga doble click para cambiar el color'
        BevelOuter = bvNone
        Caption = '2'
        Color = 8454143
        TabOrder = 2
        OnDblClick = CambioColor
      end
      object pnl3: TPanel
        Left = 629
        Top = 0
        Width = 22
        Height = 22
        Hint = 'Haga doble click para cambiar el color'
        BevelOuter = bvNone
        Caption = '3'
        Color = 12615680
        TabOrder = 3
        OnDblClick = CambioColor
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 180
    Width = 792
    Height = 329
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    FixedCols = 1
    MultiSelect = True
    FooterBand = True
    OnPaintFooter = GridPaintFooter
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'PRIORIDAD'
        Title.Caption = 'Prioridad'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_ALARMA'
        Title.Caption = 'Fecha de la alarma'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN'
        Title.Caption = 'Orden'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECAIDA'
        Title.Caption = 'Reca'#237'da'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DA_AUTORIZACION'
        Title.Caption = 'Nro. Autoriz.'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROTOCOLO'
        Title.Caption = 'Protocolo'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ALARMA'
        Title.Caption = 'Alarma (C'#243'd.)'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALARMA'
        Title.Caption = 'Alarma'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAS_ALARMA'
        Title.Caption = 'D'#237'as'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIE10'
        Title.Caption = 'CIE-10'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_ACCIDENTE'
        Title.Caption = 'Fecha del accidente'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Title.Caption = 'C.U.I.L.'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PACIENTE'
        Title.Caption = 'Paciente'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIASCAIDOS'
        Title.Caption = 'D'#237'as ca'#237'dos'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRES_CABECERA'
        Title.Caption = 'Prestador cabecera'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAB_TEL'
        Title.Caption = 'Tel'#233'fono del prestador cabecera'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRES_PRACTICA'
        Title.Caption = 'Prestador que hizo la pr'#225'ctica'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EFE_TEL'
        Title.Caption = 'Tel'#233'fono del prestador que hizo la pr'#225'ctica'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTRABAJO'
        Title.Caption = 'Grupo de trabajo'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario gestor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUMPLIDO'
        Title.Caption = 'Cumplido'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_CUMPLIMIENTO'
        Title.Caption = 'No cumplimiento'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_PROX_CONTROL'
        Title.Caption = 'Fecha Prox. Control'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_TELEFONOS'
        Title.Caption = 'Tel'#233'fonos'
        Width = 54
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DA_CITACONSULTORIO'
        Title.Alignment = taCenter
        Title.Caption = 'Citaci'#243'n consultorio'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DA_SOLAUDITORIA'
        Title.Alignment = taCenter
        Title.Caption = 'Solicitud auditor'#237'a'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADOCIE10'
        Title.Caption = 'Estado por CIE10'
        Width = 75
        Visible = True
      end>
  end
  object ScrollBox1: TScrollBox [3]
    Left = 20
    Top = 248
    Width = 964
    Height = 135
    TabOrder = 4
    Visible = False
    object qrAlarmas: TQuickRep
      Left = 8
      Top = 8
      Width = 1344
      Height = 816
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      DataSet = sdqConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Functions.Strings = (
        'PAGENUMBER'
        'COLUMNNUMBER'
        'REPORTTITLE')
      Functions.DATA = (
        '0'
        '0'
        #39#39)
      IDReport = 0
      Options = [FirstPageHeader, LastPageFooter]
      Page.Columns = 1
      Page.Orientation = poLandscape
      Page.PaperSize = Legal
      Page.Values = (
        50.000000000000000000
        2159.000000000000000000
        50.000000000000000000
        3556.000000000000000000
        0.000000000000000000
        0.000000000000000000
        0.000000000000000000)
      PrinterSettings.Copies = 1
      PrinterSettings.OutputBin = Auto
      PrinterSettings.Duplex = False
      PrinterSettings.FirstPage = 0
      PrinterSettings.LastPage = 0
      PrinterSettings.ExtendedDuplex = 0
      PrinterSettings.UseStandardprinter = False
      PrinterSettings.UseCustomBinCode = False
      PrinterSettings.CustomBinCode = 0
      PrinterSettings.UseCustomPaperCode = False
      PrinterSettings.CustomPaperCode = 0
      PrinterSettings.PrintMetaFile = False
      PrintIfEmpty = True
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsNormal
      object PageHeaderBand1: TQRBand
        Left = 0
        Top = 19
        Width = 1344
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          105.833333333333300000
          3556.000000000000000000)
        BandType = rbPageHeader
        object qrlTitulo: TQRLabel
          Left = 0
          Top = 8
          Width = 1303
          Height = 23
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            60.854166666666700000
            0.000000000000000000
            21.166666666666700000
            3447.520833333330000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Listado de alarmas'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 14
        end
      end
      object ColumnHeaderBand1: TQRBand
        Left = 0
        Top = 59
        Width = 1344
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          47.625000000000000000
          3556.000000000000000000)
        BandType = rbColumnHeader
        object QRLabel1: TQRLabel
          Left = 55
          Top = 2
          Width = 48
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            145.520833333333000000
            5.291666666666670000
            127.000000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Siniestro'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel2: TQRLabel
          Left = 104
          Top = 2
          Width = 23
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            275.166666666667000000
            5.291666666666670000
            60.854166666666700000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Ord.'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel3: TQRLabel
          Left = 128
          Top = 2
          Width = 22
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            338.666666666667000000
            5.291666666666670000
            58.208333333333300000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Rec.'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel4: TQRLabel
          Left = 0
          Top = 2
          Width = 54
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            0.000000000000000000
            5.291666666666670000
            142.875000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'F.Alarma'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel5: TQRLabel
          Left = 175
          Top = 2
          Width = 158
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            463.020833333333000000
            5.291666666666670000
            418.041666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Protocolo'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel6: TQRLabel
          Left = 335
          Top = 2
          Width = 35
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            886.354166666667000000
            5.291666666666670000
            92.604166666666700000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Cod.Al.'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel7: TQRLabel
          Left = 372
          Top = 2
          Width = 315
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            984.250000000000000000
            5.291666666666670000
            833.437500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = ' Alarma'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel8: TQRLabel
          Left = 689
          Top = 2
          Width = 24
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            1822.979166666670000000
            5.291666666666670000
            63.500000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'D'#237'as'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel9: TQRLabel
          Left = 714
          Top = 2
          Width = 53
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            1889.125000000000000000
            5.291666666666670000
            140.229166666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'F.Accid.'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel10: TQRLabel
          Left = 769
          Top = 2
          Width = 164
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            2034.645833333330000000
            5.291666666666670000
            433.916666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Prestador Cabecera'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel12: TQRLabel
          Left = 1100
          Top = 2
          Width = 70
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            2910.416666666670000000
            5.291666666666670000
            185.208333333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'CUIL'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel13: TQRLabel
          Left = 1171
          Top = 2
          Width = 115
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            3098.270833333330000000
            5.291666666666670000
            304.270833333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = ' Nombre Paciente'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel14: TQRLabel
          Left = 1287
          Top = 2
          Width = 56
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            3405.187500000000000000
            5.291666666666670000
            148.166666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'G.Trabajo'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel11: TQRLabel
          Left = 935
          Top = 2
          Width = 164
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            2473.854166666670000000
            5.291666666666670000
            433.916666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Prestador Efector'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel15: TQRLabel
          Left = 152
          Top = 2
          Width = 22
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            402.166666666667000000
            5.291666666666670000
            58.208333333333300000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Aut.'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
      end
      object DetailBand1: TQRBand
        Left = 0
        Top = 77
        Width = 1344
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          44.979166666666670000
          3556.000000000000000000)
        BandType = rbDetail
        object QRDBText1: TQRDBText
          Left = 55
          Top = 2
          Width = 48
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            145.520833333333000000
            5.291666666666670000
            127.000000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'SINIESTRO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText2: TQRDBText
          Left = 104
          Top = 2
          Width = 23
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            275.166666666667000000
            5.291666666666670000
            60.854166666666700000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'ORDEN'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText3: TQRDBText
          Left = 128
          Top = 2
          Width = 22
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            338.666666666667000000
            5.291666666666670000
            58.208333333333300000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'RECAIDA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText4: TQRDBText
          Left = 0
          Top = 2
          Width = 54
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            0.000000000000000000
            5.291666666666670000
            142.875000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'F_ALARMA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText5: TQRDBText
          Left = 175
          Top = 2
          Width = 158
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            463.020833333333000000
            5.291666666666670000
            418.041666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'PROTOCOLO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText7: TQRDBText
          Left = 372
          Top = 2
          Width = 315
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            984.250000000000000000
            5.291666666666670000
            833.437500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'ALARMA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText8: TQRDBText
          Left = 689
          Top = 1
          Width = 24
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            1822.979166666670000000
            2.645833333333330000
            63.500000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'DIAS_ALARMA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText9: TQRDBText
          Left = 714
          Top = 1
          Width = 53
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            1889.125000000000000000
            2.645833333333330000
            140.229166666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'F_ACCIDENTE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText10: TQRDBText
          Left = 769
          Top = 1
          Width = 164
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            2034.645833333330000000
            2.645833333333330000
            433.916666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'PRES_CABECERA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText12: TQRDBText
          Left = 1100
          Top = 1
          Width = 70
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            2910.416666666670000000
            2.645833333333330000
            185.208333333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'CUIL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText13: TQRDBText
          Left = 1171
          Top = 1
          Width = 115
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            3098.270833333330000000
            2.645833333333330000
            304.270833333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'PACIENTE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText14: TQRDBText
          Left = 1287
          Top = 1
          Width = 56
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            3405.187500000000000000
            2.645833333333330000
            148.166666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'GTRABAJO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText6: TQRDBText
          Left = 335
          Top = 2
          Width = 35
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            886.354166666667000000
            5.291666666666670000
            92.604166666666700000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'ID_ALARMA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText11: TQRDBText
          Left = 935
          Top = 1
          Width = 164
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            2473.854166666670000000
            2.645833333333330000
            433.916666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'PRES_PRACTICA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRDBText15: TQRDBText
          Left = 152
          Top = 2
          Width = 22
          Height = 13
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            34.395833333333300000
            402.166666666667000000
            5.291666666666670000
            58.208333333333300000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'DA_AUTORIZACION'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
      end
    end
  end
  object ScrollBox2: TScrollBox [4]
    Left = 56
    Top = 248
    Width = 941
    Height = 345
    TabOrder = 5
    Visible = False
    object qrPedido: TQuickRep
      Left = 7
      Top = 5
      Width = 816
      Height = 1344
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      BeforePrint = qrPedidoBeforePrint
      DataSet = sdqPedido
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Functions.Strings = (
        'PAGENUMBER'
        'COLUMNNUMBER'
        'REPORTTITLE')
      Functions.DATA = (
        '0'
        '0'
        #39#39)
      IDReport = 0
      Options = [FirstPageHeader, LastPageFooter]
      Page.Columns = 1
      Page.Orientation = poPortrait
      Page.PaperSize = Legal
      Page.Values = (
        100.000000000000000000
        3556.000000000000000000
        100.000000000000000000
        2159.000000000000000000
        50.000000000000000000
        50.000000000000000000
        0.000000000000000000)
      PrinterSettings.Copies = 1
      PrinterSettings.OutputBin = Auto
      PrinterSettings.Duplex = False
      PrinterSettings.FirstPage = 0
      PrinterSettings.LastPage = 0
      PrinterSettings.ExtendedDuplex = 0
      PrinterSettings.UseStandardprinter = False
      PrinterSettings.UseCustomBinCode = False
      PrinterSettings.CustomBinCode = 0
      PrinterSettings.UseCustomPaperCode = False
      PrinterSettings.CustomPaperCode = 0
      PrinterSettings.PrintMetaFile = False
      PrintIfEmpty = True
      ReportTitle = 'Solicitud de Informaci'#243'n'
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsMaximized
      object PageHeaderBand2: TQRBand
        Left = 19
        Top = 38
        Width = 778
        Height = 291
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          769.937500000000000000
          2058.458333333333000000)
        BandType = rbPageHeader
        object qriLogo: TQRImage
          Left = 550
          Top = 0
          Width = 227
          Height = 87
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            230.187500000000000000
            1455.208333333333000000
            0.000000000000000000
            600.604166666666800000)
          Stretch = True
        end
        object QRSysData1: TQRSysData
          Left = 16
          Top = 28
          Width = 41
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            42.333333333333340000
            74.083333333333340000
            108.479166666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          Color = clWhite
          Data = qrsDate
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          FontSize = 9
        end
        object QRLabel16: TQRLabel
          Left = 17
          Top = 79
          Width = 60
          Height = 20
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            52.916666666666670000
            44.979166666666670000
            209.020833333333300000
            158.750000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Se'#241'ores'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel17: TQRLabel
          Left = 212
          Top = 184
          Width = 197
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            560.916666666666700000
            486.833333333333400000
            521.229166666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Ref.: Solicitud de Informaci'#243'n'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRMemo2: TQRMemo
          Left = 16
          Top = 221
          Width = 713
          Height = 65
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            171.979166666667000000
            42.333333333333300000
            584.729166666667000000
            1886.479166666670000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          Lines.Strings = (
            'De nuestra consideraci'#243'n:'
            
              '                  Nos dirigimos a ustedes con el fin de solicita' +
              'rles tenga a bien enviar dentro de las 24hs de recibida la prese' +
              'nte, la evoluci'#243'n, alta m'#233'dica y/o informe de pr'#225'ctica realizada' +
              ', de los pacientes que se detallan a continuaci'#243'n:')
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object qrlDomPrestador: TQRLabel
          Left = 17
          Top = 123
          Width = 108
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            44.979166666666670000
            325.437500000000000000
            285.750000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'qrlDomPrestador'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object qrlPrestador: TQRLabel
          Left = 17
          Top = 102
          Width = 80
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            44.979166666666670000
            269.875000000000000000
            211.666666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'qrlPrestador'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object qrlLocPrestador: TQRLabel
          Left = 17
          Top = 147
          Width = 103
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            44.979166666666670000
            388.937500000000000000
            272.520833333333400000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'qrlLocPrestador'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
      end
      object ColumnHeaderBand2: TQRBand
        Left = 19
        Top = 329
        Width = 778
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          84.666666666666680000
          2058.458333333333000000)
        BandType = rbColumnHeader
        object QRLabel18: TQRLabel
          Left = 4
          Top = 10
          Width = 93
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333300000
            10.583333333333300000
            26.458333333333300000
            246.062500000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Siniestro'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRShape14: TQRShape
          Left = 3
          Top = 28
          Width = 773
          Height = 5
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            13.229166666666700000
            7.937500000000000000
            74.083333333333300000
            2045.229166666670000000)
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object QRLabel19: TQRLabel
          Left = 168
          Top = 10
          Width = 80
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333300000
            444.500000000000000000
            26.458333333333300000
            211.666666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'CUIL'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel20: TQRLabel
          Left = 252
          Top = 10
          Width = 190
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333300000
            666.750000000000000000
            26.458333333333300000
            502.708333333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Trabajador'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel21: TQRLabel
          Left = 98
          Top = 10
          Width = 66
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333300000
            259.291666666667000000
            26.458333333333300000
            174.625000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'F.Accid.'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRShape2: TQRShape
          Left = 0
          Top = 6
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            0.000000000000000000
            15.875000000000000000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape3: TQRShape
          Left = 94
          Top = 6
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            248.708333333333000000
            15.875000000000000000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape4: TQRShape
          Left = 163
          Top = 6
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            431.270833333333000000
            15.875000000000000000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape5: TQRShape
          Left = 247
          Top = 6
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            653.520833333333000000
            15.875000000000000000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape6: TQRShape
          Left = 774
          Top = 6
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            2047.875000000000000000
            15.875000000000000000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape7: TQRShape
          Left = 3
          Top = 3
          Width = 773
          Height = 5
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            13.229166666666700000
            7.937500000000000000
            7.937500000000000000
            2045.229166666670000000)
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object QRShape13: TQRShape
          Left = 442
          Top = 6
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            1169.458333333330000000
            15.875000000000000000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRLabel22: TQRLabel
          Left = 447
          Top = 10
          Width = 68
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333300000
            1182.687500000000000000
            26.458333333333300000
            179.916666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Fecha turno'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRShape16: TQRShape
          Left = 517
          Top = 6
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            1367.895833333330000000
            15.875000000000000000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRLabel23: TQRLabel
          Left = 522
          Top = 10
          Width = 251
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333300000
            1381.125000000000000000
            26.458333333333300000
            664.104166666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Descripci'#243'n de la pr'#225'ctica'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
      end
      object DetailBand2: TQRBand
        Left = 19
        Top = 361
        Width = 778
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        BeforePrint = DetailBand2BeforePrint
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          63.500000000000000000
          2058.458333333333000000)
        BandType = rbDetail
        object qrdbSiniestro: TQRDBText
          Left = 4
          Top = 3
          Width = 93
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            10.583333333333300000
            7.937500000000000000
            246.062500000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqPedido
          DataField = 'SINIESTRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object qrdbCUIL: TQRDBText
          Left = 168
          Top = 3
          Width = 80
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            444.500000000000000000
            7.937500000000000000
            211.666666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqPedido
          DataField = 'CUIL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object qrdbTrabajador: TQRDBText
          Left = 252
          Top = 3
          Width = 190
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            666.750000000000000000
            7.937500000000000000
            502.708333333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqPedido
          DataField = 'TRABAJADOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRShape1: TQRShape
          Left = 3
          Top = 20
          Width = 773
          Height = 5
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            13.229166666666700000
            7.937500000000000000
            52.916666666666700000
            2045.229166666670000000)
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object QRDBText16: TQRDBText
          Left = 98
          Top = 3
          Width = 66
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            259.291666666667000000
            7.937500000000000000
            174.625000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqPedido
          DataField = 'FECHASIN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRShape8: TQRShape
          Left = 0
          Top = -2
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            0.000000000000000000
            -5.291666666666670000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape9: TQRShape
          Left = 94
          Top = -2
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            248.708333333333000000
            -5.291666666666670000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape10: TQRShape
          Left = 163
          Top = -2
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            431.270833333333000000
            -5.291666666666670000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape11: TQRShape
          Left = 247
          Top = -2
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            653.520833333333000000
            -5.291666666666670000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape12: TQRShape
          Left = 774
          Top = -2
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            2047.875000000000000000
            -5.291666666666670000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape15: TQRShape
          Left = 442
          Top = -2
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            1169.458333333330000000
            -5.291666666666670000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape17: TQRShape
          Left = 517
          Top = -2
          Width = 5
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            1367.895833333330000000
            -5.291666666666670000
            13.229166666666700000)
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object qrlFechaTurno: TQRLabel
          Left = 447
          Top = 3
          Width = 68
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1182.687500000000000000
            7.937500000000000000
            179.916666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'qrlFechaTurno'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object qrlPractica: TQRLabel
          Left = 522
          Top = 3
          Width = 252
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1381.125000000000000000
            7.937500000000000000
            666.750000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Caption = 'qrlPractica'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
      end
      object PageFooterBand1: TQRBand
        Left = 19
        Top = 385
        Width = 778
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          105.833333333333300000
          2058.458333333333000000)
        BandType = rbPageFooter
        object qrlEnviarSol: TQRLabel
          Left = 8
          Top = 8
          Width = 69
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            21.166666666666700000
            21.166666666666700000
            182.562500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'qrlEnviarSol'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
      end
    end
  end
  inherited fpAbm: TFormPanel
    Left = 133
    Top = 98
    Width = 341
    Height = 233
    OnBeforeShow = fpAbmBeforeShow
    Constraints.MaxHeight = 233
    Constraints.MaxWidth = 341
    Constraints.MinHeight = 233
    Constraints.MinWidth = 341
    DesignSize = (
      341
      233)
    inherited BevelAbm: TBevel
      Left = 14
      Top = 189
      Width = 313
    end
    object Label1: TLabel [1]
      Left = 16
      Top = 36
      Width = 144
      Height = 13
      Caption = 'Observaciones (acumulativas)'
    end
    object Label2: TLabel [2]
      Left = 86
      Top = 14
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Anulaci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 196
      Top = 198
      Width = 66
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 262
      Top = 198
      Width = 66
      TabOrder = 4
    end
    object chkRealizado: TCheckBox
      Left = 16
      Top = 13
      Width = 65
      Height = 17
      Caption = 'Realizado'
      TabOrder = 0
    end
    object edObservaciones: TMemo
      Left = 14
      Top = 116
      Width = 313
      Height = 65
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 249
      ScrollBars = ssVertical
      TabOrder = 2
    end
    inline fraMotivo: TfraCtbTablas
      Left = 134
      Top = 9
      Width = 195
      Height = 23
      TabOrder = 1
      DesignSize = (
        195
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 142
      end
    end
    object edObservacionesViejas: TMemo
      Left = 14
      Top = 52
      Width = 313
      Height = 61
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      MaxLength = 249
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 5
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT AP_PRIORIDAD PRIORIDAD, DA_FECHA F_ALARMA, DA_SINIESTRO S' +
        'INIESTRO,'
      
        '       DA_ORDEN ORDEN, DA_RECAIDA RECAIDA, A.TB_DESCRIPCION PROT' +
        'OCOLO,'
      
        '       AP_ID ID_ALARMA, AP_DESCRIPCION ALARMA, DA_OCURRENCIA DIA' +
        'S_ALARMA,'
      '       EX_DIAGNOSTICOOMS CIE10,'
      
        '       NVL (EX_FECHARECAIDA, EX_FECHAACCIDENTE) F_ACCIDENTE, EX_' +
        'CUIL CUIL,'
      '       TJ_NOMBRE PACIENTE,'
      '         ART.ACTUALDATE'
      
        '       - (NVL (EX_BAJAMEDICA, NVL (EX_FECHARECAIDA, EX_FECHAACCI' +
        'DENTE)))'
      
        '                                                                ' +
        '   DIASCAIDOS,'
      
        '       CAB.CA_DESCRIPCION PRES_CABECERA, CAB.CA_TELEFONO CAB_TEL' +
        ','
      
        '       EFE.CA_DESCRIPCION PRES_PRACTICA, EFE.CA_TELEFONO EFE_TEL' +
        ','
      '       LG_NOMBRE DELEGACION,'
      '       ART.AMEBPBA.GET_NOMBREGTRABAJO (DA_EQUIPO) GTRABAJO,'
      '       DA_REALIZADO CUMPLIDO, DA_MOTIVONOCUMPLI NO_CUMPLIMIENTO,'
      '       DA_OBSERVACIONES OBSERVACIONES,'
      '       da_citaconsultorio, da_solauditoria,'
      
        '       decode(da_estadocie10, '#39'V'#39', '#39'Vencido'#39', '#39'A'#39',  '#39'A Vencer'#39', ' +
        #39'N'#39', '#39'Normal'#39') estadoCie10,'
      '       siniestro.get_usuariogestor(ex_id) usugestor'
      '  FROM ART.DLG_DELEGACIONES,'
      '       CTJ_TRABAJADOR,'
      '       ART.SEX_EXPEDIENTES,'
      '       ART.CTB_TABLAS A,'
      '       AMED.MAP_ALARMASPORPROTOCOLO,'
      '       AMED.MDA_DETALLEALARMAS,'
      '       ART.CPR_PRESTADOR CAB,'
      '       ART.CPR_PRESTADOR EFE'
      ' WHERE DA_IDALARMASPORPROTOCOLO = AP_ID'
      '   AND TB_CLAVE = '#39'PROTO'#39
      '   AND TB_CODIGO = AP_PROTOCOLO'
      '   AND EX_SINIESTRO = DA_SINIESTRO'
      '   AND EX_ORDEN = DA_ORDEN'
      '   AND EX_RECAIDA = DA_RECAIDA'
      '   AND CAB.CA_IDENTIFICADOR(+) = DA_PRESCABECERA'
      '   AND EFE.CA_IDENTIFICADOR(+) = DA_PRESEFECTOR'
      '   AND EX_CUIL = TJ_CUIL'
      '   AND EX_DELEGACION = LG_CODIGO')
    Left = 8
    Top = 324
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 324
  end
  inherited SortDialog: TSortDialog
    Left = 8
    Top = 352
  end
  inherited ExportDialog: TExportDialog
    Left = 36
    Top = 352
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'F.Alarma'
        TitleAlignment = taCenter
        DataField = 'F_ALARMA'
        Alignment = taCenter
        Width = 170
        MaxLength = 0
      end
      item
        Title = 'Nro.Sin.'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Ord.'
        TitleAlignment = taCenter
        DataField = 'ORDEN'
        Alignment = taCenter
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'Rec.'
        TitleAlignment = taCenter
        DataField = 'RECAIDA'
        Alignment = taCenter
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'Protocolo'
        DataField = 'PROTOCOLO'
        Width = 360
        MaxLength = 0
      end
      item
        Title = 'Cod.Al.'
        TitleAlignment = taCenter
        DataField = 'ID_ALARMA'
        Alignment = taCenter
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Alarma'
        DataField = 'ALARMA'
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'D'#237'as'
        TitleAlignment = taCenter
        DataField = 'DIAS_ALARMA'
        Alignment = taCenter
        Width = 80
        MaxLength = 0
      end
      item
        Title = 'F.Accid.'
        TitleAlignment = taCenter
        DataField = 'F_ACCIDENTE'
        Alignment = taCenter
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Prestador'
        DataField = 'PRES_CABECERA'
        Width = 400
        MaxLength = 0
      end
      item
        Title = 'F.Control'
        TitleAlignment = taCenter
        DataField = 'FECHA_PROX_CONTROL'
        Alignment = taCenter
        Width = 180
        MaxLength = 0
      end
      item
        Title = 'CUIL'
        DataField = 'CUIL'
        Width = 170
        MaxLength = 0
      end
      item
        Title = 'Nombre Paciente'
        DataField = 'PACIENTE'
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'G.Trabajo'
        DataField = 'GTRABAJO'
        Width = 230
        MaxLength = 0
      end
      item
        Title = 'Usu.Gestor'
        DataField = 'USUGESTOR'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Empresa'
        DataField = 'EM_NOMBRE'
        MaxLength = 0
      end>
    Title.Font.Height = -15
    Title.Text = 'Listado de alarmas'
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 36
    Top = 380
  end
  inherited Seguridad: TSeguridad
    Left = 8
    Top = 296
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'pnl1.Color'
      'pnl2.Color'
      'pnl3.Color')
    Left = 36
    Top = 296
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
    Top = 380
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
        LinkControl = tbSalir2
      end
      item
        Key = 16466
        LinkControl = tbViajar
      end>
    Left = 64
    Top = 296
  end
  inherited FieldHider: TFieldHider
    Left = 64
    Top = 324
  end
  object ColorDialog: TColorDialog
    Options = [cdFullOpen, cdSolidColor, cdAnyColor]
    Left = 64
    Top = 352
  end
  object sdqGtrabajo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   gp_codigo, gp_nombre, gp_fax, gp_email'
      '    FROM art.mgp_gtrabajo'
      '   WHERE gp_fbaja IS NULL'
      'ORDER BY gp_nombre'
      '')
    Left = 430
    Top = 99
  end
  object dsGtrabajo: TDataSource
    DataSet = sdqGtrabajo
    Left = 458
    Top = 99
  end
  object pMenuViajar: TPopupMenu
    Left = 64
    Top = 380
    object MnuViajarParte: TMenuItem
      Caption = 'Viajar a Parte Evolutivo'
      OnClick = MnuViajarParteClick
    end
    object mnuViajarAutorizaciones: TMenuItem
      Caption = 'Viajar a Autorizaciones'
      OnClick = mnuViajarAutorizacionesClick
    end
  end
  object pMenuMail: TPopupMenu
    Left = 10
    Top = 408
    object mnuListadoAlarmas: TMenuItem
      Caption = 'Listado de alarmas'
      Enabled = False
      OnClick = mnuListadoAlarmasClick
    end
    object mnuSolicitudPrestador: TMenuItem
      Caption = 'Solicitud al prestador'
      Enabled = False
      OnClick = mnuSolicitudPrestadorClick
    end
  end
  object sdqPedido: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida' +
        ') siniestro, utiles.armar_cuit(tj_cuil) cuil,'
      
        '       tj_nombre trabajador, NVL(ex_fecharecaida, ex_fechaaccide' +
        'nte) fechasin,'
      '       au_turno, pr_descripcion'
      
        '  FROM sex_expedientes, ctj_trabajador, amed.mda_detallealarmas,' +
        ' '
      '       sau_autorizaciones, mpr_prestaciones'
      ' WHERE tj_cuil = ex_cuil'
      '   AND ex_siniestro = da_siniestro'
      '   AND ex_orden = da_orden'
      '   AND ex_recaida = da_recaida'
      '   AND da_idalarmasporprotocolo = :p1'
      '   AND da_ocurrencia = :p2'
      '   AND da_siniestro = au_siniestro(+)'
      '   AND da_orden = au_orden(+)'
      '   AND da_recaida = au_recaida(+)'
      '   AND da_autorizacion = au_numauto(+)'
      
        '   AND iif_char(au_estado, '#39'P'#39', au_pressol, nvl(au_presapro, au_' +
        'pressol)) = pr_codigo(+)'
      '')
    Left = 56
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'p2'
        ParamType = ptInput
      end>
  end
  object dsPedido: TDataSource
    DataSet = sdqPedido
    Left = 28
    Top = 40
  end
  object dsGestor: TDataSource
    DataSet = sdqGestor
    Left = 630
    Top = 95
  end
  object sdqGestor: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   ug_id, ug_usuario'
      '    FROM mug_usuariogrupotrabajo'
      '   WHERE ug_fechabaja IS NULL'
      '     AND ug_tipousuario IN ('#39'01'#39', '#39'04'#39')'
      '')
    Left = 602
    Top = 95
  end
end
