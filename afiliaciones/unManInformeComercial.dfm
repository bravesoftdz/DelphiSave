inherited frmManInformeComercial: TfrmManInformeComercial
  Left = 212
  Top = 113
  Caption = 'frmManInformeComercial'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'OP_USUARIO'
        Title.Caption = 'Usuario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OP_PASS'
        Title.Caption = 'Contrase'#241'a'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OP_USULOGIN'
        Title.Caption = 'Ultimo Usuario LogIn Ok'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OP_FECHALOGIN'
        Title.Caption = 'Fecha Ultimo LogIn'
        Width = 92
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 148
    Top = 160
    Width = 201
    Height = 129
    inherited BevelAbm: TBevel
      Top = 93
      Width = 193
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 28
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label2: TLabel [2]
      Left = 4
      Top = 52
      Width = 54
      Height = 13
      Caption = 'Contrase'#241'a'
    end
    inherited btnAceptar: TButton
      Left = 43
      Top = 99
    end
    inherited btnCancelar: TButton
      Left = 121
      Top = 99
    end
    object edUser: TEdit
      Left = 64
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edPass: TEdit
      Left = 64
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 3
    end
  end
end
