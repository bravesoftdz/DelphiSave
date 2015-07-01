inherited frmManRED_EMPDEUDORA: TfrmManRED_EMPDEUDORA
  Left = 271
  Top = 126
  Width = 677
  Height = 431
  Caption = 'Mantenimiento de Empresas Deudoras'
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 669
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 669
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 665
      end>
    inherited ToolBar: TToolBar
      Width = 652
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Width = 669
    Height = 369
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ED_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 554
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 5
    Top = 70
    Width = 656
    Height = 223
    Constraints.MaxHeight = 223
    Constraints.MinHeight = 223
    Constraints.MinWidth = 656
    inherited BevelAbm: TBevel
      Top = 187
      Width = 648
    end
    object lbCuit: TLabel [1]
      Left = 25
      Top = 9
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbRSocial: TLabel [2]
      Left = 144
      Top = 9
      Width = 38
      Height = 13
      Caption = 'R.Social'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited btnAceptar: TButton
      Left = 501
      Top = 193
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 576
      Top = 193
      TabOrder = 3
    end
    object mskCUITEmpDeudora: TMaskEdit
      Left = 54
      Top = 5
      Width = 82
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 0
    end
    object edRSocialEmpDeudora: TEdit
      Left = 188
      Top = 5
      Width = 464
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 1
    end
    object grbDomicilioLegal: TGroupBox
      Left = 4
      Top = 28
      Width = 648
      Height = 154
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Domicilio Legal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      DesignSize = (
        648
        154)
      object lbCA: TLabel
        Left = 29
        Top = 69
        Width = 18
        Height = 13
        Caption = 'C.A'
      end
      object lbTel: TLabel
        Left = 108
        Top = 69
        Width = 18
        Height = 13
        Caption = 'Tel.'
      end
      object lbCAFAX: TLabel
        Left = 306
        Top = 69
        Width = 18
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'C.A'
      end
      object lbFAX: TLabel
        Left = 379
        Top = 69
        Width = 18
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Fax'
      end
      object Label17: TLabel
        Left = 50
        Top = 96
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object edED_TELEFONOS: TPatternEdit
        Left = 129
        Top = 65
        Width = 172
        Height = 21
        MaxLength = 60
        TabOrder = 2
        Pattern = '0123456789()-/'
      end
      object edED_FAX: TPatternEdit
        Left = 399
        Top = 66
        Width = 234
        Height = 21
        Anchors = [akTop, akRight]
        MaxLength = 60
        TabOrder = 4
        Pattern = '0123456789()-/'
      end
      object edED_CODAREATELEFONOS: TPatternEdit
        Left = 50
        Top = 65
        Width = 50
        Height = 21
        MaxLength = 4
        TabOrder = 1
        Pattern = '0123456789'
      end
      object edED_CODAREAFAX: TPatternEdit
        Left = 326
        Top = 65
        Width = 50
        Height = 21
        Anchors = [akTop, akRight]
        MaxLength = 4
        TabOrder = 3
        Pattern = '0123456789'
      end
      inline fraDOMICILIO_LEGAL: TfraDomicilio
        Left = 2
        Top = 16
        Width = 630
        Height = 46
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited lbCalle: TLabel
          Left = 22
        end
        inherited lbNro: TLabel
          Left = 415
        end
        inherited lbPiso: TLabel
          Left = 487
          Width = 19
        end
        inherited lbDto: TLabel
          Left = 563
          Width = 21
        end
        inherited lbCPostal: TLabel
          Left = 6
          Top = 29
          Width = 40
        end
        inherited lbCPA: TLabel
          Left = 102
          Top = 29
          Width = 20
        end
        inherited lbLocalidad: TLabel
          Top = 29
          Width = 44
        end
        inherited lbProvincia: TLabel
          Left = 468
          Top = 29
          Width = 43
        end
        inherited cmbCalle: TArtComboBox
          Width = 333
        end
        inherited edNumero: TEdit
          Left = 437
        end
        inherited edPiso: TEdit
          Left = 513
        end
        inherited edDto: TEdit
          Left = 585
        end
        inherited edCPostal: TIntEdit
          Top = 25
        end
        inherited cmbLocalidad: TArtComboBox
          Top = 25
          Width = 198
        end
        inherited edProvincia: TEdit
          Left = 517
          Top = 25
          AutoSize = True
          Color = clWindow
        end
        inherited edCPA: TPatternEdit
          Left = 127
          Top = 25
        end
        inherited btnBuscar: TButton
          Left = 383
        end
      end
      object edED_OBSERVACIONESLegal: TMemo
        Left = 129
        Top = 93
        Width = 504
        Height = 55
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 250
        TabOrder = 5
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM RED_EMPDEUDORA red, CPV_PROVINCIAS'
      'WHERE ED_PROVINCIA = PV_CODIGO (+)')
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxPortrait
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
  end
end
