inherited frmManVendedoresPorCanal: TfrmManVendedoresPorCanal
  Left = 285
  Top = 163
  Width = 540
  Caption = 'Mantenimiento | Vendedores por Canal'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 532
    Height = 53
    Visible = True
    object Label6: TLabel
      Left = 27
      Top = 7
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Canal'
    end
    object Label1: TLabel
      Left = 8
      Top = 31
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    inline fraVE_IDCANAL: TfraCanal
      Left = 60
      Top = 2
      Width = 463
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TComboGrid
        Left = 64
        Width = 400
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
    inline fraVE_ID: TfraVendedores
      Left = 60
      Top = 26
      Width = 463
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 399
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 53
    Width = 532
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 528
      end>
    inherited ToolBar: TToolBar
      Width = 515
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 82
    Width = 532
    Height = 357
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CA_ID'
        Title.Caption = 'ID Canal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Canal'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_ID'
        Title.Caption = 'ID Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_VENDEDOR'
        Title.Caption = 'C'#243'digo Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_NOMBRE'
        Title.Caption = 'Vendedor'
        Width = 171
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Width = 388
    Height = 101
    Constraints.MinWidth = 280
    inherited BevelAbm: TBevel
      Top = 65
      Width = 380
    end
    object Label2: TLabel [1]
      Left = 28
      Top = 15
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Canal'
    end
    object Label3: TLabel [2]
      Left = 9
      Top = 39
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    inherited btnAceptar: TButton
      Left = 233
      Top = 71
      Width = 72
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 308
      Top = 71
      Width = 72
    end
    inline frafpVE_IDCANAL: TfraCanal
      Left = 60
      Top = 10
      Width = 321
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TComboGrid
        Left = 64
        Width = 257
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
    inline frafpVE_ID: TfraVendedores
      Left = 60
      Top = 34
      Width = 321
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 257
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT CA_ID, CA_DESCRIPCION, VE_ID, VE_VENDEDOR, VE_NOMBRE '
      '  FROM XVE_VENDEDOR, ACA_CANAL'
      ' WHERE VE_IDCANAL = CA_ID')
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
