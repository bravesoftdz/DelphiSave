inherited frmManEntidad: TfrmManEntidad
  Left = 296
  Top = 135
  Width = 700
  Height = 500
  Caption = 'Mantenimiento de Entidades'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 117
    Visible = True
    DesignSize = (
      692
      117)
    object GroupBox5: TGroupBox
      Left = 0
      Top = 1
      Width = 692
      Height = 70
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Entidad'
      TabOrder = 0
      DesignSize = (
        692
        70)
      object Label2: TLabel
        Left = 16
        Top = 18
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object Label19: TLabel
        Left = 17
        Top = 45
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      inline fraEntidadHasta: TfraEntidadCUIT
        Left = 55
        Top = 41
        Width = 415
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          415
          24)
        inherited Label1: TLabel
          Left = 124
        end
        inherited lbRSocial: TLabel
          Width = 24
          Caption = 'CUIT'
          Font.Name = 'Tahoma'
        end
        inherited Label3: TLabel
          Width = 59
        end
        inherited Label2: TLabel
          Left = 214
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 156
        end
        inherited mskCuit: TMaskEdit
          Left = 34
          OnKeyPress = nil
        end
        inherited edEN_CODBANCO: TPatternEdit
          Left = 160
        end
      end
      inline fraEntidadDesde: TfraEntidadCUIT
        Left = 55
        Top = 13
        Width = 415
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          415
          24)
        inherited Label1: TLabel
          Left = 124
        end
        inherited lbRSocial: TLabel
          Width = 24
          Caption = 'CUIT'
          Font.Name = 'Tahoma'
        end
        inherited Label3: TLabel
          Width = 59
        end
        inherited Label2: TLabel
          Left = 214
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 156
        end
        inherited mskCuit: TMaskEdit
          Left = 34
          OnKeyPress = nil
        end
        inherited edEN_CODBANCO: TPatternEdit
          Left = 160
        end
      end
      object gbFecha: TGroupBox
        Left = 472
        Top = 8
        Width = 213
        Height = 41
        Anchors = [akTop, akRight]
        Caption = ' Fecha de Alta '
        TabOrder = 2
        DesignSize = (
          213
          41)
        object Label21: TLabel
          Left = 99
          Top = 18
          Width = 16
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '>>'
        end
        object edEN_FECHAALTADesde: TDateComboBox
          Left = 8
          Top = 14
          Width = 89
          Height = 21
          AutoExit = True
          TabOrder = 0
        end
        object edEN_FECHAALTAHasta: TDateComboBox
          Left = 116
          Top = 14
          Width = 89
          Height = 21
          AutoExit = True
          TabOrder = 1
        end
      end
      object chkEntidadTramite: TCheckBox
        Left = 473
        Top = 50
        Width = 99
        Height = 14
        Anchors = [akTop, akRight]
        Caption = 'Solo En Tr'#225'mite'
        TabOrder = 3
      end
    end
    object gbEjecutivo: TGroupBox
      Left = 0
      Top = 71
      Width = 372
      Height = 42
      Caption = 'Ejecutivo'
      TabOrder = 1
      DesignSize = (
        372
        42)
      inline fraEjecutivoEnt: TfraStaticCodigoDescripcion
        Left = 10
        Top = 14
        Width = 355
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          355
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 292
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
    object GroupBox3: TGroupBox
      Left = 376
      Top = 71
      Width = 316
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Canal'
      TabOrder = 2
      DesignSize = (
        316
        42)
      inline fraCanalEnt: TfraCanal
        Left = 6
        Top = 13
        Width = 304
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          304
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 241
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
  end
  inherited CoolBar: TCoolBar
    Top = 117
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 688
      end>
    inherited ToolBar: TToolBar
      Width = 675
      inherited tbEliminar: TToolButton
        Hint = 'Baja (Ctrl+Del)'
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      object tbExencion: TToolButton
        Left = 370
        Top = 0
        Hint = 'Exenci'#243'n Ing. Brutos'
        Caption = 'Exenci'#243'n IB'
        ImageIndex = 15
        OnClick = tbExencionClick
      end
      object tbSeparador: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'tbSeparador'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object tbGranOrganizador: TToolButton
        Left = 401
        Top = 0
        Hint = 'Organizadores'
        Caption = 'Organizadores'
        ImageIndex = 19
        OnClick = tbGranOrganizadorClick
      end
      object tbAprobar: TToolButton
        Left = 424
        Top = 0
        Hint = 'Aprobar'
        ImageIndex = 13
        OnClick = tbAprobarClick
      end
      object tbEjecutivoCuenta: TToolButton
        Left = 447
        Top = 0
        Hint = 'Ejecutivo de Cuenta (Ctrl+J)'
        ImageIndex = 16
        OnClick = tbEjecutivoCuentaClick
      end
      object tbReactivar: TToolButton
        Left = 470
        Top = 0
        Hint = 'Reactivar (Ctrl+R)'
        ImageIndex = 22
        OnClick = tbReactivarClick
      end
      object pnlBusqueda: TPanel
        Left = 493
        Top = 0
        Width = 91
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object chkSoloActivos: TCheckBox
          Left = 4
          Top = 2
          Width = 83
          Height = 17
          Caption = 'Solo Activos'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 146
    Width = 692
    Height = 327
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EN_CODBANCO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_CUIT'
        Title.Caption = 'CUIT'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_RESPONSABLE'
        Title.Caption = 'Responsable'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_CALLE'
        Title.Caption = 'Calle'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NUMERO'
        Title.Caption = 'N'#250'mero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_PISO'
        Title.Caption = 'Piso'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_DEPARTAMENTO'
        Title.Caption = 'Dto.'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_CPOSTAL'
        Title.Caption = 'C.P.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_CPOSTALA'
        Title.Caption = 'C.P.A.'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_CODAREATELEFONOS'
        Title.Caption = 'Cod.Area.Tel'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_TELEFONOS'
        Title.Caption = 'Tel'#233'fonos'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_CODAREAFAX'
        Title.Caption = 'Cod.Area.Fax'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_FAX'
        Title.Caption = 'Fax'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_MATRICULA'
        Title.Caption = 'Matr'#237'cula'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Width = 77
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EN_FIRMACONVENIO'
        Title.Alignment = taCenter
        Title.Caption = 'Firma Convenio'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EN_ACTUALIZACONVENIO'
        Title.Alignment = taCenter
        Title.Caption = 'Actualiza Convenio'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Canal'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAAPROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobado'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJECUTIVOCTA'
        Title.Caption = 'Ejecutivo Cuenta'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EN_VIP'
        Title.Alignment = taCenter
        Title.Caption = 'Entidad VIP'
        Width = 47
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 62
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EN_ENTRAMITE'
        Title.Alignment = taCenter
        Title.Caption = 'En Tr'#225'mite'
        Width = 61
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 171
    Width = 790
    Height = 400
    OnBeforeShow = fpAbmBeforeShow
    Constraints.MaxHeight = 400
    Constraints.MinHeight = 400
    Constraints.MinWidth = 790
    DesignSize = (
      790
      400)
    inherited BevelAbm: TBevel
      Left = 3
      Top = 361
      Width = 784
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel [2]
      Left = 134
      Top = 16
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    object Label4: TLabel [3]
      Left = 248
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    inherited btnAceptar: TButton
      Left = 637
      Top = 372
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 712
      Top = 372
      TabOrder = 5
    end
    object edEN_ID: TEdit
      Left = 56
      Top = 12
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      MaxLength = 8
      TabOrder = 3
      Visible = False
    end
    object edEN_CUIT: TMaskEdit
      Left = 160
      Top = 12
      Width = 79
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 1
    end
    object edEN_NOMBRE: TEdit
      Left = 292
      Top = 12
      Width = 489
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
    object edEN_CODBANCO: TIntEdit
      Left = 55
      Top = 12
      Width = 74
      Height = 21
      TabOrder = 0
      MaxLength = 5
    end
    object pgCtrlEntidad: TPageControl
      Left = 2
      Top = 37
      Width = 786
      Height = 322
      ActivePage = tsContactos
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 6
      object tsDatosGenerales: TTabSheet
        Caption = 'Datos Generales'
        DesignSize = (
          778
          294)
        object Label5: TLabel
          Left = 2
          Top = 7
          Width = 53
          Height = 13
          AutoSize = False
          Caption = 'Resp.'
        end
        object Label7: TLabel
          Left = 2
          Top = 117
          Width = 53
          Height = 13
          AutoSize = False
          Caption = 'Tel'#233'fonos'
        end
        object Label8: TLabel
          Left = 320
          Top = 117
          Width = 18
          Height = 13
          Caption = 'Fax'
        end
        object Label14: TLabel
          Left = 272
          Top = 7
          Width = 55
          Height = 13
          Caption = 'Beneficiario'
        end
        object Label20: TLabel
          Left = 2
          Top = 34
          Width = 53
          Height = 13
          AutoSize = False
          Caption = 'Domicilio'
        end
        object Label23: TLabel
          Left = 634
          Top = 117
          Width = 43
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Matr'#237'cula'
        end
        object lbNro: TLabel
          Left = 659
          Top = 34
          Width = 19
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Alta'
        end
        object Label24: TLabel
          Left = 2
          Top = 144
          Width = 53
          Height = 13
          AutoSize = False
          Caption = 'Canal'
        end
        object Label15: TLabel
          Left = 2
          Top = 169
          Width = 53
          Height = 13
          AutoSize = False
          Caption = 'Observ.'
        end
        object Label28: TLabel
          Left = 320
          Top = 138
          Width = 52
          Height = 26
          AutoSize = False
          Caption = 'Fecha Ult. Convenio'
          WordWrap = True
        end
        object Label31: TLabel
          Left = 462
          Top = 142
          Width = 31
          Height = 13
          Caption = 'Deleg.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edEN_RESPONSABLE: TEdit
          Left = 56
          Top = 3
          Width = 207
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 60
          TabOrder = 0
        end
        object edEN_CODAREATELEFONOS: TIntEdit
          Left = 56
          Top = 113
          Width = 49
          Height = 21
          TabOrder = 5
          MaxLength = 5
        end
        object edEN_TELEFONOS: TPatternEdit
          Left = 108
          Top = 113
          Width = 205
          Height = 21
          MaxLength = 60
          TabOrder = 6
          Pattern = '0123456789()-/'
        end
        object edEN_CODAREAFAX: TIntEdit
          Left = 342
          Top = 113
          Width = 49
          Height = 21
          TabOrder = 7
          MaxLength = 5
        end
        object edEN_FAX: TPatternEdit
          Left = 394
          Top = 113
          Width = 235
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 60
          TabOrder = 8
          Pattern = '0123456789()-/'
        end
        object edEN_BENEFICIARIO: TEdit
          Left = 336
          Top = 3
          Width = 318
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 60
          TabOrder = 1
        end
        object edEN_DOMICILIO: TEdit
          Left = 56
          Top = 30
          Width = 599
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object edEN_MATRICULA: TIntEdit
          Left = 682
          Top = 113
          Width = 89
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 9
        end
        inline fraDomicilio: TfraDomicilioTrab
          Left = 1
          Top = 57
          Width = 770
          Height = 50
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          DesignSize = (
            770
            50)
          inherited lbCalle: TLabel
            Left = 2
          end
          inherited lbNro: TLabel
            Left = 555
          end
          inherited lbPiso: TLabel
            Left = 627
            Width = 19
          end
          inherited lbDto: TLabel
            Left = 703
            Width = 21
          end
          inherited lbCPostal: TLabel
            Left = 2
            Width = 40
          end
          inherited lbCPA: TLabel
            Left = 109
            Width = 20
          end
          inherited lbLocalidad: TLabel
            Left = 195
            Width = 44
          end
          inherited lbProvincia: TLabel
            Left = 608
            Width = 43
          end
          inherited cmbCalle: TArtComboBox
            Left = 54
            Width = 497
            Font.Name = 'Tahoma'
          end
          inherited edNumero: TEdit
            Left = 577
            Font.Name = 'Tahoma'
          end
          inherited edPiso: TEdit
            Left = 653
            Font.Name = 'Tahoma'
          end
          inherited edDto: TEdit
            Left = 725
            Font.Name = 'Tahoma'
          end
          inherited edCPostal: TIntEdit
            Left = 54
            Font.Name = 'Tahoma'
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 356
            Font.Name = 'Tahoma'
          end
          inherited edProvincia: TEdit
            Left = 657
            Font.Name = 'Tahoma'
          end
          inherited edCPA: TPatternEdit
            Left = 133
            Font.Name = 'Tahoma'
          end
        end
        object edEN_FECHAALTA: TDateComboBox
          Left = 683
          Top = 30
          Width = 89
          Height = 21
          AutoExit = True
          Anchors = [akTop, akRight]
          TabOrder = 14
        end
        inline fraEN_IDCANAL: TfraCanal
          Left = 55
          Top = 139
          Width = 259
          Height = 23
          TabOrder = 10
          DesignSize = (
            259
            23)
          inherited cmbDescripcion: TComboGrid
            Width = 196
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
        object edEN_OBSERVACIONES: TEdit
          Left = 56
          Top = 168
          Width = 716
          Height = 121
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = False
          MaxLength = 250
          TabOrder = 13
        end
        object edEN_FECHAULTCONVENIO: TDateComboBox
          Left = 370
          Top = 139
          Width = 89
          Height = 21
          AutoExit = True
          TabOrder = 11
        end
        inline fraEN_IDDELEGACION: TfraCodDesc
          Left = 493
          Top = 139
          Width = 279
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 12
          DesignSize = (
            279
            23)
          inherited cmbDescripcion: TArtComboBox
            Top = 0
            Width = 214
          end
          inherited edCodigo: TPatternEdit
            Top = 0
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'el_fechabaja'
            FieldCodigo = 'el_id'
            FieldDesc = 'el_nombre'
            FieldID = 'el_id'
            IdType = ctInteger
            TableName = 'del_delegacion'
          end
        end
        object chkEN_VIP: TCheckBox
          Left = 695
          Top = 7
          Width = 76
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Entidad VIP'
          TabOrder = 2
        end
      end
      object tsComision: TTabSheet
        Caption = 'Comisi'#243'n'
        ImageIndex = 1
        DesignSize = (
          778
          294)
        object Label9: TLabel
          Left = 223
          Top = 12
          Width = 102
          Height = 13
          AutoSize = False
          Caption = 'Modo de Liquidaci'#243'n'
        end
        object GroupBox6: TGroupBox
          Left = 7
          Top = 3
          Width = 211
          Height = 100
          Caption = 'Comisiones'
          TabOrder = 0
          object Label16: TLabel
            Left = 18
            Top = 14
            Width = 86
            Height = 13
            Caption = 'Tiene Vendedores'
          end
          object Label17: TLabel
            Left = 19
            Top = 35
            Width = 115
            Height = 13
            Caption = 'Comisi'#243'n Sector Privado'
          end
          object Label18: TLabel
            Left = 39
            Top = 77
            Width = 94
            Height = 13
            Caption = 'Plus para la Entidad'
          end
          object Label26: TLabel
            Left = 22
            Top = 56
            Width = 112
            Height = 13
            Caption = 'Comisi'#243'n Sector P'#250'blico'
          end
          object rbEN_CONVENDEDORNo: TRadioButton
            Left = 113
            Top = 13
            Width = 41
            Height = 17
            Caption = 'No'
            TabOrder = 0
          end
          object rbEN_CONVENDEDORSi: TRadioButton
            Left = 157
            Top = 13
            Width = 32
            Height = 17
            Caption = 'Si'
            TabOrder = 1
          end
          object edEN_PORCCOMISIONVEND: TCurrencyEdit
            Left = 140
            Top = 30
            Width = 45
            Height = 21
            AutoSize = False
            DisplayFormat = '0.00;-0.00'
            MaxLength = 10
            MaxValue = 100.000000000000000000
            TabOrder = 2
            ZeroEmpty = False
            OnChange = edEN_COMISIONVENDChange
          end
          object edEN_PORCCOMISIONENT: TCurrencyEdit
            Left = 140
            Top = 74
            Width = 45
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00;-,0.00'
            MaxLength = 10
            MaxValue = 100.000000000000000000
            TabOrder = 4
            ZeroEmpty = False
            OnChange = edEN_COMISIONENTChange
          end
          object edEN_PORCCOMISIONVENDPUB: TCurrencyEdit
            Left = 140
            Top = 52
            Width = 45
            Height = 21
            AutoSize = False
            DisplayFormat = '0.00;-0.00'
            MaxLength = 10
            MaxValue = 100.000000000000000000
            TabOrder = 3
            ZeroEmpty = False
            OnChange = edEN_PORCCOMISIONVENDPUBChange
          end
        end
        inline fraEN_MODOLIQ: TfraStaticCTB_TABLAS
          Left = 325
          Top = 7
          Width = 447
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          DesignSize = (
            447
            23)
          inherited cmbDescripcion: TComboGrid
            Width = 383
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
        object chkEN_ENTRAMITE: TCheckBox
          Left = 224
          Top = 41
          Width = 76
          Height = 17
          Caption = 'En Tr'#225'mite'
          TabOrder = 2
          OnClick = chkEN_ENTRAMITEClick
        end
        object chkEN_REQUIERESUCURSAL: TCheckBox
          Left = 224
          Top = 61
          Width = 109
          Height = 17
          Caption = 'Requiere Sucursal'
          TabOrder = 3
          OnClick = chkEN_ENTRAMITEClick
        end
      end
      object tsFacturacion: TTabSheet
        Caption = 'Facturaci'#243'n'
        ImageIndex = 2
        DesignSize = (
          778
          294)
        object Label10: TLabel
          Left = 264
          Top = 38
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ganancias'
        end
        object Label11: TLabel
          Left = 271
          Top = 68
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'O. Social'
        end
        object Label12: TLabel
          Left = 235
          Top = 96
          Width = 78
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nro. Obra Social'
        end
        object lbFImpresionFormInscripcion: TLabel
          Left = 7
          Top = 87
          Width = 81
          Height = 26
          AutoSize = False
          Caption = 'Impresi'#243'n Form. Inscripci'#243'n'
          WordWrap = True
        end
        object Label27: TLabel
          Left = 247
          Top = 12
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Condici'#243'n IVA'
        end
        object lbFRevision: TLabel
          Left = 7
          Top = 120
          Width = 79
          Height = 17
          AutoSize = False
          Caption = 'Fecha Revisi'#243'n'
          WordWrap = True
        end
        object GroupBox7: TGroupBox
          Left = 103
          Top = 3
          Width = 126
          Height = 37
          Caption = 'Convenio Multilateral'
          TabOrder = 1
          object rbEN_CONVENIONo: TRadioButton
            Left = 15
            Top = 15
            Width = 41
            Height = 17
            Caption = 'No'
            TabOrder = 0
          end
          object rbEN_CONVENIOSi: TRadioButton
            Left = 55
            Top = 15
            Width = 33
            Height = 17
            Caption = 'Si'
            TabOrder = 1
          end
        end
        object GroupBox1: TGroupBox
          Left = 7
          Top = 3
          Width = 95
          Height = 37
          Caption = 'Ingresos Brutos'
          TabOrder = 0
          object rbEN_INGRESOSBRUTOSSi: TRadioButton
            Left = 49
            Top = 15
            Width = 33
            Height = 17
            Caption = 'Si'
            TabOrder = 0
            OnClick = rbEN_INGRESOSBRUTOSSiClick
          end
          object rbEN_INGRESOSBRUTOSNo: TRadioButton
            Left = 9
            Top = 15
            Width = 41
            Height = 17
            Caption = 'No'
            TabOrder = 1
            OnClick = rbEN_INGRESOSBRUTOSNoClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 7
          Top = 40
          Width = 223
          Height = 44
          TabOrder = 2
          DesignSize = (
            223
            44)
          object Label13: TLabel
            Left = 9
            Top = 19
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
          end
          object edEN_NUMINGBRUTOS: TEdit
            Left = 52
            Top = 15
            Width = 164
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 15
            TabOrder = 0
          end
        end
        object edEN_NUMOSOCIAL: TEdit
          Left = 317
          Top = 91
          Width = 453
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 14
          TabOrder = 9
        end
        inline fraEN_GANANCIAS: TfraStaticCTB_TABLAS
          Left = 316
          Top = 33
          Width = 456
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
          DesignSize = (
            456
            23)
          inherited cmbDescripcion: TComboGrid
            Width = 392
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
        inline fraEN_OBRASOCIAL: TfraStaticCTB_TABLAS
          Left = 316
          Top = 63
          Width = 456
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
          DesignSize = (
            456
            23)
          inherited cmbDescripcion: TComboGrid
            Width = 392
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
        object edEN_FECHAIMPRESIONFORMINSCR: TDateComboBox
          Left = 90
          Top = 90
          Width = 89
          Height = 21
          AutoExit = True
          TabOrder = 3
        end
        inline fraSituacionIVA: TfraStaticCTB_TABLAS
          Left = 316
          Top = 7
          Width = 456
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          DesignSize = (
            456
            23)
          inherited cmbDescripcion: TComboGrid
            Width = 392
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
        object edEN_FECHAREVISION: TDateComboBox
          Left = 90
          Top = 118
          Width = 89
          Height = 21
          AutoExit = True
          TabOrder = 4
        end
        object chkEN_CBUINFORMADA: TCheckBox
          Left = 239
          Top = 119
          Width = 91
          Height = 17
          Alignment = taLeftJustify
          Caption = 'CBU informada'
          TabOrder = 10
        end
        object rbEN_FACTURA: TGroupBox
          Left = 7
          Top = 142
          Width = 95
          Height = 37
          Caption = 'Factura'
          TabOrder = 5
          object rbEN_FACTURASi: TRadioButton
            Left = 49
            Top = 15
            Width = 33
            Height = 17
            Caption = 'Si'
            TabOrder = 0
          end
          object rbEN_FACTURANo: TRadioButton
            Left = 9
            Top = 15
            Width = 41
            Height = 17
            Caption = 'No'
            TabOrder = 1
          end
        end
      end
      object tsContactos: TTabSheet
        Caption = 'Contactos'
        ImageIndex = 3
        object GrillaContactos: TArtDBGrid
          Left = 0
          Top = 29
          Width = 778
          Height = 265
          Align = alClient
          DataSource = dsContactos
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = GrillaContactosDblClick
          IniStorage = FormStorage
          OnGetCellParams = GrillaContactosGetCellParams
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'MAIL'
              Title.Caption = 'Mail'
              Width = 202
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Title.Caption = 'Nombre'
              Width = 212
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CARGO'
              Title.Caption = 'Cargo'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONO'
              Title.Caption = 'Tel'#233'fono'
              Width = 114
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'USUARIO_WEB'
              Title.Alignment = taCenter
              Title.Caption = 'Usuario Web'
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'RESPONSABLE_ART'
              Title.Alignment = taCenter
              Title.Caption = 'Responsable ART'
              Width = 93
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FECHABAJA'
              Title.Alignment = taCenter
              Title.Caption = 'F. Baja'
              Width = 61
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FNACIMIENTO'
              Title.Alignment = taCenter
              Title.Caption = 'F. Nacimiento'
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'AVISOOP'
              Title.Alignment = taCenter
              Title.Caption = 'Aviso Orden Pago'
              Width = 99
              Visible = True
            end>
        end
        object CoolBar1: TCoolBar
          Left = 0
          Top = 0
          Width = 778
          Height = 29
          Bands = <
            item
              Control = ToolBar1
              ImageIndex = -1
              MinHeight = 27
              Width = 774
            end>
          object ToolBar1: TToolBar
            Left = 9
            Top = 0
            Width = 761
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbNuevoContacto: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo'
              ImageIndex = 6
              OnClick = tbNuevoContactoClick
            end
            object tbModificarContacto: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar'
              Enabled = False
              ImageIndex = 7
              OnClick = tbModificarContactoClick
            end
            object tbEliminarContacto: TToolButton
              Left = 46
              Top = 0
              Hint = 'Baja'
              Enabled = False
              ImageIndex = 8
              OnClick = tbEliminarContactoClick
            end
          end
        end
      end
    end
  end
  object fpCerrarVigencia: TFormPanel [4]
    Left = 85
    Top = 575
    Width = 174
    Height = 92
    Caption = 'Cierre de Vigencia'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpCerrarVigenciaBeforeShow
    DesignSize = (
      174
      92)
    object Bevel1: TBevel
      Left = 0
      Top = 54
      Width = 174
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label22: TLabel
      Left = 11
      Top = 23
      Width = 84
      Height = 13
      Caption = 'Cerrar vigencia al'
    end
    object btnAceptarCerrarVigencia: TButton
      Left = 47
      Top = 61
      Width = 59
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object edCerrarVigencia: TPeriodoPicker
      Left = 101
      Top = 20
      Width = 55
      Height = 21
      TabOrder = 1
      TabStop = True
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 3
      Periodo.Ano = 2003
      Periodo.Valor = '200303'
      Periodo.MaxPeriodo = '205303'
      Periodo.MinPeriodo = '195304'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'Tahoma'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NullDropDown = SetMax
    end
    object btnCancelarCerrarVigencia: TButton
      Left = 107
      Top = 61
      Width = 59
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object fpEjecutivoCuenta: TFormPanel [5]
    Left = 84
    Top = 672
    Width = 404
    Height = 84
    Caption = 'Ejecutivo de Cuenta'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 84
    Constraints.MaxWidth = 404
    Constraints.MinHeight = 84
    Constraints.MinWidth = 404
    DesignSize = (
      404
      84)
    object Label29: TLabel
      Left = 8
      Top = 20
      Width = 44
      Height = 13
      Caption = 'Ejecutivo'
    end
    inline fraEjecutivo: TfraStaticCodigoDescripcion
      Left = 58
      Top = 17
      Width = 335
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnEnter = fraEjecutivoEnter
      DesignSize = (
        335
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 272
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
    object btnAceptarEjCuenta: TButton
      Left = 240
      Top = 53
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarEjCuentaClick
    end
    object btnCancelarEjCuenta: TButton
      Left = 318
      Top = 53
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object fpContacto: TFormPanel [6]
    Left = 496
    Top = 574
    Width = 450
    Height = 251
    Caption = 'Contacto'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      450
      251)
    object Label25: TLabel
      Left = 8
      Top = 70
      Width = 49
      Height = 13
      AutoSize = False
      Caption = 'Cargo'
    end
    object Label6: TLabel
      Left = 8
      Top = 14
      Width = 49
      Height = 13
      AutoSize = False
      Caption = 'E-Mail'
    end
    object Label30: TLabel
      Left = 8
      Top = 41
      Width = 49
      Height = 13
      AutoSize = False
      Caption = 'Nombre'
    end
    object Label32: TLabel
      Left = 8
      Top = 98
      Width = 49
      Height = 13
      AutoSize = False
      Caption = 'Tel'#233'fono'
    end
    object Bevel2: TBevel
      Left = 0
      Top = 213
      Width = 449
      Height = 4
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label33: TLabel
      Left = 8
      Top = 124
      Width = 49
      Height = 13
      AutoSize = False
      Caption = 'F. Nacim.'
    end
    object btnAceptarContacto: TButton
      Left = 288
      Top = 220
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = btnAceptarContactoClick
    end
    object btnCancelarContacto: TButton
      Left = 366
      Top = 220
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 9
    end
    object edMailContacto: TEdit
      Left = 60
      Top = 10
      Width = 379
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 120
      TabOrder = 0
    end
    object edNombreContacto: TEdit
      Left = 60
      Top = 38
      Width = 379
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 120
      TabOrder = 1
    end
    inline fraCargoContacto: TfraCtbTablas
      Left = 60
      Top = 65
      Width = 379
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        379
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 326
      end
    end
    object rgRespARTContacto: TRadioGroup
      Left = 59
      Top = 145
      Width = 180
      Height = 65
      Caption = 'Responsable ART'
      Items.Strings = (
        'Si'
        'No')
      TabOrder = 7
    end
    object edTelContacto: TPatternEdit
      Left = 112
      Top = 94
      Width = 327
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 4
      Pattern = '0123456789()-/'
    end
    object edCodAreaTelContacto: TPatternEdit
      Left = 60
      Top = 94
      Width = 48
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 5
      TabOrder = 3
      Pattern = '0123456789'
    end
    object edFNacimientoContacto: TDateComboBox
      Left = 60
      Top = 121
      Width = 89
      Height = 21
      AutoExit = True
      TabOrder = 5
    end
    object chkAvisoOP: TCheckBox
      Left = 330
      Top = 124
      Width = 108
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Aviso Orden Pago'
      TabOrder = 6
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT EN_ID, EN_CUIT, EN_NOMBRE, EN_RESPONSABLE, EN_FECHAALTA,'
      
        '       EN_BENEFICIARIO, EN_CODBANCO, EN_CALLE, EN_LOCALIDAD, EN_' +
        'CPOSTAL, PV_DESCRIPCION, EN_NUMERO, EN_PISO,'
      
        '       EN_DEPARTAMENTO, EN_MATRICULA,  EN_CPOSTALA, EN_CODAREATE' +
        'LEFONOS, EN_TELEFONOS,  EN_CODAREAFAX, EN_FAX,'
      
        '       EN_DOMICILIO, EN_FECHABAJA,  EN_DIRELECTRONICA, EN_GANANC' +
        'IAS, EN_MODOLIQ, EN_IVA,  EN_OBRASOCIAL,'
      
        '       EN_NUMOSOCIAL, EN_INGRESOSBRUTOS,  EN_NUMINGBRUTOS, EN_MO' +
        'NOTRIBUTO, EN_CONVENDEDOR, '
      
        '       EN_PORCCOMISIONENT, EN_OBSERVACIONES,  EN_CATEGORIA, EN_C' +
        'ONVENIO, EN_FIRMACONVENIO, EN_CREARVENDEDOR,'
      
        '       EN_ENTRAMITE, EN_FECHAIMPRESIONFORMINSCR, EN_ACTUALIZACON' +
        'VENIO'
      '  FROM XEN_ENTIDAD, CPV_PROVINCIAS '
      ' WHERE EN_PROVINCIA = PV_CODIGO(+)'
      ''
      '')
    Left = 8
    Top = 388
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 388
  end
  inherited SortDialog: TSortDialog
    Left = 8
    Top = 416
  end
  inherited ExportDialog: TExportDialog
    Left = 36
    Top = 416
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 36
    Top = 444
  end
  inherited Seguridad: TSeguridad
    AutoEjecutar = True
    DBLogin = frmPrincipal.DBLogin
    Left = 8
    Top = 360
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 360
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
    Top = 444
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
      end
      item
        Key = 16458
        LinkControl = tbEjecutivoCuenta
      end
      item
        Key = 16466
        LinkControl = tbReactivar
      end>
    Left = 64
    Top = 360
  end
  inherited FieldHider: TFieldHider
    Left = 64
    Top = 388
  end
  object sdqContactos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT CE_MAIL MAIL, CE_NOMBRE NOMBRE, TB_DESCRIPCION CARGO,'
      
        '       ART.UTILES.ARMAR_TELEFONO(CE_CODAREATELEFONO, NULL, CE_TE' +
        'LEFONO) TELEFONO,'
      '       DECODE(CE_IDUSUARIOWEB, NULL, '#39'NO'#39', '#39'SI'#39') USUARIO_WEB, '
      
        '       DECODE(CE_RESPONSABLEART, '#39'S'#39', '#39'SI'#39', '#39'NO'#39') RESPONSABLE_AR' +
        'T,'
      
        '       TRUNC(CE_FECHABAJA) FECHABAJA, CE_CODAREATELEFONO CODAREA' +
        'TEL, CE_TELEFONO TEL,'
      
        '       CE_CARGO CODCARGO, CE_RESPONSABLEART CODRESPART, CE_ID ID' +
        ','
      '       CE_FECHANACIMIENTO FNACIMIENTO, CE_AVISOOP AVISOOP'
      '  FROM CTB_TABLAS, XCE_CONTACTOENTIDAD'
      ' WHERE CE_IDENTIDAD = :IdEntidad'
      '   AND TB_CLAVE(+) = '#39'CARGO'#39
      '   AND TB_CODIGO(+) = CE_CARGO'
      ' ORDER BY CE_NOMBRE   '
      ''
      ''
      '')
    Left = 152
    Top = 291
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdEntidad'
        ParamType = ptInput
      end>
  end
  object dsContactos: TDataSource
    DataSet = sdqContactos
    Left = 180
    Top = 291
  end
end
