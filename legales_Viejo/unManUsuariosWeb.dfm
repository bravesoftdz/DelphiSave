inherited frmManUsuariosWeb: TfrmManUsuariosWeb
  Left = 181
  Top = 189
  Width = 775
  Caption = 'Mantenimiento de Usuarios Web'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 767
  end
  inherited CoolBar: TCoolBar
    Width = 767
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 763
      end>
    inherited ToolBar: TToolBar
      Width = 750
    end
  end
  inherited Grid: TArtDBGrid
    Width = 767
    Columns = <
      item
        Expanded = False
        FieldName = 'NU_ID'
        Title.Caption = 'Nro Usuario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NU_USUARIO'
        Title.Caption = 'Usuario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NU_TIPO'
        Title.Caption = 'Tipo de Usuario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_NOMBRE'
        Title.Caption = 'Nombre Abogado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NU_IDNIVELSEGURIDAD'
        Title.Caption = 'Nivel de seguridad'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 136
    Top = 60
    Width = 549
    Height = 369
    inherited BevelAbm: TBevel
      Top = 333
      Width = 541
    end
    object lblTipoUsuario: TLabel [1]
      Left = 18
      Top = 12
      Width = 63
      Height = 13
      Caption = 'Tipo Usuario:'
    end
    object lblUsuarios: TLabel [2]
      Left = 18
      Top = 44
      Width = 44
      Height = 13
      Caption = 'Usuarios:'
    end
    object lblUsuario: TLabel [3]
      Left = 18
      Top = 108
      Width = 39
      Height = 13
      Caption = 'Usuario:'
    end
    object lblAbogado: TLabel [4]
      Left = 18
      Top = 140
      Width = 46
      Height = 13
      Caption = 'Abogado:'
    end
    object lblClaveWeb: TLabel [5]
      Left = 18
      Top = 172
      Width = 56
      Height = 13
      Caption = 'Clave Web:'
    end
    object lblautorizacion: TLabel [6]
      Left = 18
      Top = 236
      Width = 61
      Height = 13
      Caption = 'Autorizaci'#243'n:'
    end
    object lblNivel: TLabel [7]
      Left = 18
      Top = 76
      Width = 27
      Height = 13
      Caption = 'Nivel:'
    end
    inherited btnAceptar: TButton
      Left = 391
      Top = 339
      TabOrder = 8
    end
    inherited btnCancelar: TButton
      Left = 469
      Top = 339
      TabOrder = 9
    end
    object cmbTipoUsuario: TExComboBox
      Left = 88
      Top = 8
      Width = 241
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnChange = cmbTipoUsuarioChange
      ItemIndex = -1
      Options = [coShowValues, coGridLines]
      ValueWidth = 64
    end
    object cmbNivel: TExComboBox
      Left = 88
      Top = 72
      Width = 329
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
      Items.Strings = (
        '1= No Reservas'
        '2= Vizualiza Reservas'
        '3= Modifica Reservas'
        '4= Extra Reserva')
      ItemIndex = -1
      Options = [coShowValues, coGridLines]
      ValueWidth = 64
    end
    object edUsuario: TPatternEdit
      Left = 88
      Top = 104
      Width = 329
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      Pattern = '0123456789ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ'
    end
    object edClaveWeb: TPatternEdit
      Left = 88
      Top = 168
      Width = 329
      Height = 21
      PasswordChar = '*'
      TabOrder = 5
      Pattern = '0123456789ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ'
    end
    object cbForzarclave: TCheckBox
      Left = 12
      Top = 200
      Width = 89
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Forzar Clave'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    inline fraAbogado: TfraCodigoDescripcion
      Left = 88
      Top = 132
      Width = 329
      Height = 23
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 264
        DataSource = nil
      end
    end
    object clbAutorizacion: TARTCheckListBox
      Left = 88
      Top = 232
      Width = 325
      Height = 73
      OnClickCheck = clbAutorizacionClick
      ItemHeight = 13
      TabOrder = 7
      AutoAjustarColumnas = True
      Locked = False
      SQL = 'select MW_DESCRIPCION, MW_ID from legales.lmw_menuweb'
    end
    inline fraUsuario: TfraUsuario
      Left = 88
      Top = 40
      Width = 329
      Height = 21
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 245
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT nu_id, nu_usuario,NU_FECHABAJA,'
      
        '       DECODE (nu_tipo, '#39'I'#39', '#39'Interno'#39', '#39'E'#39', '#39'Externo'#39') nu_tipo,' +
        ' bo_nombre,'
      '       bo_id, nu_idnivelseguridad, nu_forzarclave, nu_claveweb'
      
        '  FROM legales.lnu_nivelusuario LEFT JOIN legales.lbo_abogado ON' +
        ' nu_idabogado ='
      
        '                                                                ' +
        '         bo_id')
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
  end
end
