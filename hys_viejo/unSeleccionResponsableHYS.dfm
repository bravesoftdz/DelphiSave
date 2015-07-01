inherited frmSeleccionResponsableHYS: TfrmSeleccionResponsableHYS
  Width = 739
  Height = 515
  Caption = 'Selecci'#243'n del Responsable de HYS'
  FormStyle = fsNormal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 731
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Width = 731
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 727
      end>
    inherited ToolBar: TToolBar
      Width = 714
    end
  end
  inherited Grid: TArtDBGrid
    Width = 731
    Height = 386
    Columns = <
      item
        Expanded = False
        FieldName = 'CT_CONTACTO'
        Title.Caption = 'Contacto'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_CODAREATELEFONOS'
        Title.Caption = 'Cod. Area Tel'#233'fono'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_TELEFONOS'
        Title.Caption = 'Tel'#233'fonos'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_CODAREAFAX'
        Title.Caption = 'Cod. Area Fax'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_FAX'
        Title.Caption = 'Fax'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_TIPODOCUMENTO'
        Title.Caption = 'Tipo de Documento'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_NUMERODOCUMENTO'
        Title.Caption = 'N'#186' de Documento'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_DIRELECTRONICA'
        Title.Caption = 'E-Mail'
        Width = 82
        Visible = True
      end>
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 452
    Width = 731
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      731
      29)
    object btnAceptar: TButton
      Left = 578
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
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 654
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
      Width = 574
      Height = 23
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      '  SELECT act.*'
      '    FROM act_contacto act, aco_contrato '
      '   WHERE ct_cargo = '#39'01090'#39' '
      '     AND co_contrato = 119063'
      '     AND ct_idempresa = co_idempresa '
      '     AND ct_fechabaja IS NULL '
      '     AND 1= 2')
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
end
