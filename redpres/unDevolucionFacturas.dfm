inherited frmDevolucionFacturas: TfrmDevolucionFacturas
  Left = 288
  Top = 182
  Width = 676
  Caption = 'Devoluci'#243'n de facturas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 668
    Height = 92
    Visible = True
    DesignSize = (
      668
      92)
    object GroupBox3: TGroupBox
      Left = 1
      Top = 3
      Width = 201
      Height = 43
      Caption = ' Fecha de devoluci'#243'n '
      TabOrder = 0
      object Label4: TLabel
        Left = 92
        Top = 20
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
      object dcHastaDevol: TDateComboBox
        Left = 108
        Top = 16
        Width = 87
        Height = 21
        MinDateCombo = dcDesdeDevol
        TabOrder = 1
      end
      object dcDesdeDevol: TDateComboBox
        Left = 5
        Top = 16
        Width = 86
        Height = 21
        MaxDateCombo = dcHastaDevol
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 204
      Top = 3
      Width = 463
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Prestador '
      TabOrder = 1
      DesignSize = (
        463
        43)
      inline fraPrestadorFiltro: TfraPrestador
        Left = 2
        Top = 13
        Width = 457
        Height = 24
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        DesignSize = (
          440
          24)
        inherited lbCPostal: TLabel
          Left = 369
        end
        inherited lbTelefono: TLabel
          Left = 281
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 0
          DataSource = nil
        end
        inherited cmbPrestador: TArtComboBox
          Width = 111
        end
        inherited edPresLocalidad: TEdit
          Width = 15
        end
        inherited edPresCPostal: TEdit
          Left = 386
        end
        inherited edPresTelefono: TEdit
          Left = 301
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 46
      Width = 201
      Height = 43
      Caption = ' Motivo de devoluci'#243'n '
      TabOrder = 2
      inline fraMotivoFiltro: TfraCodigoDescripcion
        Left = 3
        Top = 15
        Width = 194
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 40
          Width = 155
        end
        inherited edCodigo: TPatternEdit
          Width = 36
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 204
      Top = 46
      Width = 463
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Proveedor '
      TabOrder = 3
      DesignSize = (
        463
        43)
      object Label10: TLabel
        Left = 6
        Top = 20
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraProveedorFiltro: TfraOPV_PROVEEDOR
        Left = 36
        Top = 15
        Width = 423
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited lbRSocial: TLabel
          Left = 82
          Top = 5
        end
        inherited lbNumero: TLabel
          Left = 321
          Top = 5
        end
        inherited cmbRSocial: TArtComboBox
          Left = 128
          Width = 188
        end
        inherited edNumero: TIntEdit
          Left = 366
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 92
    Width = 668
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 664
      end>
    inherited ToolBar: TToolBar
      Width = 651
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbEnviarCarta: TToolButton
        Left = 370
        Top = 0
        Hint = 'Generar carta (Ctrl+G)'
        Caption = 'tbEnviarCarta'
        ImageIndex = 31
        OnClick = tbEnviarCartaClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 121
    Width = 668
    Height = 315
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnContextPopup = GridContextPopup
    Columns = <
      item
        Expanded = False
        FieldName = 'checkbox'
        Title.Caption = '.'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'df_tipo'
        Title.Caption = 'Tipo'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'df_fechadevol'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha devol.'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'df_fechamail'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha mail'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'df_fechaimpre'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha impresi'#243'n'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'df_cuit'
        Title.Caption = 'CUIT'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'df_nombre'
        Title.Caption = 'Nombre'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'df_motivo'
        Title.Caption = 'Motivo devoluci'#243'n'
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'df_fecharecepfac'
        Title.Alignment = taCenter
        Title.Caption = 'F. rec. factura'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'df_tipofac'
        Title.Caption = 'Tipo factura'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'df_numerofac'
        Title.Caption = 'Nro. factura'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'df_fechafac'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha factura'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'df_importefac'
        Title.Alignment = taCenter
        Title.Caption = 'Importe factura'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'df_mediodevol'
        Title.Caption = 'Medio devoluci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'df_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha baja'
        Width = 70
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 114
    Top = 168
    Width = 603
    Height = 219
    BorderStyle = bsSingle
    DesignSize = (
      603
      219)
    inherited BevelAbm: TBevel
      Top = 183
      Width = 595
    end
    object Label1: TLabel [1]
      Left = 10
      Top = 12
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 68
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object lblCuitProv: TLabel [3]
      Left = 14
      Top = 40
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inherited btnAceptar: TButton
      Left = 445
      Top = 189
      TabOrder = 10
    end
    inherited btnCancelar: TButton
      Left = 523
      Top = 189
      TabOrder = 11
    end
    object dcFechaABM: TDateComboBox
      Left = 46
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object rbPrestadorABM: TRadioButton
      Left = 140
      Top = 9
      Width = 65
      Height = 17
      Caption = 'Prestador'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbPrestadorABMClick
    end
    object rbProveedorABM: TRadioButton
      Left = 212
      Top = 9
      Width = 71
      Height = 17
      Caption = 'Proveedor'
      TabOrder = 2
      OnClick = rbPrestadorABMClick
    end
    inline fraPrestadorABM: TfraPrestador
      Left = 10
      Top = 34
      Width = 591
      Height = 24
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      TabOrder = 6
      DesignSize = (
        574
        24)
      inherited lbCUIT: TLabel
        Top = 6
      end
      inherited lbSec: TLabel
        Top = 6
      end
      inherited lbIdentif: TLabel
        Top = 6
      end
      inherited lbRSocial: TLabel
        Top = 6
      end
      inherited lbCPostal: TLabel
        Left = 503
      end
      inherited lbTelefono: TLabel
        Left = 415
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 134
        DataSource = nil
      end
      inherited cmbPrestador: TArtComboBox
        Width = 245
      end
      inherited edPresLocalidad: TEdit
        Width = 149
      end
      inherited edPresCPostal: TEdit
        Left = 520
      end
      inherited edPresTelefono: TEdit
        Left = 435
      end
    end
    object GroupBox5: TGroupBox
      Left = 3
      Top = 91
      Width = 598
      Height = 45
      Caption = ' Datos de la factura '
      TabOrder = 8
      object Label3: TLabel
        Left = 124
        Top = 20
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label5: TLabel
        Left = 251
        Top = 20
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label6: TLabel
        Left = 367
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Fecha'
      end
      object Label7: TLabel
        Left = 491
        Top = 20
        Width = 35
        Height = 13
        Caption = 'Importe'
      end
      object Label8: TLabel
        Left = 2
        Top = 20
        Width = 35
        Height = 13
        Caption = 'Recep.'
      end
      object cmbTipoFacABM: TArtComboBox
        Left = 148
        Top = 17
        Width = 103
        Height = 21
        DirectInput = False
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 1
        Columns = <
          item
            Expanded = False
            FieldName = 'TF_CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TF_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 240
            Visible = True
          end>
        DataSource = dsTipoFactura
        FieldList = 'TF_DESCRIPCION'
        FieldKey = 'TF_ID'
      end
      object edNroFacABM: TEdit
        Left = 291
        Top = 17
        Width = 73
        Height = 21
        MaxLength = 20
        TabOrder = 2
      end
      object dcFechaFacABM: TDateComboBox
        Left = 400
        Top = 17
        Width = 88
        Height = 21
        TabOrder = 3
      end
      object edImpFacABM: TCurrencyEdit
        Left = 529
        Top = 17
        Width = 64
        Height = 21
        AutoSize = False
        MaxLength = 12
        MaxValue = 999999999999.990000000000000000
        TabOrder = 4
      end
      object dcFechaRecABM: TDateComboBox
        Left = 38
        Top = 17
        Width = 86
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox6: TGroupBox
      Left = 3
      Top = 138
      Width = 254
      Height = 42
      Caption = ' Medio de devoluci'#243'n '
      TabOrder = 9
      object rbDevolCorreoABM: TRadioButton
        Left = 8
        Top = 18
        Width = 102
        Height = 17
        Caption = 'Correo Argentino'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbDevolBolsinABM: TRadioButton
        Left = 120
        Top = 18
        Width = 53
        Height = 17
        Caption = 'Bols'#237'n'
        TabOrder = 1
      end
      object rbDevolPersonalABM: TRadioButton
        Left = 184
        Top = 18
        Width = 65
        Height = 17
        Caption = 'Personal'
        TabOrder = 2
      end
    end
    object rbNoIngresadoABM: TRadioButton
      Left = 292
      Top = 9
      Width = 85
      Height = 17
      Caption = 'No ingresado'
      TabOrder = 3
      OnClick = rbPrestadorABMClick
    end
    object pnlNoIngresado: TPanel
      Left = 7
      Top = 34
      Width = 593
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 5
      Visible = False
      DesignSize = (
        593
        25)
      object lbCUIT: TLabel
        Left = 8
        Top = 6
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      object Label9: TLabel
        Left = 125
        Top = 6
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object mskCUITNI: TMaskEdit
        Left = 39
        Top = 2
        Width = 81
        Height = 21
        EditMask = '##-########-c;0;_'
        MaxLength = 13
        TabOrder = 0
      end
      object edNombreNI: TEdit
        Left = 168
        Top = 2
        Width = 423
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 250
        TabOrder = 1
      end
    end
    inline fraProveedorABM: TfraOPV_PROVEEDOR
      Left = 46
      Top = 36
      Width = 551
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Visible = False
      inherited lbRSocial: TLabel
        Left = 82
        Top = 5
      end
      inherited lbNumero: TLabel
        Left = 449
        Top = 5
      end
      inherited cmbRSocial: TArtComboBox
        Left = 128
        Width = 314
      end
      inherited edNumero: TIntEdit
        Left = 494
      end
    end
    inline fraMotivoABM: TfraCodigoDescripcion
      Left = 45
      Top = 63
      Width = 221
      Height = 23
      TabOrder = 7
      inherited cmbDescripcion: TArtComboBox
        Left = 40
        Width = 180
      end
      inherited edCodigo: TPatternEdit
        Width = 36
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT * FROM art.v_sdf_devolucionfacturas')
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Tipo'
        DataField = 'df_tipo'
        MaxLength = 10
      end
      item
        Title = 'F. devol.'
        TitleAlignment = taCenter
        DataField = 'df_fechadevol'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Medio devol.'
        DataField = 'df_mediodevol'
        MaxLength = 13
      end
      item
        Title = 'Motivo'
        DataField = 'df_motivo'
        MaxLength = 15
      end
      item
        Title = 'Fecha mail'
        TitleAlignment = taCenter
        DataField = 'df_fechamail'
        Alignment = taCenter
        MaxLength = 11
      end
      item
        Title = 'Fecha imp.'
        TitleAlignment = taCenter
        DataField = 'df_fechaimpre'
        Alignment = taCenter
        MaxLength = 11
      end
      item
        Title = 'Tipo f.'
        TitleAlignment = taCenter
        DataField = 'df_tipofac'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Numero fac.'
        DataField = 'df_numerofac'
        MaxLength = 13
      end
      item
        Title = 'F. rec. fac.'
        TitleAlignment = taCenter
        DataField = 'df_fecharecepfac'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'F. factura'
        TitleAlignment = taCenter
        DataField = 'df_fechafac'
        Alignment = taCenter
        MaxLength = 11
      end
      item
        Title = 'Importe'
        TitleAlignment = taCenter
        DataField = 'df_importefac'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'CUIT'
        DataField = 'df_cuit'
        MaxLength = 10
      end
      item
        Title = 'Nombre'
        DataField = 'df_nombre'
        MaxLength = 0
      end>
    DataSource = nil
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'Modificar'
      end
      item
        Name = 'Eliminar'
      end>
    DBLogin = frmPrincipal.DBLogin
  end
  object dsTipoFactura: TDataSource
    DataSet = sdqTipoFactura
    Left = 52
    Top = 313
  end
  object sdqTipoFactura: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   tf_id, tf_codigo, tf_descripcion'
      '    FROM SIN.stf_tipofacturadevol'
      '   WHERE tf_fechabaja IS NULL'
      'ORDER BY tf_descripcion')
    Left = 24
    Top = 313
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
        LinkControl = tbSalir2
      end
      item
        Key = 16455
        LinkControl = tbEnviarCarta
      end>
    Left = 80
    Top = 257
  end
end
