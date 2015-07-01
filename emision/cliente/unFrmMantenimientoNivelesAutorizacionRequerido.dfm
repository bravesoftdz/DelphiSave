inherited FrmAdministracionNivelesAutorizacionRequerido: TFrmAdministracionNivelesAutorizacionRequerido
  Left = 228
  Top = 153
  Caption = 'Mantenimiento de Niveles de Autorizaci'#243'n Requerido'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    inherited ToolBar: TToolBar
      Hint = 'Mantenimiento de Niveles de Autorizaci'#243'n'
      HotImages = DmEmision.ilColor
      Images = DmEmision.ilByN
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbPropiedades: TToolButton
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Height = 409
    Columns = <
      item
        Expanded = False
        FieldName = 'NP_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NA_DESCRIPCION'
        Title.Caption = 'Nivel'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_PERIODOSDESDE'
        Title.Caption = 'Cant.Min.Periodos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_PERIODOSHASTA'
        Title.Caption = 'Cant.Max.Periodos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_MONTODESDE'
        Title.Caption = 'Monto Dif.Min.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_MONTOHASTA'
        Title.Caption = 'Monto Dif.Max.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_FECHAANTERIOR'
        Title.Caption = 'F.Anterior'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_FECHAPOSTERIOR'
        Title.Caption = 'F.Posterior'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 44
    Top = 16
    Height = 161
    DesignSize = (
      461
      161)
    inherited BevelAbm: TBevel
      Top = 125
    end
    object lblNivel: TLabel [1]
      Left = 10
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Nivel:'
    end
    object lblMontoMinimo: TLabel [2]
      Left = 10
      Top = 50
      Width = 56
      Height = 13
      Caption = 'Monto Min.:'
    end
    object lblMontoMaximo: TLabel [3]
      Left = 262
      Top = 50
      Width = 59
      Height = 13
      Caption = 'Monto Max.:'
    end
    object lblPeriodosDesde: TLabel [4]
      Left = 10
      Top = 75
      Width = 89
      Height = 13
      Caption = 'Cant.Periodos Min:'
    end
    object lblPeriodoHasta: TLabel [5]
      Left = 262
      Top = 75
      Width = 92
      Height = 13
      Caption = 'Cant.Periodos Max:'
    end
    object lblVigenciaDesde: TLabel [6]
      Left = 10
      Top = 97
      Width = 78
      Height = 13
      Caption = 'Vigencia Desde:'
    end
    object Label10: TLabel [7]
      Left = 262
      Top = 97
      Width = 75
      Height = 13
      Caption = 'Vigencia Hasta:'
    end
    inherited btnAceptar: TButton
      Top = 131
    end
    inherited btnCancelar: TButton
      Top = 131
    end
    inline fraNivelAutorizacion: TfraCodigoDescripcionExt
      Left = 104
      Top = 20
      Width = 349
      Height = 23
      Hint = 
        'Destino que a Dar a la DDJJ o Trabajador si adopta el valor espe' +
        'cificado.'
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 284
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECHAZO'
            Visible = True
          end>
      end
    end
    object edtMontoMinimo: TCurrencyEdit
      Left = 105
      Top = 45
      Width = 88
      Height = 21
      AutoSize = False
      TabOrder = 3
    end
    object edtMontoMaximo: TCurrencyEdit
      Left = 362
      Top = 45
      Width = 88
      Height = 21
      AutoSize = False
      TabOrder = 4
    end
    object edtCantidadPeriodosDesde: TIntEdit
      Left = 105
      Top = 70
      Width = 88
      Height = 21
      TabOrder = 5
      Alignment = taRightJustify
    end
    object IntEdit1: TIntEdit
      Left = 362
      Top = 70
      Width = 88
      Height = 21
      TabOrder = 6
      Alignment = taRightJustify
    end
    object edtFechaVigenciaDesde: TDateComboBox
      Left = 105
      Top = 93
      Width = 88
      Height = 21
      TabOrder = 7
    end
    object edtFechaVigenciaHasta: TDateComboBox
      Left = 362
      Top = 93
      Width = 88
      Height = 21
      TabOrder = 8
    end
  end
  object fpAsignacionUsuarios: TFormPanel [4]
    Left = 516
    Top = 88
    Width = 501
    Height = 289
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      501
      289)
    object TBevel
      Left = 4
      Top = 253
      Width = 493
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label5: TLabel
      Left = 10
      Top = 17
      Width = 27
      Height = 13
      Caption = 'Nivel:'
    end
    object btnAceptarAsignacionUsuario: TButton
      Left = 343
      Top = 259
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelarAsignacionUsuario: TButton
      Left = 421
      Top = 259
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarAsignacionUsuarioClick
    end
    object edtNivelAutorizacion: TEdit
      Left = 48
      Top = 14
      Width = 441
      Height = 21
      Color = 14795201
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object lbUsuariosAsignados: TDBListBox
      Left = 283
      Top = 48
      Width = 208
      Height = 193
      DataField = 'USUARIOSECTOR'
      DataSource = dsUsuariosAsignados
      ItemHeight = 13
      ReadOnly = True
      TabOrder = 3
    end
    object lbUsuarios: TDBListBox
      Left = 8
      Top = 48
      Width = 188
      Height = 193
      DataField = 'USUARIOSECTOR'
      DataSource = dsUsuariosDisponibles
      ItemHeight = 13
      ReadOnly = True
      TabOrder = 4
    end
    object btnAgregar: TButton
      Left = 203
      Top = 80
      Width = 75
      Height = 25
      Caption = '>'
      TabOrder = 5
      OnClick = btnAgregarClick
    end
    object btnQuitar: TButton
      Left = 203
      Top = 112
      Width = 75
      Height = 25
      Caption = '<'
      TabOrder = 6
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT /*+ NOPARALLEL(INP, INA, ) */'
      '       INP.NP_ID, INP.NP_PERIODOSDESDE, INP.NP_PERIODOSHASTA,'
      
        '       INP.NP_FECHAANTERIOR, INP.NP_FECHAPOSTERIOR, INP.NP_MONTO' +
        'DESDE,'
      '       INP.NP_MONTOHASTA, INA.NA_DESCRIPCION'
      
        '  FROM EMI.INP_NIVELAUTORIZACIONPERIODOS INP, EMI.INA_NIVELAUTOR' +
        'IZACION INA'
      ' WHERE ((INA.NA_ID = INP.NP_IDNIVELAUTORIZACION))')
  end
  object sdqUsuariosDisponibles: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT us.se_usuario,'
      
        '       us.se_nombre || '#39' ('#39' || usc.sc_descripcion || '#39')'#39' usuario' +
        'sector'
      '  FROM art.use_usuarios us, art.usc_sectores usc'
      ' WHERE us.se_idsector = usc.sc_id'
      '   AND usc.sc_codigo IN('#39'come'#39', '#39'emi'#39')'
      '   AND NOT EXISTS('
      '          SELECT 1'
      '            FROM emi.inu_nivelautorizacionusuario inu'
      '           WHERE inu.nu_usuario = us.se_usuario'
      
        '             AND inu.nu_idnivelautorizacion = :idnivelautorizaci' +
        'on)'
      '')
    Left = 164
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idnivelautorizacion'
        ParamType = ptInput
      end>
  end
  object sdqUsuariosAsignados: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT INU.NU_USUARIO, US.SE_NOMBRE || '#39' ('#39' || USC.sc_descripcio' +
        'n || '#39')'#39' UsuarioSector'
      '  FROM EMI.INU_NIVELAUTORIZACIONUSUARIO INU,'
      '       ART.USE_USUARIOS US,'
      '       ART.USC_SECTORES USC'
      ' WHERE US.SE_USUARIO = INU.NU_USUARIO'
      '   AND INU.NU_IDNIVELAUTORIZACION = :IDNIVELAUTORIZACION'
      '   AND US.SE_IDSECTOR = USC.sc_id'
      '')
    Left = 412
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDNIVELAUTORIZACION'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsUsuariosDisponibles: TDataSource
    DataSet = sdqUsuariosDisponibles
    Left = 164
    Top = 200
  end
  object dsUsuariosAsignados: TDataSource
    DataSet = sdqUsuariosAsignados
    Left = 420
    Top = 200
  end
end
