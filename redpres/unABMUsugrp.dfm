inherited frmUsugrp: TfrmUsugrp
  Left = 400
  Top = 183
  Width = 642
  Height = 418
  Caption = 'Usuarios del Grupo'
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Top = 57
    Width = 634
    Height = 0
  end
  inherited CoolBar: TCoolBar
    Top = 28
    Width = 634
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 24
        Width = 630
      end>
    inherited ToolBar: TToolBar
      Width = 617
      Height = 24
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 4
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 23
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        ImageIndex = 24
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 25
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 15
      end
      inherited ToolButton3: TToolButton
        ImageIndex = 3
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 3
        Visible = False
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 5
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 28
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 7
      end
      inherited tbExportar: TToolButton
        ImageIndex = 1
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 17
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 19
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 8
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 57
    Width = 634
    Height = 334
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'UG_USUARIO'
        Title.Caption = 'Usuario'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 268
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UG_EMAIL'
        Title.Alignment = taCenter
        Title.Caption = 'e-Mail Evento'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UG_RESPONSABLE'
        Title.Alignment = taCenter
        Title.Caption = 'Responsable'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOUSUARIO'
        Title.Caption = 'Tipo Usuario'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UG_SOLOGBA'
        Title.Alignment = taCenter
        Title.Caption = 'Solo GBA'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UG_COEFICIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'Coeficiente'
        Width = 60
        Visible = True
      end>
  end
  object FPAlta: TFormPanel [3]
    Left = 172
    Top = 98
    Width = 360
    Height = 196
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      360
      196)
    object Label1: TLabel
      Left = 29
      Top = 19
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label2: TLabel
      Left = 5
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Tipo usuario'
    end
    object Label3: TLabel
      Left = 12
      Top = 76
      Width = 53
      Height = 13
      Caption = 'Coeficiente'
    end
    object Bevel5: TBevel
      Left = 3
      Top = 161
      Width = 354
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptar: TButton
      Left = 201
      Top = 167
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      TabOrder = 6
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 280
      Top = 167
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 7
      OnClick = btnCancelarClick
    end
    inline fraUsuarioGrupo: TfraUsuario
      Left = 72
      Top = 15
      Width = 285
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 201
      end
    end
    object cbMail: TCheckBox
      Left = 72
      Top = 99
      Width = 144
      Height = 17
      Caption = 'Mail seguimiento eventos'
      TabOrder = 3
    end
    object cbResponsable: TCheckBox
      Left = 71
      Top = 119
      Width = 85
      Height = 17
      Caption = 'Responsable'
      TabOrder = 4
    end
    inline fraTipoUsuario: TfraCtbTablas
      Left = 72
      Top = 43
      Width = 285
      Height = 23
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Left = 39
        Width = 245
      end
      inherited edCodigo: TPatternEdit
        Width = 34
      end
    end
    object edCoeficiente: TIntEdit
      Left = 73
      Top = 72
      Width = 36
      Height = 21
      TabOrder = 2
      Text = '1'
      MaxValue = 3
      MinValue = 1
      Value = 1
    end
    object cbGBA: TCheckBox
      Left = 71
      Top = 139
      Width = 66
      Height = 17
      Caption = 'Solo GBA'
      TabOrder = 5
    end
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 0
    Width = 634
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object chkVerBajas: TCheckBox
      Left = 5
      Top = 6
      Width = 69
      Height = 18
      Caption = 'Ver Bajas'
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ug_usuario, se_nombre, ug_fechabaja, ug_id, ug_email, ug_' +
        'responsable, '
      
        '       tb_descripcion tipousuario, ug_tipousuario, ug_sologba, u' +
        'g_coeficiente'
      
        '  FROM art.use_usuarios, art.mug_usuariogrupotrabajo, art.ctb_ta' +
        'blas'
      ' WHERE ug_usuario = se_usuario'
      '   AND ug_tipousuario = tb_codigo(+)'
      '   AND tb_clave(+) = '#39'TUSU'#39
      '   AND ug_grupo = :pgtrabajo')
    ParamData = <
      item
        DataType = ftString
        Name = 'pgtrabajo'
        ParamType = ptInput
        Value = '0'
      end>
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
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
        Key = 16463
        LinkControl = tbOrdenar
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
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
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
