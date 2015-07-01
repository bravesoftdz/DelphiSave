inherited frmMotivoEstudio: TfrmMotivoEstudio
  Left = 185
  Top = 158
  Caption = 'Motivo de los Estudios'
  FormStyle = fsNormal
  Position = poOwnerFormCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 13
  end
  inherited CoolBar: TCoolBar
    Top = 13
    inherited ToolBar: TToolBar
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 6
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 0
      end
      inherited tbModificar: TToolButton
        ImageIndex = 1
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 2
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Carga Autom'#225'tica'
        ImageIndex = 31
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 5
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 7
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 27
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 9
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 19
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 20
      end
      inherited tbSalir: TToolButton
        ImageIndex = 10
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 42
    Height = 397
    Columns = <
      item
        Expanded = False
        FieldName = 'RG_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 334
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 457
    Height = 73
    BorderStyle = bsSingle
    inherited BevelAbm: TBevel
      Top = 37
      Width = 449
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Riesgo'
    end
    inherited btnAceptar: TButton
      Left = 299
      Top = 43
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 377
      Top = 43
      TabOrder = 2
    end
    inline fraRiesgo: TfraRiesgo
      Left = 48
      Top = 8
      Width = 406
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 341
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      ' SELECT RG_CODIGO, RG_DESCRIPCION, RG_ID'
      ' FROM AME_MOTIVOESTUDIO, PRG_RIESGOS'
      ' WHERE RG_id = ME_idrg'
      '   AND ME_CUIT = :pCuit'
      '   AND ME_ESTABLECI = :pEstableci '
      '   AND ME_CUIL = :pCuil '
      '   AND ME_ESTUDIO = :pEstudio '
      '   AND ME_FECHA = :pFecha ')
    ParamData = <
      item
        DataType = ftString
        Name = 'pCuit'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pEstableci'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCuil'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pEstudio'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pFecha'
        ParamType = ptInput
      end>
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
