inherited frmManCodigoExtracto: TfrmManCodigoExtracto
  Left = 314
  Top = 173
  Caption = 'Mantenimiento | C'#243'digos de Extracto'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 1
    TabOrder = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    inherited ToolBar: TToolBar
      inherited tbEliminar: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object chkSinGrupo: TCheckBox
        Left = 378
        Top = 0
        Width = 79
        Height = 22
        Caption = 'Sin Grupo'
        TabOrder = 0
        OnClick = chkSinGrupoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Height = 409
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 241
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPO'
        Title.Caption = 'Grupo'
        Width = 242
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 445
    Height = 137
    Caption = 'Asociaci'#243'n de C'#243'digos'
    OnBeforeShow = fpAbmBeforeShow
    inherited BevelAbm: TBevel
      Top = 101
      Width = 437
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 22
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel [2]
      Left = 8
      Top = 48
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label8: TLabel [3]
      Left = 8
      Top = 74
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    inherited btnAceptar: TButton
      Left = 287
      Top = 107
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 365
      Top = 107
      TabOrder = 4
    end
    object edCE_CODIGO: TPatternEdit
      Left = 69
      Top = 17
      Width = 44
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 3
      TabOrder = 0
    end
    object edCE_DESCRIPCION: TEdit
      Left = 69
      Top = 44
      Width = 370
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 70
      TabOrder = 1
    end
    inline fraCE_IDCODIGOCONC: TfraStaticCodigoDescripcion
      Left = 68
      Top = 70
      Width = 372
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TComboGrid
        Width = 309
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
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CE_ID, CE_CODIGO CODIGO, CE_DESCRIPCION DESCRIPCION, CO_D' +
        'ESCRIPCION GRUPO, CE_IDCODIGOCONC'
      '  FROM OCE_CODIGOEXTRACTO, OCO_CODIGOCONCILIACION'
      ' WHERE CO_ID (+) = CE_IDCODIGOCONC')
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
