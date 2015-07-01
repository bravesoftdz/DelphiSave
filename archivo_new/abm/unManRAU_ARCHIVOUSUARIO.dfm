inherited frmManRAU_ARCHIVOUSUARIO: TfrmManRAU_ARCHIVOUSUARIO
  Left = 57
  Top = 90
  Width = 630
  Height = 480
  Caption = 'Mantenimiento Perfiles de Usuarios'
  Constraints.MinHeight = 480
  Constraints.MinWidth = 630
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 622
    Height = 97
    Visible = True
    DesignSize = (
      622
      97)
    object gbBusqueda: TGroupBox
      Left = 2
      Top = 1
      Width = 618
      Height = 93
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        618
        93)
      object lbTipoArchivo: TLabel
        Left = 13
        Top = 18
        Width = 63
        Height = 13
        Caption = 'Tipo Archivo:'
      end
      object lblUsuarioBusqueda: TLabel
        Left = 15
        Top = 43
        Width = 39
        Height = 13
        Caption = 'Usuario:'
      end
      object lblSectorBusqueda: TLabel
        Left = 15
        Top = 69
        Width = 34
        Height = 13
        Caption = 'Sector:'
      end
      inline fraUsuarioBusqueda: TfraUsuarios
        Left = 88
        Top = 38
        Width = 518
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          518
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 96
          Width = 424
        end
        inherited edCodigo: TPatternEdit
          Width = 92
        end
      end
      inline fraTipoArchivoBusqueda: TfraCodigoDescripcion
        Left = 88
        Top = 13
        Width = 520
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          520
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 96
          Width = 424
        end
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 90
        end
      end
      inline fraSectoresBusqueda: TfraSectores
        Left = 89
        Top = 64
        Width = 519
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        inherited edCodigo: TPatternEdit
          Width = 92
        end
        inherited cmbDescripcion: TArtComboBox
          Left = 96
          Width = 423
          Columns = <
            item
              Expanded = False
              FieldName = 'SC_CODIGO'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SC_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 200
              Visible = True
            end>
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 97
    Width = 622
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 618
      end>
    inherited ToolBar: TToolBar
      Width = 605
      inherited ToolButton5: TToolButton
        Caption = ''
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Caption = ''
      end
      inherited ToolButton3: TToolButton
        Caption = ''
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited ToolButton6: TToolButton
        Caption = ''
      end
      inherited ToolButton8: TToolButton
        Caption = ''
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
      inherited ToolButton11: TToolButton
        Caption = ''
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 126
    Width = 622
    Height = 327
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCION'
        Title.Caption = 'Tipo de Archivo'
        Width = 293
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Usuario'
        Width = 248
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 72
    Top = 236
    Width = 485
    Height = 117
    Constraints.MaxHeight = 117
    Constraints.MinHeight = 117
    Constraints.MinWidth = 485
    DesignSize = (
      485
      117)
    inherited BevelAbm: TBevel
      Top = 81
      Width = 477
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 49
      Width = 39
      Height = 13
      Caption = 'Usuario:'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 22
      Width = 63
      Height = 13
      Caption = 'Tipo Archivo:'
    end
    inherited btnAceptar: TButton
      Left = 327
      Top = 87
      Default = True
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 405
      Top = 87
      TabOrder = 3
    end
    inline fraUsuario: TfraUsuarios
      Left = 78
      Top = 43
      Width = 400
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        400
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 64
        Width = 335
      end
      inherited edCodigo: TPatternEdit
        Width = 60
      end
    end
    inline fraTipoArchivo: TfraCodigoDescripcion
      Left = 78
      Top = 16
      Width = 401
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        401
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 336
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT USE.se_nombre, rta.ta_descripcion, AU_FECHABAJA'
      '  FROM archivo.rau_tipoarchivousuario rau,'
      '       use_usuarios USE,'
      '       archivo.rta_tipoarchivo rta'
      ' WHERE (    (USE.se_usuario = rau.au_usuario)'
      '        AND (rta.ta_id = rau.au_idtipoarchivo)'
      '       )')
  end
  object ShortCutControl1: TShortCutControl
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
    Left = 108
    Top = 200
  end
end
