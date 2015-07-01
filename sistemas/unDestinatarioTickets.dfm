inherited frmDestinatarioTickets: TfrmDestinatarioTickets
  Left = 299
  Top = 270
  Caption = 'Destinatario de los Tickets por Sector'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'SE_DESCRIPCION'
        Width = 244
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_FECHADESDE'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 144
    Top = 160
    Width = 393
    Height = 129
    inherited BevelAbm: TBevel
      Top = 93
      Width = 385
    end
    inherited btnAceptar: TButton
      Left = 235
      Top = 99
    end
    inherited btnCancelar: TButton
      Left = 313
      Top = 99
    end
    inline fraUsuarioConSectorIntranet: TfraUsuarioConSectorIntranet
      Left = 10
      Top = 12
      Width = 367
      Height = 67
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inherited pnlGeneral: TPanel
        inherited fraSector: TfraCodDesc
          inherited cmbDescripcion: TArtComboBox
            Width = 217
          end
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT su_id,'
      '       su_idsector,'
      '       su_idusuario,'
      '       su_fechadesde,'
      '       su_fechahasta,'
      '       sector.se_descripcion,'
      '       usuario.se_nombre usuario,'
      '       usuario.se_usuario'
      
        '  FROM computos.csu_sectorusuario, computos.cse_sector sector, a' +
        'rt.use_usuarios usuario'
      ' WHERE su_idsector = sector.se_id'
      '   AND usuario.se_id = su_idusuario')
    object sdqConsultaSU_ID: TFloatField
      FieldName = 'SU_ID'
      Required = True
    end
    object sdqConsultaSU_IDSECTOR: TFloatField
      FieldName = 'SU_IDSECTOR'
      Required = True
    end
    object sdqConsultaSU_IDUSUARIO: TFloatField
      FieldName = 'SU_IDUSUARIO'
      Required = True
    end
    object sdqConsultaSU_FECHADESDE: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'SU_FECHADESDE'
      Required = True
    end
    object sdqConsultaSU_FECHAHASTA: TDateTimeField
      FieldName = 'SU_FECHAHASTA'
    end
    object sdqConsultaSE_DESCRIPCION: TStringField
      DisplayLabel = 'Sector'
      FieldName = 'SE_DESCRIPCION'
      Required = True
      Size = 50
    end
    object sdqConsultaUSUARIO: TStringField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
      Size = 50
    end
    object sdqConsultaSE_USUARIO: TStringField
      FieldName = 'SE_USUARIO'
      Required = True
    end
  end
end
