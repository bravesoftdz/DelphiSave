inherited frmConsultaOficios: TfrmConsultaOficios
  Left = 205
  Top = 110
  Width = 727
  Height = 459
  Caption = 'B'#250'squeda de Oficios'
  OldCreateOrder = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 719
    Height = 130
    object pcFiltrosBusqueda: TPageControl
      Left = 0
      Top = 0
      Width = 719
      Height = 130
      ActivePage = tsGeneral
      Align = alClient
      TabOrder = 0
      object tsGeneral: TTabSheet
        Caption = 'General'
        object gbJuicio: TGroupBox
          Left = 0
          Top = 0
          Width = 711
          Height = 102
          Align = alClient
          Caption = 'Oficio'
          TabOrder = 0
          DesignSize = (
            711
            102)
          object lbNroOficio: TLabel
            Left = 16
            Top = 24
            Width = 50
            Height = 13
            Caption = 'Nro Oficio:'
          end
          object lblCaratula: TLabel
            Left = 16
            Top = 46
            Width = 42
            Height = 13
            Caption = 'Car'#225'tula:'
          end
          object lblContra: TLabel
            Left = 328
            Top = 46
            Width = 12
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'C/'
          end
          object edNroOficio: TIntEdit
            Left = 91
            Top = 19
            Width = 81
            Height = 21
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Alignment = taRightJustify
          end
          object edCARATULA: TEdit
            Left = 90
            Top = 68
            Width = 566
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 1
          end
          object chkConJuicios: TCheckBox
            Left = 192
            Top = 23
            Width = 89
            Height = 17
            Caption = 'Con Juicios'
            TabOrder = 2
          end
          object edDemandante: TEdit
            Left = 90
            Top = 44
            Width = 231
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 4
          end
          object edDemandado: TEdit
            Left = 352
            Top = 44
            Width = 304
            Height = 21
            Anchors = [akTop, akRight]
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 5
          end
          object chkSinJuicios: TCheckBox
            Left = 288
            Top = 23
            Width = 97
            Height = 17
            Caption = 'Sin Juicios'
            TabOrder = 3
          end
        end
      end
      object tsJuzgados: TTabSheet
        Caption = 'Juzgados'
        ImageIndex = 2
        object gbJuzgado: TGroupBox
          Left = 0
          Top = 0
          Width = 711
          Height = 89
          Align = alTop
          Caption = 'Juzgado'
          TabOrder = 0
          object lbFuero: TLabel
            Left = 367
            Top = 21
            Width = 30
            Height = 13
            Caption = 'Fuero:'
          end
          object lbJurisdiccion: TLabel
            Left = 9
            Top = 22
            Width = 58
            Height = 13
            Caption = 'Jurisdicci'#243'n:'
          end
          object lbJuzgado: TLabel
            Left = 9
            Top = 56
            Width = 63
            Height = 13
            Caption = 'Juzgado Nro:'
          end
          object lbSecretaria: TLabel
            Left = 365
            Top = 56
            Width = 53
            Height = 13
            Caption = 'Secretar'#237'a:'
          end
          inline fraFuero: TfraCodigoDescripcion
            Left = 430
            Top = 17
            Width = 266
            Height = 23
            TabOrder = 1
            DesignSize = (
              266
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 201
            end
          end
          inline fraJurisdiccion: TfraCodigoDescripcion
            Left = 81
            Top = 17
            Width = 274
            Height = 23
            TabOrder = 0
            DesignSize = (
              274
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 209
            end
          end
          inline fraJuzgado: TfraCodigoDescripcion
            Left = 81
            Top = 51
            Width = 274
            Height = 23
            TabOrder = 2
            DesignSize = (
              274
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 209
            end
          end
          inline fraSecretaria: TfraCodigoDescripcion
            Left = 430
            Top = 51
            Width = 266
            Height = 23
            TabOrder = 3
            DesignSize = (
              266
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 201
            end
          end
        end
      end
      object tsFechas: TTabSheet
        Caption = 'Fechas'
        ImageIndex = 3
        object gbFechas: TGroupBox
          Left = 0
          Top = 0
          Width = 711
          Height = 102
          Align = alClient
          Caption = ' Fechas '
          TabOrder = 0
          object lblFechaInicioHasta: TLabel
            Left = 190
            Top = 17
            Width = 26
            Height = 13
            Caption = 'hasta'
          end
          object lblFechaInicioDesde: TLabel
            Left = 10
            Top = 17
            Width = 87
            Height = 13
            AutoSize = False
            Caption = 'F. Entrada desde:'
          end
          object lblFechaCierreDesde: TLabel
            Left = 10
            Top = 40
            Width = 80
            Height = 13
            AutoSize = False
            Caption = 'F. Salida desde:'
          end
          object LblFechaCierrehasta: TLabel
            Left = 191
            Top = 40
            Width = 26
            Height = 13
            Caption = 'hasta'
          end
          object lblFechaAsignacionDesde: TLabel
            Left = 10
            Top = 63
            Width = 74
            Height = 13
            AutoSize = False
            Caption = 'F. Recepci'#243'n:'
          end
          object lblFechaAsignacionHasta: TLabel
            Left = 191
            Top = 63
            Width = 26
            Height = 13
            Caption = 'hasta'
          end
          object edFechaEntradahta: TDateComboBox
            Left = 221
            Top = 13
            Width = 88
            Height = 21
            MinDateCombo = edFechaEntradadde
            TabOrder = 1
          end
          object edFechaEntradadde: TDateComboBox
            Left = 99
            Top = 13
            Width = 88
            Height = 21
            MaxDateCombo = edFechaEntradahta
            TabOrder = 0
          end
          object edFechaSalidahta: TDateComboBox
            Left = 221
            Top = 36
            Width = 88
            Height = 21
            MinDateCombo = edFechaSalidadde
            TabOrder = 3
          end
          object edFechaSalidadde: TDateComboBox
            Left = 99
            Top = 36
            Width = 88
            Height = 21
            MaxDateCombo = edFechaSalidahta
            TabOrder = 2
          end
          object edFechaRecepciondde: TDateComboBox
            Left = 99
            Top = 60
            Width = 88
            Height = 21
            MaxDateCombo = edFechaRecepcionhta
            TabOrder = 4
          end
          object edFechaRecepcionhta: TDateComboBox
            Left = 221
            Top = 60
            Width = 88
            Height = 21
            MinDateCombo = edFechaRecepciondde
            TabOrder = 5
          end
          object chkSinFechaRecepcion: TCheckBox
            Left = 321
            Top = 62
            Width = 161
            Height = 17
            Caption = 'Sin Fecha Recepci'#243'n'
            TabOrder = 6
          end
          object chkFechadeSalida: TCheckBox
            Left = 321
            Top = 38
            Width = 161
            Height = 17
            Caption = 'Sin Fecha de Salida'
            TabOrder = 7
          end
        end
      end
      object tsOtrosDatos: TTabSheet
        Caption = 'Otros Datos'
        ImageIndex = 1
        object gbLetrados: TGroupBox
          Left = 0
          Top = 0
          Width = 711
          Height = 102
          Align = alClient
          Caption = 'Filtro'
          TabOrder = 0
          DesignSize = (
            711
            102)
          object Label1: TLabel
            Left = 11
            Top = 17
            Width = 56
            Height = 13
            Caption = 'Asignado a:'
          end
          object Label7: TLabel
            Left = 11
            Top = 46
            Width = 59
            Height = 13
            Caption = 'Juicio relac.:'
          end
          object Label2: TLabel
            Left = 11
            Top = 76
            Width = 45
            Height = 13
            Caption = 'Oficiante:'
          end
          inline fraUsuario: TfraUsuario
            Left = 84
            Top = 14
            Width = 604
            Height = 21
            TabOrder = 0
            inherited cmbDescripcion: TArtComboBox
              Width = 520
            end
          end
          inline FraJuicios: TfraCodigoDescripcionExt
            Left = 83
            Top = 41
            Width = 615
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            inherited cmbDescripcion: TArtComboBox
              Left = 55
              Width = 550
              CharCase = ecUpperCase
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Caption = 'Carpeta'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPCION'
                  Title.Caption = 'Demandante'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'JT_DEMANDADO'
                  Title.Caption = 'Demandado'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'JT_CARATULA'
                  Title.Caption = 'Car'#225'tula'
                  Width = 100
                  Visible = True
                end>
              OnDropDown = FraJuicioscmbDescripcionDropDown
            end
            inherited edCodigo: TPatternEdit
              Width = 50
              MaxLength = 8
            end
          end
          object edOficiante: TEdit
            Left = 495
            Top = 72
            Width = 191
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 2
          end
          inline fraEntidad: TfraCodigoDescripcionExt
            Left = 83
            Top = 70
            Width = 403
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            inherited cmbDescripcion: TArtComboBox
              Left = 55
              Width = 344
            end
            inherited edCodigo: TPatternEdit
              Width = 50
              MaxLength = 8
            end
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 130
    Width = 719
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 715
      end>
    inherited ToolBar: TToolBar
      Width = 702
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 159
    Width = 719
    Height = 273
    Columns = <
      item
        Expanded = False
        FieldName = 'OJ_NUMEROOFICIO'
        Title.Caption = 'Nro. Oficio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OJ_DEMANDANTE'
        Title.Caption = 'Demandante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OJ_DEMANDADO'
        Title.Caption = 'Demandado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OJ_CARATULA'
        Title.Caption = 'Car'#225'tula'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OJ_FECHAENTRADA'
        Title.Caption = 'Fecha Entrada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OJ_FECHARECEPCION'
        Title.Caption = 'Fecha Recepci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OJ_FECHASALIDA'
        Title.Caption = 'Fecha Salida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OJ_AGREGADOCUMENTACION'
        Title.Caption = 'Agrega Doc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_USUARIO'
        Title.Caption = 'Usuario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Nombre Usuario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JZ_DESCRIPCION'
        Title.Caption = 'Juzgado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FU_DESCRIPCION'
        Title.Caption = 'Fuero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JU_DESCRIPCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Secretar'#237'a'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OJ_IDFUERO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OJ_IDJUZGADO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OJ_IDSECRETARIA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OJ_IDJURISDICCION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OJ_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OJ_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OJ_USUMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OJ_FECHAMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OJ_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OJ_FECHALALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OJ_REQUERIMIENTO'
        Title.Caption = 'Requerimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OJ_RESPUESTA'
        Title.Caption = 'Respuesta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OJ_RESPUESTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OJ_RESPUESTA'
        Visible = False
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT lju_jurisdiccion.ju_descripcion, lfu_fuero.fu_descripcion' +
        ','
      
        '       ljz_juzgado.jz_descripcion, lsc_secretaria.sc_descripcion' +
        ','
      
        '       loj_oficiojudicial.oj_numerooficio, loj_oficiojudicial.oj' +
        '_caratula,'
      
        '       loj_oficiojudicial.oj_demandante, loj_oficiojudicial.oj_d' +
        'emandado,'
      
        '       loj_oficiojudicial.oj_idfuero, loj_oficiojudicial.oj_idju' +
        'zgado,'
      '       loj_oficiojudicial.oj_idsecretaria,'
      
        '       loj_oficiojudicial.oj_idjurisdiccion, loj_oficiojudicial.' +
        'oj_id,'
      
        '       loj_oficiojudicial.oj_usubaja, loj_oficiojudicial.oj_usum' +
        'odif,'
      
        '       loj_oficiojudicial.oj_fechamodif, loj_oficiojudicial.oj_u' +
        'sualta,'
      
        '       loj_oficiojudicial.oj_fechalalta, loj_oficiojudicial.oj_r' +
        'equerimiento,'
      
        '       loj_oficiojudicial.oj_respuesta, loj_oficiojudicial.oj_fe' +
        'chasalida,'
      
        '       loj_oficiojudicial.oj_respuesta, loj_oficiojudicial.oj_fe' +
        'chaentrada,'
      '       loj_oficiojudicial.oj_fechasalida,OJ_DATOSCARTA,'
      '       loj_oficiojudicial.oj_fecharecepcion,'
      '       loj_oficiojudicial.oj_agregadocumentacion,'
      '       art.USE_USUARIOS.SE_USUARIO, '
      '       art.USE_USUARIOS.se_nombre'
      '  FROM legales.loj_oficiojudicial,'
      '       legales.lju_jurisdiccion,'
      '       legales.lfu_fuero,'
      '       legales.ljz_juzgado,'
      '       legales.lsc_secretaria,'
      '       art.USE_USUARIOS'
      
        ' WHERE (    (loj_oficiojudicial.oj_idjurisdiccion = lju_jurisdic' +
        'cion.ju_id(+))'
      '        AND (loj_oficiojudicial.oj_idfuero = lfu_fuero.fu_id(+))'
      
        '        AND (loj_oficiojudicial.oj_idjuzgado = ljz_juzgado.jz_id' +
        '(+))'
      
        '        AND (loj_oficiojudicial.oj_idsecretaria = lsc_secretaria' +
        '.sc_id(+))'
      
        '        AND (loj_oficiojudicial.oj_usuarioasignado = art.USE_USU' +
        'ARIOS.SE_USUARIO(+))'
      '       )'
      '   AND (loj_oficiojudicial.oj_idjuicioentramite IS NULL)'
      '')
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
  end
  object sdqModificacionRegistro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM legales.loj_oficiojudicial'
      'WHERE oj_id = :oj_id ')
    Left = 252
    Top = 236
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'oj_id'
        ParamType = ptInput
      end>
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
    Left = 157
    Top = 320
  end
end
