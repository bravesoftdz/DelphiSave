inherited frmManCausa: TfrmManCausa
  Left = 333
  Top = 215
  Caption = 'Mantenimiento Causa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'CA_ID'
        Title.Caption = 'Codigo'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_DESCRIPCION'
        Title.Caption = 'Estado Presentaci'#243'n'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_NOTIFPREV'
        Title.Caption = 'Notifica Preventor'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_NOTIFEMPRESA'
        Title.Caption = 'Notifica Empresa'
        Width = 88
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Height = 167
    inherited BevelAbm: TBevel
      Top = 131
    end
    object lbCodigo: TLabel [1]
      Left = 8
      Top = 11
      Width = 36
      Height = 13
      Caption = 'Codigo:'
    end
    object lbDescripcion: TLabel [2]
      Left = 8
      Top = 63
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object Label1: TLabel [3]
      Left = 8
      Top = 30
      Width = 65
      Height = 26
      Caption = '    Estado '#13#10'Presentaci'#243'n:'
    end
    inherited btnAceptar: TButton
      Top = 137
    end
    inherited btnCancelar: TButton
      Top = 137
    end
    object edCodigo: TEdit
      Left = 76
      Top = 8
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 76
      Top = 60
      Width = 377
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    inline fraEstadoPresentacion: TfraCodigoDescripcion
      Left = 75
      Top = 32
      Width = 380
      Height = 23
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 315
      end
    end
    object cbNotifPreventor: TCheckBox
      Left = 8
      Top = 87
      Width = 113
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Notifica Preventor'
      TabOrder = 5
    end
    object cbNotifEmpresa: TCheckBox
      Left = 8
      Top = 106
      Width = 113
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Notifica Empresa'
      TabOrder = 6
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT hca.*, ep_descripcion'
      '  FROM hys.hca_causa hca, hys.hep_estadopresentacion'
      ' WHERE ca_idestado = ep_id')
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
    Left = 80
    Top = 258
  end
end
