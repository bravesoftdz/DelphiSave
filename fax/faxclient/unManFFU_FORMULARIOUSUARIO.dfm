inherited frmManFFU_FORMULARIOUSUARIO: TfrmManFFU_FORMULARIOUSUARIO
  Left = 303
  Top = 133
  Width = 538
  Caption = 'Mantenimiento de Formularios por Usuario'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 530
    Height = 30
    Visible = True
    object lbUsuario: TLabel
      Left = 4
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    inline fraFU_USUARIO: TfraUsuarios
      Left = 52
      Top = 3
      Width = 477
      Anchors = [akLeft, akTop, akRight]
      inherited cmbDescripcion: TArtComboBox
        Width = 384
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 30
    Width = 530
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 526
      end>
    inherited ToolBar: TToolBar
      Width = 513
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      inherited ToolButton4: TToolButton
        ImageIndex = -1
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Copiar Perfil'
        ImageIndex = 28
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 59
    Width = 530
    Height = 380
    Constraints.MinWidth = 391
    Columns = <
      item
        Expanded = False
        FieldName = 'FU_IDFORMULARIO'
        PickList.Strings = ()
        Title.Caption = 'Código'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FO_DESCRIPCION'
        PickList.Strings = ()
        Title.Caption = 'Descripción'
        Width = 430
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 28
    Top = 92
    Height = 73
    inherited BevelAbm: TBevel
      Top = 37
    end
    object lbFormulario: TLabel [1]
      Left = 8
      Top = 12
      Width = 48
      Height = 13
      Caption = 'Formulario'
    end
    inherited btnAceptar: TButton
      Top = 43
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Top = 43
      TabOrder = 2
    end
    inline fraFU_IDFORMULARIO: TfraCodigoDescripcion
      Left = 68
      Top = 8
      Width = 389
      inherited cmbDescripcion: TArtComboBox
        Width = 324
      end
      inherited edCodigo: TPatternEdit
        Pattern = '0123456789'
      end
    end
  end
  object fpCopiarPerfil: TFormPanel [4]
    Left = 28
    Top = 168
    Width = 461
    Height = 73
    Caption = 'Copiar de..'
    FormWidth = 0
    FormHeigth = 0
    Position = poScreenCenter
    object Bevel1: TBevel
      Left = 4
      Top = 38
      Width = 453
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object cmbCopPerfAceptar: TButton
      Left = 300
      Top = 44
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = cmbCopPerfAceptarClick
    end
    object cmbCopPerfCancelar: TButton
      Left = 380
      Top = 44
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraFU_USUARIO_Copia: TfraUsuarios
      Left = 56
      Top = 7
      Width = 401
      Anchors = [akLeft, akTop, akRight]
      inherited cmbDescripcion: TArtComboBox
        Width = 308
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT FU_IDFORMULARIO, FU_USUARIO, FO_DESCRIPCION, FU_FECHABAJA'
      ' FROM FFU_FORMULARIOUSUARIO, FFO_FAXFORMULARIO'
      'WHERE FO_ID = FU_IDFORMULARIO'
      ' AND FU_USUARIO = :SE_USUARIO'
      ' ')
    Left = 28
    Top = 276
    ParamData = <
      item
        DataType = ftString
        Name = 'SE_USUARIO'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 56
    Top = 276
  end
  inherited SortDialog: TSortDialog
    Left = 28
    Top = 304
  end
  inherited ExportDialog: TExportDialog
    Left = 56
    Top = 304
  end
  inherited QueryPrint: TQueryPrint
    Left = 56
    Top = 332
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 27
    Top = 248
  end
  inherited FormStorage: TFormStorage
    Left = 56
    Top = 248
  end
  inherited PrintDialog: TPrintDialog
    Left = 28
    Top = 332
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
    Left = 84
    Top = 248
  end
  inherited FieldHider: TFieldHider
    Left = 84
    Top = 276
  end
end
