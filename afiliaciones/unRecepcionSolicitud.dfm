inherited frmRecepcionSolicitud: TfrmRecepcionSolicitud
  Left = 360
  Top = 196
  BorderStyle = bsNone
  Caption = 'Recepci'#243'n Express'
  ClientHeight = 349
  ClientWidth = 967
  Constraints.MinHeight = 353
  Constraints.MinWidth = 830
  OldCreateOrder = True
  PopupMode = pmAuto
  OnShow = FSFormShow
  ExplicitWidth = 975
  ExplicitHeight = 379
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Width = 967
    Visible = False
    ExplicitWidth = 967
  end
  inherited CoolBar: TCoolBar
    Width = 967
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 961
      end>
    ExplicitWidth = 967
    inherited ToolBar: TToolBar
      Width = 954
      ExplicitWidth = 954
      inherited tbNuevo: TToolButton
        Enabled = False
        ImageIndex = 6
        ExplicitWidth = 23
      end
      inherited tbModificar: TToolButton
        ImageIndex = 7
        Visible = False
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 8
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 1
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 4
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 5
      end
      object tbGuardar: TToolButton
        Left = 174
        Top = 0
        Caption = 'tbGuardar'
        ImageIndex = 3
        OnClick = tbGuardarClick
      end
      object tbHistorialSRT: TToolButton
        Left = 199
        Top = 0
        Caption = 'tbHistorialSRT'
        ImageIndex = 17
        OnClick = tbHistorialSRTClick
      end
    end
  end
  inherited pnlDatos: TPanel
    Width = 967
    Height = 291
    Align = alClient
    ExplicitWidth = 967
    ExplicitHeight = 291
    object lbOrigen: TLabel
      Left = 44
      Top = 36
      Width = 40
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Origen'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbCUIT: TLabel
      Left = 60
      Top = 8
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object lbMotivoAlta: TLabel
      Left = 0
      Top = 84
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Motivo de Alta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 44
      Top = 60
      Width = 43
      Height = 13
      Caption = 'F. Recep'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbFechaAfiliacion: TLabel
      Left = 630
      Top = 60
      Width = 76
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F. Suscripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbFRecepcion: TLabel
      Left = 810
      Top = 60
      Width = 47
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Vigencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSA_OBSERVACIONES: TLabel
      Left = 12
      Top = 104
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label2: TLabel
      Left = 4
      Top = 163
      Width = 83
      Height = 13
      Caption = 'Usuario Asignado'
    end
    object Label6: TLabel
      Left = 44
      Top = 188
      Width = 40
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Estado'
    end
    object lbARTAnterior: TLabel
      Left = 392
      Top = 84
      Width = 64
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ART Anterior'
    end
    object lbSrt: TLabel
      Left = 708
      Top = 84
      Width = 241
      Height = 17
      AutoSize = False
      Caption = 'WsSrt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inline fraEmpresa: TfraEmpresaSolicitud
      Left = 88
      Top = 6
      Width = 872
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = fraEmpresaExit
      ExplicitLeft = 88
      ExplicitTop = 6
      ExplicitWidth = 872
      inherited lbContrato: TLabel
        Left = 737
        Visible = False
        ExplicitLeft = 737
      end
      inherited lbFormulario: TLabel
        Left = 736
        Width = 50
        Font.Name = 'Tahoma'
        ExplicitLeft = 736
        ExplicitWidth = 50
      end
      inherited mskCUIT: TMaskEdit
        OnKeyPress = fraEmpresamskCUITKeyPress
      end
      inherited edContrato: TIntEdit
        Left = 802
        Visible = False
        ExplicitLeft = 802
      end
      inherited cmbRSocial: TArtComboBox
        Width = 601
        DataSource = nil
        ExplicitWidth = 601
      end
      inherited edFormulario: TPatternEdit
        Left = 792
        Width = 72
        OnKeyPress = fraEmpresaedFormularioKeyPress
        ExplicitLeft = 792
        ExplicitWidth = 72
      end
    end
    inline fraSA_ORIGEN: TfraStaticCTB_TABLAS
      Left = 88
      Top = 32
      Width = 731
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnEnter = fraSA_ORIGENEnter
      ExplicitLeft = 88
      ExplicitTop = 32
      ExplicitWidth = 731
      ExplicitHeight = 22
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        ExplicitLeft = 0
        ExplicitTop = 0
      end
      inherited cmbDescripcion: TComboGrid
        Top = 0
        Width = 667
        ExplicitTop = 0
        ExplicitWidth = 667
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    inline fraSA_MOTIVOALTA: TfraStaticCTB_TABLAS
      Left = 88
      Top = 80
      Width = 301
      Height = 22
      TabOrder = 2
      OnExit = fraSA_MOTIVOALTAExit
      ExplicitLeft = 88
      ExplicitTop = 80
      ExplicitWidth = 301
      ExplicitHeight = 22
      inherited edCodigo: TPatternEdit
        Left = 0
        ExplicitLeft = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 237
        ExplicitWidth = 237
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object dcbFechaRecepcionAfiliaciones: TDateComboBox
      Left = 89
      Top = 56
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object edFechaSuscripcion: TDateComboBox
      Left = 710
      Top = 56
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
    end
    object edVigencia: TDateComboBox
      Left = 862
      Top = 56
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
    end
    object edSA_OBSERVACIONES: TMemo
      Left = 88
      Top = 105
      Width = 871
      Height = 55
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 150
      TabOrder = 6
    end
    inline fraUsuarioAsignado: TfraUsuarios
      Left = 87
      Top = 161
      Width = 662
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      ExplicitLeft = 87
      ExplicitTop = 161
      ExplicitWidth = 662
      inherited cmbDescripcion: TArtComboBox
        Width = 569
        DataSource = nil
        ExplicitWidth = 569
      end
    end
    object gbFormulariosAnexos: TGroupBox
      Left = 5
      Top = 212
      Width = 966
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Formularios y Anexos '
      TabOrder = 8
      DesignSize = (
        966
        57)
      object Label3: TLabel
        Left = 224
        Top = 16
        Width = 120
        Height = 13
        Caption = 'Firma Titular / Apoderado'
      end
      object Label4: TLabel
        Left = 428
        Top = 16
        Width = 74
        Height = 13
        Caption = 'Firma Vendedor'
      end
      object Label5: TLabel
        Left = 600
        Top = 16
        Width = 38
        Height = 13
        Caption = 'Faltante'
      end
      object btnRefreshDoc: TBitBtn
        Left = 609
        Top = 35
        Width = 23
        Height = 23
        Hint = 'Revisar estado de documentac'#237'on faltante'
        Anchors = [akLeft]
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000C40E0000C40E00000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
          000000FDFDFDFDFDFDFDFDFDFDFDFDFD00F900FDFDFDFDFDFDFDFDFDFDFDFDFD
          00F900FDFDFDFDFDFDFDFDFDFDFDFDFD00F900FDFDFDFDFDFDFDFDFDFDFDFDFD
          00F900FDFDFDFDFDFDFDFDFDFDFDFDFD00F900FDFDFDFDFDFDFDFDFDFD000000
          00F900000000FDFDFDFDFDFDFD00F9F9F9F9F9F9F900FDFDFDFDFDFDFDFD00F9
          F9F9F9F900FDFDFDFDFDFDFDFDFD00F9F9F9F9F900FDFDFDFDFDFDFDFDFDFD00
          F9F9F900FDFDFDFDFDFDFDFDFDFDFD00F9F9F900FDFDFDFDFDFDFDFDFDFDFDFD
          00F900FDFDFDFDFDFDFDFDFDFDFDFDFD00F900FDFDFDFDFDFDFDFDFDFDFDFDFD
          FD00FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD00FDFDFDFDFDFDFDFD}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnRefreshDocClick
      end
    end
    inline fraEstado: TfraStaticCTB_TABLAS
      Left = 88
      Top = 184
      Width = 815
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      ExplicitLeft = 88
      ExplicitTop = 184
      ExplicitWidth = 815
      ExplicitHeight = 24
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 34
        ExplicitLeft = 0
        ExplicitWidth = 34
      end
      inherited cmbDescripcion: TComboGrid
        Left = 36
        Width = 751
        ExplicitLeft = 36
        ExplicitWidth = 751
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    inline fraSA_ARTANTERIOR: TfraStaticCodigoDescripcion
      Left = 464
      Top = 80
      Width = 241
      Height = 22
      TabOrder = 10
      ExplicitLeft = 464
      ExplicitTop = 80
      ExplicitWidth = 241
      ExplicitHeight = 22
      inherited edCodigo: TPatternEdit
        Left = 0
        ExplicitLeft = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 178
        ExplicitWidth = 178
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
  end
  inherited btnAceptar: TButton
    Left = 813
    Top = 326
    Visible = False
    ExplicitLeft = 813
    ExplicitTop = 326
  end
  inherited btnCancelar: TButton
    Left = 891
    Top = 326
    Visible = False
    ExplicitLeft = 891
    ExplicitTop = 326
  end
  inherited btnAplicar: TButton
    Left = 734
    Top = 326
    Visible = False
    ExplicitLeft = 734
    ExplicitTop = 326
  end
  object btnAdministracionArchivos: TBitBtn [6]
    Left = 725
    Top = 324
    Width = 200
    Height = 25
    Hint = 'Ver Archivo'
    Anchors = [akBottom]
    Caption = 'Administraci'#243'n de Archivos'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FAFAFAF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
      F9FAFAFAFEFEFEFFFFFFFFFFFFD3D3D4949DA2929AA1929AA1929AA1929AA192
      9AA1929AA1929AA1919AA1919AA1919AA1939BA1CCCBCBFEFEFEFCFCFC6297C2
      1B8DF41A86EB1985EA1885EA1884E91883E81782E81883E81E85E61D84E51D82
      E51888F0668EB0FBFBFBFBFBFB4B98D61995FA1991F21891F21790F21790F216
      8FF1118DF1369BEC78C4F276C4F479C4F2359FF45996C7FEFEFEF8FBFD50B2F8
      24A5FF24A4FE24A4FE23A3FE23A3FE22A3FE21A3FE26A2FA2FA2F52EA2F62EA2
      F523A2FC61B5F0FFFFFFF3FAFF53BAFF37AEFE37AEFE37AEFE37AFFE37AFFE37
      AEFE37AFFE35AFFF34AFFF35AFFF35AFFF36AFFE64C1FFFEFFFFEDF8FF5ABFFE
      4CBBFD4DBCFD4EBDFD4EBDFD4EBDFD4EBDFD4EBDFD4DBCFD4CBBFE49BAFE47B9
      FE49BAFE67C4FEFAFDFFE8F6FF67C9FD66CAFD65C9FD65C9FD66C9FD66C9FC66
      CAFC67CAFC67CAFC68CAFC67C9FD61C7FD57C2FE6BC8FEF4FBFFE1F4FF79D2FE
      78D3FE78D2FE77D3FD78D3FD79D3FD79D3FD7AD3FD7BD4FD7AD4FD7BD4FD7CD5
      FD7CD5FD7ED3FDEEF9FFDBF2FF8DDCFD87DAFD87DAFD87DAFD87DAFD87DAFD87
      DBFD87DBFD87DBFD88DBFD88DBFD89DBFD8ADCFD91DEFDE9F7FFD5F1FEAFEDFE
      9CE7FF9CE7FF9CE7FF9CE7FF9CE7FF9CE7FF9CE7FF9BE7FF9BE7FF9BE7FF9CE8
      FF9EE9FFACEDFFE5F6FFE8F5FE77CAF791CEEC8ACCED8ACBEC8ACAEB8ACAEB8A
      C9EA8AC8E98AC7E88AC6E78AC6E788C3E490C6E37ABCEDF4F8FDFFFFFF6DBAE4
      939FA6D4D7DDDCDFE4DADDE2DADDE2DADCE1D9DBE0D8DBE0D7D9DEDADBE0C1C3
      C6818D9472B1E3FFFFFFFFFFFFA9D1F67FBFEDECE6E2E2E1E1E2E1E1E0E0DFE0
      E0DFE1E0E0E3E2E2E4E4E4ECE8E38EBCE766B2F3B1D6F8FFFFFFFFFFFFFFFFFF
      F6F7F9EDEBEAE6E6E6E4E4E4E3E3E3E3E3E3E5E5E5E9E9E9EDEDEDF5F1EEEAEF
      F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFAFAFAF7
      F7F7F3F3F3EFEFEFEAEAEAE5E5E5FBFAF9FFFFFFFFFFFFFFFFFF}
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
    OnClick = btnAdministracionArchivosClick
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
      end>
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 356
  end
end
