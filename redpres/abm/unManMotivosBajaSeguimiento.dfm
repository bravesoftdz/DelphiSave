inherited frmMotivosBajaSeguimientos: TfrmMotivosBajaSeguimientos
  Left = 418
  Top = 322
  Caption = 'Motivos de Baja de Seguimientos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'MS_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_USUALTA'
        Title.Caption = 'Usuario Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_FECHAMODIF'
        Title.Caption = 'Fecha Modificaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_USUMODIF'
        Title.Caption = 'Usuario Modif.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 241
    Height = 165
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 129
      Width = 233
    end
    object lblCodigo: TLabel [1]
      Left = 12
      Top = 18
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblDescripcion: TLabel [2]
      Left = 12
      Top = 43
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 83
      Top = 135
    end
    inherited btnCancelar: TButton
      Left = 161
      Top = 135
    end
    object ieCodigo: TIntEdit
      Left = 52
      Top = 14
      Width = 61
      Height = 21
      TabOrder = 2
    end
    object mDescripcion: TMemo
      Left = 12
      Top = 59
      Width = 209
      Height = 61
      Lines.Strings = (
        '')
      MaxLength = 100
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'select ms_id, ms_codigo, ms_descripcion, ms_usualta, '
      'ms_fechaalta, ms_usumodif, ms_fechamodif, ms_usubaja, '
      'ms_fechabaja from sin.sms_motivosbajaseguimiento')
  end
end
