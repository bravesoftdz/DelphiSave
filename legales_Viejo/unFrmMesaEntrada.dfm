inherited FrmMesaEntrada: TFrmMesaEntrada
  Left = 200
  Top = 107
  Width = 754
  Caption = 'Mesa de Entrada Legales'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 746
    Height = 121
    object gbFiltros: TGroupBox
      Left = 0
      Top = 0
      Width = 746
      Height = 121
      Align = alClient
      TabOrder = 0
      DesignSize = (
        746
        121)
      object Label5: TLabel
        Left = 12
        Top = 19
        Width = 37
        Height = 13
        Caption = 'Material'
      end
      object lblDescripcionMaterial: TLabel
        Left = 456
        Top = 19
        Width = 59
        Height = 13
        Caption = 'Descripci'#243'n:'
      end
      object lblFechaRecepcionMGES: TLabel
        Left = 11
        Top = 43
        Width = 67
        Height = 13
        Caption = 'Fecha MGES:'
      end
      object lblNroRecepcionMGES: TLabel
        Left = 292
        Top = 43
        Width = 54
        Height = 13
        Caption = 'Nro.MGES:'
      end
      object lblFechaRecepcion: TLabel
        Left = 534
        Top = 43
        Width = 88
        Height = 13
        Caption = 'Fecha Recepci'#243'n:'
      end
      object lblUsuarioRecepcionInicial: TLabel
        Left = 9
        Top = 68
        Width = 94
        Height = 13
        Caption = 'Usuario Recepci'#243'n:'
      end
      object Label6: TLabel
        Left = 359
        Top = 68
        Width = 98
        Height = 13
        Caption = 'Usuario Destinatario:'
      end
      object Label7: TLabel
        Left = 10
        Top = 92
        Width = 71
        Height = 13
        Caption = 'En Relacion A:'
      end
      object lblElementoRelacionado: TLabel
        Left = 360
        Top = 95
        Width = 63
        Height = 13
        Caption = 'Relacionado:'
      end
      inline FraMaterialFiltro: TfraCodigoDescripcion
        Left = 106
        Top = 14
        Width = 317
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 85
          Width = 232
        end
        inherited edCodigo: TPatternEdit
          Width = 81
          Alignment = taRightJustify
        end
      end
      object mDescripcionFiltro: TMemo
        Left = 518
        Top = 15
        Width = 217
        Height = 21
        TabOrder = 1
      end
      object edFechaMGESFiltro: TDateComboBox
        Left = 106
        Top = 40
        Width = 98
        Height = 21
        MinDate = 35431.000000000000000000
        TabOrder = 2
      end
      object edNroMGESFiltro: TPatternEdit
        Left = 352
        Top = 40
        Width = 122
        Height = 21
        MaxLength = 6
        TabOrder = 3
        Alignment = taRightJustify
        Pattern = '0123456789'
      end
      object edFechaRecepcionFiltro: TDateComboBox
        Left = 633
        Top = 40
        Width = 98
        Height = 21
        MinDate = 35431.000000000000000000
        TabOrder = 4
      end
      inline fraUsuarioRecepcionFiltro: TfraUsuario
        Left = 106
        Top = 65
        Width = 240
        Height = 23
        TabOrder = 5
        DesignSize = (
          240
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 156
        end
      end
      inline fraUsuarioDestinatarioFiltro: TfraUsuario
        Left = 463
        Top = 65
        Width = 273
        Height = 23
        TabOrder = 6
        DesignSize = (
          273
          23)
        inherited edCodigo: TPatternEdit
          Width = 80
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 189
        end
      end
      object cmbEnRelacionAFiltro: TComboBox
        Left = 106
        Top = 90
        Width = 240
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 7
        Items.Strings = (
          'JUICIOS EN TRAMITE'
          'MEDIACIONES'
          'SUMARIOS')
      end
      inline fraRelecionadoFiltro: TfraCodigoDescripcion
        Left = 462
        Top = 89
        Width = 271
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        inherited cmbDescripcion: TArtComboBox
          Left = 85
          Width = 188
        end
        inherited edCodigo: TPatternEdit
          Width = 81
          Alignment = taRightJustify
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 121
    Width = 746
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 742
      end>
    inherited ToolBar: TToolBar
      Width = 729
    end
  end
  inherited Grid: TArtDBGrid
    Top = 150
    Width = 746
    Height = 289
    Columns = <
      item
        Expanded = False
        FieldName = 'ME_ID'
        Title.Caption = 'Nro.Entrada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_DESCRIPCION'
        Title.Caption = 'Tipo Material'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_NROMGES'
        Title.Caption = 'Nro.MGES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_FECHAMGES'
        Title.Caption = 'F.MGES'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_FECHARECEPCIONLEGALES'
        Title.Caption = 'F.Recep.Legales.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIORECEPCION'
        Title.Caption = 'Usuario Recep.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIODESTINO'
        Title.Caption = 'Usuario Dest.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RA_DESCRIPCION'
        Title.Caption = 'Relacionado '
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 152
    Top = 152
    Width = 440
    Height = 276
    inherited BevelAbm: TBevel
      Top = 240
      Width = 432
    end
    object lblEnRelacionA: TLabel [1]
      Left = 13
      Top = 191
      Width = 71
      Height = 13
      Caption = 'En Relacion A:'
    end
    object lblUsuarioRecepcion: TLabel [2]
      Left = 11
      Top = 104
      Width = 94
      Height = 13
      Caption = 'Usuario Recepci'#243'n:'
    end
    object lblUsuarioDestinatario: TLabel [3]
      Left = 11
      Top = 130
      Width = 98
      Height = 13
      Caption = 'Usuario Destinatario:'
    end
    object lblDescripcion: TLabel [4]
      Left = 13
      Top = 43
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object lblObservaciones: TLabel [5]
      Left = 12
      Top = 155
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object lblMaterial: TLabel [6]
      Left = 11
      Top = 19
      Width = 37
      Height = 13
      Caption = 'Material'
    end
    object lblFechaMGES: TLabel [7]
      Left = 13
      Top = 80
      Width = 67
      Height = 13
      Caption = 'Fecha MGES:'
    end
    object lblFechaPublicacion: TLabel [8]
      Left = 174
      Top = 59
      Width = 67
      Height = 13
      Caption = 'F.Publicaci'#243'n:'
    end
    object lblNroMGES: TLabel [9]
      Left = 239
      Top = 80
      Width = 54
      Height = 13
      Caption = 'Nro.MGES:'
    end
    inherited btnAceptar: TButton
      Left = 282
      Top = 246
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 360
      Top = 246
      TabOrder = 8
    end
    inline fraUsuarioRecepcion: TfraUsuario
      Left = 111
      Top = 101
      Width = 309
      Height = 23
      TabOrder = 2
      DesignSize = (
        309
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 224
      end
    end
    inline fraUsuarioDestinatario: TfraUsuario
      Left = 111
      Top = 127
      Width = 310
      Height = 23
      TabOrder = 3
      DesignSize = (
        310
        23)
      inherited edCodigo: TPatternEdit
        Width = 80
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 225
      end
    end
    object mDescripcion: TMemo
      Left = 111
      Top = 40
      Width = 308
      Height = 33
      TabOrder = 1
    end
    object mObservaciones: TMemo
      Left = 111
      Top = 152
      Width = 307
      Height = 33
      TabOrder = 4
    end
    inline fraMaterial: TfraCodigoDescripcion
      Left = 111
      Top = 14
      Width = 310
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 85
        Width = 224
      end
      inherited edCodigo: TPatternEdit
        Width = 81
        Alignment = taRightJustify
      end
    end
    object cmbEnRelacionA: TComboBox
      Left = 111
      Top = 189
      Width = 308
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        'JUICIOS EN TRAMITE'
        'MEDIACIONES'
        'SUMARIOS')
    end
    object pnRelacion: TPanel
      Left = 9
      Top = 210
      Width = 415
      Height = 29
      BevelOuter = bvNone
      TabOrder = 6
      Visible = False
      DesignSize = (
        415
        29)
      object lblRelacion: TLabel
        Left = 5
        Top = 7
        Width = 63
        Height = 13
        Caption = 'Relacionado:'
      end
      inline fraRelacion: TfraCodigoDescripcion
        Left = 101
        Top = 3
        Width = 308
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 85
          Width = 224
        end
        inherited edCodigo: TPatternEdit
          Width = 81
          Alignment = taRightJustify
        end
      end
    end
    object edFechaRecepcionMGES: TDateComboBox
      Left = 111
      Top = 76
      Width = 98
      Height = 21
      MinDate = 35431.000000000000000000
      TabOrder = 9
    end
    object edNroMGES: TPatternEdit
      Left = 296
      Top = 77
      Width = 122
      Height = 21
      MaxLength = 6
      TabOrder = 10
      Alignment = taRightJustify
      Pattern = '0123456789'
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT '
      '       lme.me_id, lme.me_descripcion, lme.me_nromges,'
      '       lme.me_fechamges, lme.me_fecharecepcionlegales,'
      '       lme.me_observaciones,'
      
        '       usuariorecepcion.se_nombre usuariorecepcion, usuariodesti' +
        'no.se_nombre usuariodestino,'
      '       lra_relacionasunto.ra_descripcion, lmt.mt_descripcion'
      '  FROM legales.lme_mesaentradalegales lme,'
      '       use_usuarios usuariorecepcion,'
      '       use_usuarios usuariodestino,'
      '       legales.lmt_tipomaterial lmt,'
      '       legales.lra_relacionasunto'
      ' WHERE (    (lme.me_usuariodestino = usuariodestino.se_usuario)'
      
        '        AND (lme.me_usuariorecepcionlegales = usuariorecepcion.s' +
        'e_usuario)'
      '        AND (lmt.mt_id = lme.me_idtipomaterial)'
      '        AND (lra_relacionasunto.ra_id = lme.me_idrelacionasunto)'
      '       )')
    Left = 16
    Top = 332
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 332
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 360
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 360
  end
  inherited QueryPrint: TQueryPrint
    Left = 44
    Top = 388
  end
  inherited Seguridad: TSeguridad
    Left = 15
    Top = 304
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 304
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 388
  end
  inherited ShortCutControl: TShortCutControl
    Left = 72
    Top = 304
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 332
  end
end
