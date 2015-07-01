inherited frmABMUsuariosPorSector: TfrmABMUsuariosPorSector
  Left = 210
  Top = 162
  Width = 640
  Height = 480
  Caption = 'Responsables por Sector'
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 632
    Height = 53
    Visible = True
    object lbSector: TLabel
      Left = 12
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object chkBajas: TCheckBox
      Left = 340
      Top = 26
      Width = 181
      Height = 17
      Caption = 'No ver relaciones dadas de baja'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    inline fraES_SECTOR: TfraSectores
      Left = 11
      Top = 24
      Width = 325
      Height = 24
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 240
        Columns = <
          item
            Expanded = False
            FieldName = 'SC_CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SC_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 200
            Visible = True
          end>
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 53
    Width = 632
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 628
      end>
    inherited ToolBar: TToolBar
      Width = 615
    end
  end
  inherited Grid: TArtDBGrid
    Top = 82
    Width = 632
    Height = 371
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'ES_SECTOR'
        Title.Caption = 'C'#243'digo del Sector'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR_INTRANET'
        Title.Caption = 'Sector Intranet'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Usuario'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESPONSABLE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Caption = 'Responsable'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_USUALTA'
        Title.Caption = 'Usuario de alta'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_FECHAALTA'
        Title.Caption = 'Fecha de alta'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 148
    Top = 172
    Width = 433
    Height = 165
    Position = poScreenCenter
    Constraints.MaxHeight = 165
    Constraints.MinHeight = 165
    Constraints.MinWidth = 433
    inherited BevelAbm: TBevel
      Top = 129
      Width = 425
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 12
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object Label2: TLabel [2]
      Left = 12
      Top = 56
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    inherited btnAceptar: TButton
      Left = 278
      Top = 135
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 353
      Top = 135
      TabOrder = 4
    end
    inline fraSector: TfraSectores
      Left = 11
      Top = 28
      Width = 414
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 329
        Columns = <
          item
            Expanded = False
            FieldName = 'SC_CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SC_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 200
            Visible = True
          end>
      end
    end
    inline fraUsuario: TfraUsuario
      Left = 12
      Top = 76
      Width = 413
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 329
      end
    end
    object chkResponsable: TCheckBox
      Left = 12
      Top = 104
      Width = 97
      Height = 17
      AllowGrayed = True
      Caption = 'Responsable'
      State = cbGrayed
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ces.*, users.*, usc.sc_descripcion as sector, cse.se_desc' +
        'ripcion as sector_intranet, DECODE(ces.es_responsable, '#39'S'#39', '#39#252#39',' +
        ' '#39#251#39') as responsable'
      
        '  FROM computos.cse_sector cse, art.usc_sectores usc, comunes.ce' +
        's_emailsector ces, art.use_usuarios users'
      ' WHERE ces.es_direlectronica = users.se_usuario'
      '   AND NVL(ces.es_responsable, '#39'R'#39') <> '#39'R'#39
      '   AND users.se_idsector = cse.se_id'
      '   AND users.se_sector = usc.sc_codigo')
  end
  object ShortCutControlHijo: TShortCutControl
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
    Left = 80
    Top = 200
  end
end
