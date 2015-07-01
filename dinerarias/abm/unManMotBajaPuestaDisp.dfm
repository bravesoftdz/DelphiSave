inherited frmMotBajaPuestaDisp: TfrmMotBajaPuestaDisp
  Left = 657
  Top = 169
  Caption = 'Puesta a disposici'#243'n - Motivos de baja'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'mp_codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mp_descripcion'
        Title.Caption = 'Descripci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mp_usubaja'
        Title.Caption = 'Usu Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mp_fechabaja'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 409
    Height = 101
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 65
      Width = 401
    end
    object Label1: TLabel [1]
      Left = 17
      Top = 38
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label2: TLabel [2]
      Left = 17
      Top = 15
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    inherited btnAceptar: TButton
      Left = 251
      Top = 71
    end
    inherited btnCancelar: TButton
      Left = 329
      Top = 71
    end
    object edDescripcion: TEdit
      Left = 80
      Top = 34
      Width = 313
      Height = 21
      TabOrder = 2
    end
    object edCodigo: TEdit
      Left = 80
      Top = 11
      Width = 61
      Height = 21
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT MP_CODIGO, MP_DESCRIPCION, MP_FECHABAJA, MP_ID '
      'FROM SIN.smp_motivosbajapuesta')
  end
end
