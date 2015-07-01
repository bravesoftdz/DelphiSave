inherited frmABMUsuDerivacionVolantes: TfrmABMUsuDerivacionVolantes
  Left = 208
  Top = 106
  Width = 400
  Height = 350
  Caption = 'Usuarios de la Derivaci'#243'n'
  Constraints.MinHeight = 350
  Constraints.MinWidth = 400
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  OnClose = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 392
    Height = 0
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 392
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 388
      end>
    inherited ToolBar: TToolBar
      Width = 375
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 29
    Width = 392
    Height = 291
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'UD_USUARIO'
        Title.Caption = 'Usuario'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 272
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ud_enviaralgestor'
        Title.Caption = 'Notifica Gestor'
        Visible = True
      end>
  end
  object FPAlta: TFormPanel [3]
    Left = 20
    Top = 92
    Width = 343
    Height = 105
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Constraints.MaxHeight = 120
    Constraints.MinHeight = 86
    Constraints.MinWidth = 343
    DesignSize = (
      343
      105)
    object Label1: TLabel
      Left = 7
      Top = 27
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object btnAceptar: TButton
      Left = 184
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 261
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    inline fraUsuarioDerivacion: TfraUsuario
      Left = 49
      Top = 23
      Width = 287
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 203
      end
    end
    object chkNotificaGestor: TCheckBox
      Left = 8
      Top = 54
      Width = 113
      Height = 17
      Caption = 'Notificar al gestor'
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT UD_ID, UD_USUARIO, SE_NOMBRE, UD_FECHABAJA, ud_enviaralge' +
        'stor'
      '  FROM USE_USUARIOS, SUD_USUARIODERIVACIONVOLANTE'
      ' WHERE UD_USUARIO=SE_USUARIO'
      '   AND UD_CODDERIVACION=:CODDERIVACION')
    ParamData = <
      item
        DataType = ftString
        Name = 'CODDERIVACION'
        ParamType = ptInput
      end>
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
