inherited frmManGrupoTrabajo2: TfrmManGrupoTrabajo2
  Left = 359
  Top = 195
  Caption = 'Mantenimiento de Grupos de Trabajo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 33
    Visible = True
    object chkVerBajas: TCheckBox
      Left = 4
      Top = 7
      Width = 69
      Height = 18
      Caption = 'Ver Bajas'
      TabOrder = 0
    end
  end
  inherited CoolBar: TCoolBar
    Top = 33
    inherited ToolBar: TToolBar
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Usuarios del Grupo (Ctrl+U)'
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 62
    Height = 377
    Columns = <
      item
        Expanded = False
        FieldName = 'GP_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_DIASMAX'
        Title.Caption = 'D'#237'as M'#225'ximos'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_SINIESTROS'
        Title.Caption = 'Asignable a Siniestros'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_FAX'
        Title.Caption = 'Fax'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_EMAIL'
        Title.Caption = 'E-Mail'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_CRONICO'
        Title.Caption = 'Cr'#243'nico'
        Width = 70
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 120
    Width = 485
    Height = 241
    OnBeforeShow = fpAbmBeforeShow
    inherited BevelAbm: TBevel
      Top = 205
      Width = 477
    end
    object Label1: TLabel [1]
      Left = 78
      Top = 15
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel [2]
      Left = 75
      Top = 38
      Width = 40
      Height = 13
      Caption = 'Nombre:'
    end
    object Label3: TLabel [3]
      Left = 56
      Top = 63
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object Label4: TLabel [4]
      Left = 44
      Top = 87
      Width = 70
      Height = 13
      Caption = 'D'#237'as M'#225'ximos:'
    end
    object Label5: TLabel [5]
      Left = 93
      Top = 134
      Width = 20
      Height = 13
      Caption = 'Fax:'
    end
    object Label6: TLabel [6]
      Left = 83
      Top = 159
      Width = 32
      Height = 13
      Caption = 'E-Mail:'
    end
    inherited btnAceptar: TButton
      Left = 327
      Top = 211
    end
    inherited btnCancelar: TButton
      Left = 405
      Top = 211
    end
    object edCodigo: TEdit
      Left = 119
      Top = 9
      Width = 46
      Height = 21
      MaxLength = 3
      ReadOnly = True
      TabOrder = 2
    end
    object edNombre: TEdit
      Left = 119
      Top = 33
      Width = 355
      Height = 21
      MaxLength = 30
      TabOrder = 3
    end
    object edDescripcion: TEdit
      Left = 119
      Top = 58
      Width = 355
      Height = 21
      MaxLength = 250
      TabOrder = 4
    end
    object edDiasMaximos: TIntEdit
      Left = 119
      Top = 82
      Width = 46
      Height = 21
      TabOrder = 5
      AutoExit = True
      MaxLength = 3
    end
    object chkAsignableASiniestros: TCheckBox
      Left = 7
      Top = 107
      Width = 125
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Asignable a Siniestros:'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object edFax: TEdit
      Left = 119
      Top = 129
      Width = 355
      Height = 21
      MaxLength = 50
      TabOrder = 7
    end
    object edEMail: TEdit
      Left = 119
      Top = 154
      Width = 355
      Height = 21
      MaxLength = 50
      TabOrder = 8
    end
    object chkCronico: TCheckBox
      Left = 73
      Top = 179
      Width = 59
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Cr'#243'nico:'
      TabOrder = 9
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   gp_codigo, gp_nombre, gp_descripcion, gp_fbaja, gp_sini' +
        'estros,'
      
        '         gp_diasmax, gp_fax, gp_email, gp_cronico, gp_usubaja, g' +
        'p_fechamodif,'
      '         gp_usumodif'
      '    FROM mgp_gtrabajo'
      '   WHERE 1 = 1'
      '         AND gp_fbaja is null'
      'ORDER BY gp_nombre')
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
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
        Key = 16469
        LinkControl = tbPropiedades
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
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
