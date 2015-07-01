inherited frmManIncumplimientoEspecifico: TfrmManIncumplimientoEspecifico
  Left = 333
  Top = 183
  Width = 820
  Caption = 'Mantenimiento Incumplimiento Espec'#237'fico'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 812
  end
  inherited CoolBar: TCoolBar
    Width = 812
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 808
      end>
    inherited ToolBar: TToolBar
      Width = 795
    end
  end
  inherited Grid: TArtDBGrid
    Width = 812
    Columns = <
      item
        Expanded = False
        FieldName = 'TI_ID'
        Title.Caption = 'ID'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Area'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_USUMODIF'
        Title.Caption = 'Usuario Modif.'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_FECHAMODIF'
        Title.Caption = 'Fecha Modff.'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 91
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 381
    Height = 107
    inherited BevelAbm: TBevel
      Top = 71
      Width = 373
    end
    object lblDescripcion: TLabel [1]
      Left = 11
      Top = 13
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object lblArea: TLabel [2]
      Left = 11
      Top = 45
      Width = 25
      Height = 13
      Caption = 'Area:'
    end
    inherited btnAceptar: TButton
      Left = 223
      Top = 77
    end
    inherited btnCancelar: TButton
      Left = 301
      Top = 77
    end
    object edDescripcion: TEdit
      Left = 77
      Top = 11
      Width = 291
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
    inline fraAreas: TfraCodigoDescripcion
      Left = 76
      Top = 39
      Width = 300
      Height = 23
      TabOrder = 3
      DesignSize = (
        300
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 56
        Width = 235
      end
      inherited edCodigo: TPatternEdit
        Width = 50
        MaxLength = 8
        Alignment = taRightJustify
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ti_id, ti_descripcion, ti_usualta, ti_fechaalta,'
      
        '       ti_usumodif, ti_fechamodif, ti_usubaja, ti_fechabaja, TI_' +
        'AREA, sc_descripcion'
      '  FROM legales.lti_tipoincumplimiento, ART.USC_SECTORES'
      'WHERE TI_AREA =  SC_ID')
  end
end
