inherited frmConcAsociacionCodigos: TfrmConcAsociacionCodigos
  Left = 329
  Top = 165
  BorderIcons = [biMaximize]
  Caption = 'Asociación de Códigos'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 617
      end>
    inherited ToolBar: TToolBar
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
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
      inherited tbSalir: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Height = 405
    Columns = <
      item
        Expanded = False
        FieldName = 'EB_CODOPERACION'
        PickList.Strings = ()
        Title.Caption = 'Código'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_DESCRIPCION'
        PickList.Strings = ()
        Title.Caption = 'Descripción'
        Width = 398
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 16
    Top = 60
    Width = 465
    Height = 157
    inherited BevelAbm: TBevel
      Top = 121
      Width = 457
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 40
      Width = 56
      Height = 13
      Caption = 'Descripción'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 68
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 96
      Width = 46
      Height = 13
      Caption = 'Subgrupo'
    end
    inherited btnAceptar: TButton
      Left = 307
      Top = 127
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 385
      Top = 127
      TabOrder = 5
    end
    object edEB_CODOPERACION: TEdit
      Left = 72
      Top = 8
      Width = 121
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edEB_DESCRIPCION: TEdit
      Left = 72
      Top = 36
      Width = 389
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    inline fraCE_TIPO: TfraStaticCTB_TABLAS
      Left = 72
      Top = 64
      Width = 389
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 325
        Cells = (
          'Código'
          'Descripción'
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
    inline fraCE_IDCODIGOCONC: TfraCodigoDescripcion
      Left = 71
      Top = 92
      Width = 390
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 325
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT EB_CODOPERACION, EB_DESCRIPCION'
      '  FROM OEB_EXTRACTOBANCO'
      ' WHERE EB_CONCILIADO = '#39'N'#39
      '   AND NOT EXISTS (SELECT 1'
      '                     FROM OCE_CODIGOEXTRACTO'
      '                    WHERE EB_CODOPERACION = CE_CODIGO)')
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
