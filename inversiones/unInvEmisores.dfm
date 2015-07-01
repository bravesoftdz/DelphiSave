inherited frmInvEmisores: TfrmInvEmisores
  Width = 627
  Height = 460
  Caption = 'Emisores'
  Constraints.MinHeight = 460
  Constraints.MinWidth = 627
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 619
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 619
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 615
      end>
    inherited ToolBar: TToolBar
      Width = 602
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
    Width = 619
    Height = 398
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 533
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 72
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 104
    Width = 466
    Height = 76
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 40
      Width = 458
    end
    object Label1: TLabel [1]
      Left = 10
      Top = 15
      Width = 43
      Height = 13
      AutoSize = False
      Caption = 'Nombre'
    end
    inherited btnAceptar: TButton
      Left = 308
      Top = 46
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 386
      Top = 46
      TabOrder = 2
    end
    object edEmisorAltaModif: TEdit
      Left = 57
      Top = 12
      Width = 399
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 120
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT EM_NOMBRE NOMBRE, EM_FECHABAJA FECHA_BAJA'
      '  FROM NEM_EMISOR'
      ' WHERE 1 = 2')
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
    Left = 108
    Top = 200
  end
end
