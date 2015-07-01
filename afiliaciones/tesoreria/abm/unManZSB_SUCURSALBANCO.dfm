inherited frmManZSB_SUCURSALBANCO: TfrmManZSB_SUCURSALBANCO
  Caption = 'Mantenimiento de Sucursales Bancarias'
  ClientHeight = 470
  ClientWidth = 692
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  ExplicitWidth = 700
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 61
    Visible = True
    ExplicitWidth = 692
    ExplicitHeight = 61
    DesignSize = (
      692
      61)
    object gbBanco: TGroupBox
      Left = 5
      Top = 0
      Width = 685
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Banco '
      TabOrder = 0
      DesignSize = (
        685
        43)
      inline fraBanco: TfraStaticCodigoDescripcion
        Left = 6
        Top = 14
        Width = 674
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 14
        ExplicitWidth = 674
        DesignSize = (
          674
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 611
          ExplicitWidth = 611
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
    object chkNoMostrarBajas: TCheckBox
      Left = 8
      Top = 44
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 61
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    ExplicitTop = 61
    ExplicitWidth = 692
    inherited ToolBar: TToolBar
      Width = 677
      ExplicitWidth = 677
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 90
    Width = 692
    Height = 380
    Columns = <
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 296
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 355
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRPROV'
        Title.Caption = 'Provincia'
        Width = 115
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 71
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 164
    Top = 141
    Width = 460
    Height = 177
    Constraints.MaxHeight = 177
    Constraints.MinHeight = 177
    Constraints.MinWidth = 460
    ExplicitLeft = 164
    ExplicitTop = 141
    ExplicitWidth = 460
    ExplicitHeight = 177
    inherited BevelAbm: TBevel
      Top = 141
      Width = 452
      ExplicitTop = 89
      ExplicitWidth = 452
    end
    object Label1: TLabel [1]
      Left = 7
      Top = 40
      Width = 55
      Height = 13
      AutoSize = False
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 7
      Top = 66
      Width = 55
      Height = 13
      AutoSize = False
      Caption = 'Nombre'
    end
    object Label3: TLabel [3]
      Left = 7
      Top = 12
      Width = 55
      Height = 13
      AutoSize = False
      Caption = 'Banco'
    end
    object Label4: TLabel [4]
      Left = 7
      Top = 91
      Width = 55
      Height = 13
      AutoSize = False
      Caption = 'Domicilio'
    end
    object Label5: TLabel [5]
      Left = 7
      Top = 119
      Width = 44
      Height = 13
      Caption = 'Provincia'
    end
    inherited btnAceptar: TButton
      Left = 302
      Top = 147
      TabOrder = 5
      ExplicitLeft = 302
      ExplicitTop = 95
    end
    inherited btnCancelar: TButton
      Left = 380
      Top = 147
      TabOrder = 6
      ExplicitLeft = 380
      ExplicitTop = 95
    end
    object edCodigoAltaModif: TEdit
      Left = 62
      Top = 36
      Width = 112
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 1
    end
    object edNombreAltaModif: TEdit
      Left = 62
      Top = 62
      Width = 388
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 2
    end
    inline fraBancoAltaModif: TfraStaticCodigoDescripcion
      Left = 62
      Top = 8
      Width = 391
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 62
      ExplicitTop = 8
      ExplicitWidth = 391
      DesignSize = (
        391
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 328
        ExplicitWidth = 328
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
    object edDomicilioAltaModif: TEdit
      Left = 62
      Top = 89
      Width = 388
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 512
      TabOrder = 3
    end
    inline fraProvAltaModif: TfraCodigoDescripcion
      Left = 62
      Top = 115
      Width = 388
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ExplicitLeft = 62
      ExplicitTop = 115
      ExplicitWidth = 388
      inherited cmbDescripcion: TArtComboBox
        Width = 323
        ExplicitWidth = 323
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT BA_NOMBRE BANCO, SB_CODIGO CODIGO, SB_NOMBRE NOMBRE, TRUN' +
        'C(SB_FECHABAJA) FECHABAJA,'
      
        '       SB_DOMICILIO DOMICILIO, SB_PROVINCIA CODPROV, PV_DESCRIPC' +
        'ION DESCRPROV'
      '  FROM ZSB_SUCURSALBANCO, ZBA_BANCO, CPV_PROVINCIAS'
      ' WHERE BA_ID = SB_IDBANCO'
      '   AND SB_PROVINCIA = PV_CODIGO(+)'
      '   AND 1 = 2 ')
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
        LinkControl = tbSalir
      end>
    Left = 111
    Top = 200
  end
end
