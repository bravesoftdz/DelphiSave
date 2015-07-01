inherited frmEstabSinAsignar: TfrmEstabSinAsignar
  Left = 194
  Top = 141
  Width = 619
  Height = 443
  Caption = 'Establecimientos sin Asignar'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 611
    Height = 58
    Visible = True
    object Label1: TLabel
      Left = 7
      Top = 36
      Width = 43
      Height = 13
      Caption = 'Provincia'
    end
    object Label2: TLabel
      Left = 300
      Top = 36
      Width = 44
      Height = 13
      Caption = 'Localidad'
    end
    object Label5: TLabel
      Left = 7
      Top = 7
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 58
      Top = 3
      Width = 542
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited lbRSocial: TLabel
        Left = 95
      end
      inherited lbContrato: TLabel
        Left = 440
      end
      inherited edContrato: TIntEdit
        Left = 485
      end
      inherited cmbRSocial: TArtComboBox
        Left = 138
        Width = 291
      end
    end
    inline fraProvincia: TfraCodigoDescripcionExt
      Left = 57
      Top = 30
      Width = 232
      Height = 23
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Left = 54
        Width = 178
        DataSource = nil
        OnDropDown = fraProvinciacmbDescripcionDropDown
      end
      inherited edCodigo: TPatternEdit
        Width = 51
      end
    end
    inline fraLocalidad: TfraCodigoDescripcionExt
      Left = 352
      Top = 30
      Width = 249
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnEnter = fraLocalidadEnter
      inherited cmbDescripcion: TArtComboBox
        Left = 54
        Width = 196
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'CP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROVINCIA'
            Title.Caption = 'Provincia'
            Visible = True
          end>
        DataSource = nil
        OnDropDown = fraLocalidadcmbDescripcionDropDown
      end
      inherited edCodigo: TPatternEdit
        Width = 51
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 58
    Width = 611
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 607
      end>
    inherited ToolBar: TToolBar
      Width = 594
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 35
        Style = tbsDivider
      end
      object tbAplicarSugerido: TToolButton
        Left = 378
        Top = 0
        Hint = 'Aplicar sugerido'
        Caption = 'tbAplicarSugerido'
        ImageIndex = 34
        OnClick = tbAplicarSugeridoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 87
    Width = 611
    Height = 329
    TitleFont.Name = 'Tahoma'
    MultiSelect = True
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'em_cuit'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Empresa'
        Width = 140
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'es_nroestableci'
        Title.Alignment = taCenter
        Title.Caption = 'Estab.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Caption = 'Establecimiento'
        Width = 156
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'es_cpostal'
        Title.Alignment = taCenter
        Title.Caption = 'CP'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pv_descripcion'
        Title.Caption = 'Provincia'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sector'
        Title.Caption = 'Sector'
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'capitas'
        Title.Alignment = taCenter
        Title.Caption = 'C'#225'pitas'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tipo'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo sugerido'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'actividad'
        Title.Alignment = taCenter
        Title.Caption = 'Activ.sugerida'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'it_nombre'
        Title.Caption = 'Preventor sugerido'
        Width = 132
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 164
    Top = 147
    Width = 419
    Height = 169
    BorderStyle = bsDialog
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 133
      Width = 411
    end
    object btnABMPreventores: TSpeedButton [1]
      Left = 385
      Top = 60
      Width = 19
      Height = 20
      Hint = 'Mantenimiento de'#13#10'Preventores'
      Anchors = [akTop, akRight]
      Glyph.Data = {
        F6020000424DF60200000000000036000000280000000E000000100000000100
        180000000000C0020000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0000FF00FFA47B6EC49D83BE967DBE957ABD9477BD9275BD9172BD8F
        6FBD8D6DC1916B9B6F5EFF00FFFF00FF0000FF00FFC09A86FFE0B4FAD5AAF9D3
        A5F9D0A0F8CE9BF7CB96F7C891F6C58CFCC988BA8B6DFF00FFFF00FF0000FF00
        FFBE9A8AFDE0BDFDE0BD9FB8908AA87CF6C58CF6C58CF6C58CF6C58CF8CB95B8
        8C74FF00FFFF00FF0000FF00FFBF9D90FCE5C755523F514B39AB8E79B0927BAF
        9078AD8D74C29F80FAD2A2B98F79FF00FFFF00FF0000FF00FFBF9F95FCE5C763
        825A4A7D4AEED7BAF7DBBDF6D9B9F6D7B4F5D5AFFBD9AFBA927FFF00FFFF00FF
        0000FF00FFC0A299FCF0DCFAE8D39FB8908AA87CF8E1C7F8DFC3F7DCBFF7DABA
        FDDFBBBA9584FF00FFFF00FF0000FF00FFC0A49EFDF7E87772634F4D3F9F8A80
        A69185A69082A58E7FB19988D9C1A8BB9889FF00FFFF00FF0000FF00FFC1A7A2
        FDF7E8658963457647EAE0D0FBECDBFAEAD8FAE8D4F9E6D0FFECD2BC9A8EFF00
        FFFF00FF0000FF00FFC2A9A7F6F9F4FDF7F0B0D3AE6E946EFCF1E6FBEFE2FBEE
        DEFBEBDBFFF2DEBD9D94FF00FFFF00FF0000FF00FFC2ABAAFFFFFF948C874C53
        428E7E7BA1928EA0908BA08F89A19089D6D1C4BFA39BFF00FFFF00FF0000FF00
        FFC2ACACFFFFFF6A816945824DC4C6C0FEFAF7FEF8F4FFF9F2F3EAE3DACEC7AD
        8F8BFF00FFFF00FF0000FF00FFC2ACACFFFFFFEEF4EFD7EEDB508356A4B7A6FF
        FDFBFFFFFFDDCDC89B70647C5453FF00FFFF00FF0000FF00FFC2ACACFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6DAD9865D57FF00FFFF00FFFF00FF
        0000FF00FFA17F7EBBA3A3B69E9DB69D9DB69D9DB59D9CB59C9CB79F9EA68888
        FF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000}
      Margin = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = btnABMPreventoresClick
    end
    object Label3: TLabel [2]
      Left = 9
      Top = 64
      Width = 48
      Height = 13
      Caption = 'Preventor'
    end
    object Label15: TLabel [3]
      Left = 9
      Top = 12
      Width = 64
      Height = 13
      Caption = 'Tipo empresa'
    end
    object Label4: TLabel [4]
      Left = 10
      Top = 38
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object Label6: TLabel [5]
      Left = 12
      Top = 111
      Width = 36
      Height = 13
      Caption = 'C'#225'pitas'
    end
    object Label7: TLabel [6]
      Left = 128
      Top = 111
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    inherited btnAceptar: TButton
      Left = 264
      Top = 139
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 339
      Top = 139
      TabOrder = 8
    end
    inline fraPreventor: TfraCodigoDescripcionExt
      Left = 81
      Top = 58
      Width = 301
      Height = 23
      Hint = 'Preventor asignado'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Left = 54
        Width = 248
        CharCase = ecUpperCase
        OnDropDown = fraPreventorcmbDescripcionDropDown
      end
      inherited edCodigo: TPatternEdit
        Width = 51
        CharCase = ecNormal
      end
    end
    inline fraTipo: TfraCtbTablas
      Left = 81
      Top = 9
      Width = 301
      Height = 23
      Hint = 'Tipo de Empresa'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 54
        Width = 248
      end
      inherited edCodigo: TPatternEdit
        Width = 51
      end
    end
    object chkEsReferente: TCheckBox
      Left = 81
      Top = 84
      Width = 88
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Es referente'
      TabOrder = 3
    end
    object cmbActividad: TExComboBox
      Left = 82
      Top = 34
      Width = 301
      Height = 22
      Style = csOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 16
      TabOrder = 1
      Items.Strings = (
        'A=Agro'
        'I=Industria'
        'C=Construcci'#243'n')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object cbSegunPerfil: TCheckBox
      Left = 201
      Top = 84
      Width = 143
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Seg'#250'n C'#243'd. Postal y Perfil'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = cbSegunPerfilClick
    end
    object EDCAPITAS: TEdit
      Left = 54
      Top = 108
      Width = 61
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clMenu
      ReadOnly = True
      TabOrder = 5
    end
    object EDSECTOR: TEdit
      Left = 165
      Top = 108
      Width = 244
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clMenu
      ReadOnly = True
      TabOrder = 6
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'select 1 from dual'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 6
    Top = 222
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 222
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'CUIT'
        DataField = 'em_cuit'
        FieldIndex = 0
      end
      item
        Title = 'Empresa'
        DataField = 'em_nombre'
        FieldIndex = 1
      end
      item
        Title = 'Estab.'
        DataField = 'es_nroestableci'
        FieldIndex = 2
      end
      item
        Title = 'Establecimiento'
        DataField = 'es_nombre'
        FieldIndex = 3
      end
      item
        Title = 'CP'
        DataField = 'es_cpostal'
        FieldIndex = 4
      end
      item
        Title = 'Provincia'
        DataField = 'pv_descripcion'
        FieldIndex = 5
      end>
    Left = 6
    Top = 252
  end
  inherited ExportDialog: TExportDialog
    Left = 36
    Top = 252
  end
  inherited QueryPrint: TQueryPrint
    Left = 36
    Top = 282
  end
  inherited Seguridad: TSeguridad
    Left = 6
    Top = 192
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 192
  end
  inherited PrintDialog: TPrintDialog
    Left = 6
    Top = 282
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
    Left = 66
    Top = 192
  end
  inherited FieldHider: TFieldHider
    Left = 66
    Top = 223
  end
end
