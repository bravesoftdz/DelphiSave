inherited frmImpuestosManEntidadRecaudadora: TfrmImpuestosManEntidadRecaudadora
  Width = 662
  Height = 500
  Caption = 'Entidades Recaudadoras'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 662
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 654
    Height = 19
    Visible = True
    object chkNoMostrarBajas: TCheckBox
      Left = 6
      Top = 1
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
  inherited CoolBar: TCoolBar
    Top = 19
    Width = 654
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 650
      end>
    inherited ToolBar: TToolBar
      Width = 637
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbCuentasBancarias: TToolButton
        Left = 370
        Top = 0
        Hint = 'Cuentas Bancarias'
        ImageIndex = 30
        OnClick = tbCuentasBancariasClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
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
    end
  end
  inherited Grid: TArtDBGrid
    Top = 48
    Width = 654
    Height = 424
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IE_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 406
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'IE_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 79
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 164
    Top = 112
    Width = 460
    Height = 105
    Constraints.MaxHeight = 105
    Constraints.MinHeight = 105
    Constraints.MinWidth = 460
    DesignSize = (
      460
      105)
    inherited BevelAbm: TBevel
      Top = 69
      Width = 452
    end
    object Label3: TLabel [1]
      Left = 10
      Top = 16
      Width = 47
      Height = 13
      AutoSize = False
      Caption = 'Nombre'
    end
    object Label1: TLabel [2]
      Left = 10
      Top = 45
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inherited btnAceptar: TButton
      Left = 302
      Top = 75
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 380
      Top = 75
      TabOrder = 3
    end
    object edIE_NOMBRE: TEdit
      Left = 59
      Top = 13
      Width = 392
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 120
      TabOrder = 0
    end
    object edIE_CUIT: TMaskEdit
      Left = 59
      Top = 41
      Width = 79
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT IE_NOMBRE, IE_CUIT, TRUNC(IE_FECHABAJA) FECHABAJA, IE_ID ' +
        'ID'
      '  FROM CONT.OIE_IMPENTIDAD'
      '')
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
    Left = 110
    Top = 200
  end
end
