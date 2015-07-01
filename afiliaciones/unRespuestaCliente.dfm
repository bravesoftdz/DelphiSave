object frmRespuestaCliente: TfrmRespuestaCliente
  Left = 229
  Top = 166
  Width = 600
  Height = 336
  BorderIcons = [biMaximize]
  Caption = 'Respuesta del Cliente'
  Color = clBtnFace
  Constraints.MinHeight = 336
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    592
    309)
  PixelsPerInch = 96
  TextHeight = 13
  object btnAceptar: TButton
    Left = 512
    Top = 280
    Width = 72
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 0
    OnClick = btnAceptarClick
  end
  object tblGrid: TArtDBGrid
    Left = 4
    Top = 31
    Width = 586
    Height = 236
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = tlbNuevoClick
    OnGetCellParams = tblGridGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'CA_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CA_NROCARTADOC'
        Title.Caption = 'N'#186' Carta Doc.'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_NOMBRE'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CORREO'
        Title.Caption = 'Correo'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UIMPRESION'
        Title.Caption = 'Usu.Impresi'#243'n'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIMPRESION'
        Title.Caption = 'Fecha Imp.'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_RECEPCIONOK'
        Title.Caption = 'Recepci'#243'n'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHARECEPCION'
        Title.Caption = 'F. Recepci'#243'n'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Tipo Recepci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHABAJA'
        Title.Caption = 'F. Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUBAJA'
        Title.Caption = 'Usu. Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESPUESTA'
        Title.Caption = 'Respuesta'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_RESPUESTA'
        Title.Caption = 'F. Respuesta'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAS'
        Title.Caption = 'Dias'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 201
        Visible = True
      end>
  end
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 592
    Height = 27
    Caption = 'tlbControl'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object tlbNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo (Ctrl -  N)'
      Caption = 'tlbNuevo'
      ImageIndex = 6
      OnClick = tlbNuevoClick
    end
    object tblSeparador2: TToolButton
      Left = 23
      Top = 0
      Width = 5
      Caption = 'tblSeparador2'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbSalir: TToolButton
      Left = 28
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      OnClick = btnAceptarClick
    end
  end
  object frmRespuesta: TFormPanel
    Left = 173
    Top = 55
    Width = 384
    Height = 204
    Caption = 'Respuesta'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poScreenCenter
    Constraints.MinHeight = 202
    Constraints.MinWidth = 323
    DesignSize = (
      384
      204)
    object GroupBox1: TGroupBox
      Left = 6
      Top = 8
      Width = 371
      Height = 107
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Respuesta Empresa'
      TabOrder = 0
      DesignSize = (
        371
        107)
      object lbAceptacion: TLabel
        Left = 4
        Top = 50
        Width = 63
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Observaci'#243'n:'
      end
      inline fraRespuestaCartaEmpresa: TfraRespuestaCarta
        Left = 6
        Top = 18
        Width = 361
        Height = 27
        Anchors = [akLeft, akTop, akRight]
        Constraints.MinHeight = 27
        Constraints.MinWidth = 300
        TabOrder = 0
        inherited lbAceptacion: TLabel
          Left = 4
        end
        inherited lbFechaAceptacion: TLabel
          Left = 180
        end
        inherited edFecha: TDateComboBox
          Left = 271
          TabOrder = 1
        end
        inherited cmbAceptacion: TComboBox
          Top = 1
          TabOrder = 0
        end
      end
      object mObservaciones: TMemo
        Left = 69
        Top = 47
        Width = 295
        Height = 52
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 116
      Width = 371
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Respuesta ART'
      TabOrder = 1
      DesignSize = (
        371
        53)
      inline fraRespuestaCartaART: TfraRespuestaCarta
        Left = 6
        Top = 18
        Width = 361
        Height = 27
        Anchors = [akLeft, akTop, akRight]
        Constraints.MinHeight = 27
        Constraints.MinWidth = 300
        TabOrder = 0
        inherited lbAceptacion: TLabel
          Left = 4
        end
        inherited lbFechaAceptacion: TLabel
          Left = 180
        end
        inherited edFecha: TDateComboBox
          Left = 271
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        inherited cmbAceptacion: TComboBox
          TabOrder = 0
        end
      end
    end
    object tblAceptaResp: TButton
      Left = 225
      Top = 174
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = tblAceptaRespClick
    end
    object btnCancelar: TButton
      Left = 302
      Top = 174
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 44
    Top = 85
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT ca_id, ca_nrocartadoc, ht_nombre tc_nombre, correo.tb_des' +
        'cripcion correo, ca_observaciones,'
      
        '       NVL(ca_usureimpresion, ca_usuimpresion) uimpresion, NVL(c' +
        'a_fechareimpresion, ca_fechaimpresion) fimpresion,'
      
        '       ca_recepcionok, ca_fecharecepcion, codre.tb_descripcion, ' +
        'ca_fechabaja, ca_usubaja,'
      
        '       NVL(rc_aceptacion, rc_decision) respuesta, NVL(rc_fechare' +
        'spuesta, rc_fechaalta) fecha_respuesta,'
      
        '       NVL(ca_fecharecepcion, actualdate) - NVL(ca_fechareimpres' +
        'ion, ca_fechaimpresion) dias, ca_idformulario, rc_id,'
      '       rc_observaciones'
      
        '  FROM arc_respuestacarta, ctb_tablas codre, cfi_firma, ctb_tabl' +
        'as correo, cta_textoarea, comunes.cht_historicotextocarta,'
      '       cca_carta'
      ' WHERE ca_idhistoricotextocarta = ht_id'
      '   AND correo.tb_clave = '#39'CORRE'#39
      '   AND NVL(ca_correoreimpresion, ca_correo) = correo.tb_codigo'
      '   AND NVL(ca_idfirmareimpresion, ca_idfirma) = fi_id'
      '   AND codre.tb_clave(+) = '#39'CODRE'#39
      '   AND ca_codrecepcion = codre.tb_codigo(+)'
      '   AND ta_idtextocarta = ht_idtextocarta'
      '   AND ta_idareatexto = 1'
      '   AND ca_id = rc_idcarta(+)'
      '   AND ca_idformulario = 15'
      '')
    Left = 16
    Top = 86
  end
end
