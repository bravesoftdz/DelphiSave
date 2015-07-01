inherited frmUltimoRegistroDom: TfrmUltimoRegistroDom
  Left = 294
  Top = 177
  Width = 800
  Height = 600
  Caption = 'frmUltimoRegistroDom'
  FormStyle = fsNormal
  KeyPreview = True
  OldCreateOrder = True
  Visible = False
  OnKeyPress = FSFormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 61
    object lbEmpresa: TLabel
      Left = 12
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object lbcalle: TLabel
      Left = 12
      Top = 36
      Width = 23
      Height = 13
      Caption = 'Calle'
    end
    object pnlFiltroEmpresaCP: TPanel
      Left = 76
      Top = 4
      Width = 589
      Height = 61
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        589
        61)
      object lbCP: TLabel
        Left = 468
        Top = 32
        Width = 14
        Height = 13
        Caption = 'CP'
      end
      inline fraCO_CONTRATO: TfraEmpresa
        Left = 4
        Top = 4
        Width = 566
        Height = 21
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object edUR_CODIGOPOSTAL: TEdit
        Left = 513
        Top = 28
        Width = 57
        Height = 21
        TabOrder = 1
      end
    end
    object edUR_CALLE: TEdit
      Left = 80
      Top = 32
      Width = 457
      Height = 21
      TabOrder = 0
    end
    object chkNoVinc: TCheckBox
      Left = 664
      Top = 8
      Width = 97
      Height = 17
      Caption = 'No Vinculados'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 61
    Width = 792
    Height = 32
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 788
      end>
    inherited ToolBar: TToolBar
      Width = 775
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 19
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object pnlLeyenda: TPanel
        Left = 389
        Top = 0
        Width = 300
        Height = 22
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Shape1: TShape
          Left = 8
          Top = 6
          Width = 9
          Height = 9
          Brush.Color = clSkyBlue
        end
        object Shape2: TShape
          Left = 88
          Top = 6
          Width = 9
          Height = 9
          Brush.Color = clPurple
        end
        object Label1: TLabel
          Left = 24
          Top = 4
          Width = 51
          Height = 13
          Caption = 'CP Iguales'
        end
        object Label2: TLabel
          Left = 104
          Top = 4
          Width = 52
          Height = 13
          Caption = 'Sin asignar'
        end
        object Label3: TLabel
          Left = 184
          Top = 4
          Width = 44
          Height = 13
          Caption = 'Asignado'
        end
        object Shape3: TShape
          Left = 168
          Top = 6
          Width = 9
          Height = 9
          Brush.Color = clBlack
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 93
    Width = 792
    Height = 447
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'UR_ID'
        ReadOnly = True
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UR_CUIT'
        ReadOnly = True
        Title.Caption = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 255
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UR_SUCURSAL'
        ReadOnly = True
        Title.Caption = 'Nro. Sucursal/Estab.'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UR_CODIGODEMOVIMIENTO'
        ReadOnly = True
        Title.Caption = 'C'#243'digo Mov.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UR_TIPOEXTERNO'
        ReadOnly = True
        Title.Caption = 'Tipo Externo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UR_CALLE'
        ReadOnly = True
        Title.Caption = 'Calle'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UR_NUMEROPUERTA'
        ReadOnly = True
        Title.Caption = 'Nro. Puerta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UR_TORRE'
        ReadOnly = True
        Title.Caption = 'Torre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UR_BLOQUE'
        ReadOnly = True
        Title.Caption = 'Bloque'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UR_PISO'
        ReadOnly = True
        Title.Caption = 'Piso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UR_DEPARTAMENTO'
        ReadOnly = True
        Title.Caption = 'Depto.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UR_CODIGOPOSTAL'
        ReadOnly = True
        Title.Caption = 'C'#243'd. Postal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UR_LOCALIDAD'
        ReadOnly = True
        Title.Caption = 'Localidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UR_PROVINCIA'
        ReadOnly = True
        Title.Caption = 'Provincia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PV_CORREO'
        Title.Caption = 'Provincia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UR_ACTIVIDAD'
        ReadOnly = True
        Title.Caption = 'Actividad'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UR_FECHAHORAMOVIMIENTO'
        ReadOnly = True
        Title.Caption = 'Movieminto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UR_AREARESERVADA'
        ReadOnly = True
        Title.Caption = 'Area reservada'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UR_IDCABECERA'
        ReadOnly = True
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UR_HORAMOVIMIENTO'
        ReadOnly = True
        Title.Caption = 'Hora Movimiento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UR_IDEMPRESA'
        ReadOnly = True
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UR_IDR_ID'
        ReadOnly = True
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ES_IUR_ID'
        Visible = False
      end>
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 540
    Width = 792
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      792
      33)
    object btnCancelar: TButton
      Left = 709
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnAceptar: TButton
      Left = 629
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Aceptar'
      Default = True
      TabOrder = 1
      OnClick = btnAceptarClick
    end
    object btnNoExiste: TButton
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = '&No existe'
      TabOrder = 2
      OnClick = btnNoExisteClick
    end
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
