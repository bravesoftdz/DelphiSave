inherited frmManLBO_ABOGADOS: TfrmManLBO_ABOGADOS
  Left = 141
  Top = 60
  Caption = 'Mantenimiento de Abogados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    inherited ToolBar: TToolBar
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 9
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Height = 398
    Columns = <
      item
        Expanded = False
        FieldName = 'BO_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_DIRECCION'
        Title.Caption = 'Direcci'#243'n'
        Width = 337
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_DIRELECTRONICA'
        Title.Caption = 'Direcci'#243'n Electr'#243'nica'
        Width = 252
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BO_PROVINCIART'
        Title.Alignment = taCenter
        Title.Caption = 'Pert. Pcia. ART'
        Width = 82
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 117
    Width = 398
    Height = 189
    Constraints.MaxHeight = 189
    Constraints.MinHeight = 189
    Constraints.MinWidth = 398
    inherited BevelAbm: TBevel
      Top = 153
      Width = 390
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 12
      Top = 69
      Width = 45
      Height = 13
      Caption = 'Direcci'#243'n'
    end
    object Label3: TLabel [3]
      Left = 12
      Top = 41
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label4: TLabel [4]
      Left = 12
      Top = 98
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    object Label5: TLabel [5]
      Left = 12
      Top = 125
      Width = 29
      Height = 13
      Caption = 'E-Mail'
    end
    inherited btnAceptar: TButton
      Left = 240
      Top = 159
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 318
      Top = 159
      TabOrder = 7
    end
    object edBO_NOMBRE: TEdit
      Left = 64
      Top = 39
      Width = 325
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 1
    end
    object edBO_DIRECCION: TEdit
      Left = 64
      Top = 67
      Width = 325
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 2
    end
    object edBO_TELEFONO: TEdit
      Left = 64
      Top = 94
      Width = 197
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 20
      TabOrder = 3
    end
    object edBO_DIRELECTRONICA: TEdit
      Left = 64
      Top = 121
      Width = 325
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 120
      TabOrder = 5
    end
    object edBO_CODIGO: TIntEdit
      Left = 64
      Top = 12
      Width = 49
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object chkBO_PROVINCIART: TCheckBox
      Left = 268
      Top = 96
      Width = 121
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Pertenece Pcia. ART'
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT BO_CODIGO, BO_NOMBRE, BO_DIRECCION, BO_TELEFONO, BO_CODAR' +
        'EATELEFONO, BO_PREFIJOTELEFONO, BO_PROVINCIART, BO_DIRELECTRONIC' +
        'A, BO_FECHABAJA'
      'FROM LBO_ABOGADOS'
      ' '
      ' ')
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLetter
  end
end
