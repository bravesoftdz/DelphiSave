inherited frmManACA_CONTRATOAUTORIZADO: TfrmManACA_CONTRATOAUTORIZADO
  Left = 210
  Top = 111
  Caption = 'Quitar permiso ABM Trabajadores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CA_CUIT'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUALTA'
        Title.Caption = 'Usuario Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUMODIF'
        Title.Caption = 'Usuario Modif.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHAMODIF'
        Title.Caption = 'Fecha Modif.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 28
    Top = 120
    Width = 473
    Height = 109
    inherited BevelAbm: TBevel
      Top = 73
      Width = 465
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 52
      Width = 40
      Height = 13
      Caption = 'Contrato'
      Visible = False
    end
    object Label9: TLabel [2]
      Left = 12
      Top = 32
      Width = 63
      Height = 13
      Caption = 'Raz'#243'n Social'
    end
    object Label2: TLabel [3]
      Left = 12
      Top = 8
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inherited btnAceptar: TButton
      Left = 315
      Top = 79
    end
    inherited btnCancelar: TButton
      Left = 393
      Top = 79
    end
    object edRazonSocial: TEdit
      Left = 84
      Top = 28
      Width = 381
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object edEM_CUIT: TMaskEdit
      Left = 84
      Top = 6
      Width = 88
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 3
      OnChange = edEM_CUITChange
    end
    object edCO_CONTRATO: TIntEdit
      Left = 84
      Top = 49
      Width = 89
      Height = 21
      TabOrder = 4
      Visible = False
      OnChange = edCO_CONTRATOChange
      AutoExit = True
      MaxLength = 8
    end
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'CA_CONTRATO'
        Title = 'Contrato'
      end
      item
        DataField = 'EM_NOMBRE'
        Title = 'Raz'#243'n Social'
      end>
  end
end
