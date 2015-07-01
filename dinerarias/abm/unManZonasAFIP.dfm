inherited frmManZonasAFIP: TfrmManZonasAFIP
  Left = 107
  Top = 119
  Width = 600
  Height = 450
  Caption = 'Mantenimiento de Zonas AFIP'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Visible = True
    object GroupBox1: TGroupBox
      Left = 1
      Top = 0
      Width = 591
      Height = 42
      Caption = 'Provincia'
      TabOrder = 0
      DesignSize = (
        591
        42)
      inline fraProvincia: TfraStaticCodigoDescripcion
        Left = 15
        Top = 13
        Width = 569
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          569
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 506
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
  end
  inherited CoolBar: TCoolBar
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 592
    Height = 349
    Columns = <
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZA_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 323
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZA_ZONA'
        Title.Alignment = taCenter
        Title.Caption = 'Zona'
        Width = 42
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 112
    Width = 421
    Height = 122
    Constraints.MaxHeight = 122
    Constraints.MinHeight = 122
    Constraints.MinWidth = 421
    DesignSize = (
      421
      122)
    inherited BevelAbm: TBevel
      Top = 86
      Width = 413
    end
    object Label1: TLabel [1]
      Left = 7
      Top = 10
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Provincia'
    end
    object Label2: TLabel [2]
      Left = 7
      Top = 38
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Localidad'
    end
    object Label3: TLabel [3]
      Left = 7
      Top = 64
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'C'#243'digo Zona'
    end
    inherited btnAceptar: TButton
      Left = 263
      Top = 92
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 341
      Top = 92
      TabOrder = 4
    end
    inline fraProvinciaAM: TfraStaticCodigoDescripcion
      Left = 75
      Top = 7
      Width = 339
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        339
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 276
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
    object edLocalidadAM: TEdit
      Left = 76
      Top = 34
      Width = 337
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 1
    end
    object edZonaAM: TEdit
      Left = 76
      Top = 60
      Width = 51
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT PV_CODIGO, PV_DESCRIPCION, ZA_LOCALIDAD, ZA_ZONA, ZA_FECH' +
        'ABAJA, ZA_ID'
      '  FROM CPV_PROVINCIAS, SZA_ZONAAFIP'
      ' WHERE ZA_PROVINCIA = PV_CODIGO'
      '   ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
  end
end
