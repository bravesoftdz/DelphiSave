inherited frmManEmpresasPagoDirectoILT: TfrmManEmpresasPagoDirectoILT
  Left = 318
  Top = 172
  Caption = 'Empresas con pago directo de ILT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 350
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PD_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PD_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 70
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 25
    Top = 134
    Width = 576
    Height = 76
    inherited BevelAbm: TBevel
      Top = 40
      Width = 568
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 14
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inherited btnAceptar: TButton
      Left = 418
      Top = 46
    end
    inherited btnCancelar: TButton
      Left = 496
      Top = 46
    end
    inline fraEmpresaPagoDir: TfraEmpresa
      Left = 40
      Top = 10
      Width = 529
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      inherited lbContrato: TLabel
        Left = 425
      end
      inherited edContrato: TIntEdit
        Left = 472
      end
      inherited cmbRSocial: TArtComboBox
        Width = 290
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT art.utiles.armar_cuit(pd_cuit) cuit, em_nombre, pd_id, pd' +
        '_fechaalta, pd_fechabaja'
      '  FROM aem_empresa, SIN.spd_empresaspagodirecto'
      ' WHERE pd_cuit = em_cuit')
  end
  inherited ShortCutControl: TShortCutControl
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
  end
end
