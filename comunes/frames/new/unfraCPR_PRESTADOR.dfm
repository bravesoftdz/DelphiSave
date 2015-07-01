inherited fraCPR_PRESTADOR: TfraCPR_PRESTADOR
  Width = 691
  Height = 53
  VertScrollBar.Range = 49
  OnExit = FrameExit
  ExplicitWidth = 691
  ExplicitHeight = 53
  DesignSize = (
    691
    53)
  object lbCUIT: TLabel [0]
    Left = 4
    Top = 8
    Width = 24
    Height = 13
    Caption = 'CUIT'
  end
  object lbSec: TLabel [1]
    Left = 124
    Top = 8
    Width = 21
    Height = 13
    Caption = 'Sec.'
  end
  object lbIdentif: TLabel [2]
    Left = 196
    Top = 8
    Width = 40
    Height = 13
    Caption = 'Identif.:'
  end
  object lbRSocial: TLabel [3]
    Left = 284
    Top = 8
    Width = 38
    Height = 13
    Caption = 'R.Social'
  end
  object lbDomicilio: TLabel [4]
    Left = 4
    Top = 34
    Width = 40
    Height = 13
    Caption = 'Domicilio'
  end
  object lbLocalidad: TLabel [5]
    Left = 316
    Top = 34
    Width = 44
    Height = 13
    Caption = 'Localidad'
  end
  object lbCPostal: TLabel [6]
    Left = 612
    Top = 34
    Width = 21
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'C.P:'
  end
  object mskCA_CLAVE: TMaskEdit [7]
    Left = 36
    Top = 2
    Width = 81
    Height = 21
    Hint = 'CUIT o Clave del Prestador'
    EditMask = '##-########-c;0;_'
    MaxLength = 13
    TabOrder = 0
    OnKeyPress = mskCA_CLAVEKeyPress
  end
  object cmbCA_DESCRIPCION: TArtComboBox [8]
    Left = 328
    Top = 2
    Width = 361
    Height = 21
    Hint = 'Raz'#243'n Social del Prestador'
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 3
    Columns = <
      item
        Expanded = False
        FieldName = 'CA_CLAVE'
        Title.Caption = 'CUIT'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_SECUENCIA'
        Title.Caption = 'Secuencia'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_IDENTIFICADOR'
        Title.Caption = 'Id.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Raz'#243'n Social'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_ASISTENCIAL'
        Title.Caption = 'Asistencial'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 120
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'CA_DESCRIPCION'
    FieldKey = 'CA_CLAVE'
    OnCloseUp = cmbCA_DESCRIPCIONCloseUp
    OnDropDown = cmbCA_DESCRIPCIONDropDown
    OnGetCellParams = cmbCA_DESCRIPCIONGetCellParams
  end
  object edCA_DOMICILIO: TEdit [9]
    Left = 52
    Top = 28
    Width = 253
    Height = 21
    Hint = 'Domicilio del Prestador'
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edCA_LOCALIDAD: TEdit [10]
    Left = 368
    Top = 28
    Width = 237
    Height = 21
    Hint = 'Localidad del Prestador'
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edCA_CODPOSTAL: TEdit [11]
    Left = 636
    Top = 28
    Width = 53
    Height = 21
    Hint = 'Localidad del Prestador'
    TabStop = False
    Anchors = [akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edCA_IDENTIFICADOR: TIntEdit [12]
    Left = 232
    Top = 2
    Width = 45
    Height = 21
    TabOrder = 2
    OnKeyPress = edCA_IDENTIFICADORKeyPress
  end
  object edCA_SECUENCIA: TIntEdit [13]
    Left = 148
    Top = 2
    Width = 45
    Height = 21
    TabOrder = 1
    OnKeyPress = edCA_SECUENCIAKeyPress
  end
end
