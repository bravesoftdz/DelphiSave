inherited frmManDepositoStock: TfrmManDepositoStock
  Left = 810
  Top = 286
  Caption = 'Dep'#243'sitos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'de_codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'de_descripcion'
        Title.Caption = 'Descripci'#243'n'
        Width = 265
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'de_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'de_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'de_fechamodif'
        Title.Caption = 'Fecha Modif.'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'de_usumodif'
        Title.Caption = 'Usu. Modif'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'de_fechabaja'
        Title.Caption = 'Fecha Baja'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'de_usubaja'
        Title.Caption = 'Usu. Baja'
        Width = 97
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 84
    Top = 104
    Width = 313
    Height = 105
    inherited BevelAbm: TBevel
      Top = 69
      Width = 305
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
      Left = 155
      Top = 75
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 233
      Top = 75
      TabOrder = 3
    end
    object edDescripcion: TEdit
      Left = 76
      Top = 36
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edCodigo: TIntEdit
      Left = 76
      Top = 13
      Width = 93
      Height = 21
      TabOrder = 0
      AutoExit = True
      MaxLength = 8
    end
  end
end
