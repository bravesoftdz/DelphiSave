inherited frmManAMA_MATERIAL: TfrmManAMA_MATERIAL
  Caption = 'Mantenimiento de Materiales'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'ma_codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ma_descripcion'
        Title.Caption = 'Descripci'#243'n'
        Width = 247
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ma_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ma_usualta'
        Title.Caption = 'Usu. Alta'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ma_fechamodif'
        Title.Caption = 'Fecha Modif.'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ma_usumodif'
        Title.Caption = 'Fecha Modif.'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ma_fechabaja'
        Title.Caption = 'Fecha Baja'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ma_usubaja'
        Title.Caption = 'Usuario Baja'
        Width = 99
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Top = 112
    Width = 373
    Height = 133
    inherited BevelAbm: TBevel
      Top = 97
      Width = 365
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 40
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 215
      Top = 103
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 293
      Top = 103
      TabOrder = 4
    end
    object edDescripcion: TEdit
      Left = 68
      Top = 36
      Width = 293
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edCodigo: TIntEdit
      Left = 68
      Top = 13
      Width = 93
      Height = 21
      TabOrder = 0
      AutoExit = True
      MaxLength = 8
    end
    object chkEntregable: TCheckBox
      Left = 68
      Top = 64
      Width = 97
      Height = 17
      Caption = 'Entregable'
      TabOrder = 2
    end
  end
end
