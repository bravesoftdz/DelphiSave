inherited frmInvInstituciones: TfrmInvInstituciones
  Left = 308
  Top = 198
  Width = 756
  Height = 500
  Caption = 'Instituciones'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 595
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 748
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 748
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 744
      end>
    inherited ToolBar: TToolBar
      Width = 731
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbCuentas: TToolButton
        Left = 370
        Top = 0
        Hint = 'Cuentas'
        ImageIndex = 29
        OnClick = tbCuentasClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlBajas: TPanel
        Left = 424
        Top = 0
        Width = 111
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkNoMostrarBajas: TCheckBox
          Left = 4
          Top = 3
          Width = 105
          Height = 17
          Caption = 'No Mostrar Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Width = 748
    Height = 438
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 452
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ES_BANCO'
        Title.Alignment = taCenter
        Title.Caption = 'Es Banco'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ES_COLOCADOR'
        Title.Alignment = taCenter
        Title.Caption = 'Es Colocador'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGOSWIFT'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo SWIFT'
        Width = 79
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 152
    Top = 72
    Width = 587
    Height = 123
    Constraints.MaxHeight = 123
    Constraints.MinHeight = 123
    Constraints.MinWidth = 587
    inherited BevelAbm: TBevel
      Top = 87
      Width = 579
    end
    object lbBanco: TLabel [1]
      Left = 9
      Top = 13
      Width = 37
      Height = 13
      Caption = 'Banco'
    end
    object Label1: TLabel [2]
      Left = 9
      Top = 39
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label2: TLabel [3]
      Left = 9
      Top = 66
      Width = 37
      Height = 13
      Caption = 'SWIFT'
    end
    inherited btnAceptar: TButton
      Left = 429
      Top = 93
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 507
      Top = 93
      TabOrder = 5
    end
    inline fraBancoAltaModif: TfraStaticCodigoDescripcion
      Left = 56
      Top = 9
      Width = 523
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        523
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 460
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
    object edNombreAltaModif: TEdit
      Left = 56
      Top = 36
      Width = 424
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 1
    end
    object chkColocadorAltaModif: TCheckBox
      Left = 488
      Top = 39
      Width = 89
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Es Colocador'
      TabOrder = 3
    end
    object edSWIFTAltaModif: TPatternEdit
      Left = 57
      Top = 61
      Width = 192
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 11
      TabOrder = 2
      Pattern = '0123456789ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ'
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT NS_ID CODIGO, NS_NOMBRE NOMBRE, '
      
        '       DECODE(NS_IDBANCO, NULL, '#39'N'#39', '#39'S'#39') ES_BANCO, NS_FECHABAJA' +
        ' FECHA_BAJA,'
      '       NS_CODIGOSWIFT CODIGOSWIFT'
      '   FROM NNS_INSTITUCION'
      '  WHERE 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
      end>
    Left = 109
    Top = 200
  end
end
