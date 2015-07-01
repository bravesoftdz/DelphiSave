inherited frmListPresupuestos: TfrmListPresupuestos
  Left = 183
  Top = 171
  Width = 700
  Height = 368
  Caption = 'Consulta Presupuestos'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 650
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 103
    object GroupBox1: TGroupBox
      Left = 349
      Top = 3
      Width = 341
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Estado de la Autorizaci'#243'n '
      TabOrder = 2
      DesignSize = (
        341
        48)
      object cmbEstado: TDBCheckCombo
        Left = 8
        Top = 19
        Width = 326
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsEstado
        KeyField = 'tb_codigo'
        ListField = 'tb_descripcion'
      end
    end
    object GroupBox2: TGroupBox
      Left = 219
      Top = 52
      Width = 471
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Prestador '
      TabOrder = 4
      DesignSize = (
        471
        47)
      inline fraPrestador: TfraPrestador
        Left = 4
        Top = 15
        Width = 461
        Height = 24
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCPostal: TLabel
          Left = 373
        end
        inherited lbTelefono: TLabel
          Left = 285
        end
        inherited cmbPrestador: TArtComboBox
          Width = 115
        end
        inherited edPresLocalidad: TEdit
          Width = 27
        end
        inherited edPresCPostal: TEdit
          Left = 390
        end
        inherited edPresTelefono: TEdit
          Left = 305
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 3
      Top = 3
      Width = 211
      Height = 48
      Caption = '  Fecha de Carga Autorizaci'#243'n '
      TabOrder = 0
      object Label4: TLabel
        Left = 97
        Top = 23
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object dcHasta: TDateComboBox
        Left = 113
        Top = 19
        Width = 88
        Height = 21
        MinDateCombo = dcDesde
        TabOrder = 1
      end
      object dcDesde: TDateComboBox
        Left = 6
        Top = 19
        Width = 88
        Height = 21
        MaxDateCombo = dcHasta
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 219
      Top = 3
      Width = 125
      Height = 48
      Caption = ' Siniestro '
      TabOrder = 1
      object edSiniestro: TSinEdit
        Left = 6
        Top = 19
        Width = 107
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 3
      Top = 51
      Width = 211
      Height = 48
      Caption = ' Prestaci'#243'n '
      TabOrder = 3
      inline fraPrestacion: TfraCodigoDescripcion
        Left = 4
        Top = 18
        Width = 203
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 54
          Width = 148
        end
        inherited edCodigo: TPatternEdit
          Width = 49
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 103
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 688
      end>
    inherited ToolBar: TToolBar
      Width = 675
    end
  end
  inherited Grid: TArtDBGrid
    Top = 132
    Width = 692
    Height = 209
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ORDEN'
        Title.Alignment = taCenter
        Title.Caption = 'Orden'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RECAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'Reca'#237'da'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AUTO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Aut.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTACION'
        Title.Caption = 'Prestaci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NRO_PEDIDO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Pedido'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PRESU'
        Title.Alignment = taCenter
        Title.Caption = 'Presupuesto'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATERIAL'
        Title.Caption = 'Material'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FCargaAut'
        Title.Alignment = taCenter
        Title.Caption = 'F. Carga'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'F_RECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F.Recepci'#243'n'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COTIZACION'
        Title.Alignment = taCenter
        Title.Caption = 'Cotizaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ADJUDICADO'
        Title.Alignment = taCenter
        Title.Caption = 'Adjudicado'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOT_ANUL'
        Title.Caption = 'Motivo Anulaci'#243'n'
        Width = 150
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT au_siniestro Siniestro, au_orden Orden, au_recaida Recaid' +
        'a, au_numauto Auto, '
      
        '               estado.tb_descripcion estado, so_nropedido Nro_Pe' +
        'dido, so_presupuesto Presu,'
      
        '               ca_descripcion Prestador, NVL(po_materialcoti,po_' +
        'materialsoli) Material,'
      
        #9'TRUNC(po_fechaalta) F_Pedido, po_fecharecepcion F_Recepcion, po' +
        '_cotizacion Cotizacion,'
      
        #9'so_observaciones Observaciones, so_adjudicado Adjudicado, anula' +
        '.tb_descripcion Mot_anul,'
      '               pr_descripcion prestacion'
      
        '  FROM art.sau_autorizaciones, art.mpr_prestaciones, art.ctb_tab' +
        'las estado,'
      
        '       art.cpr_prestador, art.mpo_presupuestoPresupuestos, art.m' +
        'so_siniestroPresupuestos,'
      #9'   art.ctb_tablas anula '
      ' WHERE au_pressol = pr_codigo'
      '   AND pr_formulario = '#39'P'#39'    '
      '   AND au_estado not in ('#39'D'#39','#39'N'#39','#39'X'#39')'
      '   AND estado.tb_clave = '#39'MUAUT'#39
      '   AND estado.tb_codigo = au_estado'
      '   AND so_siniestro = au_siniestro'
      '   AND so_orden = au_orden'
      '   AND so_recaida = au_recaida'
      '   AND au_numauto = NVL(so_autoapro,so_autooriginal)'
      '   AND so_presupuesto = po_id '
      '   AND so_fechabaja IS NULL'
      '   AND po_prestador = ca_identificador'
      '   AND anula.tb_clave (+) = '#39'MOTAN'#39' '
      '   AND anula.tb_codigo (+) = au_motivoanulacion')
    Left = 40
    Top = 196
  end
  inherited dsConsulta: TDataSource
    Left = 68
    Top = 196
  end
  inherited SortDialog: TSortDialog
    Left = 40
    Top = 224
  end
  inherited ExportDialog: TExportDialog
    Left = 68
    Top = 224
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Ord.'
        TitleAlignment = taCenter
        DataField = 'ORDEN'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'Rec.'
        TitleAlignment = taCenter
        DataField = 'RECAIDA'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'Aut.'
        TitleAlignment = taCenter
        DataField = 'AUTO'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'Prestaci'#243'n'
        DataField = 'PRESTACION'
        MaxLength = 20
      end
      item
        Title = 'Estado'
        DataField = 'ESTADO'
        MaxLength = 15
      end
      item
        Title = 'N'#186' Ped.'
        TitleAlignment = taCenter
        DataField = 'NRO_PEDIDO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Presup.'
        TitleAlignment = taCenter
        DataField = 'PRESU'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Prestador'
        DataField = 'PRESTADOR'
        MaxLength = 25
      end
      item
        Title = 'Material'
        DataField = 'MATERIAL'
        MaxLength = 40
      end
      item
        Title = 'F.Carga'
        TitleAlignment = taCenter
        DataField = 'FCargaAut'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'F.Recep.'
        TitleAlignment = taCenter
        DataField = 'F_RECEPCION'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Cotiz.'
        TitleAlignment = taCenter
        DataField = 'COTIZACION'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Adjud.'
        TitleAlignment = taCenter
        DataField = 'ADJUDICADO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Mot. Anulaci'#243'n'
        DataField = 'MOT_ANUL'
        MaxLength = 15
      end
      item
        Title = 'Observaciones'
        DataField = 'OBSERVACIONES'
        MaxLength = 0
      end>
    Title.Text = 'Consulta Presupuestos'
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 124
    Top = 224
  end
  inherited Seguridad: TSeguridad
    Left = 40
    Top = 168
  end
  inherited FormStorage: TFormStorage
    Left = 68
    Top = 168
  end
  inherited PrintDialog: TPrintDialog
    Left = 96
    Top = 224
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
    Left = 96
    Top = 168
  end
  inherited FieldHider: TFieldHider
    Left = 96
    Top = 196
  end
  object dsEstado: TDataSource
    DataSet = sdqEstado
    Left = 524
    Top = 52
  end
  object sdqEstado: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT tb_codigo, tb_descripcion'
      '   FROM ctb_tablas'
      'WHERE tb_clave = '#39'MUAUT'#39
      '      AND tb_codigo NOT IN ('#39'D'#39','#39'N'#39','#39'X'#39','#39'0'#39')'
      '      AND tb_fechabaja IS NULL'
      ' ORDER BY tb_descripcion')
    Left = 496
    Top = 52
  end
end
