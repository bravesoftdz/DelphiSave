inherited frmInvMonedas: TfrmInvMonedas
  Width = 734
  Height = 400
  Caption = 'Monedas'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 563
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 726
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 726
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 722
      end>
    inherited ToolBar: TToolBar
      Width = 709
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object pnlBajas: TPanel
        Left = 370
        Top = 0
        Width = 111
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkNoMostrarBajas: TCheckBox
          Left = 4
          Top = 3
          Width = 105
          Height = 17
          Caption = 'No Mostrar Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Width = 726
    Height = 339
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDA'
        Title.Caption = 'Nombre'
        Width = 324
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 153
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 88
    Height = 118
    Constraints.MaxHeight = 118
    Constraints.MinHeight = 118
    Constraints.MinWidth = 461
    inherited BevelAbm: TBevel
      Top = 82
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 16
      Width = 69
      Height = 13
      AutoSize = False
      Caption = 'Nombre'
    end
    inherited btnAceptar: TButton
      Top = 88
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Top = 88
      TabOrder = 3
    end
    object edNombreAltaModif: TEdit
      Left = 58
      Top = 12
      Width = 393
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 120
      TabOrder = 0
    end
    object rgTipoAltaModif: TRadioGroup
      Left = 59
      Top = 35
      Width = 185
      Height = 43
      Caption = 'Tipo'
      Columns = 2
      Items.Strings = (
        'Local'
        'Extranjera')
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT MO_ID CODIGO, MO_NOMBRE MONEDA, '
      
        '       DECODE(MO_TIPO, '#39'L'#39', '#39'Local'#39', '#39'Extranjera'#39') TIPO, MO_FECH' +
        'ABAJA FECHA_BAJA'
      '   FROM NMO_MONEDA'
      '  WHERE 1 = 2'
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
        LinkControl = tbSalir
      end>
    Left = 111
    Top = 200
  end
end
