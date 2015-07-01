inherited frmManConversionRegimen: TfrmManConversionRegimen
  Caption = 'Mantenimiento Conversi'#243'n R'#233'gimen'
  ClientWidth = 758
  ExplicitWidth = 766
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 758
    Height = 98
    Visible = True
    ExplicitWidth = 758
    ExplicitHeight = 98
    DesignSize = (
      758
      98)
    object GroupBox2: TGroupBox
      Left = 4
      Top = 0
      Width = 752
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        752
        48)
      object Label11: TLabel
        Left = 7
        Top = 19
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 37
        Top = 15
        Width = 705
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ExplicitLeft = 37
        ExplicitTop = 15
        ExplicitWidth = 705
        inherited lbContrato: TLabel
          Left = 601
          ExplicitLeft = 601
        end
        inherited edContrato: TIntEdit
          Left = 648
          ExplicitLeft = 648
        end
        inherited cmbRSocial: TArtComboBox
          Width = 466
          ExplicitWidth = 466
        end
      end
    end
    object gbMultiplesContratos: TGroupBox
      Left = 5
      Top = 48
      Width = 293
      Height = 44
      Caption = ' M'#250'ltiples Contratos '
      TabOrder = 1
      DesignSize = (
        293
        44)
      object Label13: TLabel
        Left = 8
        Top = 21
        Width = 45
        Height = 13
        Caption = 'Contratos'
      end
      object edContratos: TEdit
        Left = 56
        Top = 16
        Width = 149
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        Enabled = False
        TabOrder = 0
      end
      object ToolBar1: TToolBar
        Left = 208
        Top = 13
        Width = 82
        Height = 26
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        ButtonWidth = 25
        Caption = 'ToolBar'
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object tAgregarTXT: TToolButton
          Left = 0
          Top = 0
          Hint = 'Agregar TXT'
          ImageIndex = 6
          OnClick = tAgregarTXTClick
        end
        object tbLimpiarTXT: TToolButton
          Left = 25
          Top = 0
          Hint = 'Limpiar TXT'
          ImageIndex = 8
          OnClick = tbLimpiarTXTClick
        end
        object tbFormatoContrato: TToolButton
          Left = 50
          Top = 0
          Hint = 'Ver Formato...'
          Caption = 'tbFormatoContrato'
          ImageIndex = 40
          OnClick = tbFormatoContratoClick
        end
      end
    end
    object rbCaso: TRadioGroup
      Left = 304
      Top = 49
      Width = 185
      Height = 43
      Caption = 'Tipo de Caso'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Caso A'
        'Caso B'
        'Ambos')
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 98
    Width = 758
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 752
      end>
    ExplicitTop = 98
    ExplicitWidth = 758
    inherited ToolBar: TToolBar
      Width = 745
      ExplicitWidth = 745
      inherited tbNuevo: TToolButton
        Hint = 'Convertir'
        ImageIndex = 47
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 127
    Width = 758
    Height = 309
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    MultiSelect = True
    Columns = <
      item
        Expanded = False
        FieldName = 'contrato'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RazonSocial'
        Title.Caption = 'Raz'#243'n Social'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Formulario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CASO'
        Title.Caption = 'Caso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estado_Conversion'
        Title.Caption = 'Estado Conversi'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'actividad'
        Title.Caption = 'Actividad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nivel'
        Title.Caption = 'Nivel'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total_Empleados'
        Title.Caption = 'Total Empleados'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Masa_Salarial'
        Title.Caption = 'Masa Salarial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SumaFija'
        Title.Caption = 'Suma Fija'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Variable'
        Title.Caption = 'Variable.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VigenciaTarifa'
        Title.Caption = 'Vigencia Tarifa'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 189
    Top = 104
    Width = 412
    Height = 297
    ExplicitLeft = 189
    ExplicitTop = 104
    ExplicitWidth = 412
    ExplicitHeight = 297
    inherited BevelAbm: TBevel
      Top = 261
      Width = 404
      ExplicitTop = 45
      ExplicitWidth = 605
    end
    object Label1: TLabel [1]
      Left = 48
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Contrato'
    end
    object Label2: TLabel [2]
      Left = 63
      Top = 32
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label3: TLabel [3]
      Left = 25
      Top = 51
      Width = 63
      Height = 13
      Caption = 'Raz'#243'n Social'
    end
    object Label4: TLabel [4]
      Left = 44
      Top = 74
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object Label5: TLabel [5]
      Left = 64
      Top = 98
      Width = 24
      Height = 13
      Caption = 'Nivel'
    end
    object Label6: TLabel [6]
      Left = 28
      Top = 146
      Width = 63
      Height = 13
      Caption = 'Masa Salarial'
    end
    object Label7: TLabel [7]
      Left = 9
      Top = 122
      Width = 79
      Height = 13
      Caption = 'Total Empleados'
    end
    object lbContrato: TLabel [8]
      Left = 96
      Top = 13
      Width = 48
      Height = 13
      Caption = 'lbContrato'
    end
    object lbCuit: TLabel [9]
      Left = 96
      Top = 32
      Width = 33
      Height = 13
      Caption = 'lbCUIT'
    end
    object lbRazonSocial: TLabel [10]
      Left = 96
      Top = 51
      Width = 68
      Height = 13
      Caption = 'lbRazonSocial'
    end
    inherited btnAceptar: TButton
      Left = 254
      Top = 267
      TabOrder = 5
      ExplicitLeft = 254
      ExplicitTop = 267
    end
    inherited btnCancelar: TButton
      Left = 332
      Top = 267
      TabOrder = 6
      ExplicitLeft = 332
      ExplicitTop = 267
    end
    object GroupBox1: TGroupBox
      Left = 9
      Top = 170
      Width = 395
      Height = 87
      Caption = 'Al'#237'cuotas'
      TabOrder = 4
      object Label8: TLabel
        Left = 25
        Top = 17
        Width = 46
        Height = 13
        Caption = 'Suma Fija'
      end
      object Label9: TLabel
        Left = 33
        Top = 38
        Width = 38
        Height = 13
        Caption = 'Variable'
      end
      object Label10: TLabel
        Left = 30
        Top = 60
        Width = 41
        Height = 13
        Caption = 'Vigencia'
      end
      object edVigencia: TDateComboBox
        Left = 86
        Top = 57
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object edPorcVariable: TCurrencyEdit
        Left = 86
        Top = 35
        Width = 121
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = '% ,0.000;% -,0.000'
        MaxLength = 12
        TabOrder = 1
      end
      object edSumaFija: TCurrencyEdit
        Left = 86
        Top = 12
        Width = 121
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        MaxLength = 12
        TabOrder = 0
      end
    end
    inline fraActividad: TfraActividad
      Left = 96
      Top = 70
      Width = 305
      Height = 23
      TabOrder = 0
      ExplicitLeft = 96
      ExplicitTop = 70
      ExplicitWidth = 305
      inherited cmbDescripcion: TArtComboBox
        Width = 256
        ExplicitWidth = 256
      end
    end
    object edNivel: TIntEdit
      Left = 97
      Top = 95
      Width = 47
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object edTotalEmpleados: TIntEdit
      Left = 97
      Top = 119
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edMasaSalarial: TCurrencyEdit
      Left = 97
      Top = 142
      Width = 121
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 12
      TabOrder = 3
      ZeroEmpty = False
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT 1 FROM DUAL')
  end
  object OpenDialog: TOpenDialog
    Left = 92
    Top = 54
  end
end
