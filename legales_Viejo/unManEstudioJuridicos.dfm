inherited frmManEstudioJuridico: TfrmManEstudioJuridico
  Caption = 'Mantenimiento Estudio Jur'#237'dico '
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Height = 336
    Columns = <
      item
        Expanded = False
        FieldName = 'EJ_ID'
        Title.Caption = 'C'#243'digo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJ_NOMBREESTUDIO'
        Title.Caption = 'Nombre Estudio'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJ_DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJ_EMAIL'
        Title.Caption = 'Email'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJ_TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJ_FAX'
        Title.Caption = 'Fax'
        Width = 126
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 164
    inherited BevelAbm: TBevel
      Top = 128
    end
    object lbNombreEstudio: TLabel [1]
      Left = 7
      Top = 10
      Width = 81
      Height = 13
      Caption = 'Nombre Estudio: '
    end
    object lbDomicilio: TLabel [2]
      Left = 7
      Top = 34
      Width = 45
      Height = 13
      Caption = 'Domicilio:'
    end
    object lbEmail: TLabel [3]
      Left = 7
      Top = 58
      Width = 28
      Height = 13
      Caption = 'Email:'
    end
    object lbTelefono: TLabel [4]
      Left = 7
      Top = 82
      Width = 45
      Height = 13
      Caption = 'Tel'#233'fono:'
    end
    object lbFax: TLabel [5]
      Left = 7
      Top = 107
      Width = 20
      Height = 13
      Caption = 'Fax:'
    end
    inherited btnAceptar: TButton
      Top = 134
    end
    inherited btnCancelar: TButton
      Top = 134
    end
    object edNombreEstudio: TEdit
      Left = 93
      Top = 7
      Width = 358
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edDomicilio: TEdit
      Left = 93
      Top = 31
      Width = 358
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object edEmail: TEdit
      Left = 93
      Top = 55
      Width = 358
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object edTelefono: TEdit
      Left = 93
      Top = 79
      Width = 358
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
    object edFax: TEdit
      Left = 93
      Top = 104
      Width = 358
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
    end
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 410
    Width = 621
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    DesignSize = (
      621
      29)
    object Button1: TButton
      Left = 468
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 544
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object pnlBottom: TPanel
      Left = 2
      Top = 4
      Width = 464
      Height = 24
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ej_id, ej_nombreestudio, ej_domicilio, ej_email,'
      '       ej_telefono, ej_fax, ej_fechaalta, ej_usualta,'
      '       ej_fechamodif, ej_usumodif, ej_fechabaja, ej_usubaja'
      '  FROM legales.lej_estudiojuridico')
  end
  inherited FormStorage: TFormStorage
    Active = False
  end
end
