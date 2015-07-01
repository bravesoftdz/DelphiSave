inherited frmManASU_SUCURSAL: TfrmManASU_SUCURSAL
  Left = 305
  Top = 193
  Width = 533
  Height = 402
  Caption = 'Mantenimiento de Sucursales'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 525
    Height = 79
    Visible = True
    object Label5: TLabel
      Left = 10
      Top = 32
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label6: TLabel
      Left = 19
      Top = 7
      Width = 27
      Height = 13
      Caption = 'Canal'
    end
    object Label7: TLabel
      Left = 6
      Top = 57
      Width = 40
      Height = 13
      Caption = 'Sucursal'
    end
    inline fraEN_ID: TfraEntidades
      Left = 50
      Top = 27
      Width = 466
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 403
      end
    end
    inline fraEN_IDCANAL: TfraCanal
      Left = 50
      Top = 2
      Width = 466
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TComboGrid
        Left = 64
        Width = 403
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
    inline fraSU_ID: TfraSucursal
      Left = 50
      Top = 52
      Width = 466
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TComboGrid
        Left = 64
        Width = 403
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'Entidad'
          'Centro Regional')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          0)
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 79
    Width = 525
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 521
      end>
    inherited ToolBar: TToolBar
      Width = 508
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 108
    Width = 525
    Height = 267
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'SU_CODSUCURSAL'
        Title.Caption = 'C'#243'd. Sucursal'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_DESCRIPCION'
        Title.Caption = 'Sucursal'
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_CODBANCO'
        Title.Caption = 'Cod. Entidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREENTIDAD'
        Title.Caption = 'Entidad'
        Width = 223
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_CODIGO'
        Title.Caption = 'Cod. Canal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Canal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CENTROREGIONAL'
        Title.Caption = 'Centro Regional'
        Width = 174
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 112
    Top = 168
    Width = 400
    Height = 113
    Constraints.MinWidth = 320
    inherited BevelAbm: TBevel
      Top = 77
      Width = 392
    end
    object Label1: TLabel [1]
      Left = 28
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 131
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label3: TLabel [3]
      Left = 25
      Top = 32
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label4: TLabel [4]
      Left = 5
      Top = 56
      Width = 59
      Height = 13
      Caption = 'Centro Reg.'
    end
    inherited btnAceptar: TButton
      Left = 248
      Top = 83
      Width = 72
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 320
      Top = 83
      Width = 72
      TabOrder = 4
    end
    object edCodigo: TEdit
      Left = 65
      Top = 4
      Width = 60
      Height = 21
      TabOrder = 0
    end
    inline fraEntidad: TfraEntidades
      Left = 64
      Top = 27
      Width = 334
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 269
      end
    end
    object edDescripcion: TEdit
      Left = 172
      Top = 4
      Width = 224
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    inline fraIDCENTROREG: TfraCentroRegional
      Left = 64
      Top = 51
      Width = 334
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      inherited cmbDescripcion: TComboGrid
        Width = 271
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
      
        'SELECT SU_ID, SU_CODSUCURSAL, SU_DESCRIPCION, SU_IDENTIDAD, SU_I' +
        'DCENTROREG,'
      '       EN_NOMBRE NOMBREENTIDAD, CR_DESCRIPCION CENTROREGIONAL'
      '  FROM ASU_SUCURSAL, XEN_ENTIDAD, ACR_CENTROREGIONAL'
      ' WHERE SU_IDENTIDAD = EN_ID'
      '   AND SU_IDCENTROREG = CR_ID')
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
