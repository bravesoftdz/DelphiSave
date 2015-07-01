inherited frmInvAutorizaciones: TfrmInvAutorizaciones
  Left = 254
  Top = 176
  Width = 578
  Height = 450
  Caption = 'Autorizaciones'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 578
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 570
    Height = 3
  end
  inherited CoolBar: TCoolBar
    Top = 3
    Width = 570
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 566
      end>
    inherited ToolBar: TToolBar
      Width = 553
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
    Top = 32
    Width = 570
    Height = 391
    Columns = <
      item
        Expanded = False
        FieldName = 'NIVEL_AUTORIZACION'
        Title.Caption = 'Nivel de Autorizaci'#243'n'
        Width = 324
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_DESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Desde'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_HASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Hasta'
        Width = 116
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 52
    Top = 72
    Width = 500
    Height = 125
    Constraints.MaxHeight = 125
    Constraints.MinHeight = 125
    Constraints.MinWidth = 500
    inherited BevelAbm: TBevel
      Top = 89
      Width = 492
    end
    object Label1: TLabel [1]
      Left = 7
      Top = 13
      Width = 106
      Height = 13
      AutoSize = False
      Caption = 'Nivel de Autorizaci'#243'n'
    end
    object Label2: TLabel [2]
      Left = 7
      Top = 40
      Width = 106
      Height = 13
      AutoSize = False
      Caption = 'Monto Desde'
    end
    object Label3: TLabel [3]
      Left = 7
      Top = 67
      Width = 106
      Height = 13
      AutoSize = False
      Caption = 'Monto Hasta'
    end
    inherited btnAceptar: TButton
      Left = 342
      Top = 95
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 420
      Top = 95
      TabOrder = 4
    end
    inline fraNivelAutorizAltaModif: TfraCodigoDescripcion
      Left = 115
      Top = 9
      Width = 378
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        378
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 313
      end
    end
    object edMontoDesdeAltaModif: TCurrencyEdit
      Left = 115
      Top = 36
      Width = 90
      Height = 21
      AutoSize = False
      MaxLength = 12
      MaxValue = 9999999999.000000000000000000
      TabOrder = 1
    end
    object edMontoHastaAltaModif: TCurrencyEdit
      Left = 115
      Top = 63
      Width = 90
      Height = 21
      AutoSize = False
      MaxLength = 12
      MaxValue = 9999999999.000000000000000000
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT NA_DESCRIPCION NIVEL_AUTORIZACION, CI_MONTODESDE MONTO_DE' +
        'SDE, '
      '       CI_MONTOHASTA MONTO_HASTA, CI_FECHABAJA FECHA_BAJA'
      '  FROM NNA_NIVELAUTORIZACION, NCI_CONTROLINVERSION'
      ' WHERE NA_ID = CI_IDNIVELAUTORIZA'
      '  AND 1 = 2'
      '  ')
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
    Left = 109
    Top = 200
  end
end
