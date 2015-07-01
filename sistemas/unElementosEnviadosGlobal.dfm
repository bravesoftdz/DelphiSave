inherited frmElementosEnviadosGlobal: TfrmElementosEnviadosGlobal
  Left = 173
  Top = 162
  Width = 800
  Constraints.MinWidth = 800
  PixelsPerInch = 96
  TextHeight = 13
  inherited Separador: TJvOutlookSplitter
    Top = 301
    Width = 792
  end
  inherited Separador2: TJvOutlookSplitter
    Left = 565
    Top = 330
    Height = 143
  end
  inherited pnlBody: TPanel
    Top = 330
    Width = 565
    Height = 143
    inherited reTextoCuerpo: TRxRichEdit
      Height = 139
    end
    inherited WebBrowser: TWebBrowser
      Width = 338
      Height = 139
      ControlData = {
        4C000000991800003B0D00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 97
    inherited Label2: TLabel
      Left = 8
      Top = 52
    end
    inherited Label3: TLabel
      Left = 416
      Anchors = [akTop, akRight]
    end
    object Label6: TLabel [3]
      Left = 244
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Ejecutable'
    end
    object Label7: TLabel [4]
      Left = 244
      Top = 52
      Width = 142
      Height = 13
      Caption = 'Cuerpo (Simple - Mails cortos)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited fraEE_DIRECCIONORIGEN: TfraUsuario
      Width = 230
      TabOrder = 1
      inherited edCodigo: TPatternEdit
        Width = 77
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 80
        Width = 150
      end
    end
    inherited edEE_MOTIVO_LIKE: TEdit
      Left = 8
      Top = 68
      Width = 229
      TabOrder = 4
    end
    inherited edEE_DIRECCIONESDESTINO_LIKE: TEdit
      Left = 412
      Width = 157
      Anchors = [akTop, akRight]
      TabOrder = 6
    end
    inherited gbFecha: TGroupBox
      Left = 576
      Top = 8
      Width = 210
      Anchors = [akTop, akRight]
      TabOrder = 3
      inherited Label4: TLabel
        Top = 21
        Font.Height = -8
      end
      inherited cmbEE_FECHAMENSAJEHasta: TDateComboBox
        Left = 115
      end
    end
    inherited edEE_ID: TIntEdit
      Width = 129
      TabOrder = 0
    end
    inline fraEE_IDORIGENGENERACION: TfraCodigoDescripcion
      Left = 240
      Top = 23
      Width = 330
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Left = 40
        Width = 291
      end
      inherited edCodigo: TPatternEdit
        Width = 36
      end
    end
    object clbEE_TIPOCUERPO: TARTCheckListBox
      Left = 576
      Top = 56
      Width = 209
      Height = 37
      Anchors = [akTop, akRight]
      BevelEdges = []
      BorderStyle = bsNone
      Columns = 2
      ItemHeight = 13
      TabOrder = 7
      AutoAjustarColumnas = False
      Locked = False
      SQL = 
        'SELECT '#39'HTML'#39' as DESCRIPCION, '#39'H'#39' FROM DUAL UNION SELECT '#39'RTF'#39' a' +
        's DESCRIPCION, '#39'R'#39' FROM DUAL UNION SELECT '#39'Texto plano'#39' as DESCR' +
        'IPCION, '#39'T'#39' FROM DUAL ORDER BY 1'
    end
    object edEE_CUERPO_FULL_LIKE: TEdit
      Left = 240
      Top = 68
      Width = 169
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecLowerCase
      TabOrder = 5
    end
  end
  inherited CoolBar: TCoolBar
    Top = 97
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 788
      end>
    inherited ToolBar: TToolBar
      Width = 775
    end
  end
  inherited Grid: TArtDBGrid
    Top = 126
    Width = 792
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'EE_ID'
        Title.Caption = 'Id'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_FECHAMENSAJE'
        Title.Caption = 'Fecha'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_DIRECCIONESDESTINO'
        Title.Caption = 'Destinatarios'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_MOTIVO'
        Title.Caption = 'Asunto'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_DIRECCIONORIGEN'
        Title.Caption = 'Remitente'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_FECHAENVIO'
        Title.Caption = 'Env'#237'o'
        Width = 60
        Visible = True
      end>
  end
  inherited lbAdjuntos: TListBox
    Left = 572
    Top = 330
    Height = 143
    TabOrder = 2
  end
  inherited pnlTitulos: TPanel
    Top = 308
    Width = 792
    TabOrder = 3
    inherited lbArchivosAdjuntos: TLabel
      Left = 656
    end
    inherited chkVerAdjuntos: TCheckBox
      Left = 752
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT /*+ CHOOSE*/'
      
        '       ee_id, ee_direccionesdestino, ee_motivo, ee_fechamensaje,' +
        ' ee_fechaenvio,'
      
        '       ee_direccionorigen, ee_cuerpo, ee_cuerpoex, ee_tipocuerpo' +
        ', ee_estado, ee_idorigengeneracion, ee_procesarformhtml,'
      '       ee_idregistroasociado, ee_tiporegistroasociado'
      '  FROM comunes.cee_emailaenviar'
      ' WHERE 1 = 1'
      '')
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
