inherited frmABMUsuAvisoVol: TfrmABMUsuAvisoVol
  Left = 428
  Top = 251
  Width = 405
  Height = 254
  Caption = 'ABM de Usuarios Avisos Volantes'
  FormStyle = fsNormal
  OldCreateOrder = True
  OnClose = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 397
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 397
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 393
      end>
    inherited ToolBar: TToolBar
      Width = 380
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbMostrarFiltros: TToolButton
        Enabled = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Width = 397
    Height = 193
    OnDblClick = nil
    OnKeyDown = nil
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'VR_USUARIO'
        Title.Caption = 'Usuario'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 200
        Visible = True
      end>
  end
  object FPAlta: TFormPanel [3]
    Left = 40
    Top = 96
    Width = 343
    Height = 65
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poDesktopCenter
    Constraints.MaxHeight = 86
    Constraints.MinWidth = 343
    DesignSize = (
      343
      65)
    object Label1: TLabel
      Left = 6
      Top = 14
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object btnAceptar: TButton
      Left = 185
      Top = 39
      Width = 75
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 262
      Top = 39
      Width = 75
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    inline fraUsuario: TfraUsuario
      Left = 47
      Top = 10
      Width = 290
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 206
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT VR_ID, VR_USUARIO, SE_NOMBRE, VR_FECHABAJA'
      '  FROM USE_USUARIOS, SVR_USUARIOAVISOVOLANTE'
      ' WHERE VR_USUARIO=SE_USUARIO'
      '   AND VR_CODAVISO=:CODAVISO')
    Left = 32
    Top = 140
    ParamData = <
      item
        DataType = ftString
        Name = 'CODAVISO'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 60
    Top = 140
  end
  inherited SortDialog: TSortDialog
    Left = 32
    Top = 168
  end
  inherited ExportDialog: TExportDialog
    Left = 60
    Top = 168
  end
  inherited QueryPrint: TQueryPrint
    Left = 60
    Top = 196
  end
  inherited Seguridad: TSeguridad
    Left = 32
    Top = 112
  end
  inherited FormStorage: TFormStorage
    Left = 60
    Top = 112
  end
  inherited PrintDialog: TPrintDialog
    Left = 32
    Top = 196
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
    Left = 88
    Top = 112
  end
  inherited FieldHider: TFieldHider
    Left = 88
    Top = 140
  end
end
