object frmContratoBuscarContacto: TfrmContratoBuscarContacto
  Left = 246
  Top = 178
  Width = 596
  Height = 296
  Caption = 'Buscar Contacto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    588
    270)
  PixelsPerInch = 96
  TextHeight = 13
  object gbBuscarContacto: TGroupBox
    Left = 0
    Top = 0
    Width = 588
    Height = 218
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object GridBuscarContacto: TArtDBGrid
      Left = 2
      Top = 15
      Width = 584
      Height = 201
      Align = alClient
      DataSource = dsDatos
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = GridBuscarContactoDblClick
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'CT_CONTACTO'
          Title.Caption = 'Nombre'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CARGO'
          Title.Caption = 'Cargo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CT_AREA'
          Title.Caption = 'Area'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONOS'
          Title.Caption = 'Telefonos'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CT_CODAREAFAX'
          Title.Caption = 'Cod. Fax'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CT_FAX'
          Title.Caption = 'Fax'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CT_DIRELECTRONICA'
          Title.Caption = 'Correo Electronico'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CT_AREACARGA'
          Title.Caption = 'Area de Carga'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REMITENTECARTA'
          Title.Caption = 'Remitente Carta'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'firmante'
          Title.Caption = 'Firmante'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipodocumento'
          Title.Caption = 'Tipo Doc.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ct_numerodocumento'
          Title.Caption = 'N'#176' Documento'
          Visible = True
        end>
    end
  end
  object btnSeleccionar: TButton
    Left = 498
    Top = 226
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Seleccionar'
    TabOrder = 1
    OnClick = btnSeleccionarClick
  end
  object btnCancelar: TButton
    Left = 418
    Top = 226
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT carea.tb_descripcion area, cargo.tb_descripcion cargo, ct' +
        '_area, ct_areacarga, ct_cargo, ct_codareafax, ct_contacto,'
      
        '       ct_direlectronica, ct_fax, ct_fechabaja, ct_firmante, ct_' +
        'id, ct_idempresa, ct_numerodocumento, ct_remitentecarta,'
      
        '       ct_tipodocumento, ct_sexo, TRUNC(ct_fechaalta) fechaalta,' +
        ' TRUNC(ct_fechamodif) fechamodif,'
      
        '       DECODE(ct_firmante, '#39'S'#39', '#39'S'#237#39', '#39'No'#39') firmante, DECODE(ct_' +
        'remitentecarta, '#39'S'#39', '#39'Si'#39', '#39'No'#39') remitentecarta,'
      
        '       afi.get_telefonos('#39'ATN_TELEFONOCONTACTO'#39', ct_id) telefono' +
        's, tdoc.tb_descripcion tipodocumento, use1.se_nombre usualta,'
      
        '       use2.se_nombre usumodif, firma.cf_caracter, ct_tipofirma,' +
        ' ct_idcaracterfirma'
      
        '  FROM art.use_usuarios use1, act_contacto, aco_contrato, ctb_ta' +
        'blas cargo, ctb_tablas carea, ctb_tablas tdoc,'
      '       art.use_usuarios use2, acf_caracterfirma firma'
      ' WHERE ct_usualta = use1.se_usuario(+)'
      '   AND ct_idempresa = co_idempresa'
      '   AND ct_cargo = cargo.tb_codigo(+)'
      '   AND cargo.tb_clave(+) = '#39'CARGO'#39
      '   AND ct_area = carea.tb_codigo(+)'
      '   AND carea.tb_clave(+) = '#39'CAREA'#39
      '   AND ct_tipodocumento = tdoc.tb_codigo(+)'
      '   AND ct_idcaracterfirma = firma.cf_id(+)'
      '   AND tdoc.tb_clave(+) = '#39'TDOC'#39
      '   AND ct_usumodif = use2.se_usuario(+)'
      '   AND co_contrato = :co_contrato')
    Left = 16
    Top = 212
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'co_contrato'
        ParamType = ptInput
      end>
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 48
    Top = 212
  end
end
