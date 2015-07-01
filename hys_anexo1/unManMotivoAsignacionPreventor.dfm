inherited frmMotivoAsignacionPreventor: TfrmMotivoAsignacionPreventor
  Left = 472
  Top = 176
  Caption = 'Motivo Asignaci'#243'n Preventor'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'MA_ID'
        Title.Caption = 'ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MA_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MA_DIASVIGENCIA'
        Title.Caption = 'D'#237'as Vigencia'
        Width = 80
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 104
    Top = 148
    Width = 365
    Height = 105
    inherited BevelAbm: TBevel
      Top = 69
      Width = 357
    end
    object lbDescripcion: TLabel [1]
      Left = 8
      Top = 12
      Width = 58
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object lbDiasVigencia: TLabel [2]
      Left = 8
      Top = 33
      Width = 43
      Height = 26
      Caption = '   D'#237'as '#13#10'Vigencia:'
    end
    inherited btnAceptar: TButton
      Left = 207
      Top = 75
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 285
      Top = 75
      TabOrder = 3
    end
    object edDiasVigencia: TIntEdit
      Left = 72
      Top = 36
      Width = 121
      Height = 21
      TabOrder = 1
      MaxLength = 3
    end
    object edDescripcion: TEdit
      Left = 72
      Top = 8
      Width = 277
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ma_id, ma_descripcion, ma_diasvigencia, ma_fechabaja'
      '  FROM hys.hma_motivoasigprev'
      '')
  end
end
