object frmManAuditores: TfrmManAuditores
  Left = 618
  Top = 261
  Width = 560
  Height = 254
  Caption = 'Mantenimiento de Auditores'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    552
    224)
  PixelsPerInch = 96
  TextHeight = 13
  inline fraNomenclador_aut: TfraNomenclador
    Left = 8
    Top = 36
    Width = 519
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    PopupMenu = fraNomenclador_aut.PopupMenu
    TabOrder = 0
    inherited cmbDescripcion: TLookupComboDlg
      Width = 404
    end
    inherited edNomenclador: TPatternEdit
      Left = -1
    end
  end
  inline fraPrestador: TfraCodigoDescripcion
    Left = 8
    Top = 8
    Width = 521
    Height = 23
    TabOrder = 1
    inherited cmbDescripcion: TArtComboBox
      Left = 52
      Width = 468
    end
    inherited edCodigo: TPatternEdit
      Left = 0
      Width = 47
    end
  end
  inline fraUsuario: TfraUsuario
    Left = 8
    Top = 89
    Width = 521
    Height = 21
    TabOrder = 2
    inherited cmbDescripcion: TArtComboBox
      Width = 437
    end
  end
  inline fraEspecialidad: TfraCodigoDescripcion
    Left = 8
    Top = 115
    Width = 535
    Height = 23
    TabOrder = 3
    inherited cmbDescripcion: TArtComboBox
      Left = 52
      Width = 470
    end
    inherited edCodigo: TPatternEdit
      Left = 0
      Width = 47
    end
  end
  inline fraNomenclador_sol: TfraNomenclador
    Left = 8
    Top = 62
    Width = 520
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    PopupMenu = fraNomenclador_aut.PopupMenu
    TabOrder = 4
    inherited cmbDescripcion: TLookupComboDlg
      Width = 404
    end
    inherited edNomenclador: TPatternEdit
      Left = -1
    end
  end
  inline fraPrestacion: TfraPrestacion
    Left = 7
    Top = 143
    Width = 522
    Height = 23
    TabOrder = 5
    inherited cmbDescripcion: TArtComboBox
      Width = 478
    end
  end
  object abmAuditores: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'AU_AUDITOR'
        PrimaryKey = True
        EditType = etInteger
        MaxLength = 4
        ReadOnly = True
        ColWidth = 48
      end
      item
        Caption = 'Apellido y Nombre'
        FieldName = 'AU_NOMBRE'
        MaxLength = 50
        ColWidth = 360
      end
      item
        Caption = 'E-mail'
        FieldName = 'AU_EMAIL'
        MaxLength = 255
        ColWidth = 320
      end
      item
        Caption = 'Prestador'
        FieldName = 'AU_PRESTADOR'
        Options = [foAllowSort, foShowInEditor]
        ColWidth = 0
      end
      item
        Caption = 'Prestador'
        FieldName = 'CA_DESCRIPCION'
        MaxLength = 70
        Options = [foAllowPrint, foShowInGrid]
        ColWidth = 320
      end
      item
        Caption = 'Prestac. Autorizac.'
        FieldName = 'AU_IDNOMENCLADOR'
        Options = [foAllowSort, foShowInEditor]
        ColWidth = 0
      end
      item
        Caption = 'Prestac.Sol.Audit.'
        FieldName = 'AU_IDNOMENCLADOR_SOL'
        Options = [foAllowSort, foShowInEditor]
        ColWidth = 0
      end
      item
        Caption = 'Prestaci'#243'n de la Autorizaci'#243'n'
        FieldName = 'DESC_AUT'
        MaxLength = 255
        Options = [foAllowPrint, foShowInGrid]
        ColWidth = 320
      end
      item
        Caption = 'Prestaci'#243'n de solic. de Audit.'
        FieldName = 'DESC_SOL'
        MaxLength = 255
        Options = [foAllowPrint, foShowInGrid]
        ColWidth = 320
      end
      item
        Caption = 'Usuario'
        FieldName = 'AU_USUARIO'
        ColWidth = 200
      end
      item
        Caption = 'Incapacidades     '
        FieldName = 'AU_INCAPACIDADES'
        EditType = etCheck
        ColWidth = 80
      end
      item
        Caption = 'No Anula Autoriz.'
        FieldName = 'AU_NOANULAAUTO'
        EditType = etCheck
        ColWidth = 80
      end
      item
        Caption = 'F.Baja'
        FieldName = 'AU_FBAJA'
        FieldType = ftDateDelete
        ColWidth = 80
      end
      item
        Caption = 'Especialidad'
        FieldName = 'AU_ESPECIALIDAD'
        Options = [foShowInEditor]
        ColWidth = 0
      end
      item
        Caption = 'Especialidad'
        FieldName = 'ESPECIALIDAD'
        MaxLength = 200
        Options = [foAllowPrint, foShowInGrid]
        ColWidth = 200
      end
      item
        Caption = 'Tipo Prestaci'#243'n'
        FieldName = 'AU_PRESTACION'
        MaxLength = 200
        ColWidth = 0
      end
      item
        Caption = 'Tercerizadora'
        FieldName = 'AU_TERCERIZADORA'
        EditType = etCheck
        ColWidth = 80
      end
      item
        Caption = 'Consultorio'
        FieldName = 'AU_CONSULTORIO'
        EditType = etCheck
        ColWidth = 80
      end
      item
        Caption = 'Autorizaci'#243'n aprobada'
        FieldName = 'AU_AUTOAPROBADA'
        EditType = etCheck
        ColWidth = 80
      end>
    Caption = 'Auditores'
    TableName = 'MAU_AUDITORES'
    DataSource = dsAuditores
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 100
    SecurityKey = 'frmManAuditores_abmAuditores'
    BeforePrint = abmAuditoresBeforePrint
    BeforeSave = abmAuditoresBeforeSave
    GetDefaults = abmAuditoresGetDefaults
    OnNeedControl = abmAuditoresNeedControl
    CustomSetValue = abmAuditoresCustomSetValue
    CustomGetSQLValue = abmAuditoresCustomGetSQLValue
    Left = 8
    Top = 194
  end
  object sdqAuditores: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT au_auditor, au_nombre, au_email, au_prestador, ca_descrip' +
        'cion,'
      '       au_idnomenclador,  au_idnomenclador_sol, '
      
        '       NOM_AUT.on_descripcion Desc_Aut, NOM_SOL.on_descripcion D' +
        'esc_Sol,'
      
        '       au_usuario, au_fbaja, au_incapacidades, au_especialidad, ' +
        'es_descripcion especialidad, '
      
        '       au_prestacion, pr_descripcion DescPrestacion, au_noanulaa' +
        'uto, au_tercerizadora, au_consultorio, au_autoaprobada'
      
        'FROM mau_auditores, cpr_prestador, son_nomenclador NOM_AUT, son_' +
        'nomenclador NOM_SOL, mes_especialidades,'
      '     art.mpr_prestaciones'
      'WHERE au_prestador = ca_identificador(+)'
      '  AND au_idnomenclador = NOM_AUT.on_id(+)'
      '  AND au_idnomenclador_sol = NOM_SOL.on_id(+)'
      '  AND au_especialidad = es_codigo(+)'
      '  AND au_prestacion = pr_codigo(+)'
      'ORDER BY au_nombre'
      '')
    Left = 36
    Top = 194
  end
  object dsAuditores: TDataSource
    DataSet = sdqAuditores
    Left = 64
    Top = 194
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 92
    Top = 194
  end
end
