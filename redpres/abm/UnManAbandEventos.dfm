inherited frmManAbandEventos: TfrmManAbandEventos
  Caption = 'Mantenimiento de Eventos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'ae_codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ae_descripcion'
        Title.Caption = 'Descripci'#243'n'
        Width = 254
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tc_nombre'
        Title.Caption = 'Carta Documento'
        Width = 310
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 177
    inherited BevelAbm: TBevel
      Top = 141
    end
    object lblCodigo: TLabel [1]
      Left = 14
      Top = 24
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblDescripcion: TLabel [2]
      Left = 14
      Top = 56
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object lblCartaDoc: TLabel [3]
      Left = 14
      Top = 90
      Width = 83
      Height = 13
      Caption = 'Carta Documento'
    end
    inherited btnAceptar: TButton
      Top = 147
    end
    inherited btnCancelar: TButton
      Top = 147
    end
    object ieCodigo: TIntEdit
      Left = 106
      Top = 20
      Width = 95
      Height = 21
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 106
      Top = 52
      Width = 327
      Height = 21
      TabOrder = 3
    end
    inline fraCartaDoc: TfraCodigoDescripcion
      Left = 102
      Top = 86
      Width = 331
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 280
      end
      inherited edCodigo: TPatternEdit
        Left = 4
        Width = 44
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ae_codigo, ae_descripcion, tc_nombre, tc_codigo, ae_id'
      '  FROM art.sae_abandonoeventos, ctc_textocarta'
      ' WHERE ae_codcartadoc_emp = tc_codigo(+)'
      '   AND ae_fechabaja IS NULL'
      '   AND tc_fechabaja(+) IS NULL')
  end
end
