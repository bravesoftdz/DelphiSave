inherited frmManOrganismo: TfrmManOrganismo
  Caption = 'Mantenimiento Organismo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'MO_ID'
        Title.Caption = 'C'#243'digo'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 278
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 454
    Height = 73
    inherited BevelAbm: TBevel
      Top = 37
      Width = 446
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 14
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 296
      Top = 43
    end
    inherited btnCancelar: TButton
      Left = 374
      Top = 43
    end
    object edDESCRIPCION: TEdit
      Left = 76
      Top = 8
      Width = 372
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hmo_manorganismo')
  end
end
