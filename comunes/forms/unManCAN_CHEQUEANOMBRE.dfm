inherited frmManCAN_CHEQUEANOMBRE: TfrmManCAN_CHEQUEANOMBRE
  Left = 554
  Top = 255
  Height = 433
  Caption = 'Mantenimiento de beneficiarios de cheques'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Height = 332
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AN_ID'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AN_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AN_DESCEXTRA'
        Title.Caption = 'Descripci'#243'n extra'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AN_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. baja'
        Width = 70
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 172
    Height = 105
    BorderStyle = bsSingle
    inherited BevelAbm: TBevel
      Top = 69
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 44
      Width = 82
      Height = 13
      Caption = 'Descripci'#243'n extra'
    end
    inherited btnAceptar: TButton
      Top = 75
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Top = 75
      TabOrder = 3
    end
    object edAN_DESCRIPCION: TEdit
      Left = 100
      Top = 12
      Width = 353
      Height = 21
      MaxLength = 250
      TabOrder = 0
    end
    object edAN_DESCEXTRA: TEdit
      Left = 100
      Top = 40
      Width = 353
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT * FROM can_chequeanombre')
  end
end
