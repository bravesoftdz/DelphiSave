inherited frmTiposAplicacionEmbargos: TfrmTiposAplicacionEmbargos
  Left = 285
  Top = 158
  Caption = 'Tipos de Aplicaci'#243'n de Embargos'
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
        FieldName = 'TA_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 438
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OPERACION'
        Title.Alignment = taCenter
        Title.Caption = 'Operaci'#243'n'
        Width = 68
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 112
    Width = 304
    Height = 161
    Caption = 'Tipo'
    BorderStyle = bsDialog
    ActiveControl = edCodigo
    inherited BevelAbm: TBevel
      Top = 125
      Width = 296
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 44
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 76
      Width = 49
      Height = 13
      Caption = 'Operaci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 144
      Top = 131
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 224
      Top = 131
      Width = 72
    end
    object edCodigo: TEdit
      Left = 72
      Top = 8
      Width = 121
      Height = 21
      MaxLength = 2
      TabOrder = 2
      Text = 'XX'
    end
    object edDescripcion: TEdit
      Left = 72
      Top = 40
      Width = 224
      Height = 21
      MaxLength = 60
      TabOrder = 3
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
    object rbSuma: TRadioButton
      Left = 72
      Top = 72
      Width = 56
      Height = 17
      Caption = 'Suma'
      TabOrder = 4
    end
    object rbResta: TRadioButton
      Left = 128
      Top = 72
      Width = 56
      Height = 17
      Caption = 'Resta'
      TabOrder = 5
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ta_id, ta_codigo, ta_descripcion, DECODE(ta_operacion, 1,' +
        ' '#39'+'#39', '#39'-'#39') operacion, ta_operacion, ta_fechabaja'
      '  FROM lta_tipoaplicacionembargo')
  end
end
