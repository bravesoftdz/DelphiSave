inherited frmManCriticidadSectores: TfrmManCriticidadSectores
  Width = 590
  Height = 400
  Caption = 'Criticidad de Sectores'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 590
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 582
    Visible = True
    DesignSize = (
      582
      45)
    object gbSectores: TGroupBox
      Left = 5
      Top = 1
      Width = 577
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Sector'
      TabOrder = 0
      DesignSize = (
        577
        43)
      inline fraSector: TfraCodigoDescripcion
        Left = 8
        Top = 13
        Width = 562
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          562
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 497
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Width = 582
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 578
      end>
    inherited ToolBar: TToolBar
      Width = 565
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 582
    Height = 298
    Columns = <
      item
        Expanded = False
        FieldName = 'SC_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 412
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CRITICIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Criticidad'
        Width = 58
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 20
    Top = 100
    Width = 545
    Height = 181
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 145
      Width = 537
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 17
      Width = 39
      Height = 13
      Caption = 'Sector'
    end
    inherited btnAceptar: TButton
      Left = 387
      Top = 151
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 465
      Top = 151
      TabOrder = 3
    end
    inline fraSectorModif: TfraCodigoDescripcion
      Left = 47
      Top = 13
      Width = 488
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        488
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 423
      end
    end
    object rgCriticidadModif: TRadioGroup
      Left = 48
      Top = 39
      Width = 241
      Height = 100
      Caption = 'Criticidad'
      Items.Strings = (
        'Baja'
        'Media'
        'Alta')
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT SC_CODIGO, SC_DESCRIPCION, SC_PRIORIDAD'
      'FROM USC_SECTORES'
      'WHERE SC_FECHABAJA IS NULL'
      '  AND 1 = 2')
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
    Left = 113
    Top = 200
  end
end
