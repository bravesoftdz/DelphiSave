inherited frmSuspensionPlazos: TfrmSuspensionPlazos
  Left = 260
  Top = 147
  Caption = 'Suspensi'#243'n de Plazos / Aceptaci'#243'n - Rechazo'
  ClientHeight = 464
  ClientWidth = 692
  Constraints.MinHeight = 411
  Constraints.MinWidth = 700
  OldCreateOrder = True
  ExplicitLeft = 260
  ExplicitTop = 147
  ExplicitWidth = 700
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 199
    ExplicitWidth = 692
    ExplicitHeight = 199
    DesignSize = (
      692
      199)
    object Bevel1: TBevel
      Left = 2
      Top = 94
      Width = 688
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object Bevel2: TBevel
      Left = 2
      Top = 145
      Width = 688
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object gbFechaReasignacion: TGroupBox
      Left = 3
      Top = 2
      Width = 219
      Height = 43
      Caption = ' Fecha de &reasignaci'#243'n '
      TabOrder = 0
      object Label2: TLabel
        Left = 103
        Top = 17
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFReasigDesde: TDateComboBox
        Left = 7
        Top = 15
        Width = 93
        Height = 21
        MaxDateCombo = edFReasigHasta
        TabOrder = 0
      end
      object edFReasigHasta: TDateComboBox
        Left = 119
        Top = 15
        Width = 93
        Height = 21
        MinDateCombo = edFReasigDesde
        TabOrder = 1
      end
    end
    object gbDelegacion: TGroupBox
      Left = 3
      Top = 45
      Width = 219
      Height = 43
      Caption = ' De&legaci'#243'n '
      TabOrder = 3
      DesignSize = (
        219
        43)
      object cmbDelegacion: TDBCheckCombo
        Left = 8
        Top = 16
        Width = 204
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsDelegacion
        KeyField = 'ID'
        ListField = 'NOMBRE'
      end
    end
    object gbFVencimSusp: TGroupBox
      Left = 3
      Top = 149
      Width = 220
      Height = 45
      Caption = ' Fecha de &Vencimiento de suspensi'#243'n '
      TabOrder = 7
      object Label3: TLabel
        Left = 100
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFVtoSuspDesde: TDateComboBox
        Left = 7
        Top = 17
        Width = 88
        Height = 21
        MaxDateCombo = edFVtoSuspHasta
        TabOrder = 0
      end
      object edFVtoSuspHasta: TDateComboBox
        Left = 123
        Top = 17
        Width = 88
        Height = 21
        MinDateCombo = edFVtoSuspDesde
        TabOrder = 1
      end
    end
    object gbRangoSiniestro: TGroupBox
      Left = 226
      Top = 2
      Width = 195
      Height = 43
      Caption = ' R&ango de siniestros '
      TabOrder = 1
      object Label5: TLabel
        Left = 90
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object SinDesde: TSinEdit
        Left = 8
        Top = 15
        Width = 77
        Height = 21
        OnExit = SinDesdeExit
        TabOrder = 0
        ViewStyle = [etSiniestro]
      end
      object SinHasta: TSinEdit
        Left = 109
        Top = 15
        Width = 77
        Height = 21
        TabOrder = 1
        ViewStyle = [etSiniestro]
      end
    end
    object gbTipoAccidente: TGroupBox
      Left = 425
      Top = 2
      Width = 265
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' &Tipo de siniestro '
      TabOrder = 2
      DesignSize = (
        265
        43)
      object cmbTipoAccidente: TArtComboBox
        Left = 7
        Top = 17
        Width = 251
        Height = 21
        CharCase = ecUpperCase
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        TabOrder = 0
        Columns = <
          item
            Expanded = False
            FieldName = 'TA_DESCRIPCIONABREV'
            Title.Caption = 'Abrev.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TA_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 100
            Visible = True
          end>
        DataSource = dsTipoAccidente
        FieldList = 'TA_DESCRIPCION'
        FieldKey = 'TA_CODIGO'
      end
    end
    object gbFVencimRechazo: TGroupBox
      Left = 226
      Top = 149
      Width = 219
      Height = 45
      Caption = ' Fecha de &vencimiento de rechazo '
      TabOrder = 8
      object Label1: TLabel
        Left = 100
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFVtoRechDesde: TDateComboBox
        Left = 7
        Top = 17
        Width = 88
        Height = 21
        MaxDateCombo = edFVtoRechHasta
        TabOrder = 0
      end
      object edFVtoRechHasta: TDateComboBox
        Left = 123
        Top = 17
        Width = 88
        Height = 21
        MinDateCombo = edFVtoRechDesde
        TabOrder = 1
      end
    end
    object gbSiniestro: TGroupBox
      Left = 3
      Top = 97
      Width = 122
      Height = 43
      Caption = ' &Siniestro '
      TabOrder = 4
      object edSiniestro: TSinEdit
        Left = 6
        Top = 15
        Width = 110
        Height = 21
        OnExit = SinDesdeExit
        TabOrder = 0
        OnSelect = edSiniestroSelect
      end
    end
    object gbEstado: TGroupBox
      Left = 128
      Top = 97
      Width = 375
      Height = 43
      Caption = ' Estado '
      TabOrder = 5
      object rbTodos: TRadioButton
        Left = 7
        Top = 18
        Width = 53
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbSuspMed: TRadioButton
        Left = 62
        Top = 18
        Width = 73
        Height = 17
        Caption = 'Susp. Med.'
        TabOrder = 1
      end
      object rbSuspSin: TRadioButton
        Left = 142
        Top = 18
        Width = 73
        Height = 17
        Caption = 'Susp. Sin.'
        TabOrder = 2
      end
      object rbRechMed: TRadioButton
        Left = 217
        Top = 18
        Width = 73
        Height = 17
        Caption = 'Rech. Med.'
        TabOrder = 3
      end
      object rbRechSin: TRadioButton
        Left = 300
        Top = 18
        Width = 70
        Height = 17
        Caption = 'Rech. Sin.'
        TabOrder = 4
      end
    end
    object gbArea: TGroupBox
      Left = 506
      Top = 97
      Width = 184
      Height = 43
      Caption = ' Area del usuario '
      TabOrder = 6
      object rbAreaSiniestros: TRadioButton
        Left = 7
        Top = 18
        Width = 90
        Height = 17
        Caption = 'Area siniestros'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbAreaSiniestrosClick
      end
      object rbAreaMedica: TRadioButton
        Left = 99
        Top = 18
        Width = 82
        Height = 17
        Caption = 'Area m'#233'dica'
        TabOrder = 1
        OnClick = rbAreaMedicaClick
      end
    end
    object gbGrupoTrabajo: TGroupBox
      Left = 226
      Top = 48
      Width = 240
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Grupo de Trabajo '
      TabOrder = 9
      DesignSize = (
        240
        41)
      object cmbGtrabajo: TDBCheckCombo
        Left = 7
        Top = 14
        Width = 228
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
      Left = 470
      Top = 48
      Width = 219
      Height = 41
      Anchors = [akTop, akRight]
      Caption = ' Usuario gestor '
      TabOrder = 10
      object cmbGestor: TArtComboBox
        Left = 8
        Top = 14
        Width = 204
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
    object rgRechAMed: TRadioGroup
      Left = 448
      Top = 149
      Width = 105
      Height = 45
      Caption = 'Rech. A/Med.'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 11
    end
    object rgRechASin: TRadioGroup
      Left = 556
      Top = 149
      Width = 105
      Height = 45
      Caption = 'Rech. A/Sin'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 12
    end
  end
  inherited CoolBar: TCoolBar
    Top = 199
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    ExplicitTop = 199
    ExplicitWidth = 692
    inherited ToolBar: TToolBar
      Width = 677
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ExplicitWidth = 677
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbReversion: TToolButton
        Left = 370
        Top = 0
        Hint = 'Revertir rechazo (Ctrl + R)'
        Caption = 'tbReversion'
        ImageIndex = 41
        OnClick = tbReversionClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbCitacion: TToolButton
        Left = 401
        Top = 0
        Hint = 'Datos citaci'#243'n (Ctrl+D)'
        Caption = 'tbCitacion'
        ImageIndex = 44
        OnClick = tbCitacionClick
      end
      object ToolButton9: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbViajar: TToolButton
        Left = 432
        Top = 0
        Hint = 'Viajar...'
        Caption = 'tbViajar'
        DropdownMenu = pMenuViajar
        ImageIndex = 21
        Style = tbsDropDown
        OnClick = tbViajarClick
      end
      object ToolButton1: TToolButton
        Left = 470
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 478
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 8
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 228
    Width = 692
    Height = 236
    Columns = <
      item
        Expanded = False
        FieldName = 'LG_NOMBRE'
        ReadOnly = True
        Title.Caption = 'Delegaci'#243'n'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_VENCIMSUSPENSION'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Title.Caption = 'Venc. Susp.'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_VENCIMRECHAZO'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Title.Caption = 'Venc. Rech.'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_ACCIDENTE'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'F.Accid./Rec'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCIONABREV'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRAVEDAD'
        ReadOnly = True
        Title.Caption = 'Gravedad'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_DIAGNOSTICOOMS'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'OMS CIE 10'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_FECHARECEPCION'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'F.Recepci'#243'n'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUSPPLAZOSIN'
        ReadOnly = True
        Title.Caption = 'Tipo Susp. Sin.'
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_USUARIOSUSPSIN'
        ReadOnly = True
        Title.Caption = 'Usuario Susp. Sin.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUSPPLAZOMED'
        ReadOnly = True
        Title.Caption = 'Tipo Susp. Med.'
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_USUARIOSUSPMED'
        ReadOnly = True
        Title.Caption = 'Usuario Susp. Med.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_NOMBRE'
        ReadOnly = True
        Title.Caption = 'Formato Susp.'
        Width = 214
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FI_FIRMANTE'
        ReadOnly = True
        Title.Caption = 'Firmante Susp.'
        Width = 214
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_RSIN'
        ReadOnly = True
        Title.Caption = 'Tipo Rech. Sin.'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_USUARIORECHAZOSIN'
        ReadOnly = True
        Title.Caption = 'Usuario Rech. Sin.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_RMED'
        ReadOnly = True
        Title.Caption = 'Tipo Rech. M'#233'd.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_USUARIORECHAZOMED'
        ReadOnly = True
        Title.Caption = 'Usuario Rech. Med.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORM_RECH'
        ReadOnly = True
        Title.Caption = 'Formato Rech.'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIRM_RECH'
        ReadOnly = True
        Title.Caption = 'Firmante Rech.'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_REVERSIONSIN'
        Title.Alignment = taCenter
        Title.Caption = 'Rev. Sin.'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_REVERSIONMED'
        Title.Alignment = taCenter
        Title.Caption = 'Rev. Med.'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        ReadOnly = True
        Title.Caption = 'Empresa'
        Width = 206
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_CUIL'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'CUIL'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        ReadOnly = True
        Title.Caption = 'Trabajador'
        Width = 173
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_IDENTIFICADOR'
        Title.Alignment = taCenter
        Title.Caption = 'Id. Prestador'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        ReadOnly = True
        Title.Caption = 'Prestador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_BREVEDESCRIPCION'
        ReadOnly = True
        Title.Caption = 'Descripci'#243'n Accidente'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_DIAGNOSTICO'
        ReadOnly = True
        Title.Caption = 'Diagn'#243'stico'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_NOMBRE'
        ReadOnly = True
        Title.Caption = 'Grupo de Trabajo'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_FECHAALTA'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'F. Carga'
        Width = 67
        Visible = True
      end>
  end
  object fpReversion: TFormPanel [3]
    Left = 135
    Top = 214
    Width = 488
    Height = 216
    Caption = 'Reversi'#243'n de rechazo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnClose = fpReversionClose
    DesignSize = (
      488
      216)
    object Label14: TLabel
      Left = 7
      Top = 135
      Width = 84
      Height = 13
      Caption = 'Formato reversi'#243'n'
    end
    object Label15: TLabel
      Left = 247
      Top = 135
      Width = 86
      Height = 13
      Caption = 'Firmante reversi'#243'n'
    end
    object Bevel6: TBevel
      Left = 4
      Top = 179
      Width = 482
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object gbRevAMed: TGroupBox
      Left = 5
      Top = 40
      Width = 238
      Height = 91
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      object Label16: TLabel
        Left = 5
        Top = 15
        Width = 43
        Height = 13
        Caption = 'Rechazo'
      end
      object Label17: TLabel
        Left = 7
        Top = 0
        Width = 77
        Height = 16
        Caption = ' AREA MEDICA '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inline fraRevRechAMed: TfraCodigoDescripcion
        Left = 4
        Top = 29
        Width = 232
        Height = 23
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 29
        ExplicitWidth = 232
        DesignSize = (
          232
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 32
          Width = 198
          Color = clBtnFace
          ReadOnly = True
          DataSource = nil
          ExplicitLeft = 32
          ExplicitWidth = 198
        end
        inherited edCodigo: TPatternEdit
          Width = 28
          Color = clBtnFace
          ReadOnly = True
          ExplicitWidth = 28
        end
      end
      object pnlRevAMed: TPanel
        Left = 5
        Top = 57
        Width = 226
        Height = 28
        BevelOuter = bvLowered
        TabOrder = 1
        object Label18: TLabel
          Left = 4
          Top = 8
          Width = 141
          Height = 13
          Caption = 'Revertir rechazo Area M'#233'dica'
        end
        object rbSiRevAMed: TRadioButton
          Left = 153
          Top = 9
          Width = 31
          Height = 14
          Caption = 'Si'
          TabOrder = 0
          OnClick = rbSiRevAMedClick
        end
        object rbNoRevAMed: TRadioButton
          Left = 188
          Top = 9
          Width = 34
          Height = 14
          Caption = 'No'
          TabOrder = 1
          OnClick = rbNoRevAMedClick
        end
      end
    end
    inline fraFormatoRev: TfraCodigoDescripcion
      Left = 6
      Top = 151
      Width = 236
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      TabStop = True
      ExplicitLeft = 6
      ExplicitTop = 151
      ExplicitWidth = 236
      DesignSize = (
        236
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 39
        Width = 196
        Color = clBtnFace
        ReadOnly = True
        DataSource = nil
        ExplicitLeft = 39
        ExplicitWidth = 196
      end
      inherited edCodigo: TPatternEdit
        Width = 34
        Color = clBtnFace
        ReadOnly = True
        ExplicitWidth = 34
      end
    end
    inline fraFirmanteRev: TfraCodigoDescripcion
      Left = 247
      Top = 150
      Width = 237
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      TabStop = True
      ExplicitLeft = 247
      ExplicitTop = 150
      ExplicitWidth = 237
      DesignSize = (
        237
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 39
        Width = 197
        Color = clBtnFace
        ReadOnly = True
        DataSource = nil
        ExplicitLeft = 39
        ExplicitWidth = 197
      end
      inherited edCodigo: TPatternEdit
        Width = 34
        Color = clBtnFace
        ReadOnly = True
        ExplicitWidth = 34
      end
    end
    object btnCancelarRev: TButton
      Left = 408
      Top = 186
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
    end
    object btnAceptarRev: TButton
      Left = 328
      Top = 186
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnAceptarRevClick
    end
    object gbRevASin: TGroupBox
      Left = 245
      Top = 40
      Width = 238
      Height = 91
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      object Label19: TLabel
        Left = 5
        Top = 15
        Width = 43
        Height = 13
        Caption = 'Rechazo'
      end
      object Label20: TLabel
        Left = 7
        Top = 0
        Width = 97
        Height = 16
        Caption = ' AREA SINIESTROS '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inline fraRevRechASin: TfraCodigoDescripcion
        Left = 4
        Top = 29
        Width = 232
        Height = 23
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 29
        ExplicitWidth = 232
        DesignSize = (
          232
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 32
          Width = 198
          Color = clBtnFace
          ReadOnly = True
          DataSource = nil
          ExplicitLeft = 32
          ExplicitWidth = 198
        end
        inherited edCodigo: TPatternEdit
          Width = 28
          Color = clBtnFace
          ReadOnly = True
          ExplicitWidth = 28
        end
      end
      object pnlRevASin: TPanel
        Left = 5
        Top = 57
        Width = 226
        Height = 28
        BevelOuter = bvLowered
        TabOrder = 1
        object Label21: TLabel
          Left = 4
          Top = 8
          Width = 151
          Height = 13
          Caption = 'Revertir rechazo Area Siniestros'
        end
        object rbSiRevASin: TRadioButton
          Left = 159
          Top = 9
          Width = 31
          Height = 14
          Caption = 'Si'
          TabOrder = 0
          OnClick = rbSiRevASinClick
        end
        object rbNoRevASin: TRadioButton
          Left = 190
          Top = 9
          Width = 34
          Height = 14
          Caption = 'No'
          TabOrder = 1
          OnClick = rbNoRevASinClick
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 1
      Width = 479
      Height = 40
      TabOrder = 6
      object Label22: TLabel
        Left = 5
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Siniestro'
      end
      object Label23: TLabel
        Left = 155
        Top = 16
        Width = 51
        Height = 13
        Caption = 'Trabajador'
      end
      object edSinRev: TSinEdit
        Left = 50
        Top = 12
        Width = 100
        Height = 21
        TabOrder = 0
        ReadOnly = True
        Color = clScrollBar
      end
      object edTrabajadorRev: TEdit
        Left = 211
        Top = 12
        Width = 261
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object fpDatosCitacion: TFormPanel [4]
    Left = 416
    Top = 351
    Width = 440
    Height = 300
    Caption = 'Datos citaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnClose = fpDatosCitacionClose
    OnBeforeShow = fpDatosCitacionBeforeShow
    Constraints.MinHeight = 300
    Constraints.MinWidth = 440
    DesignSize = (
      440
      300)
    object Label26: TLabel
      Left = 4
      Top = 104
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Bevel8: TBevel
      Left = 4
      Top = 262
      Width = 432
      Height = 5
      Anchors = [akLeft, akTop, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label27: TLabel
      Left = 4
      Top = 180
      Width = 43
      Height = 26
      Caption = 'Obser-'#13#10'vaciones'
    end
    object Label29: TLabel
      Left = 4
      Top = 130
      Width = 43
      Height = 13
      Caption = '2'#186' Fecha'
    end
    object Label30: TLabel
      Left = 4
      Top = 156
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object btnGetTurno: TSpeedButton
      Left = 146
      Top = 100
      Width = 23
      Height = 22
      Hint = 'Obtener turno libre'
      Flat = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
        2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
        CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
        00000033330000336600003399000033CC000033FF0000660000006633000066
        6600006699000066CC000066FF00009900000099330000996600009999000099
        CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
        660000FF990000FFCC00330000003300330033006600330099003300CC003300
        FF00333300003333330033336600333399003333CC003333FF00336600003366
        330033666600336699003366CC003366FF003399000033993300339966003399
        99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
        FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
        6600660099006600CC006600FF00663300006633330066336600663399006633
        CC006633FF00666600006666330066666600666699006666CC00669900006699
        330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
        CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
        000099339900990099009900CC009900000099333300990066009933CC009900
        FF00996600009966330099336600996699009966CC009933FF00999933009999
        6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
        CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
        000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
        9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
        FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
        3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
        9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
        6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
        CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFF
        0AA6A60AFFFFFFFFFFFFFFFFFFFFFFFF0AC7C70AFFFFFFFFFFFFFFFFFFFFFFFF
        0AACAC0AFFFFFFFFFFFFFFFFFFFFFFFF0ACECE0AFFFFFFFFFFFFFF0A0A0A0A0A
        0AD4D40A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
        D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0AD5D50A0A0A0A0A0AFFFFFFFFFFFFFF
        0AD5D50AFFFFFFFFFFFFFFFFFFFFFFFF0ADBDB0AFFFFFFFFFFFFFFFFFFFFFFFF
        0ADCDC0AFFFFFFFFFFFFFFFFFFFFFFFF0ADADA0AFFFFFFFFFFFFFFFFFFFFFFFF
        0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      Visible = False
      OnClick = btnGetTurnoClick
    end
    object btnGetTurno2: TSpeedButton
      Left = 146
      Top = 125
      Width = 23
      Height = 22
      Hint = 'Obtener turno libre'
      Flat = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
        2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
        CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
        00000033330000336600003399000033CC000033FF0000660000006633000066
        6600006699000066CC000066FF00009900000099330000996600009999000099
        CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
        660000FF990000FFCC00330000003300330033006600330099003300CC003300
        FF00333300003333330033336600333399003333CC003333FF00336600003366
        330033666600336699003366CC003366FF003399000033993300339966003399
        99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
        FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
        6600660099006600CC006600FF00663300006633330066336600663399006633
        CC006633FF00666600006666330066666600666699006666CC00669900006699
        330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
        CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
        000099339900990099009900CC009900000099333300990066009933CC009900
        FF00996600009966330099336600996699009966CC009933FF00999933009999
        6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
        CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
        000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
        9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
        FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
        3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
        9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
        6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
        CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFF
        0AA6A60AFFFFFFFFFFFFFFFFFFFFFFFF0AC7C70AFFFFFFFFFFFFFFFFFFFFFFFF
        0AACAC0AFFFFFFFFFFFFFFFFFFFFFFFF0ACECE0AFFFFFFFFFFFFFF0A0A0A0A0A
        0AD4D40A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
        D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0AD5D50A0A0A0A0A0AFFFFFFFFFFFFFF
        0AD5D50AFFFFFFFFFFFFFFFFFFFFFFFF0ADBDB0AFFFFFFFFFFFFFFFFFFFFFFFF
        0ADCDC0AFFFFFFFFFFFFFFFFFFFFFFFF0ADADA0AFFFFFFFFFFFFFFFFFFFFFFFF
        0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      Visible = False
      OnClick = btnGetTurno2Click
    end
    object Label25: TLabel
      Left = 4
      Top = 52
      Width = 38
      Height = 13
      Caption = 'Consult.'
    end
    object Label31: TLabel
      Left = 4
      Top = 79
      Width = 35
      Height = 13
      Caption = 'M'#233'dico'
    end
    object edFecha: TDateComboBox
      Tag = 2
      Left = 51
      Top = 100
      Width = 93
      Height = 21
      MaxDateCombo = edFecha2
      TabOrder = 2
      OnChange = edFechaChange
    end
    object edFechaTXT: TEdit
      Left = 210
      Top = 100
      Width = 225
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      TabOrder = 4
    end
    object btnAceptarCitacion: TButton
      Left = 277
      Top = 269
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = btnAceptarCitacionClick
    end
    object btnCancelarCitacion: TButton
      Left = 359
      Top = 269
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 11
      OnClick = btnCancelarCitacionClick
    end
    object edObservaciones: TMemo
      Tag = 5
      Left = 51
      Top = 178
      Width = 384
      Height = 81
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 2000
      TabOrder = 9
    end
    object edHora: TMaskEdit
      Left = 171
      Top = 100
      Width = 36
      Height = 21
      EditMask = '##:##;1;_'
      MaxLength = 5
      TabOrder = 3
      Text = '  :  '
    end
    object edFecha2: TDateComboBox
      Tag = 2
      Left = 51
      Top = 126
      Width = 93
      Height = 21
      MinDateCombo = edFecha
      TabOrder = 5
      OnChange = edFecha2Change
    end
    object edHora2: TMaskEdit
      Left = 171
      Top = 126
      Width = 36
      Height = 21
      EditMask = '##:##;1;_'
      MaxLength = 5
      TabOrder = 6
      Text = '  :  '
    end
    object edFecha2TXT: TEdit
      Left = 210
      Top = 126
      Width = 225
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      TabOrder = 7
    end
    inline fraSector: TfraCtbTablas
      Left = 52
      Top = 151
      Width = 383
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      ExplicitLeft = 52
      ExplicitTop = 151
      ExplicitWidth = 383
      DesignSize = (
        383
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 331
        DataSource = nil
        ExplicitWidth = 331
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 49
        ExplicitLeft = 0
        ExplicitWidth = 49
      end
    end
    object GroupBox3: TGroupBox
      Left = 3
      Top = 2
      Width = 433
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 12
      DesignSize = (
        433
        40)
      object Label24: TLabel
        Left = 5
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Siniestro'
      end
      object Label32: TLabel
        Left = 155
        Top = 16
        Width = 51
        Height = 13
        Caption = 'Trabajador'
      end
      object SinCitacion: TSinEdit
        Left = 50
        Top = 12
        Width = 100
        Height = 21
        TabOrder = 0
        ReadOnly = True
        TabStop = False
        Color = clScrollBar
      end
      object edTrabajadorCita: TEdit
        Left = 211
        Top = 12
        Width = 215
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 1
      end
    end
    inline fraConsultorio: TfraCtbTablas
      Left = 52
      Top = 47
      Width = 383
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 52
      ExplicitTop = 47
      ExplicitWidth = 383
      DesignSize = (
        383
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 331
        DataSource = nil
        ExplicitWidth = 331
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 49
        ExplicitLeft = 0
        ExplicitWidth = 49
      end
    end
    inline fraMedicoCitacion: TfraCodigoDescripcion
      Left = 52
      Top = 73
      Width = 383
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 52
      ExplicitTop = 73
      ExplicitWidth = 383
      DesignSize = (
        383
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 331
        DataSource = nil
        ExplicitLeft = 52
        ExplicitWidth = 331
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 49
        ExplicitLeft = 0
        ExplicitWidth = 49
      end
    end
  end
  object fpABM: TFormPanel [5]
    Left = 277
    Top = 340
    Width = 520
    Height = 436
    Caption = 'Suspensi'#243'n de Plazos / Aceptaci'#243'n - Rechazo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnClose = fpABMClose
    OnShow = fpABMShow
    DesignSize = (
      520
      436)
    object lblDatSin: TLabel
      Left = 177
      Top = 13
      Width = 3
      Height = 13
    end
    object Bevel3: TBevel
      Left = 6
      Top = 52
      Width = 508
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object Bevel4: TBevel
      Left = 6
      Top = 163
      Width = 508
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object Label4: TLabel
      Left = 7
      Top = 111
      Width = 94
      Height = 13
      Caption = 'Formato suspensi'#243'n'
    end
    object Label6: TLabel
      Left = 262
      Top = 111
      Width = 96
      Height = 13
      Caption = 'Firmante suspensi'#243'n'
    end
    object Bevel5: TBevel
      Left = 6
      Top = 398
      Width = 508
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object Label9: TLabel
      Left = 7
      Top = 222
      Width = 79
      Height = 13
      Caption = 'Formato rechazo'
    end
    object Label10: TLabel
      Left = 262
      Top = 222
      Width = 81
      Height = 13
      Caption = 'Firmante rechazo'
    end
    object Label11: TLabel
      Left = 15
      Top = 46
      Width = 128
      Height = 16
      Caption = ' SUSPENSION DE PLAZOS '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 15
      Top = 156
      Width = 134
      Height = 16
      Caption = ' ACEPTACION / RECHAZO '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 7
      Top = 269
      Width = 38
      Height = 26
      Caption = 'Motivo'#13#10'rechazo'
    end
    object Label34: TLabel
      Left = 6
      Top = 334
      Width = 45
      Height = 52
      Caption = 'Motivo'#13#10'rechazo '#13#10'patolog'#237'a'#13#10'base'
    end
    object btnAceptar: TButton
      Left = 356
      Top = 405
      Width = 75
      Height = 24
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 439
      Top = 405
      Width = 75
      Height = 24
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 10
    end
    object gbSuspAreaMedica: TGroupBox
      Left = 7
      Top = 64
      Width = 250
      Height = 45
      Caption = ' Suspensi'#243'n de Plazos Area M'#233'dica '
      TabOrder = 0
      inline fraSuspAMedica: TfraCodDesc
        Left = 4
        Top = 16
        Width = 243
        Height = 23
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 16
        ExplicitWidth = 243
        DesignSize = (
          243
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 32
          Width = 210
          DataSource = nil
          ExplicitLeft = 32
          ExplicitWidth = 210
        end
        inherited edCodigo: TPatternEdit
          Width = 28
          ExplicitWidth = 28
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraFields = ', TS_BLOQUEAOTRA, TS_GENERACARTA '
          FieldBaja = 'TS_FECHABAJA'
          FieldCodigo = 'TS_CODIGO'
          FieldDesc = 'TS_DESCRIPCION'
          FieldID = 'TS_CODIGO'
          TableName = 'STS_TIPOSUSPENSIONPLAZOS'
          OnChange = fraSuspAMedicaPropiedadesChange
        end
      end
    end
    object gbSuspAreaSiniestros: TGroupBox
      Left = 263
      Top = 64
      Width = 250
      Height = 45
      Caption = ' Suspensi'#243'n de Plazos Area Siniestros '
      TabOrder = 1
      inline fraSuspASin: TfraCodDesc
        Left = 4
        Top = 16
        Width = 243
        Height = 23
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 16
        ExplicitWidth = 243
        DesignSize = (
          243
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 32
          Width = 210
          DataSource = nil
          ExplicitLeft = 32
          ExplicitWidth = 210
        end
        inherited edCodigo: TPatternEdit
          Width = 28
          ExplicitWidth = 28
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraFields = ', TS_BLOQUEAOTRA, TS_GENERACARTA '
          FieldBaja = 'TS_FECHABAJA'
          FieldCodigo = 'TS_CODIGO'
          FieldDesc = 'TS_DESCRIPCION'
          FieldID = 'TS_CODIGO'
          TableName = 'STS_TIPOSUSPENSIONPLAZOS'
          OnChange = fraSuspASinPropiedadesChange
        end
      end
    end
    object gbRechazoAreaMedica: TGroupBox
      Left = 7
      Top = 174
      Width = 250
      Height = 45
      Caption = ' Rechazo Area M'#233'dica'
      TabOrder = 4
      inline fraRechAMedica: TfraCodDesc
        Left = 4
        Top = 16
        Width = 243
        Height = 23
        TabOrder = 0
        OnEnter = fraRechAMedicaEnter
        ExplicitLeft = 4
        ExplicitTop = 16
        ExplicitWidth = 243
        DesignSize = (
          243
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 32
          Width = 210
          DataSource = nil
          ExplicitLeft = 32
          ExplicitWidth = 210
        end
        inherited edCodigo: TPatternEdit
          Width = 28
          ExplicitWidth = 28
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraFields = ', TR_BLOQUEASUSP, TR_GENERACARTA, TR_DECISIONOTRA, TR_AUTOMATICO'
          FieldBaja = 'TR_FECHABAJA'
          FieldCodigo = 'TR_CODIGO'
          FieldDesc = 'TR_DESCRIPCION'
          FieldID = 'TR_CODIGO'
          TableName = 'STR_TIPORECHAZOSIN'
          OnChange = fraRechAMedicaPropiedadesChange
        end
      end
    end
    object gbRechazoAreaSiniestros: TGroupBox
      Left = 262
      Top = 174
      Width = 250
      Height = 45
      Caption = ' Rechazo Area Siniestros '
      TabOrder = 5
      inline fraRechASin: TfraCodDesc
        Left = 4
        Top = 16
        Width = 243
        Height = 23
        TabOrder = 0
        OnEnter = fraRechASinEnter
        ExplicitLeft = 4
        ExplicitTop = 16
        ExplicitWidth = 243
        DesignSize = (
          243
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 32
          Width = 210
          DataSource = nil
          ExplicitLeft = 32
          ExplicitWidth = 210
        end
        inherited edCodigo: TPatternEdit
          Width = 28
          ExplicitWidth = 28
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND TR_EXCLUSIVOMED = '#39'N'#39' '
          ExtraFields = ', TR_BLOQUEASUSP, TR_GENERACARTA, TR_DECISIONOTRA, TR_AUTOMATICO'
          FieldBaja = 'TR_FECHABAJA'
          FieldCodigo = 'TR_CODIGO'
          FieldDesc = 'TR_DESCRIPCION'
          FieldID = 'TR_CODIGO'
          TableName = 'STR_TIPORECHAZOSIN'
          OnChange = fraRechASinPropiedadesChange
        end
      end
    end
    inline fraFormatoSusp: TfraCodigoDescripcion
      Left = 7
      Top = 127
      Width = 250
      Height = 23
      TabOrder = 2
      ExplicitLeft = 7
      ExplicitTop = 127
      ExplicitWidth = 250
      DesignSize = (
        250
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 45
        Width = 204
        DataSource = nil
        ExplicitLeft = 45
        ExplicitWidth = 204
      end
      inherited edCodigo: TPatternEdit
        Width = 40
        ExplicitWidth = 40
      end
    end
    inline fraFirmanteSusp: TfraCodigoDescripcion
      Left = 262
      Top = 127
      Width = 250
      Height = 23
      TabOrder = 3
      ExplicitLeft = 262
      ExplicitTop = 127
      ExplicitWidth = 250
      DesignSize = (
        250
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 45
        Width = 204
        DataSource = nil
        ExplicitLeft = 45
        ExplicitWidth = 204
      end
      inherited edCodigo: TPatternEdit
        Width = 40
        ExplicitWidth = 40
      end
    end
    inline fraFormatoRech: TfraCodigoDescripcion
      Left = 7
      Top = 238
      Width = 250
      Height = 23
      TabOrder = 6
      ExplicitLeft = 7
      ExplicitTop = 238
      ExplicitWidth = 250
      DesignSize = (
        250
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 45
        Width = 204
        DataSource = nil
        ExplicitLeft = 45
        ExplicitWidth = 204
      end
      inherited edCodigo: TPatternEdit
        Width = 40
        ExplicitWidth = 40
      end
    end
    inline fraFirmanteRech: TfraCodigoDescripcion
      Left = 262
      Top = 237
      Width = 250
      Height = 23
      TabOrder = 7
      ExplicitLeft = 262
      ExplicitTop = 237
      ExplicitWidth = 250
      DesignSize = (
        250
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 45
        Width = 204
        DataSource = nil
        ExplicitLeft = 45
        ExplicitWidth = 204
      end
      inherited edCodigo: TPatternEdit
        Width = 40
        ExplicitWidth = 40
      end
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 2
      Width = 509
      Height = 40
      TabOrder = 11
      object Label7: TLabel
        Left = 5
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Siniestro'
      end
      object Label8: TLabel
        Left = 155
        Top = 16
        Width = 51
        Height = 13
        Caption = 'Trabajador'
      end
      object SinABM: TSinEdit
        Left = 50
        Top = 12
        Width = 100
        Height = 21
        TabOrder = 0
        ReadOnly = True
        Color = clScrollBar
      end
      object edTrabajador: TEdit
        Left = 211
        Top = 12
        Width = 290
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 1
      end
    end
    object edMotivoRechazo: TMemo
      Left = 56
      Top = 265
      Width = 455
      Height = 59
      Color = clBtnFace
      MaxLength = 1500
      ReadOnly = True
      TabOrder = 8
      OnChange = edMotivoRechazoChange
    end
    object edMotivoRechazoPatBase: TMemo
      Left = 56
      Top = 330
      Width = 455
      Height = 59
      Color = clBtnFace
      MaxLength = 1500
      ReadOnly = True
      TabOrder = 12
      OnChange = edMotivoRechazoChange
    end
  end
  object fpCie10: TFormPanel [6]
    Left = 823
    Top = 358
    Width = 392
    Height = 89
    Caption = 'Ingrese el Diagn'#243'stico CIE-10'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      392
      89)
    object Bevel7: TBevel
      Left = 3
      Top = 57
      Width = 384
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object Label28: TLabel
      Left = 7
      Top = 4
      Width = 378
      Height = 13
      Caption = 
        'El siniestro no posee Diagn'#243'stico CIE-10.  Debe ingresarlo ahora' +
        ' para continuar:'
    end
    object Label33: TLabel
      Left = 8
      Top = 34
      Width = 32
      Height = 13
      Caption = 'CIE-10'
    end
    object btnCancelarCIE10: TButton
      Left = 315
      Top = 62
      Width = 70
      Height = 23
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarCIE10Click
    end
    object btnAceptarCIE10: TButton
      Left = 240
      Top = 62
      Width = 70
      Height = 23
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarCIE10Click
    end
    inline fraCIE10: TfraCodigoDescripcion
      Left = 46
      Top = 29
      Width = 341
      Height = 23
      TabOrder = 2
      ExplicitLeft = 46
      ExplicitTop = 29
      ExplicitWidth = 341
      DesignSize = (
        341
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 43
        Width = 295
        CharCase = ecUpperCase
        ExplicitLeft = 43
        ExplicitWidth = 295
      end
      inherited edCodigo: TPatternEdit
        Width = 40
        ExplicitWidth = 40
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ex_siniestro, ex_orden, ex_recaida, armar_siniestro(ex_si' +
        'niestro, ex_orden, ex_recaida) siniestro,'
      
        '       NVL(ex_fecharecaida, ex_fechaaccidente) fecha_accidente, ' +
        'ta_descripcionabrev, tg_descripcion gravedad, ex_diagnostico,'
      
        '       ex_diagnosticooms, ex_brevedescripcion, em_nombre, ex_cui' +
        'l, tj_nombre, tj_id, ex_fecharecepcion, ex_fechaalta, lg_nombre,'
      '       gp_nombre, ca_descripcion, ex_vencimsuspension,'
      
        '       ex_suspplazosin || DECODE(ex_suspplazosin, NULL, NULL, '#39'-' +
        #39' || suspl_sin.ts_descripcion) suspplazosin,'
      
        '       ex_suspplazomed || DECODE(ex_suspplazomed, NULL, NULL, '#39'-' +
        #39' || suspl_med.ts_descripcion) suspplazomed, ex_suspplazosin,'
      
        '       ex_usuariosuspsin, ex_suspplazomed, ex_usuariosuspmed, pr' +
        'estt.tc_codigo tc_codigo,'
      
        '       RPAD(prestt.tc_codigo, 6) || prestt.tc_nombre tc_nombre, ' +
        'prestf.fi_id fi_firmantesusp,'
      
        '       RPAD(TO_CHAR(prestf.fi_id), 6) || prestf.fi_firmante fi_f' +
        'irmante, ex_vencimrechazo, ex_rechazosin, ex_rechazomed, '
      
        '       ex_rechazosin || DECODE(ex_rechazosin, NULL, NULL, '#39'-'#39' ||' +
        ' rech_sin.tr_descripcion) d_rsin,'
      
        '       ex_rechazomed || DECODE(ex_rechazomed, NULL, NULL, '#39'-'#39' ||' +
        ' rech_med.tr_descripcion) d_rmed, rech.tc_codigo,'
      
        '       RPAD(rech.tc_codigo, 6) || rech.tc_nombre form_rech, rech' +
        'f.fi_id fi_firmanterech,'
      
        '       RPAD(TO_CHAR(rechf.fi_id), 6) || rechf.fi_firmante firm_r' +
        'ech, prestc.ca_fechaimpresion fimprsusp,'
      
        '       crech.ca_fechaimpresion fimprrech, NVL(prestc.ca_id, 0) i' +
        'dcartasusp, NVL(crech.ca_id, 0) idcartarech,'
      
        '       prestt.tc_codigo formatosusp, rech.tc_codigo formatorech,' +
        ' crech.ca_observaciones obsrechazo,'
      
        '       se_descripcion || DECODE(se_cerrado, '#39'S'#39', '#39'('#39' || ex_causa' +
        'fin || '#39')'#39') estado, crev.ca_fechaimpresion fimprrev,'
      
        '       NVL(crev.ca_id, 0) idcartarev, ex_reversionsin, ex_revers' +
        'ionmed,'
      
        '       NVL(crev.ca_idfirmareimpresion, crev.ca_idfirma) firmante' +
        'rev, rev.tc_codigo formatorev,'
      
        '       ex_frechazosin, ex_frechazomed, ex_fsuspsin, ex_fsuspmed,' +
        ' ex_estado, ex_id,'
      
        '       ex_vencimsuspension, ex_vencimrechazo, siniestro.is_sinie' +
        'strorevertido(ex_id) siniestrorev,'
      
        '       siniestro.get_usuariogestor(ex_id) usugestor, ca_identifi' +
        'cador'
      
        '  FROM sex_expedientes, sta_tipoaccidente, stg_tipogravedad, sts' +
        '_tiposuspensionplazos suspl_sin,'
      
        '       sts_tiposuspensionplazos suspl_med, aem_empresa, mgp_gtra' +
        'bajo, dlg_delegaciones, cca_carta prestc, ctc_textocarta prestt,'
      
        '       ctj_trabajador, cpr_prestador, cfi_firma prestf, str_tipo' +
        'rechazosin rech_sin, str_tiporechazosin rech_med,'
      
        '       ctc_textocarta rech, cfi_firma rechf, cca_carta crech, SI' +
        'N.sse_siniestroestado, cca_carta crev, ctc_textocarta rev'
      ' WHERE ex_tipo = ta_codigo(+)'
      '   AND ex_gravedad = tg_codigo(+)'
      '   AND ex_suspplazosin = suspl_sin.ts_codigo(+)'
      '   AND ex_suspplazomed = suspl_med.ts_codigo(+)'
      '   AND ex_cuit = em_cuit'
      '   AND ex_gtrabajo = gp_codigo'
      '   AND ex_delegacion = lg_codigo'
      '   AND ex_id = prestc.ca_idexpediente(+)'
      
        '   AND art.siniestro.get_ultidcartadocumento(ex_id, '#39'01'#39') = pres' +
        'tc.ca_id(+)'
      
        '   AND art.siniestro.get_ultidcartadocumento(ex_id, '#39'02'#39') = crec' +
        'h.ca_id(+)'
      
        '   AND art.siniestro.get_ultidcartadocumento(ex_id, '#39'04'#39') = crev' +
        '.ca_id(+)'
      '   AND prestc.ca_idtextocarta = prestt.tc_id(+)'
      '   AND ex_cuil = tj_cuil'
      '   AND ex_prestador = ca_identificador(+)'
      
        '   AND NVL(prestc.ca_idfirmareimpresion, prestc.ca_idfirma) = pr' +
        'estf.fi_id(+)'
      '   AND ex_rechazosin = rech_sin.tr_codigo(+)'
      '   AND ex_rechazomed = rech_med.tr_codigo(+)'
      '   AND ex_id = crech.ca_idexpediente(+)'
      '   AND crech.ca_idtextocarta = rech.tc_id(+)'
      
        '   AND NVL(crech.ca_idfirmareimpresion, crech.ca_idfirma) = rech' +
        'f.fi_id(+)'
      '   AND ex_id = crev.ca_idexpediente(+)'
      '   AND crev.ca_idtextocarta = rev.tc_id(+)'
      '   AND ex_estado = se_codigo(+)'
      '   AND NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39')')
    Left = 12
    Top = 389
    object sdqConsultaEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqConsultaEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqConsultaEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqConsultaSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqConsultaFECHA_ACCIDENTE: TDateTimeField
      FieldName = 'FECHA_ACCIDENTE'
    end
    object sdqConsultaTA_DESCRIPCIONABREV: TStringField
      FieldName = 'TA_DESCRIPCIONABREV'
      Size = 4
    end
    object sdqConsultaGRAVEDAD: TStringField
      FieldName = 'GRAVEDAD'
      Size = 25
    end
    object sdqConsultaEX_DIAGNOSTICOOMS: TStringField
      FieldName = 'EX_DIAGNOSTICOOMS'
      Size = 10
    end
    object sdqConsultaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqConsultaEX_CUIL: TStringField
      FieldName = 'EX_CUIL'
      Size = 11
    end
    object sdqConsultaEX_VENCIMSUSPENSION: TDateTimeField
      FieldName = 'EX_VENCIMSUSPENSION'
    end
    object sdqConsultaEX_FECHARECEPCION: TDateTimeField
      FieldName = 'EX_FECHARECEPCION'
    end
    object sdqConsultaSUSPPLAZOSIN: TStringField
      FieldName = 'SUSPPLAZOSIN'
      Size = 35
    end
    object sdqConsultaEX_SUSPPLAZOMED: TStringField
      FieldName = 'EX_SUSPPLAZOMED'
      Size = 3
    end
    object sdqConsultaSUSPPLAZOMED: TStringField
      FieldName = 'SUSPPLAZOMED'
      Size = 35
    end
    object sdqConsultaTC_CODIGO: TStringField
      FieldName = 'TC_CODIGO'
      Size = 5
    end
    object sdqConsultaTC_NOMBRE: TStringField
      FieldName = 'TC_NOMBRE'
      Size = 66
    end
    object sdqConsultaEX_FECHAALTA: TDateTimeField
      FieldName = 'EX_FECHAALTA'
    end
    object sdqConsultaEX_USUARIOSUSPSIN: TStringField
      FieldName = 'EX_USUARIOSUSPSIN'
    end
    object sdqConsultaEX_USUARIOSUSPMED: TStringField
      FieldName = 'EX_USUARIOSUSPMED'
    end
    object sdqConsultaLG_NOMBRE: TStringField
      FieldName = 'LG_NOMBRE'
      Size = 50
    end
    object sdqConsultaGP_NOMBRE: TStringField
      FieldName = 'GP_NOMBRE'
      Size = 30
    end
    object sdqConsultaTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqConsultaCA_DESCRIPCION: TStringField
      FieldName = 'CA_DESCRIPCION'
      Size = 150
    end
    object sdqConsultaEX_BREVEDESCRIPCION: TStringField
      FieldName = 'EX_BREVEDESCRIPCION'
      Size = 250
    end
    object sdqConsultaEX_DIAGNOSTICO: TStringField
      FieldName = 'EX_DIAGNOSTICO'
      Size = 250
    end
    object sdqConsultaFI_FIRMANTE: TStringField
      FieldName = 'FI_FIRMANTE'
      Size = 66
    end
    object sdqConsultaEX_VENCIMRECHAZO: TDateTimeField
      FieldName = 'EX_VENCIMRECHAZO'
    end
    object sdqConsultaEX_RECHAZOSIN: TStringField
      FieldName = 'EX_RECHAZOSIN'
      Size = 3
    end
    object sdqConsultaEX_USUARIORECHAZOSIN: TStringField
      FieldName = 'EX_USUARIORECHAZOSIN'
    end
    object sdqConsultaEX_RECHAZOMED: TStringField
      FieldName = 'EX_RECHAZOMED'
      Size = 3
    end
    object sdqConsultaEX_USUARIORECHAZOMED: TStringField
      FieldName = 'EX_USUARIORECHAZOMED'
    end
    object sdqConsultaTC_CODIGO_1: TStringField
      FieldName = 'TC_CODIGO_1'
      Size = 5
    end
    object sdqConsultaFORM_RECH: TStringField
      FieldName = 'FORM_RECH'
      Size = 66
    end
    object sdqConsultaFIRM_RECH: TStringField
      FieldName = 'FIRM_RECH'
      Size = 66
    end
    object sdqConsultaTJ_ID: TFloatField
      FieldName = 'TJ_ID'
      Required = True
    end
    object sdqConsultaFIMPRSUSP: TDateTimeField
      FieldName = 'FIMPRSUSP'
    end
    object sdqConsultaFIMPRRECH: TDateTimeField
      FieldName = 'FIMPRRECH'
    end
    object sdqConsultaIDCARTASUSP: TFloatField
      FieldName = 'IDCARTASUSP'
    end
    object sdqConsultaIDCARTARECH: TFloatField
      FieldName = 'IDCARTARECH'
    end
    object sdqConsultaFORMATOSUSP: TStringField
      FieldName = 'FORMATOSUSP'
      Size = 5
    end
    object sdqConsultaFORMATORECH: TStringField
      FieldName = 'FORMATORECH'
      Size = 5
    end
    object sdqConsultaOBSRECHAZO: TStringField
      FieldName = 'OBSRECHAZO'
      Size = 400
    end
    object sdqConsultaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 112
    end
    object sdqConsultaEX_SUSPPLAZOSIN: TStringField
      FieldName = 'EX_SUSPPLAZOSIN'
      Size = 3
    end
    object sdqConsultaD_RSIN: TStringField
      FieldName = 'D_RSIN'
      Size = 39
    end
    object sdqConsultaD_RMED: TStringField
      FieldName = 'D_RMED'
      Size = 39
    end
    object sdqConsultaFIMPRREV: TDateTimeField
      FieldName = 'FIMPRREV'
    end
    object sdqConsultaEX_REVERSIONSIN: TStringField
      FieldName = 'EX_REVERSIONSIN'
      Size = 10
    end
    object sdqConsultaEX_REVERSIONMED: TStringField
      FieldName = 'EX_REVERSIONMED'
      Size = 10
    end
    object sdqConsultaIDCARTAREV: TFloatField
      FieldName = 'IDCARTAREV'
    end
    object sdqConsultaFIRMANTEREV: TFloatField
      FieldName = 'FIRMANTEREV'
    end
    object sdqConsultaFORMATOREV: TStringField
      FieldName = 'FORMATOREV'
      Size = 5
    end
    object sdqConsultaEX_FRECHAZOSIN: TDateTimeField
      FieldName = 'EX_FRECHAZOSIN'
    end
    object sdqConsultaEX_FRECHAZOMED: TDateTimeField
      FieldName = 'EX_FRECHAZOMED'
    end
    object sdqConsultaEX_FSUSPSIN: TDateTimeField
      FieldName = 'EX_FSUSPSIN'
    end
    object sdqConsultaEX_FSUSPMED: TDateTimeField
      FieldName = 'EX_FSUSPMED'
    end
    object sdqConsultaEX_ESTADO: TStringField
      FieldName = 'EX_ESTADO'
      Size = 2
    end
    object sdqConsultaEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
    object sdqConsultaFI_FIRMANTESUSP: TFloatField
      FieldName = 'FI_FIRMANTESUSP'
    end
    object sdqConsultaFI_FIRMANTERECH: TFloatField
      FieldName = 'FI_FIRMANTERECH'
    end
    object sdqConsultaSINIESTROREV: TStringField
      FieldName = 'SINIESTROREV'
      Size = 4000
    end
    object sdqConsultaUSUGESTOR: TStringField
      FieldName = 'USUGESTOR'
      Size = 4000
    end
    object sdqConsultaCA_IDENTIFICADOR: TFloatField
      FieldName = 'CA_IDENTIFICADOR'
    end
  end
  inherited dsConsulta: TDataSource
    Left = 41
    Top = 389
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Delegaci'#243'n'
        DataField = 'LG_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Venc. Susp.'
        DataField = 'EX_VENCIMSUSPENSION'
        FieldIndex = 0
      end
      item
        Title = 'Venc. Rech.'
        DataField = 'EX_VENCIMRECHAZO'
        FieldIndex = 0
      end
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'F.Accid./Rec'
        DataField = 'FECHA_ACCIDENTE'
        FieldIndex = 0
      end
      item
        Title = 'F.Recepci'#243'n'
        DataField = 'EX_FECHARECEPCION'
        FieldIndex = 0
      end
      item
        Title = 'Empresa'
        DataField = 'EM_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Grupo de Trabajo'
        DataField = 'GP_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Usuario Gestor'
        DataField = 'USUGESTOR'
        FieldIndex = 0
      end
      item
        Title = 'OMS CIE 10'
        DataField = 'EX_DIAGNOSTICOOMS'
        FieldIndex = 0
      end
      item
        Title = 'F. Carga'
        DataField = 'EX_FECHAALTA'
        FieldIndex = 0
      end
      item
        Title = 'Formato Suspensi'#243'n'
        DataField = 'TC_CODIGO'
        FieldIndex = 0
      end
      item
        Title = 'Firma Suspensi'#243'n'
        DataField = 'FI_ID'
        FieldIndex = 0
      end
      item
        Title = 'Formato Rechazo'
        DataField = 'TC_CODIGO_1'
        FieldIndex = 0
      end
      item
        Title = 'Firma Rechazo'
        DataField = 'FI_ID_1'
        FieldIndex = 0
      end>
    Left = 12
    Top = 333
  end
  inherited ExportDialog: TExportDialog
    Left = 40
    Top = 333
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        MaxLength = 13
      end
      item
        Title = 'V. Susp.'
        TitleAlignment = taCenter
        DataField = 'EX_VENCIMSUSPENSION'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'V. Rech.'
        TitleAlignment = taCenter
        DataField = 'EX_VENCIMRECHAZO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Susp. Sin.'
        TitleAlignment = taCenter
        DataField = 'EX_SUSPPLAZOSIN'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Susp. M'#233'd.'
        TitleAlignment = taCenter
        DataField = 'EX_SUSPPLAZOMED'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Rech. Sin.'
        TitleAlignment = taCenter
        DataField = 'EX_RECHAZOSIN'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Rech. Med.'
        TitleAlignment = taCenter
        DataField = 'EX_RECHAZOMED'
        Alignment = taCenter
        MaxLength = 11
      end
      item
        Title = 'Id. Prest.'
        TitleAlignment = taCenter
        DataField = 'CA_IDENTIFICADOR'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'CUIL'
        TitleAlignment = taCenter
        DataField = 'EX_CUIL'
        Alignment = taCenter
        MaxLength = 11
      end
      item
        Title = 'Trabajador'
        DataField = 'TJ_NOMBRE'
        MaxLength = 25
      end
      item
        Title = 'Empresa'
        DataField = 'EM_NOMBRE'
        MaxLength = 37
      end
      item
        Title = 'F. Acc./Rec.'
        TitleAlignment = taCenter
        DataField = 'FECHA_ACCIDENTE'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'G. Trabajo'
        DataField = 'GP_NOMBRE'
        Width = 500
        MaxLength = 12
      end
      item
        Title = 'Usuario Gestor'
        DataField = 'USUGESTOR'
        Width = 500
        MaxLength = 10
      end
      item
        Title = 'Tipo'
        TitleAlignment = taCenter
        DataField = 'TA_DESCRIPCIONABREV'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Gravedad'
        DataField = 'GRAVEDAD'
        MaxLength = 10
      end
      item
        Title = 'CIE-10'
        TitleAlignment = taCenter
        DataField = 'EX_DIAGNOSTICOOMS'
        Alignment = taCenter
        Width = 450
        MaxLength = 4
      end
      item
        Title = 'F. Recepc.'
        TitleAlignment = taCenter
        DataField = 'EX_FECHARECEPCION'
        Alignment = taCenter
        Width = 400
        MaxLength = 0
      end>
    SubTitle.Font.Height = -12
    SubTitle.Font.Style = []
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 40
    Top = 361
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'SUSPENDER_SIN'
      end
      item
        Name = 'SUSPENDER_MED'
      end
      item
        Name = 'SUSPENDER_VENCIDO_SIN'
      end
      item
        Name = 'SUSPENDER_VENCIDO_MED'
      end
      item
        Name = 'RECHAZAR_SIN'
      end
      item
        Name = 'RECHAZAR_MED'
      end
      item
        Name = 'RECHAZAR_VENCIDO_MED'
      end
      item
        Name = 'RECHAZAR_VENCIDO_SIN'
      end
      item
        Name = 'CAMBIAR_AREA'
      end
      item
        Name = 'REVERTIR_AV_SIN'
      end
      item
        Name = 'REVERTIR_AV_MED'
      end>
    DBLogin = frmPrincipal.DBLogin
    Left = 11
    Top = 305
  end
  inherited FormStorage: TFormStorage
    Left = 40
    Top = 305
  end
  inherited PrintDialog: TPrintDialog
    Left = 12
    Top = 361
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
        LinkControl = tbReversion
      end
      item
        Key = 16452
        LinkControl = tbCitacion
      end>
    Left = 68
    Top = 305
  end
  inherited FieldHider: TFieldHider
    Left = 68
    Top = 333
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 116
    Top = 57
  end
  object sdqDelegacion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'select el_id  ID, el_nombre NOMBRE'
      '  from art.del_delegacion'
      'where el_fechabaja is null'
      ' order by el_nombre')
    Left = 88
    Top = 57
  end
  object dsTipoAccidente: TDataSource
    DataSet = sdqTipoAccidente
    Left = 553
    Top = 8
  end
  object sdqTipoAccidente: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select TA_CODIGO, TA_DESCRIPCION, TA_DESCRIPCIONABREV'
      '   from STA_TIPOACCIDENTE ')
    Left = 525
    Top = 8
  end
  object sdqGtrabajo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select gp_codigo, gp_nombre'
      'from art.mgp_gtrabajo'
      'where gp_fbaja is null'
      'order by gp_nombre')
    Left = 362
    Top = 59
  end
  object dsGtrabajo: TDataSource
    DataSet = sdqGtrabajo
    Left = 390
    Top = 59
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
    Left = 598
    Top = 55
  end
  object dsGestor: TDataSource
    DataSet = sdqGestor
    Left = 626
    Top = 55
  end
  object pMenuViajar: TPopupMenu
    OnPopup = pMenuViajarPopup
    Left = 544
    Top = 196
    object mnuViajarParte: TMenuItem
      Caption = 'Viajar a Parte Evolutivo'
      OnClick = mnuViajarParteClick
    end
  end
end
