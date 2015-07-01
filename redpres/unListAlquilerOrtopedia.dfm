inherited frmListAlquilerOrtopedia: TfrmListAlquilerOrtopedia
  Left = 294
  Top = 166
  Width = 634
  Height = 429
  Caption = 'Materiales de ortopedia en alquiler'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 600
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 626
    Height = 140
    object GroupBox3: TGroupBox
      Left = 2
      Top = 3
      Width = 224
      Height = 43
      Caption = '  Fecha de vencimiento alquiler '
      TabOrder = 0
      object Label4: TLabel
        Left = 103
        Top = 20
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
      object dcHastaVencim: TDateComboBox
        Left = 122
        Top = 16
        Width = 96
        Height = 21
        MinDateCombo = dcDesdeVencim
        TabOrder = 1
      end
      object dcDesdeVencim: TDateComboBox
        Left = 6
        Top = 16
        Width = 93
        Height = 21
        MaxDateCombo = dcHastaVencim
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 229
      Top = 3
      Width = 132
      Height = 43
      Caption = ' Siniestro '
      TabOrder = 1
      object edSiniestro: TSinEdit
        Left = 5
        Top = 15
        Width = 120
        Height = 21
        TabOrder = 0
      end
    end
    object gbDelegacion: TGroupBox
      Left = 363
      Top = 3
      Width = 261
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' De&legaci'#243'n '
      TabOrder = 2
      DesignSize = (
        261
        43)
      object cmbDelegacion: TDBCheckCombo
        Left = 5
        Top = 16
        Width = 251
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsDelegacion
        KeyField = 'lg_codigo'
        ListField = 'lg_nombre'
      end
    end
    object grpPrestador: TGroupBox
      Left = 4
      Top = 93
      Width = 618
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestador'
      TabOrder = 3
      DesignSize = (
        618
        43)
      inline fraPrestador: TfraPrestador
        Left = 3
        Top = 13
        Width = 611
        Height = 23
        VertScrollBar.Range = 49
        VertScrollBar.Visible = False
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCPostal: TLabel
          Left = 539
        end
        inherited lbTelefono: TLabel
          Left = 451
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 164
          DataSource = nil
        end
        inherited cmbPrestador: TArtComboBox
          Width = 281
          DataSource = nil
        end
        inherited edPresLocalidad: TEdit
          Width = 185
        end
        inherited edPresCPostal: TEdit
          Left = 556
        end
        inherited edPresTelefono: TEdit
          Left = 471
        end
      end
    end
    object gbEstado: TGroupBox
      Left = 362
      Top = 48
      Width = 261
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Estado '
      TabOrder = 4
      DesignSize = (
        261
        43)
      object cmbEstado: TComboBox
        Left = 7
        Top = 15
        Width = 247
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Todos'
          'Pendientes'
          'Definidos'
          'Renovados'
          'No renovados')
      end
    end
    object gbGrupoTrabajo: TGroupBox
      Left = 3
      Top = 49
      Width = 183
      Height = 41
      Caption = ' Grupo de Trabajo '
      TabOrder = 5
      DesignSize = (
        183
        41)
      object cmbGtrabajo: TDBCheckCombo
        Left = 7
        Top = 14
        Width = 171
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnCloseUp = cmbGtrabajoCloseUp
        DataSource = dsGtrabajo
        KeyField = 'GP_CODIGO'
        ListField = 'GP_NOMBRE'
      end
    end
    object gbGestor: TGroupBox
      Left = 189
      Top = 49
      Width = 171
      Height = 41
      Caption = ' Usuario gestor '
      TabOrder = 6
      object cmbGestor: TArtComboBox
        Left = 8
        Top = 14
        Width = 156
        Height = 21
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 0
        Columns = <
          item
            Expanded = False
            FieldName = 'UG_USUARIO'
            Title.Caption = 'Usuario'
            Visible = True
          end>
        DataSource = dsGestor
        FieldList = 'UG_USUARIO'
        FieldKey = 'UG_ID'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 140
    Width = 626
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 622
      end>
    inherited ToolBar: TToolBar
      Width = 609
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbNuevo: TToolButton
        Hint = 'Renovar (Ctrl+R)'
        ImageIndex = 44
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Hint = 'No renovar (Ctrl+N)'
        ImageIndex = 45
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 169
    Width = 626
    Height = 233
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AUTORIZACION'
        Title.Alignment = taCenter
        Title.Caption = 'Nro.aut.'
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OA_RENUEVA'
        Title.Alignment = taCenter
        Title.Caption = 'Renueva'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATSOLICITADO'
        Title.Caption = 'Material solicitado'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATCOTIZADO'
        Title.Caption = 'Material cotizado'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VALADJUDICADO'
        Title.Alignment = taCenter
        Title.Caption = 'Valor adj.'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OA_FECHAVENCIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'F.vencimiento'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELTRABAJADOR'
        Title.Caption = 'Tel. trabajador'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMTRABAJADOR'
        Title.Caption = 'Domicilio trabajador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELPRESTADOR'
        Title.Caption = 'Tel. prestador'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMPRESTADOR'
        Title.Caption = 'Dom. prestador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'delegacion'
        Title.Caption = 'Delegaci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gtrabajo'
        Title.Caption = 'G. Trabajo'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 104
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT sp_siniestro, sp_orden, sp_recaida, utiles.armar_siniestr' +
        'o(sp_siniestro, sp_orden, sp_recaida) siniestro,'
      
        '       oa_id, oa_fechavencimiento, oa_renueva, ca_nombrefanta pr' +
        'estador, ca_telefono telprestador,'
      
        '       utiles.armar_domicilio(ca_calle, ca_numero, ca_piso, ca_d' +
        'epartamento, ca_localidad) domprestador, tj_nombre trabajador,'
      '       art.trabajador.get_telefono(tj_id, 4) teltrabajador,'
      
        '       utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_d' +
        'epartamento, tj_localidad) domtrabajador,'
      
        '       pa_materialcoti matcotizado, pa_materialsoli matsolicitad' +
        'o, nvl(sp_autoapro, sp_autooriginal) autorizacion,'
      
        '       sp_valor_adju valadjudicado, siniestro.get_usuariogestor(' +
        'ex_id) USUGESTOR'
      '  FROM amed.moa_ortopedia_alquiler, cpr_prestador, '
      '       ctj_trabajador, sex_expedientes, msp_siniestropresup,'
      #9#9#9' mpa_presupuestoautorizacion'
      ' WHERE oa_fechabaja IS NULL'
      '   AND pa_prestador = ca_identificador'
      
        '   AND siniestro.get_idexpediente(sp_siniestro, sp_orden, sp_rec' +
        'aida) = ex_id'
      '   AND tj_cuil = ex_cuil '
      '   AND oa_idpresupuesto = sp_nropedido'
      '   AND pa_id = sp_presupuesto'
      '')
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'N'#186' Aut.'
        TitleAlignment = taCenter
        DataField = 'AUTORIZACION'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Valor adj.'
        TitleAlignment = taCenter
        DataField = 'VALADJUDICADO'
        Alignment = taCenter
        MaxLength = 13
      end
      item
        Title = 'Renueva'
        TitleAlignment = taCenter
        DataField = 'OA_RENUEVA'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Prestador'
        DataField = 'PRESTADOR'
        MaxLength = 40
      end
      item
        Title = 'Tel. prestador'
        DataField = 'TELPRESTADOR'
        MaxLength = 25
      end
      item
        Title = 'F.Vencim.'
        TitleAlignment = taCenter
        DataField = 'OA_FECHAVENCIMIENTO'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Material solicitado'
        DataField = 'MATSOLICITADO'
        MaxLength = 50
      end
      item
        Title = 'Material cotizado'
        DataField = 'MATCOTIZADO'
        MaxLength = 0
      end>
    DataSource = nil
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16466
        LinkControl = tbNuevo
      end
      item
        Key = 16462
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
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 512
    Top = 13
  end
  object sdqDelegacion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'select lg_codigo, lg_nombre '
      '  from art.dlg_delegaciones'
      ' order by lg_nombre')
    Left = 484
    Top = 13
  end
  object sdqGtrabajo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   gp_codigo, gp_nombre, gp_fax, gp_email'
      '    FROM art.mgp_gtrabajo'
      '   WHERE gp_fbaja IS NULL'
      'ORDER BY gp_nombre')
    Left = 106
    Top = 55
  end
  object dsGtrabajo: TDataSource
    DataSet = sdqGtrabajo
    Left = 134
    Top = 55
  end
  object sdqGestor: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   ug_id, ug_usuario'
      '    FROM mug_usuariogrupotrabajo'
      '   WHERE ug_fechabaja IS NULL'
      '     AND ug_tipousuario IN ('#39'01'#39', '#39'04'#39')'
      '')
    Left = 274
    Top = 55
  end
  object dsGestor: TDataSource
    DataSet = sdqGestor
    Left = 302
    Top = 55
  end
end
