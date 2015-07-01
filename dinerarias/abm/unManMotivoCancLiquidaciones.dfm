inherited frmManMotivoCancLiquidaciones: TfrmManMotivoCancLiquidaciones
  Left = 546
  Top = 246
  Width = 518
  Height = 347
  Caption = 'Mantenimiento de Motivos de Cancelacion de Liquidaciones'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 510
  end
  inherited CoolBar: TCoolBar
    Width = 510
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 506
      end>
    inherited ToolBar: TToolBar
      Width = 493
    end
  end
  inherited Grid: TArtDBGrid
    Width = 510
    Height = 246
    Columns = <
      item
        Expanded = False
        FieldName = 'ML_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ML_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ML_PUEDECOMPENSAR'
        Title.Alignment = taCenter
        Title.Caption = 'Puede compensar'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ML_PUEDEDEVFONDOS'
        Title.Caption = 'Puede Dev.Fondos'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ML_ANULACION'
        Title.Caption = 'Anulaci'#243'n'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ML_CANCELACION'
        Title.Caption = 'Cancelaci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ML_CIERRASINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Cierra siniestro'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ML_CIERRARECAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'Cierra reca'#237'da'
        Width = 80
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 136
    Width = 366
    Height = 130
    OnBeforeShow = fpAbmBeforeShow
    ActiveControl = edMotivo
    Color = 13621210
    inherited BevelAbm: TBevel
      Top = 96
      Width = 358
      Height = 3
    end
    object Label1: TLabel [1]
      Left = 7
      Top = 15
      Width = 35
      Height = 13
      Caption = 'Motivo:'
    end
    inherited btnAceptar: TButton
      Left = 205
      Top = 101
      Height = 24
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 283
      Top = 101
      Height = 24
      TabOrder = 2
    end
    object edMotivo: TEdit
      Left = 88
      Top = 9
      Width = 267
      Height = 21
      MaxLength = 250
      TabOrder = 0
    end
    object edCodigo: TEdit
      Left = 46
      Top = 9
      Width = 41
      Height = 21
      Color = 13948116
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object pnlPuede: TPanel
      Left = 46
      Top = 39
      Width = 152
      Height = 53
      BevelInner = bvSpace
      BevelOuter = bvLowered
      Color = clActiveBorder
      TabOrder = 4
      object chkPuedeDevolverFondos: TCheckBox
        Left = 7
        Top = 27
        Width = 133
        Height = 17
        Caption = 'Puede Devolver fondos'
        TabOrder = 0
      end
      object chkPuedeCompensar: TCheckBox
        Left = 7
        Top = 7
        Width = 106
        Height = 17
        Caption = 'Puede compensar'
        TabOrder = 1
      end
    end
    object pnlAnulCanc: TPanel
      Left = 203
      Top = 38
      Width = 152
      Height = 53
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 5
      object chkCancelacion: TCheckBox
        Left = 8
        Top = 27
        Width = 94
        Height = 17
        Caption = 'Cancelaci'#243'n'
        TabOrder = 0
      end
      object chkAnulacion: TCheckBox
        Left = 8
        Top = 7
        Width = 74
        Height = 17
        Caption = 'Anulaci'#243'n'
        TabOrder = 1
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'select ml_id, ml_codigo, ml_descripcion, ml_puedecompensar, ml_c' +
        'ierrarecaida, ml_cierrasiniestro, ml_fechabaja '
      'from sin.sml_motivocancliquidaciones')
  end
end
